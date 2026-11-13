-- ----------------------------------------------------------------------------
--
-- Workfile: hudgameplayinfownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudPvpGameplayInfoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudPvpGameplayInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudPvpGameplayInfoWnd",
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
				defName 			= "hud_pvpGameplayInfo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value28",
						layer		= "UI.HudPvpGameplayInfoWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "info",
						layer		= "UI.HudPvpGameplayInfoWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn",
						wnd			= "UI.HudPvpGameplayInfo_StateBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},   

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		}, 
	},

	children = { "UI.HudPvpGameplayInfo_StateBtn" }
}

-- ------------------------------
-- const
-- ------------------------------

UI.HudPvpGameplayInfoWnd.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
    DESC		= 2,
}

UI.HudPvpGameplayInfoWnd.bDefaultOpen	= true

UI.HudPvpGameplayInfoWnd.effectInfo =
{
	main =
	{
		sizeLocator_open	= "self",
		sizeLocator_closed	= "self_2",
		descLocator			= "info",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudPvpGameplayInfoWnd.bOpen			= false
UI.HudPvpGameplayInfoWnd.stateBtn		= nil
UI.HudPvpGameplayInfoWnd.heightClosed	= 0
UI.HudPvpGameplayInfoWnd.space_desc_btm	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudPvpGameplayInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.stateBtn = UI.HudPvpGameplayInfo_StateBtn
	
	self:PrepareLayout()

end


--
function UI.HudPvpGameplayInfoWnd:Reset()

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.DESC )

	self.bOpen = false
	self:SetLayerVisible( false, self.layers.DESC )
	self.stateBtn:Check( true )

end


--
function UI.HudPvpGameplayInfoWnd:FullUpdate()

	self:Reset()

	self:ValidateState()

	self:UpdateName()
	self:UpdateDesc()

end


--
function UI.HudPvpGameplayInfoWnd:SetState( bOpen )

	self.bOpen = bOpen

	self:SetLayerVisible( bOpen, self.layers.DESC )
	self.stateBtn:Check( not bOpen )

	self:SaveState()
	
	self:RecalcLayout()

end


--
function UI.HudPvpGameplayInfoWnd:ToggleState()

	self:SetState( not self.bOpen )

end


--
function UI.HudPvpGameplayInfoWnd:ValidateState()

	if not self:RestoreState() then
		self:SetDefaultState()
	end

end


--
function UI.HudPvpGameplayInfoWnd:RestoreState()

	local profile = _G.GetProfileTable()

	local bOpen = nil

	if type( profile.hudGameplayInfoState ) == "table" then

		local gameplay = _G.GetCurrentGameMode()
		local gameplayName = UI:Val2Key( ai.Gameplay, gameplay )

		if gameplayName ~= "" then

			bOpen = profile.hudGameplayInfoState[ gameplayName ]
			if type( bOpen ) ~= "boolean" then
				bOpen = nil
			end

		end
		
	end

	if bOpen ~= nil then
		self:SetState( bOpen )
		return true
	else
		return false
	end

end


--
function UI.HudPvpGameplayInfoWnd:SaveState()

	local gameplay = _G.GetCurrentGameMode()
	local gameplayName = UI:Val2Key( ai.Gameplay, gameplay )

	if gameplayName == "" then
		return
	end

	local profile = _G.GetProfileTable()

	local bSavedOpen = nil

	if type( profile.hudGameplayInfoState ) == "table" then
		bSavedOpen = profile.hudGameplayInfoState[ gameplayName ]
	end

	if self.bOpen ~= bSavedOpen then

		if type( profile.hudGameplayInfoState ) ~= "table" then
			profile.hudGameplayInfoState = {}
		end

		profile.hudGameplayInfoState[ gameplayName ] = self.bOpen
		_G.Profile:Save()

	end

end


--
function UI.HudPvpGameplayInfoWnd:SetDefaultState()

	self:SetState( self.bDefaultOpen )

end


--
function UI.HudPvpGameplayInfoWnd:UpdateName()

	local gameplay = _G.GetCurrentGameMode()

	local str = UI:Gameplay2Str( gameplay, false )
	self:SetText( str, self.layers.NAME )

end


--
function UI.HudPvpGameplayInfoWnd:UpdateDesc()

	local gameplay = _G.GetCurrentGameMode()

	local str = UI:GetGameplayDesc2( gameplay )
	self:SetText( str, self.layers.DESC )
	
	self:RecalcLayout()

end


--
function UI.HudPvpGameplayInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end


--
function UI.HudPvpGameplayInfoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.stateBtn then
		self:ToggleState()
	end

	return true

end


--
function UI.HudPvpGameplayInfoWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selfSizeOpen		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.sizeLocator_open ) or UI:ZeroVec2()
	local selfSizeClosed	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.sizeLocator_closed ) or UI:ZeroVec2()
	local descPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.descLocator ) or UI:ZeroVec2()
	local descSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or UI:ZeroVec2()

	self.heightClosed	= selfSizeClosed.y
	self.space_desc_btm	= selfSizeOpen.y - ( descPos.y + descSize.y )

	self:SetWidth( selfSizeOpen.x )
	self:SetLayerWidth( descSize.x, self.layers.DESC ) 

end


--
function UI.HudPvpGameplayInfoWnd:RecalcLayout()

	if self.bOpen then

		-- описание (высота)

    	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 10000000 )

        local descHeight = _G.MeasureText(
       		self:GetText( self.layers.DESC ),
       		self:GetFont( self.layers.DESC ),
        	formatRect,
       		self:GetTextFormatFlags( self.layers.DESC ),
        	formatRect ).w

		self:SetLayerHeight( descHeight, self.layers.DESC )

		-- собственная высота

		local selfHeight = self:GetLayerTop( self.layers.DESC  ) + descHeight + self.space_desc_btm
		self:SetHeight( selfHeight )

	else
		self:SetHeight( self.heightClosed )
	end

	UI.HudWnd:OnPvpGameplayInfoSizeChanged()

end


-- ----------------------------------------------------------
-- UI.HudPvpGameplayInfo_StateBtn
-- ----------------------------------------------------------

UI.HudPvpGameplayInfo_StateBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "HudPvpGameplayInfo_StateBtn",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.checkBox,
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
    				defName 			= "hud_questTracker_stateBtn",

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

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "close_idle",
    		animationSelect		= "close_over",
    		animationPressed	= "close_over",
    		animationDisabled	= "close_idle",
    	},

    	main_checked =
    	{
    		animationIdle 		= "open_idle",
    		animationSelect		= "open_over",
    		animationPressed	= "open_over",
    		animationDisabled	= "open_idle",
    	},
    }
}