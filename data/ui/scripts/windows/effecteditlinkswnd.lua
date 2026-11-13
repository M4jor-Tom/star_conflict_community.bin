-- ------------------------------------------------------------------------
-- UI.EffectEditLinksWnd	- поле ввода, поддерживающее торговые ссылки
-- ------------------------------------------------------------------------

UI.EffectEditLinksWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.EffectEditLinksWnd.layers =
{
    MAIN_EFFECT		= 0,
    SELECTION		= 1,
    TEXT			= 2,
	META_TEXT		= 3,
    CURSOR			= 4,
}


--
UI.EffectEditLinksWnd.def =
{
	className	= "EditWnd",
	prototype	= "EffectEditWnd",

	props =
	{
		name			= "EffectEditLinksWnd",
		isPrototype		= true,
		textLayer		= UI.EffectEditLinksWnd.layers.TEXT,
		selectionLayer	= UI.EffectEditLinksWnd.layers.SELECTION,
		cursorLayer		= UI.EffectEditLinksWnd.layers.CURSOR,
	},

 	layers =
 	{
		mumLayers = UI:GetTableLength( UI.EffectEditWnd.layers ) + 1,

		firstOverlayLayer = UI.EffectEditLinksWnd.layers.CURSOR,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

 		-- SELECTION
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			texture		= "white",
 		},

 		-- TEXT
 		{
 			layerType		= UI.LAYER_TEXT,
    		formatFlags		= FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS,
 			formatInfoSz	= { 1, 1 },
    		font			= { fontName = "Small" },
			visible			= false,
 		},

 		-- META_TEXT
 		{
 			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
    		formatFlags		= FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE,
 			formatInfoSz	= { 1, 1 },
    		font			= { fontName = "Small" },
 		},

 		-- CURSOR
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			rect		= Quat( 0, 0, 2, 0 ),
 			texture		= "white",
 		},
 	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

-- вставка ссылки в текущую позицию курсора, заменяя текущее выделение, если оно есть
function UI.EffectEditLinksWnd:InsertLink( linkType, params )

	if type( linkType ) ~= "number" then
		sys.log( "UI.EffectEditLinksWnd:InsertLink()[ERROR]: invalid type of the 1-st parameter (\"linkType\"); \"number\" expected, got \"%s\"", type( linkType ) )
		return
	end

	if UI:Val2Key( UI.LinkWnd.linkTypes, linkType ) == "" then
		sys.log( "UI.EffectEditLinksWnd:InsertLink()[ERROR]: invalid link type: %d", linkType )
		return
	end

	if type( params ) ~= "table" then
		sys.log( "UI.EffectEditLinksWnd:InsertLink()[ERROR]: invalid type of the 2-nd parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
		return
	end

	local linkData = nil

	if linkType == UI.LinkWnd.linkTypes.ITEM or linkType == UI.LinkWnd.linkTypes.RESOURCE or linkType == UI.LinkWnd.linkTypes.SHIP then

    	if type( params.defName ) ~= "string" then
    		sys.log( "UI.EffectEditLinksWnd:InsertLink()[ERROR]: invalid type of the params.defName; \"string\" expected, got \"%s\"", type( params.defName ) )
    		return
    	end

    	linkData = self:MakeEmptyLinkData()
    	linkData.linkType = linkType
		linkData.params.defName = params.defName
		
		if linkType == UI.LinkWnd.linkTypes.ITEM and UI:IsDefAutogen( params.defName ) then
			linkData.params.autogenItem = UI:GetAutogenItem( params.defName )
		end

	else
		sys.log( "UI.EffectEditLinksWnd:InsertLink()[ERROR]: unhandled link type: %d", linkType )
	end	

	if linkData then
    	self:TryInsertLinkInternal( linkData )
	end

end


-- возвращает текст со ссылками в формате "[link <linkType> <params>]",
-- где <linkType> - тип ссылки, значение из энума UI.LinkWnd.linkTypes;
-- <params> - параметры, специфические для каждого типа ссылки;
-- для типов ITEM, RESOURCE, SHIP <params> в формате: <defName>.
-- Пример: "[link 1 Module_Suicide_T1_Mk1]" 

function UI.EffectEditLinksWnd:GetTextInTransferFormat()

	return self:Edit2Transfer( self:GetEditText() )

end


--
function UI.EffectEditLinksWnd:SetTextFromTransferFormat( transferText )

	self.linksDatas = {}
	local text = self:Transfer2Edit( transferText )
	self:SetEditText( text )	

end


-- преобразует текст в трансферном формате в обычный текст, без всяких ссылок, содержащий только видимые символы
function UI.EffectEditLinksWnd:Transfer2Plain( text )

	local function fnSubst( strLinkType, strParams )

		local linkStr = nil

		local linkType, params, plainText = self:TransferCaptures2LinkParams( strLinkType, strParams )
		if linkType ~= -1 then

            local linkData = self:MakeEmptyLinkData()
            linkData.linkType	= linkType
        	linkData.params		= params

			linkStr = self:Link2PlainStr( linkData ) 
			
		else
			linkStr = plainText
		end

		return linkStr

	end

	return string.gsub( text, self.transferLinkPattern, fnSubst )

end


-- используется в вызовах типа string.gsub( <transferText>, UI.EffectEditLinksWnd.transferLinkPattern, <fnItemSubst> )
-- обрантный перевод, в формат transfer, см. в функции Edit2Transfer()
function UI.EffectEditLinksWnd:TransferCaptures2LinkParams( strLinkType, strParams )

	local validLinkType	= -1
	local params		= nil
	local plainText		= ""

	-- если что либо пришло невалидное - деф, тип ссылки и т.п., то считается текстом пользователя - в лог не ругается, выводится как есть (#0074277,ком.(0313677))
	-- (т.к. игрок может набрать что угодно, в т.ч. скопировать из лога чата технический текст ссылок и подставить свои значения)

	local linkType = tonumber( strLinkType )

	if linkType then

		if linkType == UI.LinkWnd.linkTypes.ITEM then
		
			-- автоген
			local strAutogenItem = string.match( strParams, "a:([^%s]+)" )
			if strAutogenItem then
			
				local autogenItem = self:AutogenItemFromTtransferStr( strAutogenItem )
				if autogenItem then
				
					local defName = UI:AddTempAutogenDef( autogenItem )
					if defName ~= "" then
					
						local bDefValid = UI:GetDef( defName ) ~= nil and linkType == UI:Def2LinkType( defName )
						if bDefValid then
							validLinkType	= linkType
							params			= { defName = defName, autogenItem = autogenItem, bWithBrackets = true }
						else
							sys.log( "UI.EffectEditLinksWnd:TransferCaptures2LinkParams()[ERROR]: invalid def or linkType" )
						end
						
					else
						sys.log( "UI.EffectEditLinksWnd:TransferCaptures2LinkParams()[ERROR]: cannot add autogn def" )
					end
					
				else
					sys.log( "UI.EffectEditLinksWnd:TransferCaptures2LinkParams()[ERROR]: cannot create autogenItem" )
				end
				
			-- обычный модуль
			else
			
				-- имя дефа
				local defName = string.match( strParams, "d:([^%s]+)" )
				
				local bDefValid = UI:GetDef( defName ) ~= nil and linkType == UI:Def2LinkType( defName )
				if bDefValid then
					validLinkType	= linkType
					params			= { defName = defName, bWithBrackets = true }
				else
					sys.log( "UI.EffectEditLinksWnd:TransferCaptures2LinkParams()[ERROR]: invalid def or linkType" )
				end

			end
		
		elseif linkType == UI.LinkWnd.linkTypes.RESOURCE or linkType == UI.LinkWnd.linkTypes.SHIP then
	
			-- имя дефа
			local defName = string.match( strParams, "d:([^%s]+)" )
			
			local bDefValid = UI:GetDef( defName ) ~= nil and linkType == UI:Def2LinkType( defName )
			if bDefValid then
				validLinkType	= linkType
				params			= { defName = defName, bWithBrackets = true }
			else
				sys.log( "UI.EffectEditLinksWnd:TransferCaptures2LinkParams()[ERROR]: invalid def or linkType" )
			end
	
		end

	end
	
	if validLinkType == -1 and plainText == "" then
		plainText = "error"
	end

	return validLinkType, params, plainText

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.EffectEditLinksWnd.transferLinkPattern	= "%[link (%d+) (.-)%]"	-- captures: linkType, params 
UI.EffectEditLinksWnd.editLinkPattern		= "(\r+)%[([^\r]-)%]"	-- captures: linkId, linkName 

-- -----------------------------------
-- vars
-- -----------------------------------

UI.EffectEditLinksWnd.metaText			= nil
UI.EffectEditLinksWnd.hTexMask			= UI.INVALID_RESOURCE_HANDLE
UI.EffectEditLinksWnd.parent			= nil
UI.EffectEditLinksWnd.linksDatas		= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.EffectEditLinksWnd:F_PostLoad()

	UI.EffectEditWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:Update( 0 )

		local handle = self:GetUiHandle()
		mainEffect:LinkLayer( handle, self.layers.META_TEXT, self.effectInfo.main.textObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALPHA )

	end

	self.metaText = UI.EffectEditLinks_MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.META_TEXT ) 

	self.hTexMask = UI:GetTex( "listMask" )

	self:AddEditStyle( UI.ES_AUTOSCROLL )
	self:RemoveEditStyle( UI.ES_PASS )
	self:RemoveEditStyle( UI.ES_NUM )
	self:RemoveEditStyle( UI.ES_MULTILINED )	

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CURSOR_POS_CHANGE )

end


--
function UI.EffectEditLinksWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.EffectEditLinksWnd:F_OnAfterShowOnScreen()

	UI.EffectEditWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.EffectEditLinksWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.EffectEditLinksWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.META_TEXT )

end


--
function UI.EffectEditLinksWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.META_TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.EffectEditLinksWnd:UpdateMetaTextLayerLayout()

	local textRect		= self:GetLayerRect( self.layers.TEXT )
	local metaTextRect	= self:GetLayerRect( self.layers.META_TEXT )	

	if math.abs( textRect.x - metaTextRect.x ) > 1e-03 or math.abs( textRect.y - metaTextRect.y ) > 1e-03 then

		self:SetLayerLeft( textRect.x, self.layers.META_TEXT )
		self:SetLayerTop( textRect.y, self.layers.META_TEXT )
		self.metaText:UpdateScreenOrgFromLayer( self, self.layers.META_TEXT )

	end

	if math.abs( textRect.z - metaTextRect.z ) > 1e-03 or math.abs( textRect.w - metaTextRect.w ) > 1e-03 then

		self:SetLayerWidth( textRect.z, self.layers.META_TEXT )
		self:SetLayerHeight( textRect.w, self.layers.META_TEXT )
		self.metaText:SetFormatRectSize( UI:Vec2( textRect.z, textRect.w ), true )

	end	

end


--
function UI.EffectEditLinksWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateMetaTextLayerLayout()	

end


--
function UI.EffectEditLinksWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.EffectEditLinksWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.EffectEditLinksWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


--
function UI.EffectEditLinksWnd:F_OnEventEditChange( hSender, eventSrc )

	if hSender ~= self:GetUiHandle() then
		return
	end

	self:PurgeLinks()
	self:UpdateMetaText()

end


--
function UI.EffectEditLinksWnd:UpdateMetaText()

	local strEdit = self:GetEditText()
	local strMeta = self:Edit2Meta( strEdit )
	self.metaText:SetText( strMeta, true )

end


--
function UI.EffectEditLinksWnd:F_OnEventCursorPosChange( hSender )

	if hSender ~= self:GetUiHandle() then
		return
	end

	self:AdjustCursorPos()

end


--
function UI.EffectEditLinksWnd:AdjustCursorPos()

	local cursorPos = self:GetCursorPos() + 1
	local adjustedCursorPos = self:GetAdjustedPos( cursorPos, true )

	if adjustedCursorPos ~= cursorPos then
		self:MoveCursor( adjustedCursorPos - 1, self:IsDrag() or _G.Input_IsKeyPressed( UI.Keys.KEY_SHIFT ) )
	end

end


--
function UI.EffectEditLinksWnd:GetLinkUnderCursor( cursorPos )

	local hitLnkId 		= -1
	local hitLinkStart	= -1
	local hitLinkEnd	= -1

	local text				= self:GetEditText()
	local cursorPos_byte	= _G.Utf8CharIdxToByteOffset( text, cursorPos - 1 ) + 1
	local pattern			= "()"..self.editLinkPattern.."()"

	for linkStart_byte, strLinkId, linkName, linkBeyondEnd_byte in string.gmatch( text, pattern ) do

		local linkId = #strLinkId

		local linkData = self.linksDatas[ linkId ]
		if linkData then

			if cursorPos_byte > linkStart_byte and cursorPos_byte < linkBeyondEnd_byte then

            	hitLnkId 		= linkId
            	hitLinkStart	= _G.Utf8ByteOffsetToCharIdx( text, linkStart_byte - 1 ) + 1
            	hitLinkEnd		= _G.Utf8ByteOffsetToCharIdx( text, linkBeyondEnd_byte - 1 ) + 1 - 1

				break

			end

		end

	end


	return hitLnkId, hitLinkStart, hitLinkEnd

end


--
function UI.EffectEditLinksWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local bCanChangePos = true

	local hitPos = self:CharFromPoint( UI:Vec2( mouseX, mouseY ) ) + 1
	local cursorPos = self:GetCursorPos() + 1

	local linkId, linkStart, linkEnd = self:GetLinkUnderCursor( hitPos )
	if linkId ~= -1 and linkStart == cursorPos then		
		bCanChangePos = false
	end

	if not bCanChangePos then
		return false
	end

	if UI:IsWndKindOf( wnd, "LinkWnd" ) then
		wndThatReceivedInput = self:GetUiHandle()
	end

	return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

end


--
function UI.EffectEditLinksWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:GetEditText() == "" then
		return false
	end

	local pos = self:CharFromPoint( UI:Vec2( mouseX, mouseY ), self:GetEditText(), true ) + 1

	local wordStart = self:GetAdjustedWordStart( pos )
	local nextWordStart = self:GetAdjustedNextWordStart( pos )

	self:SetCursorPos( nextWordStart - 1 )
	self:SetSel( wordStart - 1, nextWordStart - 1 )

	return false

end


--
function UI.EffectEditLinksWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if not self:IsDrag() then
	
		if _G.Input_IsKeyPressed( UI.Keys.KEY_MOUSE_BUTTON1 ) and math.abs( deltaX ) > 1e-03 then
			self:StartDrag()
		end

	end

	if self:IsDrag() then

		local pos = self:CharFromPoint( UI:Vec2( mouseX, mouseY ) ) + 1
		local bCanChangePos = true

		local linkId, linkStart, linkEnd = self:GetLinkUnderCursor( pos )
		if linkId ~= -1 then

			local selStart	= self:GetSelStart()
			local selEnd	= self:GetSelEnd()

    		selStart	= selStart ~= -1 and selStart + 1 or selStart
		    selEnd		= selEnd ~= -1 and selEnd + 1 or selEnd

			if selStart ~= -1 then

    			if linkStart >= selStart and linkStart <= selEnd and linkEnd >= selStart and linkEnd <= selEnd then				
    				bCanChangePos = false
    			end

			end

			if bCanChangePos then
				pos = self:GetAdjustedPos( pos, deltaX < 0 )
			end

		end

		if bCanChangePos then
			self:MoveCursor( pos - 1, self:GetEditText(), true )
		end

	end

	return false

end


--
function UI.EffectEditLinksWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	local bHandled = false

	local bCtrl		= _G.Input_IsKeyPressed( UI.Keys.KEY_CONTROL )
	local bShit		= _G.Input_IsKeyPressed( UI.Keys.KEY_SHIFT )
	local cursorPos	= self:GetCursorPos() + 1

	if key == UI.Keys.KEY_LEFT then

		local newCursorPos = bCtrl and self:GetAdjustedWordStart( cursorPos ) or self:GetAdjustedPrevPos( cursorPos )
		self:MoveCursor( newCursorPos - 1, bShit )
		bHandled = true

	elseif key == UI.Keys.KEY_RIGHT then

		local newCursorPos = bCtrl and self:GetAdjustedNextWordStart( cursorPos ) or self:GetAdjustedNextPos( cursorPos )
		self:MoveCursor( newCursorPos - 1, bShit )
		bHandled = true

	elseif key == UI.Keys.KEY_DELETE then

		if not self:HasEditStyle( UI.ES_READ_ONLY ) then
		
			if self:GetSelStart() == -1 then

				local newCursorPos = bCtrl and self:GetAdjustedNextWordStart( cursorPos ) or self:GetAdjustedNextPos( cursorPos )
				self:DeleteSubstr( cursorPos - 1, newCursorPos - cursorPos, UI.EVENT_SRC_KEYBOARD )
				bHandled = true

			end

		end

	elseif key == UI.Keys.KEY_BACKSPACE then

		if not self:HasEditStyle( UI.ES_READ_ONLY ) then
		
			if self:GetSelStart() == -1 then

				local newCursorPos = bCtrl and self:GetAdjustedWordStart( cursorPos ) or self:GetAdjustedPrevPos( cursorPos )
				self:DeleteSubstr( newCursorPos - 1, cursorPos - newCursorPos, UI.EVENT_SRC_KEYBOARD )
				self:MoveCursor( newCursorPos - 1, false )
				bHandled = true

			end

		end

	end	

	if bHandled then
		return true
	else
		return self:OnKeyboardKeyDown( key, wndThatReceivedInput )
	end	

end


--
function UI.EffectEditLinksWnd:GetAdjustedWordStart( pos )

	local newPos = self:GetWordStart( pos - 1 ) + 1

	while true do

		local linkId, linkStart, linkEnd = self:GetLinkUnderCursor( newPos )
		if linkId ~= -1 then
			newPos = self:GetWordStart( linkStart + 1 - 1 ) + 1
		else
			break
		end

	end

	return newPos

end


--
function UI.EffectEditLinksWnd:GetAdjustedNextWordStart( pos )

	local newPos = self:GetNextWordStart( pos - 1 ) + 1

	while true do

		local linkId, linkStart, linkEnd = self:GetLinkUnderCursor( newPos )
		if linkId ~= -1 then
			newPos = self:GetNextWordStart( linkEnd + 1 - 1 ) + 1
		else
			break
		end

	end

	return newPos

end


--
function UI.EffectEditLinksWnd:GetAdjustedPrevPos( pos )

	local newPos = pos - 1

	local linkId, linkStart, linkEnd = self:GetLinkUnderCursor( newPos )
	if linkId ~= -1 then
		newPos = linkStart
	end

	return newPos

end


--
function UI.EffectEditLinksWnd:GetAdjustedNextPos( pos )

	local newPos = pos + 1

	local linkId, linkStart, linkEnd = self:GetLinkUnderCursor( newPos )
	if linkId ~= -1 then
		newPos = linkEnd + 1
	end

	return newPos

end



--
function UI.EffectEditLinksWnd:GetAdjustedPos( pos, bAdjustLeft )

	local newPos = pos

	local linkId, linkStart, linkEnd = self:GetLinkUnderCursor( pos )
	if linkId ~= -1 then
		newPos = bAdjustLeft and linkStart or linkEnd + 1
	end

	return newPos

end


--
function UI.EffectEditLinksWnd:TryInsertLinkInternal( linkData )

	local linkId = self:GetFreeLinkId()
	local strLink = self:Link2EditStr( linkId, linkData ) 

	if not self:CanLinkFit( strLink, linkId, linkData ) then
		return false
	end

	self.linksDatas[ linkId ] = linkData
	self:ReplaceSel( strLink )

	return true

end


--
function UI.EffectEditLinksWnd:GetFreeLinkId()

	local freeId = -1

	local id = 1
	while true do

		if not self.linksDatas[ id ] then
			freeId = id
			break
		end

		id = id + 1

	end

	return freeId

end


function UI.EffectEditLinksWnd:Link2EditStr( linkId, linkData ) 

	return string.format( "%s%s", self:LinkId2Str( linkId ), self:Link2PlainStr( linkData ) )

end


--
function UI.EffectEditLinksWnd:Link2PlainStr( linkData )

	local str = UI.LinkWnd:MakeText( linkData.linkType, linkData.params )
	str = string.gsub( str,"@%x%x%x%x%x%x%x%x", "" )

	return str

end


--
function UI.EffectEditLinksWnd:Link2MetaStr( linkData )

	local linkStr = nil

	if linkData.linkType == UI.LinkWnd.linkTypes.ITEM or linkData.linkType == UI.LinkWnd.linkTypes.RESOURCE or linkData.linkType == UI.LinkWnd.linkTypes.SHIP then
		linkStr = string.format( "$link [type %s][params {defName=\"%s\", bWithBrackets=true}]$", UI:Val2Key( UI.LinkWnd.linkTypes, linkData.linkType ), linkData.params.defName )
	else
		sys.log( "UI.EffectEditLinksWnd:Link2MetaStr()[ERROR]: unhandled link type %s", tostring( linkData.linkType ) )
	end

	return linkStr

end


--
function UI.EffectEditLinksWnd:LinkId2Str( linkId )

	-- Индекс таблицы с данными в строке ссылки кодируется повторением одного невидимого символа - "\r" ("возврат каретки", anscii значение 13 );
	-- количество повторений соответствует числу, которое надо закодировать

	return string.rep( "\r", linkId )

end


-- Проверка, что ссылка влазит с учетом ограничений, которые есть на максимальную длину текста в символах и байтах
function UI.EffectEditLinksWnd:CanLinkFit( strLink, linkId, linkData )

	local text = self:GetEditText()

	-- в символах

	local textLen_symb	= _G.Utf8StrLen( text )
	local linkLen_symb	= _G.Utf8StrLen( strLink )

	local maxSymbols = self:GetSymbolsLimit()
	if maxSymbols == -1 then
		maxSymbols = 1024
	end	

	local insertionPos_symb = self:GetCursorPos() + 1

	if insertionPos_symb + linkLen_symb - 1 > maxSymbols then
		return false
	end


	-- в байтах

	local textLen_byte	= #text
	local linkLen_byte	= #strLink

	local maxBytes = self:GetBytesLimit()
	if maxBytes == -1 then
		maxBytes = 1024 * 4
	else
		maxBytes = maxBytes - 1		-- GetBytesLimit() возвращает с учетом конечного нуля
	end

	local insertionPos_byte = _G.Utf8CharIdxToByteOffset( text, insertionPos_symb - 1 ) + 1

	if insertionPos_byte + linkLen_byte - 1 > maxBytes then
		return false
	end
	
	-- проверка, что текст, преобразованный в transfer-формат (для передачи по сети),
	-- не превысит максимальный размер (512 байт)
	
	-- сначала воспроизведем, как будет выглядеть текст в edit-формате после добавления ссылки
	
	-- ссылка вставляется вместо выделенного текста
	local selStartPos_symb	= self:GetSelStart() + 1
	local selEndPos_symb	= self:GetSelEnd() + 1
	local selStartPos_byte	= _G.Utf8CharIdxToByteOffset( text, selStartPos_symb - 1 ) + 1
	local selEndPos_byte	= _G.Utf8CharIdxToByteOffset( text, selEndPos_symb - 1 ) + 1
	
	local prevTextPart = string.sub( text, 1, selStartPos_byte - 1 )
	local nextNextPart = string.sub( text, selEndPos_byte, -1 )	
	local newText = prevTextPart..strLink..nextNextPart
	
	-- в cpp буфер имеет ограниченный размер, все что более, просто обрежется, делаем так же
	newText = string.sub( newText, 1, 1024*4 )
	
	-- запоминаем новые данные ссылок в новую временную струтуру, для испоьзования в PurgeLinks() и Edit2Transfer()
	local newLinksDatas = UI:CopyTable2( self.linksDatas )
	newLinksDatas[ linkId ] = linkData

	-- эта функция всегда вызывается после изменения текста, делаем так же
	-- (это удаление обрезанной ссылки в конце строки)
	newText = self:PurgeLinks( newText, newLinksDatas )
	
	-- переводим в transfer-формат
	local transferText = self:Edit2Transfer( newText, newLinksDatas )
	if #transferText > 512 then
		return false
	end
	
	return true

end


-- удаление обрывка ссылки в конце строки, который мог возникнуть при вставке/добавлении текста, если ссылка в конце перестала помещаться;
-- удаление даннх для ссылок, которых больше нет в строке
function UI.EffectEditLinksWnd:PurgeLinks( customText, customLinksDatas )

	local text = customText or self:GetEditText()
	local linksDatas = customLinksDatas or self.linksDatas
	
	local textLen = #text

	for linkPos, leftBracketPos in string.gmatch( text, "()\r+()" ) do

		local bLink = true
		local bCutLink = false

		-- от ссылки остался только индекс или часть индекса
		if leftBracketPos > textLen then

			bLink = true
			bCutLink = true

		else
			
			if string.sub( text, leftBracketPos, leftBracketPos ) == "[" then

				-- от ссылки остались индекс и левая скобка
				if leftBracketPos == textLen then

					bLink = true
					bCutLink = true

				else

					local rightBracketPos = string.find( text, "%]", leftBracketPos + 1 )
					local wrongSymbolsPos = string.find( text, "[\r%[]", leftBracketPos + 1 )

					if rightBracketPos then

						if wrongSymbolsPos and wrongSymbolsPos < rightBracketPos then
							bLink = false
						else
							bLink = true
							bCutLink = false
						end

					else

						if wrongSymbolsPos then
							bLink = false
						-- от ссылки остались индекс, левая скобка и все/часть видимых символов
						else
							bLink = true
							bCutLink = true
						end

					end

				end				

			else
				bLink = false
			end

		end

		if bLink and bCutLink then

			text = string.sub( text, 1, linkPos - 1 )

			if not customText then
				local cursorPos = self:GetCursorPos()
				self:SetEditText( text )
				self:MoveCursor( cursorPos, false )
			end

			break

		end

	end

	-- очистка протухших данных для ссылок, для которых уже нет соответствия в тексте	

	local validLinkIds = {}

	for strId in string.gmatch( text, self.editLinkPattern ) do
		local linkId = #strId
		validLinkIds[ linkId ] = true
	end

	for linkId, linkData in pairs( linksDatas ) do
		if not validLinkIds[ linkId ] then
			linksDatas[ linkId ] = nil
		end
	end
	
	return text

end


--
function UI.EffectEditLinksWnd:F_OnBeforeCopyTextToClipboard( text )
	
	-- Внимание! Нельзя пропустить создание переменной и сделать сразу return, т.к. ScriptObject::EndCall() поймет это, будто не было возвращаемого значения
	local fixedText = self:Edit2Plain( text )                                                                                                    	
	return fixedText

end


-- обратный перевод, из формата transfer, см. в функции TransferCaptures2LinkParams()
function UI.EffectEditLinksWnd:Edit2Transfer( text, customLinksDatas )

	local linksDatas = customLinksDatas or self.linksDatas

	local function fnSubst( strLinkId, linkName )

		local linkStr = nil

		local linkId = #strLinkId

		local linkData = linksDatas[ linkId ]
		if linkData then
		
			if linkData.linkType == UI.LinkWnd.linkTypes.ITEM then
			
				local strParams = ""
				
				-- для автогена параметры - автоген-итем, имя дефа не передается
				if linkData.params.autogenItem then
				
					local strAutogenItem = self:AutogenItemToTtransferStr( linkData.params.autogenItem )
					strParams = string.format( "a:%s", strAutogenItem )
					
				-- для обычных модулей параметры - имя дефа
				else
					strParams = string.format( "d:%s", linkData.params.defName )
				end
				
				linkStr = string.format( "[link %d %s]", linkData.linkType, strParams )
			
			elseif linkData.linkType == UI.LinkWnd.linkTypes.RESOURCE or linkData.linkType == UI.LinkWnd.linkTypes.SHIP then
			
				-- параметры - имя дефа
				local strParams = string.format( "d:%s", linkData.params.defName )
				linkStr = string.format( "[link %d %s]", linkData.linkType, strParams )
				
			else
				sys.log( "UI.EffectEditLinksWnd:UpdateMetaText()[ERROR]: unhandled link type %s", tostring( linkData.linkType ) )
			end

		else
			sys.log( "UI.EffectEditLinksWnd:Edit2Transfer()[ERROR]: cannot find link data with id %d", linkId )
		end

		return linkStr

	end

	-- #0074645,комм.(0317057) - чтобы игрок не смог ввести ссылку вручную, текст, совпадающий с форматом ссылки,
	-- намеренно искажается - добавляются пробелы рядом со скобками
	text = string.gsub( text, self.transferLinkPattern, "[ link %1 %2 ]" )

	return string.gsub( text, self.editLinkPattern, fnSubst )

end


--
function UI.EffectEditLinksWnd:Transfer2Edit( text )

	local function fnSubst( strLinkType, strParams )

		local linkStr = nil

		local linkType, params, plainText = self:TransferCaptures2LinkParams( strLinkType, strParams )
		if linkType ~= -1 then

			local linkData = self:MakeEmptyLinkData()
			linkData.linkType	= linkType
			linkData.params		= params
		
			local freeId = self:GetFreeLinkId()
			self.linksDatas[ freeId ] = linkData
		
			linkStr = self:Link2EditStr( freeId, linkData ) 
			
		else
			linkStr = plainText
		end

		return linkStr

	end

	return string.gsub( text, self.transferLinkPattern, fnSubst )

end


--
function UI.EffectEditLinksWnd:Edit2Meta( strEdit )

	local strMeta = UI:ShieldSpecSymbolsForMetatext( strEdit )

	local function fnSubst( strLinkId, linkName )

		local linkStr = nil

		local linkId = #strLinkId

		local linkData = self.linksDatas[ linkId ]
		if linkData then
			linkStr = self:Link2MetaStr( linkData )
		else
			sys.log( "UI.EffectEditLinksWnd:UpdateMetaText()[ERROR]: cannot find link data with id %d", linkId )
		end

		return linkStr

	end

	return string.gsub( strMeta, self.editLinkPattern, fnSubst )

end


--
function UI.EffectEditLinksWnd:Edit2Plain( text )

	return string.gsub( text, "(\r)", "" )

end


--
function UI.EffectEditLinksWnd:MakeEmptyLinkData()

	return
	{
        linkType = -1,
    	params =
		{
			bWithBrackets = true,
		},
	}

end


--
function UI.EffectEditLinksWnd:AutogenItemToTtransferStr( autogenItem )

	local strAutogenItem = ""
	
	if not autogenItem then
		return strAutogenItem
	end
	
	-- для удобства сначала переводим в регулярный массив - числовые индексы, отсчет с 1, содержит переведенные в строки значения
	-- (в rollData хранится таблица со строковыми индексами, отсчет с 0)
	local rollDataArr = {}
	for strRollValIdx, rollVal in pairs( autogenItem.rollData ) do
	
		-- для дробных значений передаются 3 цифры после запятой
		-- чтобы целые не передавались со знаками после запятой, вручную определяем, целое или нет (для уменьшения размера строки)
		local rollValAsString = ""
		
		local intPart, fractPart = math.modf( rollVal )
		if math.abs( fractPart ) < 0.0005 then
			fractPart = 0
		end
		
		if fractPart == 0 then
			rollValAsString = string.format( "%d", intPart )
		else
			rollValAsString = string.format( "%.3f", rollVal )
		end
		
		rollDataArr[ tonumber( strRollValIdx ) + 1 ] = rollValAsString
		
	end
	
	local strRollData = table.concat( rollDataArr, "," )
	
	strAutogenItem = string.format( "%s;%d;%s", _G.U64ToStr( autogenItem.iid ), autogenItem.upgradeLevel, strRollData )
	
	return strAutogenItem

end


--
function UI.EffectEditLinksWnd:AutogenItemFromTtransferStr( strAutogenItem )

	local autogenItem = nil
	if not strAutogenItem or strAutogenItem == "" then
		return autogenItem
	end

	local strIid, strUpgradeLevel, strRollData = string.match( strAutogenItem, "(.+);(.+);(.+)" )
	
	-- iid
	local iid = tonumber( strIid )
	if iid then
	
		iid = u64( iid )
		
		if iid == UI.INVALID_U64_ID then
			sys.log( "UI.EffectEditLinksWnd:AutogenItemFromTtransferStr()[ERROR]: invalid autogen iid" )
			return autogenItem
		end
		
	else
		sys.log( "UI.EffectEditLinksWnd:AutogenItemFromTtransferStr()[ERROR]: invalid autogenItem format - invalid iid format" )
		return autogenItem
	end
	
	-- уровень апгрейда
	local upgradeLevel = tonumber( strUpgradeLevel )
	if not upgradeLevel then
		sys.log( "UI.EffectEditLinksWnd:AutogenItemFromTtransferStr()[ERROR]: invalid autogenItem format - invalid upgradeLevel format " )
		return autogenItem
	end
	
	--SC-119414:
	local strRollDataMatch = string.match( strRollData, "[%d.,]*" )
	if strRollData ~= strRollDataMatch then
		sys.log( "UI.EffectEditLinksWnd:AutogenItemFromTtransferStr()[ERROR]: invalid autogenItem format - invalid rollData format '%s'", strRollData )
		return autogenItem
	end

	-- rollData
	local rollData = nil

	local rollDataArr = assert( loadstring( "return {"..strRollData.."}" ) )()
	if type( rollDataArr ) == "table" then
	
		-- проверяем, что rollData представлена в виде регулярногго массива, отсчет с 1
		local rollDataSize = UI:GetTableLength( rollDataArr )
		local bRollDataValid = true
		
		for rollValIdx, rollVal in pairs( rollDataArr ) do
		
			if type( rollValIdx ) ~= "number" or type( rollVal ) ~= "number" then
				bRollDataValid = false
				break
			end
			
			if rollValIdx < 1 or rollValIdx > rollDataSize then
				bRollDataValid = false
				break
			end
		end
		
		if bRollDataValid then
		
			-- переводим из регулярного массива в таблицу со строковыми ключами, отсчет с 0, именно в таком формате происходит обмен роллдатой с cpp
			rollData = {}
			for rollValIdx, rollVal in ipairs( rollDataArr ) do
				rollData[ tostring( rollValIdx - 1 ) ] = rollVal
			end
		
		else
			sys.log( "UI.EffectEditLinksWnd:AutogenItemFromTtransferStr()[ERROR]: invalid autogenItem format - invalid rollData format " )
			return autogenItem
		end
	
	else
		sys.log( "UI.EffectEditLinksWnd:AutogenItemFromTtransferStr()[ERROR]: invalid autogenItem format - invalid rollData format" )
		return autogenItem
	end
	
	autogenItem =
	{
		iid				= iid,
		upgradeLevel	= upgradeLevel,
		rollData		= rollData,
	}
	
	return autogenItem
	
end


-- ------------------------------------------------------------------------
-- UI.EffectEditLinks_MetaText
-- ------------------------------------------------------------------------

UI.EffectEditLinks_MetaText = UI:CopyTable2( UI.MetaText )

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.EffectEditLinks_MetaText.GetNewInstance()

	local newInst = UI:CopyTable2( UI.EffectEditLinks_MetaText )

	return newInst

end


-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.EffectEditLinks_MetaText:MakePaddingTextForItem( item )

	if item.itemType == UI.MetaText.itemTypes.WND then

		local linkWnd = UI:GetUiObjByHandleT( item.hWnd )
		if linkWnd then

    		if UI:IsWndKindOf( linkWnd, "LinkWnd" ) then

            	local strPadding = linkWnd:GetLinkText()
            	
            	local strZeroColor = UI:Color2Str( 0 )
            	local strBaseColor = UI:Color2Str( self.color )

            	return string.format( "%s%s%s", strZeroColor, strPadding, strBaseColor )

    		else
    			sys.log( "MakePaddingTextForItem()[ERROR]: unhandled wnd kind (wnd %s)", linkWnd:GetScriptTableName() )
    		end		

		else
			sys.log( "MakePaddingTextForItem()[ERROR]: cannot wind wnd" )
		end

	else
		sys.log( "MakePaddingTextForItem()[ERROR]: unhandled item type: %s", UI:Val2Key( UI.MetaText.itemTypes, item.itemType ) )
	end

	return UI.MetaText.MakePaddingTextForItem( self, item )

end