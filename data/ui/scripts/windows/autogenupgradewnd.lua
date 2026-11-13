-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgradeWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgradeWnd = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.AutogenUpgradeWnd.layers =
{
	MAIN_EFFECT			= 0,
	BG_EFFECT			= 1,
	WORK_EFFECT			= 2,
	CAPTION				= 3,
	NAME				= 4,
	DONOR_LIST_HEADER	= 5,
	PRICE				= 6, 
	WAIT_EFFECT			= 7,
	WAIT_TEXT			= 8,
}

UI.AutogenUpgradeWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "AutogenUpgrade_DonorListWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.AutogenUpgradeWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "help_main_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "update_ag_mod",
						layer		= "UI.AutogenUpgradeWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- наследие от FullScreenWnd
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
				defName 			= "autogenUpgrade_work",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "title3",
						layer		= "UI.AutogenUpgradeWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "name",
						layer		= "UI.AutogenUpgradeWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "description",
						layer		= "UI.AutogenUpgradeWnd.layers.DONOR_LIST_HEADER",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "count2",
						layer		= "UI.AutogenUpgradeWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "prod_icon",
						wnd			= "UI.AutogenUpgrade_IcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "progr1",
						wnd			= "UI.AutogenUpgrade_ProgressWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "mod_list",
						wnd			= "UI.AutogenUpgrade_DonorListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn",
						wnd			= "UI.AutogenUpgrade_UpgradeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x3",
						wnd			= "UI.AutogenUpgrade_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "loading",
						layer		= "UI.AutogenUpgradeWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bookmarks",
						wnd			= "UI.AutogenUpgrade_DonorModeTabsWnd",
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
			text			= UI:GetStringByName( "autogenUpgrade_caption" ),
		},
		
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- DONOR_LIST_HEADER
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "autogenUpgrade_donorList_header" ),
		},
		
		-- PRICE
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
				defName 			= "hangar_waitCircleLarge_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.AutogenUpgradeWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= "^hangar_loading"
		},
	},
	
	children =
	{
		"UI.AutogenUpgrade_IcoWnd",
		"UI.AutogenUpgrade_ProgressWnd",
		"UI.AutogenUpgrade_DonorListWnd",
		"UI.AutogenUpgrade_UpgradeBtn",
		"UI.AutogenUpgrade_CrossBtn",
		"UI.AutogenUpgrade_DonorModeTabsWnd",
	}
}

-- --------------------------------------------
-- interface functions
-- --------------------------------------------

--
function UI.AutogenUpgradeWnd:Setup( iid, mainWndName )

	if type( iid ) ~= "userdata" then
		sys.log( "UI.AutogenUpgradeWnd()[ERROR]: invalid type of the 1-st param ('iid'); 'userdata' expected, got '%s'", type( iid ) )
		return
	end
	
	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.AutogenUpgradeWnd()[ERROR]: invalid iid")
		return
	end
	
	if mainWndName ~= nil then
		if type( mainWndName ) ~= "string" then
			sys.log( "UI.AutogenUpgradeWnd()[ERROR]: invalid type of the 2-nd param ('mainWndName'); 'string' or 'nil' expected, got '%s'", type( mainWndName ) )
			mainWndName = nil
		end
	end
	
	if mainWndName == nil then
		mainWndName = ""
	end

	self:Reset()
	
	self.iid = iid
	self.mainWndName = mainWndName
	
	self.defName = UI:Iid2DefName( self.iid )
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.AutogenUpgradeWnd:GetMainWndName()

	return self.mainWndName

end


--
function UI.AutogenUpgradeWnd:OnDonorItemsCountChanged()

	if not self:IsOnScreen() then
		return
	end
	
	if self.bLockUpdateOnSelDonorItemsChange then
		return
	end
	
	local oldLevel = self.upgradeResult.newUpgradeLevel or 0
	self.addExp = self:CalcAddExp()
	self.upgradeResult = _G.GameStore_GetAutogenItemUpgradeResult( self.iid, self.addExp ) or {}
	
	self:UpdateProgress()
	self:UpdatePrice()
	self:UpdateUpgradeBtn()
	
	local newUpgradeLevel = self.upgradeResult.newUpgradeLevel or 0
	if oldLevel ~= newUpgradeLevel then
		self:UpdateIco()
		self:UpdateName()
	end
	
end


--
function UI.AutogenUpgradeWnd:GameStore_OnUpgradeAutogenItem( result, requestId, params )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then
	
		if self:IsOnScreen() then
		
			local iid = params.iid
			if iid == self.iid and requestId == self.upgradeRequestId then
				self:Hide() -- если апгрейд прошел успешно, то скрываем окно
			end
		
		end
	
	else
	
		if requestId == self.upgradeRequestId then
			self:ShowMsgOnUpgradeError( result )
		end
	
	end
	
	if requestId == self.upgradeRequestId and self:IsOnScreen() and self.isDirty then	-- пока ждали реквеста мы не апдейтили
		self:FullUpdate( true ) -- если операция прошла успешно, то сюда не придем, т.к. окно уже скрыли
	end
	
	if requestId == self.upgradeRequestId then
		self.upgradeRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.AutogenUpgradeWnd:F_OnEventInvItemsChanged()

	if self:IsOnScreen() then
	
		if self.upgradeRequestId == 0 then
			self:FullUpdate( true )
		else
			self.isDirty = true	-- не апдейтим пока ждем реквеста, потому что после него все равно окно закроется
		end
		
	end

end


--
function UI.AutogenUpgradeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if result == 0 and self:IsOnScreen() then
		self:OnResourcesChanged()
	end

end


--
function UI.AutogenUpgradeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if result == 0 and self:IsOnScreen() then
		self:OnResourcesChanged()
	end

end


--
function UI.AutogenUpgradeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if result == 0 and self:IsOnScreen() then
		self:OnResourcesChanged()
	end

end


--
function UI.AutogenUpgradeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if result == 0 and self:IsOnScreen() then
		self:OnResourcesChanged()
	end

end


--
function UI.AutogenUpgradeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if result == 0 and self:IsOnScreen() then
		self:OnResourcesChanged()
	end

end


--
function UI.AutogenUpgradeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	if result == 0 and self:IsOnScreen() then
		self:OnResourcesChanged()
	end

end


--
function UI.AutogenUpgradeWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.upgradeRequestId = 0
	self:UpdateWaitingEffect()
	
end


--
function UI.AutogenUpgradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	
	if result == 0 and self:IsOnScreen() then
	
		self:UpdatePrice()
		self:UpdateUpgradeBtn()

	end

end


-- --------------------------------------------
-- const
-- --------------------------------------------

UI.AutogenUpgradeWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
	upgrade	= "sound/ui/ModuleUpgrade",
}

UI.AutogenUpgradeWnd.donorModes =
{
	ALL			= 1,
	AUTOGEN		= 2,
	RESOURCES	= 3,
}

UI.AutogenUpgradeWnd.DEFAULT_DONOR_MODE = UI.AutogenUpgradeWnd.donorModes.ALL

UI.AutogenUpgradeWnd.DONOR_TOOLTIP_SPACE_X = 5

-- --------------------------------------------
-- vars
-- --------------------------------------------

UI.AutogenUpgradeWnd.iid								= UI.INVALID_U64_ID
UI.AutogenUpgradeWnd.mainWndName						= ""

UI.AutogenUpgradeWnd.icoWnd								= nil
UI.AutogenUpgradeWnd.progressWnd						= nil
UI.AutogenUpgradeWnd.donorListWnd						= nil
UI.AutogenUpgradeWnd.upgradeBtn							= nil
UI.AutogenUpgradeWnd.crossBtn							= nil
UI.AutogenUpgradeWnd.upgradeRequestId					= 0
UI.AutogenUpgradeWnd.priceMetaText						= nil
UI.AutogenUpgradeWnd.donorModeTabsWnd					= nil


UI.AutogenUpgradeWnd.defName							= ""
UI.AutogenUpgradeWnd.donorItemsToSelect					= nil
UI.AutogenUpgradeWnd.bLockUpdateOnSelDonorItemsChange	= false
UI.AutogenUpgradeWnd.addExp								= 0
UI.AutogenUpgradeWnd.upgradeResult						= {}
UI.AutogenUpgradeWnd.donorMode							= -1
UI.AutogenUpgradeWnd.isDirty							= false		-- флаг, что были какие-то изменения в данных игрока и надо сделать апдейт окна

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.AutogenUpgradeWnd:F_PostLoad()
	
	UI.FullScreenWnd.F_PostLoad( self )
	
	self.icoWnd				= UI.AutogenUpgrade_IcoWnd
	self.progressWnd		= UI.AutogenUpgrade_ProgressWnd
	self.donorListWnd		= UI.AutogenUpgrade_DonorListWnd
	self.upgradeBtn			= UI.AutogenUpgrade_UpgradeBtn
	self.crossBtn			= UI.AutogenUpgrade_CrossBtn
	self.donorModeTabsWnd	= UI.AutogenUpgrade_DonorModeTabsWnd
	
	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )	
	
	self:UpdateWaitingEffect()
	self.donorModeTabsWnd:Init()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )
	
end


--
function UI.AutogenUpgradeWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.AutogenUpgradeWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )
	
	self:UpdateMetaTextPos()

end


--
function UI.AutogenUpgradeWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.AutogenUpgradeWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.AutogenUpgradeWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.AutogenUpgradeWnd:Reset()
	
	self.iid			= UI.INVALID_U64_ID
	self.mainWndName	= ""
	self.defName		= ""
	self.addExp			= 0
	self.upgradeResult	= {}
	self.isDirty		= false
	
	self:ResetContent()	
	
end


--
function UI.AutogenUpgradeWnd:ResetContent()

	self.donorMode = -1

	self:SetText( "", self.layers.NAME )
	self.priceMetaText:SetText( "", true )
	self.icoWnd:Reset()
	self.progressWnd:Reset()
	self.donorListWnd:Reset()
	self.upgradeBtn:Enable( false )	
	self.donorModeTabsWnd:SetDonorMode( -1 )
	
end


--
function UI.AutogenUpgradeWnd:FullUpdate( bSaveLayout )

	if bSaveLayout == nil then
		bSaveLayout = false
	end
	
	local donorScrollPos = -1
	
	if bSaveLayout then
		self.donorItemsToSelect = self:GetSelDonorItems()	-- self.donorItemsToSelect заполняется также при перезагрузке ресурсов
		donorScrollPos = self.donorListWnd:GetScrollPos()
	end

	self:ResetContent()
	
	self.isDirty = false
	
	if self.iid == UI.INVALID_U64_ID then
		return
	end
	
	self.donorListWnd:Setup( self.iid )
	
	self.bLockUpdateOnSelDonorItemsChange = true
	
		self:SetDonorMode( self:GetSavedDonorMode() )	-- donorMode запоминается в профиле
		
		-- восстанавливается выбранное количество
		if self.donorItemsToSelect then
			
			for itemIdx, item in pairs( self.donorItemsToSelect ) do
			
				if UI:IsDefResource( item.defName ) or UI:IsDefBlueprint( item.defName ) then
				
					local isCount = UI:GetPlayerResourceCount( item.defName )
					if isCount > 0 then
						self:SetDonorItemCount( item.defName, math.min( item.count, isCount ) )
					end
				
				else
				
					if UI:GetAutogenInventoryItem( item.iid ) then
						self:SetDonorItemCount( item.defName, 1 )
					end

				end
			
			end
		
			self.donorItemsToSelect = nil
		
		end
	
	self.bLockUpdateOnSelDonorItemsChange = false
	
	if bSaveLayout and donorScrollPos ~= -1 then
		self.donorListWnd:SetScrollPos( donorScrollPos )
	end
	
	self.addExp = self:CalcAddExp()
	self.upgradeResult = _G.GameStore_GetAutogenItemUpgradeResult( self.iid, self.addExp ) or {}
	
	self:UpdateProgress()
	self:UpdateIco()
	self:UpdateName()
	self:UpdatePrice()
	self:UpdateUpgradeBtn()
	
end


--
function UI.AutogenUpgradeWnd:UpdateIco()
	
	-- иконка
	self.icoWnd:SetupForItem( self.defName, false )
	
	local quality = UI:GetAutogenQualityForUpgradeLevel( self.upgradeResult.newUpgradeLevel or 0 )
	local color = UI:GetItemQualityColor( quality, false, false )
	self.icoWnd:ShowColorBg2( color, false )
	
	-- тултип
	local tooltipData =
	{
		tooltipType			= UI.tooltipTypes.MODULE,
		defName				= self.defName,
		iid					= self.iid,
		autogenUpgradeLevel	= self.upgradeResult.newUpgradeLevel or 0,
	}
	self.icoWnd:SetTooltipData( tooltipData )
	
end


--
function UI.AutogenUpgradeWnd:UpdateName()
	
	local str = UI:GetEntityLocalizedNameByDef( self.defName, false )

	local quality = UI:GetAutogenQualityForUpgradeLevel( self.upgradeResult.newUpgradeLevel or 0 )
	local color = UI:GetItemQualityColor( quality, false, false )
	str = string.format( "%s%s", UI:Color2Str( color ), str )

	self:SetText( str, self.layers.NAME )

end


--
function UI.AutogenUpgradeWnd:UpdateProgress()
	
	self.progressWnd:Setup( self.iid, self.addExp, self.upgradeResult )
	
end


--
function UI.AutogenUpgradeWnd:UpdatePrice()

	local str = ""
	
	local autogenItem = UI:GetAutogenInventoryItem( self.iid )
	local curLevel = autogenItem and autogenItem.upgradeLevel or 0
	
	if curLevel < UI.AUTOGEN_MAX_UPGRADE_LEVEL - 1 and next( self:GetSelDonorItems() ) then
	
		local price = self:GetPrice()
		
		local priceInfo =
		{
			priceType	= _G.GameStore.CreditsType.CT_CREDITS,
			val			= price,
			bIsBuyPrice	= true,
			basePrice	= price,
		}
		
		str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, nil )
		
	end
	
	self.priceMetaText:SetText( str, true )
	
end


--
function UI.AutogenUpgradeWnd:UpdateUpgradeBtn()

	local bEnabled = false
	
	local autogenItem = UI:GetAutogenInventoryItem( self.iid )
	local curLevel = autogenItem and autogenItem.upgradeLevel or 0
	
	if curLevel < UI.AUTOGEN_MAX_UPGRADE_LEVEL - 1 and next( self:GetSelDonorItems() ) then
		if self:GetPrice() <= UI:GetPlayerMoney( false ) then
			bEnabled = true
		end
	end
		
	self.upgradeBtn:Enable( bEnabled )
	
end


--
function UI.AutogenUpgradeWnd:SetDonorMode( donorMode )

	if donorMode == self.donorMode then
		return
	end
	
	self.donorMode = donorMode
	
	self.donorModeTabsWnd:SetDonorMode( donorMode )
	self.donorListWnd:SetDonorMode( donorMode )	
	
	self:SaveDonorMode()

end


--
function UI.AutogenUpgradeWnd:SaveDonorMode()
	
	if self.donorMode == -1 then
		return
	end
	
	local savedDonorMode = -1
	
	local profile = _G.GetProfileTable()
	
	if type( profile.AutogenUpgradeWnd ) == "table" and type( profile.AutogenUpgradeWnd.donorMode ) == "number" then
		savedDonorMode = profile.AutogenUpgradeWnd.donorMode
	end
	
	if self.donorMode ~= savedDonorMode then
	
		if type( profile.AutogenUpgradeWnd ) ~= "table" then
			profile.AutogenUpgradeWnd = {}
		end
		
		profile.AutogenUpgradeWnd.donorMode = self.donorMode
		
		Profile:Save()
		
	end
	
end


--
function UI.AutogenUpgradeWnd:GetSavedDonorMode()

	local profile = _G.GetProfileTable()
	
	if type( profile.AutogenUpgradeWnd ) == "table" and type( profile.AutogenUpgradeWnd.donorMode ) == "number" and UI:Val2Key( self.donorModes, profile.AutogenUpgradeWnd.donorMode ) ~= "" then
		return profile.AutogenUpgradeWnd.donorMode
	end
	
	return self.DEFAULT_DONOR_MODE

end


--
function UI.AutogenUpgradeWnd:GetPrice()

	return self.upgradeResult.creditsCost or 0

end


--
function UI.AutogenUpgradeWnd:GetSelDonorItems()

	return self.donorListWnd:GetSelItems()
	
end


--
function UI.AutogenUpgradeWnd:CalcAddExp()

	local addExp = 0

	local selDonorItems = self:GetSelDonorItems()
	for itemIdx, item in pairs( selDonorItems ) do
	
		if UI:IsDefResource( item.defName ) or UI:IsDefBlueprint( item.defName ) then
			addExp = addExp + UI:GetResourceAutogenDonorExp( item.defName ) * item.count
		else
			addExp = addExp + _G.GameStore_GetAutogenItemDonorExp( item.iid )
		end
	
	end
	
	return addExp

end


--
function UI.AutogenUpgradeWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
		
	if wnd == self.upgradeBtn then
	
		if not self:IsWaiting() then
			self:DoUpgrade()
			UI:PlayGlobalSound( self.sounds.upgrade )
		end
		
	elseif wnd == self.crossBtn then
	
		self:Hide()
		UI:PlayGlobalSound( self.sounds.hide )
		
	elseif UI:IsWndKindOf( wnd, "AutogenUpgrade_DonorModeTabs_SlotWnd" ) then
	
		if not wnd:IsSelected() and not self:IsWaiting() then
			self:SetDonorMode( wnd:GetRecordData().donorMode )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end
		
	end

	return true

end


--
function UI.AutogenUpgradeWnd:OnEscape()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )
	
	return true

end


--
function UI.AutogenUpgradeWnd:SetDonorItemCount( defName, count )

	self.donorListWnd:SetCount( defName, count )

end


--
function UI.AutogenUpgradeWnd:DoUpgrade()

	if self:IsWaiting() then
		sys.log( "UI.AutogenUpgradeWnd:DoUpgrade()[ERROR]: still waiting for previous request" )
		return
	end
	
	local selDonorItems = self:GetSelDonorItems()
	
	-- перевод в формат, требуемый функцией GameStore_UpgradeAutogenItem()
	local selDonorItemsAltFormat = { iids = {}, resources = {} }
	for itemIdx, item in pairs( selDonorItems ) do
	
		if UI:IsDefResource( item.defName ) or UI:IsDefBlueprint( item.defName ) then
			selDonorItemsAltFormat.resources[ item.defName ] = item.count
		else
			table.insert( selDonorItemsAltFormat.iids, item.iid )
		end
	
	end
	
	self.upgradeRequestId = _G.GameStore_UpgradeAutogenItem( self.iid, selDonorItemsAltFormat )
	
	if self.upgradeRequestId ~= 0 then
		UI:AddWaitingRequest( self.upgradeRequestId )
	else
		self:ShowMsgOnUpgradeError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.AutogenUpgradeWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.AutogenUpgradeWnd:IsWaiting()

	return self.upgradeRequestId ~= 0

end


--
function UI.AutogenUpgradeWnd:ShowMsgOnUpgradeError( result )

	UI:ShowErrorMsg( "msg_autogenUpgradeError", result, "_G.GameStore.StoreBuyResult" )

end


--
function UI.AutogenUpgradeWnd:F_OnEventSaveUiState()
	
	UI.store.AutogenUpgradeWnd =
	{
		iid					= self.iid,
		selDonorItems		= self:GetSelDonorItems(),
		upgradeRequestId	= self.upgradeRequestId,
	}
	
end


--
function UI.AutogenUpgradeWnd:F_OnEventRestoreUiState()
	
	if UI.store.AutogenUpgradeWnd then
	
		self.upgradeRequestId	= UI.store.AutogenUpgradeWnd.upgradeRequestId
		self:UpdateWaitingEffect()
		
		local iid = UI.store.AutogenUpgradeWnd.iid
		if iid ~= UI.INVALID_U64_ID then
		
			self.donorItemsToSelect = UI.store.AutogenUpgradeWnd.selDonorItems
			self:Setup( iid )
			
		end
		
		UI.store.AutogenUpgradeWnd = nil
	
	end
	
end


--
function UI.AutogenUpgradeWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	self:Reset()

end


--
function UI.AutogenUpgradeWnd:OnResourcesChanged()

	if self:IsOnScreen() and ( self.donorMode == UI.AutogenUpgradeWnd.donorModes.RESOURCES or self.donorMode == UI.AutogenUpgradeWnd.donorModes.ALL ) then
	
		if self.upgradeRequestId == 0 then
			self:FullUpdate( true )
		else
			self.isDirty = true	-- не апдейтим пока ждем реквеста, потому что после него все равно окно закроется
		end
		
	end

end


-- после UI.AutogenUpgrade точка, а не двоеточие, это не ошибка, т.к. self первым параметром сюда не будет передаваться при вызове
function UI.AutogenUpgradeWnd.GetDonorTooltipAlignmentCallback( tooltipWnd, tooltipData )

	-- позиция по умочанию, если что-то пойдет не так
	local anchorPos = UI:GetTooltipDefaultPos( tooltipWnd:GetWidth(), tooltipWnd:GetHeight() ) 
	local hAlignment = UI.hAlignments.RIGHT
	local vAlignment = UI.vAlignments.BOTTOM

	local donorDefName = tooltipWnd:GetDefName()
	
	local donorSlotWnd = UI.AutogenUpgrade_DonorListWnd:GetSlotForItem( donorDefName )
	if not donorSlotWnd then
		sys.log( "UI.AutogenUpgradeWnd.GetDonorTooltipAlignmentCallback()[ERROR]: cannot find donor slot wnd for '%s'", donorDefName )
		return anchorPos, hAlignment, vAlignment
	end
	
	local workEffect = UI:GetEffectFromLayer( UI.AutogenUpgradeWnd, UI.AutogenUpgradeWnd.layers.WORK_EFFECT )	-- это эффект видимой части окна, на самом деле окно на весь экран, но основное место занимает черный фон
	if not workEffect then
		sys.log( "UI.AutogenUpgradeWnd.GetDonorTooltipAlignmentCallback()[ERROR]: cannot find work effect" )
		return anchorPos, hAlignment, vAlignment
	end

	-- тултип показывается левее окошка напротив иконки модуля, который мы выбрали. Нижний край тултипа по высоте совпадает с нижним краем иконки на которую мы навелись
	
	--(коордтинаты экранные)
	local workEffectPos = workEffect:GetScreenPos()
	local spaceX = UI:YTo1024x768( UI.AutogenUpgradeWnd.DONOR_TOOLTIP_SPACE_X, { x = 1280, y = 720 } )
	local donorSlotBtm = donorSlotWnd:GetParent():YToScreen( donorSlotWnd:GetTop() + donorSlotWnd:GetHeight() )
	
	anchorPos.x = workEffectPos.x - spaceX
	anchorPos.y = donorSlotBtm
	
	hAlignment = UI.hAlignments.LEFT
	vAlignment = UI.vAlignments.TOP

	return anchorPos, hAlignment, vAlignment

end


-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_DonorListWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_DonorListWnd = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.AutogenUpgrade_DonorListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "AutogenUpgrade_DonorListWnd",
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
				defName 			= "autogenUpgrade_donorList",
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

-- --------------------------------------------
-- interface functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorListWnd:Setup( upgradingIid )

	self:Reset()

	self.upgradingIid = upgradingIid
	
end


--
function UI.AutogenUpgrade_DonorListWnd:SetDonorMode( donorMode )

	if donorMode == self.donorMode then
		return
	end
	
	local oldSelItems = self:GetSelItems()

	self.donorMode = donorMode
	self:FullUpdate()
	
	if next( oldSelItems ) then
		self:NotifyParentOnCountChanged()
	end
	
end


--
function UI.AutogenUpgrade_DonorListWnd:Reset()

	if UI:IsInRemovingAllWindows() then
		return
	end

	local oldSelItems = self:GetSelItems()

	self.upgradingIid = UI.INVALID_U64_ID
	self.donorMode = -1
	
	self:Clear()
	
	if next( oldSelItems ) then
		self:NotifyParentOnCountChanged()
	end
	
end


--
function UI.AutogenUpgrade_DonorListWnd:FullUpdate()

	self:Clear()
	
	if self.upgradingIid ==  UI.INVALID_U64_ID or self.donorMode == -1 then
		return
	end

	local slotDatas = {}

	-- автоген-модули
	if self.donorMode == UI.AutogenUpgradeWnd.donorModes.AUTOGEN or self.donorMode == UI.AutogenUpgradeWnd.donorModes.ALL then
		
		for itemIdx, item in pairs( UI.serverData.autogenInventory ) do
		
			if item.iid ~= self.upgradingIid and not UI:GetEquippedShipItem( item.iid ) then	-- экипированные нельзя
		
				local slotData =
				{
					defName	= UI:Iid2DefName( item.iid ),
					iid		= item.iid,
					count	= 0,
				}
				table.insert( slotDatas, slotData )
				
			end
		
		end

	end
	
	-- ресурсы и чертежи
	if self.donorMode == UI.AutogenUpgradeWnd.donorModes.RESOURCES or self.donorMode == UI.AutogenUpgradeWnd.donorModes.ALL then
	
		for defName, count in pairs( UI.serverData.resources ) do
		
			if count > 0 and UI:GetResourceAutogenDonorExp( defName ) > 0 then
		
				local slotData =
				{
					defName	= defName,
					iid		= UI.INVALID_U64_ID,
					count	= 0,
				}
				table.insert( slotDatas, slotData )
				
			end
		
		end

	end
	
	-- сортировка
	local function fnSort( slotData1, slotData2 )
	
		-- снчала модули, потом ресурсы
		-- внутри модулей по iid
		-- внутри ресурсов по defName
	
		if slotData1.iid ~= slotData2.iid then
		
			if slotData1.iid == UI.INVALID_U64_ID then
				return false
			
			elseif slotData2.iid == UI.INVALID_U64_ID then
				return true
				
			else
				return slotData1.iid < slotData2.iid
			end
		
		end
		
		return slotData1.defName < slotData2.defName
	
	end
	
	table.sort( slotDatas, fnSort )
	
	
	-- распределение по рядам
	local rowData = { slots = {} }
	
	for itemIdx, slotData in ipairs( slotDatas ) do
	
		table.insert( rowData.slots, slotData )
		
		if #rowData.slots == UI.AutogenUpgrade_DonorRowWnd.MAX_SLOTS then
			self:AddRecord( rowData )
			rowData = { slots = {} }
		end
	
	end
	
	if next( rowData.slots ) then
		self:AddRecord( rowData )
	end
	
end


--
function UI.AutogenUpgrade_DonorListWnd:ChangeCount( defName, countDelta )

	local rowIdx, slotIdx = self:GetItemRowAndSlot( defName )
	
	if rowIdx == -1 or slotIdx == -1 then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:ChangeCount()[ERROR]: cannot find item %s", defName )
		return
	end
	
	local rowData = self:GetRecordData( rowIdx )
	local slotData = rowData and rowData.slots[ slotIdx ]
	
	if not rowData or not slotData then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:ChangeCount()[ERROR]: no data at rowIdx=%d slotId=%d", rowIdx, slotIdx )
		return
	end
	
	self:SetCount( defName, slotData.count + countDelta )
	
end


--
function UI.AutogenUpgrade_DonorListWnd:SetCount( defName, count )

	local rowIdx, slotIdx = self:GetItemRowAndSlot( defName )
	
	if rowIdx == -1 or slotIdx == -1 then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:SetCount()[ERROR]: cannot find item %s", defName )
		return
	end
	
	local rowData = self:GetRecordData( rowIdx )
	local slotData = rowData and rowData.slots[ slotIdx ]
	
	if not rowData or not slotData then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:SetCount()[ERROR]: no data at rowIdx=%d slotId=%d", rowIdx, slotIdx )
		return
	end
	
	if count < 0 then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:SetCount()[ERROR]: negative count for %s", defName )
	end
	
	local maxCount = ( UI:IsDefResource( defName ) or UI:IsDefBlueprint( defName ) ) and UI:GetPlayerResourceCount( defName ) or 1
	if count > maxCount then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:SetCount()[ERROR]: invalid count %d for %s, max is %d", count, defName, maxCount )
	end
	
	count = UI:Clamp( count, 0, maxCount )
	
	if slotData.count == count then
		return
	end
	
	slotData.count = count
	
	local rowWnd = self:GetButtonForRecord( rowIdx )
	if rowWnd then
		local slotWnd = rowWnd:GetSlot( slotIdx )
		if slotWnd then
			slotWnd:SetCount( slotData.count )
		end
	end
	
	self:NotifyParentOnCountChanged()
	
end


--
function UI.AutogenUpgrade_DonorListWnd:GetSelItems()

	local selItems = {}
	
	for rowIdx = 1, self:GetNumRecords() do
	
		local rowData = self:GetRecordData( rowIdx )
		for slotIdx, slotData in pairs( rowData.slots ) do
			
			if slotData.count > 0 then
				table.insert( selItems, slotData )
			end
		
		end
	
	end
	
	return selItems

end


--
function UI.AutogenUpgrade_DonorListWnd:GetSlotForItem( defName )

	for rowIdx = 1, self:GetNumRecords() do
	
		local rowData = self:GetRecordData( rowIdx )
		for slotIdx, slotData in pairs( rowData.slots ) do
			
			if slotData.defName == defName then
			
				local rowWnd = self:GetButtonForRecord( rowIdx )
				if rowWnd then
					return rowWnd:GetSlot( slotIdx )
				end
				
			end
		
		end
	
	end
	
	return nil

end


--
function UI.AutogenUpgrade_DonorListWnd:OnDonorSlotReleaseMouseCapture( wnd )

	self:StopChangeCountContinuous()

end


-- --------------------------------------------
-- const
-- --------------------------------------------

UI.AutogenUpgrade_DonorListWnd.btnPrototypeName			= "AutogenUpgrade_DonorRowWnd"
UI.AutogenUpgrade_DonorListWnd.scrollBarPrototypeName	="ButtonsList3Wnd_ScrollBarWnd_3"
UI.AutogenUpgrade_DonorListWnd.listStyle				= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.AutogenUpgrade_DonorListWnd.MAX_SLOTS				= 4

UI.AutogenUpgrade_DonorListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_1_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

UI.AutogenUpgrade_DonorListWnd.changeCountStages =
{
	-- duration	- сек, сколько длится этап, -1 означает бесконечно
	-- speed	- единиц ресурса в сек
	{ duration = 0.5,		speed = 0 },
	{ duration = 1.5,		speed = 5 },
	{ duration = 1.5,		speed = 15 },
	{ duration = -1,		speed = 50 },
}

-- --------------------------------------------
-- vars
-- --------------------------------------------

UI.AutogenUpgrade_DonorListWnd.upgradingIid					= UI.INVALID_U64_ID
UI.AutogenUpgrade_DonorListWnd.changeCountStagesEndTimes	= {}

UI.AutogenUpgrade_DonorListWnd.changeCountContinuousData =
{
	startTime	= 0,
	defName		= "",
	bIncrease	= false,
	countFloat	= 0,
	maxCount	= 0,
	slotData	= nil,
}

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorListWnd:F_PostLoad()

	UI.ButtonsList3Wnd.F_PostLoad( self )
	
	local lastTime = 0
	for stage, stageInfo in ipairs( self.changeCountStages ) do
	
		local stageEndTime = -1
		if stageInfo.duration ~= -1 and lastTime ~= -1 then
			stageEndTime = lastTime + stageInfo.duration
		end
		
		self.changeCountStagesEndTimes[ stage ] = stageEndTime
		
		lastTime = stageEndTime
		
	end

end

--
function UI.AutogenUpgrade_DonorListWnd:GetItemRowAndSlot( defName )

	local itemRowIdx = -1
	local itemSlotIdx = -1

	for rowIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( rowIdx )
		for slotIdx, slotData in pairs( data.slots ) do
		
			if slotData.defName == defName then
			
				itemRowIdx = rowIdx
				itemSlotIdx = slotIdx
				break
				
			end
			
		end
		
		if itemRowIdx ~= -1 then
			break
		end
		
	end
	
	return itemRowIdx, itemSlotIdx
	
end


--
function UI.AutogenUpgrade_DonorListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "ItemIcoWnd" ) then
	
		local donorSlotWnd = UI:GetAncestorKindOf( wnd, "AutogenUpgrade_DonorSlotWnd" )
		if donorSlotWnd then
		
			local defName = donorSlotWnd:GetDefName()
			local curCount = donorSlotWnd:GetCount()
			
			local maxCount = ( UI:IsDefResource( defName ) or UI:IsDefBlueprint( defName ) ) and UI:GetPlayerResourceCount( defName ) or 1
			
			if curCount < maxCount then
				-- инкремент
				self:StartChangeCountConinuous( defName, true, wnd )
			end
			
		else
			sys.log( "UI.AutogenUpgrade_DonorListWnd:F_OnMouseLButtonDown()[ERROR]: cannot find ancestor donor slot for ItemIcoWnd" )
		end
		
	elseif UI:IsWndKindOf( wnd, "AutogenUpgrade_DecCountBtn" ) then
	
		local donorSlotWnd = UI:GetAncestorKindOf( wnd, "AutogenUpgrade_DonorSlotWnd" )
		if donorSlotWnd then
			-- декремент
			self:StartChangeCountConinuous( donorSlotWnd:GetDefName(), false, wnd )
		else
			sys.log( "UI.AutogenUpgrade_DonorListWnd:F_OnMouseLButtonDown()[ERROR]: cannot find ancestor donor slot for AutogenUpgrade_DecCountBtn" )
		end
	
	end

	return true

end


--
function UI.AutogenUpgrade_DonorListWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	if self.changeCountContinuousData.defName ~= "" then
		self:StopChangeCountContinuous()
		return true
	end

	return false

end


--
function UI.AutogenUpgrade_DonorListWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "ItemIcoWnd" ) then
	
		local donorSlotWnd = UI:GetAncestorKindOf( wnd, "AutogenUpgrade_DonorSlotWnd" )
		if donorSlotWnd then
		
			-- декремент
			local curCount = donorSlotWnd:GetCount()
			if curCount > 0 then
				self:StartChangeCountConinuous( donorSlotWnd:GetDefName(), false, wnd )
			end
			
		else
			sys.log( "UI.AutogenUpgrade_DonorListWnd:F_OnMouseRButtonDown()[ERROR]: cannot find ancestor donor slot for AutogenUpgrade_DecCountBtn" )
		end
		
	end

	return true

end


--
function UI.AutogenUpgrade_DonorListWnd:F_OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	if self.changeCountContinuousData.defName ~= "" then
		self:StopChangeCountContinuous()
		return true
	end

	return false

end


--
function UI.AutogenUpgrade_DonorListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self:Scroll( ticks < 0 )
	end

	return true

end


--
function UI.AutogenUpgrade_DonorListWnd:NotifyParentOnCountChanged()

	if not UI:IsInRemovingAllWindows() then
	
		local parent = self:GetParent()
		if parent and parent.OnDonorItemsCountChanged then
			parent:OnDonorItemsCountChanged()
		end
		
	end

end


--
function UI.AutogenUpgrade_DonorListWnd:StopChangeCountContinuous()

	if self.changeCountContinuousData.defName == "" then
		return
	end

	self.changeCountContinuousData.startTime	= 0
	self.changeCountContinuousData.defName		= ""
	self.changeCountContinuousData.bIncrease	= false
	self.changeCountContinuousData.countFloat	= 0
	self.changeCountContinuousData.maxCount		= 0
	self.changeCountContinuousData.slotData		= nil
	
	if not UI:IsInRemovingAllWindows() then
	
		local hWndCapture = UI:GetMouseCapture()
		local wndCapture = hWndCapture ~= UI.INVALID_UI_HANDLE and UI:GetUiObjByHandleT( hWndCapture )
		if wndCapture and ( wndCapture == self or wndCapture:IsChildOf( self ) ) then
			UI:CaptureMouse( UI.INVALID_UI_HANDLE )
		end
		
	end

end


--
function UI.AutogenUpgrade_DonorListWnd:StartChangeCountConinuous( defName, bIncrease, clickedWnd )

	self:StopChangeCountContinuous()
	
	local rowIdx, slotIdx = self:GetItemRowAndSlot( defName )
	if rowIdx == -1 or slotIdx == -1 then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:StartChangeCountConinuous()[ERROR]: cannot find item %s", defName )
		return
	end
	
	local rowData = self:GetRecordData( rowIdx )
	local slotData = rowData and rowData.slots[ slotIdx ]
	
	if not rowData or not slotData then
		sys.log( "UI.AutogenUpgrade_DonorListWnd:StartChangeCountConinuous()[ERROR]: no data at rowIdx=%d slotId=%d", rowIdx, slotIdx )
		return
	end
	
	-- первое изменение сразу при нажатии
	self:ChangeCount( defName, bIncrease and 1 or -1 )
	
	local maxCount = ( UI:IsDefResource( defName ) or UI:IsDefBlueprint( defName ) ) and UI:GetPlayerResourceCount( defName ) or 1
	if( bIncrease and slotData.count >= maxCount ) or ( not bIncrease and slotData.count <= 0 ) then
		return
	end
	
	self.changeCountContinuousData.startTime	= _G.TimerGetGameTime()
	self.changeCountContinuousData.defName		= defName
	self.changeCountContinuousData.bIncrease	= bIncrease
	self.changeCountContinuousData.countFloat	= slotData.count
	self.changeCountContinuousData.maxCount		= maxCount
	self.changeCountContinuousData.slotData		= slotData	-- запоминается тут, чтобы не искать каждый кадр нужный слот; там хранится текущее выбранное количество
	
	UI:CaptureMouse( clickedWnd:GetUiHandle() )

end


--
function UI.AutogenUpgrade_DonorListWnd:UpdateChangeCountConinuous( dt )

	if self.changeCountContinuousData.defName == "" then
		return
	end
	
	local curTime = _G.TimerGetGameTime()
	local timeFromStart = curTime - self.changeCountContinuousData.startTime
	
	local curStage = -1
	for stage, stageEndTime in ipairs( self.changeCountStagesEndTimes ) do
	
		if stageEndTime == -1 or timeFromStart <= stageEndTime then
			curStage = stage
			break
		end
	
	end
	
	local speed = self.changeCountStages[ curStage ].speed
	
	local deltaCount = speed * dt
	if not self.changeCountContinuousData.bIncrease then
		deltaCount = -deltaCount
	end
	
	self.changeCountContinuousData.countFloat = self.changeCountContinuousData.countFloat + deltaCount
	
	local countNew = UI:Round( self.changeCountContinuousData.countFloat )
	countNew = UI:Clamp( countNew, 0, self.changeCountContinuousData.maxCount )
	
	local countOld = self.changeCountContinuousData.slotData.count
	
	if countNew ~= countOld then
		self:SetCount( self.changeCountContinuousData.defName, countNew )
	end
	
	if ( countNew >= self.changeCountContinuousData.maxCount and self.changeCountContinuousData.bIncrease ) or ( countNew <= 0 and not self.changeCountContinuousData.bIncrease ) then
		self:StopChangeCountContinuous()
	end
	
end


--
function UI.AutogenUpgrade_DonorListWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.changeCount_defName ~= "" then
		self:UpdateChangeCountConinuous( dt_sys )
	end

end


--
function UI.AutogenUpgrade_DonorListWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	self:StopChangeCountContinuous()

end


-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_DonorRowWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_DonorRowWnd = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.AutogenUpgrade_DonorRowWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "AutogenUpgrade_DonorRowWnd",
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
				defName 			= "autogenUpgrade_donorRow",
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

-- --------------------------------------------
-- interface functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorRowWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )
	
	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end
	self.curSlots = {}
	
end


--
function UI.AutogenUpgrade_DonorRowWnd:GetSlot( slotIdx )

	return self.curSlots[ slotIdx ]

end


-- --------------------------------------------
-- const
-- --------------------------------------------

UI.AutogenUpgrade_DonorRowWnd.MAX_SLOTS	= 5

UI.AutogenUpgrade_DonorRowWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "upd_slot_",
	}
}

-- --------------------------------------------
-- vars
-- --------------------------------------------

UI.AutogenUpgrade_DonorRowWnd.allSlots	= {}
UI.AutogenUpgrade_DonorRowWnd.curSlots	= {}

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorRowWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )
	
	self.allSlots	= {}
	self.curSlots	= {}
	
	if self:IsPrototype() then
		return
	end
	
	self:CreateControls()
	
end


--
function UI.AutogenUpgrade_DonorRowWnd:CreateControls()

	for slotIdx = 1, self.MAX_SLOTS do
		local slotWnd = UI:CreateChildWnd( self, UI.AutogenUpgrade_DonorSlotWnd, tostring( slotIdx ) )
		table.insert( self.allSlots, slotWnd )
	end

end


--
function UI.AutogenUpgrade_DonorRowWnd:UpdateForData( data, bAnimated )

	self:Reset()
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	
	for slotIdx, slotData in ipairs( data.slots ) do
		
		local slotWnd = self.allSlots[ slotIdx ]
		table.insert( self.curSlots, slotWnd )
		UI:AddChildAndLink( self, slotWnd, mainEffect, string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )
		
		slotWnd:Setup( slotData.defName, slotData.iid, slotData.count )
	
	end

end

-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_DonorSlotWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_DonorSlotWnd = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.AutogenUpgrade_DonorSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	SEL_EFFECT	= 1,
}

UI.AutogenUpgrade_DonorSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "AutogenUpgrade_DonorSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.AutogenUpgrade_DonorSlotWnd.layers.SEL_EFFECT,
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "autogenUpgrade_donorSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "prod_icon2",
						layer		= "UI.AutogenUpgrade_DonorSlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_checkmark_1080",
				defaultAnimation	= "tick",
			}}
		},
	}
}

-- --------------------------------------------
-- interface functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorSlotWnd:Setup( defName, iid, count )

	self:Reset()
	
	self.defName	= defName
	self.iid		= iid
	self.count		= count
	
	self:FullUpdate()

end


--
function UI.AutogenUpgrade_DonorSlotWnd:Reset()
	
	self.defName	= ""
	self.iid		= UI.INVALID_U64_ID
	self.count		= 0
	
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )
	self.icoWnd:Reset()
	self.decCountBtn:UnlinkFromParent()
	
end


--
function UI.AutogenUpgrade_DonorSlotWnd:GetDefName()

	return self.defName

end


--
function UI.AutogenUpgrade_DonorSlotWnd:GetIid()

	return self.iid

end


--
function UI.AutogenUpgrade_DonorSlotWnd:SetCount( count )

	if count == self.count then
		return
	end

	self.count = count
	
	self:UpdateSelEffect()
	self:UpdateCount()
	self:UpdateDecCountBtn()

end


--
function UI.AutogenUpgrade_DonorSlotWnd:GetCount()

	return self.count

end


-- --------------------------------------------
-- const
-- --------------------------------------------

UI.AutogenUpgrade_DonorSlotWnd.effectInfo =
{
	main =
	{
		icoLocator			= "prod_icon",
		decCountBtnLocator	= "btn_minus",
	}
}

-- --------------------------------------------
-- vars
-- --------------------------------------------

UI.AutogenUpgrade_DonorSlotWnd.defName		= ""
UI.AutogenUpgrade_DonorSlotWnd.iid			= UI.INVALID_U64_ID
UI.AutogenUpgrade_DonorSlotWnd.count		= 0

UI.AutogenUpgrade_DonorSlotWnd.icoWnd		= nil
UI.AutogenUpgrade_DonorSlotWnd.decCountBtn	= nil

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self:CreateControls()

end


--
function UI.AutogenUpgrade_DonorSlotWnd:CreateControls()

	self.icoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd_1080, "" )
	UI:AddChildAndLink( self, self.icoWnd, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ), self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )
	
	self.decCountBtn = UI:CreateChildWnd( self, UI.AutogenUpgrade_DecCountBtn, "" )
	
end


--
function UI.AutogenUpgrade_DonorSlotWnd:FullUpdate()
	
	self:UpdateIco()
	self:UpdateSelEffect()
	self:UpdateCount()
	self:UpdateTooltip()
	self:UpdateDecCountBtn()
	self:UpdateMouseOver()
	

end


--
function UI.AutogenUpgrade_DonorSlotWnd:UpdateIco()
	
	self.icoWnd:SetupForItem( self.defName, false )
	
end


--
function UI.AutogenUpgrade_DonorSlotWnd:UpdateSelEffect()

	local bNeedShow = self.count > 0 and not UI:IsDefResource( self.defName ) and not UI:IsDefBlueprint( self.defName )	-- для ресурсов/чертежей не показывается, для них показывается количество
	self:SetLayerVisible( bNeedShow, self.layers.SEL_EFFECT )
	
end


--
function UI.AutogenUpgrade_DonorSlotWnd:UpdateCount()

	if not UI:IsDefResource( self.defName ) and not UI:IsDefBlueprint( self.defName ) then	-- для модулей не показывается, только для ресурсов/чертежей, т.к. модули всегда по одному, для модулей показывается специальный эффект
		self.icoWnd:HideCount()
		return
	end

	local selCount = self.count
	local isCount = UI:GetPlayerResourceCount( self.defName )

	local strSelCount	= UI:Num2StrSeparatedBy3( selCount )
	local strIsCount	= tostring( math.min( isCount, 999 ) )
		
	local str = string.format( "%s%s/%s%s", UI:Color2Str( 0xffffff00--[[желтый]] ), strSelCount, UI:Color2Str( UI.TEXT_BASE_COLOR ), strIsCount )

	self.icoWnd:SetCountResourcesText( str )

end


--
function UI.AutogenUpgrade_DonorSlotWnd:UpdateTooltip()

	local tooltipData = UI:GetTooltipForItem( self.defName )
	
	tooltipData.tooltipDelay		= 0	-- показывать мгновенно при наведении
	tooltipData.tooltipPlacement	= { placementRule = UI.tooltipPlacementRules.ALIGNMENT_FUNCTION, fnGetAlignment = UI.AutogenUpgradeWnd.GetDonorTooltipAlignmentCallback } -- показывать в определенном месте
	
	if UI:IsDefModule( self.defName ) then
		tooltipData.iid = self.iid
	end
	
	self.icoWnd:SetTooltipData( tooltipData )
	
	if self.decCountBtn:IsChildOf( self ) then
		self.decCountBtn:SetTooltipData( UI:CopyTable2( self.icoWnd:GetTooltipData() ) )
	end

end


--
function UI.AutogenUpgrade_DonorSlotWnd:UpdateDecCountBtn()

	local bNeedBtn = self.count > 0
	
	if bNeedBtn then
		UI:AddChildAndLink( self, self.decCountBtn, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ), self.effectInfo.main.decCountBtnLocator, UI.EffectAnimParams.POS )
		self.decCountBtn:SetTooltipData( UI:CopyTable2( self.icoWnd:GetTooltipData() ) )
	else
		self.decCountBtn:UnlinkFromParent()
	end

end


--
function UI.AutogenUpgrade_DonorSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) )
	self:SetMouseOver( bMouseOver )

end


--
function UI.AutogenUpgrade_DonorSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.icoWnd:IsMouseOver()

	if bMouseOver then
		self.icoWnd:ShowMouseOver()
	else
		self.icoWnd:HideMouseOver()
	end

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.AutogenUpgrade_DonorSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.AutogenUpgrade_DonorSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


--
function UI.AutogenUpgrade_DonorSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.AutogenUpgrade_DonorSlotWnd:F_OnReleaseMouseCapture()

	self:OnReleaseMouseCapture()

	local listWnd = UI:GetAncestorKindOf( wnd, "ButtonsListWnd" )
	if listWnd and listWnd.OnDonorSlotReleaseMouseCapture then
		listWnd:OnDonorSlotReleaseMouseCapture( self )
	end

end

-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_DecCountBtn
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_DecCountBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "AutogenUpgrade_DecCountBtn",
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
					defName 			= "autogenUpgrade_decCountBtn",
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
			animationDisabled		= "",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "press",
		},
	}
}

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DecCountBtn:F_OnReleaseMouseCapture()

	self:OnReleaseMouseCapture()

	local listWnd = UI:GetAncestorKindOf( wnd, "ButtonsListWnd" )
	if listWnd and listWnd.OnDonorSlotReleaseMouseCapture then
		listWnd:OnDonorSlotReleaseMouseCapture( self )
	end

end


-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_ProgressWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_ProgressWnd = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.AutogenUpgrade_ProgressWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "AutogenUpgrade_ProgressWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "autogenUpgrade_progress_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "progr",
						layer		= "UI.AutogenUpgrade_ProgressWnd.layers.PB_ADD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "progr",
						layer		= "UI.AutogenUpgrade_ProgressWnd.layers.PB_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "count",
						layer		= "UI.AutogenUpgrade_ProgressWnd.layers.CUR_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "count3",
						layer		= "UI.AutogenUpgrade_ProgressWnd.layers.ADD_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- PB_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "autogenUpgrade_progress_pb_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "progr_1",
						layer		= "UI.AutogenUpgrade_ProgressWnd.layers.PB_ADD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "progr_1",
						layer		= "UI.AutogenUpgrade_ProgressWnd.layers.PB_CUR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- PB_ADD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "autogenUpgrade_progress_pb_add",
				defaultAnimation	= "idle",
			}}
		},
		
		-- PB_CUR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "autogenUpgrade_progress_pb_cur",
				defaultAnimation	= "idle",
			}}
		},
		
		-- CUR_VAL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- ADD_VAL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------------------------
-- interface functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_ProgressWnd:Setup( iid, addExp, upgradeResult )

	self:Reset()
	
	self.iid			= iid
	self.addExp			= addExp
	self.upgradeResult	= upgradeResult
	
	self:FullUpdate()

end


--
function UI.AutogenUpgrade_ProgressWnd:Reset()
	
	self.iid			= UI.INVALID_U64_ID
	self.addExp			= 0
	self.upgradeResult	= {}
	
	local curPbEffect = UI:GetEffectFromLayer( self, self.layers.PB_CUR_EFFECT )
	if curPbEffect then
		curPbEffect:SetAnimationTimeAndUpdate( 0 )
	end
	
	local addPbEffect = UI:GetEffectFromLayer( self, self.layers.PB_ADD_EFFECT )
	if addPbEffect then
		addPbEffect:SetAnimationTimeAndUpdate( 0 )
	end
	
	self:SetText( "", self.layers.CUR_VAL )
	self:SetText( "", self.layers.ADD_VAL )
	
end

-- --------------------------------------------
-- const
-- --------------------------------------------

UI.AutogenUpgrade_ProgressWnd.layers =
{
	MAIN_EFFECT		= 0,
	PB_MAIN_EFFECT	= 1,
	PB_ADD_EFFECT	= 2,
	PB_CUR_EFFECT	= 3,
	CUR_VAL			= 4,
	ADD_VAL			= 5,
}

-- --------------------------------------------
-- vars
-- --------------------------------------------

UI.AutogenUpgrade_ProgressWnd.iid			= UI.INVALID_U64_ID
UI.AutogenUpgrade_ProgressWnd.addExp		= 0
UI.AutogenUpgrade_ProgressWnd.upgradeResult	= {}

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_ProgressWnd:FullUpdate()

	local autogenItem = UI:GetAutogenInventoryItem( self.iid )
	local curLevel = autogenItem and autogenItem.upgradeLevel or 0	-- реальный уровень, который есть у модуля сейчас
	local curStoredExp = autogenItem and autogenItem.exp or 0
	
	local newLevel = self.upgradeResult.newUpgradeLevel or 0		-- какой уровень будет после прокачки
	local newStoredExp = self.upgradeResult.newExp or 0

	local showLevel = newLevel										-- от этого уровня до следующего будет показан прогрессбар
	if showLevel >= UI.AUTOGEN_MAX_UPGRADE_LEVEL - 1 then
		showLevel = showLevel - 1
	end
	
	local showLevelPrice = _G.GameStore_GetAutogenItemUpgradeOneLevelPrice( self.iid, showLevel ).exp	-- сколько экспы надо на апгрейд с этого уровня до следующего
	
	
	-- желтая полоска - сколько экспы уже есть сейчас в модуле
	local showStoredExpPb = 0
	if curLevel >= UI.AUTOGEN_MAX_UPGRADE_LEVEL - 1 then
		showStoredExpPb = showLevelPrice	-- если модуль уже прокачан до максимума, то рисуем только желтую полностью заполненную полоску
	else
		showStoredExpPb = showLevel == curLevel and curStoredExp or 0
	end
	
	local curAnimTime = 0
	if showStoredExpPb > 0 then
		curAnimTime = showLevelPrice ~= 0 and showStoredExpPb / showLevelPrice or 1
	end
	
	local curPbEffect = UI:GetEffectFromLayer( self, self.layers.PB_CUR_EFFECT )
	if curPbEffect then
		curPbEffect:SetAnimationTimeAndUpdate( curAnimTime )
	end
	
	
	-- оранжевая полоска - сколько экспы мы зальем (рисуется от начала прогрессбара, но т.к. она ПОД желтой, то будет видна только ее часть, выступающая за пределы желтой)
	local addAnimTime = 0
	if curLevel < UI.AUTOGEN_MAX_UPGRADE_LEVEL - 1 then	-- если модуль уже прокачан до максимума, то рисуем только желтую полностью заполненную полоску
	
		if self.addExp > 0 then
	
			local prevLevelsPriceTotal = 0
			for level = curLevel, showLevel - 1 do
				prevLevelsPriceTotal = prevLevelsPriceTotal + _G.GameStore_GetAutogenItemUpgradeOneLevelPrice( self.iid, level ).exp
			end
			
			local expOnLevel = curStoredExp + self.addExp - prevLevelsPriceTotal
			if expOnLevel > 0 then
				addAnimTime = showLevelPrice ~= 0 and expOnLevel / showLevelPrice or 1
			end
			
		end
		
	end
	
	local addPbEffect = UI:GetEffectFromLayer( self, self.layers.PB_ADD_EFFECT )
	if addPbEffect then
		addPbEffect:SetAnimationTimeAndUpdate( addAnimTime )
	end
	
	
	-- значение - сколько в модуле/сколько надо (на один уровень);
	-- "сколько в модуле" отличается от желтой плоски - если полоска отображает сколько есть реально сейчас,
	-- то цифра отображает, сколько будет после апгрейда
	local showStoredExpTxt = 0
	if curLevel >= UI.AUTOGEN_MAX_UPGRADE_LEVEL - 1 then
		showStoredExpTxt = showLevelPrice	-- если модуль уже прокачан до максимума, то текущее значение совпадает с максимальным
	else
		showStoredExpTxt = showLevel == newLevel and newStoredExp or showLevelPrice
	end
	
	local strCurVal = string.format( "%s/%s", UI:Num2StrSeparatedBy3( showStoredExpTxt ), UI:Num2StrSeparatedBy3( showLevelPrice ) )
	self:SetText( strCurVal, self.layers.CUR_VAL )
	
	
	-- значение - сколько экспы мы зальем всего
	local strAddVal = string.format( "+%s", UI:Num2StrSeparatedBy3( self.addExp ) )
	self:SetText( strAddVal, self.layers.ADD_VAL )
	
end


-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_UpgradeBtn
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_UpgradeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3_1080",
		
		props =
		{
			name		= "AutogenUpgrade_UpgradeBtn",
			selectSound	= UI.sounds.btnMouseOver,
		},
	},
	
	textId = "autogenUpgrade_upgradeBtn",
}

-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_IcoWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_IcoWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd_1080",
		
		props =
		{
			name	= "AutogenUpgrade_IcoWnd"
		}
	}
}

-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_CrossBtn
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn3",

		props =
		{
			name	= "AutogenUpgrade_CrossBtn"
		}
	}
}

-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_DonorModeTabsWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_DonorModeTabsWnd = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.AutogenUpgrade_DonorModeTabsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "AutogenUpgrade_DonorModeTabsWnd",
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
				defName 			= "autogenUpgrade_donorModeTabs",
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

-- --------------------------------------------
-- interface functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorModeTabsWnd:Init()

	self:Clear()
	
	local donorModesArr = {}
	for name, donorMode in pairs( UI.AutogenUpgradeWnd.donorModes ) do
		table.insert( donorModesArr, donorMode )
	end
	table.sort( donorModesArr )

	for idx, donorMode in ipairs( donorModesArr ) do
		self:AddRecord( { donorMode = donorMode } )
	end

end


--
function UI.AutogenUpgrade_DonorModeTabsWnd:SetDonorMode( donorMode )

	for recordIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( recordIdx )
		if data.donorMode == donorMode then
		
			self:SelectRecord( recordIdx )
			break
			
		end
		
	end

end


-- --------------------------------------------
-- const
-- --------------------------------------------

UI.AutogenUpgrade_DonorModeTabsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "bookmarks_0",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.AutogenUpgrade_DonorModeTabsWnd.btnPrototypeName	= "AutogenUpgrade_DonorModeTabs_SlotWnd"
UI.AutogenUpgrade_DonorModeTabsWnd.MAX_SLOTS		= 3
UI.AutogenUpgrade_DonorModeTabsWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- ----------------------------------------------------------------------------------
-- UI.AutogenUpgrade_DonorModeTabs_SlotWnd
-- ----------------------------------------------------------------------------------

UI.AutogenUpgrade_DonorModeTabs_SlotWnd = {}

-- --------------------------------------------
-- window definition
-- --------------------------------------------

UI.AutogenUpgrade_DonorModeTabs_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "AutogenUpgrade_DonorModeTabs_SlotWnd",
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
				defName 			= "autogenUpgrade_donorModeTabs_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "title",
						layer		= "UI.AutogenUpgrade_DonorModeTabs_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

				}
			}}
		},
		
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------------------------
-- interface functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )
	
	self:SetText( "", self.layers.TEXT )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end
	
end


--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	
	self:UpdateMainAnimation()
	
end


-- --------------------------------------------
-- const
-- --------------------------------------------

UI.AutogenUpgrade_DonorModeTabs_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.AutogenUpgrade_DonorModeTabs_SlotWnd.effectInfo =
{
	main =
	{
		animIdle	= "idle",
		animSel		= "select",
		animOver	= "over",
		animSelOver	= "select_over",
	}
}

-- --------------------------------------------
-- work functions
-- --------------------------------------------

--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateText( data )
	self:UpdateMainAnimation()

end


--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:UpdateText( data )
	
	local donorModeName = UI:Val2Key( UI.AutogenUpgradeWnd.donorModes, data.donorMode )
	local strId = string.format( "autogenUpgrade_donorMode_%s", donorModeName )
	local str = UI:GetStringByName( strId )
	
	self:SetText( str, self.layers.TEXT )
	
end


--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:UpdateMainAnimation()
	
	local bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	local bSelected = self:IsSelected()
	
	local anim = ""
	
	if bSelected then
		anim = bMouseOver and self.effectInfo.main.animSelOver or self.effectInfo.main.animSel
	else
		anim = bMouseOver and self.effectInfo.main.animOver or self.effectInfo.main.animIdle
	end
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end
	
end


--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateMainAnimation()

end


--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMainAnimation()
	return true

end


--
function UI.AutogenUpgrade_DonorModeTabs_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMainAnimation()
	return true

end