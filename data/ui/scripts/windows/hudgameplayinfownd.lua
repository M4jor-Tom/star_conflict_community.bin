-- ----------------------------------------------------------------------------
--
-- Workfile: hudgameplayinfownd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudGameplayInfoWnd = {}
local gi = UI.HudGameplayInfoWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudGameplayInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudGameplayInfoWnd",
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
				defName 			= "hud_gameplayInfo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",
						layer		= "UI.HudGameplayInfoWnd.layers.TEXT",
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

gi.layers =
{
    MAIN_EFFECT	= 0,
	TEXT		= 1,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudGameplayInfoWnd:Reset()

	self:SetText( "", self.layers.TEXT )	

end


--
function UI.HudGameplayInfoWnd:FullUpdate()

	self:Reset()
	
	local str = ""

	local gameplay = _G.GetCurrentGameMode()
	if gameplay == ai.Gameplay.PVE_MISSION then

		local missionName = _G.CL_PveGetMissionName()
		local levelName = UI:GetPveMissionLevelName( missionName )
		str = UI:GetLevelLocalizedName( levelName, false )
		
		if _G.CL_IsUnlimPve() then
		
			local unlimPveMissionLevel = _G.CL_GetUnlimPveMissionLevel()
		
			local strMissionLevel = UI:GetStringByName( "pve_buffs_buffLevel" )
			
			local numSubst = 0
			strMissionLevel, numSubst = string.gsub( strMissionLevel, "%$val%$", tostring( unlimPveMissionLevel ) )
			
			if numSubst == 0 then
				sys.log( "UI.HudGameplayInfoWnd:FullUpdate()[ERROR]: cannot find placeholder '$val$' in string 'pve_buffs_buffLevel'" )
				strMissionLevel = string.format( "[INVALID STRING] lvl %d", unlimPveMissionLevel )
			end
		
			str = string.format( "%s %s", str, strMissionLevel )
		
		end
	
	else
		str = UI:Gameplay2Str( gameplay, true )
	end

	self:SetText( str, self.layers.TEXT )

end


--
function UI.HudGameplayInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end