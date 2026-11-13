--
-- Workfile: creditswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

--
UI.CreditsWnd = {}
local cw = UI.CreditsWnd

-- --------------------------------
-- window definition
-- --------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

--
UI.CreditsWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name			= "CreditsWnd",
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "credits_main",
				defaultAnimation	= "idle",

    			links =
    			{
    				{
    					objName		= "text",
    					layer		= "UI.CreditsWnd.layers.RECORDS",
    					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE,
    				},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- RECORDS
		{
   			layerType	= UI.LAYER_INVALID,
			layerStyle	= UI.WLS_OWNERDRAW,
		},

		-- MASK_TOP
		{
			layerType	= UI.LAYER_TEXTURE,
			rect		= Quat( 0, 0, resolution.x, 150 ),
			texture		= "credits_mask_top",
			visible		= false,
		},

		-- MASK_BOTTOM
		{
			layerType	= UI.LAYER_TEXTURE,
			rect		= Quat( 0, 0, resolution.x, 150 ),
			texture		= "credits_mask_bottom",
			visible		= false,
		},
	},
}

-- --------------------------------
-- const
-- --------------------------------

cw.layers =
{
	MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
	RECORDS			= 2,
	MASK_TOP		= 3,
	MASK_BOTTOM		= 4,
}  

cw.sounds =
{
	hide	= UI.sounds.showScreen
}

cw.FADE_TIME_TO_BLACK = 0.5
cw.FADE_TIME_TO_NONE = 0.5

-- --------------------------------
-- vars
-- --------------------------------

cw.records				= {}
cw.numRecords			= 0
cw.firstVisibleIdx		= -1
cw.lastVisibleIdx		= -1
cw.records_y0_screen	= 0
cw.recordsRect_screen	= Quat( 0, 0, 0, 0 )
cw.fontIds				= {}
cw.speed				= 0
cw.fadeTimer			= -1

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.CreditsWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	for style, t in pairs( UI.Credits.styleInfo ) do
		self.fontIds[ style ] = _G.ObtainFont( t.font )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	local recordsRect = self:GetLayerRect( self.layers.RECORDS )
	self.recordsRect_screen = UI:QuatCopyStable( self:ToScreen( recordsRect ) )
	self:SetLayerTop( recordsRect.y, self.layers.MASK_TOP )
	self:SetLayerTop( recordsRect.y + recordsRect.w - self:GetLayerHeight( self.layers.MASK_BOTTOM ), self.layers.MASK_BOTTOM )	

end


--
function UI.CreditsWnd:F_Shutdown()

	self:ReleaseTextures()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.CreditsWnd:Reset()

	UI.FullScreenSelectionWnd.Reset( self )

	self:ResetRecordsScroll()
	self:ReleaseTextures()

	self.records			= {}
	self.numRecords			= 0
	self.speed				= UI.Credits.scrollSpeed

	self.fadeTimer			= -1

end


--
function UI.CreditsWnd:ResetRecordsScroll()

    self.firstVisibleIdx	= -1
    self.lastVisibleIdx		= -1
	self.records_y0_screen	= 0
	self:SetLayerVisible( false, self.layers.RECORDS )

end


--
function UI.CreditsWnd:StartRecordsScroll()

	self:ResetRecordsScroll()

	if self.numRecords == 0 then
		return
	end

	self.records_y0_screen = self:GetStartRecordsPos()
	self:SetLayerVisible( true, self.layers.RECORDS )

	self:RecalcVisibleRange()	

end


--
function UI.CreditsWnd:GetStartRecordsPos()

	return self.recordsRect_screen.y + self.recordsRect_screen.w - 1 --  TODO: зачем -1???

end


--
function UI.CreditsWnd:ReleaseTextures()

	for idx, record in pairs( self.records ) do
		if record.hTex then
			UI:ReleaseResourceHandle( record.hTex )
			record.hTex = nil
		end
	end

end


--
function UI.CreditsWnd:FullUpdate()

	self:Reset()

	self:InitRecords()

end


--
function UI.CreditsWnd:InitRecords()

	if not UI.Credits or not UI.Credits.records then
		return
	end

	local y = 0
	local formatRect = UI:QuatCopyStable( self.recordsRect_screen )
	formatRect.y = 100000

	for i = 1, #UI.Credits.records do

		local item = UI.Credits.records[ i ]

		-- текст

		if item.text then

			local record = {}

			record.itemIdx		= i
			record.text			= UI:GetStringByName( item.text )			
			record.hFont		= self.fontIds[ item.style ] or 0
			record.color		= UI.Credits.styleInfo[ item.style ] and UI.Credits.styleInfo[ item.style ].color or UI.WHITE_COLOR
			record.blendMode	= UI.Credits.styleInfo[ item.style ] and UI.Credits.styleInfo[ item.style ].blend or UI.BM_ALPHA			

			-- TODO: выяснить, почему, если измерить и отрисовать с выравниванием FONT.TF_TOP, то текст будет обрезаться снизу
			-- (в некоторых шрифтах - large, в частности, а внекоторых не обрезается, но рисуется за пределами нужной области)

			-- выравнивание
			record.formatFlags = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_WORDBREAK

    		record.rect = MeasureText(
           		record.text,
           		record.hFont,
           		formatRect,
           		FONT.TF_HCENTER + FONT.TF_TOP + FONT.TF_WORDBREAK,
           		formatRect )

    		record.rect.y = y
			y = y + record.rect.w

			table.insert( self.records, record )			


		-- картинка

		elseif item.image then

			local record = {}

			record.itemIdx		= i
			record.hTex			= UI:GetTex( item.image )

			record.blendMode = UI.BM_ALPHA
			if item.blend == "ALPHA" then
				record.blendMode = UI.BM_ALPHA
			elseif item.blend == "COLOR" then
				record.blendMode = UI.BM_COLOR
			end			

			-- область
			local scale = item.scale or 1			

			local rc = UI:GetResourceByHandle( record.hTex )
			local texW = rc:GetTextureWidth()
			local texH = rc:GetTextureHeight()

			local w_base = texW * ( rc:GetU1() - rc:GetU0() )
			local h_base = texH * ( rc:GetV1() - rc:GetV0() )

			local w = UI:XTo1024x768( w_base, resolution ) * scale
			local h = UI:YTo1024x768( h_base, resolution ) * scale

			record.rect = Quat( formatRect.x + ( formatRect.z - w ) * 0.5, y, w, h )
			y = y + record.rect.w

			table.insert( self.records, record )	


		-- пробел

		elseif item.space then
			y = y + UI.Credits.space * item.space

		else
			sys.log( "UI.CreditsWnd:InitRecords()[ERROR]: invalid item - neither 'text' nor 'space' nor 'image' are specified" )
		end 

	end

	if not next( self.records ) then
		return
	end

	self.numRecords = #self.records

end


--
function UI.CreditsWnd:RecalcVisibleRange()

	local firstIdx = -1
	local idxToStartSearch = self.firstVisibleIdx == -1 and 1 or self.firstVisibleIdx

	for i = idxToStartSearch, self.numRecords do
		local recordRect = self.records[ i ].rect
		if self.records_y0_screen + recordRect.y + recordRect.w > self.recordsRect_screen.y then
			firstIdx = i
			break
		end
	end

	self.firstVisibleIdx = firstIdx

	if self.firstVisibleIdx == -1 then
		self.lastVisibleIdx = -1
		return false
	end	

	if self.lastVisibleIdx < self.firstVisibleIdx then
		self.lastVisibleIdx = self.firstVisibleIdx
	end

	local layer_y1 = self.recordsRect_screen.y + self.recordsRect_screen.w

	for i = self.lastVisibleIdx, self.numRecords do
		local recordRect = self.records[ i ].rect
		if self.records_y0_screen + recordRect.y < layer_y1 then
			self.lastVisibleIdx = i
		else
			break
		end
	end	

	return true

end


--
function UI.CreditsWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.RECORDS then
		self:DrawRecords()
	end

end


--
function UI.CreditsWnd:DrawRecords()

	if self.firstVisibleIdx == -1 then
		return
	end

	local maskRect_top = UI:QuatCopyStable( self:ToScreen( self:GetLayerRect( self.layers.MASK_TOP ) ) )
	local maskRect_btm = UI:QuatCopyStable( self:ToScreen( self:GetLayerRect( self.layers.MASK_BOTTOM ) ) )

	-- текст

	UI.drawer:EndUiDrawing()
	-- таки снепим текст по оси-y так как для текущего
	-- шрифта (с контрастными одно-пиксельными элементами) так выглядит значительно лучше
	local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
	_G.SetTextPixelSnapping( true, false )

	_G.Font_BeginMask2(
		self:GetTexture( self.layers.MASK_TOP ),
		self:GetTexture( self.layers.MASK_BOTTOM ), 
		maskRect_top,
		maskRect_btm
	)		

    	for i = self.firstVisibleIdx, self.lastVisibleIdx do
			local record = self.records[ i ]

			if record.text then

    			local formatRect = UI:QuatCopy( record.rect )
    			formatRect.y = formatRect.y + self.records_y0_screen

				local clipRect = UI:QuatCopy( formatRect )

				local asc = _G.GetFontExtraAscenderWithOutlineRel( record.hFont )
				local desc = _G.GetFontExtraDescenderWithOutlineRel( record.hFont )

				clipRect.y = clipRect.y - asc
				clipRect.w = clipRect.w + asc + desc

        		_G.UI_DrawText(
           			record.text,
           			record.hFont,
           			formatRect,
    				record.color,
					0,
        			record.formatFlags,
           			clipRect
        		)
			end
    	end

	_G.Font_EndMask()
	
	_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )
	UI.drawer:BeginUiDrawing()


	-- картинки

	UI.drawer:BeginMask2(
		self:GetTexture( self.layers.MASK_TOP ),
		self:GetTexture( self.layers.MASK_BOTTOM ), 
		maskRect_top,
		maskRect_btm
	)

    	for i = self.firstVisibleIdx, self.lastVisibleIdx do
			local record = self.records[ i ]

			if record.hTex then  

				if record.blendMode ~= UI.BM_ALPHA then
					UI.drawer:SetBlendMode( record.blendMode )
				end

    			local rect = UI:QuatCopy( record.rect )
    			rect.y = rect.y + self.records_y0_screen

            	UI.drawer:DrawImagedRect(
               		rect.x, rect.y, rect.z, rect.w,
               		rect.x, rect.y, rect.z, rect.w,
            		record.hTex,
               		UI.WHITE_COLOR,
               		0, 0, 1, 1,
					false
            	)

				if record.blendMode ~= UI.BM_ALPHA then
					UI.drawer:SetBlendMode( UI.BM_ALPHA )
				end

			end

		end

	UI.drawer:EndMask()	

end


--
function UI.CreditsWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	self:StartRecordsScroll()

end


--
function UI.CreditsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	UI.FullScreenSelectionWnd.F_OnNewFrame( self, hSender, dt_sys, dt_game )

	self:UpdateRecordsScroll( dt_sys )
	self:UpdateFadeTimer( dt_sys )

end


--
function UI.CreditsWnd:UpdateRecordsScroll( dt )

	if self.firstVisibleIdx == -1 then
		return
	end

	self.records_y0_screen = self.records_y0_screen - self.speed * dt

	if not self:RecalcVisibleRange() then
		self:ResetRecordsScroll()
		self:OnEndRecordsScroll()
	end

end


--
function UI.CreditsWnd:OnEndRecordsScroll()

	self:ProceedToNextWindow()

end


--
function UI.CreditsWnd:IsRecordsScrolling()
	                	
	return self.firstVisibleIdx ~= -1	

end


--
function UI.CreditsWnd:OnEscape()

	if self:IsInputBlocked() then
		return true
	end   	

	self:ProceedToNextWindow()

	return true

end


--
function UI.CreditsWnd:ProceedToNextWindow()

	self.fadeTimer = self.FADE_TIME_TO_BLACK

	UI:PlayGlobalSound( self.sounds.hide )

	cvars.fadeOutColor = 0xff000000
	sys.concmd( string.format( "cl_fadeout %f", self.FADE_TIME_TO_BLACK ) )

end


--
function UI.CreditsWnd:ProceedToNextWindow2()

	self.fadeTimer = -1

	cvars.fadeInColor = 0x00000000
	sys.concmd( string.format( "cl_fadein %f", self.FADE_TIME_TO_NONE ) )

	self:Hide()

	-- окно логина не теребуется показывать, т.к. оно не скрывалось

end


--
function UI.CreditsWnd:UpdateFadeTimer( dt )

	if self.fadeTimer ~= -1 then

		self.fadeTimer = self.fadeTimer - dt
		if self.fadeTimer <= 0 then

			self.fadeTimer = -1
			self:ProceedToNextWindow2()

		end

	end

end


--
function UI.CreditsWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	if self.fadeTimer ~= -1 then
		self.fadeTimer = -1
		cvars.fadeInColor = 0x00000000
		sys.concmd( string.format( "cl_fadein %f", 0 ) )
	end

end