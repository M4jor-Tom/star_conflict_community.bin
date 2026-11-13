-- ----------------------------------------------------------------------------
--
-- Workfile: linkwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.LinkWnd = {}

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.LinkWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "LinkWnd",
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numBaseBtnLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "notifications_link",
				defaultAnimation	= "idle_1",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.LinkWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},		

		-- TEXT
		{
			id				= l_numBaseBtnLayers,

			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_LEFT + FONT.TF_TOP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}		
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.LinkWnd:Setup( linkType, params, hFont, blendMode, backColor )

	if UI:Val2Key( self.linkTypes, linkType ) == "" then
		sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid 1-st parameter (\"linkType\"); one of the \"UI.LinkWnd.linkTypes\" values expected, got \"%s\"", tostring( linkType ) )
		return
	end

	if params == nil then
		params = {}
	else
    	if type( params ) ~= "table" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"params\"); \"table\" or \"nil\" expected, got \"%s\"", type( params ) )
			return
    	end
	end

	if linkType == self.linkTypes.ITEM then
	
		if type( params.defName ) ~= "string" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.defName\"; \"string\" expected, got \"%s\"", type( params.defName ) )
			return
		end

		if params.autogenItem ~= nil then
			if type( params.autogenItem ) ~= "table" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.autogenItem\"; \"table\" or \"nil\" expected, got \"%s\"", type( params.autogenItem ) )
				return
			end
		end
		
		if params.autogenItem then
			local newDefName = UI:AddTempAutogenDef( params.autogenItem )
			if newDefName ~= params.defName then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: mismathed defName after UI:AddTempAutogenDef() (old=%s, new=%s)", params.defName, newDefName )
				params.defName = newDefName
			end
		end

		if params.iid then
			if type( params.iid ) ~= "userdata" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.iid\"; \"userdata\" (u64) or \"nil\" expected, got \"%s\"", type( params.iid ) )
				return
			end
		else
			params.iid = UI.INVALID_U64_ID
		end

		if params.bOpenShop ~= nil then
			if type( params.bOpenShop ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bOpenShop\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bOpenShop ) )
				params.bOpenShop = nil
			end
		end

		if params.bOpenShop ~= nil then
			params.bOpenShop = false
		end

		if params.bOpenStore ~= nil then
			if type( params.bOpenStore ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bOpenStore\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bOpenStore ) )
				params.bOpenStore = nil
			end
		end

		if params.bOpenStore == nil then
			params.bOpenStore = false
		end
		
		if params.bOpenItemCraftMulty ~= nil then
			if type( params.bOpenItemCraftMulty ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bOpenItemCraftMulty\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bOpenItemCraftMulty ) )
				params.bOpenItemCraftMulty = nil
			end
		end

		if params.bOpenItemCraftMulty == nil then
			params.bOpenItemCraftMulty = false
		end
		
		local numActions = 0
		if params.bOpenShop then
			numActions = numActions + 1
		end
		if params.bOpenStore then
			numActions = numActions + 1
		end
		if params.bOpenItemCraftMulty then
			numActions = numActions + 1
		end

		if numActions > 1 then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: more than one action specified" )
			params.bOpenShop = false
			params.bOpenStore = false
			params.bOpenItemCraftMulty = false
		end

		if params.bShowTooltip ~= nil then
			if type( params.bShowTooltip ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bShowTooltip\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bShowTooltip ) )
				params.bShowTooltip = nil
			end
		end

		if params.bShowTooltip == nil then
			params.bShowTooltip = true
		end

		if params.bEnchanted ~= nil then
			if type( params.bEnchanted ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bEnchanted\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bEnchanted ) )
				params.bEnchanted = nil
			end
		end

		if params.bEnchanted == nil then
			params.bEnchanted = false
		end

	elseif linkType == self.linkTypes.SHIP then

		if type( params.defName ) ~= "string" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.defName\"; \"string\" expected, got \"%s\"", type( params.defName ) )
			return
		end

		if params.vid then
			if type( params.vid ) ~= "userdata" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.vid\"; \"userdata\" (u64) or \"nil\" expected, got \"%s\"", type( params.vid ) )
				return
			end
		else
			params.vid = UI.INVALID_U64_ID
		end

	elseif linkType == self.linkTypes.HTTP then

		if type( params.href ) ~= "string" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.href\"; \"string\" expected, got \"%s\"", type( params.href ) )
			return
		end

		if type( params.text ) ~= "string" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.text\"; \"string\" expected, got \"%s\"", type( params.text ) )
			return
		end

		if params.bSteam ~= nil and type( params.bSteam ) ~= "boolean" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bSteam\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bSteam ) )
			return
		end

	elseif linkType == self.linkTypes.ITEM_SUBTYPE then

		if type( params.itemSubType ) ~= "number" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.itemSubType\"; \"number\" expected, got \"%s\"", type( params.itemSubType ) )
			return
		end

		if UI:Val2Key( _G.ItemSubtype, params.itemSubType ) == "" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid \"params.itemSubType\"; one of the \"_G.ItemSubtype\" members expected, got \"%s\"", params.itemSubType )
			return
		end

		if params.bOpenShop ~= nil then
			if type( params.bOpenShop ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bOpenShop\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bOpenShop ) )
				return
			end
		else
			params.bOpenShop = false
		end

	elseif linkType == self.linkTypes.PLAYER then

		if type( params.uid ) ~= "userdata" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.uid\"; \"userdata\" expected, got \"%s\"", type( params.uid ) )
			return
		end

		if params.bWithClan ~= nil then
			if type( params.bWithClan ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bWithClan\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bWithClan ) )
				params.bWithClan = nil
			end
		end

		if params.bWithClan == nil then
			params.bWithClan = false
		end

		if params.bPremium ~= nil then
			if type( params.bPremium ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bPremium\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bPremium ) )
				params.bPremium = nil
			end
		end

		if params.bPremium == nil then
			params.bPremium = false
		end

		if params.bWithTooltip ~= nil then
			if type( params.bWithTooltip ) ~= "boolean" then
				sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bWithTooltip\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bWithTooltip ) )
				params.bWithTooltip = nil
			end
		end

		if params.bWithTooltip == nil then
			params.bWithTooltip = true
		end

	elseif linkType == self.linkTypes.CUSTOM_TEXT or linkType == self.linkTypes.CUSTOM_ICO or linkType == self.linkTypes.CUSTOM_EFFECT then

		if linkType == self.linkTypes.CUSTOM_TEXT then

    		if params.text ~= nil then
        		if type( params.text ) ~= "string" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.text\"; \"string\" expected, got \"%s\"", type( params.text ) )
        			params.text = nil
        		end
    		end

    		if params.textId ~= nil then
        		if type( params.textId ) ~= "string" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.textId\"; \"string\" expected, got \"%s\"", type( params.textId ) )
        			params.textId = nil
        		end
    		end

    		if not params.text and not params.textId then
        		sys.log( "UI.LinkWnd:Setup()[ERROR]: both \"params.text\" and \"params.textId\" are nil" )
    			return
    		end

    		if params.text and params.textId then
        		sys.log( "UI.LinkWnd:Setup()[ERROR]: both \"params.text\" and \"params.textId\" are not nil" )
    			params.textId = nil
    		end

		elseif linkType == self.linkTypes.CUSTOM_ICO then

    		if params.hTex ~= nil then
        		if type( params.hTex ) ~= "number" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.hTex\"; \"number\" expected, got \"%s\"", type( params.hTex ) )
        			params.hTex = nil
        		end
    		end

    		if params.texName ~= nil then
        		if type( params.texName ) ~= "string" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.texName\"; \"string\" expected, got \"%s\"", type( params.texName ) )
        			params.texName = nil
        		end
    		end

    		if not params.hTex and not params.texName then
        		sys.log( "UI.LinkWnd:Setup()[ERROR]: both \"params.hTex\" and \"params.texName\" are nil" )
    			return
    		end

    		if params.hTex and params.texName then
        		sys.log( "UI.LinkWnd:Setup()[ERROR]: both \"params.hTex\" and \"params.texName\" are not nil" )
    			params.texName = nil
    		end  

			if not params.hTex then
				params.hTex = UI:GetTex( params.texName )
			end

		elseif linkType == self.linkTypes.CUSTOM_EFFECT then

    		if type( params.effectName ) ~= "string" then
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.effectName\"; \"string\" expected, got \"%s\"", type( params.effectName ) )
				return
    		end

			if params.animation ~= nil then
        		if type( params.animation ) ~= "string" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.animation\"; \"string\" or \"nil\" expected, got \"%s\"", type( params.animation ) )
    				params.animation = nil
        		end
			end

			if params.spriteName ~= nil then
        		if type( params.spriteName ) ~= "string" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.spriteName\"; \"string\" or \"nil\" expected, got \"%s\"", type( params.spriteName ) )
    				params.spriteName = nil
        		end
			end

			if params.spriteName ~= nil and params.spriteName ~= "" then
        		if type( params.hSpriteTex ) ~= "number" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.hSpriteTex\"; \"number\" or expected, got \"%s\"", type( params.hSpriteTex ) )
    				params.spriteName = nil
					params.hSpriteTex = nil
        		end
			end

		end

		if params.colorUnsel ~= nil then
    		if type( params.colorUnsel ) ~= "number" then
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.colorUnsel\"; \"number\" expected, got \"%s\"", type( params.colorUnsel ) )
				params.colorUnsel = nil
    		end
		end

		local numTooltipMethods = 0

		if params.tooltipText ~= nil then
    		if type( params.tooltipText ) == "string" then

				if params.tooltipText ~= "" then
					numTooltipMethods = numTooltipMethods + 1
				else
					params.tooltipText = nil
				end

			else
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.tooltipText\"; \"string\" expected, got \"%s\"", type( params.tooltipText ) )
				params.tooltipText = nil
			end
		end

		if params.tooltipTextId ~= nil then
    		if type( params.tooltipTextId ) == "string" then

				if params.tooltipTextId ~= "" then
					numTooltipMethods = numTooltipMethods + 1
				else
					params.tooltipTextId = nil
				end

			else
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.tooltipTextId\"; \"string\" expected, got \"%s\"", type( params.tooltipTextId ) )
				params.tooltipTextId = nil
			end
		end

		if params.fnGetTooltipData ~= nil then
    		if type( params.fnGetTooltipData ) == "string" then

				if params.fnGetTooltipData ~= "" then
					numTooltipMethods = numTooltipMethods + 1
				else
					params.fnGetTooltipData = nil
				end

			else
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.fnGetTooltipData\"; \"string\" expected, got \"%s\"", type( params.fnGetTooltipData ) )
				params.fnGetTooltipData = nil
			end
		end

		if params.tooltipData ~= nil then
    		if type( params.tooltipData ) == "table" then

				if next( params.tooltipData ) then
					numTooltipMethods = numTooltipMethods + 1
				else
					params.tooltipData = nil
				end

			else
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.tooltipData\"; \"table\" expected, got \"%s\"", type( params.tooltipData ) )
				params.tooltipData = nil
			end
		end

		if numTooltipMethods > 1 then

    		sys.log( "UI.LinkWnd:Setup()[ERROR]: more than one tooltip method specified" )

			if params.tooltipData then
				params.fnGetTooltipData = nil
				params.tooltipText = nil
				params.tooltipTextId = nil

			elseif params.fnGetTooltipData then
				params.tooltipData = nil
				params.tooltipText = nil
				params.tooltipTextId = nil

			elseif params.tooltipText then
				params.tooltipData = nil
				params.fnGetTooltipData = nil
				params.tooltipTextId = nil

			elseif params.tooltipTextId then
				params.tooltipData = nil
				params.fnGetTooltipData = nil
				params.tooltipText = nil
			end

		end

		if params.tooltipText or params.tooltipTextId then

    		if params.tooltipCaption ~= nil then
        		if type( params.tooltipCaption ) ~= "string" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.tooltipCaption\"; \"string\" expected, got \"%s\"", type( params.tooltipCaption ) )
    				params.tooltipCaption = nil
    			end
    		end

    		if params.tooltipCaptionId ~= nil then
        		if type( params.tooltipCaptionId ) ~= "string" then
        			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.tooltipCaptionId\"; \"string\" expected, got \"%s\"", type( params.tooltipCaptionId ) )
    				params.tooltipCaptionId = nil
    			end
    		end

			if params.tooltipCaption then
				params.tooltipCaptionId = nil
			end

		end

		if params.handler ~= nil then
    		if type( params.handler ) ~= "string" then
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.handler\"; \"string\" expected, got \"%s\"", type( params.handler ) )
				params.handler = nil
			end
		end

	elseif linkType == self.linkTypes.PRICE then

		if not UI:IsPriceInfoValid( params.priceInfo ) then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid param \"params.priceInfo\"" )
			return			
		end

		if params.baseColor ~= nil then
    		if type( params.baseColor ) ~= "number" then
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.baseColor\"; \"number\" or \"nil\" expected, got \"%s\"", type( params.baseColor ) )
    			params.baseColor = nil
    		end
		end

    	if params.baseColor == nil then
    		params.baseColor = UI.TEXT_BASE_COLOR
    	end

		if params.bShowSale ~= nil then
    		if type( params.bShowSale ) ~= "boolean" then
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bShowSale\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bShowSale ) )
    			params.bShowSale = nil
    		end
		end

		if params.bShowNotEnoughMoney ~= nil then
    		if type( params.bShowNotEnoughMoney ) ~= "boolean" then
    			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.bShowNotEnoughMoney\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( params.bShowNotEnoughMoney ) )
    			params.bShowNotEnoughMoney = nil
    		end
		end

	elseif linkType == self.linkTypes.RESOURCE then

		if type( params.defName ) ~= "string" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.defName\"; \"string\" expected, got \"%s\"", type( params.defName ) )
			return
		end

	elseif linkType == self.linkTypes.ROLES then

		if type( params.roles ) ~= "table" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.roles\"; \"table\" expected, got \"%s\"", type( params.roles ) )
			return
		end

	elseif linkType == self.linkTypes.SPEC_MODULE_PARTS then

		if type( params.shipDefName ) ~= "string" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.shipDefName\"; \"string\" expected, got \"%s\"", type( params.shipDefName ) )
			params.shipDefName = ""
		end

	elseif linkType == self.linkTypes.ACCOUNT_AURA then

		if type( params.defName ) ~= "string" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.defName\"; \"string\" expected, got \"%s\"", type( params.defName ) )
			return
		end

	elseif linkType == self.linkTypes.ACHIEVEMENT then

		if type( params.id ) ~= "number" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.id\"; \"number\" expected, got \"%s\"", type( params.id ) )
			return
		end

		if type( params.rank ) ~= "number" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.rank\"; \"number\" expected, got \"%s\"", type( params.rank ) )
			return
		end
		
	elseif linkType == self.linkTypes.TITLE then

		if type( params.id ) ~= "number" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.id\"; \"number\" expected, got \"%s\"", type( params.id ) )
			return
		end
		
	elseif linkType == self.linkTypes.QUEST_CATEGORY then
			
		if type( params.category ) ~= "number" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.category\"; \"number\" expected, got \"%s\"", type( params.category ) )
			return
		end
		
	elseif linkType == self.linkTypes.MILITARY_RANK then
			
		if type( params.militaryRank ) ~= "number" and type( params.militaryRank ) ~= "userdata" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.militaryRank\"; \"number\" or \"userdata\" expected, got \"%s\"", type( params.militaryRank ) )
			return
		end
		
		if type( params.militaryExp ) ~= "number" and type( params.militaryExp ) ~= "userdata" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.militaryExp\"; \"number\" or \"userdata\" expected, got \"%s\"", type( params.militaryExp ) )
			return
		end
		
		if type( params.militaryRank ) == "userdata" then
			params.militaryRank = params.militaryRank.l
		end
		
		if type( params.militaryExp ) == "userdata" then
			params.militaryExp = params.militaryExp.l
		end

	else
		sys.log( "UI.LinkWnd:Setup()[ERROR]: unhandled linkType: %d", linkType )
	end

	if params.colorUnsel ~= nil then
		if type( params.colorSel ) ~= "number" then
			sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of \"params.colorSel\"; \"number\" expected, got \"%s\"", type( params.colorSel ) )
			params.colorSel = nil
			params.colorUnsel = nil
		end

	else
		if params.colorSel ~= nil then
    		sys.log( "UI.LinkWnd:Setup()[ERROR]: \"params.colorUnsel\" is nil, but \"params.colorSel\" is not nil" )
			params.colorSel = nil
		end
	end

	if hFont ~= nil then
    	if type( hFont ) ~= "number" then
    		sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"hFont\"); \"number\" or \"nil\" expected, got \"%s\"", type( hFont ) )
			hFont = nil
    	end
	end

	if hFont == nil then
		hFont = FONT.INVALID_FONT_HANDLE
	end

	if blendMode ~= nil then
    	if type( blendMode ) ~= "number" then
    		sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of the 4-th parameter (\"blendMode\"); \"number\" or \"nil\" expected, got \"%s\"", type( blendMode ) )
			blendMode = nil
    	end
	end

	if blendMode == nil then
		blendMode = UI.BM_ALPHA
	end

	if backColor ~= nil then
    	if type( backColor ) ~= "number" then
    		sys.log( "UI.LinkWnd:Setup()[ERROR]: invalid type of the 5-th parameter (\"backColor\"); \"number\" or \"nil\" expected, got \"%s\"", type( backColor ) )
			backColor = nil
    	end
	end

	if backColor == nil then
		backColor = 0
	end

	self:Reset()

	self.linkType	= linkType
	self.params		= params
	self.hFont		= hFont
	self.blendMode	= blendMode
	self.backColor	= backColor

	self:FullUpdate()

end


--
function UI.LinkWnd:Reset()

	self.linkType		= -1
	self.params			= {}
	self.hFont			= FONT.INVALID_FONT_HANDLE
	self.blendMode		= UI.BM_ALPHA
	self.backColor		= 0
	self.tooltipData	= nil

	self.metaText:SetText( "", true )

	self:SetAlpha( 255 )

end


--
function UI.LinkWnd:GetLinkType()

	return self.linkType

end


--
function UI.LinkWnd:GetParams()

	return self.params

end


--
function UI.LinkWnd:GetTextFont()

	return self:GetFont( self.layers.TEXT )

end


--
function UI.LinkWnd:GetTooltipData()

	return self.tooltipData

end


-- TODO: возможно, будут специальные тултипы
function UI.LinkWnd:HandleTooltip( targetWnd, tooltipData )

	return false

end


--
function UI.LinkWnd:SetAlpha( alpha )

	local color = self:GetColor( self.layers.TEXT )
	color = UI:SetAlpha( color, alpha )

	self:SetColor( color, self.layers.TEXT )
	self.metaText:SetColor( color )

end


--
function UI.LinkWnd:GetCustomData()

	return self.params.customData

end


--
function UI.LinkWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.LinkWnd:GetLinkText()

	return self.metaText:GetFormattedText()

end


-- Не требует инстанса ссылки, может быть вызвана на самом прототипе LinkWnd
function UI.LinkWnd:MakeText( linkType, params )

	local text = ""

	if linkType == self.linkTypes.ITEM then

		if not UI:IsStrEmpty( params.text ) then
			text = params.text
		else
			if self.params.autogenItem then
				UI:AddTempAutogenDef( self.params.autogenItem )
			end

			text = UI:GetEntityLocalizedNameByDef( params.defName, false, nil, nil, nil, nil, self.params.autogenItem and self.params.autogenItem.upgradeLevel or -1 )
		end

	elseif linkType == self.linkTypes.SHIP then

		if not UI:IsStrEmpty( params.text ) then
			text = params.text
		else
			text = UI:GetEntityLocalizedNameByDef( params.defName, false )
		end

	elseif linkType == self.linkTypes.HTTP then
		text = params.text

	elseif linkType == self.linkTypes.ITEM_SUBTYPE then
		text = UI:ItemSubType2Str2( params.itemSubType )

	elseif linkType == self.linkTypes.PLAYER then

		text = UI:MakePlayerNameByUid( params.uid, params.bWithClan, false, false )

		if params.bPremium then
			local strIco = string.format( "$texture [handle %u][ignoreFontSize true][alignment CENTER][color %u]$", UI:GetPremiumPlayerIco(), UI.WHITE_COLOR )
			text = string.format( "%s%s", strIco, text )
		end

	elseif linkType == self.linkTypes.ITEM_SUBTYPE then

	elseif linkType == self.linkTypes.PRICE then
		text = UI:PriceInfo2Str( params.priceInfo, params.baseColor, params.bShowSale, params.bShowNotEnoughMoney, false, params.playerMoney )

	elseif linkType == self.linkTypes.RESOURCE then

		if not UI:IsStrEmpty( params.text ) then
			text = params.text
		else
			text = UI:GetEntityLocalizedNameByDef( params.defName, false )
		end

	elseif linkType == self.linkTypes.CUSTOM_TEXT then

		if params.text then
			text = params.text

		elseif params.textId then
			text = UI:GetStringByName( params.textId )
		end

	elseif linkType == self.linkTypes.CUSTOM_ICO then
		text = string.format( "$texture [handle %s][ignoreFontSize true][alignment CENTER]$", params.hTex )

	elseif linkType == self.linkTypes.CUSTOM_EFFECT then

		local strAnimation = ""
		if not UI:IsStrEmpty( params.animation ) then
			strAnimation = string.format( "[animation %s]", params.animation )
		end

		local strSprite = ""
		if not UI:IsStrEmpty( params.spriteName ) and params.hSpriteTex then
			strSprite = string.format( "[sprite %s %s]", params.spriteName, tostring( params.hSpriteTex ) )
		end

		text = string.format( "$effect [effectName %s]%s%s$", params.effectName, strAnimation, strSprite )

	elseif linkType == self.linkTypes.ROLES then

    	for idx = 1, #params.roles do

    		local role = params.roles[ idx ]

    		local hTexRole = UI:GetRoleIco( role )
    		local strRole = string.format( "$texture [handle %u][ignoreFontSize true][alignment CENTER][color %u]$", hTexRole, UI.WHITE_COLOR )

    		text = string.format( "%s%s", text, strRole )

    	end

	elseif linkType == self.linkTypes.SPEC_MODULE_PARTS then
		text = UI:SpecModuleParts2Str( params.shipDefName )

	elseif linkType == self.linkTypes.ACCOUNT_AURA then
		text = UI:AccountAura2Str( params.defName )

	elseif linkType == self.linkTypes.ACHIEVEMENT then
		text = UI:Achievement2Str( params.id, params.rank )
		
	elseif linkType == self.linkTypes.TITLE then
		text = UI:Title2Str( params.id )
		
	elseif linkType == self.linkTypes.QUEST_CATEGORY then
		text = UI:QuestCategory2Str( params.category )
		
	elseif linkType == self.linkTypes.MILITARY_RANK then
		text = UI:MilitaryRank2Str( params.militaryRank )

	else
		sys.log( "UI.LinkWnd:MakeText()[ERROR]: unhandled linkType: %s", tostring( linkType ) )		
	end

	if params.bWithBrackets == true then
		text = string.format( "[%s]", text )
	end

	return text

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.LinkWnd.layers =
{
    MAIN_EFFECT	= 0,
	DEBUG		= 1,
    TEXT		= 2,
}

UI.LinkWnd.linkTypes =
{
	ITEM				= 1,
	SHIP				= 2,
	HTTP				= 3, 
	ITEM_SUBTYPE		= 4, 
	PLAYER				= 5, 
	CUSTOM_TEXT			= 6, 
	CUSTOM_ICO			= 7, 
	CUSTOM_EFFECT		= 8, 
	KARMA				= 9, 
	PRICE				= 10,
	RESOURCE			= 11,	-- tODO: убрать, обрабатывать ресурсы и чертежи внутри ITEM
	ROLES				= 12,
	SPEC_MODULE_PARTS	= 13,
	ACCOUNT_AURA		= 14,
	ACHIEVEMENT			= 15,
	TITLE				= 16,
	QUEST_CATEGORY		= 17,
	MILITARY_RANK		= 18,
}

UI.LinkWnd.effectInfo =
{
	main =
	{
		animationIdle 			= "idle_1",
		animationSelect			= "over_1",
		animationPressed		= "over_1",
		animationDisabled		= "",
		animationIdle_focus 	= "",
		animationSelect_focus	= "",
		animationPressed_focus	= "",

		textLocator				= "text",
	},
}

UI.LinkWnd.LINK = true

-- -------------------------------------
-- vars
-- -------------------------------------

UI.LinkWnd.linkType			= -1
UI.LinkWnd.params			= {}
UI.LinkWnd.tooltipData		= nil
UI.LinkWnd.hFont			= FONT.INVALID_FONT_HANDLE
UI.LinkWnd.blendMode		= UI.BM_ALPHA
UI.LinkWnd.backColor		= 0
UI.LinkWnd.metaText			= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.LinkWnd:FullUpdate()

	self:UpdateTextColor()
	self:UpdateText()
	self:UpdateTooltip()
	self:RecalcLayout()

end


--
function UI.LinkWnd:F_PostLoad()	

	UI.EffectButtonWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.effectInfo = UI:CopyTable2( UI.LinkWnd.effectInfo )

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 	

end


--
function UI.LinkWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.LinkWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.LinkWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.LinkWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.LinkWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end  


--
function UI.LinkWnd:UpdateEffectAnimation()

	if UI:IsInRemovingAllWindows() then
		return
	end

	UI.EffectButtonWnd.UpdateEffectAnimation( self )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	self:UpdateTextColor()

end


--
function UI.LinkWnd:UpdateText()

	if self.hFont ~= FONT.INVALID_FONT_HANDLE then
		self:SetFont( self.hFont, self.layers.TEXT )
	end

	self:SetBlendMode( self.blendMode, self.layers.TEXT )
	self.metaText:SetBlendMode( self.blendMode )

	self.metaText:SetBackColor( self.backColor )

	local text = UI.LinkWnd:MakeText( self.linkType, self.params )

	-- формат текста будет произведен в RecalcLayout()
	self.metaText:SetText( text, false )

end


--
function UI.LinkWnd:UpdateTextColor()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then		
		return
	end

	local handle = self:GetUiHandle()

	local customColor = self:GetCustomColor()
	if customColor then

		mainEffect:UnlinkLayer( handle, self.layers.TEXT, "" )

		local alpha = UI:GetAlpha( self:GetColor( self.layers.TEXT ) )
		customColor = UI:SetAlpha( customColor, alpha )

		self:SetColor( customColor, self.layers.TEXT )
		self.metaText:SetColor( customColor )

	else
		mainEffect:LinkLayer( handle, self.layers.TEXT, self.effectInfo.main.textLocator, UI.EffectAnimParams.COLOR )
		mainEffect:Update( 0 )
		self.metaText:SetColor( self:GetColor( self.layers.TEXT ) )
	end

end


--
function UI.LinkWnd:GetCustomColor()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local bSelected = mainEffect and mainEffect:GetCurAnimation() ~= self.effectInfo.main.animationIdle

	local customColor = bSelected and self.params.colorSel or self.params.colorUnsel
	if not customColor then

		if ( self.linkType == self.linkTypes.ITEM or self.linkType == self.linkTypes.SHIP or self.linkType == self.linkTypes.RESOURCE ) and UI:IsStrEmpty( self.params.text ) then

			if self.params.autogenItem then
				local quality = UI:GetAutogenQualityForUpgradeLevel( self.params.autogenItem.upgradeLevel )
				customColor = UI:GetItemQualityColor( quality, false, false )
			else
				customColor = UI:GetItemColor( self.params.defName, bSelected )
			end

		elseif self.linkType == self.linkTypes.PLAYER then

			local quality = self.params.bPremium and UI.PREMIUM_QUALITY or 1		
			customColor = UI:GetItemQualityColor( quality, bSelected )

		elseif self.linkType == self.linkTypes.PRICE then

			customColor = self.params.baseColor

		elseif ( self.linkType == self.linkTypes.ACCOUNT_AURA ) then

			customColor = UI:GetItemQualityColor( UI.MK1_QUALITY, bSelected )

		elseif ( self.linkType == self.linkTypes.ACHIEVEMENT ) then

			customColor = UI:GetItemQualityColor( UI.MK1_QUALITY, bSelected )
			
		elseif ( self.linkType == self.linkTypes.TITLE ) then

			customColor = UI:GetItemQualityColor( UI.MK1_QUALITY, bSelected )

		end

	end

	return customColor

end


--
function UI.LinkWnd:UpdateTooltip()

	self.tooltipData = nil

	if self.linkType == self.linkTypes.ITEM then
	
		if self.params.autogenItem then
			UI:AddTempAutogenDef( self.params.autogenItem )
		end

		if UI:IsDefModule( self.params.defName ) or UI:IsDefAmmo( self.params.defName ) then

			if self.params.bShowTooltip then

        		self.tooltipData = {}

        		self.tooltipData.tooltipType = UI.tooltipTypes.MODULE

        		self.tooltipData.defName		= self.params.defName
        		self.tooltipData.iid			= self.params.iid
        		self.tooltipData.isSelected		= false
        		self.tooltipData.dstShipData	= nil
				self.tooltipData.bEnchanted		= self.params.bEnchanted
				self.tooltipData.autogenItem	= self.params.autogenItem

        		if self.params.iid ~= UI.INVALID_U64_ID then

        			local equippedShipItem = UI:GetEquippedShipItem( self.params.iid )
        			if equippedShipItem then

        				local equipSlotId = -1

        				for slotId, iid in pairs( equippedShipItem.equipModules ) do
        					if iid == self.params.iid then
        						equipSlotId = slotId
        						break
        					end
        				end

        				self.tooltipData.dstShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( equippedShipItem.vid, equipSlotId )

        			end

        		end

			end
			
		else
			self.tooltipData = UI:GetTooltipForItem( self.params.defName )
		end

	elseif self.linkType == self.linkTypes.SHIP then

		self.tooltipData = {}

		self.tooltipData.tooltipType		= UI.tooltipTypes.SHIP
		self.tooltipData.defName			= self.params.defName
		self.tooltipData.vid				= self.params.vid

	elseif self.linkType == self.linkTypes.HTTP then

		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_SMALL
		self.tooltipData.text			= UI:ShieldSpecSymbols( self.params.href )

	elseif self.linkType == self.linkTypes.ITEM_SUBTYPE then

		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:ItemSubType2Str2( self.params.itemSubType )
		self.tooltipData.text			= UI:GetItemSubTypeDesc( self.params.itemSubType )

	elseif self.linkType == self.linkTypes.PLAYER then

		if self.params.bWithTooltip then
			self.tooltipData = UI:GetPlayerTooltip( self.params.uid )
		end

	elseif self.linkType == self.linkTypes.CUSTOM_TEXT or self.linkType == self.linkTypes.CUSTOM_ICO or self.linkType == self.linkTypes.CUSTOM_EFFECT then

		if self.params.tooltipData then

    		self.tooltipData = self.params.tooltipData

		elseif self.params.fnGetTooltipData then

			local fn = _G[ self.params.fnGetTooltipData ]
			if fn then
				self.tooltipData = fn( self )
			else
				sys.log( "UI.LinkWnd:UpdateTooltip()[ERROR]: cannot find function \"%s()\"", self.params.fnGetTooltipData )
			end

		elseif self.params.tooltipText or self.params.tooltipTextId then			

			self.tooltipData = {}

			self.tooltipData.text = self.params.tooltipText or UI:GetStringByName( self.params.tooltipTextId )

			if self.params.tooltipCaption or self.params.tooltipCaptionId then
				self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
				self.tooltipData.caption		= self.params.tooltipCaption or UI:GetStringByName( self.params.tooltipCaptionId )
			else
				self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_SMALL
			end

		end

	elseif self.linkType == self.linkTypes.PRICE then

		if self.params.priceInfo.priceType == UI.exPriceTypes.SHIP_PARTS then

    		self.tooltipData = UI:GetTooltipForItem( self.params.priceInfo.defName )

		elseif self.params.priceInfo.priceType == UI.exPriceTypes.SPEC_MODULE_PARTS then

    		self.tooltipData = {}
			self.tooltipData.tooltipType	= UI.tooltipTypes.SPEC_MODULE_PARTS
			self.tooltipData.shipDefName	= self.params.priceInfo.shipDefName

		else

    		self.tooltipData = {}
    		self.tooltipData.tooltipType	= UI.tooltipTypes.PRICE
    		self.tooltipData.priceInfo		= self.params.priceInfo
    		self.tooltipData.playerMoney	= self.params.playerMoney

		end

	elseif self.linkType == self.linkTypes.RESOURCE then

		self.tooltipData = UI:GetTooltipForItem( self.params.defName )

	elseif self.linkType == self.linkTypes.ROLES then

		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:GetStringByName( "shipQuest_recommendedRoles_tooltipCaption" )

		local text = ""

    	for idx = 1, #self.params.roles do

    		local role = self.params.roles[ idx ]
			local strRole = UI:Role2Str( role )

			text = string.format( "%s%s%s", text, text ~= "" and "|" or "", strRole )

		end

		self.tooltipData.text = text

	elseif self.linkType == self.linkTypes.SPEC_MODULE_PARTS then

		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.SPEC_MODULE_PARTS
		self.tooltipData.shipDefName	= self.params.shipDefName

	elseif self.linkType == self.linkTypes.ACCOUNT_AURA then

		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:AccountAura2Str( self.params.defName )
		self.tooltipData.text			= UI:GetAccountAuraDesc( self.params.defName )

	elseif self.linkType == self.linkTypes.ACHIEVEMENT then

		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:Achievement2Str( self.params.id, self.params.rank )
		self.tooltipData.text			= UI:GetAchievementConditionStr( self.params.id, self.params.rank )
		
	elseif self.linkType == self.linkTypes.TITLE then

		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:Title2Str( self.params.id )
		self.tooltipData.text			= UI:GetTitleDesc( self.params.id )
		
	elseif self.linkType == self.linkTypes.QUEST_CATEGORY then
		
		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_SMALL
		self.tooltipData.text			= UI:GetStringByName( "tooltip_openQuests" )
		
	elseif self.linkType == self.linkTypes.MILITARY_RANK then
		
		self.tooltipData = {}

		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:GetStringByName( "militaryRank_tooltip_caption" )
		
		-- описание
		local text = UI:GetStringByName( "military_rank_desc" )
		
		if self.params.militaryRank < UI:GetMilitaryRankMax() then
		
			-- следующий ранг
			local strNextRankName = string.format( "%s: %s", UI:GetStringByName( "militaryRank_tooltip_next" ), UI:MilitaryRank2Str( self.params.militaryRank + 1 ) )
			text = string.format( "%s||%s", text, strNextRankName )
			
			-- награды за получение следующего ранга
			local strRewardsList = ""
			if type( _G.MilitarySettings ) == "table" and type( _G.MilitarySettings.militaryRankUpReward ) == "table" then
			
				local rankRewards = _G.MilitarySettings.militaryRankUpReward[ self.params.militaryRank + 1 ]
				if type( rankRewards ) == "table" then
				
					for rewardIdx, rewardInfo in ipairs( rankRewards ) do
						local strReward = UI:Reward2Str( rewardInfo, UI.TooltipWnd_shared:GetTextColor() )
						strRewardsList = string.format( "%s%s%s", strRewardsList, strRewardsList ~= "" and ", " or "", strReward )
					end
				
				else
					sys.log( "UI.LinkWnd:UpdateTooltip()[ERROR]: invalid type of '_G.MilitarySettings.militaryRankUpReward[%d]'; 'table' expected, got '%s'", self.params.militaryRank + 1, type( rankRewards ) )
				end
			
			else
				sys.log( "UI.LinkWnd:UpdateTooltip()[ERROR]: cannot find table '_G.MilitarySettings.militaryRankUpReward'" )
			end
			
			if strRewardsList ~= "" then
				local strRewards = string.format( "%s: %s", UI:GetStringByName( "militaryRank_tooltip_reward" ), strRewardsList )
				text = string.format( "%s|%s", text, strRewards )
			end
			
			-- сколько есть/надо опыта для следующего ранга
			local needExp = _G.MasterServer_GetMilitaryExpForNextMilitaryRank( self.params.militaryRank ) or 0
			local strExp = string.format( "%s: %s/%s", UI:GetStringByName( "militaryRank_tooltip_exp" ), UI:Num2StrSeparatedBy3( self.params.militaryExp ), UI:Num2StrSeparatedBy3( needExp ) )
			text = string.format( "%s||%s", text, strExp )
			
		end
		
		self.tooltipData.text = text

	else
		sys.log( "UI.LinkWnd:UpdateTooltip()[ERROR]: unhandled linkType: %s", tostring( self.linkType ) )		
	end

	-- апдейт окна тултипа, который уже на экране

	local curTooltipWnd = UI:GetCurTooltip()	
	if curTooltipWnd and curTooltipWnd:IsOnScreen() and UI:GetCurTooltipTarget() == self then
		curTooltipWnd:Setup( self.tooltipData )
	end

end


--
function UI.LinkWnd:RecalcLayout()

	local formatRect = UI:Quat( 0, 0, 10000, self:GetLayerHeight( self.layers.TEXT ) )
	self.metaText:SetFormatParams( self:GetFont( self.layers.TEXT ), self:GetTextFormatFlags( self.layers.TEXT ), UI:Vec2( formatRect.z, formatRect.w ), true )

	local textSize = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		self:GetFont( self.layers.TEXT ),
   		formatRect,
   		self:GetTextFormatFlags( self.layers.TEXT ),
   		formatRect )

	self:SetWidth( textSize.z )
	self:SetHeight( textSize.w )

end


--
function UI.LinkWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.linkType == self.linkTypes.HTTP then

		if self.params.bSteam == true then

    		if UI.serverData.playerCredentials.localSteamID ~= UI.INVALID_U64_ID then
    			_G.Steam_NavigateToURL( self.params.href )
    		else
    			_G.ShellExecute( self.params.href )
    		end

		else
			_G.ShellExecute( self.params.href )
		end

	elseif self.linkType == self.linkTypes.ITEM or self.linkType == self.linkTypes.RESOURCE then
	
		if self.params.autogenItem then
			UI:AddTempAutogenDef( self.params.autogenItem )
		end

		if self.params.bOpenShop then
			
			UI:ShowProfile( UI:GetLocalPlayerUid(), "ATLAS", true, nil, nil )
			UI.Profile_AtlasWnd:ShowItem( self.params.defName, true )

		elseif self.params.bOpenStore then

			if UI.HangarWnd then
				UI.HangarWnd:OpenStoreForItem( self.params.defName )
			else
				sys.log( "UI.LinkWnd:F_OnMouseLButtonDown()[ERROR]: cannot find UI.HangarWnd" )
			end
			
		elseif self.params.bOpenItemCraftMulty then
			
			if UI:IsDefBlueprint( self.params.defName ) then
				UI.HangarWnd:OpenItemCraftMultiForBlueprint( self.params.defName )
			else
				sys.log( "UI.LinkWnd:F_OnMouseLButtonDown()[ERROR]: canot show item craft wnd for \"%s\"; a blueprint expected", self.params.defName )
			end

		end

	elseif self.linkType == self.linkTypes.ITEM_SUBTYPE then

		if self.params.bOpenShop then
		
			UI:ShowProfile( UI:GetLocalPlayerUid(), "ATLAS", true, nil, nil )
			UI.Profile_AtlasWnd:ShowItemSubType( self.params.itemSubType, true )
			
		end

	elseif self.linkType == self.linkTypes.CUSTOM_TEXT or self.linkType == self.linkTypes.CUSTOM_ICO or self.linkType == self.linkTypes.CUSTOM_EFFECT then

		if not UI:IsStrEmpty( self.params.handler ) then

			local fn = _G[ self.params.handler ]
			if fn then
				fn( self )
			else
				sys.log( "UI.LinkWnd:F_OnMouseLButtonDown()[ERROR]: cannot find function \"%s()\"", self.params.handler )
			end

		end
		
	elseif self.linkType == self.linkTypes.QUEST_CATEGORY then
		
		UI.HangarWnd:ShowQuestCategory( self.params.category )
		
	elseif self.linkType == self.linkTypes.ACHIEVEMENT then
	
		UI.HangarWnd:ShowAchievement( self.params.id, self.params.rank )
		
	elseif self.linkType == self.linkTypes.TITLE then
		
		UI.HangarWnd:ShowTitle( self.params.id )
		
	end

	return false

end


--
function UI.LinkWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.linkType == self.linkTypes.PLAYER then

		UI.ContextMenu:Clear()

		local nickName = UI:MakePlayerNameByUid( self.params.uid, false, false, false )
		UI.ContextMenu:SetName( nickName )		

		-- TODO: какие здесь должны быть еще пункты?
		UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON, self.params.uid, nil )		

		UI.ContextMenu:Show( mouseX, mouseY )

	end

	return false

end