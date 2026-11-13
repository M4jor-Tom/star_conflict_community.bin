-- ----------------------------------------------------------------------------
--
-- Workfile: resourcetooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.SpecModulePartsTooltipWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.SpecModulePartsTooltipWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "SpecModulePartsTooltipWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
						layer		= "UI.SpecModulePartsTooltipWnd.layers.WORK_EFFECT",
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
						layer		= "UI.SpecModulePartsTooltipWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции, размеру и цвету; по цвету линкуется к эффекту в слое COLORS_EFFECT
					{
						objName		= "type_descript",
						layer		= "UI.SpecModulePartsTooltipWnd.layers.ITEM_TYPE",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.SpecModulePartsTooltipWnd.layers.DESC",
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

		-- ITEM_TYPE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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

				links =
				{
					-- линкуется только по цвету, по остальным параметрам - к эффекту в слое ITEM_TYPE
					{
						objName		= "type",
						layer		= "UI.SpecModulePartsTooltipWnd.layers.ITEM_TYPE",
						animParams	= UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.SpecModulePartsTooltipWnd:Setup( data )

	self:Reset()

	if type( data ) ~= "table" then
		sys.log( "UI.SpecModulePartsTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( data ) )
		return
	end

	local shipDefName = data.shipDefName

	if type( shipDefName ) ~= "string" then
		sys.log( "UI.SpecModulePartsTooltipWnd:Setup()[ERROR]: invalid type of \"data.shipDefName\"; \"string\" expected, got \"%s\"", type( shipDefName ) )
		return
	end

	self.shipDefName = shipDefName

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, data )
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.SpecModulePartsTooltipWnd.layers =
{
    MAIN_EFFECT			= 0,
    WORK_EFFECT			= 1,
    ITEM_NAME			= 2,
	ITEM_TYPE			= 3,
    DESC				= 4,
    SEPARATOR_1_EFFECT	= 5, 
    SEPARATOR_2_EFFECT	= 6,
	COLORS_EFFECT		= 7,
}

UI.SpecModulePartsTooltipWnd.effectInfo =
{
	work =
	{
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
		icoLocator		= "icon",
		itemTypeLocator		= "type_descript",
		descLocator			= "description",
		sepLocatorPrefix	= "spacer_",
		itemNameLocator		= "title",
	},
}

UI.SpecModulePartsTooltipWnd.MAX_SEPARATORS	= 2
UI.SpecModulePartsTooltipWnd.DESC_COLOR		= UI.TEXT_SEL_COLOR

-- -----------------------------------
-- vars
-- -----------------------------------

UI.SpecModulePartsTooltipWnd.shipDefName				= ""
UI.SpecModulePartsTooltipWnd.icoWnd						= nil
UI.SpecModulePartsTooltipWnd.space_itemName_sep			= 0
UI.SpecModulePartsTooltipWnd.space_sep_icoTop			= 0
UI.SpecModulePartsTooltipWnd.space_sep_itemType			= 0
UI.SpecModulePartsTooltipWnd.space_icoBtm_sep			= 0
UI.SpecModulePartsTooltipWnd.space_sep_descTop			= 0
UI.SpecModulePartsTooltipWnd.space_descBtm_btm			= 0
UI.SpecModulePartsTooltipWnd.space_leftBorder_ico		= 0
UI.SpecModulePartsTooltipWnd.space_ico_itemType			= 0
UI.SpecModulePartsTooltipWnd.space_itemType_rightBorder	= 0
UI.SpecModulePartsTooltipWnd.workMinHeight				= 0
UI.SpecModulePartsTooltipWnd.workMaxHeight				= 0

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.SpecModulePartsTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayoutParams()

	self:Reset()		

end


--
function UI.SpecModulePartsTooltipWnd:CreateControls()

	self.icoWnd = UI:CreateChildWnd( self, UI.SpecModulePartIcoWnd, "" )	
	self.icoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
    self:AddChild( self.icoWnd )
	
end


--
function UI.SpecModulePartsTooltipWnd:PrepareLayoutParams()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )		-- нддҐЄв а бзЁв ­ ­  ¤агЈго ЁЄ®­Єг

	local workEffectPos		= workEffect:GetPos()
	local itemNamePos		= workEffect:GetObjPos( self.effectInfo.work.itemNameLocator )
	local itemNameSize		= workEffect:GetObjSize( self.effectInfo.work.itemNameLocator )
	local itemIcoPos		= workEffect:GetObjPos( self.effectInfo.work.icoLocator )
	local itemIcoSize		= Vec2( itemIcoWnd:GetWidth(), itemIcoWnd:GetHeight() )
	local itemTypePos		= workEffect:GetObjPos( self.effectInfo.work.itemTypeLocator )
	local itemTypeSize		= workEffect:GetObjSize( self.effectInfo.work.itemTypeLocator )
	local descPos			= workEffect:GetObjPos( self.effectInfo.work.descLocator )
	local descSize			= workEffect:GetObjSize( self.effectInfo.work.descLocator )
	local selfSize			= workEffect:GetObjSize( "self" )

    self.workMinHeight		= workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ).y
    self.workMaxHeight		= workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ).y

	local NUM_SEPARATORS_IN_EFFECT = 4
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPARATORS_IN_EFFECT do
		local sepPos = workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end

	self.space_itemName_sep			= sepsPoss[ 1 ].y - ( itemNamePos.y + itemNameSize.y )
	self.space_sep_icoTop			= itemIcoPos.y - sepsPoss[ 1 ].y
	self.space_sep_itemType			= itemTypePos.y - sepsPoss[ 1 ].y
	self.space_icoBtm_sep			= self.space_sep_icoTop
	self.space_sep_descTop			= descPos.y - sepsPoss[ 3 ].y
    self.space_descBtm_btm			= sepsPoss[ 4 ].y - ( descPos.y + descSize.y )
	self.space_leftBorder_ico		= itemTypePos.x + workEffectPos.x
	self.space_ico_itemType			= itemTypePos.x - ( itemIcoPos.x + itemIcoSize.x )
	self.space_itemType_rightBorder	= selfSize.x - ( itemTypePos.x + itemTypeSize.x )

	self:SetLayerWidth( itemNameSize.x, self.layers.ITEM_NAME )
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC )

	local sepPos = UI:Vec2( sepsPoss[ 1 ].x, 0 )
	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:SetPos( sepPos )
		end
	end

	self.icoWnd:SetLeft( itemIcoPos.x + workEffectPos.x )

	local selfWidth = selfSize.x
	self:SetWidth( selfWidth )	

	UI:RemoveUiObj( itemIcoWnd:GetUiHandle() )
	UI:Purge()

end


--
function UI.SpecModulePartsTooltipWnd:Reset()

    self.shipDefName = ""

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetText( "", self.layers.ITEM_TYPE )
	self:SetText( "", self.layers.DESC )

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	self.icoWnd:Reset()

end


--
function UI.SpecModulePartsTooltipWnd:FullUpdate()

	self:UpdateItemName()
	self:UpdateIco()
	self:UpdateItemType()
	self:UpdateDesc()

	self:RecalcLayout()

end


--
function UI.SpecModulePartsTooltipWnd:UpdateItemName()

	local str = UI:SpecModuleParts2Str( self.shipDefName )
	self:SetText( str, self.layers.ITEM_NAME )

end


--
function UI.SpecModulePartsTooltipWnd:UpdateIco()

	self.icoWnd:Setup( self.shipDefName )

end


--
function UI.SpecModulePartsTooltipWnd:UpdateItemType()

	local strTypeName = UI:GetStringByName( "specModulePartsTooltip_itemType" )
	local str = string.format( "%s: %s", UI:GetStringByName( "itemTooltip_itemType" ), strTypeName )

	self:SetText( str, self.layers.ITEM_TYPE )

end


--
function UI.SpecModulePartsTooltipWnd:UpdateDesc()

	local str = string.format( "%s%s", UI:Color2Str( self.DESC_COLOR ), UI:GetStringByName( "specModulePartsTooltip_desc" ) )
	self:SetText( str, self.layers.DESC )

end


--
function UI.SpecModulePartsTooltipWnd:RecalcLayout()

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


	-- иконка (позиция) и тип предмета (позиция)

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1


	-- иконка

	local icoY0 = lastBlockY1 + self.space_sep_icoTop
	local icoY1 = icoY0 + self.icoWnd:GetHeight()
	self.icoWnd:SetTop( icoY0 )


	-- тип предмета

	local itemTypeY = lastBlockY1 + self.space_sep_itemType
	local itemTypeX = self.icoWnd:GetLeft() + self.icoWnd:GetWidth() + self.space_ico_itemType
	local itemTypeW = ( self:GetWidth() - self.space_itemType_rightBorder ) - itemTypeX

	local itemTypeFormatRect = UI:Quat( 0, 0, itemTypeW, 100000 )

    local itemTypeH = _G.MeasureText(
   		self:GetText( self.layers.ITEM_TYPE ),
   		self:GetFont( self.layers.ITEM_TYPE ),
    	itemTypeFormatRect,
   		self:GetTextFormatFlags( self.layers.ITEM_TYPE ),
    	itemTypeFormatRect ).w

	self:SetLayerRect( UI:Quat( itemTypeX, itemTypeY, itemTypeW, itemTypeH ), self.layers.ITEM_TYPE )

	lastBlockY1 = math.max( itemTypeY + itemTypeH, icoY1 ) + self.space_icoBtm_sep


	-- описание (позиция, размер)

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1

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

	lastBlockY1 = descY0 + descHeight + self.space_descBtm_btm


	-- размер подложки

	local workY0 = self:GetLayerTop( self.layers.WORK_EFFECT )
	local workHeight = lastBlockY1 - workY0

	local animTime = ( workHeight - self.workMinHeight ) / ( self.workMaxHeight - self.workMinHeight )
	workEffect:SetAnimationTimeAndUpdate( animTime )


	-- собственный размер

	local selfHeight = lastBlockY1
	self:SetHeight( selfHeight )

end


--
function UI.SpecModulePartsTooltipWnd:ShowSeparator( sepIdx, y )

	if sepIdx > self.MAX_SEPARATORS then
		sys.log( "UI.SpecModulePartsTooltipWnd:ShowSeparator()[ERROR]: cannot show separator %d; max separators is %d", sepIdx, self.MAX_SEPARATORS )
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