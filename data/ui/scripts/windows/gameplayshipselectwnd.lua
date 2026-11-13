-- ----------------------------------------------------------------------------
--
-- Workfile: gameplayshipselectwnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------


-- -----------------------------------------------------------------
-- UI.GameplayShipSelectWnd
-- -----------------------------------------------------------------

UI.GameplayShipSelectWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayShipSelectWnd.def =
{
	className = "Wnd",
	prototype = "FullScreenWnd",
	props =
	{
		name			= "GameplayShipSelectWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName				= "msgBox_main",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.GameplayShipSelectWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_win",
						layer		= "UI.GameplayShipSelectWnd.layers.WORK_EFFECT",
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
				defName				= "blackBg",
				defaultAnimation    = "idle",
			}}
		},
        -- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,	
			effects =
			{{
				defName 			= "free_space_ship_select_main",
       			defaultAnimation	= "idle",
           		links =
           		{
           			{
           				objName		= "loading",
           				layer		= "UI.GameplayShipSelectWnd.layers.LOADING_EFFECT",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "title",
           				layer		= "UI.GameplayShipSelectWnd.layers.TITLE",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "btn_x",
           				wnd			= "UI.GameplayShipSelect_CrossBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_1",
           				wnd			= "UI.GameplayShipSelect_CreateCancelBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_2",
           				wnd			= "UI.GameplayShipSelect_CreateOkBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_2",
           				wnd			= "UI.GameplayShipSelect_RefillMoneyBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "karma",
           				wnd			= "UI.GameplayShipSelect_KarmaBarWnd",
           				animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "reputation",
						wnd			= "UI.GameplayShipSelect_FactionRepWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
           			{
           				objName		= "list",
           				wnd			= "UI.GameplayShipSelect_ShipListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "price",
           				layer		= "UI.GameplayShipSelectWnd.layers.PRICE",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           		}
           	}}
		},
		-- LOADING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "hangar_waitCircleSmall",
       			defaultAnimation	= "idle",
       		}}
       	},
       	-- TITLE
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
   			text 		= "^gameplaySelect_ships_title",
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
	},

	children = { "UI.GameplayShipSelect_CrossBtn", "UI.GameplayShipSelect_CreateOkBtn", "UI.GameplayShipSelect_CreateCancelBtn", "UI.GameplayShipSelect_KarmaBarWnd", "UI.GameplayShipSelect_FactionRepWnd", "UI.GameplayShipSelect_ShipListWnd", "UI.GameplayShipSelect_RefillMoneyBtn" }
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayShipSelectWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	if self:IsOnScreen() then
		if field == MasterServer.UserProfileField.UPF_GENERAL_STATS then
			if result == 0 then
				if uid == _G.MasterServer_GetLocalUserId() then
					self:SetWait( false )
					self:Update()
				end
			else
				local commonStats = UI.Profile:GetCommonStats()
				if commonStats then
					self:Update()
				else
					UI.Profile:RequestCommonStats( _G.MasterServer_GetLocalUserId() )
				end
			end
		end
	end
end


--
function UI.GameplayShipSelectWnd:Setup( zoneId )

	if zoneId ~= nil then
		if type( zoneId ) ~= "number" then
			sys.log( "UI.GameplayShipSelectWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"zoneId\"); \"number\" or \"nil\" expected, got \"%s\"", type( zoneId ) )
			return
		end
	end

	if zoneId == nil then
		zoneId = -1
	end

	self.zoneId = zoneId

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.GameplayShipSelectWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if self:IsOnScreen() and result == 0 then
		self:UpdatePrice()
		self:UpdateButtons()
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

--
UI.GameplayShipSelectWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT 		= 1,
    WORK_EFFECT 	= 2,
    LOADING_EFFECT	= 3,
    TITLE 			= 4,
	PRICE			= 5,
}

--
UI.GameplayShipSelectWnd.sounds = 
{
	hide 	= "sound/ui/MsgHide",
}

UI.GameplayShipSelectWnd.battleSlot = 0
UI.GameplayShipSelectWnd.priceMetaText = nil
UI.GameplayShipSelectWnd.zoneId = -1

-- -----------------------------------
-- waork functions
-- -----------------------------------

--
function UI.GameplayShipSelectWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

end


--
function UI.GameplayShipSelectWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.GameplayShipSelectWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.GameplayShipSelectWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.GameplayShipSelectWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.GameplayShipSelectWnd:Update()
	local commonStats = UI.Profile:GetCommonStats()
	if commonStats then

		local factionRep = {}
		for i = 0, ai.Faction.NUM - 1 do
			local key = MasterServer.UserProfileGeneralStat.UPGS_FACTION_REP_EMPIRE + i
			local rep = commonStats[ key ]
			if type( rep ) == "number" then
				factionRep[ i ] = rep
			else
				sys.log( "UI.GameplayShipSelectWnd:Update()()[ERROR]: invalid type of the field \"commonStats[%d]\"; \"number\" expected, got \"%s\"", key, type( rep ) )
				break
			end
		end

		UI.GameplayShipSelect_KarmaBarWnd:Setup( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_KARMA ] )
		UI.GameplayShipSelect_FactionRepWnd:Setup( factionRep )
	end
end

--
function UI.GameplayShipSelectWnd:SetWait( bool )
	if bool then 
		self:SetLayerVisible( true, self.layers.LOADING_EFFECT )
		UI.GameplayShipSelect_KarmaBarWnd:UnlinkFromParent()
		UI.GameplayShipSelect_FactionRepWnd:UnlinkFromParent()
	else
		self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
		self:AddChild( UI.GameplayShipSelect_KarmaBarWnd )
		self:AddChild( UI.GameplayShipSelect_FactionRepWnd )
	end
end

--
function UI.GameplayShipSelectWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateMetaTextPos()
	self:FullUpdate()
end


--
function UI.GameplayShipSelectWnd:FullUpdate()

	local profile = UI.Profile:RequestCommonStats( _G.MasterServer_GetLocalUserId() )
	local commonStats = UI.Profile:GetCommonStats()
	if commonStats then
		self:SetWait( false )
		self:Update()
	else
		self:SetWait( true )
	end
	self:UpdatePrice()
	self:UpdateButtons()
	UI.GameplayShipSelect_ShipListWnd:Update()
	if UI.GameplayShipSelect_ShipListWnd:IsEmpty() then
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_battle_slot_empty" ), UI.MBS_OK )
		self:Hide()
	end

end


--
function UI.GameplayShipSelectWnd:OnEscape()
	--UI:PlayGlobalSound( UI.sounds.showScreen )
	self:Hide()
	return true
end

--
function UI.GameplayShipSelectWnd:Hide( skipResetForceFreeSpace )
	if not skipResetForceFreeSpace then
		--UI.GameplayPveMapWnd:GetForceFreeSapceAndReset()
		self.battleSlot, self.isFromSave = 0, false
	end
	UI.FullScreenWnd.Hide( self )
	UI:PlayGlobalSound( self.sounds.hide )
end

--
function UI.GameplayShipSelectWnd:GetSelectedBattleSlot()
	local battleSlot, fromSave = self.battleSlot, self.isFromSave
	self.battleSlot, self.isFromSave = 0, false
	return battleSlot, fromSave
end

--
function UI.GameplayShipSelectWnd:SetSlotAndStartFromSave( slotIdx )
	self.battleSlot = slotIdx
	self.isFromSave = true
	UI.GameplayWnd:StartMatchMaking()
end

--[[
function UI.GameplayShipSelectWnd:Show()
	self.battleSlot = UI.HangarWnd:GetSelBattleSlot()--data.shipSlotIdx + 1
	UI.GameplayWnd:StartMatchMaking()
end
]]

--
function UI.GameplayShipSelectWnd:OnOk()

	if not UI.GameplayShipSelect_CreateOkBtn:IsChildOf( self ) or not UI.GameplayShipSelect_CreateOkBtn:IsEnabled() then
		sys.log( "UI.GameplayShipSelectWnd:OnOk()[ERROR]: ok button ok is not active" )
		return
	end

	local recordIdx = UI.GameplayShipSelect_ShipListWnd:GetSelectedRecord()
	local data = UI.GameplayShipSelect_ShipListWnd:GetRecordData( recordIdx )
	self.battleSlot = data.shipSlotIdx + 1
	self:Hide( true )
--	UI.GameplayWnd:StartMatchMaking()
	UI.GameplayWnd:PrepareAndStartFreeSpace( self.battleSlot, self.zoneId )
	--[[UI.GameplayPveMapWnd:UndockToFreeSpace(  )
	UI:PlayGlobalSound( self.sounds.hide )]]
end

--
function UI.GameplayShipSelectWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.GameplayShipSelect_CrossBtn == wnd or UI.GameplayShipSelect_CreateCancelBtn == wnd then
		self:Hide()
	elseif UI:IsWndKindOf( wnd, "Hangar_ShipSlotWnd_proto" ) then
		local recordIdx = wnd:GetRecord()			
		--local data = UI.GameplayShipSelect_ShipListWnd:GetRecordData( recordIdx )
		if recordIdx ~= UI.GameplayShipSelect_ShipListWnd:GetSelectedRecord() then
			UI.GameplayShipSelect_ShipListWnd:SelectRecord( recordIdx )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end
	elseif UI.GameplayShipSelect_CreateOkBtn == wnd then
		self:OnOk()

	elseif UI.GameplayShipSelect_RefillMoneyBtn == wnd then
		self:OnRefillMoney()
	end
	return true
end

--
function UI.GameplayShipSelectWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI:IsWndKindOf( w, "Hangar_ShipSlotWnd_proto" ) then
		--[[local recordIdx = w:GetRecord()			
		local data = UI.GameplayShipSelect_ShipListWnd:GetRecordData( recordIdx )
		UI.GameplayPveMapWnd:UndockToFreeSpace( data.shipSlotIdx )
		UI:PlayGlobalSound( self.sounds.hide )
		self:Hide()]]
		if UI.GameplayShipSelect_CreateOkBtn:IsChildOf( self ) and UI.GameplayShipSelect_CreateOkBtn:IsEnabled() then
			self:OnOk()
		end
	end
	return true
end


--
function UI.GameplayShipSelectWnd:UpdatePrice()

	local str = "error"

	local priceInfo = self:GetPrice()
	if priceInfo then

    	local strVal = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, nil )

    	str = UI:GetStringByName( "gameplaySelect_ships_price" )
    	str = string.format( "%s: %s", str, strVal )

	end

	self.priceMetaText:SetText( str, true )	

end


--
function UI.GameplayShipSelectWnd:UpdateButtons()
	
    UI.GameplayShipSelect_CreateOkBtn:UnlinkFromParent()
    UI.GameplayShipSelect_RefillMoneyBtn:UnlinkFromParent()

	local priceInfo = self:GetPrice()
	if priceInfo then

    	if UI:IsEnoughMoneyForPrice( priceInfo, false, nil ) then

    		self:AddChild( UI.GameplayShipSelect_CreateOkBtn )
			UI.GameplayShipSelect_CreateOkBtn:Enable( true )
	
    	else

			if priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS or priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then
				self:AddChild( UI.GameplayShipSelect_RefillMoneyBtn )
				UI.GameplayShipSelect_RefillMoneyBtn:Setup( priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS and UI.RefillMoneyBtn.modes.CREDITS or UI.RefillMoneyBtn.modes.GOLD )
			else
    			self:AddChild( UI.GameplayShipSelect_CreateOkBtn )
				UI.GameplayShipSelect_CreateOkBtn:Enable( false )
			end

    	end

	end

end


--
function UI.GameplayShipSelectWnd:GetPrice()

	return UI:GetTransferToZonePrice( self.zoneId )

end


--
function UI.GameplayShipSelectWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	UI.store.GameplayShipSelectWnd =
	{
		zoneId	= self.zoneId
	}

end


--
function UI.GameplayShipSelectWnd:F_OnEventRestoreUiState()

	if UI.store.GameplayShipSelectWnd then

		self:Setup( UI.store.GameplayShipSelectWnd.zoneId )

		UI.store.GameplayShipSelectWnd = nil
	end

end


--
function UI.GameplayShipSelectWnd:OnRefillMoney()

	local moneyMode = UI.GameplayShipSelect_RefillMoneyBtn:GetMode()

	if moneyMode == UI.RefillMoneyBtn.modes.CREDITS then
		UI.HangarWnd:ShowBuyCreditsWnd()

	elseif moneyMode == UI.RefillMoneyBtn.modes.GOLD then
		UI.HangarWnd:ShowBuyGoldWnd()

	else
		sys.log( "UI.GameplayShipSelectWnd:RefillMoney()[ERROR]: invalid refill money mode: %s", tostring( moneyMode ) )
	end

end


-- ------------------------------------------------------------------------
-- UI.Gameplay_CrossBtn
-- ------------------------------------------------------------------------
--
UI.GameplayShipSelect_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Gameplay_CrossBtn"
		}
	}
}


--
UI.GameplayShipSelect_CreateOkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "GameplayShipSelect_CreateOkBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^button_ready",
   			},
   		}
	},
}

--
UI.GameplayShipSelect_CreateCancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ClansMyClan_CreateCancelBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^cancel",
   			},
   		}
	},
}


UI.GameplayShipSelect_RefillMoneyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "RefillMoneyBtn",

		props =
		{
			name		= "GameplayShipSelect_RefillMoneyBtn",
		},
	}
}

--
UI.GameplayShipSelect_KarmaBarWnd = {}
UI.GameplayShipSelect_KarmaBarWnd.def = 
{
	className = "Wnd",
	prototype = "KarmaBarWnd",

	props =
	{
		name			= "GameplayShipSelect_KarmaBarWnd",
	},
}

--
UI.GameplayShipSelect_FactionRepWnd = {}
UI.GameplayShipSelect_FactionRepWnd.def = 
{
	className = "Wnd",
	prototype = "FactionRepWnd",

	props =
	{
		name			= "GameplayShipSelect_FactionRepWnd",
	},
}


--
UI.GameplayShipSelect_ShipListWnd = {}
UI.GameplayShipSelect_ShipListWnd.def = 
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",
	props =
	{
		name	= "GameplayShipSelect_ShipListWnd",
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
				defName 			= "free_space_ship_select_list",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "text_1",
						layer 		= "UI.GameplayShipSelect_ShipListWnd.layers.TITLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_2",
						layer 		= "UI.GameplayShipSelect_ShipListWnd.layers.DESC_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- TITLE_TEXT
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
   			text 			= "^gameplaySelect_ships_list_title"
		},
		-- DESC_TEXT
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
   			--text 			= "^gameplaySelect_ships_list_title"
		},
	}
}

-- ------------------------------------------------------------------------
-- consts
-- ------------------------------------------------------------------------
UI.GameplayShipSelect_ShipListWnd.btnPrototypeName	= "Hangar_ShipSlotWnd_720"
UI.GameplayShipSelect_ShipListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK
UI.GameplayShipSelect_ShipListWnd.MAX_SLOTS			= 4

UI.GameplayShipSelect_ShipListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix		= "ship_slot_",
		scrollObjName			= "",
		animIdle				= "idle",
	}
}

UI.GameplayShipSelect_ShipListWnd.layers = 
{
	MAIN_EFFECT 				= 0,
	TITLE_TEXT 					= 1,
	DESC_TEXT 					= 2,
}

--[[
function UI.GameplayShipSelect_ShipListWnd:SelectRecord( recordIdx, bAnimated )
	UI.BaseListWnd.SelectRecord( self, recordIdx, bAnimated )
	local data = self:GetRecordData( recordIdx )
	local lootCount = _G.CalcDesiredCargoHoldSize( _G.MasterServer_GetPremiumTimeLeftSeconds() > 0, data.shipItem.defName )
	local str = UI:GetStringByName( "gameplaySelect_ships_loot_count" )
	str = string.gsub( str, "%$value%$", lootCount )
	self:SetText( str, self.layers.DESC_TEXT )
end
]]

--
function UI.GameplayShipSelect_ShipListWnd:InitSlots()	
	UI.ButtonsListWnd.InitSlots( self )
	for slotIdx, slot in pairs( self.slots ) do
		if slot.btn then
			slot.btn:SetMode( UI.Hangar_ShipSlotWnd_proto.modes.SHIP_SELECT )
		end
	end
end

--
function UI.GameplayShipSelect_ShipListWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:ReAlign()
end

--
function UI.GameplayShipSelect_ShipListWnd:F_OnScreenPosChanged( oldX0, oldY0 )
	self:OnScreenPosChanged( oldX0, oldY0 )
	self:ReAlign()
end

--
function UI.GameplayShipSelect_ShipListWnd:ReAlign()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local pos1 = mainEffect:GetObjPos( "ship_slot_1" )
	local size1 = mainEffect:GetObjSize( "ship_slot_1" )
	local pos2 = mainEffect:GetObjPos( "ship_slot_2" )
	local posLast = mainEffect:GetObjPos( "ship_slot_4" )
	local delta = pos2.x - ( pos1.x + size1.x )
	local size = size1.x * self:GetNumRecords() + delta * ( self:GetNumRecords() - 1 )
	local cur = pos1.x + ( ( ( posLast.x + size1.x - pos1.x ) - size ) / 2 )
	for i = 1, self:GetNumRecords() do
		self.slots[ i ].btn:SetLeft( cur ) 
		cur = cur + size1.x + delta
	end
end

--
function UI.GameplayShipSelect_ShipListWnd:Update()
	self:Clear()
	for slotIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do
		local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )
		if data.shipItem and not data.bWait and data.shipItem.lockedInGame == UI.INVALID_U64_ID then
			self:AddRecord( data )
			if self:GetNumRecords() == 1 then
				self:SelectRecord( 1 )
			end
		end
	end
	self:ReAlign()
end

--
function UI.GameplayShipSelect_ShipListWnd:IsEmpty()
	return self:GetNumRecords() == 0
end