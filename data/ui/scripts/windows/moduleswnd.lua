-- ----------------------------------------------------------------------------
--
-- Workfile: moduleswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ModulesWnd = {}
local mw = UI.ModulesWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.ModulesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ModulesWnd",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "modules_main",
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

-- ------------------------------
-- const
-- ------------------------------

mw.layers =
{
    MAIN_EFFECT			= 0,
}

mw.MAX_SLOTS = 6	-- НЕ включая специальный слот

mw.effectInfo =
{
	main =
	{
		slotLocators_WEAPON =
		{
			locator	= "slot_1"
		},

		slotLocators_ROCKETS =
		{
			locator = "missle_1"
		},

		slotLocators_MODULE =
		{
			locatorPrefix = "modul_"
		},

		slotLocators_SPECIAL =
		{
			locator	= "modules_special"
		},
	}
}

-- ------------------------------
-- vars
-- ------------------------------

mw.slots	= {}
mw.specSlot	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ModulesWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateSlots()
	self:Reset()

end


--
function UI.ModulesWnd:CreateSlots()

	for slotIdx = 1, self.MAX_SLOTS do	
		local slotWnd = UI:CreateChildWnd( self, UI.Modules_SlotWnd, tostring( slotIdx ) )
		table.insert( self.slots, slotWnd )
	end
	
	self.specSlot = UI:CreateChildWnd( self, UI.Modules_SpecialSlotWnd, "" )

end



--
function UI.ModulesWnd:Reset()

	self:HideAllSlots()

end


--
function UI.ModulesWnd:ShowSlot( slotWnd, locator )

	if locator then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, slotWnd, mainEffect, locator, UI.EffectAnimParams.POS )
	else
		self:AddChild( slotWnd )
	end

end


--
function UI.ModulesWnd:HideSlot( slotWnd )

	slotWnd:Reset()
	slotWnd:UnlinkFromParent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
	end

end


--
function UI.ModulesWnd:HideAllSlots()

	for slotIdx, slotWnd in pairs( self.slots ) do		
		self:HideSlot( slotWnd )
	end

	self:HideSlot( self.specSlot )

end


--
function UI.ModulesWnd:GetFreeSlot()

	for slotIdx, slotWnd in pairs( self.slots ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return nil

end


-- for override
function UI.ModulesWnd:FullUpdate()
end


-- ----------------------------------------------------------------------
-- UI.Modules_SlotWnd
-- ----------------------------------------------------------------------

UI.Modules_SlotWnd = {}
local ms = UI.Modules_SlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Modules_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Modules_SlotWnd",
		style		= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "modules_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "buff_icon",
						layer		= "UI.Modules_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "key",
						layer		= "UI.Modules_SlotWnd.layers.KEY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "namber_ship",
						layer		= "UI.Modules_SlotWnd.layers.TARGETS_COUNT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					}, 

					{
						objName		= "module_inactive",
						layer		= "UI.Modules_SlotWnd.layers.ICO_INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modules_icon",
						layer		= "UI.Modules_SlotWnd.layers.ICO_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "marker_1",	
						layer		= "UI.Modules_SlotWnd.layers.COLOR_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "marker_2",	
						layer		= "UI.Modules_SlotWnd.layers.COLOR_ENCHANTMENT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modules_icon",	
						layer		= "UI.Modules_SlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "icon_gold",	
						layer		= "UI.Modules_SlotWnd.layers.ENCHANTMENT_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "destroy",	
						layer		= "UI.Modules_SlotWnd.layers.DESTROYED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "cooldown",
						layer		= "UI.Modules_SlotWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "frame",
						layer		= "UI.Modules_SlotWnd.layers.COLOR2_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "star",
						layer		= "UI.Modules_SlotWnd.layers.ENCHANTMENT2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bg_2",
						layer		= "UI.Modules_SlotWnd.layers.INFLUENCE_COLOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ICO_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_icoBg",
				defaultAnimation	= "active",
			}}
		}, 
		
		-- INFLUENCE_COLOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			
			effects =
			{{
				defName 			= "itemIco_influenceColor",
				defaultAnimation	= "active",
			}}
		},

		-- COLOR_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_colorBg",
				defaultAnimation	= "idle",
			}}
		},   

		-- COLOR_ENCHANTMENT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_colorEnchantment",
				defaultAnimation	= "idle",
			}}
		},   

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_sel",
				defaultAnimation	= "activity_on",
			}}
		}, 

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "spellIco",
				defaultAnimation	= "color",
			}}
		}, 

		-- ENCHANTMENT_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_enchantmentFrame",
				defaultAnimation	= "active",
			}}
		},	
		
		-- COLOR2_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_color2Frame",
				defaultAnimation	= "active",
			}}
		},
		
		-- ENCHANTMENT2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "itemIco_enchantment2",
				defaultAnimation	= "active",
			}}
		},
		
		-- ICO_INACTIVE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_icoInactive",
				defaultAnimation	= "idle",
			}}
		},

		-- COOLDOWN_TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },			
		},

		-- KEY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_key",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "number",
						layer		= "UI.Modules_SlotWnd.layers.KEY",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		}, 

		-- KEY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },			
		},

		-- TARGETS_COUNT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_targetsCount",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "number",
						layer		= "UI.Modules_SlotWnd.layers.TARGETS_COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TARGETS_COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },			
		},

		-- DESTROYED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_destroyed",
				defaultAnimation	= "idle",
			}}
		},

		-- невидимый, в логике не используется, нужен чисто для организации локаторов в эффекте
		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_work",
				defaultAnimation	= "idle",

				links =
				{
    				{
    					objName		= "cooldown_text",	
    					layer		= "UI.Modules_SlotWnd.layers.COOLDOWN_TIME",
    					animParams	= UI.EffectAnimParams.ALL,
    				},

    				{
    					objName		= "reload",	
    					layer		= "UI.Modules_SlotWnd.layers.AMMO_EFFECT",
    					animParams	= UI.EffectAnimParams.POS,
    				},

    				{
    					objName		= "flash",	
    					layer		= "UI.Modules_SlotWnd.layers.FLASH_EFFECT",
    					animParams	= UI.EffectAnimParams.POS,
    				},
				}
			}}
		},

		-- FLASH_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_flash",
				defaultAnimation	= "idle",
			}}
		},

		-- AMMO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_ammo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.Modules_SlotWnd.layers.AMMO_COUNT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "progr",
						layer		= "UI.Modules_SlotWnd.layers.AMMO_RELOAD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- AMMO_COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },			
		},

		-- AMMO_RELOAD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "modules_slot_ammoReload",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Modules_SlotWnd:Reset()

	self:SetLayerVisible( false, self.layers.ICO_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_INACTIVE_EFFECT )
	self:SetLayerVisible( false, self.layers.KEY_EFFECT )
	self:SetLayerVisible( false, self.layers.KEY )
	self:SetLayerVisible( false, self.layers.AMMO_EFFECT )
	self:SetLayerVisible( false, self.layers.AMMO_COUNT )
	self:SetLayerVisible( false, self.layers.AMMO_RELOAD_EFFECT )
	self:SetLayerVisible( false, self.layers.TARGETS_COUNT_EFFECT )
	self:SetLayerVisible( false, self.layers.TARGETS_COUNT )
	self:SetLayerVisible( false, self.layers.COOLDOWN_TIME )
	self:SetLayerVisible( false, self.layers.COLOR_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.COLOR_ENCHANTMENT_EFFECT )
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )
	self:SetLayerVisible( false, self.layers.ENCHANTMENT_FRAME_EFFECT )
	self:SetLayerVisible( false, self.layers.DESTROYED_EFFECT )
	self:SetLayerVisible( false, self.layers.FLASH_EFFECT )
	self:SetLayerVisible( false, self.layers.COLOR2_FRAME_EFFECT )
	self:SetLayerVisible( false, self.layers.ENCHANTMENT2_EFFECT )
	self:SetLayerVisible( false, self.layers.INFLUENCE_COLOR_EFFECT )

	if self.icoBgEffect then
		self.icoBgEffect:StartAnimationById( self.animIdIcoBgActive )
	end

	if self.keyEffect then
		self.keyEffect:StartAnimationById( self.animIdKeyActive )
	end

	self.ammoCount		= -1
	self.targetsCount	= -1
	self.cooldownTime	= -1
	self.isInited		= false
	self.data			= nil

	self.tooltipData	= nil

end


--
function UI.Modules_SlotWnd:SetEmpty()

	self:Reset()

	self:SetLayerVisible( true, self.layers.ICO_BG_EFFECT )	

	if self.icoBgEffect then
		self.icoBgEffect:StartAnimationById( self.animIdIcoBgEmpty )
	end

end


--
function UI.Modules_SlotWnd:ShowIco( defName, phase )

	self:SetLayerVisible( true, self.layers.ICO_BG_EFFECT )
	self:SetLayerVisible( true, self.layers.ICO_EFFECT )

	UI:UpdateItemIco( defName, self, self.layers.ICO_EFFECT, false, phase )

end   


--
function UI.Modules_SlotWnd:ShowIcoDirect( hTex )

	self:SetLayerVisible( true, self.layers.ICO_BG_EFFECT )
	self:SetLayerVisible( true, self.layers.ICO_EFFECT )

	UI:SetItemIcoDirect( hTex, self, self.layers.ICO_EFFECT )

end   


--
function UI.Modules_SlotWnd:HideIco()

	self:SetLayerVisible( false, self.layers.ICO_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.ICO_INACTIVE_EFFECT )
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )

end


--
function UI.Modules_SlotWnd:ShowColorBg( color, bEnchantment )

	if bEnchantment == nil then
		bEnchantment = false
	end

	self:SetLayerVisible( true, self.layers.COLOR_BG_EFFECT )
	self:SetLayerVisible( bEnchantment, self.layers.COLOR_ENCHANTMENT_EFFECT )	

	if self.colorBgEffect then

		local bgColor = color
		if bEnchantment then
			bgColor = UI:GetPremiumItemColor( false )
		end

		self.colorBgEffect:SetColor( bgColor )

	end

	if self.colorEnchantmentEffect then
		self.colorEnchantmentEffect:SetColor( color )
	end

	self:SetLayerVisible( bEnchantment, self.layers.ENCHANTMENT_FRAME_EFFECT )

end


--
function UI.Modules_SlotWnd:HideColorBg()

	self:SetLayerVisible( false, self.layers.COLOR_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.COLOR_ENCHANTMENT_EFFECT )
	self:SetLayerVisible( false, self.layers.ENCHANTMENT_FRAME_EFFECT )

end


--
function UI.Modules_SlotWnd:ShowColorBg2( color, bEnchantment )

	if bEnchantment == nil then
		bEnchantment = false
	end

	self:SetLayerVisible( true, self.layers.COLOR2_FRAME_EFFECT )

	local frameEffect = UI:GetEffectFromLayer( self, self.layers.COLOR2_FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetColor( color )
	end

	self:SetLayerVisible( bEnchantment, self.layers.ENCHANTMENT2_EFFECT )

end


--
function UI.Modules_SlotWnd:HideColorBg2()

	self:SetLayerVisible( false, self.layers.COLOR2_FRAME_EFFECT )
	self:SetLayerVisible( false, self.layers.ENCHANTMENT2_EFFECT )

end


--
function UI.Modules_SlotWnd:AnimateIcoActive()

	self:SetLayerVisible( false, self.layers.ICO_INACTIVE_EFFECT )
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )

	if self.icoBgEffect and self.icoBgEffect:GetCurAnimationId() ~= self.animIdIcoBgActive then
		self.icoBgEffect:StartAnimationById( self.animIdIcoBgActive )
	end

end


--
function UI.Modules_SlotWnd:AnimateIcoSuperActive()

	self:SetLayerVisible( false, self.layers.ICO_INACTIVE_EFFECT )
	self:SetLayerVisible( true, self.layers.SEL_EFFECT )

	if self.icoBgEffect and self.icoBgEffect:GetCurAnimationId() ~= self.animIdIcoBgActive then
		self.icoBgEffect:StartAnimationById( self.animIdIcoBgActive )
	end

end


--
function UI.Modules_SlotWnd:AnimateIcoInactive()

	self:SetLayerVisible( true, self.layers.ICO_INACTIVE_EFFECT )
	self:SetLayerVisible( false, self.layers.SEL_EFFECT )

	if self.icoBgEffect and self.icoBgEffect:GetCurAnimationId() ~= self.animIdIcoBgActive then
		self.icoBgEffect:StartAnimationById( self.animIdIcoBgActive )
	end

end


--
function UI.Modules_SlotWnd:IsIcoInactive()

	return self:IsLayerVisible( self.layers.ICO_INACTIVE_EFFECT )

end


--
function UI.Modules_SlotWnd:SetKey( strKey )

	self:SetText( strKey, self.layers.KEY )

end


--
function UI.Modules_SlotWnd:ShowKey()

	self:SetLayerVisible( true, self.layers.KEY_EFFECT )
	self:SetLayerVisible( true, self.layers.KEY )

end


--
function UI.Modules_SlotWnd:HideKey()

	self:SetLayerVisible( false, self.layers.KEY_EFFECT )
	self:SetLayerVisible( false, self.layers.KEY )

end


--
function UI.Modules_SlotWnd:AnimateKeyInactive()

	if self.keyEffect and self.keyEffect:GetCurAnimationId() ~= self.animIdKeyInactive then
		self.keyEffect:StartAnimationById( self.animIdKeyInactive )
	end

end


--
function UI.Modules_SlotWnd:AnimateKeyActive()

	if self.keyEffect and self.keyEffect:GetCurAnimationId() ~= self.animIdKeyActive then
		self.keyEffect:StartAnimationById( self.animIdKeyActive )
	end

end 


--
function UI.Modules_SlotWnd:ShowAmmoCount( ammoCount )

	if ammoCount ~= self.ammoCount then
		self:SetLayerVisible( true, self.layers.AMMO_EFFECT )
		self:SetLayerVisible( true, self.layers.AMMO_COUNT )
		self:SetText( tostring( ammoCount ), self.layers.AMMO_COUNT )
		self.ammoCount = ammoCount
	end

end


--
function UI.Modules_SlotWnd:HideAmmoCount()

	if not self:IsLayerVisible( self.layers.AMMO_RELOAD_EFFECT ) then
		self:SetLayerVisible( false, self.layers.AMMO_EFFECT )
	end
	self:SetLayerVisible( false, self.layers.AMMO_COUNT )
	self.ammoCount = -1

end


--
function UI.Modules_SlotWnd:GetAmmoCount()

	return self.ammoCount

end


--
function UI.Modules_SlotWnd:ShowAmmoReload( val )

	self:SetLayerVisible( true, self.layers.AMMO_EFFECT )
	self:SetLayerVisible( true, self.layers.AMMO_RELOAD_EFFECT )

	if self.ammoReloadEffect then
		self.ammoReloadEffect:SetAnimationTimeAndUpdate( 1 - val )
	end

end


--
function UI.Modules_SlotWnd:HideAmmoReload()

	if not self:IsLayerVisible( self.layers.AMMO_COUNT ) then
		self:SetLayerVisible( false, self.layers.AMMO_EFFECT )
	end
	self:SetLayerVisible( false, self.layers.AMMO_RELOAD_EFFECT )

end


--
function UI.Modules_SlotWnd:ShowTargetsCount( targetsCount )

	if targetsCount ~= self.targetsCount then
		self:SetLayerVisible( true, self.layers.TARGETS_COUNT_EFFECT )
		self:SetLayerVisible( true, self.layers.TARGETS_COUNT )
		self:SetText( string.format( "%d %s", targetsCount, self.strTargetsCountUnits ), self.layers.TARGETS_COUNT )
		self.targetsCount = targetsCount
	end

end


--
function UI.Modules_SlotWnd:HideTargetsCount()

	self:SetLayerVisible( false, self.layers.TARGETS_COUNT_EFFECT )
	self:SetLayerVisible( false, self.layers.TARGETS_COUNT )
	self.targetsCount = -1

end


--
function UI.Modules_SlotWnd:ShowCooldownTime( cooldownTime )

	if cooldownTime ~= self.cooldownTime then
		self:SetLayerVisible( true, self.layers.COOLDOWN_TIME )
		self:SetText( tostring( cooldownTime ), self.layers.COOLDOWN_TIME )
		self.cooldownTime = cooldownTime
	end

end


--
function UI.Modules_SlotWnd:HideCooldownTime()

	self:SetLayerVisible( false, self.layers.COOLDOWN_TIME )
	self.cooldownTime = -1

end


--
function UI.Modules_SlotWnd:GetCooldownTime()

	return self.cooldownTime

end


--
function UI.Modules_SlotWnd:SetInited( isInited )

	self.isInited = isInited

end


--
function UI.Modules_SlotWnd:IsInited()

	return self.isInited

end


--
function UI.Modules_SlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Modules_SlotWnd:SetTooltipData( tooltipData )

	if tooltipData ~= nil and type( tooltipData ) ~= "table" then
		sys.log( "UI.Modules_SlotWnd:SetTooltipData()[ERROR]: invalid type of the 1-st parameter(\"tooltipData\"); \"table\" or nil expected, got \"%s\"", type( tooltipData ) )
		return
	end

	self.tooltipData = nil

	if tooltipData then
		self.tooltipData = UI:CopyTable2( tooltipData )
	end

end


--
function UI.Modules_SlotWnd:ShowDestroyed()

	self:SetLayerVisible( true, self.layers.DESTROYED_EFFECT )

end


--
function UI.Modules_SlotWnd:HideDestroyed()

	self:SetLayerVisible( false, self.layers.DESTROYED_EFFECT )

end


--
function UI.Modules_SlotWnd:ShowFlash()

	self:SetLayerVisible( true, self.layers.FLASH_EFFECT )

	if self.flashEffect	then
		self.flashEffect:RestartAnimation()
	end

end


--
function UI.Modules_SlotWnd:HideFlash()

	self:SetLayerVisible( false, self.layers.FLASH_EFFECT )

end


--
function UI.Modules_SlotWnd:ShowInfluenceColor( color )

	if color == nil then	-- функция GetItemInfluenceColor() может возвращать nil, если нет цвета
	
		self:HideInfluenceColor()
		
	else

		self:SetLayerVisible( true, self.layers.INFLUENCE_COLOR_EFFECT )
		
		local influenceEffect = UI:GetEffectFromLayer( self, self.layers.INFLUENCE_COLOR_EFFECT )
		if influenceEffect then
			influenceEffect:SetColor( color )
		end
		
	end

end


--
function UI.Modules_SlotWnd:HideInfluenceColor()

	self:SetLayerVisible( false, self.layers.INFLUENCE_COLOR_EFFECT )

end


--
function UI.Modules_SlotWnd:SetData( data )

	self.data = data

end


--
function UI.Modules_SlotWnd:GetData()

	return self.data

end


-- ------------------------------
-- const
-- ------------------------------

ms.layers =
{
    MAIN_EFFECT					= 0,
	ICO_BG_EFFECT				= 1,
	INFLUENCE_COLOR_EFFECT		= 2, 
	COLOR_BG_EFFECT			    = 3, 
	COLOR_ENCHANTMENT_EFFECT	= 4, 
	SEL_EFFECT					= 5, 
    ICO_EFFECT					= 6,
	ENCHANTMENT_FRAME_EFFECT	= 7, 
	COLOR2_FRAME_EFFECT			= 8,
	ENCHANTMENT2_EFFECT			= 9,
	ICO_INACTIVE_EFFECT			= 10,
	COOLDOWN_TIME				= 11,
    KEY_EFFECT					= 12,
    KEY							= 13,
	TARGETS_COUNT_EFFECT		= 14,
	TARGETS_COUNT				= 15,
	DESTROYED_EFFECT			= 16,
	WORK_EFFECT					= 17,
	FLASH_EFFECT				= 18,
	AMMO_EFFECT					= 19,
    AMMO_COUNT					= 20,
	AMMO_RELOAD_EFFECT			= 21,
}

ms.effectInfo =
{
	icoBg =
	{
		animActive		= "active",
		animEmpty		= "empty",
	},

	key =
	{
		animInactive		= "idle",
		animActive			= "select",
	},
}

ms.strTargetsCountUnits = UI:GetStringByName( "hud_modules_targetsCountUnits" )

-- ------------------------------
-- vars
-- ------------------------------

ms.animIdIcoBgActive		= -1
ms.animIdIcoBgEmpty			= -1
ms.animIdKeyInactive		= -1
ms.animIdKeyActive			= -1
ms.ammoCount 				= -1
ms.targetsCount				= -1
ms.cooldownTime				= -1
ms.isInited					= false
ms.tooltipData				= nil
ms.mainEffect				= nil
ms.icoBgEffect				= nil
ms.colorBgEffect			= nil
ms.colorEnchantmentEffect	= nil
ms.icoEffect				= nil
ms.enchantmentFrameEffect	= nil
ms.icoInactiveEffect		= nil
ms.ammoReloadEffect			= nil
ms.keyEffect				= nil
ms.ammoCountEffect			= nil
ms.targetsCountEffect		= nil
ms.flashEffect				= nil
ms.data						= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Modules_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect				= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.icoBgEffect			= UI:GetEffectFromLayer( self, self.layers.ICO_BG_EFFECT )
	self.colorBgEffect			= UI:GetEffectFromLayer( self, self.layers.COLOR_BG_EFFECT )
	self.colorEnchantmentEffect	= UI:GetEffectFromLayer( self, self.layers.COLOR_ENCHANTMENT_EFFECT )
	self.icoEffect				= UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	self.enchantmentFrameEffect	= UI:GetEffectFromLayer( self, self.layers.ENCHANTMENT_FRAME_EFFECT )
	self.icoInactiveEffect		= UI:GetEffectFromLayer( self, self.layers.ICO_INACTIVE_EFFECT )
	self.ammoReloadEffect		= UI:GetEffectFromLayer( self, self.layers.AMMO_RELOAD_EFFECT )
	self.keyEffect				= UI:GetEffectFromLayer( self, self.layers.KEY_EFFECT )
	self.ammoCountEffect		= UI:GetEffectFromLayer( self, self.layers.AMMO_EFFECT )
	self.targetsCountEffect		= UI:GetEffectFromLayer( self, self.layers.TARGETS_COUNT_EFFECT )
	self.flashEffect			= UI:GetEffectFromLayer( self, self.layers.FLASH_EFFECT )

	if self.icoBgEffect then
        self.animIdIcoBgActive		= self.icoBgEffect:GetAnimationId( self.effectInfo.icoBg.animActive )
		self.animIdIcoBgEmpty		= self.icoBgEffect:GetAnimationId( self.effectInfo.icoBg.animEmpty )
	end

	if self.keyEffect then
        self.animIdKeyInactive		= self.keyEffect:GetAnimationId( self.effectInfo.key.animInactive )
        self.animIdKeyActive		= self.keyEffect:GetAnimationId( self.effectInfo.key.animActive )
	end

	self:Reset()

end


--
function UI.Modules_SlotWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.flashEffect then
		self:SetLayerVisible( false, self.layers.FLASH_EFFECT )
	end

end


-- ----------------------------------------------------------------------
-- UI.Modules_SpecialSlotWnd
-- ----------------------------------------------------------------------

UI.Modules_SpecialSlotWnd = {}
local mss = UI.Modules_SpecialSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Modules_SpecialSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Modules_SlotWnd",

	props =
	{
		name		= "Modules_SpecialSlotWnd",
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
				defName 			= "modules_specialSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "buff_icon",
						layer		= "UI.Modules_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "key_3",
						layer		= "UI.Modules_SlotWnd.layers.KEY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "inactive",
						layer		= "UI.Modules_SlotWnd.layers.ICO_INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modules_special_icon",
						layer		= "UI.Modules_SlotWnd.layers.ICO_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "namber_ship",
						layer		= "UI.Modules_SlotWnd.layers.TARGETS_COUNT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					}, 

					{
						objName		= "sel",	
						layer		= "UI.Modules_SlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "destroy_spec",	
						layer		= "UI.Modules_SlotWnd.layers.DESTROYED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "cooldown",	
						layer		= "UI.Modules_SlotWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ICO_BG_EFFECT
		{
			id			= UI.Modules_SlotWnd.layers.ICO_BG_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_specialIcoBg",
				defaultAnimation	= "active",
			}}
		},

		-- SEL_EFFECT
		{
			id			= UI.Modules_SlotWnd.layers.SEL_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_specialSel",
				defaultAnimation	= "actitvity_on",
			}}
		},

		-- ICO_INACTIVE_EFFECT
		{
			id			= UI.Modules_SlotWnd.layers.ICO_INACTIVE_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_specialIcoInactive",
				defaultAnimation	= "idle",
			}}
		},

		-- DESTROYED_EFFECT
		{
			id			= UI.Modules_SlotWnd.layers.DESTROYED_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_specialDestroyed",
				defaultAnimation	= "idle",
			}}
		},

		-- невидимый, в логике не используется, нужен чисто для организации локаторов в эффекте
		-- WORK_EFFECT
		{
			id			= UI.Modules_SlotWnd.layers.WORK_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_specialWork",
				defaultAnimation	= "idle",

				links =
				{
    				{
    					objName		= "cooldown_text",	
    					layer		= "UI.Modules_SlotWnd.layers.COOLDOWN_TIME",
    					animParams	= UI.EffectAnimParams.ALL,
    				},

    				{
    					objName		= "reload",	
    					layer		= "UI.Modules_SlotWnd.layers.AMMO_EFFECT",
    					animParams	= UI.EffectAnimParams.POS,
    				},

    				{
    					objName		= "flash",	
    					layer		= "UI.Modules_SlotWnd.layers.FLASH_EFFECT",
    					animParams	= UI.EffectAnimParams.POS,
    				},
				}
			}}
		},

		-- FLASH_EFFECT
		{
			id			= UI.Modules_SlotWnd.layers.FLASH_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "modules_slot_specialFlash",
				defaultAnimation	= "idle",
			}}
		},
	}
}