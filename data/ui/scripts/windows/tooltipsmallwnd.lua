-- ----------------------------------------------------------------------------
--
-- Workfile: tooltipsmallwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.TooltipSmallWnd = {}
local ht = UI.TooltipSmallWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.TooltipSmallWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "TooltipSmallWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "tooltipSmall",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},           		

           			{
           				objName		= "text",
						layer		= "UI.TooltipSmallWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           		}
			}}		
		},

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 
	}
}


-- ------------------------------
-- interdace functions
-- ------------------------------

-- предварительно должен быть добавлен чайлдом к родительскому окну 
function UI.TooltipSmallWnd:Setup( tooltipData, bRestorePos )

	if type( tooltipData ) ~= "table" then
		sys.log( "UI.TooltipSmallWnd:Setup()[ERROR]: invalid type of the 1-st param (\"tooltipData\"); \"table\" expected, got \"%s\"", type( tooltipData ) )
		return
	end

	if type( tooltipData.text ) ~= "string" then
		sys.log( "UI.TooltipSmallWnd:Setup()[ERROR]: invalid tooltipData format; usage: { text = <string> }" )
		return
	end

	if bRestorePos ~= nil then
		if type( bRestorePos ) ~= "boolean" then
			sys.log( "UI.TooltipSmallWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"bRestorePos\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bRestorePos ) )
			bRestorePos = nil
		end
	end

	if bRestorePos == nil then
		bRestorePos = false
	end

	self.metaText:SetText( tooltipData.text, true )

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
function UI.TooltipSmallWnd:GetTextColor()

	return self:GetColor( self.layers.TEXT )

end

-- ------------------------------
-- const
-- ------------------------------

ht.layers =
{
    MAIN_EFFECT	= 0,
    TEXT		= 1,
}

ht.effectInfo =
{
	main =
	{
		minSelfWidthObjName	= "dist_min_win",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

ht.metaText	= UI.MetaText.GetNewInstance()

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.TooltipSmallWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:UnlinkWnd( self:GetUiHandle(), "self" )
	end

	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( 1000000, self:GetLayerHeight( self.layers.TEXT ) ), true )

end


--
function UI.TooltipSmallWnd:F_Shutdown()

	self.metaText:Clear()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.TooltipSmallWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfWidth 		= mainEffect:GetObjSize( "self" ).x
	local minSelfWidth 		= mainEffect:GetObjSize( self.effectInfo.main.minSelfWidthObjName ).x
	local maxTextRect		= self:GetLayerRect( self.layers.TEXT )
	local space_text_right	= maxSelfWidth - ( maxTextRect.x + maxTextRect.z )

	local fp = self.metaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )
	
	local textWidth = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		fp.hFont,
   		formatRect,
   		fp.formatFlags,
   		formatRect ).z

	local selfWidth = maxTextRect.x + textWidth + space_text_right
	selfWidth = UI:Clamp( selfWidth, minSelfWidth, maxSelfWidth )
	
	self:SetWidth( selfWidth )

	local animTime = ( selfWidth - minSelfWidth ) / ( maxSelfWidth - minSelfWidth )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

end


--
function UI.TooltipSmallWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.TooltipSmallWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.TooltipSmallWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.TooltipSmallWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end