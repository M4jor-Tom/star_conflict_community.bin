-- ----------------------------------------------------------------------------
--
-- Workfile: socialnetwaitingwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.SocialNetWaitingWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.SocialNetWaitingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "SocialNetWaitingWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		activationOrder	= 0,
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
				defName 			= "socialNetWaiting_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.SocialNetWaitingWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading_big",
						layer		= "UI.SocialNetWaitingWnd.layers.WAIT_EFFECT",
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
				defName 			= "socialNetWaiting_blackBg",
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
						layer		= "UI.SocialNetWaitingWnd.layers.WAIT_TEXT",
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
		},   
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.SocialNetWaitingWnd:SetMode( mode )

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.SocialNetWaitingWnd:SetMode()[ERROR]: invalid mode %s", tostring( mode ) )
		return
	end

	if mode == self.mode then
		return
	end

	self.mode = mode
	self:UpdateControls()

end


--
function UI.SocialNetWaitingWnd:GetMode()

	return self.mode

end


--
function UI.SocialNetWaitingWnd:Reset()

	self.mode = self.modes.NONE

	self:ResetControls()

end


-- -------------------------------
-- const
-- -------------------------------

UI.SocialNetWaitingWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WAIT_EFFECT		= 2,
    WAIT_TEXT		= 3,
}

UI.SocialNetWaitingWnd.modes =
{
	NONE				= -1,
	FB_LOGIN			= 1,
	FB_MAKE_SCREENSHOT 	= 2,
	FB_POST_SCREENSHOT	= 3,
	FB_INVITE			= 4,
	VK_LOGIN			= 5,
	VK_MAKE_SCREENSHOT 	= 6,
	VK_POST_SCREENSHOT	= 7,
	VK_INVITE			= 8,
}

UI.SocialNetWaitingWnd.effectInfo =
{
	main =
	{
		cancelBtnLocator	= "button_10"
	}
}

UI.SocialNetWaitingWnd.mainWndName	= ""

-- -------------------------------
-- vars
-- -------------------------------

UI.SocialNetWaitingWnd.mode		= UI.SocialNetWaitingWnd.modes.NONE
UI.SocialNetWaitingWnd.cancelBtn	= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.SocialNetWaitingWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self:Reset()

end


--
function UI.SocialNetWaitingWnd:CreateControls()

	self.cancelBtn = UI:CreateChildWnd( self, UI.TextBtn3, "" )
	self.cancelBtn:SetBtnText( UI:GetStringByName( "cancel" ) )

end


--
function UI.SocialNetWaitingWnd:ResetControls()

	self:SetText( "", self.layers.WAIT_TEXT )
	self:SetLayerVisible( false, self.layers.BG_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:RemoveCancelBtn()

end


--
function UI.SocialNetWaitingWnd:UpdateControls()

	self:ResetControls()

	if self.mode == self.modes.NONE then		
		-- ничего

	elseif self.mode == self.modes.FB_LOGIN then

		self:SetText( UI:GetStringByName( "facebook_login" ), self.layers.WAIT_TEXT )
		self:SetLayerVisible( true, self.layers.BG_EFFECT )
		self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
		self:AddCancelBtn()
		
	elseif self.mode == self.modes.FB_MAKE_SCREENSHOT then
		-- ничего

	elseif self.mode == self.modes.FB_POST_SCREENSHOT then

		self:SetText( UI:GetStringByName( "facebookPostingScreenshot" ), self.layers.WAIT_TEXT )
		self:SetLayerVisible( true, self.layers.BG_EFFECT )
		self:SetLayerVisible( true, self.layers.WAIT_EFFECT )

	elseif self.mode == self.modes.FB_INVITE then

		self:SetText( UI:GetStringByName( "facebook_invite" ), self.layers.WAIT_TEXT )
		self:SetLayerVisible( true, self.layers.BG_EFFECT )
		self:SetLayerVisible( true, self.layers.WAIT_EFFECT )

	elseif self.mode == self.modes.VK_LOGIN then

		self:SetText( UI:GetStringByName( "vk_login" ), self.layers.WAIT_TEXT )
		self:SetLayerVisible( true, self.layers.BG_EFFECT )
		self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
		self:AddCancelBtn()
		
	elseif self.mode == self.modes.VK_MAKE_SCREENSHOT then
		-- ничего

	elseif self.mode == self.modes.VK_POST_SCREENSHOT then

		self:SetText( UI:GetStringByName( "vk_postingScreenshot" ), self.layers.WAIT_TEXT )
		self:SetLayerVisible( true, self.layers.BG_EFFECT )
		self:SetLayerVisible( true, self.layers.WAIT_EFFECT )

	elseif self.mode == self.modes.VK_INVITE then

		self:SetText( UI:GetStringByName( "vk_invite" ), self.layers.WAIT_TEXT )
		self:SetLayerVisible( true, self.layers.BG_EFFECT )
		self:SetLayerVisible( true, self.layers.WAIT_EFFECT )

	else
		sys.log( "UI.SocialNetWaitingWnd:UpdateControls()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

end


--
function UI.SocialNetWaitingWnd:AddCancelBtn()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.cancelBtn, mainEffect, self.effectInfo.main.cancelBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.SocialNetWaitingWnd:RemoveCancelBtn()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:UnlinkWnd( self.cancelBtn:GetUiHandle(), "" )

	self.cancelBtn:UnlinkFromParent()
	
end


--
function UI.SocialNetWaitingWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.cancelBtn then
		self:NotifyMainWndOnCancel()
	end

	return true	

end


--
function UI.SocialNetWaitingWnd:NotifyMainWndOnCancel()

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.SocialNetWaitingWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnSocialNetWaitingCancel then
		sys.log( "UI.SocialNetWaitingWnd:NotifyMainWnd()[ERROR]: cannot find OnSocialNetWaitingCancel() function in wnd %s", self.mainWndName )
		return
	end

	mainWnd:OnSocialNetWaitingCancel( self.mode )

end