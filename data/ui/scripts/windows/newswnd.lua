-- ----------------------------------------------------------------------------
--
-- Workfile: newswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.NewsWnd = {}
local nw = UI.NewsWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.NewsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "NewsWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "news_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.NewsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",	
						layer		= "UI.NewsWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "news_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "description",	
						layer		= "UI.NewsWnd.layers.RECORDS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^news_caption"
		},

		-- RECORDS
		{
			layerType	= UI.LAYER_INVALID,
		},
	},

	children = { "UI.News_RecordsWnd" }	
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.NewsWnd:RequestNews()

	return _G.MasterServer_RequestNewsFeed() ~= 0

end


--
function UI.NewsWnd:Setup( news )

	self.news = news

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


-- ------------------------------
-- const
-- ------------------------------

nw.layers =
{
    MAIN_EFFECT		= 0,
	WORK_EFFECT		= 1,
    CAPTION			= 2,
	RECORDS			= 3,
}

nw.scrollBarPrototypeName = "EffectScrollWnd_Vrt"

nw.effectInfo =
{
	main =
	{
		animIdle	= "idle",
		animShow	= "show",
	},

	work =
	{
		scrollObjName		= "scroll",
		captionLocator		= "title",
		dateLocator			= "date",
		msgLocator			= "text",
		recordsSpaceLocator	= "Dist",
	}
}

nw.SCROLL_STEP_SIZE			= 10
nw.SCROLL_WHEEL_STEP_SIZE	= 20

-- ------------------------------
-- vars
-- ------------------------------

nw.scrollBar				= nil
nw.news						= {}
nw.records					= {}
nw.numRecords				= 0
nw.scrollPos				= 0
nw.firstVisibleRecordIdx	= -1
nw.lastVisibleRecordIdx		= -1
nw.space_caption_date		= 0
nw.space_date_msg			= 0
nw.space_records			= 0
nw.recordsWnd				= nil	-- вспомогательное окно, чтобы с его помощью применялась маска только на записи (исключая дргуие элементы типа скроллюбара, фона и т.п.)

nw.fontInfo_caption =
{
	hFont		= FONT.INVALID_FONT_HANDLE,
	color		= UI.WHITE_COLOR,
	formatFlags	= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_WORDBREAK,
	blend		= UI.BM_ALPHA,
}

nw.fontInfo_date =
{
	hFont		= FONT.INVALID_FONT_HANDLE,		
	color		= UI.WHITE_COLOR,
	formatFlags	= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE,
	blend		= UI.BM_ALPHA,
}

nw.fontInfo_msg =
{
	hFont		= FONT.INVALID_FONT_HANDLE,		
	color		= UI.WHITE_COLOR,
	formatFlags	= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_WORDBREAK,
	blend		= UI.BM_ALPHA,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.NewsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitScrollBar()
	self:InitRecordsWnd()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then

		local captionPos	= workEffect:GetObjPos( self.effectInfo.work.captionLocator )
		local datePos		= workEffect:GetObjPos( self.effectInfo.work.dateLocator )
		local msgPos		= workEffect:GetObjPos( self.effectInfo.work.msgLocator )

		local captionFontName	= workEffect:GetObjFontName( self.effectInfo.work.captionLocator )
		local dateFontName		= workEffect:GetObjFontName( self.effectInfo.work.dateLocator )
		local msgFontName		= workEffect:GetObjFontName( self.effectInfo.work.msgLocator )

		local captionColor		= workEffect:GetObjColor( self.effectInfo.work.captionLocator )
		local dateColor			= workEffect:GetObjColor( self.effectInfo.work.dateLocator )
		local msgColor			= workEffect:GetObjColor( self.effectInfo.work.msgLocator )

		local captionAlpha		= workEffect:GetObjAlpha( self.effectInfo.work.captionLocator )
		local dateAlpha			= workEffect:GetObjAlpha( self.effectInfo.work.dateLocator )
		local msgAlpha			= workEffect:GetObjAlpha( self.effectInfo.work.msgLocator )

		local captionAlignment	= workEffect:GetObjAlignment( self.effectInfo.work.captionLocator )
		local dateAlignment		= workEffect:GetObjAlignment( self.effectInfo.work.dateLocator )
		local magAlignment		= workEffect:GetObjAlignment( self.effectInfo.work.msgLocator )


		self.fontInfo_caption.hFont	= _G.ObtainFont( captionFontName )
		self.fontInfo_date.hFont	= _G.ObtainFont( dateFontName )
		self.fontInfo_msg.hFont		= _G.ObtainFont( msgFontName )

		self.fontInfo_caption.color	= UI:SetAlpha( captionColor, captionAlpha )
		self.fontInfo_date.color	= UI:SetAlpha( dateColor, dateAlpha )
		self.fontInfo_msg.color		= UI:SetAlpha( msgColor, msgAlpha )

		self.fontInfo_caption.blend	= workEffect:GetObjBlendMode( self.effectInfo.work.captionLocator )
		self.fontInfo_date.blend	= workEffect:GetObjBlendMode( self.effectInfo.work.dateLocator )
		self.fontInfo_msg.blend		= workEffect:GetObjBlendMode( self.effectInfo.work.msgLocator )

		self.space_caption_date	= ( datePos.y - captionPos.y ) - _G.GetFontLineHeight( self.fontInfo_caption.hFont )
		self.space_date_msg		= ( msgPos.y - datePos.y ) - _G.GetFontLineHeight( self.fontInfo_date.hFont )
		self.space_records		= workEffect:GetObjSize( self.effectInfo.work.recordsSpaceLocator ).y

	end

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )

end


--
function UI.NewsWnd:F_Shutdown()

	self:ResetRecords()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.NewsWnd:InitRecordsWnd()

	self.recordsWnd = UI.News_RecordsWnd

	local recordsRect = self:GetLayerRect( self.layers.RECORDS )
	self.recordsWnd:SetRect( recordsRect )	

end


--
function UI.NewsWnd:InitScrollBar()	

	if self.scrollBarPrototypeName == "" then
		return
	end

	self.scrollBar = UI:CreateChildWnd( self, UI[ self.scrollBarPrototypeName ], "" )	
	if not self.scrollBar then
		return
	end	

	self.scrollBar:SetPageSize( self:GetScrollHeight() )
	self.scrollBar:SetStepSize( self.SCROLL_STEP_SIZE )
	self.scrollBar:RemoveScrollWndStyle( UI.SWS_STEPWISE_THUMB_MOVEMENT )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if not scrollEffect then
		return
	end

	local needSize = workEffect:HasObject( self.effectInfo.work.scrollObjName ) and workEffect:GetObjSize( self.effectInfo.work.scrollObjName ) or UI:ZeroVec2()
	local baseSize = scrollEffect:GetObjSize( "self" )

	local scale_y = needSize.y / baseSize.y
	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

	self.scrollBar:SetWidth( baseSize.x )
	self.scrollBar:SetHeight( needSize.y )

	self:UpdateScrollBarVisibility()

end


--
function UI.NewsWnd:UpdateScrollBarVisibility()	

	local bNeedScrollBar = self:GetRecordsHeigt() - self:GetScrollHeight() > 1e-3

	if bNeedScrollBar then

		local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
		if workEffect then
			UI:AddChildAndLink( self, self.scrollBar, workEffect, self.effectInfo.work.scrollObjName, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )
		end

		self:UpdateScrollBarRange()
		self:UpdateScrollBarPos()

	else

		local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
		if workEffect then
			workEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
		end	

		self:RemoveChild( self.scrollBar )
	
	end

end


--
function UI.NewsWnd:UpdateScrollBarRange()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	self.scrollBar:SetRange( 0, math.max( 0, self:GetRecordsHeigt() - self:GetScrollHeight() ) )

end


--
function UI.NewsWnd:UpdateScrollBarPos()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	self.scrollBar:SetPos( self.scrollPos )

end


--
function UI.NewsWnd:UpdateVisibleRangeFromScrollBar()

	self:SetScrollPos( self.scrollBar:GetPos() )

end


--
function UI.NewsWnd:GetScrollHeight()

	return self:GetLayerHeight( self.layers.RECORDS )

end


--
function UI.NewsWnd:GetRecordsHeigt()

	local heigth = 0

	if self.numRecords > 0 then
		local lastRecord = self.records[ self.numRecords ]
		heigth = lastRecord.rect.y + lastRecord.rect.w
	end

	return heigth

end


--
function UI.NewsWnd:Reset()

	self:ResetRecords()

	self.scrollPos				= 0
	self.firstVisibleRecordIdx	= -1
	self.lastVisibleRecordIdx	= -1	

	self:UpdateScrollBarVisibility()	

end


--
function UI.NewsWnd:ResetRecords()

	for idx, record in pairs( self.records ) do
		record.msgMetaText:Clear()
	end

	self.records = {}
	self.numRecords = 0

end


--
function UI.NewsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animShow )
	end

end


--
function UI.NewsWnd:FullUpdate()

	self:Reset()

	self:UpdateRecords()
	if not next( self.records ) then
		return
	end

	self:UpdateScrollBarVisibility()
	self:SetScrollPosToRecord( 1 )

end


--
function UI.NewsWnd:UpdateRecords()

	self:ResetRecords()

	self.numRecords = #self.news
	if self.numRecords == 0 then
		return
	end

	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.RECORDS ), 1000000 )
	local y = 0
	local dateFontHeight = _G.GetFontLineHeight( self.fontInfo_date.hFont )

	for idx = 1, self.numRecords do

		local newsItem = self.news[ idx ]

		local record = {}
		record.idx = idx


		-- заголовок

		record.strCaption = self:ConvertMsg( newsItem.title )

		record.captionRect = _G.MeasureText(
       		record.strCaption,
       		self.fontInfo_caption.hFont,
       		formatRect,
       		self.fontInfo_caption.formatFlags,
       		formatRect )		

		record.captionRect.y = y


		-- дата

		record.strDate = self:ConvertDate( newsItem.pubDate )
		record.dateRect = Quat( 0, record.captionRect.y + record.captionRect.w + self.space_caption_date, formatRect.z, dateFontHeight )


		-- текст сообщения

		record.msgMetaText = UI.MetaText.GetNewInstance()
		record.msgMetaText:SetFormatParams( self.fontInfo_msg.hFont, self.fontInfo_msg.formatFlags, UI:Vec2( formatRect.z, 10000000 ), false )
		record.msgMetaText:SetColor( self.fontInfo_msg.color )
		record.msgMetaText:SetBlendMode( self.fontInfo_msg.blend )
		record.msgMetaText:SetParentWindow( self.recordsWnd )
		record.msgMetaText:SetText( self:ConvertMsg( newsItem.description ), true )

		record.msgRect = _G.MeasureText(
       		record.msgMetaText:GetFormattedText(),
       		self.fontInfo_msg.hFont,
       		formatRect,
       		self.fontInfo_msg.formatFlags,
       		formatRect )		

		record.msgRect.y = record.dateRect.y + record.dateRect.w + self.space_date_msg


		record.rect = Quat( 0, y, formatRect.z, record.msgRect.y + record.msgRect.w - y )

		table.insert( self.records, record )

		y = record.rect.y + record.rect.w + self.space_records

	end

end


--
function UI.NewsWnd:SetScrollPos( pos )

	self.scrollPos = pos

	self:UpdateScrollBarPos()
	self:UpdateVisibleRange()

end


--
function UI.NewsWnd:DrawRecords( clipX0, clipY0, clipWidth, clipHeight )

	if self.firstVisibleRecordIdx == -1 then
		return
	end

	local layerScreenRect = UI:QuatCopyStable( self:ToScreen( self:GetLayerRect( self.layers.RECORDS ) ) )

	local alpha = 255

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		alpha = workEffect:GetAlpha()
	end

	UI.drawer:EndUiDrawing()

	for recordIdx = self.firstVisibleRecordIdx, self.lastVisibleRecordIdx do

		local record = self.records[ recordIdx ]
		local newsItem = self.news[ recordIdx ]


		-- caption

		if self.fontInfo_caption.blend ~= UI.BM_ALPHA then
			_G.SetTextBlendMode( self.fontInfo_caption.blend )
		end

		local rect = UI:QuatCopy( record.captionRect )
		rect.x = rect.x + layerScreenRect.x
		rect.y = rect.y + layerScreenRect.y - self.scrollPos

		_G.UI_DrawText(
   			record.strCaption,
   			self.fontInfo_caption.hFont,
   			rect,
			UI:SetAlpha( self.fontInfo_caption.color, alpha ),	
			0,
			self.fontInfo_caption.formatFlags,
   			rect
		)

		if self.fontInfo_caption.blend ~= UI.BM_ALPHA then
			_G.SetTextBlendMode( UI.BM_ALPHA )
		end


		-- date

		if self.fontInfo_date.blend ~= UI.BM_ALPHA then
			_G.SetTextBlendMode( self.fontInfo_date.blend )
		end

		rect = UI:QuatCopy( record.dateRect )
		rect.x = rect.x + layerScreenRect.x
		rect.y = rect.y + layerScreenRect.y - self.scrollPos		

		_G.UI_DrawText(
   			record.strDate,
   			self.fontInfo_date.hFont,
   			rect,
			UI:SetAlpha( self.fontInfo_date.color, alpha ),
			0,
			self.fontInfo_date.formatFlags,
   			rect
		)

		if self.fontInfo_date.blend ~= UI.BM_ALPHA then
			_G.SetTextBlendMode( UI.BM_ALPHA )
		end

	end

	UI.drawer:BeginUiDrawing()

	-- msg

	for recordIdx = self.firstVisibleRecordIdx, self.lastVisibleRecordIdx do
		local record = self.records[ recordIdx ]
		record.msgMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end	

end


--
function UI.NewsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end	

	self:Scroll( -ticks * self.SCROLL_WHEEL_STEP_SIZE )
	return false

end


--
function UI.NewsWnd:Scroll( delta )

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	local oldScrollPos = self.scrollPos
	local newScrollPos = UI:Clamp( self.scrollPos + delta, self.scrollBar:GetMin(), self.scrollBar:GetMax() )

	if math.abs( oldScrollPos - newScrollPos ) > 1e-3 then
		self:SetScrollPos( newScrollPos )		
	end

end


--
function UI.NewsWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:UpdateVisibleRangeFromScrollBar()

end


--
function UI.NewsWnd:UpdateVisibleRange()

	self.firstVisibleRecordIdx = -1
	self.lastVisibleRecordIdx = -1

	if self.numRecords == 0 then
		return
	end

	local scrollHeight = self:GetScrollHeight()

	for recordIdx = 1, self.numRecords do

		local record = self.records[ recordIdx ]

		if record.rect.y + record.rect.w >= self.scrollPos and record.rect.y <= self.scrollPos + scrollHeight then

			if self.firstVisibleRecordIdx == -1 then
				self.firstVisibleRecordIdx = recordIdx
			end

			self.lastVisibleRecordIdx = recordIdx

		else
			if self.firstVisibleRecordIdx ~= -1 then
				break
			end
		end

	end

end


--
function UI.NewsWnd:ConvertDate( srcDate )

	-- исходная строка типа: Fri, 10 Feb 2012 00:00:00 +0600
	-- (стандарт RFC 822)

	local dstDate = srcDate

	local pattern = "^(%a+),%s+(%d+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+([%w%+%-]+)$"	

    local months =
    {
        Jan	= 1,
        Feb	= 2,
        Mar	= 3,
        Apr	= 4,
        May	= 5,
        Jun	= 6,
        Jul	= 7,
        Aug	= 8,
        Sep	= 9,
        Oct	= 10,
        Nov	= 11,
        Dec	= 12,
    }  

	local weekDay, day, month, year, hour, min, sec, timeZone = string.match( srcDate, pattern )
	if weekDay then

		local monthId = months[ month ]
		if not monthId then
			sys.log( "UI.NewsWnd:ConvertDate()[ERROR]: unhandled month name" )
		end
		dstDate = string.format( "%s.%s.%s", day, monthId and string.format( "%02d", monthId ) or month, year )

	else
		sys.log( "UI.NewsWnd:ConvertDate()[ERROR]: cannot parse date string: %s", srcDate )
	end          

	return dstDate

end


--
function UI.NewsWnd:ConvertMsg( msg )

	return UI:ConvertServerString( msg )

end


--
function UI.NewsWnd:SetScrollPosToRecord( recordIdx )

	local scrollPos = self:GetScrollPosToRecord( recordIdx )
	self:SetScrollPos( scrollPos )

end


-- позиция на начало записи
function UI.NewsWnd:GetScrollPosToRecord( recordIdx )

	local record = self.records[ recordIdx ]
	return UI:Clamp( record.captionRect.y, self.scrollBar:GetMin(), self.scrollBar:GetMax() )

end


--
function UI.NewsWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ) and animName == self.effectInfo.main.animShow then
		effect:StartAnimation( self.effectInfo.main.animIdle )
	end

end


--
function UI.NewsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateMetaTextPosAndAlpha()

end


--
function UI.NewsWnd:UpdateMetaTextPosAndAlpha()

	local layerScreenRect = self:ToScreen( self:GetLayerRect( self.layers.RECORDS ) )

	local alpha = 255
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		alpha = workEffect:GetAlpha()
	end

	for recordIdx, record in pairs( self.records ) do
		record.msgMetaText:SetScreenOrg( UI:Vec2( record.msgRect.x + layerScreenRect.x, record.msgRect.y + layerScreenRect.y - self.scrollPos ) )
		record.msgMetaText:SetAlpha( alpha )
	end

end


-- -------------------------------------------------------------------------------
-- UI.News_RecordsWnd
-- -------------------------------------------------------------------------------

UI.News_RecordsWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.News_RecordsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "News_RecordsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	layers =
	{
		-- RECORDS
		{
			layerType	= UI.LAYER_INVALID,
			layerStyle	= UI.WLS_OWNERDRAW + UI.WLS_RESIZABLE,
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x4400ffff,
			visible		= false,
		}
	}
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.News_RecordsWnd.layers =
{
	RECORDS	= 0,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.News_RecordsWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.News_RecordsWnd.parent	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.News_RecordsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
                                                                                                                     
	if self:IsPrototype() then
		return
	end

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.News_RecordsWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.News_RecordsWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.News_RecordsWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


--
function UI.News_RecordsWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.RECORDS then
		UI.NewsWnd:DrawRecords( clipX0, clipY0, clipWidth, clipHeight )
	end

end