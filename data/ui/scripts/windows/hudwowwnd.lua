-- ----------------------------------------------------------------------------
--
-- Workfile: hudwowwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudWowWnd = {}
local hw = UI.HudWowWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudWowWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudWowWnd",
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
				defName 			= "hud_wow",

				links =
				{
					{
						objName		= "text_outl",
						layer		= "UI.HudWowWnd.layers.TEXT_OUTL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text",
						layer		= "UI.HudWowWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}		
			}}
		},   

		-- TEXT_OUTL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- TEXT
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
-- interface functions
-- ------------------------------

--
function UI.HudWowWnd:ShowMsg( strId, bGood, priority, params, time )

	if not self:IsOnScreen() then
		return
	end

	if type( strId ) ~= "string" then
		sys.log( "UI.HudWowWnd:ShowMsg()[ERROR]: invalid type of the 1-st parameter (\"strId\"); \"string\" expected, got \"%s\"", type( strId ) )
		return
	end

	if type( bGood ) ~= "boolean" then
		sys.log( "UI.HudWowWnd:ShowMsg()[ERROR]: invalid type of the 2-nd parameter (\"bGood\"); \"boolean\" expected, got \"%s\"", type( bGood ) )
		return
	end

	if type( priority ) ~= "number" then
		sys.log( "UI.HudWowWnd:ShowMsg()[ERROR]: invalid type of the 3-rd parameter (\"priority\"); \"number\" expected, got \"%s\"", type( priority ) )
		return
	end

	if priority < 0 then
		sys.log( "UI.HudWowWnd:ShowMsg()[ERROR]: negative prioriry is not valid" )
		return
	end

	if self.priority >= priority then
		return
	end

	if params ~= nil then
		if type( params ) ~= "table" then
			sys.log( "UI.HudWowWnd:ShowMsg()[ERROR]: invalid type of the 4-nd parameter (\"params\") for msg %s; \"table\" or nil expected, got \"%s\"", strId, type( params ) )
			return
		end
	end

	if time ~= nil then
    	if type( time ) ~= "number" then
    		sys.log( "UI.HudWowWnd:ShowMsg()[ERROR]: invalid type of the 5-th parameter (\"time\"); \"number\" or \"nil\" expected, got \"%s\"", type( time ) )
    		time = nil
    	end
	end

	if time == nil or time == -1 then
		time = self.MAX_TIME
	end

	local msgType = bGood and self.msgTypes.GOOD or self.msgTypes.BAD

	self:SetMsgInternal( strId, msgType, priority, params, time )
	self:Show()

end


-- ------------------------------
-- const
-- ------------------------------

hw.layers =
{
    MAIN_EFFECT		= 0,
	TEXT_OUTL		= 1,
	TEXT			= 2,
}

hw.msgTypes =
{
	GOOD	= 1,
	BAD		= 2,
}

hw.effectInfo =
{
	main =
	{
		msgType2Anim =
		{
			[ hw.msgTypes.GOOD ]	= "friend",
			[ hw.msgTypes.BAD ]		= "enemy",
		}
	}
}


hw.MAX_TIME	= 5

-- ------------------------------
-- vars
-- ------------------------------

hw.priority		= -1
hw.timer		= -1
hw.params		= nil
hw.time			= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudWowWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )

end


--
function UI.HudWowWnd:SetMsgInternal( strId, msgType, priority, params, time )

	local str = UI:SubstituteHudMsgParams( strId, params )

	self:SetText( str, self.layers.TEXT )
	self:SetText( str, self.layers.TEXT_OUTL )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local anim = self.effectInfo.main.msgType2Anim[ msgType ]
		if anim then
			if mainEffect:GetCurAnimation() ~= anim then
				mainEffect:StartAnimation( anim )
			end
		else
			sys.log( "UI.HudWowWnd:SetMsgInternal()[ERROR]: cannot find animation for msg type %s", UI:Val2Key( self.msgTypes, msgType ) )
		end
	end

	self.priority	= priority
	self.params		= params
	self.time		= time

	self.timer		= self.time

end


--
function UI.HudWowWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.timer ~= -1 then
		self:UpdateTimer( dt_sys )
	end

end


--
function UI.HudWowWnd:UpdateTimer( dt )

	if self.timer ~= -1 then
		self.timer = self.timer - dt
		if self.timer <= 0 then
			self:Reset()
		end
	end

end


--
function UI.HudWowWnd:Hide()

	self:AddStyle( UI.WS_NOT_DRAW )

end


--
function UI.HudWowWnd:Show()

	self:RemoveStyle( UI.WS_NOT_DRAW )

end


--
function UI.HudWowWnd:Reset()

	self:Hide()

	self:SetText( "", self.layers.TEXT )
	self:SetText( "", self.layers.TEXT_OUTL )

	self.priority	= -1
	self.timer		= -1
	self.params		= nil
	self.time		= -1

end


--
function UI.HudWowWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	-- резет нельзя вызывать в F_OnAfterShowOnScreen() или в F_OnAfterHideOnScreen() т.к. при любом переключении модов все элементы сначала отлинковываются,
	-- даже если в новом моде элемент по прежнему нужен

	if not self:IsOnScreen() then
		self:Reset()
	end

end