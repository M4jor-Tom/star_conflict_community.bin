-- ----------------------------------------------------------------------------
--
-- Workfile: helpwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HelpWnd = {}
local hw = UI.HelpWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HelpWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",
	
	props =
	{
		name	= "HelpWnd",
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
				defName 			= "help_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "help_win",	
						layer		= "UI.HelpWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- legacy from FullScreenSelectionWnd
		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "help_work",
				defaultAnimation	= "idle",
	
				links =
				{
					{
						objName		= "title",	
						layer		= "UI.HelpWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "choice_main",	
						wnd			= "UI.Help_PageChoiceWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.Help_CrossBtn",
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
		},
	},

	children = { "UI.Help_PageChoiceWnd", "UI.Help_CrossBtn", "UI.Help_SkipCheckBox" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HelpWnd:Setup( theme, mode, selPage )

	self:Reset()

	if type( theme ) ~= "string" then
		sys.log( "UI.HelpWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"theme\"); \"string\" expected, got \"%s\"", type( theme ) )
		return
	end

	if not UI:IsHelpThemeValid( theme ) then
		sys.log( "UI.HelpWnd:Setup(): invalid data for theme \"%s\"", theme )
		return
	end

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.HelpWnd:Setup()[ERROR]: invalud 2-nd parameter (\"mode\"); one of the \"UI.HelpWnd.modes\" values expected, got \"%s\"", tostring( mode ) )
		mode = self.modes.USER
	end

	if selPage ~= nil then
		if type( selPage ) ~= "number" then
			sys.log( "UI.HelpWnd:Setup()[ERROR]: invalid type of the 3-nd parameter (\"selPage\"); \"number\" expected, got \"%s\"", type( selPage ) )
			selPage = 1

		elseif not self:GetPageInfo( theme, selPage ) then
			sys.log( "UI.HelpWnd:Setup()[ERROR]: cannot find page %d in theme \"%s\"", selPage, theme )
			selPage = 1
		end
	else
		selPage = 1
	end

	self.mode	= mode
	self.theme	= theme
	self.page	= selPage

	self:FullUpdate2()	

	if self:IsOnScreen() then
		self:CheckSaveState()
	end

end


--
function UI.HelpWnd:Close( bSound )

	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end

	self:Hide()

	UI:CheckAutoShowContextHelp( false )

end


--
function UI.HelpWnd:GetMode()

	return self.mode

end


-- ------------------------------
-- const
-- ------------------------------

hw.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
	CAPTION			= 3,
}

hw.effectInfo =
{
	work =
	{
		icoSpriteName		= "objectName",
		skipCheckBoxLocator	= "check_box",
	}
}

hw.defaultTexName = "NoData"
hw.strHelp = UI:GetStringByName( "helpCaption" )

hw.sounds =
{
	show		= "sound/ui/btnClick",
	hide		= "sound/ui/MsgHide",
	changePage	= "sound/ui/btnClick",
}

hw.modes =
{
	USER		= 1,
	AUTO		= 2,
	TUTORIAL	= 3,
}

-- ------------------------------
-- vars
-- ------------------------------

hw.theme 			= ""
hw.page				= -1
hw.pageChoiceWnd	= nil
hw.mode				= -1

-- ------------------------------
-- vars
-- ------------------------------

--
function UI.HelpWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.pageChoiceWnd = UI.Help_PageChoiceWnd 

	-- чтобы впоследствии не сделать unload для оригинальной текстуры, которая была в эффекте
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )	
	if workEffect then
		workEffect:SetSpriteTexture( self.effectInfo.work.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:Reset()

end


--
function UI.HelpWnd:Reset()

	self:SetText( "", self.layers.CAPTION )

	self.pageChoiceWnd:HideArrows()
	self.pageChoiceWnd:Reset()

	self:ReleaseImage()
	self:HideSkipCheckBox()

	self.theme	= ""
	self.page	= -1
	self.mode	= -1
	
end


-- ("2", чтобы отличалось от FullUpdate(), которая вызывается при показе окна )
function UI.HelpWnd:FullUpdate2()

	self:UpdateCaption()
	self:UpdateSkipCheckBox()

	self:SetPage( self.page )

end


--
function UI.HelpWnd:FullUpdate()
end


--
function UI.HelpWnd:UpdateCaption()

	local theme = UI:HelpTheme2Str( self.theme )
	local str = string.format( "%s: %s", self.strHelp, theme )

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.HelpWnd:UpdatePageChoice()

	local strId = string.format( "helpPage_%s_%d", self.theme, self.page )
	local str = UI:GetStringByName( strId )

	local bLeftArrow	= self:GetNextPage( false ) ~= -1
	local bRightArrow	= self:GetNextPage( true ) ~= -1

	self.pageChoiceWnd:Setup( str, bLeftArrow, bRightArrow )

	if bLeftArrow or bRightArrow then
		self.pageChoiceWnd:ShowArrows()
	else
		self.pageChoiceWnd:HideArrows()
	end

end


--
function UI.HelpWnd:UpdateImage()

	self:ReleaseImage()

	local pageInfo = self:GetPageInfo( self.theme, self.page )
	if not pageInfo then
		sys.log( "UI.HelpWnd:UpdateImage()[ERROR]: no page info" )
		return
	end

	local texFileName = pageInfo
	if type( texFileName ) ~= "string" then
		sys.log( "UI.HelpWnd:UpdateImage()[ERROR]: invalid page info format for theme %s, page %d", self.theme, self.page )
		return
	end

	self:LoadImage( texFileName )	

end


--
function UI.HelpWnd:ReleaseImage()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local hTex = workEffect:GetSpriteTexture( self.effectInfo.work.icoSpriteName )

	if hTex ~= UI.INVALID_RESOURCE_HANDLE then

		workEffect:SetSpriteTexture( self.effectInfo.work.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )

		local rc = UI:GetResourceByHandle( hTex )
		if rc and rc:GetName() ~= self.defaultTexName then
			UI:UnloadTexture( hTex, true )
		end

	end

end


--
function UI.HelpWnd:LoadImage( texFileName )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local path = string.format( "%s/%s", self:GetTexturesPath(), texFileName )

	local hTex = UI:LoadTexture( "helpImage", path, UI:ZeroQuat() )

	if hTex == UI.INVALID_RESOURCE_HANDLE then
		hTex = UI:GetTex( self.defaultTexName )
	end

	workEffect:SetSpriteTexture( self.effectInfo.work.icoSpriteName, hTex )

end


--
function UI.HelpWnd:SetPage( page )

	self.page = page

	self:UpdatePageChoice()
	self:UpdateImage()

end


--
function UI.HelpWnd:GetThemeInfo( theme )

	return UI.Help and UI.Help.themesByName and UI.Help.themesByName[ theme ]

end


--
function UI.HelpWnd:GetPageInfo( theme, page )

	local themeInfo = self:GetThemeInfo( theme )
	local textures = themeInfo and themeInfo.textures
	return textures and textures[ page ]

end


--
function UI.HelpWnd:GetTexturesPath()

	local path = UI.Help and UI.Help.path

	if not path then
		sys.log( "UI.HelpWnd:GetTexturesPath()[ERROR]: cannot find \"UI.Help.path\"" )
		return ""
	end

	local language = UI:GetLanguage()
	path = string.format( path, language )

	return path

end


--
function UI.HelpWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w.CHOICE_ARROW_RIGHT then
		self:ScrollPage( true )

	elseif w.CHOICE_ARROW_LEFT then
		self:ScrollPage( false )

	elseif w == UI.Help_CrossBtn then
		self:Close( true )

	elseif w == UI.Help_SkipCheckBox then
		self:ToggleSkipAutoHelp()
	end

	return true

end


--
function UI.HelpWnd:OnEscape( key, controllerIdx )

	self:Close( true )	

	return true

end


--
function UI.HelpWnd:ScrollPage( bForward )

	local nextPage = self:GetNextPage( bForward )
	if nextPage ~= -1 then
		UI:PlayGlobalSound( self.sounds.changePage )
		self:SetPage( nextPage )
	end

end


--
function UI.HelpWnd:GetNextPage( bForward )

	if self.page == -1 then
		return -1
	end

	local themeInfo = self:GetThemeInfo( self.theme )
	if not themeInfo then
		sys.log( "UI.HelpWnd:GetNextPage()[ERROR]: no theme info" )
		return -1		
	end

	local numPages = themeInfo.textures and #themeInfo.textures or 0
	if numPages == 0 then
		sys.log( "UI.HelpWnd:GetNextPage()[ERROR]: no pages" )
		return -1				
	end

	local nextPage = self.page + ( bForward and 1 or -1 )
	if nextPage < 1 or nextPage > numPages then
		return -1				
	end

	return nextPage

end


--
function UI.HelpWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	self:CheckSaveState()

	UI:PlayGlobalSound( self.sounds.show )

end


--
function UI.HelpWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	self:Reset()

end


--
function UI.HelpWnd:CheckSaveState()

	if not _G.MasterServer_IsConnected() then
		return
	end

	if self.theme == "" then
		return
	end

	if self.mode == self.modes.TUTORIAL then
		return
	end

	local shownState = UI.serverData.userData.helpShown and UI.serverData.userData.helpShown[ self.theme ]
	if shownState ~= nil and shownState ~= false and shownState ~= 0 then
		return
	end	

	local helpT = UI.serverData.userData.helpShown

	if not helpT then
		helpT = {}
		UI.serverData.userData.helpShown = helpT
	end

	helpT[ self.theme ] = 1

	UI:SaveServerUserData()

end


--
function UI.HelpWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	UI.store.HelpWnd =
	{
		mode	= self.mode,
		theme	= self.theme,
		page	= self.page,
	}

end


--
function UI.HelpWnd:F_OnEventRestoreUiState()

	if UI.store.HelpWnd then

		if UI.store.HelpWnd.theme ~= "" then
			self:Setup( UI.store.HelpWnd.theme, UI.store.HelpWnd.mode, UI.store.HelpWnd.page )
		end

		UI.store.HelpWnd = nil

	end

end


--
function UI.HelpWnd:UpdateSkipCheckBox()

	local bNeedCheckBox = self.mode == self.modes.AUTO

	if bNeedCheckBox then
		self:ShowSkipCheckBox()
		UI.Help_SkipCheckBox:Check( UI:NeedSkipAutoHelp() )
	else
		self:HideSkipCheckBox()
	end

end


--
function UI.HelpWnd:HideSkipCheckBox()

	UI.Help_SkipCheckBox:UnlinkFromParent()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:UnlinkWnd( UI.Help_SkipCheckBox:GetUiHandle(), "" )
	end

end


--
function UI.HelpWnd:ShowSkipCheckBox()

	self:AddChild( UI.Help_SkipCheckBox )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:LinkWnd( UI.Help_SkipCheckBox:GetUiHandle(), self.effectInfo.work.skipCheckBoxLocator, UI.EffectAnimParams.POS )
	end

end


--
function UI.HelpWnd:ToggleSkipAutoHelp()

	local bNeedSkip = UI:NeedSkipAutoHelp()

	UI.Help_SkipCheckBox:Check( not bNeedSkip )
	self:SaveNeedSkipAutoHelp( not bNeedSkip )

end


--
function UI.HelpWnd:SaveNeedSkipAutoHelp( bNeedSkip )

	if not _G.MasterServer_IsConnected() then
		return
	end

	UI.serverData.userData.skipAutoHelp = bNeedSkip and 1 or 0

	UI:SaveServerUserData()

end

-- ------------------------------------------------------------------------
-- UI.Help_CrossBtn
-- ------------------------------------------------------------------------

UI.Help_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Help_CrossBtn"
		}
	}
}

-- -------------------------------------------------------------------
-- UI.Help_PageChoiceWnd
-- -------------------------------------------------------------------

UI.Help_PageChoiceWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ChoiceWnd",

		props =
		{
			name	= "Help_PageChoiceWnd"
		}
	}
}


-- ----------------------------------------------------------------------------
--  UI.Help_SkipCheckBox
-- ----------------------------------------------------------------------------

local l_numBaseCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.Help_SkipCheckBox =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "Help_SkipCheckBox",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.checkBox,
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
    				defName 			= "agreement_checkBox",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "value",	
							layer		= "UI.Help_SkipCheckBox.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},

    		-- TEXT
    		{
				id = l_numBaseCheckBoxLayers,

    			layerType	= UI.LAYER_TEXT,

       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
				text = "^help_skipCheckBox"
    		},
		}
	},

	layers =
	{
    	MAIN_EFFECT	= 0,
		DEBUG		= 1,
		TEXT		= 2,
	},

    effectInfo =
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
}