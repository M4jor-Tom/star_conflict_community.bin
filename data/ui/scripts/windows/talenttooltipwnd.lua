-- ----------------------------------------------------------------------------
--
-- Workfile: talenttooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------
-- UI.TalentTooltipWnd
-- -----------------------------------------------------------------------

UI.TalentTooltipWnd = {}
local tt = UI.TalentTooltipWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.TalentTooltipWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "TalentTooltipWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
						layer		= "UI.TalentTooltipWnd.layers.WORK_EFFECT",
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
						layer		= "UI.TalentTooltipWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции, цвету и размеру
					{
						objName		= "type_descript",
						layer		= "UI.TalentTooltipWnd.layers.MAIN_INFO",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.TalentTooltipWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_main",
				defaultAnimation	= "active",

				links =
				{
					{
						objName		= "prod_icon",	
						layer		= "UI.TalentTooltipWnd.layers.ICO_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_ico",
				defaultAnimation	= "inactive",

				links =
				{
					{
						objName		= "buff_icon",	
						layer		= "UI.TalentTooltipWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "spellIco",
				defaultAnimation	= "color",
			}}
		},

		-- ITEM_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MAIN_INFO
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
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
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.TalentTooltipWnd:Setup( _data )

	self:Reset()

	if type( _data ) ~= "table" then
		sys.log( "UI.TalentTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end

	local data = UI:CopyTable2( _data )

	if type( data.talent ) ~= "string" then
		sys.log( "UI.TalentTooltipWnd:Setup()[ERROR]: invalid type of \"data.talent\"; \"string\" expected, got \"%s\"", type( data.talent ) )
		return
	end

	self.talent = data.talent

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, _data )
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

tt.layers =
{
    MAIN_EFFECT			= 0,
    WORK_EFFECT			= 1,
    ICO_MAIN_EFFECT		= 2, 
    ICO_BG_EFFECT		= 3, 
    ICO_EFFECT			= 4, 
    ITEM_NAME			= 5,
    MAIN_INFO			= 6,
    DESC				= 7,
    SEPARATOR_1_EFFECT	= 8, 
    SEPARATOR_2_EFFECT	= 9,
	COLORS_EFFECT		= 10,
}

tt.effectInfo =
{
	work =
	{
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
		itemIcoLocator		= "icon",
		mainInfoLocator		= "type_descript",
		descLocator			= "description",
		sepLocatorPrefix	= "spacer_",
		itemNameLocator		= "title",
	},

	colors =
	{
		repFitLocator			= "type_requirements_reputation_true",
		repUnfitLocator			= "type_requirements_reputation_falce",
	}
}

tt.MAX_SEPARATORS	= 2

-- -----------------------------------
-- vars
-- -----------------------------------

tt.talent					= ""

tt.mainInfoMetaText			= nil

tt.space_itemName_sep		= 0
tt.space_sep_itemIcoTop		= 0
tt.space_sep_mainInfoTop	= 0
tt.space_mainInfoBtm_sep	= 0
tt.space_sep_descTop		= 0
tt.space_descBtm_sep		= 0
tt.workMinHeight			= 0
tt.workMaxHeight			= 0
tt.icoHeight				= 0

tt.color_repFit				= UI.WHITE_COLOR
tt.color_repUnfit			= UI.WHITE_COLOR
tt.color_descSubst			= UI.TEXT_SEL_COLOR

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.TalentTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainInfoMetaText = UI.MetaText.GetNewInstance()
	self.mainInfoMetaText:InitFromLayer( self, self.layers.MAIN_INFO ) 

	self:PrepareLayoutParams()

	self:Reset()		

end


--
function UI.TalentTooltipWnd:F_Shutdown()

	if self.mainInfoMetaText then
		self.mainInfoMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.TalentTooltipWnd:PrepareLayoutParams()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local icoMainEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )

	local workEffectPos		= workEffect:GetPos()
	local itemNamePos		= workEffect:GetObjPos( self.effectInfo.work.itemNameLocator )
	local itemNameSize		= workEffect:GetObjSize( self.effectInfo.work.itemNameLocator )
	local itemIcoPos		= workEffect:GetObjPos( self.effectInfo.work.itemIcoLocator )
	local itemIcoSize		= icoMainEffect and icoMainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local mainInfoPos		= workEffect:GetObjPos( self.effectInfo.work.mainInfoLocator )
	local mainInfoSize		= workEffect:GetObjSize( self.effectInfo.work.mainInfoLocator )
	local descPos			= workEffect:GetObjPos( self.effectInfo.work.descLocator )
	local descSize			= workEffect:GetObjSize( self.effectInfo.work.descLocator )

    self.workMinHeight		= workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ).y
    self.workMaxHeight		= workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ).y

	local NUM_SEPS_IN_EFFECT = 4
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPS_IN_EFFECT do
		local sepPos = workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end

	self.space_itemName_sep		= sepsPoss[ 1 ].y - ( itemNamePos.y + itemNameSize.y )
	self.space_sep_itemIcoTop	= itemIcoPos.y - sepsPoss[ 1 ].y
	self.space_sep_mainInfoTop	= mainInfoPos.y - sepsPoss[ 1 ].y
    self.space_mainInfoBtm_sep	= self.space_sep_itemIcoTop
    self.space_sep_descTop		= descPos.y - sepsPoss[ 3 ].y
    self.space_descBtm_sep		= sepsPoss[ 4 ].y - ( descPos.y + descSize.y )
	self.icoHeight				= itemIcoSize.y

	local colorsEffect = UI:GetEffectFromLayer( self, self.layers.COLORS_EFFECT )
	if colorsEffect then

        self.color_repFit			= colorsEffect:GetObjColor( self.effectInfo.colors.repFitLocator )
        self.color_repUnfit			= colorsEffect:GetObjColor( self.effectInfo.colors.repUnfitLocator )

	end

	self:SetLayerWidth( itemNameSize.x, self.layers.ITEM_NAME )
	self:SetLayerLeft( mainInfoPos.x, self.layers.MAIN_INFO )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC )

	self.mainInfoMetaText:SetFormatRectSize( UI:Vec2( mainInfoSize.x, 1000000 ), false )	

	local sepPos = UI:Vec2( sepsPoss[ 1 ].x, 0 )
	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:SetPos( sepPos )
		end
	end

	if icoMainEffect then	
		icoMainEffect:SetPos( UI:Vec2( itemIcoPos.x, 0 ) )
	end

	local selfWidth = workEffect:GetObjSize( "self" ).x
	self:SetWidth( selfWidth )	

end


--
function UI.TalentTooltipWnd:Reset()

    self.talent = ""

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetText( "", self.layers.MAIN_INFO )
	self:SetLayerVisible( false, self.layers.DESC )

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	self:ResetIco()

end


--
function UI.TalentTooltipWnd:ResetIco()

	self:SetLayerVisible( false, self.layers.ICO_MAIN_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_EFFECT )

	UI:ResetItemIco( self, self.layers.ICO_EFFECT )

end


--
function UI.TalentTooltipWnd:FullUpdate()

	self:UpdateItemName()
	self:UpdateItemIco()
	self:UpdateMainInfo()
	self:UpdateDesc()

	self:RecalcLayout()

end


--
function UI.TalentTooltipWnd:UpdateItemName()

	local name = UI:Talent2Str( self.talent )
	self:SetText( name, self.layers.ITEM_NAME )

end


--
function UI.TalentTooltipWnd:UpdateItemIco()

	self:SetLayerVisible( true, self.layers.ICO_MAIN_EFFECT )
	self:SetLayerVisible( true, self.layers.ICO_BG_EFFECT )
	self:SetLayerVisible( true, self.layers.ICO_EFFECT )

	local hTex = UI:GetTalentIco( self.talent )
	UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

end


--
function UI.TalentTooltipWnd:UpdateMainInfo()

	-- требования к репутации

	local talentRank = UI:GetTalentRank( self.talent )
	local playerShipsRank = UI:GetShipsMaxRank()

	local bEnoughRep = talentRank <= playerShipsRank

	local repColor = bEnoughRep and self.color_repFit or self.color_repUnfit
	local strRepColor = UI:Color2Str( repColor )

	local str = UI:GetStringByName( "shipsRankRequired" )

	local strRank = string.format( "[%d]", talentRank )
	str = string.gsub( str, "%$rank%$", strRank )

	str = string.format( "%s%s", strRepColor, str )	

	self.mainInfoMetaText:SetText( str, true )

end


--
function UI.TalentTooltipWnd:UpdateDesc()

	local desc = UI:GetTalentDesc( self.talent, self.color_descSubst, self:GetColor( self.layers.DESC ) )

	self:SetLayerVisible( true, self.layers.DESC )
	self:SetText( desc, self.layers.DESC )

end


--
function UI.TalentTooltipWnd:RecalcLayout()

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


	-- иконка (позиция) и main_info (размер, позиция)

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1

	-- иконка

	local itemIcoY0 = lastBlockY1 + self.space_sep_itemIcoTop

	local icoMainEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )
	if icoMainEffect then
		local icoPos = icoMainEffect:GetPos()
		icoMainEffect:SetPos( UI:Vec2( icoPos.x, itemIcoY0 ) )
	end

	-- main_info

	local mainInfoText = self.mainInfoMetaText:GetFormattedText()
	local mainInfoFormatParams = self.mainInfoMetaText:GetFormatParams()
	local mainInfoformatRect = UI:Quat( 0, 0, mainInfoFormatParams.formatRectSize.x, mainInfoFormatParams.formatRectSize.y )

    local mainInfoHeight = _G.MeasureText(
   		mainInfoText,
   		mainInfoFormatParams.hFont,
    	mainInfoformatRect,
   		mainInfoFormatParams.formatFlags,
    	mainInfoformatRect ).w

	local mainInfoY0 = lastBlockY1 + self.space_sep_mainInfoTop
	self:SetLayerTop( mainInfoY0, self.layers.MAIN_INFO )

	lastBlockY1 = math.max( mainInfoY0 + mainInfoHeight, itemIcoY0 + self.icoHeight ) + self.space_mainInfoBtm_sep


	-- описание (размер, позиция)

	if self:IsLayerVisible( self.layers.DESC ) then

		self:ShowSeparator( nextSepIdx, lastBlockY1 )		
		nextSepIdx = nextSepIdx + 1

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

		lastBlockY1 = descY0 + descHeight + self.space_descBtm_sep

	end 


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
function UI.TalentTooltipWnd:ShowSeparator( sepIdx, y )

	if sepIdx > self.MAX_SEPARATORS then
		sys.log( "UI.TalentTooltipWnd:ShowSeparator()[ERROR]: cannot show separator %d; max separators is %d", sepIdx, self.MAX_SEPARATORS )
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
function UI.TalentTooltipWnd:UpdateEffects()

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

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_MAIN_EFFECT )
	if icoEffect then
		icoEffect:Update( 0 )
	end

	self.mainInfoMetaText:UpdateScreenOrgFromLayer( self, self.layers.MAIN_INFO )

end


--
function UI.TalentTooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MAIN_INFO then
		self.mainInfoMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.TalentTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.TalentTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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

UI.TalentTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "TalentTooltipWnd",

    	props =
    	{
    		name		= "TalentTooltipWnd_shared",
    	},	
	}
}