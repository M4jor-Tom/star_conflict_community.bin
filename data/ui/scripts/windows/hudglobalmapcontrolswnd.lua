-- ----------------------------------------------------------------------------
--
-- Workfile: hudglobalmapcontrolswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudGlobalMapControlsWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudGlobalMapControlsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudGlobalMapControlsWnd",
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
				defName 			= "hud_globalMapControls",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "tips",
						layer		= "UI.HudGlobalMapControlsWnd.layers.TIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_1",
						layer		= "UI.HudGlobalMapControlsWnd.layers.GAMEPLAY_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_2",
						layer		= "UI.HudGlobalMapControlsWnd.layers.GAMEPLAY_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_1",
						layer		= "UI.HudGlobalMapControlsWnd.layers.ZONE_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}		
			}}
		},   

		-- TIP
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^globalMap_tip"
		}, 

		-- GAMEPLAY_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- GAMEPLAY_DESC
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- ZONE_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 
	},

	children = { "UI.HudGlobalMapControls_OpenWorldMapBtn" }
}

-- ------------------------------
-- interface funtions
-- ------------------------------

--
function UI.HudGlobalMapControlsWnd:OnBindsChanged()

	if not self:IsOnScreen() then
		return
	end

	if not UI.HudGlobalMapControls_OpenWorldMapBtn:IsChildOf( self ) then
		return
	end

	self:UpdateOpenWorldMapBtnText()

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudGlobalMapControlsWnd.layers =
{
    MAIN_EFFECT		= 0,
    TIP				= 1,
    GAMEPLAY_NAME	= 2,
    GAMEPLAY_DESC	= 3,
	ZONE_NAME		= 4,
}

UI.HudGlobalMapControlsWnd.effectInfo =
{
	main =
	{
		openWorldMapBtnLocator	= "btn",
	}
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudGlobalMapControlsWnd:Reset()

	self:SetText( "", self.layers.GAMEPLAY_NAME )	
	self:SetText( "", self.layers.GAMEPLAY_DESC )	
	self:SetText( "", self.layers.ZONE_NAME )	

	UI.HudGlobalMapControls_OpenWorldMapBtn:UnlinkFromParent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( UI.HudGlobalMapControls_OpenWorldMapBtn:GetUiHandle(), "" )
	end

end


--
function UI.HudGlobalMapControlsWnd:FullUpdate()

	self:Reset()

	local gameplay = _G.GetCurrentGameMode()
	if gameplay == ai.Gameplay.FREE_SPACE then

		local zoneId = _G.CL_GetCurrentSpaceZoneId()
		local zoneName = UI:ZoneId2Name( zoneId )

		local strZone = UI:Zone2Str( zoneName )

		str = UI:GetStringByName( "hud_freeSpace_zoneName" )
		str = string.gsub( str, "%$zone%$", strZone )

    	self:SetText( str, self.layers.ZONE_NAME )


		-- кнопка открытия карты опенворлда

    	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, UI.HudGlobalMapControls_OpenWorldMapBtn, mainEffect, self.effectInfo.main.openWorldMapBtnLocator, UI.EffectAnimParams.POS )

		self:UpdateOpenWorldMapBtnText()

	elseif gameplay ~= ai.Gameplay.PVE_MISSION then

    	local str = UI:Gameplay2Str( gameplay, true )
    	self:SetText( str, self.layers.GAMEPLAY_NAME )

    	local gameplayDesc = UI:GetGameplayDesc( gameplay, true )
    	self:SetText( gameplayDesc, self.layers.GAMEPLAY_DESC )

	end

end


--
function UI.HudGlobalMapControlsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end


--
function UI.HudGlobalMapControlsWnd:UpdateOpenWorldMapBtnText()

	local strBind = UI:GetBindKeysStr( "toggleMap", true )

	local str = UI:GetStringByName( "hud_showOpenWorldMapBtn" )
	str = string.gsub( str, "%$key%$", strBind )

	UI.HudGlobalMapControls_OpenWorldMapBtn:SetBtnText( str )	

end


--
function UI.HudGlobalMapControlsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.HudGlobalMapControls_OpenWorldMapBtn then
		UI:OnToggleMapBind()
	end

	return true

end


-- --------------------------------------------------------------------
-- UI.HudGlobalMapControls_OpenWorldMapBtn
-- --------------------------------------------------------------------

UI.HudGlobalMapControls_OpenWorldMapBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn6",

    	props =
    	{
    		name	= "HudGlobalMapControls_OpenWorldMapBtn",		
    	}
	}
}