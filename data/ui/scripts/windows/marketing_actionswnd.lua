-- ------------------------------------------------------------
-- UI.Marketing_ActionsWnd
-- ------------------------------------------------------------

UI.Marketing_ActionsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Marketing_ActionsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Marketing_ActionsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "marketing_actions_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "action_list",
						wnd			= "UI.Marketing_Actions_ActionsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "action_pic",
						layer		= "UI.Marketing_ActionsWnd.layers.SEL_ACTION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SEL_ACTION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_actions_selAction",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.Marketing_ActionsWnd.layers.SEL_ACTION_DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.Marketing_Actions_SelActionLinkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SEL_ACTION_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children =
	{
		"UI.Marketing_Actions_ActionsListWnd",
		"UI.Marketing_Actions_SelActionLinkBtn",
	}
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.Marketing_ActionsWnd:OnSaleAdvertLoaded()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.Marketing_ActionsWnd:GetActionName( actionId )
	
	if type( actionId ) ~= "number" then
		sys.log( "UI.Marketing_ActionsWnd:OpenAction()[ERROR]: invalid type of the 1-st parameter ('actionId'); 'number' expected, got '%s'", type( actionId ) )
		return
	end
	
	local sName = ""
	
	for recordIdx = 1, self.actionsListWnd:GetNumRecords() do
		local data = self.actionsListWnd:GetRecordData( recordIdx )
		if data.actionInfo.id == actionId then
			sName = data.actionInfo.name
			break
		end
	end
	
	if sName == "" then
		sys.log( "UI.Marketing_ActionsWnd:GetActionName()[ERROR]: cannot find action with id %d", actionId )
	end

	return sName
	
end


--
function UI.Marketing_ActionsWnd:GetLeadingActionId()
	
	local leadingActionId = nil
	
	for recordIdx = 1, self.actionsListWnd:GetNumRecords() do
		local data = self.actionsListWnd:GetRecordData( recordIdx )
		if data.actionInfo.leading then
			leadingActionId = data.actionInfo.id
			break
		end
	end

	return leadingActionId
	
end


--
function UI.Marketing_ActionsWnd:OpenAction( actionId )

	if not self:IsOnScreen() then
		sys.log( "UI.Marketing_ActionsWnd:OpenAction()[ERROR]: not on screen" )
		return
	end
	
	if type( actionId ) ~= "number" then
		sys.log( "UI.Marketing_ActionsWnd:OpenAction()[ERROR]: invalid type of the 1-st parameter ('actionId'); 'number' expected, got '%s'", type( actionId ) )
		return
	end
	
	local selRecordIdx = -1
	
	for recordIdx = 1, self.actionsListWnd:GetNumRecords() do
		local data = self.actionsListWnd:GetRecordData( recordIdx )
		if data.actionInfo.id == actionId then
			selRecordIdx = recordIdx
			break
		end
	end
	
	if selRecordIdx ~= -1 then
		self.actionsListWnd:SelectRecord( selRecordIdx )
	else
		sys.log( "UI.Marketing_ActionsWnd:OpenAction()[ERROR]: cannot find action with id %d", actionId )
	end

end


--
function UI.Marketing_ActionsWnd:GetSelActionId()

	local selActionId = -1

	local selActionInfo = self:GetSelActionInfo()
	if selActionInfo then
		selActionId = selActionInfo.id or -1
	end
	
	return selActionId

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.Marketing_ActionsWnd.layers =
{
	MAIN_EFFECT			= 0,
	SEL_ACTION_EFFECT	= 1,
	SEL_ACTION_DESC		= 2,
}

UI.Marketing_ActionsWnd.effectInfo =
{
	selAction =
	{
		nameLocator			= "title28",
		descLocator			= "description",
		linkBtnLocator		= "btn_1",
		pictureSpriteName	= "ico",
	}
}

UI.Marketing_ActionsWnd.sounds =
{	
	actionSelect		= UI.sounds.btnClick,
	selActionLinkClick	= UI.sounds.btnClick,
	openExternalLink	= UI.sounds.btnClick,
}

UI.Marketing_ActionsWnd.actionLinkTypes =
{
	HTTP			= 1,	-- открытие ссылки в интернет-броузере
	LICENSES		= 2,	-- открытие окна лицензий
	ACHIEVEMENTS	= 3,	-- открытие окна ачивментов с позиционированием на указанном ачивменте
	BUNDLES			= 4,	-- открытие окна бандлов без позиционирования на конкретном бандле
	BUNDLE			= 5,	-- открытие окна бандлов с позиционированием на указанном бандле
	SHIP			= 6,	-- открыите окна покупки корабля (если корабля нет) или окна экипировки
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Marketing_ActionsWnd.space_selActionDesc_selActionLinkBtn	= 0
UI.Marketing_ActionsWnd.space_selActionLinkBtn_selActionBtm		= 0
UI.Marketing_ActionsWnd.selActionEffectSize						= Vec2( 0, 0 )
UI.Marketing_ActionsWnd.selActionEffectPos						= Vec2( 0, 0 )
UI.Marketing_ActionsWnd.hMsgExternalLink						= UI.INVALID_UI_HANDLE
UI.Marketing_ActionsWnd.actionsListWnd							= nil
UI.Marketing_ActionsWnd.selActionLinkBtn						= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Marketing_ActionsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.actionsListWnd		= UI.Marketing_Actions_ActionsListWnd
	self.selActionLinkBtn	= UI.Marketing_Actions_SelActionLinkBtn

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )

end


--
function UI.Marketing_ActionsWnd:PrepareLayout()

	local selActionEffect			= UI:GetEffectFromLayer( self, self.layers.SEL_ACTION_EFFECT )

	local selActionEffectPos		= selActionEffect:GetPos()
	local selActionEffectSize		= selActionEffect and selActionEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local selActionDescPos			= selActionEffect and selActionEffect:GetObjPos( self.effectInfo.selAction.descLocator ) or Vec2( 0, 0 )
	local selActionDescSize			= selActionEffect and selActionEffect:GetObjSize( self.effectInfo.selAction.descLocator ) or Vec2( 0, 0 )
	local selActionLinkBtnPos		= selActionEffect and selActionEffect:GetObjPos( self.effectInfo.selAction.linkBtnLocator )
	local selActionLinkBtnHeight	= self.selActionLinkBtn:GetHeight()

    self.space_selActionDesc_selActionLinkBtn	= selActionLinkBtnPos.y - ( selActionDescPos.y + selActionDescSize.y )
    self.space_selActionLinkBtn_selActionBtm	= selActionEffectSize.y - ( selActionLinkBtnPos.y + selActionLinkBtnHeight )
	self.selActionEffectSize					= selActionEffectSize
	self.selActionEffectPos						= selActionEffectPos

	self:SetLayerLeft( selActionDescPos.x + selActionEffectPos.x, self.layers.SEL_ACTION_DESC )
	self:SetLayerWidth( selActionDescSize.x, self.layers.SEL_ACTION_DESC )
	
end


--
function UI.Marketing_ActionsWnd:Reset()

	self.actionsListWnd:Clear()

end


--
function UI.Marketing_ActionsWnd:FullUpdate()

	self:Reset()

	local actions = self:GetActions()

	for idx, actionInfo in ipairs( actions ) do
		local data = { actionInfo = actionInfo }
		self.actionsListWnd:AddRecord( data )
	end

	if self.actionsListWnd:GetNumRecords() > 0 then
		self.actionsListWnd:SelectRecord( 1 )
	end	

	self:CheckShowImportantAcionWnd()

end


--
function UI.Marketing_ActionsWnd:GetActions()

	local actions = {}

	local datas = UI.SaleAdvert:GetData()
	for id, data in ipairs( datas ) do

		local actionInfo =
		{
			id			= id,
			name		= "unknown",
			hTex		= UI.INVALID_RESOURCE_HANDLE,
			desc		= "",
			linkInfo	= nil,
			importantId	= nil,
			leading		= nil,
		}

		-- имя (обязательно)

    	if type( data.header ) == "string" then
    		if data.header ~= "" then
    			actionInfo.name = data.header
    		else
    			sys.log( "UI.Marketing_ActionsWnd:GetActions()[ERROR]: empty \"header\"" )
    		end
    	else
    		sys.log( "UI.Marketing_ActionsWnd:GetActions()[ERROR]: invalid type of \"header\"; \"string\" expected, got \"%s\"", type( data.header ) )
    	end

		-- текстура (обязательно)

    	if type( data.hTex ) == "number" then
			actionInfo.hTex = data.hTex
    	else
    		sys.log( "UI.Marketing_ActionsWnd:GetActions()[ERROR]: invalid type of \"hTex\"; \"number\" expected, got \"%s\"", type( data.hTex ) )
    	end

		-- описание (не обязательно)

    	if data.text ~= nil then
        	if type( data.text ) == "string" then
        		actionInfo.desc = data.text
        	else
        		sys.log( "UI.Marketing_ActionsWnd:GetActions()[ERROR]: invalid type of \"text\" for action \"%s\"; \"string\" or \"nil\" expected, got \"%s\"", tostring( data.header ), type( data.text ) )
        	end
		end

		-- ссылка (не обязательно)
		actionInfo.linkInfo = self:GetActionLinkInfo( data )

		-- важная акция (не обязательно)
		actionInfo.importantId = data.importantTimestamp
		
		-- акция с кнопкой-таймером (не обязательно)
		actionInfo.leading = data.leading

		table.insert( actions, actionInfo )

	end
	
	return actions

end


--
function UI.Marketing_ActionsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.Marketing_ActionsWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	UI.ImportantActionWnd:Hide()

end


--
function UI.Marketing_ActionsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Marketing_Actions_ActionSlotWnd" ) then

		if not wnd:IsSelected() then
			self.actionsListWnd:SelectRecord( wnd:GetRecord() )
			UI:PlayGlobalSound( self.sounds.actionSelect )
		end

	elseif wnd == self.selActionLinkBtn then		

		local actionInfo = self:GetSelActionInfo()
		if actionInfo then

    		local linkInfo = actionInfo.linkInfo
    		if linkInfo then		
    			self:OpenLink( linkInfo )
    		else
    			sys.log( "UI.Marketing_ActionsWnd:F_OnMouseLButtonDown()[ERROR]: no link info for sel action" )
    		end

		else
			sys.log( "UI.Marketing_ActionsWnd:F_OnMouseLButtonDown()[ERROR]: no selected action" )
		end

	end

	return true

end


--
function UI.Marketing_ActionsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.actionsListWnd or wnd:IsChildOf( self.actionsListWnd ) then
		self.actionsListWnd:Scroll( ticks < 0, 1 --[[math.abs( ticks )]] )
	end

	return true

end


--
function UI.Marketing_ActionsWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == self.actionsListWnd:GetUiHandle() then
		self:OnSelActionChanged()
	end

end


--
function UI.Marketing_ActionsWnd:OnSelActionChanged()

	self:UpdateSelActionControls()

end


--
function UI.Marketing_ActionsWnd:ResetSelActionControls()
	
	self:SetLayerVisible( false, self.layers.SEL_ACTION_EFFECT )

	-- недостаточно сделать слой невидимым,
	-- нужно также убрать из него текстуру, чтобы у нее уменьшился счетчик ссылок, и она бы потом могла выгрузиться
	local selActionEffect = UI:GetEffectFromLayer( self, self.layers.SEL_ACTION_EFFECT )
	if selActionEffect then
		selActionEffect:SetSpriteTexture( self.effectInfo.selAction.pictureSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.SEL_ACTION_DESC )

	self.selActionLinkBtn:UnlinkFromParent()	

end


--
function UI.Marketing_ActionsWnd:UpdateSelActionControls()

	self:ResetSelActionControls()

	local actionInfo = self:GetSelActionInfo()
	if not actionInfo then
		return
	end

	self:UpdateSelActionPicture( actionInfo )
	self:UpdateSelActionDesc( actionInfo )
	self:UpdateSelActionLinkBtn( actionInfo )

	self:RecalcSelActionControlsLayout()

end


--
function UI.Marketing_ActionsWnd:UpdateSelActionPicture( actionInfo )

	self:SetLayerVisible( true, self.layers.SEL_ACTION_EFFECT )

	local selActionEffect = UI:GetEffectFromLayer( self, self.layers.SEL_ACTION_EFFECT )
	if selActionEffect then
		selActionEffect:SetSpriteTexture( self.effectInfo.selAction.pictureSpriteName, actionInfo.hTex )
	end

end


--
function UI.Marketing_ActionsWnd:UpdateSelActionDesc( actionInfo )

	if actionInfo.desc ~= "" then
		self:SetLayerVisible( true, self.layers.SEL_ACTION_DESC )
		self:SetText( actionInfo.desc, self.layers.SEL_ACTION_DESC )
	else
		self:SetLayerVisible( false, self.layers.SEL_ACTION_DESC )
	end

end


--
function UI.Marketing_ActionsWnd:UpdateSelActionLinkBtn( actionInfo )

	if actionInfo.linkInfo then
		self:AddChild( self.selActionLinkBtn )
	else
		self.selActionLinkBtn:UnlinkFromParent()
	end

end


--
function UI.Marketing_ActionsWnd:RecalcSelActionControlsLayout()

	-- элементы рисуются столбиком, с привязкой к низу

	local btm = ( self.selActionEffectPos.y + self.selActionEffectSize.y ) - self.space_selActionLinkBtn_selActionBtm

	if self.selActionLinkBtn:IsChildOf( self ) then
		btm = btm - self.selActionLinkBtn:GetHeight() - self.space_selActionDesc_selActionLinkBtn
	end

	-- описание - позиция, размер

	if self:IsLayerVisible( self.layers.SEL_ACTION_DESC ) then

    	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.SEL_ACTION_DESC ), 10000000 )

        local descHeight = _G.MeasureText(
       		self:GetText( self.layers.SEL_ACTION_DESC ),
       		self:GetFont( self.layers.SEL_ACTION_DESC ),
        	formatRect,
       		self:GetTextFormatFlags( self.layers.SEL_ACTION_DESC ),
        	formatRect ).w

		self:SetLayerHeight( descHeight, self.layers.SEL_ACTION_DESC )

		local descY = btm - descHeight
		self:SetLayerTop( descY, self.layers.SEL_ACTION_DESC )

	end

end


--
function UI.Marketing_ActionsWnd:GetSelActionInfo()

	local actionInfo = nil

	local selRecordIdx = self.actionsListWnd:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		local data = self.actionsListWnd:GetRecordData( selRecordIdx )
		actionInfo = data.actionInfo
	end

	return actionInfo

end


--
function UI.Marketing_ActionsWnd:GetActionLinkInfo( actionData )

	local linkInfo =
	{
		linkType	= -1,
		achvId		= nil,	-- используеся в типе ACHIEVEMENTS
		url			= nil,	-- используеся в типе HTTP
		defName		= nil,	-- используеся в типе BUNDLE
	}

	local strLink = actionData.url

	if strLink ~= nil then
		if type( strLink ) ~= "string" then
			sys.log( "UI.Marketing_ActionsWnd:GetActionLinkInfo()[ERROR]: invalid type of \"url\"; \"string\" or \"nil\" expected, got \"%s\"", type( strLink ) )
			strLink = nil
		end
	end

	if not UI:IsStrEmpty( strLink ) then

		if strLink == "[premiumTime]" then
			linkInfo.linkType = self.actionLinkTypes.LICENSES

		elseif strLink == "[bundles]" then
			linkInfo.linkType = self.actionLinkTypes.BUNDLES

		else

			local achvName = string.match( strLink, "^%[achievements%-(.*)%]$" )
			if achvName then

				linkInfo.linkType	= self.actionLinkTypes.ACHIEVEMENTS
				linkInfo.achvId		= -1

				local achvId = ai.AchievementId[ achvName ]
				if achvId then
					linkInfo.achvId = achvId
				else
					sys.log( "UI.Marketing_ActionsWnd:GetActionLinkInfo()[ERROR]: invalid achievement name: \"%s\"", achvName )
				end

			end

			if linkInfo.linkType == -1 then

    			local bundleDefName = string.match( strLink, "^%[bundles%-(.*)%]$" )
    			if bundleDefName then

    				linkInfo.linkType	= self.actionLinkTypes.BUNDLE
    				linkInfo.defName	= bundleDefName

					if bundleDefName == "" then
						sys.log( "UI.Marketing_ActionsWnd:GetActionLinkInfo()[ERROR]: empty bundle def name" )
					end

    			end

			end
			
			if linkInfo.linkType == -1 then

				local shipDefName = string.match( strLink, "^%[ship%-(.*)%]$" )
				if shipDefName then
	
					linkInfo.linkType	= self.actionLinkTypes.SHIP
					linkInfo.defName	= shipDefName
	
					if shipDefName == "" then
						sys.log( "UI.Marketing_ActionsWnd:GetActionLinkInfo()[ERROR]: empty ship def name" )
					end
	
				end

			end

			if linkInfo.linkType == -1 then
				linkInfo.linkType	= self.actionLinkTypes.HTTP
				linkInfo.url		= strLink
			end

		end

	end

	if linkInfo.linkType ~= -1 then
		return linkInfo
	else
		return nil
	end

end


--
function UI.Marketing_ActionsWnd:OpenLink( linkInfo )

	if not linkInfo then
		sys.log( "UI.Marketing_ActionsWnd:OpenLink()[ERROR]: nill linkInfo" )
		return
	end

	if linkInfo.linkType == self.actionLinkTypes.HTTP then

		if string.find( linkInfo.url, "https://online.gaijin.ru" ) == 1 or string.find( linkInfo.url, "https://online.gaijinent.com" ) == 1 then
			_G.MasterServer_SignInAndRerirectGaijin( linkInfo.url )
		else
			_G.ShellExecute( linkInfo.url )
		end

		UI:PlayGlobalSound( self.sounds.openExternalLink )

	elseif linkInfo.linkType == self.actionLinkTypes.LICENSES then
		UI.HangarWnd:ShowLicenses( true )

	elseif linkInfo.linkType == self.actionLinkTypes.ACHIEVEMENTS then
		UI.HangarWnd:ShowAchievement( linkInfo.achvId )

	elseif linkInfo.linkType == self.actionLinkTypes.BUNDLES then
		UI.HangarWnd:ShowBundles( true, nil )

	elseif linkInfo.linkType == self.actionLinkTypes.BUNDLE then
		UI.HangarWnd:OpenBundle( linkInfo.defName, true, nil )
		
	elseif linkInfo.linkType == self.actionLinkTypes.SHIP then
	
		local shipItem = nil
		
		if UI:IsShipEvolving( linkInfo.defName ) then
			shipItem = UI:GetEvolvingShipItem( linkInfo.defName )
		else
			shipItem = UI:GetShipItemByDef( linkInfo.defName, false )
		end
		
		if shipItem then
		
			UI.HangarWnd:ShowShipEquipment( shipItem.vid )
			
		else
		
			local launchData =
			{
				bActions			= true,
				selActionId			= self:GetSelActionId(),
				marketingLaunchData	= UI.MarketingWnd:GetLaunchData(),
			}
		
			if UI:IsShipEvolving( linkInfo.defName ) then
				UI.HangarWnd:OpenShips( linkInfo.defName, true, true, nil, launchData )
				
			elseif UI:IsShipCraftable( linkInfo.defName ) then
				UI.HangarWnd:ShowShipCraft( linkInfo.defName, launchData, nil )
				
			else
				UI.HangarWnd:ShowShipBuyWnd( linkInfo.defName, launchData, true )
			end
			
		end

	else
		sys.log( "UI.Marketing_ActionsWnd:OpenLink()[ERROR]: unhandled link type %s", tostring( linkInfo.linkType ) )
	end

end


--
function UI.Marketing_ActionsWnd:CheckShowImportantAcionWnd()

	UI.ImportantActionWnd:Hide()

	local importantActionInfo = nil

	if self.actionsListWnd:GetNumRecords() > 0 then

		local data = self.actionsListWnd:GetRecordData( 1 )

		if data.actionInfo.importantId ~= nil then
			if UI.serverData.userData.lastImportantActionId ~= data.actionInfo.importantId then
				importantActionInfo = data.actionInfo
			end
		end

	end

	if importantActionInfo then

    	UI.ImportantActionWnd:Setup( importantActionInfo )
    	UI.ImportantActionWnd:Show()

		UI.serverData.userData.lastImportantActionId = importantActionInfo.importantId
		UI:SaveServerUserData()

	end

end


-- ------------------------------------------------------------
-- UI.ActionsListWnd
-- ------------------------------------------------------------

UI.ActionsListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ActionsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "ActionsListWnd",
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
				defName 			= "marketing_actions_actionsList",
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
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ActionsListWnd.btnPrototypeName			= "Marketing_Actions_ActionSlotWnd"
UI.ActionsListWnd.scrollBarPrototypeName	= "EffectScrollWnd_Vrt_2"
UI.ActionsListWnd.MAX_SLOTS					= 7
UI.ActionsListWnd.listStyle					= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.ActionsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_1_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

-- ------------------------------------------------------------
-- UI.Marketing_Actions_ActionsListWnd
-- ------------------------------------------------------------

UI.Marketing_Actions_ActionsListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ActionsListWnd",

    	props =
    	{
    		name	= "Marketing_Actions_ActionsListWnd",
    	},
    }
}

-- ------------------------------------------------------------
-- UI.Marketing_Actions_ActionSlotWnd
-- ------------------------------------------------------------

UI.Marketing_Actions_ActionSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.Marketing_Actions_ActionSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Marketing_Actions_ActionSlotWnd",
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
				defName 			= "marketing_actions_actionSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "price6",
						layer		= "UI.Marketing_Actions_ActionSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}	
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Marketing_Actions_ActionSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.anim_unsel )
	end

	self:SetText( "", self.layers.NAME )

end


--
function UI.Marketing_Actions_ActionSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList3_Btn.Select( self, false, false )

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.Marketing_Actions_ActionSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
}

UI.Marketing_Actions_ActionSlotWnd.effectInfo =
{
	main =
	{
		anim_unsel				= "idle",
		anim_unsel_mouseOver	= "over",
		anim_sel				= "select",
		anim_sel_mouseOver		= "select",
	}
}

UI.Marketing_Actions_ActionSlotWnd.sounds =
{
	mouseOver	= UI.sounds.btnMouseOver
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Marketing_Actions_ActionSlotWnd.bMouseOver	= false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.Marketing_Actions_ActionSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdateName( data )

end


--
function UI.Marketing_Actions_ActionSlotWnd:UpdateMainAnimation( data )

	local anim = ""

	if self:IsSelected() then
		anim = self.bMouseOver and self.effectInfo.main.anim_sel_mouseOver or self.effectInfo.main.anim_sel
	else
		anim = self.bMouseOver and self.effectInfo.main.anim_unsel_mouseOver or self.effectInfo.main.anim_unsel
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.Marketing_Actions_ActionSlotWnd:UpdateName( data )

	self:SetText( data.actionInfo.name, self.layers.NAME )
	
end


--
function UI.Marketing_Actions_ActionSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.Marketing_Actions_ActionSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Marketing_Actions_ActionSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.bMouseOver
	self.bMouseOver = bMouseOver

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Marketing_Actions_ActionSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Marketing_Actions_ActionSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ------------------------------------------------------------
-- UI.ActionLinkBtn
-- ------------------------------------------------------------

UI.ActionLinkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name		= "ActionLinkBtn",
			isPrototype	= true,
		}
	},

    textId = "saleadvert_window_button"
}

-- ------------------------------------------------------------
-- UI.Marketing_Actions_SelActionLinkBtn
-- ------------------------------------------------------------

UI.Marketing_Actions_SelActionLinkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ActionLinkBtn",

		props =
		{
			name	= "Marketing_Actions_SelActionLinkBtn",
		}
	},
}

-- ------------------------------------------------------------
-- UI.ImportantActionWnd
-- ------------------------------------------------------------

UI.ImportantActionWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ImportantActionWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "ImportantActionWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "blackBg",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "timer",
						layer		= "UI.ImportantActionWnd.layers.TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_actions_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "action_list",
						wnd			= "UI.ImportantAction_ActionsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "action_pic",
						layer		= "UI.ImportantActionWnd.layers.SEL_ACTION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SEL_ACTION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "marketing_actions_selAction",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.ImportantActionWnd.layers.SEL_ACTION_DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.ImportantAction_SelActionLinkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SEL_ACTION_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIMER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children =
	{
		"UI.ImportantAction_ActionsListWnd",
		"UI.ImportantAction_SelActionLinkBtn",
	}
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.ImportantActionWnd:Setup( actionInfo )

	self:Reset()

	self.actionInfo	= actionInfo	
	self.timer		= self.MAX_TIME

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.ImportantActionWnd.layers =
{
	MAIN_EFFECT			= 0,
	WORK_EFFECT			= 1,
	SEL_ACTION_EFFECT	= 2,
	SEL_ACTION_DESC		= 3,
	TIMER				= 4,
}

UI.ImportantActionWnd.effectInfo =
{
	selAction =
	{
		nameLocator			= "title28",
		descLocator			= "description",
		linkBtnLocator		= "btn_1",
		pictureSpriteName	= "ico",
	}
}

UI.ImportantActionWnd.MAX_TIME	= 5
UI.ImportantActionWnd.strTimer	= UI:GetStringByName( "importantAction_timer" )

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ImportantActionWnd.actionInfo							= nil

UI.ImportantActionWnd.space_selActionDesc_selActionLinkBtn	= 0
UI.ImportantActionWnd.space_selActionLinkBtn_selActionBtm	= 0
UI.ImportantActionWnd.space_selActionLeft_desc				= 0
UI.ImportantActionWnd.selActionEffectSize					= Vec2( 0, 0 )
UI.ImportantActionWnd.selActionEffectPos					= Vec2( 0, 0 )
UI.ImportantActionWnd.hMsgExternalLink						= UI.INVALID_UI_HANDLE
UI.ImportantActionWnd.actionsListWnd						= nil
UI.ImportantActionWnd.selActionLinkBtn						= nil
UI.ImportantActionWnd.timer									= -1

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ImportantActionWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.actionsListWnd		= UI.ImportantAction_ActionsListWnd
	self.selActionLinkBtn	= UI.ImportantAction_SelActionLinkBtn

	self:PrepareLayout()

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.ImportantActionWnd:PrepareLayout()

	local selActionEffect			= UI:GetEffectFromLayer( self, self.layers.SEL_ACTION_EFFECT )

	local selActionEffectPos		= selActionEffect:GetPos()
	local selActionEffectSize		= selActionEffect and selActionEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local selActionDescPos			= selActionEffect and selActionEffect:GetObjPos( self.effectInfo.selAction.descLocator ) or Vec2( 0, 0 )
	local selActionDescSize			= selActionEffect and selActionEffect:GetObjSize( self.effectInfo.selAction.descLocator ) or Vec2( 0, 0 )
	local selActionLinkBtnPos		= selActionEffect and selActionEffect:GetObjPos( self.effectInfo.selAction.linkBtnLocator )
	local selActionLinkBtnHeight	= self.selActionLinkBtn:GetHeight()

    self.space_selActionDesc_selActionLinkBtn	= selActionLinkBtnPos.y - ( selActionDescPos.y + selActionDescSize.y )
    self.space_selActionLinkBtn_selActionBtm	= selActionEffectSize.y - ( selActionLinkBtnPos.y + selActionLinkBtnHeight )
	self.space_selActionLeft_desc				= selActionDescPos.x
	self.selActionEffectSize					= selActionEffectSize
	self.selActionEffectPos						= selActionEffectPos

	self:SetLayerWidth( selActionDescSize.x, self.layers.SEL_ACTION_DESC )
	
end


--
function UI.ImportantActionWnd:Reset()

	self.actionInfo	= nil
	self.timer		= -1

	self:SetText( "", self.layers.TIMER )
	self.actionsListWnd:Clear()
	self:ResetSelActionControls()

end


--
function UI.ImportantActionWnd:FullUpdate()

	self:RecalcWorkEffectPos()

	if not self.actionInfo then
		return
	end

	self:UpdateAction()
	self:UpdateTimerText()

end


--
function UI.ImportantActionWnd:RecalcWorkEffectPos()

	local pos = UI:ZeroVec2()

	if UI.Marketing_ActionsWnd:IsOnScreen() then
		pos.x = UI.Marketing_ActionsWnd:GetParent():XToScreen( UI.Marketing_ActionsWnd:GetLeft() )
		pos.y = UI.Marketing_ActionsWnd:GetParent():YToScreen( UI.Marketing_ActionsWnd:GetTop() )		
	else
		sys.log( "UI.ImportantActionWnd:RecalcWorkEffectPos()[ERROR]: actions is not on screen" )
	end

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetPos( pos )
	end	

end


--
function UI.ImportantActionWnd:UpdateAction()

	self.actionsListWnd:Clear()
	self:ResetSelActionControls()

	local data = { actionInfo = self.actionInfo }
	self.actionsListWnd:AddRecord( data )
	self.actionsListWnd:SelectRecord( 1 )

	self:UpdateSelActionControls()

end


--
function UI.ImportantActionWnd:ResetSelActionControls()
	
	self:SetLayerVisible( false, self.layers.SEL_ACTION_EFFECT )

	-- недостаточно сделать слой невидимым,
	-- нужно также убрать из него текстуру, чтобы у нее уменьшился счетчик ссылок, и она бы потом могла выгрузиться
	local selActionEffect = UI:GetEffectFromLayer( self, self.layers.SEL_ACTION_EFFECT )
	if selActionEffect then
		selActionEffect:SetSpriteTexture( self.effectInfo.selAction.pictureSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.SEL_ACTION_DESC )

	self.selActionLinkBtn:UnlinkFromParent()	

end


--
function UI.ImportantActionWnd:UpdateSelActionControls()

	self:ResetSelActionControls()

	self:UpdateSelActionPicture()
	self:UpdateSelActionDesc()
	self:UpdateSelActionLinkBtn()

	self:RecalcSelActionControlsLayout()

end


--
function UI.ImportantActionWnd:UpdateSelActionPicture()

	self:SetLayerVisible( true, self.layers.SEL_ACTION_EFFECT )

	local selActionEffect = UI:GetEffectFromLayer( self, self.layers.SEL_ACTION_EFFECT )
	if selActionEffect then
		selActionEffect:SetSpriteTexture( self.effectInfo.selAction.pictureSpriteName, self.actionInfo.hTex )
	end

end


--
function UI.ImportantActionWnd:UpdateSelActionDesc()

	if self.actionInfo.desc ~= "" then
		self:SetLayerVisible( true, self.layers.SEL_ACTION_DESC )
		self:SetText( self.actionInfo.desc, self.layers.SEL_ACTION_DESC )
	else
		self:SetLayerVisible( false, self.layers.SEL_ACTION_DESC )
	end

end


--
function UI.ImportantActionWnd:UpdateSelActionLinkBtn()

	if self.actionInfo.linkInfo then
		self:AddChild( self.selActionLinkBtn )
	else
		self.selActionLinkBtn:UnlinkFromParent()
	end

end


--
function UI.ImportantActionWnd:RecalcSelActionControlsLayout()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	local workEffectPos = workEffect and workEffect:GetPos() or Vec2( 0, 0 )

	-- элементы рисуются столбиком, с привязкой к низу

	local btm = ( self.selActionEffectPos.y + self.selActionEffectSize.y ) - self.space_selActionLinkBtn_selActionBtm + workEffectPos.y

	if self.selActionLinkBtn:IsChildOf( self ) then
		btm = btm - self.selActionLinkBtn:GetHeight() - self.space_selActionDesc_selActionLinkBtn
	end

	-- описание - позиция, размер

	if self:IsLayerVisible( self.layers.SEL_ACTION_DESC ) then

    	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.SEL_ACTION_DESC ), 10000000 )

        local descHeight = _G.MeasureText(
       		self:GetText( self.layers.SEL_ACTION_DESC ),
       		self:GetFont( self.layers.SEL_ACTION_DESC ),
        	formatRect,
       		self:GetTextFormatFlags( self.layers.SEL_ACTION_DESC ),
        	formatRect ).w

		self:SetLayerHeight( descHeight, self.layers.SEL_ACTION_DESC )

		local descY = btm - descHeight
		self:SetLayerTop( descY, self.layers.SEL_ACTION_DESC )

		self:SetLayerLeft( workEffectPos.x + self.selActionEffectPos.x + self.space_selActionLeft_desc, self.layers.SEL_ACTION_DESC )

	end

end


--
function UI.ImportantActionWnd:UpdateTimerText()

	local str = ""

	if self.timer ~= -1 then

		local strTimeVal = string.format( "%d %s", UI:Round( self.timer ), UI.strSecs )

		local numSubst = 0
		str, numSubst = string.gsub( self.strTimer, "%$time%$", strTimeVal )

		if numSubst == 0 then
			str = string.format( "[INVALID STRING] Available after %s", strTimeVal )
		end
		
	end	

	self:SetText( str, self.layers.TIMER )

end


--
function UI.ImportantActionWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimer( dt_sys )

end


--
function UI.ImportantActionWnd:UpdateTimer( dt )

	if self.timer == -1 then
		return
	end

	self.timer = self.timer - dt

	local bStop = false

	if self.timer <= 0 then
		self.timer = 0
		bStop = true
	end

	self:UpdateTimerText()

	if bStop then
		self.timer = -1
		self:Hide()
	end

end


--
function UI.ImportantActionWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.selActionLinkBtn then		

		local linkInfo = self.actionInfo.linkInfo
		if linkInfo then		
			UI.Marketing_ActionsWnd:OpenLink( linkInfo )
			self:Hide()
		else
			sys.log( "UI.ImportantActionWnd:F_OnMouseLButtonDown()[ERROR]: no link info for sel action" )
		end

	end

	return true

end


--
function UI.ImportantActionWnd:OnEscape( key, controllerIdx )

	UI:ShowMainMenu()
	return true	

end


--
function UI.ImportantActionWnd:F_OnEventSaveUiState()

	self:Hide()

end


-- ------------------------------------------------------------
-- UI.ImportantAction_ActionsListWnd
-- ------------------------------------------------------------

UI.ImportantAction_ActionsListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ActionsListWnd",

    	props =
    	{
    		name	= "ImportantAction_ActionsListWnd",
    	},
    }
}

-- ------------------------------------------------------------
-- UI.ImportantAction_SelActionLinkBtn
-- ------------------------------------------------------------

UI.ImportantAction_SelActionLinkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ActionLinkBtn",

		props =
		{
			name	= "ImportantAction_SelActionLinkBtn",
		}
	},
}