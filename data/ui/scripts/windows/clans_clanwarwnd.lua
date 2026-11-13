-- -----------------------------------------------------
-- UI.ClanWarWnd
-- -----------------------------------------------------

UI.ClanWarWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ClanWarWnd.layers =
{
	MAIN_EFFECT						= 0,
	MY_CLAN_RATING					= 1,
	MY_CLAN_RESTORE_HEALTH_PRICE	= 2,
	MY_CLAN_HEALTH_LABEL			= 3,
	MY_CLAN_HEALTH_VAL				= 4,
	WAIT_EFFECT						= 5, 
	WAIT_TEXT						= 6,
}

--
UI.ClanWarWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "ClanWarWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},
	
	layers =
	{
		firstOverlayLayer = UI.ClanWarWnd.layers.WAIT_EFFECT,
	
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "clanWar_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "race",
						wnd			= "UI.ClanWar_MyClanCommonInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "war_list",
						wnd			= "UI.ClanWar_ClansListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "runk_corp",
						layer		= "UI.ClanWarWnd.layers.MY_CLAN_RATING",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "btn_42",
						wnd			= "UI.ClanWar_RestoreHealthBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "iridium",
						layer		= "UI.ClanWarWnd.layers.MY_CLAN_RESTORE_HEALTH_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "durability_title",
						layer		= "UI.ClanWarWnd.layers.MY_CLAN_HEALTH_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "durability_count",
						layer		= "UI.ClanWarWnd.layers.MY_CLAN_HEALTH_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "loading",
						layer		= "UI.ClanWarWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},
		
		-- MY_CLAN_RATING
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- MY_CLAN_RESTORE_HEALTH_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- MY_CLAN_HEALTH_LABEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanWar_myClanHealth" ),
		},
		
		-- MY_CLAN_HEALTH_VAL
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
						layer		= "UI.ClanWarWnd.layers.WAIT_TEXT",
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
		"UI.ClanWar_MyClanCommonInfoWnd",
		"UI.ClanWar_ClansListWnd",
		"UI.ClanWar_RestoreHealthBtn",
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ClanWarWnd:IsMyClanInWar()

	return self.myClanWarInfo and ( self.myClanWarInfo.health > 0 or self.myClanWarInfo.health == UI.ClanWarWnd.HEALTH_HIDE )

end


--
function UI.ClanWarWnd:GetStartWarPrice( rivalCid )
	
	return _G.MasterServer_GetCostWar( rivalCid ) or 0
	
end


--
function UI.ClanWarWnd:MasterServer_OnWarMapRequest( result, requestId, param1, param2 )

	if self.bWaitingWarData then
		self.bWaitingWarData = false
		self:UpdateWaitingEffect()
	end

	if self:IsOnScreen() and result == 0 then
		self:UpdateWarControls( true )
	end

end


--
function UI.ClanWarWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	
	self.startWarRequestId		= 0
	self.restoreHealthRequestId	= 0
	self.bWaitingWarData		= false
	self:UpdateWaitingEffect()
	
end


--
function UI.ClanWarWnd:OnClanDataChanged()

	UI.ClanWar_BuyWnd:OnClanDataChanged()

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdateMyClanCommonControls()
	
	for recordIdx = 1, UI.ClanWar_ClansListWnd:GetNumRecords() do
		local slotWnd = UI.ClanWar_ClansListWnd:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnClanDataChanged()
		end
	end
	
	self:UpdateMyClanHealthControls()

end


--
function UI.ClanWarWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	local myCid = UI.Clan:GetCid() or UI.INVALID_U64_ID
	
	if cid == myCid then
		self:UpdateMyClanCommonControls()
	end
	
	if cid ~= myCid then
	
		for recordIdx = 1, UI.ClanWar_ClansListWnd:GetNumRecords() do
		
			local data = UI.ClanWar_ClansListWnd:GetRecordData( recordIdx )
			if data.cid == cid then
			
				local slotWnd = UI.ClanWar_ClansListWnd:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:OnClanNameUpdate()
				end
				
				break
				
			end
		end
	
	end

end


--
function UI.ClanWarWnd:MasterServer_OnWarStart( result, requestId, param1, param2 )
	
	if result ~= _G.MasterServer.WarResult.WR_OK then
		if requestId == self.startWarRequestId then
			self:ShowMsgOnStartWarError( result )
		end
	end
	
	-- из cpp сразу запрашиваются полные данные войны, в ui не скрываем крутяшку пока они не придут
	if result == _G.MasterServer.WarResult.WR_OK or result == _G.MasterServer.WarResult.WR_OLD_COST then
		self.bWaitingWarData = true
	end
	
	if requestId == self.startWarRequestId then
		self.startWarRequestId = 0
	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.ClanWarWnd:MasterServer_OnWarClanRevive( result, requestId, param1, param2 )

	if result ~= _G.MasterServer.WarResult.WR_OK then
		if requestId == self.restoreHealthRequestId then
			self:ShowMsgOnRestoreHealthError( result )
		end
	end
	
	-- из cpp сразу запрашиваются полные данные войны, в ui не скрываем крутяшку пока они не придут
	if result == _G.MasterServer.WarResult.WR_OK then
		self.bWaitingWarData = true
	end
	
	if requestId == self.restoreHealthRequestId then
		self.restoreHealthRequestId = 0
	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.ClanWarWnd:OnBuyWndResult( result, mode, data )
	
	if not result then
		return
	end
	
	if mode == UI.BuyWnd.modes.CLAN_START_WAR then
		self:DoStartWar( data )
		
	elseif mode == UI.BuyWnd.modes.CLAN_RESTORE_HEALTH then
		self:DoRestoreHealth()
		
	else
		sys.log( "UI.ClanWarWnd:OnBuyWndResult()[ERROR]: unhandled mode %s", tostring( mode ) )
	end
	
end

-- -------------------------------
-- vars
-- -------------------------------

-- хак: где брать эту константу?
UI.ClanWarWnd.CLAN_HEALTH_MAX = 1000000

-- WARNING: sync with WarMap.cpp
UI.ClanWarWnd.HEALTH_HIDE = -1.0
UI.ClanWarWnd.DAMAGE_HIDE = -1.0

-- -------------------------------
-- vars
-- -------------------------------

UI.ClanWarWnd.restoreHealthPriceMetaText	= nil
UI.ClanWarWnd.warMap						= nil
UI.ClanWarWnd.myClanWarInfo					= nil
UI.ClanWarWnd.startWarRequestId				= 0
UI.ClanWarWnd.restoreHealthRequestId		= 0
UI.ClanWarWnd.bWaitingWarData				= false

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ClanWarWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.restoreHealthPriceMetaText = UI.MetaText.GetNewInstance()
	self.restoreHealthPriceMetaText:InitFromLayer( self, self.layers.MY_CLAN_RESTORE_HEALTH_PRICE )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	
	self:UpdateWaitingEffect()
	
end


--
function UI.ClanWarWnd:F_Shutdown()

	if self.restoreHealthPriceMetaText then
		self.restoreHealthPriceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ClanWarWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:FullUpdate()

end


--
function UI.ClanWarWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanWarWnd:UpdateMetaTextPos()

	self.restoreHealthPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.MY_CLAN_RESTORE_HEALTH_PRICE )

end


--
function UI.ClanWarWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MY_CLAN_RESTORE_HEALTH_PRICE then
		self.restoreHealthPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ClanWarWnd:Reset()

	self.warMap = nil
	self.myClanWarInfo = nil
	
	UI.ClanWar_MyClanCommonInfoWnd:UnlinkFromParent()
	UI.ClanWar_ClansListWnd:Clear()
	self:SetText( "", self.layers.MY_CLAN_RATING )
	self:ResetMyClanHealthControls()
	
end


--
function UI.ClanWarWnd:ResetMyClanHealthControls()

	UI.ClanWar_RestoreHealthBtn:UnlinkFromParent()
	self:SetLayerVisible( false, self.layers.MY_CLAN_RESTORE_HEALTH_PRICE )
	self.restoreHealthPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.MY_CLAN_HEALTH_LABEL )
	self:SetLayerVisible( false, self.layers.MY_CLAN_HEALTH_VAL )

end


--
function UI.ClanWarWnd:FullUpdate()
	
	self:Reset()
	
	self:AddChild( UI.ClanWar_MyClanCommonInfoWnd )
	self:UpdateMyClanCommonControls()
	
	self:UpdateWarControls( false )
	
end


--
function UI.ClanWarWnd:UpdateMyClanCommonControls()

	UI.ClanWar_MyClanCommonInfoWnd:Show()	-- на самом деле это функция не показа, а апдейта
	
end


--
function UI.ClanWarWnd:UpdateWarControls( bRestoreLayout )

	self.warMap = _G.MasterServer_WarMapGet()
	
	self.myClanWarInfo = nil	
	
	local myCid = UI.Clan:GetCid() or UI.INVALID_U64_ID	
	if myCid ~= UI.INVALID_U64_ID then
	
		for clanIdx, clanInfo in pairs( self.warMap ) do
			if clanInfo.cid == myCid then
				self.myClanWarInfo = clanInfo
				break
			end
		end
	else
		sys.log( "UI.ClanWarWnd:UpdateWarControls(): not in clan" )
	end
	
	self:UpdateClansList( bRestoreLayout )
	self:UpdateMyClanRating()
	self:UpdateMyClanHealthControls()

end


--
function UI.ClanWarWnd:UpdateClansList( bRestoreLayout )

	local scrollPos = UI.ClanWar_ClansListWnd:GetScrollPos()
	
	UI.ClanWar_ClansListWnd:Clear()
	
	if not self.warMap then
		return
	end
	
	local myCid = UI.Clan:GetCid() or UI.INVALID_U64_ID
	
	local recordsDataSorted = {}
	for clanIdx, clanInfo in pairs( self.warMap ) do
	
		if clanInfo.cid ~= myCid then
		
			local recordData = {}
			
			recordData.cid		= clanInfo.cid
			recordData.rating	= clanInfo.rating
			
			recordData.bIsInWarWithMe		= false
			recordData.damageToThisFromMe	= 0
			recordData.damageToMeFromThis	= 0
			
			if clanInfo.rivals then
				for rivalIdx, rivalInfo in pairs( clanInfo.rivals ) do
					if rivalInfo.cidAttacker == myCid then
						recordData.bIsInWarWithMe		= true
						recordData.damageToThisFromMe	= rivalInfo.damage
						break
					end
				end
			end
			
			if recordData.bIsInWarWithMe then
			
				local bFoundInMyRivals = false
				
				if self.myClanWarInfo and self.myClanWarInfo.rivals then
					for myRivalIdx, myRivalInfo in pairs( self.myClanWarInfo.rivals ) do
						if myRivalInfo.cidAttacker == clanInfo.cid then
							recordData.damageToMeFromThis = myRivalInfo.damage
							bFoundInMyRivals = true
							break
						end
					end
				end
				
				if not bFoundInMyRivals then
					sys.log( "UI.ClanWarWnd:UpdateClansList() my clan is found in clan's %s rivals list, but not vice versa", _G.U64ToStr( clanInfo.cid ) )
				end
				
			end
			
			table.insert( recordsDataSorted, recordData )
			
		end
		
	end
	
	local function fnSort( recordData1, recordData2 )
		
		if recordData1.bIsInWarWithMe ~= recordData2.bIsInWarWithMe then
			return recordData1.bIsInWarWithMe
		end
		
		if recordData1.rating ~= recordData2.rating then
			return recordData1.rating > recordData2.rating
		end
		
		return recordData1.cid < recordData2.cid
	
	end
	
	table.sort( recordsDataSorted, fnSort )
	
	for recordIdx, recordData in ipairs( recordsDataSorted ) do
		UI.ClanWar_ClansListWnd:AddRecord( recordData )
	end
	
	if bRestoreLayout and scrollPos ~= -1 then
		UI.ClanWar_ClansListWnd:SetScrollPos( scrollPos )
	end
	
end


--
function UI.ClanWarWnd:UpdateMyClanRating()

	self:SetText( "", self.layers.MY_CLAN_RATING )

	if not self.warMap then
		return
	end
	
	local strRatingVal = ""
	if self.myClanWarInfo then
		strRatingVal = string.format( "%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), UI:Num2StrSeparatedBy3( UI:Round( self.myClanWarInfo.rating ) ) )
	else
		strRatingVal = string.format( "%s%s", UI:Color2Str( UI.RED_COLOR ), UI:GetStringByName( "clanWar_myClanRating_undefined" ) )
	end
	
	local strRating = string.format( "%s: %s", UI:GetStringByName( "clanWar_myClanRating" ), strRatingVal )
	self:SetText( strRating, self.layers.MY_CLAN_RATING )
	
end


--
function UI.ClanWarWnd:UpdateMyClanHealthControls()
	
	self:ResetMyClanHealthControls()
	
	if not self.warMap then
		return
	end
	
	-- текущее здоровье (показывается только если не 0)
	
	if self.myClanWarInfo and self.myClanWarInfo.health > 0 then
	
		self:SetLayerVisible( true, self.layers.MY_CLAN_HEALTH_LABEL )
		
		self:SetLayerVisible( true, self.layers.MY_CLAN_HEALTH_VAL )
		
		local fixedHealth = UI:Round( self.myClanWarInfo.health )
		
		local perc = fixedHealth / UI.ClanWarWnd.CLAN_HEALTH_MAX * 100
		local healthValColor = self:GetColor( self.layers.MY_CLAN_HEALTH_VAL )
		if perc > 70 then
			healthValColor = 0xff00ff00	-- зеленый
		elseif perc > 30 then
			healthValColor = 0xffffff00	-- желтый
		else
			healthValColor = 0xffff0000	-- красный
		end
		
		local strHealthVal = string.format( "%s%s/%s", UI:Color2Str( healthValColor ), UI:Num2StrSeparatedBy3( fixedHealth ), UI:Num2StrSeparatedBy3( UI.ClanWarWnd.CLAN_HEALTH_MAX ) )
		self:SetText( strHealthVal, self.layers.MY_CLAN_HEALTH_VAL )
		
	end
	
	-- восстановление здоровья (показывается только если здоровье 0)
	
	if ( not self.myClanWarInfo or self.myClanWarInfo.health == 0 ) and UI.Clan:HasPermission( _G.MasterServer.ClanActionPrivileges.CAP_WAR_ACTION ) then
		
		-- цена
		self:SetLayerVisible( true, self.layers.MY_CLAN_RESTORE_HEALTH_PRICE )
		
		local price = UI:GetClanWarRestoreHealthPrice()
		local priceInfo =
		{
			priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
			val			= price,
			bIsBuyPrice	= true,
			basePrice	= price,
		}
		
		local str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.MY_CLAN_RESTORE_HEALTH_PRICE ), false, true, true, nil )
		self.restoreHealthPriceMetaText:SetText( str, true )
		
		-- кнопка
		self:AddChild( UI.ClanWar_RestoreHealthBtn )
		UI.ClanWar_RestoreHealthBtn:Enable( price <= UI:GetIridium() )
		
	end
	
end


--
function UI.ClanWarWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.ClanWarWnd:IsWaiting()
	
	return
		self.startWarRequestId ~= 0
		or self.restoreHealthRequestId ~= 0
		or self.bWaitingWarData
		
end


--
function UI.ClanWarWnd:F_OnEventSaveUiState()
	
	UI.store.ClanWarWnd =
	{
		startWarRequestId		= self.startWarRequestId,
		restoreHealthRequestId	= self.restoreHealthRequestId,
		bWaitingWarData			= self.bWaitingWarData,
	}
	
end


--
function UI.ClanWarWnd:F_OnEventRestoreUiState()
	
	if UI.store.ClanWarWnd then
	
		self.startWarRequestId		= UI.store.ClanWarWnd.startWarRequestId
		self.restoreHealthRequestId	= UI.store.ClanWarWnd.restoreHealthRequestId
		self.bWaitingWarData		= UI.store.ClanWarWnd.bWaitingWarData
		self:UpdateWaitingEffect()
		
		UI.store.ClanWarWnd = nil
		
	end
	
end


--
function UI.ClanWarWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "ClanWar_ClansSlot_StartWarBtn" ) then
		
		if not self:IsWaiting() then
			local clanSlotWnd = UI:GetAncestorKindOf( wnd, "ClanWar_ClansSlotWnd" )
			self:TryStartWar( clanSlotWnd:GetRecordData().cid )
		end
		
	elseif wnd == UI.ClanWar_RestoreHealthBtn then
		
		if not self:IsWaiting() then
			self:TryRestoreHealth()
		end

	end
	
	return true
	
end


--
function UI.ClanWarWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	UI.ClanWar_ClansListWnd:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


--
function UI.ClanWarWnd:TryStartWar( cid )

	if self:IsWaiting() then
		sys.log( "UI.ClanWarWnd:TryStartWar()[ERROR]: waiting for another request" )
		return
	end
	
	if not self.myClanWarInfo then
		sys.log( "UI.ClanWarWnd:TryStartWar()[ERROR]: no war data for my clan" )
		return
	end
	
	self:LaunchBuyWnd( UI.BuyWnd.modes.CLAN_START_WAR, { cid = cid, price = self:GetStartWarPrice( cid ) } )

end


--
function UI.ClanWarWnd:DoStartWar( data )

	if self:IsWaiting() then
		sys.log( "UI.ClanWarWnd:DoStartWar()[ERROR]: waiting for another request" )
		return
	end
	
	if type( data ) ~= "table" or type( data.cid ) ~= "userdata" or type( data.price ) ~= "number" then
		sys.log( "UI.ClanWarWnd:DoStartWar()[ERROR]: invalid param" )
		return
	end
	
	self.startWarRequestId = _G.MasterServer_WarStart( data.cid, data.price ) or 0
	if self.startWarRequestId == 0 then
		self:ShowMsgOnStartWarError( _G.MasterServer.WarResult.WR_ERROR )
	end
	
	self:UpdateWaitingEffect()

end


--
function UI.ClanWarWnd:ShowMsgOnStartWarError( result )
	
	UI:ShowErrorMsg( "clanWar_error_startWar", result, "_G.MasterServer.WarResult" )
	
end


--
function UI.ClanWarWnd:TryRestoreHealth()
	
	if self:IsWaiting() then
		sys.log( "UI.ClanWarWnd:TryRestoreHealth()[ERROR]: waiting for another request" )
		return
	end
	
	self:LaunchBuyWnd( UI.BuyWnd.modes.CLAN_RESTORE_HEALTH )
	
end


--
function UI.ClanWarWnd:DoRestoreHealth()
	
	if self:IsWaiting() then
		sys.log( "UI.ClanWarWnd:DoRestoreHealth()[ERROR]: waiting for another request" )
		return
	end
	
	self.restoreHealthRequestId = _G.MasterServer_WarClanRevive() or 0
	if self.restoreHealthRequestId == 0 then
		self:ShowMsgOnRestoreHealthError( _G.MasterServer.WarResult.WR_ERROR )
	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.ClanWarWnd:ShowMsgOnRestoreHealthError( result )
	
	UI:ShowErrorMsg( "clanWar_error_restoreHealth", result, "_G.MasterServer.WarResult" )
	
end


--
function UI.ClanWarWnd:LaunchBuyWnd( mode, data )

	UI.ClanWar_BuyWnd:Setup( mode, false, data )
	UI.ClanWar_BuyWnd:Show()
	UI:PlayGlobalSound( UI.sounds.btnClick )

end


--
function UI.ClanWarWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		return
	end
	
	UI.ClanWar_BuyWnd:Hide()

end


--
function UI.ClanWarWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	self:HideChildModals()

end


-- -----------------------------------------------------
-- UI.ClanWar_MyClanCommonInfoWnd
-- -----------------------------------------------------

UI.ClanWar_MyClanCommonInfoWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Clans_RaceWnd",
		
		props =
		{
			name = "ClanWar_MyClanCommonInfoWnd"
		}
	}
}

-- -----------------------------------------------------
-- UI.ClanWar_ClansListWnd
-- -----------------------------------------------------

UI.ClanWar_ClansListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ClanWar_ClansListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "ClanWar_ClansListWnd",
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
				defName 			= "clanWar_clansList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "header",
						layer		= "UI.ClanWar_ClansListWnd.layers.HEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- HEADER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "clanWar_clansList_header",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "name",
						layer		= "UI.ClanWar_ClansListWnd.layers.HEADER_CLAN_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "damage",
						layer		= "UI.ClanWar_ClansListWnd.layers.HEADER_DAMAGE_TO_THIS_FROM_ME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "losses",
						layer		= "UI.ClanWar_ClansListWnd.layers.HEADER_DAMAGE_TO_ME_FROM_THIS",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "data_2",
						layer		= "UI.ClanWar_ClansListWnd.layers.HEADER_RATING",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- HEADER_CLAN_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanWar_clansListHeader_name" ),
		},
		
		-- HEADER_DAMAGE_TO_THIS_FROM_ME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanWar_clansListHeader_damage" ),
		},
		
		-- HEADER_DAMAGE_TO_ME_FROM_THIS
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanWar_clansListHeader_losses" ),
		},
		
		-- HEADER_RATING
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanWar_clansListHeader_rating" ),
		},
	}
}

-- -------------------------------------
-- const
-- -------------------------------------

UI.ClanWar_ClansListWnd.layers =
{
	MAIN_EFFECT						= 0,
	HEADER_EFFECT					= 1,
	HEADER_CLAN_NAME				= 2,
	HEADER_DAMAGE_TO_THIS_FROM_ME	= 3,
	HEADER_DAMAGE_TO_ME_FROM_THIS	= 4,
	HEADER_RATING					= 5,
}

UI.ClanWar_ClansListWnd.btnPrototypeName	= "ClanWar_ClansSlotWnd"
UI.ClanWar_ClansListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.ClanWar_ClansListWnd.MAX_SLOTS			= 10

UI.ClanWar_ClansListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
	}
}

-- -----------------------------------------------------
-- UI.ClanWar_ClansSlotWnd
-- -----------------------------------------------------

UI.ClanWar_ClansSlotWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ClanWar_ClansSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",
	
	props =
	{
		name		= "ClanWar_ClansSlotWnd",
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
				defName 			= "clanWar_clansSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "name",
						layer		= "UI.ClanWar_ClansSlotWnd.layers.CLAN_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "damage",
						layer		= "UI.ClanWar_ClansSlotWnd.layers.DAMAGE_TO_THIS_FROM_ME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "losses",
						layer		= "UI.ClanWar_ClansSlotWnd.layers.DAMAGE_TO_ME_FROM_THIS",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "rating",
						layer		= "UI.ClanWar_ClansSlotWnd.layers.RATING",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "damage",
						layer		= "UI.ClanWar_ClansSlotWnd.layers.START_WAR_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- CLAN_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- DAMAGE_TO_THIS_FROM_ME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- DAMAGE_TO_ME_FROM_THIS
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- RATING
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- START_WAR_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ClanWar_ClansSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )
	
	self:SetText( "", self.layers.CLAN_NAME ) 
	self:SetLayerVisible( false, self.layers.DAMAGE_TO_THIS_FROM_ME ) 
	self:SetLayerVisible( false, self.layers.DAMAGE_TO_ME_FROM_THIS )
	self:SetText( "", self.layers.RATING )
	self:SetLayerVisible( false, self.layers.START_WAR_PRICE )
	self.startWarPriceMetaText:SetText( "", true )
	self.startWarBtn:UnlinkFromParent()
	self.clanIcoWnd:SetTexture( "NoData" )	-- у этого элемента нет функции резета

end


--
function UI.ClanWar_ClansSlotWnd:OnClanDataChanged()

	self:UpdateStartWarControls( self:GetRecordData() )

end


--
function UI.ClanWar_ClansSlotWnd:OnClanNameUpdate()

	local data = self:GetRecordData()
	
	self:UpdateClanIco( data )
	self:UpdateClanName( data )

end

-- -------------------------------
-- const
-- -------------------------------

UI.ClanWar_ClansSlotWnd.layers =
{
	MAIN_EFFECT				= 0,
	CLAN_NAME				= 1,
	DAMAGE_TO_THIS_FROM_ME	= 2,
	DAMAGE_TO_ME_FROM_THIS	= 3,
	RATING					= 4,
	START_WAR_PRICE			= 5,
}

UI.ClanWar_ClansSlotWnd.effectInfo =
{
	main =
	{
		clanIcoLocator		= "clan_ico",
		startWarBtnLocator	= "war",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ClanWar_ClansSlotWnd.clanIcoWnd				= nil
UI.ClanWar_ClansSlotWnd.startWarBtn				= nil
UI.ClanWar_ClansSlotWnd.startWarPriceMetaText	= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ClanWar_ClansSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end

	self.startWarPriceMetaText = UI.MetaText.GetNewInstance()
	self.startWarPriceMetaText:InitFromLayer( self, self.layers.START_WAR_PRICE )
	
	self:CreateControls()

end


--
function UI.ClanWar_ClansSlotWnd:F_Shutdown()

	if self.startWarPriceMetaText then
		self.startWarPriceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ClanWar_ClansSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ClanWar_ClansSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanWar_ClansSlotWnd:UpdateMetaTextPos()

	self.startWarPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.START_WAR_PRICE )

end


--
function UI.ClanWar_ClansSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.START_WAR_PRICE then
		self.startWarPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ClanWar_ClansSlotWnd:CreateControls()

	self.clanIcoWnd		= UI:CreateChildWnd( self, UI.GameplayMapGalaxyClanOwner, "" )
	self.startWarBtn	= UI:CreateChildWnd( self, UI.ClanWar_ClansSlot_StartWarBtn, "" )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.clanIcoWnd, mainEffect, self.effectInfo.main.clanIcoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.startWarBtn, mainEffect, self.effectInfo.main.startWarBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.ClanWar_ClansSlotWnd:UpdateForData( data, bAnimated )
	
	self:Reset()
	
	self:UpdateClanIco( data )
	self:UpdateClanName( data )
	self:UpdateDamageToThisFromMe( data )
	self:UpdateDamageToMeFromThis( data )
	self:UpdateRating( data )
	self:UpdateStartWarControls( data )
	
end


--
function UI.ClanWar_ClansSlotWnd:UpdateClanIco( data )
	
	self.clanIcoWnd:SetClan( data.cid, self )
	
end


--
function UI.ClanWar_ClansSlotWnd:UpdateClanName( data )
	
	local clanName = UI:GetFullClanName( data.cid )
	self:SetText( clanName, self.layers.CLAN_NAME )
	
end


--
function UI.ClanWar_ClansSlotWnd:UpdateDamageToThisFromMe( data )
	
	if UI.ClanWarWnd:IsMyClanInWar() and data.bIsInWarWithMe then
		self:SetLayerVisible( true, self.layers.DAMAGE_TO_THIS_FROM_ME )

		local str = ""
		if data.damageToThisFromMe == UI.ClanWarWnd.DAMAGE_HIDE then
			str = UI:GetStringByName( "clanWar_clansList_hideDamage" )
		else
			str = UI:Num2StrSeparatedBy3( data.damageToThisFromMe )
		end
		-- local str = UI:Num2StrSeparatedBy3( data.damageToThisFromMe )

		self:SetText( str, self.layers.DAMAGE_TO_THIS_FROM_ME )
	else
		self:SetLayerVisible( false, self.layers.DAMAGE_TO_THIS_FROM_ME )
	end
	
end


--
function UI.ClanWar_ClansSlotWnd:UpdateDamageToMeFromThis( data )
	
	if UI.ClanWarWnd:IsMyClanInWar() and data.bIsInWarWithMe then
		self:SetLayerVisible( true, self.layers.DAMAGE_TO_ME_FROM_THIS )

		local str = ""
		if data.damageToThisFromMe == UI.ClanWarWnd.DAMAGE_HIDE then
			str = UI:GetStringByName( "clanWar_clansList_hideDamage" )
		else
			str = UI:Num2StrSeparatedBy3( data.damageToMeFromThis )
		end
		--local str = UI:Num2StrSeparatedBy3( data.damageToMeFromThis )

		self:SetText( str, self.layers.DAMAGE_TO_ME_FROM_THIS )
	else
		self:SetLayerVisible( false, self.layers.DAMAGE_TO_ME_FROM_THIS )
	end

end


--
function UI.ClanWar_ClansSlotWnd:UpdateRating( data )
	
	local str = UI:Num2StrSeparatedBy3( UI:Round( data.rating ) )
	self:SetText( str, self.layers.RATING )

end


--
function UI.ClanWar_ClansSlotWnd:UpdateStartWarControls( data )

	self:SetLayerVisible( false, self.layers.START_WAR_PRICE )
	self.startWarPriceMetaText:SetText( "", true )
	self.startWarBtn:UnlinkFromParent()
	
	local bCanStartWar =
		UI.ClanWarWnd:IsMyClanInWar()
		and not data.bIsInWarWithMe
		and UI.Clan:HasPermission( _G.MasterServer.ClanActionPrivileges.CAP_WAR_ACTION )
		
	if not bCanStartWar then
		return
	end
	
	-- цена
	self:SetLayerVisible( true, self.layers.START_WAR_PRICE )
	
	local price = UI.ClanWarWnd:GetStartWarPrice( data.cid )
	local priceInfo =
	{
		priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
		val			= price,
		bIsBuyPrice	= true,
		basePrice	= price,
	}
	
	local str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.START_WAR_PRICE ), false, true, true, nil )
	self.startWarPriceMetaText:SetText( str, true )
	
	-- кнопка
	self:AddChild( self.startWarBtn )
	self.startWarBtn:Enable( price <= UI:GetIridium() )
	
end

-- -----------------------------------------------------
-- UI.ClanWar_ClansSlot_StartWarBtn
-- -----------------------------------------------------

UI.ClanWar_ClansSlot_StartWarBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",
		
		props =
		{
			name		= "ClanWar_ClansSlot_StartWarBtn",
			isPrototype	= true,
		}
	},
	
	textId = "clanWar_startWarBtn"
}

-- -----------------------------------------------------
-- UI.ClanWar_RestoreHealthBtn
-- -----------------------------------------------------

UI.ClanWar_RestoreHealthBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",
		
		props =
		{
			name		= "ClanWar_RestoreHealthBtn",
		}
	},
	
	textId = "clanWar_restoreHealthBtn"
}

-- -----------------------------------------------------
-- UI.ClanWar_BuyWnd
-- -----------------------------------------------------

UI.ClanWar_BuyWnd =
{
	def =
	{
		className 	= "Wnd",
		prototype	= "BuyWnd",
	
		props =
		{
			name	= "ClanWar_BuyWnd",
		},
	},

	mainWndName = "ClanWarWnd",
}