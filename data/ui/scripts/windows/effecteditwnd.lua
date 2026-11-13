-- ----------------------------------------------------------------------------
--
-- Workfile: effecteditwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.EffectEditWnd = {}

-- --------------------------------------
-- window definiiton
-- --------------------------------------

UI.EffectEditWnd.layers =
{
    MAIN_EFFECT		= 0,
    SELECTION		= 1,
    TEXT			= 2,
    CURSOR			= 3,
}

UI.EffectEditWnd.def =
{   	
 	className	= "EditWnd",

 	props =
 	{
 		name					= "EffectEditWnd",
 		style					= UI.WS_UPDATE_IF_VISIBLE + UI.WS_ACTIVATE_ON_LMOUSE_CLICK,
 		activationOrder			= 0,
		isPrototype				= true,

 		-- EditWnd props
         editStyle				= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL,
         symbolsLimit			= -1,
         textLayer				= UI.EffectEditWnd.layers.TEXT,
         selectionLayer			= UI.EffectEditWnd.layers.SELECTION,
         cursorLayer			= UI.EffectEditWnd.layers.CURSOR,
         textLayerEdges			= Quat( 0, 0, 0, 0 ),
         cursorSpaceTextTop		= 0,
         cursorSpaceTextBottom	= 0,
         selSpaceTextTop		= 0,
         selSpaceTextBottom		= 0,
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

 		-- SELECTION
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			texture		= "white",
 		},

 		-- TEXT
 		{
 			layerType	= UI.LAYER_TEXT,

    		formatFlags	= FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS,
 			formatInfoSz= { 1, 1 },
    		font =
 			{                                                                          	
    			fontName = "Small",
    		}
 		},			

 		-- CURSOR
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			rect		= Quat( 0, 0, 2, 0 ),
 			texture		= "white",
 		},
 	}
}

-- --------------------------
-- animations
-- -------------------------- 

UI.EffectEditWnd.animations =
{
	CursorTwinkle =
	{
		length = 0.8,
		loop = true,

		onStop = function( self, w, animation )

			if not UI:IsInRemovingAllWindows() then
				w:SetLayerVisible( true, w.layers.CURSOR )
			end

		end,

		keys =
		{
			{
				time	= 0,

				action	= function( self, w, animation )
					w:SetLayerVisible( true, w.layers.CURSOR )
				end,
			},

			{
				time	= 0.5,

				action	= function( self, w, animation )
					w:SetLayerVisible( false, w.layers.CURSOR )
				end,
			},
		}
	},
}

-- --------------------------------------
-- const
-- --------------------------------------

UI.EffectEditWnd.effectInfo =
{
	main =
	{
		textObjName				= "input_line_text",
		selectionColorObjName	= "selection_color",
		cursorColorObjName		= "cursor_color",
		animActive				= "select",
		animInactive			= "deselect",
		animDisabled			= "disable",
	}
}


-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.EffectEditWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:Update( 0 )

		local handle = self:GetUiHandle()
		mainEffect:LinkLayer( handle, self.layers.SELECTION, self.effectInfo.main.selectionColorObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
		mainEffect:LinkLayer( handle, self.layers.CURSOR, self.effectInfo.main.cursorColorObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
		mainEffect:LinkLayer( handle, self.layers.TEXT, self.effectInfo.main.textObjName, UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALPHA )


		local selfRect = self:GetRect()

		local textPos = mainEffect:GetObjPos( self.effectInfo.main.textObjName )
		local textSize = mainEffect:GetObjSize( self.effectInfo.main.textObjName )

		local edges = UI:Quat( textPos.x, textPos.y, selfRect.z - ( textPos.x + textSize.x ), selfRect.w - ( textPos.y + textSize.y ) )
		self:SetTextLayerEdges( edges )		

	end

end


--
function UI.EffectEditWnd:F_OnObtainKeyboardFocus()

	self:OnObtainKeyboardFocus()

	local child = self
	local parent = self:GetParent()
	
	while parent do
		
		parent:SetDefaultActivatableChild( child:GetName() )
		
		if parent ~= UI.Root then
			parent:AddStyle( UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN )
		end
		
		if parent.OnEditObtainKeyboardFocus then
			parent:OnEditObtainKeyboardFocus( self )
		end

		child = parent
		parent = parent:GetParent()
		
	end
	

end


--
function UI.EffectEditWnd:F_OnLostKeyboardFocus()

	self:OnLostKeyboardFocus()
	
	self:ResetDefaultActivatableChildHierarchy( self:GetParent() )

end


--
function UI.EffectEditWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	
	self:ResetDefaultActivatableChildHierarchy( parent )

end


--
function UI.EffectEditWnd:ResetDefaultActivatableChildHierarchy( parent )

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		local child = self
		
		while parent do
			
			if parent:GetDefaultActivatableChildName() == child:GetName() then
			
				parent:SetDefaultActivatableChild( "" )
				
				if parent ~= UI.Root then
					parent:RemoveStyle( UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN )
				end
				
			end
			
			if parent.OnEditLostKeyboardFocus then
				parent:OnEditLostKeyboardFocus( self )
			end

			child = parent
			parent = parent:GetParent()
			
		end

	end

end


--
function UI.EffectEditWnd:F_UpdateAppearance()

	if not self:IsPrototype() then
		self:UpdateMainAnimation()
	end

end


--
function UI.EffectEditWnd:UpdateMainAnimation()

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local animation = ""
	local curAnimation = mainEffect:GetCurAnimation()

	if self:HasStyle( UI.WS_GRAYED ) or self:HasStyle( UI.WS_DISABLE ) then
		animation = self.effectInfo.main.animDisabled
	else
		animation = ( UI:GetKeyboardFocus() == self:GetUiHandle() ) and self.effectInfo.main.animActive or self.effectInfo.main.animInactive
	end

	if animation and animation ~= "" and animation ~= curAnimation then
		mainEffect:StartAnimation( animation )
	end

end


--
function UI.EffectEditWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.EffectEditWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.EffectEditWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if UI:GetKeyboardFocus() ~= self:GetUiHandle() then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	

	local rect = self:GetRect()

	local parent = self:GetParent()
	if parent then
		rect = parent:ToScreen( rect )
	end

	if not UI:IsPtInRect( rect, mouseX, mouseY ) then

		if parent.OnEditMissMouse then
			parent:OnEditMissMouse( self )
		end
	end

end


--
function UI.EffectEditWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then
    	return self:OnKeyboardKeyDown( key, wndThatReceivedInput )
	else
    	return false
	end		

end