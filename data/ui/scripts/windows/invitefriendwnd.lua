-- ----------------------------------------------------------------------------
--
-- Workfile: helpwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.InviteFriendWnd = {}
local ifw = UI.InviteFriendWnd

-- ------------------------------
-- window definition
-- ------------------------------


UI.InviteFriendWnd.layers = 
{
	MAIN_EFFECT 			= 0,
	BG_EFFECT				= 1,
	WORK_EFFECT				= 2,
	CAPTION					= 3,
	NICKNAME_CAPTION		= 4,
	INVITE_CAPTION			= 5,
	WAIT_EFFECT				= 6,
}


UI.InviteFriendWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",
	
	props =
	{
		name	= "InviteFriendWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		defaultChild	= "InviteFriend_EditNicknameWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.InviteFriendWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "friends_invite_main",
				defaultAnimation	= "idle",

				links =
				{
					--[[{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
    				},]]

					{
						objName		= "blackout",	
						layer		= "UI.InviteFriendWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "win",	
						layer		= "UI.InviteFriendWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
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
				defName 			= "friends_invite_wnd",
				defaultAnimation	= "idle",
	
				links =
				{
					{
						objName		= "title_1",	
						layer		= "UI.InviteFriendWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_2",	
						layer		= "UI.InviteFriendWnd.layers.NICKNAME_CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_3",	
						layer		= "UI.InviteFriendWnd.layers.INVITE_CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "btn_1",	
						wnd			= "UI.InviteFriendWnd_CancelBtn",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "btn_2",	
						wnd			= "UI.InviteFriendWnd_InviteBtn",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.InviteFriendWnd_CrossBtn",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "input_1",	
						wnd			= "UI.InviteFriend_EditNicknameWnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA
					},

					--[[{
						objName		= "input_2",	
						wnd			= "UI.InviteFriend_EditInviteWnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},]]

					{
						objName		= "load",	
						layer		= "UI.InviteFriendWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},

		-- NICKNAME_CAPTION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "^invite_friend_nickname"
		},

		-- INVITE_CAPTION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",--^invite_friend_invite"
		},

		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",
			}}
		}
	},

	children = { "UI.InviteFriendWnd_CrossBtn", "UI.InviteFriendWnd_InviteBtn", "UI.InviteFriendWnd_CancelBtn",	--[["UI.InviteFriend_EditInviteWnd",]] "UI.InviteFriend_EditNicknameWnd" }
}


UI.InviteFriendWnd.sounds =
{
	hide			= "sound/ui/MsgHide",
	wndShow 		= "sound/ui/btnClick",
}

-- ------------------------------
-- interface functions
-- ------------------------------


function UI.InviteFriendWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if self.nickname == nil or nickName ~= self.nickname then
		return
	end

	self.nickname = nil

	if self:IsOnScreen() then

		if result ~= 0 then 
			for k, v in pairs( MasterServer.NameCacheOpResult ) do
				if result == v then
					local text
					if self.mode == UI.InviteFriendWnd.Modes.FRIEND	then
						text = UI:GetStringByName( "error_social_FRIEND_REQUEST" )
					elseif self.mode == UI.InviteFriendWnd.Modes.WATCH then
						text = UI:GetStringByName( "error_social_ADD_TO_WATCH" )
					elseif self.mode == UI.InviteFriendWnd.Modes.IGNORE then
						text = UI:GetStringByName( "error_social_ADD_TO_IGNORE" )
					elseif self.mode == UI.InviteFriendWnd.Modes.CLAN then
						text = UI:GetStringByName( "error_clan_INVITE_TO_CLAN" )
					else
						sys.log( "UI.InviteFriendWnd:MasterServer_OnSocialSendRequest()[ERROR]: unknown window mode: %d", self.mode )
					end
					local reason = UI:GetStringByName( k )
					self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
				end
			end
			self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
			return
		end

		self:DoRequest( uid )

	end

end


--
function UI.InviteFriendWnd:MasterServer_OnSquadRequestEnded( result, requestId, unused1, unused2, uid, requestType )

--[[ перенесено в uipublic.lua
	if result ~= 0 then 
		local text = UI:GetStringByName( "error_squad_"..UI:Val2Key( UI.InviteFriendWnd.SquadRequestType, requestType ) )
		local errorCode = UI:Val2Key( MasterServer.SquadOpResult, result )
		local reason = UI:GetStringByName( errorCode )
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end
]]

	if requestId == self.requestId then
		self.requestId = nil
		self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
		self.mode = -1
		self:OnCancel()
	end

end


--
function UI.InviteFriendWnd:MasterServer_OnClanRequestEnded( result, requestId, unused1, unused2, requestType )

	if result ~= 0 then 
		local text
		if UI.InviteFriendWnd.ClanRequestType.CLAN_UPGRADE ~= requestType then
			text = UI:GetStringByName( "error_clan_"..UI:Val2Key( UI.InviteFriendWnd.ClanRequestType, requestType ) )
		else
			-- in this case unused1 is MasterServer.ClanUpgrades value
			text = UI:GetStringByName( "error_clan_"..UI:Val2Key( UI.InviteFriendWnd.ClanRequestType, requestType ).."_"..UI:Val2Key( MasterServer.ClanUpgrades, unused1 ) )
		end
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		local reason = UI:GetStringByName( errorCode )
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

	if requestId == self.requestId then
		self.requestId = nil
		self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
		self.mode = -1
		self:OnCancel()
	end

end


--
function UI.InviteFriendWnd:MasterServer_OnSocialRequestEnded( result, requestId, unused, unused, uid, requestType )

	if result ~= 0 then 
		local text = UI:GetStringByName( "error_social_"..UI:Val2Key( UI.InviteFriendWnd.SocialRequestType, requestType ) )
		local reason = ""
		if requestType == self.SocialRequestType.REQUEST_TO_TEACHER or requestType == self.SocialRequestType.REQUEST_TO_STUDENT or requestType == self.SocialRequestType.TEACHING_ACCEPT or
			requestType == self.SocialRequestType.TEACHING_REJECT then 
			local errorCode = UI:Val2Key( MasterServer.TeachingOpResult, result )
			reason = UI:GetStringByName( errorCode )
		else
			local errorCode = UI:Val2Key( MasterServer.SocialOpResult, result )
			reason = UI:GetStringByName( errorCode )
		end
		self.msgBoxH = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

	if requestId == self.requestId then
		self.requestId = nil
		self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
		self.mode = -1
		self:OnCancel()
	end

end


--
function UI.InviteFriendWnd:Close( bSound )

	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end

	self:Hide()

end

-- ------------------------------
-- const
-- ------------------------------

UI.InviteFriendWnd.Modes = 
{
	FRIEND				= 0,
	WATCH				= 1,
	IGNORE				= 2,
	CLAN				= 3,
}


UI.InviteFriendWnd.SocialRequestType = 
{
	FRIEND_REQUEST				= 0,
	FRIEND_REQUEST_ACCEPT		= 1,
	FRIEND_REQUEST_REJECT		= 2,
	FRIEND_REMOVE				= 3,
	ADD_TO_WATCH				= 4,
	REMOVE_FROM_WATCH			= 5,
	ADD_TO_IGNORE				= 6,
	REMOVE_FROM_IGNORE			= 7,
	REQUEST_TO_TEACHER 			= 8,
	REQUEST_TO_STUDENT 			= 9,
	TEACHING_ACCEPT 			= 10,
	TEACHING_REJECT 			= 11,
}


UI.InviteFriendWnd.ClanRequestType = 
{
	INVITE_TO_CLAN				= 0,
	KICK_FROM_CLAN				= 1,
	CHANGE_PRIVILEGES			= 2,
	LEAVE_CLAN					= 3,
	INVITE_ACCEPT				= 4,
	INVITE_REJECT				= 5,
	CLAN_UPGRADE				= 6,
}


UI.InviteFriendWnd.SquadRequestType = 
{
	INVITE_TO_SQUAD				= 0,
	KICK_FROM_SQUAD				= 1,
	LEAVE_SQUAD					= 2,
	INVITE_ACCEPT				= 3,
	INVITE_REJECT				= 4,
	CONVERT_TO_WING 			= 5,
	CHECK_READY_REQUEST 		= 6,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.InviteFriendWnd.nickname = nil
UI.InviteFriendWnd.msgBoxH	= nil
UI.InviteFriendWnd.requestId	= nil
UI.InviteFriendWnd.mode		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.InviteFriendWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
    self:SetLayerVisible( false, self.layers.WAIT_EFFECT )

end


--
function UI.InviteFriendWnd:Show( mode )

	UI.FullScreenWnd.Show( self )
	UI.InviteFriend_EditNicknameWnd:SetEditText( "" )
	UI:PlayGlobalSound( UI.InviteFriendWnd.sounds.wndShow )
	self.mode = mode
	self:UpdateText()
	--UI:SetKeyboardFocus( UI.InviteFriend_EditNicknameWnd:GetUiHandle() )

end


--
function UI.InviteFriendWnd:Setup( mode )

	self.mode = mode

end


--
function UI.InviteFriendWnd:UpdateText()

	if self.mode == UI.InviteFriendWnd.Modes.FRIEND then
		self:SetText( UI:GetStringByName( "invite_friend_caption_invite" ), UI.InviteFriendWnd.layers.CAPTION )
		UI.InviteFriendWnd_InviteBtn:SetText( UI:GetStringByName( "invite_friend_invite_btn_invite" ), UI.InviteFriendWnd_InviteBtn.layers.TEXT )
	elseif self.mode == UI.InviteFriendWnd.Modes.CLAN then
		self:SetText( UI:GetStringByName( "invite_clan_caption_invite" ), UI.InviteFriendWnd.layers.CAPTION )
		UI.InviteFriendWnd_InviteBtn:SetText( UI:GetStringByName( "invite_clan_invite_btn_invite" ), UI.InviteFriendWnd_InviteBtn.layers.TEXT )
	else
		self:SetText( UI:GetStringByName( "invite_friend_caption_add" ), UI.InviteFriendWnd.layers.CAPTION )
		UI.InviteFriendWnd_InviteBtn:SetText( UI:GetStringByName( "invite_friend_invite_btn_add" ), UI.InviteFriendWnd_InviteBtn.layers.TEXT )
	end

end


--
function UI.InviteFriendWnd:DoRequest( uid )

	if self.mode == UI.InviteFriendWnd.Modes.FRIEND then
		self.requestId = _G.MasterServer_Social_FriendsSendRequest( uid )
	elseif self.mode == UI.InviteFriendWnd.Modes.WATCH then
		self.requestId = _G.MasterServer_Social_WatchAdd( uid )
	elseif self.mode == UI.InviteFriendWnd.Modes.IGNORE then
		self.requestId = _G.MasterServer_Social_IgnoreAdd( uid )
	elseif self.mode == UI.InviteFriendWnd.Modes.CLAN then
		self.requestId = UI.Clan:InviteToClan( uid )
	else
		sys.log( "UI.InviteFriendWnd:DoRequest( uid )[ERROR]: unknown mode :%d", self.mode )
	end

end


--
function UI.InviteFriendWnd:F_OnAfterHideFromScreen()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )

end


--
function UI.InviteFriendWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if self.msgBoxH == boxHandle then
		self.msgBoxH = nil
		return true
	end

	return false

end


--
function UI.InviteFriendWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.InviteFriendWnd_InviteBtn then
		self:OnOk()

	elseif wnd == UI.InviteFriendWnd_CrossBtn then
		self:OnCancel()

	elseif wnd == UI.InviteFriendWnd_CancelBtn then
		self:OnCancel()
	end

	return true

end


--
function UI.InviteFriendWnd:OnEnter( key, controllerIdx )

	if self:IsInputBlocked() then
		return true
	end

	self:OnOk()
	return true	

end


--
function UI.InviteFriendWnd:OnEscape( key, controllerIdx )

	if self:IsInputBlocked() then
		return true
	end

	self:OnCancel()
	return true	

end



--
function UI.InviteFriendWnd:OnOk()

	local uid = _G.MasterServer_GetUid( UI.InviteFriend_EditNicknameWnd:GetEditText() )
	if uid == UI.INVALID_U64_ID then
		self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
		self.nickname = UI.InviteFriend_EditNicknameWnd:GetEditText()
	else
		--self.requestId = _G.MasterServer_Social_FriendsSendRequest( uid )
		self:DoRequest( uid )
	end

end


--
function UI.InviteFriendWnd:OnCancel()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()

end


--
function UI.InviteFriendWnd:F_OnEventRestoreUiState()

end


-- ------------------------------------------------------------------------
-- UI.InviteFriendWnd_CrossBtn
-- ------------------------------------------------------------------------

UI.InviteFriendWnd_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "InviteFriendWnd_CrossBtn"
		}
	}
}


-- ------------------------------------------------------------------------
-- UI.InviteFriendWnd_InviteBtn, UI.InviteFriendWnd_InviteBtn
-- ------------------------------------------------------------------------

--
UI.InviteFriendWnd_InviteBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "InviteFriendWnd_InviteBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   			},
   		}
	},
}


--
UI.InviteFriendWnd_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "InviteFriendWnd_CancelBtn",
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
-- UI.InviteFriend_EditNicknameWnd
-- ------------------------------------------------------------------------

UI.InviteFriend_EditNicknameWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "InviteFriend_EditNicknameWnd",
     		activationOrder	= -1,
     		symbolsLimit	= UI.MAX_NICKNAME_EDIT_LEN,
    		--isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "friends_invite_edit_nickname",
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
    },

	effectInfo =
    {
    	main =
    	{
    		textObjName				= "title_2",
    		selectionColorObjName	= "title_2",
    		cursorColorObjName		= "title_2",
    		animActive				= "idle",
    		animInactive			= "idle",
    	}
    }
}


-- ------------------------------------------------------------------------
-- UI.InviteFriend_EditInviteWnd
-- ------------------------------------------------------------------------

UI.InviteFriend_EditInviteWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditWnd",

     	props =
     	{
     		name			= "InviteFriend_EditInviteWnd",
     		activationOrder	= -1,
    		--isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "friends_invite_edit_nickname",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
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
    		textObjName				= "title_2",
    		selectionColorObjName	= "title_2",
    		cursorColorObjName		= "title_2",
    		animActive				= "idle",
    		animInactive			= "idle",
    	}
    }
}