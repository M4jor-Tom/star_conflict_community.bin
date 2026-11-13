-- ----------------------------------------------------------------------------
--
-- Workfile: salvagewnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.SalvageWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.SalvageWnd.layers =
{
    MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
	WORK_EFFECT		= 2,
	CAPTION			= 3,
    INFO_EFFECT		= 4,
    ITEM_NAME		= 5,
    WAIT_EFFECT		= 6,
    WAIT_TEXT		= 7,
}

UI.SalvageWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props = 
	{
		name		= "SalvageWnd",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.SalvageWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "salvage_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.SalvageWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loot_2",
						layer		= "UI.SalvageWnd.layers.WORK_EFFECT",
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
				defName 			= "salvage_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title_2",
						layer		= "UI.SalvageWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "loot_module",
						layer		= "UI.SalvageWnd.layers.INFO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.SalvageWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

    	-- CAPTION
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "salvage_caption" )
    	}, 

		-- INFO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "salvage_info",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по цвету
					{
						objName		= "loot_name",
						layer		= "UI.SalvageWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- ITEM_NAME
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 2, 1 },
   			formatFlags		= FONT.TF_WORDBREAK,
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
						layer		= "UI.SalvageWnd.layers.WAIT_TEXT",
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

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.SalvageWnd:Setup( iid )

	self:Reset()

	if type( iid ) ~= "userdata" then
		sys.log( "UI.SalvageWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"iid\")l \"userdata\" expected, got \"%s\"", type( iid ) )
		return
	end

	local defName = UI:Iid2DefName( iid )
	if defName == "" then
		sys.log( "UI.SalvageWnd:Setup()[ERROR]: cannot find inventory item with iid %s", _G.U64ToStr( iid ) )
		return
	end

	self.iid = iid
	self.itemDefName = defName

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.SalvageWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

	if result == _G.MasterServer.GenericResponderResult.GRR_OK then

		if self:GetParent() then
			self:UnlinkFromParent()
		end		

	else

		if requestId == self.salvageRequestId then
			self:ShowMsgOnSalvageError( result )
		end

	end

	if requestId == self.salvageRequestId then
		self.salvageRequestId = 0
	end

end


--
function UI.SalvageWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.salvageRequestId	= 0
	self.sellRequestId		= 0

end


--
function UI.SalvageWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.buyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	self.tradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:OnPlayerCreditsChanged()
	end

end


--
function UI.SalvageWnd:GetItemDefName()

	return self.itemDefName

end


--
function UI.SalvageWnd:OnBuyWndResult( result, mode, data )

	if result == true then
		self:DoSalvage( data.slotType )
	end

end


--
function UI.SalvageWnd:OnTradeResult_Sell( invItem, count )

	self:DoSell()

end


--
function UI.SalvageWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	if requestId == self.sellRequestId then

--[[ сообщение об ошибке показывается без проверки requestId в окнах верфи и магазина
    	if result == 1 then
    		UI:ShowMessageOnTimeOut()
    	elseif result == 2 then
    		UI:ShowMsgOnSellError()
    	end
]]

		self.sellRequestId = 0

		self:Hide()

	end

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.SalvageWnd.slotTypes =
{
	GOLD	= 1,
	FREE	= 2,
	SELL	= 3,	
}

UI.SalvageWnd.effectInfo =
{
	main =
	{
    	workLocator	= "loot_2",
	},

	work =
	{
		slotLocatorPrefix	= "btn_",
		crossBtnLocator		= "btn_x",
	},

	info =
	{
		itemIcoLocator		= "icon",
	},
}

UI.SalvageWnd.sounds =
{
	slotMouseOver	= "sound/ui/btnMouseOver",
	hide			= "sound/ui/MsgHide",
	salvage			= "sound/ui/lootScanSuccess",	-- TODO: звук
	tradeWndShow	= "sound/ui/btnClick",
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.SalvageWnd.iid					= UI.INVALID_U64_ID
UI.SalvageWnd.itemDefName			= ""
UI.SalvageWnd.slots					= {}
UI.SalvageWnd.itemIcoWnd			= nil
UI.SalvageWnd.crossBtn				= nil
UI.SalvageWnd.salvageRequestId		= 0
UI.SalvageWnd.buyWnd				= nil
UI.SalvageWnd.sellRequestId			= 0
UI.SalvageWnd.tradeWnd				= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.SalvageWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.slots	= {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:HideWaitEffect()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )

end


--
function UI.SalvageWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.SalvageWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.SalvageWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	self.buyWnd:UnlinkFromParent()
	self.tradeWnd:UnlinkFromParent()

end


--
function UI.SalvageWnd:Reset()

	self.iid = UI.INVALID_U64_ID
	self.itemDefName = ""

	self:SetText( "", self.layers.ITEM_NAME )

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
	end

	self.itemIcoWnd:Reset()

end


--
function UI.SalvageWnd:CreateControls()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	for slotType = 1, UI:GetTableLength( self.slotTypes ) do

	    local slotWnd = UI:CreateChildWnd( self, UI.Salvage_SlotWnd, tostring( slotType ) )

		table.insert( self.slots, slotWnd )
		UI:AddChildAndLink( self, slotWnd, workEffect, string.format( "%s%d", self.effectInfo.work.slotLocatorPrefix, slotType ), UI.EffectAnimParams.POS )

		slotWnd:Init( slotType )
		
	end

	self.crossBtn = UI:CreateChildWnd( self, UI.CrossBtn )
	UI:AddChildAndLink( self, self.crossBtn, workEffect, self.effectInfo.work.crossBtnLocator, UI.EffectAnimParams.POS )

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd )
	local infoEffect = UI:GetEffectFromLayer( self, self.layers.INFO_EFFECT )
	UI:AddChildAndLink( self, self.itemIcoWnd, infoEffect, self.effectInfo.info.itemIcoLocator, UI.EffectAnimParams.POS )

	self.buyWnd = UI:CreateChildWnd( self, UI.BuyWnd )
	self.buyWnd.mainWndName = self:GetName() 

	self.tradeWnd = UI:CreateChildWnd( self, UI.TradeWnd )
	self.tradeWnd.mainWndName = self:GetName() 

end


--
function UI.SalvageWnd:FullUpdate()

	self:UpdateItemIco()
	self:UpdateItemName()
	self:UpdateSlots()
	self:UpdateWaitEffect()

end


--
function UI.SalvageWnd:UpdateItemIco()

	self.itemIcoWnd:SetupForItem( self.itemDefName )

	local tooltipData = UI:GetTooltipForItem( self.itemDefName )
	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.SalvageWnd:UpdateItemName()

	local name = UI:GetEntityLocalizedNameByDef( self.itemDefName, false )
	self:SetText( name, self.layers.ITEM_NAME )

	local color = UI:GetItemColor( self.itemDefName )
	self:SetColor( color, self.layers.ITEM_NAME )

end


--
function UI.SalvageWnd:UpdateSlots()

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:Setup( self.iid )
	end

end


--
function UI.SalvageWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.crossBtn then

		self:Hide()
		UI:PlayGlobalSound( self.sounds.hide )

	else

    	local slotWnd = nil

    	if UI:IsWndKindOf( wnd, "Salvage_SlotWnd" ) then
    		slotWnd = wnd
    	else
    		local parent = wnd:GetParent()
    		while parent do
    			if UI:IsWndKindOf( parent, "Salvage_SlotWnd" ) then
    				slotWnd = parent
    				break
    			end		
    			parent = parent:GetParent()
    		end
    	end

    	if slotWnd then

			local slotType = slotWnd:GetSlotType()

        	if slotType == self.slotTypes.SELL then
        		self:TrySell()
        	else
        		self:TrySalvage( slotType )
        	end

    	end

	end

	return true	

end


--
function UI.SalvageWnd:OnEscape()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	return true

end


--
function UI.SalvageWnd:TrySalvage( slotType )

	if not self:IsWaiting() then

		local slotWnd = self:GetSlotByType( slotType )
		if slotWnd then

			local price, bGold = slotWnd:GetPrice()

			local buyData =
			{
				slotType	= slotType,
				price		= price,
				bGold		= bGold,
				iid			= self.iid,
			}

			self:LaunchBuyWnd( buyData ) 

		else
			sys.log( "UI.SalvageWnd:TrySalvage()[ERROR]: cannot find slot or type %s", tostring( slotType ) )
		end

	end

end


--
function UI.SalvageWnd:DoSalvage( slotType )	

	self.salvageRequestId = _G.GameStore_SalvageItem( self.iid, slotType == self.slotTypes.GOLD )

	if self.salvageRequestId ~= 0 then

		UI:AddWaitingRequest( self.salvageRequestId )

		if UI:CanItemBeSalvaged2( self.itemDefName ) then
			UI:AddWaitingRequest( UI.RESOURCES_REQUEST_ID )
		end

		local bEquipped = UI:GetEquippedShipItem( self.iid ) ~= nil
		if bEquipped then
			UI:AddWaitingRequest( UI.VESSEL_EQUIPMENT_REQUEST_ID )
		end

		UI:PlayGlobalSound( self.sounds.salvage )

	else
		self:ShowMsgOnSalvageError( _G.MasterServer.GenericResponderResult.GRR_ERROR )
	end

end


--
function UI.SalvageWnd:TrySell()

	if self:IsWaiting() then
		return
	end

	self:LaunchSellTradeWnd()	

end


--
function UI.SalvageWnd:DoSell()

	self.sellRequestId = _G.GameStore_SellItems( { self.iid } )

	if self.sellRequestId ~= 0 then

		UI:AddWaitingRequest( self.sellRequestId )

		local equipShipItem = UI:GetEquippedShipItem( self.iid )
		if equipShipItem then
			
			UI:AddWaitingRequest( UI.VESSEL_EQUIPMENT_REQUEST_ID )

			if UI:GetModuleType( self.itemDefName ) == ai.ModuleType.WEAPON then
				UI:CheckShowMsgOnUnequipPrimaryAmmo( equipShipItem, ai.WeaponClass.UNKNOWN )	-- tODO: перевести все окна на общую функцию
			end

		end

	else
		UI:ShowMsgOnSellError()
	end

end


--
function UI.SalvageWnd:LaunchSellTradeWnd()

	local invItem = UI:CreateInvItem( UI.invItemTypes.MODULE, self.itemDefName, UI:GetEquippedShipItem( self.iid ), 1, self.iid, nil, nil )

	self.tradeWnd:SetupForSell( invItem )
	self.tradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.SalvageWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then

		self:HideChildModals()

		local name = self:GetScriptTableName()
    	UI.store[ name ] =
    	{
			iid					= self.iid,
			salvageRequestId	= self.salvageRequestId,
			sellRequestId		= self.sellRequestId,
    	}

	end

end


--
function UI.SalvageWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()
	local t = UI.store[ name ]

	if t then

		self.salvageRequestId	= t.salvageRequestId
		self.sellRequestId		= t.sellRequestId

		if t.iid ~= UI.INVALID_U64_ID then
			self:Setup( t.iid )
		end

		UI.store[ name ] = nil

	end

end 


--
function UI.SalvageWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )	

end


--
function UI.SalvageWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )	

end


--
function UI.SalvageWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.SalvageWnd:IsWaiting()

	return UI:IsWaitingRequests()

end


--
function UI.SalvageWnd:ShowMsgOnSalvageError( result )

	UI:ShowErrorMsg( "msg_salvageError", result, "_G.MasterServer.GenericResponderResult" )

end


--
function UI.SalvageWnd:GetSlotByType( slotType )

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:GetSlotType() == slotType then
			return slotWnd
		end
	end

	return nil

end


--
function UI.SalvageWnd:LaunchBuyWnd( buyData ) 

	self.buyWnd:Setup( UI.BuyWnd.modes.SALVAGE, true, buyData )
	self.buyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.SalvageWnd:F_OnEventStartWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateWaitEffect()

end


--
function UI.SalvageWnd:F_OnEventStopWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

    self:UpdateWaitEffect()

end


-- ----------------------------------------------------------------------
-- UI.Salvage_SlotWnd
-- ----------------------------------------------------------------------

UI.Salvage_SlotWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

--
UI.Salvage_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	GOLD_FRAME_EFFECT	= 1,
    DESC				= 2,
    PRICE				= 3,
    MOUSE_OVER_EFFECT	= 4,
}

--
UI.Salvage_SlotWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "Salvage_SlotWnd",
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
				defName 			= "salvage_slot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "gold",
						layer		= "UI.Salvage_SlotWnd.layers.GOLD_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "t_2",
						layer		= "UI.Salvage_SlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price",
						layer		= "UI.Salvage_SlotWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.Salvage_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- GOLD_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "salvage_slot_goldFrame",
				defaultAnimation	= "idle",
			}}
		},

    	-- DESC
    	{
   			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 2, 1 },
   			formatFlags		= FONT.TF_WORDBREAK,
   			font			= { fontName = "Small" },
    	}, 

    	-- PRICE
    	{
   			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "salvage_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},       
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Salvage_SlotWnd:Init( slotType )

	self.slotType = slotType

	self:UpdateGoldFrame()

	if self.slotType ~= UI.SalvageWnd.slotTypes.GOLD then
		self:UpdatePrice()
	end

end


--
function UI.Salvage_SlotWnd:Setup( iid )

	self:Reset()

	self.iid = iid

	if self.slotType == UI.SalvageWnd.slotTypes.GOLD then
		self:UpdatePrice()
	end

	if self.slotType == UI.SalvageWnd.slotTypes.SELL then
		self:UpdadteItemIco()
	else	
		self:UpdateRefund()
	end

	self:UpdateDesc()

end


--
function UI.Salvage_SlotWnd:Reset()

	self.iid = UI.INVALID_U64_ID

	if self.slotType == UI.SalvageWnd.slotTypes.GOLD then
		self.priceMetaText:SetText( "", true )	
	end

	self.itemIcoWnd:Reset()
	self:RemoveControl( self.refundIcoWnd, self.layers.MAIN_EFFECT )

	self.refundIcoWnd:Reset()
	self:RemoveControl( self.refundIcoWnd, self.layers.MAIN_EFFECT )

	self.descMetaText:SetText( "", true )

end


--
function UI.Salvage_SlotWnd:GetSlotType()

	return self.slotType

end


--
function UI.Salvage_SlotWnd:OnPlayerCreditsChanged()

	if self.slotType == UI.SalvageWnd.slotTypes.GOLD then
		self:UpdatePrice()
	end

end


--
function UI.Salvage_SlotWnd:GetPrice()

	if self.slotType == UI.SalvageWnd.slotTypes.GOLD then
		return self:GetGoldPrice(), true
	else
		return 0, false
	end

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Salvage_SlotWnd.effectInfo =
{
	main =
	{
		itemIcoLocator		= "icon",
		refundIcoLocator	= "uniq_icon",
	},
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Salvage_SlotWnd.slotType			= -1
UI.Salvage_SlotWnd.iid				= UI.INVALID_U64_ID
UI.Salvage_SlotWnd.itemIcoWnd		= nil
UI.Salvage_SlotWnd.priceMetaText	= nil
UI.Salvage_SlotWnd.descMetaText		= nil
UI.Salvage_SlotWnd.refundIcoWnd		= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Salvage_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 	

	self.descMetaText = UI.MetaText.GetNewInstance()
	self.descMetaText:InitFromLayer( self, self.layers.DESC ) 	

	self:CreateControls()

end


--
function UI.Salvage_SlotWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	if self.descMetaText then
		self.descMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Salvage_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()
	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.Salvage_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
		self:UpdateMetaTextPos()
	end

end


--
function UI.Salvage_SlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
	self.descMetaText:UpdateScreenOrgFromLayer( self, self.layers.DESC )

end


--
function UI.Salvage_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.DESC then
		self.descMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Salvage_SlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.Salvage_SlotWnd:CreateControls()

	self.refundIcoWnd	= UI:CreateChildWnd( self, UI.Salvage_Slot_TokensIcoWnd, "" )
	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )

end


--
function UI.Salvage_SlotWnd:UpdateDesc()

	local str = ""

	if self.slotType == UI.SalvageWnd.slotTypes.GOLD then
		str = UI:GetStringByName( "salvage_desc_GOLD" )

	elseif self.slotType == UI.SalvageWnd.slotTypes.FREE then
		str = UI:GetStringByName( "salvage_desc_FREE" )

	elseif self.slotType == UI.SalvageWnd.slotTypes.SELL then

		str = UI:GetStringByName( "shop_sell" )
			
		local defName = UI:Iid2DefName( self.iid )

		local price = UI:GetShopSellPriceByDef( defName )

		local priceInfo = {}
		priceInfo.priceType		= _G.GameStore.CreditsType.CT_CREDITS
    	priceInfo.val			= price
    	priceInfo.bIsBuyPrice	= false

		local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.DESC ), nil, nil, true, nil )

		str = string.format( "%s|(%s)", str, strPrice )        

	else
		sys.log( "UI.Salvage_SlotWnd:UpdateDesc()[ERROR]: unhandled slotType: %s", tostring( self.slotType ) )
	end

	self.descMetaText:SetText( str, true )

end


--
function UI.Salvage_SlotWnd:UpdateGoldFrame()

	self:SetLayerVisible( self.slotType == UI.SalvageWnd.slotTypes.GOLD, self.layers.GOLD_FRAME_EFFECT )

end


--
function UI.Salvage_SlotWnd:UpdatePrice()

	local str = ""

	if self.slotType == UI.SalvageWnd.slotTypes.GOLD then

    	local salvagePrice = self:GetGoldPrice()

		local priceInfo = {}

		priceInfo.priceType 	= _G.GameStore.CreditsType.CT_GOLD
		priceInfo.val			= salvagePrice
		priceInfo.bIsBuyPrice	= true
		priceInfo.basePrice		= salvagePrice

		str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, nil, true, nil )

	elseif self.slotType == UI.SalvageWnd.slotTypes.FREE then
		str = UI:GetStringByName( "priceFree" )

	elseif self.slotType == UI.SalvageWnd.slotTypes.SELL then
		str = UI:GetStringByName( "priceFree" )
	end

	self.priceMetaText:SetText( str, true )

end


--
function UI.Salvage_SlotWnd:UpdadteItemIco()

	if self.slotType ~= UI.SalvageWnd.slotTypes.SELL then
		sys.log( "UI.Salvage_SlotWnd:UpdadteItemIco()[ERROR]: wrong slotType" )
		return
	end

	self:AddControl( self.itemIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.itemIcoLocator )

	local defName = UI:Iid2DefName( self.iid )

	self.itemIcoWnd:SetupForItem( defName )

	local tooltipData = UI:GetTooltipForItem( defName )
	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Salvage_SlotWnd:UpdateRefund()

	if self.slotType == UI.SalvageWnd.slotTypes.SELL then
		sys.log( "UI.Salvage_SlotWnd:UpdateRefundVal()[ERROR]: wrong slot type" )
		return
	end

	local refundVal		= 0
	local refundIcoMode	= -1

	local defName = UI:Iid2DefName( self.iid )
	local shopItem = UI.serverData.shopByDef[ defName ]

	if self.slotType == UI.SalvageWnd.slotTypes.GOLD then
		refundVal		= shopItem and shopItem.salvagePremiumTokenRefund or 0
		refundIcoMode	= UI.Salvage_Slot_TokensIcoWnd.modes.GOLD

	elseif self.slotType == UI.SalvageWnd.slotTypes.FREE then
		refundVal		= shopItem and shopItem.salvageTokenRefund or 0
		refundIcoMode	= UI.Salvage_Slot_TokensIcoWnd.modes.FREE

	else
		sys.log( "UI.Salvage_SlotWnd:UpdateRefund()[ERROR]: unhandled slot type: %s", tostring( self.slotType ) )
	end

	self:AddControl( self.refundIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.refundIcoLocator )
	self.refundIcoWnd:Setup( refundIcoMode, refundVal )
	                                          	
end


--
function UI.Salvage_SlotWnd:GetGoldPrice()

    local defName = UI:Iid2DefName( self.iid )
    local shopItem = UI.serverData.shopByDef[ defName ]
    local salvagePrice = shopItem and shopItem.salvagePremiumPrice or 0

	return salvagePrice

end


--
function UI.Salvage_SlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse and wndUnderMouse == self or wndUnderMouse:IsChildOf( self )

	self:SetMouseOver( bMouseOver )

end


--
function UI.Salvage_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.SalvageWnd.sounds.slotMouseOver )
	end

end


--
function UI.Salvage_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Salvage_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


--
function UI.Salvage_SlotWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.Salvage_SlotWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end    

-- --------------------------------------------------------------
-- UI.Salvage_Slot_TokensIcoWnd
-- --------------------------------------------------------------

UI.Salvage_Slot_TokensIcoWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Salvage_Slot_TokensIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Salvage_Slot_TokensIcoWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "salvage_slot_refund",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "player_val",
						layer		= "UI.Salvage_Slot_TokensIcoWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- VAL
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Salvage_Slot_TokensIcoWnd:Setup( mode, val )

	self:Reset()

	self.mode	= mode
	self.val	= val

	self:FullUpdate()
	
end


--
function UI.Salvage_Slot_TokensIcoWnd:Reset()

	self.mode	= -1
	self.val	= 0

	self:SetText( "", self.layers.VAL )

end


--
function UI.Salvage_Slot_TokensIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Salvage_Slot_TokensIcoWnd.layers =
{
	MAIN_EFFECT	= 0,
	VAL			= 1,
}

UI.Salvage_Slot_TokensIcoWnd.modes =
{
	FREE	= 1,
	GOLD	= 2,
}

UI.Salvage_Slot_TokensIcoWnd.effectInfo =
{
	main =
	{
		animGold	= "gold",
		animFree	= "idle",
	}
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Salvage_Slot_TokensIcoWnd.mode			= -1
UI.Salvage_Slot_TokensIcoWnd.val			= 0
UI.Salvage_Slot_TokensIcoWnd.tooltipData	= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Salvage_Slot_TokensIcoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:UpdateTooltip()	

end


--
function UI.Salvage_Slot_TokensIcoWnd:FullUpdate()

	self:UpdateAnimation()
	self:UpdateVal()

end


--
function UI.Salvage_Slot_TokensIcoWnd:UpdateAnimation()

	local anim = ""

	if self.mode == self.modes.FREE then
		anim = self.effectInfo.main.animFree

	elseif self.mode == self.modes.GOLD then
		anim = self.effectInfo.main.animGold

	else
		sys.log( "UI.Salvage_Slot_TokensIcoWnd:UpdateAnimation()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect and not UI:IsStrEmpty( anim ) then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.Salvage_Slot_TokensIcoWnd:UpdateVal()

	local strVal = UI:Num2StrSeparatedBy3( self.val )
	self:SetText( strVal, self.layers.VAL )

end


--
function UI.Salvage_Slot_TokensIcoWnd:UpdateTooltip()

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "tokensTooltip_caption" ),
		text		= UI:GetStringByName( "tokensTooltip_text" ),
	}	

end


--
function UI.Salvage_Slot_TokensIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.Salvage_Slot_TokensIcoWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.Salvage_Slot_TokensIcoWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end
