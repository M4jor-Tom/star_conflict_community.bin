-- ----------------------------------------------------------------------------
--
-- Workfile: hudcapturevpwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudCaptureVpWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.HudCaptureVpWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudCaptureVpWnd",
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
				defName 			= "hud_captureVp_main",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.HudCaptureVpWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "progr",
						layer		= "UI.HudCaptureVpWnd.layers.HP_BAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "marker",
						layer		= "UI.HudCaptureVpWnd.layers.HP_CAPTURE_THRESHOLD_EFFECT",
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
		}, 

		-- HP_BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_captureVp_hpBar",
				defaultAnimation	= "idle_1",
			}}
		},

		-- HP_CAPTURE_THRESHOLD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_captureVp_captureThres",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.HudCaptureVpWnd:IsVisible()

	return not self:HasStyle( UI.WS_NOT_DRAW )

end


-- --------------------------------
-- const
-- --------------------------------

UI.HudCaptureVpWnd.layers =
{
    MAIN_EFFECT					= 0,
    CAPTION						= 1,
    HP_BAR_EFFECT				= 2,
    HP_CAPTURE_THRESHOLD_EFFECT	= 3,
}

UI.HudCaptureVpWnd.effectInfo =
{
	main =
	{
		animFriend			= "friend",
		animEnemy			= "ememy",
		animNeutral			= "neutral",
	},
}

-- --------------------------------
-- vars
-- --------------------------------

UI.HudCaptureVpWnd.animId_main_friend	= -1
UI.HudCaptureVpWnd.animId_main_enemy	= -1
UI.HudCaptureVpWnd.animId_main_neutral	= -1
UI.HudCaptureVpWnd.mainEffect			= nil
UI.HudCaptureVpWnd.hpBarEffect			= nil
UI.HudCaptureVpWnd.thresEffect			= nil
UI.HudCaptureVpWnd.vpId					= -1

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.HudCaptureVpWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.mainEffect then
		self.animId_main_friend		= self.mainEffect:GetAnimationId( self.effectInfo.main.animFriend )
		self.animId_main_enemy		= self.mainEffect:GetAnimationId( self.effectInfo.main.animEnemy )
		self.animId_main_neutral	= self.mainEffect:GetAnimationId( self.effectInfo.main.animNeutral )
	end

	self.hpBarEffect = UI:GetEffectFromLayer( self, self.layers.HP_BAR_EFFECT )
	self.thresEffect = UI:GetEffectFromLayer( self, self.layers.HP_CAPTURE_THRESHOLD_EFFECT )

end


--
function UI.HudCaptureVpWnd:Reset()

	self.vpId = -1

	self.hpBarEffect:SetAnimationTime( 1 )
	self.hpBarEffect:Update( 0 )				

	self:SetLayerVisible( false, self.layers.HP_CAPTURE_THRESHOLD_EFFECT )

	self:SetText( "", self.layers.CAPTION )

	self:Hide()

end


--
function UI.HudCaptureVpWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end


--
function UI.HudCaptureVpWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local vp = nil

	local spectatorShip = UI.HudWnd.myShip
	if spectatorShip then
    	vp = spectatorShip:GetInteractingVitalPoint()
	end

	if not vp then

		if self.vpId ~= -1 then
			self:Reset()
		end

		return

	end

	self:Show()

	local oldVpId = self.vpId
	self.vpId = vp:GetId()

	self:UpdateMainAnimation( vp )
	self:UpdateHp( vp )

	if self.vpId ~= oldVpId then
		self:UpdateCaption( vp )
		self:UpdateCaptureThreshold( vp )
	end

end   


--
function UI.HudCaptureVpWnd:UpdateMainAnimation( vp )

	local vpRelationsipGroup	= vp:GetRelationshipGroup()
	local myRelationshipGroup	= _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if myRelationshipGroup == 0 then
		myRelationshipGroup = 1
	end
	local relationship			= ai.Relationship:GetRelationship( vpRelationsipGroup, myRelationshipGroup )

	local animId = -1

	local gameplay = _G.GetCurrentGameMode()
	if gameplay == ai.Gameplay.CONTROL or gameplay == ai.Gameplay.APRIL_CONTROL or gameplay == ai.Gameplay.KING_OF_THE_HILL or gameplay == ai.Gameplay.PRACTICE then

		if relationship == ai.RelatioshipType.FRIEND then
			animId = self.animId_main_friend

		elseif relationship == ai.RelatioshipType.ENEMY then
			animId = self.animId_main_enemy

		elseif relationship == ai.RelatioshipType.NEUTRAL then

			local desiredRelationshipGroup	= vp:GetDesiredRelationshipGroup()
			local desiredRelationship		= ai.Relationship:GetRelationship( desiredRelationshipGroup, myRelationshipGroup )

    		if desiredRelationship == ai.RelatioshipType.FRIEND then
				animId = self.animId_main_friend

    		elseif desiredRelationship == ai.RelatioshipType.ENEMY then
				animId = self.animId_main_enemy

    		elseif desiredRelationship == ai.RelatioshipType.NEUTRAL then
				animId = self.animId_main_neutral
    		end		

		end
		
	else

		if relationship == ai.RelatioshipType.FRIEND then
			animId = self.animId_main_friend

		elseif relationship == ai.RelatioshipType.ENEMY then
			animId = self.animId_main_enemy

		elseif relationship == ai.RelatioshipType.NEUTRAL then
			animId = self.animId_main_neutral
		end

	end

	if self.mainEffect:GetCurAnimationId() ~= animId then
		self.mainEffect:StartAnimationById( animId )
	end

end


--
function UI.HudCaptureVpWnd:UpdateHp( vp )

	local hp	= vp:GetHealth()
	local maxHp	= vp:GetMaxHealth()

	local val = maxHp > 0 and hp / maxHp or 0
	val = UI:Clamp( val, 0, 1 )

	self.hpBarEffect:SetAnimationTime( 1 - val )
	self.hpBarEffect:Update( 0 )				

end


--
function UI.HudCaptureVpWnd:UpdateCaptureThreshold( vp )

	local gameplay = _G.GetCurrentGameMode()

	if not( gameplay == ai.Gameplay.CONTROL or gameplay == ai.Gameplay.APRIL_CONTROL or gameplay == ai.Gameplay.KING_OF_THE_HILL ) then
		self:SetLayerVisible( false, self.layers.HP_CAPTURE_THRESHOLD_EFFECT ) 
		return
	end

	self:SetLayerVisible( true, self.layers.HP_CAPTURE_THRESHOLD_EFFECT ) 	

	local defName = vp:GetDefName()
	local def = UI:GetDef( defName )

	local maxHp		= vp:GetMaxHealth()
	local threshold	= def.relation_health or 0

	local animTime = threshold / maxHp

	self.thresEffect:SetAnimationTime( animTime )
	self.thresEffect:Update( 0 )

end


--
function UI.HudCaptureVpWnd:UpdateCaption( vp )

	local str = ""

	local defName = vp:GetDefName()
	local def = UI:GetDef( defName )

	if def.uiInteract ~= nil then
		if type( def.uiInteract ) == "string" then
			str = UI:GetStringByName( def.uiInteract )
		else
			sys.log( "UI.HudCaptureVpWnd:UpdateCaption()[ERROR]: invalid type of \"_G.Def[%s].uiInteract\"; \"string\" or \"nil\" expected, got \"%s\"", defName, type( def.uiInteract ) )
		end
	end

	if str == "" then
		str = UI:GetStringByName( "hud_capturingVitalPoint" )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.HudCaptureVpWnd:Show()

	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if bVisible then
		return
	end

	self:RemoveStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudCaptureVpWnd:Hide()

	local bVisible = not self:HasStyle( UI.WS_NOT_DRAW )
	if not bVisible then
		return
	end

	self:AddStyle( UI.WS_NOT_DRAW )
	self:NotifyHudOnVisibilityChanged()

end


--
function UI.HudCaptureVpWnd:NotifyHudOnVisibilityChanged()

	UI.HudWnd:OnProgressBarVisibilityChanged( self )

end