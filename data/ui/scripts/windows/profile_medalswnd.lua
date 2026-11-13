-- ----------------------------------------------------------------------------
--
-- Workfile: profile_medalswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------
-- UI.Profile_MedalsWnd
-- -----------------------------------------------------------------

UI.Profile_MedalsWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Profile_MedalsWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "Profile_MedalsWnd",
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
				defName				= "profile_medals",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "area",	
						layer		= "UI.Profile_MedalsWnd.layers.MASK",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS,
					},

					{
						objName		= "scroll_max",	
						wnd			= "UI.ProfileMedals_ScrollBarWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MASK
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "notificationsMask",
			visible		= false,
		},
	},

	children = { "UI.ProfileMedals_ScrollBarWnd" }
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.Profile_MedalsWnd.layers = 
{
	MAIN_EFFECT				= 0,
	MASK					= 1,
}


UI.Profile_MedalsWnd.effectInfo =
{
	main = 
	{
		firstSlotLocator 				= "slot_1",
		secondSlotLocator 				= "slot_2",
		scrollBarLocator 				= "scroll_max",
	}
}

UI.Profile_MedalsWnd.sounds = 
{
	main = 
	{
		itemsScrollRange				= "sound/ui/btnMouseOver",
	}
}

UI.Profile_MedalsWnd.SCROLL_SPEED = 50

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Profile_MedalsWnd.categoriesWnd = {}
UI.Profile_MedalsWnd.scrollBar	= nil
UI.Profile_MedalsWnd.requestId = nil

UI.Profile_MedalsWnd.slotsLeft = 0
UI.Profile_MedalsWnd.slotsTop = 0
UI.Profile_MedalsWnd.slotsSpace = 0
UI.Profile_MedalsWnd.inited = false


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Profile_MedalsWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if requestId == self.requestId then
		if result ~= 0 then
			-- TODO: error handling
			--self.achievements = {}
		else
			--self.achievements = UI.Profile:GetAchievements()
			self:ReloadMedalsList( true )
		end
		--UI.Profile_Wnd:ShowWait( false )
	end

end


--
function UI.Profile_MedalsWnd:Update( uid )

	--self:SetScrollPos( 2, true )

	if not self.inited then
		self:Init()
		self.inited = true
	end

	for i = 1, #self.categoriesWnd do
		--self.categoriesWnd[ i ]:AddStyle( UI.WS_NOT_DRAW )
		self:RemoveChild( self.categoriesWnd[ i ] )
	end

	local requestId = UI.Profile:RequestMedals( uid )
	if requestId then
		self.requestId = requestId
	end
	local medals = UI.Profile:GetMedals()
	UI.LeaderboardWnd:ShowWait( true )
	--self:SetScrollBarVisible( false )
	if requestId == nil and medals then
		self:ReloadMedalsList( false )
	else
		-- async wait
	end

end

-- ------------------------------
-- work functions
-- ------------------------------

--
--[[function UI.Profile_MedalsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	for i = 1, #self.categoriesWnd do
		self.categoriesWnd[ i ]:OnAfterShowOnScreen()
		self.categoriesWnd[ i ].lines[ 1 ]:OnAfterShowOnScreen()
	end

	if self:GetScrollPos() == 1 then
		self:SetScrollPos( 2, true )
		self:SetScrollPos( 1, true )
	else
		self:SetScrollPos( 1, true )
	end

end]]

--
--[[function UI.Profile_MedalsWnd:F_OnNewFrame()

	if self.show == 100 then
		self.show = nil
		self:SetScrollPos( 1, true )
		self:SetScrollBarVisible( true )
		UI.Profile_Wnd:ShowWait( false )
		for i = 1, #self.categoriesWnd do
			--self.categoriesWnd[ i ]:RemoveStyle( UI.WS_NOT_DRAW )
			self:AddChild( self.categoriesWnd[ i ] )
		end
	elseif self.show ~= nil then
		self.show = self.show + 1
	end


end]]

--
function UI.Profile_MedalsWnd:ReloadMedalsList( needShowChild )

	--if needShowChild then
	--end

	--self:SetScrollBarVisible( true )
	for i = 1, #self.categoriesWnd do
		--self.categoriesWnd[ i ]:RemoveStyle( UI.WS_NOT_DRAW )
		self:AddChild( self.categoriesWnd[ i ] )
	end

	for i = 1, #self.categoriesWnd do
		self.categoriesWnd[ i ]:Update()
	end

	self:SetScrollPos( 1, true )

	UI.LeaderboardWnd:ShowWait( false )
	--UI.Profile_Wnd:ShowWait( false )
	--self:SetScrollBarVisible( false )
	--self.show = 1

	--self:FullUpdate()

end

--
function UI.Profile_MedalsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local firstLocatorPos = mainEffect:GetObjPos( self.effectInfo.main.firstSlotLocator )
	local firstLocatorSize = mainEffect:GetObjSize( self.effectInfo.main.firstSlotLocator )
	local secondLocatorPos = mainEffect:GetObjPos( self.effectInfo.main.secondSlotLocator )
	self.slotsLeft = firstLocatorPos.x
	self.slotsTop = firstLocatorPos.y
	self.slotsSpace = secondLocatorPos.y - ( firstLocatorPos.y + firstLocatorSize.y )

	self:InitScrollBar()
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.Profile_MedalsWnd:Init()

	for k, v in pairs( MedalsInfo.categories ) do
		self:AddCategory( v.name )
	end
	self.slotsTop = self.slotsTop + self.slotsSpace
	self:UpdateScrollRange()

end

--
function UI.Profile_MedalsWnd:AddCategory( categoryName )

	self.categoriesWnd[ #self.categoriesWnd + 1 ] = UI:CreateChildWnd( self, UI.ProfileMedals_CategoryWnd, tostring( #self.categoriesWnd + 1 ) )
	self.categoriesWnd[ #self.categoriesWnd ]:Init( categoryName )
	self.categoriesWnd[ #self.categoriesWnd ]:SetLeft( self.slotsLeft )
	self.categoriesWnd[ #self.categoriesWnd ]:SetTop( self.slotsTop )
	self.categoriesWnd[ #self.categoriesWnd ].defaultHeight = self.slotsTop
	self.slotsTop = self.slotsTop + self.categoriesWnd[ #self.categoriesWnd ]:GetHeight() + self.slotsSpace
	self:AddChild( self.categoriesWnd[ #self.categoriesWnd ] )

end

--
function UI.Profile_MedalsWnd:GetMaskParam()

	local maskRect = self:ToScreen( self:GetLayerRect( self.layers.MASK ) )
	local hTexMask = self:GetTexture( self.layers.MASK )
	return maskRect, hTexMask

end

--
function UI.Profile_MedalsWnd:InitScrollBar()

	self.scrollBar = UI.ProfileMedals_ScrollBarWnd

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if not scrollEffect then
		return
	end

	local needSize = mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator ).y
	local baseSize = scrollEffect:GetObjSize( "self" ).y

	scrollEffect:SetScale( UI:Vec2( 1, needSize / baseSize ) )
	self.scrollBar:SetHeight( needSize )

end

--
function UI.Profile_MedalsWnd:SetScrollBarVisible( bVisible )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if bVisible then
		--if not self.scrollBar:IsChildOf( self ) then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.POS )		
		--end
	else
		if self.scrollBar:IsChildOf( self ) then
    		self.scrollBar:UnlinkFromParent()
    		if mainEffect then
    			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
    		end
		end
	end

end

--
function UI.Profile_MedalsWnd:FullUpdate()

	--self:UpdateScrollRange()
	self:SetScrollPos( 1--[[self:GetMaxScrollPos()]], true )

end

--
function UI.Profile_MedalsWnd:UpdateScrollRange()

	local min = -1
	local max = -1

	local maskHeight = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ):GetObjSize( "area" ).y
	min = 1--UI.Notifications:GetFirstNotificationId()
	max = ( self.slotsTop - maskHeight ) / self.SCROLL_SPEED + 1

	if self.scrollBar and max then
		self.scrollBar:SetRange( min, max )
		self:UpdateScrollBarVisibility()
	end

	return 

end

--
function UI.Profile_MedalsWnd:UpdateScrollBarVisibility()

	local needScrollBar = math.abs( self:GetScrollPos() - self:GetMaxScrollPos() ) > 1e-3	-- TODO: what?
	self:SetScrollBarVisible( needScrollBar )	

end


--
function UI.Profile_MedalsWnd:GetScrollPos()

	return self.scrollBar:GetPos()

end


--
function UI.Profile_MedalsWnd:GetMaxScrollPos()

	return self.scrollBar:GetMax()

end


--
function UI.Profile_MedalsWnd:GetMinScrollPos()

	return self.scrollBar:GetMin()

end

--
function UI.Profile_MedalsWnd:SetScrollPos( scrollPos, bUpdateScrollBar )

	if self.categoriesWnd then
		for i = 1, #self.categoriesWnd do
			self.categoriesWnd[ i ]:SetTop( self.categoriesWnd[ i ].defaultHeight - ( scrollPos - 1 ) * self.SCROLL_SPEED )
		end
	end

	if bUpdateScrollBar then
		self.scrollBar:SetPos( scrollPos )
	end

end

--
function UI.Profile_MedalsWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:SetScrollPos( self.scrollBar:GetPos(), false )

end


--
function UI.Profile_MedalsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		local lastPos = self:GetScrollPos()
		self:Scroll( -ticks, UI.SCROLL_SRC_WHEEL )
		if lastPos ~= self:GetScrollPos() then
			UI:PlayGlobalSound( self.sounds.main.itemsScrollRange )
		end
	end

	return true

end


--
function UI.Profile_MedalsWnd:Scroll( delta, eventSrc )

	local curPos = self.scrollBar:GetPos()
	local nextPos = curPos

	if delta > 0 then
		nextPos = math.floor( curPos + math.abs( delta ) )	

	elseif delta < 0 then
		nextPos = math.ceil( curPos - math.abs( delta ) )
	end

	self.scrollBar:SetPos( nextPos, eventSrc )

end


-- -----------------------------------------------------------------
-- UI.ProfileMedals_CategoryWnd
-- -----------------------------------------------------------------

UI.ProfileMedals_CategoryWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ProfileMedals_CategoryWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "ProfileMedals_CategoryWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		--isPrototype		= true,
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
				defName				= "profile_medals_list_slot",
				defaultAnimation    = "idle",

				links =
				{
					-- намеренно не линкуется по size
					{
						objName		= "title_1",	
						layer		= "UI.ProfileMedals_CategoryWnd.layers.TITLE_EFFECT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR,
					},

				}
			}}
		},

		-- TITLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "profile_medals_list_slot_title",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.ProfileMedals_CategoryWnd.layers.TITLE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT,
					},

				}
			}}
		},

		-- TITLE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Medium" },
		}
	},
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.ProfileMedals_CategoryWnd.layers = 
{
	MAIN_EFFECT 		= 0,
	TITLE_EFFECT		= 1,
	TITLE				= 2,
}


UI.ProfileMedals_CategoryWnd.effectInfo =
{
	workList =
	{
		firstSlotLocator	= "medals_list_1",
		secondSlotLocator	= "medals_list_2",
		widthLocator		= "self",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ProfileMedals_CategoryWnd.category = ""
--UI.ProfileMedals_CategoryWnd.lines = {}
UI.ProfileMedals_CategoryWnd.medals = {}
UI.ProfileMedals_CategoryWnd.defaultHeight = 0
UI.ProfileMedals_CategoryWnd.slotSpace = 0


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ProfileMedals_CategoryWnd:Init( category )

	self:Clear()
	self.category = category
	--self.medals = {}

	-- set text
	self:SetText( UI:GetStringByName( "profile_medals_category_"..self.category ), self.layers.TITLE )
	-- set lines
	for k,v in pairs( Medals ) do
		if v.category == self.category then
			table.insert( self.medals, k )
		end
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slot1Pos = mainEffect:GetObjPos( self.effectInfo.workList.firstSlotLocator )
	local slotLeft = slot1Pos.x
	local height = slot1Pos.y

	self.lines = {}
	local lineIndex = 1
	if self.lines[ lineIndex ] == nil then
		self.lines[ lineIndex ] = UI:CreateChildWnd( self, UI.ProfileMedalsCategory_LineWnd, tostring( lineIndex ) )
	else
		self.lines[ lineIndex ]:Clear()
	end
	self:AddChild( self.lines[ lineIndex ] )
	self.lines[ lineIndex ]:SetLeft( slotLeft )
	self.lines[ lineIndex ]:SetTop( height )

	for i = 1, #self.medals do
		for j = 1, #Medals[ self.medals[ i ] ].levels do
			if self.lines[ lineIndex ]:GetNumRecords() >= self.lines[ lineIndex ].MAX_SLOTS then
				lineIndex = lineIndex + 1
				if self.lines[ lineIndex ] == nil then
					self.lines[ lineIndex ] = UI:CreateChildWnd( self, UI.ProfileMedalsCategory_LineWnd, tostring( lineIndex ) )
					self:AddChild( self.lines[ lineIndex ] )
					self.lines[ lineIndex ]:SetLeft( slotLeft )
					self.lines[ lineIndex ]:SetTop( height )
				end
				height = height + self.lines[ lineIndex - 1 ]:GetHeight() + self.slotSpace
				self.lines[ lineIndex ]:SetLeft( slotLeft )
				self.lines[ lineIndex ]:SetTop( height )
			end
			-- data = { medalId, level, count? }
			self.lines[ lineIndex ]:AddRecord( { medalId = self.medals[ i ], level = j - 1 } )
		end
	end

	height = height + self.lines[ #self.lines ]:GetHeight() + self.slotSpace
	self:SetHeight( height )

end


--
function UI.ProfileMedals_CategoryWnd:Update()

	local medals = UI.Profile:GetMedals()
	if medals then
		local medalsCount
		local medalData
		for j = 1, #self.lines do
			for i = 1, self.lines[ j ]:GetNumRecords() do
				medalData = self.lines[ j ]:GetRecordData( i )
				if medalData then
					medalsCount = medals[ medalData.medalId ][ medalData.level + 1 ]
					if medalsCount then
						medalData.count = medalsCount
						self.lines[ j ]:SetRecordData( medalData, i )
					else
						sys.log( "UI.ProfileMedals_CategoryWnd:Update()[ERROR]: can't find medals with id %d, and level %d", medalData.medalId, medalData.level )		
					end
				else
					sys.log( "UI.ProfileMedals_CategoryWnd:Update()[ERROR]: self:GetRecordData( i ) return nil" )		
				end
			end
		end
	else
		sys.log( "UI.ProfileMedals_CategoryWnd:Update()[ERROR]: UI.Profile:GetMedals() return nil" )
	end

end


-- ------------------------------
-- work functions
-- ------------------------------


--
function UI.ProfileMedals_CategoryWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect, hTexMask = UI.Profile_MedalsWnd:GetMaskParam()

	--self:DrawLayers( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ), self.layers.MAIN_EFFECT, self:GetNumLayers() )

	UI.drawer:BeginMask( hTexMask, maskRect )
	_G.Font_BeginMask( hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

	_G.Font_EndMask()
	UI.drawer:EndMask()

end

--
function UI.ProfileMedals_CategoryWnd:Clear()

	if self.lines then
		for k,v in pairs( self.lines ) do
			if v.wnd then
				v.wnd:Reset()
				self:RemoveChild( v.wnd )
			end
		end
	end
	self.medals = {}
	self.category = ""

end

--
function UI.ProfileMedals_CategoryWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slot1Pos = mainEffect:GetObjPos( self.effectInfo.workList.firstSlotLocator )
	local slot2Pos = mainEffect:GetObjPos( self.effectInfo.workList.secondSlotLocator )
	local slotSize = mainEffect:GetObjSize( self.effectInfo.workList.firstSlotLocator )
	local selfSize = mainEffect:GetObjSize( self.effectInfo.workList.widthLocator )

	self.slotSpace = slot2Pos.y - ( slot1Pos.y + slotSize.y )
	self:SetWidth( selfSize.x )

end


-- -----------------------------------------------------------------
-- UI.ProfileMedalsCategory_LineWnd
-- -----------------------------------------------------------------

UI.ProfileMedalsCategory_LineWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ProfileMedalsCategory_LineWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "ProfileMedalsCategory_LineWnd",
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
				defName				= "profile_medals_list_slot_line",
				defaultAnimation    = "idle",

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
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.ProfileMedalsCategory_LineWnd.btnPrototypeName	= "ProfileMedalsCategoryLine_SlotWnd"

UI.ProfileMedalsCategory_LineWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
	}
}

UI.ProfileMedalsCategory_LineWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.ProfileMedalsCategory_LineWnd.MAX_SLOTS = 10




UI.ProfileMedalsCategoryLine_SlotWnd = {}
--
UI.ProfileMedalsCategoryLine_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "ProfileMedalsCategoryLine_SlotWnd",
		isPrototype		= true,
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
				defName 			= "profile_medals_list_slot_line_slot",
				defaultAnimation	= "lock",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",	
						layer		= "UI.ProfileMedalsCategoryLine_SlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Medium" },
		}
	},

}


-- -----------------------------------
-- const
-- -----------------------------------

UI.ProfileMedalsCategoryLine_SlotWnd.layers = 
{
	MAIN_EFFECT				= 0,
	COUNT					= 1,
}


-- -----------------------------------
-- vars
-- -----------------------------------

-- ------------------------------
-- interface functions
-- ------------------------------

-- ------------------------------
-- work functions
-- ------------------------------


--
function UI.ProfileMedalsCategoryLine_SlotWnd:GetTooltipData()

	local data = self:GetRecordData()
	local tooltipData = 
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:Medal2Str( data.medalId, data.level ),
		text		= UI:GetMedalDesc( data.medalId, data.level ),	
	}
	return tooltipData

end

--
--[[function UI.ProfileMedalsCategoryLine_SlotWnd:F_OnScreenPosChanged( oldX, oldY )

	self:OnScreenPosChanged( oldX, oldY )
	sys.log( "Old:(%f;%f). New(%f;%f)", oldX, oldY, self:GetLeft(), self:GetTop() )

end]]


--
function UI.ProfileMedalsCategoryLine_SlotWnd:UpdateForData( data )

	-- data = { medalId, level, count? }
	--

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if data.count and data.count > 0 then
		mainEffect:StartAnimation( "idle" )
	else
		mainEffect:StartAnimation( "lock" )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not icoEffect then
		return
	end
	
	local hTex = UI:GetMedalIco( data.medalId, data.level )
	icoEffect:SetSpriteTexture( "ico", hTex )

	if data.count then
		self:SetText( UI:Num2StrSeparatedBy3( data.count ), self.layers.COUNT )
	else
		self:SetText( "0", self.layers.COUNT )
	end

end


--
--[[function UI.ProfileMedalsCategoryLine_SlotWnd:Reset()



end]]


-- -------------------------------------------------------------------------------
-- UI.ProfileMedals_ScrollBarWnd
-- -------------------------------------------------------------------------------

UI.ProfileMedals_ScrollBarWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ProfileMedals_ScrollBarWnd.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd_Vrt",

	props =
	{
		name		= "ProfileMedals_ScrollBarWnd",
		scrollStyle = UI.SWS_VERTICAL + UI.SWS_THUMB_RESIZABLE,
	}	
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ProfileMedals_ScrollBarWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local curPos = self:GetPos()

	if wndThatReceivedInput == self:GetPrevBtnHandle() then		
		UI.Profile_MedalsWnd:Scroll( -1, UI.SCROLL_SRC_UP_BTN )

	elseif wndThatReceivedInput == self:GetNextBtnHandle() then
		UI.Profile_MedalsWnd:Scroll( 1, UI.SCROLL_SRC_DOWN_BTN )

	elseif wndThatReceivedInput == self:GetPrevPageHandle() then
		UI.Profile_MedalsWnd:Scroll( -1, UI.SCROLL_SRC_UP_PAGE )

	elseif wndThatReceivedInput == self:GetNextPageHandle() then
		UI.Profile_MedalsWnd:Scroll( 1, UI.SCROLL_SRC_DOWN_PAGE )

	else
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	return false

end