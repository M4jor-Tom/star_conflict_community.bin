-- ----------------------------------------------------------------------------
--
-- Workfile: gameplaywnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.ClansWnd
-- -----------------------------------------------------------------

UI.GameplayWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.GameplayWnd.layers = 
{
	MAIN_EFFECT 		= 0,
	BG_EFFECT			= 1,
	WORK_EFFECT			= 2,
	STAR_EFFECT			= 3,
	TITLE				= 4,
	MASK				= 5,
	STAR_EFFECT_2		= 6,
	SECTOR_INFO 		= 7,
}

--
UI.GameplayWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "GameplayWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE --[[+ UI.WS_NOT_MOUSE_REACT]]  + UI.WS_NOT_KB_REACT,
	},	

	layers =
	{
		firstOverlayLayer = UI.GameplayWnd.layers.MASK,
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
				defName				= "gameplay_select_wnd",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "btn_x",	
						wnd			= "UI.Gameplay_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_4",	
						wnd			= "UI.GameplayCustom_JoinBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_5",	
						wnd			= "UI.GameplayCustom_SetupBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_1",	
						wnd			= "UI.GameplayCustom_SpectatorBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",	
						wnd			= "UI.GameplayCustom_CreateBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",	
						wnd			= "UI.GameplayCustom_EditAcceptBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_3",	
						wnd			= "UI.GameplayCustom_ListBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",	
						wnd			= "UI.GameplayCustom_StartBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_1",	
						wnd			= "UI.GameplayCustom_LeaveBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	
					{
						objName		= "bg",	
						layer		= "UI.GameplayWnd.layers.STAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
					{
						objName		= "bg",	
						layer		= "UI.GameplayWnd.layers.STAR_EFFECT_2",
						animParams	= UI.EffectAnimParams.POS,
					},	
					{
						objName		= "title",	
						layer		= "UI.GameplayWnd.layers.TITLE",
						animParams	= UI.EffectAnimParams.ALL,
					},	
					{
						objName		= "text_4",	
						layer		= "UI.GameplayWnd.layers.SECTOR_INFO",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "bg",	
						layer		= "UI.GameplayWnd.layers.MASK",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS,
					},
					{
						objName		= "bg",	
						wnd			= "UI.GameplayCustomWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "bg",	
						wnd			= "UI.GameplayCustomCreateWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "bg",	
						wnd			= "UI.GameplayCustomLobbyWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- STAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,

			effects =
			{{
				defName				= "gameplay_select_bg",
				defaultAnimation    = "idle",
			}}
		},
		-- TITLE
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^gameplaySelect_title",
		},
		-- MASK
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "notificationsMask",
			visible		= false,
		},
		-- STAR_EFFECT_2
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "gameplay_select_bg_2",
				defaultAnimation    = "idle",
			}}
		},
		-- SECTOR_INFO
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
   			text			= "^gameplay_select_galaxy_battle_info"
		},
	},

	children = { "UI.Gameplay_CrossBtn", "UI.GameplayCustomWnd", "UI.GameplayCustomCreateWnd", "UI.GameplayCustomLobbyWnd", "UI.GameplayCustom_ListBtn", 
		"UI.GameplayCustom_JoinBtn", "UI.GameplayCustom_SpectatorBtn", "UI.GameplayCustom_SetupBtn", "UI.GameplayCustom_CreateBtn",
		"UI.GameplayCustom_StartBtn", "UI.GameplayCustom_LeaveBtn", "UI.GameplayCustom_EditAcceptBtn" },
}

-- -----------------------------------
-- const
-- -----------------------------------

-- -----------------------------------
-- vars
-- -----------------------------------

UI.GameplayWnd.inited = false
UI.GameplayWnd.lobbyState = false
UI.GameplayWnd.gameTypeInfo = nil
UI.GameplayWnd.pveMode = nil

--
UI.GameplayWnd.sounds =
{
	hide						= "sound/ui/MsgHide",
	click						= UI.sounds.btnClick,
	invalid						= "sound/ui/invalid",
	over						= UI.sounds.btnMouseOver,
	show						= "sound/ui/btnClick",
}

--
UI.GameplayWnd.squadInviteType =
{
	SECTOR 				= 0,
	ARCADE 				= 1,
	PVE 				= 2,
	RAID 				= 3,
	COOP_VS_AI			= 4,
	ARENA				= 5,
	TOURNAMENT			= 6,
	FOOTBALL			= 7,
	BRAWL				= 8,
}

--
UI.GameplayWnd.Modes = 
{
	FREE_SPACE			= 1,
	BATTLE_FOR_SECTOR	= 2,
	CUSTOM_GAME			= 3,
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
--[[function UI.GameplayWnd:UpdateQuestAvailable()
	local b = false
	local quests = UI.GetFreespaceQuests()
	if quests then
		for k, v in pairs( quests ) do
			if Quests[ v.id ].openspace then
				b = true
				break
			end
		end
	end
	UI.Gameplay_Category2Btn:SetQuestAvailable( b )
end]]


--
function UI.GameplayWnd:ShowMapFromHangar()
--[[
	if self.mode == UI.GameplayWnd.Modes.FREE_SPACE then
		self:SetMode( UI.GameplayWnd.Modes.FREE_SPACE, true )
	elseif self.mode == UI.GameplayWnd.Modes.BATTLE_FOR_SECTOR then
		self:SetMode( UI.GameplayWnd.Modes.BATTLE_FOR_SECTOR, true )
	else
		self:SetMode( UI.GameplayWnd.Modes.FREE_SPACE )
	end
]]

	self:SetMode( UI.GameplayWnd.Modes.FREE_SPACE, true )
end

--
function UI.GameplayWnd:SetMode( mode, force )
	if not UI.Lobby:IsInLobby() or mode == self.Modes.CUSTOM_GAME then
		if self.mode ~= mode or mode == self.Modes.CUSTOM_GAME or force then
			self.mode = mode
			self:Update()
		end
	end
end

--
function UI.GameplayWnd:GetMode()
	return self.mode
end


--
function UI.GameplayWnd:OnFreeEnable()
	
end

--
function UI.GameplayWnd:SetLobby( flag )
	if self.lobbyState ~= flag then
		if flag then
			self:SetMode( self.Modes.CUSTOM_GAME )
		else
			self:Update()
		end
		self.lobbyState = flag
	end
	return
end

--
function UI.GameplayWnd:PrepareAndStartCallToArms()
	self:SetGameplay( { mmParams = { tournament = true, region = UI:GetGameRegion()  } } )
	self:StartMatchMaking()
end

--
function UI.GameplayWnd:PrepareAndStartFreeSpace( slotId, zoneId )
	self:SetGameplay( { mode = "FREE_SPACE", battleSlot = slotId, zoneId = zoneId } )
	self:StartMatchMaking()
end

--
function UI.GameplayWnd:PrepareAndStartArcade()
	self:SetGameplay( { mmParams = { arcade = 1, region = UI:GetGameRegion() } } )
	self:StartMatchMaking()
end

--
function UI.GameplayWnd:ShowCustom( create )
	if create then
		UI:AddChildAndLink( self, UI.GameplayCustomCreateWnd, UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT ) , "bg", UI.EffectAnimParams.POS )
		self:MoveChildToFirstPosition( UI.GameplayCustomCreateWnd )
		UI.GameplayCustomWnd:UnlinkFromParent()
		UI.GameplayCustomLobbyWnd:UnlinkFromParent()
	else
		if UI.Lobby:IsInLobby() then
			UI.GameplayCustomWnd:UnlinkFromParent()
			UI.GameplayCustomCreateWnd:UnlinkFromParent()
			UI:AddChildAndLink( self, UI.GameplayCustomLobbyWnd, UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT ) , "bg", UI.EffectAnimParams.POS )
			self:MoveChildToFirstPosition( UI.GameplayCustomLobbyWnd )
		else
			UI.GameplayCustomLobbyWnd:UnlinkFromParent()
			UI:AddChildAndLink( self, UI.GameplayCustomWnd, UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT ) , "bg", UI.EffectAnimParams.POS )
			self:MoveChildToFirstPosition( UI.GameplayCustomWnd )
			UI.GameplayCustomCreateWnd:UnlinkFromParent()
		end
	end
	self:UpdateStartBtnState()
	UI.GameplayCustom_List:Update()
end


--
function UI.GameplayWnd:UpdateStartBtnState()
	UI.GameplayCustom_ListBtn:UnlinkFromParent()
	if UI.GameplayCustomWnd:IsChildOf( self ) then
		UI.GameplayCustom_ListBtn:UnlinkFromParent()
		UI.GameplayCustom_CreateBtn:UnlinkFromParent()
		UI.GameplayCustom_StartBtn:UnlinkFromParent()
		UI.GameplayCustom_LeaveBtn:UnlinkFromParent()
		UI.GameplayCustom_EditAcceptBtn:UnlinkFromParent()
		self:AddChild( UI.GameplayCustom_JoinBtn )
		self:AddChild( UI.GameplayCustom_SpectatorBtn )
		local lobbies = UI.Lobby:GetList()
		if #lobbies > 0 then
			UI.GameplayCustom_JoinBtn:Enable( true )
			UI.GameplayCustom_SpectatorBtn:Enable( true )
		else
			UI.GameplayCustom_JoinBtn:Enable( false )
			UI.GameplayCustom_SpectatorBtn:Enable( false )
		end
		self:AddChild( UI.GameplayCustom_SetupBtn )
		return
	end
	if UI.GameplayCustomCreateWnd:IsOnScreen() then
		UI.GameplayCustom_JoinBtn:UnlinkFromParent()
		UI.GameplayCustom_SpectatorBtn:UnlinkFromParent()
		UI.GameplayCustom_SetupBtn:UnlinkFromParent()
		UI.GameplayCustom_StartBtn:UnlinkFromParent()
		UI.GameplayCustom_LeaveBtn:UnlinkFromParent()
		self:AddChild( UI.GameplayCustom_ListBtn )
		if UI.Lobby:IsInLobby() then
			UI.GameplayCustom_CreateBtn:UnlinkFromParent()
			self:AddChild( UI.GameplayCustom_EditAcceptBtn )
		else
			self:AddChild( UI.GameplayCustom_CreateBtn )
			UI.GameplayCustom_EditAcceptBtn:UnlinkFromParent()
		end
		return
	end
	if UI.GameplayCustomLobbyWnd:IsOnScreen() then
		UI.GameplayCustom_JoinBtn:UnlinkFromParent()
		UI.GameplayCustom_SpectatorBtn:UnlinkFromParent()
		UI.GameplayCustom_SetupBtn:UnlinkFromParent()
		UI.GameplayCustom_ListBtn:UnlinkFromParent()
		UI.GameplayCustom_CreateBtn:UnlinkFromParent()
		UI.GameplayCustom_StartBtn:UnlinkFromParent()
		UI.GameplayCustom_LeaveBtn:UnlinkFromParent()
		UI.GameplayCustom_EditAcceptBtn:UnlinkFromParent()
		UI.GameplayCustom_EditAcceptBtn:UnlinkFromParent()
		if UI.Lobby:IsLobbyLeader() then
			self:AddChild( UI.GameplayCustom_StartBtn )
			UI:AddChildAndLink( self, UI.GameplayCustom_LeaveBtn, UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT ) , "btn_3", UI.EffectAnimParams.POS )
		else
			UI.GameplayCustom_StartBtn:UnlinkFromParent()
			UI:AddChildAndLink( self, UI.GameplayCustom_LeaveBtn, UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT ) , "btn_1", UI.EffectAnimParams.POS )
		end
		return
	end
	
	UI.GameplayCustom_JoinBtn:UnlinkFromParent()
	UI.GameplayCustom_SpectatorBtn:UnlinkFromParent()
	UI.GameplayCustom_SetupBtn:UnlinkFromParent()
	UI.GameplayCustom_ListBtn:UnlinkFromParent()
	UI.GameplayCustom_CreateBtn:UnlinkFromParent()
	UI.GameplayCustom_StartBtn:UnlinkFromParent()
	UI.GameplayCustom_LeaveBtn:UnlinkFromParent()
	UI.GameplayCustom_EditAcceptBtn:UnlinkFromParent()
	
end

--
function UI.GameplayWnd:SetGameplay( gameplayInfo )

	self.gameTypeInfo = gameplayInfo

end

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.GameplayWnd:F_PostLoad()
	UI.FullScreenWnd.F_PostLoad( self )
	UI.GameplayCustomLobbyWnd:UnlinkFromParent()
	UI.GameplayCustomWnd:UnlinkFromParent()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.GameplayWnd:F_OnAfterShowOnScreen()
	UI:PlayGlobalSound( self.sounds.show )
	if not self.inited then
		-- 
		self.inited = true
	end
	self:SetLobby( UI.Lobby:IsInLobby() )
	--self:UpdateXs()
	self:OnAfterShowOnScreen()
end

--
function UI.GameplayWnd:OnEscape( key, controllerIdx )
	UI:PlayGlobalSound( self.sounds.hide )
	if not UI.Lobby:IsInLobby() then
		if UI.GameplayCustomCreateWnd:IsOnScreen() then
			UI:PlayGlobalSound( "sound/ui/MsgHide" )
			self:SetMode( self.Modes.CUSTOM_GAME )
			return true
		end
		if UI.GameplayCustomWnd:IsOnScreen() then
			UI:PlayGlobalSound( "sound/ui/MsgHide" )
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, false, true )
			return true
		end
		--[[if UI.GameplayCustom_AdvOptionsWnd:IsOnScreen() then
			UI:PlayGlobalSound( "sound/ui/MsgHide" )
			self:ShowCustom( true )
			return true
		end]]
	end
	return false	
end

--
function UI.GameplayWnd:Update()
	self:SetLayerVisible( false, self.layers.SECTOR_INFO )
	if self.mode == self.Modes.CUSTOM_GAME then
		self:SetText( UI:GetStringByName( "gameplaySelect_title" ), self.layers.TITLE )
		self:ShowCustom()
		self:SetLayerVisible( false, self.layers.STAR_EFFECT )
		self:SetLayerVisible( false, self.layers.STAR_EFFECT_2 )
	else
		if self.mode == self.Modes.FREE_SPACE then
			self:SetText( UI:GetStringByName( "gameplaySelect_title_free_space" ), self.layers.TITLE )
		else
			self:SetText( UI:GetStringByName( "gameplaySelect_title_bfs" ), self.layers.TITLE )
		end
--		self:ShowPveMap()
		UI.GameplayCustomWnd:UnlinkFromParent()
		UI.GameplayCustomCreateWnd:UnlinkFromParent()
		UI.GameplayCustomLobbyWnd:UnlinkFromParent()
		self:SetLayerVisible( false, self.layers.STAR_EFFECT )
		self:SetLayerVisible( false, self.layers.STAR_EFFECT_2 )
	end

	self:UpdateStartBtnState()

end

--
function UI.GameplayWnd:GetStartedGameplay()
	return self.gameTypeInfo
end

--
function UI.GameplayWnd:F_OnEventSaveUiState()
	UI.store.GameplayWnd =
	{
		gameTypeInfo	= self.gameTypeInfo,
	}
end

--
function UI.GameplayWnd:F_OnEventRestoreUiState()
	if UI.store.GameplayWnd then
		-- TODO сохранять ещё и текущий запущенный геймплей
		self.gameTypeInfo = UI.store.GameplayWnd.gameTypeInfo
		UI.store.GameplayWnd = nil
	end
end

--
function UI.GameplayWnd:MapGameplayModeToSquadInviteType()
	if self.gameTypeInfo.mmParams then
		if self.gameTypeInfo.mmParams.pve ~= nil then
			return self.squadInviteType.PVE
		elseif self.gameTypeInfo.mmParams.pve_raid ~= nil then
			return self.squadInviteType.RAID
		elseif self.gameTypeInfo.mmParams.arcade ~= nil then
			return self.squadInviteType.ARCADE
		elseif self.gameTypeInfo.mmParams.coop_vs_ai ~= nil then
			return self.squadInviteType.COOP_VS_AI
		elseif self.gameTypeInfo.mmParams.universe ~= nil then
			return self.squadInviteType.SECTOR
		elseif self.gameTypeInfo.mmParams.tournament ~= nil then
			return self.squadInviteType.TOURNAMENT
		elseif self.gameTypeInfo.mmParams.league ~= nil then
			return self.squadInviteType.ARENA
		elseif self.gameTypeInfo.mmParams.football ~= nil then
			return self.squadInviteType.FOOTBALL
		elseif self.gameTypeInfo.mmParams.brawl ~= nil then
			return self.squadInviteType.BRAWL
		end
	end
	sys.log( "UI.GameplayWnd:MapGameplayModeToSquadInviteMod()[ERROR]: unknown gameplay" )
	return -1
end

--
function UI.GameplayWnd:StartMatchMaking()
	if self.gameTypeInfo then
		if self.gameTypeInfo.mode == "FREE_SPACE" then
			UI.HangarWnd:CheckStartMatchMaking( self.gameTypeInfo.battleSlot, self.gameTypeInfo )
			return
		end
		if UI.Squad:IsInSquad() then
			if UI.Squad:GetLeaderUid() == _G.MasterServer_GetLocalUserId() then
				-- сингл
				if UI:IsTrueEx( self.gameTypeInfo.single ) then
					 UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "squad_cant_start_single" ), UI.MBS_OK )
					 return
				end
				local checkReadyType = self:MapGameplayModeToSquadInviteType()
				UI.HangarWnd:CheckStartMatchMaking( nil, self.gameTypeInfo, checkReadyType )
			end
		else
			UI.HangarWnd:CheckStartMatchMaking( nil, self.gameTypeInfo )
		end
	else
		sys.log( "UI.GameplayWnd:F_OnMouseLButtonDown()[ERROR]: UI.GameplayWnd:GetSelectedGameplay() return nil" )
	end
end

--
function UI.GameplayWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.Gameplay_CrossBtn == wnd then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	elseif UI.GameplayCustom_JoinBtn == wnd then
		UI:PlayGlobalSound(self.sounds.click )
		UI.GameplayCustom_List:JoinLobby( false )
	elseif UI.GameplayCustom_SpectatorBtn == wnd then
		UI:PlayGlobalSound(self.sounds.click )
		UI.GameplayCustom_List:JoinLobby( true )
	elseif UI.GameplayCustom_SetupBtn == wnd then
		UI:PlayGlobalSound(self.sounds.click )
		self:ShowCustom( true )
	elseif UI.GameplayCustom_CreateBtn == wnd then
		UI:PlayGlobalSound(self.sounds.click )
		UI.GameplayCustomCreateWnd:CreateLobby()
	elseif UI.GameplayCustom_ListBtn == wnd then
		UI:PlayGlobalSound(self.sounds.click )
		self:ShowCustom( false )
	elseif UI.GameplayCustom_StartBtn == wnd then
		UI:PlayGlobalSound(self.sounds.click )
		UI.GameplayCustomLobbyWnd:StartLobby()
	elseif UI.GameplayCustom_EditAcceptBtn == wnd then
		--UI.GameplayCustomCreateWnd:EditLobby()
		self:ShowCustom()
	elseif UI.GameplayCustom_LeaveBtn == wnd then
		UI:PlayGlobalSound(self.sounds.click )
		_G.MasterServer_LobbyLeave()
	end
	return true
end


--
function UI.GameplayWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.STAR_EFFECT or layerIdx == self.layers.STAR_EFFECT_2 then
		local maskRect = self:ToScreen( self:GetLayerRect( self.layers.MASK ) )
		local hTexMask = self:GetTexture( self.layers.MASK )
		UI.drawer:BeginMask( hTexMask, maskRect )
		self:DrawLayer( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ), layerIdx )
		UI.drawer:EndMask()
	end
end

-- ------------------------------------------------------------------------
-- UI.Gameplay_CrossBtn
-- ------------------------------------------------------------------------

UI.Gameplay_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Gameplay_CrossBtn"
		}
	}
}

-- ---------------------------------------------------------------------------------
-- UI.Gameplay_MinorBtn
-- ---------------------------------------------------------------------------------
UI.Gameplay_MinorBtn = {}
-- ------------------------------------
-- window definition
-- -----------------------------------
local numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )
UI.Gameplay_MinorBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	props =
	{
		name		= "Gameplay_MinorBtn",
		--selectSound	= UI.MsgBox.sounds.btnMouseOver,
		isPrototype	= true,
	},
	layers =
	{
		numLayers = numBaseBtnLayers + 1,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			effects =
			{{
				defName 			= "gameplay_custom_minor_btn",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "text",
						layer		= "UI.Gameplay_MinorBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},
		-- TEXT
		{
			id				= numBaseBtnLayers,
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------
--
function UI.Gameplay_MinorBtn:SetBtnText( text )
	self:SetText( text, self.layers.TEXT )
end
-- ------------------------------------
-- const
-- ------------------------------------
UI.Gameplay_MinorBtn.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
}

UI.Gameplay_MinorBtn.effectInfo =
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

-- ------------------------------------
-- vars
-- ------------------------------------
UI.Gameplay_MinorBtn.textId = ""
-- ------------------------------------
-- work functions
-- ------------------------------------
--
function UI.Gameplay_MinorBtn:F_PostLoad()
	UI.EffectButtonWnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	if self.textId ~= "" then
		self:SetBtnText( UI:GetStringByName( self.textId ) )
	end
end

--
function UI.Gameplay_MinorBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self:HasStyle( UI.WS_GRAYED ) then
		--UI:PlayGlobalSound( UI.GameplayWnd.sounds.invalid )
		return true
	end

	return false
end

--
function UI.Gameplay_MinorBtn:Enable( b )
	if b then 
		self:RemoveStyle( UI.WS_GRAYED )
	else
		self:AddStyle( UI.WS_GRAYED )
	end
end

--
function UI.Gameplay_MinorBtn:IsEnabled()
	return not self:HasStyle( UI.WS_GRAYED )
end

--
function UI.Gameplay_MinorBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self:IsEnabled() then
		UI:PlayGlobalSound( UI.GameplayWnd.sounds.over )
	end
	return true
end

--
function UI.Gameplay_MinorBtn:F_OnMouseOut( wndThatReceivedInput )
	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end
	return true
end


--
UI.GameplayCustom_ListBtn = {}
UI.GameplayCustom_ListBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayLobby_ListBtn",
	},
}
UI.GameplayCustom_ListBtn.textId = "gameplay_custom_listBtn"

--
UI.GameplayCustom_JoinBtn = {}
UI.GameplayCustom_JoinBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayCustom_JoinBtn",
	},
}
UI.GameplayCustom_JoinBtn.textId = "gameplay_custom_joinBtn"

--
UI.GameplayCustom_SpectatorBtn = {}
UI.GameplayCustom_SpectatorBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayCustom_SpectatorBtn",
	},
}
UI.GameplayCustom_SpectatorBtn.textId = "gameplay_custom_spectatorBtn"

--
UI.GameplayCustom_SetupBtn = {}
UI.GameplayCustom_SetupBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayCustom_SetupBtn",
	},
}
UI.GameplayCustom_SetupBtn.textId = "gameplay_custom_setupBtn"

--
UI.GameplayCustom_CreateBtn = {}
UI.GameplayCustom_CreateBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayCustom_CreateBtn",
	},
}
UI.GameplayCustom_CreateBtn.textId = "gameplay_custom_createBtn"

--
UI.GameplayCustom_EditAcceptBtn = {}
UI.GameplayCustom_EditAcceptBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayCustom_EditAcceptBtn",
	},
}
UI.GameplayCustom_EditAcceptBtn.textId = "gameplay_custom_edit_acceptBtn"

--
UI.GameplayCustom_StartBtn = {}
UI.GameplayCustom_StartBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayCustom_StartBtn",
	},
}
UI.GameplayCustom_StartBtn.textId = "gameplay_custom_startBtn"

--
UI.GameplayCustom_LeaveBtn = {}
UI.GameplayCustom_LeaveBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Gameplay_MinorBtn",
	props =
	{
		name		= "GameplayCustom_LeaveBtn",
	},
}
UI.GameplayCustom_LeaveBtn.textId = "gameplay_custom_leaveBtn"