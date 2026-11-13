-- ----------------------------------------------------------------------------
--
-- Workfile: gold2creditswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.Gold2CreditsWnd = {}
local gc = UI.Gold2CreditsWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Gold2CreditsWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name			= "Gold2CreditsWnd",
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
				defName 			= "gold2Credits_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "window_2",
						layer		= "UI.Gold2CreditsWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.Gold2CreditsWnd.layers.BG_EFFECT",
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
				defName 			= "gold2Credits_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Gold2CreditsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",
						layer		= "UI.Gold2CreditsWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",
						wnd			= "UI.Gold2Credits_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.Gold2Credits_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
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
			text = "^gold2credits_caption"
		},  

		-- DESC
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 3, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^gold2credits_description"
		},  
	},

	children =
	{
		"UI.Gold2Credits_ListWnd",
		"UI.Gold2Credits_CrossBtn"
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Gold2CreditsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Gold2Credits_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result == 0 then
		self:UpdateOnPlayerCreditsChanged()
	end

end


-- вызывается окном покупки
function UI.Gold2CreditsWnd:OnBuyCredits( creditsInfo )

	self:DoBuyCredits( creditsInfo )
	self:Hide()

end

-- ------------------------------
-- const
-- ------------------------------

gc.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    DESC			= 4,
}

gc.sounds =
{
	hide			= "sound/ui/MsgHide",
	tradeWndShow	= "sound/ui/btnClick",
	slotMouseOver	= "sound/ui/btnMouseOver",
}

gc.strCreditsUnits = UI:GetStringByName( "creditsUnits" )

-- ------------------------------
-- vars
-- ------------------------------

gc.creditsInfoList		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Gold2CreditsWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.creditsInfoList = UI.Gold2Credits_ListWnd

end


--
function UI.Gold2CreditsWnd:Reset()

	self.creditsInfoList:Clear()

end


--
function UI.Gold2CreditsWnd:FullUpdate()

	self:Reset()

	self:UpdateCreditsInfoList()

end


--
function UI.Gold2CreditsWnd:UpdateCreditsInfoList()

	self.creditsInfoList:Clear()

	local creditsInfos = UI.serverData.creditsInfo
	for idx = 1, #creditsInfos do

		local data			= {}
		data.creditsInfo	= creditsInfos[ idx ]

		self.creditsInfoList:AddRecord( data )		

	end

end


--
function UI.Gold2CreditsWnd:FindRecordByCreditsInfoId( id )

	for recordIdx = 1, self.creditsInfoList:GetNumRecords() do

		local data = self.creditsInfoList:GetRecordData( recordIdx )
		if data.creditsInfo.id == id then
			return recordIdx
		end

	end

	return - 1

end


--
function UI.Gold2CreditsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local slotWnd = nil

	if UI:IsWndKindOf( wnd, "Gold2Credits_SlotWnd" ) then
		slotWnd = wnd
	else
		slotWnd = UI:GetAncestorKindOf( wnd, "Gold2Credits_SlotWnd" )
	end

	if slotWnd then		

		local data = slotWnd:GetRecordData()
		self:TryBuyCredits( data.creditsInfo )

	elseif wnd == UI.Gold2Credits_CrossBtn then

		UI:PlayGlobalSound( self.sounds.hide )
		self:Hide()

	end

	return true

end


--
function UI.Gold2CreditsWnd:OnEscape( key, controllerIdx )

	if self:IsInputBlocked() then
		return true
	end

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()

	return true	

end


--
function UI.Gold2CreditsWnd:TryBuyCredits( creditsInfo )

	UI:PlayGlobalSound( self.sounds.tradeWndShow )

	UI.Gold2Credits_BuyWnd:Setup( creditsInfo )
	UI.Gold2Credits_BuyWnd:Show()

end


--
function UI.Gold2CreditsWnd:DoBuyCredits( creditsInfo )

	_G.GameStore_ExchangeGold( creditsInfo.id )

end


--
function UI.Gold2CreditsWnd:UpdateOnPlayerCreditsChanged()

	local firstRecordIdx, lastRecordIdx = self.creditsInfoList:GetVisibleRange()
	if firstRecordIdx ~= -1 then

		for recordIdx = firstRecordIdx, lastRecordIdx do

			local slotWnd = self.creditsInfoList:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:UpdateOnPlayerCreditsChanged()
			end

		end

	end

end


--
function UI.Gold2CreditsWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.Gold2CreditsWnd:HideChildModals()

	UI.Gold2Credits_BuyWnd:UnlinkFromParent()

end


--
function UI.Gold2CreditsWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

end


--
function UI.Gold2CreditsWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	if not UI.bSavingGameState then
		_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_OPEN_EXCHANGE )
	end

end


-- ------------------------------------------------------------
-- UI.Gold2Credits_ListWnd
-- ------------------------------------------------------------

UI.Gold2Credits_ListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ButtonsListWnd",

		props =
		{
			name	= "Gold2Credits_ListWnd",
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
    				defName 			= "gold2Credits_list",
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

	btnPrototypeName = "Gold2Credits_SlotWnd",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "slot",
    		scrollObjName		= "",
    		animIdle			= "idle",
    	}
    },

    MAX_SLOTS = 6,

	listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION,
}


-- ------------------------------------------------------------
-- UI.Gold2Credits_SlotWnd
-- ------------------------------------------------------------

UI.Gold2Credits_SlotWnd = {}
local gcs = UI.Gold2Credits_SlotWnd

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Gold2Credits_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Gold2Credits_SlotWnd",
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
				defName 			= "gold2Credits_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_price",
						layer		= "UI.Gold2Credits_SlotWnd.layers.CREDITS_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_descript",
						layer		= "UI.Gold2Credits_SlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_gold",
						layer		= "UI.Gold2Credits_SlotWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.Gold2Credits_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}		
			}}
		},

		-- CREDITS_VAL
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

		-- DESC
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 2, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},  

		-- PRICE
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

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "gold2Credits_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.Gold2Credits_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.DESC )

	self.creditsMetaText:SetText( "", true )
	self.priceMetaText:SetText( "", true )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	                                       	
end


--
function UI.Gold2Credits_SlotWnd:UpdateOnPlayerCreditsChanged()

	local data = self:GetRecordData()

	self:UpdatePrice( data )	

end


-- ----------------------------------
-- const
-- ----------------------------------

gcs.layers =
{
    MAIN_EFFECT			= 0,
    CREDITS_VAL			= 1,
    DESC				= 2,
    PRICE				= 3,
	MOUSE_OVER_EFFECT	= 4,
}

gcs.CREDITS_SLOT = true

-- ----------------------------------
-- vars
-- ----------------------------------

gcs.creditsMetaText	= nil
gcs.priceMetaText	= nil

gcs.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
	}
}

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.Gold2Credits_SlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.creditsMetaText = UI.MetaText.GetNewInstance()
	self.creditsMetaText:InitFromLayer( self, self.layers.CREDITS_VAL ) 		

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )

end


--
function UI.Gold2Credits_SlotWnd:F_Shutdown()

	if self.creditsMetaText then
		self.creditsMetaText:Clear()
	end

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Gold2Credits_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.Gold2Credits_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Gold2Credits_SlotWnd:UpdateMetaTextPos()

	self.creditsMetaText:UpdateScreenOrgFromLayer( self, self.layers.CREDITS_VAL )
	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )	

end


--
function UI.Gold2Credits_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.CREDITS_VAL then
		self.creditsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	end

end


--
function UI.Gold2Credits_SlotWnd:UpdateForData( data, bAnimated )

	self:UpdateCreditsVal( data )
	self:UpdateDesc( data )
	self:UpdatePrice( data )	
	self:UpdateIco( data )

end


--
function UI.Gold2Credits_SlotWnd:UpdateCreditsVal( data )

	local baseVal	= data.creditsInfo.value
	local bonusVal	= data.creditsInfo.bonusValue

	local val = baseVal + bonusVal
	local strVal = UI:Num2StrSeparatedBy3( val )

	local str = string.format( "%s %s", strVal, UI:GetStringByName( "creditsUnits" ) )
	self.creditsMetaText:SetText( str, true )

end


--
function UI.Gold2Credits_SlotWnd:UpdateDesc( data )

	local str = ""

	local baseVal	= data.creditsInfo.value
	local bonusVal	= data.creditsInfo.bonusValue

	if bonusVal > 0 then

    	local profit = UI:Round( bonusVal / ( baseVal + bonusVal ) * 100 )
    	local strProfit = tostring( profit )

    	str = UI:GetStringByName( "gold2Credits_profit" )
    	str = string.gsub( str, "%$profit%$", strProfit )

	end

	self:SetText( str, self.layers.DESC )
	
end


--
function UI.Gold2Credits_SlotWnd:UpdatePrice( data )

	local priceInfo = {}

	priceInfo.priceType 	= _G.GameStore.CreditsType.CT_GOLD
	priceInfo.val			= data.creditsInfo.price
	priceInfo.bIsBuyPrice	= true
	priceInfo.basePrice		= data.creditsInfo.price

	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, nil, true, nil )
	self.priceMetaText:SetText( strPrice, true )

end


--
function UI.Gold2Credits_SlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI:GetCreditsInfoIcoSmall( data.creditsInfo ) )

end


--
function UI.Gold2Credits_SlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Gold2Credits_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.Gold2CreditsWnd.sounds.slotMouseOver )
	end

end


--
function UI.Gold2Credits_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Gold2Credits_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ------------------------------------------------------------------------
-- UI.Licenses_CrossBtn
-- ------------------------------------------------------------------------

UI.Gold2Credits_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Gold2Credits_CrossBtn"
		}
	}
}

-- -------------------------------------------------------------------
-- UI.Gold2Credits_BuyWnd
-- -------------------------------------------------------------------

UI.Gold2Credits_BuyWnd = {}
local gcb = UI.Gold2Credits_BuyWnd

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Gold2Credits_BuyWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "Gold2Credits_BuyWnd",
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
						layer		= "UI.Gold2Credits_BuyWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.Gold2Credits_BuyWnd.layers.WORK_EFFECT",
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
						layer		= "UI.Gold2Credits_BuyWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "product_name",	
						layer		= "UI.Gold2Credits_BuyWnd.layers.CREDITS_VAL",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fraction",	
						layer		= "UI.Gold2Credits_BuyWnd.layers.CREDITS_VAL",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.Gold2Credits_Buy_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",	
						layer		= "UI.Gold2Credits_BuyWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "icon_license",	
						layer		= "UI.Gold2Credits_BuyWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_1",	
						layer		= "UI.Gold2Credits_BuyWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
				defName 			= "licenseIco",
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
			text = "^gold2credits_caption",
		},

		-- CREDITS_VAL
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
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- PRICE_EFFECT
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
						layer		= "UI.Gold2Credits_BuyWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	},

	children =
	{
		"UI.Gold2Credits_Buy_BuyBtn",
		"UI.Gold2Credits_Buy_CrossBtn",
	}
}


-- -------------------------------------
-- interface funcitons
-- -------------------------------------

--
function UI.Gold2Credits_BuyWnd:Setup( creditsInfo )

	self:Reset()

	self.creditsInfo = creditsInfo

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.Gold2Credits_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdateBuyBtnState()
	self:UpdateRefillMoneyBtn()

end   


-- -------------------------------------
-- const
-- -------------------------------------

gcb.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
	ICO_EFFECT		= 3,
    CAPTION			= 4,
    CREDITS_VAL		= 5,
	DESC			= 6,
    PRICE_EFFECT	= 7,
    PRICE_VAL		= 8,
}

gcb.effectInfo =
{
	work =
	{
		refillMoneyBtnObjName	= "button_2",
		buyBtnObjName			= "button_2",
	},

	ico =
	{
		icoSpriteName = "ico"
	},
}

gcb.sounds =
{
	buy		= "sound/ui/apply",
	hide	= "sound/ui/MsgHide",
}

-- -------------------------------------
-- vars
-- -------------------------------------

gcb.creditsInfo 	= nil
gcb.refillMoneyBtn	= nil
gcb.priceMetaText	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Gold2Credits_BuyWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL ) 	

	self:Reset()

end


--
function UI.Gold2Credits_BuyWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Gold2Credits_BuyWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.Gold2Credits_BuyWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Gold2Credits_BuyWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.Gold2Credits_BuyWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Gold2Credits_BuyWnd:CreateControls()

	self.refillMoneyBtn	= UI:CreateChildWnd( self, UI.RefillMoneyBtn, "" )

end


--
function UI.Gold2Credits_BuyWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.Gold2Credits_BuyWnd:RemoveControl( wnd, effectLayer )

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
function UI.Gold2Credits_BuyWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self.creditsInfo = nil

	self:SetText( "", self.layers.CREDITS_VAL )
	self:SetText( "", self.layers.PRICE_VAL )
	self:SetText( "", self.layers.DESC )


	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( UI.Gold2Credits_Buy_BuyBtn, self.layers.WORK_EFFECT )

	self.priceMetaText:SetText( "", true )

end


--
function UI.Gold2Credits_BuyWnd:FullUpdate()

	local creditsInfo = self.creditsInfo

	self:Reset()

	self.creditsInfo = creditsInfo
	if not self.creditsInfo then
		return
	end

	self:UpdateCreditsVal()   
	self:UpdateDesc()
	self:UpdateIco()
	self:UpdatePrice()
	self:UpdateBuyBtnState()
	self:UpdateRefillMoneyBtn()

end


--
function UI.Gold2Credits_BuyWnd:UpdateCreditsVal( data )

	local baseVal	= self.creditsInfo.value
	local bonusVal	= self.creditsInfo.bonusValue

	local val = baseVal + bonusVal
	local strVal = UI:Num2StrSeparatedBy3( val )

	local str = string.format( "%s %s", strVal, UI:GetStringByName( "creditsUnits" ) )
	self:SetText( str, self.layers.CREDITS_VAL )

end


--
function UI.Gold2Credits_BuyWnd:UpdateDesc()

	local str = ""

	local baseVal	= self.creditsInfo.value
	local bonusVal	= self.creditsInfo.bonusValue

	if bonusVal > 0 then

    	local profit = UI:Round( bonusVal / ( baseVal + bonusVal ) * 100 )
    	local strProfit = tostring( profit )

    	str = UI:GetStringByName( "gold2Credits_profit" )
    	str = string.gsub( str, "%$profit%$", strProfit )

	end

	self:SetText( str, self.layers.DESC )
	
end


--
function UI.Gold2Credits_BuyWnd:UpdateIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end

	icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI:GetCreditsInfoIco( self.creditsInfo ) )

end


--
function UI.Gold2Credits_BuyWnd:UpdatePrice()

	local priceInfo = {}

	priceInfo.priceType 	= _G.GameStore.CreditsType.CT_GOLD
	priceInfo.val			= self.creditsInfo.price
	priceInfo.bIsBuyPrice	= true
	priceInfo.basePrice		= self.creditsInfo.price

	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, true, true, nil )
	self.priceMetaText:SetText( strPrice, true )

end


--
function UI.Gold2Credits_BuyWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Gold2Credits_Buy_BuyBtn then
		self:Buy()

	elseif wnd == UI.Gold2Credits_Buy_CrossBtn then
		UI:PlayGlobalSound( self.sounds.hide )
		self:Hide()

	elseif wnd == self.refillMoneyBtn then
		self:OnRefillMoney()
	end

	return true

end


--
function UI.Gold2Credits_BuyWnd:OnRefillMoney()

	local moneyMode = self.refillMoneyBtn:GetMode()

	if moneyMode == UI.RefillMoneyBtn.modes.CREDITS then
		UI.HangarWnd:ShowBuyCreditsWnd()

	elseif moneyMode == UI.RefillMoneyBtn.modes.GOLD then
		UI.HangarWnd:ShowBuyGoldWnd()

	else
		sys.log( "UI.Gold2Credits_BuyWnd:RefillMoney()[ERROR]: invalid refil money mode: %s", tostring( moneyMode ) )
	end

end


--
function UI.Gold2Credits_BuyWnd:OnEnter( key, controllerIdx )

	if self.creditsInfo then
		self:Buy()
	end

	return true

end


--
function UI.Gold2Credits_BuyWnd:OnEscape()

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()
	return true

end


--
function UI.Gold2Credits_BuyWnd:Buy()

	UI:PlayGlobalSound( self.sounds.buy )
	self:Hide()
	UI.Gold2CreditsWnd:OnBuyCredits( self.creditsInfo )

end	


--
function UI.Gold2Credits_BuyWnd:UpdateRefillMoneyBtn()

	local bNeedBtn, mode = self:NeedRefillMoneyBtn()

	if not bNeedBtn then
		self:RemoveControl( self.refillMoneyBtn, self.layers.WORK_EFFECT )

	else
		self:AddControl( self.refillMoneyBtn, self.layers.WORK_EFFECT, self.effectInfo.work.refillMoneyBtnObjName )
		self.refillMoneyBtn:Setup( mode )
	end

end


--
function UI.Gold2Credits_BuyWnd:NeedRefillMoneyBtn()

	return not self:IsEnoughMoney(), UI.RefillMoneyBtn.modes.GOLD

end


--
function UI.Gold2Credits_BuyWnd:UpdateBuyBtnState()

	local bEnable = self:IsEnoughMoney()

	if bEnable then

		self:AddControl( UI.Gold2Credits_Buy_BuyBtn, self.layers.WORK_EFFECT, self.effectInfo.work.buyBtnObjName )
		UI.Gold2Credits_Buy_BuyBtn:Enable( true )

	else

		if self:NeedRefillMoneyBtn() then
			self:RemoveControl( UI.Gold2Credits_Buy_BuyBtn, self.layers.WORK_EFFECT )
		else
			self:AddControl( UI.Gold2Credits_Buy_BuyBtn, self.layers.WORK_EFFECT, self.effectInfo.work.buyBtnObjName )
			UI.Gold2Credits_Buy_BuyBtn:Enable( false )
		end
	end

end


--
function UI.Gold2Credits_BuyWnd:IsEnoughMoney()

	local playerMoney = UI:GetPlayerMoney( true )	
	return self.creditsInfo.price <= playerMoney

end


-- ------------------------------------------------------------------------
-- UI.Gold2Credits_Buy_BuyBtn, UI.Gold2Credits_Buy_CrossBtn
-- ------------------------------------------------------------------------

--
UI.Gold2Credits_Buy_BuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Gold2Credits_Buy_BuyBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^gold2credits_buyBtn",
   			},
   		}
	},
}


--
UI.Gold2Credits_Buy_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name		= "Gold2Credits_Buy_CrossBtn",
		},
	},
}  