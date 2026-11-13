-- ----------------------------------------------------------------------------
--
-- Workfile: warthunderpromownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.WarThunderPromoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.WarThunderPromoWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "WarThunderPromoWnd",
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
				defName 			= "help_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "wtsc_win",
						layer		= "UI.WarThunderPromoWnd.layers.WORK_EFFECT",
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
				defName 			= "warThunderPromo_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "btn_1_2",
						wnd			= "UI.WarThunderPromo_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		}
	},

	children = { "UI.WarThunderPromo_CloseBtn" }
}

-- -------------------------------
-- const
-- -------------------------------

UI.WarThunderPromoWnd.layers =
{
	MAIN_EFFECT	= 0,
	WORK_EFFECT	= 1,
}

UI.WarThunderPromoWnd.effectInfo =
{
	work =
	{
		bgSpriteName	= "ico",
	}
}

UI.WarThunderPromoWnd.texPath			= "ui/locale/%s/textures/warthunderpromo"		-- вместо %s будет подставлен язык
UI.WarThunderPromoWnd.defaultTexName	= "NoData"

-- -------------------------------
-- vars
-- -------------------------------

UI.WarThunderPromoWnd.hOriginalTex	= UI.INVALID_RESOURCE_HANDLE
UI.WarThunderPromoWnd.hDefaultTex	= UI.INVALID_RESOURCE_HANDLE

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.WarThunderPromoWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	self.hOriginalTex	= workEffect:GetSpriteTexture( self.effectInfo.work.bgSpriteName )
	self.hDefaultTex	= UI:GetTex( self.defaultTexName )

end


--
function UI.WarThunderPromoWnd:FullUpdate()

	self:UpdateBg()

end


--
function UI.WarThunderPromoWnd:UpdateBg()

	self:ReleaseBg()
	self:LoadBg()

end


--
function UI.WarThunderPromoWnd:LoadBg()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local language = UI:GetLanguage()
	local path = string.format( self.texPath, language )

	local hTex = UI:LoadTexture( "warThunderPromo", path, UI:ZeroQuat() )

	if hTex == UI.INVALID_RESOURCE_HANDLE then

		local defaultLanguage = "ENGLISH"

		if language == "RUSSIAN" or language == defaultLanguage then
			sys.log( "UI.WarThunderPromoWnd:UpdateBg()[ERROR]: cannot load texture \"%s\"", path )

		else
			
			local defaultPath = string.format( self.texPath, defaultLanguage )
			hTex = UI:LoadTexture( "warThunderPromo", defaultPath, UI:ZeroQuat() )

			if hTex == UI.INVALID_RESOURCE_HANDLE then
				sys.log( "UI.WarThunderPromoWnd:UpdateBg()[ERROR]: cannot load texture \"%s\"", path )
			end

		end

	end

	if hTex == UI.INVALID_RESOURCE_HANDLE then
		hTex = self.hDefaultTex
	end

	workEffect:SetSpriteTexture( self.effectInfo.work.bgSpriteName, hTex )

end


--
function UI.WarThunderPromoWnd:ReleaseBg()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local hTex = workEffect:GetSpriteTexture( self.effectInfo.work.bgSpriteName )

	if hTex ~= UI.INVALID_RESOURCE_HANDLE then

		workEffect:SetSpriteTexture( self.effectInfo.work.bgSpriteName, UI.INVALID_RESOURCE_HANDLE )

		if hTex ~= self.hOriginalTex and hTex ~= self.hDefaultTex then
    		UI:UnloadTexture( hTex, true )
		end

	end

end


--
function UI.WarThunderPromoWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	UI.bShowWarThunderPromo = false

end


--
function UI.WarThunderPromoWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	self:ReleaseBg()

end


--
function UI.WarThunderPromoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.WarThunderPromo_CloseBtn then
		self:Hide()
	end

	return true

end

-- ------------------------------------
-- UI.WarThunderPromo_CloseBtn
-- ------------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.WarThunderPromo_CloseBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "WarThunderPromo_CloseBtn",
    		selectSound	= UI.MsgBox.sounds.btnMouseOver,
    	},

    	layers =
    	{
    		numLayers = l_numBaseBtnLayers + 1,

    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName 			= "warThunderPromo_closeBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "value",
    						layer		= "UI.WarThunderPromo_CloseBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},

    		-- TEXT
    		{
    			id				= l_numBaseBtnLayers,

    			layerType		= UI.LAYER_TEXT,
       			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz	= { 1, 1 },
       			font			= { fontName = "Small" },
    			text			= UI:GetStringByName( "close" ),
    		}, 
    	}
    },

	layers =
	{
		MAIN_EFFECT	= 0,
		DEBUG		= 1,
		TEXT		= 2,
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "idle",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
    }
}