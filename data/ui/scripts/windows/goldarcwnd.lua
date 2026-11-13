-- ----------------------------------------------------------------------------
--
-- Workfile: goldarcwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.GoldArcWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

--
UI.GoldArcWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    TEXT			= 4,
	BONUS			= 5,
    WAIT_EFFECT		= 6,
    WAIT_TEXT		= 7,
}

--
UI.GoldArcWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "GoldArcWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.GoldArcWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "goldArc_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.GoldArcWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "gold_arc_win",
						layer		= "UI.GoldArcWnd.layers.WORK_EFFECT",
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
				defName 			= "goldArc_work",
				defaultAnimation	= "idle",

				links = 
				{
					{
						objName		= "title",
						layer		= "UI.GoldArcWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",
						layer		= "UI.GoldArcWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "button_1",
						wnd			= "UI.GoldArc_GetBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",
						wnd			= "UI.GoldArc_LinkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading_big",
						layer		= "UI.GoldArcWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.GoldArc_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title10",
						layer		= "UI.GoldArcWnd.layers.BONUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "goldArc_caption" ),
		},  

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 7, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "goldArc_text" ),
		},  

		-- BONUS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
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
						layer		= "UI.GoldArcWnd.layers.WAIT_TEXT",
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

	children = { "UI.GoldArc_GetBtn", "UI.GoldArc_LinkBtn", "UI.GoldArc_CrossBtn" }
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GoldArcWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.checkRequestId		= 0
	self.getRequestId		= 0

	self:UpdateWaitingEffect()

end


--
function UI.GoldArcWnd:GameStore_OnBuyGold( result, requestId, param1, param2 )	

	if requestId == self.checkRequestId then

		self.checkRequestId = 0
		self:UpdateWaitingEffect()

		if result == _G.GameStore.StoreBuyResult.SBR_ARC_AMOUNT_MISMATCH then

			if self:IsOnScreen() then

    			local baseVal	= param1
    			local bonusVal	= param2 

    			if baseVal > 0 then
    				self:ShowGetGoldMsg( baseVal, bonusVal )
    			else
    				self:ShowNoGoldMsg()
    			end

			end

		elseif result == _G.GameStore.StoreBuyResult.SBR_OK then
			sys.log( "UI.GoldArcWnd:GameStore_OnBuyGold()[ERROR]: unexpected result SBR_OK" )

		else
			UI:ShowMsgOnBuyError( result )
		end


	elseif requestId == self.getRequestId then

		self.getRequestId = 0
		self:UpdateWaitingEffect()

		if result == _G.GameStore.StoreBuyResult.SBR_OK then
			self:Hide()
		else
			UI:ShowMsgOnBuyError( result )
		end

	end

end


--
function UI.GoldArcWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:UpdateBonusText()

end


--
function UI.GoldArcWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

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
function UI.GoldArcWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

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
function UI.GoldArcWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Yup2Gold_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


-- --------------------------------
-- const
-- --------------------------------

UI.GoldArcWnd.sounds =
{
	hide			= "sound/ui/MsgHide",
}

-- --------------------------------
-- vars
-- --------------------------------

UI.GoldArcWnd.checkRequestId	= 0
UI.GoldArcWnd.getRequestId		= 0
UI.GoldArcWnd.hMsgGetGold		= UI.INVALID_UI_HANDLE
UI.GoldArcWnd.hMsgNoGold		= UI.INVALID_UI_HANDLE
UI.GoldArcWnd.goldToGet			= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.GoldArcWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self:UpdateWaitingEffect()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.GoldArcWnd:Reset()

	self:SetLayerVisible( false, self.layers.BONUS )

end


--
function UI.GoldArcWnd:FullUpdate()

	self:UpdateBonusText()

end


--
function UI.GoldArcWnd:UpdateBonusText()

	local bonus = UI:GetGoldBonus()

	if bonus > 0 then

		self:SetLayerVisible( true, self.layers.BONUS )

		local str = UI:GetStringByName( "goldArc_bonus" )

		local bonusPerc = UI:Round( bonus * 100 )
		local strBonusVal = string.format( "%d%%", bonusPerc )

		-- подстановку просто строкой нельзя сделать из-за символа "%"
		local tSubst =
		{
			val	= strBonusVal
		}

		local numSubst = 0		
		str, numSubst = string.gsub( str, "%$(.-)%$", tSubst )

		if numSubst == 0 then
			sys.log( "UI.GoldArcWnd:FullUpdate()[ERROR]: cannot find placeholder \"$val$\" in string \"goldArc_bonus\"" )
			str = string.format( "[INVALID STRING] Bonus: %s", strBonusVal )
		end

		self:SetText( str, self.layers.BONUS )

	else
		self:SetLayerVisible( false, self.layers.BONUS )
	end

end


--
function UI.GoldArcWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if wnd == UI.GoldArc_GetBtn then
		self:OnGet()

	elseif wnd == UI.GoldArc_LinkBtn then
		self:OnLink()

	elseif wnd == UI.GoldArc_CrossBtn then
		self:Hide()
		UI:PlayGlobalSound( self.sounds.hide )
	end

	return true	

end


--
function UI.GoldArcWnd:OnGet()

	if self:IsBuisy() then
		return
	end

	self:CheckGold()

end


--
function UI.GoldArcWnd:OnLink()

	local url = "https://billing.arcgames.com"

	if not _G.Arc_NavigateToURL( url ) then
		_G.ShellExecute( url )
	end

end


--
function UI.GoldArcWnd:CheckGold()

	if self:IsBuisy() then
		sys.log( "UI.GoldArcWnd:CheckGold()[ERROR]: is buisy" )
		return
	end

	self.checkRequestId = _G.GameStore_BuyCustomGoldAmount( 0, _G.MasterServer.AuthMethod.AM_ARC )
	if self.checkRequestId == 0 then
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.GoldArcWnd:GetGold( baseVal )

	if self:IsBuisy() then
		sys.log( "UI.GoldArcWnd:GetGold()[ERROR]: is buisy" )
		return
	end

	self.getRequestId = _G.GameStore_BuyCustomGoldAmount( baseVal, _G.MasterServer.AuthMethod.AM_ARC )
	if self.getRequestId == 0 then
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.GoldArcWnd:ShowGetGoldMsg( baseVal, bonusVal )

	if self:IsBuisy() then
		sys.log( "UI.GoldArcWnd:ShowGetGoldMsg()[ERROR]: is buisy" )
		return
	end

	local strBaseColor	= UI:Color2Str( UI.TEXT_BASE_COLOR ) 
	local strSelColor	= UI:Color2Str( UI.TEXT_SEL_COLOR ) 

	local tSubst =
	{
		val 		= string.format( "%s%s%s$gold_big$", strSelColor, UI:Num2StrSeparatedBy3( baseVal ), strBaseColor ),
		bonusVal	= string.format( "%s%s%s$gold_big$", strSelColor, UI:Num2StrSeparatedBy3( bonusVal ), strBaseColor ),
	}

	local msg = UI:GetStringByName( "getGoldArc_text" )
	msg = string.gsub( msg, "%$(.-)%$", tSubst )

	self.goldToGet =
	{
		baseVal		= baseVal,
		bonusVal	= bonusVal,
	}

	self.hMsgGetGold = UI:MessageBox( UI:GetStringByName( "getGoldArc_caption" ), msg, UI.MBS_OK )

end


--
function UI.GoldArcWnd:ShowNoGoldMsg()

	self.hMsgNoGold = UI:MessageBox( UI:GetStringByName( "getGoldArc_caption" ), UI:GetStringByName( "getGoldArc_text_noGold" ), UI.MBS_OK )

end


--
function UI.GoldArcWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgGetGold then

		self.hMsgGetGold = UI.INVALID_UI_HANDLE

		if self.goldToGet then

			self:GetGold( self.goldToGet.baseVal )
			self.goldToGet = nil

		else
			sys.log( "UI.GoldArcWnd:F_OnEventMsgBoxRet()[ERROR]: no data for gold to retreive" )
		end

	elseif boxHandle == self.hMsgNoGold then

		self.hMsgNoGold = UI.INVALID_UI_HANDLE

	end

end


--
function UI.GoldArcWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then

		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )

		if self.hMsgGetGold ~= UI.INVALID_UI_HANDLE then

			UI:RemoveUiObj( self.hMsgGetGold )
			UI:Purge()

			self.hMsgGetGold = UI.INVALID_UI_HANDLE

		end

		if self.hMsgNoGold ~= UI.INVALID_UI_HANDLE then

			UI:RemoveUiObj( self.hMsgNoGold )
			UI:Purge()

			self.hMsgNoGold = UI.INVALID_UI_HANDLE

		end

		self.goldToGet = nil

	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.GoldArcWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.GoldArcWnd:IsWaiting()

	return self.checkRequestId ~= 0 or self.getRequestId ~= 0

end


--
function UI.GoldArcWnd:IsBuisy()

	return self:IsWaiting() or self.hMsgGetGold ~= UI.INVALID_UI_HANDLE or self.hMsgNoGold ~= UI.INVALID_UI_HANDLE

end


--
function UI.GoldArcWnd:F_OnEventSaveUiState()

	UI.store.GoldArcWnd =
	{
		checkRequestId	= self.checkRequestId,
		getRequestId	= self.getRequestId,
	}

end


--
function UI.GoldArcWnd:F_OnEventRestoreUiState()

	if UI.store.GoldArcWnd then

		self.checkRequestId	= UI.store.GoldArcWnd.checkRequestId
		self.getRequestId	= UI.store.GoldArcWnd.getRequestId

		self:UpdateWaitingEffect()

		UI.store.GoldArcWnd = nil

	end

end


--
function UI.GoldArcWnd:OnEscape()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	return true

end


--
function UI.GoldArcWnd:OnAccountAurasChanged()

	self:UpdateBonusText()

end


-- ------------------------------------------------------------------------------
-- UI.GoldArc_GetBtn
-- ------------------------------------------------------------------------------

UI.GoldArc_GetBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn4",

		props =
		{
			name	= "GoldArc_GetBtn",
		},
	},

	textId = "goldArc_getBtn"
}

-- ------------------------------------------------------------------------------
-- UI.GoldArc_LinkBtn
-- ------------------------------------------------------------------------------

UI.GoldArc_LinkBtn = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.GoldArc_LinkBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn4",

	props =
	{
		name	= "GoldArc_LinkBtn",
	},

 	layers =
 	{
 		-- TEXT
 		{
 			id				= UI.TextBtn.layers.TEXT,
 			layerType		= UI.LAYER_TEXT,
 			layerStyle		= UI.WLS_OWNERDRAW,
    		formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
    		formatInfoSz	= { 1, 1 },
    		font			= { fontName = "Small" },
 		}, 
 	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.GoldArc_LinkBtn:SetBtnText( text )

	if self.metaText then
		text = string.format( "%s$gold_big$", text )
		self.metaText:SetText( text, true )
	end

end


-- --------------------------------
-- const
-- --------------------------------

UI.GoldArc_LinkBtn.textId = "goldArc_linkBtn"

-- --------------------------------
-- vars
-- --------------------------------

UI.GoldArc_LinkBtn.metaText = nil

-- --------------------------------
-- work functions
-- --------------------------------


--
function UI.GoldArc_LinkBtn:F_PostLoad()

	UI.TextBtn4.F_PostLoad( self )

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 

	if self.textId ~= "" then
		self:SetBtnText( UI:GetStringByName( self.textId ) )
	end

end


--
function UI.GoldArc_LinkBtn:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.GoldArc_LinkBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.GoldArc_LinkBtn:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.GoldArc_LinkBtn:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.GoldArc_LinkBtn:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- ------------------------------------------------------------------------
-- UI.GoldArc_CrossBtn
-- ------------------------------------------------------------------------

UI.GoldArc_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "GoldArc_CrossBtn"
    	}
	}
}