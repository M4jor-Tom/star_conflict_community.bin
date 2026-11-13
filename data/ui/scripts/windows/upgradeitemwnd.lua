-- ----------------------------------------------------------------------------
--
-- Workfile: upgradeitemwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.UpgradeItemWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

--
UI.UpgradeItemWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    UPGRADE_DESC	= 4,
    PARAMS			= 5,
    PRICE			= 6,
	WAIT_EFFECT		= 7,
	WAIT_TEXT		= 8,
}

--
UI.UpgradeItemWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "UpgradeItemWnd",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.UpgradeItemWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "buy_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.UpgradeItemWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.UpgradeItemWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "upgradeItem_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.UpgradeItemWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "product_name_2",	
						layer		= "UI.UpgradeItemWnd.layers.UPGRADE_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по размеру
					{
						objName		= "text",	
						layer		= "UI.UpgradeItemWnd.layers.PARAMS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price",	
						layer		= "UI.UpgradeItemWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "loading",
						layer		= "UI.UpgradeItemWnd.layers.WAIT_EFFECT",
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
			text			= UI:GetStringByName( "upgradeItem_caption" ),
		},

		-- UPGRADE_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PARAMS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP,
   			formatInfoSz	= { 2, 5 },
   			font			= { fontName = "Small" },
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.UpgradeItemWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_loading"
		}, 
	}
}

-- -------------------------------------
-- interface funtions
-- -------------------------------------

--
function UI.UpgradeItemWnd:Setup( iid, vid, equipSlot, bSound, customData )

	if type( iid ) ~= "userdata" then
		sys.log( "UI.UpgradeItemWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"iid\"); \"userdata\" expected, got \"%s\"", type( iid ) )
		return
	end

	if vid ~= nil then
    	if type( vid ) ~= "userdata" then
    		sys.log( "UI.UpgradeItemWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
    		vid = nil
    	end
	end

	if vid == nil then
		vid = UI.INVALID_U64_ID
	end

	if equipSlot ~= nil then
    	if type( equipSlot ) ~= "number" then
    		sys.log( "UI.UpgradeItemWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"equipSlot\"); \"number\" expected, got \"%s\"", type( equipSlot ) )
    		equipSlot = nil
    	end
	end

	if equipSlot == nil then
		equipSlot = -1
	end

	if bSound ~= nil then
    	if type( bSound ) ~= "boolean" then
    		sys.log( "UI.UpgradeItemWnd:Setup()[ERROR]: invalid type of the 4-th parameter (\"bSound\"); \"boolean\" expected, got \"%s\"", type( bSound ) )
    		bSound = nil
    	end
	end

	if bSound == nil then
		bSound = true
	end

	if vid ~= UI.INVALID_U64_ID and equipSlot == -1 then
		sys.log( "UI.UpgradeItemWnd:Setup()[ERROR]: vid is specified byt equip slot is not" )
		vid = UI.INVALID_U64_ID
	end

	self:Reset()
	
	self.iid		= iid
	self.vid		= vid
	self.equipSlot	= equipSlot
	self.bSound		= bSound
	self.customData	= customData

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.UpgradeItemWnd:GameStore_OnUpgradeItems( result, requestId, iids )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if requestId == self.upgradeRequestId then

			if self:IsOnScreen() then
				self:Hide()
			end
	
			-- технически окно может уже скрыться из-за особенностей реакции управляющего окна (напрммер, EquipmentWnd ) на F_OnEventInvItemsChanged(),
			-- поэтому вызывается без проверки на IsOnScreen()
			self:NotifyMainWnd( true )

		else

			if self:IsOnScreen() then
			
				local bNeedUpdate = false
				
				for idx, iid in pairs( iids ) do
					
					if iid == self.iid then
						bNeedUpdate = true
						break
					end
					
				end
				
				if bNeedUpdate then
					self:FullUpdate()
				end
				
			end

		end

	else

		if requestId == self.upgradeRequestId then
			self:ShowMsgOnUpgradeError( result )
		end

	end

	if requestId == self.upgradeRequestId then
		self.upgradeRequestId = 0
		self:UpdateWaitEffect()
	end

end


--
function UI.UpgradeItemWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.upgradeRequestId = 0
	self:UpdateWaitEffect()

end


--
function UI.UpgradeItemWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	-- это коллбэк может прийти после вызова апгрейда, но до прихода ответа на запрос апгрейда;
	-- к этому моменту может уже деф поменяться, и вообще предмет может стать уже максимально проапгрейженным;
	-- нет смысла реакции на него во время ожидания ответа на апгрейд, вся реакция будет там

	if self.upgradeRequestId ~= 0 then
		return
	end

	self:UpdatePrice()
	self:UpdateUpgradeBtn()

end


--
function UI.UpgradeItemWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	-- это коллбэк может прийти после вызова апгрейда, но до прихода ответа на запрос апгрейда;
	-- тут может уже деф поменяться, и вообще предмет может стать уже максимально проапгрейженным;
	-- нет смысла реакции на него во время ожидания ответа на апгрейд, вся реакция будет там

	if self.upgradeRequestId ~= 0 then
		return
	end

	self:FullUpdate()

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.UpgradeItemWnd.effectInfo =
{
	work =
	{
		itemIcoLocator		= "icon",
		cancelBtnLocator	= "button_2",
		upgradeBtnLocator	= "button_1",
		paramsLocator		= "text",
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
	}
}

UI.UpgradeItemWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
	upgrade	= "sound/ui/ModuleUpgrade",
}

UI.UpgradeItemWnd.mainWndName	= ""

-- -------------------------------------
-- vars
-- -------------------------------------

UI.UpgradeItemWnd.iid					= UI.INVALID_U64_ID
UI.UpgradeItemWnd.vid					= UI.INVALID_U64_ID
UI.UpgradeItemWnd.equipSlot				= -1
UI.UpgradeItemWnd.bSound				= true
UI.UpgradeItemWnd.customData			= nil

UI.UpgradeItemWnd.itemIcoWnd			= nil
UI.UpgradeItemWnd.cancelBtn				= nil
UI.UpgradeItemWnd.upgradeBtn			= nil
UI.UpgradeItemWnd.priceMetaText			= nil
UI.UpgradeItemWnd.upgradeRequestId		= 0
UI.UpgradeItemWnd.space_params_btm		= 0
UI.UpgradeItemWnd.workMinHeight			= 0
UI.UpgradeItemWnd.workMaxHeight			= 0

-- -------------------------------------
-- work funtions
-- -------------------------------------

--
function UI.UpgradeItemWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

	self:PrepareLayout()

	self:HideWaitEffect()	

end


--
function UI.UpgradeItemWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.UpgradeItemWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.UpgradeItemWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.UpgradeItemWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.UpgradeItemWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.UpgradeItemWnd:CreateControls()

	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.cancelBtn		= UI:CreateChildWnd( self, UI.TextBtn4, "" )
	self.upgradeBtn		= UI:CreateChildWnd( self, UI.UpgradeItem_UpgradeBtn )

	self:AddControl( self.itemIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.itemIcoLocator )
	self:AddControl( self.upgradeBtn, self.layers.WORK_EFFECT, self.effectInfo.work.upgradeBtnLocator )

	self:AddControl( self.cancelBtn, self.layers.WORK_EFFECT, self.effectInfo.work.cancelBtnLocator )
	self.cancelBtn:SetBtnText( UI:GetStringByName( "upgradeItem_cancelBtn" ) )

end


--
function UI.UpgradeItemWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

end


--
function UI.UpgradeItemWnd:RemoveControl( wnd, effectLayer )

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
function UI.UpgradeItemWnd:Reset()

	self.iid		= UI.INVALID_U64_ID
	self.vid		= UI.INVALID_U64_ID
	self.equipSlot	= -1
	self.bSound		= true
	self.customData	= nil

	self.itemIcoWnd:Reset()
	self.upgradeBtn:Reset()

	self:SetText( "", self.layers.UPGRADE_DESC )
	self:SetText( "", self.layers.PARAMS )
	self.priceMetaText:SetText( "", true )

end


--
function UI.UpgradeItemWnd:FullUpdate()

	if self.iid == UI.INVALID_U64_ID then
		return
	end

	self:UpdateItemIco()
	self:UpdateUpgradeDesc()
	self:UpdateParams()
	self:UpdatePrice()
	self:UpdateUpgradeBtn()

	self:RecalcLayout()

end


--
function UI.UpgradeItemWnd:UpdateItemIco()

	self.itemIcoWnd:Reset()

	local defName = UI:Iid2DefName( self.iid )
	local nextDefName = UI:GetItemUpgradeNextDef( defName )

	self.itemIcoWnd:SetupForItem( nextDefName, self:WillBeEnchanted() )

	local tooltipData = {}

	tooltipData.tooltipType	= UI.tooltipTypes.MODULE
	tooltipData.defName		= nextDefName

	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.UpgradeItemWnd:UpdateUpgradeDesc()

	local defName = UI:Iid2DefName( self.iid )	

	local nextDefName = UI:GetItemUpgradeNextDef( defName )
	local nextMark = UI:GetItemQuality( nextDefName )

	local nextMarkColor = UI:GetItemQualityColor( nextMark )
	local baseColor = self:GetColor( self.layers.UPGRADE_DESC )

	local strNextMark = UI:ItemQuality2Str( nextMark )
	strNextMark = string.format( "%s%s%s", UI:Color2Str( nextMarkColor ), strNextMark, UI:Color2Str( baseColor ) )	

	local str = UI:GetStringByName( "upgradeItem_upgradeDesc" )
	str = string.gsub( str, "%$new_level%$", strNextMark )

	self:SetText( str, self.layers.UPGRADE_DESC )	

end


--
function UI.UpgradeItemWnd:UpdateParams()

	local defName		= UI:Iid2DefName( self.iid )	
	local nextDefName	= UI:GetItemUpgradeNextDef( defName )

	local deltaInfos = UI:GetItemParamDeltas( nextDefName, defName, true, self.vid, self.equipSlot, self:GetColor( self.layers.PARAMS ) )

	local baseColor = self:GetColor( self.layers.PARAMS )
	local strBaseColor = UI:Color2Str( baseColor )

	local str = ""

	for deltaIdx = 1, #deltaInfos do

		local deltaInfo = deltaInfos[ deltaIdx ]

		local strName = UI:ItemParam2Str( deltaInfo.paramInfo )
		local strParam = string.format( "%s: %s%s", strName, deltaInfo.strDelta, strBaseColor )

		if str == "" then
			str = strParam
		else
			str = string.format( "%s%s%s", str, "|", strParam )
		end				

	end

	local bEnchanted = UI:IsInventoryItemEnchantedById( self.iid )
	if not bEnchanted then

    	if self:WillBeEnchanted() then

        	local bonus = UI:GetEnchantedItemSynergyBonusByDefName( defName )
        	if bonus ~= 0 then

        		bonus = UI:Round( bonus * 100 )
        		local strBonusVal = string.format( "%d%%", bonus )

        		local strBonus = UI:GetStringByName( "moduleTooltip_enchantedSynergyBonus" )

        		local tSubst =
        		{
        			val	= strBonusVal
        		}

        		strBonus = string.gsub( strBonus, "%$(.-)%$", tSubst )

        		str = string.format( "%s|%s%s", str, UI:Color2Str( UI.GOLD_COLOR ), strBonus )

        	end

    	end

	end

	self:SetText( str, self.layers.PARAMS )
	
end  


--
function UI.UpgradeItemWnd:UpdatePrice()

	local priceInfo = self:GetPrice()
	local str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, nil )
	self.priceMetaText:SetText( str, true )

end


--
function UI.UpgradeItemWnd:UpdateUpgradeBtn()

	self.upgradeBtn:Setup( self:GetPrice() )

end


--
function UI.UpgradeItemWnd:GetPrice()

	local priceInfo = {}

	priceInfo.priceType 	= _G.GameStore.CreditsType.CT_CREDITS
	priceInfo.val			= UI:GetItemUpgradeCreditsPrice( UI:Iid2DefName( self.iid )	 )
	priceInfo.bIsBuyPrice	= true
	priceInfo.basePrice		= priceInfo.val

	return priceInfo

end


-- TODO: уточнить, сохраняется ли позолоченность при апгрейде (вопрос 45)
function UI.UpgradeItemWnd:WillBeEnchanted()

	return UI:IsInventoryItemEnchantedById( self.iid )

end


--
function UI.UpgradeItemWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.cancelBtn then
		self:OnCancel()

	elseif wnd == self.upgradeBtn then

		local btnState = wnd:GetState()

		if btnState == UI.UpgradeItem_UpgradeBtn.states.UPGRADE then
			self:TryUpgrade()

		elseif btnState == UI.UpgradeItem_UpgradeBtn.states.REFILL then
			self:OnRefillMoney( wnd:GetPriceInfo() )
		end

	end

	return true

end


--
function UI.UpgradeItemWnd:OnEscape()

	self:OnCancel()
	return true

end


--
function UI.UpgradeItemWnd:OnEnter()

	if self.upgradeBtn:GetState() == UI.UpgradeItem_UpgradeBtn.states.UPGRADE then
		self:TryUpgrade()
	end

	return true

end


--
function UI.UpgradeItemWnd:OnCancel()

	self:Hide()
	UI:PlayGlobalSound( self.sounds.hide )

	self:NotifyMainWnd( false )

end


--
function UI.UpgradeItemWnd:OnRefillMoney( priceInfo )

	if priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS then
		UI.HangarWnd:ShowBuyCreditsWnd()
	else
		sys.log( "UI.UpgradeItemWnd:RefillMoney()[ERROR]: invalid refill money mode: %s", tostring( priceInfo.priceType ) )
	end

end


--
function UI.UpgradeItemWnd:TryUpgrade()

	if self:IsWaiting() then
		return
	end

	self.upgradeRequestId = _G.GameStore_UpgradeItems( { { iid = self.iid, numLevels = 1 } } )
	
	if type( self.upgradeRequestId ) ~= "number" then
		self.upgradeRequestId = 0
	end

	if self.upgradeRequestId ~= 0 then

		self:UpdateWaitEffect()
		UI:AddWaitingRequest( self.upgradeRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )

		if self.bSound then
			UI:PlayGlobalSound( self.sounds.upgrade )
		end

	else
		self:ShowMsgOnUpgradeError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.UpgradeItemWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )	

end


--
function UI.UpgradeItemWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )	

end


--
function UI.UpgradeItemWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.UpgradeItemWnd:IsWaiting()

	return self.upgradeRequestId ~= 0

end


--
function UI.UpgradeItemWnd:ShowMsgOnUpgradeError( result )

	UI:ShowErrorMsg( "msg_upgradeError", result, "_G.GameStore.StoreBuyResult" )

end


--
function UI.UpgradeItemWnd:F_OnEventSaveUiState()

	local name = self:GetScriptTableName()

	UI.store[ name ] =
	{
		upgradeRequestId	= self.upgradeRequestId,
		iid					= self.iid,
		vid					= self.vid,
		equipSlot			= self.equipSlot,
	}

end


--
function UI.UpgradeItemWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()

	local t = UI.store[ name ]
	if t then

		self.upgradeRequestId = t.upgradeRequestId
		self:UpdateWaitEffect()

		if t.iid ~= UI.INVALID_U64_ID then
			self:Setup( t.iid, t.vid, t.equipSlot )
		end		

		UI.store[ name ] = nil

	end

end


--
function UI.UpgradeItemWnd:NotifyMainWnd( result )

	local mainWnd = UI[ self.mainWndName ]
	if not mainWnd then
		sys.log( "UI.UpgradeItemWnd:NotifyMainWnd()[ERROR]: cannot find main wnd \"%s\"", self.mainWndName )
		return
	end

	if not mainWnd.OnUpgradeItemWndResult then
		sys.log( "UI.UpgradeItemWnd:NotifyMainWnd()[ERROR]: cannot find OnUpgradeItemWndResult() function in wnd %s", self.mainWndName )
		return
	end

	mainWnd:OnUpgradeItemWndResult( result, self.iid, self.vid, self.equipSlot, self.customData )

end


--
function UI.UpgradeItemWnd:PrepareLayout()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	local paramsPos		= workEffect and workEffect:GetObjPos( self.effectInfo.work.paramsLocator ) or Vec2( 0, 0 )
	local paramsSize	= workEffect and workEffect:GetObjSize( self.effectInfo.work.paramsLocator ) or Vec2( 0, 0 )
	local workMinSize	= workEffect and workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ) or Vec2( 0, 0 )
	local workMaxSize	= workEffect and workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ) or Vec2( 0, 0 )

	self.space_params_btm	= workMaxSize.y - ( paramsPos.y + paramsSize.y )
	self.workMinHeight		= workMinSize.y
	self.workMaxHeight		= workMaxSize.y

	self:SetLayerWidth( paramsSize.x, self.layers.PARAMS )

end


--
function UI.UpgradeItemWnd:RecalcLayout()

	-- параметры - высота

	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.PARAMS ), 10000000 )

    local paramsHeight = _G.MeasureText(
   		self:GetText( self.layers.PARAMS ),
   		self:GetFont( self.layers.PARAMS ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.PARAMS ),
    	formatRect ).w

	self:SetLayerHeight( paramsHeight, self.layers.PARAMS )


	-- анимация фона

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )		
	local workEffectPos = workEffect and workEffect:GetPos() or Vec2( 0, 0 )

	local workHeight = ( self:GetLayerTop( self.layers.PARAMS ) - workEffectPos.y ) + paramsHeight + self.space_params_btm
	workHeight = UI:Clamp( workHeight, self.workMinHeight, self.workMaxHeight )

	local animTime = ( workHeight - self.workMinHeight ) / ( self.workMaxHeight - self.workMinHeight )


	if workEffect then
		workEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


-- -------------------------------------------------------------------
-- UI.UpgradeItem_UpgradeBtn
-- -------------------------------------------------------------------

UI.UpgradeItem_UpgradeBtn = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.UpgradeItem_UpgradeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn4",

	props =
	{
		name		= "UpgradeItem_UpgradeBtn",
		isPrototype	= true,	
	},

	layers =
	{
		-- TEXT
		{
			id				= UI.TextBtn.layers.TEXT,

			layerStyle		= UI.WLS_OWNERDRAW,
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------------
-- interface funtions
-- -------------------------------------

--
function UI.UpgradeItem_UpgradeBtn:Setup( priceInfo )

	self:Reset()

	self.priceInfo = priceInfo
	self:FullUpdate()

end


--
function UI.UpgradeItem_UpgradeBtn:Reset()

	self.priceInfo = nill
	self.state = -1

	self:SetBtnText( "" )

	self:Enable( false )

end


--
function UI.UpgradeItem_UpgradeBtn:GetPriceInfo()

	return self.priceInfo

end


--
function UI.UpgradeItem_UpgradeBtn:GetState()

	return self.state

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.UpgradeItem_UpgradeBtn.states =
{
	UPGRADE	= 1,
	REFILL	= 2,
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.UpgradeItem_UpgradeBtn.metaText	= nil
UI.UpgradeItem_UpgradeBtn.priceInfo	= nil
UI.UpgradeItem_UpgradeBtn.state		= -1

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.UpgradeItem_UpgradeBtn:F_PostLoad()

	UI.TextBtn4.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 

end


--
function UI.UpgradeItem_UpgradeBtn:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.UpgradeItem_UpgradeBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.UpgradeItem_UpgradeBtn:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.UpgradeItem_UpgradeBtn:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.UpgradeItem_UpgradeBtn:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.UpgradeItem_UpgradeBtn:SetBtnText( text )

	self.metaText:SetText( text, true )

end


--
function UI.UpgradeItem_UpgradeBtn:FullUpdate()

	local bEnoughMoney = UI:IsEnoughMoneyForPrice( self.priceInfo, false )

	self.state = self.states.UPGRADE

	if not bEnoughMoney then
		if self.priceInfo.priceType == _G.GameStore.CreditsType.CT_CREDITS or self.priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then
			self.state = self.states.REFILL
		end			
	end

	local strLabel = ""

	if self.state == self.states.UPGRADE then
		strLabel = UI:GetStringByName( "equipment_upgradeBtn" )

	elseif self.state == self.states.REFILL then
		strLabel = UI:GetStringByName( "refillMoneyBtn" )
	end

	local strIco = UI:GetPriceIcoMetaString( self.priceInfo )

	local str = string.format( "%s %s", strLabel, strIco )

	self:SetBtnText( str )

	local bEnable = false

	if self.state == self.states.REFILL then
		bEnable = true
	else
		bEnable = bEnoughMoney
	end

	self:Enable( bEnable )

	local color = self:GetColor( self.layers.TEXT )
	self.metaText:SetColor( color )

end