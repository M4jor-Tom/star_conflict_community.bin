-- ----------------------------------------------------------------------------
--
-- Workfile: junktooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------
-- UI.JunkTooltipWnd
-- -----------------------------------------------------------------------

UI.JunkTooltipWnd = {}
local jt = UI.JunkTooltipWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.JunkTooltipWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "JunkTooltipWnd",
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

			effects =
			{{
				defName 			= "moduleTooltip_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "tooltip_slot",
						layer		= "UI.JunkTooltipWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "moduleTooltip_work",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по цвету и размеру
					{
						objName		= "title",
						layer		= "UI.JunkTooltipWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "type_descript",
						layer		= "UI.JunkTooltipWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "price",
						layer		= "UI.JunkTooltipWnd.layers.REWARD",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ITEM_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- REWARD
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SEPARATOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- служебный эффект
		-- COLORS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,

			effects =
			{{
				defName 			= "moduleTooltip_colors",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.JunkTooltipWnd:Setup( _data )

	self:Reset()

	if type( _data ) ~= "table" then
		sys.log( "UI.JunkTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end

	local data = UI:CopyTable2( _data )

	if type( data.defName ) ~= "string" then
		sys.log( "UI.JunkTooltipWnd:Setup()[ERROR]: invalid type of \"data.defName\"; \"string\" expected, got \"%s\"", type( data.defName ) )
		return
	end

	if data.priceInfo ~= nil then
    	if type( data.priceInfo ) ~= "table" then
    		sys.log( "UI.JunkTooltipWnd:Setup()[ERROR]: invalid type of \"data.priceInfo\"; \"table\" expected, got \"%s\"", type( data.priceInfo ) )
    		data.priceInfo = nil
    	end
	end

	if data.priceInfo == nil then
		data.priceInfo = UI:GetJunkPriceInfo( data.defName )
	end

	self.defName		= data.defName
	self.priceInfo		= data.priceInfo

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, _data )
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

jt.layers =
{
    MAIN_EFFECT			= 0,
    WORK_EFFECT			= 1,
    ITEM_NAME			= 2,
    DESC				= 3,
    REWARD				= 4,
    SEPARATOR_1_EFFECT	= 5, 
    SEPARATOR_2_EFFECT	= 6,
	COLORS_EFFECT		= 7,
}

jt.effectInfo =
{
	work =
	{
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
		itemIcoLocator		= "icon",
		descLocator			= "type_descript",
		rewardLocator		= "price",
		sepLocatorPrefix	= "spacer_",
		itemNameLocator		= "title",
		premBonusesLocator	= "premium",
	},

	colors =
	{
		priceCreditsLocator				= "price_silver",
		repLocator						= "price_silver",
		priceValFontLocator				= "price_font",
	}
}

jt.MAX_SEPARATORS	= 2

-- -----------------------------------
-- vars
-- -----------------------------------

jt.defName					= ""
jt.priceInfo				= { type = UI.junkPriceTypes.NONE }

jt.itemIcoWnd				= nil
jt.rewardMetaText			= nil

jt.space_itemName_sep		= 0
jt.space_sep_itemIcoTop		= 0
jt.space_sep_descTop		= 0
jt.space_descBlockBtm_sep	= 0
jt.space_sep_priceTop		= 0
jt.space_priceBtm_btm		= 0
jt.workMinHeight			= 0
jt.workMaxHeight			= 0

jt.color_priceCredits		= UI.WHITE_COLOR
jt.color_rep				= UI.WHITE_COLOR
jt.fontId_rewardVal			= FONT.INVALID_FONT_HANDLE

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.JunkTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.rewardMetaText = UI.MetaText.GetNewInstance()
	self.rewardMetaText:InitFromLayer( self, self.layers.REWARD ) 

	self:CreateControls()
	self:PrepareLayoutParams()

	self:Reset()		

end


--
function UI.JunkTooltipWnd:F_Shutdown()

	if self.rewardMetaText then
		self.rewardMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.JunkTooltipWnd:CreateControls()

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )	
	
end


--
function UI.JunkTooltipWnd:PrepareLayoutParams()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local colorsEffect = UI:GetEffectFromLayer( self, self.layers.COLORS_EFFECT )

	local workEffectPos		= workEffect:GetPos()
	local itemNamePos		= workEffect:GetObjPos( self.effectInfo.work.itemNameLocator )
	local itemNameSize		= workEffect:GetObjSize( self.effectInfo.work.itemNameLocator )
	local itemIcoPos		= workEffect:GetObjPos( self.effectInfo.work.itemIcoLocator )
	local itemIcoSize		= Vec2( self.itemIcoWnd:GetLeft(), self.itemIcoWnd:GetHeight() )
	local descPos			= workEffect:GetObjPos( self.effectInfo.work.descLocator )
	local descSize			= workEffect:GetObjSize( self.effectInfo.work.descLocator )
	local pricePos			= workEffect:GetObjPos( self.effectInfo.work.rewardLocator )
	local priceSize			= workEffect:GetObjSize( self.effectInfo.work.rewardLocator )
	local premBonusesPos	= workEffect:GetObjPos( self.effectInfo.work.premBonusesLocator )

    self.workMinHeight		= workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ).y
    self.workMaxHeight		= workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ).y

	local NUM_SEPARATORS_IN_EFFECT = 5
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPARATORS_IN_EFFECT do
		local sepPos = workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end

	self.space_itemName_sep		= sepsPoss[ 1 ].y - ( itemNamePos.y + itemNameSize.y )
	self.space_sep_itemIcoTop	= itemIcoPos.y - sepsPoss[ 1 ].y
	self.space_sep_descTop		= descPos.y - sepsPoss[ 1 ].y
    self.space_descBlockBtm_sep	= premBonusesPos.y - math.max( itemIcoPos.y + itemIcoSize.y, descPos.y + descSize.y )
    self.space_sep_priceTop		= pricePos.y - sepsPoss[ 5 ].y
    self.space_priceBtm_btm		= self.workMaxHeight - ( pricePos.y + priceSize.y )

	if colorsEffect then

        self.color_priceCredits		= colorsEffect:GetObjColor( self.effectInfo.colors.priceCreditsLocator )
		self.color_rep				= colorsEffect:GetObjColor( self.effectInfo.colors.repLocator )

		local priceValFontName = colorsEffect:GetObjFontName( self.effectInfo.colors.priceValFontLocator )
        self.fontId_rewardVal = _G.ObtainFont( priceValFontName )

	end

	self:SetLayerWidth( itemNameSize.x, self.layers.ITEM_NAME )
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( pricePos.x + workEffectPos.x, self.layers.REWARD )

	local sepPos = UI:Vec2( sepsPoss[ 1 ].x, 0 )
	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:SetPos( sepPos )
		end
	end

	self.itemIcoWnd:SetLeft( itemIcoPos.x + workEffectPos.x )

	local selfWidth = workEffect:GetObjSize( "self" ).x
	self:SetWidth( selfWidth )	

end


--
function UI.JunkTooltipWnd:Reset()

    self.defName		= ""
	self.priceInfo		= { type = UI.junkPriceTypes.NONE }

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetText( "", self.layers.DESC )

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	self.itemIcoWnd:Reset()
	self.itemIcoWnd:UnlinkFromParent()

end


--
function UI.JunkTooltipWnd:FullUpdate()

	self:UpdateItemName()
	self:UpdateItemIco()
	self:UpdateDesc()
	self:UpdateReward()

	self:RecalcLayout()

end


--
function UI.JunkTooltipWnd:UpdateItemName()

	local text = UI:GetEntityLocalizedNameByDef( self.defName, true, false, true )	-- TODO: Брать из дефинишена
	self:SetText( text, self.layers.ITEM_NAME )

end


--
function UI.JunkTooltipWnd:UpdateItemIco()

	self.itemIcoWnd:AnimateIcoIdle()

	self:AddChild( self.itemIcoWnd )

	self.itemIcoWnd:SetupForItem( self.defName )

end


--
function UI.JunkTooltipWnd:UpdateDesc()

	local desc = UI:GetEntityDescByDef( self.defName )	-- TODO: брать из прототипа
	self:SetText( desc, self.layers.DESC )

end


--
function UI.JunkTooltipWnd:UpdateReward()

	local str = ""

	if self.priceInfo.type == UI.junkPriceTypes.TOKENS then
		str = string.format( "%s%s$tokens$", UI:Color2Str( self.color_priceCredits ), UI:Num2StrSeparatedBy3( self.priceInfo.tokens ) )

	elseif self.priceInfo.type == UI.junkPriceTypes.CREDITS then

    	local strPriceLabel = UI:GetStringByName( "autoSellPrice" )
    	local strPriceVal = UI:Num2StrSeparatedBy3( self.priceInfo.credits )
    	local strPriceReward = string.format( "$text [text %s][fontId %d][color %u][alignment BASELINE]$$credits_big$", strPriceVal, self.fontId_rewardVal, self.color_priceCredits )

    	str = string.format( "%s: %s", strPriceLabel, strPriceReward )

	else
		sys.log( "UI.JunkTooltipWnd:UpdateReward()[ERROR]: unhandled price type %s for junk item \"%s\"", tostring( self.priceInfo.type ), self.defName )
	end

	self:SetLayerVisible( true, self.layers.REWARD )
	self.rewardMetaText:SetText( str, true )

end      


--
function UI.JunkTooltipWnd:RecalcLayout()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local lastBlockY1 = 0
	local nextSepIdx = 1


	-- имя (размер)

	local itemNameFormatRect = UI:Quat( 0, 0, self:GetWidth(), 100000 )

    local itemNameHeight = _G.MeasureText(
   		self:GetText( self.layers.ITEM_NAME ),
   		self:GetFont( self.layers.ITEM_NAME ),
    	itemNameFormatRect,
   		self:GetTextFormatFlags( self.layers.ITEM_NAME ),
    	itemNameFormatRect ).w

	self:SetLayerHeight( itemNameHeight, self.layers.ITEM_NAME )

	lastBlockY1 = self:GetLayerTop( self.layers.ITEM_NAME ) + itemNameHeight + self.space_itemName_sep


	-- иконка (позиция) и описание (размер, позиция)

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1

	-- иконка

	local itemIcoY0 = lastBlockY1 + self.space_sep_itemIcoTop
	self.itemIcoWnd:SetTop( itemIcoY0 )


	-- описание

	local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 100000 )

    local descHeight = _G.MeasureText(
   		self:GetText( self.layers.DESC ),
   		self:GetFont( self.layers.DESC ),
    	descFormatRect,
   		self:GetTextFormatFlags( self.layers.DESC ),
    	descFormatRect).w

	self:SetLayerHeight( descHeight, self.layers.DESC )

	local descY0 = lastBlockY1 + self.space_sep_descTop
	self:SetLayerTop( descY0, self.layers.DESC )

	lastBlockY1 = math.max( descY0 + descHeight, itemIcoY0 + self.itemIcoWnd:GetHeight() ) + self.space_descBlockBtm_sep


	-- цена (позиция)

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1

	local priceY0 = lastBlockY1 + self.space_sep_priceTop
	self:SetLayerTop( priceY0, self.layers.REWARD )

	lastBlockY1 = priceY0 + self:GetLayerHeight( self.layers.REWARD ) + self.space_priceBtm_btm


	-- размер подложки

	local workY0 = self:GetLayerTop( self.layers.WORK_EFFECT )
	local workHeight = lastBlockY1 - workY0

	local animTime = ( workHeight - self.workMinHeight ) / ( self.workMaxHeight - self.workMinHeight )
	workEffect:SetAnimationTime( animTime )
	workEffect:Update( 0 )


	-- собственный размер

	local selfHeight = lastBlockY1
	self:SetHeight( selfHeight )

end


--
function UI.JunkTooltipWnd:ShowSeparator( sepIdx, y )

	if sepIdx > self.MAX_SEPARATORS then
		sys.log( "UI.JunkTooltipWnd:ShowSeparator()[ERROR]: cannot show separator %d; max separators is %d", sepIdx, self.MAX_SEPARATORS )
		return
	end

	local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1

	self:SetLayerVisible( true, sepLayer )

	local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
	if sepEffect then
		local pos = sepEffect:GetPos()
		pos.y = y
		sepEffect:SetPos( pos )
	end

end


--
function UI.JunkTooltipWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1

		if self:IsLayerVisible( sepLayer ) then
			local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
			if sepEffect then
				sepEffect:Update( 0 )
			end
		end

	end

	self.rewardMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARD )	

end


--
function UI.JunkTooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REWARD then
		self.rewardMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.JunkTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.JunkTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end     


-- --------------------------------------------------------------
-- инстанс общего тултипа
-- --------------------------------------------------------------

UI.JunkTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "JunkTooltipWnd",

    	props =
    	{
    		name		= "JunkTooltipWnd_shared",
    	},	
	}
}