-- ----------------------------------------------------------------------------
--
-- Workfile: bundlewowwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.BundleWowWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.BundleWowWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "BundleWowWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		rectAbs	= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "bundleWow_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bundle",
						layer		= "UI.BundleWowWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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
				defName 			= "bundleWow_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "etext_name",
						layer		= "UI.BundleWowWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "etext_info",
						layer		= "UI.BundleWowWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_ETEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "bundleWow_caption" ),

			spriteName			= "etext_name_sprite",
			spriteEffectLayer	= "UI.BundleWowWnd.layers.WORK_EFFECT",
		},  

		-- NAME
		{
			layerType		= UI.LAYER_ETEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			spriteName			= "etext_info_sprite",
			spriteEffectLayer	= "UI.BundleWowWnd.layers.WORK_EFFECT",
		},  
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

-- переметры - в том же формате, что и для нотификации SN_ITEM_PURCHASED
function UI.BundleWowWnd:ShowItems( params )

	if type( params ) ~= "table" then
		sys.log( "UI.BundleWowWnd:ShowItems()[ERROR]: invalid type of the 1-st parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
		return
	end

	if not UI.HangarWnd:IsOnScreen() then
		sys.log( "UI.BundleWowWnd:ShowItems()[ERROR]: cannot show - UI.HangarWnd is not on screen" )
		return
	end

	local items = self:ParseItems( params )
	if not next( items ) then
		return
	end

	for itemIdx, item in ipairs( items ) do
		self:AddItem( item )
	end

	if not self:IsOnScreen() then
		self:Show()
	end

	self:TryShowNextItem()

end


--
function UI.BundleWowWnd:MasterServer_OnNotification( notificationId, params )

	if type( notificationId ) ~= "number" then
		sys.log( "UI.BundleWowWnd:MasterServer_OnNotification()[ERROR]: invalid type of the 1-st parameter (\"notificationId\"); \"number\" expected, got \"%s\"", type( notificationId ) )
		return
	end

	if	notificationId ~= _G.MasterServer.ServerNotification.SN_ITEM_PURCHASED and
		notificationId ~= _G.MasterServer.ServerNotification.SN_BONUS_BUNDLE then
			return
	end
	
	
	local bundleDefName = ""
	
	if notificationId == _G.MasterServer.ServerNotification.SN_ITEM_PURCHASED then
		bundleDefName = type( params.defName ) == "string" and params.defName or ""	
	elseif notificationId == _G.MasterServer.ServerNotification.SN_BONUS_BUNDLE then
		bundleDefName = _G.GameStore_GetBonusBundleDef()
	else
		sys.log( "UI.BundleWowWnd:MasterServer_OnNotification()[ERROR]: unhandled notification %d", notificationId )
	end
	
	if UI:NeedShowNotificationForBundle( bundleDefName ) then	--#0107019(0507181)
		self:ShowItems( params )
	end

end


--
function UI.BundleWowWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.BundleWowWnd:Hide()

	self:UnlinkFromParent()

end


-- ------------------------------
-- const
-- ------------------------------

UI.BundleWowWnd.layers =
{
    MAIN_EFFECT	= 0,
    WORK_EFFECT	= 1,
    CAPTION		= 2,
    NAME		= 3,
}

UI.BundleWowWnd.effectInfo =
{
	work =
	{
		itemIcoLocator			= "prod_icon_main",
		shipIcoLocator			= "ship_list_slot",
		shipPartLocator			= "parts_slot",
		specModulePartLocator	= "parts_slot",
	}
}

UI.BundleWowWnd.sounds =
{
	showItem = "sound/ui/achievement"	-- tODO: надо новый звук?
}

-- ------------------------------
-- vars
-- ------------------------------

UI.BundleWowWnd.items					= {}
UI.BundleWowWnd.curItemIdx				= -1
UI.BundleWowWnd.itemIcoWnd				= nil
UI.BundleWowWnd.shipIcoWnd				= nil
UI.BundleWowWnd.shipPartIcoWnd			= nil
UI.BundleWowWnd.specModulePartIcoWnd	= nil
UI.BundleWowWnd.nameMetaText			= nil
UI.BundleWowWnd.nameLayer				= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.BundleWowWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()

	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.NAME ) 	

	self.nameLayer = self:GetLayer( UI.LAYER_ETEXT, self.layers.NAME, 0 )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.BundleWowWnd:F_Shutdown()

	if self.nameMetaText then
		self.nameMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BundleWowWnd:UpdateNameMetaTextPos()

	local etextRegionId = self.nameLayer:GetETexRegion()
	local etextRegionRect = UI.drawer:GetETexRegionTexRect( etextRegionId )
	
	self.nameMetaText:SetScreenOrg( UI:Vec2( etextRegionRect.x, etextRegionRect.y ) )

end


--
function UI.BundleWowWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.NAME then

		self:UpdateNameMetaTextPos()
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	end

end


--
function UI.BundleWowWnd:CreateControls()

	self.itemIcoWnd				= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.shipIcoWnd				= UI:CreateChildWnd( self, UI.ShipIcoWnd, "" )
	self.shipPartIcoWnd			= UI:CreateChildWnd( self, UI.ShipPartIcoWnd, "" )
	self.specModulePartIcoWnd	= UI:CreateChildWnd( self, UI.SpecModulePartIcoWnd, "" )

	-- чтобы тултип не показывался
	self.shipIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
	self.shipPartIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
	self.specModulePartIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )

end


--
function UI.BundleWowWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

end


--
function UI.BundleWowWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end    


--
function UI.BundleWowWnd:Reset()

	self.curItemIdx = -1
	self:ResetItemContent()

	self.items = {}

end


--
function UI.BundleWowWnd:ParseItems( params )

	local items = {}

	if type( params ) ~= "table" then
		sys.log( "UI.BundleWowWnd:ParseItems()[ERROR]: invalid type of notification params; \"table\" expected, got \"%s\"", type( params ) )
		return {}
	end

	return UI:GetBundleItemsFromNotification( params, true )

end


--
function UI.BundleWowWnd:AddItem( item )

	table.insert( self.items, item )

end


--
function UI.BundleWowWnd:TryShowNextItem()

	if self:IsCurItemAnimating() then
		return true
	end

	local nextItemIdx = self.curItemIdx == -1 and 1 or self.curItemIdx + 1

	if nextItemIdx <= #self.items then
		self:ShowItem( nextItemIdx )
		return true
	else
		return false
	end

end


--
function UI.BundleWowWnd:ShowItem( itemIdx )

	self.curItemIdx = itemIdx

	self:UpdateItemContent()
	self:PlayItemAnimation()
	
	if self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.showItem )
	end

	if not self:IsCurItemAnimating() then
		sys.log( "UI.BundleWowWnd:ShowItem()[ERROR]: fail to play item animation" )
		self:Hide()
	end

end


--
function UI.BundleWowWnd:ResetItemContent()

	self:ResetIco()
	self:SetLayerVisible( false, self.layers.WORK_EFFECT )
	self:SetLayerVisible( false, self.layers.CAPTION )
	self:SetLayerVisible( false, self.layers.NAME )

	self.nameMetaText:SetText( "", true )
	self.nameMetaText:SetAlpha( 255 )
	self:SetText( "", self.layers.NAME )

end


--
function UI.BundleWowWnd:UpdateItemContent()

	self:ResetItemContent()

	if self.curItemIdx == -1 then
		return
	end

	self:SetLayerVisible( true, self.layers.WORK_EFFECT )
	self:SetLayerVisible( true, self.layers.CAPTION )
	self:SetLayerVisible( true, self.layers.NAME )

	self:UpdateIco()
	self:UpdateName()

end


--
function UI.BundleWowWnd:UpdateIco()

	self:ResetIco()

	local item = self.items[ self.curItemIdx ]


    if item.type == ai.BundleContent.ITEM then

    	self:ShowItemIco()

		if item.defName ~= "" then
        	self.itemIcoWnd:SetupForItem( item.defName, item.bEnchanted )
		end


    elseif item.type == ai.BundleContent.VESSEL then

    	self:ShowShipIco()

		if item.defName ~= "" then
	    	self.shipIcoWnd:Setup( item.defName )
		end


    elseif item.type == ai.BundleContent.EXP then

    	self:ShowItemIco()

    	local hTex = UI:GetMailAttachmentSynergyFreeIco()
    	self.itemIcoWnd:SetupIco( hTex )


    elseif item.type == ai.BundleContent.CUSTOM_ELEMENT then

    	self:ShowItemIco()

    	local hTex = UI:GetTex( "bundleContent_CUSTOM_ELEMENT" )
    	self.itemIcoWnd:SetupIco( hTex )


    elseif item.type == ai.BundleContent.TITLE then

    	self:ShowItemIco()

    	local hTex = UI:GetMailAttachmentTitleIco()
    	self.itemIcoWnd:SetupIco( hTex )


    elseif item.type == ai.BundleContent.ACCOUNT_AURA then

    	self:ShowItemIco()

    	local hTex = UI:GetTex( "bundleContent_ACCOUNT_AURA" )
    	self.itemIcoWnd:SetupIco( hTex )


    elseif item.type == ai.BundleContent.INVENTORY_EXT then

    	self:ShowItemIco()

    	local hTex = UI:GetTex( "bundleContent_INVENTORY_EXT" )
    	self.itemIcoWnd:SetupIco( hTex )


    elseif item.type == ai.BundleContent.CRAFT_RESOURCE then

		if UI:IsDefShipPart( item.defName ) then

        	self:ShowShipPartIco()
			self.shipPartIcoWnd:Setup( item.defName )

		else

        	self:ShowItemIco()

    		if item.defName ~= "" then
            	self.itemIcoWnd:SetupForItem( item.defName )
    		end

		end


    elseif item.type == ai.BundleContent.BLUEPRINT then

    	self:ShowItemIco()

		if item.defName ~= "" then
        	self.itemIcoWnd:SetupForItem( item.defName )
		end

    elseif item.type == ai.BundleContent.VESSEL_BUDGET then

        self:ShowSpecModulePartIco()
		self.specModulePartIcoWnd:Setup( item.shipDefName )

    elseif item.type == ai.BundleContent.EVENT_CREDITS then

    	self:ShowItemIco()

    	local hTex = UI:GetMailAttachmentEventCreditsIco()
    	self.itemIcoWnd:SetupIco( hTex )
		
	elseif item.type == ai.BundleContent.AVATAR then
	
		self:ShowItemIco()
	
		local hTex = UI:GetAvatarTexture( item.defName )
		self.itemIcoWnd:SetupIco( hTex )
		
	elseif item.type == ai.BundleContent.MOTTO then
	
		self:ShowItemIco()
	
		local hTex = UI:GetMottoIco()
		self.itemIcoWnd:SetupIco( hTex )
		
	elseif item.type == ai.BundleContent.AUTOGEN then
	
		self:ShowItemIco()
		self.itemIcoWnd:SetupForAutogenItemNotRolled( item.autogenClassId, item.rank )
		
	elseif item.type == ai.BundleContent.PREMIUM then
	
		self:ShowItemIco()
		
		local hTex = UI:GetMailAttachmentPremiumIco()
		self.itemIcoWnd:SetupIco( hTex )
	
	end

end


--
function UI.BundleWowWnd:UpdateName()

	self.nameMetaText:SetText( "", true )
	self.nameMetaText:SetAlpha( 255 )
	self:SetText( "", self.layers.NAME )

	local item = self.items[ self.curItemIdx ]
	local str = UI:BundleItem2Str( item, false, self:GetColor( self.layers.NAME ) )

	if str ~= "" then

		self.nameMetaText:SetAlpha( UI:GetAlpha( self:GetColor( self.layers.NAME ) ) )
		self.nameMetaText:SetText( str, true )

		-- наряду с установкой текста в self.nameMetaText, этот же текст устанавливается и в слой;
		-- хотя сам слой рисоваться не будет, но зато он начнет хэндлить необходимый для отрисовки "е-текста" регион в специальной текстуре,
		-- в противном случае это пришлось бы делать здесь вручную

		self:SetText( self.nameMetaText:GetFormattedText(), self.layers.NAME )

	end

end


--
function UI.BundleWowWnd:ShowItemIco()

	if self.shipIcoWnd:IsChildOf( self ) then
		self.shipIcoWnd:Reset()
		self:RemoveControl( self.shipIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.shipPartIcoWnd:IsChildOf( self ) then
		self.shipPartIcoWnd:Reset()
		self:RemoveControl( self.shipPartIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.specModulePartIcoWnd:IsChildOf( self ) then
		self.specModulePartIcoWnd:Reset()
		self:RemoveControl( self.specModulePartIcoWnd, self.layers.WORK_EFFECT )
	end

	self:AddControl( self.itemIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.itemIcoLocator )

end


--
function UI.BundleWowWnd:ShowShipIco()

	if self.itemIcoWnd:IsChildOf( self ) then
		self.itemIcoWnd:Reset()
		self:RemoveControl( self.itemIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.shipPartIcoWnd:IsChildOf( self ) then
		self.shipPartIcoWnd:Reset()
		self:RemoveControl( self.shipPartIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.specModulePartIcoWnd:IsChildOf( self ) then
		self.specModulePartIcoWnd:Reset()
		self:RemoveControl( self.specModulePartIcoWnd, self.layers.WORK_EFFECT )
	end

	self:AddControl( self.shipIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.shipIcoLocator )

end


--
function UI.BundleWowWnd:ShowShipPartIco()

	if self.itemIcoWnd:IsChildOf( self ) then
		self.itemIcoWnd:Reset()
		self:RemoveControl( self.itemIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.shipIcoWnd:IsChildOf( self ) then
		self.shipIcoWnd:Reset()
		self:RemoveControl( self.shipIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.specModulePartIcoWnd:IsChildOf( self ) then
		self.specModulePartIcoWnd:Reset()
		self:RemoveControl( self.specModulePartIcoWnd, self.layers.WORK_EFFECT )
	end

	self:AddControl( self.shipPartIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.shipPartLocator )

end


--
function UI.BundleWowWnd:ShowSpecModulePartIco()

	if self.itemIcoWnd:IsChildOf( self ) then
		self.itemIcoWnd:Reset()
		self:RemoveControl( self.itemIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.shipIcoWnd:IsChildOf( self ) then
		self.shipIcoWnd:Reset()
		self:RemoveControl( self.shipIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.shipPartIcoWnd:IsChildOf( self ) then
		self.shipPartIcoWnd:Reset()
		self:RemoveControl( self.shipPartIcoWnd, self.layers.WORK_EFFECT )
	end

	self:AddControl( self.specModulePartIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.specModulePartLocator )

end



--
function UI.BundleWowWnd:ResetIco()

	if self.itemIcoWnd:IsChildOf( self ) then
		self.itemIcoWnd:Reset()
		self:RemoveControl( self.itemIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.shipIcoWnd:IsChildOf( self ) then
		self.shipIcoWnd:Reset()
		self:RemoveControl( self.shipIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.shipPartIcoWnd:IsChildOf( self ) then
		self.shipPartIcoWnd:Reset()
		self:RemoveControl( self.shipPartIcoWnd, self.layers.WORK_EFFECT )
	end

	if self.specModulePartIcoWnd:IsChildOf( self ) then
		self.specModulePartIcoWnd:Reset()
		self:RemoveControl( self.specModulePartIcoWnd, self.layers.WORK_EFFECT )
	end

end


--
function UI.BundleWowWnd:PlayItemAnimation()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:RestartAnimation()
	end

end


--
function UI.BundleWowWnd:F_OnEffectAnimationEnded( effect, animName )
 
	if effect == UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT ) then
		self:OnItemHide()
	end

end


--
function UI.BundleWowWnd:OnItemHide()

	if not self:TryShowNextItem() then

		self:Reset()
		self:Hide()

	end

end


--
function UI.BundleWowWnd:IsCurItemAnimating()

	if self.curItemIdx == -1 then
		return false
	end

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	return workEffect ~= nil and workEffect:IsAnimationPlaying()

end


--
function UI.BundleWowWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateNameAlpha()

end


--
function UI.BundleWowWnd:UpdateNameAlpha()

	if not self:IsLayerVisible( self.layers.NAME ) then
		return
	end

	local alpha = UI:GetAlpha( self:GetColor( self.layers.NAME ) )

	if alpha ~= UI:GetAlpha( self.nameMetaText:GetColor() ) then
		self.nameMetaText:SetAlpha( alpha )
	end

end


--
function UI.BundleWowWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end


--
function UI.BundleWowWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	if not next( self.items ) then
		self:Hide()
		return
	end

	UI.store.BundleWowWnd =
	{
		items		= self.items,
		curItemIdx	= self.curItemIdx,
	}

end


--
function UI.BundleWowWnd:F_OnEventRestoreUiState()

	if UI.store.BundleWowWnd then

		self.items = UI.store.BundleWowWnd.items

		if UI.store.BundleWowWnd.curItemIdx ~= -1 then
			self:ShowItem( UI.store.BundleWowWnd.curItemIdx )
		end

		UI.store.BundleWowWnd = nil

	end

end