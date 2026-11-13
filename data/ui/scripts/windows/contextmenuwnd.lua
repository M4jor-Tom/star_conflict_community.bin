-- ----------------------------------------------------------------------------
--
-- Workfile: controlswnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- ------------------------------
-- const
-- ------------------------------



-- ------------------------------
-- vars
-- ------------------------------


-- ------------------------------
-- interface functions
-- ------------------------------


-- -----------------------------------------------------------------
-- UI.ContextMenu_ListWnd
-- -----------------------------------------------------------------

UI.ContextMenuWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ContextMenuWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "ContextMenuWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype		= true,
		activationOrder	= 0,
	},	

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= true,

			--[[effects =
			{{
				defName				= "conext_menu_list",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.ContextMenuWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS,
					},
				}
			}}]]
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x44ff0000,
			visible		= false,
		},

		-- CAPTION
		--[[{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},]]
	}
}

-- -----------------------------------
-- const
-- -----------------------------------


UI.ContextMenuWnd.sounds = 
{
	show = UI.sounds.btnClick
}

UI.ContextMenuWnd.MAX_SLOTS = 17

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ContextMenuWnd:Show( posX, posY )

	if self:GetNumRecords() > 0 then

		UI:PlayGlobalSound( self.sounds.show )
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		local mainEffectSize	= mainEffect:GetObjSize( "self" )
		local mainSlotSize		= mainEffect:GetObjSize( self.effectInfo.main.slotObjNamePrefix.."1" )
		local mouseX = UI:GetMouseX() + 1
		local mouseY = UI:GetMouseY() + 1

		self:SetHeight( mainEffectSize.y - ( self.MAX_SLOTS - self:GetNumRecords() ) * mainSlotSize.y - 9 )
		if( mouseY + self:GetHeight() > 768 ) then
			mouseY = mouseY - self:GetHeight()
		end
		self:SetTop( mouseY )

		self:SetWidth( mainEffectSize.x )
		if( mouseX + self:GetWidth() > 1024 ) then
			mouseX = 1024 - self:GetWidth()
		end
		self:SetLeft( mouseX )

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		local animTime = ( self:GetNumRecords() - 1 ) / ( self.MAX_SLOTS - 1 )
		UI:Clamp( animTime, 0, 1 )
		mainEffect:SetAnimationTime( animTime ) 
		mainEffect:Update( 0 )	

		UI.Root:AddChild( self )
		UI:SetKeyboardFocus( self:GetUiHandle() )

	end

end

--
function UI.ContextMenuWnd:Hide()
	self:UnlinkFromParent()
end

--
function UI.ContextMenuWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )
	if key == UI.Keys.KEY_ESCAPE then
		self:Hide()
	end
	return true
end


UI.ContextMenu = {}
local cm = UI.ContextMenu

-- ------------------------------
-- window definition
-- ------------------------------

UI.ContextMenu.def =
{
	className	= "Wnd",
	prototype	= "ContextMenuWnd",

	props =
	{
		name				= "ContextMenu",
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName				= "conext_menu_list",
				defaultAnimation    = "idle",

				links =
				{
					--[[{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},]]

					{
						objName		= "name",
						layer		= "UI.ContextMenu.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x44ff0000,
			visible		= false,
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},
	},
}


UI.ContextMenu.btnPrototypeName	= "ContextMenu_SlotWnd"

UI.ContextMenu.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
	}
}

UI.ContextMenu.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.ContextMenu.MAX_SLOTS = 17

UI.ContextMenu.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	CAPTION			= 2,
}


--
function UI.ContextMenu:SetName( name )

	local selfRect = self:GetLayerRect( self.layers.CAPTION )
	local str = UI:GetCutTextWithEllipses( name, selfRect.z, self:GetFont( self.layers.CAPTION ) )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ContextMenu:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.ContextMenu:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.ContextMenu:F_OnEventMouseButtonDown( hSender, btnIdx )

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	

	local rect = self:GetRect()

	local parent = self:GetParent()
	if parent then
		rect = parent:ToScreen( rect )
	end

	if not UI:IsPtInRect( rect, mouseX, mouseY ) then

		self:Hide()
	end

end


-- -----------------------------------------------------------------
-- UI.FriendsList_SlotWnd
-- -----------------------------------------------------------------

UI.ContextMenu_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ContextMenu_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "ContextMenu_SlotWnd",
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
			updatable	= false,

			effects =
			{{
				defName 			= "conext_menu_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "name",	
						layer		= "UI.ContextMenu_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "exclamatory",	
						layer		= "UI.ContextMenu_SlotWnd.layers.IMAGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},
		-- IMAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "conext_menu_slot_image",
				defaultAnimation	= "idle",
			}}
		}
	}
}


--
UI.ContextMenu_SlotWnd.actions = 
{
	WHISPER								= 0,
	ADD_TO_SQUAD						= 1,
	REQUEST_TO_SQUAD					= 2,
	GIVE_LEADERSHIP						= 3,
	EXCLUDE_FROM_SQUAD					= 4,
	REQUEST_TO_FRIENDSHIP				= 5,
	REMOVE_FROM_FRIEND					= 6,
	ADD_TO_WATCH						= 7,
	REMOVE_FROM_WATCH					= 8,
	ADD_TO_IGNORE						= 9,
	REMOVE_FROM_IGNORE					= 10,
	COMPLAIN							= 11,
	REMOVE_FROM_FRIEND_REQUEST			= 12,
	LEAVE_SQUAD							= 13,
	INVITE_TO_CLAN						= 14,
	KICK_FROM_CLAN						= 15,
	CHANGE_PRIVILEGES					= 16,
	LEAVE_CLAN							= 17,
	DISBAND_CLAN						= 18,
	SHOW_PROFILE						= 19,
	PLAYER_RENAME						= 20,
	COMPLAINT_CHAT						= 21,
	SEND_MAIL							= 22,
	LEAVE_LOBBY							= 23,
	EXCLUDE_FROM_LOBBY					= 24,
	INVITE_TO_LOBBY						= 25,
	PUNISHMENT_CHAT 					= 26,
	QUEST 								= 27,
	REQUEST_TO_CLAN 					= 28,
	REJECT_REQUEST_TO_CLAN 				= 29,
	REQUEST_TO_TEACHER 					= 30,
	REQUEST_TO_STUDENT					= 31,
	STOP_BE_TEACHER 					= 32,
	STOP_BE_STUDENT						= 33,
	SEND_SCOUT 							= 34,
	DREADNOUGHT_MOVE 					= 35,
	DREADNOUGHT_MOVE_TO_HANGAR 			= 36,
	OPEN_SHIPYARD 						= 37,
	ARENA_DISBAND_TEAM					= 38,
	ARENA_LEAVE							= 39,
	ARENA_INVITE_PLAYER					= 40,
	ARENA_KICK_PLAYER					= 41,
	TRADING								= 42,
	ZONE_CIVILIAN_CHANGE				= 43,
	USER_NOTE_ADD						= 44,
	ADVENTURES							= 45,
}


--
UI.ContextMenu_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    TEXT				= 1,
    IMAGE_EFFECT		= 2,
}

UI.ContextMenu_SlotWnd.metaText = nil
UI.ContextMenu_SlotWnd.metaTextPos = nil
UI.ContextMenu_SlotWnd.hMsgIgnoreConfirm = UI.INVALID_UI_HANDLE


--
function UI.ContextMenu_SlotWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), self:GetLayerHeight( self.layers.TEXT ) ), true )
	self.metaText:SetParentWindow( self )

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end

--
function UI.ContextMenu_SlotWnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.ContextMenu_SlotWnd:Reset()
	self.metaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.IMAGE_EFFECT )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "idle" )

	self.hMsgIgnoreConfirm = UI.INVALID_UI_HANDLE
end

--
function UI.ContextMenu_SlotWnd:UpdateForData( data, bAnimated )
	self:Reset()
	local text = ""
	local metaTextLocator = "name"
	for k, v in pairs( UI.ContextMenu_SlotWnd.actions ) do
		if v == data.action then
			if v == UI.ContextMenu_SlotWnd.actions.CHANGE_PRIVILEGES then

				text = UI:GetStringByName( "contextmenu_"..k.."_"..data.param )

			elseif v == UI.ContextMenu_SlotWnd.actions.SEND_SCOUT then

				text = UI:GetStringByName( "contextmenu_"..k )
				text = string.gsub( text, "%$cur%$", data.cur )
				text = string.gsub( text, "%$max%$", data.max )
				local costStr = ""
				if data.cost then
					costStr = UI:GetStringByName( "contextmenu_bfs_send_cost" )
					costStr = string.gsub( costStr, "%$val%$", data.cost )
				end
				text = string.gsub( text, "%$cost%$", costStr )

			elseif v == UI.ContextMenu_SlotWnd.actions.DREADNOUGHT_MOVE then

				text = UI:GetStringByName( "contextmenu_"..k )
				local costStr = ""
				if data.cost then
					costStr = UI:GetStringByName( "contextmenu_bfs_send_cost" )
					costStr = string.gsub( costStr, "%$val%$", data.cost )
				end
				text = string.gsub( text, "%$cost%$", costStr )

			elseif v == UI.ContextMenu_SlotWnd.actions.DREADNOUGHT_MOVE_TO_HANGAR then

				text = UI:GetStringByName( "contextmenu_"..k )
				local costStr = ""
				if data.cost then
					costStr = UI:GetStringByName( "contextmenu_bfs_send_cost" )
					costStr = string.gsub( costStr, "%$val%$", data.cost )
				end
				text = string.gsub( text, "%$cost%$", costStr )

			elseif v == UI.ContextMenu_SlotWnd.actions.QUEST then

				text = UI:GetStringByName( "quest_"..UI:Val2Key( QuestId, data.quest_id ).."_name" )
				local imageEffect = UI:GetEffectFromLayer( self, self.layers.IMAGE_EFFECT )
				self:SetLayerVisible( true, self.layers.IMAGE_EFFECT )
				if data.questState == UI.GameplayPveMapElement_MissionWnd.QuestState.WIN then
					imageEffect:StartAnimation( "tick" )
				elseif data.questState == UI.GameplayPveMapElement_MissionWnd.QuestState.MAIN then
					imageEffect:StartAnimation( "idle" )
				else
					imageEffect:StartAnimation( "idle_2" )
				end
				metaTextLocator = "name4"

			elseif v == UI.ContextMenu_SlotWnd.actions.ARENA_INVITE_PLAYER then

				text = UI:GetStringByName( "contextmenu_"..k )

				local leftInviteAttempts = UI.Arena:GetLeftInviteAttempts()
				text = string.format( "%s(%d)", text, leftInviteAttempts )

			elseif v == UI.ContextMenu_SlotWnd.actions.ADVENTURE then

				text = UI:GetStringByName( "adventure_"..UI:Val2Key( ai.Adventures, data.atid ).."_name" )
				local imageEffect = UI:GetEffectFromLayer( self, self.layers.IMAGE_EFFECT )

				imageEffect:StartAnimation( "idle_2" )
				metaTextLocator = "name4"

			else

				text = UI:GetStringByName( "contextmenu_"..k )

			end
		end
	end
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if data.disable then
		mainEffect:StartAnimation( "disable" )
	end
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaTextPos = mainEffect:GetObjPos( metaTextLocator )
	self.metaText:SetText( text, true )
	self:UpdateEffects()
end

--
function UI.ContextMenu_SlotWnd:UpdateEffects()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end
	local x = self:XToScreen( self.metaTextPos.x )
	local y = self:YToScreen( self.metaTextPos.y )
	self.metaText:SetScreenOrg( UI:Vec2( x, y ) )
	--[[local effect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )
	effect:Update( 0 )]]
end

--
function UI.ContextMenu_SlotWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateEffects()
end

--
function UI.ContextMenu_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
	self:OnScreenPosChanged( oldScreenX, oldScreenY )
	if self:GetNumLayers() == 0 then
		return
	end
	if self:IsOnScreen() then
		self:UpdateEffects()
	end
end

--
function UI.ContextMenu_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( 0, 0, 1024, 768 )
	end
end

--
function UI.ContextMenu_SlotWnd:Action()

	local data = self:GetRecordData()

	if data.disable then
		return
	end

	if data.action == UI.ContextMenu_SlotWnd.actions.WHISPER then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		UI:ChatWisperByUid( data.uid )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ADD_TO_SQUAD then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			if UI.HudWnd and UI.HudWnd:IsOnScreen() and _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE then
				_G.CL_RequestSendSquadInvite( data.uid )
			else
				_G.MasterServer_SquadInviteSend( data.uid )
			end
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REQUEST_TO_SQUAD then

	elseif data.action == UI.ContextMenu_SlotWnd.actions.GIVE_LEADERSHIP then

	elseif data.action == UI.ContextMenu_SlotWnd.actions.EXCLUDE_FROM_SQUAD then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		--_G.MasterServer_SquadKick( data.uid )
		if not data.isBot then
			UI.Squad:Kick( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REQUEST_TO_FRIENDSHIP then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			_G.MasterServer_Social_FriendsSendRequest( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REMOVE_FROM_FRIEND then
		UI:PlayGlobalSound( "sound/ui/cancel" )
		if not data.isBot then
			_G.MasterServer_Social_FriendsRemove( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ADD_TO_WATCH then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			_G.MasterServer_Social_WatchAdd( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REMOVE_FROM_WATCH then
		UI:PlayGlobalSound( "sound/ui/cancel" )
		if not data.isBot then
			_G.MasterServer_Social_WatchRemove( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ADD_TO_IGNORE then

		local msg = UI:GetStringByName( "ignorePlayerConfirm" )
		local playerName = UI:MakePlayerNameByUid( data.uid, false, false, nil )

		local numSubst = 0
		msg, numSubst = string.gsub( msg, "%$player%$", playerName ) 

		if numSubst == 0 then
			sys.log( "UI.ContextMenu_SlotWnd:Action()[ERROR]: cannot find placeholder \"$player$\" in string \"ignorePlayerConfirm\"" )
			msg = string.format( "[INVALID STRING] Do you want to ignore player %s?", playerName )
		end
	
		self.hMsgIgnoreConfirm = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), msg, UI.MBS_YES_NO )

	elseif data.action == UI.ContextMenu_SlotWnd.actions.REMOVE_FROM_IGNORE then
		UI:PlayGlobalSound( "sound/ui/cancel" )
		if not data.isBot then
			_G.MasterServer_Social_IgnoreRemove( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.COMPLAIN then
		
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REMOVE_FROM_FRIEND_REQUEST then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			_G.MasterServer_Social_FriendsRejectRequest( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.LEAVE_SQUAD then
		UI:PlayGlobalSound( "sound/ui/cancel" )
		_G.MasterServer_SquadLeave()
	elseif data.action == UI.ContextMenu_SlotWnd.actions.INVITE_TO_CLAN then
		if not data.isBot then
			UI.Clan:InviteToClan( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.KICK_FROM_CLAN then
		UI.ClansMainWnd:KickPlayer( data.uid, data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.CHANGE_PRIVILEGES then
		UI.ClansMainWnd:SetRights( data.uid, data.param, data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.LEAVE_CLAN then
		UI.ClansMainWnd:LeaveClan()
	elseif data.action == UI.ContextMenu_SlotWnd.actions.DISBAND_CLAN then
		UI.ClansMainWnd:LeaveClan()
	elseif data.action == UI.ContextMenu_SlotWnd.actions.SHOW_PROFILE then
		if UI.HangarWnd:IsOnScreen() and not UI.DebriefingWnd:IsOnScreen() and not UI.DebriefingOWWnd:IsOnScreen() then
			UI.HangarWnd:ShowProfile( data.uid, nil, true )
		else
			UI.Profile_Wnd:UnlinkFromParent()
			UI.Profile_Wnd:Show()
			UI.Profile_Wnd:Setup( data.uid )
			UI.Profile_Wnd:UpdateMode()
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.PLAYER_RENAME then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.PLAYER_RENAME, UI:GetPlayerNicknameByUid( _G.MasterServer_GetLocalUserId() ) )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.COMPLAINT_CHAT then
		UI.Complaint_Wnd:Show( data.additionalData.fromName, data.additionalData.toName, data.uid, MasterServer.AbuseCategory.ABUSE_CHAT_ABUSE, data.additionalData.tabId, nil, data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.PUNISHMENT_CHAT then
		UI.Complaint_Wnd:Show( data.additionalData.fromName, data.additionalData.toName, data.uid, MasterServer.AbuseCategory.ABUSE_CHAT_ABUSE, data.additionalData.tabId, UI.Complaint_Wnd.Modes.PUNISHMENT, data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.SEND_MAIL then
		UI:CreateNewLetter( data.uid, nil, nil, data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.EXCLUDE_FROM_LOBBY then
		if not data.isBot then
			_G.MasterServer_LobbyKick( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.LEAVE_LOBBY then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		_G.MasterServer_LobbyLeave()
	elseif data.action == UI.ContextMenu_SlotWnd.actions.INVITE_TO_LOBBY then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			_G.MasterServer_LobbyInvite( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.QUEST then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		UI.GameplayPveMapWnd:ShowQuest( data.quest_id, data.questType, true )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REQUEST_TO_CLAN then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		_G.MasterServer_ClanJoinReqCreate( data.cid )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REJECT_REQUEST_TO_CLAN then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		_G.MasterServer_ClanJoinReqCancel( _G.MasterServer_GetLocalUserId(), data.cid )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REQUEST_TO_TEACHER then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			_G.MasterServer_Teaching_RequestToTeacher( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.REQUEST_TO_STUDENT then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			_G.MasterServer_Teaching_RequestToStudent( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.STOP_BE_TEACHER or data.action == UI.ContextMenu_SlotWnd.actions.STOP_BE_STUDENT then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		if not data.isBot then
			_G.MasterServer_Teaching_Reject( data.uid )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.SEND_SCOUT then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		UI.GameplayPveMapWnd:SendShip( data.zone, "", data.cost )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.DREADNOUGHT_MOVE then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		local dreadnoughtName, dreadnought = UI.Clan:GetCurrentDreadnought()
		if dreadnoughtName and dreadnoughtName ~= "" then
			UI.GameplayPveMapWnd:SendShip( data.zone, dreadnoughtName, data.cost )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.DREADNOUGHT_MOVE_TO_HANGAR then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		local dreadnoughtName, dreadnought = UI.Clan:GetCurrentDreadnought()
		if dreadnoughtName and dreadnoughtName ~= "" then
			UI.GameplayPveMapWnd:SendShip( data.zone, dreadnoughtName, data.cost )
		end
	elseif data.action == UI.ContextMenu_SlotWnd.actions.OPEN_SHIPYARD then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.CLAN )
		UI.ClansMain_TabsWnd:SelectTab( "SHIPYARD" )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ARENA_DISBAND_TEAM then
		UI.Arena:DisbandTeam()
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ARENA_LEAVE then
		UI.Arena:Leave()
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ARENA_INVITE_PLAYER then
		UI.Arena:InvitePlayer( data.uid, data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ARENA_KICK_PLAYER then
		UI.Arena:KickPlayer( data.uid, data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.TRADING then
		UI:CreateNewLetter( data.uid, UI:GetStringByName( "mail_tradingOffer_theme" ), UI:GetStringByName( "mail_tradingOffer_msg" ), data.isBot )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.ZONE_CIVILIAN_CHANGE then
		UI.GameplayPveMapWnd:LaunchBuyWnd( UI.BuyWnd.modes.ZONE_CIVILIAN_CHANGE, { zoneId = data.zoneId } )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.USER_NOTE_ADD then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.USER_NOTE, UI:GetUserNote( data.uid ), { uid = data.uid } )
	elseif data.action == UI.ContextMenu_SlotWnd.actions.QUEST then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		UI.GameplayPveMapWnd:ShowAdventure( data.aiid )
	else
		sys.log( "function UI.ContextMenu_SlotWnd:Action()[ERROR]: unknown action: %d", data.action )
	end

end


--
function UI.ContextMenu_SlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local data = self:GetRecordData()
	if data.disable then
		return true
	end

	self:Action()
	UI.ContextMenu:Hide()
	return true

end


--
function UI.ContextMenu_SlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local data = self:GetRecordData()
	if data.disable then
		return true
	end

	self:Action()
	UI.ContextMenu:Hide()
	return true

end


--
function UI.ContextMenu_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	local data = self:GetRecordData()
	if data.disable then
		return true
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "over" )
	return true

end


--
function UI.ContextMenu_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	local data = self:GetRecordData()
	if data.disable then
		return true
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "idle" )
	return true

end


--
function UI.ContextMenu_SlotWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgIgnoreConfirm then

		self.hMsgIgnoreConfirm = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			local data = self:GetRecordData()

			UI:PlayGlobalSound( UI.sounds.btnClick )
			
			if not data.isBot then
				_G.MasterServer_Social_IgnoreAdd( data.uid )
			end

		end

	end

end