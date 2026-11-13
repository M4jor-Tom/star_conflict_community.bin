-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfoclosedistwnd.lua
-- Copyright й 2021, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

--local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoCloseDistWnd = {}
local fi = UI.HudForcesInfoCloseDistWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoCloseDistWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoCloseDistWnd",
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
				defName 			= "hud_forcesInfoCloseDist_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.HudForcesInfoCloseDistWnd.layers.BOMBER_STATUS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
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
						layer		= "UI.HudForcesInfoCloseDistWnd.layers.BOMBER_STATUS",
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
	BOMBER_STATUS_EFFECT	= 1,
	BOMBER_STATUS			= 2,
}

fi.effectInfo =
{
	main =
	{
		bombLocatorPrefix	= "bomb_ico_",
		shieldLocatorPrefix	= "arm_ico_",
	},
}

fi.MAX_BOMBS = 3
fi.DEFENDERS_TEAM = 2

-- ------------------------------
-- vars
-- ------------------------------

fi.myTeam						= 1
fi.allBombs						= {}
fi.allShields					= {}
fi.maxBombs						= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoCloseDistWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:Reset()

end


--
function UI.HudForcesInfoCloseDistWnd:CreateControls()

	for idx = 1, self.MAX_BOMBS do

		local bombWnd = UI:CreateChildWnd( self, UI.HudForcesInfo_BombWnd, tostring( idx ) )
		table.insert( self.allBombs, bombWnd )		

		bombWnd:Init( false ) -- здесь не важно, друг или нет, позже выставится в методе InitBombs

	end

	for idx = 1, self.MAX_BOMBS do

		local shieldbWnd = UI:CreateChildWnd( self, UI.HudForcesInfo_BombShieldWnd, tostring( idx ) )
		table.insert( self.allShields, shieldbWnd )		

		shieldbWnd:Init()

	end

end


--
function UI.HudForcesInfoCloseDistWnd:Reset()

	self:SetLayerVisible( false, self.layers.BOMBER_STATUS_EFFECT )
	self:SetLayerVisible( false, self.layers.BOMBER_STATUS )

	self:ResetBombs()

	self.myTeam = 1
	self.maxBombs = 0

end


--
function UI.HudForcesInfoCloseDistWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = 1
	end

	self:InitBombs()

	self:UpdateBombs()
	self:UpdateBomberStatus()

end


--
function UI.HudForcesInfoCloseDistWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateBombs()
	self:UpdateBomberStatus()

end


--
function UI.HudForcesInfoCloseDistWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.HudForcesInfoCloseDistWnd:ResetBombs()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	

	for idx, bombWnd in ipairs( self.allBombs ) do

		if bombWnd:IsChildOf( self ) then

			bombWnd:UnlinkFromParent()

			if mainEffect then
				mainEffect:UnlinkWnd( bombWnd:GetUiHandle(), "" )
			end

		end

	end

	for idx, shieldWnd in ipairs( self.allShields ) do

		if shieldWnd:IsChildOf( self ) then

			shieldWnd:UnlinkFromParent()

			if mainEffect then
				mainEffect:UnlinkWnd( shieldWnd:GetUiHandle(), "" )
			end

		end

	end

end


--
function UI.HudForcesInfoCloseDistWnd:InitBombs()

	self:ResetBombs()

	self.maxBombs = _G.CL_GetMaxScore()

	if self.maxBombs > self.MAX_BOMBS then
		sys.log( "UI.HudForcesInfoCloseDistWnd:InitBombs()[ERROR]: cannot show %d bombs; max is %d", self.maxBombs, self.MAX_BOMBS )
		self.maxBombs = self.MAX_BOMBS
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	

	for bombIdx = 1, self.maxBombs do

		local bombWnd = self.allBombs[ bombIdx ]		

		local locatorName = string.format( "%s%d", self.effectInfo.main.bombLocatorPrefix, bombIdx )

		UI:AddChildAndLink( self, bombWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

		bombWnd:SetFriend( self.myTeam == self.DEFENDERS_TEAM )

	end

	for shieldIdx = 1, self.maxBombs do

		local shieldWnd = self.allShields[ shieldIdx ]

		local locatorName = string.format( "%s%d", self.effectInfo.main.shieldLocatorPrefix, shieldIdx )

		UI:AddChildAndLink( self, shieldWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

		shieldWnd:SetFriend( self.myTeam == self.DEFENDERS_TEAM )

	end

end


--
function UI.HudForcesInfoCloseDistWnd:UpdateBombs()

	local inverse = self.myTeam == self.DEFENDERS_TEAM

	local aliveBombSites = _G.CL_CloseDistanceGetAliveBombSites()
	for bombIdx = 1, self.maxBombs do
		local wndIdx = inverse and self.maxBombs - bombIdx + 1 or bombIdx
		local bombWnd = self.allBombs[ wndIdx ]
		local bAlive = UI:BitTst( aliveBombSites, bombIdx - 1 )
		bombWnd:Update( bAlive )
	end

	local aliveShields = _G.CL_CloseDistanceGetAliveShields()
	for bombIdx = 1, self.maxBombs do
		local wndIdx = inverse and self.maxBombs - bombIdx + 1 or bombIdx
		local shieldWnd = self.allShields[ wndIdx ]
		local bAlive = UI:BitTst( aliveShields, bombIdx - 1 )
		shieldWnd:Update( bAlive )
	end
end


--
function UI.HudForcesInfoCloseDistWnd:UpdateBomberStatus()

	local bBomber = UI:BitTst( _G.CL_BombTheBaseGetCarrier(), UI.HudWnd.localPlayerId )
	
	self:SetLayerVisible( bBomber, self.layers.BOMBER_STATUS_EFFECT )
	self:SetLayerVisible( bBomber, self.layers.BOMBER_STATUS )

end


-- ----------------------------------------------------------------
-- UI.HudForcesInfo_BombShieldWnd
-- ----------------------------------------------------------------

UI.HudForcesInfo_BombShieldWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.HudForcesInfo_BombShieldWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfo_BombShieldWnd",
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
				defName 			= "hud_forcesInfoBomb_shield",

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
function UI.HudForcesInfo_BombShieldWnd:Init()
end


--
function UI.HudForcesInfo_BombShieldWnd:SetFriend( bFriend )

	self.bFriend = bFriend

end


--
function UI.HudForcesInfo_BombShieldWnd:Update( bOn )

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

UI.HudForcesInfo_BombShieldWnd.layers =
{
	MAIN_EFFECT = 0
}

UI.HudForcesInfo_BombShieldWnd.effectInfo =
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

UI.HudForcesInfo_BombShieldWnd.animIdOnFriend		= -1
UI.HudForcesInfo_BombShieldWnd.animIdOffFriend		= -1
UI.HudForcesInfo_BombShieldWnd.animIdOnEnemy		= -1
UI.HudForcesInfo_BombShieldWnd.animIdOffEnemy		= -1
UI.HudForcesInfo_BombShieldWnd.bFriend				= false

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.HudForcesInfo_BombShieldWnd:F_PostLoad()

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