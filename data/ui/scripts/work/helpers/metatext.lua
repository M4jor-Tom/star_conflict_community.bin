-- ----------------------------------------------------------------------------
--
-- Workfile: UI.MetaText.lua
-- Copyright й 2009, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: metatext.lua 2826 2011-05-12 12:10:13Z $
-- ----------------------------------------------------------------------------

-- TODO: при вставке прямого локализованного текста - особо хэндлить символы $


local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.MetaText = {}
local mt = UI.MetaText

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.MetaText.GetNewInstance()

	local newInst = UI:CopyTable2( UI.MetaText )

	return newInst

end


--
function UI.MetaText:SetText( text, bDoFormat )

	self.text_original = text

	if bDoFormat then
		self:Format()
	end

end


--
function UI.MetaText:SetFormatParams( hFont, formatFlags, formatRectSize, bDoFormat )

	local fp = self.formatParams

	fp.hFont 		= hFont
	fp.formatFlags	= formatFlags
	UI:Vec2CopyInplace( formatRectSize, fp.formatRectSize )

	if bDoFormat then
		self:Format()
	end

end


--
function UI.MetaText:SetFont( hFont, bDoFormat )

	self.formatParams.hFont = hFont

	if bDoFormat then
		self:Format()
	end

end


--
function UI.MetaText:SetFormatFlags( formatFlags, bDoFormat )

	self.formatParams.formatFlags = formatFlags

	if bDoFormat then
		self:Format()
	end

end


--
function UI.MetaText:GetFormatParams()

	return self.formatParams

end


--
function UI.MetaText:SetFormatRectSize( formatRectSize, bDoFormat )

	UI:Vec2CopyInplace( formatRectSize, self.formatParams.formatRectSize )

	if bDoFormat then
		self:Format()
	end

end


--
function UI.MetaText:SetParentWindow( wnd, layer )

	self.parentWnd		= wnd
	self.parentLayer	= layer or -1	

end


--
function UI.MetaText:InitFromLayer( wnd, layer )

	self.parentWnd		= wnd
	self.parentLayer	= layer	

	self:SetFormatParams(
		wnd:GetFont( layer ),
		wnd:GetTextFormatFlags( layer ),
		UI:Vec2( wnd:GetLayerWidth( layer ), wnd:GetLayerHeight( layer ) ),
		false )

	self:SetColor( wnd:GetColor( layer ) )

	local layerObj = wnd:GetLayer( UI.LAYER_INVALID, layer, 0 )
	if layerObj then
    	local layerType = layerObj:GetLayerType()
    	if layerType == UI.LAYER_TEXT or layerType == UI.LAYER_ETEXT then
    		self:SetBackColor( layerObj:GetBackColor() )
    	end
	end

	self:SetBlendMode( wnd:GetBlendMode( layer ) )

	self:SetText( wnd:GetText( layer ), true )

end


--
function UI.MetaText:SetScreenOrg( screenOrg )

	if screenOrg then

    	if self.screenOrg then
    		self.screenOrg.x = screenOrg.x
    		self.screenOrg.y = screenOrg.y
    	else
    		self.screenOrg = Vec2( screenOrg.x, screenOrg.y )
    	end

	else
		self.screenOrg = nil
	end

	self:UpdateEffectsPos()
	self:UpdateWindowsPos()

end  


--
function UI.MetaText:GetScreenOrg()

	local screenOrg = self.screenOrg

	if not screenOrg then

		if self.parentWnd then
			
        	local x, y, z, w = _G.UI_Wnd_GetLayerRect( self.parentWnd.w, self.parentLayer, 0 )
        	screenOrg = UI:Vec2( self.parentWnd:XToScreen( x ), self.parentWnd:YToScreen( y ) )

		else
			screenOrg = UI:ZeroVec2()
		end	

	end

	return screenOrg

end



--
function UI.MetaText:UpdateScreenOrgFromLayer( wnd, layer )

	if wnd == self.parentWnd and layer == self.parentLayer then
		self:SetScreenOrg( nil )
		return
	end

	local x, y, z, w = _G.UI_Wnd_GetLayerRect( wnd.w, layer, 0 )
	x = wnd:XToScreen( x )
	y = wnd:YToScreen( y )

	self:SetScreenOrg( UI:Vec2( x, y ) )

end


--
function UI.MetaText:SetColor( color )

	if color == self.color then
		return
	end

	local oldColor = self.color
	self.color = color

	if UI:SetAlpha( color, UI:GetAlpha( oldColor ) ) == oldColor then
		self:UpdateAlpha()		
	else
		self:Format()
	end

end


--
function UI.MetaText:GetColor()

	return self.color

end


--
function UI.MetaText:SetBackColor( color )

	self.backColor = color

end


--
function UI.MetaText:GetBackColor()

	return self.backColor

end


--
function UI.MetaText:SetAlpha( alpha )

	local color = UI:SetAlpha( self.color, alpha )
	if color == self.color then
		return
	end

	self.color = color
	self:UpdateAlpha()

end


--
function UI.MetaText:SetBlendMode( blendMode )

	self.blendMode = blendMode

end


--
function UI.MetaText:GetBlendMode()

	return self.blendMode

end  


--
function UI.MetaText:Format()

	self:ResetFormat()

	if self.text_original == "" then
		return
	end

	self.text_formatted = self.text_original

	local searchStartByteIdx 	= 1
	local patternFirstByteIdx	= -1

	while true do

		local specFirstByteIdx, specLastByteIdx, escapeSymbols = string.find( self.text_formatted, "(#-)%$", searchStartByteIdx )	-- знак '#' выступает в качестве эскейп-символа

		-- спец.символ '$' не найден
		if specFirstByteIdx == nil then
			break

		-- спец.символ '$' найден и не заэкранирован эскейп-символом '#'
		elseif math.fmod( string.len( escapeSymbols ), 2 ) == 0 then	-- эскейп-символов может быть несколько подряд (например ####$); если их четное число, то они экранируют друг друга, и на '$' не влияют 

			-- начало паттерна
			if patternFirstByteIdx == -1 then

				patternFirstByteIdx = specLastByteIdx
				searchStartByteIdx = specLastByteIdx + 1

			-- конец паттерна
			else

				local patternLastByteIdx = specLastByteIdx

				local patternFirstSymbolIdx	= _G.Utf8ByteOffsetToCharIdx( self.text_formatted, patternFirstByteIdx - 1 ) + 1
				local patternLastSymbolIdx	= _G.Utf8ByteOffsetToCharIdx( self.text_formatted, patternLastByteIdx - 1 ) + 1		

				if patternLastByteIdx - patternFirstByteIdx > 1 then

					local itemString = string.sub( self.text_formatted, patternFirstByteIdx + 1, patternLastByteIdx - 1 )	-- строка паттерна без символов '$'

            		local item = self:CreateItemFromString( itemString )
            		if item then

						-- вставка текста-заглушки на место паттерна

            			self:MeasureItem( item )

						local paddingText = self:MakePaddingTextForItem( item )
            			local numPaddingSymbols = _G.Utf8StrLen( paddingText )

						local strHead = UI:Substr( self.text_formatted, 1, patternFirstSymbolIdx - 1 )
						local strTail = UI:Substr( self.text_formatted, patternLastSymbolIdx + 1, -1 )

						self.text_formatted = string.format( "%s%s%s", strHead, paddingText, strTail )

						-- 

						patternLastSymbolIdx = patternFirstSymbolIdx + numPaddingSymbols - 1

            			item.firstIdx			= patternFirstSymbolIdx
            			item.lastIdx			= patternLastSymbolIdx
            			item.itemString			= itemString
            			item.numPaddingSymbols	= numPaddingSymbols

            			table.insert( self.items, item )

					else
						sys.log( "UI.MetaText:Format()[ERROR]: cannot create item from string \"%s\"", itemString )
            		end		

				else
					sys.log( "UI.MetaText:Format()[ERROR]: empty pattern in string \"%s\"", self.text_original )
				end

				searchStartByteIdx = _G.Utf8CharIdxToByteOffset( self.text_formatted, ( patternLastSymbolIdx - 1 ) + 1 ) + 1
				patternFirstByteIdx	= -1

			end

		-- спец.символ '$' найден, но заэкранирован эскейп-символом '#', поэтому он игнорируется
		else
			searchStartByteIdx = specLastByteIdx + 1
		end		

	end

	local try = 1  
	local bSuccess = true

	while try <= 50 do

		bSuccess = true

    	for itemIdx = 1, #self.items do
			if not self:LayoutItems( itemIdx ) then
				bSuccess = false
				break
			end
    	end

		if bSuccess then
			break
		end

    	try = try + 1

	end	

	self:UpdateEffectsPos()
	self:UpdateWindowsPos()

end


--
function UI.MetaText:Update( dt )

	for idx, item in pairs( self.items ) do
		if item.itemType == self.itemTypes.EFFECT then
			if item.effect then
				item.effect:Update( dt )
			end
		end
	end

end


local l_drawRect = Quat( 0, 0, 0, 0 )

--
function UI.MetaText:Draw( clip_x, clip_y, clip_width, clip_height, bTextPickerTransparent )

	if self.text_formatted == "" then
		return
	end

	if bTextPickerTransparent == nil then
		bTextPickerTransparent = false
	end

	local screenOrg = self:GetScreenOrg()

	l_drawRect.x, l_drawRect.y, l_drawRect.z, l_drawRect.w = screenOrg.x, screenOrg.y, self.formatParams.formatRectSize.x, self.formatParams.formatRectSize.y

	UI.drawer:EndUiDrawing()

	if self.blendMode ~= UI.BM_ALPHA then
		_G.SetTextBlendMode( self.blendMode )
	end

	-- main text
	
	local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
	_G.SetTextPixelSnapping( self.bPixelSnap, self.bPixelSnap )

	_G.UI_DrawText(
     	self.text_formatted,
     	self.formatParams.hFont,
     	l_drawRect,
     	self.color,
		self.backColor,
     	self.formatParams.formatFlags,
		UI:Quat( clip_x, clip_y, clip_width, clip_height ),
		bTextPickerTransparent
	)

	-- text items

	for itemIdx, item in pairs( self.items ) do

		if item.itemType == self.itemTypes.TEXT then

        	_G.UI_DrawText(
             	item.text,
             	item.hFont ~= FONT.INVALID_FONT_HANDLE and item.hFont or self.formatParams.hFont,
           		UI:Quat( item.rect.x + screenOrg.x, item.rect.y + screenOrg.y, item.rect.z, item.rect.w ),
             	item.color ~= 0 and item.color or self.color,
				item.backColor ~= 0 and item.backColor or self.backColor,
             	FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
        		UI:Quat( clip_x, clip_y, clip_width, clip_height ),
				bTextPickerTransparent
        	)

		end

	end
	
	_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )

	if self.blendMode ~= UI.BM_ALPHA then
		_G.SetTextBlendMode( UI.BM_ALPHA )
	end


	-- effect items

	for itemIdx, item in pairs( self.items ) do

		if item.itemType == self.itemTypes.EFFECT then
			if item.effect then
				item.effect:Render( bTextPickerTransparent )
			end			
		end		

	end	


	UI.drawer:BeginUiDrawing()


	-- texture items

	if self.blendMode ~= UI.BM_ALPHA then
		UI.drawer:SetBlendMode( self.blendMode )
	end

	for itemIdx, item in pairs( self.items ) do

		if item.itemType == self.itemTypes.ICO then
		
			local x = item.rect.x + screenOrg.x
			local y = item.rect.y + screenOrg.y
			
			if self.bPixelSnap then
				x = UI:XRel2Snapped( x )
				y = UI:YRel2Snapped( y )
			end

    		UI.drawer:DrawImagedRect(
           		x, y, item.rect.z, item.rect.w,
				0, 0, 1024, 768,
        		item.hTex,
           		item.color ~= 0 and item.color or self.color,
           		0, 0, 1, 1,
				bTextPickerTransparent
    		)

		end

	end

	if self.blendMode ~= UI.BM_ALPHA then
		UI.drawer:SetBlendMode( UI.BM_ALPHA )
	end

end


--
function UI.MetaText:Clear()

	self.text_formatted	= ""
	self.text_original	= ""
	self.parentWnd		= nil
	self.parentLayer	= -1

	self:ResetItems()

end


--
function UI.MetaText:GetFormattedText()

	return self.text_formatted

end


--
function UI.MetaText:GetOriginalText()

	return self.text_original

end


--
function UI.MetaText:GetFormatRectSize()

	return self.formatParams.formatRectSize

end


--
function UI.MetaText:CopyFormat( srcMetaText )

	-- TODO
	sys.log( "UI.MetaText:CopyFormat()[ERROR]: unimplemented" ) 

end


--
function UI.MetaText:SetPixelSnap( bSnap )

	self.bPixelSnap = bSnap
	
	self:UpdateEffectsPos()
	self:UpdateWindowsPos()

end


--
function UI.MetaText:GetPixelSnap( bSnap )

	return self.bPixelSnap
	
end


-- ---------------------------------------
-- const
-- ---------------------------------------

mt.itemTypes =
{
	ICO		= 1,
	TEXT	= 2,
	EFFECT	= 3,
	WND		= 4,
}

mt.itemPatterns =
{
	KEY_SIMPLE		= "^(KEY_[%w_]+)$",
	KEY				= "^key%s+(.-)$",
	TEXTURE			= "^texture%s+(.-)$",
	TEXT			= "^text%s+(.-)$",
	EFFECT			= "^effect%s+(.-)$",
	WND				= "^wndk%s+(.-)$",
	LINK			= "^link%s+(.-)$",
	CREDITS			= "^credits$",
	GOLD			= "^gold$",
	TOKENS			= "^tokens$",
	CREDITS_BIG		= "^credits_big$",
	GOLD_BIG		= "^gold_big$",
	TOKENS_BIG		= "^tokens_big$",
	SYNERGY_SHIP	= "^synergy_ship$",
	SYNERGY_FREE	= "^synergy_free$",
	IRIDIUM			= "^iridium$",
	CLAN_IRIDIUM	= "^clan_iridium$",
	EVENT_CREDITS	= "^event_credits$",
}

mt.paramPattern = "%[([%w_]+)%s+(.-)%]"		-- TODO: если параметр - локализованный текст, и в нем используются [], то все скривеет

mt.paddingSymbol = "i"
mt.paddingText = string.rep( mt.paddingSymbol, 256 )

mt.inputType2Str =
{
	[ UI.inputTypes.KB ]		= "kb",
	[ UI.inputTypes.XINPUT ]	= "xinput",
	[ UI.inputTypes.PS3 ]		= "ps3",
	[ UI.inputTypes.JOY ]		= "kb",
	[ UI.inputTypes.MOVE ]		= "move",
}

mt.pattern2ItemType =
{
	KEY				= mt.itemTypes.ICO,
	KEY_EX			= mt.itemTypes.ICO,
	TEXTURE			= mt.itemTypes.ICO,
	TEXT			= mt.itemTypes.TEXT,
	EFFECT			= mt.itemTypes.EFFECT,
	CREDITS			= mt.itemTypes.ICO,
	GOLD			= mt.itemTypes.ICO,
	TOKENS			= mt.itemTypes.ICO,
	CREDITS_BIG		= mt.itemTypes.EFFECT,
	GOLD_BIG		= mt.itemTypes.EFFECT,
	TOKENS_BIG		= mt.itemTypes.EFFECT,
	WND				= mt.itemTypes.WND,
	LINK			= mt.itemTypes.WND,
	SYNERGY_SHIP	= mt.itemTypes.EFFECT,
	SYNERGY_FREE	= mt.itemTypes.EFFECT,
	IRIDIUM			= mt.itemTypes.EFFECT,
	CLAN_IRIDIUM	= mt.itemTypes.EFFECT,
	EVENT_CREDITS	= mt.itemTypes.EFFECT,
}

mt.itemVAlignments =
{
	TOP				= 1,
	BOTTOM			= 2,
	CENTER			= 3,
	BASELINE		= 4,
	CUSTOM_OFFSET	= 5,
}

mt.itemHAlignments =
{
	LEFT			= 1,
	RIGHT			= 2,
	CENTER			= 3,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

mt.text_original	= ""
mt.text_formatted	= ""
mt.screenOrg		= nil
mt.color			= UI.WHITE_COLOR
mt.backColor		= 0
mt.blendMode		= UI.BM_ALPHA
mt.items			= {}
mt.parentWnd		= nil
mt.parentLayer		= -1
mt.bPixelSnap		= true

mt.formatParams =
{
	hFont 			= FONT.INVALID_FONT_HANDLE,
	formatFlags		= 0,
	formatRectSize	= { x = 0, y = 0 },
}

-- "статические" переменные
UI.MetaTextCommon = {}
UI.MetaTextCommon.linkWnds = {}


-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.MetaText:ResetFormat()

    self.text_formatted	= ""
	self:ResetItems()

end


--
function UI.MetaText:ResetItems()

	for idx, item in pairs( self.items ) do
		self:ResetItem( item )
	end

	self.items = {}

end


--
function UI.MetaText:ResetItem( item )

	if item.itemType == self.itemTypes.ICO then

		if item.hTex ~= UI.INVALID_RESOURCE_HANDLE then
			UI:ReleaseResourceHandle( item.hTex )
			item.hTex = UI.INVALID_RESOURCE_HANDLE
		end


	elseif item.itemType == self.itemTypes.EFFECT then

		if item.effect then
			_G.UI_DestroyEffect( item.effect )
			item.effect = nil
		end

		for spriteIdx, spriteInfo in pairs( item.spritesInfo ) do
			if spriteInfo.hTex ~= UI.INVALID_RESOURCE_HANDLE then
				UI:ReleaseResourceHandle( spriteInfo.hTex )
			end			
		end

		item.spritesInfo = {}


	elseif item.itemType == self.itemTypes.WND then

		if item.bOwner then

			local wnd = UI:GetUiObjByHandleT( item.hWnd )
			if wnd then

				if UI:IsWndKindOf( wnd, "LinkWnd" ) then
					wnd:Reset()
				end

				wnd:UnlinkFromParent()
			end

			item.hWnd = UI.INVALID_UI_HANDLE

		end

	end

end



-- TODO: возможно, для итемов типа text и link, если шрифты совпадают, лучше использовать реальные символы текста
function UI.MetaText:MakePaddingTextForItem( item )

	local formatRect = UI:Quat( 0, 0, 1024, 768 )

	local numPaddingSymbols =_G.GetLastVisibleCharIdForString(
    	self.paddingText,
    	0,
    	self.formatParams.hFont,
    	formatRect,
    	FONT.TF_LEFT + FONT.TF_TOP,
    	UI:Quat( 0, 0, item.rect.z - 0.001, 768 )	-- 0.001 необходимо, чтобы из-за флоат-погрешностей не прибавилсь лишняя буква "i" к padding-тексту (проявление см. в #0061415)
	) + 1

	local strPadding = string.rep( self.paddingSymbol, numPaddingSymbols )

	-- последний видимый символ может быть лишь частично видимым;
	-- в случае, если он выходит за пределы максимальной ширины текста, то он отбрасывается,
	-- чтобы избежать его переноса на другую строку

    local paddingRect = _G.MeasureText(
   		strPadding,
   		self.formatParams.hFont,
    	formatRect,
   		FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_NOCLIP,
    	formatRect )

	if paddingRect.z > self.formatParams.formatRectSize.x - 1 then	-- -1 про запас, чтобы компенсировать флоат-погрешности
		numPaddingSymbols = numPaddingSymbols - 1
		strPadding = string.rep( self.paddingSymbol, numPaddingSymbols )
	end
	
	local strZeroColor = UI:Color2Str( 0 )
	local strBaseColor = UI:Color2Str( self.color )

	return string.format( "%s%s%s", strZeroColor, strPadding, strBaseColor )

end


--
function UI.MetaText:CreateItemFromString( itemString )

	local item = nil
	local bPatternFound = false

	for patternName, pattern in pairs( self.itemPatterns ) do

		local firstBytIdx, lastByteIdx, itemParamsString = string.find( itemString, pattern, 1 )
		if firstBytIdx then

			bPatternFound = true

			local itemType = self:GetItemTypeForPattern( patternName )
			if itemType ~= -1 then

				item = self:CreateEmptyItem( itemType )
				if item then

        			local fnName = string.format( "InitItemFromString_%s", patternName )
    				if fnName then
    					self[ fnName ]( self, item, itemParamsString )
    				else
						item = nil
    					sys.log( "UI.MetaText:CreateItemFromString()[ERROR]: cannot find handler function for pattern \"%s\"", patternName )
    				end					

				else
					sys.log( "UI.MetaText:CreateItemFromString()[ERROR]: fail to create item of type \"%s\"", tostring( itemType ) )
				end

			else
				sys.log( "UI.MetaText:CreateItemFromString()[ERROR]: cannot find itemType for pattern \"%s\"", patternName )
			end

			break

		end

	end

	if not bPatternFound then
		sys.log( "UI.MetaText:CreateItemFromString()[ERROR]: cannot find pattern for string \"%s\"", itemString )
	end

	return item

end


--
function UI.MetaText:GetItemTypeForPattern( patternName )

	return self.pattern2ItemType[ patternName ] or -1

end


--
function UI.MetaText:CreateEmptyItem( itemType )

	local item = {}

	item.itemType			= itemType
	item.name				= ""
	item.color				= 0			-- если 0, то будет использоваться цвет основного текста
	item.userData			= nil
	item.rect				= Quat( 0, 0, 0, 0 )	
	item.vAlignment			= self.itemVAlignments.CENTER
	item.hAlignment			= self.itemHAlignments.CENTER	
	item.offset				= 0	

	item.firstIdx			= -1
	item.lastIdx			= -1
	item.itemString			= ""
	item.numPaddingSymbols	= 0

	if itemType == self.itemTypes.ICO then

		item.hTex				= UI.INVALID_RESOURCE_HANDLE
		item.scale				= 1		
		item.bIgnoreFontSize	= false

	elseif itemType == self.itemTypes.TEXT then

		item.fontName		= ""	-- если "", то будет использоваться шрифт основного текста
		item.hFont			= FONT.INVALID_FONT_HANDLE		
		item.textId			= ""
		item.text			= ""		
		item.backColor		= 0

	elseif itemType == self.itemTypes.EFFECT then

		item.effect			= nil
		item.effectName		= ""
		item.animation		= "idle"
		item.scale			= 1
		item.color			= UI.WHITE_COLOR		
		item.spritesInfo	= {}

	elseif itemType == self.itemTypes.WND then

		item.hWnd			= UI.INVALID_UI_HANDLE
		item.bOwner			= false
		item.initParams		= {}
		
	else
		sys.log( "UI.MetaText:CreateEmptyItem()[ERROR]: unhandled type %s", tostring( itemType ) )
	end

	return item

end


--
function UI.MetaText:InitItemFromStringBase( item, paramsString )

	for name, val in string.gmatch( paramsString, self.paramPattern ) do
		if name and val then

			if name == "name" then
				item.name = val

			elseif name == "color" then

				item.color = tonumber( val )
				if not item.color then
					sys.log( "UI.MetaText:InitItemFromStringBase()[ERROR]: cannot parse color from string \"%s\"", val )
					item.color = UI.WHITE_COLOR
				end

			elseif name == "userData" then
				item.userData = val

			elseif name == "alignment" then

				local vAlignment = self.itemVAlignments[ val ]

				if vAlignment then
					item.vAlignment = vAlignment
				else
					sys.log( "UI.MetaText:InitItemFromStringBase()[ERROR]: unhandled alignment \"%s\"", val  )
				end

			elseif name == "offset" then

				item.offset = tonumber( val )
				if not item.offset then
					sys.log( "UI.MetaText:InitItemFromStringBase()[ERROR]: cannot parse offset from string \"%s\"", val )
					item.offset = 0
				end

			end

		end     
	end

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

end


--
function UI.MetaText:InitItemFromString_TEXTURE( item, paramsString )	

	self:InitItemFromStringBase( item, paramsString )

	for name, val in string.gmatch( paramsString, self.paramPattern ) do
		if name and val then

			if name == "texName" then

				item.hTex = UI:GetTex( val )	

				if item.hTex ~= UI.INVALID_RESOURCE_HANDLE then
					UI:ReferenceResourceHandle( item.hTex )
				end

			elseif name == "handle" then

				item.hTex = tonumber( val )
				UI:ReferenceResourceHandle( item.hTex )

			elseif name == "scale" then

				item.scale = tonumber( val )

			elseif name == "ignoreFontSize" then

				if val == "true" or val == "yes" then
					item.bIgnoreFontSize = true
				else
					local asNumber = tonumber( val ) 
					item.bIgnoreFontSize = asNumber ~= nil and asNumber ~= 0					
				end

			end

		end
	end

end


--
function UI.MetaText:InitItemFromString_KEY_SIMPLE( item, paramsString )

	return self:GetTextureForKeyInputSpecific( paramsString )

end


--
function UI.MetaText:InitItemFromString_KEY( item, paramsString )

	self:InitItemFromStringBase( item, paramsString )

	local strInputType		= self.inputType2Str[ UI.lastInputType ]	
	local strInputTypeEx	= self.inputType2Str[ UI.lastInputType_ex ]	

	local strKey	= ""
	local strKeyEx	= ""

	for name, val in string.gmatch( paramsString, self.paramPattern ) do
		if name and val then

			if name == "scale" then
				item.scale = tonumber( val )

			elseif name == "ignoreFontSize" then
				item.bIgnoreFontSize = ( val == "true" or val == "yes" or tonumber( val ) ~= 0 )

			else
    			if name == strInputType then
    				strKey = val
    			end

    			if name == strInputTypeEx then
    				strKeyEx = val
    			end
			end

		end
	end

	local keyName = strKeyEx ~= "" and strKeyEx or strKey
	item.hTex = self:GetTextureForKey( keyName )

end    


--
function UI.MetaText:InitItemFromString_TEXT( item, paramsString )

	self:InitItemFromStringBase( item, paramsString )

	for name, val in string.gmatch( paramsString, self.paramPattern ) do
		if name and val then

			if name == "font" then
				item.fontName = val
				item.hFont = _G.ObtainFont( item.fontName )

			elseif name == "fontId" then
				item.hFont = tonumber( val )

			elseif name == "textId" then
				item.textId = val
				item.text = UI:GetStringByName( item.textId )

			elseif name == "text" then
				item.text = val

			elseif name == "backColor" then
				item.backColor = val

			end

		end

	end

end


--
function UI.MetaText:InitItemFromString_EFFECT( item, paramsString )	

	self:InitItemFromStringBase( item, paramsString )

	for name, val in string.gmatch( paramsString, self.paramPattern ) do
		if name and val then

			if name == "effectName" then
				item.effect = _G.UI_SpawnEffect( val, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

			elseif name == "animation" then
				item.animation = val

			elseif name == "scale" then
				item.scale = tonumber( val )

			elseif name == "sprite" then

				local spriteName, spriteTex = string.match( val, "([%w_]+)%s+([%w_%-]+)" )
				if spriteName and spriteTex then

					local spriteInfo = {}

					spriteInfo.spriteName = spriteName
					spriteInfo.hTex = UI.INVALID_RESOURCE_HANDLE
					
					spriteInfo.hTex = tonumber( spriteTex )
					
					if spriteInfo.hTex == nil then	-- spriteTex может быть хэндлом(числом) или именеи текстуры; если не число, значит имя
						if spriteTex == "none" then	-- специальное значение для пустой текстуры, т.к. если просто передать пустую строку, то не сработает форматная строка "([%w_]+)%s+([%w_]+)"
							spriteInfo.hTex = UI.INVALID_RESOURCE_HANDLE
						else
							spriteInfo.hTex = UI:GetTex( spriteTex )
						end
					else
						-- SC-113013 хак! если число UI.INVALID_RESOURCE_HANDLE (-1) в строку записывается через %u, то будет как 4294967295,
						-- но функция SetSpriteTexture() принимает знаковый int, и параметр в результате приходит -2147483648(0x80000000),
						-- что приводит в дальнейшем к падению
						-- TODO передалть в коде ResourceHandle на uint?
						if spriteInfo.hTex >= 4294967295 then
							spriteInfo.hTex = UI.INVALID_RESOURCE_HANDLE
						end
					end

					if spriteInfo.hTex ~= UI.INVALID_RESOURCE_HANDLE then
						UI:ReferenceResourceHandle( spriteInfo.hTex )
					end

					table.insert( item.spritesInfo, spriteInfo )
				
				else
					sys.log( "UI.MetaText:InitItemFromString_EFFECT()[ERROR]: invalid effect sprite format in params string \"%s\"", paramsString )
				end

			end

		end
	end

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		item.effect:SetAlpha( UI:GetAlpha( item.color ) )

		for spriteIdx, spriteInfo in pairs( item.spritesInfo ) do
			item.effect:SetSpriteTexture( spriteInfo.spriteName, spriteInfo.hTex )
		end
		
	end

end   


--
function UI.MetaText:InitItemFromString_CREDITS( item, paramsString )	

	item.hTex				= UI:GetTex( "silver_small_icon" )
	UI:ReferenceResourceHandle( item.hTex )

	item.color				= UI.WHITE_COLOR
	item.vAlignment			= self.itemVAlignments.CENTER
	item.scale				= 1		
	item.bIgnoreFontSize	= true

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

end


--
function UI.MetaText:InitItemFromString_GOLD( item, paramsString )	

	item.hTex				= UI:GetTex( "gold_small_icon" )
	UI:ReferenceResourceHandle( item.hTex )

	item.color				= UI.WHITE_COLOR
	item.vAlignment			= self.itemVAlignments.CENTER
	item.scale				= 1		
	item.bIgnoreFontSize	= true

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

end


--
function UI.MetaText:InitItemFromString_TOKENS( item, paramsString )	

	item.hTex				= UI:GetTex( "tokens_small_icon" )
	UI:ReferenceResourceHandle( item.hTex )

	item.color				= UI.WHITE_COLOR
	item.vAlignment			= self.itemVAlignments.CENTER
	item.scale				= 1		
	item.bIgnoreFontSize	= true

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

end


--
function UI.MetaText:InitItemFromString_CREDITS_BIG( item, paramsString )

	local resolution = _G.GetFontResolution( self.formatParams.hFont )

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "money"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end


--
function UI.MetaText:InitItemFromString_GOLD_BIG( item, paramsString )	

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "gold"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end     


--
function UI.MetaText:InitItemFromString_TOKENS_BIG( item, paramsString )	

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "token"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end     


--
function UI.MetaText:InitItemFromString_SYNERGY_SHIP( item, paramsString )	

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "synergy_s"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end     


--
function UI.MetaText:InitItemFromString_SYNERGY_FREE( item, paramsString )	

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "synergy_g"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end  


--
function UI.MetaText:InitItemFromString_IRIDIUM( item, paramsString )	

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "irridium"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end


--
function UI.MetaText:InitItemFromString_CLAN_IRIDIUM( item, paramsString )	

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "corp_iridium"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end


--
function UI.MetaText:InitItemFromString_EVENT_CREDITS( item, paramsString )	

	item.vAlignment = self.itemVAlignments.CENTER
	item.effectName	= self:GetPriceIcoEffectName()
	item.animation	= "event_credits"

	if item.color ~= 0 then
		item.color = UI:SetAlpha( item.color, UI:GetAlpha( self.color ) )
	end

	item.effect = _G.UI_SpawnEffect( item.effectName, self.parentWnd and self.parentWnd:GetUiHandle() or UI.INVALID_UI_HANDLE )

	if item.effect then

		item.effect:StartAnimation( item.animation )
		item.effect:SetScale( UI:Vec2( item.scale, item.scale ) )
		item.effect:SetColor( item.color )
		
	end

end


--
function UI.MetaText:InitItemFromString_WND( item, paramsString )	

	self:InitItemFromStringBase( item, paramsString )

	for name, val in string.gmatch( paramsString, self.paramPattern ) do
		if name and val then

			if name == "hWnd" then
				item.hWnd = tonumber( val )
                item.bOwner = false
			end

		end
	end

end


--
function UI.MetaText:InitItemFromString_LINK( item, paramsString )	

	item.vAlignment = self.itemVAlignments.BASELINE

	self:InitItemFromStringBase( item, paramsString )

	for name, val in string.gmatch( paramsString, self.paramPattern ) do
		if name and val then

			if name == "type" then				

				item.initParams.linkType = UI.LinkWnd.linkTypes[ val ]
				if not item.initParams.linkType then
					sys.log( "UI.MetaText:InitItemFromString_LINK()[ERROR]: invalid linkType: %s", val )
					item.initParams.linkType = -1
				end

			elseif name == "params" then
				
				local str = string.format( "return %s", val )
				item.initParams.params = assert( loadstring( str ) )()

			end

		end
	end	

	local linkWnd = self:ObtainFreeLinkWnd()
	linkWnd:Setup( item.initParams.linkType, item.initParams.params, self.formatParams.hFont, self.blendMode, self.backColor )

	linkWnd:SetAlpha( UI:GetAlpha( self.color ) )

	if self.parentWnd then
		self.parentWnd:AddChild( linkWnd )
	end

	item.hWnd = linkWnd:GetUiHandle()
	item.bOwner = true

end


--
function UI.MetaText:GetTextureForKeyInputSpecific( keyName )

	local key = UI.Keys[ keyName ]
	if not key then
		sys.log( "UI.MetaText:GetTextureForKeyInputSpecific()[ERROR]: invalid key name - \"%s\"", tostring( keyName ) )
		return UI.INVALID_RESOURCE_HANDLE
	end

	local key_inputSpecific		= UI:Key2InputSpecific( key, UI.lastInputType )
	local keyName_inputSpecific	= UI:KeyId2Str( key_inputSpecific )

	return self:GetTextureForKey( keyName_inputSpecific )

end


--
function UI.MetaText:GetTextureForKey( keyName )

	local hTex = UI:GetResourceHandleByName( string.format( "%s_text", keyName ), UI.RES_TEXTURE, true )
	if hTex == UI.INVALID_RESOURCE_HANDLE then
		hTex = UI:GetResourceHandleByName( keyName, UI.RES_TEXTURE, false )
	end

	return hTex

end


--
function UI.MetaText:MeasureItem( item )

	local rect = Quat( 0, 0, 0, 0 )

	if item.itemType == self.itemTypes.ICO then

		if item.hTex ~= UI.INVALID_RESOURCE_HANDLE then

			local rc = UI:GetResourceByHandle( item.hTex )

			local texW = rc:GetTextureWidth()
			local texH = rc:GetTextureHeight()

			local icoPixW	= texW * rc:GetU1() - texW * rc:GetU0()
			local icoPixH	= texH * rc:GetV1() - texH * rc:GetV0()

			if item.bIgnoreFontSize then
			
				local icoResolution = resolution
				if self.parentWnd then
				
					local mainEffect = UI:GetEffectFromLayer( self.parentWnd, 0 )
					if mainEffect then
						icoResolution = mainEffect:GetResolution()
					end
				end
				
				rect.w = UI:YTo1024x768( icoPixH, icoResolution ) * item.scale
				
			else
				local fontH = _G.GetFontSymbolHeight( self.formatParams.hFont )
				rect.w = fontH * item.scale
			end

			local cf = icoPixW / icoPixH
			rect.z = UI:XToRel( UI:YToAbs( rect.w ) * cf )

		end 


	elseif item.itemType == self.itemTypes.TEXT then

    	local formatRect = UI:Quat( 0, 0, 1000000, 1000000 )
       	local hFont = item.hFont ~= FONT.INVALID_FONT_HANDLE and item.hFont or self.formatParams.hFont
    	
    	rect = _G.MeasureText(
       		item.text,
       		hFont,
       		formatRect,
       		FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
       		formatRect )		

		rect.w = _G.GetFontSymbolHeight( hFont ) -- без учета межстрочного пространства


	elseif item.itemType == self.itemTypes.EFFECT then

		if item.effect then

			local size = UI:ZeroVec2()

			if item.effect:HasObject( "self" ) then
				size = item.effect:GetObjSize( "self" )
			else
				local effectRect = item.effect:CalcApproximateRect()
				size.x = effectRect.z
				size.y = effectRect.w
			end

			rect.z = size.x
			rect.w = size.y

		end

	elseif item.itemType == self.itemTypes.WND then

		local wnd = UI:GetUiObjByHandleT( item.hWnd )
		if wnd then
			rect.z = wnd:GetWidth()
			rect.w = wnd:GetHeight()
		end

	end

	if rect.z > self.formatParams.formatRectSize.x - 1 then		-- -1 про запас, чтобы компенсировать флоат-погрешности
		rect.z = self.formatParams.formatRectSize.x - 1
	end

	item.rect = rect

end


--
function UI.MetaText:LayoutItems( itemIdx )

	local item = self.items[ itemIdx ]
	local fp = self.formatParams
	local formatRect = Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )

	-- firstCharIdx и lastCharIdx is 0-based, item.firstIdx is 1-based
	local firstCharIdx	= item.firstIdx - 1
	local lastCharIdx	= ( item.firstIdx - 1 ) + item.numPaddingSymbols - 1

	local stringIdx = _G.GetStringIdForChar( 
		self.text_formatted,
		firstCharIdx + 9,	-- минус спец-символы цвета, иначе не сработает
		fp.hFont, formatRect, fp.formatFlags, formatRect )

	local stringIdx2 = _G.GetStringIdForChar( 
		self.text_formatted,
		lastCharIdx - 9,	-- минус спец-символы цвета, иначе не сработает
		fp.hFont, formatRect, fp.formatFlags, formatRect )

	if stringIdx == -1 or stringIdx2 == -1 or stringIdx ~= stringIdx2 then

		self.text_formatted = UI:Substr( self.text_formatted, 1, ( firstCharIdx + 1 ) - 1 ) .. "|" .. UI:Substr( self.text_formatted, firstCharIdx + 1, -1 )

		item.hAlignment = self.itemHAlignments.LEFT

		for ii = itemIdx, #self.items do
			local t = self.items[ ii ]
			t.firstIdx = t.firstIdx + 1
			t.lastIdx = t.lastIdx + 1					
		end

		return false

	else

		local stringFirstSymbol = _G.GetFirstCharIdForString(
			self.text_formatted,
			stringIdx,
			fp.hFont, formatRect, fp.formatFlags, formatRect )

		if firstCharIdx + 9 == stringFirstSymbol then
			item.hAlignment = self.itemHAlignments.LEFT
		end

	end

	local paddingSymbolsRect = _G.GetSubstringRect(
		self.text_formatted,
		firstCharIdx + 9,	-- минус спец-символы цвета, иначе не сработает
		lastCharIdx - 9,
		fp.hFont, formatRect, fp.formatFlags, formatRect )	

	paddingSymbolsRect.w = _G.GetFontSymbolHeight( fp.hFont ) 	-- без учета межстрочного простанства
	
	-- выравнивание по вертикали

	if item.vAlignment == self.itemVAlignments.TOP then
		item.rect.y = paddingSymbolsRect.y

	elseif item.vAlignment == self.itemVAlignments.BOTTOM then
		item.rect.y = paddingSymbolsRect.y + paddingSymbolsRect.w - item.rect.w

	elseif item.vAlignment == self.itemVAlignments.CENTER then

		local hItemFont = FONT.INVALID_FONT_HANDLE

		if item.itemType == self.itemTypes.TEXT then
			hItemFont = item.hFont

		elseif item.itemType == self.itemTypes.WND then

			local wnd = UI:GetUiObjByHandleT( item.hWnd )
			if wnd and UI:IsWndKindOf( wnd, "LinkWnd" ) then
				hItemFont = wnd:GetTextFont()
			end
		end

		if hItemFont ~= FONT.INVALID_FONT_HANDLE then
			local itemFontSymbolHeignt = _G.GetFontSymbolHeight( hItemFont )
			item.rect.y = paddingSymbolsRect.y + ( paddingSymbolsRect.w - itemFontSymbolHeignt ) * 0.5
		else
			item.rect.y = paddingSymbolsRect.y + ( paddingSymbolsRect.w - item.rect.w ) * 0.5
		end


	elseif item.vAlignment == self.itemVAlignments.BASELINE then

		local hItemFont = FONT.INVALID_FONT_HANDLE

		if item.itemType == self.itemTypes.TEXT then
			hItemFont = item.hFont

		elseif item.itemType == self.itemTypes.WND then

			local wnd = UI:GetUiObjByHandleT( item.hWnd )
			if wnd and UI:IsWndKindOf( wnd, "LinkWnd" ) then
				hItemFont = wnd:GetTextFont()
			end
		end

		local mainBaseLineOffset = _G.GetFontBaselineOffsetRel( fp.hFont )

		if hItemFont ~= FONT.INVALID_FONT_HANDLE then
			local itemBaseLineOffset = _G.GetFontBaselineOffsetRel( hItemFont )
			item.rect.y = paddingSymbolsRect.y + mainBaseLineOffset - itemBaseLineOffset
		else
			item.rect.y = paddingSymbolsRect.y + mainBaseLineOffset - item.rect.w
		end

	elseif item.vAlignment == self.itemVAlignments.CUSTOM_OFFSET then
		item.rect.y = paddingSymbolsRect.y + item.offset

	else
		sys.log( "UI.MetaText:LayoutItems()[ERROR]: unhandled vAlignment: %d", item.vAlignment )
	end

	-- выравнивание по горизонтали

	if item.hAlignment == self.itemHAlignments.LEFT then
		item.rect.x = paddingSymbolsRect.x

	elseif item.hAlignment == self.itemHAlignments.RIGHT then
		item.rect.x = paddingSymbolsRect.x + paddingSymbolsRect.z

	elseif item.hAlignment == self.itemHAlignments.CENTER then
		item.rect.x = paddingSymbolsRect.x + ( paddingSymbolsRect.z - item.rect.z ) * 0.5

	else
		sys.log( "UI.MetaText:LayoutItems()[ERROR]: unhandled hAlignment: %d", item.hAlignment )
	end

	return true

end


--
function UI.MetaText:UpdateEffectsPos()

	local screenOrg = nil

	for idx, item in pairs( self.items ) do
    	if item.itemType == self.itemTypes.EFFECT then

    		if item.effect then

				if not screenOrg then
					screenOrg = self:GetScreenOrg()
				end

				local x = screenOrg.x + item.rect.x
				local y = screenOrg.y + item.rect.y
				
				if self.bPixelSnap then
					x = UI:XRel2Snapped( x )
					y = UI:YRel2Snapped( y )
				end

    			item.effect:SetScreenPos( Vec2( x, y ) )

    		end

    	end
	end

end


--
function UI.MetaText:UpdateWindowsPos()

	local screenOrg = nil

	for idx, item in pairs( self.items ) do
    	if item.itemType == self.itemTypes.WND then

			local wnd = UI:GetUiObjByHandleT( item.hWnd )
			if wnd then

				if not screenOrg then
					screenOrg = self:GetScreenOrg()
				end

				local x = screenOrg.x + item.rect.x 
				local y = screenOrg.y + item.rect.y

				local parentWnd = wnd:GetParent()
				if parentWnd then
					x = parentWnd:XToWindow( x )
					y = parentWnd:YToWindow( y )
				end				
				
				if self.bPixelSnap then
					x = UI:XRel2Snapped( x )
					y = UI:YRel2Snapped( y )
				end
				
				wnd:SetPos( x, y )

			end
		end
	end

end


--
function UI.MetaText:ObtainFreeLinkWnd()

	for idx, linkWnd in pairs( UI.MetaTextCommon.linkWnds ) do
		if linkWnd:GetLinkType() == -1 then
			return linkWnd
		end
	end

	local linkWnd = UI:CreateWnd( "UI.MetaTextCommon", UI.LinkWnd, tostring( #UI.MetaTextCommon.linkWnds + 1 ) )
	table.insert( UI.MetaTextCommon.linkWnds, linkWnd )

	return linkWnd

end


--
function UI.MetaText:UpdateAlpha()

	local alpha = UI:GetAlpha( self.color )

	local function fnSetBlendColorOpacity( color, alpha )

    	local alphaCf = alpha / 255

    	local a = UI:GetAlpha( color ) * alphaCf
    	local r = UI:GetRed( color ) * alphaCf
    	local g = UI:GetGreen( color ) * alphaCf
    	local b = UI:GetBlue( color ) * alphaCf

    	color = UI:MakeArgb( a, r, g, b )

	end

	local function fnChangeInStringAlpha( capture1, capture2 )

		local color = tonumber( string.format( "0x%s", capture2 ) )

		if color == nil or color == 0 then		-- это "технический" цвет - используется для padding

			return capture1

		else

			if self.blendMode == UI.BM_COLOR then
				color = fnSetBlendColorOpacity( color, alpha )
			else
				color = UI:SetAlpha( color, alpha )
			end

			return UI:Color2Str( color )

		end

	end

	self.text_formatted = string.gsub( self.text_formatted, "(@(%x%x%x%x%x%x%x%x))", fnChangeInStringAlpha )


	for idx, item in pairs( self.items ) do

		if item.itemType == self.itemTypes.ICO or item.itemType == self.itemTypes.TEXT then

			if item.color ~= 0 then

    			if self.blendMode == UI.BM_COLOR then
    				item.color = fnSetBlendColorOpacity( item.color, alpha )
    			else
    				item.color = UI:SetAlpha( item.color, alpha )
    			end

			end

		elseif item.itemType == self.itemTypes.EFFECT then

			if self.blendMode == UI.BM_COLOR then
				item.color = fnSetBlendColorOpacity( item.color, alpha )
			else
				item.color = UI:SetAlpha( item.color, alpha )
			end

			item.effect:SetColor( item.color )
			item.effect:SetAlpha( alpha )

		elseif item.itemType == self.itemTypes.WND then

			local wnd = UI:GetUiObjByHandleT( item.hWnd )
			if wnd and wnd.SetAlpha then
				wnd:SetAlpha( alpha )
			end

		end

	end

end


--
function UI.MetaText:GetPriceIcoEffectName()

	local resolution = _G.GetFontResolution( self.formatParams.hFont )
	return resolution.y == 1080 and "shop_items_slot_priceIco_1080" or "shop_items_slot_priceIco"
	
end