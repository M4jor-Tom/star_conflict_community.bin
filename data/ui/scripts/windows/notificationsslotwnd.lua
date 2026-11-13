-- ----------------------------------------------------------------------------
--
-- Workfile: notificationsslotwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.NotificationsSlotWnd = {}
local ns = UI.NotificationsSlotWnd

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.NotificationsSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "NotificationsSlotWnd",
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
			updatable	= false,

			effects =
			{{
				defName 			= "notifications_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "marker",	
						layer		= "UI.NotificationsSlotWnd.layers.SEVERITY_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "icon",	
						layer		= "UI.NotificationsSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					-- умышленно не линкуется по SIZE
					{
						objName		= "description",	
						layer		= "UI.NotificationsSlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "baner",	
						layer		= "UI.NotificationsSlotWnd.layers.BANNER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SEVERITY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "notifications_slot_severity",
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "notifications_slot_ico",
				defaultAnimation	= "active",
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- BANNER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "notifications_slot_banner",
				defaultAnimation	= "idle",
			}}
		},

		-- ANIM_ALPHA_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "notifications_slot_animAlpha",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.NotificationsSlotWnd:Setup( notificationId, mode )

	if type( notificationId ) ~= "number" then
		sys.log( "UI.NotificationsSlotWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"notificationId\"); \"number\" expected, got \"%s\"", type( notificationId ) )
		return
	end

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.NotificationsSlotWnd:Setup()[ERROR]: invalid 2-nd parameter (\"mode\"); one of the UI.NotificationsSlotWnd.modes values expected, got %s", tostring( mode ) )
		return
	end

	self:Reset()

	self.notificationId = notificationId
	self.mode			= mode

	self:FullUpdate()

end


--
function UI.NotificationsSlotWnd:Reset()

	self.notificationId = -1
	self.mode			= -1

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
		icoEffect:StartAnimation( self.effectInfo.ico.animIdle )
	end

	local severityEffect = UI:GetEffectFromLayer( self, self.layers.SEVERITY_EFFECT )
	if severityEffect then
		severityEffect:StartAnimation( self.effectInfo.severity.severity2Anim[ UI.Notifications.severities.WHITE ] or "" )
	end

	self.metaText:SetText( "", true )

	local bannerEffect = UI:GetEffectFromLayer( self, self.layers.BANNER_EFFECT )
	if bannerEffect then
		bannerEffect:SetSpriteTexture( self.effectInfo.banner.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.MAIN_EFFECT )
	self:SetLayerVisible( false, self.layers.BANNER_EFFECT )
	self:SetLayerVisible( false, self.layers.SEVERITY_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.TEXT )

	self:AnimateIdle()
	self:SetAlpha( 1 )

	self:HideGoldRewardWnd()

end


--
function UI.NotificationsSlotWnd:GetNotificationId()

	return self.notificationId

end


--
function UI.NotificationsSlotWnd:AnimateShow()

	self.bHidden = false

	local animEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_ALPHA_EFFECT )
	if animEffect then
		animEffect:StartAnimation( self.effectInfo.animAlpha.animShow )
	end

end


--
function UI.NotificationsSlotWnd:AnimateHide()

	self.bHidden = false

	local animEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_ALPHA_EFFECT )
	if animEffect then
		animEffect:StartAnimation( self.effectInfo.animAlpha.animHide )
	end

end


--
function UI.NotificationsSlotWnd:AnimateIdle()

	self.bHidden = false

	local animEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_ALPHA_EFFECT )
	if animEffect then
		animEffect:StartAnimation( self.effectInfo.animAlpha.animIdle )
	end

end


--
function UI.NotificationsSlotWnd:IsHidden()

	return self.bHidden

end


--
function UI.NotificationsSlotWnd:IsHiding()

	local animEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_ALPHA_EFFECT )	
	return animEffect and animEffect:GetCurAnimation() == self.effectInfo.animAlpha.animHide

end


-- alphaCf: 0..1
function UI.NotificationsSlotWnd:SetAlpha( alphaCf )

	self.alphaCf = UI:Clamp( alphaCf, 0, 1 )
	self:UpdateAlpha()

end


--
function UI.NotificationsSlotWnd:GetAlpha()

	return self.alphaCf

end


-- ---------------------------------------
-- const
-- ---------------------------------------

ns.modes =
{
	LIST		= 1,
	POP_UPS		= 2,
}

ns.layers =
{
    MAIN_EFFECT			= 0,
    SEVERITY_EFFECT		= 1,
    ICO_EFFECT			= 2,
    TEXT				= 3,
	BANNER_EFFECT		= 4,
	ANIM_ALPHA_EFFECT	= 5,
}

ns.defaultSeverity	= UI.Notifications.severities.WHITE
ns.errorSeverity	= UI.Notifications.severities.RED

ns.effectInfo =
{
	main =
	{
		minSizeLocator		= "dist_min",		
		maxSizeLocator		= "self",
		textLocator			= "description",
		bannerLocator		= "baner",
		goldRewardLocator	= "progr_",

		textColor2Locator =
		{
			[ UI.Notifications.textColors.WHITE ]	= "description",
			[ UI.Notifications.textColors.RED ]		= "color_1",	
			[ UI.Notifications.textColors.YELLOW ]	= "color_2",	
		},

		animIdle		= "idle",
		animImportant	= "idle_2",
		
	},

	severity =
	{
		severity2Anim =
		{
			[ UI.Notifications.severities.WHITE ]	= "col_5",
			[ UI.Notifications.severities.RED ]		= "col_6",
			[ UI.Notifications.severities.ORANGE ]	= "col_1",
			[ UI.Notifications.severities.BLUE ]	= "col_2",
			[ UI.Notifications.severities.BLACK ]	= "col_4",
			[ UI.Notifications.severities.GREEN ]	= "col_7",
		}
	},

	ico =
	{
		icoSpriteName	= "ico",
		animIdle		= "active",
		animImportant	= "blink",
	},

	animAlpha =
	{
		animShow	= "show",
		animHide	= "hide",
		animIdle	= "idle",
		locator		= "slot_anim",
	},

	banner =
	{
		spriteName	= "sp_12"
	}
}

ns.NOTIFICATION_SLOT = true

ns.customOperations =
{
	PURCHASED	= 1,
	REMOVED		= 2,
	EXPIRED		= 3,
}

ns.MAX_CUSTOMIZATION_EXPIRED_SHIPS = 4

-- ---------------------------------------
-- vars
-- ---------------------------------------

ns.notificationId			= -1
ns.metaText					= nil
ns.maxHeight				= 0
ns.minHeight				= 0
ns.space_text_bottom		= 0
ns.space_goldReward_bottom	= 0
ns.mode						= -1
ns.alphaCf					= 1
ns.bHidden					= false
ns.textColors				= {}
ns.bannerHeight				= 0
ns.space_banner_btm			= 0
ns.goldRewardWnd			= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.NotificationsSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.NotificationsSlotWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.NotificationsSlotWnd:CreateControls()

	self.textColors = {}

	for colorName, colorId in pairs( UI.Notifications.textColors ) do
		local colorLocator = self.effectInfo.main.textColor2Locator[ colorId ]
		if colorLocator then
			self.textColors[ colorId ] = mainEffect and mainEffect:GetObjColor( colorLocator ) or UI.WHITE_COLOR
		else
			sys.log( "UI.NotificationsSlotWnd:F_PostLoad()[ERROR]: cannot find locator for color %s", colorName )
			self.textColors[ colorId ] = UI.WHITE_COLOR
		end
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 

	self.goldRewardWnd = UI:CreateChildWnd( self, UI.NotificationsSlot_GoldRewardWnd, "" )

end


--
function UI.NotificationsSlotWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:Update( 0 )

		local maxSize = mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
		local minSize = mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )

		self.maxHeight	= maxSize.y
		self.minHeight	= minSize.y

		local textY			= self:GetLayerTop( self.layers.TEXT )
		local maxTextSize	= mainEffect:GetObjSize( self.effectInfo.main.textLocator )

		self.space_text_bottom = maxSize.y - ( textY + maxTextSize.y )

		self:SetWidth( maxSize.x )
		self:SetLayerWidth( maxTextSize.x, self.layers.TEXT )		

		local space_top_banner = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.bannerLocator ).y or 0
		self.space_banner_btm = space_top_banner

		local goldRewardPos = mainEffect:GetObjPos( self.effectInfo.main.goldRewardLocator )
		self.space_goldReward_bottom = maxSize.y - ( goldRewardPos.y + self.goldRewardWnd:GetHeight() )
		self.goldRewardWnd:SetLeft( goldRewardPos.x )		

	end

	local bannerEffect = UI:GetEffectFromLayer( self, self.layers.BANNER_EFFECT )
	if bannerEffect then
		self.bannerHeight = bannerEffect:GetObjSize( "self" ).y
	end

	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), true )

end


--
function UI.NotificationsSlotWnd:ShowGoldRewardWnd()

	self:AddChild( self.goldRewardWnd )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( self.goldRewardWnd:GetUiHandle(), self.effectInfo.main.goldRewardLocator, UI.EffectAnimParams.ALPHA )
	end

end


--
function UI.NotificationsSlotWnd:HideGoldRewardWnd()

	self.goldRewardWnd:UnlinkFromParent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( self.goldRewardWnd:GetUiHandle(), "" )
	end

end


--
function UI.NotificationsSlotWnd:FullUpdate()

	self:UpdateContent()
	self:RecalcLayout()

end


--
function UI.NotificationsSlotWnd:UpdateContent()

	local notification = UI.Notifications:GetNotification( self.notificationId )
	if not notification then
		sys.log( "UI.NotificationsSlotWnd:UpdateContent()[ERROR]: cannot find notification with id %d", self.notificationId )		
		return
	end

	local fnName = string.format( "Update_%s", UI:Val2Key( UI.Notifications.types, notification.type ) )
	local fn = self[ fnName ]

	if fn then
		 fn( self, notification )
	else
		self:UpdateContentDefault( notification )
	end

end


--
function UI.NotificationsSlotWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local notification = UI.Notifications:GetNotification( self.notificationId )

	local selfHeight = 0

	local mode = self:GetNotificationMode( notification )
	if mode == UI.Notifications.modes.CLASSIC then		

    	self:FixTextLength()

    	local fp = self.metaText:GetFormatParams()
    	local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )

    	local textHeight = _G.MeasureText(
       		self.metaText:GetFormattedText(),
       		fp.hFont,
       		formatRect,
       		fp.formatFlags,
       		formatRect ).w

    	local textY = self:GetLayerTop( self.layers.TEXT )

    	selfHeight = textY + textHeight + self.space_text_bottom

		if self.goldRewardWnd:IsChildOf( self ) then

			self.goldRewardWnd:SetTop( selfHeight )
			selfHeight = selfHeight + self.goldRewardWnd:GetHeight() + self.space_goldReward_bottom

		end

    	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )

	elseif mode == UI.Notifications.modes.BANNER then

		local bannerEffect = UI:GetEffectFromLayer( self, self.layers.BANNER_EFFECT )
		if bannerEffect then
			local bannerTop = bannerEffect:GetPos().y
			selfHeight = bannerTop + self.bannerHeight + self.space_banner_btm
		end

	else
		sys.log( "UI.NotificationsSlotWnd:RecalcLayout()[ERROR]: unhandled notification mode: %s", tostring( mode ) )
	end

	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

end


--
function UI.NotificationsSlotWnd:SetSeverity( severity )

	local severityEffect = UI:GetEffectFromLayer( self, self.layers.SEVERITY_EFFECT )
	if not severityEffect then
		return
	end

	local anim = self.effectInfo.severity.severity2Anim[ severity ]

	if anim then
		severityEffect:StartAnimation( anim )
	else
		sys.log( "UI.NotificationsSlotWnd:SetSeverity()[ERROR]: cannot find animation for severity %s", UI:Val2Key( UI.Notifications.severities, severity ) )
	end

end


--
function UI.NotificationsSlotWnd:SetIco( texName )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end

	local hTex = UI:GetTex( texName )
	icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )	

end


--
function UI.NotificationsSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
		self:UpdateMetaTextPos()
	end

end


--
function UI.NotificationsSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.NotificationsSlotWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.NotificationsSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()
	self:UpdateMetaTextPos()

end     


--
function UI.NotificationsSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.NotificationsSlotWnd:UpdateAlpha()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local animAlphaEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_ALPHA_EFFECT )

	if not mainEffect or not animAlphaEffect then
		return
	end

	local alpha = animAlphaEffect:GetObjAlpha( self.effectInfo.animAlpha.locator ) * self.alphaCf
	mainEffect:SetAlpha( alpha )

	self.metaText:SetAlpha( alpha )

end


--
function UI.NotificationsSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.mode == self.modes.POP_UPS then
		self:UpdateAlpha()
	end

end


--
function UI.NotificationsSlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.ANIM_ALPHA_EFFECT ) then

		if animName == self.effectInfo.animAlpha.animShow then
			self:AnimateIdle()

		elseif animName == self.effectInfo.animAlpha.animHide then
			self.bHidden = true
		end

	end

end


--
function UI.NotificationsSlotWnd:UpdateContentDefault( notification )

	self:UpdateLayersVisibilityDefault( notification )

	local mode = self:GetNotificationMode( notification )
	if mode == UI.Notifications.modes.CLASSIC then

    	self:UpdateIcoDefault( notification )
    	self:UpdateSeverityDefault( notification )
    	self:UpdateColorDefault( notification )
    	self:UpdateTextDefault( notification )

	elseif mode == UI.Notifications.modes.BANNER then

		self:UpdateBannerDefault( notification )

	else
		sys.log( "UI.NotificationsSlotWnd:UpdateContentDefault()[ERROR]: unhandled notification mode: %s", tostring( mode ) )
	end

end


--
function UI.NotificationsSlotWnd:UpdateLayersVisibilityDefault( notification )

	local mode = self:GetNotificationMode( notification )
	if mode == UI.Notifications.modes.CLASSIC then

    	self:SetLayerVisible( true, self.layers.MAIN_EFFECT )
    	self:SetLayerVisible( true, self.layers.SEVERITY_EFFECT )
    	self:SetLayerVisible( true, self.layers.ICO_EFFECT )
    	self:SetLayerVisible( true, self.layers.TEXT )
    	self:SetLayerVisible( false, self.layers.BANNER_EFFECT )

	elseif mode == UI.Notifications.modes.BANNER then

    	self:SetLayerVisible( false, self.layers.MAIN_EFFECT )
    	self:SetLayerVisible( false, self.layers.SEVERITY_EFFECT )
    	self:SetLayerVisible( false, self.layers.ICO_EFFECT )
    	self:SetLayerVisible( false, self.layers.TEXT )
    	self:SetLayerVisible( true, self.layers.BANNER_EFFECT )

	else
		sys.log( "UI.NotificationsSlotWnd:UpdateContentDefault()[ERROR]: unhandled notification mode: %s", tostring( mode ) )
	end

end


--
function UI.NotificationsSlotWnd:UpdateContentSquad( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		
	self:UpdateTextSquad( notification )

end


--
function UI.NotificationsSlotWnd:UpdateContentCustomization( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoCustomization( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		
	self:UpdateTextCustomization( notification )

end


--
function UI.NotificationsSlotWnd:UpdateIcoDefault( notification )

	local info = UI.Notifications.notificationsInfo[ notification.type ]
	if not info then
		sys.log( "UI.NotificationsSlotWnd:UpdateIcoDefault()[ERROR]: cannot find info for notification %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		return
	end

	if not info.ico then
		sys.log( "UI.NotificationsSlotWnd:UpdateIcoDefault()[ERROR]: cannot find ico for notification %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		return
	end

	self:SetIco( info.ico )

end


--
function UI.NotificationsSlotWnd:UpdateIcoTrade( notification )

	local ico = notification.params.goldCredits ~= nil and notification.params.goldCredits ~= 0 and "notice_shop_gold" or "note_shop_silver"
	self:SetIco( ico )	

end


--
function UI.NotificationsSlotWnd:UpdateIcoCustomization( notification )

	if notification.type == UI.Notifications.types.SN_VESSEL_CUSTOM_ELEMENTS_CHANGED then

    	local ico = "note_shop_silver"
    	local credits, gold = self:GetCustomizationTotalCost( notification.params )

    	if gold ~= 0 then
    		ico = "notice_shop_gold"
    	end

    	self:SetIco( ico )

	else
	   	self:UpdateIcoDefault( notification )
	end

end


--
function UI.NotificationsSlotWnd:GetCustomizationTotalCost( params )

	local creditsTotal = 0
	local goldTotal = 0

	if type( params.purchasedCustomElements ) == "table" then

		for idx, customElementInfo in pairs( params.purchasedCustomElements ) do
			if type( customElementInfo ) == "table" then

				local credits = type( customElementInfo.credits ) == "number" and customElementInfo.credits or 0
				local gold = type( customElementInfo.goldCredits ) == "number" and customElementInfo.goldCredits or 0

				if credits ~= 0 then
					creditsTotal = creditsTotal + credits

				elseif gold ~= 0 then
					goldTotal = goldTotal + gold
				end					

			end
		end

	end

	return creditsTotal, goldTotal

end


--
function UI.NotificationsSlotWnd:UpdateSeverityDefault( notification )

	local info = UI.Notifications.notificationsInfo[ notification.type ]
	if not info then
		sys.log( "UI.NotificationsSlotWnd:UpdateSeverityDefault()[ERROR]: cannot find info for notification %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		return
	end

	if not info.severity then
		sys.log( "UI.NotificationsSlotWnd:UpdateSeverityDefault()[ERROR]: cannot find severity notification %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		return
	end

	self:SetSeverity( info.severity )

end


--
function UI.NotificationsSlotWnd:UpdateTextDefault( notification )

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:UpdateTextSquad( notification )

	local text = self:GetTextDefault( notification )
	text = self:ParseTextSquad( text, notification.params )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:UpdateTextClan( notification )

	local additionalStr = ""

	if notification.params.commonDeposit and notification.params.commonDeposit > 0 then

		additionalStr = additionalStr.."_common"

	end

	if notification.params.yourDeposit and notification.params.yourDeposit > 0 then

		additionalStr = additionalStr.."_your"

	end

	local info = UI.Notifications.notificationsInfo[ notification.type ]

	local textId = info and info.text
	if not textId then
		textId = string.format( "ntf_%s", UI:Val2Key( UI.Notifications.types, notification.type ) )
	end

	textId = textId..additionalStr
	local text = UI:GetStringByName( textId )
	text = self:ParseTextClan( text, notification.params )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:UpdateTextCustomization( notification )

	local text = ""

	if notification.type == UI.Notifications.types.SN_VESSEL_CUSTOM_ELEMENTS_EXPIRED then

		local shipInfos = {}

		for idx, shipInfo in pairs( notification.params ) do
			table.insert( shipInfos, shipInfo )
		end

		local function fnSort( info1, info2 )

			local shipDefName1 = info1.shipDefName or ""
			local shipDefName2 = info2.shipDefName or ""

			return shipDefName1 < shipDefName2

		end

		table.sort( shipInfos, fnSort )

		-- если кораблей меньше определенного количества, то пишутся подробно все снятые кастомизации,
		-- в противном случае - краткая форма, где упоминаются только названия кораблей

		local numShips = #shipInfos
		if numShips <= self.MAX_CUSTOMIZATION_EXPIRED_SHIPS then

			local textShipPattern = self:GetTextDefault( notification )

    		for shipIdx = 1, numShips do

    			local shipInfo = shipInfos[ shipIdx ]
    			local textShip = self:ParseTextCustomization( textShipPattern, shipInfo )

    			text = string.format( "%s%s%s", text, text ~= "" and "||" or "", textShip )

    		end

		else

			text = UI:GetStringByName( "ntf_SN_VESSEL_CUSTOM_ELEMENTS_EXPIRED_brief" )

			local strShips = ""
    		for shipIdx = 1, numShips do

				local shipInfo = shipInfos[ shipIdx ]
				local strShip = self:MakeShipStr( shipInfo.shipDefName, shipInfo.vid )

				strShips = string.format( "%s%s%s", strShips, strShips ~= "" and ", " or "", strShip )

			end

			text = string.gsub( text, "%$ships%$", strShips )			

		end

	elseif notification.type == UI.Notifications.types.VESSEL_CUSTOM_ELEMENTS_NEW_FREE then

		if type( notification.params.defNames ) == "table" then

			local defNames	= notification.params.defNames

			local strId = "ntf_SN_VESSEL_CUSTOM_ELEMENTS_NEW_FREE"
			text = UI:GetStringByName( strId )

			local strCustoms = ""

			for idx = 1, #defNames do

				local defName = defNames[ idx ]
				local customizationType = UI:GetCustomizationTypeByName( defName )

				local strCustomizationType = UI:Val2Key( ai.VesselCustomElementType, customizationType )
				if strCustomizationType ~= "" then

					local customStrId = string.format( "custom_%s", strCustomizationType )
					local strCustom = UI:GetStringByName( customStrId )

					local customName = UI:ShipCustomization2Str( defName )
					customName = self:StringColored( customName )

				    local strCustom = string.gsub( strCustom, "%$custom%$", customName )

					strCustoms = string.format( "%s%s%s", strCustoms, strCustoms ~= "" and "|" or "", strCustom )

				else
					sys.log( "UI.NotificationsSlotWnd:UpdateTextCustomization()[ERROR]: invalid customization type %d for def \"%s\" in notification \"%s\"", customizationType, defName, UI:Val2Key( UI.Notifications.types, notification.type ) )
				end

			end	

			if strCustoms ~= "" then
				text = string.format( "%s|%s", text, strCustoms )
			end				

		else
			sys.log( "UI.NotificationsSlotWnd:UpdateTextCustomization()[ERROR]: invalid type of param \"defNames\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ), type( notification.params.defNames ) )
		end

	else
		text = self:GetTextDefault( notification )
		text = self:ParseTextCustomization( text, notification.params )
	end

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:UpdateColorDefault( notification )

	local info = UI.Notifications.notificationsInfo[ notification.type ]
	
	local colorId = info and info.color
	if not colorId then
		colorId = UI.Notifications.textColors.WHITE
	end

	local color = self.textColors[ colorId ]
	self.metaText:SetColor( color )

end


--
function UI.NotificationsSlotWnd:ParseTextDefault( text, params, fnSubst )

    local function L_SubstituteCapture( capture )

		if fnSubst then
			local str = fnSubst( capture )
			if str ~= nil then
				return str
			end
		end

    	if capture == "credits" then

			local credits = self:GetParam( params, "credits", 0 )
			
			if type( credits ) == "userdata" then
				credits = tonumber( _G.U64ToStr( credits ) )
			end
			
    		return self:MakeCreditsStr( credits )


    	elseif capture == "gold" then

			local gold = 0

			if params.goldCredits then

				if type( params.goldCredits ) == "number" then
					gold = params.goldCredits
				else
					sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: invalid type of param \"goldCredits\" in notification \"%s\"; \"number\" or \"nil\" expected, got \"%s\"", UI:Val2Key( UI.Notifications.types, UI.Notifications:GetNotification( self.notificationId ).type ), type( params.goldCredits ) )
				end

			elseif params.gold then

				if type( params.gold ) == "number" then
					gold = params.gold
				else
					sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: invalid type of param \"gold\" in notification \"%s\"; \"number\" or \"nil\" expected, got \"%s\"", UI:Val2Key( UI.Notifications.types, UI.Notifications:GetNotification( self.notificationId ).type ), type( params.gold ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: cannot find data for placeholder \"gold\" for notification \"%s\"", UI:Val2Key( UI.Notifications.types, UI.Notifications:GetNotification( self.notificationId ).type ) )
			end

    		return self:MakeGoldStr( gold )


    	elseif capture == "cost" then

			local credits	= params.credits or 0
			if type( credits ) == "userdata" then
				credits = tonumber( _G.U64ToStr( credits ) )
			end

			local gold		= params.goldCredits or 0
			local tokens	= params.tokenCredits or 0

			local strCost = ""

			if credits ~= 0 or gold ~= 0 or tokens ~= 0 then

				local strMoney = self:MakeMoneyStr( gold, credits, tokens )
				strCost = UI:GetStringByName( "cost" )
				strCost = string.gsub( strCost, "%$money%$", strMoney ) 

			end			

    		return strCost


		elseif capture == "ship" then

			local defName = ""

			if params.shipDefName then
				defName = params.shipDefName

			elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_VESSEL then
				defName = params.defName

			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: cannot find ship def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
				return "Unknown"
			end

			return self:MakeShipStr( defName, params.vid )


    	elseif capture == "module" then
		
			if params.rollData then
			
				-- TODO сделать ссылку (и показывать тултип)
				local str = UI:Autogen2StrByRollData( params.rollData, params.upgradeLevel, true )
				
				local baseColor	= self.metaText:GetColor()
				str = string.format( "%s%s", str, UI:Color2Str( baseColor ) )
				
				return str
			
			else

				local defName = ""

				if params.itemDefName then
					defName = params.itemDefName

				elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_MODULE then
					defName = params.defName

				else
					local notification = UI.Notifications:GetNotification( self.notificationId )
					sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: cannot find module def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
					return "Unknown"
				end

				return self:MakeItemStr( defName, params.iid )
				
			end


    	elseif capture == "ammo" then

			local defName = ""

			if params.itemDefName then
				defName = params.itemDefName

			elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_ROCKET then
				defName = params.defName

			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: cannot find ammo def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
				return "Unknown"
			end

			return self:MakeItemStr( defName )


		elseif capture == "slot" then

			local slotId = self:GetParam( params, "slot", 0 ) + 1
			return self:StringColored( tostring( slotId ) )


		elseif capture == "shipType" then

			local shipTypeMask = params.slotType or params.newSlotType
			if not shipTypeMask then
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: cannot find ship slot type in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
				shipTypeMask = 0
			end

        	local shipType = UI:ShipTypeMask2OneShipType( shipTypeMask )

			local str = ""
			if shipType then
				str = string.format( "\"%s\"", UI:ShipSlotType2Str( shipType ) )
			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:ParseTextDefault()[ERROR]: invalid ship type (notification \"%s\")", UI:Val2Key( UI.Notifications.types, notification.type ) )
			end

			return self:StringColored( str )


		elseif capture == "player" then

			local uid = self:GetParam( params, "uid", UI.INVALID_U64_ID )
			local nickName = self:GetParam( params, "uid_nickName", UI:GetNickNamePlaceHolder( uid ) )

			nickName = UI:ShieldSpecSymbols( nickName )
			nickName = self:StringColored( nickName )
			
			return nickName


		elseif capture == "race" then		

			local race = self:GetParam( params, "race", 0 )
			return self:MakeRaceStr( race )


		elseif capture == "title" then		

			local title = self:GetParam( params, "titleId", -1 )
			return self:MakeTitleStr( title )
			

    	elseif capture == "defName" then

			local defName = self:GetParam( params, "defName", "" )

			local str = "Unknown"

			if defName ~= "" then
				str = self:MakeStrForDef( defName )
			end

			return str

    	elseif capture == "arenaTeam" then

			local teamName = self:GetParam( params, "teamName", "unknown" )
			teamName = self:StringColored( teamName )
			
			return teamName
			
		else

			local val = self:GetParam( params, capture, "error" )
			
			local strVal = ""

			if val == "error" then

				strVal = "$"..capture.."$"

			else
    			if type( val ) == "number" then
    				strVal = UI:FNum2StrSeparatedBy3( val )
    			else
    				strVal = tostring( val )
    			end

				strVal = self:StringColored( strVal )
			end

    		return strVal

    	end

    end

	text = UI:SubstituteLinks( text )

	return string.gsub( text, "%$([%w_]+)%$", L_SubstituteCapture )

end


--
function UI.NotificationsSlotWnd:ParseTextSquad( text, params )

    local function L_SubstituteCapture( capture )

		if capture == "squadNewLeader" then

			if params.newLeader then

				local strId = string.format( "squadNewLeader_%s", params.newLeader == _G.MasterServer_GetLocalUserId() and "local" or "remote" )
    			local strNewLeader = UI:GetStringByName( strId )

				local newLeaderNickName = self:GetParam( params, "newLeader_nickName", UI:GetNickNamePlaceHolder( params.newLeader ) )
				newLeaderNickName = UI:ShieldSpecSymbols( newLeaderNickName )
				newLeaderNickName = self:StringColored( newLeaderNickName )
    			
    			local subst =
    			{
    				player	= newLeaderNickName,
    			}

    			return string.gsub( strNewLeader, "%$([%w_]+)%$", subst )		

			else
				return ""
			end

    	end

	end

	return self:ParseTextDefault( text, params, L_SubstituteCapture )

end


--
function UI.NotificationsSlotWnd:ParseTextClan( text, params )

	text = string.gsub( text, "%$common_deposit%$", UI:Num2StrSeparatedBy3( params.commonDeposit or 0 ) )
	text = string.gsub( text, "%$your_deposit%$", UI:Num2StrSeparatedBy3( params.yourDeposit or 0 ) )

	return text

end


--
function UI.NotificationsSlotWnd:ParseTextCustomization( text, params )

    local function L_SubstituteCapture( capture )

		if capture == "customizations" then
			return self:MakeCustomizationsStr( params )

		elseif capture == "cost" then

			local credits, gold	= self:GetCustomizationTotalCost( params )

			local strCost = ""

			if credits ~= 0 or gold ~= 0 then

				local strMoney = self:MakeMoneyStr( gold, credits )
				strCost = UI:GetStringByName( "cost" )
				strCost = string.gsub( strCost, "%$money%$", strMoney ) 

			end			

    		return strCost

 		elseif capture == "custom" then

			local strName = "unknown"

			if type( params.defName ) == "string" then
				strName = UI:ShipCustomization2Str( params.defName )
			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:ParseTextCustomization()[ERROR]: invalid type of param \"defName\" in notification \"%s\"; \"string\" expected, got \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ), type( params.defName ) )
			end

			return self:StringColored( strName )

		else
			return nil
		end

	end

	return self:ParseTextDefault( text, params, L_SubstituteCapture )	

end


--
function UI.NotificationsSlotWnd:MakeCustomizationsStr( params )

	local str = ""

	local function L_SortCustomElements( info1, info2 )

		local slot1 = info1.slot or -1
		local slot2 = info2.slot or -1

		if slot1 ~= slot2 then
			return slot1 < slot2
		end

		local defName1 = info1.defName or ""
		local defName2 = info2.defName or ""

		return defName1 < defName2

	end

	local function L_ParseCustomElements( tableName, customOperation )

		local customElemetsTable = params[ tableName ]

    	if type( customElemetsTable ) == "table" then

    		local customElements = {}

    		for idx, customElementInfo in pairs( customElemetsTable ) do
    			table.insert( customElements, customElementInfo )
    		end

    		table.sort( customElements, L_SortCustomElements )

    		for idx = 1, #customElements do

    			local customElementInfo = customElements[ idx ]
    			local strCustomElement = self:MakeCustomizationElementStr( customElementInfo, customOperation )

    			if not UI:IsStrEmpty( strCustomElement ) then
    				str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strCustomElement )
    			end

    		end   

    	else
    		if customElemetsTable ~= nil then
    			sys.log( "UI.NotificationsSlotWnd:MakeCustomizationsStr()[ERROR]: invalid type of \"%s\"; \"table\" or \"nil\" expected, got \"%s\"", tableName, type( customElemetsTable ) )
    		end
    	end

	end
	
	L_ParseCustomElements( "removedCustomElements", self.customOperations.REMOVED )
	L_ParseCustomElements( "purchasedCustomElements", self.customOperations.PURCHASED )
	L_ParseCustomElements( "expiredCustomElements", self.customOperations.EXPIRED )

	return str

end


--
function UI.NotificationsSlotWnd:MakeCustomizationElementStr( customElementInfo, customOperation )

	local str = "error"

	if type( customElementInfo.slot ) ~= "number" then
		sys.log( "UI.NotificationsSlotWnd:MakeCustomizationElementStr()[ERROR]: invalid type \"slot\"; \"number\" expected, got \"%s\"", customElementInfo.slot )
		return str
	end

	local strCustomSlot = UI:Val2Key( ai.VesselCustomSlot, customElementInfo.slot )
	if strCustomSlot == "" then
		sys.log( "UI.NotificationsSlotWnd:MakeCustomizationElementStr()[ERROR]: invalid \"slot\": %d", customElementInfo.slot )
		return str
	end

	local strCustomOperation = UI:Val2Key( self.customOperations, customOperation )
	if strCustomOperation == "" then
		sys.log( "UI.NotificationsSlotWnd:MakeCustomizationElementStr()[ERROR]: invalid custom operation id: %s", tostring( customOperation ) )
		return str
	end

	local strId = string.format( "ntf_SN_VESSEL_CUSTOM_ELEMENTS_CHANGED_%s_%s", string.lower( strCustomOperation ), strCustomSlot )
	str = UI:GetStringByName( strId )

	local function L_SubstituteCapture( capture )

 		if capture == "custom" then

			local strName = "unknown"

			if type( customElementInfo.defName ) == "string" then
				strName = UI:ShipCustomization2Str( customElementInfo.defName )
			else
				sys.log( "UI.NotificationsSlotWnd:MakeCustomizationElementStr()[ERROR]: invalid type of \"defName\"; \"string\" expected, got \"%s\"", type( customElementInfo.defName ) )
			end

			return self:StringColored( strName )

 		end

 		return nil

 	end	

	return string.gsub( str, "%$([%w_]+)%$", L_SubstituteCapture )

end


--
function UI.NotificationsSlotWnd:GetParam( params, paramName, defaultVal )

	local val = params[ paramName ]

	if val ~= nil then
		return val
	else
		local notification = UI.Notifications:GetNotification( self.notificationId )
		sys.log( "UI.NotificationsSlotWnd:GetParam()[ERROR]: cannot find param \"%s\" for notification \"%s\"", paramName, UI:Val2Key( UI.Notifications.types, notification.type ) )
		return defaultVal	
	end

end


--
function UI.NotificationsSlotWnd:ItemType2Suffix( defName )

	if type( defName ) ~= "string" then
		sys.log( "UI.NotificationsSlotWnd:ItemType2Suffix()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return ""
	end

	local itemType = _G.GetStoreItemTypeByDef( defName )

	if itemType == _G.GameStore.ItemType.IT_MODULE then
		return "module"

	elseif itemType == _G.GameStore.ItemType.IT_VESSEL then
		return "ship"

	elseif itemType == _G.GameStore.ItemType.IT_ROCKET then

		local ammoType = UI:GetAmmoType( defName )

		if ammoType == ai.MunitionBayType.MBT_PRIMARY then
			return "ammoPrimary"
		elseif ammoType == ai.MunitionBayType.MBT_SECONDARY then
			return "ammoSecondary"
		else
			sys.log( "UI.NotificationsSlotWnd:ItemType2Suffix()[ERROR]: unhandled ammo type %d for def %s", ammoType, defName )
			return ""
		end

	elseif itemType == _G.GameStore.ItemType.IT_BUNDLE then
		return "bundle"

	elseif itemType == _G.GameStore.ItemType.IT_RESOURCE then
		return "resource"

	elseif itemType == _G.GameStore.ItemType.IT_BLUEPRINT then
		return "blueprint"

	elseif itemType == _G.GameStore.ItemType.IT_AVATAR then
		return "avatar"

	elseif itemType == _G.GameStore.ItemType.IT_MOTTO then
		return "motto"

	else
		sys.log( "UI.NotificationsSlotWnd:ItemType2Suffix()[ERROR]: unhandled item type: %s", tostring( itemType ) )
		return ""
	end

end


--
function UI.NotificationsSlotWnd:GetTextDefault( notification )

	local info = UI.Notifications.notificationsInfo[ notification.type ]

	local textId = info and info.text
	if not textId then
		textId = string.format( "ntf_%s", UI:Val2Key( UI.Notifications.types, notification.type ) )
	end

	return UI:GetStringByName( textId )

end


--
function UI.NotificationsSlotWnd:StringColored( str )

	local strColorBase	= UI:Color2Str( self.metaText:GetColor() )
	local strColorSel	= UI:Color2Str( UI.TEXT_SEL_COLOR )

	return string.format( "%s%s%s", strColorSel, str, strColorBase )

end


--
function UI.NotificationsSlotWnd:MakeStrForDef( defName )

	local str = "Unknown"

	if UI:IsDefShip( defName ) then
		str = self:MakeShipStr( defName )

	elseif UI:IsDefModule( defName ) then
		str = self:MakeItemStr( defName )

	elseif UI:IsDefAmmo( defName ) then
		str = self:MakeItemStr( defName )

	elseif UI:IsDefResource( defName ) then
		str = self:MakeResourceStr( defName )

	elseif UI:IsDefBlueprint( defName ) then
		str = self:MakeResourceStr( defName )

	else
		str = UI:GetEntityLocalizedNameByDef( defName, true, false, false, false )
		str = string.format( "%s%s", str, UI:Color2Str( self.metaText:GetColor() ) )
	end

	return str

end


--
function UI.NotificationsSlotWnd:MakeItemStr( defName, iid, bEnchanted )

	if iid == nil or ( iid ~= UI.INVALID_U64_ID and not UI:GetInventoryItemEx( iid ) ) then
		iid = UI.INVALID_U64_ID
	end	

	if bEnchanted == nil then
		bEnchanted = false
	end

	local text = UI:GetEntityLocalizedNameByDef( defName, false )
	text = UI:GetCutTextWithEllipses( text, self:GetLayerWidth( self.layers.TEXT ), self:GetFont( self.layers.TEXT ) )
	text = string.gsub( text, "\"", "\\\"" )

	return string.format( "$link [type ITEM][params {defName=\"%s\", bEnchanted=%s, iid=u64(%d,%d), text=\"%s\", colorSel=%u, colorUnsel=%u}]$", defName, tostring( bEnchanted ), iid.h, iid.l, text, UI:GetItemColor( defName, true ), UI:GetItemColor( defName, false ) )

end


--
function UI.NotificationsSlotWnd:MakeShipStr( defName, vid )

	if vid == nil or ( vid ~= UI.INVALID_U64_ID and not UI:GetShipItem( vid ) ) then
		vid = UI.INVALID_U64_ID
	end	

	local text = UI:GetEntityLocalizedNameByDef( defName, false )
	text = UI:GetCutTextWithEllipses( text, self:GetLayerWidth( self.layers.TEXT ), self:GetFont( self.layers.TEXT ) )
	text = string.gsub( text, "\"", "\\\"" )

	return string.format( "$link [type SHIP][params {defName=\"%s\", vid=u64(%d,%d), text=\"%s\", colorSel=%u, colorUnsel=%u}]$", defName, vid.h, vid.l, text, UI:GetItemColor( defName, true ), UI:GetItemColor( defName, false ) )

end


--
function UI.NotificationsSlotWnd:MakeResourceStr( defName )

	local text = UI:GetEntityLocalizedNameByDef( defName, false )
	text = UI:GetCutTextWithEllipses( text, self:GetLayerWidth( self.layers.TEXT ), self:GetFont( self.layers.TEXT ) )
	text = string.gsub( text, "\"", "\\\"" )

	return string.format( "$link [type RESOURCE][params {defName=\"%s\", text=\"%s\", colorSel=%u, colorUnsel=%u, bOpenItemCraftMulty=%s}]$", defName, text, UI:GetItemColor( defName, true ), UI:GetItemColor( defName, false ), tostring( UI:IsDefBlueprint( defName ) ) )

end


--
function UI.NotificationsSlotWnd:MakeCreditsStr( credits )	

    return string.format( "%s$credits_big$", UI:Num2StrSeparatedBy3( credits or 0 ) )

end


--
function UI.NotificationsSlotWnd:MakeGoldStr( gold )

    return string.format( "%s$gold_big$", UI:Num2StrSeparatedBy3( gold or 0 ) )

end


--
function UI.NotificationsSlotWnd:MakeTokensStr( tokens )

    return string.format( "%s$iridium$", UI:Num2StrSeparatedBy3( tokens or 0 ) )

end


--
function UI.NotificationsSlotWnd:MakeEventCreditsStr( eventCredits )

    return string.format( "%s$event_credits$", UI:Num2StrSeparatedBy3( eventCredits or 0 ) )

end


--
function UI.NotificationsSlotWnd:MakeMoneyStr( gold, credits, tokens, eventCredits )

	if not gold then
		gold = 0
	end

	if not credits then
		credits = 0
	end

	if not tokens then
		tokens = 0
	end

	if not eventCredits then
		eventCredits = 0
	end

	local strMoney = ""

	if gold ~= 0 then
		local strGold = self:MakeGoldStr( gold )
		strMoney = string.format( "%s%s%s", strMoney, strMoney ~= "" and ", " or "", strGold )
	end

	if credits ~= 0 then
		local strCredits = self:MakeCreditsStr( credits )
		strMoney = string.format( "%s%s%s", strMoney, strMoney ~= "" and ", " or "", strCredits )
	end

	if tokens ~= 0 then
		local strTokens = self:MakeTokensStr( tokens )
		strMoney = string.format( "%s%s%s", strMoney, strMoney ~= "" and ", " or "", strTokens )
	end

	if eventCredits ~= 0 then
		local strEventCredits = self:MakeEventCreditsStr( eventCredits )
		strMoney = string.format( "%s%s%s", strMoney, strMoney ~= "" and ", " or "", strEventCredits )
	end

	return strMoney

end


--
function UI.NotificationsSlotWnd:MakeTutorialRewardStr( params )

	local str = ""

	if type( params.goldCredits ) == "number" and params.goldCredits ~= 0 then
    	local strGold = self:MakeGoldStr( params.goldCredits )
    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strGold )
	end

	if type( params.credits ) == "number" and params.credits ~= 0 then
    	local strCredits = self:MakeCreditsStr( params.credits )
    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strCredits )
	end

	if type( params.experience ) == "number" and params.experience ~= 0 then
		local strExp = string.format( "%d %s", params.experience, UI:GetStringByName( "expUnits" ) )
    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strExp )
	end

	if type( params.goldCreditsBonus ) == "number" and params.goldCreditsBonus ~= 0 then
		local strBonus = self:MakeGoldStr( params.goldCreditsBonus )
    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strBonus )
	end

	return str	

end


--
function UI.NotificationsSlotWnd:MakeGameRewardStr( params )

	local str = ""

	-- золото

	local gold = 0

	if params.goldCredits ~= nil then
    	if type( params.goldCredits ) == "number" then
    		gold = params.goldCredits
    	else
    		sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of field \"goldCredits\"; \"number\" or \"nil\" expected, got \"%s\"", type( params.goldCredits ) )
    	end
	end

	if gold ~= 0 then

		local strGoldVal = self:MakeGoldStr( gold )

		local strGold = UI:GetStringByName( "gameReward_gold" )		
		strGold = string.gsub( strGold, "%$gold%$", strGoldVal )

    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strGold )

	end


	-- кредиты

	local credits = 0

	if params.credits ~= nil then
    	if type( params.credits ) == "number" then
    		credits = params.credits
    	else
    		sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of field \"credits\"; \"number\" or \"nil\" expected, got \"%s\"", type( params.credits ) )
    	end
	end

	if credits ~= 0 then

		local strCreditsVal = self:MakeCreditsStr( credits )

		local strCredits = UI:GetStringByName( "gameReward_credits" )
		strCredits = string.gsub( strCredits, "%$credits%$", strCreditsVal )

    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strCredits )

	end
	
	
	-- иридиум

	local tokens = 0

	if params.tokenCredits ~= nil then
    	if type( params.tokenCredits ) == "number" then
    		tokens = params.tokenCredits
    	else
    		sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of field \"tokenCredits\"; \"number\" or \"nil\" expected, got \"%s\"", type( params.tokenCredits ) )
    	end
	end

	if tokens ~= 0 then

		local strTokensVal = self:MakeTokensStr( tokens )

		local strTokens = UI:GetStringByName( "gameReward_playerIridium" )
		strTokens = string.gsub( strTokens, "%$val%$", strTokensVal )

    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strTokens )

	end


	-- синергия кораблей

	if params.vessels ~= nil then

    	if type( params.vessels ) == "table" then

			local shipInfos = params.vessels
	    	local shipIdxSorted = {}

        	-- т.к. возвращается не регулярный массив, то приходится сортировать
        	for idx, shipInfo in pairs( shipInfos ) do
        		table.insert( shipIdxSorted, idx )
        	end

        	table.sort( shipIdxSorted )

        	for idx = 1, #shipIdxSorted do

        		local shipInfo = shipInfos[ shipIdxSorted[ idx ] ]
        		if type( shipInfo ) == "table" then

        			local shipSynergy = 0

        			if type( shipInfo.exp ) == "number" then
        				shipSynergy = shipInfo.exp
        			else
        				sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of the field \"vessels[%s].exp\"; \"number\" expected, got \"%s\"", tostring( idx ), type( shipInfo.exp ) )
        			end

        			if shipSynergy ~= 0 then

        				local shipNameLocalized = "unknown"

        				local vid = UI.INVALID_U64_ID 

        				if type( shipInfo.vid ) == "userdata" then
        					vid = shipInfo.vid
        				else
        					sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of the field \"vessels[%s].vid\"; \"userdata\" expected, got \"%s\"", tostring( idx ), type( shipInfo.vid ) )
        				end

        				if vid ~= UI.INVALID_U64_ID then

        					local shipDefName = ""

        					if type( shipInfo.defName ) == "string" then
        						shipDefName = shipInfo.defName
        					else
        						sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of the field \"vessels[%s].defName\"; \"string\" expected, got \"%s\"", tostring( idx ), type( shipInfo.defName ) )
        					end
        			
        					if shipDefName ~= "" then
        						shipNameLocalized = self:MakeShipStr( shipDefName, vid )
        					end

        				else
        					sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid vid but exp is not 0 for ship id %s", tostring( idx ) )
        				end

    					local strSipSynergy = string.format( "%s$synergy_ship$", UI:Num2StrSeparatedBy3( shipSynergy ) )

        				local tSubst =
        				{
        					ship	= shipNameLocalized,
        					synergy = strSipSynergy,
        				}

        				local strShipSynergy = UI:GetStringByName( "gameReward_shipSynergy" )
        				strShipSynergy = string.gsub( strShipSynergy, "%$(.-)%$", tSubst )

        		    	str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strShipSynergy )

        			end

        		else
        			sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of the field \"vessels[%s]\"; \"table\" expected, got \"%s\"", tostring( idx ), type( shipInfo ) )
        		end

        	end		

        else
        	sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of the field \"vessels\"; \"table\" or \"nil\" expected, got \"%s\"", type( params.vessels ) )
    	end	

	end


	-- свободная синергия

	local freeSynergy = 0

	if params.vesselExpPool ~= nil then
    	if type( params.vesselExpPool ) == "number" then
    		freeSynergy = params.vesselExpPool
    	else
    		sys.log( "UI.NotificationsSlotWnd:MakeGameRewardStr()[ERROR]: invalid type of field \"vesselExpPool\"; \"number\" or \"nil\" expected, got \"%s\"", type( params.vesselExpPool ) )
    	end
	end

	if freeSynergy ~= 0 then

		local strFreeSynergy = string.format( "%s$synergy_free$", UI:GetStringByName( "gameReward_freeSynergy" ) )
		strFreeSynergy = string.gsub( strFreeSynergy, "%$synergy%$", UI:Num2StrSeparatedBy3( freeSynergy ) )

		str = string.format( "%s%s%s", str, str ~= "" and ",|"  or "", strFreeSynergy )

	end	

	return str

end


--
function UI.NotificationsSlotWnd:MakeRaceStr( race )

	return self:StringColored( UI:Race2Str( race ) )

end


--
function UI.NotificationsSlotWnd:MakeRankStr( rank )

	return self:StringColored( tostring( rank ) )

end


--
function UI.NotificationsSlotWnd:MakeUnlocksByRankStr( unlocks )

	local str = ""

	local itemTypes = {}
	for key, val in pairs( _G.GameStore.ItemType ) do
		table.insert( itemTypes, val )
	end
	table.sort( itemTypes )

	for typeIdx = 1, #itemTypes do

		local itemType = itemTypes[ typeIdx ]

	    local unlocksByType = unlocks[ itemType ]
		if unlocksByType and next( unlocksByType ) then

			local strByTypeId = string.format( "unlocksByRank_%s", UI:Val2Key( _G.GameStore.ItemType, itemType ) )
			local strByType = UI:GetStringByName( strByTypeId )

			local strItems = ""			

			for itemIdx = 1, #unlocksByType do

				local defName = unlocksByType[ itemIdx ]
				local strItem = ""

				if itemType == _G.GameStore.ItemType.IT_MODULE or itemType == _G.GameStore.ItemType.IT_ROCKET then
					strItem = self:MakeItemStr( defName )

				elseif itemType == _G.GameStore.ItemType.IT_VESSEL then
					strItem = self:MakeShipStr( defName )

				else
					sys.log( "UI.NotificationsSlotWnd:MakeUnlocksByRankStr()[ERROR]: unhanled item type: %s", UI:Val2Key( _G.GameStore.ItemType, itemType ) )
				end

				strItems = string.format( "%s%s%s", strItems, itemIdx > 1 and ", " or "", strItem )				

			end			

			strByType = string.gsub( strByType, "%$items%$", strItems )

			str = string.format( "%s%s%s", str, typeIdx > 1 and "|" or "", strByType )

		end		

	end

	return str

end


--
function UI.NotificationsSlotWnd:MakeIridiumStr( val )

	return string.format( "%s$iridium$", UI:Num2StrSeparatedBy3( val ) )

end


--
function UI.NotificationsSlotWnd:MakeClanIridiumStr( val )

	return string.format( "%s$clan_iridium$", UI:Num2StrSeparatedBy3( val ) )

end


--
function UI.NotificationsSlotWnd:MakeShipSynergyStr( val )

    return string.format( "%s$synergy_ship$", UI:Num2StrSeparatedBy3( val ) )

end


--
function UI.NotificationsSlotWnd:MakeAccountAuraStr( defName )

	return string.format( "$link [type ACCOUNT_AURA][params {defName=\"%s\"}]$", defName )

end


--
function UI.NotificationsSlotWnd:MakeAchievementStr( id, rank )

	return string.format( "$link [type ACHIEVEMENT][params {id=%d, rank=%d, colorUnsel=%u, colorSel=%u}]$", id, rank, UI.TEXT_SEL_COLOR, UI.TEXT_SEL_COLOR )

end


--
function UI.NotificationsSlotWnd:MakeTitleStr( id, rank )

	return string.format( "$link [type TITLE][params {id=%d, colorUnsel=%u, colorSel=%u}]$", id, UI.TEXT_SEL_COLOR, UI.TEXT_SEL_COLOR )

end


--
function UI.NotificationsSlotWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI:IsWndKindOf( w, "LinkWnd" ) then

		local notification = UI.Notifications:GetNotification( self.notificationId )
		if notification then

			if notification.type == UI.Notifications.types.SN_ITEM_ADVERT and w:GetLinkType() == UI.LinkWnd.linkTypes.ITEM then
				local res = self:TryBuyAdvertItem( w:GetParams() )
				if res then
					return true
				end
			end

		else
			sys.log( "UI.NotificationsSlotWnd:F_OnMouseLButtonDown()[ERROR]: cannot find notification %d", self.notificationId )
		end

	end

	return false

end


-- #0036543, комм.(0132906) - "Фича выключена уже давно"
function UI.NotificationsSlotWnd:TryBuyAdvertItem( linkParams )

	local notification = UI.Notifications:GetNotification( self.notificationId )
	if not notification then
		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: cannot find notification %d", self.notificationId )
		return false
	end

	if notification.type ~= UI.Notifications.types.SN_ITEM_ADVERT then
		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: wrong notification type: %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		return false
	end

	local advertDefName = self:GetParam( notification.params, "defName", "" )
	if advertDefName == "" then
		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: invalid defName" )
		return false
	end

	local advertDef = UI:GetDef( advertDefName )
	if not advertDef then
		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: cannot find _G.Def[%s]", advertDef )
		return false
	end

	local vid = self:GetParam( notification.params, "vid", UI.INVALID_U64_ID )
	if vid == UI.INVALID_U64_ID then
		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: invalid vid" )
		return false
	end

	local moduleSlotId = notification.params.slot or -1
	local ammoSlotId = notification.params.munitionSlot or -1

	if moduleSlotId == -1 and ammoSlotId == -1 then
		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: invalid slot" )
		return false
	end

	-- корабля уже нет (продали)

	local shipItem = UI:GetShipItem( vid )
	if not shipItem then
		return false
	end

	-- корабль не находится в боевом слоте

	local battleSlotId = UI:GetShipBattleSlot( shipItem )
	if battleSlotId == -1 then
		return false
	end
	
	-- определяется, что сейчас установлено в слоте

	local oldDefName = ""

	if moduleSlotId ~= -1 then

		local iid = shipItem.equipModules[ moduleSlotId ] or UI.INVALID_U64_ID
    	if iid ~= UI.INVALID_U64_ID then

        	local oldItem = UI:GetInventoryItem( iid )
        	if not oldItem then
        		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: cannot find inventory item for iid %s", _G.U64ToStr( iid ) )
        		return false		
        	end

        	oldDefName = oldItem.defName
		end

	else

		local ammoInfo = shipItem.equipAmmo[ ammoSlotId ]
		if ammoInfo and ammoInfo.def ~= "" and ammoInfo.amount > 0 then
			oldDefName = ammoInfo.def
		end		

	end

	if oldDefName ~= "" then

    	local oldDef = UI:GetDef( oldDefName )

    	if not oldDef then
    		sys.log( "UI.NotificationsSlotWnd:TryBuyAdvertItem()[ERROR]: cannot find _G.Def[%s]", oldDef )
    		return false
    	end

    	-- в слоте установлена вещь другого типа или тира (а, значит, не сравнима с рекламируемой)

    	if oldDef.tier ~= advertDef.tier or oldDef.item_subtype ~= advertDef.item_subtype then
    		return false
    	end

    	-- в слоте уже установлена вещь за золото

    	local oldItemPrice, bOldItemGold = UI:GetShopBuyPriceByDef( oldDefName, true )
    	if bOldItemGold then
    		return false
    	end 
    	
    	-- в слоте уже установлена вещь не меньшего уровня

    	local oldItemLevel = oldDef.item_lvl or 0
    	local advertItemLevel = advertDef.item_lvl or 0

    	if oldItemLevel >= advertItemLevel then
    		return false
    	end

	end	


	-- ок, новый модуль можно попытаться купить
	UI.HangarWnd:TryBuyAdvertItem( advertDefName, vid, moduleSlotId ~= -1 and moduleSlotId or ammoSlotId )

	return true

end


--
function UI.NotificationsSlotWnd:FixTextLength()

	local textRect = self:GetLayerRect( self.layers.TEXT )
	local formatRect = UI:Quat( 0, 0, textRect.z, ( self.maxHeight - self.space_text_bottom ) - textRect.y )

	local numStrings = _G.GetStringsNumber(
		self.metaText.text_formatted,
		self.metaText.formatParams.hFont,
		formatRect,
		self.metaText.formatParams.formatFlags,
		formatRect )

	local fontHeight = _G.GetFontLineHeight( self.metaText.formatParams.hFont )

	local maxStrings = fontHeight ~= 0 and math.floor( formatRect.w / fontHeight ) or 0
	if maxStrings <= 0 then
		maxStrings = 1
	end

	if numStrings <= maxStrings then
		return
	end

	local firstCharInLastString = _G.GetFirstCharIdForString(
		self.metaText.text_formatted,
		maxStrings - 1,
		self.metaText.formatParams.hFont,
		formatRect,
		self.metaText.formatParams.formatFlags,
		formatRect ) + 1

	local stringHead = UI:Substr( self.metaText.text_formatted, 1, firstCharInLastString - 1 )
	local strEllipses = UI:GetStringByName( "ellipses" )

	self.metaText.text_formatted = string.format( "%s|%s%s", stringHead, UI:Color2Str( self:GetColor( self.layers.TEXT ) ), strEllipses )

	for itemIdx = #self.metaText.items, 1, -1 do

		local item = self.metaText.items[ itemIdx ]

		if item.firstIdx < firstCharInLastString and item.lastIdx < firstCharInLastString then
			break
		end

		self.metaText:ResetItem( item )
		self.metaText.items[ itemIdx ] = nil		

	end

end


--
function UI.NotificationsSlotWnd:GetNotificationMode( notification )

	local defaultMode = UI.Notifications.modes.CLASSIC

	if not notification then
		sys.log( "UI.NotificationsSlotWnd:GetNotificationMode()[ERROR]: nil notification" )		
		return defaultMode
	end

	local info = UI.Notifications.notificationsInfo[ notification.type ]
	if not info then
		sys.log( "UI.NotificationsSlotWnd:GetNotificationMode()[ERROR]: cannot find info for notification %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		return defaultMode
	end

	return info.mode or defaultMode

end


--
function UI.NotificationsSlotWnd:UpdateBannerDefault( notification )

	local bannerEffect = UI:GetEffectFromLayer( self, self.layers.BANNER_EFFECT )
	if not bannerEffect then
		return
	end

	local texName = ""

	local info = UI.Notifications.notificationsInfo[ notification.type ]
	if info then
		texName = info.texture
		if not texName then
			sys.log( "UI.NotificationsSlotWnd:UpdateBannerDefault()[ERROR]: cannot find txture for notification %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		end
	else
		sys.log( "UI.NotificationsSlotWnd:UpdateBannerDefault()[ERROR]: cannot find info for notification %s", UI:Val2Key( UI.Notifications.types, notification.type ) )
	end

	if not texName then		
		texName = "NoData"
	end

	local hTex = UI:GetTex( texName )

	bannerEffect:SetSpriteTexture( self.effectInfo.banner.spriteName, hTex )

end


-- ---------------------------------------
-- individual notifications' handlers
-- ---------------------------------------

--
function UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- ico
	self:UpdateIcoTrade( notification ) 

	-- text

	local textId = string.format( "ntf_SN_ITEM_PURCHASED_%s", self:ItemType2Suffix( notification.params.defName ) )
	local text = UI:GetStringByName( textId )

    local function L_SubstituteCapture( capture )

		params = notification.params

    	if capture == "module" then

			local defName = ""

			if params.itemDefName then
				defName = params.itemDefName

			elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_MODULE then
				defName = params.defName

			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED()[ERROR]: cannot find module def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
				return "Unknown"
			end

			return self:MakeItemStr( defName, params.iid )


    	elseif capture == "ammo" then

			local defName = ""

			if params.itemDefName then
				defName = params.itemDefName
				                                                                
			elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_ROCKET then
				defName = params.defName

			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED()[ERROR]: cannot find ammo def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
				return "Unknown"
			end

			return self:MakeItemStr( defName, nil )


    	elseif capture == "bundle" then

			local defName = ""

			if params.itemDefName then
				defName = params.itemDefName

			elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_BUNDLE then
				defName = params.defName

			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED()[ERROR]: cannot find bundle def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
				return "Unknown"
			end

			return UI:GetEntityLocalizedNameByDef( defName, true, false, false, false )


    	elseif capture == "bundleItems" then

			if UI:IsDefBundle( notification.params.defName ) then

				local strItems = ""			

				local items = UI:GetBundleItemsFromNotification( notification.params, true )
				for itemIdx, item in ipairs( items ) do

					local strItem = UI:BundleItem2Str( item, true, self.metaText:GetColor() )

					if strItem ~= "" then
						strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ",|" or "", strItem )
					end

				end		

				return strItems

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED()[ERROR]: \"%s\" is not a bundle", notification.params.defName )
			end

    	elseif capture == "resource" then

			if params.itemType == _G.GameStore.ItemType.IT_RESOURCE then

				if type( params.defName ) == "string" then
					return self:MakeResourceStr( params.defName )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED()[ERROR]: invalid type of the field \"defName\" in notification SN_ITEM_PURCHASED; \"string\" expected, got \"%s\"", type( notification.params.defName ) )
					return "Unknown"
				end

			end

    	elseif capture == "blueprint" then

			if params.itemType == _G.GameStore.ItemType.IT_BLUEPRINT then

				if type( params.defName ) == "string" then
					return self:MakeResourceStr( params.defName )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED()[ERROR]: invalid type of the field \"defName\" in notification SN_ITEM_PURCHASED; \"string\" expected, got \"%s\"", type( notification.params.defName ) )
					return "Unknown"
				end

			end

    	elseif capture == "avatar" then

			if params.itemType == _G.GameStore.ItemType.IT_AVATAR then

				local strAvatar = ""

				if type( params.defName ) == "string" then
					strAvatar = UI:GetAvatarName( params.defName )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_PURCHASED()[ERROR]: invalid type of the field \"defName\" in notification SN_ITEM_PURCHASED; \"string\" expected, got \"%s\"", type( notification.params.defName ) )
				end

				if strAvatar == "" then
					strAvatar = "Unknown"
				end

				return self:StringColored( strAvatar )

			end

		end

		return nil

	end

	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_PREMIUM_TIME_PURCHASED( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "premiumTime" then

			local time = self:GetParam( notification.params, "premiumSeconds", 0 )
			return UI:Time2Str421( time, "premNotif" )

		end

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_INVENTORY_EXT_PURCHASED( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )
	self:UpdateTextDefault( notification )

	-- ico
	self:UpdateIcoTrade( notification )

end


--
function UI.NotificationsSlotWnd:Update_SN_AUTOGEN_INVENTORY_EXT_PURCHASED( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )
	self:UpdateTextDefault( notification )

	-- ico
	self:UpdateIcoTrade( notification )

end


--
function UI.NotificationsSlotWnd:Update_SN_ITEM_SOLD( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- ico
	self:UpdateIcoTrade( notification ) 

	-- text

	local textId = ""
	if notification.params.autogenItem then
		textId = string.format( "ntf_SN_ITEM_SOLD_module" )
	else
		textId = string.format( "ntf_SN_ITEM_SOLD_%s", self:ItemType2Suffix( notification.params.defName ) )
	end
	
	local text = UI:GetStringByName( textId )


    local function L_SubstituteCapture( capture )

		params = notification.params

    	if capture == "module" then
		
			if notification.params.autogenItem then
			
				-- tODO: сделать ссылкой (и показывать тултип)
				return UI:Autogen2StrByRollData( notification.params.autogenItem.rollData, notification.params.autogenItem.upgradeLevel, true, false )
				
			else

				local defName = ""

				if params.itemDefName then
					defName = params.itemDefName

				elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_MODULE then
					defName = params.defName

				else
					local notification = UI.Notifications:GetNotification( self.notificationId )
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SOLD()[ERROR]: cannot find module def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
					return "Unknown"
				end

				return self:MakeItemStr( defName, params.iid )
				
			end


    	elseif capture == "ammo" then

			local defName = ""

			if params.itemDefName then
				defName = params.itemDefName

			elseif params.defName and params.itemType == _G.GameStore.ItemType.IT_ROCKET then
				defName = params.defName

			else
				local notification = UI.Notifications:GetNotification( self.notificationId )
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SOLD()[ERROR]: cannot find ammo def name in notification \"%s\"", UI:Val2Key( UI.Notifications.types, notification.type ) )
				return "Unknown"
			end

			return self:MakeItemStr( defName, nil )


    	elseif capture == "resource" then

			if params.itemType == _G.GameStore.ItemType.IT_RESOURCE then

				if type( params.defName ) == "string" then
					return self:MakeResourceStr( params.defName )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SOLD()[ERROR]: invalid type of the field \"defName\" in notification SN_ITEM_SOLD; \"string\" expected, got \"%s\"", type( notification.params.defName ) )
					return "Unknown"
				end

			end


    	elseif capture == "blueprint" then

			if params.itemType == _G.GameStore.ItemType.IT_BLUEPRINT then

				if type( params.defName ) == "string" then
					return self:MakeResourceStr( params.defName )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SOLD()[ERROR]: invalid type of the field \"defName\" in notification SN_ITEM_SOLD; \"string\" expected, got \"%s\"", type( notification.params.defName ) )
					return "Unknown"
				end

			end
			
			
		elseif capture == "amount" then
		
			local count  = 1
			
			if not notification.params.autogenItem then
				count = self:GetParam( notification.params, "amount", 1 )
			end
			
			return self:StringColored( UI:Num2StrSeparatedBy3( count ) )

		else
			return nil
		end

	end

	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_BATTLE_SLOT_VESSEL_INSTALLED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

	local textId = notification.params.bBroken and "ntf_SN_BATTLE_SLOT_VESSEL_INSTALLED_broken" or "ntf_SN_BATTLE_SLOT_VESSEL_INSTALLED_hale"
	local text = UI:GetStringByName( textId )
	text = self:ParseTextDefault( text, notification.params )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_MAINTENANCE_COUNTDOWN( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "time" then			

			local time = self:GetParam( notification.params, "minutesLeft", 0 ) * 60
			return UI:Time2Str42( time )

		end

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_TUTORIAL_COMPLETE( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "tutReward" then			

			local strRewardItems = self:MakeTutorialRewardStr( notification.params )
			if strRewardItems ~= "" then

				local strReward = UI:GetStringByName( "tutReward" )
				return string.gsub( strReward, "%$reward%$", strRewardItems ) 

			else
				return ""
			end

		end

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_GAME_REWARDED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "gameResult" then			

			if notification.params.isWinner == 1 or notification.params.isWinner == true then
				return UI:GetStringByName( "gameResult_win" )

			elseif notification.params.isLooser == 1 or notification.params.isLooser == true then
				return UI:GetStringByName( "gameResult_lose" )

			elseif notification.params.isDraw == 1 or notification.params.isDraw == true then
				return UI:GetStringByName( "gameResult_draw" )

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_GAME_REWARDED()[ERROR]: game result not found" )
			end	
		

		elseif capture == "levelName" then

			local levelName = self:GetParam( notification.params, "levelName", "Unknown" )
			return UI:GetLevelLocalizedName( levelName )


		elseif capture == "date" then

			local platformTime = self:GetParam( notification.params, "createdAt", UI.INVALID_U64_ID )
			local localTime = _G.MasterServer_ServerTimeToLocalTimeT( platformTime )
			return UI:DateTime2Str( localTime )			


		elseif capture == "ships" then

			local strShips = ""

			local shipInfos = self:GetParam( notification.params, "vessels", {} )

			local shipIdxSorted = {}

			if type( shipInfos ) == "table" then

    			-- т.к. возвращается не регулярный массив, то приходится сортировать
    			for idx, shipInfo in pairs( shipInfos ) do
    				table.insert( shipIdxSorted, idx )
    			end

    			table.sort( shipIdxSorted )

    			for idx = 1, #shipIdxSorted do

    				local shipInfo = shipInfos[ shipIdxSorted[ idx ] ]
    				if type( shipInfo ) == "table" then

    					local vid = UI.INVALID_U64_ID 

    					if type( shipInfo.vid ) == "userdata" then
    						vid = shipInfo.vid
    					else
    						sys.log( "UI.NotificationsSlotWnd:Update_SN_GAME_REWARDED()[ERROR]: invalid type of the field \"vessels[%s].vid\"; \"userdata\" expected, got \"%s\"", tostring( idx ), type( shipInfo.vid ) )
    					end

    					if vid ~= UI.INVALID_U64_ID then

    						local shipDefName = ""

        					if type( shipInfo.defName ) == "string" then
        						shipDefName = shipInfo.defName
    						else
        						sys.log( "UI.NotificationsSlotWnd:Update_SN_GAME_REWARDED()[ERROR]: invalid type of the field \"vessels[%s].defName\"; \"string\" expected, got \"%s\"", tostring( idx ), type( shipInfo.defName ) )
        					end

    						local strShip = ""
    				
    						if shipDefName == "" then
    							strShip = "unknown"
    						else
    							strShip = self:MakeShipStr( shipDefName, vid )
    						end

    						strShips = string.format( "%s%s%s", strShips, idx > 1 and ", " or "", strShip  )

    					end

    				else
    					sys.log( "UI.NotificationsSlotWnd:Update_SN_GAME_REWARDED()[ERROR]: invalid type of the field \"vessels[%s]\"; \"table\" expected, got \"%s\"", tostring( idx ), type( shipInfo ) )
    				end

    			end	

			else
    			sys.log( "UI.NotificationsSlotWnd:Update_SN_GAME_REWARDED()[ERROR]: invalid type of the field \"vessels\"; \"table\" expected, got \"%s\"", type( shipInfos ) )
			end
			
			if strShips == "" then
				strShips = UI:GetStringByName( "ntf_SN_GAME_REWARDED_noShips" )
			end

			return strShips


		elseif capture == "gameReward" then

			if UI:IsTrueEx( notification.params.isLeaver ) then
    			return UI:GetStringByName( "ntf_SN_GAME_REWARDED_isLeaver" )				

			else

				local strReward = ""
    			local strRewardItems = self:MakeGameRewardStr( notification.params )

				if strRewardItems ~= "" then

	    			strReward = UI:GetStringByName( "gameReward" )
					strReward = string.gsub( strReward, "%$reward%$", strRewardItems ) 

				end

    			return strReward

			end
			
		end

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_GAME_REWARDED_PREMIUM( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "reward" then
			return self:MakeGameRewardStr( notification.params )			
		end

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_RACE_RANK( notification )

	self:UpdateLayersVisibilityDefault( notification )

	-- ico

	local raceName = UI:Val2Key( ai.Race, notification.params.race )
	if raceName ~= "" then
		local texName = string.format( "notice_race_%s", raceName )	
		self:SetIco( texName )
	else
		sys.log( "UI.NotificationsSlotWnd:Update_RACE_RANK()[ERROR]: invalid race: \"%s\"", tostring( notification.params.race ) )
	end


	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "race" then		

			local race = self:GetParam( notification.params, "race", 0 )
			return self:MakeRaceStr( race )

		elseif capture == "rank" then

			local rank = self:GetParam( notification.params, "rank", 0 )
			return self:MakeRankStr( rank )

		elseif capture == "unlocksByRank" then

			local unlocks = self:GetParam( notification.params, "unlocks", {} )
			return self:MakeUnlocksByRankStr( unlocks )

		end		

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )		

end


--
function UI.NotificationsSlotWnd:Update_SQUAD_REMOTE_PLAYER_JOINED( notification )

	self:UpdateContentSquad( notification )

end


--
function UI.NotificationsSlotWnd:Update_SQUAD_REMOTE_PLAYER_LEFT( notification )

	self:UpdateContentSquad( notification )

end


--
function UI.NotificationsSlotWnd:Update_SQUAD_LOCAL_PLAYER_JOINED( notification )

	self:UpdateContentSquad( notification )

end


--
function UI.NotificationsSlotWnd:Update_SQUAD_LOCAL_PLAYER_LEFT( notification )

	self:UpdateContentSquad( notification )

end


--
function UI.NotificationsSlotWnd:Update_SQUAD_LOCAL_PLAYER_KICKED( notification )

	self:UpdateContentSquad( notification )

end


--
function UI.NotificationsSlotWnd:Update_SQUAD_REMOTE_PLAYER_KICKED( notification )

	self:UpdateContentSquad( notification )

end


--
function UI.NotificationsSlotWnd:Update_CLAN_UNIVERSE_BATTLE_REWARD( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		
	self:UpdateTextClan( notification )

end


--
function UI.NotificationsSlotWnd:Update_SN_VESSEL_CUSTOM_ELEMENTS_CHANGED( notification )

	self:UpdateContentCustomization( notification )

end


--
function UI.NotificationsSlotWnd:Update_SN_VESSEL_CUSTOM_ELEMENTS_EXPIRED( notification )

	self:UpdateContentCustomization( notification )

end


--
function UI.NotificationsSlotWnd:Update_VESSEL_CUSTOM_ELEMENTS_NEW_FREE( notification )

	self:UpdateContentCustomization( notification )

end


--
function UI.NotificationsSlotWnd:Update_SN_WELCOME_MSG( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local text = ""

	if type( notification.params.msg ) == "string" then
		text = UI:ConvertServerString( notification.params.msg )
	else
		sys.log( "UI.NotificationsSlotWnd:Update_SN_WELCOME_MSG()[ERROR]: invalid type of \"msg\"; \"string\" expected, got \"%s\"", type( notification.params.msg ) )
	end

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_MOTD( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local text = ""

	if type( notification.params.msg ) == "string" then
		text = UI:ConvertServerString( notification.params.msg )
	else
		sys.log( "UI.NotificationsSlotWnd:Update_SN_MOTD()[ERROR]: invalid type of \"msg\"; \"string\" expected, got \"%s\"", type( notification.params.msg ) )
	end

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_MOTD_IMPORTANT( notification )

	self:Update_SN_MOTD( notification )

	-- особая анимация фона и иконки	

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animImportant )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( self.effectInfo.ico.animImportant )
	end

end


--
function UI.NotificationsSlotWnd:Update_SN_ITEM_ADVERT( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local strIdx = self:GetParam( notification.params, "stringIdx", 1 )
	local strName = string.format( "ntf_SN_ITEM_ADVERT_%d", strIdx )
	local str = UI:GetStringByName( strName )

	local defName = self:GetParam( notification.params, "defName", "" )
	local strItemLink = self:MakeItemStr( defName )

	str = string.gsub( str, "%$item%$", strItemLink )

	self.metaText:SetText( str, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_PRESTIGE_CHANGED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- text
	-- не подходит стандарнтый парсинг, т.к. не подставляемая цифра должна выделяться особым цветом

    local function L_SubstituteCapture( capture )

		if capture == "prestige" then		

			local prestige = 0

			if type( notification.params.prestige ) == "number" then
				prestige = UI:Round( notification.params.prestige * 100 )
			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_PRESTIGE_CHANGED()[ERROR]: invalid type od the field \"prestige\"; \"number\" expected, got \"%s\"", type( notification.params.prestige ) )
			end

			local baseColor	= self.metaText:GetColor()
			local selColor	= self.textColors[ UI.Notifications.textColors.YELLOW ]

			return string.format( "%s%d%s", UI:Color2Str( selColor ), prestige, UI:Color2Str( baseColor ) )

		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )		

end


--
function UI.NotificationsSlotWnd:Update_SN_VESSEL_LEVELUP( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params )

	local strUnlockedShips = ""

	if type( notification.params.unlockedShips ) == "table" then

		for idx = 1, #notification.params.unlockedShips do

			local unlockedShipDefName = notification.params.unlockedShips[ idx ]
    		local strUnlockedShipLink = self:MakeShipStr( unlockedShipDefName, nil )

    		local strUnlockedShip = UI:GetStringByName( "ntf_SN_VESSEL_LEVELUP_unlockedShip" )
    		strUnlockedShip = string.gsub( strUnlockedShip, "%$ship%$", strUnlockedShipLink )

			strUnlockedShips = string.format( "%s%s%s", strUnlockedShips, strUnlockedShips ~= "" and "|" or "", strUnlockedShip )

		end

	else
		sys.log( "UI.NotificationsSlotWnd:Update_SN_VESSEL_LEVELUP()[ERROR]: invalid type of \"unlockedShips\" param; \"table\" expected, got \"%s\"", type( notification.params.unlockedShips ) )
	end
		

	if strUnlockedShips ~= "" then
		text = string.format( "%s|%s", text, strUnlockedShips )
	end

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

		if capture == "items" then		

			local strItems = ""

			-- модули
			if type( notification.params.modules ) == "table" then

				for idx = 1, #notification.params.modules do

					local moduleInfo = notification.params.modules[ idx ]
					if type( moduleInfo ) == "table" then
					
						local strModule = ""
					
						if moduleInfo.rollData then
			
							-- TODO сделать ссылку (и показывать тултип)
							strModule = UI:Autogen2StrByRollData( moduleInfo.rollData, moduleInfo.upgradeLevel, true )
							
							local baseColor	= self.metaText:GetColor()
							strModule = string.format( "%s%s", strModule, UI:Color2Str( baseColor ) )

						elseif type( moduleInfo.defName ) == "string" then

							if moduleInfo.defName ~= "" then

    							local iid = moduleInfo.iid
    							if type( iid ) ~= "userdata" then
    								sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: invalid type of the field \"modules[%d].iid\"; \"userdata\" expected, got \"%s\"", idx, type( moduleInfo.iid ) )
    								iid = UI.INVALID_U64_ID
    							end
    							
    							strModule = self:MakeItemStr( moduleInfo.defName, iid )

							else
								sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: empty defName" )
							end

						else
							sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: invalid type of the field \"modules[%d].defName\"; \"string\" expected, got \"%s\"", idx, type( moduleInfo.defName ) )
						end
						
						if strModule ~= "" then
							strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ", " or "", strModule )
						end

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: invalid type of the field \"modules[%d]\"; \"table\" expected, got \"%s\"", idx, type( moduleInfo ) )
					end

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: invalid type of the field \"modules\"; \"table\" expected, got \"%s\"", type( notification.params.modules ) )
			end

			-- аммуниция
			if type( notification.params.munition ) == "table" then

				for idx = 1, #notification.params.munition do

					local ammoInfo = notification.params.munition[ idx ]
					if type( ammoInfo ) == "table" then

						if type( ammoInfo.defName ) == "string" then

							if ammoInfo.defName ~= "" then
    							
    							local strAmmo = self:MakeItemStr( ammoInfo.defName )
    							strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ", " or "", strAmmo )

							else
								sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: empty defName" )
							end

						else
							sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: invalid type of the field \"munition[%d].defName\"; \"string\" expected, got \"%s\"", idx, type( ammoInfo.defName ) )
						end

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: invalid type of the field \"munition[%d]\"; \"table\" expected, got \"%s\"", idx, type( ammoInfo ) )
					end

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_MODULE_UNEQUIPPED_MULTI()[ERROR]: invalid type of the field \"munition\"; \"table\" expected, got \"%s\"", type( notification.params.munition ) )
			end

			return strItems

		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_CRAFT_RESULT( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

		if capture == "defName" then		

			local defName = self:GetParam( notification.params, "defName", "" )

			local str = "Unknown"

			if defName ~= "" then

				local numCrafts = self:GetParam( notification.params, "amount", 1 )

				local countByCraft = 1

				local blueprintDefName = self:GetParam( notification.params, "blueprintDefName", "" )
				if blueprintDefName ~= "" then
					local craftResultDefName = ""
					craftResultDefName, countByCraft = UI:GetResourceCraftResult( blueprintDefName )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_CRAFT_RESULT()[ERROR]: cannot find blueprint for \"%s\"", defName )
				end	

				if UI:IsDefModule( defName ) or UI:IsDefAmmo( defName ) then

					local numEnchantedCrafts	= self:GetParam( notification.params, "numEnch", 0 )
					local numNonEnchantedCrafts	= numCrafts - numEnchantedCrafts

					if numEnchantedCrafts == 0 and numNonEnchantedCrafts == 0 then
						numNonEnchantedCrafts = 1
						sys.log( "UI.NotificationsSlotWnd:Update_SN_CRAFT_RESULT()[ERROR]: invalid count" )
					end

					str = ""

					if numEnchantedCrafts > 0 then

						local countEnchanted = numEnchantedCrafts * countByCraft

						local strCount = ""
						if countEnchanted > 1 then
							strCount = string.format( "[%d]", countEnchanted )
						end

						local strEnchanted = string.format( "(%s%s%s)", UI:Color2Str( UI.GOLD_COLOR ), UI:GetStringByName( "enchanted" ), UI:Color2Str( self.metaText:GetColor() ) )

						local strItemEnchanted = self:MakeItemStr( defName, nil, true )
						strItemEnchanted = string.format( "%s%s%s", strItemEnchanted, strCount, strEnchanted )

						str = string.format( "%s%s%s", str, str ~= "" and ", " or "", strItemEnchanted )

					end

					if numNonEnchantedCrafts > 0 then

						local countNonEnchanted = numNonEnchantedCrafts * countByCraft

						local strCount = ""
						if countNonEnchanted > 1 then
							strCount = string.format( "[%d]", countNonEnchanted )
						end

						local strItemNonEnchanted = self:MakeItemStr( defName, nil, false )
						strItemNonEnchanted = string.format( "%s%s", strItemNonEnchanted, strCount )

						str = string.format( "%s%s%s", str, str ~= "" and ", " or "", strItemNonEnchanted )

					end

				elseif UI:IsDefResource( defName ) then

					str = self:MakeResourceStr( defName )

					local count = numCrafts * countByCraft

					local strCount = ""
					if count > 1 then
						strCount = string.format( "[%d]", count )
					end

					str = string.format( "%s%s", str, strCount )

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_CRAFT_RESULT()[ERROR]: unhandled crafted item type (def \"%s\")", defName )
					str = UI:GetEntityLocalizedNameByDef( defName, true, false, false, false )
				end

			end

			return str
		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )

end 


--
function UI.NotificationsSlotWnd:Update_SN_ITEM_SALVAGED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

    	if capture == "item" then

			local strItem = "unknown"

			if type( notification.params.defName ) == "string" then
				strItem = self:MakeItemStr( notification.params.defName, nil )
			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SALVAGED()[ERROR]: invalid type of the field \"defName\"; \"string\" expected, got \"%s\"", type( notification.params.defName ) )
			end

			return strItem

		elseif capture == "refundItems" then		

			local strItems = ""

			local strItemPattern = UI:GetStringByName( "ntf_SN_ITEM_SALVAGED_refundItem" )

			if notification.params.tokensRefund ~= nil then

				if type( notification.params.tokensRefund ) == "number" then

					if notification.params.tokensRefund ~= 0 then

						local strItem = string.format( "%s$tokens$", UI:Num2StrSeparatedBy3( notification.params.tokensRefund ) )
						strItem = string.gsub( strItemPattern, "%$item%$", strItem )

						strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ",|" or "", strItem )
						
					end

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SALVAGED()[ERROR]: invalid type of the field \"tokensRefund\"; \"number\" or \"nil\" expected, got \"%s\"", type( notification.params.tokensRefund ) )
				end
			end

			if notification.params.itemsRefund ~= nil then
				if type( notification.params.itemsRefund ) == "table" then

					for defName, count in pairs( notification.params.itemsRefund ) do

						if type( defName ) == "string" then

							local strItem = self:MakeResourceStr( defName )

							if type( count ) == "number" then

								if count > 1 then
									local strCount = string.format( "[%d]", count )
									strItem = string.format( "%s%s", strItem, strCount )
								end

							else
								sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SALVAGED()[ERROR]: invalid type of the field \"itemsRefund.[\"%s\"]\"; \"number\" expected, got \"%s\"", type( type( count ) ) )	
							end

							strItem = string.gsub( strItemPattern, "%$item%$", strItem )

							strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ",|" or "", strItem )

						else
							sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SALVAGED()[ERROR]: invalid type of the key in field \"itemsRefund\"; \"string\" expected, got \"%s\"", type( type( defName ) ) )	
						end

					end

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_SALVAGED()[ERROR]: invalid type of the field \"itemsRefund\"; \"table\" or \"nil\" expected, got \"%s\"", type( notification.params.itemsRefund ) )
				end
			end			

			return strItems

		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_ACHIEVEMENT_UNLOCKED( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local achvId	= -1
	local rank		= -1

	if type( notification.params.achievementId ) == "number" then
		achvId = notification.params.achievementId
	else
		sys.log( "UI.NotificationsSlotWnd:Update_SN_ACHIEVEMENT_UNLOCKED()[ERROR]: invalid type of field \"achievementId\"; \"number\" expected, got \"%s\"", type( notification.params.achievementId ) )
	end

	if type( notification.params.rank ) == "number" then
		rank = notification.params.rank
	else
		sys.log( "UI.NotificationsSlotWnd:Update_SN_ACHIEVEMENT_UNLOCKED()[ERROR]: invalid type of field \"rank\"; \"number\" expected, got \"%s\"", type( notification.params.rank ) )
	end


	-- иконка

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then

		local hTex = UI:GetAchievementIco( achvId, rank, false )
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )	

	end


	-- текст

    local function L_SubstituteCapture( capture )

    	if capture == "achievement" then
			return self:MakeAchievementStr( achvId, rank )
		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	local gold = UI:GetAchievementAward( achvId, rank )
	if gold ~= 0 then

		local strGoldVal = self:MakeGoldStr( gold )

		local strAward = UI:GetStringByName( "ntf_SN_ACHIEVEMENT_UNLOCKED_award" )
		strAward = string.gsub( strAward, "%$award%$", strGoldVal )

		text = string.format( "%s|%s", text, strAward )

	end

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_TALENT_BUY_SET( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		


	local talentSetId = -1
	if type( notification.params.index ) == "number" then
		talentSetId = notification.params.index
	else
		sys.log( "UI.NotificationsSlotWnd:Update_TALENT_BUY_SET()[ERROR]: invalid type of field \"index\"; \"number\" expected, got \"%s\"", notification.params.index )
	end

	local prices = talentSetId ~= -1 and UI:GetTalentSetPrices( talentSetId ) or {}


	-- иконка

	local bHasGoldPrice = false

	for priceIdx, priceInfo in pairs( prices ) do
		if priceInfo.priceType == _G.GameStore.CreditsType.CT_GOLD then
			bHasGoldPrice = true
			break
		end
	end

	local icoTexName = bHasGoldPrice and "notice_shop_gold" or "note_shop_silver"
	self:SetIco( icoTexName )	


	-- текст

    local function L_SubstituteCapture( capture )

    	if capture == "talent_set" then

			local strName = UI:TalentSet2Str( talentSetId )
			strName = self:StringColored( strName )

			return strName

    	elseif capture == "cost" then

			local baseColor = self.metaText:GetColor()
			local strPrices = ""

			for priceIdx = 1, #prices do

				local priceInfo = prices[ priceIdx ]
				local strPrice = UI:PriceInfo2Str( priceInfo, baseColor, false, nil, false, nil )

				strPrices = string.format( "%s%s%s", strPrices, strPrices ~= "" and ", " or "", strPrice )

			end

			local strCost = UI:GetStringByName( "cost" )
			strCost = string.gsub( strCost, "%$money%$", strPrices ) 

			return strCost

		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_SHIP_QUEST_STARTED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

    	if capture == "shipQuest" then

			local strQuest = "unknown"

			local textId = notification.params.textId
			if type( textId ) == "number" then

				strQuest = UI:ShipQuest2StrByTextId( textId )
				strQuest = self:StringColored( strQuest )

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_SHIP_QUEST_STARTED()[ERROR]: invalid type of field \"textId\"; \"number\" expected, got \"%s\"", type( notification.params.textId ) )
			end

			return strQuest


    	elseif capture == "ships" then

			local strShips = ""

			if type( notification.params.vids ) == "table" then

				if type( notification.params.shipDefNames ) == "table" then

    				for shipIdx = 1, #notification.params.shipDefNames do

    					local shipDefName	= notification.params.shipDefNames[ shipIdx ]
    					local vid			= notification.params.vids[ shipIdx ]

    					local strShip = self:MakeShipStr( shipDefName, vid )
						strShips = string.format( "%s%s%s", strShips, strShips ~= "" and ", " or "", strShip )

    				end

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_SHIP_QUEST_STARTED()[ERROR]: invalid type of field \"shipDefNames\"; \"table\" expected, got \"%s\"", type( notification.params.shipDefNames ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_SHIP_QUEST_STARTED()[ERROR]: invalid type of field \"vids\"; \"table\" expected, got \"%s\"", type( notification.params.vids ) )
			end

			if strShips == "" then
				strShips = "no ships"
			end

			return strShips

		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SHIP_QUEST_COMPLETED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	self:UpdateShipQuestEndText( notification )

end


--
function UI.NotificationsSlotWnd:Update_SHIP_QUEST_ABORTED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	self:UpdateShipQuestEndText( notification )

end


--
function UI.NotificationsSlotWnd:UpdateShipQuestEndText( notification )

	local function L_SubstituteCapture( capture )
	
		if capture == "shipQuest" then
	
			local strQuest = "unknown"

			local textId = notification.params.textId
			if type( textId ) == "number" then

				strQuest = UI:ShipQuest2StrByTextId( textId )
				strQuest = self:StringColored( strQuest )

			else
				sys.log( "UI.NotificationsSlotWnd:UpdateShipQuestEndText()[ERROR]: invalid type of field \"textId\"; \"number\" expected, got \"%s\"", type( notification.params.textId ) )
			end

			return strQuest

		end

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	-- награды

	local rewards = self:GetShipQuestReward( notification.params )
	if next( rewards ) then

		local strRewardsVal = self:MakeQuestRewardStr( rewards )

		local strRewards = UI:GetStringByName( "ntf_shipQuest_rewards" )
		strRewards = string.format( "%s|%s", strRewards, strRewardsVal )

		text = string.format( "%s|%s", text, strRewards )

	end

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:GetShipQuestReward( params )

	local rewards = {}

	-- 1. кредиты	

	local credits = 0

	if params.credits ~= nil then

		if type( params.credits ) == "number" then
			credits = params.credits
		else
			sys.log( "UI.NotificationsSlotWnd:GetShipQuestReward()[ERROR]: invalid type of field \"credits\"; \"number\" or \"nil\" expected, got \"%s\"", type( params.credits ) )
		end

	end

	if credits > 0 then

		local creditsReward =
		{
			rewardType	= UI.questRewardTypes.CREDITS,
			val			= credits,
		}

		table.insert( rewards, creditsReward )

	end


	-- 2. предметы

	if params.items ~= nil then

		if type( params.items ) == "table" then
		
			for itemIdx, itemInfo in ipairs( params.items ) do

				if type( itemInfo ) == "table" then

                	local itemDefName = ""

            		if type( itemInfo.defName ) == "string" then
            			itemDefName = itemInfo.defName
            		else
            			sys.log( "UI.NotificationsSlotWnd:GetShipQuestReward()[ERROR]: invalid type of field \"items[%d].defName\"; \"string\" expected, got \"%s\"", itemIdx, type( itemInfo.defName ) )
            		end

                	if itemDefName ~= "" then

                		local itemCount = 1

            			if type( itemInfo.amount ) == "number" then
            				itemCount = itemInfo.amount
            			else
            				sys.log( "UI.NotificationsSlotWnd:GetShipQuestReward()[ERROR]: invalid type of field \"items[%d].amount\"; \"number\" expected, got \"%s\"", itemIdx, type( itemInfo.amount ) )
            			end

                		local itemReward =
                		{
                			rewardType	= UI.questRewardTypes.ITEM,
                			defName		= itemDefName,
                			count		= itemCount,
                		}

                		table.insert( rewards, itemReward )

                	end

				else
					sys.log( "UI.NotificationsSlotWnd:GetShipQuestReward()[ERROR]: invalid type of field \"items[%d]\"; \"table\" expected, got \"%s\"", itemIdx, type( itemInfo ) )
				end

			end

		else
			sys.log( "UI.NotificationsSlotWnd:GetShipQuestReward()[ERROR]: invalid type of field \"items\"; \"table\" or \"nil\" expected, got \"%s\"", type( params.items ) )
		end

	end

	return rewards

end


--
function UI.NotificationsSlotWnd:MakeQuestRewardStr( rewards )

	local str = ""

	for rewardIdx, reward in ipairs( rewards ) do
		
		local strReward	= "unknown"

		if reward.rewardType == UI.questRewardTypes.CREDITS then

			local strCreditsVal = self:MakeCreditsStr( reward.val )
	
			strReward = UI:GetStringByName( "gameReward_credits" )
			strReward = string.gsub( strReward, "%$credits%$", strCreditsVal )
	

		elseif reward.rewardType == UI.questRewardTypes.ITEM then

			strReward = self:MakeStrForDef( reward.defName )

			if reward.count > 1 then
				strReward = string.format( "%s[%d]", strReward, reward.count )
			end


		elseif reward.rewardType == UI.questRewardTypes.GOLD then

			local strGoldVal = self:MakeGoldStr( reward.val )
	
			strReward = UI:GetStringByName( "gameReward_gold" )
			strReward = string.gsub( strReward, "%$gold%$", strGoldVal )


		elseif reward.rewardType == UI.questRewardTypes.SYNERGY then

    		strReward = UI:GetStringByName( "gameReward_shipSynergy" )

    		local strSynergyVal = self:MakeShipSynergyStr( reward.val )

			local strShip = "unknown ship"

			local shipItem = nil
			if reward.vid ~= UI.INVALID_U64_ID then

				shipItem = UI:GetShipItem( reward.vid, true )

				if shipItem then
					strShip = self:MakeShipStr( shipItem.defName, reward.vid )
				else
					sys.log( "UI.NotificationsSlotWnd:MakeQuestRewardStr()[ERROR]: cannot find ship item for vid %s", _G.U64ToStr( reward.vid ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:MakeQuestRewardStr()[ERROR]: no ship specified for ship synergy" )
			end

			local tSubst =
			{
				synergy	= strSynergyVal,
				ship	= strShip,				
			}

			local numSubst = 0
			strReward, numSubst = string.gsub( strReward, "%$(.-)%$", tSubst )
			if numSubst < 2 then
				sys.log( "UI.NotificationsSlotWnd:MakeQuestRewardStr()[ERROR]: invalid placeholders in string \"gameReward_shipSynergy\"; \"$synergy$\" and \"$ship$\" expected" )
				strReward = string.format( "[INVALID STRING] synergy %s on ship %s", strSynergyVal, strShip )
			end


		elseif reward.rewardType == UI.questRewardTypes.TOKENS then

			local strPlayerIridiumVal = self:MakeIridiumStr( reward.val )
	
			strReward = UI:GetStringByName( "gameReward_playerIridium" )
			strReward = string.gsub( strReward, "%$val%$", strPlayerIridiumVal )
	

		elseif reward.rewardType == UI.questRewardTypes.CLAN_IRIDIUM then

			local strClanIridiumVal = self:MakeClanIridiumStr( reward.val )
	
			strReward = UI:GetStringByName( "gameReward_clanIridium" )
			strReward = string.gsub( strReward, "%$val%$", strClanIridiumVal )

		elseif reward.rewardType == UI.questRewardTypes.ACCOUNT_AURA then

			strReward = self:MakeAccountAuraStr( reward.defName )

		elseif reward.rewardType == UI.questRewardTypes.EVENT_CREDITS then

			local strCreditsVal = self:MakeEventCreditsStr( reward.val )
	
			strReward = UI:GetStringByName( "gameReward_eventCredits" )
			strReward = string.gsub( strReward, "%$val%$", strCreditsVal )

		else
			sys.log( "UI.NotificationsSlotWnd:MakeQuestRewardStr()[ERROR]: unhandled reward type %s", tostring( reward.rewardType ) )
		end


		str = string.format( "%s%s%s", str, str ~= "" and ",|" or "", strReward )

	end

	return str

end


--
function UI.NotificationsSlotWnd:Update_SN_TOURNAMENT_REWARDS( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

    	if capture == "gold" then

			local strRewards = ""

			if notification.params.goldCredits ~= nil then

				local gold = self:GetParam( notification.params, "goldCredits", 0 )
				if gold > 0 then

					local strGold = self:MakeGoldStr( gold )
					strRewards = string.format( "%s%s%s", strRewards, strRewards ~= "" and ", " or "", strGold )

				end

			end

			if notification.params.eventCredits ~= nil then

				local eventCredits = self:GetParam( notification.params, "eventCredits", 0 )
				if eventCredits > 0 then

					local strEventCredits = string.format( "%s$event_credits$", UI:FNum2StrSeparatedBy3( eventCredits ) )
					strRewards = string.format( "%s%s%s", strRewards, strRewards ~= "" and ", " or "", strEventCredits )

				end

			end

			if notification.params.tokenCredits ~= nil then

				local iridium = self:GetParam( notification.params, "tokenCredits", 0 )
				if iridium > 0 then

					local strIridium = string.format( "%s$iridium$", UI:FNum2StrSeparatedBy3( iridium ) )
					strRewards = string.format( "%s%s%s", strRewards, strRewards ~= "" and ", " or "", strIridium )

				end

			end

			if strRewards == "" then
				strRewards = UI:GetStringByName( "rewardNone" )
			end

			return strRewards

		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_STEAM_PURCHASE( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

	local text = ""

	-- золото

	local goldCredits = 0

	if notification.params.goldCredits ~= nil then

		if type( notification.params.goldCredits ) == "number" then
			goldCredits = notification.params.goldCredits
		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_STEAM_PURCHASE()[ERROR]: invalid type of field \"goldCredits\"; \"number\" or \"nil\" expected, got \"%s\"", type( notification.params.goldCredits ) )
		end

	end

	if goldCredits ~= 0 then

		local strGoldVal = self:MakeGoldStr( goldCredits )

		local strId = string.format( "ntf_%s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		local strGold = UI:GetStringByName( strId )

		local numSubst = 0
		strGold, numSubst = string.gsub( strGold, "%$gold%$", strGoldVal )

		if numSubst == 0 then
			sys.log( "UI.NotificationsSlotWnd:Update_SN_STEAM_PURCHASE()[ERROR]: cannot find placeholder \"$gold$\" in string \"%s\"", strId )
			strGold = string.format( "[INVALID STRING] Gold credits got: %s", strGoldVal )
		end

		text = string.format( "%s%s%s", text, text ~= "" and "||" or "", strGold )

	end


	-- премиум

	local timeSec = 0

	if notification.params.premiumTime ~= nil then

		if type( notification.params.premiumTime ) == "userdata" then
			timeSec = ( notification.params.premiumTime * 0.001 ).l
		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_STEAM_PURCHASE()[ERROR]: invalid type of field \"premiumTime\"; \"userdata\" or \"nil\" expected, got \"%s\"", type( notification.params.premiumTime ) )
		end

	end

	if timeSec ~= 0 then

		local strTimeVal = UI:Time2Str421( timeSec )
		strTimeVal = self:StringColored( strTimeVal )

		local strTime = UI:GetStringByName( "ntf_premiumTimeGot" )

		local numSubst = 0
		strTime, numSubst = string.gsub( strTime, "%$premiumTime%$", strTimeVal )

		if numSubst == 0 then
			sys.log( "UI.NotificationsSlotWnd:Update_SN_STEAM_PURCHASE()[ERROR]: cannot find placeholder \"$premiumTime$\" in string \"ntf_premiumTimeGot\"" )
			strTime = string.format( "[INVALID STRING] Premium time got: %s", strTimeVal )
		end

		text = string.format( "%s%s%s", text, text ~= "" and "||" or "", strTime )

	end

	self.metaText:SetText( text, true )	


	-- подарок за золото

	if notification.params.goldBuyingPoints ~= nil then

    	self:ShowGoldRewardWnd()

    	local progressVal = notification.params.goldBuyingPoints

    	if type( progressVal ) ~= "userdata" then
    		sys.log( "UI.NotificationsSlotWnd:Update_SN_STEAM_PURCHASE()[ERROR]: invalid type of field \"goldBuyingPoints\"; \"userdata\" or \"nil\" expected, got \"%s\"", type( notification.params.goldBuyingPoints ) )
    		progressVal = UI.INVALID_U64_ID
    	end

    	self.goldRewardWnd:Setup( progressVal )

	end

end


--
function UI.NotificationsSlotWnd:Update_SN_ARC_PURCHASE( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

	local text = ""

	-- золото

	local goldCredits = 0

	if notification.params.goldCredits ~= nil then

		if type( notification.params.goldCredits ) == "number" then
			goldCredits = notification.params.goldCredits
		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_ARC_PURCHASE()[ERROR]: invalid type of field \"goldCredits\"; \"number\" or \"nil\" expected, got \"%s\"", type( notification.params.goldCredits ) )
		end

	end

	if goldCredits ~= 0 then

		local strGoldVal = self:MakeGoldStr( goldCredits )

		local strId = string.format( "ntf_%s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		local strGold = UI:GetStringByName( strId )

		local numSubst = 0
		strGold, numSubst = string.gsub( strGold, "%$gold%$", strGoldVal )

		if numSubst == 0 then
			sys.log( "UI.NotificationsSlotWnd:Update_SN_ARC_PURCHASE()[ERROR]: cannot find placeholder \"$gold$\" in string \"%s\"", strId )
			strGold = string.format( "[INVALID STRING] Gold credits got: %s", strGoldVal )
		end

		text = string.format( "%s%s%s", text, text ~= "" and "||" or "", strGold )

	end


	-- премиум

	local timeSec = 0

	if notification.params.premiumTime ~= nil then

		if type( notification.params.premiumTime ) == "userdata" then
			timeSec = ( notification.params.premiumTime * 0.001 ).l
		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_ARC_PURCHASE()[ERROR]: invalid type of field \"premiumTime\"; \"userdata\" or \"nil\" expected, got \"%s\"", type( notification.params.premiumTime ) )
		end

	end

	if timeSec ~= 0 then

		local strTimeVal = UI:Time2Str421( timeSec )
		strTimeVal = self:StringColored( strTimeVal )

		local strTime = UI:GetStringByName( "ntf_premiumTimeGot" )

		local numSubst = 0
		strTime, numSubst = string.gsub( strTime, "%$premiumTime%$", strTimeVal )

		if numSubst == 0 then
			sys.log( "UI.NotificationsSlotWnd:Update_SN_ARC_PURCHASE()[ERROR]: cannot find placeholder \"$premiumTime$\" in string \"ntf_premiumTimeGot\"" )
			strTime = string.format( "[INVALID STRING] Premium time got: %s", strTimeVal )
		end

		text = string.format( "%s%s%s", text, text ~= "" and "||" or "", strTime )

	end

	self.metaText:SetText( text, true )	


	-- подарок за золото

	if notification.params.goldBuyingPoints ~= nil then

    	self:ShowGoldRewardWnd()

    	local progressVal = notification.params.goldBuyingPoints

    	if type( progressVal ) ~= "userdata" then
    		sys.log( "UI.NotificationsSlotWnd:Update_SN_ARC_PURCHASE()[ERROR]: invalid type of field \"goldBuyingPoints\"; \"userdata\" or \"nil\" expected, got \"%s\"", type( notification.params.goldBuyingPoints ) )
    		progressVal = UI.INVALID_U64_ID
    	end

    	self.goldRewardWnd:Setup( progressVal )

	end

end


--
function UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED( notification )

	local typeContent = notification.params.type
	local text = ""

	local bShowNotify = false

	if typeContent == MasterServer.DLCContent.DLCC_NAME then

		local textId = "ntf_SN_DLC_PURCHASED_name"
		local name = ""

		if notification.params.name ~= nil then

			if type( notification.params.name ) == "string" then

				name = notification.params.name

				if name ~= "" then

					name = UI:GetStringByName( string.format( "dlc_%s", name ) )

					local str = UI:GetStringByName( textId )
					local strName = self:StringColored( name )

					str = string.gsub( str, "%$name%$", strName )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"name\" empty in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"name\" in notification \"%s\"; \"string\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.name ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"name\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_CREDITS then

		local textId = "ntf_SN_DLC_PURCHASED_credits"
		local credits = 0

		if notification.params.credits ~= nil then

			if type( notification.params.credits ) == "number" then
				credits = notification.params.credits

				if credits > 0 then

					local str = UI:GetStringByName( textId )
					local strCredits = self:MakeCreditsStr( credits )

					str = string.gsub( str, "%$credits%$", strCredits )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"credits\" equal \"%d\" in notification \"%s\"", credits, UI:Val2Key( MasterServer.DLCContent, typeContent ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"credits\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.credits ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"credits\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_GOLD_CREDITS then

		local textId = "ntf_SN_DLC_PURCHASED_gold"
		local gold = 0

		if notification.params.goldCredits ~= nil then

			if type( notification.params.goldCredits ) == "number" then

				gold = notification.params.goldCredits

				if gold > 0 then

					local str = UI:GetStringByName( textId )
					local strGold = self:MakeGoldStr( gold )

					str = string.gsub( str, "%$gold%$", strGold )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"gold\" equal \"%d\" in notification \"%s\"", gold, UI:Val2Key( MasterServer.DLCContent, typeContent ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"gold\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.goldCredits ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"goldCredits\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_TITEL_ID then

		local textId = "ntf_SN_DLC_PURCHASED_title"
		local title = 0

		if notification.params.titleId ~= nil then

			if type( notification.params.titleId ) == "number" then

				title = notification.params.titleId

				if title > 0 then

					local str = UI:GetStringByName( textId )
					local strTitle = self:MakeTitleStr( title )

					str = string.gsub( str, "%$title%$", strTitle )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"title\" equal \"%d\" in notification \"%s\"", title, UI:Val2Key( MasterServer.DLCContent, typeContent ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"title\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.titleId ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"titleId\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_PRIMIUM_TIME then

		local textId = "ntf_SN_DLC_PURCHASED_prem"

		local premiumTime = 0

		if notification.params.premiumTime ~= nil then

			if type( notification.params.premiumTime ) == "number" then

				premiumTime = notification.params.premiumTime

				if premiumTime > 0 then

					local str = UI:GetStringByName( textId )
					premiumTime = self:GetParam( notification.params, "premiumTime", 0 )
					local strPrem = UI:Time2Str421( premiumTime )
					strPrem = self:StringColored( strPrem )
		
					str = string.gsub( str, "%$premiumTime%$", strPrem )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )
		
					bShowNotify = true

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"premiumTime\" equal \"%d\" in notification \"%s\"", premiumTime, UI:Val2Key( MasterServer.DLCContent, typeContent ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"premiumTime\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.premiumTime ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"premiumTime\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_MAX_INV_EXT then

		local textId = "ntf_SN_DLC_PURCHASED_inv"

		local str = UI:GetStringByName( textId )
		text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

		bShowNotify = true

	elseif typeContent == MasterServer.DLCContent.DLCC_ITEM then

		local items = {}

		if notification.params.items ~= nil then

			if type( notification.params.items ) == "table" then

				items = notification.params.items
				local textId = "ntf_SN_DLC_PURCHASED_items"

				local str = UI:GetStringByName( textId )
				local strItems = ""

				local entry = UI:GetStringByName( "ntf_SN_DLC_PURCHASED_itemEntry" )

				for itemIdx, item in ipairs( items ) do

					if type( item ) == "table" then

						local strItem = self:MakeItemStr( item.defName )

						if strItem ~= "" then

							if item.amount ~= nil and item.amount > 1 then
								strItem = string.format( "%s[%d]", strItem, item.amount )
							end

							strItem = string.gsub( entry, "%$item%$", strItem )
							strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ",|" or "", strItem )

						end

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"item\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( item ) )
					end

				end

				if strItems ~= "" then

					str = string.gsub( str, "%$items%$", strItems )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"items\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.items ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"items\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_STICKER then

		if notification.params.stickers ~= nil then

			if type( notification.params.stickers ) == "table" then

				local stickers	= notification.params.stickers

				local textId = "ntf_SN_DLC_PURCHASED_customs"
				text = UI:GetStringByName( textId )

				local strCustoms = ""

				for idx, sticker in ipairs( stickers ) do

					local defName = sticker.defName
					local customizationType = UI:GetCustomizationTypeByName( defName )

					local strCustomizationType = UI:Val2Key( ai.VesselCustomElementType, customizationType )
					if strCustomizationType ~= "" then

						local customStrId = string.format( "custom_%s", strCustomizationType )
						local strCustom = UI:GetStringByName( customStrId )

						local customName = UI:ShipCustomization2Str( defName )
						customName = self:StringColored( customName )

						strCustom = string.gsub( strCustom, "%$custom%$", customName )

						strCustoms = string.format( "%s%s%s", strCustoms, strCustoms ~= "" and "|" or "", strCustom )

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid customization type %d for def \"%s\" in notification \"%s\"", customizationType, defName, UI:Val2Key( MasterServer.DLCContent, typeContent ) )
					end

				end

				if strCustoms ~= "" then

					text = string.format( "%s|%s", text, strCustoms )
					bShowNotify = true

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"stickers\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.stickers ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"stickers\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_BUNDLE then

		local textId = "ntf_SN_DLC_PURCHASED_bundle"
		local bundle = {}

		if notification.params.bundle ~= nil then

			if type( notification.params.bundle ) == "table" then

				bundle = notification.params.bundle

				if bundle.defName and bundle.itemType == _G.GameStore.ItemType.IT_BUNDLE then

					if UI:IsDefBundle( bundle.defName ) then

						local str = UI:GetStringByName( textId )
						local strBundle = UI:GetStringByName( string.format( "%s_name", bundle.defName ) )
						strBundle = self:StringColored( strBundle )

						str = string.gsub( str, "%$bundle%$", strBundle )

						local strItems = ""

						local items = UI:GetBundleItemsFromNotification( bundle, true )
						for itemIdx, item in ipairs( items ) do

							local strItem = UI:BundleItem2Str( item, true, self.metaText:GetColor() )

							if strItem ~= "" then
								strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ",|" or "", strItem )
							end

						end

						if strItems ~= "" then

							str = string.gsub( str, "%$bundleItems%$", strItems )
							text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

							bShowNotify = true

						end

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: \"%s\" is not a bundle", bundle.defName )
					end

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"bundle\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.bundle ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"bundle\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_VESSEL then

		local vessels = {}

		if notification.params.vessels ~= nil then

			if type( notification.params.vessels ) == "table" then

				vessels = notification.params.vessels

				local textId = "ntf_SN_DLC_PURCHASED_vessels"

				local str = UI:GetStringByName( textId )
				local strVessels = ""
				local entry = UI:GetStringByName( "ntf_SN_DLC_PURCHASED_vesselEntry" )

				for vesselIdx, vessel in ipairs( vessels ) do

					if type( vessel ) == "table" then

						local strVessel = self:MakeShipStr( vessel.defName, vessel.vid )

						if strVessel ~= "" then

							strVessel = string.gsub( entry, "%$ship%$", strVessel )
							strVessels = string.format( "%s%s%s", strVessels, strVessels ~= "" and ",|" or "", strVessel )

						end

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"vessel\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( vessel ) )
					end

				end

				if strVessels ~= "" then

					str = string.gsub( str, "%$ships%$", strVessels )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"vessels\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.vessels ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"vessels\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_BATTLE_PASS_PRIMIUM then

		local textId = "ntf_SN_DLC_PURCHASED_battlePass"
		local stage = 0

		if notification.params.stage ~= nil then

			if type( notification.params.stage ) == "number" then

				stage = notification.params.stage

				if stage > 0 then

					local str = UI:GetStringByName( textId )

					str = string.gsub( str, "%$stage%$", stage )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"stage\" equal \"%d\" in notification \"%s\"", stage, UI:Val2Key( MasterServer.DLCContent, typeContent ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"stage\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.stage ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"stage\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	elseif typeContent == MasterServer.DLCContent.DLCC_ACCOUNT_AURA then

		local aura = ""

		if notification.params.aura ~= nil then

			if type( notification.params.aura ) == "string" then

				aura = notification.params.aura
				local strAuras = ""

				if UI:IsAccountAuraVoucher( aura ) then

					local textId = "ntf_SN_DLC_PURCHASED_aura"
					local str = UI:GetStringByName( textId )

					local strAura = self:MakeAccountAuraStr( aura )
					str = string.gsub( str, "%$aura%$", strAura )
					text = string.format( "%s%s%s", text, text ~= "" and "||" or "", str )

					bShowNotify = true

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: invalid type of the field \"auras\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ), type( notification.params.auras ) )
			end

		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_DLC_PURCHASED()[ERROR]: field \"auras\" nil in notification \"%s\"", UI:Val2Key( MasterServer.DLCContent, typeContent ) )
		end

	end

	if bShowNotify then

		self:UpdateLayersVisibilityDefault( notification )
		self:UpdateIcoDefault( notification )
		self:UpdateSeverityDefault( notification )
		self:UpdateColorDefault( notification )

		self.metaText:SetText( text, true )

	end

end

--
function UI.NotificationsSlotWnd:Update_SN_YUP_PURCHASE( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

	local text = ""

	-- золото

	local goldCredits = 0

	if notification.params.goldCredits ~= nil then

		if type( notification.params.goldCredits ) == "number" then
			goldCredits = notification.params.goldCredits
		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_YUP_PURCHASE()[ERROR]: invalid type of field \"goldCredits\"; \"number\" or \"nil\" expected, got \"%s\"", type( notification.params.goldCredits ) )
		end

	end

	if goldCredits ~= 0 then

		local strGoldVal = self:MakeGoldStr( goldCredits )

		local strId = string.format( "ntf_%s", UI:Val2Key( UI.Notifications.types, notification.type ) )
		local strGold = UI:GetStringByName( strId )

		local numSubst = 0
		strGold, numSubst = string.gsub( strGold, "%$gold%$", strGoldVal )

		if numSubst == 0 then
			sys.log( "UI.NotificationsSlotWnd:Update_SN_YUP_PURCHASE()[ERROR]: cannot find placeholder \"$gold$\" in string \"%s\"", strId )
			strGold = string.format( "[INVALID STRING] Gold credits got: %s", strGoldVal )
		end

		text = string.format( "%s%s%s", text, text ~= "" and "||" or "", strGold )

	end


	-- премиум

	local timeSec = 0

	if notification.params.premiumTime ~= nil then

		if type( notification.params.premiumTime ) == "userdata" then
			timeSec = ( notification.params.premiumTime * 0.001 ).l
		else
			sys.log( "UI.NotificationsSlotWnd:Update_SN_YUP_PURCHASE()[ERROR]: invalid type of field \"premiumTime\"; \"userdata\" or \"nil\" expected, got \"%s\"", type( notification.params.premiumTime ) )
		end

	end

	if timeSec ~= 0 then

		local strTimeVal = UI:Time2Str421( timeSec )
		strTimeVal = self:StringColored( strTimeVal )

		local strTime = UI:GetStringByName( "ntf_premiumTimeGot" )

		local numSubst = 0
		strTime, numSubst = string.gsub( strTime, "%$premiumTime%$", strTimeVal )

		if numSubst == 0 then
			sys.log( "UI.NotificationsSlotWnd:Update_SN_YUP_PURCHASE()[ERROR]: cannot find placeholder \"$premiumTime$\" in string \"ntf_premiumTimeGot\"" )
			strTime = string.format( "[INVALID STRING] Premium time got: %s", strTimeVal )
		end

		text = string.format( "%s%s%s", text, text ~= "" and "||" or "", strTime )

	end

	self.metaText:SetText( text, true )	


	-- подарок за золото

	if notification.params.goldBuyingPoints ~= nil then

    	self:ShowGoldRewardWnd()

    	local progressVal = notification.params.goldBuyingPoints

    	if type( progressVal ) ~= "userdata" then
    		sys.log( "UI.NotificationsSlotWnd:Update_SN_YUP_PURCHASE()[ERROR]: invalid type of field \"goldBuyingPoints\"; \"userdata\" or \"nil\" expected, got \"%s\"", type( notification.params.goldBuyingPoints ) )
    		progressVal = UI.INVALID_U64_ID
    	end

    	self.goldRewardWnd:Setup( progressVal )

	end

end


--
function UI.NotificationsSlotWnd:Update_BUNDLE_GOT( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

		if capture == "bundle" then

			local defName = notification.params.bundle

			if type( defName ) ~= "string" then
				sys.log( "UI.NotificationsSlotWnd:Update_BUNDLE_GOT()[ERROR]: invalid type of field \"bundle\"; \"string\" expected, got \"%s\"", type( notification.params.bundle ) )
				defName = ""
			end

			return UI:GetEntityLocalizedNameByDef( defName, true, false, false, false )

		elseif capture == "bundleItems" then

			local strItems = ""			

			local items = UI:GetBundleItemsFromNotification( notification.params, true )
			for itemIdx, item in ipairs( items ) do

				local strItem = UI:BundleItem2Str( item, true, self.metaText:GetColor() )

				if strItem ~= "" then
					strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ",|" or "", strItem )
				end

			end		

			return strItems

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_BONUS_BUNDLE( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

		if capture == "bundle" then

			local defName = _G.GameStore_GetBonusBundleDef() 
			return UI:GetEntityLocalizedNameByDef( defName, true, false, false, false )

		elseif capture == "bundleItems" then

			local strItems = ""			

			local items = UI:GetBundleItemsFromNotification( notification.params, true )
			for itemIdx, item in ipairs( items ) do

				local strItem = UI:BundleItem2Str( item, true, self.metaText:GetColor() )

				if strItem ~= "" then
					strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ",|" or "", strItem )
				end

			end		

			return strItems

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

		if capture == "zone" then

			local strZone = "unknown zone"

			if type( notification.params.zid ) == "number" then
				local zoneName = UI:ZoneId2Name( notification.params.zid )
				strZone = UI:Zone2Str( zoneName )
			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: invalid type of field \"zid\"; \"number\" expected, got \"%s\"", type( notification.params.zid ) )
			end

			strZone = self:StringColored( strZone )
			return strZone

		elseif capture == "new_clan" then

			local name	= "unknown clan"
			local tag	= "unknown tag"

			if type( notification.params.new ) == "table" then

				if type( notification.params.new.name ) == "string" then
					name = notification.params.new.name
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: invalid type of field \"new.name\"; \"string\" expected, got \"%s\"", type( notification.params.new.name ) )
				end

				if type( notification.params.new.tag ) == "string" then
					tag = notification.params.new.tag
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: invalid type of field \"new.tag\"; \"string\" expected, got \"%s\"", type( notification.params.new.tag ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: invalid type of field \"new\"; \"table\" expected, got \"%s\"", type( notification.params.new ) )
			end

			strClan = UI:FormatClanName( name, tag )
			strClan = self:StringColored( strClan )

			return strClan

		elseif capture == "old_clan" then

			local name	= "unknown clan"
			local tag	= "unknown tag"

			if type( notification.params.old ) == "table" then

				if type( notification.params.old.name ) == "string" then
					name = notification.params.old.name
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: invalid type of field \"old.name\"; \"string\" expected, got \"%s\"", type( notification.params.old.name ) )
				end

				if type( notification.params.old.tag ) == "string" then
					tag = notification.params.old.tag
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: invalid type of field \"old.tag\"; \"string\" expected, got \"%s\"", type( notification.params.old.tag ) )
				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: invalid type of field \"old\"; \"table\" expected, got \"%s\"", type( notification.params.old ) )
			end

			strClan = UI:FormatClanName( name, tag )
			strClan = self:StringColored( strClan )

			return strClan

		end

		return nil

	end

	local text = ""

	local bNewOwner	= notification.params.new ~= nil
	local bOldOwner	= notification.params.old ~= nil

	if bNewOwner and bOldOwner then
		text = UI:GetStringByName( "ntf_SN_ZONE_OWNER_CHANGED_oldAndNew" )

	elseif bOldOwner then
		text = UI:GetStringByName( "ntf_SN_ZONE_OWNER_CHANGED_oldOnly" )

	elseif bNewOwner then
		text = UI:GetStringByName( "ntf_SN_ZONE_OWNER_CHANGED_newOnly" )

	else
		sys.log( "UI.NotificationsSlotWnd:Update_SN_ZONE_OWNER_CHANGED()[ERROR]: neither old nor new owner" )
	end

	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_CLANSHIP_BUILDING_FINISHED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	-- текст

    local function L_SubstituteCapture( capture )

		if capture == "clan" then

			local name	= "unknown clan"
			local tag	= "unknown tag"

			if type( notification.params.name ) == "string" then
				name = notification.params.name
			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_CLANSHIP_BUILDING_FINISHED()[ERROR]: invalid type of field \"name\"; \"string\" expected, got \"%s\"", type( notification.params.name ) )
			end

			if type( notification.params.tag ) == "string" then
				tag = notification.params.tag
			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_CLANSHIP_BUILDING_FINISHED()[ERROR]: invalid type of field \"tag\"; \"string\" expected, got \"%s\"", type( notification.params.tag ) )
			end

			strClan = UI:FormatClanName( name, tag )
			strClan = self:StringColored( strClan )

			return strClan

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_QUEST_ACCEPTED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local questId = self:GetParam( notification.params, "questId", -1 )

	-- текст

    local function L_SubstituteCapture( capture )

    	if capture == "quest" then
			return self:StringColored( UI:Quest2Str( questId ) )
		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )
	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_QUEST_COMPLETED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local questId = self:GetParam( notification.params, "questId", -1 )

	-- текст

    local function L_SubstituteCapture( capture )

    	if capture == "quest" then
			return self:StringColored( UI:Quest2Str( questId ) )
		end		

		return nil

	end

	local text = self:GetTextDefault( notification )		                                                          	
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	-- награды

	local completionData = self:GetParam( notification.params, "completionData", nil )

	local rewards = UI:GetQuestRewards( questId, false, nil, nil, completionData )
	if next( rewards ) then

		local strRewardsVal = self:MakeQuestRewardStr( rewards )

		local strRewards = UI:GetStringByName( "ntf_shipQuest_rewards" )
		strRewards = string.format( "%s|%s", strRewards, strRewardsVal )		

		text = string.format( "%s|%s", text, strRewards )

	end

    self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_ADVENTURE_FINAL( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	--local atid = self:GetParam( notification.params.completionData, "atid", 0 )
	local completionData = self:GetParam( notification.params, "completionData", nil )
	local atid = completionData.atid
	local stageFinal = completionData.stageFinal


	-- текст

	local function L_SubstituteCapture( capture )

		if capture == "adventure" then
			return self:StringColored( UI:Adventure2Str( atid, "name" ) )
		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )


	-- награды

	local rewards = UI:GetAdventureRewards( atid, stageFinal, completionData )
	if next( rewards ) then

		local strRewardsVal = self:MakeQuestRewardStr( rewards )

		local strRewards = UI:GetStringByName( "ntf_adventure_rewards" )
		strRewards = string.format( "%s|%s", strRewards, strRewardsVal )

		text = string.format( "%s|%s", text, strRewards )

	end

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_MASSIVE_SALE( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

	local modulesAmount	= self:GetParam( notification.params, "modulesSold", 0 )
	local ammoAmount	= self:GetParam( notification.params, "munitionSold", 0 )

	local amount = modulesAmount + ammoAmount
	local strAmount = self:StringColored( UI:Num2StrSeparatedBy3( amount ) )


	local credits = self:GetParam( notification.params, "refundCredits", 0 )
	if type( credits ) == "userdata" then
		credits = tonumber( _G.U64ToStr( credits ) )
	end
	local strCredits = self:MakeCreditsStr( credits )			

	local strCost = UI:GetStringByName( "cost" )
	strCost = string.gsub( strCost, "%$money%$", strCredits )


	local text = self:GetTextDefault( notification )

	text = string.gsub( text, "%$cost%$", strCost )
	text = UI:SubstituteValLocalized( text, amount, "amount", strAmount, nil )	

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_MASSIVE_RESOURCE_SALE( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

	local amount = self:GetParam( notification.params, "resourcesSold", 0 )
	local strAmount = self:StringColored( UI:Num2StrSeparatedBy3( amount ) )


	local credits = self:GetParam( notification.params, "refundCredits", 0 )
	if type( credits ) == "userdata" then
		credits = tonumber( _G.U64ToStr( credits ) )
	end
	local strCredits = self:MakeCreditsStr( credits )			

	local strCost = UI:GetStringByName( "cost" )
	strCost = string.gsub( strCost, "%$money%$", strCredits )


	local text = self:GetTextDefault( notification )

	text = string.gsub( text, "%$cost%$", strCost )
	text = UI:SubstituteValLocalized( text, amount, "amount", strAmount, nil )	

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_LETTER_GOODS( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "cost" then

			local gold = 0

			if type( notification.params.goldCost ) == "number" then
				gold = notification.params.goldCost
			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_LETTER_GOODS()[ERROR]: invalid type of field \"goldCost\"; \"number\" expected, got \"%s\"", type( notification.params.goldCost ) )
			end

			return string.gsub( UI:GetStringByName( "cost" ), "%$money%$", self:MakeGoldStr( gold ) ) 

		elseif capture == "items" then

			local strItems = ""

			if type( notification.params.items ) == "table" then

				local itemsSorted = {}

				for defName, amount in pairs( notification.params.items ) do

					if type( defName ) == "string" and type( amount ) == "number" then

						local itemInfo =
						{
							defName	= defName,
							amount	= amount,
						}

						table.insert( itemsSorted, itemInfo )

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_LETTER_GOODS()[ERROR]: invalid format of table \"items\"; <string>=<number> expected, got <%s>=<%s>", type( defName ), type( amount ) )
					end

				end

				local function fnSort( itemInfo1, itemInfo2 )
					return itemInfo1.defName < itemInfo2.defName
				end

				table.sort( itemsSorted, fnSort )

				for idx, itemInfo in ipairs( itemsSorted ) do

					local strItem = self:MakeStrForDef( itemInfo.defName )

					if itemInfo.amount > 1 then
						strItem = string.format( "%s[%d]", strItem, itemInfo.amount )
					end

					strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ", " or "", strItem )

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_LETTER_GOODS()[ERROR]: invalid type of field \"items\"; \"table\" expected, got \"%s\"", type( notification.params.items ) )
			end

			return strItems

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_LETTER_PAYMENT( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "items" then

			local strItems = ""

			if type( notification.params.items ) == "table" then

				local itemsSorted = {}

				for defName, amount in pairs( notification.params.items ) do

					if type( defName ) == "string" and type( amount ) == "number" then

						local itemInfo =
						{
							defName	= defName,
							amount	= amount,
						}

						table.insert( itemsSorted, itemInfo )

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_LETTER_PAYMENT()[ERROR]: invalid format of table \"items\"; <string>=<number> expected, got <%s>=<%s>", type( defName ), type( amount ) )
					end

				end

				local function fnSort( itemInfo1, itemInfo2 )
					return itemInfo1.defName < itemInfo2.defName
				end

				table.sort( itemsSorted, fnSort )

				for idx, itemInfo in ipairs( itemsSorted ) do

					local strItem = self:MakeStrForDef( itemInfo.defName )

					if itemInfo.amount > 1 then
						strItem = string.format( "%s[%d]", strItem, itemInfo.amount )
					end

					strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ", " or "", strItem )

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_LETTER_PAYMENT()[ERROR]: invalid type of field \"items\"; \"table\" expected, got \"%s\"", type( notification.params.items ) )
			end

			return strItems
			
		elseif capture == "goldCost" then
			
			local goldCost = self:GetParam( notification.params, "goldCost", 0 )
			return self:MakeGoldStr( goldCost )
		
		elseif capture == "tax" then
		
			local goldCost = self:GetParam( notification.params, "goldCost", 0 )
			local goldReceived = self:GetParam( notification.params, "gold", 0 )
			
			local tax = goldCost ~= 0 and ( goldCost - goldReceived ) / goldCost or 0
			
			-- округляется до одного знака после запятой в бОльшую сторону SC-112434#focus=streamItem-4-613073.0-0
			local taxFixed = tax * 100
			taxFixed = math.ceil( taxFixed * 10 ) / 10
			local strTax = string.format( "%.01f", taxFixed )
			
			return self:StringColored( strTax )
		
		elseif capture == "tradeMoney" then
		
			local tradeMoney = self:GetParam( notification.params, "tradeMoneyOld", u64( 0 ) )	--tradeMoneyOld это u64
			return string.format( "%s$gold_big$", _G.U64ToStr( tradeMoney ) )

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_LETTER_ITEMS( notification )

	self:Update_SN_LETTER_GOODS( notification )

end


--
function UI.NotificationsSlotWnd:Update_SN_ITEM_BURNED( notification )

	self:UpdateLayersVisibilityDefault( notification )
   	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )

	-- text

    local function L_SubstituteCapture( capture )

		if capture == "items" then

			local strItems = ""

			if type( notification.params.contents ) == "table" then

				for defName, count in pairs( notification.params.contents ) do

					if type( defName ) == "string" and type( count ) == "number" then

						local strItem = UI.NotificationsSlotWnd:MakeStrForDef( defName )

            			if count > 1 then
            				strItem = string.format( "%s[%d]", strItem, count )
            			end

						strItems = string.format( "%s%s%s", strItems, strItems ~= "" and ", " or "", strItem )

					else
						sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_BURNED()[ERROR]: invalid format of table \"contents\"; <string>=<number> expected, got <%s>=<%s>", type( defName ), type( count ) )
					end

				end

			else
				sys.log( "UI.NotificationsSlotWnd:Update_SN_ITEM_BURNED()[ERROR]: invalid type of \"contents\"; \"table\" expected, got \"%s\"", type( notification.params.contents ) )
			end

			return strItems

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )	

end


--
function UI.NotificationsSlotWnd:Update_SN_UPGRADE_RESULT( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )		

	local bEnchanted	= UI:IsTrueEx( self:GetParam( notification.params, "ench", 0 ) )
	local credits		= self:GetParam( notification.params, "creditsCost", 0 )
	local gold			= self:GetParam( notification.params, "goldCost", 0 )

	-- иконка

	local ico = gold ~= 0 and "notice_shop_gold" or "note_shop_silver"
	self:SetIco( ico )	

	-- текст

    local function L_SubstituteCapture( capture )

		if capture == "oldDefName" then		

			local str = "Unknown"

			local oldDefName = self:GetParam( notification.params, "oldDefName", "" )
			if oldDefName ~= "" then

				if UI:IsDefModule( oldDefName ) or UI:IsDefAmmo( oldDefName ) then
					str = self:MakeItemStr( oldDefName, nil, bEnchanted )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_UPGRADE_RESULT()[ERROR]: unhandled item type for oldDefName \"%s\"", oldDefName )
					str = UI:GetEntityLocalizedNameByDef( oldDefName, true, false, false, false )
				end

			end

			return str

		elseif capture == "newDefName" then

			local str = "Unknown"

			local newDefName = self:GetParam( notification.params, "newDefName", "" )
			if newDefName ~= "" then

				if UI:IsDefModule( newDefName ) or UI:IsDefAmmo( newDefName ) then
					str = self:MakeItemStr( newDefName, nil, bEnchanted )
				else
					sys.log( "UI.NotificationsSlotWnd:Update_SN_UPGRADE_RESULT()[ERROR]: unhandled item type for newDefName \"%s\"", newDefName )
					str = UI:GetEntityLocalizedNameByDef( newDefName, true, false, false, false )
				end

			end

			return str

		elseif capture == "cost" then

			local str = ""

			local credits = self:GetParam( notification.params, "creditsCost", 0 )

			if credits ~= 0 then

				local strVal = self:MakeMoneyStr( 0, credits )
				str = UI:GetStringByName( "cost" )
				str = string.gsub( str, "%$money%$", strVal )

			end			

    		return str

		end		

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_ITEM_CONVERTED( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )
	
	-- текст
	
	local function L_SubstituteCapture( capture )

		if capture == "oldItem" then
		
			local oldDefName = ""
			if type( notification.params.oldItem ) == "string" then
				oldDefName = notification.params.oldItem
			else
				sys.log( "UI.NotificationsSlotWnd:Update_ITEM_CONVERTED()[ERROR]: invalid type of \"oldItem\"; \"string\" expected, got \"%s\"", type( notification.params.oldItem ) )
			end
			
			local str = self:MakeStrForDef( oldDefName )
			
			local oldAmount = 1
			if type( notification.params.oldItemAmount ) == "number" then
				oldAmount = notification.params.oldItemAmount
			else
				sys.log( "UI.NotificationsSlotWnd:Update_ITEM_CONVERTED()[ERROR]: invalid type of \"oldItemAmount\"; \"number\" expected, got \"%s\"", type( notification.params.oldItemAmount ) )
			end
			
			if oldAmount > 1 then
				str = string.format( "%s[%d]", str, oldAmount )
			end

			return str

		elseif capture == "newItem" then
		
			local newDefName = ""
			if type( notification.params.newItem ) == "string" then
				newDefName = notification.params.newItem
			else
				sys.log( "UI.NotificationsSlotWnd:Update_ITEM_CONVERTED()[ERROR]: invalid type of \"newItem\"; \"string\" expected, got \"%s\"", type( notification.params.newItem ) )
			end
			
			local str = self:MakeStrForDef( newDefName )
			
			local newAmount = 1
			if type( notification.params.newItemAmount ) == "number" then
				newAmount = notification.params.newItemAmount
			else
				sys.log( "UI.NotificationsSlotWnd:Update_ITEM_CONVERTED()[ERROR]: invalid type of \"newItemAmount\"; \"number\" expected, got \"%s\"", type( notification.params.newItemAmount ) )
			end
			
			if newAmount > 1 then
				str = string.format( "%s[%d]", str, newAmount )
			end

			return str

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )
	
end


--
function UI.NotificationsSlotWnd:Update_UNLIM_PVE_MISSION_LEVEL_UP( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )
	
		-- текст
	
	local function L_SubstituteCapture( capture )

		if capture == "mission" then
		
			local missionName = self:GetParam( notification.params, "mission", "" )
			return self:StringColored( UI:PveMission2Str( missionName ) )

		elseif capture == "level" then
		
			local level = self:GetParam( notification.params, "level", 0 )
			return self:StringColored( tostring( level ) )

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_IMAGINARY_QUEST_REWARD( notification )

	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )
	
	-- текст
	
	local function L_SubstituteCapture( capture )

		if capture == "amount" then
		
			local eventCredits = self:GetParam( notification.params, "amount", 0 )
			return self:MakeEventCreditsStr( eventCredits )

		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )

end


--
function UI.NotificationsSlotWnd:Update_SN_AUTOGEN_DESTROYED( notification )
	
	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )
	
	-- текст
	
	local function L_SubstituteCapture( capture )

		if capture == "name" then
			-- tODO: сделать ссылкой (и показывать тултип)
			return UI:Autogen2StrByRollData( notification.params.autogenItem.rollData, notification.params.autogenItem.upgradeLevel, true, false )
		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )
	
end


--
function UI.NotificationsSlotWnd:Update_SN_AUTOGEN_DISMANTLED( notification )
	
	self:UpdateLayersVisibilityDefault( notification )
	self:UpdateIcoDefault( notification )
	self:UpdateSeverityDefault( notification )
	self:UpdateColorDefault( notification )
	
	-- текст
	
	local function L_SubstituteCapture( capture )

		if capture == "name" then
			-- tODO: сделать ссылкой (и показывать тултип)
			return UI:Autogen2StrByRollData( notification.params.rollData, notification.params.upgradeLevel, true, false )
		end

		return nil

	end

	local text = self:GetTextDefault( notification )
	text = self:ParseTextDefault( text, notification.params, L_SubstituteCapture )

	self.metaText:SetText( text, true )

end



-- ----------------------------------------------------------------------------
-- UI.NotificationsSlot_GoldRewardWnd
-- ----------------------------------------------------------------------------

UI.NotificationsSlot_GoldRewardWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.NotificationsSlot_GoldRewardWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "NotificationsSlot_GoldRewardWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "notifications_slot_goldReward",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",	
						layer		= "UI.NotificationsSlot_GoldRewardWnd.layers.PROGRESS_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "progr",	
						layer		= "UI.NotificationsSlot_GoldRewardWnd.layers.PROGRESS_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PROGRESS_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- PROGRESS_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "notifications_slot_goldReward_progressPb",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.NotificationsSlot_GoldRewardWnd:Setup( progressVal )

	self:Reset()

	if type( progressVal ) ~= "userdata" then
		sys.log( "UI.NotificationsSlot_GoldRewardWnd()[ERROR]: invalid type of the 1-st parameter (\"progressVal\"); \"userdata\" expected, got \"%s\"", type( progressVal ) )
		progressVal = UI.INVALID_U64_ID
	end

	self.progressVal = progressVal
	self:FullUpdate()

end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.NotificationsSlot_GoldRewardWnd.layers =
{
    MAIN_EFFECT			= 0,
    PROGRESS_VAL		= 1,
    PROGRESS_PB_EFFECT	= 2,
}

UI.NotificationsSlot_GoldRewardWnd.effectInfo =
{
	main =
	{
		maxValColorLocator	= "color",
		bundleIcoLocator	= "present",
	}
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.NotificationsSlot_GoldRewardWnd.progressVal	= UI.INVALID_U64_ID
UI.NotificationsSlot_GoldRewardWnd.bundleIcoWnd	= nil
UI.NotificationsSlot_GoldRewardWnd.maxValColor	= UI.WHITE_COLOR

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.NotificationsSlot_GoldRewardWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		self.maxValColor = mainEffect:GetObjColor( self.effectInfo.main.maxValColorLocator )
	end

	self:CreateControls()

end


--
function UI.NotificationsSlot_GoldRewardWnd:CreateControls()

	self.bundleIcoWnd = UI:CreateChildWnd( self, UI.NotificationsSlot_BundleIcoWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	UI:AddChildAndLink( self, self.bundleIcoWnd, mainEffect, self.effectInfo.main.bundleIcoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

end


--
function UI.NotificationsSlot_GoldRewardWnd:Reset()

	self:SetText( "", self.layers.PROGRESS_VAL ) 

	local progressPbEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_PB_EFFECT )
	if progressPbEffect then
		progressPbEffect:SetAnimationTime( 0 )
		progressPbEffect:Update( 0 )		
	end

	self.bundleIcoWnd:SetTooltipData( nil )

end


--
function UI.NotificationsSlot_GoldRewardWnd:FullUpdate()

	self:UpdateProgressVal()
	self:UpdateProgressPb()
	self:UpdateBundleIco()

end


--
function UI.NotificationsSlot_GoldRewardWnd:UpdateProgressVal()

	local val		= tonumber( _G.U64ToStr( self.progressVal ) )
	local maxVal	= _G.GameStore_GetBonusBundlePoints()

	local str = string.format( "%s%s/%s", UI:Num2StrSeparatedBy3( val ), UI:Color2Str( self.maxValColor ), UI:Num2StrSeparatedBy3( maxVal ) )
	self:SetText( str, self.layers.PROGRESS_VAL ) 

end


--
function UI.NotificationsSlot_GoldRewardWnd:UpdateProgressPb()

	local progressPbEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_PB_EFFECT )
	if not progressPbEffect then
		return
	end

	local val		= tonumber( _G.U64ToStr( self.progressVal ) )
	local maxVal	= _G.GameStore_GetBonusBundlePoints()

	local animTime = maxVal ~= 0 and val / maxVal or 0

	progressPbEffect:SetAnimationTime( animTime )
	progressPbEffect:Update( 0 )		

end


--
function UI.NotificationsSlot_GoldRewardWnd:UpdateBundleIco()

	local tooltipData = nil

	local bundleDefName = _G.GameStore_GetBonusBundleDef()

	if type( bundleDefName ) ~= "string" then
		sys.log( "UI.NotificationsSlot_GoldRewardWnd:UpdateBundleIco()[ERROR]: invalid type of return value from _G.GameStore_GetBonusBundleDef(); \"string\" expected, got \"%s\"", type( bundleDefName ) )
		bundleDefName = ""
	end

	if bundleDefName ~= "" then
	
    	tooltipData =
    	{
    		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
    		caption		= UI:GetEntityLocalizedNameByDef( bundleDefName, true, false, false, false ),
    		text		= UI:GetBundleDesc( bundleDefName, false, UI.TooltipWnd_shared:GetTextColor() ),
    	}

	else
		sys.log( "UI.NotificationsSlot_GoldRewardWnd:UpdateBundleIco()[ERROR]: invalid bandle def" )
	end

	self.bundleIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.NotificationsSlot_GoldRewardWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.NotificationsSlot_GoldRewardWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.NotificationsSlot_GoldRewardWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos()
	end

	local progressPbEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_PB_EFFECT )
	if progressPbEffect then
		progressPbEffect:Update( 0 )		
	end

end


-- ----------------------------------------------------------------------------
-- UI.NotificationsSlot_BundleIcoWnd
-- ----------------------------------------------------------------------------

UI.NotificationsSlot_BundleIcoWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.NotificationsSlot_BundleIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "NotificationsSlot_BundleIcoWnd",
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
				defName 			= "notifications_slot_goldReward_bundleIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self68",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.NotificationsSlot_BundleIcoWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.NotificationsSlot_BundleIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.NotificationsSlot_BundleIcoWnd.tooltipData	= nil