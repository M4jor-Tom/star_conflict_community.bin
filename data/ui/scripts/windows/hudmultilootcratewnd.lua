-- -------------------------------------------------------------------------------------
-- UI.HudMultiLootCrateWnd
-- -------------------------------------------------------------------------------------

UI.HudMultiLootCrateWnd = {}

-- -------------------------------------------------
-- window definition
-- -------------------------------------------------

UI.HudMultiLootCrateWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",
	
	props =
	{
		name	= "HudMultiLootCrateWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "equipment_itemsList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "title",
						layer		= "UI.HudMultiLootCrateWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "btn_x",
						wnd			= "UI.HudMultiLootCrate_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},
		
		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hudMultiLootCrate_caption" )
		},
	},
	
	children = { "UI.HudMultiLootCrate_CrossBtn" }
}

-- -------------------------------------------------
-- interface functions
-- -------------------------------------------------

--
function UI.HudMultiLootCrateWnd:OnInteractionStart( interactionType, crateEnt )
	
	if interactionType ~= ai.InteractionType.MULTIPLE_LOOT_CRATE then
		return
	end
	
	self:SetLootCrate( crateEnt )
	
	local bWasOnScreen = self:IsOnScreen()
	
	if self:IsLootCrateValid() then
		self:Show()
	else
		sys.log( "UI.HudMultiLootCrateWnd:OnInteractionStart()[ERROR]: fail to show loot crate" )
		self:Reset()
		self:Hide()
	end
	
	local bIsOnScreen = self:IsOnScreen()
	
	-- если окно не смогло быть показано, то прекращаем интеракцию
	-- (если окно ранее было на экране, но в результате было скрыто, то эта функция уже была вызвана в F_OnAfterHideFromScreen)
	if not bIsOnScreen and not bWasOnScreen then
		self:StopInteraction()
	end
	
end


--
function UI.HudMultiLootCrateWnd:OnInteractionStop()
	
	if self.crateEntId ~= -1 then
		self:Reset()
		self:Hide()
	end
	
end


--
function UI.HudMultiLootCrateWnd:OnMultipleLootCrateChanged()
	
	if self:IsOnScreen() then
		self:UpdateContent( true )
	end
	
end


--
function UI.HudMultiLootCrateWnd:IsLootCrateToShow()

	return self:IsLootCrateValid()

end


-- -------------------------------------------------
-- const
-- -------------------------------------------------

UI.HudMultiLootCrateWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.HudMultiLootCrateWnd.btnPrototypeName	= "HudMultiLootCrate_SlotWnd"
UI.HudMultiLootCrateWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.HudMultiLootCrateWnd.MAX_SLOTS			= 5

UI.HudMultiLootCrateWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll_max",
		numSlotsLocators	= 4,
		minHeightLocator	= "dist_min",
		maxHeightLocator	= "self",
	},
}

-- -------------------------------------------------
-- vars
-- -------------------------------------------------

UI.HudMultiLootCrateWnd.crateEntId	= -1

-- -------------------------------------------------
-- work functions
-- -------------------------------------------------

-- перегрузка базовой реализации из UI.ButtonsList3Wnd - учитывается то, что эффект был сделан с динамическим размером
function UI.HudMultiLootCrateWnd:RecalcLayout()

	UI.ButtonsList3Wnd.RecalcLayout( self )
	
	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd			= self.allSlots[ 1 ] and self.allSlots[ 1 ].btn
	
	local lastSlotPos		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.effectInfo.main.numSlotsLocators ) ) or Vec2( 0, 0 )
	local selfMinSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minHeightLocator ) or Vec2( 0, 0 )
	local selfMaxSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxHeightLocator ) or Vec2( 0, 0 )
	local slotHeight		= slotWnd and slotWnd:GetHeight() or 0
	local slotsBtm			= lastSlotPos.y + slotHeight
	local scrollPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.scrollObjName ) or Vec2( 0, 0 )
	local scrollSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollObjName ) or Vec2( 0, 0 )
	
	local space_slots_btm	= selfMaxSize.y - slotsBtm
	local minHeight			= selfMinSize.y
	local maxHeight			= selfMaxSize.y
	local space_top_scroll	= scrollPos.y                 
	local space_scroll_btm	= selfMaxSize.y - ( scrollPos.y + scrollSize.y )
	
	-- собственная высота

	local selfHeight = self.slotsRect.w + self.slotsRect.y + space_slots_btm
	selfHeight = UI:Clamp( selfHeight, minHeight, maxHeight )

	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - minHeight ) / ( maxHeight - minHeight )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end
	
	-- высота скроллбара

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if mainEffect and scrollEffect then

		local scrollNeedHeight = selfHeight - space_scroll_btm - space_top_scroll
		local scrollBaseHeight = scrollEffect:GetObjSize( "self" ).y
	
		local scrollScale_y = scrollNeedHeight / scrollBaseHeight
		scrollEffect:SetScale( UI:Vec2( 1, scrollScale_y ) )
	
		self.scrollBar:SetHeight( scrollNeedHeight )

	end

end


--
function UI.HudMultiLootCrateWnd:Reset()
	
	self.crateEntId = -1
	self:ResetContent()
	
end


--
function UI.HudMultiLootCrateWnd:ResetContent()

	if not UI:IsInRemovingAllWindows() then
		self:Clear()
	end
	
end


--
function UI.HudMultiLootCrateWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:FullUpdate()

end


--
function UI.HudMultiLootCrateWnd:FullUpdate()
	
	local crateEnt = self:FindLootCrate()
	self:SetLootCrate( crateEnt )

end


--
function UI.HudMultiLootCrateWnd:FindLootCrate()

	local interactionType, progress, entId = _G.CL_GetLocalPlayerInteraction()
	
	if interactionType ~= ai.InteractionType.MULTIPLE_LOOT_CRATE then
		return nil
	end
	
	if type( entId ) ~= "number" then
		sys.log( "UI.HudMultiLootCrateWnd:FindLootCrate(): invalid type of the 3-rd return val from CL_GetLocalPlayerInteraction(); 'number' expected, got '%s'", type( entId ) )
		return nil
	end
		
	local ent = _G.Entities[ entId ]
	if not ent then
		sys.log( "UI.HudMultiLootCrateWnd:FindLootCrate(): cannot find entity with id %d", entId )
		return nil
	end
	
	return ent
	
end


--
function UI.HudMultiLootCrateWnd:SetLootCrate( crateEnt )
	
	self:Reset()
	
	-- если ошибка, то окно здесь не скрывается, т.к. эта функция вызвается, в частности, из F_OnAfterShowOnScreen и скрытие в этом месте может привести к непредсказуемым ошибкам из-за нарушения порядка вызова функций в коде;
	-- окно скроется в F_OnNewFrame, если нечего показывать

	if type( crateEnt ) ~= "userdata" then
		sys.log( "UI.HudMultiLootCrateWnd:SetLootCrate(): incalid type of the 1-st param ('crateEnt'); 'userdata' expected, got '%s'", type( crateEnt ) )
		return
	end
	
	if not UI:IsEntityOfClass( crateEnt, "MultipleLootCrate" ) then
		sys.log( "UI.HudMultiLootCrateWnd:SetLootCrate(): invalid entity class; 'MultipleLootCrate' expected" )
		return
	end	
	
	self.crateEntId = crateEnt:GetId()
	
	if self:IsOnScreen() then
		self:UpdateContent( false )
	end

end


--
function UI.HudMultiLootCrateWnd:UpdateContent( bSaveLayout )
	
	if bSaveLayout == nil then
		bSaveLayout = false
	end
	
	local scrollPos = self:GetScrollPos()
	
	self:ResetContent()
	
	if not self:IsLootCrateValid() then
		return
	end
	
	local crateEnt = _G.Entities[ self.crateEntId ]
	
	for itemIdx = 0, crateEnt:GetLootAmount() - 1 do	-- с 0
	
		local defName = crateEnt:GetLootItemDefName( itemIdx ) or ""
		local state = crateEnt:GetLootItemParam( itemIdx )
		local count = crateEnt:GetLootItemAmount( itemIdx )
		
		local bNeeded = _G.CL_BattleRoyale_IsItemNeeded( defName, state )
		if type( bNeeded ) ~= "boolean" then
			sys.log( "UI.HudMultiLootCrateWnd:UpdateContent() invalid type of return param from CL_BattleRoyale_IsItemNeeded(); 'boolean' expected, got '%s'", type( bNeeded ) )
			bNeeded = false
		end
		
		local data =
		{
			itemIdx	= itemIdx,
			defName	= defName,
			state	= state,
			count	= count,
			bNeeded	= bNeeded,
		}
		
		self:AddRecord( data )
		
	end
	
	if bSaveLayout and scrollPos ~= -1 then
		self:SetScrollPos( scrollPos )
	end
	
end


--
function UI.HudMultiLootCrateWnd:Show()

	UI.HudWnd:ShowMultiLootCrateWnd()
	
end


--
function UI.HudMultiLootCrateWnd:Hide()
	
	UI.HudWnd:HideMultiLootCrateWnd()
	
end


--
function UI.HudMultiLootCrateWnd:IsLootCrateValid()

	return self.crateEntId ~= -1 and _G.IsEntIdValid( self.crateEntId )

end


--
function UI.HudMultiLootCrateWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if not self:IsLootCrateValid() then
		self:Reset()
		self:Hide()
	end
	
end


--
function UI.HudMultiLootCrateWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	-- если это окно надо будет показывать для спектатора, то проверять что не спектатор, но пока не показывается для спектатора

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "HudMultiLootCrate_SlotWnd" ) then
	
		local data = wnd:GetRecordData()
		if self:IsLootCrateValid() then
		
			local crateEnt = _G.Entities[ self.crateEntId ]
			_G.CL_RequestTakeMultipleLootCrateItem( crateEnt, data.itemIdx )
			UI:PlayGlobalSound( UI.sounds.btnClick )
			
		end
		
	elseif wnd == UI.HudMultiLootCrate_CrossBtn then
	
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:Hide()
		
	end
	
	return true
	
end


--
function UI.HudMultiLootCrateWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self:Scroll( ticks < 0 )
	end

	return true

end


--
function UI.HudMultiLootCrateWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	-- при скрытии окна по любой причине прекращаем интеракцию
	self:StopInteraction()

end


--
function UI.HudMultiLootCrateWnd:StopInteraction()

	-- если это окно надо будет показывать для спектатора, то проверять что не спектатор, но пока не показывается для спектатора
	if not UI:IsInShutdown() then
		_G.CL_RequestStopInteraction()
	end

end


-- -------------------------------------------------------------------------------------
-- UI.HudMultiLootCrate_SlotWnd
-- -------------------------------------------------------------------------------------

UI.HudMultiLootCrate_SlotWnd = {}

-- -------------------------------------------------
-- window definition
-- -------------------------------------------------

--
UI.HudMultiLootCrate_SlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	NAME				= 1,
	STATE				= 2,
	COUNT				= 3,
	MOUSE_OVER_EFFECT	= 4,
}

--
UI.HudMultiLootCrate_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",
	
	props =
	{
		name		= "HudMultiLootCrate_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},
	
	layers =
	{
		firstOverlayLayer = UI.HudMultiLootCrate_SlotWnd.layers.MOUSE_OVER_EFFECT,
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "equipment_itemsList_slot_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "product_name",
						layer		= "UI.HudMultiLootCrate_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "progr",
						layer		= "UI.HudMultiLootCrate_SlotWnd.layers.STATE",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "price8",
						layer		= "UI.HudMultiLootCrate_SlotWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "over",
						layer		= "UI.HudMultiLootCrate_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},
		
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 2, 1 },
			font			= { fontName = "Small" },
		},

		-- STATE
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 2, 1 },
			font			= { fontName = "Small" },
		},
		
		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 2, 1 },
			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "equipment_itemsList_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- -------------------------------------------------
-- interface functions
-- -------------------------------------------------

--
function UI.HudMultiLootCrate_SlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )
	
	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.STATE )
	self:SetText( "", self.layers.COUNT )
	self.icoWnd:Reset()
	self:SetMouseOver( false )

end

-- -------------------------------------------------
-- const
-- -------------------------------------------------

UI.HudMultiLootCrate_SlotWnd.effectInfo =
{
	main =
	{
		icoLocator	= "icon",
	}
}

-- -------------------------------------------------
-- vars
-- -------------------------------------------------

UI.HudMultiLootCrate_SlotWnd.icoWnd = nil

-- -------------------------------------------------
-- work functions
-- -------------------------------------------------

--
function UI.HudMultiLootCrate_SlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self:CreateControls()
	
end


--
function UI.HudMultiLootCrate_SlotWnd:CreateControls()

	self.icoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	UI:AddChildAndLink( self, self.icoWnd, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ), self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )

end


--
function UI.HudMultiLootCrate_SlotWnd:UpdateForData( data, bAnimated )
	
	self:Reset()
	
	self:UpdateIco( data )
	self:UpdateName( data )
	self:UpdateState( data )
	self:UpdateCount( data )
	self:UpdateMouseOver()
	
end


--
function UI.HudMultiLootCrate_SlotWnd:UpdateIco( data )
	
	self.icoWnd:SetupForItem( data.defName, false )
	
	local tooltipData = UI:GetTooltipForItem( data.defName )
	self.icoWnd:SetTooltipData( tooltipData )
	
	if not data.bNeeded then
		self.icoWnd:ShowNoAmmo( true )
	end
	
end


--
function UI.HudMultiLootCrate_SlotWnd:UpdateName( data )
	
	local str = UI:GetEntityLocalizedNameByDef( data.defName, true, false, nil, true, false )
	self:SetText( str, self.layers.NAME )
	
end


--
function UI.HudMultiLootCrate_SlotWnd:UpdateState( data )
	
	local str = ""
	if UI:GetModuleType( data.defName ) == ai.ModuleType.WEAPON then
		str = string.format( "%s: %s %s", UI:GetStringByName( "equipment_ammoPrimary" ), UI:Num2StrSeparatedBy3( data.state ), UI:GetStringByName( "equipment_itemsUnits" ) )
	else
		local def = UI:GetDef( data.defName )
		
		if def.module_slot == ai.SpaceShipModuleSlot.SHIELD_MOD_01 then
			str = string.format( "%s: %s %s", UI:GetStringByName( "equipment_charge" ), UI:Num2StrSeparatedBy3( data.state ), UI:GetStringByName( "units_damage" ) )
		end
	end

	self:SetText( str, self.layers.STATE )
	
end


--
function UI.HudMultiLootCrate_SlotWnd:UpdateCount( data )
	
	local str = string.format( "%s %s", UI:Num2StrSeparatedBy3( data.count ), UI:GetStringByName( "equipment_itemsUnits" ) )
	self:SetText( str, self.layers.COUNT )
	
end


--
function UI.HudMultiLootCrate_SlotWnd:UpdateMouseOver()

	local bMouseOver = false
	
	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	if wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) then
		bMouseOver = true
	end
	
	self:SetMouseOver( bMouseOver )

end


--
function UI.HudMultiLootCrate_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.HudMultiLootCrate_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.HudMultiLootCrate_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.HudMultiLootCrate_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end

-- -------------------------------------------------------------------------------------
-- UI.HudMultiLootCrate_CrossBtn
-- -------------------------------------------------------------------------------------

UI.HudMultiLootCrate_CrossBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "CrossBtn",
	
		props =
		{
			name	= "HudMultiLootCrate_CrossBtn",
		}
	}
}