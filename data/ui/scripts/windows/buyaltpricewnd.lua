-- ----------------------------------------------------------------------------
--
-- Workfile: buyaltpricewnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.BuyAltPriceWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.BuyAltPriceWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "BuyAltPriceWnd",
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
						layer		= "UI.BuyAltPriceWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.BuyAltPriceWnd.layers.WORK_EFFECT",
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
						layer		= "UI.BuyAltPriceWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",	
						layer		= "UI.BuyAltPriceWnd.layers.MSG",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price_2",	
						layer		= "UI.BuyAltPriceWnd.layers.PRICE",
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
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------------
-- interface funtions
-- -------------------------------------

--
function UI.BuyAltPriceWnd:Setup( mode, bNoBuySound, data, bCanRefill )

	self:Reset()

	if bCanRefill == nil then
		bCanRefill = true
	end

	self.mode = mode
	self.data = data
	self.bCanRefill = bCanRefill

	self.bNoBuySound = bNoBuySound
	if self.bNoBuySound == nil then
		self.bNoBuySound = false
	end

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.BuyAltPriceWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdatePriceBtns()

end   


-- -------------------------------------
-- const
-- -------------------------------------

--
UI.BuyAltPriceWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    MSG				= 4,
    PRICE			= 5,
}

UI.BuyAltPriceWnd.modes =
{
	SALVAGE		= 1,
	LOOT_ITEM	= 2,
	CHANGE_RACE	= 3,
}

UI.BuyAltPriceWnd.effectInfo =
{
	work =
	{
		crossBtnLocator		= "btn_x5",

		priceBtnLocators	=
		{
			"button_1",
			"button_2",
		}
	},
}

UI.BuyAltPriceWnd.MAX_PRICE_BTNS = 2

UI.BuyAltPriceWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
	buy		= "sound/ui/apply",
}

UI.BuyAltPriceWnd.mainWndName	= ""

-- -------------------------------------
-- vars
-- -------------------------------------

UI.BuyAltPriceWnd.mode				= -1
UI.BuyAltPriceWnd.data				= nil
UI.BuyAltPriceWnd.bCanRefill		= true
UI.BuyAltPriceWnd.priceBtns			= {}
UI.BuyAltPriceWnd.crossBtn			= nil
UI.BuyAltPriceWnd.priceCredits		= 0
UI.BuyAltPriceWnd.priceGold			= 0
UI.BuyAltPriceWnd.bNoBuySound		= false
UI.BuyAltPriceWnd.priceMetaText		= nil
UI.BuyAltPriceWnd.hMsgGoldConfirm	= UI.INVALID_UI_HANDLE
UI.BuyAltPriceWnd.msgMetaText		= nil

-- -------------------------------------
-- work funtions
-- -------------------------------------

--
function UI.BuyAltPriceWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceBtns = {}

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

	self.msgMetaText = UI.MetaText.GetNewInstance()
	self.msgMetaText:InitFromLayer( self, self.layers.MSG ) 	

	self:Reset()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	
	UI:AddOverlayWnd( self:GetScriptTableName() )

end


--
function UI.BuyAltPriceWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	if self.msgMetaText then
		self.msgMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BuyAltPriceWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.BuyAltPriceWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BuyAltPriceWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
	self.msgMetaText:UpdateScreenOrgFromLayer( self, self.layers.MSG )	

end


--
function UI.BuyAltPriceWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.MSG then
		self.msgMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BuyAltPriceWnd:CreateControls()

	self.crossBtn = UI:CreateChildWnd( self, UI.CrossBtn, "" )
	self:AddControl( self.crossBtn, self.layers.WORK_EFFECT, self.effectInfo.work.crossBtnLocator )

	for priceBtnIdx = 1, self.MAX_PRICE_BTNS do	
		local priceBtn = UI:CreateChildWnd( self, UI.BuyAltPrice_PriceBtn, tostring( priceBtnIdx ) )
		table.insert( self.priceBtns, priceBtn )
	end

end


--
function UI.BuyAltPriceWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.BuyAltPriceWnd:RemoveControl( wnd, effectLayer )

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
function UI.BuyAltPriceWnd:Reset()

	self.mode			= -1
	self.data			= nil
	self.bNoBuySound	= false
	self.priceCredits	= 0
	self.priceGold		= 0

	self:SetText( "", self.layers.CAPTION )
	self.msgMetaText:SetText( "", true )

	self.priceMetaText:SetText( "", true )

	for priceBtnIdx, priceBtn in pairs( self.priceBtns ) do	
		self:RemoveControl( priceBtn, self.layers.WORK_EFFECT )
	end

end


--
function UI.BuyAltPriceWnd:FullUpdate()

	self.priceCredits, self.priceGold = self:GetPrice()

	self:UpdateCaption()
	self:UpdateMsg()
	self:UpdatePrice()
	self:UpdatePriceBtns()

end


--
function UI.BuyAltPriceWnd:GetPrice()

	local credits	= 0
	local gold		= 0

	if self.mode == self.modes.SALVAGE then

		credits	= self.data.priceCredits or 0
		gold	= self.data.priceGold or 0

	elseif self.mode == self.modes.LOOT_ITEM then

		credits	= self.data.priceCredits or 0
		gold	= self.data.priceGold or 0

	elseif self.mode == self.modes.CHANGE_RACE then

		credits, gold = _G.GameStore_GetAutoPilotCost( UI:Reputation2Rank( UI:GetPlayerMaxReputationForRace() ) )

	else
		sys.log( "UI.BuyAltPriceWnd:GetPrice()[ERROR]: unhandled mode - %s", tostring( self.mode ) )
	end

	return credits, gold

end


--
function UI.BuyAltPriceWnd:UpdateCaption()

	local captionId = ""

	if self.mode == self.modes.SALVAGE then
		captionId = "msgCapt_salvage"

	elseif self.mode == self.modes.LOOT_ITEM then
		captionId = "msgCapt_lootItem"

	elseif self.mode == self.modes.CHANGE_RACE then
		captionId = "quests_changeRace_caption"

	else
		sys.log( "UI.BuyAltPriceWnd:UpdateCaption()[ERROR]: unhandled mode - %s", tostring( self.mode ) )
	end

	local caption = ""

	if captionId ~= "" then
		caption = UI:GetStringByName( captionId )
	end

	self:SetText( caption, self.layers.CAPTION )

end


--
function UI.BuyAltPriceWnd:UpdateMsg()

	local msg = ""

	if self.mode == self.modes.SALVAGE then

		msg = UI:GetStringByName( "msg_salvage" )

		local strRefundItems = ""

		local defName = self.data.defName
		if type( defName ) == "string" then

    		local refundItems = UI:GetSalvageRefundItems( defName )
    		for itemIdx, itemInfo in ipairs( refundItems ) do

    			local strItem = ""

    			if UI:IsDefModule( itemInfo.defName ) or UI:IsDefAmmo( itemInfo.defName ) then
    				strItem = string.format( "$link [type ITEM][params {defName=\"%s\", bEnchanted=%s}]$", itemInfo.defName, false )

    			elseif UI:IsDefResource( itemInfo.defName ) or UI:IsDefBlueprint( itemInfo.defName ) then
    				strItem = string.format( "$link [type RESOURCE][params {defName=\"%s\"}]$", itemInfo.defName )

    			else

    				sys.log( "UI.BuyAltPriceWnd:UpdateMsg()[ERROR]: unhandled item type to make link (def %s)", itemInfo.defName )

    				strItem = UI:GetEntityLocalizedNameByDef( itemInfo.defName, true )
    				strItem = string.format( "%s%s", strItem, UI:Color2Str( self:GetColor( self.layers.MSG ) ) )

    			end

    			if itemInfo.count > 1 then
    				strItem = string.format( "%s[%d]", strItem, itemInfo.count )
    			end

    			strRefundItems = string.format( "%s%s%s", strRefundItems, strRefundItems ~= "" and ", " or "", strItem )

    		end

    		local refundIridium = self.data.refundIridium
			if type( refundIridium ) == "number" then

        		if refundIridium > 0 then

        			local strIridium = string.format( "%s$iridium$", UI:Num2StrSeparatedBy3( refundIridium ) )
        			strRefundItems = string.format( "%s%s%s", strRefundItems, strRefundItems ~= "" and ", " or "", strIridium )

        		end

			else
				sys.log( "UI.BuyAltPriceWnd:UpdateMsg()[ERROR]: invalid type od \"data.refundIridium\"; \"number\" expected, got \"%s\"", type( refundIridium ) )
			end

		else
			sys.log( "UI.BuyAltPriceWnd:UpdateMsg()[ERROR]: invalid type od \"data.defName\"; \"string\" expected, got \"%s\"", type( defName ) )
		end

		local numSubst = 0
		msg, numSubst = string.gsub( msg, "%$items%$", strRefundItems )

		if numSubst == 0 then
			sys.log( "UI.BuyAltPriceWnd:UpdateMsg()[ERROR]: cannot find placeholder \"$items$\" in string \"msg_salvage\"" )
			msg = string.format( "%s. [INVALID STRING] You will gain items: %s", msg, strRefundItems )
		end

	elseif self.mode == self.modes.LOOT_ITEM then
		msg = UI:GetStringByName( "msg_lootItem" )

	elseif self.mode == self.modes.CHANGE_RACE then
		msg = UI:GetStringByName( "quests_changeRace_text" )

	else
		sys.log( "UI.BuyAltPriceWnd:UpdateMsg()[ERROR]: unhandled mode - %s", tostring( self.mode ) )
	end

	self.msgMetaText:SetText( msg, true )

end  


--
function UI.BuyAltPriceWnd:UpdatePrice()

	local priceInfos = {}
	local playerMoney = nil
	local priceIdx = 1

	if self.priceCredits > 0 then

		local creditsPriceInfo = {}

		creditsPriceInfo.priceType 		= _G.GameStore.CreditsType.CT_CREDITS
		creditsPriceInfo.val			= self.priceCredits
		creditsPriceInfo.bIsBuyPrice	= true
		creditsPriceInfo.basePrice		= self.priceCredits

		table.insert( priceInfos, creditsPriceInfo )

		if self.data.playerCredits then

			if not playerMoney then
				playerMoney = {}
			end

			playerMoney[ priceIdx ] = self.data.playerCredits

		end

		priceIdx = priceIdx + 1

	end

	if self.priceGold > 0 then

		local goldPriceInfo = {}

		goldPriceInfo.priceType 	= _G.GameStore.CreditsType.CT_GOLD
		goldPriceInfo.val			= self.priceGold
		goldPriceInfo.bIsBuyPrice	= true
		goldPriceInfo.basePrice		= self.priceGold

		table.insert( priceInfos, goldPriceInfo )

		if self.data.playerGold then

			if not playerMoney then
				playerMoney = {}
			end

			playerMoney[ priceIdx ] = self.data.playerGold

		end

		priceIdx = priceIdx + 1

	end

	local str = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.PRICE ), false, true, true, playerMoney )
	self.priceMetaText:SetText( str, true )

end


--
function UI.BuyAltPriceWnd:IsEnoughMoney( bGold )

	if bGold then

		local playerGold = self.data.playerGold or UI:GetPlayerMoney( true )
		return self.priceGold <= playerGold

	else

		local playerCredits = self.data.playerCredits or UI:GetPlayerMoney( false )
		return self.priceCredits <= playerCredits

	end

end


--
function UI.BuyAltPriceWnd:Cancel()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	self:NotifyMainWnd( false )

end


--
function UI.BuyAltPriceWnd:TryBuy( bGold )

	if self:IsEnoughMoney( bGold ) then

		if bGold and ( self.mode == self.modes.LOOT_ITEM or self.mode == self.modes.CHANGE_RACE ) then

			local strGold = string.format( "%s$gold_big$", UI:Num2StrSeparatedBy3( self.priceGold ) )
			local text = UI:GetStringByName( "goldSpendConfirm" )
			text = string.gsub( text, "%$gold%$", strGold )			

			self.hMsgGoldConfirm = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), text, UI.MBS_YES_NO )

		else	
			self:DoBuy( bGold )
		end

	else
		sys.log( "UI.BuyAltPriceWnd:TryBuy()[ERROR]: not enough money" )
	end

end


--
function UI.BuyAltPriceWnd:DoBuy( bGold )

	self:Hide()

	if not self.bNoBuySound then
		UI:PlayGlobalSound( self.sounds.buy )
	end

	self:NotifyMainWnd( true, bGold )

end


--
function UI.BuyAltPriceWnd:NotifyMainWnd( result, bGold )

	if result == true and bGold == nil then
		sys.log( "UI.BuyAltPriceWnd:NotifyMainWnd()[ERROR]: invalid params" )
		return
	end

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.BuyAltPriceWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnBuyAltPriceWndResult then
		sys.log( "UI.BuyAltPriceWnd:NotifyMainWnd()[ERROR]: cannot find OnBuyAltPriceWndResult() function in wnd %s", self.mainWndName )
		return
	end

	mainWnd:OnBuyAltPriceWndResult( result, self.mode, self.data, bGold )

end


--
function UI.BuyAltPriceWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.crossBtn then
		self:Cancel()

	elseif UI:IsWndKindOf( wnd, "BuyAltPrice_PriceBtn" ) then

		local btnState = wnd:GetState()

		if btnState == UI.BuyAltPrice_PriceBtn.states.BUY then
			self:TryBuy( wnd:IsGold() )

		elseif btnState == UI.BuyAltPrice_PriceBtn.states.REFILL then
			self:OnRefillMoney( wnd:IsGold() )
		end

	end

	return true

end


--
function UI.BuyAltPriceWnd:OnRefillMoney( bGold )

	if not UI.HangarWnd:IsOnScreen() then
		sys.log( "UI.BuyAltPriceWnd:OnRefillMoney()[ERROR]: HangarWnd is not on screen" )
		return
	end

	if not bGold then
		UI.HangarWnd:ShowBuyCreditsWnd()
	else
		UI.HangarWnd:ShowBuyGoldWnd()
	end

end


--
function UI.BuyAltPriceWnd:OnEscape()

	self:Cancel()
	return true

end


--
function UI.BuyAltPriceWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	local name = self:GetScriptTableName()
	UI.store[ name ] =
	{
		mode				= self.mode,
		data				= self.data,
		bNoBuySound			= self.bNoBuySound,
		bCanRefill			= self.bCanRefill,
	}

end


--
function UI.BuyAltPriceWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()	
	local t = UI.store[ name ]

	if t then
		self:Setup( t.mode, t.bNoBuySound, t.data, t.bCanRefill )
		UI.store[ name ] = nil
	end

end


--
function UI.BuyAltPriceWnd:UpdatePriceBtns()

	for priceBtnIdx, priceBtn in pairs( self.priceBtns ) do	
		self:RemoveControl( priceBtn, self.layers.WORK_EFFECT )
	end

	local priceInfos = {}

	if self.priceCredits > 0 then

		local priceInfo =
		{
			bGold			= false,
			bEnoughMoney	= self:IsEnoughMoney( false ),
			bFree			= false,
		}

		table.insert( priceInfos, priceInfo )

	end

	if self.priceGold > 0 then

		local priceInfo =
		{
			bGold			= true,
			bEnoughMoney	= self:IsEnoughMoney( true ),
			bFree			= false,
		}

		table.insert( priceInfos, priceInfo )

	end

	if not next( priceInfos ) then

		local priceInfo =
		{
			bGold			= false,
			bEnoughMoney	= true,
			bFree			= true,
		}

		table.insert( priceInfos, priceInfo )

	end

	local numPrices = #priceInfos
	for priceIdx = 1, numPrices do

		local priceInfo = priceInfos[ priceIdx ]

		local btnIdx = self.MAX_PRICE_BTNS - numPrices + priceIdx
		local priceBtn = self.priceBtns[ btnIdx ]		

		self:AddControl( priceBtn, self.layers.WORK_EFFECT, string.format( self.effectInfo.work.priceBtnLocators[ btnIdx ] ) )

		priceBtn:Setup( priceInfo.bGold, priceInfo.bFree, priceInfo.bEnoughMoney, self.bCanRefill, self.mode )

	end

end


--
function UI.BuyAltPriceWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgGoldConfirm then

		self.hMsgGoldConfirm = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoBuy( true )
		end

	end

end


--
function UI.BuyAltPriceWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then

		if self.hMsgGoldConfirm ~= UI.INVALID_UI_HANDLE then

			UI:RemoveUiObj( self.hMsgGoldConfirm )
			UI:Purge()

			self.hMsgGoldConfirm = UI.INVALID_UI_HANDLE

		end

	end

end


-- -------------------------------------------------------------------
-- UI.BuyAltPrice_PriceBtn
-- -------------------------------------------------------------------

UI.BuyAltPrice_PriceBtn = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.BuyAltPrice_PriceBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn4",

	props =
	{
		name		= "BuyAltPrice_PriceBtn",
		isPrototype	= true,	
	},

	layers =
	{
		-- TEXT
		{
			id				= UI.TextBtn.layers.TEXT ,

			layerStyle		= UI.WLS_OWNERDRAW,
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------------
-- interface funtions
-- -------------------------------------

--
function UI.BuyAltPrice_PriceBtn:Setup( bGold, bFree, bEnoughMoney, bCanRefill, buyMode )

	self:Reset()

	self.bGold			= bGold
	self.bFree			= bFree
	self.bEnoughMoney	= bEnoughMoney
	self.bCanRefill		= bCanRefill
	self.buyMode		= buyMode

	self:FullUpdate()

end


--
function UI.BuyAltPrice_PriceBtn:Reset()

	self.bGold			= false
	self.bFree			= false
	self.bEnoughMoney	= false
	self.bCanRefill		= false
	self.buyMode		= -1

	self.state = -1

	self:SetBtnText( "" )
	self:Enable( false )

end


--
function UI.BuyAltPrice_PriceBtn:IsGold()

	return self.bGold

end


--
function UI.BuyAltPrice_PriceBtn:IsFree()

	return self.bFree

end


--
function UI.BuyAltPrice_PriceBtn:GetState()

	return self.state

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.BuyAltPrice_PriceBtn.states =
{
	BUY		= 1,
	REFILL	= 2,
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.BuyAltPrice_PriceBtn.bGold			= false
UI.BuyAltPrice_PriceBtn.bEnoughMoney	= false
UI.BuyAltPrice_PriceBtn.bCanRefill		= false
UI.BuyAltPrice_PriceBtn.bFree			= false
UI.BuyAltPrice_PriceBtn.buyMode			= -1

UI.BuyAltPrice_PriceBtn.metaText		= nil
UI.BuyAltPrice_PriceBtn.state			= -1

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.BuyAltPrice_PriceBtn:F_PostLoad()

	UI.TextBtn4.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 

end


--
function UI.BuyAltPrice_PriceBtn:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BuyAltPrice_PriceBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.BuyAltPrice_PriceBtn:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BuyAltPrice_PriceBtn:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.BuyAltPrice_PriceBtn:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BuyAltPrice_PriceBtn:SetBtnText( text )

	self.metaText:SetText( text, true )

end


--
function UI.BuyAltPrice_PriceBtn:FullUpdate()

	self.state = self.states.BUY

	if not self.bEnoughMoney and self.bCanRefill then
		self.state = self.states.REFILL
	end

	local str = ""

	if self.state == self.states.BUY then

		if self.buyMode == UI.BuyAltPriceWnd.modes.CHANGE_RACE then
			str = UI:GetStringByName( "quests_changeRace_changeBtn" )
		else
			str = UI:GetStringByName( "buyAltPrice_buyBtn" )
		end

	elseif self.state == self.states.REFILL then
		str = UI:GetStringByName( "refillMoneyBtn" )
	end

	if not self.bFree then
		local strIco = self.bGold and "$gold_big$" or "$credits_big$"
		str = string.format( "%s %s", str, strIco )
	end

	self:SetBtnText( str )

	local bEnable = false

	if self.state == self.states.REFILL then
		bEnable = true
	else
		bEnable = self.bEnoughMoney
	end

	self:Enable( bEnable )

	local color = self:GetColor( self.layers.TEXT )
	self.metaText:SetColor( color )

end