-- ----------------------------------------------------------------------------
--
-- Workfile: salewnd.lua
-- Copyright é 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- ------------------------------
-- UI.SaleAdvert_Wnd
-- ------------------------------

UI.SaleAdvert_Wnd = {}


--
UI.SaleAdvert_Wnd.layers = 
{
	MAIN_EFFECT 		= 0,
	BG_EFFECT			= 1,
}


UI.SaleAdvert_Wnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "SaleAdvert_Wnd",
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
				defName				= "gameplay_select_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "sale_win",	
						wnd			= "UI.SaleAdvert_AdvertWnd",
						animParams	= UI.EffectAnimParams.POS,
					},	
					{
						objName		= "blackout",	
						layer		= "UI.SaleAdvert_Wnd.layers.BG_EFFECT",
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
	},
	children = { "UI.SaleAdvert_AdvertWnd"},
}


-- ------------------------------
-- const
-- ------------------------------
--
UI.SaleAdvert_Wnd.sounds = 
{
	on_show = "",
	on_hide = "sound/ui/MsgHide",
}

UI.SaleAdvert_Wnd.Modes = 
{
	WEB_ADVERT		= 0,
	FRIEND_INVITE 	= 1,
}

-- ------------------------------
-- var
-- ------------------------------
UI.SaleAdvert_Wnd.loadedTexture = nil

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.SaleAdvert_Wnd:Setup( data )
	UI.SaleAdvert_AdvertWnd:Setup( data )
end

--
function UI.SaleAdvert_Wnd:OnEscape()
	UI:PlayGlobalSound( self.sounds.on_hide )
	self:Hide()
	return true
end

--
function UI.SaleAdvert_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 
	if w == UI.SaleAdvert_AdvertWnd then
		return true
	end
	self:Hide()
	return true
end

--
function UI.SaleAdvert_Wnd:Show( mode )
	--if self.mode ~= mode then
	if mode == nil then
		mode = self.Modes.WEB_ADVERT
	end
	self.mode = mode
	UI.SaleAdvert_AdvertWnd:UpdateAppearance()
	--end
	UI.FullScreenWnd.Show( self )
	if self.sounds.on_show and self.sounds.on_show ~= "" then
		UI:PlayGlobalSound( self.sounds.on_show )
	end
end

--
function UI.SaleAdvert_Wnd:GetMode()
	return self.mode
end

-- ------------------------------------------------------------------------
-- UI.Sale_CrossBtn
-- ------------------------------------------------------------------------

UI.SaleAdvert_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",
		props =
		{
			name	= "SaleAdvert_CrossBtn"
		}
	}
}



-- -------------------------------------------------------------------
-- UI.Sale_Btn
-- -------------------------------------------------------------------
local l_numBtnBaseLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.SaleAdvert_Btn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",

		props =
		{
			name	= "SaleAdvert_Btn",
		}
	},

    textId = "saleadvert_window_button"
}


-- ------------------------------
-- UI.SaleAdvert_AdvertWnd
-- ------------------------------

UI.SaleAdvert_AdvertWnd = {}


--
UI.SaleAdvert_AdvertWnd.layers = 
{
	MAIN_EFFECT 		= 0,
	CAPTION				= 1,
	IMAGE_EFFECT		= 2,
	IMAGE_2_EFFECT		= 3,
	TEXT				= 4,
	INVITE_TEXT 		= 5,
}


UI.SaleAdvert_AdvertWnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "SaleAdvert_AdvertWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},	
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "saleadvert_wnd_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title",
						layer		= "UI.SaleAdvert_AdvertWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "ico",
						layer		= "UI.SaleAdvert_AdvertWnd.layers.IMAGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "ico",
						layer		= "UI.SaleAdvert_AdvertWnd.layers.IMAGE_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "text_1",
						layer		= "UI.SaleAdvert_AdvertWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_1_2",
						layer		= "UI.SaleAdvert_AdvertWnd.layers.INVITE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "buy_x",
						wnd			= "UI.SaleAdvert_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",
						wnd			= "UI.SaleAdvert_Btn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_1",
						wnd			= "UI.SaleAdvert_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_copy",
						wnd			= "UI.SaleAdvert_CopyBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "fb_btn",
						wnd			= "UI.SaleAdvert_FacebookBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "vk_btn",
						wnd			= "UI.SaleAdvert_VkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "input_1",
						wnd			= "UI.SaleAdvert_KeyEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- IMAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "saleadvert_wnd_image",
				defaultAnimation    = "idle",
			}}
		},
		-- IMAGE_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "saleadvert_wnd_image",
				defaultAnimation    = "idle",
			}}
		},
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 10, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- INVITE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 10, 1 },
   			font			= { fontName = "VerySmall" },
   			text 			= "^sale_advert_friend_invite_text"
		},
	},
	
	children = { "UI.SaleAdvert_CrossBtn", "UI.SaleAdvert_Btn", "UI.SaleAdvert_KeyEditWnd", "UI.SaleAdvert_CopyBtn", "UI.SaleAdvert_CancelBtn", "UI.SaleAdvert_FacebookBtn", "UI.SaleAdvert_VkBtn" },
}

UI.SaleAdvert_Wnd.curIndex = nil
UI.SaleAdvert_Wnd.AUTO_SWITCH_TIME = 6
UI.SaleAdvert_Wnd.lastSwitchTime = 0
UI.SaleAdvert_Wnd.tabsWnd = {}

UI.SaleAdvert_Wnd.mode		= UI.SocialNetWaitingWnd.modes.NONE
UI.SaleAdvert_Wnd.mode	= nil
UI.SaleAdvert_Wnd.hMsgExternalLink		= UI.INVALID_UI_HANDLE
UI.SaleAdvert_Wnd.externalLinkToOpen	= ""

--
function UI.SaleAdvert_AdvertWnd:UpdateAppearance()
	if UI.SaleAdvert_Wnd:GetMode() == UI.SaleAdvert_Wnd.Modes.WEB_ADVERT then
		self:AddChild( UI.SaleAdvert_TabBtn )
		self:Setup( UI.SaleAdvert:GetData() )
	elseif UI.SaleAdvert_Wnd:GetMode() == UI.SaleAdvert_Wnd.Modes.FRIEND_INVITE then
		self:AddChild( UI.SaleAdvert_CopyBtn )
		self:AddChild( UI.SaleAdvert_CancelBtn )
		self:AddChild( UI.SaleAdvert_FacebookBtn )
		self:AddChild( UI.SaleAdvert_VkBtn )
		self:AddChild( UI.SaleAdvert_KeyEditWnd )
		self:SetLayerVisible( true, self.layers.INVITE_TEXT )
		UI.SaleAdvert_Btn:UnlinkFromParent()
		UI.SaleAdvert_TabBtn:UnlinkFromParent()
		local effect = UI:GetEffectFromLayer( self, self.layers.IMAGE_EFFECT )
		effect:SetSpriteTextureDyn( "ico", UI:GetTex( "social_friend_invite" ), Quat( 0, 0, 1, 1 ) )
		if self.tabsWnd then
			for k, v in pairs( self.tabsWnd ) do
				v:UnlinkFromParent()
			end
		end
		self:SetText( UI:GetStringByName( "sale_advert_friend_invite" ) , self.layers.CAPTION )
		self:SetText( "", self.layers.TEXT )
		self:SetLayerVisible( false, self.layers.IMAGE_2_EFFECT )
	end
end

--
function UI.SaleAdvert_AdvertWnd:FB_OnEvent( eventId, success, desc )
	--[[if not self:IsOnScreen() then
		return
	end]]
	if eventId == _G.FBEventType.FBET_LOGIN then
		if self.mode ~= UI.SocialNetWaitingWnd.modes.FB_LOGIN then
			return
		end
		if UI:IsTrueEx( success ) then
			if self:IsOnScreen() then
				self.mode = UI.SocialNetWaitingWnd.modes.FB_INVITE
				_G.FB_PostInvite()
			else
				self.mode = UI.SocialNetWaitingWnd.modes.NONE
				UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
				UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
				_G.MasterServer_Social_SuggestFBFriends()
			end
		else
			self.mode = UI.SocialNetWaitingWnd.modes.NONE
			UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
			UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
		end		
	elseif eventId == _G.FBEventType.FBET_INVITE_POSTED then
		if self.mode ~= UI.SocialNetWaitingWnd.modes.FB_INVITE then
			return
		end
		self.mode = UI.SocialNetWaitingWnd.modes.NONE
		UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
		UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
	end
end


--
function UI.SaleAdvert_AdvertWnd:VK_OnEvent( eventId, success, desc )
	--[[if not self:IsOnScreen() then
		return
	end]]
	if eventId == _G.FBEventType.FBET_LOGIN then
		if self.mode ~= UI.SocialNetWaitingWnd.modes.VK_LOGIN then
			return
		end
		if UI:IsTrueEx( success ) then
			if self:IsOnScreen() then
				self.mode = UI.SocialNetWaitingWnd.modes.VK_INVITE
				_G.VK_PostInvite()
			else
				self.mode = UI.SocialNetWaitingWnd.modes.NONE
				UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
				UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
				_G.MasterServer_Social_SuggestVKFriends()
			end
		else
			self.mode = UI.SocialNetWaitingWnd.modes.NONE
			UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
			UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
		end		
	elseif eventId == _G.FBEventType.FBET_INVITE_POSTED then
		if self.mode ~= UI.SocialNetWaitingWnd.modes.VK_INVITE then
			return
		end
		self.mode = UI.SocialNetWaitingWnd.modes.NONE
		UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
		UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
	end
end

--
function UI.SaleAdvert_AdvertWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	local handle = self:GetUiHandle()
	self.mode = UI.SocialNetWaitingWnd.modes.NONE
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
end


--
function UI.SaleAdvert_AdvertWnd:OnSocialNetWaitingCancel( mode )

	self.mode = UI.SocialNetWaitingWnd.modes.NONE
	UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
	UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()

end


--
function UI.SaleAdvert_AdvertWnd:LoadAllTextures()
	if self.loadedTexture == nil then
		self.loadedTexture = {}
	end
	if self.loadedTextureSmall == nil then
		self.loadedTextureSmall = {}
	end
	for k, v in pairs( self.data ) do
		if v.textureName and not self.loadedTexture[ k ] then
			local textureHandle = UI:LoadTexture( v.textureName, v.textureName )
			self.loadedTexture[ k ] = textureHandle
		end
		if v.textureNameSmall and not self.loadedTextureSmall[ k ] then
			local textureHandle = UI:LoadTexture( v.textureNameSmall, v.textureNameSmall )
			self.loadedTextureSmall[ k ] = textureHandle
		end
	end
end

--
function UI.SaleAdvert_AdvertWnd:SetCurAdvert( id )
	self.lastSwitchTime = _G.TimerGetRealTime()
	local lastId = self.curIndex
	self.curIndex = id
	if self.data[ self.curIndex ] then
		local curData = self.data[ self.curIndex ]
		if self.loadedTexture[ id ] then
			local effect = UI:GetEffectFromLayer( self, self.layers.IMAGE_EFFECT )
			effect:SetSpriteTextureDyn( "ico", self.loadedTexture[ id ], Quat( 0, 0, 1, 1 ) )
			if lastId ~= nil and self.loadedTexture[ lastId ] then
				self:SetLayerVisible( true, self.layers.IMAGE_2_EFFECT )
				local effect = UI:GetEffectFromLayer( self, self.layers.IMAGE_2_EFFECT )
				effect:SetSpriteTextureDyn( "ico", self.loadedTexture[ lastId ], Quat( 0, 0, 1, 1 ) )
				effect:StartAnimation( "hide" )
			else
				self:SetLayerVisible( false, self.layers.IMAGE_2_EFFECT )
			end
		end
		if curData.header ~= nil then
			self:SetText( curData.header, self.layers.CAPTION )
		else
			self:SetText( "", self.layers.CAPTION )
		end
		if curData.text then
			self:SetText( curData.text, self.layers.TEXT )
		else
			self:SetText( "", self.layers.TEXT )
		end
		UI.SaleAdvert_KeyEditWnd:UnlinkFromParent()
		UI.SaleAdvert_CopyBtn:UnlinkFromParent()
		UI.SaleAdvert_FacebookBtn:UnlinkFromParent()
		UI.SaleAdvert_VkBtn:UnlinkFromParent()
		self:AddChild( UI.SaleAdvert_CancelBtn )
		self:SetLayerVisible( false, self.layers.INVITE_TEXT )
		if curData.url and curData.url == "[friend]" then
			UI.SaleAdvert_Btn:UnlinkFromParent()
			self:AddChild( UI.SaleAdvert_KeyEditWnd )
			self:AddChild( UI.SaleAdvert_CopyBtn )
			self:AddChild( UI.SaleAdvert_FacebookBtn )
			self:AddChild( UI.SaleAdvert_VkBtn )
			self:AddChild( UI.SaleAdvert_CancelBtn )
			self:SetLayerVisible( true, self.layers.INVITE_TEXT )
			UI.SaleAdvert_KeyEditWnd:SetEditText( self:GetReferralKey() )
		elseif curData.url and curData.url ~= "" then
			self:AddChild( UI.SaleAdvert_Btn )
		else
			UI.SaleAdvert_Btn:UnlinkFromParent()
		end

		for k, v in pairs( self.tabsWnd ) do
			v:Select( false )
		end

		if self.tabsWnd and self.tabsWnd[ id ] then
			self.tabsWnd[ id ]:Select( true )
		end
	end
end

--
function UI.SaleAdvert_AdvertWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	if not UI.SaleAdvert_SocialNetWaitingWnd:IsOnScreen() then
		if self:IsOnScreen() then
			if UI.SaleAdvert_Wnd:GetMode() == UI.SaleAdvert_Wnd.Modes.WEB_ADVERT then
				if self.lastSwitchTime == nil then
					self.lastSwitchTime = _G.TimerGetRealTime()
				end
				if self.data then
					local time = _G.TimerGetRealTime()
					if time - self.lastSwitchTime > UI.SaleAdvert_Wnd.AUTO_SWITCH_TIME then
						local nextIndex = self.curIndex + 1
						if nextIndex > #self.data then
							nextIndex = 1
						end
						self:SetCurAdvert( nextIndex )
					end
				end
			end
			if UI.SaleAdvert_KeyEditWnd:GetEditText() == "" then
				UI.SaleAdvert_KeyEditWnd:SetEditText( self:GetReferralKey() )
			end
		end
	end
end

--
function UI.SaleAdvert_AdvertWnd:Setup( data )
	if data then
		self.data = data
		self:LoadAllTextures()
		if self.tabsWnd then
			for k, v in pairs( self.tabsWnd ) do
				v:UnlinkFromParent()
			end
		else
			self.tabsWnd = {}
		end
		if #self.data > 1 then
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			local top = mainEffect:GetObjPos( "map_ico_1" ).y
			local left = mainEffect:GetObjPos( "map_ico_1" ).x
			local delta = mainEffect:GetObjPos( "ico12" ).x - left
			for k, v in pairs( self.data ) do
				if not self.tabsWnd[ k ] then
					self.tabsWnd[ k ] = UI:CreateChildWnd( self, UI.SaleAdvert_TabBtn, tostring( k ) )
					self.tabsWnd[ k ].tabId = k
					self.tabsWnd[ k ]:SetTop( top )
					self.tabsWnd[ k ]:SetLeft( left + ( delta * ( k - 1 ) ) )
				end
				self.tabsWnd[ k ]:SetDataId( k )
				self:AddChild( self.tabsWnd[ k ] )
			end
		end
		
		self.curIndex = nil
		UI.SaleAdvert_AdvertWnd:SetCurAdvert( 1 )
	end
end

--
function UI.SaleAdvert_AdvertWnd:F_OnEventSaveUiState()
	if UI.SaleAdvert_Wnd:IsOnScreen() then
		UI.SaleAdvert_Wnd:UnlinkFromParent()
		self.mode = UI.SocialNetWaitingWnd.modes.NONE
		UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
		UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
		UI.store.SaleAdvert_AdvertWnd =
		{
			mode	= self.mode,
		}
	end
end

--
function UI.SaleAdvert_AdvertWnd:F_OnEventRestoreUiState()
	if UI.store.SaleAdvert_AdvertWnd then
		self.mode = UI.store.SaleAdvert_AdvertWnd.mode
		UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
	end
end

--
function UI.SaleAdvert_AdvertWnd:F_Shutdown()
	if self.loadedTexture then
		--[[for k, v in pairs( self.loadedTexture ) do
			if v then
				UI:UnloadTexture( v )
			end
		end]]
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.SaleAdvert_AdvertWnd:StartFacebookOperation()
	if self.mode == UI.SocialNetWaitingWnd.modes.NONE then
		if _G.FB_IsLoggedIn() then
			if self:IsOnScreen() then
				self.mode = UI.SocialNetWaitingWnd.modes.FB_INVITE
				_G.FB_PostInvite()
				UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
				UI.Root:AddChild( UI.SaleAdvert_SocialNetWaitingWnd )
			else
				_G.MasterServer_Social_SuggestFBFriends()
			end
		else

			self.mode = UI.SocialNetWaitingWnd.modes.FB_LOGIN
			_G.FB_ForceLogIn()
			UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
			UI.Root:AddChild( UI.SaleAdvert_SocialNetWaitingWnd )
		end
	end
end


--
function UI.SaleAdvert_AdvertWnd:StartVkOperation()
	if self.mode == UI.SocialNetWaitingWnd.modes.NONE then
		if _G.VK_IsLoggedIn() then
			if self:IsOnScreen() then
				self.mode = UI.SocialNetWaitingWnd.modes.VK_INVITE
				_G.VK_PostInvite()
				UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
				UI.Root:AddChild( UI.SaleAdvert_SocialNetWaitingWnd )
			else
				_G.MasterServer_Social_SuggestVKFriends()
			end
		else
			self.mode = UI.SocialNetWaitingWnd.modes.VK_LOGIN
			_G.VK_ForceLogIn()
			UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
			UI.Root:AddChild( UI.SaleAdvert_SocialNetWaitingWnd )
		end
	end
end

--
function UI.SaleAdvert_AdvertWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 
	if w == UI.SaleAdvert_CrossBtn or w == UI.SaleAdvert_CancelBtn then
		UI:PlayGlobalSound( UI.SaleAdvert_Wnd.sounds.on_hide )
		UI.SaleAdvert_Wnd:Hide()
		return true
	elseif w == UI.SaleAdvert_CopyBtn then
		UI.SaleAdvert_KeyEditWnd:SetSel( 0, string.len( UI.SaleAdvert_KeyEditWnd:GetEditText() ) )
		UI.SaleAdvert_KeyEditWnd:Copy()
		return true
	elseif w == UI.SaleAdvert_KeyEditWnd then
		return true
	elseif w == UI.SaleAdvert_Btn then

		local bClose = true
		if self.data[ self.curIndex ].url == nil or self.data[ self.curIndex ].url == "" then

		elseif self.data[ self.curIndex ].url == "[premiumTime]" then
			UI.HangarWnd:ShowLicenses( false )
		else

			local achvName = string.match( self.data[ self.curIndex ].url, "^%[achievements%-(.*)%]$" )
			if achvName then

				local achvId = ai.AchievementId[ achvName ]
				if achvId then
					UI.HangarWnd:ShowAchievement( achvId )
				else
					sys.log( "UI.SaleAdvert_AdvertWnd()[ERROR]: invalid achievement name: \"%s\"", achvName )
				end

			else
				bClose = false
				self.externalLinkToOpen = self.data[ self.curIndex ].url
				self.hMsgExternalLink = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_openExternalLink" ), UI.MBS_YES_NO )
			end
		end
		if bClose then
			UI:PlayGlobalSound( UI.SaleAdvert_Wnd.sounds.on_hide )
			UI.SaleAdvert_Wnd:Hide()
		end
		return true
	elseif w == UI.SaleAdvert_FacebookBtn then
		self:StartFacebookOperation()
		return true
	elseif w == UI.SaleAdvert_VkBtn then
		self:StartVkOperation()
		return true
	end
	return false
end

--
function UI.SaleAdvert_AdvertWnd:OnFacebookWaitingCancel( mode )
	self.mode = UI.SocialNetWaitingWnd.modes.NONE
	UI.SaleAdvert_SocialNetWaitingWnd:SetMode( self.mode )
	UI.SaleAdvert_SocialNetWaitingWnd:UnlinkFromParent()
end


--
function UI.SaleAdvert_AdvertWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgExternalLink then

		self.hMsgExternalLink = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if string.find( self.externalLinkToOpen, "https://online.gaijin.ru" ) == 1 or 
								string.find( self.externalLinkToOpen, "https://online.gaijinent.com" ) == 1 then
				_G.MasterServer_SignInAndRerirectGaijin( self.externalLinkToOpen )
			else
				_G.ShellExecute( self.externalLinkToOpen )
			end

			UI:PlayGlobalSound( UI.SaleAdvert_Wnd.sounds.on_hide )
			UI.SaleAdvert_Wnd:Hide()

		end

		self.externalLinkToOpen = ""

	end

end		


--
function UI.SaleAdvert_AdvertWnd:GetReferralKey()

	if UI:IsSteam() then
		return _G.MasterServer_GetReferralKey()
	else
		return _G.MasterServer_GetReferralLink()
	end

end


-- ------------------------------
-- UI.SaleAdvert_TabBtn
-- ------------------------------

UI.SaleAdvert_TabBtn = {}

--
UI.SaleAdvert_TabBtn.layers = 
{
	MAIN_EFFECT 		= 0,
	IMAGE_EFFECT 		= 1,
	SELECT_EFFECT 		= 2,
	OVER_EFFECT 		= 3,
}


UI.SaleAdvert_TabBtn.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "SaleAdvert_TabBtn",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype 	= true,
	},	
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "saleadvert_wnd_tab_btn",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "ico13",
						layer		= "UI.SaleAdvert_TabBtn.layers.IMAGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "over",
						layer		= "UI.SaleAdvert_TabBtn.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "sel",
						layer		= "UI.SaleAdvert_TabBtn.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- IMAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_map_ico",
				defaultAnimation    = "idle",
			}}
		},
		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "saleadvert_wnd_tab_btn_select",
				defaultAnimation    = "idle",
			}}
		},
		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "saleadvert_wnd_tab_btn_over",
				defaultAnimation    = "idle",
			}}
		},
	}
}

--
function UI.SaleAdvert_TabBtn:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	self:SetLayerVisible( false, self.layers.SELECT_EFFECT )
end

--
function UI.SaleAdvert_TabBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	return true
end

--
function UI.SaleAdvert_TabBtn:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	return true
end

--
function UI.SaleAdvert_TabBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI:PlayGlobalSound( UI.sounds.btnClick )
	UI.SaleAdvert_AdvertWnd:SetCurAdvert( self.tabId or 1 )
	return true
end

--
function UI.SaleAdvert_TabBtn:SetDataId( dataId )
	local effect = UI:GetEffectFromLayer( self, self.layers.IMAGE_EFFECT )
	effect:SetSpriteTextureDyn( "ico", UI.SaleAdvert_AdvertWnd.loadedTextureSmall[ dataId ] or UI.SaleAdvert_AdvertWnd.loadedTexture[ dataId ], Quat( 0, 0, 1, 1 ) )
end

--
function UI.SaleAdvert_TabBtn:Select( b )
	self:SetLayerVisible( b, self.layers.SELECT_EFFECT )
end


-- ---------------------------------------------------------------
-- UI.SaleAdvert_KeyEditWnd
-- ---------------------------------------------------------------

UI.SaleAdvert_KeyEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "SaleAdvert_KeyEditWnd",
         	editStyle		= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL + UI.ES_READ_ONLY,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "inviteKey_edit",
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
    	}
    }
}

-- ---------------------------------------------------------------
-- UI.SaleAdvert_CopyBtn
-- ---------------------------------------------------------------

UI.SaleAdvert_CopyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "SaleAdvert_CopyBtn",
			selectSound	= UI.MsgBox.sounds.btnMouseOver,
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
    				defName 			= "inviteKeyGeneration_copyBtn",
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
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
	},

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "invatiKeyGenerate_copyBtn" ), text = UI:GetStringByName( "invatiKeyGenerate_copyBtn_tooltipText" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

-- ---------------------------------------------------------------
-- UI.SaleAdvert_CancelBtn
-- ---------------------------------------------------------------

UI.SaleAdvert_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn3",

		props =
		{
			name	= "SaleAdvert_CancelBtn",
		}
	},

	textId = "invatiKeyGenerate_cancelBtn"
}


-- -------------------------------------------------------------------
-- UI.SaleAdvert_FacebookBtn
-- -------------------------------------------------------------------

UI.SaleAdvert_FacebookBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "FacebookBtn1",
    	props =
    	{
    		name	= "SaleAdvert_FacebookBtn",
    	},
    },
    tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "tooltip_saleadvert_facebook_share_caption" ), text = UI:GetStringByName( "tooltip_saleadvert_facebook_share_text" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}


-- -------------------------------------------------------------------
-- UI.SaleAdvert_VkBtn
-- -------------------------------------------------------------------

UI.SaleAdvert_VkBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "VKontakteBtn1",
    	props =
    	{
    		name	= "SaleAdvert_VkBtn",
    	},
    },
    tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "tooltip_saleadvert_vk_share_caption" ), text = UI:GetStringByName( "tooltip_saleadvert_vk_share_text" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

-- ----------------------------------------------------------------------------------------
-- UI.SaleAdvert_SocialNetWaitingWnd
-- ----------------------------------------------------------------------------------------
UI.SaleAdvert_SocialNetWaitingWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "SocialNetWaitingWnd",

		props =
		{
			name	= "SaleAdvert_SocialNetWaitingWnd"
		}
	},

	mainWndName = "SaleAdvert_AdvertWnd"
}