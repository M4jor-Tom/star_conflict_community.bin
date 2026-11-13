-- ----------------------------------------------------------------------------
--
-- Workfile: tradewnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -------------------------------------------------------------------
-- UI.TradeWnd
-- -------------------------------------------------------------------

UI.TradeWnd = {}
local tw = UI.TradeWnd

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.TradeWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "TradeWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs		= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "shop_buy_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.TradeWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.TradeWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_buy_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.TradeWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "product_name",	
						layer		= "UI.TradeWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS,	-- по позиции линкуется к другому локатору
					},
					
					{
						objName		= "fraction",
						layer		= "UI.TradeWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price_title",	
						layer		= "UI.TradeWnd.layers.PRICE_UNIT_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price_once",	
						layer		= "UI.TradeWnd.layers.PRICE_UNIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "total",	
						layer		= "UI.TradeWnd.layers.PRICE_TOTAL_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price",	
						layer		= "UI.TradeWnd.layers.PRICE_TOTAL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "count",	
						layer		= "UI.TradeWnd.layers.COUNT_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "sale",	
						layer		= "UI.TradeWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_1",	
						layer		= "UI.TradeWnd.layers.ITEM_EQUIPPED_WARNING",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1",	
						layer		= "UI.TradeWnd.layers.BUNDLE_CONTENT_COLLECTED",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1",	
						layer		= "UI.TradeWnd.layers.CRAFTED_SHIP_SELL_WARNING",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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

		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
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

		-- PRICE_UNIT_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^shop_buyDialog_unitPrice",
		},

		-- PRICE_UNIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.TradeWnd.layers.PRICE_UNIT_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_UNIT_VAL
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

		-- PRICE_TOTAL_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^shop_buyDialog_totalPrice",
		},

		-- PRICE_TOTAL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.TradeWnd.layers.PRICE_TOTAL_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_TOTAL_VAL
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

		-- COUNT_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^shop_buyDialog_count",
		},

		-- ITEM_EQUIPPED_WARNING
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- BUNDLE_CONTENT_COLLECTED
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = UI:GetStringByName( "buyWnd_bundleContentCollected" ),
		},

		-- CRAFTED_SHIP_SELL_WARNING
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = UI:GetStringByName( "buyWnd_craftedShipSellWarning" ),
		},
	},
}


-- -------------------------------------
-- interface funcitons
-- -------------------------------------

--
function UI.TradeWnd:SetupForBuy( item, bForceNoStack, bBuyForShipParts )

	if bForceNoStack == nil then
		bForceNoStack = false
	end

	self:Reset()

	self.item					= item
	self.tradeMode				= self.tradeModes.BUY
	self.bBuyForShipParts		= bBuyForShipParts

	if item.stacks and not bForceNoStack then
		self.mode = self.modes.STACK
	else
		self.mode = self.modes.SIMPLE
	end

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.TradeWnd:SetupForSell( item, sellPrice )

	self:Reset()

	self.item			= item
	self.tradeMode		= self.tradeModes.SELL
	self.sellPrice		= sellPrice

	self.mode = item.count > 1 and self.modes.STACK or self.modes.SIMPLE

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self.tradeData.playerMoney = 0

	if self.tradeData.priceType == _G.GameStore.CreditsType.CT_TOKENS then
		self.tradeData.playerMoney = UI:GetPlayerTokens()

	elseif self.tradeData.priceType == _G.GameStore.CreditsType.CT_EVENT then
		self.tradeData.playerMoney = UI:GetPlayerEventCredits()

	else
		self.tradeData.playerMoney = UI:GetPlayerMoney( self.tradeData.priceType == _G.GameStore.CreditsType.CT_GOLD )
	end	

	self:UpdatePriceTotalForCount( self:GetCount() )
	self:UpdateTradeBtnState()
	self:UpdateRefillMoneyBtn()

end


--
function UI.TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.TradeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.TradeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.TradeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.TradeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.TradeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.TradeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.TradeWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.TradeWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.TradeWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


-- -------------------------------------
-- const
-- -------------------------------------

tw.layers =
{
    MAIN_EFFECT					= 0,
    BG_EFFECT					= 1,
    WORK_EFFECT					= 2,
    SALE_EFFECT					= 3,
    CAPTION						= 4,
    NAME						= 5,
    PRICE_UNIT_LABEL			= 6,
    PRICE_UNIT_EFFECT			= 7,
    PRICE_UNIT_VAL				= 8,
    PRICE_TOTAL_LABEL			= 9,
    PRICE_TOTAL_EFFECT			= 10,
    PRICE_TOTAL_VAL				= 11,
    COUNT_LABEL					= 12,
	ITEM_EQUIPPED_WARNING		= 13,
	BUNDLE_CONTENT_COLLECTED	= 14,
	CRAFTED_SHIP_SELL_WARNING	= 15,
}

tw.modes =
{
	SIMPLE	= 1,
	STACK	= 2,
}

tw.MAX_COUNT 		= 99
tw.MAX_TOTAL_PRICE  = 999999999

tw.effectInfo =
{
	work =
	{
		itemIcoObjName			= "icon",
		tradeBtnObjName			= "button_2",
		crossBtnObjName			= "btn_x",
		countSliderObjName		= "buy_slider_main",
		refillMoneyBtnObjName	= "button_2",
	},
}

tw.tradeModes =
{
	BUY		= 1,
	SELL	= 2,
}

tw.tradeBtnPrototpyeName	= "Trade_TradeBtn"
tw.countSliderPrototpyeName	= "Trade_CountSliderWnd"

tw.sounds =
{
	tradeWndBuy		= "sound/ui/apply",
	tradeWndSell	= "sound/ui/apply",
	tradeWndHide	= "sound/ui/MsgHide",
}

tw.mainWndName = ""

-- -------------------------------------
-- vars
-- -------------------------------------

tw.mode 				= -1
tw.itemIcoWnd			= nil
tw.item					= nil
tw.tradeMode			= -1
tw.tradeBtn				= nil
tw.crossBtn				= nil
tw.countSlider			= nil
tw.refillMoneyBtn		= nil
tw.priceUnitMetaText	= nil
tw.priceTotalMetaText	= nil
tw.bBuyForShipParts		= false
tw.sellPrice			= nil

tw.tradeData =
{
	price			= 0,
	priceType		= -1,
	maxCount		= 1,
	maxPrice		= 0,
	playerMoney		= 0,
}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.TradeWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceUnitMetaText = UI.MetaText.GetNewInstance()
	self.priceUnitMetaText:InitFromLayer( self, self.layers.PRICE_UNIT_VAL )

	self.priceTotalMetaText = UI.MetaText.GetNewInstance()
	self.priceTotalMetaText:InitFromLayer( self, self.layers.PRICE_TOTAL_VAL )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SLIDER_CHANGED )	
	
	UI:AddOverlayWnd( self:GetScriptTableName() )

end

--
function UI.TradeWnd:F_Shutdown()

	if self.priceUnitMetaText then
		self.priceUnitMetaText:Clear()
	end

	if self.priceTotalMetaText then
		self.priceTotalMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.TradeWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.TradeWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.TradeWnd:UpdateMetaTextPos()

	self.priceUnitMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_UNIT_VAL )
	self.priceTotalMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_TOTAL_VAL )

end


--
function UI.TradeWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_UNIT_VAL then
		self.priceUnitMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_TOTAL_VAL then
		self.priceTotalMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.TradeWnd:CreateControls()

	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.tradeBtn		= UI:CreateChildWnd( self, UI[ self.tradeBtnPrototpyeName ], "" )
	self.crossBtn		= UI:CreateChildWnd( self, UI.CrossBtn, "" )
	self.countSlider	= UI:CreateChildWnd( self, UI[ self.countSliderPrototpyeName ], "" )
	self.refillMoneyBtn	= UI:CreateChildWnd( self, UI.RefillMoneyBtn, "" )

	self:AddControl( self.itemIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.itemIcoObjName )
	self:AddControl( self.crossBtn, self.layers.WORK_EFFECT, self.effectInfo.work.crossBtnObjName )
	self:AddControl( self.countSlider, self.layers.WORK_EFFECT, self.effectInfo.work.countSliderObjName )

end


--
function UI.TradeWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.TradeWnd:RemoveControl( wnd, effectLayer )

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
function UI.TradeWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self.item					= nil
	self.mode					= -1
	self.tradeMode				= -1
	self.bBuyForShipParts		= false
    self.sellPrice				= nil

	self:ResetTradeData()

	self:SetLayerVisible( false, self.layers.SALE_EFFECT )
	self:SetLayerVisible( false, self.layers.PRICE_UNIT_LABEL )
	self:SetLayerVisible( false, self.layers.PRICE_UNIT_VAL )
	self:SetLayerVisible( false, self.layers.PRICE_TOTAL_LABEL )
	self:SetLayerVisible( false, self.layers.PRICE_TOTAL_VAL )
	self:SetLayerVisible( false, self.layers.COUNT_LABEL )
	self:SetLayerVisible( false, self.layers.ITEM_EQUIPPED_WARNING )
	self:SetLayerVisible( false, self.layers.BUNDLE_CONTENT_COLLECTED )
	self:SetLayerVisible( false, self.layers.CRAFTED_SHIP_SELL_WARNING )

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.CAPTION )

	self.priceUnitMetaText:SetText( "", true )
	self.priceTotalMetaText:SetText( "", true )	

	self.itemIcoWnd:Reset()

	self:RemoveControl( self.countSlider, self.layers.WORK_EFFECT )
	self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( self.tradeBtn, self.layers.WORK_EFFECT )

end


--
function UI.TradeWnd:FullUpdate()

	if not self.item then
		return
	end

	self:UpdateTradeData()
	
	self:UpdateName()
	self:UpdateItemIco()
	self:UpdateShipTypeAndTier()
	self:UpdatePriceTotal()

	if self.mode == self.modes.STACK then
		self:UpdatePriceUnit()
		self:UpdateCount()
	end

	self:UpdateTradeBtnState()
	self:UpdateTradeBtnText()
	self:UpdateCaption()
	self:UpdateRefillMoneyBtn()
	self:UpdateItemEquippedWarning()
	self:UpdateBundleContentCollected()
	self:UpdateCraftedShipSellWarning()

end


--
function UI.TradeWnd:UpdateTradeBtnText()

	local strId = ""

	if self.tradeMode == self.tradeModes.BUY then

		if UI:IsDefBlueprint( self.item.defName ) then
			strId = "itemCraft_learnBtn"

		elseif self.bBuyForShipParts then
			strId = "shipsTree_buyForResourceBtn"

		else
			strId = "shop_buy"
		end

	elseif self.tradeMode == self.tradeModes.SELL then

		if UI:IsDefShip( self.item.defName ) and UI:IsShipCraftable( self.item.defName ) then
			strId = "popUpMenu_sellCraftedShip"
		else
			strId = "shop_sell"
		end

	end

	self.tradeBtn:SetBtnText( UI:GetStringByName( strId ) )

end


--
function UI.TradeWnd:UpdateCaption()

	local strId = ""

	if self.tradeMode == self.tradeModes.BUY then

		if UI:IsDefBlueprint( self.item.defName ) then
			strId = "itemCraft_learnConfirm_caption"

		elseif self.bBuyForShipParts then
			strId = "shop_buyDialog_caption_buyForResource"

		else
			strId = "shop_buyDialog_captionBuy"
		end

	elseif self.tradeMode == self.tradeModes.SELL then

		if UI:IsDefShip( self.item.defName ) and UI:IsShipCraftable( self.item.defName ) then
			strId = "shop_buyDialog_captionSellCraftedShip"
		else
			strId = "shop_buyDialog_captionSell"
		end
	end

	local str = ""
	if strId ~= "" then
		str = UI:GetStringByName( strId )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.TradeWnd:UpdateName() 

	local text = ""

	if self.tradeMode == self.tradeModes.BUY and UI:IsDefBlueprint( self.item.defName ) then		

    	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( self.item.defName )
    	if craftResultDefName ~= "" then

    		text = UI:GetEntityLocalizedNameByDef( craftResultDefName, true, false, true, true )

        	if craftResultCount > 1 then

        		local strCraftResultCount = string.format( "(%d %s)", craftResultCount, UI:GetStringByName( "equipment_itemsUnits" ) )

    			local baseColor = self:GetColor( self.layers.NAME )
    			local strBaseColor = UI:Color2Str( baseColor )

    			text = string.format( "%s %s%s", text, strBaseColor, strCraftResultCount )

        	end

    	else
    		sys.log( "UI.TradeWnd:UpdateName()[ERROR]: cannot find craft result for blueprint \"%s\"", self.item.defName )
    	end

	elseif self.tradeMode == self.tradeModes.BUY and self.bBuyForShipParts then

		local baseColor = self:GetColor( self.layers.NAME )
    	local strBaseColor = UI:Color2Str( baseColor )

		local strName = UI:GetEntityLocalizedNameByDef( self.item.defName, true, false, true, true )
    	strName = string.format( "%s%s", strName, strBaseColor )

		text = UI:GetStringByName( "shop_buyDialog_text_buyForResource" )

		local numSubst = 0
		text, numSubst = string.gsub( text, "%$name%$", strName )

		if numSubst == 0 then
			sys.log( "UI.TradeWnd:UpdateName()[ERROR]: cannot find placeholder \"$name$\" in string \"shop_buyDialog_text_buyForResource\"" )
			text = string.format( "[INVALID STRING]Building ship %s from parts", strName )
		end

	else

		text = UI:GetEntityLocalizedNameByDef( self.item.defName, true, false, true, true )
		text = string.gsub( text, "|" , " " )

	end

	self:SetText( text, self.layers.NAME )

end


--
function UI.TradeWnd:UpdateItemIco()

	local defName = self.item.defName

	if self.tradeMode == self.tradeModes.BUY and UI:IsDefBlueprint( self.item.defName ) then		
		local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( self.item.defName )
		defName = craftResultDefName
	end

	local bEnchanted = false

	if self.tradeMode == self.tradeModes.SELL then		
		if self.item.iids then
			local idx, iid = next( self.item.iids )
			if iid then
				bEnchanted = UI:IsInventoryItemEnchantedById( iid )
			end
		end
	end

	self.itemIcoWnd:SetupForItem( defName, bEnchanted )
	
end


--
function UI.TradeWnd:UpdateShipTypeAndTier()

	local defName = self.item.defName

	if self.tradeMode == self.tradeModes.BUY and UI:IsDefBlueprint( self.item.defName ) then		
		local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( self.item.defName )
		defName = craftResultDefName
	end
	
	self.itemIcoWnd:SetupRank( defName, true, nil )

end


--
function UI.TradeWnd:UpdatePriceUnit()

	if self.mode == self.modes.SIMPLE then
		return
	end

	self:SetLayerVisible( true, self.layers.PRICE_UNIT_LABEL )
	self:UpdatePriceUnitInternal( self.tradeData.price, self.tradeData.playerMoney, self.tradeData.priceType, self.layers.PRICE_UNIT_EFFECT, self.layers.PRICE_UNIT_VAL, self.priceUnitMetaText, false )

end


--
function UI.TradeWnd:UpdateCount()

	if self.mode == self.modes.SIMPLE then
		return
	end

	self:SetLayerVisible( true, self.layers.COUNT_LABEL )
	self:AddChild( self.countSlider )

	self.countSlider:SetMin( 0 )
	self.countSlider:SetMax( self.tradeData.maxCount )

	local defaultCount = self.tradeMode == self.tradeModes.BUY and 1 or self.tradeData.maxCount
	self.countSlider:SetVal( defaultCount  )

end


--
function UI.TradeWnd:UpdatePriceTotal()

	local defaultCount = self.tradeMode == self.tradeModes.BUY and 1 or self.tradeData.maxCount
	self:UpdatePriceTotalForCount( defaultCount )

	if self.mode == self.modes.STACK then
		self:SetLayerVisible( true, self.layers.PRICE_TOTAL_LABEL )
	end

end   


--
function UI.TradeWnd:UpdatePriceTotalForCount( count )

	if self.tradeMode == self.tradeModes.BUY and self.bBuyForShipParts then
		self.priceTotalMetaText:SetText( "", true )
	else
		local bAllowColor = self.tradeMode == self.tradeModes.BUY
		self:UpdatePriceUnitInternal( self.tradeData.price * count, self.tradeData.playerMoney, self.tradeData.priceType, self.layers.PRICE_TOTAL_EFFECT, self.layers.PRICE_TOTAL_VAL, self.priceTotalMetaText, bAllowColor )
	end

end


--
function UI.TradeWnd:UpdateTradeBtnState()	

	local bEnable = false

	local count = self:GetCount()
	if count > 0 then

    	if self.tradeMode == self.tradeModes.BUY then
    		bEnable = self.item ~= nil and self:IsEnoughMoney()

    	elseif self.tradeMode == self.tradeModes.SELL then
    		bEnable = self.item ~= nil
    	end

	end

	if bEnable then

    	self:AddControl( self.tradeBtn, self.layers.WORK_EFFECT, self.effectInfo.work.tradeBtnObjName )
		self.tradeBtn:Enable( true )

	else

		if self:NeedRefillMoneyBtn() then
			self:RemoveControl( self.tradeBtn, self.layers.WORK_EFFECT )
		else
    		self:AddControl( self.tradeBtn, self.layers.WORK_EFFECT, self.effectInfo.work.tradeBtnObjName )
			self.tradeBtn:Enable( false )
		end

	end

end


--
function UI.TradeWnd:UpdatePriceUnitInternal( price, playerMoney, priceType, mainLayer, valLayer, metaText, bAllowColor )

	self:SetLayerVisible( true, valLayer )	

	local priceInfo = {}

	priceInfo.priceType 	= priceType
	priceInfo.val			= price
	priceInfo.bIsBuyPrice	= self.tradeMode == self.tradeModes.BUY

	if priceInfo.bIsBuyPrice then
		priceInfo.basePrice = price
	end

	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( valLayer ), false, true, true, playerMoney )
	metaText:SetText( strPrice, true )

end


--
function UI.TradeWnd:UpdateTradeData()

	self:ResetTradeData()

	if self.tradeMode == self.tradeModes.BUY then

		-- #0036543, комм.(0132906) - у кораблей и бустеров не будет двойной цены,
		-- поэтому окна для кораблей и бустеров не поддерживают двойную цену

		if UI:IsDefShip( self.item.defName ) then
			local bGold = false
			self.tradeData.price, bGold = UI:GetShopBuyPrice( self.item, false, true )
			self.tradeData.priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS

		elseif UI:IsDefBundle( self.item.defName ) then
			self.tradeData.price, self.tradeData.priceType = UI:GetBundleRealBuyPrice( self.item )
			
		else
			self.tradeData.priceType, self.tradeData.price = UI:GetShopSmartBuyPriceOne( self.item )
		end

    	if self.mode == self.modes.STACK then
    	
        	self.tradeData.maxCount = self.MAX_COUNT
        	self.tradeData.maxPrice = self.tradeData.price * self.tradeData.maxCount

        	if self.tradeData.maxPrice > self.MAX_TOTAL_PRICE then
        		self.tradeData.maxPrice = self.MAX_TOTAL_PRICE
        		self.tradeData.maxCount = math.floor( self.tradeData.maxPrice / self.tradeData.price )		
        	end

    	else
    		self.tradeData.maxPrice = self.tradeData.price
    	end

	else

		self.tradeData.price = self.sellPrice or UI:GetShopSellPriceByDef( self.item.defName )

		self.tradeData.priceType = _G.GameStore.CreditsType.CT_CREDITS

		self.tradeData.maxCount	= math.min( self.item.count, self.MAX_COUNT )
		self.tradeData.maxPrice	= self.tradeData.maxCount * self.tradeData.price
		
	end	

	self.tradeData.playerMoney = 0

	if self.tradeData.priceType == _G.GameStore.CreditsType.CT_TOKENS then
		self.tradeData.playerMoney = UI:GetPlayerTokens()

	elseif self.tradeData.priceType == _G.GameStore.CreditsType.CT_EVENT then
		self.tradeData.playerMoney = UI:GetPlayerEventCredits()

	else
		self.tradeData.playerMoney = UI:GetPlayerMoney( self.tradeData.priceType == _G.GameStore.CreditsType.CT_GOLD )
	end	

end


--
function UI.TradeWnd:ResetTradeData()

    self.tradeData =
    {
    	price			= 0,
    	priceType		= -1,
    	maxCount		= 1,
    	maxPrice		= 0,
    	playerMoney		= 0,
    }

end


--
function UI.TradeWnd:OnCountChanged()

	if self.mode == self.modes.SIMPLE then
		return
	end

	self:UpdatePriceTotalForCount( self:GetCount() )
	self:UpdateTradeBtnState()

end


--
function UI.TradeWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.tradeBtn then

		if self.tradeMode == self.tradeModes.BUY then
			self:Buy()
		elseif self.tradeMode == self.tradeModes.SELL then	
			self:Sell()
		end

	elseif wnd == self.crossBtn then
		self:Cancel()

	elseif wnd == self.refillMoneyBtn then
		self:OnRefillMoney()
	end

	return true

end


--
function UI.TradeWnd:OnRefillMoney()

	local moneyMode = self.refillMoneyBtn:GetMode()

	if moneyMode == UI.RefillMoneyBtn.modes.CREDITS then
		UI.HangarWnd:ShowBuyCreditsWnd()

	elseif moneyMode == UI.RefillMoneyBtn.modes.GOLD then
		UI.HangarWnd:ShowBuyGoldWnd()

	else
		sys.log( "UI.TradeWnd:RefillMoney()[ERROR]: invalid refil money mode: %s", tostring( moneyMode ) )
	end

end


--
function UI.TradeWnd:OnEnter( key, controllerIdx )

	if not self.item then
		return true
	end

	local count = self:GetCount()
	if count == 0 then
		return true
	end

	if self.tradeMode == self.tradeModes.BUY then

    	if self:IsEnoughMoney() then
    		self:Buy()

    	else

    		local msg = UI:GetStringByName( "msg_buyError" )

    		local resultStr = UI:GetStringByName( "buyError_SBR_CANT_AFFORD" )    		
    		msg = string.format( msg, resultStr )

    		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

    	end

	elseif self.tradeMode == self.tradeModes.SELL then
	    self:Sell()
	end

	return true

end


--
function UI.TradeWnd:OnEscape()

	self:Cancel()
	return true

end


--
function UI.TradeWnd:Cancel()

	UI:PlayGlobalSound( self.sounds.tradeWndHide )
	self:Hide()

	local mainWnd = UI[ self.mainWndName ]
	if mainWnd and mainWnd.OnTradeResult_Cancel then
		mainWnd:OnTradeResult_Cancel()
	end

end


--
function UI.TradeWnd:Buy()

	UI:PlayGlobalSound( self.sounds.tradeWndBuy )

	self:Hide()

	local mainWnd = UI[ self.mainWndName ]
	if mainWnd and mainWnd.OnTradeResult_Buy then
		mainWnd:OnTradeResult_Buy( self.item, self:GetCount(), self.tradeData.priceType, self.bBuyForShipParts )
	end

end	


--
function UI.TradeWnd:Sell()

	UI:PlayGlobalSound( self.sounds.tradeWndSell )

	self:Hide()

	local mainWnd = UI[ self.mainWndName ]
	if mainWnd and mainWnd.OnTradeResult_Sell then
		mainWnd:OnTradeResult_Sell( self.item, self:GetCount() )
	end

end	


--
function UI.TradeWnd:GetCount()

	return self.mode == self.modes.SIMPLE and 1 or self.countSlider:GetVal()

end


--
function UI.TradeWnd:IsEnoughMoney()

	if self.tradeMode == self.tradeModes.BUY then

		if self.bBuyForShipParts then

			local bEnoughShipParts = false

			if UI:IsDefShip( self.item.defName ) then
				bEnoughShipParts = UI:IsEnoughShipPartsForShip( self.item.defName )
			else
				sys.log( "UI.TradeWnd:IsEnoughMoney()[ERROR]: \"%s\" is not ship", self.item.defName )
			end

			return bEnoughShipParts

		else
			return self.tradeData.price * self:GetCount() <= self.tradeData.playerMoney	
		end

	else
		return true
	end

end


--
function UI.TradeWnd:F_OnEventSliderChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender ~= self.countSlider:GetUiHandle() then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnCountChanged()

end


--
function UI.TradeWnd:UpdateRefillMoneyBtn()

	local bNeedBtn, mode = self:NeedRefillMoneyBtn()

	if not bNeedBtn then
		self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )
	else
		self:AddControl( self.refillMoneyBtn, self.layers.WORK_EFFECT, self.effectInfo.work.refillMoneyBtnObjName )
		self.refillMoneyBtn:Setup( mode )
	end

end


--
function UI.TradeWnd:NeedRefillMoneyBtn()
	
    if not self:IsEnoughMoney()
		and not( self.tradeMode == self.tradeModes.BUY and self.bBuyForShipParts )
		and ( self.tradeData.priceType == _G.GameStore.CreditsType.CT_GOLD or self.tradeData.priceType == _G.GameStore.CreditsType.CT_CREDITS ) then
			return true, self.tradeData.priceType == _G.GameStore.CreditsType.CT_GOLD and UI.RefillMoneyBtn.modes.GOLD or UI.RefillMoneyBtn.modes.CREDITS
	else
		return false
	end

end


--
function UI.TradeWnd:UpdateItemEquippedWarning()

	self:SetLayerVisible( false, self.layers.ITEM_EQUIPPED_WARNING )

	if self.tradeMode ~= self.tradeModes.SELL then
		return
	end

	if not self.item.equipShipItem then
		return
	end

	self:SetLayerVisible( true, self.layers.ITEM_EQUIPPED_WARNING )

	local baseColor = UI.PARAM_DELTA_MINUS_COLOR
	local shipColor = UI:GetItemColor( self.item.equipShipItem.defName )

	local strShip = string.format( "%s%s%s", UI:Color2Str( shipColor ), self.item.equipShipItem.localizedName, UI:Color2Str( baseColor ) )

	local text = UI:GetStringByName( "shop_buyDialog_itemEquipped" )	
	text = string.gsub( text, "%$ship%$", strShip )
	text = string.format( "%s%s", UI:Color2Str( baseColor ), text )

	self:SetText( text, self.layers.ITEM_EQUIPPED_WARNING )	

end


--
function UI.TradeWnd:UpdateBundleContentCollected()

	local bShowText = UI:IsDefBundle( self.item.defName ) and UI:IsBundleContentCollected( self.item.defName )
	self:SetLayerVisible( bShowText, self.layers.BUNDLE_CONTENT_COLLECTED )

end


--
function UI.TradeWnd:UpdateCraftedShipSellWarning()

	local bVisible = self.tradeMode == self.tradeModes.SELL and UI:IsDefShip( self.item.defName ) and UI:IsShipCraftable( self.item.defName )
	self:SetLayerVisible( bVisible, self.layers.CRAFTED_SHIP_SELL_WARNING )	

end


--
function UI.TradeWnd:OnAccountAurasChanged()

	self:UpdateTradeData()
	self:UpdatePriceTotal()
	self:UpdatePriceUnit()
	self:UpdateCount()
	self:UpdateTradeBtnState()
	self:UpdateRefillMoneyBtn()

end


--
function UI.TradeWnd:OnResourcesChanged()

	if self.tradeMode == self.tradeModes.BUY and self.bBuyForShipParts then
		self:UpdateTradeBtnState()
	end

end


-- ------------------------------------------------------------------------
-- UI.Trade_TradeBtn
-- ------------------------------------------------------------------------

UI.Trade_TradeBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "MsgBox_Btn",

    	props =
    	{
    		name			= "Trade_TradeBtn",
			isPrototype		= true,
    	},
    },

    --
    SetBtnText = function( self, text )

    	self:SetText( text, self.layers.TEXT )

    end
}


-- ------------------------------------------------------------------------
-- UI.Trade_CancelBtn
-- ------------------------------------------------------------------------

UI.Trade_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Trade_CancelBtn",
			isPrototype		= true,
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^cancel",
   			},
   		}
	},
}

-- ------------------------------------------------------------------------
-- UI.Trade_CountSliderWnd
-- ------------------------------------------------------------------------

UI.Trade_CountSliderWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "Slider1Wnd",

    	props =
    	{
    		name	= "Trade_CountSliderWnd",
			isPrototype		= true,
    	},
    }
}