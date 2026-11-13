-- ----------------------------------------------------------------------------
--
-- Workfile: pricetooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------
-- UI.PriceTooltipWnd
-- -----------------------------------------------------------------------

UI.PriceTooltipWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.PriceTooltipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PriceTooltipWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
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
				defName 			= "tooltip",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           		
           			{
           				objName		= "title",
						layer		= "UI.PriceTooltipWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "text",
						layer		= "UI.PriceTooltipWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           		}
			}}		
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 10, 5 },
   			font			= { fontName = "Small" },
		}, 
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.PriceTooltipWnd:Setup( tooltipData, bRestorePos )

	self:Reset()

	if type( tooltipData ) == "table" then

		if UI:IsPriceInfoValid( tooltipData.priceInfo ) then
			self.priceInfo = tooltipData.priceInfo 
		else
			sys.log( "UI.PriceTooltipWnd:Setup()[ERROR]: invalid price formnat" )
    	end

		if self.priceInfo then

			if tooltipData.playerMoney ~= nil then

				if type( tooltipData.playerMoney ) == "number" then
					self.playerMoney = tooltipData.playerMoney
				else
					sys.log( "UI.PriceTooltipWnd:Setup()[ERROR]: invalid type of \"playerMoney\"; \"number\" or \"nil\" expected, got \"%s\"", type( tooltipData.playerMoney ) )
				end

			end

		end

	else
		sys.log( "UI.PriceTooltipWnd:Setup()[ERROR]: invalid type of the 1-st param (\"tooltipData\"); \"table\" expected, got \"%s\"", type( tooltipData ) )
	end	

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, tooltipData )
	end

end

-- ------------------------------
-- const
-- ------------------------------

UI.PriceTooltipWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    TEXT		= 2,
}

UI.PriceTooltipWnd.effectInfo =
{
	main =
	{
		minSelfHeightObjName	= "dist_min_win",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PriceTooltipWnd.priceInfo	= nil
UI.PriceTooltipWnd.playerMoney	= nil

UI.PriceTooltipWnd.metaText		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PriceTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), true )

end


--
function UI.PriceTooltipWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.PriceTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PriceTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.PriceTooltipWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos()
	end

	self:UpdateMetaTextPos()

end     


--
function UI.PriceTooltipWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.PriceTooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.PriceTooltipWnd:Reset()

	self.priceInfo		= nil
	self.playerMoney	= nil

	self:SetText( "", self.layers.CAPTION )
	self.metaText:SetText( "", true )

end


--
function UI.PriceTooltipWnd:FullUpdate()

	self:UpdateCaption()
	self:UpdateText()

	self:RecalcLayout()

end


--
function UI.PriceTooltipWnd:UpdateCaption()

	if not self.priceInfo then
		self:SetText( "", self.layers.CAPTION )
		return 
	end

	local caption = "" 

	local strBaseColor = UI:Color2Str( UI.TEXT_BASE_COLOR )
	local strSelColor = UI:Color2Str( UI.TEXT_SEL_COLOR )

	if self.priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS then
		caption = string.format( "%s%s", strBaseColor, UI:GetStringByName( "creditsPriceTooltip_caption" ) )

	elseif self.priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then
		caption = string.format( "%s%s", UI:Color2Str( UI.GOLD_COLOR ), UI:GetStringByName( "goldPriceTooltip_caption" ) )

	elseif self.priceInfo.priceType == _G.GameStore.CreditsType.CT_TOKENS then
		caption = string.format( "%s%s", strBaseColor, UI:GetStringByName( "tokensPriceTooltip_caption" ) )

	elseif self.priceInfo.priceType == UI.exPriceTypes.CLAN_IRIDIUM then
		caption = string.format( "%s%s", strBaseColor, UI:GetStringByName( "clanIridiumPriceTooltip_caption" ) )

	elseif self.priceInfo.priceType == UI.exPriceTypes.SYNERGY then
		caption = string.format( "%s%s", strBaseColor, UI:GetStringByName( "synergyPriceTooltip_caption" ) )

	elseif self.priceInfo.priceType == UI.exPriceTypes.FREE_SYNERGY then
		caption = string.format( "%s%s", strBaseColor, UI:GetStringByName( "freeSynergyPriceTooltip_caption" ) )

	elseif self.priceInfo.priceType == _G.GameStore.CreditsType.CT_EVENT then
		caption = string.format( "%s%s", strBaseColor, UI:GetStringByName( "eventCreditsPriceTooltip_caption" ) )

	else
		sys.log( "UI.PriceTooltipWnd:UpdateCaption()[ERROR]: unhandled price type: %d", self.priceInfo.priceType )
	end

	self:SetText( caption, self.layers.CAPTION )

end


--
function UI.PriceTooltipWnd:UpdateText()

	if not self.priceInfo then
		self.metaText:SetText( "", true )
		return
	end

	local text = "" 

	local strBaseColor = UI:Color2Str( UI.TEXT_BASE_COLOR )
	local strSelColor = UI:Color2Str( UI.TEXT_SEL_COLOR )

	local curVal	= 0
	local maxVal	= -1
	local desc		= ""
	local bCurVal	= true
	local bNeedVal	= self.priceInfo.bIsBuyPrice

	if self.priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS then

		desc	= UI:GetStringByName( "creditsPriceTooltip_desc" )
		curVal	= self.playerMoney or UI:GetPlayerMoney( false )
		maxVal	= UI:GetCreditsMax()

	elseif self.priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then

		desc	= UI:GetStringByName( "goldPriceTooltip_desc" )
		curVal	= self.playerMoney or UI:GetPlayerMoney( true )

	elseif self.priceInfo.priceType == _G.GameStore.CreditsType.CT_TOKENS then

		desc	= UI:GetStringByName( "tokensPriceTooltip_desc" )
		curVal	= self.playerMoney or UI:GetPlayerTokens()
		maxVal	= UI:GetTokensMax()

	elseif self.priceInfo.priceType == UI.exPriceTypes.CLAN_IRIDIUM then

		desc	= UI:GetStringByName( "clanIridiumPriceTooltip_desc" )
		curVal	= self.playerMoney or UI:GetIridium()

	elseif self.priceInfo.priceType == UI.exPriceTypes.SYNERGY then

		desc	= UI:GetStringByName( "synergyPriceTooltip_desc" )

		bCurVal		= false
		bNeedVal	= false

	elseif self.priceInfo.priceType == UI.exPriceTypes.FREE_SYNERGY then

		desc	= UI:GetStringByName( "freeSynergyPriceTooltip_desc" )
		curVal	= self.playerMoney or UI:GetPlayerFreeSynergy()
		maxVal	= UI:GetFreeSynergyMax()

	elseif self.priceInfo.priceType == _G.GameStore.CreditsType.CT_EVENT then

		desc	= UI:GetStringByName( "eventCreditsPriceTooltip_desc" )
		curVal	= self.playerMoney or UI:GetPlayerEventCredits()
		maxVal	= UI:GetEventCreditsMax()

	else
		sys.log( "UI.PriceTooltipWnd:UpdateText()[ERROR]: unhandled price type: %d", self.priceInfo.priceType )
	end

	text = string.format( "%s%s", strBaseColor, desc )


	local strVals = ""

	-- требуемое количество (только для цены покупки)

	if bNeedVal then

		local strNeedVal = ""

		local needVal	= self.priceInfo.val
		local missVal	= needVal > curVal and needVal - curVal or 0

		local tSubstNeedVal =
		{
			need_val	= string.format( "%s%s%s", strSelColor, UI:Num2StrSeparatedBy3( needVal ), strBaseColor ),
			miss_val	= string.format( "%s%s%s", strSelColor, UI:Num2StrSeparatedBy3( missVal ), strBaseColor ),
		}

		strNeedVal = missVal > 0 and UI:GetStringByName( "priceTooltip_needVal_notEnough" ) or UI:GetStringByName( "priceTooltip_needVal_enough" )
		strNeedVal = string.gsub( strNeedVal, "%$(.-)%$", tSubstNeedVal )

		strVals = string.format( "%s%s%s", strVals, strVals ~= "" and "|" or "", strNeedVal )

	end

	-- текущее количество ресурсов у игрока

	if bCurVal then
	
		local strVal = maxVal ~= -1 and string.format( "%s/%s", UI:Num2StrSeparatedBy3( curVal ), UI:Num2StrSeparatedBy3( maxVal ) ) or UI:Num2StrSeparatedBy3( curVal )
		strVal = string.format( "%s%s%s", strSelColor, strVal, strBaseColor )

		local strCurVal = UI:GetStringByName( "priceTooltip_curVal" )
		strCurVal = string.gsub( strCurVal, "%$cur_val%$", strVal )

		strVals = string.format( "%s%s%s", strVals, strVals ~= "" and "|" or "", strCurVal )

	end

	-- все вместе: описание, требуемое количество (для цены покупки), текущее количество
	if strVals ~= "" then
		text = string.format( "%s||%s", text, strVals )
	end


	self.metaText:SetText( text, true )

end


--
function UI.PriceTooltipWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfHeight 	= mainEffect:GetObjSize( "self" ).y
	local minSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.minSelfHeightObjName ).y
	local maxTextRect		= self:GetLayerRect( self.layers.TEXT )
	local space_text_bottom	= maxSelfHeight - ( maxTextRect.y + maxTextRect.w )

	local fp = self.metaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )
	
	local textHeight = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		fp.hFont,
   		formatRect,
   		fp.formatFlags,
   		formatRect ).w

	local selfHeight = maxTextRect.y + textHeight + space_text_bottom
	selfHeight = UI:Clamp( selfHeight, minSelfHeight, maxSelfHeight )
	
	mainEffect:UnlinkWnd( self:GetUiHandle(), "self" )
	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

end


-- --------------------------------------------------------------
-- инстанс общего тултипа
-- --------------------------------------------------------------

UI.PriceTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "PriceTooltipWnd",

    	props =
    	{
    		name		= "PriceTooltipWnd_shared",
    	},	
	}
}