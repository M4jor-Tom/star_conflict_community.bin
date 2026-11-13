-- --------------------------------------------------------------------
-- UI.ItemCraft_WorkWnd
-- --------------------------------------------------------------------

UI.ItemCraft_WorkWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.ItemCraft_WorkWnd.layers =
{
	MAIN_EFFECT				= 0,
	NAME					= 1,
	DESC					= 2,
	CRAFT_COUNT_LABEL		= 3,
	CRAFT_COUNT_ENCHANTED	= 4,
	TARGET_SHIP				= 5,
	STORED_COUNT			= 6,
	INGREDIENTS_CAPTION		= 7,
	NOT_CRAFTABLE_DESC		= 8,
}


--
UI.ItemCraft_WorkWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name			= "ItemCraft_WorkWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		activationOrder	= 0,
		isPrototype		= true,
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
				defName 			= "itemCraft_selBlueprint",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ItemCraft_WorkWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "description",
						layer		= "UI.ItemCraft_WorkWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "resource",
						layer		= "UI.ItemCraft_WorkWnd.layers.INGREDIENTS_CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "resource1",
						layer		= "UI.ItemCraft_WorkWnd.layers.CRAFT_COUNT_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "resource2",
						layer		= "UI.ItemCraft_WorkWnd.layers.CRAFT_COUNT_ENCHANTED",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text",
						layer		= "UI.ItemCraft_WorkWnd.layers.TARGET_SHIP",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "resource4",
						layer		= "UI.ItemCraft_WorkWnd.layers.STORED_COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "note",
						layer		= "UI.ItemCraft_WorkWnd.layers.NOT_CRAFTABLE_DESC",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font 			= { fontName = "Small" },
		},

		-- CRAFT_COUNT_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
			text			= UI:GetStringByName( "itemCraft_count" ),
		},

		-- CRAFT_COUNT_ENCHANTED
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
		},

		-- TARGET_SHIP
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
		},

		-- STORED_COUNT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
		},

		-- INGREDIENTS_CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
			text			= UI:GetStringByName( "itemCraft_ingredients" ),
		},

		-- NOT_CRAFTABLE_DESC
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font 			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ItemCraft_WorkWnd:Setup( itemDefName, blueprintDefName, bEnchanted, iidToUpgrade, vidToEquip, slotIdToEquip, prevItems )

	if type( itemDefName ) ~= "string" then
		sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"itemDefName\"); \"string\" expected, got \"%s\"", type( itemDefName ) )
		return
	end
	
	if blueprintDefName ~= nil then
		if type( blueprintDefName ) == "string" then
		
			if blueprintDefName ~= "" then
				local craftResult = UI:GetResourceCraftResult( blueprintDefName )
				if craftResult ~= itemDefName then
					sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid blueprint %s for item %s", blueprintDefName, itemDefName )
					return
				end
			end
		
		else
			sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"blueprintDefName\"); \"string\" or \"nil\" expected, got \"%s\"", type( blueprintDefName ) )
			return
		end
	end
	
	if UI:IsStrEmpty( blueprintDefName ) then
		blueprintDefName = UI:GetBlueprintForItemCraft( itemDefName, true )
	end

	if bEnchanted ~= nil then
    	if type( bEnchanted ) ~= "boolean" then
    		sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"bEnchanted\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bEnchanted ) )
    		return
    	end
	end

	if iidToUpgrade ~= nil then
    	if type( iidToUpgrade ) ~= "userdata" then
    		sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid type of the 4-th parameter (\"iidToUpgrade\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( iidToUpgrade ) )
    		return
    	end
	else
		iidToUpgrade = UI.INVALID_U64_ID
	end

	if vidToEquip ~= nil then
    	if type( vidToEquip ) ~= "userdata" then
    		sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid type of the 5-th parameter (\"vidToEquip\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( vidToEquip ) )
    		return
    	end
	else
		vidToEquip = UI.INVALID_U64_ID
	end

	if vidToEquip ~= UI.INVALID_U64_ID then

    	if type( slotIdToEquip ) ~= "number" then
    		sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid type of the 6-th parameter (\"slotIdToEquip\"); \"number\" expected, got \"%s\"", type( slotIdToEquip ) )
			return
    	end

	end

	if iidToUpgrade ~= UI.INVALID_U64_ID and vidToEquip ~= UI.INVALID_U64_ID then

		sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: both iidToUpgrade and vidToEquip are set; not supported case" )

		vidToEquip		= UI.INVALID_U64_ID
    	slotIdToEquip	= -1

	end

	if prevItems ~= nil then

    	if type( prevItems ) == "table" then

			for chainIdx, chainItem in pairs( prevItems ) do

				local bError = false

				if type( chainIdx ) == "number" and type( chainItem ) == "table" then

					if type( chainItem.defName ) ~= "string" or type( chainItem.bEnchanted ) ~= "boolean" then
						sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid format of item #%d in prevItems; {defName=<string>, bEnchanted=<boolean>} expected; got {defName=<%s>, bEnchanted=<%s>}", chainIdx, type( chainItem.defName ), type( chainItem.bEnchanted ) )
						bError = true
					end

				else
					sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid format of prevItems; <number>=<table> expected, got <%s>=<%s>", type( chainIdx ), type( chainItem ) )
					bError = true
				end

				if bError then
					prevItems = nil
					break
				end

			end

		else

    		sys.log( "UI.ItemCraft_WorkWnd:Setup()[ERROR]: invalid type of the 7-th parameter (\"prevItems\"); \"table\" or \"nil\" expected, got \"%s\"", type( prevItems ) )
			prevItems = nil

    	end

	end

	if prevItems == nil then
		prevItems = {}
	end

	local itemsChain = UI:CopyTable2( prevItems )
	table.insert( itemsChain, { defName = itemDefName, bEnchanted = bEnchanted } )

	if bEnchanted == nil then

    	if iidToUpgrade ~= UI.INVALID_U64_ID then
        	bEnchanted = UI:IsInventoryItemEnchantedById( iidToUpgrade )

    	elseif blueprintDefName ~= "" then
    		bEnchanted = UI:IsBlueprintEnchanted( blueprintDefName )

		else
			bEnchanted = false
    	end

	end

	self:Reset()

	self.itemDefName		= itemDefName
	self.blueprintDefName	= blueprintDefName
	self.bEnchanted			= bEnchanted
	self.iidToUpgrade		= iidToUpgrade
	self.vidToEquip			= vidToEquip
	self.slotIdToEquip		= slotIdToEquip
	self.itemsChain			= itemsChain

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ItemCraft_WorkWnd:Reset()

	self.itemDefName		= ""
	self.blueprintDefName	= ""
	self.bEnchanted			= false
	self.iidToUpgrade		= UI.INVALID_U64_ID
	self.vidToEquip			= UI.INVALID_U64_ID
	self.slotIdToEquip		= -1
	self.itemsChain			= {}

	self:ResetContent()

end


--
function UI.ItemCraft_WorkWnd:GetItem()

	return self.itemDefName, self.bEnchanted

end


--
function UI.ItemCraft_WorkWnd:GetCraftCount()

	local val = 0

	if not self:NeedShowCraftCount() then
		val = 1
	else
		if self.craftCountEditWnd:IsChildOf( self ) then
		    local text = self.craftCountEditWnd:GetEditText()
			if text ~= "" then
				val = tonumber( text )
			end
		end
	end

	return val

end


--
function UI.ItemCraft_WorkWnd:SetCraftCount( count )

	if not self.craftCountEditWnd:IsChildOf( self ) then

		if count ~= 1 then
			sys.log( "UI.ItemCraft_WorkWnd:SetCraftCount()[ERROR]: craft count edit wnd is not on screen" )
		end

		return

	end

    self.craftCountEditWnd:SetEditText( tostring( count ) )

end


--
function UI.ItemCraft_WorkWnd:OnEditMissMouse( editWnd )

	if editWnd:GetUiHandle() == UI:GetKeyboardFocus() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )
		UI:ValidateKeyboardFocus()
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.ItemCraft_WorkWnd.effectInfo =
{
	main =
	{
		ingredientsListLocator		= "res_item",
		craftCountEditLocator		= "input",
		craftCountLeftArrowLocator	= "btn_left",
		craftCountRightArrowLocator	= "btn_left1",
		icoLocator					= "icon",
		chainLocator				= "resources_ico",
		darkeningLocator			= "blackout",
		nameLocator					= "title",
		descLocator					= "description",
	}
}

UI.ItemCraft_WorkWnd.MAX_CRAFT_COUNT	= 99

-- ------------------------------
-- vars
-- ------------------------------

UI.ItemCraft_WorkWnd.itemDefName			= ""
UI.ItemCraft_WorkWnd.blueprintDefName		= ""
UI.ItemCraft_WorkWnd.bEnchanted				= false
UI.ItemCraft_WorkWnd.iidToUpgrade			= UI.INVALID_U64_ID
UI.ItemCraft_WorkWnd.vidToEquip				= UI.INVALID_U64_ID
UI.ItemCraft_WorkWnd.slotIdToEquip			= -1
UI.ItemCraft_WorkWnd.itemsChain				= {}

UI.ItemCraft_WorkWnd.ingredientsList		= nil
UI.ItemCraft_WorkWnd.craftCountEditWnd		= nil
UI.ItemCraft_WorkWnd.craftCountLeftArrow	= nil
UI.ItemCraft_WorkWnd.craftCountRightArrow	= nil
UI.ItemCraft_WorkWnd.chainWnd				= nil
UI.ItemCraft_WorkWnd.darkeningWnd			= nil
UI.ItemCraft_WorkWnd.storedCountMetaText	= nil
UI.ItemCraft_WorkWnd.notCraftableMetaText	= nil

UI.ItemCraft_WorkWnd.space_name_desc		= 0
UI.ItemCraft_WorkWnd.descBtm				= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ItemCraft_WorkWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.storedCountMetaText = UI.MetaText.GetNewInstance()
	self.storedCountMetaText:InitFromLayer( self, self.layers.STORED_COUNT )
	
	self.notCraftableMetaText = UI.MetaText.GetNewInstance()
	self.notCraftableMetaText:InitFromLayer( self, self.layers.NOT_CRAFTABLE_DESC )

	self:CreateControls()
	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )

end


--
function UI.ItemCraft_WorkWnd:F_Shutdown()

	if self.storedCountMetaText then
		self.storedCountMetaText:Clear()
	end
	
	if self.notCraftableMetaText then
		self.notCraftableMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ItemCraft_WorkWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываетьс€ при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ItemCraft_WorkWnd:UpdateMetaTextPos()

	self.storedCountMetaText:UpdateScreenOrgFromLayer( self, self.layers.STORED_COUNT )
	self.notCraftableMetaText:UpdateScreenOrgFromLayer( self, self.layers.NOT_CRAFTABLE_DESC )

end


--
function UI.ItemCraft_WorkWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.STORED_COUNT then
		self.storedCountMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.NOT_CRAFTABLE_DESC then
		self.notCraftableMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ItemCraft_WorkWnd:CreateControls()

    self.ingredientsList		= UI:CreateChildWnd( self, UI.ItemCraft_MainIngredientsListWnd, "" )
    self.craftCountEditWnd		= UI:CreateChildWnd( self, UI.ItemCraft_CraftCountEditWnd, "" )
    self.craftCountLeftArrow	= UI:CreateChildWnd( self, UI.ItemCraft_CraftCountLeftArrowBtn, "" )
    self.craftCountRightArrow	= UI:CreateChildWnd( self, UI.ItemCraft_CraftCountRightArrowBtn, "" )
	self.chainWnd				= UI:CreateChildWnd( self, UI.ItemCraft_ChainWnd, "" )
	self.darkeningWnd			= UI:CreateChildWnd( self, UI.ItemCraft_DarkeningWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.chainWnd, mainEffect, self.effectInfo.main.chainLocator, UI.EffectAnimParams.POS )

end


--
function UI.ItemCraft_WorkWnd:ResetContent()

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.DESC )
	self:SetLayerVisible( false, self.layers.TARGET_SHIP )
	self:SetLayerVisible( false, self.layers.NOT_CRAFTABLE_DESC )

	if self.storedCountMetaText then
		self.storedCountMetaText:SetText( "", true )
	end
	
	if self.notCraftableMetaText then
		self.notCraftableMetaText:SetText( "", true )
	end

	self:ResetCraftCountControls()
	self:ResetIngredientsList()
	self:ResetDarkeningWnd()
	self.chainWnd:Reset()

end


--
function UI.ItemCraft_WorkWnd:FullUpdate()

	self:ResetContent()

	if self.itemDefName == "" then
		return
	end

	self:UpdateName()
	self:UpdateCraftCountControls()
	self:UpdateTargetShip()
	self:UpdateIngredientsList()
	self:UpdateDarkeningWnd()
	self:UpdateStoredCount()
	self:UpdateItemsChain()
	self:UpdateNotCraftableDesc()

	self:RecalcLayout()
	self:UpdateDesc()		-- об€зательно после RecalcLayout(), т.к. там вычисл€етс€ область дл€ описани€ (важно дл€ добавлени€ многоточи€)

end


--
function UI.ItemCraft_WorkWnd:UpdateIngredientsList()

	self:ResetIngredientsList()

	if self.blueprintDefName == "" then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.ingredientsList, mainEffect, self.effectInfo.main.ingredientsListLocator, UI.EffectAnimParams.POS )
	self:SetLayerVisible( true, self.layers.INGREDIENTS_CAPTION )

	local ingredients = UI:GetResourceCraftIngredients( self.blueprintDefName )
	local craftCount = self:GetCraftCount()

	local itemToUpgradeDefName = ""

	if self.iidToUpgrade ~= UI.INVALID_U64_ID then

		local inventoryItem = UI:GetInventoryItem( self.iidToUpgrade )
		if inventoryItem then
			itemToUpgradeDefName = inventoryItem.defName
		else
			sys.log( "UI.ItemCraft_WorkWnd:UpdateIngredientsList()[ERROR]: cannot find inventory item to upgrade" )
		end

	end

	for ingredientIdx, ingredient in ipairs( ingredients ) do

		local bFit = false

		if ingredient.type == UI.resourceIngredientTypes.MODULE then
			bFit = true

		elseif ingredient.type == UI.resourceIngredientTypes.RESOURCE then

			if ingredient.defName ~= self.blueprintDefName then
				bFit = true
			end

		end

		if bFit then

			local bEnchanted	= ingredient.type == UI.resourceIngredientTypes.MODULE and self.bEnchanted
			local count			= 0

			if ingredient.type == UI.resourceIngredientTypes.MODULE and ingredient.defName == itemToUpgradeDefName then
				count = 1
			else
        		local countNonEnchanted, countEnchanted	= UI:GetItemCraftIngredientInventoryCount( ingredient.defName )
        		count = countEnchanted + countNonEnchanted
			end

			local data = {}

			data.defName					= ingredient.defName
			data.bEnchanted					= bEnchanted
			data.count						= count
			data.needCount					= ingredient.count * craftCount
			data.oneCraftCount				= ingredient.count
			data.parentBlueprintDefName		= self.blueprintDefName

			self.ingredientsList:AddRecord( data )

		end

	end	

	if self.ingredientsList:GetNumRecords() > 0 then
		self.ingredientsList:RecalcLayout()
	end

end


--
function UI.ItemCraft_WorkWnd:ResetIngredientsList()

	if self.ingredientsList:IsChildOf( self ) then
		self.ingredientsList:Clear()
		self.ingredientsList:UnlinkFromParent()
	end

	self:SetLayerVisible( false, self.layers.INGREDIENTS_CAPTION )

end


--
function UI.ItemCraft_WorkWnd:UpdateName()

	local str = UI:GetEntityLocalizedNameByDef( self.itemDefName, true, false, true, true )

	local craftResultCount = 0
	if self.blueprintDefName ~= "" then
		local dummy = ""
		dummy, craftResultCount = UI:GetResourceCraftResult( self.blueprintDefName )
	end

	if craftResultCount > 1 then

		local strCraftResultCount = string.format( "(%d %s)", craftResultCount, UI:GetStringByName( "equipment_itemsUnits" ) )

		local baseColor = self:GetColor( self.layers.NAME )
		local strBaseColor = UI:Color2Str( baseColor )

		str = string.format( "%s %s%s", str, strBaseColor, strCraftResultCount )

	end

	self:SetText( str, self.layers.NAME )	

end


--
function UI.ItemCraft_WorkWnd:UpdateDesc()

	local str = ""

	if UI:IsDefModule( self.itemDefName ) or UI:IsDefAmmo( self.itemDefName ) then
		str = UI:GetItemDescEx( { defName = self.itemDefName }, nil, UI.TEXT_SEL_COLOR, self:GetColor( self.layers.DESC ) )
	else
		str = UI:GetEntityDescByDef( self.itemDefName )
	end

	str = UI:GetCutTextWithEllipsesMultiline( str, self:GetLayerRect( self.layers.DESC ), self:GetFont( self.layers.DESC ), self:GetTextFormatFlags( self.layers.DESC ) )

	self:SetText( str, self.layers.DESC )	

end


--
function UI.ItemCraft_WorkWnd:UpdateDarkeningWnd()

	local bHandled = false

	if self.blueprintDefName ~= "" then

		if not UI:IsBluePrintLearned( self.blueprintDefName ) then

    		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    		UI:AddChildAndLink( self, self.darkeningWnd, mainEffect, self.effectInfo.main.darkeningLocator, UI.EffectAnimParams.POS )

    		local str = UI:GetStringByName( "itemCraft_notLearned" )

        	if UI:CantItemBeBoughtByDef( self.blueprintDefName ) and UI:GetPlayerResourceCount( self.blueprintDefName ) <= 0 then
			
				local color = self.darkeningWnd:GetColor( self.darkeningWnd.layers.TEXT )
    			local strCantBeBought = UI:GetItemSourceDesc( self.blueprintDefName, color, nil, true )
    			str = string.format( "%s|%s", str, strCantBeBought )

        	end

    		self.darkeningWnd:SetupText( str )

			bHandled = true

		end

	end

	if not bHandled then
		self:ResetDarkeningWnd()
	end

end


--
function UI.ItemCraft_WorkWnd:ResetDarkeningWnd()

	if self.darkeningWnd:IsChildOf( self ) then
		self.darkeningWnd:Reset()
		self.darkeningWnd:UnlinkFromParent()
	end

end


--
function UI.ItemCraft_WorkWnd:ResetCraftCountControls()

    self:SetLayerVisible( false, self.layers.CRAFT_COUNT_LABEL )
    self:SetLayerVisible( false, self.layers.CRAFT_COUNT_ENCHANTED )
	self.craftCountEditWnd:UnlinkFromParent()
    self.craftCountLeftArrow:UnlinkFromParent()
    self.craftCountRightArrow:UnlinkFromParent()

end


--
function UI.ItemCraft_WorkWnd:UpdateCraftCountControls()

	if not self:NeedShowCraftCount() then
		self:ResetCraftCountControls()
		self:OnCraftCountChanged()
		return
	end

	-- лэйбл

	self:SetLayerVisible( true, self.layers.CRAFT_COUNT_LABEL )


	-- поле ввода

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.craftCountEditWnd, mainEffect, self.effectInfo.main.craftCountEditLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.craftCountLeftArrow, mainEffect, self.effectInfo.main.craftCountLeftArrowLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.craftCountRightArrow, mainEffect, self.effectInfo.main.craftCountRightArrowLocator, UI.EffectAnimParams.POS )

	self:SetCraftCount( 1 )

	local bEnableEditWnd = UI:IsBluePrintLearned( self.blueprintDefName )

	if bEnableEditWnd then
		self.craftCountEditWnd:RemoveStyle( UI.WS_DISABLE )
	else
		self.craftCountEditWnd:AddStyle( UI.WS_DISABLE )
	end

	self:UpdateCraftCountArrowsState()


	-- разбивка количества на простые и золотые модули

    self:SetLayerVisible( true, self.layers.CRAFT_COUNT_ENCHANTED )
	self:UpdateCraftCountEnchanted()

end


--
function UI.ItemCraft_WorkWnd:UpdateCraftCountArrowsState()

	if not self.craftCountEditWnd:IsChildOf( self ) or not self.craftCountLeftArrow:IsChildOf( self ) or not self.craftCountRightArrow:IsChildOf( self ) then
		sys.log( "UI.ItemCraft_WorkWnd:UpdateCraftCountArrowsState()[ERROR]: elements are not on screen" )
		return
	end

	if self.craftCountEditWnd:HasStyle( UI.WS_DISABLE ) then

		self.craftCountLeftArrow:Enable( false )
		self.craftCountRightArrow:Enable( false )

	else

		local craftCount = self:GetCraftCount()

		self.craftCountLeftArrow:Enable( craftCount > 1 )
		self.craftCountRightArrow:Enable( craftCount < self.MAX_CRAFT_COUNT )	

	end

end


--
function UI.ItemCraft_WorkWnd:UpdateCraftCountEnchanted()

	if not self:IsLayerVisible( self.layers.CRAFT_COUNT_ENCHANTED ) then
		sys.log( "UI.ItemCraft_WorkWnd:UpdateCraftCountEnchanted()[ERROR]: not visible" )
		return
	end

	local str = ""

	local craftCountTotal = self:GetCraftCount()
	local craftCountNonEnchanted, craftCountEnchanted = UI:GetItemCraftResultCountByEnchantType( self.blueprintDefName, craftCountTotal )

	if craftCountEnchanted > 0 and craftCountEnchanted < craftCountTotal then

		local strGoldColor	= UI:Color2Str( UI.GOLD_COLOR )
		local strBaseColor	= UI:Color2Str( self:GetColor( self.layers.CRAFT_COUNT_ENCHANTED ) )

		str = string.format( "(%s%d%s+%d)", strGoldColor, craftCountEnchanted, strBaseColor, craftCountTotal - craftCountEnchanted )

	end

	self:SetText( str, self.layers.CRAFT_COUNT_ENCHANTED )

end


--
function UI.ItemCraft_WorkWnd:UpdateTargetShip()

	local vid = self:GetTargetShip()

	if vid == UI.INVALID_U64_ID or self:NeedShowCraftCount() or self.blueprintDefName == "" then
		self:SetLayerVisible( false, self.layers.TARGET_SHIP )
		return		
	end

	self:SetLayerVisible( true, self.layers.TARGET_SHIP )

	local strBaseColor	= UI:Color2Str( self:GetColor( self.layers.TARGET_SHIP ) )
	local strShipName	= ""	

	local shipItem = UI:GetShipItem( vid )

	if shipItem then
		strShipName = UI:GetEntityLocalizedNameByDef( shipItem.defName, true, false, false, false )
		strShipName = string.format( "%s%s", strShipName, strBaseColor )
	else
		sys.log( "UI.ItemCraft_WorkWnd:UpdateTargetShip()[ERROR]: cannot find ship item" )
	end

	if strShipName == "" then
		strShipName = string.format( "%s%s%s", UI:Color2Str( UI:GetItemQualityColor( UI.SHIP_COLOR_ID, false ) ), "error", strBaseColor )
	end

	local str = UI:GetStringByName( "itemCraft_targetShip" )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$ship%$", strShipName ) 

	if numSubst == 0 then
		sys.log( "UI.ItemCraft_WorkWnd:UpdateTargetShip()[ERROR]: cannot find placeholder \"$ship$\" in string \"itemCraft_targetShip\"" )
		str = string.format( "[INVALID STRING] Target ship: %s", strShipName )
	end

	self:SetText( str, self.layers.TARGET_SHIP )

end


--
function UI.ItemCraft_WorkWnd:UpdateStoredCount()

	local countTotal, storageData = UI:GetItemCount( self.itemDefName )
	local str = UI:MakeItemStorageString( true, storageData.inventory_total, storageData.inventory_max, storageData.equipped_total, nil, true, self:GetColor( self.layers.STORED_COUNT ) )

	self.storedCountMetaText:SetText( str, true )

end


--
function UI.ItemCraft_WorkWnd:UpdateItemsChain()

	self.chainWnd:Setup( self.itemsChain )

end


--
function UI.ItemCraft_WorkWnd:UpdateNotCraftableDesc()

	if self.itemDefName ~= "" and self.blueprintDefName == "" then

		self:SetLayerVisible( true, self.layers.NOT_CRAFTABLE_DESC )

		local str = UI:GetStringByName( "itemCraft_notCraftable" )

		-- строка с описанием, где найти предмет (аналогична той, что в тултипе ресурсов)
		local sourceDesc = UI:GetItemSourceDesc( self.itemDefName, self:GetColor( self.layers.NOT_CRAFTABLE_DESC ), nil, true )
		if sourceDesc ~= "" then
			str = string.format( "%s||%s", str, sourceDesc )
		end

		self.notCraftableMetaText:SetText( str, true )

	else
		self:SetLayerVisible( false, self.layers.NOT_CRAFTABLE_DESC )
		self.notCraftableMetaText:SetText( "", true )
	end

end


--
function UI.ItemCraft_WorkWnd:GetTargetShip()

	local vid = UI.INVALID_U64_ID

	if self.iidToUpgrade ~= UI.INVALID_U64_ID then

		local shipItem = UI:GetEquippedShipItem( self.iidToUpgrade )
		if shipItem then
			vid = shipItem.vid
		end

	elseif self.vidToEquip ~= UI.INVALID_U64_ID then
		vid = self.vidToEquip
	end

	return vid

end


--
function UI.ItemCraft_WorkWnd:F_OnEventEditChange( hSender, eventSrc )

	if hSender == self.craftCountEditWnd:GetUiHandle() then

		if self.craftCountEditWnd:IsChildOf( self ) then

        	if eventSrc ~= UI.EVENT_SRC_UNKNOWN then

        		local count = self:GetCraftCount()
            	local countFixed = UI:Clamp( count, 0, self.MAX_CRAFT_COUNT )

            	if countFixed ~= count then
        			self:SetCraftCount( countFixed )
            	end

    		end

    		self:OnCraftCountChanged()

		end

	end

end


--
function UI.ItemCraft_WorkWnd:OnCraftCountChanged()

	if self.blueprintDefName == "" then
		return
	end

	if self.craftCountEditWnd:IsChildOf( self ) then
		self:UpdateCraftCountEnchanted()
		self:UpdateCraftCountArrowsState()
	end

	local craftCount = self:GetCraftCount()

	for recordIdx = 1, self.ingredientsList:GetNumRecords() do

		local data = self.ingredientsList:GetRecordData( recordIdx )
		data.needCount	= data.oneCraftCount * craftCount

		local slotWnd = self.ingredientsList:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnCraftCountChanged()
		end

	end

	local notifyData = { count = self:GetCraftCount() }
	self:NotifyParent( "OnCraftCountChanged", notifyData )

end


--
function UI.ItemCraft_WorkWnd:NeedShowCraftCount()

	return self.blueprintDefName ~= "" and self.iidToUpgrade == UI.INVALID_U64_ID

end


--
function UI.ItemCraft_WorkWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "ItemCraft_IngredientSlotWnd" ) then

    	local data = wnd:GetRecordData()
    	self:NotifyParent( "OnShowIngreditentCraft", { itemDefName = data.defName, bEnchanted = data.bEnchanted } )

	elseif wnd == self.craftCountLeftArrow then

		self:SetCraftCount( self:GetCraftCount() - 1 )

	elseif wnd == self.craftCountRightArrow then

		self:SetCraftCount( self:GetCraftCount() + 1 )

	elseif UI:IsWndKindOf( wnd, "ItemCraft_ChainSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "ItemCraft_ChainSlotWnd" ) then

		local slotWnd = UI:IsWndKindOf( wnd, "ItemCraft_ChainSlotWnd" ) and wnd or UI:GetAncestorKindOf( wnd, "ItemCraft_ChainSlotWnd" )
		if not slotWnd:IsSelected() then
    		self:NotifyParent( "OnSelectChainItem", { chainIdx = slotWnd:GetRecordData().chainIdx } )
		end

	end

	return true

end


--
function UI.ItemCraft_WorkWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:FullUpdate()

end


--
function UI.ItemCraft_WorkWnd:NotifyParent( collbackName, data )

	local parentWnd = self:GetParent()
	if not parentWnd then
		sys.log( "UI.ItemCraft_WorkWnd:NotifyParent()[ERROR]: no parent" )
		return
	end

	local fnCallback = parentWnd[ collbackName ]
	if fnCallback then
		fnCallback( parentWnd, data )
	else
		sys.log( "UI.ItemCraft_WorkWnd:NotifyParent()[ERROR]: function %s() in %s not found", collbackName, parentWnd:GetScriptTableName() )
	end		

end


--
function UI.ItemCraft_WorkWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ItemCraft_WorkWnd:UpdateZOrder()

	-- иконки цепочки крафта рисуютс€ поверх затемнени€

	if self.chainWnd and self.chainWnd.w and self.chainWnd:IsChildOf( self ) then
		if self.darkeningWnd and self.darkeningWnd.w and self.darkeningWnd:IsChildOf( self ) then
			self:MoveChildAfter( self.chainWnd, self.darkeningWnd )
		end
	end

end


--
function UI.ItemCraft_WorkWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local namePos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.nameLocator ) or Vec2( 0, 0 )
	local nameSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.nameLocator ) or Vec2( 0, 0 )
	local descPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )

	self.space_name_desc	= descPos.y - ( namePos.y + nameSize.y )
	self.descBtm			= descPos.y + descSize.y

	self:SetLayerWidth( nameSize.x, self.layers.NAME )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( descPos.x, self.layers.DESC )

end


--
function UI.ItemCraft_WorkWnd:RecalcLayout()

	-- название - размер

	local nameFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.NAME ), 10000000 )

    local nameHeight = _G.MeasureText(
   		self:GetText( self.layers.NAME ),
   		self:GetFont( self.layers.NAME ),
    	nameFormatRect,
   		self:GetTextFormatFlags( self.layers.NAME ),
    	nameFormatRect ).w

	self:SetLayerHeight( nameHeight, self.layers.NAME )


	-- описание - позици€, размер

	local descY = self:GetLayerTop( self.layers.NAME ) + nameHeight + self.space_name_desc
	self:SetLayerTop( descY, self.layers.DESC )

	local descHeight = self.descBtm - descY
	self:SetLayerHeight( descHeight, self.layers.DESC )	

end


-- ---------------------------------------------------------------
-- UI.ItemCraft_IngredientsListWnd
-- ---------------------------------------------------------------

UI.ItemCraft_IngredientsListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ItemCraft_IngredientsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ItemCraft_IngredientsListWnd",
		isPrototype	= true,
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ItemCraft_IngredientsListWnd:RecalcLayout()

	if self.numRecords == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local firstLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) )
	local secondLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) )
	local lastLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.MAX_SLOTS ) )
	local slotW				= self:GetButtonForRecord( 1 ):GetWidth()
	local areaX				= firstLocatorPos.x
	local areaW				= ( lastLocatorPos.x + slotW ) - firstLocatorPos.x
	local spaceSlots		= secondLocatorPos.x - firstLocatorPos.x - slotW
	local slotsW			= self.numRecords * slotW + ( self.numRecords - 1 ) * spaceSlots
	local slotsX			= ( areaW - slotsW ) / 2 + areaX

	for recordIdx = 1, self.numRecords do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then

    		mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )

    		local slotX = slotsX + ( recordIdx - 1 ) * ( slotW + spaceSlots )
    		slotWnd:SetLeft( slotX )

		end

	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.ItemCraft_IngredientsListWnd.btnPrototypeName	= "ItemCraft_IngredientSlotWnd"

UI.ItemCraft_IngredientsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "icon_",
		scrollObjName		= "",
		animIdle			= "idle",
	},
}

UI.ItemCraft_IngredientsListWnd.MAX_SLOTS = 5

UI.ItemCraft_IngredientsListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION


-- ---------------------------------------------------------------
-- UI.ItemCraft_MainIngredientsListWnd
-- ---------------------------------------------------------------

UI.ItemCraft_MainIngredientsListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ItemCraft_IngredientsListWnd",

    	props =
    	{
    		name		= "ItemCraft_MainIngredientsListWnd",
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
    				defName				= "itemCraft_mainIngredientsList",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self86",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
    	},
    }
}

-- ---------------------------------------------------------------
-- UI.ItemCraft_IngredientSlotWnd
-- ---------------------------------------------------------------

UI.ItemCraft_IngredientSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ItemCraft_IngredientSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ItemCraft_IngredientSlotWnd",
		isPrototype	= true,
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ItemCraft_IngredientSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.itemIcoWnd:Reset()
	self.tooltipData = nil

	self:RemoveStyle( UI.WS_NOT_MOUSE_REACT )

end


--
function UI.ItemCraft_IngredientSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	self:UpdateSelection()

end


--
function UI.ItemCraft_IngredientSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ItemCraft_IngredientSlotWnd:OnCraftCountChanged()

	local data = self:GetRecordData()
	self:UpdateCount( data )

end

-- ------------------------------
-- const
-- ------------------------------

UI.ItemCraft_IngredientSlotWnd.sounds =
{
	ingredientSlotMouseOver = "sound/ui/btnMouseOver",
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ItemCraft_IngredientSlotWnd.itemIcoWnd	= nil
UI.ItemCraft_IngredientSlotWnd.tooltipData	= nil
UI.ItemCraft_IngredientSlotWnd.bLockSound	= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ItemCraft_IngredientSlotWnd:F_PostLoad()

    UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()	

end


--
function UI.ItemCraft_IngredientSlotWnd:CreateControls()	

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.itemIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
	self:AddChild( self.itemIcoWnd )

	self:SetWidth( self.itemIcoWnd:GetWidth() )
	self:SetHeight( self.itemIcoWnd:GetHeight() )

end


--
function UI.ItemCraft_IngredientSlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateCount( data )
	self:UpdateTooltip( data )
	self:UpdateSelection()
	self:UpdateMouseOver( false ) 
	self:UpdateMouseReact( data )

end


--
function UI.ItemCraft_IngredientSlotWnd:UpdateIco( data )

	self.itemIcoWnd:SetupForItem( data.defName, data.bEnchanted )

end


--
function UI.ItemCraft_IngredientSlotWnd:UpdateCount( data )

	local str = ""

	local strNeedCount = UI:Num2StrSeparatedBy3( data.needCount )
	local strIsCount = data.count > 999 and "999" or UI:Num2StrSeparatedBy3( data.count )

	if data.count >= data.needCount then
		local needCountColor = data.needCount > 0 and UI.GOLD_COLOR or UI.PARAM_DELTA_MINUS_COLOR
		str = string.format( "%s/%s%s", strIsCount, UI:Color2Str( needCountColor ), strNeedCount )
	else
		local redColor = UI.PARAM_DELTA_MINUS_COLOR
		str = string.format( "%s%s/%s", UI:Color2Str( redColor ), strIsCount, strNeedCount )
	end

	self.itemIcoWnd:SetCountResourcesText( str )

end


--
function UI.ItemCraft_IngredientSlotWnd:UpdateTooltip( data )

	if UI:IsDefModule( data.defName ) or UI:IsDefAmmo( data.defName ) then

		self.tooltipData = {}

    	self.tooltipData.tooltipType	= UI.tooltipTypes.MODULE
    	self.tooltipData.defName		= data.defName
		self.tooltipData.bEnchanted		= data.bEnchanted

	else
		self.tooltipData = UI:GetTooltipForItem( data.defName )
	end

end


--
function UI.ItemCraft_IngredientSlotWnd:UpdateSelection()

	if self:IsSelected() then
		self.itemIcoWnd:ShowSelection()
	else
		self.itemIcoWnd:HideSelection()
	end

end


--
function UI.ItemCraft_IngredientSlotWnd:UpdateMouseReact( data )

	local bMouseReact = UI:IsBluePrintLearned( data.parentBlueprintDefName )

	if bMouseReact then
		self:RemoveStyle( UI.WS_NOT_MOUSE_REACT )
	else
		self:AddStyle( UI.WS_NOT_MOUSE_REACT )
	end	

end


--
function UI.ItemCraft_IngredientSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver( false )

end


--
function UI.ItemCraft_IngredientSlotWnd:UpdateMouseOver( bSound )

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver, bSound )

end


--
function UI.ItemCraft_IngredientSlotWnd:SetMouseOver( bMouseOver, bSound )

	local bWasMouseOver = self.itemIcoWnd:IsMouseOver()

	if bMouseOver then
		self.itemIcoWnd:ShowMouseOver()
	else
		self.itemIcoWnd:HideMouseOver()
	end

	if bSound and bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.ingredientSlotMouseOver )
	end

end


--
function UI.ItemCraft_IngredientSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true, true )
	return true

end


--
function UI.ItemCraft_IngredientSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end

-- ------------------------------------------------------------------------
-- UI.ItemCraft_CraftCountEditWnd
-- ------------------------------------------------------------------------

UI.ItemCraft_CraftCountEditWnd =
{
	def =
	{
		className	= "EditWnd",
		prototype	= "EffectEditWnd",

		props =
		{
			name				= "ItemCraft_CraftCountEditWnd",
	 		activationOrder		= -1,
			editStyle			= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL + UI.ES_NUM,
			forbiddenChars		= "+-.",
			symbolsLimit		= 2,
			isPrototype			= true,
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
    				defName 			= "shop_buy_slider_edit",
    				defaultAnimation	= "deselect",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
    	} 
	},

    effectInfo =
    {
    	main =
    	{
    		textObjName				= "text",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "select",
    		animInactive			= "deselect",
			animDisabled			= "deselect",
    	}
    }
}

-- ---------------------------------------------------------------------------------------
-- UI.ItemCraft_CraftCountLeftArrowBtn, UI.ItemCraft_CraftCountRightArrowBtn
-- ---------------------------------------------------------------------------------------

--
UI.ItemCraft_CraftCountLeftArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "ItemCraft_CraftCountLeftArrowBtn",
    		selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
    				defName 			= "shop_buy_slider_leftBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
		}
	},

	effectInfo =
	{
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
	}
}


--
UI.ItemCraft_CraftCountRightArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "ItemCraft_CraftCountRightArrowBtn",
    		selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
    				defName 			= "shop_buy_slider_rightBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
		}
	},

	effectInfo =
	{
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
	}
}

-- -------------------------------------------------------------------
-- UI.ItemCraft_ChainWnd
-- -------------------------------------------------------------------

UI.ItemCraft_ChainWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.ItemCraft_ChainWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ItemCraft_ChainWnd",
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
				defName 			= "itemCraft_chain",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.ItemCraft_ChainWnd:Setup( itemsChain )
	
	self:Reset()
	
    self.itemsChain = itemsChain
	self:FullUpdate()
	
end


--
function UI.ItemCraft_ChainWnd:Reset()

	self.itemsChain = {}
	self:Clear()

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.ItemCraft_ChainWnd.btnPrototypeName	= "ItemCraft_ChainSlotWnd"
UI.ItemCraft_ChainWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.ItemCraft_ChainWnd.MAX_SLOTS			= 5

UI.ItemCraft_ChainWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "icon",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.ItemCraft_ChainWnd.itemsChain = {}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.ItemCraft_ChainWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )
	self.itemsChain = {}

end


--
function UI.ItemCraft_ChainWnd:FullUpdate()

	self:Clear()

	if not next( self.itemsChain ) then
		return
	end

	local numItems = #self.itemsChain
	local firstVisibleIdx = math.max( numItems - self.MAX_SLOTS + 1, 1 )	-- если предметов больше, чем можно отобразить, то показываютс€ последние

	for idx = firstVisibleIdx, numItems do

		local item = self.itemsChain[ idx ]

		local data =
		{
			defName		= item.defName,
			bEnchanted	= item.bEnchanted,
			chainIdx	= idx,
		}

		self:AddRecord( data )

	end

	self:SelectRecord( numItems )

end


-- -------------------------------------------------------------------
-- UI.ItemCraft_ChainSlotWnd
-- -------------------------------------------------------------------

UI.ItemCraft_ChainSlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.ItemCraft_ChainSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ItemCraft_ChainSlotWnd",
		isPrototype	= true,
	},
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.ItemCraft_ChainSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.icoWnd:Reset()

end


--
function UI.ItemCraft_ChainSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	local data = self:GetRecordData()
	
	self:UpdateArrow( data )
	self:UpdateSelEffect( data )
	self:UpdateMouseOver( false )

end

-- -------------------------------------
-- const
-- -------------------------------------


UI.ItemCraft_ChainSlotWnd.sounds =
{
	mouseOver	= UI.sounds.btnMouseOver
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.ItemCraft_ChainSlotWnd.icoWnd = nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.ItemCraft_ChainSlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.icoWnd	= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self:AddChild( self.icoWnd )

	self:SetWidth( self.icoWnd:GetWidth() )
	self:SetHeight( self.icoWnd:GetHeight() )

end


--
function UI.ItemCraft_ChainSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateTooltip( data )
	self:UpdateArrow( data )
	self:UpdateSelEffect( data )
	self:UpdateMouseOver( false )

end


--
function UI.ItemCraft_ChainSlotWnd:UpdateIco( data )

	self.icoWnd:SetupForItem( data.defName, data.bEnchanted )

end


--
function UI.ItemCraft_ChainSlotWnd:UpdateTooltip( data )

	local tooltipData = UI:GetTooltipForItem( data.defName )
	self.icoWnd:SetTooltipData( tooltipData )

end


--
function UI.ItemCraft_ChainSlotWnd:UpdateArrow( data )

	local bHasPrevChainItem = data ~= nil and data.chainIdx > 1

	if bHasPrevChainItem then
		self.icoWnd:ShowChainLeftArrow( self:IsSelected() )
	else
		self.icoWnd:HideChainLeftArrow()
	end

end


--
function UI.ItemCraft_ChainSlotWnd:UpdateSelEffect( data )

	if self:IsSelected() then
		self.icoWnd:ShowSelection2()
	else
		self.icoWnd:HideSelection2()
	end

end


--
function UI.ItemCraft_ChainSlotWnd:UpdateMouseOver( bSound )

	local bMouseOver = false

	if not self:IsSelected() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self or wndUnderMouse:IsChildOf( self )
	end

	self:SetMouseOver( bMouseOver, bSound )

end


--
function UI.ItemCraft_ChainSlotWnd:SetMouseOver( bMouseOver, bSound )

	local bWasMouseOver = self.icoWnd:IsMouseOver()

	if bMouseOver then
		self.icoWnd:ShowMouseOver()
	else
		self.icoWnd:HideMouseOver()
	end

	if bSound and bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.ItemCraft_ChainSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver( true )
	return true

end


--
function UI.ItemCraft_ChainSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ItemCraft_ChainSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver( false )

end


-- -------------------------------------------------------------------
-- UI.ItemCraft_DarkeningWnd
-- -------------------------------------------------------------------

UI.ItemCraft_DarkeningWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.ItemCraft_DarkeningWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "ItemCraft_DarkeningWnd",
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
				defName 			= "itemCraft_selBlueprint_disable",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_not_found1",
						layer		= "UI.ItemCraft_DarkeningWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------------
-- interface funcitons
-- -------------------------------------

--
function UI.ItemCraft_DarkeningWnd:SetupText( text )

	self.metaText:SetText( text, true )

end


--
function UI.ItemCraft_DarkeningWnd:Reset()

	self.metaText:SetText( "", true )
	

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.ItemCraft_DarkeningWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.ItemCraft_DarkeningWnd.metaText = nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.ItemCraft_DarkeningWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT )

end


--
function UI.ItemCraft_DarkeningWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ItemCraft_DarkeningWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываетьс€ при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ItemCraft_DarkeningWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.ItemCraft_DarkeningWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- -------------------------------------------------------------------
-- UI.ItemCraft_CraftConfirmWnd
-- -------------------------------------------------------------------

UI.ItemCraft_CraftConfirmWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.ItemCraft_CraftConfirmWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "ItemCraft_CraftConfirmWnd",
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
				defName 			= "shop_buy_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.ItemCraft_CraftConfirmWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.ItemCraft_CraftConfirmWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_buy_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.ItemCraft_CraftConfirmWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "product_name",	
						layer		= "UI.ItemCraft_CraftConfirmWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fraction",	
						layer		= "UI.ItemCraft_CraftConfirmWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",	
						layer		= "UI.ItemCraft_CraftConfirmWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "itemCraft_craftConfirm_caption" ),
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_TOP + FONT.TF_LEFT,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.ItemCraft_CraftConfirmWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------------
-- interface funcitons
-- -------------------------------------

--
function UI.ItemCraft_CraftConfirmWnd:Setup( blueprintDefName, bEnchanted, count )

	self:Reset()

	self.blueprintDefName	= blueprintDefName
	self.bEnchanted			= bEnchanted
	self.count				= count

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ItemCraft_CraftConfirmWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdateOkBtn()
	self:UpdateRefillMoneyBtn()

end   


-- -------------------------------------
-- const
-- -------------------------------------

UI.ItemCraft_CraftConfirmWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    NAME			= 4,
    PRICE_EFFECT	= 5,
    PRICE_VAL		= 6,
}

UI.ItemCraft_CraftConfirmWnd.effectInfo =
{
	work =
	{
		icoLocator				= "icon",
		okBtnLocator			= "button_2",
		crossBtnLocator			= "btn_x",
		refillMoneyBtnLocator	= "button_2",
	},
}

UI.ItemCraft_CraftConfirmWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
}

UI.ItemCraft_CraftConfirmWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
}

UI.ItemCraft_CraftConfirmWnd.mainWndName = ""

-- -------------------------------------
-- vars
-- -------------------------------------

UI.ItemCraft_CraftConfirmWnd.blueprintDefName	= ""
UI.ItemCraft_CraftConfirmWnd.bEnchanted			= false
UI.ItemCraft_CraftConfirmWnd.count				= 1

UI.ItemCraft_CraftConfirmWnd.icoWnd				= nil
UI.ItemCraft_CraftConfirmWnd.okBtn				= nil
UI.ItemCraft_CraftConfirmWnd.crossBtn			= nil
UI.ItemCraft_CraftConfirmWnd.refillMoneyBtn		= nil
UI.ItemCraft_CraftConfirmWnd.priceMetaText		= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.ItemCraft_CraftConfirmWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL )

	self:Reset()
	
	UI:AddOverlayWnd( self:GetScriptTableName() )

end


--
function UI.ItemCraft_CraftConfirmWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ItemCraft_CraftConfirmWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.ItemCraft_CraftConfirmWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываетьс€ при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ItemCraft_CraftConfirmWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.ItemCraft_CraftConfirmWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ItemCraft_CraftConfirmWnd:CreateControls()

    self.icoWnd			= UI:CreateChildWnd( self, UI.ItemCraft_CraftConfirm_IcoWnd, "" )
    self.okBtn			= UI:CreateChildWnd( self, UI.ItemCraft_CraftConfirm_OkBtn, "" )
    self.crossBtn		= UI:CreateChildWnd( self, UI.CrossBtn, "" )
    self.refillMoneyBtn	= UI:CreateChildWnd( self, UI.ItemCraft_CraftConfirm_RefillMoneyBtn, "" )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	UI:AddChildAndLink( self, self.icoWnd, workEffect, self.effectInfo.work.icoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.crossBtn, workEffect, self.effectInfo.work.crossBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.ItemCraft_CraftConfirmWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self.blueprintDefName	= ""
	self.bEnchanted			= false
	self.count				= 1

	self.icoWnd:Reset()
	self:SetText( "", self.layers.NAME )
	self.priceMetaText:SetText( "", true )
	self.okBtn:UnlinkFromParent()
	self.refillMoneyBtn:UnlinkFromParent()

end


--
function UI.ItemCraft_CraftConfirmWnd:FullUpdate()

	local blueprintDefName	= self.blueprintDefName
	local bEnchanted		= self.bEnchanted
	local count				= self.count

	self:Reset()

	self.blueprintDefName	= blueprintDefName
	self.bEnchanted			= bEnchanted
	self.count				= count

	if self.blueprintDefName == "" then
		return
	end

	self:UpdateIco()
	self:UpdateName()
	self:UpdatePrice()
	self:UpdateOkBtn()
	self:UpdateRefillMoneyBtn()

end


--
function UI.ItemCraft_CraftConfirmWnd:UpdateIco()

	self.icoWnd:Reset()

	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( self.blueprintDefName ) 

	if craftResultDefName == "name" then
		sys.log( "UI.ItemCraft_CraftConfirmWnd:UpdateIco()[ERROR]: cannot find craft result for blueprint \"%s\"", self.blueprintDefName )
		return	
	end

	self.icoWnd:SetupForItem( craftResultDefName, self.bEnchanted )
	
end


--
function UI.ItemCraft_CraftConfirmWnd:UpdateName()

	local str = ""

	local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( self.blueprintDefName )
	if craftResultDefName ~= "" then

		local strBaseColor = UI:Color2Str( self:GetColor( self.layers.NAME ) )

		local name = UI:GetEntityLocalizedNameByDef( craftResultDefName, true, false, true, true )
		name = string.format( "%s%s", name, strBaseColor )

		local nameEnchanted		= ""
		local nameNonEnchanted	= ""

		local craftCountNonEnchanted, craftCountEnchanted = UI:GetItemCraftResultCountByEnchantType( self.blueprintDefName, self.count )

		if craftCountNonEnchanted == 0 and craftCountEnchanted == 0 then
			craftCountNonEnchanted = 1
			sys.log( "UI.ItemCraft_CraftConfirmWnd:UpdateName()[ERROR]: invalid count" )
		end

		if craftCountEnchanted > 0 then

			local itemsCount = craftCountEnchanted * craftResultCount

			local strCount = ""
			if itemsCount > 1 then
				strCount = string.format( " [%d]", itemsCount )
			end

			local strEnchanted = string.format( " (%s%s%s)", UI:Color2Str( UI.GOLD_COLOR ), UI:GetStringByName( "enchanted" ), strBaseColor )

			nameEnchanted = string.format( "%s%s%s", name, strCount, strEnchanted )

		end

		if craftCountNonEnchanted > 0 then

			local itemsCount = craftCountNonEnchanted * craftResultCount

			local strCount = ""
			if itemsCount > 1 then
				strCount = string.format( " [%d]", itemsCount )
			end

			nameNonEnchanted = string.format( "%s%s", name, strCount )

		end

		str = string.format( "%s%s%s", nameEnchanted, ( nameEnchanted ~= "" and nameNonEnchanted ~= "" ) and "|" or "", nameNonEnchanted )

	else
		sys.log( "UI.ItemCraft_CraftConfirmWnd:UpdateName()[ERROR]: cannot find craft result for blueprint \"%s\"", self.blueprintDefName )
	end

	self:SetText( str, self.layers.NAME )	

end


--
function UI.ItemCraft_CraftConfirmWnd:UpdatePrice()

	local str = ""

	local priceInfos = self:GetPrice()
	for priceInfoIdx = 1, #priceInfos do

		local priceInfo = priceInfos[ priceInfoIdx ]
		local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, true, true, nil )

		if str ~= "" then
			str = string.format( "%s ", str )
		end
    	str = str .. strPrice

	end

	self.priceMetaText:SetText( str, true )

end


--
function UI.ItemCraft_CraftConfirmWnd:UpdateOkBtn()

	local bEnable = self:IsEnoughMoney()
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	if bEnable then

		UI:AddChildAndLink( self, self.okBtn, workEffect, self.effectInfo.work.okBtnLocator, UI.EffectAnimParams.POS )
		self.okBtn:Enable( true )

	else

		if self:NeedRefillMoneyBtn() then
			self.okBtn:UnlinkFromParent()
		else
			UI:AddChildAndLink( self, self.okBtn, workEffect, self.effectInfo.work.okBtnLocator, UI.EffectAnimParams.POS )
			self.okBtn:Enable( false )
		end

	end

end


--
function UI.ItemCraft_CraftConfirmWnd:UpdateRefillMoneyBtn()

	local bNeedBtn, mode = self:NeedRefillMoneyBtn()

	if not bNeedBtn then
		self.refillMoneyBtn:UnlinkFromParent()

	else
		local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
		UI:AddChildAndLink( self, self.refillMoneyBtn, workEffect, self.effectInfo.work.refillMoneyBtnLocator, UI.EffectAnimParams.POS )

		self.refillMoneyBtn:Setup( mode )
	end

end


--
function UI.ItemCraft_CraftConfirmWnd:NeedRefillMoneyBtn()

	local bEnoughCredits, bEnoughGold = self:IsEnoughMoney2()

	if not bEnoughCredits or not bEnoughGold then
		return true, not bEnoughCredits and UI.RefillMoneyBtn.modes.CREDITS or UI.RefillMoneyBtn.modes.GOLD
	else
		return false
	end

end


--
function UI.ItemCraft_CraftConfirmWnd:GetPrice()

	return UI:GetResourceCraftPrice( self.blueprintDefName, self.count )

end


--
function UI.ItemCraft_CraftConfirmWnd:IsEnoughMoney()

	local priceInfos = self:GetPrice()

	for priceIdx, priceInfo in pairs( priceInfos ) do
		if not UI:IsEnoughMoneyForPrice( priceInfo, false, nil ) then
			return false
		end
	end

	return true	

end


--
function UI.ItemCraft_CraftConfirmWnd:IsEnoughMoney2()

	local bEnoughCredits	= true
	local bEnoughGold		= true

	local priceInfos = self:GetPrice()

	for priceIdx, priceInfo in pairs( priceInfos ) do

		if priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS then
			bEnoughCredits = UI:IsEnoughMoneyForPrice( priceInfo, false, nil )

		elseif priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then
			bEnoughGold = UI:IsEnoughMoneyForPrice( priceInfo, false, nil )
		end

	end

	return bEnoughCredits, bEnoughGold

end


--
function UI.ItemCraft_CraftConfirmWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.okBtn then
		self:OnOk()

	elseif wnd == self.crossBtn then
		self:OnCancel()

	elseif wnd == self.refillMoneyBtn then
		self:OnRefillMoney()
	end

	return true

end


--
function UI.ItemCraft_CraftConfirmWnd:OnRefillMoney()

	local moneyMode = self.refillMoneyBtn:GetMode()

	if moneyMode == UI.RefillMoneyBtn.modes.CREDITS then
		UI.HangarWnd:ShowBuyCreditsWnd()

	elseif moneyMode == UI.RefillMoneyBtn.modes.GOLD then
		UI.HangarWnd:ShowBuyGoldWnd()

	else
		sys.log( "UI.ItemCraft_CraftConfirmWnd:RefillMoney()[ERROR]: invalid refil money mode: %s", tostring( moneyMode ) )
	end

end

    
--
function UI.ItemCraft_CraftConfirmWnd:OnEnter( key, controllerIdx )

	if self.okBtn:IsEnabled() then
		self:OnOk()
	end

	return true

end


--
function UI.ItemCraft_CraftConfirmWnd:OnEscape()

	self:OnCancel()
	return true

end


--
function UI.ItemCraft_CraftConfirmWnd:OnOk()

	self:Hide()
	self:NotifyMainWnd( true )

end	


--
function UI.ItemCraft_CraftConfirmWnd:OnCancel()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	self:NotifyMainWnd( false )

end	


--
function UI.ItemCraft_CraftConfirmWnd:NotifyMainWnd( result )

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.ItemCraft_CraftConfirmWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnCraftWndResult then
		sys.log( "UIItemCraftWnd:NotifyMainWnd()[ERROR]: cannot find OnCraftWndResult() function in wnd %s", self.mainWndName )
		return
	end

	mainWnd:OnCraftWndResult( result, { blueprintDefName = self.blueprintDefName, bEnchanted = self.bEnchanted, count = self.count } )

end


-- ------------------------------------------------------------------------
-- UI.ItemCraft_CraftConfirm_OkBtn
-- ------------------------------------------------------------------------

--
UI.ItemCraft_CraftConfirm_OkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "ItemCraft_CraftConfirm_OkBtn",
			isPrototype	= true,
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
				text	= UI:GetStringByName( "itemCraft_craftBtn" ),
   			},
   		}
	},
}


-- ------------------------------------------------------------------------
-- UI.ItemCraft_CraftConfirm_RefillMoneyBtn
-- ------------------------------------------------------------------------

UI.ItemCraft_CraftConfirm_RefillMoneyBtn =
{
	def =
	{
		className	= "Wnd",
		prototype	= "RefillMoneyBtn",

		props =
		{
			name		= "ItemCraft_CraftConfirm_RefillMoneyBtn",
			isPrototype	= true,
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.ItemCraft_CraftConfirm_IcoWnd
-- ------------------------------------------------------------------------

UI.ItemCraft_CraftConfirm_IcoWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props =
		{
			name		= "ItemCraft_CraftConfirm_IcoWnd",
			isPrototype	= true,
		}
	}
}