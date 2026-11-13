-- ----------------------------------------------------------------------------
--
-- Workfile: profile_achievementswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- ------------------------------
-- ProfileTitles_Wnd
-- ------------------------------

UI.ProfileTitles_Wnd = {}

UI.ProfileTitles_Wnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "ProfileTitles_Wnd",
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
				defName 			= "profile_titles_win",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title_list",	
						wnd			= "UI.ProfileTitles_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title_info",	
						wnd			= "UI.ProfileTitles_TitleExampleWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title_info",	
						wnd			= "UI.ProfileTitles_MottoExampleWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.ProfileTitles_ListWnd", "UI.ProfileTitles_TitleExampleWnd", "UI.ProfileTitles_MottoExampleWnd" },
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ProfileTitles_Wnd:ShowTitle( titleId )

	if not self:IsOnScreen() then
		sys.log( "UI.ProfileTitles_Wnd:ShowTitle()[ERROR]: not on screen" )
		return
	end
	
	if self.mode ~= self.Modes.TITLES then
		sys.log( "UI.ProfileTitles_Wnd:ShowTitle()[ERROR]: not in TITLES mode" )
		return
	end
	
	if type( titleId ) ~= "number" then
		sys.log( "UI.ProfileTitles_Wnd:ShowTitle()[ERROR]: invalid type of the 1-st parameter ('titleId'); 'number' expected, got '%s'", type( titleId ) )
		return
	end
	
	local titleName = UI:Val2Key( _G.PlayerTitleId, titleId )
	if titleName == "" then
		sys.log( "UI.ProfileTitles_Wnd:ShowTitle()[ERROR]: invalid titleId %d", titleId )
		return
	end
	
	local selRecordIdx = -1
	for recordIdx = 1, UI.ProfileTitles_ListWnd:GetNumRecords() do
		if UI.ProfileTitles_ListWnd:GetRecordData( recordIdx ) == titleName then
			selRecordIdx = recordIdx
			break
		end
	end
	
	if selRecordIdx == -1 then
		sys.log( "UI.ProfileTitles_Wnd:ShowTitle()[ERROR]: cannot find record for title %d(%s)", titleId, titleName )
		return
	end
	
	UI.ProfileTitles_ListWnd:SelectRecord( selRecordIdx )
	UI.ProfileTitles_ListWnd:SetScrollPos( selRecordIdx )

end


--
function UI.ProfileTitles_Wnd:MasterServer_OnTitlesSetActive( result, requestId )
	--if self:IsOnScreen() then
		if self.requestId == requestId then
			if result ~= 0 then
				local text = UI:GetStringByName( "error_title_change" )
				local reason = UI:GetStringByName( UI:Val2Key( TitlesOpResult, result ) )
				UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
			end
			self.requestId = nil
			self:ShowWait( false, true )
			UI.ProfileTitles_TitleExampleWnd:UpdateLayout()
		end
		self:ReloadTitlesList( true )
	--end
end

--
function UI.ProfileTitles_Wnd:ShowWait( b, simple )
	UI.Profile_Wnd:ShowWait( b )
	if not simple then
		if b then
			UI.ProfileTitles_TitleExampleWnd:UnlinkFromParent()
			UI.ProfileTitles_MottoExampleWnd:UnlinkFromParent()
			UI.ProfileTitles_ListWnd:UnlinkFromParent()
		else
			self:AddChild( UI.ProfileTitles_ListWnd )
			if self.mode == self.Modes.TITLES then
				self:AddChild( UI.ProfileTitles_TitleExampleWnd )
				UI.ProfileTitles_MottoExampleWnd:UnlinkFromParent()
			else
				UI.ProfileTitles_TitleExampleWnd:UnlinkFromParent()
				self:AddChild( UI.ProfileTitles_MottoExampleWnd )
			end
		end
	end
end

--
function UI.ProfileTitles_Wnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	if requestId == self.requestId then
		if result ~= 0 then
			-- TODO: error handling
		else
			self:InternalUpdate()
		end
		self:ShowWait( false )
		self.requestId = nil
	end
end

--
function UI.ProfileTitles_Wnd:GetMode()
	return self.mode
end

--
function UI.ProfileTitles_Wnd:SetMode( mode )
	if self.mode == mode then
		return
	end
	self.mode = mode
end

--
function UI.ProfileTitles_Wnd:Update( uid )
	if not self.inited then
		self:Init()
	end
	self.uid = uid
	if uid ~= UI.INVALID_U64_ID then
		local requestId = nil
		if self:GetMode() == self.Modes.TITLES then
			requestId = UI.Profile:RequestTitles( uid )
		else
			requestId = UI.Profile:RequestMottos( uid )
		end
		if requestId then
			self.requestId = requestId
		end
		if requestId == nil then
			-- looks like allready loaded
			self:ShowWait( false )
			self:InternalUpdate()
		else
			-- async wait
			self:ShowWait( true )
		end
	end
end

--
function UI.ProfileTitles_Wnd:SelectTitle( data )
	self.currentData = data
	UI.ProfileTitles_TitleExampleWnd:Setup( data )
end

--
function UI.ProfileTitles_Wnd:GetSelectedData()
	return self.currentData
end

--
function UI.ProfileTitles_Wnd:SelectMotto( data )
	self.currentData = data
	UI.ProfileTitles_MottoExampleWnd:Setup( data )
end

--
function UI.ProfileTitles_Wnd:GetUid()
	return self.uid
end

--
function UI.ProfileTitles_Wnd:MasterServer_OnMottosSetActive( retCode, requestId )
	if requestId == self.requestId then
		self.requestId = nil
		self:ShowWait( false, true )
	end
	if retCode == 0 then
		if self.mode == self.Modes.MOTTOS then
			if self:IsOnScreen() then
				self:ReloadMottosList( true )
				UI.ProfileTitles_MottoExampleWnd:UpdateLayout()
			end
		end
	else
		local reason = UI:Val2Key( MasterServer.TitlesOpResult, retCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_error_cant_set_motto" )..UI:GetStringByName( reason ), UI.MBS_OK )
	end
end

--
function UI.ProfileTitles_Wnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId ~= 0 and requestId == self.requestId then

    	if result == _G.GameStore.StoreBuyResult.SBR_OK then
    		if self.mode == self.Modes.MOTTOS then
    			if self:IsOnScreen() then
    				self:ReloadMottosList( true )
    			end
    			local shopItem = UI:GetShopItemById( param1 )
    			self.requestId = _G.MasterServer_MottosSetActive( shopItem.defName )
    		end
    	else
    		UI.ShopWnd:ShowBuyErrorMsg( result )
    		self.requestId = nil
    		self:ShowWait( false, true )
    	end

	end

end

--
function UI.ProfileTitles_Wnd:OnBuyWndResult( result, mode )
	if result == true then
		local mottoDef = self:GetSelectedData().defName
		if mottoDef then
			local price, bGold = UI:GetShopBuyPriceByDef( mottoDef, false, false )
			local priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
			self.requestId = _G.GameStore_Buy( UI:GetDef( mottoDef ).storeItemId, 1, priceType )
			self:ShowWait( true, true )
		end
	end
end


--
function UI.ProfileTitles_Wnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if UI.ProfileChangeAvatar_ByuWnd.mainWndName == "ProfileTitles_Wnd" then
		UI.ProfileChangeAvatar_ByuWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ProfileTitles_Wnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if UI.ProfileChangeAvatar_ByuWnd.mainWndName == "ProfileTitles_Wnd" then
		UI.ProfileChangeAvatar_ByuWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ProfileTitles_Wnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if UI.ProfileChangeAvatar_ByuWnd.mainWndName == "ProfileTitles_Wnd" then
		UI.ProfileChangeAvatar_ByuWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


-- -----------------------------------
-- const
-- -----------------------------------
--
UI.ProfileTitles_Wnd.layers = 
{
	MAIN_EFFECT				= 0,
}

--
UI.ProfileTitles_Wnd.Modes = 
{
	TITLES 					= 1,
	MOTTOS 					= 2,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ProfileTitles_Wnd.mode 								= UI.ProfileTitles_Wnd.Modes.TITLES
UI.ProfileTitles_Wnd.currentData 						= nil
UI.ProfileTitles_Wnd.uid 								= UI.INVALID_U64_ID

UI.ProfileTitles_Wnd.sounds =
{
	itemsScrollRange			= "sound/ui/btnMouseOver",
	click						= UI.sounds.btnClick,			
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ProfileTitles_Wnd:InternalUpdate()
	if self.mode == self.Modes.TITLES then
		self:ReloadTitlesList()
	else
		self:ReloadMottosList()
	end
end

--
function UI.ProfileTitles_Wnd:ReloadMottosList( soft )
	local srcItems = UI.serverData.shopByDef
	local selRec = 1
	if not soft then
		UI.ProfileTitles_ListWnd:Clear()
		self.currentData = UI.Profile:GetCurrentMotto( self:GetUid() )
	end

	local function Compare( item1, item2 )
		local bCustom1 = UI:IsMottoCustom( item1.defName )
		local bCustom2 = UI:IsMottoCustom( item2.defName )
		if bCustom1 or bCustom2 then
			if bCustom1 and bCustom2 then
				return item1.defName < item2.defName
			else
				return bCustom1
			end
		end
		local hot1 = UI:IsItemHot( item1 )
		local hot2 = UI:IsItemHot( item2 )
		if hot1 or hot2 then
			if hot1 and hot2 then
				return item1.defName < item2.defName
			else
				return hot1
			end
		end
		return item1.defName < item2.defName
	end

	local data = {}
	for k, v in pairs( srcItems ) do
		if UI:IsDefMotto( v.defName ) and ( not UI:CantItemBeBought( v ) or UI.Profile:IsMottoUnlocked( _G.MasterServer_GetLocalUserId(), v.defName ) )then
			if UI:IsMottoCustom( v.defName ) then
				if UI:IsCustomMottoExist( v.defName ) then
					table.insert( data, v )
				end
			else
				table.insert( data, v )
			end
		end
	end
	table.sort( data, Compare )

	local recordIds = 0
	for k, v in pairs( data ) do
		recordIds = recordIds + 1
		if soft then
			UI.ProfileTitles_ListWnd:SetRecordData( v, recordIds )
		else
			UI.ProfileTitles_ListWnd:AddRecord( v )
		end
		if not soft then
			if v.defName == self.currentData then
				selRec = recordIds
			end
		end
	end
	if not soft then
		UI.ProfileTitles_ListWnd:SelectRecord( selRec, false )
	end
end

--
function UI.ProfileTitles_Wnd:ReloadTitlesList( soft )
	local selRec = 1
	if not soft then
		UI.ProfileTitles_ListWnd:Clear()
		self.currentData = UI:Val2Key( PlayerTitleId, UI.Profile:GetCurrentTitle( self:GetUid() ) )
	end
	local recordIds = 0

	local titles = {}

	for titleName, titleId in pairs( _G.PlayerTitleId ) do

		if titleId ~= _G.PlayerTitleId.NO_TITLE then

			if not _G.Titles[ titleId ].hiden or UI.Profile:IsTitleUnlocked( titleId, self.uid ) then

				local titleData =
				{
					name				= titleName,
					localizedName_lower	= _G.Utf8CaseFold_Transform( UI:Title2Str( titleId ) ),
				}

				table.insert( titles, titleData )

			end

		end

	end

	local function l_fnSort( title1, title2 )
		return title1.localizedName_lower < title2.localizedName_lower
	end

	table.sort( titles, l_fnSort )

	for idx, titleData in ipairs( titles ) do
		recordIds = recordIds + 1
		if soft then
			UI.ProfileTitles_ListWnd:SetRecordData( titleData.name, recordIds )
		else
			UI.ProfileTitles_ListWnd:AddRecord( titleData.name )
		end
		
		if not soft then
			if titleData.name == self.currentData then
				selRec = recordIds
			end
		end
	end
	if not soft then
		UI.ProfileTitles_ListWnd:SelectRecord( selRec, false )
	end
end

--
function UI.ProfileTitles_Wnd:ApplyTitle()
	if self.requestId == nil then
		UI:PlayGlobalSound( self.sounds.click )
		if UI.Profile:GetCurrentTitle( self.uid ) == PlayerTitleId[ self.currentData ] then
			self.requestId = _G.MasterServer_TitlesSetActive( PlayerTitleId.NO_TITLE )
		else
			self.requestId = _G.MasterServer_TitlesSetActive( PlayerTitleId[ self.currentData ] )
		end
		UI.Profile_Wnd:ShowWait( true, true )
	end
end

--
function UI.ProfileTitles_Wnd:ApplyMotto()
	if self.requestId == nil then
		UI:PlayGlobalSound( self.sounds.click )
		if UI.Profile:GetCurrentMotto( self.uid ) == self:GetSelectedData().defName then
			self.requestId = _G.MasterServer_MottosSetActive( "" )
		else
			self.requestId = _G.MasterServer_MottosSetActive( self:GetSelectedData().defName )
		end
		UI.Profile_Wnd:ShowWait( true, true )
	end
end

--
function UI.ProfileTitles_Wnd:BuyMotto()
	UI:PlayGlobalSound( self.sounds.click )
	if self.requestId == nil then
		UI.ProfileChangeAvatar_ByuWnd.mainWndName = "ProfileTitles_Wnd"
		UI.ProfileChangeAvatar_ByuWnd:Setup( UI.ProfileChangeAvatar_ByuWnd.modes.MOTTO )
		UI.ProfileChangeAvatar_ByuWnd:Show()
	end
end

--
function UI.ProfileTitles_Wnd:OnOk()
	if UI.ProfileTitles_Wnd:GetMode() == UI.ProfileTitles_Wnd.Modes.TITLES then
		if UI.ProfileTitles_Wnd:GetUid() == _G.MasterServer_GetLocalUserId() and UI.Profile:IsTitleUnlocked( PlayerTitleId[ self:GetSelectedData() ], UI.ProfileTitles_Wnd:GetUid() ) then
			UI.ProfileTitles_Wnd:ApplyTitle()
		end
	else
		local mottoDef = self:GetSelectedData().defName
		if mottoDef then
			if UI.ProfileTitles_Wnd:GetUid() == _G.MasterServer_GetLocalUserId() then
				if UI.Profile:IsMottoUnlocked( _G.MasterServer_GetLocalUserId(), mottoDef ) then
					UI.ProfileTitles_Wnd:ApplyMotto()
				else
					UI.ProfileTitles_Wnd:BuyMotto()
				end
			end
		end
	end
end

--
function UI.ProfileTitles_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ProfileTitles_ToogleBtn == wnd then
		self:ApplyTitle()
	end
	return true
end

--
function UI.ProfileTitles_Wnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if not self:IsOnScreen() then
		return false
	end
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == UI.ProfileTitles_ListWnd then
		local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = UI.ProfileTitles_ListWnd:GetVisibleRange()
		UI.ProfileTitles_ListWnd:ScrollVisibleRange( ticks < 0 )
		local firstVisibleRecordIdx, lastVisibleRecordIdx = UI.ProfileTitles_ListWnd:GetVisibleRange()
		if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
			UI:PlayGlobalSound( self.sounds.itemsScrollRange )
		end
	end
	return true
end


--
function UI.ProfileTitles_Wnd:OnAccountAurasChanged()

	for recordIdx = 1, UI.ProfileTitles_ListWnd:GetNumRecords() do

		local slotWnd = UI.ProfileTitles_ListWnd:GetButtonForRecord()
		if slotWnd then
			slotWnd:UpdateForData( UI.ProfileTitles_ListWnd:GetRecordData( recordIdx ) )
		end

	end

end


-- -----------------------------------------------------------------
-- UI.ProfileTitles_ListWnd
-- -----------------------------------------------------------------

UI.ProfileTitles_ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ProfileTitles_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "ProfileTitles_ListWnd",
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
				defName				= "profile_titles_list",
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
function UI.ProfileTitles_ListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	
	UI.ProfileTitles_ListWnd:ScrollVisibleRange( ticks < 0 )
	return true
end

-- -----------------------------------
-- const
-- -----------------------------------

UI.ProfileTitles_ListWnd.btnPrototypeName	= "ProfileTitlesList_SlotWnd"

UI.ProfileTitles_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll_max",
	}
}

UI.ProfileTitles_ListWnd.sounds =
{
	click	= UI.sounds.btnClick,
	over	= UI.sounds.btnMouseOver,
}

UI.ProfileTitles_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.ProfileTitles_ListWnd.MAX_SLOTS = 13


-- -----------------------------------------------------------------
-- UI.ProfileTitlesList_SlotWnd
-- -----------------------------------------------------------------

UI.ProfileTitlesList_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------


--
UI.ProfileTitlesList_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "ProfileTitlesList_SlotWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName				= "profile_titles_list_slot",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "value",
						layer		= "UI.ProfileTitlesList_SlotWnd.layers.NAME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "value25",
						layer		= "UI.ProfileTitlesList_SlotWnd.layers.PRICE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "lock",
						layer		= "UI.ProfileTitlesList_SlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "sale",
						layer		= "UI.ProfileTitlesList_SlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "over",
						layer		= "UI.ProfileTitlesList_SlotWnd.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- PRICE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Medium" },
		},
		-- LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "itemIco_lock",
				defaultAnimation    = "idle",
			}}
		},
		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "profile_titles_list_slot_over",
				defaultAnimation    = "idle",
			}}
		},
		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "shop_categories_slot_sale",
				defaultAnimation    = "idle",
			}}
		},
	}
}


-- ------------------------------
-- interface functions
-- ------------------------------


-- -----------------------------------
-- const
-- -----------------------------------

--
UI.ProfileTitlesList_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME_TEXT			= 1,
    PRICE_TEXT 			= 2,
    LOCK_EFFECT			= 3,
    OVER_EFFECT			= 4,
    SALE_EFFECT 		= 5,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ProfileTitlesList_SlotWnd.current = false
UI.ProfileTitlesList_SlotWnd.isSelect = false
UI.ProfileTitlesList_SlotWnd.isOver	= false
UI.ProfileTitlesList_SlotWnd.data = ""
UI.ProfileTitlesList_SlotWnd.metaText = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ProfileTitlesList_SlotWnd:GetTooltipData()

	if UI.ProfileTitles_Wnd:GetMode() == UI.ProfileTitles_Wnd.Modes.MOTTOS then
		return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				caption = UI:GetStringByName( "tooltip_motto_caption" ),
				text = UI:GetMottoString( self:GetRecordData().defName ),
			}
	end

end

--
function UI.ProfileTitlesList_SlotWnd:UpdateForData( data, bAnimated )
	self.metaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.SALE_EFFECT )
	if data == UI.ProfileTitles_Wnd:GetSelectedData() then
		self.isSelect = true
	else
		self.isSelect = false
	end
	if UI.ProfileTitles_Wnd:GetMode() == UI.ProfileTitles_Wnd.Modes.TITLES then
		self.data = data
		self:SetText( UI:GetStringByName( "title_"..data.."_name" ), self.layers.NAME_TEXT )
		if UI.Profile:GetCurrentTitle( UI.ProfileTitles_Wnd:GetUid() ) == PlayerTitleId[ data ] then
			self.current = true
		else
			self.current = false
		end
		if UI.Profile:IsTitleUnlocked( PlayerTitleId[ data ], UI.ProfileTitles_Wnd:GetUid() ) then
			self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
		else
			self:SetLayerVisible( true, self.layers.LOCK_EFFECT )
		end
		self:UpdateAnim()
	else
		self.data = data
		local mottoText = UI:GetMottoString( data.defName )
		local selfRect = self:GetLayerRect( self.layers.NAME_TEXT )
		mottoText = UI:GetCutTextWithEllipses( mottoText, selfRect.z, self:GetFont( self.layers.NAME_TEXT ) )
		self:SetText( mottoText, self.layers.NAME_TEXT )
		self.current = UI.Profile:GetCurrentMotto( UI.ProfileTitles_Wnd:GetUid() ) == data.defName
		--self.isSelect = false
		self:UpdateAnim()
		if UI.Profile:IsMottoUnlocked( UI.ProfileTitles_Wnd:GetUid(), data.defName ) then
			self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
		else
			self:SetLayerVisible( UI:IsItemSale( data ), self.layers.SALE_EFFECT )
			self:SetLayerVisible( true, self.layers.LOCK_EFFECT )
			local price, bGold = UI:GetShopBuyPrice( data, false, false )
			local basePrice, basebGold = UI:GetShopBaseBuyPrice( data, false, false )
			local priceInfo = {}
			priceInfo.priceType 	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
			priceInfo.val			= price
			priceInfo.bIsBuyPrice	= true
			priceInfo.basePrice 	= basePrice
			local strPrace = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_TEXT ), true, nil, true, nil )
			self.metaText:SetText( strPrace, true )
			self:UpdateMetaTextPos()
		end
	end
end


--
function UI.ProfileTitlesList_SlotWnd:UpdateMetaTextPos()
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_TEXT )
end

--
function UI.ProfileTitlesList_SlotWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateMetaTextPos()
end

--
function UI.ProfileTitlesList_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.ProfileTitlesList_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.PRICE_TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end

--
function UI.ProfileTitlesList_SlotWnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end


--
function UI.ProfileTitlesList_SlotWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )
	UI.ProfileTitles_Wnd:OnOk()
	return true
end

--
function UI.ProfileTitlesList_SlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	UI.ProfileTitles_ListWnd:SelectRecord( self:GetRecord(), true )
	return true
end

--
function UI.ProfileTitlesList_SlotWnd:UpdateAnim()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.isSelect then
		if self.current then
			mainEffect:StartAnimation( "sel_applied" )
		else
			mainEffect:StartAnimation( "select" )
		end
	else
		if self.current then
			mainEffect:StartAnimation( "applied" )
		else
			mainEffect:StartAnimation( "idle" )
		end
	end
end

--
function UI.ProfileTitlesList_SlotWnd:Select( bSelect, bAnimated )
	if bSelect then
		self.isSelect = true
		if bAnimated then
			UI:PlayGlobalSound( UI.ProfileTitles_ListWnd.sounds.click )
		end
		if UI.ProfileTitles_Wnd:GetMode() == UI.ProfileTitles_Wnd.Modes.TITLES then
			UI.ProfileTitles_Wnd:SelectTitle( self:GetRecordData() )
		else
			UI.ProfileTitles_Wnd:SelectMotto( self:GetRecordData() )
		end
	else
		self.isSelect = false
	end
	self:UpdateAnim()
end

--
function UI.ProfileTitlesList_SlotWnd:F_PostLoad()
	UI.ButtonsList3_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.PRICE_TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.PRICE_TEXT ), self:GetLayerHeight( self.layers.PRICE_TEXT ) ), true )
end

--
function UI.ProfileTitlesList_SlotWnd:F_OnMouseIn()
	self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	UI:PlayGlobalSound( UI.ProfileTitles_ListWnd.sounds.over )
	return true
end

--
function UI.ProfileTitlesList_SlotWnd:F_OnMouseOut()
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	return true
end



-- ------------------------------
-- ProfileTitles_TitleExampleWnd
-- ------------------------------

UI.ProfileTitles_TitleExampleWnd = {}

UI.ProfileTitles_TitleExampleWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "ProfileTitles_TitleExampleWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "profile_titles_info",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title",	
						layer		= "UI.ProfileTitles_TitleExampleWnd.layers.NAME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "descript",	
						layer		= "UI.ProfileTitles_TitleExampleWnd.layers.DESC_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_1",	
						layer		= "UI.ProfileTitles_TitleExampleWnd.layers.FORMAT_INFO_TEXT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
					{
						objName		= "text_2",	
						layer		= "UI.ProfileTitles_TitleExampleWnd.layers.FORMAT_EXAMPLE_TEXT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- DESC_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- FORMAT_INFO_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- FORMAT_EXAMPLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	},

	children = { "UI.ProfileTitles_ConditionWnd", "UI.ProfileTitles_ToogleBtn" }
}


UI.ProfileTitles_TitleExampleWnd.layers = 
{
	MAIN_EFFECT				= 0,
	NAME_TEXT				= 1,
	DESC_TEXT				= 2,
	FORMAT_INFO_TEXT		= 3,
	FORMAT_EXAMPLE_TEXT		= 4,
}

UI.ProfileTitles_TitleExampleWnd.effectInfo = 
{
	descLocator							= "descript",
	conditionLocator					= "condition",
	exampleInfoLocator					= "text_1",
	exampleLocator						= "text_2",
	infoLocator							= "title_info",
	btnLocator							= "btn",
	textSeparatorLocator				= "separator_1",
	conditionSeparatorLocator			= "separator_2",
}

--
UI.ProfileTitles_TitleExampleWnd.metaText							= nil
UI.ProfileTitles_TitleExampleWnd.descriptionTop						= 0
UI.ProfileTitles_TitleExampleWnd.descriptionSeporatorSpace			= 0
UI.ProfileTitles_TitleExampleWnd.descriptionSeporatorLeft			= 0
UI.ProfileTitles_TitleExampleWnd.descriptionSeporatorHeight			= 0
UI.ProfileTitles_TitleExampleWnd.conditionSpace						= 5
UI.ProfileTitles_TitleExampleWnd.conditionHeight					= 0
UI.ProfileTitles_TitleExampleWnd.conditionSeporatorSpace			= 0
UI.ProfileTitles_TitleExampleWnd.conditionSeporatorLeft				= 0
UI.ProfileTitles_TitleExampleWnd.conditionSeporatorHeight			= 0
UI.ProfileTitles_TitleExampleWnd.exampleInfoSpace					= 5
UI.ProfileTitles_TitleExampleWnd.conditionLeft						= 0
UI.ProfileTitles_TitleExampleWnd.exampleInfoLeft					= 0
UI.ProfileTitles_TitleExampleWnd.exampleInfoHeight					= 0
UI.ProfileTitles_TitleExampleWnd.exampleLeft						= 0
UI.ProfileTitles_TitleExampleWnd.exampleSpace						= 0
UI.ProfileTitles_TitleExampleWnd.exampleHeight						= 0
UI.ProfileTitles_TitleExampleWnd.btnLeft							= 0
UI.ProfileTitles_TitleExampleWnd.btnSpace							= 5
UI.ProfileTitles_TitleExampleWnd.inited 							= false

UI.ProfileTitles_TitleExampleWnd.achievementsRewards 				= {}
UI.ProfileTitles_TitleExampleWnd.seporatorsWnd						= {}


--
function UI.ProfileTitles_TitleExampleWnd:Setup( title )
	if not self.inited then
		self:Init()
		self.inited = true
	end
	self.uid = UI.ProfileTitles_Wnd:GetUid()
	self.currentData = title
	self:SetText( UI:GetStringByName( "title_"..self.currentData.."_name" ), self.layers.NAME_TEXT )
	self.metaText:SetText( UI:GetStringByName( "title_"..self.currentData.."_desc" ), true )
	self:SetText( UI:GetStringByName( "profile_titles_text_example" ), self.layers.FORMAT_INFO_TEXT )
	self:SetText( UI:MakePlayerNameWithTitle( self.uid, self.currentData ), self.layers.FORMAT_EXAMPLE_TEXT )
	self:UpdateLayout()
end

--
function UI.ProfileTitles_TitleExampleWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.DESC_TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.DESC_TEXT ), 1000000 ), true )

	local infoEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local mainPos = UI:Vec2( 0, 0 )
	self.descriptionTop = infoEffect:GetObjPos( self.effectInfo.descLocator ).y + mainPos.y
	local descEnd = infoEffect:GetObjPos( self.effectInfo.descLocator ) + infoEffect:GetObjSize( self.effectInfo.descLocator )
	local conditionPos = infoEffect:GetObjPos( self.effectInfo.conditionLocator )
	local textSeporatorPos = infoEffect:GetObjPos( self.effectInfo.textSeparatorLocator )
	local textSeporatorSize = infoEffect:GetObjSize( self.effectInfo.textSeparatorLocator )
	self.descriptionSeporatorLeft = textSeporatorPos.x + mainPos.x
	self.descriptionSeporatorHeight = textSeporatorSize.y
	self.descriptionSeporatorSpace = textSeporatorPos.y - descEnd.y
	self.conditionSpace = conditionPos.y - ( textSeporatorPos.y + textSeporatorSize.y )
	self.conditionLeft = conditionPos.x + mainPos.x
	local conditionEnd = conditionPos + infoEffect:GetObjSize( self.effectInfo.conditionLocator )
	local conditionSeporatorPos = infoEffect:GetObjPos( self.effectInfo.conditionSeparatorLocator )
	local conditionSeporatorSize = infoEffect:GetObjSize( self.effectInfo.conditionSeparatorLocator )
	self.conditionSeporatorLeft = conditionSeporatorPos.x + mainPos.x
	self.conditionSeporatorHeight = conditionSeporatorSize.y
	self.conditionSeporatorSpace = conditionSeporatorPos.y - conditionEnd.y
	self.exampleInfoSpace = infoEffect:GetObjPos( self.effectInfo.exampleInfoLocator ).y - ( conditionSeporatorPos.y + conditionSeporatorSize.y )
	self.exampleInfoLeft = infoEffect:GetObjPos( self.effectInfo.exampleInfoLocator ).x + mainPos.x
	self.exampleLeft = infoEffect:GetObjPos( self.effectInfo.exampleLocator ).x + mainPos.x
	self.exampleInfoHeight = infoEffect:GetObjSize( self.effectInfo.exampleInfoLocator ).y
	local exampleInfoEnd = infoEffect:GetObjPos( self.effectInfo.exampleInfoLocator ) + infoEffect:GetObjSize( self.effectInfo.exampleInfoLocator )
	self.exampleSpace = infoEffect:GetObjPos( self.effectInfo.exampleLocator ).y - exampleInfoEnd.y
	self.exampleHeight = infoEffect:GetObjSize( self.effectInfo.exampleLocator ).y
	self.conditionHeight = infoEffect:GetObjSize( self.effectInfo.conditionLocator ).y
	self.btnLeft = infoEffect:GetObjPos( self.effectInfo.btnLocator ).x + mainPos.x
	local exampleEnd = infoEffect:GetObjPos( self.effectInfo.exampleLocator ) + infoEffect:GetObjSize( self.effectInfo.exampleLocator )
	self.btnSpace = infoEffect:GetObjPos( self.effectInfo.btnLocator ).y - exampleEnd.y
end

--
function UI.ProfileTitles_TitleExampleWnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.ProfileTitles_TitleExampleWnd:Init()
	for k, v in pairs( Achievements ) do
		for kk, vv in pairs( v.ranks ) do 
			if vv.reward_title then
				self.achievementsRewards[ vv.reward_title ] = { id = k, rank = kk }
			end
		end
	end
	self.inited = true
end

--
function UI.ProfileTitles_TitleExampleWnd:GetSeporatorWnd( index )
	if not self.seporatorsWnd[ index ] then
		self.seporatorsWnd[ index ] = UI:CreateChildWnd( self, UI.ProfileTitlesInfo_SeparatorWnd, tostring( index ) )
	end
	return self.seporatorsWnd[ index ]
end

--
function UI.ProfileTitles_TitleExampleWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
	self:OnScreenPosChanged( oldScreenX, oldScreenY )
	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end
	if self:IsOnScreen() then
		self:UpdateLayout()
	end
end

--
function UI.ProfileTitles_TitleExampleWnd:UpdateLayout()
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.DESC_TEXT )
	local fp = self.metaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )
	local textHeight = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		fp.hFont,
   		formatRect,
   		fp.formatFlags,
   		formatRect ).w
	local height = self.descriptionTop + textHeight
	local seporatorWnd = self:GetSeporatorWnd( 1 )
	height = height + self.descriptionSeporatorSpace
	seporatorWnd:SetLeft( self.descriptionSeporatorLeft )
	seporatorWnd:SetTop( height )
	self:AddChild( seporatorWnd )
	height = height + self.descriptionSeporatorHeight
	local achieveData = self.achievementsRewards[ PlayerTitleId[ self.currentData ] ]
	self:AddChild( UI.ProfileTitles_ConditionWnd )
	UI.ProfileTitles_ConditionWnd:SetLeft( self.conditionLeft )
	UI.ProfileTitles_ConditionWnd:SetTop( height )
	height = height + UI.ProfileTitles_ConditionWnd:GetHeight()
	local seporator2Wnd = self:GetSeporatorWnd( 2 )
	height = height + self.conditionSeporatorSpace
	seporator2Wnd:SetLeft( self.conditionSeporatorLeft )
	seporator2Wnd:SetTop( height )
	self:AddChild( seporator2Wnd )
	height = height + self.conditionSeporatorHeight
	if self.currentData then
		if self.achievementsRewards[ PlayerTitleId[ self.currentData ] ] then
			UI.ProfileTitles_ConditionWnd:SetAchievementData( achieveData, self.currentData )
		else
			UI.ProfileTitles_ConditionWnd:SetTextData( UI:GetStringByName( "title_"..self.currentData.."_condition" ), self.currentData )
		end
	end
	self:SetLayerLeft( self.exampleInfoLeft, self.layers.FORMAT_INFO_TEXT )
	self:SetLayerLeft( self.exampleLeft, self.layers.FORMAT_EXAMPLE_TEXT )
	height = height + self.exampleInfoSpace
	self:SetLayerTop( height, self.layers.FORMAT_INFO_TEXT )
	height = height + self.exampleSpace + self.exampleInfoHeight
	self:SetLayerTop( height, self.layers.FORMAT_EXAMPLE_TEXT )
	
	if self.uid == _G.MasterServer_GetLocalUserId() then
		height = height + self.exampleHeight + self.exampleSpace
		UI.ProfileTitles_ToogleBtn:SetLeft( self.btnLeft )
		UI.ProfileTitles_ToogleBtn:SetTop( height )
		if PlayerTitleId[ self.currentData ] == UI.Profile:GetCurrentTitle( self.uid ) then
			UI.ProfileTitles_ToogleBtn:SetString( UI:GetStringByName( "profile_titles_disable_title" ) )
		else
			UI.ProfileTitles_ToogleBtn:SetString( UI:GetStringByName( "profile_titles_enable_title" ) )
		end
		self:AddChild( UI.ProfileTitles_ToogleBtn )
		if UI.Profile:IsTitleUnlocked( PlayerTitleId[ self.currentData ], self.uid ) then
			self:AddChild( UI.ProfileTitles_ToogleBtn )
		else
			UI.ProfileTitles_ToogleBtn:UnlinkFromParent()
		end
	else
		UI.ProfileTitles_ToogleBtn:UnlinkFromParent()
	end
end

--
function UI.ProfileTitles_TitleExampleWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateLayout()
end     

--
function UI.ProfileTitles_TitleExampleWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.DESC_TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end


-- ------------------------------
-- ProfileTitles_ConditionWnd
-- ------------------------------

UI.ProfileTitles_ConditionWnd = {}

UI.ProfileTitles_ConditionWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "ProfileTitles_ConditionWnd",
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
				defName 			= "profile_titles_info_condition",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "value",
						layer		= "UI.ProfileTitles_ConditionWnd.layers.CONDITION_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "value_2",
						layer		= "UI.ProfileTitles_ConditionWnd.layers.CONDITION_TEXT_2",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "lock",	
						layer		= "UI.ProfileTitles_ConditionWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- CONDITION_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- CONDITION_TEXT_2
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "itemIco_lock",
				defaultAnimation	= "idle",
			}}
		},
	}
}

--
UI.ProfileTitles_ConditionWnd.layers = 
{
	MAIN_EFFECT				= 0,
	CONDITION_TEXT			= 1,
	CONDITION_TEXT_2		= 2,
	LOCK_EFFECT				= 3,
}

UI.ProfileTitles_ConditionWnd.metaText = nil
UI.ProfileTitles_ConditionWnd.wnd = nil

--
function UI.ProfileTitles_ConditionWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:SetParentWindow( self )
	self.metaText:InitFromLayer( self, self.layers.CONDITION_TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.CONDITION_TEXT ), self:GetLayerHeight( self.layers.CONDITION_TEXT ) ), true ) 
	self.wnd = UI:CreateChildWnd( self, UI.ProfileTitlesCondition_AchievWnd, "" )
end

--
function UI.ProfileTitles_ConditionWnd:SetAchievementData( achieveData, titleName )
	self:AddChild( self.wnd )
	local str = UI:GetStringByName( "profile_titles_achieve_reward" )
	local handle = self.wnd:GetUiHandle()
	self.wnd:SetAchiev( achieveData.id, achieveData.rank )
	local wndStr = string.format( "$wndk [hWnd %d]$", handle )
	str = string.gsub( str, "%$achieve_name%$", wndStr )
	self.metaText:SetText( str, self.layers.CONDITION_TEXT )
	if UI.Profile:IsTitleUnlocked( PlayerTitleId[ titleName ], UI.ProfileTitles_Wnd:GetUid() ) then
		self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
		self:SetLayerVisible( false, self.layers.CONDITION_TEXT )
		self:SetLayerVisible( true, self.layers.CONDITION_TEXT_2 )
		self.metaText:UpdateScreenOrgFromLayer( self, self.layers.CONDITION_TEXT_2 )
	else
		self:SetLayerVisible( true, self.layers.LOCK_EFFECT )
		self:SetLayerVisible( true, self.layers.CONDITION_TEXT )
		self.metaText:UpdateScreenOrgFromLayer( self, self.layers.CONDITION_TEXT )
		self:SetLayerVisible( false, self.layers.CONDITION_TEXT_2 )
	end
end

--
function UI.ProfileTitles_ConditionWnd:SetTextData( text, titleName )
	self.wnd:UnlinkFromParent()
	self.metaText:SetText( text, self.layers.CONDITION_TEXT )
	if UI.Profile:IsTitleUnlocked( PlayerTitleId[ titleName ], UI.ProfileTitles_Wnd:GetUid() ) then
		self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
		self:SetLayerVisible( false, self.layers.CONDITION_TEXT )
		self:SetLayerVisible( true, self.layers.CONDITION_TEXT_2 )
		self.metaText:UpdateScreenOrgFromLayer( self, self.layers.CONDITION_TEXT_2 )
	else
		self:SetLayerVisible( true, self.layers.LOCK_EFFECT )
		self:SetLayerVisible( true, self.layers.CONDITION_TEXT )
		self.metaText:UpdateScreenOrgFromLayer( self, self.layers.CONDITION_TEXT )
		self:SetLayerVisible( false, self.layers.CONDITION_TEXT_2 )
	end
end

--
function UI.ProfileTitles_ConditionWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.CONDITION_TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	elseif layerIdx == self.layers.CONDITION_TEXT_2 then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end

-- ------------------------------------------------------------------------
-- UI.ProfileTitlesCondition_AchievWnd
-- ------------------------------------------------------------------------

UI.ProfileTitlesCondition_AchievWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name		= "ProfileTitlesCondition_AchievWnd",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype = true,
		},

     	layers =
     	{
			-- TEXT_EFFECT
    		{
    			layerType	= UI.LAYER_TEXT,

    			formatFlags		= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "VerySmall" },

	   			color			= 0xfffff68f
			}
		}
	},
}

--
UI.ProfileTitlesCondition_AchievWnd.layers = 
{
	TEXT_EFFECT			= 0,
}

UI.ProfileTitlesCondition_AchievWnd.color = 0xfffff68f
UI.ProfileTitlesCondition_AchievWnd.achieve = nil
UI.ProfileTitlesCondition_AchievWnd.rank = nil

--
function UI.ProfileTitlesCondition_AchievWnd:SetAchiev( achieve, rank )
	local text = UI:Achievement2Str( achieve, rank )
	self:SetText( text, self.layers.TEXT_EFFECT )
	local formatRect	= UI:Quat( 0, 0, 10000, 10000 )
	local hFont			= self:GetFont( self.layers.TEXT_EFFECT )
	local fontHeight	= _G.GetFontSymbolHeight( hFont )
	local formatFlags = self:GetTextFormatFlags( self.layers.TEXT_EFFECT )
	local textSize = _G.MeasureText( text, hFont, formatRect, formatFlags, formatRect )
	self:SetHeight( textSize.w )
	self:SetWidth( textSize.z )
	self:SetLayerRect( UI:Quat( 0, 0, textSize.z, textSize.w ), self.layers.TEXT_EFFECT, 0 )
	self.achieve = achieve
	self.rank = rank
end

--
function UI.ProfileTitlesCondition_AchievWnd:GetTooltipData()
	local caption = ""
	local text = ""
	if self.achieve and self.rank then
		caption = UI:Achievement2Str( self.achieve, self.rank )
		text = UI:GetAchievementConditionStr( self.achieve, self.rank )
	end	
	self.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, text = text, caption = caption }
	return self.tooltipData
end

--
UI.ProfileTitles_ToogleBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "ProfileTitles_ToogleBtn",
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
					defName				= "shop_buyBtn",
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
				id			= l_numBaseBtnLayers,

				layerType	= UI.LAYER_TEXT,

				formatFlags	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz = { 1, 1 },
				font =
				{
					fontName = "Small",
				},

				text		= "^vote_vote"
			},
   		}
	},
}

UI.ProfileTitles_ToogleBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "over",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

UI.ProfileTitles_ToogleBtn.layers = 
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
}


--
function UI.ProfileTitles_ToogleBtn:SetString( text )
	self:SetText( text, self.layers.TEXT )
end

--
UI.ProfileTitlesInfo_SeparatorWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name		= "ProfileTitlesInfo_SeparatorWnd",
			isPrototype	= true,
			style		= UI.WS_UPDATE_IF_VISIBLE,
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
					defName				= "profile_titles_info_separator",
					defaultAnimation    = "idle",

					links =
					{
						{
							objName		= "buy_btn",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			}
		}
	}
}


-- ------------------------------
-- ProfileTitles_MottoExampleWnd
-- ------------------------------
UI.ProfileTitles_MottoExampleWnd = {}
UI.ProfileTitles_MottoExampleWnd.def =
{
	className	= "Wnd",
	props =
	{
		name	= "ProfileTitles_MottoExampleWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
	},
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "profile_titles_info",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title",	
						layer		= "UI.ProfileTitles_MottoExampleWnd.layers.NAME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "avatar_icon",	
						wnd			= "UI.ProfileTitles_MottoExampleImpWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text 			= "^profile_mottos_example",
		},
	},

	children = { "UI.ProfileTitles_MottoToogleBtn", "UI.ProfileTitles_MottoExampleImpWnd" }
}

--
UI.ProfileTitles_MottoExampleWnd.layers = 
{
	MAIN_EFFECT				= 0,
	NAME_TEXT				= 1,
}

--
function UI.ProfileTitles_MottoExampleWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local space = mainEffect:GetObjPos( "btn" ).y - ( mainEffect:GetObjPos( "text_2" ).y + mainEffect:GetObjSize( "text_2" ).y )
	local pos = UI.ProfileTitles_MottoExampleImpWnd:GetTop() + UI.ProfileTitles_MottoExampleImpWnd:GetHeight() + space
	UI.ProfileTitles_MottoToogleBtn:SetTop( pos )
	UI.ProfileTitles_MottoToogleBtn:SetLeft( mainEffect:GetObjPos( "btn" ).x )
end

--
function UI.ProfileTitles_MottoExampleWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ProfileTitles_MottoToogleBtn == wnd then
		UI.ProfileTitles_Wnd:OnOk()
	end
	return true
end

--
function UI.ProfileTitles_MottoExampleWnd:Setup( data )
	self.data = data
	UI.ProfileTitles_MottoExampleImpWnd:Setup( data )
	if UI.ProfileTitles_Wnd:GetUid() == _G.MasterServer_GetLocalUserId() then
		self:AddChild( UI.ProfileTitles_MottoToogleBtn )
		if UI.Profile:IsMottoUnlocked( _G.MasterServer_GetLocalUserId(), data.defName ) then
			if UI.Profile:GetCurrentMotto( _G.MasterServer_GetLocalUserId() ) == data.defName then
				UI.ProfileTitles_MottoToogleBtn:SetString( UI:GetStringByName( "profile_titles_disable_title" ) )
			else
				UI.ProfileTitles_MottoToogleBtn:SetString( UI:GetStringByName( "profile_titles_enable_title" ) )
			end
		else
			UI.ProfileTitles_MottoToogleBtn:SetString( UI:GetStringByName( "shop_buy" ) )
		end
	else
		UI.ProfileTitles_MottoToogleBtn:UnlinkFromParent()
	end

end

--
function UI.ProfileTitles_MottoExampleWnd:UpdateLayout()
	self:Setup( self.data )
end

--
UI.ProfileTitles_MottoToogleBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",
		props =
		{
			name		= "ProfileTitles_MottoToogleBtn",
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
					defName				= "shop_buyBtn",
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
				id			= l_numBaseBtnLayers,
				layerType	= UI.LAYER_TEXT,
				formatFlags	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz = { 1, 1 },
				font =
				{
					fontName = "Small",
				},
				text		= "^vote_vote"
			},
   		}
	},
}

UI.ProfileTitles_MottoToogleBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "over",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

UI.ProfileTitles_MottoToogleBtn.layers = 
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
}


--
function UI.ProfileTitles_MottoToogleBtn:SetString( text )
	self:SetText( text, self.layers.TEXT )
end


-- ------------------------------
-- ProfileTitles_MottoExampleImpWnd
-- ------------------------------
UI.ProfileTitles_MottoExampleImpWnd = {}
UI.ProfileTitles_MottoExampleImpWnd.def =
{
	className	= "Wnd",
	props =
	{
		name	= "ProfileTitles_MottoExampleImpWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
	},
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "profile_titles_motto_example",
				defaultAnimation	= "hide_ico",
				links =
				{
					{
						objName		= "self25",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "avatar_icon",
						wnd 		= "UI.ProfileTitlesMottoExampleImp_AvatarWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "description",
						layer 		= "UI.ProfileTitles_MottoExampleImpWnd.layers.MOTTO_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- MOTTO_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	},

	children = { "UI.ProfileTitlesMottoExampleImp_AvatarWnd" }
}

UI.ProfileTitles_MottoExampleImpWnd.layers = 
{
	MAIN_EFFECT 				= 0,
	MOTTO_TEXT 					= 1,
}

--
function UI.ProfileTitles_MottoExampleImpWnd:Setup( data )
	local avatarDef = UI.Profile:GetCurrentAvatar( UI.ProfileTitles_Wnd:GetUid() )
	UI.ProfileTitlesMottoExampleImp_AvatarWnd:SetAvatar( avatarDef )
	self:SetText( UI:GetMottoTextByUid( UI.ProfileTitles_Wnd:GetUid(), UI:GetMottoString( data.defName ) ), UI.ProfileTitles_MottoExampleImpWnd.layers.MOTTO_TEXT )
end


--
UI.ProfileTitlesMottoExampleImp_AvatarWnd =
{
	def =
	{
		className	= "Wnd",
		prototype 	= "PlayerAvatarWnd",
		props =
		{
			name		= "ProfileTitlesMottoExampleImp_AvatarWnd",
		},
	}
}