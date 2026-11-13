-- ----------------------------------------------------------------------------
--
-- Workfile: leaderboardwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.LeaderboardWnd
-- -----------------------------------------------------------------
UI.LeaderboardWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
--
UI.LeaderboardWnd.layers = 
{
	MAIN_EFFECT 				= 0,
	WORK_EFFECT					= 1,
	LEADERBOARD_EFFECT 			= 2,
	CAPTION						= 3,
	POINTS						= 4,
	ACHIEVEMENTS_REWARD_TEXT	= 5,
	LOADING_EFFECT				= 6,
	LOADING_CENTER_EFFECT 		= 7,
}

UI.LeaderboardWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",
	props =
	{
		name			= "LeaderboardWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]],
	},	
	layers =
	{
		firstOverlayLayer = UI.LeaderboardWnd.layers.LOADING_EFFECT,
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
						layer		= "UI.LeaderboardWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		},
		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "leaderboard_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "btn_x",
						wnd			= "UI.Leaderboard_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title",
						layer		= "UI.LeaderboardWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL
					},
					{
						objName		= "list",
						layer		= "UI.LeaderboardWnd.layers.LEADERBOARD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "bookmark_5",
						wnd			= "UI.Leaderboard_TabsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list",
						wnd			= "UI.Profile_MedalsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title8",
						layer		= "UI.LeaderboardWnd.layers.ACHIEVEMENTS_REWARD_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "load_modules",
						layer		= "UI.LeaderboardWnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "load_modules2",
						layer		= "UI.LeaderboardWnd.layers.LOADING_CENTER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "achievpint",
						layer		= "UI.LeaderboardWnd.layers.POINTS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- LEADERBOARD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "clan_members_leaderboard_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "tree",
						wnd			= "UI.Leaderboard_CategoriesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "line_1",
						wnd			= "UI.Leaderboard_MyRatingWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list",
						wnd			= "UI.Leaderboard_PlayersListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list",
						wnd			= "UI.Leaderboard_ClansListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list",
						wnd			= "UI.Leaderboard_DailyListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "tree",
						wnd			= "UI.ProfileAchievements_CategoriesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "list",
						wnd			= "UI.ProfileAchievements_List",
						animParams	= UI.EffectAnimParams.POS,
					},
				},
			}}
		},		
		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
  			font			= { fontName = "VerySmall" },
   			text			= "^leaderboard_window_caption",
		},
		-- POINTS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- ACHIEVEMENTS_REWARD_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text 			= "^profile_achievements_reward"
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
	children =
	{
		"UI.Leaderboard_CrossBtn",
		"UI.Leaderboard_TabsWnd",
		"UI.Leaderboard_CategoriesListWnd",
		"UI.Leaderboard_MyRatingWnd",
		"UI.Leaderboard_PlayersListWnd",
		"UI.Leaderboard_ClansListWnd",
		"UI.Leaderboard_DailyListWnd",
		"UI.ProfileAchievements_CategoriesListWnd",
		"UI.ProfileAchievements_List",
		"UI.Profile_MedalsWnd",
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.LeaderboardWnd:Setup( uid, launchData )

	self.uid = uid
	self.launchData = launchData
	
	if UI.Leaderboard_TabsWnd:GetSelectedRecord() == 1 then
		self:UpdateMode()
	else
		UI.Leaderboard_TabsWnd:SelectRecord( 1 )
	end

end


--
function UI.LeaderboardWnd:ShowArenaLeaderboards( bMajor )
	
	if self.mode ~= "LEADERBOARDS" then
		UI.Leaderboard_TabsWnd:SelectTab( "LEADERBOARDS" )
	end

	if bMajor ~= nil then
		if type( bMajor ) ~= "boolean" then
			sys.log( "UI.LeaderboardWnd:ShowArenaLeaderboards()[ERROR]: invalid type of the 1-st param (\"bMajor\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bMajor ) )
			bMajor = nil
		end
	end

	if bMajor == nil then
		bMajor = false
	end

	local leaderboardName = bMajor and UI.Arena.majorLeaderboardName or UI.Arena.leaderboardName
	
	local bRecordFound = false
	
	for recordIdx = 1, UI.Leaderboard_CategoriesListWnd:GetNumTotalRecords() do
	
		local data = UI.Leaderboard_CategoriesListWnd:GetRecordData( recordIdx )
		if data.categoryInfo and data.categoryInfo.name == leaderboardName then
			
			if data.categoryType == UI.CategoriesListWnd.categoryTypes.MAIN then
				UI.Leaderboard_CategoriesListWnd:SelectMainCategory( data.parentCategoryInfo.name, false, false )
			else
				UI.Leaderboard_CategoriesListWnd:SelectMainCategory( data.parentCategoryInfo.name, false, false )
				UI.Leaderboard_CategoriesListWnd:SelectSubCategory( data.categoryInfo.name, data.parentCategoryInfo.name, false )
			end
			
			bRecordFound = true
			break
			
		end
		
	end
	
	if not bRecordFound then
		sys.log( "UI.LeaderboardWnd:ShowArenaLeaderboards()[ERROR]: cannot find record for leaderbord %s", leaderboardName )
	end

end


--
function UI.LeaderboardWnd:ShowAchievement( achvId, rank )

	if not self:IsOnScreen() then
		sys.log( "UI.LeaderboardWnd:ShowAchievement()[ERROR]: not on screen" )
		return
	end

	UI.Leaderboard_TabsWnd:SelectTab( "ACHIEVEMENTS" )

	if type( achvId ) ~= "number" then
		sys.log( "UI.LeaderboardWnd:ShowAchievement()[ERROR]: invalid type of the parameter #1 (\"achvId\"); \"number\" expected, got \"%s\"", type( achvId ) )
		return
	end
	
	if rank ~= nil then
		if type( rank ) ~= "number" then
			sys.log( "UI.LeaderboardWnd:ShowAchievement()[ERROR]: invalid type of the parameter #2 (\"rank\"); \"number\" or \"nil\" expected, got \"%s\"", type( rank ) )
			rank = nil
		end
	end
	
	if rank == nil then
		rank = -1
	end

	local achInfo = _G.Achievements[ achvId ]
	if not achInfo then
		sys.log( "UI.LeaderboardWnd:ShowAchievement()[ERROR]: cannot find _G.Achievements[%d]", achvId )
		return
	end

	local mainCategory = achInfo.category
	if type( mainCategory ) ~= "string" then
		sys.log( "UI.LeaderboardWnd:ShowAchievement()[ERROR]: invalid type of _G.Achievements[%d].category; \"string\" expected, got \"%s\"", type( mainCategory ) )
		return
	end

	local subCategory = achInfo.subCategory
	if subCategory ~= nil then
    	if type( subCategory ) ~= "string" then
    		sys.log( "UI.LeaderboardWnd:ShowAchievement()[ERROR]: invalid type of _G.Achievements[%d].subCategory; \"string\" or \"nil\" expected, got \"%s\"", type( subCategory ) )
    		return
    	end
	end

	UI.ProfileAchievements_CategoriesListWnd:SelectMainCategory( mainCategory, false, false )

	if subCategory then
		UI.ProfileAchievements_CategoriesListWnd:SelectSubCategory( subCategory, mainCategory, false )
	end

	UI.ProfileAchievements_List:ScrollToAchieve( achvId, rank )

end


--
function UI.LeaderboardWnd:ReloadPoints()

	local strPoints = string.format( "%s: %s/%s", UI:GetStringByName( "achievePoints" ), UI:Num2StrSeparatedBy3( UI.Profile:GetAllPoints() ), UI:Num2StrSeparatedBy3( UI.Profile:GetMaxPoints() ) )
	local strPointsLink = string.format( "$link [type CUSTOM_TEXT] [params {text=\"%s\", tooltipTextId=\"achievePointsPriceTooltip_desc\", tooltipCaptionId=\"achievePointsPriceTooltip_caption\", colorUnsel=%u, colorSel=%u}]$", strPoints, self:GetColor( self.layers.POINTS ), self:GetColor( self.layers.POINTS ) )
	
	self.pointsMetaText:SetText( strPointsLink, true )

end


--
function UI.LeaderboardWnd:HidePoints()

	self:SetLayerVisible( false, self.layers.POINTS )
	self.pointsMetaText:SetText( "", true )

end


--
function UI.LeaderboardWnd:ShowPoints()

	self:SetLayerVisible( true, self.layers.POINTS )

end


--
function UI.LeaderboardWnd:ShowWait( bool )

	if self.mode == "ACHIEVEMENTS" then
		self:SetLayerVisible( bool, self.layers.LOADING_EFFECT )
		self:SetLayerVisible( false, self.layers.LOADING_CENTER_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
		self:SetLayerVisible( bool, self.layers.LOADING_CENTER_EFFECT )
	end

end


--
function UI.LeaderboardWnd:IsWait()

	return self:IsLayerVisible( self.layers.LOADING_EFFECT ) or self:IsLayerVisible( self.layers.LOADING_CENTER_EFFECT )

end


--
function UI.LeaderboardWnd:OnLeaderboardCategorySelect()

	if self:IsOnScreen() and self.mode == "LEADERBOARDS" then
		self:UpdateLeaderboardsList()
	end
	
end


-- -----------------------------------
-- const
-- -----------------------------------
UI.LeaderboardWnd.Modes = 
{
	LEADERBOARDS = 
	{
		name = "LEADERBOARDS",
		text = UI:GetStringByName( "leaderboardtab_leaderboards" )
	},
	
	ACHIEVEMENTS = 
	{
		name = "ACHIEVEMENTS",
		text = UI:GetStringByName( "profile_achievements" )
	},
	
	MEDALS = 
	{
		name = "MEDALS",
		text = UI:GetStringByName( "profile_medals" )
	},
}

UI.LeaderboardWnd.Order = 
{
	"ACHIEVEMENTS",
	"LEADERBOARDS",
	"MEDALS",
}

UI.LeaderboardWnd.sounds =
{
	hide						= "sound/ui/MsgHide",
	itemsScrollRange			= "sound/ui/btnMouseOver",
	tradeWndShow				= "sound/ui/MsgHide",
	clanLeave					= "sound/ui/cancel"
}

-- -----------------------------------
-- vars
-- -----------------------------------
UI.LeaderboardWnd.inited			= false
UI.LeaderboardWnd.mode				= nil
UI.LeaderboardWnd.uid				= UI.INVALID_U64_ID
UI.LeaderboardWnd.launchData		= nil
UI.LeaderboardWnd.dataToSet			= nil
UI.LeaderboardWnd.pointsMetaText	= nil

--
function UI.LeaderboardWnd:ShowError( result )
	--self:StopWait()
	UI.Leaderboard_ClansListWnd:StopWait()
	UI.Leaderboard_PlayersListWnd:StopWait()
	UI.Leaderboard_DailyListWnd:StopWait()
	local str = UI:GetStringByName( "leaderboard_get_error" )
	local reason = UI:GetStringByName( UI:Val2Key( MasterServer.LeaderboardGetResult, result ) )
	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), str.." "..reason, UI.MBS_OK )
end

--
function UI.LeaderboardWnd:UpdateClanWnd()
end

--
function UI.LeaderboardWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )
	
	self.pointsMetaText = UI.MetaText.GetNewInstance()
	self.pointsMetaText:InitFromLayer( self, self.layers.POINTS )
	
	UI.Leaderboard_CategoriesListWnd:UnlinkFromParent()
	UI.ProfileAchievements_CategoriesListWnd:UnlinkFromParent()
	UI.Leaderboard_MyRatingWnd:UnlinkFromParent()
	UI.Leaderboard_ClansListWnd:UnlinkFromParent()
	UI.Leaderboard_DailyListWnd:UnlinkFromParent()
	UI.Leaderboard_PlayersListWnd:UnlinkFromParent()
	UI.ProfileAchievements_List:UnlinkFromParent()
	UI.Profile_MedalsWnd:UnlinkFromParent()
	self:SetLayerVisible( false, self.layers.ACHIEVEMENTS_REWARD_TEXT )
	self:HidePoints()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )

end


--
function UI.LeaderboardWnd:F_Shutdown()

	if self.pointsMetaText then
		self.pointsMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.LeaderboardWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.LeaderboardWnd:UpdateMetaTextPos()

	self.pointsMetaText:UpdateScreenOrgFromLayer( self, self.layers.POINTS )

end


--
function UI.LeaderboardWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.POINTS then
		self.pointsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.LeaderboardWnd:F_OnAfterShowOnScreen()
	if not self.inited then
		for i = 1, #self.Order do
			local v = self.Modes[ self.Order[ i ] ]
			UI.Leaderboard_TabsWnd:AddRecord( v )
		end
		self.inited = true
	end
	self:OnAfterShowOnScreen()
	
	if self.dataToSet then
		self:Setup( self.dataToSet.uid, self.dataToSet.launchData )
		self.dataToSet = nil
	else
		self:Setup( _G.MasterServer_GetLocalUserId(), nil )
	end
	
end


--
function UI.LeaderboardWnd:SetMode( modeName )

	if self.mode == modeName then
		return
	end
	
	self.mode = modeName
	
	self:UpdateMode()

end


--
function UI.LeaderboardWnd:UpdateMode()

	UI.Leaderboard_CategoriesListWnd:UnlinkFromParent()
	UI.ProfileAchievements_CategoriesListWnd:UnlinkFromParent()
	UI.Leaderboard_MyRatingWnd:UnlinkFromParent()
	UI.Leaderboard_ClansListWnd:UnlinkFromParent()
	UI.Leaderboard_DailyListWnd:UnlinkFromParent()
	UI.Leaderboard_PlayersListWnd:UnlinkFromParent()
	UI.ProfileAchievements_List:UnlinkFromParent()
	UI.Profile_MedalsWnd:UnlinkFromParent()
	self:SetLayerVisible( false, self.layers.ACHIEVEMENTS_REWARD_TEXT )
	self:HidePoints()
	self:ShowWait( false )

	if self.mode == "LEADERBOARDS" then
	
		self:AddChild( UI.Leaderboard_CategoriesListWnd )
		self:UpdateLeaderboardsList()
		
	elseif self.mode == "ACHIEVEMENTS" then

		self.pointsMetaText:SetText( "", true )
		self:ShowPoints()
		self:SetLayerVisible( true, self.layers.ACHIEVEMENTS_REWARD_TEXT )
		
		self:AddChild( UI.ProfileAchievements_CategoriesListWnd )
		UI.ProfileAchievements_CategoriesListWnd:Update( self.uid )
		self:AddChild( UI.ProfileAchievements_List )
	
	elseif self.mode == "MEDALS" then
		
		self:AddChild( UI.Profile_MedalsWnd )
		UI.Profile_MedalsWnd:Update( self.uid )

	end
	
end


--
function UI.LeaderboardWnd:UpdateLeaderboardsList()

	if self.mode ~= "LEADERBOARDS" then
		sys.log( "UI.LeaderboardWnd:UpdateLeaderboardsList()[ERROR]: not in 'LEADERBOARDS' mode" )
		return
	end
	
	UI.Leaderboard_MyRatingWnd:UnlinkFromParent()
	UI.Leaderboard_ClansListWnd:UnlinkFromParent()
	UI.Leaderboard_DailyListWnd:UnlinkFromParent()
	UI.Leaderboard_PlayersListWnd:UnlinkFromParent()
	
	local listWnd = nil
	local listMode = -1
	
	local selCategoryData = nil	
		
	local mainRecordIdx = UI.Leaderboard_CategoriesListWnd:GetSelectedMainCategoryRecord()
	if mainRecordIdx ~= -1 then
		local mainData = UI.Leaderboard_CategoriesListWnd:GetRecordData( mainRecordIdx )
		if mainData.hasSubCategories then
			local subRecordIdx = UI.Leaderboard_CategoriesListWnd:GetSelectedSubCategoryRecord()
			if subRecordIdx ~= -1 then
				local subData = UI.Leaderboard_CategoriesListWnd:GetRecordData( subRecordIdx )
				selCategoryData = subData
			end
		else
			selCategoryData = mainData
		end
	end
	
	if selCategoryData then
	
		if selCategoryData.entityType == _G.MasterServer.LeaderboardEntityType.LET_PLAYER or selCategoryData.entityType == _G.MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM or selCategoryData.entityType == _G.MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
		
			listWnd = selCategoryData.bReward and UI.Leaderboard_DailyListWnd or UI.Leaderboard_PlayersListWnd
			listMode = UI.LeaderboardList.Modes.USERS
		
		elseif selCategoryData.entityType == _G.MasterServer.LeaderboardEntityType.LET_CLAN then
		
			listWnd = UI.Leaderboard_ClansListWnd
			listMode = UI.LeaderboardList.Modes.CLANS
			
		else
			sys.log( "UI.LeaderboardWnd:UpdateLeaderboardsList()[ERROR]: unhandled entityType %s", tostring( selCategoryData.entityType ) )
		end
		
	end
	
	if listWnd then
	
		self:AddChild( listWnd )
		
		local oldUid = listWnd:GetUid()
		listWnd:SetUid( self.uid )
		if oldUid == self.uid then
			listWnd:FullUpdate( true )	-- если не вызвать руками, то не проапдейтится, если uid не поменялся
		end
		
		self:AddChild( UI.Leaderboard_MyRatingWnd )
		UI.Leaderboard_MyRatingWnd.mode = listMode
		
	end
	
end


--
function  UI.LeaderboardWnd:GetMode()
	return self.mode
end

--
function UI.LeaderboardWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd == UI.Leaderboard_CrossBtn then
		self:Close()
	end
	return true
end


--
function UI.LeaderboardWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then

		UI.store.LeaderboardWnd =
		{
			uid						= self.uid,
			launchData				= self.launchData,
		}
		
	end

end


--
function UI.LeaderboardWnd:F_OnEventRestoreUiState()

	if UI.store.LeaderboardWnd then
	
		if self:IsOnScreen() then
			self:Setup( UI.store.LeaderboardWnd.uid, UI.store.LeaderboardWnd.launchData )
		else
			self.dataToSet =
			{
				uid			= UI.store.LeaderboardWnd.uid,
				launchData	= UI.store.LeaderboardWnd.launchData,
			}
		end

		UI.store.LeaderboardWnd = nil

	end

end


--
function UI.LeaderboardWnd:Close()

	if not self:IsOnScreen() then
		return
	end

	if self.launchData then
	
		local launchData = self.launchData
			
		if launchData.bOldProfile then
			UI:ShowProfile( self.uid, launchData.modeName, true )
		else
			sys.log( "UI.LeaderboardWnd:Close()[ERROR]: unhandled launchData" )
		end
		
	end
	
	if self:GetParent() then
	
		if self:IsChildOf( UI.HangarWnd ) then
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
		else
			self:Hide()
			UI:PlayGlobalSound( UI.HangarWnd.sounds.menuTabSelect )
		end

	end
	
end


--
function UI.LeaderboardWnd:OnEscape()

	self:Close()
	return true

end


-- -----------------------------------------------------------------
-- UI.Leaderboard_TabsWnd
-- -----------------------------------------------------------------
UI.Leaderboard_TabsWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.Leaderboard_TabsWnd.def =
{
	className 	= "Wnd",
	prototype	= "TabsMain",
	props =
	{
		name			= "Leaderboard_TabsWnd",
	},
}
UI.Leaderboard_TabsWnd.parentWindow = UI.LeaderboardWnd
UI.Leaderboard_TabsWnd.MAX_SLOTS = 5

-- ------------------------------------------------------------------------
-- UI.Leaderboard_CrossBtn
-- ------------------------------------------------------------------------
UI.Leaderboard_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",
		props =
		{
			name	= "Leaderboard_CrossBtn"
		}
	}
}


-- ------------------------------
-- UI.Leaderboard_CategoriesListWnd
-- ------------------------------
UI.Leaderboard_CategoriesListWnd = {}
UI.Leaderboard_CategoriesListWnd.def =
{
	className	= "Wnd",
	prototype 	= "CategoriesListWnd",
	props =
	{
		name	= "Leaderboard_CategoriesListWnd",
	},
}

UI.Leaderboard_CategoriesListWnd.categories = "PlayerLeaderboardList"
UI.Leaderboard_CategoriesListWnd.mainWnd = UI.LeaderboardWnd


UI.Leaderboard_MyRatingWnd = {}
UI.Leaderboard_MyRatingWnd.def =
{
	className 	= "Wnd",
	prototype	= "ClansMembersLeaderboardList_SlotWnd",

	props =
	{
		name			= "Leaderboard_MyRatingWnd",
	},
}

UI.Leaderboard_MyRatingWnd.isMyselfLine = true
UI.Leaderboard_MyRatingWnd.mode = UI.LeaderboardList.Modes.USERS


-- -----------------------------------------------------------------
-- UI.Leaderboard_ListWnd
-- -----------------------------------------------------------------
UI.Leaderboard_PlayersListWnd = {}
-- -----------------------------------
-- window definition
-- -----------------------------------
UI.Leaderboard_PlayersListWnd.def =
{
	className 	= "Wnd",
	prototype	= "LeaderboardList",
	props =
	{
		name			= "Leaderboard_PlayersListWnd",
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
				defName				= "leaderboard_list_small",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "header",
						layer		= "UI.Leaderboard_PlayersListWnd.layers.HEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "loading3",
						layer		= "UI.LeaderboardList.layers.LOADING_EFFECT",
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
				defName				= "clan_members_leaderboard_list_header",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "rating",
						layer		= "UI.Leaderboard_PlayersListWnd.layers.PLACE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "name",
						layer		= "UI.Leaderboard_PlayersListWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "data",
						layer		= "UI.Leaderboard_PlayersListWnd.layers.VALUE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
				}
			}}
		},
		-- PLACE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^clans_leaderboard_sort_place"
		},
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^leaderboard_players_sort_name"
		},
		-- VALUE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= ""
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
	children = { "UI.LeaderboardPlayersView_AllBtn", "UI.LeaderboardPlayersView_MeBtn", "UI.LeaderboardPlayersView_FriendsBtn" }
}
UI.Leaderboard_PlayersListWnd.myRatingLine = UI.Leaderboard_MyRatingWnd
UI.Leaderboard_PlayersListWnd.categoriesList = UI.Leaderboard_CategoriesListWnd
UI.Leaderboard_PlayersListWnd.mode = UI.LeaderboardList.Modes.USERS
UI.Leaderboard_PlayersListWnd.MAX_SLOTS = 10
UI.Leaderboard_PlayersListWnd.Views = 
{
	ALL 					= 0,
	ME 						= 1,
	FRIENDS 				= 2,
}


--
function UI.Leaderboard_PlayersListWnd:GetView()
	return self.view
end


--
function UI.Leaderboard_PlayersListWnd:UpdateViewBtns()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local top = mainEffect:GetObjPos( "btn_1_4" ).y
	local right = mainEffect:GetObjPos( "btn_1_4" ).x + mainEffect:GetObjSize( "btn_1_4" ).x
	local space = mainEffect:GetObjPos( "btn_1_4" ).x - ( mainEffect:GetObjPos( "btn_1_3" ).x + mainEffect:GetObjSize( "btn_1_3" ).x )

	if self.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER and self.uid == UI:GetLocalPlayerUid() then

		if not UI.LeaderboardPlayersView_FriendsBtn:IsChildOf( self ) then
			self:AddChild( UI.LeaderboardPlayersView_FriendsBtn )
			UI.LeaderboardPlayersView_FriendsBtn:Update()
		end
    	UI.LeaderboardPlayersView_FriendsBtn:SetTop( top )
    	UI.LeaderboardPlayersView_FriendsBtn:SetLeft( right - UI.LeaderboardPlayersView_FriendsBtn:GetWidth() )
    	right = UI.LeaderboardPlayersView_FriendsBtn:GetLeft() - space

	else
		UI.LeaderboardPlayersView_FriendsBtn:UnlinkFromParent()		
	end

	if not UI.LeaderboardPlayersView_MeBtn:IsChildOf( self ) then
		self:AddChild( UI.LeaderboardPlayersView_MeBtn )
		UI.LeaderboardPlayersView_MeBtn:Update()
	end
	UI.LeaderboardPlayersView_MeBtn:SetTop( top )
	UI.LeaderboardPlayersView_MeBtn:SetLeft( right - UI.LeaderboardPlayersView_MeBtn:GetWidth() )
	right = UI.LeaderboardPlayersView_MeBtn:GetLeft() - space

	if not UI.LeaderboardPlayersView_AllBtn:IsChildOf( self ) then
		self:AddChild( UI.LeaderboardPlayersView_AllBtn )
		UI.LeaderboardPlayersView_AllBtn:Update()
	end
	UI.LeaderboardPlayersView_AllBtn:SetTop( top )
	UI.LeaderboardPlayersView_AllBtn:SetLeft( right - UI.LeaderboardPlayersView_AllBtn:GetWidth() )
	right = UI.LeaderboardPlayersView_AllBtn:GetLeft() - space

end


--
function UI.Leaderboard_PlayersListWnd:SetView( view, skipReload )

	if view == self.Views.FRIENDS and self.entityType ~= MasterServer.LeaderboardEntityType.LET_PLAYER then
		sys.log( "UI.Leaderboard_PlayersListWnd:SetView()[ERROR]: cannot set FRIENDS view for non LET_PLAYER leaderboard" )
		return
	end

	self.view = view
	if UI.LeaderboardPlayersView_AllBtn:IsChildOf( self ) then
		UI.LeaderboardPlayersView_AllBtn:Update()
	end
	if UI.LeaderboardPlayersView_MeBtn:IsChildOf( self ) then
		UI.LeaderboardPlayersView_MeBtn:Update()
	end
	if UI.LeaderboardPlayersView_FriendsBtn:IsChildOf( self ) then
		UI.LeaderboardPlayersView_FriendsBtn:Update()
	end
	if not skipReload then
		self:FullUpdate( true )
	end
end


-- -----------------------------------------------------------------
-- UI.Leaderboard_DailyListWnd
-- -----------------------------------------------------------------
UI.Leaderboard_DailyListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------
UI.Leaderboard_DailyListWnd.def =
{
	className 	= "Wnd",
	prototype	= "LeaderboardList",
	props =
	{
		name			= "Leaderboard_DailyListWnd",
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
				defName				= "leaderboard_list_extra_small",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "header",
						layer		= "UI.Leaderboard_DailyListWnd.layers.HEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "loading3",
						layer		= "UI.Leaderboard_DailyListWnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_1_7",
						layer		= "UI.Leaderboard_DailyListWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
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
				defName				= "clan_members_leaderboard_list_header",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "rating",
						layer		= "UI.Leaderboard_DailyListWnd.layers.PLACE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "name",
						layer		= "UI.Leaderboard_DailyListWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "data",
						layer		= "UI.Leaderboard_DailyListWnd.layers.VALUE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
				}
			}}
		},
		-- PLACE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^clans_leaderboard_sort_place"
		},
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^leaderboard_players_sort_name"
		},
		-- VALUE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= ""
		},
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
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
		}
	},
	children = { "UI.LeaderboardDailyView_AllBtn", "UI.LeaderboardDailyView_MeBtn", "UI.LeaderboardDailyView_FriendsBtn" }
}
UI.Leaderboard_DailyListWnd.myRatingLine = UI.Leaderboard_MyRatingWnd
UI.Leaderboard_DailyListWnd.categoriesList = UI.Leaderboard_CategoriesListWnd
UI.Leaderboard_DailyListWnd.mode = UI.LeaderboardList.Modes.USERS
UI.Leaderboard_DailyListWnd.MAX_SLOTS = 9
UI.Leaderboard_DailyListWnd.metatext = nil
UI.Leaderboard_DailyListWnd.Views = 
{
	ALL 					= 0,
	ME 						= 1,
	FRIENDS 				= 2,
}

UI.Leaderboard_DailyListWnd.layers= 
{
	MAIN_EFFECT 			= 0,
	HEADER_EFFECT			= 1,
	PLACE					= 2,
	NAME					= 3,
	VALUE					= 4,
	TEXT 					= 5,
	LOADING_EFFECT 			= 6,
}


--
function UI.Leaderboard_DailyListWnd:GetView()
	return self.view
end

--
function UI.Leaderboard_DailyListWnd:FullUpdate( reloadLeaderboard )
	UI.LeaderboardList.FullUpdate( self, reloadLeaderboard )
	self.metaText:SetText( UI:GetStringByName( "leaderboard_"..self.currentType.."_reward" ), true )
end

--
function UI.Leaderboard_DailyListWnd:F_PostLoad()
	UI.LeaderboardList.F_PostLoad( self )
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT )
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )
	--self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), self:GetLayerHeight( self.layers.TEXT ) ), true )
	--self.metaText:SetParentWindow( self )
	--self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), self:GetLayerHeight( self.layers.TEXT ) ), true )
end

--
function UI.Leaderboard_DailyListWnd:UpdateViewBtns()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local top = mainEffect:GetObjPos( "btn_1_4" ).y
	local right = mainEffect:GetObjPos( "btn_1_4" ).x + mainEffect:GetObjSize( "btn_1_4" ).x
	local space = mainEffect:GetObjPos( "btn_1_4" ).x - ( mainEffect:GetObjPos( "btn_1_3" ).x + mainEffect:GetObjSize( "btn_1_3" ).x )

	if self.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER and self.uid == UI:GetLocalPlayerUid() then

		if not UI.LeaderboardDailyView_FriendsBtn:IsChildOf( self ) then
			self:AddChild( UI.LeaderboardDailyView_FriendsBtn )
			UI.LeaderboardDailyView_FriendsBtn:Update()
		end
    	UI.LeaderboardDailyView_FriendsBtn:SetTop( top )
    	UI.LeaderboardDailyView_FriendsBtn:SetLeft( right - UI.LeaderboardDailyView_FriendsBtn:GetWidth() )
    	right = UI.LeaderboardDailyView_FriendsBtn:GetLeft() - space

	else
		UI.LeaderboardDailyView_FriendsBtn:UnlinkFromParent()		
	end

	if not UI.LeaderboardDailyView_MeBtn:IsChildOf( self ) then
		self:AddChild( UI.LeaderboardDailyView_MeBtn )
		UI.LeaderboardDailyView_MeBtn:Update()
	end
	UI.LeaderboardDailyView_MeBtn:SetTop( top )
	UI.LeaderboardDailyView_MeBtn:SetLeft( right - UI.LeaderboardDailyView_MeBtn:GetWidth() )
	right = UI.LeaderboardDailyView_MeBtn:GetLeft() - space

	if not UI.LeaderboardDailyView_AllBtn:IsChildOf( self ) then
		self:AddChild( UI.LeaderboardDailyView_AllBtn )
		UI.LeaderboardDailyView_AllBtn:Update()
	end
	UI.LeaderboardDailyView_AllBtn:SetTop( top )
	UI.LeaderboardDailyView_AllBtn:SetLeft( right - UI.LeaderboardDailyView_AllBtn:GetWidth() )
	right = UI.LeaderboardDailyView_AllBtn:GetLeft() - space

end


--
function UI.Leaderboard_DailyListWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.Leaderboard_DailyListWnd:UpdateMetaTextPos()
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )
end

--
function UI.Leaderboard_DailyListWnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.Leaderboard_DailyListWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end

--
function UI.Leaderboard_DailyListWnd:SetView( view, skipReload )

	if view == self.Views.FRIENDS and self.entityType ~= MasterServer.LeaderboardEntityType.LET_PLAYER then
		sys.log( "UI.Leaderboard_DailyListWnd:SetView()[ERROR]: cannot set FRIENDS view for non LET_PLAYER leaderboard" )
		return
	end

	self.view = view
	if UI.LeaderboardDailyView_AllBtn:IsChildOf( self ) then
		UI.LeaderboardDailyView_AllBtn:Update()
	end
	if UI.LeaderboardDailyView_MeBtn:IsChildOf( self ) then
		UI.LeaderboardDailyView_MeBtn:Update()
	end
	if UI.LeaderboardDailyView_FriendsBtn:IsChildOf( self ) then
		UI.LeaderboardDailyView_FriendsBtn:Update()
	end
	if not skipReload then
		self:FullUpdate( true )
	end
end

-- ------------------------------------------------------------------------
-- UI.LeaderboardPlayersView_Btn
-- ------------------------------------------------------------------------
UI.LeaderboardPlayersView_Btn = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------
UI.LeaderboardPlayersView_Btn.def =
{
	className 	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",
	props =
	{
		name		= "LeaderboardPlayersView_Btn",
		isPrototype	= true,
		selectSound	= UI.sounds.btnMouseOver,
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
				defName				= "vote_radiobox_slot",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "value",
						layer		= "UI.LeaderboardPlayersView_Btn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
				}
			}}
		},
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	}
}

--
UI.LeaderboardPlayersView_Btn.layers = 
{
	MAIN_EFFECT 				= 0,
	TEXT 						= 1,
}

UI.LeaderboardPlayersView_Btn.view = nil

UI.EffectCheckBoxWnd.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle_over",
		animationPressed	= "",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "chek",
		animationSelect		= "chek_over",
		animationPressed	= "",
		animationDisabled	= "disable_chek",
	},
}


--
function UI.LeaderboardPlayersView_Btn:F_PostLoad()
	UI.ButtonWnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self:SetText( UI:GetStringByName( "leaderboard_player_view_"..UI:Val2Key( self:GetParent().Views, self.view ) ), self.layers.TEXT )
	local rect = _G.MeasureText(
   		UI:GetStringByName( "leaderboard_player_view_"..UI:Val2Key( self:GetParent().Views, self.view ) ),
   		self:GetFont( self.layers.TEXT ),
   		UI:Quat( 0, 0, 10000, 10000 ),
   		self:GetTextFormatFlags( self.layers.TEXT ) + FONT.TF_NOCLIP,
   		UI:Quat( 0, 0, 10000, 10000 ) )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local height = mainEffect:GetObjSize( "self" ).y
	self:SetHeight( height )
	local width = mainEffect:GetObjPos( "value" ).x
	self:SetWidth( width + rect.z )
end

--
function UI.LeaderboardPlayersView_Btn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if not self:IsChecked() then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:GetParent():SetView( self.view )
	end
	return true
end

--
function UI.LeaderboardPlayersView_Btn:Update()
	if self:GetParent():GetView() == self.view then
		self:Check( true )
	else
		self:Check( false )
	end
end

-- ------------------------------------------------------------------------
-- UI.LeaderboardPlayersView_AllBtn, UI.LeaderboardPlayersView_MeBtn, UI.LeaderboardPlayersView_FriendsBtn
-- ------------------------------------------------------------------------
UI.LeaderboardPlayersView_AllBtn = {}
UI.LeaderboardPlayersView_AllBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "LeaderboardPlayersView_Btn",
	props =
	{
		name		= "LeaderboardPlayersView_AllBtn",
	},
}
UI.LeaderboardPlayersView_AllBtn.view = UI.Leaderboard_PlayersListWnd.Views.ALL

UI.LeaderboardPlayersView_MeBtn = {}
UI.LeaderboardPlayersView_MeBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "LeaderboardPlayersView_Btn",
	props =
	{
		name		= "LeaderboardPlayersView_MeBtn",
	},
}
UI.LeaderboardPlayersView_MeBtn.view = UI.Leaderboard_PlayersListWnd.Views.ME

UI.LeaderboardPlayersView_FriendsBtn = {}
UI.LeaderboardPlayersView_FriendsBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "LeaderboardPlayersView_Btn",
	props =
	{
		name		= "LeaderboardPlayersView_FriendsBtn",
	},
}
UI.LeaderboardPlayersView_FriendsBtn.view = UI.Leaderboard_PlayersListWnd.Views.FRIENDS


-- ------------------------------------------------------------------------
-- UI.LeaderboardDailyView_AllBtn, UI.LeaderboardDailyView_MeBtn, UI.LeaderboardDailyView_FriendsBtn
-- ------------------------------------------------------------------------
UI.LeaderboardDailyView_AllBtn = {}
UI.LeaderboardDailyView_AllBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "LeaderboardPlayersView_Btn",
	props =
	{
		name		= "LeaderboardDailyView_AllBtn",
	},
}
UI.LeaderboardDailyView_AllBtn.view = UI.Leaderboard_PlayersListWnd.Views.ALL

UI.LeaderboardDailyView_MeBtn = {}
UI.LeaderboardDailyView_MeBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "LeaderboardPlayersView_Btn",
	props =
	{
		name		= "LeaderboardDailyView_MeBtn",
	},
}
UI.LeaderboardDailyView_MeBtn.view = UI.Leaderboard_PlayersListWnd.Views.ME

UI.LeaderboardDailyView_FriendsBtn = {}
UI.LeaderboardDailyView_FriendsBtn.def =
{
	className 	= "ButtonWnd",
	prototype	= "LeaderboardPlayersView_Btn",
	props =
	{
		name		= "LeaderboardDailyView_FriendsBtn",
	},
}
UI.LeaderboardDailyView_FriendsBtn.view = UI.Leaderboard_PlayersListWnd.Views.FRIENDS






-- -----------------------------------------------------------------
-- UI.Leaderboard_ClansListWnd
-- -----------------------------------------------------------------
UI.Leaderboard_ClansListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------
UI.Leaderboard_ClansListWnd.def =
{
	className 	= "Wnd",
	prototype	= "LeaderboardList",
	props =
	{
		name			= "Leaderboard_ClansListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
	},	
}
UI.Leaderboard_ClansListWnd.myRatingLine = UI.Leaderboard_MyRatingWnd
UI.Leaderboard_ClansListWnd.categoriesList = UI.Leaderboard_CategoriesListWnd
UI.Leaderboard_ClansListWnd.mode = UI.LeaderboardList.Modes.CLANS