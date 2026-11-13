-- ----------------------------------------------------------------------------
--
-- Workfile: mailcreatewnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

-- TODO: другая срока в крутяшке

UI.MailCreateWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.MailCreateWnd.layers =
{
    MAIN_EFFECT					= 0,
    BG_EFFECT					= 1,
    WORK_EFFECT					= 2,
    CAPTION						= 3,
    RECEIVER_LABEL				= 4,
    THEME_LABEL					= 5,
    MSG_LABEL					= 6,
	TRADING_DEALS				= 7,
	TRADING_ITEMS_LABEL			= 8,
	TRADING_MIN_PRICE			= 9,
	TRADING_TAX					= 10,
	TRADING_FINAL_PRICE			= 11,
	TRADING_DESIRED_PRICE_LABEL	= 12,
    WAIT_EFFECT					= 13,
    WAIT_TEXT					= 14,
}

--
UI.MailCreateWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "MailCreateWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_CHANGE_ACTIVE_CYCLED,
	},

	layers =
	{
		firstOverlayLayer = UI.MailCreateWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "mailCreate_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.MailCreateWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",	
						layer		= "UI.MailCreateWnd.layers.WORK_EFFECT",
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
				defName 			= "mailCreate_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.MailCreateWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_1",	
						layer		= "UI.MailCreateWnd.layers.RECEIVER_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_2",	
						layer		= "UI.MailCreateWnd.layers.THEME_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_3",	
						layer		= "UI.MailCreateWnd.layers.MSG_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "input_1",	
						wnd			= "UI.MailCreate_ReceiverEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "input_2",	
						wnd			= "UI.MailCreate_ThemeEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "input_3",	
						wnd			= "UI.MailCreate_MsgEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",	
						wnd			= "UI.MailCreate_SendBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",	
						wnd			= "UI.MailCreate_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.MailCreate_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",	
						layer		= "UI.MailCreateWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_15",	
						wnd			= "UI.MailCreate_TradingModeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "get1",	
						layer		= "UI.MailCreateWnd.layers.TRADING_DEALS",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "att_title",	
						layer		= "UI.MailCreateWnd.layers.TRADING_ITEMS_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_12",
						layer		= "UI.MailCreateWnd.layers.TRADING_MIN_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "tax",
						layer		= "UI.MailCreateWnd.layers.TRADING_TAX",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "get",
						layer		= "UI.MailCreateWnd.layers.TRADING_FINAL_PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_22",
						layer		= "UI.MailCreateWnd.layers.TRADING_DESIRED_PRICE_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "input",	
						wnd			= "UI.MailCreate_TradingDesiredPriceEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "gold_icon",	
						wnd			= "UI.MailCreate_TradingDesiredPriceIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "attach_slots",
						wnd			= "UI.MailCreate_TradingAttachmentsListWnd",
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
			text			= UI:GetStringByName( "mailCreate_caption" )
		},

		-- RECEIVER_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "mailCreate_receiver" )
		},

		-- THEME_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "mailCreate_theme" )
		},

		-- MSG_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "mailCreate_msg" )
		},

		-- TRADING_DEALS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TRADING_ITEMS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "mailCreate_items" ),
		},

		-- TRADING_MIN_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- TRADING_TAX
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- TRADING_FINAL_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TRADING_DESIRED_PRICE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "mailCreate_priceInputLabel" ),
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
						layer		= "UI.MailCreateWnd.layers.WAIT_TEXT",
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

	children =
	{
		"UI.MailCreate_ReceiverEditWnd",
		"UI.MailCreate_ThemeEditWnd",
		"UI.MailCreate_MsgEditWnd",
		"UI.MailCreate_SendBtn",
		"UI.MailCreate_CancelBtn",
		"UI.MailCreate_CrossBtn",
		"UI.MailCreate_TradingModeBtn",
		"UI.MailCreate_TradingDesiredPriceEditWnd",
		"UI.MailCreate_TradingDesiredPriceIcoWnd",
		"UI.MailCreate_TradingAttachmentsListWnd",
		"UI.MailCreate_TradingDDIco",
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

-- theme и msg опциональны
function UI.MailCreateWnd:ShowNewLetter( receiverUid, theme, msg, receiverIsBot )

	if not UI.HangarWnd:IsOnScreen() then
		sys.log( "UI.MailCreateWnd:ShowNewLetter()[ERROR]: cannot show without hangar" )
		return
	end

	if type( receiverUid ) ~= "userdata" then
		sys.log( "UI.MailCreateWnd:ShowNewLetter()[ERROR]: invalid type of the 1-st parameter (\"receiverUid\"); \"userdata\" expected, got \"%s\"", type( receiverUid ) )
		receiverUid = UI.INVALID_U64_ID
	end

	if theme ~= nil then
		if type( theme ) ~= "string" then
			sys.log( "UI.MailCreateWnd:ShowNewLetter()[ERROR]: invalid type of the 2-nd parameter (\"theme\"); \"string\" or \"nil\" expected, got \"%s\"", type( theme ) )
			theme = nil
		end
	end

	if theme == nil then
		theme = ""
	end

	if msg ~= nil then
		if type( msg ) ~= "string" then
			sys.log( "UI.MailCreateWnd:ShowNewLetter()[ERROR]: invalid type of the 3-rd parameter (\"msg\"); \"string\" or \"nil\" expected, got \"%s\"", type( msg ) )
			msg = nil
		end
	end

	if msg == nil then
		msg = ""
	end
	
	if receiverIsBot ~= nil then
		if type( receiverIsBot ) ~= "boolean" then
			sys.log( "UI.MailCreateWnd:ShowNewLetter()[ERROR]: invalid type of the 4-th parameter (\"receiverIsBot\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( receiverIsBot) )
			receiverIsBot = nil
		end
	end
	
	if receiverIsBot == nil then
		receiverIsBot = false
	end

	-- если отправка предыдущего письма еще не закончена (не пришел ответ с сервера), а уже заказано создание нового письма,
	-- то его создание откладывается до тех пор, по не закончили с этим

	local autoData = nil

	if receiverUid ~= UI.INVALID_U64_ID then
		autoData = {}
		autoData.type			= self.autoDataTypes.PREDEFINED_RECEIVER
		autoData.receiverUid	= receiverUid
		autoData.receiverIsBot	= receiverIsBot
		autoData.theme			= theme
		autoData.msg			= msg
	end

	if not self:IsWaiting() then
		self:InitNewLetter( autoData )
		self.queuedAutoData = nil
	else		
		self.queuedAutoData = autoData
	end

	if not self:IsOnScreen() then
		self:Show()
	end

end


--
function UI.MailCreateWnd:ShowReplyToLetter( srcLetter )

	if not UI.HangarWnd:IsOnScreen() then
		sys.log( "UI.MailCreateWnd:ShowReplyToLetter()[ERROR]: cannot show without hangar" )
		return
	end

	if type( srcLetter ) ~= "table" then
		sys.log( "UI.MailCreateWnd:ShowReplyToLetter()[ERROR]: invalid type of the 1-st parameter (\"srcLetter\"); \"table\" expected, got \"%s\"", type( srcLetter ) )
		return
	end

	if type( srcLetter.sender ) ~= "userdata" then
		sys.log( "UI.MailCreateWnd:ShowReplyToLetter()[ERROR]: invalid letter format; invalid type of the field \"sender\"; \"userdata\" expected, got \"%s\"", type( srcLetter.sender ) )
		return
	end

	if srcLetter.sender == UI.INVALID_U64_ID then
		sys.log( "UI.MailCreateWnd:ShowReplyToLetter()[ERROR]: invalid sender in source letter; cannot reply" )		
		return
	end

	local autoData = {}
	autoData.type = self.autoDataTypes.REPLY_TO_LETTER
	autoData.srcLetter = srcLetter

	if not self:IsWaiting() then
		self:InitNewLetter( autoData )
		self.queuedAutoData = nil
	else		
		self.queuedAutoData = autoData
	end

	if not self:IsOnScreen() then
		self:Show()
	end

end


--
function UI.MailCreateWnd:MasterServer_OnMailSend( result, requestId, param1, param2, u64Param )

	if requestId == self.sendRequestId then

      	self.sendRequestId = 0
      	self:UpdateWaitingEffect()
    	self:UpdateEditWndsState()
      	self:UpdateSendBtnState()

    	if result == _G.MasterServer.MailOpResult.MOR_OK then
    		UI:PlayGlobalSound( self.sounds.send )
    	else
    		self:ShowMsgOnSendError( result )
    	end    

    	self:OnSendResult( result == _G.MasterServer.MailOpResult.MOR_OK )	
    	
	end

end


--
function UI.MailCreateWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
                     
	if result == 0 then
    	if self.autoReceiverUid ~= UI.INVALID_U64_ID and self.autoReceiverUid == uid then
    		self.receiverEditWnd:SetEditText( nickName )
    	end
	end

	if requestId == self.uidRequestId then

    	self.uidRequestId = 0
      	self:UpdateWaitingEffect()
    	self:UpdateEditWndsState()
      	self:UpdateSendBtnState()

    	local bSuccessSend = false

    	if result == 0 then
    		bSuccessSend = self:DoSendLetter( uid, self.themeToSend, self.msgToSend, self.tradingItemsToSend, self.tradingPriceToSend )
    	else
    		self:ShowMsgOnSendError( _G.MasterServer.MailOpResult.MOR_INVALID_RECEIVER )
    	end	

    	self.themeToSend		= ""
    	self.msgToSend 			= ""
		self.tradingItemsToSend	= nil
		self.tradingPriceToSend	= nil

    	if not bSuccessSend then
    		self:OnSendResult( false )
    	end

	end

end


-- нет самостоятельной подписки, вызывается из uigamefuncs
function UI.MailCreateWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:FullReset()

end


--
function UI.MailCreateWnd:OnEditMissMouse( editWnd )

	if editWnd:GetUiHandle() == UI:GetKeyboardFocus() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end

end


--
function UI.MailCreateWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if UI.serverData.playerCredits.raceRepChanged then

		if not self.bTradingMode then
			self:UpdateTradingModeBtn()
			self:UpdateTradingDeals()
		end

	end

end


--
function UI.MailCreateWnd:OnTradingAttachmentsChanged()

	self:UpdateTradingMinPrice()
	self:ResetDD()

end


--
function UI.MailCreateWnd:MasterServer_OnDealsNumChanged( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if not self.bTradingMode then
		self:UpdateTradingModeBtn()
		self:UpdateTradingDeals()
	end

end


--
function UI.MailCreateWnd:OnTradingWndResult( result, data )

	if not self:IsOnScreen() then
		sys.log( "UI.MailCreateWnd:OnTradingWndResult()[ERROR]: not on screen" )
		return
	end

	if result then

		local selSlotIdx = self.tradingAttachmentsList:GetSelectedRecord()
		if selSlotIdx ~= -1 then
		
			local iid = UI.INVALID_U64_ID
			if UI:IsDefModule( data.defName ) then
				iid = self:GetIidToSend( data.defName )
			end
		
			self.tradingAttachmentsList:SetItem( data.defName, iid, selSlotIdx, -1, 1 )
			
		else
			sys.log( "UI.MailCreateWnd:OnTradingWndResult()[ERROR]: no selected item slot" )
		end

	end

	self.tradingAttachmentsList:SelectRecord( -1 )

end


--
function UI.MailCreateWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	if not self.bTradingMode then
		return
	end

	self:UpdateTradingMinPrice()

end


--
function UI.MailCreateWnd:MasterServer_OnPlayerStats( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	if not self.bTradingMode then
		self:UpdateTradingModeBtn()
		self:UpdateTradingDeals()
	end

end


--
function UI.MailCreateWnd:OnDesiredPriceChanged()
	
	self:UpdateTradingTax()
	self:UpdateTradingFinalPrice()
	
end


-- -----------------------------------
-- const
-- -----------------------------------

UI.MailCreateWnd.sounds =
{
	show			= "sound/ui/btnClick",
	hide			= "sound/ui/MsgHide",
	send			= "sound/ui/apply",
	ddStart			= "",
	ddStop			= "",
	ddSet			= "sound/ui/moduleEquip",
	ddRemove		= "sound/ui/cancel",
	atachtSelect	= UI.sounds.btnClick,
}

UI.MailCreateWnd.autoDataTypes =
{
	PREDEFINED_RECEIVER	= 1,
	REPLY_TO_LETTER		= 2,
}

UI.MailCreateWnd.effectInfo =
{
	work =
	{
		animIdle		= "idle",
		animTradingMode = "idle_2",
	}
}

UI.MailCreateWnd.DD_MOUSE_THRESHOLD	= 5	-- в пределах смещения мыши на это расстояние drag_and_drop не начинается

UI.MailCreateWnd.ddStates =
{
	NONE		= 1,
	WAIT_MOUSE	= 2,
	DRAG		= 3,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.MailCreateWnd.receiverEditWnd			= nil
UI.MailCreateWnd.themeEditWnd				= nil
UI.MailCreateWnd.msgEditWnd					= nil
UI.MailCreateWnd.sendBtn					= nil
UI.MailCreateWnd.cancelBtn					= nil
UI.MailCreateWnd.crossBtn					= nil
UI.MailCreateWnd.autoReceiverUid			= UI.INVALID_U64_ID
UI.MailCreateWnd.autoReceiverIsBot			= false
UI.MailCreateWnd.queuedAutoData				= nil
UI.MailCreateWnd.uidRequestId				= 0
UI.MailCreateWnd.sendRequestId				= 0
UI.MailCreateWnd.themeToSend 				= ""
UI.MailCreateWnd.msgToSend 					= ""
UI.MailCreateWnd.tradingItemsToSend			= nil
UI.MailCreateWnd.tradingPriceToSend			= nil
UI.MailCreateWnd.tradingModeBtn				= nil
UI.MailCreateWnd.bTradingMode				= false
UI.MailCreateWnd.tradingDealsMetaText		= nil
UI.MailCreateWnd.tradingMinPriceMetaText	= nil
UI.MailCreateWnd.tradingDesiredPriceEditWnd	= nil
UI.MailCreateWnd.tradingDesiredPriceIcoWnd	= nil
UI.MailCreateWnd.tradingAttachmentsList		= nil
UI.MailCreateWnd.tradingTaxText				= nil
UI.MailCreateWnd.tradingFinalPriceMetaText	= nil
UI.MailCreateWnd.ddInfo =
{
	ddState		= UI.MailCreateWnd.ddStates.NONE,
	itemSlot	= nil,
	mouseX_abs	= 0,
	mouseY_abs	= 0,
}
UI.MailCreateWnd.ddIco						= nil
UI.MailCreateWnd.ddMouseThreshold_abs		= 0
UI.MailCreateWnd.ddAcceptItemSlot			= nil
UI.MailCreateWnd.wndUnderLastMouseDown		= nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.MailCreateWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

    self.receiverEditWnd			= UI.MailCreate_ReceiverEditWnd
    self.themeEditWnd				= UI.MailCreate_ThemeEditWnd
    self.msgEditWnd					= UI.MailCreate_MsgEditWnd
    self.sendBtn					= UI.MailCreate_SendBtn	
	self.cancelBtn					= UI.MailCreate_CancelBtn
	self.crossBtn					= UI.MailCreate_CrossBtn
	self.tradingModeBtn				= UI.MailCreate_TradingModeBtn
	self.tradingDesiredPriceEditWnd	= UI.MailCreate_TradingDesiredPriceEditWnd
	self.tradingDesiredPriceIcoWnd	= UI.MailCreate_TradingDesiredPriceIcoWnd
	self.tradingAttachmentsList		= UI.MailCreate_TradingAttachmentsListWnd

	UI.MailCreate_TradingDDIco:UnlinkFromParent()
	self.ddIco = UI.MailCreate_TradingDDIco

	self.tradingDealsMetaText = UI.MetaText.GetNewInstance()
	self.tradingDealsMetaText:InitFromLayer( self, self.layers.TRADING_DEALS ) 

	self.tradingMinPriceMetaText = UI.MetaText.GetNewInstance()
	self.tradingMinPriceMetaText:InitFromLayer( self, self.layers.TRADING_MIN_PRICE ) 
	
	self.tradingTaxMetaText = UI.MetaText.GetNewInstance()
	self.tradingTaxMetaText:InitFromLayer( self, self.layers.TRADING_TAX )
	
	self.tradingFinalPriceMetaText = UI.MetaText.GetNewInstance()
	self.tradingFinalPriceMetaText:InitFromLayer( self, self.layers.TRADING_FINAL_PRICE ) 

	self:FullReset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )

end


--
function UI.MailCreateWnd:F_Shutdown()

	if self.tradingDealsMetaText then
		self.tradingDealsMetaText:Clear()
	end

	if self.tradingMinPriceMetaText then
		self.tradingMinPriceMetaText:Clear()
	end
	
	if self.tradingTaxMetaText then
		self.tradingTaxMetaText:Clear()
	end
	
	if self.tradingFinalPriceMetaText then
		self.tradingFinalPriceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.MailCreateWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.MailCreateWnd:UpdateMetaTextPos()

	self.tradingDealsMetaText:UpdateScreenOrgFromLayer( self, self.layers.TRADING_DEALS )
	self.tradingMinPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.TRADING_MIN_PRICE )
	self.tradingTaxMetaText:UpdateScreenOrgFromLayer( self, self.layers.TRADING_TAX )
	self.tradingFinalPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.TRADING_FINAL_PRICE )

end


--
function UI.MailCreateWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TRADING_DEALS then
		self.tradingDealsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.TRADING_MIN_PRICE then
		self.tradingMinPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.TRADING_TAX then
		self.tradingTaxMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.TRADING_FINAL_PRICE then
		self.tradingFinalPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	end

end


--
function UI.MailCreateWnd:ResetLetter()

	self.receiverEditWnd:SetEditText( "" )		
	self.themeEditWnd:SetEditText( "" )
	self.msgEditWnd:SetEditText( "" )
	self:UpdateSendBtnState()

	self:ResetTradingControls()

	self.autoReceiverUid	= UI.INVALID_U64_ID
	self.autoReceiverIsBot	= false
	self.bTradingMode		= false

end


--
function UI.MailCreateWnd:FullReset()

	self:ResetLetter()

    self.queuedAutoData			= nil
    self.uidRequestId			= 0
    self.sendRequestId			= 0
    self.themeToSend 			= ""
    self.msgToSend 				= ""
	self.tradingItemsToSend		= nil
	self.tradingPriceToSend		= nil
	self.wndUnderLastMouseDown	= nil

	self:UpdateWaitingEffect()

end


--
function UI.MailCreateWnd:InitNewLetter( autoData )

	self:ResetLetter()

	if autoData then

    	if autoData.type == self.autoDataTypes.PREDEFINED_RECEIVER then

        	-- имя адресата автоматически подставляется в соответствующее поле ввода;
        	-- на данный момент имя может быть неизвестно и может понадобиться запрос на сервер;
        	-- поэтому uid запоминается - если имя не успели получить, а уже нажали кнопкку отправки, то используется этот uid

    		local nickname = UI:GetPlayerNicknameByUid( autoData.receiverUid )
    		self.receiverEditWnd:SetEditText( nickname )

    		self.autoReceiverUid = autoData.receiverUid
			self.autoReceiverIsBot = autoData.receiverIsBot

        	self.themeEditWnd:SetEditText( autoData.theme )
			self.msgEditWnd:SetEditText( autoData.msg )

    	elseif autoData.type == self.autoDataTypes.REPLY_TO_LETTER then

    		-- автоматически подставляется имя адресата

    		local nickname = UI:GetPlayerNicknameByUid( autoData.srcLetter.sender )
    		self.receiverEditWnd:SetEditText( nickname )

    		self.autoReceiverUid = autoData.srcLetter.sender
			self.autoReceiverIsBot = false


    		-- автоматически подставляется тема сообщения

    		local theme = UI:GetLetterTheme( autoData.srcLetter ) 

    		local strReplyPrefix = UI:GetStringByName( "mail_replyPrefix" )
    		theme = string.format( "%s %s", strReplyPrefix, theme )

    		self.themeEditWnd:SetEditText( theme )		

    	else
    		sys.log( "UI.MailCreateWnd:InitNewLetter()[ERROR]: unhandled autodata type: %s", tostring( autoData.type ) )
    	end

	end

	self:SetTradingMode( false )

end   


--
function UI.MailCreateWnd:UpdateSendBtnState()

	local bEnable = not self:IsWaiting()

	if bEnable ~= self.sendBtn:IsEnabled() then
		self.sendBtn:Enable( bEnable )
	end

end


--
function UI.MailCreateWnd:UpdateTradingModeBtn()

	if self.bTradingMode then
		sys.log( "UI.MailCreateWnd:UpdateTradingModeBtn()[ERROR]: in trading mode" )
		return
	end

	self:AddChild( self.tradingModeBtn )

	local bEnable		= true
	local tooltipData	= nil
	
	-- промо-аккаунт
	if bEnable then

		if _G.MasterServer_IsPromoAccount() then

			bEnable = false

			tooltipData =
			{
				tooltipType	= UI.tooltipTypes.TEXT_LARGE,
				caption		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_caption" ),
				text		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text_promoAccount" ),
			}
		end
		
	end

	-- необходимое количество сыгранных боев
	if bEnable then

		local minBattles			= UI:GetTradingSellerMinBattles()
		local need2StepAuth 		= UI:IsTradingSeller2StepAuthNeeded()
		local machinePlayerBattles	= _G.MasterServer_GetMachineAntibotCounter()
		local playerBattles 		= _G.MasterServer_GetAntibotCounter()
		local player2StepAuth 		= _G.MasterServer_Is2StepAuthEnabled()
		local bTradingEnabled = minBattles == -1
			or minBattles <= machinePlayerBattles
			or ( minBattles <= playerBattles and ( not need2StepAuth or player2StepAuth ) )
	
		if not bTradingEnabled then
		
			bEnable = false

			local actualPlayerBattles = machinePlayerBattles
			if playerBattles > machinePlayerBattles and ( not need2StepAuth or player2StepAuth ) then
				actualPlayerBattles = playerBattles
			end
	
			local tooltipText = UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text_invalidNumBattles" )
			
			local strNumBattles = string.format( "%d/%d", actualPlayerBattles, minBattles )
			local baseColor = UI.TooltipWnd_shared:GetTextColor()
			strNumBattles = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), strNumBattles, UI:Color2Str( baseColor ) )
			
			local numSubst = 0
			tooltipText, numSubst = string.gsub( tooltipText, "%$num_battles%$", strNumBattles )
			if numSubst == 0 then
				sys.log( "UI.MailCreateWnd:UpdateTradingModeBtn()[ERROR]: cannot find placeholder '$num_battles$' in string 'mailCreate_tradingModeBtn_tooltip_text_invalidNumBattles'" )
				tooltipText = string.format( "[INVALID STRING]Num battles required: %s", strNumBattles )
			end

			if playerBattles > machinePlayerBattles and need2StepAuth and not player2StepAuth then
				local text2stepAuth = UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text_2stepAuthNumBattles" )
				local str2stepAuthNumBattles = string.format( "%d/%d", playerBattles, minBattles )
				str2stepAuthNumBattles = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), str2stepAuthNumBattles, UI:Color2Str( baseColor ) )
	
				local numSubst = 0
				text2stepAuth, numSubst = string.gsub( text2stepAuth, "%$num_battles%$", str2stepAuthNumBattles )
				if numSubst == 0 then
					sys.log( "UI.MailCreateWnd:UpdateTradingModeBtn()[ERROR]: cannot find placeholder '$num_battles$' in string 'mailCreate_tradingModeBtn_tooltip_text_2stepAuthNumBattles'" )
					text2stepAuth = string.format( "[INVALID STRING]Num battles required: %s", str2stepAuthNumBattles )
				end
				
				tooltipText	= string.format( "%s|%s", tooltipText, text2stepAuth )
			end
	
			tooltipData =
			{
				tooltipType	= UI.tooltipTypes.TEXT_LARGE,
				caption		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_caption" ),
				text		= tooltipText,
			}
	
		end
		
	end
	
	-- лимит сделок
	if bEnable then
	
		if UI:GetTradingDealsMax() ~= 0 then
	
			if UI:GetTradingDealsLeft() == 0 then

				bEnable = false

				tooltipData =
				{
					tooltipType	= UI.tooltipTypes.TEXT_LARGE,
					caption		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_caption" ),
					text		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text" ),
				}
				
			end

		end
		
	end
	
	-- тултип на доступной кнопке
	if bEnable then
	
		if UI:GetTradingDealsMax() ~= 0 then
	
			tooltipData =
			{
				tooltipType	= UI.tooltipTypes.TEXT_LARGE,
				caption		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_caption" ),
				text		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text" ),
			}
			
		end

	end

	self.tradingModeBtn:SetGray( not bEnable )
	self.tradingModeBtn:SetTooltipData( tooltipData )

end


--
function UI.MailCreateWnd:UpdateTradingDeals()

	if self.bTradingMode then
		sys.log( "UI.MailCreateWnd:UpdateTradingDeals()[ERROR]: in trading mode" )
		return
	end

	local minBattles			= UI:GetTradingSellerMinBattles()
	local need2StepAuth 		= UI:IsTradingSeller2StepAuthNeeded()
	local machinePlayerBattles	= _G.MasterServer_GetMachineAntibotCounter()
	local playerBattles 		= _G.MasterServer_GetAntibotCounter()
	local player2StepAuth 		= _G.MasterServer_Is2StepAuthEnabled()
	local bNumBattlesFit = minBattles ~= -1	and (
		machinePlayerBattles >= minBattles
		or ( playerBattles >= minBattles and ( not need2StepAuth or player2StepAuth ) )
	)

	if not bNumBattlesFit then

		self.tradingDealsMetaText:SetText( "", true )
		self:SetLayerVisible( false, self.layers.TRADING_DEALS )

	else
	
		if UI:GetTradingDealsMax() ~= 0 then
 
			self:SetLayerVisible( true, self.layers.TRADING_DEALS )

			local color = self:GetColor( self.layers.TRADING_DEALS )

			local str = string.format( "%s: %d", UI:GetStringByName( "mailCreate_tradingDeals" ), UI:GetTradingDealsLeft() )
			local strLink = string.format( "$link [type CUSTOM_TEXT][params {text=\"%s\", tooltipTextId=\"mailCreate_tradingModeBtn_tooltip_text\", tooltipCaptionId=\"mailCreate_tradingModeBtn_tooltip_caption\", colorSel=%u, colorUnsel=%u}]$", str, color, color )

			self.tradingDealsMetaText:SetText( strLink, true )
			
		else
		
			self.tradingDealsMetaText:SetText( "", true )
			self:SetLayerVisible( false, self.layers.TRADING_DEALS )

		end

	end	

end


--
function UI.MailCreateWnd:InitTradingAttachments()

	self:SetLayerVisible( true, self.layers.TRADING_ITEMS_LABEL )

	self:AddChild( self.tradingAttachmentsList )
	self.tradingAttachmentsList:Init()

end


--
function UI.MailCreateWnd:UpdateTradingMinPrice()

	if not self.bTradingMode then
		sys.log( "UI.MailCreateWnd:UpdateTradingMinPrice()[ERROR]: not in trading mode" )
		return
	end

	self:SetLayerVisible( true, self.layers.TRADING_MIN_PRICE )

	local minPrice = self:GetTradingMinPrice()

	local priceInfo =
	{
		priceType 	= _G.GameStore.CreditsType.CT_GOLD,
		val			= minPrice,
		bIsBuyPrice	= false,
	}

	local strValLink = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.TRADING_MIN_PRICE ), nil, nil, true, nil )
	local str = string.format( "%s: %s", UI:GetStringByName( "mailCreate_tradingMinPrice" ), strValLink )

	self.tradingMinPriceMetaText:SetText( str, true )

end


--
function UI.MailCreateWnd:UpdateTradingTax()

	if not self.bTradingMode then
		sys.log( "UI.MailCreateWnd:UpdateTradingTax()[ERROR]: not in trading mode" )
		return
	end

	self:SetLayerVisible( true, self.layers.TRADING_TAX )
	
	local tradeMoney = _G.MasterServer_GetTradeMoney()	-- возвращает u64
	local desiredPrice = self:GetTradingDesiredPrice()

	local currentTax = UI:GetTax( tradeMoney )
	local futureTax = UI:GetTax( tradeMoney + desiredPrice )
	
	local currentTaxFixed = UI:Round( currentTax * 100 )
	local futureTaxFixed = UI:Round( futureTax * 100 )
	
	local str = string.format( "%s: %s%% (%s%%)", UI:GetStringByName( "mailCreate_tradingTax" ), currentTaxFixed, futureTaxFixed )
	local strLinkTax = string.format( "$link [type CUSTOM_TEXT][params {text=\"%s\", tooltipTextId=\"trading_taxTooltip_text\", tooltipCaptionId=\"trading_taxTooltip_caption\", colorSel=%u, colorUnsel=%u}]$", str, self:GetColor( self.layers.TRADING_TAX ), self:GetColor( self.layers.TRADING_TAX ) )

	self.tradingTaxMetaText:SetText( strLinkTax, true )

end


--
function UI.MailCreateWnd:UpdateTradingFinalPrice()

	if not self.bTradingMode then
		sys.log( "UI.MailCreateWnd:UpdateTradingFinalPrice()[ERROR]: not in trading mode" )
		return
	end

	self:SetLayerVisible( true, self.layers.TRADING_FINAL_PRICE )
	
	local tradeMoney = _G.MasterServer_GetTradeMoney()	-- возвращает u64
	local desiredPrice = self:GetTradingDesiredPrice()
	
	local taxForPrice = UI:GetTaxForPrice( tradeMoney, desiredPrice )
	local finalPrice = desiredPrice - taxForPrice
	local percentTax = taxForPrice > 0 and taxForPrice / desiredPrice or 0
	
	local priceInfo =
	{
		priceType 	= _G.GameStore.CreditsType.CT_GOLD,
		val			= finalPrice,
		bIsBuyPrice	= false,
	}

	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.TRADING_FINAL_PRICE ), nil, nil, true, nil )
	
	-- округляется до одного знака после запятой в большую сторону SC-112434#focus=streamItem-4-613073.0-0
	local taxFixed = percentTax * 100
	taxFixed = math.ceil( taxFixed * 10 ) / 10
	local strTax = string.format( "%.01f", taxFixed )
	
	local str = string.format( "%s: %s (-%s%%)", UI:GetStringByName( "mailCreate_tradingSum" ), strPrice, strTax )
	
	self.tradingFinalPriceMetaText:SetText( str, true )

end


--
function UI.MailCreateWnd:InitTradingDesiredPrice()

	self:SetLayerVisible( true, self.layers.TRADING_DESIRED_PRICE_LABEL )
	self:AddChild( self.tradingDesiredPriceEditWnd )
	self:AddChild( self.tradingDesiredPriceIcoWnd )

end


--
function UI.MailCreateWnd:IsWaiting()

	return self.uidRequestId ~= 0 or self.sendRequestId ~= 0

end


--
function UI.MailCreateWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.MailCreateWnd:F_OnEventEditChange( hSender, eventSrc )

	self:UpdateSendBtnState()

	-- если пользователь вручную изменил автоматически подставленное имя, то стартовый uid сбрасывается,
	-- и получается заново из введенного имени при отправке, как если бы его и не было

	if hSender == self.receiverEditWnd:GetUiHandle() then

		if eventSrc ~= UI.EVENT_SRC_UNKNOWN then
			self.autoReceiverUid = UI.INVALID_U64_ID
			self.autoReceiverIsBot = false
		end

	elseif hSender == self.tradingDesiredPriceEditWnd:GetUiHandle() then
	
		self:OnDesiredPriceChanged()

	end

end


--
function UI.MailCreateWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:ResetDD()

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.sendBtn then
		self:TrySendLetter()
	              
	elseif wnd == self.cancelBtn then
		self:Close()

	elseif wnd == self.crossBtn then
		self:Close()

	elseif wnd == self.tradingModeBtn then

		if not self.tradingModeBtn:IsGray() then
			self:SetTradingMode( true )
		end

	elseif UI:IsWndKindOf( wnd, "MailCreate_TradingAttachmentSlotWnd" ) and wnd ~= self.ddIco then

		if not self:IsWaiting() then

			if wnd:GetRecordData().defName ~= "" then
            	self:SetDDState_WAIT_MOUSE( wnd, mouseX, mouseY )
			end

		end

	end

	return true

end


--
function UI.MailCreateWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if self.ddInfo.ddState == self.ddStates.DRAG then

		if not self:IsWaiting() then

    		local slotWnd = self:GetTradingAttachmentSlotUnderMouse( mouseX, mouseY )

    		-- уронили над принимающим слотом -> экипировка
    		if self.ddAcceptItemSlot and slotWnd == self.ddAcceptItemSlot then
    			self:SetDDItem()
    			UI:PlayGlobalSound( self.sounds.ddSet )
    			
    		-- уронили над непринимающим слотом -> без последствий
    		elseif slotWnd then
    			self:ResetDD()
				if self.sounds.ddStop and self.sounds.ddStop ~= "" then
    				UI:PlayGlobalSound( self.sounds.ddStop )
				end

    		-- уронили в любом другом месте -> разэкипировка
    		else
    			self:RemoveDDItem()
    			UI:PlayGlobalSound( self.sounds.ddRemove )
    		end

		else
    		self:ResetDD()
			if self.sounds.ddStop and self.sounds.ddStop ~= "" then
    			UI:PlayGlobalSound( self.sounds.ddStop )
			end
		end

	else

    	local slotWnd = nil

		if self.ddInfo.ddState ~= self.ddStates.NONE then
			self:ResetDD()
    		slotWnd = self:GetTradingAttachmentSlotUnderMouse( mouseX, mouseY )	-- при драг-энд-дропе мышь капчурится окном MailCreateWnd, поэтому mouse up приходит для него
		else
        	if UI:IsWndKindOf( w, "MailCreate_TradingAttachmentSlotWnd" ) then
        		slotWnd = w
        	end
		end

		if slotWnd and slotWnd == self.wndUnderLastMouseDown then

        	if slotWnd:IsSelected() and UI.TradingWnd:IsOnScreen() and UI.TradingWnd:GetMainWndName() == self:GetName() then

				self.tradingAttachmentsList:SelectRecord( -1 )

        	else

    			if not self:IsWaiting() then

					if not slotWnd:IsSelected() then
	    				self.tradingAttachmentsList:SelectRecord( slotWnd:GetRecord() )
						UI:PlayGlobalSound( self.sounds.atachtSelect )
					end

    			end

        	end

		end

	end

	return false

end


--
function UI.MailCreateWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return false
	end

	if self.ddInfo.ddState == self.ddStates.DRAG then

		self.ddIco:UpdatePos( self:XToScreen( mouseX ), self:YToScreen( mouseY ) )
		self:UpdateAcceptItemSlot( mouseX, mouseY )

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
function UI.MailCreateWnd:TrySendLetter()

	if self:IsWaiting() then
		return
	end

	local nickname = self.receiverEditWnd:GetEditText()

	if nickname == "" then
		self:ShowMsgOnSendError( _G.MasterServer.MailOpResult.MOR_INVALID_RECEIVER )
		return
	end

	local theme = self.themeEditWnd:GetEditText()
	local msg = self.msgEditWnd:GetEditText()

	if theme == "" or msg == "" then
		self:ShowMsgOnSendError( _G.MasterServer.MailOpResult.MOR_EMPTY_SUBJECT_OR_BODY )
		return
	end	

	local tradingItems	= nil
	local tradingPrice	= nil

	if self.bTradingMode then

		local desiredPrice	= self:GetTradingDesiredPrice()
		local items			= self:GetTradingAttachments()

		if desiredPrice > 0 and not next( items ) then
			UI:ShowErrorMsg( "msg_tradingError_noAttachments" )
			return
		end		

		if desiredPrice < self:GetTradingMinPrice() then
			UI:ShowErrorMsg( "msg_tradingError_smallPrice" )
			return
		end

		local maxPrice = UI:GetTradingLetterMaxGoldPrice()
		if maxPrice ~= 0 and desiredPrice > maxPrice then

			local msg = UI:GetStringByName( "msg_tradingError_largePrice" )
			local strMaxPrice = UI:Num2StrSeparatedBy3( maxPrice )

			local numSubst = 0
			msg, numSubst = string.gsub( msg, "%$val%$", strMaxPrice )

			if numSubst == 0 then
				sys.log( "UI.MailCreateWnd:TrySendLetter()[ERROR]: cannot find placeholder \"$val$\" in string \"msg_tradingError_largePrice\"" )
				msg = string.format( "[INVALID STRING] The sum must be less than %s.", strMaxPrice )
			end

			UI:ShowErrorMsg2( msg )

			return

		end

		if next( items ) then
			tradingItems = items
			tradingPrice = desiredPrice
		end

	end


	if not self.autoReceiverIsBot then
	
		local uid = self.autoReceiverUid
		if uid == UI.INVALID_U64_ID then

			-- перед тем как инициировать отправку, сначала получается uid адресата по имени

			local uidRequestId = 0		
			uid, uidRequestId = _G.MasterServer_GetUid( nickname )

			if uid == UI.INVALID_U64_ID then
			
				if uidRequestId ~= 0 then

					self.uidRequestId = uidRequestId
					self:UpdateWaitingEffect()
					self:UpdateEditWndsState()
					self:UpdateSendBtnState()

					self.themeToSend		= theme
					self.msgToSend			= msg
					self.tradingItemsToSend	= tradingItems
					self.tradingPriceToSend	= tradingPrice

				else
					self:ShowMsgOnSendError( _G.MasterServer.MailOpResult.MOR_INVALID_RECEIVER )
					sys.log( "UI.MailCreateWnd:TrySendLetter()[ERROR]: fail to request uid" )
				end

				return

			end

		end

		-- uid есть, производится отправка
		local bSuccessSend = self:DoSendLetter( uid, theme, msg, tradingItems, tradingPrice )

		if not bSuccessSend then
			self:OnSendResult( false )
		end
		
	else
		self:OnSendResult( true )
	end

end


--
function UI.MailCreateWnd:DoSendLetter( uid, theme, msg, tradingItems, tradingPrice )

	if tradingItems and tradingPrice then
	
		-- перевод предметов в формат, который требуется в cpp функции
		
		local resources	= {}
		local iids		= {}
		
		for idx, itemInfo in pairs( tradingItems ) do
		
			if UI:IsDefResource( itemInfo.defName ) or UI:IsDefBlueprint( itemInfo.defName ) then
		
				if not resources[ itemInfo.defName ] then
					resources[ itemInfo.defName ] = 1
				else
					resources[ itemInfo.defName ] = resources[ itemInfo.defName ] + 1
				end
				
			elseif UI:IsDefModule( itemInfo.defName ) then
				table.insert( iids, itemInfo.iid )
			
			else
				sys.log( "UI.MailCreateWnd:DoSendLetter()[ERROR]: unhandled item dype (def %s)", itemInfo.defName )
			end
			
		end

		self.sendRequestId = _G.MasterServer_MailSend( uid, theme, msg, tradingPrice, resources, iids )
		
	else
		self.sendRequestId = _G.MasterServer_MailSend( uid, theme, msg )
	end

	if self.sendRequestId == 0 then
		self:ShowMsgOnSendError( _G.MasterServer.MailOpResult.MOR_ERROR )

	else
		self:UpdateWaitingEffect()
		self:UpdateEditWndsState()

		self:UpdateSendBtnState()
	end

	return self.sendRequestId ~= 0

end


--
function UI.MailCreateWnd:OnSendResult( bSuccess )

	local bNewLetter = false
	if self.queuedAutoData then

		if self:IsOnScreen() then
			bNewLetter = true
			self:InitNewLetter( self.queuedAutoData )
		else
			sys.log( "UI.MailCreateWnd:OnSendResult()[ERROR]: has queued data but is not on screen" )
		end	

		self.queuedAutoData = nil

	end

	if not bNewLetter then

		-- при успешной отправке письма окно закрывается
		if bSuccess then

    		self:ResetLetter()

			if self:IsOnScreen() then
				self:Hide()
			end

		-- при ошибке отправки письма, если окно все еще на экране, то оно не закрывается и содержимое письма не удаляется,
		-- чтобы пользователь смог поправить какие-то данные при возможности (например, неправильное имя игрока),
		-- или подождать, пока ему можно будет послать письмо (сейчас письма можно посылать не чаще определенного промежутка времени)
		else

    		if not self:IsOnScreen() then
    			self:ResetLetter()
    		end

		end

	end

end  


--
function UI.MailCreateWnd:ShowMsgOnSendError( errorCode )

	UI:ShowErrorMsg( "msg_mailSendError", errorCode, "_G.MasterServer.MailOpResult" )

end


--
function UI.MailCreateWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	UI:PlayGlobalSound( self.sounds.show )

	self:UpdateMetaTextPos()

	if not self.bTradingMode then
		self:UpdateTradingModeBtn()
		self:UpdateTradingDeals()
	end

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.MailCreateWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	-- если надо было создать письмо, но это так и не было сделано из-за того, что предыдущее еще не отправлено,
	-- и окно уже закрыли, то поставленное на очередь письмо сбрасывается

	self.queuedAutoData = nil

	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

	if not UI:IsInRemovingAllWindows() then
		self:ResetDD()
	end

end


--
function UI.MailCreateWnd:UpdateEditWndsState()

	local bEnable = not self:IsWaiting()

	if bEnable then
    	self.receiverEditWnd:RemoveStyle( UI.WS_DISABLE )
    	self.themeEditWnd:RemoveStyle( UI.WS_DISABLE )
    	self.msgEditWnd:RemoveStyle( UI.WS_DISABLE )
		self.tradingDesiredPriceEditWnd:RemoveStyle( UI.WS_DISABLE )

	else
    	self.receiverEditWnd:AddStyle( UI.WS_DISABLE )
    	self.themeEditWnd:AddStyle( UI.WS_DISABLE )
    	self.msgEditWnd:AddStyle( UI.WS_DISABLE )
		self.tradingDesiredPriceEditWnd:AddStyle( UI.WS_DISABLE )
	end

end


--
function UI.MailCreateWnd:Close()

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()

end


--
function UI.MailCreateWnd:OnEscape()

	if self.tradingAttachmentsList:GetSelectedRecord() ~= -1 then
		self.tradingAttachmentsList:SelectRecord( -1 )
	else
		self:Close()
	end
	
	return true

end


--
function UI.MailCreateWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key == UI.Keys.KEY_TAB and UI.TradingWnd:IsOnScreen() and UI.TradingWnd:GetMainWndName() == self:GetName() then
		return true
	end

	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
		return true
	else 
		return self:HandleKey( key, -2 )
	end

end


--
function UI.MailCreateWnd:F_OnEventSaveUiState()

	UI.store.MailCreateWnd =
	{
		autoReceiverUid		= self.autoReceiverUid,
		autoReceiverIsBot	= self.autoReceiverIsBot,
		queuedAutoData		= self.queuedAutoData,
		uidRequestId		= self.uidRequestId,
		sendRequestId		= self.sendRequestId,
		themeToSend 		= self.themeToSend,
		msgToSend 			= self.msgToSend,
		tradingItemsToSend	= self.tradingItemsToSend,
		tradingPriceToSend	= self.tradingPriceToSend,
	}

	if self:IsOnScreen() then

		UI.store.MailCreateWnd.content =
		{
    		receiverText		= self.receiverEditWnd:GetEditText(),
    		themeText			= self.themeEditWnd:GetEditText(),
    		msgText				= self.msgEditWnd:GetEditText(),
    		bTradingMode		= self.bTradingMode,			
		}

		if self.bTradingMode then

			UI.store.MailCreateWnd.content.tradingDesiredPriceEditText = self.tradingDesiredPriceEditWnd:GetEditText()

			UI.store.MailCreateWnd.content.items = {}

			for recordIdx = 1, self.tradingAttachmentsList:GetNumRecords() do
				table.insert( UI.store.MailCreateWnd.content.items, self.tradingAttachmentsList:GetRecordData( recordIdx ) )
			end

		end		

	end

end


--
function UI.MailCreateWnd:F_OnEventRestoreUiState()

	if UI.store.MailCreateWnd then

		self.autoReceiverUid		= UI.store.MailCreateWnd.autoReceiverUid
		self.autoReceiverIsBot		= UI.store.MailCreateWnd.autoReceiverIsBot
		self.queuedAutoData			= UI.store.MailCreateWnd.queuedAutoData
		self.uidRequestId			= UI.store.MailCreateWnd.uidRequestId
		self.sendRequestId			= UI.store.MailCreateWnd.sendRequestId
		self.themeToSend 			= UI.store.MailCreateWnd.themeToSend
		self.msgToSend 				= UI.store.MailCreateWnd.msgToSend
		self.tradingItemsToSend		= UI.store.MailCreateWnd.tradingItemsToSend
		self.tradingPriceToSend		= UI.store.MailCreateWnd.tradingPriceToSend

		if UI.store.MailCreateWnd.content then

			self:InitNewLetter( nil )
	
			self.receiverEditWnd:SetEditText( UI.store.MailCreateWnd.content.receiverText )
			self.themeEditWnd:SetEditText( UI.store.MailCreateWnd.content.themeText )
			self.msgEditWnd:SetEditText( UI.store.MailCreateWnd.content.msgText )
	
			if UI.store.MailCreateWnd.content.bTradingMode then

				self:SetTradingMode( true )

				self.tradingDesiredPriceEditWnd:SetEditText( UI.store.MailCreateWnd.content.tradingDesiredPriceEditText )

				for slotIdx, data in pairs( UI.store.MailCreateWnd.content.items ) do
					self.tradingAttachmentsList:SetItem( data.defName, data.iid, slotIdx, -1, data.count )
				end

			end

		end

		UI.store.MailCreateWnd = nil

	end

end


--
function UI.MailCreateWnd:SetTradingMode( bTradingMode )

	self.bTradingMode = bTradingMode	

	self:ResetTradingControls()

	if self.bTradingMode then

		self:InitTradingAttachments()
		self:UpdateTradingMinPrice()
		self:InitTradingDesiredPrice()
		self:UpdateTradingTax()
		self:UpdateTradingFinalPrice()

	else

		self:UpdateTradingModeBtn()
		self:UpdateTradingDeals()

	end

	self:RecalcLayout()

end


--
function UI.MailCreateWnd:ResetTradingControls()

	self.tradingModeBtn:UnlinkFromParent()

	self:SetLayerVisible( false, self.layers.TRADING_ITEMS_LABEL )
	self:SetLayerVisible( false, self.layers.TRADING_DESIRED_PRICE_LABEL )

	self.tradingDealsMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.TRADING_DEALS )

	self.tradingMinPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.TRADING_MIN_PRICE )
	
	self.tradingTaxMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.TRADING_TAX )
	
	self.tradingFinalPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.TRADING_FINAL_PRICE )

	self.tradingDesiredPriceEditWnd:SetEditText( "" )
	self.tradingDesiredPriceEditWnd:UnlinkFromParent()

	self.tradingDesiredPriceIcoWnd:UnlinkFromParent()

	self.tradingAttachmentsList:Clear()
	self.tradingAttachmentsList:UnlinkFromParent()

	self:ResetDD()

	self:HideTradingWnd()
	
end


--
function UI.MailCreateWnd:RecalcLayout()

	local anim = self.bTradingMode and self.effectInfo.work.animTradingMode or self.effectInfo.work.animIdle

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:StartAnimation( anim )
	end

end


--
function UI.MailCreateWnd:GetTradingAttachments()

	local items = {}

	for recordIdx = 1, self.tradingAttachmentsList:GetNumRecords() do

		local data = self.tradingAttachmentsList:GetRecordData( recordIdx )

		if data.defName ~= "" then
			table.insert( items, data )
		end

	end

    return items 

end


--
function UI.MailCreateWnd:GetTradingDesiredPrice()

	local price = 0

	if not self.tradingDesiredPriceEditWnd:IsChildOf( self ) then
		sys.log( "UI.MailCreateWnd:GetTradingDesiredPrice()[ERROR]: input wnd is not on screen" )
		return price
	end

	local text = self.tradingDesiredPriceEditWnd:GetEditText()
	if text ~= "" then

		price = tonumber( text )

		if type( price ) ~= "number" then
			sys.log( "UI.MailCreateWnd:GetTradingDesiredPrice()[ERROR]: cannot convert string \"%s\" to number", text )
			price = 0
		end

	end

	return price

end


--
function UI.MailCreateWnd:GetTradingMinPrice()

	local minPrice = 0

	local items = self:GetTradingAttachments()
	for idx, itemInfo in pairs( items ) do
		minPrice = minPrice + UI:GetTradingItemMinGoldPrice( itemInfo.defName ) * itemInfo.count
	end

	return minPrice

end




--
function UI.MailCreateWnd:RecalcAbsVals()

	UI.FullScreenWnd.RecalcAbsVals( self )

	self.ddMouseThreshold_abs = UI:XToAbs( UI:XTo1024x768( self.DD_MOUSE_THRESHOLD, { x = 1280, y = 720 } ) )

end


--
function UI.MailCreateWnd:ResetDD()

	if self.ddInfo.ddState == self.ddStates.NONE then
		return
	end

	self.ddInfo.ddState		= self.ddStates.NONE
	self.ddInfo.itemSlot	= nil
	self.ddInfo.mouseX_abs	= 0
	self.ddInfo.mouseY_abs	= 0

	self.ddAcceptItemSlot = nil

	-- убирается подсветка слотов корабля
	for slotIdx = 1, self.tradingAttachmentsList:GetNumRecords() do

		local slotWnd = self.tradingAttachmentsList:GetButtonForRecord( slotIdx )
		if slotWnd and slotWnd:IsChildOf( self ) then
			slotWnd:OnDDStop()
		end

	end

	-- скрывается drag-and-drop иконка
	self.ddIco:Reset()
	self.ddIco:UnlinkFromParent()

	-- отаускается мышь
	self:ReleaseMouse()

end


--
function UI.MailCreateWnd:SetDDState_DRAG()

	if self.ddInfo.ddState ~= self.ddStates.WAIT_MOUSE then
		sys.log( "UI.MailCreateWnd:SetDDState_DRAG()[ERROR]: invalid states sequence" )
		return
	end

	self.ddInfo.ddState	= self.ddStates.DRAG

	-- показывается drag-and-drop иконка
	UI.Root:AddChild( self.ddIco )	-- линкуется к руту, т.к. д.б. поверх остальных чайлдов ангара, а не только эквипмента

	self.ddIco:Setup( self.ddInfo.itemSlot:GetRecordData() )

	self.ddIco:UpdatePos( UI:GetMouseX(), UI:GetMouseY() )

	-- подсветка подходящих слотов корабля
	for slotIdx = 1, self.tradingAttachmentsList:GetNumRecords() do

		local slotWnd = self.tradingAttachmentsList:GetButtonForRecord( slotIdx )
		if slotWnd and slotWnd:IsChildOf( self ) then

    		slotWnd:OnDDStart()

    		if self:IsItemSlotDDFit( slotWnd ) then
    			slotWnd:SetDDFit( true )
    		end

		end

	end

	-- скрывается список предметов
	self.tradingAttachmentsList:SelectRecord( -1 )

	if self.sounds.ddStart and self.sounds.ddStart ~= "" then
		UI:PlayGlobalSound( self.sounds.ddStart )
	end

end 


--
function UI.MailCreateWnd:SetDDState_WAIT_MOUSE( itemSlot, mouseX, mouseY )

	if self.ddInfo.ddState ~= self.ddStates.NONE then
		sys.log( "UI.MailCreateWnd:SetDDState_WAIT_MOUSE()[ERROR]: invalid states sequence" )
		return
	end

	UI:ResetTooltip()

	self.ddInfo.ddState		= self.ddStates.WAIT_MOUSE
	self.ddInfo.mouseX_abs	= UI:XToAbs( mouseX )
	self.ddInfo.mouseY_abs	= UI:YToAbs( mouseY )
	self.ddInfo.itemSlot	= itemSlot

	self:CaptureMouse()

end


--
function UI.MailCreateWnd:IsItemSlotDDFit( slotWnd )

	if self.ddInfo.ddState == self.ddStates.NONE then
		return false
	end

	return slotWnd ~= self.ddInfo.itemSlot

end


--
function UI.MailCreateWnd:CaptureMouse()

	UI:CaptureMouse( self:GetUiHandle() )

end


--
function UI.MailCreateWnd:ReleaseMouse()

	if UI:GetMouseCapture() == self:GetUiHandle() then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end

end


--
function UI.MailCreateWnd:UpdateAcceptItemSlot( mouseX, mouseY )	

	local acceptSlotWnd = nil

	local slotWnd = self:GetTradingAttachmentSlotUnderMouse( mouseX, mouseY )
	if slotWnd and slotWnd:IsDDFit() then
		acceptSlotWnd = slotWnd
	end

	self:SetAcceptItemSlot( acceptSlotWnd )

end


--
function UI.MailCreateWnd:SetAcceptItemSlot( slotWnd )

	if slotWnd == self.ddAcceptItemSlot then
		return
	end

	local oldAcceptSlot = self.ddAcceptItemSlot
	self.ddAcceptItemSlot = slotWnd

	if oldAcceptSlot then
		oldAcceptSlot:SetDDAccept( false )
	end

	if self.ddAcceptItemSlot then
		self.ddAcceptItemSlot:SetDDAccept( true )
	end

end


--
function UI.MailCreateWnd:GetTradingAttachmentSlotUnderMouse( mouseX, mouseY )	

	mouseX = self.tradingAttachmentsList:XToWindow( self:XToScreen( mouseX ) )
	mouseY = self.tradingAttachmentsList:YToWindow( self:YToScreen( mouseY ) )

	for slotIdx = 1, self.tradingAttachmentsList:GetNumRecords() do

		local slotWnd = self.tradingAttachmentsList:GetButtonForRecord( slotIdx )
		if slotWnd and slotWnd:IsChildOf( self ) and UI:IsPtInRect( slotWnd:GetRect(), mouseX, mouseY ) then
			return slotWnd
		end

	end

	return nil

end


--
function UI.MailCreateWnd:SetDDItem()

	local data = self.ddInfo.itemSlot:GetRecordData()
	local dstSlotIdx = self.ddAcceptItemSlot and self.ddAcceptItemSlot:GetRecord() or -1
	self.tradingAttachmentsList:SetItem( data.defName, data.iid, dstSlotIdx, self.ddInfo.itemSlot:GetRecord(), data.count )

    self:ResetDD()		

end


--
function UI.MailCreateWnd:RemoveDDItem()

	self.tradingAttachmentsList:SetItem( "", nil, self.ddInfo.itemSlot:GetRecord() )

	self:ResetDD() 

end


--
function UI.MailCreateWnd:HandleTooltip( targetWnd, tooltipData )

	if self.ddInfo.ddState ~= self.ddStates.NONE then
		return true, UI.INVALID_UI_HANDLE
	end

	return UI.FullScreenWnd.HandleTooltip( self, targetWnd, tooltipData )

end


--
function UI.MailCreateWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	self.wndUnderLastMouseDown = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )

end 


--
function UI.MailCreateWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == self.tradingAttachmentsList:GetUiHandle() then
		self:OnSelTradingAttachmentChanged()		
	end

end


--
function UI.MailCreateWnd:OnSelTradingAttachmentChanged()

	self:UpdateTradingItemsVisibility()

	if UI.TradingWnd:IsOnScreen() and UI.TradingWnd:GetMainWndName() == self:GetName() then

		-- при открытом списке запрещено показывать тултип на выделенном слоте (так сделано в эквипменте)
		if selAttachmentSlot == UI:GetCurTooltipTarget() then
			UI:ResetTooltip()
		end

	end

end


--
function UI.MailCreateWnd:UpdateTradingItemsVisibility()

	local selAttachmentIdx = self.tradingAttachmentsList:GetSelectedRecord()

	if selAttachmentIdx ~= -1 then

		-- инициализация

		-- подсчет уже прикрепленных ресурсов
		
		local chosenItems = {}

		for slotIdx = 1, self.tradingAttachmentsList:GetNumRecords() do

			local data = self.tradingAttachmentsList:GetRecordData( slotIdx )
			if data.defName ~= "" then
			
				if not chosenItems[ data.defName ] then
					chosenItems[ data.defName ] = 1
				else
					chosenItems[ data.defName ] = chosenItems[ data.defName ] + 1
				end
				
			end

		end

		UI.TradingWnd:Setup( UI.TradingWnd.modes.MAIL, self:GetName(), chosenItems )
		UI.TradingWnd:Show()

	else
	
		self:HideTradingWnd()

	end

end


--
function UI.MailCreateWnd:GetIidToSend( defName )

	local iid = UI.INVALID_U64_ID

	if not UI:IsDefModule( defName ) then
		return iid
	end
	
	local attachedItems = self:GetTradingAttachments()
	
	local inventoryItems = UI:GetInventoryItemsByDef( defName )
	for invIdx, inventoryItem in pairs( inventoryItems ) do
	
		if not UI:GetEquippedShipItem( inventoryItem.iid ) then
		
			local bAlreadyAttached = false
			for attachIdx, attachItem in pairs( attachedItems ) do
				if attachItem.iid == inventoryItem.iid then
					bAlreadyAttached = true
					break
				end
			end
			
			if not bAlreadyAttached then
				iid = inventoryItem.iid
				break
			end
			
		end
		
	end

	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.MailCreateWnd:GetIidToSend()[ERROR]: cannot find iid for def=%s", defName )
	end
	
	return iid
	
end


--
function UI.MailCreateWnd:HideTradingWnd()

	if UI.TradingWnd:GetMainWndName() == self:GetName() then
		UI.TradingWnd:Reset()
		UI.TradingWnd:Hide()
	end

end


-- ------------------------------------------------------------------------
-- UI.MailCreate_EditWnd
-- ------------------------------------------------------------------------

UI.MailCreate_EditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "MailCreate_EditWnd",
    		isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "mailCreate_edit",
    				defaultAnimation    = "desel",

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
    		animActive				= "sel",
    		animInactive			= "desel",
			animDisabled			= "desel",
    	}
    }
}

-- ------------------------------------------------------------------------
-- UI.MailCreate_ReceiverEditWnd, UI.MailCreate_ThemeEditWnd
-- ------------------------------------------------------------------------

--
UI.MailCreate_ReceiverEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "MailCreate_EditWnd",

     	props =
     	{
     		name			= "MailCreate_ReceiverEditWnd",
    		symbolsLimit	= UI.MAX_NICKNAME_EDIT_LEN,	-- #0029416, комм.(0098489)
			bytesLimit		= 96,
	     	activationOrder	= 0,
    	}
    }
}


--
UI.MailCreate_ThemeEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "MailCreate_EditWnd",

     	props =
     	{
     		name			= "MailCreate_ThemeEditWnd",
    		symbolsLimit	= 36,	-- максимальный размер в байтах - 128, но все они не влазят в окне почты при просмотре в текущем дизайне
			bytesLimit		= 128,
	     	activationOrder	= 1,
    	}
    }
}

-- ------------------------------------------------------------------------
-- UI.MailCreate_MsgEditWnd
-- ------------------------------------------------------------------------

UI.MailCreate_MsgEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditMultilineWnd",

     	props =
     	{
     		name			= "MailCreate_MsgEditWnd",
    		symbolsLimit	= 1023,	-- константа максимального размера в байтах: 2048
			bytesLimit		= 2048,
	     	activationOrder	= 2,
    	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "mailCreate_msgEdit",
    				defaultAnimation    = "desel",

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
    		animActive				= "sel",
    		animInactive			= "desel",
			animDisabled			= "desel",
			scrollBarLocator		= "scroll",
    	}
    }
}

-- ------------------------------------------------------------------------
-- UI.MailCreate_SendBtn, UI.MailCreate_CancelBtn
-- ------------------------------------------------------------------------

--
UI.MailCreate_SendBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "MailCreate_SendBtn",
    	},
	},

	textId = "mailCreate_btnSend"
}


--
UI.MailCreate_CancelBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "MailCreate_CancelBtn",
    	},
	},

	textId = "mailCreate_btnCancel"
}

-- ------------------------------------------------------------------------
-- UI.MailCreate_TradingModeBtn
-- ------------------------------------------------------------------------

UI.MailCreate_TradingModeBtn = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.MailCreate_TradingModeBtn.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
	ARROW_EFFECT	= 3,
}


--
UI.MailCreate_TradingModeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn",

	props =
	{
		name		= "MailCreate_TradingModeBtn",
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.TextBtn.layers ) + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "textBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "btn_arrow",
						layer		= "UI.MailCreate_TradingModeBtn.layers.ARROW_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ARROW_EFFECT
		{
			id			= UI.MailCreate_TradingModeBtn.layers.ARROW_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "textBtn_arrow",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.MailCreate_TradingModeBtn.textId = "mailCreate_tradingModeBtn"

-- ------------------------------------------------------------------------
-- UI.MailCreate_CrossBtn
-- ------------------------------------------------------------------------

UI.MailCreate_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "MailCreate_CrossBtn"
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.MailCreate_TradingDesiredPriceEditWnd
-- ------------------------------------------------------------------------

UI.MailCreate_TradingDesiredPriceEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "MailCreate_TradingDesiredPriceEditWnd",
    		symbolsLimit	= 9,
			editStyle		= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL + UI.ES_NUM,
			forbiddenChars	= "+-.",
	     	activationOrder	= 3,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "mailCreate_tradingDesiredPriceEdit",
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
			animDisabled			= "deselect",
    	}
    }
}

-- ------------------------------------------------------------------------
-- UI.MailCreate_TradingDesiredPriceIcoWnd
-- ------------------------------------------------------------------------

UI.MailCreate_TradingDesiredPriceIcoWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.MailCreate_TradingDesiredPriceIcoWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "MailCreate_TradingDesiredPriceIcoWnd",
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
				defName 			= "shop_items_slot_priceIco",
				defaultAnimation	= "gold",

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


-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.MailCreate_TradingDesiredPriceIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.MailCreate_TradingDesiredPriceIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	if not self.tooltipData then
		self:InitTooltipData()
	end	

end


--
function UI.MailCreate_TradingDesiredPriceIcoWnd:InitTooltipData()

	if self.tooltipData then
		return
	end

    self.tooltipData =
    {
    	tooltipType	= UI.tooltipTypes.PRICE,

    	priceInfo =
    	{
    		priceType 	= _G.GameStore.CreditsType.CT_GOLD,
    		val			= 0,
    		bIsBuyPrice	= false,
    	}
    }

end

-- ------------------------------------------------------------------------
-- UI.MailCreate_TradingAttachmentsListWnd
-- ------------------------------------------------------------------------

UI.MailCreate_TradingAttachmentsListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.MailCreate_TradingAttachmentsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "MailCreate_TradingAttachmentsListWnd",
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
				defName 			= "mailCreate_tradingAttachmentsList",
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

-- -----------------------------------
-- interface funcitons
-- -----------------------------------

--
function UI.MailCreate_TradingAttachmentsListWnd:Init()

	self:Clear()

	for idx = 1, UI:GetTradingMaxItems() do
		self:AddRecord( self:MakeEmptySlotData() )

	end

end


--
function UI.MailCreate_TradingAttachmentsListWnd:SetItem( defName, iid, dstSlotIdx, srcSlotIdx, count )

	if dstSlotIdx == -1 then
		sys.log( "UI.MailCreate_TradingAttachmentsListWnd:SetItem()[ERROR]: invalid dstSlotIdx" )
		return
	end

	if srcSlotIdx == nil then
		srcSlotIdx = -1
	end

	if count == nil then
		count = 1
	end
	
	if iid == nil then
		iid = UI.INVALID_U64_ID
	end
	
	if defName ~= "" then
	
		if UI:IsDefModule( defName ) then
			
			if iid == UI.INVALID_U64_ID then
				sys.log( "UI.MailCreate_TradingAttachmentsListWnd:SetItem()[ERROR]: invalid iid" )
				return
			end
			
			if count ~= 1 then
				sys.log( "UI.MailCreate_TradingAttachmentsListWnd:SetItem()[ERROR]: invalid count; only one module can be in slot" )
				count = 1
			end
			
		end
		
	end
		
	local dstSlotData = self:GetRecordData( dstSlotIdx )

	if srcSlotIdx ~= -1 then

		if dstSlotData.defName ~= "" then
			self:SetRecordData( UI:CopyTable2( dstSlotData ), srcSlotIdx )
		else
			self:SetRecordData( self:MakeEmptySlotData(), srcSlotIdx )
		end

	end
	
	dstSlotData.defName = defName

	if defName ~= "" then
		dstSlotData.count	= count
		dstSlotData.iid		= iid
	else
		dstSlotData = self:MakeEmptySlotData()
	end

	self:SetRecordData( dstSlotData, dstSlotIdx )

	UI.MailCreateWnd:OnTradingAttachmentsChanged()

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.MailCreate_TradingAttachmentsListWnd.btnPrototypeName	= "MailCreate_TradingAttachmentSlotWnd"
UI.MailCreate_TradingAttachmentsListWnd.MAX_SLOTS			= 5
UI.MailCreate_TradingAttachmentsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.MailCreate_TradingAttachmentsListWnd.effectInfo =
{
	main =
	{
    	slotObjNamePrefix	= "prod_icon_",
    	scrollObjName		= "",
    	animIdle			= "idle",
	}
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.MailCreate_TradingAttachmentsListWnd:MakeEmptySlotData()

	return
	{
		defName		= "",
		iid			= UI.INVALID_U64_ID,
		count		= 0,
	}

end


-- ------------------------------------------------------------------------
-- UI.MailCreate_TradingAttachmentSlotWnd
-- ------------------------------------------------------------------------

UI.MailCreate_TradingAttachmentSlotWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.MailCreate_TradingAttachmentSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "MailCreate_TradingAttachmentSlotWnd",
		isPrototype	= true,
	},
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.MailCreate_TradingAttachmentSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.itemIcoWnd:Reset()

	self.bDDFit			= false
	self.bDDAccept		= false
	self.tooltipData	= nil

	self:SetBgDefaultAnimation()
	self:SetMouseOver( false )

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	self:UpdateSelection()

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:OnDDStart()

	self:SetMouseOver( false )

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:OnDDStop()

	self.bDDFit		= false
	self.bDDAccept	= false

	self:SetBgDefaultAnimation()
	self:UpdateMouseOver()

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:SetDDFit( bFit )

	self.bDDFit = bFit

	if bFit then
		self:SetBgDDFitAnimation()
	else
		self:SetBgDefaultAnimation()
	end	

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:IsDDFit()

	return self.bDDFit

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:SetDDAccept( bAccept )

	self.bDDAccept = bAccept
	self:SetMouseOver( bAccept )

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:IsDDAccept()

	return self.bDDAccept

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:GetOrg()

	return self.itemIcoWnd:GetOrg()

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:GetTooltipData()

	if self:IsSelected() then
		return nil
	else
		return self.tooltipData
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.MailCreate_TradingAttachmentSlotWnd.sounds =
{
	mouseOver	= "sound/ui/btnMouseOver",
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.MailCreate_TradingAttachmentSlotWnd.itemIcoWnd	= nil
UI.MailCreate_TradingAttachmentSlotWnd.bDDFit		= false
UI.MailCreate_TradingAttachmentSlotWnd.bDDAccept	= false
UI.MailCreate_TradingAttachmentSlotWnd.tooltipData	= nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.MailCreate_TradingAttachmentSlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.itemIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
	self:AddChild( self.itemIcoWnd )

	self:SetWidth( self.itemIcoWnd:GetWidth() )
	self:SetHeight( self.itemIcoWnd:GetHeight() )	

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateTooltip( data )
	self:UpdateMouseOver()

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:UpdateIco( data )

	if data.defName == "" then

		self.itemIcoWnd:ShowEmptySlotEffect2()

	else

		-- иконка
		
		local bEnchanted = data.iid ~= UI.INVALID_U64_ID and UI:IsInventoryItemEnchantedById( data.iid )
		self.itemIcoWnd:SetupForItem( data.defName, bEnchanted )
	
		-- количество
	
		if data.count > 1 then
			self.itemIcoWnd:SetCountInventory( data.count )
		end
	
	end

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:UpdateTooltip( data )

	self.tooltipData = nil

	if data.defName ~= "" then

		if UI:IsDefModule( data.defName ) then
		
			self.tooltipData = {}
			self.tooltipData.tooltipType 		= UI.tooltipTypes.MODULE
			self.tooltipData.defName			= data.defName
			self.tooltipData.iid				= data.iid
			self.tooltipData.compareShipData	= nil -- см.ниже
			self.tooltipData.bEnchanted			= UI:IsInventoryItemEnchantedById( data.iid )
			
			local selShipItem = UI.HangarWnd:GetSelShipItem()
			if selShipItem then
				self.tooltipData.compareShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( selShipItem.vid, -1 )
			end
			
		else
			self.tooltipData = UI:GetTooltipForItem( data.defName )
		end

	end

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:UpdateSelection()

	if self:IsSelected() then
		self.itemIcoWnd:ShowSelection()
	else
		self.itemIcoWnd:HideSelection()
	end

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if self:CanReactOnMouseOver() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) )
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:CanReactOnMouseOver()

	local data = self:GetRecordData()

	if data then
		if not self:IsItemDragging() then
			return true
		end
	end

	return false

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.itemIcoWnd:IsMouseOver()

	if bMouseOver then
		self.itemIcoWnd:ShowMouseOver()
	else
		self.itemIcoWnd:HideMouseOver()
	end

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:IsItemDragging()

	return UI.MailCreateWnd.ddInfo.ddState == UI.MailCreateWnd.ddStates.DRAG

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:SetBgDefaultAnimation()

	self.itemIcoWnd:AnimateIcoIdle()

end


--
function UI.MailCreate_TradingAttachmentSlotWnd:SetBgDDFitAnimation()

	self.itemIcoWnd:AnimateIcoSel()

end


-- -----------------------------------------------------------------------
-- UI.MailCreate_TradingDDIco
-- -----------------------------------------------------------------------

UI.MailCreate_TradingDDIco = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.MailCreate_TradingDDIco.def =
{
	className	= "Wnd",
	prototype	= "MailCreate_TradingAttachmentSlotWnd",

	props =
	{
		name		= "MailCreate_TradingDDIco",
	}
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.MailCreate_TradingDDIco:Setup( data )

	self.data = data
	self:UpdateForData( self.data )

end


--
function UI.MailCreate_TradingDDIco:Reset()

	UI.MailCreate_TradingAttachmentSlotWnd.Reset( self )

	self.itemIcoWnd:AnimateMainDD()

	self.data = nil

end


--
function UI.MailCreate_TradingDDIco:GetRecordData()

	return self.data

end


--
function UI.MailCreate_TradingDDIco:UpdatePos( mouseX, mouseY )

	local x = mouseX - self.origin.x
	local y = mouseY - self.origin.y

	self:SetLeft( x )
	self:SetTop( y )

end


-- --------------------------------------
-- const
-- --------------------------------------

UI.MailCreate_TradingDDIco.origin = UI:PtTo1024x768( UI:Vec2( 0, 0 ), resolution )

-- --------------------------------------
-- vars
-- --------------------------------------

UI.MailCreate_TradingDDIco.data = nil

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.MailCreate_TradingDDIco:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
	_G.SetTextPixelSnapping( false, false )
	
	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	
	_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )
	
end