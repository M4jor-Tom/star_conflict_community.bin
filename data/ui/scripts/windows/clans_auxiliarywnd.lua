-- ----------------------------------------------------------------------------
--
-- Workfile: clans_auxiliarywnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

--
UI.ClanCreateWnd = {}

UI.ClanCreateWnd.def = 
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "ClanCreateWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
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
						layer		= "UI.ClanCreateWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "win",	
						layer		= "UI.ClanCreateWnd.layers.WND_EFFECT",
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
				defName				= "clan_create_wnd",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "price",	
						layer		= "UI.ClanCreateWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title",	
						layer		= "UI.ClanCreateWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_1",	
						layer		= "UI.ClanCreateWnd.layers.CLAN_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_2",	
						layer		= "UI.ClanCreateWnd.layers.INFORMATION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_4",	
						layer		= "UI.ClanCreateWnd.layers.INFORMATION2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_5",	
						layer		= "UI.ClanCreateWnd.layers.INFORMATION3",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_3",	
						layer		= "UI.ClanCreateWnd.layers.COST",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "btn_1",	
						wnd			= "UI.ClansMyClan_CreateOkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",	
						wnd			= "UI.ClansMyClan_CreateCancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "input_text",	
						wnd			= "UI.ClanCreateWnd_EditClanNameWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "input",	
						wnd			= "UI.Clan_MsgEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.ClanCreateWnd.layers.PRICE_VAL",
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

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Medium" },
   			text			= "^clans_create_clan_caption"
		},

		-- CLAN_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^clans_create_clan_clan_name"
		},

		-- INFORMATION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^clans_create_clan_base_capacity"
		},

		-- COST
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			--text			= ""
		},

		-- INFORMATION2
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_NOCLIP + FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^clans_create_name_information"
		},

		-- INFORMATION3
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_NOCLIP + FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^clans_create_name_information"
		},
	},

	children = { "UI.ClansMyClan_CreateOkBtn", "UI.ClansMyClan_CreateCancelBtn", "UI.ClanCreateWnd_EditClanNameWnd", "UI.Clan_MsgEditWnd" }
}


UI.ClanCreateWnd.sounds = 
{
	wndShow			= "sound/ui/btnClick",
}


--
UI.ClanCreateWnd.layers = 
{
	MAIN_EFFECT				= 0,
	BG_EFFECT				= 1,
	WND_EFFECT				= 2,
	PRICE_EFFECT			= 3,
	PRICE_VAL				= 4,
	CAPTION					= 5,
	CLAN_NAME				= 6,
	INFORMATION				= 7,
	COST					= 8,
	INFORMATION2			= 9,
	INFORMATION3			= 10,
}


--
UI.ClanCreateWnd.modes = 
{
	CLAN_CREATE			= 0,
	CLAN_RENAME			= 1,
	CLAN_RENAME_TAG		= 2,
	PLAYER_RENAME		= 3,
	CLAN_MESSAGE		= 4,
	FIND_DESC_MESSAGE 	= 5,
	ARENA_TEAM_CREATE	= 6,
	SHIP_PRESET_ADD		= 7,
	USER_NOTE			= 8,
}


--
UI.ClanCreateWnd.MaxClanNameLength		= 19
UI.ClanCreateWnd.MaxClanTagLength		= 5
UI.ClanCreateWnd.MaxPlayerNameLength	= UI.MAX_NICKNAME_LEN
UI.ClanCreateWnd.MaxArenaTeamNameLength	= 20
UI.ClanCreateWnd.MinArenaTeamNameLength	= 2

--
UI.ClanCreateWnd.bCreateWnd = nil
UI.ClanCreateWnd.bCancelWnd = nil
UI.ClanCreateWnd.requestId = nil
UI.ClanCreateWnd.mode      = nil
UI.ClanCreateWnd.raceWnd = {}
UI.ClanCreateWnd.priceMetaText	= nil
UI.ClanCreateWnd.data = nil

--
function UI.ClanCreateWnd:MasterServer_OnClanCreate( result, requestId )

	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text
		if self.mode == UI.ClanCreateWnd.modes.CLAN_RENAME_TAG then 
			text = UI:GetStringByName( "clans_error_tag_cant_change" )
		elseif self.mode == UI.ClanCreateWnd.modes.CLAN_CREATE then
			text = UI:GetStringByName( "clans_error_cant_create" )
		else
			text = UI:GetStringByName( "clans_error_cant_rename" )
		end
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		-- 
		reason = UI:GetStringByName( errorCode )
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

	if self.requestId == requestId then 
		self.requestId = nil
		if result == MasterServer.ClanOpResult.CLR_OK then
			self:Hide()
		end
	end

	UI.Clan:ReloadList( 0, 0 )

end


--
function UI.ClanCreateWnd:MasterServer_ChangePlayerNickName( result, requestId )

	if result ~= MasterServer.NickNameChangeResult.NNCR_OK then
		local text = UI:GetStringByName( "players_error_cant_rename" )
		local errorCode = UI:Val2Key( MasterServer.NickNameChangeResult, result )
		local reason = UI:GetStringByName( errorCode )
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

	if self.requestId == requestId then 
		self.requestId = nil
		if result == MasterServer.NickNameChangeResult.NNCR_OK then
			self:Hide()
			UI.Profile:MasterServer_OnUserProfileUpdate( 0, 0, _G.MasterServer_GetLocalUserId(), MasterServer.UserProfileField.UPF_GENERAL_STATS )
		end
	end

end


--
function UI.ClanCreateWnd:MasterServer_OnClanChangeMotD( result, requestId )
	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text = UI:GetStringByName( "clans_error_motd_change" )
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		local reason = UI:GetStringByName( errorCode )
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

	if self.requestId == requestId then 
		self.requestId = nil
		if result == MasterServer.ClanOpResult.CLR_OK then
			self:Hide()
		end
	end
end

--
function UI.ClanCreateWnd:MasterServer_OnClanChangeDesc( result, requestId )
	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text = UI:GetStringByName( "clans_tooltip_change_find_desc" )
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		local reason = UI:GetStringByName( errorCode )
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

	if self.requestId == requestId then 
		self.requestId = nil
		if result == MasterServer.ClanOpResult.CLR_OK then
			self:Hide()
		end
	end
end


--
function UI.ClanCreateWnd:MasterServer_OnUserNotesAdd( result, requestId, param1, param2, u64Param )

	if requestId == self.requestId then
	
		self.requestId = nil
		
		if result == _G.MasterServer.UserNotesResult.UN_OK then
			self:Hide()
		else
			UI:ShowErrorMsg( "msg_userNoteAddError", result, "_G.MasterServer.UserNotesResult" )
		end
	
	end

end


--
function UI.ClanCreateWnd:MasterServer_OnUserNotesDelete( result, requestId, uids )

	if requestId == self.requestId then
	
		self.requestId = nil
		
		if result == _G.MasterServer.UserNotesResult.UN_OK then
			self:Hide()
		else
			UI:ShowErrorMsg( "msg_userNoteDeleteError", result, "_G.MasterServer.UserNotesResult" )
		end
	
	end

end


--
function UI.ClanCreateWnd:F_PostLoad()
	UI.FullScreenWnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.bCreateWnd = UI.ClansMyClan_CreateOkBtn
	self.bCancelWnd = UI.ClansMyClan_CreateCancelBtn

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
end


--
function UI.ClanCreateWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ClanCreateWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ClanCreateWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanCreateWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.ClanCreateWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ClanCreateWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.bCreateWnd then
		self:OnOk()
		return true
	elseif wnd == self.bCancelWnd then
		self:OnCancel()
		return true
	end

	return false

end


--
function UI.ClanCreateWnd:Show( mode, text, data )

	self.requestId = nil
	self.mode = mode
	self.data = data
	UI.FullScreenWnd.Show( self )
	self:Update()
	UI:PlayGlobalSound( UI.ClanCreateWnd.sounds.wndShow )
	if type( text ) == "string" then
		if UI.ClanCreateWnd_EditClanNameWnd:IsOnScreen() then
			UI.ClanCreateWnd_EditClanNameWnd:SetEditText( text )
			UI.ClanCreateWnd_EditClanNameWnd:SetSel( 0, string.len( text ) )
		else
			UI.Clan_MsgEditWnd:SetEditText( text )
			UI.Clan_MsgEditWnd:SetSel( 0, string.len( text ) )
		end
	else
		UI.ClanCreateWnd_EditClanNameWnd:SetEditText( "" )
		UI.Clan_MsgEditWnd:SetEditText( "" )
	end
	if UI.ClanCreateWnd_EditClanNameWnd:IsOnScreen() then
		UI:SetKeyboardFocus( UI.ClanCreateWnd_EditClanNameWnd:GetUiHandle() )
	elseif UI.Clan_MsgEditWnd:IsOnScreen() then
		UI:SetKeyboardFocus( UI.Clan_MsgEditWnd:GetUiHandle() )
	end
end

--
function UI.ClanCreateWnd:F_OnEventSaveUiState()
	
	if self:IsOnScreen() then
		local text = ""
		if UI.ClanCreateWnd_EditClanNameWnd:IsOnScreen() then
			text = UI.ClanCreateWnd_EditClanNameWnd:GetEditText()
		else
			if UI.Clan_MsgEditWnd:IsOnScreen() then
				text = UI.Clan_MsgEditWnd:GetEditText()
			end
		end
		UI.store.ClanCreateWnd =
		{
	        mode				= self.mode,
	        text 				= text,
	        requestId 			= self.requestId,
		}
	end
end


--
function UI.ClanCreateWnd:F_OnEventRestoreUiState()
	if UI.store.ClanCreateWnd then
        self.mode		= UI.store.ClanCreateWnd.mode
        text			= UI.store.ClanCreateWnd.text
        self.requestId  = UI.store.ClanCreateWnd.requestId
		UI.store.ClanCreateWnd = nil
		self:Show( self.mode, text )
	end
end


--
function UI.ClanCreateWnd:Update()

	self:AddChild( UI.ClanCreateWnd_EditClanNameWnd )
	self:SetText( "", self.layers.INFORMATION3 )
	for k, v in pairs( self.raceWnd ) do
		v:UnlinkFromParent()
	end
	UI.Clan_MsgEditWnd:UnlinkFromParent()
	UI.Clan_MsgEditWnd:SetSymbolsLimit( -1 )
	UI.Clan_MsgEditWnd:SetBytesLimit( 2048 )

	self.priceMetaText:SetText( "", true )

	if self.mode == UI.ClanCreateWnd.modes.CLAN_CREATE then 
		UI.ClanCreateWnd_EditClanNameWnd:SetSymbolsLimit( UI.ClanCreateWnd.MaxClanNameLength )
		self:SetText( UI:GetStringByName( "clans_create_clan_caption" ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( "clans_create_clan_clan_name" ), self.layers.CLAN_NAME )
		local str = string.format( UI:GetStringByName( "clans_create_clan_base_capacity" ), _G.ClanUpgradeValues[ MasterServer.ClanUpgrades.CU_CAPACITY ][ 1 ] )
		self:SetText( str, self.layers.INFORMATION )
		self:SetText( UI:GetStringByName( "clans_create_name_information" ), self.layers.INFORMATION2 )

		local cost = _G.GameStore_GetClanRegistrationCost()

    	local priceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
    		val			= cost,
    		bIsBuyPrice	= true,
    		basePrice	= cost,
    	}

    	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, true, true, nil )
		self.priceMetaText:SetText( strPrice, true )

		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "clans_create_ok" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "clans_create_cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )
	elseif self.mode == UI.ClanCreateWnd.modes.CLAN_RENAME then 
		UI.ClanCreateWnd_EditClanNameWnd:SetSymbolsLimit( UI.ClanCreateWnd.MaxClanNameLength )
		self:SetText( UI:GetStringByName( "clans_rename_clan_caption" ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( "clans_create_clan_clan_name" ), self.layers.CLAN_NAME )
		self:SetText( "", self.layers.INFORMATION )
		self:SetText( UI:GetStringByName( "clans_create_name_information" ), self.layers.INFORMATION2 )

		local cost = _G.GameStore_GetClanChangeNameCost()

    	local priceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
    		val			= cost,
    		bIsBuyPrice	= true,
    		basePrice	= cost,
    	}

    	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, true, true, nil )
		self.priceMetaText:SetText( strPrice, true )

		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "clans_change_ok" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )
	elseif self.mode == UI.ClanCreateWnd.modes.CLAN_RENAME_TAG then 
		UI.ClanCreateWnd_EditClanNameWnd:SetSymbolsLimit( UI.ClanCreateWnd.MaxClanTagLength )
		self:SetText( UI:GetStringByName( "clans_rename_tag_caption" ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( "clans_rename_tag_name" ), self.layers.CLAN_NAME )
		self:SetText( "", self.layers.INFORMATION )
		self:SetText( UI:GetStringByName( "clans_rename_tag_information" ), self.layers.INFORMATION2 )

		local cost = _G.GameStore_GetClanChangeTagCost()

    	local priceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
    		val			= cost,
    		bIsBuyPrice	= true,
    		basePrice	= cost,
    	}

    	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, true, true, nil )
		self.priceMetaText:SetText( strPrice, true )

		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "clans_change_ok" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )
	elseif self.mode == UI.ClanCreateWnd.modes.PLAYER_RENAME then 
		UI.ClanCreateWnd_EditClanNameWnd:SetSymbolsLimit( UI.ClanCreateWnd.MaxPlayerNameLength )
		self:SetText( UI:GetStringByName( "players_rename_caption" ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( "players_rename_name" ), self.layers.CLAN_NAME )
		self:SetText( "", self.layers.INFORMATION )
		self:SetText( UI:GetStringByName( "players_rename_information" ), self.layers.INFORMATION2 )

		local cost = _G.MasterServer_GetNickNameChangeCost()

    	local priceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_GOLD,
    		val			= cost,
    		bIsBuyPrice	= true,
    		basePrice	= cost,
    	}

    	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, true, true, nil )
		self.priceMetaText:SetText( strPrice, true )

		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "clans_change_ok" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )
	elseif self.mode == UI.ClanCreateWnd.modes.CLAN_MESSAGE then
		self:SetText( UI:GetStringByName( "clans_clan_message_caption" ), self.layers.CAPTION )
		self:SetText( "", self.layers.INFORMATION3 )
		self:SetText( "", self.layers.INFORMATION2 )
		self:SetText( "", self.layers.INFORMATION )
		self:SetText( "", self.layers.CLAN_NAME )
		self.priceMetaText:SetText( "", true )
		UI.ClanCreateWnd_EditClanNameWnd:UnlinkFromParent()
		self:AddChild( UI.Clan_MsgEditWnd )
		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "clans_clan_message_ok" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )
	elseif self.mode == UI.ClanCreateWnd.modes.FIND_DESC_MESSAGE then
		self:SetText( UI:GetStringByName( "clans_find_desc_caption" ), self.layers.CAPTION )
		self:SetText( "", self.layers.INFORMATION3 )
		self:SetText( "", self.layers.INFORMATION2 )
		self:SetText( "", self.layers.INFORMATION )
		self:SetText( "", self.layers.CLAN_NAME )
		self.priceMetaText:SetText( "", true )
		UI.ClanCreateWnd_EditClanNameWnd:UnlinkFromParent()
		self:AddChild( UI.Clan_MsgEditWnd )
		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "clans_clan_message_ok" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )

	elseif self.mode == UI.ClanCreateWnd.modes.ARENA_TEAM_CREATE then 

		UI.ClanCreateWnd_EditClanNameWnd:SetSymbolsLimit( UI.ClanCreateWnd.MaxArenaTeamNameLength )
		self:SetText( UI:GetStringByName( "arena_teamCreate_caption" ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( "arena_teamCreate_inputLabel" ), self.layers.CLAN_NAME )
		self:SetText( UI:GetStringByName( "arena_teamCreate_info" ), self.layers.INFORMATION2 )
		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "arena_teamCreate_okBtn" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )

		self:SetText( "", self.layers.INFORMATION )
		self:SetText( "", self.layers.INFORMATION3 )
		self.priceMetaText:SetText( "", true )
		
	elseif self.mode == UI.ClanCreateWnd.modes.SHIP_PRESET_ADD then 
		
		UI.ClanCreateWnd_EditClanNameWnd:SetSymbolsLimit( UI.SHIP_PRESET_MAX_NAME_LENGTH )
		self:SetText( UI:GetStringByName( "shipPresets_addPreset_caption" ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( "shipPresets_addPreset_inputLabel" ), self.layers.CLAN_NAME )
		self:SetText( UI:GetStringByName( "shipPresets_addPreset_info" ), self.layers.INFORMATION2 )
		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "shipPresets_addPreset_okBtn" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )

		self:SetText( "", self.layers.INFORMATION )
		self:SetText( "", self.layers.INFORMATION3 )
		self.priceMetaText:SetText( "", true )
		
	elseif self.mode == UI.ClanCreateWnd.modes.USER_NOTE then
		
		self:AddChild( UI.Clan_MsgEditWnd )
		local maxTextLenInBytes = _G.MasterServer_GetUserNoteMaxTextLength()
		local maxTextLenInSymbols = math.floor( maxTextLenInBytes / 4 )
		UI.Clan_MsgEditWnd:SetSymbolsLimit( maxTextLenInSymbols )
		UI.Clan_MsgEditWnd:SetBytesLimit( maxTextLenInBytes + 1 )	-- функция принимает значение, включающее 0
		
		self:SetText( UI:GetStringByName( "userNotes_addNote_caption" ), self.layers.CAPTION )
		UI.ClansMyClan_CreateOkBtn:SetText( UI:GetStringByName( "userNotes_addNote_okBtn" ), UI.ClansMyClan_CreateOkBtn.layers.TEXT )
		UI.ClansMyClan_CreateCancelBtn:SetText( UI:GetStringByName( "cancel" ), UI.ClansMyClan_CreateCancelBtn.layers.TEXT )

		UI.ClanCreateWnd_EditClanNameWnd:UnlinkFromParent()
		self:SetText( "", self.layers.CLAN_NAME )
		self:SetText( "", self.layers.INFORMATION )
		self:SetText( "", self.layers.INFORMATION2 )
		self:SetText( "", self.layers.INFORMATION3 )
		self.priceMetaText:SetText( "", true )
		
	end

end


--
function UI.ClanCreateWnd:DeleteClanTag()

	self.requestId = _G.MasterServer_ClanChangeTag( "" )

end


--
function UI.ClanCreateWnd:OnOk()

	if self.requestId ~= nil then
		return
	end

	local clanName = UI.ClanCreateWnd_EditClanNameWnd:GetEditText()
	local wrong = false

	if self.mode == self.modes.CLAN_MESSAGE or self.mode == self.modes.FIND_DESC_MESSAGE then

	elseif self.mode == self.modes.CLAN_RENAME_TAG then
		if clanName ~= "" then
			if string.len( clanName ) > UI.ClanCreateWnd.MaxClanTagLength or string.len( clanName ) < 2 then
				local text = UI:GetStringByName( "clans_error_tag_cant_change" )
				local errorCode = "CLR_INVALID_CLAN_TAG_LENGTH"
				local reason = UI:GetStringByName( errorCode )
				self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
				return
			end
		else
			if UI.Clan:GetTag() == "" then
				self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "clan_error_delete_empty_tag" ), UI.MBS_OK )
				return
			end
		end
	elseif self.mode == self.modes.PLAYER_RENAME then
		if clanName == "" or string.len( clanName ) > UI.ClanCreateWnd.MaxPlayerNameLength or string.len( clanName ) < 2 then
			local text = UI:GetStringByName( "players_error_cant_rename" )
			local errorCode = "NNCR_INVALID_LENGTH"
			local reason = UI:GetStringByName( errorCode )
			self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
			return
		end
	elseif self.mode == self.modes.ARENA_TEAM_CREATE then
		if clanName == "" or string.len( clanName ) > UI.ClanCreateWnd.MaxArenaTeamNameLength or string.len( clanName ) < UI.ClanCreateWnd.MinArenaTeamNameLength then
			local text = UI:GetStringByName( "arena_teamCreate_invalidName" )
			local errorCode = "LTEAMOR_INVALID_TITLE_LENGTH"
			local reason = UI:GetStringByName( errorCode )
			self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
			return
		end
	elseif self.mode == self.modes.SHIP_PRESET_ADD then
		if clanName == "" or _G.Utf8StrLen( clanName ) > UI.SHIP_PRESET_MAX_NAME_LENGTH then
			self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "shipPresets_errorMsg_invalidName" ), UI.MBS_OK )
			return
		end
	elseif self.mode == self.modes.USER_NOTE then
		
	else
		if clanName == "" or string.len( clanName ) > UI.ClanCreateWnd.MaxClanNameLength or string.len( clanName ) < 3 then
			local text 
			if self.mode == self.modes.CLAN_CREATE then
				text = UI:GetStringByName( "clans_error_cant_create" )
			else
				text = UI:GetStringByName( "clans_error_cant_rename" )
			end
			local errorCode = "CLR_INVALID_CLAN_NAME_LENGTH"
			local reason = UI:GetStringByName( errorCode )
			self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
			return
		end
	end

	if self.mode ~= self.modes.SHIP_PRESET_ADD and self.mode ~= self.modes.USER_NOTE then
		for i = 1, #clanName do
			local byte = string.byte( clanName, i )
			if not byte or byte > 127 then
				wrong = true
				break
			end
		end
	end

	if wrong then
		local text
		local errorCode
		if self.mode == self.modes.CLAN_RENAME_TAG then
			text = UI:GetStringByName( "clans_error_tag_cant_change" )
			errorCode = "CLR_INVALID_CLAN_TAG_SYMBOL"
		elseif self.mode == self.modes.CLAN_CREATE then
			text = UI:GetStringByName( "clans_error_cant_create" )
			errorCode = "CLR_INVALID_CLAN_NAME_SYMBOL"
		elseif self.mode == self.modes.PLAYER_RENAME then
			text = UI:GetStringByName( "players_error_cant_rename" )
			errorCode = "NNCR_INVALID_SYMBOL"
		elseif self.mode == self.modes.ARENA_TEAM_CREATE then
			text = UI:GetStringByName( "arena_teamCreate_invalidName" )
			errorCode = "LTEAMOR_INVALID_TITLE_SYMBOL"
		else
			text = UI:GetStringByName( "clans_error_cant_rename" )
			errorCode = "CLR_INVALID_CLAN_NAME_SYMBOL"
		end
		local reason = UI:GetStringByName( errorCode )
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		return
	end

	if self.mode == self.modes.CLAN_CREATE then
		self.requestId = _G.MasterServer_ClanCreate( clanName )
	elseif self.mode == self.modes.CLAN_RENAME then
		self.requestId = _G.MasterServer_ClanChangeName( clanName )
	elseif self.mode == self.modes.PLAYER_RENAME then
		self.requestId = _G.MasterServer_ChangePlayerNickName( clanName )
	elseif self.mode == self.modes.CLAN_RENAME_TAG then

		if clanName == "" then
			UI.ClansMainWnd.msgDeleteTag = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msgClan_delete_tag_confirm" ), UI.MBS_YES_NO )
		else
			self.requestId = _G.MasterServer_ClanChangeTag( clanName )
		end
	elseif self.mode == self.modes.CLAN_MESSAGE then
		local text = UI:ShieldSpecSymbols( UI.Clan_MsgEditWnd:GetEditText() )
		self.requestId = _G.MasterServer_ClanChangeMotD( text )
	elseif self.mode == self.modes.FIND_DESC_MESSAGE then
		local text = UI:ShieldSpecSymbols( UI.Clan_MsgEditWnd:GetEditText() )
		self.requestId = _G.MasterServer_ClanChangeDesc( text )
	elseif self.mode == self.modes.ARENA_TEAM_CREATE then
	    UI.Arena:CreateTeam( clanName )
		self:Hide()
	elseif self.mode == self.modes.SHIP_PRESET_ADD then
		if UI:ShipPreset_AddPreset( self.data.vid, clanName ) then
			self:Hide()
		end
	elseif self.mode == self.modes.USER_NOTE then
	
		local text = UI.Clan_MsgEditWnd:GetEditText()
	
		-- если в тексте только управляющие символы (0-31) и пробелы (32), то текст считается пустым
		local hasMeaningfulSymbols = false
		
		for charIdx = 1, #text do
			local char = string.byte( text, charIdx )
			if char > 32 then
				hasMeaningfulSymbols = true
				break
			end
		end
	
		-- если текст пустой, то заметка удаляется
		if hasMeaningfulSymbols then
		
			local requestId = _G.MasterServer_AddUserNote( self.data.uid, text )
			if requestId ~= 0 then
				self.requestId = requestId
			else
				UI:ShowErrorMsg( "msg_userNoteAddError", _G.MasterServer.UserNotesResult.UN_ERROR, "_G.MasterServer.UserNotesResult" )
			end
			
		else
		
			local requestId = _G.MasterServer_DeleteUserNote( self.data.uid )
			if requestId ~= 0 then
				self.requestId = requestId
			else
				UI:ShowErrorMsg( "msg_userNoteDeleteError", _G.MasterServer.UserNotesResult.UN_ERROR, "_G.MasterServer.UserNotesResult" )
			end
		
		end
		
	end

	UI:PlayGlobalSound( "sound/ui/apply" )

end


--
function UI.ClanCreateWnd:OnCancel()
	
	UI:PlayGlobalSound( UI.ClansMainWnd.sounds.hide )
	self:Hide()

end


--
function UI.ClanCreateWnd:OnEnter()
	
	self:OnOk()
	return true

end


--
function UI.ClanCreateWnd:OnEscape()
	
	self:OnCancel()
	return true

end


--
UI.ClansMyClan_CreateOkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ClansMyClan_CreateOkBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^clans_create_ok",
   			},
   		}
	},
}


--
UI.ClansMyClan_CreateCancelBtn =
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
   				text	= "^clans_create_cancel",
   			},
   		}
	},
}


-- ------------------------------------------------------------------------
-- UI.InviteFriend_EditNicknameWnd
-- ------------------------------------------------------------------------

UI.ClanCreateWnd_EditClanNameWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "ClanCreateWnd_EditClanNameWnd",
     		activationOrder	= 1,
    		--isPrototype		= true,
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
    			  	defName				= "clan_create_input",
    				defaultAnimation    = "idle",


    				links =
    				{
    					{
    						objName		= "input_text",
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
    		textObjName				= "input_text",
    		selectionColorObjName	= "select_text_color",
    		cursorColorObjName		= "cursor_color",
    		animActive				= "idle",
    		animInactive			= "idle",
    	}
    }
}




-- ------------------------------------------------------------------------
-- UI.ClanExpand_Wnd
-- ------------------------------------------------------------------------

UI.ClanExpand_Wnd =
{
    def =
    {   	
     	className	= "Wnd",

     	props =
     	{
     		name			= "ClanExpand_Wnd",
     		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
    			  	defName				= "equipment_inventorySize",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

						{
							objName		= "value",	
							layer		= "UI.ClanExpand_Wnd.layers.CURRENT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "value_left",	
							layer		= "UI.ClanExpand_Wnd.layers.CURRENT_LEFT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},

						{
							objName		= "btn",	
							wnd			= "UI.ClanExpand_Wnd",
							animParams	= UI.EffectAnimParams.POS,
						},
					}
				}}
			},

			-- CURRENT
			{
				layerType		= UI.LAYER_TEXT,

	   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "VerySmall" },
			},

			-- CURRENT_LEFT
			{
				layerType		= UI.LAYER_TEXT,

	   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "VerySmall" },
			},
     	},

     	children = { "UI.ClanExpand_BtnWnd" }
    },
}


UI.ClanExpand_Wnd.layers = 
{
	MAIN_EFFECT 			= 0,
	CURRENT					= 1,
	CURRENT_LEFT			= 2,
}


function UI.ClanExpand_Wnd:Update()

	local text = UI:GetStringByName( "clan_current_capacity" )
	local maxCapacity = UI.Clan:GetMaxCapacity()
	local str = string.format( text, UI.Clan:GetMembersCount(), maxCapacity )
	self:SetText( str, UI.ClanExpand_Wnd.layers.CURRENT )
	self:SetText( str, UI.ClanExpand_Wnd.layers.CURRENT_LEFT )
	local actions = _G.MasterServer_ClanGetActionPrivileges( _G.MasterServer_GetLocalUserId() )
	local canExpand = false
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_UPGRADE then
			canExpand = true
			break
		end
	end
	if canExpand then
		if UI.Clan:IsMaxExpandReached( MasterServer.ClanUpgrades.CU_CAPACITY ) then
			self:SetLayerVisible( true, self.layers.CURRENT_LEFT )
			self:SetLayerVisible( false, self.layers.CURRENT )
			self:RemoveChild( UI.ClanExpand_BtnWnd )
			str = str..UI:GetStringByName( "clan_capacity_max" )
			self:SetText( str, UI.ClanExpand_Wnd.layers.CURRENT_LEFT )
		else
			self:SetLayerVisible( false, self.layers.CURRENT_LEFT )
			self:SetLayerVisible( true, self.layers.CURRENT )
			UI:AddChildAndLink( self, UI.ClanExpand_BtnWnd, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ) , "btn", UI.EffectAnimParams.POS )
		end
	else
		self:SetLayerVisible( true, self.layers.CURRENT_LEFT )
		self:SetLayerVisible( false, self.layers.CURRENT )
		self:RemoveChild( UI.ClanExpand_BtnWnd )
	end

end


-- -------------------------------------------------------------------
-- UI.ClanExpand_BtnWnd
-- -------------------------------------------------------------------

UI.ClanExpand_BtnWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name	= "ClanExpand_BtnWnd",
			selectSound		= UI.sounds.btnMouseOver,
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
    				defName 			= "equipment_inventorySize_btn",
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
    		animationSelect			= "idle_over",
    		animationPressed		= "press",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
    }
}

--
function UI.ClanExpand_BtnWnd:GetTooltipData()
	return 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = UI:GetStringByName( "tooltip_clan_expand_text" ),
			caption = UI:GetStringByName( "tooltip_clan_expand_caption" )
		}
end


-- -------------------------------------------------------------------
-- UI.ClanExtend_BuyWnd
-- -------------------------------------------------------------------

UI.ClanExtend_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "ClanExtend_BuyWnd",
    	},
	},

	mainWndName = "ClansMainWnd",
}

-- -------------------------------------------------------------------
-- UI.ClansMyClan_EmblemWnd
-- -------------------------------------------------------------------
UI.ClansMyClan_EmblemWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype 	= "GameplayMapGalaxyClanOwner"
    }
}

-- ---------------------------------------------------------------------------
-- UI.ClanTokenDeposit_Wnd
-- ---------------------------------------------------------------------------

UI.ClanTokenDeposit_Wnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.ClanTokenDeposit_Wnd.def =
{	
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "ClanTokenDeposit_Wnd",
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
				defName 			= "help_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "collect_irid_win",	
						layer		= "UI.ClanTokenDeposit_Wnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

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
				defName 			= "clanTokenDeposit",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text17",	
						layer		= "UI.ClanTokenDeposit_Wnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "gold_2_1",	
						layer		= "UI.ClanTokenDeposit_Wnd.layers.PRICE_VAL_1_CREDITS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "money_2_1",	
						layer		= "UI.ClanTokenDeposit_Wnd.layers.PRICE_VAL_2_CREDITS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "gold_2_2",
						layer		= "UI.ClanTokenDeposit_Wnd.layers.PRICE_VAL_1_GOLD",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "money_2_2",
						layer		= "UI.ClanTokenDeposit_Wnd.layers.PRICE_VAL_2_GOLD",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "gold_2_3",
						layer		= "UI.ClanTokenDeposit_Wnd.layers.PRICE_VAL_1_TOKENS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "money_2_3",
						layer		= "UI.ClanTokenDeposit_Wnd.layers.PRICE_VAL_2_TOKENS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "buy_slider_main_1",
						wnd			= "UI.ClanTokenDeposit_SliderWnd_credits",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "buy_slider_main_2",
						wnd			= "UI.ClanTokenDeposit_SliderWnd_gold",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "buy_slider_main_3",
						wnd			= "UI.ClanTokenDeposit_SliderWnd_tokens",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_35",
						wnd			= "UI.ClanTokenDeposit_OkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_36",
						wnd			= "UI.ClanTokenDeposit_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text18",	
						layer		= "UI.ClanTokenDeposit_Wnd.layers.CLAN_IRIDIUM_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text19",	
						layer		= "UI.ClanTokenDeposit_Wnd.layers.CLAN_IRIDIUM_VAL",
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
   			text		= "^clan_iridium_deposit_wnd_caption"
		},
		
		-- CLAN_IRIDIUM_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clan_iridium_deposit_wnd_clanIridium" ),
		},

		-- CLAN_IRIDIUM_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_VAL_1_CREDITS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- PRICE_VAL_2_CREDITS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- PRICE_VAL_1_GOLD
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- PRICE_VAL_2_GOLD
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- PRICE_VAL_1_TOKENS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- PRICE_VAL_2_TOKENS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	},

	children = { "UI.ClanTokenDeposit_SliderWnd_credits", "UI.ClanTokenDeposit_SliderWnd_gold", "UI.ClanTokenDeposit_SliderWnd_tokens", "UI.ClanTokenDeposit_OkBtn", "UI.ClanTokenDeposit_CancelBtn" },
}


--
function UI.ClanTokenDeposit_Wnd:MasterServer_OnClanBankTransfer( result, requestId, resource, amount )
	if result ~= 0 then
		text = UI:GetStringByName( "clans_error_cant_exchange_resource" )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..UI:GetStringByName( UI:Val2Key( MasterServer.ClanOpResult, result ) ), UI.MBS_OK )
	end
end

-- ---------------------------------------------------------------------------
-- consts
-- ---------------------------------------------------------------------------

--
UI.ClanTokenDeposit_Wnd.layers = 
{
	MAIN_EFFECT			= 0,
	BG_EFFECT			= 1,
	WORK_EFFECT			= 2,
	CAPTION				= 3,
	CLAN_IRIDIUM_LABEL	= 4,
	CLAN_IRIDIUM_VAL	= 5,
	PRICE_VAL_1_CREDITS	= 6,
	PRICE_VAL_2_CREDITS	= 7,
	PRICE_VAL_1_GOLD	= 8,
	PRICE_VAL_2_GOLD	= 9,
	PRICE_VAL_1_TOKENS	= 10,
	PRICE_VAL_2_TOKENS	= 11,
}

UI.ClanTokenDeposit_Wnd.sounds = 
{
	wndShow			= "sound/ui/btnClick",
	wndHide			= "sound/ui/MsgHide",
}

UI.ClanTokenDeposit_Wnd.price1MetaText_credits	= nil
UI.ClanTokenDeposit_Wnd.price2MetaText_credits	= nil
UI.ClanTokenDeposit_Wnd.price1MetaText_gold		= nil
UI.ClanTokenDeposit_Wnd.price2MetaText_gold		= nil
UI.ClanTokenDeposit_Wnd.price1MetaText_tokens	= nil
UI.ClanTokenDeposit_Wnd.price2MetaText_tokens	= nil
UI.ClanTokenDeposit_Wnd.clanIridiumMaxColor		= UI.WHITE_COLOR
UI.ClanTokenDeposit_Wnd.bLockSlidersUpdate		= false

-- ---------------------------------------------------------------------------
-- vars
-- ---------------------------------------------------------------------------

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ClanTokenDeposit_Wnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SLIDER_CHANGED )

	self.price1MetaText_credits = UI.MetaText.GetNewInstance()
	self.price1MetaText_credits:InitFromLayer( self, self.layers.PRICE_VAL_1_CREDITS )

	self.price2MetaText_credits = UI.MetaText.GetNewInstance()
	self.price2MetaText_credits:InitFromLayer( self, self.layers.PRICE_VAL_2_CREDITS )
	
	self.price1MetaText_gold = UI.MetaText.GetNewInstance()
	self.price1MetaText_gold:InitFromLayer( self, self.layers.PRICE_VAL_1_GOLD )

	self.price2MetaText_gold = UI.MetaText.GetNewInstance()
	self.price2MetaText_gold:InitFromLayer( self, self.layers.PRICE_VAL_2_GOLD )
	
	self.price1MetaText_tokens = UI.MetaText.GetNewInstance()
	self.price1MetaText_tokens:InitFromLayer( self, self.layers.PRICE_VAL_1_TOKENS )

	self.price2MetaText_tokens = UI.MetaText.GetNewInstance()
	self.price2MetaText_tokens:InitFromLayer( self, self.layers.PRICE_VAL_2_TOKENS )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		self.clanIridiumMaxColor = workEffect:GetObjColor( "color_1" )
	end

end


--
function UI.ClanTokenDeposit_Wnd:F_Shutdown()

	if self.price1MetaText_credits then
		self.price1MetaText_credits:Clear()
	end

	if self.price2MetaText_credits then
		self.price2MetaText_credits:Clear()
	end

	if self.price1MetaText_gold then
		self.price1MetaText_gold:Clear()
	end

	if self.price2MetaText_gold then
		self.price2MetaText_gold:Clear()
	end

	if self.price1MetaText_tokens then
		self.price1MetaText_tokens:Clear()
	end

	if self.price2MetaText_tokens then
		self.price2MetaText_tokens:Clear()
	end
	
	UI.Wnd.F_Shutdown( self )

end


--
function UI.ClanTokenDeposit_Wnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanTokenDeposit_Wnd:UpdateMetaTextPos()

	self.price1MetaText_credits:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_1_CREDITS )
	self.price2MetaText_credits:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_2_CREDITS )
	self.price1MetaText_gold:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_1_GOLD )
	self.price2MetaText_gold:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_2_GOLD )
	self.price1MetaText_tokens:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_1_TOKENS )
	self.price2MetaText_tokens:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL_2_TOKENS )

end


--
function UI.ClanTokenDeposit_Wnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL_1_CREDITS then
		self.price1MetaText_credits:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_VAL_2_CREDITS then
		self.price2MetaText_credits:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_VAL_1_GOLD then
		self.price1MetaText_gold:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.PRICE_VAL_2_GOLD then
		self.price2MetaText_gold:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.PRICE_VAL_1_TOKENS then
		self.price1MetaText_tokens:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.PRICE_VAL_2_TOKENS then
		self.price2MetaText_tokens:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ClanTokenDeposit_Wnd:Show()
	UI:PlayGlobalSound( self.sounds.wndShow )
	UI.FullScreenWnd.Show( self )
end

--
function UI.ClanTokenDeposit_Wnd:Hide()
	UI:PlayGlobalSound( self.sounds.wndHide )
	UI.FullScreenWnd.Hide( self )
end

--
function UI.ClanTokenDeposit_Wnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self.bLockSlidersUpdate = true
	UI.ClanTokenDeposit_SliderWnd_credits:SetVal( 0 )
	UI.ClanTokenDeposit_SliderWnd_gold:SetVal( 0 )
	UI.ClanTokenDeposit_SliderWnd_tokens:SetVal( 0 )
	self.bLockSlidersUpdate = false
	self:UpdateSliders( nil )
	
	self:UpdateResources()

	self:UpdateMetaTextPos()

end     


--
function UI.ClanTokenDeposit_Wnd:UpdateSliders( changedSliderWnd )

	if self.bLockSlidersUpdate then
		return
	end
	
	-- предотвращаем рекурсивный апдейт, одного адпейта на всех достаточно (сюда может рекурсивно зайти, т.к. при изменении одного слайдера меняются другие)
	self.bLockSlidersUpdate = true

	local iridiumMiss = UI.Clan:GetMaxResourceCount() - UI.Clan:GetResources( MasterServer.ClanResource.CRES_IRIDIUM ).l
	
	local credits				= UI:GetPlayerMoney( false )
	local gold					= UI:GetPlayerMoney( true )
	local tokens				= UI:GetPlayerTokens()
	
	-- целое число, сколько кредитов/золота/токенов надо отдать за 1ед. иридиума
	local exchangeRate_credits	= _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_CREDITS_TO_IRIDIUM ) or 1
	local exchangeRate_gold		= _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_GOLD_TO_IRIDIUM ) or 1
	local exchangeRate_tokens	= _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_IRIDIUM ) or 1
	
	local iridiumGiven_credits	= math.floor( UI.ClanTokenDeposit_SliderWnd_credits:GetVal() / exchangeRate_credits )
	local iridiumGiven_gold		= math.floor( UI.ClanTokenDeposit_SliderWnd_gold:GetVal() / exchangeRate_gold )
	local iridiumGiven_tokens	= math.floor( UI.ClanTokenDeposit_SliderWnd_tokens:GetVal() / exchangeRate_tokens )
	
	-- changedSliderWnd - слайдер, значение которого было только что изменено, его не трогаем, а остальные подстраиваются (меняют свой макс)
	
	-- кредиты
	if UI.ClanTokenDeposit_SliderWnd_credits ~= changedSliderWnd then
	
		local clanIridiumMissFixed = math.max( iridiumMiss - iridiumGiven_gold - iridiumGiven_tokens, 0 )
		
		local clanMax_credits = clanIridiumMissFixed * exchangeRate_credits
		clanMax_credits = math.min( credits, clanMax_credits )
		clanMax_credits = math.floor( clanMax_credits / exchangeRate_credits ) * exchangeRate_credits	-- максимальное количество показывается кратное стоимости 1 ед. иридиума
		UI.ClanTokenDeposit_SliderWnd_credits:SetMinMax( 0, clanMax_credits )
		
		UI.ClanTokenDeposit_SliderWnd_credits:SetStep( exchangeRate_credits )
		
	end
	
	-- золото
	if UI.ClanTokenDeposit_SliderWnd_gold ~= changedSliderWnd then
	
		local clanIridiumMissFixed = math.max( iridiumMiss - iridiumGiven_credits - iridiumGiven_tokens, 0 )
		
		local clanMax_gold = clanIridiumMissFixed * exchangeRate_gold
		clanMax_gold = math.min( gold, clanMax_gold )
		clanMax_gold = math.floor( clanMax_gold / exchangeRate_gold ) * exchangeRate_gold	-- максимальное количество показывается кратное стоимости 1 ед. иридиума
		UI.ClanTokenDeposit_SliderWnd_gold:SetMinMax( 0, clanMax_gold )
		
		UI.ClanTokenDeposit_SliderWnd_gold:SetStep( exchangeRate_gold )
		
	end
	
	-- токены
	if UI.ClanTokenDeposit_SliderWnd_tokens ~= changedSliderWnd then
	
		local clanIridiumMissFixed = math.max( iridiumMiss - iridiumGiven_credits - iridiumGiven_gold, 0 )
		
		local clanMax_tokens = clanIridiumMissFixed * exchangeRate_tokens
		clanMax_tokens = math.min( tokens, clanMax_tokens )
		clanMax_tokens = math.floor( clanMax_tokens / exchangeRate_tokens ) * exchangeRate_tokens	-- максимальное количество показывается кратное стоимости 1 ед. иридиума
		UI.ClanTokenDeposit_SliderWnd_tokens:SetMinMax( 0, clanMax_tokens )
		
		UI.ClanTokenDeposit_SliderWnd_tokens:SetStep( exchangeRate_tokens )
		
	end
	
	self.bLockSlidersUpdate = false
	
end


--
function UI.ClanTokenDeposit_Wnd:UpdateResources()

	-- целое число, сколько кредитов/золота/токенов надо отдать за 1ед. иридиума
	local exchangeRate_credits	= _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_CREDITS_TO_IRIDIUM ) or 1
	local exchangeRate_gold		= _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_GOLD_TO_IRIDIUM ) or 1
	local exchangeRate_tokens	= _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_IRIDIUM ) or 1

	-- кредиты
	local yourMoney_credits = UI:GetPlayerMoney( false ) - UI.ClanTokenDeposit_SliderWnd_credits:GetVal()
	local theirMoney_credits = math.floor( UI.ClanTokenDeposit_SliderWnd_credits:GetVal() / exchangeRate_credits )

	local strYourMoney_credits	= string.format( "%s$credits_big$", UI:Num2StrSeparatedBy3( yourMoney_credits ) )
	local strTheirMoney_credits	= string.format( "%s$clan_iridium$", UI:Num2StrSeparatedBy3( theirMoney_credits ) )

	self.price1MetaText_credits:SetText( strYourMoney_credits, true )
	self.price2MetaText_credits:SetText( strTheirMoney_credits, true )
	
	-- золото
	local yourMoney_gold = UI:GetPlayerMoney( true ) - UI.ClanTokenDeposit_SliderWnd_gold:GetVal()
	local theirMoney_gold = math.floor( UI.ClanTokenDeposit_SliderWnd_gold:GetVal() / exchangeRate_gold )

	local strYourMoney_gold		= string.format( "%s$gold_big$", UI:Num2StrSeparatedBy3( yourMoney_gold ) )
	local strTheirMoney_gold	= string.format( "%s$clan_iridium$", UI:Num2StrSeparatedBy3( theirMoney_gold ) )

	self.price1MetaText_gold:SetText( strYourMoney_gold, true )
	self.price2MetaText_gold:SetText( strTheirMoney_gold, true )

	-- токены
	local yourMoney_tokens = UI:GetPlayerTokens() - UI.ClanTokenDeposit_SliderWnd_tokens:GetVal()
	local theirMoney_tokens = math.floor( UI.ClanTokenDeposit_SliderWnd_tokens:GetVal() / exchangeRate_tokens )

	local strYourMoney_tokens	= string.format( "%s$iridium$", UI:Num2StrSeparatedBy3( yourMoney_tokens ) )
	local strTheirMoney_tokens	= string.format( "%s$clan_iridium$", UI:Num2StrSeparatedBy3( theirMoney_tokens ) )

	self.price1MetaText_tokens:SetText( strYourMoney_tokens, true )
	self.price2MetaText_tokens:SetText( strTheirMoney_tokens, true )
	

	if UI.ClanTokenDeposit_SliderWnd_credits:GetVal() == 0 and UI.ClanTokenDeposit_SliderWnd_gold:GetVal() == 0 and UI.ClanTokenDeposit_SliderWnd_tokens:GetVal() == 0 then
		UI.ClanTokenDeposit_OkBtn:AddStyle( UI.WS_DISABLE )
	else
		UI.ClanTokenDeposit_OkBtn:RemoveStyle( UI.WS_DISABLE )
	end

	local clanIridiumCur	= UI:GetIridium()
	local clanIridiumMax	= UI.Clan:GetMaxResourceCount()

	local strClanIridium = string.format( "%s%s/%s", UI:Num2StrSeparatedBy3( clanIridiumCur ), UI:Color2Str( self.clanIridiumMaxColor ), UI:Num2StrSeparatedBy3( clanIridiumMax ) )
	self:SetText( strClanIridium, self.layers.CLAN_IRIDIUM_VAL )
	
end

--
function UI.ClanTokenDeposit_Wnd:F_OnEventSliderChanged( hSender, iParam0, iParam1, fParam0, fParam1 )
	if not self:IsOnScreen() then
		return
	end
	local sliderWnd	= UI:GetUiObjByHandleT( hSender )
	if sliderWnd:IsChildOf( self ) then
		self:UpdateSliders( sliderWnd )
		self:UpdateResources()
	end
end

--
function UI.ClanTokenDeposit_Wnd:Cancel()
	self:Hide()
end

--
function UI.ClanTokenDeposit_Wnd:OnEscape()
	self:Cancel()
	return true;
end

--
function UI.ClanTokenDeposit_Wnd:Exchange()

	local resourcesTable = {}

	local givenCredits = UI.ClanTokenDeposit_SliderWnd_credits:GetVal()
	if givenCredits ~= 0 then
		resourcesTable[ _G.MasterServer.ClanTransferResource.CTR_CREDITS_TO_IRIDIUM ] = givenCredits
	end
	
	local givenGold = UI.ClanTokenDeposit_SliderWnd_gold:GetVal()
	if givenGold ~= 0 then
		resourcesTable[ _G.MasterServer.ClanTransferResource.CTR_GOLD_TO_IRIDIUM ] = givenGold
	end
	
	local givenTokens = UI.ClanTokenDeposit_SliderWnd_tokens:GetVal()
	if givenTokens ~= 0 then
		resourcesTable[ _G.MasterServer.ClanTransferResource.CTR_IRIDIUM ] = givenTokens
	end
	
	if not next( resourcesTable ) then
		sys.log( "UI.ClanTokenDeposit_Wnd:Exchange(): no resources to exchange" )
		return
	end
	
	_G.MasterServer_ClanBankTransfer( resourcesTable )
	
	self:Hide()
	
end

--
function UI.ClanTokenDeposit_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ClanTokenDeposit_OkBtn == wnd then
		self:Exchange()
	elseif UI.ClanTokenDeposit_CancelBtn == wnd then
		self:Cancel()
	end
	return true
end


-- ---------------------------------------------------------------------------------------------------------------
-- UI.ClanTokenDeposit_SliderWnd_credits, UI.ClanTokenDeposit_SliderWnd_gold, ClanTokenDeposit_SliderWnd_tokens
-- ---------------------------------------------------------------------------------------------------------------

--
UI.ClanTokenDeposit_SliderWnd_credits =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Slider2Wnd",
	
		props =
		{
			name	= "ClanTokenDeposit_SliderWnd_credits",
		},
	},
}


--
UI.ClanTokenDeposit_SliderWnd_gold =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Slider2Wnd",
	
		props =
		{
			name	= "ClanTokenDeposit_SliderWnd_gold",
		},
	},
}


--
UI.ClanTokenDeposit_SliderWnd_tokens =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Slider2Wnd",
	
		props =
		{
			name	= "ClanTokenDeposit_SliderWnd_tokens",
		},
	},
}



--
UI.ClanTokenDeposit_OkBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		
		props =
		{
			name			= "ClanTokenDeposit_OkBtn",
		},

		layers =
		{
			-- TEXT
			{
				id		= UI.MsgBox_Btn.layers.TEXT,
				text	= "^clan_iridium_deposit_wnd_exchange",
			},
		}
	}
}


--
UI.ClanTokenDeposit_CancelBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		
		props =
		{
			name			= "ClanTokenDeposit_CancelBtn",
		},

		layers =
		{
			-- TEXT
			{
				id		= UI.MsgBox_Btn.layers.TEXT,
				text	= "^buy_cancelBtn",
			},
		}
	}
}


-- -----------------------------------------------------------------
-- UI.Clans_FindWnd
-- -----------------------------------------------------------------
UI.Clans_FindWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.Clans_FindWnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "Clans_FindWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN + UI.WS_NOT_KB_REACT,
		defaultChild	= "ClanCreateWnd_EditClanNameWnd",
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
				defName				= "clan_find_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					--[[
					{
						objName		= "title",
						layer		= "UI.Clans_FindWnd.layers.TOP_TEXT",
						animParams	= UI.EffectAnimParams.ALL
					},]]
					{
						objName		= "text13",
						layer		= "UI.Clans_FindWnd.layers.CREATE_TEXT",
						animParams	= UI.EffectAnimParams.ALL
					},
					{
						objName		= "input",
						wnd			= "UI.ClansFind_InputWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_20",
						wnd			= "UI.ClansFind_SendRequestBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn",
						wnd			= "UI.ClansFind_CreateBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list",
						wnd			= "UI.ClansFind_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- CREATE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text 			= "^clan_create_info",
		},
	},
	children = { "UI.ClansFind_InputWnd", "UI.ClansFind_SendRequestBtn", "UI.ClansFind_CreateBtn", "UI.ClansFind_ListWnd" }
}

-- -----------------------------------
-- const
-- -----------------------------------
UI.Clans_FindWnd.layers = 
{
	MAIN_EFFECT 		= 0,
	CREATE_TEXT			= 1,
}
UI.Clans_FindWnd.REQUEST_TIME_OUT = 3.0

-- -----------------------------------
-- vars
-- -----------------------------------
UI.Clans_FindWnd.inited 						= false
UI.Clans_FindWnd.isRequestListInited 			= false
UI.Clans_FindWnd.requestLastTime 				= -UI.Clans_FindWnd.REQUEST_TIME_OUT
UI.Clans_FindWnd.needRequest					= false
UI.Clans_FindWnd.tryUpdate						= false
UI.Clans_FindWnd.requestId 						= nil
UI.Clans_FindWnd.data 							= {}
UI.Clans_FindWnd.waitPlayerNameRequest 			= false
UI.Clans_FindWnd.selectedWnd 					= nil

--
function UI.Clans_FindWnd:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )
	if self.waitPlayerNameRequest then
		self.waitPlayerNameRequest = false
		self.tryUpdate = true
	end
end

--
function UI.Clans_FindWnd:MasterServer_OnClanListRecruiting( result, requestId, list )
	if self:IsOnScreen() then
		if result ~= MasterServer.ClanOpResult.CLR_OK then
			local text = UI:GetStringByName( "clans_error_clan_list" )
			local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
			reason = UI:GetStringByName( errorCode )
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		end
		if self.requestId == requestId then
			self.requestId = nil
			UI.ClansFind_ListWnd:Wait( false )
			if result == MasterServer.ClanOpResult.CLR_OK then
				local restoreFocus = UI:GetKeyboardFocus() == UI.ClansFind_InputWnd:GetUiHandle()
				self.data = list
				self:ReloadCurrentList()
				if restoreFocus then
					UI:SetKeyboardFocus( UI.ClansFind_InputWnd:GetUiHandle() )
					UI.ClansFind_InputWnd:SetEditText( UI.ClansFind_InputWnd:GetEditText() )
				end
			end
		end
	end
end

--
function UI.Clans_FindWnd:MasterServer_OnClanJoinReqCreate( result, requestId, param1, param2, cid )
	if self:IsOnScreen() then
		-- месседжбокс об ошибке показывается в UI:MasterServer_OnClanJoinReqCreate()
		if result == MasterServer.ClanOpResult.CLR_OK then
			for k, v in pairs( self.data ) do
				if v.cid == cid then
					v.joinReqSent = 1
				end
			end
			self:ReloadCurrentList( true )
		end
	end
end


--
function UI.Clans_FindWnd:MasterServer_OnClanJoinReqCancel( result, requestId, param1, param2, cid )
	
	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text = UI:GetStringByName( "clans_error_cancel_request_to_clan" )
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		return
	else
		if self:IsOnScreen() then
			for k, v in pairs( self.data ) do
				if v.cid == cid then
					v.joinReqSent = 0
				end
			end
			self:ReloadCurrentList( true )
		end
	end
		
end

--
function UI.Clans_FindWnd:GetSelectedCid()
	if self.selectedData then
		return self.selectedData.cid
	end
	return nil
end

--
function UI.Clans_FindWnd:GetSelectedData()
	return self.selectedData
end

--
function UI.Clans_FindWnd:SetSelectedData( data )
	self.selectedData = data
end

--
function UI.Clans_FindWnd:SelectWnd( wnd )
	if self.selectedWnd then
		self.selectedWnd:Select( false )
	end
	self.selectedWnd = wnd
	if wnd then
		self:SetSelectedData( wnd:GetData() )
	end
	if self.selectedWnd then
		wnd:Select( true )
	end
	UI.ClansFind_SendRequestBtn:Update()
end

--
function UI.Clans_FindWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )
end


--
function UI.Clans_FindWnd:RequestNewData()
	self.requestId = nil
	self.waitPlayerNameRequest = false
	UI.ClansFind_ListWnd:Wait( true )
	local time = _G.TimerGetRealTime()
	if time - self.requestLastTime > UI.Clans_FindWnd.REQUEST_TIME_OUT then
		self.requestId = _G.MasterServer_ClanListRecruiting( UI.ClansFind_InputWnd:GetEditText() )
		self.needRequest = false
		self.requestLastTime = time
	else
		self.needRequest = true
	end
end

--
function UI.Clans_FindWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	if self.tryUpdate then
		 self.tryUpdate = false
		 self:ReloadCurrentList()
	end
	if self.needRequest then
		self:RequestNewData()
	end
end

--
function UI.Clans_FindWnd:CheckPlayerNames()
	local allCashed = true
	if self.data then
		local nickName, bCached, requestId
		for i = 1, #self.data do
			nickName, bCached, requestId = _G.MasterServer_GetNickName( self.data[ i ].leaderUid )
			if not bCached then
				allCashed = false
			end
		end
	end
	return allCashed
end

--
function UI.Clans_FindWnd:ReloadCurrentList( soft )
	if self:IsOnScreen() then
		self.waitPlayerNameRequest = false
		if not self:CheckPlayerNames() then
			self.waitPlayerNameRequest = true
		end
		if soft then
			for i = 1, UI.ClansFind_ListWnd:GetNumRecords() do
				UI.ClansFind_ListWnd:SetRecordData( UI.ClansFind_ListWnd:GetRecordData( i ), i )
			end
		else
			self:SelectWnd( nil )
			self:SetSelectedData( nil )
			UI.ClansFind_ListWnd:Clear()
			if self.data and self.data[ 1 ] then
				self:SetSelectedData( self.data[ 1 ] )
			end
			if self.data then
				for i = 1, #self.data, 2 do
					UI.ClansFind_ListWnd:AddRecord( { self.data[ i ], self.data[ i + 1 ] } )
				end
			end
		end
		UI.ClansFind_SendRequestBtn:Update()
	end
end

--
function UI.Clans_FindWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )
	if key == UI.Keys.KEY_ENTER then
		self:SetActivationOrder( -1 )
		UI:ValidateKeyboardFocus()
		return true
	end
	return false
end

--
function UI.Clans_FindWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	UI.ClansFind_ListWnd:Clear()
	if not self.inited then
		self.inited = true
		UI.ClansFind_SendRequestBtn:Update()
	end
	UI.ClansFind_InputWnd:SetEditText( "" )
	self:RequestNewData()
end

--
function UI.Clans_FindWnd:F_OnEventEditChange( hSender, eventSrc )
	local wnd = UI:GetUiObjByHandleT( hSender )
	if wnd == UI.ClansFind_InputWnd then
		if self:IsOnScreen() and eventSrc ~= UI.EVENT_SRC_UNKNOWN then
			self:RequestNewData()
		end
	end
end

--
function UI.Clans_FindWnd:RequestToCurClan()
	if UI.Clans_FindWnd:GetSelectedCid() then
		_G.MasterServer_ClanJoinReqCreate( UI.Clans_FindWnd:GetSelectedCid() )
	end
end

--
function UI.Clans_FindWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ClansFind_SendRequestBtn == wnd then
		if UI.ClansFind_SendRequestBtn:HasStyle( UI.WS_GRAYED ) then
			--UI:PlayGlobalSound( UI.sounds.invalid )
		else
			UI:PlayGlobalSound( UI.sounds.btnClick )
			self:RequestToCurClan()
		end
	elseif UI.ClansFind_CreateBtn == wnd then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.CLAN_CREATE )
	end
	return true
end

-- -----------------------------------------------------------------
-- UI.ClansFind_ListWnd
-- -----------------------------------------------------------------
UI.ClansFind_ListWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.ClansFind_ListWnd.layers = 
{
	MAIN_EFFECT 			= 0,
	LOADING_EFFECT 			= 1,
}
UI.ClansFind_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",
	props =
	{
		name			= "ClansFind_ListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},	
	layers =
	{
		firstOverlayLayer = UI.ClansFind_ListWnd.layers.LOADING_EFFECT,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			effects =
			{{
				defName				= "clan_find_list",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "loading3",
						layer		= "UI.ClansFind_ListWnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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
				defName				= "hangar_waitCircleLarge",
				defaultAnimation    = "idle",
			}}
		}
	}
}

-- -----------------------------------
-- const
-- -----------------------------------
UI.ClansFind_ListWnd.btnPrototypeName	= "ClansFindList_LineWnd"
UI.ClansFind_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}
UI.ClansFind_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.ClansFind_ListWnd.MAX_SLOTS = 3

--
function UI.ClansFind_ListWnd:Wait( b )
	self:SetLayerVisible( b, self.layers.LOADING_EFFECT )
end


--
function UI.ClansFind_ListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
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
-- UI.ClansFindList_LineWnd
-- -----------------------------------------------------------------
UI.ClansFindList_LineWnd = {}
-- ------------------------------
-- window definition
-- ------------------------------
--
UI.ClansFindList_LineWnd.layers =
{
    MAIN_EFFECT			= 0,
}

--
UI.ClansFindList_LineWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",
	props =
	{
		name			= "ClansFindList_LineWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "clan_find_list_line",
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

UI.ClansFindList_LineWnd.slot1Wnd = nil
UI.ClansFindList_LineWnd.slot1Wnd = nil

--
function UI.ClansFindList_LineWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.slot1Wnd = UI:CreateChildWnd( self, UI.ClansFindListLine_SlotWnd, "1" )
	self.slot2Wnd = UI:CreateChildWnd( self, UI.ClansFindListLine_SlotWnd, "2" )
	local mailEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.slot1Wnd, mailEffect, "slot_1", UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.slot2Wnd, mailEffect, "slot_2", UI.EffectAnimParams.POS )
end

--
function UI.ClansFindList_LineWnd:UpdateForData( data, bAnimated )
	self.slot1Wnd:UpdateForData( data[ 1 ] )
	UI:AddChildAndLink( self, self.slot2Wnd, mailEffect, "slot_2", UI.EffectAnimParams.POS )
	if data[ 2 ] then
		self.slot2Wnd:UpdateForData( data[ 2 ] )
	else
		self.slot2Wnd:UnlinkFromParent()
	end
end

-- -----------------------------------------------------------------
-- UI.ClansFindListLine_SlotWnd
-- -----------------------------------------------------------------
UI.ClansFindListLine_SlotWnd = {}
-- ------------------------------
-- window definition
-- ------------------------------
--
UI.ClansFindListLine_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME_TEXT 			= 1,
    MEMBERS_TEXT 		= 2,
    LEADER_TEXT 		= 3,
    DESC_TEXT 			= 4,
    DISABLE_TEXT  		= 5,
}

--
UI.ClansFindListLine_SlotWnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "ClansFindListLine_SlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "clan_find_list_line_slot",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title22",
						layer 		= UI.ClansFindListLine_SlotWnd.layers.NAME_TEXT,
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "teg",
						layer 		= UI.ClansFindListLine_SlotWnd.layers.MEMBERS_TEXT,
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text11",
						layer 		= UI.ClansFindListLine_SlotWnd.layers.LEADER_TEXT,
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text14",
						layer 		= UI.ClansFindListLine_SlotWnd.layers.DISABLE_TEXT,
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "description",
						layer 		= UI.ClansFindListLine_SlotWnd.layers.DESC_TEXT,
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- MEMBERS_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- LEADER_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- DESC_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- DISABLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text 			= "^clans_find_request_sended"
		},
	}
}

--
UI.ClansFindListLine_SlotWnd.clanEmblemWnd = nil
UI.ClansFindListLine_SlotWnd.mailBtn = nil
UI.ClansFindListLine_SlotWnd.selected = false
UI.ClansFindListLine_SlotWnd.bDisabled = false
UI.ClansFindListLine_SlotWnd.disableEffect = nil
UI.ClansFindListLine_SlotWnd.descWnd = nil

--
function UI.ClansFindListLine_SlotWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.clanEmblemWnd = UI:CreateChildWnd( self, UI.GameplayMapGalaxyClanOwner )
	self.clanEmblemWnd:SetAnim( "idle" )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.clanEmblemWnd, mainEffect, "clan_ico", UI.EffectAnimParams.POS )
	self.mailBtn = UI:CreateChildWnd( self, UI.ClansFindListLineSlot_MailBtn )
	self.descWnd = UI:CreateChildWnd( self, UI.ClansFindListLineSlot_DescWnd )
	local descSize = mainEffect:GetObjSize( "description" )
	local font = self:GetFont( self.layers.DESC_TEXT )
	self.descWnd:Init( descSize, font )
	self.disableEffect = _G.UI_SpawnEffect( "gameplay_map_pve_element_mission", self:GetUiHandle() )
	self.disableEffect:StartAnimation( "tick_over" )
end

--
function UI.ClansFindListLine_SlotWnd:F_Shutdown()
	if self.disableEffect then
		_G.UI_DestroyEffect( self.disableEffect )
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.ClansFindListLine_SlotWnd:Select( b )
	self.selected = b
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if b then 
		mainEffect:StartAnimation( "select" )
	else
		mainEffect:StartAnimation( "idle" )
	end
end

--
function UI.ClansFindListLine_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self.selected then 

	else
		if not self.bDisabled then
			if not self.skipOverSound then
				UI:PlayGlobalSound( UI.sounds.btnMouseOver )
			else
				self.skipOverSound = false
			end
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			mainEffect:StartAnimation( "over" )
		end
	end
	return true
end

--
function UI.ClansFindListLine_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	if self.selected then 

	else
		if not self.bDisabled then
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			mainEffect:StartAnimation( "idle" )
		end
	end
	return true
end

--
function UI.ClansFindListLine_SlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if not self.bDisabled then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		UI.Clans_FindWnd:SelectWnd( self )
	end
	return true
end


--
function UI.ClansFindListLine_SlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if not self.bDisabled then
		UI.Clans_FindWnd:SelectWnd( self )
	end
	UI.ContextMenu:Clear()
	UI.ContextMenu:SetName( UI:FormatClanName( self.data.name, self.data.tag ) )
	UI:FillContextMenuForClan( UI.ContextMenuType.CLAN, self.data.cid, self.data )
	UI.ContextMenu:Show( mouseX, mouseY )
	return true
end

--
function UI.ClansFindListLine_SlotWnd:GetData()
	return self.data
end

--
function UI.ClansFindListLine_SlotWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateEffects()
end

--
function UI.ClansFindListLine_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.ClansFindListLine_SlotWnd:UpdateEffects()
	if self.bDisabled and self.disableEffect then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		local pos = mainEffect:GetObjPos( "exclamatory" )
		local size = mainEffect:GetObjSize( "exclamatory" )
		local textPos = mainEffect:GetObjPos( "text14" )
		local textSize = mainEffect:GetObjSize( "text14" )
		local textCenter = ( textPos.x + ( textSize.x / 2 ) )
		local space = size.x - ( pos.x + size.x )
		local realTextSize = _G.MeasureText(
	   		UI:GetStringByName( "clans_find_request_sended" ),
	   		self:GetFont( self.layers.DISABLE_TEXT ),
	   		UI:Quat( 0, 0, 10000, 10000 ),
	   		self:GetTextFormatFlags( self.layers.DISABLE_TEXT ) + FONT.TF_NOCLIP,
	   		UI:Quat( 0, 0, 10000, 10000 ) )
		local halfTextWidth = realTextSize.z / 2
		local realTextLeft = textCenter - halfTextWidth
		local effectLeft = textCenter - halfTextWidth - space - ( self.disableEffect:GetObjSize( "self137" ).x * 2 )
		self.disableEffect:SetPos( UI:Vec2( effectLeft, pos.y ) )
	end
	if self.data then
		--self:AddChild( self.mailBtn )
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.mailBtn, mainEffect, "btn_8", UI.EffectAnimParams.ALPHA )
		local pos = mainEffect:GetObjPos( "btn_8" )
		self.mailBtn:SetTop( pos.y )
		local textPos = mainEffect:GetObjPos( "text11" ).x
		local textEnd = textPos + mainEffect:GetObjSize( "text11" ).x
		local space = pos.x - textEnd
		local leader = UI:GetStringByName( "clans_find_clan_leader" )
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.data.leaderUid )
		leader = string.gsub( leader, "%$nickname%$", nickName )
		local realTextSize = _G.MeasureText(
	   		leader,
	   		self:GetFont( self.layers.LEADER_TEXT ),
	   		UI:Quat( 0, 0, 10000, 10000 ),
	   		self:GetTextFormatFlags( self.layers.LEADER_TEXT ),
	   		UI:Quat( 0, 0, 10000, 10000 ) )
		local realPos = textPos + realTextSize.z + space
		self.mailBtn:SetLeft( realPos )

		self:AddChild( self.descWnd )
		local pos = mainEffect:GetObjPos( "description" )
		self.descWnd:SetLeft( pos.x )
		self.descWnd:SetTop( pos.y )
	else
		self.mailBtn:UnlinkFromParent()
		self.descWnd:UnlinkFromParent()
	end
end

--
function UI.ClansFindListLine_SlotWnd:GetData()
	return self.data
end

--
function UI.ClansFindListLine_SlotWnd:UpdateForData( data, bAnimated )
	if self.data and self.data.cid == UI.Clans_FindWnd:GetSelectedCid() then
		UI.Clans_FindWnd:SelectWnd( nil )
	end
	self.data = data
	local clanName = UI:FormatClanName( data.name, data.tag )
	local selfRect = self:GetLayerRect( self.layers.NAME_TEXT )
	clanName = UI:GetCutTextWithEllipses( clanName, selfRect.z, self:GetFont( self.layers.NAME_TEXT ) )
	self:SetText( clanName, self.layers.NAME_TEXT )
	local members = UI:GetStringByName( "clans_find_clan_members" )
	members = string.gsub( members, "%$count%$", data.numMembers )
	self:SetText( members, self.layers.MEMBERS_TEXT )

	self.clanEmblemWnd:SetEmblem( data.emblem, self )

	local leader = UI:GetStringByName( "clans_find_clan_leader" )
	local nickName, bCached, requestId = _G.MasterServer_GetNickName( data.leaderUid )
	leader = string.gsub( leader, "%$nickname%$", nickName )
	self:SetText( leader, self.layers.LEADER_TEXT )

	self.descWnd:Update( data.desc )

	self.bDisabled = false
	if self.data and UI:IsTrueEx( self.data.joinReqSent ) then
		self.bDisabled = true
		if UI.Clans_FindWnd:GetSelectedCid() == self.data.cid then
			UI.Clans_FindWnd:SelectWnd( nil )
		end
	end

	if not self.bDisabled then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		mainEffect:StartAnimation( "idle" )
		if self.data.cid == UI.Clans_FindWnd:GetSelectedCid() then
			UI.Clans_FindWnd:SelectWnd( self )
		end
		local effectsPool = self:GetEffectsPool( 0 )
		effectsPool:RemoveEffect( self.disableEffect )
		self.mailBtn:RemoveStyle( UI.WS_DISABLE )
	else
		self.mailBtn:AddStyle( UI.WS_DISABLE )
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		mainEffect:StartAnimation( "desable" )
		local effectsPool = self:GetEffectsPool( 0 )
		effectsPool:PushEffect( self.disableEffect )
	end

	self:UpdateEffects()
end


-- -----------------------------------------------------------------
-- UI.ClansFindListLineSlot_DescWnd
-- -----------------------------------------------------------------
--
UI.ClansFindListLineSlot_DescWnd = {}
-- ------------------------------
-- window definition
-- ------------------------------
--
UI.ClansFindListLineSlot_DescWnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "ClansFindListLineSlot_DescWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype 	= true
	},
	layers =
	{
		-- MESSAGE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK--[[ + FONT.TF_IGNORE_FORMAT_SYMBOLS]],
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	}
}

UI.ClansFindListLineSlot_DescWnd.layers = 
{
	MESSAGE_TEXT			= 0,
}

UI.ClansFindListLineSlot_DescWnd.overloaded = false
UI.ClansFindListLineSlot_DescWnd.text = ""

UI.ClansFindListLineSlot_DescWnd.GetTooltipData = function( self )
	if self.overloaded then
		return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				text = self.text,
				caption = UI:GetStringByName( "tooltip_clan_find_desc_caption" )
			}
		end
	end


--
function UI.ClansFindListLineSlot_DescWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	self:GetParent().skipOverSound = true
	return false
end

--
function UI.ClansFindListLineSlot_DescWnd:Init( size, font )
	self:SetWidth( size.x )
	self:SetHeight( size.y )
	self:SetLayerRect( UI:Quat( 0, 0, size.x, size.y ), self.layers.MESSAGE_TEXT )
	self:SetFont( font, self.layers.MESSAGE_TEXT )
end

--
function UI.ClansFindListLineSlot_DescWnd:Update( text )
	if text ~= "" then
		text = UI:Ut8ValidateLastSymbol( text )
		text = string.gsub( text, "\n" , "|" )
	end
	self.text = text
	self:SetText( text, self.layers.MESSAGE_TEXT )
	--text = UI:Ut8ValidateLastSymbol( text )
	local selfRect = self:GetLayerRect( self.layers.MESSAGE_TEXT )
	local stringsNumber = _G.GetStringsNumber( text,
		self:GetFont( self.layers.MESSAGE_TEXT ),
		self:GetLayerRect( self.layers.MESSAGE_TEXT ),
		self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ),
		self:GetLayerRect( self.layers.MESSAGE_TEXT ) )
	if stringsNumber > 3 then
		self.overloaded = true
	else
		self.overloaded = false
	end
	--[[if text ~= "" then
		text = UI:Ut8ValidateLastSymbol( text )
		text = string.gsub( text, "\n" , " " )
	end
	str = string.gsub( str, "%$text%$", text )
	local selfRect = self:GetLayerRect( self.layers.MESSAGE_TEXT )
	local rect = _G.MeasureText(
   		text,
   		self:GetFont( self.layers.MESSAGE_TEXT ),
   		UI:Quat( 0, 0, 10000, 10000 ),
   		self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ) + FONT.TF_NOCLIP,
   		UI:Quat( 0, 0, 10000, 10000 ) )
	if rect.z > selfRect.z then
		local addStr = "..."
		local temp = UI:Quat( 0, 0, 10000, 10000 )
		local lastVisible = _G.GetLastVisibleCharIdForString( str, 0, self:GetFont( self.layers.MESSAGE_TEXT ), selfRect, self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ), selfRect )
		local addWidth = _G.MeasureText( addStr, _G.GetFontSymbolHeight( self:GetFont( self.layers.MESSAGE_TEXT ) ), temp, self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ) + FONT.TF_NOCLIP, temp ).z
		for i = lastVisible, 0, -1 do
			local width = _G.GetSubstringRect( UI:Substr( str, 1, i + 1 ), 0, i, self:GetFont( self.layers.MESSAGE_TEXT ), temp, self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ) + FONT.TF_NOCLIP, temp ).z + addWidth
			if width < selfRect.z then
				local cutText = UI:Substr( str, 1, i + 1 )
				str = cutText..addStr
				break
			end
		end
		self:SetWidth( selfRect.z )
	else
		self:SetWidth( rect.z + 5 )
	end
	self:SetText( str, self.layers.MESSAGE_TEXT )]]
end


-- ------------------------------------------------------------------------
-- UI.ClansFindListLineSlot_MailBtn
-- ------------------------------------------------------------------------
UI.ClansFindListLineSlot_MailBtn = {}
-- -------------------------------------
-- window definition
-- -------------------------------------
UI.ClansFindListLineSlot_MailBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	props =
	{
		name		= "ClansFindListLineSlot_MailBtn",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
				defName 			= "clan_find_list_line_slot_mail",
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

--
function UI.ClansFindListLineSlot_MailBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	local data = self:GetParent():GetData()
	if data and data.leaderUid then
		UI:CreateNewLetter( data.leaderUid )
	end
	return true
end

--
function UI.ClansFindListLineSlot_MailBtn:GetTooltipData()
	return 
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetStringByName( "tooltip_clan_find_mail_to_leader_text" ),
		caption 	= UI:GetStringByName( "tooltip_clan_find_mail_to_leader_caption" )
	}
end

-- -------------------------------------
-- const
-- -------------------------------------
--
UI.ClansFindListLineSlot_MailBtn.layers =
{
	MAIN_EFFECT				= 0,
}
--
UI.ClansFindListLineSlot_MailBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "idle",
	},
}


-- ------------------------------------------------------------------------
-- UI.ClansFind_InputWnd
-- ------------------------------------------------------------------------

UI.ClansFind_InputWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",
     	props =
     	{
     		name			= "ClansFind_InputWnd",
     		symbolsLimit 	= UI.ClanCreateWnd.MaxClanNameLength,
     		activationOrder	= 0,
     	},
     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "clan_find_input",
    				defaultAnimation    = "idle_f",

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
    		animActive				= "select_f",
    		animInactive			= "idle_f",
    	}
    }
}

-- -----------------------------------------------------------------
-- UI.ClansFind_SendRequestBtn
-- -----------------------------------------------------------------
UI.ClansFind_SendRequestBtn = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
--
UI.ClansFind_SendRequestBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		props =
		{
			name		= "ClansFind_SendRequestBtn",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			selectSound	= nil,
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
					defName				= "big_button_6",
					defaultAnimation    = "idle",
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						{
							objName		= "text",
							layer		= "UI.MsgBox_Btn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
						},
					}
				}}
			},
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^clans_send_request",
   			},
   		}
	},
}
UI.ClansFind_SendRequestBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
	},
}

--
function UI.ClansFind_SendRequestBtn:Update()
	local data = UI.Clans_FindWnd:GetSelectedData()
	if data == nil then
		self:AddStyle( UI.WS_GRAYED )
		return
	else
		if UI:IsTrueEx( data.joinReqSent ) then
			self:AddStyle( UI.WS_GRAYED )
			return
		end
	end
	self:RemoveStyle( UI.WS_GRAYED )
	--local wnd = UI.Clans_FindWnd:GetSelectedWnd()
	--if wnd and wnd:GetData()
end

--
function UI.ClansFind_SendRequestBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if not self:HasStyle( UI.WS_GRAYED ) then
		UI:PlayGlobalSound( UI.MsgBox.sounds.btnMouseOver )
	end

	return true

end

-- -----------------------------------------------------------------
-- UI.ClansFind_CreateBtn
-- -----------------------------------------------------------------
UI.ClansFind_CreateBtn = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
--
local l_baseBtnNumLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )
UI.ClansFind_CreateBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	props =
	{
		name		= "ClansFind_CreateBtn",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},		
	layers =
	{
		numLayers = l_baseBtnNumLayers + 1,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			
			main		= true,
			effects =
			{{
				defName 			= "clan_find_create_btn",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title_gold",
						layer		= "UI.ClansFind_CreateBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},
		-- TEXT
		{
			id			= l_baseBtnNumLayers,
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^clans_create"
		},

	},
}

--
UI.ClansFind_CreateBtn.layers = 
{
	MAIN_EFFECT				= 0,
	TEMP					= 1,
	TEXT					= 2,
}

--
UI.ClansFind_CreateBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "select",
		animationDisabled	= "disable",
	},
}

--
function UI.ClansFind_CreateBtn:GetTooltipData()
	return 
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetStringByName( "tooltip_clan_create_text" ),
		caption 	= UI:GetStringByName( "tooltip_clan_create_caption" )
	}
end

--
function UI.ClansFind_CreateBtn:Enable( bEnable )
	local isEnalbed = self:IsEnabled()
	if isEnalbed == bEnable then
		return
	end
	if bEnable then
		self:RemoveStyle( UI.WS_GRAYED )
	else
		self:AddStyle( UI.WS_GRAYED )
	end
end

--
function UI.ClansFind_CreateBtn:IsEnabled()
	return not self:HasStyle( UI.WS_GRAYED )
end