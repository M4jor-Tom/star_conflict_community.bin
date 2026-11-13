-- ----------------------------------------------------------------------------
--
-- Workfile: hudplayerstatuswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudPlayerStatusWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.HudPlayerStatusWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudPlayerStatusWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "hud_playerStatus_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.HudPlayerStatusWnd.layers.KARMA",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_01",
						layer		= "UI.HudPlayerStatusWnd.layers.FACTION_EMPIRE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_02",
						layer		= "UI.HudPlayerStatusWnd.layers.FACTION_FEDERATION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_03",
						layer		= "UI.HudPlayerStatusWnd.layers.FACTION_JERICHO",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_04",
						layer		= "UI.HudPlayerStatusWnd.layers.FACTION_ENCLAVE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fact_05",
						layer		= "UI.HudPlayerStatusWnd.layers.FACTION_CYBER_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- KARMA
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
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

		-- AGGRESSOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerStatus_statusSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "gmp_icon",
						layer		= "UI.HudPlayerStatusWnd.layers.AGGRESSOR_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title",
						layer		= "UI.HudPlayerStatusWnd.layers.AGGRESSOR_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "title",
						layer		= "UI.HudPlayerStatusWnd.layers.AGGRESSOR_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value",
						layer		= "UI.HudPlayerStatusWnd.layers.AGGRESSOR_TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},   
				}
			}}
		},

		-- AGGRESSOR_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- AGGRESSOR_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hud_playerStatus_aggressor" ),
		}, 

		-- AGGRESSOR_TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- CRIMINAL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerStatus_statusSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "gmp_icon",
						layer		= "UI.HudPlayerStatusWnd.layers.CRIMINAL_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title",
						layer		= "UI.HudPlayerStatusWnd.layers.CRIMINAL_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "title",
						layer		= "UI.HudPlayerStatusWnd.layers.CRIMINAL_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value",
						layer		= "UI.HudPlayerStatusWnd.layers.CRIMINAL_TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},   
				}
			}}
		},

		-- CRIMINAL_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- CRIMINAL_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hud_playerStatus_criminal" ),
		}, 

		-- CRIMINAL_TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- CIVILIAN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerStatus_statusSlot",
				defaultAnimation	= "idle_2",

				links =
				{
					{
						objName		= "gmp_icon",
						layer		= "UI.HudPlayerStatusWnd.layers.CIVILIAN_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title",
						layer		= "UI.HudPlayerStatusWnd.layers.CIVILIAN_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "title",
						layer		= "UI.HudPlayerStatusWnd.layers.CIVILIAN_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CIVILIAN_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- CIVILIAN_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hud_playerStatus_civilian" ),
		}, 
	}
}

-- ----------------------------
-- const
-- ----------------------------

UI.HudPlayerStatusWnd.layers =
{
    MAIN_EFFECT				= 0,
	KARMA					= 1,
	FACTION_EMPIRE			= 2,
	FACTION_FEDERATION		= 3,
	FACTION_JERICHO			= 4,
	FACTION_ENCLAVE			= 5,
	FACTION_CYBER_2			= 6,
    AGGRESSOR_EFFECT		= 7,
    AGGRESSOR_ICO_EFFECT	= 8,
    AGGRESSOR_NAME			= 9,
    AGGRESSOR_TIME			= 10,
    CRIMINAL_EFFECT			= 11,
    CRIMINAL_ICO_EFFECT		= 12,
    CRIMINAL_NAME			= 13,
    CRIMINAL_TIME			= 14,
    CIVILIAN_EFFECT			= 15,
    CIVILIAN_ICO_EFFECT		= 16,
    CIVILIAN_NAME			= 17,
}

UI.HudPlayerStatusWnd.effectInfo =
{
	main =
	{
		minSizeLocator			= "dist_min",
		maxSizeLocator			= "self",
		karmaBadColorLocator	= "title_color_down",
		karmaGoodColorLocator	= "title_color_up",
		statusSlot1Locator		= "slot_1",
		statusSlot2Locator		= "slot_2",
	},

	statusIco =
	{
		icoSpriteName	= "ico",
	}
}

-- ----------------------------
-- vars
-- ----------------------------

UI.HudPlayerStatusWnd.karma				= 0
UI.HudPlayerStatusWnd.factionRep		= {}
UI.HudPlayerStatusWnd.aggressorTime		= 0
UI.HudPlayerStatusWnd.criminalTime		= 0
UI.HudPlayerStatusWnd.bCivilian			= false

UI.HudPlayerStatusWnd.color_karmaBad	= UI.WHITE_COLOR
UI.HudPlayerStatusWnd.color_karmaGood	= UI.WHITE_COLOR
UI.HudPlayerStatusWnd.firstSlotPos		= Vec2( 0, 0 )
UI.HudPlayerStatusWnd.slots_dist		= 0
UI.HudPlayerStatusWnd.space_text_btm	= 0
UI.HudPlayerStatusWnd.selfMinHeight		= 0
UI.HudPlayerStatusWnd.selfMaxHeight		= 0

UI.HudPlayerStatusWnd.factionMetaText	= {}
UI.HudPlayerStatusWnd.factionLinkWnd	= {}


-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.HudPlayerStatusWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	for i = 0, ai.Faction.NUM - 1 do
		self.factionMetaText[ i ] = UI.MetaText.GetNewInstance()
		self.factionMetaText[ i ]:InitFromLayer( self, self.layers.FACTION_EMPIRE + i )
		self.factionLinkWnd[ i ] = UI:CreateChildWnd( self, UI.LinkWnd, tostring( i ) )
	end

	self:PrepareLayout()

end


--
function UI.HudPlayerStatusWnd:F_Shutdown()

	for i = 0, ai.Faction.NUM - 1 do
		if self.factionMetaText[ i ] then
			self.factionMetaText[ i ]:Clear()
		end
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HudPlayerStatusWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Reset()

end


--
function UI.HudPlayerStatusWnd:Reset()

	self.karma					= 0
	self.factionRep				= {}
	self.aggressorTime			= 0
	self.criminalTime			= 0
	self.bCivilian				= false

	self:UpdateKarmaControls()
	self:UpdateFactionRepControls()
	self:UpdateAggressorControls()
	self:UpdateCriminalControls()
	self:UpdateCivilianControls()

	self:RecalcLayout()

end


--
function UI.HudPlayerStatusWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()

end


--
function UI.HudPlayerStatusWnd:FullUpdate()

	local myShip = UI.HudWnd.myShip

	self:UpdateKarma( myShip )
	self:UpdateFactionRep( myShip )

	local bAggressorVisibilityChanged	= self:UpdateAggressor()
	local bCriminalVisibilityChanged	= self:UpdateCriminal()
	local bCivilianVisibilityChanged	= self:UpdateCivilian()

	if bAggressorVisibilityChanged or bCriminalVisibilityChanged or bCivilianVisibilityChanged then
		self:RecalcLayout()
	end

end


--
function UI.HudPlayerStatusWnd:UpdateKarma( myShip )

	local karma = myShip and myShip:GetKarmaValue() or 0

	if karma == self.karma then
		return
	end

	self.karma = karma

	self:UpdateKarmaControls()

end


--
function UI.HudPlayerStatusWnd:UpdateFactionRep( myShip )

	local isRepChanged = false
	for i = 0, ai.Faction.NUM - 1 do
		local rep = myShip and myShip:GetFactionRep( i ) or 0 -- 0
		isRepChanged = isRepChanged or rep ~= self.factionRep[ i ]
		self.factionRep[ i ] = rep
	end

	if not isRepChanged then
		return
	end

	self:UpdateFactionRepControls()

end


--
function UI.HudPlayerStatusWnd:UpdateKarmaControls()

	local karmaLevel = UI:Karma2Level( self.karma )

	local levelColor = karmaLevel >= 0 and self.color_karmaGood or self.color_karmaBad
	local baseColor = self:GetColor( self.layers.KARMA )

	local str = UI:GetStringByName( "hud_playerStatus_karma" )

	local tSubst =
	{
		level	= string.format( "%s%d%s", UI:Color2Str( levelColor ), karmaLevel, UI:Color2Str( baseColor ) ),
		val		= UI:Num2StrSeparatedBy3( self.karma ),
	}

	str = string.gsub( str, "%$(.-)%$", tSubst )
	self:SetText( str, self.layers.KARMA )
end


--
function UI.HudPlayerStatusWnd:ResetFactionRepControls()

	for i = 0, ai.Faction.NUM - 1 do
		self.factionMetaText[ i ]:SetText( "", true )
		self.factionLinkWnd[ i ]:Reset()
		self.factionLinkWnd[ i ]:UnlinkFromParent()
	end

end


--
function UI.HudPlayerStatusWnd:UpdateFactionRepControls()

	self:ResetFactionRepControls()

	for i = 0, ai.Faction.NUM - 1 do
		local rep = self.factionRep[ i ] or 0
		if UI:IsFactionRepVisible( i ,rep ) then

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
function UI.HudPlayerStatusWnd:UpdateAggressor()

	local aggressorTime = _G.CL_GetAggressorTimer( UI.HudWnd.localPlayerId )

	if aggressorTime == self.aggressorTime then
		return false
	end

	self.aggressorTime = aggressorTime

	return self:UpdateAggressorControls()

end


--
function UI.HudPlayerStatusWnd:UpdateAggressorControls()

	local bNeedVisible	= self.aggressorTime > 0
	local bVisible		= self:IsLayerVisible( self.layers.AGGRESSOR_EFFECT )

	if bNeedVisible then

		if not bVisible then
			self:SetAggressorVisible( true )
		end

		local strTime = string.format( "%d %s", self.aggressorTime, UI.strSecs )
		self:SetText( strTime, self.layers.AGGRESSOR_TIME )		

	else

		if bVisible then
			self:SetAggressorVisible( false )
		end

	end

	return bNeedVisible ~= bVisible
	
end


--
function UI.HudPlayerStatusWnd:SetAggressorVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.AGGRESSOR_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.AGGRESSOR_ICO_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.AGGRESSOR_NAME )
	self:SetLayerVisible( bVisible, self.layers.AGGRESSOR_TIME )

end


--
function UI.HudPlayerStatusWnd:UpdateCriminal()

	local criminalTime = _G.CL_GetCriminalTimer( UI.HudWnd.localPlayerId )

	if criminalTime == self.criminalTime then
		return false
	end

	self.criminalTime = criminalTime

	return self:UpdateCriminalControls()

end


--
function UI.HudPlayerStatusWnd:UpdateCriminalControls()

	local bNeedVisible	= self.criminalTime > 0
	local bVisible		= self:IsLayerVisible( self.layers.CRIMINAL_EFFECT )

	if bNeedVisible then

		if not bVisible then
			self:SetCriminalVisible( true )
		end

		local strTime = string.format( "%d %s", self.criminalTime, UI.strSecs )
		self:SetText( strTime, self.layers.CRIMINAL_TIME )		

	else

		if bVisible then
			self:SetCriminalVisible( false )
		end

	end

	return bNeedVisible ~= bVisible
	
end


--
function UI.HudPlayerStatusWnd:SetCriminalVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.CRIMINAL_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.CRIMINAL_ICO_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.CRIMINAL_NAME )
	self:SetLayerVisible( bVisible, self.layers.CRIMINAL_TIME )

end  


--
function UI.HudPlayerStatusWnd:UpdateCivilian()

	local bCivilian = _G.CL_GetCivilianFlag( UI.HudWnd.localPlayerId )

	if bCivilian == self.bCivilian then
		return false
	end

	self.bCivilian = bCivilian

	return self:UpdateCivilianControls()

end


--
function UI.HudPlayerStatusWnd:UpdateCivilianControls()

	local bNeedVisible	= self.bCivilian
	local bVisible		= self:IsLayerVisible( self.layers.CIVILIAN_EFFECT )

	self:SetCivilianVisible( bNeedVisible )

	return bNeedVisible ~= bVisible
	
end


--
function UI.HudPlayerStatusWnd:SetCivilianVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.CIVILIAN_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.CIVILIAN_ICO_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.CIVILIAN_NAME )

end


--
function UI.HudPlayerStatusWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local statusSlotEffect = UI:GetEffectFromLayer( self, self.layers.CRIMINAL_EFFECT )	

	local firstStatusSlotPos	= mainEffect:GetObjPos( self.effectInfo.main.statusSlot1Locator )
	local secondStatusSlotPos	= mainEffect:GetObjPos( self.effectInfo.main.statusSlot2Locator )
	local minSize				= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )
	local maxSize				= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
	local statusSlotSize		= statusSlotEffect and statusSlotEffect:GetObjSize( "self" ) or UI:ZeroVec2()

	self.firstSlotPos			= firstStatusSlotPos
	self.slots_dist				= secondStatusSlotPos.y - firstStatusSlotPos.y
	self.space_text_btm			= maxSize.y - ( secondStatusSlotPos.y + statusSlotSize.y )
    self.selfMinHeight			= minSize.y
    self.selfMaxHeight			= maxSize.y

	self.color_karmaBad			= mainEffect:GetObjColor( self.effectInfo.main.karmaBadColorLocator )
	self.color_karmaGood		= mainEffect:GetObjColor( self.effectInfo.main.karmaGoodColorLocator )

	self:SetWidth( maxSize.x )

	local aggressorIcoEffect = UI:GetEffectFromLayer( self, self.layers.AGGRESSOR_ICO_EFFECT )
	if aggressorIcoEffect then
		local hTexAggressor = UI:GetTex( "aggressor" )
		aggressorIcoEffect:SetSpriteTexture( self.effectInfo.statusIco.icoSpriteName, hTexAggressor )
	end

	local criminalIcoEffect = UI:GetEffectFromLayer( self, self.layers.CRIMINAL_ICO_EFFECT )
	if criminalIcoEffect then
		local hTexCriminal = UI:GetTex( "criminal" )
		criminalIcoEffect:SetSpriteTexture( self.effectInfo.statusIco.icoSpriteName, hTexCriminal )
	end

	local civilianIcoEffect = UI:GetEffectFromLayer( self, self.layers.CIVILIAN_ICO_EFFECT )
	if civilianIcoEffect then
		local hTexCivilian = UI:GetTex( "civilian" )
		civilianIcoEffect:SetSpriteTexture( self.effectInfo.statusIco.icoSpriteName, hTexCivilian )
	end

end


--
function UI.HudPlayerStatusWnd:RecalcLayout()

	local lastTextY1 = self:GetLayerTop( self.layers.KARMA ) + self:GetLayerHeight( self.layers.KARMA )
	local statusSlotIdx = 1

	-- агрессор

	if self:IsLayerVisible( self.layers.AGGRESSOR_EFFECT ) then

		local aggressorEffect = UI:GetEffectFromLayer( self, self.layers.AGGRESSOR_EFFECT )
		if aggressorEffect then

			local pos = UI:Vec2( self.firstSlotPos.x, self.firstSlotPos.y + ( statusSlotIdx - 1 ) * self.slots_dist )

			aggressorEffect:SetPos( pos )
			aggressorEffect:Update( 0 )

		end

		statusSlotIdx = statusSlotIdx + 1
		lastTextY1 = self:GetLayerTop( self.layers.AGGRESSOR_NAME ) + self:GetLayerHeight( self.layers.AGGRESSOR_NAME )

	end

	-- преступник

	if self:IsLayerVisible( self.layers.CRIMINAL_EFFECT ) then

		local criminalEffect = UI:GetEffectFromLayer( self, self.layers.CRIMINAL_EFFECT )
		if criminalEffect then

			local pos = UI:Vec2( self.firstSlotPos.x, self.firstSlotPos.y + ( statusSlotIdx - 1 ) * self.slots_dist )

			criminalEffect:SetPos( pos )
			criminalEffect:Update( 0 )

		end

		statusSlotIdx = statusSlotIdx + 1
		lastTextY1 = self:GetLayerTop( self.layers.CRIMINAL_NAME ) + self:GetLayerHeight( self.layers.CRIMINAL_NAME )

	end

	-- гражданский

	if self:IsLayerVisible( self.layers.CIVILIAN_EFFECT ) then

		local civilianEffect = UI:GetEffectFromLayer( self, self.layers.CIVILIAN_EFFECT )
		if civilianEffect then

			local pos = UI:Vec2( self.firstSlotPos.x, self.firstSlotPos.y + ( statusSlotIdx - 1 ) * self.slots_dist )

			civilianEffect:SetPos( pos )
			civilianEffect:Update( 0 )

		end

		statusSlotIdx = statusSlotIdx + 1
		lastTextY1 = self:GetLayerTop( self.layers.CIVILIAN_NAME ) + self:GetLayerHeight( self.layers.CIVILIAN_NAME )

	end

	-- собственный размер

	local selfHeight = lastTextY1 + self.space_text_btm
	selfHeight = UI:Clamp( selfHeight, self.selfMinHeight, self.selfMaxHeight )

	self:SetHeight( selfHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local animTime = ( selfHeight - self.selfMinHeight ) / ( self.selfMaxHeight - self.selfMinHeight )
		mainEffect:SetAnimationTime( animTime )
		mainEffect:Update( 0 )

	end	

end