-- ----------------------------------------------------------------------------
--
-- Workfile: gameplaycustomwnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.GameplayCustomWnd
-- -----------------------------------------------------------------

UI.GameplayCustomWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomWnd.def =
{
	className = "Wnd",
	props =
	{
		name			= "GameplayCustomWnd",
		style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "gameplay_custom",
       			defaultAnimation	= "idle",
           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           			{
           				objName		= "info",
           				layer		= "UI.GameplayCustomWnd.layers.DESC_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "text_1",
           				layer		= "UI.GameplayCustomWnd.layers.TITLE_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "loading",
           				layer		= "UI.GameplayCustomWnd.layers.LOADING_EFFECT",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "list",
           				wnd			= "UI.GameplayCustom_List",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           		}
           	}}
		},
		-- DESC_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_description"
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 2 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_title"
		},
		-- LOADING_EFFECT
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
	children = { "UI.GameplayCustom_List" },
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayCustomWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	if self.waitNickNameResolve then
		self.waitNickNameResolve = false
		self.updateNickNameNextFrame = true
	end
end

--
function UI.GameplayCustomWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	if self.waitClanNameResolve then
		self.waitClanNameResolve = false
		self.updateNickNameNextFrame = true
	end
end

--
function UI.GameplayCustomWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	if field == MasterServer.UserProfileField.UPF_CLAN_ID then
		if self.waitClanNameResolve then
			self.waitClanNameResolve = false
			self.updateNickNameNextFrame = true
		end
	end
end

--
function UI.GameplayCustomWnd:ShowLobbyError( operation, result, badEquipment )
	--if self:IsOnScreen() then
		if result ~= 0 then
			local text = UI:GetStringByName( operation )
			local reason = UI:GetStringByName( UI:Val2Key( MasterServer.LobbyOpResult, result ) )
			if result == _G.MasterServer.LobbyOpResult.LOR_LEAGUE_FORBIDDEN_EQUIPMENT then
				reason = UI:FormatLeagueForbiddenEquipmetnMsg( reason, badEquipment or {} )
			end
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		end
	--end
end

--
function UI.GameplayCustomWnd:MasterServer_OnLobbyJoin( result, requestId )
	if result == MasterServer.LobbyOpResult.LOR_NOT_FOUND then
		self.requestId = UI.Lobby.ReloadList()
		self:ShowWait()		
	end
end


--
function UI.GameplayCustomWnd:StopRequestWaiting()
	self.requestId = nil
	self.inited = false
end

--
function UI.GameplayCustomWnd:MasterServer_OnLobbyList( result, requestId )
	if result == 0 then
		self.inited = true
		--self:HideWait()
		self:Update()
		self.lastUpdateTime = _G.TimerGetRealTime()
		self.requestId = nil
		UI.GameplayWnd:UpdateStartBtnState()
	else
		self:ShowLobbyError( "operation_LOBBY_REQUEST", result )
		self.inited = false
		self:HideWait()
		self:Update()
		if requestId == self.requestId then
			self.requestId = nil
		end
	end
end

-- -----------------------------------
-- const
-- -----------------------------------

--
UI.GameplayCustomWnd.layers =
{
    MAIN_EFFECT		= 0,
    DESC_TEXT		= 1,
    TITLE_TEXT		= 2,
    LOADING_EFFECT	= 3,
}

--
UI.GameplayCustomWnd.sounds =
{
	sectorMouseOver	= "sound/ui/btnMouseOver",
	battleSelect	= "sound/ui/btnClick",
}

--
UI.GameplayCustomWnd.UPDATE_INTERVAL = 30

--
UI.GameplayCustomWnd.workEffect = 
{
}

-- -----------------------------------
-- vars
-- -----------------------------------
UI.GameplayCustomWnd.inited = false
UI.GameplayCustomWnd.requestId = nil
UI.GameplayCustomWnd.lastUpdateTime = 0
UI.GameplayCustomWnd.waitNickNameResolve = false
UI.GameplayCustomWnd.waitClanNameResolve = false
UI.GameplayCustomWnd.updateNickNameNextFrame = false
UI.GameplayCustomWnd.selectLid = nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayCustomWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
end

--
function UI.GameplayCustomWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	if not self.inited then
		if self.requestId == nil then
			self.requestId = UI.Lobby.ReloadList()
		end
		self:ShowWait()
	end
end

--
function UI.GameplayCustomWnd:HideWait()
	self:AddChild( UI.GameplayCustom_List )
	self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
	--[[self:SetLayerVisible( false. self.layers.DESC_TEXT )
	self:SetLayerVisible( false. self.layers.TITLE_TEXT )]]
end

--
function UI.GameplayCustomWnd:ShowWait()
	UI.GameplayCustom_List:UnlinkFromParent()
	self:SetLayerVisible( true, self.layers.LOADING_EFFECT )
	--[[self:SetLayerVisible( false. self.layers.DESC_TEXT )
	self:SetLayerVisible( false. self.layers.TITLE_TEXT )]]
end

--
function UI.GameplayCustomWnd:Update()
	UI.GameplayCustom_List:Update()
end

--
function UI.GameplayCustomWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	if self.requestId == nil then
		if _G.TimerGetRealTime() - self.lastUpdateTime > self.UPDATE_INTERVAL then
			self.requestId = UI.Lobby.ReloadList()
		end
	end
	if self.updateNickNameNextFrame then
		self.updateNickNameNextFrame = false
		self:Update()
	end
end

-- -----------------------------------------------------------------
-- UI.GameplayCustom_List
-- -----------------------------------------------------------------

UI.GameplayCustom_List = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustom_List.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "GameplayCustom_List",
		style			= UI.WS_UPDATE_IF_VISIBLE --[[+ UI.WS_NOT_MOUSE_REACT]] + UI.WS_NOT_KB_REACT,
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
				defName				= "gameplay_custom_list",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "hader",
						layer		= "UI.GameplayCustom_List.layers.HEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- HEADER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_list_header",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "name",
						layer		= "UI.GameplayCustom_List.layers.NAME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_1",
						layer		= "UI.GameplayCustom_List.layers.TEXT1_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_2",
						layer		= "UI.GameplayCustom_List.layers.TEXT2_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_3",
						layer		= "UI.GameplayCustom_List.layers.TEXT4_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_40",
						layer		= "UI.GameplayCustom_List.layers.TEXT3_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_header_name"
		},
		-- TEXT1_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_header_captain"
		},
		-- TEXT2_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_header_capacity"
		},
		-- TEXT3_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_header_spectators"
		},
		-- TEXT4_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_header_type"
		},
	},
	--children = { "UI.ClansLeaderboardType_List" }
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayCustom_List.layers = 
{
	MAIN_EFFECT 			= 0,
	HEADER_EFFECT			= 1,
	NAME_TEXT				= 2,
	TEXT1_TEXT				= 3,
	TEXT2_TEXT				= 4,
	TEXT3_TEXT				= 5,
	TEXT4_TEXT 				= 6,
}

UI.GameplayCustom_List.btnPrototypeName	= "GameplayCustomList_SlotWnd"

UI.GameplayCustom_List.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
	}
}

UI.GameplayCustom_List.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.GameplayCustom_List.MAX_SLOTS = 6

UI.GameplayCustom_List.sounds =
{
	itemsScrollRange			= "sound/ui/btnMouseOver",
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.GameplayCustom_List:Update()
	local currentScroll = self:GetScrollPos()
	local curSelect = self:GetSelectedRecord()
	local lobbies = UI.Lobby:GetList()
	local skip = false
	for i = 1, #lobbies do
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( lobbies[ i ].players[ 1 ].uid )
		if not bCached then
			skip = true
		end
	end
	if skip then
		UI.GameplayCustomWnd.waitNickNameResolve = true
		return
	end
	for i = 1, #lobbies do
		local cid = _G.MasterServer_UserProfileGet( lobbies[ i ].players[ 1 ].uid ).clanId
		if not cid then
			_G.MasterServer_UserProfileRequestField( lobbies[ i ].players[ 1 ].uid, MasterServer.UserProfileField.UPF_CLAN_ID )
			skip = true
		else
			if cid ~= UI.INVALID_U64_ID then
				nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( cid )
				if not bCached then
					skip = true
				end
			end
		end
	end
	if skip then
		UI.GameplayCustomWnd.waitClanNameResolve = true
		return
	end
	UI.GameplayCustomWnd:HideWait()
	self:Clear()
	local lobbies = UI.Lobby:GetList()
	for i = 1, #lobbies do
		self:AddRecord( lobbies[ i ] )
	end
	if self:GetMaxScrollPos() < currentScroll then
		currentScroll = self:GetMaxScrollPos()
	end
	if currentScroll == -1 and self:GetMaxScrollPos() ~= - 1 then
		currentScroll = 0
	end
	self:SetScrollPos( currentScroll, true, false )
	if curSelect ~= -1 then
		self:SelectRecord( curSelect, false )
	else
		if self:GetNumRecords() > 0 then
			self:SelectRecord( 1, false )
		end
	end
	--UI.GameplayWnd:UpdateStartBtnState()
end

--
function UI.GameplayCustom_List:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if not self:IsOnScreen() then
		return false
	end
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	
	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self:GetVisibleRange()
	self:ScrollVisibleRange( ticks < 0 )
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( self.sounds.itemsScrollRange )
	end
	return true
end

--
function UI.GameplayCustom_List:ShowErrorMessage( data, details )
	local text = UI:GetStringByName( "msg_cant_enter_lobby_wrong_ships" )
	for i = 1, #details do
		if i ~= 1 then
			text = text..","
		end
		local ship = UI:GetStringByName( "gameplay_custom_game_wrong_ship")
		ship = string.gsub( ship, "%$name%$", UI:GetEntityLocalizedNameByDef( details[ i ].def, true ) )
		local reason = ""
		if details[ i ].rank then
			local rank = UI:GetStringByName( "gameplay_custom_game_wrong_ship_rank")
			rank = string.gsub( rank, "%$rank%$", details[ i ].rank )
			reason = reason..rank
		end
		if details[ i ].role then
			if details[ i ].rank then
				reason = reason..", "
			end
			local role = UI:GetStringByName( "gameplay_custom_game_wrong_ship_role")
			role = string.gsub( role, "%$role%$", UI:Role2Str( details[ i ].role ) )
			reason = reason..role
		end
		ship = string.gsub( ship, "%$reason%$", reason )
		text = text..ship
	end
	UI:MessageBox( UI:GetStringByName( "gameplay_custom_game_cant_join" ), text, UI.MBS_OK )
end

--
function UI.GameplayCustom_List:TryJoinLobbyByData( data, spectator )
	local blocked, details = UI.GameplayCustomList_SlotWnd:IsGameBlocked( data )
	if not blocked or spectator then
		if spectator and data.gameMode == ai.Gameplay.PVE_MISSION then
			return
		end
		if not data.password or data.password == 0 then
			_G.MasterServer_LobbyJoin( data.lid, "", spectator or false )
		else
			UI.GameplayCustomLobby_EnterPass:Show( data.lid, spectator )
		end
	else
		self:ShowErrorMessage( data, details )
	end
end

--
function UI.GameplayCustom_List:JoinLobby( spectator )
	if UI.Squad:IsInSquad() then
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_cant_enter_lobby_in_squad" ), UI.MBS_OK )
		return
	end
	if self:GetSelectedRecord() ~= -1 then
		local data = self:GetRecordData( self:GetSelectedRecord() )
		self:TryJoinLobbyByData( data, spectator )	
	end
end

-- -----------------------------------------------------------------
-- UI.GameplayCustomList_SlotWnd
-- -----------------------------------------------------------------

UI.GameplayCustomList_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------


--
UI.GameplayCustomList_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "GameplayCustomList_SlotWnd",
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
				defName				= "gameplay_custom_list_line",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "name",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.NAME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "info",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.DESC_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_1",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.CAPTAIN_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_2",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.CAPACITY_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_39",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.SPECTATORS_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "lock",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "map_ico",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "type_game",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.TYPE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- DESC_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 2 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- CAPTAIN_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- CAPACITY_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- SPECTATORS_TEXT
		{
			layerType		= UI.LAYER_TEXT,
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
				defName				= "itemIco_lock",
				defaultAnimation    = "idle",
			}}
		},
		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_map_ico",
				defaultAnimation    = "idle",
			}}
		},
		-- TYPE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_list_line_type",
				defaultAnimation    = "red",
				links =
				{
					{
						objName		= "text_2",
						layer		= "UI.GameplayCustomList_SlotWnd.layers.TYPE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- TYPE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	}
}


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.GameplayCustomList_SlotWnd:GetRankMaskRange( mask )
	local start = nil
	local finish = nil
	local maxRank = UI:GetMaxRank()
	for i = 1, maxRank do
		if bit.band( mask, bit.lshift( 1, i ) ) == bit.lshift( 1, i ) then
			if start == nil then
				start = i
			end
		end
	end
	if start == nil then
		sys.log( "UI.GameplayCustomList_SlotWnd:GetRankMaskRange()[ERROR]: wrong mask. It equal zero." )
		return 1, 7
	end
	finish = maxRank
	for i = start + 1, maxRank do
		if bit.band( mask, bit.lshift( 1, i ) ) == 0 then
			if finish == maxRank then
				finish = i - 1
			end
		end
	end
	return start, finish
end

-- -----------------------------------
-- const
-- -----------------------------------

--
UI.GameplayCustomList_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME_TEXT			= 1,
    DESC_TEXT			= 2,
    CAPTAIN_TEXT		= 3,
    CAPACITY_TEXT		= 4,
    SPECTATORS_TEXT 	= 5,
    LOCK_EFFECT			= 6,
    ICO_EFFECT			= 7,
    TYPE_EFFECT			= 8,
    TYPE_TEXT			= 9,
}


--
UI.GameplayCustomList_SlotWnd.MAX_PVP_PLAYERS = 32
UI.GameplayCustomList_SlotWnd.MAX_PVE_PLAYERS = 4
UI.GameplayCustomList_SlotWnd.MAX_PVP_SPECTATORS = 4


-- -----------------------------------
-- vars
-- -----------------------------------
UI.GameplayCustomList_SlotWnd.infoWnd = nil
UI.GameplayCustomList_SlotWnd.blocked = true

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.GameplayCustomList_SlotWnd:F_PostLoad()
	UI.ButtonsList3_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.infoWnd = UI:CreateChildWnd( self, UI.GameplayCustom_InfoBtn, "" )
	local workEffect = UI:GetEffectFromLayer( self, self.layers.TYPE_EFFECT )
	UI:AddChildAndLink( self, self.infoWnd, workEffect, "help_btn", UI.EffectAnimParams.POS )
end

--
function UI.GameplayCustomList_SlotWnd:IsGameBlocked( data )
	local blocked = false
	local ships = UI:GetAllEquippedShips()
	local details = {}
	if data.roleMask ~= 0 then
		for i = 1, #ships do
			local role = UI:GetDef( ships[ i ].defName ).role
			if bit.band( data.roleMask, math.pow( 2, role ) ) ~= math.pow( 2, role ) then
				table.insert( details, { def = ships[ i ].defName, role = role } )
				blocked = true
			end
		end
	end

	for i = 1, #ships do
		local rank = UI:GetDef( ships[ i ].defName ).rank
		if bit.band( data.rankMask, math.pow( 2, rank ) ) ~= math.pow( 2, rank ) then
			blocked = true
			local inserted = false
			for j = 1, #details do
				if ships[ i ].defName == details[ j ].def then
					details[ j ].rank = rank
					inserted = true
					break
				end
			end
			if not inserted then
				table.insert( details, { def = ships[ i ].defName, rank = rank } )
			end
		end
	end

	return blocked, details
end

--
function UI.GameplayCustomList_SlotWnd:UpdateForData( data, bAnimated )
	self.blocked = self:IsGameBlocked( data )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.blocked then
		mainEffect:StartAnimation( "disable" )
	else
		mainEffect:StartAnimation( "idle" )
	end

	self:SetText( UI:GetLevelLocalizedName( data.levelName )..": "..UI:Gameplay2Str( data.gameMode ), self.layers.NAME_TEXT )
	--self:SetText( data.name, self.layers.DESC_TEXT )
	local nickName = UI:MakePlayerNameByUid( data.players[ 1 ].uid, true, false )--_G.MasterServer_GetNickName( data.players[ 1 ].uid )
	local selfRect = self:GetLayerRect( self.layers.CAPTAIN_TEXT )
	nickName = UI:GetCutTextWithEllipses( nickName, selfRect.z, self:GetFont( self.layers.CAPTAIN_TEXT ) )
	self:SetText( nickName, self.layers.CAPTAIN_TEXT )
	local players = 0
	for k, v in pairs( data.players ) do
		if not v.spectator then
			players = players + 1
		end
	end

	if data.gameMode ~= ai.Gameplay.PVE_MISSION then
		self:SetText( tostring( players ).."/"..tostring( self.MAX_PVP_PLAYERS ), self.layers.CAPACITY_TEXT )
		self:SetText( tostring( #data.players - players ).."/"..tostring( self.MAX_PVP_SPECTATORS ), self.layers.SPECTATORS_TEXT )
	else
		self:SetText( tostring( players ).."/"..tostring( self.MAX_PVE_PLAYERS ), self.layers.CAPACITY_TEXT )
		self:SetText( "", self.layers.SPECTATORS_TEXT )
	end
	
	if data.password then
		self:SetLayerVisible( true, self.layers.LOCK_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
	end
	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	icoEffect:SetSpriteTexture( "ico", UI:GetMapIco( data.levelName ) )
	local typeEffect = UI:GetEffectFromLayer( self, self.layers.TYPE_EFFECT )
	if data.fair then
		typeEffect:StartAnimation( "green" )
		local str = UI:GetStringByName( "gameplay_custom_game_fair_list" )
		local min, max = UI.GameplayCustomList_SlotWnd:GetRankMaskRange( data.rankMask )
		str = string.gsub( str, "%$min_rank%$", min )
		str = string.gsub( str, "%$max_rank%$", max )
		self:SetText( str, self.layers.TYPE_TEXT )
	else
		typeEffect:StartAnimation( "red" )
		self:SetText( UI:GetStringByName( "gameplay_custom_game_not_fair_list" ), self.layers.TYPE_TEXT )
	end
end

--
function UI.GameplayCustomList_SlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI:PlayGlobalSound( "sound/ui/btnClick" )
	UI.GameplayCustom_List:SelectRecord( self:GetRecord(), true )
	return true
end

--
function UI.GameplayCustomList_SlotWnd:Select( bSelect, bAnimated )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if bSelect then
		if bAnimated then
			if self.blocked then
				mainEffect:StartAnimation( "dis_sel_over" )
			else
				mainEffect:StartAnimation( "sel_over" )
			end
		else
			if self.blocked then
				mainEffect:StartAnimation( "dis_sel" )
			else
				mainEffect:StartAnimation( "select" )
			end
		end
		local data = self:GetRecordData()
		UI.GameplayCustom_SpectatorBtn:Enable( data.gameMode ~= ai.Gameplay.PVE_MISSION )
	else
		if self.blocked then
			mainEffect:StartAnimation( "disable" )
		else
			mainEffect:StartAnimation( "idle" )
		end
	end
end

--
function UI.GameplayCustomList_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self:IsSelected() then
		if self.blocked then
			mainEffect:StartAnimation( "dis_sel_over" )
		else
			mainEffect:StartAnimation( "sel_over" )
		end
	else
		if self.blocked then
			mainEffect:StartAnimation( "dis_over" )
		else
			mainEffect:StartAnimation( "over" )
		end
	end
	return true
end

--
function UI.GameplayCustomList_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self:IsSelected() then
		if self.blocked then
			mainEffect:StartAnimation( "dis_sel" )
		else
			mainEffect:StartAnimation( "select" )
		end
	else
		if self.blocked then
			mainEffect:StartAnimation( "disable" )
		else
			mainEffect:StartAnimation( "idle" )
		end
	end
	return true
end

--
function UI.GameplayCustomList_SlotWnd:F_OnMouseLButtonDblClick()
	UI.GameplayCustom_List:JoinLobby()
	return true
end

-- -----------------------------------------------------------------
-- UI.GameplayCustomCreateWnd
-- -----------------------------------------------------------------

UI.GameplayCustomCreateWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomCreateWnd.layers =
{
    MAIN_EFFECT			= 0,
    TITLE_TEXT			= 1,
    NAME_TEXT			= 2,
	ICO_EFFECT			= 3,
	BOTS_TEXT			= 4,
	DESCRIPTION_TEXT	= 5,
	TYPE_EFFECT			= 6,
	TYPE_TEXT			= 7,
	LOADING_EFFECT		= 8,
}

UI.GameplayCustomCreateWnd.def =
{
	className = "Wnd",
	props =
	{
		name			= "GameplayCustomCreateWnd",
		style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		defaultChild	= "GameplayCustomCreate_DescEditWnd",
	},
	layers =
	{
		firstOverlayLayer = UI.GameplayCustomCreateWnd.layers.LOADING_EFFECT,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,	
			effects =
			{{
				defName 			= "gameplay_custom_create",
       			defaultAnimation	= "idle",
           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           			{
           				objName		= "title",
           				layer		= "UI.GameplayCustomCreateWnd.layers.TITLE_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
						objName		= "name",
						layer		= "UI.GameplayCustomCreateWnd.layers.NAME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "map_ico",
						layer		= "UI.GameplayCustomCreateWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "text_1",
						layer		= "UI.GameplayCustomCreateWnd.layers.BOTS_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text",
						layer		= "UI.GameplayCustomCreateWnd.layers.DESCRIPTION_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_4",
						layer		= "UI.GameplayCustomCreateWnd.layers.TYPE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "loading",
						layer		= "UI.GameplayCustomCreateWnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
           			{
           				objName		= "list",
           				wnd			= "UI.GameplayCustomCreate_ListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "drop_down",
           				wnd			= "UI.GameplayCustomCreate_RegionComboBox",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "text_input",
           				wnd			= "UI.GameplayCustomCreate_DescEditWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_long_1",
           				wnd			= "UI.GameplayCustomCreate_DisbalanceSetupBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_long_2",
           				wnd			= "UI.GameplayCustomCreate_ResetSetupBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_2",
           				wnd			= "UI.GameplayCustomCreate_PvpWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_3",
           				wnd			= "UI.GameplayCustomCreate_PveWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           		}
           	}}
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_create_title",
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_map_ico",
				defaultAnimation    = "idle",
			}}
		},
		-- BOTS_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^gameplay_custom_create_region_set",
		},
		-- DESCRIPTION_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^gameplay_custom_create_desc",
		},
		-- TYPE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName 			= "gameplay_custom_create_type",
       			defaultAnimation	= "red",
           		links =
           		{
           			{
           				objName		= "text_4",
           				layer		= "UI.GameplayCustomCreateWnd.layers.TYPE_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           		}
           	}}
        },
        -- TYPE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
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
		},
	},
	children = { "UI.GameplayCustomCreate_ListWnd", "UI.GameplayCustomCreate_DescEditWnd", "UI.GameplayCustomCreate_RegionComboBox", "UI.GameplayCustomCreate_DisbalanceSetupBtn", "UI.GameplayCustomCreate_ResetSetupBtn",
		"UI.GameplayCustomCreate_PveWnd", "UI.GameplayCustomCreate_PvpWnd" },
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.GameplayCustomCreateWnd:SetMode( mode )
	self.mode = mode
	self:UpdateModeButtons()
	self:UpdateGameplayList()
end

--
function UI.GameplayCustomCreateWnd:GetMode()
	return self.mode
end

--
function UI.GameplayCustomCreateWnd:MasterServer_OnLobbyCreate( result, requestId, badEquipment )
	if result ~= 0 then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_CREATE", result, badEquipment )
	end
	if requestId == self.requestId then
		self.requestId = nil
		self:StopWait()
	end
end

--
function UI.GameplayCustomCreateWnd:StartWait()
	self.isWait = true
	self:SetLayerVisible( true, self.layers.LOADING_EFFECT )
end

--
function UI.GameplayCustomCreateWnd:StopWait()
	self.isWait = false
	self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
end

--
function UI.GameplayCustomCreateWnd:IsWait()
	return self.isWait
end

--
function UI.GameplayCustomCreateWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:IsWait() then
		return true
	end
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == UI.GameplayCustomCreate_DisbalanceSetupBtn then
		if UI.GameplayCustomCreate_DisbalanceSetupBtn:HasStyle( UI.WS_GRAYED ) then
			--UI:PlayGlobalSound( UI.sounds.invalid )
		else
			UI:PlayGlobalSound( UI.sounds.btnClick )
			UI.GameplayCustom_AdvOptionsWnd:Show()
		end
	elseif wnd == UI.GameplayCustomCreate_ResetSetupBtn then
		if UI.GameplayCustomCreate_ResetSetupBtn:HasStyle( UI.WS_GRAYED ) then
			--UI:PlayGlobalSound( UI.sounds.invalid )
		else
			UI:PlayGlobalSound( UI.sounds.btnClick )
			UI.GameplayCustom_AdvOptionsWnd:MyReset()
			UI.GameplayCustomCreateWnd:SetFair( false )
		end
	end
	return true
end

--
function UI.GameplayCustomCreateWnd:CreateLobby()
	if self:IsWait() then
		return true
	end
	--[[local password = UI.GameplayCustomCreate_PasswordEditWnd:GetEditText() ~= "" and UI.GameplayCustomCreate_PasswordEditWnd:GetEditText() or nil
	local bots = nil]]
	local settings = UI.GameplayCustom_AdvOptionsWnd:GetCurrentSettings( self.fair )
	settings.regionPreference = 0
	selectedRegionIndex = UI.GameplayCustomCreate_RegionComboBox:GetSelectedRecord()
	if selectedRegionIndex ~= -1 then
		settings.regionPreference = UI.GameplayCustomCreate_RegionComboBox:GetRecordData( selectedRegionIndex ).data or 0
	end
	settings.name = UI.GameplayCustomCreate_DescEditWnd:GetEditText()
	settings.levelName = self.levelName
	settings.gameMode = self.gameMode

	settings.withPresetVessels = false

	if type( _G.GameplayDef ) == "table" and type( _G.GameplayDef[ self.gameMode ] ) == "table" then
		local gameplayInfo = _G.GameplayDef[ self.gameMode ]
		
		-- эта проверка должна быть такой же, как проверка в коде( см. функцию DedicatedServerServices_CreateGame )
		if ( type( gameplayInfo.player_vessels ) == "table" and next( gameplayInfo.player_vessels ) ~= nil )
			or ( type( gameplayInfo.warehouse_vessels ) == "table" and next( gameplayInfo.warehouse_vessels ) ~= nil ) then

			settings.withPresetVessels = true
		end
	end
	

	--[[if self.addBots then
		local selBotsCount = UI.GameplayCustomCreate_BotsComboBox:GetSelectedRecord()
		if selBotsCount ~= -1 then
			bots = UI.GameplayCustomCreate_BotsComboBox:GetRecordData( selBotsCount ).bots
		end
	end]]
	self.requestId = _G.MasterServer_LobbyCreate( settings )
	self:StartWait()
end

--
function UI.GameplayCustomCreateWnd:SaveFair()
	self.savedFair = self.fair
end

--
function UI.GameplayCustomCreateWnd:RestoreFair()
	self:SetFair( self.savedFair )
end

--
function UI.GameplayCustomCreateWnd:ResetSavedFair()
	self.savedFair = false
end

--
function UI.GameplayCustomCreateWnd:SetFair( fair, settings )
	self.fair = fair
	local effect = UI:GetEffectFromLayer( self, self.layers.TYPE_EFFECT )
	if fair then
		effect:StartAnimation( "green" )
		local str =  UI:GetStringByName( "gameplay_custom_create_fair" )
		local levelName = settings.levelName:sub( 5 )
		local level = PvE_Missions[ levelName ]
		local min, max = 1, 7
		if level then
			min, max = level.rank, level.rank_max
		else
			sys.log( "UI.GameplayCustomCreateWnd:SetFair()[ERROR]: can't find PvE mission with name " )
		end
		str = string.gsub( str, "%$min_rank%$", min )
		str = string.gsub( str, "%$max_rank%$", max )
		self:SetText( str, self.layers.TYPE_TEXT )
	else
		effect:StartAnimation( "red" )
		self:SetText( UI:GetStringByName( "gameplay_custom_create_not_fair" ), self.layers.TYPE_TEXT )
	end
end

--
function UI.GameplayCustomCreateWnd:CheckFair()
	--[[local settings = UI.GameplayCustom_AdvOptionsWnd:GetCurrentSettings( false )
	if settings.balancePlayers ~= true or settings.password ~= nil or settings.rankMask ~= 0 or settings.roleMask ~= 0 or settings.friendlyFire ~= false or settings.selfDamage ~= true or settings.botsCount ~= 0 then
		self:SetFair( false, settings )
	else
		self:SetFair( true, settings )
	end]]
	self:SetFair( false, settings )
end

--
--[[function UI.GameplayCustomCreateWnd:EditLobby()
	if UI.Lobby:IsInLobby() and UI.Lobby:IsLobbyLeader() then
		local bots = 0
		if self.addBots then
			local selBotsCount = UI.GameplayCustomCreate_BotsComboBox:GetSelectedRecord()
			if selBotsCount ~= -1 then
				bots = UI.GameplayCustomCreate_BotsComboBox:GetRecordData( selBotsCount ).bots
			end
		end
		_G.MasterServer_LobbyChangeSetting( self.levelName, self.gameMode, bots )
	end
end]]

-- -----------------------------------
-- const
-- -----------------------------------
UI.GameplayCustomCreateWnd.modes = 
{
	PVP_MODE			= 0,
	PVE_MODE			= 1,
}

-- -----------------------------------
-- vars
-- -----------------------------------
--
UI.GameplayCustomCreateWnd.inited = false
UI.GameplayCustomCreateWnd.addBots = false
UI.GameplayCustomCreateWnd.levelName = ""
UI.GameplayCustomCreateWnd.gameMode = 1
UI.GameplayCustomCreateWnd.fair = true
UI.GameplayCustomCreateWnd.savedFair = true
UI.GameplayCustomCreateWnd.isWait = false
UI.GameplayCustomCreateWnd.requestId = nil
UI.GameplayCustomCreateWnd.mode = UI.GameplayCustomCreateWnd.modes.PVP_MODE

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.GameplayCustomCreateWnd:UpdateModeButtons()
	UI.GameplayCustomCreate_PveWnd:Update()
	UI.GameplayCustomCreate_PvpWnd:Update()
end

--
function UI.GameplayCustomCreateWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	self:StopWait()
end

--
function UI.GameplayCustomCreateWnd:UpdateGameplayList()
	UI.GameplayCustomCreate_ListWnd:Clear()
	local records = {}
	local isPve = self:GetMode() == self.modes.PVE_MODE
	for i = 1, #AvailableLobbySettings do
		if not( AvailableLobbySettings[ i ].forbiddenOnLive and cvars.cl_versionType == "live" ) then
			if type( AvailableLobbySettings[ i ].gameMode ) == "table" then
				for j = 1, #AvailableLobbySettings[ i ].gameMode do
					local skip = true
					if isPve and AvailableLobbySettings[ i ].gameMode[ j ] == ai.Gameplay.PVE_MISSION then
						local missionName = string.sub( AvailableLobbySettings[ i ].levelName, 5 ) -- названия здесь прописаны в формате "pve.bigship_building_2_normal"; пропускаем префикс "pve."
						if not UI:IsPveMissionDisabled( missionName ) then
							skip = false
						else
							sys.log( "UI.GameplayCustomCreateWnd:UpdateGameplayList()[ERROR]: pve mission %s is disabled; won't be shown in missions list", missionName )
						end
					elseif not isPve and AvailableLobbySettings[ i ].gameMode[ j ] ~= ai.Gameplay.PVE_MISSION then
						skip = false
					end
					if not skip then
						local record = {}
						record.levelName = AvailableLobbySettings[ i ].levelName
						record.gameMode = AvailableLobbySettings[ i ].gameMode[ j ]
						table.insert( records, record )
					end
				end
			else
				local skip = true
				if isPve and AvailableLobbySettings[ i ].gameMode == ai.Gameplay.PVE_MISSION then
					local missionName = string.sub( AvailableLobbySettings[ i ].levelName, 5 ) -- названия здесь прописаны в формате "pve.bigship_building_2_normal"; пропускаем префикс "pve."
					if not UI:IsPveMissionDisabled( missionName ) then
						skip = false
					else
						sys.log( "UI.GameplayCustomCreateWnd:UpdateGameplayList()[ERROR]: pve mission %s is disabled; won't be shown in missions list", missionName )
					end
				elseif not isPve and AvailableLobbySettings[ i ].gameMode ~= ai.Gameplay.PVE_MISSION then
					skip = false
				end
				if not skip then
					table.insert( records, AvailableLobbySettings[ i ] )
				end
			end
		end
	end
	for recordIdx, record in ipairs( records ) do
		UI.GameplayCustomCreate_ListWnd:AddRecord( record )
	end
	if UI.GameplayCustomCreate_ListWnd:GetNumRecords() > 0 then
		UI.GameplayCustomCreate_ListWnd:SelectRecord( 1, false )
	end
end

--
function UI.GameplayCustomCreateWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	UI.GameplayCustom_AdvOptionsWnd:Init()
	UI.GameplayCustom_AdvOptionsWnd:MyReset()
	self:ResetSavedFair()
	self:SetMode( self.modes.PVP_MODE )
	if UI.Lobby:IsInLobby() then
		UI.GameplayCustomCreate_DescEditWnd:RemoveStyle( UI.WS_ACTIVATE_ON_LMOUSE_CLICK )
	else
		UI.GameplayCustomCreate_DescEditWnd:SetEditText( "" )
		UI.GameplayCustomCreate_DescEditWnd:AddStyle( UI.WS_ACTIVATE_ON_LMOUSE_CLICK )
	end
	self:SetFair( false )
end

--
function UI.GameplayCustomCreateWnd:SelectGame( game )
	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	icoEffect:SetSpriteTexture( "ico", UI:GetMapIco( game.levelName ) )
	self:SetText( UI:GetLevelLocalizedName( game.levelName )..": "..UI:Gameplay2Str( game.gameMode ), self.layers.NAME_TEXT )
	self.levelName = game.levelName
	if game.gameMode == ai.Gameplay.PVE_MISSION then
		if self.gameMode ~= ai.Gameplay.PVE_MISSION then
			self:SaveFair()
		end
		self:SetFair( true, game )
	end
	if game.gameMode ~= ai.Gameplay.PVE_MISSION and self.gameMode == ai.Gameplay.PVE_MISSION then
		self:RestoreFair()
	end
	if game.gameMode == ai.Gameplay.PVE_MISSION then
		UI.GameplayCustomCreate_DisbalanceSetupBtn:AddStyle( UI.WS_GRAYED )
		UI.GameplayCustomCreate_ResetSetupBtn:AddStyle( UI.WS_GRAYED )
	else
		UI.GameplayCustomCreate_DisbalanceSetupBtn:RemoveStyle( UI.WS_GRAYED )
		UI.GameplayCustomCreate_ResetSetupBtn:RemoveStyle( UI.WS_GRAYED )
	end
	self.gameMode = game.gameMode
end

-- -----------------------------------------------------------------
-- UI.GameplayCustomCreate_ListWnd
-- -----------------------------------------------------------------

UI.GameplayCustomCreate_ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomCreate_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "GameplayCustomCreate_ListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE --[[+ UI.WS_NOT_MOUSE_REACT]] + UI.WS_NOT_KB_REACT,
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
				defName				= "gameplay_custom_create_list",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	},
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayCustomCreate_ListWnd.layers = 
{
	MAIN_EFFECT 			= 0,
}

UI.GameplayCustomCreate_ListWnd.btnPrototypeName	= "GameplayCustomCreateList_SlotWnd"

UI.GameplayCustomCreate_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
	}
}

UI.GameplayCustomCreate_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.GameplayCustomCreate_ListWnd.MAX_SLOTS = 14

UI.GameplayCustomCreate_ListWnd.sounds =
{
	itemsScrollRange			= "sound/ui/btnMouseOver",
}

-- -----------------------------------
-- vars
-- -----------------------------------

-- ------------------------------
-- interface functions
-- ------------------------------

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.GameplayCustomCreate_ListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if not self:IsOnScreen() then
		return false
	end
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	
	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self:GetVisibleRange()
	self:ScrollVisibleRange( ticks < 0 )
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( self.sounds.itemsScrollRange )
	end
	return true
end

-- -----------------------------------------------------------------
-- UI.GameplayCustomCreateList_SlotWnd
-- -----------------------------------------------------------------

UI.GameplayCustomCreateList_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.GameplayCustomCreateList_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",
	props =
	{
		name			= "GameplayCustomCreateList_SlotWnd",
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
				defName				= "gameplay_custom_create_list_line",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "name",
						layer		= "UI.GameplayCustomCreateList_SlotWnd.layers.NAME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayCustomCreateList_SlotWnd.layers = 
{
	MAIN_EFFECT 			= 0,
	NAME_TEXT				= 1,
}

-- ------------------------------
-- work functions
-- ------------------------------
--
function UI.GameplayCustomCreateList_SlotWnd:UpdateForData( data, bAnimated )
	self:SetText( UI:GetLevelLocalizedName( data.levelName )..": "..UI:Gameplay2Str( data.gameMode ), self.layers.NAME_TEXT )
	self:UpdateAnimation()
end

--
function UI.GameplayCustomCreateList_SlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList3_Btn.Select( self, bSelect, bAnimated )
	
	self:UpdateAnimation()
	
	if bSelect then
		UI.GameplayCustomCreateWnd:SelectGame( self:GetRecordData() )
	end
	
end


--
function UI.GameplayCustomCreateList_SlotWnd:UpdateAnimation()

	local bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	
	local anim = ""
	
	if self:IsSelected() then
		anim = "sel_over"
	else
		anim = bMouseOver and "over" or "idle"
	end
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( anim )
	
end


--
function UI.GameplayCustomCreateList_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	self:UpdateAnimation()
	return true
end

--
function UI.GameplayCustomCreateList_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	self:UpdateAnimation()
	return true
end

--
function UI.GameplayCustomCreateList_SlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if not UI.GameplayCustomCreateWnd:IsWait() then
		UI.GameplayCustomCreate_ListWnd:SelectRecord( self:GetRecord(), bAnimated )
	end
	return true
end


-- ---------------------------------------------------------------------------
-- UI.GameplayCustomCreate_BotsComboBox
-- ---------------------------------------------------------------------------

--
UI.GameplayCustomCreate_BotsComboBox =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "Shop_FilterComboBoxWnd",
    	props =
    	{
    		name	= "GameplayCustomCreate_BotsComboBox"
    	}
	}
}

-- ---------------------------------------------------------------------------
-- UI.GameplayCustomCreate_RegionComboBox
-- ---------------------------------------------------------------------------

--
UI.GameplayCustomCreate_RegionComboBox =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "GameplayCustomCreate_RegionComboBox"
		},
	},

	MAX_VISIBLE_RECORDS = 4,
}

--
function UI.GameplayCustomCreate_RegionComboBox:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if not UI.GameplayCustomCreateWnd:IsWait() then
		UI.ComboBox1.F_OnMouseLButtonDown( self, mouseX, mouseY, wndThatReceivedInput )
	end
	return true
end

--
function UI.GameplayCustomCreate_RegionComboBox:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	if not self.init then
		self:AddRecord( { data = MasterServer.AuthRegion[ "AR_UNKNOWN" ] , text = UI:GetStringByName( "region_AR_UNKNOWN" ) } )
		for k, v in pairs( MasterServer.AuthRegion ) do
			if k ~= "AR_NUM" and k ~= "AR_UNKNOWN" then
				self:AddRecord( { data = v, text = UI:GetStringByName( "region_"..k ) } )
			end
		end
		self.init = true
	end
	local region = UI:GetGameRegion()
	for i = 1, self:GetNumRecords() do
		local data = self:GetRecordData( i )
		if data.data == region then
			self:SelectRecord( i, false )
			return
		end
	end
	self:SelectRecord( 1, false )
end

--
--[[function UI.GameplayCustomCreate_RegionComboBox:Close()
	UI.EffectComboBoxWnd.Close( self )
	if self:GetSelectedRecord() ~= -1 then
		if self:GetRecordData( self:GetSelectedRecord() ).data ~= UI:GetGameRegion() then
			UI:SetGameRegion( self:GetRecordData( self:GetSelectedRecord() ).data )
		end
	end
end]]


-- ---------------------------------------------------------------------------
-- UI.GameplayCustomCreate_ClanShipTeam1ComboBox, UI.GameplayCustomCreate_ClanShipTeam2ComboBox
-- ---------------------------------------------------------------------------

--
UI.GameplayCustomCreate_ClanShipTeam1ComboBox =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",
		props =
		{
			name	= "GameplayCustomCreate_ClanShipTeam1ComboBox"
		}
	},
	
	MAX_VISIBLE_RECORDS = 4,
}


--
UI.GameplayCustomCreate_ClanShipTeam2ComboBox =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",
		props =
		{
			name	= "GameplayCustomCreate_ClanShipTeam2ComboBox"
		}
	},
	
	MAX_VISIBLE_RECORDS = 4,
}

-- ------------------------------------------------------------------------
-- UI.MailCreate_MsgEditWnd
-- ------------------------------------------------------------------------

UI.GameplayCustomCreate_DescEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditMultilineWnd",

     	props =
     	{
     		name			= "GameplayCustomCreate_DescEditWnd",
    		symbolsLimit	= 56,	-- константа максимального размера в байтах: 2048
    		stringsLimit	= 2,
    	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "gameplay_custom_create_input",
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
			scrollBarLocator		= "scroll",
    	}
    }
    --[[def =
    {   	
     	className	= "EditWnd",
    	prototype	= "Login_EditWnd",

     	props =
     	{
     		name			= "GameplayCustomCreate_DescEditWnd",
    		symbolsLimit	= 31,
    	}
    }]]
}

--
function UI.GameplayCustomCreate_DescEditWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if not UI.GameplayCustomCreateWnd:IsWait() then
		UI.EffectEditMultilineWnd.OnMouseLButtonDown( self, mouseX, mouseY, wndThatReceivedInput )
	end
	return true
end

--
--[[function UI.GameplayCustomCreate_DescEditWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key == UI.Keys.KEY_ENTER then
		return true
	end
	

	return self:HandleKey( key, -2 )	

end]]

-- ------------------------------------------------------------------------
-- UI.Login_AccountEditWnd, UI.Login_PasswordEditWnd
-- ------------------------------------------------------------------------

--
UI.GameplayCustomCreate_PasswordEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "Login_EditWnd",

     	props =
     	{
     		name		= "GameplayCustomCreate_PasswordEditWnd",
    		symbolsLimit	= 20,
    	}
    }
}

-- -------------------------------------------------------------------
-- UI.GameplayCustomCreate_GameplayWnd, UI.GameplayCustomCreate_PveWnd, UI.GameplayCustomCreate_PvpWnd
-- -------------------------------------------------------------------

--
UI.GameplayCustomCreate_GameplayWnd =
{
	def =
	{
    	className	= "Wnd",
    	
    	props =
    	{
    		name		= "GameplayCustomCreate_GameplayWnd",
    		isPrototype = true,
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
					defName 			= "msgBox_btn",
					defaultAnimation	= "idle",
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
						{
							objName		= "value",
							layer		= "UI.GameplayCustomCreate_GameplayWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
			-- TEXT
			{
				layerType		= UI.LAYER_TEXT,
	   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
		} 
	},
}

UI.GameplayCustomCreate_GameplayWnd.layers =
{
	MAIN_EFFECT		= 0,
	TEXT			= 1,
}

UI.GameplayCustomCreate_GameplayWnd.mode = nil
UI.GameplayCustomCreate_GameplayWnd.mouseIn = false
UI.GameplayCustomCreate_GameplayWnd.textId = ""

function UI.GameplayCustomCreate_GameplayWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self:SetText( UI:GetStringByName( self.textId ), self.layers.TEXT )
end

--
function UI.GameplayCustomCreate_GameplayWnd:Update()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if UI.GameplayCustomCreateWnd:GetMode() == self.mode then
		if self.mouseIn then
			mainEffect:StartAnimation( "over" )
		else
			mainEffect:StartAnimation( "select" )
		end
	else
		if self.mouseIn then
			mainEffect:StartAnimation( "over_nofocus" )
		else
			mainEffect:StartAnimation( "idle" )
		end
	end
end

--
function UI.GameplayCustomCreate_GameplayWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	--[[if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end]]
	UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	self.mouseIn = true
	self:Update()
	return true
end

--
function UI.GameplayCustomCreate_GameplayWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	self.mouseIn = false
	self:Update()
	return true
end

--
function UI.GameplayCustomCreate_GameplayWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self.mode ~= UI.GameplayCustomCreateWnd:GetMode() then
		if not UI.GameplayCustomCreateWnd:IsWait() then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			UI.GameplayCustomCreateWnd:SetMode( self.mode )
		end
	end
	return true
end

--
UI.GameplayCustomCreate_PveWnd =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "GameplayCustomCreate_GameplayWnd",

    	props =
    	{
    		name		= "GameplayCustomCreate_PveWnd",
    	},
	},

	textId = "gameplay_custom_lobby_create_type_PvE"
}

UI.GameplayCustomCreate_PveWnd.mode = UI.GameplayCustomCreateWnd.modes.PVE_MODE

--
UI.GameplayCustomCreate_PvpWnd =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "GameplayCustomCreate_GameplayWnd",

    	props =
    	{
    		name		= "GameplayCustomCreate_PvpWnd",
    	},
	},

	textId = "gameplay_custom_lobby_create_type_PvP"
}

UI.GameplayCustomCreate_PvpWnd.mode = UI.GameplayCustomCreateWnd.modes.PVP_MODE

-- -----------------------------------------------------------------
-- UI.GameplayCustomLobbyWnd
-- -----------------------------------------------------------------

UI.GameplayCustomLobbyWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomLobbyWnd.layers = 
{
	MAIN_EFFECT 			= 0,
	TEAM_1_TEXT				= 1,
	TEAM_2_TEXT				= 2,
	TEAM_3_TEXT				= 3,
	TEAM_4_TEXT				= 4,
	TITLE_TEXT				= 5,
	NAME_TEXT				= 6,
	ICO_EFFECT				= 7,
	--CAP_NAME				= 7,
	PLAYERS_COUNT			= 8,
	--CAP_NAME_VAL			= 9,
	--PLAYERS_COUNT_VAL		= 10,
	TYPE_EFFECT				= 9,
	--TYPE_TEXT				= 10,
	GAME_TYPE_LABEL			= 10,
	SPECTATORS_COUNT 		= 11,
	LOADING_EFFECT			= 12,
}

UI.GameplayCustomLobbyWnd.def =
{
	className = "Wnd",
	props =
	{
		name			= "GameplayCustomLobbyWnd",
		style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
	},
	layers =
	{
		firstOverlayLayer = UI.GameplayCustomLobbyWnd.layers.LOADING_EFFECT,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,	
			effects =
			{{
				defName 			= "gameplay_custom_lobby",
       			defaultAnimation	= "idle",
           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           			{
           				objName		= "team_1",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.TEAM_1_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "team_2",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.TEAM_2_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "team_3",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.TEAM_3_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "team_4",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.TEAM_4_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "text_1",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.TITLE_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "map_info",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.NAME_TEXT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "map_ico",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.ICO_EFFECT",
           				animParams	= UI.EffectAnimParams.POS,
           			},
					{
           				objName		= "list_1",
           				wnd			= "UI.GameplayCustomLobby_Team1ListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "list_2",
           				wnd			= "UI.GameplayCustomLobby_Team2ListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "list_3",
           				wnd			= "UI.GameplayCustomLobby_UndistributedListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "list_1_4",
           				wnd			= "UI.GameplayCustomLobby_SpectatorsListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			--[[{
           				objName		= "btn_1",
           				wnd			= "UI.GameplayCustomLobby_EditBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},]]
           			--[[{
           				objName		= "name_cap",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.CAP_NAME",
           				animParams	= UI.EffectAnimParams.ALL,
           			},]]
           			{
           				objName		= "count_player",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.PLAYERS_COUNT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "type_game",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.TYPE_EFFECT",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "name_cap",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.GAME_TYPE_LABEL",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "name_cap",
           				wnd			= "UI.GameplayCustomLobby_InfoBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "text",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.SPECTATORS_COUNT",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
						objName		= "loading",
						layer		= "UI.GameplayCustomLobbyWnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
           			--[[{
           				objName		= "name_cap_value",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.CAP_NAME_VAL",
           				animParams	= UI.EffectAnimParams.ALL,
           			},
           			{
           				objName		= "count_player_value",
           				layer		= "UI.GameplayCustomLobbyWnd.layers.PLAYERS_COUNT_VAL",
           				animParams	= UI.EffectAnimParams.ALL,
           			},]]
           		}
           	}}
		},
		-- TEAM_1_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_lobby_team_1",
		},
		-- TEAM_2_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_lobby_team_2",
		},
		-- TEAM_3_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_lobby_undistributed",
		},
		-- TEAM_4_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text			= "^gameplay_custom_lobby_team_spectators",
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			--text			= "^gameplay_custom_lobby_title",
		},
		-- NAME_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 2 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_map_ico",
				defaultAnimation    = "idle",
			}}
		},
		-- CAP_NAME
		--[[{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			--text			= "^gameplay_custom_lobby_captan"
		},]]
		-- PLAYERS_COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			--text			= "^gameplay_custom_lobby_players"
		},
		-- TYPE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_list_line_type",
				defaultAnimation    = "red",
				links =
				{
					--[[{
						objName		= "text_2",
						layer		= "UI.GameplayCustomLobbyWnd.layers.TYPE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},]]
					--[[{
						objName		= "help_btn",
						wnd			= "UI.GameplayCustomLobby_InfoBtn",
						animParams	= UI.EffectAnimParams.POS,
					},]]
				}
			}}
		},
		-- TYPE_TEXT
		--[[{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},]]
		-- GAME_TYPE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^gameplay_custom_lobby_type"
		},
		-- SPECTATORS_COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^gameplay_custom_lobby_type"
		},
		--[[-- CAP_NAME_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- PLAYERS_COUNT_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},]]
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
	children = { "UI.GameplayCustomLobby_Team1ListWnd", "UI.GameplayCustomLobby_Team2ListWnd", "UI.GameplayCustomLobby_UndistributedListWnd", "UI.GameplayCustomLobby_SpectatorsListWnd",
		"UI.GameplayCustomLobby_DragAndDropWnd", "UI.GameplayCustomLobby_InfoBtn" },
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.GameplayCustomLobbyWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	if not self:IsOnScreen() then
		return
	end
	if result ~= 0 then
		return
	end
	if field == _G.MasterServer.UserProfileField.UPF_GENERAL_STATS or field == _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		for recordIdx = 1, UI.GameplayCustomLobby_Team1ListWnd:GetNumRecords() do
			local data = UI.GameplayCustomLobby_Team1ListWnd:GetRecordData( recordIdx )
			if data and data.playerInfo.uid == uid then
				local slotWnd = UI.GameplayCustomLobby_Team1ListWnd:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:FullUpdate()
				end
			end
		end       
		for recordIdx = 1, UI.GameplayCustomLobby_Team2ListWnd:GetNumRecords() do
			local data = UI.GameplayCustomLobby_Team2ListWnd:GetRecordData( recordIdx )
			if data and data.playerInfo.uid == uid then
				local slotWnd = UI.GameplayCustomLobby_Team2ListWnd:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:FullUpdate()
				end
			end
		end
		for recordIdx = 1, UI.GameplayCustomLobby_UndistributedListWnd:GetNumRecords() do
			local data = UI.GameplayCustomLobby_UndistributedListWnd:GetRecordData( recordIdx )
			if data and data.playerInfo.uid == uid then
				local slotWnd = UI.GameplayCustomLobby_UndistributedListWnd:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:FullUpdate()
				end
			end
		end
	end
	
end


--
function UI.GameplayCustomLobbyWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for recordIdx = 1, UI.GameplayCustomLobby_Team1ListWnd:GetNumRecords() do
		local data = UI.GameplayCustomLobby_Team1ListWnd:GetRecordData( recordIdx )
		if data and UI:GetPlayerClanByUid( data.playerInfo.uid ) == cid then
			local slotWnd = UI.GameplayCustomLobby_Team1ListWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnClanNameChanged()
			end
		end
	end

	for recordIdx = 1, UI.GameplayCustomLobby_Team2ListWnd:GetNumRecords() do
		local data = UI.GameplayCustomLobby_Team2ListWnd:GetRecordData( recordIdx )
		if data and UI:GetPlayerClanByUid( data.playerInfo.uid ) == cid then
			local slotWnd = UI.GameplayCustomLobby_Team2ListWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnClanNameChanged()
			end
		end
	end

end


--
function UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyModify( result, requestId )
	if requestId == self.requestId then
		self:StopWait()
	end
end

--
function UI.GameplayCustomLobbyWnd:StartWait()
	self:SetLayerVisible( true, self.layers.LOADING_EFFECT )
	self.isWait = true
end

--
function UI.GameplayCustomLobbyWnd:StopWait()
	self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
	self.isWait = false
end

--
function UI.GameplayCustomLobbyWnd:IsWait()
	return self.isWait
end

--
function UI.GameplayCustomLobbyWnd:StartLobby()
	if not self:IsWait() then
		_G.MasterServer_LobbyStartGame()
	end
end

--
function UI.GameplayCustomLobbyWnd:Update()
	if self:IsOnScreen() then
		UI.GameplayWnd:UpdateStartBtnState()
		UI.GameplayCustomLobby_Team1ListWnd:Update()
		UI.GameplayCustomLobby_Team2ListWnd:Update()
		UI.GameplayCustomLobby_UndistributedListWnd:Update()
		UI.GameplayCustomLobby_SpectatorsListWnd:Update()

		local game = UI.Lobby:GetMyLobby()
		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
		icoEffect:SetSpriteTexture( "ico", UI:GetMapIco( game.levelName ) )
		self:SetText( game.name, self.layers.NAME_TEXT )

		local lobby = game
		if lobby.gameMode == ai.Gameplay.PVE_MISSION then
			self:SetLayerVisible( false, self.layers.TEAM_2_TEXT )
			self:SetLayerVisible( false, self.layers.TEAM_4_TEXT )
			UI.GameplayCustomLobby_Team2ListWnd:UnlinkFromParent()
			UI.GameplayCustomLobby_SpectatorsListWnd:UnlinkFromParent()
		else
			self:SetLayerVisible( true, self.layers.TEAM_2_TEXT )
			self:SetLayerVisible( true, self.layers.TEAM_4_TEXT )
			self:AddChild( UI.GameplayCustomLobby_Team2ListWnd )
			self:AddChild( UI.GameplayCustomLobby_SpectatorsListWnd )
		end

		UI.GameplayCustomLobby_UndistributedListWnd:SetInBattle( false )
		if lobby.gameInProgress then
			UI.GameplayCustomLobby_Team1ListWnd:SetInBattle( true )
			UI.GameplayCustomLobby_Team2ListWnd:SetInBattle( true )
			UI.GameplayCustomLobby_SpectatorsListWnd:SetInBattle( true )
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_team_1" )..UI:GetStringByName( "gameplay_custom_lobby_team_in_battle" ), self.layers.TEAM_1_TEXT )
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_team_2" )..UI:GetStringByName( "gameplay_custom_lobby_team_in_battle" ), self.layers.TEAM_2_TEXT )
		else
			UI.GameplayCustomLobby_Team1ListWnd:SetInBattle( false )
			UI.GameplayCustomLobby_Team2ListWnd:SetInBattle( false )
			UI.GameplayCustomLobby_SpectatorsListWnd:SetInBattle( false )
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_team_1" ), self.layers.TEAM_1_TEXT )
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_team_2" ), self.layers.TEAM_2_TEXT )
		end

		--local nickName = UI:MakePlayerNameByUid( lobby.players[ 1 ].uid, true, false ) --, bCached, requestId = _G.MasterServer_GetNickName( lobby.players[ 1 ].uid )
		--self:SetText( UI:GetStringByName( "gameplay_custom_lobby_captan" )..": "..nickName, self.layers.CAP_NAME )
		local players = 0
		for k, v in pairs( lobby.players ) do
			if not v.spectator then
				players = players + 1
			end
		end

		if lobby.gameMode ~= ai.Gameplay.PVE_MISSION then
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_players" )..": "..tostring( players ).."/"..tostring( UI.GameplayCustomList_SlotWnd.MAX_PVP_PLAYERS ), self.layers.PLAYERS_COUNT )
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_spectators" )..": "..tostring( #lobby.players - players ).."/"..tostring( UI.GameplayCustomList_SlotWnd.MAX_PVP_SPECTATORS ), self.layers.SPECTATORS_COUNT )
		else
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_players" )..": "..tostring( players ).."/"..tostring( UI.GameplayCustomList_SlotWnd.MAX_PVE_PLAYERS ), self.layers.PLAYERS_COUNT )
			self:SetText( "", self.layers.SPECTATORS_COUNT )
		end

		--[[if lobby.gameMode ~= ai.Gameplay.PVE_MISSION then
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_players" )..": "..tostring( #lobby.players ).."/"..tostring( ai.MAX_PLAYERS ), self.layers.PLAYERS_COUNT )
		else
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_players" )..": "..tostring( #lobby.players ).."/".."4", self.layers.PLAYERS_COUNT )
		end]]

		local text = ""
		if lobby.fair then
			local str = UI:GetStringByName( "gameplay_custom_lobby_type" ).." @ff0fff00"..UI:GetStringByName( "gameplay_custom_game_fair" )
			local min, max = UI.GameplayCustomList_SlotWnd:GetRankMaskRange( lobby.rankMask )
			str = string.gsub( str, "%$min_rank%$", min )
			str = string.gsub( str, "%$max_rank%$", max )
			text = str
			self:SetText( text, self.layers.GAME_TYPE_LABEL )
		else
			self:SetText( UI:GetStringByName( "gameplay_custom_lobby_type" ).." @ffff2700"..UI:GetStringByName( "gameplay_custom_game_not_fair" ), self.layers.GAME_TYPE_LABEL )
			text = UI:GetStringByName( "gameplay_custom_lobby_type" ).." "..UI:GetStringByName( "gameplay_custom_game_not_fair" )
		end

		local textWeight = _G.MeasureText( 
   		text,
   		self:GetFont( self.layers.GAME_TYPE_LABEL ),
   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.GAME_TYPE_LABEL ), self:GetLayerHeight( self.layers.GAME_TYPE_LABEL ) ),
   		self:GetTextFormatFlags( self.layers.GAME_TYPE_LABEL ),
   		UI:Quat( 0, 0, self:GetLayerWidth( self.layers.GAME_TYPE_LABEL ), self:GetLayerHeight( self.layers.GAME_TYPE_LABEL ) ) ).z

   		UI.GameplayCustomLobby_InfoBtn:SetLeft( self:GetLayerLeft( self.layers.GAME_TYPE_LABEL ) + textWeight )

		local strLevelName = UI:GetLevelLocalizedName( lobby.levelName )..": "..UI:Gameplay2Str( lobby.gameMode )
		strLevelName = UI:GetCutTextWithEllipses( strLevelName, self:GetLayerWidth( self.layers.TITLE_TEXT ), self:GetFont( self.layers.TITLE_TEXT ) )	-- #0110880(0519701) - если текст не влазит в одну строку, то ообрезается с многоточием
		self:SetText( strLevelName, self.layers.TITLE_TEXT )
	end
end

--
function UI.GameplayCustomLobbyWnd:GetViewMode()
	return UI.PlayersWnd.viewModes.MEDIUM
end

--
function UI.GameplayCustomLobbyWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	if self:IsOnScreen() then
		if UI.GameplayCustomLobby_Team1ListWnd:IsWaitNickNameResolve() then
			UI.GameplayCustomLobby_Team1ListWnd:ResetWaitNickNameResolve()
			UI.GameplayCustomLobby_Team1ListWnd:Update()
		end
		if UI.GameplayCustomLobby_Team2ListWnd:IsWaitNickNameResolve() then
			UI.GameplayCustomLobby_Team2ListWnd:ResetWaitNickNameResolve()
			UI.GameplayCustomLobby_Team2ListWnd:Update()
		end
		if UI.GameplayCustomLobby_UndistributedListWnd:IsWaitNickNameResolve() then
			UI.GameplayCustomLobby_UndistributedListWnd:ResetWaitNickNameResolve()
			UI.GameplayCustomLobby_UndistributedListWnd:Update()
		end
		if UI.GameplayCustomLobby_SpectatorsListWnd:IsWaitNickNameResolve() then
			UI.GameplayCustomLobby_SpectatorsListWnd:ResetWaitNickNameResolve()
			UI.GameplayCustomLobby_SpectatorsListWnd:Update()
		end
	end
end

--
function UI.GameplayCustomLobbyWnd:GetMaxNumShipSlotByPlayer()
	return UI.PlayersWnd.MAX_SHIP_SLOTS
end

--
function UI.GameplayCustomLobbyWnd:StartDrag( data, wndMouseX, wndMouseY )
	if not self:IsWait() then
		if UI.Lobby:CanChangeTeam() then
			self.isDrag = true
			self.offsetX = wndMouseX
			self.offsetY = wndMouseY
			UI.GameplayCustomLobby_DragAndDropWnd:UnlinkFromParent()
			UI.GameplayCustomLobby_UndistributedListWnd:AddChild( UI.GameplayCustomLobby_DragAndDropWnd )
			UI.GameplayCustomLobby_DragAndDropWnd:UpdateForData( data )
			UI.GameplayCustomLobby_DragAndDropWnd:UnlinkFromParent()
			UI.Root:AddChild( UI.GameplayCustomLobby_DragAndDropWnd )
			self:UpdateWndPos()
			self.dragAndDropData = data
		end
	end
end


--
function UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyStart( result, requestId, auxErrorParams )

	if result == _G.MasterServer.LobbyOpResult.LOR_OK then
		return
	end
	
	local bHandled = false
	
	if result == _G.MasterServer.LobbyOpResult.LOR_NOT_ENOUGH_PLAYERS then
	
		if type( auxErrorParams ) == "table" then
		
			if type( auxErrorParams.gameMode ) == "number" then
	
				if type( auxErrorParams.minPlayers ) == "number" and type( auxErrorParams.maxPlayers ) == "number" then
				
					local text = UI:GetStringByName( "operation_LOBBY_START" )
					
					local tSubst =
					{
						minPlayers	= auxErrorParams.minPlayers,
						maxPlayers	= auxErrorParams.maxPlayers,
					}
					
					local strId = auxErrorParams.gameMode == ai.Gameplay.PVE_MISSION and "operation_LOBBY_START_PVE_not_enough_player" or "operation_LOBBY_START_PVP_not_enough_player"
					local strError = UI:GetStringByName( strId )
					local numSubst = 0
					
					strError, numSubst = string.gsub( strError, "%$(.-)%$", tSubst )
					if numSubst < 2 then
						sys.log( "UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyStart()[ERROR]: invalid placeholders in string '%s'; '$minPlayers$' and '$maxPlayers$' expected", strId )
						strError = string.format( "[INVALID STRING] Invalid  number of players; %d-%d need", auxErrorParams.minPlayers, auxErrorParams.maxPlayers )
					end
					
					text = string.format( "%s %s", text, strError )
					
					UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text, UI.MBS_OK )
					bHandled = true
					
				elseif auxErrorParams.minPlayers ~= nil or auxErrorParams.maxPlayers ~= nil then
					sys.log( "UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyStart()[ERROR]: invalid format of 'auxErrorParams'; both minPlayers:number and maxPlayers:number expected or both nil, got minPlayers:%s, maxPlayers:%s", type( auxErrorParams.minPlayers ), type( auxErrorParams.maxPlayers ) )
				end
				
			else
				sys.log( "UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyStart()[ERROR]: invalid type of 'auxErrorParams.gameMode'; 'number' expected, got '%s'", type( auxErrorParams.gameMode ) )
			end
			
		else
			sys.log( "UI.GameplayCustomLobbyWnd:MasterServer_OnLobbyStart()[ERROR]: invalid type of the 3-rd param ('auxErrorParams'); 'table' expected, got '%s'", type( auxErrorParams ) )
		end
	
	end

	if not bHandled then
		UI.GameplayCustomWnd:ShowLobbyError( "operation_LOBBY_START", result )
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

-- -----------------------------------
-- vars
-- -----------------------------------
UI.GameplayCustomLobbyWnd.isDrag = false
UI.GameplayCustomLobbyWnd.offsetX = 0
UI.GameplayCustomLobbyWnd.offsetY = 0
UI.GameplayCustomLobbyWnd.dragAndDropData = nil
UI.GameplayCustomLobbyWnd.isWait = false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.GameplayCustomLobbyWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	--[[local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == UI.GameplayCustomLobby_EditBtn then
		UI:PlayGlobalSound( "sound/ui/btnClick" )
		 UI.GameplayWnd:ShowCustom( true )
	end]]
	return true
end

--
function UI.GameplayCustomLobbyWnd:UpdateWndPos()
	local mouseX = UI:GetMouseX() + 1
	local mouseY = UI:GetMouseY() + 1
	UI.GameplayCustomLobby_DragAndDropWnd:SetLeft( mouseX - self.offsetX )
	UI.GameplayCustomLobby_DragAndDropWnd:SetTop( mouseY - self.offsetY )
end

--
function UI.GameplayCustomLobbyWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_UP )
	self:Update()	
end

--
function UI.GameplayCustomLobbyWnd:F_OnAfterHideFromScreen()
	self:OnAfterHideFromScreen()
	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_UP )
	end
end

--
function UI.GameplayCustomLobbyWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	UI.GameplayCustomLobby_DragAndDropWnd:UnlinkFromParent()
	self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
end

--
function UI.GameplayCustomLobbyWnd:F_OnNewFrame()
	if self.isDrag then
		self:UpdateWndPos()
	end
end

--
function UI.GameplayCustomLobbyWnd:F_OnEventMouseButtonUp( hSender, btnIdx )
	if self.isDrag and self.dragAndDropData then
		UI.GameplayCustomLobby_DragAndDropWnd:UnlinkFromParent()
		local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	
		local rect = UI.GameplayCustomLobby_Team1ListWnd:GetRect()
		local parent = self
		if parent then
			rect = parent:ToScreen( rect )
		else
			return
		end
		if UI:IsPtInRect( rect, mouseX, mouseY ) then
			if 1 ~= self.dragAndDropData.playerInfo.team then
				self:StartWait()
				self.requestId = _G.MasterServer_LobbyChangeTeam( self.dragAndDropData.playerInfo.uid, 1 )
			end
		end
		rect = UI.GameplayCustomLobby_Team2ListWnd:GetRect()
		rect = parent:ToScreen( rect )
		if UI:IsPtInRect( rect, mouseX, mouseY ) then
			if 2 ~= self.dragAndDropData.playerInfo.team then
				self:StartWait()
				self.requestId = _G.MasterServer_LobbyChangeTeam( self.dragAndDropData.playerInfo.uid, 2 )
			end
		end
		rect = UI.GameplayCustomLobby_UndistributedListWnd:GetRect()
		rect = parent:ToScreen( rect )
		if UI:IsPtInRect( rect, mouseX, mouseY ) then
			if 0 ~= self.dragAndDropData.playerInfo.team then
				self:StartWait()
				self.requestId = _G.MasterServer_LobbyChangeTeam( self.dragAndDropData.playerInfo.uid, 0 )
			end
		end
		self.isDrag = false
	end
end

-- -----------------------------------------------------------------
-- UI.GameplayCustomLobby_InfoBtn
-- -----------------------------------------------------------------

UI.GameplayCustomLobby_InfoBtn = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomLobby_InfoBtn.def =
{
	className = "Wnd",
	prototype = "GameplayCustom_InfoBtn",
	props =
	{
		name			= "GameplayCustomLobby_InfoBtn",
	},
}

UI.GameplayCustomLobby_InfoBtn.isInList = false

-- -----------------------------------------------------------------
-- UI.GameplayCustomLobby_TeamListWnd
-- -----------------------------------------------------------------

UI.GameplayCustomLobby_TeamListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomLobby_TeamListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "GameplayCustomLobby_TeamListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE --[[+ UI.WS_NOT_MOUSE_REACT]] + UI.WS_NOT_KB_REACT,
		isPrototype		= true
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
				defName				= "gameplay_custom_team_list",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "in_battle",
						layer		= "UI.GameplayCustomLobby_TeamListWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_team_in_battle",
				defaultAnimation    = "idle",
			}}
		}
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.GameplayCustomLobby_TeamListWnd:SetInBattle( bool )
	if bool then
		self:SetLayerVisible( true, self.layers.IN_BATTLE_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.IN_BATTLE_EFFECT )
	end
end

--
function UI.GameplayCustomLobby_TeamListWnd:GetViewMode()
	return UI.PlayersWnd.viewModes.MEDIUM
end

--
function UI.GameplayCustomLobby_TeamListWnd:IsWaitNickNameResolve()
	return self.waitNickNameResolve
end

--
function UI.GameplayCustomLobby_TeamListWnd:ResetWaitNickNameResolve()
	self.waitNickNameResolve = false
end

--
function UI.GameplayCustomLobby_TeamListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if not self:IsOnScreen() then
		return false
	end
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	
	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self:GetVisibleRange()
	self:ScrollVisibleRange( ticks < 0 )
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( self.sounds.itemsScrollRange )
	end
	return true
end

--
function UI.GameplayCustomLobby_TeamListWnd:Update()
	--[[local currentScroll = self:GetVisibleRange()]]
	self:Clear()
	local lobby = UI.Lobby:GetMyLobby()
	for i = 1, #lobby.players do
		if ( lobby.players[ i ].team == self.team and not lobby.players[ i ].spectator ) or ( lobby.players[ i ].spectator and self.spectatorsTeam ) then
			local player = lobby.players[ i ]
			local data = {}
			--if player.uid == _G.MasterServer_GetLocalUserId() then
				data.bLocal = true
			--end
			local nickName, bCached, requestId = _G.MasterServer_GetNickName( player.uid )
			data.playerInfo = {}
			data.playerInfo.uid = player.uid
			data.playerInfo.status = network.PlayerStatus.PS_ACTIVE
			data.playerInfo.nickName = ""
			data.spectator = lobby.players[ i ].spectator
			data.playerInfo.playerId = i - 1 -- fake
			data.playerInfo.lobby = true
			data.playerInfo.team = player.team
			data.playerInfo.cid = nil
			if i == 1 then
				data.playerInfo.lobbyLeader = true
			end
			if not bCached then
				self.waitNickNameResolve = true
			else
				data.playerInfo.nickName = nickName
			end
			data.ships = {}
			local shipCount = 0
			for i = 1, #player.vDefs do
				if player.vDefs[ i ] ~= "" then
					shipCount = shipCount + 1
					data.ships[ shipCount ] = {}
					data.ships[ shipCount ].baseDef = player.vDefs[ i ]
					data.ships[ shipCount ].hangarIdx = i - 1
					data.ships[ shipCount ].lobby = true
				end
			end
			self:AddRecord( data )
		end
	end
	--[[if self:GetNumRecords() < currentScroll then
		currentScroll = self:GetNumRecords()
	end
	if currentScroll == -1 and self:GetNumRecords() ~= 0 then
		currentScroll = 0
	end
	self:SetFirstVisibleRecord( currentScroll, true, false )]]
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:Update( 0 )
end


--
function UI.GameplayCustomLobby_TeamListWnd:IsFriend()
	return false
end

-- -----------------------------------
-- const
-- -----------------------------------

UI.GameplayCustomLobby_TeamListWnd.layers = 
{
	MAIN_EFFECT 			= 0,
	IN_BATTLE_EFFECT		= 1,
}

UI.GameplayCustomLobby_TeamListWnd.btnPrototypeName	= "GameplayCustom_PlayerSlotWnd"

UI.GameplayCustomLobby_TeamListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll",
	}
}

UI.GameplayCustomLobby_TeamListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS--[[ + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK]]
UI.GameplayCustomLobby_TeamListWnd.MAX_SLOTS = 7

UI.GameplayCustomLobby_TeamListWnd.sounds =
{
	itemsScrollRange			= "sound/ui/btnMouseOver",
}

-- -----------------------------------
-- vars
-- -----------------------------------
UI.GameplayCustomLobby_TeamListWnd.team = nil
UI.GameplayCustomLobby_TeamListWnd.spectatorsTeam = false
UI.GameplayCustomLobby_TeamListWnd.waitNickNameResolve = false
UI.GameplayCustomLobby_TeamListWnd.waitClanNameResolve = false
UI.GameplayCustomLobby_TeamListWnd.parent = UI.GameplayCustomLobbyWnd

--
--[[function UI.GameplayCustomLobby_TeamListWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:Update()
end]]


-- -----------------------------------------------------------------
-- UI.GameplayCustomLobby_Team1ListWnd, UI.GameplayCustomLobby_Team2ListWnd, UI.GameplayCustomLobby_UndistributedListWnd, UI.GameplayCustomLobby_SpectatorsListWnd
-- -----------------------------------------------------------------

UI.GameplayCustomLobby_Team1ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomLobby_Team1ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "GameplayCustomLobby_TeamListWnd",

	props =
	{
		name			= "GameplayCustomLobby_Team1ListWnd",
	},	
}
UI.GameplayCustomLobby_Team1ListWnd.team = 1

UI.GameplayCustomLobby_Team2ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomLobby_Team2ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "GameplayCustomLobby_TeamListWnd",

	props =
	{
		name			= "GameplayCustomLobby_Team2ListWnd",
	},	
}
UI.GameplayCustomLobby_Team2ListWnd.team = 2

UI.GameplayCustomLobby_UndistributedListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomLobby_UndistributedListWnd.def =
{
	className 	= "Wnd",
	prototype	= "GameplayCustomLobby_TeamListWnd",

	props =
	{
		name			= "GameplayCustomLobby_UndistributedListWnd",
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
				defName				= "gameplay_custom_undistributed_list",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	},
}
UI.GameplayCustomLobby_UndistributedListWnd.team = 0
UI.GameplayCustomLobby_UndistributedListWnd.MAX_SLOTS = 4


UI.GameplayCustomLobby_SpectatorsListWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.GameplayCustomLobby_SpectatorsListWnd.def =
{
	className 	= "Wnd",
	prototype	= "GameplayCustomLobby_TeamListWnd",

	props =
	{
		name			= "GameplayCustomLobby_SpectatorsListWnd",
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
				defName				= "gameplay_custom_undistributed_list",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "in_battle",
						layer		= "UI.GameplayCustomLobby_TeamListWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "gameplay_custom_spectators_in_battle",
				defaultAnimation    = "idle",
			}}
		}
	},
}
UI.GameplayCustomLobby_SpectatorsListWnd.team = -1
UI.GameplayCustomLobby_SpectatorsListWnd.spectatorsTeam = true
UI.GameplayCustomLobby_SpectatorsListWnd.MAX_SLOTS = 4


UI.GameplayCustomLobby_DragAndDropWnd = {}
UI.GameplayCustomLobby_DragAndDropWnd.def =
{
	className 	= "Wnd",
	prototype	= "PlayerSlotWnd",
	props =
	{
		name			= "GameplayCustomLobby_DragAndDropWnd",
	}
}


UI.GameplayCustomLobby_PlayerSlotWnd = {}
UI.GameplayCustomLobby_PlayerSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "PlayerSlotWnd",
	props =
	{
		name			= "GameplayCustomLobby_PlayerSlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	}
}


-- ------------------------------------------------------------------------
-- UI.GameplayCustom_NameWnd
-- ------------------------------------------------------------------------

UI.GameplayCustom_NameWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.GameplayCustom_NameWnd.def =
{
	className	= "Wnd",
	prototype	= "PlayerSlot_NameWnd",

	props =
	{
		name		= "GameplayCustom_NameWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},
}


--
--[[function UI.GameplayCustom_NameWnd:UpdateTooltip( bRequestStats )
	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	self.tooltipData.caption = UI:MakePlayerNameByUid( self.data.playerInfo.uid, false, false )
	self.tooltipData.text = ""

	self:GetClan( bRequestStats )
	local clanName = self:GetClanName()
	if clanName ~= "" then
		local strClanNameLabel = UI:GetStringByName( "hud_playerTooltip_clanLabel" )
		local strClanNameVal = UI:ShieldSpecSymbols( clanName )
		local strClanName = string.format( "%s: %s", strClanNameLabel, strClanNameVal )
		self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and "|" or "", strClanName )
	end

	-- количество убийств
	local kills = self:GetKills( bRequestStats )
	local strKillsLabel = UI:GetStringByName( "hud_playerTooltip_killsLabel" )
	local strKillsVal = _G.I64ToStr( kills )
	local strKills = string.format( "%s: %s", strKillsLabel, strKillsVal )
	self.tooltipData.text = string.format( "%s%s%s", self.tooltipData.text, self.tooltipData.text ~= "" and "|" or "", strKills )

	-- апдейт окна тултипа, который уже на экране
	local curTooltipWnd = UI:GetCurTooltip()	
	if curTooltipWnd and curTooltipWnd:IsOnScreen() and UI:GetCurTooltipTarget() == self then
		curTooltipWnd:Setup( self.tooltipData )
	end

end]]


UI.GameplayCustom_PlayerSlotWnd = {}

UI.GameplayCustom_PlayerSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "PlayerSlotWnd",

	props =
	{
		name			= "GameplayCustom_PlayerSlotWnd",
		isPrototype		= true,
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},
}


--
function UI.GameplayCustom_PlayerSlotWnd:CreateControls()

	self.inactiveStatusIco = UI:CreateChildWnd( self, UI.PlayerSlot_PlayerStatusIco, "" )

	for shipSlotIdx = 1, UI.PlayersWnd.MAX_SHIP_SLOTS do

		local shipWnd = UI:CreateChildWnd( self, UI.PlayerSlot_ShipWnd, tostring( shipSlotIdx ) )
		table.insert( self.shipWnds, shipWnd )

	end

	self.nameWnd = UI:CreateChildWnd( self, UI.GameplayCustom_NameWnd, "" )
    self:AddControl( self.nameWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.nameLocator )

    self.parent = self:GetParent()

end

--
function UI.GameplayCustom_PlayerSlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local data = self:GetRecordData()
	if data.playerInfo.lobby and not data.spectator then
		if UI.Lobby:IsLobbyLeader() then
			UI.GameplayCustomLobbyWnd:StartDrag( self:GetRecordData(), mouseX, mouseY )
		end
	end
	return true
end

--
function UI.GameplayCustom_PlayerSlotWnd:DetectInactiveStatus( data )
	if data.playerInfo.lobby then
		return self.inactiveStatuses.NONE
	end
end



UI.GameplayCustomLobby_EnterPass = {}

UI.GameplayCustomLobby_EnterPass.layers = 
{
	MAIN_EFFECT 			= 0,
	BG_EFFECT				= 1,
	WORK_EFFECT				= 2,
	CAPTION					= 3,
	TEXT					= 4,
	--WAIT_EFFECT				= 5,
}

--
UI.GameplayCustomLobby_EnterPass.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",
	
	props =
	{
		name	= "GameplayCustomLobby_EnterPass",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		defaultChild	= "GameplayCustomEnterPass_PasswordEditWnd",
	},

	layers =
	{
		--firstOverlayLayer = UI.GameplayCustomLobby_EnterPass.layers.WAIT_EFFECT,

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
				defName 			= "gameplay_custom_pass_win",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "title_1",	
						layer		= "UI.GameplayCustomLobby_EnterPass.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "title_2",	
						layer		= "UI.GameplayCustomLobby_EnterPass.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "btn_1",	
						wnd			= "UI.GameplayCustomEnterPass_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",	
						wnd			= "UI.GameplayCustomEnterPass_OkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_x",	
						wnd			= "UI.GameplayCustomEnterPass_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "input_1",	
						wnd			= "UI.GameplayCustomEnterPass_PasswordEditWnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA
					},
					--[[{
						objName		= "load",	
						layer		= "UI.GameplayCustomLobby_EnterPass.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
					},]]
				}
			}}
		},
		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^gameplay_custom_enter_password_caption"
		},
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_enter_password_text"
		},
		-- WAIT_EFFECT
		--[[{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",
			}}
		}]]
	},

	children = { "UI.GameplayCustomEnterPass_CrossBtn", "UI.GameplayCustomEnterPass_OkBtn", "UI.GameplayCustomEnterPass_CancelBtn",	--[["UI.InviteFriend_EditInviteWnd",]] "UI.GameplayCustomEnterPass_PasswordEditWnd" }
}


UI.GameplayCustomLobby_EnterPass.sounds =
{
	hide			= "sound/ui/MsgHide",
	wndShow 		= "sound/ui/btnClick",
}

UI.GameplayCustomLobby_EnterPass.lid = UI.INVALID_U64_ID
UI.GameplayCustomLobby_EnterPass.isSpectator = false
UI.GameplayCustomLobby_EnterPass.requestId = nil

--
function UI.GameplayCustomLobby_EnterPass:MasterServer_OnLobbyJoin( result, requestId )
	if self.requestId == requestId then
		--self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
		if result == 0 then
			self:Hide()
		end
	end
end

--
function UI.GameplayCustomLobby_EnterPass:Close( bSound )
	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end
	self:Hide()
end

--
function UI.GameplayCustomLobby_EnterPass:Show( lid, isSpectator )
	if not lid then
		return
	end
	self.lid = lid
	self.isSpectator = isSpectator
	UI.FullScreenWnd.Show( self )
	UI.GameplayCustomEnterPass_PasswordEditWnd:SetEditText( "" )
	UI:PlayGlobalSound( UI.InviteFriendWnd.sounds.wndShow )
end

--
function UI.GameplayCustomLobby_EnterPass:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
    --self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
end

--
--[[function UI.GameplayCustomLobby_EnterPass:F_OnAfterHideFromScreen()
	--self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
end]]

--
function UI.GameplayCustomLobby_EnterPass:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )
	if self.msgBoxH == boxHandle then
		self.msgBoxH = nil
		return true
	end
	return false
end

--
function UI.GameplayCustomLobby_EnterPass:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:IsInputBlocked() then
		return true
	end
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == UI.GameplayCustomEnterPass_OkBtn then
		self:OnOk()
	elseif wnd == UI.GameplayCustomEnterPass_CrossBtn then
		self:OnCancel()
	elseif wnd == UI.GameplayCustomEnterPass_CancelBtn then
		self:OnCancel()
	end
	return true
end

--
function UI.GameplayCustomLobby_EnterPass:OnEnter( key, controllerIdx )
	if self:IsInputBlocked() then
		return true
	end
	self:OnOk()
	return true	
end

--
function UI.GameplayCustomLobby_EnterPass:OnEscape( key, controllerIdx )
	if self:IsInputBlocked() then
		return true
	end
	self:OnCancel()
	return true	
end

--
function UI.GameplayCustomLobby_EnterPass:OnOk()
	self.requestId = _G.MasterServer_LobbyJoin( self.lid, UI.GameplayCustomEnterPass_PasswordEditWnd:GetEditText(), self.isSpectator or false )
end

--
function UI.GameplayCustomLobby_EnterPass:OnCancel()
	--self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()
end


-- ------------------------------------------------------------------------
-- UI.GameplayCustomEnterPass_CrossBtn
-- ------------------------------------------------------------------------
UI.GameplayCustomEnterPass_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",
		props =
		{
			name	= "GameplayCustomEnterPass_CrossBtn"
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.GameplayCustomEnterPass_OkBtn, UI.GameplayCustomEnterPass_CancelBtn
-- ------------------------------------------------------------------------
--
UI.GameplayCustomEnterPass_OkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		props =
		{
			name		= "GameplayCustomEnterPass_OkBtn",
		},
   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^OK",
   			},
   		}
	},
}

--
UI.GameplayCustomEnterPass_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		props =
		{
			name		= "GameplayCustomEnterPass_CancelBtn",
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

--
UI.GameplayCustomEnterPass_PasswordEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "Login_EditWnd",

     	props =
     	{
     		name		= "GameplayCustomEnterPass_PasswordEditWnd",
     		editStyle		= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL + UI.ES_PASS,
    		symbolsLimit	= 20,
    	}
    }
}


-- -----------------------------------------------------------------
-- UI.GameplayCustom_InfoBtn
-- -----------------------------------------------------------------

UI.GameplayCustom_InfoBtn = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustom_InfoBtn.def =
{
	className = "Wnd",
	props =
	{
		name			= "GameplayCustom_InfoBtn",
		style			= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "gameplay_select_region_info",
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
}

-- -----------------------------------
-- consts
-- -----------------------------------

-- -----------------------------------
-- vars
-- -----------------------------------

UI.GameplayCustom_InfoBtn.isInList = true

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayCustom_InfoBtn:GetTooltipData()
	local caption = ""
	local text = ""
	local data = {}

	if self.isInList then
		data = self:GetParent():GetRecordData()
	else
		data = UI.Lobby:GetMyLobby()
	end

	if data.fair then
		caption = UI:GetStringByName( "tooltip_custom_game_info_caption_fair" )
		text = UI:GetStringByName( "tooltip_custom_game_info_text_fair" )
		-- map, gameplay, and region
		text = string.gsub( text, "%$map_name%$", UI:GetLevelLocalizedName( data.levelName ) )
		text = string.gsub( text, "%$gameplay%$", UI:Gameplay2Str( data.gameMode ) )
		local regionStr = UI:GetStringByName( "region_"..UI:Val2Key( MasterServer.AuthRegion, data.regionPreference ) )
		text = string.gsub( text, "%$region%$", regionStr )
	else
		caption = UI:GetStringByName( "tooltip_custom_game_info_caption_not_fair" )
		text = UI:GetStringByName( "tooltip_custom_game_info_text_not_fair" )
		--
		text = string.gsub( text, "%$map_name%$", UI:GetLevelLocalizedName( data.levelName ) )
		text = string.gsub( text, "%$gameplay%$", UI:Gameplay2Str( data.gameMode ) )
		local regionStr = UI:GetStringByName( "region_"..UI:Val2Key( MasterServer.AuthRegion, data.regionPreference ) )
		text = string.gsub( text, "%$region%$", regionStr )
		local enableStr = ""
		if data.password then
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_enable" )
		else
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_disable" )
		end
		text = string.gsub( text, "%$password%$", enableStr )
		enableStr = ""
		if data.balancePlayers then
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_enable" )
		else
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_disable" )
		end
		text = string.gsub( text, "%$auto_balancer%$", enableStr )

		local rankStr = ""
		local all = true
		if data.rankMask ~= 0 then
			for i = 1, UI:GetMaxRank() do
				if bit.band( data.rankMask, bit.lshift( 1, i ) ) == bit.lshift( 1, i ) then
					if rankStr ~= "" then
						rankStr = rankStr..","..tostring( i )
					else
						rankStr = tostring( i )
					end
				else
					all = false
				end
			end
		end
		if all then
			rankStr = UI:GetStringByName( "tooltip_custom_game_rank_all")
		end
		text = string.gsub( text, "%$ranks%$", rankStr )

		local roleStr = ""
		all = true
		if data.roleMask ~= 0 then
			for k, v in pairs( ai.ShipRoles ) do
				if bit.band( data.roleMask, bit.lshift( 1, v ) ) == bit.lshift( 1, v ) then
					if roleStr ~= "" then
						roleStr = roleStr..", "..UI:Role2Str( v )
					else
						roleStr = UI:Role2Str( v )
					end
				else
					all = false
				end
			end
		end
		if all then
			roleStr = UI:GetStringByName( "tooltip_custom_game_role_all")
		end
		text = string.gsub( text, "%$roles%$", roleStr )

		enableStr = ""
		if data.friendlyFire then
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_enable" )
		else
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_disable" )
		end
		text = string.gsub( text, "%$friendly_fire%$", enableStr )

		enableStr = ""
		if data.selfDamage then
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_enable" )
		else
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_disable" )
		end
		text = string.gsub( text, "%$self_damage%$", enableStr )

		local botStr = ""
		if data.botsCount > 0 then
			botStr = UI:GetStringByName( "tooltip_custom_game_bots_count" )
			botStr = string.gsub( botStr, "%$count%$", tostring( data.botsCount ) )
			botStr = string.gsub( botStr, "%$bot_power%$", UI:AiPreset2Str( data.botPresetName ) ) 
		else
			botStr = UI:GetStringByName( "tooltip_custom_game_bots_none" )
		end
		text = string.gsub( text, "%$bots%$", botStr )
		
		local enableStr = ""
		if data.cyberSport then
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_enable" )
		else
			enableStr = UI:GetStringByName( "tooltip_custom_game_param_disable" )
		end
		text = string.gsub( text, "%$cyberSport%$", enableStr )
	end
	self.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, text = text, caption = caption }
	return self.tooltipData
end


-- -----------------------------------------------------------------
-- UI.GameplayCustom_AdvOptionsWnd
-- -----------------------------------------------------------------

UI.GameplayCustom_AdvOptionsWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustom_AdvOptionsWnd.def =
{
	className = "Wnd",
	prototype = "FullScreenWnd",
	props =
	{
		name			= "GameplayCustom_AdvOptionsWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "gameplay_select_main",
       			defaultAnimation	= "idle",
           		links =
           		{
           			{
						objName		= "option_win",	
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "blackout",	
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.BG_EFFECT",
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
				defName 			= "gameplay_custom_adv_opt_win",
       			defaultAnimation	= "idle",
           		links =
           		{
           			{
						objName		= "title",	
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.TITLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
           			{
						objName		= "pass",	
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.PASSWORD_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_1",	
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.BOTS_COUNT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_2",	
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.BOTS_SKILLS_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_49",	
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.CYBER_SPORT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
           				objName		= "pass_input",
           				wnd			= "UI.GameplayCustomCreate_PasswordEditWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "chek_box_1",
           				wnd			= "UI.GameplayCustom_AutobalancerCheckBoxWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "chek_box_2",
           				wnd			= "UI.GameplayCustom_FriendlyfireCheckBoxWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "chek_box_3",
           				wnd			= "UI.GameplayCustom_SelffireCheckBoxWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "ranks",
           				wnd			= "UI.GameplayCustomOpt_TierListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "role",
           				wnd			= "UI.GameplayCustomOpt_RoleListWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "drop_down_1",
           				wnd			= "UI.GameplayCustomCreate_BotsComboBox",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "drop_down_2",
           				wnd			= "UI.GameplayCustomOpt_BotSkillsWnd",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_x",
           				wnd			= "UI.GameplayCustomAdvOptions_CrossBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_2",
           				wnd			= "UI.GameplayCustomAdvOptions_AcceptBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
           			{
           				objName		= "btn_3",
           				wnd			= "UI.GameplayCustomAdvOptions_CancelBtn",
           				animParams	= UI.EffectAnimParams.POS,
           			},
					{
						objName		= "chek_box_4",
						wnd			= "UI.GameplayCustom_CyberSportCheckBoxWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "drop_down_5",
						wnd			= "UI.GameplayCustomCreate_ClanShipTeam1ComboBox",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "drop_down_6",
						wnd			= "UI.GameplayCustomCreate_ClanShipTeam2ComboBox",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "text_50",
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.CLANSHIP_TEAM_1_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_51",
						layer		= "UI.GameplayCustom_AdvOptionsWnd.layers.CLANSHIP_TEAM_2_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
           		}
			}}
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_opt_title"
		},
		-- PASSWORD_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_create_password"
		},
		-- BOTS_COUNT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_create_bots_count",
		},
		-- BOTS_SKILLS_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_create_bots_skills",
		},
		-- CYBER_SPORT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_opt_cyberSport_caption",
		},
		-- CLANSHIP_TEAM_1_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Tiny" },
			text			= "^gameplay_custom_opt_clanShip_team1_caption",
		},
		-- CLANSHIP_TEAM_2_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Tiny" },
			text			= "^gameplay_custom_opt_clanShip_team2_caption",
		},
	},

	children =
	{
		"UI.GameplayCustomCreate_PasswordEditWnd",
		"UI.GameplayCustom_AutobalancerCheckBoxWnd",
		"UI.GameplayCustom_FriendlyfireCheckBoxWnd",
		"UI.GameplayCustom_SelffireCheckBoxWnd",
		"UI.GameplayCustomOpt_TierListWnd",
		"UI.GameplayCustomOpt_RoleListWnd",
		"UI.GameplayCustomCreate_BotsComboBox",
		"UI.GameplayCustomOpt_BotSkillsWnd",
		"UI.GameplayCustomAdvOptions_CrossBtn",
		"UI.GameplayCustomAdvOptions_AcceptBtn",
		"UI.GameplayCustomAdvOptions_CancelBtn",
		"UI.GameplayCustom_CyberSportCheckBoxWnd",
		"UI.GameplayCustomCreate_ClanShipTeam1ComboBox",
		"UI.GameplayCustomCreate_ClanShipTeam2ComboBox",
	}
}

-- -----------------------------------
-- consts
-- -----------------------------------
--
UI.GameplayCustom_AdvOptionsWnd.layers = 
{
	MAIN_EFFECT				= 0,
	BG_EFFECT				= 1,
	WORK_EFFECT				= 2,
	TITLE_TEXT				= 3,
	PASSWORD_TEXT			= 4,
	BOTS_COUNT_TEXT			= 5,
	BOTS_SKILLS_TEXT		= 6,
	CYBER_SPORT_TEXT		= 7,
	CLANSHIP_TEAM_1_TEXT	= 8,
	CLANSHIP_TEAM_2_TEXT	= 9,
}

-- -----------------------------------
-- vars
-- -----------------------------------
--
UI.GameplayCustom_AdvOptionsWnd.inited = false

-- -----------------------------------
-- interface functions
-- -----------------------------------

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayCustom_AdvOptionsWnd:MyReset()
	if UI.GameplayCustomOpt_BotSkillsWnd:GetNumRecords() ~= 0 then
		UI.GameplayCustomOpt_BotSkillsWnd:SelectRecord( 1 )
	end
	UI.GameplayCustomCreate_BotsComboBox:SelectRecord( 1 )
	UI.GameplayCustomCreate_PasswordEditWnd:SetEditText( "" )
	UI.GameplayCustom_AutobalancerCheckBoxWnd:Check( true )
	UI.GameplayCustom_FriendlyfireCheckBoxWnd:Check( false )
	UI.GameplayCustom_SelffireCheckBoxWnd:Check( true )
	UI.GameplayCustomOpt_TierListWnd:Reset()
	UI.GameplayCustomOpt_RoleListWnd:Reset()
	UI.GameplayCustom_CyberSportCheckBoxWnd:Check( false )
	UI.GameplayCustomCreate_ClanShipTeam1ComboBox:SelectRecord( 1 )
	UI.GameplayCustomCreate_ClanShipTeam2ComboBox:SelectRecord( 1 )
end

--
function UI.GameplayCustom_AdvOptionsWnd:F_PostLoad()
	UI.FullScreenWnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
end

--
function UI.GameplayCustom_AdvOptionsWnd:Init()
	--self:OnAfterShowOnScreen()
	if not self.inited then
		for i = 1, UI:GetMaxRank() do
			UI.GameplayCustomOpt_TierListWnd:AddRecord( i )
		end
		UI.GameplayCustomCreate_BotsComboBox:AddRecord( { bots = 0, text = tostring( 0 ) } )
		for i = 8, 24, 4 do
			local allTiersData =
			{
				bots	= i,
				text	= tostring( i )
			}
			UI.GameplayCustomCreate_BotsComboBox:AddRecord( allTiersData )
		end
		UI.GameplayCustomCreate_BotsComboBox:SelectRecord( 1 )


		local aiPresetNames = {}

		if type( _G.AiPreset ) == "table" then

			for presetName, presetInfo in pairs( _G.AiPreset ) do

				if type( presetName ) == "string" then

					if type( presetInfo ) == "table" then

						if presetInfo.use_in_lobby ~= nil then

							if type( presetInfo.use_in_lobby ) == "boolean" then
								table.insert( aiPresetNames, presetName )
							else
								sys.log( "UI.GameplayCustom_AdvOptionsWnd:Init()[ERROR]: invalid type of _G.AiPreset[\"%s\"].use_in_lobby: \"boolean\" or \"nil\" expected, got \"%s\"", presetName, type( presetInfo.use_in_lobby ) )
							end

						end

					else
						sys.log( "UI.GameplayCustom_AdvOptionsWnd:Init()[ERROR]: invalid type of _G.AiPreset[\"%s\"]: \"table\" expected, got \"%s\"", presetName, type( presetInfo ) )
					end

				else
					sys.log( "UI.GameplayCustom_AdvOptionsWnd:Init()[ERROR]: invalid type of a key in table _G.AiPreset: \"string\" expected, got \"%s\"", type( presetName ) )
				end

			end

		else
			sys.log( "UI.GameplayCustom_AdvOptionsWnd:Init()[ERROR]: invalid type of _G.AiPreset; \"table\" expected, got \"%s\"", type( _G.AiPreset ) )
		end

		table.sort( aiPresetNames )

		for presetIdx, presetName in ipairs( aiPresetNames ) do
			UI.GameplayCustomOpt_BotSkillsWnd:AddRecord( { value = presetName, text = UI:AiPreset2Str( presetName ) } )
		end

		if UI.GameplayCustomOpt_BotSkillsWnd:GetNumRecords() ~= 0 then
			UI.GameplayCustomOpt_BotSkillsWnd:SelectRecord( 1 )
		end


		UI.GameplayCustomOpt_RoleListWnd:Init()
		
		
		-- SC-100380 выбор кланшипа бля бзс
		
		local clanShips = UI:GetAllClanShipNames()
		
		local racesSorted = UI:GetRaces()
		local raceIdxs = {}
		for raceIdx, race in ipairs( racesSorted ) do
			raceIdxs[ race ] = raceIdx
		end
		
		-- кланшипы сортируются в том пом порядке, в котором у нас расы везде показываются
		local function fnSortClanShips( shipName1, shipName2 )
		
			local race1 = UI:GetClanShipStationRace( shipName1 )
			local race2 = UI:GetClanShipStationRace( shipName2 )
			
			local raceIdx1 = raceIdxs[ race1 ] or -1
			local raceIdx2 = raceIdxs[ race2 ] or -1
			
			if raceIdx1 ~= raceIdx2 then
				return raceIdx1 < raceIdx2
			end
			
			return shipName1 < shipName2
		
		end
		
		table.sort( clanShips, fnSortClanShips )
		
		-- в начале списка дефолтный
		local strDefaultClanshipName = UI:GetStringByName( "gameplay_custom_opt_clanShip_default" )
		UI.GameplayCustomCreate_ClanShipTeam1ComboBox:AddRecord( { shipName = "", text = strDefaultClanshipName } )
		UI.GameplayCustomCreate_ClanShipTeam2ComboBox:AddRecord( { shipName = "", text = strDefaultClanshipName } )
		
		for clanShipIdx, shipName in ipairs( clanShips ) do
			UI.GameplayCustomCreate_ClanShipTeam1ComboBox:AddRecord( { shipName = shipName, text = UI:ClanShip2Str( shipName ) } )
			UI.GameplayCustomCreate_ClanShipTeam2ComboBox:AddRecord( { shipName = shipName, text = UI:ClanShip2Str( shipName ) } )
		end
		
		-- по умолчанию выбран дефолтный
		UI.GameplayCustomCreate_ClanShipTeam1ComboBox:SelectRecord( 1 )
		UI.GameplayCustomCreate_ClanShipTeam2ComboBox:SelectRecord( 1 )
		
		self.inited = true
	end
end

--
function UI.GameplayCustom_AdvOptionsWnd:Hide()
	UI:PlayGlobalSound( "sound/ui/MsgHide" )
	UI.FullScreenWnd.Hide( self )
end

--
function UI.GameplayCustom_AdvOptionsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == UI.GameplayCustomAdvOptions_CrossBtn then
		self:Hide()
	elseif wnd == UI.GameplayCustomAdvOptions_CancelBtn then
		self:Hide()
	elseif wnd == UI.GameplayCustomAdvOptions_AcceptBtn then
		--UI.GameplayCustomCreateWnd:SetFair( false )
		UI.GameplayCustomCreateWnd:CheckFair()
		self:Hide()
	end
	return true
end

--
function UI.GameplayCustom_AdvOptionsWnd:OnEscape()
	self:Hide()
	return true
end

--
function UI.GameplayCustom_AdvOptionsWnd:GetMaxShipsRank()
	local maxRank = 1
	local ships = UI:GetAllEquippedShips()
	for i = 1, #ships do
		local rank = UI:GetDef( ships[ i ].defName ).rank
		maxRank = rank > maxRank and rank or maxRank
	end
	return maxRank
end

--
function UI.GameplayCustom_AdvOptionsWnd:GetFairRanks()
	local ranks = 0
	local rank = self:GetMaxShipsRank()
	local minRank = rank - 3 > 1 and rank - 3 or 1
	local maxRank = rank + 3 <= UI:GetMaxRank() and rank + 3 or UI:GetMaxRank()
	for i = minRank, maxRank do
		ranks = bit.bor( ranks, bit.lshift( 1, i ) )
	end
	return ranks
end

--
function UI.GameplayCustom_AdvOptionsWnd:GetCurrentSettings( fair )
	local settings = {
		--[[balancePlayers = true,
		botsCount = 0,
		damageMultiplier = 1,
		disableAimingPrediction = false,
		disableInfiniteRespawn = false,
		forceExpertControlMode = false,
		forceForwardFiringOnly = false,
		friendlyFire = false,
		gameInProgress = false,
		password = false,
		rankMask = 0,
		regionPreference = 0,
		respawnTimeMultiplier = 1,
		roleMask = 0,
		selfDamage = false,
		fair = true,]]
		selfDamage = true,
		balancePlayers = true,
		botPresetName = "",
	}
	if not fair then
		settings.balancePlayers = UI.GameplayCustom_AutobalancerCheckBoxWnd:IsChecked()
		settings.password = UI.GameplayCustomCreate_PasswordEditWnd:GetEditText() ~= "" and UI.GameplayCustomCreate_PasswordEditWnd:GetEditText() or nil
		settings.rankMask = UI.GameplayCustomOpt_TierListWnd:GetMask()
		settings.roleMask = UI.GameplayCustomOpt_RoleListWnd:GetMask()
		settings.friendlyFire = UI.GameplayCustom_FriendlyfireCheckBoxWnd:IsChecked()
		settings.selfDamage = UI.GameplayCustom_SelffireCheckBoxWnd:IsChecked()
		settings.botsCount = 0
		local selBotsCount = UI.GameplayCustomCreate_BotsComboBox:GetSelectedRecord()
		if selBotsCount ~= -1 then
			settings.botsCount = UI.GameplayCustomCreate_BotsComboBox:GetRecordData( selBotsCount ).bots
		end
		local selBotsPresetName = UI.GameplayCustomOpt_BotSkillsWnd:GetSelectedRecord()
		if selBotsPresetName ~= -1 then
			settings.botPresetName = UI.GameplayCustomOpt_BotSkillsWnd:GetRecordData( selBotsPresetName ).value
		end
		settings.cyberSport = UI.GameplayCustom_CyberSportCheckBoxWnd:IsChecked()
		
		-- SC-100380 - выбор кланшипа для бзс; пустая строка означает дефолтный/корпоративный
		settings.firstTeamClanShip = ""
		settings.secondTeamClanShip = ""
		
		local clanShipTeam1SelRecordIdx = UI.GameplayCustomCreate_ClanShipTeam1ComboBox:GetSelectedRecord()
		if clanShipTeam1SelRecordIdx ~= -1 then
			settings.firstTeamClanShip = UI.GameplayCustomCreate_ClanShipTeam1ComboBox:GetRecordData( clanShipTeam1SelRecordIdx ).shipName
		end
		
		local clanShipTeam2SelRecordIdx = UI.GameplayCustomCreate_ClanShipTeam2ComboBox:GetSelectedRecord()
		if clanShipTeam1SelRecordIdx ~= -1 then
			settings.secondTeamClanShip = UI.GameplayCustomCreate_ClanShipTeam1ComboBox:GetRecordData( clanShipTeam2SelRecordIdx ).shipName
		end

	end
	return settings
end

-- ------------------------------------------------------------------------
-- UI.GameplayCustomAdvOptions_CrossBtn
-- ------------------------------------------------------------------------

UI.GameplayCustomAdvOptions_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "GameplayCustomAdvOptions_CrossBtn"
		}
	}
}

-- ----------------------------------------------------------------------------
--  UI.GameplayCustom_CheckBoxWnd
-- ----------------------------------------------------------------------------

local l_numBaseCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.GameplayCustom_CheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "GameplayCustom_CheckBoxWnd",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.checkBox,
			isPrototype = true,
		},

		layers =
		{
			numLayers = l_numBaseCheckBoxLayers + 1,

    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,

    			effects =
    			{{
    				defName 			= "agreement_checkBox",

    				links =
    				{
    					{
    						objName		= "self_2",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "value",	
							layer		= "UI.GameplayCustom_CheckBoxWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},

    		-- TEXT
    		{
				id = l_numBaseCheckBoxLayers,
    			layerType	= UI.LAYER_TEXT,
       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
    		},
		}
	},

	layers =
	{
    	MAIN_EFFECT	= 0,
		DEBUG		= 1,
		TEXT		= 2,
	},

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "idle_over",
    		animationPressed	= "idle_over",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "chek",
    		animationSelect		= "chek_over",
    		animationPressed	= "chek_over",
    		animationDisabled	= "disable",
    	},
    }
}

--
function UI.GameplayCustom_CheckBoxWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	self:ToggleCheck()
	return true
end


-- ----------------------------------------------------------------------------
--  UI.GameplayCustom_AutobalancerCheckBoxWnd, UI.GameplayCustom_FriendlyfireCheckBoxWnd, UI.GameplayCustom_SelffireCheckBoxWnd, UI.GameplayCustom_CyberSportCheckBoxWnd
-- ----------------------------------------------------------------------------

UI.GameplayCustom_AutobalancerCheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "GameplayCustom_CheckBoxWnd",
		props =
		{
			name		= "GameplayCustom_AutobalancerCheckBoxWnd",
		},
		layers =
		{
			numLayers = l_numBaseCheckBoxLayers + 1,
    		-- TEXT
    		{
				id = l_numBaseCheckBoxLayers,

    			layerType	= UI.LAYER_TEXT,

       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
				text = "^gameplay_custom_opt_autobalance"
    		},
		}
	},
}

UI.GameplayCustom_FriendlyfireCheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "GameplayCustom_CheckBoxWnd",
		props =
		{
			name		= "GameplayCustom_FriendlyfireCheckBoxWnd",
		},
		layers =
		{
			numLayers = l_numBaseCheckBoxLayers + 1,
    		-- TEXT
    		{
				id = l_numBaseCheckBoxLayers,

    			layerType	= UI.LAYER_TEXT,

       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
				text = "^gameplay_custom_opt_friendlyfire"
    		},
		}
	},
}

UI.GameplayCustom_SelffireCheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "GameplayCustom_CheckBoxWnd",
		props =
		{
			name		= "GameplayCustom_SelffireCheckBoxWnd",
		},
		layers =
		{
			numLayers = l_numBaseCheckBoxLayers + 1,
    		-- TEXT
    		{
				id = l_numBaseCheckBoxLayers,

    			layerType	= UI.LAYER_TEXT,

       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
				text = "^gameplay_custom_opt_selffire"
    		},
		}
	},
}

UI.GameplayCustom_CyberSportCheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "GameplayCustom_CheckBoxWnd",
		props =
		{
			name		= "GameplayCustom_CyberSportCheckBoxWnd",
		},
		layers =
		{
			numLayers = l_numBaseCheckBoxLayers + 1,
    		-- TEXT
    		{
				id = l_numBaseCheckBoxLayers,

    			layerType	= UI.LAYER_TEXT,

       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
				text = "^gameplay_custom_opt_cyberSport_checkbox"
    		},
		}
	},
}

--
UI.GameplayCustom_TierCheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "GameplayCustom_CheckBoxWnd",
		props =
		{
			name		= "GameplayCustom_TierCheckBoxWnd",
		},
	},
}

--
function UI.GameplayCustom_TierCheckBoxWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self:IsChecked() then
		local mask, last = UI.GameplayCustomOpt_TierListWnd:GetMask()
		if not last then
			UI:PlayGlobalSound( UI.sounds.checkBox )
			self:ToggleCheck()
		else
			--UI:PlayGlobalSound( UI.sounds.invalid )
		end
	else
		UI:PlayGlobalSound( UI.sounds.checkBox )
		self:ToggleCheck()
	end
	return true
end

--
UI.GameplayCustom_RoleCheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "GameplayCustom_CheckBoxWnd",
		props =
		{
			name		= "GameplayCustom_RoleCheckBoxWnd",
		},
	},
}

--
function UI.GameplayCustom_RoleCheckBoxWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	--[[if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end]]
	if self:IsChecked() then
		local mask, last = UI.GameplayCustomOpt_RoleListWnd:GetMask()
		if not last then
			UI:PlayGlobalSound( UI.sounds.checkBox )
			self:ToggleCheck()
		else
			--UI:PlayGlobalSound( UI.sounds.invalid )
		end
	else
		UI:PlayGlobalSound( UI.sounds.checkBox )
		self:ToggleCheck()
	end
	return true
end


-- -----------------------------------------------------------------
-- UI.GameplayCustomOpt_TierListWnd
-- -----------------------------------------------------------------

UI.GameplayCustomOpt_TierListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomOpt_TierListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "GameplayCustomOpt_TierListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName				= "gameplay_custom_adv_opt_ranks",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title",	
						layer		= "UI.GameplayCustomOpt_TierListWnd.layers.TITLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_opt_rank"
		},
	},
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

-- 
function UI.GameplayCustomOpt_TierListWnd:Reset()
	local ranks = UI.GameplayCustom_AdvOptionsWnd:GetFairRanks()	
	for i = 1, UI:GetMaxRank() do
		local slotWnd = self:GetButtonForRecord( i )
		if slotWnd then
    		if bit.lshift( 1, i ) == bit.band( ranks, bit.lshift( 1, i ) ) then
    			slotWnd.checkBox:Check( true )
    		else
    			slotWnd.checkBox:Check( false )
    		end
		end
	end
end

-- 
function UI.GameplayCustomOpt_TierListWnd:GetMask()
	local first = false
	local second = false
	local mask = 0
	for i = 1, UI:GetMaxRank() do
		local slotWnd = self:GetButtonForRecord( i )
		if slotWnd then
    		if slotWnd.checkBox:IsChecked() then
    			mask = bit.bor( mask, bit.lshift( 1, i ) )
    			if first then
    				second = true
    			end
    			first = true
    		end
		end
	end
	if mask == UI.GameplayCustom_AdvOptionsWnd:GetFairRanks() then
		mask = 0
	end
	return mask, --[[check for last mark]] not( first and second )
end

-- -----------------------------------
-- consts
-- -----------------------------------

UI.GameplayCustomOpt_TierListWnd.layers = 
{
	MAIN_EFFECT				= 0,
	TITLE_TEXT				= 1,
}

UI.GameplayCustomOpt_TierListWnd.btnPrototypeName	= "GameplayCustomOptTierList_SlotWnd"

UI.GameplayCustomOpt_TierListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "ranks_",
		scrollObjName		= "",
	}
}

UI.GameplayCustomOpt_TierListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.GameplayCustomOpt_TierListWnd.MAX_SLOTS = 17

-- -----------------------------------
-- vars
-- -----------------------------------

UI.GameplayCustomOpt_TierListWnd.slotWidth		= 0
UI.GameplayCustomOpt_TierListWnd.space_slots	= 0

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.GameplayCustomOpt_TierListWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	self:PrepareLayout()

end


--
function UI.GameplayCustomOpt_TierListWnd:ShowSlot( slot )

	self:AddChild( slot.btn )
	self:RecalcLayout()

end


--
function UI.GameplayCustomOpt_TierListWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd		= self.slots[ 1 ].btn

	local firstSlotLocator	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotLocator	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )
	local slotWidth			= slotWnd and slotWnd:GetWidth() or 0

	self.slotWidth		= slotWidth
	self.space_slots	= secondSlotLocator.x - ( firstSlotLocator.x + slotWidth )

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd.btn:SetTop( firstSlotLocator.y )
	end

end


--
function UI.GameplayCustomOpt_TierListWnd:RecalcLayout()

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	local numSlots = firstVisibleRecordIdx ~= -1 and lastVisibleRecordIdx - firstVisibleRecordIdx + 1 or 0

	if numSlots > 0 then

    	local slotsTotalWidth = self.slotWidth * numSlots + self.space_slots * ( numSlots - 1 )
    	local slotsX = ( self:GetWidth() -  slotsTotalWidth ) / 2

    	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

    		local slotWnd = self:GetButtonForRecord( recordIdx )
    		if slotWnd then

    			local slotIdx = self:Record2SlotIdx( recordIdx )

    			local x = slotsX + ( self.slotWidth + self.space_slots ) * ( slotIdx - 1 )
    			slotWnd:SetLeft( x )

    		end		

    	end

	end

end


-- ----------------------------------------------------------------------------
--  UI.GameplayCustomAdvOptions_CheckBoxWnd
-- ----------------------------------------------------------------------------
UI.GameplayCustomAdvOptions_CheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",
		props =
		{
			name		= "GameplayCustomAdvOptions_CheckBoxWnd",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.checkBox,
			isPrototype = true,
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
    				defName 			= "agreement_checkBox",

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
	layers =
	{
    	MAIN_EFFECT	= 0,
		DEBUG		= 1,
		TEXT		= 2,
	},
    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "idle_over",
    		animationPressed	= "idle_over",
    		animationDisabled	= "disable",
    	},
    	main_checked =
    	{
    		animationIdle 		= "chek",
    		animationSelect		= "chek_over",
    		animationPressed	= "chek_over",
    		animationDisabled	= "disable",
    	},
    }
}

--
function UI.GameplayCustomAdvOptions_CheckBoxWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	self:ToggleCheck()
	return true
end

-- -----------------------------------------------------------------
-- UI.GameplayCustomOptTierList_SlotWnd
-- -----------------------------------------------------------------

UI.GameplayCustomOptTierList_SlotWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomOptTierList_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",
	props =
	{
		name			= "GameplayCustomOptTierList_SlotWnd",
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
				defName				= "gameplay_custom_adv_opt_ranks_slot",
				defaultAnimation    = "idle_1",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "text",
						layer		= "UI.GameplayCustomOptTierList_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	}
}


-- -----------------------------------
-- const
-- -----------------------------------

--
UI.GameplayCustomOptTierList_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    TEXT				= 1,
}

-- -----------------------------------
-- vars
-- -----------------------------------
UI.GameplayCustomOptTierList_SlotWnd.checkBox = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.GameplayCustomOptTierList_SlotWnd:F_PostLoad()
	UI.ButtonsList_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.checkBox = UI:CreateChildWnd( self, UI.GameplayCustom_TierCheckBoxWnd, "" )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	--mainEffect:LinkWnd( self.checkBox:GetUiHandle(), "chek_box", UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.checkBox, mainEffect, "chek_box", UI.EffectAnimParams.POS )
end

--
function UI.GameplayCustomOptTierList_SlotWnd:UpdateForData( data, bAnimated )
	self:SetText( tostring( data ), self.layers.TEXT )
end


-- -----------------------------------------------------------------
-- UI.GameplayCustomOpt_RoleListWnd
-- -----------------------------------------------------------------

UI.GameplayCustomOpt_RoleListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.GameplayCustomOpt_RoleListWnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "GameplayCustomOpt_RoleListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName				= "gameplay_custom_adv_opt_role",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "title",	
						layer		= "UI.GameplayCustomOpt_RoleListWnd.layers.TITLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
   			text			= "^gameplay_custom_opt_role",
		},
	},
}

UI.GameplayCustomOpt_RoleListWnd.layers = 
{
	MAIN_EFFECT				= 0,
	TITLE_TEXT				= 1,
}

-- -----------------------------------
-- vars
-- -----------------------------------
UI.GameplayCustomOpt_RoleListWnd.checkWnd = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.GameplayCustomOpt_RoleListWnd:Init()
	if not self.checkWnd then
		self.checkWnd = {}
		for k, v in pairs( ai.ShipRoles ) do
			if k ~= "NONE" then
				self.checkWnd[ v ] = UI:CreateChildWnd( self, UI.GameplayCustom_RoleCheckBoxWnd, tostring( v ) )
				self.checkWnd[ v ]:SetText( UI:Role2Str( v ), UI.GameplayCustom_RoleCheckBoxWnd.layers.TEXT )
				local linkEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
				--mainEffect:LinkWnd( self.checkBox:GetUiHandle(), "chek_box", UI.EffectAnimParams.POS )
				UI:AddChildAndLink( self, self.checkWnd[ v ], linkEffect, "chek_box_"..tostring( v ), UI.EffectAnimParams.POS )
			end
		end
		self:Reset()
	end
end

--
function UI.GameplayCustomOpt_RoleListWnd:Reset()
	if self.checkWnd then
		for k, v in pairs( self.checkWnd ) do
			v:Check( true )
		end
	end
end

--
function UI.GameplayCustomOpt_RoleListWnd:GetMask()
	local full = true
	local first = false
	local second = false
	local mask = 0
	for k, v in pairs( ai.ShipRoles ) do
		if k ~= "NONE" then
			if self.checkWnd[ v ]:IsChecked() then
				mask = bit.bor( mask, bit.lshift( 1, v ) )
				if first then
					second = true
				end
				first = true
			else
				full = false
			end
		end
	end
	if full then
		mask = 0
	end
	return mask, --[[check for last mark]]not( first and second )
end

-- ---------------------------------------------------------------------------
-- UI.ComplaintReason_Combobox
-- ---------------------------------------------------------------------------

UI.GameplayCustomOpt_BotSkillsWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "GameplayCustomOpt_BotSkillsWnd"
		},
	},

	MAX_VISIBLE_RECORDS = 3,
}

--
function UI.GameplayCustomOpt_BotSkillsWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selItemProto = UI[ self.selItemPrototypeName ]
    self.selItemWnd = UI:CreateChildWnd( self, selItemProto, "_1" )
	UI:AddChildAndLink( self, self.selItemWnd, mainEffect, self.effectInfo.main.selItemObjName, UI.EffectAnimParams.POS )	

	local listProto = UI[ self.listPrototypeName ]
    self.listWnd = UI:CreateChildWnd( self, listProto, "_1" )
	self.listWnd:Setup( self )
	self.listWnd:SetMaxSlots( self.MAX_VISIBLE_RECORDS )

	local stateBtnProto = UI[ self.stateBtnPrototypeName ]
    self.stateBtn = UI:CreateChildWnd( self, stateBtnProto, "_1" )
	UI:AddChildAndLink( self, self.stateBtn, mainEffect, self.effectInfo.main.stateBtnObjName, UI.EffectAnimParams.POS )	
	
end



-- ----------------------------------------------------------------------------
--  UI.GameplayCustomCreate_DisbalanceSetupBtn
-- ----------------------------------------------------------------------------

local l_numBtnBaseLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.GameplayCustomCreate_DisbalanceSetupBtn = {}
UI.GameplayCustomCreate_DisbalanceSetupBtn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

 	props =
 	{
 		name			= "GameplayCustomCreate_DisbalanceSetupBtn",
		--selectSound		= UI.sounds.btnMouseOver,
		--clickSound		= UI.sounds.btnClick,
 	},

 	layers =
 	{
		numLayers = l_numBtnBaseLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "gameplay_custom_adv_setup_btn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.GameplayCustomCreate_DisbalanceSetupBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}			
		},

		-- TEXT
		{
			id			= l_numBtnBaseLayers,

			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
   			text			= "^gameplay_custom_adv_setup"
		},
 	},
}

UI.GameplayCustomCreate_DisbalanceSetupBtn.layers = 
{
	MAIN_EFFECT				= 0,
	DEBUG					= 1,
	TEXT					= 2,
}

UI.GameplayCustomCreate_DisbalanceSetupBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

--
function UI.GameplayCustomCreate_DisbalanceSetupBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if not self:HasStyle( UI.WS_GRAYED ) then
		UI:PlayGlobalSound( UI.GameplayWnd.sounds.over )
	end
	return true
end


-- ----------------------------------------------------------------------------
--  UI.GameplayCustomCreate_ResetSetupBtn
-- ----------------------------------------------------------------------------

local l_numBtnBaseLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.GameplayCustomCreate_ResetSetupBtn = {}
UI.GameplayCustomCreate_ResetSetupBtn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

 	props =
 	{
 		name			= "GameplayCustomCreate_ResetSetupBtn",
		--selectSound		= UI.sounds.btnMouseOver,
		--clickSound		= UI.sounds.btnClick,
 	},

 	layers =
 	{
		numLayers = l_numBtnBaseLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "gameplay_custom_reset_setup_btn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.GameplayCustomCreate_ResetSetupBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}			
		},

		-- TEXT
		{
			id			= l_numBtnBaseLayers,

			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
   			text			= "^gameplay_custom_adv_setup_reset"
		},
 	},
}

UI.GameplayCustomCreate_ResetSetupBtn.layers = 
{
	MAIN_EFFECT				= 0,
	DEBUG					= 1,
	TEXT					= 2,
}

UI.GameplayCustomCreate_ResetSetupBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

--
function UI.GameplayCustomCreate_ResetSetupBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if not self:HasStyle( UI.WS_GRAYED ) then
		UI:PlayGlobalSound( UI.GameplayWnd.sounds.over )
	end
	return true
end



-- -------------------------------------------------------------------
-- UI.GameplayCustomAdvOptions_AcceptBtn
-- -------------------------------------------------------------------

UI.GameplayCustomAdvOptions_AcceptBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "GameplayCustomAdvOptions_AcceptBtn",
    	},
	},

	textId = "gameplay_custom_opt_accept"
}


-- -------------------------------------------------------------------
-- UI.GameplayCustomAdvOptions_CancelBtn
-- -------------------------------------------------------------------

UI.GameplayCustomAdvOptions_CancelBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "GameplayCustomAdvOptions_CancelBtn",
    	},
	},

	textId = "cancel"
}