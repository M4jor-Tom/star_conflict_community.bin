-- -------------------------------------------------------------------
-- UI.TradingWnd
-- -------------------------------------------------------------------

UI.TradingWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.TradingWnd.layers =
{
    MAIN_EFFECT			= 0,
    CAPTION				= 1,
	NO_ITEMS			= 2,
    INFO				= 3,
	NAME_FILTER_LABEL	= 4,
    WAIT_EFFECT			= 5, 
    WAIT_TEXT			= 6,
}

--
UI.TradingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "TradingWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		activationOrder	= 0,
	},

	layers =
	{
		firstOverlayLayer = UI.TradingWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "trading_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.TradingWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title6",
						layer		= "UI.TradingWnd.layers.NO_ITEMS",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "note",
						layer		= "UI.TradingWnd.layers.INFO",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load_modules",
						layer		= "UI.TradingWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title11",
						layer		= "UI.TradingWnd.layers.NAME_FILTER_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
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
			text			= UI:GetStringByName( "tradingItems_caption" ),
		}, 

		-- NO_ITEMS
		{ 
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tradingItems_noItems" ),
		}, 

		-- INFO
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},

		-- NAME_FILTER_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tradingItems_nameFilter" )
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
						layer		= "UI.TradingWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hangar_loading" ),
		},
	},
	
	children =
	{
		"UI.Trading_ItemsListWnd",
		"UI.Trading_MyAdvertsListWnd",
		"UI.Trading_MyAdvertDDIco",
		"UI.Trading_InventoryItemsFilterCheckBox",
		"UI.Trading_NameFilterEditWnd",
		"UI.Trading_InfoTooltipAreaWnd",
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.TradingWnd:Setup( mode, mainWndName, chosenItems )

	self:Reset()
	
	if type( mode ) ~= "number" then
		sys.log( "UI.TradingWnd:Setup()[ERROR]: incvalid type of the 1-st parameter ('mode'); 'string' expected, got '%s'", type( mode ) )
		return
	end
	
	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.TradingWnd:Setup()[ERROR]: invalid mode %d", mode )
		return
	end
	
	if mainWndName ~= nil then
		if type( mainWndName ) ~= "string" then
			sys.log( "UI.TradingWnd:Setup()[ERROR]: incvalid type of the 2-nd parameter ('mainWndName'); 'string' or 'nil' expected, got '%s'", type( mainWndName ) )
			mainWndName = nil
		end
	end
	
	if mainWndName == nil then
		mainWndName = ""
	end

	if chosenItems ~= nil then

		local bValid = true

		if type( chosenItems ) == "table" then
			for defName, count in pairs( chosenItems ) do
				if type( defName ) ~= "string" or type( count ) ~= "number" then
					sys.log( "UI.TradingWnd:Setup()[ERROR]: invalid format of table \"chosenItems\"; <string>=<number> expected, got <%s>=<%s>", type( defName ), type( count ) )
					bValid = false
				end
			end
		else
			sys.log( "UI.TradingWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"chosenItems\"); \"table\" or \"nil\" expected, got \"%s\"", type( chosenItems ) )
			bValid = false
		end

		if not bValid then
			chosenItems = nil
		end

	end

	self.mode			= mode
	self.mainWndName	= mainWndName
	self.chosenItems	= chosenItems or {}

	if self:IsOnScreen() then

		self:UpdateMyAdverts()
		self:TryRequestAdvertHeaders()

		self:UpdateContent()

	end
	
	self:PlaceOnScreen()
	
	self.bInited = true

end


--
function UI.TradingWnd:GetMode()

	return self.mode
	
end


--
function UI.TradingWnd:GetMainWndName()

	return self.mainWndName

end


--
function UI.TradingWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.TradingWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.TradingWnd:ShowItem( defName )

	if not( self.bInited ) then
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: not inited" )
		return
	end
	
	if not self:IsOnScreen() then
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: not on screen" )
		return
	end
	
	if type( defName ) ~= "string" then
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: invalid type of the 1-st parameter ('defName'); 'string' expected, got '%s'", type( defName ) )
		return
	end
	
	local mainCategory, subCategory = UI:GetItemShopCategory( defName )

	if mainCategory == "" then
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: invalid category for item %s", defName )
		return
	end

	self.bLockItemsUpdate = true
	
		self.categoriesList:SelectMainCategory( mainCategory, false, false )
		self.categoriesList:SelectSubCategory( subCategory, mainCategory, false )
		
		self.inventoryItemsFilterCheckBox:Check( false )
		
		local localizedName = UI:GetEntityLocalizedNameByDef( defName, false, nil, nil, false, false )
		self.nameFilterEditWnd:SetEditText( localizedName )
	
	self.bLockItemsUpdate = false
	
	self:UpdateItems()

	for recordIdx = 1, self.itemsList:GetNumRecords() do
		local data = self.itemsList:GetRecordData( recordIdx )
		if data.defName == defName then
			itemRecordIdx = recordIdx
			break
		end
	end

	if itemRecordIdx ~= -1 then
		self.itemsList:SetScrollPos( itemRecordIdx )
	else
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: cannot find record for item %s", defName )
	end

end


-- TODO: убрать? устаревший вариант - не устанавливает имя в фильтр
function UI.TradingWnd:ShowItem2( defName )

	if not( self.bInited ) then
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: not inited" )
		return
	end
	
	if type( defName ) ~= "string" then
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: invalid type of the 1-st parameter ('defName'); 'string' expected, got '%s'", type( defName ) )
		return
	end

	local itemRecordIdx = -1

	for recordIdx = 1, self.itemsList:GetNumRecords() do
		local data = self.itemsList:GetRecordData( recordIdx )
		if data.defName == defName then
			itemRecordIdx = recordIdx
			break
		end
	end

	if itemRecordIdx ~= -1 then
		self.itemsList:SetScrollPos( itemRecordIdx )
		return
	end

	local mainCategory, subCategory = UI:GetItemShopCategory( defName )

	if mainCategory == "" or subCategory == "" then
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: invalid category for item %s", defName )
		return
	end

	self.bLockItemsUpdate = true
	self.categoriesList:SelectMainCategory( mainCategory, false, false )
	if subCategory ~= "" then
		self.categoriesList:SelectSubCategory( subCategory, mainCategory, false )
	end
	self.bLockItemsUpdate = false
	self:OnSelCategoryChanged()

	for recordIdx = 1, self.itemsList:GetNumRecords() do
		local data = self.itemsList:GetRecordData( recordIdx )
		if data.defName == defName then
			itemRecordIdx = recordIdx
			break
		end
	end

	if itemRecordIdx ~= -1 then
		self.itemsList:SetScrollPos( itemRecordIdx )
	else
		sys.log( "UI.TradingWnd:ShowItem()[ERROR]: cannot find record for item %s", defName )
	end

end


--
function UI.TradingWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	self.createAdvertWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	self:UpdateMyAdverts()

	self.reloadTimer = -1
	self:TryRequestAdvertHeaders()
	
	-- апдейт списка происходит в F_OnEventInvItemsChanged()

end


--
function UI.TradingWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.AdvertResult.AR_OK then

		if self:IsOnScreen() then

			self:UpdateMyAdverts()

			self.reloadTimer = -1
			self:TryRequestAdvertHeaders()
			
			-- апдейт списка происходит в F_OnEventInvItemsChanged()

		end

	else

		if requestId == self.advertDeleteRequestId then
			self:ShowMsgOnAdvertDeleteError( result )
		end

	end

	if requestId == self.advertDeleteRequestId then
		self.advertDeleteRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.TradingWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	self:UpdateMyAdverts()

	self.reloadTimer = -1
	self:TryRequestAdvertHeaders()
	
	-- апдейт списка происходит в F_OnEventInvItemsChanged()

end


--
function UI.TradingWnd:MasterServer_OnAdvertHeaderGetData( data )

	if self:IsOnScreen() then
		self:SetAdvertHeaders( data )
	end

	self.advertHeaderGetRequestId = 0	-- hack: т.к. идентификатор реквеста не передается, то просто считаю, что это был ответ именно на ожидаемый запрос
	self:UpdateWaitingEffect()

end


--
function UI.TradingWnd:MasterServer_OnAdvertGetData( data )

	if self:IsOnScreen() then

		self.reloadTimer = -1
		self:TryRequestAdvertHeaders()

	end

end


--
function UI.TradingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.createAdvertWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.advertHeaderGetRequestId	= 0
	self.advertDeleteRequestId		= 0

	self:UpdateWaitingEffect()

end


--
function UI.TradingWnd:OnEditMissMouse( editWnd )

	if UI:GetKeyboardFocus() == editWnd:GetUiHandle() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end
	
end


--
function UI.TradingWnd:F_OnEventInvItemsChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdateItems( true )
	
end


--
function UI.TradingWnd:MasterServer_OnTradeMoneyChanged( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	self:UpdateInfo()
	
end


-- ----------------------------
-- const
-- ----------------------------

UI.TradingWnd.modes =
{
	MAIL	= 1,
	CHAT	= 2,
	COMMON	= 3,
}

UI.TradingWnd.effectInfo =
{
	main =
	{
    	categoriesListLocator				= "tree",
    	itemsListLocator					= "product_list",
    	crossBtnLocator						= "btn_x",
		reloadBtnLocator					= "reload",
		myAdvertsListLocator				= "icon_7",
		inventoryItemsFilterCheckBoxLocator	= "chek_box",
		nameFilterEditWndLocator			= "filtr_input",
	},
}

UI.TradingWnd.sounds =
{
	choose			= UI.sounds.btnClick,
	cancel			= UI.sounds.btnClick,
	advertsWndShow	= "sound/ui/btnClick",
	deleteAdvert	= UI.sounds.btnClick,
	ddStart			= "",
	ddStop			= "",
	itemShow		= UI.sounds.btnClick,
}

UI.TradingWnd.chat_space			= 10
UI.TradingWnd.RELOAD_DELAY			= 5
UI.TradingWnd.DD_MOUSE_THRESHOLD	= 5	-- в пределах смещения мыши на это расстояние drag_and_drop не начинается

UI.TradingWnd.ddStates =
{
	NONE		= 1,
	WAIT_MOUSE	= 2,
	DRAG		= 3,
}

UI.TradingWnd.DEFAULT_FILTER_INVENTORY_ITEMS	= false
UI.TradingWnd.NAME_FILTER_DELAY					= 0.5

-- ----------------------------
-- vars
-- ----------------------------

UI.TradingWnd.mode							= -1
UI.TradingWnd.mainWndName					= ""
UI.TradingWnd.chosenItems					= {}

UI.TradingWnd.categoriesList				= nil
UI.TradingWnd.itemsList						= nil
UI.TradingWnd.crossBtn						= nil
UI.TradingWnd.reloadBtn						= nil
UI.TradingWnd.createAdvertWnd				= nil
UI.TradingWnd.myAdvertsList					= nil
UI.TradingWnd.inventoryItemsFilterCheckBox	= nil
UI.TradingWnd.nameFilterEditWnd				= nil

UI.TradingWnd.bInited						= false
UI.TradingWnd.bLockItemsUpdate				= false
UI.TradingWnd.advertHeaders					= {}
UI.TradingWnd.advertHeadersByDef			= {}
UI.TradingWnd.bWantReload					= false
UI.TradingWnd.reloadTimer					= -1
UI.TradingWnd.advertHeaderGetRequestId		= 0
UI.TradingWnd.hMsgDeleteAdvert				= UI.INVALID_UI_HANDLE
UI.TradingWnd.advertIdToDelete				= nil
UI.TradingWnd.advertDeleteRequestId			= 0
UI.TradingWnd.ddInfo =
{
	ddState			= UI.TradingWnd.ddStates.NONE,
	myAdvertSlot	= nil,
	mouseX_abs		= 0,
	mouseY_abs		= 0,
}
UI.TradingWnd.ddIco							= nil
UI.TradingWnd.ddMouseThreshold_abs			= 0
UI.TradingWnd.ddAcceptItemSlot				= nil
UI.TradingWnd.myAdvertSlotUnderLastMouseDown= nil
UI.TradingWnd.nameFilterTimer				= -1
UI.TradingWnd.infoMetaText					= nil
UI.TradingWnd.infoTooltipAreaWnd			= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.TradingWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.chosenItems = {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	
	self.ddIco:UnlinkFromParent()

	self:UpdateWaitingEffect()
	
	self.infoMetaText = UI.MetaText.GetNewInstance()
	self.infoMetaText:InitFromLayer( self, self.layers.INFO )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_KEY_TIP )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_ACTIVATE_RECORD )

end


--
function UI.TradingWnd:F_Shutdown()

	if self.infoMetaText then
		self.infoMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.TradingWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.TradingWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.TradingWnd:UpdateMetaTextPos()

	self.infoMetaText:UpdateScreenOrgFromLayer( self, self.layers.INFO )

end


--
function UI.TradingWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.INFO then
		self.infoMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.TradingWnd:CreateControls()

	self.categoriesList					= UI:CreateChildWnd( self, UI.StoreCategoriesListWnd, "" )
	self.itemsList						= UI.Trading_ItemsListWnd
	self.crossBtn						= UI:CreateChildWnd( self, UI.CrossBtn, "" )
	self.reloadBtn						= UI:CreateChildWnd( self, UI.Trading_ReloadBtn, "" )
	self.createAdvertWnd				= UI.Trading_CreateAdvertWnd
	self.myAdvertsList					= UI.Trading_MyAdvertsListWnd
	self.ddIco							= UI.Trading_MyAdvertDDIco
	self.inventoryItemsFilterCheckBox	= UI.Trading_InventoryItemsFilterCheckBox
	self.nameFilterEditWnd				= UI.Trading_NameFilterEditWnd
	self.infoTooltipAreaWnd				= UI.Trading_InfoTooltipAreaWnd

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.categoriesList, mainEffect, self.effectInfo.main.categoriesListLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.itemsList, mainEffect, self.effectInfo.main.itemsListLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.crossBtn, mainEffect, self.effectInfo.main.crossBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.reloadBtn, mainEffect, self.effectInfo.main.reloadBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.myAdvertsList, mainEffect, self.effectInfo.main.myAdvertsListLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.inventoryItemsFilterCheckBox, mainEffect, self.effectInfo.main.inventoryItemsFilterCheckBoxLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.nameFilterEditWnd, mainEffect, self.effectInfo.main.nameFilterEditWndLocator, UI.EffectAnimParams.POS )
	
	self:MoveChildToLastPosition( self.infoTooltipAreaWnd )

end


--
function UI.TradingWnd:Reset()

	self.bInited			= false
	
	self.mode				= -1
	self.mainWndName		= ""
	self.chosenItems		= {}
	
	self.advertHeaders		= {}
	self.advertHeadersByDef	= {}
	self.bWantReload		= false
	self.reloadTimer		= -1
	self.nameFilterTimer	= -1

	self:ResetContent()

	self:HideChildModals()

end


--
function UI.TradingWnd:ResetContent()

	if UI:IsInRemovingAllWindows() then
		return
	end

	self.bLockItemsUpdate = true

	self.infoMetaText:SetText( "", true )
	self.infoTooltipAreaWnd:SetTooltipData( nil )
	self.categoriesList:Reset()
	self.itemsList:Clear()
	self:SetLayerVisible( true, self.layers.NO_ITEMS )
	self.reloadBtn:UnlinkFromParent()
	self.myAdvertsList:Clear()
	self:ResetDD()
	self.myAdvertSlotUnderLastMouseDown = nil
	self.inventoryItemsFilterCheckBox:Check( false )
	self.nameFilterEditWnd:SetEditText( "" )

	self.bLockItemsUpdate = false

end


--
function UI.TradingWnd:UpdateContent()

	self:ResetContent()

	self.bLockItemsUpdate = true
	self:RestoreInventoryItemsFilter()
	self:UpdateCategories()
	self:ValidateSelCategory()
	self.bLockItemsUpdate = false

	self:UpdateItems()
	self:UpdateInfo()
	self:UpdateReloadBtn()
	self:UpdateMyAdvertsList()

end


--
function UI.TradingWnd:UpdateCategories()

	self.categoriesList:Reset()

	if type( _G.StoreInfo ) ~= "table" then
		sys.log( "UI.TradingWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo\"; \"table\" expected, got \"%s\"", type( _G.StoreInfo ) )
		return
	end

	local categories = _G.StoreInfo.categories
	if type( categories ) ~= "table" then
		sys.log( "UI.TradingWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories\"; \"table\" expected, got \"%s\"", type( categories ) )
		return
	end

	local usedCategoriesMap = {}

	local allItems = {}
	for idx, shopItem in pairs( UI.serverData.shop ) do
		if UI:IsItemTrading( shopItem.defName ) and ( UI:IsDefResource( shopItem.defName ) or UI:IsDefBlueprint( shopItem.defName ) ) then
			table.insert( allItems, shopItem.defName )
		end
	end

	for idx, defName in pairs( allItems ) do

		local mainCategory, subCategory = UI:GetItemShopCategory( defName )
		if mainCategory ~= "" then

			local mainCategoryInfo = usedCategoriesMap[ mainCategory ]
			if not mainCategoryInfo then
				mainCategoryInfo = {}
				usedCategoriesMap[ mainCategory ] = mainCategoryInfo
			end

			if subCategory ~= "" then
				mainCategoryInfo[ subCategory ] = true
			end

		end		

	end

	for categoryIdx, categoryInfo in ipairs( _G.StoreInfo.categories ) do

		-- главная категория

		if type( categoryInfo ) == "table" then

			local category = categoryInfo.name
			if type( category ) == "string" then

				local usedCategoryInfo = usedCategoriesMap[ category ]
				if usedCategoryInfo then

					-- добавление главной категории

            		local categoryData = {}

            		categoryData.categoryType		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
            		categoryData.categoryInfo		= categoryInfo

            		self.categoriesList:AddRecord( categoryData )


					-- подкатегории

					if categoryInfo.subCategories ~= nil then

    					if type( categoryInfo.subCategories ) == "table" then

    					    for subCategoryIdx, subCategoryInfo in ipairs( categoryInfo.subCategories ) do

    							if type( subCategoryInfo ) == "table" then

    								local subCategory = subCategoryInfo.name
    								if type( subCategory ) == "string" then

    									local usedSubCategoryInfo = usedCategoryInfo[ subCategory ]
    									if usedSubCategoryInfo then

    										-- добавление подкатегории

                                    		local subCategoryData = {}

                                    		subCategoryData.categoryType		= UI.StoreCategoriesListWnd.categoryTypes.SUB
                                    		subCategoryData.categoryInfo		= subCategoryInfo
    				        				subCategoryData.parentCategoryInfo	= categoryInfo

                                    		self.categoriesList:AddRecord( subCategoryData )

    									end

    								else
    									sys.log( "UI.TradingWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].subCategories[%d].name\"; \"string\" expected, got \"%s\"", categoryIdx, subCategoryIdx, type( subCategory ) )
    								end

    							else
    								sys.log( "UI.TradingWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].subCategories[%d]\"; \"table\" expected, got \"%s\"", categoryIdx, subCategoryIdx, type( subCategoryInfo ) )
    							end
    						end							

    					else
    						sys.log( "UI.TradingWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].subCategories\"; \"table\" or \"nil\" expected, got \"%s\"", categoryIdx, type( categoryInfo.subCategories ) )
    					end
					end

				end

			else
				sys.log( "UI.TradingWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d].name\"; \"string\" expected, got \"%s\"", categoryIdx, type( category ) )
			end
		else
			sys.log( "UI.TradingWnd:UpdateCategories()[ERROR]: invalid type of \"_G.StoreInfo.categories[%d]\"; \"table\" expected, got \"%s\"", categoryIdx, type( categoryInfo ) )
		end

	end	

	self.categoriesList:UpdateVisibleRecordsImmediate()

end


--
function UI.TradingWnd:UpdateItems( bRestoreSel )

	if self.bLockItemsUpdate then
		return
	end

	if bRestoreSel == nil then
		bRestoreSel = false
	end

	local scrollPos = self.itemsList:GetScrollPos()

	self.itemsList:Clear()

	local selMainCategory	= self.categoriesList:GetSelectedMainCategory()
	local selSubCategory	= self.categoriesList:GetSelectedSubCategory()

	local items = self:GetItems( selMainCategory, selSubCategory )

	local shopItemsSorted = {}	-- именно shopItem собираются, чтобы можно было отсортировать той же функций сортировки, которая используется в магазине и других местах
	for defName, count in pairs( items ) do
	
		local shopItem = UI.serverData.shopByDef[ defName ]
		if shopItem then
			table.insert( shopItemsSorted, shopItem )
		else
			sys.log( "UI.TradingWnd:UpdateItems()[ERROR]: cannot find shop item for resource \"%s\"", defName )
		end

	end

	UI:SortShop( shopItemsSorted, false, false )
	
	local function fnSortMyAdverts( myAdvert1, myAdvert2 )
		return myAdvert1.expTime < myAdvert2.expTime
	end	

	for idx, shopItem in ipairs( shopItemsSorted ) do
	
		local defName = shopItem.defName
		
		if items[ defName ] then
		
			local data =
			{
				defName			= defName,
				count			= items[ defName ],
				tradingMode		= self.mode,
				advertHeader	= self.advertHeadersByDef[ defName ],
			}
			
			data.myAdverts = UI:GetMyAdvertsByDef( defName )
			table.sort( data.myAdverts, fnSortMyAdverts )
			
			self.itemsList:AddRecord( data )
			
		end

	end

	self:SetLayerVisible( self.itemsList:GetNumRecords() == 0, self.layers.NO_ITEMS )

	if bRestoreSel then
		if scrollPos ~= -1 then
			self.itemsList:SetScrollPos( scrollPos )
		end
	end

	self.nameFilterTimer = -1

end


--
function UI.TradingWnd:GetItems( selMainCategory, selSubCategory )

	if selMainCategory == nil then
		selMainCategory = ""
	end

	if selSubCategory == nil then
		selSubCategory = ""
	end

	local bInventoryItemsFilter = self.inventoryItemsFilterCheckBox:IsChecked()
	local nameFilter			= _G.Utf8CaseFold_Transform( self.nameFilterEditWnd:GetEditText() )

	local items = {}

	for idx, shopItem in pairs( UI.serverData.shop ) do

		local defName = shopItem.defName
		local bFit = true

		if bFit then
    		if not UI:IsItemTrading( defName ) then
    			bFit = false
    		end
		end

		if bFit then
			if not UI:IsDefResource( defName ) and not UI:IsDefBlueprint( defName ) and not UI:IsDefModule( defName ) then
    			bFit = false
			end
		end

		if bFit then

			local itemMainCategory, itemSubCategory = UI:GetItemShopCategory( defName )

			if ( selMainCategory ~= "" and itemMainCategory ~= selMainCategory ) or ( selSubCategory ~= "" and itemSubCategory ~= selSubCategory ) then
				bFit = false
			end

		end
		
		if bFit then

			if nameFilter ~= "" then

				local itemName = UI:GetEntityLocalizedNameByDef( defName, false )
				local itemName_low = _G.Utf8CaseFold_Transform( itemName )

				if not string.find( itemName_low, nameFilter, 1, true ) then
					bFit = false
				end

			end

		end

		-- #0099553 при фильтрации количество включает в себя те предметы, которые выставлены на продажу (т.е. они показываются в списке), хотя там, где количество отображается текстом, они не включаются
		local count					= 0	-- количество в инвентаре (не экипированное), включая и те, что выставлены на продажу
		local countWithoutAdverted	= 0	-- количество в инвентаре (не экипированное), НЕ включая те, что выставлены на продажу

		if bFit then
		
			if UI:IsDefResource( defName ) or UI:IsDefBlueprint( defName ) then
			
				count					= UI:GetPlayerResourceCount( defName, true )
				countWithoutAdverted	= UI:GetPlayerResourceCount( defName, false )
				
			elseif UI:IsDefModule( defName ) then
			
				local countTotal, storageData = UI:GetItemCount( defName, true )
				local countTotal_withoutAdverted, storageData_withoutAdverted = UI:GetItemCount( defName, false )
				
				count					= storageData.inventory_total
				countWithoutAdverted	= storageData_withoutAdverted.inventory_total
				
			else
				sys.log( "UI.TradingWnd:GetItems()[ERROR]: unsupported item type for getting count (def %s)", defName )
			end
			
			local chosenCount		= self.chosenItems[ defName ] or 0
			count					= math.max( count - chosenCount, 0 )
			countWithoutAdverted	= math.max( countWithoutAdverted - chosenCount, 0 )
			
			-- #0109412(0510602)
			--Если галки нет - показываются или если есть объявления (все, и наши и не наши) или если предметы есть на складе.
			--Если галка есть - показываются только предметы которые есть на складе (или есть наше объявление).
			
			if bInventoryItemsFilter then
				if count == 0 then
					bFit = false
				end
			else
				if count == 0 and not self.advertHeadersByDef[ defName ] then
					bFit = false
				end
			end
			
		end
		
		if bFit then
			items[ defName ] = countWithoutAdverted
		end

	end

	return items

end


--
function UI.TradingWnd:UpdateInfo()

	local tradeMoney = _G.MasterServer_GetTradeMoney()	-- возвращает u64
	local tax = UI:GetTax( tradeMoney )
	
	local taxFixed = UI:Round( tax * 100 )

	local strInfo = string.format( "%s: %s$gold_big$|%s: %d%%", UI:GetStringByName( "trading_tradeMoney" ), _G.U64ToStr( tradeMoney ), UI:GetStringByName( "trading_curTax" ), taxFixed )	
	self.infoMetaText:SetText( strInfo, true )
	
	-- тултип
	
	local formatRect = self:GetLayerRect( self.layers.INFO )
	
	local textRect = _G.MeasureText(
		self.infoMetaText:GetFormattedText(),
		self:GetFont( self.layers.INFO ),
		formatRect,
		self:GetTextFormatFlags( self.layers.INFO ),
		formatRect )
		
	self.infoTooltipAreaWnd:SetRect( textRect )
	
	local tooltipData = {}
	tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	tooltipData.caption = UI:GetStringByName( "trading_taxTooltip_caption" )
	tooltipData.text = string.format( "%s||%s", UI:GetStringByName( "trading_taxTooltip_text" ), strInfo )
	
	self.infoTooltipAreaWnd:SetTooltipData( tooltipData )

end


--
function UI.TradingWnd:UpdateReloadBtn()

	local bNeedBtn = self.mode ~= self.modes.MAIL

	if bNeedBtn then
		self:AddChild( self.reloadBtn )
	else
		self.reloadBtn:UnlinkFromParent()
	end

end


--
function UI.TradingWnd:UpdateMyAdvertsList()

	self.myAdvertsList:Update()

end


--
function UI.TradingWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == self.categoriesList:GetUiHandle() then
		self:OnSelCategoryChanged()
	end	

end


--
function UI.TradingWnd:OnSelCategoryChanged()

	self:UpdateItems()

end


--
function UI.TradingWnd:OnInventoryItemsFilterChanged()

	self:UpdateItems()

end


--
function UI.TradingWnd:OnNameFilterChanged()

	self:UpdateItems()

end


--
function UI.TradingWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcAbsVals()

	if self.bInited then

    	self:UpdateMyAdverts()

    	self.advertHeaders		= {}
    	self.advertHeadersByDef	= {}
    	self.reloadTimer		= -1
    	self:TryRequestAdvertHeaders()

    	self:UpdateContent()

	end

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.TradingWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then

		if self.bInited then

			self:SaveInventoryItemsFilter()
			self:SaveSelCategory()

			Profile:Save()

		end

		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
		self:Reset()

	end	

end


--
function UI.TradingWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	-- если клик на элемент, не приндлежащий к данному окну, то скрыть

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	
	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )	

	if wndUnderMouse
		and wndUnderMouse ~= self
		and not wndUnderMouse:IsChildOf( self )
		and not( self.mode == self.modes.MAIL and ( UI:IsWndKindOf( wndUnderMouse, "MailCreate_TradingAttachmentSlotWnd" ) or UI:HasWndAncestorKindOf( wndUnderMouse, "MailCreate_TradingAttachmentSlotWnd" ) ) )
		and not( self.mode == self.modes.CHAT and ( wndUnderMouse == UI.ChatWnd or wndUnderMouse:IsChildOf( UI.ChatWnd ) ) )
		and not( wndUnderMouse == UI.PopUpMenuWnd or wndUnderMouse:IsChildOf( UI.PopUpMenuWnd ) )
		and not( wndUnderMouse == self.ddIco or wndUnderMouse:IsChildOf( self.ddIco ) ) then

		-- если есть вышележащее оверлэйное окно, то клик игнорируется (оверлэйные окна всегда являются чайлдами UI.Root)

		local bIsOverlayWnd = false

		local root = self
		local parent = self:GetParent()
		while parent and parent ~= UI.Root do
            root = parent
			parent = parent:GetParent()			
		end

		local nextSibling = root:GetNextSibling()
		while nextSibling do

			if UI:IsOverlayWnd( nextSibling ) then
				bIsOverlayWnd = true
				break
			end

			nextSibling = nextSibling:GetNextSibling()

		end

		if not bIsOverlayWnd then
			self:NotifyMainWnd( false )
			self:Close( false )
			return
		end

	end

	if self.mode == self.modes.MAIL then
    	if wndUnderMouse and ( UI:IsWndKindOf( wndUnderMouse, "Trading_MyAdvertSlotWnd" ) or UI:HasWndAncestorKindOf( wndUnderMouse, "Trading_MyAdvertSlotWnd" ) ) then
    		local myAdvertSlotWnd = UI:IsWndKindOf( wndUnderMouse, "Trading_MyAdvertSlotWnd" ) and wndUnderMouse or UI:GetAncestorKindOf( wndUnderMouse, "Trading_MyAdvertSlotWnd" )
    		if UI:IsPtInRect( myAdvertSlotWnd:GetMouseActiveRect(), mouseX, mouseY ) then
    			self.myAdvertSlotUnderLastMouseDown = myAdvertSlotWnd
    		end
    	end		
	end

end


--
function UI.TradingWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:ResetDD()

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if UI:IsWndKindOf( wnd, "StoreCategoriesSlotWnd" ) then

		if not self.categoriesList:IsAnimating() then
			self.categoriesList:SelectRecord( wnd:GetRecord(), not wnd:IsSelected(), true, true )
		end

	elseif UI:IsWndKindOf( wnd, "Trading_AttachItemBtn" ) then

		local itemSlotWnd = UI:GetAncestorKindOf( wnd, "Trading_ItemSlotWnd" )
		local data = itemSlotWnd:GetRecordData()

		self:NotifyMainWnd( true, data )
		UI:PlayGlobalSound( self.sounds.choose )

		if self.mode == self.modes.MAIL then
			self:Close( false )
		end

	elseif wnd == self.crossBtn then

		self:NotifyMainWnd( false )
		self:Close( true )

	elseif wnd == self.reloadBtn then

		if not self:IsWaiting() then
			self:TryRequestAdvertHeaders()
		end

	elseif UI:IsWndKindOf( wnd, "Trading_MyAdvertBtn" ) then

		if not self:IsWaiting() then

			local itemSlotWnd = UI:GetAncestorKindOf( wnd, "Trading_ItemSlotWnd" )
			if itemSlotWnd then
	
				local data = itemSlotWnd:GetRecordData()
				local bCanAdvert = true
				local iid = UI.INVALID_U64_ID
				
				if UI:IsDefModule( data.defName ) then
				
					iid = self:GetIidToCreateAdvert( data.defName )
					
					if iid == UI.INVALID_U64_ID then
						bCanAdvert = false
						sys.log( "UI.TradingWnd:F_OnMouseLButtonDown()[ERROR]: cannot advert item" )
					end
				end
				
				if bCanAdvert then
					self:LaunchCreateAdvertWnd( data.defName, iid )
				end
	
			else
				sys.log( "UI.TradingWnd:F_OnMouseLButtonDown()[ERROR]: cannot find parent item slot for my advert btn" )
			end

		end

	elseif UI:IsWndKindOf( wnd, "Trading_AdvertsBtn" ) then

		if not self:IsWaiting() then

			local itemSlotWnd = UI:GetAncestorKindOf( wnd, "Trading_ItemSlotWnd" )
			if itemSlotWnd then
	
				local data = itemSlotWnd:GetRecordData()
				self:LaunchAdvertsWnd( data.defName ) 
	
			else
				sys.log( "UI.TradingWnd:F_OnMouseLButtonDown()[ERROR]: cannot find parent item slot for adverts btn" )
			end

		end

	elseif UI:IsWndKindOf( wnd, "Trading_MyAdvertSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "Trading_MyAdvertSlotWnd" ) then

		local myAdvertSlotWnd = UI:IsWndKindOf( wnd, "Trading_MyAdvertSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "Trading_MyAdvertSlotWnd" )
		if UI:IsPtInRect( myAdvertSlotWnd:GetMouseActiveRect(), self:XToScreen( mouseX ), self:YToScreen( mouseY ) ) then
	
			if not self:IsWaiting() then
				if myAdvertSlotWnd:GetRecordData().myAdvert then
					self:SetDDState_WAIT_MOUSE( myAdvertSlotWnd, mouseX, mouseY )
				end
			end

		end

	elseif wnd == self.inventoryItemsFilterCheckBox then

		self:SetInventoryItemsFilter( not self.inventoryItemsFilterCheckBox:IsChecked() )

	end

	return true

end


--
function UI.TradingWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if self.ddInfo.ddState == self.ddStates.DRAG then

		if not self:IsWaiting() then
    		if not self:GetMyAdvertSlotUnderMouse( mouseX, mouseY ) then
				self:TryDeleteAdvert( self.ddInfo.myAdvertSlot:GetRecordData().myAdvert.advertId )
    		end
		end

		self:ResetDD()

		if self.sounds.ddStop and self.sounds.ddStop ~= "" then
			UI:PlayGlobalSound( self.sounds.ddStop )
		end

	else

		if self.ddInfo.ddState ~= self.ddStates.NONE then
			self:ResetDD()
		end

--[[ не надо переход к предмету по клику - #0076769,комм.(0331622)
	--	TODO: убрать код через некоторое время, когда точно будет известно, что этот функционал не нужен

    	local myAdvertSlotWnd = self:GetMyAdvertSlotUnderMouse( mouseX, mouseY )
		if myAdvertSlotWnd and myAdvertSlotWnd == self.myAdvertSlotUnderLastMouseDown then

			local data = myAdvertSlotWnd:GetRecordData()
			if data.myAdvert then

				self:ShowItem( data.myAdvert.def )
	    		UI:PlayGlobalSound( self.sounds.itemShow )			

			end

		end
]]

	end

	return false

end


--
function UI.TradingWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return false
	end

	if self.ddInfo.ddState == self.ddStates.DRAG then

		self.ddIco:UpdatePos( self:XToScreen( mouseX ), self:YToScreen( mouseY ) )

	elseif self.ddInfo.ddState == self.ddStates.WAIT_MOUSE then

    	local mouseX_abs	= UI:XToAbs( mouseX )
    	local mouseY_abs 	= UI:YToAbs( mouseY )

    	local dir = UI:Vec2( mouseX_abs - self.ddInfo.mouseX_abs, mouseY_abs - self.ddInfo.mouseY_abs )
    	local distSq_abs = UI:V2LengthSq( dir )

    	if distSq_abs > self.ddMouseThreshold_abs * self.ddMouseThreshold_abs then
    		self:SetDDState_DRAG()
    	end

	end

	return false

end


--
function UI.TradingWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then
	
		if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
			return true
		else 
			return self:HandleKey( key, -2 )
		end

	end

	if self.OnTab then
		return self:HandleKey( key, -2 )
	else
		return true
	end

end


--
function UI.TradingWnd:OnEscape()

	self:NotifyMainWnd( false )
	self:Close( true )
	return true

end


--
function UI.TradingWnd:Close( bSound )

	if not self:IsOnScreen() then
		return
	end

	self:Hide()

	if bSound then
    	UI:PlayGlobalSound( self.sounds.cancel )
	end

end


--
function UI.TradingWnd:NotifyMainWnd( result, data )

	if self.mainWndName == "" then
		return
	end

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.TradingWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if mainWnd.OnTradingWndResult then
		mainWnd:OnTradingWndResult( result, data )
	end

end


--
function UI.TradingWnd:PlaceOnScreen()

	-- по центру экрана
	self:SetPos( ( 1024 - self:GetWidth() ) / 2, ( 768 - self:GetHeight() ) / 2 )

end


--
function UI.TradingWnd:IsWaiting()

	return
		self.advertHeaderGetRequestId ~= 0
		or self.advertDeleteRequestId ~= 0

end


--
function UI.TradingWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.TradingWnd:UpdateMyAdverts()

	self:ResetDD()
	
	local function fnSort( myAdvert1, myAdvert2 )
		return myAdvert1.expTime < myAdvert2.expTime
	end

	for recordIdx = 1, self.itemsList:GetNumRecords() do

		local data = self.itemsList:GetRecordData( recordIdx )
		
		data.myAdverts = UI:GetMyAdvertsByDef( data.defName )
		table.sort( data.myAdverts, fnSort )

		local slotWnd = self.itemsList:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnMyAdvertsChanged()
		end

	end

	self:UpdateMyAdvertsList()

end


--
function UI.TradingWnd:TryRequestAdvertHeaders()

	self.bWantReload = false

	if self.advertHeaderGetRequestId ~= 0 then
		return
	end

	if self.reloadTimer == -1 then
		self:DoRequestAdvertHeaders()
	else
		self.bWantReload = true
	end

end


--
function UI.TradingWnd:DoRequestAdvertHeaders()

	if self.advertHeaderGetRequestId ~= 0 then
		sys.log( "UI.TradingWnd:DoRequestAdvertHeaders()[ERROR: still waiting for another request" )
	end

	self.advertHeaderGetRequestId = _G.MasterServer_AdvertHeaderGet()
	self:UpdateWaitingEffect()

	if self.advertHeaderGetRequestId == 0 then
		self:ShowMsgOnAdvertHeaderGetError( _G.MasterServer.AdvertResult.AR_ERROR )
	end

	self.reloadTimer = self.RELOAD_DELAY

end


--
function UI.TradingWnd:ShowMsgOnAdvertHeaderGetError( errorCode )

	UI:ShowErrorMsg( "tradingItems_error_advertHeaderGet", errorCode, "_G.MasterServer.AdvertResult" )

end


--
function UI.TradingWnd:SetAdvertHeaders( data )

	if not self:IsAdvertHeadersDataValid( data ) then
		return
	end

	self.advertHeaders = data.headers

	self.advertHeadersByDef	= {}

	for idx, header in pairs( self.advertHeaders ) do

		if self.advertHeadersByDef[ header.def ] then
			sys.log( "UI.TradingWnd:SetAdvertHeaders()[ERROR]: duplicate advert header" )
		end

		self.advertHeadersByDef[ header.def ] = header

	end

	self:OnAdvertHeadersChanged()
	
end


--
function UI.TradingWnd:IsAdvertHeadersDataValid( data )

	if type( data ) ~= "table" then
		sys.log( "UI.TradingWnd:IsAdvertHeadersDataValid()[ERROR]: invalid type of return value from MasterServer_AdvertHeaderGet(); \"table\" expected, got \"%s\"", type( data ) )
		return false
	end

	if type( data.headers ) ~= "table" then
		sys.log( "UI.TradingWnd:IsAdvertHeadersDataValid()[ERROR]: invalid type of field \"headers\"; \"table\" expected, got \"%s\"", type( data.headers ) )
		return false
	end

	for idx, header in pairs( data.headers ) do

		if type( header.def ) ~= "string" then
			sys.log( "UI.TradingWnd:IsAdvertHeadersDataValid()[ERROR]: invalid type of field \"def\"; \"string\" expected, got \"%s\"", type( header.def ) )
			return false
		end

		if type( header.count ) ~= "number" then
			sys.log( "UI.TradingWnd:IsAdvertHeadersDataValid()[ERROR]: invalid type of field \"count\"; \"number\" expected, got \"%s\"", type( header.count ) )
			return false
		end

		if type( header.minGoldPerPiece ) ~= "number" then
			sys.log( "UI.TradingWnd:IsAdvertHeadersDataValid()[ERROR]: invalid type of field \"minGoldPerPiece\"; \"number\" expected, got \"%s\"", type( header.minGoldPerPiece ) )
			return false
		end
		
		if type( header.goldPrice ) ~= "number" then
			sys.log( "UI.TradingWnd:IsAdvertHeadersDataValid()[ERROR]: invalid type of field \"goldPrice\"; \"number\" expected, got \"%s\"", type( header.goldPrice ) )
			return false
		end

	end

	return true

end


--
function UI.TradingWnd:OnAdvertHeadersChanged()

	self:UpdateItems( true )

end


--
function UI.TradingWnd:UpdateReloadTimer( dt )

	if self.reloadTimer == -1 then
		return
	end

	self.reloadTimer = self.reloadTimer - dt
	if self.reloadTimer <= 0 then

		self.reloadTimer = -1

		if self.bWantReload then
			self:TryRequestAdvertHeaders()
		end		

	end

end


--
function UI.TradingWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateReloadTimer( dt_sys )
	self:UpdateNameFilterTimer( dt_sys )

end


--
function UI.TradingWnd:F_OnEventSaveUiState()

	local tableName = self:GetScriptTableName()

	local t = {}
	UI.store[ tableName ] = t

	t.advertHeaderGetRequestId	= self.advertHeaderGetRequestId
	t.advertDeleteRequestId		= self.advertDeleteRequestId
	
	self:Hide()

end


--
function UI.TradingWnd:F_OnEventRestoreUiState()

	local tableName = self:GetScriptTableName()
	local t = UI.store[ tableName ]

	if t then

		self.advertHeaderGetRequestId	= t.advertHeaderGetRequestId
		self.advertDeleteRequestId		= t.advertDeleteRequestId

		self:UpdateWaitingEffect()

		UI.store[ tableName ] = nil

	end

end


--
function UI.TradingWnd:HideChildModals()

	if not UI:IsInRemovingAllWindows() then

		self.createAdvertWnd:Hide()
		self:HideAdvertsWnd()

		if self.hMsgDeleteAdvert ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hMsgDeleteAdvert )
		end

	end

	self.hMsgDeleteAdvert	= UI.INVALID_UI_HANDLE
	self.advertIdToDelete	= nil

end


--
function UI.TradingWnd:LaunchCreateAdvertWnd( defName, iid )

	self.createAdvertWnd:Setup( defName, iid )
	self.createAdvertWnd:Show()

	UI:PlayGlobalSound( self.sounds.advertsWndShow )

end


--
function UI.TradingWnd:LaunchAdvertsWnd( defName )

	UI.Trading_AdvertsWnd:Setup( defName, self:GetName())
	UI.Trading_AdvertsWnd:Show()

	UI:PlayGlobalSound( self.sounds.advertsWndShow )

end


--
function UI.TradingWnd:HideAdvertsWnd()

	if UI.Trading_AdvertsWnd:IsOnScreen() and UI.Trading_AdvertsWnd:GetMainWndName() == self:GetName() then
		UI.Trading_AdvertsWnd:Hide()
	end

end


--
function UI.TradingWnd:TryDeleteAdvert( advertId )

	if self:IsWaiting() then
		return
	end

	if self.hMsgDeleteAdvert ~= UI.INVALID_UI_HANDLE then
		sys.log( "UI.TradingWnd:TryDeleteAdvert()[ERROR]: msg box is already on screen" )
		return
	end

	self.hMsgDeleteAdvert = UI:MessageBox( UI:GetStringByName( "tradinItems_msg_deleteAdvert_caption" ), UI:GetStringByName( "tradinItems_msg_deleteAdvert_text" ), UI.MBS_YES_NO )
	self.advertIdToDelete = advertId

end


--
function UI.TradingWnd:DoDeleteAdvert( advertId )

	if self:IsWaiting() then
		sys.log( "UI.TradingWnd:DoDeleteAdvert()[ERROR]: still waiting for another request" )	
		return
	end

	self.advertDeleteRequestId = _G.MasterServer_AdvertDelete( advertId )
	self:UpdateWaitingEffect()

	if self.advertDeleteRequestId == 0 then
		self:ShowMsgOnAdvertDeleteError( _G.MasterServer.AdvertResult.AR_ERROR )
	end

end


--
function UI.TradingWnd:ShowMsgOnAdvertDeleteError( errorCode )

	UI:ShowErrorMsg( "tradingItems_error_advertDelete", errorCode, "_G.MasterServer.AdvertResult" )

end


--
function UI.TradingWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgDeleteAdvert then

		self.hMsgDeleteAdvert = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if self.advertIdToDelete then
				self:DoDeleteAdvert( self.advertIdToDelete )
			else
				sys.log( "UI.TradingWnd:F_OnEventMsgBoxRet()[ERROR]: no def name stored to delete advert" )
			end

			UI:PlayGlobalSound( self.sounds.deleteAdvert )

		end

		self.advertIdToDelete = nil

	end

end


--
function UI.TradingWnd:ResetDD()

	if self.ddInfo.ddState == self.ddStates.NONE then
		return
	end

	local slotWnd = self.ddInfo.myAdvertSlot

	self.ddInfo.ddState			= self.ddStates.NONE
	self.ddInfo.myAdvertSlot	= nil
	self.ddInfo.mouseX_abs		= 0
	self.ddInfo.mouseY_abs		= 0

	-- сообщается слоту
	if slotWnd and slotWnd:IsOnScreen() then	
		local slotData = slotWnd:GetRecordData()
		if slotData then
			slotData.bIsDd = false
			slotWnd:OnDDStateChanged()
		end
	end

	-- скрывается drag-and-drop иконка
	self.ddIco:Reset()
	self.ddIco:UnlinkFromParent()

	-- отаускается мышь
	self:ReleaseMouse()

end


--
function UI.TradingWnd:SetDDState_DRAG()

	if self.ddInfo.ddState ~= self.ddStates.WAIT_MOUSE then
		sys.log( "UI.TradingWnd:SetDDState_DRAG()[ERROR]: invalid states sequence" )
		return
	end

	self.ddInfo.ddState	= self.ddStates.DRAG

	-- показывается drag-and-drop иконка
	UI.Root:AddChild( self.ddIco )	-- линкуется к руту, т.к. д.б. поверх остальных чайлдов ангара, а не только эквипмента
	UI.Root:MoveChildToLastPosition( self.ddIco )	-- в UI.Root:F_OnAfterAddChild происходит пересортирвка окон, и иконка может оказаться ниже окна торговли

	self.ddIco:Setup( self.ddInfo.myAdvertSlot:GetRecordData().myAdvert )

	self.ddIco:UpdatePos( UI:GetMouseX(), UI:GetMouseY() )

	-- сообщается слоту
    self.ddInfo.myAdvertSlot:GetRecordData().bIsDd = true
    self.ddInfo.myAdvertSlot:OnDDStateChanged()

	if self.sounds.ddStart and self.sounds.ddStart ~= "" then
		UI:PlayGlobalSound( self.sounds.ddStart )
	end

end 


--
function UI.TradingWnd:SetDDState_WAIT_MOUSE( myAdvertSlot, mouseX, mouseY )

	if self.ddInfo.ddState ~= self.ddStates.NONE then
		sys.log( "UI.TradingWnd:SetDDState_WAIT_MOUSE()[ERROR]: invalid states sequence" )
		return
	end

	UI:ResetTooltip()

	self.ddInfo.ddState			= self.ddStates.WAIT_MOUSE
	self.ddInfo.mouseX_abs		= UI:XToAbs( mouseX )
	self.ddInfo.mouseY_abs		= UI:YToAbs( mouseY )
	self.ddInfo.myAdvertSlot	= myAdvertSlot

	self:CaptureMouse()

end


--
function UI.TradingWnd:CaptureMouse()

	UI:CaptureMouse( self:GetUiHandle() )

end


--
function UI.TradingWnd:ReleaseMouse()

	if UI:GetMouseCapture() == self:GetUiHandle() then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end

end


--
function UI.TradingWnd:GetMyAdvertSlotUnderMouse( mouseX, mouseY )	

	mouseX = self:XToScreen( mouseX )
	mouseY = self:YToScreen( mouseY )

	for slotIdx = 1, self.myAdvertsList:GetNumRecords() do

		local slotWnd = self.myAdvertsList:GetButtonForRecord( slotIdx )
		if slotWnd and slotWnd:IsChildOf( self ) and UI:IsPtInRect( slotWnd:GetMouseActiveRect(), mouseX, mouseY ) then
			return slotWnd
		end

	end

	return nil

end


--
function UI.TradingWnd:RecalcAbsVals()

	self.ddMouseThreshold_abs = UI:XToAbs( UI:XTo1024x768( self.DD_MOUSE_THRESHOLD, { x = 1280, y = 720 } ) )

end


--
function UI.TradingWnd:HandleTooltip( targetWnd, tooltipData )

	if self.ddInfo.ddState ~= self.ddStates.NONE then
		return true, UI.INVALID_UI_HANDLE
	end

	return false

end


--
function UI.TradingWnd:SetInventoryItemsFilter( filterVal )

	if filterVal ~= self.inventoryItemsFilterCheckBox:IsChecked() then
		self.inventoryItemsFilterCheckBox:Check( filterVal )
		self:OnInventoryItemsFilterChanged()
	end

end


--
function UI.TradingWnd:RestoreInventoryItemsFilter()

	local profile = _G.GetProfileTable()

	local filterVal = self.DEFAULT_FILTER_INVENTORY_ITEMS

	if type( profile.trading ) == "table" and type( profile.trading.inventoryItemsFilter ) == "boolean" then
		filterVal = profile.trading.inventoryItemsFilter
	end

	self:SetInventoryItemsFilter( filterVal )

end


--
function UI.TradingWnd:SaveInventoryItemsFilter()

	local profile = _G.GetProfileTable()

	if type( profile.trading ) ~= "table" then
		profile.trading = {}
	end

	profile.trading.inventoryItemsFilter = self.inventoryItemsFilterCheckBox:IsChecked()

end


--
function UI.TradingWnd:SaveSelCategory()

	local profile = _G.GetProfileTable()

	if type( profile.trading ) ~= "table" then
		profile.trading = {}
	end

	profile.trading.mainCategory	= self.categoriesList:GetSelectedMainCategory()
	profile.trading.subCategory		= self.categoriesList:GetSelectedSubCategory()

end


--
function UI.TradingWnd:RestoreSelCategory()

	local profile = _G.GetProfileTable()
	
	if type( profile.trading ) ~= "table" then
		return false
	end

	if type( profile.trading.mainCategory ) ~= "string" or type( profile.trading.subCategory ) ~= "string" then
		return false		
	end

	local bLockItemsUpdate_old = self.bLockItemsUpdate
	self.bLockItemsUpdate = true

	if profile.trading.mainCategory ~= "" and self.categoriesList:FindRecordByCategoryName( profile.trading.mainCategory, UI.StoreCategoriesListWnd.categoryTypes.MAIN ) ~= -1 then

		self.categoriesList:SelectMainCategory( profile.trading.mainCategory, false, false )

	    if profile.trading.subCategory ~= "" and self.categoriesList:FindRecordByCategoryName( profile.trading.subCategory, UI.StoreCategoriesListWnd.categoryTypes.SUB, profile.trading.mainCategory ) ~= -1 then
			self.categoriesList:SelectSubCategory( profile.trading.subCategory, profile.trading.mainCategory, false )
		end

	else
		self.categoriesList:SelectMainCategory( "", false, false )
	end

	self.bLockItemsUpdate = bLockItemsUpdate_old
	self:OnSelCategoryChanged()

	return true

end


--
function UI.TradingWnd:SetDefaultSelCategory()

	-- no category by default

end


--
function UI.TradingWnd:ValidateSelCategory()

	if not self:RestoreSelCategory() then
		self:SetDefaultSelCategory()
	end

end


--
function UI.TradingWnd:F_OnEventEditChange( hSender, eventSrc )

	if hSender ~= self.nameFilterEditWnd:GetUiHandle() then
		return
	end

	self.nameFilterTimer = self.NAME_FILTER_DELAY

end


--
function UI.TradingWnd:UpdateNameFilterTimer( dt )

	if self.nameFilterTimer ~= -1 then

		self.nameFilterTimer = self.nameFilterTimer - dt

		if self.nameFilterTimer <= 0 then

			self.nameFilterTimer = -1
			self:OnNameFilterChanged()

		end

	end

end



--
function UI.TradingWnd:GetIidToCreateAdvert( defName )

	local iid = UI.INVALID_U64_ID

	if not UI:IsDefModule( defName ) then
		return iid
	end
	
	local inventoryItems = UI:GetInventoryItemsByDef( defName )
	for invIdx, inventoryItem in pairs( inventoryItems ) do
		if not UI:GetEquippedShipItem( inventoryItem.iid ) then
			iid = inventoryItem.iid
			break
		end
	end

	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.TradingWnd:GetIidToCreateAdvert()[ERROR]: cannot find iid for def=%s", defName )
	end
	
	return iid

end


--
function UI.TradingWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if UI:IsWndKindOf( wnd, "Trading_MyAdvertSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "Trading_MyAdvertSlotWnd" ) then
	
		local myAdvertSlotWnd = UI:IsWndKindOf( wnd, "Trading_MyAdvertSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "Trading_MyAdvertSlotWnd" )
		if UI:IsPtInRect( myAdvertSlotWnd:GetMouseActiveRect(), self:XToScreen( mouseX ), self:YToScreen( mouseY ) ) then
	
			if not self:IsWaiting() then
			
				local myAdvert = myAdvertSlotWnd:GetRecordData().myAdvert
			
				local cancelMenuData = {}
    			cancelMenuData.slotType	= UI.popUpMenuSlotTypes.TRADING_MY_ADVERT_CANCEL
				cancelMenuData.text		= UI:GetStringByName( "popUpMenu_trading_myAdvertCancel" )
				cancelMenuData.myAdvert	= myAdvert
				
				UI.PopUpMenuWnd:Setup( self:GetUiHandle(), UI.popUpMenuTypes.ITEM, UI:GetEntityLocalizedNameByDef( myAdvert.def, true, false, true ) )
				UI.PopUpMenuWnd:AddRecord( cancelMenuData )
				
			end

		end

	end

	return true

end


--
function UI.TradingWnd:F_OnEventListActivateRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.PopUpMenuWnd:GetUiHandle() and UI.PopUpMenuWnd:GetOwner() == self:GetUiHandle() then
    	self:OnPopUpMenu( iParam0 )
	end

end


--
function UI.TradingWnd:OnPopUpMenu( recordIdx )

	local data = UI.PopUpMenuWnd:GetRecordData( recordIdx )
	if not data then
		sys.log( "UI.TradingWnd:OnPopUpMenu()[ERROR]: cannot find pop-up menu data for record %d", recordIdx )
		return
	end
	
	if data.slotType == UI.popUpMenuSlotTypes.TRADING_MY_ADVERT_CANCEL then
	
		if not self:IsWaiting() then
			self:TryDeleteAdvert( data.myAdvert.advertId )
		end

	else
		sys.log( "UI.TradingWnd:OnPopUpMenu()[ERROR]: unhandled slot type: \"%s\"", tostring( data.slotType ) )
	end
	
end


-- -------------------------------------------------------------------
-- UI.Trading_InfoWnd
-- -------------------------------------------------------------------

UI.Trading_InfoTooltipAreaWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_InfoTooltipAreaWnd.def =
{
	className = "Wnd",
	
	props =
	{
		name		= "Trading_InfoTooltipAreaWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},
	
	layers =
	{
		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x6600ff00,
			visible		= false,
		}
	}
}

-- ----------------------------
-- interface funcitons
-- ----------------------------

--
function UI.Trading_InfoTooltipAreaWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.Trading_InfoTooltipAreaWnd:GetTooltipData()

	return self.tooltipData

end

-- ----------------------------
-- vars
-- ----------------------------

UI.Trading_InfoTooltipAreaWnd.tooltipData = nil

-- -------------------------------------------------------------------
-- UI.Trading_ItemsListWnd
-- -------------------------------------------------------------------

UI.Trading_ItemsListWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_ItemsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "Trading_ItemsListWnd",
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
				defName 			= "trading_itemsList",
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

-- ----------------------------
-- const
-- ----------------------------

UI.Trading_ItemsListWnd.btnPrototypeName	= "Trading_ItemSlotWnd"
UI.Trading_ItemsListWnd.listStyle			= UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.Trading_ItemsListWnd.MAX_SLOTS			= 5

UI.Trading_ItemsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_1_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_ItemsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


-- -------------------------------------------------------------------
-- UI.Trading_ItemSlotWnd
-- -------------------------------------------------------------------

UI.Trading_ItemSlotWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_ItemSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Trading_ItemSlotWnd",
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
				defName 			= "trading_itemSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "product_name",
						layer		= "UI.Trading_ItemSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "count",
						layer		= "UI.Trading_ItemSlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "price",
						layer		= "UI.Trading_ItemSlotWnd.layers.ADVERTS_BEST_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}		
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ADVERTS_BEST_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_ItemSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.COUNT )
	self.bestPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.ADVERTS_BEST_PRICE )
	self.icoWnd:Reset()
	self.attachBtn:UnlinkFromParent()
	self.myAdvertBtn:UnlinkFromParent()
	self.advertsBtn:UnlinkFromParent()

end


--
function UI.Trading_ItemSlotWnd:OnMyAdvertsChanged()

	local data = self:GetRecordData()

	self:UpdateMyAdvertBtn( data )
	self:UpdateAdvertsBtn( data )
	self:UpdateAdvertsBestPrice( data )

end


-- ----------------------------
-- const
-- ----------------------------

UI.Trading_ItemSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	NAME				= 1,
	COUNT				= 2,
	ADVERTS_BEST_PRICE	= 3,
}

UI.Trading_ItemSlotWnd.effectInfo =
{
	main =
	{
		icoLocator			= "icon",
		attachBtnLocator	= "btn_7",
		myAdvertLocator		= "btn_22",
		advertsBtnLocator	= "btn_7",
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Trading_ItemSlotWnd.icoWnd				= nil
UI.Trading_ItemSlotWnd.attachBtn			= nil
UI.Trading_ItemSlotWnd.myAdvertBtn			= nil
UI.Trading_ItemSlotWnd.advertsBtn			= nil
UI.Trading_ItemSlotWnd.bestPriceMetaText    = nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_ItemSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.bestPriceMetaText = UI.MetaText.GetNewInstance()
	self.bestPriceMetaText:InitFromLayer( self, self.layers.ADVERTS_BEST_PRICE ) 

	self:CreateControls()

end


--
function UI.Trading_ItemSlotWnd:F_Shutdown()

	if self.bestPriceMetaText then
		self.bestPriceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Trading_ItemSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Trading_ItemSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Trading_ItemSlotWnd:UpdateMetaTextPos()

	self.bestPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.ADVERTS_BEST_PRICE )

end


--
function UI.Trading_ItemSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.ADVERTS_BEST_PRICE then
		self.bestPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Trading_ItemSlotWnd:CreateControls()

	self.icoWnd			= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.attachBtn		= UI:CreateChildWnd( self, UI.Trading_AttachItemBtn, "" )
	self.myAdvertBtn	= UI:CreateChildWnd( self, UI.Trading_MyAdvertBtn, "" )
	self.advertsBtn		= UI:CreateChildWnd( self, UI.Trading_AdvertsBtn, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.icoWnd, mainEffect, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.attachBtn, mainEffect, self.effectInfo.main.attachBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.myAdvertBtn, mainEffect, self.effectInfo.main.myAdvertLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.advertsBtn, mainEffect, self.effectInfo.main.advertsBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.Trading_ItemSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateName( data )
	self:UpdateIco( data )
	self:UpdateCount( data )
	self:UpdateAttachBtn( data )
	self:UpdateMyAdvertBtn( data )
	self:UpdateAdvertsBtn( data )
	self:UpdateAdvertsBestPrice( data )

end


--
function UI.Trading_ItemSlotWnd:UpdateName( data )

	local str = UI:GetEntityLocalizedNameByDef( data.defName, true, false )
	self:SetText( str, self.layers.NAME )

end


--
function UI.Trading_ItemSlotWnd:UpdateIco( data )

	-- иконка

	self.icoWnd:SetupForItem( data.defName )

	-- количество

	if data.count > 1 then
		self.icoWnd:SetCountResources( data.count )
	end

	-- тултип
	
	local tooltipData = nil
				
	if UI:IsDefModule( data.defName ) then
	
		tooltipData = {}
		tooltipData.tooltipType 		= UI.tooltipTypes.MODULE
		tooltipData.defName				= data.defName
		tooltipData.compareShipData		= nil -- см.ниже
		
		local selShipItem = UI.HangarWnd:GetSelShipItem()
		if selShipItem then
			tooltipData.compareShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( selShipItem.vid, -1 )
		end

	else
		tooltipData = UI:GetTooltipForItem( data.defName )
	end

	self.icoWnd:SetTooltipData( tooltipData )

end


--
function UI.Trading_ItemSlotWnd:UpdateCount( data )

	local str = ""

	if UI:IsDefResource( data.defName ) or UI:IsDefBlueprint( data.defName ) then

		local curCount	= data.count
		local maxCount	= UI:GetPlayerResourceMaxCount( data.defName )

		str = UI:MakeItemStorageString( true, curCount, maxCount, 0, nil, true, self:GetColor( self.layers.COUNT ) )
		
	elseif UI:IsDefModule( data.defName ) then
		str = UI:MakeItemStorageString( true, data.count, -1, 0, nil, true, self:GetColor( self.layers.COUNT ) )
		
	else
		sys.log( "UI.Trading_ItemSlotWnd:UpdateCount()[ERROR]: unsupported item (\"%s\")", data.defName )
	end

	self:SetText( str, self.layers.COUNT )

end


--
function UI.Trading_ItemSlotWnd:UpdateAttachBtn( data )

	local bNeedBtn =
		data.tradingMode == UI.TradingWnd.modes.MAIL
		and data.count > 0

	if bNeedBtn then
		self:AddChild( self.attachBtn )
	else
		self.attachBtn:UnlinkFromParent()
	end
	
end


--
function UI.Trading_ItemSlotWnd:UpdateMyAdvertBtn( data )

	self.myAdvertBtn:UnlinkFromParent()

	if data.tradingMode ~= UI.TradingWnd.modes.MAIL then

		if data.count > 0 and UI:GetTableLength( UI.serverData.myAdverts ) < UI:GetTradingMaxAdverts() then	-- myAdverts - не регулярный массив, т.к. начинается с 0, поэтому для определения длины нельзя использовать оператор #

			self:AddChild( self.myAdvertBtn )			

			local text = UI:GetStringByName( "tradingItems_createAdvertBtn" )
			self.myAdvertBtn:SetBtnText( text )

		end

	end
	
end


--
function UI.Trading_ItemSlotWnd:UpdateAdvertsBtn( data )

	local bNeedBtn = data.tradingMode ~= UI.TradingWnd.modes.MAIL
	if bNeedBtn then

		self:AddChild( self.advertsBtn )

		local numAdverts = data.advertHeader and data.advertHeader.count or 0

		local str = string.format( "%s: %s", UI:GetStringByName( "tradingItems_advertsBtn" ), UI:Num2StrSeparatedBy3( numAdverts ) ) 
		self.advertsBtn:SetBtnText( str )

		local bEnable = numAdverts > 0
		self.advertsBtn:Enable( bEnable )

	else
		self.advertsBtn:UnlinkFromParent()
	end

end


--
function UI.Trading_ItemSlotWnd:UpdateAdvertsBestPrice( data )

	local bNeedPrice = false

	if data.tradingMode ~= UI.TradingWnd.modes.MAIL then

		local numAdverts = data.advertHeader and data.advertHeader.count or 0
		if numAdverts > 0 then
			bNeedPrice = true
		end
		
	end

	if bNeedPrice then

		self:SetLayerVisible( true, self.layers.ADVERTS_BEST_PRICE )
		
		local strVal = string.format( "%s (%0.1f)", UI:Num2StrSeparatedBy3( data.advertHeader.goldPrice ), data.advertHeader.minGoldPerPiece )
		
		local priceInfo =
		{
			priceType 	= _G.GameStore.CreditsType.CT_GOLD,
			val			= data.advertHeader.goldPrice,
			bIsBuyPrice	= false,
			valAsString	= strVal,
		}
	
		local strPrice = UI:PriceInfo2Str( priceInfo, nil, nil, nil, true, nil )
		local str = string.format( "%s: %s", UI:GetStringByName( "tradingItems_advertsBestPrice" ), strPrice )

		self.bestPriceMetaText:SetText( str, true )

	else

		self:SetLayerVisible( false, self.layers.ADVERTS_BEST_PRICE )
		self.bestPriceMetaText:SetText( "", true )

	end

end


-- -------------------------------------------------------------------
-- UI.Trading_ReloadBtn
-- -------------------------------------------------------------------

UI.Trading_ReloadBtn = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_ReloadBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name 			= "Trading_ReloadBtn",
		selectSound		= UI.sounds.btnMouseOver,
		clickSound		= UI.sounds.btnClick,
		isPrototype		= true,
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
				defName 			= "squadFinder_reloadBtn",
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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_ReloadBtn:GetTooltipData()

	return self.tooltipData

end


-- ----------------------------
-- const
-- ----------------------------

UI.Trading_ReloadBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

UI.Trading_ReloadBtn.tooltipData =
{
	tooltipType		= UI.tooltipTypes.TEXT_SMALL,
	text			= UI:GetStringByName( "squadFinder_reloadBtn_tooltipText" )
}

-- -------------------------------------------------------------------
-- UI.Trading_InventoryItemsFilterCheckBox
-- -------------------------------------------------------------------

UI.Trading_InventoryItemsFilterCheckBox = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.Trading_InventoryItemsFilterCheckBox.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

--
UI.Trading_InventoryItemsFilterCheckBox.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Trading_InventoryItemsFilterCheckBox",
		selectSound	= UI.sounds.btnMouseOver,
		clickSound	= UI.sounds.checkBox,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.Trading_InventoryItemsFilterCheckBox.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "trading_inventoryItemsFilterCheckBox",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.Trading_InventoryItemsFilterCheckBox.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= UI.Trading_InventoryItemsFilterCheckBox.layers.TEXT,
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tradingItems_inventoryItemsFilter" ),
		},
	}
}

-- -------------------------------------------------------------------
-- UI.Trading_NameFilterEditWnd
-- -------------------------------------------------------------------

UI.Trading_NameFilterEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "Trading_NameFilterEditWnd",
    		symbolsLimit	= 64,
			editStyle		= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL,
	     	activationOrder	= -1,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "trading_nameFilterEdit",
    				defaultAnimation    = "idle",

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

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "text",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "idle",
			animDisabled			= "idle",
    	}
    }
}

-- -------------------------------------------------------------------
-- UI.Trading_AttachItemBtn
-- -------------------------------------------------------------------

UI.Trading_AttachItemBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn16",

    	props =
    	{
    		name		= "Trading_AttachItemBtn",
			isPrototype	= true,
    	},
	},

	textId	= "tradingItems_chooseItemBtn"
}

-- -------------------------------------------------------------------
-- UI.Trading_MyAdvertBtn
-- -------------------------------------------------------------------

UI.Trading_MyAdvertBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn16",

    	props =
    	{
    		name		= "Trading_MyAdvertBtn",
			isPrototype	= true,
    	},
	},
}


-- -------------------------------------------------------------------
-- UI.Trading_AdvertsBtn
-- -------------------------------------------------------------------

UI.Trading_AdvertsBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn16",

    	props =
    	{
    		name		= "Trading_AdvertsBtn",
			isPrototype	= true,
    	},
	},
}

-- -------------------------------------------------------------------
-- UI.Trading_MyAdvertsListWnd
-- -------------------------------------------------------------------

UI.Trading_MyAdvertsListWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_MyAdvertsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "Trading_MyAdvertsListWnd",
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
				defName 			= "trading_myAdvertsList",
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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_MyAdvertsListWnd:Update()

	self:Clear()

	local maxAdverts = UI:GetTradingMaxAdverts()

	if UI:GetTableLength( UI.serverData.myAdverts ) > maxAdverts then 	-- myAdverts - не регулярный массив, т.к. начинается с 0, поэтому для определения длины нельзя использовать оператор #
		sys.log( "UI.Trading_MyAdvertsListWnd:Setup()[ERROR]: max adverts exceeded" )
	end

	local myAdvertsSorted = {}
	for idx, myAdvert in pairs( UI.serverData.myAdverts ) do
		table.insert( myAdvertsSorted, myAdvert )
	end

	local function fnSort( myAdvert1, myAdvert2 )
		return myAdvert1.expTime < myAdvert2.expTime
	end

	table.sort( myAdvertsSorted, fnSort )	

	for slotIdx = 1, maxAdverts do

		local data =
		{
			myAdvert	= myAdvertsSorted[ slotIdx ],
			bIsDd		= false,
		}

		self:AddRecord( data )

	end

end


-- ----------------------------
-- const
-- ----------------------------

UI.Trading_MyAdvertsListWnd.btnPrototypeName	= "Trading_MyAdvertSlotWnd"
UI.Trading_MyAdvertsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.Trading_MyAdvertsListWnd.MAX_SLOTS			= 7

UI.Trading_MyAdvertsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "icon_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- -------------------------------------------------------------------
-- UI.Trading_MyAdvertSlotWnd
-- -------------------------------------------------------------------

UI.Trading_MyAdvertSlotWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.Trading_MyAdvertSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    PRICE		= 1,
    TIME		= 2,
}

--
UI.Trading_MyAdvertSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Trading_MyAdvertSlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.Trading_MyAdvertSlotWnd.layers.TIME,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "trading_myAdvertSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "price",
						layer		= "UI.Trading_MyAdvertSlotWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "timer",
						layer		= "UI.Trading_MyAdvertSlotWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},		
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_MyAdvertSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.TIME )
	self.priceMetaText:SetText( "", true )
	self.icoWnd:Reset()
	self:SetMouseOver( false )

end


-- режим перетаскивания (drag @ drop)
function UI.Trading_MyAdvertSlotWnd:OnDDStateChanged()

	local data = self:GetRecordData()

	self:UpdateIco( data )
	self:UpdateTime( data)
	self:UpdatePrice( data )	
	self:UpdateMouseOver( data )

end


-- в системе координат окна
function UI.Trading_MyAdvertSlotWnd:GetMouseActiveRect()

	return self:ToScreen( self.icoWnd:GetRect() )

end


-- ----------------------------
-- const
-- ----------------------------

UI.Trading_MyAdvertSlotWnd.effectInfo =
{
	main =
	{
		icoLocator		= "icon",
		priceLocator	= "price",
	}
}

UI.Trading_MyAdvertSlotWnd.sounds =
{
	mouseOver = UI.sounds.btnMouseOver
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Trading_MyAdvertSlotWnd.icoWnd			= nil
UI.Trading_MyAdvertSlotWnd.priceMetaText	= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_MyAdvertSlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end	

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

	self:CreateControls()

end


--
function UI.Trading_MyAdvertSlotWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Trading_MyAdvertSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.Trading_MyAdvertSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Trading_MyAdvertSlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.Trading_MyAdvertSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Trading_MyAdvertSlotWnd:CreateControls()

	self.icoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.icoWnd, mainEffect, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )

end


--
function UI.Trading_MyAdvertSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateTime( data)
	self:UpdatePrice( data )
	self:UpdateMouseOver( data )

end


--
function UI.Trading_MyAdvertSlotWnd:UpdateIco( data )

	if data.myAdvert then

		if data.bIsDd then
	
			self.icoWnd:Reset()
	
		else
		
			local defName = data.myAdvert.def
			local bEnchanted = data.myAdvert.iid ~= UI.INVALID_U64_ID and UI:IsInventoryItemEnchantedById( data.myAdvert.iid )
	
			-- иконка
	
			self.icoWnd:SetupForItem( defName, bEnchanted )
			
			-- количество
			
			local count = data.myAdvert.amount or 1
			if count > 1 then
				self.icoWnd:SetCountResources( count )
			end
	
			-- тултип
			
			local tooltipData = nil
						
			if UI:IsDefModule( defName ) then
			
				tooltipData = {}
				tooltipData.tooltipType 		= UI.tooltipTypes.MODULE
				tooltipData.defName				= defName
				tooltipData.compareShipData		= nil -- см.ниже
				tooltipData.bEnchanted			= bEnchanted
				
				local selShipItem = UI.HangarWnd:GetSelShipItem()
				if selShipItem then
					tooltipData.compareShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( selShipItem.vid, -1 )
				end

			else
				tooltipData = UI:GetTooltipForItem( defName )
			end
	
			self.icoWnd:SetTooltipData( tooltipData )
	
		end

	else

		-- икони нет

		self.icoWnd:Reset()

		-- тултип

    	local tooltipData = {}	

    	tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		tooltipData.caption		= UI:GetStringByName( "tradingItems_myAdvertSlot_tooltipNoItem_caption" )
		tooltipData.text		= UI:GetStringByName( "tradingItems_myAdvertSlot_tooltipNoItem_text" )

		self.icoWnd:SetTooltipData( tooltipData )

	end

end


--
function UI.Trading_MyAdvertSlotWnd:UpdateTime( data )

	if data.myAdvert and not data.bIsDd then

    	local curTime = _G.MasterServer_GetServerTime()

    	local leftTime = 0

		-- проверка myAdvert.expTime > curTime - во избежание переполнения при вычитании, т.к. число беззнаковое;
		-- проверка type( curTime ), т.к. в случае дисконнекта возвращается nil и далее скриптовая ошибка
    	if type( curTime ) == "userdata" and data.myAdvert.expTime > curTime then
    		leftTime = ( data.myAdvert.expTime - curTime ).l * 0.001
    	end

    	local str = UI:Time2Str6( leftTime )
    	self:SetText( str, self.layers.TIME )	

	else
    	self:SetText( "", self.layers.TIME )
	end

end


--
function UI.Trading_MyAdvertSlotWnd:UpdatePrice( data )

	if data.myAdvert and not data.bIsDd then

    	local priceInfo =
    	{
        	priceType 	= _G.GameStore.CreditsType.CT_GOLD,
        	val			= data.myAdvert.goldPrice,
        	bIsBuyPrice	= false,
    	}

    	local str = UI:PriceInfo2Str( priceInfo, nil, nil, nil, true, nil )
    	self.priceMetaText:SetText( str, true )

	else
    	self.priceMetaText:SetText( "", true )
	end

end


--
function UI.Trading_MyAdvertSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local data = self:GetRecordData()
	if data.myAdvert and not data.bIsDd then
		self:UpdateTime( data )
	end

end


--
function UI.Trading_MyAdvertSlotWnd:UpdateMouseOver( data )

	if not data then
		data = self:GetRecordData()
	end

	local bMouseOver = false

	-- TODO: не надо переход к предмету по клику - #0076769,комм.(0331622)
	-- убрать код через некоторое время, когда точно будет известно, что этот функционал не нужен

	local bCanClick = false -- data and data.myAdvert ~= nil and not data.bIsDd
	if bCanClick then

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )

		if wndUnderMouse and ( wndUnderMouse == self.icoWnd or wndUnderMouse:IsChildOf( self.icoWnd ) ) then
			bMouseOver = true
		end

	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Trading_MyAdvertSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.icoWnd:IsMouseOver()

	if bMouseOver then
		self.icoWnd:ShowMouseOver()
	else
		self.icoWnd:HideMouseOver()
	end	

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Trading_MyAdvertSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()

	return true

end


--
function UI.Trading_MyAdvertSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()

	return true	

end


-- -----------------------------------------------------------------------
-- UI.Trading_MyAdvertDDIco
-- -----------------------------------------------------------------------

UI.Trading_MyAdvertDDIco = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.Trading_MyAdvertDDIco.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Trading_MyAdvertDDIco",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	}
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.Trading_MyAdvertDDIco:Setup( myAdvert )

	self:Reset()

	self.myAdvert = myAdvert
	self:FullUpdate()

end


--
function UI.Trading_MyAdvertDDIco:Reset()

	self.myAdvert = nil
	self.itemIcoWnd:Reset()

end


--
function UI.Trading_MyAdvertDDIco:UpdatePos( mouseX, mouseY )

	local x = mouseX - self.origin.x
	local y = mouseY - self.origin.y

	self:SetLeft( x )
	self:SetTop( y )

end


-- --------------------------------------
-- const
-- --------------------------------------

UI.Trading_MyAdvertDDIco.origin = UI:PtTo1024x768( UI:Vec2( 0, 0 ), resolution )

-- --------------------------------------
-- vars
-- --------------------------------------

UI.Trading_MyAdvertDDIco.myAdvert	= nil
UI.Trading_MyAdvertDDIco.itemIcoWnd	= nil

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.Trading_MyAdvertDDIco:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self:AddChild( self.itemIcoWnd )
	self.itemIcoWnd:AnimateMainDD()

	self:SetWidth( self.itemIcoWnd:GetWidth() )
	self:SetHeight( self.itemIcoWnd:GetHeight() )

end


--
function UI.Trading_MyAdvertDDIco:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
	_G.SetTextPixelSnapping( false, false )
	
	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	
	_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )
	
end


--
function UI.Trading_MyAdvertDDIco:FullUpdate()

	local bEnchanted = self.myAdvert.iid ~= UI.INVALID_U64_ID and UI:IsInventoryItemEnchantedById( self.myAdvert.iid )
	
	-- иконка

	self.itemIcoWnd:SetupForItem( self.myAdvert.def, bEnchanted )
	
	-- количество
	
	local count = self.myAdvert.amount or 1
	if count > 1 then
		self.itemIcoWnd:SetCountResources( count )
	end
		
end


-- -------------------------------------------------------------------
-- UI.Trading_AdvertsWnd
-- -------------------------------------------------------------------

UI.Trading_AdvertsWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.Trading_AdvertsWnd.layers =
{
    MAIN_EFFECT	= 0,
    BG_EFFECT	= 1,
    WORK_EFFECT	= 2,
    CAPTION		= 3,
    ITEM_NAME	= 4,
    ITEM_COUNT	= 5,
    WAIT_EFFECT	= 6, 
    WAIT_TEXT	= 7,
}

--
UI.Trading_AdvertsWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "Trading_AdvertsWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.Trading_AdvertsWnd.layers.WAIT_EFFECT,

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
						objName		= "ad_win",
						layer		= "UI.Trading_AdvertsWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- идет от FullScreenWnd
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
				defName 			= "trading_adverts_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Trading_AdvertsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "product_name",
						layer		= "UI.Trading_AdvertsWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "count",
						layer		= "UI.Trading_AdvertsWnd.layers.ITEM_COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load_modules",
						layer		= "UI.Trading_AdvertsWnd.layers.WAIT_EFFECT",
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
			text			= UI:GetStringByName( "tradingItems_adverts_caption" ),
		}, 

		-- ITEM_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- ITEM_COUNT
		{
			layerType		= UI.LAYER_TEXT,
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
						layer		= "UI.Trading_AdvertsWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hangar_loading" ),
		},
	},
	
	children = { "UI.Trading_Adverts_AdvertsListWnd" }
	
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_AdvertsWnd:Setup( defName, mainWndName )

	self:Reset()
	
	if type( defName ) ~= "string" then
		sys.log( "UI.Trading_AdvertsWnd:Setup()[ERROR]: invalid type of the 1-st parameter ('defName'); 'string' expected, got '%s'", type( defName ) )
		return
	end
	
	if mainWndName ~= nil then
		if type( mainWndName ) ~= "string" then
			sys.log( "UI.Trading_AdvertsWnd:Setup()[ERROR]: invalid type of the 2-nd parameter ('mainWndName'); 'string' or 'nil' expected, got '%s'", type( mainWndName ) )
			mainWndName = nil
		end
	end
	
	if mainWndName == nil then
		mainWndName = ""
	end

	self.defName		= defName
	self.mainWndName	= mainWndName	

	if self:IsOnScreen() then

		self:TryRequestAdverts()
		self:UpdateContent()

	end

end


--
function UI.Trading_AdvertsWnd:GetMainWndName()

	return self.mainWndName

end


--
function UI.Trading_AdvertsWnd:MasterServer_OnAdvertGetData( data )

	if self:IsOnScreen() then

		if self:IsAdvertsDataValid( data ) then

			if data.def == self.defName then

				self.adverts = data.adverts
    			self:UpdateAdvertsList()

			end

		end

	end

	self.advertGetRequestId	= 0	-- hack: т.к. идентификатор реквеста не передается, то просто считаю, что это был ответ именно на ожидаемый запрос
	self.requestedDefName	= ""
	self:UpdateWaitingEffect()

	if self.bWantReload then

		if self:IsOnScreen() then
			self:TryRequestAdverts()
		else
			self.bWantReload = false
		end

	end

end


--
function UI.Trading_AdvertsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.advertGetRequestId		= 0
	self.requestedDefName		= ""
	self.lastReloadTime			= -1
	self.buyFromAdvertRequestId	= 0

	self:UpdateWaitingEffect()

end


--
function UI.Trading_AdvertsWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for recordIdx = 1, self.advertsListWnd:GetNumRecords() do

		local data = self.advertsListWnd:GetRecordData( recordIdx )
		if data.advert.sender == uid then

			local slotWnd = self.advertsListWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnPlayerNameChanged()
			end

			break

		end

	end

end


--
function UI.Trading_AdvertsWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for recordIdx = 1, self.advertsListWnd:GetNumRecords() do

		local data = self.advertsListWnd:GetRecordData( recordIdx )

		local playerCid = UI:GetPlayerClanByUid( data.advert.sender )
		if playerCid == cid then

			local slotWnd = self.advertsListWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnPlayerClanNameChanged()
			end

		end

    end

end


--
function UI.Trading_AdvertsWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then

    	for recordIdx = 1, self.advertsListWnd:GetNumRecords() do

    		local data = self.advertsListWnd:GetRecordData( recordIdx )
    		if data.advert.sender == uid then

    			local slotWnd = self.advertsListWnd:GetButtonForRecord( recordIdx )
    			if slotWnd then
    				slotWnd:OnPlayerClanChanged()
    			end

    			break

    		end

    	end

	end

end


--
function UI.Trading_AdvertsWnd:MasterServer_OnBuyProductFromAdvert( result, requestId, param1, param2, u64Param )
	
	if result == _G.MasterServer.MailOpResult.MOR_OK then
	
		if self:IsOnScreen() then
			self.lastReloadTime = -1
			self:TryRequestAdverts()
		end
	
	else
	
		if requestId == self.buyFromAdvertRequestId then
			UI:ShowMessageOnBuyFromAdvertError( result )
		end
	
	end
	
	if requestId == self.buyFromAdvertRequestId then
		self.buyFromAdvertRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.Trading_AdvertsWnd:F_OnEventInvItemsChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdateItemCount()
	
end


-- ----------------------------
-- const
-- ----------------------------

UI.Trading_AdvertsWnd.effectInfo =
{
	work =
	{
		itemIcoLocator		= "icon5",
		advertsListLocator	= "list",
		reloadBtnLocator	= "reload",
		crossBtnLocator		= "btn_x",
	}
}

UI.Trading_AdvertsWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
	buy		= "sound/ui/apply",
}

UI.Trading_AdvertsWnd.RELOAD_DELAY	= 5

-- ----------------------------
-- vars
-- ----------------------------

UI.Trading_AdvertsWnd.defName					= ""
UI.Trading_AdvertsWnd.mainWndName				= ""
	
UI.Trading_AdvertsWnd.adverts					= {}
UI.Trading_AdvertsWnd.lastReloadTime			= -1
UI.Trading_AdvertsWnd.bWantReload				= false
UI.Trading_AdvertsWnd.advertGetRequestId		= 0
UI.Trading_AdvertsWnd.requestedDefName			= ""
UI.Trading_AdvertsWnd.hMsgBuyConfirm			= UI.INVALID_UI_HANDLE
UI.Trading_AdvertsWnd.advertToBuy				= nil
UI.Trading_AdvertsWnd.buyFromAdvertRequestId	= 0

UI.Trading_AdvertsWnd.itemIcoWnd				= nil
UI.Trading_AdvertsWnd.advertsListWnd			= nil
UI.Trading_AdvertsWnd.reloadBtn					= nil
UI.Trading_AdvertsWnd.crossBtn					= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_AdvertsWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:UpdateWaitingEffect()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )

end


--
function UI.Trading_AdvertsWnd:CreateControls()

	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.advertsListWnd	= UI.Trading_Adverts_AdvertsListWnd
	self.reloadBtn		= UI:CreateChildWnd( self, UI.Trading_ReloadBtn, "" )
	self.crossBtn		= UI:CreateChildWnd( self, UI.CrossBtn, "" )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	UI:AddChildAndLink( self, self.itemIcoWnd, workEffect, self.effectInfo.work.itemIcoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.advertsListWnd, workEffect, self.effectInfo.work.advertsListLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.reloadBtn, workEffect, self.effectInfo.work.reloadBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.crossBtn, workEffect, self.effectInfo.work.crossBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.Trading_AdvertsWnd:Reset()

	self.defName		= ""
	self.mainWndName	= ""	
	self.adverts		= {}
	self.bWantReload	= false
	
	self:HideChildModals()

	self:ResetContent()

end


--
function UI.Trading_AdvertsWnd:ResetContent()

	if UI:IsInRemovingAllWindows() then
		return
	end

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetText( "", self.layers.ITEM_COUNT )
	self.itemIcoWnd:Reset()
	self.advertsListWnd:Clear()

end


--
function UI.Trading_AdvertsWnd:UpdateContent()

	self:ResetContent()

	self:UpdateItemIco()
	self:UpdateItemName()
	self:UpdateItemCount()
	self:UpdateAdvertsList()
	self:UpdateWaitingEffect()

end


--
function UI.Trading_AdvertsWnd:UpdateItemIco()

	self.itemIcoWnd:SetupForItem( self.defName )

	local tooltipData = nil

	if UI:IsDefModule( self.defName ) then
	
		tooltipData = {}
		tooltipData.tooltipType 		= UI.tooltipTypes.MODULE
		tooltipData.defName				= self.defName
		tooltipData.compareShipData		= nil -- см.ниже
		
		local selShipItem = UI.HangarWnd:GetSelShipItem()
		if selShipItem then
			tooltipData.compareShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( selShipItem.vid, -1 )
		end

	else
		tooltipData = UI:GetTooltipForItem( self.defName )
	end

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Trading_AdvertsWnd:UpdateItemName()

	local str = UI:GetEntityLocalizedNameByDef( self.defName, true, false )
	self:SetText( str, self.layers.ITEM_NAME )
	
end


--
function UI.Trading_AdvertsWnd:UpdateItemCount()

	local str = ""

	if UI:IsDefResource( self.defName ) or UI:IsDefBlueprint( self.defName ) then

		local curCount	= UI:GetPlayerResourceCount( self.defName )
		local maxCount	= UI:GetPlayerResourceMaxCount( self.defName )

		str = UI:MakeItemStorageString( true, curCount, maxCount, 0, nil, false, self:GetColor( self.layers.ITEM_COUNT ) )
		
	elseif UI:IsDefModule( self.defName ) then
		
		local countTotal, storageData = UI:GetItemCount( self.defName )
		local count = storageData.inventory_total
		
		str = UI:MakeItemStorageString( true, count, -1, 0, nil, false, self:GetColor( self.layers.ITEM_COUNT ) )

	else
		sys.log( "UI.Trading_AdvertsWnd:UpdateItemCount()[ERROR]: unsupported item (\"%s\")", self.defName )
	end

	self:SetText( str, self.layers.ITEM_COUNT )

end


--
function UI.Trading_AdvertsWnd:UpdateAdvertsList()

	self.advertsListWnd:Clear()

	for idx, advert in ipairs( self.adverts ) do
		self.advertsListWnd:AddRecord( { advert = advert } )
	end

end


--
function UI.Trading_AdvertsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if wnd == self.crossBtn then

		self:Close( true )

	elseif UI:IsWndKindOf( wnd, "Trading_Adverts_BuyBtn" ) then
	
		if not self:IsWaiting() then

			local slotWnd = UI:GetAncestorKindOf( wnd, "Trading_Adverts_AdvertSlotWnd" ) 
			if slotWnd then
				self:TryBuyFromAdvert( slotWnd:GetRecordData().advert )
			else
				sys.log( "UI.Trading_AdvertsWnd:F_OnMouseLButtonDown()[ERROR]: cannot find advert slot for buy btn" )
			end
			
		end

	elseif wnd == self.reloadBtn then

		if not self:IsWaiting() then
			self:TryRequestAdverts()		
		end
		
	end

	return true

end


--
function UI.Trading_AdvertsWnd:OnEscape()

	self:Close( true )
	return true

end


--
function UI.Trading_AdvertsWnd:Close( bSound )

	if not self:IsOnScreen() then
		return
	end

	self:NotifyMainWnd()

	self:Hide()

	if bSound then
    	UI:PlayGlobalSound( self.sounds.hide )
	end

end


--
function UI.Trading_AdvertsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self.adverts = {}
	self:TryRequestAdverts()

	self:UpdateContent()

end


--
function UI.Trading_AdvertsWnd:F_OnAfterHideFromScreen()
	
	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end
	
	self:Reset()

end


--
function UI.Trading_AdvertsWnd:UpdateReloadTimer( dt )

	if self.lastReloadTime == -1 then
		return
	end

	local curTime = _G.TimerGetRealTime()
	if curTime >= self.lastReloadTime + self.RELOAD_DELAY then

		self.lastReloadTime = -1

		if self.bWantReload then
			self:TryRequestAdverts()
		end
		
	end

end


--
function UI.Trading_AdvertsWnd:TryRequestAdverts()

	self.bWantReload = false

	local bAlreadyRequested = self.advertGetRequestId ~= 0 and self.requestedDefName == self.defName
	if bAlreadyRequested then
		return
	end

	local bCanRequestNow = self.advertGetRequestId == 0 and self.lastReloadTime == -1
	if bCanRequestNow then
		self:DoRequestAdverts()
	else
		self.bWantReload = true
	end

end


--
function UI.Trading_AdvertsWnd:DoRequestAdverts()

	if self.advertGetRequestId ~= 0 then
		sys.log( "UI.Trading_AdvertsWnd:DoRequestAdverts()[ERROR: still waiting for another request" )
	end

	self.advertGetRequestId = _G.MasterServer_AdvertGet( self.defName )
	self:UpdateWaitingEffect()

	if self.advertGetRequestId ~= 0 then
		self.requestedDefName = self.defName
	else
		self.requestedDefName = ""
		self:ShowMsgOnAdvertGetError( _G.MasterServer.AdvertResult.AR_ERROR )
	end

	self.lastReloadTime = _G.TimerGetRealTime()

end


--
function UI.Trading_AdvertsWnd:ShowMsgOnAdvertGetError( errorCode )

	UI:ShowErrorMsg( "tradingItems_error_advertGet", errorCode, "_G.MasterServer.AdvertResult" )

end


--
function UI.Trading_AdvertsWnd:IsWaiting()

	return
		self.advertGetRequestId ~= 0
		or self.buyFromAdvertRequestId ~= 0

end


--
function UI.Trading_AdvertsWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.Trading_AdvertsWnd:IsAdvertsDataValid( data )

	if type( data ) ~= "table" then
		sys.log( "UI.Trading_AdvertsWnd:IsAdvertsDataValid()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( data ) )
		return false
	end

	if type( data.def ) ~= "string" then
    	sys.log( "UI.Trading_AdvertsWnd:IsAdvertsDataValid()[ERROR]: invalid type of field \"def\"; \"string\" expected, got \"%s\"", type( data.def ) )
		return false
	end

	if type( data.adverts ) ~= "table" then
		sys.log( "UI.Trading_AdvertsWnd:IsAdvertsDataValid()[ERROR]: invalid type of field \"adverts\"; \"table\" expected, got \"%s\"", type( data.adverts ) )
		return false
	end

	for idx, advert in pairs( data.adverts ) do

		if type( advert ) ~= "table" then
			sys.log( "UI.Trading_AdvertsWnd:IsAdvertsDataValid()[ERROR]: invalid type of field \"adverts[%s]\"; \"table\" expected, got \"%s\"", tostring( idx ), type( advert ) )
			return false
		end

		if type( advert.sender ) ~= "userdata" then
			sys.log( "UI.Trading_AdvertsWnd:IsAdvertsDataValid()[ERROR]: invalid type of field \"adverts[%s].sender\"; \"userdata\" expected, got \"%s\"", tostring( idx ), type( advert.sender ) )
			return false
		end

		if type( advert.goldPrice ) ~= "number" then
			sys.log( "UI.Trading_AdvertsWnd:IsAdvertsDataValid()[ERROR]: invalid type of field \"adverts[%s].goldPrice\"; \"number\" expected, got \"%s\"", tostring( idx ), type( advert.goldPrice ) )
			return false
		end

	end

	return true

end


--
function UI.Trading_AdvertsWnd:F_OnEventSaveUiState()

	self:Close( false )

	local tableName = self:GetScriptTableName()

	local t = {}
	UI.store[ tableName ] = t

	t.advertGetRequestId		= self.advertGetRequestId
	t.requestedDefName			= self.requestedDefName
	t.buyFromAdvertRequestId	= self.buyFromAdvertRequestId

end


--
function UI.Trading_AdvertsWnd:F_OnEventRestoreUiState()

	local tableName = self:GetScriptTableName()
	local t = UI.store[ tableName ]

	if t then

		self.advertGetRequestId 	= t.advertGetRequestId
		self.requestedDefName		= t.requestedDefName
		self.buyFromAdvertRequestId	= t.buyFromAdvertRequestId
		
		self:UpdateWaitingEffect()

		UI.store[ tableName ] = nil

	end

end


--
function UI.Trading_AdvertsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateReloadTimer( dt_sys )
	
end


--
function UI.Trading_AdvertsWnd:TryBuyFromAdvert( advert )
	
	if self:IsWaiting() then
		sys.log( "UI.Trading_AdvertsWnd:TryBuyFromAdvert()[ERROR]: still waiting for another request" )
		return
	end
	
	if self.hMsgBuyConfirm ~= UI.INVALID_UI_HANDLE then
		sys.log( "UI.Trading_AdvertsWnd:TryBuyFromAdvert()[ERROR]: confirm msg box is already on screen" )
		return
	end

	self.advertToBuy = advert
	self.hMsgBuyConfirm = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "tradingItems_adverts_buyConfirmMsg" ), UI.MBS_YES_NO )

end


--
function UI.Trading_AdvertsWnd:DoBuyFromAdvert( advert )
	
	if self.buyFromAdvertRequestId ~= 0 then
		sys.log( "UI.Trading_AdvertsWnd:DoBuyFromAdvert()[ERROR]: still waiting for another request" )
		return
	end
	
	if type( advert ) ~= "table" then
		sys.log( "UI.Trading_AdvertsWnd:DoBuyFromAdvert()[ERROR]: invalid parameter" )
		return
	end
	
	self.buyFromAdvertRequestId = _G.MasterServer_BuyProductFromAdvert( advert.advertId )
	
	if self.buyFromAdvertRequestId == 0 then
		UI:ShowMessageOnBuyFromAdvertError( _G.MasterServer.MailOpResult.MOR_ERROR )
	end
	
	self:UpdateWaitingEffect()

end


--
function UI.Trading_AdvertsWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgBuyConfirm then

		self.hMsgBuyConfirm = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if self.advertToBuy then
				self:DoBuyFromAdvert( self.advertToBuy )
			else
				sys.log( "UI.Trading_AdvertsWnd:F_OnEventMsgBoxRet()[ERROR]: no advert to buy stored" )
			end

			UI:PlayGlobalSound( self.sounds.buy )

		end

		self.advertToBuy = nil

	end

end


--
function UI.Trading_AdvertsWnd:ShowMsgOnBuyError( result )

	UI:ShowErrorMsg( "msg_buyError", result, "_G.MasterServer.MailOpResult" )

end


--
function UI.Trading_AdvertsWnd:HideChildModals()
	
	if UI:IsInRemovingAllWindows() then
		return
	end

	if self.hMsgBuyConfirm ~= UI.INVALID_UI_HANDLE then	
		UI:RemoveUiObj( self.hMsgBuyConfirm )
		self.hMsgBuyConfirm = UI.INVALID_UI_HANDLE
	end
	self.advertToBuy = nil

end


--
function UI.Trading_AdvertsWnd:NotifyMainWnd()

	if self.mainWndName == "" then
		return
	end

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.Trading_AdvertsWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if mainWnd.OnTradingAdvertsWndResult then
		mainWnd:OnTradingAdvertsWndResult( result, { defName = self.defName } )
	end

end


-- -------------------------------------------------------------------
-- UI.Trading_Adverts_AdvertsListWnd
-- -------------------------------------------------------------------

UI.Trading_Adverts_AdvertsListWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_Adverts_AdvertsListWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "Trading_Adverts_AdvertsListWnd",
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
				defName 			= "trading_adverts_advertsList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self105",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "name",
						layer		= "UI.Trading_Adverts_AdvertsListWnd.layers.HEADER_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "price",
						layer		= "UI.Trading_Adverts_AdvertsListWnd.layers.HEADER_COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "timer3",
						layer		= "UI.Trading_Adverts_AdvertsListWnd.layers.HEADER_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- HEADER_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tradingItems_adverts_header_name" ),
		},
		
		-- HEADER_COUNT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tradingItems_adverts_header_count" ),
		},
		
		-- HEADER_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tradingItems_adverts_header_price" ),
		},
	}
}

-- ----------------------------
-- const
-- ----------------------------

UI.Trading_Adverts_AdvertsListWnd.layers =
{
	MAIN_EFFECT		= 0,
	HEADER_NAME		= 1,
	HEADER_COUNT	= 2,
	HEADER_PRICE	= 3,
}

UI.Trading_Adverts_AdvertsListWnd.btnPrototypeName	= "Trading_Adverts_AdvertSlotWnd"
UI.Trading_Adverts_AdvertsListWnd.MAX_SLOTS			= 10
UI.Trading_Adverts_AdvertsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.Trading_Adverts_AdvertsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "ad_slot_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_Adverts_AdvertsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


-- -------------------------------------------------------------------
-- UI.Trading_Adverts_AdvertSlotWnd
-- -------------------------------------------------------------------

UI.Trading_Adverts_AdvertSlotWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_Adverts_AdvertSlotWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Trading_Adverts_AdvertSlotWnd",
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
				defName 			= "trading_adverts_advertSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.Trading_Adverts_AdvertSlotWnd.layers.PLAYER_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "price16",
						layer		= "UI.Trading_Adverts_AdvertSlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "price",
						layer		= "UI.Trading_Adverts_AdvertSlotWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PLAYER_NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_Adverts_AdvertSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self.playerNameMetaText:SetText( "", true )
	self.priceMetaText:SetText( "", true )
	self:SetText( "", self.layers.COUNT )
	self.buyBtn:UnlinkFromParent()

end


--
function UI.Trading_Adverts_AdvertSlotWnd:OnPlayerNameChanged()

	local data = self:GetRecordData()
	self:UpdatePlayerName( data )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:OnPlayerClanNameChanged()

	local data = self:GetRecordData()
	self:UpdatePlayerName( data )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:OnPlayerClanChanged()

	local data = self:GetRecordData()
	self:UpdatePlayerName( data )

end


-- ----------------------------
-- const
-- ----------------------------

UI.Trading_Adverts_AdvertSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    PLAYER_NAME	= 1,
	COUNT		= 2,
    PRICE		= 3,
}

UI.Trading_Adverts_AdvertSlotWnd.effectInfo =
{
	main =
	{
		contactBtnLocator	= "btn",
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.Trading_Adverts_AdvertSlotWnd.buyBtn				= nil
UI.Trading_Adverts_AdvertSlotWnd.priceMetaText		= nil
UI.Trading_Adverts_AdvertSlotWnd.playerNameMetaText	= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_Adverts_AdvertSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

	self.playerNameMetaText = UI.MetaText.GetNewInstance()
	self.playerNameMetaText:InitFromLayer( self, self.layers.PLAYER_NAME )

	self:CreateControls()

end


--
function UI.Trading_Adverts_AdvertSlotWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	if self.playerNameMetaText then
		self.playerNameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Trading_Adverts_AdvertSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Trading_Adverts_AdvertSlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
	self.playerNameMetaText:UpdateScreenOrgFromLayer( self, self.layers.PLAYER_NAME )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PLAYER_NAME then
		self.playerNameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Trading_Adverts_AdvertSlotWnd:CreateControls()

	self.buyBtn = UI:CreateChildWnd( self, UI.Trading_Adverts_BuyBtn, "" )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.buyBtn, mainEffect, self.effectInfo.main.contactBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdatePlayerName( data )
	self:UpdateCount( data )
	self:UpdatePrice( data )
	self:UpdateBuyBtn( data )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:UpdatePlayerName( data )

	local color = self:GetColor( self.layers.PLAYER_NAME )
	local uid = data.advert.sender

	local str = string.format( "$link [type PLAYER][params {uid=u64(%d,%d), bWithClan=true, bWithTooltip=false, colorSel=%u, colorUnsel=%u}]$", uid.h, uid.l, color, color )

	self.playerNameMetaText:SetText( str, true )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:UpdateCount( data )
	
	local count = data.advert.amount or 1
	local str = UI:Num2StrSeparatedBy3( count )
	self:SetText( str, self.layers.COUNT )

end


--
function UI.Trading_Adverts_AdvertSlotWnd:UpdatePrice( data )

	local strVal = ""
	
	local count = data.advert.amount or 1
	if count > 1 then
		local priceByPiece = data.advert.goldPrice / count
		priceByPiece = math.ceil( priceByPiece * 10 ) / 10	-- SC-112486
		strVal = string.format( "%s (%0.1f)", UI:Num2StrSeparatedBy3( data.advert.goldPrice ), priceByPiece )
	else
		strVal = UI:Num2StrSeparatedBy3( data.advert.goldPrice )
	end

	local priceInfo =
	{
    	priceType 	= _G.GameStore.CreditsType.CT_GOLD,
    	val			= data.advert.goldPrice,
    	bIsBuyPrice	= false,
		valAsString	= strVal,
	}

	local str = UI:PriceInfo2Str( priceInfo, nil, nil, nil, true, nil )
	self.priceMetaText:SetText( str, true )	
	
end


--
function UI.Trading_Adverts_AdvertSlotWnd:UpdateBuyBtn( data )

	local bNeedBtn = data.advert.sender ~= UI:GetLocalPlayerUid()

	if bNeedBtn then
		self:AddChild( self.buyBtn )
	else
		self.buyBtn:UnlinkFromParent()
	end

end


-- -------------------------------------------------------------------
-- UI.Trading_Adverts_BuyBtn
-- -------------------------------------------------------------------

UI.Trading_Adverts_BuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn5",

		props =
		{
			name		= "Trading_Adverts_BuyBtn",
			isPrototype	= true,
		}
	},

	textId = "shop_buy"
}

-- -------------------------------------------------------------------
-- UI.Trading_CreateAdvertWnd
-- -------------------------------------------------------------------

UI.Trading_CreateAdvertWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

--
UI.Trading_CreateAdvertWnd.layers =
{
	MAIN_EFFECT				= 0,
	BG_EFFECT				= 1,
	WORK_EFFECT				= 2,
	CAPTION					= 3,
	ITEM_NAME				= 4,
	INVENTORY_COUNT			= 5,
	TRADE_COUNT_LABEL		= 6,
	TRADE_COUNT_NO_STACK    = 7,
	MIN_PRICE				= 8,
	PRICE_LABEL				= 9,
	TRADING_TAX				= 10,
	FINAL_PRICE				= 11,
	WAIT_EFFECT				= 12,
	WAIT_TEXT				= 13,
}

--
UI.Trading_CreateAdvertWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "Trading_CreateAdvertWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_CHANGE_ACTIVE_CYCLED,
	},

	layers =
	{
		firstOverlayLayer = UI.Trading_CreateAdvertWnd.layers.WAIT_EFFECT,

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
						objName		= "ad_place_win",
						layer		= "UI.Trading_CreateAdvertWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- идет от FullScreenWnd
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
				defName 			= "trading_createAdvert_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Trading_CreateAdvertWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "product_name",
						layer		= "UI.Trading_CreateAdvertWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "count",
						layer		= "UI.Trading_CreateAdvertWnd.layers.INVENTORY_COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "price_3",
						layer		= "UI.Trading_CreateAdvertWnd.layers.TRADE_COUNT_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "price",
						layer		= "UI.Trading_CreateAdvertWnd.layers.TRADE_COUNT_NO_STACK",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "price_4",
						layer		= "UI.Trading_CreateAdvertWnd.layers.MIN_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "product_name10",
						layer		= "UI.Trading_CreateAdvertWnd.layers.PRICE_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "text_10",
						layer		= "UI.Trading_CreateAdvertWnd.layers.TRADING_TAX",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "text_11",
						layer		= "UI.Trading_CreateAdvertWnd.layers.FINAL_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load_modules",
						layer		= "UI.Trading_CreateAdvertWnd.layers.WAIT_EFFECT",
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
			text			= UI:GetStringByName( "tradingItems_createAdvert_caption" ),
		}, 

		-- ITEM_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		}, 

		-- INVENTORY_COUNT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- TRADE_COUNT_LABEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "itemCraft_count" ),
		},
		
		-- TRADE_COUNT_NO_STACK
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= string.format( "%s %d", UI:GetStringByName( "itemCraft_count" ), 1 ),
		},

		-- MIN_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- PRICE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "mailCreate_priceInputLabel" ),
		},
		
		-- TRADING_TAX
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- FINAL_PRICE
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
						layer		= "UI.Trading_CreateAdvertWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz 	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hangar_loading" ),
		},
	},
	
	children =
	{
		"UI.Trading_CreateAdvert_PriceEditWnd",
		"UI.Trading_CreateAdvert_TradeCountEditWnd",
		"UI.Trading_CreateAdvert_TradeCountLeftArrowBtn",
		"UI.Trading_CreateAdvertt_TradeCountRightArrowBtn",
		"UI.Trading_CreateAdvert_CreateBtn",
		"UI.Trading_CreateAdvert_GoldIcoWnd",
	}
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_CreateAdvertWnd:Setup( defName, iid )

	self:Reset()

	self.defName	= defName
	self.iid		= iid

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.Trading_CreateAdvertWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.advertCreateRequestId = 0
	self:UpdateWaitingEffect()

end


--
function UI.Trading_CreateAdvertWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.AdvertResult.AR_OK then

		if self:IsOnScreen() then
			self:Hide()
		end

	else

		if requestId == self.advertCreateRequestId then
			self:ShowMsgOnAdvertCreateError( result )
		end

	end

	if requestId == self.advertCreateRequestId then
		self.advertCreateRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.Trading_CreateAdvertWnd:OnEditMissMouse( editWnd )

	if editWnd:GetUiHandle() == UI:GetKeyboardFocus() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end

end


--
function UI.Trading_CreateAdvertWnd:F_OnEventInvItemsChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdateInventoryCount()
	
end


-- ----------------------------
-- const
-- ----------------------------

UI.Trading_CreateAdvertWnd.effectInfo =
{
	work =
	{
		itemIcoLocator				= "icon5",
		priceEditLocator			= "input",
		tradeCountEditLocator		= "input_2",
		tradeCountLeftArrowLocator	= "btn_left",
		tradeCountRightLocator		= "btn_left1",
		createBtnLocator			= "btn",
		crossBtnLocator				= "btn_x",
		goldIcoLocator				= "gold_icon",
	}
}

UI.Trading_CreateAdvertWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
	create	= UI.sounds.btnClick,
}

UI.Trading_CreateAdvertWnd.MAX_TRADE_COUNT = 99

-- ----------------------------
-- vars
-- ----------------------------

UI.Trading_CreateAdvertWnd.defName					= ""
UI.Trading_CreateAdvertWnd.iid						= UI.INVALID_U64_ID

UI.Trading_CreateAdvertWnd.advertCreateRequestId	= 0
UI.Trading_CreateAdvertWnd.priceTextToSet			= nil
UI.Trading_CreateAdvertWnd.tradeCountTextToSet		= nil

UI.Trading_CreateAdvertWnd.itemIcoWnd				= nil
UI.Trading_CreateAdvertWnd.desiredPriceEditWnd		= nil
UI.Trading_CreateAdvertWnd.tradeCountEditWnd		= nil
UI.Trading_CreateAdvertWnd.tradeCountLeftArrow		= nil
UI.Trading_CreateAdvertWnd.tradeCountRightArrow		= nil
UI.Trading_CreateAdvertWnd.createBtn				= nil
UI.Trading_CreateAdvertWnd.crossBtn					= nil
UI.Trading_CreateAdvertWnd.goldIcoWnd				= nil
UI.Trading_CreateAdvertWnd.minPriceMetaText			= nil

UI.Trading_CreateAdvertWnd.tradingTaxMetaText		= nil
UI.Trading_CreateAdvertWnd.finalPriceMetaText		= nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_CreateAdvertWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.minPriceMetaText = UI.MetaText.GetNewInstance()
	self.minPriceMetaText:InitFromLayer( self, self.layers.MIN_PRICE )
	
	self.tradingTaxMetaText = UI.MetaText.GetNewInstance()
	self.tradingTaxMetaText:InitFromLayer( self, self.layers.TRADING_TAX )
	self.finalPriceMetaText = UI.MetaText.GetNewInstance()
	self.finalPriceMetaText:InitFromLayer( self, self.layers.FINAL_PRICE )

	self:CreateControls()

	self:UpdateWaitingEffect()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )

end


--
function UI.Trading_CreateAdvertWnd:F_Shutdown()

	if self.minPriceMetaText then
		self.minPriceMetaText:Clear()
	end
	
	if self.tradingTaxMetaText then
		self.tradingTaxMetaText:Clear()
	end
	if self.finalPriceMetaText then
		self.finalPriceMetaText:Clear()
	end
	
	UI.Wnd.F_Shutdown( self )

end


--
function UI.Trading_CreateAdvertWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()
	
	-- чтобы поле ввода имело фокус при показе окна
	self:SetDefaultActivatableChild( self.desiredPriceEditWnd:GetName() )
	self:AddStyle( UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN )

end


--
function UI.Trading_CreateAdvertWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Trading_CreateAdvertWnd:UpdateMetaTextPos()

	self.minPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.MIN_PRICE )
	
	self.tradingTaxMetaText:UpdateScreenOrgFromLayer( self, self.layers.TRADING_TAX )
	self.finalPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.FINAL_PRICE )

end


--
function UI.Trading_CreateAdvertWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MIN_PRICE then
		self.minPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	
	elseif layerIdx == self.layers.TRADING_TAX then
		self.tradingTaxMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	elseif layerIdx == self.layers.FINAL_PRICE then
		self.finalPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	
	end

end


--
function UI.Trading_CreateAdvertWnd:CreateControls()

	self.itemIcoWnd				= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.desiredPriceEditWnd	= UI.Trading_CreateAdvert_PriceEditWnd
	self.tradeCountEditWnd		= UI.Trading_CreateAdvert_TradeCountEditWnd
	self.tradeCountLeftArrow	= UI.Trading_CreateAdvert_TradeCountLeftArrowBtn
	self.tradeCountRightArrow	= UI.Trading_CreateAdvertt_TradeCountRightArrowBtn
	self.createBtn				= UI.Trading_CreateAdvert_CreateBtn
	self.crossBtn				= UI:CreateChildWnd( self, UI.CrossBtn, "" )
	self.goldIcoWnd				= UI.Trading_CreateAdvert_GoldIcoWnd

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	UI:AddChildAndLink( self, self.itemIcoWnd, workEffect, self.effectInfo.work.itemIcoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.desiredPriceEditWnd, workEffect, self.effectInfo.work.priceEditLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.tradeCountEditWnd, workEffect, self.effectInfo.work.tradeCountEditLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.tradeCountLeftArrow, workEffect, self.effectInfo.work.tradeCountLeftArrowLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.tradeCountRightArrow, workEffect, self.effectInfo.work.tradeCountRightLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.createBtn, workEffect, self.effectInfo.work.createBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.crossBtn, workEffect, self.effectInfo.work.crossBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.goldIcoWnd, workEffect, self.effectInfo.work.goldIcoLocator, UI.EffectAnimParams.POS )

end


--
function UI.Trading_CreateAdvertWnd:Reset()

	self.defName	= ""
	self.iid		= UI.INVALID_U64_ID

	self:ResetContent()

end


--
function UI.Trading_CreateAdvertWnd:ResetContent()

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetText( "", self.layers.INVENTORY_COUNT )
	self.itemIcoWnd:Reset()
	self.minPriceMetaText:SetText( "", true )
	self.desiredPriceEditWnd:SetEditText( "" )
	
	self.tradingTaxMetaText:SetText( "", true )
	self.finalPriceMetaText:SetText( "", true )
	
	self.tradeCountEditWnd:UnlinkFromParent()
	self.tradeCountLeftArrow:UnlinkFromParent()
	self.tradeCountRightArrow:UnlinkFromParent()
	self:SetLayerVisible( false, self.layers.TRADE_COUNT_LABEL )
	self:SetLayerVisible( false, self.layers.TRADE_COUNT_NO_STACK )

end


--
function UI.Trading_CreateAdvertWnd:FullUpdate()

	self:ResetContent()

	self:UpdateItemIco()
	self:UpdateItemName()
	self:UpdateInventoryCount()
	self:UpdateTradeCountControls()
	self:UpdateMinPrice()
	self:UpdateTradingTax()
	self:UpdateFinalPrice()
	self:UpdateCreateBtnState()
	
	if self.priceTextToSet then
		self.desiredPriceEditWnd:SetEditText( self.priceTextToSet )
		self.priceTextToSet = nil
	end
	
	if self.tradeCountTextToSet then
		self.tradeCountEditWnd:SetEditText( self.tradeCountTextToSet )
		self:OnTradeCountChanged()
		self.tradeCountTextToSet = nil
	end

end


--
function UI.Trading_CreateAdvertWnd:UpdateItemIco()

	local bEnchanted = self.iid ~= UI.INVALID_U64_ID and UI:IsInventoryItemEnchantedById( self.iid )
	self.itemIcoWnd:SetupForItem( self.defName, bEnchanted )

	local tooltipData = nil

	if UI:IsDefModule( self.defName ) then
		
		tooltipData = {}
		tooltipData.tooltipType 		= UI.tooltipTypes.MODULE
		tooltipData.defName				= self.defName
		tooltipData.iid					= self.iid
		tooltipData.compareShipData		= nil -- см.ниже
		tooltipData.bEnchanted			= bEnchanted
		
		local selShipItem = UI.HangarWnd:GetSelShipItem()
		if selShipItem then
			tooltipData.compareShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( selShipItem.vid, -1 )
		end

	else
		tooltipData = UI:GetTooltipForItem( self.defName )
	end

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Trading_CreateAdvertWnd:UpdateItemName()

	local str = UI:GetEntityLocalizedNameByDef( self.defName, true, false )
	self:SetText( str, self.layers.ITEM_NAME )
	
end


--
function UI.Trading_CreateAdvertWnd:UpdateInventoryCount()

	local str = ""

	if UI:IsDefResource( self.defName ) or UI:IsDefBlueprint( self.defName ) then

		local curCount	= UI:GetPlayerResourceCount( self.defName )
		local maxCount	= UI:GetPlayerResourceMaxCount( self.defName )

		str = UI:MakeItemStorageString( true, curCount, maxCount, 0, nil, false, self:GetColor( self.layers.INVENTORY_COUNT ) )
		
	elseif UI:IsDefModule( self.defName ) then
		
		local countTotal, storageData = UI:GetItemCount( self.defName )
		local count = storageData.inventory_total

		str = UI:MakeItemStorageString( true, count, -1, 0, nil, true, self:GetColor( self.layers.INVENTORY_COUNT ) )

	else
		sys.log( "UI.Trading_CreateAdvertWnd:UpdateInventoryCount()[ERROR]: unsupported item (\"%s\")", self.defName )
	end

	self:SetText( str, self.layers.INVENTORY_COUNT )

end



--
function UI.Trading_CreateAdvertWnd:UpdateTradeCountControls()
	
	local bStackable = UI:IsDefResource( self.defName ) or UI:IsDefBlueprint( self.defName )
	
	if( bStackable ) then
	
		self:AddChild( self.tradeCountEditWnd )
		self:AddChild( self.tradeCountLeftArrow )
		self:AddChild( self.tradeCountRightArrow )
		self:SetLayerVisible( true, self.layers.TRADE_COUNT_LABEL )
		self:SetLayerVisible( false, self.layers.TRADE_COUNT_NO_STACK )
		
		self:SetTradeCount( 1 )
		self:UpdateTradeCountArrowsState()
	
	else
	
		self.tradeCountEditWnd:UnlinkFromParent()
		self.tradeCountLeftArrow:UnlinkFromParent()
		self.tradeCountRightArrow:UnlinkFromParent()
		self:SetLayerVisible( false, self.layers.TRADE_COUNT_LABEL )
		self:SetLayerVisible( true, self.layers.TRADE_COUNT_NO_STACK )
	
	end

end


--
function UI.Trading_CreateAdvertWnd:UpdateMinPrice()

	local minPrice = UI:GetTradingItemMinGoldPrice( self.defName ) * self:GetTradeCount()

	local priceInfo =
	{
		priceType 	= _G.GameStore.CreditsType.CT_GOLD,
		val			= minPrice,
		bIsBuyPrice	= false,
	}

	local strValLink = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.MIN_PRICE ), nil, nil, true, nil )
	local str = string.format( "%s: %s", UI:GetStringByName( "mailCreate_tradingMinPrice" ), strValLink )

	self.minPriceMetaText:SetText( str, true )

end


--
function UI.Trading_CreateAdvertWnd:UpdateTradingTax()
	
	local tradeMoney = _G.MasterServer_GetTradeMoney()	-- возвращает u64
	local desiredPrice = self:GetDesiredPrice()

	local currentTax = UI:GetTax( tradeMoney )
	local futureTax = UI:GetTax( tradeMoney + desiredPrice )
	
	local currentTaxFixed = UI:Round( currentTax * 100 )
	local futureTaxFixed = UI:Round( futureTax * 100 )
	
	local str = string.format( "%s: %s%% (%s%%)", UI:GetStringByName( "mailCreate_tradingTax" ), currentTaxFixed, futureTaxFixed )
	local strLinkTax = string.format( "$link [type CUSTOM_TEXT][params {text=\"%s\", tooltipTextId=\"trading_taxTooltip_text\", tooltipCaptionId=\"trading_taxTooltip_caption\", colorSel=%u, colorUnsel=%u}]$", str, self:GetColor( self.layers.TRADING_TAX ), self:GetColor( self.layers.TRADING_TAX ) )

	self.tradingTaxMetaText:SetText( strLinkTax, true )

end


--
function UI.Trading_CreateAdvertWnd:UpdateFinalPrice()

	local tradeMoney = _G.MasterServer_GetTradeMoney()	-- возвращает u64
	local desiredPrice = self:GetDesiredPrice()
	
	local taxForPrice = UI:GetTaxForPrice( tradeMoney, desiredPrice )
	local finalPrice = desiredPrice - taxForPrice
	local percentTax = taxForPrice > 0 and taxForPrice / desiredPrice or 0
	
	local priceInfo =
	{
		priceType 	= _G.GameStore.CreditsType.CT_GOLD,
		val			= finalPrice,
		bIsBuyPrice	= false,
	}

	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.FINAL_PRICE ), nil, nil, true, nil )
	
	-- округляется до одного знака после запятой в большую сторону SC-112434#focus=streamItem-4-613073.0-0
	local taxFixed = percentTax * 100
	taxFixed = math.ceil( taxFixed * 10 ) / 10
	local strTax = string.format( "%.01f", taxFixed )
	
	local str = string.format( "%s: %s (-%s%%)", UI:GetStringByName( "mailCreate_tradingSum" ), strPrice, strTax )
	
	self.finalPriceMetaText:SetText( str, true )

end


--
function UI.Trading_CreateAdvertWnd:UpdateCreateBtnState()

	local bEnable		= true
	local tooltipText	= ""

	local tradeCount	= self:GetTradeCount()
	local desiredPrice	= self:GetDesiredPrice()
	
	if bEnable then
	
		if tradeCount == 0 then
			bEnable		= false
			tooltipText	= UI:GetStringByName( "msg_tradingError_amount_zero" )
		end
	
	end
	
	if bEnable then
	
		if UI:IsDefResource( self.defName ) or UI:IsDefBlueprint( self.defName ) then
		
			local maxCount = UI:GetPlayerResourceMaxCount( self.defName )
			if maxCount ~= -1 and tradeCount > maxCount then
			
				bEnable = false
				
				tooltipText	= UI:GetStringByName( "msg_tradingError_amount_capExceeded" )
				
				local strCap = UI:Num2StrSeparatedBy3( maxCount )
				
				local numSubst = 0
				tooltipText, numSubst = string.gsub( tooltipText, "%$cap%$", strCap )
				
				if numSubst == 0 then
					sys.log( "UI.Trading_CreateAdvertWnd:UpdateCreateBtnState()[ERROR]: cannot find placeholder \"$cap$\" in string \"msg_tradingError_amount_capExceeded\"" )
					tooltipText = string.format( "[INVALID SRTRING] Cap exceeded: %s", strCap )
				end
				
			end
			
		end
	
	end

	
	if bEnable then
	
		if desiredPrice < UI:GetTradingItemMinGoldPrice( self.defName ) * tradeCount then
			bEnable		= false
			tooltipText	= UI:GetStringByName( "msg_tradingError_smallPrice" )
		end
		
	end
	
	if bEnable then

		local maxPrice = UI:GetTradingLetterMaxGoldPrice()
		if maxPrice ~= 0 and desiredPrice > maxPrice then
		
			bEnable = false

			tooltipText = UI:GetStringByName( "msg_tradingError_largePrice" )
			local strMaxPrice = UI:Num2StrSeparatedBy3( maxPrice )

			local numSubst = 0
			tooltipText, numSubst = string.gsub( tooltipText, "%$val%$", strMaxPrice )

			if numSubst == 0 then
				sys.log( "UI.Trading_CreateAdvertWnd:UpdateCreateBtnState()[ERROR]: cannot find placeholder \"$val$\" in string \"msg_tradingError_largePrice\"" )
				tooltipText = string.format( "[INVALID STRING] The sum must be less than %s.", strMaxPrice )
			end

		end
		
	end
	
	self.createBtn:SetGray( not bEnable )
	
	local tooltipData = nil
	
	if tooltipText ~= "" then
	
		tooltipData = {}
		tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		tooltipData.caption		= UI:GetStringByName( "msgCapt_error" )
		tooltipData.text		= tooltipText
		
	else
	
		if not bEnable then
			sys.log( "UI.Trading_CreateAdvertWnd:UpdateCreateBtnState()[ERROR]: no tooltip text for disabled btn" )
		end
		
	end
	
	self.createBtn:SetTooltipData( tooltipData )

end


--
function UI.Trading_CreateAdvertWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if wnd == self.crossBtn then

		self:Hide()
		UI:PlayGlobalSound( self.sounds.hide )

	elseif wnd == self.createBtn then
		
		if not self.createBtn:IsGray() and not self:IsWaiting() then
			self:CreateAdvert()
			UI:PlayGlobalSound( self.sounds.create )
		end
		
	elseif wnd == self.tradeCountLeftArrow then
		self:SetTradeCount( self:GetTradeCount() - 1 )

	elseif wnd == self.tradeCountRightArrow then
		self:SetTradeCount( self:GetTradeCount() + 1 )
	end

	return true

end


-- перегрузка базовой реализации FullScreenWnd() - нужна дефолтная обработка клавиши tab, которая бы переключала фокус между полями ввода
function UI.Trading_CreateAdvertWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
		return true
	else 
		return self:HandleKey( key, -2 )
	end

end


--
function UI.Trading_CreateAdvertWnd:OnEscape()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	return true

end


--
function UI.Trading_CreateAdvertWnd:OnEnter()

	if not self:IsWaiting() and self.createBtn:IsEnabled() and not self.createBtn:IsGray() then
		self:CreateAdvert()
		UI:PlayGlobalSound( self.sounds.create )
	end

	return true

end


--
function UI.Trading_CreateAdvertWnd:GetDesiredPrice()

	local text = self.desiredPriceEditWnd:GetEditText()
	return tonumber( text ) or 0

end


--
function UI.Trading_CreateAdvertWnd:GetTradeCount()

	if self.tradeCountEditWnd:IsChildOf( self ) then
		local text = self.tradeCountEditWnd:GetEditText()
		return tonumber( text ) or 0
	else
		return 1
	end
	
end


--
function UI.Trading_CreateAdvertWnd:SetTradeCount( count )

	if not self.tradeCountEditWnd:IsChildOf( self ) then

		if count ~= 1 then
			sys.log( "UI.Trading_CreateAdvertWnd:SetTradeCount()[ERROR]: trade count edit wnd is not on screen" )
		end

		return

	end

    self.tradeCountEditWnd:SetEditText( tostring( count ) )

end


--
function UI.Trading_CreateAdvertWnd:F_OnEventEditChange( hSender, eventSrc )

	if hSender == self.tradeCountEditWnd:GetUiHandle() then

		if self.tradeCountEditWnd:IsChildOf( self ) then

			if eventSrc ~= UI.EVENT_SRC_UNKNOWN then
	
				local count = self:GetTradeCount()
				local countFixed = UI:Clamp( count, 0, self.MAX_TRADE_COUNT )
	
				if countFixed ~= count then
					self:SetTradeCount( countFixed )
				end
	
			end
	
			self:OnTradeCountChanged()
	
		end
		
	elseif hSender == self.desiredPriceEditWnd:GetUiHandle() then
	
		self:OnDesiredPriceChanged()

	end

end


--
function UI.Trading_CreateAdvertWnd:OnTradeCountChanged()

	self:UpdateTradeCountArrowsState()
	self:UpdateMinPrice()
	self:UpdateCreateBtnState()
	
end


--
function UI.Trading_CreateAdvertWnd:OnDesiredPriceChanged()
	
	self:UpdateTradingTax()
	self:UpdateFinalPrice()
	self:UpdateCreateBtnState()
	
end


--
function UI.Trading_CreateAdvertWnd:UpdateTradeCountArrowsState()

	if not self.tradeCountEditWnd:IsChildOf( self ) or not self.tradeCountLeftArrow:IsChildOf( self ) or not self.tradeCountRightArrow:IsChildOf( self ) then
		sys.log( "UI.Trading_CreateAdvertWnd:UpdateTradeCountArrowsState()[ERROR]: elements are not on screen" )
		return
	end

	local tradeCount = self:GetTradeCount()

	self.tradeCountLeftArrow:Enable( tradeCount > 1 )
	self.tradeCountRightArrow:Enable( tradeCount < self.MAX_TRADE_COUNT )

end


--
function UI.Trading_CreateAdvertWnd:CreateAdvert()

	if self:IsWaiting() then
		sys.log( "UI.Trading_CreateAdvertWnd:CreateAdvert()[ERROR]: still waiting for another request" )
		return
	end
	
	if not self.createBtn:IsEnabled() or self.createBtn:IsGray() then
		sys.log( "UI.Trading_CreateAdvertWnd:CreateAdvert()[ERROR]: create btn is disabled" )
		return
	end
	
	if UI:IsDefResource( self.defName ) or UI:IsDefBlueprint( self.defName ) then
		self.advertCreateRequestId	= _G.MasterServer_AdvertCreate( _G.MasterServer.AdvertType.AT_RESOURCE, self:GetDesiredPrice(), self.defName, self:GetTradeCount() )
		
	elseif UI:IsDefModule( self.defName ) then
		self.advertCreateRequestId	= _G.MasterServer_AdvertCreate( _G.MasterServer.AdvertType.AT_ITEM, self:GetDesiredPrice(), self.iid )
		
	else
		sys.log( "UI.Trading_CreateAdvertWnd:CreateAdvert()[ERROR]: unhandled item type (%s)", self.defName )
		self.advertCreateRequestId = 0
	end
	
	self:UpdateWaitingEffect()

	if self.advertCreateRequestId == 0 then
		self:ShowMsgOnAdvertCreateError( _G.MasterServer.AdvertResult.AR_ERROR )
	end

end


--
function UI.Trading_CreateAdvertWnd:ShowMsgOnAdvertCreateError( errorCode )

	UI:ShowErrorMsg( "tradingItems_error_advertCreate", errorCode, "_G.MasterServer.AdvertResult" )

end


--
function UI.Trading_CreateAdvertWnd:IsWaiting()

	return self.advertCreateRequestId ~= 0

end


--
function UI.Trading_CreateAdvertWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.Trading_CreateAdvertWnd:F_OnEventSaveUiState()

	local tableName = self:GetScriptTableName()
	
	local t = {}
	UI.store[ tableName ] = t

	t.advertCreateRequestId = self.advertCreateRequestId

	if self:IsOnScreen() then

		t.defName	= self.defName
		t.iid		= self.iid
		t.priceText	= self.desiredPriceEditWnd:GetEditText()
		
		if self.tradeCountEditWnd:IsChildOf( self ) then
			t.tradeCounttText = self.tradeCountEditWnd:GetEditText()
		end

	end


end


--
function UI.Trading_CreateAdvertWnd:F_OnEventRestoreUiState()

	local tableName = self:GetScriptTableName()
	local t = UI.store[ tableName ]

	if t then

		self.advertCreateRequestId = t.advertCreateRequestId
		self:UpdateWaitingEffect()

		if t.defName and t.defName ~= "" then

			self.priceTextToSet = t.priceText
			self.tradeCountTextToSet = t.tradeCounttText
			
			self:Setup( t.defName, t.iid )

		end

		UI.store[ tableName ] = nil

	end

end


-- -------------------------------------------------------------------
-- UI.Trading_CreateAdvert_PriceEditWnd
-- -------------------------------------------------------------------

UI.Trading_CreateAdvert_PriceEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "Trading_CreateAdvert_PriceEditWnd",
    		symbolsLimit	= 9,
			editStyle		= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL + UI.ES_NUM,
			forbiddenChars	= "+-.",
	     	activationOrder	= 1,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "trading_createAdvert_priceEdit",
    				defaultAnimation    = "deselect",

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

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "login",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "deselect",
			animDisabled			= "disable",
    	}
    }
}


-- -------------------------------------------------------------------
-- UI.Trading_CreateAdvert_TradeCountEditWnd
-- -------------------------------------------------------------------

UI.Trading_CreateAdvert_TradeCountEditWnd =
{
	def =
	{   	
		className	= "EditWnd",
		prototype	= "ItemCraft_CraftCountEditWnd",
	
		props =
		{
			name			= "Trading_CreateAdvert_TradeCountEditWnd",
			activationOrder	= 0,
		},
	}
}


-- ---------------------------------------------------------------------------------------
-- UI.Trading_CreateAdvert_TradeCountLeftArrowBtn, UI.Trading_CreateAdvertt_TradeCountRightArrowBtn
-- ---------------------------------------------------------------------------------------

--
UI.Trading_CreateAdvert_TradeCountLeftArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Trading_CreateAdvert_TradeCountLeftArrowBtn",
    		selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
					defName 			= "shop_buy_slider_leftBtn",
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
	},
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "disable",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}


--
UI.Trading_CreateAdvertt_TradeCountRightArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Trading_CreateAdvertt_TradeCountRightArrowBtn",
    		selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
					defName 			= "shop_buy_slider_rightBtn",
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
	},
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "press",
			animationDisabled		= "disable",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}

-- -------------------------------------------------------------------
-- UI.Trading_CreateAdvert_CreateBtn
-- -------------------------------------------------------------------

UI.Trading_CreateAdvert_CreateBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name		= "Trading_CreateAdvert_CreateBtn",
		}
	},

	textId = "trading_createAdvert_createBtn"
}

-- -------------------------------------------------------------------
-- UI.Trading_CreateAdvert_GoldIcoWnd
-- -------------------------------------------------------------------

UI.Trading_CreateAdvert_GoldIcoWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.Trading_CreateAdvert_GoldIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Trading_CreateAdvert_GoldIcoWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "shop_items_slot_priceIco",
				defaultAnimation    = "gold",

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

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.Trading_CreateAdvert_GoldIcoWnd:GetTooltipData()

	return self.tooltipData

end

-- ----------------------------
-- vars
-- ----------------------------

UI.Trading_CreateAdvert_GoldIcoWnd.tooltipData = nil

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.Trading_CreateAdvert_GoldIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	-- хoтя тултип никогда не меняется, его нельзя инициализировать при создании окна,
	-- т.к. используется таблица _G.GameStore, которая загружается позже ui

	if not self.tooltipData then
		self:InitTooltip()
	end

end


--
function UI.Trading_CreateAdvert_GoldIcoWnd:InitTooltip()

	if self.tooltipData then
		return
	end

	self.tooltipData =
    {
    	tooltipType	= UI.tooltipTypes.PRICE,

    	priceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_GOLD,
    		bIsBuyPrice	= false,
    		val			= 0,
    	}
	}

end