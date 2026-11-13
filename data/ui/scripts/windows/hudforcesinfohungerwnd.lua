-- ---------------------------------------------------------------------------
-- UI.HudForcesInfoHungerWnd
-- ---------------------------------------------------------------------------

UI.HudForcesInfoHungerWnd = {}
local fi = UI.HudForcesInfoHungerWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoHungerWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoHungerWnd",
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
				defName 			= "hud_forcesInfoHunger_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoHungerWnd.layers.NUM_PLAYERS",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "text",
						layer		= "UI.HudForcesInfoHungerWnd.layers.TIMER",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- NUM_PLAYERS
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
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
-- const
-- ------------------------------

UI.HudForcesInfoHungerWnd.layers =
{
	MAIN_EFFECT		= 0,
	NUM_PLAYERS		= 1,
	TIMER			= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoHungerWnd.strPlayersLabel	= ""

UI.HudForcesInfoHungerWnd.numPlayers		= nil
UI.HudForcesInfoHungerWnd.maxPlayers		= nil
UI.HudForcesInfoHungerWnd.bIsDead			= nil
UI.HudForcesInfoHungerWnd.timer				= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoHungerWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self.strPlayersLabel = UI:GetStringByName( "hud_forcesInfo_hungerGames_players" )

end


--
function UI.HudForcesInfoHungerWnd:Reset()

	self.numPlayers	= nil
	self.maxPlayers	= nil
	self.bIsDead	= nil
	self.timer		= nil
	
	self:SetText( "", self.layers.NUM_PLAYERS )
	self:SetText( "", self.layers.TIMER )
	
end


--
function UI.HudForcesInfoHungerWnd:FullUpdate()	
	
	self:UpdatePlayers()
	self:UpdateTimer()
	
end


--
function UI.HudForcesInfoHungerWnd:UpdatePlayers()
	
	local numPlayers, maxPlayers = _G.CL_GetNumSurvivors()
	if type( numPlayers ) ~= "number" then
		numPlayers = 0
	end
	if type( maxPlayers ) ~= "number" then
		maxPlayers = 0
	end
	
	local bIsDead = false
	if UI.HudWnd:GetMode() ~= UI.HudWnd.modes.SELECT_SHIP then
		local myShip = UI.HudWnd.myShip
		bIsDead = not myShip or myShip:IsDead()
	end	

	if numPlayers == self.numPlayers and maxPlayers == self.maxPlayers and bIsDead == self.bIsDead then
		return
	end
	
	local str = string.format( "%s: %s%d/%d", self.strPlayersLabel, bIsDead and UI:Color2Str( UI.RED_COLOR ) or "", numPlayers, maxPlayers )
	self:SetText( str, self.layers.NUM_PLAYERS )
	
	self.numPlayers	= numPlayers
	self.maxPlayers	= maxPlayers
	self.bIsDead	= bIsDead

end


--
function UI.HudForcesInfoHungerWnd:UpdateTimer()

	local timer = _G.CL_GetPhaseTimeRemaining()
	if type( timer ) ~= "number" then
		timer = 0
	end
	
	timer = UI:Round( timer )
	
	if timer == self.timer then
		return
	end
	
	local str = ""
	if timer > 0 then
		str = string.format( "%d %s", timer, UI.strSecs )
	end
	
	self:SetText( str, self.layers.TIMER )
	
	self.timer = timer
	
end


--
function UI.HudForcesInfoHungerWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()

end


--
function UI.HudForcesInfoHungerWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Reset()

end