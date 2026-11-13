-- ----------------------------------------------------------------------------
--
-- Workfile: buywnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.BuyWnd = {}
local bs = UI.BuyWnd

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.BuyWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "BuyWnd",
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
				defName 			= "buy_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.BuyWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.BuyWnd.layers.WORK_EFFECT",
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
				defName 			= "buy_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.BuyWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",	
						layer		= "UI.BuyWnd.layers.MSG",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price",	
						layer		= "UI.BuyWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_1",	
						layer		= "UI.BuyWnd.layers.MSG_2",
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

		-- MSG
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- MSG_2
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.BuyWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.BuyWnd:Setup( mode, bNoBuySound, data, bCanShowRefillBtn )

	self:Reset()

	if bCanShowRefillBtn == nil then
		bCanShowRefillBtn = true
	end

	self.mode = mode
	self.data = data
	self.bCanShowRefillBtn = bCanShowRefillBtn

	self.bNoBuySound = bNoBuySound
	if self.bNoBuySound == nil then
		self.bNoBuySound = false
	end

	self.bSell = self.mode == self.modes.SELL_ITEMS

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.BuyWnd:GetMode()

	return self.mode

end


--
function UI.BuyWnd:GetData()

	return self.data

end


--
function UI.BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if self.bSell then
		return
	end

	self:UpdatePrice()
	self:UpdateOkBtnState()
	self:UpdateRefillMoneyBtn()

end   


--
function UI.BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


-- TODO убрать функцию и убрать вызовы
function UI.BuyWnd:MasterServer_OnPremiumStatus( result, requestId, param1, param2 )
end


-- TODO убрать функцию и убрать вызовы
function UI.BuyWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )
end


--
function UI.BuyWnd:OnClanDataChanged()

	if not self:IsOnScreen() then
		return
	end
	
	-- может повлиять на цену в клановом иридиуме
	self:UpdatePrice()

end


-- -------------------------------------
-- const
-- -------------------------------------

bs.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
    WORK_EFFECT			= 2,
    CAPTION				= 3,
    MSG					= 4,
	MSG_2				= 5, 
    PRICE_EFFECT		= 6, 
    PRICE_VAL			= 7,
}

bs.modes =
{
	INVENTORY_USER				= 1,
	INVENTORY_AUTO				= 2,
	AUTOGEN_INVENTORY_USER		= 3,
	AUTOGEN_INVENTORY_AUTO		= 4, 
	CLAN_EXPAND_USER			= 5, 
	TALENTS_RESET				= 6, 
	BUY_TALENT_SET				= 7, 
	SHIP_CUSTOMIZATION			= 8, 
	HANGAR_AUTO_PILOT			= 9, 
	SYNERGY_TRANSFER			= 10,
	KARMA_RESET					= 11,
	SALVAGE						= 12,
	LOOT_ITEM					= 13,
	SHIPS_REPAIR				= 14,
	AVATAR 						= 15,
	MOTTO 						= 16,
	SELL_ITEMS					= 17,
	LEARN_NODE					= 18,
	MAIL_TRADING				= 19,
	ZONE_JUMP					= 20,
	ZONE_CIVILIAN_CHANGE		= 21,
	UPGRADE_ITEMS_MULTI			= 22,
	CLAN_START_WAR				= 23,
	CLAN_RESTORE_HEALTH			= 24,
	BATTLE_PASS_UNLOCK_LEVEL	= 25,
	AUTOGEN_DISMANTLE			= 26,
	FACTION_REP_RESET			= 27,
}

bs.effectInfo =
{
	work =
	{
		okBtnLocator			= "button_2",
		crossBtnLocator			= "btn_x5",
		refillMoneyBtnObjName	= "button_2",
	},
}

bs.sounds =
{
	hide	= "sound/ui/MsgHide",
	buy		= "sound/ui/apply",
}

bs.mainWndName	= ""

-- -------------------------------------
-- vars
-- -------------------------------------

bs.mode					= -1
bs.data					= nil
bs.bCanShowRefillBtn	= true
bs.okBtn				= nil
bs.crossBtn				= nil
bs.prices				= {}
bs.bNoBuySound			= false
bs.refillMoneyBtn		= nil
bs.priceMetaText		= nil
bs.msgMetaText			= nil
bs.bSell				= false

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.BuyWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL ) 	

	self.msgMetaText = UI.MetaText.GetNewInstance()
	self.msgMetaText:InitFromLayer( self, self.layers.MSG ) 	

	self:Reset()
	
	UI:AddOverlayWnd( self:GetScriptTableName() )

end


--
function UI.BuyWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	if self.msgMetaText then
		self.msgMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BuyWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.BuyWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BuyWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )
	self.msgMetaText:UpdateScreenOrgFromLayer( self, self.layers.MSG )	

end


--
function UI.BuyWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.MSG then
		self.msgMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BuyWnd:CreateControls()

	self.okBtn			= UI:CreateChildWnd( self, UI.Buy_OkBtn, "" )
	self.crossBtn		= UI:CreateChildWnd( self, UI.CrossBtn, "" )
	self.refillMoneyBtn	= UI:CreateChildWnd( self, UI.RefillMoneyBtn, "" )

	self:AddControl( self.crossBtn, self.layers.WORK_EFFECT, self.effectInfo.work.crossBtnLocator )

end


--
function UI.BuyWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.BuyWnd:RemoveControl( wnd, effectLayer )

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
function UI.BuyWnd:Reset()

	self.mode			= -1
	self.data			= nil
	self.bNoBuySound	= false
	self.prices			= {}
	self.bSell			= false

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.MSG_2 )
	self:SetLayerVisible( false, self.layers.PRICE_EFFECT )
	self:SetLayerVisible( false, self.layers.PRICE_VAL )

	self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( self.okBtn, self.layers.WORK_EFFECT )

	self.priceMetaText:SetText( "", true )
	self.msgMetaText:SetText( "", true )

end


--
function UI.BuyWnd:FullUpdate()

	self.prices = self:GetPrice()

	self:UpdateCaption()
	self:UpdateMsg()
	self:UpdateMsg2()
	self:UpdatePrice()
	self:UpdateOkBtnText()
	self:UpdateOkBtnState()
	self:UpdateRefillMoneyBtn()

end


--
function UI.BuyWnd:GetPrice()

	local prices = {}

	if self.mode == self.modes.INVENTORY_USER or self.mode == self.modes.INVENTORY_AUTO then

		local inventoryLevels	= self:GetInventoryLevelsToBuy()
		local credits			= 0
		local gold				= 0

		for idx, level in pairs( inventoryLevels ) do

			if level <= UI:GetInventoryMaxLevel() then
				local levelPrice, bGold = UI:GetInventoryPriceForLevel( level )

				if bGold then
					gold = gold + levelPrice
				else
					credits = credits + levelPrice
				end
			end

		end

		if credits ~= 0 then
			local creditsPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_CREDITS, credits )
			table.insert( prices, creditsPriceInfo )
		end

		if gold ~= 0 then
			local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
			table.insert( prices, goldPriceInfo )
		end
		
		
	elseif self.mode == self.modes.AUTOGEN_INVENTORY_USER or self.mode == self.modes.AUTOGEN_INVENTORY_AUTO then

		local autogenInventoryLevels	= self:GetAutogenInventoryLevelsToBuy()
		local credits					= 0
		local gold						= 0

		for idx, level in pairs( autogenInventoryLevels ) do

			if level <= UI:GetAutogenInventoryMaxLevel() then
				local levelPrice, bGold = UI:GetAutogenInventoryPriceForLevel( level )

				if bGold then
					gold = gold + levelPrice
				else
					credits = credits + levelPrice
				end
			end

		end

		if credits ~= 0 then
			local creditsPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_CREDITS, credits )
			table.insert( prices, creditsPriceInfo )
		end

		if gold ~= 0 then
			local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
			table.insert( prices, goldPriceInfo )
		end
		

	elseif self.mode == self.modes.CLAN_EXPAND_USER then

		local price = _G.GameStore_GetClanUpgradeCost( MasterServer.ClanUpgrades.CU_CAPACITY, UI.Clan:GetUpgradeLevel( MasterServer.ClanUpgrades.CU_CAPACITY ) + 1 )

		local priceType = _G.GameStore.CreditsType.CT_TOKENS
		local priceInfo = self:MakePriceInfo( priceType, price )
		table.insert( prices, priceInfo )		


	elseif self.mode == self.modes.TALENTS_RESET then

		-- бесплатно


	elseif self.mode == self.modes.BUY_TALENT_SET then

		prices = UI:GetTalentSetPrices( self.data.talentSetId )


	elseif self.mode == self.modes.SHIP_CUSTOMIZATION then

		local credits	= self.data.credits
		local gold		= self.data.gold

		if credits ~= 0 then
			local creditsPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_CREDITS, credits )
			table.insert( prices, creditsPriceInfo )
		end

		if gold ~= 0 then
			local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
			table.insert( prices, goldPriceInfo )
		end


	elseif self.mode == self.modes.HANGAR_AUTO_PILOT then

		local credits	= 0
		local gold		= 0

		-- don't save a cost in gold
		credits, gold = _G.GameStore_GetAutoPilotCost( UI:Reputation2Rank( UI:GetPlayerMaxReputationForRace() ) )
		if gold > 0 then
			credits = 0
		end

		if credits ~= 0 then
			local creditsPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_CREDITS, credits )
			table.insert( prices, creditsPriceInfo )
		end

		if gold ~= 0 then
			local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
			table.insert( prices, goldPriceInfo )
		end


	elseif self.mode == self.modes.SYNERGY_TRANSFER then

		local gold = self.data.gold

		local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
		table.insert( prices, goldPriceInfo )


	elseif self.mode == self.modes.KARMA_RESET then

		local gold = _G.MasterServer_GetKarmaResetCost()

		local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
		table.insert( prices, goldPriceInfo )


	elseif self.mode == self.modes.SALVAGE then

		local bGold	= self.data.bGold
		local price	= self.data.price

		local priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
		local priceInfo = self:MakePriceInfo( priceType, price )
		table.insert( prices, priceInfo )


	elseif self.mode == self.modes.LOOT_ITEM then

		local bGold	= self.data.bGold
		local price	= self.data.price

		local priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
		local priceInfo = self:MakePriceInfo( priceType, price )
		table.insert( prices, priceInfo )


	elseif self.mode == self.modes.SHIPS_REPAIR then

		local repairInfo = UI:GetShipsRepairInfo( self.data.vids, true )

		local credits	= repairInfo.credits
		local gold		= repairInfo.gold

		if credits ~= 0 then
			local creditsPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_CREDITS, credits )
			table.insert( prices, creditsPriceInfo )
		end

		if gold ~= 0 then
			local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
			table.insert( prices, goldPriceInfo )
		end


	elseif self.mode == self.modes.AVATAR then

		local price, bGold = UI:GetShopBuyPriceByDef( UI.ProfileChangeAvatar_Wnd:GetSelectedData(), false, false )

		local priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
		local priceInfo = self:MakePriceInfo( priceType, price )
		
		table.insert( prices, priceInfo )

	elseif self.mode == self.modes.MOTTO then

		local price, bGold = UI:GetShopBuyPriceByDef( UI.ProfileTitles_Wnd:GetSelectedData().defName, false, false )

		local priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
		local priceInfo = self:MakePriceInfo( priceType, price )
		
		table.insert( prices, priceInfo )

	elseif self.mode == self.modes.SELL_ITEMS then

		local priceTotal = 0

		if self.data.iids then

			for idx, iid in pairs( self.data.iids ) do

				local item, bAutogen = UI:GetInventoryItemEx( iid )
				if item then
				
					local itemPrice = 0
				
					if bAutogen then
						itemPrice = _G.GameStore_GetAutogenItemSellPrice( iid )
					else
						itemPrice = UI:GetShopSellPriceByDef( item.defName )
						itemPrice = itemPrice * item.amount
					end
					
					priceTotal = priceTotal + itemPrice

				else
					sys.log( "UI.BuyWnd:GetPrice()[ERROR]: cannot find invеntory item for iid %s", _G.U64ToStr( iid ) )
				end

			end

		end		

		if self.data.unequippedAmmoSold then

			for defName, amount in pairs( self.data.unequippedAmmoSold ) do

				local itemPrice =  UI:GetShopSellPriceByDef( defName )
				priceTotal = priceTotal + itemPrice * amount

			end

		end

		if self.data.resources then

			for idx, defName in pairs( self.data.resources ) do

				local itemPrice	= UI:GetShopSellPriceByDef( defName )
				local amount	= UI:GetPlayerResourceCount( defName )

				priceTotal = priceTotal + itemPrice * amount

			end

		end

    	local priceInfo	=
    	{
    		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
    		val			= priceTotal,
    		bIsBuyPrice	= false,
    	}

		table.insert( prices, priceInfo )

	elseif self.mode == self.modes.LEARN_NODE then

		local shipItem = UI:GetShipItem( self.data.vid, false )
		if shipItem then

    		local nodePrices = UI:GetEvolvingShipNodePrice( self.data.nodeName, shipItem.defName )

        	for priceIdx, price in ipairs( nodePrices ) do

        		if price.priceType == UI.shipNodePriceTypes.CREDITS then

        			local creditsPriceInfo =
        			{
                		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
                		bIsBuyPrice	= true,
            			val			= price.val,
                		basePrice	= price.val,
        			}

        			table.insert( prices, creditsPriceInfo )

        		elseif price.priceType == UI.shipNodePriceTypes.TOKENS then

        			local iridiumPriceInfo =
        			{
                		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
                		bIsBuyPrice	= true,
            			val			= price.val,
                		basePrice	= price.val,
        			}

        			table.insert( prices, iridiumPriceInfo )

        		elseif price.priceType == UI.shipNodePriceTypes.SYNERGY then

    				local shipSynergy = UI:GetShipExp( shipItem )

    				local usedShipSynergy = math.min( shipSynergy, price.val )
    				local usedFreeSynergy = 0

    				if usedShipSynergy < price.val then
    					local freeSynergy = UI:GetPlayerFreeSynergy()
    					usedFreeSynergy = math.min( price.val - usedShipSynergy, freeSynergy )
    				end

    				if usedShipSynergy > 0 then

            			local shipSynergyPriceInfo =
            			{
                    		priceType	= UI.exPriceTypes.SYNERGY,
                    		bIsBuyPrice	= true,
                			val			= usedShipSynergy,
                    		basePrice	= usedShipSynergy,
        					vid			= self.data.vid,
            			}

            			table.insert( prices, shipSynergyPriceInfo )

    				end

    				if usedFreeSynergy > 0 then

            			local freeSynergyPriceInfo =
            			{
                    		priceType	= UI.exPriceTypes.FREE_SYNERGY,
                    		bIsBuyPrice	= true,
                			val			= usedFreeSynergy,
                    		basePrice	= usedFreeSynergy,
            			}

            			table.insert( prices, freeSynergyPriceInfo )

    				end

        		elseif price.priceType ~= UI.shipNodePriceTypes.ITEM then

        			sys.log( "UI.BuyWnd:GetPrice()[ERROR]: unhandled ship node learn price type: %d", price.priceType )

        		end

			end

		else
    		sys.log( "UI.BuyWnd:GetPrice()[ERROR]: cannot find ship item for \"%s\"", _G.U64ToStr( self.data.vid ) )
		end

	elseif self.mode == self.modes.MAIL_TRADING then

    	local gold = 0

    	if type( self.data.letter ) == "table" then

        	if type( self.data.letter.goldCost ) == "number" then
        		gold = self.data.letter.goldCost
        	else
            	sys.log( "UI.BuyWnd:GetPrice()[ERROR]: invalid type of field \"goldCost\" in letter letter %s; \"number\" or \"nil\" expected, got \"%s\"", _G.U64ToStr( letter.mailId ), type( self.data.letter.goldCost ) )
        	end

		else
			sys.log( "UI.BuyWnd:GetPrice()[ERROR]: invalid type of data.letter; \"table\" expected, got \"%s\"", type( self.data.letter ) )
		end

		local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
		table.insert( prices, goldPriceInfo )

	elseif self.mode == self.modes.ZONE_JUMP then
	
		local priceInfo = UI:GetTransferToZonePrice( self.data.zoneId )
		table.insert( prices, priceInfo )
		
	elseif self.mode == self.modes.ZONE_CIVILIAN_CHANGE then
	
		local price = UI:GetZoneCivilianChangePrice( self.data.zoneId )
		
		local priceInfo =
		{
			priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
			val			= price,
			basePrice	= price,
			bIsBuyPrice	= true,
		}
		
		table.insert( prices, priceInfo )
		
	elseif self.mode == self.modes.UPGRADE_ITEMS_MULTI then
	
		local price = self.data.price
		
		local priceInfo =
		{
			priceType	= _G.GameStore.CreditsType.CT_CREDITS,
			val			= price,
			basePrice	= price,
			bIsBuyPrice	= true,
		}
		
		table.insert( prices, priceInfo )
		
	elseif self.mode == self.modes.CLAN_START_WAR then
		
		local price = self.data.price
		
		local priceInfo =
		{
			priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
			val			= price,
			basePrice	= price,
			bIsBuyPrice	= true,
		}
		
		table.insert( prices, priceInfo )
		
	elseif self.mode == self.modes.CLAN_RESTORE_HEALTH then
		
		local price = UI:GetClanWarRestoreHealthPrice()
		
		local priceInfo =
		{
			priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
			val			= price,
			basePrice	= price,
			bIsBuyPrice	= true,
		}
		
		table.insert( prices, priceInfo )
		
	elseif self.mode == self.modes.BATTLE_PASS_UNLOCK_LEVEL then
	
		local unlockedLevel = UI:GetBattlePassUnlockedLevel( self.data.stage )
		local nextLevel = unlockedLevel ~= -1 and unlockedLevel + 1 or 1
		
		local price = UI:GetBattlePassLevelUnlockPrice( self.data.stage, nextLevel )
		
		local priceInfo =
		{
			priceType	= _G.GameStore.CreditsType.CT_EVENT,
			val			= price,
			basePrice	= price,
			bIsBuyPrice	= true,
		}
		
		table.insert( prices, priceInfo )
		
	elseif self.mode == self.modes.AUTOGEN_DISMANTLE then
		
		local price, bGold = UI:GetAutogenDismantlePrice( self.data.iid )
		
		local priceInfo =
		{
			priceType	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS,
			val			= price,
			basePrice	= price,
			bIsBuyPrice	= true,
		}

		table.insert( prices, priceInfo )

	elseif self.mode == self.modes.FACTION_REP_RESET then

		local gold = _G.MasterServer_GetFactionRepResetCost()

		local goldPriceInfo = self:MakePriceInfo( _G.GameStore.CreditsType.CT_GOLD, gold )
		table.insert( prices, goldPriceInfo )

	else
		sys.log( "UI.BuyWnd:GetPrice()[ERROR]: unhandled mode - %s", tostring( self.mode ) )
	end

	return prices

end


--
function UI.BuyWnd:MakePriceInfo( priceType, price )

	local priceInfo = {}

	if	priceType ~= _G.GameStore.CreditsType.CT_CREDITS and
		priceType ~= _G.GameStore.CreditsType.CT_GOLD and
		priceType ~= _G.GameStore.CreditsType.CT_TOKENS then
			sys.log( "UI.BuyWnd:MakePriceInfo()[ERROR]: not handled price type %d(%s)", priceType, UI:Val2Key( _G.GameStore.CreditsType, priceType ) )
			return priceInfo
	end	

	priceInfo	=
	{
		priceType	= priceType,
		bIsBuyPrice	= true,
		val			= price,
		basePrice	= price,
	}

	return priceInfo

end


--
function UI.BuyWnd:GetInventoryLevelsToBuy()

	local inventoryLevels = self.data and self.data.inventoryLevels
	if not inventoryLevels then
		inventoryLevels = { UI:GetInventoryNextLevel() }
	end

	return inventoryLevels

end


--
function UI.BuyWnd:GetAutogenInventoryLevelsToBuy()

	local autogenInventoryLevels = self.data and self.data.autogenInventoryLevels
	if not autogenInventoryLevels then
		autogenInventoryLevels = { UI:GetAutogenInventoryNextLevel() }
	end

	return autogenInventoryLevels

end


--
function UI.BuyWnd:UpdateCaption()

	local msgId = ""

	if self.mode == self.modes.INVENTORY_USER then
		msgId = "buyInventory_caption_USER"

	elseif self.mode == self.modes.INVENTORY_AUTO then
		msgId = "buyInventory_caption_AUTO"
		
	elseif self.mode == self.modes.AUTOGEN_INVENTORY_USER then
		msgId = "buyAutogenInventory_caption_USER"
		
	elseif self.mode == self.modes.AUTOGEN_INVENTORY_AUTO then
		msgId = "buyAutogenInventory_caption_AUTO"

	elseif self.mode == self.modes.CLAN_EXPAND_USER then
		msgId = "clans_expand_caption"

	elseif self.mode == self.modes.TALENTS_RESET then
		msgId = "talents_resetMsg_caption"

	elseif self.mode == self.modes.BUY_TALENT_SET then
		msgId = "talents_buyTalentSet_caption"

	elseif self.mode == self.modes.SHIP_CUSTOMIZATION then
		msgId = "msgCapt_shipCustomization"

	elseif self.mode == self.modes.HANGAR_AUTO_PILOT then
		msgId = "msgCapt_autopilotToHangar"

	elseif self.mode == self.modes.SYNERGY_TRANSFER then
		msgId = "msgCapt_synergyTransfer"

	elseif self.mode == self.modes.KARMA_RESET then
		msgId = "msgCapt_resetKarma"

	elseif self.mode == self.modes.SALVAGE then
		msgId = "msgCapt_salvage"

	elseif self.mode == self.modes.LOOT_ITEM then
		msgId = "msgCapt_lootItem"

	elseif self.mode == self.modes.SHIPS_REPAIR then
		msgId = "hangar_prepare_repairCaption"

	elseif self.mode == self.modes.AVATAR then
		msgId = "buyUserAvatar_caption"

	elseif self.mode == self.modes.MOTTO then
		msgId = "buyUserMotto_caption"

	elseif self.mode == self.modes.SELL_ITEMS then
		msgId = "shop_buyDialog_captionSell"

	elseif self.mode == self.modes.LEARN_NODE then
		msgId = "shipsTree_unlockAlienShipNodeConfirm_caption"

	elseif self.mode == self.modes.MAIL_TRADING then
		msgId = "buyTrading_cation"
		
	elseif self.mode == self.modes.ZONE_JUMP then
		msgId = "msg_jumpToZoneRequest_caption"
		
	elseif self.mode == self.modes.ZONE_CIVILIAN_CHANGE then
		msgId = "msg_zoneCivilianChange_caption"
		
	elseif self.mode == self.modes.UPGRADE_ITEMS_MULTI then
		msgId = "upgradeItem_caption"
		
	elseif self.mode == self.modes.CLAN_START_WAR then
		msgId = "clanWar_startWarConfrm_caption"
		
	elseif self.mode == self.modes.CLAN_RESTORE_HEALTH then
		msgId = "clanWar_restoreHealthConfrm_caption"
		
	elseif self.mode == self.modes.BATTLE_PASS_UNLOCK_LEVEL then
		msgId = "battlePass_unlockLevel_confirm_caption"
		
	elseif self.mode == self.modes.AUTOGEN_DISMANTLE then
		msgId = "autogenUnequip_dismantleConfirm_caption"

	elseif self.mode == self.modes.FACTION_REP_RESET then
		msgId = "msgCapt_resetFactionRep"

	else
		sys.log( "UI.BuyWnd:UpdateCaption()[ERROR]: unhandled mode - %s", tostring( self.mode ) )
	end

	local msg = ""

	if msgId ~= "" then
		msg = UI:GetStringByName( msgId )
	end

	self:SetText( msg, self.layers.CAPTION )

end


--
function UI.BuyWnd:UpdateMsg()

	local msgId = ""

	if self.mode == self.modes.INVENTORY_USER then
		msgId = "buyInventory_msg_USER"

	elseif self.mode == self.modes.INVENTORY_AUTO then
		msgId = "buyInventory_msg_AUTO"
		
	elseif self.mode == self.modes.AUTOGEN_INVENTORY_USER then
		msgId = "buyAutogenInventory_msg_USER"
		
	elseif self.mode == self.modes.AUTOGEN_INVENTORY_AUTO then
		msgId = "buyAutogenInventory_msg_AUTO"

	elseif self.mode == self.modes.CLAN_EXPAND_USER then
		msgId = "clans_expand_text"

	elseif self.mode == self.modes.TALENTS_RESET then
		msgId = "talents_resetMsg_msg"

	elseif self.mode == self.modes.BUY_TALENT_SET then
		msgId = "talents_buyTalentSet_msg"

	elseif self.mode == self.modes.SHIP_CUSTOMIZATION then
		msgId = "msg_shipCustomization"

	elseif self.mode == self.modes.HANGAR_AUTO_PILOT then
		msgId = "msg_autopilotToHangar"

	elseif self.mode == self.modes.SYNERGY_TRANSFER then
		msgId = "msg_synergyTransfer"

	elseif self.mode == self.modes.KARMA_RESET then
		msgId = "msg_resetKarma"

	elseif self.mode == self.modes.SALVAGE then
		msgId = "msg_salvage"

	elseif self.mode == self.modes.LOOT_ITEM then
		msgId = "msg_lootItem"

	elseif self.mode == self.modes.SHIPS_REPAIR then
		msgId = "hangar_prepare_repairAllText_ships"

	elseif self.mode == self.modes.AVATAR then
		msgId = "buyUserAvatar_text"

	elseif self.mode == self.modes.MOTTO then
		msgId = "buyUserMotto_text"

	elseif self.mode == self.modes.SELL_ITEMS then
		msgId = "multiSell_sellWnd_text"

	elseif self.mode == self.modes.LEARN_NODE then
		msgId = "shipsTree_unlockAlienShipNodeConfirm_msg"

	elseif self.mode == self.modes.MAIL_TRADING then
		msgId = "buyTrading_msg"
		
	elseif self.mode == self.modes.ZONE_JUMP then
		msgId = "msg_jumpToZoneRequest_text"
		
	elseif self.mode == self.modes.ZONE_CIVILIAN_CHANGE then
		msgId = "msg_zoneCivilianChange_text"
		
	elseif self.mode == self.modes.UPGRADE_ITEMS_MULTI then
		msgId = "upgradeItem_upgradeDescMulti"
		
	elseif self.mode == self.modes.CLAN_START_WAR then
		msgId = "clanWar_startWarConfrm_text"
		
	elseif self.mode == self.modes.CLAN_RESTORE_HEALTH then
		msgId = "clanWar_restoreHealthConfrm_text"
		
	elseif self.mode == self.modes.BATTLE_PASS_UNLOCK_LEVEL then
		msgId = "battlePass_unlockLevel_confirm_text"
		
	elseif self.mode == self.modes.AUTOGEN_DISMANTLE then
		msgId = "autogenUnequip_dismantleConfirm_text"
	
	elseif self.mode == self.modes.FACTION_REP_RESET then
		msgId = "msg_resetFactionRep"

	else
		sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: unhandled mode - %s", tostring( self.mode ) )
	end

	local msg = ""

	if msgId ~= "" then

		msg = UI:GetStringByName( msgId )

		if ( self.mode == self.modes.INVENTORY_USER or self.mode == self.modes.INVENTORY_AUTO ) then

			local countToBuy = 0
			local inventoryLevels = self:GetInventoryLevelsToBuy()

			for idx, level in pairs( inventoryLevels ) do

				if level <= UI:GetInventoryMaxLevel() then					

					local countOnLevel = UI:GetInventoryMaxSizeForLevel( level )
					local countOnPrevLevel = UI:GetInventoryMaxSizeForLevel( level - 1 )

					local levelCountToBuy = countOnLevel - countOnPrevLevel

					countToBuy = countToBuy + levelCountToBuy
					
				end

			end

    		if countToBuy == 0 then
    			sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: no inventory levels to buy" )
    		end

    		msg = string.format( msg, countToBuy )
			
		elseif self.mode == self.modes.AUTOGEN_INVENTORY_USER or self.mode == self.modes.AUTOGEN_INVENTORY_AUTO then

			local countToBuy = 0
			local autogenInventoryLevels = self:GetAutogenInventoryLevelsToBuy()

			for idx, level in pairs( autogenInventoryLevels ) do

				if level <= UI:GetAutogenInventoryMaxLevel() then					

					local countOnLevel = UI:GetAutogenInventoryMaxSizeForLevel( level )
					local countOnPrevLevel = UI:GetAutogenInventoryMaxSizeForLevel( level - 1 )

					local levelCountToBuy = countOnLevel - countOnPrevLevel

					countToBuy = countToBuy + levelCountToBuy
					
				end

			end

    		if countToBuy == 0 then
    			sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: no autogen inventory levels to buy" )
    		end

    		msg = string.format( msg, countToBuy )

		elseif self.mode == self.modes.SYNERGY_TRANSFER then

			local synergy = self.data.synergy or 0
			local strSynergy = UI:Num2StrSeparatedBy3( synergy )
			msg = string.gsub( msg, "%$synergy%$", strSynergy )


		elseif self.mode == self.modes.CLAN_EXPAND_USER then

    		local deltaCount = _G.ClanUpgradeValues[ MasterServer.ClanUpgrades.CU_CAPACITY ][ UI.Clan:GetUpgradeLevel( MasterServer.ClanUpgrades.CU_CAPACITY ) ]
    		deltaCount = _G.ClanUpgradeValues[ MasterServer.ClanUpgrades.CU_CAPACITY ][ UI.Clan:GetUpgradeLevel( MasterServer.ClanUpgrades.CU_CAPACITY ) + 1 ] - deltaCount
    		msg = string.format( msg, deltaCount )

		elseif self.mode == self.modes.BUY_TALENT_SET then

			local strTalentSet = UI:TalentSet2Str( self.data.talentSetId )

			local rank = UI:GetTalentSetRank( self.data.talentSetId )
			local strRank = tostring( rank )

			local tSubst =
			{
				talent_set	= strTalentSet,
				rank		= strRank,
			}

			msg = string.gsub( msg, "%$([%w_]+)%$", tSubst )

		elseif self.mode == self.modes.AVATAR then

			msg = string.gsub( msg, "%$name%$", UI:GetAvatarName( UI.ProfileChangeAvatar_Wnd:GetSelectedData() ) )

		elseif self.mode == self.modes.MOTTO then

			msg = string.gsub( msg, "%$text%$", UI:GetMottoString( UI.ProfileTitles_Wnd:GetSelectedData().defName ) )

		elseif self.mode == self.modes.SALVAGE then

			local strRefundItems = ""

			local item = UI:GetInventoryItem( self.data.iid )
			if item then

				local defName = item.defName

    			local refundItems = UI:GetSalvageRefundItems( defName )
    			for itemIdx, itemInfo in ipairs( refundItems ) do

    				local strItem = ""

    				if UI:IsDefModule( itemInfo.defName ) or UI:IsDefAmmo( itemInfo.defName ) then
    					strItem = string.format( "$link [type ITEM][params {defName=\"%s\", bEnchanted=%s}]$", itemInfo.defName, false )

    				elseif UI:IsDefResource( itemInfo.defName ) or UI:IsDefBlueprint( itemInfo.defName ) then
    					strItem = string.format( "$link [type RESOURCE][params {defName=\"%s\"}]$", itemInfo.defName )

    				else

    					sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: unhandled item type to make link (def %s)", itemInfo.defName )

    					strItem = UI:GetEntityLocalizedNameByDef( itemInfo.defName, true )
    					strItem = string.format( "%s%s", strItem, UI:Color2Str( self:GetColor( self.layers.MSG ) ) )

    				end

    				if itemInfo.count > 1 then
    					strItem = string.format( "%s[%d]", strItem, itemInfo.count )
    				end

    				strRefundItems = string.format( "%s%s%s", strRefundItems, strRefundItems ~= "" and ", " or "", strItem )

    			end

    			local refundIridium = UI:GetSalvageRefundIridium( defName, self.data.bGold )
    			if refundIridium > 0 then

    				local strIridium = string.format( "%s$iridium$", UI:Num2StrSeparatedBy3( refundIridium ) )
    				strRefundItems = string.format( "%s%s%s", strRefundItems, strRefundItems ~= "" and ", " or "", strIridium )

    			end

			else
				sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find inventory item for iid %s",  _G.U64ToStr( iid ) )
			end

			local numSubst = 0
			msg, numSubst = string.gsub( msg, "%$items%$", strRefundItems )

			if numSubst == 0 then
				sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find placeholder \"$items$\" in string \"%s\"", msgId )
				msg = string.format( "%s. [INVALID STRING] You will gain items: %s", msg, strRefundItems )
			end

		elseif self.mode == self.modes.SELL_ITEMS then

			local amountTotal = 0

    		if self.data.iids then

    			for idx, iid in pairs( self.data.iids ) do

    				local item, bAutogen = UI:GetInventoryItemEx( iid )
    				if item then
					
						local itemAmount = 1
					
						if not bAutogen then
							itemAmount = item.amount
						end
					
    					amountTotal = amountTotal + itemAmount
						
    				else
    					sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find invеntory item for iid %s", _G.U64ToStr( iid ) )
    				end

    			end

    		end		

    		if self.data.unequippedAmmoSold then

    			for defName, amount in pairs( self.data.unequippedAmmoSold ) do
    				amountTotal = amountTotal + amount
    			end

    		end

    		if self.data.resources then

    			for idx, defName in pairs( self.data.resources ) do

					local amount = UI:GetPlayerResourceCount( defName )
    				amountTotal = amountTotal + amount

    			end

    		end

			local baseColor	= self.data.bSellAll and UI.PARAM_DELTA_MINUS_COLOR or self:GetColor( self.layers.MSG )
			local selColor	= UI.TEXT_SEL_COLOR			

			msg = string.format( "%s%s", UI:Color2Str( baseColor ), msg )

			local strAmount = string.format( "%s%s%s", UI:Color2Str( selColor ), UI:Num2StrSeparatedBy3( amountTotal ), UI:Color2Str( baseColor ) )
			msg = UI:SubstituteValLocalized( msg, amountTotal, "amount", strAmount, nil )	

			local bHasEquipped = false

			if self.data.iids then

				for idx, iid in pairs( self.data.iids ) do

					if UI:GetEquippedShipItem( iid ) then
						bHasEquipped = true
						break
					end					

				end

			end

			if bHasEquipped then

				local strHasEquipped = UI:GetStringByName( "multiSell_sellWnd_hasEquipped" )

				local redColor = UI.PARAM_DELTA_MINUS_COLOR
				strHasEquipped = string.format( "%s%s", UI:Color2Str( redColor ), strHasEquipped )

				msg = string.format( "%s|%s", msg, strHasEquipped )

			end

		elseif self.mode == self.modes.LEARN_NODE then

			local shipItem = UI:GetShipItem( self.data.vid, false )
			if shipItem then

            	local baseColor = self:GetColor( self.layers.MSG )
            	local strNodeNameLocalized = UI:EvolvingShipNode2Str( self.data.nodeName, shipItem.defName, self.data.chosenNodesMask, baseColor )

            	local numSubst = 0
            	msg, numSubst = string.gsub( msg, "%$name%$", strNodeNameLocalized )

            	if numSubst == 0 then
            		sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find placeholder \"$name$\" in string \"shipsTree_unlockAlienShipNodeConfirm_msg\"" )
            		msg = string.format( "[INVALID STRING] Do you really want to learn node %s", strNodeNameLocalized )
            	end

			else
    			sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find ship item for \"%s\"", _G.U64ToStr( self.data.vid ) )
			end

		elseif self.mode == self.modes.MAIL_TRADING then
		
			if UI:GetTradingDealsMax() ~= 0 then

				local numDeals = UI:GetTradingDealsLeft()
				msg = UI:SubstituteValLocalizedByStringId( msgId, numDeals, "num" )
				
			else
				msg = UI:GetStringByName( "buyTrading_msg_noLimit" )
			end

		elseif self.mode == self.modes.ZONE_CIVILIAN_CHANGE then
		
			local duration = UI:GetZoneCivilianChangeDuration( self.data.zoneId )
			local strDuration = UI:Time2Str42( duration )
		
			msg = string.gsub( msg, "%$time%$", strDuration )
			
		elseif self.mode == self.modes.UPGRADE_ITEMS_MULTI then
		
			local numItems = self.data.numUpgrades
			local strNumItems = tostring( numItems )
			
			local numSubst = 0
			msg, numSubst = string.gsub( msg, "%$amount%$", strNumItems )
			
			if numSubst == 0 then
				sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find placeholder '$amount$' in string '%s'", msgId )
				msg = string.format( "[INVALID STRING]: upgrades available: %s", strNumItems )
			end
			
		elseif self.mode == self.modes.CLAN_START_WAR then
			
			local clanName = UI:GetFullClanName( self.data.cid )
			
			local numSubst = 0
			msg, numSubst = string.gsub( msg, "%$clan%$", clanName )
			
			if numSubst == 0 then
				sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find placeholder '$clan$' in string '%s'", msgId )
				msg = string.format( "[INVALID STRING]: Start war with clan %s.", clanName )
			end
			
		elseif self.mode == self.modes.AUTOGEN_DISMANTLE then
			
			local defName = UI:Iid2DefName( self.data.iid )
			local strNameLink = string.format( "$link [type ITEM][params {defName=\"%s\"}]$", defName )
			
			local numSubst = 0
			msg, numSubst = string.gsub( msg, "%$name%$", strNameLink )
			
			if numSubst == 0 then
				sys.log( "UI.BuyWnd:UpdateMsg()[ERROR]: cannot find placeholder '$name$' in string 'autogenUnequipWnd_text'" )
				msg = string.format( "[INVALID STRING] Unequipping item %s", strNameLink )
			end
			
		end

	end

	self.msgMetaText:SetText( msg, true )

end


--
function UI.BuyWnd:UpdateMsg2()

	local text = ""

	if self.mode == self.modes.SHIP_CUSTOMIZATION then

		if self.data.bPrevCustomizationLost then
			text = UI:GetStringByName( "prevShipCustomizationLost" )
		end

	end

	self:SetText( text, self.layers.MSG_2 )

end


--
function UI.BuyWnd:UpdatePrice()

	if not next( self.prices ) then

		self:SetLayerVisible( false, self.layers.PRICE_EFFECT )
		self:SetLayerVisible( false, self.layers.PRICE_VAL )

		self.priceMetaText:SetText( "", true )

		return

	end

	self:SetLayerVisible( true, self.layers.PRICE_EFFECT )
	self:SetLayerVisible( true, self.layers.PRICE_VAL )

	local baseColor = self:GetColor( self.layers.PRICE_VAL )
	local str = ""

	for priceIdx = 1, #self.prices do

		local priceInfo = self.prices[ priceIdx ]

		local strPrice = UI:PriceInfo2Str( priceInfo, baseColor, false, true, true, nil )
		str = string.format( "%s %s", str, strPrice )

	end

	self.priceMetaText:SetText( str, true )

end


--
function UI.BuyWnd:IsEnoughMoney()

	if not self.bSell then

    	for priceIdx, priceInfo in pairs( self.prices ) do
    		if not UI:IsEnoughMoneyForPrice( priceInfo, false, nil ) then
    			return false
    		end
    	end

	end

	return true

end


--
function UI.BuyWnd:OnCancel()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	self:NotifyMainWnd( false )

end


--
function UI.BuyWnd:OnOk()

	local bSuccess = true

	if not self.bSell then

		if not self:IsEnoughMoney() then

			self:ShowErroMsgOnLowMoney()
			bSuccess = false

		end

	end

	if bSuccess then

    	self:Hide()

    	if not self.bNoBuySound then
    		UI:PlayGlobalSound( self.sounds.buy )
    	end

    	self:NotifyMainWnd( true )

	end

end


--
function UI.BuyWnd:NotifyMainWnd( result )

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.BuyWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnBuyWndResult then
		sys.log( "UI.BuyWnd:NotifyMainWnd()[ERROR]: cannot find OnBuyWndResult() function in wnd %s", self.mainWndName )
		return
	end

	mainWnd:OnBuyWndResult( result, self.mode, self.data )

end


--
function UI.BuyWnd:ShowErroMsgOnLowMoney()

	local msg = UI:GetStringByName( "msg_buyError" )

	local resultStr = UI:GetStringByName( "buyError_SBR_CANT_AFFORD" )	
	msg = string.format( msg, resultStr )

	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

end


--
function UI.BuyWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.okBtn then
		sys.log( "UI.BuyWnd:F_OnMouseLButtonDown(): press button OK. Mouse position: ( '%d' , '%d' )", mouseX, mouseY )
		self:OnOk()

	elseif wnd == self.crossBtn then
		self:OnCancel()

	elseif wnd == self.refillMoneyBtn then
		self:OnRefillMoney()
	end

	return true

end


--
function UI.BuyWnd:OnRefillMoney()

	local moneyMode = self.refillMoneyBtn:GetMode()

	if moneyMode == UI.RefillMoneyBtn.modes.CREDITS then
		UI.HangarWnd:ShowBuyCreditsWnd()

	elseif moneyMode == UI.RefillMoneyBtn.modes.GOLD then
		UI.HangarWnd:ShowBuyGoldWnd()

	else
		sys.log( "UI.BuyWnd:RefillMoney()[ERROR]: invalid refill money mode: %s", tostring( moneyMode ) )
	end

end


--
function UI.BuyWnd:OnEnter( key, controllerIdx )

	sys.log( "UI.BuyWnd:OnEnter(): press button Enter. Key: '%d'", key )
	self:OnOk()
	return true

end


--
function UI.BuyWnd:OnEscape()

	self:OnCancel()
	return true

end


--
function UI.BuyWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	local name = self:GetScriptTableName()
	UI.store[ name ] =
	{
		mode				= self.mode,
		data				= self.data,
		bNoBuySound			= self.bNoBuySound,
		bCanShowRefillBtn	= self.bCanShowRefillBtn,
	}

end


--
function UI.BuyWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()	
	local t = UI.store[ name ]

	if t then
		self:Setup( t.mode, t.bNoBuySound, t.data, t.bCanShowRefillBtn )
		UI.store[ name ] = nil
	end

end


--
function UI.BuyWnd:UpdateRefillMoneyBtn()

	local bNeedBtn, mode = self:NeedRefillMoneyBtn()

	if not bNeedBtn then
		self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )
	else
		self:AddControl( self.refillMoneyBtn, self.layers.WORK_EFFECT, self.effectInfo.work.refillMoneyBtnObjName )
		self.refillMoneyBtn:Setup( mode )
	end

end


--
function UI.BuyWnd:NeedRefillMoneyBtn()

	if not self.bCanShowRefillBtn then
		return false
	end

	if self.bSell then
		return false
	end

	local bEnoughCredits	= true
	local bEnoughGold		= true

	for priceIdx, priceInfo in pairs( self.prices ) do

		if priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS then
		
			if not UI:IsEnoughMoneyForPrice( priceInfo, false, nil ) then
				bEnoughCredits = false
			end

		elseif priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then

			if not UI:IsEnoughMoneyForPrice( priceInfo, false, nil ) then
				bEnoughGold = false
			end

		end

	end

	if not bEnoughCredits or not bEnoughGold then
		return true, not bEnoughCredits and UI.RefillMoneyBtn.modes.CREDITS or UI.RefillMoneyBtn.modes.GOLD
	else
		return false
	end

end


--
function UI.BuyWnd:UpdateOkBtnText()

	local str = ""

	if self.mode == self.modes.SELL_ITEMS then
		str = UI:GetStringByName( "shop_sell" )

	else
		str = UI:GetStringByName( "buy_okBtn" )
	end

	self.okBtn:SetBtnText( str )

end



--
function UI.BuyWnd:UpdateOkBtnState()

	local bEnable = self:IsEnoughMoney()

	if bEnable then

		self:AddControl( self.okBtn, self.layers.WORK_EFFECT, self.effectInfo.work.okBtnLocator )
		self.okBtn:Enable( true )

	else

		if self:NeedRefillMoneyBtn() then
			self:RemoveControl( self.okBtn, self.layers.WORK_EFFECT )
		else
			self:AddControl( self.okBtn, self.layers.WORK_EFFECT, self.effectInfo.work.okBtnLocator )
			self.okBtn:Enable( false )
		end

	end

end


--
function UI.BuyWnd:OnAccountAurasChanged()

	if self.bSell then
		return
	end

	self.prices = self:GetPrice()

	self:UpdatePrice()
	self:UpdateOkBtnState()
	self:UpdateRefillMoneyBtn()

end


-- ----------------------------------------------------------------
-- UI.Buy_OkBtn
-- ----------------------------------------------------------------

--
UI.Buy_OkBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "TextBtn4",
		
		props =
		{
			name			= "Buy_OkBtn",
			isPrototype		= true,		
		},
	}
}