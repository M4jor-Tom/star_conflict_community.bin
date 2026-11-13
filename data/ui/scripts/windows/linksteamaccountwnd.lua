-- ----------------------------------------------------------------------------
--
-- Workfile: linksteamaccountwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.LinkSteamAccountWnd = {}
local ls = UI.LinkSteamAccountWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.LinkSteamAccountWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",
	
	props =
	{
		name	= "LinkSteamAccountWnd",
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
				defName 			= "linkSteamAccount_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "steam_win",	
						layer		= "UI.LinkSteamAccountWnd.layers.WORK_EFFECT",
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
				defName 			= "linkSteamAccount_work",
				defaultAnimation	= "idle",
	
				links =
				{
					{
						objName		= "description_1",	
						layer		= "UI.LinkSteamAccountWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description_2",	
						layer		= "UI.LinkSteamAccountWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "button_1",	
						wnd			= "UI.LinkSteamAccount_OkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",	
						wnd			= "UI.LinkSteamAccount_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
			text			= "^linkSteamAccount_caption",
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
			text			= "^linkSteamAccount_desc",
		},
	},

	children = { "UI.LinkSteamAccount_OkBtn", "UI.LinkSteamAccount_CancelBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.LinkSteamAccountWnd:MasterServer_OnAttachSteamAccount( result, requestId, param1, param2 )

	-- реагирует даже если не на экране

	if result == 0 then

		if self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.link )
			self:Hide()
		end

	else
		if self.requestId == requestId then
			self:ShowMsgBoxOnLinkError()
		end
	end

	if self.requestId == requestId then
		self.requestId = 0
	end

end


--
function UI.LinkSteamAccountWnd:MasterServer_OnPlayerCredentials( result, requestId, param1, param2 )

	if not self.bCurAccountChecked then
	    self:TryShow()
	end

end


-- ------------------------------
-- const
-- ------------------------------

ls.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    DESC			= 4,
}

ls.sounds =
{
	link	= "sound/ui/btnClick",
	cancel	= "sound/ui/MsgHide",
}

-- ------------------------------
-- vars
-- ------------------------------

ls.bCurAccountChecked	= false
ls.requestId			= 0
ls.hMsgCancel			= UI.INVALID_UI_HANDLE

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.LinkSteamAccountWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.LinkSteamAccountWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return self.listWnd ~= nil
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w == UI.LinkSteamAccount_OkBtn then
		self:OnOk()

	elseif w == UI.LinkSteamAccount_CancelBtn then
		self:OnCancel()
	end

	return true

end


--
function UI.LinkSteamAccountWnd:OnOk()

	self.requestId = _G.MasterServer_AttachSteamAccount()
	if self.requestId == 0 then
		self:ShowMsgBoxOnLinkError()
	end

end


--
function UI.LinkSteamAccountWnd:ShowMsgBoxOnLinkError()

	UI:ShowErrorMsg( "msg_linkSteamAccountFailed" )

end


--
function UI.LinkSteamAccountWnd:OnCancel()

	self.hMsgCancel = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_needLinkAccauntToPlay" ), UI.MBS_YES_NO )

end


-- нет самостоятельной подписки, вызвается из UiManager
function UI.LinkSteamAccountWnd:F_OnEventMasterServerConnected( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.bCurAccountChecked = false

	-- в этот момент еще не пришли данные playerCredential, в которых зранятся id стима, поэтому попытки показать окно здесь не предпринимается

end


--
function UI.LinkSteamAccountWnd:F_OnEventWndShown( hSender, hWnd )

	self:TryShow()

end


--
function UI.LinkSteamAccountWnd:NeedShow()

	if not _G.MasterServer_IsConnected or not _G.MasterServer_IsConnected() then
		return false
	end

	if not next( UI.serverData.playerCredentials ) then
		sys.log( "UI.LinkSteamAccountWnd:NeedShow()[ERROR]: uninited player credentials" )
		return false		
	end

	-- стим запущен?
	if UI.serverData.playerCredentials.localSteamID == UI.INVALID_U64_ID then
		return false
	end

	-- аккаунт уже прилинкован?
	if UI.serverData.playerCredentials.steamID ~= UI.INVALID_U64_ID then
		return false
	end

    local verType = cvars.cl_versionType
    if not( verType == "live" or verType == "test" or verType == "pubtest" or verType == "devtest" ) then
		return false
	end

	return true

end


--
function UI.LinkSteamAccountWnd:CanShowNow()

	return UI.HangarWnd and UI.HangarWnd:IsOnScreen()

end


--
function UI.LinkSteamAccountWnd:TryShow()

	if self.bCurAccountChecked then
		sys.log( "UI.LinkSteamAccountWnd:TryShow()[ERROR]: already checked" )
	end

	if self:IsOnScreen() then
		return true
	end

	if self:NeedShow() then

		if self:CanShowNow() then

			self.bCurAccountChecked = true
			UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_WND_SHOWN )		
			self:Show()

		else

    		UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_WND_SHOWN )
			return false

		end

	else
		return false
	end

end   


--
function UI.LinkSteamAccountWnd:F_OnEventSaveUiState()

	UI.store.LinkSteamAccountWnd =
	{
		bCurAccountChecked	= self.bCurAccountChecked,
		requestId			= self.requestId,
	}

end


--
function UI.LinkSteamAccountWnd:F_OnEventRestoreUiState()

	if UI.store.LinkSteamAccountWnd then

		self.bCurAccountChecked	= UI.store.LinkSteamAccountWnd.bCurAccountChecked
		self.requestId			= UI.store.LinkSteamAccountWnd.requestId

		UI.store.LinkSteamAccountWnd = nil

	end

	if not self.bCurAccountChecked then
		self:TryShow()

	end

end


--
function UI.LinkSteamAccountWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	self.hMsgCancel = UI.INVALID_UI_HANDLE

end


--
function UI.LinkSteamAccountWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgCancel then
		self.hMsgCancel = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_NO then
			_G.MasterServer_ClientDisconnect()			
		end
	end

end  


-- -------------------------------------------------------------
-- UI.LinkSteamAccount_Btn
-- -------------------------------------------------------------

UI.LinkSteamAccount_Btn = {}

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

-- ------------------------------
-- window definition
-- ------------------------------

UI.LinkSteamAccount_Btn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "LinkSteamAccount_Btn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numBaseBtnLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
			  	defName				= "linkSteamAccount_btn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.LinkSteamAccount_Btn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}			
		},

		-- TEXT
		{
			id				= l_numBaseBtnLayers,

			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
 	},
}

-- --------------------------------
-- const
-- --------------------------------

UI.LinkSteamAccount_Btn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
	}
}

UI.LinkSteamAccount_Btn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

-- --------------------------------
-- vars
-- --------------------------------

UI.LinkSteamAccount_Btn.textId = ""

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.LinkSteamAccount_Btn:F_PostLoad()

	UI.EffectButtonWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	if self.textId ~= "" then
		self:SetText( UI:GetStringByName( self.textId ), self.layers.TEXT )
	end

end


-- ----------------------------------------------------------------------------
--  UI.LinkSteamAccount_OkBtn, UI.LinkSteamAccount_CancelBtn
-- ----------------------------------------------------------------------------

--
UI.LinkSteamAccount_OkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "LinkSteamAccount_Btn",

		props =
		{
			name = "LinkSteamAccount_OkBtn"
		}
	},

	textId = "linkSteamAccount_ok"
}


--
UI.LinkSteamAccount_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "LinkSteamAccount_Btn",

		props =
		{
			name = "LinkSteamAccount_CancelBtn"
		}
	},

	textId = "linkSteamAccount_calnce"
}