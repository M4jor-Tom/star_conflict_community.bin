-- --------------------------------------------------------------------
-- UI.ItemCraftSingleWnd
-- --------------------------------------------------------------------

UI.ItemCraftSingleWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.ItemCraftSingleWnd.layers =
{
    MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
	WORK_EFFECT		= 2,
    PRICE			= 3,
	WAIT_EFFECT		= 4,
	WAIT_TEXT		= 5, 
}


--
UI.ItemCraftSingleWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",
	
	props =
	{
		name	= "ItemCraftSingleWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
	},

	layers =
	{
		firstOverlayLayer = UI.ItemCraftSingleWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "help_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "craft_resources",	
						layer		= "UI.ItemCraftSingleWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- legacy from FullScreenWnd
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
				defName 			= "itemCraftSingle_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price",
						layer		= "UI.ItemCraftSingleWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "craft_resources",
						wnd			= "UI.ItemCraftSingle_WorkWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_1",
						wnd			= "UI.ItemCraftSingle_ActionBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.ItemCraftSingle_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.ItemCraftSingleWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "buy_btn8",	
						wnd			= "UI.ItemCraftSingle_TradingBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "button_5",
						wnd			= "UI.ItemCraftSingle_TransferToZoneBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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
						layer		= "UI.ItemCraftSingleWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
			text 			= UI:GetStringByName( "hangar_loading" ),
		},
	},

	children =
	{
		"UI.ItemCraftSingle_WorkWnd",
		"UI.ItemCraftSingle_ActionBtn",
		"UI.ItemCraftSingle_CrossBtn",
		"UI.ItemCraftSingle_TradingBtn",
		"UI.ItemCraftSingle_TransferToZoneBtn",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ItemCraftSingleWnd:Setup( itemDefName, blueprintDefName, bEnchanted, launchData, bApplyLaunchContextImmediate, dataToRestore )

	if type( itemDefName ) ~= "string" then
		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"itemDefName\"); \"string\" expected, got \"%s\"", type( itemDefName ) )
		return
	end
	
	if blueprintDefName ~= nil then
		if type( blueprintDefName ) == "string" then
		
			if blueprintDefName ~= "" then
				local craftResult = UI:GetResourceCraftResult( blueprintDefName )
				if craftResult ~= itemDefName then
					sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid blueprint %s for item %s", blueprintDefName, itemDefName )
					return
				end
			end
		
		else
			sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"blueprintDefName\"); \"string\" or \"nil\" expected, got \"%s\"", type( blueprintDefName ) )
			return
		end
	end

	if UI:IsStrEmpty( blueprintDefName ) then
		blueprintDefName = UI:GetBlueprintForItemCraft( itemDefName, true )
	end

	if bEnchanted ~= nil then
    	if type( bEnchanted ) ~= "boolean" then
    		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"bEnchanted\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bEnchanted ) )
    		return
    	end
	end

	if launchData ~= nil then
    	if type( launchData ) ~= "table" then
    		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of the 4-th parameter (\"launchData\"); \"table\" or \"nil\" expected, got \"%s\"", type( launchData ) )
    		return
    	end
	end

	if bApplyLaunchContextImmediate ~= nil then
    	if type( bApplyLaunchContextImmediate ) ~= "boolean" then
    		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of the 5-th parameter (\"bApplyLaunchContextImmediate\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bApplyLaunchContextImmediate ) )
			bApplyLaunchContextImmediate = nil
    	end
	end

	if bApplyLaunchContextImmediate == nil then
		bApplyLaunchContextImmediate = false
	end

	local iidToUpgrade	= UI.INVALID_U64_ID
	local vidToEquip	= UI.INVALID_U64_ID
	local slotIdToEquip	= -1
	local prevItems		= {}
	local craftCount	= -1

	local bError = false

	if launchData then

		local bUpgrade = false

		if launchData.bUpgrade ~= nil then

			if type( launchData.bUpgrade ) == "boolean" then
				bUpgrade = launchData.bUpgrade
			else
				sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of launchData.bUpgrade; \"boolean\" or \"nil\" expected, got \"%s\"", type( launchData.bUpgrade ) )
				bError = true
			end

		end

		if bUpgrade then

			if type( launchData.iid ) == "userdata" then
				iidToUpgrade = launchData.iid
			else
				sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of launchData.iid; \"userdata\" or \"nil\" expected, got \"%s\"", type( launchData.iid ) )
				bError = true
			end

		else

			if launchData.vidToEquip ~= nil then
    			if type( launchData.vidToEquip ) == "userdata" then
    				vidToEquip = launchData.vidToEquip
    			else
    				sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of launchData.vidToEquip; \"userdata\" or \"nil\" expected, got \"%s\"", type( launchData.vidToEquip ) )
    				bError = true
    			end
			end

			if vidToEquip ~= UI.INVALID_U64_ID then

				if type( launchData.slotIdToEquip ) == "number" then

					slotIdToEquip = launchData.slotIdToEquip

					if slotIdToEquip == -1 then
						sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid equip slot id" )
						vidToEquip = UI.INVALID_U64_ID
						bError = true
					end


				else
					sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of launchData.slotIdToEquip; \"number\" expected, got \"%s\"", type( launchData.slotIdToEquip ) )
					bError = true
				end

			end

		end

	end

	if bError then
		return
	end

	if dataToRestore ~= nil then

		if type( dataToRestore ) == "table" then

			local bPrevItemsError = false

        	if dataToRestore.prevItems ~= nil then

            	if type( dataToRestore.prevItems ) == "table" then

        			for chainIdx, chainItem in pairs( dataToRestore.prevItems ) do

        				if type( chainIdx ) == "number" and type( chainItem ) == "table" then

        					if type( chainItem.defName ) ~= "string" or type( chainItem.blueprintDefName ) ~= "string" or type( chainItem.bEnchanted ) ~= "boolean" or ( chainItem.launchData ~= nil and type( chainItem.launchData ) ~= "table" ) then
        						sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid format of item #%d in dataToRestore.prevItems; {defName=<string>, bEnchanted=<boolean>, launchData=<table>/<nil>} expected; got {defName=<%s>, bEnchanted=<%s>, launchData=<%s>}", chainIdx, type( chainItem.defName ), type( chainItem.bEnchanted ), type( chainItem.launchData ) )
        						bPrevItemsError = true
        					end

        				else
        					sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid format of dataToRestore.prevItems; <number>=<table> expected, got <%s>=<%s>", type( chainIdx ), type( chainItem ) )
        					bPrevItemsError = true
        				end

        				if bPrevItemsError then
        					break
        				end

        			end

        		else
            		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of \"dataToRestore.prevItems\"; \"table\" or \"nil\" expected, got \"%s\"", type( dataToRestore.prevItems ) )
    				bPrevItemsError = true
            	end

    		end

        	if dataToRestore.prevItems ~= nil and not bPrevItemsError then
    			prevItems = dataToRestore.prevItems
    		end


			if dataToRestore.craftCount ~= nil then
				if type( dataToRestore.craftCount ) == "number" then
            		craftCount = dataToRestore.craftCount
				else
            		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of \"dataToRestore.craftCount\"; \"number\" or \"nil\" expected, got \"%s\"", type( dataToRestore.craftCount ) )
				end
			end

		else
    		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: invalid type of the 6-th parameter (\"dataToRestore\"); \"table\" or \"nil\" expected, got \"%s\"", type( dataToRestore ) )
		end

	end


	if iidToUpgrade ~= UI.INVALID_U64_ID and vidToEquip ~= UI.INVALID_U64_ID then

		sys.log( "UI.ItemCraftSingleWnd:Setup()[ERROR]: both iidToUpgrade and vidToEquip are set" )

		vidToEquip		= UI.INVALID_U64_ID
		slotIdToEquip	= -1

	end

	if bEnchanted == nil then

    	if iidToUpgrade ~= UI.INVALID_U64_ID then
        	bEnchanted = UI:IsInventoryItemEnchantedById( iidToUpgrade )

        elseif blueprintDefName ~= "" then
    		bEnchanted = UI:IsBlueprintEnchanted( blueprintDefName )

    	else
			bEnchanted = false
    	end

	end

	self:Reset()

	self.itemDefName		= itemDefName
	self.blueprintDefName	= blueprintDefName
	self.launchData			= launchData
	self.iidToUpgrade		= iidToUpgrade
	self.vidToEquip			= vidToEquip
	self.slotIdToEquip		= slotIdToEquip
	self.bEnchanted			= bEnchanted
	self.prevItems			= prevItems

	if craftCount ~= -1 then
    	self.dataToRestore = { craftCount = craftCount }
	end

	if self:IsOnScreen() then
		self:FullUpdate( false )
	end

	if bApplyLaunchContextImmediate then
		self:ApplyLaunchContext( self.launchData, true )
	end

end


--
function UI.ItemCraftSingleWnd:GetLaunchData()

	return self.launchData

end


--
function UI.ItemCraftSingleWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

    if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

    		if requestId == self.requestId_buyInventory then
			
        		if self.blueprintToCraftData then
					self:LaunchCraftWnd( self.blueprintToCraftData.defName, self.blueprintToCraftData.bEnchanted, self.blueprintToCraftData.count )
					
				elseif self.itemToBuy then
					self:LaunchTradeWnd( self.itemToBuy )
        		end
				
			end

		end

	else

		if requestId == self.requestId_buyInventory then
    		UI:ShowMsgOnBuyError( result )
		end

	end

	if requestId == self.requestId_buyInventory then

		self.blueprintToCraftData = nil
		self.itemToBuy = nil

		self.requestId_buyInventory = 0
	    self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.ItemCraftSingle_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ItemCraftSingle_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ItemCraftSingle_CraftConfirmWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdateActionBtn()

end


--
function UI.ItemCraftSingleWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.ItemCraftSingle_BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ItemCraftSingle_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ItemCraftSingleWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.ItemCraftSingle_BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftSingle_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ItemCraftSingleWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.ItemCraftSingle_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftSingle_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ItemCraftSingleWnd:GameStore_OnSpoiled( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self.blueprintToCraftData = nil
	self.itemToBuy = nil
	
	UI.ItemCraftSingle_BuyWnd:UnlinkFromParent()
	UI.ItemCraftSingle_TradeWnd:UnlinkFromParent()
	UI.ItemCraftSingle_CraftConfirmWnd:UnlinkFromParent()

end


--
function UI.ItemCraftSingleWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate( true )

end


--
function UI.ItemCraftSingleWnd:OnBuyWndResult( result, mode, data )

	if result == true then

		if mode == UI.BuyWnd.modes.INVENTORY_USER or mode == UI.BuyWnd.modes.INVENTORY_AUTO then
			self:BuyInventory()

		else
			sys.log( "UI.ItemCraftSingleWnd:OnBuyWndResult()[ERROR]: unhandled mode - %s", tostring( mode ) )
			self.blueprintToCraftData = nil
			self.itemToBuy = nil
		end

	else
		self.blueprintToCraftData = nil
		self.itemToBuy = nil
	end

end  


--
function UI.ItemCraftSingleWnd:OnTradeResult_Buy( shopItem, count, priceType )

	if not UI:IsDefBundle( shopItem.defName ) and not UI:IsDefAmmo( shopItem.defName ) then
		self.requestId_buy = _G.GameStore_Buy( shopItem.id, count, priceType, 1 )	-- #0072739,(0309199) и #0095267,(0439872) - 1 нужна для сбора статистики, 
	else
		self.requestId_buy = _G.GameStore_Buy( shopItem.id, count, priceType )
	end
		
	if self.requestId_buy ~= 0 then

		UI:AddWaitingRequest( self.requestId_buy )
		
		if UI:IsDefBlueprint( shopItem.defName ) then
			self.bWaitingLearnedBlueprints = true
			UI:PlayGlobalSound( self.sounds.learnBlueprint )
		end

	else
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

    self:UpdateWaitEffect()

end


-- нет самостоятельной подписки, вызывается из UI.HangarWnd
function UI.ItemCraftSingleWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.blueprintToCraftData 		= nil
	self.itemToBuy					= nil

    self.requestId_buyInventory		= 0
    self.requestId_learnBlueprint	= 0
    self.requestId_buy				= 0
    self.requestId_craft			= 0
    self.bWaitingLearnedBlueprints	= false
	self.requestId_craftUpgradeItem	= 0
	self.bToCloseAfterEquip			= false
	self.bWaitingInventory			= false
	self.itemToEquipInfo			= nil
	self.requestId_changeMunition	= 0
	self.requestId_changeEquipment	= 0

	if self:IsOnScreen() then
	    self:UpdateWaitEffect()
	end

end


--
function UI.ItemCraftSingleWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

	if self.bWaitingLearnedBlueprints then
		self.bWaitingLearnedBlueprints = false
	    self:UpdateWaitEffect()
	end

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:FullUpdate( true )

end


--
function UI.ItemCraftSingleWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	-- апдейт происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_learnBlueprint then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
    		UI:ShowMsgOnLearnBlueprintError( result )
    	end

		self.requestId_learnBlueprint = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	-- апдейт происходит в F_OnEventInvItemsChanged()

	if requestId ~= 0 and requestId == self.requestId_buy then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
    		UI:ShowMsgOnBuyError( result )
    	end

		self.requestId_buy = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:OnCraftWndResult( result, data )

	if result then
		self:DoCraft( data.blueprintDefName, data.bEnchanted, data.count )
	end

end


--
function UI.ItemCraftSingleWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	-- апдейт происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_craft then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then

    		UI:ShowMsgOnItemCraftError( result )

			self.itemToEquipInfo = nil
			self.bWaitingInventory = false

    	end

		self.requestId_craft = 0		
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	-- апдейт происходит в F_OnEventInvItemsChanged()

	if requestId == self.requestId_craftUpgradeItem then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then

    		UI:ShowMsgOnItemCraftError( result )

			self.bToCloseAfterEquip = false
			self.bWaitingInventory = false

    	end

		self.requestId_craftUpgradeItem = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if self.bWaitingInventory then

		if result ~= 0 then		
			self.bToCloseAfterEquip = false
			self.itemToEquipInfo = nil
		end

		self.bWaitingInventory = false
	    self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	if requestId == self.requestId_changeMunition then

    	if result ~= _G.GameStore.MunitionResult.MR_OK then

    		UI:ShowMessageOnChangeMunitionError( result )

			self.bToCloseAfterEquip = false
			self.bWaitingInventory = false

    	end

		self.requestId_changeMunition = 0		
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	if requestId == self.requestId_changeEquipment then

    	if result ~= _G.GameStore.ModuleEquipResult.MER_OK then

    		UI:ShowMessageOnEquipError( result )

			self.bToCloseAfterEquip = false
			self.bWaitingInventory = false

    	end

		self.requestId_changeEquipment = 0		
		self:UpdateWaitEffect()

	end

end


--
function UI.ItemCraftSingleWnd:OnCraftCountChanged( data )

	if not self:IsOnScreen() then
		return
	end

	self:UpdatePrice()
	self:UpdateActionBtn()

end


-- показ крафта для ингредиента, необходимого для крафта текущего предмета (продвижение по цепочке крафтов вправо)
function UI.ItemCraftSingleWnd:OnShowIngreditentCraft( data )

	if not self:IsOnScreen() then
		sys.log( "UI.ItemCraftSingleWnd:OnShowIngreditentCraft()[ERROR]: not on screen" )
		return
	end

	local prevItems = UI:CopyTable2( self.prevItems )
	table.insert( prevItems, { defName = self.itemDefName, blueprintDefName = self.blueprintDefName, bEnchanted = self.bEnchanted, launchData = self.launchData } )

	local launchData =
	{
		bItemCraftSingle	= true,
	}

	self:Setup( data.itemDefName, "", data.bEnchanted, launchData, nil, { prevItems = prevItems } )
    UI:PlayGlobalSound( self.sounds.newState )

end


-- возвращение к одному из предыдущих крафтов (продвижение по цепочке крафтов влево)
function UI.ItemCraftSingleWnd:OnSelectChainItem( data )

	if not self:IsOnScreen() then
		sys.log( "UI.ItemCraftSingleWnd:OnSelectChainItem()[ERROR]: not on screen" )
		return
	end

	local selChainItem = self.prevItems[ data.chainIdx ]
	if not selChainItem then
		sys.log( "UI.ItemCraftSingleWnd:OnSelectChainItem()[ERROR]: invalid chain item idx" )
		return		
	end

	local prevItems = {}
	for idx = 1, data.chainIdx - 1 do
		table.insert( prevItems, self.prevItems[ idx ] )
	end

	self:Setup( selChainItem.defName, selChainItem.blueprintDefName, selChainItem.bEnchanted, selChainItem.launchData, nil, { prevItems = prevItems } )
    UI:PlayGlobalSound( self.sounds.newState )

end


-- ------------------------------
-- const
-- ------------------------------

UI.ItemCraftSingleWnd.sounds =
{
	tradeWndShow				= "sound/ui/btnClick",
	learnBlueprint				= "sound/ui/apply",
	craft						= "sound/ui/apply",
	buyInventory				= "sound/ui/apply",
	hide						= "sound/ui/MsgHide",
	newState					= UI.sounds.btnClick,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ItemCraftSingleWnd.itemDefName				= ""
UI.ItemCraftSingleWnd.blueprintDefName			= ""
UI.ItemCraftSingleWnd.launchData				= nil
UI.ItemCraftSingleWnd.iidToUpgrade				= UI.INVALID_U64_ID
UI.ItemCraftSingleWnd.vidToEquip				= UI.INVALID_U64_ID
UI.ItemCraftSingleWnd.slotIdToEquip				= -1
UI.ItemCraftSingleWnd.bEnchanted				= false
UI.ItemCraftSingleWnd.prevItems					= {}

UI.ItemCraftSingleWnd.priceMetaText				= nil
UI.ItemCraftSingleWnd.workWnd					= nil
UI.ItemCraftSingleWnd.actionBtn					= nil
UI.ItemCraftSingleWnd.crossBtn					= nil
UI.ItemCraftSingleWnd.tradingBtn				= nil
UI.ItemCraftSingleWnd.transferToZoneBtn			= nil

UI.ItemCraftSingleWnd.requestId_buyInventory	= 0
UI.ItemCraftSingleWnd.requestId_learnBlueprint	= 0
UI.ItemCraftSingleWnd.requestId_buy				= 0
UI.ItemCraftSingleWnd.requestId_craft			= 0
UI.ItemCraftSingleWnd.bWaitingLearnedBlueprints	= false
UI.ItemCraftSingleWnd.blueprintToCraftData		= nil
UI.ItemCraftSingleWnd.itemToBuy					= nil
UI.ItemCraftSingleWnd.itemToEquipInfo			= nil
UI.ItemCraftSingleWnd.requestId_craftUpgradeItem= 0
UI.ItemCraftSingleWnd.bToCloseAfterEquip		= false
UI.ItemCraftSingleWnd.bWaitingInventory			= false
UI.ItemCraftSingleWnd.requestId_changeMunition	= 0
UI.ItemCraftSingleWnd.requestId_changeEquipment	= 0

UI.ItemCraftSingleWnd.dataToRestore				= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ItemCraftSingleWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.workWnd			= UI.ItemCraftSingle_WorkWnd
	self.actionBtn			= UI.ItemCraftSingle_ActionBtn
	self.crossBtn			= UI.ItemCraftSingle_CrossBtn
	self.icoWnd				= UI.ItemCraftSingle_IcoWnd
	self.tradingBtn			= UI.ItemCraftSingle_TradingBtn
	self.transferToZoneBtn	= UI.ItemCraftSingle_TransferToZoneBtn

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )

	self:SetDefaultActivatableChild( self.workWnd:GetName() )

	self:Reset()
	self:HideWaitEffect()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )

end


--
function UI.ItemCraftSingleWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ItemCraftSingleWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateWaitEffect()
	self:UpdateMetaTextPos()

end


--
function UI.ItemCraftSingleWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ItemCraftSingleWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.ItemCraftSingleWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ItemCraftSingleWnd:Reset()

	self.itemDefName		= ""
	self.blueprintDefName	= ""
	self.launchData			= nil
	self.iidToUpgrade		= UI.INVALID_U64_ID
	self.vidToEquip			= UI.INVALID_U64_ID
	self.slotIdToEquip		= -1
	self.bEnchanted			= false
	self.prevItems			= {}

	self:ResetContent()

end


--
function UI.ItemCraftSingleWnd:ResetContent()

	self.priceMetaText:SetText( "", true )
	self.workWnd:Reset()
	self:ResetActionBtn()
	self.tradingBtn:UnlinkFromParent()
	self.transferToZoneBtn:UnlinkFromParent()

end


--
function UI.ItemCraftSingleWnd:FullUpdate( bRestore )

	local craftCount = self.workWnd:GetCraftCount()

	self:ResetContent()

	if self.itemDefName == "" then
		return
	end

	self:UpdateWorkWnd()
	self:UpdatePrice()
	self:UpdateActionBtn()
	self:UpdateWaitEffect()
	self:UpdateTradingBtn()
	self:UpdateTransferToZoneBtn()

	if self.dataToRestore then
		self.workWnd:SetCraftCount( self.dataToRestore.craftCount )
		self.dataToRestore = nil
	end

	if bRestore then
		self.workWnd:SetCraftCount( craftCount )
	end

end


--
function UI.ItemCraftSingleWnd:UpdateWorkWnd()

	self.workWnd:Setup( self.itemDefName, self.blueprintDefName, self.bEnchanted, self.iidToUpgrade, self.vidToEquip, self.slotIdToEquip, self.prevItems )

end


--
function UI.ItemCraftSingleWnd:UpdatePrice()

	self.priceMetaText:SetText( "", true )

	local str = ""
	
		-- если отображаются данные для чертежа
	if self.blueprintDefName ~= "" then

		-- цена крафта

		if UI:IsBluePrintLearned( self.blueprintDefName ) then

			local craftCount = self.workWnd:GetCraftCount()
			if craftCount > 0 then
		
				local priceInfos = UI:GetResourceCraftPrice( self.blueprintDefName, craftCount )
				for priceInfoIdx, priceInfo in ipairs( priceInfos ) do
		
					local priceInfo = priceInfos[ priceInfoIdx ]
					local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, nil, true, nil )
		
					if str ~= "" then
						str = string.format( "%s ", str )
					end
					str = str .. strPrice
		
				end
		
			end


		-- цена изучения чертежа

		else

			local bNeedBlueprintIco		= false
			local requiredNodeName		= ""
			local requiredShipDefName	= ""

			local blueprintsCount = UI:GetPlayerResourceCount( self.blueprintDefName )

			if blueprintsCount > 0 then

				bNeedBlueprintIco = true

			else

				requiredNodeName, requiredShipDefName = UI.ItemCraftMultiWnd:GetRequiredNode( self.blueprintDefName )

				if requiredNodeName == "" then
					bNeedBlueprintIco = UI:CantItemBeBoughtByDef( self.blueprintDefName )
				end

			end		

			if bNeedBlueprintIco then

				local color = UI.WHITE_COLOR

				if blueprintsCount > 0 then
					str = string.format( "%s1$link [type CUSTOM_ICO] [params {texName=\"bluePrint\", tooltipTextId=\"blueprintIcoTooltip_text\", tooltipCaptionId=\"blueprintIcoTooltip_caption\", colorSel=UI.WHITE_COLOR, colorUnsel=UI.WHITE_COLOR}]$", UI:Color2Str( color ) )
				else
					color = UI.PARAM_DELTA_MINUS_COLOR
					local tooltipText = UI:GetItemSourceDesc( self.blueprintDefName, UI.TooltipWnd_shared:GetTextColor() )
					str = string.format( "%s1$link [type CUSTOM_ICO] [params {texName=\"bluePrint\", tooltipText=\"%s\", tooltipCaptionId=\"blueprintIcoTooltip_caption\", colorSel=UI.WHITE_COLOR, colorUnsel=UI.WHITE_COLOR}]$", UI:Color2Str( color ), tooltipText )
				end

			elseif requiredNodeName ~= "" then

				local baseColor = UI.PARAM_DELTA_MINUS_COLOR
				
				local shipName = UI:GetEntityLocalizedNameByDef( requiredShipDefName, true, false, nil, nil )
				shipName = string.format( "%s%s", shipName, UI:Color2Str( baseColor ) )

				str = UI:GetStringByName( "itemCraft_nodeRequired" )

				local numSubst = 0
				str, numSubst = string.gsub( str, "%$ship%$", shipName )

				if numSubst == 0 then
					sys.log( "UI.ItemCraftSingleWnd:UpdatePrice()[ERROR]: cannot find placeholder \"$ship$\" in string \"itemCraft_nodeRequired\"" )
					str = string.format( "[INVALID STRING] Required node in ship %s", shipName )
				end

				str = string.format( "%s%s", UI:Color2Str( baseColor ), str )

			else			

				local priceInfos = {}
				
				local priceType, price, basePrice, altPriceType, altPrice, altBasePrice = UI:GetShopSmartBuyPriceAltByDef( self.blueprintDefName )
				
				local priceInfo =
				{
					priceType	= priceType,
					val			= price,
					bIsBuyPrice	= true,
					basePrice	= basePrice,
				}
				table.insert( priceInfos, priceInfo )
				
				
				if altPriceType then
				
					local altPriceInfo =
					{
						priceType	= altPriceType,
						val			= altPrice,
						bIsBuyPrice	= true,
						basePrice	= altBasePrice,
					}
					table.insert( priceInfos, altPriceInfo )

				end

				str = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.PRICE ), true, nil, true, nil )

			end

		end
		
	-- если отображаются данные для предмета (без чертежа)
	elseif self.itemDefName ~= "" then
		
		-- цена покупки
		-- #0098154 - если это не первый предмет в цепочке апгрейда, то показываем кнопку купить для первого предмета
		local baseDefName = UI:GetItemUpgradeBaseDef( self.itemDefName )
		
		if not UI:CantItemBeBoughtByDef( baseDefName ) then
	
			local priceInfos = {}
			
			local priceType, price, basePrice, altPriceType, altPrice, altBasePrice = UI:GetShopSmartBuyPriceAltByDef( baseDefName )
			
			local priceInfo =
			{
				priceType	= priceType,
				val			= price,
				bIsBuyPrice	= true,
				basePrice	= basePrice,
			}
			table.insert( priceInfos, priceInfo )
			
			
			if altPriceType then
			
				local altPriceInfo =
				{
					priceType	= altPriceType,
					val			= altPrice,
					bIsBuyPrice	= true,
					basePrice	= altBasePrice,
				}
				table.insert( priceInfos, altPriceInfo )

			end

    		str = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.PRICE ), true, nil, true, nil )
			
		end

	end

	self.priceMetaText:SetText( str, true )

end


--
function UI.ItemCraftSingleWnd:UpdateActionBtn()

	self:ResetActionBtn()

	-- если отображаются данные для чертежа
	if self.blueprintDefName ~= "" then

		self:AddChild( self.actionBtn )

		-- крафт

		if UI:IsBluePrintLearned( self.blueprintDefName ) then

			self.actionBtn:SetBtnText( UI:GetStringByName( "itemCraft_craftBtn" ) )

			local craftCount = self.workWnd:GetCraftCount()
			local bEnable = craftCount > 0 and UI:IsEnoughIngredientsForCraftFromResource( self.blueprintDefName, craftCount, true, self.iidToUpgrade )
			self.actionBtn:Enable( bEnable )

		else

			local requiredNodeName, requiredShipDefName = UI.ItemCraftMultiWnd:GetRequiredNode( self.blueprintDefName )

			-- переход к ноду

			if requiredNodeName ~= "" then

				self.actionBtn:SetBtnText( UI:GetStringByName( "itemCraft_goToNode" ) )

				local bEnable = true

				if not UI:IsShipVisibleInShipsTree( requiredShipDefName ) then

					sys.log( "UI.ItemCraftSingleWnd:UpdateActionBtn()[ERROR]: ship %s that is required to learn blueprint %s is not visible in ships tree", requiredShipDefName, self.blueprintDefName )
					bEnable = false

				else

					local shipItem = UI:GetEvolvingShipItem( requiredShipDefName )
					if not shipItem then

						local bAdvert, bByFlag = UI:IsShipAdvert( requiredShipDefName )
						if bAdvert and not bByFlag then

							sys.log( "UI.ItemCraftSingleWnd:UpdateActionBtn()[ERROR]: ship %s that is required to learn blueprint %s is advert and cannot be shown in nodes editor", requiredShipDefName, self.blueprintDefName )
							bEnable = false

						end

					end
					
				end

				self.actionBtn:Enable( bEnable )

			-- изучение

			else

				self.actionBtn:SetBtnText( UI:GetStringByName( "itemCraft_learnBtn" ) )

				local bEnable = UI:CanLearnBluePrint( self.blueprintDefName )
				self.actionBtn:Enable( bEnable )

			end

		end
		
	-- если отображаются данные для предмета (без чертежа)
	elseif self.itemDefName ~= "" then
	
		-- купить
		-- #0098154 - если это не первый предмет в цепочке апгрейда, то показываем кнопку купить для первого предмета
		local baseDefName = UI:GetItemUpgradeBaseDef( self.itemDefName )
		
		if not UI:CantItemBeBoughtByDef( baseDefName ) then
		
			self:AddChild( self.actionBtn )
			
			self.actionBtn:SetBtnText( UI:GetStringByName( "shop_buy" ) )
			self.actionBtn:Enable( true )
			
		end
		
	end

end


--
function UI.ItemCraftSingleWnd:ResetActionBtn()

	if self.actionBtn:IsChildOf( self ) then
		self.actionBtn:Reset()
		self.actionBtn:UnlinkFromParent()
	end

end


--
function UI.ItemCraftSingleWnd:UpdateTradingBtn()

	local bNeedTradingBtn = self:GetDefForTrading() ~= ""

	if bNeedTradingBtn then
		self:AddChild( self.tradingBtn )
	else
		self.tradingBtn:UnlinkFromParent()
	end	

end


--
function UI.ItemCraftSingleWnd:GetDefForTrading()
	
	local defNameForTrading = ""

	if self.itemDefName ~= "" then
		
		-- #0106973
		-- если чертеж не изучен, то торговля чертежом
		if self.blueprintDefName ~= "" and not UI:IsBluePrintLearned( self.blueprintDefName ) then
			if UI:IsItemTrading( self.blueprintDefName ) and UI:GetPlayerResourceCount( self.blueprintDefName ) == 0 then
				defNameForTrading = self.blueprintDefName
			end
			
		-- торговля предметом
		else
			if UI:IsItemTrading( self.itemDefName ) then
				defNameForTrading = self.itemDefName
			end
		end
		
	end
	
	return defNameForTrading

end


--
function UI.ItemCraftSingleWnd:UpdateTransferToZoneBtn()

	local bNeedBtn = false

	if self.itemDefName ~= "" and self.blueprintDefName == "" and UI:GetItemSourceZone( self.itemDefName ) ~= -1 then
		local baseDefName = UI:GetItemUpgradeBaseDef( self.itemDefName )
		if UI:CantItemBeBoughtByDef( baseDefName ) then
			bNeedBtn = true
		end
	end

	if bNeedBtn then
		self:AddChild( self.transferToZoneBtn )
	else
		self.transferToZoneBtn:UnlinkFromParent()
	end	

end


--
function UI.ItemCraftSingleWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.ItemCraftSingleWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.actionBtn then

		if not self:IsWaiting() then

			if self.blueprintDefName ~= "" then

    			if UI:IsBluePrintLearned( self.blueprintDefName ) then

    				self:TryCraft( self.blueprintDefName, self.bEnchanted, self.workWnd:GetCraftCount() )

    			else

    				local requiredNodeName, requiredShipDefName = UI.ItemCraftMultiWnd:GetRequiredNode( self.blueprintDefName )
    				if requiredNodeName ~= "" then					

    			    	self:Hide()

    					local launchData =
    					{
    						bItemCraftSingle		= true,
    						itemDefName				= self.itemDefName,
							bEnchanted				= self.bEnchanted,
    						itemCraftLaunchData		= self.launchData,
    						bReturnFromEvolvingEdit	= true,
							dataToRestore			= { prevItems = self.prevItems, craftCount = self.workWnd:GetCraftCount() },
    					}

    					UI.HangarWnd:OpenShips( requiredShipDefName, true, true, nil, launchData )
						UI.ShipsTreeWnd:ShowNoticeOnNode( requiredNodeName )

    				else
    					self:TryLearnBlueprint( self.blueprintDefName )
    				end

    			end

			elseif self.itemDefName ~= "" then
				-- #0098154 - если это не первый предмет в цепочке апгрейда, то показываем кнопку купить для первого предмета
				local baseDefName = UI:GetItemUpgradeBaseDef( self.itemDefName )
				self:TryBuyItem( baseDefName )

			else
				sys.log( "UI.ItemCraftSingleWnd:F_OnMouseLButtonDown()[ERROR]: neither sel blueprint nor item" )
			end

		end

	elseif wnd == UI.ItemCraftSingle_CrossBtn then

		self:ReturnToPrevWindow( true )

	elseif wnd == self.tradingBtn then

		if not self:IsWaiting() then
			self:LaunchTradingAdvertsWnd( self:GetDefForTrading() )
		end
		
	elseif wnd == self.transferToZoneBtn then
	
		if not self:IsWaiting() then
		
			local zoneId = UI:GetItemSourceZone( self.itemDefName )
			
			UI.GameplayShipSelectWnd:Setup( zoneId )
			UI.GameplayShipSelectWnd:Show()
			UI:PlayGlobalSound( UI.sounds.btnClick )
			
		end

	end

	return true

end


--
function UI.ItemCraftSingleWnd:OnEscape()

	self:ReturnToPrevWindow( false )
	return true	

end


-- если bSkipChain=true, то не будет возврата к предыдущему крафту, а будет сразу возврат в ангар или другое окно, из которого крафт был вызван
function UI.ItemCraftSingleWnd:ReturnToPrevWindow( bSkipCraftChain )

	if bSkipCraftChain == nil then
		bSkipCraftChain = false
	end

	if not self:IsOnScreen() then
		sys.log( "UI.ItemCraftSingleWnd:ReturnToPrevWindow()[ERROR]: not on screen" )
		return
	end

	local bRemainInThisWindow = self.launchData and self.launchData.bItemCraftSingle and not bSkipCraftChain and next( self.prevItems ) ~= nil
	if not bRemainInThisWindow then
		self:Hide()
		UI:PlayGlobalSound( self.sounds.hide )		
	end

    self:ApplyLaunchContext( self.launchData, not bRemainInThisWindow )

end


--
function UI.ItemCraftSingleWnd:ApplyLaunchContext( launchData, bImmediate )

	local bHandled = false

    if launchData then

		if launchData.bShipCraft then

			UI.HangarWnd:ShowShipCraft( launchData.shipDefName, launchData.shipCraftLaunchData, launchData.dataToRestore )
			bHandled = true

		elseif launchData.bShipsTree then

			UI.HangarWnd:OpenShips( launchData.shipDefNameCenterOn, true, launchData.bEvolvingEdit, launchData.evolvingEditParams, launchData.shipsTreeLaunchData )
			bHandled = true

		elseif launchData.bEquipment then
		
			if launchData.bPreview then
				UI.HangarWnd:ShowEquipmentPreview( launchData.vid, nil, launchData.previewLaunchData )
			else
				UI.HangarWnd:ShowShipEquipment( launchData.vid )
			end
			
			UI.EquipmentWnd:SelectShipSlotByInfo( launchData.selInfo )
			
			bHandled = true

    	elseif launchData.bItemCraftSingle then

			if not bImmediate then

    			local prevItem = self.prevItems[ #self.prevItems ]
				if prevItem then

					local prevItems = UI:CopyTable2( self.prevItems )					
					prevItems[ #prevItems ] = nil

					self:Setup( prevItem.defName, prevItem.blueprintDefName, prevItem.bEnchanted, prevItem.launchData, nil, { prevItems = prevItems } )
    				UI:PlayGlobalSound( self.sounds.newState )

        	    	bHandled = true

				else
					sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: no prev chain item" )
				end

			else

    			local fitLaunchData = nil

				for prevItemIdx = #self.prevItems, 1, -1 do
					local prevItem = self.prevItems[ prevItemIdx ]
					if not prevItem.launchData or not prevItem.launchData.bItemCraftSingle then
    					fitLaunchData = prevItem.launchData
    					break
					end
				end

    			self:ApplyLaunchContext( fitLaunchData, true )
				bHandled = true

			end

    	elseif launchData.bEvolvingShipCraftWnd then

			if type( launchData.shipDefName ) == "string" then

				UI.HangarWnd:OpenShips( launchData.shipDefName, true )

				if UI.HangarWnd:GetMenuTab() == UI.HangarWnd.menuTabs.SHIPS then

					if type( launchData.craftWndTableName ) == "string" then

    					local craftWnd = UI:GetValByName( launchData.craftWndTableName )
						if craftWnd then
    						craftWnd:Setup( launchData.shipDefName )
    						craftWnd:Show()
						else
							sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid craftWndTableName=%s for bEvolvingShipCraftWnd data mode", launchData.craftWndTableName )
						end

					else
						sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid type of launchData.craftWndTableName for bEvolvingShipCraftWnd data mode; \"string\" expected, got \"%s\"", type( launchData.craftWndTableName ) )
					end

				else
					sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: cannot show ships tree right now" )
				end				

			else
				sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid type of launchData.shipDefName for bEvolvingShipCraftWnd data mode; \"string\" expected, got \"%s\"", type( launchData.shipDefName ) )
			end

			bHandled = true

    	elseif launchData.bShipNodeLearnWnd then

			if type( launchData.shipNodeLearnParams ) == "table" then

				local shipItem = UI:GetShipItem( launchData.shipNodeLearnParams.vid, false )
				if shipItem then		

    				UI.HangarWnd:OpenShips( shipItem.defName, true )

    				if UI.HangarWnd:GetMenuTab() == UI.HangarWnd.menuTabs.SHIPS then

						if type( launchData.learnWndTableName ) == "string" then

							local learnWnd = UI:GetValByName( launchData.learnWndTableName )
							if learnWnd then
        						learnWnd:Setup( launchData.shipNodeLearnParams.nodeName, launchData.shipNodeLearnParams.vid, launchData.shipNodeLearnParams.chosenNodesMask )
    	    					learnWnd:Show()
							else
								sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid launchData.learnWndTableName=%s for bShipNodeLearnWnd data mode", learnWndTableName )
							end

						else
							sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid type of launchData.learnWndTableName for bShipNodeLearnWnd data mode; \"string\" expected, got \"%s\"", type( launchData.learnWndTableName ) )
						end

    				else
    					sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: cannot show ships tree right now" )
    				end

				else
					sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: cannot find ship item for vid %s", _G.U64ToStr( launchData.shipNodeLearnParams.vid ) )
				end

			else
				sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: invalid type of launchData.shipNodeLearnParams for bShipNodeLearnWnd data mode; \"table\" expected, got \"%s\"", type( launchData.shipNodeLearnParams ) )
			end

			bHandled = true
			
    	elseif launchData.bAtlas then

			if type( launchData.uid ) == "userdata" then
				UI:ShowProfile( launchData.uid, "ATLAS", true, launchData.restoreData, launchData.profileLaunchData )
				bHandled = true
			else
				sys.log( "UI.ItemCraftSingleWnd_new:ApplyLaunchContext()[ERROR]: invalid type of launchData.uid for bAtlas data mode; \"userdata\" expected, got \"%s\"", type( launchData.uid ) )
			end

		else
			sys.log( "UI.ItemCraftSingleWnd:ApplyLaunchContext()[ERROR]: unhandled type of launch data" )
		end

	end

	if not bHandled then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	end

end


--
function UI.ItemCraftSingleWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.ItemCraftSingleWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )

end


--
function UI.ItemCraftSingleWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )

end


--
function UI.ItemCraftSingleWnd:IsWaiting()

	return
		UI:IsWaitingRequests()
		or self.requestId_buyInventory ~= 0
		or self.requestId_learnBlueprint ~= 0
		or self.requestId_buy ~= 0
		or self.requestId_craft ~= 0
		or self.bWaitingLearnedBlueprints
		or self.requestId_craftUpgradeItem ~= 0
		or self.bWaitingInventory
		or self.requestId_changeMunition ~= 0
		or self.requestId_changeEquipment ~= 0

end


--
function UI.ItemCraftSingleWnd:LaunchBuyWnd( mode, data )

	UI.ItemCraftSingle_BuyWnd:Setup( mode, true, data, true )
	UI.ItemCraftSingle_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftSingleWnd:LaunchCraftWnd( blueprintDefName, bEnchanted, count )

	UI.ItemCraftSingle_CraftConfirmWnd:Setup( blueprintDefName, bEnchanted, count )
	UI.ItemCraftSingle_CraftConfirmWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftSingleWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.ItemCraftSingleWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	UI.ItemCraftSingle_BuyWnd:UnlinkFromParent()
	UI.ItemCraftSingle_TradeWnd:UnlinkFromParent()
	UI.ItemCraftSingle_CraftConfirmWnd:UnlinkFromParent()
	self:HideTradingAdvertsWnd()

end


--
function UI.ItemCraftSingleWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	local itemDefName		= ""
	local bEnchanted		= false
	local launchData		= nil
	local prevItems			= {}
	local dataToRestore		= nil

	if self:IsOnScreen() then

		itemDefName	= self.itemDefName
		bEnchanted	= self.bEnchanted
		launchData	= self.launchData
		prevItems	= self.prevItems		

		dataToRestore =
		{
			craftCount	= self.workWnd:GetCraftCount(),
		}

	end	

	UI.store.ItemCraftSingleWnd =
	{
		itemDefName					= itemDefName,
		blueprintDefName			= blueprintDefName,
		bEnchanted					= bEnchanted,
		launchData					= launchData,
		prevItems					= prevItems,
		dataToRestore				= dataToRestore,
		requestId_buyInventory		= self.requestId_buyInventory,
		requestId_learnBlueprint	= self.requestId_learnBlueprint,
		requestId_buy				= self.requestId_buy,
        requestId_craft				= self.requestId_craft,
        bWaitingLearnedBlueprints	= self.bWaitingLearnedBlueprints,
		requestId_craftUpgradeItem	= self.requestId_craftUpgradeItem,
		bToCloseAfterEquip			= self.bToCloseAfterEquip,
		bWaitingInventory			= self.bWaitingInventory,
		itemToEquipInfo				= self.itemToEquipInfo,
		requestId_changeMunition	= self.requestId_changeMunition,
		requestId_changeEquipment	= self.requestId_changeEquipment,
	}

end


--
function UI.ItemCraftSingleWnd:F_OnEventRestoreUiState()

	if UI.store.ItemCraftSingleWnd then

		self.requestId_buyInventory		= UI.store.ItemCraftSingleWnd.requestId_buyInventory
		self.requestId_learnBlueprint	= UI.store.ItemCraftSingleWnd.requestId_learnBlueprint
		self.requestId_buy				= UI.store.ItemCraftSingleWnd.requestId_buy
        self.requestId_craft			= UI.store.ItemCraftSingleWnd.requestId_craft
        self.bWaitingLearnedBlueprints	= UI.store.ItemCraftSingleWnd.bWaitingLearnedBlueprints
		self.requestId_craftUpgradeItem	= UI.store.ItemCraftSingleWnd.requestId_craftUpgradeItem
		self.bToCloseAfterEquip			= UI.store.ItemCraftSingleWnd.bToCloseAfterEquip
		self.bWaitingInventory			= UI.store.ItemCraftSingleWnd.bWaitingInventory
		self.itemToEquipInfo			= UI.store.ItemCraftSingleWnd.itemToEquipInfo
		self.requestId_changeMunition	= UI.store.ItemCraftSingleWnd.requestId_changeMunition
		self.requestId_changeEquipment	= UI.store.ItemCraftSingleWnd.requestId_changeEquipment

		if UI.store.ItemCraftSingleWnd.itemDefName ~= "" then
			self.dataToRestore = UI.store.ItemCraftSingleWnd.dataToRestore
	    	self:Setup( UI.store.ItemCraftSingleWnd.itemDefName, UI.store.ItemCraftSingleWnd.blueprintDefName, UI.store.ItemCraftSingleWnd.bEnchanted, UI.store.ItemCraftSingleWnd.launchData, nil, { prevItems = UI.store.ItemCraftSingleWnd.prevItems } )
		end

		UI.store.ItemCraftSingleWnd = nil

	end
	
end


--
function UI.ItemCraftSingleWnd:BuyInventory()

	self.requestId_buyInventory = _G.GameStore_BuyInventoryExtension()

	if self.requestId_buyInventory ~= 0 then
		UI:PlayGlobalSound( self.sounds.buyInventory )
	else
		self.blueprintToCraftData = nil
		self.itemToBuy = nil
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitEffect()

end


--
function UI.ItemCraftSingleWnd:F_OnEventStopWaitingRequests()

	self.bWaitingLearnedBlueprints = false

	if self:IsOnScreen() then
		self:UpdateWaitEffect()
	end

end


--
function UI.ItemCraftSingleWnd:F_OnEventStartWaitingRequests()

	if self:IsOnScreen() then
		self:UpdateWaitEffect()
	end

end


--
function UI.ItemCraftSingleWnd:TryLearnBlueprint( defName )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftSingleWnd:TryLearnBlueprint()[ERROR]: is waiting another request" )
		return
	end

	if type( defName ) ~= "string" or defName == "" then
		sys.log( "UI.ItemCraftSingleWnd:TryLearnBlueprint()[ERROR]: invalid defName" )
		return	
	end

	if UI:IsBluePrintLearned( defName ) then
		sys.log( "UI.ItemCraftSingleWnd:TryLearnBlueprint()[ERROR]: already learned" )
		return	
	end

	if not UI:CanLearnBluePrint( defName ) then
		sys.log( "UI.ItemCraftSingleWnd:TryLearnBlueprint()[ERROR]: cannot learn" )
		return	
	end

	local bHasBlueprint = UI:GetPlayerResourceCount( defName ) > 0

	if bHasBlueprint then
		self:DoLearnBlueprint( defName )
	else
		self:LaunchTradeWnd( defName )
	end

end


--
function UI.ItemCraftSingleWnd:DoLearnBlueprint( defName )

	self.requestId_learnBlueprint = _G.MasterServer_LearnBlueprint( defName )

	if self.requestId_learnBlueprint ~= 0 then

		UI:AddWaitingRequest( self.requestId_learnBlueprint )
		UI:PlayGlobalSound( self.sounds.learnBlueprint )

	else
		UI:ShowMsgOnLearnBlueprintError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitEffect()

end


--
function UI.ItemCraftSingleWnd:LaunchTradeWnd( defName )

	local shopItem = UI:GetShopItemByDef( defName )
	if not shopItem then
		sys.log( "UI.ItemCraftSingleWnd:LaunchTradeWnd()[ERROR]: cannot find shop item" )
		return
	end

	UI.ItemCraftSingle_TradeWnd:SetupForBuy( shopItem, nil, nil )
	UI.ItemCraftSingle_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftSingleWnd:F_OnEventInvItemsChanged()

	if self:IsOnScreen() then
		self:FullUpdate( true )
	end

	if self.bToCloseAfterEquip then

		self.bToCloseAfterEquip = false

		if self:IsOnScreen() then
			self:ReturnToPrevWindow( true )
		end

	end

	if self.itemToEquipInfo then
		self:EquipItem( self.itemToEquipInfo )
		self.itemToEquipInfo = nil
	end

end


--
function UI.ItemCraftSingleWnd:TryCraft( blueprintDefName, bEnchanted, craftCount )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftSingleWnd:TryCraft()[ERROR]: is waiting for another request" )
		return
	end

	if blueprintDefName == "" then
		sys.log( "UI.ItemCraftSingleWnd:TryCraft()[ERROR]: invalid blueprintDefName" )
		return
	end

	if craftCount <= 0 then
		sys.log( "UI.ItemCraftSingleWnd:TryCraft()[ERROR]: invalid craftCount" )
		return
	end

	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( blueprintDefName )

	local itemsInventorySize	= UI:GetNeedInventorySizeForItem( craftResultDefName, craftResultCount * craftCount )
	local usedInventorySize		= UI:GetInventoryCurSize()
	local inventoryCapacity		= UI:GetInventoryMaxSizeForCurLevel()

	local bEnoughInventorySize = ( usedInventorySize + itemsInventorySize ) <= inventoryCapacity	
    if bEnoughInventorySize then

		self:LaunchCraftWnd( blueprintDefName, bEnchanted, craftCount )

	else

		if UI:CanIncreaseInventory() then

    		local curInventoryLevel = UI:GetInventoryCurLevel()

    	   	local inventoryLevelsToBuy = {}

           	for levelToBuy = curInventoryLevel + 1, UI:GetInventoryMaxLevel() do

           		table.insert( inventoryLevelsToBuy, levelToBuy )

           		local newInventoryCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
           		if ( usedInventorySize + itemsInventorySize ) <= newInventoryCapacity then
           			break
           		end

           	end		

    		self.blueprintToCraftData = { defName = blueprintDefName, bEnchanted = bEnchanted, count = craftCount }
    		self:LaunchBuyWnd( UI.BuyWnd.modes.INVENTORY_AUTO, { inventoryLevels = inventoryLevelsToBuy } )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end


--
function UI.ItemCraftSingleWnd:DoCraft( blueprintDefName, bEnchanted, count )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftSingleWnd:DoCraft()[ERROR]: still waiting for another request" )
		return
	end

	if blueprintDefName == self.blueprintDefName and self.iidToUpgrade ~= UI.INVALID_U64_ID then

		self.requestId_craftUpgradeItem = _G.GameStore_CraftUpgradeItem( blueprintDefName, self.iidToUpgrade )

    	if self.requestId_craftUpgradeItem ~= 0 then

    		UI:AddWaitingRequest( self.requestId_craftUpgradeItem )
    		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
			self.bWaitingInventory = true

    		UI:PlayGlobalSound( self.sounds.craft )

			self.bToCloseAfterEquip = true

    	else
    		UI:ShowMsgOnItemCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
    	end

	else

    	self.requestId_craft = _G.MasterServer_UseCraftResource( blueprintDefName, count )

    	if self.requestId_craft ~= 0 then

    		UI:AddWaitingRequest( self.requestId_craft )
    		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
			self.bWaitingInventory = true

    		UI:PlayGlobalSound( self.sounds.craft )

			if blueprintDefName == self.blueprintDefName and self.vidToEquip ~= UI.INVALID_U64_ID then

				local itemDefName = UI:GetResourceCraftResult( blueprintDefName )
				if itemDefName ~= "" then				

            		self.itemToEquipInfo =
    				{
						defName		= itemDefName,
						bEnchanted	= bEnchanted,
						vid			= self.vidToEquip,
						slotId		= self.slotIdToEquip,
    				}

				else
					sys.log( "UI.ItemCraftSingleWnd:DoCraft()[ERROR]: cannot find craft result item def name for blueprint %s", blueprintDefName )
				end

			end

    	else
    		UI:ShowMsgOnItemCraftError( _G.GameStore.StoreBuyResult.SBR_ERROR )
    	end			

	end

end


--
function UI.ItemCraftSingleWnd:EquipItem( itemToEquipInfo )

	local bHasInInventory	= false
	local iid				= UI.INVALID_U64_ID

	local inventoryItems = UI:GetInventoryItemsByDef( itemToEquipInfo.defName )
	for idx, item in pairs( inventoryItems ) do

		if UI:IsInventoryItemEnchanted( item ) == itemToEquipInfo.bEnchanted and item.amount > 0 then

			if UI:IsDefModule( item.defName ) then
				if UI:GetEquippedShipItem( item.iid ) == nil then
					bHasInInventory = true
					iid = item.iid
				end
			else
				bHasInInventory = true
			end

			if bHasInInventory then			
				break
			end

		end

	end

	if not bHasInInventory then
		sys.log( "UI.ItemCraftSingleWnd:EquipItem()[ERROR]: cannot find item in inventory" )
		return
	end	


	if UI:IsDefAmmo( itemToEquipInfo.defName ) then
    	
    	local priceType = UI:GetShopSmartBuyPriceOneByDef( itemToEquipInfo.defName )

		-- TODO: уточнить, что будет, если передать невалидную цену
		self.requestId_changeMunition, bForbidden = UI:SafeChangeMunition( itemToEquipInfo.vid, itemToEquipInfo.slotId, priceType, itemToEquipInfo.defName )

		if self.requestId_changeMunition ~= 0 then

			UI:AddWaitingRequest( self.requestId_changeMunition )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
			self.bWaitingInventory = true

			self.bToCloseAfterEquip = true

		elseif not bForbidden then
			UI:ShowMessageOnChangeMunitionError( _G.GameStore.MunitionResult.MR_ERROR )
		end

	elseif UI:IsDefModule( itemToEquipInfo.defName ) then

		self.requestId_changeEquipment, bForbidden = UI:SafeChangeEquipment( itemToEquipInfo.vid, itemToEquipInfo.slotId, iid )

		if self.requestId_changeEquipment ~= 0 then

			UI:AddWaitingRequest( self.requestId_changeEquipment )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
			self.bWaitingInventory = true

			self.bToCloseAfterEquip = true

        	if itemToEquipInfo.slotId == ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 then
        		self:CheckShowMsgOnUnequipPrimaryAmmo( UI:GetShipItem( itemToEquipInfo.vid ), UI:GetWeaponClass( itemToEquipInfo.defName ) )
			end

		elseif not bForbidden then
			UI:ShowMessageOnEquipError( _G.GameStore.ModuleEquipResult.MER_ERROR )
		end

	else
		sys.log( "UI.ItemCraftSingleWnd:EquipItem()[ERROR]: unhandled item type (def \"%s\")", itemToEquipInfo.defName )
	end

end


--
function UI.ItemCraftSingleWnd:CheckShowMsgOnUnequipPrimaryAmmo( shipItem, dstWeaponClass )

	local bHasPrimaryAmmo = false

	local primaryAmmoInfo = shipItem.equipAmmo[ ai.MunitionBayType.MBT_PRIMARY ]
	if primaryAmmoInfo and primaryAmmoInfo.def ~= "" and primaryAmmoInfo.amount > 0 then
		bHasPrimaryAmmo = true
	end

	if not bHasPrimaryAmmo then
		return
	end

	local ammoWeaponClass = UI:GetWeaponClass( primaryAmmoInfo.def )
	if ammoWeaponClass == dstWeaponClass then
		return
	end

   	UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_unfitModsDrop" ), UI.MBS_OK )

end


--
function UI.ItemCraftSingleWnd:OnAccountAurasChanged()

	self:UpdatePrice()
	self:UpdateActionBtn()

end


--
function UI.ItemCraftSingleWnd:LaunchBundlesWnd( bundleDefName, data )

	UI.BuyBundleWnd:Setup( bundleDefName, data, nil, false )
	UI.BuyBundleWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftSingleWnd:LaunchTradingAdvertsWnd( defName )

	UI.Trading_AdvertsWnd:Setup( defName, self:GetName() )
	UI.Trading_AdvertsWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ItemCraftSingleWnd:HideTradingAdvertsWnd()

	if UI.Trading_AdvertsWnd:IsOnScreen() and UI.Trading_AdvertsWnd:GetMainWndName() == self:GetName() then
		UI.Trading_AdvertsWnd:Hide()		
	end

end


--
function UI.ItemCraftSingleWnd:TryBuyItem( defName )

	if self:IsWaiting() then
		sys.log( "UI.ItemCraftSingleWnd:TryBuyItem()[ERROR]: is waiting another request" )
		return
	end

	if type( defName ) ~= "string" or defName == "" then
		sys.log( "UI.ItemCraftSingleWnd:TryLearnBlueprint()[ERROR]: invalid defName" )
		return	
	end
	
	if UI:IsEnoughPlaceInInventoryForItem( defName ) then
		self:LaunchTradeWnd( defName )
	else
		if UI:CanIncreaseInventory() then
			self.itemToBuy = defName
			self:LaunchBuyWnd( UI.Shop_BuyWnd.modes.INVENTORY_AUTO )
		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end
	end

end

-- ------------------------------------------------------------------------
-- UI.ItemCraftSingle_WorkWnd
-- ------------------------------------------------------------------------

UI.ItemCraftSingle_WorkWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemCraft_WorkWnd",

		props =
		{
			name	= "ItemCraftSingle_WorkWnd",
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.ItemCraftSingle_ActionBtn
-- ------------------------------------------------------------------------

UI.ItemCraftSingle_ActionBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ItemCraftSingle_ActionBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn3",

	props =
	{
		name		= "ItemCraftSingle_ActionBtn",
	}
}

-- ------------------------------
-- interface funcitons
-- ------------------------------

--
function UI.ItemCraftSingle_ActionBtn:Reset()

	self:SetBtnText( "" )
	self:Enable( false )

end


-- ------------------------------------------------------------------------
-- UI.ItemCraftSingle_TradingBtn
-- ------------------------------------------------------------------------

UI.ItemCraftSingle_TradingBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn17",

    	props =
    	{
    		name		= "ItemCraftSingle_TradingBtn",
    	}
    },

	textId = "itemCraft_tradingBtn"
}


-- ------------------------------------------------------------------------
-- UI.ItemCraftSingle_TransferToZoneBtn
-- ------------------------------------------------------------------------

UI.ItemCraftSingle_TransferToZoneBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn19",

		props =
		{
			name		= "ItemCraftSingle_TransferToZoneBtn",
		}
	},
	
	textId = "hangar_undock_btn_text"
}

-- ------------------------------------------------------------------------
-- UI.ItemCraftSingle_CrossBtn
-- ------------------------------------------------------------------------

UI.ItemCraftSingle_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "ItemCraftSingle_CrossBtn"
		}
	}
}

-- -------------------------------------------------------------------
-- UI.ItemCraftSingle_BuyWnd
-- -------------------------------------------------------------------

UI.ItemCraftSingle_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "ItemCraftSingle_BuyWnd",
    	},
	},

	mainWndName = "ItemCraftSingleWnd",
}

-- -------------------------------------------------------------------
-- UI.ItemCraftSingle_TradeWnd
-- -------------------------------------------------------------------

UI.ItemCraftSingle_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "ItemCraftSingle_TradeWnd",
    	},
	},

	mainWndName = "ItemCraftSingleWnd",
}

-- ------------------------------------------------------------------------
-- UI.ItemCraftSingle_CraftConfirmWnd
-- ------------------------------------------------------------------------

UI.ItemCraftSingle_CraftConfirmWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ItemCraft_CraftConfirmWnd",

		props =
		{
			name	= "ItemCraftSingle_CraftConfirmWnd"
		}
	},

	mainWndName = "ItemCraftSingleWnd",
}