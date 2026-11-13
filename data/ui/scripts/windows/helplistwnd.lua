-- ----------------------------------------------------------------------------
--
-- Workfile: helplistwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HelpListWnd = {}
local hw = UI.HelpListWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HelpListWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "HelpListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		activationOrder	= 0,
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
				defName 			= "helpList_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",	
						layer		= "UI.HelpListWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.HelpList_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					--[[{
						objName		= "btn_2",	
						wnd			= "UI.HelpList_SupportBtn",
						animParams	= UI.EffectAnimParams.POS,
					},]]

					{
						objName		= "btn_1",	
						wnd			= "UI.HelpList_FaqBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_6",	
						wnd			= "UI.HelpList_ForumBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1_7",	
						wnd			= "UI.HelpList_WikiBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.HelpList_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_3",	
						wnd			= "UI.HelpList_TutorialBtn_1",
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
			text			= UI:GetStringByName( "helpList_caption" ),
		},
	},

	children =
	{
		"UI.HelpList_ListWnd",
		--"UI.HelpList_SupportBtn",
		"UI.HelpList_FaqBtn",
		"UI.HelpList_ForumBtn",
		"UI.HelpList_WikiBtn",
		"UI.HelpList_CrossBtn",
		"UI.HelpList_TutorialBtn_1",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HelpListWnd:OnHangarPrepareStateChanged()

	if not self:IsOnScreen() then
		return
	end

	UI.HelpList_TutorialBtn_1:OnHangarPrepareStateChanged()

end


--
function UI.HelpListWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnChangeBattleShips()

end


--
function UI.HelpListWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnChangeBattleShips()

end


--
function UI.HelpListWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnChangeBattleShips()

end


--
function UI.HelpListWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnChangeBattleShips()

end


--
function UI.HelpListWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnChangeBattleShips()

end


--
function UI.HelpListWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnChangeBattleShips()

end


--
function UI.HelpListWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnChangeBattleShips()

end


--
function UI.HelpListWnd:MasterServer_OnSquadInfo( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.SquadOpResult.SOR_OK then
		return
	end

	self:OnChangeSquad()

end


--
function UI.HelpListWnd:MasterServer_OnSquadInviteAccept( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.SquadOpResult.SOR_OK then
		return
	end

	self:OnChangeSquad()

end


--
function UI.HelpListWnd:MasterServer_OnSquadLeave( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.SquadOpResult.SOR_OK then
		return
	end

	self:OnChangeSquad()

end


-- почему то пр приходе этого сообщения клиентские данные сквада обновляются целиком
function UI.HelpListWnd:MasterServer_OnSquadInviteSend( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.SquadOpResult.SOR_OK then
		return
	end

	self:OnChangeSquad()

end


--
function UI.HelpListWnd:MasterServer_OnSquadNotification( type, squad, uid, params )

	if not self:IsOnScreen() then
		return
	end

	self:OnChangeSquad()

end


-- ------------------------------
-- const
-- ------------------------------

hw.layers =
{
	MAIN_EFFECT		= 0,
	CAPTION			= 1,
}

hw.sounds =
{
	selectItem	= "sound/ui/btnMouseOver",
}

hw.slotTypes =
{
	THEME	= 1,
	ROLE	= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

hw.hMsgLink		= UI.INVALID_UI_HANDLE
hw.linkToOpen	= ""

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HelpListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.HelpListWnd:Reset()

	UI.HelpList_ListWnd:Clear()

	UI.HelpList_TutorialBtn_1:Reset()
	
end


--
function UI.HelpListWnd:FullUpdate()

	self:Reset()

	local themes = self:GetThemes()
	for idx = 1, #themes do

		local data =
		{
			slotType	= self.slotTypes.THEME,
			theme		= themes[ idx ]
		}

		UI.HelpList_ListWnd:AddRecord( data )

	end	


	local roles = self:GetRoles()
	for idx = 1, #roles do

		local data =
		{
			slotType	= self.slotTypes.ROLE,
			role		= roles[ idx ]
		}

		UI.HelpList_ListWnd:AddRecord( data )

	end

	UI.HelpList_TutorialBtn_1:FullUpdate()

end


--
function UI.HelpListWnd:GetThemes()

	local themes = {}

	if UI.Help and UI.Help.themes then

		for idx = 1, #UI.Help.themes do

			local theme = UI.Help.themes[ idx ]

			if theme and theme.textures ~= nil and next( theme.textures ) ~= nil and not theme.notShowInList then
				table.insert( themes, theme )
			end

		end

	end

	return themes

end


--
function UI.HelpListWnd:GetRoles()

	local roles = {}

	for roleName, roleId in pairs( ai.ShipRoles ) do
		if roleId ~= ai.ShipRoles.NONE then
			table.insert( roles, roleId )
		end
	end

	table.sort( roles )

	return roles

end


--
function UI.HelpListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w.HELP_LIST_SLOT then

		local data = w:GetRecordData()

		if data.slotType == self.slotTypes.THEME then
			UI:ShowHelp( data.theme.name, UI.HelpWnd.modes.USER, 1 )

		elseif data.slotType == self.slotTypes.ROLE then
			UI.RoleInfoWnd:ShowAsHelp( data.role )

		else
			sys.log( "UI.HelpListWnd:F_OnMouseLButtonDown()[ERROR]: unhandled slot type: %s", tostring( data.slotType ) )
		end


	--[[elseif w == UI.HelpList_SupportBtn then
		self:TryOpenLink( self:GetLocalizedLink( "supportLink" ) )]]

	elseif w == UI.HelpList_FaqBtn then
		self:TryOpenLink( self:GetLocalizedLink( "faqLink" ) )

	elseif w == UI.HelpList_ForumBtn then
		self:TryOpenLink( self:GetLocalizedLink( "forumLink" ) )

	elseif w == UI.HelpList_WikiBtn then
		self:TryOpenLink( self:GetLocalizedLink( "wikiLink" ) )

	elseif w == UI.HelpList_CrossBtn then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )

	elseif w == UI.HelpList_TutorialBtn_1 then
		self:StartTutorial()
		UI:PlayGlobalSound( UI.sounds.btnClick )
	end

	return true

end


--
function UI.HelpListWnd:StartTutorial()

	UI.TutorialWnd:Show()
	UI.TutorialWnd:Setup( UI.TutorialWnd.launchModes.HELP )

end


--
function UI.HelpListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	UI.HelpList_ListWnd:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


--
function UI.HelpListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

end


--
function UI.HelpListWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

		if self.hMsgLink ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hMsgLink )
		end

	end

	self.hMsgLink	= UI.INVALID_UI_HANDLE
	self.linkToOpen	= ""

end


--
function UI.HelpListWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if UI:GetFirstOverlayWnd() then
		return
	end

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )

	if	wndUnderMouse and
		wndUnderMouse ~= self and not wndUnderMouse:IsChildOf( self ) and
		wndUnderMouse ~= UI.Hangar_MenuWnd and not wndUnderMouse:IsChildOf( UI.Hangar_MenuWnd ) then
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	end

end


--
function UI.HelpListWnd:OnChangeBattleShips()

	UI.HelpList_TutorialBtn_1:OnChangeBattleShips()

end


--
function UI.HelpListWnd:OnChangeSquad()

	UI.HelpList_TutorialBtn_1:OnChangeSquad()

end


--
function UI.HelpListWnd:TryOpenLink( link )

	if self.hMsgLink ~= UI.INVALID_UI_HANDLE then
		sys.log( "UI.HelpListWnd:TryOpenLink()[ERROR]: msg box on screen" )
		return
	end

	self.hMsgLink = UI:MessageBox( UI:GetStringByName( "msg_httpLinkOpen_caption" ), UI:GetStringByName( "msg_httpLinkOpen_text" ), UI.MBS_YES_NO )
	self.linkToOpen = link

end


--
function UI.HelpListWnd:DoOpenLink( link )

	if link ~= "" then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		_G.ShellExecute( link )
	else
		sys.log( "UI.HelpListWnd:DoOpenLink()[ERROR]: empty link" )
	end

end


--
function UI.HelpListWnd:GetLocalizedLink( name )

	local link = ""

	local language = UI:GetLanguage()
	if _G.locale and _G.locale.languages and _G.locale.languages[ language ] then

		link = _G.locale.languages[ language ][ name ]
		if link == nil then

			local defaultLanguage = "ENGLISH"
			if _G.locale.languages[ defaultLanguage ] then

				link = _G.locale.languages[ defaultLanguage ][ name ]

				if link ~= nil then
        			if type( link ) ~= "string" then
        				sys.log( "UI.HelpListWnd:GetLocalizedLink()[ERROR]: invalid type of _G.locale.languages[%s][%s]; \"string\" expected, got \"%s\"", defaultLanguage, name, type( link ) )
        				link = nil
        			end
				end

			end

		else

			if type( link ) ~= "string" then
				sys.log( "UI.HelpListWnd:GetLocalizedLink()[ERROR]: invalid type of _G.locale.languages[%s][%s]; \"string\" expected, got \"%s\"", language, name, type( link ) )
				link = nil
			end
			
		end

	end

	if link == nil then
		link = ""
	end

	if link == "" then
		sys.log( "UI.HelpListWnd:GetLocalizedLink()[ERROR]: cannot find link %s", name )
	end

	return link

end



--
function UI.HelpListWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgLink then

		self.hMsgLink = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if self.linkToOpen ~= "" then
				self:DoOpenLink( self.linkToOpen )
				self.linkToOpen = ""
			else
				sys.log( "UI.HelpListWnd:F_OnEventMsgBoxRet()[ERROR]: no link saved" )
			end

		end

	end

end


-- --------------------------------------------------------------------------
-- UI.HelpList_ListWnd
-- --------------------------------------------------------------------------

UI.HelpList_ListWnd =
{
    def =
    {
    	className	= "Wnd",
		prototype	= "ButtonsList3Wnd",
    	
    	props =
    	{
    		name	= "HelpList_ListWnd",
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
    				defName 			= "helpList_list",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
					}
				}}
			}
		}
	},

	listStyle 			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION,
	MAX_SLOTS 			= 9,
	btnPrototypeName	= "HelpList_SlotWnd",
	selectSound			= "",

	effectInfo =
	{
    	main =
    	{
    		slotObjNamePrefix	= "line_",
    		scrollObjName		= "scroll",
    		animIdle			= "idle",
    	}
	}
}

-- --------------------------------------------------------------------------
-- UI.HelpList_SlotWnd
-- --------------------------------------------------------------------------

UI.HelpList_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HelpList_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",
	
	props =
	{
		name		= "HelpList_SlotWnd",
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
				defName 			= "helpList_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.HelpList_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HelpList_SlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self.nameMetaText:SetText( "", true )
	self:SetMouseOver( false )

end


--
function UI.HelpList_SlotWnd:Select( bSelect, bAnimated )

	self:UpdateMainAnimation()

end


-- ------------------------------
-- const
-- ------------------------------

UI.HelpList_SlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	NAME		= 1,
}

UI.HelpList_SlotWnd.effectInfo =
{
	animIdle		= "idle",
	animMouseOver	= "over",
}

UI.HelpList_SlotWnd.HELP_LIST_SLOT = true

-- ------------------------------
-- vars
-- ------------------------------

UI.HelpList_SlotWnd.nameMetaText = nil
UI.HelpList_SlotWnd.bMouseOver = false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HelpList_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.NAME ) 

end


--
function UI.HelpList_SlotWnd:F_Shutdown()

	if self.nameMetaText then
		self.nameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HelpList_SlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateMouseOver()
	self:UpdateMainAnimation()
	self:UpdateName( data )

end


--
function UI.HelpList_SlotWnd:UpdateName( data )

	local str = ""

	if data.slotType == UI.HelpListWnd.slotTypes.THEME then
		str = UI:HelpTheme2Str( data.theme.name )

	elseif data.slotType == UI.HelpListWnd.slotTypes.ROLE then

		local strName = UI:Role2Str( data.role )

		local hTex = UI:GetRoleIco( data.role )		
		local anim = "neutral"

		local strIco = string.format( "$effect [effectName hud_objectsMark_specIco][animation %s][sprite ico %s]$", anim, tostring( hTex ) )

		str = string.format( "%s%s", strIco, strName )

	else
		sys.log( "UI.HelpList_SlotWnd:UpdateName()[ERROR]: unhandled slot type: %s", tostring( data.slotType ) )
	end

	self.nameMetaText:SetText( str, true )

end


--
function UI.HelpList_SlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local curAnim = mainEffect:GetCurAnimation()
		local anim = self.bMouseOver and self.effectInfo.animMouseOver or self.effectInfo.animIdle

		if anim ~= curAnim then
			mainEffect:StartAnimation( anim )
		end

	end

end


--
function UI.HelpList_SlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.HelpList_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.bMouseOver
	self.bMouseOver = bMouseOver

	self:UpdateMainAnimation()

	if self.bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.HelpListWnd.sounds.selectItem )
	end

end


--
function UI.HelpList_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.HelpList_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.HelpList_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()
	self:UpdateMetaTextPos()

end


--
function UI.HelpList_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.HelpList_SlotWnd:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.NAME )	

end


--
function UI.HelpList_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end



-- --------------------------------------------------------------------------
-- UI.HelpList_SupportBtn
-- --------------------------------------------------------------------------

UI.HelpList_SupportBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "TextBtn3",

     	props =
     	{
     		name	= "HelpList_SupportBtn",
     	},

    },

	textId = "helpList_btnSupport_text",

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "helpList_btnSupport_text" ), text = UI:GetStringByName( "helpList_btnSupport_tooltip" ) },

	GetTooltipData = function ( self )
		return self.tooltipData
	end
}

-- --------------------------------------------------------------------------
-- UI.HelpList_FaqBtn
-- --------------------------------------------------------------------------

UI.HelpList_FaqBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "TextBtn3",

     	props =
     	{
     		name	= "HelpList_FaqBtn",
     	},
	},

	textId = "helpList_faqBtn_text",

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "helpList_faqBtn_text" ), text = UI:GetStringByName( "helpList_faqBtn_tooltip" ) },

	GetTooltipData = function ( self )
		return self.tooltipData
	end
}


-- --------------------------------------------------------------------------
-- UI.HelpList_ForumBtn
-- --------------------------------------------------------------------------

UI.HelpList_ForumBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "TextBtn3",

     	props =
     	{
     		name	= "HelpList_ForumBtn",
     	},
	},

	textId = "helpList_forumBtn_text",

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "helpList_forumBtn_text" ), text = UI:GetStringByName( "helpList_forumBtn_tooltip" ) },

	GetTooltipData = function ( self )
		return self.tooltipData
	end
}

-- --------------------------------------------------------------------------
-- UI.HelpList_WikiBtn
-- --------------------------------------------------------------------------

UI.HelpList_WikiBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "TextBtn3",

     	props =
     	{
     		name	= "HelpList_WikiBtn",
     	},
	},

	textId = "helpList_wikiBtn_text",

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "helpList_wikiBtn_text" ), text = UI:GetStringByName( "helpList_wikiBtn_tooltip" ) },

	GetTooltipData = function ( self )
		return self.tooltipData
	end
}

-- --------------------------------------------------------------------------
-- UI.HelpList_TutorialBtn
-- --------------------------------------------------------------------------

UI.HelpList_TutorialBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HelpList_TutorialBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
	LOCK_EFFECT	= 3,	
}

UI.HelpList_TutorialBtn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "TextBtn3",

 	props =
 	{
 		name			= "HelpList_TutorialBtn",
		isPrototype		= true,
 	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.HelpList_TutorialBtn.layers ),

		-- LOCK_EFFECT
		{
			id			= UI.HelpList_TutorialBtn.layers.LOCK_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "textBtn3_matchmaking",
				defaultAnimation	= "idle",
			}}
		}		
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.HelpList_TutorialBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.HelpList_TutorialBtn:Reset()

	self:SetBtnText( "" )
	self.tooltipData = nil
	self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
	self:Enable( true )	
	
end


--
function UI.HelpList_TutorialBtn:OnHangarPrepareStateChanged()

	self:UpdateLockEffect()

end


--
function UI.HelpList_TutorialBtn:OnChangeBattleShips()

	self:UpdateLockEffect()

end


--
function UI.HelpList_TutorialBtn:OnChangeSquad()

	self:UpdateLockEffect()

end


--
function UI.HelpList_TutorialBtn:FullUpdate()

	self:UpdateText()
	self:UpdateTooltip()
	self:UpdateLockEffect()

end


--
function UI.HelpList_TutorialBtn:GetTutorialId()

	return _G.MasterServer.TutorialStage[ self.tutorialName ] or -1

end


-- ---------------------------------
-- vars
-- ---------------------------------

UI.HelpList_TutorialBtn.tutorialName	= ""
UI.HelpList_TutorialBtn.tooltipData		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HelpList_TutorialBtn:F_PostLoad()

	UI.TextBtn3.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:Reset()

end


--
function UI.HelpList_TutorialBtn:UpdateText()

	local text = ""

	local tutorialId = self:GetTutorialId()
	if tutorialId ~= -1 then

		local strId = string.format( "helpList_btnTutorial_text_%d", tutorialId ) 
		text = UI:GetStringByName( strId )

	end

	self:SetBtnText( text )

end


--
function UI.HelpList_TutorialBtn:UpdateTooltip()

	self.tooltipData = nil

	local tutorialId = self:GetTutorialId()
	if tutorialId ~= -1 then

		self.tooltipData = {}
		self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE

		local strIdCaption = string.format( "helpList_btnTutorial_text_%d", tutorialId ) 
		self.tooltipData.caption = UI:GetStringByName( strIdCaption )


		local strIdText = string.format( "helpList_btnTutorial_tooltip_%d", tutorialId ) 
		self.tooltipData.text = UI:GetStringByName( strIdText )

	end	

end


--
function UI.HelpList_TutorialBtn:UpdateLockEffect()

	local hangarPrepareState = UI.HangarWnd:GetPrepareState()
	local bMatchmaking = UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE
	local bInSquad = UI.serverData.squad and UI.serverData.squad.inSquad

	local bShipsInBattle = false

	for slotIdx, vid in pairs( UI.serverData.battleSlots ) do
		if vid ~= UI.INVALID_U64_ID then

			local shipItem = UI:GetShipItem( vid )
			if shipItem and shipItem.lockedInGame ~= UI.INVALID_U64_ID then

				bShipsInBattle = true
				break

			end

		end
	end

	local bLock = bMatchmaking or bShipsInBattle or bInSquad
	self:SetLayerVisible( bLock, self.layers.LOCK_EFFECT )
	self:Enable( not bLock )

end


-- ----------------------------------------------------------------------------------
-- UI.HelpList_TutorialBtn_1
-- ----------------------------------------------------------------------------------

UI.HelpList_TutorialBtn_1 =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "HelpList_TutorialBtn",

     	props =
     	{
     		name			= "HelpList_TutorialBtn_1",
     	},
    },

	tutorialName = "TUT_STAGE_1",
}

-- ------------------------------------------------------------------------
-- UI.HelpList_CrossBtn
-- ------------------------------------------------------------------------

UI.HelpList_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "HelpList_CrossBtn"
		}
	}
}