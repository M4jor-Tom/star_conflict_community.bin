-- ----------------------------------------------------------------------------
-- UI.PagesWnd
-- ----------------------------------------------------------------------------

UI.PagesWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.PagesWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "PagesWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "pages_main",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.PagesWnd:Setup( numPages, selPageIdx )

	self:Reset()

	if selPageIdx ~= -1 then
		if selPageIdx < 1 or selPageIdx > numPages then
			sys.log( "UI.PagesWnd:Setup()[ERROR]: invalid page %d", selPageIdx )
			selPageIdx = -1
		end
	end

	self.numPages	= numPages
	self.selPageIdx	= selPageIdx

	self:FullUpdate()

end


--
function UI.PagesWnd:Reset()

	self.numPages	= 0
	self.selPageIdx	= -1

	self:ResetSlots()
	self:UpdateArrows()

end


--
function UI.PagesWnd:SetSelPage( selPageIdx )

	if selPageIdx == self.selPageIdx then
		return
	end

	if selPageIdx ~= -1 then
		if selPageIdx < 1 or selPageIdx > self.numPages then
			sys.log( "UI.PagesWnd:SetSelPage()[ERROR]: invalid page %d", selPageIdx )
			return
		end
	end

	local oldSelPageIdx = self.selPageIdx
	self.selPageIdx = selPageIdx

	if oldSelPageIdx ~= -1 then
		local oldSelSlot = self.curSlots[ oldSelPageIdx ] 
		if oldSelSlot then
			oldSelSlot:Select( false )
		end
	end

	if self.selPageIdx ~= -1 then
		local newSelSlot = self.curSlots[ self.selPageIdx ] 
		if newSelSlot then
			newSelSlot:Select( true )
		end
	end

	self:UpdateArrows()
	
end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.PagesWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.PagesWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "page_",
		leftArrowLocator	= "arow_left",
		rightArrowLocator	= "arow_right",
	}
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.PagesWnd.numPages				= 0
UI.PagesWnd.selPageIdx				= -1
UI.PagesWnd.allSlots				= {}
UI.PagesWnd.curSlots				= {}
UI.PagesWnd.slotsX					= 0
UI.PagesWnd.slotsY					= 0
UI.PagesWnd.dist_slots				= 0
UI.PagesWnd.dist_slots_rightArrow	= 0
UI.PagesWnd.leftArrow				= nil
UI.PagesWnd.rightArrow				= nil

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.PagesWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.allSlots	= {}
	self.curSlots	= {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.PagesWnd:CreateControls()

	self.leftArrow	= UI:CreateChildWnd( self, UI.Pages_LeftArrowBtn, "" )
	self.rightArrow	= UI:CreateChildWnd( self, UI.Pages_RightArrowBtn, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.leftArrow, mainEffect, self.effectInfo.main.leftArrowLocator, UI.EffectAnimParams.POS )

	self:AddChild( self.rightArrow )

end


--
function UI.PagesWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()		
	end

	self.curSlots = {}

end


--
function UI.PagesWnd:FullUpdate()

	self:ResetSlots()

	for pageIdx = 1, self.numPages do

		local slotWnd = self:ObtainFreeSlot()
		slotWnd:Setup( pageIdx, pageIdx == self.selPageIdx )

	end

	self:UpdateArrows()

	self:RecalcLayout()

end


--
function UI.PagesWnd:ObtainFreeSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end 

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlot()
	end

	self:AddChild( freeSlotWnd )
	table.insert( self.curSlots, freeSlotWnd )

	return freeSlotWnd

end


--
function UI.PagesWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Pages_SlotWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	slotWnd:SetTop( self.slotsY )

	return slotWnd

end


--
function UI.PagesWnd:UpdateArrows()

	self.leftArrow:Enable( self.selPageIdx > 1 )
	self.rightArrow:Enable( self.selPageIdx ~= -1 and self.selPageIdx < self.numPages )

end


--
function UI.PagesWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local lastSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 3 ) ) or Vec2( 0, 0 )
	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local rightArrowPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.rightArrowLocator ) or Vec2( 0, 0 )

	self.slotsX					= firstSlotPos.x
	self.slotsY					= firstSlotPos.y
	self.dist_slots				= secondSlotPos.x - firstSlotPos.x
	self.dist_slots_rightArrow	= rightArrowPos.x - lastSlotPos.x

	self:SetHeight( selfSize.y )	
	self.rightArrow:SetTop( rightArrowPos.y )

end


--
function UI.PagesWnd:RecalcLayout()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		local slotX = self.slotsX + ( slotIdx - 1 ) * self.dist_slots
		slotWnd:SetLeft( UI:XRel2Snapped( slotX ) )
	end

	local lastSlotWnd = self.curSlots[ #self.curSlots ]
	local rightArrowX = lastSlotWnd:GetLeft() + self.dist_slots_rightArrow
	self.rightArrow:SetLeft( rightArrowX )

	local selfWidth = rightArrowX + self.rightArrow:GetWidth()
	self:SetWidth( selfWidth )

end


-- ----------------------------------------------------------------------------
-- UI.Pages_SlotWnd
-- ----------------------------------------------------------------------------

UI.Pages_SlotWnd = {}

-- -----------------------------------------
-- work functions
-- -----------------------------------------

local l_numBaseCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.Pages_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	PAGE_NUM	= 2,
}

UI.Pages_SlotWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Pages_SlotWnd",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,			
	},

	layers =
	{
		numLayers = l_numBaseCheckBoxLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "pages_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "price",
						layer		= "UI.Pages_SlotWnd.layers.PAGE_NUM",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PAGE_NUM
		{
			id				= UI.Pages_SlotWnd.layers.PAGE_NUM,

			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.Pages_SlotWnd:Setup( pageIdx, bSelected )

	self.pageIdx	= pageIdx
	self.bSelected	= bSelected

	self:FullUpdate()

end


--
function UI.Pages_SlotWnd:Select( bSelected )

	self.bSelected	= bSelected
	self:FullUpdate()

end


--
function UI.Pages_SlotWnd:Reset()

	self.pageIdx	= -1
	self.bSelected	= false

	self:Check( false )

	self:SetText( "", self.layers.PAGE_NUM )

end


--
function UI.Pages_SlotWnd:GetPage()

	return self.pageIdx

end


--
function UI.Pages_SlotWnd:IsSelected()

	return self.bSelected

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.Pages_SlotWnd.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "idle",
	},

	main_checked =
	{
		animationIdle 		= "sel",
		animationSelect		= "sel",
		animationPressed	= "sel",
		animationDisabled	= "sel",
	},
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.Pages_SlotWnd.pageIdx	= -1
UI.Pages_SlotWnd.bSelected	= false

-- -----------------------------------------
-- work fucntions
-- -----------------------------------------

--
function UI.Pages_SlotWnd:FullUpdate()

	self:Check( self.bSelected )

	self:SetText( tostring( self.pageIdx ), self.layers.PAGE_NUM )

end


-- ----------------------------------------------------------------------------
-- UI.Pages_LeftArrowBtn, UI.Pages_RightArrowBtn
-- ----------------------------------------------------------------------------

--
UI.Pages_LeftArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Pages_LeftArrowBtn",
			selectSound	= UI.sounds.btnMouseOver,
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
    				defName 			= "pages_leftArrow",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
		}
	},

	effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
    	},
    }
}


--
UI.Pages_RightArrowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "Pages_RightArrowBtn",
			selectSound	= UI.sounds.btnMouseOver,
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
    				defName 			= "pages_rightArrow",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}}
    		},
		}
	},

	effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",   
    		animationSelect			= "over",   
    		animationPressed		= "press",  
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",   
    		animationSelect_focus	= "over",   
    		animationPressed_focus	= "press",  
    	},
    }
}
