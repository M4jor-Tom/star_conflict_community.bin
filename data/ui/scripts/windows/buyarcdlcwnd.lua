-- ----------------------------------------------------------------------------
--
-- Workfile: buyarcdlcwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -------------------------------------------------------------------
-- UI.BuyArcDlcWnd
-- -------------------------------------------------------------------

UI.BuyArcDlcWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.BuyArcDlcWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "BuyArcDlcWnd",
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
						layer		= "UI.BuyArcDlcWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.BuyArcDlcWnd.layers.WORK_EFFECT",
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
						layer		= "UI.BuyArcDlcWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "product_name",	
						layer		= "UI.BuyArcDlcWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fraction",	
						layer		= "UI.BuyArcDlcWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",	
						layer		= "UI.BuyArcDlcWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price10",
						layer		= "UI.BuyArcDlcWnd.layers.PLAYER_MONEY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text = UI:GetStringByName( "buyArcDlc_caption" ),
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
						layer		= "UI.BuyArcDlcWnd.layers.PRICE_VAL",
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

		-- PLAYER_MONEY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}


-- -------------------------------------
-- interface funcitons
-- -------------------------------------

--
function UI.BuyArcDlcWnd:Setup( dlcName )

	self:Reset()

	if type( dlcName ) ~= "string" then
		sys.log( "UI.BuyArcDlcWnd:Setup()[ERROR]; invalid type of the 1-st parameter (\"dlcName\"); \"string\" expected, got \"%s\"", type( dlcName ) )
		return
	end

	self.dlcName = dlcName

	self.dlcInfo = UI:GetArcDlcInfo( dlcName )
	if not self.dlcInfo then
		sys.log( "UI.BuyArcDlcWnd:Setup()[ERROR]: cannot find arc info for dlc \"%s\"", dlcName )
	end

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.BuyArcDlcWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePlayerMoney()

end   


-- -------------------------------------
-- const
-- -------------------------------------

UI.BuyArcDlcWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    NAME			= 4,
    PRICE_EFFECT	= 5,
    PRICE_VAL		= 6,
	PLAYER_MONEY	= 7,
}

--
UI.BuyArcDlcWnd.effectInfo =
{
	work =
	{
		itemIcoObjName			= "icon",
		okBtnObjName			= "button_1",
		cancelBtnObjName    	= "button_2",
	},
}

UI.BuyArcDlcWnd.okBtnPrototpyeName		= "Trade_TradeBtn"
UI.BuyArcDlcWnd.cancelBtnPrototpyeName	= "Trade_CancelBtn"

UI.BuyArcDlcWnd.sounds =
{
	hide = "sound/ui/MsgHide",
}

UI.BuyArcDlcWnd.mainWndName = ""

-- -------------------------------------
-- vars
-- -------------------------------------

UI.BuyArcDlcWnd.dlcName			= ""
UI.BuyArcDlcWnd.dlcInfo			= nil

UI.BuyArcDlcWnd.itemIcoWnd		= nil
UI.BuyArcDlcWnd.tradeBtn		= nil
UI.BuyArcDlcWnd.cancelBtn		= nil
UI.BuyArcDlcWnd.priceMetaText	= nil


-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.BuyArcDlcWnd:F_PostLoad()

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
function UI.BuyArcDlcWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BuyArcDlcWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.BuyArcDlcWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BuyArcDlcWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.BuyArcDlcWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BuyArcDlcWnd:CreateControls()

	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.okBtn			= UI:CreateChildWnd( self, UI.Trade_TradeBtn, "" )
	self.cancelBtn		= UI:CreateChildWnd( self, UI.Trade_CancelBtn, "" )

	self:AddControl( self.itemIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.itemIcoObjName )
	self:AddControl( self.okBtn, self.layers.WORK_EFFECT, self.effectInfo.work.okBtnObjName )
	self:AddControl( self.cancelBtn, self.layers.WORK_EFFECT, self.effectInfo.work.cancelBtnObjName )

	self.okBtn:SetBtnText( UI:GetStringByName( "shop_buy" ) )

	self.itemIcoWnd:SetupIco( UI:GetTex( "dlcIco" ) )

end


--
function UI.BuyArcDlcWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.BuyArcDlcWnd:RemoveControl( wnd, effectLayer )

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
function UI.BuyArcDlcWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self.dlcName = ""
	self.dlcInfo = nil

	self:SetText( "", self.layers.NAME )
	self.priceMetaText:SetText( "", true )
	self.okBtn:Enable( false )
	self:SetText( "", self.layers.PLAYER_MONEY )

end


--
function UI.BuyArcDlcWnd:FullUpdate()

	if not self.dlcInfo then
		return
	end

	self:UpdateName()
	self:UpdatePrice()
	self:UpdateOkBtn()
	self:UpdatePlayerMoney()
	                          	
end


--
function UI.BuyArcDlcWnd:UpdateName() 

	local dlcNameLocalized = UI:GetDlcLocalizedName( self.dlcName )

	local str = UI:GetStringByName( "shipDlcTooltip_caption" )
	str = string.gsub( str, "%$dlc_name%$", dlcNameLocalized )

	self:SetText( str, self.layers.NAME )

end


--
function UI.BuyArcDlcWnd:UpdatePrice()

	local price = self.dlcInfo.zenCost

	local strPrice = UI:FNum2StrSeparatedBy3( price )
	local strPriceUnits = UI:Currency2Str( "zen" )

	local str = string.format( "%s %s", strPrice, strPriceUnits )

	self.priceMetaText:SetText( str, true )
	
end   


--
function UI.BuyArcDlcWnd:UpdateOkBtn()

	local bEnable = self.dlcName ~= ""
	self.okBtn:Enable( bEnable )

end


--
function UI.BuyArcDlcWnd:UpdatePlayerMoney()

	local playerMoney = UI:GetPlayerArcCredits()

	local str = UI:GetStringByName( "playerArcBalance" )
	local strPlayerMoney = string.format( "%s %s", UI:Num2StrSeparatedBy3( playerMoney ), UI:Currency2Str( "zen" ) )
	str = string.gsub( str, "%$money%$", strPlayerMoney )

	self:SetText( str, self.layers.PLAYER_MONEY )

end


--
function UI.BuyArcDlcWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.okBtn then
		self:OnOk()

	elseif wnd == self.cancelBtn then
		self:OnCancel()
	end

	return true

end


--
function UI.BuyArcDlcWnd:OnEnter( key, controllerIdx )

	if self.okBtn:IsEnabled() then
		self:OnOk()
	end

	return true

end


--
function UI.BuyArcDlcWnd:OnEscape()

	self:OnCancel()
	return true

end


--
function UI.BuyArcDlcWnd:OnCancel()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	self:NotifyMainWnd( false )

end


--
function UI.BuyArcDlcWnd:OnOk()

	self:Hide()
	self:NotifyMainWnd( true )

end	


--
function UI.BuyArcDlcWnd:NotifyMainWnd( result )

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.BuyArcDlcWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnBuyArcDlcWndResult then
		sys.log( "UI.BuyArcDlcWnd:NotifyMainWnd()[ERROR]: cannot find OnBuyArcDlcWndResult() function in wnd %s", self.mainWndName )
		return
	end

	mainWnd:OnBuyArcDlcWndResult( result, self.dlcName )

end