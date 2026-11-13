-- ----------------------------------------------------------------------------
--
-- Workfile: hudbuildingprogresswnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudBuildingProgressWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.HudBuildingProgressWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudBuildingProgressWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
						layer		= "UI.HudBuildingProgressWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "hud_buildingProgress" ),
		}, 
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.HudBuildingProgressWnd:IsVisible()

	return not self:HasStyle( UI.WS_NOT_DRAW )

end


-- --------------------------------
-- const
-- --------------------------------

UI.HudBuildingProgressWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
}

-- --------------------------------
-- vars
-- --------------------------------

UI.HudBuildingProgressWnd.mainEffect	= nil
UI.HudBuildingProgressWnd.entId			= -1
UI.HudBuildingProgressWnd.progress		= 0


-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.HudBuildingProgressWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.HudBuildingProgressWnd:Reset()

	self.entId		= -1
	self.progress	= 0

	self.mainEffect:SetAnimationTime( 0 )
	self.mainEffect:Update( 0 )				

	self:Hide()

end


--
function UI.HudBuildingProgressWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end


--
function UI.HudBuildingProgressWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldProgress	= self.progress
	local oldEntId		= self.entId

	self.progress, self.entId = _G.CL_GetLocalPlayerBuildingProgress()

	local bNeedVisible = self.entId ~= -1 and self.progress > 0
	if not bNeedVisible then

		local bWasNeedVisible = oldEntId ~= -1 and oldProgress > 0
		if bWasNeedVisible then
			self:Hide()
		end

		return

	end

	self:Show()

	self:UpdateMainAnimation()

end   


--
function UI.HudBuildingProgressWnd:UpdateMainAnimation()

    self.mainEffect:SetAnimationTime( self.progress )
	self.mainEffect:Update( 0 )	

end


--
function UI.HudBuildingProgressWnd:Show()
	
	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if bVisible then
		return
	end

	self:RemoveStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudBuildingProgressWnd:Hide()

	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if not bVisible then
		return
	end

	self:AddStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudBuildingProgressWnd:NotifyHudOnVisibilityChanged()

	UI.HudWnd:OnProgressBarVisibilityChanged( self )

end