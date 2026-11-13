-- ----------------------------------------------------------------------------
--
-- Workfile: effecttextboxwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.EffectTextBoxWnd = {}
local tb = UI.EffectTextBoxWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.EffectTextBoxWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "EffectTextBoxWnd",
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
function UI.EffectTextBoxWnd:SetScrollText( text )

	self:SetText( text, self.layers.TEXT )

	self.numStrings = self:DetectNumStrings()

	self:SetLayerHeight( self.numStrings * self.stringH, self.layers.TEXT )

	self:UpdateScrollBarVisibility()

	if self.numStrings > 0 then
		self:ScrollHome()
	else
		self:SetFirstVisibleString( -1 )
	end

end


--
function UI.EffectTextBoxWnd:Reset()

	self:SetText( "", self.layers.TEXT )
	self.numStrings = 0

	self:SetFirstVisibleString( -1 )

	self:UpdateScrollBarVisibility()

end 


--
function UI.EffectTextBoxWnd:Scroll( bForward, numStrings )

	self:ScrollVisibleRange( bForward, numStrings )

end


--
function UI.EffectTextBoxWnd:ScrollHome()

	if self.numStrings == 0 then
		return
	end

	self:SetFirstVisibleString( 1 )

end


--
function UI.EffectTextBoxWnd:ScrollEnd()

	if self.numStrings == 0 then
		return
	end

	self:SetLastVisibleString( self.numStrings )

end


--
function UI.EffectTextBoxWnd:HasScrollBar()

	return self.scrollBar:IsChildOf( self )

end


--
function UI.EffectTextBoxWnd:GetVisibleRange()

	return self.firstVisibleStringIdx, self:GetLastVisibleStringIdx()

end


--
function UI.EffectTextBoxWnd:GetNumStrings()

	return self.numStrings

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

tb.WHEEL_STEP = 1

-- -------------------------------
-- vars
-- -------------------------------

tb.numStrings				= 0
tb.maxVisibleStrings		= 0
tb.firstVisibleStringIdx	= -1
tb.scrollBar				= nil
tb.stringH					= 0
tb.textFieldRect			= Quat( 0, 0, 0, 0 )

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.EffectTextBoxWnd:F_PostLoad()

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
function UI.EffectTextBoxWnd:F_Shutdown()

	self:DeleteControls()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.EffectTextBoxWnd:DeleteControls()

	if self.scrollBar then
		UI:RemoveUiObj( self.scrollBar:GetUiHandle() )
		self.scrollBar = nil
	end

end      


--
function UI.EffectTextBoxWnd:InitElements()

	self:InitTextField()
	self:InitScrollBar()

end


--
function UI.EffectTextBoxWnd:InitTextField()	

	self.textFieldRect = UI:QuatCopyStable( self:GetLayerRect( self.layers.TEXT ) )

	local hFont = self:GetFont( self.layers.TEXT )

	self.stringH			= _G.GetFontLineHeight( hFont )
	self.maxVisibleStrings	= math.floor( self.textFieldRect.w / self.stringH )

	local effect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if effect then
		local handle = self:GetUiHandle()
		effect:UnlinkLayer( handle, self.layers.TEXT, self.effectInfo.main.textObjName )
		effect:LinkLayer( handle, self.layers.TEXT, self.effectInfo.main.textObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	end

end


--
function UI.EffectTextBoxWnd:InitScrollBar()

	if self.scrollBarPrototypeName == "" then
		return
	end

	self.scrollBar = UI:CreateChildWnd( self, UI[ self.scrollBarPrototypeName ], "" )	
	if not self.scrollBar then
		return
	end

	self.scrollBar:SetPageSize( self.maxVisibleStrings )

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

	self:UpdateScrollBarVisibility()

end


--
function UI.EffectTextBoxWnd:SetFirstVisibleString( stringIdx, bUpdateScrollBar )

	self.firstVisibleStringIdx = stringIdx
	self:UpdateOnChangeVisibleRange( bUpdateScrollBar )

end


--
function UI.EffectTextBoxWnd:SetLastVisibleString( stringIdx, bUpdateScrollBar )

	local firstVisibleStringIdx = -1

	if stringIdx ~= -1 then
		firstVisibleStringIdx = math.max( stringIdx - self.maxVisibleStrings + 1, 1 )
	end

	self:SetFirstVisibleString( firstVisibleStringIdx, bUpdateScrollBar )

end


--
function UI.EffectTextBoxWnd:GetLastVisibleStringIdx()

	if self.firstVisibleStringIdx == -1 then
		return -1
	end

	return self.firstVisibleStringIdx + math.min( self.numStrings, self.maxVisibleStrings ) - 1

end


--
function UI.EffectTextBoxWnd:UpdateOnChangeVisibleRange( bUpdateScrollBar )

	if bUpdateScrollBar == nil then
		bUpdateScrollBar = true
	end

	if bUpdateScrollBar then
		self:UpdateScrollBarPos()
	end

	self:UpdateTextLayerOnChangeVisibleRange()

	UI:SendUiEvent( UI.EV_VISIBLE_RANGE_CHANGED, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.EffectTextBoxWnd:UpdateScrollBarVisibility()	

	local bNeedScrollBar = self.numStrings > self.maxVisibleStrings

	if bNeedScrollBar then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollObjName, UI.EffectAnimParams.POS )
		end

		self:UpdateScrollBarRange()
		self:UpdateScrollBarPos()

	else

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
		end	

		self:RemoveChild( self.scrollBar )

	end

end


--
function UI.EffectTextBoxWnd:UpdateScrollBarRange()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	self.scrollBar:SetRange( 0, math.max( 0, self.numStrings - self.maxVisibleStrings ) )

end


--
function UI.EffectTextBoxWnd:UpdateScrollBarPos()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	local pos = self.firstVisibleStringIdx - 1
	self.scrollBar:SetPos( pos )

end


--
function UI.EffectTextBoxWnd:ScrollVisibleRange( bForward, numStrings )

	if self.firstVisibleStringIdx == -1 then
		return
	end

	if self.numStrings <= self.maxVisibleStrings then
		return
	end

	if not numStrings then
		numStrings = 1
	end

	local nextStringIdx = self.firstVisibleStringIdx + ( bForward and numStrings or -numStrings )

	nextStringIdx = UI:Clamp( nextStringIdx, 1, self.numStrings - self.maxVisibleStrings + 1 )
	if nextStringIdx == self.firstVisibleStringIdx then
		return
	end


	self:SetFirstVisibleString( nextStringIdx )

end


--
function UI.EffectTextBoxWnd:UpdateVisibleRangeFromScrollBar()

	if self.numStrings == 0 then
		return
	end

	local pos = self.scrollBar:GetPos()

	local firstStringIdx = UI:Clamp( math.floor( pos ) + 1, 1, self.numStrings )
	self:SetFirstVisibleString( firstStringIdx, false )

end


--
function UI.EffectTextBoxWnd:StringIdx2VisibleIdx( stringIdx )

	return stringIdx - self.firstVisibleStringIdx + 1

end


--
function UI.EffectTextBoxWnd:VisibleIdx2StringIdx( visibleIdx )

	return self.firstVisibleStringIdx + visibleIdx - 1

end


--
function UI.EffectTextBoxWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:UpdateVisibleRangeFromScrollBar()

end


--
function UI.EffectTextBoxWnd:UpdateTextLayerOnChangeVisibleRange()

	if self.firstVisibleStringIdx == -1 then
		return
	end

	local y = self.textFieldRect.y - ( self.firstVisibleStringIdx - 1 ) * self.stringH
	self:SetLayerTop( y, self.layers.TEXT )

end


--
function UI.EffectTextBoxWnd:DetectNumStrings()

    local formatRect = UI:Quat( 0, 0, self.textFieldRect.z, 100000 )
	
    return _G.GetStringsNumber(
		self:GetText( self.layers.TEXT ),
		self:GetFont( self.layers.TEXT ),
		formatRect,
		self:GetTextFormatFlags( self.layers.TEXT ),
		formatRect
	)
	
end


--
function UI.EffectTextBoxWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self:DrawLayer( UI:Quat( x0, y0, width, height ), self:ToScreen( self.textFieldRect ), layerIdx )
	end

end


--
function UI.EffectTextBoxWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end	

	self:Scroll( ticks < 0, math.abs( ticks ) * self.WHEEL_STEP )
	return false

end