-- ----------------------------------------------------------------------------
--
-- Workfile: hudobjinteractionwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudObjInteractionWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudObjInteractionWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudObjInteractionWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_objInteraction",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.HudObjInteractionWnd.layers.INTERACTION_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},   

		-- INTERACTION_NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ------------------------------
-- inerface functions
-- ------------------------------

--
function UI.HudObjInteractionWnd:IsVisible()

	return not self:HasStyle( UI.WS_NOT_DRAW )

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudObjInteractionWnd.layers =
{
    MAIN_EFFECT			= 0,
    INTERACTION_NAME	= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudObjInteractionWnd.interactionType	= -1
UI.HudObjInteractionWnd.progress		= 0
UI.HudObjInteractionWnd.mainEffect		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudObjInteractionWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.HudObjInteractionWnd:Reset()

	self:SetText( "", self.layers.INTERACTION_NAME )

	if self.mainEffect then
		self.mainEffect:SetAnimationTime( 0 )
		self.mainEffect:Update( 0 )
	end

	self.interactionType	= -1
	self.progress			= 0

	self:Hide()

end


--
function UI.HudObjInteractionWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldInteractionType = self.interactionType

	self.interactionType, self.progress = _G.CL_GetLocalPlayerInteraction()

	local bNeedVisible = 	self.interactionType ~= -1
							and self.interactionType ~= ai.InteractionType.INVALID
							and self.interactionType ~= ai.InteractionType.MULTIPLE_LOOT_CRATE
							and self.interactionType ~= ai.InteractionType.ADVENTURE_GIVER

	if not bNeedVisible then

		local bWasNeedVisible = oldInteractionType ~= -1 and oldInteractionType ~= ai.InteractionType.INVALID
		if bWasNeedVisible then
			self:Hide()
		end

		return

	end

	self:Show()

	if self.interactionType ~= oldInteractionType then
		self:UpdateInteractionName()
	end	

	self:UpdateProgress()	

end


--
function UI.HudObjInteractionWnd:Show()
	
	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if bVisible then
		return
	end

	self:RemoveStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudObjInteractionWnd:Hide()

	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if not bVisible then
		return
	end

	self:AddStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudObjInteractionWnd:UpdateInteractionName()

	local name = UI:Val2Key( ai.InteractionType, self.interactionType ) 
	local strId = string.format( "bombInteraction_%s", name )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.INTERACTION_NAME )

end


--
function UI.HudObjInteractionWnd:UpdateProgress()

	if self.mainEffect then
		self.mainEffect:SetAnimationTime( self.progress )
		self.mainEffect:Update( 0 )
	end

end


--
function UI.HudObjInteractionWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end


--
function UI.HudObjInteractionWnd:NotifyHudOnVisibilityChanged()

	UI.HudWnd:OnProgressBarVisibilityChanged( self )

end