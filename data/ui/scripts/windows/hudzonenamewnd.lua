-- ----------------------------------------------------------------------------
--
-- Workfile: hudzonenamewnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudZoneNameWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudZoneNameWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudZoneNameWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_zoneName",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",
						layer		= "UI.HudZoneNameWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},   

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ------------------------------
-- const
-- ------------------------------

UI.HudZoneNameWnd.layers =
{
    MAIN_EFFECT	= 0,
	TEXT		= 1,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudZoneNameWnd:Reset()

	self:SetText( "", self.layers.TEXT )	

end


--
function UI.HudZoneNameWnd:FullUpdate()

	self:Reset()

	local zoneId = _G.CL_GetCurrentSpaceZoneId()
	local zoneName = UI:ZoneId2Name( zoneId )

	local strZone = UI:Zone2Str( zoneName )

	local str = UI:GetStringByName( "hud_freeSpace_zoneName" )
	str = string.gsub( str, "%$zone%$", strZone )

	self:SetText( str, self.layers.TEXT )

end


--
function UI.HudZoneNameWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end