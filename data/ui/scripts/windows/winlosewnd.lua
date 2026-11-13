-- ----------------------------------------------------------------------------
--
-- Workfile: winlosewnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.WinLoseWnd = {}
local wl = UI.WinLoseWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.WinLoseWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "WinLoseWnd",
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
				defName 			= "winLose_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "message",
						layer		= "UI.WinLoseWnd.layers.STATUS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}		
			}}
		},   

		-- STATUS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "winLose_status",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.WinLoseWnd.layers.TEXT_REASON",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "value2",
						layer		= "UI.WinLoseWnd.layers.TEXT_STATUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					}, 
				}
			}}
		},

		-- TEXT_REASON
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- TEXT_STATUS
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 2, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},     
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.WinLoseWnd:Setup( winnerTeam, winReason, params )

	if type( winnerTeam ) ~= "number" then
		sys.log( "UI.WinLoseWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"winnerTeam\"); \"number\" expected, got \"%s\"", type( winnerTeam ) )
		return
	end

	if type( winReason ) ~= "number" then
		sys.log( "UI.WinLoseWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"winReason\"); \"number\" expected, got \"%s\"", type( winReason ) )
		return
	end
	
	if params ~= nil then
		if type( params ) ~= "table" then
			sys.log( "UI.WinLoseWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"params\"); \"table\" or \"nil\" expected, got \"%s\"", type( params ) )
			params = nil
		end
	end

	self.winnerTeam	= winnerTeam
	self.winReason	= winReason
	self.params		= params

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end

-- ------------------------------
-- const
-- ------------------------------

wl.layers =
{
    MAIN_EFFECT			= 0,
    STATUS_EFFECT		= 1,
    TEXT_REASON			= 2,
    TEXT_STATUS			= 3,
}

wl.statuses =
{
	WIN		= 1,
	LOSE	= 2,
	DRAW	= 3,
}


wl.effectInfo =
{
	status =
	{
		status2Anim =
		{
			[ wl.statuses.WIN ]		= "win",
			[ wl.statuses.LOSE ]	= "defeat",
			[ wl.statuses.DRAW ]	= "win",
		}
	}
}

wl.status2sound =
{
	[ wl.statuses.WIN ]		= "sound/ui/win",
	[ wl.statuses.LOSE ]	= "sound/ui/lose",
	[ wl.statuses.DRAW ]	= "sound/ui/win",
}

-- ------------------------------
-- vars
-- ------------------------------

wl.winnerTeam	= -1
wl.winReason	= -1
wl.params		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.WinLoseWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )	

end


--
function UI.WinLoseWnd:Reset()

	self:SetLayerVisible( false, self.layers.STATUS_EFFECT )
	self:SetLayerVisible( false, self.layers.TEXT_STATUS )
	self:SetLayerVisible( false, self.layers.TEXT_REASON )

end


--
function UI.WinLoseWnd:FullUpdate()

	self:Reset()

	if self.winReason == -1 then
		return
	end

	self:SetLayerVisible( true, self.layers.STATUS_EFFECT )
	self:SetLayerVisible( true, self.layers.TEXT_STATUS )
	self:SetLayerVisible( true, self.layers.TEXT_REASON )

	local status = self:GetStatus()

	local statusEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_EFFECT )
	if statusEffect then

		local anim = self.effectInfo.status.status2Anim[ status ]
		if anim then
			statusEffect:StartAnimation( anim )
		else
			sys.log( "UI.WinLoseWnd:FullUpdate()[ERROR]: cannot find animation for status \"%s\"", tostring( status ) )
		end

	end     

	local statusStr, reasonStr = UI:GetWinLoseStrings( self.winnerTeam, self.winReason, nil, self.params )
	self:SetText( statusStr, self.layers.TEXT_STATUS )
	self:SetText( reasonStr, self.layers.TEXT_REASON )

end


--
function UI.WinLoseWnd:GetStatus()

	local localPlayerId = UI.HudWnd.localPlayerId
	local localPlayerTeam = _G.CL_GetPlayerTeam( localPlayerId )
	if localPlayerTeam == 0 then
		localPlayerTeam = 1
	end

	local status = -1

	if self.winnerTeam == 0 then
		status = self.statuses.DRAW
	elseif self.winnerTeam == localPlayerTeam then
		status = self.statuses.WIN
	else
		status = self.statuses.LOSE
	end   

	return status

end


--
function UI.WinLoseWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

	local status = self:GetStatus()
	local sound = self.status2sound[ status ]
	if sound then
		UI:PlayGlobalSound( sound )
	end

end


--
function UI.WinLoseWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	UI.store.WinLoseWnd =
	{
		winnerTeam	= self.winnerTeam,
		winReason	= self.winReason,
		params		= self.params,
	}

end


--
function UI.WinLoseWnd:F_OnEventRestoreUiState()

	if UI.store.WinLoseWnd then		
		self:Setup( UI.store.WinLoseWnd.winnerTeam, UI.store.WinLoseWnd.winReason, UI.store.WinLoseWnd.params )
		UI.store.WinLoseWnd = nil
	end

end