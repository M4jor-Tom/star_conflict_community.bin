-- ----------------------------------------------------------------------------
--
-- Workfile: effecttextbox2wnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

-- плавное скроллирование (в отличие от UI.EffectCheckBoxWnd, где построчное скроллирование)

UI.EffectTextBox2Wnd = {}
local tb = UI.EffectTextBox2Wnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.EffectTextBox2Wnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "EffectTextBox2Wnd",
		isPrototype		= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatInfoSz= { 20, 3 },
   			formatFlags	= FONT.TF_FULL + FONT.TF_TOP + FONT.TF_WORDBREAK,
   			font =
			{
   				fontName = "Small",
   			},
		},
	}, 
}


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.EffectTextBox2Wnd:SetScrollText( text )

	self:SetText( text, self.layers.TEXT )
	self:UpdateTextLayerHeight()	

	self:UpdateScrollBar()

	if self:HasScrollBar() then
		self:SetScrollPos( 0 )
	else
		self:UpdateTextLayerPos()
	end

end


--
function UI.EffectTextBox2Wnd:Reset()

	self:SetScrollText( "" )

end 


--
function UI.EffectTextBox2Wnd:Scroll( deltaPix )

	if not self:HasScrollBar() then
		return
	end

	self:SetScrollPos( self:GetScrollPos() + deltaPix )

end


--
function UI.EffectTextBox2Wnd:ScrollHome()

	if self:HasScrollBar() then
		self:SetScrollPos( 0 )
	end

end


--
function UI.EffectTextBox2Wnd:ScrollEnd()

	if self:HasScrollBar() then
		self:SetScrollPos( self:GetScrollMax() )
	end

end


--
function UI.EffectTextBox2Wnd:HasScrollBar()

	return self.scrollBar ~= nil and self.scrollBar:IsChildOf( self )

end


--
function UI.EffectTextBox2Wnd:GetScrollPos()

	if self:HasScrollBar() then
		return self.scrollBar:GetPos()
	else
		return 0
	end
	
end


--
function UI.EffectTextBox2Wnd:SetScrollPos( scrollPos )

	if self:HasScrollBar() then
		self.scrollBar:SetPos( scrollPos )
	end

end


--
function UI.EffectTextBox2Wnd:GetScrollMax()

	local max = 0
	
	if self:HasScrollBar() then
		max = self.scrollBar:GetMax()
	end
	
	return max
	
end


--
function UI.EffectTextBox2Wnd:GetScrollTextColor()

	return self:GetColor( self.layers.TEXT )

end


-- -------------------------------
-- const
-- -------------------------------

tb.layers =
{
    MAIN_EFFECT		= 0,
	TEXT			= 1,		
}

tb.effectInfo =
{
	main =
	{
		scrollObjName		= "",
		textObjName			= ""
	}
}

tb.scrollBarPrototypeName = ""

-- -------------------------------
-- vars
-- -------------------------------

tb.scrollBar				= nil
tb.textFieldRect			= Quat( 0, 0, 0, 0 )
tb.step						= 0

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.EffectTextBox2Wnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.textFieldRect = Quat( 0, 0, 0, 0 )

	self:InitElements()

	local uiHandle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.EffectTextBox2Wnd:F_Shutdown()

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.EffectTextBox2Wnd:DeleteControls()

	if self.scrollBar then
		UI:RemoveUiObj( self.scrollBar:GetUiHandle() )
		self.scrollBar = nil
	end

end      


--
function UI.EffectTextBox2Wnd:InitElements()

	self.stepSize = _G.GetFontLineHeight( self:GetFont( self.layers.TEXT ) )

	self:InitTextField()
	self:InitScrollBar()

end


--
function UI.EffectTextBox2Wnd:InitTextField()	

	self.textFieldRect = UI:QuatCopyStable( self:GetLayerRect( self.layers.TEXT ) )

	local effect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if effect then
		local handle = self:GetUiHandle()
		effect:UnlinkLayer( handle, self.layers.TEXT, self.effectInfo.main.textObjName )
		effect:LinkLayer( handle, self.layers.TEXT, self.effectInfo.main.textObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	end

end


--
function UI.EffectTextBox2Wnd:InitScrollBar()

	if self.scrollBarPrototypeName == "" then
		return
	end

	self.scrollBar = UI:CreateChildWnd( self, UI[ self.scrollBarPrototypeName ], "" )	
	if not self.scrollBar then
		return
	end

	self.scrollBar:SetPageSize( self.textFieldRect.w )
	self.scrollBar:SetStepSize( self.stepSize )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local scrollEffect = nil
	if self.scrollBar then
		scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	end

	if not scrollEffect then
		return
	end
	
	local needSize = mainEffect:GetObjSize( self.effectInfo.main.scrollObjName )
	local baseSize = scrollEffect:GetObjSize( "self" )

	local scale_y = needSize.y / baseSize.y
	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

	self.scrollBar:SetWidth( baseSize.x )
	self.scrollBar:SetHeight( needSize.y )

	self:UpdateScrollBar()

end


--
function UI.EffectTextBox2Wnd:UpdateScrollBar()	

	local textLayerHeight = self:GetLayerHeight( self.layers.TEXT )

	local bNeedScrollBar = textLayerHeight - self.textFieldRect.w > 1e-3

	if bNeedScrollBar then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollObjName, UI.EffectAnimParams.POS )
		end

		self.scrollBar:SetRange( 0, textLayerHeight - self.textFieldRect.w )

	else

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
		end	

		self:RemoveChild( self.scrollBar )

	end

end


--
function UI.EffectTextBox2Wnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateTextLayerPos()

end


--
function UI.EffectTextBox2Wnd:UpdateTextLayerPos()

	local textLayerY = -self:GetScrollPos() + self.textFieldRect.y
	self:SetLayerTop( textLayerY, self.layers.TEXT )

end


--
function UI.EffectTextBox2Wnd:UpdateTextLayerHeight()

    local formatRect = UI:Quat( 0, 0, self.textFieldRect.z, 100000 )

    local textHeight = _G.MeasureText(
   		self:GetText( self.layers.TEXT ),
   		self:GetFont( self.layers.TEXT ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.TEXT ),
    	formatRect ).w

	self:SetLayerHeight( textHeight, self.layers.TEXT )

end


--
function UI.EffectTextBox2Wnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self:DrawLayer( UI:Quat( x0, y0, width, height ), self:ToScreen( self.textFieldRect ), layerIdx )
	end

end


--
function UI.EffectTextBox2Wnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end	

	self:Scroll( -ticks * self.stepSize )
	return false

end