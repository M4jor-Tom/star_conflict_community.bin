-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- UI.HudEditorWnd
-- -----------------------------------------------------------------------

UI.HudEditorWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HudEditorWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",
	
	props =
	{
		name		= "HudEditor_DummyWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs		= Quat( 0, 0, 1024, 768 ),
	},
	
	layers =
	{
		numLayers = 1,
		
		-- BLACK_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "Black",
			color		= 0xc8ffffff,
		}
	},
	
	children = { "UI.HudEditor_ParamsWnd" }
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HudEditorWnd:HudEditor_OnParamChanged( configId, wndName, paramName )
	
	if not self:IsOnScreen() then
		return
	end
	
	UI.HudEditor_ParamsWnd:OnParamChanged( configId, wndName, paramName )
	
	if configId == UI.HudEditor:GetCurConfig() then
		self:UpdateDummyForConfig( wndName )
	end
	
end


--
function UI.HudEditorWnd:HudEditor_OnCurConfigChanged()

	if not self:IsOnScreen() then
		return
	end
	
	UI.HudEditor_ParamsWnd:OnCurConfigChanged()
	self:UpdateDummiesForConfig()

end


--
function UI.HudEditorWnd:HudEditor_OnCancelChanges()

	if not self:IsOnScreen() then
		return
	end
	
	UI.HudEditor_ParamsWnd:OnCancelChanges()
	self:UpdateDummiesForConfig()

end


--
function UI.HudEditorWnd:HudEditor_OnSaveChanges()

	if not self:IsOnScreen() then
		return
	end
	
	UI.HudEditor_ParamsWnd:OnSaveChanges()

end


--
function UI.HudEditorWnd:HudEditor_OnResetConfigToDefault( configId )

	if not self:IsOnScreen() then
		return
	end
	
	UI.HudEditor_ParamsWnd:OnResetConfigToDefault( configId )
	
	if configId == UI.HudEditor:GetCurConfig() then
		self:UpdateDummiesForConfig()
	end

end


--
function UI.HudEditorWnd:GetSelWndName()

	return self.selWndName

end


--
function UI.HudEditorWnd:SelectWnd( wndName )

	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditorWnd:SelectWnd()[ERROR]: invalid type of the 1-st patameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return
	end
	
	if wndName == self.selWndName then
		return
	end
	
	local oldSelWndName = self.selWndName
	self.selWndName = wndName
	
	if oldSelWndName ~= "" then
	
		local oldSelDummyWnd = self.dummies[ oldSelWndName ]
		if oldSelDummyWnd then
			oldSelDummyWnd:Select( false )
		else
			sys.log( "UI.HudEditorWnd:SelectWnd()[ERROR]: cannot find dummy wnd %s", oldSelWndName )
		end
		
	end
	
	if wndName ~= "" then
	
		local selDummyWnd = self.dummies[ wndName ]
		if selDummyWnd then
			selDummyWnd:Select( true )
		else
			sys.log( "UI.HudEditorWnd:SelectWnd()[ERROR]: cannot find dummy wnd %s", wndName )
		end

	end
	
	UI.HudEditor_ParamsWnd:OnSelWndChanged()

end


--
function UI.HudEditorWnd:GetWndLocalizedName( wndName )

	local str = "error"
	
	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditorWnd:GetWndLocalizedName()[ERROR]: invalid type of the 1-st patameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return str
	end
	
	local strId = string.format( "hudEditor_wndName_%s", wndName )
	str = UI:GetStringByName( strId )
	
	return str

end


-- -----------------------------
-- const
-- -----------------------------

UI.HudEditorWnd.layers =
{
	BLACK_BG	= 0,
}

UI.HudEditorWnd.SNAP_DIST			= 5		-- [пикселей экрана] расстояние между сторонами окон по одной из осей, при котором происходит привязка (при соблюдении условия SNAP_WND_MAX_DIST)
UI.HudEditorWnd.SNAP_WND_MAX_DIST	= 30	-- [пикселей экрана] максимальное расстояние между окнами по любой из осей, при котором в принципе возможна привязка

-- -----------------------------
-- vars
-- -----------------------------

UI.HudEditorWnd.dummies			= {}
UI.HudEditorWnd.dragWnd			= nil
UI.HudEditorWnd.dragAnchorPos	= nil
UI.HudEditorWnd.selWndName		= ""

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HudEditorWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self:InitDummies()

end


--
function UI.HudEditorWnd:InitDummies()

	if next( self.dummies ) then
		return
	end

	local orderMap = {}
	for orderIdx, realWndName in pairs( UI.HudWnd.windowsOrder ) do
		orderMap[ realWndName ] = orderIdx
	end
	
	local windowsOrdered = {}

	for editorWndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
	
		local bNeedShow = true
		
		-- SC-111991 хаком скрываются пассивные модули, пока режим Battle Royale в стадии прототипа
		if editorWndName == "HudModulesWnd_passiveModules" and not UI.passiveModulesEditEnabled then
			bNeedShow = false
		end
		
		if bNeedShow then
	
			local orderIdx		= -1
			local childOrderIdx	= -1
			
			if wndInfo.parentWnd then
				orderIdx		= orderMap[ wndInfo.parentWnd ] or -1
				childOrderIdx	= wndInfo.sortOrder or -1
			else
				local firstRealWndName = wndInfo.wnds[ 1 ]
				if firstRealWndName then
					orderIdx = orderMap[ firstRealWndName ] or -1
				end
			end
			
			local wndData =
			{
				editorWndName	= editorWndName,
				parentName		= wndInfo.parentWnd,
				orderIdx		= orderIdx,
				childOrderIdx	= childOrderIdx,
			}
			
			table.insert( windowsOrdered, wndData )
			
		end
		
	end
	
	local function fnSort( wndData1, wndData2 )
	
		if wndData1.parentName and wndData2.parentName and wndData1.parentName == wndData2.parentName then
			return wndData1.childOrderIdx < wndData2.childOrderIdx
		else
			return wndData1.orderIdx < wndData2.orderIdx
		end
		
	end
	
	table.sort( windowsOrdered, fnSort )
	
	for wndIdx, wndData in ipairs( windowsOrdered ) do
	
		local dummyWnd = UI:CreateChildWnd( self, UI.HudEditor_DummyWnd, wndData.editorWndName )
		
		self:AddChild( dummyWnd )
		self.dummies[ wndData.editorWndName ] = dummyWnd
		
		dummyWnd:Setup( wndData.editorWndName )
		
	end
	
	self:MoveChildToLastPosition( UI.HudEditor_ParamsWnd )

end


--
function UI.HudEditorWnd:UpdateDummiesForConfig()
	
	for wndName, dummyWnd in pairs( self.dummies ) do
		self:UpdateDummyForConfig( wndName )
	end
	
end


--
function UI.HudEditorWnd:UpdateDummyForConfig( wndName )

	local dummyWnd = self.dummies[ wndName ]
	
	if dummyWnd then
	
		dummyWnd:UpdateForConfig()
		
		local pos = UI.HudEditor:GetWndPos( wndName )
		dummyWnd:SetPos( UI:XRel2Snapped( pos.x ), UI:YRel2Snapped( pos.y ) )

	end
	
end


--
function UI.HudEditorWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "HudEditor_DummyWnd" ) then
	
		local wndName = wnd:GetWndName()
		if wndName ~= self.selWndName then
			self:SelectWnd( wndName )
		end
		
		if not self.dragWnd then
			self:StartDrag( wnd, mouseX, mouseY )
		end
	
	elseif wnd == UI.HudEditor_ParamsWnd then
	
		if not self.dragWnd then
			if UI:IsPtInRect( UI.HudEditor_ParamsWnd:ToParent( UI.HudEditor_ParamsWnd:GetDragRect() ), mouseX, mouseY ) then
				self:StartDrag( wnd, mouseX, mouseY )
			end
		end
		
	end
	
	return true
	
end


--
function UI.HudEditorWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "HudEditor_DummyWnd" ) then
	
		local wndName = wnd:GetWndName()
		
		if wndName ~= self.selWndName then
			self:SelectWnd( wndName )
		end

		UI.HudEditor:SetWndVisible( wndName, not UI.HudEditor:IsWndVisible( wndName ) )
		
	end
	
	return true
	
end


--
function UI.HudEditorWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return false
	end
	
	if self.dragWnd then
	
		local pos = UI:Vec2( mouseX - self.dragAnchorPos.x, mouseY - self.dragAnchorPos.y )
		
		if UI:IsWndKindOf( self.dragWnd, "HudEditor_DummyWnd" ) then
			pos = self:SnapDummyPos( pos, self.dragWnd )
			UI.HudEditor:SetWndPos( self.dragWnd:GetWndName(), pos )
		end

		self.dragWnd:SetPos( pos.x, pos.y )
		
	end

	return true
	
end


--
function UI.HudEditorWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	self:StopDrag()
	
	return true
	
end


--
function UI.HudEditorWnd:StartDrag( dragWnd, mouseX, mouseY )

	self.dragWnd = dragWnd
	self.dragAnchorPos = Vec2( mouseX - self.dragWnd:GetLeft(), mouseY - self.dragWnd:GetTop() )
	
	UI:CaptureMouse( self:GetUiHandle() )

end


--
function UI.HudEditorWnd:StopDrag()

	if self.dragWnd then

		self.dragWnd		= nil
		self.dragAnchorPos	= nil
		
		if not UI:IsInRemovingAllWindows() and UI:GetMouseCapture() == self:GetUiHandle() then
			UI:CaptureMouse( UI.INVALID_UI_HANDLE )
		end
		
	end
	
end


--
function UI.HudEditorWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )
	
	self:UpdateDummiesForConfig()
	self:SelectWndDefault()
	self:PlaceParamsWndDefault()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )

end


--
function UI.HudEditorWnd:F_OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
	
		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
		
		self:StopDrag()
		
		local handle = self:GetUiHandle()
		UI:UnsubscribeUiObjFromEvent( handle, UI.EV_WND_SHOWN )
		UI:UnsubscribeUiObjFromEvent( handle, UI.EV_WND_HIDED )
		UI:UnsubscribeUiObjFromEvent( handle, UI.EV_HUD_MODE_CHANGED )

	else
		self:OnAfterHideFromScreen()
	end
	
	if not UI:IsInShutdown() and not UI.bSavingGameState then
		UI.HudEditor:CancelChanges()
	end

end


--
function UI.HudEditorWnd:PlaceParamsWndDefault()
	
	-- по умолчанию окно параметров по центру экрана, потом его можно двигать мышью; позиция не сохраняется
	UI.HudEditor_ParamsWnd:SetPos( ( 1024 - UI.HudEditor_ParamsWnd:GetWidth() ) * 0.5, ( 768 - UI.HudEditor_ParamsWnd:GetHeight() ) * 0.5 )
	
end


--
function UI.HudEditorWnd:SelectWndDefault()

	self:SelectWnd( "HudForcesInfoWnd" )
	
end


--
function UI.HudEditorWnd:OnEscape()
	
	self:OnCancel()
	return true

end


--
function UI.HudEditorWnd:OnCancel()

	self:Hide()

end


--
function UI.HudEditorWnd:CheckHideAndCancelChanges()

	if not self:IsOnScreen() then
		return
	end
	
	if UI:IsInShutdown() or UI:IsInRemovingAllWindows() then
		return
	end

	local bCanShow = true
	
	if not UI.HudWnd or not UI.HudWnd.w or not UI.HudWnd:IsOnScreen() then
		bCanShow = false
	end
	
	if bCanShow then
		if UI:IsMenuWindowsOnScreen() then
			bCanShow = false
		end
	end
	
	if not bCanShow then
		self:Hide()
		UI.HudEditor:CancelChanges()
	end
	
end


--
function UI.HudEditorWnd:F_OnEventWndHided( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() and self:IsOnScreen() then
		self:CheckHideAndCancelChanges()
	end

end


--
function UI.HudEditorWnd:F_OnEventWndShown( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() and self:IsOnScreen() then
		self:CheckHideAndCancelChanges()
	end

end


--
function UI.HudEditorWnd:SnapDummyPos( pos, dragDummyWnd )

	local snappedPos	= UI:Vec2CopyStable( pos )

	local minDistX		= math.huge
	local minDistY		= math.huge
	local anchorX		= nil
	local anchorY		= nil
	local bSnapByLeft	= nil
	local bSnapByTop	= nil
	
	local dragRect = UI:QuatCopyStable( dragDummyWnd:GetRect() )
	dragRect.x = pos.x
	dragRect.y = pos.y

	local snapDistX			= UI:XToRel( self.SNAP_DIST, false )
	local snapDistY			= UI:YToRel( self.SNAP_DIST, false )
	local snapWndMaxDistX	= UI:XToRel( self.SNAP_WND_MAX_DIST, false )
	local snapWndMaxDistY	= UI:YToRel( self.SNAP_WND_MAX_DIST, false )
	
	local function fnTrySnapToRect( rect )
	
		local leftRect	= rect.x < dragRect.x and rect or dragRect
		local rightRect	= rect.x < dragRect.x and dragRect or rect
		local xWndDist = math.max( rightRect.x - ( leftRect.x + leftRect.z ), 0 )
		
		local topRect	= rect.y < dragRect.y and rect or dragRect
		local btmRect	= rect.y < dragRect.y and dragRect or rect
		local yWndDist = math.max( btmRect.y - ( topRect.y + topRect.w ), 0 )
		
		if xWndDist <= snapWndMaxDistX and yWndDist <= snapWndMaxDistY then
		
			local xLayout =
			{
				{ anchor = rect.x,			bByLeft = true,		dist = math.abs( dragRect.x - rect.x ) },
				{ anchor = rect.x + rect.z,	bByLeft = true,		dist = math.abs( dragRect.x - ( rect.x + rect.z ) ) },
				{ anchor = rect.x,			bByLeft = false,	dist = math.abs( ( dragRect.x + dragRect.z ) - rect.x ) },
				{ anchor = rect.x + rect.z,	bByLeft = false,	dist = math.abs( ( dragRect.x + dragRect.z ) - ( rect.x + rect.z ) ) },
			}
			
			for idx, info in pairs( xLayout ) do
			
				if info.dist <= snapDistX and info.dist < minDistX then
				
					minDistX	= info.dist
					anchorX		= info.anchor
					bSnapByLeft	= info.bByLeft

				end
				
			end
			
			local yLayout =
			{	
				{ anchor = rect.y,			bByTop = true,		dist = math.abs( dragRect.y - rect.y ) },
				{ anchor = rect.y + rect.w,	bByTop = true,		dist = math.abs( dragRect.y - ( rect.y + rect.w ) ) },
				{ anchor = rect.y,			bByTop = false,		dist = math.abs( ( dragRect.y + dragRect.w ) - rect.y ) },
				{ anchor = rect.y + rect.w,	bByTop = false,		dist = math.abs( ( dragRect.y + dragRect.w ) - ( rect.y + rect.w ) ) },
			}
			
			for idx, info in pairs( yLayout ) do
			
				if info.dist <= snapDistY and info.dist < minDistY then
				
					minDistY	= info.dist
					anchorY		= info.anchor
					bSnapByTop	= info.bByTop
					
				end
				
			end
				
		end

	end
	
	for wndName, dummyWnd in pairs( self.dummies ) do
		if dummyWnd ~= dragDummyWnd then
			fnTrySnapToRect( dummyWnd:GetRect() )
		end
	end
	
	fnTrySnapToRect( Quat( 0, 0, 1024, 768 ) )	-- привязка к краям экрана
	
	if anchorX then
	
		if bSnapByLeft then
			snappedPos.x = anchorX
		else
			snappedPos.x = anchorX - dragRect.z
		end
		
	end
	
	if anchorY then
	
		if bSnapByTop then
			snappedPos.y = anchorY
		else
			snappedPos.y = anchorY- dragRect.w
		end
		
	end

	return snappedPos

end


-- -----------------------------------------------------------------------
-- UI.HudEditor_DummyWnd
-- -----------------------------------------------------------------------

UI.HudEditor_DummyWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HudEditor_DummyWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "HudEditor_DummyWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "hudEditor_dummy",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title4",
						layer		= "UI.HudEditor_DummyWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},
				}
			}},
		},
		
		-- FRAME
		{
		
			layerType	= UI.LAYER_FRAME,
			layerStyle	= UI.WLS_RESIZABLE,
			frame		= "hud_layout_win",
		},
		
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		}
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HudEditor_DummyWnd:Setup( wndName )

	self:Reset()
	
	self.wndName = wndName
	self:UpdateName()

end


--
function UI.HudEditor_DummyWnd:Reset()

	self.wndName = wndName
	
	self:SetText( "", self.layers.NAME )
	
	self:SetWidth( 0 )
	self:SetHeight( 0 )
	
	self:Select( false )
	
end


--
function UI.HudEditor_DummyWnd:UpdateForConfig()

	self:UpdateSize()
	self:UpdateNameColor()

end


--
function UI.HudEditor_DummyWnd:GetWndName()

	return self.wndName
	
end


--
function UI.HudEditor_DummyWnd:Select( bSelect )

	self.bSelected = bSelect
	self:UpdateFrame()

end


--
function UI.HudEditor_DummyWnd:IsSelected()

	return self.bSelected

end


-- -----------------------------
-- const
-- -----------------------------

UI.HudEditor_DummyWnd.layers =
{
	MAIN_EFFECT	= 0,
	FRAME		= 1,
	NAME		= 2,
}

UI.HudEditor_DummyWnd.effectInfo =
{
	main =
	{
		nameColorVisibleLocator		= "title4",
		nameColorInvisibleLocator	= "title_color",
	}
}

-- -----------------------------
-- vars
-- -----------------------------

UI.HudEditor_DummyWnd.wndName	= ""
UI.HudEditor_DummyWnd.bSelected	= true

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HudEditor_DummyWnd:UpdateName()
	
	local str = UI.HudEditorWnd:GetWndLocalizedName( self.wndName )
	self:SetText( str, self.layers.NAME )
	
end


--
function UI.HudEditor_DummyWnd:UpdateNameColor()

	local color = UI.TEXT_BASE_COLOR
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		color = mainEffect:GetObjColor( UI.HudEditor:IsWndVisible( self.wndName ) and self.effectInfo.main.nameColorVisibleLocator or self.effectInfo.main.nameColorInvisibleLocator )
	end
	
	color = UI:SetAlpha( color, UI:GetAlpha( self:GetColor( self.layers.NAME ) ) )
	
	self:SetColor( color, self.layers.NAME )

end


--
function UI.HudEditor_DummyWnd:UpdateSize()
	
	local selfSize = UI.HudEditor:GetWndSize( self.wndName )
	
	self:SetWidth( selfSize.x )
	self:SetHeight( selfSize.y )
	
end


--
function UI.HudEditor_DummyWnd:UpdateFrame()
	
	self:SetFrame( self.bSelected and "hud_layout_win_select" or "hud_layout_win", self.layers.FRAME )
	
end


--
function UI.HudEditor_DummyWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateSize()

end

-- -----------------------------------------------------------------------
-- UI.HudEditor_ParamsWnd
-- -----------------------------------------------------------------------

UI.HudEditor_ParamsWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HudEditor_ParamsWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "HudEditor_ParamsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "hudEditor_params",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "title",
						layer		= "UI.HudEditor_ParamsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "arrow_btn",
						layer		= "UI.HudEditor_ParamsWnd.layers.MOVE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "layout_btn",
						wnd			= "UI.HudEditor_Params_ConfigsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "button_3",
						wnd			= "UI.HudEditor_Params_DefaultBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "button_2",
						wnd			= "UI.HudEditor_Params_SaveBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_1",
						wnd			= "UI.HudEditor_Params_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "title_3",
						layer		= "UI.HudEditor_ParamsWnd.layers.WINDOWS_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "chek_box",
						wnd			= "UI.HudEditor_Params_VisibleCheckBox",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "drop_down",
						wnd			= "UI.HudEditor_Params_WindowsComboBox",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hudEditor_params_caption" )
		},
		
		-- MOVE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hudEditor_params_moveIco",
				defaultAnimation	= "idle",
			}}
		},
		
		-- WINDOWS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hudEditor_params_selWnd" ),
		},
	},
	
	children =
	{
		"UI.HudEditor_Params_ConfigsListWnd",
		"UI.HudEditor_Params_DefaultBtn",
		"UI.HudEditor_Params_SaveBtn",
		"UI.HudEditor_Params_CancelBtn",
		"UI.HudEditor_Params_VisibleCheckBox",
		"UI.HudEditor_Params_WindowsComboBox",
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HudEditor_ParamsWnd:GetDragRect()
	
	return self.dragRect
	
end


--
function UI.HudEditor_ParamsWnd:OnParamChanged( configId, wndName, paramName )

	self:UpdateSaveBtn()
	
	if configId == UI.HudEditor:GetCurConfig() then
	
		self:UpdateDefaultBtn()
		
		if wndName == UI.HudEditorWnd:GetSelWndName() and paramName == UI.HudEditor.VISIBLE_PARAM_NAME then
			self:UpdateVisibleCheckBox()
		end
		
	end

end


--
function UI.HudEditor_ParamsWnd:OnCurConfigChanged()

	UI.HudEditor_Params_ConfigsListWnd:OnCurConfigChanged()
	self:UpdateSaveBtn()
	self:UpdateDefaultBtn()
	self:UpdateVisibleCheckBox()

end


--
function UI.HudEditor_ParamsWnd:OnCancelChanges()

	UI.HudEditor_Params_ConfigsListWnd:OnCancelChanges()
	self:UpdateSaveBtn()
	self:UpdateDefaultBtn()
	self:UpdateVisibleCheckBox()
	
end


--
function UI.HudEditor_ParamsWnd:OnSaveChanges()

	self:UpdateSaveBtn()
	self:UpdateDefaultBtn()
	self:UpdateVisibleCheckBox()
	
end


--
function UI.HudEditor_ParamsWnd:OnResetConfigToDefault( configId )
	
	self:UpdateSaveBtn()
	
	if configId == UI.HudEditor:GetCurConfig() then
		self:UpdateDefaultBtn()
		self:UpdateVisibleCheckBox()
	end
	
end


--
function UI.HudEditor_ParamsWnd:OnSelWndChanged()
	
	self:UpdateWindowsComboBoxSelection()
	self:UpdateVisibleCheckBox()
	
end


-- -----------------------------
-- const
-- -----------------------------

UI.HudEditor_ParamsWnd.layers =
{
	MAIN_EFFECT		= 0,
	CAPTION			= 1,
	MOVE_ICO_EFFECT	= 2,
	WINDOWS_LABEL	= 3,
}

UI.HudEditor_ParamsWnd.effectInfo =
{
	main =
	{
		dragRectLocator	= "area",
	}
}

-- -----------------------------
-- vars
-- -----------------------------

UI.HudEditor_ParamsWnd.dragRect	= Quat( 0, 0, 0, 0 )

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HudEditor_ParamsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
	
		local dragRectPos	= mainEffect:GetObjPos( self.effectInfo.main.dragRectLocator )
		local dragRectSize	= mainEffect:GetObjSize( self.effectInfo.main.dragRectLocator )
		
		self.dragRect.x, self.dragRect.y, self.dragRect.z, self.dragRect.w = dragRectPos.x, dragRectPos.y, dragRectSize.x, dragRectSize.y
		
	end
	
	UI.HudEditor_Params_VisibleCheckBox:Enable( false )
	self:InitWindowsList()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )

end


--
function UI.HudEditor_ParamsWnd:InitWindowsList()

	local windowsSorted = {}
	
	for wndName, wndInfo in pairs( UI.HudEditor.windowsInfo ) do
	
		local bNeedShow = true
	
		-- SC-111991 хаком скрываются пассивные модули, пока режим Battle Royale в стадии прототипа
		if wndName == "HudModulesWnd_passiveModules" and not UI.passiveModulesEditEnabled then
			bNeedShow = false
		end

		if bNeedShow then
		
			local localizedName = UI.HudEditorWnd:GetWndLocalizedName( wndName )
		
			local wndData =
			{
				wndName				= wndName,
				localizedName		= localizedName,
				localizedName_low	= _G.Utf8CaseFold_Transform( localizedName ),
			}
			
			table.insert( windowsSorted, wndData )
			
		end
		
	end
	
	local function fnSort( wndData1, wndData2 )
		return wndData1.localizedName_low < wndData2.localizedName_low
	end
	
	table.sort( windowsSorted, fnSort )
	
	for wndIdx, wndData in ipairs( windowsSorted ) do
		UI.HudEditor_Params_WindowsComboBox:AddRecord( { wndName = wndData.wndName, text = wndData.localizedName } )
	end
	
	self:UpdateWindowsComboBoxSelection()
	
end


--
function UI.HudEditor_ParamsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if wnd == UI.HudEditor_Params_DefaultBtn then
		
		UI.HudEditor:ResetConfigToDefault( UI.HudEditor:GetCurConfig() )
		UI:PlayGlobalSound( UI.sounds.btnClick )
		
	elseif wnd == UI.HudEditor_Params_SaveBtn then
	
		UI.HudEditor:Save()
		UI:PlayGlobalSound( UI.sounds.btnClick )
	
	elseif wnd == UI.HudEditor_Params_CancelBtn then
	
		UI.HudEditorWnd:OnCancel()
		UI:PlayGlobalSound( UI.sounds.btnClick )
		
	elseif wnd == UI.HudEditor_Params_VisibleCheckBox then
	
		UI.HudEditor:SetWndVisible( UI.HudEditorWnd:GetSelWndName(), not UI.HudEditor_Params_VisibleCheckBox:IsChecked() )
		UI:PlayGlobalSound( UI.sounds.btnClick )
		
	end
	
	return false	-- чтобы родитель тоже обработал
	
end


--
function UI.HudEditor_ParamsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateSaveBtn()
	self:UpdateDefaultBtn()
	
end


--
function UI.HudEditor_ParamsWnd:UpdateSaveBtn()

	UI.HudEditor_Params_SaveBtn:Enable( UI.HudEditor:IsChanged() )

end


--
function UI.HudEditor_ParamsWnd:UpdateDefaultBtn()

	UI.HudEditor_Params_DefaultBtn:Enable( not UI.HudEditor:IsConfigDefault( UI.HudEditor:GetCurConfig() ) )

end


--
function UI.HudEditor_ParamsWnd:UpdateVisibleCheckBox()
	
	local selWndName = UI.HudEditorWnd:GetSelWndName()
	
	if selWndName ~= "" then
		UI.HudEditor_Params_VisibleCheckBox:Check( UI.HudEditor:IsWndVisible( selWndName ) )
		UI.HudEditor_Params_VisibleCheckBox:Enable( true )
	else
		UI.HudEditor_Params_VisibleCheckBox:Check( false )
		UI.HudEditor_Params_VisibleCheckBox:Enable( false )
	end
	
end


--
function UI.HudEditor_ParamsWnd:UpdateWindowsComboBoxSelection()
	
	local selRecordIdx = -1
	
	local selWndName = UI.HudEditorWnd:GetSelWndName()
	if selWndName ~= "" then
	
		for recordIdx = 1, UI.HudEditor_Params_WindowsComboBox:GetNumRecords() do
			if UI.HudEditor_Params_WindowsComboBox:GetRecordData( recordIdx ).wndName == selWndName then
				selRecordIdx = recordIdx
				break
			end
		end
	
	end
	
	UI.HudEditor_Params_WindowsComboBox:SelectRecord( selRecordIdx )
	
end


--
function UI.HudEditor_ParamsWnd:F_OnEventComboSelectRecord( hSender, selRecordIdx, oldSelRecordIdx, fParam0, fParam1 )

	if hSender == UI.HudEditor_Params_WindowsComboBox:GetUiHandle() then
		UI.HudEditorWnd:SelectWnd( UI.HudEditor_Params_WindowsComboBox:GetRecordData( selRecordIdx ).wndName )
	end

end


-- -----------------------------------------------------------------------
-- UI.HudEditor_Params_ConfigsListWnd
-- -----------------------------------------------------------------------

UI.HudEditor_Params_ConfigsListWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HudEditor_Params_ConfigsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",
	
	props =
	{
		name		= "HudEditor_Params_ConfigsListWnd",
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
				defName 			= "hudEditor_params_configsList",
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
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HudEditor_Params_ConfigsListWnd:OnCurConfigChanged()
	
	self:UpdateSelection()

end


--
function UI.HudEditor_Params_ConfigsListWnd:OnCancelChanges()
	
	self:UpdateSelection()

end

-- -----------------------------
-- const
-- -----------------------------

UI.HudEditor_Params_ConfigsListWnd.btnPrototypeName	= "HudEditor_Params_ConfigSlotWnd"
UI.HudEditor_Params_ConfigsListWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.HudEditor_Params_ConfigsListWnd.MAX_SLOTS		= 4

UI.HudEditor_Params_ConfigsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "layout_btn_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HudEditor_Params_ConfigsListWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )
	
	self:InitConfigSlots()

end


--
function UI.HudEditor_Params_ConfigsListWnd:InitConfigSlots()

	for configId = 1, UI.HudEditor.MAX_CONFIGS do
		self:AddRecord( { configId = configId } )
	end

end


--
function UI.HudEditor_Params_ConfigsListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateSelection()
	
end


--
function UI.HudEditor_Params_ConfigsListWnd:UpdateSelection()

	local curConfigId = UI.HudEditor:GetCurConfig()
	
	if curConfigId >= 1 and curConfigId <= self:GetNumRecords() then
		self:SelectRecord( curConfigId )
	else
		sys.log( "UI.HudEditor_Params_ConfigsListWnd:UpdateSelConfig()[ERROR]: no slot for config %d", curConfigId )
	end

end


--
function UI.HudEditor_Params_ConfigsListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if UI:IsWndKindOf( wnd, "HudEditor_Params_ConfigSlotWnd" ) then
	
		local selConfigId = wnd:GetRecordData().configId
		if selConfigId ~= UI.HudEditor:GetCurConfig() then
		
			UI.HudEditor:SetCurConfig( selConfigId )
			UI:PlayGlobalSound( UI.sounds.btnClick )
			
		end
		
	end
	
	return true
	
end

-- -----------------------------------------------------------------------
-- UI.HudEditor_Params_ConfigSlotWnd
-- -----------------------------------------------------------------------

UI.HudEditor_Params_ConfigSlotWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HudEditor_Params_ConfigSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",
	
	props =
	{
		name		= "HudEditor_Params_ConfigSlotWnd",
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
				defName 			= "hudEditor_params_configSlot",
				defaultAnimation	= "off",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.HudEditor_Params_ConfigSlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}},
		},
		
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hudEditor_params_configSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HudEditor_Params_ConfigSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )
	
	self:SetText( "", self.layers.TEXT )
	self:SetMouseOver( false )
	
end


--
function UI.HudEditor_Params_ConfigSlotWnd:Select( bSelect, bAnimated )	

	self:UpdateMainAnimation()
	self:UpdateMouseOver()
	
end

-- -----------------------------
-- const
-- -----------------------------

UI.HudEditor_Params_ConfigSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	TEXT				= 1,
	MOUSE_OVER_EFFECT	= 2,
}

UI.HudEditor_Params_ConfigSlotWnd.effectInfo =
{
	main =
	{
		animSel		= "on_sel",
		animNotSel	= "off",
	}
}

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HudEditor_Params_ConfigSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateText( data )
	self:UpdateMainAnimation()
	self:UpdateMouseOver()

end


--
function UI.HudEditor_Params_ConfigSlotWnd:UpdateText( data )

	local str = tostring( data.configId )
	self:SetText( str, self.layers.TEXT )
	
end


--
function UI.HudEditor_Params_ConfigSlotWnd:UpdateMainAnimation()
	
	local anim = self:IsSelected() and self.effectInfo.main.animSel or self.effectInfo.main.animNotSel
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end
	
end


--
function UI.HudEditor_Params_ConfigSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if not self:IsSelected() then
		bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.HudEditor_Params_ConfigSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.HudEditor_Params_ConfigSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.HudEditor_Params_ConfigSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.HudEditor_Params_ConfigSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end

-- -----------------------------------------------------------------------
-- UI.HudEditor_Params_DefaultBtn
-- -----------------------------------------------------------------------

UI.HudEditor_Params_DefaultBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "HudEditor_Params_DefaultBtn",
		}
	},
	
	textId	= "hudEditor_params_defaultBtn"
}

-- -----------------------------------------------------------------------
-- UI.HudEditor_Params_SaveBtn
-- -----------------------------------------------------------------------

UI.HudEditor_Params_SaveBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "HudEditor_Params_SaveBtn",
		}
	},
	
	textId	= "hudEditor_params_saveBtn"
}

-- -----------------------------------------------------------------------
-- UI.HudEditor_Params_CancelBtn
-- -----------------------------------------------------------------------

UI.HudEditor_Params_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "HudEditor_Params_CancelBtn",
		}
	},
	
	textId	= "hudEditor_params_cancelBtn"
}

-- -----------------------------------------------------------------------
-- UI.HudEditor_Params_VisibleCheckBox
-- -----------------------------------------------------------------------

UI.HudEditor_Params_VisibleCheckBox = {}

-- -----------------------------
-- window definition
-- -----------------------------

--
UI.HudEditor_Params_VisibleCheckBox.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

--
UI.HudEditor_Params_VisibleCheckBox.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",
	
	props =
	{
		name	= "HudEditor_Params_VisibleCheckBox",
	},
	
	layers =
	{
		numLayers = UI:GetTableLength( UI.HudEditor_Params_VisibleCheckBox.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "login_rememberCheckBox",
				defaultAnimation	= "idle",

				links =
				{
				
					{
						objName		= "self_2",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.HudEditor_Params_VisibleCheckBox.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}},
		},
		
		-- TEXT
		{
			id				= UI.HudEditor_Params_VisibleCheckBox.layers.TEXT,
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hudEditor_params_visible" )
		}
	}
}

-- -----------------------------
-- const
-- -----------------------------

UI.HudEditor_Params_VisibleCheckBox.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle_over",
		animationPressed	= "idle_over",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "chek",
		animationSelect		= "chek_over",
		animationPressed	= "chek_over",
		animationDisabled	= "disable",
	},
}

-- -----------------------------------------------------------------------
-- UI.HudEditor_Params_WindowsComboBox
-- -----------------------------------------------------------------------

UI.HudEditor_Params_WindowsComboBox =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "HudEditor_Params_WindowsComboBox"
		},
	},

	MAX_VISIBLE_RECORDS = 10
}