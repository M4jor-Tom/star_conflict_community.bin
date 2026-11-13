-- ----------------------------------------------------------------------------
--
-- Workfile: licenseswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.Marketing_LicensesWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.Marketing_LicensesWnd.layers =
{
    MAIN_EFFECT			= 0,
	BANNER_EFFECT		= 1,
	INFO				= 2,
}


--
UI.Marketing_LicensesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Marketing_LicensesWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "marketing_licenses_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "banner_ico",
						layer		= "UI.Marketing_LicensesWnd.layers.BANNER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "premium_list",	
						wnd			= "UI.Marketing_Licenses_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BANNER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_licenses_banner",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "description",
						layer		= "UI.Marketing_LicensesWnd.layers.INFO",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- INFO
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "licenses_info" ),
		},
	},

	children = { "UI.Marketing_Licenses_ListWnd" }
}

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.Marketing_LicensesWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

   	if result == 0 then
    	if self:IsOnScreen() then
       		self:OnPlayerCreditsChanged()
       	end
	end

end


--
function UI.Marketing_LicensesWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )	

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

        	for recordIdx = 1, self.licenseList:GetNumRecords() do

        		local slotWnd = self.licenseList:GetButtonForRecord( recordIdx )
        		if slotWnd then
					slotWnd:OnBuyPremium()
				end

			end

		end

	end

end


--
function UI.Marketing_LicensesWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end
	
	self:FullUpdate()

end


--
function UI.Marketing_LicensesWnd:MasterServer_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end
	
	for recordIdx = 1, self.licenseList:GetNumRecords() do
	
		local slotWnd = self.licenseList:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnYupPurchasesPricesResponse()
		end
	
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.Marketing_LicensesWnd.effectInfo =
{
	banner =
	{
		spriteName	= "ico",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Marketing_LicensesWnd.licenseList	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Marketing_LicensesWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.licenseList = UI.Marketing_Licenses_ListWnd

end


--
function UI.Marketing_LicensesWnd:Reset()

	self.licenseList:Clear()

	local bannerEffect = UI:GetEffectFromLayer( self, self.layers.BANNER_EFFECT )
	if bannerEffect then
		bannerEffect:SetSpriteTexture( self.effectInfo.banner.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.Marketing_LicensesWnd:FullUpdate()

	self:Reset()

	self:UpdateLicenseList()
	self:UpdateBanner()

end


--
function UI.Marketing_LicensesWnd:UpdateLicenseList()

	self.licenseList:Clear()
	
	local dlcs = _G.GameStore_GetYupDLCInfo()	-- это данные, которые приходят с сервера, хранятся в special_values.xml, оттуда нам нужна длительность

	local licenses = self:GetLicenses()
	for idx, license in ipairs( licenses ) do
	
		local guid = UI:GetDlcYupGuid( license.dlcName )
		if guid ~= "" then
			
			local dlcInfo = nil
			for dlcIdx, _dlcInfo in pairs( dlcs ) do
			
				if _dlcInfo.guid == guid then	-- сравниваем по guid, т.к. имени у dlc на сервере нет
					dlcInfo = _dlcInfo
					break
				end
			
			end
			
			if dlcInfo then
			
				local data =
				{
					license = license,
					dlcInfo	= dlcInfo,
				}
			
				self.licenseList:AddRecord( data )
				
			else
				sys.log( "UI.Marketing_LicensesWnd:UpdateLicenseList()[ERROR]: cannot find dlc info '%s' for license '%s'", license.dlcName, license.licenseName )
			end
			
		else
			sys.log( "UI.Marketing_LicensesWnd:UpdateLicenseList()[ERROR]: cannot find guid for dlc '%s'", license.dlcName )
		end

	end

end


--
function UI.Marketing_LicensesWnd:GetLicenses()

	local licenses = {}
	
	if type( _G.PremiumLicenses ) == "table" then
	
		for idx, license in ipairs( _G.PremiumLicenses ) do
		
			if type( license ) == "table" then
			
				local bValid = true
			
				if type( license.licenseName ) ~= "string" then
					sys.log( "UI.Marketing_LicensesWnd:GetLicenses()[ERROR]: invalid type of _G.PremiumLicenses[%d].licenseName; 'string' expected, got '%s'", idx, type( license.licenseName ) )
					bValid = false
				end
				
				if type( license.dlcName ) ~= "string" then
					sys.log( "UI.Marketing_LicensesWnd:GetLicenses()[ERROR]: invalid type of _G.PremiumLicenses[%d].dlcName; 'string' expected, got '%s'", idx, type( license.dlcName ) )
					bValid = false
				end
				
				if bValid then
					table.insert( licenses, license )
				end
			
			else
				sys.log( "UI.Marketing_LicensesWnd:GetLicenses()[ERROR]: invalid type of _G.PremiumLicenses[%d]; 'table' expected, got '%s'", idx, type( license ) )
			end
			
		end
		
	else
		sys.log( "UI.Marketing_LicensesWnd:GetLicenses()[ERROR]: invalid type of _G.PremiumLicenses; 'table' expected, got '%s'", type( _G.PremiumLicenses ) )
	end

	return licenses

end


--
function UI.Marketing_LicensesWnd:UpdateBanner()

	local bannerEffect = UI:GetEffectFromLayer( self, self.layers.BANNER_EFFECT )
	if bannerEffect then
		bannerEffect:SetSpriteTexture( self.effectInfo.banner.spriteName, UI:GetTex( "licenses_banner" ) )
	end

end


--
function UI.Marketing_LicensesWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Marketing_Licenses_SlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "Marketing_Licenses_SlotWnd" ) then

		local slotWnd = UI:IsWndKindOf( wnd, "Marketing_Licenses_SlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "Marketing_Licenses_SlotWnd" )    		
		self:DoBuyLicense( slotWnd:GetRecordData().license )

	end

	return true

end


--
function UI.Marketing_LicensesWnd:DoBuyLicense( license )

	UI:LaunchDlcLink( license.dlcName )
	
end


--
function UI.Marketing_LicensesWnd:OnPlayerCreditsChanged()

	for recordIdx = 1, self.licenseList:GetNumRecords() do

		local slotWnd = self.licenseList:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnPlayerCreditsChanged()
		end

	end

end


--
function UI.Marketing_LicensesWnd:F_OnAfterShowOnScreen()

	self:FullUpdate()

	if not UI.bSavingGameState then
		_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_OPEN_LICENSE )
	end

end


-- ------------------------------------------------------------
-- UI.Marketing_Licenses_ListWnd
-- ------------------------------------------------------------

UI.Marketing_Licenses_ListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Marketing_Licenses_ListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "Marketing_Licenses_ListWnd",
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
				defName 			= "marketing_licenses_list",
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

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Marketing_Licenses_ListWnd:AddRecord( data )

	local recordIdx = UI.BaseListWnd.AddRecord( self, data )

	self:RecalcLayout()

	return recordIdx

end


--
function UI.Marketing_Licenses_ListWnd:Clear()

	UI.BaseListWnd.Clear( self )

	if not UI:IsInRemovingAllWindows() then
		self:RecalcLayout()
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.Marketing_Licenses_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "premium_slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.Marketing_Licenses_ListWnd.btnPrototypeName	= "Marketing_Licenses_SlotWnd"
UI.Marketing_Licenses_ListWnd.MAX_SLOTS			= 6
UI.Marketing_Licenses_ListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------
-- vars
-- ------------------------------

UI.Marketing_Licenses_ListWnd.space_slots	= 0
UI.Marketing_Licenses_ListWnd.slotsY		= 0
UI.Marketing_Licenses_ListWnd.slotWidth	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Marketing_Licenses_ListWnd:F_PostLoad()

	UI.BaseListWnd.F_PostLoad( self )

	self:PrepareLayout()

end


--
function UI.Marketing_Licenses_ListWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd		= self:GetButtonForSlot( 1 )

	local slotPos1		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local slotPos2		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )	

	self.slotWidth		= slotWnd and slotWnd:GetWidth()
	self.space_slots	= slotPos2.x - ( slotPos1.x + self.slotWidth )
	self.slotsY			= slotPos1.y	

end


--
function UI.Marketing_Licenses_ListWnd:RecalcLayout()

	-- центрирование слотов по горизонтали

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx == -1 then
		return
	end

	local numSlots		= lastVisibleRecordIdx - firstVisibleRecordIdx + 1
	local slotsWidth	= numSlots * self.slotWidth + ( numSlots - 1 ) * self.space_slots

	local slotX = ( self:GetWidth() - slotsWidth ) / 2

	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then

			slotWnd:SetPos( slotX, self.slotsY )
			slotX = slotX + self.slotWidth + self.space_slots

		end

	end

end


-- перегрузка базовой функции - отсутствует линковка к локатору
function UI.Marketing_Licenses_ListWnd:ShowSlot( slot )

	self:AddChild( slot.btn )

end

-- ------------------------------------------------------------
-- UI.Marketing_Licenses_SlotWnd
-- ------------------------------------------------------------

UI.Marketing_Licenses_SlotWnd = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Marketing_Licenses_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Marketing_Licenses_SlotWnd",
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
				defName 			= "marketing_licenses_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ico",
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "days_title",
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.TIME_UNITS",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "benefit_totle",
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "price_1",	
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "price_2",	
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.PRICE_BASE_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "price_2",	
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.PRICE_VAL_LINE",
						animParams	= UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "over",
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sale",
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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
				defName 			= "marketing_licenses_slot_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- TIME_UNITS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_BASE_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_VAL_LINE
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_itemsList_slot_priceLine",
				defaultAnimation	= "white",	-- цвет берется из того же локатора, что и зачеркиваемый текст (линковка к нему)
			}}
		},

		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_licenses_slot_sale",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "sale_val",	
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.SALE_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sale_title",	
						layer		= "UI.Marketing_Licenses_SlotWnd.layers.SALE_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- SALE_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SALE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small"},
			text			= "^licenses_sale",
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "marketing_licenses_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.Marketing_Licenses_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.TIME_UNITS )
	self:SetText( "", self.layers.DESC )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.PRICE_BASE_VAL )	
	self:SetLayerVisible( false, self.layers.PRICE_VAL_LINE )
	self:SetLayerVisible( false, self.layers.SALE_EFFECT )
	self:SetLayerVisible( false, self.layers.SALE_VAL )
	self:SetLayerVisible( false, self.layers.SALE_LABEL )

	self.priceMetaText:SetText( "", true )
	                                       	
end


--
function UI.Marketing_Licenses_SlotWnd:OnPlayerCreditsChanged()

	self:UpdatePrice( self:GetRecordData() )

end


--
function UI.Marketing_Licenses_SlotWnd:OnBuyPremium()

	local data = self:GetRecordData()

	self:UpdatePrice( data )
	self:UpdateSale( data )

end


--
function UI.Marketing_Licenses_SlotWnd:OnYupPurchasesPricesResponse()

	local data = self:GetRecordData()

	self:UpdatePrice( data )
	self:UpdateSale( data )

end



-- ----------------------------------
-- const
-- ----------------------------------

UI.Marketing_Licenses_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	ICO_EFFECT			= 1, 
    TIME_UNITS			= 2, 
    DESC				= 3, 	-- TODO убрать
    PRICE_VAL			= 4, 	
	PRICE_BASE_VAL		= 5, 	-- TODO убрать
	PRICE_VAL_LINE		= 6, 	-- TODO убрать
	SALE_EFFECT			= 7, 	-- TODO убрать
	SALE_VAL			= 8, 	-- TODO убрать
	SALE_LABEL			= 9,	-- TODO убрать
	MOUSE_OVER_EFFECT	= 10,
}

UI.Marketing_Licenses_SlotWnd.effectInfo =
{
	ico =
	{
		icoSpriteName	= "ico",
	},

	priceValLine =
	{
		animBaseSale	= "idle",
		animAuraSale	= "premium",
	},
}

UI.Marketing_Licenses_SlotWnd.sounds =
{
	mouseOver	= "sound/ui/btnMouseOver",
}

UI.Marketing_Licenses_SlotWnd.lineFixYCf = 0.0	-- поправка на местоположение линии зачеркивания по вертикали (0..1 от высоты шрифта)

-- ----------------------------------
-- vars
-- ----------------------------------

UI.Marketing_Licenses_SlotWnd.priceMetaText		= nil
UI.Marketing_Licenses_SlotWnd.priceLineBaseSize	= Vec2( 0, 0 )

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.Marketing_Licenses_SlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL ) 

	local priceLine = UI:GetEffectFromLayer( self, self.layers.PRICE_VAL_LINE )
	if priceLine then
		self.priceLineBaseSize = priceLine:GetObjSize( "self" )
	end

end


--
function UI.Marketing_Licenses_SlotWnd:F_Shutdown()

	if not self:IsPrototype() then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Marketing_Licenses_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateTimeUnits( data )
	self:UpdateDesc( data )
	self:UpdatePrice( data )
	self:UpdateSale( data )

end


--
function UI.Marketing_Licenses_SlotWnd:UpdateTimeUnits( data )
	
	local days = math.floor( data.dlcInfo.premiumTime / 24 )
	local strDays = UI:SubstituteValLocalizedByStringId( "days_full_high", days, "day", "" ) 
	self:SetText( strDays, self.layers.TIME_UNITS )

end


-- TODO убрать
function UI.Marketing_Licenses_SlotWnd:UpdateDesc( data )
end


--
function UI.Marketing_Licenses_SlotWnd:UpdatePrice( data )

	local price, currency = UI:GetYupPurchasePrice( data.dlcInfo.guid )	
	local priceFix =  UI:Round( price * 100 ) / 100	-- SC-112141 округляем До двух знаков по математическим правилам.
	
	local strPriceVal = string.format( "%0.2f", priceFix )
	local strCurrency = UI:Currency2Str( currency )
	local strPrice = string.format( "%s %s", strPriceVal, strCurrency )
	
	self.priceMetaText:SetText( strPrice, true )

end


--
function UI.Marketing_Licenses_SlotWnd:UpdateIco( data )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI:GetLicenseIco( data.license ) )
	end

end


-- TODO убрать
function UI.Marketing_Licenses_SlotWnd:UpdateSale( data )

end


--
function UI.Marketing_Licenses_SlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) )

	self:SetMouseOver( bMouseOver )

end


--
function UI.Marketing_Licenses_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Marketing_Licenses_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Marketing_Licenses_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


--
function UI.Marketing_Licenses_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()
	self:UpdateMetaTextPos()

end


--
function UI.Marketing_Licenses_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Marketing_Licenses_SlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.Marketing_Licenses_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end