-- ----------------------------------------------------------------------------
--
-- Workfile: tooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.TooltipWnd = {}
local ht = UI.TooltipWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.TooltipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "TooltipWnd",
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
			updatable	= false,

			effects =
			{{
				defName 			= "tooltip",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           		
           			{
           				objName		= "title",
						layer		= "UI.TooltipWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "text",
						layer		= "UI.TooltipWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
		},

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,

			layerStyle	= UI.WLS_OWNERDRAW,
   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 10, 5 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 
	}
}


-- ------------------------------
-- interface functions
-- ------------------------------

-- предварительно должен быть добавлен чайлдом к родительскому окну 
function UI.TooltipWnd:Setup( tooltipData, bRestorePos )

	if type( tooltipData ) ~= "table" then
		sys.log( "UI.TooltipWnd:Setup()[ERROR]: invalid type of the 1-st param (\"tooltipData\"); \"table\" expected, got \"%s\"", type( tooltipData ) )
		return
	end

	if type( tooltipData.text ) ~= "string" or type( tooltipData.caption ) ~= "string" then
		sys.log( "UI.TooltipWnd:Setup()[ERROR]: invalid tooltipData format; usage: { text = <string>, caption = <string> }" )
		return
	end

	if bRestorePos ~= nil then
		if type( bRestorePos ) ~= "boolean" then
			sys.log( "UI.TooltipWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"bRestorePos\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bRestorePos ) )
			bRestorePos = nil
		end
	end

	if bRestorePos == nil then
		bRestorePos = false
	end

	self.metaText:SetText( tooltipData.text, true )
	self:SetText( tooltipData.caption, self.layers.CAPTION )

	self:RecalcLayout()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then

		local bNeedReplace = false

		if not bRestorePos then
			bNeedReplace = true
		else
			local rect = self:GetRect()
			if not( rect.x >= 0 and rect.x + rect.w <= 1024 and rect.y >= 0 and rect.y + rect.w <= 768 ) then
				bNeedReplace = true
			end
		end

		if bNeedReplace then
			UI:PlaceTooltipOnScreen( self, tooltipData )
		end

	end

end


--
function UI.TooltipWnd:GetTextColor()

	return self:GetColor( self.layers.TEXT )

end



--
function UI.TooltipWnd:GetCaptionColor()

	return self:GetColor( self.layers.CAPTION )

end


-- ------------------------------
-- const
-- ------------------------------

ht.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    TEXT		= 2,
}

ht.effectInfo =
{
	main =
	{
		minSelfHeightObjName	= "dist_min_win",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

ht.metaText	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.TooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:UnlinkWnd( self:GetUiHandle(), "self" )
	end

	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), true )

end


--
function UI.TooltipWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.TooltipWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfHeight 	= mainEffect:GetObjSize( "self" ).y
	local minSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.minSelfHeightObjName ).y
	local maxTextRect		= self:GetLayerRect( self.layers.TEXT )
	local space_text_bottom	= maxSelfHeight - ( maxTextRect.y + maxTextRect.w )

	local fp = self.metaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )
	
	local textHeight = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		fp.hFont,
   		formatRect,
   		fp.formatFlags,
   		formatRect ).w

	local selfHeight = maxTextRect.y + textHeight + space_text_bottom
	selfHeight = UI:Clamp( selfHeight, minSelfHeight, maxSelfHeight )
	
	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

end


--
function UI.TooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.TooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.TooltipWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.TooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- --------------------------------------------------------------
-- инстанс общего тултипа
-- --------------------------------------------------------------

UI.TooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "TooltipWnd",

    	props =
    	{
    		name		= "TooltipWnd_shared",
    	},	
	}
}
