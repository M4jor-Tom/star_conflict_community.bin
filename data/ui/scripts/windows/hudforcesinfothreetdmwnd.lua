-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfothreetdmwnd.lua
-- Copyright © 2021, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudForcesInfoThreeTdmWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoThreeTdmWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoThreeTdmWnd",
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
				defName 			= "hud_forcesInfoThreeTeamsDm_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend_score",
						layer		= "UI.HudForcesInfoThreeTdmWnd.layers.FRIEND_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score",
						layer		= "UI.HudForcesInfoThreeTdmWnd.layers.ENEMY_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score_2",
						layer		= "UI.HudForcesInfoThreeTdmWnd.layers.ENEMY_SCORE_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "indicator_1",
						layer		= "UI.HudForcesInfoThreeTdmWnd.layers.COMPARISON_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indicator_2",
						layer		= "UI.HudForcesInfoThreeTdmWnd.layers.COMPARISON_EFFECT_2",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
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

		-- ENEMY_SCORE_2
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

		-- COMPARISON_EFFECT_2
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 	= "hud_forcesInfo_comparison",
			}}
		},
	},
}


-- ------------------------------
-- const
-- ------------------------------

UI.HudForcesInfoThreeTdmWnd.layers =
{
    MAIN_EFFECT					= 0,
    FRIEND_SCORE				= 1,
	ENEMY_SCORE					= 2,
	ENEMY_SCORE_2				= 3,
	COMPARISON_EFFECT			= 4,
	COMPARISON_EFFECT_2			= 5,
}

UI.HudForcesInfoThreeTdmWnd.effectInfo =
{
	comparison =
	{
		animFriendWin	= "more_2",
		animFriendWin2	= "more",
		animEnemyWin	= "less_2",
		animEnemyWin2	= "less_3",
		animEqual		= "equally",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoThreeTdmWnd.myTeam						= ai.ThreeTeamsDMTeam1
UI.HudForcesInfoThreeTdmWnd.comparisonAnimId_friendWin	= -1
UI.HudForcesInfoThreeTdmWnd.comparisonAnimId_friendWin2	= -1
UI.HudForcesInfoThreeTdmWnd.comparisonAnimId_enemyWin	= -1
UI.HudForcesInfoThreeTdmWnd.comparisonAnimId_enemyWin2	= -1
UI.HudForcesInfoThreeTdmWnd.comparisonAnimId_equal		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoThreeTdmWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		self.comparisonAnimId_friendWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin )
		self.comparisonAnimId_friendWin2= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin2 )
		self.comparisonAnimId_enemyWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin )
		self.comparisonAnimId_enemyWin2	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin2 )
		self.comparisonAnimId_equal		= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEqual )	

	end

	self:Reset()

end


--
function UI.HudForcesInfoThreeTdmWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_SCORE )
	self:SetText( "0", self.layers.ENEMY_SCORE )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then
		comparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	local comparisonEffect2 = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT_2 )
	if comparisonEffect2 then
		comparisonEffect2:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	self.myTeam = ai.ThreeTeamsDMTeam1

end


--
function UI.HudForcesInfoThreeTdmWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = ai.ThreeTeamsDMTeam1
	end

	self:UpdateScore()

end


--
function UI.HudForcesInfoThreeTdmWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScore()

end


--
function UI.HudForcesInfoThreeTdmWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.HudForcesInfoThreeTdmWnd:UpdateScore()

	local score_friend = 0
	local score_enemy = 0
	local score_enemy2 = 0

	local team1 = ai.ThreeTeamsDMTeam1
	local team2 = ai.ThreeTeamsDMTeam2
	local team3 = ai.ThreeTeamsDMTeam3

	local score1, score2, score3 = _G.CL_GetThreeTeamsTotalScore()
	score_friend	= self.myTeam == team1 and score1 or self.myTeam == team2 and score2 or score3
	score_enemy		= ( self.myTeam == team1 ) and score2 or score1
	score_enemy2	= ( self.myTeam == team3 ) and score2 or score3

	score_friend	= UI:RoundClampOne( score_friend )
	score_enemy		= UI:RoundClampOne( score_enemy )
	score_enemy2	= UI:RoundClampOne( score_enemy2 )

	local strScore_friend	= tostring( score_friend )
	local strScore_enemy	= tostring( score_enemy )
	local strScore_enemy2	= tostring( score_enemy2 )

	-- текстовое значение очков

	self:SetText( strScore_friend, self.layers.FRIEND_SCORE )
	self:SetText( strScore_enemy, self.layers.ENEMY_SCORE )
	self:SetText( strScore_enemy2, self.layers.ENEMY_SCORE_2 )


	-- знак сравнения очков с командой врагов №1

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		local animId = -1

		if score_enemy > score_friend then
			animId = self.comparisonAnimId_enemyWin
		elseif score_enemy < score_friend then
			animId = self.comparisonAnimId_friendWin
		else
			animId = self.comparisonAnimId_equal
		end

		if comparisonEffect:GetCurAnimationId() ~= animId then
			comparisonEffect:StartAnimationById( animId )
		end

	end


	-- знак сравнения очков с командой врагов №2

	local comparisonEffect2 = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT_2 )
	if comparisonEffect2 then

		local animId = -1

		if score_enemy2 > score_friend then
			animId = self.comparisonAnimId_enemyWin2
		elseif score_enemy2 < score_friend then
			animId = self.comparisonAnimId_friendWin2
		else
			animId = self.comparisonAnimId_equal
		end

		if comparisonEffect2:GetCurAnimationId() ~= animId then
			comparisonEffect2:StartAnimationById( animId )
		end

	end

end
