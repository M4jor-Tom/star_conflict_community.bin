-- ----------------------------------------------------------------------------
--
-- Workfile: tokenitemtooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------
-- UI.TokenItemTooltipWnd
-- -----------------------------------------------------------------------

UI.TokenItemTooltipWnd = {}
local tit = UI.TokenItemTooltipWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.TokenItemTooltipWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "TokenItemTooltipWnd",
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
						layer		= "UI.TokenItemTooltipWnd.layers.WORK_EFFECT",
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
					-- не линкуетс€ по цвету и размеру
					{
						objName		= "title",
						layer		= "UI.TokenItemTooltipWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуетс€ по позиции и размеру
					{
						objName		= "type_descript",
						layer		= "UI.TokenItemTooltipWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуетс€ по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.TokenItemTooltipWnd.layers.SRC_DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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

		-- SRC_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
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

		-- SEPARATOR_3_EFFECT
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
function UI.TokenItemTooltipWnd:Setup( _data )

	self:Reset()

	if type( _data ) ~= "table" then
		sys.log( "UI.TokenItemTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end

	local data = UI:CopyTable2( _data )

	if type( data.defName ) ~= "string" then
		sys.log( "UI.TokenItemTooltipWnd:Setup()[ERROR]: invalid type of \"data.defName\"; \"string\" expected, got \"%s\"", type( data.defName ) )
		return
	end	

	self.defName	= data.defName

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, _data )
	end

end

-- -----------------------------------
-- const
-- -----------------------------------

tit.layers =
{
    MAIN_EFFECT			= 0,
    WORK_EFFECT			= 1,
    ITEM_NAME			= 2,
    DESC				= 3,
	SRC_DESC			= 4,
    SEPARATOR_1_EFFECT	= 5,
    SEPARATOR_2_EFFECT	= 6,
    SEPARATOR_3_EFFECT	= 7,
	COLORS_EFFECT		= 8,
}

tit.effectInfo =
{
	work =
	{
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
		itemIcoLocator		= "icon",
		descLocator			= "type_descript",
		srcDescLocator		= "description",
		sepLocatorPrefix	= "spacer_",
		itemNameLocator		= "title",
		premiumLocator		= "premium",
	},

	colors =
	{
		repLocator	= "price_silver",
	}
}

tit.MAX_SEPARATORS	= 3

-- -----------------------------------
-- vars
-- -----------------------------------

tit.defName					= ""

tit.itemIcoWnd				= nil

tit.space_itemName_sep		= 0
tit.space_sep_itemIcoTop	= 0
tit.space_sep_descTop		= 0
tit.space_descBlockBtm_sep	= 0
tit.space_sep_srcDescTop	= 0
tit.space_srcDescBtm_sep	= 0
tit.workMinHeight			= 0
tit.workMaxHeight			= 0
tit.color_rep				= UI.WHITE_COLOR

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.TokenItemTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayoutParams()

	self:Reset()		

end


--
function UI.TokenItemTooltipWnd:CreateControls()

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )	
	
end


--
function UI.TokenItemTooltipWnd:PrepareLayoutParams()

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
	local srcDescPos		= workEffect:GetObjPos( self.effectInfo.work.srcDescLocator )
	local srcDescSize		= workEffect:GetObjSize( self.effectInfo.work.srcDescLocator )
	local premiumPos		= workEffect:GetObjPos( self.effectInfo.work.premiumLocator )

    self.workMinHeight		= workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ).y
    self.workMaxHeight		= workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ).y

	local NUM_SEPARATORS_IN_EFFECT = 4
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPARATORS_IN_EFFECT do
		local sepPos = workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end

	self.space_itemName_sep		= sepsPoss[ 1 ].y - ( itemNamePos.y + itemNameSize.y )
	self.space_sep_itemIcoTop	= itemIcoPos.y - sepsPoss[ 1 ].y
	self.space_sep_descTop		= descPos.y - sepsPoss[ 1 ].y
    self.space_descBlockBtm_sep	= premiumPos.y - math.max( itemIcoPos.y + itemIcoSize.y, descPos.y + descSize.y )
	self.space_sep_srcDescTop	= srcDescPos.y - sepsPoss[ 3 ].y
	self.space_srcDescBtm_sep	= sepsPoss[ 4 ].y - ( srcDescPos.y + srcDescSize.y )    

	if colorsEffect then
		self.color_rep = colorsEffect:GetObjColor( self.effectInfo.colors.repLocator )
	end

	self:SetLayerWidth( itemNameSize.x, self.layers.ITEM_NAME )
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( srcDescPos.x + workEffectPos.x, self.layers.SRC_DESC )
	self:SetLayerWidth( srcDescSize.x, self.layers.SRC_DESC )

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
function UI.TokenItemTooltipWnd:Reset()

    self.defName		= ""

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetText( "", self.layers.DESC )
	self:SetText( "", self.layers.SRC_DESC )

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	self.itemIcoWnd:Reset()
	self.itemIcoWnd:UnlinkFromParent()

end


--
function UI.TokenItemTooltipWnd:FullUpdate()

	self:UpdateItemName()
	self:UpdateItemIco()
	self:UpdateDesc()
	self:UpdateSrcDesc()

	self:RecalcLayout()

end


--
function UI.TokenItemTooltipWnd:UpdateItemName()

	local str = UI:GetEntityLocalizedNameByDef( self.defName, true, false, false )
	self:SetText( str, self.layers.ITEM_NAME )

end


--
function UI.TokenItemTooltipWnd:UpdateItemIco()

	self:AddChild( self.itemIcoWnd )

	self.itemIcoWnd:SetupForItem( self.defName )

 	self.itemIcoWnd:AnimateIcoIdle()

end


--
function UI.TokenItemTooltipWnd:UpdateDesc()

	local str = UI:GetTokenItemDesc( self.defName )
	self:SetText( str, self.layers.DESC )

end


--
function UI.TokenItemTooltipWnd:UpdateSrcDesc()

	local srcDefName = UI:GetTokenItemSrcDefName( self.defName )

	local srcSubType = UI:GetItemSubType( srcDefName )
	local srcSubTypeDesc = UI:GetItemSubTypeDesc( srcSubType )

	local strSrcDesc = UI:GetStringByName( "tokenItemSourceDesc" )

	-- подставл€ть только через таблицу! т.к. внутри текста может быть символ "%"
	local tSubst =
	{
		desc = srcSubTypeDesc
	}

	strSrcDesc = string.gsub( strSrcDesc, "%$(.-)%$", tSubst )


	local color = self:GetColor( self.layers.SRC_DESC )

	local fitModulesInfos = UI:GetTokenItemAllSrcInventoryInfo( self.defName, false )
	local fitModulesDesc = UI:TokenItemSrcInventoryInfo2Str( fitModulesInfos, color, false, false, true )

	local str = string.format( "%s||%s", strSrcDesc, fitModulesDesc )
	self:SetText( str, self.layers.SRC_DESC )

end


--
function UI.TokenItemTooltipWnd:RecalcLayout()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local lastBlockY1 = 0
	local nextSepIdx = 1


	-- им€ (размер)

	local itemNameFormatRect = UI:Quat( 0, 0, self:GetWidth(), 100000 )

    local itemNameHeight = _G.MeasureText(
   		self:GetText( self.layers.ITEM_NAME ),
   		self:GetFont( self.layers.ITEM_NAME ),
    	itemNameFormatRect,
   		self:GetTextFormatFlags( self.layers.ITEM_NAME ),
    	itemNameFormatRect ).w

	self:SetLayerHeight( itemNameHeight, self.layers.ITEM_NAME )

	lastBlockY1 = self:GetLayerTop( self.layers.ITEM_NAME ) + itemNameHeight + self.space_itemName_sep


	-- иконка (позици€) и описание (размер, позици€)

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1

	-- иконка

	local itemIcoY0 = lastBlockY1 + self.space_sep_itemIcoTop
	self.itemIcoWnd:SetTop( itemIcoY0 )


	-- описание токен-итема

	local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 100000 )

    local descHeight = _G.MeasureText(
   		self:GetText( self.layers.DESC ),
   		self:GetFont( self.layers.DESC ),
    	descFormatRect,
   		self:GetTextFormatFlags( self.layers.DESC ),
    	descFormatRect ).w

	self:SetLayerHeight( descHeight, self.layers.DESC )

	local descY0 = lastBlockY1 + self.space_sep_descTop
	self:SetLayerTop( descY0, self.layers.DESC )

	lastBlockY1 = math.max( descY0 + descHeight, itemIcoY0 + self.itemIcoWnd:GetHeight() ) + self.space_descBlockBtm_sep


	-- описание модул€, который апгрейдитс€, и перечисление подход€щих модулей из инвентар€

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1

	local srcDescFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.SRC_DESC ), 100000 )

    local srcDescHeight = _G.MeasureText(
   		self:GetText( self.layers.SRC_DESC ),
   		self:GetFont( self.layers.SRC_DESC ),
    	srcDescFormatRect,
   		self:GetTextFormatFlags( self.layers.SRC_DESC ),
    	srcDescFormatRect ).w

	self:SetLayerHeight( srcDescHeight, self.layers.SRC_DESC )

	local srcDescY0 = lastBlockY1 + self.space_sep_srcDescTop
	self:SetLayerTop( srcDescY0, self.layers.SRC_DESC )

	lastBlockY1 = srcDescY0 + srcDescHeight + self.space_srcDescBtm_sep


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
function UI.TokenItemTooltipWnd:ShowSeparator( sepIdx, y )

	if sepIdx > self.MAX_SEPARATORS then
		sys.log( "UI.TokenItemTooltipWnd:ShowSeparator()[ERROR]: cannot show separator %d; max separators is %d", sepIdx, self.MAX_SEPARATORS )
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
function UI.TokenItemTooltipWnd:UpdateEffects()

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

end


--
function UI.TokenItemTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.TokenItemTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываетьс€ при инициализации окна, когда еще слои не созданы
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

UI.TokenItemTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "TokenItemTooltipWnd",

    	props =
    	{
    		name		= "TokenItemTooltipWnd_shared",
    	},	
	}
}