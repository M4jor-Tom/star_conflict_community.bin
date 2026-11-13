-- --------------------------------------------------------------------
-- UI.EvolvingShipCraftWnd
-- --------------------------------------------------------------------

UI.EvolvingShipCraftWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.EvolvingShipCraftWnd.layers =
{
	MAIN_EFFECT						= 0,
	BG_EFFECT						= 1, 
	WORK_EFFECT						= 2, 
    CAPTION							= 3, 
    DESC							= 4, 
    CABIN_PROGRESS_EFFECT			= 5, 
    CABIN_PROGRESS_VAL				= 6, 
    CABIN_NAME						= 7, 
	CABIN_CRAFTED_TEXT				= 8, 
    CABIN_PRICE						= 9, 
    CRYSTALS_PROGRESS_EFFECT		= 10,
    CRYSTALS_PROGRESS_VAL			= 11,
    CRYSTALS_NAME					= 12,
	CRYSTALS_CRAFTED_TEXT			= 13,
	CABIN_CRAFT_ANIMATION_EFFECT	= 14,
	SHIP_CRAFT_ANIMATION_EFFECT		= 15,
    WAIT_EFFECT						= 16, 
    WAIT_TEXT						= 17, 
}

--
UI.EvolvingShipCraftWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "EvolvingShipCraftWnd",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.EvolvingShipCraftWnd.layers.CABIN_CRAFT_ANIMATION_EFFECT,

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
						layer		= "UI.EvolvingShipCraftWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						layer		= "UI.EvolvingShipCraftWnd.layers.WORK_EFFECT",
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
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "alienShipCraft_desc" ),
		},

        -- CABIN_PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "alienShipCraftWnd_cabinProgress",
				defaultAnimation	= "idle",
			}}
		},

        -- CABIN_PROGRESS_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- CABIN_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- CABIN_CRAFTED_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "alienShipCraft_resourceCrafted" ),
		},

        -- CABIN_PRICE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- CRYSTALS_PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

        -- CRYSTALS_PROGRESS_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- CRYSTALS_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- CRYSTALS_CRAFTED_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "alienShipCraft_resourceCrafted" ),
		},

		-- CABIN_CRAFT_ANIMATION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "alienShipCraftWnd_cabinCraftAnimation",
				defaultAnimation	= "idle",
			}}
		},

		-- SHIP_CRAFT_ANIMATION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "alienShipCraftWnd_shipCraftAnimation",
				defaultAnimation	= "idle",
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
						layer		= "UI.EvolvingShipCraftWnd.layers.WAIT_TEXT",
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
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.EvolvingShipCraftWnd:Setup( shipDefName )

	self:Reset()

	if type( shipDefName ) ~= "string" then
		sys.log( "UI.EvolvingShipCraftWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"shipDefName\"); \"string\" expected, got \"%s\"", type( shipDefName ) )
		return
	end

	if shipDefName == "" then
		sys.log( "UI.EvolvingShipCraftWnd:Setup()[ERROR]: empty shipDefName" )
		return
	end

	if not UI:IsDefShip( shipDefName ) then
		sys.log( "UI.EvolvingShipCraftWnd:Setup()[ERROR]: %s is not ship", shipDefName )
		return
	end

	if not UI:IsShipEvolving( shipDefName ) then
		sys.log( "UI.EvolvingShipCraftWnd:Setup()[ERROR]: ship %s is not evolving", shipDefName )
		return
	end

	local shipItem = UI:GetEvolvingShipItem( shipDefName )
	if shipItem then
		sys.log( "UI.EvolvingShipCraftWnd:Setup()[ERROR]: ship %s is already created", shipDefName )
		return
	end

	self.shipDefName = shipDefName

	if self:IsOnScreen() then
		self:FullUpdate()
	end	

end


-- нет самостоятельной подписки, вызывается из UI.HangarWnd
function UI.EvolvingShipCraftWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

    self.requestId_itemCraft					= 0
	self.bWaitingInventory						= false
	self.blueprintToCraftData					= nil
    self.requestId_buyInventory					= 0
	self.requestId_learnBlueprint				= 0
    self.requestId_buy							= 0
    self.bWaitingLearnedBlueprints				= false
	self.requestId_shipCraft					= 0
	self.bWaitingOwnVessels						= false
	self.craftingShipDefName					= ""
	self.shipDefNameToCraft						= nil
	self.battleSlotToInstall					= -1
	self.bWaitingChangeBattleSlotVessel			= false
	self.craftingCabinDefName					= ""

	if self:IsOnScreen() then
	    self:UpdateWaitEffect()
	end

end


--
function UI.EvolvingShipCraftWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.itemCraftConfirmWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	self.buyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	self.tradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self.shipDefName == "" then
		return
	end

	self:UpdateCabinPrice()
	self:UpdateCabinActionBtn()

end


--
function UI.EvolvingShipCraftWnd:OnCraftWndResult( result, data )

	if result then
		self:DoCraftItem( data.blueprintDefName, data.bEnchanted, data.count )
	end

end



--
function UI.EvolvingShipCraftWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	-- апдейт происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_itemCraft then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then

    		UI:ShowMsgOnItemCraftError( result )
			self.bWaitingInventory = false

    	end

		self.requestId_itemCraft = 0		
		self:UpdateWaitEffect()

	end

end


--
function UI.EvolvingShipCraftWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if self.bWaitingInventory then

		self.bWaitingInventory = false
	    self:UpdateWaitEffect()

	end

end


--
function UI.EvolvingShipCraftWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

    if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

    		if requestId == self.requestId_buyInventory then

        		if self.blueprintToCraftData then
					self:LaunchItemCraftConfirmWnd( self.blueprintToCraftData.defName, self.blueprintToCraftData.bEnchanted, self.blueprintToCraftData.count )

				elseif self.shipDefNameToCraft then
					self:DoCraftShip( self.shipDefNameToCraft )
        		end

			end

		end

	else

		if requestId == self.requestId_buyInventory then
    		UI:ShowMsgOnBuyError( result )
		end

	end

	if requestId == self.requestId_buyInventory then

		self.blueprintToCraftData	= nil
		self.shipDefNameToCraft		= nil

		self.requestId_buyInventory = 0
	    self:UpdateWaitEffect()

	end

end


--
function UI.EvolvingShipCraftWnd:OnBuyWndResult( result, mode, data )

	if result == true then

		if mode == UI.BuyWnd.modes.INVENTORY_USER or mode == UI.BuyWnd.modes.INVENTORY_AUTO then
			self:BuyInventory()

		else
			sys.log( "UI.EvolvingShipCraftWnd:OnBuyWndResult()[ERROR]: unhandled mode - %s", tostring( mode ) )
			self.blueprintToCraftData	= nil
			self.shipDefNameToCraft		= nil
		end

	else
		self.blueprintToCraftData	= nil
		self.shipDefNameToCraft		= nil
	end

end  


--
function UI.EvolvingShipCraftWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.buyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	self.tradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self.shipDefName == "" then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.EvolvingShipCraftWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.buyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	self.tradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self.shipDefName == "" then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.EvolvingShipCraftWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.buyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	self.tradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self.shipDefName == "" then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.EvolvingShipCraftWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	-- апдейт происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_learnBlueprint then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
    		UI:ShowMsgOnLearnBlueprintError( result )
    	end

		self.requestId_learnBlueprint = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.EvolvingShipCraftWnd:OnTradeResult_Buy( shopItem, count, priceType )

	self.requestId_buy = _G.GameStore_Buy( shopItem.id, count, priceType )
	if self.requestId_buy ~= 0 then

		UI:AddWaitingRequest( self.requestId_buy )
		self.bWaitingLearnedBlueprints = true

		UI:PlayGlobalSound( self.sounds.learnBlueprint )

	else
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

    self:UpdateWaitEffect()

end


--
function UI.EvolvingShipCraftWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	-- апдейт происходит в F_OnEventInvItemsChanged()

	if requestId ~= 0 and requestId == self.requestId_buy then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
    		UI:ShowMsgOnBuyError( result )
    	end

		self.requestId_buy = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.EvolvingShipCraftWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

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

	self:FullUpdate()

end


--
function UI.EvolvingShipCraftWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )

	-- апдейт происходит в F_OnEventInvItemsChanged(), закрытие окна в GameStore_OnOwnedVessels	()

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then

		if requestId == self.requestId_shipCraft then

			UI:ShowMsgOnShipCraftError( result )

			self.bWaitingOwnVessels		= false
			self.craftingShipDefName	= ""
	    	self.battleSlotToInstall	= -1

		end

	end

	if requestId == self.requestId_shipCraft then
		self.requestId_shipCraft = 0
		self:UpdateWaitEffect()
	end
	
end


--
function UI.EvolvingShipCraftWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	-- апдейт происходит в F_OnEventInvItemsChanged()
	
	if self.bWaitingOwnVessels then

		self.bWaitingOwnVessels = false
		self:UpdateWaitEffect()

    	if result == 0 then

        	if self.battleSlotToInstall ~= -1 then
        	
    			local shipItem = UI:GetEvolvingShipItem( self.craftingShipDefName )
    			if shipItem then

    				if UI.ShipsTreeWnd:ChangeShipInBattleSlot( self.battleSlotToInstall, shipItem.vid, false ) then
    					self.bWaitingChangeBattleSlotVessel = true
    					self:UpdateWaitEffect()
    				end

    			else
    				sys.log( "UI.EvolvingShipCraftWnd:GameStore_OnOwnedVessels()[ERROR]: cannot find ship item for \"%s\" that was supposedly just crafted", self.craftingShipDefName )
    			end

			else

				if self.craftingShipDefName == self.shipDefName then
				
    				if self:IsOnScreen() then
						self:StartShipCraftAnimation()
					else
						self:CheckShowRoleWnd( self.craftingShipDefName )
    				end
					
				end

				self.craftingShipDefName = ""

        	end

		else
			self.craftingShipDefName = ""
		end

        self.battleSlotToInstall = -1

	end

end


--
function UI.EvolvingShipCraftWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	if self.bWaitingChangeBattleSlotVessel then

		self.bWaitingChangeBattleSlotVessel = false
		self:UpdateWaitEffect()

		if result == _G.GameStore.ChangeBSResult.CBSR_OK then

			if self.craftingShipDefName == self.shipDefName then
			
    			if self:IsOnScreen() then
					self:StartShipCraftAnimation()
				else
					self:CheckShowRoleWnd( self.craftingShipDefName )
    			end
				
			end

		end

		self.craftingShipDefName = ""

	end

end


--
function UI.EvolvingShipCraftWnd:OnIngredientsListEndAnimating()

	self.cabinIngredientsList:Clear()
	self.cabinIngredientsList:UnlinkFromParent()
	self.cabinIngredientsList:AnimateIdle()

	self:CheckStopCabinCraftAnimation()

end


-- -------------------------------
-- const
-- -------------------------------

UI.EvolvingShipCraftWnd.sounds =
{
	tradeWndShow				= "sound/ui/btnClick",
	learnBlueprint				= "sound/ui/apply",
	craft						= "sound/ui/apply",
	buyInventory				= "sound/ui/apply",
	hide						= "sound/ui/MsgHide",
}

UI.EvolvingShipCraftWnd.effectInfo =
{
	work =
	{
		shipIcoLocator				= "ship_ico",
		cabinIcoLocator				= "cabin_ico",
		cabinActionBtnLocator		= "btn_1",
		cabinIngredientsListLocator	= "items",
		crystalsIcoLocator			= "crystal_ico",
		starterPackBundleBtnLocator	= "btn_2",
		shipCraftBtnLocator			= "btn_create",
		crossBtnLocator				= "btn_x",
	}
}

UI.EvolvingShipCraftWnd.cabinIngredientsListTableName	= ""
UI.EvolvingShipCraftWnd.shipCraftBtnTableName			= ""
UI.EvolvingShipCraftWnd.resourceIcoPrototypeName		= ""

-- -------------------------------
-- vars
-- -------------------------------

UI.EvolvingShipCraftWnd.shipDefName							= ""

UI.EvolvingShipCraftWnd.bShipCrafted						= false
UI.EvolvingShipCraftWnd.bCabinCraftAnimating				= false
UI.EvolvingShipCraftWnd.bShipCraftAnimating					= false

UI.EvolvingShipCraftWnd.cabinNameMetaText					= nil
UI.EvolvingShipCraftWnd.cabinPriceMetaText					= nil
UI.EvolvingShipCraftWnd.crystalsNameMetaText				= nil
UI.EvolvingShipCraftWnd.shipIcoWnd							= nil
UI.EvolvingShipCraftWnd.cabinIcoWnd							= nil
UI.EvolvingShipCraftWnd.cabinActionBtn						= nil
UI.EvolvingShipCraftWnd.cabinIngredientsList				= nil
UI.EvolvingShipCraftWnd.crystalsIcoWnd						= nil
UI.EvolvingShipCraftWnd.starterPackBundleBtn				= nil
UI.EvolvingShipCraftWnd.starterPackDlcBtn					= nil
UI.EvolvingShipCraftWnd.shipCraftBtn						= nil
UI.EvolvingShipCraftWnd.crossBtn							= nil
UI.EvolvingShipCraftWnd.itemCraftConfirmWnd					= nil
UI.EvolvingShipCraftWnd.buyWnd								= nil
UI.EvolvingShipCraftWnd.tradeWnd							= nil

UI.EvolvingShipCraftWnd.requestId_itemCraft					= 0
UI.EvolvingShipCraftWnd.bWaitingInventory					= false
UI.EvolvingShipCraftWnd.blueprintToCraftData				= nil
UI.EvolvingShipCraftWnd.requestId_buyInventory				= 0
UI.EvolvingShipCraftWnd.requestId_learnBlueprint			= 0
UI.EvolvingShipCraftWnd.requestId_buy						= 0
UI.EvolvingShipCraftWnd.bWaitingLearnedBlueprints			= false
UI.EvolvingShipCraftWnd.requestId_shipCraft					= 0
UI.EvolvingShipCraftWnd.bWaitingOwnVessels					= false
UI.EvolvingShipCraftWnd.craftingShipDefName					= ""
UI.EvolvingShipCraftWnd.hMsgCraftShip						= UI.INVALID_UI_HANDLE
UI.EvolvingShipCraftWnd.shipDefNameToCraft					= nil
UI.EvolvingShipCraftWnd.battleSlotToInstall					= -1
UI.EvolvingShipCraftWnd.bWaitingChangeBattleSlotVessel		= false
UI.EvolvingShipCraftWnd.craftingCabinDefName				= ""

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.EvolvingShipCraftWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.cabinNameMetaText = UI.MetaText.GetNewInstance()
	self.cabinNameMetaText:InitFromLayer( self, self.layers.CABIN_NAME ) 

	self.cabinPriceMetaText = UI.MetaText.GetNewInstance()
	self.cabinPriceMetaText:InitFromLayer( self, self.layers.CABIN_PRICE ) 

	self.crystalsNameMetaText = UI.MetaText.GetNewInstance()
	self.crystalsNameMetaText:InitFromLayer( self, self.layers.CRYSTALS_NAME ) 

	self:CreateControls()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.EvolvingShipCraftWnd:F_Shutdown()

	if self.cabinNameMetaText then
		self.cabinNameMetaText:Clear()
	end

	if self.cabinPriceMetaText then
		self.cabinPriceMetaText:Clear()
	end

	if self.crystalsNameMetaText then
		self.crystalsNameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.EvolvingShipCraftWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()
	self:UpdateWaitEffect()

end


--
function UI.EvolvingShipCraftWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.EvolvingShipCraftWnd:UpdateMetaTextPos()

	self.cabinNameMetaText:UpdateScreenOrgFromLayer( self, self.layers.CABIN_NAME )
	self.cabinPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.CABIN_PRICE )
	self.crystalsNameMetaText:UpdateScreenOrgFromLayer( self, self.layers.CRYSTALS_NAME )

end


--
function UI.EvolvingShipCraftWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.CABIN_NAME then
		self.cabinNameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.CABIN_PRICE then
		self.cabinPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.CRYSTALS_NAME then
		self.crystalsNameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.EvolvingShipCraftWnd:CreateControls()

    self.shipIcoWnd				= UI:CreateChildWnd( self, UI.EvolvingShipCraft_ShipIcoWnd, "" )
    self.cabinIcoWnd			= UI:CreateChildWnd( self, UI[ self.resourceIcoPrototypeName ], "cabin" )
    self.cabinActionBtn			= UI:CreateChildWnd( self, UI.EvolvingShipCraft_CabinActionBtn, "" )
    self.cabinIngredientsList	= UI:CreateWndFromTable( self.cabinIngredientsListTableName )
    self.crystalsIcoWnd			= UI:CreateChildWnd( self, UI[ self.resourceIcoPrototypeName ], "crystal" )
    self.starterPackBundleBtn	= UI:CreateChildWnd( self, UI.EvolvingShipCraft_StarterPackBundleBtn, "" )
	self.starterPackDlcBtn		= UI:CreateChildWnd( self, UI.EvolvingShipCraft_StarterPackDlcBtn, "" )
    self.shipCraftBtn			= UI:CreateWndFromTable( self.shipCraftBtnTableName )
    self.crossBtn				= UI:CreateChildWnd( self, UI.CrossBtn2, "" )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	UI:AddChildAndLink( self, self.shipIcoWnd, workEffect, self.effectInfo.work.shipIcoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.cabinIngredientsList, workEffect, self.effectInfo.work.cabinIngredientsListLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )
	UI:AddChildAndLink( self, self.cabinIcoWnd, workEffect, self.effectInfo.work.cabinIcoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.cabinActionBtn, workEffect, self.effectInfo.work.cabinActionBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.crystalsIcoWnd, workEffect, self.effectInfo.work.crystalsIcoLocator , UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.starterPackBundleBtn, workEffect, self.effectInfo.work.starterPackBundleBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.starterPackDlcBtn, workEffect, self.effectInfo.work.starterPackBundleBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.shipCraftBtn, workEffect, self.effectInfo.work.shipCraftBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.crossBtn, workEffect, self.effectInfo.work.crossBtnLocator, UI.EffectAnimParams.POS )

    self.itemCraftConfirmWnd = UI:CreateChildWnd( self, UI.ItemCraft_CraftConfirmWnd, "" )
    self.itemCraftConfirmWnd.mainWndName = self:GetName()

    self.buyWnd = UI:CreateChildWnd( self, UI.BuyWnd, "" )
    self.buyWnd.mainWndName = self:GetName()

    self.tradeWnd = UI:CreateChildWnd( self, UI.TradeWnd, "" )
    self.tradeWnd.mainWndName = self:GetName()

end


--
function UI.EvolvingShipCraftWnd:Reset()

	self.shipDefName			= ""
	self.bShipCrafted			= false
	self.bCabinCraftAnimating	= false
	self.bShipCraftAnimating	= false

	self:ResetContent()
	self:HideChildModals()

end


--
function UI.EvolvingShipCraftWnd:ResetContent()

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.CABIN_PROGRESS_VAL )
	self:SetText( "", self.layers.CRYSTALS_PROGRESS_VAL )

	self.cabinNameMetaText:SetText( "", true )
	self.crystalsNameMetaText:SetText( "", true )

	self:SetLayerVisible( false, self.layers.CABIN_PRICE )
	self.cabinPriceMetaText:SetText( "", true )

	local cabinProgressEffect = UI:GetEffectFromLayer( self, self.layers.CABIN_PROGRESS_EFFECT )
	if cabinProgressEffect then
		cabinProgressEffect:SetAnimationTimeAndUpdate( 0 )
	end

	local crystalsProgressEffect = UI:GetEffectFromLayer( self, self.layers.CRYSTALS_PROGRESS_EFFECT )
	if crystalsProgressEffect then
		crystalsProgressEffect:SetAnimationTimeAndUpdate( 0 )
	end

	self:SetLayerVisible( false, self.layers.CABIN_CRAFTED_TEXT )
	self:SetLayerVisible( false, self.layers.CRYSTALS_CRAFTED_TEXT )

    self.shipIcoWnd:Reset()
    self.cabinIcoWnd:Reset()
	self.cabinActionBtn:UnlinkFromParent()
    self.crystalsIcoWnd:Reset()
    self.starterPackBundleBtn:UnlinkFromParent()
	self.starterPackDlcBtn:UnlinkFromParent()
    self.shipCraftBtn:Enable( false )

    self.cabinIngredientsList:Clear()
	self.cabinIngredientsList:UnlinkFromParent()
	self.cabinIngredientsList:AnimateIdle()

	self:SetLayerVisible( false, self.layers.CABIN_CRAFT_ANIMATION_EFFECT )
	local cabinCraftAnimationEffect = UI:GetEffectFromLayer( self, self.layers.CABIN_CRAFT_ANIMATION_EFFECT )
	if cabinCraftAnimationEffect then
		cabinCraftAnimationEffect:StopAnimation()
	end

	self:SetLayerVisible( false, self.layers.SHIP_CRAFT_ANIMATION_EFFECT )
	local shipCraftAnimationEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_CRAFT_ANIMATION_EFFECT )
	if shipCraftAnimationEffect then
		shipCraftAnimationEffect:StopAnimation()
	end

end


--
function UI.EvolvingShipCraftWnd:FullUpdate()

	self:ResetContent()

	if self.shipDefName == "" then
		return
	end

	-- после крафта перед закрытием окно еще может некоторое время показываться - 
	-- показывается заключительная анимации или идет ожидание установки в боевой слот
	self.bShipCrafted = UI:GetEvolvingShipItem( self.shipDefName ) ~= nil

	self:UpdateCaption()
	self:UpdateShipIco()
	self:UpdateShipCraftBtn()
	self:UpdateCabinIco()
	self:UpdateCabinName()
	self:UpdateCabinProgress()
	self:UpdateCabinActionBtn()
	self:UpdateCabinPrice()
	self:UpdateCabinCraftedText()
	self:UpdateCabinIngredients()
	self:UpdateCrystalsIco()
	self:UpdateCrystalsName()
	self:UpdateCrystalsProgress()
	self:UpdateStarterPackBundleBtn()
	self:UpdateStarterPackDlcBtn()
	self:UpdateCrystalsCraftedText()
	self:UpdateWaitEffect()

	if self.bCabinCraftAnimating then
		self:StartCabinCraftAnimation()		
	end

	if self.bShipCraftAnimating then
		self:StartShipCraftAnimation()		
	end

end


--
function UI.EvolvingShipCraftWnd:UpdateCaption()

	local shipLocalizedName = UI:GetEntityLocalizedNameByDef( self.shipDefName, true )
	shipLocalizedName = string.format( "%s%s", shipLocalizedName, UI:Color2Str( self:GetColor( self.layers.CAPTION ) ) )

	local str = UI:GetStringByName( "alienShipCraft_caption" )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$ship%$", shipLocalizedName )

	if numSubst == 0 then
		sys.log( "UI.EvolvingShipCraftWnd:UpdateCaption()[ERROR]: cannot find placeholder \"$ship$\" in string \"alienShipCraft_caption\"" )
		str = string.format( "[INVALID STRING] Crafting of ship %s", shipLocalizedName )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.EvolvingShipCraftWnd:UpdateShipIco()

	self.shipIcoWnd:Setup( self.shipDefName )

end


--
function UI.EvolvingShipCraftWnd:UpdateShipCraftBtn()

	local bEnabled = false

	if not self.bShipCrafted then

    	local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )
    	local crystalsDefName, needCrystals = UI:GetEvolvingShipResourcePrice( self.shipDefName )

		if UI:GetPlayerResourceCount( cabinDefName ) > 0 and UI:GetPlayerResourceCount( crystalsDefName ) >= needCrystals then
			bEnabled = true
		end

	end

	self.shipCraftBtn:Enable( bEnabled )

end


--
function UI.EvolvingShipCraftWnd:UpdateCabinIco()

    local cabinDefName	= UI:GetEvolvingShipCabin( self.shipDefName )
	local bEnabled		= true
	local bLearned		= true

	if not self.bShipCrafted then

    	bLearned	= false
		bEnabled	= false

    	local blueprintDefName = UI:GetBlueprintForItemCraft( cabinDefName )
    	if blueprintDefName ~= "" then
    		bLearned = UI:IsBluePrintLearned( blueprintDefName )
    	else
    		sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinIco()[ERROR]: cannot find blueptint to craft cabin \"%s\"", cabinDefName )
    	end

    	bEnabled = bLearned and UI:GetPlayerResourceCount( cabinDefName ) > 0

	end

	self.cabinIcoWnd:Setup( cabinDefName, not bEnabled, not bLearned )

end


--
function UI.EvolvingShipCraftWnd:UpdateCabinName()

	local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )
	local str = string.format( "$link [type RESOURCE][params {defName=\"%s\"}]$", cabinDefName )

	self.cabinNameMetaText:SetText( str, true )

end


--
function UI.EvolvingShipCraftWnd:UpdateCabinProgress()

	local progress = 0

	if self.bShipCrafted then

		progress = 1

	else

    	local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )

    	if UI:GetPlayerResourceCount( cabinDefName ) > 0 then

    		progress = 1

    	else

    		local blueprintDefName = UI:GetBlueprintForItemCraft( cabinDefName )
    		if blueprintDefName ~= "" then

    			if UI:IsBluePrintLearned( blueprintDefName ) then

        			local totalNeedCount	= 0
        			local totalIsCount		= 0

        			local ingredients = UI:GetResourceCraftIngredients( blueprintDefName )
        			for ingredientIdx, ingredient in pairs( ingredients ) do

        				if ingredient.type == UI.resourceIngredientTypes.RESOURCE or ingredient.type == UI.resourceIngredientTypes.MODULE then

            				totalNeedCount	= totalNeedCount + ingredient.count

        					local isCount = 0

        					if ingredient.type == UI.resourceIngredientTypes.RESOURCE then

        						isCount = UI:GetPlayerResourceCount( ingredient.defName )

        					elseif ingredient.type == UI.resourceIngredientTypes.MODULE then

                    			local inventoryItems = UI:GetInventoryItemsByDef( ingredient.defName )
                    			for inventoryItemIdx, inventoryItem in pairs( inventoryItems ) do

                    				if not self:GetEquippedShipItem( inventoryItem.iid ) then
        								isCount = isCount + inventoryItem.amount
        							end

        						end

        					end

							isCount = math.min( isCount, ingredient.count )

        					totalIsCount = totalIsCount + isCount

        				elseif not( ingredient.type == UI.resourceIngredientTypes.CREDITS or ingredient.type == UI.resourceIngredientTypes.GOLD or ingredient.type == UI.resourceIngredientTypes.TOKENS ) then
        					sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinProgress()[ERROR]: not handled ingredient type %d", ingredient.type )					
        				end

        			end

        			progress = totalNeedCount ~= 0 and totalIsCount / totalNeedCount or 1			

    			end

    		else
    			sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinProgress()[ERROR]: cannot find blueptint to craft cabin \"%s\"", cabinDefName )
    		end

    	end

	end
	

	-- прогрессбар

	local cabinProgressEffect = UI:GetEffectFromLayer( self, self.layers.CABIN_PROGRESS_EFFECT )
	if cabinProgressEffect then
		cabinProgressEffect:SetAnimationTimeAndUpdate( progress )
	end

	-- текст

	local perc = UI:Round( math.min( progress * 100, 100 ) )
	local str = string.format( "%d%%", perc )
	self:SetText( str, self.layers.CABIN_PROGRESS_VAL )

end


--
function UI.EvolvingShipCraftWnd:UpdateCabinActionBtn()

	if self.shipDefName == "" then
		sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinActionBtn()[ERROR]: the window is not inited" )
		return
	end

	self.cabinActionBtn:UnlinkFromParent()

	if not self.bShipCrafted then

    	local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )

    	if UI:GetPlayerResourceCount( cabinDefName ) == 0 then

    		local blueprintDefName = UI:GetBlueprintForItemCraft( cabinDefName )
    		if blueprintDefName ~= "" then

    			self:AddChild( self.cabinActionBtn )

    			-- кнопка "Скрафтить"

    			if UI:IsBluePrintLearned( blueprintDefName ) then

    				self.cabinActionBtn:SetBtnText( UI:GetStringByName( "itemCraft_craftBtn" ) )

                	local bEnable = UI:IsEnoughIngredientsForCraftFromResource( blueprintDefName, 1, true, nil )
                	self.cabinActionBtn:Enable( bEnable )
    					
    			-- кнопка "Изучить"
    			else

    				self.cabinActionBtn:SetBtnText( UI:GetStringByName( "itemCraft_learnBtn" ) )

    				local bEnable = UI:CanLearnBluePrint( blueprintDefName )
    				self.cabinActionBtn:Enable( bEnable )

    			end

    		else
    			sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinActionBtn()[ERROR]: cannot find blueptint to craft cabin \"%s\"", cabinDefName )
    		end

    	end	

	end

end


--
function UI.EvolvingShipCraftWnd:UpdateCabinPrice()

	if self.shipDefName == "" then
		sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinPrice()[ERROR]: the window is not inited" )
		return
	end

	local str = ""

	if not self.bShipCrafted then

    	local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )

    	if UI:GetPlayerResourceCount( cabinDefName ) == 0 then

    		local blueprintDefName = UI:GetBlueprintForItemCraft( cabinDefName )
    		if blueprintDefName ~= "" then

    			-- цена крафта

    			if UI:IsBluePrintLearned( blueprintDefName ) then

                	local priceInfos = UI:GetResourceCraftPrice( blueprintDefName, 1 )
                	for priceInfoIdx, priceInfo in ipairs( priceInfos ) do

                		local priceInfo = priceInfos[ priceInfoIdx ]
                		local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.CABIN_PRICE ), false, nil, true, nil )

                		if str ~= "" then
                			str = string.format( "%s ", str )
                		end
                    	str = str .. strPrice

                	end

    			-- цена изучения чертежа

    			else

            		local bNeedBlueprintIco = false

            		local blueprintsCount = UI:GetPlayerResourceCount( blueprintDefName )

            		if blueprintsCount > 0 then
            			bNeedBlueprintIco = true
            		else
            			bNeedBlueprintIco = UI:CantItemBeBoughtByDef( blueprintDefName )
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
			
						str = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.CABIN_PRICE ), true, nil, true, nil )

            		end

    			end

    		else
    			sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinPrice()[ERROR]: cannot find blueptint to craft cabin \"%s\"", cabinDefName )
    		end

    	end

	end

	self.cabinPriceMetaText:SetText( str, true )

end


--
function UI.EvolvingShipCraftWnd:UpdateCabinCraftedText()

	local bVisible = true

	if not self.bShipCrafted then

		local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )

		if UI:GetPlayerResourceCount( cabinDefName ) == 0 then
			bVisible = false
		end

	end

	self:SetLayerVisible( bVisible, self.layers.CABIN_CRAFTED_TEXT )

end


--
function UI.EvolvingShipCraftWnd:UpdateCabinIngredients()

	self.cabinIngredientsList:Clear()
	self.cabinIngredientsList:UnlinkFromParent()

	if not self.bShipCrafted then

    	local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )

    	if UI:GetPlayerResourceCount( cabinDefName ) == 0 or self:IsCabinCraftAnimating() then

    		local blueprintDefName = UI:GetBlueprintForItemCraft( cabinDefName )
    		if blueprintDefName ~= "" then

    			if UI:IsBluePrintLearned( blueprintDefName ) then

    				self:AddChild( self.cabinIngredientsList )

        			local ingredients = UI:GetResourceCraftIngredients( blueprintDefName )
        			for ingredientIdx, ingredient in ipairs( ingredients ) do

        				if ingredient.type == UI.resourceIngredientTypes.RESOURCE or ingredient.type == UI.resourceIngredientTypes.MODULE then

        					local isCount = 0

        					if ingredient.type == UI.resourceIngredientTypes.RESOURCE then

        						isCount = UI:GetPlayerResourceCount( ingredient.defName )

        					elseif ingredient.type == UI.resourceIngredientTypes.MODULE then

                    			local inventoryItems = UI:GetInventoryItemsByDef( ingredient.defName )
                    			for inventoryItemIdx, inventoryItem in pairs( inventoryItems ) do

                    				if not self:GetEquippedShipItem( inventoryItem.iid ) then
        								isCount = isCount + inventoryItem.amount
        							end

        						end

        					end

    						local data = {}
    						data.defName	= ingredient.defName
    						data.needCount	= ingredient.count
    						data.isCount	= isCount

    						self.cabinIngredientsList:AddRecord( data )

        				elseif not( ingredient.type == UI.resourceIngredientTypes.CREDITS or ingredient.type == UI.resourceIngredientTypes.GOLD or ingredient.type == UI.resourceIngredientTypes.TOKENS ) then
        					sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinIngredients()[ERROR]: not handled ingredient type %d", ingredient.type )					
        				end

        			end

    			end

    		else
    			sys.log( "UI.EvolvingShipCraftWnd:UpdateCabinIngredients()[ERROR]: cannot find blueptint to craft cabin \"%s\"", cabinDefName )
    		end
    		
    	end

	end

end


--
function UI.EvolvingShipCraftWnd:UpdateCrystalsIco()

	local crystalsDefName, needCrystals = UI:GetEvolvingShipResourcePrice( self.shipDefName )
	local bEnabled = true

	if not self.bShipCrafted then
		if UI:GetPlayerResourceCount( crystalsDefName ) < needCrystals then
			bEnabled = false
		end
	end

	self.crystalsIcoWnd:Setup( crystalsDefName, not bEnabled )

end


--
function UI.EvolvingShipCraftWnd:UpdateCrystalsName()

	local crystalsDefName, needCrystals = UI:GetEvolvingShipResourcePrice( self.shipDefName )
	local str = string.format( "$link [type RESOURCE][params {defName=\"%s\"}]$", crystalsDefName )

	self.crystalsNameMetaText:SetText( str, true )

end


--
function UI.EvolvingShipCraftWnd:UpdateCrystalsProgress()

	local progress = 0
	local crystalsDefName, needCrystals = UI:GetEvolvingShipResourcePrice( self.shipDefName )
	local isCrystals = 0

	if self.bShipCrafted then
		progress	= 1
		isCrystals	= needCrystals
	else
		isCrystals	= UI:GetPlayerResourceCount( crystalsDefName )
    	progress	= needCrystals ~= 0 and isCrystals / needCrystals or 1	
	end

    -- прогрессбар
	local crystalsProgressEffect = UI:GetEffectFromLayer( self, self.layers.CRYSTALS_PROGRESS_EFFECT )
	if crystalsProgressEffect then
		crystalsProgressEffect:SetAnimationTimeAndUpdate( progress )
	end

	-- текст
	local str = string.format( "%s/%s", UI:Num2StrSeparatedBy3( math.min( isCrystals, needCrystals ) ), UI:Num2StrSeparatedBy3( needCrystals ) )
	self:SetText( str, self.layers.CRYSTALS_PROGRESS_VAL )

end


--
function UI.EvolvingShipCraftWnd:UpdateStarterPackBundleBtn()

	local bNeedBtn = false

	if not self.bShipCrafted then
		if UI:GetShipPartsBundleForShip( self.shipDefName ) ~= "" then
			bNeedBtn = true
		end
	end

	if bNeedBtn then
		self:AddChild( self.starterPackBundleBtn )
	else
		self.starterPackBundleBtn:UnlinkFromParent()
	end	

end


function UI.EvolvingShipCraftWnd:UpdateStarterPackDlcBtn()

	local bNeedBtn = false
	local dlcName = ""

	if not self.bShipCrafted then
		dlcName = UI:GetShipPartsDlcForShip( self.shipDefName )
		if dlcName ~= "" then
			bNeedBtn = true
		end
	end

	if bNeedBtn then
		self:AddChild( self.starterPackDlcBtn )
		self.starterPackDlcBtn:Setup( dlcName )
	else
		self.starterPackDlcBtn:UnlinkFromParent()
	end	

end


-- tODO: вызов на коллбэки
function UI.EvolvingShipCraftWnd:UpdateCrystalsCraftedText()

	local bVisible = true

	if not self.bShipCrafted then

		local crystalsDefName, needCrystals = UI:GetEvolvingShipResourcePrice( self.shipDefName )

		if UI:GetPlayerResourceCount( crystalsDefName ) < needCrystals then
			bVisible = false
		end

	end

	self:SetLayerVisible( bVisible, self.layers.CRYSTALS_CRAFTED_TEXT )

end


--
function UI.EvolvingShipCraftWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.cabinActionBtn then

		if not self:IsWaiting() then

        	local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )
    		local blueprintDefName = UI:GetBlueprintForItemCraft( cabinDefName )

    		if UI:IsBluePrintLearned( blueprintDefName ) then
    			self:TryCraftItem( blueprintDefName )
    		else
    			self:TryLearnBlueprint( blueprintDefName )
    		end

		end

	elseif wnd == self.starterPackBundleBtn then

		if not self:IsWaiting() then
			self:LaunchBuyBundleWnd( UI:GetShipPartsBundleForShip( self.shipDefName ) )
		end
		
	elseif wnd == self.starterPackDlcBtn then
		
		if not self:IsWaiting() then
		
			local dlcName = self.starterPackDlcBtn:GetDlcName()
		
			if _G.Arc_IsInitialized() then
				self:TryBuyArcDlc( dlcName )
			else
				UI:LaunchDlcLink( dlcName )
			end
			
		end

	elseif wnd == self.shipCraftBtn then

		if not self:IsWaiting() and not self:IsCabinCraftAnimating() then
			self:TryCraftShip()
		end

	elseif wnd == self.crossBtn then

		self:Close( true )
		
		if self.bShipCraftAnimating then
			self:CheckShowRoleWnd( self.shipDefName )
		end

	elseif UI:IsWndKindOf( wnd, "EvolvingShipCraft_CabinIngredientSlotWnd" ) then

		if not self:IsWaiting() and not self:IsCabinCraftAnimating() and wnd:CanClick() then			
			self:LaunchItemCraftWnd( wnd:GetRecordData().defName )
		end		

	end

	return true

end


--
function UI.EvolvingShipCraftWnd:OnEscape()

	self:Close( true )
	
	if self.bShipCraftAnimating then
		self:CheckShowRoleWnd( self.shipDefName )
	end

	return true	

end


--
function UI.EvolvingShipCraftWnd:Close( bSound )

	self:Hide()

	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end	

end


--
function UI.EvolvingShipCraftWnd:TryCraftItem( blueprintDefName, bEnchanted, craftCount )

	if bEnchanted == nil then
		bEnchanted = false
	end

	if craftCount == nil then
		craftCount = 1
	end

	if self:IsWaiting() then
		sys.log( "UI.EvolvingShipCraftWnd:TryCraftItem()[ERROR]: is waiting for another request" )
		return
	end

	if blueprintDefName == "" then
		sys.log( "UI.EvolvingShipCraftWnd:TryCraftItem()[ERROR]: invalid blueprintDefName" )
		return
	end

	if craftCount <= 0 then
		sys.log( "UI.EvolvingShipCraftWnd:TryCraftItem()[ERROR]: invalid craftCount" )
		return
	end

	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( blueprintDefName )

	local itemsInventorySize	= UI:GetNeedInventorySizeForItem( craftResultDefName, craftResultCount * craftCount )
	local usedInventorySize		= UI:GetInventoryCurSize()
	local inventoryCapacity		= UI:GetInventoryMaxSizeForCurLevel()

	local bEnoughInventorySize = ( usedInventorySize + itemsInventorySize ) <= inventoryCapacity	
    if bEnoughInventorySize then

		self:LaunchItemCraftConfirmWnd( blueprintDefName, bEnchanted, craftCount )

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
function UI.EvolvingShipCraftWnd:DoCraftItem( blueprintDefName, bEnchanted, count )

	if self:IsWaiting() then
		sys.log( "UI.EvolvingShipCraftWnd:DoCraftItem()[ERROR]: still waiting for another request" )
		return
	end

	self.requestId_itemCraft = _G.MasterServer_UseCraftResource( blueprintDefName, count )

	if self.requestId_itemCraft ~= 0 then

		UI:AddWaitingRequest( self.requestId_itemCraft )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
		self.bWaitingInventory = true

		UI:PlayGlobalSound( self.sounds.craft )

        local cabinDefName = UI:GetEvolvingShipCabin( self.shipDefName )
    	local cabinBlueprintDefName = UI:GetBlueprintForItemCraft( cabinDefName )

		if blueprintDefName == cabinBlueprintDefName then
			self.craftingCabinDefName = cabinDefName
		end

	else
		UI:ShowMsgOnItemCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end			

end


--
function UI.EvolvingShipCraftWnd:TryLearnBlueprint( defName )

	if self:IsWaiting() then
		sys.log( "UI.EvolvingShipCraftWnd:TryLearnBlueprint()[ERROR]: is waiting another request" )
		return
	end

	if type( defName ) ~= "string" or defName == "" then
		sys.log( "UI.EvolvingShipCraftWnd:TryLearnBlueprint()[ERROR]: invalid defName" )
		return	
	end

	if UI:IsBluePrintLearned( defName ) then
		sys.log( "UI.EvolvingShipCraftWnd:TryLearnBlueprint()[ERROR]: already learned" )
		return	
	end

	if not UI:CanLearnBluePrint( defName ) then
		sys.log( "UI.EvolvingShipCraftWnd:TryLearnBlueprint()[ERROR]: cannot learn" )
		return	
	end

	local bHasBlueprint = UI:GetPlayerResourceCount( defName ) > 0

	if bHasBlueprint then
		self:DoLearnBlueprint( defName )
	else
		self:LaunchLearnBlueprintWnd( defName )
	end

end


--
function UI.EvolvingShipCraftWnd:DoLearnBlueprint( defName )

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
function UI.EvolvingShipCraftWnd:LaunchLearnBlueprintWnd( defName )

	local shopItem = UI:GetShopItemByDef( defName )
	if not shopItem then
		sys.log( "UI.EvolvingShipCraftWnd:LaunchLearnBlueprintWnd()[ERROR]: cannot find shop item" )
		return
	end

	self.tradeWnd:SetupForBuy( shopItem )
	self.tradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.EvolvingShipCraftWnd:LaunchBuyBundleWnd( bundleDefName )

	UI.HangarWnd:ShowBuyBundleWnd( bundleDefName, nil, true )

end


--
function UI.EvolvingShipCraftWnd:TryCraftShip()

	if self:IsWaiting() then
		sys.log( "UI.EvolvingShipCraftWnd:TryCraftShip()[ERROR]: is waiting for another request" )
		return
	end

	self.hMsgCraftShip = UI:MessageBox( UI:GetStringByName( "shipsTree_craftAlienShipConfirm_caption" ), UI:GetStringByName( "shipsTree_craftAlienShipConfirm_msg" ), UI.MBS_YES_NO )

end


--
function UI.EvolvingShipCraftWnd:TryCraftShip2()

	if self:IsWaiting() then
		sys.log( "UI.EvolvingShipCraftWnd:TryCraftShip2()[ERROR]: is waiting for another request" )
		return
	end

	local bEnoughInventorySize = UI:IsEnoughPlaceInInventoryForItem( self.shipDefName )

	if bEnoughInventorySize then

		self:DoCraftShip( self.shipDefName )

	else

		if UI:CanIncreaseInventory() then

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

			self.shipDefNameToCraft = self.shipDefName
    		self:LaunchBuyWnd( UI.BuyWnd.modes.INVENTORY_AUTO, { inventoryLevels = inventoryLevelsToBuy } )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end


--
function UI.EvolvingShipCraftWnd:DoCraftShip( defName )

	if self:IsWaiting() then
		sys.log( "UI.EvolvingShipCraftWnd:DoCraftShip()[ERROR]: is waiting for another request" )
		return
	end

	self.requestId_shipCraft = _G.GameStore_CraftVessel( defName, "", u64( 0 ) )

	if self.requestId_shipCraft ~= 0 then

		self.bWaitingOwnVessels		= true
		self.craftingShipDefName	= defName

		local shipItemInSelBattleSlot = UI.HangarWnd:GetShipItemInSelBattleSlot()
		if not shipItemInSelBattleSlot then
	    	self.battleSlotToInstall = UI.HangarWnd:GetSelBattleSlot()
		end

	else
		UI:ShowMsgOnShipCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitEffect()

end


--
function UI.EvolvingShipCraftWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgCraftShip then

		self.hMsgCraftShip = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			UI:PlayGlobalSound( UI.sounds.btnClick )
			self:TryCraftShip2()

		end

	end

end


--
function UI.EvolvingShipCraftWnd:BuyInventory()

	self.requestId_buyInventory = _G.GameStore_BuyInventoryExtension()

	if self.requestId_buyInventory ~= 0 then
		UI:PlayGlobalSound( self.sounds.buyInventory )
	else
		self.blueprintToCraftData	= nil
		self.shipDefNameToCraft		= nil
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitEffect()

end


--
function UI.EvolvingShipCraftWnd:LaunchItemCraftWnd( itemDefName )

	local launchData =
	{
		bEvolvingShipCraftWnd	= true,
		craftWndTableName		= self:GetScriptTableName(),
		shipDefName				= self.shipDefName,
	}

	UI.HangarWnd:ShowItemCraftSingle( itemDefName, false, launchData )

end


--
function UI.EvolvingShipCraftWnd:LaunchItemCraftConfirmWnd( blueprintDefName, bEnchanted, count )

	self.itemCraftConfirmWnd:Setup( blueprintDefName, bEnchanted, count )
	self.itemCraftConfirmWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.EvolvingShipCraftWnd:LaunchBuyWnd( mode, data )

	self.buyWnd:Setup( mode, true, data, true )
	self.buyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.EvolvingShipCraftWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.EvolvingShipCraftWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	self.itemCraftConfirmWnd:UnlinkFromParent()
	self.tradeWnd:UnlinkFromParent()

	if self.buyWnd:IsOnScreen() then
		self.buyWnd:UnlinkFromParent()
		self.blueprintToCraftData	= nil
		self.shipDefNameToCraft		= nil
	end

	if self.hMsgCraftShip ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgCraftShip )
		self.hMsgCraftShip = UI.INVALID_UI_HANDLE
	end

	if UI.ItemCraftSingleWnd:IsOnScreen() then

		local itemCraftlaunchData = UI.ItemCraftSingleWnd:GetLaunchData()
		if itemCraftlaunchData and itemCraftlaunchData.bEvolvingShipCraftWnd and itemCraftlaunchData.craftWndTableName == self:GetScriptTableName() then
			UI.ItemCraftSingleWnd:Hide()
		end

	end

end


--
function UI.EvolvingShipCraftWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.EvolvingShipCraftWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.EvolvingShipCraftWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )

end


--
function UI.EvolvingShipCraftWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )

end


--
function UI.EvolvingShipCraftWnd:IsWaiting()

	return
		UI:IsWaitingRequests()
		or self.requestId_itemCraft ~= 0
		or self.bWaitingInventory
		or self.requestId_buyInventory ~= 0
		or self.requestId_learnBlueprint ~= 0
		or self.requestId_buy ~= 0
		or self.bWaitingLearnedBlueprints
		or self.requestId_shipCraft ~= 0
		or self.bWaitingOwnVessels
		or self.bWaitingChangeBattleSlotVessel

end


--
function UI.EvolvingShipCraftWnd:F_OnEventStopWaitingRequests()

	self.bWaitingLearnedBlueprints = false

	if self:IsOnScreen() then
		self:UpdateWaitEffect()
	end

end


--
function UI.EvolvingShipCraftWnd:F_OnEventStartWaitingRequests()

	if self:IsOnScreen() then
		self:UpdateWaitEffect()
	end

end


--
function UI.EvolvingShipCraftWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	local tableName = self:GetScriptTableName()

	UI.store[ tableName ] =
	{
		shipDefName							= self.shipDefName,
        requestId_itemCraft					= self.requestId_itemCraft,
		bWaitingInventory					= self.bWaitingInventory,
		blueprintToCraftData				= self.blueprintToCraftData,
		requestId_buyInventory				= self.requestId_buyInventory,
		requestId_learnBlueprint			= self.requestId_learnBlueprint,
		requestId_buy						= self.requestId_buy,
        bWaitingLearnedBlueprints			= self.bWaitingLearnedBlueprints,
		requestId_shipCraft					= self.requestId_shipCraft,
		bWaitingOwnVessels					= self.bWaitingOwnVessels,
		craftingShipDefName					= self.bWaitingOwnVessels,
		shipDefNameToCraft					= self.shipDefNameToCraft,
		battleSlotToInstall					= self.battleSlotToInstall,
		bWaitingChangeBattleSlotVessel		= self.bWaitingChangeBattleSlotVessel,
		craftingCabinDefName				= self.craftingCabinDefName,
	}

end


--
function UI.EvolvingShipCraftWnd:F_OnEventRestoreUiState()

	local tableName = self:GetScriptTableName()
	local t = UI.store[ tableName ]

	if t then

        self.requestId_itemCraft					= t.requestId_itemCraft
		self.bWaitingInventory						= t.bWaitingInventory
		self.blueprintToCraftData					= t.blueprintToCraftData
		self.requestId_buyInventory					= t.requestId_buyInventory
		self.requestId_learnBlueprint				= t.requestId_learnBlueprint
		self.requestId_buy							= t.requestId_buy
        self.bWaitingLearnedBlueprints				= t.bWaitingLearnedBlueprints
		self.requestId_shipCraft					= t.requestId_shipCraft
		self.bWaitingOwnVessels						= t.bWaitingOwnVessels
		self.craftingShipDefName					= t.craftingShipDefName
		self.shipDefNameToCraft						= t.shipDefNameToCraft
		self.battleSlotToInstall					= t.battleSlotToInstall
		self.bWaitingChangeBattleSlotVessel			= t.bWaitingChangeBattleSlotVessel
		self.craftingCabinDefName					= t.craftingCabinDefName

		self.shipDefName = t.shipDefName

		if self.shipDefName ~= "" and self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store[ tableName ] = nil

	end
	
end


--
function UI.EvolvingShipCraftWnd:F_OnEventInvItemsChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.craftingCabinDefName ~= "" then

		if self.craftingCabinDefName == UI:GetEvolvingShipCabin( self.shipDefName ) then
			self.bCabinCraftAnimating = true
		end

		self.craftingCabinDefName = ""
		
	end

	self:FullUpdate()

end


--
function UI.EvolvingShipCraftWnd:OnAccountAurasChanged()

	self:UpdateCabinPrice()
	self:UpdateCabinActionBtn()

end


--
function UI.EvolvingShipCraftWnd:StartCabinCraftAnimation()

	self.bCabinCraftAnimating = true

	self.cabinIngredientsList:AnimateHide()

	self:SetLayerVisible( true, self.layers.CABIN_CRAFT_ANIMATION_EFFECT )
	local cabinCraftAnimationEffect = UI:GetEffectFromLayer( self, self.layers.CABIN_CRAFT_ANIMATION_EFFECT )
	if cabinCraftAnimationEffect then
		cabinCraftAnimationEffect:RestartAnimation()
	end

end


--
function UI.EvolvingShipCraftWnd:CheckStopCabinCraftAnimation()

	if not self.bCabinCraftAnimating then
		return
	end

	if not self:CheckCabinCraftAnimating() then
		self:StopCabinCraftAnimation()
	end

end


--
function UI.EvolvingShipCraftWnd:StopCabinCraftAnimation()

	if not self.bCabinCraftAnimating then
		return
	end

	self.bCabinCraftAnimating = false
	self:FullUpdate()

end


--
function UI.EvolvingShipCraftWnd:CheckCabinCraftAnimating()

	if self.cabinIngredientsList:IsChildOf( self ) and self.cabinIngredientsList:IsAnimating() then
		return true
	end

	if self:IsLayerVisible( self.layers.CABIN_CRAFT_ANIMATION_EFFECT ) then
    	local cabinCraftAnimationEffect = UI:GetEffectFromLayer( self, self.layers.CABIN_CRAFT_ANIMATION_EFFECT )
    	if cabinCraftAnimationEffect and cabinCraftAnimationEffect:IsAnimationPlaying() then
    		return true
    	end
	end

	return false

end


--
function UI.EvolvingShipCraftWnd:IsCabinCraftAnimating()

	return self.bCabinCraftAnimating

end


--
function UI.EvolvingShipCraftWnd:StartShipCraftAnimation()

	self.bShipCraftAnimating = true

	self:SetLayerVisible( true, self.layers.SHIP_CRAFT_ANIMATION_EFFECT )	
	local shipCraftAnimationEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_CRAFT_ANIMATION_EFFECT )
	if shipCraftAnimationEffect then
		shipCraftAnimationEffect:RestartAnimation()
	end

end


--
function UI.EvolvingShipCraftWnd:CheckStopShipCraftAnimation()

	if not self.bShipCraftAnimating then
		return
	end

	if not self:CheckShipCraftAnimating() then
		self:StopShipCraftAnimation()
	end

end


--
function UI.EvolvingShipCraftWnd:StopShipCraftAnimation()

	if not self.bShipCraftAnimating then
		return
	end

	self.bShipCraftAnimating = false
	self:Close( false )
	
	self:CheckShowRoleWnd( self.shipDefName )

end


--
function UI.EvolvingShipCraftWnd:CheckShipCraftAnimating()

	if self:IsLayerVisible( self.layers.SHIP_CRAFT_ANIMATION_EFFECT ) then
    	local shipCraftAnimationEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_CRAFT_ANIMATION_EFFECT )
    	if shipCraftAnimationEffect and shipCraftAnimationEffect:IsAnimationPlaying() then
    		return true
    	end
	end

	return false

end


--
function UI.EvolvingShipCraftWnd:IsShipCraftAnimating()

	return self.bShipCraftAnimating

end


--
function UI.EvolvingShipCraftWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.CABIN_CRAFT_ANIMATION_EFFECT ) then
		self:SetLayerVisible( false, self.layers.CABIN_CRAFT_ANIMATION_EFFECT )
		self:CheckStopCabinCraftAnimation()

	elseif effect == UI:GetEffectFromLayer( self, self.layers.SHIP_CRAFT_ANIMATION_EFFECT ) then
		self:SetLayerVisible( false, self.layers.SHIP_CRAFT_ANIMATION_EFFECT )
		self:CheckStopShipCraftAnimation()
	end

end


--
function UI.EvolvingShipCraftWnd:CheckShowRoleWnd( shipDefName )

	local role = UI:GetItemRole( shipDefName )
	
	if not UI.RoleInfoWnd:IsRoleShown( role ) then
		UI.RoleInfoWnd:ShowAsNotification( role )
	end
	
end


-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_ShipIcoWnd
-- --------------------------------------------------------------------

UI.EvolvingShipCraft_ShipIcoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.EvolvingShipCraft_ShipIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "EvolvingShipCraft_ShipIcoWnd",
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
				defName 			= "alienShipCraft_shipIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}},
		},
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.EvolvingShipCraft_ShipIcoWnd:Setup( defName )

	self:Reset()

	self.defName = defName

	self:FullUpdate()

end


--
function UI.EvolvingShipCraft_ShipIcoWnd:Reset()

	self.defName		= ""
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.EvolvingShipCraft_ShipIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- -------------------------------
-- const
-- -------------------------------

UI.EvolvingShipCraft_ShipIcoWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.EvolvingShipCraft_ShipIcoWnd.effectInfo =
{
	main =
	{
		spriteName	= "race_ico3"
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.EvolvingShipCraft_ShipIcoWnd.defName		= ""
UI.EvolvingShipCraft_ShipIcoWnd.tooltipData	= nil

-- -------------------------------
-- work funcitons
-- -------------------------------

--
function UI.EvolvingShipCraft_ShipIcoWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.EvolvingShipCraft_ShipIcoWnd:UpdateIco()

	local hTex = UI:GetAlienShipCraftIco( self.defName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, hTex )
	end

end


--
function UI.EvolvingShipCraft_ShipIcoWnd:UpdateTooltip()

	self.tooltipData =
	{
    	tooltipType		= UI.tooltipTypes.SHIP,
		defName			= self.defName,			
	}

end


-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_ResourceIcoWnd
-- --------------------------------------------------------------------

UI.EvolvingShipCraft_ResourceIcoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.EvolvingShipCraft_ResourceIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "EvolvingShipCraft_ResourceIcoWnd",
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
				defName 			= "alienShipCraft_resourceIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_cabin",
						layer		= "UI.EvolvingShipCraft_ResourceIcoWnd.layers.NOT_LEARNED",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}},
		},

        -- NOT_LEARNED
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "itemCraft_notLearned" ),
		},
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.EvolvingShipCraft_ResourceIcoWnd:Setup( defName, bDisabled, bNotLearned )

	if bDisabled == nil then
		bDisabled = false
	end

	if bNotLearned == nil then
		bNotLearned = false
	end

	self:Reset()

	self.defName		= defName
	self.bDisabled		= bDisabled
	self.bNotLearned	= bNotLearned

	self:FullUpdate()

end


--
function UI.EvolvingShipCraft_ResourceIcoWnd:Reset()

	self.defName		= ""
	self.bDisabled		= false
	self.bNotLearned	= false
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, UI.INVALID_RESOURCE_HANDLE )
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	self:SetLayerVisible( false, self.layers.NOT_LEARNED )

end


--
function UI.EvolvingShipCraft_ResourceIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- -------------------------------
-- const
-- -------------------------------

UI.EvolvingShipCraft_ResourceIcoWnd.layers =
{
	MAIN_EFFECT	= 0,
	NOT_LEARNED	= 1,
}

UI.EvolvingShipCraft_ResourceIcoWnd.effectInfo =
{
	main =
	{
		spriteName		= "ico",
		animIdle		= "idle",
		animDisabled	= "disable",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.EvolvingShipCraft_ResourceIcoWnd.defName		= ""
UI.EvolvingShipCraft_ResourceIcoWnd.bDisabled		= false
UI.EvolvingShipCraft_ResourceIcoWnd.bNotLearned	= false
UI.EvolvingShipCraft_ResourceIcoWnd.tooltipData	= nil

-- -------------------------------
-- work funcitons
-- -------------------------------

--
function UI.EvolvingShipCraft_ResourceIcoWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateMainAnimation()
	self:UpdateNotLearned()
	self:UpdateTooltip()

end


--
function UI.EvolvingShipCraft_ResourceIcoWnd:UpdateIco()

	local hTex = UI:GetAlienResourceCraftIco( self.defName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, hTex )
	end

end


--
function UI.EvolvingShipCraft_ResourceIcoWnd:UpdateMainAnimation()

	local anim = self.bDisabled and self.effectInfo.main.animDisabled or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end	

end


--
function UI.EvolvingShipCraft_ResourceIcoWnd:UpdateNotLearned()

	self:SetLayerVisible( self.bNotLearned, self.layers.NOT_LEARNED )

end


--
function UI.EvolvingShipCraft_ResourceIcoWnd:UpdateTooltip()

	self.tooltipData = UI:GetTooltipForItem( self.defName )

end

-- --------------------------------------------------------------------
-- UI.AlienShipCraft_ResourceIcoWnd
-- --------------------------------------------------------------------

UI.AlienShipCraft_ResourceIcoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.AlienShipCraft_ResourceIcoWnd.def =
{
	className	= "Wnd",
	prototype	= "EvolvingShipCraft_ResourceIcoWnd",

	props =
	{
		name		= "AlienShipCraft_ResourceIcoWnd",
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
				defName 			= "alienShipCraft_resourceIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_cabin",
						layer		= "UI.EvolvingShipCraft_ResourceIcoWnd.layers.NOT_LEARNED",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}},
		},
	}
}

-- --------------------------------------------------------------------
-- UI.SpecialShipCraft_ResourceIcoWnd
-- --------------------------------------------------------------------

UI.SpecialShipCraft_ResourceIcoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.SpecialShipCraft_ResourceIcoWnd.def =
{
	className	= "Wnd",
	prototype	= "EvolvingShipCraft_ResourceIcoWnd",

	props =
	{
		name		= "SpecialShipCraft_ResourceIcoWnd",
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
				defName 			= "specialShipCraft_resourceIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_cabin",
						layer		= "UI.EvolvingShipCraft_ResourceIcoWnd.layers.NOT_LEARNED",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}},
		},
	}
}

-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_CabinIngredientsListWnd
-- --------------------------------------------------------------------

UI.EvolvingShipCraft_CabinIngredientsListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.EvolvingShipCraft_CabinIngredientsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "EvolvingShipCraft_CabinIngredientsListWnd",
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
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.EvolvingShipCraft_CabinIngredientsListWnd:AnimateIdle()

	if self.mainEffect then
		self.mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

end


--
function UI.EvolvingShipCraft_CabinIngredientsListWnd:AnimateHide()

	if self.mainEffect then
		self.mainEffect:StartAnimation( self.effectInfo.main.animHide )
	end

end


--
function UI.EvolvingShipCraft_CabinIngredientsListWnd:IsAnimating()

	return self.mainEffect and self.mainEffect:GetCurAnimation() == self.effectInfo.main.animHide	

end


--
function UI.EvolvingShipCraft_CabinIngredientsListWnd:GetSlotAlpha( slotIdx )

	local alpha	= 0
	local color	= 0

	local slotLocator = string.format( "%s%s", self.effectInfo.main.slotObjNamePrefix, slotIdx )

	if self.mainEffect then
		alpha = self.mainEffect:GetObjAlpha( slotLocator )
		color = self.mainEffect:GetObjColor( slotLocator )
	end

	return alpha, color

end


-- -------------------------------
-- const
-- -------------------------------

UI.EvolvingShipCraft_CabinIngredientsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "item_",
		scrollObjName		= "",
		animIdle			= "idle",
		animHide			= "hide"
	}
}

UI.EvolvingShipCraft_CabinIngredientsListWnd.btnPrototypeName	= "EvolvingShipCraft_CabinIngredientSlotWnd"
UI.EvolvingShipCraft_CabinIngredientsListWnd.MAX_SLOTS			= 5
UI.EvolvingShipCraft_CabinIngredientsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- -------------------------------
-- vars
-- -------------------------------

UI.EvolvingShipCraft_CabinIngredientsListWnd.mainEffect = nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.EvolvingShipCraft_CabinIngredientsListWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.EvolvingShipCraft_CabinIngredientsListWnd:F_OnEffectAnimationEnded( effect, animName )

	local parent = self:GetParent()
	if parent then
		parent:OnIngredientsListEndAnimating()
	end

end

-- --------------------------------------------------------------------
-- UI.AlienShipCraft_CabinIngredientsListWnd
-- --------------------------------------------------------------------

UI.AlienShipCraft_CabinIngredientsListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "EvolvingShipCraft_CabinIngredientsListWnd",

    	props =
    	{
    		name		= "AlienShipCraft_CabinIngredientsListWnd",
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
    				defName 			= "alienShipCraft_cabinIngredientsList",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}},
    		},
    	}
    }
}

-- --------------------------------------------------------------------
-- UI.SpecialShipCraft_CabinIngredientsListWnd
-- --------------------------------------------------------------------

UI.SpecialShipCraft_CabinIngredientsListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "EvolvingShipCraft_CabinIngredientsListWnd",

    	props =
    	{
    		name		= "SpecialShipCraft_CabinIngredientsListWnd",
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
    				defName 			= "specialShipCraft_cabinIngredientsList",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}},
    		},
    	}
    }
}


-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_CabinIngredientSlotWnd
-- --------------------------------------------------------------------

-- Внимание, хак! Этот "класс" был использован в качестве базового для похожих элементов в другом окне (UI.ShipNodeLearnWnd);
-- меняя что-то здесь, надо проследить, чтобы там тоже не сломалось

UI.EvolvingShipCraft_CabinIngredientSlotWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.EvolvingShipCraft_CabinIngredientSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "EvolvingShipCraft_CabinIngredientSlotWnd",
		isPrototype	= true,
	},
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.tooltipData = nil

	self.icoWnd:Reset()
	self.icoWnd:HideMain()
	self.icoWnd:HideIcoMain()

	local icoEffect = UI:GetEffectFromLayer( self.icoWnd, 0 )
	if icoEffect then
		icoEffect:SetAlpha( 255 )
		icoEffect:SetColor( UI.WHITE_COLOR )
	end

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:GetTooltipData()
	
	return self.tooltipData

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:CanClick()

	local data = self:GetRecordData()
	return data ~= nil

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:GetBlueprint()

	local data = self:GetRecordData()

	local blueprintDefName = UI:GetBlueprintForItemCraft( data.defName, true )
	return blueprintDefName

end


-- -------------------------------
-- const
-- -------------------------------

UI.EvolvingShipCraft_CabinIngredientSlotWnd.sounds =
{
	mouseOver	= "sound/ui/btnMouseOver",
}

-- -------------------------------
-- vars
-- -------------------------------

UI.EvolvingShipCraft_CabinIngredientSlotWnd.icoWnd			= nil
UI.EvolvingShipCraft_CabinIngredientSlotWnd.tooltipData	= nil

-- -------------------------------
-- work funcitons
-- -------------------------------

--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.icoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self:AddChild( self.icoWnd )
	self.icoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )

	self:SetWidth( self.icoWnd:GetWidth() )
	self:SetHeight( self.icoWnd:GetHeight() )

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateCount( data )
	self:UpdateEnoughEffect( data )
	self:UpdateDarkening( data )
	self:UpdateTooltip( data )
	self:UpdateMouseOver()

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateIco( data )

	self.icoWnd:SetupForItem( data.defName )

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateCount( data )

	local str = ""

	local strNeedCount	= UI:Num2StrSeparatedBy3( data.needCount )
	local strIsCount	= tostring( math.min( data.isCount, 999 ) )

	if data.isCount >= data.needCount then
		local needCountColor = data.needCount > 0 and UI.GOLD_COLOR or UI.PARAM_DELTA_MINUS_COLOR
		str = string.format( "%s%s/%s%s", UI:Color2Str( UI.TEXT_BASE_COLOR ), strIsCount, UI:Color2Str( needCountColor ), strNeedCount )
	else
		str = string.format( "%s%s/%s", UI:Color2Str( UI.PARAM_DELTA_MINUS_COLOR ), strIsCount, strNeedCount )
	end

	local alpha = self:GetParent():GetSlotAlpha( self:GetSlot() )
	local strWithAlpha = _G.SetInternalTextAlpha( str, alpha )
	if strWithAlpha then
		str = strWithAlpha
	end

	self.icoWnd:SetCountResourcesText( str )

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateEnoughEffect( data )

	if data.isCount >= data.needCount then
		self.icoWnd:ShowCheckmark()
	else
		self.icoWnd:HideCheckmark()
	end

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateDarkening( data )

	if data.isCount >= data.needCount then
		self.icoWnd:AnimateIcoIdle()
	else
		self.icoWnd:AnimateIcoDisabled()
	end

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateTooltip( data )

	self.tooltipData = UI:GetTooltipForItem( data.defName )

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if self:CanClick() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )	

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.icoWnd:IsMouseOver()

	if bMouseOver then
		self.icoWnd:ShowMouseOver()
	else
		self.icoWnd:HideMouseOver()
	end

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self:GetParent():IsAnimating() then
		self:UpdateAlpha()
	end

end


--
function UI.EvolvingShipCraft_CabinIngredientSlotWnd:UpdateAlpha()

	local alpha, color = self:GetParent():GetSlotAlpha( self:GetSlot() )

	local icoEffect = UI:GetEffectFromLayer( self.icoWnd, 0 )
	if icoEffect then
		icoEffect:SetAlpha( alpha )
		icoEffect:SetColor( color )
	end

	self:UpdateCount( self:GetRecordData() )

end


-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_CabinActionBtn
-- --------------------------------------------------------------------

UI.EvolvingShipCraft_CabinActionBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn14",

    	props =
    	{
    		name		= "EvolvingShipCraft_CabinActionBtn",
			isPrototype	= true,
    	}
	},
}

-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_StarterPackBundleBtn
-- --------------------------------------------------------------------

UI.EvolvingShipCraft_StarterPackBundleBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn14",

    	props =
    	{
    		name		= "EvolvingShipCraft_StarterPackBundleBtn",
			isPrototype	= true,
    	}
	},

	textId = "alienShipCraft_starterPackBtn",
}

-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_StarterPackBundleBtn
-- --------------------------------------------------------------------

UI.EvolvingShipCraft_StarterPackDlcBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipsTree_DlcBtn",

		props =
		{
			name		= "EvolvingShipCraft_DlcBtn",
			isPrototype	= true,
		}
	},
}

-- --------------------------------------------------------------------
-- UI.EvolvingShipCraft_ShipCraftBtn
-- --------------------------------------------------------------------

UI.EvolvingShipCraft_ShipCraftBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

    	props =
    	{
    		name		= "EvolvingShipCraft_ShipCraftBtn",
			isPrototype	= true,
    	}
	},

	textId = "shop_craftBtn"
}

-- --------------------------------------------------------------------
-- UI.AlienShipCraft_ShipCraftBtn
-- --------------------------------------------------------------------

UI.AlienShipCraft_ShipCraftBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EvolvingShipCraft_ShipCraftBtn",

    	props =
    	{
    		name	= "AlienShipCraft_ShipCraftBtn",
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
    				defName 			= "textBtn13",
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
    				}
    			}}
    		},
		}
	},
}

-- --------------------------------------------------------------------
-- UI.SpecialShipCraft_ShipCraftBtn
-- --------------------------------------------------------------------

UI.SpecialShipCraft_ShipCraftBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EvolvingShipCraft_ShipCraftBtn",

    	props =
    	{
    		name	= "SpecialShipCraft_ShipCraftBtn",
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
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}

-- --------------------------------------------------------------------
-- UI.AlienShipCraftWnd
-- --------------------------------------------------------------------

UI.AlienShipCraftWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "EvolvingShipCraftWnd",

    	props =
    	{
    		name	= "AlienShipCraftWnd"
    	},

    	layers =
    	{
    		-- WORK_EFFECT
    		{
    			id			= UI.EvolvingShipCraftWnd.layers.WORK_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "alienShipCraftWnd_work",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "title",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CAPTION",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "note",
    						layer		= "UI.EvolvingShipCraftWnd.layers.DESC",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "progr_cabin",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_PROGRESS_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "note2",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_PROGRESS_VAL",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "title_cabin",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_NAME",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "complit_1",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_CRAFTED_TEXT",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "price",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_PRICE",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "progr_crystal",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_PROGRESS_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "note1",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_PROGRESS_VAL",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "title_crystal",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_NAME",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "complit_2",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_CRAFTED_TEXT",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "loading",
    						layer		= "UI.EvolvingShipCraftWnd.layers.WAIT_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "decor_1",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_CRAFT_ANIMATION_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,             	
    					},

    					{
    						objName		= "decor_2",
    						layer		= "UI.EvolvingShipCraftWnd.layers.SHIP_CRAFT_ANIMATION_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,             	
    					},
    				}
    			}},
    		},

            -- CRYSTALS_PROGRESS_EFFECT
    		{
				id			= UI.EvolvingShipCraftWnd.layers.CRYSTALS_PROGRESS_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName 			= "alienShipCraftWnd_crystalsProgress",
    				defaultAnimation	= "idle",
    			}}
    		},
    	},
    },

	cabinIngredientsListTableName	= "UI.AlienShipCraft_CabinIngredientsListWnd",
	shipCraftBtnTableName			= "UI.AlienShipCraft_ShipCraftBtn",
	resourceIcoPrototypeName		= "AlienShipCraft_ResourceIcoWnd",
}

-- --------------------------------------------------------------------
-- UI.SpecialShipCraftWnd
-- --------------------------------------------------------------------

UI.SpecialShipCraftWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "EvolvingShipCraftWnd",

    	props =
    	{
    		name	= "SpecialShipCraftWnd"
    	},

    	layers =
    	{
    		-- WORK_EFFECT
    		{
    			id			= UI.EvolvingShipCraftWnd.layers.WORK_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "specialShipCraftWnd_work",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "title",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CAPTION",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "note",
    						layer		= "UI.EvolvingShipCraftWnd.layers.DESC",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "progr_cabin",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_PROGRESS_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "note2",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_PROGRESS_VAL",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "title_cabin",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_NAME",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "complit_1",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_CRAFTED_TEXT",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "price",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_PRICE",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "progr_crystal",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_PROGRESS_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "note1",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_PROGRESS_VAL",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "title_crystal",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_NAME",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "complit_2",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CRYSTALS_CRAFTED_TEXT",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "loading",
    						layer		= "UI.EvolvingShipCraftWnd.layers.WAIT_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "decor_1",
    						layer		= "UI.EvolvingShipCraftWnd.layers.CABIN_CRAFT_ANIMATION_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,             	
    					},

    					{
    						objName		= "decor_2",
    						layer		= "UI.EvolvingShipCraftWnd.layers.SHIP_CRAFT_ANIMATION_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,             	
    					},
    				}
    			}},
    		},

            -- CRYSTALS_PROGRESS_EFFECT
    		{
				id			= UI.EvolvingShipCraftWnd.layers.CRYSTALS_PROGRESS_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName 			= "specialShipCraftWnd_crystalsProgress",
    				defaultAnimation	= "idle",
    			}}
    		},

    	},
    },

	cabinIngredientsListTableName	= "UI.SpecialShipCraft_CabinIngredientsListWnd",
	shipCraftBtnTableName			= "UI.SpecialShipCraft_ShipCraftBtn",
	resourceIcoPrototypeName		= "SpecialShipCraft_ResourceIcoWnd",
}