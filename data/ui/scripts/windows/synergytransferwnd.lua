-- ----------------------------------------------------------------------------
--
-- Workfile: synergytransferwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.SynergyTransferWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.SynergyTransferWnd.layers =
{
	MAIN_EFFECT			= 0,
	BG_EFFECT			= 1,
	WORK_EFFECT			= 2,
	CAPTION				= 3,
	DESC				= 4, 
    SHIPS_SYNERGY_TOTAL	= 5, 
	TRANSFER_RATE		= 6, 
	TRANSFER_VAL_LABEL	= 7, 
	COST_TOTAL			= 8, 
	WAIT_EFFECT			= 9, 
	WAIT_TEXT			= 10,
}

--
UI.SynergyTransferWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name	= "SynergyTransferWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.SynergyTransferWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "synergyTransfer_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "trans_syn",
						layer		= "UI.SynergyTransferWnd.layers.WORK_EFFECT",
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
				defName 			= "synergyTransfer_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.SynergyTransferWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "descript",
						layer		= "UI.SynergyTransferWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price_1",
						layer		= "UI.SynergyTransferWnd.layers.SHIPS_SYNERGY_TOTAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_3",
						layer		= "UI.SynergyTransferWnd.layers.TRANSFER_RATE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_5",
						layer		= "UI.SynergyTransferWnd.layers.TRANSFER_VAL_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "syn_sl",
						wnd			= "UI.SynergyTransfer_TransferValInputWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "syn_ico",
						wnd			= "UI.SynergyTransfer_TransferValIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price_2",
						layer		= "UI.SynergyTransferWnd.layers.COST_TOTAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.SynergyTransfer_OkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.SynergyTransfer_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.SynergyTransferWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.SynergyTransfer_CrossBtn",
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
			text			= UI:GetStringByName( "synergyTransfer_caption" ),
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "synergyTransfer_desc" ),
		},

		-- SHIPS_SYNERGY_TOTAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- TRANSFER_RATE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 	

		-- TRANSFER_VAL_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "synergyTransfer_transferVal" )
		},

		-- COST_TOTAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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
						layer		= "UI.SynergyTransferWnd.layers.WAIT_TEXT",
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
		"UI.SynergyTransfer_TransferValInputWnd",
		"UI.SynergyTransfer_TransferValIcoWnd",
		"UI.SynergyTransfer_OkBtn",
		"UI.SynergyTransfer_CancelBtn",
		"UI.SynergyTransfer_CrossBtn",
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.SynergyTransferWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:ValidateShips()

end


--
function UI.SynergyTransferWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:ValidateShips()

end


--
function UI.SynergyTransferWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:ValidateShips()

end


--
function UI.SynergyTransferWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:ValidateShips()

end


--
function UI.SynergyTransferWnd:GameStore_OnExtractVesselExp( result, requestId, vids )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

			self:ValidateShips()

			if requestId == self.transferRequestId then
				self:ResetAfterTransfer()
			end

		end

	else

		if requestId == self.transferRequestId then
			self:ShowMsgOnTransferError( result )
		end

	end

	if requestId == self.transferRequestId then
		self.transferRequestId = 0
		self:UpdateWaitEffect()
	end

end


--
function UI.SynergyTransferWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	local vid = u64( param1, param2 )
	local shipItem = UI:GetShipItem( vid )

	if not shipItem or not self:NeedShowShip( shipItem ) then
		return
	end

	self:ValidateShips()

end


--
function UI.SynergyTransferWnd:OnBuyWndResult( result, mode, buyWndInfo )

	if mode == UI.BuyWnd.modes.SYNERGY_TRANSFER then

		if result then
			UI:PlayGlobalSound( self.sounds.transfer )
			self:DoTransfer()
		end

		self.transferInfo = {}

	else
		sys.log( "UI.SynergyTransferWnd:OnBuyWndResult()[ERROR]: unhandled mode: %s", tostring( mode ) )
	end

end


-- нет самостоятельной подписки, вызывается из UI.HangarWnd
function UI.SynergyTransferWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.transferRequestId = 0
	self:UpdateWaitEffect()

end


--
function UI.SynergyTransferWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.SynergyTransfer_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end


--
function UI.SynergyTransferWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )	

	if result == _G.GameStore.StoreBuyResult.SBR_OK then
		if self:IsOnScreen() then
			self:ValidateShips()
		end
	end

end


-- ----------------------------
-- const
-- ----------------------------

UI.SynergyTransferWnd.sounds =
{
	slotMouseOver	= "sound/ui/btnMouseOver",
	tradeWndShow	= "sound/ui/btnClick",
	transfer		= "sound/ui/apply",
	hide			= "sound/ui/MsgHide",
}

UI.SynergyTransferWnd.TRANSFER_VAL_UPDATE_DELAY	= 1.5

-- ----------------------------
-- vars
-- ----------------------------

UI.SynergyTransferWnd.transferRateMetaText		= nil
UI.SynergyTransferWnd.transferValUpdateTimer	= -1
UI.SynergyTransferWnd.transferValValidated		= true
UI.SynergyTransferWnd.transferRequestId			= 0
UI.SynergyTransferWnd.transferInfo				= {}
UI.SynergyTransferWnd.savedParams				= nil
UI.SynergyTransferWnd.synergyTotalMetaText		= nil
UI.SynergyTransferWnd.costTotalMetaText			= nil
UI.SynergyTransferWnd.ships						= {}

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.SynergyTransferWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.transferRateMetaText = UI.MetaText.GetNewInstance() 
	self.transferRateMetaText:InitFromLayer( self, self.layers.TRANSFER_RATE ) 

	self.synergyTotalMetaText = UI.MetaText.GetNewInstance()
	self.synergyTotalMetaText:InitFromLayer( self, self.layers.SHIPS_SYNERGY_TOTAL ) 	

	self.costTotalMetaText = UI.MetaText.GetNewInstance()
	self.costTotalMetaText:InitFromLayer( self, self.layers.COST_TOTAL )

	self:Reset()
	self:HideWaitEffect()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SLIDER_CHANGED )

end


--
function UI.SynergyTransferWnd:F_Shutdown()

	if self.transferRateMetaText then
		self.transferRateMetaText:Clear()
	end

	if self.synergyTotalMetaText then
		self.synergyTotalMetaText:Clear()
	end

	if self.costTotalMetaText then
		self.costTotalMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.SynergyTransferWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.SynergyTransferWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.SynergyTransferWnd:UpdateMetaTextPos()

	self.transferRateMetaText:UpdateScreenOrgFromLayer( self, self.layers.TRANSFER_RATE )
	self.synergyTotalMetaText:UpdateScreenOrgFromLayer( self, self.layers.SHIPS_SYNERGY_TOTAL )
	self.costTotalMetaText:UpdateScreenOrgFromLayer( self, self.layers.COST_TOTAL )

end


--
function UI.SynergyTransferWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TRANSFER_RATE then
		self.transferRateMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.SHIPS_SYNERGY_TOTAL then
		self.synergyTotalMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.COST_TOTAL then
		self.costTotalMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.SynergyTransferWnd:Reset()

	self.transferRateMetaText:SetText( "", true )
	UI.SynergyTransfer_TransferValInputWnd:SetVal( 0 )
	self.synergyTotalMetaText:SetText( "", true )
	self.costTotalMetaText:SetText( "", true )
	UI.SynergyTransfer_OkBtn:Enable( false )

	self.transferValUpdateTimer = -1
	self.transferValValidated = true
	self.transferInfo = {}
	self.ships = {}

end


--
function UI.SynergyTransferWnd:FullUpdate()

	self:Reset()

	self:UpdateTransferRate()
	self:UpdateTransferValInputStep()

	self:UpdateShips()

	self:UpdateTotalCost()
	self:UpdateOkBtnState()

	-- по умолчанию количество синергии для перевода установлено в максимально возможное
	if next( self.ships ) then
		UI.SynergyTransfer_TransferValInputWnd:SetVal( UI.SynergyTransfer_TransferValInputWnd:GetMax() )
	end

	-- восстановление при перезагрузке ресурсов
	if self.savedParams then
		UI.SynergyTransfer_TransferValInputWnd:SetVal( self.savedParams.transferVal )
		self.savedParams = nil
	end

end


--
function UI.SynergyTransferWnd:UpdateShips()

	self.ships = {}

	for itemIdx, shipItem in pairs( UI.serverData.ships ) do
		if self:NeedShowShip( shipItem ) then
			table.insert( self.ships, shipItem )
		end
	end

	self:OnShipsChanged()

end


--
function UI.SynergyTransferWnd:NeedShowShip( shipItem )

	return UI:CanExtractShipSynergy( shipItem )

end


--
function UI.SynergyTransferWnd:ValidateShips()

	self:UpdateShips()

	self.transferValValidated = false
	self:ValidateTransferVal()	

end


--
function UI.SynergyTransferWnd:ResetAfterTransfer()

	UI.SynergyTransfer_TransferValInputWnd:SetVal( 0 )

end


--
function UI.SynergyTransferWnd:UpdateTransferRate()

	local transferRate = self:GetTransferRate()
	
	local intPart, floatPart = math.modf( transferRate )
	if floatPart ~= 0 then
		sys.log( "UI.SynergyTransferWnd:UpdateTransferRate()[ERROR]: transfer rate is float!" )
		transferRate = UI:Round( transferRate )
	end

	local bonus = self:GetTransferRateBonus()

	local strSynergyVal = ""
	if bonus == 0 then
		strSynergyVal = UI:Num2StrSeparatedBy3( transferRate )
	else
		local transferRateWoBonus = transferRate - bonus
		strSynergyVal = string.format( "%s (+%s %s)", UI:Num2StrSeparatedBy3( transferRateWoBonus ), UI:Num2StrSeparatedBy3( bonus ), UI:GetStringByName( "synergyTransfer_bonus" ) )
	end

	local synergyPriceInfo =
	{
		priceType	= UI.exPriceTypes.FREE_SYNERGY,
		val			= transferRate,
		bIsBuyPrice	= false,
		valAsString	= strSynergyVal,
	}

	local strSynergy = UI:PriceInfo2Str( synergyPriceInfo, self:GetColor( self.layers.TRANSFER_RATE ), false, false, true, nil )


	local goldPriceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_GOLD,
		val			= 1,
		bIsBuyPrice	= false,
	}

	local strGold = UI:PriceInfo2Str( goldPriceInfo, self:GetColor( self.layers.TRANSFER_RATE ), false, false, true, nil )

	local str = string.format( "%s: %s = %s", UI:GetStringByName( "synergyTransfer_transferRate" ), strGold, strSynergy )
	self.transferRateMetaText:SetText( str, true )

end


--
function UI.SynergyTransferWnd:UpdateTransferValInputStep()

	local transferRate = self:GetTransferRate()
	UI.SynergyTransfer_TransferValInputWnd:SetStep( transferRate )	

end


--
function UI.SynergyTransferWnd:UpdateTransferValInputRange()

	local totalShipsSynergy = self:GetTotalShipsSynergy()	
	local maxTransferVal = self:CalcValidTransferVal( totalShipsSynergy )

	UI.SynergyTransfer_TransferValInputWnd:SetMax( maxTransferVal )

end


--
function UI.SynergyTransferWnd:OnShipsChanged()

	self:UpdateTotalShipsSynergy()
	self:UpdateTransferValInputRange()

end


--
function UI.SynergyTransferWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if w == UI.SynergyTransfer_OkBtn then
		self:TryTransfer()

	elseif w == UI.SynergyTransfer_CancelBtn then
		self:Close( true )	

	elseif w == UI.SynergyTransfer_CrossBtn then
		self:Close( true )	
	end

	return true	

end


--
function UI.SynergyTransferWnd:UpdateTotalShipsSynergy()

	local priceInfo =
	{
		priceType	= UI.exPriceTypes.SYNERGY,
		val			= self:GetTotalShipsSynergy(),
		bIsBuyPrice	= false,
	}

	local strVal = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.SHIPS_SYNERGY_TOTAL ), false, false, true, nil )
	local str = string.format( "%s %s", UI:GetStringByName( "synergyTransfer_shipsSinergyTotal" ), strVal )

	self.synergyTotalMetaText:SetText( str, true )

end


--
function UI.SynergyTransferWnd:GetTotalShipsSynergy()

	local totalSynergy = 0

	for idx, shipItem in pairs( self.ships ) do
		totalSynergy = totalSynergy + UI:GetShipExp( shipItem )
	end

	return totalSynergy

end


--
function UI.SynergyTransferWnd:UpdateTotalCost()

	if not self.transferValValidated then
		return
	end

	local cost = self:GetTotalCost()

	local priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_GOLD,
		val			= cost,
		bIsBuyPrice	= true,
		basePrice	= cost,
		bDisableFree= true,
	}

	local strVal = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.COST_TOTAL ), false, false, true, nil )
	local str = string.format( "%s %s", UI:GetStringByName( "synergyTransfer_costTotal" ), strVal )

	self.costTotalMetaText:SetText( str, true )

end


--
function UI.SynergyTransferWnd:GetTotalCost()

	if not self.transferValValidated then
		sys.log( "UI.SynergyTransferWnd:GetTotalCost()[ERROR]: transfer val is not validated" )
	end

	local cost = 0

	local transferVal = self:GetTransferVal( true )
	if transferVal > 0 then

    	local transferRate = self:GetTransferRate()

    	cost = transferVal / transferRate

    	local intPart, floatPart = math.modf( cost )
    	if floatPart ~= 0 then
    		sys.log( "UI.SynergyTransferWnd:GetTotalCost()[ERROR]: total cost is float!" )
    		cost = UI:Round( cost )
    	end

    	-- есть альтернативный способ получения цены
    	local altCost = _G.GameStore_GetVesselExpExtractionCost( transferVal )
    	if altCost ~= cost then
    		sys.log( "UI.SynergyTransferWnd:GetTotalCost()[ERROR]: calculated cost does not match that from GameStore_GetVesselExpExtractionCost(): %d vs %d for transfer val %d", cost, altCost, transferVal )
    	end

	end

	return cost

end


--
function UI.SynergyTransferWnd:ValidateTransferVal()

	if self.transferValValidated then
		return
	end

	local rawVal	= self:GetTransferVal( false )
	local fixedVal	= self:CalcValidTransferVal( rawVal )

	if fixedVal == rawVal then

		self.transferValValidated = true
		self:UpdateTotalCost()
		self:UpdateOkBtnState()

	else
		UI.SynergyTransfer_TransferValInputWnd:SetVal( fixedVal )
	end

end


--
function UI.SynergyTransferWnd:CalcValidTransferVal( transferVal )

	local transferRate	= self:GetTransferRate()	
	local totalShipsVal	= self:GetTotalShipsSynergy()

	if transferVal > totalShipsVal then
		transferVal = totalShipsVal
	end

	local cost = transferVal / transferRate
	if cost - math.floor( cost ) ~= 0 then

    	local valFloor = math.floor( cost ) * transferRate
    	local valCeil = math.ceil( cost ) * transferRate

		-- до стоимости в 1 золотой округляется к бОльшему, в остальных случаях - к ближайшему
		if valFloor == 0 or math.abs( transferVal - valCeil ) < math.abs( transferVal - valFloor ) then

			transferVal = valCeil

    		if transferVal > totalShipsVal then
    			transferVal = valFloor
    		end

    	else
    		transferVal = valFloor
    	end	

	end

	return transferVal

end


--
function UI.SynergyTransferWnd:GetTransferVal( bCheckValid )

	if bCheckValid == nil then
		bCheckValid = true
	end

	if bCheckValid then
		if not self.transferValValidated then
			sys.log( "UI.SynergyTransferWnd:GetTransferVal()[ERROR]: transfer value is not validated" )
		end		
	end

	return UI.SynergyTransfer_TransferValInputWnd:GetVal()

end


--
function UI.SynergyTransferWnd:GetTransferRate()

	local transferRate = _G.GameStore_GetVesselExpExtractionPerGold()

	if type( transferRate ) ~= "number" then
		sys.log( "UI.SynergyTransferWnd:GetTransferRate()[ERROR]: invalid type of return value from GameStore_GetVesselExpExtractionPerGold(); \"number\" expected, got \"%s\"", type( transferRate ) )
		return 1
	end

	if transferRate <= 0 then
		sys.log( "UI.SynergyTransferWnd:GetTransferRate()[ERROR]: invalid synergy transfer rate: %d", transferRate )
		return 1
	end

	return transferRate

end


--
function UI.SynergyTransferWnd:GetTransferRateBonus()

	local bonus = _G.GameStore_GetVesselExpExtractionCostVisualBonus()

	if type( bonus ) ~= "number" then
		sys.log( "UI.SynergyTransferWnd:GetTransferRateBonus()[ERROR]: invalid type of return value from GameStore_GetVesselExpExtractionCostVisualBonus(); \"number\" expected, got \"%s\"", type( bonus ) )
		bonus = 0
	end

	if bonus < 0 then
		sys.log( "UI.SynergyTransferWnd:GetTransferRate()[ERROR]: negative synergy transfer rate bonus: %d", bonus )
		bonus = 0
	end

	return bonus

end


--
function UI.SynergyTransferWnd:F_OnEventSliderChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender ~= UI.SynergyTransfer_TransferValInputWnd:GetUiHandle() then
		return
	end

	local eventSrc = iParam0

	self.transferValValidated = false

	if eventSrc == UI.EffectSliderWnd.eventSources.EDIT then
		self.transferValUpdateTimer = self.TRANSFER_VAL_UPDATE_DELAY

	else
		self.transferValUpdateTimer = -1
		self:ValidateTransferVal()
	end

end


--
function UI.SynergyTransferWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	UI.FullScreenSelectionWnd.F_OnNewFrame( self, hSender , dt_sys, dt_game )

	self:UpdateTransferValUpdateTimer( dt_sys )

end


--
function UI.SynergyTransferWnd:UpdateTransferValUpdateTimer( dt )

	if self.transferValUpdateTimer ~= -1 then

		self.transferValUpdateTimer = self.transferValUpdateTimer - dt
		if self.transferValUpdateTimer <= 0 then

			self.transferValUpdateTimer = -1
			self:ValidateTransferVal()
		
		end

	end

end


--
function UI.SynergyTransferWnd:UpdateOkBtnState()

	if not self.transferValValidated then
		return
	end

	local transferVal = self:GetTransferVal( true )
	UI.SynergyTransfer_OkBtn:Enable( transferVal ~= 0 )

end


--
function UI.SynergyTransferWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )	

end


--
function UI.SynergyTransferWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )	

end


--
function UI.SynergyTransferWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.SynergyTransferWnd:IsWaiting()

	return self.transferRequestId ~= 0

end


--
function UI.SynergyTransferWnd:TryTransfer()

	if self:IsWaiting() then
		return
	end

	self:ValidateTransferVal()
	local transferVal = self:GetTransferVal( true )

	if transferVal == 0 then
		return
	end

	if not next( self.ships ) then
		sys.log( "UI.SynergyTransferWnd()[ERROR]: no ships; cannot be here" )
		return
	end

	local vids = {}
	for idx, shipItem in pairs( self.ships ) do
		table.insert( vids, shipItem.vid )
	end

	self.transferInfo =
	{
		vids		= vids,
		transferVal	= transferVal,
	}

	local launchWndData = {}
	launchWndData.gold		= self:GetTotalCost()
	launchWndData.synergy	= transferVal

	self:LaunchBuyWnd( launchWndData )

end


--
function UI.SynergyTransferWnd:DoTransfer()

	if not self.transferInfo.vids or not next( self.transferInfo.vids ) or not self.transferInfo.transferVal or self.transferInfo.transferVal == 0 then
		sys.log( "UI.SynergyTransferWnd:DoTransfer()[ERROR]: invalid transfer info" )
		return
	end

	self.transferRequestId = _G.GameStore_ExtractVesselExp( self.transferInfo.vids, self.transferInfo.transferVal )

	if self.transferRequestId ~= 0 then
		self:UpdateWaitEffect()
	else
		self:ShowMsgOnTransferError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.SynergyTransferWnd:LaunchBuyWnd( launchWndData )

	UI.SynergyTransfer_BuyWnd:Setup( UI.BuyWnd.modes.SYNERGY_TRANSFER, true, launchWndData )
	UI.SynergyTransfer_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.SynergyTransferWnd:ShowMsgOnTransferError( error )

	UI:ShowErrorMsg( "msg_synergyTransferError", error, "_G.GameStore.StoreBuyResult" )

end


--
function UI.SynergyTransferWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then

		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
		self:Reset()

	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.SynergyTransferWnd:HideChildModals()

	UI.SynergyTransfer_BuyWnd:UnlinkFromParent()

    self.transferInfo = {}

end


--
function UI.SynergyTransferWnd:F_OnEventSaveUiState()

	local showParams = nil

	if self:IsOnScreen() then

		self:HideChildModals()
		self:ValidateTransferVal()	

		showParams = {}
		showParams.transferVal = self:GetTransferVal( true )

	end

	UI.store.SynergyTransferWnd =
	{
		transferRequestId	= self.transferRequestId,
		showParams			= showParams,
	}

end


--
function UI.SynergyTransferWnd:F_OnEventRestoreUiState()

	if UI.store.SynergyTransferWnd then

		self.transferRequestId = UI.store.SynergyTransferWnd.transferRequestId
		self:UpdateWaitEffect()

		self.savedParams = UI.store.SynergyTransferWnd.showParams

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.SynergyTransferWnd = nil

	end

end


--
function UI.SynergyTransferWnd:Close( bSound )

	self:Hide()
	
	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end

end


--
function UI.SynergyTransferWnd:OnEscape()

	self:Close( true )
	return true

end


-- -----------------------------------------------------------
-- UI.SynergyTransfer_TransferValInputWnd
-- -----------------------------------------------------------

UI.SynergyTransfer_TransferValInputWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "NumericInputWnd",

		props =
		{
			name	= "SynergyTransfer_TransferValInputWnd"
		}
	},
}

-- -----------------------------------------------------------
-- UI.SynergyTransfer_TransferValIcoWnd
-- -----------------------------------------------------------

UI.SynergyTransfer_TransferValIcoWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name	= "SynergyTransfer_TransferValIcoWnd",
			style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		},

		layers =
		{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "shop_items_slot_priceIco",
    				defaultAnimation	= "synergy_g",

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

	tooltipData =
	{
		tooltipType		= UI.tooltipTypes.TEXT_LARGE,
		caption			= UI:Color2Str( UI.TEXT_BASE_COLOR )..UI:GetStringByName( "freeSynergyPriceTooltip_caption" ),
		text			= UI:GetStringByName( "freeSynergyPriceTooltip_desc" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

-- -----------------------------------------------------------
-- UI.SynergyTransfer_OkBtn
-- -----------------------------------------------------------

UI.SynergyTransfer_OkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "SynergyTransfer_OkBtn"
		}
	},

	textId = "synergyTransfer_okBtn"
}

-- ----------------------------------------------------------
-- UI.SynergyTransfer_CancelBtn
-- -----------------------------------------------------------

UI.SynergyTransfer_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "SynergyTransfer_CancelBtn"
		}
	},

	textId = "synergyTransfer_cancelBtn"
}

-- ----------------------------------------------------------
-- UI.SynergyTransfer_BuyWnd
-- ----------------------------------------------------------

UI.SynergyTransfer_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "SynergyTransfer_BuyWnd",
    	},
	},

	mainWndName = "SynergyTransferWnd",
}

-- ------------------------------------------------------------------------
-- UI.SynergyTransfer_CrossBtn
-- ------------------------------------------------------------------------

UI.SynergyTransfer_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "SynergyTransfer_CrossBtn"
    	}
	}
}