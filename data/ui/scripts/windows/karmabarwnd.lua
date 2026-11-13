-- ----------------------------------------------------------------------------
--
-- Workfile: karmabarwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.KarmaBarWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.KarmaBarWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "KarmaBarWnd",
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
				defName 			= "karmaBar",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.KarmaBarWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.KarmaBarWnd:Setup( karma )

	self:Reset()

	self.karma = karma

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.KarmaBarWnd:Reset()

	self.karma = 0

	for idx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
	end

	self:SetText( "", self.layers.TEXT )

end


--
function UI.KarmaBarWnd:GetTooltipData()

	return self.toltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.KarmaBarWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.KarmaBarWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "slot_"
	}
}

UI.KarmaBarWnd.slotPrototypeName = "KarmaBar_SlotWnd"

UI.KarmaBarWnd.toltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "karmaTooltip_caption" ),
	text		= UI:GetStringByName( "karmaTooltip_text" ),
}

-- ------------------------------
-- vars
-- ------------------------------

UI.KarmaBarWnd.slots	= {}
UI.KarmaBarWnd.karma	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.KarmaBarWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.slots = {}

	if self:IsPrototype() then
		return
	end

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.KarmaBarWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	if not next( self.slots ) then
		self:InitSlots()
	end

	self:FullUpdate()

end


--
function UI.KarmaBarWnd:InitSlots()

	if next( self.slots ) then
		return
	end

	local maxLevel = UI:GetKarmaMaxLevel()

	-- dark side
	for level = -maxLevel, -1 do
		self:AddSlotForLevel( level )
	end

	-- neutral
	self:AddSlotForLevel( 0 )


	-- light side
	for level = 1, maxLevel do
		self:AddSlotForLevel( level )
	end	

end


--
function UI.KarmaBarWnd:AddSlotForLevel( level )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotIdx = #self.slots + 1

	local protoWnd = UI[ self.slotPrototypeName ]

	local slotWnd = UI:CreateChildWnd( self, protoWnd, tostring( slotIdx ) )
	UI:AddChildAndLink( self, slotWnd, mainEffect, string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )
	table.insert( self.slots, slotWnd ) 

	slotWnd:Init( level )

end


--
function UI.KarmaBarWnd:FullUpdate()

	self:UpdateSlots()
	self:UpdateText()

end


--
function UI.KarmaBarWnd:UpdateSlots()

	local level = UI:Karma2Level( self.karma )

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:Setup( level )
	end	

end
                	

--
function UI.KarmaBarWnd:UpdateText()

	local strLabel = UI:GetStringByName( "debriefingOW_karma" )

	local strVal = UI:Num2StrSeparatedBy3( self.karma )
	if self.karma > 0 then
		strVal = string.format( "+%s", strVal )
	end

	local text = string.format( "%s: %s", strLabel, strVal )
	self:SetText( text, self.layers.TEXT )

end


--
function UI.KarmaBarWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	local name = self:GetScriptTableName()

	UI.store[ name ] =
	{
		karma	= self.karma
	}

end


--
function UI.KarmaBarWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()

	local t = UI.store[ name ]
	if t then

		self:Setup( t.karma )
		UI.store[ name ] = nil

	end

end


-- -------------------------------------------------------------------
-- UI.KarmaBar_SlotWnd
-- -------------------------------------------------------------------

UI.KarmaBar_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.KarmaBar_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "KarmaBar_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "karmaBar_slot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.KarmaBar_SlotWnd.layers.LEVEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

				}
			}}
		},

		-- LEVEL
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
function UI.KarmaBar_SlotWnd:Init( level )

	self.level = level
	self:UpdateLevelText()

end


--
function UI.KarmaBar_SlotWnd:GetLevel()

	return self.level

end


--
function UI.KarmaBar_SlotWnd:Setup( playerLevel )

	self.playerLevel = playerLevel
	self:UpdateMainAnimation()

end


--
function UI.KarmaBar_SlotWnd:Reset()

	self:Setup( 0 )

end


-- ------------------------------
-- const
-- ------------------------------

UI.KarmaBar_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	LEVEL		= 1,
}

UI.KarmaBar_SlotWnd.effectInfo =
{
	main =
	{
		animDarkActive		= "red",
		animDarkInactive	= "red_a",
		animLightActive		= "blue",
		animLightInactive	= "blue_a",
		animNeutralActive	= "orange",
		animNeutralInactive	= "orange_a",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.KarmaBar_SlotWnd.level			= 0
UI.KarmaBar_SlotWnd.playerLevel	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.KarmaBar_SlotWnd:UpdateLevelText()

	local strLevel = tostring( math.abs( self.level ) )
	self:SetText( strLevel, self.layers.LEVEL )

end


--
function UI.KarmaBar_SlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = ""

	if self.level < 0 then
		anim = self.level >= self.playerLevel and self.effectInfo.main.animDarkActive or self.effectInfo.main.animDarkInactive

	elseif self.level > 0 then
		anim = self.level <= self.playerLevel and self.effectInfo.main.animLightActive or self.effectInfo.main.animLightInactive

	else

		if self.playerLevel == 0 then
			anim = self.effectInfo.main.animNeutralActive
		else
			anim = self.playerLevel < 0 and self.effectInfo.main.animDarkActive or self.effectInfo.main.animLightActive
		end
	end

	mainEffect:StartAnimation( anim )

end