-- ----------------------------------------------------------------------------
--
-- Workfile: buywithinventorywnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.BuyWithInventoryWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.BuyWithInventoryWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "BuyWithInventoryWnd",
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
						layer		= "UI.BuyWithInventoryWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.BuyWithInventoryWnd.layers.WORK_EFFECT",
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
				defName 			= "tradeWithInventory_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.BuyWithInventoryWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- один и тот же уровень линкуется по позиции к одному локатору, а по всему остальному - к другому, это не ошибка - так задумано
					{
						objName		= "product_name",	
						layer		= "UI.BuyWithInventoryWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- один и тот же уровень линкуется по позиции к одному локатору, а по всему остальному - к другому, это не ошибка - так задумано
					{
						objName		= "fraction",	
						layer		= "UI.BuyWithInventoryWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",	
						layer		= "UI.BuyWithInventoryWnd.layers.TEXT_INVENTORY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price_once",	
						layer		= "UI.BuyWithInventoryWnd.layers.PRICE_EFFECT_1",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price_once_2",	
						layer		= "UI.BuyWithInventoryWnd.layers.PRICE_EFFECT_2",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price_once_3",	
						layer		= "UI.BuyWithInventoryWnd.layers.PRICE_EFFECT_3",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_1",	
						layer		= "UI.BuyWithInventoryWnd.layers.BUNDLE_CONTENT_COLLECTED",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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

		-- ITEM_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TEXT_INVENTORY
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_EFFECT_1
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
						layer		= "UI.BuyWithInventoryWnd.layers.PRICE_VAL_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_EFFECT_2
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
						layer		= "UI.BuyWithInventoryWnd.layers.PRICE_VAL_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_EFFECT_3
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
						layer		= "UI.BuyWithInventoryWnd.layers.PRICE_VAL_3",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL_1
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_VAL_2
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_VAL_3
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
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
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.BuyWithInventoryWnd:Setup( item, inventoryLevels, bBuyForShipParts, autogenInventoryLevels )

	self:Reset()

	self.item					= item
	self.inventoryLevels		= inventoryLevels or {}
	self.autogenInventoryLevels	= autogenInventoryLevels or {}
	self.bBuyForShipParts		= bBuyForShipParts or false

	self:FullUpdate()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdateOkBtnState()
	self:UpdateRefillMoneyBtn()

end   


--
function UI.BuyWithInventoryWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.BuyWithInventoryWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.BuyWithInventoryWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.BuyWithInventoryWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.BuyWithInventoryWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

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

UI.BuyWithInventoryWnd.layers =
{
    MAIN_EFFECT					= 0,
    BG_EFFECT					= 1,
    WORK_EFFECT					= 2,
    CAPTION						= 3,
    ITEM_NAME					= 4,
    TEXT_INVENTORY				= 5,
    PRICE_EFFECT_1				= 6,
    PRICE_EFFECT_2				= 7,
    PRICE_EFFECT_3				= 8,
    PRICE_VAL_1					= 9,
    PRICE_VAL_2					= 10,
    PRICE_VAL_3					= 11,
	BUNDLE_CONTENT_COLLECTED	= 12,
}

UI.BuyWithInventoryWnd.effectInfo =
{
	work =
	{
		itemIcoObjName			= "icon",
		okBtnObjName			= "button_2",
		crossBtnObjName    		= "btn_x",
		refillMoneyBtnObjName	= "button_2",
	},
}

UI.BuyWithInventoryWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
	buy		= "sound/ui/apply",
}

UI.BuyWithInventoryWnd.mainWndName	= ""

-- -------------------------------------
-- vars
-- -------------------------------------

UI.BuyWithInventoryWnd.item						= ""
UI.BuyWithInventoryWnd.inventoryLevels			= {}
UI.BuyWithInventoryWnd.autogenInventoryLevels	= {}
UI.BuyWithInventoryWnd.bBuyForShipParts			= false
UI.BuyWithInventoryWnd.okBtn					= nil
UI.BuyWithInventoryWnd.crossBtn					= nil
UI.BuyWithInventoryWnd.refillMoneyBtn			= nil
UI.BuyWithInventoryWnd.icoWnd					= nil
UI.BuyWithInventoryWnd.invMetaText				= nil
UI.BuyWithInventoryWnd.priceMetaText1			= nil
UI.BuyWithInventoryWnd.priceMetaText2			= nil
UI.BuyWithInventoryWnd.priceMetaText3			= nil
	
-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.BuyWithInventoryWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.invMetaText = UI.MetaText.GetNewInstance()
	self.invMetaText:InitFromLayer( self, self.layers.TEXT_INVENTORY ) 	

	self.priceMetaText1	= UI.MetaText.GetNewInstance()
	self.priceMetaText1:InitFromLayer( self, self.layers.PRICE_VAL_1 ) 	

	self.priceMetaText2	= UI.MetaText.GetNewInstance()
	self.priceMetaText2:InitFromLayer( self, self.layers.PRICE_VAL_2 ) 	

	self.priceMetaText3	= UI.MetaText.GetNewInstance()
	self.priceMetaText3:InitFromLayer( self, self.layers.PRICE_VAL_3 ) 	
	
	UI:AddOverlayWnd( self:GetScriptTableName() )

end


--
function UI.BuyWithInventoryWnd:F_Shutdown()

	if self.invMetaText then
		self.invMetaText:Clear()
	end

	if self.priceMetaText1 then
		self.priceMetaText1:Clear()
	end

	if self.priceMetaText2 then
		self.priceMetaText2:Clear()
	end

	if self.priceMetaText3 then
		self.priceMetaText3:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BuyWithInventoryWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.BuyWithInventoryWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BuyWithInventoryWnd:UpdateMetaTextPos()

	self.invMetaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT_INVENTORY )
	self.priceMetaText1:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_1 )
	self.priceMetaText2:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_2 )
	self.priceMetaText3:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_3 )

end


--
function UI.BuyWithInventoryWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT_INVENTORY then
		self.invMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_VAL_1 then
		self.priceMetaText1:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_VAL_2 then
		self.priceMetaText2:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_VAL_3 then
		self.priceMetaText3:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BuyWithInventoryWnd:CreateControls()

	self.icoWnd			= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.okBtn			= UI:CreateChildWnd( self, UI.MsgBox_Btn, "ok" )
	self.crossBtn		= UI:CreateChildWnd( self, UI.CrossBtn, "" )
	self.refillMoneyBtn	= UI:CreateChildWnd( self, UI.RefillMoneyBtn, "" )

	self:AddControl( self.icoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.itemIcoObjName )
	self:AddControl( self.crossBtn, self.layers.WORK_EFFECT, self.effectInfo.work.crossBtnObjName )

end


--
function UI.BuyWithInventoryWnd:Reset()

	self.item					= nil
	self.inventoryLevels		= {}
	self.autogenInventoryLevels	= {}
	self.bBuyForShipParts		= false

	self.icoWnd:Reset()

	self:RemoveControl( self.okBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )

	self:SetText( "", self.layers.ITEM_NAME )
	self.invMetaText:SetText( "", true )
	self:SetText( "", self.layers.CAPTION )	

	self:SetLayerVisible( false, self.layers.PRICE_EFFECT_1 )
	self:SetLayerVisible( false, self.layers.PRICE_EFFECT_2 )
	self:SetLayerVisible( false, self.layers.PRICE_EFFECT_3 )
	self:SetLayerVisible( false, self.layers.PRICE_VAL_1 )
	self:SetLayerVisible( false, self.layers.PRICE_VAL_2 )
	self:SetLayerVisible( false, self.layers.PRICE_VAL_3 )
	self:SetLayerVisible( false, self.layers.BUNDLE_CONTENT_COLLECTED )

	self.priceMetaText1:SetText( "", true )
	self.priceMetaText2:SetText( "", true )
	self.priceMetaText3:SetText( "", true )

end


--
function UI.BuyWithInventoryWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.BuyWithInventoryWnd:RemoveControl( wnd, effectLayer )

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
function UI.BuyWithInventoryWnd:FullUpdate()

	if not self.item then
		return
	end

	self:UpdateCaption()
	self:UpdateItemName()
	self:UpdateItemIco()
	self:UpdatePrice()
	self:UpdateInventoryText()
	self:UpdateOkBtnText()
	self:UpdateOkBtnState()
	self:UpdateRefillMoneyBtn()
	self:UpdateBundleContentCollected()

end


--
function UI.BuyWithInventoryWnd:UpdateCaption()

	local strCaption = ""

	if self.bBuyForShipParts then
		strCaption = UI:GetStringByName( "shop_buyDialog_caption_buyForResource" )
	else
		strCaption = UI:GetStringByName( "shop_buyDialog_captionBuy" )
	end

	self:SetText( strCaption, self.layers.CAPTION )	

end


--
function UI.BuyWithInventoryWnd:UpdateItemName() 

	local text = ""

	if self.bBuyForShipParts then

		local baseColor = self:GetColor( self.layers.ITEM_NAME )
    	local strBaseColor = UI:Color2Str( baseColor )

		local strName = UI:GetEntityLocalizedNameByDef( self.item.defName, true, false, true, true )
    	strName = string.format( "%s%s", strName, strBaseColor )

		text = UI:GetStringByName( "shop_buyDialog_text_buyForResource" )

		local numSubst = 0
		text, numSubst = string.gsub( text, "%$name%$", strName )

		if numSubst == 0 then
			sys.log( "UI.BuyWithInventoryWnd:UpdateItemName()[ERROR]: cannot find placeholder \"$name$\" in string \"shop_buyDialog_text_buyForResource\"" )
			text = string.format( "[INVALID STRING]Building ship %s from parts", strName )
		end

	else
		text = UI:GetEntityLocalizedNameByDef( self.item.defName, true, false )
	end

	self:SetText( text, self.layers.ITEM_NAME )

end


--
function UI.BuyWithInventoryWnd:UpdateItemIco()

	self.icoWnd:SetupForItem( self.item.defName )

end


--
function UI.BuyWithInventoryWnd:UpdatePrice()

	local priceInv_credits, priceInv_gold = self:GetInventoryPrice()
	local priceAutogenInv_credits, priceAutogenInv_gold = self:GetAutogenInventoryPrice()

	local priceItem			= 0
	local priceType			= -1

	if not self.bBuyForShipParts then
		priceItem, priceType = self:GetItemPrice()
	end

	local priceItem_credits			= priceType == _G.GameStore.CreditsType.CT_CREDITS and priceItem or 0
	local priceItem_gold			= priceType == _G.GameStore.CreditsType.CT_GOLD and priceItem or 0
	local priceItem_tokens			= priceType == _G.GameStore.CreditsType.CT_TOKENS and priceItem or 0	
	local priceItem_eventCredits	= priceType == _G.GameStore.CreditsType.CT_EVENT and priceItem or 0	

	local price_credits			= priceInv_credits + priceItem_credits + priceAutogenInv_credits
	local price_gold			= priceItem_gold + priceInv_gold + priceAutogenInv_gold
	local price_tokens			= priceItem_tokens
	local price_eventCredits	= priceItem_eventCredits

	local slotIdx = 1

	if price_credits ~= 0 then

		local mainLayer	= self.layers.PRICE_EFFECT_1 + slotIdx - 1
		local valLayer	= self.layers.PRICE_VAL_1 + slotIdx - 1

		self:SetLayerVisible( true, mainLayer )
		self:SetLayerVisible( true, valLayer )

		local metaTextName = string.format( "priceMetaText%d", slotIdx )
		local metaText = self[ metaTextName ]

		local creditsPriceInfo = {}

		creditsPriceInfo.priceType 		= _G.GameStore.CreditsType.CT_CREDITS
		creditsPriceInfo.val			= price_credits
		creditsPriceInfo.bIsBuyPrice	= true
		creditsPriceInfo.basePrice		= price_credits

		local strPriceCredits = UI:PriceInfo2Str( creditsPriceInfo, self:GetColor( valLayer ), false, true, true, nil )
		metaText:SetText( strPriceCredits, true )

		slotIdx = slotIdx + 1

	end

	if price_gold ~= 0 then

		local mainLayer	= self.layers.PRICE_EFFECT_1 + slotIdx - 1
		local valLayer	= self.layers.PRICE_VAL_1 + slotIdx - 1

		self:SetLayerVisible( true, mainLayer )
		self:SetLayerVisible( true, valLayer )

		local metaTextName = string.format( "priceMetaText%d", slotIdx )
		local metaText = self[ metaTextName ]

		local goldPriceInfo = {}

		goldPriceInfo.priceType 	= _G.GameStore.CreditsType.CT_GOLD
		goldPriceInfo.val			= price_gold
		goldPriceInfo.bIsBuyPrice	= true
		goldPriceInfo.basePrice		= price_gold

		local strPriceGold = UI:PriceInfo2Str( goldPriceInfo, self:GetColor( valLayer ), false, true, true, nil )
		metaText:SetText( strPriceGold, true )

	end

	if price_tokens ~= 0 then

		local mainLayer	= self.layers.PRICE_EFFECT_1 + slotIdx - 1
		local valLayer	= self.layers.PRICE_VAL_1 + slotIdx - 1

		self:SetLayerVisible( true, mainLayer )
		self:SetLayerVisible( true, valLayer )

		local metaTextName = string.format( "priceMetaText%d", slotIdx )
		local metaText = self[ metaTextName ]

		local tokensPriceInfo = {}

		tokensPriceInfo.priceType 	= _G.GameStore.CreditsType.CT_TOKENS
		tokensPriceInfo.val			= price_tokens
		tokensPriceInfo.bIsBuyPrice	= true
		tokensPriceInfo.basePrice	= price_tokens

		local strPriceTokens = UI:PriceInfo2Str( tokensPriceInfo, self:GetColor( valLayer ), false, true, true, nil )
		metaText:SetText( strPriceTokens, true )

		slotIdx = slotIdx + 1

	end

	if price_eventCredits ~= 0 then

		local mainLayer	= self.layers.PRICE_EFFECT_1 + slotIdx - 1
		local valLayer	= self.layers.PRICE_VAL_1 + slotIdx - 1

		self:SetLayerVisible( true, mainLayer )
		self:SetLayerVisible( true, valLayer )

		local metaTextName = string.format( "priceMetaText%d", slotIdx )
		local metaText = self[ metaTextName ]

		local eventCreditsPriceInfo = {}

		eventCreditsPriceInfo.priceType 	= _G.GameStore.CreditsType.CT_EVENT
		eventCreditsPriceInfo.val			= price_eventCredits
		eventCreditsPriceInfo.bIsBuyPrice	= true
		eventCreditsPriceInfo.basePrice		= price_eventCredits

		local strPriceEventCredits = UI:PriceInfo2Str( eventCreditsPriceInfo, self:GetColor( valLayer ), false, true, true, nil )
		metaText:SetText( strPriceEventCredits, true )

		slotIdx = slotIdx + 1

	end

end


--
function UI.BuyWithInventoryWnd:GetInventoryPrice()

	local price_credits = 0
	local price_gold = 0

	for idx, level in pairs( self.inventoryLevels ) do

		if level <= UI:GetInventoryMaxLevel() then
			local levelPrice, bGold = UI:GetInventoryPriceForLevel( level )

			if bGold then
				price_gold = price_gold + levelPrice
			else
				price_credits = price_credits + levelPrice
			end
		end

	end

	return price_credits, price_gold

end


--
function UI.BuyWithInventoryWnd:GetAutogenInventoryPrice()

	local price_credits = 0
	local price_gold = 0

	for idx, level in pairs( self.autogenInventoryLevels ) do

		if level <= UI:GetAutogenInventoryMaxLevel() then
			local levelPrice, bGold = UI:GetAutogenInventoryPriceForLevel( level )

			if bGold then
				price_gold = price_gold + levelPrice
			else
				price_credits = price_credits + levelPrice
			end
		end

	end

	return price_credits, price_gold

end


--
function UI.BuyWithInventoryWnd:GetItemPrice()

	local price = 0
	local priceType = -1

	-- #0036543, комм.(0132906) - у кораблей и бустеров не будет двойной цены,
	-- поэтому окна для кораблей и бустеров не поддерживают двойную цену

	if UI:IsDefShip( self.item.defName ) then
		local bGold = false
		price, bGold = UI:GetShopBuyPrice( self.item, false, true )
		priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS

	elseif UI:IsDefBundle( self.item.defName ) then
		price, priceType = UI:GetBundleRealBuyPrice( self.item )

	else
		priceType, price = UI:GetShopSmartBuyPriceOne( self.item )
	end

	return price, priceType

end


--
function UI.BuyWithInventoryWnd:UpdateInventoryText()

	local strBaseColor	= UI:Color2Str( self:GetColor( self.layers.TEXT_INVENTORY ) )
	local strSelColor	= UI:Color2Str( UI.TEXT_SEL_COLOR )
	
	local msg = ""


	-- обычный инвентарь
	
	if next( self.inventoryLevels ) then
	
		local msgInv = UI:GetStringByName( "buyInventoryAndItem" )
	
		-- количество
		local countToBuy = 0

		for idx, level in pairs( self.inventoryLevels ) do

			if level <= UI:GetInventoryMaxLevel() then					

				local countOnLevel = UI:GetInventoryMaxSizeForLevel( level )
				local countOnPrevLevel = UI:GetInventoryMaxSizeForLevel( level - 1 )

				local levelCountToBuy = countOnLevel - countOnPrevLevel

				countToBuy = countToBuy + levelCountToBuy
				
			end

		end

		if countToBuy == 0 then
			sys.log( "UI.BuyWithInventoryWnd:UpdateInventoryText()[ERROR]: no inventory levels to buy" )
		end

		local strCount = string.format( "%s%s%s", strSelColor, UI:Num2StrSeparatedBy3( countToBuy ), strBaseColor )

		-- цена
		local price_credits, price_gold = self:GetInventoryPrice()
		
		local priceInfos = {}
		
		if price_gold ~= 0 then
		
			local goldPriceInfo =
			{
				priceType	= _G.GameStore.CreditsType.CT_GOLD,
				val			= price_gold,
				bIsBuyPrice	= true,
				basePrice	= price_gold,
			}
			
			table.insert( priceInfos, goldPriceInfo )
			
		end
		
		if price_credits ~= 0 or ( price_credits == 0 and price_gold == 0 ) then
		
			local creditsPriceInfo =
			{
				priceType	= _G.GameStore.CreditsType.CT_CREDITS,
				val			= price_credits,
				bIsBuyPrice	= true,
				basePrice	= price_credits,
			}
			
			table.insert( priceInfos, creditsPriceInfo )

		end
		
		local strPrice = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.TEXT_INVENTORY ), false, false, true, nil, ", " )

		-- все вместе
		local tSubst =
		{
			slots	= strCount,
			price	= strPrice,
		}
		msgInv = string.gsub( msgInv, "%$(.-)%$", tSubst )
		
		msg = string.format( "%s%s%s", msg, msg ~= "" and "|" or "", msgInv )
		
	end
	
	
	-- автогенный инвентарь

	if next( self.autogenInventoryLevels ) then
	
		local msgAutogen = UI:GetStringByName( "buyAutogenInventoryAndItem" )
	
		-- количество
		local countToBuy = 0

		for idx, level in pairs( self.autogenInventoryLevels ) do

			if level <= UI:GetAutogenInventoryMaxLevel() then					

				local countOnLevel = UI:GetAutogenInventoryMaxSizeForLevel( level )
				local countOnPrevLevel = UI:GetAutogenInventoryMaxSizeForLevel( level - 1 )

				local levelCountToBuy = countOnLevel - countOnPrevLevel

				countToBuy = countToBuy + levelCountToBuy
				
			end

		end

		if countToBuy == 0 then
			sys.log( "UI.BuyWithInventoryWnd:UpdateInventoryText()[ERROR]: no autogen inventory levels to buy" )
		end

		local strCount = string.format( "%s%s%s", strSelColor, UI:Num2StrSeparatedBy3( countToBuy ), strBaseColor )

		-- цена
		local price_credits, price_gold = self:GetAutogenInventoryPrice()
		
		local priceInfos = {}
		
		if price_gold ~= 0 then
		
			local goldPriceInfo =
			{
				priceType	= _G.GameStore.CreditsType.CT_GOLD,
				val			= price_gold,
				bIsBuyPrice	= true,
				basePrice	= price_gold,
			}
			
			table.insert( priceInfos, goldPriceInfo )
			
		end
		
		if price_credits ~= 0 or ( price_credits == 0 and price_gold == 0 ) then
		
			local creditsPriceInfo =
			{
				priceType	= _G.GameStore.CreditsType.CT_CREDITS,
				val			= price_credits,
				bIsBuyPrice	= true,
				basePrice	= price_credits,
			}
			
			table.insert( priceInfos, creditsPriceInfo )

		end
		
		local strPrice = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.TEXT_INVENTORY ), false, false, true, nil, ", " )

		-- все вместе
		local tSubst =
		{
			slots	= strCount,
			price	= strPrice,
		}
		msgAutogen = string.gsub( msgAutogen, "%$(.-)%$", tSubst )
		
		msg = string.format( "%s%s%s", msg, msg ~= "" and "|" or "", msgAutogen )
		
	end
	
	
	self.invMetaText:SetText( msg, true )

end


--
function UI.BuyWithInventoryWnd:UpdateBundleContentCollected()

	local bShowText = UI:IsDefBundle( self.item.defName ) and UI:IsBundleContentCollected( self.item.defName )
	self:SetLayerVisible( bShowText, self.layers.BUNDLE_CONTENT_COLLECTED )

end


--
function UI.BuyWithInventoryWnd:UpdateOkBtnText()

	local strId = ""

	if self.bBuyForShipParts then
		strId = "shipsTree_buyForResourceBtn"
	else
		strId = "shop_buy"
	end

	self.okBtn:SetText( UI:GetStringByName( strId ), self.okBtn.layers.TEXT )

end


--
function UI.BuyWithInventoryWnd:UpdateOkBtnState()

	local bEnable = self:IsEnoughMoney()

	if bEnable then

		self:AddControl( self.okBtn, self.layers.WORK_EFFECT, self.effectInfo.work.okBtnObjName )
		self.okBtn:Enable( true )

	else

		if self:NeedRefillMoneyBtn() then
			self:RemoveControl( self.okBtn, self.layers.WORK_EFFECT )	
		else
			self:AddControl( self.okBtn, self.layers.WORK_EFFECT, self.effectInfo.work.okBtnObjName )
			self.okBtn:Enable( false )
		end

	end	

end


--
function UI.BuyWithInventoryWnd:IsEnoughMoney()

	local bEnoughCredits, bEnoughGold, bEnoughTokens, bEnoughShipParts, bEnoughEventCredits = self:IsEnoughMoney2()
	return bEnoughCredits and bEnoughGold and bEnoughTokens and bEnoughShipParts and bEnoughEventCredits

end


--
function UI.BuyWithInventoryWnd:IsEnoughMoney2()

	local priceItem	= 0
	local priceType = -1

	if not self.bBuyForShipParts then
		priceItem, priceType = self:GetItemPrice()
	end
	
	local priceItem_credits			= priceType == _G.GameStore.CreditsType.CT_CREDITS and priceItem or 0
	local priceItem_gold			= priceType == _G.GameStore.CreditsType.CT_GOLD and priceItem or 0
	local priceItem_tokens			= priceType == _G.GameStore.CreditsType.CT_TOKENS and priceItem or 0
	local priceItem_eventCredits	= priceType == _G.GameStore.CreditsType.CT_EVENT and priceItem or 0

	local priceInventory_credits, priceInventory_gold = self:GetInventoryPrice()
	local priceAutogenInventory_credits, priceAutogenInventory_gold = self:GetAutogenInventoryPrice()

	local totalPrice_credits		= priceItem_credits + priceInventory_credits + priceAutogenInventory_credits
	local totalPrice_gold			= priceItem_gold + priceInventory_gold + priceAutogenInventory_gold
    local totalPrice_tokens			= priceItem_tokens
    local totalPrice_eventCredits	= priceItem_eventCredits

	local playerMoney_credits		= UI:GetPlayerMoney( false )
	local playerMoney_gold			= UI:GetPlayerMoney( true )
	local playerMoney_tokens		= UI:GetPlayerTokens()
	local playerMoney_eventCredits	= UI:GetPlayerEventCredits()

	local bEnoughCredits		= totalPrice_credits == 0 or totalPrice_credits <= playerMoney_credits
	local bEnoughGold			= totalPrice_gold == 0 or totalPrice_gold <= playerMoney_gold
	local bEnoughTokens			= totalPrice_tokens == 0 or totalPrice_tokens <= playerMoney_tokens
	local bEnoughEventCredits	= totalPrice_eventCredits == 0 or totalPrice_eventCredits <= playerMoney_eventCredits

	local bEnoughShipParts = true

	if self.bBuyForShipParts then

		if UI:IsDefShip( self.item.defName ) then
			bEnoughShipParts = UI:IsEnoughShipPartsForShip( self.item.defName )
		else
			sys.log( "UI.BuyWithInventoryWnd:IsEnoughMoney2()[ERROR]: \"%s\" is not ship", self.item.defName )
			bEnoughShipParts = false
		end

	end

	return bEnoughCredits, bEnoughGold, bEnoughTokens, bEnoughShipParts, bEnoughEventCredits

end


--
function UI.BuyWithInventoryWnd:UpdateRefillMoneyBtn()

	local bNeedBtn, mode = self:NeedRefillMoneyBtn()

	if not bNeedBtn then
		self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )
	else
		self:AddControl( self.refillMoneyBtn, self.layers.WORK_EFFECT, self.effectInfo.work.refillMoneyBtnObjName )
		self.refillMoneyBtn:Setup( mode )
	end

end


--
function UI.BuyWithInventoryWnd:NeedRefillMoneyBtn()

	local bEnoughCredits, bEnoughGold = self:IsEnoughMoney2()
	return not bEnoughCredits or not bEnoughGold, not bEnoughCredits and UI.RefillMoneyBtn.modes.CREDITS or UI.RefillMoneyBtn.modes.GOLD

end


--
function UI.BuyWithInventoryWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.okBtn then
		sys.log( "UI.BuyWithInventoryWnd:F_OnMouseLButtonDown(): press button OK. Mouse position: ( '%d' , '%d' )", mouseX, mouseY )
		self:TryBuy()

	elseif wnd == self.crossBtn then
		self:Cancel()

	elseif wnd == self.refillMoneyBtn then
		self:OnRefillMoney()
	end

	return true

end


--
function UI.BuyWithInventoryWnd:OnRefillMoney()

	local moneyMode = self.refillMoneyBtn:GetMode()

	if moneyMode == UI.RefillMoneyBtn.modes.CREDITS then
		UI.HangarWnd:ShowBuyCreditsWnd()

	elseif moneyMode == UI.RefillMoneyBtn.modes.GOLD then
		UI.HangarWnd:ShowBuyGoldWnd()

	else
		sys.log( "UI.BuyWithInventoryWnd:RefillMoney()[ERROR]: invalid refil money mode: %s", tostring( moneyMode ) )
	end

end


--
function UI.BuyWithInventoryWnd:OnEnter( key, controllerIdx )

	sys.log( "UI.BuyWithInventoryWnd:OnEnter(): press button Enter. Key: '%d'", key )
	self:TryBuy()

	return true

end


--
function UI.BuyWithInventoryWnd:OnEscape( key, controllerIdx )

	self:Cancel()
	return true

end


--
function UI.BuyWithInventoryWnd:Cancel()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	self:NotifyMainWnd( false )

end


--
function UI.BuyWithInventoryWnd:TryBuy()

	if self:IsEnoughMoney() then
		self:DoBuy()
	else
		self:ShowErroMsgOnLowMoney()
	end

end


--
function UI.BuyWithInventoryWnd:DoBuy()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.buy )

	self:NotifyMainWnd( true )

end


--
function UI.BuyWithInventoryWnd:NotifyMainWnd( result )

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.BuyWithInventoryWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnBuyWithInventoryWndResult then
		sys.log( "UI.BuyWithInventoryWnd:NotifyMainWnd()[ERROR]: cannot find OnBuyWithInventoryWndResult() function in wnd %s", self.mainWndName )
		return
	end

	local itemPrice, priceType = self:GetItemPrice()
	mainWnd:OnBuyWithInventoryWndResult( result, { item = self.item, inventoryLevels = self.inventoryLevels, autogenInventoryLevels = self.autogenInventoryLevels, priceType = priceType, bBuyForShipParts = self.bBuyForShipParts } )

end


--
function UI.BuyWithInventoryWnd:ShowErroMsgOnLowMoney()

	local msg = UI:GetStringByName( "msg_buyError" )

	local resultStr = UI:GetStringByName( "buyError_SBR_CANT_AFFORD" )	
	msg = string.format( msg, resultStr )

	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

end


--
function UI.BuyWithInventoryWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	local name = self:GetScriptTableName()
	UI.store[ name ] =
	{
		item					= self.item,
		inventoryLevels			= self.inventoryLevels,
		autogenInventoryLevels	= self.autogenInventoryLevels,
		bBuyForShipParts		= self.bBuyForShipParts,
	}

end


--
function UI.BuyWithInventoryWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()	
	local t = UI.store[ name ]

	if t then
		self:Setup( t.item, t.inventoryLevels, t.bBuyForShipParts, t.autogenInventoryLevels )
		UI.store[ name ] = nil
	end

end


--
function UI.BuyWithInventoryWnd:OnAccountAurasChanged()

	self:UpdatePrice()
	self:UpdateOkBtnState()
	self:UpdateRefillMoneyBtn()

end


--
function UI.BuyWithInventoryWnd:OnResourcesChanged()

	if self.bBuyForShipParts then
		self:UpdateOkBtnState()
	end

end