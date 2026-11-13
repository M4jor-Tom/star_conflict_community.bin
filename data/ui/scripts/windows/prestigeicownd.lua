-- ----------------------------------------------------------------------------
--
-- Workfile: prestigeicownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.PrestigeIcoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.PrestigeIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PrestigeIcoWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
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
				defName 			= "prestigeIco",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           		
           			{
           				objName		= "vol_1",
						layer		= "UI.PrestigeIcoWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},
				}
			}}
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------
-- iterface functions
-- -------------------------------

-- вызывается автоматически из F_OnAfterShowOnScreen(),
-- а также из GameStore_OnVesselLevelUp(), GameStore_OnOwnedVessels(), GameStore_OnSellVessel(), GameStore_OnRecraftVessel(), GameStore_OnVesselActivateNode()

function UI.PrestigeIcoWnd:Update()

	self:UpdateIco()
	self:UpdateVal()

end


--
function UI.PrestigeIcoWnd:Reset()

	self:SetText( "", self.layers.VAL )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.PrestigeIcoWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:Update()

end


--
function UI.PrestigeIcoWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:Update()

end


--
function UI.PrestigeIcoWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:Update()

end


--
function UI.PrestigeIcoWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:Update()

end


--
function UI.PrestigeIcoWnd:GameStore_OnSellVessel( result, requestId, param1, param2 ) 

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:Update()

end


-- -------------------------------
-- const
-- -------------------------------

UI.PrestigeIcoWnd.layers =
{
    MAIN_EFFECT	= 0,
    VAL			= 1,
}

UI.PrestigeIcoWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico"
	}
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.PrestigeIcoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:Reset()

end


--
function UI.PrestigeIcoWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local prestige = UI:GetPrestige()
	local hTex = UI:GetPrestigeIco( prestige )

	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.PrestigeIcoWnd:UpdateVal()

	local prestige = UI:GetPrestige()

	local str = tostring( prestige )
	self:SetText( str, self.layers.VAL )

end


--
function UI.PrestigeIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Update()

end