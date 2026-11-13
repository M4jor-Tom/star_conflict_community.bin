-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfokingwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoKingWnd = {}
local fi = UI.HudForcesInfoKingWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoKingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoKingWnd",
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
						layer		= "UI.HudForcesInfoKingWnd.layers.FRIEND_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy",
						layer		= "UI.HudForcesInfoKingWnd.layers.ENEMY_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "friend_score",
						layer		= "UI.HudForcesInfoKingWnd.layers.FRIEND_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score",
						layer		= "UI.HudForcesInfoKingWnd.layers.ENEMY_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "indicator_1",
						layer		= "UI.HudForcesInfoKingWnd.layers.COMPARISON_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer",
						layer		= "UI.HudForcesInfoKingWnd.layers.TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
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

		-- TIMER
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
function UI.HudForcesInfoKingWnd:OnVpHpAlwaysOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self.vpSlot:OnVpHpAlwaysOptionChanged()

end


-- ------------------------------
-- const
-- ------------------------------

fi.layers =
{
    MAIN_EFFECT			= 0,
    FRIEND_LABEL		= 1,
    ENEMY_LABEL			= 2,
    FRIEND_SCORE		= 3,
    ENEMY_SCORE			= 4,
    COMPARISON_EFFECT	= 5,
	TIMER				= 6,
}

fi.effectInfo =
{
	main =
	{
		vpLocator			= "slot_2",
	},

	comparison =
	{
		animFriendWin	= "more",
		animEnemyWin	= "less",
		animEqual		= "equally",
	}
}

fi.strSeconds = UI:GetStringByName( "units_second" )

-- ------------------------------
-- vars
-- ------------------------------

fi.vpSlot						= nil
fi.myTeam						= 1
fi.comparisonAnimId_friendWin	= -1
fi.comparisonAnimId_enemyWin	= -1
fi.comparisonAnimId_equal		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoKingWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateVpSlot()

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		self.comparisonAnimId_friendWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin )
		self.comparisonAnimId_enemyWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin )
		self.comparisonAnimId_equal		= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEqual )	

	end

end


--
function UI.HudForcesInfoKingWnd:CreateVpSlot()

	self.vpSlot = UI:CreateChildWnd( self, UI.HudForcesInfoKing_VpSlotWnd )

end


--
function UI.HudForcesInfoKingWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_SCORE )
	self:SetText( "0", self.layers.ENEMY_SCORE )
	self:SetText( "", self.layers.TIMER )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then
		comparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	self:ResetVpSlot()

	self.myTeam = 1

end


--
function UI.HudForcesInfoKingWnd:ResetVpSlot()

	self.vpSlot:Reset()
	self.vpSlot:UnlinkFromParent()	

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( self.vpSlot:GetUiHandle(), "" )
	end

end


--
function UI.HudForcesInfoKingWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = 1
	end

	self:UpdateActiveVitalPoint()
	self:UpdateScore()

end


--
function UI.HudForcesInfoKingWnd:ShowVpSlot()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.vpSlot, mainEffect, self.effectInfo.main.vpLocator, UI.EffectAnimParams.POS )

end


--
function UI.HudForcesInfoKingWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateActiveVitalPoint()
	self:UpdateScore()
	self:UpdateTimer()

end


--
function UI.HudForcesInfoKingWnd:UpdateActiveVitalPoint()

	local vpId, nextVpId = _G.CL_KingGetCurrentHill()

	if vpId ~= -1 then

		if not self.vpSlot:IsChildOf( self ) then
			self:ShowVpSlot()			
		end

		if self.vpSlot:GetVpEntId() ~= vpId then
			self.vpSlot:Setup( vpId )
		end

	else

		if self.vpSlot:IsChildOf( self ) then
			self:ResetVpSlot()
		end

	end

end


--
function UI.HudForcesInfoKingWnd:UpdateScore()

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
function UI.HudForcesInfoKingWnd:UpdateTimer()

	local vpId		= -1
	local nextVpId	= -1
	local timer		= 0

	-- #0031041 - во время стартового отсчета таймер показывается "0"
	if _G.CL_GetCountDownTimer() <= 0 then
		vpId, nextVpId, timer = _G.CL_KingGetCurrentHill()
	end

	local strTimer = string.format( "%d %s", timer, self.strSeconds )
	self:SetText( strTimer, self.layers.TIMER )

end


--
function UI.HudForcesInfoKingWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- --------------------------------------------------------------
-- UI.HudForcesInfoKing_VpSlotWnd
-- --------------------------------------------------------------

UI.HudForcesInfoKing_VpSlotWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "HudForcesInfoControl_VpSlotWnd",

    	props =
    	{
    		name		= "HudForcesInfoKing_VpSlotWnd",
    		isPrototype	= true,
    	}
    }
}