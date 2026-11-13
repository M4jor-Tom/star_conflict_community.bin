-- ----------------------------------------------------------------------------
--
-- Workfile: clan_emblem.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.ClanEmblem_Wnd
-- -----------------------------------------------------------------

--
UI.ClanEmblem_Wnd = {}

UI.ClanEmblem_Wnd.def = 
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",
	props =
	{
		name			= "ClanEmblem_Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
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
				defName				= "clan_create_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.ClanEmblem_Wnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "win",	
						layer		= "UI.ClanEmblem_Wnd.layers.WND_EFFECT",
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
		-- WND_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "clan_myclan_emblem_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "title",	
						layer		= "UI.ClanEmblem_Wnd.layers.TITLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_5",	
						layer		= "UI.ClanEmblem_Wnd.layers.TEXT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_3",	
						layer		= "UI.ClanEmblem_Wnd.layers.COST_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "list",	
						wnd			= "UI.ClanEmblem_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",	
						wnd			= "UI.ClanEmblemList_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_1",	
						wnd			= "UI.ClanEmblemList_SelectBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text 			= "^clans_emblem_title"
		},
		-- TEXT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text 			= "^clans_emblem_text"
		},
		-- COST_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			--text 			= "^clans_emblem_text"
		},
	},

	children = { "UI.ClanEmblem_ListWnd", "UI.ClanEmblemList_CancelBtn", "UI.ClanEmblemList_SelectBtn" }
}

-- -----------------------------------
-- const
-- -----------------------------------
--
UI.ClanEmblem_Wnd.sounds = 
{
	wndShow			= "sound/ui/btnClick",
	wndHide			= "sound/ui/MsgHide",
}
--
UI.ClanEmblem_Wnd.layers = 
{
	MAIN_EFFECT				= 0,
	BG_EFFECT				= 1,
	WND_EFFECT				= 2,
	TITLE_TEXT				= 3,
	TEXT_TEXT				= 4,
	COST_TEXT				= 5,
	--GOLD_EFFECT				= 6,
}

-- -----------------------------------
-- vars
-- -----------------------------------
--
UI.ClanEmblem_Wnd.bCreateWnd 			= nil
UI.ClanEmblem_Wnd.selectedWnd 			= nil
UI.ClanEmblem_Wnd.requestId				= nil
UI.ClanEmblem_Wnd.metaText 				= nil

--
function UI.ClanEmblem_Wnd:SetWait( b )
	--self:SetLayerVisible( b, self.layers.LOADING_EFFECT )
end

--
function UI.ClanEmblem_Wnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self.metaText:SetText( "", true )
	self:UpdateMetaTextPos()
	self:Update()
end


--
function UI.ClanEmblem_Wnd:OnEscape()
	self:Hide()
	return true
end

--
function UI.ClanEmblem_Wnd:Hide()
	UI:PlayGlobalSound( self.sounds.wndHide )
	UI.FullScreenWnd.Hide( self )
end

--
function UI.ClanEmblem_Wnd:Show()
	UI:PlayGlobalSound( self.sounds.wndShow )
	UI.FullScreenWnd.Show( self )
	self.requestId = nil
end

--
function UI.ClanEmblem_Wnd:SetCost()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.WND_EFFECT )
	local normalColor = mainEffect:GetObjColor( "text_3" )
	local data = ClanEmblems[ self:GetSelectedData() ]
	local nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( UI.Clan:GetCid() )
	if data then
		local str = UI:GetStringByName( "clans_emblem_cost" )
		if data.goldCost and data.iridiumCost then
			str = UI:GetStringByName( "clans_emblem_cost_2" )
		end
		local costIndex = 1
		if bCached and emblem == self:GetSelectedData() then
			str = UI:GetStringByName( "clans_emblem_seted" )
			UI.ClanEmblemList_SelectBtn:AddStyle( UI.WS_DISABLE )
		else
			UI.ClanEmblemList_SelectBtn:RemoveStyle( UI.WS_DISABLE )
			local iridium = UI.Clan:GetResources( MasterServer.ClanResource.CRES_IRIDIUM )
			local irridiumCost = ""
			if data.iridiumCost then

        		local iridiumPriceInfo =
        		{
        			priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
        			val			= data.iridiumCost,
        			bIsBuyPrice	= true,
        			basePrice	= data.iridiumCost,
        		}

    			irridiumCost = UI:PriceInfo2Str( iridiumPriceInfo, normalColor, false, true, true, nil )
				str = string.gsub( str, "%$value_"..tostring( costIndex ).."%$", irridiumCost )

				costIndex = costIndex + 1

			end
			local goldCost = ""
			if data.goldCost then

        		local goldPriceInfo =
        		{
        			priceType	= _G.GameStore.CreditsType.CT_GOLD,
        			val			= data.goldCost,
        			bIsBuyPrice	= true,
        			basePrice	= data.goldCost,
        		}

    			goldCost = UI:PriceInfo2Str( goldPriceInfo, normalColor, false, false, true, nil )
				str = string.gsub( str, "%$value_"..tostring( costIndex ).."%$", goldCost )

				costIndex = costIndex + 1

			end
			
		end
		self.metaText:SetText( str, true )
	end
end

--
function UI.ClanEmblem_Wnd:GetSelectedData()
	return self.selectedData
end

--
function UI.ClanEmblem_Wnd:GetSelectedWnd()
	return self.selectedWnd
end

--
function UI.ClanEmblem_Wnd:SelectWnd( wnd )
	if self.selectedWnd then
		self.selectedWnd:MyDeselect()
	end
	self.selectedWnd = wnd
	if self.selectedWnd and self.selectedWnd:GetRecordData() then
		self.selectedData = self.selectedWnd:GetRecordData().__name
		self.selectedWnd:MySelect()
		self:SetCost()
	end
end

--
function UI.ClanEmblem_Wnd:F_PostLoad()
	UI.FullScreenWnd.F_PostLoad( self )
 	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.COST_TEXT ) 
end

--
function UI.ClanEmblem_Wnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.ClanEmblem_Wnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.ClanEmblem_Wnd:UpdateMetaTextPos()
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.COST_TEXT )
end

--
function UI.ClanEmblem_Wnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.COST_TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end

--
function UI.ClanEmblem_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ClanEmblemList_CancelBtn == wnd then
		self:Hide()
	elseif UI.ClanEmblemList_SelectBtn == wnd then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:OnOk()
	end
	return true
end

--
function UI.ClanEmblem_Wnd:MasterServer_OnClanAssignEmblem( result, requestId )
	if self.requestId == requestId then
		if result ~= MasterServer.ClanOpResult.CLR_OK then
			local text
			text = UI:GetStringByName( "clans_error_emblem_cant_change" )
			local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
			local reason = UI:GetStringByName( errorCode )
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		else
			self:Hide()
			UI.GameplayPveMapWnd:UpdateUniverse()
			--UI.GameplayMap_FlagWnd:Show()
		end
		self.requestId = nil
	end
end

--
function UI.ClanEmblem_Wnd:Change( currency )
	self.requestId = _G.MasterServer_ClanAssignEmblem( self:GetSelectedData(), currency )
end

--
function UI.ClanEmblem_Wnd:OnOk()
	if self.requestId == nil then
		if self:GetSelectedData() == "Empty" then
			self.requestId = _G.MasterServer_ClanAssignEmblem( "", GameStore.CreditsType.CT_TOKENS )
		else
			local data = ClanEmblems[ self:GetSelectedData() ]
			local prices = {}
			if data.goldCost then
				table.insert( prices, { val = data.goldCost or 0, priceType = _G.GameStore.CreditsType.CT_GOLD, basePrice = 0, defName = "", bIsBuyPrice = true } )
			end
			if data.iridiumCost then
				table.insert( prices, { val = data.iridiumCost or 0, priceType = UI.exPriceTypes.CLAN_IRIDIUM, basePrice = 0, defName = "", bIsBuyPrice = true } )
			end
			UI.ClanConfirmWnd:Show( UI.ClanConfirmWnd.Modes.CLAN_EMBLEM, UI:GetStringByName( "clanEmblem_confirm_text" ), prices )
		end
	end
end

--
function UI.ClanEmblem_Wnd:EmblemNeedToAdd( emblem, clan )
	if clan then
		if emblem.data.cids == nil then
			return false
		else
			for k, v in pairs( emblem.data.cids ) do
				if UI.Clan:GetCid() == v then
					return true
				end
			end
			return false
		end
	else
		if emblem.data.cids == nil then
			return true
		else
			return false
		end
	end
end

--
function UI.ClanEmblem_Wnd:Update( saveCurScroll )
	self:SelectWnd( nil )
	local index = 0
	local sortedEmblems = {}
	for k, v in pairs( ClanEmblems ) do
		--if k ~= "Empty" then
			table.insert( sortedEmblems, { data = v, __name = k } )
		--end
	end
	
	local function Sort( v1, v2 )
		if v1.__name == "Empty" then
			return true
		end
		if v2.__name == "Empty" then
			return false
		end
		if v1.data.sortOrder == nil then
			sys.log( "UI.ClanEmblem_ListWnd:F_OnAfterShowOnScreen()[ERROR]: emblem %s haven't sortOrder", v1.data.decal )
			return false
		end
		if v2.data.sortOrder == nil then
			sys.log( "UI.ClanEmblem_ListWnd:F_OnAfterShowOnScreen()[ERROR]: emblem %s haven't sortOrder", v2.data.decal )
			return true
		end
		return v1.data.sortOrder > v2.data.sortOrder
	end
	table.sort( sortedEmblems, Sort )

	if not saveCurScroll then
		UI.ClanEmblem_ListWnd:Clear()
	end

	local clanName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( UI.Clan:GetCid() )
	if bCached then
		if emblem == "" then
			emblem = "Empty"
		end
	end

	self.selectedData = emblem

	local subTable = {}
	local recordIndex = 1
	local scrollTo = 1
	-- первый проход для клановых, второй - для остальных
	for j = 1, 2 do
		if j == 2 or UI.Clan:IsInClan() then
			for k, v in pairs( sortedEmblems ) do
				if self:EmblemNeedToAdd( v, j == 1 ) then
					table.insert( subTable, v )
					if emblem == v.__name then
						scrollTo = recordIndex
					end
					if #subTable == 8 then
						if saveCurScroll then
							UI.ClanEmblem_ListWnd:SetRecordData( subTable, recordIndex )
						else
							UI.ClanEmblem_ListWnd:AddRecord( subTable )
						end
						recordIndex = recordIndex + 1
						subTable = {}
					end
				end
			end
		end
	end
	if #subTable > 0 then
		if saveCurScroll then
			UI.ClanEmblem_ListWnd:SetRecordData( subTable, recordIndex )
		else
			UI.ClanEmblem_ListWnd:AddRecord( subTable )
		end
	end
	UI.ClanEmblem_ListWnd:SetScrollPos( scrollTo, true, false )
	self:SetWait( self.requestId ~= nil )

end

--
function UI.ClanEmblem_Wnd:F_OnEventSaveUiState()
	UI.store.ClanEmblem_Wnd =
	{
		requestId	= self.requestId,
	}
end

--
function UI.ClanEmblem_Wnd:F_OnEventRestoreUiState()
	if UI.store.ClanEmblem_Wnd then
		self.requestId	= UI.store.ClanEmblem_Wnd.requestId
		UI.store.ProfileChangeAvatar_Wnd = nil
	end
end

-- -----------------------------------------------------------------
-- UI.ClanEmblem_ListWnd
-- -----------------------------------------------------------------

UI.ClanEmblem_ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClanEmblem_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "ClanEmblem_ListWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "clan_myclan_emblem_list",
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
}

UI.ClanEmblem_ListWnd.MAX_SLOTS = 3

UI.ClanEmblem_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.ClanEmblem_ListWnd.btnPrototypeName	= "ClanEmblemList_ListLineWnd"
UI.ClanEmblem_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}
UI.ClanEmblem_ListWnd.sounds =
{
	click	= UI.sounds.btnClick,
	over	= UI.sounds.btnMouseOver,
}

--
function UI.ClanEmblem_ListWnd:Clear()
	local slots = self.slots
	for k, v in pairs( slots ) do
		v.btn.listWnd:Clear()
	end
	UI.ButtonsList3Wnd.Clear( self )
end

--
function UI.ClanEmblem_ListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if not self:IsOnScreen() then
		return false
	end
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self:GetVisibleRange()
	self:ScrollVisibleRange( ticks < 0 )
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( "sound/ui/btnMouseOver" )
	end
	return true
end

-- -----------------------------------------------------------------
-- UI.ClanEmblemList_ListLineWnd
-- -----------------------------------------------------------------

UI.ClanEmblemList_ListLineWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClanEmblemList_ListLineWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "ClanEmblemList_ListLineWnd",
		isPrototype 	= true,
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
				defName				= "clan_myclan_emblem_line",
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
}
--
UI.ClanEmblemList_ListLineWnd.listWnd = nil

--
function UI.ClanEmblemList_ListLineWnd:F_PostLoad()
	UI.ButtonsList3_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.listWnd = UI:CreateChildWnd( self, UI.ClanEmblemList_ListLineListWnd, "" )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.listWnd, mainEffect, "self", UI.EffectAnimParams.POS )
end

--
function UI.ClanEmblemList_ListLineWnd:UpdateForData( data, bAnimated )
	self.listWnd:Clear()
	for k, v in pairs( data ) do
		self.listWnd:AddRecord( v )
	end
end

-- -----------------------------------------------------------------
-- UI.ClanEmblemList_ListLineListWnd
-- -----------------------------------------------------------------

UI.ClanEmblemList_ListLineListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClanEmblemList_ListLineListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "ClanEmblemList_ListLineListWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype 	= true
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
				defName				= "clan_myclan_emblem_line",
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
}

UI.ClanEmblemList_ListLineListWnd.MAX_SLOTS = 8

UI.ClanEmblemList_ListLineListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.ClanEmblemList_ListLineListWnd.btnPrototypeName	= "ClanEmblemListLine_Slot"
UI.ClanEmblemList_ListLineListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
	}
}
UI.ClanEmblemList_ListLineListWnd.sounds =
{
	click	= UI.sounds.btnClick,
	over	= UI.sounds.btnMouseOver,
}


-- -----------------------------------------------------------------
-- UI.ClanEmblemListLine_Slot
-- -----------------------------------------------------------------

UI.ClanEmblemListLine_Slot = {}
--
UI.ClanEmblemListLine_Slot.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",
	props =
	{
		name			= "ClanEmblemListLine_Slot",
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
				defName 			= "clan_myclan_emblem_slot",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "clan_ico",	
						layer		= "UI.ClanEmblemListLine_Slot.layers.EMBLEM_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "select",	
						layer		= "UI.ClanEmblemListLine_Slot.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "over",	
						layer		= "UI.ClanEmblemListLine_Slot.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- EMBLEM_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_select_galaxy_clan_owner",
				defaultAnimation	= "idle_big",
			}}
		},
		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "clan_myclan_emblem_slot_over",
				defaultAnimation	= "idle",
			}}
		},
		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "clan_myclan_emblem_slot_select",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.ClanEmblemListLine_Slot.layers = 
{
	MAIN_EFFECT				= 0,
	EMBLEM_EFFECT			= 1,
	OVER_EFFECT				= 2,
	SELECT_EFFECT			= 3,
}

--
UI.ClanEmblemListLine_Slot.sounds = 
{
	over 	= "sound/ui/btnMouseOver",
	click	= UI.sounds.btnClick,
}

-- -----------------------------------
-- vars
-- -----------------------------------

-- ------------------------------
-- interface functions
-- ------------------------------

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanEmblemListLine_Slot:F_PostLoad()
	UI.ButtonsList_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self:SetLayerVisible( false, self.layers.SELECT_EFFECT )
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	
end

--
function UI.ClanEmblemListLine_Slot:UpdateForData( data )
	self.name = data.__name
	local hTex = UI:GetTex( data.data.decal )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.EMBLEM_EFFECT )
	mainEffect:SetSpriteTexture( "ico", hTex )

	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	self:SetLayerVisible( false, self.layers.SELECT_EFFECT )
	local selectedData = UI.ClanEmblem_Wnd:GetSelectedData()
	if selectedData then
		if data.__name == selectedData then
			UI.ClanEmblem_Wnd:SelectWnd( self )
		else
			if self == UI.ProfileChangeAvatar_Wnd:GetSelectedWnd() then
				UI.ClanEmblem_Wnd:SelectWnd( nil )
			end
		end
	else
		UI.ClanEmblem_Wnd:SelectWnd( self )
	end
end

--
function UI.ClanEmblemListLine_Slot:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI:PlayGlobalSound( self.sounds.over )
	self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	return true
end

--
function UI.ClanEmblemListLine_Slot:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	return true
end

--
function UI.ClanEmblemListLine_Slot:MySelect()
	self:SetLayerVisible( true, self.layers.SELECT_EFFECT )
end

--
function UI.ClanEmblemListLine_Slot:MyDeselect()
	self:SetLayerVisible( false, self.layers.SELECT_EFFECT )
end

--
--[[function UI.ClanEmblemListLine_Slot:Select()
	UI.ClanEmblem_Wnd:SelectWnd( self )
end]]

--
function UI.ClanEmblemListLine_Slot:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI:PlayGlobalSound( self.sounds.click )
	UI.ClanEmblem_Wnd:SelectWnd( self )
	return true
end

--
function UI.ClanEmblemListLine_Slot:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI.ClanEmblem_Wnd:OnOk()
	return true
end

--
UI.ClanEmblemList_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ClanEmblemList_CancelBtn",
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

--
UI.ClanEmblemList_SelectBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ClanEmblemList_SelectBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^clans_emblem_select",
   			},
   		}
	},
}


UI.ClanConfirmWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

--
UI.ClanConfirmWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    UPGRADE_DESC	= 4,
    UPGRADE_DESC_2 	= 5,
    PRICE			= 6,
}

--
UI.ClanConfirmWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",
	props =
	{
		name		= "ClanConfirmWnd",
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
				defName 			= "buy_main",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.ClanConfirmWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "window",	
						layer		= "UI.ClanConfirmWnd.layers.WORK_EFFECT",
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
			updatable	= false,
			effects =
			{{
				defName 			= "clan_upgrade_wnd",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "title",	
						layer		= "UI.ClanConfirmWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "description",	
						layer		= "UI.ClanConfirmWnd.layers.UPGRADE_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "description_2",	
						layer		= "UI.ClanConfirmWnd.layers.UPGRADE_DESC_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_1",	
						layer		= "UI.ClanConfirmWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
		},
		-- UPGRADE_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		-- UPGRADE_DESC_2
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
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

UI.ClanConfirmWnd.MAX_PRICE_BTNS = 2
UI.ClanConfirmWnd.Modes = 
{
	CLAN_EMBLEM 			= 0,
	SHIP_UPGRADE 			= 1,
	BFS_SHIP_SEND 			= 2,
}

UI.ClanConfirmWnd.cancelBtn = nil
UI.ClanConfirmWnd.okBtn = nil
UI.ClanConfirmWnd.upgradeBtns = {}
UI.ClanConfirmWnd.mode = 0
UI.ClanConfirmWnd.metaText 				= nil

UI.ClanConfirmWnd.effectInfo =
{
	"button_1",
	"button_4",
}

--
function UI.ClanConfirmWnd:F_OnEventSaveUiState()
	if self:IsOnScreen() then
		self:UnlinkFromParent()
	end
end

--
function UI.ClanConfirmWnd:Cancel()
	if self.mode == self.Modes.SHIP_UPGRADE then
		if self.data and self.data.ownerWnd then
			self.data.ownerWnd:OnClanConfirmWndResult( false, self.mode, self.data )
		else
			UI.EquipmentShipUpgrade_Btn:OnClanConfirmWndResult( false )
		end
	elseif self.mode == self.Modes.CLAN_EMBLEM then

	elseif self.mode == self.Modes.BFS_SHIP_SEND then
		
	end
	UI:PlayGlobalSound( "sound/ui/MsgHide" )
	self:Hide()
end

--
function UI.ClanConfirmWnd:OnEscape()
	self:Cancel()
	return true
end

--
function UI.ClanConfirmWnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.ClanConfirmWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateMetaTextPos()
end

--
function UI.ClanConfirmWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.ClanConfirmWnd:UpdateMetaTextPos()
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
end

--
function UI.ClanConfirmWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.PRICE then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end

--
function UI.ClanConfirmWnd:GetMode()
	return self.mode
end

--
function UI.ClanConfirmWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == self.cancelBtn then
		self:Cancel()
	elseif wnd == self.okBtn then
		if self.mode == self.Modes.SHIP_UPGRADE then
    		if self.data and self.data.ownerWnd then
    			self.data.ownerWnd:OnClanConfirmWndResult( true, self.mode, self.data )
			else
				UI.EquipmentShipUpgrade_Btn:OnClanConfirmWndResult( true )
			end
		elseif self.mode == self.Modes.BFS_SHIP_SEND then
			UI.GameplayPveMapWnd:OnClanConfirmWndResult( true, self.mode, self.data )			
		end
		UI:PlayGlobalSound( "sound/ui/apply" )
		self:Hide()
	elseif UI:IsWndKindOf( wnd, "UpgradeItem_UpgradeBtn" ) then
		local btnState = wnd:GetState()
		if btnState == UI.UpgradeItem_UpgradeBtn.states.UPGRADE then
			--self:TryUpgrade( wnd:GetPriceInfo() )
			if self.mode == self.Modes.BFS_SHIP_SEND then
				UI.GameplayPveMapWnd:OnClanConfirmWndResult( true, self.mode, self.data )			
			else
				local priceInfo = wnd:GetPriceInfo()
				if priceInfo and priceInfo.priceType then

					local priceType = priceInfo.priceType 
					if priceType == UI.exPriceTypes.CLAN_IRIDIUM then
						priceType = _G.GameStore.CreditsType.CT_TOKENS
					end

					UI.ClanEmblem_Wnd:Change( priceType )
				else
					UI.ClanEmblem_Wnd:Change( GameStore.CreditsType.CT_TOKENS )
				end
			end
			self:Hide()
		elseif btnState == UI.UpgradeItem_UpgradeBtn.states.REFILL then
			UI.HangarWnd:ShowBuyGoldWnd()
			self:Hide()
		end
		UI:PlayGlobalSound( "sound/ui/apply" )
	end
	return true
end

--
function UI.ClanConfirmWnd:Show( mode, text, prices, data )
	UI.FullScreenWnd.Show( self )
	self.mode = mode
	self.data = data
	if self.mode == self.Modes.SHIP_UPGRADE then
		self:SetText( UI:GetStringByName( "upgradeItem_caption" ), self.layers.CAPTION )
	elseif self.mode == self.Modes.BFS_SHIP_SEND then
		self:SetText( UI:GetStringByName( "bfs_send_ship" ), self.layers.CAPTION )
	elseif self.mode == self.Modes.CLAN_EMBLEM then
		self:SetText( UI:GetStringByName( "clanEmblem_confirm_caption" ), self.layers.CAPTION )
	end 

	local textHeight = 0
	if self.mode == self.Modes.SHIP_UPGRADE then
		self:SetText( "", self.layers.UPGRADE_DESC_2 )
		self:SetText( text, self.layers.UPGRADE_DESC )
		self.metaText:SetText( "", true )
		textHeight = _G.MeasureText( 
	   		text,
	   		self:GetFont( self.layers.UPGRADE_DESC ),
	   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.UPGRADE_DESC ), self:GetLayerHeight( self.layers.UPGRADE_DESC ) ),
	   		self:GetTextFormatFlags( self.layers.UPGRADE_DESC ),
	   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.UPGRADE_DESC ), self:GetLayerHeight( self.layers.UPGRADE_DESC ) ) ).w
	elseif self.mode == self.Modes.CLAN_EMBLEM then
		self:SetText( "", self.layers.UPGRADE_DESC )
		self:SetText( text, self.layers.UPGRADE_DESC_2 )
		self.metaText:SetText( "", true )
		textHeight = _G.MeasureText( 
	   		text,
	   		self:GetFont( self.layers.UPGRADE_DESC_2 ),
	   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.UPGRADE_DESC_2 ), self:GetLayerHeight( self.layers.UPGRADE_DESC_2 ) ),
	   		self:GetTextFormatFlags( self.layers.UPGRADE_DESC_2 ),
	   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.UPGRADE_DESC_2 ), self:GetLayerHeight( self.layers.UPGRADE_DESC_2 ) ) ).w
	elseif self.mode == self.Modes.BFS_SHIP_SEND then
		self:SetText( "", self.layers.UPGRADE_DESC )
		self:SetText( text, self.layers.UPGRADE_DESC_2 )
		self.metaText:SetText( "", true )
		textHeight = _G.MeasureText( 
	   		text,
	   		self:GetFont( self.layers.UPGRADE_DESC_2 ),
	   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.UPGRADE_DESC_2 ), self:GetLayerHeight( self.layers.UPGRADE_DESC_2 ) ),
	   		self:GetTextFormatFlags( self.layers.UPGRADE_DESC_2 ),
	   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.UPGRADE_DESC_2 ), self:GetLayerHeight( self.layers.UPGRADE_DESC_2 ) ) ).w
	end

	local windowHeight = textHeight
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	mainEffect:SetAnimationTime( 1.0 )
	mainEffect:Update( 0 )
	windowHeight = windowHeight + mainEffect:GetObjPos( "description" ).y
	local remaind = mainEffect:GetObjSize( "dist_max" ).y - ( mainEffect:GetObjPos( "description" ).y + mainEffect:GetObjSize( "description" ).y )
	windowHeight = windowHeight + remaind
	local minDist = mainEffect:GetObjSize( "dist_min" ).y
	local maxDist = mainEffect:GetObjSize( "dist_max" ).y
	local animTime = ( windowHeight - minDist ) / ( maxDist - minDist )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
	self.okBtn:UnlinkFromParent()
	for i = 1, #self.upgradeBtns do
		self.upgradeBtns[ i ]:UnlinkFromParent()
	end
	if self.mode == self.Modes.SHIP_UPGRADE then
		self:AddControl( self.okBtn, self.layers.WORK_EFFECT, "button_1" )
		self:SetText( UI:GetStringByName( "upgradeItem_caption" ), self.layers.CAPTION )
		if prices[ 1 ].commonSynergy ~= nil and prices[ 1 ].commonSynergy ~= 0 and prices[ 1 ].synergy ~= nil and prices[ 1 ].synergy ~= 0 then
			self.metaText:SetText( UI:Num2StrSeparatedBy3( prices[ 1 ].synergy ).."$texture [texName sinergy_ico]$    "..UI:Num2StrSeparatedBy3( prices[ 1 ].commonSynergy ).."$texture [texName sinergy_free_ico]$", true )
		elseif prices[ 1 ].synergy ~= nil and prices[ 1 ].synergy ~= 0 then
			self.metaText:SetText( UI:Num2StrSeparatedBy3( prices[ 1 ].synergy ).."$texture [texName sinergy_ico]$", true )
		else
			self.metaText:SetText( UI:Num2StrSeparatedBy3( prices[ 1 ].commonSynergy ).."$texture [texName sinergy_free_ico]$", true )
		end
	elseif self.mode == self.Modes.CLAN_EMBLEM then
		local priceIndex = 1
		local normalColor = mainEffect:GetObjColor( "text_1" )
		local priceText = UI:GetStringByName( "clan_emblem_confirm_cost_"..tostring( #prices ) )
		for priceIdx = #prices, 1, -1 do
			--local btnIdx = self.MAX_PRICE_BTNS - numPrices + priceIdx
			local upgradeBtn = self.upgradeBtns[ priceIdx ]		
			self:AddControl( upgradeBtn, self.layers.WORK_EFFECT, self.effectInfo[ priceIdx ] )
			upgradeBtn:Setup( prices[ priceIdx ] )

			local bShowNotEnoughMoney = prices[ priceIdx ].priceType ~= _G.GameStore.CreditsType.CT_GOLD
			local valStr = UI:PriceInfo2Str( prices[ priceIdx ], normalColor, false, bShowNotEnoughMoney, true, nil )
			priceText = string.gsub( priceText, "%$value_"..tostring( priceIndex ).."%$", valStr )

			priceIndex = priceIndex + 1
		end
		self.metaText:SetText( priceText, true )
	elseif self.mode == self.Modes.BFS_SHIP_SEND then
		local priceIndex = 1
		local normalColor = UI:Color2Str( mainEffect:GetObjColor( "text_1" ) )
		local priceText = UI:GetStringByName( "clan_emblem_confirm_cost_"..tostring( #prices ) )
		for priceIdx = #prices, 1, -1 do
			--local btnIdx = self.MAX_PRICE_BTNS - numPrices + priceIdx
			local upgradeBtn = self.upgradeBtns[ priceIdx ]		
			self:AddControl( upgradeBtn, self.layers.WORK_EFFECT, self.effectInfo[ priceIdx ] )
			upgradeBtn:Setup( prices[ priceIdx ] )
			local icoStr = UI:GetPriceIcoMetaString( prices[ priceIdx ] )
			if prices[ priceIdx ].priceType == GameStore.CreditsType.CT_TOKENS then
				icoStr = "$texture [texName irridium_ico]$"
			end
			local valStr = UI:Num2StrSeparatedBy3( prices[ priceIdx ].val )
			local bEnoughMoney = UI:IsEnoughMoneyForPrice( prices[ priceIdx ], false )
			if prices[ priceIdx ].priceType == GameStore.CreditsType.CT_TOKENS then
				bEnoughMoney = false
				local iridium = UI.Clan:GetResources( MasterServer.ClanResource.CRES_IRIDIUM )
				if prices[ priceIdx ].val then
					if prices[ priceIdx ].val <= iridium.l then
						bEnoughMoney = true
					end
				end
			end
			if not bEnoughMoney and prices[ priceIdx ].priceType ~= _G.GameStore.CreditsType.CT_GOLD then
				valStr = "@ffff0000"..valStr..normalColor
			end
			priceText = string.gsub( priceText, "%$value_"..tostring( priceIndex ).."%$", valStr..icoStr )
			priceIndex = priceIndex + 1
		end
		self.metaText:SetText( priceText, true )
	end
end

--
function UI.ClanConfirmWnd:OnEnter()
	if self.mode == self.Modes.SHIP_UPGRADE then
		if self.data and self.data.ownerWnd then
			self.data.ownerWnd:OnClanConfirmWndResult( true, self.mode, self.data )
		else
			UI.EquipmentShipUpgrade_Btn:OnClanConfirmWndResult( true )
		end
		self:Hide()
		UI:PlayGlobalSound( "sound/ui/apply" )
		return true
	end
	if self.mode == self.Modes.BFS_SHIP_SEND then
		UI.GameplayPveMapWnd:OnClanConfirmWndResult( true, self.mode, self.data )
		self:Hide()
		UI:PlayGlobalSound( "sound/ui/apply" )
		return true
	end
	return false
end

--
function UI.ClanConfirmWnd:F_PostLoad()
	UI.FullScreenWnd.F_PostLoad( self )
	self.cancelBtn = UI:CreateChildWnd( self, UI.TextBtn4, "_cancel" )
	self.okBtn = UI:CreateChildWnd( self, UI.TextBtn4, "_ok" )
	for upgradeBtnIdx = 1, self.MAX_PRICE_BTNS do	
		local upgradeBtn = UI:CreateChildWnd( self, UI.ClanConfirmWnd_UpgradeBtn, tostring( upgradeBtnIdx ) )
		table.insert( self.upgradeBtns, upgradeBtn )
	end
	self:AddControl( self.cancelBtn, self.layers.WORK_EFFECT, "button_2" )
	self:AddControl( self.okBtn, self.layers.WORK_EFFECT, "button_1" )
	self.cancelBtn:SetBtnText( UI:GetStringByName( "upgradeItem_cancelBtn" ) )
	self.okBtn:SetBtnText( UI:GetStringByName( "agreement_acceptBtn" ) )
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.PRICE ) 
end

--
function UI.ClanConfirmWnd:AddControl( wnd, effectLayer, locatorName )
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
function UI.ClanConfirmWnd:GetMode()
	return self.mode
end


-- -------------------------------------------------------------------
-- UI.ClanConfirmWnd_UpgradeBtn
-- -------------------------------------------------------------------

UI.ClanConfirmWnd_UpgradeBtn = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.ClanConfirmWnd_UpgradeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "UpgradeItem_UpgradeBtn",

	props =
	{
		name		= "ClanConfirmWnd_UpgradeBtn",
		isPrototype	= true,	
	},
}

--
function UI.ClanConfirmWnd_UpgradeBtn:FullUpdate()
	local bEnoughMoney = UI:IsEnoughMoneyForPrice( self.priceInfo, false )
	if self.priceInfo.priceType == GameStore.CreditsType.CT_TOKENS then
		bEnoughMoney = false
		local iridium = UI.Clan:GetResources( MasterServer.ClanResource.CRES_IRIDIUM )
		if self.priceInfo.val then
			if self.priceInfo.val <= iridium.l then
				bEnoughMoney = true
			end
		end
	end
	self.state = self.states.UPGRADE
	if not bEnoughMoney then
		if --[[self.priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS or]] self.priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then
			self.state = self.states.REFILL
		end			
	end
	local strLabel = ""
	if self.state == self.states.UPGRADE then
		if UI.ClanConfirmWnd:GetMode() == UI.ClanConfirmWnd.Modes.CLAN_EMBLEM then
			strLabel = UI:GetStringByName( "clanemblem_confirmBtn" )
		elseif UI.ClanConfirmWnd:GetMode() == UI.ClanConfirmWnd.Modes.BFS_SHIP_SEND then
			strLabel = UI:GetStringByName( "bfs_send_ship_btn" )
		end
	elseif self.state == self.states.REFILL then
		strLabel = UI:GetStringByName( "refillMoneyBtn" )
	end
	local strIco = ""
	if self.priceInfo.priceType == GameStore.CreditsType.CT_TOKENS then
		strIco = "$texture [texName irridium_ico]$"
	else
		strIco = UI:GetPriceIcoMetaString( self.priceInfo )
	end
	local str = string.format( "%s %s", strLabel, strIco )
	self:SetBtnText( str )
	local bEnable = false
	if self.state == self.states.REFILL then
		bEnable = true
	else
		bEnable = bEnoughMoney
	end
	self:Enable( bEnable )
	local color = self:GetColor( self.layers.TEXT )
	self.metaText:SetColor( color )
end