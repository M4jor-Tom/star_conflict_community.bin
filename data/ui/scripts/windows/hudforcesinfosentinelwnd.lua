-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfosentinelwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoSentinelWnd = {}
local fi = UI.HudForcesInfoSentinelWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoSentinelWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoSentinelWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_forcesInfoSentinel_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.FRIEND_LEADER_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.ENEMY_LEADER_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "captain_ico_1",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.FRIEND_LEADER_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "captain_ico_2",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.ENEMY_LEADER_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "captain_dead_1",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.FRIEND_LEADER_DEAD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "captain_dead_2",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.ENEMY_LEADER_DEAD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.FRIEND_LEADER_DEAD_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.ENEMY_LEADER_DEAD_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "friend_score",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.FRIEND_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.ENEMY_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "indicator_1",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.COMPARISON_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "shild_1",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.FRIEND_HP_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "shild_2",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.ENEMY_HP_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "arm_1",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.FRIEND_SHIELD_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "arm_2",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.ENEMY_SHIELD_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "value",
						layer		= "UI.HudForcesInfoSentinelWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},   

		-- FRIEND_LEADER_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- ENEMY_LEADER_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- FRIEND_LEADER_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			                       	
			effects =
			{{
				defName 			= "hud_sentinelLeaderIco",
				defaultAnimation	= "friend",
			}}
		},

		-- ENEMY_LEADER_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			                       	
			effects =
			{{
				defName 			= "hud_sentinelLeaderIco",
				defaultAnimation	= "enemy",
			}}
		},

		-- FRIEND_LEADER_DEAD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			                       	
			effects =
			{{
				defName 			= "hud_forcesInfoSentinel_leaderDead",
				defaultAnimation	= "friend",
			}}
		},

		-- ENEMY_LEADER_DEAD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			                       	
			effects =
			{{
				defName 			= "hud_forcesInfoSentinel_leaderDead",
				defaultAnimation	= "enemy",
			}}
		},

		-- FRIEND_LEADER_DEAD_TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			text			= "^hud_sentinelLeaderDead"
		}, 

		-- ENEMY_LEADER_DEAD_TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			text			= "^hud_sentinelLeaderDead"
		}, 

		-- FRIEND_SCORE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- ENEMY_SCORE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- COMPARISON_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 	= "hud_forcesInfo_comparison",
			}}
		},

		-- FRIEND_HP_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
			                       	
			effects =
			{{
				defName 			= "hud_objectsMark_insideShip_hp",
				defaultAnimation	= "idle",
			}}
		},

		-- ENEMY_HP_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
			                       	
			effects =
			{{
				defName 			= "hud_objectsMark_insideShip_hp",
				defaultAnimation	= "idle",
			}}
		},

		-- FRIEND_SHIELD_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
			                       	
			effects =
			{{
				defName 			= "hud_objectsMark_insideShip_shield",
				defaultAnimation	= "idle",
			}}
		},

		-- ENEMY_SHIELD_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
			                       	
			effects =
			{{
				defName 			= "hud_objectsMark_insideShip_shield",
				defaultAnimation	= "idle",
			}}
		},    

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoSentinelWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	local leaderId_friend, bLeaderDead_friend	= self:GetLeaderId( true )
	local leaderId_enemy, bLeaderDead_enemy		= self:GetLeaderId( false )

	if leaderId_friend ~= -1 then

		local leaderCid_friend = UI:GetPlayerClanById( leaderId_friend )
		if cid == leaderCid_friend then
			self:UpdateLeaderName( leaderId_friend, true )
		end

	end

	if leaderId_enemy ~= -1 then

		local leaderCid_enemy = UI:GetPlayerClanById( leaderId_enemy )
		if cid == leaderCid_enemy then
			self:UpdateLeaderName( leaderCid_enemy, true )
		end

	end

end


--
function UI.HudForcesInfoSentinelWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	if field ~= _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		return
	end
	
	local leaderId_friend, bLeaderDead_friend	= self:GetLeaderId( true )
	local leaderId_enemy, bLeaderDead_enemy		= self:GetLeaderId( false )

	if leaderId_friend ~= -1 then
	
		local playerInfo = _G.GetPlayerInfo( leaderId_friend )
		local playerUid = playerInfo.isBot and playerInfo.botUid or playerInfo.uid
		
		if uid == playerUid then
			self:UpdateLeaderName( leaderId_friend, true )
		end

	end

	if leaderId_enemy ~= -1 then
	
		local playerInfo = _G.GetPlayerInfo( leaderId_enemy )
		local playerUid = playerInfo.isBot and playerInfo.botUid or playerInfo.uid
		
		if uid == playerUid then
			self:UpdateLeaderName( leaderCid_enemy, true )
		end

	end

end


--
function UI.HudForcesInfoSentinelWnd:OnChangeStatus()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateTimeStatusIdx()

end


-- ------------------------------
-- const
-- ------------------------------

fi.layers =
{
    MAIN_EFFECT					= 0,
    FRIEND_LEADER_NAME			= 1,
    ENEMY_LEADER_NAME			= 2,
    FRIEND_LEADER_ICO_EFFECT	= 3,
    ENEMY_LEADER_ICO_EFFECT		= 4,
    FRIEND_LEADER_DEAD_EFFECT	= 5,
    ENEMY_LEADER_DEAD_EFFECT	= 6,
    FRIEND_LEADER_DEAD_TEXT		= 7,
    ENEMY_LEADER_DEAD_TEXT		= 8,
    FRIEND_SCORE				= 9,
    ENEMY_SCORE					= 10,
    COMPARISON_EFFECT			= 11,
	FRIEND_HP_PB_EFFECT			= 12,
	ENEMY_HP_PB_EFFECT			= 13,
	FRIEND_SHIELD_PB_EFFECT		= 14,
	ENEMY_SHIELD_PB_EFFECT		= 15,
	TIME						= 16,

}

fi.effectInfo =
{
	comparison =
	{
		animFriendWin	= "more",
		animEnemyWin	= "less",
		animEqual		= "equally",
	}
}

fi.strTime = UI:GetStringByName( "timeTillSentinelHunt" )

-- ------------------------------
-- vars
-- ------------------------------

fi.myTeam						= 1
fi.leaderId_friend				= -1
fi.leaderId_enemy				= -1
fi.comparisonAnimId_friendWin	= -1
fi.comparisonAnimId_enemyWin	= -1
fi.comparisonAnimId_equal		= -1
fi.hpPbEffect_friend			= nil
fi.hpPbEffect_enemy				= nil
fi.shieldPbEffect_friend		= nil
fi.shieldPbEffect_enemy			= nil
fi.time							= nil
fi.timeStatusIdx				= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoSentinelWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		self.comparisonAnimId_friendWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin )
		self.comparisonAnimId_enemyWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin )
		self.comparisonAnimId_equal		= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEqual )	

	end

	self.hpPbEffect_friend		= UI:GetEffectFromLayer( self, self.layers.FRIEND_HP_PB_EFFECT )
	self.hpPbEffect_enemy		= UI:GetEffectFromLayer( self, self.layers.ENEMY_HP_PB_EFFECT )
	self.shieldPbEffect_friend	= UI:GetEffectFromLayer( self, self.layers.FRIEND_SHIELD_PB_EFFECT )
	self.shieldPbEffect_enemy	= UI:GetEffectFromLayer( self, self.layers.ENEMY_SHIELD_PB_EFFECT )

	self:Reset()

end


--
function UI.HudForcesInfoSentinelWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_SCORE )
	self:SetText( "0", self.layers.ENEMY_SCORE )
	self:SetText( "", self.layers.FRIEND_LEADER_NAME )
	self:SetText( "", self.layers.ENEMY_LEADER_NAME )
	self:SetLayerVisible( false, self.layers.FRIEND_LEADER_DEAD_EFFECT )
	self:SetLayerVisible( false, self.layers.ENEMY_LEADER_DEAD_EFFECT )
	self:SetLayerVisible( false, self.layers.FRIEND_LEADER_DEAD_TEXT )
	self:SetLayerVisible( false, self.layers.ENEMY_LEADER_DEAD_TEXT )
	self:SetLayerVisible( false, self.layers.TIME )
	self:SetLayerVisible( false, self.layers.FRIEND_HP_PB_EFFECT )
	self:SetLayerVisible( false, self.layers.ENEMY_HP_PB_EFFECT )
	self:SetLayerVisible( false, self.layers.FRIEND_SHIELD_PB_EFFECT )
	self:SetLayerVisible( false, self.layers.ENEMY_SHIELD_PB_EFFECT )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then
		comparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	self.myTeam				= 1
	self.leaderId_friend	= -1
	self.leaderId_enemy		= -1
	self.time				= nil
	self.timeStatusIdx		= -1

end


--
function UI.HudForcesInfoSentinelWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = 1
	end

	self:UpdateTimeStatusIdx()
	self:UpdateScore()
	self:UpdateLeaders()

end


--
function UI.HudForcesInfoSentinelWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScore()
	self:UpdateLeaders()

end


--
function UI.HudForcesInfoSentinelWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.HudForcesInfoSentinelWnd:UpdateScore()

	local numKills1, numKills2 = _G.CL_GetTeamTotalKills()

	local numKills_friend	= self.myTeam == 1 and numKills1 or numKills2
	local numKills_enemy	= self.myTeam == 1 and numKills2 or numKills1

	self:SetText( tostring( numKills_friend ), self.layers.FRIEND_SCORE )
	self:SetText( tostring( numKills_enemy ), self.layers.ENEMY_SCORE )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		local animId = -1

		if numKills_friend > numKills_enemy then
			animId = self.comparisonAnimId_friendWin
		elseif numKills_friend < numKills_enemy then
			animId = self.comparisonAnimId_enemyWin
		else
			animId = self.comparisonAnimId_equal
		end

		if comparisonEffect:GetCurAnimationId() ~= animId then
			comparisonEffect:StartAnimationById( animId )
		end

	end

end


--
function UI.HudForcesInfoSentinelWnd:UpdateLeaders()

	local leaderId_friend, bLeaderDead_friend	= self:GetLeaderId( true )
	local leaderId_enemy, bLeaderDead_enemy		= self:GetLeaderId( false )

	local oldTime = self.time	
	self.time = -1

	if self.timeStatusIdx ~= -1 then
		self.time = _G.CL_GetPlayerStatusTimeLeft( self.timeStatusIdx ) or -1
	end

	-- никнеймы

	if leaderId_friend ~= self.leaderId_friend then

		self:UpdateLeaderName( leaderId_friend, true )
		self.leaderId_friend = leaderId_friend

	end

	if leaderId_enemy ~= self.leaderId_enemy then

		self:UpdateLeaderName( leaderId_enemy, false )
		self.leaderId_enemy = leaderId_enemy

	end


	-- живой/мертвый	

	self:SetLayerVisible( bLeaderDead_friend, self.layers.FRIEND_LEADER_DEAD_EFFECT )
	self:SetLayerVisible( bLeaderDead_friend, self.layers.FRIEND_LEADER_DEAD_TEXT )
	self:SetLayerVisible( not bLeaderDead_friend, self.layers.FRIEND_LEADER_NAME )

	self:SetLayerVisible( bLeaderDead_enemy, self.layers.ENEMY_LEADER_DEAD_EFFECT )
	self:SetLayerVisible( bLeaderDead_enemy, self.layers.ENEMY_LEADER_DEAD_TEXT )	
	self:SetLayerVisible( not bLeaderDead_enemy, self.layers.ENEMY_LEADER_NAME )	


	-- здоровье/щит или время

	if self.time ~= oldTime then

		local bTime = self.time > 0

		self:SetLayerVisible( not bTime, self.layers.FRIEND_HP_PB_EFFECT )
		self:SetLayerVisible( not bTime, self.layers.ENEMY_HP_PB_EFFECT )
		self:SetLayerVisible( not bTime, self.layers.FRIEND_SHIELD_PB_EFFECT )
		self:SetLayerVisible( not bTime, self.layers.ENEMY_SHIELD_PB_EFFECT )

		self:SetLayerVisible( bTime, self.layers.TIME )

	end

	if self.time <= 0 then

		local leaderShip_friend = leaderId_friend ~= -1 and _G.CL_GetPlayerShip( leaderId_friend )
		local leaderShip_enemy = leaderId_enemy ~= -1 and _G.CL_GetPlayerShip( leaderId_enemy )

    	-- здоровье

    	self:UpdateLeaderHp( leaderShip_friend, true, time )
    	self:UpdateLeaderHp( leaderShip_enemy, false, time )

    	-- щит

    	self:UpdateLeaderShield( leaderShip_friend, true, time )
    	self:UpdateLeaderShield( leaderShip_enemy, false, time )

	else

    	-- время

		if self.time ~= oldTime then
    		self:UpdateTime( self.time )
		end

	end

end


--
function UI.HudForcesInfoSentinelWnd:GetLeaderId( bFriend )

	local enemyTeam = self.myTeam == 1 and 2 or 1

	local leaderId, bLeaderDead	= _G.CL_SentinelGetTeamLeader( bFriend and self.myTeam or enemyTeam )

	if leaderId == -1 then
		bLeaderDead = false
	end

	return leaderId, bLeaderDead

end


--
function UI.HudForcesInfoSentinelWnd:UpdateLeaderName( leaderId, bFriend )

	local name = ""

	if leaderId ~= -1 then
    	name = UI:MakePlayerNameById( leaderId, true, false )
	end

	self:SetText( name, bFriend and self.layers.FRIEND_LEADER_NAME or self.layers.ENEMY_LEADER_NAME )

end


--
function UI.HudForcesInfoSentinelWnd:UpdateLeaderHp( ship, bFriend )

	local hp	= ship and ship:GetHealth() or 0
	local maxHp	= ship and ship:GetMaxHealth() or 0

	local animTime = maxHp ~= 0 and hp / maxHp or 0

	local effect = bFriend and self.hpPbEffect_friend or self.hpPbEffect_enemy

	effect:SetAnimationTime( animTime )
	effect:Update( 0 )

end


--
function UI.HudForcesInfoSentinelWnd:UpdateLeaderShield( ship, bFriend )

	local shield	= ship and ship:GetShieldVal() or 0
	local maxShield	= ship and ship:GetShieldMax() or 0

	local animTime = maxShield ~= 0 and shield / maxShield or 0

	local effect = bFriend and self.shieldPbEffect_friend or self.shieldPbEffect_enemy

	effect:SetAnimationTime( animTime )
	effect:Update( 0 )

end


--
function UI.HudForcesInfoSentinelWnd:UpdateTimeStatusIdx()

	self.timeStatusIdx = -1

	for statusIdx = 0, _G.CL_GetPlayerStatusNum() - 1 do

		local statusInfo = _G.CL_GetPlayerStatus( statusIdx ) 

		if statusInfo.type == ai.StatusItemType.SENTINEL then
			self.timeStatusIdx = statusIdx
			break
		end

	end

end


--
function UI.HudForcesInfoSentinelWnd:UpdateTime( time )

	local timeFixed = UI:Round( time )

	local strTimeVal = tostring( timeFixed )
	local str = string.format( "%s: %s %s", self.strTime, strTimeVal, UI.strSecs )

	self:SetText( str, self.layers.TIME )

end