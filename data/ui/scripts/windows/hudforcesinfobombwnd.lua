-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfobombwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoBombWnd = {}
local fi = UI.HudForcesInfoBombWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoBombWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoBombWnd",
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
				defName 			= "hud_forcesInfoBomb_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend_score",
						layer		= "UI.HudForcesInfoBombWnd.layers.FRIEND_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score",
						layer		= "UI.HudForcesInfoBombWnd.layers.ENEMY_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "value",
						layer		= "UI.HudForcesInfoBombWnd.layers.BOMBER_STATUS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
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

		-- BOMBER_STATUS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_forcesInfoBomb_bomberStatus",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.HudForcesInfoBombWnd.layers.BOMBER_STATUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- BOMBER_STATUS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hud_youAreBomber" )
		}, 
	},
}

-- ------------------------------
-- const
-- ------------------------------

fi.layers =
{
    MAIN_EFFECT				= 0,
    FRIEND_SCORE			= 1,
    ENEMY_SCORE				= 2,
	BOMBER_STATUS_EFFECT	= 3,
	BOMBER_STATUS			= 4,
}

fi.effectInfo =
{
	main =
	{
		bombLocatorPrefix	= "bomb_ico_",
	},
}

fi.MAX_BOMBS = 3

-- ------------------------------
-- vars
-- ------------------------------

fi.myTeam						= 1
fi.allBombs						= {}
fi.bombs_friend					= {}
fi.bombs_enemy					= {}
fi.maxBombs						= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoBombWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:Reset()

end


--
function UI.HudForcesInfoBombWnd:CreateControls()

	for idx = 1, self.MAX_BOMBS * 2 do

		local bombWnd = UI:CreateChildWnd( self, UI.HudForcesInfo_BombWnd, tostring( idx ) )
		table.insert( self.allBombs, bombWnd )		

		bombWnd:Init( idx <= self.MAX_BOMBS )

	end

end


--
function UI.HudForcesInfoBombWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_SCORE )
	self:SetText( "0", self.layers.ENEMY_SCORE )
	self:SetLayerVisible( false, self.layers.BOMBER_STATUS_EFFECT )
	self:SetLayerVisible( false, self.layers.BOMBER_STATUS )

	self:ResetBombs()

	self.myTeam = 1
	self.maxBombs = 0

end


--
function UI.HudForcesInfoBombWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = 1
	end

	self:InitBombs()

	self:UpdateScore()
	self:UpdateBombs()
	self:UpdateBomberStatus()

end


--
function UI.HudForcesInfoBombWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScore()
	self:UpdateBombs()
	self:UpdateBomberStatus()

end


--
function UI.HudForcesInfoBombWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.HudForcesInfoBombWnd:UpdateScore()

	local numKills1, numKills2 = _G.CL_GetTeamTotalKills()

	local numKills_friend	= self.myTeam == 1 and numKills1 or numKills2
	local numKills_enemy	= self.myTeam == 1 and numKills2 or numKills1

	self:SetText( tostring( numKills_friend ), self.layers.FRIEND_SCORE )
	self:SetText( tostring( numKills_enemy ), self.layers.ENEMY_SCORE )

end


--
function UI.HudForcesInfoBombWnd:ResetBombs()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	

	for idx, bombWnd in ipairs( self.allBombs ) do

		if bombWnd:IsChildOf( self ) then

			bombWnd:UnlinkFromParent()

			if mainEffect then
				mainEffect:UnlinkWnd( bombWnd:GetUiHandle(), "" )
			end

		end

	end

	self.bombs_friend	= {}
	self.bombs_enemy	= {}

end


--
function UI.HudForcesInfoBombWnd:InitBombs()

	self:ResetBombs()

	self.maxBombs = _G.CL_GetMaxScore()

	if self.maxBombs > self.MAX_BOMBS then
		sys.log( "UI.HudForcesInfoBombWnd:InitBombs()[ERROR]: cannot show %d bombs; max is %d", self.maxBombs, self.MAX_BOMBS )
		self.maxBombs = self.MAX_BOMBS
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	

	for bombIdx = 1, self.maxBombs do

		local locatorIdx_friend = self.MAX_BOMBS - ( bombIdx - 1 )
		local locatorIdx_enemy = bombIdx + self.MAX_BOMBS

		local bombWnd_friend = self.allBombs[ locatorIdx_friend ]
		local bombWnd_enemy = self.allBombs[ locatorIdx_enemy ]

		local locatorName_friend = string.format( "%s%d", self.effectInfo.main.bombLocatorPrefix, locatorIdx_friend )
		local locatorName_enemy = string.format( "%s%d", self.effectInfo.main.bombLocatorPrefix, locatorIdx_enemy )

		UI:AddChildAndLink( self, bombWnd_friend, mainEffect, locatorName_friend, UI.EffectAnimParams.POS )
		UI:AddChildAndLink( self, bombWnd_enemy, mainEffect, locatorName_enemy, UI.EffectAnimParams.POS )		

		table.insert( self.bombs_friend, bombWnd_friend )
		table.insert( self.bombs_enemy, bombWnd_enemy )

	end	

end


--
function UI.HudForcesInfoBombWnd:UpdateBombs()

	local livesLeft1, livesLeft2 = _G.CL_GetTeamTotalScore()

	local livesLeft_friend	= self.myTeam == 1 and livesLeft1 or livesLeft2
	local livesLeft_enemy	= self.myTeam == 1 and livesLeft2 or livesLeft1

	local bombsPlanted_friend	= self.maxBombs - livesLeft_enemy
	local bombsPlanted_enemy	= self.maxBombs - livesLeft_friend
	
	for bombIdx, bombWnd in ipairs( self.bombs_friend ) do
		bombWnd:Update( bombIdx <= bombsPlanted_friend )
	end

	for bombIdx, bombWnd in ipairs( self.bombs_enemy ) do
		bombWnd:Update( bombIdx <= bombsPlanted_enemy )
	end

end


--
function UI.HudForcesInfoBombWnd:UpdateBomberStatus()

	local bBomber = UI:BitTst( _G.CL_BombTheBaseGetCarrier(), UI.HudWnd.localPlayerId )
	
	self:SetLayerVisible( bBomber, self.layers.BOMBER_STATUS_EFFECT )
	self:SetLayerVisible( bBomber, self.layers.BOMBER_STATUS )

end


-- ----------------------------------------------------------------
-- UI.HudForcesInfo_BombWnd
-- ----------------------------------------------------------------

UI.HudForcesInfo_BombWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.HudForcesInfo_BombWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfo_BombWnd",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
		isPrototype	= true,
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
				defName 			= "hud_forcesInfoBomb_bomb",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.HudForcesInfo_BombWnd:Init( bFriend )

	self.bFriend = bFriend

end


--
function UI.HudForcesInfo_BombWnd:SetFriend( bFriend )

	self.bFriend = bFriend

end


--
function UI.HudForcesInfo_BombWnd:Update( bOn )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local animId = -1

	if self.bFriend then
		animId = bOn and self.animIdOnFriend or self.animIdOffFriend
	else
		animId = bOn and self.animIdOnEnemy or self.animIdOffEnemy 
	end

	if animId ~= -1 and animId ~= mainEffect:GetCurAnimationId() then
		mainEffect:StartAnimationById( animId )
	end

end


-- --------------------------------
-- const
-- --------------------------------

UI.HudForcesInfo_BombWnd.layers =
{
	MAIN_EFFECT = 0
}

UI.HudForcesInfo_BombWnd.effectInfo =
{
	main =
	{
		animOnFriend	= "on_friend",
		animOffFriend	= "off_friend",
		animOnEnemy		= "on_enemy",
		animOffEnemy	= "off_enemy",
	}
}

-- --------------------------------
-- vars
-- --------------------------------

UI.HudForcesInfo_BombWnd.animIdOnFriend		= -1
UI.HudForcesInfo_BombWnd.animIdOffFriend	= -1
UI.HudForcesInfo_BombWnd.animIdOnEnemy		= -1
UI.HudForcesInfo_BombWnd.animIdOffEnemy		= -1
UI.HudForcesInfo_BombWnd.bFriend			= false

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.HudForcesInfo_BombWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.animIdOnFriend 	= mainEffect:GetAnimationId( self.effectInfo.main.animOnFriend )
		self.animIdOffFriend	= mainEffect:GetAnimationId( self.effectInfo.main.animOffFriend )
		self.animIdOnEnemy		= mainEffect:GetAnimationId( self.effectInfo.main.animOnEnemy )
		self.animIdOffEnemy		= mainEffect:GetAnimationId( self.effectInfo.main.animOffEnemy )

	end

end