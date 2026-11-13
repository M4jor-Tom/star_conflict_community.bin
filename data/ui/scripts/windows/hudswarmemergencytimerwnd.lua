-- -------------------------------------------------------------------------
-- UI.HudSwarmEmergencyTimerWnd
-- -------------------------------------------------------------------------

UI.HudSwarmEmergencyTimerWnd = {}
local lb = UI.HudSwarmEmergencyTimerWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudSwarmEmergencyTimerWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudSwarmEmergencyTimerWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
		rectAbs	= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "hud_warnings_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "outward",
						layer		= "UI.HudSwarmEmergencyTimerWnd.layers.WORK_EFFECT",
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
				defName 			= "hud_warnings_leaveBattleField",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_outl",
						layer		= "UI.HudSwarmEmergencyTimerWnd.layers.TEXT_1_OUTL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text",
						layer		= "UI.HudSwarmEmergencyTimerWnd.layers.TEXT_1",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_outl_2",
						layer		= "UI.HudSwarmEmergencyTimerWnd.layers.TEXT_2_OUTL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_2",
						layer		= "UI.HudSwarmEmergencyTimerWnd.layers.TEXT_2",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "timer_outl_1",
						layer		= "UI.HudSwarmEmergencyTimerWnd.layers.TIMER_OUTL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "timer_1",
						layer		= "UI.HudSwarmEmergencyTimerWnd.layers.TIMER",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT_1_OUTL
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
			text = "^warning_swarmEmergencyTimerText1",
		},
	
		-- TEXT_1
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
			text = "^warning_swarmEmergencyTimerText1",
		},
	
		-- TEXT_2_OUTL
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
			text = "^warning_swarmEmergencyTimerText2",
		},
	
		-- TEXT_2
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
			text = "^warning_swarmEmergencyTimerText2",
		},
	
		-- TIMER_OUTL
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		}, 
	
		-- TIMER
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},
	}
}

-- ------------------------------
-- const
-- ------------------------------

lb.layers =
{
	MAIN_EFFECT	= 0,
	WORK_EFFECT	= 1,
	TEXT_1_OUTL	= 2,
	TEXT_1		= 3,
	TEXT_2_OUTL	= 4,
	TEXT_2		= 5,
	TIMER_OUTL	= 6,
	TIMER		= 7,
}

-- ------------------------------
-- vars
-- ------------------------------

lb.timer	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudSwarmEmergencyTimerWnd:Reset()

	self:AddStyle( UI.WS_NOT_DRAW )

	self.timer = -1

	self:SetText( "", self.layers.TIMER_OUTL )
	self:SetText( "", self.layers.TIMER )

end


--
function UI.HudSwarmEmergencyTimerWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end


--
function UI.HudSwarmEmergencyTimerWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()

end


--
function UI.HudSwarmEmergencyTimerWnd:FullUpdate()
	
	local myShip = UI.HudWnd.myShip
	local swarm = ( myShip and myShip:IsRemoteSwarmMode() ) and myShip:GetSwarm()
	
	-- приоритет таймеров и ворнингов:
	-- SC-111359#focus=streamItem-4-576913.0-0
	
	local timer = swarm and swarm:GetEmergencyTimer() or -1	

	if math.abs( timer - self.timer ) < 1e-2 then
		return
	end

	self.timer = timer

	if timer == -1 then
		self:AddStyle( UI.WS_NOT_DRAW )
	else
		self:RemoveStyle( UI.WS_NOT_DRAW )

		local strTimer = UI:Time2Str51( timer )
		self:SetText( strTimer, self.layers.TIMER_OUTL )
		self:SetText( strTimer, self.layers.TIMER )
	end

end