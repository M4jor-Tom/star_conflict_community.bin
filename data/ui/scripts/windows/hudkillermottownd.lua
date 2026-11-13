-- ----------------------------------------------------------------------------
--
-- Workfile: hudkillermottownd.lua
-- Copyright é 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudKillerMottoWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.HudKillerMottoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudKillerMottoWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "hud_killerMotto",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self25",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "description",
						layer		= "UI.HudKillerMottoWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},  
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.HudKillerMottoWnd:Setup( playerId )

	if type( playerId ) ~= "number" then
		sys.log( "UI.HudKillerMottoWnd:Setup()[ERROR]: invalid type of the first parameter (\"playerId\"); \"number\" expected, got \"%s\"", type( playerId ) )
		return
	end

	self:Reset()

	self.playerId = playerId
	self:FullUpdate()	

	if self:IsOnScreen() then
		self:PlayAnimation( self.effectInfo.main.animShow )
		UI:PlayGlobalSound( self.sounds.show )
	end

end



--
function UI.HudKillerMottoWnd:Reset()

	self.playerId = -1

	self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	self:SetText( "", self.layers.TEXT )

	self:PlayAnimation( self.effectInfo.main.animIdle )

end


--
function UI.HudKillerMottoWnd:GetPlayerId()

	return self.playerId

end


-- --------------------------------
-- const
-- --------------------------------

UI.HudKillerMottoWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.HudKillerMottoWnd.effectInfo =
{
	main =
	{
		animIdle		= "idle",
		animShow		= "show",
		animHide		= "hide",
		icoSpriteName	= "ico",
	}
}

UI.HudKillerMottoWnd.sounds =
{
	show = "sound/ui/hudShowQuest"
}

-- --------------------------------
-- vars
-- --------------------------------

UI.HudKillerMottoWnd.playerId		= -1
UI.HudKillerMottoWnd.mainEffect		= nil

-- --------------------------------
-- work funtions
-- --------------------------------

--
function UI.HudKillerMottoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.HudKillerMottoWnd:FullUpdate()

	local playerInfo = _G.GetPlayerInfo( self.playerId )

	if not playerInfo then
		sys.log( "UI.HudKillerMottoWnd:FullUpdate()[ERROR]: cannot find player info for player %d", self.playerId )
		return
	end

	self:UpdateIco( playerInfo )
	self:UpdateText( playerInfo )

end


--
function UI.HudKillerMottoWnd:UpdateIco( playerInfo )

	local hTex = UI:GetAvatarTexture( playerInfo.avatar )
	self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.HudKillerMottoWnd:UpdateText( playerInfo )

	local playerName = UI:MakePlayerNameById( self.playerId, true, true, false )
	local motto = UI:GetMottoString( playerInfo.motto )

	local text = UI:FormatMottoText( playerName, motto )
	self:SetText( text, self.layers.TEXT )

end


--
function UI.HudKillerMottoWnd:PlayAnimation( anim )

	if self.mainEffect:GetCurAnimation() ~= anim then
		self.mainEffect:StartAnimation( anim )
	end

end


--
function UI.HudKillerMottoWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.mainEffect then

		if animName == self.effectInfo.main.animShow then
			self:PlayAnimation( self.effectInfo.main.animIdle )
		end

	end

end


--
function UI.HudKillerMottoWnd:F_OnEventSaveUiState()

	if self.playerId == -1 then
		return
	end

	UI.store.HudKillerMottoWnd =
	{
		playerId = self.playerId
	}

end


--
function UI.HudKillerMottoWnd:F_OnEventRestoreUiState()

	if UI.store.HudKillerMottoWnd then

		if UI.store.HudKillerMottoWnd.playerId ~= -1 then

			self.playerId = UI.store.HudKillerMottoWnd.playerId
			self:FullUpdate()	

		end

		UI.store.HudKillerMottoWnd = nil

	end

end


--
function UI.HudKillerMottoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:PlayAnimation( self.effectInfo.main.animShow )
	UI:PlayGlobalSound( self.sounds.show )

end