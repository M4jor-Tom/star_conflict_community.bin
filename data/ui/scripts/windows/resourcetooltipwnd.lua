-- ----------------------------------------------------------------------------
--
-- Workfile: resourcetooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.ResourceTooltipWnd = {}
local jt = UI.ResourceTooltipWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.ResourceTooltipWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ResourceTooltipWnd",
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
						layer		= "UI.ResourceTooltipWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TIPS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_tips",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "vol_1",
						layer		= "UI.ResourceTooltipWnd.layers.TIP_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIP_1
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
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
						layer		= "UI.ResourceTooltipWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции, размеру и цвету; по цвету линкуется к эффекту в слое COLORS_EFFECT
					{
						objName		= "type_descript",
						layer		= "UI.ResourceTooltipWnd.layers.ITEM_TYPE",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.ResourceTooltipWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "notice",
						layer		= "UI.ResourceTooltipWnd.layers.TIPS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					-- не линкуется по позиции
					{
						objName		= "atlas_info",
						layer		= "UI.ResourceTooltipWnd.layers.NOT_LEARNED",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS,
					},

					-- не линкуется по позиции и цвету (цвет выставляется белый)
					{
						objName		= "durability",
						layer		= "UI.ResourceTooltipWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
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
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 5, 1 },
			font			= { fontName = "Small" },
		},
		
		-- NOT_LEARNED
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			color			= UI.WHITE_COLOR,
			text			= UI:GetStringByName( "itemCraft_notLearned" ),
		},

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			color			= UI.WHITE_COLOR,
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
		
		-- SEPARATOR_4_EFFECT
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
						layer		= "UI.ResourceTooltipWnd.layers.ITEM_TYPE",
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
function UI.ResourceTooltipWnd:Setup( _data )

	self:Reset()

	if type( _data ) ~= "table" then
		sys.log( "UI.ResourceTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end

	local data = UI:CopyTable2( _data )

	if type( data.defName ) ~= "string" then
		sys.log( "UI.ResourceTooltipWnd:Setup()[ERROR]: invalid type of \"data.defName\"; \"string\" expected, got \"%s\"", type( data.defName ) )
		return
	end

	if not( UI:IsDefResource( data.defName ) or UI:IsDefBlueprint( data.defName ) ) then
		sys.log( "UI.ResourceTooltipWnd:Setup()[ERROR]: \"%s\" is neither resource nor blueprint", data.defName )
		return
	end
	
	if data.fnGetPosCallback ~= nil then
		if type( data.fnGetPosCallback ) ~= "function" then
			sys.log( "UI.ResourceTooltipWnd:Setup()[ERROR]: invalid type of 'fnGetPosCallback'; 'function' or 'nil' expected, got '%s'", type( data.fnGetPosCallback ) )
			data.fnGetPosCallback = nil
		end
	end
	
	self.defName			= data.defName
	self.fnGetPosCallback	= data.fnGetPosCallback

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, _data )
	end

end


--
function UI.ResourceTooltipWnd:GetDefName()

	return self.defName

end


--
function UI.ResourceTooltipWnd:OnPlaceTooltipOnScreen( pos, tooltipData )

	local finalPos = Vec2( pos )

	-- тултип сравнениня
	if self.craftResultTooltipWnd then
	
		-- если окном, нв котором показывается тултип, были определены правила размещения, отличные от дефолтных, то неизвестно, где показывать вторичный тултип;
		-- (а данный момент там, где есть кастомные правила размещения, там нет тултипа сравнения, поэтому эти случаи по факту не будут никогда пересекаться)
		if tooltipWnd and tooltipData.tooltipPlacement and tooltipData.tooltipPlacement ~= UI.tooltipPlacementRules.DEFAULT then
			sys.log( "UI.ResourceTooltipWnd:OnPlaceTooltipOnScreen(): not DEFAULT placement from handler window; unhandled case, tolltip can be shown incorrectly" )
		end
	
		-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0091165);
		-- координаты тоже сбрасываются, поэтому их тоже устанавливать перед показом.
		-- Здесь setup вызывается, т.к. здесь нужно знать размеры, однако эти настройки могут сброситься, если будет вызван reset, поэтому перед показом еще раз вызывать
		
		self.craftResultTooltipWnd:Setup( self.craftResultTooltipData )

    	self.craftResultTooltipPos = Vec2( pos.x - self.craftResultTooltipWnd:GetWidth() - self.space_craftResultTooltip, pos.y )	-- TODO: тултип еще не инициализирован

    	if self.craftResultTooltipPos.y < 0 then
    		self.craftResultTooltipPos.y = 0

    	elseif self.craftResultTooltipPos.y + self.craftResultTooltipWnd:GetHeight() > 768 then
    		self.craftResultTooltipPos.y = 768 - self.craftResultTooltipWnd:GetHeight()
    	end	

    	if self.craftResultTooltipPos.x < 0 then
    		self.craftResultTooltipPos.x = pos.x + self:GetWidth() + self.space_craftResultTooltip
    	end

		if self.craftResultTooltipPos.x + self.craftResultTooltipWnd:GetWidth() > 1024 then
			self.craftResultTooltipPos.x = 1024 - self.craftResultTooltipWnd:GetWidth()
			finalPos.x = self.craftResultTooltipPos.x - self.space_craftResultTooltip - self:GetWidth()			
		end
		
	end
	
	return finalPos

end


-- -----------------------------------
-- const
-- -----------------------------------

jt.layers =
{
	MAIN_EFFECT			= 0,
	TIPS_EFFECT			= 1,
	TIP_1				= 2,
	WORK_EFFECT			= 3,
	ITEM_NAME			= 4,
	ITEM_TYPE			= 5,
	DESC				= 6,
	NOT_LEARNED			= 7,
	COUNT				= 8,
	SEPARATOR_1_EFFECT	= 9,
	SEPARATOR_2_EFFECT	= 10,
	SEPARATOR_3_EFFECT	= 11,
	SEPARATOR_4_EFFECT	= 12,
	COLORS_EFFECT		= 13,
}

jt.effectInfo =
{
	work =
	{
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
		itemIcoLocator		= "icon",
		itemTypeLocator		= "type_descript",
		descLocator			= "description",
		sepLocatorPrefix	= "spacer_",
		itemNameLocator		= "title",
		tipsLocator			= "notice",
		notLearnedLocator	= "atlas_info",
		countLocator		= "durability",
	},
}

jt.MAX_TIPS			= 1
jt.MAX_SEPARATORS	= 4

jt.tipTypes =
{
	CRAFT_RESULT	= 1,
}

jt.space_craftResultTooltip	= UI:XTo1024x768( 10, { x = 1280, y = 720 } )
jt.SOURCE_DESC_COLOR = UI.TEXT_SEL_COLOR

-- -----------------------------------
-- vars
-- -----------------------------------

jt.defName						= ""
jt.fnGetPosCallback				= nil

jt.itemIcoWnd					= nil
jt.shipPartIcoWnd				= nil
jt.descMetaText					= nil

jt.space_itemName_sep			= 0
jt.space_sep_itemIcoTop			= 0
jt.space_sep_itemType			= 0
jt.space_itemIcoBtm_sep			= 0
jt.space_sep_descTop			= 0
jt.space_descBtm_sep			= 0
jt.space_sep_notLearnedTop		= 0
jt.space_notLearnedBtm_sep		= 0
jt.space_sep_countTop			= 0
jt.space_countBtm_btm			= 0
jt.space_leftBorder_itemIco		= 0
jt.space_itemIco_itemType		= 0
jt.space_itemType_rightBorder	= 0
jt.workMinHeight				= 0
jt.workMaxHeight				= 0
jt.tipsHeight					= 0

jt.craftResultTooltipWnd		= nil
jt.craftResultTooltipData		= nil
jt.craftResultTooltipPos		= Vec2( 0, 0 )
jt.bSecondary					= false

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ResourceTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self.craftResultTooltipPos = Vec2( 0, 0 )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayoutParams()

	self.descMetaText = UI.MetaText.GetNewInstance()
	self.descMetaText:InitFromLayer( self, self.layers.DESC ) 
	self.descMetaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.DESC ), 1000000 ), true )

	self:Reset()		

end


--
function UI.ResourceTooltipWnd:F_Shutdown()

	if self.descMetaText then
		self.descMetaText:Clear()
	end

	self:DestroyCraftResultTooltip()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ResourceTooltipWnd:CreateControls()

	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )	
	self.itemIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )

	self.shipPartIcoWnd	= UI:CreateChildWnd( self, UI.ShipPartIcoWnd, "" )
	self.shipPartIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
	
end


--
function UI.ResourceTooltipWnd:PrepareLayoutParams()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local tipsEffect = UI:GetEffectFromLayer( self, self.layers.TIPS_EFFECT )

	local workEffectPos		= workEffect:GetPos()
	local itemNamePos		= workEffect:GetObjPos( self.effectInfo.work.itemNameLocator )
	local itemNameSize		= workEffect:GetObjSize( self.effectInfo.work.itemNameLocator )
	local itemIcoPos		= workEffect:GetObjPos( self.effectInfo.work.itemIcoLocator )
	local itemIcoSize		= Vec2( self.itemIcoWnd:GetWidth(), self.itemIcoWnd:GetHeight() )
	local itemTypePos		= workEffect:GetObjPos( self.effectInfo.work.itemTypeLocator )
	local itemTypeSize		= workEffect:GetObjSize( self.effectInfo.work.itemTypeLocator )
	local descPos			= workEffect:GetObjPos( self.effectInfo.work.descLocator )
	local descSize			= workEffect:GetObjSize( self.effectInfo.work.descLocator )
	local notLearnedPos		= workEffect:GetObjPos( self.effectInfo.work.notLearnedLocator )
	local notLearnedSize	= workEffect:GetObjSize( self.effectInfo.work.notLearnedLocator )
	local countPos			= workEffect:GetObjPos( self.effectInfo.work.countLocator )
	local countSize			= workEffect:GetObjSize( self.effectInfo.work.countLocator )
	local selfSize			= workEffect:GetObjSize( "self" )

	self.workMinHeight		= workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ).y
	self.workMaxHeight		= workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ).y

	local NUM_SEPARATORS_IN_EFFECT = 5
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPARATORS_IN_EFFECT do
		local sepPos = workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end

	self.space_itemName_sep			= sepsPoss[ 1 ].y - ( itemNamePos.y + itemNameSize.y )
	self.space_sep_itemIcoTop		= itemIcoPos.y - sepsPoss[ 1 ].y
	self.space_sep_itemType			= itemTypePos.y - sepsPoss[ 1 ].y
	self.space_itemIcoBtm_sep		= self.space_sep_itemIcoTop
	self.space_sep_descTop			= descPos.y - sepsPoss[ 3 ].y
	self.space_descBtm_sep			= sepsPoss[ 4 ].y - ( descPos.y + descSize.y )
	self.space_sep_notLearnedTop	= notLearnedPos.y - sepsPoss[ 4 ].y
	self.space_notLearnedBtm_sep	= sepsPoss[ 5 ].y - ( notLearnedPos.y + notLearnedSize.y )
    self.space_sep_countTop			= countPos.y - sepsPoss[ 5 ].y
	self.space_countBtm_btm			= self.workMaxHeight - ( countPos.y + countSize.y )
	self.space_leftBorder_itemIco	= itemTypePos.x + workEffectPos.x
	self.space_itemIco_itemType		= itemTypePos.x - ( itemIcoPos.x + itemIcoSize.x )
	self.space_itemType_rightBorder	= selfSize.x - ( itemTypePos.x + itemTypeSize.x )
	self.tipsHeight					= tipsEffect and tipsEffect:GetObjSize( "self" ).y or 0

	self:SetLayerWidth( itemNameSize.x, self.layers.ITEM_NAME )
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( countPos.x + workEffectPos.x, self.layers.COUNT )

	local sepPos = UI:Vec2( sepsPoss[ 1 ].x, 0 )
	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:SetPos( sepPos )
		end
	end

	self.itemIcoWnd:SetLeft( itemIcoPos.x + workEffectPos.x )
	self.shipPartIcoWnd:SetLeft( itemIcoPos.x + workEffectPos.x )

	local selfWidth = selfSize.x
	self:SetWidth( selfWidth )	

end


--
function UI.ResourceTooltipWnd:Reset()

    self.defName			= ""
	self.fnGetPosCallback	= nil

	self:SetLayerVisible( false, self.layers.TIPS_EFFECT )
	for tipIdx = 1, self.MAX_TIPS do
		self:SetLayerVisible( false, self.layers.TIP_1 + tipIdx - 1 )
	end

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetText( "", self.layers.ITEM_TYPE )

	self.descMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.DESC )
	self:SetLayerVisible( false, self.layers.NOT_LEARNED )

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	self.itemIcoWnd:Reset()
	self.itemIcoWnd:UnlinkFromParent()

	self.shipPartIcoWnd:Reset()
	self.shipPartIcoWnd:UnlinkFromParent()

	self:DestroyCraftResultTooltip()

	self:SetLayerVisible( false, self.layers.COUNT )

end


--
function UI.ResourceTooltipWnd:FullUpdate()

	self:UpdateItemName()
	self:UpdateItemIco()
	self:UpdateItemType()
	self:UpdateDesc()
	self:UpdateCount()
	self:UdateNotLearned()
	self:UpdateCraftResultTooltip()
	self:UpdateTips()	-- должно быть после UpdateCraftResultTooltip()

	self:RecalcLayout()

end


--
function UI.ResourceTooltipWnd:UpdateItemName()

	local text = UI:GetEntityLocalizedNameByDef( self.defName, true, false, true, false )
	self:SetText( text, self.layers.ITEM_NAME )

end


--
function UI.ResourceTooltipWnd:UpdateItemIco()

	if UI:IsDefShipPart( self.defName ) then

    	self:AddChild( self.shipPartIcoWnd )
		self.shipPartIcoWnd:Setup( self.defName )

	else

    	self:AddChild( self.itemIcoWnd )

    	self.itemIcoWnd:AnimateIcoIdle()
    	self.itemIcoWnd:SetupForItem( self.defName )

	end

end


--
function UI.ResourceTooltipWnd:UpdateItemType()

	local subType = UI:GetItemSubType( self.defName )
	local strSubType = UI:ItemSubType2Str( subType )

	local str = string.format( "%s: %s", UI:GetStringByName( "itemTooltip_itemType" ), strSubType )
	self:SetText( str, self.layers.ITEM_TYPE )

end


--
function UI.ResourceTooltipWnd:UpdateDesc()

	local strDesc = ""

	-- ингредиенты для крафта из этого ресурса и результат крафта
	-- (сейчас актуально только для блупринтов, т.к. из ресурсов больше нельзя создавать)

	local crafResultDefName, craftResultCount = UI:GetResourceCraftResult( self.defName )
	if crafResultDefName ~= "" then

    	local ingredients = UI:GetResourceCraftIngredients( self.defName )
    	if not next( ingredients ) then
    		sys.log( "UI.ResourceTooltipWnd:UpdateDesc()[ERROR]: no craft ingredients for resource \"%s\"", self.defName )
    	end

    	local strBaseColor	= UI:Color2Str( self:GetColor( self.layers.DESC ) )
    	local strSelColor	= UI:Color2Str( UI.TEXT_SEL_COLOR )
    	local strRedColor	= UI:Color2Str( UI.PARAM_DELTA_MINUS_COLOR )

    	local craftResultLocalizedName = UI:GetEntityLocalizedNameByDef( crafResultDefName, true, false, true, false )
    	craftResultLocalizedName = string.format( "%s%s", craftResultLocalizedName, strBaseColor )	

    	local strCraftResult = ""

    	if craftResultCount > 1 then

    		strCraftResult = UI:GetStringByName( "resourceTooltip_desc_craftResultMulty" )

    		local tSub =
    		{
    			item	= craftResultLocalizedName,
    			count	= UI:Num2StrSeparatedBy3( craftResultCount ),
    		}

    		strCraftResult = string.gsub( strCraftResult, "%$(.-)%$", tSub )

    	else
    		strCraftResult = craftResultLocalizedName
    	end		

    	local strIngredients = ""

    	for ingredientIdx = 1, #ingredients do

    		local ingredientInfo = ingredients[ ingredientIdx ]		
    		local bEnough = UI:IsEnoughIngredient( ingredientInfo, 1 )

    		local strIngredient = ""

    		if ingredientInfo.type == UI.resourceIngredientTypes.RESOURCE or ingredientInfo.type == UI.resourceIngredientTypes.MODULE then

    			local ingredientLocalizedName = ""

    			if bEnough then

    				ingredientLocalizedName = UI:GetEntityLocalizedNameByDef( ingredientInfo.defName, true, false, true, false )
    				ingredientLocalizedName = string.format( "%s%s", ingredientLocalizedName, strBaseColor )

    			else

    				ingredientLocalizedName = UI:GetEntityLocalizedNameByDef( ingredientInfo.defName, false, false, true, false )

    				if ingredientInfo.type == UI.resourceIngredientTypes.MODULE then

    					local mark = UI:GetItemQuality( ingredientInfo.defName )
    					local strMark = UI:ItemQuality2Str( mark )

    					ingredientLocalizedName = string.format( "%s (%s)", ingredientLocalizedName, strMark )

    				end
    				
    			end

        		local strCount = UI:Num2StrSeparatedBy3( ingredientInfo.count )

        		local tIngredientSubst =
        		{
        			ingredient	= ingredientLocalizedName,
        			count		= strCount,			
        		}

        		local numIngredientSubst = 0
        		strIngredient = UI:GetStringByName( "resourceTooltip_desc_ingredient" )

        		strIngredient, numIngredientSubst = string.gsub( strIngredient, "%$(.-)%$", tIngredientSubst )

            	if numIngredientSubst ~= UI:GetTableLength( tIngredientSubst ) then
            		sys.log( "UI.ResourceTooltipWnd:UpdateDesc()[ERROR]: invalid placeholders in string \"resourceTooltip_desc_ingredient\"" )
            	end		

    		elseif ingredientInfo.type == UI.resourceIngredientTypes.CREDITS then
        		strIngredient = UI:GetStringByName( "resourceTooltip_desc_ingredient_currency" )
    			local strVal = string.format( "%s$credits_big$", UI:Num2StrSeparatedBy3( ingredientInfo.count ) )
    			strIngredient = string.gsub( strIngredient, "%$val%$", strVal )

    		elseif ingredientInfo.type == UI.resourceIngredientTypes.GOLD then
        		strIngredient = UI:GetStringByName( "resourceTooltip_desc_ingredient_currency" )
    			local strVal = string.format( "%s$gold_big$", UI:Num2StrSeparatedBy3( ingredientInfo.count ) )
    			strIngredient = string.gsub( strIngredient, "%$val%$", strVal )

    		elseif ingredientInfo.type == UI.resourceIngredientTypes.TOKENS then
        		strIngredient = UI:GetStringByName( "resourceTooltip_desc_ingredient_currency" )
    			local strVal = string.format( "%s$tokens_big$", UI:Num2StrSeparatedBy3( ingredientInfo.count ) )
    			strIngredient = string.gsub( strIngredient, "%$val%$", strVal )
    		end

    		local strIngredientColor = bEnough and strBaseColor or strRedColor
    		strIngredient = string.format( "%s%s%s", strIngredientColor, strIngredient, strBaseColor )

    		strIngredients = string.format( "%s%s%s", strIngredients, strIngredients ~= "" and "|" or "", strIngredient )

    	end

    	local tDescSubst =
    	{
    		result		= strCraftResult,
    		ingredients	= strIngredients,
    	}

    	local numDescSubst = 0
    	strDesc = UI:GetStringByName( "resourceTooltip_desc" )

    	strDesc, numDescSubst = string.gsub( strDesc, "%$(.-)%$", tDescSubst )

    	if numDescSubst ~= UI:GetTableLength( tDescSubst ) then
    		sys.log( "UI.ResourceTooltipWnd:UpdateDesc()[ERROR]: invalid placeholders in string \"resourceTooltip_desc\"" )
    	end

	end


	-- художественное описание
	
	if not UI:IsDefBlueprint( self.defName ) then	-- для чертежей - не надо SC-111954
	
		local loreDesc = ""

		local def = UI:GetDef( self.defName )
		if def then
			if type( def.uiDesc ) == "string" then
				loreDesc = UI:GetStringByName( def.uiDesc )
			end
		end

		if loreDesc ~= "" then

			if strDesc ~= "" then
				strDesc = string.format( "%s||%s", loreDesc, strDesc )
			else
				strDesc = loreDesc
			end

		end
		
	end


	-- описание того, как можно добыть данный тип ресурсов
	
	local sourceDesc = UI:GetItemSourceDesc( self.defName, self.SOURCE_DESC_COLOR )
	if sourceDesc ~= "" then

		local strBaseColor = UI:Color2Str( self:GetColor( self.layers.DESC ) )
		sourceDesc = string.format( "%s%s", sourceDesc, strBaseColor )

		strDesc = string.format( "%s%s%s", strDesc, strDesc ~= "" and "||" or "", sourceDesc )
		
	end


	if strDesc ~= "" then
    	self:SetLayerVisible( true, self.layers.DESC )
		self.descMetaText:SetText( strDesc, true )	
	end

end


--
function UI.ResourceTooltipWnd:UpdateCount()

	if UI:IsDefResource( self.defName ) or UI:IsDefBlueprint( self.defName ) then

    	self:SetLayerVisible( true, self.layers.COUNT )

		local curCount	= UI:GetPlayerResourceCount( self.defName )
		local maxCount	= UI:GetPlayerResourceMaxCount( self.defName )

		local str = UI:MakeItemStorageString( true, curCount, maxCount, 0, nil, false, self:GetColor( self.layers.COUNT ) )

		self:SetText( str, self.layers.COUNT )

	else
    	self:SetLayerVisible( false, self.layers.COUNT )
	end

end


--
function UI.ResourceTooltipWnd:UdateNotLearned()
	
	local bVisible = UI:IsDefBlueprint( self.defName ) and not UI:IsBluePrintLearned( self.defName )
	self:SetLayerVisible( bVisible, self.layers.NOT_LEARNED )
	
end


--
function UI.ResourceTooltipWnd:UpdateCraftResultTooltip()

	if self.bSecondary then
		return
	end

	local crafResultDefName, craftResultCount = UI:GetResourceCraftResult( self.defName )
	if crafResultDefName == "" then
		return
	end

	if UI:IsDefResource( crafResultDefName ) or UI:IsDefBlueprint( crafResultDefName ) then

    	self.craftResultTooltipWnd = UI:CreateChildWnd( self, UI.CompareResourceTooltipWnd, "" )	

    	self.craftResultTooltipData =
    	{
    		tooltipType		= UI.tooltipTypes.RESOURCE,
    		defName			= crafResultDefName,
    	}

	elseif UI:IsDefModule( crafResultDefName ) or UI:IsDefAmmo( crafResultDefName ) then

    	self.craftResultTooltipWnd = UI:CreateChildWnd( self, UI.CompareModuleTooltipWnd, "" )	

		local bEnchanted = false
		if UI:IsDefBlueprint( self.defName ) then
			bEnchanted = UI:IsBlueprintEnchanted( self.defName )
		end

    	self.craftResultTooltipData =
    	{
    		tooltipType		= UI.tooltipTypes.MODULE,
    		defName			= crafResultDefName,
			bEnchanted		= bEnchanted,
    	}	

	else
		sys.log( "UI.ResourceTooltipWnd:UpdateCraftResultTooltip()[ERROR]: unhandled type of craft result %s for resource %s", crafResultDefName, self.defName )
	end

end   


--
function UI.ResourceTooltipWnd:UpdateTips()

	if self.bSecondary then
		return
	end

	local bHasTips = false

	if self.craftResultTooltipWnd then
		self:SetupTip( 1, self.tipTypes.CRAFT_RESULT )
		bHasTips = true
	end

	if bHasTips then
		self:SetLayerVisible( true, self.layers.TIPS_EFFECT )
	end

end


--
function UI.ResourceTooltipWnd:SetupTip( tipIdx, tipType )

	if tipIdx > self.MAX_TIPS then
		sys.log( "UI.ResourceTooltipWnd:SetupTip()[ERROR]: cannot show tip %d; max tips is %d", tipIdx, self.MAX_TIPS )
		return
	end

	local tipTypeName = UI:Val2Key( self.tipTypes, tipType )
	local strId = string.format( "itemTooltip_action_%s", tipTypeName )
	local tipText = UI:GetStringByName( strId )

	local tipLayer = self.layers.TIP_1 + tipIdx - 1 

	self:SetLayerVisible( true, tipLayer )
	self:SetText( tipText, tipLayer )	

end


--
function UI.ResourceTooltipWnd:RecalcLayout()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local lastBlockY1 = 0
	local nextSepIdx = 1


	-- имя (размер)

	local itemNameFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.ITEM_NAME ), 100000 )

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

	local itemIcoWnd = nil

	if self.itemIcoWnd:IsChildOf( self ) then
		itemIcoWnd = self.itemIcoWnd
	elseif self.shipPartIcoWnd:IsChildOf( self ) then
		itemIcoWnd = self.shipPartIcoWnd
	end

	local itemIcoY1 = lastBlockY1

	if itemIcoWnd then

		local itemIcoY0 = lastBlockY1 + self.space_sep_itemIcoTop
		itemIcoWnd:SetTop( itemIcoY0 )

		itemIcoY1 = itemIcoY0 + itemIcoWnd:GetHeight()

	end

	-- тип предмета

	local itemTypeY = lastBlockY1 + self.space_sep_itemType

	local itemTypeX =
		itemIcoWnd
			and ( itemIcoWnd:GetLeft() + itemIcoWnd:GetWidth() + self.space_itemIco_itemType )
			or self.space_leftBorder_itemIco

	local itemTypeW = ( self:GetWidth() - self.space_itemType_rightBorder ) - itemTypeX

	local itemTypeFormatRect = UI:Quat( 0, 0, itemTypeW, 100000 )

	local itemTypeH = _G.MeasureText(
		self:GetText( self.layers.ITEM_TYPE ),
		self:GetFont( self.layers.ITEM_TYPE ),
		itemTypeFormatRect,
		self:GetTextFormatFlags( self.layers.ITEM_TYPE ),
		itemTypeFormatRect ).w

	self:SetLayerRect( UI:Quat( itemTypeX, itemTypeY, itemTypeW, itemTypeH ), self.layers.ITEM_TYPE )

	lastBlockY1 = math.max( itemTypeY + itemTypeH, itemIcoY1 ) + self.space_itemIcoBtm_sep

	-- описание

	if self:IsLayerVisible( self.layers.DESC ) then

		self:ShowSeparator( nextSepIdx, lastBlockY1 )
		nextSepIdx = nextSepIdx + 1

		local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 100000 )
	
		local descHeight = _G.MeasureText(
			self.descMetaText:GetFormattedText(),
			self:GetFont( self.layers.DESC ),
			descFormatRect,
			self:GetTextFormatFlags( self.layers.DESC ),
			descFormatRect ).w
	
		local descY0 = lastBlockY1 + self.space_sep_descTop
		self:SetLayerTop( descY0, self.layers.DESC )
	
		lastBlockY1 = descY0 + descHeight + self.space_descBtm_sep

	end
	
	
	-- не изучен (только для чертежей) (позиция)
	
	if self:IsLayerVisible( self.layers.NOT_LEARNED ) then
	
		self:ShowSeparator( nextSepIdx, lastBlockY1 )
		nextSepIdx = nextSepIdx + 1
		
		local notLearnedY0 = lastBlockY1 + self.space_sep_notLearnedTop	
		self:SetLayerTop( notLearnedY0, self.layers.NOT_LEARNED )
		lastBlockY1 = notLearnedY0 + self:GetLayerHeight( self.layers.NOT_LEARNED ) + self.space_notLearnedBtm_sep
	
	end


	-- количество (позиция)

	if self:IsLayerVisible( self.layers.COUNT ) then
	
		self:ShowSeparator( nextSepIdx, lastBlockY1 )
		nextSepIdx = nextSepIdx + 1
		
		local countY0 = lastBlockY1 + self.space_sep_countTop
		self:SetLayerTop( countY0, self.layers.COUNT )
		lastBlockY1 = countY0 + self:GetLayerHeight( self.layers.COUNT ) + self.space_countBtm_btm -- TODO: переименовать space_countBtm_btm

	end
	
	
	-- размер подложки

	local workY0 = self:GetLayerTop( self.layers.WORK_EFFECT )
	local workHeight = lastBlockY1 - workY0

	local animTime = ( workHeight - self.workMinHeight ) / ( self.workMaxHeight - self.workMinHeight )
	workEffect:SetAnimationTime( animTime )
	workEffect:Update( 0 )


	-- собственный размер

	local selfHeight = lastBlockY1

	if self:IsLayerVisible( self.layers.TIPS_EFFECT ) then

		local tipsPos = workEffect:GetObjPos( self.effectInfo.work.tipsLocator )
		local tipsY1 = tipsPos.y + self.tipsHeight + workY0

		selfHeight = math.max( tipsY1, lastBlockY1 )

	end

	self:SetHeight( selfHeight )

end


--
function UI.ResourceTooltipWnd:ShowSeparator( sepIdx, y )

	if sepIdx > self.MAX_SEPARATORS then
		sys.log( "UI.ResourceTooltipWnd:ShowSeparator()[ERROR]: cannot show separator %d; max separators is %d", sepIdx, self.MAX_SEPARATORS )
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
function UI.ResourceTooltipWnd:UpdateEffects()

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

	self.descMetaText:UpdateScreenOrgFromLayer( self, self.layers.DESC )	

end


--
function UI.ResourceTooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.DESC then
		self.descMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ResourceTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.ResourceTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ResourceTooltipWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:CheckCraftResultTooltip()

end
  


--
function UI.ResourceTooltipWnd:CheckCraftResultTooltip()

	if not self.craftResultTooltipWnd then
		return
	end

	local bNeedCraftResultTooltip = _G.Input_IsKeyPressed( UI.Keys.KEY_ALT )
	local bIsCraftResultTooltip = self.craftResultTooltipWnd:IsOnScreen()

	if bNeedCraftResultTooltip and not bIsCraftResultTooltip then
		self:ShowCraftResultTooltip()

	elseif not bNeedCraftResultTooltip and bIsCraftResultTooltip then
		self:HideCraftResultTooltip()
	end

end


--
function UI.ResourceTooltipWnd:ShowCraftResultTooltip()

	if self.craftResultTooltipWnd:IsOnScreen() then
		return
	end

	-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0091165)
	-- координаты тоже сбрасываются, поэтому их тоже устанавливать перед показом.
	self.craftResultTooltipWnd:Setup( self.craftResultTooltipData )
	self.craftResultTooltipWnd:SetPos( self.craftResultTooltipPos )
	
	UI.Root:AddChild( self.craftResultTooltipWnd )
	UI.Root:MoveChildToLastPosition( self.craftResultTooltipWnd )

end


--
function UI.ResourceTooltipWnd:HideCraftResultTooltip()

	if not self.craftResultTooltipWnd or not self.craftResultTooltipWnd:IsOnScreen() then
		return
	end

	self.craftResultTooltipWnd:UnlinkFromParent()

end 


--
function UI.ResourceTooltipWnd:DestroyCraftResultTooltip()

	if self.craftResultTooltipWnd then
	
		UI:RemoveUiObj( self.craftResultTooltipWnd:GetUiHandle() )
		UI:Purge()
		
		self.craftResultTooltipWnd = nil
		self.craftResultTooltipData = nil
		self.craftResultTooltipPos = Vec2( 0, 0 )
		
	end

end


--
function UI.ResourceTooltipWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:HideCraftResultTooltip()

end   


-- --------------------------------------------------------------
-- UI.CompareResourceTooltipWnd
-- --------------------------------------------------------------

UI.CompareResourceTooltipWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.CompareResourceTooltipWnd.def =
{
	className	= "Wnd",
	prototype	= "ResourceTooltipWnd",

	props =
	{
		name		= "CompareResourceTooltipWnd",
		isPrototype	= true,
	},	
}

-- --------------------------------------
-- interface funtions
-- --------------------------------------

--
function UI.CompareResourceTooltipWnd:SetPos( pos )

	self.pos = UI:Vec2CopyStable( pos )

	if self:IsOnScreen() then
		self:PlaceOnScreen()
	end	

end

-- --------------------------------------
-- vars
-- --------------------------------------

UI.CompareResourceTooltipWnd.pos		= Vec2( 0, 0 )
UI.CompareResourceTooltipWnd.bSecondary	= true

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.CompareResourceTooltipWnd:F_PostLoad()

	UI.ResourceTooltipWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.pos = Vec2( 0, 0 )	

end


--
function UI.CompareResourceTooltipWnd:Reset()

	UI.ResourceTooltipWnd.Reset( self )
	self.pos.x, self.pos.y = 0, 0

end


--
function UI.CompareResourceTooltipWnd:PlaceOnScreen()

	self:SetLeft( self.pos.x )
	self:SetTop( self.pos.y )

	self:UpdateEffects()

end


--
function UI.CompareResourceTooltipWnd:F_OnAfterShowOnScreen()

	UI.ResourceTooltipWnd.OnAfterShowOnScreen( self )

	self:PlaceOnScreen()

end


-- --------------------------------------------------------------
-- инстанс общего тултипа
-- --------------------------------------------------------------

UI.ResourceTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "ResourceTooltipWnd",

    	props =
    	{
    		name		= "ResourceTooltipWnd_shared",
    	},	
	}
}