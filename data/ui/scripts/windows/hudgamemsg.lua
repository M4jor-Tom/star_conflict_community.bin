-- ----------------------------------------------------------------------------
--
-- Workfile: hudgamemsg.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudGameMsg = {}
local tm = UI.HudGameMsg

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudGameMsg.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudGameMsg",
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
				defName 			= "hud_gameMsg",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.HudGameMsg.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}		
			}}
		},   

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_NOCLIP,
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
function UI.HudGameMsg:ShowMsg( strId, params )

	if type( strId ) ~= "string" then
		sys.log( "UI.HudGameMsg:ShowMsg()[ERROR]: invalid type of the 1-st parameter (\"strId\"); \"string\" expected, got \"%s\"", type( strId ) )
		return
	end

	if strId == "" then
		sys.log( "UI.HudGameMsg:ShowMsg()[ERROR]: empty string id" )
		return
	end

	if params ~= nil then

		if type( params ) ~= "table" then
			sys.log( "UI.HudGameMsg:ShowMsg()[ERROR]: invalid type of the 2-nd parameter (\"params\") for msg %s; \"table\" or nil expected, got \"%s\"", strId, type( params ) )
			return
		end
	end

	self.strId = strId
	self.params = params

	self:FullUpdate()

end


--
function UI.HudGameMsg:HideMsg()

	self:Reset()

end


--
function UI.HudGameMsg:Reset()

	self.strId				= ""
	self.params				= nil
	self.bHasInternalColor	= false

	self:SetText( "", self.layers.TEXT )
	self:Hide()

end


--
function UI.HudGameMsg:GetTextColor()

	return self:GetColor( self.layers.TEXT )

end


-- ------------------------------
-- const
-- ------------------------------

tm.layers =
{
    MAIN_EFFECT		= 0,
	TEXT			= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

tm.strId				= ""
tm.params				= nil
tm.bHasInternalColor	= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudGameMsg:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.HudGameMsg:FullUpdate()

	local strId = self.strId
	local params = self.params

	self:Reset()

	self.strId = strId
	self.params = params

	if self.strId == "" then
		return
	end

	local str	= UI:SubstituteHudMsgParams( self.strId, self.params )
	local alpha	= UI:GetAlpha( self:GetColor( self.layers.TEXT ) )

	local strWithAlpha = _G.SetInternalTextAlpha( str, alpha )
	if strWithAlpha then
		self.bHasInternalColor = true
	else
		strWithAlpha = str
	end

	self:SetText( strWithAlpha, self.layers.TEXT )

	self:Show()

end


--
function UI.HudGameMsg:Hide()

	self:AddStyle( UI.WS_NOT_DRAW )

end


--
function UI.HudGameMsg:Show()

	self:RemoveStyle( UI.WS_NOT_DRAW )

end


--
function UI.HudGameMsg:F_OnEventSaveUiState()

	if UI.HudWnd:IsOnScreen() then
		UI.store.HudGameMsg =
		{
			strId	= self.strId,
			params	= self.params,
		}
	end

end


--
function UI.HudGameMsg:F_OnEventRestoreUiState()

	if UI.store.HudGameMsg then

		self.strId	= UI.store.HudGameMsg.strId
		self.params	= UI.store.HudGameMsg.params

		self:FullUpdate()

	end

end


--
function UI.HudGameMsg:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTextAlpha()

end


--
function UI.HudGameMsg:UpdateTextAlpha()

	if self:HasStyle( UI.WS_NOT_DRAW ) then
		return
	end

	if not self.bHasInternalColor then
		return
	end

	local alpha = UI:GetAlpha( self:GetColor( self.layers.TEXT ) )

	local text = _G.SetInternalTextAlpha( self:GetText( self.layers.TEXT ), alpha )
	if text then
		self:SetText( text, self.layers.TEXT )
	end	

end