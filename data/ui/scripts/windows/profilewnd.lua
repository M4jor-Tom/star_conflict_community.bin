-- ----------------------------------------------------------------------------
--
-- Workfile: profilewnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------



-- ------------------------------
-- UI.Profile_Wnd
-- ------------------------------

UI.Profile_Wnd = {}


--
UI.Profile_Wnd.layers = 
{
	MAIN_EFFECT 		= 0,
	BG_EFFECT			= 1,
	WORK_EFFECT			= 2,
	CAPTION				= 3,
	LOADING_EFFECT		= 4,
	LOADING_CENTER_EFFECT = 5,
}


UI.Profile_Wnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",
	props =
	{
		name			= "Profile_Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE --[[+ UI.WS_NOT_KB_REACT]],
	},	
	layers =
	{
		firstOverlayLayer = UI.Profile_Wnd.layers.LOADING_EFFECT,
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
						layer		= "UI.Profile_Wnd.layers.WORK_EFFECT",
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
				defName				= "profile_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "title",
						layer		= "UI.Profile_Wnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "load_modules",
						layer		= "UI.Profile_Wnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "load_modules2",
						layer		= "UI.Profile_Wnd.layers.LOADING_CENTER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_x",
						wnd			= "UI.ProfileAchievementsListWnd_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "subwin",
						wnd			= "UI.Profile_CommonWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_1",
						wnd			= "UI.Profile_TabsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "subwin",
						wnd			= "UI.ProfileTitles_Wnd",
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
   			text			= "^profile_window_caption",
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
		-- LOADING_CENTER_EFFECT
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
	children = { "UI.ProfileAchievementsListWnd_CrossBtn", "UI.Profile_CommonWnd", "UI.Profile_TabsWnd", 
		"UI.ProfileTitles_Wnd" },
}


-- ------------------------------
-- const
-- ------------------------------

UI.Profile_Wnd.Modes = 
{
	COMMON		 		= 1,
	ACHIEVEMENTS 		= 2,
	TITLES				= 3,
	MOTTOS 				= 4,
	ATLAS				= 5,
}

-- -----------------------------------
-- const
-- -----------------------------------
UI.Profile_Wnd.Modes = 
{
	COMMON = 
	{
		name = "COMMON",
		text = UI:GetStringByName( "profile_statistics" )
	},
	ACHIEVEMENTS = 
	{
		name = "ACHIEVEMENTS",
		text = UI:GetStringByName( "profile_achievements" )
	},
	TITLES = 
	{
		name = "TITLES",
		text = UI:GetStringByName( "profile_titles" )
	},
	MOTTOS = 
	{
		name = "MOTTOS",
		text = UI:GetStringByName( "profile_mottos" )
	},
	ATLAS = 
	{
		name = "ATLAS",
		text = UI:GetStringByName( "profile_atlas" )
	},
}

UI.Profile_Wnd.Order = 
{
	"COMMON",
	"ATLAS",
	"ACHIEVEMENTS",
	"TITLES",
	"MOTTOS",
}

UI.Profile_Wnd.sounds =
{
	click						= UI.sounds.btnClick,
}

-- ------------------------------
-- var
-- ------------------------------

UI.Profile_Wnd.mode = nil

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.Profile_Wnd:ShowTitle( titleId )

	if not self:IsOnScreen() then
		sys.log( "UI.Profile_Wnd:ShowTitle()[ERROR]: not on screen" )
		return
	end
	
	UI.Profile_TabsWnd:SelectTab( "TITLES" )
	
	UI.ProfileTitles_Wnd:ShowTitle( titleId )

end


--
function UI.Profile_Wnd:UpdateNickName()

	local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.uid )
	if not bCached then
		nickName = ""
	end

	self:SetText( UI:GetStringByName( "profile_window_caption" ).." "..nickName, self.layers.CAPTION )

end


--
function UI.Profile_Wnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	--if self.uid == nil then 
	--self.mode = UI.Profile_Wnd.Modes.COMMON
	--end

	if not self.inited then
		for i = 1, #self.Order do
			local v = self.Modes[ self.Order[ i ] ]
			UI.Profile_TabsWnd:AddRecord( v )
		end
		self.inited = true
	end

	if not self:IsChildOf( UI.HangarWnd ) then
		UI:PlayGlobalSound( UI.HangarWnd.sounds.menuTabSelect )
	end

	self.uid = _G.MasterServer_GetLocalUserId()
	if UI.Profile_TabsWnd:GetSelectedRecord() == 1 then
		self:UpdateMode()
	else
		UI.Profile_TabsWnd:SelectRecord( 1 )
	end
	
	--self:UpdateMode()
	if not UI.bSavingGameState then
		_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_OPEN_PROFILE )
	end

end


--
function UI.Profile_Wnd:Setup( uid )

	self.uid = uid
	if UI.Profile_TabsWnd:GetSelectedRecord() == 1 then
		self:UpdateMode()
	else
		UI.Profile_TabsWnd:SelectRecord( 1 )
	end
	--self:UpdateMode()

end


--
--[[function UI.Profile_Wnd:Show()

	UI.FullScreenWnd.Show( self )
	self:UpdateMode()

end]]


--
function UI.Profile_Wnd:UpdateMode()

	self:ShowWait( false )
	self:UpdateNickName()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if self.mode == UI.Profile_Wnd.Modes.ACHIEVEMENTS then
		UI.Profile_CommonWnd:UnlinkFromParent()
		UI.ProfileTitles_Wnd:UnlinkFromParent()
	elseif self.mode == UI.Profile_Wnd.Modes.COMMON then
		UI.ProfileTitles_Wnd:UnlinkFromParent()
		UI:AddChildAndLink( self, UI.Profile_CommonWnd, mainEffect, "subwin", UI.EffectAnimParams.POS )
		UI.Profile_CommonWnd:Update( self.uid )
	elseif self.mode == UI.Profile_Wnd.Modes.TITLES then
		UI.Profile_CommonWnd:UnlinkFromParent()
		UI:AddChildAndLink( self, UI.ProfileTitles_Wnd, mainEffect, "subwin", UI.EffectAnimParams.POS )
		UI.ProfileTitles_Wnd:SetMode( UI.ProfileTitles_Wnd.Modes.TITLES )
		UI.ProfileTitles_Wnd:Update( self.uid )
	elseif self.mode == UI.Profile_Wnd.Modes.MOTTOS then
		UI.Profile_CommonWnd:UnlinkFromParent()
		UI:AddChildAndLink( self, UI.ProfileTitles_Wnd, mainEffect, "subwin", UI.EffectAnimParams.POS )
		UI.ProfileTitles_Wnd:SetMode( UI.ProfileTitles_Wnd.Modes.MOTTOS )
		UI.ProfileTitles_Wnd:Update( self.uid )
	elseif self.mode == UI.Profile_Wnd.Modes.ATLAS then
		sys.log( "UI.Profile_Wnd:UpdateMode()[ERROR]: not supported mode %s", self.mode.name )
		UI.Profile_CommonWnd:UnlinkFromParent()
		UI.ProfileTitles_Wnd:UnlinkFromParent()
	else
		if self.mode ~= nil then
			sys.log( "UI.Profile_Wnd:UpdateMode(): unhandled mode" )
		end
		UI.Profile_CommonWnd:UnlinkFromParent()
		UI.ProfileTitles_Wnd:UnlinkFromParent()
	end

end


--
function UI.Profile_Wnd:ShowWait( bool )

	if self.mode == UI.Profile_Wnd.Modes.ACHIEVEMENTS then
		self:SetLayerVisible( bool, self.layers.LOADING_EFFECT )
		self:SetLayerVisible( false, self.layers.LOADING_CENTER_EFFECT )
	else--if self.mode == UI.Profile_Wnd.Modes.COMMON then
		self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
		self:SetLayerVisible( bool, self.layers.LOADING_CENTER_EFFECT )
	end

end


--
function UI.Profile_Wnd:IsWait()

	return self:IsLayerVisible( self.layers.LOADING_EFFECT ) or self:IsLayerVisible( self.layers.LOADING_CENTER_EFFECT )

end


--
function UI.Profile_Wnd:OnEscape()
	if self:IsChildOf( UI.HangarWnd ) then
		return false
	else
		self:Hide()
		UI:PlayGlobalSound( UI.HangarWnd.sounds.menuTabSelect )
		return true
	end
end

--
function UI.Profile_Wnd:SetMode( modeName )

	if modeName == "ATLAS" or  modeName == "ACHIEVEMENTS" then
		if self:IsOnScreen() then
			UI:ShowProfile( self.uid, modeName, false, nil, { bOldProfile = true, modeName = self.mode and self.mode.name } )
		else
			sys.log( "UI.Profile_Wnd:SetMode()[ERROR]: not on screen" )
		end
	else
    	local mode = UI.Profile_Wnd.Modes[ modeName ]
    	if self.mode ~= mode then
    		self.mode = mode
    		self:UpdateMode()
    	end
	end
end

--
function UI.Profile_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI.ProfileAchievementsListWnd_CrossBtn == wnd then
		if self:IsChildOf( UI.HangarWnd ) then
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
		else
			self:Hide()
			UI:PlayGlobalSound( UI.HangarWnd.sounds.menuTabSelect )
		end
	end

	return true

end

-- -----------------------------------------------------------------
-- UI.Profile_TabsWnd
-- -----------------------------------------------------------------
UI.Profile_TabsWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.Profile_TabsWnd.def =
{
	className 	= "Wnd",
	prototype	= "TabsMain",
	props =
	{
		name			= "Profile_TabsWnd",
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
				defName				= "profile_tab_main",
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
UI.Profile_TabsWnd.parentWindow = UI.Profile_Wnd

UI.Profile_TabsWnd.MAX_SLOTS = 6
UI.Profile_TabsWnd.btnPrototypeName = "Profile_Tabs_SlotWnd"

UI.Profile_TabsWnd.slotLocators =
{
	"btn_1",
	"atlas_btn",
	"btn_2",
	"btn_3",
	"btn_4",
	"btn_5",
	"btn_6",
}

-- ------------------------------
-- work
-- ------------------------------

--
function UI.Profile_TabsWnd:InitSlots()

	UI.TabsMain.InitSlots( self )

	for idx, slot in pairs( self.slots ) do
		slot.regularBtn = slot.btn
	end

end


--
function UI.Profile_TabsWnd:ShowSlot( slot )

	local record = self:GetRecordForSlot( slot )
	local modeName = record.data.name

	local btn = nil

	if modeName == "ATLAS" or modeName == "ACHIEVEMENTS" then

		if not slot.btn_2 then
			slot.btn_2 = UI:CreateChildWnd( self, UI.Profile_Tabs_SlotWnd_2, string.format( "%d_2", slot.idx ) )
			slot.btn_2:SetSlot( slot.idx, self )
		end

		btn = slot.btn_2
		
	elseif modeName == "COMMON" then

		if not slot.btn_3 then
			slot.btn_3 = UI:CreateChildWnd( self, UI.Profile_Tabs_SlotWnd_3, string.format( "%d_3", slot.idx ) )
			slot.btn_3:SetSlot( slot.idx, self )
		end

		btn = slot.btn_3

	else
		btn = slot.regularBtn
	end	

	if btn ~= slot.btn then
		slot.btn:UnlinkFromParent()
		slot.btn = btn
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local objName = self.slotLocators[ slot.idx ]
	UI:AddChildAndLink( self, slot.btn, mainEffect, objName, UI.EffectAnimParams.POS )

end


-- -----------------------------------------------------------------
-- UI.Profile_Tabs_SlotWnd
-- -----------------------------------------------------------------
UI.Profile_Tabs_SlotWnd = {}
-- ------------------------------
-- window definition
-- ------------------------------
--
UI.Profile_Tabs_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "TabsMain_SlotWnd",
	props =
	{
		name			= "Profile_Tabs_SlotWnd",
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
				defName				= "profile_tab_slot",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "text",
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

-- -----------------------------------------------------------------
-- UI.Profile_Tabs_SlotWnd_2
-- -----------------------------------------------------------------

UI.Profile_Tabs_SlotWnd_2 =
{
	def =
	{
		className 	= "Wnd",
		prototype	= "Profile_Tabs_SlotWnd",
		props =
		{
			name			= "Profile_Tabs_SlotWnd_2",
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
					defName				= "profile_tab_slot_2",
					defaultAnimation    = "idle",
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						{
							objName		= "title",
							layer		= "UI.TabsMain_SlotWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	}
}

-- -----------------------------------------------------------------
-- UI.Profile_Tabs_SlotWnd_3
-- -----------------------------------------------------------------

UI.Profile_Tabs_SlotWnd_3 =
{
	def =
	{
		className 	= "Wnd",
		prototype	= "Profile_Tabs_SlotWnd",
		props =
		{
			name			= "Profile_Tabs_SlotWnd_3",
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
					defName				= "profile_tab_slot_3",
					defaultAnimation    = "idle",
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
						{
							objName		= "title",
							layer		= "UI.TabsMain_SlotWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	}
}