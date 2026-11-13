-- ----------------------------------------------------------------------------
-- UI.ShipIcoWnd
-- ----------------------------------------------------------------------------

UI.ShipIcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipIcoWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "ShipIcoWnd",
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
				defName 			= "hangar_shipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name_ship",
						layer		= "UI.ShipIcoWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gmp_icon",
						layer		= "UI.ShipIcoWnd.layers.ROLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ship_type_val",
						layer		= "UI.ShipIcoWnd.layers.SHIP_RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ship_ico",
						layer		= "UI.ShipIcoWnd.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "fraction_ico",
						layer		= "UI.ShipIcoWnd.layers.RACE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "lvlup",
						layer		= "UI.ShipIcoWnd.layers.UPGRADE_ARROW_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "progr",
						layer		= "UI.ShipIcoWnd.layers.UPGRADE_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "role_max",
						layer		= "UI.ShipIcoWnd.layers.MAX_SYNERGY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "dead",
						layer		= "UI.ShipIcoWnd.layers.STATUS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipIcoWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "premium",
						layer		= "UI.ShipIcoWnd.layers.GOLD_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blink_4",
						layer		= "UI.ShipIcoWnd.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- UPGRADE_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName				= "hangar_shipSlot_upgradePb",
				defaultAnimation	= "idle",
			}}
		},

		-- SHIP_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_shipIco",
				defaultAnimation	= "idle",
			}}
		},

		-- SHIP_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- MAX_SYNERGY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_battleSlot_maxSynergy",
				defaultAnimation	= "gold",
			}}
		},

		-- ROLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- SHIP_RANK
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- RACE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_faction",
				defaultAnimation	= "idle",
			}}
		},

		-- UPGRADE_ARROW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shipLevelUpIco",
				defaultAnimation	= "idle",
			}}
		},

		-- STATUS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_destroyed",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_buy",
						layer		= "UI.ShipIcoWnd.layers.STATUS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},   

		-- STATUS_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small", },
		},

		-- GOLD_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_shipIco_goldFrame",
				defaultAnimation	= "idle",
			}}
		},

		-- BLINK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_shipIco_blink",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "hangar_shipSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipIcoWnd:Setup( defName, data )

	self:Reset()

	self.defName	= defName
	self.data		= data

	self:FullUpdate()

end


--
function UI.ShipIcoWnd:GetDefName()

	return self.defName

end


--
function UI.ShipIcoWnd:GetData()

	return self.data

end


--
function UI.ShipIcoWnd:Reset()

	self:SetText( "", self.layers.SHIP_NAME )

	self:SetLayerVisible( false, self.layers.RACE_ICO_EFFECT )	
	self:SetLayerVisible( false, self.layers.SHIP_RANK )
	self:SetLayerVisible( false, self.layers.UPGRADE_ARROW_EFFECT )	
	self:SetLayerVisible( false, self.layers.UPGRADE_PB_EFFECT )
	self:SetLayerVisible( false, self.layers.MOUSE_OVER_EFFECT )
	self:SetLayerVisible( false, self.layers.GOLD_FRAME_EFFECT )
	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if shipIcoEffect then
		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.icoSpriteName, UI.INVALID_RESOURCE_HANDLE ) 
	end

	local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_EFFECT )
	if roleEffect then
		roleEffect:SetSpriteTexture( self.effectInfo.role.icoSpriteName, UI.INVALID_RESOURCE_HANDLE ) 
	end

	self:SetLayerVisible( false, self.layers.STATUS_EFFECT )
	self:SetLayerVisible( false, self.layers.STATUS_TEXT )
	self.statusMetaText:SetText( "", true )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	self.defName			= ""
	self.data				= nil
	self.tooltipData		= nil
	self.bMouseOverEnabled	= false

end


--
function UI.ShipIcoWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipIcoWnd:ShowUpgradeArrow()

	self:SetLayerVisible( true, self.layers.UPGRADE_ARROW_EFFECT )	

end


--
function UI.ShipIcoWnd:HideUpgradeArrow()

	self:SetLayerVisible( false, self.layers.UPGRADE_ARROW_EFFECT )	

end


--
function UI.ShipIcoWnd:ShowUpgradePb()

	self:SetLayerVisible( true, self.layers.UPGRADE_PB_EFFECT )	

end


--
function UI.ShipIcoWnd:HideUpgradePb()

	self:SetLayerVisible( false, self.layers.UPGRADE_PB_EFFECT )	

end


--
function UI.ShipIcoWnd:SetUpgradePbAnimTime( animTime )

	local upgradePbEffect = UI:GetEffectFromLayer( self, self.layers.UPGRADE_PB_EFFECT )
	if upgradePbEffect then
		upgradePbEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


--
function UI.ShipIcoWnd:EnableMouseOver( bEnable )

	self.bMouseOverEnabled = bEnable

	if self:IsOnScreen() then
		self:UpdateMouseOver()
	end

end


--
function UI.ShipIcoWnd:ShowStatus( str )

	self:SetLayerVisible( true, self.layers.STATUS_EFFECT )
	self:SetLayerVisible( true, self.layers.STATUS_TEXT )
	self.statusMetaText:SetText( str, true )

end


--
function UI.ShipIcoWnd:HideStatus()

	self:SetLayerVisible( false, self.layers.STATUS_EFFECT )
	self:SetLayerVisible( false, self.layers.STATUS_TEXT )
	self.statusMetaText:SetText( "", true )

end


--
function UI.ShipIcoWnd:GetStatusColor()

	return self:GetColor( self.layers.STATUS_TEXT )

end


--
function UI.ShipIcoWnd:AnimateBgIdle()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

end


--
function UI.ShipIcoWnd:AnimateBgSelect()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animSelect )
	end

end


--
function UI.ShipIcoWnd:AnimateBgNoFrame()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animNoFrame )
	end

end


--
function UI.ShipIcoWnd:ShowGoldFrame()

	self:SetLayerVisible( true, self.layers.GOLD_FRAME_EFFECT )

end


--
function UI.ShipIcoWnd:HideGoldFrame()

	self:SetLayerVisible( false, self.layers.GOLD_FRAME_EFFECT )

end


--
function UI.ShipIcoWnd:ShowBlink()

	self:SetLayerVisible( true, self.layers.BLINK_EFFECT )

	local blinkEffect = UI:GetEffectFromLayer( self, self.layers.BLINK_EFFECT )
	if blinkEffect then
		blinkEffect:SetAnimationTimeAndUpdate( 0 )
	end	

end


--
function UI.ShipIcoWnd:HideBlink()

	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )

end


--
function UI.ShipIcoWnd:ShowShipName()

	self:SetLayerVisible( true, self.layers.SHIP_NAME )
	self:UpdateShipName()	

end


--
function UI.ShipIcoWnd:HideShipName()

	self:SetLayerVisible( false, self.layers.SHIP_NAME )

end


--
function UI.ShipIcoWnd:OnShipExpChanged()

	if self.defName == "" then
		sys.log( "UI.ShipIcoWnd()[ERROR]: not inited" )
		return
	end

	self:UpdateMaxSynergyEffect()

end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipIcoWnd.layers =
{
    MAIN_EFFECT				= 0,
	UPGRADE_PB_EFFECT		= 1,
	SHIP_ICO_EFFECT     	= 2,
    SHIP_NAME				= 3,
	MAX_SYNERGY_EFFECT		= 4,
    ROLE_EFFECT				= 5,
    SHIP_RANK				= 6,
	RACE_ICO_EFFECT			= 7,
	UPGRADE_ARROW_EFFECT	= 8,
	STATUS_EFFECT			= 9,
	STATUS_TEXT				= 10,
	GOLD_FRAME_EFFECT		= 11,
	BLINK_EFFECT			= 12,
	MOUSE_OVER_EFFECT		= 13,
}

UI.ShipIcoWnd.effectInfo =
{
	main =
	{
		animIdle	= "idle",
		animSelect	= "select",
		animNoFrame	= "no_frame",
	},

	role =
	{
		icoSpriteName	= "ico",
	},

	shipIco =
	{
		icoSpriteName	= "ico_ship",

	},

	raceIco =
	{
		icoSpriteName	= "ico_fraction",
	}
}

UI.ShipIcoWnd.sounds =
{
	mouseOver = "sound/ui/btnMouseOver",
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ShipIcoWnd.defName			= ""
UI.ShipIcoWnd.data				= nil
UI.ShipIcoWnd.tooltipData		= nil
UI.ShipIcoWnd.bMouseOverEnabled	= false
UI.ShipIcoWnd.statusMetaText	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipIcoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.statusMetaText = UI.MetaText.GetNewInstance()
	self.statusMetaText:InitFromLayer( self, self.layers.STATUS_TEXT )

	self:Reset()

end


--
function UI.ShipIcoWnd:F_Shutdown()

	if self.statusMetaText then
		self.statusMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.ShipIcoWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываетьс€ при инициализации окна, !когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then

		self:UpdateMetaTextPos()

		-- при инициализации списка слоты мен€ют позицию, поэтому состо€ние наведени€ мышью может потом стать неактуальным
		self:UpdateMouseOver()

	end

end


--
function UI.ShipIcoWnd:UpdateMetaTextPos()

	self.statusMetaText:UpdateScreenOrgFromLayer( self, self.layers.STATUS_TEXT )

end


--
function UI.ShipIcoWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.STATUS_TEXT then
		self.statusMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipIcoWnd:FullUpdate()

	self:UpdateShipName()
	self:UpdateShipIco()
	self:UpdateRace()
	self:UpdateRole()
	self:UpdateShipRank()
	self:UpdateTooltip()
	self:UpdateMaxSynergyEffect()

end


--
function UI.ShipIcoWnd:UpdateShipName()	

	local nameLocalized = UI:GetEntityLocalizedNameByDef( self.defName, true )
	self:SetText( nameLocalized, self.layers.SHIP_NAME )

end   


--
function UI.ShipIcoWnd:UpdateShipIco()

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if not shipIcoEffect then
		return
	end

	local hTex = UI:GetShipIco( self.defName )
	shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.icoSpriteName, hTex )

end


--
function UI.ShipIcoWnd:UpdateRace()

	self:SetLayerVisible( false, self.layers.RACE_ICO_EFFECT )

	local race = UI:GetItemRace( self.defName )
	if race ~= -1 then

		self:SetLayerVisible( true, self.layers.RACE_ICO_EFFECT )

       	local raceEffect = UI:GetEffectFromLayer( self, self.layers.RACE_ICO_EFFECT )
    	if raceEffect then

			local hTex = UI:GetRaceIcoMediumColored( race )
			raceEffect:SetSpriteTexture( self.effectInfo.raceIco.icoSpriteName, hTex )

		end

	end

end      


--
function UI.ShipIcoWnd:UpdateRole()

	local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_EFFECT )
	if not roleEffect then
		return
	end

	local role = UI:GetItemRole( self.defName )

	local hTex = UI:GetRoleIco( role )
	roleEffect:SetSpriteTexture( self.effectInfo.role.icoSpriteName, hTex )

	local color = UI:GetItemColor( self.defName )
	roleEffect:SetColor( color )

end


--
function UI.ShipIcoWnd:UpdateShipRank()

	self:SetLayerVisible( false, self.layers.SHIP_RANK )

	local rank = UI:GetShipRank( self.defName )
	if rank ~= -1 then
		self:SetLayerVisible( true, self.layers.SHIP_RANK )
		self:SetText( tostring( rank ), self.layers.SHIP_RANK )			
	end

end


--
function UI.ShipIcoWnd:UpdateMaxSynergyEffect()

	local level		= -1
	local maxLevel	= UI:GetShipMaxLevel( self.defName )

	if self.data then

    	if self.data.vid and self.data.vid ~= UI.INVALID_U64_ID then

    		local shipItem = UI:GetShipItem( self.data.vid, true )
    		if shipItem then
    			level = UI:GetShipLevel( shipItem )
    		else
    			sys.log( "UI.ShipIcoWnd:UpdateMaxSynergyEffect()[ERROR]: cannot find ship item" )
    		end
    		
    	elseif self.data.shipInfo then
    		level = self.data.shipInfo.level
    	end

	end

	if level == nil or level == -1 then    	
		level = UI:GetShipDefaultLevel( self.defName )
	end	

	local bMaxSynergy = level >= maxLevel
	self:SetLayerVisible( bMaxSynergy, self.layers.MAX_SYNERGY_EFFECT )

end


--
function UI.ShipIcoWnd:UpdateTooltip()

	if self.data and self.data.bDisableTooltip then

		self.tooltipData = nil
		
	else

		self.tooltipData =
		{
			tooltipType	= UI.tooltipTypes.SHIP,
			defName		= self.defName,
		}

		if self.data then

			self.tooltipData.vid		= self.data.vid
			self.tooltipData.shipInfo	= self.data.shipInfo
			self.tooltipData.playerId	= self.data.playerId
			self.tooltipData.playerUid	= self.data.playerUid
			self.tooltipData.logEvent	= self.data.tooltipLogEvent

		end
		
	end

end


--
function UI.ShipIcoWnd:UpdateMouseOver()

	local bMouseOver = false

	if self.bMouseOverEnabled then
    	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
    	if wndUnderMouse == self then
    		bMouseOver = true
    	end
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipIcoWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.ShipIcoWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ShipIcoWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end