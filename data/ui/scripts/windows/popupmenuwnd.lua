-- ----------------------------------------------------------------------------
--
-- Workfile: popupmenuwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.PopUpMenuWnd = {}
local pm = UI.PopUpMenuWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.PopUpMenuWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "PopUpMenuWnd",
		activationOrder	= 0,
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
				defName 			= "popUpMenu_main",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "name",	
						layer		= "UI.PopUpMenuWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},	

					{
						objName		= "bg",	
						layer		= "UI.PopUpMenuWnd.layers.CAPTION_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		},

		-- CAPTION_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "popUpMenu_captionBg",
				defaultAnimation	= "idle",
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SEPARATOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "popUpMenu_separator",
				defaultAnimation	= "idle",
			}}
		}
	}
}


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.PopUpMenuWnd:Setup( hWndOwner, menuType, caption )

	if type( hWndOwner ) ~= "number" then
		sys.log( "UI.PopUpMenuWnd:Show()[ERROR]: invalid type of the 1-st parameter (\"hWndOwner\"); \"number\" expected, got \"%s\"", type( hWndOwner ) )
		hWndOwner = UI.INVALID_UI_HANDLE
	end

	if UI:Val2Key( UI.popUpMenuTypes, menuType ) == "" then
		sys.log( "UI.PopUpMenuWnd:Show()[ERROR]: invalid 2-st parameter (\"menuType\"); one of \"UI.popUpMenuTypes\" values expected, got \"%s\"", tostring( menuType ) )
		menuType = -1
	end

	if type( caption ) ~= "string" then
		sys.log( "UI.PopUpMenuWnd:Show()[ERROR]: invalid type of the 3-st parameter (\"caption\"); \"string\" expected, got \"%s\"", type( caption ) )
		caption = ""
	end

	self:Clear()

	self.hWndOwner	= hWndOwner
	self.menuType	= menuType

	self:SetCaption( caption )

	if not self:IsOnScreen() then
		UI.Root:AddChild( self )
	else
		self:PlaceOnScreen()
	end

end


--
function UI.PopUpMenuWnd:SetCaption( caption )

	if type( caption ) ~= "string" then
		sys.log( "UI.PopUpMenuWnd:Show()[ERROR]: invalid type of the 1-st parameter (\"caption\"); \"string\" expected, got \"%s\"", type( caption ) )
		caption = ""
	end

	self:SetText( caption, self.layers.CAPTION )

end


--
function UI.PopUpMenuWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.PopUpMenuWnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	self.hWndOwner	= UI.INVALID_UI_HANDLE
	self.menuType	= -1

	self:SetText( "", self.layers.CAPTION )

	if not UI:IsInRemovingAllWindows() then
		self:RecalcLayout()
	end

end


--
function UI.PopUpMenuWnd:AddRecord( data )

	if self:GetNumRecords() >= self.MAX_SLOTS then
		sys.log( "UI.PopUpMenuWnd:AddRecord()[ERROR]: cannot add new record; max records reached" )
		return
	end

	UI.ButtonsListWnd.AddRecord( self, data )

	self:RecalcLayout()

end


--
function UI.PopUpMenuWnd:GetOwner()

	return self.hWndOwner

end


--
function UI.PopUpMenuWnd:GetMenuType()

	return self.menuType

end


-- ------------------------------
-- const
-- ------------------------------

pm.layers =
{
    MAIN_EFFECT			= 0,
	CAPTION_BG_EFFECT	= 1,
    CAPTION				= 2,
	SEPARATOR_EFFECT	= 3,
}

pm.btnPrototypeName = "PopUpMenu_SlotWnd"

pm.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",		
		maxSizeLocator		= "self",
		minSizeLocator		= "min_dist",
		separatorLocator	= "sacer",
		captionLocator		= "name",
		captionBgLocator	= "bg",
	},

	captionBg =
	{
		maxSizeLocator		= "max_dist",
		minSizeLocator		= "min_dist",
	}
}

pm.MAX_SLOTS = 10

pm.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK

pm.selectSound = ""

pm.sounds =
{
	selectSound	= UI.sounds.btnMouseOver,
	show		= UI.sounds.btnClick,
}

-- ------------------------------
-- vars
-- ------------------------------

pm.hWndOwner 					= UI.INVALID_UI_HANDLE
pm.menuType						= -1
pm.maxHeight					= 0
pm.minHeight					= 0
pm.space_slots_bottom			= 0
pm.space_caption_separator		= 0
pm.space_separator_slots		= 0
pm.space_slots					= 0
pm.slotHeight					= 0
pm.slotsX						= 0
pm.captionBgMinHeight			= 0
pm.captionBgMaxHeight			= 0
pm.space_caption_captionBgBtm	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PopUpMenuWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )

end


-- перегрузка UI.ButtonsListWnd:ShowSlot()
function UI.PopUpMenuWnd:ShowSlot( slot )

	self:AddChild( slot.btn )

end


--
function UI.PopUpMenuWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local slotEffect = _G.UI_SpawnEffect( "popUpMenu_slot", self:GetUiHandle() )
	local captionBgEffect = UI:GetEffectFromLayer( self, self.layers.CAPTION_BG_EFFECT )

	local maxSize			= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
	local minSize			= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )
	local firstSlotPos		= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) )
	local secondSlotPos		= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) )
	local lastSlotPos		= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.MAX_SLOTS ) )
	local slotSize			= slotEffect and slotEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local separatorPos		= mainEffect:GetObjPos( self.effectInfo.main.separatorLocator )
	local captionPos		= mainEffect:GetObjPos( self.effectInfo.main.captionLocator )
	local captionSize		= mainEffect:GetObjSize( self.effectInfo.main.captionLocator )
	local captionBgMinSize	= captionBgEffect and captionBgEffect:GetObjSize( self.effectInfo.captionBg.minSizeLocator ) or Vec2( 0, 0 )
	local captionBgMaxSize	= captionBgEffect and captionBgEffect:GetObjSize( self.effectInfo.captionBg.maxSizeLocator ) or Vec2( 0, 0 )
	local captionBgPos		= mainEffect:GetObjPos( self.effectInfo.main.captionBgLocator )

	self.maxHeight					= maxSize.y
	self.minHeight					= minSize.y
	self.space_slots_bottom			= maxSize.y - (lastSlotPos.y + slotSize.y )
	self.space_caption_separator	= separatorPos.y - ( captionPos.y + captionSize.y )
	self.space_separator_slots		= firstSlotPos.y - separatorPos.y
	self.space_slots				= secondSlotPos.y - ( firstSlotPos.y + slotSize.y )
	self.slotHeight					= slotSize.y
	self.slotsX						= firstSlotPos.x
	self.captionBgMinHeight			= captionBgMinSize.y
	self.captionBgMaxHeight			= captionBgMaxSize.y
	self.space_caption_captionBgBtm	= ( captionBgPos.y + captionBgMaxSize.y ) - ( captionPos.y + captionSize.y )

	self:SetWidth( maxSize.x )
	self:SetLayerWidth( captionSize.x, self.layers.CAPTION )
	
	local separatorEffect = UI:GetEffectFromLayer( self, self.layers.SEPARATOR_EFFECT )
	if separatorEffect then
		separatorEffect:SetPos( UI:Vec2( separatorPos.x, 0 ) )
	end

	if slotEffect then
		_G.UI_DestroyEffect( slotEffect )
	end

end


--
function UI.PopUpMenuWnd:RecalcLayout()

	-- заголовок, текст - размер

	local captionFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.CAPTION ), 100000 )

    local captionHeight = _G.MeasureText(
   		self:GetText( self.layers.CAPTION ),
   		self:GetFont( self.layers.CAPTION ),
    	captionFormatRect,
   		self:GetTextFormatFlags( self.layers.CAPTION ),
    	captionFormatRect ).w

	self:SetLayerHeight( captionHeight, self.layers.CAPTION )


	-- заголовок, фон - размер

	local captionBgEffect = UI:GetEffectFromLayer( self, self.layers.CAPTION_BG_EFFECT )
	local captionBgY = captionBgEffect and captionBgEffect:GetPos().y or 0
	local captionY = self:GetLayerTop( self.layers.CAPTION )

	local captionBgHeight = ( captionY + captionHeight + self.space_caption_captionBgBtm ) - captionBgY
	captionBgHeight = UI:Clamp( captionBgHeight, self.captionBgMinHeight, self.captionBgMaxHeight )

	local captionBgAnimTime = ( captionBgHeight - self.captionBgMinHeight ) / ( self.captionBgMaxHeight - self.captionBgMinHeight )
	if captionBgEffect then
		captionBgEffect:SetAnimationTime( captionBgAnimTime )
		captionBgEffect:Update( 0 )		
	end


	-- сепаратор - позиция

	local captionY1 = self:GetLayerTop( self.layers.CAPTION ) + self:GetLayerHeight( self.layers.CAPTION )
	local separatorY = captionY1 + self.space_caption_separator

	local separatorEffect = UI:GetEffectFromLayer( self, self.layers.SEPARATOR_EFFECT )
	if separatorEffect then
		local separatorPos = separatorEffect:GetPos()
		separatorPos.y = separatorY
		separatorEffect:SetPos( separatorPos )
	end


	-- слоты - позиции

	local numSlots = self:GetNumRecords()
	local firstSlotY = separatorY + self.space_separator_slots

	for slotIdx = 1, numSlots do

		local slotY = firstSlotY + ( self.slotHeight + self.space_slots ) * ( slotIdx - 1 )

		local slotWnd = self:GetButtonForSlot( slotIdx )
		if slotWnd then
			slotWnd:SetTop( slotY )
			slotWnd:SetLeft( self.slotsX )
		end

	end

	-- собственный размер

	local lastSlotY = firstSlotY

	if numSlots > 0 then
		lastSlotY = firstSlotY + ( self.slotHeight + self.space_slots ) * ( numSlots - 1 )
	end	

	local selfHeight = ( lastSlotY + self.slotHeight ) + self.space_slots_bottom
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )

	self:SetHeight( selfHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )
		mainEffect:SetAnimationTime( animTime )
		mainEffect:Update( 0 )

	end	

	-- позиция на экране

	if self:IsOnScreen() then
		self:PlaceOnScreen()
	end

end


--
function UI.PopUpMenuWnd:PlaceOnScreen()

	local selfRect = self:GetRect()

	local x = UI:GetMouseX()
	local y = UI:GetMouseY()

	x = UI:Clamp( x, 0, 1024 - selfRect.z )
	y = UI:Clamp( y, 0, 768 - selfRect.w )

	self:SetLeft( x )
	self:SetTop( y )	

	self:UpdateEffects()

end


--
function UI.PopUpMenuWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:PlaceOnScreen()

	local handle = self:GetUiHandle()

	UI:SubscribeUiObjOnEvent( handle, UI.EV_MOUSE_BUTTON_DOWN )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )	

	UI:PlayGlobalSound( self.sounds.show )

end


--
function UI.PopUpMenuWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		local handle = self:GetUiHandle()

		UI:UnsubscribeUiObjFromEvent( handle, UI.EV_MOUSE_BUTTON_DOWN )
		UI:UnsubscribeUiObjFromEvent( handle, UI.EV_WND_HIDED )	

		self:Clear()

	end

end


--
function UI.PopUpMenuWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.PopUpMenuWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	local separatorEffect = UI:GetEffectFromLayer( self, self.layers.SEPARATOR_EFFECT )
	if separatorEffect then
		separatorEffect:Update( 0 )
	end

end


--
function UI.PopUpMenuWnd:ActivateRecord( recordIdx )

	UI.ButtonsListWnd.ActivateRecord( self, recordIdx )

	self:Hide()

end


--
function UI.PopUpMenuWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	

	if not UI:IsPtInRect( self:GetRect(), mouseX, mouseY ) then
		self:Hide()
	end

end


--
function UI.PopUpMenuWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then
    	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
    		return true
    	end
	end
		
	return self:HandleKey( key, -2 )	

end


--
function UI.PopUpMenuWnd:OnEscape()

	self:Hide()
	return true

end


--
function UI.PopUpMenuWnd:F_OnEventSaveUiState()

	self:Hide()

end


--
function UI.PopUpMenuWnd:F_OnEventWndHided( hSender, hWnd )

	if hWnd == self.hWndOwner then
		self:Hide()
	end

end


--
function UI.PopUpMenuWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	local recordIdx = -1

	if w.BUTTON_LIST_BTN then	
       	recordIdx = w:GetRecord()
	end

	if recordIdx ~= self:GetSelectedRecord() then

		self:SelectRecord( recordIdx )

		if recordIdx ~= -1 then
	    	UI:PlayGlobalSound( self.sounds.selectSound )
		end

	end

	return true

end


--
function UI.PopUpMenuWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if w.BUTTON_LIST_BTN then	

       	local recordIdx = w:GetRecord()

		if recordIdx ~= self:GetSelectedRecord() then
			self:SelectRecord( recordIdx )
		end

		self:ActivateRecord( recordIdx )

	end

	return true

end


--
function UI.PopUpMenuWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if _G.IsCursorHidden() then
		self:Hide()
	end

end


-- -----------------------------------------------------------------------
-- UI.PopUpMenu_SlotWnd 
-- -----------------------------------------------------------------------

UI.PopUpMenu_SlotWnd  = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PopUpMenu_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "PopUpMenu_SlotWnd",
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
				defName 			= "popUpMenu_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},	

					{
						objName		= "name",	
						layer		= "UI.PopUpMenu_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},	
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.PopUpMenu_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.metaText:SetText( "", true )

end


--
function UI.PopUpMenu_SlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	self:UpdateMainAnimation()

end


-- ------------------------------
-- const
-- ------------------------------

UI.PopUpMenu_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.PopUpMenu_SlotWnd.effectInfo =
{
	main =
	{
		animUnsel	= "idle",
		animSel		= "over",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PopUpMenu_SlotWnd.metaText = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PopUpMenu_SlotWnd:F_PostLoad()
	
	UI.ButtonsList_Btn.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT )
	
end


--
function UI.PopUpMenu_SlotWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.PopUpMenu_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateMetaTextPos()

end


--
function UI.PopUpMenu_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.PopUpMenu_SlotWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.PopUpMenu_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.PopUpMenu_SlotWnd:UpdateForData( data, bAnimated )

	self:UpdateText( data )
	self:UpdateMainAnimation()

end


--
function UI.PopUpMenu_SlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local animName = self:IsSelected() and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel
	mainEffect:StartAnimation( animName )	

end


--
function UI.PopUpMenu_SlotWnd:UpdateText( data )

	if data.text then
		self.metaText:SetText( data.text, true )

	else
		sys.log( "UI.PopUpMenu_SlotWnd:UpdateText()[ERROR]: cannot find \"text\" in data" )
		self.metaText:SetText( "", true )
	end

end