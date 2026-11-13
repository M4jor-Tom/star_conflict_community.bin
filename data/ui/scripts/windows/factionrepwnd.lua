-- ----------------------------------------------------------------------------
--
-- Workfile: factionrepwnd.lua
-- Copyright é 2021, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.FactionRepWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.FactionRepWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "FactionRepWnd",
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
				defName 			= "factionRepMain",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "fact_01",
						layer		= "UI.FactionRepWnd.layers.FACTION_EMPIRE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_02",
						layer		= "UI.FactionRepWnd.layers.FACTION_FEDERATION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_03",
						layer		= "UI.FactionRepWnd.layers.FACTION_JERICHO",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_04",
						layer		= "UI.FactionRepWnd.layers.FACTION_ENCLAVE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_05",
						layer		= "UI.FactionRepWnd.layers.FACTION_CYBER_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- FACTION_EMPIRE
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- FACTION_FEDERATION
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- FACTION_JERICHO
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- FACTION_ENCLAVE
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- FACTION_CYBER_2
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.FactionRepWnd:Setup( factionRep )

	self:Reset()

	self.factionRep = factionRep or {}

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.FactionRepWnd:Reset()

	self.factionRep		= {}

	self:ResetFactionRepControls()

end


-- ------------------------------
-- const
-- ------------------------------

UI.FactionRepWnd.layers =
{
	MAIN_EFFECT			= 0,
	FACTION_EMPIRE		= 1,
	FACTION_FEDERATION	= 2,
	FACTION_JERICHO		= 3,
	FACTION_ENCLAVE		= 4,
	FACTION_CYBER_2		= 5,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.FactionRepWnd.factionRep			= {}

UI.FactionRepWnd.factionMetaText	= {}
UI.FactionRepWnd.factionLinkWnd		= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.FactionRepWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.factionMetaText	= {}
	self.factionLinkWnd		= {}

	if self:IsPrototype() then
		return
	end

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.FactionRepWnd:F_Shutdown()

	for i = 0, ai.Faction.NUM - 1 do
		if self.factionMetaText[ i ] then
			self.factionMetaText[ i ]:Clear()
		end
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.FactionRepWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	if not next( self.factionMetaText ) then
		for i = 0, ai.Faction.NUM - 1 do
			self.factionMetaText[ i ] = UI.MetaText.GetNewInstance()
			self.factionMetaText[ i ]:InitFromLayer( self, self.layers.FACTION_EMPIRE + i )
			self.factionLinkWnd[ i ] = UI:CreateChildWnd( self, UI.LinkWnd, string.format( "faction_%d", i ) )
		end
	end

	self:FullUpdate()

end


--
function UI.FactionRepWnd:FullUpdate()

	self:UpdateFactionRepControls()

end


--
function UI.FactionRepWnd:ResetFactionRepControls()

	if next( self.factionMetaText ) then
		for i = 0, ai.Faction.NUM - 1 do
			self.factionMetaText[ i ]:SetText( "", true )
			self.factionLinkWnd[ i ]:Reset()
			self.factionLinkWnd[ i ]:UnlinkFromParent()
		end
	end

end


--
function UI.FactionRepWnd:UpdateFactionRepControls()

	self:ResetFactionRepControls()
	
	if self.factionRep == nil or not next( self.factionRep ) then
		return
	end

	for i = 0, ai.Faction.NUM - 1 do
		local rep = self.factionRep[ i ] or 0
		if UI:IsFactionRepVisible( i, rep ) then

			self:AddChild( self.factionLinkWnd[ i ] )

			local strVal = UI:FactionRep2ColoredStr( rep )
			local hIcoTex = UI:GetMailAttachmentFactionRepIco( i )
			local strIco = string.format( "$texture [handle %u][ignoreFontSize true][alignment CENTER][color %u]$", hIcoTex, UI.WHITE_COLOR )
			local linkParams =
			{
				text		= string.format( "%s%s", strIco, strVal ),
			}

			self.factionLinkWnd[ i ]:Setup( UI.LinkWnd.linkTypes.CUSTOM_TEXT, linkParams, self.factionMetaText[ i ]:GetFormatParams().hFont, self.factionMetaText[ i ]:GetBlendMode(), self.factionMetaText[ i ]:GetBackColor() )
			local strLink = string.format( "$wndk [hWnd %u]$", self.factionLinkWnd[ i ]:GetUiHandle() )
			self.factionMetaText[ i ]:SetText( strLink, true )
		end
	end 

end


--
function UI.FactionRepWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	local name = self:GetScriptTableName()

	UI.store[ name ] =
	{
		factionRep	= self.factionRep
	}

end


--
function UI.FactionRepWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()

	local t = UI.store[ name ]
	if t then

		self:Setup( t.factionRep )
		UI.store[ name ] = nil

	end

end
