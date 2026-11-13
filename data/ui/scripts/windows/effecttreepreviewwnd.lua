-- ----------------------------------------------------------------------------
--
-- Workfile: EffectTreePreviewWnd.lua
-- Copyright й 2009, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: effecttreepreviewwnd.lua 2991 2011-05-23 12:59:17Z $
-- ----------------------------------------------------------------------------

-- TODO: не передается фокус при показе
-- TODO: не активируются элементы при скролле селекшена

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

--
local function L_EffectName2Displayable( effectName )

	return string.gsub( UI:GetFileNameFromPath( effectName, false ), "^ETP%d+_", "" )

end


--
local _ea = UI.EffectObjAlignment
local l_effect2FontAlignment =
{
	[ 0 ]																= { alignment = FONT.TF_LEFT	+ FONT.TF_TOP, 		text = "left top" },
	[ _ea.ALIGNMENT_LEFT	+ UI.EffectObjAlignment.ALIGNMENT_TOP ]		= { alignment = FONT.TF_LEFT	+ FONT.TF_TOP, 		text = "left top" },
	[ _ea.ALIGNMENT_HCENTER	+ UI.EffectObjAlignment.ALIGNMENT_TOP ]		= { alignment = FONT.TF_HCENTER	+ FONT.TF_TOP,		text = "center top" },
	[ _ea.ALIGNMENT_RIGHT	+ UI.EffectObjAlignment.ALIGNMENT_TOP ]		= { alignment = FONT.TF_RIGHT	+ FONT.TF_TOP,		text = "right top" },
	[ _ea.ALIGNMENT_HFULL	+ UI.EffectObjAlignment.ALIGNMENT_TOP ]		= { alignment = FONT.TF_FULL	+ FONT.TF_TOP,		text = "full top" },
	[ _ea.ALIGNMENT_LEFT	+ UI.EffectObjAlignment.ALIGNMENT_VCENTER ]	= { alignment = FONT.TF_LEFT	+ FONT.TF_VCENTER,	text = "left middle" },
	[ _ea.ALIGNMENT_HCENTER	+ UI.EffectObjAlignment.ALIGNMENT_VCENTER ]	= { alignment = FONT.TF_HCENTER	+ FONT.TF_VCENTER,	text = "center middle" },
	[ _ea.ALIGNMENT_RIGHT	+ UI.EffectObjAlignment.ALIGNMENT_VCENTER ]	= { alignment = FONT.TF_RIGHT	+ FONT.TF_VCENTER,	text = "right middle" },
	[ _ea.ALIGNMENT_HFULL	+ UI.EffectObjAlignment.ALIGNMENT_VCENTER ]	= { alignment = FONT.TF_FULL	+ FONT.TF_VCENTER,	text = "full middle" },
	[ _ea.ALIGNMENT_LEFT	+ UI.EffectObjAlignment.ALIGNMENT_BOTTOM ]	= { alignment = FONT.TF_LEFT	+ FONT.TF_BOTTOM,	text = "left bottom" },
	[ _ea.ALIGNMENT_HCENTER	+ UI.EffectObjAlignment.ALIGNMENT_BOTTOM ]	= { alignment = FONT.TF_HCENTER	+ FONT.TF_BOTTOM,	text = "center bottom" },
	[ _ea.ALIGNMENT_RIGHT	+ UI.EffectObjAlignment.ALIGNMENT_BOTTOM ]	= { alignment = FONT.TF_RIGHT	+ FONT.TF_BOTTOM,	text = "right bottom" },
	[ _ea.ALIGNMENT_HFULL	+ UI.EffectObjAlignment.ALIGNMENT_BOTTOM ]	= { alignment = FONT.TF_FULL	+ FONT.TF_BOTTOM,	text = "full bottom" },
}

l_horzAlignments = { UI.EffectObjAlignment.ALIGNMENT_LEFT, UI.EffectObjAlignment.ALIGNMENT_HCENTER, UI.EffectObjAlignment.ALIGNMENT_RIGHT, UI.EffectObjAlignment.ALIGNMENT_HFULL }
l_vertAlignments = { UI.EffectObjAlignment.ALIGNMENT_TOP, UI.EffectObjAlignment.ALIGNMENT_VCENTER, UI.EffectObjAlignment.ALIGNMENT_BOTTOM }


-- --------------------------------------------------------
-- UI.EffectTreePreviewWnd
-- --------------------------------------------------------

UI.EffectTreePreviewWnd = {}
local etp = UI.EffectTreePreviewWnd

-- -------------------------------
-- window definition
-- -------------------------------

UI.EffectTreePreviewWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "EffectTreePreviewWnd",
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		style			= UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		activationOrder	= 0,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0xff, 0x00, 0x00, 0x00 ),
		}
	},

	children = { "UI.ETP_MenuWnd", "UI.ETP_TexturePreviewWnd" }
}


-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.EffectTreePreviewWnd:Show( effectName, bTree )

	if effectName ~= nil then

    	if type( effectName ) ~= "string" then
    		sys.log( "UI.EffectTreePreviewWnd:Show()[ERROR]: invalid type of the 1-st parameter (effectName); \"string\" expected, got \"%s\"", type( effectName ) )
			effectName = ""
    	end

    	if bTree == nil then
    		bTree = true
    	else
    		if type( bTree ) ~= "boolean" then
    			sys.log( "UI.EffectTreePreviewWnd:Show()[ERROR]: invalid type of the 2-nd parameter (bTree); \"nil\" or \"boolean\" expected, got \"%s\"", type( bTree ) ) 
				bTree = true
    		end
    	end

	else
		effectName = ""
	end

	if effectName ~= "" then
    	self:SetEffect( effectName, bTree )

	else
		self:Reset()

    	self.launchParams.effectName		= ""
    	self.launchParams.bTree				= true
	end

	UI.ETP_MenuWnd:SetMode( UI.ETP_MenuWnd.modes.FULL )
	self:MoveChildToLastPosition( UI.ETP_MenuWnd )

	UI.Root:AddChild( self )

end


--
function UI.EffectTreePreviewWnd:Hide()

	self:UnlinkFromParent()

end


-- -------------------------------
-- const
-- -------------------------------

etp.options =
{
	SHOW_EFFECT_NAMES		= 1,
	SHOW_EFFECT_ALL_RECTS	= 2,
	SHOW_EFFECT_SEL_RECT	= 3,
	SHOW_LOCATOR_NAMES		= 4,
	SHOW_LOCATOR_ALL_RECTS	= 5,
	SHOW_LOCATOR_SEL_RECT	= 6,
	SHOW_LOCATOR_ALIGNMENT	= 7,
	EFFECT_ADJUSTMENT		= 8,
	BG_COLOR				= 9,
	LINK_ALPHA				= 10,
	LINK_COLOR				= 11,
	LINK_VISIBILITY			= 12,
}

etp.layers =
{
	BG = 0
}

-- -------------------------------
-- vars
-- -------------------------------

etp.rootItem	= nil
etp.nextItemId	= 1

etp.launchParams =
{
	effectName			= "",
	bTree				= true,
}

etp.bDragEffect			= false
etp.dragEffectMouseOrg	= Vec2( 0, 0 )
etp.rootPos				= Vec2( 0, 0 )

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.EffectTreePreviewWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.rootItem = self:CreateItemWnd()
	self:AddChild( self.rootItem )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.EffectTreePreviewWnd:SetEffect( effectName, bTree )

	self.launchParams.effectName		= effectName
	self.launchParams.bTree				= bTree

	self:Reset()

	self.rootItem:SetEffect( effectName, bTree )

	self:UpdateRootPos()

	UI.ETP_MenuWnd:SetupOnNewEffect()
	
end


--
function UI.EffectTreePreviewWnd:Reset()

	self.rootItem:Reset()
	UI.ETP_MenuWnd:Reset()

	UI.ETP_TexturePreviewWnd:Reset()
	UI.ETP_TexturePreviewWnd:UnlinkFromParent()	

	self:StopDragEffect()

end


--
function UI.EffectTreePreviewWnd:CreateItemWnd()

	local wnd = UI:CreateChildWnd( self, UI.ETP_ItemWnd, tostring( self.nextItemId ) )
	self.nextItemId = self.nextItemId + 1
	return wnd

end


--
function UI.EffectTreePreviewWnd:GetRootItem()

	return self.rootItem

end


--
function UI.EffectTreePreviewWnd:GetRootEffect()

	return self.rootItem:GetEffect()

end


--
function UI.EffectTreePreviewWnd:GetSelItem()

	local hWnd = UI.ETP_Menu_EffectsList:GetSelItemWndHandle()
	if hWnd == UI.INVALID_UI_HANDLE then
		return nil
	end

	return UI:GetUiObjByHandleT( hWnd )

end


--
function UI.EffectTreePreviewWnd:GetSelEffect()

	local wnd = self:GetSelItem()
	return wnd and wnd:GetEffect()

end


--
function UI.EffectTreePreviewWnd:GetSelAnimation()

	return UI.ETP_Menu_AnimationsList:GetSelAnimation()

end


--
function UI.EffectTreePreviewWnd:GetPlayingAnimation()

	return UI.ETP_Menu_AnimationsList:GetPlayingAnimation()

end


--
function UI.EffectTreePreviewWnd:GetSelLocator()

	return UI.ETP_Menu_LocatorsList:GetSelLocator()

end


--
function UI.EffectTreePreviewWnd:GetSelSprite()

	return UI.ETP_Menu_SpritesList:GetSelSprite()

end


--
function UI.EffectTreePreviewWnd:GetOptionVal( optionId )

	return UI.ETP_Menu_OptionsList:GetOptionVal( optionId )

end


--
function UI.EffectTreePreviewWnd:OnSelEffectChanged()

	self.rootItem:UpdateSelStatusRecursive()

	UI.ETP_Menu_EffectSelInfo:SetupForSelEffect()	
	UI.ETP_Menu_LocatorSelInfo:Reset()
	UI.ETP_Menu_SpriteSelInfo:Reset()
	UI.ETP_Menu_AnimSelInfo:Reset()

	UI.ETP_Menu_AnimationsList:SetupForSelEffect()
	UI.ETP_Menu_LocatorsList:SetupForSelEffect()
	UI.ETP_Menu_SpritesList:SetupForSelEffect()

end


--
function UI.EffectTreePreviewWnd:OnSelAnimationChanged()

	UI.ETP_MenuWnd:OnSelAnimationChanged()

end


--
function UI.EffectTreePreviewWnd:OnPlayingAnimationChanged()

	local selItem = self:GetSelItem()
	if selItem then
		selItem:OnPlayingAnimationChanged()
	end

	UI.ETP_MenuWnd:OnPlayingAnimationChanged()

end


--
function UI.EffectTreePreviewWnd:OnOptionsChanged( bSaveToFile )

	if bSaveToFile == nil then
		bSaveToFile = false
	end

	local colorId = self:GetOptionVal( self.options.BG_COLOR )
	local color = UI.ETP_Menu_OptionsList.bgColors[ colorId ]

	self:SetColor( color, self.layers.BG )
	UI.ETP_TexturePreviewWnd:SetBgColor( color )

	if self.rootItem then
		self.rootItem:UpdateDisplayRecursive()
		self.rootItem:UpdateLinksRecursive()
	end

	self:UpdateRootPos()

	if bSaveToFile then
		self:SaveSettingsToFile()		
	end

end


--
function UI.EffectTreePreviewWnd:OnSelLocatorChanged()

	local selItem = self:GetSelItem()
	if selItem then
		selItem:OnSelLocatorChanged()
	end

	UI.ETP_MenuWnd:OnSelLocatorChanged()

end


--
function UI.EffectTreePreviewWnd:OnSelSpriteChanged()

	local selItem = self:GetSelItem()
	if selItem then
		selItem:OnSelSpriteChanged()
	end

	UI.ETP_MenuWnd:OnSelSpriteChanged()

end


--
function UI.EffectTreePreviewWnd:OnResetSelLocatorUserParams()

	local selItem = self:GetSelItem()
	local effect = selItem and selItem:GetEffect()
	local locatorName = self:GetSelLocator()

	if not effect or UI:IsStrEmpty( locatorName ) then
		return
	end

	local locator = selItem:GetLocatorInfo( locatorName )
	if not locator then
		return
	end

	local idx = locator.idx
	
	locator.alignment			= effect:GetObjAlignmentById( idx ) 
	locator.text				= effect:GetObjSampleTextById( idx )
	locator.fontName			= effect:GetObjFontNameById( idx )
	locator.hFont				= _G.ObtainFont( locator.fontName )
	locator.textColor			= effect:GetObjColorById( idx )
	locator.textBackColor		= effect:GetObjBackColorById( idx )
	locator.blendMode			= effect:GetObjBlendModeById( idx )

	locator.bUserAlignment			= false
	locator.bUserText				= false
	locator.bUserFontName			= false
	locator.bUserTextColor			= false
	locator.bUserTextBackColor		= false
	locator.bUserBlendMode			= false

	if locator.bUserRelatedEffectName then
		local originalEffectName = effect:GetObjRelatedEffectNameById( idx ) or ""
		self:OnLoadLocatorEffect( originalEffectName, false )
	end

end


--
function UI.EffectTreePreviewWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	local effectNodesLinear = self:GetEffectNodesLinear()

	local effectInfos = {}
	self:SaveEffectInfo( effectNodesLinear, effectInfos )	

	local selTab = 0

	if UI.ETP_Menu_AnimsBtn:IsChecked() then
		selTab = 1
	elseif UI.ETP_Menu_LocatorsBtn:IsChecked() then
		selTab = 2
	elseif UI.ETP_Menu_SpritesBtn:IsChecked() then
		selTab = 3
	end

	UI.store.EffectTreePreviewWnd =
	{
		effectName			= self.launchParams.effectName,
		bTree				= self.launchParams.bTree,
		selTab				= selTab,
		effectInfos			= effectInfos,
	}

end


--
function UI.EffectTreePreviewWnd:F_OnEventRestoreUiState()

	local t = UI.store.EffectTreePreviewWnd

	if not t then
		return
	end

	UI.store.EffectTreePreviewWnd = nil

	if t.effectName == "" then
		self:Reset()
		return
	end

	self:Show( t.effectName, t.bTree )

	local effectNodesLinear = self:GetEffectNodesLinear()
	self:RestoreEffectInfo( effectNodesLinear, t.effectInfos )

	if t.selTab == 1 then
		UI.ETP_MenuWnd:ShowAnimations()
	elseif t.selTab == 2 then
		UI.ETP_MenuWnd:ShowLocators()
	elseif t.selTab == 3 then
		UI.ETP_MenuWnd:ShowSprites()
	end	

end    


--
function UI.EffectTreePreviewWnd:GetOptionsTable()

	local options = {}
	for optionName, optionId in pairs( self.options ) do

		local val = UI.ETP_Menu_OptionsList:GetOptionVal( optionId )

		if not ( optionId == self.options.EFFECT_ADJUSTMENT and val == UI.ETP_Menu_OptionsList.adjustments.NONE ) then
			options[ optionName ] = val
		end

	end

	return options

end


--
function UI.EffectTreePreviewWnd:LoadOptionsFromTable( t )

	for optionName, optionVal in pairs( t ) do

		local optionId = self.options[ optionName ]
		if optionId then
			UI.ETP_Menu_OptionsList:SetOptionVal( optionId, optionVal )
		else
			sys.log( "UI.EffectTreePreviewWnd:LoadOptionsFromTable()[ERROR]: invalid option name: \"%s\"", optionName )
		end
	end

end


--
function UI.EffectTreePreviewWnd:SaveSettingsToFile()		

	local t = self:GetOptionsTable()

	local path = self:GetSettingsPath()
	local tableName = self:GetSettingsTableName()

	_G[ tableName ] = t

	sys.dumpScriptTable( path, tableName )

	_G[ tableName ] = nil

end


--
function UI.EffectTreePreviewWnd:LoadSettingsFromFile()		

	local path = self:GetSettingsPath()
	local tableName = self:GetSettingsTableName()

	sys.execscript( path )

	local t = _G[ tableName ] or {}

	self:LoadOptionsFromTable( t )

	_G[ tableName ] = nil	

end


--
function UI.EffectTreePreviewWnd:GetSettingsPath()

	return _G.GetUserGameFolder() .. "/UiPreview/settings.lua"

end


--
function UI.EffectTreePreviewWnd:GetSettingsTableName()

	return "UiPreviewSettings"

end


--
function UI.EffectTreePreviewWnd:GetEffectNodesLinear()

	local nodes = {}
	self:AddEffectNodeLinearRecursive( UI.ETP_Menu_EffectsList.tree, nodes )
	return nodes

end


--
function UI.EffectTreePreviewWnd:AddEffectNodeLinearRecursive( curRootNode, nodes )

	if not curRootNode then
		return
	end

	table.insert( nodes, curRootNode )

	if curRootNode.nodes then
		for childNodeIdx = 1, #curRootNode.nodes do
			self:AddEffectNodeLinearRecursive( curRootNode.nodes[ childNodeIdx ], nodes )
		end
	end	

end


--
function UI.EffectTreePreviewWnd:SaveEffectInfo( effectNodesLinear, effectInfos )

	local selItem = UI.EffectTreePreviewWnd:GetSelItem()

	for effectIdx = 1, #effectNodesLinear do

		local node = effectNodesLinear[ effectIdx ]

    	local itemWnd = node.item
    	local effect = itemWnd:GetEffect()

    	local effectInfo = {}

		effectInfo.idx				= effectIdx
    	effectInfo.name				= effect:GetName()	
    	effectInfo.animations		= {}
    	effectInfo.locators			= {}
    	effectInfo.sprites			= {}
    	effectInfo.isOpen			= node.isOpen
		effectInfo.bCustomVisibility= itemWnd:IsCustomVisibility()
    	effectInfo.isVisible		= itemWnd:IsEffectVisible()
    	effectInfo.isSelected		= itemWnd == selItem

		if effectInfo.isSelected then
			effectInfo.selLocatorName	= self:GetSelLocator() or ""
			effectInfo.selAnimName		= self:GetSelAnimation() or ""
			effectInfo.selSpriteName	= self:GetSelSprite() or ""
		end

    	for animIdx = 1, #itemWnd.animations do

    		local anim = itemWnd.animations[ animIdx ]

    		local animInfo = {}
    		animInfo.name	= anim.name
    		animInfo.speed	= anim.speed			

    		table.insert( effectInfo.animations, animInfo )

    	end


    	for locatorIdx = 1, #itemWnd.locators do

    		local locator = itemWnd.locators[ locatorIdx ]			
    		local locatorInfo = {}

    		locatorInfo.name = locator.name

    		if locator.bUserRelatedEffectName then
    			locatorInfo.relatedEffectName = locator.relatedEffectName
    		end

    		if locator.bUserAlignment then
    			locatorInfo.alignment = locator.alignment
    		end

    		if locator.bUserText then
    			locatorInfo.text = locator.text
    		end

    		if locator.bUserFontName then
    			locatorInfo.fontName = locator.fontName
    		end

    		if locator.bUserTextColor then
    			locatorInfo.textColor = locator.textColor
    		end

    		if locator.bUserTextBackColor then
    			locatorInfo.textBackColor = locator.textBackColor
    		end

    		if locator.bUserBlendMode then
    			locatorInfo.blendMode = locator.blendMode
    		end			

    		locatorInfo.sprite = locator.sprite

    		table.insert( effectInfo.locators, locatorInfo )

    	end


    	for spriteIdx = 1, #itemWnd.sprites do

    		local sprite = itemWnd.sprites[ spriteIdx ]
    		
    		local spriteInfo = {}

    		spriteInfo.name		= sprite.name

    		if sprite.bUserTexName then
    			spriteInfo.texName  = sprite.texName
    		end

    		table.insert( effectInfo.sprites, spriteInfo )

    	end

    	table.insert( effectInfos, effectInfo )

	end

end


--
function UI.EffectTreePreviewWnd:RestoreEffectInfo( effectNodesLinear, effectInfos )

	local selEffectInfo = nil

	for effectIdx = 1, #effectInfos do

		local effectInfo = effectInfos[ effectIdx ]
		local node = effectNodesLinear[ effectIdx ]

		local itemWnd = node and node.item
		local effect = itemWnd and itemWnd:GetEffect()

		if not node or not effect or effect:GetName() ~= effectInfo.name then
			break
		end

		node.isOpen = effectInfo.isOpen

		if effectInfo.bCustomVisibility then
			itemWnd:SetEffectVisible( effectInfo.isVisible )
		end

		if effectInfo.isSelected then
			selEffectInfo = effectInfo
		end

		for animIdx = 1, #effectInfo.animations do

			local animInfo = effectInfo.animations[ animIdx ]
			local anim = itemWnd:GetAnimationInfo( animInfo.name )

			if anim then
				anim.speed = animInfo.speed
			end

		end


		for locatorIdx = 1, #effectInfo.locators do

			local locatorInfo = effectInfo.locators[ locatorIdx ]
			local locator = itemWnd:GetLocatorInfo( locatorInfo.name ) 

			if locator then

				-- TODO: восстанавливать locator.relatedEffectName

				if locatorInfo.alignment then
					locator.alignment = locatorInfo.alignment
					locator.bUserAlignment = true
				end

				if locatorInfo.text then
					locator.text = locatorInfo.text
					locator.bUserText = true
				end

				if locatorInfo.fontName then
					locator.fontName = locatorInfo.fontName
					locator.hFont = ObtainFont( locator.fontName )
					locator.bUserFontName = true
				end

				if locatorInfo.textColor then
					locator.textColor = locatorInfo.textColor
					locator.bUserTextColor = true
				end

				if locatorInfo.textBackColor then
					locator.textBackColor = locatorInfo.textBackColor
					locator.bUserTextBackColor = true
				end

				if locatorInfo.blendMode then
					locator.blendMode = locatorInfo.blendMode
					locator.bUserBlendMode = true
				end

				if locatorInfo.sprite and locatorInfo.sprite ~= "" then
					locator.sprite = locatorInfo.sprite
					itemWnd:UpdateETexRegionForLocator( locator )
				end

			end
		end

		
		for spriteIdx = 1, #effectInfo.sprites do

			local spriteInfo = effectInfo.sprites[ spriteIdx ]
			local sprite = itemWnd:GetSpriteInfo( spriteInfo.name )

			if sprite then

				if spriteInfo.texName and spriteInfo.texName ~= "" and spriteInfo.texName ~= sprite.texName then
					sprite.texName = spriteInfo.texName
					sprite.bUserTexName = true

					local hTex = UI:GetResourceHandleByName( sprite.texName, UI.RES_TEXTURE )
					effect:SetSpriteTexture( sprite.name, hTex )
				end
			end
		end			
	end


	UI.ETP_Menu_EffectsList:UpdateRecords()


	if selEffectInfo then

		local selNode = effectNodesLinear[ selEffectInfo.idx ]

		UI.ETP_Menu_EffectsList:SelectEffectByItem( selNode.item:GetUiHandle() )		

    	if selEffectInfo.selLocatorName ~= "" then
    		UI.ETP_Menu_LocatorsList:SelectLocator( selEffectInfo.selLocatorName )
    	end

    	if selEffectInfo.selAnimName ~= "" then

    		local animRecord = UI.ETP_Menu_AnimationsList:GetRecordByAnimation( selEffectInfo.selAnimName )
    		if animRecord then
    			UI.ETP_Menu_AnimationsList:SetSelRecord( animRecord, false, false )
    		end

    	end

    	if selEffectInfo.selSpriteName ~= "" then

    		local spriteRecord = UI.ETP_Menu_SpritesList:GetRecordBySpriteName( selEffectInfo.selSpriteName )
    		if spriteRecord then
    			UI.ETP_Menu_SpritesList:SetSelRecord( spriteRecord, false, false )
    		end

    	end

	end	

end


--
function UI.EffectTreePreviewWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
		return true
	end
		
	return self:HandleKey( key, -2 )	

end


--
function UI.EffectTreePreviewWnd:HandleKey( key, controllerIdx )

	if key == UI.Keys.KEY_F1 then
		return self:OnF1()
	else
		return UI.Wnd.HandleKey( self, key, controllerIdx )
	end

end


--
function UI.EffectTreePreviewWnd:OnEscape()

	-- если активно поле ввода, то эскейп делает его неактивным
	local hFocusWnd = UI:GetKeyboardFocus()
	if hFocusWnd ~= UI.INVALID_UI_HANLDE then
		local focusWnd = UI:GetUiObjByHandle( hFocusWnd )
		if focusWnd and focusWnd:GetClassName() == "EditWnd" then
			UI:SetKeyboardFocus( self:GetUiHandle() )
			return true
		end
	end

	-- иначе если на экране вторичная панель (например, список файлов), то эскейп скрывает ее
	if UI.ETP_MenuWnd:IsSecondaryPanelOnScreen() then
		UI.ETP_MenuWnd:HideSecondaryPanel()
		return true
	end

	-- иначе эскейп скрывает превью
	self:Hide()

	return true

end


--
function UI.EffectTreePreviewWnd:OnEnter()

	if UI.ETP_Menu_TexList:IsOnScreen() then
		UI.ETP_Menu_TexList:OnEnter()

	elseif UI.ETP_Menu_FilesList:IsOnScreen() then
		UI.ETP_MenuWnd:HideFilesList()
	end

	return true

end


--
function UI.EffectTreePreviewWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	cvars.ui_effectTimeScale = 1

end


--
function UI.EffectTreePreviewWnd:F_OnAfterHideFromScreen()

	cvars.ui_effectTimeScale = 1
	self:OnAfterHideFromScreen()

end


--
function UI.EffectTreePreviewWnd:OnLoadMainEffect( fileName )

	self:Show( fileName, true, true )

	if self.rootItem:GetEffect() then
		UI.ETP_Menu_EffectsList:SelectEffectByItem( self.rootItem:GetUiHandle() )
	end

end


--
function UI.EffectTreePreviewWnd:OnLoadLocatorEffect( fileName, bUser )

	local selItem = self:GetSelItem()
	local selLocatorName = self:GetSelLocator()

	if not selItem or not selLocatorName or selLocatorName == "" then	
		return
	end

	local nextItem = nil

	-- удаляется предыдущий эффект, который был на этом локаторе
	local childItem = selItem:GetFirstChild()
	while childItem do

		if childItem.parentLocator == selLocatorName then

			nextItem = childItem:GetNextSibling()

			UI:RemoveUiObj( childItem:GetUiHandle() )
			UI:Purge()

			break
		end
		childItem = childItem:GetNextSibling()
	end

	-- загружается новый эффект
	if not UI:IsStrEmpty( fileName ) then

    	local newChildItem = selItem:AddChildItem( fileName, selLocatorName )

    	if newChildItem and nextItem then
    		selItem:MoveChildBefore( newChildItem, nextItem )
    	end	

	end

	local locator = selItem:GetLocatorInfo( selLocatorName ) 
	locator.relatedEffectName = fileName	
	locator.bUserRelatedEffectName = bUser
	
	-- апдейт меню
	UI.ETP_MenuWnd:SetupOnNewEffect()

	-- восстанавливаются выделения
	UI.ETP_Menu_EffectsList:SelectEffectByItem( selItem:GetUiHandle() )
	UI.ETP_Menu_LocatorsList:SelectLocator( selLocatorName )
	UI.ETP_MenuWnd:ShowLocators()

end


--
function UI.EffectTreePreviewWnd:OnLoadTexture( texName )

	UI.ETP_MenuWnd:HideTexList()

	local selItem = self:GetSelItem()
	local selSpriteName = self:GetSelSprite()
	local effect = selItem:GetEffect()

	if not selItem or not selSpriteName or selSpriteName == "" then	
		return
	end

	selItem:OnSpriteTextureChanged( selSpriteName, texName )	
	UI.ETP_Menu_SpriteSelInfo:OnSelSpriteTextureChanged()	

end


--
function UI.EffectTreePreviewWnd:OnPreviewTexture( texName )

	UI.ETP_TexturePreviewWnd:SetTexture( texName )

end


--
function UI.EffectTreePreviewWnd:OnLocatorTextChanged( text )

	local selItem = self:GetSelItem()
	local selLocator = self:GetSelLocator()

	if selItem and selLocator then
		selItem:OnLocatorTextChanged( selLocator, text )
	end

end


--
function UI.EffectTreePreviewWnd:OnLocatorFontChanged( fontName )

	local selItem = self:GetSelItem()
	local selLocator = self:GetSelLocator()

	if selItem and selLocator then
		selItem:OnLocatorFontChanged( selLocator, fontName )
	end

end


--
function UI.EffectTreePreviewWnd:OnLocatorHAlignmentChanged( hAlm )

	local selItem = self:GetSelItem()
	local selLocator = self:GetSelLocator()

	if selItem and selLocator then
		selItem:OnLocatorHAlignmentChanged( selLocator, hAlm )
	end

end


--
function UI.EffectTreePreviewWnd:OnLocatorVAlignmentChanged( vAlm )

	local selItem = self:GetSelItem()
	local selLocator = self:GetSelLocator()

	if selItem and selLocator then
		selItem:OnLocatorVAlignmentChanged( selLocator, vAlm )
	end

end


--
function UI.EffectTreePreviewWnd:OnLocatorColorChanged( color )

	local selItem = self:GetSelItem()
	local selLocator = self:GetSelLocator()

	if selItem and selLocator then
		selItem:OnLocatorColorChanged( selLocator, color )
	end

end


--
function UI.EffectTreePreviewWnd:OnLocatorBackColorChanged( color )

	local selItem = self:GetSelItem()
	local selLocator = self:GetSelLocator()

	if selItem and selLocator then
		selItem:OnLocatorBackColorChanged( selLocator, color )
	end

end


--
function UI.EffectTreePreviewWnd:OnLocatorBlendChanged( blendMode )

	local selItem = self:GetSelItem()
	local selLocator = self:GetSelLocator()

	if selItem and selLocator then
		selItem:OnLocatorBlendChanged( selLocator, blendMode )
	end

end


--
function UI.EffectTreePreviewWnd:OnAnimationSpeedChanged( speed )

	local selItem = self:GetSelItem()
	local selAnimation = self:GetSelAnimation()

	if selItem and selAnimation then
		selItem:OnAnimationSpeedChanged( selAnimation, speed )
	end

end


--
function UI.EffectTreePreviewWnd:GetDefaultLinkParams()

	local linkParams = UI.EffectAnimParams.POS

	if UI.ETP_Menu_OptionsList:GetOptionVal( self.options.LINK_ALPHA ) == true then
		linkParams = linkParams + UI.EffectAnimParams.ALPHA
	end

	if UI.ETP_Menu_OptionsList:GetOptionVal( self.options.LINK_COLOR ) == true then
		linkParams = linkParams + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.BACK_COLOR
	end

	if UI.ETP_Menu_OptionsList:GetOptionVal( self.options.LINK_VISIBILITY ) == true then
		linkParams = linkParams + UI.EffectAnimParams.VISIBILITY
	end

	return linkParams

end


--
function UI.EffectTreePreviewWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.EffectTreePreviewWnd:UpdateZOrder()

	if UI.ETP_TexturePreviewWnd and UI.ETP_TexturePreviewWnd.w and UI.ETP_TexturePreviewWnd:IsOnScreen() then
		self:MoveChildToLastPosition( UI.ETP_TexturePreviewWnd )
	end

	if UI.ETP_MenuWnd and UI.ETP_MenuWnd.w and UI.ETP_MenuWnd:IsOnScreen() then
		self:MoveChildToLastPosition( UI.ETP_MenuWnd )
	end

end


--
function UI.EffectTreePreviewWnd:ShowTexturePreview()

	self:AddChild( UI.ETP_TexturePreviewWnd )

end


--
function UI.EffectTreePreviewWnd:HideTexturePreview()

	UI.ETP_TexturePreviewWnd:Reset()
	UI.ETP_TexturePreviewWnd:UnlinkFromParent()

end


--
function UI.EffectTreePreviewWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput == self:GetUiHandle() then
		self:StartDragEffect( mouseX, mouseY )
	end

	return true

end


--
function UI.EffectTreePreviewWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.bDragEffect then
		self:StopDragEffect()
	end

	return true

end


--
function UI.EffectTreePreviewWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput == self:GetUiHandle() then

    	if self.bDragEffect then

			self:DragEffect( mouseX, mouseY )

			if self:GetOptionVal( self.options.EFFECT_ADJUSTMENT ) ~= UI.ETP_Menu_OptionsList.adjustments.NONE then
				UI.ETP_Menu_OptionsList:SetOptionVal( self.options.EFFECT_ADJUSTMENT, UI.ETP_Menu_OptionsList.adjustments.NONE )
			end

    	end

	end

	return true

end


--
function UI.EffectTreePreviewWnd:StartDragEffect( mouseX, mouseY )

	if self.bDragEffect then
		return
	end

	self.bDragEffect = true

	if self.rootItem then
		self.dragEffectMouseOrg = Vec2( mouseX - self.rootItem:GetLeft(), mouseY - self.rootItem:GetTop() )
	else
		self.dragEffectMouseOrg = Vec2( 0, 0 )
	end

	UI:CaptureMouse( self:GetUiHandle() )

end


--
function UI.EffectTreePreviewWnd:StopDragEffect()

	if not self.bDragEffect then
		return
	end

	self.bDragEffect = false
	self.dragEffectMouseOrg = Vec2( 0, 0 )

	if UI:GetMouseCapture() == self:GetUiHandle() then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end

end


--
function UI.EffectTreePreviewWnd:DragEffect( mouseX, mouseY )

	if not self.bDragEffect then
		sys.log( "UI.EffectTreePreviewWnd:DragEffect()[ERROR]: not in drag mode" )
		return
	end

    if not self.rootItem then
		return
	end

	self.rootPos.x = mouseX - self.dragEffectMouseOrg.x
	self.rootPos.y = mouseY - self.dragEffectMouseOrg.y

    self.rootItem:SetPos( self.rootPos.x, self.rootPos.y )

end


--
function UI.EffectTreePreviewWnd:UpdateRootPos()

	if not self.rootItem then
		return
	end

	local adjustment = self:GetOptionVal( self.options.EFFECT_ADJUSTMENT )
	if adjustment == UI.ETP_Menu_OptionsList.adjustments.CENTER then

		local rect = self.rootItem:GetRect()
		self.rootPos.x = ( 1024 - rect.z ) / 2
		self.rootPos.y = ( 768 - rect.w ) / 2
		
		self.rootPos.x = UI:XToRel( math.floor( UI:XToAbs( self.rootPos.x ) ) );
		self.rootPos.y = UI:YToRel( math.floor( UI:YToAbs( self.rootPos.y ) ) );

	elseif adjustment == UI.ETP_Menu_OptionsList.adjustments.ZERO then

		self.rootPos.x = 0
		self.rootPos.y = 0

	end

	self.rootItem:SetPos( self.rootPos.x, self.rootPos.y )

end


-- --------------------------------------------------------
-- UI.ETP_ItemWnd
-- --------------------------------------------------------

UI.ETP_ItemWnd = {}
local etpi = UI.ETP_ItemWnd

-- -------------------------------
-- window definition
-- -------------------------------

UI.ETP_ItemWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_ItemWnd",
		rect			= Quat( 0, 0, 0, 0 ),
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype		= true,
	},

	layers =
	{
		-- EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- EFFECT_RECT
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			visible	= false,
		},

		-- LOCATOR_RECTS
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
			texture		= "white",
			visible		= false,
		},

		-- EFFECT_NAME_SHADOW
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 1, 1, 200, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0x00, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},
			visible	= false,			
		},

		-- EFFECT_NAME
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 200, 20 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},
			visible	= false,			
		},

		-- LOCATOR_ALIGNMENT
		{
			layerType	= UI.LAYER_TEXT,	
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},	
			visible	= false,
		}, 

		-- LOCATOR_NAMES
		{
			layerType	= UI.LAYER_TEXT,	
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},	
			visible	= false,
		},

		-- LOCATOR_TEXTS
		{
			layerType	= UI.LAYER_TEXT,	
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},	
		},

		-- LOCATOR_ETEXTS
		{
			layerType	= UI.LAYER_ETEXT,	
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},	
		},
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

-- effectName может быть как путем к файлу, так и именем ресурса;
function UI.ETP_ItemWnd:SetEffect( effectName, bTree )

	self:Reset()

	local resourceName, path = self:Name2ResourceNameAndPath( effectName )
	local effect = nil

	-- попытка найти уже загруженны ресурс
	local resourceHandle = UI:GetResourceHandleByName( resourceName, UI.RES_EFFECT, true )

	if resourceHandle == UI.INVALID_RESOURCE_HANDLE then
		if path then
			resourceHandle = UI:LoadEffect( resourceName, path )
		end
	end

	if resourceHandle ~= UI.INVALID_RESOURCE_HANDLE then
		effect = self:GetEffectsPool( self.layers.EFFECT ):AddEffect( resourceName, self:GetUiHandle() ) 
		UI:ReleaseResourceHandle( resourceHandle )
	end

	if effect and effect:HasAnimation( "idle" ) then
		effect:StartAnimation( "idle" )		
	end

	self:UpdateSelectedStatus()
	self:UpdateEffectName()
	self:UpdateEffectRect()
	self:UpdateLocators()
	self:UpdateSprites()
	self:UpdateAnimations()
	self:UpdateDisplay()

	if not effect then
		sys.log( "UI.ETP_ItemWnd:SetEffect()[ERROR]: cannot show effect \"%s\"", effectName )
		return false
	end


	-- рекурсия по всем дочерним эффектам

	if not bTree then
		return true
	end

	for objId = 0, effect:GetNumObjects() - 1 do

		local childEffectName = effect:GetObjRelatedEffectNameById( objId )
		if childEffectName and childEffectName ~= "" then
			self:AddChildItem( childEffectName, effect:GetObjNameById( objId ) ) 
		end

	end	

	return true

end


--
function UI.ETP_ItemWnd:Reset()

	self:ReleaseAllETexRegions()

	-- удлаление собственного эффекта
	
	local pool = self:GetEffectsPool( self.layers.EFFECT )
	if pool:GetNumEffects() > 0 then
		pool:PopEffect()
	end

	self.isSelected = false
	self.parentLocator = ""
	self.locators = {}
	self.sprites = {}
	self.animations = {}

	self:SetText( "", self.layers.EFFECT_NAME )
	self:SetText( "", self.layers.EFFECT_NAME_SHADOW )

	self:SetRect( UI:ZeroQuat() )

	self:PauseAnimation( false )


	-- удлаление всех дочерних окон-эффектов

	local childWnd = self:GetFirstChild()
	while childWnd do
		childWnd:Reset()
		childWnd = childWnd:GetNextSibling()
	end

	self:RemoveAllChildren( true )
	UI:Purge()

end


--
function UI.ETP_ItemWnd:GetEffect()

	local pool = self:GetEffectsPool( self.layers.EFFECT )
	return pool:GetNumEffects() > 0 and pool:GetEffectById( 0 ) or nil

end


--
function UI.ETP_ItemWnd:SetEffectVisible( isVisible )

	if etp:GetOptionVal( etp.options.LINK_VISIBILITY ) == true then
		sys.log( "UI.ETP_ItemWnd:SetEffectCustomVisible()[ERROR]: option LINK_VISIBILITY is on" )
		return
	end

	self.bCustomVisibility = true

	local effect = self:GetEffect()
	if effect then
		effect:SetVisible( isVisible )
	end

end  


--
function UI.ETP_ItemWnd:IsEffectVisible()

	local effect = self:GetEffect()
	return effect and effect:IsVisible()

end


--
function UI.ETP_ItemWnd:IsCustomVisibility()

	return self.bCustomVisibility

end


--
function UI.ETP_ItemWnd:GetLocatorInfo( locatorName )

	for idx, locator in pairs( self.locators ) do
		if locator.name == locatorName then
			return locator
		end
	end

	return nil

end


--
function UI.ETP_ItemWnd:GetSpriteInfo( spriteName )

	for idx, sprite in pairs( self.sprites ) do
		if sprite.name == spriteName then
			return sprite
		end
	end

	return nil

end


--
function UI.ETP_ItemWnd:GetAnimationInfo( animName )

	for idx, animation in pairs( self.animations ) do
		if animation.name == animName then
			return animation
		end
	end

	return nil

end


--
function UI.ETP_ItemWnd:OnLocatorTextChanged( locatorName, text )

	local locator = self:GetLocatorInfo( locatorName )
	if locator then
		locator.text = text
		locator.bUserText = true

		if locator.sprite ~= "" then
			self:UpdateETexRegionForLocator( locator )
		end
	end

end


--
function UI.ETP_ItemWnd:OnLocatorFontChanged( locatorName, fontName )

	local locator = self:GetLocatorInfo( locatorName )
	if locator then
		locator.fontName = fontName
		locator.hFont = ObtainFont( locator.fontName )
		locator.bUserFontName = true
	end

end


--
function UI.ETP_ItemWnd:OnLocatorHAlignmentChanged( locatorName, hAlm )

	local locator = self:GetLocatorInfo( locatorName )
	if locator then
		local hAlmOld, vAlmOld = self:Alignment2HV( locator.alignment )
		locator.alignment = vAlmOld + hAlm
		locator.bUserAlignment = true
	end

end


--
function UI.ETP_ItemWnd:OnLocatorVAlignmentChanged( locatorName, vAlm )

	local locator = self:GetLocatorInfo( locatorName )
	if locator then
		local hAlmOld, vAlmOld = self:Alignment2HV( locator.alignment )
		locator.alignment = vAlm + hAlmOld
	end

end


--
function UI.ETP_ItemWnd:OnLocatorColorChanged( locatorName, color )

	local locator = self:GetLocatorInfo( locatorName )
	if locator then

		if color then
			locator.textColor = color
			locator.bUserTextColor = true
		else
			locator.textColor = self:GetEffect():GetObjColorById( locator.idx )
			locator.bUserTextColor = false
		end
	end

end


--
function UI.ETP_ItemWnd:OnLocatorBackColorChanged( locatorName, color )

	local locator = self:GetLocatorInfo( locatorName )
	if locator then

		if color then
			locator.textBackColor = color
			locator.bUserTextBackColor = true
		else
			locator.textBackColor = self:GetEffect():GetObjBackColorById( locator.idx )
			locator.bUserTextBackColor = false
		end
	end

end


--
function UI.ETP_ItemWnd:OnLocatorBlendChanged( locatorName, blendMode )

	local locator = self:GetLocatorInfo( locatorName )
	if locator then
		locator.blendMode = blendMode
		locator.bUserBlendMode = true
	end

end


--
function UI.ETP_ItemWnd:OnSpriteTextureChanged( spriteName, texName )

	local effect = self:GetEffect()
	if not effect then
		return
	end

	local spriteInfo = self:GetSpriteInfo( spriteName )
	if not spriteInfo then
		return
	end

	local hTex = UI:GetResourceHandleByName( texName, UI.RES_TEXTURE )
	effect:SetSpriteTexture( spriteName, hTex )

	spriteInfo.texName = texName
	spriteInfo.bUserTexName = true

	for locatorIdx, locator in pairs( self.locators ) do
		if locator.sprite == spriteName then
			self:ReleaseETexRegionForLocator( locator )
			locator.sprite = ""
		end
	end

end


--
function UI.ETP_ItemWnd:OnPlayingAnimationChanged()

	local effect = self:GetEffect()
	local anim = UI.EffectTreePreviewWnd:GetPlayingAnimation()

	if not effect then
		return
	end

	self:PauseAnimation( false )

	if anim then
		local animInfo = self:GetAnimationInfo( anim )
		effect:StartAnimationSpeed( anim, animInfo and animInfo.speed or 1 )
	else
		effect:StopAnimation()
	end

end


--
function UI.ETP_ItemWnd:OnSelLocatorChanged()

	local selLocatorName = UI.EffectTreePreviewWnd:GetSelLocator()
	
	for idx, locator in pairs( self.locators ) do
		locator.bSelected = locator.name == selLocatorName
	end

end


--
function UI.ETP_ItemWnd:OnSelSpriteChanged()

	local selSpriteName = UI.EffectTreePreviewWnd:GetSelSprite()
	
	for idx, sprite in pairs( self.sprites ) do
		sprite.bSelected = sprite.name == selSpriteName
	end

end  


--
function UI.ETP_ItemWnd:PauseAnimation( bPause )

	self:GetLayer( UI.LAYER_EFFECT, self.layers.EFFECT, 0 ):SetUpdatable( not bPause )

end


--
function UI.ETP_ItemWnd:IsAnimationPaused()

	return not self:GetLayer( UI.LAYER_EFFECT, self.layers.EFFECT, 0 ):IsUpdatable()

end


--
function UI.ETP_ItemWnd:OnAnimationSpeedChanged( animName, speed )

	local animInfo = self:GetAnimationInfo( animName )
	if not animInfo then
		return
	end

	animInfo.speed = speed

end


--
function UI.ETP_ItemWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateVisibilityChanged()

end


--
function UI.ETP_ItemWnd:UpdateVisibilityChanged()

	local bVisible = self:IsEffectVisible()

	if bVisible ~= self.bPrevVisible then
		self.bPrevVisible = bVisible
		self:UpdateAllETexRegions()
	end
	
end


--
function UI.ETP_ItemWnd:SetPos( x, y )

	local parent = self:GetParent()
	if parent ~= UI.EffectTreePreviewWnd then
		sys.log( "UI.ETP_ItemWnd:SetPos()[ERROR]: not root item" )
		return
	end

	x = UI:XToRel( math.floor( UI:XToAbs( x ) ) );
	y = UI:YToRel( math.floor( UI:YToAbs( y ) ) );

	self:SetLeft( x )
	self:SetTop( y )

	local effect = self:GetEffect()
	if effect then			
		local screenPos = UI:Vec2( parent:XToScreen( self:GetLeft() ), parent:YToScreen( self:GetTop() ) )
		effect:SetScreenPos( screenPos )
	end

end


-- -------------------------------
-- const
-- -------------------------------

etpi.layers =
{
	EFFECT				= 0,
	EFFECT_RECT			= 1,
	LOCATOR_RECTS		= 2,
	EFFECT_NAME_SHADOW	= 3,
	EFFECT_NAME			= 4,
	LOCATOR_ALIGNMENT	= 5,
	LOCATOR_NAMES		= 6,
	LOCATOR_TEXTS		= 7,
	LOCATOR_ETEXTS		= 8,
}

etpi.drawInfo =
{
	effectNameColor_sel		= UI:ARGB( 0xff, 0xff, 0xff, 0x00 ),
	effectNameColor_unsel	= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),
	effectRectColor_sel		= UI:ARGB( 0x44, 0xff, 0xff, 0x00 ),
	effectRectColor_unsel	= UI:ARGB( 0x44, 0xff, 0xff, 0xff ),
}

-- -------------------------------
-- vars
-- -------------------------------

etpi.isSelected			= false
etpi.parentLocator		= ""
etpi.locators			= {}
etpi.sprites			= {}
etpi.animations			= {}
etpi.bCustomVisibility	= false
etpi.bPrevVisible		= true

-- -------------------------------
-- work funcitons
-- -------------------------------

--
function UI.ETP_ItemWnd:F_OnAfterRemoveFromParent( parent )

	if self.parentLocator ~= "" then
		local parentEffect = parent:GetEffect()
		if parentEffect then
			parentEffect:UnlinkWnd( self:GetUiHandle(), self.parentLocator )
		end
	end

	self:OnAfterRemoveFromParent( parent )

end


-- effectName может быть как путем к файлу, так и именем ресурса;

function UI.ETP_ItemWnd:Name2ResourceNameAndPath( effectName )

	local isPath = string.find( effectName, "[%\\%/]+" ) ~= nil

	-- effectName - имя ресурса

	if not isPath then
		return effectName, nil
	end


	-- effectName - путь к файлу

	local path = effectName
	local dir, fileName = UI:DecompositePath( path )	

	-- попытка сделать индивидуальное (но не длинное) имя ресурса для данного пути
	local asBytes = { string.byte( path, 1, string.len( path ) ) }
	local sum = 0
	for idx, byte in pairs( asBytes ) do
		sum = sum + byte
	end

	local resourceName = string.format( "ETP%d_%s", sum, fileName )

	return resourceName, path

end


--
function UI.ETP_ItemWnd:AddChildItem( childEffectName, locatorName )

	local effect = self:GetEffect()
	local childWnd = UI.EffectTreePreviewWnd:CreateItemWnd()

	if childWnd:SetEffect( childEffectName, true ) then

		local defaultLinkParams = UI.EffectTreePreviewWnd:GetDefaultLinkParams()
		UI:AddChildAndLink( self, childWnd, effect, locatorName, defaultLinkParams )

		childWnd.parentLocator = locatorName

		return childWnd

	else

		UI:RemoveUiObj( childWnd:GetUiHandle() )
		UI:Purge()

		return nil

	end				

end


--
function UI.ETP_ItemWnd:UpdateEffectName()

	local effect = self:GetEffect()
	local name = ""

	if effect then
		name = L_EffectName2Displayable( effect:GetName() )
	end

	self:SetText( name, self.layers.EFFECT_NAME )
	self:SetText( name, self.layers.EFFECT_NAME_SHADOW )

	self:UpdateEffectNameColor()

end


--
function UI.ETP_ItemWnd:UpdateSelStatusRecursive()

	self:UpdateSelectedStatus()

	local childWnd = self:GetFirstChild()
	while childWnd do
		childWnd:UpdateSelStatusRecursive()
		childWnd = childWnd:GetNextSibling()
	end	

end


--
function UI.ETP_ItemWnd:UpdateSelectedStatus()

	self:Select( UI.ETP_Menu_EffectsList:GetSelItemWndHandle() == self:GetUiHandle() )

end


--
function UI.ETP_ItemWnd:Select( bSelect )

	self.isSelected = bSelect

	self:UpdateEffectNameColor()
	self:UpdateEffectRectColor()	
	self:UpdateDisplay()

end


--
function UI.ETP_ItemWnd:UpdateEffectNameColor()

	self:SetColor( self.isSelected and self.drawInfo.effectNameColor_sel or self.drawInfo.effectNameColor_unsel, self.layers.EFFECT_NAME )

end


--
function UI.ETP_ItemWnd:UpdateEffectRect()

	local effect = self:GetEffect()

	local rect = effect and self:ToScreen( effect:CalcApproximateRect() ) or UI:ZeroQuat()
	self:SetRect( rect )

	self:UpdateEffectRectColor()

end


--
function UI.ETP_ItemWnd:UpdateEffectRectColor()

	self:SetColor( self.isSelected and self.drawInfo.effectRectColor_sel or self.drawInfo.effectRectColor_unsel, self.layers.EFFECT_RECT )

end


--
function UI.ETP_ItemWnd:UpdateDisplay()

	self:SetLayerVisible( etp:GetOptionVal( etp.options.SHOW_EFFECT_NAMES ), self.layers.EFFECT_NAME )
	self:SetLayerVisible( self:IsLayerVisible( self.layers.EFFECT_NAME ), self.layers.EFFECT_NAME_SHADOW )

	self:SetLayerVisible( etp:GetOptionVal( etp.options.SHOW_EFFECT_ALL_RECTS ) or ( self.isSelected and etp:GetOptionVal( etp.options.SHOW_EFFECT_SEL_RECT ) ), self.layers.EFFECT_RECT )		

	self:SetLayerVisible( self.isSelected and ( etp:GetOptionVal( etp.options.SHOW_LOCATOR_ALL_RECTS ) or etp:GetOptionVal( etp.options.SHOW_LOCATOR_SEL_RECT ) ), self.layers.LOCATOR_RECTS )
	self:SetLayerVisible( self.isSelected and etp:GetOptionVal( etp.options.SHOW_LOCATOR_NAMES ), self.layers.LOCATOR_NAMES )

	self:SetLayerVisible( self.isSelected and etp:GetOptionVal( etp.options.SHOW_LOCATOR_ALIGNMENT ), self.layers.LOCATOR_ALIGNMENT )	

end


--
function UI.ETP_ItemWnd:UpdateLinksRecursive()

	self:UpdateLinks()

	local childWnd = self:GetFirstChild()
	while childWnd do
		childWnd:UpdateLinksRecursive()
		childWnd = childWnd:GetNextSibling()
	end

end


--
function UI.ETP_ItemWnd:UpdateLinks()

	if self == etp:GetRootItem() then
		return
	end

	local parent = self:GetParent()
	local parentEffect = parent:GetEffect()

	local uiHandle = self:GetUiHandle()
	local defaultLinkParams = etp:GetDefaultLinkParams()

	parentEffect:UnlinkWnd( uiHandle, "" )
	parentEffect:LinkWnd( uiHandle, self.parentLocator, defaultLinkParams )

end


--
function UI.ETP_ItemWnd:UpdateDisplayRecursive()

	self:UpdateDisplay()

	local childWnd = self:GetFirstChild()
	while childWnd do
		childWnd:UpdateDisplayRecursive()
		childWnd = childWnd:GetNextSibling()
	end

end


--
function UI.ETP_ItemWnd:UpdateLocators()

	local effect = self:GetEffect()
	if not effect then	
		return
	end

	for idx = 0, effect:GetNumObjects() - 1 do

		local locator = {}

		locator.idx					= idx
		locator.name				= effect:GetObjNameById( idx )
		locator.relatedEffectName	= effect:GetObjRelatedEffectNameById( idx ) or ""
		locator.alignment			= effect:GetObjAlignmentById( idx ) 
		locator.text				= effect:GetObjSampleTextById( idx )
		locator.fontName			= effect:GetObjFontNameById( idx )
		locator.hFont				= _G.ObtainFont( locator.fontName )
		locator.textColor			= effect:GetObjColorById( idx )
		locator.textBackColor		= effect:GetObjBackColorById( idx )
		locator.bSelected			= false
		locator.sprite				= ""
		locator.etexRegionId		= -1
		locator.blendMode			= effect:GetObjBlendModeById( idx )

		locator.bUserRelatedEffectName	= false
		locator.bUserAlignment			= false
		locator.bUserText				= false
		locator.bUserFontName			= false
		locator.bUserTextColor			= false
		locator.bUserTextBackColor		= false
		locator.bUserBlendMode			= false

		if string.find( locator.name, "^etext_" ) then

			local spriteName = string.format( "%s_sprite", locator.name )
			if effect:HasSprite( spriteName ) then

				locator.sprite = spriteName
				self:UpdateETexRegionForLocator( locator )

			end
		end

		table.insert( self.locators, locator )

	end

end


--
function UI.ETP_ItemWnd:UpdateSprites()

	local effect = self:GetEffect()
	if not effect then	
		return
	end

	for idx = 0, effect:GetNumSprites() - 1 do

		local sprite = {}

		sprite.idx			= idx
		sprite.name			= effect:GetSpriteNameById( idx )
		sprite.texName		= ""
		sprite.bSelected	= false
		sprite.bUserTexName	= false

		local hTex = effect:GetSpriteTexture( sprite.name )
		if hTex ~= UI.INVALID_RESOURCE_HANDLE then
			local rc = UI:GetResourceByHandle( hTex )
			if rc then
				sprite.texName = rc:GetName()
			end
		end

		table.insert( self.sprites, sprite )

	end

end    


--
function UI.ETP_ItemWnd:UpdateAnimations()

	local effect = self:GetEffect()
	if not effect then	
		return
	end

	for idx = 0, effect:GetNumAnimations() - 1 do

		local animation = {}

		animation.idx			= idx
		animation.name			= effect:GetAnimationName( idx )
		animation.speed			= 1

		table.insert( self.animations, animation )

	end

end    


--
function UI.ETP_ItemWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipW, clipH )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( 0, 0, 1024, 768 ) )
	
end


--
function UI.ETP_ItemWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipW, clipH, layerIdx )

	if layerIdx == self.layers.LOCATOR_RECTS then
		self:DrawLocatorRects()

	elseif layerIdx == self.layers.LOCATOR_NAMES then
		self:DrawLocatorNames()

	elseif layerIdx == self.layers.LOCATOR_ALIGNMENT then
		self:DrawLocatorAlignment()

	elseif layerIdx == self.layers.LOCATOR_TEXTS then
		self:DrawLocatorTexts()

	elseif layerIdx == self.layers.LOCATOR_ETEXTS then
		self:DrawLocatorETexts()

	end

end


--
function UI.ETP_ItemWnd:DrawLocatorRects()

	local effect = self:GetEffect()
	if not effect then
		return
	end

	local effectPos = effect:GetScreenPos()
	local bAllRects = etp:GetOptionVal( etp.options.SHOW_LOCATOR_ALL_RECTS )

	for objId = 0, effect:GetNumObjects() - 1 do
		local locator = self.locators[ objId + 1 ]
	
		if bAllRects or locator.bSelected then

    		local objPos 	= effect:GetObjPosById( objId )
    		local objSize	= effect:GetObjSizeById( objId )		

    		objPos.x = objPos.x + effectPos.x
    		objPos.y = objPos.y + effectPos.y

      		UI.drawer:DrawImagedRect(
       			objPos.x, objPos.y, objSize.x, objSize.y,
       			objPos.x, objPos.y, objSize.x, objSize.y,
       			self:GetTexture( self.layers.LOCATOR_RECTS ),
       			locator.bSelected and UI:ARGB( 0x44, 0xff, 0x99, 0x00 ) or UI:ARGB( 0x44, 0xff, 0x00, 0x00 ),
       			0, 0, 1, 1,	
				false
    		) 		
		end

	end

end


--
function UI.ETP_ItemWnd:DrawLocatorNames()

	local effect = self:GetEffect()
	if not effect then
		return
	end

	UI.drawer:EndUiDrawing()

    	local effectPos = effect:GetScreenPos()

    	for objId = 0, effect:GetNumObjects() - 1 do

			local locator = self.locators[ objId + 1 ]

    		local objPos 	= effect:GetObjPosById( objId )
    		local objName	= effect:GetObjNameById( objId )

			local rect			= UI:Quat( objPos.x + effectPos.x, objPos.y + effectPos.y, 200, 20 )
			local rectShadow	= UI:Quat( rect.x + 1, rect.y + 1, rect.z, rect.w )

    		_G.DrawText(
     			objName,
     			self:GetFont( self.layers.LOCATOR_NAMES ),
     			rectShadow,
     			UI:ARGB( 0xff, 0x00, 0x00, 0x00 ),
				0,
     			self:GetTextFormatFlags( self.layers.LOCATOR_NAMES ),
     			rectShadow
			)

    		_G.DrawText(
     			objName,
     			self:GetFont( self.layers.LOCATOR_NAMES ),
     			rect,
     			locator.bSelected and UI:ARGB( 0xff, 0xff, 0x99, 0x00 ) or UI:ARGB( 0xff, 0xff, 0x00, 0xff ),
				0,
     			self:GetTextFormatFlags( self.layers.LOCATOR_NAMES ),
     			rect
			)

		end

	UI.drawer:BeginUiDrawing()

end


--
function UI.ETP_ItemWnd:DrawLocatorAlignment()

	local effect = self:GetEffect()
	if not effect then
		return
	end

	UI.drawer:EndUiDrawing()

    	local effectPos = effect:GetScreenPos()

    	for objId = 0, effect:GetNumObjects() - 1 do
			local locator = self.locators[ objId + 1 ]

			if locator.relatedEffectName == "" then

    			local objPos 	= effect:GetObjPosById( objId )
    			local objSize 	= effect:GetObjSizeById( objId )

    			local objRect		= UI:Quat( objPos.x + effectPos.x, objPos.y + effectPos.y, objSize.x, objSize.y )
    			local shadowRect	= UI:Quat( objRect.x + 1, objRect.y + 1, objRect.z, objRect.w )

    			local objAlignment = locator.alignment

    			local textFormatFlags, strAlignment = self:Obj2FontAlignment( objAlignment )
    			textFormatFlags = textFormatFlags + FONT.TF_NOCLIP

        		_G.DrawText(
         			strAlignment,
         			self:GetFont( self.layers.LOCATOR_ALIGNMENT ),
         			shadowRect,
         			UI:ARGB( 0xff, 0x00, 0x00, 0x00 ),
					0,
         			textFormatFlags,
         			shadowRect
    			)		

        		_G.DrawText(
         			strAlignment,
         			self:GetFont( self.layers.LOCATOR_ALIGNMENT ),
         			objRect,
    				self:GetColor( self.layers.LOCATOR_ALIGNMENT ),
					0,
         			textFormatFlags,
         			objRect
    			)	
			end

		end

	UI.drawer:BeginUiDrawing()

end


--
function UI.ETP_ItemWnd:DrawLocatorTexts()

	local effect = self:GetEffect()
	if not effect then
		return
	end

	UI.drawer:EndUiDrawing()

    	local effectPos = effect:GetScreenPos()

    	for objId = 0, effect:GetNumObjects() - 1 do

			local locator = self.locators[ objId + 1 ]
			if effect:IsVisible() and effect:IsObjVisibleById( locator.idx ) and locator.text ~= "" and locator.etexRegionId == -1 then

				if locator.blendMode ~= UI.BM_ALPHA then
					SetTextBlendMode( locator.blendMode )
				end

        		local objPos 		= effect:GetObjPosById( objId )
				local objSize		= effect:GetObjSizeById( objId )
    			local rect			= UI:Quat( objPos.x + effectPos.x, objPos.y + effectPos.y, objSize.x, objSize.y )
				local alpha			= math.floor( effect:GetObjAlphaById( objId ) * effect:GetAlpha() / 255 )

				local color			= locator.bUserTextColor and locator.textColor or effect:GetObjColorById( locator.idx )
				color				= UI:ColorMul( color, effect:GetColor() )
				color 				= UI:SetAlpha( color, alpha )				

				local backColor		= locator.bUserTextBackColor and locator.textBackColor or effect:GetObjBackColorById( locator.idx )
				backColor			= UI:SetAlpha( backColor, alpha )				

        		_G.DrawText(
         			locator.text,
         			locator.hFont,
         			rect,
         			color,
					backColor,
         			l_effect2FontAlignment[ locator.alignment ].alignment + FONT.TF_WORDBREAK,
         			rect
    			)

            	if locator.blendMode ~= UI.BM_ALPHA then
            		SetTextBlendMode( UI.BM_ALPHA )
            	end

			end
		end

	UI.drawer:BeginUiDrawing()

end   


--
function UI.ETP_ItemWnd:DrawLocatorETexts()

	local effect = self:GetEffect()
	if not effect then
		return
	end

	UI.drawer:EndUiDrawing()

    	local effectPos = effect:GetScreenPos()

    	for objId = 0, effect:GetNumObjects() - 1 do

			local locator = self.locators[ objId + 1 ]
			if locator.text ~= "" and locator.etexRegionId ~= -1 then

				if locator.blendMode ~= UI.BM_ALPHA then
					SetTextBlendMode( locator.blendMode )
				end

    			local rect			= UI.drawer:GetETexRegionTexRect( locator.etexRegionId )
				local alpha			= math.floor( effect:GetObjAlphaById( objId ) * effect:GetAlpha() / 255 )

				local color			= locator.bUserTextColor and locator.textColor or effect:GetObjColorById( locator.idx )
				color 				= UI:SetAlpha( color, alpha )				

				local backColor		= locator.bUserTextBackColor and locator.textBackColor or effect:GetObjBackColorById( locator.idx )
				backColor			= UI:SetAlpha( backColor, alpha )				

        		_G.DrawText(
         			locator.text,
         			locator.hFont,
         			rect,
         			color,
					backColor,
         			l_effect2FontAlignment[ locator.alignment ].alignment + FONT.TF_WORDBREAK,
         			rect
    			)

            	if locator.blendMode ~= UI.BM_ALPHA then
            		SetTextBlendMode( UI.BM_ALPHA )
            	end

			end
		end

	UI.drawer:BeginUiDrawing()

end


--
function UI.ETP_ItemWnd:Obj2FontAlignment( objAlignment )

	local fontAlignmentInfo = l_effect2FontAlignment[ objAlignment ]
	return fontAlignmentInfo.alignment, fontAlignmentInfo.text

end


--
function UI.ETP_ItemWnd:Alignment2HV( alignment )

	local hAlm	= UI.EffectObjAlignment.ALIGNMENT_LEFT
	local vAlm	= UI.EffectObjAlignment.ALIGNMENT_TOP

	for idx, alm in pairs( l_horzAlignments ) do
		if bit.band( alignment, alm ) == alm then
			hAlm = alm
			break
		end
	end

	for idx, alm in pairs( l_vertAlignments ) do
		if bit.band( alignment, alm ) == alm then
			vAlm = alm
			break
		end
	end

	return hAlm, vAlm

end


--
function UI.ETP_ItemWnd:ReleaseETexRegionForLocator( locator )

	if locator.etexRegionId == -1 then
		return
	end

	UI.drawer:ReleaseETexRegion( locator.etexRegionId )
	locator.etexRegionId = -1

	self:UpdateSpriteForLocator( locator )

end


--
function UI.ETP_ItemWnd:ReleaseAllETexRegions()

	for idx, locator in pairs( self.locators ) do
		self:ReleaseETexRegionForLocator( locator )
	end

end


--
function UI.ETP_ItemWnd:UpdateETexRegionForLocator( locator )

	local effect = self:GetEffect()
	if not effect then
		return
	end

	local locatorSize = effect:GetObjSize( locator.name )
		
	local bNeedTexRegion =
		self:IsEffectVisible() and
		self:IsOnScreen() and
		locator.text ~= "" and
		locator.sprite ~= "" and
		locatorSize.x > 1e-3 and locatorSize.y > 1e-3

	if not bNeedTexRegion then	

		if locator.etexRegionId ~= -1 then
			self:ReleaseETexRegionForLocator( locator )
		end
		return

	end

	if m_etexRegionId ~= -1 then	

		local maxSize = UI.drawer:GetETexRegionMaxSize( locator.etexRegionId )
		if maxSize.x >= locatorSize.x and maxSize.y >= locatorSize.y then
		
			UI.drawer:SetETexRegionSize( locator.etexRegionId, locatorSize.x, locatorSize.y )
			self:UpdateSpriteForLocator( locator )
			return

		end

	end	

	self:ReleaseETexRegionForLocator( locator )
	locator.etexRegionId = UI.drawer:AllocateETexRegion( locatorSize.x, locatorSize.y )

	self:UpdateSpriteForLocator( locator )

end


--
function UI.ETP_ItemWnd:UpdateAllETexRegions()

	for idx, locator in pairs( self.locators ) do
		self:UpdateETexRegionForLocator( locator )
	end

end


--
function UI.ETP_ItemWnd:UpdateSpriteForLocator( locator )

	local effect = self:GetEffect()
	if not effect then
		return
	end

	if locator.sprite == "" then
		return
	end

	if locator.etexRegionId == -1 then
		effect:SetSpriteTexture( locator.sprite, UI.INVALID_UI_HANDLE )
	else
		effect:SetSpriteTextureDyn( locator.sprite, UI.drawer:GetETexHandle(), UI.drawer:GetETexRegionTcs( locator.etexRegionId ) );
	end

end  


--
function UI.ETP_ItemWnd:F_OnAfterHideFromScreen()

	self:ReleaseAllETexRegions()

	self:OnAfterHideFromScreen()

end


--
function UI.ETP_ItemWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateAllETexRegions()

end


--
function UI.ETP_ItemWnd:F_OnBeforeResetDevice()

	self:OnBeforeResetDevice()

	self:ReleaseAllETexRegions()	

end


--
function UI.ETP_ItemWnd:F_OnResetDevice()

	self:OnResetDevice()

	self:UpdateAllETexRegions()

end


--
function UI.ETP_ItemWnd:F_OnEventAfterReloadResource( hSender, resourceTypes )

	if bit.band( resourceTypes, UI.RES_DYN_TEXTURE ) == UI.RES_DYN_TEXTURE then
		self:ReleaseAllETexRegions()
		self:UpdateAllETexRegions()
	end	

end


-- --------------------------------------------------------
-- UI.ETP_MenuWnd
-- --------------------------------------------------------

UI.ETP_MenuWnd = {}
local etpm = UI.ETP_MenuWnd

-- -------------------------------
-- window definition
-- -------------------------------

UI.ETP_MenuWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_MenuWnd",
		rect			= Quat( 1280-400, 0, 400, 720 ),
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		activationOrder	= 0,
	},

	layers =
	{
		-- HEADER_BAR
		{
			layerType	= UI.LAYER_TEXTURE,
			rect		= Quat( 0, 0, 400, 20 ),
			texture		= "white",
			color		= UI:ARGB( 0x88, 0x00, 0x55, 0x00 ),
		},

		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,
			rect		= Quat( 10, 0, 300, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		
			text = "Menu"
		},

		-- SHOW_ICO_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			rect		= Quat( 400-20, 0, 20, 20 ),
			texture		= "white",
			color		= UI:ARGB( 0xff, 0x00, 0x88, 0x00 ),
		},

		-- SHOW_ICO
		{
			layerType	= UI.LAYER_TEXT,
			rect		= Quat( 400-20, 0, 20, 20 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		
			text = "-"
		}
	},

	children = { "UI.ETP_Menu_Panel" }
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_MenuWnd:SetupOnNewEffect()

	self:Reset()

	UI.ETP_Menu_EffectsList:SetupOnNewEffect()

end


--
function UI.ETP_MenuWnd:Reset()

	UI.ETP_Menu_EffectsList:Reset()
	UI.ETP_Menu_AnimationsList:Reset()
	UI.ETP_Menu_LocatorsList:Reset()
	UI.ETP_Menu_SpritesList:Reset()
	UI.ETP_Menu_EffectSelInfo:Reset()
	
	self:Unpause()

end


--
function UI.ETP_MenuWnd:ShowFilesList( bForLocator )

	self:HideSecondaryPanel()

	UI.ETP_Menu_FilesList:Init( bForLocator )
	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_FilesList )

	UI.ETP_Menu_LoadEffectBtn:SetBtnText( "Hide effects" )

end


--
function UI.ETP_MenuWnd:HideFilesList()

	UI.ETP_Menu_FilesList:UnlinkFromParent()
	UI.ETP_Menu_LoadEffectBtn:SetBtnText( "Effects..." )

end


--
function UI.ETP_MenuWnd:ShowTexList( bForSprite )

	self:HideSecondaryPanel()

	UI.EffectTreePreviewWnd:ShowTexturePreview()

	UI.ETP_Menu_TexList:Init( bForSprite )
	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_TexList )

	UI.ETP_Menu_PreviewTexBtn:SetBtnText( "Hide textures" )

end


--
function UI.ETP_MenuWnd:HideTexList()

	UI.ETP_Menu_TexList:UnlinkFromParent()
	UI.ETP_Menu_PreviewTexBtn:SetBtnText( "Textures..." )
	UI.EffectTreePreviewWnd:HideTexturePreview()

end


--
function UI.ETP_MenuWnd:HideSecondaryPanel()

	self:HideFilesList()
	self:HideTexList()

end


--
function UI.ETP_MenuWnd:IsSecondaryPanelOnScreen()

	if UI.ETP_Menu_FilesList:IsChildOf( self ) then
		return true
	end

	if UI.ETP_Menu_TexList:IsChildOf( self ) then
		return true
	end

	return false

end


--
function UI.ETP_MenuWnd:TogglePause()

	if cvars.ui_effectTimeScale ~= 0 then
		self:Pause()
	else
		self:Unpause()
	end

end


--
function UI.ETP_MenuWnd:Pause()

	cvars.ui_effectTimeScale = 0
	UI.ETP_Menu_PauseBtn:SetBtnText( "Unpause all" )

end


--
function UI.ETP_MenuWnd:Unpause()

	cvars.ui_effectTimeScale = 1
	UI.ETP_Menu_PauseBtn:SetBtnText( "Pause all" )

end  


-- -------------------------------
-- const
-- -------------------------------

etpm.layers =
{
	HEADER_BAR		= 0,
	CAPTION			= 1,
	SHOW_ICO_BG		= 2,
	SHOW_ICO		= 3,
}

etpm.modes =
{
	FULL		= 1,
	HIDDEN		= 2,
}

-- -------------------------------
-- vars
-- -------------------------------

etpm.bDrag			= false
etpm.mode			= etpm.modes.FULL

-- -------------------------------
-- work functions
-- ------------------------------- 

--
function UI.ETP_MenuWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:ShowAnimations()

end


--
function UI.ETP_MenuWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:HideSecondaryPanel()

end


--
function UI.ETP_MenuWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput == self:GetUiHandle() then
    	if not self.bDrag and UI:IsPtInRect( self:GetLayerRect( self.layers.HEADER_BAR ), mouseX, mouseY ) then
    		UI:CaptureMouse( self:GetUiHandle() )
    	end	

	elseif wndThatReceivedInput == UI.ETP_Menu_LoadEffectBtn:GetUiHandle() then

    	if UI.ETP_Menu_FilesList:IsChildOf( self ) then
    		self:HideFilesList()
    	else
    		self:ShowFilesList( false )
    	end

	elseif wndThatReceivedInput == UI.ETP_Menu_HideBtn:GetUiHandle() then
		etp:Hide()	

	elseif wndThatReceivedInput == UI.ETP_Menu_PauseBtn:GetUiHandle() then
		self:TogglePause()	

	elseif wndThatReceivedInput == UI.ETP_Menu_AnimsBtn:GetUiHandle() then
		self:ShowAnimations()

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorsBtn:GetUiHandle() then
		self:ShowLocators()

	elseif wndThatReceivedInput == UI.ETP_Menu_SpritesBtn:GetUiHandle() then
		self:ShowSprites()

	elseif wndThatReceivedInput == UI.ETP_Menu_PreviewTexBtn:GetUiHandle() then

    	if UI.ETP_Menu_TexList:IsChildOf( self ) then
    		self:HideTexList()
    	else
    		self:ShowTexList( false )
    	end

	end

	return true

end


--
function UI.ETP_MenuWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	UI:CaptureMouse( UI.INVALID_UI_HANDLE )

	if self.bDrag then
		self:StopDrag()
		               	
	elseif UI:IsPtInRect( self:GetLayerRect( self.layers.HEADER_BAR ), mouseX, mouseY ) then
		self:ToggleMode()
	end

	return true

end


--
function UI.ETP_MenuWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if UI:GetMouseCapture() == self:GetUiHandle() then
		self:StartDrag()
	end

	if self.bDrag then
		local rect = self:GetRect()
		rect.x = rect.x + deltaX
		rect.y = rect.y + deltaY
		self:SetRect( rect )
	end

	return true

end


--
function UI.ETP_MenuWnd:StartDrag()

	if self.bDrag then
		return
	end

	UI:CaptureMouse( self:GetUiHandle() )
	self.bDrag = true

end


--
function UI.ETP_MenuWnd:StopDrag()

	UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	self.bDrag = false

end


--
function UI.ETP_MenuWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	self:StopDrag()

end


--
function UI.ETP_MenuWnd:SetMode( mode )

	self.mode = mode

	if self.mode == self.modes.FULL then
		self:AddChild( UI.ETP_Menu_Panel )
	else
		self:RemoveChild( UI.ETP_Menu_Panel )
	end

end


--
function UI.ETP_MenuWnd:ToggleMode()

	self:SetMode( self.mode == self.modes.FULL and self.modes.HIDDEN or self.modes.FULL )

end


--
function UI.ETP_MenuWnd:ShowAnimations()

	self:HideObjectsPanel()

	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_AnimationsList )
	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_AnimSelInfo )

	UI.ETP_Menu_AnimsBtn:Check( true )

end


--
function UI.ETP_MenuWnd:ShowLocators()

	self:HideObjectsPanel()

	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_LocatorsList )
	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_LocatorSelInfo )

	UI.ETP_Menu_LocatorsBtn:Check( true )

end


--
function UI.ETP_MenuWnd:ShowSprites()

	self:HideObjectsPanel()

	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_SpritesList )
	UI.ETP_Menu_Panel:AddChild( UI.ETP_Menu_SpriteSelInfo )

	UI.ETP_Menu_SpritesBtn:Check( true )

end


--
function UI.ETP_MenuWnd:HideObjectsPanel()

	UI.ETP_Menu_AnimationsList:UnlinkFromParent()	
	UI.ETP_Menu_LocatorsList:UnlinkFromParent()
	UI.ETP_Menu_SpritesList:UnlinkFromParent()

	UI.ETP_Menu_LocatorSelInfo:UnlinkFromParent()
	UI.ETP_Menu_SpriteSelInfo:UnlinkFromParent()
	UI.ETP_Menu_AnimSelInfo:UnlinkFromParent()

	UI.ETP_Menu_AnimsBtn:Check( false )
	UI.ETP_Menu_LocatorsBtn:Check( false )
	UI.ETP_Menu_SpritesBtn:Check( false )

end


--
function UI.ETP_MenuWnd:OnSelAnimationChanged()

	UI.ETP_Menu_AnimSelInfo:OnSelAnimationChanged()

end


--
function UI.ETP_MenuWnd:OnPlayingAnimationChanged()

	UI.ETP_Menu_EffectSelInfo:OnPlayingAnimationChanged()
	UI.ETP_Menu_AnimSelInfo:OnPlayingAnimationChanged()

end


--
function UI.ETP_MenuWnd:OnSelLocatorChanged()

	UI.ETP_Menu_LocatorSelInfo:OnSelLocatorChanged()

end


--
function UI.ETP_MenuWnd:OnSelSpriteChanged()

	UI.ETP_Menu_SpriteSelInfo:OnSelSpriteChanged()

end


-- --------------------------------------------------------
-- UI.ETP_Menu_Panel
-- --------------------------------------------------------

UI.ETP_Menu_Panel = {}
local etpm = UI.ETP_Menu_Panel

-- -------------------------------
-- window definition
-- -------------------------------

UI.ETP_Menu_Panel.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_Menu_Panel",
		rect			= Quat( 0, 20, 400, 720-20 ),
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		activationOrder	= 0,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0xcc, 0x33, 0x33, 0x33 ),
		},
	},

	children =
	{
		"UI.ETP_Menu_EffectsList",
		"UI.ETP_Menu_AnimationsList",
		"UI.ETP_Menu_LocatorsList",
		"UI.ETP_Menu_SpritesList",
		"UI.ETP_Menu_OptionsList",
		"UI.ETP_Menu_EffectSelInfo",
		"UI.ETP_Menu_LoadEffectBtn",
		"UI.ETP_Menu_HideBtn",
		"UI.ETP_Menu_PauseBtn",
		"UI.ETP_Menu_PreviewTexBtn",
		"UI.ETP_Menu_FilesList",
		"UI.ETP_Menu_TexList",
		"UI.ETP_Menu_AnimsBtn",
		"UI.ETP_Menu_LocatorsBtn",
		"UI.ETP_Menu_SpritesBtn",
		"UI.ETP_Menu_LocatorSelInfo",
		"UI.ETP_Menu_SpriteSelInfo",
		"UI.ETP_Menu_AnimSelInfo",
	}
}


-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_Panel:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ETP_Menu_Panel:UpdateZOrder()

	if UI.ETP_Menu_FilesList and UI.ETP_Menu_FilesList.w and UI.ETP_Menu_FilesList:IsOnScreen() then
		self:MoveChildToLastPosition( UI.ETP_Menu_FilesList )

	elseif UI.ETP_Menu_TexList and UI.ETP_Menu_TexList.w and UI.ETP_Menu_TexList:IsOnScreen() then
		self:MoveChildToLastPosition( UI.ETP_Menu_TexList )

	end

end

-- --------------------------------------------------------
-- UI.ETP_ScrollBar
-- --------------------------------------------------------

UI.ETP_ScrollBar =
{
	def =
	{
    	className	= "ScrollWnd",

    	props =
    	{
    		name			= "scrollBar",
			style			= 0,
			rect			= Quat( 0, 0, 15, 100 ),
    		scrollStyle 	= --[[UI.SWS_STEPWISE_THUMB_MOVEMENT + ]] UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
			minThumbSize	= 20,
			spaceBtnBar		= 0,
			spaceEdgeBtn	= 0,
    	},

    	layers =
    	{
    		-- BG
    		{
    			layerType	= UI.LAYER_TEXTURE,
    			layerStyle	= UI.WLS_RESIZABLE,
				texture		= "white",
				color		= 0xff222222,
    		},
    	},

    	children =
    	{
    		"UI.ETP_Scroll_BtnUp",
    		"UI.ETP_Scroll_BtnDown",
    		"UI.ETP_Scroll_PageUp",
    		"UI.ETP_Scroll_PageDown",
    		"UI.ETP_Scroll_Thumb",
    	}
	},
}


--
UI.ETP_Scroll_Btn =
{
    def =
    {
    	className = "ButtonWnd",

    	props =
    	{
    		name			= "ETP_Scroll_Btn",
    		style			= UI.WS_ENABLE_APPEARANCES,
    		rect			= Quat( 0, 0, 15, 15 ),
    		isPrototype		= true,
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xff666666,
        		},
    			
    			-- TEXT
    			{
    				layerType	= UI.LAYER_TEXT,
    				layerStyle	= UI.WLS_RESIZABLE,
    				color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

           			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
           			formatInfoSz = { 1, 1 },
           			font =
        			{
        				fontName			= "system",
           			},
    			},
    		},

    		BA_OVERROLED =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xffaaaaaa,
        		},

    			-- TEXT
    			{
    				layerType	= UI.LAYER_TEXT,
    				layerStyle	= UI.WLS_RESIZABLE,
    				color		= UI:ARGB( 0xff, 0xff, 0xff, 0x00 ),

           			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
           			formatInfoSz = { 1, 1 },
           			font =
        			{
        				fontName			= "system",
           			},
    			},
    		},

    		BA_PRESSED =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xff666666,
        		},

    			-- TEXT
    			{
    				layerType	= UI.LAYER_TEXT,
    				layerStyle	= UI.WLS_RESIZABLE,
    				color		= UI:ARGB( 0xff, 0x88, 0x88, 0x00 ),

           			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
           			formatInfoSz = { 1, 1 },
           			font =
        			{
        				fontName			= "system",
           			},
    			}, 
    		}, 

    		BA_GRAYED =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xff444444,
        		},

    			-- TEXT
    			{
    				layerType	= UI.LAYER_TEXT,
    				layerStyle	= UI.WLS_RESIZABLE,
    				color		= UI:ARGB( 0xff, 0x66, 0x66, 0x66 ),

           			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
           			formatInfoSz = { 1, 1 },
           			font =
        			{
        				fontName			= "system",
           			},
    			}, 
    		}, 
    	}
	}
}

--
UI.ETP_Scroll_BtnUp =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Scroll_Btn",

    	props =
    	{
    		name			= "btnPrev",
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id		= 1,
    				text	= "/\\"
    			},
    		},
    	}
    }
}


--
UI.ETP_Scroll_BtnDown =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Scroll_Btn",

    	props =
    	{
    		name			= "btnNext",
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id		= 1,
    				text	= "\\/"
    			},
    		},
    	}
    }
}


--
UI.ETP_Scroll_Page =
{
	def =
	{
		className 	= "ButtonWnd",

		props =
		{
			name		= "ETP_Scroll_Page",
			style		= 0,
			rect		= Quat( 0, 0, 20, 0 ),
			isPrototype	= true,
		},
	},
}

--
UI.ETP_Scroll_PageUp =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "ETP_Scroll_Page",

		props =
		{
			name		= "pagePrev",
    		style		= UI.WS_ENABLE_APPEARANCES,
		},
	},
}

--
UI.ETP_Scroll_PageDown =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "ETP_Scroll_Page",

		props =
		{
			name		= "pageNext",
		},
	},
}


--
UI.ETP_Scroll_Thumb =
{
	def =
    {
    	className = "ButtonWnd",

    	props =
    	{
    		name			= "thumb",
    		style			= UI.WS_ENABLE_APPEARANCES,
    		rect			= Quat( 0, 0, 15, 15 ),
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xff666666,
        		},			
    		},

    		BA_OVERROLED =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xffaaaaaa,
        		},
    		},

    		BA_PRESSED =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xff888888,
        		},
    		}, 

    		BA_GRAYED =
    		{
        		-- BG
        		{
        			layerType	= UI.LAYER_TEXTURE,
        			layerStyle	= UI.WLS_RESIZABLE,
    				texture		= "white",
    				color		= 0xff444444,
        		},
    		}, 
    	}
    } 
}

-- --------------------------------------------------------
-- UI.ETP_Menu_List
-- --------------------------------------------------------

UI.ETP_Menu_List = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ETP_Menu_List.layers =
{
	BG			= 0,
	CAPTION		= 1,
	RECORDS		= 2,
	FOCUS_FRAME = 3,
}

--
UI.ETP_Menu_List.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_Menu_List",
		style			= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype		= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ETP_Menu_List.layers.FOCUS_FRAME,

		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0x33, 0x00, 0x00, 0x00 ),
		},

		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,	
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Files",			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		
		},

		-- FOCUS_FRAME
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
			texture		= "white",
			color		= UI:ARGB( 0x88, 0x00, 0xff, 0x00 ),
		},
	},

	children = { "UI.ETP_ScrollBar" }
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_List:Reset()

	self:SetSelRecord( nil, false )
	self:SetOverrolledRecord( nil )
	self.records = {}
	self.numRecords = 0
	self.firstVisibleRecordIdx = -1

	self:UpdateScrollBar()

end


-- -------------------------------
-- const
-- -------------------------------

UI.ETP_Menu_List.drawInfo =
{
	recordHeight			= UI:YTo1024x768( 15, { x = 1280, y = 720 } ),
	recordColor_sel			= UI:ARGB( 0xff, 0xff, 0xff, 0x00 ),
	recordColor_unsel		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),
	recordColor_overrolled  = UI:ARGB( 0xff, 0xaa, 0xaa, 0xaa ),		
} 

-- -------------------------------
-- vars
-- -------------------------------

UI.ETP_Menu_List.records				= {}
UI.ETP_Menu_List.numRecords				= 0
UI.ETP_Menu_List.selRecord				= nil
UI.ETP_Menu_List.overrolledRecord		= nil
UI.ETP_Menu_List.firstVisibleRecordIdx	= -1
UI.ETP_Menu_List.maxVisibleRecords		= 0
UI.ETP_Menu_List.scrollBar				= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_List:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

    self.records				= {}
    self.numRecords				= 0
    self.selRecord				= nil
    self.overrolledRecord		= nil
    self.firstVisibleRecordIdx	= -1

	self.maxVisibleRecords = math.floor( self:GetLayerHeight( self.layers.RECORDS ) / self.drawInfo.recordHeight )

	self:InitScrollBar()
	self:UpdateScrollBar()
	self:SetLayerWidth( self:GetLayerWidth( self.layers.RECORDS ) - self.scrollBar:GetWidth(), self.layers.RECORDS )

	self:UpdateFocusFrame()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.ETP_Menu_List:InitScrollBar()

	self.scrollBar = self:GetChildByName( "scrollBar" )
	
	local scrollBarRect	= self.scrollBar:GetRect()
	local selfRect		= self:GetRect()
	local recordsRect	= self:GetLayerRect( self.layers.RECORDS )

	scrollBarRect.x	= selfRect.z - scrollBarRect.z
	scrollBarRect.y	= recordsRect.y
	scrollBarRect.w	= recordsRect.w

	self.scrollBar:SetRect( scrollBarRect )

end


--
function UI.ETP_Menu_List:CanScroll( bForward )

	if self.firstVisibleRecordIdx == -1 then
		return false
	end

	if bForward then
		return self:GetLastVisibleRecordIdx() < self.numRecords
	else
		return self.firstVisibleRecordIdx > 1
	end

end


--
function UI.ETP_Menu_List:Scroll( delta )

	if self.firstVisibleRecordIdx == -1 then
		return false
	end

	if delta > 0 then
		delta = math.min( delta, self.numRecords - self:GetLastVisibleRecordIdx() )
	else		
		delta = -math.min( math.abs( delta ), self.firstVisibleRecordIdx - 1 )
	end

	local nextIdx = self.firstVisibleRecordIdx + delta

	if nextIdx == self.firstVisibleRecordIdx then
		return
	end

	self:SetFirstVisibleRecordClamped( nextIdx )

end


--
function UI.ETP_Menu_List:GetLastVisibleRecordIdx()

	if self.firstVisibleRecordIdx == -1 then
		return -1
	end

	return self.firstVisibleRecordIdx + math.min( self.numRecords - self.firstVisibleRecordIdx + 1, self.maxVisibleRecords ) - 1
	
end


--
function UI.ETP_Menu_List:SetFirstVisibleRecordClamped( recordIdx )

	if self.numRecords == 0 then
		recordIdx = -1
	else
		recordIdx = UI:Clamp( recordIdx, 1, math.max( 1, self.numRecords - self.maxVisibleRecords + 1 ) )
	end

	self.firstVisibleRecordIdx = recordIdx

	self:UpdateScrollBarPos()	

end


--
function UI.ETP_Menu_List:UpdateScrollBar()

	if self.numRecords <= self.maxVisibleRecords then
		self.scrollBar:SetRange( 0, 0 )

	else
		self.scrollBar:SetRange( 0, self.numRecords - self.maxVisibleRecords )
	end

	self:UpdateScrollBarPos()

end


--
function UI.ETP_Menu_List:UpdateScrollBarPos()

	if self.firstVisibleRecordIdx ~= -1 and self.scrollBar:GetMax() > 0 then
		self.scrollBar:SetPos( self.firstVisibleRecordIdx - 1 )

	else
		self.scrollBar:SetPos( 0 )
	end

end


--
function UI.ETP_Menu_List:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipW, clipH, layerIdx )

	if layerIdx == self.layers.RECORDS then
		self:DrawRecords()

	elseif layerIdx == self.layers.FOCUS_FRAME then
		self:DrawFocusFrame()
	end

end


--
function UI.ETP_Menu_List:DrawRecords()

	if self.firstVisibleRecordIdx == -1 then
		return
	end

	local layerRect = UI:QuatCopyStable( self:ToScreen( self:GetLayerRect( self.layers.RECORDS ) ) )
	local y = layerRect.y 

	for recordIdx = self.firstVisibleRecordIdx, self:GetLastVisibleRecordIdx() do
		local record = self.records[ recordIdx ]

		local rect = UI:Quat( layerRect.x, y, layerRect.z, self.drawInfo.recordHeight )
		local color = self:GetRecordColor( record )

         _G.DrawText(
 			record.text,
 			self:GetFont( self.layers.RECORDS ),
 			rect,
 			color,
			0,
 			self:GetTextFormatFlags( self.layers.RECORDS ),
 			rect
 		) 

		y = y + self.drawInfo.recordHeight
	end 

end


--
function UI.ETP_Menu_List:GetRecordColor( record )

	if record.isSelected then
		return self.drawInfo.recordColor_sel

	elseif record.isOverrolled then
		return self.drawInfo.recordColor_overrolled

	else
		return self.drawInfo.recordColor_unsel
	end

end


--
function UI.ETP_Menu_List:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput == self:GetUiHandle() then
    	local record = self:GetRecordByPos( mouseX, mouseY )
    	self:SetOverrolledRecord( record )
	end

	return true

end


--
function UI.ETP_Menu_List:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateSelRecordOnLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	self:CaptuerFocus()

	return true

end


--
function UI.ETP_Menu_List:UpdateSelRecordOnLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record = self:GetRecordByPos( mouseX, mouseY )

    	if record then
    		if record == self.selRecord then
    			self:SetSelRecord( nil, false )
    		else
    			self:SetSelRecord( record, true )
    		end
    	end

	end

end


--
function UI.ETP_Menu_List:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetOverrolledRecord( nil )
	return false

end


--
function UI.ETP_Menu_List:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:Scroll( -ticks * 3 )

	return true

end


--
function UI.ETP_Menu_List:SetSelRecord( record, bEnsureSelVisible )

	if bEnsureSelVisible == nil then
		bEnsureSelVisible = false
	end

	if self.selRecord then
		self.selRecord.isSelected = false
	end

	self.selRecord = record

	if self.selRecord then

		self.selRecord.isSelected = true

		if bEnsureSelVisible then
			self:EnsureRecordVisible( self.selRecord.idx )
		end

	end

end


--
function UI.ETP_Menu_List:EnsureRecordVisible( recordIdx )

	if recordIdx == -1 then
		return
	end

	if self.firstVisibleRecordIdx == -1 then
		return
	end

	if recordIdx < self.firstVisibleRecordIdx then
		self:SetFirstVisibleRecordClamped( recordIdx )

    elseif recordIdx > self:GetLastVisibleRecordIdx() then
    	self:SetFirstVisibleRecordClamped( recordIdx - self.maxVisibleRecords + 1 )	
	end

end


--
function UI.ETP_Menu_List:SetOverrolledRecord( record )

	if self.overrolledRecord then
		self.overrolledRecord.isOverrolled = false
	end

	self.overrolledRecord = record

	if self.overrolledRecord then
		self.overrolledRecord.isOverrolled = true
	end 	

end


--
function UI.ETP_Menu_List:GetRecordByPos( x, y )

	if not next( self.records ) then
		return nil
	end

	local layerRect = self:GetLayerRect( self.layers.RECORDS )
	if not UI:IsPtInRect( layerRect, x, y ) then
		return nil
	end

	for slotIdx = 1, math.min( self.maxVisibleRecords, self.numRecords ) do

		local recordRect = self:GetSlotRect( slotIdx )

		if UI:IsPtInRect( recordRect, x, y ) then
			local recordIdx = self.firstVisibleRecordIdx + slotIdx - 1
			return self.records[ recordIdx ]
		end

	end

	return nil

end    


--
function UI.ETP_Menu_List:GetSlotRect( slotIdx )

	local layerRect = self:GetLayerRect( self.layers.RECORDS )
	return UI:Quat( layerRect.x, layerRect.y + self.drawInfo.recordHeight * ( slotIdx - 1 ), layerRect.z, self.drawInfo.recordHeight )

end


--
function UI.ETP_Menu_List:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:UpdateVisibleRangeFromScrollBar()

end


--
function UI.ETP_Menu_List:UpdateVisibleRangeFromScrollBar()

	if self.firstVisibleRecordIdx == -1 then
		return
	end

	local scrollPos = UI:Clamp( UI:Round( self.scrollBar:GetPos() ), self.scrollBar:GetMin(), self.scrollBar:GetMax() )
	self.firstVisibleRecordIdx = UI:Clamp( scrollPos + 1, 1, self.numRecords )

end


--
function UI.ETP_Menu_List:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then
		if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
			return true
		end
	end

	return self:HandleKey( key, -2 )

end


--
function UI.ETP_Menu_List:OnUp()

	if self.selRecord then

		local prevRecordIdx = self.selRecord.idx - 1
		if prevRecordIdx >= 1 then
			self:SetSelRecord( self.records[ prevRecordIdx ], true )
		end

	else
		self:Scroll( -1 )
	end

	return true

end


--
function UI.ETP_Menu_List:OnDown()

	if self.selRecord then

		local nextRecordIdx = self.selRecord.idx + 1
		if nextRecordIdx <= self.numRecords then
			self:SetSelRecord( self.records[ nextRecordIdx ], true )
		end

	else
		self:Scroll( 1 )
	end

	return true

end


--
function UI.ETP_Menu_List:OnPageUp()	

	if self.selRecord then

		local recordIdx = UI:Clamp( self.selRecord.idx - self.maxVisibleRecords + 1, 1, self.numRecords )
		self:SetSelRecord( self.records[ recordIdx ], true )

	elseif self.firstVisibleRecordIdx ~= -1 then
    	self:SetFirstVisibleRecordClamped( self.firstVisibleRecordIdx - self.maxVisibleRecords )
	end

	return true

end


--
function UI.ETP_Menu_List:OnPageDown()

	if self.selRecord then

		local recordIdx = UI:Clamp( self.selRecord.idx + self.maxVisibleRecords - 1, 1, self.numRecords )
		self:SetSelRecord( self.records[ recordIdx ], true )

	elseif self.firstVisibleRecordIdx ~= -1 then
		self:SetFirstVisibleRecordClamped( self.firstVisibleRecordIdx + self.maxVisibleRecords )
	end

	return true

end


--
function UI.ETP_Menu_List:OnHome()

	if self.selRecord then
		self:SetSelRecord( self.records[ 1 ], true )

	elseif self.firstVisibleRecordIdx ~= -1 then
		self:SetFirstVisibleRecordClamped( 1 )
	end

	return true

end


--
function UI.ETP_Menu_List:OnEnd()

	if self.selRecord then
		self:SetSelRecord( self.records[ self.numRecords ], true )

	elseif self.firstVisibleRecordIdx ~= -1 then
		self:SetFirstVisibleRecordClamped( self.numRecords )
	end

	return true

end


--
function UI.ETP_Menu_List:F_OnObtainKeyboardFocus()

	self:OnObtainKeyboardFocus()
	self:UpdateFocusFrame()

end


--
function UI.ETP_Menu_List:F_OnLostKeyboardFocus()

	self:OnLostKeyboardFocus()
	self:UpdateFocusFrame()

end


--
function UI.ETP_Menu_List:UpdateFocusFrame()

	local bHasFocus = UI:GetKeyboardFocus() == self:GetUiHandle()
	self:SetLayerVisible( bHasFocus, self.layers.FOCUS_FRAME )

end


--
function UI.ETP_Menu_List:DrawFocusFrame()

	local selfRect = self:GetRect()

	local parent = self:GetParent()
	if parent then
		selfRect = parent:ToScreen( selfRect )
	end	

	local FRAME_SIZE_ABS = 1
	local frameSize = UI:Vec2( UI:XToRel( FRAME_SIZE_ABS ), UI:YToRel( FRAME_SIZE_ABS ) )

	local leftRect	= UI:Quat( selfRect.x - frameSize.x, selfRect.y - frameSize.y, frameSize.x, selfRect.w + frameSize.y * 2 )
	local topRect	= UI:Quat( selfRect.x - frameSize.x, selfRect.y - frameSize.y, selfRect.z + frameSize.x * 2, frameSize.y )
	local rightRect	= UI:Quat( selfRect.x + selfRect.z, selfRect.y - frameSize.y, frameSize.x, selfRect.w + frameSize.y * 2 )
	local btmRect	= UI:Quat( selfRect.x - frameSize.x, selfRect.y + selfRect.w, selfRect.z + frameSize.x * 2, frameSize.y )

	local hTex = self:GetTexture( self.layers.FOCUS_FRAME )
	local color = self:GetColor( self.layers.FOCUS_FRAME )

	UI.drawer:DrawImagedRect(
   		leftRect.x, leftRect.y, leftRect.z, leftRect.w,
   		leftRect.x, leftRect.y, leftRect.z, leftRect.w,
		hTex,
   		color,
   		0, 0, 1, 1,
		false
	)

	UI.drawer:DrawImagedRect(
   		topRect.x, topRect.y, topRect.z, topRect.w,
   		topRect.x, topRect.y, topRect.z, topRect.w,
		hTex,
   		color,
   		0, 0, 1, 1,
		false
	)

	UI.drawer:DrawImagedRect(
   		rightRect.x, rightRect.y, rightRect.z, rightRect.w,
   		rightRect.x, rightRect.y, rightRect.z, rightRect.w,
		hTex,
   		color,
   		0, 0, 1, 1,
		false
	)

	UI.drawer:DrawImagedRect(
   		btmRect.x, btmRect.y, btmRect.z, btmRect.w,
   		btmRect.x, btmRect.y, btmRect.z, btmRect.w,
		hTex,
   		color,
   		0, 0, 1, 1,
		false
	)

end


--
function UI.ETP_Menu_List:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.ETP_Menu_List:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.ETP_Menu_List:CaptuerFocus()

	local parent = self:GetParent()
	if not parent then
		return
	end

	self:SetActivationOrder( 0 )

	parent:SetDefaultActivatableChild( self:GetName() )
	UI:SetKeyboardFocus( self:GetUiHandle() )

end


--
function UI.ETP_Menu_List:ReleaseFocus()

	self:SetActivationOrder( -1 )

	local parent = self:GetParent()
	if parent and parent:GetDefaultActivatableChild() == self then
		parent:SetDefaultActivatableChild( "" )
	end

	if UI:GetKeyboardFocus() == self:GetUiHandle() then
		UI:SetKeyboardFocus( UI.INVALID_UI_HANDLE )		
		UI:ValidateKeyboardFocus()
	end

end


--
function UI.ETP_Menu_List:F_OnEventMouseButtonDown( hSender, btnIdx )

	if btnIdx ~= 0 then
		return
	end

	if UI:GetKeyboardFocus() ~= self:GetUiHandle() then
		return
	end

	self:ReleaseFocus()

end


-- --------------------------------------------------------
-- UI.ETP_Menu_EffectsList
-- --------------------------------------------------------

UI.ETP_Menu_EffectsList = {}
local etpme = UI.ETP_Menu_EffectsList

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_EffectsList.def =
{
	className	= "Wnd",
	prototype	= "ETP_Menu_List",

	props =
	{
		name			= "ETP_MenuWnd_EffectsList",
		rect			= Quat( 10, 0, 200, 300 ),
	},

	layers =
	{
		-- CAPTION
		{
			id			= UI.ETP_Menu_List.layers.CAPTION,
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 200, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Effects",			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
			rect		= Quat( 0, 20, 200, 300-20 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		
		}
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_EffectsList:SetupOnNewEffect()

	self:Reset()

	self:CreateTree()

	if self.tree then
		self:SetSubTreeStateByNode( self.tree, true, false )
	end		

end


--
function UI.ETP_Menu_EffectsList:GetSelItemWndHandle()

	if not self.selRecord then
		return UI.INVALID_UI_HANDLE
	else
		return self.selRecord.node.item:GetUiHandle()
	end

end


--
function UI.ETP_Menu_EffectsList:SelectEffectByItem( hItem )

	if hItem == UI.INVALID_UI_HANDLE then
		sys.log( "UI.ETP_Menu_EffectsList:SelectEffectByItem()[ERROR]: invalid handle" )
		return
	end
                                    	
	local item = UI:GetUiObjByHandleT( hItem )
	local record = self:Item2Record( item )

	if not record then

		local node = self:Item2Node( item )

		if node then

			self:SetSubTreeStateByNode( node, true, false )
			record = self:Item2Record( item )

		else
			sys.log( "UI.ETP_Menu_EffectsList:SelectEffectByItem()[ERROR]: cannot find node" )
		end
		
	end

	if record then
		self:SetSelRecord( record, true )
	else
		sys.log( "I.ETP_Menu_EffectsList:SelectEffectByItem()[ERROR]: cannot find or create record" )
	end

end


--
function UI.ETP_Menu_EffectsList:Reset()

	UI.ETP_Menu_List.Reset( self )
	self.tree = nil

end


-- -------------------------------
-- const
-- -------------------------------

etpme.drawInfo =
{
	recordColor_invisible				= UI:ARGB( 0xff, 0x33, 0x33, 0xff ),	
	recordColor_selInvisible			= UI:ARGB( 0xff, 0x00, 0x88, 0xff ),	
	recordColor_invisibleChildren		= UI:ARGB( 0xff, 0xcc, 0xcc, 0xff ),
	recordColor_selInvisibleChildren	= UI:ARGB( 0xff, 0xcc, 0xcc, 0x33 ),
	headTextColor						= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),
}

etpme.visibilityStates =
{
	VISIBLE_SELF			= 1,
	INVISIBLE_SELF			= 2,
	INVISIBLE_CHILDREN		= 3,
}

-- -------------------------------
-- vars
-- -------------------------------

etpme.symbolWidth	= 0
etpme.tree			= {}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_EffectsList:F_PostLoad()

	UI.ETP_Menu_List.F_PostLoad( self )

	local hFont = self:GetFont( self.layers.RECORDS )
	local formatRect = UI:Quat( 0, 0, 1024, 768 )

	-- предполагается, что шрифт моноширинный; тоолько в этом случае имеет смысл
	self.symbolWidth= _G.MeasureText(
   		" ",
   		hFont,
   		formatRect,
   		FONT.TF_LEFT + FONT.TF_TOP,
   		formatRect ).z	

end


--
function UI.ETP_Menu_EffectsList:CreateTree()

	self.tree = nil

	local rootItem = UI.EffectTreePreviewWnd:GetRootItem()
	self:AddNodeRecursive( nil, rootItem, 1 )

end 


--
function UI.ETP_Menu_EffectsList:AddNodeRecursive( rootNode, item, level )

	local node =
	{
		item		= item,
		isOpen		= false,
		level		= level,
		nodes		= nil,
		path        = "",
	}

	if rootNode then

		node.path = string.format( "%s/%s", rootNode.path, item:GetName() )

    	if not rootNode.nodes then
    		rootNode.nodes = {}
    	end

    	table.insert( rootNode.nodes, node )

	else

		if not self.tree then
			node.path = item:GetName()
			self.tree = node
		else
			sys.log( "UI.ETP_Menu_EffectsList:AddNodeRecursive()[ERROR]: nil root node" )
		end

	end

	local childItem = item:GetFirstChild()
	while childItem do			

		self:AddNodeRecursive( node, childItem, level + 1 )
		childItem = childItem:GetNextSibling()

	end

end


--
function UI.ETP_Menu_EffectsList:SetSubTreeStateByPath( path, bOpen, bAllHierarchy )

	if UI:IsStrEmpty( path ) then
		sys.log( "UI.ETP_Menu_EffectsList:SetSubTreeStateByPath()[ERROR]: empty path" )
		return false
	end

	local node = self:Path2Node( path )
	if not node then
		sys.log( "UI.ETP_Menu_EffectsList:SetSubTreeStateByPath()[ERROR]: cannot find node for path %s", path )
		return false
	end

	self:SetSubTreeStateByNode( node, bOpen, bAllHierarchy )

end


--
function UI.ETP_Menu_EffectsList:SetSubTreeStateByNode( node, bOpen, bAllHierarchy )

	if not node then
		sys.log( "UI.ETP_Menu_EffectsList:SetSubTreeStateByNode()[ERROR]: nil node" )
	end

	self:SetNodeStateRecursive( node, bOpen, bAllHierarchy )
	self:UpdateRecords()	

end


--
function UI.ETP_Menu_EffectsList:SetNodeStateRecursive( node, bOpen, bAllHierarchy )

	if not node then
		sys.log( "UI.ETP_Menu_EffectsList:SetNodeStateRecursive()[ERROR]: nil node" )
	end

	node.isOpen = bOpen

	if bAllHierarchy and node.nodes then

		for childNodeIdx = 1, #node.nodes do
			self:SetNodeStateRecursive( node.nodes[ childNodeIdx ], bOpen, true )
		end

	end

end


--
function UI.ETP_Menu_EffectsList:UpdateRecords()

	local oldFirstVisibleRecordIdx	= self.firstVisibleRecordIdx
	local oldSelPath				= self.selRecord and self:Record2Path( self.selRecord ) or ""

	self:ResetRecords()

	if not self.tree then
		return
	end

	self:CreateRecordsForNodeRecursive( self.tree )

	self.numRecords = #self.records

	if self.numRecords == 0 then
		sys.log( "UI.ETP_Menu_EffectsList:UpdateRecords()[ERROR]: no records" )
		return
	end

	if oldFirstVisibleRecordIdx ~= -1 then
		self.firstVisibleRecordIdx = UI:Clamp( oldFirstVisibleRecordIdx, 1, self.numRecords )
	else
		self.firstVisibleRecordIdx = 1
	end

	if oldSelPath ~= "" then
    	local selRecord = self:Path2Record( oldSelPath )
    	if selRecord then
    		self:SetSelRecord( selRecord, false )
    	end
	end

	self:UpdateOverrolledRecord()
	self:UpdateScrollBar()

end


--
function UI.ETP_Menu_EffectsList:ResetRecords()

	self.records				= {}
	self.numRecords				= 0
	self.firstVisibleRecordIdx	= -1
	self.selRecord				= nil
	self.overrolledRecord		= nil

end


--
function UI.ETP_Menu_EffectsList:CreateRecordsForNodeRecursive( node )

	local record = self:CreateRecordForNode( node )

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1
	record.idx = self.numRecords
	
	if node.nodes and node.isOpen then
		for childNodeIdx = 1, #node.nodes do
			self:CreateRecordsForNodeRecursive( node.nodes[ childNodeIdx ] )			
		end
	end

end


--
function UI.ETP_Menu_EffectsList:CreateRecordForNode( node )

	local record = {}

	record.idx			= -1
	record.node			= node
	record.isOverrolled	= false
	record.isSelected	= false

	self:UpdateRecordText( record )

	return record	

end


--
function UI.ETP_Menu_EffectsList:UpdateRecordText( record )

	local path = self:Record2Path( record )

	record.text = self:Path2Localized( path )

	local numSpaces = ( record.node.level - 1 ) * 2
	local spacesWidth = numSpaces * self.symbolWidth

	local isLeaf = record.node.nodes == nil

	if not isLeaf then
		record.headText = record.node.isOpen and "-" or "+"
		record.headTextX = spacesWidth
		record.textX = record.headTextX + self.symbolWidth
	else
		record.headText = ""
		record.textX = spacesWidth
		record.headTextX = 0
	end

end


--
function UI.ETP_Menu_EffectsList:Path2Localized( path )

	local item = self:Path2Item( path )
	if item then
		local effect = item:GetEffect() 
		if effect then
			return L_EffectName2Displayable( effect:GetName() )
		else
			return "no effect"
		end
	else
		return "no item"		
	end

end


--
function UI.ETP_Menu_EffectsList:UpdateOverrolledRecord()

	local mouseX = self:XToWindow( UI:GetMouseX() )
	local mouseY = self:YToWindow( UI:GetMouseY() )

	local record = self:GetRecordByPos( mouseX, mouseY )
	self:SetOverrolledRecord( record )

end


--
function UI.ETP_Menu_EffectsList:Path2Record( path )

	if UI:IsStrEmpty( path ) then
		sys.log( "UI.ETP_Menu_EffectsList:Path2Record()[ERROR]: empty path" )
		return nil
	end

	local node = self:Path2Node( path )
	if not node then
		return nil
	end

	return self:Node2Record( node )

end


--
function UI.ETP_Menu_EffectsList:Path2Item( path )

	if UI:IsStrEmpty( path ) then
		sys.log( "UI.ETP_Menu_EffectsList:Path2Item()[ERROR]: empty path" )
		return nil
	end

	local node = self:Path2Node( path )
	return node and node.item

end


--
function UI.ETP_Menu_EffectsList:Path2Node( path )

	if UI:IsStrEmpty( path ) then
		sys.log( "UI.ETP_Menu_EffectsList:Path2Node()[ERROR]: empty path" )
		return nil
	end

	if not self.tree then
		return nil
	end

	return self:Path2NodeRecursive( self.tree, path )

end


--
function UI.ETP_Menu_EffectsList:Path2NodeRecursive( curRootNode, path )

	if not curRootNode or UI:IsStrEmpty( path ) then
		return nil
	end

	if curRootNode.path == path then
		return curRootNode
	end

	if curRootNode.nodes then
		for childNodeIdx, childNode in pairs( curRootNode.nodes ) do
			local node = self:Path2NodeRecursive( childNode, path )
			if node then
				return node
			end				
		end
	end

	return nil

end


--
function UI.ETP_Menu_EffectsList:Record2Path( record )

	if not record then
		sys.log( "UI.ETP_Menu_EffectsList:Record2Path()[ERROR]: nil record" )
		return ""
	end

	return self:Node2Path( record.node )

end


--
function UI.ETP_Menu_EffectsList:Node2Path( node )

	if not node then
		sys.log( "UI.ETP_Menu_EffectsList:Node2Path()[ERROR]: nil node" )
		return ""
	end

	return node.path

end 


--
function UI.ETP_Menu_EffectsList:Item2Path( item )

	if not item then
		sys.log( "UI.ETP_Menu_EffectsList:Item2Path()[ERROR]: nil item" )
		return ""
	end

	local node = self:Item2Node( item )
	return node and self:Node2Path( node ) or ""

end


--
function UI.ETP_Menu_EffectsList:Item2Record( item )

	if not item then
		sys.log( "UI.ETP_Menu_EffectsList:Item2Record()[ERROR]: nil item" )
		return nil
	end

	for idx, record in pairs( self.records ) do
		if record.node.item == item then
			return record
		end
	end	

	return nil	

end


function UI.ETP_Menu_EffectsList:Node2Record( node )

	if not node then
		sys.log( "UI.ETP_Menu_EffectsList:Node2Record()[ERROR]: nil node" )
		return nil
	end


	for idx, record in pairs( self.records ) do
		if record.node == node then
			return record
		end
	end

	return nil

end


--
function UI.ETP_Menu_EffectsList:Item2Node( item )

	if not item then
		sys.log( "UI.ETP_Menu_EffectsList:Item2Node()[ERROR]: nil item" )
		return nil
	end

	if not self.tree then
		return nil
	end

	return self:Item2NodeRecursive( self.tree, item )

end


--
function UI.ETP_Menu_EffectsList:Item2NodeRecursive( curRootNode, item )

	if not curRootNode or not item then
		return nil
	end

	if curRootNode.item == item then
		return curRootNode
	end

	if curRootNode.nodes then
		for childNodeIdx, childNode in pairs( curRootNode.nodes ) do
			local item = self:Path2ItemRecursive( childNode, item )
			if node then
				return node
			end				
		end
	end

	return nil

end


--
function UI.ETP_Menu_EffectsList:UpdateSelRecordOnLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record, bPlusZone = self:GetRecordByPosEx( mouseX, mouseY )

    	if record then

			if bPlusZone then
				self:SetSubTreeStateByNode( record.node, not record.node.isOpen, false )

			else
        		if record == self.selRecord then
        			self:SetSelRecord( nil, false )
        		else
        			self:SetSelRecord( record, true )
        		end
			end
    	end

	end

end


--
function UI.ETP_Menu_EffectsList:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record = self:GetRecordByPos( mouseX, mouseY )
    	if record then
    		self:ToggleEffectVisibility( record.node.item, false )
    	end
	end

	return true

end


--
function UI.ETP_Menu_EffectsList:F_OnMouseMButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseMButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record, bPlusZone = self:GetRecordByPosEx( mouseX, mouseY )

    	if record then

			if bPlusZone then
				self:SetSubTreeStateByNode( record.node, not record.node.isOpen, true )
			else
	    		self:ToggleEffectVisibility( record.node.item, true )
			end

    	end
	end

	return true

end   


--
function UI.ETP_Menu_EffectsList:GetRecordByPosEx( x, y )

	if not next( self.records ) then
		return nil, false
	end

	local layerRect = self:GetLayerRect( self.layers.RECORDS )
	if not UI:IsPtInRect( layerRect, x, y ) then
		return nil, false
	end

	for slotIdx = 1, math.min( self.maxVisibleRecords, self.numRecords ) do

		local recordRect = self:GetSlotRect( slotIdx )

		if UI:IsPtInRect( recordRect, x, y ) then

			local recordIdx = self.firstVisibleRecordIdx + slotIdx - 1
			local record = self.records[ recordIdx ]

			local bPlusZone = false
			local isLeaf = record.node.nodes == nil

			if not isLeaf then
				bPlusZone = x < ( recordRect.x + record.textX )
			end			

			return record, bPlusZone

		end

	end

	return nil, false

end


--
function UI.ETP_Menu_EffectsList:GetRecordColor( record )

	local visibilityState = self:GetRecordVisibilityState( record )

	if record.isSelected then

		if visibilityState == self.visibilityStates.VISIBLE_SELF then
			return self.drawInfo.recordColor_sel

		elseif visibilityState == self.visibilityStates.INVISIBLE_SELF then
			return self.drawInfo.recordColor_selInvisible

		elseif visibilityState == self.visibilityStates.INVISIBLE_CHILDREN then
			return self.drawInfo.recordColor_selInvisibleChildren
		end

	else

		if visibilityState == self.visibilityStates.VISIBLE_SELF then

			if record.isOverrolled then
				return self.drawInfo.recordColor_overrolled
			else
				return self.drawInfo.recordColor_unsel
			end

		elseif visibilityState == self.visibilityStates.INVISIBLE_SELF then
			return self.drawInfo.recordColor_invisible

		elseif visibilityState == self.visibilityStates.INVISIBLE_CHILDREN then
			return self.drawInfo.recordColor_invisibleChildren
		end

	end

	return UI.WHITE_COLOR

end


--
function UI.ETP_Menu_EffectsList:GetRecordVisibilityState( record )

	if not record then
		return self.visibilityStates.INVISIBLE_SELF
	end

	if not record.node.item:IsEffectVisible() then
		return self.visibilityStates.INVISIBLE_SELF
	else
		if self:IsInvisibleNodeInHierarchyRecursive( record.node ) then
			return self.visibilityStates.INVISIBLE_CHILDREN
		else
			return self.visibilityStates.VISIBLE_SELF
		end

	end

end


--
function UI.ETP_Menu_EffectsList:IsInvisibleNodeInHierarchyRecursive( curRootNode )

	if not curRootNode then
		return false
	end

	if not curRootNode.item:IsEffectVisible() then
		return true
	end

	if not curRootNode.nodes then
		return false
	end

	for childNodeIdx, childNode in pairs( curRootNode.nodes ) do
		if self:IsInvisibleNodeInHierarchyRecursive( childNode ) then
			return true
		end
	end

	return false

end


--
function UI.ETP_Menu_EffectsList:SetOverrolledRecord( record )

	if self.overrolledRecord then
		self.overrolledRecord.isOverrolled = false
	end

	self.overrolledRecord = record

	if self.overrolledRecord then
		self.overrolledRecord.isOverrolled = true
	end 	

end


--
function UI.ETP_Menu_EffectsList:SetSelRecord( record, bEnsureSelVisible )

	UI.ETP_Menu_List.SetSelRecord( self, record, bEnsureSelVisible )

	UI.EffectTreePreviewWnd:OnSelEffectChanged()

end


--
function UI.ETP_Menu_EffectsList:ToggleEffectVisibility( item, bTree )

	if etp:GetOptionVal( etp.options.LINK_VISIBILITY ) == true then
		return
	end

	local bVisible = item and item:IsEffectVisible()
	self:SetEffectVisibilityRecursive( item, not bVisible, bTree )

end


--
function UI.ETP_Menu_EffectsList:SetEffectVisibilityRecursive( item, bVisible, bTree )

	if not item then
		sys.log( "UI.ETP_Menu_EffectsList:SetEffectVisibilityRecursive()[ERROR]: nil item" )
		return
	end

	item:SetEffectVisible( bVisible )

	if bTree then

		local childItem = item:GetFirstChild()
		while childItem do

			self:SetEffectVisibilityRecursive( childItem, bVisible, true )
			childItem = childItem:GetNextSibling()

		end

	end

end


--
function UI.ETP_Menu_EffectsList:DrawRecords()

	if self.firstVisibleRecordIdx == -1 then
		return
	end

	local layerRect = UI:QuatCopyStable( self:ToScreen( self:GetLayerRect( self.layers.RECORDS ) ) )
	local y = layerRect.y 

	for recordIdx = self.firstVisibleRecordIdx, self:GetLastVisibleRecordIdx() do

		local record = self.records[ recordIdx ]

		local recordRect = UI:Quat( layerRect.x + record.textX, y, layerRect.z - record.textX, self.drawInfo.recordHeight )
		local recordColor = self:GetRecordColor( record )

         _G.DrawText(
 			record.text,
 			self:GetFont( self.layers.RECORDS ),
 			recordRect,
 			recordColor,
			0,
 			self:GetTextFormatFlags( self.layers.RECORDS ),
 			recordRect
 		) 

		-- отрисовка знаков +/-
		if record.headText ~= "" then

    		local headRect = UI:Quat( layerRect.x + record.headTextX, y, layerRect.z - record.headTextX, self.drawInfo.recordHeight )
    		local headColor = self.drawInfo.headTextColor

             _G.DrawText(
     			record.headText,
     			self:GetFont( self.layers.RECORDS ),
     			headRect,
     			headColor,
				0,
     			self:GetTextFormatFlags( self.layers.RECORDS ),
     			headRect
     		) 

		end

		y = y + self.drawInfo.recordHeight

	end 

end


--
function UI.ETP_Menu_EffectsList:OnLeft()

	if not self.selRecord then
		return true
	end

	local nodeToSelect = nil

	if self.selRecord.node.nodes ~= nil then
	
		if self.selRecord.node.isOpen then
			self:SetSubTreeStateByNode( self.selRecord.node, false, false )
			return true
		end

	end

	local parentNode = nil
	local parentRecordIdx = -1

	for prevRecordIdx = self.selRecord.idx, 1, -1 do
		local prevNode = self.records[ prevRecordIdx ].node
		if prevNode.nodes and prevNode.level < self.selRecord.node.level then
			parentNode = prevNode
			parentRecordIdx = prevRecordIdx
			break
		end
	end

	if parentNode and parentNode.isOpen then
		self:SetSelRecord( self.records[ parentRecordIdx ], true )
	end

	return true

end


--
function UI.ETP_Menu_EffectsList:OnRight()

	if not self.selRecord then
		return true
	end

	if self.selRecord.node.nodes ~= nil then
	
		if not self.selRecord.node.isOpen then
			self:SetSubTreeStateByNode( self.selRecord.node, true, false )
		end

	end

	return true

end


-- --------------------------------------------------------
-- UI.ETP_Menu_AnimationsList
-- --------------------------------------------------------

UI.ETP_Menu_AnimationsList = {}
local etpma = UI.ETP_Menu_AnimationsList

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_AnimationsList.def =
{
	className 	= "Wnd",
	prototype	= "ETP_Menu_List",

	props =
	{
		name			= "ETP_Menu_AnimationsList",
		rect			= Quat( 10, 450, 170, 205 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- CAPTION
		{
			id			= UI.ETP_Menu_List.layers.CAPTION,
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Animations",			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
			rect		= Quat( 0, 20, 170, 205-20 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		

		}
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_AnimationsList:SetupForSelEffect()

	self:Reset()

	local effect = UI.EffectTreePreviewWnd:GetSelEffect()
	if not effect then
		return
	end

	for animIdx = 0, effect:GetNumAnimations() - 1 do
		
		local record = {}

		record.idx			= animIdx + 1
    	record.isSelected	= false
		record.isOverrolled	= false
		record.isPlaying	= false
		record.animName		= effect:GetAnimationName( animIdx )
		record.text			= string.format( "%s [%s]", record.animName, effect:IsAnimationLooped( record.animName ) and "l" or "o" )

		table.insert( self.records, record )

	end

	self.numRecords = #self.records
	if self.numRecords > 0 then
		self.firstVisibleRecordIdx = 1
	end
	self:UpdateScrollBar()

	self:UpdatePlayingAnimation()

end


--
function UI.ETP_Menu_AnimationsList:GetSelAnimation()

	return self.selRecord and self.selRecord.animName

end


--
function UI.ETP_Menu_AnimationsList:GetPlayingAnimation()

	return self.playingRecord and self.playingRecord.animName

end


--
function UI.ETP_Menu_AnimationsList:Reset()

	self:SetPlayingRecord( nil, true )

	UI.ETP_Menu_List.Reset( self )

end


--
function UI.ETP_Menu_AnimationsList:PlaySelAnimation()

	self:SetPlayingRecord( self.selRecord )

end


--
function UI.ETP_Menu_AnimationsList:StopSelAnimation()

	self:SetPlayingRecord( nil )	

end


-- -------------------------------
-- cont
-- -------------------------------

etpma.drawInfo =
{
	recordColor_playing	= UI:ARGB( 0xff, 0xff, 0x00, 0x00 ),	
}

-- -------------------------------
-- vars
-- -------------------------------

etpma.playingRecord = nil

-- -------------------------------
-- work functions
-- -------------------------------   

--
function UI.ETP_Menu_AnimationsList:SetSelRecord( record, bEnsureSelVisible, bNotNotify )

	if bNotNotify == nil then
		bNotNotify = false
	end

	if self.selRecord == record then
		return
	end

	UI.ETP_Menu_List.SetSelRecord( self, record, bEnsureSelVisible )

	if not bNotNotify then
		UI.EffectTreePreviewWnd:OnSelAnimationChanged()
	end

	self:SetPlayingRecord( self.selRecord, bNotNotify )

end


--
function UI.ETP_Menu_AnimationsList:SetPlayingRecord( record, bNotNotify )

	if bNotNotify == nil then
		bNotNotify = false
	end

	if self.playingRecord == record then
		return
	end

	if self.playingRecord then
		self.playingRecord.isPlaying = false
	end

	self.playingRecord = record

	if self.playingRecord then
		self.playingRecord.isPlaying = true
	end 


	if not bNotNotify then
		UI.EffectTreePreviewWnd:OnPlayingAnimationChanged()
	end

end  


--
function UI.ETP_Menu_AnimationsList:UpdatePlayingAnimation()

	local effect = UI.EffectTreePreviewWnd:GetSelEffect()

	if not effect then
		self:SetSelRecord( nil, false, false )
		self:SetPlayingRecord( nil )
		return
	end

	local anim = effect:GetCurAnimation()

	local record = self:GetRecordByAnimation( anim )

	if record then
		self:SetSelRecord( record, true, false )
	end

	self:SetPlayingRecord( record )

end


--
function UI.ETP_Menu_AnimationsList:GetRecordByAnimation( anim )

	for idx, record in pairs( self.records ) do
		if record.animName == anim then
			return record
		end
	end

	return nil

end


--
function UI.ETP_Menu_AnimationsList:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdatePlayingAnimation()

end


--
function UI.ETP_Menu_AnimationsList:GetRecordColor( record )

	if record.isPlaying then
		return self.drawInfo.recordColor_playing

	elseif record.isSelected then
		return self.drawInfo.recordColor_sel

	elseif record.isOverrolled then
		return self.drawInfo.recordColor_overrolled

	else
		return self.drawInfo.recordColor_unsel
	end

end  


--
function UI.ETP_Menu_AnimationsList:UpdateSelRecordOnLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record = self:GetRecordByPos( mouseX, mouseY )

    	if record then

    		if record == self.playingRecord then
				self:SetPlayingRecord( nil )

    		elseif record == self.selRecord then
				self:SetPlayingRecord( self.selRecord )

    		else
    			self:SetSelRecord( record, true, false )
    		end

    	end

	end

end
 

-- --------------------------------------------------------
-- UI.ETP_Menu_OptionsList
-- --------------------------------------------------------

UI.ETP_Menu_OptionsList = {}
local etpmo = UI.ETP_Menu_OptionsList

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_OptionsList.def =
{
	className 	= "Wnd",
	prototype	= "ETP_Menu_List",

	props =
	{
		name			= "ETP_Menu_OptionsList",
		rect			= Quat( 10+200+10, 0, 170, 300 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- CAPTION
		{
			id			= UI.ETP_Menu_List.layers.CAPTION,
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Display options",			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
			rect		= Quat( 0, 20, 170, 300-20 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		

		}
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_OptionsList:GetOptionVal( optionId )

	local record = self.records[ optionId ]
	if record ~= nil then
		return record.val
	else
		sys.log( "UI.ETP_Menu_OptionsList:GetOptionVal()[ERROR]: cannot find record vor option id %s", tostring( optionId ) )
		return 0
	end

end


--
function UI.ETP_Menu_OptionsList:Reset()

	self:SetOverrolledRecord( nil )
	self.records = {}
	self.firstVisibleRecordIdx = -1

end

-- -------------------------------
-- const
-- -------------------------------

etpmo.optionTexts =
{
	[ etp.options.SHOW_EFFECT_NAMES ]		= "effect names",
	[ etp.options.SHOW_EFFECT_ALL_RECTS ]	= "all effect rects",
	[ etp.options.SHOW_EFFECT_SEL_RECT ]	= "sel effect rect",
	[ etp.options.SHOW_LOCATOR_NAMES ]		= "locator names",
	[ etp.options.SHOW_LOCATOR_ALL_RECTS ]	= "all locator rects",
	[ etp.options.SHOW_LOCATOR_SEL_RECT ]	= "sel locator rect",
	[ etp.options.SHOW_LOCATOR_ALIGNMENT ]	= "text locator alignment",
	[ etp.options.EFFECT_ADJUSTMENT ]		= "adjust: ",
	[ etp.options.BG_COLOR ]				= "bg color: ",
	[ etp.options.LINK_ALPHA ]				= "link by alpha",
	[ etp.options.LINK_COLOR ]				= "link by color",
	[ etp.options.LINK_VISIBILITY ]			= "link by visibility",

}

etpmo.adjustments =
{
	CENTER	= 1,
	ZERO	= 2,
	NONE	= 3,
}

etpmo.optionDefaultVals =
{
	[ etp.options.SHOW_EFFECT_NAMES ]		= false,
	[ etp.options.SHOW_EFFECT_ALL_RECTS ]	= false,
	[ etp.options.SHOW_EFFECT_SEL_RECT ]	= false,
	[ etp.options.SHOW_LOCATOR_NAMES ]		= false,
	[ etp.options.SHOW_LOCATOR_ALL_RECTS] 	= false,
	[ etp.options.SHOW_LOCATOR_SEL_RECT ]	= false,
	[ etp.options.SHOW_LOCATOR_ALIGNMENT ]	= false,
	[ etp.options.EFFECT_ADJUSTMENT ]		= etpmo.adjustments.CENTER,
	[ etp.options.BG_COLOR ]				= 2,
	[ etp.options.LINK_ALPHA ]				= true,
	[ etp.options.LINK_COLOR ]				= true,
	[ etp.options.LINK_VISIBILITY ]			= true,
}

etpmo.drawInfo =
{
	recordHeight			= UI:YTo1024x768( 15, { x = 1280, y = 720 } ),
	recordColor_unsel		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),
	recordColor_overrolled  = UI:ARGB( 0xff, 0xaa, 0xaa, 0xaa ),		
}

etpmo.bgColors =
{
	UI:ARGB( 0xff, 0x00, 0x00, 0x00 ),
	UI:ARGB( 0xff, 0x77, 0x77, 0x77 ),
	UI:ARGB( 0xff, 0xcc, 0xcc, 0xcc ),
	UI:ARGB( 0xff, 0xff, 0xff, 0xff ),
}

etpmo.adjustment2Str =
{
	[ etpmo.adjustments.CENTER ]	= "center",
	[ etpmo.adjustments.ZERO ]		= "0/0",
	[ etpmo.adjustments.NONE ]		= "none",
}

-- -------------------------------
-- vars
-- -------------------------------

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_OptionsList:F_PostLoad()

	UI.ETP_Menu_List.F_PostLoad( self )

	self:InitRecords()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.ETP_Menu_OptionsList:F_OnAfterShowOnScreen()

	UI.ETP_Menu_List.F_OnAfterShowOnScreen( self )

	UI.EffectTreePreviewWnd:LoadSettingsFromFile()	
	UI.EffectTreePreviewWnd:OnOptionsChanged( false )

end


--
function UI.ETP_Menu_OptionsList:InitRecords()

	for optionId = 1, UI:GetTableLength( etp.options ) do

		local record = {}

		record.idx			= optionId
		record.isOverrolled	= false
		record.text			= ""
		record.val			= false

		table.insert( self.records, record )

	end

	self.numRecords = #self.records
	if self.numRecords > 0 then
		self.firstVisibleRecordIdx = 1
	end
	self:UpdateScrollBar()

	self:SetDefault()

end


--
function UI.ETP_Menu_OptionsList:SetDefault()

	for optionName, optionId in pairs( etp.options ) do
		self:SetOptionVal( optionId, self.optionDefaultVals[ optionId ] )
	end

	UI.EffectTreePreviewWnd:OnOptionsChanged( false )

end


--
function UI.ETP_Menu_OptionsList:ToggleOptionVal( optionId )

	if optionId == etp.options.BG_COLOR then

		local val = self:GetOptionVal( optionId )
		local nextVal = math.fmod( val, #self.bgColors ) + 1
		self:SetOptionVal( etp.options.BG_COLOR, nextVal )

	elseif optionId == etp.options.EFFECT_ADJUSTMENT then

		local numAdjustments = UI:GetTableLength( self.adjustments )

		local val = self:GetOptionVal( optionId )
		local nextVal = math.fmod( val, numAdjustments ) + 1

		-- нельзя выставить руками опцию NONE, она выставляется только автоматически, когда эффект был смещен мышью
		if nextVal == self.adjustments.NONE then
			nextVal = math.fmod( nextVal, numAdjustments ) + 1
		end

		self:SetOptionVal( etp.options.EFFECT_ADJUSTMENT, nextVal )

	else

    	local val = not self:GetOptionVal( optionId )
    	self:SetOptionVal( optionId, val )

    	-- TODO: взаимоисключающие опции 

    	if optionId == etp.options.SHOW_EFFECT_ALL_RECTS and val == true then
    		self:SetOptionVal( etp.options.SHOW_EFFECT_SEL_RECT, false )

    	elseif optionId == etp.options.SHOW_EFFECT_SEL_RECT and val == true then
    		self:SetOptionVal( etp.options.SHOW_EFFECT_ALL_RECTS, false )

    	elseif optionId == etp.options.SHOW_LOCATOR_ALL_RECTS and val == true then
    		self:SetOptionVal( etp.options.SHOW_LOCATOR_SEL_RECT, false )

    	elseif optionId == etp.options.SHOW_LOCATOR_SEL_RECT and val == true then
    		self:SetOptionVal( etp.options.SHOW_LOCATOR_ALL_RECTS, false )
    	end

	end

	UI.EffectTreePreviewWnd:OnOptionsChanged( true )

end


--
function UI.ETP_Menu_OptionsList:SetOptionVal( optionId, val )

	local record = self.records[ optionId ]
	record.val = val

	if optionId == etp.options.BG_COLOR then
		record.text = string.format( "%s%08x", self.optionTexts[ optionId ], self.bgColors[ val ] )

	elseif optionId == etp.options.EFFECT_ADJUSTMENT then
		record.text = string.format( "%s%s", self.optionTexts[ optionId ], self.adjustment2Str[ val ] )
		
	else
		local strVal = val and "+ " or "- "
		record.text = strVal..self.optionTexts[ optionId ]	
	end

end


--
function UI.ETP_Menu_OptionsList:UpdateSelRecordOnLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record = self:GetRecordByPos( mouseX, mouseY )

    	if record then
    		self:ToggleOptionVal( record.idx )
    	end

	end

end


-- --------------------------------------------------------
-- UI.ETP_Menu_EffectSelInfo
-- --------------------------------------------------------

UI.ETP_Menu_EffectSelInfo = {}
local etpmi = UI.ETP_Menu_EffectSelInfo

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_EffectSelInfo.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_Menu_EffectSelInfo",
		rect			= Quat( 10, 310, 400-10*2, 20+15*5+5 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0x33, 0x00, 0x00, 0x00 ),
		},
		
		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Selected effect info",
		},

		-- PATH_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+15*0, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "File:",			
		},

		-- PATH
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 60, 20+15*0, 200, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		},

		-- SRC_PATH_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+15*1, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Source:",			
		},

		-- SRC_PATH
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 60, 20+15*1, 200, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		},

		-- PARENT_EFFECT_PATH_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+15*2, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Parent:",			
		},

		-- PARENT_EFFECT_PATH
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 60, 20+15*2, 200, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		},

		-- PARENT_LOCATOR_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+15*3, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Locator:",			
		},

		-- PARENT_LOCATOR		
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 60, 20+15*3, 200, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		}, 

		-- ANIM_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+15*4, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Anim:",			
		},

		-- ANIM
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 60, 20+15*4, 200, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		}, 
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_EffectSelInfo:SetupForSelEffect()

	self:Reset()

	local itemWnd = etp:GetSelItem()
	if not itemWnd then
		return
	end

	self:SetLayerVisible( true, self.layers.PATH_LABEL )
	self:SetLayerVisible( true, self.layers.SRC_PATH_LABEL )
	self:SetLayerVisible( true, self.layers.PARENT_EFFECT_PATH_LABEL )
	self:SetLayerVisible( true, self.layers.PARENT_LOCATOR_LABEL )
	self:SetLayerVisible( true, self.layers.ANIM_LABEL )

	local effect = itemWnd:GetEffect()

	if effect then
		self:SetText( string.gsub( effect:GetFileName(), "/", "\\" ), self.layers.PATH )
		self:SetText( string.gsub( effect:GetSourceFileName(), "/", "\\" ), self.layers.SRC_PATH )
		self:SetText( effect:GetCurAnimation() or "", self.layers.ANIM )
	end

	local parentItemWnd = itemWnd:GetParent()
	if parentItemWnd and UI:IsWndKindOf( parentItemWnd, "ETP_ItemWnd" ) then
		local parentEffect = parentItemWnd:GetEffect()

		if parentEffect then
			self:SetText( string.gsub( parentEffect:GetFileName(), "/", "\\" ), self.layers.PARENT_EFFECT_PATH )
		end
	end	

	if itemWnd.parentLocator ~= "" then
		self:SetText( itemWnd.parentLocator, self.layers.PARENT_LOCATOR )
	end

end


--
function UI.ETP_Menu_EffectSelInfo:Reset()

	self:SetText( "", self.layers.PATH )
	self:SetText( "", self.layers.SRC_PATH )
	self:SetText( "", self.layers.PARENT_EFFECT_PATH )
	self:SetText( "", self.layers.PARENT_LOCATOR )
	self:SetText( "", self.layers.ANIM )

	self:SetLayerVisible( false, self.layers.PATH_LABEL )
	self:SetLayerVisible( false, self.layers.SRC_PATH_LABEL )
	self:SetLayerVisible( false, self.layers.PARENT_EFFECT_PATH_LABEL )
	self:SetLayerVisible( false, self.layers.PARENT_LOCATOR_LABEL )
	self:SetLayerVisible( false, self.layers.ANIM_LABEL )

end


--
function UI.ETP_Menu_EffectSelInfo:OnPlayingAnimationChanged()

	local selAnim = UI.EffectTreePreviewWnd:GetPlayingAnimation() or ""
	self:SetText( selAnim, self.layers.ANIM )

end


-- -------------------------------
-- const
-- -------------------------------

etpmi.layers =
{
    BG							= 0,
    CAPTION						= 1,
    PATH_LABEL					= 2,
    PATH						= 3,
	SRC_PATH_LABEL				= 4,
	SRC_PATH                    = 5,
    PARENT_EFFECT_PATH_LABEL	= 6,
    PARENT_EFFECT_PATH			= 7,
    PARENT_LOCATOR_LABEL		= 8,
    PARENT_LOCATOR				= 9,
    ANIM_LABEL					= 10,
	ANIM						= 11,
}

-- -------------------------------
-- vars
-- -------------------------------

-- -------------------------------
-- work functions
-- -------------------------------


-- --------------------------------------------------------
-- UI.ETP_Menu_FilesList
-- --------------------------------------------------------

UI.ETP_Menu_FilesList = {}
local etpmf = UI.ETP_Menu_FilesList

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_FilesList.def =
{
	className 	= "Wnd",
	prototype	= "ETP_Menu_List",

	props =
	{
		name			= "ETP_Menu_FilesList",
		rect			= Quat( 10, 0, 380, 660 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0xcc, 0x00, 0x00, 0x00 ),
		},

		-- CAPTION
		{
			id			= UI.ETP_Menu_List.layers.CAPTION,
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 2+24+2, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
			rect		= Quat( 0, 2+24+2+20, 380, 660-(2+24+2+20) ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		

		}
	},

	children = { "UI.ETP_Menu_FilesList_FilesModeBtn", "UI.ETP_Menu_FilesList_ResourcesModeBtn", "UI.ETP_Menu_FilesList_LoadAllBtn" }
}

-- -------------------------------
-- internface functions
-- -------------------------------

--
function UI.ETP_Menu_FilesList:Init( bForLocator )

	self.mode = bForLocator and self.modes.LOCATOR or self.modes.MAIN

	self:UpdateList()

end 


--
function UI.ETP_Menu_FilesList:Reset()

	UI.ETP_Menu_List.Reset( self )
	self.filesTree = nil

end

-- -------------------------------
-- const
-- -------------------------------

etpmf.modes =
{
	MAIN		= 1,
	LOCATOR		= 2,
}

etpmf.DEFAULT_PATH = "ui\\graphics"

etpmf.drawInfo =
{
	headTextColor = UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),
}

etpmf.sourceModes =
{
	FILES	= 1,
	RESOURCES	= 2,
}

-- -------------------------------
-- vars
-- -------------------------------

etpmf.mode				= etpmf.modes.MAIN
etpmf.filesTree			= nil
etpmf.savedPath			= ""
etpmf.symbolWidth		= 0
etpmf.sourceMode		= etpmf.sourceModes.FILES
etpmf.savedResourceName	= ""

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_FilesList:F_PostLoad()

	UI.ETP_Menu_List.F_PostLoad( self )

	local hFont = self:GetFont( self.layers.RECORDS )
	local formatRect = UI:Quat( 0, 0, 1024, 768 )

	-- предполагается, что шрифт моноширинный; тоолько в этом случае имеет смысл
	self.symbolWidth= _G.MeasureText(
   		" ",
   		hFont,
   		formatRect,
   		FONT.TF_LEFT + FONT.TF_TOP,
   		formatRect ).z	

	self:UpdateCaption()
	self:UpdateSourceModeBtnsState()	
	self:UpdateLoadAlllBtnVisibility()

end


--
function UI.ETP_Menu_FilesList:UpdateSelRecordOnLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record = self:GetRecordByPos( mouseX, mouseY )
    	if record then

    		self:SetSelRecord( record, true )

			if self.sourceMode == self.sourceModes.FILES then

    			if not record.isFile then

            		if record.isOpen then
            			self:CloseSubTree( record.path )
            		else
            			self:OpenSubTree( record.path )
            		end

    			end

			end

    	end     

	elseif wndThatReceivedInput == UI.ETP_Menu_FilesList_FilesModeBtn:GetUiHandle() then
		self:SetSourceMode( self.sourceModes.FILES )

	elseif wndThatReceivedInput == UI.ETP_Menu_FilesList_ResourcesModeBtn:GetUiHandle() then
		self:SetSourceMode( self.sourceModes.RESOURCES )

	elseif wndThatReceivedInput == UI.ETP_Menu_FilesList_LoadAllBtn:GetUiHandle() then

		UI:LoadResourcesByGroup( "FIRST_LEVEL" )
		self:UpdateList()

	end

end


--
function UI.ETP_Menu_FilesList:SetSelRecord( record, bEnsureSelVisible )

	UI.ETP_Menu_List.SetSelRecord( self, record, bEnsureSelVisible )

	if not record then
		return
	end

	if self.sourceMode == self.sourceModes.FILES then
		self.savedPath = record.path

	elseif self.sourceMode == self.sourceModes.RESOURCES then
		self.savedResourceName = record.rsourceName
	end


	local loadPath = ""


	if self.sourceMode == self.sourceModes.FILES then

    	if record.isFile then
    		loadPath = record.path
    	end	

	elseif self.sourceMode == self.sourceModes.RESOURCES then

		local rcHandle = UI:GetResourceHandleByName( record.rsourceName, UI.RES_EFFECT, true )
		if rcHandle ~= UI.INVALID_RESOURCE_HANDLE then
			local rc = UI:GetResourceByHandle( rcHandle )
			if rc then
				loadPath = rc:GetFileName()
			end
		end

	end

	if loadPath ~= "" then

    	if self.mode == self.modes.MAIN then
    		etp:OnLoadMainEffect( loadPath )
    	else
    		etp:OnLoadLocatorEffect( loadPath, true )
    	end

	end

end


--
function UI.ETP_Menu_FilesList:GetFiles()

	local files = {}

	local filePath = _G.FindFirstFile( "ui/graphics/*.sanim" )
	while filePath ~= "" do		
		table.insert( files, filePath )
		filePath = _G.FindNextFile()
	end

	table.sort( files )

	return files

end  


--
function UI.ETP_Menu_FilesList:CreateFilesTree()

	self.filesTree = nil

	local files = self:GetFiles()

	if not next( files ) then
		self.filesTree = { name = "ui", items = { { name = "graphics" } } }
		return
	end

	for fileIdx = 1, #files do

		local filePath = files[ fileIdx ]
		local curRoot = nil

		for name in string.gmatch( filePath, "([^%\\%/]+)" ) do

			if not curRoot then

				if not self.filesTree then
    				local newItem = { name = name }
    				curRoot = newItem				
    				self.filesTree = curRoot
				else
					curRoot = self.filesTree
				end

			else
    			local bItemFound = false

    			if curRoot.items then
        			for idx, item in pairs( curRoot.items ) do
        				if item.name == name then
        					bItemFound = true
        					curRoot = item
        					break
        				end
        			end
    			end

    			if not bItemFound then
    				local newItem = { name = name }

    				if not curRoot.items then
    					curRoot.items = {}
    				end

    				table.insert( curRoot.items, newItem )
    				curRoot = newItem
    			end
			end

		end
	end

	self:SortTree( self.filesTree )

end 


--
function UI.ETP_Menu_FilesList:SortTree( rootItem )

	local function fSort( item1, item2 )

		local bFolder1 = item1.items and next( item1.items )
		local bFolder2 = item2.items and next( item2.items )

		if bFolder1 and not bFolder2 then
			return true
		end

		if not bFolder1 and bFolder2 then
			return false
		end

		return item1.name < item2.name

	end

	if rootItem and rootItem.items and next( rootItem.items ) then

		table.sort( rootItem.items, fSort )

		for idx, item in pairs( rootItem.items ) do
			self:SortTree( item )
		end

	end

end


--
function UI.ETP_Menu_FilesList:OpenSubTree( path )

	if self.sourceMode ~= self.sourceModes.FILES then
		sys.log( "UI.ETP_Menu_FilesList:OpenSubTree()[ERROR]: not in FILES mode" )
		return false
	end

	if UI:IsStrEmpty( path ) then
		sys.log( "UI.ETP_Menu_FilesList:OpenSubTree()[ERROR]: empty path" )
		return false
	end

	local record = self:GetRecordForPath( path )

	if not record then

		local parentPath = string.gsub( path, "[%\\%/]*[^%\\%/]+$", "" )

		if parentPath == "" then			
			record = self:CreateNewRecord_FILES( path, 1 )
			record.idx = 1
			table.insert( self.records, record )			
		else
			self:OpenSubTree( parentPath )
			record = self:GetRecordForPath( path )
		end

	end

	if not record then
		sys.log( "UI.ETP_Menu_FilesList:OpenSubTree()[ERROR]: cannot find record for path \"%s\"", path )
		return false
	end

	if record.isOpen then
		return true
	end

	self:AddDirectChildRecords( record )
	record.isOpen = true
	self:UpdateRecordText_FILES( record )

	self:ValidateRecords()

	return true

end


--
function UI.ETP_Menu_FilesList:GetRecordForPath( path )

	if self.sourceMode ~= self.sourceModes.FILES then
		sys.log( "UI.ETP_Menu_FilesList:GetRecordForPath()[ERROR]: not in FILES mode" )
		return nil
	end

	for idx, record in pairs( self.records ) do
		if record.path == path then
			return record
		end
	end

	return nil

end


--
function UI.ETP_Menu_FilesList:GetTreeItemForPath( path )

	if self.sourceMode ~= self.sourceModes.FILES then
		sys.log( "UI.ETP_Menu_FilesList:GetTreeItemForPath()[ERROR]: not in FILES mode" )
		return nil
	end

	if not self.filesTree then
		return nil
	end

	local curRoot = nil

	for name in string.gmatch( path, "[^%\\%/]+" ) do

		if curRoot == nil then
			curRoot = self.filesTree
			if name ~= curRoot.name then
				return nil
			end

		else
			curRoot = self:GetDirectTreeChild( curRoot, name )
			if not curRoot then
				return nil
			end
		end

	end

	return curRoot

end


--
function UI.ETP_Menu_FilesList:GetDirectTreeChild( root, childName )

	if not root.items then
		return nil
	end

	for idx, item in pairs( root.items ) do
		if item.name == childName then
			return item
		end
	end

	return nil 

end


--
function UI.ETP_Menu_FilesList:CreateNewRecord_FILES( path, level )

	local record = {}

	record.idx			= -1
	record.path			= path
	record.isOverrolled	= false
	record.isSelected	= false
	record.isFile		= string.find( path, ".sanim$" ) ~= nil
	record.isOpen		= false	
	record.level		= level

	self:UpdateRecordText_FILES( record )

	return record	

end


--
function UI.ETP_Menu_FilesList:Path2RecordLocalized( path )

	return string.match( path, "[^%\\%/]+$" )

end


--
function UI.ETP_Menu_FilesList:UpdateRecordText_FILES( record )

	record.text = self:Path2RecordLocalized( record.path )

	local numSpaces = ( record.level - 1 ) * 2
	local spacesWidth = numSpaces * self.symbolWidth

	if not record.isFile then
		record.headText = record.isOpen and "-" or "+"
		record.headTextX = spacesWidth
		record.textX = record.headTextX + self.symbolWidth
	else
		record.headText = ""
		record.textX = spacesWidth
		record.headTextX = 0
	end

end


--
function UI.ETP_Menu_FilesList:AddDirectChildRecords( parentRecord )

	if self.sourceMode ~= self.sourceModes.FILES then
		sys.log( "UI.ETP_Menu_FilesList:AddDirectChildRecords()[ERROR]: not in FILES mode" )
		return
	end

	local parentItem = self:GetTreeItemForPath( parentRecord.path )
	if not parentItem then
		sys.log( "UI.ETP_Menu_FilesList:AddDirectChildRecords()[ERROR]: cannot find tree item for path \"%s\"", parentRecord.path )
		return
	end

	if not parentItem.items then
		return
	end

	for idx = 1, #parentItem.items do

		local childItem = parentItem.items[ idx ]

		local childPath = string.format( "%s\\%s", parentRecord.path, childItem.name )
		local childRecord = self:CreateNewRecord_FILES( childPath, parentRecord.level + 1 )

		table.insert( self.records, parentRecord.idx + idx, childRecord )

	end

end


--
function UI.ETP_Menu_FilesList:RemoveChildRecords( parentRecord )

	if self.sourceMode ~= self.sourceModes.FILES then
		sys.log( "UI.ETP_Menu_FilesList:RemoveChildRecords()[ERROR]: not in FILES mode" )
		return
	end

	local numRecords = #self.records
	local firstNonChildRecordIdx = numRecords + 1
	local parentPath = string.format( "%s\\", parentRecord.path )

	for idx = parentRecord.idx + 1, numRecords do
		local record = self.records[ idx ]

		if not string.find( record.path, parentPath ) then
			firstNonChildRecordIdx = idx
			break
		end

	end

	local numChildren = firstNonChildRecordIdx - parentRecord.idx - 1
	if numChildren > 0 then

		for idx = parentRecord.idx + 1, firstNonChildRecordIdx - 1 do
			self.records[ idx ] = nil
		end

		for idx = firstNonChildRecordIdx, numRecords do
			local record = self.records[ idx ]
			self.records[ idx - numChildren ] = record
			self.records[ idx ] = nil			
		end

	end

end


--
function UI.ETP_Menu_FilesList:ValidateRecords()

	for idx, record in pairs( self.records ) do
		record.idx = idx
	end

	self.numRecords = #self.records

	if self.firstVisibleRecordIdx < 0 or self.firstVisibleRecordIdx > self.numRecords then
		self.firstVisibleRecordIdx = self.numRecords > 0 and 1 or -1
	end

	self:UpdateScrollBar()

	if self.selRecord then
		if self.records[ self.selRecord.idx ] ~= self.selRecord then
			self:SetSelRecord( nil, false )
		end
	end

	if self.overrolledRecord then
		if self.records[ self.overrolledRecord.idx ] ~= self.overrolledRecord then
			self:SetOverrolledRecord( nil )
		end
	end

end


--
function UI.ETP_Menu_FilesList:CloseSubTree( path )

	if self.sourceMode ~= self.sourceModes.FILES then
		sys.log( "UI.ETP_Menu_FilesList:CloseSubTree()[ERROR]: not in FILES mode" )
		return
	end

	local record = self:GetRecordForPath( path )

	if not record or not record.isOpen then
		return
	end

	self:RemoveChildRecords( record )
	record.isOpen = false
	self:UpdateRecordText_FILES( record )

	self:ValidateRecords()

end


--
function UI.ETP_Menu_FilesList:DrawRecords()

	if self.firstVisibleRecordIdx == -1 then
		return
	end

	local layerRect = UI:QuatCopyStable( self:ToScreen( self:GetLayerRect( self.layers.RECORDS ) ) )
	local y = layerRect.y 

	for recordIdx = self.firstVisibleRecordIdx, self:GetLastVisibleRecordIdx() do

		local record = self.records[ recordIdx ]

		local recordRect = UI:Quat( layerRect.x + record.textX, y, layerRect.z - record.textX, self.drawInfo.recordHeight )
		local recordColor = self:GetRecordColor( record )

         _G.DrawText(
 			record.text,
 			self:GetFont( self.layers.RECORDS ),
 			recordRect,
 			recordColor,
			0,
 			self:GetTextFormatFlags( self.layers.RECORDS ),
 			recordRect
 		) 

		-- отрисовка знаков +/-
		if record.headText ~= "" then

    		local headRect = UI:Quat( layerRect.x + record.headTextX, y, layerRect.z - record.headTextX, self.drawInfo.recordHeight )
    		local headColor = self.drawInfo.headTextColor

             _G.DrawText(
     			record.headText,
     			self:GetFont( self.layers.RECORDS ),
     			headRect,
     			headColor,
				0,
     			self:GetTextFormatFlags( self.layers.RECORDS ),
     			headRect
     		) 

		end

		y = y + self.drawInfo.recordHeight

	end 

end      


--
function UI.ETP_Menu_FilesList:OnLeft()

	if self.sourceMode ~= self.sourceModes.FILES then
		return true
	end

	if not self.selRecord then
		return true
	end

	local nodeToSelect = nil

	if not self.selRecord.isFile then
	
		if self.selRecord.isOpen then
			self:CloseSubTree( self.selRecord.path )
			return true
		end

	end

	local parentRecord = nil

	for prevRecordIdx = self.selRecord.idx, 1, -1 do
		local prevRecord = self.records[ prevRecordIdx ]
		if not prevRecord.isFile and prevRecord.level < self.selRecord.level then
			parentRecord = prevRecord
			break
		end
	end

	if parentRecord and parentRecord.isOpen then
		self:SetSelRecord( parentRecord, true )
	end

	return true

end


--
function UI.ETP_Menu_FilesList:OnRight()

	if self.sourceMode ~= self.sourceModes.FILES then
		return true
	end

	if not self.selRecord then
		return true
	end

	if not self.selRecord.isFile then
	
		if not self.selRecord.isOpen then
			self:OpenSubTree( self.selRecord.path )
		end

	end

	return true

end


--
function UI.ETP_Menu_FilesList:F_OnAfterShowOnScreen()

	UI.ETP_Menu_List.F_OnAfterShowOnScreen( self )

	self:CaptuerFocus()

end


--
function UI.ETP_Menu_FilesList:SetSourceMode( sourceMode )

	if self.sourceMode == sourceMode then
		return
	end

	self.sourceMode = sourceMode

	self.savedPath = ""
	self.savedResourceName = ""

	self:UpdateList()
	self:UpdateCaption()
	self:UpdateSourceModeBtnsState()
	self:UpdateLoadAlllBtnVisibility()

end


--
function UI.ETP_Menu_FilesList:UpdateList()

	self:Reset()

	if self.sourceMode == self.sourceModes.FILES then

    	self:CreateFilesTree()

    	if not UI:IsStrEmpty( self.savedPath ) then

    		if self:OpenSubTree( self.savedPath ) then

    			local record = self:GetRecordForPath( self.savedPath )
    			if record then
    				UI.ETP_Menu_List.SetSelRecord( self, record, true )
    			else
    				sys.log( "UI.ETP_Menu_FilesList:Init()[ERROR]: cannot find record for path \"%s\"", self.savedPath )
    			end

    		else
    			self:OpenSubTree( self.DEFAULT_PATH )
    		end

    	else
    		self:OpenSubTree( self.DEFAULT_PATH )
    	end


	elseif self.sourceMode == self.sourceModes.RESOURCES then

		local allEffectNames = _G.UI_GetResourceNames( UI.RES_EFFECT )

		local effectNames = {}

		-- не показываются ресурсы, созданные окном превью
		for idx, effectName in pairs( allEffectNames ) do
			if not string.match( effectName, "ETP%d+_.+" ) then
				table.insert( effectNames, { name = effectName, lowName = _G.Utf8CaseFold_Transform( effectName ) } )
			end
		end
		
		local function fnSort( nameInfo1, nameInfo2 )
			return nameInfo1.lowName < nameInfo2.lowName
		end

		table.sort( effectNames, fnSort )
		
		for idx = 1, #effectNames do

			local record = self:CreateNewRecord_RESOURCES( effectNames[ idx ].name )
			record.idx = 1
			table.insert( self.records, record )			

		end

		self:ValidateRecords()

		if self.savedResourceName ~= "" then
			local record = self:GetRecordForResourceName( self.savedResourceName )
			if record then
	    		self:SetSelRecord( record, true )
			end
		end

	end

end


--
function UI.ETP_Menu_FilesList:UpdateCaption()

	local text = ""

	if self.sourceMode == self.sourceModes.FILES then
		text = "Files"

	elseif self.sourceMode == self.sourceModes.RESOURCES then
		text = "Resources"
	end

	self:SetText( text, self.layers.CAPTION )

end


--
function UI.ETP_Menu_FilesList:UpdateSourceModeBtnsState()

	UI.ETP_Menu_FilesList_FilesModeBtn:Check( self.sourceMode == self.sourceModes.FILES )
	UI.ETP_Menu_FilesList_ResourcesModeBtn:Check( self.sourceMode == self.sourceModes.RESOURCES )

end


--
function UI.ETP_Menu_FilesList:CreateNewRecord_RESOURCES( rsourceName )

	local record = {}

	record.idx			= -1
	record.rsourceName	= rsourceName
	record.isOverrolled	= false
	record.isSelected	= false
	record.text			= self:Path2RecordLocalized( record.rsourceName )
	record.headText		= ""
	record.textX		= 0
	record.headTextX	= 0

	return record	

end


--
function UI.ETP_Menu_FilesList:GetRecordForResourceName( rsourceName )

	if self.sourceMode ~= self.sourceModes.RESOURCES then
		sys.log( "UI.ETP_Menu_FilesList:GetRecordForResourceName()[ERROR]: not in FILES mode" )
		return nil
	end

	for idx, record in pairs( self.records ) do
		if record.rsourceName == rsourceName then
			return record
		end
	end

	return nil

end


--
function UI.ETP_Menu_FilesList:UpdateLoadAlllBtnVisibility()

	local bVisible = self.sourceMode == self.sourceModes.RESOURCES

	if bVisible then
		self:AddChild( UI.ETP_Menu_FilesList_LoadAllBtn )
	else
		self:RemoveChild( UI.ETP_Menu_FilesList_LoadAllBtn )
	end

end


-- --------------------------------------------------------------------------
-- UI.ETP_Menu_FilesList_FilesModeBtn, UI.ETP_Menu_FilesList_ResourcesModeBtn
-- --------------------------------------------------------------------------

--
UI.ETP_Menu_FilesList_FilesModeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_FilesList_FilesModeBtn",
			rect	= Quat( 2, 2, 80, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id			= 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	= FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text		= "Files",
    			},
    		},
		}
	}
}

--
UI.ETP_Menu_FilesList_ResourcesModeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_FilesList_ResourcesModeBtn",
			rect	= Quat( 2+80+2, 2, 80, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id			= 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	= FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text		= "Resources",
    			},
    		},
		}
	}
}


-- --------------------------------------------------------------------------
-- UI.ETP_Menu_FilesList_LoadAllBtn
-- --------------------------------------------------------------------------

UI.ETP_Menu_FilesList_LoadAllBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_FilesList_LoadAllBtn",
			rect	= Quat( 380-2-80, 2, 80, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id			= 2,

    				layerType	= UI.LAYER_TEXT,
					formatFlags	= FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text		= "Load all"
    			},
    		},
		}
	}
}


-- --------------------------------------------------------
-- UI.ETP_Menu_TexList
-- --------------------------------------------------------

UI.ETP_Menu_TexList = {}
local etpmt = UI.ETP_Menu_TexList

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_TexList.def =
{
	className 	= "Wnd",
	prototype	= "ETP_Menu_List",

	props =
	{
		name			= "ETP_Menu_TexList",
		rect			= Quat( 10, 0, 380, 660 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0xcc, 0x00, 0x00, 0x00 ),
		},

		-- CAPTION
		{
			id			= UI.ETP_Menu_List.layers.CAPTION,
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Textures",			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
			rect		= Quat( 0, 20, 380, 660-20 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		

		}
	}
}

-- -------------------------------
-- internface functions
-- -------------------------------

--
function UI.ETP_Menu_TexList:Init( bForSprite )

	self:Reset()

	self.mode = bForSprite and self.modes.SPRITE or self.modes.MAIN

	local texNames = _G.UI_GetResourceNames( UI.RES_TEXTURE )

	local fnSort = function( name1, name2 )
		return string.lower( name1 ) < string.lower( name2 )
	end

	table.sort( texNames, fnSort )

	for idx, texName in pairs( texNames ) do

		local record = {}

		record.idx			= idx
		record.isOverrolled	= false
		record.text			= texName

		table.insert( self.records, record )

	end

	self.numRecords = #self.records
	if self.numRecords > 0 then
		self.firstVisibleRecordIdx = 1
	end

	self:UpdateScrollBar()

end

-- -------------------------------
-- const
-- -------------------------------

UI.ETP_Menu_TexList.modes =
{
	MAIN		= 1,
	SPRITE		= 2,
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ETP_Menu_TexList.clickedRecord	= nil
UI.ETP_Menu_TexList.numClicks		= 0
UI.ETP_Menu_TexList.mode			= UI.ETP_Menu_TexList.modes.MAIN

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_TexList:Reset()

	UI.ETP_Menu_List.Reset( self )

	self.clickedRecord = nil
	self.numClicks = 0

end


--
function UI.ETP_Menu_TexList:UpdateSelRecordOnLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record = self:GetRecordByPos( mouseX, mouseY )
    	if record then

			self:SetSelRecord( record, true )

			if record ~= self.clickedRecord then
				self.clickedRecord = record
				self.numClicks = 1
			else
				self.numClicks = self.numClicks + 1
			end

		else
			self.clickedRecord = nil
			self.numClicks = 0
    	end

	end

end


--
function UI.ETP_Menu_TexList:SetSelRecord( record, bEnsureSelVisible )

	UI.ETP_Menu_List.SetSelRecord( self, record, bEnsureSelVisible )

	if record then
		self:PreviewTexture( record )
	end

end           


--
function UI.ETP_Menu_TexList:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.mode == self.modes.MAIN then
		return false
	end

	if wndThatReceivedInput == self:GetUiHandle() then

    	local record = self:GetRecordByPos( mouseX, mouseY )

		-- такие ухищрения необходимы чтобы даблклик не срабатывал, если составляющие его клики пришлись на разные записи
    	if record and record == self.clickedRecord and self.numClicks >= 2 then	

			self.clickedRecord = nil
			self.numClicks = 0

			self:LoadTexture( record )

    	end

	end

	return true

end


--
function UI.ETP_Menu_TexList:PreviewTexture( record )

	etp:OnPreviewTexture( record.text )

end


--
function UI.ETP_Menu_TexList:LoadTexture( record )

	etp:OnLoadTexture( record.text )

end


--
function UI.ETP_Menu_TexList:OnEnter()

	if self.mode == self.modes.MAIN then
		return false
	end

	if self.selRecord then
		self:LoadTexture( self.selRecord )
	end

	return true

end


--
function UI.ETP_Menu_TexList:F_OnAfterShowOnScreen()

	UI.ETP_Menu_List.F_OnAfterShowOnScreen( self )

	self:CaptuerFocus()

end

-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorsList
-- --------------------------------------------------------

UI.ETP_Menu_LocatorsList= {}
local etpml = UI.ETP_Menu_LocatorsList

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_LocatorsList.def =
{
	className 	= "Wnd",
	prototype	= "ETP_Menu_List",

	props =
	{
		name			= "ETP_Menu_LocatorsList",
		rect			= Quat( 10, 450, 170, 205 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- CAPTION
		{
			id			= UI.ETP_Menu_List.layers.CAPTION,
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Locators",			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
			rect		= Quat( 0, 20, 170, 205-20 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		

		}
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_LocatorsList:SetupForSelEffect()

	self:Reset()

	local effect = UI.EffectTreePreviewWnd:GetSelEffect()
	if not effect then
		return
	end

	for objIdx = 0, effect:GetNumObjects() - 1 do
		
		local record = {}

		record.idx			= objIdx + 1
    	record.isSelected	= false
		record.isOverrolled	= false
		record.locatorName	= effect:GetObjNameById( objIdx )
		record.text			= record.locatorName

		table.insert( self.records, record )

	end

	self.numRecords = #self.records
	if self.numRecords > 0 then
		self.firstVisibleRecordIdx = 1
	end
	self:UpdateScrollBar()

end


--
function UI.ETP_Menu_LocatorsList:GetSelLocator()

	return self.selRecord and self.selRecord.locatorName or ""

end


--
function UI.ETP_Menu_LocatorsList:SelectLocator( locatorName )

	self:SetSelRecord( self:GetRecordByLocatorName( locatorName ), true, false )

end


-- -------------------------------
-- cont
-- -------------------------------

-- -------------------------------
-- vars
-- -------------------------------

-- -------------------------------
-- work functions
-- -------------------------------   

--
function UI.ETP_Menu_LocatorsList:SetSelRecord( record, bEnsureSelVisible, bNotNotify )

	if bNotNotify == nil then
		bNotNotify = false
	end

	if self.selRecord == record then
		return
	end

	UI.ETP_Menu_List.SetSelRecord( self, record, bEnsureSelVisible )

	if not bNotNotify then
		UI.EffectTreePreviewWnd:OnSelLocatorChanged()
	end

end


--
function UI.ETP_Menu_LocatorsList:GetRecordByLocatorName( locatorName )

	for idx, record in pairs( self.records ) do
		if record.locatorName == locatorName then
			return record
		end
	end

	return nil

end


-- --------------------------------------------------------
-- UI.ETP_Menu_SpritesList
-- --------------------------------------------------------

UI.ETP_Menu_SpritesList = {}
local etpms = UI.ETP_Menu_SpritesList

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_SpritesList.def =
{
	className 	= "Wnd",
	prototype	= "ETP_Menu_List",

	props =
	{
		name			= "ETP_Menu_SpritesList",
		rect			= Quat( 10, 450, 170, 205 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- CAPTION
		{
			id			= UI.ETP_Menu_List.layers.CAPTION,
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Sprites",			
		},		

		-- RECORDS
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
			rect		= Quat( 0, 20, 170, 205-20 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		

		}
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_SpritesList:SetupForSelEffect()

	self:Reset()

	local effect = UI.EffectTreePreviewWnd:GetSelEffect()
	if not effect then
		return
	end

	for spriteIdx = 0, effect:GetNumSprites() - 1 do
		
		local record = {}

		record.idx			= spriteIdx + 1
    	record.isSelected	= false
		record.isOverrolled	= false
		record.spriteName	= effect:GetSpriteNameById( spriteIdx )
		record.text			= record.spriteName

		table.insert( self.records, record )

	end

	self.numRecords = #self.records
	if self.numRecords > 0 then
		self.firstVisibleRecordIdx = 1
	end
	self:UpdateScrollBar()

end


--
function UI.ETP_Menu_SpritesList:GetSelSprite()

	return self.selRecord and self.selRecord.spriteName

end


-- -------------------------------
-- cont
-- -------------------------------

-- -------------------------------
-- vars
-- -------------------------------

-- -------------------------------
-- work functions
-- -------------------------------   

--
function UI.ETP_Menu_SpritesList:SetSelRecord( record, bEnsureSelVisible, bNotNotify )

	if bNotNotify == nil then
		bNotNotify = false
	end

	if self.selRecord == record then
		return
	end

	UI.ETP_Menu_List.SetSelRecord( self, record, bEnsureSelVisible )

	if not bNotNotify then
		UI.EffectTreePreviewWnd:OnSelSpriteChanged()
	end

end


--
function UI.ETP_Menu_SpritesList:GetRecordBySpriteName( spriteName )

	for idx, record in pairs( self.records ) do
		if record.spriteName == spriteName then
			return record
		end
	end

	return nil

end


-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorSelInfo
-- --------------------------------------------------------

UI.ETP_Menu_LocatorSelInfo = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_LocatorSelInfo.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_Menu_LocatorSelInfo",
		rect			= Quat( 190, 450, 200, 205 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0x33, 0x00, 0x00, 0x00 ),
		},
		
		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Selected locator info",
		},

		-- EFFECT_NAME_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20, 50, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Effect:",			
		},

		-- EFFECT_NAME
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 50, 20, 100, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		}, 

		-- TEXT_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+50, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Text:",			
		},

		-- FONT_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+50+15*1, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Font:",			
		},

		-- HORZ_ALIGN_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+50+15*2, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Horz align:",			
		},

		-- VERT_ALIGN_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+50+15*3, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Vert align:",			
		},

		-- TEXT_COLOR_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+50+15*4, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Color:",			
		},

		-- TEXT_BACK_COLOR_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+50+15*5, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Back color:",			
		},

		-- TEXT_BLEND_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+50+15*6, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Blend mode:",			
		},
	},

	children =
	{
		"UI.ETP_Menu_LocatorSeInfo_LoadBtn",
		"UI.ETP_Menu_LocatoSelInfo_TextEdit",
		"UI.ETP_Menu_LocatorSelInfo_FontBtn",
		"UI.ETP_Menu_LocatorSelInfo_HAlmBtn" ,
		"UI.ETP_Menu_LocatorSelInfo_VAlmBtn",
		"UI.ETP_Menu_LocatoSelInfo_ColorEdit",
		"UI.ETP_Menu_LocatoSelInfo_BackColorEdit",
		"UI.ETP_Menu_LocatorSelInfo_BlendBtn",
		"UI.ETP_Menu_LocatorSelInfo_ResetBtn",
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_LocatorSelInfo:Reset()

	self:SetText( "", self.layers.EFFECT_NAME )

	self:RemoveChild( UI.ETP_Menu_LocatorSeInfo_LoadBtn ) 
	self:RemoveChild( UI.ETP_Menu_LocatorSelInfo_FontBtn )
	self:RemoveChild( UI.ETP_Menu_LocatorSelInfo_HAlmBtn )
	self:RemoveChild( UI.ETP_Menu_LocatorSelInfo_VAlmBtn )
	self:RemoveChild( UI.ETP_Menu_LocatorSelInfo_BlendBtn )
	self:RemoveChild( UI.ETP_Menu_LocatorSelInfo_ResetBtn )

	UI.ETP_Menu_LocatoSelInfo_TextEdit:SetEditText( "" )
	UI.ETP_Menu_LocatoSelInfo_TextEdit:UnlinkFromParent()

	UI.ETP_Menu_LocatoSelInfo_ColorEdit:SetEditText( "" )
	UI.ETP_Menu_LocatoSelInfo_ColorEdit:UnlinkFromParent()		

	UI.ETP_Menu_LocatoSelInfo_BackColorEdit:SetEditText( "" )
	UI.ETP_Menu_LocatoSelInfo_BackColorEdit:UnlinkFromParent()		

	self:SetLayerVisible( false, self.layers.EFFECT_NAME_LABEL )
	self:SetLayerVisible( false, self.layers.TEXT_LABEL )
	self:SetLayerVisible( false, self.layers.FONT_LABEL )
	self:SetLayerVisible( false, self.layers.HORZ_ALIGN_LABEL )
	self:SetLayerVisible( false, self.layers.VERT_ALIGN_LABEL )
	self:SetLayerVisible( false, self.layers.TEXT_COLOR_LABEL )
	self:SetLayerVisible( false, self.layers.TEXT_BACK_COLOR_LABEL )
	self:SetLayerVisible( false, self.layers.TEXT_BLEND_LABEL )

end


--
function UI.ETP_Menu_LocatorSelInfo:OnSelLocatorChanged()

	self:Reset()

	local selItem = etp:GetSelItem()
	local effect = selItem and selItem:GetEffect()
	local locatorName = etp:GetSelLocator()

	if not effect or not locatorName or locatorName == "" then
		return
	end

	self:SetLayerVisible( true, self.layers.EFFECT_NAME_LABEL )
	self:SetLayerVisible( true, self.layers.TEXT_LABEL )
	self:SetLayerVisible( true, self.layers.FONT_LABEL )
	self:SetLayerVisible( true, self.layers.HORZ_ALIGN_LABEL )
	self:SetLayerVisible( true, self.layers.VERT_ALIGN_LABEL )
	self:SetLayerVisible( true, self.layers.TEXT_COLOR_LABEL )
	self:SetLayerVisible( true, self.layers.TEXT_BACK_COLOR_LABEL )
	self:SetLayerVisible( true, self.layers.TEXT_BLEND_LABEL )

	self:AddChild( UI.ETP_Menu_LocatorSeInfo_LoadBtn )
	self:AddChild( UI.ETP_Menu_LocatoSelInfo_TextEdit )
	self:AddChild( UI.ETP_Menu_LocatoSelInfo_ColorEdit )
	self:AddChild( UI.ETP_Menu_LocatoSelInfo_BackColorEdit )
	self:AddChild( UI.ETP_Menu_LocatorSelInfo_FontBtn )
	self:AddChild( UI.ETP_Menu_LocatorSelInfo_HAlmBtn )
	self:AddChild( UI.ETP_Menu_LocatorSelInfo_VAlmBtn )
	self:AddChild( UI.ETP_Menu_LocatorSelInfo_BlendBtn )
	self:AddChild( UI.ETP_Menu_LocatorSelInfo_ResetBtn )

	local effectName = selItem:GetLocatorInfo( locatorName ).relatedEffectName
	effectName = L_EffectName2Displayable( effectName, false )

	self:SetText( effectName, self.layers.EFFECT_NAME )

	local locatorInfo = selItem:GetLocatorInfo( locatorName )
	self:UpdateControls( locatorInfo )

end


-- -------------------------------
-- const
-- -------------------------------

UI.ETP_Menu_LocatorSelInfo.layers =
{
	BG						= 0,
	CAPTION					= 1,
	EFFECT_NAME_LABEL		= 2,
	EFFECT_NAME				= 3,
    TEXT_LABEL				= 4,
	FONT_LABEL				= 5,
	HORZ_ALIGN_LABEL		= 6,
	VERT_ALIGN_LABEL		= 7,
	TEXT_COLOR_LABEL		= 8,
	TEXT_BACK_COLOR_LABEL	= 9,
	TEXT_BLEND_LABEL		= 10,
}

UI.ETP_Menu_LocatorSelInfo.fonts = { "Tiny","VerySmall",  "Medium", "Large", "Tiny_outl", "VerySmall_outl", "Medium_outl", "Large_outl", "Tiny_outl2", "VerySmall_outl2",  "Medium_outl2", "Large_outl2",  }

UI.ETP_Menu_LocatorSelInfo.align2Str =
{
    [ UI.EffectObjAlignment.ALIGNMENT_LEFT ]	= "left",
    [ UI.EffectObjAlignment.ALIGNMENT_HCENTER ] = "center",
    [ UI.EffectObjAlignment.ALIGNMENT_RIGHT ]	= "right",
    [ UI.EffectObjAlignment.ALIGNMENT_HFULL ]	= "full",
    [ UI.EffectObjAlignment.ALIGNMENT_TOP ] 	= "top",
    [ UI.EffectObjAlignment.ALIGNMENT_VCENTER ]	= "middle",
    [ UI.EffectObjAlignment.ALIGNMENT_BOTTOM ]	= "bottom",
}

UI.ETP_Menu_LocatorSelInfo.blendModes =
{
	{ name	= "Alpha",	val = UI.BM_ALPHA },
	{ name	= "Color",	val = UI.BM_COLOR },
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_LocatorSelInfo:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )

end


--
function UI.ETP_Menu_LocatorSelInfo:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return
	end

	if wndThatReceivedInput == UI.ETP_Menu_LocatorSeInfo_LoadBtn:GetUiHandle() then
		UI.ETP_MenuWnd:ShowFilesList( true )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_FontBtn:GetUiHandle() then
		self:ToggleFont( true )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_HAlmBtn:GetUiHandle() then
		self:ToggleHAlignment( true )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_VAlmBtn:GetUiHandle() then
		self:ToggleVAlignment( true )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_BlendBtn:GetUiHandle() then
		self:ToggleBlend( true )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_ResetBtn:GetUiHandle() then
		self:ResetUserParams()
		return true

	end

	return false

end 


--
function UI.ETP_Menu_LocatorSelInfo:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return
	end

	if wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_FontBtn:GetUiHandle() then
		self:ToggleFont( false )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_HAlmBtn:GetUiHandle() then
		self:ToggleHAlignment( false )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_VAlmBtn:GetUiHandle() then
		self:ToggleVAlignment( false )
		return true

	elseif wndThatReceivedInput == UI.ETP_Menu_LocatorSelInfo_BlendBtn:GetUiHandle() then
		self:ToggleBlend( false )
		return true

	end

	return false

end      


--
function UI.ETP_Menu_LocatorSelInfo:F_OnEventEditChange( hSender, eventSrc )

	if eventSrc ~= UI.EVENT_SRC_KEYBOARD then
		return
	end

	if hSender == UI.ETP_Menu_LocatoSelInfo_TextEdit:GetUiHandle() then
		UI.EffectTreePreviewWnd:OnLocatorTextChanged( UI.ETP_Menu_LocatoSelInfo_TextEdit:GetEditText() )


	elseif hSender == UI.ETP_Menu_LocatoSelInfo_ColorEdit:GetUiHandle() then

		local strColor = "0x"..UI.ETP_Menu_LocatoSelInfo_ColorEdit:GetEditText()
		local color = tonumber( strColor ) or nil

		UI.EffectTreePreviewWnd:OnLocatorColorChanged( color )

		if not color then
			local selItem = etp:GetSelItem()
			local locatorName = etp:GetSelLocator()
			local locatorInfo = selItem:GetLocatorInfo( locatorName )
			UI.ETP_Menu_LocatoSelInfo_ColorEdit:SetEditText( locatorInfo and string.format( "%08x", locatorInfo.textColor ) or "" )
		end

	elseif hSender == UI.ETP_Menu_LocatoSelInfo_BackColorEdit:GetUiHandle() then

		local strColor = "0x"..UI.ETP_Menu_LocatoSelInfo_BackColorEdit:GetEditText()
		local color = tonumber( strColor ) or nil

		UI.EffectTreePreviewWnd:OnLocatorBackColorChanged( color )

		if not color then
			local selItem = etp:GetSelItem()
			local locatorName = etp:GetSelLocator()
			local locatorInfo = selItem:GetLocatorInfo( locatorName )
			UI.ETP_Menu_LocatoSelInfo_BackColorEdit:SetEditText( locatorInfo and string.format( "%08x", locatorInfo.textBackColor ) or "" )
		end

	end                                              

end


--
function UI.ETP_Menu_LocatorSelInfo:ToggleFont( bForward )

	local curFont = UI.ETP_Menu_LocatorSelInfo_FontBtn:GetBtnText()
	local fontIdx = UI:Val2Key( self.fonts, curFont )

	if fontIdx ~= "" then
		local numFonts = #self.fonts
		local nextIdx = fontIdx + ( bForward and 1 or -1 )
		local nextIdx = math.fmod( nextIdx - 1 + numFonts, numFonts ) + 1
		local nextFontName = self.fonts[ nextIdx ]

		UI.ETP_Menu_LocatorSelInfo_FontBtn:SetBtnText( nextFontName )

		UI.EffectTreePreviewWnd:OnLocatorFontChanged( nextFontName )
	end

end


--
function UI.ETP_Menu_LocatorSelInfo:ToggleBlend( bForward )

	local blendModeName = UI.ETP_Menu_LocatorSelInfo_BlendBtn:GetBtnText()

	local blendModeIdx	= -1
	local blendMode		= UI.BM_ALPHA

	for idx, info in pairs( self.blendModes ) do
		if info.name == blendModeName then
			blendModeIdx = idx
			blendMode = info.val
			break
		end 
	end

	local nextIdx = blendModeIdx + ( bForward and 1 or -1 )
	local numBlendModes = #self.blendModes
	nextIdx = math.fmod( nextIdx - 1 + numBlendModes, numBlendModes ) + 1
	local nextBlendModeName = self.blendModes[ nextIdx ].name
	local nextBlendMode = self.blendModes[ nextIdx ].val

	UI.ETP_Menu_LocatorSelInfo_BlendBtn:SetBtnText( nextBlendModeName )

	UI.EffectTreePreviewWnd:OnLocatorBlendChanged( nextBlendMode )

end


--
function UI.ETP_Menu_LocatorSelInfo:ToggleHAlignment( bForward )

	local curAlmName = UI.ETP_Menu_LocatorSelInfo_HAlmBtn:GetBtnText()
	local curAlm = self:Str2Alignment( curAlmName )
	local almIdx = UI:Val2Key( l_horzAlignments, curAlm )

	if almIdx ~= "" then
		local nextIdx = almIdx + ( bForward and 1 or -1 )
		local numAlignments = #l_horzAlignments
		nextIdx = math.fmod( nextIdx - 1 + numAlignments, numAlignments ) + 1
		local nextAlm = l_horzAlignments[ nextIdx ]
		local nextAlmName = self.align2Str[ nextAlm ]

		UI.ETP_Menu_LocatorSelInfo_HAlmBtn:SetBtnText( nextAlmName )

		UI.EffectTreePreviewWnd:OnLocatorHAlignmentChanged( nextAlm )
	end	

end


--
function UI.ETP_Menu_LocatorSelInfo:ToggleVAlignment( bForward )

	local curAlmName = UI.ETP_Menu_LocatorSelInfo_VAlmBtn:GetBtnText()
	local curAlm = self:Str2Alignment( curAlmName )
	local almIdx = UI:Val2Key( l_vertAlignments, curAlm )

	if almIdx ~= "" then
		local nextIdx = almIdx + ( bForward and 1 or -1 )
		local numAlignments = #l_vertAlignments
		nextIdx = math.fmod( nextIdx - 1 + numAlignments, numAlignments ) + 1
		local nextAlm = l_vertAlignments[ nextIdx ]
		local nextAlmName = self.align2Str[ nextAlm ]

		UI.ETP_Menu_LocatorSelInfo_VAlmBtn:SetBtnText( nextAlmName )

		UI.EffectTreePreviewWnd:OnLocatorVAlignmentChanged( nextAlm )
	end

end


--
function UI.ETP_Menu_LocatorSelInfo:HAlignment2Str( alignment )

	for idx = 1, #l_horzAlignments do
		local alm = l_horzAlignments[ idx ]

		if bit.band( alignment, alm ) == alm then
			return self.align2Str[ alm ]
		end
	end

	return ""

end


--
function UI.ETP_Menu_LocatorSelInfo:VAlignment2Str( alignment )

	for idx = 1, #l_vertAlignments do
		local alm = l_vertAlignments[ idx ]

		if bit.band( alignment, alm ) == alm then
			return self.align2Str[ alm ]
		end
	end

	return ""

end 


--
function UI.ETP_Menu_LocatorSelInfo:Str2Alignment( str )

	return UI:Val2Key( self.align2Str, str )

end


--
function UI.ETP_Menu_LocatorSelInfo:Blend2Str( blendMode )

	for idx, info in pairs( self.blendModes ) do
		if info.val == blendMode then
			return info.name
		end
	end

	return ""

end


--
function UI.ETP_Menu_LocatorSelInfo:ResetUserParams()

	etp:OnResetSelLocatorUserParams()

	local selItem = etp:GetSelItem()
	local locatorName = etp:GetSelLocator()
	local locatorInfo = selItem and selItem:GetLocatorInfo( locatorName )

	self:UpdateControls( locatorInfo )

end


--
function UI.ETP_Menu_LocatorSelInfo:UpdateControls( locatorInfo )

	UI.ETP_Menu_LocatoSelInfo_TextEdit:SetEditText( locatorInfo and locatorInfo.text or "" )
	UI.ETP_Menu_LocatorSelInfo_FontBtn:SetBtnText( locatorInfo and locatorInfo.fontName or "" )
	UI.ETP_Menu_LocatorSelInfo_HAlmBtn:SetBtnText( self:HAlignment2Str( locatorInfo.alignment ) )
	UI.ETP_Menu_LocatorSelInfo_VAlmBtn:SetBtnText( self:VAlignment2Str( locatorInfo.alignment ) )
	UI.ETP_Menu_LocatoSelInfo_ColorEdit:SetEditText( locatorInfo and string.format( "%08x", locatorInfo.textColor ) or "" )
	UI.ETP_Menu_LocatoSelInfo_BackColorEdit:SetEditText( locatorInfo and string.format( "%08x", locatorInfo.textBackColor ) or "" )
	UI.ETP_Menu_LocatorSelInfo_BlendBtn:SetBtnText( self:Blend2Str( locatorInfo.blendMode ) )

end


-- -------------------------------------------------------------
-- UI.ETP_Menu_LocatorSelInfo_ResetBtn
-- -------------------------------------------------------------

UI.ETP_Menu_LocatorSelInfo_ResetBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_LocatorSelInfo_ResetBtn",
			rect	= Quat( -2, 205-24+2, 54, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text = "Reset"
    			},
    		},
		}
	}
}


-- -------------------------------------------------------------
-- UI.ETP_Menu_EditWnd
-- -------------------------------------------------------------

UI.ETP_Menu_EditWnd = {}
local ew = UI.ETP_Menu_EditWnd

-- --------------------------
-- const
-- --------------------------

ew.layers =
{
	BG			= 0,
	SEL			= 1,
	TEXT		= 2,
	CURSOR		= 3,
}

-- --------------------------
-- window definition
-- --------------------------

--
UI.ETP_Menu_EditWnd.def =
{   	
 	className	= "EditWnd",

 	props =
 	{
 		name					= "ETP_Menu_EditWnd",
 		style					= UI.WS_ACTIVATE_ON_LMOUSE_CLICK + UI.WS_UPDATE_IF_ANIMATED,
		rect					= Quat( 0, 0, 200, 15 ),
 		activationOrder			= 0,
		isPrototype				= true,

 		-- EditWnd props
         editStyle				= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL,
         symbolsLimit			= -1,
         textLayer				= ew.layers.TEXT,
         selectionLayer			= ew.layers.SEL,
         cursorLayer			= ew.layers.CURSOR,
         textLayerEdges			= Quat( 2, 2, 2, 2 ),
         cursorSpaceTextTop		= 1,
         cursorSpaceTextBottom	= 1,
         selSpaceTextTop		= 1,
         selSpaceTextBottom		= 1,
 	},

 	layers =
 	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0xff, 0x00, 0x00, 0x00 ),
		},

 		-- SEL
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			color		= UI:ARGB( 0xff, 0x55, 0x55, 0x55 ),
 			texture		= "white",
 		},

 		-- TEXT
 		{
 			layerType	= UI.LAYER_TEXT,
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),
    		formatFlags	= FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS,
 			formatInfoSz= { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},
 		},			

 		-- CURSOR
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			rect		= Quat( 0, 0, 2, 0 ),
 			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),
 			texture		= "white",
 		},
 	}
}

-- --------------------------
-- animations
-- -------------------------- 

UI.ETP_Menu_EditWnd.animations =
{
	CursorTwinkle =
	{
		length = 0.8,
		loop = true,

		onStop = function( self, w, animation )
			w:SetLayerVisible( true, ew.layers.CURSOR )
		end,

		keys =
		{
			{
				time	= 0,

				action	= function( self, w, animation )
					w:SetLayerVisible( true, ew.layers.CURSOR )
				end,
			},

			{
				time	= 0.5,

				action	= function( self, w, animation )
					w:SetLayerVisible( false, ew.layers.CURSOR )
				end,
			},
		}
	},
}


-- -------------------------------------------------------------
-- UI.ETP_Menu_LocatoSelInfo_TextEdit
-- -------------------------------------------------------------

UI.ETP_Menu_LocatoSelInfo_TextEdit =
{
	def =
	{   	
 		className	= "EditWnd",
		prototype	= "ETP_Menu_EditWnd",
	

		props =
		{
			name	= "ETP_Menu_LocatoSelInfo_TextEdit",
			rect	= Quat( 35, 20+50+2, 155, 15 ),
		}
	}
}

-- -------------------------------------------------------------
-- UI.ETP_Menu_LocatoSelInfo_ColorEdit
-- -------------------------------------------------------------

UI.ETP_Menu_LocatoSelInfo_ColorEdit =
{
	def =
	{   	
 		className	= "EditWnd",
		prototype	= "ETP_Menu_EditWnd",
	

		props =
		{
			name	= "ETP_Menu_LocatoSelInfo_ColorEdit",
			rect	= Quat( 80, 20+50+15*4+1, 110, 15-2*1 ),
		}
	}
}

-- -------------------------------------------------------------
-- UI.ETP_Menu_LocatoSelInfo_BackColorEdit
-- -------------------------------------------------------------

UI.ETP_Menu_LocatoSelInfo_BackColorEdit =
{
	def =
	{   	
 		className	= "EditWnd",
		prototype	= "ETP_Menu_EditWnd",
	

		props =
		{
			name	= "ETP_Menu_LocatoSelInfo_BackColorEdit",
			rect	= Quat( 80, 20+50+15*5+1, 110, 15-2*1 ),
		}
	}
}  

-- --------------------------------------------------------
-- UI.ETP_Menu_SpriteSelInfo
-- --------------------------------------------------------

UI.ETP_Menu_SpriteSelInfo = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_SpriteSelInfo.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_Menu_SpriteSelInfo",
		rect			= Quat( 190, 450, 200, 205 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0x33, 0x00, 0x00, 0x00 ),
		},
		
		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Selected sprite info",
		},

		-- TEX_NAME_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20, 100, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Texture: ",			
		},

		-- TEX_NAME
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20+15, 100, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		}, 
	},

	children = { "UI.ETP_Menu_SpriteSeInfo_LoadBtn" }
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_SpriteSelInfo:Reset()

	self:SetText( "", self.layers.TEX_NAME )
	self:RemoveChild( UI.ETP_Menu_SpriteSeInfo_LoadBtn ) 
	self:SetLayerVisible( false, self.layers.TEX_NAME_LABEL )

end


--
function UI.ETP_Menu_SpriteSelInfo:OnSelSpriteChanged()

	self:Reset()

	local selItem = etp:GetSelItem()
	local effect = selItem and selItem:GetEffect()
	local spriteName = etp:GetSelSprite()

	if not effect or not spriteName or spriteName == "" then
		return
	end

	self:SetLayerVisible( true, self.layers.TEX_NAME_LABEL )
	self:AddChild( UI.ETP_Menu_SpriteSeInfo_LoadBtn )


	local texName = selItem:GetSpriteInfo( spriteName ).texName
	self:SetText( texName, self.layers.TEX_NAME )

end


--
function UI.ETP_Menu_SpriteSelInfo:OnSelSpriteTextureChanged()

	self:OnSelSpriteChanged()

end


-- -------------------------------
-- const
-- -------------------------------

UI.ETP_Menu_SpriteSelInfo.layers =
{
	BG					= 0,
	CAPTION				= 1,
	TEX_NAME_LABEL		= 2,
	TEX_NAME			= 3,
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_SpriteSelInfo:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	self:Reset()

end


--
function UI.ETP_Menu_SpriteSelInfo:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return
	end

	if wndThatReceivedInput == UI.ETP_Menu_SpriteSeInfo_LoadBtn:GetUiHandle() then
		UI.ETP_MenuWnd:ShowTexList( true )
		return true
	end

	return false

end 


-- --------------------------------------------------------
-- UI.ETP_Menu_AnimSelInfo
-- --------------------------------------------------------

UI.ETP_Menu_AnimSelInfo = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_AnimSelInfo.def =
{
	className = "Wnd",

	props =
	{
		name			= "ETP_Menu_AnimSelInfo",
		rect			= Quat( 190, 450, 200, 205 ),
		style			= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0x33, 0x00, 0x00, 0x00 ),
		},
		
		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 0, 170, 20 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Selected animation info",
		},

		-- LENGTH_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 20, 170, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Length [sec]:",
		},

		-- LENGTH
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 100, 20, 170, 15 ),
			color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
		},

		-- PROGRESS_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 40, 170, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Progress [%]:",
		},

		-- SPEED_LABEL
		{
			layerType	= UI.LAYER_TEXT,	
			rect		= Quat( 0, 130, 170, 15 ),
			color		= UI:ARGB( 0xff, 0x77, 0xaa, 0x77 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},			
   			text		= "Speed:",
		},
	},

	children =
	{
		"UI.ETP_Menu_AnimSelInfo_TimeSlider",
		"UI.ETP_Menu_AnimSelInfo_ToggleBtn",
		"UI.ETP_Menu_AnimSelInfo_StopBtn",
		"UI.ETP_Menu_AnimSelInfo_BeginBtn",
		"UI.ETP_Menu_AnimSelInfo_EndBtn",
		"UI.ETP_Menu_AnimSelInfo_SpeedSlider",
		"UI.ETP_Menu_AnimSelInfo_ResetSpeedBtn",
	 }
}   


--
UI.ETP_Menu_AnimSelInfo_TimeSlider =
{
	def =
    {
    	className	= "Wnd",
		prototype	= "ETP_Menu_SliderWnd",

    	props =
    	{
    		name		= "ETP_Menu_AnimSelInfo_TimeSlider",
    		rect		= Quat( 0, 60, 180, 25 ),
    	},
    }
}


--
UI.ETP_Menu_AnimSelInfo_ToggleBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_AnimSelInfo_PlayBtn",
			rect	= Quat( -2, 83, 24, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
    			},
    		},
		}
	}
}


--
UI.ETP_Menu_AnimSelInfo_StopBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_AnimSelInfo_StopBtn",
			rect	= Quat( 23, 83, 24, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text		= "X"
    			},
    		},
		}
	}
} 


--
UI.ETP_Menu_AnimSelInfo_BeginBtn =
{ 
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_AnimSelInfo_BeginBtn",
			rect	= Quat( 48, 83, 24, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text = "|<"
    			},
    		},
		}
	} 
}


--
UI.ETP_Menu_AnimSelInfo_EndBtn =
{ 
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_AnimSelInfo_EndBtn",
			rect	= Quat( 73, 83, 24, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text = ">|"
    			},
    		},
		}
	} 
} 


--
UI.ETP_Menu_AnimSelInfo_ResetSpeedBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "ETP_Menu_AnimSelInfo_ResetSpeedBtn",
			rect	= Quat( -2, 173, 54, 24 ),
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_IGNORE_FORMAT_SYMBOLS,
					text = "Reset"
    			},
    		},
		}
	}
}

--
UI.ETP_Menu_AnimSelInfo_SpeedSlider =
{
	def =
    {
    	className	= "Wnd",
		prototype	= "ETP_Menu_SliderWnd",

    	props =
    	{
    		name		= "ETP_Menu_AnimSelInfo_SpeedSlider",
    		rect		= Quat( 0, 150, 180, 25 ),
    	},
    },

    min			= -90,
    max			= 90,
    val			= 0,

	speedMax	= 10,
	speedMin	= 0.1,
}   


--
function UI.ETP_Menu_AnimSelInfo_SpeedSlider:InternalVal2AnimSpeed( val )

	if val >= 0 then
		return UI:Lerp( 1, self.speedMax, val / self.max  )
	else
		return UI:Lerp( self.speedMin, 1, ( val - self.min ) / -self.min )
	end	

end


--
function UI.ETP_Menu_AnimSelInfo_SpeedSlider:AnimSpeed2InternalVal( speed )

	if speed >= 1 then
		return UI:Lerp( 0, self.max, ( speed - 1 ) / ( self.speedMax - 1 ) )
	else
		return UI:Lerp( self.min, 0, ( speed - self.speedMin ) / ( 1 - self.speedMin ) )
	end

end


--
function UI.ETP_Menu_AnimSelInfo_SpeedSlider:UpdateValText()

	local speed = self:InternalVal2AnimSpeed( self.val )
    local str = string.format( "%.02f", speed )

	self:SetText( str, self.layers.CUR_VAL )

end


-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_AnimSelInfo:Reset()

	self:SetText( "", self.layers.LENGTH )

	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_TimeSlider ) 
	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_ToggleBtn ) 
	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_StopBtn ) 
	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_BeginBtn ) 
	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_EndBtn ) 
	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_SpeedSlider ) 
	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_ResetSpeedBtn ) 

	self:SetLayerVisible( false, self.layers.LENGTH_LABEL )
	self:SetLayerVisible( false, self.layers.PROGRESS_LABEL )
	self:SetLayerVisible( false, self.layers.SPEED_LABEL )

end


--
function UI.ETP_Menu_AnimSelInfo:OnSelAnimationChanged()

	self:Reset()

	local selItem = etp:GetSelItem()
	local effect = selItem and selItem:GetEffect()
	local anim = etp:GetSelAnimation()

	if not effect or not anim or anim == "" then
		return
	end

	self:SetLayerVisible( true, self.layers.LENGTH_LABEL )
	self:SetLayerVisible( true, self.layers.SPEED_LABEL )

	local length = effect:GetAnimationLength( anim )
	local strLength = string.format( "%.02f", length )
	self:SetText( strLength, self.layers.LENGTH )

	self:AddChild( UI.ETP_Menu_AnimSelInfo_ToggleBtn ) 
	UI.ETP_Menu_AnimSelInfo_ToggleBtn:SetBtnText( "||" )

	self:AddChild( UI.ETP_Menu_AnimSelInfo_SpeedSlider )
	local animInfo = selItem:GetAnimationInfo( anim )
	local speed = animInfo and animInfo.speed or 1
	UI.ETP_Menu_AnimSelInfo_SpeedSlider:SetVal( UI.ETP_Menu_AnimSelInfo_SpeedSlider:AnimSpeed2InternalVal( speed ) )

	self:AddChild( UI.ETP_Menu_AnimSelInfo_ResetSpeedBtn ) 

end


--
function UI.ETP_Menu_AnimSelInfo:OnPlayingAnimationChanged()

	local effect = etp:GetSelEffect()

	if not effect then
		self:Reset()
		return
	end

	local anim = etp:GetPlayingAnimation()

	if not anim or anim == "" then

    	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_TimeSlider ) 
    	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_StopBtn ) 
    	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_BeginBtn ) 
    	self:RemoveChild( UI.ETP_Menu_AnimSelInfo_EndBtn ) 

		self:SetLayerVisible( false, self.layers.PROGRESS_LABEL )

		UI.ETP_Menu_AnimSelInfo_ToggleBtn:SetBtnText( ">>" )

		return
	end

	self:AddChild( UI.ETP_Menu_AnimSelInfo_TimeSlider )
    self:AddChild( UI.ETP_Menu_AnimSelInfo_StopBtn ) 
	self:AddChild( UI.ETP_Menu_AnimSelInfo_BeginBtn ) 
	self:AddChild( UI.ETP_Menu_AnimSelInfo_EndBtn ) 

	self:SetLayerVisible( true, self.layers.PROGRESS_LABEL )

	UI.ETP_Menu_AnimSelInfo_ToggleBtn:SetBtnText( "||" )

end


-- -------------------------------
-- const
-- -------------------------------

UI.ETP_Menu_AnimSelInfo.layers =
{
	BG					= 0,
	CAPTION				= 1,
	LENGTH_LABEL		= 2,
	LENGTH				= 3,
	PROGRESS_LABEL		= 4,
	SPEED_LABEL			= 5,
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_AnimSelInfo:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	self:Reset()

end


--
function UI.ETP_Menu_AnimSelInfo:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w == UI.ETP_Menu_AnimSelInfo_ToggleBtn then
		self:ToggleAnim()

	elseif w == UI.ETP_Menu_AnimSelInfo_StopBtn then
		self:StopAnim()

	elseif w == UI.ETP_Menu_AnimSelInfo_BeginBtn then
		self:AnimToBegin()

	elseif w == UI.ETP_Menu_AnimSelInfo_EndBtn then
		self.AnimToEnd()

	elseif w == UI.ETP_Menu_AnimSelInfo_ResetSpeedBtn then
		self:ResetSpeed()
	end

	return true

end 


--
function UI.ETP_Menu_AnimSelInfo:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateAnimProgress()

end


--
function UI.ETP_Menu_AnimSelInfo:UpdateAnimProgress()

	local effect	= etp:GetSelEffect()
	local anim		= etp:GetPlayingAnimation()

	if not effect or not anim or anim == "" then
		return
	end

	local time = effect:GetAnimationTime()

	UI.ETP_Menu_AnimSelInfo_TimeSlider:SetVal( time * 100 )

end


--
function UI.ETP_Menu_AnimSelInfo:ToggleAnim()

	local selItem	= etp:GetSelItem()
	local effect	= selItem and selItem:GetEffect()
	local anim		= etp:GetSelAnimation()

	if not effect or not anim or anim == "" then
		return
	end

	if not effect:IsAnimationPlaying() then
		UI.ETP_Menu_AnimationsList:PlaySelAnimation()
     	UI.ETP_Menu_AnimSelInfo_ToggleBtn:SetBtnText( "||" )

	else
     	if selItem:IsAnimationPaused() then
     		selItem:PauseAnimation( false )
     		UI.ETP_Menu_AnimSelInfo_ToggleBtn:SetBtnText( "||" )

     	else
     		selItem:PauseAnimation( true )
     		UI.ETP_Menu_AnimSelInfo_ToggleBtn:SetBtnText( ">>" )
     	end

	end

end


--
function UI.ETP_Menu_AnimSelInfo:StopAnim()

	UI.ETP_Menu_AnimationsList:StopSelAnimation()

end


--
function UI.ETP_Menu_AnimSelInfo:AnimToBegin()

	local effect	= etp:GetSelEffect()
	local anim		= etp:GetSelAnimation()

	if not effect or not anim or anim == "" then
		return
	end

	effect:SetAnimationTime( 0 )
	effect:Update( 0 )

end


--
function UI.ETP_Menu_AnimSelInfo:AnimToEnd()

	local effect	= etp:GetSelEffect()
	local anim		= etp:GetSelAnimation()

	if not effect or not anim or anim == "" then
		return
	end

	effect:SetAnimationTime( 1 )
	effect:Update( 0 )

end


--
function UI.ETP_Menu_AnimSelInfo:OnSliderValChanged( slider, val )

	if slider == UI.ETP_Menu_AnimSelInfo_TimeSlider then

		local effect	= etp:GetSelEffect()
		local anim		= etp:GetSelAnimation()

		if not effect or not anim or anim == "" then
			return
		end

		local time = val * 0.01
		effect:SetAnimationTime( time )
		effect:Update( 0 )

	elseif slider == UI.ETP_Menu_AnimSelInfo_SpeedSlider then

		local effect	= etp:GetSelEffect()
		local anim		= etp:GetSelAnimation()

		if not effect or not anim or anim == "" then
			return
		end

		local speed = UI.ETP_Menu_AnimSelInfo_SpeedSlider:InternalVal2AnimSpeed( val )

    	if effect:GetCurAnimation() == anim then
    		effect:SetAnimationSpeed( speed )
    	end

		etp:OnAnimationSpeedChanged( speed )

	end

end


--
function UI.ETP_Menu_AnimSelInfo:ResetSpeed()

	UI.ETP_Menu_AnimSelInfo_SpeedSlider:SetVal( UI.ETP_Menu_AnimSelInfo_SpeedSlider:AnimSpeed2InternalVal( 1 ), true )

end


-- --------------------------------------------------------
-- UI.ETP_Menu_Btn
-- --------------------------------------------------------

UI.ETP_Menu_Btn = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_Btn.def =
{
	className = "ButtonWnd",

	props =
	{
		name			= "ETP_Menu_Btn",
		rect			= Quat( 0, 0, 90, 30 ),
		isPrototype		= true,
	},

	layers =
	{
		BA_NORMAL =
		{
			-- SEL_BG
			{
				layerType	= UI.LAYER_TEXTURE,
				layerStyle	= UI.WLS_RESIZABLE,
				texture		= "white",
				color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),
				visible		= false,
			},

			-- BG
			{
				layerType	= UI.LAYER_TEXTURE,
				layerStyle	= UI.WLS_FIX_LEFT + UI.WLS_FIX_RIGHT + UI.WLS_FIX_TOP + UI.WLS_FIX_BOTTOM,
				rect		= Quat( 2, 2, 90-2*2, 30-2*2 ),
				texture		= "white",
				color		= UI:ARGB( 0xff, 0x77, 0x77, 0x77 ),
			},

			-- TEXT
			{
				layerType	= UI.LAYER_TEXT,
				layerStyle	= UI.WLS_RESIZABLE,
				color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

       			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
    				fontName			= "system",
       			},
			},
		},

		BA_OVERROLED =
		{
			-- SEL_BG
			{
				layerType	= UI.LAYER_TEXTURE,
				layerStyle	= UI.WLS_RESIZABLE,
				texture		= "white",
				color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),
				visible		= false,
			},

			-- BG
			{
				layerType	= UI.LAYER_TEXTURE,
				layerStyle	= UI.WLS_FIX_LEFT + UI.WLS_FIX_RIGHT + UI.WLS_FIX_TOP + UI.WLS_FIX_BOTTOM,
				rect		= Quat( 2, 2, 90-2*2, 30-2*2 ),
				texture		= "white",
				color		= UI:ARGB( 0xff, 0x77, 0x77, 0x00 ),
			},

			-- TEXT
			{
				layerType	= UI.LAYER_TEXT,
				layerStyle	= UI.WLS_RESIZABLE,
				color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

       			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
    				fontName			= "system",
       			},
			},
		},

		BA_PRESSED =
		{
			-- SEL_BG
			{
				layerType	= UI.LAYER_TEXTURE,
				layerStyle	= UI.WLS_RESIZABLE,
				texture		= "white",
				color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),
				visible		= false,
			},

			-- BG
			{
				layerType	= UI.LAYER_TEXTURE,
				layerStyle	= UI.WLS_FIX_LEFT + UI.WLS_FIX_RIGHT + UI.WLS_FIX_TOP + UI.WLS_FIX_BOTTOM,
				rect		= Quat( 2, 2, 90-2*2, 30-2*2 ),
				texture		= "white",
				color		= UI:ARGB( 0xff, 0x55, 0x55, 0x00 ),
			},

			-- TEXT
			{
				layerType	= UI.LAYER_TEXT,
				layerStyle	= UI.WLS_RESIZABLE,
				color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

       			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
    				fontName			= "system",
       			},
			}, 
		}, 
	}
}

-- -------------------------------
-- interface funcitons
-- -------------------------------

--
function UI.ETP_Menu_Btn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )

end


--
function UI.ETP_Menu_Btn:Check( bCheck )

	self.bCheck = bCheck

	for a = 0, self:GetNumAppearances() - 1 do
		self:SetLayerVisible( self.bCheck, self.layers.SEL_BG, a )
	end

end


--
function UI.ETP_Menu_Btn:IsChecked()
	
	return self.bCheck

end

-- -------------------------------
-- const
-- -------------------------------

UI.ETP_Menu_Btn.layers =
{
	SEL_BG	= 0,
	BG		= 1,
	TEXT	= 2,
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ETP_Menu_Btn.bCheck = false


-- --------------------------------------------------------
-- UI.ETP_Menu_LoadEffectBtn
-- --------------------------------------------------------

UI.ETP_Menu_LoadEffectBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_LoadEffectBtn",
    		rect			= Quat( 400-(10+90)*4, 450+205+5, 94, 34 ),
    	},
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_PreviewTexBtn
-- --------------------------------------------------------

UI.ETP_Menu_PreviewTexBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_PreviewTexBtn",
    		rect			= Quat( 400-(10+90)*3, 450+205+5, 94, 34 ),
    	}
    }
}

-- -------------------------------------------------------
-- UI.ETP_Menu_HideBtn
-- --------------------------------------------------------

UI.ETP_Menu_HideBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_HideBtn",
    		rect			= Quat( 400-(10+90)*1, 450+205+5, 94, 34 ),
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		{
        			id		= 2,
        			text	= "Hide Preview"
        		}
    		}
    	}
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_PauseBtn
-- --------------------------------------------------------

UI.ETP_Menu_PauseBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_PauseBtn",
    		rect			= Quat( 400-(10+90)*2, 450+205+5, 94, 34 ),
    	}
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_AnimsBtn
-- --------------------------------------------------------

UI.ETP_Menu_AnimsBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_AnimsBtn",
    		rect			= Quat( 10, 418, 64, 24 ),
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		{
        			id		= 2,
        			text	= "Anims"
        		}
    		}
    	}
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorsBtn
-- --------------------------------------------------------

UI.ETP_Menu_LocatorsBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_LocatorsBtn",
    		rect			= Quat( 10+60+10, 418, 64, 24 ),
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		{
        			id		= 2,
        			text	= "Locators"
        		}
    		}
    	}
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_SpritesBtn
-- --------------------------------------------------------

UI.ETP_Menu_SpritesBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_SpritesBtn",
    		rect			= Quat( 10+(60+10)*2, 418, 64, 24 ),
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		{
        			id		= 2,
        			text	= "Sprites"
        		}
    		}
    	}
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorSeInfo_LoadBtn
-- --------------------------------------------------------

UI.ETP_Menu_LocatorSeInfo_LoadBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_LocatorSeInfo_LoadBtn",
    		rect			= Quat( -2, 20+15*1+3, 124, 24 ),
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		{
        			id		= 2,
        			text	= "Change effect..."
        		}
    		}
    	}
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_SpriteSeInfo_LoadBtn
-- --------------------------------------------------------

UI.ETP_Menu_SpriteSeInfo_LoadBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_Btn",

    	props =
    	{
    		name			= "ETP_Menu_SpriteSeInfo_LoadBtn",
    		rect			= Quat( -2, 20+15*2+3, 124, 24 ),
    	},

    	layers =
    	{
    		BA_NORMAL =
    		{
        		{
        			id		= 2,
        			text	= "Change sprite..."
        		}
    		}
    	}
    }
}


-- --------------------------------------------------------
-- UI.ETP_Menu_SimpleBtn
-- --------------------------------------------------------

UI.ETP_Menu_SimpleBtn = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ETP_Menu_SimpleBtn.def =
{
	className = "ButtonWnd",

	props =
	{
		name			= "ETP_Menu_SimpleBtn",
		isPrototype		= true,
	},

	layers =
	{
		BA_NORMAL =
		{
			-- TEXT
			{
				layerType	= UI.LAYER_TEXT,
				layerStyle	= UI.WLS_RESIZABLE,
				color		= UI:ARGB( 0xff, 0xff, 0xff, 0xff ),

       			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
    				fontName			= "system",
       			},
			},			
		},

		BA_OVERROLED =
		{
			-- TEXT
			{
				layerType	= UI.LAYER_TEXT,
				layerStyle	= UI.WLS_RESIZABLE,
				color		= UI:ARGB( 0xff, 0xaa, 0xaa, 0xaa ),

       			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
    				fontName			= "system",
       			},
			},
		},

		BA_PRESSED =
		{
			-- TEXT
			{
				layerType	= UI.LAYER_TEXT,
				layerStyle	= UI.WLS_RESIZABLE,
				color		= UI:ARGB( 0xff, 0xaa, 0xaa, 0xaa ),

       			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
    				fontName			= "system",
       			},
			}, 
		}, 
	}
}


-- -------------------------------
-- interface funcitons
-- -------------------------------

--
function UI.ETP_Menu_SimpleBtn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )
	self:UpdateRect()

end


--
function UI.ETP_Menu_SimpleBtn:GetBtnText()

	return self:GetText( self.layers.TEXT )	

end

-- -------------------------------
-- const
-- -------------------------------

UI.ETP_Menu_SimpleBtn.layers =
{
	TEXT	= 0,
}


-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_Menu_SimpleBtn:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if not self:IsPrototype() then
		self:UpdateRect()
	end

end


--
function UI.ETP_Menu_SimpleBtn:UpdateRect()

	local rect = _G.MeasureText(
       	self:GetText( self.layers.TEXT ),
       	self:GetFont( self.layers.TEXT ),
       	UI:Quat( 0, 0, 1024, 768 ),
       	self:GetTextFormatFlags( self.layers.TEXT ),
       	UI:Quat( 0, 0, 1024, 768 )
    )

	self:SetWidth( rect.z )
	self:SetHeight( rect.w )

end


--
function UI.ETP_Menu_SimpleBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateRect()

end


-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorSelInfo_FontBtn
-- --------------------------------------------------------

UI.ETP_Menu_LocatorSelInfo_FontBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_SimpleBtn",

    	props =
    	{
    		name			= "ETP_Menu_LocatorSelInfo_FontBtn",
    		rect			= Quat( 40, 20+50+15*1+2, 0, 0 ),
    	},
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorSelInfo_HAlmBtn
-- --------------------------------------------------------

UI.ETP_Menu_LocatorSelInfo_HAlmBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_SimpleBtn",

    	props =
    	{
    		name			= "ETP_Menu_LocatorSelInfo_HAlmBtn",
    		rect			= Quat( 80, 20+50+15*2+2, 0, 0 ),
    	},
    }
}

-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorSelInfo_VAlmBtn
-- --------------------------------------------------------

UI.ETP_Menu_LocatorSelInfo_VAlmBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_SimpleBtn",

    	props =
    	{
    		name			= "ETP_Menu_LocatorSelInfo_VAlmBtn",
    		rect			= Quat( 80, 20+50+15*3+2, 0, 0 ),
    	},
    }
}


-- --------------------------------------------------------
-- UI.ETP_Menu_LocatorSelInfo_BlendBtn
-- --------------------------------------------------------

UI.ETP_Menu_LocatorSelInfo_BlendBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ETP_Menu_SimpleBtn",

    	props =
    	{
    		name			= "ETP_Menu_LocatorSelInfo_BlendBtn",
    		rect			= Quat( 80, 20+50+15*6+2, 0, 0 ),
    	},
    }
} 

-- ---------------------------------------------------
-- UI.ETP_Menu_SliderWnd
-- ---------------------------------------------------

UI.ETP_Menu_SliderWnd = {}
local etpsl = UI.ETP_Menu_SliderWnd

UI.ETP_Menu_SliderWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ETP_Menu_SliderWnd",
		rect		= Quat( 0, 0, 100+15*2, 25 ),
		style		= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype	= true,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_FIX_TOP + UI.WLS_FIX_LEFT + UI.WLS_FIX_RIGHT + UI.WLS_FIX_BOTTOM,
			rect		= Quat( 15, 3, 100, 4 ),
			texture		= "white",
			color		= 0xff666666,
		},

		-- CUR_VAL
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_FIX_TOP + UI.WLS_FIX_BOTTOM,
			color		= 0xffffffff,
			rect		= Quat( 15+(100-20)/2, 10, 20, 15 ),

   			formatFlags	 = FONT.TF_HCENTER + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},
		}, 

		-- THUMB
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_FIX_TOP + UI.WLS_FIX_BOTTOM,
			rect		= Quat( 15+(100-4)/2, 0, 4, 10 ),
			texture		= "white",
			color		= 0xffffffff,
		},
	},

	children = { "UI.ETP_Menu_SliderMinusBtn", "UI.ETP_Menu_SliderPlusBtn" }
}


UI.ETP_Menu_SliderMinusBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "minusBtn",
			rect	= Quat( 0, 0, 12, 12 ),
			isPrototype	= true,
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- BG
    			{
					id = 1,
    				layerType	= UI.LAYER_TEXTURE,
					layerStyle	= UI.WLS_RESIZABLE,
    			},

    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					text = "-",
    			},
    		},

			BA_OVERROLED =
			{
    			-- BG
    			{
					id = 1,
    				layerType	= UI.LAYER_TEXTURE,
					layerStyle	= UI.WLS_RESIZABLE,
    			},
			},

			BA_PRESSED =
			{
    			-- BG
    			{
					id = 1,
    				layerType	= UI.LAYER_TEXTURE,
					layerStyle	= UI.WLS_RESIZABLE,
    			},
			}
		}
	},

	SLIDER_MINUS_BTN = true,
}

UI.ETP_Menu_SliderPlusBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ETP_Menu_Btn",

		props =
		{
			name	= "plusBtn",
			rect	= Quat( 0, 0, 12, 12 ),
			isPrototype	= true,
		},

		layers =
		{
    		BA_NORMAL =
    		{
    			-- BG
    			{
					id = 1,
    				layerType	= UI.LAYER_TEXTURE,
					layerStyle	= UI.WLS_RESIZABLE,
    			},

    			-- TEXT
    			{
					id = 2,
    				layerType	= UI.LAYER_TEXT,
					text = "+"
    			},
    		},

			BA_OVERROLED =
			{
    			-- BG
    			{
					id = 1,
    				layerType	= UI.LAYER_TEXTURE,
					layerStyle	= UI.WLS_RESIZABLE,
    			},
			},

			BA_PRESSED =
			{
    			-- BG
    			{
					id = 1,
    				layerType	= UI.LAYER_TEXTURE,
					layerStyle	= UI.WLS_RESIZABLE,
    			},
			}
		}
	},

	SLIDER_PLUS_BTN = true,
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_Menu_SliderWnd:SetVal( val, bNotify )

	if bNotify == nil then
		bNotify = false
	end

	local oldVal = self.val
	self.val = UI:Clamp( val, self.min, self.max )	

	self:UpdateThumbPos()	
	self:UpdateValText()

	if bNotify and oldVal ~= self.val then
		local parent = self:GetParent()
		if parent and parent.OnSliderValChanged then
			parent:OnSliderValChanged( self, self.val )
		end
	end

end


--
function UI.ETP_Menu_SliderWnd:GetVal()

	return self.val

end


--
function UI.ETP_Menu_SliderWnd:SetMinMax( min, max )

	self.min = min
	self.max = max

	self:SetVal( self.val, false )

end


--
function UI.ETP_Menu_SliderWnd:SetStep( step )

	self.step = step

end


-- -------------------------------
-- const
-- -------------------------------

etpsl.layers =
{
	BG		= 0,
	CUR_VAL	= 1,
	THUMB	= 2,
}

etpsl.SCROLL_FIRST_DELAY = 0.3
etpsl.SCROLL_DELAY = 0.015

-- -------------------------------
-- vars
-- -------------------------------

etpsl.step			= 1
etpsl.min			= 0
etpsl.max			= 100
etpsl.val			= 50
etpsl.bDrag			= false
etpsl.rect			= Quat( 0, 0, 0, 0 )
etpsl.bInt			= true
etpsl.scrollDir		= 0
etpsl.scrollTimer	= -1


-- -------------------------------
-- work function
-- -------------------------------

--
function UI.ETP_Menu_SliderWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.rect = UI:QuatCopyStable( self:GetLayerRect( self.layers.BG ) )

	self:SetVal( self.val, false )

	local plusBtn = self:GetChildByName( "plusBtn" )
	plusBtn:SetLeft( self:GetWidth() - plusBtn:GetWidth() )

end


--
function UI.ETP_Menu_SliderWnd:UpdateThumbPos()

	local thumbRect	= self:GetLayerRect( self.layers.THUMB )
	local textRect	= self:GetLayerRect( self.layers.CUR_VAL )

	local x = UI:Lerp( self.rect.x, self.rect.x + self.rect.z, ( self.val - self.min ) / ( self.max - self.min ) )

	local thumbX = x - thumbRect.z * 0.5
	local textX = x - textRect.z * 0.5

	self:SetLayerLeft( thumbX, self.layers.THUMB )	
	self:SetLayerLeft( textX, self.layers.CUR_VAL )	

end


--
function UI.ETP_Menu_SliderWnd:UpdateValText()

    local str = ""

	if self.bInt then
		str = tostring( UI:Round( self.val ) )
	else
		str = string.format( "%.02f", self.val )
	end

	self:SetText( str, self.layers.CUR_VAL )

end


--
function UI.ETP_Menu_SliderWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w.SLIDER_MINUS_BTN then
		self:Scroll( -1 )

		self.scrollDir = -1
		self.scrollTimer = self.SCROLL_FIRST_DELAY

	elseif w.SLIDER_PLUS_BTN then
		self:Scroll( 1 )

		self.scrollDir = 1
		self.scrollTimer = self.SCROLL_FIRST_DELAY

	else

    	self:SetValByMousePos( mouseX )

    	if not self.bDrag and UI:IsPtInRect( self:GetLayerRect( self.layers.THUMB ), mouseX, mouseY ) then
    		self:StartDrag()
    	end

		self.scrollDir = 0
		self.scrollTimer = -1

	end

	return true

end


--
function UI.ETP_Menu_SliderWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	self:StopDrag()

	self.scrollDir = 0
	self.scrollTimer = -1

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	return true

end


--
function UI.ETP_Menu_SliderWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if self.bDrag then
		self:SetValByMousePos( mouseX )
	end

	return true

end


--
function UI.ETP_Menu_SliderWnd:StartDrag()

	if self.bDrag then
		return
	end

	self.bDrag = true
	UI:CaptureMouse( self:GetUiHandle() )

end


--
function UI.ETP_Menu_SliderWnd:StopDrag()

	if not self.bDrag then
		return
	end

	self.bDrag = false
	UI:CaptureMouse( UI.INVALID_UI_HANDLE )

end


--
function UI.ETP_Menu_SliderWnd:SetValByMousePos( mouseX )

	local cf = ( mouseX - self.rect.x ) / self.rect.z
	local val = UI:Lerp( self.min, self.max, cf )

	self:SetVal( val, true )

end


--
function UI.ETP_Menu_SliderWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:StopDrag()

	self.scrollDir = 0
	self.scrollTimer = -1

end


--
function UI.ETP_Menu_SliderWnd:Scroll( delta )

	local val = self.val + delta * self.step
	self:SetVal( val, true )

end


--
function UI.ETP_Menu_SliderWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.scrollTimer ~= -1 then

		self.scrollTimer = self.scrollTimer - dt_sys
		if self.scrollTimer <= 0 then

			self:Scroll( self.scrollDir )
			self.scrollTimer = self.SCROLL_DELAY

		end

	end

end


-- ------------------------------------------------------------------------------
-- UI.ETP_TexturePreviewWnd
-- ------------------------------------------------------------------------------

UI.ETP_TexturePreviewWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ETP_TexturePreviewWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "ETP_TexturePreviewWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= 0,
	},

	layers =
	{
		-- BG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= UI:ARGB( 0xff, 0x00, 0x00, 0x00 ),
		},

		-- TEX_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "white",
			color		= 0,
		},

		-- TEXTURE
		{
			layerType	= UI.LAYER_TEXTURE,
		},

		-- INFO_BG
		{
			layerType	= UI.LAYER_TEXTURE,
			rect		= Quat( 20, 50, 400, 50 ),
			texture		= "white",
			color		= 0x33000000,
		},

		-- INFO_CAPTION
		{
			layerType	= UI.LAYER_TEXT,
			rect		= Quat( 20, 50, 400, 15 ),
			color		= UI:ARGB( 0xff, 0x00, 0xff, 0x00 ),

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName			= "system",
   			},		
			text = "Texture info"
		},

		-- INFO
		{
			layerType	= UI.LAYER_TEXT,
			rect		= Quat( 20, 65, 400, 35 ),
			color		= 0xffffffff,

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_NOCLIP,
   			formatInfoSz = { 3, 1 },
   			font		= { fontName = "system" }
		},

		-- TEX_BG_COLOR_EDIT_LABEL
		{
			layerType	= UI.LAYER_TEXT,
			rect		= Quat( 20, 65+35+10, 400, 15 ),
			color		= 0xffffffff,

   			formatFlags	 = FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font		= { fontName = "system" },
			text		= "Texture background color",
		},
	},

	children = { "UI.ETP_TexturePreviewWnd_TexBgEdit" }
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ETP_TexturePreviewWnd:SetTexture( texName )

	self:Reset()

	self.texName = texName

	self:FullUpdate()

end


--
function UI.ETP_TexturePreviewWnd:SetBgColor( color )

	self:SetColor( color, self.layers.BG )

end


--
function UI.ETP_TexturePreviewWnd:Reset()

	self.texName = ""
	self.texBgColor = UI.ETP_TexturePreviewWnd.DEFAULT_TEX_BG_COLOR

	self:SetTextureHandle( UI.INVALID_RESOURCE_HANDLE, self.layers.TEXTURE )
	self:SetText( "", self.layers.INFO )	
	self:SetLayerVisible( false, self.layers.TEX_BG ) 
	UI.ETP_TexturePreviewWnd_TexBgEdit:SetEditText( "" )

end


-- -------------------------------
-- const
-- -------------------------------

UI.ETP_TexturePreviewWnd.layers =
{
    BG				= 0,
	TEX_BG			= 1,
    TEXTURE			= 2,
    INFO_BG			= 3,
	INFO_CAPTION	= 4,
    INFO			= 5,
}

UI.ETP_TexturePreviewWnd.DEFAULT_TEX_BG_COLOR	= 0

-- -------------------------------
-- vars
-- -------------------------------

UI.ETP_TexturePreviewWnd.texName	= ""
UI.ETP_TexturePreviewWnd.texBgColor	= UI.ETP_TexturePreviewWnd.DEFAULT_TEX_BG_COLOR

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ETP_TexturePreviewWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )

end


--
function UI.ETP_TexturePreviewWnd:FullUpdate()

	local hTex = UI:GetTex( self.texName )

	local rc = UI:GetResourceByHandle( hTex )
	if not rc then
		sys.log( "UI.ETP_TexturePreviewWnd:UpdateTexture()[ERROR]: cannot find resource" )
		return
	end

	local u0 = rc:GetU0()
	local v0 = rc:GetV0()
	local u1 = rc:GetU1()
	local v1 = rc:GetV1()

	local texWidth = rc:GetTextureWidth()
	local texHeight = rc:GetTextureHeight()

	local texFile = rc:GetTextureFile()

	local sizeAbs = UI:Vec2( ( u1 - u0 ) * texWidth, ( v1 - v0 ) * texHeight )
	local sizeRel = UI:PtToRel( sizeAbs )

	local selfRect = self:GetRect()

	local layerRect = UI:Quat( 0, 0, sizeRel.x, sizeRel.y )
	layerRect.x = ( selfRect.z - layerRect.z ) * 0.5
	layerRect.y = ( selfRect.w - layerRect.w ) * 0.5

	-- снэппинг к пикселю, чтобы не замыливалось

	layerRect.x = UI:XToRel( math.floor( UI:XToAbs( layerRect.x ) ) );
	layerRect.y = UI:YToRel( math.floor( UI:YToAbs( layerRect.y ) ) );	

	-- текстура

	self:SetTextureHandle( hTex, self.layers.TEXTURE )
	self:SetLayerRect( layerRect, self.layers.TEXTURE )

	-- инфо

	local text = string.format( "width:  %.2f|height: %.2f|file:   %s", sizeAbs.x, sizeAbs.y, texFile )
	self:SetText( text, self.layers.INFO )	

	-- фон под текстуру

	self:SetLayerVisible( true, self.layers.TEX_BG ) 
	self:SetLayerRect( layerRect, self.layers.TEX_BG )
	self:SetTexBgColor( self.DEFAULT_TEX_BG_COLOR, true, false )

	-- зарузка сохраненных настроек

	self:LoadSettingsFromFile()		

end


--
function UI.ETP_TexturePreviewWnd:F_OnEventEditChange( hSender, eventSrc )

	if eventSrc ~= UI.EVENT_SRC_KEYBOARD then
		return
	end

	if hSender == UI.ETP_TexturePreviewWnd_TexBgEdit:GetUiHandle() then

		local strColor = "0x"..UI.ETP_TexturePreviewWnd_TexBgEdit:GetEditText()
		local color = tonumber( strColor )
		local bUpdateEditWnd = false

		if not color then
			color = self.DEFAULT_TEX_BG_COLOR
			bUpdateEditWnd = true
		end

		self:SetTexBgColor( color, bUpdateEditWnd, true )

	end

end


--
function UI.ETP_TexturePreviewWnd:SetTexBgColor( color, bUpdateEditWnd, bSaveToFile )

	self.texBgColor = color

	self:SetColor( color, self.layers.TEX_BG )

	if bUpdateEditWnd then
		local strColor = string.format( "%08x", color ) 
		UI.ETP_TexturePreviewWnd_TexBgEdit:SetEditText( strColor )
	end

	if bSaveToFile then
		self:SaveSettingsToFile()
	end

end


--
function UI.ETP_TexturePreviewWnd:SaveSettingsToFile()		

	local t = self:GetOptionsTable()

	local path = UI.EffectTreePreviewWnd:GetSettingsPath()
	local tableName = self:GetSettingsTableName()

	_G[ tableName ] = t

	sys.dumpScriptTable( path, tableName )

	_G[ tableName ] = nil

end


--
function UI.ETP_TexturePreviewWnd:LoadSettingsFromFile()		

	local path = self:GetSettingsPath()
	local tableName = self:GetSettingsTableName()

	sys.execscript( path )

	local t = _G[ tableName ] or {}

	self:LoadOptionsFromTable( t )

	_G[ tableName ] = nil	

end


--
function UI.ETP_TexturePreviewWnd:GetSettingsPath()

	return _G.GetUserGameFolder() .. "/UiPreview/settings.lua"

end


--
function UI.ETP_TexturePreviewWnd:GetSettingsTableName()

	return "TexturePreviewSettings"

end


--
function UI.ETP_TexturePreviewWnd:GetOptionsTable()

	local options =	
	{
		texBgColor	= self.texBgColor,
	}

	return options

end


--
function UI.ETP_TexturePreviewWnd:LoadOptionsFromTable( t )

	local texBgColor = t.texBgColor

	if type( texBgColor ) == "number" then
		self:SetTexBgColor( texBgColor, true, false )
	end

end


-- -------------------------------------------------------------
-- UI.ETP_TexturePreviewWnd_TexBgEdit
-- -------------------------------------------------------------

UI.ETP_TexturePreviewWnd_TexBgEdit =
{
	def =
	{   	
 		className	= "EditWnd",
		prototype	= "ETP_Menu_EditWnd",
	

		props =
		{
			name			= "ETP_TexturePreviewWnd_TexBgEdit",
			rect			= Quat( 20, 65+35+10+15+5, 200, 15 ),
			symbolsLimit	= 8,
		}
	}
}


-- -------------------------------------------------------------
-- шкалирование для нового базового разрешения 1920*1080 (с 1280*720)
-- -------------------------------------------------------------

local etpWindows =
{
    "EffectTreePreviewWnd",
    "ETP_ItemWnd",
    "ETP_MenuWnd",
    "ETP_Menu_Panel",
    "ETP_ScrollBar",
    "ETP_Scroll_Btn",
    "ETP_Scroll_BtnUp",
    "ETP_Scroll_BtnDown",
    "ETP_Scroll_Page",
    "ETP_Scroll_PageUp",
    "ETP_Scroll_PageDown",
    "ETP_Scroll_Thumb",
    "ETP_Menu_List",
    "ETP_Menu_EffectsList",
    "ETP_Menu_AnimationsList",
    "ETP_Menu_OptionsList",
    "ETP_Menu_EffectSelInfo",
    "ETP_Menu_FilesList",
    "ETP_Menu_FilesList_FilesModeBtn",
    "ETP_Menu_FilesList_ResourcesModeBtn",
    "ETP_Menu_FilesList_LoadAllBtn",
    "ETP_Menu_TexList",
    "ETP_Menu_LocatorsList",
    "ETP_Menu_SpritesList",
    "ETP_Menu_LocatorSelInfo",
    "ETP_Menu_LocatorSelInfo_ResetBtn",
    "ETP_Menu_EditWnd",
    "ETP_Menu_LocatoSelInfo_TextEdit",
    "ETP_Menu_LocatoSelInfo_ColorEdit",
    "ETP_Menu_LocatoSelInfo_BackColorEdit",
    "ETP_Menu_SpriteSelInfo",
    "ETP_Menu_AnimSelInfo",
    "ETP_Menu_AnimSelInfo_TimeSlider",
    "ETP_Menu_AnimSelInfo_ToggleBtn",
    "ETP_Menu_AnimSelInfo_StopBtn",
    "ETP_Menu_AnimSelInfo_BeginBtn",
    "ETP_Menu_AnimSelInfo_EndBtn",
    "ETP_Menu_AnimSelInfo_ResetSpeedBtn",
    "ETP_Menu_AnimSelInfo_SpeedSlider",
    "ETP_Menu_Btn",
    "ETP_Menu_LoadEffectBtn",
    "ETP_Menu_PreviewTexBtn",
    "ETP_Menu_HideBtn",
    "ETP_Menu_PauseBtn",
    "ETP_Menu_AnimsBtn",
    "ETP_Menu_LocatorsBtn",
    "ETP_Menu_SpritesBtn",
    "ETP_Menu_LocatorSeInfo_LoadBtn",
    "ETP_Menu_SpriteSeInfo_LoadBtn",
    "ETP_Menu_SimpleBtn",
    "ETP_Menu_LocatorSelInfo_FontBtn",
    "ETP_Menu_LocatorSelInfo_HAlmBtn",
    "ETP_Menu_LocatorSelInfo_VAlmBtn",
    "ETP_Menu_LocatorSelInfo_BlendBtn",
    "ETP_Menu_SliderWnd",
    "ETP_Menu_SliderMinusBtn",
    "ETP_Menu_SliderPlusBtn",
    "ETP_TexturePreviewWnd",
    "ETP_TexturePreviewWnd_TexBgEdit",
}

local _scaleCf = 1080 / 720

for wndIdx, wndName in pairs( etpWindows ) do

	local wnd = UI[ wndName ]
	if wnd then

		local wndDef = wnd.def
		if wndDef then

			if wndDef.props then

				if wndDef.props.rect then

					wndDef.props.rect.x = wndDef.props.rect.x * _scaleCf
					wndDef.props.rect.y = wndDef.props.rect.y * _scaleCf
					wndDef.props.rect.z = wndDef.props.rect.z * _scaleCf
					wndDef.props.rect.w = wndDef.props.rect.w * _scaleCf

				end

			end

			if wndDef.layers then

				for layersParamKey, layersParam in pairs( wndDef.layers ) do

					if type( layersParamKey ) == "string" and type( layersParam ) == "table" then

						for layerIdx, layerInfo in pairs( layersParam ) do

							if type( layerIdx ) == "number" and type( layerInfo ) == "table" then

             					if layerInfo.rect then

                 					layerInfo.rect.x = layerInfo.rect.x * _scaleCf
                 					layerInfo.rect.y = layerInfo.rect.y * _scaleCf
                 					layerInfo.rect.z = layerInfo.rect.z * _scaleCf
                 					layerInfo.rect.w = layerInfo.rect.w * _scaleCf

             					end

							end

						end

					elseif type( layersParamKey ) == "number" and type( layersParam ) == "table" then

						local layerInfo = layersParam

    					if layerInfo.rect then

        					layerInfo.rect.x = layerInfo.rect.x * _scaleCf
        					layerInfo.rect.y = layerInfo.rect.y * _scaleCf
        					layerInfo.rect.z = layerInfo.rect.z * _scaleCf
        					layerInfo.rect.w = layerInfo.rect.w * _scaleCf

    					end

					end

				end

			end

		end

	else
		sys.log( "cannot fin def for window \"%s\"", wndName )
	end

end