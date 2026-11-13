-- ----------------------------------------------------------------------------
--
-- Workfile: yup2goldwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.Yup2GoldWnd = {}
local yg = UI.Yup2GoldWnd

-- ------------------------------
-- window definition
-- ------------------------------

--
yg.layers =
{
    MAIN_EFFECT				= 0,
    BG_EFFECT				= 1,
    WORK_EFFECT				= 2,
    CAPTION					= 3,
	GIFT_EFFECT				= 4,
    GIFT_PROGRESS_VAL		= 5,
	GIFT_PROGRESS_PB_EFFECT	= 6,
	WAIT_EFFECT				= 7,
	WAIT_TEXT				= 8,
}


--
UI.Yup2GoldWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name			= "Yup2GoldWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.Yup2GoldWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "yup2GoldWnd_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "window_3",
						layer		= "UI.Yup2GoldWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.Yup2GoldWnd.layers.BG_EFFECT",
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
				defName 			= "yup2GoldWnd_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Yup2GoldWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "list",
						wnd			= "UI.Yup2Gold_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_1",
						wnd			= "UI.Yup2Gold_BuyBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",
						wnd			= "UI.Yup2Gold_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.Yup2Gold_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "dlc_list",
						wnd			= "UI.Yup2Gold_DlcListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "dlc_list",
						wnd			= "UI.Yup2Gold_YuplayDlcBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading_big",	
						layer		= "UI.Yup2GoldWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "present",	
						layer		= "UI.Yup2GoldWnd.layers.GIFT_EFFECT",
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
			text			= "^yup2gold_caption",
		},  

		-- GIFT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "yup2GoldWnd_gift",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Yup2GoldWnd.layers.GIFT_PROGRESS_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "progr",
						layer		= "UI.Yup2GoldWnd.layers.GIFT_PROGRESS_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "present_ico",
						wnd			= "UI.Yup2Gold_GiftIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- GIFT_PROGRESS_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- GIFT_PROGRESS_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "yup2GoldWnd_gift_pb",
				defaultAnimation	= "idle",
			}}
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
						layer		= "UI.Yup2GoldWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL
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
		"UI.Yup2Gold_ListWnd",
		"UI.Yup2Gold_BuyBtn",
		"UI.Yup2Gold_CancelBtn",
		"UI.Yup2Gold_CrossBtn",
		"UI.Yup2Gold_DlcListWnd",
		"UI.Yup2Gold_YuplayDlcBtn",
		"UI.Yup2Gold_GiftIcoWnd",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Yup2GoldWnd:GetMode()

	return self.mode

end


--
function UI.Yup2GoldWnd:MasterServer_OnAttachSteamAccount( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:FullUpdate()

end


--
function UI.Yup2GoldWnd:MasterServer_OnSteamUserInfo( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:FullUpdate()

end


--
function UI.Yup2GoldWnd:MasterServer_OnPlayerCredentials( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Yup2Gold_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )	-- tODO: почему MasterServer_OnPlayerCredits??
	UI.Yup2Gold_BuyArcDlcWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	local mode = self:DetectMode()
	if mode ~= self.mode then
		self:FullUpdate()
	end

end


--
function UI.Yup2GoldWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Yup2Gold_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Yup2Gold_BuyArcDlcWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:UpdateGiftProgress()

end


-- вызывается окном покупки
function UI.Yup2GoldWnd:OnBuyGold( goldPackInfo )

	self:DoBuyGold( goldPackInfo )

end


--
function UI.Yup2GoldWnd:OnBuyArcDlcWndResult( result, dlcName )

	if result ~= true then
		return
	end

	local dlcInfo, dlcId = UI:GetArcDlcInfo( dlcName )
	if not dlcId then
		sys.log( "Yup2GoldWnd:OnBuyArcDlcWndResult()[ERROR]: cannot find arc dlc id for dlc \"%s\"", dlcName )
		return
	end

	self.buyArcDlcRequestId = _G.GameStore_BuyArcDLC( dlcId )

	if self.buyArcDlcRequestId == 0 then
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitEffect()

end


--
function UI.Yup2GoldWnd:GameStore_OnBuyArcDLC( result, requestId, param1, param2 )

	if requestId == self.buyArcDlcRequestId then

		if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
			UI:ShowMsgOnBuyError( result )
		end

		self.buyArcDlcRequestId = 0
		self:UpdateWaitEffect()

	end

end


--
function UI.Yup2GoldWnd:GameStore_OnBuyGold( result, requestId, param1, param2 )	

	if requestId == self.buyGoldRequestId then

		if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
			UI:ShowMsgOnBuyError( result )
		end

		self.buyGoldRequestId = 0
		self:UpdateWaitEffect()

	end

end


-- нет самостоятельной подписки, вызывается из UI.HangarWnd
function UI.Yup2GoldWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.buyGoldRequestId	= 0
	self.buyArcDlcRequestId	= 0

	if self:IsOnScreen() then
	    self:UpdateWaitEffect()
	end

end


--
function UI.Yup2GoldWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	if notification == _G.MasterServer.ServerNotification.SN_UPDATE_DLC_OWNERSHIP then

		if self.dlcListWnd:IsChildOf( self ) then
			self:UpdateDlc()
		end

	end

end


--
function UI.Yup2GoldWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	UI.Yup2Gold_BuyWnd:GameStore_OnLoadingComplete( storeSize )

	for recordIdx = 1, self.listWnd:GetNumRecords() do

		local slotWnd = self.listWnd:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnShopReload()
		end

	end	

end


--
function UI.Yup2GoldWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Yup2Gold_BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Yup2GoldWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Yup2Gold_BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Yup2GoldWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Yup2Gold_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


-- ------------------------------
-- const
-- ------------------------------

yg.sounds =
{
	hide			= "sound/ui/MsgHide",
	buy				= "sound/ui/apply",
	slotMouseOver	= "sound/ui/btnMouseOver",
	slotSelect		= "sound/ui/btnClick",
	tradeWndShow	= "sound/ui/btnClick",
}

yg.modes =
{
	YUP		= 1,
	STEAM	= 2,
	ARC		= 3,
}

-- ------------------------------
-- vars
-- ------------------------------

yg.mode					= -1
yg.dlcListWnd			= nil
yg.yupDlcBtn			= nil
yg.buyGoldRequestId		= 0
yg.buyArcDlcRequestId	= 0
yg.giftProgressMetaText	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Yup2GoldWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.listWnd	= UI.Yup2Gold_ListWnd
	self.dlcListWnd	= UI.Yup2Gold_DlcListWnd
	self.yupDlcBtn	= UI.Yup2Gold_YuplayDlcBtn

	self.giftProgressMetaText = UI.MetaText.GetNewInstance()
	self.giftProgressMetaText:InitFromLayer( self, self.layers.GIFT_PROGRESS_VAL )

	self:HideWaitEffect()

end


--
function UI.Yup2GoldWnd:F_Shutdown()

	if self.giftProgressMetaText then
		self.giftProgressMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Yup2GoldWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Yup2GoldWnd:UpdateMetaTextPos()

	self.giftProgressMetaText:UpdateScreenOrgFromLayer( self, self.layers.GIFT_PROGRESS_VAL )

end


--
function UI.Yup2GoldWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.GIFT_PROGRESS_VAL then
		self.giftProgressMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Yup2GoldWnd:Reset()

	UI.FullScreenSelectionWnd.Reset( self )

	self.mode	= -1

	self.dlcListWnd:Clear()
	self.dlcListWnd:UnlinkFromParent()

	self.yupDlcBtn:UnlinkFromParent()

	self.giftProgressMetaText:SetText( "", true )

	local pbEffect = UI:GetEffectFromLayer( self, self.layers.GIFT_PROGRESS_PB_EFFECT )
	if pbEffect then
		pbEffect:SetAnimationTimeAndUpdate( 0 )
	end

end


--
function UI.Yup2GoldWnd:FullUpdate()

	self:Reset()

	self:UpdateMode()
	self:UpdateList()
	self:ValidateListSelection()
	self:UpdateDlc()
	self:UpdateWaitEffect()
	self:UpdateGiftProgress()

end


--
function UI.Yup2GoldWnd:UpdateMode()

	self.mode = self:DetectMode()

end


--
function UI.Yup2GoldWnd:DetectMode()

	-- TODO: проверять версию на live/test?
	if UI:IsLinkedSteam() then
		return self.modes.STEAM

	elseif _G.Arc_IsInitialized() then
		return self.modes.ARC

	else
		return self.modes.YUP
	end

end


--
function UI.Yup2GoldWnd:UpdateList()

	local packs = {}

	if self.mode == self.modes.YUP then

    	local language = UI:GetLanguage()

    	local shortLangName = _G.locale and _G.locale.languages and _G.locale.languages[ language ] and _G.locale.languages[ language ].shortName
    	if not shortLangName then
    		sys.log( "UI.Yup2GoldWnd:UpdateList()[ERROR]: cannot find _G.locale.languages[%s].shortName; \"en\" will be used", language )
    		shortLangName = "en"		
    	end

    	for idx = 1, #UI.serverData.goldPacksInfo do

    		local goldPackInfo = UI.serverData.goldPacksInfo[ idx ]

    		if not goldPackInfo.hidden and not UI:IsStrEmpty( goldPackInfo.guid ) and self:IsLangInStr( goldPackInfo.lang, shortLangName ) then
				table.insert( packs, goldPackInfo )
    		end

    	end

	elseif self.mode == self.modes.STEAM then

    	local currency = UI.serverData.steamUserInfo.currency or "USD"

    	for idx = 1, #UI.serverData.goldPacksInfo do

    		local goldPackInfo = UI.serverData.goldPacksInfo[ idx ]

    		if not goldPackInfo.hidden and goldPackInfo.steamCurrency == currency then
				table.insert( packs, goldPackInfo )
    		end

    	end

	elseif self.mode == self.modes.ARC then

    	local language = UI:GetLanguage()

    	local shortLangName = _G.locale and _G.locale.languages and _G.locale.languages[ language ] and _G.locale.languages[ language ].shortName
    	if not shortLangName then
    		sys.log( "UI.Yup2GoldWnd:UpdateList()[ERROR]: cannot find _G.locale.languages[%s].shortName; \"en\" will be used", language )
    		shortLangName = "en"		
    	end

    	for idx = 1, #UI.serverData.goldPacksInfo do

    		local goldPackInfo = UI.serverData.goldPacksInfo[ idx ]

    		if not goldPackInfo.hidden and ( goldPackInfo.arcItemId ~= nil and goldPackInfo.arcItemId ~= 0 ) and self:IsLangInStr( goldPackInfo.lang, shortLangName ) then
				table.insert( packs, goldPackInfo )
    		end

    	end

	else
		sys.log( "UI.Yup2GoldWnd:UpdateList()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end

	for idx = 1, #packs do

    	local data = { goldPackInfo = packs[ idx ] }
    	self.listWnd:AddRecord( data )

	end

end 


--
function UI.Yup2GoldWnd:IsLangInStr( str, lang )

	if UI:IsStrEmpty( str ) then
		return false
	end

	if UI:IsStrEmpty( lang ) then
		sys.log( "UI.Yup2GoldWnd:IsLangInStr()[ERROR]: empty lang" )
		return false
	end

	for l in string.gmatch( str, "[^%s%p]+" ) do
		if l == lang then
			return true
		end
	end

	return false

end


--
function UI.Yup2GoldWnd:UpdateDlc()

	self.dlcListWnd:Clear()
	self.dlcListWnd:UnlinkFromParent()

	self.yupDlcBtn:UnlinkFromParent()


	if self.mode == self.modes.YUP then

		self:AddChild( self.yupDlcBtn )

	else

		self:AddChild( self.dlcListWnd )

    	if _G.DLCList == nil then
    		return
    	end

    	if type( _G.DLCList ) ~= "table" then
    		sys.log( "UI.Yup2GoldWnd:UpdateDlc()[ERROR]: invalid type of \"_G.DLCList\"; \"table\" or \"nil\" expected, got \"%s\"", type( _G.DLCList ) )
    		return
    	end

    	local boughtDlcs = UI:GetBoughtDlcs()

    	for dlcIdx = 1, #_G.DLCList do

    		local dlcInfo = _G.DLCList[ dlcIdx ]
    		if type( dlcInfo ) == "table" then

    			local bHidden = false

    			if dlcInfo.hidden ~= nil then
    				if type( dlcInfo.hidden ) == "boolean" then
    					bHidden = dlcInfo.hidden
    				else
    					sys.log( "UI.Yup2GoldWnd:UpdateDlc()[ERROR]: invalid type of _G.DLCList[%s].hidden; \"boolean\" or \"nil\" expected, got \"%s\"", tostring( dlcIdx ), type( dlcInfo.hidden ) )
    				end
    			end

    			if not bHidden then

        			if type( dlcInfo.name ) == "string" then

        				local data = { dlcName = dlcInfo.name, bBought = boughtDlcs[ dlcInfo.name ] ~= nil }
        				self.dlcListWnd:AddRecord( data )

        			else
        				sys.log( "UI.Yup2GoldWnd:UpdateDlc()[ERROR]: invalid type of _G.DLCList[%s].name; \"string\" expected, got \"%s\"", tostring( dlcIdx ), type( dlcInfo.name ) )
        			end

    			end

    		else
    			sys.log( "UI.Yup2GoldWnd:UpdateDlc()[ERROR]: invalid type of _G.DLCList[%s]; \"table\" expected, got \"%s\"", tostring( dlcIdx ), type( dlcInfo ) )
    		end

    	end	

	end

end


--
function UI.Yup2GoldWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd.YUP_SLOT then
		
		local recordIdx = wnd:GetRecord()

		if recordIdx ~= self.listWnd:GetSelectedRecord() then
			UI:PlayGlobalSound( self.sounds.slotSelect )
			self.listWnd:SelectRecord( recordIdx )
		end

	elseif wnd == UI.Yup2Gold_BuyBtn then
		self:OnOk()

	elseif wnd == UI.Yup2Gold_CancelBtn then
		self:OnCancel()

	elseif wnd == UI.Yup2Gold_CrossBtn then
		self:OnCancel()

	elseif UI:IsWndKindOf( wnd, "Yup2Gold_DlcSlotWnd" ) then

		if not self:IsWaiting() then

			if not wnd:IsDisabled() then

        		local dlcName = wnd:GetRecordData().dlcName

    		    if _G.Arc_IsInitialized() then
    				self:LaunchBuyArcDlcWnd( dlcName )
    			else
    				UI:LaunchDlcLink( dlcName )
    			end

			end

		end

	elseif wnd == self.yupDlcBtn then

		local link = _G.yuplay_dlc_link

		if type( link ) ~= "string" then
			sys.log( "UI.Yup2GoldWnd:F_OnMouseLButtonDown()[ERROR]: invalid type of _G.yuplay_dlc_link; \"string\" expected, got \"%s\"", type( link ) )
			link = ""
		end

		if link ~= "" then
			_G.MasterServer_SignInAndRerirectGaijin( link )
		else
			sys.log( "UI.Yup2GoldWnd:F_OnMouseLButtonDown()[ERROR]: no link to open yuplay dlc site" )
		end

	end

	return true

end


--
function UI.Yup2GoldWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd.YUP_SLOT then
		
		local recordIdx = wnd:GetRecord()
		if recordIdx ~= self.listWnd:GetSelectedRecord() then
			self.listWnd:SelectRecord( recordIdx )
		end

		self:OnOk()

	end

	return true

end 


-- перегрузка из функции из базового класса FullScreenSelectionWnd - не нужно менять выделение в списке при движении мыши
function UI.Yup2GoldWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	return self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

end


--
function UI.Yup2GoldWnd:OnEnter( key, controllerIdx )

	if self:IsInputBlocked() then
		return true
	end

	self:OnOk()
	return true	

end


--
function UI.Yup2GoldWnd:OnEscape( key, controllerIdx )

	if self:IsInputBlocked() then
		return true
	end

	self:OnCancel()
	return true	

end


--
function UI.Yup2GoldWnd:OnOk()

	if self:IsWaiting() then
		return
	end

	local selRecordIdx = self.listWnd:GetSelectedRecord()
	if selRecordIdx == -1 then
		return
	end

	local data = self.listWnd:GetRecordData( selRecordIdx )

	if self.mode == self.modes.YUP then
		self:DoBuyGold( data.goldPackInfo )

	elseif self.mode == self.modes.STEAM then
		self:DoBuyGold( data.goldPackInfo )

	elseif self.mode == self.modes.ARC then
		self:TryBuyGold( selRecordIdx )

	else
		sys.log( "UI.Yup2GoldWnd:OnOk()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end

end


--
function UI.Yup2GoldWnd:OnCancel()

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()

end


--
function UI.Yup2GoldWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	self:UpdateWaitEffect()
	self:UpdateMetaTextPos()

end


--
function UI.Yup2GoldWnd:TryBuyGold( recordIdx )

	local data = self.listWnd:GetRecordData( recordIdx )

	UI:PlayGlobalSound( self.sounds.tradeWndShow )

	UI.Yup2Gold_BuyWnd:Setup( data.goldPackInfo, recordIdx )
	UI.Yup2Gold_BuyWnd:Show()

end


--
function UI.Yup2GoldWnd:DoBuyGold( goldPackInfo )

	if self.mode == self.modes.YUP then

    	UI:PlayGlobalSound( self.sounds.buy )
    	_G.MasterServer_SignInAndRerirectGaijin( goldPackInfo.url )

	elseif self.mode == self.modes.STEAM then

		self.buyGoldRequestId = _G.GameStore_BuyGoldPack( _G.MasterServer.AuthMethod.AM_STEAM, goldPackInfo.id )

		if self.buyGoldRequestId ~= 0 then
	    	UI:PlayGlobalSound( self.sounds.buy )
			self:Hide()
		else
			UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
		end

		self:UpdateWaitEffect()

	elseif self.mode == self.modes.ARC then
		
		self.buyGoldRequestId = _G.GameStore_BuyGoldPack( _G.MasterServer.AuthMethod.AM_ARC, goldPackInfo.id )

		if self.buyGoldRequestId ~= 0 then
	    	UI:PlayGlobalSound( self.sounds.buy )
			self:Hide()
		else
			UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
		end

		self:UpdateWaitEffect()

	else
		sys.log( "UI.Yup2GoldWnd:DoBuyGold()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end

end


--
function UI.Yup2GoldWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.Yup2GoldWnd:HideChildModals()

	UI.Yup2Gold_BuyWnd:UnlinkFromParent()
	UI.Yup2Gold_BuyArcDlcWnd:UnlinkFromParent()

end


--
function UI.Yup2GoldWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	UI.store.Yup2GoldWnd =
	{
		buyGoldRequestId	= self.buyGoldRequestId,
		buyArcDlcRequestId	= self.buyArcDlcRequestId,
	}

end


--
function UI.Yup2GoldWnd:F_OnEventRestoreUiState()

	if UI.store.Yup2GoldWnd then

		self.buyGoldRequestId	= UI.store.Yup2GoldWnd.buyGoldRequestId
		self.buyArcDlcRequestId	= UI.store.Yup2GoldWnd.buyArcDlcRequestId

		if self:IsOnScreen() then
			self:UpdateWaitEffect()
		end

		UI.store.Yup2GoldWnd = nil

	end

end


--
function UI.Yup2GoldWnd:LaunchBuyArcDlcWnd( dlcName )

	UI.Yup2Gold_BuyArcDlcWnd:Setup( dlcName )
	UI.Yup2Gold_BuyArcDlcWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.Yup2GoldWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.Yup2GoldWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )

end


--
function UI.Yup2GoldWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )

end


--
function UI.Yup2GoldWnd:IsWaiting()

	return self.buyGoldRequestId ~= 0

end


--
function UI.Yup2GoldWnd:OnAccountAurasChanged()

	for recordIdx = 1, self.listWnd:GetNumRecords() do

		local slotWnd = self.listWnd:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnAccountAurasChanged()
		end

	end	

end


--
function UI.Yup2GoldWnd:UpdateGiftProgress()

	local isVal		= UI:GetPlayerGoldForGift()
	local needVal	= _G.GameStore_GetBonusBundlePoints()

	-- текст

	local priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_GOLD,
		val			= isVal,
		bIsBuyPrice	= false,
		valAsString	= string.format( "%s/%s", UI:Num2StrSeparatedBy3( isVal ), UI:Num2StrSeparatedBy3( needVal ) ),
	}

	local strVal = UI:PriceInfo2Str( priceInfo, nil, nil, nil, true, nil )
	local str = string.format( "%s: %s", UI:GetStringByName( "goldGift_progress" ), strVal )

	self.giftProgressMetaText:SetText( str, true )

	-- прорессбар

	local animTime = UI:Clamp( isVal / needVal, 0, 1 )
	local pbEffect = UI:GetEffectFromLayer( self, self.layers.GIFT_PROGRESS_PB_EFFECT )
	if pbEffect then
		pbEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


-- ------------------------------------------------------------
-- UI.Yup2Gold_ListWnd
-- ------------------------------------------------------------

UI.Yup2Gold_ListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ButtonsListWnd",
		
		props =
		{
			name	= "list",
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
    				defName 			= "yup2GoldWnd_list",
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
	},

	btnPrototypeName = "Yup2Gold_SlotWnd",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "slot",
    		scrollObjName		= "",
    		animIdle			= "idle",
    	}
    },

    MAX_SLOTS = 5,

	listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS,
}


-- ------------------------------------------------------------
-- UI.Yup2Gold_SlotWnd
-- ------------------------------------------------------------

UI.Yup2Gold_SlotWnd = {}
local ygs = UI.Yup2Gold_SlotWnd

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Yup2Gold_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Yup2Gold_SlotWnd",
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
				defName 			= "yup2GoldWnd_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_big",
						layer		= "UI.Yup2Gold_SlotWnd.layers.GOLD_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "icon",
						layer		= "UI.Yup2Gold_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_rub",
						layer		= "UI.Yup2Gold_SlotWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "rub",
						layer		= "UI.Yup2Gold_SlotWnd.layers.PRICE_UNITS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_sml",
						layer		= "UI.Yup2Gold_SlotWnd.layers.GOLD_UNITS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.Yup2Gold_SlotWnd.layers.MOUSE_OVER_EFFECT",
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
				defName 			= "yup2GoldWnd_slot_ico",
				defaultAnimation	= "idle",	
			}}
		},

		-- GOLD_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- GOLD_UNITS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			visible			= false,
		},  

		-- PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_UNITS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "yup2GoldWnd_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.Yup2Gold_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.goldValMetaText:SetText( "", true )
	self:SetText( "", self.layers.PRICE_VAL )
	self:SetText( "", self.layers.PRICE_UNITS )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetMouseOver( false )
	                                       	
end


--
function UI.Yup2Gold_SlotWnd:Select()

	UI.ButtonsList_Btn.Select( self )

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

end


--
function UI.Yup2Gold_SlotWnd:OnShopReload()

	self:UpdateGoldVal( self:GetRecordData() )

end


--
function UI.Yup2Gold_SlotWnd:OnAccountAurasChanged()

	self:UpdateGoldVal( self:GetRecordData() )

end


-- ----------------------------------
-- const
-- ----------------------------------

ygs.layers =
{
    MAIN_EFFECT			= 0,
	ICO_EFFECT			= 1,
    GOLD_VAL			= 2,
	GOLD_UNITS			= 3,
    PRICE_VAL			= 4,
    PRICE_UNITS			= 5,
	MOUSE_OVER_EFFECT	= 6,
}

ygs.effectInfo =
{
	main =
	{
        animSel				= "select",
        animUnsel			= "idle",
      	bonusColorLocator	= "text_big_color",
	},

	ico =
	{
		icoSpriteName		= "ico",
	},
}

ygs.YUP_SLOT = true

ygs.strGoldUnits = UI:GetStringByName( "goldUnits" )

-- ----------------------------------
-- vars
-- ----------------------------------

ygs.goldValMetaText	= nil
ygs.goldUnitsOffset	= 0

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.Yup2Gold_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.goldValMetaText = UI.MetaText.GetNewInstance()	
	self.goldValMetaText:InitFromLayer( self, self.layers.GOLD_VAL ) 

	self:CalcGoldUnitsOffset()

end


--
function UI.Yup2Gold_SlotWnd:F_Shutdown()

	if self.goldValMetaText then
		self.goldValMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Yup2Gold_SlotWnd:CalcGoldUnitsOffset()

	local valLayerRect		= self:GetLayerRect( self.layers.GOLD_VAL )
	local valFont			= self:GetFont( self.layers.GOLD_VAL )
	local valFormatFlags	= self:GetTextFormatFlags( self.layers.GOLD_VAL )

	local unitsLayerRect	= self:GetLayerRect( self.layers.GOLD_UNITS )
	local unitsFont			= self:GetFont( self.layers.GOLD_UNITS )
	local unitsFormatFlags	= self:GetTextFormatFlags( self.layers.GOLD_UNITS )	

	local valTextRect = _G.MeasureText(
       	"A",
       	valFont,
       	valLayerRect,
       	valFormatFlags,
       	UI:Quat( 0, 0, 1024, 768 ) )		
	
	local unitsTextRect = _G.MeasureText(
       	"A",
       	unitsFont,
       	unitsLayerRect,
       	unitsFormatFlags,
       	UI:Quat( 0, 0, 1024, 768 ) )

    self.goldUnitsOffset = self:YToScreen( unitsTextRect.y ) - self:YToScreen( valTextRect.y )

end


--
function UI.Yup2Gold_SlotWnd:UpdateForData( data, bAnimated )

	self:UpdateMainAnimation( data )
	self:UpdateGoldVal( data )
	self:UpdatePrice( data )	
	self:UpdateIco( data )
	self:UpdateMouseOver()

end


--
function UI.Yup2Gold_SlotWnd:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local isSelected = self:IsSelected()
	local anim = isSelected and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel

	mainEffect:StartAnimation( anim )

end


--
function UI.Yup2Gold_SlotWnd:UpdateGoldVal( data )

	local baseVal	= data.goldPackInfo.value
	local bonusVal	= data.goldPackInfo.value * UI:GetGoldBonus()

	local strBonusVal = ""
	if bonusVal > 0 then

      	local bonusValColor = UI.WHITE_COLOR
      	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
      	if mainEffect then
      		bonusValColor = mainEffect:GetObjColor( self.effectInfo.main.bonusColorLocator )
      	end

		strBonusVal = string.format( "%s + %s%s",
			UI:Color2Str( bonusValColor ),
			UI:Num2StrSeparatedBy3( bonusVal ),
			UI:Color2Str( self:GetColor( self.layers.GOLD_VAL ) ) )

	end

	local strUnits = string.format( "$text [fontId %s][color 0x%08x][text %s][alignment CUSTOM_OFFSET][offset %f]$",
		self:GetFont( self.layers.GOLD_UNITS ),
		self:GetColor( self.layers.GOLD_UNITS ),
		self.strGoldUnits,
		self.goldUnitsOffset )

	local str = string.format( "%s%s %s", UI:Num2StrSeparatedBy3( baseVal ), strBonusVal, strUnits )

	self.goldValMetaText:SetText( str, true )

end


--
function UI.Yup2Gold_SlotWnd:UpdatePrice( data )

	local mode = UI.Yup2GoldWnd:GetMode()

	local price			= 0
	local priceUnits	= ""

	if mode == UI.Yup2GoldWnd.modes.YUP then
	
		priceUnits = UI:GetGurrency()
		price = UI:GetGoldPackYupPrice( data.goldPackInfo )

	elseif mode == UI.Yup2GoldWnd.modes.STEAM then

		priceUnits = string.lower( data.goldPackInfo.steamCurrency or "" )

		price = ( data.goldPackInfo.steamCost or 0 ) / 100
		price = UI:Round( price * 100 ) / 100

	elseif mode == UI.Yup2GoldWnd.modes.ARC then

		priceUnits = "zen"

		if type( data.goldPackInfo.arcCost ) == "number" then
			price = data.goldPackInfo.arcCost
		else
			sys.log( "UI.Yup2Gold_SlotWnd:UpdatePrice()[ERROR]: invalid type of \"arcCost\"; \"number\" expected, got \"%s\" ", type( data.goldPackInfo.arcCost ) )
		end

	else
		sys.log( "UI.Yup2Gold_SlotWnd:UpdatePrice()[ERROR]: unhandled mode: %s", mode )
	end

	local strPrice = UI:FNum2StrSeparatedBy3( price )
	self:SetText( strPrice, self.layers.PRICE_VAL )

	local strPriceUnits = UI:Currency2Str( priceUnits )
	self:SetText( strPriceUnits, self.layers.PRICE_UNITS )

end


--
function UI.Yup2Gold_SlotWnd:UpdateIco( data )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end

	icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI:GetGoldPackInfoIco( self:GetRecord() ) )

end


--
function UI.Yup2Gold_SlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Yup2Gold_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.Yup2GoldWnd.sounds.slotMouseOver )
	end

end


--
function UI.Yup2Gold_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Yup2Gold_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Yup2Gold_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Yup2Gold_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.Yup2Gold_SlotWnd:UpdateMetaTextPos()

	self.goldValMetaText:UpdateScreenOrgFromLayer( self, self.layers.GOLD_VAL )

end


--
function UI.Yup2Gold_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.GOLD_VAL then
		self.goldValMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- ------------------------------------------------------------
-- UI.Yup2Gold_DlcListWnd
-- ------------------------------------------------------------

UI.Yup2Gold_DlcListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ButtonsListWnd",

		props =
		{
			name	= "Yup2Gold_DlcListWnd",
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
    				defName 			= "yup2GoldWnd_dlcList",
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
	},

	btnPrototypeName = "Yup2Gold_DlcSlotWnd",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "slot_1_",
    		scrollObjName		= "",
    		animIdle			= "idle",
    	}
    },
    
    MAX_SLOTS = 6,

	listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS,
}


-- ------------------------------------------------------------
-- UI.Yup2Gold_DlcSlotWnd
-- ------------------------------------------------------------

UI.Yup2Gold_DlcSlotWnd = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Yup2Gold_DlcSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Yup2Gold_DlcSlotWnd",
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
				defName 			= "yup2GoldWnd_dlcSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",
						layer		= "UI.Yup2Gold_DlcSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.Yup2Gold_DlcSlotWnd.layers.BOUGHT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}		
			}}
		},

		-- BOUGHT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "yup2GoldWnd_dlcSlot_bought",
				defaultAnimation	= "idle",
			}},		
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "yup2GoldWnd_dlcSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.Yup2Gold_DlcSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.BOUGHT_EFFECT )

	self:SetMouseOver( false )

	self.tooltipData = nil
	                                       	
end


--
function UI.Yup2Gold_DlcSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Yup2Gold_DlcSlotWnd:IsDisabled()

	local data = self:GetRecordData()
	return data ~= nil and data.bBought

end


-- ----------------------------------
-- const
-- ----------------------------------

UI.Yup2Gold_DlcSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	BOUGHT_EFFECT		= 1,
	MOUSE_OVER_EFFECT	= 2,
}

UI.Yup2Gold_DlcSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName		= "ico6",
	},
}

-- ----------------------------------
-- vars
-- ----------------------------------

UI.Yup2Gold_DlcSlotWnd.tooltipData	= nil

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.Yup2Gold_DlcSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateBoughtEffect( data )
	self:UpdateTooltip( data )	
	self:UpdateMouseOver()

end


--
function UI.Yup2Gold_DlcSlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return 
	end

	local texName = string.format( "dlc_ico_%s", data.dlcName )
	local hTex = UI:GetTex( texName )

	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.Yup2Gold_DlcSlotWnd:UpdateBoughtEffect( data )

	self:SetLayerVisible( data.bBought, self.layers.BOUGHT_EFFECT )

end


--
function UI.Yup2Gold_DlcSlotWnd:UpdateTooltip( data )	

	local dlcLocalizedName = UI:GetDlcLocalizedName( data.dlcName )

	local caption = UI:GetStringByName( "shipDlcTooltip_caption" )
	caption = string.gsub( caption, "%$dlc_name%$", dlcLocalizedName )

	local textId = string.format( "dlc_%s_desc", data.dlcName )
	local text = UI:GetStringByName( textId )

	self.tooltipData = {}
	self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
	self.tooltipData.caption		= caption
	self.tooltipData.text			= text

end


--
function UI.Yup2Gold_DlcSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if not self:IsDisabled() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Yup2Gold_DlcSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.Yup2GoldWnd.sounds.slotMouseOver )
	end

end


--
function UI.Yup2Gold_DlcSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Yup2Gold_DlcSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


--
function UI.Yup2Gold_DlcSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- ------------------------------------------------------------------------
-- UI.Yup2Gold_BuyBtn, UI.Yup2Gold_CancelBtn
-- ------------------------------------------------------------------------

--
UI.Yup2Gold_BuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Yup2Gold_BuyBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^yup2gold_buyBtn",
   			},
   		}
	},
}


--
UI.Yup2Gold_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Yup2Gold_CancelBtn",
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

-- ------------------------------------------------------------------------
-- UI.Yup2Gold_CrossBtn
-- ------------------------------------------------------------------------

UI.Yup2Gold_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Yup2Gold_CrossBtn"
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.Yup2Gold_GiftIcovWnd
-- ------------------------------------------------------------------------

UI.Yup2Gold_GiftIcoWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name	= "Yup2Gold_GiftIcoWnd",
			style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
    				defName 			= "yup2GoldWnd_gift_ico",
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
	},

	layers =
	{
		MAIN_EFFECT	= 0,
	},

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "goldGift_tooltip_caption" ), text = UI:GetStringByName( "goldGift_tooltip_text" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}


-- -------------------------------------------------------------------
-- UI.Yup2Gold_BuyWnd
-- -------------------------------------------------------------------

UI.Yup2Gold_BuyWnd = {}
local ygb = UI.Yup2Gold_BuyWnd

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Yup2Gold_BuyWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "Yup2Gold_BuyWnd",
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
				defName 			= "shop_buy_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.WORK_EFFECT",
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
				defName 			= "shop_buy_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "product_name",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.GOLD_VAL",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fraction",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.GOLD_VAL",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_1",	
						wnd			= "UI.Yup2Gold_Buy_BuyBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",	
						wnd			= "UI.Yup2Gold_Buy_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "icon_license",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price10",
						layer		= "UI.Yup2Gold_BuyWnd.layers.PLAYER_MONEY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
				defName 			= "yup2GoldWnd_slot_ico",
				defaultAnimation	= "idle",
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
			text = "^yup2gold_caption",
		},

		-- GOLD_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.Yup2Gold_BuyWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL
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

		-- PLAYER_MONEY
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	},

	children =
	{
		"UI.Yup2Gold_Buy_BuyBtn",
		"UI.Yup2Gold_Buy_CancelBtn",
	}
}


-- -------------------------------------
-- interface funcitons
-- -------------------------------------

--
function UI.Yup2Gold_BuyWnd:Setup( goldPackInfo, goldPackIdx )

	self:Reset()

	self.goldPackInfo = goldPackInfo
	self.goldPackIdx = goldPackIdx

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.Yup2Gold_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdatePlayerMoney()
	self:UpdateBuyBtnState()

end   


--
function UI.Yup2Gold_BuyWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:UpdateGoldVal()

end


--
function UI.Yup2Gold_BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Yup2Gold_BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.Yup2Gold_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


-- -------------------------------------
-- const
-- -------------------------------------

ygb.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
	ICO_EFFECT		= 3,
    CAPTION			= 4,
    GOLD_VAL		= 5,
    PRICE_EFFECT	= 6,
    PRICE_VAL		= 7,
	PLAYER_MONEY	= 8,
}

ygb.effectInfo =
{
	ico =
	{
		icoSpriteName = "ico"
	},
}

ygb.sounds =
{
	hide	= "sound/ui/MsgHide",
}

-- -------------------------------------
-- vars
-- -------------------------------------

ygb.goldPackInfo 	= nil
ygb.goldPackIdx		= -1
ygb.priceMetaText	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Yup2Gold_BuyWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL ) 	

	self:Reset()

end


--
function UI.Yup2Gold_BuyWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Yup2Gold_BuyWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.Yup2Gold_BuyWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Yup2Gold_BuyWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.Yup2Gold_BuyWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Yup2Gold_BuyWnd:CreateControls()
end


--
function UI.Yup2Gold_BuyWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.Yup2Gold_BuyWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end    


--
function UI.Yup2Gold_BuyWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self.goldPackInfo = nil
	self.goldPackIdx = -1

	self:SetText( "", self.layers.GOLD_VAL )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	UI.Yup2Gold_Buy_BuyBtn:Enable( false )

	self.priceMetaText:SetText( "", true )
	self:SetText( "", self.layers.PLAYER_MONEY )

end


--
function UI.Yup2Gold_BuyWnd:FullUpdate()

	local goldPackInfo = self.goldPackInfo
	local goldPackIdx = self.goldPackIdx

	self:Reset()

	self.goldPackInfo = goldPackInfo
	self.goldPackIdx = goldPackIdx

	if not self.goldPackInfo then
		return
	end

	self:UpdateGoldVal()   
	self:UpdateIco()
	self:UpdatePrice()
	self:UpdatePlayerMoney()
	self:UpdateBuyBtnState()

end


--
function UI.Yup2Gold_BuyWnd:UpdateGoldVal()

	local baseVal	= self.goldPackInfo.value
	local bonusVal	= self.goldPackInfo.value * UI:GetGoldBonus()

	local val = baseVal + bonusVal
	local strVal = UI:Num2StrSeparatedBy3( val )

	local str = string.format( "%s %s", strVal, UI:GetStringByName( "goldUnits" ) )
	self:SetText( str, self.layers.GOLD_VAL )

end


--
function UI.Yup2Gold_BuyWnd:UpdateIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end

	icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI:GetGoldPackInfoIco( self.goldPackIdx ) )

end


--
function UI.Yup2Gold_BuyWnd:UpdatePrice()

	local price = 0

	if type( self.goldPackInfo.arcCost ) == "number" then
		price = self.goldPackInfo.arcCost
	else
		sys.log( "UI.Yup2Gold_BuyWnd:UpdatePrice()[ERROR]: invalid type of \"arcCost\"; \"number\" expected, got \"%s\" ", type( data.goldPackInfo.arcCost ) )
	end

	local strPriceUnits = UI:Currency2Str( "zen" )

	local strPrice = string.format( "%s %s", UI:FNum2StrSeparatedBy3( price ), strPriceUnits )
	self.priceMetaText:SetText( strPrice, true )

end


--
function UI.Yup2Gold_BuyWnd:UpdatePlayerMoney()

	local playerMoney = UI:GetPlayerArcCredits()

	local str = UI:GetStringByName( "playerArcBalance" )
	local strPlayerMoney = string.format( "%s %s", UI:Num2StrSeparatedBy3( playerMoney ), UI:Currency2Str( "zen" ) )
	str = string.gsub( str, "%$money%$", strPlayerMoney )

	self:SetText( str, self.layers.PLAYER_MONEY )

end


--
function UI.Yup2Gold_BuyWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Yup2Gold_Buy_BuyBtn then
		self:Buy()

	elseif wnd == UI.Yup2Gold_Buy_CancelBtn then
		UI:PlayGlobalSound( self.sounds.hide )
		self:Hide()
	end

	return true

end


--
function UI.Yup2Gold_BuyWnd:OnEnter( key, controllerIdx )

	if self.goldPackInfo and UI.Yup2Gold_Buy_BuyBtn:IsEnabled() then
		self:Buy()
	end

	return true

end


--
function UI.Yup2Gold_BuyWnd:OnEscape()

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()
	return true

end


--
function UI.Yup2Gold_BuyWnd:Buy()

	self:Hide()
	UI.Yup2GoldWnd:OnBuyGold( self.goldPackInfo )


end	


--
function UI.Yup2Gold_BuyWnd:UpdateBuyBtnState()

	UI.Yup2Gold_Buy_BuyBtn:Enable( self:IsEnoughMoney() )

end


--
function UI.Yup2Gold_BuyWnd:IsEnoughMoney()

	local playerMoney = UI:GetPlayerArcCredits()
	return self.goldPackInfo.arcCost <= playerMoney

end


--
function UI.Yup2Gold_BuyWnd:OnAccountAurasChanged()

	self:UpdateGoldVal()

end


-- ------------------------------------------------------------------------
-- UI.Yup2Gold_Buy_BuyBtn, UI.Yup2Gold_Buy_CancelBtn
-- ------------------------------------------------------------------------

--
UI.Yup2Gold_Buy_BuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Yup2Gold_Buy_BuyBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^yup2gold_buyBtn",
   			},
   		}
	},
}


--
UI.Yup2Gold_Buy_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Yup2Gold_Buy_CancelBtn",
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


-- ------------------------------------------------------------------------
-- UI.Yup2Gold_YuplayDlcBtn
-- ------------------------------------------------------------------------

UI.Yup2Gold_YuplayDlcBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name	= "Yup2Gold_YuplayDlcBtn"
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
    				defName 			= "yup2GoldWnd_yuplayDlcBtn",
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


-- ------------------------------------------------------------------------
-- UI.Yup2Gold_BuyArcDlcWnd
-- ------------------------------------------------------------------------

UI.Yup2Gold_BuyArcDlcWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "BuyArcDlcWnd",

		props =
		{
			name	= "Yup2Gold_BuyArcDlcWnd"
		}
	},

	mainWndName = "Yup2GoldWnd",
}