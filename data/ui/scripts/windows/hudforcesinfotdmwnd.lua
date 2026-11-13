-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfotdmwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudForcesInfoTdmWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoTdmWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoTdmWnd",
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
				defName 			= "hud_forcesInfoKing_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoTdmWnd.layers.FRIEND_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy",
						layer		= "UI.HudForcesInfoTdmWnd.layers.ENEMY_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "friend_score",
						layer		= "UI.HudForcesInfoTdmWnd.layers.FRIEND_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score",
						layer		= "UI.HudForcesInfoTdmWnd.layers.ENEMY_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "indicator_1",
						layer		= "UI.HudForcesInfoTdmWnd.layers.COMPARISON_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},   

		-- FRIEND_LABEL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			text			= "^hud_forces_friends",
		}, 

		-- ENEMY_LABEL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			text			= "^hud_forces_enemies",
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
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoTdmWnd:OnVpHpAlwaysOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self.vpSlot:OnVpHpAlwaysOptionChanged()

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudForcesInfoTdmWnd.layers =
{
    MAIN_EFFECT			= 0,
    FRIEND_LABEL		= 1,
    ENEMY_LABEL			= 2,
    FRIEND_SCORE		= 3,
    ENEMY_SCORE			= 4,
    COMPARISON_EFFECT	= 5,
}

UI.HudForcesInfoTdmWnd.effectInfo =
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

UI.HudForcesInfoTdmWnd.myTeam						= 1
UI.HudForcesInfoTdmWnd.comparisonAnimId_friendWin	= -1
UI.HudForcesInfoTdmWnd.comparisonAnimId_enemyWin	= -1
UI.HudForcesInfoTdmWnd.comparisonAnimId_equal		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoTdmWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		self.comparisonAnimId_friendWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin )
		self.comparisonAnimId_enemyWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin )
		self.comparisonAnimId_equal		= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEqual )	

	end

end


--
function UI.HudForcesInfoTdmWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_SCORE )
	self:SetText( "0", self.layers.ENEMY_SCORE )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then
		comparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	self.myTeam = 1

end


--
function UI.HudForcesInfoTdmWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = 1
	end

	self:UpdateScore()

end


--
function UI.HudForcesInfoTdmWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScore()

end


--
function UI.HudForcesInfoTdmWnd:UpdateScore()

	local score1, score2 = _G.CL_GetTeamTotalScore()

	local score_friend	= self.myTeam == 1 and score1 or score2
	local score_enemy	= self.myTeam == 1 and score2 or score1

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


--
function UI.HudForcesInfoTdmWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end