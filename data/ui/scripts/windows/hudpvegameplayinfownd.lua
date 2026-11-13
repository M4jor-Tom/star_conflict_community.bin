-- ----------------------------------------------------------------------------
--
-- Workfile: hudpvegameplayinfownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudPveGameplayInfoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudPveGameplayInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudPveGameplayInfoWnd",
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
						objName		= "value28",
						layer		= "UI.HudPveGameplayInfoWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					-- не линкуется по размеру
					{
						objName		= "info",
						layer		= "UI.HudPveGameplayInfoWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn",
						wnd			= "UI.HudPveGameplayInfo_StateBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},   

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hud_pveGameplayInfo_caption" ),
		}, 

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		}, 
	},

	children = { "UI.HudPveGameplayInfo_StateBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudPveGameplayInfoWnd:GetMaxHeight()

	local maxHeight = 0

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		maxHeight = mainEffect:GetObjSize( "self" ).y
	end

	return maxHeight

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudPveGameplayInfoWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    DESC		= 2,
}

UI.HudPveGameplayInfoWnd.bDefaultOpen	= true

UI.HudPveGameplayInfoWnd.effectInfo =
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

UI.HudPveGameplayInfoWnd.bOpen			= false
UI.HudPveGameplayInfoWnd.stateBtn		= nil
UI.HudPveGameplayInfoWnd.missionName	= ""
UI.HudPveGameplayInfoWnd.round			= -1
UI.HudPveGameplayInfoWnd.phase			= -1
UI.HudPveGameplayInfoWnd.heightClosed	= 0
UI.HudPveGameplayInfoWnd.space_desc_btm	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudPveGameplayInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.stateBtn = UI.HudPveGameplayInfo_StateBtn

	self:PrepareLayout()

end


--
function UI.HudPveGameplayInfoWnd:Reset()

	self:SetText( "", self.layers.DESC )

	self.bOpen = false
	self:SetLayerVisible( false, self.layers.DESC )
	self.stateBtn:Check( true )

	self.missionName	= ""
	self.round			= -1
	self.phase			= -1

end


--
function UI.HudPveGameplayInfoWnd:FullUpdate()

	self:Reset()

	self:ValidateState()

	self:UpdateMissionName()
	self:UpdateRound()
	self:UpdatePhase()

	self:UpdateDesc()

end


--
function UI.HudPveGameplayInfoWnd:SetState( bOpen )

	self.bOpen = bOpen

	self:SetLayerVisible( bOpen, self.layers.DESC )
	self.stateBtn:Check( not bOpen )

	self:SaveState()

	self:RecalcLayout()

end


--
function UI.HudPveGameplayInfoWnd:ToggleState()

	self:SetState( not self.bOpen )

end


--
function UI.HudPveGameplayInfoWnd:ValidateState()

	if not self:RestoreState() then
		self:SetDefaultState()
	end

end


--
function UI.HudPveGameplayInfoWnd:RestoreState()

	local profile = _G.GetProfileTable()

	local bOpen = nil

	if self.missionName ~= "" and self.round ~= -1 and self.phase ~= -1 then

    	if type( profile.hudPveGameplayInfoState ) == "table" then

			local fieldName = string.format( "%s_%d_%d", self.missionName, self.round, self.phase )

			bOpen = profile.hudPveGameplayInfoState[ fieldName ]
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
function UI.HudPveGameplayInfoWnd:SaveState()

	if self.missionName == "" or self.round == -1 or self.phase == -1 then
		return
	end

	local fieldName = string.format( "%s_%d_%d", self.missionName, self.round, self.phase )

	local profile = _G.GetProfileTable()

	local bSavedOpen = nil

	if type( profile.hudPveGameplayInfoState ) == "table" then
		bSavedOpen = profile.hudPveGameplayInfoState[ fieldName ]
	end

	if self.bOpen ~= bSavedOpen then

		if type( profile.hudPveGameplayInfoState ) ~= "table" then
			profile.hudPveGameplayInfoState = {}
		end

		profile.hudPveGameplayInfoState[ fieldName ] = self.bOpen
		_G.Profile:Save()

	end

end


--
function UI.HudPveGameplayInfoWnd:SetDefaultState()

	self:SetState( self.bDefaultOpen )

end


--
function UI.HudPveGameplayInfoWnd:UpdateDesc()

	local gameplay = _G.GetCurrentGameMode()

	local str = UI:GetPveGameplayDesc( self.missionName, self.round, self.phase )
	self:SetText( str, self.layers.DESC )

	self:RecalcLayout()

end


--
function UI.HudPveGameplayInfoWnd:UpdateMissionName()

	self.missionName = _G.CL_PveGetMissionName()

end


--
function UI.HudPveGameplayInfoWnd:UpdateRound()

	local maxRounds = 0
	self.round, maxRounds = _G.CL_PveGetMissionRound()

end


--
function UI.HudPveGameplayInfoWnd:UpdatePhase()

	self.phase = _G.CL_PveGetMissionPhase()

end


--
function UI.HudPveGameplayInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end


--
function UI.HudPveGameplayInfoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

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
function UI.HudPveGameplayInfoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldRound = self.round
	local oldPhase = self.phase

	self:UpdateRound()
	self:UpdatePhase()

	if self.round ~= oldRound or self.phase ~= oldPhase then
		self:UpdateDesc()
	end

end


--
function UI.HudPveGameplayInfoWnd:PrepareLayout()

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
function UI.HudPveGameplayInfoWnd:RecalcLayout()

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

	UI.HudWnd:OnPveGameplayInfoSizeChanged()

end


-- ----------------------------------------------------------
-- UI.HudPveGameplayInfo_StateBtn
-- ----------------------------------------------------------

UI.HudPveGameplayInfo_StateBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "HudPveGameplayInfo_StateBtn",
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