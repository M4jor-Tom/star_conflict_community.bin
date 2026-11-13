-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfogreedwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudForcesInfoGtdmWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoGtdmWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoGtdmWnd",
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
						objName		= "friend_score",
						layer		= "UI.HudForcesInfoGtdmWnd.layers.FRIEND_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score",
						layer		= "UI.HudForcesInfoGtdmWnd.layers.ENEMY_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "indicator_1",
						layer		= "UI.HudForcesInfoGtdmWnd.layers.COMPARISON_EFFECT",
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

		-- COMPARISON_EFFECT
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

UI.HudForcesInfoGtdmWnd.layers =
{
    MAIN_EFFECT					= 0,
    FRIEND_SCORE				= 1,
    ENEMY_SCORE					= 2,
    COMPARISON_EFFECT			= 3,
}

UI.HudForcesInfoGtdmWnd.effectInfo =
{
	comparison =
	{
		animFriendWin	= "more",
		animEnemyWin	= "less",
		animEqual		= "equally",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoGtdmWnd.myTeam						= 1
UI.HudForcesInfoGtdmWnd.comparisonAnimId_friendWin	= -1
UI.HudForcesInfoGtdmWnd.comparisonAnimId_enemyWin	= -1
UI.HudForcesInfoGtdmWnd.comparisonAnimId_equal		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoGtdmWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		self.comparisonAnimId_friendWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin )
		self.comparisonAnimId_enemyWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin )
		self.comparisonAnimId_equal		= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEqual )	

	end

	self:Reset()

end


--
function UI.HudForcesInfoGtdmWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_SCORE )
	self:SetText( "0", self.layers.ENEMY_SCORE )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then
		comparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	self.myTeam = 1

end


--
function UI.HudForcesInfoGtdmWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = 1
	end

	self:UpdateScore()

end


--
function UI.HudForcesInfoGtdmWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScore()

end


--
function UI.HudForcesInfoGtdmWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.HudForcesInfoGtdmWnd:UpdateScore()

	local score_friend = 0
	local score_enemy = 0

	if _G.GetCurrentGameMode() == ai.Gameplay.AUTOGEN_DM then
		score_friend, score_enemy  = _G.CL_GetTeamTotalScore()
	else
		local score1, score2 = _G.CL_GetTeamTotalScore()
		score_friend	= self.myTeam == 1 and score1 or score2
		score_enemy		= self.myTeam == 1 and score2 or score1
	end	

	score_friend	= UI:RoundClampOne( score_friend )
	score_enemy		= UI:RoundClampOne( score_enemy )

	local strScore_friend	= tostring( score_friend )
	local strScore_enemy	= tostring( score_enemy )

	-- текстовое значение очков

	self:SetText( strScore_friend, self.layers.FRIEND_SCORE )
	self:SetText( strScore_enemy, self.layers.ENEMY_SCORE )


	-- знак сравнения очков

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		local animId = -1

		if score_friend > score_enemy then
			animId = self.comparisonAnimId_friendWin
		elseif score_friend < score_enemy then
			animId = self.comparisonAnimId_enemyWin
		else
			animId = self.comparisonAnimId_equal
		end

		if comparisonEffect:GetCurAnimationId() ~= animId then
			comparisonEffect:StartAnimationById( animId )
		end

	end

end