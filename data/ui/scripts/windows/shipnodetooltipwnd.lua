-- --------------------------------------------------------------------
-- UI.ShipNodeTooltipWnd
-- --------------------------------------------------------------------

UI.ShipNodeTooltipWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.ShipNodeTooltipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipNodeTooltipWnd",
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
				defName 			= "shipNodeTooltip",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "node_ico",
						layer		= "UI.ShipNodeTooltipWnd.layers.ICO_REGULAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "node_ico_2",
						layer		= "UI.ShipNodeTooltipWnd.layers.ICO_NON_ACTIVATABLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title",
						layer		= "UI.ShipNodeTooltipWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count",
						layer		= "UI.ShipNodeTooltipWnd.layers.EVOLUTION_POINTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.ShipNodeTooltipWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "price",
						layer		= "UI.ShipNodeTooltipWnd.layers.REQUIREMENTS",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_REGULAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_regularNode",
				defaultAnimation	= "idle",
			}}
		},

		-- ICO_NON_ACTIVATABLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_nonActivatableLockedNode",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- EVOLUTION_POINTS
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
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- REQUIREMENTS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= 0,
   			formatInfoSz	= { 4, 1 },
   			font			= { fontName = "Small" },
		},

		-- SEPARATOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.ShipNodeTooltipWnd:Setup( _data )

	self:Reset()

	local data = UI:CopyTable2( _data )

	if type( data ) ~= "table" then
		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( data ) )
		return		
	end

	if type( data.nodeName ) ~= "string" then
		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: invalid type of data.nodeName; \"string\" expected, got \"%s\"", type( data.nodeName ) )
		return		
	end

	if data.nodeName == "" then
		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: empty data.nodeName" )
		return		
	end

	if type( data.shipDefName ) ~= "string" then
		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: invalid type of data.shipDefName; \"string\" expected, got \"%s\"", type( data.shipDefName ) )
		return		
	end

	if data.shipDefName == "" then
		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: empty data.shipDefName" )
		return		
	end

	if data.vid ~= nil then
    	if type( data.vid ) ~= "userdata" then
    		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: invalid type of data.vid; \"userdata\" or \"nil\" expected, got \"%s\"", type( data.vid ) )
			data.vid = nil
    	end
	end

	if data.vid == nil then
		data.vid = UI.INVALID_U64_ID
	end

	local shipItem = nil

	if data.vid ~= UI.INVALID_U64_ID then

		shipItem = UI:GetShipItem( data.vid, true )

		if not shipItem then
    		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: cannot find ship item" )
			data.vid = UI.INVALID_U64_ID
		end

	end

	if data.chosenNodesMask ~= nil then
		if type( data.chosenNodesMask ) ~= "userdata" then
    		sys.log( "UI.ShipNodeTooltipWnd:Setup()[ERROR]: invalid type of data.chosenNodesMask; \"userdata\" or \"nil\" expected, got \"%s\"", type( data.chosenNodesMask ) )
			data.chosenNodesMask = nil
		end
	end


	self.data		= data
	self.shipItem	= shipItem

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, _data )
	end

end


--
function UI.ShipNodeTooltipWnd:OnPlaceTooltipOnScreen( pos, tooltipData )

	local finalPos = Vec2( pos )

	local secondaryTooltipWnd = self:GetSecondaryTooltipWnd()

	if secondaryTooltipWnd then
	
		-- если окном, нв котором показывается тултип, были определены правила размещения, отличные от дефолтных, то неизвестно, где показывать вторичный тултип;
		-- (а данный момент там, где есть кастомные правила размещения, там нет тултипа сравнения, поэтому эти случаи по факту не будут никогда пересекаться)
		if tooltipWnd and tooltipData.tooltipPlacement and tooltipData.tooltipPlacement ~= UI.tooltipPlacementRules.DEFAULT then
			sys.log( "UI.ShipNodeTooltipWnd:OnPlaceTooltipOnScreen(): not DEFAULT placement from handler window; unhandled case, tolltip can be shown incorrectly" )
		end
	
		-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0091165);
		-- координаты тоже сбрасываются, поэтому их тоже устанавливать перед показом.
		-- Здесь setup вызывается, т.к. здесь нужно знать размеры, однако эти настройки могут сброситься, если будет вызван reset, поэтому перед показом еще раз вызывать

		secondaryTooltipWnd:Setup( self.secondaryTooltipData )
		
		if pos.x - self.space_secondaryTooltips_x - secondaryTooltipWnd:GetWidth() < 0 then
			if pos.x + self:GetWidth() + self.space_secondaryTooltips_x + secondaryTooltipWnd:GetWidth() > 1024 then
				finalPos.x = 1024 - secondaryTooltipWnd:GetWidth() - self.space_secondaryTooltips_x - self:GetWidth()
			end
		end 
		
	end

	return finalPos

end


-- -----------------------------
-- const
-- -----------------------------

UI.ShipNodeTooltipWnd.layers =
{
    MAIN_EFFECT					= 0,
	ICO_REGULAR_EFFECT			= 1,
	ICO_NON_ACTIVATABLE_EFFECT	= 2,
    NAME						= 3,
	EVOLUTION_POINTS			= 4,
    DESC						= 5,
    REQUIREMENTS				= 6,
    SEPARATOR_1_EFFECT			= 7, 
    SEPARATOR_2_EFFECT			= 8,
}

UI.ShipNodeTooltipWnd.effectInfo =
{
	main =
	{
		nameLocator								= "title",
		descLocator								= "description",
		requirementsLocator						= "price",
		sepLocatorPrefix						= "spacer_",
		minSizeLocator							= "dist_min",
		maxSizeLocator							= "self",
        requirementsLabelColorLocator_enough	= "price_color5",
        requirementsValColorLocator_enough		= "price_color5",
        requirementsLabelColorLocator_notEnough	= "price_color4",
	},

	icoNonActivatable =
	{
		spriteName	= "ico"
	},

	icoRegular =
	{
		spriteName	= "ico"
	}
}

UI.ShipNodeTooltipWnd.MAX_SEPARATORS = 2

UI.ShipNodeTooltipWnd.space_secondaryTooltips_x = UI:XTo1024x768( 10, { x = 1280, y = 720 } )

-- -----------------------------
-- vars
-- -----------------------------

UI.ShipNodeTooltipWnd.data								= nil
UI.ShipNodeTooltipWnd.shipItem							= nil
UI.ShipNodeTooltipWnd.requirementsMetaText				= nil
UI.ShipNodeTooltipWnd.space_name_sep					= 0
UI.ShipNodeTooltipWnd.space_sep_desc					= 0
UI.ShipNodeTooltipWnd.space_desc_sep					= 0
UI.ShipNodeTooltipWnd.space_sep_requirements			= 0
UI.ShipNodeTooltipWnd.space_requirements_btm			= 0
UI.ShipNodeTooltipWnd.minHeight							= 0
UI.ShipNodeTooltipWnd.maxHeight							= 0
UI.ShipNodeTooltipWnd.moduleTooltipWnd					= nil
UI.ShipNodeTooltipWnd.resourceTooltipWnd				= nil
UI.ShipNodeTooltipWnd.secondaryTooltipData				= nil
UI.ShipNodeTooltipWnd.requirementsLabelColor_enough		= UI.TEXT_BASE_COLOR
UI.ShipNodeTooltipWnd.requirementsValColor_enough		= UI.TEXT_BASE_COLOR
UI.ShipNodeTooltipWnd.requirementsLabelColor_notEnough	= UI.TEXT_BASE_COLOR
UI.ShipNodeTooltipWnd.requirementsValColor_notEnough	= UI.PARAM_DELTA_MINUS_COLOR

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.ShipNodeTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

        self.requirementsLabelColor_enough		= mainEffect:GetObjColor( self.effectInfo.main.requirementsLabelColorLocator_enough )
        self.requirementsValColor_enough		= mainEffect:GetObjColor( self.effectInfo.main.requirementsValColorLocator_enough )
        self.requirementsLabelColor_notEnough	= mainEffect:GetObjColor( self.effectInfo.main.requirementsLabelColorLocator_notEnough )

	end

	self.requirementsMetaText = UI.MetaText.GetNewInstance()
	self.requirementsMetaText:InitFromLayer( self, self.layers.REQUIREMENTS )

	self:CreateControls()

	self:PrepareLayout()

end


--
function UI.ShipNodeTooltipWnd:F_Shutdown()

	if self.requirementsMetaText then
		self.requirementsMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipNodeTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipNodeTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ShipNodeTooltipWnd:UpdateMetaTextPos()

	self.requirementsMetaText:UpdateScreenOrgFromLayer( self, self.layers.REQUIREMENTS )

end


--
function UI.ShipNodeTooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REQUIREMENTS then
		self.requirementsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipNodeTooltipWnd:CreateControls()

	self.moduleTooltipWnd	= UI:CreateChildWnd( self, UI.CompareModuleTooltipWnd, "" )
	self.resourceTooltipWnd	= UI:CreateChildWnd( self, UI.CompareResourceTooltipWnd, "" )

end


--
function UI.ShipNodeTooltipWnd:Reset()

	self.data		= nil
	self.shipItem	= nil

	self:SetLayerVisible( false, self.layers.ICO_REGULAR_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_NON_ACTIVATABLE_EFFECT )
	self:SetLayerVisible( false, self.layers.EVOLUTION_POINTS )

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.DESC )

	self:SetLayerVisible( false, self.layers.REQUIREMENTS )
	self.requirementsMetaText:SetText( "", true )

	self.moduleTooltipWnd:Reset()
	self.moduleTooltipWnd:UnlinkFromParent()

	self.resourceTooltipWnd:Reset()
	self.resourceTooltipWnd:UnlinkFromParent()
	
	self.secondaryTooltipData = nil

end


--
function UI.ShipNodeTooltipWnd:FullUpdate()

	if not self.data then
		return
	end

	self:UpdateIco()
	self:UpdateName()
	self:UpdateEvolutionPoints()
	self:UpdateDesc()
	self:UpdateRequirements()
	self:UpdateSecondaryTooltip()

	self:RecalcLayout()

end


--
function UI.ShipNodeTooltipWnd:UpdateIco()

	local icoLayer		= -1
	local hTex			= UI.INVALID_RESOURCE_HANDLE
	local spriteName	= ""

	if UI:IsEvolvingShipNodeNonActivatable( self.data.nodeName ) then

		icoLayer	= self.layers.ICO_NON_ACTIVATABLE_EFFECT
		spriteName	= self.effectInfo.icoNonActivatable.spriteName
		hTex		= UI:GetEvolvingShipNodeIco( self.data.nodeName, false, nil )

	else

		icoLayer	= self.layers.ICO_REGULAR_EFFECT
		spriteName	= self.effectInfo.icoRegular.spriteName
		hTex		= UI:GetEvolvingShipNodeIco( self.data.nodeName, true, true )

	end

	self:SetLayerVisible( true, icoLayer )

	local icoEffect = UI:GetEffectFromLayer( self, icoLayer )
	if icoEffect then
		icoEffect:SetSpriteTexture( spriteName, hTex )
	end

end


--
function UI.ShipNodeTooltipWnd:UpdateName()

	local str = UI:EvolvingShipNode2Str( self.data.nodeName, self.data.shipDefName, self.data.chosenNodesMask, self:GetColor( self.layers.NAME ) )

	local group = UI:GetEvolvingShipNodeGroup( self.data.nodeName )
	if group ~= -1 then

		local strGroup = UI:EvolvingShipNodeGroup2Str( group )
		str = string.format( "%s (%s)", str,  strGroup )

	end

	self:SetText( str, self.layers.NAME )

end


--
function UI.ShipNodeTooltipWnd:UpdateEvolutionPoints()

	if UI:IsEvolvingShipNodeNonActivatable( self.data.nodeName ) then
		return
	end

	local evolutionPoints = UI:GetEvolvingShipNodeEvolutionPoints( self.data.nodeName )
	str = UI:SubstituteValLocalizedByStringId( "shipNodeTooltip_evolutionPoints", evolutionPoints, "val", nil )

	self:SetLayerVisible( true, self.layers.EVOLUTION_POINTS )
	self:SetText( str, self.layers.EVOLUTION_POINTS )

end


--
function UI.ShipNodeTooltipWnd:UpdateDesc()

	local str = UI:GetEvolvingShipNodeDesc( self.data.nodeName, self.data.shipDefName, self.data.chosenNodesMask, nil, self:GetColor( self.layers.DESC ) )
	self:SetText( str, self.layers.DESC )

end


--
function UI.ShipNodeTooltipWnd:UpdateRequirements()

	local bUnlocked = self.data.vid ~= UI.INVALID_U64_ID and UI:IsEvolvingShipNodeUnlocked( self.data.nodeName, self.data.vid )
	if bUnlocked then
		return
	end


	local strRequirements = ""

	-- родитель/ранг

	local parentNodeName, rank = UI:GetEvolvingShipNodeParent( self.data.nodeName, self.data.shipDefName )

	if parentNodeName ~= "" then

		local parentUnlocked = self.data.vid ~= UI.INVALID_U64_ID and UI:IsEvolvingShipNodeUnlocked( parentNodeName, self.data.vid )
		if not parentUnlocked then

			local strParent = UI:GetStringByName( "shipNodeTooltip_parentUnlockRequired" )
			strRequirements = string.format( "%s%s%s", strRequirements, strRequirements ~= "" and "|" or "",  strParent )

		end

	elseif rank ~= -1 then

		local bNeedCraftShip = self.data.vid == UI.INVALID_U64_ID and rank == UI:GetEvolvingShipMinRank( self.data.shipDefName )
		if bNeedCraftShip then

			local strCraftShip = UI:GetStringByName( "shipNodeTooltip_shipCraftRequired" )
			strRequirements = string.format( "%s%s%s", strRequirements, strRequirements ~= "" and "|" or "",  strCraftShip )

		else

			local unlockedRank = self.data.vid ~= UI.INVALID_U64_ID and UI:GetEvolvingShipUnlockedRank( self.shipItem ) or -1
			if unlockedRank == -1 or unlockedRank < rank then

				local strRank = UI:GetStringByName( "shipNodeTooltip_rankRequired" )
				local strVal = tostring( rank )

        		local numSubst = 0
        		strRank, numSubst = string.gsub( strRank, "%$val%$", strVal )

        		if numSubst == 0 then
					sys.log( "UI.ShipNodeTooltipWnd:UpdateRequirements()[ERROR]: cannot find placeholder \"$val$\" in string \"shipNodeTooltip_rankRequired\"" )
        			strRank = string.format( "[INVALID STRING] Unlocked rank required: %s", strVal )
        		end

        		strRequirements = string.format( "%s%s%s", strRequirements, strRequirements ~= "" and "|" or "",  strRank )

			end

		end

	else
		sys.log( "UI.ShipNodeTooltipWnd:UpdateRequirements()[ERROR]: node %s is not child of ship %s", self.data.nodeName, self.data.shipDefName )
	end
	
	local requiredAccountRank = UI:GetEvolvingShipNodeRequiredAccountRank( self.data.nodeName )
	if requiredAccountRank > UI:GetPlayerAccountRank() then
	
		local strRequiredAccountRankVal = tostring( requiredAccountRank )
	
		local strRequiredAccountRank = UI:GetStringByName( "shipNodeTooltip_accountRankRequired" )
		
		local numSubst = 0
		strRequiredAccountRank, numSubst = string.gsub( strRequiredAccountRank, "%$rank%$", strRequiredAccountRankVal )
		
		if numSubst == 0 then
			sys.log( "UI.ShipNodeTooltipWnd:UpdateRequirements()[ERROR]: cannot find placeholder \"$rank$\" in string \"shipNodeTooltip_accountRankRequired\"" )
			strRequiredAccountRank = string.format( "(INVALID STRING) Required rank: %s", strRequiredAccountRankVal )
		end
		
		strRequirements = string.format( "%s%s%s", strRequirements, strRequirements ~= "" and "|" or "",  strRequiredAccountRank )
	
	end


	if strRequirements ~= "" then

		strRequirements = string.format( "%s%s", UI:Color2Str( UI.PARAM_DELTA_MINUS_COLOR ), strRequirements )

	else

    	strRequirements = UI:GetStringByName( "shipNodeTooltip_price" )

    	local strCompleteIco_comleted	= string.format( "$texture [handle %u][ignoreFontSize true][alignment CENTER][color %u]$", UI:GetTex( "done" ), UI.WHITE_COLOR )
    	local strCompleteIco_uncomleted	= string.format( "$texture [handle %u][ignoreFontSize true][alignment CENTER][color %u]$", UI:GetTex( "not_done" ), UI.WHITE_COLOR )

    	local quests	= UI:GetEvolvingShipNodeRequiredQuests( self.data.nodeName )
    	local prices	= UI:GetEvolvingShipNodePrice( self.data.nodeName, self.data.shipDefName )

    	-- квесты

    	if next( quests ) then

    		local numQuestsRequired = #quests

    		local numQuestsCompleted = 0
    		for idx, questId in pairs( quests ) do
    			if UI:IsQuestCompleted( questId ) then
    				numQuestsCompleted = numQuestsCompleted + 1
    			end
    		end

    		local bCompleted = numQuestsCompleted == numQuestsRequired

    		local labelColor		= bCompleted and self.requirementsLabelColor_enough or self.requirementsLabelColor_notEnough
    		local valColor			= bCompleted and self.requirementsValColor_enough or self.requirementsValColor_notEnough
    		local strCompleteIco	= bCompleted and strCompleteIco_comleted or strCompleteIco_uncomleted

    		local strQuests = string.format( "%s%s%s: %s%d/%d", strCompleteIco, UI:Color2Str( labelColor ), UI:GetStringByName( "shipNodeTooltip_price_quests" ), UI:Color2Str( valColor ), numQuestsCompleted, numQuestsRequired )

    		strRequirements = string.format( "%s%s%s", strRequirements, strRequirements ~= "" and "|" or "", strQuests )

    	end


    	-- остальные требования (ресурсы/кредиты/синергия/иридиум)

    	local resourceInfo = { needVal = 0, isVal = 0 }		-- на все ресурсы нужна только одна строка (с суммарными значениями)
    	local stringsInfos = {}

    	for idx, price in pairs( prices ) do

    		if price.priceType == UI.shipNodePriceTypes.CREDITS then

    			local bEnough = price.val <= UI:GetPlayerCredits()

    			local labelColor		= bEnough and self.requirementsLabelColor_enough or self.requirementsLabelColor_notEnough
    			local strCompleteIco	= bEnough and strCompleteIco_comleted or strCompleteIco_uncomleted

    			local priceInfo =
    			{
    				priceType	= _G.GameStore.CreditsType.CT_CREDITS,
    				val			= price.val,
    				basePrice	= price.val,
    				bIsBuyPrice	= true,
    			}
    			local strVal = UI:PriceInfo2Str( priceInfo, labelColor, false, true, false, nil )

    			local strPrice = string.format( "%s%s%s: %s", strCompleteIco, UI:Color2Str( labelColor ), UI:GetStringByName( "shipNodeTooltip_price_credits" ), strVal )
    			table.insert( stringsInfos, { priceType = price.priceType, str = strPrice } )


    		elseif price.priceType == UI.shipNodePriceTypes.TOKENS then

    			local bEnough = price.val <= UI:GetPlayerTokens()

    			local labelColor		= bEnough and self.requirementsLabelColor_enough or self.requirementsLabelColor_notEnough
    			local strCompleteIco	= bEnough and strCompleteIco_comleted or strCompleteIco_uncomleted

    			local priceInfo =
    			{
    				priceType	= _G.GameStore.CreditsType.CT_TOKENS,
    				val			= price.val,
    				basePrice	= price.val,
    				bIsBuyPrice	= true,
    			}
    			local strVal = UI:PriceInfo2Str( priceInfo, labelColor, false, true, false, nil )

    			local strPrice = string.format( "%s%s%s: %s", strCompleteIco, UI:Color2Str( labelColor ), UI:GetStringByName( "shipNodeTooltip_price_iridium" ), strVal )
    			table.insert( stringsInfos, { priceType = price.priceType, str = strPrice } )


    		elseif price.priceType == UI.shipNodePriceTypes.SYNERGY then

    			local isSynergy = ( self.shipItem and UI:GetShipExp( self.shipItem ) or 0 ) + UI:GetPlayerFreeSynergy()
    			local bEnough = price.val <= isSynergy

    			local labelColor		= bEnough and self.requirementsLabelColor_enough or self.requirementsLabelColor_notEnough
    			local strCompleteIco	= bEnough and strCompleteIco_comleted or strCompleteIco_uncomleted

    			local priceInfo =
    			{
    				priceType	= UI.exPriceTypes.SYNERGY,
    				val			= price.val,
    				basePrice	= price.val,
    				bIsBuyPrice	= true,
    			}
    			local strVal = UI:PriceInfo2Str( priceInfo, labelColor, false, true, false, isSynergy )

    			local strPrice = string.format( "%s%s%s: %s", strCompleteIco, UI:Color2Str( labelColor ), UI:GetStringByName( "shipNodeTooltip_price_synergy" ), strVal )
    			table.insert( stringsInfos, { priceType = price.priceType, str = strPrice } )


    		elseif price.priceType == UI.shipNodePriceTypes.ITEM then

    			resourceInfo.needVal = resourceInfo.needVal + price.count

    			local isVal = math.min( UI:GetPlayerResourceCount( price.defName ), price.count )
    			resourceInfo.isVal = resourceInfo.isVal + isVal			

    		else
    			sys.log( "UI.ShipNodeTooltipWnd:UpdateRequirements()[ERROR]: unhandled node price type %d", price.priceType )
    		end

    	end

    	if resourceInfo.needVal > 0 then

    		local bEnough = resourceInfo.needVal <= resourceInfo.isVal

    		local labelColor		= bEnough and self.requirementsLabelColor_enough or self.requirementsLabelColor_notEnough
    		local valColor			= bEnough and self.requirementsValColor_enough or self.requirementsValColor_notEnough
    		local strCompleteIco	= bEnough and strCompleteIco_comleted or strCompleteIco_uncomleted

    		local strPrice = string.format( "%s%s%s: %s%d/%d", strCompleteIco, UI:Color2Str( labelColor ), UI:GetStringByName( "shipNodeTooltip_price_resources" ), UI:Color2Str( valColor ), resourceInfo.isVal, resourceInfo.needVal )
    		table.insert( stringsInfos, { priceType = UI.shipNodePriceTypes.ITEM, str = strPrice } )

    	end


    	local priceTypesOrder =
    	{
        	[ UI.shipNodePriceTypes.ITEM ]		= 1,
        	[ UI.shipNodePriceTypes.SYNERGY ] 	= 2,
        	[ UI.shipNodePriceTypes.CREDITS ]	= 3,
        	[ UI.shipNodePriceTypes.TOKENS ] 	= 4,
    	}

    	local function fnSort( string1, string2 )

    		local sortOrder1 = priceTypesOrder[ string1.priceType ] or -1
    		local sortOrder2 = priceTypesOrder[ string2.priceType ] or -1

    		return sortOrder1 < sortOrder2

    	end

    	table.sort( stringsInfos, fnSort )


    	-- всё вместе
    	for idx, stringInfo in ipairs( stringsInfos ) do
    		strRequirements = string.format( "%s%s%s", strRequirements, strRequirements ~= "" and "|" or "", stringInfo.str )
    	end

	end

	self:SetLayerVisible( true, self.layers.REQUIREMENTS )
	self.requirementsMetaText:SetText( strRequirements, true )

end


--
function UI.ShipNodeTooltipWnd:UpdateSecondaryTooltip()

	-- спецмодуль

	if UI:IsEvolvingShipNodeOfTypeSpecModule( self.data.nodeName ) then

    	local specModuleDefName = UI:GetEvolvingShipNodeSpecModule( self.data.nodeName, self.data.shipDefName, self.data.chosenNodesMask )

		if specModuleDefName ~= "" then

        	self.secondaryTooltipData =
        	{
        		tooltipType		= UI.tooltipTypes.MODULE,
        		defName			= specModuleDefName,
        		dstShipData		= nil,	-- устанавливается ниже
        	}

        	if self.data.vid ~= UI.INVALID_U64_ID then
        		self.secondaryTooltipData.dstShipData = UI.ModuleTooltipWnd.ShipData:CreateForVid( self.data.vid, ai.SpaceShipModuleSlot.SPECIAL, self.data.chosenNodesMask )
        	else
        		self.secondaryTooltipData.dstShipData = UI.ModuleTooltipWnd.ShipData:CreateForDef( self.data.shipDefName, ai.SpaceShipModuleSlot.SPECIAL )
        	end

		else
			sys.log( "UI.ShipNodeTooltipWnd:UpdateSecondaryTooltip()[ERROR]: cannot find spec module for node %s ship %s", self.data.nodeName, self.data.shipDefName )
		end


	-- чертеж

	elseif UI:IsEvolvingShipNodeOfTypeBlueprint( self.data.nodeName ) then

		local blueprintDefName = UI:GetEvolvingShipNodeBlueprint( self.data.nodeName )
		if blueprintDefName ~= "" then

    		local craftResultDefName = UI:GetResourceCraftResult( blueprintDefName )
			if craftResultDefName ~= "" then

				if UI:IsDefModule( craftResultDefName ) or UI:IsDefAmmo( craftResultDefName ) then

                	self.secondaryTooltipData =
                	{
                		tooltipType		= UI.tooltipTypes.MODULE,
                		defName			= craftResultDefName,
                	}

				elseif UI:IsDefResource( craftResultDefName ) or UI:IsDefBlueprint( craftResultDefName ) then

                	self.secondaryTooltipData =
                	{
                		tooltipType		= UI.tooltipTypes.RESOURCE,
                		defName			= craftResultDefName,
                	}

				else
					sys.log( "UI.ShipNodeTooltipWnd:UpdateSecondaryTooltip()[ERROR]: unhandled type of craft result: %s", craftResultDefName )
				end

			else
				sys.log( "UI.ShipNodeTooltipWnd:UpdateSecondaryTooltip()[ERROR]: cannot find craft result for blueprint %s", blueprintDefName )
			end

		else
			sys.log( "UI.ShipNodeTooltipWnd:UpdateSecondaryTooltip()[ERROR]: cannot find blueprint for node %s", self.data.nodeName )
		end

	end

end


--
function UI.ShipNodeTooltipWnd:ShowSeparator( sepIdx, y )

	if sepIdx > self.MAX_SEPARATORS then
		sys.log( "UI.ShipNodeTooltipWnd:ShowSeparator()[ERROR]: cannot show separator %d; max separators is %d", sepIdx, self.MAX_SEPARATORS )
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
function UI.ShipNodeTooltipWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local namePos				= mainEffect:GetObjPos( self.effectInfo.main.nameLocator )
	local nameSize				= mainEffect:GetObjSize( self.effectInfo.main.nameLocator )
	local descPos				= mainEffect:GetObjPos( self.effectInfo.main.descLocator )
	local descSize				= mainEffect:GetObjSize( self.effectInfo.main.descLocator )
	local requirementsPos				= mainEffect:GetObjPos( self.effectInfo.main.requirementsLocator )
	local requirementsSize				= mainEffect:GetObjSize( self.effectInfo.main.requirementsLocator )
	local minSize				= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )
	local maxSize				= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )

	local NUM_SEPARATORS_IN_EFFECT = 3
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPARATORS_IN_EFFECT do
		local sepPos = mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end	

    self.space_name_sep				= sepsPoss[ 1 ].y - ( namePos.y + nameSize.y )
    self.space_sep_desc				= descPos.y - sepsPoss[ 2 ].y
    self.space_desc_sep				= sepsPoss[ 3 ].y - ( descPos.y + descSize.y )
    self.space_sep_requirements			= requirementsPos.y - sepsPoss[ 3 ].y
    self.space_requirements_btm			= maxSize.y - ( requirementsPos.y + requirementsSize.y )
    self.minHeight					= minSize.y
    self.maxHeight					= maxSize.y

	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( descPos.x, self.layers.DESC )
	self:SetLayerLeft( requirementsPos.x, self.layers.REQUIREMENTS )
	self:SetLayerWidth( requirementsSize.x, self.layers.REQUIREMENTS )

	self.requirementsMetaText:SetFormatRectSize( UI:Vec2( requirementsSize.x, 10000000 ), true )

	local sepPos = UI:Vec2( sepsPoss[ 1 ].x, 0 )
	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:SetPos( sepPos )
		end
	end

	self:SetWidth( maxSize.x )

end


--
function UI.ShipNodeTooltipWnd:RecalcLayout()

	local nextSepIdx = 1

	local btm = self:GetLayerTop( self.layers.NAME ) + self:GetLayerHeight( self.layers.NAME ) + self.space_name_sep


	-- описание - позиция, размер

	if self:IsLayerVisible( self.layers.DESC ) then

		self:ShowSeparator( nextSepIdx, btm )
		nextSepIdx = nextSepIdx + 1

    	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 10000000 )

        local height = _G.MeasureText(
       		self:GetText( self.layers.DESC ),
       		self:GetFont( self.layers.DESC ),
        	formatRect,
       		self:GetTextFormatFlags( self.layers.DESC ),
        	formatRect ).w

		self:SetLayerHeight( height, self.layers.DESC )

		local y = btm + self.space_sep_desc
		self:SetLayerTop( y, self.layers.DESC )

		btm = y + height + self.space_desc_sep		

	end


	-- цена - позиция, размер

	if self:IsLayerVisible( self.layers.REQUIREMENTS ) then

		self:ShowSeparator( nextSepIdx, btm )
		nextSepIdx = nextSepIdx + 1

    	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.REQUIREMENTS ), 10000000 )

        local height = _G.MeasureText(
       		self.requirementsMetaText:GetFormattedText(),
       		self:GetFont( self.layers.REQUIREMENTS ),
        	formatRect,
       		self:GetTextFormatFlags( self.layers.REQUIREMENTS ),
        	formatRect ).w

		local y = btm + self.space_sep_requirements
		self:SetLayerTop( y, self.layers.REQUIREMENTS )
		self:UpdateMetaTextPos()

		btm = y + height + self.space_requirements_btm

	end


	-- собственный размер

	local selfHeight = UI:Clamp( btm, self.minHeight, self.maxHeight )
	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


--
function UI.ShipNodeTooltipWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:CheckSecondaryTooltip()

end


--
function UI.ShipNodeTooltipWnd:CheckSecondaryTooltip()

	local secondaryTooltipWnd = self:GetSecondaryTooltipWnd()
	if secondaryTooltipWnd then

    	local bNeedSecondaryTooltip	= _G.Input_IsKeyPressed( UI.Keys.KEY_ALT )
    	local bIsSecondaryTooltip	= secondaryTooltipWnd:IsOnScreen()

    	if bNeedSecondaryTooltip and not bIsSecondaryTooltip then
		
			-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0091165);
			-- координаты тоже сбрасываются, поэтому их тоже устанавливать перед показом.
			
			secondaryTooltipWnd:Setup( self.secondaryTooltipData )
    		UI.Root:AddChild( secondaryTooltipWnd )
			self:RecalcSecondaryTooltipLayout()

    	elseif not bNeedSecondaryTooltip and bIsSecondaryTooltip then
    		secondaryTooltipWnd:UnlinkFromParent()
    	end

	end

end


--
function UI.ShipNodeTooltipWnd:RecalcSecondaryTooltipLayout()

	local secondaryTooltipWnd = self:GetSecondaryTooltipWnd()

	if not secondaryTooltipWnd then
		return
	end

	local x = self:GetLeft() - self.space_secondaryTooltips_x - secondaryTooltipWnd:GetWidth()
	if x < 0 then
		x = self:GetLeft() + self:GetWidth() + self.space_secondaryTooltips_x
	end 

	local y = self:GetTop()
	if y + secondaryTooltipWnd:GetHeight() > 768 then
		y = 768 - secondaryTooltipWnd:GetHeight()
	end

	secondaryTooltipWnd:SetPos( UI:Vec2( x, y ) )
	
end


--
function UI.ShipNodeTooltipWnd:GetSecondaryTooltipWnd()

	local secondaryTooltipWnd = nil

	if self.secondaryTooltipData then
	
		if self.secondaryTooltipData.tooltipType == UI.tooltipTypes.MODULE then
			secondaryTooltipWnd = self.moduleTooltipWnd

		elseif self.secondaryTooltipData.tooltipType == UI.tooltipTypes.RESOURCE then
			secondaryTooltipWnd = self.resourceTooltipWnd
		end	
	
	end

	return secondaryTooltipWnd

end


--
function UI.ShipNodeTooltipWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if self.moduleTooltipWnd:IsOnScreen() then
		self.moduleTooltipWnd:UnlinkFromParent()
	end

	if self.resourceTooltipWnd:IsOnScreen() then
		self.resourceTooltipWnd:UnlinkFromParent()
	end

end