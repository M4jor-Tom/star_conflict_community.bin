-- ----------------------------------------------------------------------------
--
-- Workfile: hudadditionalcmdwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudAdditionalCmdProgressWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.HudAdditionalCmdProgressWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudAdditionalCmdProgressWnd",
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
						layer		= "UI.HudAdditionalCmdProgressWnd.layers.COMMAND_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}		
			}}
		},  

		-- COMMAND_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			--text			= UI:GetStringByName( "hud_buildingProgress" ),
		}, 
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.HudAdditionalCmdProgressWnd:IsVisible()

	return not self:HasStyle( UI.WS_NOT_DRAW )

end


-- --------------------------------
-- const
-- --------------------------------

UI.HudAdditionalCmdProgressWnd.layers =
{
    MAIN_EFFECT	= 0,
    COMMAND_NAME		= 1,
}

-- --------------------------------
-- vars
-- --------------------------------

UI.HudAdditionalCmdProgressWnd.mainEffect	= nil
UI.HudAdditionalCmdProgressWnd.entId		= -1
UI.HudAdditionalCmdProgressWnd.progress		= 0


-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.HudAdditionalCmdProgressWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.HudAdditionalCmdProgressWnd:Reset()

	self:SetText( "", self.layers.COMMAND_NAME )

	self.entId	= -1
	self.progress	= 0

	self.mainEffect:SetAnimationTime( 0 )
	self.mainEffect:Update( 0 )				

	self:Hide()

end


--
function UI.HudAdditionalCmdProgressWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end


--
function UI.HudAdditionalCmdProgressWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldEntId	= self.entId

	--self.progress, self.entId = _G.CL_GetLocalPlayerBuildingProgress()
	self.progress, self.entId = _G.CL_GetAdditionalCmdProgress()

	--local bNeedVisible = self.progress > 0 and type( defNaself.cmdNameme ) ~= "string" and self.entId ~= ""
	local bNeedVisible = self.entId ~= -1
	if not bNeedVisible then

		local bWasNeedVisible = oldEntId ~= -1
		if bWasNeedVisible then
			self:Hide()
		end

		return

	end

	self:Show()

	if self.entId ~= oldEntId then
		self:UpdateCmdName()
	end

	self:UpdateMainAnimation()

end   


--
function UI.HudAdditionalCmdProgressWnd:UpdateMainAnimation()

    self.mainEffect:SetAnimationTime( self.progress )
	self.mainEffect:Update( 0 )	

end


--
function UI.HudAdditionalCmdProgressWnd:Show()
	
	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if bVisible then
		return
	end

	self:RemoveStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudAdditionalCmdProgressWnd:Hide()

	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if not bVisible then
		return
	end

	self:AddStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudAdditionalCmdProgressWnd:UpdateCmdName()

	local ent = _G.Entities[ self.entId ]
	if not ent then
		return
	end
 
	local defName = ent:GetDefName()
	local def = UI:GetDef( defName )

	local cmdName = def.additional_cmd_ui_name or ""

	local strId = string.format( "moduleAdditionalCmd_%s", cmdName )
	local str = UI:GetStringByName( strId )
	self:SetText( str, self.layers.COMMAND_NAME )

end


--
function UI.HudAdditionalCmdProgressWnd:NotifyHudOnVisibilityChanged()

	UI.HudWnd:OnProgressBarVisibilityChanged( self )

end