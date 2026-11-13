-- ----------------------------------------------------------------------------
--
-- Workfile: profile_commonwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------
-- UI.Profile_CommonWnd
-- -----------------------------------------------------------------

UI.Profile_CommonWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------


--
UI.Profile_CommonWnd.layers = 
{
	MAIN_EFFECT					= 0,
	PLAYER_NAME					= 1,
	CLAN_NAME					= 2,
	MILITARY_RANK				= 3,
	ACCOUNT_RANK				= 4, 
	PRESTIGE_EFFECT				= 5, 
	PRESTIGE_CAPTION			= 6, 
	PRESTIGE_COMMON_SHIPS_LABEL	= 7, 
	PRESTIGE_MAXED_SHIPS_LABEL	= 8, 
	PRESTIGE_PREMIUM_SHIPS_LABEL= 9, 
	PRESTIGE_VAL_LABEL 			= 10,
	PRESTIGE_VAL				= 11,
	PRESTIGE_PLACE_LABEL 		= 12,
	PRESTIGE_PLACE_VAL 			= 13,
	PRESTIGE_RAITING_LABEL		= 14,
	PRESTIGE_RAITING_VAL        = 15,
	RANK_STATS_EFFECT			= 16, 
	RANK_STATS_CAPTION			= 17,
}


UI.Profile_CommonWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "Profile_CommonWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
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
				defName				= "profile_common_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "slot_1",
						wnd			= "UI.Profile_CommonStatisticSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "liga_slot",
						wnd			= "UI.Profile_FactionStatisticSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "karma",
						wnd			= "UI.Profile_KarmaBarWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_5",
						wnd			= "UI.ProfileCommon_ClearKarmaBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title_1",
						layer		= "UI.Profile_CommonWnd.layers.PLAYER_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
					{
						objName		= "title_4",
						layer		= "UI.Profile_CommonWnd.layers.CLAN_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},
					
					{
						objName		= "title_12",
						layer		= "UI.Profile_CommonWnd.layers.MILITARY_RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT,
					},

           			{
						objName		= "reputacion_1",
						wnd			= "UI.Profile_CommonLikeAllyWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "avatar_icon1",
						wnd			= "UI.ProfileCommon_AvatarWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_7",
						wnd			= "UI.ProfileCommon_ChangeAvatarBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "reputacion_2",
						wnd			= "UI.Profile_CommonLikeEnemyWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

           			{
           				objName		= "prestige_slot",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
           			},

           			{
           				objName		= "stat_slot",
						layer		= "UI.Profile_CommonWnd.layers.RANK_STATS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
           			},

           			{
           				objName		= "title_11",
						layer		= "UI.Profile_CommonWnd.layers.ACCOUNT_RANK",
						animParams	= UI.EffectAnimParams.ALL,
           			},			
				}
			}}
		},
		-- PLAYER_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Medium" },
   			text			= "",
		},
		-- CLAN_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^profile_stat_clan_caption",
		},
		-- MILITARY_RANK
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
		-- ACCOUNT_RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},

		-- PRESTIGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "profile_common_prestige",
				defaultAnimation    = "idle",

				links =
				{
           			{
           				objName		= "title11",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "tiltle_prog_1",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_COMMON_SHIPS_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "tiltle_prog_2",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_MAXED_SHIPS_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "tiltle_prog_3",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_PREMIUM_SHIPS_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "prestige_title",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_VAL_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "prestige_title2",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "prestige_position",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_PLACE_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "prestige_position1",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_PLACE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "rating_title",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_RAITING_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "rating_vol",
						layer		= "UI.Profile_CommonWnd.layers.PRESTIGE_RAITING_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

					{
						objName		= "prestige_ico",
						wnd			= "UI.ProfilePrestige_IcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "prog_slot_1",
						wnd			= "UI.ProfilePrestige_BoughtShipsPb",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "prog_slot_2",
						wnd			= "UI.ProfilePrestige_MaxedShipsPb",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "prog_slot_3",
						wnd			= "UI.ProfilePrestige_PremiumShipsPb",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PRESTIGE_CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "profile_common_prestige_caption" ),
		},

		-- PRESTIGE_COMMON_SHIPS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "prestigeParam_COMMON_SHIPS" ),
		},

		-- PRESTIGE_MAXED_SHIPS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "prestigeParam_MAXED_SHIPS" ),
		},

		-- PRESTIGE_PREMIUM_SHIPS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "prestigeParam_PREMIUM_SHIPS" ),
		},

		-- PRESTIGE_VAL_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= "^profile_common_prestige"
		},

		-- PRESTIGE_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRESTIGE_PLACE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "prestigeTooltip_leaderboards" ),
		},

		-- PRESTIGE_PLACE_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRESTIGE_RAITING_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "profile_stat_kill_ration" ),
		},

		-- PRESTIGE_RAITING_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- RANK_STATS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "profile_common_rankStats",
				defaultAnimation    = "idle",

				links =
				{
           			{
           				objName		= "title",
						layer		= "UI.Profile_CommonWnd.layers.RANK_STATS_CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "drop_down",
						wnd			= "UI.ProfileCommon_RankStatsComboBox",
						animParams	= UI.EffectAnimParams.POS,
           			},

					{
						objName		= "slot_1",
						wnd			= "UI.Profile_RankStatisticSlot1Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_2",
						wnd			= "UI.Profile_RankStatisticSlot2Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_3",
						wnd			= "UI.Profile_RankStatisticSlot3Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_4",
						wnd			= "UI.Profile_RankStatisticSlot4Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- RANK_STATS_CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "profile_common_rankStats" ),
		},
	},

	children = { "UI.Profile_CommonStatisticSlotWnd", "UI.Profile_FactionStatisticSlotWnd", "UI.Profile_RankStatisticSlot1Wnd", "UI.Profile_RankStatisticSlot2Wnd", "UI.Profile_RankStatisticSlot3Wnd", "UI.Profile_RankStatisticSlot4Wnd",
		"UI.Profile_KarmaBarWnd", "UI.ProfilePrestige_IcoWnd", "UI.ProfilePrestige_BoughtShipsPb", 
		"UI.ProfilePrestige_MaxedShipsPb", "UI.ProfilePrestige_PremiumShipsPb", "UI.ProfileCommon_ClearKarmaBtn", "UI.ProfileCommon_RenameBtn", "UI.Profile_CommonLikeAllyWnd", "UI.Profile_CommonLikeEnemyWnd", 
		"UI.ProfileCommon_AvatarWnd", "UI.ProfileCommon_ChangeAvatarBtn", "UI.ProfileCommon_RankStatsComboBox" }
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.Profile_CommonWnd.effectInfo = 
{
	colorLocator = "title_3",
	prestige =
	{
		prestigeLeaderboardValMaxColorLocator	= "vol_1color_3",
		prestigeLeaderboardValColorLocator		= "text_1_vol_2",
	},
}

-- -----------------------------------
-- vars
-- -----------------------------------


UI.Profile_CommonWnd.descSubstColor		 				= UI.TEXT_SEL_COLOR
UI.Profile_CommonWnd.prestigeLeaderboardValMaxColor		= UI.TEXT_BASE_COLOR
UI.Profile_CommonWnd.prestigeLeaderboardValColor		= UI.TEXT_BASE_COLOR
UI.Profile_CommonWnd.prestigeLeaderboardRequestId		= nil
UI.Profile_CommonWnd.prestigeLeaderboardData			= nil
UI.Profile_CommonWnd.militaryRankMetaText				= nil

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.Profile_CommonWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	UI.ProfilePrestige_IcoWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.ProfilePrestige_BoughtShipsPb:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.ProfilePrestige_MaxedShipsPb:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.ProfilePrestige_PremiumShipsPb:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	if self:IsOnScreen() and not self:IsWait() and self.uid == UI:GetLocalPlayerUid() then
		self:UpdatePrestigeVal()
	end

end


--
function UI.Profile_CommonWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	UI.ProfilePrestige_IcoWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.ProfilePrestige_BoughtShipsPb:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.ProfilePrestige_MaxedShipsPb:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.ProfilePrestige_PremiumShipsPb:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if self:IsOnScreen() and not self:IsWait() and self.uid == UI:GetLocalPlayerUid() then
		self:UpdatePrestigeVal()
	end

end


--
function UI.Profile_CommonWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	UI.ProfilePrestige_IcoWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.ProfilePrestige_BoughtShipsPb:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.ProfilePrestige_MaxedShipsPb:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.ProfilePrestige_PremiumShipsPb:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if self:IsOnScreen() and not self:IsWait() and self.uid == UI:GetLocalPlayerUid() then
		self:UpdatePrestigeVal()
	end

end


--
function UI.Profile_CommonWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	UI.ProfilePrestige_IcoWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.ProfilePrestige_BoughtShipsPb:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.ProfilePrestige_MaxedShipsPb:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.ProfilePrestige_PremiumShipsPb:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if self:IsOnScreen() and not self:IsWait() and self.uid == UI:GetLocalPlayerUid() then
		self:UpdatePrestigeVal()
	end

end


--
function UI.Profile_CommonWnd:GameStore_OnSellVessel( result, requestId, param1, param2 ) 

	UI.ProfilePrestige_IcoWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	UI.ProfilePrestige_BoughtShipsPb:GameStore_OnSellVessel( result, requestId, param1, param2 ) 
	UI.ProfilePrestige_MaxedShipsPb:GameStore_OnSellVessel( result, requestId, param1, param2 ) 
	UI.ProfilePrestige_PremiumShipsPb:GameStore_OnSellVessel( result, requestId, param1, param2 ) 

	if self:IsOnScreen() and not self:IsWait() and self.uid == UI:GetLocalPlayerUid() then
		self:UpdatePrestigeVal()
	end

end

--
function UI.Profile_CommonWnd:OnRequestLeaderboardError( data, result )

	local bWantUpdate = false

	if self.prestigeLeaderboardRequestId == data.internalRequestId then

		bWantUpdate = true

		self.prestigeLeaderboardRequestId = nil

		local str = UI:GetStringByName( "profile_common_presige_get_error" )
		local reason = UI:GetStringByName( UI:Val2Key( MasterServer.LeaderboardGetResult, result ) )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), str..reason, UI.MBS_OK )

	end

	if bWantUpdate then
		self:TryUpdateAllData()
	end

end

--
function UI.Profile_CommonWnd:OnRequestLeaderboard( data )

	local bWantUpdate = false

	if self.prestigeLeaderboardRequestId == data.internalRequestId then

		bWantUpdate = true

		self.prestigeLeaderboardRequestId	= nil
		self.prestigeLeaderboardData		= data

	end

	if bWantUpdate then
		self:TryUpdateAllData()
	end

end

--
function UI.Profile_CommonWnd:MasterServer_OnKarmaReset( result, requestId )
	if result ~= 0 then
		if self:IsOnScreen() then
			local msg = UI:GetStringByName( "msg_karmaResetError" )
			local resultName = UI:Val2Key( _G.GameStore.StoreBuyResult, result )
			local resultStr = UI:GetStringByName( string.format( "buyError_%s", resultName ) )
			msg = string.format( msg, resultStr )
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )
		end
	else
		_G.MasterServer_UserProfileRequestField( _G.MasterServer_GetLocalUserId(), MasterServer.UserProfileField.UPF_GENERAL_STATS )
	end
end

--
function UI.Profile_CommonWnd:MasterServer_OnFactionRepReset( result, requestId )
	if result ~= 0 then
		if self:IsOnScreen() then
			local msg = UI:GetStringByName( "msg_factionRepResetError" )
			local resultName = UI:Val2Key( _G.GameStore.StoreBuyResult, result )
			local resultStr = UI:GetStringByName( string.format( "buyError_%s", resultName ) )
			msg = string.format( msg, resultStr )
			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )
		end
	else
		_G.MasterServer_UserProfileRequestField( _G.MasterServer_GetLocalUserId(), MasterServer.UserProfileField.UPF_GENERAL_STATS )
	end
end

--
function UI.Profile_CommonWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if requestId == self.commonStatRequestId then
		self.commonStatRequestId = nil
		--[[if result ~= 0 then
			-- TODO: error handling
			--self.achievements = {}
		else]]
			--self.achievements = UI.Profile:GetAchievements()

		self:TryUpdateAllData()

		--UI.Profile_Wnd:ShowWait( false )
	elseif requestId == self.clanUidRequestId then
		self.clanUidRequestId = nil
		--[[if result ~= 0 then
			-- TODO: error handling
			--self.achievements = {}
		else]]
			--self.achievements = UI.Profile:GetAchievements()
		self:TryUpdateAllData()
		--UI.Profile_Wnd:ShowWait( false )
	elseif requestId == self.avatarRequestId then
		self.avatarRequestId = nil
		--[[if result ~= 0 then
			-- TODO: error handling
			--self.achievements = {}
		else]]
			--self.achievements = UI.Profile:GetAchievements()
		self:TryUpdateAllData()
	end


	if requestId == self.rankStatRequestId then
		self.rankStatRequestId = nil
	end

	if result == 0 and uid == self.uid and self:IsOnScreen() then

		if field == _G.MasterServer.UserProfileField.UPF_VESSELS_RANK_STATS then

			if self:IsWait() then
				self:TryUpdateAllData()
			else
				self:UpdateRankStats()
			end

		end

	end

end

--
function UI.Profile_CommonWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if requestId == self.clanNameRequestId then
		self.clanNameRequestId = nil
		--[[if result ~= 0 then
			-- TODO: error handling
			--self.achievements = {}
		else]]
			--self.achievements = UI.Profile:GetAchievements()
		self:TryUpdateAllData()
		--UI.Profile_Wnd:ShowWait( false )
	end

end

--
function UI.Profile_CommonWnd:UpdateIfVisible( uid )
	if self:IsOnScreen() and self.uid == uid then
		self:Update( uid )
	end
end


--
function UI.Profile_CommonWnd:Update( uid )

	self:ShowWait( true )

	self.uid = uid

	self:UpdatePlayerStats()
	self:UpdatePlayerNameAndClan()
	self:UpdatePlayerAvatar()

	self.prestigeLeaderboardData		= nil
	self.prestigeLeaderboardRequestId	= nil

	self:UpdatePrestigeLeaderboard()

	self:TryUpdateAllData()

end

--
function UI.Profile_CommonWnd:GetPrestigeLeaderboardData()
	return self.prestigeLeaderboardData
end


--
function UI.Profile_CommonWnd:GetUid()
	return self.uid
end


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Profile_CommonWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	local prestigeEffect = UI:GetEffectFromLayer( self, self.layers.PRESTIGE_EFFECT )
	if prestigeEffect then
		self.prestigeLeaderboardValMaxColor	= prestigeEffect:GetObjColor( self.effectInfo.prestige.prestigeLeaderboardValMaxColorLocator)
		self.prestigeLeaderboardValColor	= prestigeEffect:GetObjColor( self.effectInfo.prestige.prestigeLeaderboardValColorLocator)
	end
	
	self.militaryRankMetaText = UI.MetaText.GetNewInstance()
	self.militaryRankMetaText:InitFromLayer( self, self.layers.MILITARY_RANK )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )

end


--
function UI.Profile_CommonWnd:F_Shutdown()

	if self.militaryRankMetaText then
		self.militaryRankMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Profile_CommonWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Profile_CommonWnd:UpdateMetaTextPos()

	self.militaryRankMetaText:UpdateScreenOrgFromLayer( self, self.layers.MILITARY_RANK )

end


--
function UI.Profile_CommonWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MILITARY_RANK then
		self.militaryRankMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


function UI.Profile_CommonWnd:OnBuyWndResult( result, mode )

	if result == true then
		if mode == UI.ProfileCommon_BuyWnd.modes.KARMA_RESET then
			_G.MasterServer_ResetKarma()
		elseif mode == UI.ProfileCommon_BuyWnd.modes.FACTION_REP_RESET then
			_G.MasterServer_ResetFactionRep()
		end
	end

end


--
function UI.Profile_CommonWnd:UpdateFreeSpaceElements()
	if _G.MasterServer_HasFreeSpaceAccess() then
		self:AddChild( UI.Profile_KarmaBarWnd )

		if cvars.sv_factionRepEnabledTemp ~= 0 then
			UI:AddChildAndLink( self, UI.Profile_FactionStatisticSlotWnd, mainEffect, "liga_slot", UI.EffectAnimParams.POS )
		end

	else
		UI.Profile_FactionStatisticSlotWnd:UnlinkFromParent()
		UI.Profile_KarmaBarWnd:UnlinkFromParent()
	end

	UI.ProfileCommon_ClearKarmaBtn:UnlinkFromParent()
	if self.uid == _G.MasterServer_GetLocalUserId() then
		if _G.MasterServer_HasFreeSpaceAccess() then
			local commonStats = UI.Profile:GetCommonStats()
			if commonStats then
				self:AddChild( UI.ProfileCommon_ClearKarmaBtn )
				UI.ProfileCommon_ClearKarmaBtn:SetGray( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_KARMA ] == 0 )

				if cvars.sv_factionRepEnabledTemp ~= 0 then
					UI:AddChildAndLink( self, UI.Profile_FactionStatisticSlotWnd, mainEffect, "liga_slot", UI.EffectAnimParams.POS )
					
					-- update faction slots
					UI.Profile_FactionStatisticSlotWnd:UpdateAllData()
				end
			end
		end
	end
end

--
function UI.Profile_CommonWnd:ShowWait( bool )

	UI.Profile_Wnd:ShowWait( bool )

	if bool then
		UI.Profile_CommonStatisticSlotWnd:UnlinkFromParent()
		UI.Profile_FactionStatisticSlotWnd:UnlinkFromParent()
		self:SetLayerVisible( false, self.layers.ACCOUNT_RANK )
		self:SetLayerVisible( false, self.layers.PLAYER_NAME )
		self:SetLayerVisible( false, self.layers.CLAN_NAME )
		UI.Profile_KarmaBarWnd:UnlinkFromParent()
		UI.ProfileCommon_ClearKarmaBtn:UnlinkFromParent()
		UI.ProfileCommon_RenameBtn:UnlinkFromParent()
		UI.ProfileCommon_AvatarWnd:UnlinkFromParent()
		UI.ProfileCommon_ChangeAvatarBtn:UnlinkFromParent()
		UI.Profile_CommonLikeAllyWnd:UnlinkFromParent()
		UI.Profile_CommonLikeEnemyWnd:UnlinkFromParent()

		UI.ProfilePrestige_IcoWnd:UnlinkFromParent()
		UI.ProfilePrestige_BoughtShipsPb:UnlinkFromParent()
		UI.ProfilePrestige_MaxedShipsPb:UnlinkFromParent()
		UI.ProfilePrestige_PremiumShipsPb:UnlinkFromParent()
		self:SetLayerVisible( false, self.layers.PRESTIGE_EFFECT )
		self:SetLayerVisible( false, self.layers.PRESTIGE_CAPTION )
		self:SetLayerVisible( false, self.layers.PRESTIGE_COMMON_SHIPS_LABEL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_MAXED_SHIPS_LABEL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_PREMIUM_SHIPS_LABEL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_VAL_LABEL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_VAL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_PLACE_LABEL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_PLACE_VAL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_RAITING_LABEL )
		self:SetLayerVisible( false, self.layers.PRESTIGE_RAITING_VAL )

		self:SetLayerVisible( false, self.layers.RANK_STATS_EFFECT )
		self:SetLayerVisible( false, self.layers.RANK_STATS_CAPTION )
		UI.ProfileCommon_RankStatsComboBox:UnlinkFromParent()
		UI.Profile_RankStatisticSlot1Wnd:UnlinkFromParent()
		UI.Profile_RankStatisticSlot2Wnd:UnlinkFromParent()
		UI.Profile_RankStatisticSlot3Wnd:UnlinkFromParent()
		UI.Profile_RankStatisticSlot4Wnd:UnlinkFromParent()

	else

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, UI.Profile_CommonStatisticSlotWnd, mainEffect, "slot_1", UI.EffectAnimParams.POS )
		self:SetLayerVisible( true, self.layers.ACCOUNT_RANK )
		UI:AddChildAndLink( self, UI.ProfileCommon_AvatarWnd, mainEffect, "avatar_icon1", UI.EffectAnimParams.POS )

		self:AddChild( UI.Profile_CommonLikeAllyWnd )
		self:AddChild( UI.Profile_CommonLikeEnemyWnd )
		UI.Profile_CommonLikeAllyWnd:Update()
		UI.Profile_CommonLikeEnemyWnd:Update()

		UI.Profile_CommonWnd:UpdateFreeSpaceElements()

		if self.uid == _G.MasterServer_GetLocalUserId() then
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			local posY = mainEffect:GetObjPos( "btn_6" ).y
			local endX = mainEffect:GetObjPos( "title_1" ).x + mainEffect:GetObjSize( "title_1" ).x
			local space = mainEffect:GetObjPos( "btn_6" ).x - endX

			local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.uid )
			if not bCached then
				nickName = ""
			end

			local selfRect = self:GetLayerRect( self.layers.PLAYER_NAME )

			nickName = UI:GetCutTextWithEllipses( nickName, selfRect.z, self:GetFont( self.layers.PLAYER_NAME ) )

			local width = _G.MeasureText(
		   		nickName,
		   		self:GetFont( self.layers.PLAYER_NAME ),
		   		UI:Quat( 0, 0, 10000, 10000 ),
		   		self:GetTextFormatFlags( self.layers.PLAYER_NAME ) + FONT.TF_NOCLIP,
		   		UI:Quat( 0, 0, 10000, 10000 ) ).z

			local posX = mainEffect:GetObjPos( "title_1" ).x + width + space
			UI.ProfileCommon_RenameBtn:SetTop( posY )
			UI.ProfileCommon_RenameBtn:SetLeft( posX )
			self:AddChild( UI.ProfileCommon_RenameBtn )
			UI:AddChildAndLink( self, UI.ProfileCommon_ChangeAvatarBtn, mainEffect, "btn_7", UI.EffectAnimParams.POS )
		else
			UI.ProfileCommon_RenameBtn:UnlinkFromParent()
			UI.ProfileCommon_ChangeAvatarBtn:UnlinkFromParent()
		end
		--[[else
			UI.ProfilePrestige_IcoWnd:UnlinkFromParent()
			UI.ProfilePrestige_BoughtShipsPb:UnlinkFromParent()
			UI.ProfilePrestige_MaxedShipsPb:UnlinkFromParent()
			UI.ProfilePrestige_PremiumShipsPb:UnlinkFromParent()
			self:SetLayerVisible( false, self.layers.PRESTIGE_VAL_LABEL )
		end]]
		self:SetLayerVisible( true, self.layers.PLAYER_NAME )
		self:SetLayerVisible( true, self.layers.CLAN_NAME )

		self:AddChild( UI.ProfilePrestige_IcoWnd )
		self:AddChild( UI.ProfilePrestige_BoughtShipsPb )
		self:AddChild( UI.ProfilePrestige_MaxedShipsPb )
		self:AddChild( UI.ProfilePrestige_PremiumShipsPb )
		self:SetLayerVisible( true, self.layers.PRESTIGE_EFFECT )
		self:SetLayerVisible( true, self.layers.PRESTIGE_CAPTION )
		self:SetLayerVisible( true, self.layers.PRESTIGE_COMMON_SHIPS_LABEL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_MAXED_SHIPS_LABEL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_PREMIUM_SHIPS_LABEL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_VAL_LABEL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_VAL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_PLACE_LABEL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_PLACE_VAL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_RAITING_LABEL )
		self:SetLayerVisible( true, self.layers.PRESTIGE_RAITING_VAL )

		self:SetLayerVisible( true, self.layers.RANK_STATS_EFFECT )
		self:SetLayerVisible( true, self.layers.RANK_STATS_CAPTION )
		self:AddChild( UI.ProfileCommon_RankStatsComboBox )
		self:AddChild( UI.Profile_RankStatisticSlot1Wnd )
		self:AddChild( UI.Profile_RankStatisticSlot2Wnd )
		self:AddChild( UI.Profile_RankStatisticSlot3Wnd )
		self:AddChild( UI.Profile_RankStatisticSlot4Wnd )

	end

end


--
function UI.Profile_CommonWnd:IsWait()

	return UI.Profile_Wnd:IsWait()

end


--
function UI.Profile_CommonWnd:UpdatePlayerAvatar()
	local avatarRequestId = UI.Profile:RequestAvatars( self.uid )
	if avatarRequestId then
		self.avatarRequestId = avatarRequestId
	end
end

--
function UI.Profile_CommonWnd:UpdatePrestigeLeaderboard()
	self.prestigeLeaderboardData = nil
	self.prestigeLeaderboardRequestId = UI.Leaderboards:SetNextRequest( self, "player_prestige", nil, nil, true, true, false, { self.uid } )
end


--
function UI.Profile_CommonWnd:UpdatePlayerStats()

	local commonStatRequestId = UI.Profile:RequestCommonStats( self.uid )
	if commonStatRequestId then
		self.commonStatRequestId = commonStatRequestId
	end

	local rankStatRequestId = UI.Profile:RequestRankStats( self.uid )
	if rankStatRequestId then
		self.rankStatRequestId = rankStatRequestId
	end

end

--
function UI.Profile_CommonWnd:UpdatePlayerNameAndClan()

	local nickName, bCached, requestId = _G.MasterServer_GetNickName( self.uid )
	if not bCached then
		nickName = ""
	end

	local selfRect = self:GetLayerRect( self.layers.PLAYER_NAME )
	nickName = UI:GetCutTextWithEllipses( nickName, selfRect.z, self:GetFont( self.layers.PLAYER_NAME ) )

	self:SetText( nickName, self.layers.PLAYER_NAME )

	local clanUidRequestId = UI.Profile:RequestClanId( self.uid )
	if clanUidRequestId then
		self.clanUidRequestId = clanUidRequestId
		return
	end

end

--
function UI.Profile_CommonWnd:TryUpdateAllData()

	if not self:IsOnScreen() then
		return
	end

	if self.prestigeLeaderboardRequestId ~= nil then
		return
	end

	if UI.Profile:IfCommonStatsLoaded( self.uid ) and UI.Profile:IfRankStatsLoaded( self.uid ) and UI.Profile:IfClanIdLoaded( self.uid ) and UI.Profile:IfAvatarsLoaded( self.uid ) then
		if UI.Profile:GetClanId( self.uid ) == UI.INVALID_U64_ID then
			self:ShowWait( false )
			self:UpdateAllData()
		else
			local clanName, bCached, requestId = _G.MasterServer_GetClanName( UI.Profile:GetClanId( self.uid ) )
			if bCached then
				self:ShowWait( false )
				self:UpdateAllData()
			else
				self.clanNameRequestId = requestId
			end
		end
	end

end

--
function UI.Profile_CommonWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ProfileCommon_ClearKarmaBtn == wnd then
		if not UI.ProfileCommon_ClearKarmaBtn:IsGray() then
			UI.ProfileCommon_BuyWnd:Setup( UI.ProfileCommon_BuyWnd.modes.KARMA_RESET )
			UI.ProfileCommon_BuyWnd:Show()
		end
	elseif UI.ProfileCommon_RenameBtn == wnd then
		UI.ClanCreateWnd:Show( UI.ClanCreateWnd.modes.PLAYER_RENAME, UI:GetPlayerNicknameByUid( _G.MasterServer_GetLocalUserId() ) )
	elseif UI.ProfileCommon_ChangeAvatarBtn == wnd then
		UI:PlayGlobalSound( "sound/ui/btnClick" )
		UI.ProfileChangeAvatar_Wnd:Show()
	elseif UI.ProfileCommon_ClearFactionRepBtn == wnd then
		if not UI.ProfileCommon_ClearFactionRepBtn:IsGray() then
			UI.ProfileCommon_BuyWnd:Setup( UI.ProfileCommon_BuyWnd.modes.FACTION_REP_RESET )
			UI.ProfileCommon_BuyWnd:Show()
		end
	end

	return true

end

--
function UI.Profile_CommonWnd:UpdateAvatar( uid )
	if self:IsOnScreen() and uid == self.uid then
		local avatar = UI.Profile:GetCurrentAvatar( self.uid )
		UI.ProfileCommon_AvatarWnd:SetAvatar( avatar )
	end
end


--
function UI.Profile_CommonWnd:UpdateAllData()

	-- updateClanName
	if UI.Profile:GetClanId( self.uid ) == UI.INVALID_U64_ID then
		self:SetText( "", self.layers.CLAN_NAME )
	else
		local nickName, bCached, requestId, tag = _G.MasterServer_GetClanName( UI.Profile:GetClanId( self.uid ) )
		if not bCached then
			nickName = ""
		end

		local color = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ):GetObjColor( self.effectInfo.colorLocator )
		local colorStr = UI:Color2Str( color )
		local commonStr = UI:GetStringByName( "profile_stat_clan_caption" )
		local selfRect = self:GetLayerRect( self.layers.CLAN_NAME )
		local clanName = UI:GetCutTextWithEllipses( commonStr.." "..colorStr..UI:FormatClanName( nickName, tag ), selfRect.z, self:GetFont( self.layers.CLAN_NAME ) )
		self:SetText( clanName, self.layers.CLAN_NAME )
	end

	self:UpdateAvatar( self.uid )

	local commonStats = UI.Profile:GetCommonStats()

	if commonStats then

		-- update first slot
		UI.Profile_CommonStatisticSlotWnd:SetValue( 1, UI:GetStringByName( "profile_stat_first_login" ), 
			UI:DateTime2FullDateTime( _G.MasterServer_ServerTimeToLocalTimeT( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_FIRST_LOGIN ] ) ) )
		UI.Profile_CommonStatisticSlotWnd:SetValue( 2, UI:GetStringByName( "profile_stat_played_time" ), 
			UI:Time2Str43( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_PLAYED_TIME ].l / 1000 + commonStats[ MasterServer.UserProfileGeneralStat.UPGS_PLAYED_TIME ].h / 1000 * 2 ^ 32 ) )
		UI.Profile_CommonStatisticSlotWnd:SetValue( 3, UI:GetStringByName( "profile_stat_battle_time" ), 
			UI:Time2Str43( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_BATTLE_TIME ].l / 1000 + commonStats[ MasterServer.UserProfileGeneralStat.UPGS_BATTLE_TIME ].h / 1000 * 2 ^ 32 ) )
		UI.Profile_CommonStatisticSlotWnd:SetValue( 4, UI:GetStringByName( "profile_stat_max_session_time" ), 
			UI:Time2Str43( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_MAX_SESSION_LENGTH ].l / 1000 + commonStats[ MasterServer.UserProfileGeneralStat.UPGS_MAX_SESSION_LENGTH ].h / 1000 * 2 ^ 32 ) )

		if cvars.sv_factionRepEnabledTemp ~= 0 then
			-- update faction slots
			UI.Profile_FactionStatisticSlotWnd:UpdateAllData()
		end

		local accountRank = commonStats[ _G.MasterServer.UserProfileGeneralStat.UPGS_ACCOUNT_RANK ].l
		local maxAccountRank = UI:GetMaxAccountRank()
		local color = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ):GetObjColor( self.effectInfo.colorLocator )
		local colorStr = UI:Color2Str( color )
		local strAccountRank = string.format( "%s %s%d/%d", UI:GetStringByName( "profile_accountRank" ), colorStr, accountRank, maxAccountRank )
		self:SetText( strAccountRank, self.layers.ACCOUNT_RANK )

		UI.Profile_KarmaBarWnd:Setup( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_KARMA ] )

		--
		UI.ProfilePrestige_IcoWnd:Update()
		UI.ProfilePrestige_BoughtShipsPb:UpdateProgress()
		UI.ProfilePrestige_MaxedShipsPb:UpdateProgress()
		UI.ProfilePrestige_PremiumShipsPb:UpdateProgress()
		self:UpdatePrestigeVal()

		local MIN_PRESTIGE = _G.MasterServer.MIN_PRESTIGE_BONUS_FOR_LEADERBOARD * 100
		local str = ""
		if self.prestigeLeaderboardData and self.prestigeLeaderboardData.records and self.prestigeLeaderboardData.records[ 1 ] then
			if self.prestigeLeaderboardData.records[ 1 ].p == -1 then
				str = UI:GetStringByName( "profile_common_prestige_noLeaderboard" )
				str = string.gsub( str, "%$min_prestige%$", tostring( MIN_PRESTIGE ) )
				self:SetText( str, self.layers.PRESTIGE_PLACE_VAL )
			else
		    	local curVal = self.prestigeLeaderboardData.records[ 1 ].p + 1 or 0
		    	local maxVal = self.prestigeLeaderboardData.maxRecordsCount or 0
		    	local strMaxValColor = UI:Color2Str( self.prestigeLeaderboardValMaxColor )
		    	local strValColor = UI:Color2Str( self.prestigeLeaderboardValColor )
		    	local strCurVal = UI:Num2StrSeparatedBy3( curVal )
		    	local strMaxVal = UI:Num2StrSeparatedBy3( maxVal )
		    	str = string.format( "%s%s%s/%s", strValColor, strCurVal, strMaxValColor, strMaxVal )
		    	self:SetText( str, self.layers.PRESTIGE_PLACE_VAL )
		    end
		else
			str = UI:GetStringByName( "prestigeTooltip_leaderboards_error" )
			self:SetText( str, self.layers.PRESTIGE_PLACE_VAL )
		end

		self:SetText( UI:U642StrSeparatedBy3( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_RATING ] ), self.layers.PRESTIGE_RAITING_VAL )

	end

	self:UpdateRankStats()
	
	-- military rank
	local militaryRankColor = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ):GetObjColor( self.effectInfo.colorLocator )
	local militaryRank = commonStats and commonStats[ MasterServer.UserProfileGeneralStat.UPGS_MILITARY_RANK ].l or 0
	local militaryExp = commonStats and commonStats[ MasterServer.UserProfileGeneralStat.UPGS_MILITARY_EXP ].l or 0
	local strMilitaryRankNameLink = string.format( "$link [type MILITARY_RANK][params {militaryRank=%d, militaryExp=%d, colorSel=%u, colorUnsel=%u}]$", militaryRank, militaryExp, militaryRankColor, militaryRankColor )
	local strMilitaryRank = string.format( "%s %s", UI:GetStringByName( "profile_stat_miltary_rank" ), strMilitaryRankNameLink )
	self.militaryRankMetaText:SetText( strMilitaryRank, true )

end


--
function UI.Profile_CommonWnd:UpdateRankStats()

	local rank = -1

	local selRecordIdx = UI.ProfileCommon_RankStatsComboBox:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		rank = UI.ProfileCommon_RankStatsComboBox:GetRecordData( selRecordIdx ).rank
	end

	local stats = nil

	if rank == -1 then
		stats = UI.Profile:GetCommonStats()
	else
		local allRanksStats = UI.Profile:GetRankStats()
		stats = allRanksStats and allRanksStats[ rank ]
	end

	--  battle stats
	local battle = stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_NUM_BATTLES ] or UI.INVALID_U64_ID
	local victories = stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_NUM_VICTORIES ] or UI.INVALID_U64_ID
	local lose = battle - victories
	local winRation = lose.l > 0 and victories.l / lose.l or victories.l
	UI.Profile_RankStatisticSlot1Wnd:SetValue( 1, UI:GetStringByName( "profile_stat_battles_count" ), 
		UI:U642StrSeparatedBy3( battle ) )
	UI.Profile_RankStatisticSlot1Wnd:SetValue( 2, UI:GetStringByName( "profile_stat_battles_count_pve" ), 
		UI:U642StrSeparatedBy3( stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_NUM_PVE_BATTLES ] or UI.INVALID_U64_ID ) )
	UI.Profile_RankStatisticSlot1Wnd:SetValue( 3, UI:GetStringByName( "profile_stat_victories_count" ), 
		UI:U642StrSeparatedBy3( victories ) )
	UI.Profile_RankStatisticSlot1Wnd:SetValue( 4, UI:GetStringByName( "profile_stat_win_streak" ), 
		UI:U642StrSeparatedBy3( stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_WIN_STREAK ] or UI.INVALID_U64_ID ) )
	UI.Profile_RankStatisticSlot1Wnd:SetValue( 5, UI:GetStringByName( "profile_stat_wl_ration" ), UI:LocalizeFloat( string.format( "%.02f", winRation ) ) )

	-- kill stats
	local totalKilled = stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_NUM_PLAYERS_KILLED ] or UI.INVALID_U64_ID
	UI.Profile_RankStatisticSlot2Wnd:SetValue( 1, UI:GetStringByName( "profile_stat_kill_total" ), 
		UI:U642StrSeparatedBy3( totalKilled ) )
	UI.Profile_RankStatisticSlot2Wnd:SetValue( 2, UI:GetStringByName( "profile_stat_kill_max_per_battle" ), 
		UI:U642StrSeparatedBy3( stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_MAX_PLAYERS_KILLED_IN_ONE_BATTLE ] or UI.INVALID_U64_ID ) )
	local averageKill = battle.l > 0 and totalKilled.l / battle.l or 0
	UI.Profile_RankStatisticSlot2Wnd:SetValue( 3, UI:GetStringByName( "profile_stat_kill_average_per_battle" ), UI:LocalizeFloat( string.format( "%.02f", averageKill ) ) )

	-- help stats
	local totalHellped = stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_NUM_ASSISTS ] or UI.INVALID_U64_ID
	UI.Profile_RankStatisticSlot3Wnd:SetValue( 1, UI:GetStringByName( "profile_stat_help_total" ), 
		UI:U642StrSeparatedBy3( totalHellped ) )
	UI.Profile_RankStatisticSlot3Wnd:SetValue( 2, UI:GetStringByName( "profile_stat_help_max_per_battle" ), 
		UI:U642StrSeparatedBy3( stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_MAX_ASSISTS_IN_ONE_BATTLE ] or UI.INVALID_U64_ID ) )
	local averageHelp = battle.l > 0 and totalHellped.l / battle.l or 0
	UI.Profile_RankStatisticSlot3Wnd:SetValue( 3, UI:GetStringByName( "profile_stat_help_average_per_battle" ), UI:LocalizeFloat( string.format( "%.02f", averageHelp ) ) )

	-- damage/help/capture stats
	UI.Profile_RankStatisticSlot4Wnd:SetValue( 1, UI:GetStringByName( "profile_stat_total_damage" ), 
		UI:U642StrSeparatedBy3( stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_TOTAL_DAMAGE_DONE ] or UI.INVALID_U64_ID ) )
	UI.Profile_RankStatisticSlot4Wnd:SetValue( 2, UI:GetStringByName( "profile_stat_total_heal" ), 
		UI:U642StrSeparatedBy3( stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_TOTAL_HEALING_DONE ] or UI.INVALID_U64_ID ) )
	UI.Profile_RankStatisticSlot4Wnd:SetValue( 3, UI:GetStringByName( "profile_stat_total_capture" ), 
		UI:U642StrSeparatedBy3( stats and stats[ MasterServer.UserProfileGeneralStat.UPGS_VITAL_POINT_DAMAGE_DONE ] or UI.INVALID_U64_ID ) )

end


--
function UI.Profile_CommonWnd:UpdatePrestigeVal()

	local prestige = 0

	if self.uid == UI:GetLocalPlayerUid() then
		prestige = UI:GetPrestige()
	else
    	if self.prestigeLeaderboardData and self.prestigeLeaderboardData.records and self.prestigeLeaderboardData.records[ 1 ] then
    		prestige = math.max( 0, self.prestigeLeaderboardData.records[ 1 ].s or 0 )
    	end
	end

	local str = tostring( prestige )
	self:SetText( str, self.layers.PRESTIGE_VAL )

end


--
function UI.Profile_CommonWnd:InitStatsRankComboBox()

	if UI.ProfileCommon_RankStatsComboBox:GetNumRecords() > 0 then
		return
	end

	local allRanksData =
	{
		rank	= -1,
		text	= UI:GetStringByName( "profile_common_statRanks_allRanks" )
	}
	UI.ProfileCommon_RankStatsComboBox:AddRecord( allRanksData )

	for rank = 1, UI:GetMaxRank() do

		local strRank = string.format( "%s %d", UI:GetStringByName( "ships_rank" ), rank )

		local data =
		{
			rank 	= rank,
			text	= strRank,
		}
		UI.ProfileCommon_RankStatsComboBox:AddRecord( data )

	end

end


--
function UI.Profile_CommonWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:InitStatsRankComboBox()
	UI.ProfileCommon_RankStatsComboBox:SelectRecord( 1 )
	self:UpdateMetaTextPos()

end


--
function UI.Profile_CommonWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.ProfileCommon_RankStatsComboBox:GetUiHandle() then
		self:OnRankStatsChanged()
	end

end     


--
function UI.Profile_CommonWnd:OnRankStatsChanged()

	if self:IsOnScreen() and not self:IsWait() then
		self:UpdateRankStats()
	end

end


-- -----------------------------------------------------------------
-- UI.Profile_StatisticSlotWnd
-- -----------------------------------------------------------------

UI.Profile_StatisticSlotWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Profile_StatisticSlotWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "Profile_StatisticSlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
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
				defName				= "profile_common_slot",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.TITLE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_1",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_1_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_2",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_1_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_3",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_2_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_4",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_2_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_5",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_3_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_6",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_3_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_7",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_4_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_8",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_4_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_9",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_5_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_10",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_5_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_11",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_6_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_12",	
						layer		= "UI.Profile_StatisticSlotWnd.layers.SLOT_6_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- TITLE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },

   			text			= "",
		},

		-- SLOT_1_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_1_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_2_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_2_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_3_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_3_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_4_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_4_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_5_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_5_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_6_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_6_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},
	},
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.Profile_StatisticSlotWnd.layers = 
{
	MAIN_EFFECT 		= 0,
	TITLE				= 1,
	SLOT_1_NAME			= 2,
	SLOT_1_VALUE		= 3,
	SLOT_2_NAME			= 4,
	SLOT_2_VALUE		= 5,
	SLOT_3_NAME			= 6,
	SLOT_3_VALUE		= 7,
	SLOT_4_NAME			= 8,
	SLOT_4_VALUE		= 9,
	SLOT_5_NAME			= 10,
	SLOT_5_VALUE		= 11,
	SLOT_6_NAME			= 12,
	SLOT_6_VALUE		= 13,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Profile_StatisticSlotWnd.title = ""

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.Profile_StatisticSlotWnd:SetValue( slot, str1, str2 )

	self:SetText( str1, self.layers[ "SLOT_"..slot.."_NAME" ] )
	self:SetText( str2, self.layers[ "SLOT_"..slot.."_VALUE" ] )

end


--
function UI.Profile_StatisticSlotWnd:SetTitle( title )

	self:SetText( title, self.layers.TITLE )

end


--
function UI.Profile_StatisticSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:SetText( UI:GetStringByName( self.title ), self.layers.TITLE )

end



-- -----------------------------------------------------------------
-- UI.Profile_CommonStatisticSlotWnd, UI.Profile_RankStatisticSlot1Wnd, UI.Profile_RankStatisticSlot2Wnd, UI.Profile_RankStatisticSlot3Wnd, UI.Profile_RankStatisticSlot4Wnd
-- -----------------------------------------------------------------

--
UI.Profile_CommonStatisticSlotWnd = {}
UI.Profile_CommonStatisticSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "Profile_StatisticSlotWnd",

	props =
	{
		name			= "Profile_CommonStatisticSlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
	},
}
UI.Profile_CommonStatisticSlotWnd.title = "profile_section_chrono_title"

--
UI.Profile_RankStatisticSlot1Wnd = {}
UI.Profile_RankStatisticSlot1Wnd.def =
{
	className 	= "Wnd",
	prototype	= "Profile_StatisticSlotWnd",

	props =
	{
		name			= "Profile_RankStatisticSlot1Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
	},
}
UI.Profile_RankStatisticSlot1Wnd.title = "profile_section_battle_title"

--
UI.Profile_RankStatisticSlot2Wnd = {}
UI.Profile_RankStatisticSlot2Wnd.def =
{
	className 	= "Wnd",
	prototype	= "Profile_StatisticSlotWnd",

	props =
	{
		name			= "Profile_RankStatisticSlot2Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
	},
}
UI.Profile_RankStatisticSlot2Wnd.title = "profile_section_kills_title"

--
UI.Profile_RankStatisticSlot3Wnd = {}
UI.Profile_RankStatisticSlot3Wnd.def =
{
	className 	= "Wnd",
	prototype	= "Profile_StatisticSlotWnd",

	props =
	{
		name			= "Profile_RankStatisticSlot3Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
	},
}
UI.Profile_RankStatisticSlot3Wnd.title = "profile_section_helps_title"

--
UI.Profile_RankStatisticSlot4Wnd = {}
UI.Profile_RankStatisticSlot4Wnd.def =
{
	className 	= "Wnd",
	prototype	= "Profile_StatisticSlotWnd",

	props =
	{
		name			= "Profile_RankStatisticSlot4Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
	},
}
UI.Profile_RankStatisticSlot4Wnd.title = "profile_section_dif_damage"



-- -----------------------------------------------------------------
-- UI.Profile_FactionStatisticSlotWnd
-- -----------------------------------------------------------------

--
UI.Profile_FactionStatisticSlotWnd = {}
--
UI.Profile_FactionStatisticSlotWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "Profile_FactionStatisticSlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
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
				defName				= "profile_common_slot_2",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.TITLE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "reload",
						wnd			= "UI.ProfileCommon_ClearFactionRepBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "value_1",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_1_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_2",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_1_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_3",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_2_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_4",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_2_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_5",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_3_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_6",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_3_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_7",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_4_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_8",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_4_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_9",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_5_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_10",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_5_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_11",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_6_NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_12",	
						layer		= "UI.Profile_FactionStatisticSlotWnd.layers.SLOT_6_VALUE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- TITLE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },

   			text			= "",
		},

		-- SLOT_1_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_1_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_2_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_2_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_3_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_3_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_4_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_4_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_5_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_5_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_6_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},

		-- SLOT_6_VALUE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },

   			text			= "",
		},
	},

	children = { "UI.ProfileCommon_ClearFactionRepBtn" }
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.Profile_FactionStatisticSlotWnd.layers = 
{
	MAIN_EFFECT 		= 0,
	TITLE				= 1,
	SLOT_1_NAME			= 2,
	SLOT_1_VALUE		= 3,
	SLOT_2_NAME			= 4,
	SLOT_2_VALUE		= 5,
	SLOT_3_NAME			= 6,
	SLOT_3_VALUE		= 7,
	SLOT_4_NAME			= 8,
	SLOT_4_VALUE		= 9,
	SLOT_5_NAME			= 10,
	SLOT_5_VALUE		= 11,
	SLOT_6_NAME			= 12,
	SLOT_6_VALUE		= 13,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Profile_FactionStatisticSlotWnd.title	= "profile_section_faction_title"
UI.Profile_FactionStatisticSlotWnd.clearBtn	= nil

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.Profile_FactionStatisticSlotWnd:UpdateAllData()

	local commonStats = UI.Profile:GetCommonStats()
	if commonStats == nil then
		return
	end

	local bDefaultFactionRep = true
	for i = 0, ai.Faction.NUM - 1 do
		local rep = commonStats[ MasterServer.UserProfileGeneralStat.UPGS_FACTION_REP_EMPIRE + i ]

		bDefaultFactionRep = rep == DefaultFactionRep[ i ] and bDefaultFactionRep

		if UI:IsFactionRepVisible( i ,rep ) then
			local strId = string.format( "profile_factionRep_%s", UI:Val2Key( ai.Faction, i ) )
			UI.Profile_FactionStatisticSlotWnd:SetValue( i + 1, UI:GetStringByName( strId ),
				UI:FactionRep2ColoredStr( rep ) )
		end
	end

	UI.Profile_FactionStatisticSlotWnd:SetBtnEnabled( not bDefaultFactionRep )
end

--
function UI.Profile_FactionStatisticSlotWnd:SetValue( slot, str1, str2 )

	self:SetText( str1, self.layers[ "SLOT_"..slot.."_NAME" ] )
	self:SetText( str2, self.layers[ "SLOT_"..slot.."_VALUE" ] )

end


--
function UI.Profile_FactionStatisticSlotWnd:SetBtnEnabled( enabled )

	UI.ProfileCommon_ClearFactionRepBtn:SetGray( not enabled )

end


--
function UI.Profile_FactionStatisticSlotWnd:SetTitle( title )

	self:SetText( title, self.layers.TITLE )

end


--
function UI.Profile_FactionStatisticSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:SetText( UI:GetStringByName( self.title ), self.layers.TITLE )

end

-- -----------------------------------------------------------------
-- UI.Profile_KarmaBarWnd
-- -----------------------------------------------------------------

UI.Profile_KarmaBarWnd = {}
UI.Profile_KarmaBarWnd.def = 
{
	className = "Wnd",
	prototype = "KarmaBarWnd",

	props =
	{
		name			= "Profile_KarmaBarWnd",
	},
}

-- -------------------------------------------------------------------
-- UI.ProfilePrestige_IcoWnd
-- -------------------------------------------------------------------

UI.ProfilePrestige_IcoWnd =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "PrestigeIcoWnd",

    	props =
    	{
    		name	= "ProfilePrestige_IcoWnd",
    		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,	-- добавлен UI.WS_NOT_MOUSE_REACT
    	}
	}
}

--
function UI.ProfilePrestige_IcoWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local prestige = 0
	local leaderboardData = UI.Profile_CommonWnd:GetPrestigeLeaderboardData()
	if leaderboardData and leaderboardData.records and leaderboardData.records[ 1 ] then
		prestige = math.max( 0, leaderboardData.records[ 1 ].s or 0 )
	end
	local hTex = UI:GetPrestigeIco( prestige )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.ProfilePrestige_IcoWnd:UpdateVal()

	local prestige = 0

	if UI.Profile_CommonWnd:GetUid() == UI:GetLocalPlayerUid() then
		prestige = UI:GetPrestige()
	else
    	local leaderboardData = UI.Profile_CommonWnd:GetPrestigeLeaderboardData()
    	if leaderboardData and leaderboardData.records and leaderboardData.records[ 1 ] then
    		prestige = math.max( 0, leaderboardData.records[ 1 ].s or 0 )
    	end
	end

	local str = tostring( prestige )
	self:SetText( str, self.layers.VAL )

end


--
UI.ProfilePrestige_IcoWnd.GetTooltipData = function( self )
		local strPrestige = ""
		local prestige = 0

    	if UI.Profile_CommonWnd:GetUid() == UI:GetLocalPlayerUid() then
    		prestige = UI:GetPrestige()
    	else
    		local leaderboardData = UI.Profile_CommonWnd:GetPrestigeLeaderboardData()
    		if leaderboardData and leaderboardData.records and leaderboardData.records[ 1 ] then
    			prestige = math.max( 0, leaderboardData.records[ 1 ].s or 0 )
    		end
		end

		strPrestige = tostring( prestige )
		local str = UI:GetStringByName( "prestigeTooltip_desc" )
		str = string.gsub( str, "%$val%$", strPrestige )
		return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				text = str,--UI:GetStringByName( "tooltip_profile_prestige_text" ),
				caption = UI:GetStringByName( "tooltip_profile_prestige_caption" ),
			}
	end


-- ---------------------------------------------------------------------------------------------------------
-- UI.ProfilePrestige_BoughtShipsPb, UI.ProfilePrestige_MaxedShipsPb, UI.ProfilePrestige_PremiumShipsPb
-- ---------------------------------------------------------------------------------------------------------

--
UI.ProfilePrestige_BoughtShipsPb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ProfilePrestige_Pb",

		props =
		{
			name	= "ProfilePrestige_BoughtShipsPb",
		}
	},

	paramType = UI.PrestigeParamBarWnd.paramTypes.COMMON_SHIPS,
}


--
UI.ProfilePrestige_MaxedShipsPb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ProfilePrestige_Pb",

		props =
		{
			name	= "ProfilePrestige_MaxedShipsPb",
		}
	},

	paramType = UI.PrestigeParamBarWnd.paramTypes.MAXED_SHIPS,
}


--
UI.ProfilePrestige_PremiumShipsPb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ProfilePrestige_Pb",

		props =
		{
			name	= "ProfilePrestige_PremiumShipsPb",
		}
	},

	paramType = UI.PrestigeParamBarWnd.paramTypes.PREMIUM_SHIPS,
}

--
UI.ProfilePrestige_Pb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PrestigeParamBarWnd",

		props =
		{
			name	= "ProfilePrestige_Pb",
		}
	},

	paramType = UI.PrestigeParamBarWnd.paramTypes.PREMIUM_SHIPS,
}

--
function UI.ProfilePrestige_Pb:UpdateProgress()

	if self.paramType == -1 then
		sys.log( "UI.PrestigeParamBarWnd:UpdateProgress()[ERROR]: not inited" )
		return
	end

	local curVal = 0
	local maxVal = 0

	if UI.Profile_CommonWnd.uid == _G.MasterServer_GetLocalUserId() then
		UI.PrestigeParamBarWnd.UpdateProgress( self )
		return
	end

	local commonStats = UI.Profile:GetCommonStats()

	if self.paramType == self.paramTypes.COMMON_SHIPS then
		
		if commonStats then
			curVal = commonStats[ MasterServer.UserProfileGeneralStat.UPGS_VESSELS_TOTAL ].l - commonStats[ MasterServer.UserProfileGeneralStat.UPGS_VESSELS_PREMIUM ].l
		end
		local allCommonShips = self:GetAllShips( false )
		maxVal = #allCommonShips
	elseif self.paramType == self.paramTypes.MAXED_SHIPS then

		if commonStats then
			curVal = commonStats[ MasterServer.UserProfileGeneralStat.UPGS_VESSELS_AT_MAX_LVL ].l - commonStats[ MasterServer.UserProfileGeneralStat.UPGS_VESSELS_PREMIUM ].l
		end
		local allCommonShips = self:GetAllShips( false )
		maxVal = #allCommonShips		


	elseif self.paramType == self.paramTypes.PREMIUM_SHIPS then

		if commonStats then
			curVal = commonStats[ MasterServer.UserProfileGeneralStat.UPGS_VESSELS_PREMIUM ].l
		end
		local allPremiumShips = self:GetAllShips( true )
		maxVal = #allPremiumShips

	else
		sys.log( "UI.PrestigeParamBarWnd:UpdatePb()[ERROR]: unhandled param type: %s", tostring( self.paramType ) )
	end


	-- текст

	local strCurVal = UI:Num2StrSeparatedBy3( curVal )
	local strMaxVal = UI:Num2StrSeparatedBy3( maxVal )

	self:SetText( strCurVal, self.layers.VAL_CUR )
	self:SetText( strMaxVal, self.layers.VAL_MAX )


	-- прогрессбар

	local animTime = maxVal ~= 0 and curVal / maxVal or 0

	local pbEffect = UI:GetEffectFromLayer( self, self.layers.PB_EFFECT )
	if pbEffect then
		pbEffect:SetAnimationTime( animTime )
		pbEffect:Update( 0 )
	end

end


--
function UI.ProfilePrestige_Pb:UpdateLabel()

	self:SetText( "", self.layers.LABEL )

end


--
UI.ProfileCommon_ClearKarmaBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "ProfileCommon_ClearKarmaBtn",
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
					defName				= "profile_clear_karma",
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
		text		= UI:GetStringByName( "tooltip_profile_clear_karma" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

UI.ProfileCommon_ClearKarmaBtn.effectInfo =
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
UI.ProfileCommon_ClearFactionRepBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "ProfileCommon_ClearFactionRepBtn",
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
					defName				= "profile_clear_faction_rep",
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
		text		= UI:GetStringByName( "tooltip_profile_clear_faction_rep" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

UI.ProfileCommon_ClearFactionRepBtn.effectInfo =
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
UI.Profile_EditBtn = 
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Profile_EditBtn",
			selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
					defName				= "profile_rename_btn",
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

	GetTooltipData = function( self )
		return self.tooltipData
	end
}

UI.Profile_EditBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "",
		animationIdle_focus 	= "",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

UI.Profile_EditBtn.sounds =
{
	over	= UI.sounds.btnMouseOver,
}

--[[function UI.Profile_EditBtn:F_OnMouseIn()
	UI:PlayGlobalSound( self.sounds.over )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "over" )
	return true
end

--
function UI.Profile_EditBtn:F_OnMouseOut()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "idle" )
	return true
end]]


--
UI.ProfileCommon_RenameBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Profile_EditBtn",

		props =
		{
			name		= "ProfileCommon_RenameBtn",
		},
	},

	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "tooltip_profile_rename" ),
	},
}

-- -------------------------------------------------------------------
-- UI.ProfileCommon_BuyWnd
-- -------------------------------------------------------------------

UI.ProfileCommon_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "ProfileCommon_BuyWnd",
    	},
	},

	mainWndName = "Profile_CommonWnd",
}


-- -----------------------------------------------------------------
-- UI.Profile_CommonLikeWnd
-- -----------------------------------------------------------------

UI.Profile_CommonLikeWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Profile_CommonLikeWnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "Profile_CommonLikeWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE--[[ + UI.WS_NOT_MOUSE_REACT ]] + UI.WS_NOT_KB_REACT,
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
				defName				= "profile_common_like",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "text",	
						layer		= "UI.Profile_CommonLikeWnd.layers.VALUE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- VALUE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},
	}
}

UI.Profile_CommonLikeWnd.layers = 
{
	MAIN_EFFECT 				= 0,
	VALUE_TEXT 					= 1,
}

UI.Profile_CommonLikeWnd.Modes = 
{
	ALLY 					= 0,
	ENEMY 					= 1,
}


UI.Profile_CommonLikeWnd.mode = UI.Profile_CommonLikeWnd.Modes.FRIENDS

--
function UI.Profile_CommonLikeWnd:GetTooltipData()
	return 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = UI:GetStringByName( "tooltip_profile_like_"..UI:Val2Key( UI.Profile_CommonLikeWnd.Modes, self.mode ).."_text" ),
			caption = UI:GetStringByName( "tooltip_profile_like_"..UI:Val2Key( UI.Profile_CommonLikeWnd.Modes, self.mode ).."_caption" ),
		}
end

--
function UI.Profile_CommonLikeWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.mode == self.Modes.ALLY then
		mainEffect:StartAnimation( "idle" )
	else
		mainEffect:StartAnimation( "idle_2" )
	end
end

--
function UI.Profile_CommonLikeWnd:Update()
	local commonStats = UI.Profile:GetCommonStats()
	if self.mode == self.Modes.ALLY then
		self:SetText( UI:U642StrSeparatedBy3( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_THUMBS_UP_ALLY ] ), self.layers.VALUE_TEXT )
	else
		self:SetText( UI:U642StrSeparatedBy3( commonStats[ MasterServer.UserProfileGeneralStat.UPGS_THUMBS_UP_ENEMY ] ), self.layers.VALUE_TEXT )
	end
end

-- ---------------------------------------------------------------------------------------------------------
-- UI.Profile_CommonLikeAllyWnd, UI.Profile_CommonLikeEnemyWnd
-- ---------------------------------------------------------------------------------------------------------
--
UI.Profile_CommonLikeAllyWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Profile_CommonLikeWnd",
		props =
		{
			name	= "Profile_CommonLikeAllyWnd",
		}
	},
	mode = UI.Profile_CommonLikeWnd.Modes.ALLY
}

--
UI.Profile_CommonLikeEnemyWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Profile_CommonLikeWnd",

		props =
		{
			name	= "Profile_CommonLikeEnemyWnd",
		}
	},
	mode = UI.Profile_CommonLikeWnd.Modes.ENEMY
}


--
UI.PlayerAvatarWnd =
{
	def =
	{
		className	= "Wnd",
		props =
		{
			name		= "PlayerAvatarWnd",
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
					defName				= "profile_common_avatar",
					defaultAnimation    = "idle",
					links =
					{
						{
							objName		= "self28",
							animParams	= UI.EffectAnimParams.SIZE,
						},
					}
				}}
			},
   		},
	},
}

--
UI.PlayerAvatarWnd.layers = 
{
	MAIN_EFFECT 			= 0,
}

UI.PlayerAvatarWnd.avatar = ""
UI.PlayerAvatarWnd.needTooltip = false

--
function UI.PlayerAvatarWnd:GetTooltipData()
	if self.needTooltip == true then
		return 
			{
				tooltipType = UI.tooltipTypes.TEXT_SMALL,
				text = UI:GetAvatarName( self.avatar ),
				--caption = UI:GetAvatarName( self.avatar ),
			}
	else
		return nil
	end
end

--
function UI.PlayerAvatarWnd:SetAvatar( avatar )
	self.avatar = avatar
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetSpriteTexture( "ico4", UI:GetAvatarTexture( avatar ) )
end

--
UI.ProfileCommon_AvatarWnd =
{
	def =
	{
		className	= "Wnd",
		prototype 	= "PlayerAvatarWnd",
		props =
		{
			name		= "ProfileCommon_AvatarWnd",
		},
	},
	needTooltip = true,
}

--
UI.ProfileCommon_ChangeAvatarBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Profile_EditBtn",

		props =
		{
			name		= "ProfileCommon_ChangeAvatarBtn",
		},
	},

	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "tooltip_profile_change_avatar" ),
	},
}



local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

--
UI.ProfileChangeAvatar_Wnd = {}

--
UI.ProfileChangeAvatar_Wnd.layers = 
{
	MAIN_EFFECT 				= 0,
	BG_EFFECT 					= 1,
	WND_EFFECT 					= 2,
	TITLE_TEXT 					= 3,
	TEXT_TEXT 					= 4,
	LOADING_EFFECT 				= 5,
}

--
UI.ProfileChangeAvatar_Wnd.def = 
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",
	props =
	{
		name			= "ProfileChangeAvatar_Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
	},
	layers =
	{
		firstOverlayLayer = UI.ProfileChangeAvatar_Wnd.layers.LOADING_EFFECT,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			effects =
			{{
				defName				= "profile_change_avatar_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.ProfileChangeAvatar_Wnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "avatar_bay_win",	
						layer		= "UI.ProfileChangeAvatar_Wnd.layers.WND_EFFECT",
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
		-- WND_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "profile_change_avatar_win",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "title",	
						layer		= "UI.ProfileChangeAvatar_Wnd.layers.TITLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "text_5",	
						layer		= "UI.ProfileChangeAvatar_Wnd.layers.TEXT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "loading",	
						layer		= "UI.ProfileChangeAvatar_Wnd.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					--[[{
						objName		= "text_3",	
						layer		= "UI.ProfileChangeAvatar_Wnd.layers.COST_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},]]
					{
						objName		= "list",	
						wnd			= "UI.ProfileChangeAvatar_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_2",	
						wnd			= "UI.ProfileChangeAvatar_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "btn_1",	
						wnd			= "UI.ProfileChangeAvatar_SelectBtn",
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
   			font			= { fontName = "VerySmall" },
   			text 			= "^avatar_change_title"
		},
		-- TEXT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text 			= "^avatar_change_text"
		},
		-- LOADING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "hangar_waitCircleLarge",
				defaultAnimation    = "idle",
			}},
		},
		--[[{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			--text 			= "^clans_emblem_text"
		},
		-- GOLD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "shop_items_slot_priceIco",
				defaultAnimation    = "irridium",
			}}
		}]]
	},

	children = { "UI.ProfileChangeAvatar_ListWnd", "UI.ProfileChangeAvatar_CancelBtn", "UI.ProfileChangeAvatar_SelectBtn" }
}

UI.ProfileChangeAvatar_Wnd.selectedWnd = nil
UI.ProfileChangeAvatar_Wnd.selectedAvatar = nil
UI.ProfileChangeAvatar_Wnd.requestId = nil
--UI.ProfileChangeAvatar_Wnd.hMsgTimeOut

--
function UI.ProfileChangeAvatar_Wnd:SetWait( b )
	self:SetLayerVisible( b, self.layers.LOADING_EFFECT )
end

--
function UI.ProfileChangeAvatar_Wnd:MasterServer_OnAvatarsSetActive( retCode, requestId )
	if requestId == self.requestId then
		self.requestId = nil
		self:SetWait( false )
	end
	if retCode == 0 then
		self:Update( true )
		UI.Profile_CommonWnd:UpdateAvatar()
	else
		local reason = UI:Val2Key( MasterServer.TitlesOpResult, retCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_error_cant_set_avatar" )..UI:GetStringByName( reason ), UI.MBS_OK )
	end
end

--
function UI.ProfileChangeAvatar_Wnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.ProfileChangeAvatar_ByuWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end


--
function UI.ProfileChangeAvatar_Wnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if UI.ProfileChangeAvatar_ByuWnd.mainWndName == "ProfileChangeAvatar_Wnd" then
		UI.ProfileChangeAvatar_ByuWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ProfileChangeAvatar_Wnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if UI.ProfileChangeAvatar_ByuWnd.mainWndName == "ProfileChangeAvatar_Wnd" then
		UI.ProfileChangeAvatar_ByuWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ProfileChangeAvatar_Wnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if UI.ProfileChangeAvatar_ByuWnd.mainWndName == "ProfileChangeAvatar_Wnd" then
		UI.ProfileChangeAvatar_ByuWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	end	

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.ProfileChangeAvatar_Wnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId ~= 0 and requestId == self.requestId then

    	if result == _G.GameStore.StoreBuyResult.SBR_OK then
    		self:Update( true )
    		local shopItem = UI:GetShopItemById( param1 )
    		self.requestId = _G.MasterServer_AvatarsSetActive( shopItem.defName )
    	else
    		UI.ShopWnd:ShowBuyErrorMsg( result )
    		self.requestId = nil
    		self:SetWait( false )
    	end

	end

end

--
function UI.ProfileChangeAvatar_Wnd:OnBuyWndResult( result, mode )
	if result == true then
		local avatarDef = UI.ProfileChangeAvatar_Wnd:GetSelectedData()
		local price, bGold = UI:GetShopBuyPriceByDef( avatarDef, false, false )
		local priceType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
		self.requestId = _G.GameStore_Buy( UI:GetDef( avatarDef ).storeItemId, 1, priceType )
		self:SetWait( true )
	end
end

--
function UI.ProfileChangeAvatar_Wnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:Update()
end

--
function UI.ProfileChangeAvatar_Wnd:Hide()
	--self:UnlinkFromParent()
	UI:PlayGlobalSound( "sound/ui/MsgHide" )
	UI.FullScreenWnd.UnlinkFromParent( self )
end

--
function UI.ProfileChangeAvatar_Wnd:OnEscape()
	self:Hide()
	return true
end

--
function UI.ProfileChangeAvatar_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.ProfileChangeAvatar_CancelBtn == wnd then
		self:Hide()
	elseif UI.ProfileChangeAvatar_SelectBtn == wnd then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:OnOk()
	end
	return true
end

--
function UI.ProfileChangeAvatar_Wnd:OnOk()
	if self.requestId == nil then
		if self.selectedAvatar then
			if self.selectedAvatar ~= UI.Profile:GetCurrentAvatar( _G.MasterServer_GetLocalUserId() ) then
				if UI.Profile:IsAvatarUnlocked( _G.MasterServer_GetLocalUserId(), self.selectedAvatar ) then
					self.requestId = _G.MasterServer_AvatarsSetActive( self.selectedAvatar )
					self:SetWait( true )
				else
					UI.ProfileChangeAvatar_ByuWnd.mainWndName = "ProfileChangeAvatar_Wnd"
					UI.ProfileChangeAvatar_ByuWnd:Setup( UI.ProfileChangeAvatar_ByuWnd.modes.AVATAR )
					UI.ProfileChangeAvatar_ByuWnd:Show()
				end
			end
		else
			sys.log( "UI.ProfileChangeAvatar_Wnd:OnOk()[ERROR]: self.selectedAvatar is nil" )
		end
	end
end

--
function UI.ProfileChangeAvatar_Wnd:Update( saveCurScroll )
	local srcItems = UI.serverData.shopByDef
	self:SelectWnd( nil )

	--[[local scrollPos = -1
	if saveCurScroll then
		scrollPos = UI.ProfileChangeAvatar_ListWnd:GetScrollPos()
	else
		self.selectedAvatar = nil
	end]]

	local function Compare( item1, item2 )
		if item1.defName == "" or item2.defName == "" then
			if item1.defName == "" and item2.defName == "" then
				return false
			else
				return item1.defName == ""
			end
		end
		local bCustom1 = UI:IsAvatarCustom( item1.defName )
		local bCustom2 = UI:IsAvatarCustom( item2.defName )
		if bCustom1 or bCustom2 then
			if bCustom1 and bCustom2 then
				return item1.defName < item2.defName
			else
				return bCustom1
			end
		end

		local new1 = UI:IsItemNew( item1 )
		local new2 = UI:IsItemNew( item2 )
		if new1 or new2 then
			if new1 and new2 then
				return item1.defName < item2.defName
			else
				return new1
			end
		end

		local hot1 = UI:IsItemHot( item1 )
		local hot2 = UI:IsItemHot( item2 )
		if hot1 or hot2 then
			if hot1 and hot2 then
				return item1.defName < item2.defName
			else
				return hot1
			end
		end

		local def1 = UI:GetDef( item1.defName )
		local def2 = UI:GetDef( item2.defName )
		local sortOrder1 = def1 and def1.sort or math.huge
		local sortOrder2 = def2 and def2.sort or math.huge
		if sortOrder1 ~= sortOrder2 then
			return sortOrder1 < sortOrder2
		end

		return item1.defName < item2.defName
	end
	
	if not saveCurScroll then
		UI.ProfileChangeAvatar_ListWnd:Clear()
	end

	local data = {}
	table.insert( data, { defName = "" } )
	for k, v in pairs( srcItems ) do
		if UI:IsDefAvatar( v.defName ) and ( not UI:CantItemBeBought( v ) or UI.Profile:IsAvatarUnlocked( _G.MasterServer_GetLocalUserId(), v.defName ) )then
			if UI:IsAvatarCustom( v.defName ) then
				if UI:IsCustomAvatarExist( v.defName ) then
					table.insert( data, v )
				end
			else
				table.insert( data, v )
			end
		end
	end
	table.sort( data, Compare )

	local subTable = {}
	local recordIndex = 1
	for i = 1, #data do
		table.insert( subTable, data[ i ] )
		if #subTable == 4 then
			if saveCurScroll then
				UI.ProfileChangeAvatar_ListWnd:SetRecordData( subTable, recordIndex )
				recordIndex = recordIndex + 1
			else
				UI.ProfileChangeAvatar_ListWnd:AddRecord( subTable )
			end
			subTable = {}
		end
	end

	if #subTable > 0 then
		if saveCurScroll then
			UI.ProfileChangeAvatar_ListWnd:SetRecordData( subTable, recordIndex )
			recordIndex = recordIndex + 1
		else
			UI.ProfileChangeAvatar_ListWnd:AddRecord( subTable )
		end
	end

	--[[if scrollPos and scrollPos ~= -1 then
		UI.ProfileChangeAvatar_ListWnd:SetScrollPos( scrollPos, true, true )
	end]]

	self:SetWait( self.requestId ~= nil )


	if not saveCurScroll then

		local curAvatarDefName = UI.Profile:GetCurrentAvatar( _G.MasterServer_GetLocalUserId() )

		local curLineIdx	= -1
		local curSlotIdx	= -1

    	for lineIdx = 1, UI.ProfileChangeAvatar_ListWnd:GetNumRecords() do

			local lineData = UI.ProfileChangeAvatar_ListWnd:GetRecordData( lineIdx )

			for slotIdx, slotData in pairs( lineData ) do

				if slotData.defName == curAvatarDefName then

					curLineIdx	= lineIdx
					curSlotIdx	= slotIdx

					break

				end

			end

		end

		if curLineIdx ~= -1 and curSlotIdx ~= -1 then

			UI.ProfileChangeAvatar_ListWnd:SetScrollPos( curLineIdx )

    		local curLineWnd = UI.ProfileChangeAvatar_ListWnd:GetButtonForRecord( curLineIdx )
    		if curLineWnd then

				local curSlotWnd = curLineWnd.listWnd:GetButtonForRecord( curSlotIdx )
				if curSlotWnd then
					self:SelectWnd( curSlotWnd )
				end

    		end		

		end

	end

end

--
function UI.ProfileChangeAvatar_Wnd:F_OnEventSaveUiState()
	UI.store.ProfileChangeAvatar_Wnd =
	{
		requestId	= self.requestId,
	}
end

--
function UI.ProfileChangeAvatar_Wnd:F_OnEventRestoreUiState()
	if UI.store.ProfileChangeAvatar_Wnd then
		self.requestId	= UI.store.ProfileChangeAvatar_Wnd.requestId
		UI.store.ProfileChangeAvatar_Wnd = nil
	end
end

--
function UI.ProfileChangeAvatar_Wnd:GetSelectedData()
	return self.selectedAvatar
end


--
function UI.ProfileChangeAvatar_Wnd:GetSelectedWnd()
	return self.selectedWnd
end

--
function UI.ProfileChangeAvatar_Wnd:SelectWnd( wnd )
	if self.selectedWnd ~= nil then
		self.selectedWnd:Select( false )
	end
	self.selectedWnd = wnd
	if self.selectedWnd then
		self.selectedWnd:Select( true )
		self.selectedAvatar = wnd:GetRecordData().defName
		if UI.Profile:IsAvatarUnlocked( _G.MasterServer_GetLocalUserId(), self.selectedAvatar ) then
			UI.ProfileChangeAvatar_SelectBtn:SetBtnText( UI:GetStringByName( "stickers_btnText_apply" ) )
		else
			UI.ProfileChangeAvatar_SelectBtn:SetBtnText( UI:GetStringByName( "shop_buy" ) )
		end
	end
end


--
function UI.ProfileChangeAvatar_Wnd:OnAccountAurasChanged()

	for lineIdx = 1, UI.ProfileChangeAvatar_ListWnd:GetNumRecords() do

		local lineWnd = UI.ProfileChangeAvatar_ListWnd:GetButtonForRecord( lineIdx )
		if lineWnd then

			for slotIdx = 1, lineWnd.listWnd:GetNumRecords() do

				local slotWnd = lineWnd.listWnd:GetButtonForRecord( slotIdx )
				if slotWnd then
					slotWnd:UpdateForData( lineWnd.listWnd:GetRecordData( slotIdx ) )
				end

			end

		end

	end

end


-- -----------------------------------------------------------------
-- UI.ProfileChangeAvatar_ListWnd
-- -----------------------------------------------------------------

UI.ProfileChangeAvatar_ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ProfileChangeAvatar_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "ProfileChangeAvatar_ListWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "profile_change_avatar_list",
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
}

UI.ProfileChangeAvatar_ListWnd.MAX_SLOTS = 5

UI.ProfileChangeAvatar_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.ProfileChangeAvatar_ListWnd.btnPrototypeName	= "ProfileChangeAvatar_ListLineWnd"
UI.ProfileChangeAvatar_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}
UI.ProfileChangeAvatar_ListWnd.sounds =
{
	click	= UI.sounds.btnClick,
	over	= UI.sounds.btnMouseOver,
}

--
function UI.ProfileChangeAvatar_ListWnd:Clear()
	local slots = self.slots
	for k, v in pairs( slots ) do
		v.btn.listWnd:Clear()
	end
	UI.ButtonsList3Wnd.Clear( self )
end

--
function UI.ProfileChangeAvatar_ListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
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
		UI:PlayGlobalSound( "sound/ui/btnMouseOver" )
	end
	return true
end


-- -----------------------------------------------------------------
-- UI.ProfileChangeAvatar_ListLineWnd
-- -----------------------------------------------------------------
UI.ProfileChangeAvatar_ListLineWnd = {}
-- ------------------------------
-- window definition
-- ------------------------------
--
UI.ProfileChangeAvatar_ListLineWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "ProfileChangeAvatar_ListLineWnd",
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
				defName				= "profile_change_avatar_list_line",
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
}

UI.ProfileChangeAvatar_ListLineWnd.listWnd = nil

--
function UI.ProfileChangeAvatar_ListLineWnd:F_PostLoad()
	UI.ButtonsList3_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.listWnd = UI:CreateChildWnd( self, UI.ProfileChangeAvatar_ListLineListWnd, "" )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.listWnd, mainEffect, "self", UI.EffectAnimParams.POS )
end

--
function UI.ProfileChangeAvatar_ListLineWnd:UpdateForData( data, bAnimated )
	self.listWnd:Clear()
	for k, v in pairs( data ) do
		self.listWnd:AddRecord( v )
	end
end

-- -----------------------------------------------------------------
-- UI.ProfileChangeAvatar_ListLineListWnd
-- -----------------------------------------------------------------

UI.ProfileChangeAvatar_ListLineListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ProfileChangeAvatar_ListLineListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "ProfileChangeAvatar_ListLineListWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype 	= true
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
				defName				= "profile_change_avatar_list_line",
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
}

UI.ProfileChangeAvatar_ListLineListWnd.MAX_SLOTS = 4

UI.ProfileChangeAvatar_ListLineListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.ProfileChangeAvatar_ListLineListWnd.btnPrototypeName	= "ProfileChangeAvatar_ListLineListSlotWnd"
UI.ProfileChangeAvatar_ListLineListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
	}
}
UI.ProfileChangeAvatar_ListLineListWnd.sounds =
{
	click	= UI.sounds.btnClick,
	over	= UI.sounds.btnMouseOver,
}

-- ------------------------------
-- interface functions
-- ------------------------------



-- -----------------------------------------------------------------
-- UI.ProfileChangeAvatar_ListLineListSlotWnd
-- -----------------------------------------------------------------
UI.ProfileChangeAvatar_ListLineListSlotWnd = {}
-- ------------------------------
-- window definition
-- ------------------------------
--
UI.ProfileChangeAvatar_ListLineListSlotWnd.layers = 
{
	MAIN_EFFECT 				= 0,
	PRICE_TEXT 					= 1,
	SALE_EFFECT 				= 2,
	SELECT_EFFECT 				= 3,
	OVER_EFFECT 				= 4,
	SET_EFFECT 					= 5,
}
--
UI.ProfileChangeAvatar_ListLineListSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "ProfileChangeAvatar_ListLineListSlotWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype		= true,
	},
	layers =
	{
		firstOverlayLayer = UI.ProfileChangeAvatar_ListLineListSlotWnd.layers.PRICE_TEXT,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			effects =
			{{
				defName				= "profile_change_avatar_list_line_slot",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "price",
						layer 		= "UI.ProfileChangeAvatar_ListLineListSlotWnd.layers.PRICE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "select",
						layer 		= "UI.ProfileChangeAvatar_ListLineListSlotWnd.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "sale",
						layer 		= "UI.ProfileChangeAvatar_ListLineListSlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "over",
						layer 		= "UI.ProfileChangeAvatar_ListLineListSlotWnd.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "sticker_eneble",
						layer 		= "UI.ProfileChangeAvatar_ListLineListSlotWnd.layers.SET_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- PRICE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Medium" },
		},
		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "profile_change_avatar_list_line_slot_sale",
				defaultAnimation    = "idle",
			}}
		},
		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "profile_change_avatar_list_line_slot_select",
				defaultAnimation    = "idle",
			}}
		},
		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "profile_change_avatar_list_line_slot_over",
				defaultAnimation    = "idle",
			}}
		},
		-- SET_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "shipCustomization_itemsSlot_applied",
				defaultAnimation    = "idle",
			}}
		},
	}
}


UI.ProfileChangeAvatar_ListLineListSlotWnd.metatext = nil

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:GetTooltipData()
	return 
		{
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = UI:GetAvatarDesc( self:GetRecordData().defName ),
			caption = UI:GetAvatarName( self:GetRecordData().defName ),
		}
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_PostLoad()
	UI.ButtonsList_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.PRICE_TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.PRICE_TEXT ), self:GetLayerHeight( self.layers.PRICE_TEXT ) ), true )
	self.avatarWnd = UI:CreateChildWnd( self, UI.PlayerAvatarWnd, "" )
	self.avatarWnd.needTooltip = true
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.avatarWnd, mainEffect, "avatar_icon", UI.EffectAnimParams.POS )
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_Shutdown()
	if self.metaText then
		self.metaText:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:UpdateMetaTextPos()
	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_TEXT )
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateMetaTextPos()
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.PRICE_TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:UpdateForData( data, bAnimated )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.avatarWnd:SetAvatar( data.defName )
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	self:SetLayerVisible( false, self.layers.SELECT_EFFECT )
	local selectedData = UI.ProfileChangeAvatar_Wnd:GetSelectedData()
	if selectedData then
		if data.defName == selectedData then
			UI.ProfileChangeAvatar_Wnd:SelectWnd( self )
		else
			if self == UI.ProfileChangeAvatar_Wnd:GetSelectedWnd() then
				UI.ProfileChangeAvatar_Wnd:SelectWnd( nil )
			end
		end
	else
		UI.ProfileChangeAvatar_Wnd:SelectWnd( self )
	end
	if data.defName == UI.Profile:GetCurrentAvatar( _G.MasterServer_GetLocalUserId() ) then
		self:SetLayerVisible( true, self.layers.SET_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.SET_EFFECT )
	end
	if UI.Profile:IsAvatarUnlocked( _G.MasterServer_GetLocalUserId(), data.defName ) then
		self:SetLayerVisible( false, self.layers.SALE_EFFECT )
		self.metaText:SetText( "", true )
	else
		self:SetLayerVisible( UI:IsItemSale( data ), self.layers.SALE_EFFECT )
		local price, bGold = UI:GetShopBuyPrice( data, false, false )
		local basePrice, basebGold = UI:GetShopBaseBuyPrice( data, false, false )
		local priceInfo = {}
		priceInfo.priceType 	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
		priceInfo.val			= price
		priceInfo.bIsBuyPrice	= true
		priceInfo.basePrice 	= basePrice
		local strPrace = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_TEXT ), true, nil, true, nil )
		self.metaText:SetText( strPrace, true )
		self:UpdateMetaTextPos()
	end
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_OnMouseIn()
	UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	return true
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_OnMouseOut()
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	return true
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:Select( b )
	self:SetLayerVisible( b, self.layers.SELECT_EFFECT )
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI:PlayGlobalSound( UI.sounds.btnClick )
	UI.ProfileChangeAvatar_Wnd:SelectWnd( self )
	return true
end

--
function UI.ProfileChangeAvatar_ListLineListSlotWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI.ProfileChangeAvatar_Wnd:OnOk()
	return true
end

-- -------------------------------------------------------------------
-- UI.ProfileChangeAvatar_ByuWnd
-- -------------------------------------------------------------------

UI.ProfileChangeAvatar_ByuWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "ProfileChangeAvatar_ByuBtn",
    	},
	},

	mainWndName = "ProfileChangeAvatar_Wnd",
}

--
UI.ProfileChangeAvatar_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ProfileChangeAvatar_CancelBtn",
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
UI.ProfileChangeAvatar_SelectBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ProfileChangeAvatar_SelectBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^clans_emblem_select",
   			},
   		}
	},
}

--
function UI.ProfileChangeAvatar_SelectBtn:SetBtnText( text )
	self:SetText( text, self.layers.TEXT )
end


-- ---------------------------------------------------------------
-- UI.ProfileCommon_RankStatsComboBox
-- ---------------------------------------------------------------

UI.ProfileCommon_RankStatsComboBox =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "Shop_FilterComboBoxWnd",

    	props =
    	{
    		name	= "ProfileCommon_RankStatsComboBox"
    	}
	},
}