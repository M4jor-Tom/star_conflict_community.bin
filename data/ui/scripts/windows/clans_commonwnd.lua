-- ----------------------------------------------------------------------------
--
-- Workfile: clans_commonwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.ClansMyClan_Wnd
-- -----------------------------------------------------------------

UI.ClansMyClan_Wnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClansMyClan_Wnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "ClansMyClan_Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "clan_my_clan_wnd",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "list",
						wnd			= "UI.ClansMyClan_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "chek_box",
						wnd			= "UI.ClansMain_RecruitingCheckBox",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "add_slot",
						layer		= "UI.ClansMyClan_Wnd.layers.NUM_MEMBERS",
						animParams	= UI.EffectAnimParams.ALL
					},
					--[[{
						objName		= "text_loyalty",
						layer		= "UI.ClansMyClan_Wnd.layers.GRANTS_TEXT",
						animParams	= UI.EffectAnimParams.ALL
					},
					{
						objName		= "value_loyalty",
						layer		= "UI.ClansMyClan_Wnd.layers.GRANTS_VALUE",
						animParams	= UI.EffectAnimParams.ALL
					},
					{
						objName		= "icon_loyalty",
						layer		= "UI.ClansMyClan_Wnd.layers.GRANTS_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.ALL
					},]]
				}
			}}
		},
		-- NUM_MEMBERS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- GRANTS_TEXT
		--[[{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- GRANTS_VALUE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- GRANTS_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_priceIco",
				defaultAnimation	= "loloyalty_garant",
			}}
		},]]
	},
	children = { "UI.ClansMyClan_ListWnd", "UI.ClansMyClan_InviteBtn", 
		"UI.ClansChangeName_ChangeNameBtn", "UI.ClansChangeName_ChangeTagBtn", "UI.ClansChangeName_ChangeEmblemBtn",
		"UI.ClansChangeName_ChangeMotdBtn", "UI.ClansChangeName_ChangeFindDescBtn", "UI.ClansMain_RecruitingCheckBox", "UI.ClansMyClan_ExpandBtn" }
}

UI.ClansMyClan_Wnd.layers = 
{
	MAIN_EFFECT 		= 0,
	NUM_MEMBERS			= 1,
	--[[GRANTS_TEXT			= 4,
	GRANTS_VALUE		= 5,
	GRANTS_ICO_EFFECT	= 6,]]
}


--
function UI.ClansMyClan_Wnd:MasterServer_OnClanJoinReqAccept( result, requestId )

	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text = UI:GetStringByName( "clans_error_accept_recruit" )
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end

end

--
function UI.ClansMyClan_Wnd:MasterServer_OnClanJoinReqGetPlayers( result, requestId )
	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text = UI:GetStringByName( "clans_error_get_recruiters" )
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end
end

--
function UI.ClansMyClan_Wnd:MasterServer_OnClanChangeRecruiting( result, requestId )
	if result ~= MasterServer.ClanOpResult.CLR_OK then
		local text = UI:GetStringByName( "clans_error_recruiting_to_clan" )
		local errorCode = UI:Val2Key( MasterServer.ClanOpResult, result )
		reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end
end



--
function UI.ClansMyClan_Wnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if field == MasterServer.UserProfileField.UPF_GENERAL_STATS then
	
		for recordIdx = 1, UI.ClansMyClan_ListWnd:GetNumRecords() do
		
			local data = UI.ClansMyClan_ListWnd:GetRecordData( recordIdx )
			
			if data.uid == uid then
			
				local profile = _G.MasterServer_UserProfileGet( uid )
				local generalStats = profile and profile.generalStats
				local militaryRank = generalStats and generalStats[ _G.MasterServer.UserProfileGeneralStat.UPGS_MILITARY_RANK ] or UI.INVALID_U64_ID
				
				if militaryRank ~= data.militaryRank then
				
					if UI.ClansMyClan_ListWnd:GetSortType() == UI.ClansMyClan_ListWnd.sortType.MILITARY_RANK then
			
						local scrollPos = UI.ClansMyClan_ListWnd:GetScrollPos()
					
						UI.ClansMyClan_ListWnd:Resort()
						
						if scrollPos ~= -1 then
							UI.ClansMyClan_ListWnd:SetScrollPos( scrollPos )
						end
						
					else
			
						data.militaryRank = militaryRank
						UI.ClansMyClan_ListWnd:SetRecordData( data, recordIdx )
						
					end
					
				end
				
				break
				
			end
		
		end

	end

end


--
function UI.ClansMyClan_Wnd:UpdateTokens()
	UI.ClansMyClan_RaceWnd:UpdateTokens()
end

--
function UI.ClansMyClan_Wnd:Update()
	self:RemoveChild( UI.ClansChangeName_ChangeNameBtn )
	self:RemoveChild( UI.ClansChangeName_ChangeTagBtn )
	self:RemoveChild( UI.ClansChangeName_ChangeEmblemBtn )
	self:RemoveChild( UI.ClansChangeName_ChangeMotdBtn )
	self:RemoveChild( UI.ClansChangeName_ChangeFindDescBtn )
	self:RemoveChild( UI.ClansMyClan_ExpandBtn )
	UI.ClansMain_RecruitingCheckBox:UnlinkFromParent()

	--self:SetLayerVisible( true, self.layers.GRANTS_ICO_EFFECT )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local nextActionLocatorIdx = 1
	local bHasExpandPrivilege = false

	local actions = _G.MasterServer_ClanGetActionPrivileges( _G.MasterServer_GetLocalUserId() )
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_CHANGE_NAME then
			UI:AddChildAndLink( self, UI.ClansChangeName_ChangeNameBtn, mainEffect, string.format( "btn_2_%d", nextActionLocatorIdx ), UI.EffectAnimParams.POS )
			nextActionLocatorIdx = nextActionLocatorIdx + 1
			break
		end
	end
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_CHANGE_TAG then
			UI:AddChildAndLink( self, UI.ClansChangeName_ChangeTagBtn, mainEffect, string.format( "btn_2_%d", nextActionLocatorIdx ), UI.EffectAnimParams.POS )
			nextActionLocatorIdx = nextActionLocatorIdx + 1
			break
		end
	end
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_ASSIGN_EMBLEM then
			UI:AddChildAndLink( self, UI.ClansChangeName_ChangeEmblemBtn, mainEffect, string.format( "btn_2_%d", nextActionLocatorIdx ), UI.EffectAnimParams.POS )
			nextActionLocatorIdx = nextActionLocatorIdx + 1
			break
		end
	end
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_CHANGE_MOTD then
			UI:AddChildAndLink( self, UI.ClansChangeName_ChangeMotdBtn, mainEffect, string.format( "btn_2_%d", nextActionLocatorIdx ), UI.EffectAnimParams.POS )
			nextActionLocatorIdx = nextActionLocatorIdx + 1
			break
		end
	end
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_CHANGE_DESC then
			UI:AddChildAndLink( self, UI.ClansChangeName_ChangeFindDescBtn, mainEffect, string.format( "btn_2_%d", nextActionLocatorIdx ), UI.EffectAnimParams.POS )
			nextActionLocatorIdx = nextActionLocatorIdx + 1
			break
		end
	end

	for i = 1, #actions do

		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_UPGRADE then

			if not UI.Clan:IsMaxExpandReached( MasterServer.ClanUpgrades.CU_CAPACITY ) then

    			UI:AddChildAndLink( self, UI.ClansMyClan_ExpandBtn, mainEffect, string.format( "btn_2_%d", nextActionLocatorIdx ), UI.EffectAnimParams.POS )
    			nextActionLocatorIdx = nextActionLocatorIdx + 1

			end

			bHasExpandPrivilege = true
    		break

		end
	end

	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_CHANGE_RECRUITING then
			UI:AddChildAndLink( self, UI.ClansMain_RecruitingCheckBox, mainEffect, "chek_box", UI.EffectAnimParams.POS )
			nextActionLocatorIdx = nextActionLocatorIdx + 1
			break
		end
	end

	local curNumMembmers	= UI.Clan:GetMembersCount()
	local maxNumMembers		= UI.Clan:GetMaxCapacity()

	local strNumMembers = UI:GetStringByName( "clan_current_capacity" )
	strNumMembers = string.format( strNumMembers, curNumMembmers, maxNumMembers )

	if bHasExpandPrivilege and UI.Clan:IsMaxExpandReached( MasterServer.ClanUpgrades.CU_CAPACITY ) then
		strNumMembers = string.format( "%s%s", strNumMembers, UI:GetStringByName( "clan_capacity_max" ) )
	end

	self:SetText( strNumMembers, self.layers.NUM_MEMBERS )

	
	local canInvite = false
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_INVITE then
			canInvite = true
			break
		end
	end
	if canInvite then
		UI:AddChildAndLink( self, UI.ClansMyClan_InviteBtn, mainEffect, "btn_1", UI.EffectAnimParams.POS )
	else
		self:RemoveChild( UI.ClansMyClan_InviteBtn )
	end
	UI.ClansMyClan_ListWnd:FullUpdate()

	--[[local grants = UI.Clan:GetResources( MasterServer.ClanResource.CRES_AUCTION_GRANTS )
	local str = UI:GetStringByName( "clans_window_myclan_grants_count" )
	self:SetText( str, self.layers.GRANTS_TEXT )
	self:SetText( UI:U642StrSeparatedBy3( grants ), self.layers.GRANTS_VALUE )]]

	UI.ClansMain_RecruitingCheckBox:Check( UI.Clan:IsRecruiting(), true )
	UI.ClansMyClan_RaceWnd:Show()

end

--
function UI.ClansMyClan_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ClansMyClan_InviteBtn == wnd then
		UI.InviteFriendWnd:Show( UI.InviteFriendWnd.Modes.CLAN )
	elseif UI.ClansMyClan_ExpandBtn == wnd then
		UI.ClansMainWnd:ExtendClan()
	elseif UI.ClansChangeName_ChangeNameBtn == wnd then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.CLAN_RENAME, UI:GetClanName( UI.Clan:GetCid() ) )
	elseif UI.ClansChangeName_ChangeTagBtn == wnd then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.CLAN_RENAME_TAG, UI:GetClanTag( UI.Clan:GetCid() ) )
	elseif UI.ClansChangeName_ChangeEmblemBtn == wnd then
		UI.ClanEmblem_Wnd:Show()
	elseif UI.ClansChangeName_ChangeMotdBtn == wnd then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.CLAN_MESSAGE, UI.Clan:GetMotD() )
	elseif UI.ClansChangeName_ChangeFindDescBtn == wnd then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.FIND_DESC_MESSAGE, UI.Clan:GetFindDesc() )
	end

	return true

end


-- ------------------------------------------------------------------------
-- UI.FriendsList_CrossBtn
-- ------------------------------------------------------------------------

UI.ClansMainWnd_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "ClansMainWnd_CrossBtn"
		}
	}
}

-- -----------------------------------------------------------------
-- UI.ClansMyClan_ListWnd
-- -----------------------------------------------------------------

UI.ClansMyClan_ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClansMyClan_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "ClansMyClan_ListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "clan_rating_list",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "header",
						wnd			= "UI.ClansMyClansHeadTabs_Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "race",
						wnd			= "UI.ClansMyClan_RaceWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.ClansMyClansHeadTabs_Wnd", "UI.ClansMyClan_RaceWnd" }
}


UI.ClansMyClan_ListWnd.REFRESH_PERIOD = 60
UI.ClansMyClan_ListWnd.lastUpdateTime = 0


-- -----------------------------------
-- interface function
-- -----------------------------------


--
function UI.ClansMyClan_ListWnd:Resort()

	local records = {}
	for i = 1, self:GetNumRecords() do
		records[ i ] = self:GetRecordData( i )
	end

	if self:GetSortType() == UI.ClansMyClan_ListWnd.sortType.NAME then
		if self:GetSortDir() == UI.ClansMyClan_ListWnd.sortDir.DOWN then
			UI:SortPlayersListByNickname( records, false )
		else
			UI:SortPlayersListByNickname( records, true )
		end
	end

	if self:GetSortType() == UI.ClansMyClan_ListWnd.sortType.STATUS then
		if self:GetSortDir() == UI.ClansMyClan_ListWnd.sortDir.DOWN then
			UI:SortPlayersListByStatus( records, false )
		else
			UI:SortPlayersListByStatus( records, true )
		end
	end
	
	if self:GetSortType() == UI.ClansMyClan_ListWnd.sortType.MILITARY_RANK then
		if self:GetSortDir() == UI.ClansMyClan_ListWnd.sortDir.DOWN then
			UI:SortPlayersListByMilitaryRank( records, false )
		else
			UI:SortPlayersListByMilitaryRank( records, true )
		end
	end

	for i = 1, self:GetNumRecords() do
		self:SetRecordData( records[ i ], i )
	end

	self.lastUpdateTime = self.REFRESH_PERIOD

end


--
function UI.ClansMyClan_ListWnd:GetSortType()

	return self.currentSortType

end


--
function UI.ClansMyClan_ListWnd:GetSortDir()

	return self.currentSortDir

end


--
function UI.ClansMyClan_ListWnd:SetSortType( sortType )

	if sortType < 0 or sortType >= UI.ClansMyClan_ListWnd.sortType.COUNT then
		sys.log( "UI.ClansMyClan_ListWnd:SetSortType( sortType )[ERROR]: invalid sortType:%d", sortType )
		return
	end

	self.currentSortType = sortType
	self:FullUpdate()

end


--
function UI.ClansMyClan_ListWnd:SetSortDir( dir )

	if dir < 0 or dir >= UI.ClansMyClan_ListWnd.sortDir.COUNT then
		sys.log( "UI.ClansMyClan_ListWnd:GetSortDir( dir )[ERROR]: invalid dir:%d", dir )
		return
	end

	self.currentSortDir = dir
	self:FullUpdate()

end

-- обновление данных без полной перезагрузке листа
function UI.ClansMyClan_ListWnd:SoftReloadList()
	for i = 1, self:GetNumRecords() do
		self:SetRecordData(self:GetRecordData( i ), i )
	end
end

--
function UI.ClansMyClan_ListWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self.lastUpdateTime = self.lastUpdateTime - dt_sys
	if self.lastUpdateTime < 0 then
		self.lastUpdateTime = self.REFRESH_PERIOD
		self:SoftReloadList()
	end

end


-- -----------------------------------
-- const
-- -----------------------------------


--
UI.ClansMyClan_ListWnd.sortType = 
{
	NAME			= 0,
	STATUS			= 1,
	EFFICIENT		= 2,
	MILITARY_RANK	= 3,
	COUNT			= 4,
}


--
UI.ClansMyClan_ListWnd.sortDir = 
{
	UP		= 0,
	DOWN	= 1,
	COUNT	= 2,
}



UI.ClansMyClan_ListWnd.btnPrototypeName	= "ClansMyClan_SlotWnd"

UI.ClansMyClan_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}

UI.ClansMyClan_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.ClansMyClan_ListWnd.MAX_SLOTS = 13

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ClansMyClan_ListWnd.currentSortType = UI.ClansMyClan_ListWnd.sortType.NAME
UI.ClansMyClan_ListWnd.currentSortDir = UI.ClansMyClan_ListWnd.sortDir.UP


-- -----------------------------------
-- work functions
-- -----------------------------------


--
function UI.ClansMyClan_ListWnd:Reset()


end


--
function UI.ClansMyClan_ListWnd:FullUpdate()

	self:Reset()
	--self:UpdateFilter()
	self:ReloadCurrentList()
	UI.ClansMyClan_RaceWnd:Show()

end


--
function UI.ClansMyClan_ListWnd:ReloadCurrentList()

	local scrolPos = self:GetScrollPos()

	self:Clear()
	local members = UI.Clan:GetMembers()
	local canSeeRecruits = false

	local actions = _G.MasterServer_ClanGetActionPrivileges( _G.MasterServer_GetLocalUserId() )
	for i = 1, #actions do
		if actions[ i ] == MasterServer.ClanActionPrivileges.CAP_INVITE then
			--UI:AddChildAndLink( self, UI.ClansChangeName_ChangeTagBtn, mainEffect, "btn_4", UI.EffectAnimParams.POS )
			canSeeRecruits = true
			break
		end
	end

	for i = 1, #members do
		if members[ i ].recruit then
			if canSeeRecruits then
				self:AddRecord( members[ i ] )
			end
		else
		
			local data = UI:CopyTable2( members[ i ] )
		
			_G.MasterServer_UserProfileRequestField( data.uid, _G.MasterServer.UserProfileField.UPF_GENERAL_STATS )
			local profile = _G.MasterServer_UserProfileGet( data.uid )
			local generalStats = profile and profile.generalStats
			data.militaryRank = generalStats and generalStats[ _G.MasterServer.UserProfileGeneralStat.UPGS_MILITARY_RANK ] or UI.INVALID_U64_ID
			
			self:AddRecord( data )
			
		end
	end

	if scrolPos and scrolPos ~= -1 then
		self:SetScrollPos( scrolPos, true, false )
	end

	UI.ClansMyClansHeadTabs_Wnd:UpdateSort()
	self:Resort()

end


-- -----------------------------------------------------------------
-- UI.Clans_RaceWnd
-- -----------------------------------------------------------------
--
UI.Clans_RaceWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------
--
UI.Clans_RaceWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "Clans_RaceWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName				= "clan_myclan_race",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "text",
						layer		= "UI.Clans_RaceWnd.layers.CLAN_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "title_2",
						layer		= "UI.Clans_RaceWnd.layers.CLAN_LEADER",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "iridium",
						layer		= "UI.Clans_RaceWnd.layers.IRIDIUM_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- CLAN_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- CLAN_LEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- IRIDIUM_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
	},
}

-- -----------------------------------
-- const
-- -----------------------------------
--
UI.Clans_RaceWnd.layers =
{
    MAIN_EFFECT			= 0,
    CLAN_NAME			= 1,
    CLAN_LEADER			= 2,
	IRIDIUM_TEXT		= 3,
}

--
UI.Clans_RaceWnd.workEffect = 
{
	leaderColor = "title_3",
}


-- ------------------------------
-- work functions
-- ------------------------------
-- -----------------------------------
-- end functions
-- -----------------------------------

UI.Clans_RaceWnd.emblemWnd = nil
UI.Clans_RaceWnd.motDWnd = nil
UI.Clans_RaceWnd.clanTokenDepositBtn = nil
UI.Clans_RaceWnd.iridiumMetatext = nil


--
function UI.Clans_RaceWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self.emblemWnd = UI:CreateChildWnd( self, UI.GameplayMapGalaxyClanOwner, "" )
	self.motDWnd = UI:CreateChildWnd( self, UI.ClansMyClan_MotDWnd, "" )
	self.clanTokenDepositBtn = UI:CreateChildWnd( self, UI.ClanTokenDeposit_Btn, "" )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	UI:AddChildAndLink( self, self.emblemWnd, mainEffect, "clan_ico", UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.motDWnd, mainEffect, "text_2", UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.clanTokenDepositBtn, mainEffect, "btn_41", UI.EffectAnimParams.POS )
	
	self.iridiumMetatext = UI.MetaText.GetNewInstance()
	self.iridiumMetatext:InitFromLayer( self, self.layers.IRIDIUM_TEXT )

end


--
function UI.Clans_RaceWnd:F_Shutdown()

	if self.iridiumMetatext then
		self.iridiumMetatext:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Clans_RaceWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Clans_RaceWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Clans_RaceWnd:UpdateMetaTextPos()

	self.iridiumMetatext:UpdateScreenOrgFromLayer( self, self.layers.IRIDIUM_TEXT )

end


--
function UI.Clans_RaceWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.IRIDIUM_TEXT then
		self.iridiumMetatext:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Clans_RaceWnd:Show()
	self:RemoveStyle( UI.WS_NOT_DRAW )
	self.emblemWnd:SetClan( UI.Clan:GetCid(), self )
	local clanName = UI:GetFullClanName( UI.Clan:GetCid() )
	self:SetText( clanName, self.layers.CLAN_NAME )
	local leader = UI.Clan:GetClanLeader()
	if leader then
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( leader )
		if bCached then
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			local color = UI:Color2Str( mainEffect:GetObjColor( self.workEffect.leaderColor ) )
			self:SetText( UI:GetStringByName( "clans_window_myclan_leader" )..color.." "..nickName, self.layers.CLAN_LEADER )
		else
			self:SetText( UI:GetStringByName( "clans_window_myclan_leader" ), self.layers.CLAN_LEADER )
		end
	else
		self:SetText( UI:GetStringByName( "clans_window_myclan_leader" ), self.layers.CLAN_LEADER )
	end

	if UI.Clan:GetMotD() ~= "" then
		self:AddChild( self.motDWnd )
		self.motDWnd:Update()
	else
		self.motDWnd:UnlinkFromParent()
	end
	
	self:UpdateTokens()
	
	local iridium = UI.Clan:GetResources( MasterServer.ClanResource.CRES_IRIDIUM )
	local max = UI.Clan:GetMaxResourceCount()
	local str = string.format( "%s %s/%s$clan_iridium$", UI:GetStringByName( "clans_window_myclan_iridium_count" ), UI:U642StrSeparatedBy3( iridium ), UI:Num2StrSeparatedBy3( max ) )
	self.iridiumMetatext:SetText( str, true )
	
end


--
function UI.Clans_RaceWnd:UpdateTokens()
	local creditsInfo = UI.serverData.playerCredits
	if ( creditsInfo.tokenCredits or 0 ) > 0 then
		self.clanTokenDepositBtn:RemoveStyle( UI.WS_DISABLE )
	else
		self.clanTokenDepositBtn:AddStyle( UI.WS_DISABLE )
	end
end


--
function UI.Clans_RaceWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == self.clanTokenDepositBtn then
		UI.ClanTokenDeposit_Wnd:Show()
	end

	return true

end

-- -----------------------------------------------------------------
-- UI.ClansMyClan_RaceWnd
-- -----------------------------------------------------------------

UI.ClansMyClan_RaceWnd =
{
	def =
	{
		className 	= "Wnd",
		prototype	= "Clans_RaceWnd",

		props =
		{
			name = "ClansMyClan_RaceWnd",
		},
	}
}


-- -----------------------------------------------------------------
-- UI.ClansMyClan_MotDWnd
-- -----------------------------------------------------------------
--
UI.ClansMyClan_MotDWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------
--
UI.ClansMyClan_MotDWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "ClansMyClan_MotDWnd",
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
				defName				= "clan_myclan_motd",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "text",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "text",
						layer 		= "UI.ClansMyClan_MotDWnd.layers.MESSAGE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- MESSAGE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
   			formatInfoSz	= { 5, 5 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	}
}

UI.ClansMyClan_MotDWnd.layers = 
{
	MAIN_EFFECT				= 0,
	MESSAGE_TEXT			= 1,
}

UI.ClansMyClan_MotDWnd.GetTooltipData = function( self )
	local text = UI.Clan:GetMotD()
	if text ~= "" then
		text = UI:Ut8ValidateLastSymbol( text )
		text = string.gsub( text, "\n" , "|" )
	end
	return 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = text,
			caption = UI:GetStringByName( "tooltip_clan_motd_caption" )
		}
	end

--
function UI.ClansMyClan_MotDWnd:Update()
	local str = UI:GetStringByName( "clan_myclan_motd" )
	local text = UI.Clan:GetMotD()
	if text ~= "" then
		text = UI:Ut8ValidateLastSymbol( text )
		text = string.gsub( text, "\n" , " " )
	end
	str = string.gsub( str, "%$text%$", text )
	local selfRect = self:GetLayerRect( self.layers.MESSAGE_TEXT )
	str = UI:GetCutTextWithEllipses( str, selfRect.z, self:GetFont( self.layers.MESSAGE_TEXT ) )
	--[[local rect = _G.MeasureText(
   		str,
   		self:GetFont( self.layers.MESSAGE_TEXT ),
   		UI:Quat( 0, 0, 10000, 10000 ),
   		self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ) + FONT.TF_NOCLIP,
   		UI:Quat( 0, 0, 10000, 10000 ) )
	if rect.z > selfRect.z then
		local addStr = "..."
		local temp = UI:Quat( 0, 0, 10000, 10000 )
		local lastVisible = _G.GetLastVisibleCharIdForString( str, 0, self:GetFont( self.layers.MESSAGE_TEXT ), selfRect, self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ), selfRect )
		local addWidth = _G.MeasureText( addStr, _G.GetFontSymbolHeight( self:GetFont( self.layers.MESSAGE_TEXT ) ), temp, self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ) + FONT.TF_NOCLIP, temp ).z
		for i = lastVisible, 0, -1 do
			local width = _G.GetSubstringRect( UI:Substr( str, 1, i + 1 ), 0, i, self:GetFont( self.layers.MESSAGE_TEXT ), temp, self:GetTextFormatFlags( self.layers.MESSAGE_TEXT ) + FONT.TF_NOCLIP, temp ).z + addWidth
			if width < selfRect.z then
				local cutText = UI:Substr( str, 1, i + 1 )
				str = cutText..addStr
				break
			end
		end
		self:SetWidth( selfRect.z )
	else
		self:SetWidth( rect.z + 5 )
	end]]
	self:SetText( str, self.layers.MESSAGE_TEXT )
end

-- -----------------------------------------------------------------
-- UI.ClansMyClan_SlotWnd
-- -----------------------------------------------------------------

UI.ClansMyClan_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------


--
UI.ClansMyClan_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "ClansMyClan_SlotWnd",
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
				defName				= "clan_myclan_list_slot",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.ClansMyClan_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "status",
						layer		= "UI.ClansMyClan_SlotWnd.layers.STATUS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					
					{
						objName		= "data6",
						layer		= "UI.ClansMyClan_SlotWnd.layers.MILITARY_RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},

		-- STATUS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "clan_myclan_list_slot_status",
				defaultAnimation    = "offline",

				links =
				{
					{
						objName		= "text_2",
						layer		= "UI.ClansMyClan_SlotWnd.layers.STATUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "on_off",
						layer		= "UI.ClansMyClan_SlotWnd.layers.ON_OFF_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- STATUS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},

		-- ON_OFF_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "friends_list_slot_1_on_off",
				defaultAnimation    = "off",
			}}
		},
		
		-- MILITARY_RANK
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE,
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
UI.ClansMyClan_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
    STATUS_EFFECT		= 2,
    STATUS				= 3,
    ON_OFF_EFFECT		= 4,
	MILITARY_RANK		= 5,
}

--
UI.ClansMyClan_SlotWnd.sounds = 
{
	over = "sound/ui/btnMouseOver",
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClansMyClan_SlotWnd:UpdateForData( data, bAnimated )

	if data.nickname then
		if UI.Clan:IsLeader( data.uid ) then
			self:SetColor( 0xffffdeb3, self.layers.NAME )
			self:SetText( data.nickname.." "..UI:GetStringByName( "clan_leader" ), self.layers.NAME )
		elseif UI.Clan:IsOfficer( data.uid ) then
			self:SetColor( 0xffffffff, self.layers.NAME )
			self:SetText( data.nickname.." "..UI:GetStringByName( "clan_officer" ), self.layers.NAME )
		elseif UI.Clan:IsExecutiveAssistant( data.uid ) then
			self:SetColor( 0xffffffff, self.layers.NAME )
			self:SetText( data.nickname.." "..UI:GetStringByName( "clan_executive_assistant" ), self.layers.NAME )
		else
			self:SetColor( 0xffffffff, self.layers.NAME )
			self:SetText( data.nickname, self.layers.NAME )
		end
	else
		self:SetText( "", self.layers.NAME )
	end

	local effect = UI:GetEffectFromLayer( self, UI.ClansMyClan_SlotWnd.layers.STATUS_EFFECT )
	local onoffEffect = UI:GetEffectFromLayer( self, UI.ClansMyClan_SlotWnd.layers.ON_OFF_EFFECT )
	if data.recruit then
		effect:StartAnimation( "online" )
		self:SetText( "", self.layers.STATUS )
		self:SetLayerVisible( false, UI.ClansMyClan_SlotWnd.layers.ON_OFF_EFFECT )
		local workEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.addBtn, workEffect, "add_btn", UI.EffectAnimParams.POS )
		UI:AddChildAndLink( self, self.ignorBtn, workEffect, "ignor_btn", UI.EffectAnimParams.POS )
	else
		self:SetLayerVisible( true, UI.ClansMyClan_SlotWnd.layers.ON_OFF_EFFECT )
		local str = UI:GetPlayerStatusFullStr( data )
		self:SetText( str, self.layers.STATUS )
		self.addBtn:UnlinkFromParent()
		self.ignorBtn:UnlinkFromParent()
		if data.state == MasterServer.UserState.USER_STATE_OFFLINE or data.state == MasterServer.UserState.USER_STATE_NOT_AVAILABLE then
			effect:StartAnimation( "offline" )
			onoffEffect:StartAnimation( "off" )
		else
			effect:StartAnimation( "online" )
			onoffEffect:StartAnimation( "on" )
		end
	end
	
	if data.militaryRank and not data.recruit then
		local strMilitaryRank = UI:MilitaryRank2Str( data.militaryRank )
		self:SetText( strMilitaryRank, self.layers.MILITARY_RANK )
	else
		self:SetText( "", self.layers.MILITARY_RANK )
	end
	
end


--
function UI.ClansMyClan_SlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	UI.ContextMenu:Clear()

	-- fill context menu
	local data = self:GetRecordData()

	UI.ContextMenu:SetName( data.nickname )

	UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.PLAYER_CLAN, data.uid )
	
	UI.ContextMenu:Show( mouseX, mouseY )
	return true

end


--
function UI.ClansMyClan_SlotWnd:F_OnMouseIn()

	UI:PlayGlobalSound( self.sounds.over )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "over" )
	return true

end


--
function UI.ClansMyClan_SlotWnd:F_OnMouseOut()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "idle" )
	return true

end

--
function UI.ClansMyClan_SlotWnd:F_PostLoad()
	UI.ButtonsList3_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.addBtn		= UI:CreateChildWnd( self, UI.FriendsListSlot2_AddWnd, "" )
	self.addBtn.mode = UI.FriendsListSlot2_AddWnd.Modes.CLAN
	self.ignorBtn	= UI:CreateChildWnd( self, UI.FriendsListSlot2_IgnorWnd, "" )
	self.ignorBtn.mode = UI.FriendsListSlot2_AddWnd.Modes.CLAN
	local workEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
end


-- -----------------------------------------------------------------
-- UI.ClansMyClansHeadTabs_Wnd
-- -----------------------------------------------------------------

UI.ClansMyClansHeadTabs_Wnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClansMyClansHeadTabs_Wnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "ClansMyClansHeadTabs_Wnd",
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
				defName				= "clan_myclan_header",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						wnd			= "UI.ClansMyClanHeadButton_Name",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "data",
						wnd			= "UI.ClansMyClanHeadButton_Status",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "data6",
						wnd			= "UI.ClansMyClanHeadButton_MilitaryRank",
						animParams	= UI.EffectAnimParams.POS,
					},

					--[[{
						objName		= "data_2",
						wnd			= "UI.ClansMyClanHeadButton_Status",
						animParams	= UI.EffectAnimParams.POS,
					},]]
				}
			}}
		},
	},

	children = { "UI.ClansMyClanHeadButton_Name", --[["UI.ClansMyClanHeadButton_Efficient",]] "UI.ClansMyClanHeadButton_Status", "UI.ClansMyClanHeadButton_MilitaryRank" }
}

-- -----------------------------------
-- const
-- -----------------------------------


--
UI.ClansMyClansHeadTabs_Wnd.layers = 
{
	MAIN_EFFECT					= 0,
}

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.ClansMyClansHeadTabs_Wnd:UpdateSort()

	UI.ClansMyClanHeadButton_Name:Update()
	UI.ClansMyClanHeadButton_Status:Update()
	UI.ClansMyClanHeadButton_MilitaryRank:Update()

end


-- -----------------------------------------------------------------
-- UI.MyClanHeadButton_Wnd
-- -----------------------------------------------------------------

UI.MyClanHeadButton_Wnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.MyClanHeadButton_Wnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "MyClanHeadButton_Wnd",
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
				defName				= "clan_rating_list_header_btn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.MyClanHeadButton_Wnd.layers.TEXT_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "arrow",
						layer		= "UI.MyClanHeadButton_Wnd.layers.ARROW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "deselect",
						layer		= "UI.MyClanHeadButton_Wnd.layers.DESELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS--[[ + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND]],
					},

					{
						objName		= "over",
						layer		= "UI.MyClanHeadButton_Wnd.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS--[[ + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BLEND]],
					},
				}
			}}
		},

		-- TEXT_EFFECT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},

		-- ARROW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "friends_list_sort_type",
				defaultAnimation    = "down",
			}}
		},

		-- DESELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "clan_rating_list_header_btn_deselect",
				defaultAnimation    = "idle",
			}}
		},

		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "clan_rating_list_header_btn_over",
				defaultAnimation    = "idle",
			}}
		},
	}
}

-- -----------------------------------
-- const
-- -----------------------------------


--
UI.MyClanHeadButton_Wnd.layers = 
{
	MAIN_EFFECT					= 0,
	TEXT_EFFECT					= 1,
	ARROW_EFFECT				= 2,
	DESELECT_EFFECT				= 3,
	OVER_EFFECT					= 4,
}


--
UI.MyClanHeadButton_Wnd.effectInfo = 
{
	work = 
	{
		min_dist = "dist_min",
		max_dist = "self",
		size_locator = "",
	},
}


--
UI.MyClanHeadButton_Wnd.sounds =
{
	click	= UI.sounds.btnClick,
	over	= "sound/ui/btnMouseOver",
}

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.MyClanHeadButton_Wnd:Update()

	if self.sortType == UI[ self.parentWindow ]:GetSortType() then
		self:SetLayerVisible( true, self.layers.DESELECT_EFFECT )
		self:SetLayerVisible( true, self.layers.ARROW_EFFECT )
		local arrowEffect = UI:GetEffectFromLayer( self, self.layers.ARROW_EFFECT )
		if self.sortDir == UI.ClansMyClan_ListWnd.sortDir.UP then
			arrowEffect:StartAnimation( "up" )
		else
			arrowEffect:StartAnimation( "down" )
		end
	else
		self:SetLayerVisible( false, self.layers.DESELECT_EFFECT )
		self:SetLayerVisible( false, self.layers.ARROW_EFFECT )
	end

end


-- ------------------------------
-- vars
-- ------------------------------

--
UI.MyClanHeadButton_Wnd.parentWindow = "ClansMyClansHeadTabs_Wnd"
UI.MyClanHeadButton_Wnd.parentHeader = "ClansMyClansHeadTabs_Wnd"
UI.MyClanHeadButton_Wnd.sortType = -1
UI.MyClanHeadButton_Wnd.sortDir = UI.ClansMyClan_ListWnd.sortDir.UP

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.MyClanHeadButton_Wnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.MyClanHeadButton_Wnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.MyClanHeadButton_Wnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.MyClanHeadButton_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	UI:PlayGlobalSound( self.sounds.click )

	if self.sortType == UI[ self.parentWindow ]:GetSortType() then
		if self.sortDir == UI.ClansMyClan_ListWnd.sortDir.UP then
			self.sortDir = UI.ClansMyClan_ListWnd.sortDir.DOWN
		else
			self.sortDir = UI.ClansMyClan_ListWnd.sortDir.UP
		end
		UI[ self.parentWindow ]:SetSortDir( self.sortDir )
	else
		UI[ self.parentWindow ]:SetSortType( self.sortType )
		UI[ self.parentWindow ]:SetSortDir( self.sortDir )
	end

	return true

end


--
function UI.MyClanHeadButton_Wnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end

	self:SetText( UI:GetStringByName( self.text ), self.layers.TEXT_EFFECT )

end


--
function UI.MyClanHeadButton_Wnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	UI:PlayGlobalSound( self.sounds.over )
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	return true

end


--
function UI.MyClanHeadButton_Wnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	return true

end


--
function UI.MyClanHeadButton_Wnd:F_OnBeforeShowOnScreen()

	UI.Wnd.OnBeforeShowOnScreen( self )

	self:UpdateEffects()

	local parentEffect = UI:GetEffectFromLayer( UI[ self.parentHeader ], UI.ClansMyClansHeadTabs_Wnd.layers.MAIN_EFFECT )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local deselectEffect = UI:GetEffectFromLayer( self, self.layers.DESELECT_EFFECT )
	local overEffect = UI:GetEffectFromLayer( self, self.layers.OVER_EFFECT )
	local width = parentEffect:GetObjSize( self.effectInfo.work.size_locator ).x
	local pos = parentEffect:GetObjPos( self.effectInfo.work.size_locator ).x
	local minWidth = mainEffect:GetObjSize( self.effectInfo.work.min_dist ).x
	local maxWidth = mainEffect:GetObjSize( self.effectInfo.work.max_dist ).x

	if minWidth > width then 
		width = minWidth
	end

	self:SetWidth( width )
	self:SetLeft( pos )
	local time = ( width - minWidth ) / ( maxWidth - minWidth )
	mainEffect:SetAnimationTime( time )
	mainEffect:Update( 0 )
	deselectEffect:SetAnimationTime( time )
	deselectEffect:Update( 0 )
	overEffect:SetAnimationTime( time )
	overEffect:Update( 0 )

	return true

end


-- -----------------------------------------------------------------
-- UI.ClansMyClanHeadButton_Name, UI.ClansMyClanHeadButton_Status, UI.ClansMyClanHeadButton_MilitaryRank
-- -----------------------------------------------------------------

UI.ClansMyClanHeadButton_Name = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClansMyClanHeadButton_Name.def =
{
	className 	= "Wnd",
	prototype	= "MyClanHeadButton_Wnd",

	props =
	{
		name			= "ClansMyClanHeadButton_Name",
		isPrototype		= false,
	},
}


--
UI.ClansMyClanHeadButton_Name.effectInfo = 
{
	work = 
	{
		min_dist = "dist_min",
		max_dist = "self",
		size_locator = "name",
	},
}

--
UI.ClansMyClanHeadButton_Name.sortType = UI.ClansMyClan_ListWnd.sortType.NAME
UI.ClansMyClanHeadButton_Name.text = "clans_myclan_sort_name"
UI.ClansMyClanHeadButton_Name.parentWindow = "ClansMyClan_ListWnd"

UI.ClansMyClanHeadButton_Status = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClansMyClanHeadButton_Status.def =
{
	className 	= "Wnd",
	prototype	= "MyClanHeadButton_Wnd",

	props =
	{
		name			= "ClansMyClanHeadButton_Status",
		isPrototype		= false,
	},
}


--
UI.ClansMyClanHeadButton_Status.effectInfo = 
{
	work = 
	{
		min_dist = "dist_min",
		max_dist = "self",
		size_locator = "data",
	},
}

UI.ClansMyClanHeadButton_Status.sortType = UI.ClansMyClan_ListWnd.sortType.STATUS
UI.ClansMyClanHeadButton_Status.text = "clans_myclan_sort_status"
UI.ClansMyClanHeadButton_Status.parentWindow = "ClansMyClan_ListWnd"


UI.ClansMyClanHeadButton_MilitaryRank = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClansMyClanHeadButton_MilitaryRank.def =
{
	className 	= "Wnd",
	prototype	= "MyClanHeadButton_Wnd",

	props =
	{
		name			= "ClansMyClanHeadButton_MilitaryRank",
		isPrototype		= false,
	},
}


--
UI.ClansMyClanHeadButton_MilitaryRank.effectInfo = 
{
	work = 
	{
		min_dist = "dist_min",
		max_dist = "self",
		size_locator = "data6",
	},
}

UI.ClansMyClanHeadButton_MilitaryRank.sortType = UI.ClansMyClan_ListWnd.sortType.MILITARY_RANK
UI.ClansMyClanHeadButton_MilitaryRank.text = "clans_myclan_sort_militaryRank"
UI.ClansMyClanHeadButton_MilitaryRank.parentWindow = "ClansMyClan_ListWnd"

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.ClansMyClan_InviteBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ClansMyClan_InviteBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^clans_invite_btn",
   			},
   		}
	},
}

--
UI.ClansChangeName_ChangeNameBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name		= "ClansChangeName_ChangeNameBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
					defName				= "clan_rename_btn",
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
	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "clans_tooltip_rename_name" ),
	},
	GetTooltipData = function( self )
		return self.tooltipData
	end
}


UI.ClansChangeName_ChangeNameBtn.layers = 
{
	MAIN_EFFECT 	= 0,
	TEXT			= 1,
}

--
UI.ClansChangeName_ChangeNameBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
	},
}

--
UI.ClansChangeName_ChangeTagBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name		= "ClansChangeName_ChangeTagBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
					defName				= "clan_rename_tag_btn",
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
	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "clans_tooltip_rename_tag" ),
	},
	GetTooltipData = function( self )
		return self.tooltipData
	end
}

--
UI.ClansChangeName_ChangeTagBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
	},
}

--
UI.ClansChangeName_ChangeEmblemBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name		= "ClansChangeName_ChangeEmblemBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
					defName				= "clan_rename_emblem_btn",
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
	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "clans_tooltip_change_emblem" ),
	},
	GetTooltipData = function( self )
		return self.tooltipData
	end
}

--
UI.ClansChangeName_ChangeEmblemBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
	},
}


--
UI.ClansChangeName_ChangeMotdBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name		= "ClansChangeName_ChangeMotdBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
					defName				= "clan_rename_motd_btn",
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
	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "clans_tooltip_change_motd" ),
	},
	GetTooltipData = function( self )
		return self.tooltipData
	end
}

--
UI.ClansChangeName_ChangeMotdBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
	},
}

--
UI.ClansChangeName_ChangeFindDescBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name		= "ClansChangeName_ChangeFindDescBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
					defName				= "clan_rename_desc_btn",
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
	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "clans_tooltip_change_find_desc" ),
	},
	GetTooltipData = function( self )
		return self.tooltipData
	end
}

--
UI.ClansChangeName_ChangeFindDescBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
	},
}


--
UI.ClansMyClan_ExpandBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name		= "ClansMyClan_ExpandBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
					defName				= "clan_expandBtn",
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
	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "tooltip_clan_expand_text" ),
	},
	GetTooltipData = function( self )
		return self.tooltipData
	end
}

--
UI.ClansMyClan_ExpandBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
	},
}

UI.ClanTokenDeposit_Btn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "MsgBox_Btn",
		
		props =
		{
			name			= "ClanTokenDeposit_Btn",
			isPrototype		= true,
		},

		layers =
		{
			-- TEXT
			{
				id		= UI.MsgBox_Btn.layers.TEXT,
				text	= "^buy_token_exchangeBtn",
			},
		}
	}
}


local l_numBaseCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

--
UI.ClansMain_RecruitingCheckBox =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "GameplayCustom_CheckBoxWnd",
		props =
		{
			name		= "ClansMain_RecruitingCheckBox",
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
    				defName 			= "hangar_autoCheckBox",
    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    					{
    						objName		= "value",	
							layer		= "UI.GameplayCustom_CheckBoxWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
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
       			text 		= "^clans_main_recruiting_text"
    		},
		}
	},
}

--
function UI.ClansMain_RecruitingCheckBox:Check( isChecked, skip )
	if not skip then
		_G.MasterServer_ClanChangeRecruiting( isChecked )
	end
	UI.EffectCheckBoxWnd.Check( self, isChecked )
end

--
function UI.ClansMain_RecruitingCheckBox:GetTooltipData()
	return 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = UI:GetStringByName( "tooltip_clan_recruiting_text" ),
			caption = UI:GetStringByName( "tooltip_clan_recruiting_caption" ),
		}
end

-- ------------------------------------------------------------------------
-- UI.Clan_MsgEditWnd
-- ------------------------------------------------------------------------

UI.Clan_MsgEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditMultilineWnd",

     	props =
     	{
     		name			= "Clan_MsgEditWnd",
			bytesLimit		= 2048,
    	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "clanMessage_msgEdit",
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
}