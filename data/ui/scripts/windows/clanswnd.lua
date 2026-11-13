-- ----------------------------------------------------------------------------
--
-- Workfile: clanswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.ClansWnd
-- -----------------------------------------------------------------

UI.ClansMainWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------


--
UI.ClansMainWnd.layers = 
{
	MAIN_EFFECT 		= 0,
	BG_EFFECT			= 1,
	WORK_EFFECT			= 2,
	CAPTION				= 3,
	LOADING_EFFECT		= 4,
}


UI.ClansMainWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "ClansMainWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT  + UI.WS_NOT_KB_REACT]],
	},	

	layers =
	{
		numLayers = UI.ClansMainWnd.layers.LOADING_EFFECT + 1,
		firstOverlayLayer = UI.ClansMainWnd.layers.LOADING_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "shop_main",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "win",	
						layer		= "UI.ClansMainWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "clan_rating_main",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "loading2",
						layer		= "UI.ClansMainWnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_x",
						wnd			= "UI.ClansMainWnd_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list3",
						wnd			= "UI.ClansMyClan_Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list5",
						wnd			= "UI.ClansLeaderboards_Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list7",
						wnd			= "UI.Clans_FindWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "bookmark_2",
						wnd			= "UI.ClansMain_TabsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title",
						layer		= "UI.ClansMainWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL
					},

					{
						objName		= "list5",
						wnd			= "UI.ClanShipWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "list5",
						wnd			= "UI.Clans_HistoryWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "list3",
						wnd			= "UI.ClanWarWnd",
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
   			text			= "^clans_window_caption",
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
	},

	children = { "UI.ClansMainWnd_CrossBtn", "UI.ClansMyClan_Wnd", "UI.ClansMain_TabsWnd", "UI.Clans_FindWnd", "UI.ClansLeaderboards_Wnd", "UI.ClanShipWnd", "UI.Clans_HistoryWnd", "UI.ClanWarWnd" },
}

-- -----------------------------------
-- const
-- -----------------------------------
UI.ClansMainWnd.Modes = 
{
	CLAN = 
	{
		name = "CLAN",
		text = UI:GetStringByName( "clans_window_tab_CLAN" )
	},

	LEADERBOARD = 
	{
		name = "LEADERBOARD",
		text = UI:GetStringByName( "clans_window_tab_LEADERBOARD" )
	},

	SHIPYARD = 
	{
		name = "SHIPYARD",
		text = UI:GetStringByName( "clans_window_tab_SHIPYARD" ),
	--	bDisabled = true,
--[[
		tooltip = 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			caption = UI:GetStringByName( "tooltip_clan_tabs_SHIPYARD_caption" ),
			text = UI:GetStringByName( "tooltip_clan_tabs_SHIPYARD_text" ),
		},
]]
	},
	
	HISTORY =
	{
		name = "HISTORY",
		text = UI:GetStringByName( "clans_window_tab_HISTORY" )
	},

	DUMMY = 
	{
		name = "DUMMY",
	},
	
	CLAN_WAR =
	{
		name = "CLAN_WAR",
		text = UI:GetStringByName( "clans_window_tab_CLAN_WAR" )
	},
}

UI.ClansMainWnd.Order = 
{
	"CLAN",
	"LEADERBOARD",
	"SHIPYARD",
	"HISTORY",
	"CLAN_WAR",
}

-- -----------------------------------
-- vars
-- -----------------------------------

--
UI.ClansMainWnd.bCrossWnd			= nil
UI.ClansMainWnd.bInviteBtn			= nil
UI.ClansMainWnd.msgBoxLeaveH		= UI.INVALID_UI_HANDLE
UI.ClansMainWnd.msgBoxCantLeaveH	= UI.INVALID_UI_HANDLE
UI.ClansMainWnd.msgBoxSetRole		= UI.INVALID_UI_HANDLE
UI.ClansMainWnd.msgBoxKickPlayer	= UI.INVALID_UI_HANDLE
UI.ClansMainWnd.msgDeleteTag		= UI.INVALID_UI_HANDLE
UI.ClansMainWnd.uid					= nil
UI.ClansMainWnd.right				= nil
UI.ClansMainWnd.isBot				= nil
UI.ClansMainWnd.mode 				= nil
UI.ClansMainWnd.inited 				= false

UI.ClansMainWnd.sounds =
{
	hide						= "sound/ui/MsgHide",
	itemsScrollRange			= "sound/ui/btnMouseOver",
	tradeWndShow				= "sound/ui/btnClick",
	clanLeave					= "sound/ui/cancel"
}


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClansMainWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	if not UI.ClanExtend_BuyWnd:IsOnScreen() then
		return
	end
	UI.ClanExtend_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ClansMyClan_Wnd:UpdateTokens()
end

--
function UI.ClansMainWnd:StartWait()
	self:SetLayerVisible( true, self.layers.LOADING_EFFECT )
	UI.ClansMyClan_Wnd:UnlinkFromParent()
end

--
function UI.ClansMainWnd:StopWait()
	self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
	if self.mode == "CLAN" then
		self:AddChild( UI.ClansMyClan_Wnd )
	end
end

--
function UI.ClansMainWnd:SetMode( modeName )
	self.mode = modeName
	if self.mode == "CLAN" then 
		self:AddChild( UI.ClansMyClan_Wnd )
		UI.Clans_FindWnd:UnlinkFromParent()
		self:AddChild( UI.ClansMain_TabsWnd )
		UI.ClansLeaderboards_Wnd:UnlinkFromParent()
		UI.ClanShipWnd:UnlinkFromParent()
		UI.Clans_HistoryWnd:UnlinkFromParent()
		UI.ClanWarWnd:UnlinkFromParent()
	elseif self.mode == "LEADERBOARD" then 
		UI.ClansMyClan_Wnd:UnlinkFromParent()
		UI.Clans_FindWnd:UnlinkFromParent()
		self:AddChild( UI.ClansMain_TabsWnd )
		self:AddChild( UI.ClansLeaderboards_Wnd )
		UI.ClanShipWnd:UnlinkFromParent()
		UI.Clans_HistoryWnd:UnlinkFromParent()
		UI.ClanWarWnd:UnlinkFromParent()
	elseif self.mode == "DUMMY" then 
		UI.ClansMyClan_Wnd:UnlinkFromParent()
		self:AddChild( UI.Clans_FindWnd )
		UI.ClansMain_TabsWnd:UnlinkFromParent()
		UI.ClansLeaderboards_Wnd:UnlinkFromParent()
		UI.ClanShipWnd:UnlinkFromParent()
		UI.Clans_HistoryWnd:UnlinkFromParent()
		UI.ClanWarWnd:UnlinkFromParent()
	elseif self.mode == "SHIPYARD" then 
		UI.ClansMyClan_Wnd:UnlinkFromParent()
		UI.Clans_FindWnd:UnlinkFromParent()
		UI.ClansLeaderboards_Wnd:UnlinkFromParent()
		UI.Clans_HistoryWnd:UnlinkFromParent()
		UI.ClanWarWnd:UnlinkFromParent()
		self:AddChild( UI.ClansMain_TabsWnd )
		self:AddChild( UI.ClanShipWnd )
	elseif self.mode == "HISTORY" then 
		UI.ClansMyClan_Wnd:UnlinkFromParent()
		UI.Clans_FindWnd:UnlinkFromParent()
		UI.ClansLeaderboards_Wnd:UnlinkFromParent()
		UI.ClanShipWnd:UnlinkFromParent()
		UI.ClanWarWnd:UnlinkFromParent()
		self:AddChild( UI.ClansMain_TabsWnd )
		self:AddChild( UI.Clans_HistoryWnd )
	elseif self.mode == "CLAN_WAR" then
		UI.ClansMyClan_Wnd:UnlinkFromParent()
		UI.Clans_FindWnd:UnlinkFromParent()
		UI.ClansLeaderboards_Wnd:UnlinkFromParent()
		UI.ClanShipWnd:UnlinkFromParent()
		UI.Clans_HistoryWnd:UnlinkFromParent()
		self:AddChild( UI.ClansMain_TabsWnd )
		self:AddChild( UI.ClanWarWnd )
	end
	self:Update( self.mode )
end

--
function UI.ClansMainWnd:Update( mode )
	if not UI.ClansMainWnd:IsOnScreen() then
		return
	end

	if not UI.Clan:IsInClan() then
		if self.mode ~= "DUMMY" then
			self:SetMode( "DUMMY" )
			return
		end
	else
		if self.mode == "DUMMY" then
			UI.ClansMain_TabsWnd:SelectRecord( 1 )
			self:SetMode( "CLAN" )
			return
		end
	end

	if self.mode ~= mode then
		return
	end

	self:StopWait()
	if self.mode == "CLAN" then
		UI.ClansMyClan_Wnd:Update()
	else

	end
end

--
function UI.ClansMainWnd:LeaveClan()
	if not UI.Clan:IsLeader( _G.MasterServer_GetLocalUserId() ) then
		self.msgBoxLeaveH = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msgClan_leave_text" ), UI.MBS_YES_NO )
	else
		if UI.Clan:GetMembersCount() == 1 then
			self.msgBoxLeaveH = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msgClan_leaveLeader_text" ), UI.MBS_YES_NO )
		else
			self.msgBoxCantLeaveH = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msgClan_cantLeaveLeader_text" ), UI.MBS_OK )
		end
	end
end

--
function UI.ClansMainWnd:ExtendClan()
	if UI.Clan:IsMaxExpandReached( MasterServer.ClanUpgrades.CU_CAPACITY ) then
		local str = UI:GetStringByName( "clans_error_max_capacity" )
		str = string.format( str, _G.ClanUpgradeValues[ #_G.ClanUpgradeValues[ MasterServer.ClanUpgrades.CU_CAPACITY ] ] )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), str, UI.MBS_OK )
		return
	end
	UI.ClanExtend_BuyWnd:Setup( UI.Equipment_BuyWnd.modes.CLAN_EXPAND_USER )
	UI.ClanExtend_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )
end

--
function UI.ClansMainWnd:SetRights( uid, right, isBot )
	self.uid = uid
	self.right = right
	self.isBot = isBot or false
	local nickName, bCached, requestId = _G.MasterServer_GetNickName( uid )
	self.msgBoxSetRole = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), string.format( UI:GetStringByName( "msgClan_set_role_"..right ), nickName ), UI.MBS_YES_NO )
end

--
function UI.ClansMainWnd:KickPlayer( uid, isBot )
	self.uid = uid
	self.isBot = isBot
	local nickName, bCached, requestId = _G.MasterServer_GetNickName( uid )
	self.msgBoxKickPlayer = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), string.format( UI:GetStringByName( "msgClan_kick_player" ), nickName ), UI.MBS_YES_NO )
end

--
function UI.ClansMainWnd:Show()
	self.mode = UI.ClansMainWnd.Modes.CLAN
	UI.FullScreenWnd.Show( self )
end

--
function UI.ClansMainWnd:F_OnAfterShowOnScreen()

	UI.Clan:Init()
	if not self.inited then
		for i = 1, #self.Order do
			local v = self.Modes[ self.Order[ i ] ]
			UI.ClansMain_TabsWnd:AddRecord( v )
		end
		UI.ClansMain_TabsWnd:SelectRecord( 1 )
		self.inited = true
	else
		self:Update( self.mode )
	end

	self:OnAfterShowOnScreen()

end

-- коллбэк, вызывается из окна увеличения инвентаря
function UI.ClansMainWnd:OnBuyWndResult( result, mode )
	if result == true then
		_G.MasterServer_ClanUpgrade( MasterServer.ClanUpgrades.CU_CAPACITY )
	end
end


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClansMainWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.msgBoxLeaveH then
		self.msgBoxLeaveH = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			UI:PlayGlobalSound( UI.ClansMainWnd.sounds.clanLeave )
			UI.Clan:Leave()
		end

	elseif boxHandle == self.msgBoxSetRole then
		self.msgBoxSetRole = UI.INVALID_UI_HANDLE
		if retCode == UI.MBRET_YES then
			if not self.isBot then
				_G.MasterServer_ClanChangeRole( self.uid, MasterServer.ClanRole[ self.right ] )
			end
		end
		self.uid = nil
		self.right = nil
		self.isBot = nil

	elseif boxHandle == self.msgBoxKickPlayer then
		self.msgBoxKickPlayer = UI.INVALID_UI_HANDLE
		if retCode == UI.MBRET_YES then
			if not self.isBot then
				_G.MasterServer_ClanKick( self.uid )
			end
		end
		self.uid = nil
		self.isBot = nil

	elseif boxHandle == self.msgBoxCantLeaveH then
		self.msgBoxCantLeaveH = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.msgDeleteTag then
		self.msgDeleteTag = UI.INVALID_UI_HANDLE
		if retCode == UI.MBRET_YES then
			UI.ClanCreateWnd:DeleteClanTag()
		end
	end

end


--
function UI.ClansMainWnd:OnCancel()

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()

end


--
function UI.ClansMainWnd:Hide()

	if not self:IsOnScreen() then
		return
	end

	self:UnlinkFromParent()		

end


--
function  UI.ClansMainWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )

	--UI.ClansLeaderboards_Wnd:UnlinkFromParent()

end


--
function UI.ClansMainWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ClansMainWnd_CrossBtn == wnd then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	end

	return true

end


--
function UI.ClansMainWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if not self:IsOnScreen() then
		return false
	end

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if UI.ClansMyClan_ListWnd:IsOnScreen() then
		local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = UI.ClansMyClan_ListWnd:GetVisibleRange()
		UI.ClansMyClan_ListWnd:ScrollVisibleRange( ticks < 0 )
		local firstVisibleRecordIdx, lastVisibleRecordIdx = UI.ClansMyClan_ListWnd:GetVisibleRange()
		if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
			UI:PlayGlobalSound( self.sounds.itemsScrollRange )
		end
	end

	return true

end


-- -----------------------------------------------------------------
-- UI.TabsMain
-- -----------------------------------------------------------------
UI.TabsMain = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.TabsMain.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",
	props =
	{
		name			= "TabsMain",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype 	= true,
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
				defName				= "clan_tab_main",
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
	},
}

UI.TabsMain.btnPrototypeName	= "TabsMain_SlotWnd"
UI.TabsMain.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "btn_",
		scrollObjName		= "",
	}
}


UI.TabsMain.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK

UI.TabsMain.MAX_SLOTS = 5


UI.TabsMain.parentWindow = nil

--
function UI.TabsMain:SelectTab( tabName )
	for k, v in pairs( self.records ) do
		if v.data.name == tabName then
			self:SelectRecord( k )
			return
		end
	end
end

--
function UI.TabsMain:SelectRecordInternal( recordIdx, bAnimated )

	if self.selRecordIdx == recordIdx then
		return
	end

	local data = self:GetRecordData( recordIdx )
	if data.bDisabled then
		return
	end

	local oldSelRecordIdx = self.selRecordIdx
	local oldSelRecord = self.records[ self.selRecordIdx ]

	self.selRecordIdx = recordIdx

	if oldSelRecord then

		self:UpdateRecordForSelection( oldSelRecord )

		local slot = self:GetSlotForRecord( oldSelRecord )
		if slot then
			self:UpdateSlotForSelection( slot, bAnimated )
		end

	end

	local record = self.records[ recordIdx ] 
	if record then

		self:UpdateRecordForSelection( record )

		local slot = self:GetSlotForRecord( record )
		if slot then
			self:UpdateSlotForSelection( slot, bAnimated )
		end

	end

	self.parentWindow:SetMode( self:GetRecordData( recordIdx ).name )

	if not self.bSilent then
		UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, 0, 0 )
	end

end


--
function UI.TabsMain:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 
	if w.BUTTON_LIST_BTN then	
       	local recordIdx = w:GetRecord()
		if recordIdx ~= self:GetSelectedRecord() then
			if w:GetRecordData().bDisabled then
				--UI:PlayGlobalSound( UI.sounds.invalid )
			else
				UI:PlayGlobalSound( UI.sounds.btnClick )
				self:ActivateRecord( recordIdx )
			end
		end
	end
	return true
end


-- -----------------------------------------------------------------
-- UI.TabsMain_SlotWnd
-- -----------------------------------------------------------------
UI.TabsMain_SlotWnd = {}
-- ------------------------------
-- window definition
-- ------------------------------
--
UI.TabsMain_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",
	props =
	{
		name			= "TabsMain_SlotWnd",
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
				defName				= "msgBox_btn",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "value",
						layer		= "UI.TabsMain_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
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
UI.TabsMain_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    TEXT				= 1,
}
UI.TabsMain_SlotWnd.sounds = 
{
	over = "sound/ui/btnMouseOver",
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.TabsMain_SlotWnd:GetTooltipData()
	local data = self:GetRecordData()
	return data.tooltip
end

--
function UI.TabsMain_SlotWnd:UpdateForData( data, bAnimated )
	local text = data.text
	self:SetText( text, self.layers.TEXT )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if data.bDisabled then
		mainEffect:StartAnimation( "disable" )
	else
		mainEffect:StartAnimation( "idle" )
	end
end

--
function UI.TabsMain_SlotWnd:F_OnMouseIn()
	if not self:GetRecordData().bDisabled and not self:IsSelected() then
		UI:PlayGlobalSound( self.sounds.over )
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		mainEffect:StartAnimation( "over" )
	end
	return true
end

--
function UI.TabsMain_SlotWnd:F_OnMouseOut()
	if not self:GetRecordData().bDisabled and not self:IsSelected() then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		mainEffect:StartAnimation( "idle" )
	end
	return true
end

--
function UI.TabsMain_SlotWnd:Select( bSelect, bAnimated )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if bSelect then
		mainEffect:StartAnimation( "select" )
	else
		mainEffect:StartAnimation( "idle" )
	end
end


-- -----------------------------------------------------------------
-- UI.ClansMain_TabsWnd
-- -----------------------------------------------------------------
UI.ClansMain_TabsWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.ClansMain_TabsWnd.def =
{
	className 	= "Wnd",
	prototype	= "TabsMain",
	props =
	{
		name			= "ClansMain_TabsWnd",
	},
}

UI.ClansMain_TabsWnd.parentWindow = UI.ClansMainWnd