-- ----------------------------------------------------------------------------
--
-- Workfile: loadingscreen.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.LoadingScreen_game = {}
local ls = UI.LoadingScreen_game

-- ------------------------------
-- window definition
-- ------------------------------

UI.LoadingScreen_game.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "LoadingScreen_game",
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
				defName 			= "loadingScreen_game_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bg_2",
						layer		= "UI.LoadingScreen_game.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bg",
						layer		= "UI.LoadingScreen_game.layers.BG2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "warning",
						layer		= "UI.LoadingScreen_game.layers.LEVEL_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "tips",
						layer		= "UI.LoadingScreen_game.layers.TIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "loading",
						layer		= "UI.LoadingScreen_game.layers.PROGRESS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "description",
						layer		= "UI.LoadingScreen_game.layers.LEVEL_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1",
						layer		= "UI.LoadingScreen_game.layers.GAMEPLAY_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",
						layer		= "UI.LoadingScreen_game.layers.GAMEPLAY_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
				defName 			= "loadingScreen_game_levelBg",
				defaultAnimation	= "idle",
			}}
		},

		-- BG2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_shipSelectionBg",
				defaultAnimation	= "idle",
			}}
		},

		-- LEVEL_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- LEVEL_DESC
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_NOCLIP,
   			formatInfoSz = { 10, 3 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- TIP
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 5, 3 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.LoadingScreen_game.layers.PROGRESS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PROGRESS_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_loading"
		},

		-- GAMEPLAY_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 5, 3 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- GAMEPLAY_DESC
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 5, 3 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	},

	children =
	{
		"UI.LoadingScreen_PlayersWnd",
	}
}

-- ------------------------------
-- const
-- ------------------------------

ls.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
    BG2_EFFECT			= 2,
    LEVEL_NAME			= 3,
	LEVEL_DESC			= 4,
    TIP					= 5,
    PROGRESS_EFFECT		= 6,
    PROGRESS_TEXT		= 7,
	GAMEPLAY_NAME		= 8,
	GAMEPLAY_DESC		= 9,
}

ls.effectInfo =
{
	main =
	{
		tipLocator		= "tips",
		tipLabelLocator	= "tips_color",
	},

	bg =
	{
		bgSpriteName	= "ico",
	}
}

ls.strTipLabel = UI:GetStringByName( "loadingTipLabel" )

ls.MAX_TIPS = 151

-- ------------------------------
-- vars
-- ------------------------------

ls.level				= ""
ls.prevTipIdx			= -1
ls.tipColor				= UI.WHITE_COLOR
ls.tipLabelColor		= UI.WHITE_COLOR

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.LoadingScreen_game:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.tipColor		= mainEffect:GetObjColor( self.effectInfo.main.tipLocator )
		self.tipLabelColor	= mainEffect:GetObjColor( self.effectInfo.main.tipLabelLocator )
	end

end


--
function UI.LoadingScreen_game:Reset()

	UI.FullScreenWnd.Reset( self )

	self.level = ""

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if bgEffect then
		bgEffect:SetSpriteTexture( self.effectInfo.bg.bgSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.LEVEL_NAME )
	self:SetText( "", self.layers.LEVEL_DESC )
	self:SetText( "", self.layers.TIP )
	self:SetText( "", self.layers.GAMEPLAY_NAME )
	self:SetText( "", self.layers.GAMEPLAY_DESC )

	UI.LoadingScreen_PlayersWnd:UnlinkFromParent()

end


--
function UI.LoadingScreen_game:FullUpdate()

	self:Reset()

	self.level = UI:GetCurLevelName()

	self:UpdateLevelName()
	self:UpdateLevelDesc()
	self:UpdateLevelBg()
	self:SetRandomTip()
	self:UpdateGameplay()
	self:UpdatePlayersList()

end


--
function UI.LoadingScreen_game:UpdateLevelName()

	local str = UI:GetLevelLocalizedName( self.level )
	self:SetText( str, self.layers.LEVEL_NAME )
	
end


--
function UI.LoadingScreen_game:UpdateLevelDesc()

	local str = UI:GetLevelDescShort( self.level )
	self:SetText( str, self.layers.LEVEL_DESC )
	
end


--
function UI.LoadingScreen_game:UpdateLevelBg()

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if not bgEffect then
		return
	end

	local hTex = UI:GetLevelImage( self.level )
	bgEffect:SetSpriteTexture( self.effectInfo.bg.bgSpriteName, hTex )	

end


--
function UI.LoadingScreen_game:SetRandomTip()

	local randIdx = -1

	local MAX_TRIES = 3
	for try = 1, MAX_TRIES do

		local idx = math.random( 1, self.MAX_TIPS )		
		if idx ~= self.prevTipIdx or try == MAX_TRIES then
			randIdx = idx
			break
		end

	end

	local str = ""

	if randIdx ~= -1 then
		local strTip = UI:GetStringByName( string.format( "loadingTip_%d", randIdx ) )
		str = string.format( "%s%s: %s%s", UI:Color2Str( self.tipLabelColor ), self.strTipLabel, UI:Color2Str( self.tipColor ), strTip )
	end

	self:SetText( str, self.layers.TIP )

	self.prevTipIdx = randIdx

end


--
function UI.LoadingScreen_game:UpdateGameplay()

	local gameplay = cvars.sv_gameMode

	if gameplay ~= ai.Gameplay.FREE_SPACE and gameplay ~= ai.Gameplay.PVE_MISSION then

    	local gameplayName = UI:Gameplay2Str( gameplay, true )
    	self:SetText( gameplayName, self.layers.GAMEPLAY_NAME )

    	local gameplayDesc = UI:GetGameplayDesc( gameplay, true )
    	self:SetText( gameplayDesc, self.layers.GAMEPLAY_DESC )

	end

end


--
function UI.LoadingScreen_game:UpdatePlayersList()

	local bNeedPlayersList = cvars.sv_gameMode ~= ai.Gameplay.FREE_SPACE and not UI.Tutorial:IsActive()

	if bNeedPlayersList then
		self:AddChild( UI.LoadingScreen_PlayersWnd )
	else
		UI.LoadingScreen_PlayersWnd:UnlinkFromParent()
	end

end


-- ---------------------------------------------------------
-- UI.LoadingScreen_PlayersWnd
-- ---------------------------------------------------------

UI.LoadingScreen_PlayersWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "PlayersWnd",

    	props =
    	{
    		name			= "LoadingScreen_PlayersWnd",
    	},
    },

	mode = UI.PlayersWnd.modes.LOADING_SCREEN,

	GetGameplay = function( self )
		return cvars.sv_gameMode
	end
}


-- --------------------------------------------------------------------------------------
-- UI.LoadingScreen_sys
-- --------------------------------------------------------------------------------------

UI.LoadingScreen_sys = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.LoadingScreen_sys.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "LoadingScreen_sys",
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
				defName 			= "loadingScreen_sys_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "loading",
						layer		= "UI.LoadingScreen_sys.layers.PROGRESS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.LoadingScreen_sys.layers.PROGRESS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PROGRESS_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_loading"
		},
	},
}


-- -----------------------------------
-- const
-- -----------------------------------

UI.LoadingScreen_sys.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
    PROGRESS_EFFECT		= 2,
    PROGRESS_TEXT		= 3,
}

UI.LoadingScreen_hangar = {}
local lsh = UI.LoadingScreen_hangar

-- ------------------------------
-- window definition
-- ------------------------------

UI.LoadingScreen_hangar.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "LoadingScreen_hangar",
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
				defName 			= "loadingScreen_game_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bg_2",
						layer		= "UI.LoadingScreen_hangar.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bg",
						layer		= "UI.LoadingScreen_hangar.layers.BG2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "warning",
						layer		= "UI.LoadingScreen_hangar.layers.LEVEL_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "tips",
						layer		= "UI.LoadingScreen_hangar.layers.TIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "loading",
						layer		= "UI.LoadingScreen_hangar.layers.PROGRESS_EFFECT",
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
				defName 			= "loadingScreen_game_levelBg",
				defaultAnimation	= "idle",
			}}
		},

		-- BG2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_shipSelectionBg",
				defaultAnimation	= "idle",
			}}
		},

		-- LEVEL_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- TIP
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 5, 3 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.LoadingScreen_hangar.layers.PROGRESS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PROGRESS_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_loading"
		},
	},
}


-- ------------------------------
-- const
-- ------------------------------

lsh.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
    BG2_EFFECT			= 2,
    LEVEL_NAME			= 3,
    TIP					= 4,
    PROGRESS_EFFECT		= 5,
    PROGRESS_TEXT		= 6,
}

lsh.effectInfo =
{
	main =
	{
		tipLocator		= "tips",
		tipLabelLocator	= "tips_color",
	},

	bg =
	{
		bgSpriteName	= "ico",
	}
}

lsh.strTipLabel = ls.strTipLabel

lsh.MAX_TIPS = ls.MAX_TIPS

-- ------------------------------
-- vars
-- ------------------------------

lsh.level			= ""
lsh.prevTipIdx		= -1
lsh.tipColor		= UI.WHITE_COLOR
lsh.tipLabelColor	= UI.WHITE_COLOR

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.LoadingScreen_hangar:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.tipColor		= mainEffect:GetObjColor( self.effectInfo.main.tipLocator )
		self.tipLabelColor	= mainEffect:GetObjColor( self.effectInfo.main.tipLabelLocator )
	end

end


--
function UI.LoadingScreen_hangar:Reset()

	UI.FullScreenWnd.Reset( self )

	self.level = ""

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if bgEffect then
		bgEffect:SetSpriteTexture( self.effectInfo.bg.bgSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.LEVEL_NAME )
	self:SetText( "", self.layers.TIP )

end


--
function UI.LoadingScreen_hangar:FullUpdate()

	self:Reset()

	self.level = UI:GetCurLevelName()

	self:UpdateLevelName()
	self:UpdateLevelBg()
	self:SetRandomTip()

end


--
function UI.LoadingScreen_hangar:UpdateLevelName()

	local str = UI:GetLevelLocalizedName( self.level )
	self:SetText( str, self.layers.LEVEL_NAME )
	
end


--
function UI.LoadingScreen_hangar:UpdateLevelBg()

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if not bgEffect then
		return
	end

	local hTex = UI:GetLevelImage( self.level )
	bgEffect:SetSpriteTexture( self.effectInfo.bg.bgSpriteName, hTex )	

end


--
function UI.LoadingScreen_hangar:SetRandomTip()

	local randIdx = -1

	local MAX_TRIES = 3
	for try = 1, MAX_TRIES do

		local idx = math.random( 1, self.MAX_TIPS )		
		if idx ~= self.prevTipIdx or try == MAX_TRIES then
			randIdx = idx
			break
		end

	end

	local str = ""

	if randIdx ~= -1 then
		local strTip = UI:GetStringByName( string.format( "loadingTip_%d", randIdx ) )
		str = string.format( "%s%s: %s%s", UI:Color2Str( self.tipLabelColor ), self.strTipLabel, UI:Color2Str( self.tipColor ), strTip )
	end

	self:SetText( str, self.layers.TIP )

	self.prevTipIdx = randIdx

end