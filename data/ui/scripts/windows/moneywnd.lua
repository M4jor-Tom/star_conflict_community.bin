-- ----------------------------------------------------------------------------
--
-- Workfile: moneywnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------
-- UI.MoneyWnd
-- -----------------------------------------------------------------------

UI.MoneyWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.MoneyWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "MoneyWnd",
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
				defName 			= "money_main",
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
	},

	children = { "UI.Money_BuyGoldBtn", "UI.Money_BuyCreditsBtn", "UI.Money_TransferSynergyBtn" }
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.MoneyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end
	
	self:FullUpdate()

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.MoneyWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix			= "currency_",
		scrollObjName				= "",
		animIdle					= "idle",
		buyGoldBtnLocator			= "btn1",
		buyCreditsBtnLocator		= "btn2",
		transferSynergyBtnLocator	= "btn6",
	}
}

UI.MoneyWnd.btnPrototypeName		= "Money_SlotWnd"
UI.MoneyWnd.MAX_SLOTS				= 11
UI.MoneyWnd.listStyle				= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.MoneyWnd.space_slots				= 0
UI.MoneyWnd.space_slot_actionBtn	= 0
UI.MoneyWnd.slotsRight				= 0

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.MoneyWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )
	
	self:PrepareLayout()

end


--
function UI.MoneyWnd:FullUpdate()

	self:Reset()
	
	local priceTypesOrder =
	{
		_G.GameStore.CreditsType.CT_GOLD,
		_G.GameStore.CreditsType.CT_CREDITS,
		_G.GameStore.CreditsType.CT_TOKENS,
		UI.exPriceTypes.FREE_SYNERGY,
		_G.GameStore.CreditsType.CT_EVENT,
	}

	for priceTypeIdx, priceType in ipairs( priceTypesOrder ) do
	
		local val = UI:GetPlayerFunds( priceType )
		
		local bShow = true

		if priceType == _G.GameStore.CreditsType.CT_EVENT then
			if not _G.GameStore_IsCreditsEventActive() then
				bShow = false
			end
		end
		
		-- #0097788 - каждая валюта не показываются до тех пор, пока игрок не получит ее в первый раз, золото и кредиты показываются всегда
		if bShow then
			if priceType ~= _G.GameStore.CreditsType.CT_GOLD and priceType ~= _G.GameStore.CreditsType.CT_CREDITS then
				if val == 0 and not self:WasCurrencyShown( priceType ) then
					bShow = false
				end
			end
		end


		if bShow then

			local priceInfo =
			{
				priceType	= priceType,
				bIsBuyPrice	= false,
				val			= val,
			}
			
			self:AddRecord( { priceInfo = priceInfo } )
			
			local actionBtn = self:GetActionBtnByPriceType( priceType )
			if actionBtn then
				self:AddChild( actionBtn )
			end
			
			self:SetCurrencyShown( priceType )

		end

	end
	
	self:RecalLayout()

end


--
function UI.MoneyWnd:Reset()

	self:Clear()

	UI.Money_BuyGoldBtn:UnlinkFromParent()
	UI.Money_BuyCreditsBtn:UnlinkFromParent()
	UI.Money_TransferSynergyBtn:UnlinkFromParent()
	
end


--
function UI.MoneyWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:FullUpdate()

end


--
function UI.MoneyWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w == UI.Money_BuyGoldBtn then
		UI.HangarWnd:ShowBuyGoldWnd()

	elseif w == UI.Money_BuyCreditsBtn then
		UI.HangarWnd:ShowBuyCreditsWnd()

	elseif w == UI.Money_TransferSynergyBtn then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		UI.SynergyTransferWnd:Show()
	end

	return true

end


--
function UI.MoneyWnd:WasCurrencyShown( priceType )

	local fieldName = self:GetCurrencyDbFieldName( priceType )
	if fieldName ~= "" then
	
		local allShownTable = UI.serverData.userData.currencyShown
		if type( allShownTable ) == "table" then
			return UI:IsTrueEx( allShownTable[ fieldName ] )
		end
	
	end
	
	return false

end


--
function UI.MoneyWnd:SetCurrencyShown( priceType )

	local fieldName = self:GetCurrencyDbFieldName( priceType )
	if fieldName ~= "" then
	
		local allShownTable = UI.serverData.userData.currencyShown
		if type( allShownTable ) ~= "table" then
			allShownTable = {}
			UI.serverData.userData.currencyShown = allShownTable
		end
		
		allShownTable[ fieldName ] = true
		
		UI:SaveServerUserData()
		
	end

end


-- имя поля в базе для валюты, где запоминается - показывались они уже ранее или нет;
function UI.MoneyWnd:GetCurrencyDbFieldName( priceType )

	-- специально не являются точными копии имен в энуме, т.к. энум может измениться
	
	if priceType == _G.GameStore.CreditsType.CT_GOLD then
		return "gold"
	elseif priceType == _G.GameStore.CreditsType.CT_CREDITS then
		return "credits"
	elseif priceType == _G.GameStore.CreditsType.CT_TOKENS then
		return "tokens"
	elseif priceType == UI.exPriceTypes.FREE_SYNERGY then
		return "free_synergy"
	elseif priceType == _G.GameStore.CreditsType.CT_EVENT then
		return "event_credits"
	else
		sys.log( "UI.MoneyWnd:GetCurrencyDbFieldName()[ERROR]: cannot find db name for priceType %s", tostring( priceType ) )
		return ""
	end

end


--
function UI.MoneyWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd = self:GetButtonForSlot( 1 )
	
	-- выравнивание и отсчет слотов идет справа налево
	-- кнопки (покупка золота/кредитов, перевод синергии и т.п.) входят в состав слотов только логически, технически они отдельно (так исторически сложилось)
	local firstSlotPos			= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos			= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )
	local slotWidth				= slotWnd and slotWnd:GetWidth() or 0
	local buyGoldBtnPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.buyGoldBtnLocator ) or Vec2( 0, 0 )
	local buyGoldBtnWidth		= UI.Money_BuyGoldBtn:GetWidth()
	local buyCreditsBtnPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.buyCreditsBtnLocator ) or Vec2( 0, 0 )
	local buyCreditsBtnWidth	= UI.Money_BuyCreditsBtn:GetWidth()
	local transferSynergyBtnPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.transferSynergyBtnLocator ) or Vec2( 0, 0 )
	
	self.space_slots			= firstSlotPos.x - ( buyCreditsBtnPos.x + buyCreditsBtnWidth )
	self.space_slot_actionBtn	= buyGoldBtnPos.x - ( firstSlotPos.x + slotWidth )
	self.slotsRight				= buyGoldBtnPos.x + buyGoldBtnWidth
	
	UI.Money_BuyGoldBtn:SetTop( buyGoldBtnPos.y )
	UI.Money_BuyCreditsBtn:SetTop( buyCreditsBtnPos.y )
	UI.Money_TransferSynergyBtn:SetTop( transferSynergyBtnPos.y )
	
	for slotIdx = 1, self.MAX_SLOTS do
		local slotWnd = self:GetButtonForSlot( slotIdx )
		if slotWnd then
			slotWnd:SetTop( firstSlotPos.y )
		end
	end

end


--
function UI.MoneyWnd:RecalLayout()

	-- выравнивание слотов идет справа налево;
	-- кнопки (покупка золота/кредитов, перевод синергии и т.п.) входят в состав слотов только логически, технически они отдельно (так исторически сложилось)
	
	local right = self.slotsRight
	
	for recordIdx = 1, self:GetNumRecords() do
	
		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
		
			local priceType = self:GetRecordData( recordIdx ).priceInfo.priceType
			local actionBtn = self:GetActionBtnByPriceType( priceType )
			
			if actionBtn then
				actionBtn:SetLeft( right - actionBtn:GetWidth() )
				slotWnd:SetLeft( actionBtn:GetLeft() - self.space_slot_actionBtn - slotWnd:GetWidth() )
			else
				slotWnd:SetLeft( right - slotWnd:GetWidth() )
			end
			
			right = slotWnd:GetLeft() - self.space_slots
			
		end
	
	end
	
	
end


--
function UI.MoneyWnd:GetActionBtnByPriceType( priceType )

	local actionBtn = nil

	if priceType == _G.GameStore.CreditsType.CT_GOLD then
		actionBtn = UI.Money_BuyGoldBtn
	elseif priceType == _G.GameStore.CreditsType.CT_CREDITS then
		actionBtn = UI.Money_BuyCreditsBtn
	elseif priceType == UI.exPriceTypes.FREE_SYNERGY then
		actionBtn = UI.Money_TransferSynergyBtn
	end
	
	return actionBtn

end


-- перегрузка базовой функции из ButtonsListWnd; кнопки не линкуются к эффекту, т.к. они располагаются динамически
function UI.MoneyWnd:ShowSlot( slot )

	self:AddChild( slot.btn )

end


-- ------------------------------------------------------------------------
-- UI.Money_SlotWnd
-- ------------------------------------------------------------------------

UI.Money_SlotWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.Money_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Money_SlotWnd",
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

			effects =
			{{
				defName 			= "money_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value49",
						layer		= "UI.Money_SlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------------------
-- interface funcitons
-- --------------------------------------

--
function UI.Money_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.VAL )

end

-- --------------------------------------
-- const
-- --------------------------------------

UI.Money_SlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    VAL			= 1,
}

-- --------------------------------------
-- vars
-- --------------------------------------

UI.Money_SlotWnd.metaText		= nil

-- --------------------------------------
-- work funcitons
-- --------------------------------------

--
function UI.Money_SlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.VAL )

end


--
function UI.Money_SlotWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Money_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Money_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Money_SlotWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.VAL )

end


--
function UI.Money_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.VAL then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Money_SlotWnd:UpdateForData( data, bAnimated )

	self:UpdateVal( data )

end


--
function UI.Money_SlotWnd:UpdateVal( data )

	local str = UI:PriceInfo2Str( data.priceInfo, nil, nil, nil, true, nil )
	self.metaText:SetText( str, true )

end

-- -----------------------------------------------------------------------
-- UI.Money_BuyGoldBtn
-- -----------------------------------------------------------------------

UI.Money_BuyGoldBtn = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Money_BuyGoldBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Money_BuyGoldBtn",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
				defName 			= "money_buyGoldBtn",
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

-- ----------------------------------
-- interface funtions
-- ----------------------------------

--
function UI.Money_BuyGoldBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------------
-- const
-- ----------------------------------

UI.Money_BuyGoldBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "idle",
	},
}


UI.Money_BuyGoldBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "hangar_buyGold" ),
	text		= string.format( "%s||%s", UI:GetStringByName( "hangar_buyGold_tooltip" ), UI:GetStringByName( "goldPriceTooltip_desc" ) ),
}

-- ------------------------------------------------------------------------
-- UI.Money_BuyCreditsBtn
-- ------------------------------------------------------------------------

UI.Money_BuyCreditsBtn = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Money_BuyCreditsBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Money_BuyCreditsBtn",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
				defName 			= "money_buyCreditsBtn",
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

-- ----------------------------------
-- interface funtions
-- ----------------------------------

--
function UI.Money_BuyCreditsBtn:GetTooltipData()

	return self.tooltipData

end

-- ----------------------------------
-- const
-- ----------------------------------

UI.Money_BuyCreditsBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "idle",
	}
}

UI.Money_BuyCreditsBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "hangar_exchangeGoldToCredits" ),
	text		= string.format( "%s||%s", UI:GetStringByName( "hangar_exchangeGoldToCredits_tooltip" ), UI:GetStringByName( "creditsPriceTooltip_desc" ) ),
}

-- ------------------------------------------------------------------------
-- UI.Money_TransferSynergyBtn
-- ------------------------------------------------------------------------

UI.Money_TransferSynergyBtn = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Money_TransferSynergyBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Money_TransferSynergyBtn",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
				defName 			= "money_transferSynergyBtn",
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

-- ----------------------------------
-- interface funtions
-- ----------------------------------

--
function UI.Money_TransferSynergyBtn:GetTooltipData()

	return self.tooltipData

end

-- ----------------------------------
-- const
-- ----------------------------------

UI.Money_TransferSynergyBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "idle",
	}
}

UI.Money_TransferSynergyBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "transferSynergyBtn_tooltip_caption" ),
	text		= string.format( "%s||%s", UI:GetStringByName( "transferSynergyBtn_tooltip_text" ), UI:GetStringByName( "freeSynergyPriceTooltip_desc" ) ),
}