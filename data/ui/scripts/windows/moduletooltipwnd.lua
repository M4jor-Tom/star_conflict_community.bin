-- ----------------------------------------------------------------------------
--
-- Workfile: moduletooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------------
-- UI.ModuleTooltipWnd
-- -----------------------------------------------------------------------

UI.ModuleTooltipWnd = {}
local mt = UI.ModuleTooltipWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.ModuleTooltipWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ModuleTooltipWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "moduleTooltip_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "tooltip_slot",
						layer		= "UI.ModuleTooltipWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TIPS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_tips",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "vol_1",
						layer		= "UI.ModuleTooltipWnd.layers.TIP_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "vol_3",
						layer		= "UI.ModuleTooltipWnd.layers.TIP_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "vol_2",
						layer		= "UI.ModuleTooltipWnd.layers.TIP_3",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIP_1
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIP_2
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIP_3
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "moduleTooltip_workNew",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по цвету и размеру
					{
						objName		= "title",
						layer		= "UI.ModuleTooltipWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции, цвету и размеру
					{
						objName		= "type_descript",
						layer		= "UI.ModuleTooltipWnd.layers.MAIN_INFO",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.ModuleTooltipWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "price",
						layer		= "UI.ModuleTooltipWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "notice",
						layer		= "UI.ModuleTooltipWnd.layers.TIPS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "atlas_info",
						layer		= "UI.ModuleTooltipWnd.layers.ATLAS",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ITEM_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MAIN_INFO
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- BONUS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_eliteDesc",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ModuleTooltipWnd.layers.BONUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},   
				}		
			}}
		},

		-- BONUS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ITEM_SET_BG
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "moduleTooltip_itemSetBg",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "description",
						layer		= "UI.ModuleTooltipWnd.layers.ITEM_SET_TEXT",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- ITEM_SET_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- ATLAS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
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

		-- SEPARATOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_4_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_5_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_6_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_7_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "moduleTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- служебный эффект
		-- COLORS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,

			effects =
			{{
				defName 			= "moduleTooltip_colors",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.ModuleTooltipWnd:Setup( _data )

	self:Reset()

	if type( _data ) ~= "table" then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end

	local data = UI:CopyTable2( _data )

	if type( data.defName ) ~= "string" then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.defName\"; \"string\" expected, got \"%s\"", type( data.defName ) )
		return
	end

	if data.defName == "" then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: empty \"data.defName\"" )
		return
	end

	if data.iid ~= nil and type( data.iid ) ~= "userdata" then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.iid\"; \"userdata\" expected, got \"%s\"", type( data.iid ) )
		data.iid = UI.INVALID_U64_ID
	end

	if data.dstShipData ~= nil and data.dstShipData.SHIP_DATA ~= true then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.dstShipData\"; \"UI.ModuleTooltipWnd.ShipData\" expected" )
		data.dstShipData = nil
	end

	if data.dstShipData and not data.dstShipData:IsValidShip() then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid ship in \"data.dstShipData\"" )
		data.dstShipData= nil
	end

	if data.dstShipData then
		if data.dstShipData:GetSlotId() == -1 then
			sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid slotId in \"data.dstShipData\"" )
			data.dstShipData = nil
		end
	end

	if data.compareShipData ~= nil and data.compareShipData.SHIP_DATA ~= true then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.compareShipData\"; \"UI.ModuleTooltipWnd.ShipData\" expected" )
		data.compareShipData = nil
	end

	if data.compareShipData and not data.compareShipData:IsValidShip() then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid ship in \"data.compareShipData\"" )
		data.compareShipData = nil
	end

	if data.bCanBeEquippedByClick ~= nil and type( data.bCanBeEquippedByClick ) ~= "boolean" then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.bCanBeEquippedByClick\"; \"boolean\" expected, got \"%s\"", type( data.bCanBeEquippedByClick ) )
		data.bCanBeEquippedByClick = false
	end

	if data.bCanBeBoughtByClick ~= nil and type( data.bCanBeBoughtByClick ) ~= "boolean" then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.bCanBeBoughtByClick\"; \"boolean\" expected, got \"%s\"", type( data.bCanBeBoughtByClick ) )
		data.bCanBeBoughtByClick = false
	end

	if data.bCanBeBoughtByClick and data.bCanBeEquippedByClick then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: bCanBeBoughtByClick and bCanBeEquippedByClick are true at once" )
		data.bCanBeBoughtByClick = false
		data.bCanBeEquippedByClick = false
	end

	if data.bEnchanted ~= nil and type( data.bEnchanted ) ~= "boolean" then
		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.bEnchanted\"; \"boolean\" expected, got \"%s\"", type( data.bEnchanted ) )
		data.bEnchanted = false
	end

	if data.bWithTalents ~= nil then
		if type( data.bWithTalents ) ~= "boolean" then
    		sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.bWithTalents\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( data.bWithTalents ) )
			data.bWithTalents = nil
		end
	end
	
	if data.autogenItem ~= nil then
		if type( data.autogenItem ) ~= "table" then
			sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.autogenItem\"; \"table\" or \"nil\" expected, got \"%s\"", type( data.autogenItem ) )
			data.autogenItem = nil
		end
	end
	
	if data.autogenItem and UI.HangarWnd:IsOnScreen() then
		UI:AddTempAutogenDef( data.autogenItem )
	end
	
	if UI:IsDefAutogen( data.defName ) then
	
		if data.autogenUpgradeLevel ~= nil then
			if type( data.autogenUpgradeLevel ) ~= "number" then
				sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of \"data.autogenUpgradeLevel\"; \"number\" or \"nil\" expected, got \"%s\"", type( data.autogenUpgradeLevel ) )
				data.autogenUpgradeLevel = nil
			end
		end
		
		if data.autogenUpgradeLevel ~= nil then
		
			-- если когда-то подтребуется учитывать параметры корабля, то надо будет доделывать в коде cpp в функциях типа CL_GetModuleParamsFromSpawnData()
			if data.dstShipData then
				sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: dstShipData not supported for autogen with custom upgrade level" )
				data.dstShipData = nil
			end
			
			if data.compareShipData then
				sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: compareShipData not supported for autogen with custom upgrade level" )
				data.compareShipData = nil
			end
			
		end
		
	end
	
	if data.fnGetPosCallback ~= nil then
		if type( data.fnGetPosCallback ) ~= "function" then
			sys.log( "UI.ModuleTooltipWnd:Setup()[ERROR]: invalid type of 'fnGetPosCallback'; 'function' or 'nil' expected, got '%s'", type( data.fnGetPosCallback ) )
			data.fnGetPosCallback = nil
		end
	end
	
	self.data					= UI:CopyTable2( _data )
	self.defName				= data.defName
	self.iid					= data.iid or UI.INVALID_U64_ID
	self.autogenItem			= data.autogenItem
	self.dstShipData			= data.dstShipData
	self.compareShipData		= data.compareShipData
	self.bCanBeEquippedByClick	= data.bCanBeEquippedByClick or false
	self.bCanBeBoughtByClick	= data.bCanBeBoughtByClick or false
	self.bEnchanted				= data.bEnchanted or false
	self.bWithTalents			= data.bWithTalents or false
	self.autogenUpgradeLevel	= data.autogenUpgradeLevel or -1
	self.fnGetPosCallback		= data.fnGetPosCallback
	
	self.bSpecModule			= UI:GetModuleType( self.defName ) == ai.ModuleType.SPECIAL

	-- определяется, с чем сравнивать; пока сравнивается только оружие
	if not self.bSecondary and self.compareShipData and self.compareShipData:GetType() == UI.ModuleTooltipWnd.ShipData.types.VID then
		if UI:IsDefModule( self.defName ) and UI:GetModuleType( self.defName ) == ai.ModuleType.WEAPON then

    		local shipItem = UI:GetShipItem( self.compareShipData:GetVid(), true )
    		if shipItem then

				local slotId = ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01

    			local weaponIid = shipItem.equipModules[ slotId ]
				if weaponIid and weaponIid ~= UI.INVALID_U64_ID then

					-- здесь может вернуть автоген;
					-- если тултип покаызвается в ангаре, то всё ок, а если в геймплее, то у автогена не будет дефа и сравненние не будет работать правильно;
					-- сейчас сравнение только в ангаре и есть
					local weaponItem = UI:GetInventoryItemEx( weaponIid )
					if weaponItem then

						self.compareIid = weaponIid
						self.compareDefName = weaponItem.defName						

						self.compareShipData:SetSlotId( slotId )

					end

				-- если оружие не установлено, то считается, что стоит дефолтное
				else
					self.compareDefName = UI:GetShipDefaultWeapon( shipItem.defName )
				end

    		end

		end
	end


	if self:IsOnScreen() then
	
		self:FullUpdate()

		if not _G.TextPicker_IsActive() then
			self:PlaceOnScreen()
		end
		
	end

end


--
function UI.ModuleTooltipWnd:GetDefName()

	return self.defName

end


--
function UI.ModuleTooltipWnd:OnPlaceTooltipOnScreen( pos, tooltipData )

	local finalPos = Vec2( pos )

	-- тултип сравнениня
	if not self.bSecondary and self.compareDefName ~= "" then
	
		-- если окном, нв котором показывается тултип, были определены правила размещения, отличные от дефолтных, то неизвестно, где показывать вторичный тултип;
		-- (а данный момент там, где есть кастомные правила размещения, там нет тултипа сравнения, поэтому эти случаи по факту не будут никогда пересекаться)
		if tooltipWnd and tooltipData.tooltipPlacement and tooltipData.tooltipPlacement ~= UI.tooltipPlacementRules.DEFAULT then
			sys.log( "UI.ModuleTooltipWnd:OnPlaceTooltipOnScreen(): not DEFAULT placement from handler window; unhandled case, tolltip can be shown incorrectly" )
		end
	
		-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0091165);
		-- координаты тоже сбрасываются, поэтому их тоже устанавливать перед показом.
		-- Здесь setup вызывается, т.к. здесь нужно знать размеры, однако эти настройки могут сброситься, если будет вызван reset, поэтому перед показом еще раз вызывать
		
		self.compareTooltipWnd:Setup( self.compareTooltipData )

    	self.compareTooltipPos = Vec2( pos.x - self.compareTooltipWnd:GetWidth() - self.space_compareTooltip, pos.y )

    	if self.compareTooltipPos.y < 0 then
    		self.compareTooltipPos.y = 0

    	elseif self.compareTooltipPos.y + self.compareTooltipWnd:GetHeight() > 768 then
    		self.compareTooltipPos.y = 768 - self.compareTooltipWnd:GetHeight()
    	end	

    	if self.compareTooltipPos.x < 0 then
    		self.compareTooltipPos.x = pos.x + self:GetWidth() + self.space_compareTooltip
    	end

		if self.compareTooltipPos.x + self.compareTooltipWnd:GetWidth() > 1024 then
			self.compareTooltipPos.x = 1024 - self.compareTooltipWnd:GetWidth()
			finalPos.x = self.compareTooltipPos.x - self.space_compareTooltip - self:GetWidth()			
		end

	end
	
	return finalPos

end


-- -----------------------------------
-- const
-- -----------------------------------

mt.layers =
{
    MAIN_EFFECT					= 0,
    TIPS_EFFECT					= 1,
    TIP_1						= 2,
    TIP_2						= 3,
    TIP_3						= 4, 
    WORK_EFFECT					= 5, 
    ITEM_NAME					= 6, 
    MAIN_INFO					= 7, 
	BONUS_EFFECT				= 8, 
	BONUS						= 9,
    ITEM_SET_BG					= 10,
    ITEM_SET_TEXT				= 11,
    DESC						= 12,
	ATLAS						= 13,
	PRICE						= 14,
    SEPARATOR_1_EFFECT			= 15,
    SEPARATOR_2_EFFECT			= 16,
    SEPARATOR_3_EFFECT			= 17,
    SEPARATOR_4_EFFECT			= 18,
    SEPARATOR_5_EFFECT			= 19,
    SEPARATOR_6_EFFECT			= 20,
    SEPARATOR_7_EFFECT			= 21,
	COLORS_EFFECT				= 22,
}

mt.effectInfo =
{
	work =
	{
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self",
		itemIcoLocator		= "icon",
		mainInfoLocator		= "type_descript",
		propLocatorPrefix	= "properties_line_",
		descLocator			= "description",
		atlasLocator		= "atlas_info",
		priceLocator		= "price",
		sepLocatorPrefix	= "spacer_",
		tipsLocator			= "notice",
		itemNameLocator		= "title",
		premBonusLocator	= "premium",
		setBgLocator		= "ship_set",
	},

	colors =
	{
		itemTypeLocator				= "type",
		itemGroupLocator			= "type",
		shipTypeLocator				= "type_ship",
		rocketSizeLocator			= "type_rocket",
		rocketCapacityModLocator	= "type_rocket",
		repFitLocator				= "type_requirements_reputation_true",
		repUnfitLocator				= "type_requirements_reputation_falce",
		setInactiveLocator			= "grey",
	},

	setBg =
	{
		textLocator			= "description",
		minSizeLocator	= "min_dist",
		maxSizeLocator	= "self",		
	}
}

mt.MAX_TIPS			= 3
mt.MAX_SEPARATORS	= 7

mt.tipTypes =
{
	BUY				= 1,
	EQUIP			= 2,
	COMPARE			= 3,
	EMPHASIZE_BUFFS	= 4,
}

mt.priceTypes =
{
	NONE	= 1,
	BUY		= 2,
	SELL	= 3,
}

mt.space_compareTooltip	= UI:XTo1024x768( 10, { x = 1280, y = 720 } )

mt.bEmphasizeBuffsDefault = false

-- -----------------------------------
-- vars
-- -----------------------------------

mt.data							= nil
mt.defName						= ""
mt.iid							= UI.INVALID_U64_ID
mt.autogenItem					= nil
mt.dstShipData					= nil	-- корабль, на который итем будет "примеряться"; с этого корабля будут браться все параметры
mt.compareShipData				= nil	-- корабль, на который одет другой итем, с которым будет сравниваться этот; (сейчас сравнивается только оружие, для остального проигнорируется)
mt.bCanBeEquippedByClick		= false
mt.bCanBeBoughtByClick			= false
mt.bSpecModule					= false
mt.bEnchanted					= false
mt.bWithTalents					= false
mt.autogenUpgradeLevel			= -1
mt.fnGetPosCallback				= nil

mt.allPrimParamWnds				= {}
mt.allSecParamWnds				= {}
mt.curParamWnds					= {}
mt.itemIcoWnd					= nil
mt.mainInfoMetaText				= nil
mt.priceMetaText				= nil
mt.descMetaText					= nil
mt.dstParamsData				= nil
mt.bEmphasizeBuffs 				= false
mt.bHasBuffs					= false
mt.space_itemName_sep			= 0
mt.space_sep_itemIcoTop			= 0
mt.space_sep_mainInfoTop		= 0
mt.space_mainInfoBtm_premBonus	= 0
mt.space_premBonus_sep			= 0
mt.space_sep_paramsTop			= 0
mt.space_paramsBtm_sep			= 0
mt.space_sep_setBgTop			= 0
mt.space_setBgTop_setTextTop	= 0
mt.space_setTextBtm_setBgBtm	= 0
mt.space_setBgBtm_sep			= 0
mt.space_sep_descTop			= 0
mt.space_descBtm_sep			= 0
mt.space_sep_atlasTop			= 0
mt.space_atlasBtm_sep			= 0
mt.space_sep_priceTop			= 0
mt.space_btm					= 0
mt.space_params_prim			= 0
mt.space_params_sec				= 0
mt.workMinHeight				= 0
mt.workMaxHeight				= 0
mt.tipsHeight					= 0
mt.paramsX						= 0
mt.premBonusHeight				= 0
mt.setBgMinHeight				= 0
mt.setBgMaxHeight				= 0
mt.color_itemType				= UI.TEXT_BASE_COLOR
mt.color_itemGroup				= UI.TEXT_BASE_COLOR
mt.color_shipType				= UI.TEXT_BASE_COLOR
mt.color_rocketCapacityMod		= UI.TEXT_BASE_COLOR
mt.color_repFit					= UI.TEXT_BASE_COLOR
mt.color_repUnfit				= UI.TEXT_BASE_COLOR
mt.color_descSubst				= UI.TEXT_SEL_COLOR
mt.color_oneFightWarning		= UI.TEXT_BASE_COLOR
mt.color_setInactive			= 0xff55555
mt.compareDefName				= ""
mt.compareIid					= UI.INVALID_U64_ID
mt.compareTooltipWnd			= nil
mt.compareTooltipData			= nil
mt.compareTooltipPos			= Vec2( 0, 0 )
mt.bSecondary					= false

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ModuleTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.allPrimParamWnds	= {}
	self.allSecParamWnds	= {}
	self.curParamWnds		= {}
	self.compareTooltipPos	= Vec2( 0, 0 )

	self.mainInfoMetaText = UI.MetaText.GetNewInstance()
	self.mainInfoMetaText:InitFromLayer( self, self.layers.MAIN_INFO ) 

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 
	
	self.descMetaText = UI.MetaText.GetNewInstance()
	self.descMetaText:InitFromLayer( self, self.layers.DESC ) 

	self:CreateControls()
	self:PrepareLayoutParams()

	self:Reset()
	
end


--
function UI.ModuleTooltipWnd:F_Shutdown()

	if self.mainInfoMetaText then
		self.mainInfoMetaText:Clear()
	end

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end
	
	if self.descMetaText then
		self.descMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ModuleTooltipWnd:CreateControls()

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )	
	self.itemIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )

	if not self.bSecondary then
		self.compareTooltipWnd = UI:CreateChildWnd( self, UI.CompareModuleTooltipWnd, "" )	
	end

	for paramIdx = 1, 4 do
		self:CreateSecParamWnd()
	end

	for paramIdx = 1, 1 do
		self:CreatePrimParamWnd()
	end
	
end


--
function UI.ModuleTooltipWnd:CreateSecParamWnd()
	
	local paramWnd = UI:CreateChildWnd( self, UI.ModuleTooltip_ParamWnd, tostring( #self.allSecParamWnds ) )
	table.insert( self.allSecParamWnds, paramWnd )
	return paramWnd

end


--
function UI.ModuleTooltipWnd:ObtainFreeSecParamWnd()

	local freeParamWnd = nil

	for idx, paramWnd in pairs( self.allSecParamWnds ) do
		if not paramWnd:IsChildOf( self ) then
			freeParamWnd = paramWnd
			break
		end
	end

	if not freeParamWnd then
		freeParamWnd = self:CreateSecParamWnd()
	end

	table.insert( self.curParamWnds, freeParamWnd )

	self:AddChild( freeParamWnd )
	freeParamWnd:SetLeft( self.paramsX )

	return freeParamWnd

end


--
function UI.ModuleTooltipWnd:CreatePrimParamWnd()
	
	local paramWnd = UI:CreateChildWnd( self, UI.ModuleTooltip_PrimaryParamWnd, tostring( #self.allPrimParamWnds ) )
	table.insert( self.allPrimParamWnds, paramWnd )
	return paramWnd

end


--
function UI.ModuleTooltipWnd:ObtainFreePrimParamWnd()

	local freeParamWnd = nil

	for idx, paramWnd in pairs( self.allPrimParamWnds ) do
		if not paramWnd:IsChildOf( self ) then
			freeParamWnd = paramWnd
			break
		end
	end

	if not freeParamWnd then
		freeParamWnd = self:CreatePrimParamWnd()
	end

	table.insert( self.curParamWnds, freeParamWnd )

	self:AddChild( freeParamWnd )
	freeParamWnd:SetLeft( self.paramsX )

	return freeParamWnd

end       


--
function UI.ModuleTooltipWnd:PrepareLayoutParams()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local tipsEffect = UI:GetEffectFromLayer( self, self.layers.TIPS_EFFECT )
	local colorsEffect = UI:GetEffectFromLayer( self, self.layers.COLORS_EFFECT )
	local premBonusEffect = UI:GetEffectFromLayer( self, self.layers.BONUS_EFFECT )
	local setBgEffect = UI:GetEffectFromLayer( self, self.layers.ITEM_SET_BG )

	local numParamLocators = 0	
	while true do
		local paramIdx = numParamLocators + 1
		if workEffect:HasObject( string.format( "%s%d", self.effectInfo.work.propLocatorPrefix, paramIdx ) ) then
			numParamLocators = numParamLocators + 1
		else
			break
		end		
	end

	local workEffectPos		= workEffect:GetPos()
	local itemNamePos		= workEffect:GetObjPos( self.effectInfo.work.itemNameLocator )
	local itemNameSize		= workEffect:GetObjSize( self.effectInfo.work.itemNameLocator )
	local itemIcoPos		= workEffect:GetObjPos( self.effectInfo.work.itemIcoLocator )
	local itemIcoSize		= Vec2( self.itemIcoWnd:GetLeft(), self.itemIcoWnd:GetHeight() )
	local mainInfoPos		= workEffect:GetObjPos( self.effectInfo.work.mainInfoLocator )
	local mainInfoSize		= workEffect:GetObjSize( self.effectInfo.work.mainInfoLocator )
	local primParamPos 		= workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.propLocatorPrefix, 1 ) )
	local firstSecParamPos 	= workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.propLocatorPrefix, 2 ) )
	local secondSecParamPos	= workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.propLocatorPrefix, 3 ) )
	local lastParamPos		= workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.propLocatorPrefix, numParamLocators ) )
	local descPos			= workEffect:GetObjPos( self.effectInfo.work.descLocator )
	local descSize			= workEffect:GetObjSize( self.effectInfo.work.descLocator )
	local atlasPos			= workEffect:GetObjPos( self.effectInfo.work.atlasLocator )
	local atlasSize			= workEffect:GetObjSize( self.effectInfo.work.atlasLocator )
	local pricePos			= workEffect:GetObjPos( self.effectInfo.work.priceLocator )
	local priceSize			= workEffect:GetObjSize( self.effectInfo.work.priceLocator )
	local premBonusPos		= workEffect:GetObjPos( self.effectInfo.work.premBonusLocator )
	local premBonusSize		= premBonusEffect and premBonusEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local setBgPos			= workEffect:GetObjPos( self.effectInfo.work.setBgLocator )
	local setBgMaxSize		= setBgEffect and setBgEffect:GetObjSize( self.effectInfo.setBg.maxSizeLocator ) or Vec2( 0, 0 )
	local setBgMinSize		= setBgEffect and setBgEffect:GetObjSize( self.effectInfo.setBg.minSizeLocator ) or Vec2( 0, 0 )
	local setTextPos		= setBgEffect and setBgEffect:GetObjPos( self.effectInfo.setBg.textLocator ) or Vec2( 0, 0 )
	local setTextSize		= setBgEffect and setBgEffect:GetObjSize( self.effectInfo.setBg.textLocator ) or Vec2( 0, 0 )

	local secParamWnd = self.allSecParamWnds[ 1 ]
	local secParamHeight = secParamWnd and secParamWnd:GetHeight() or 0

	local primParamWnd = self.allPrimParamWnds[ 1 ]
	local primParamHeight = primParamWnd and primParamWnd:GetHeight() or 0

    self.workMinHeight		= workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ).y
    self.workMaxHeight		= workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ).y

	local NUM_SEPARATORS_IN_EFFECT = 7
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPARATORS_IN_EFFECT do
		local sepPos = workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end

	self.space_itemName_sep				= sepsPoss[ 1 ].y - ( itemNamePos.y + itemNameSize.y )
	self.space_sep_itemIcoTop			= itemIcoPos.y - sepsPoss[ 1 ].y
	self.space_sep_mainInfoTop			= mainInfoPos.y - sepsPoss[ 1 ].y
    self.space_mainInfoBtm_premBonus	= premBonusPos.y - math.max( itemIcoPos.y + itemIcoSize.y, mainInfoPos.y + mainInfoSize.y )
	self.space_premBonus_sep			= sepsPoss[ 2 ].y - ( premBonusPos.y + premBonusSize.y )
    self.space_sep_paramsTop			= primParamPos.y - sepsPoss[ 3 ].y
    self.space_paramsBtm_sep			= sepsPoss[ 4 ].y - ( lastParamPos.y + secParamHeight )
    self.space_sep_setBgTop				= setBgPos.y - sepsPoss[ 4 ].y
    self.space_setBgTop_setTextTop		= setTextPos.y
    self.space_setTextBtm_setBgBtm		= setBgMaxSize.y - ( setTextPos.y + setTextSize.y )
    self.space_setBgBtm_sep				= sepsPoss[ 5 ].y - ( setBgPos.y + setBgMaxSize.y )
    self.space_sep_descTop				= descPos.y - sepsPoss[ 5 ].y
    self.space_descBtm_sep				= sepsPoss[ 6 ].y - ( descPos.y + descSize.y )
	self.space_sep_atlasTop				= atlasPos.y - sepsPoss[ 6 ].y
	self.space_atlasBtm_sep				= sepsPoss[ 7 ].y - ( atlasPos.y + atlasSize.y )
    self.space_sep_priceTop				= pricePos.y - sepsPoss[ 7 ].y
    self.space_btm						= self.workMaxHeight - ( pricePos.y + priceSize.y )
    self.space_params_prim				= firstSecParamPos.y - ( primParamPos.y + primParamHeight )
    self.space_params_sec				= secondSecParamPos.y - ( firstSecParamPos.y + secParamHeight )
    self.tipsHeight						= tipsEffect and tipsEffect:GetObjSize( "self" ).y or 0
    self.paramsX						= primParamPos.x + workEffectPos.x
	self.premBonusHeight				= premBonusSize.y
	self.setBgMinHeight					= setBgMinSize.y
	self.setBgMaxHeight					= setBgMaxSize.y

	if colorsEffect then

        self.color_itemType			= colorsEffect:GetObjColor( self.effectInfo.colors.itemTypeLocator )
		self.color_itemGroup		= colorsEffect:GetObjColor( self.effectInfo.colors.itemGroupLocator )
        self.color_shipType			= colorsEffect:GetObjColor( self.effectInfo.colors.shipTypeLocator )
        self.color_rocketCapacityMod= colorsEffect:GetObjColor( self.effectInfo.colors.rocketCapacityModLocator )
        self.color_repFit			= colorsEffect:GetObjColor( self.effectInfo.colors.repFitLocator )
        self.color_repUnfit			= colorsEffect:GetObjColor( self.effectInfo.colors.repUnfitLocator )
		self.color_setInactive		= colorsEffect:GetObjColor( self.effectInfo.colors.setInactiveLocator )	

	end

	self:SetLayerWidth( itemNameSize.x, self.layers.ITEM_NAME )
	self:SetLayerLeft( mainInfoPos.x + workEffectPos.x, self.layers.MAIN_INFO )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC )
	self:SetLayerWidth( atlasSize.x, self.layers.ATLAS )
	self:SetLayerLeft( atlasPos.x + workEffectPos.x, self.layers.ATLAS )
	self:SetLayerLeft( pricePos.x + workEffectPos.x, self.layers.PRICE )
	self:SetLayerWidth( setTextSize.x, self.layers.ITEM_SET_TEXT )

	self.mainInfoMetaText:SetFormatRectSize( UI:Vec2( mainInfoSize.x, 1000000 ), false )	
	self.descMetaText:SetFormatRectSize( UI:Vec2( descSize.x, 1000000 ), false )	

	local sepPos = UI:Vec2( sepsPoss[ 1 ].x, 0 )
	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:SetPos( sepPos )
		end
	end

	self.itemIcoWnd:SetLeft( itemIcoPos.x + workEffectPos.x )

	if premBonusEffect then
		premBonusEffect:SetPos( UI:Vec2( premBonusPos.x + workEffectPos.x, 0 ) )
	end

	if setBgEffect then
		setBgEffect:SetPos( UI:Vec2( setBgPos.x + workEffectPos.x, 0 ) )
	end

	local selfWidth = workEffect:GetObjSize( "self" ).x
	self:SetWidth( selfWidth )	

end


--
function UI.ModuleTooltipWnd:Reset()

    self.defName				= ""
    self.iid					= UI.INVALID_U64_ID
	self.dstShipData			= nil
	self.compareShipData		= nil
	self.bCanBeEquippedByClick	= false
	self.bCanBeBoughtByClick	= false
	self.bSpecModule			= false
	self.dstParamsData			= nil
	self.compareDefName			= ""
	self.compareIid				= UI.INVALID_U64_ID
	self.bEnchanted				= false
	self.bWithTalents			= false
	self.autogenUpgradeLevel	= -1

	self:SetLayerVisible( false, self.layers.TIPS_EFFECT )
	for tipIdx = 1, self.MAX_TIPS do
		self:SetLayerVisible( false, self.layers.TIP_1 + tipIdx - 1 )
	end

	self:SetText( "", self.layers.ITEM_NAME )
	self:SetLayerVisible( false, self.layers.ITEM_SET_BG )
	self:SetLayerVisible( false, self.layers.ITEM_SET_TEXT )
	self:SetLayerVisible( false, self.layers.ATLAS )

	self:SetText( "", self.layers.MAIN_INFO )
	self.mainInfoMetaText:SetText( "", true )

	self:SetLayerVisible( false, self.layers.PRICE )
	self.priceMetaText:SetText( "", true )
	
	self:SetLayerVisible( false, self.layers.DESC )
	self.descMetaText:SetText( "", true )

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	for idx, paramWnd in pairs( self.curParamWnds ) do
		paramWnd:Reset()
		paramWnd:UnlinkFromParent()
	end
	self.curParamWnds = {}

	self.itemIcoWnd:Reset()
	self.itemIcoWnd:HideMain()
	self.itemIcoWnd:HideIcoMain()
	self.itemIcoWnd:UnlinkFromParent()

	self:HideCompareTooltip()
	self.compareTooltipData = nil
	self.compareTooltipPos = Vec2( 0, 0 )

	self.bEmphasizeBuffs	= false
	self.bHasBuffs			= false

end


--
function UI.ModuleTooltipWnd:FullUpdate()

	if self.autogenItem and UI.HangarWnd:IsOnScreen() then
		UI:AddTempAutogenDef( self.autogenItem )
	end

	self:UpdateDstShipParamsData()

	self.bHasBuffs = self:HasBuffs()

	if self:IsWithBuffs() then
		self.bEmphasizeBuffs = self.bEmphasizeBuffsDefault
	else
		self.bEmphasizeBuffs = false
	end	

	self:UpdateItemName()
	self:UpdateItemIco()
	self:UpdateMainInfo()
	self:UpdateBonus()
	self:UpdateParams()
	self:UpdateItemSet()
	self:UpdateDesc()
	self:UpdateAtlasInfo()
	self:UpdatePrice()
	self:UpdateTips()
	self:UpdateCompareTooltip()

	self:RecalcLayout()

end


--
function UI.ModuleTooltipWnd:UpdateItemName()

	local text = ""

	if self.bSpecModule then

		local strLabel = UI:GetStringByName( "shipTooltip_specModule" )
		local name = UI:GetEntityLocalizedNameByDef( self.defName, true, false, false )

		text = string.format( "%s: %s", strLabel, name )

	else
		
		text = UI:GetEntityLocalizedNameByDef( self.defName, false, false, true )
		
		local color = UI:GetItemColor( self.defName, false, false )
		
		if UI:IsDefAutogen( self.defName ) and ( self.autogenUpgradeLevel ~= -1 or self.autogenItem ) then
		
			local autogenItem = self.autogenItem or UI:GetAutogenItem( self.defName )
			if autogenItem then
		
				local upgradeLevel = self.autogenUpgradeLevel ~= -1 and self.autogenUpgradeLevel or autogenItem.upgradeLevel
		
				local quality = UI:GetAutogenQualityForUpgradeLevel( upgradeLevel )
				color = UI:GetItemQualityColor( quality, false, false )
				
			end
			
		end
		
		text = string.format( "%s%s", UI:Color2Str( color ), text )
		
	end

	self:SetText( text, self.layers.ITEM_NAME )

end


--
function UI.ModuleTooltipWnd:UpdateItemIco()

	self:AddChild( self.itemIcoWnd )

	self.itemIcoWnd:SetupForItem( self.defName, self:IsEnchanted() )

	if not self.bSpecModule then

		local dstShipItem = nil
		if self.dstShipData then
			local dstShipDefName = self.dstShipData:GetDefName()
			dstShipItem = UI:GetShipItemByDef( dstShipDefName, true ) 
		end

		self.itemIcoWnd:SetupRank( self.defName, not dstShipItem or UI:IsItemFitForShipByTierAndRank( self.defName, dstShipItem.defName ), nil )

	end
	
	if UI:IsDefAutogen( self.defName ) and ( self.autogenUpgradeLevel ~= -1 or self.autogenItem ) then
	
		local autogenItem = self.autogenItem or UI:GetAutogenItem( self.defName )
		if autogenItem then
		
			local upgradeLevel = self.autogenUpgradeLevel ~= -1 and self.autogenUpgradeLevel or autogenItem.upgradeLevel
			
			local quality = UI:GetAutogenQualityForUpgradeLevel( upgradeLevel )
			local color = UI:GetItemQualityColor( quality, false, false )
			self.itemIcoWnd:ShowColorBg2( color, false )
			
		end
		
	end

end


--
function UI.ModuleTooltipWnd:IsEnchanted()

	if self.iid ~= UI.INVALID_U64_ID then
		return UI:IsInventoryItemEnchantedById( self.iid )

	else
		return self.bEnchanted
	end

end


--
function UI.ModuleTooltipWnd:UpdateMainInfo()

	local def = UI:GetDef( self.defName )
	if not def then
		sys.log( "UI.ModuleTooltipWnd:UpdateMainInfo()[ERROR]: cannot find _G.Def.%s", self.defName )
		return
	end


	-- тип и группа

	local strItemType = ""
	local strItemGroup = ""

	if def.item_subtype then

		-- тип

		local strItemTypeVal = UI:ItemSubType2Str( def.item_subtype )
		local strItemTypeLabel = UI:GetStringByName( "itemTooltip_itemType" )
		local strItemTypeColor = UI:Color2Str( self.color_itemType )

		strItemType = string.format( "%s%s: %s", strItemTypeColor, strItemTypeLabel, strItemTypeVal )

		-- группа

		local itemGroup = _G.ItemSubtype_To_ItemGroup and _G.ItemSubtype_To_ItemGroup[ def.item_subtype ] or ai.ItemGroup.NONE
		if itemGroup ~= ai.ItemGroup.NONE then

			local strItemGroupVal = UI:ItemGroup2Str( itemGroup )
			local strItemGroupLabel = UI:GetStringByName( "itemTooltip_itemGroup" )
			local strItemTypeColor = UI:Color2Str( self.color_itemGroup )			

			strItemGroup = string.format( "%s%s: %s", strItemTypeColor, strItemGroupLabel, strItemGroupVal )

		end
		
	else
		sys.log( "UI.ModuleTooltipWnd:UpdateMainInfo()[ERROR]: cannot find _G.Def.%s.item_subtype", self.defName )
	end


	-- тип и роль (опционально) корабля, которому подходит

	local strShipRequirements = ""

	if not self.bSpecModule then

		local requiredShips = UI:GetItemRequiredShips( self.defName )
		if next( requiredShips ) then

			local strShipName = UI:GetEntityLocalizedNameByDef( requiredShips[ 1 ], true, false, false, false )
			local baseColor = self:GetColor( self.layers.MAIN_INFO )
			strShipName = string.format( "%s%s", strShipName, UI:Color2Str( baseColor ) )

			if #requiredShips == 1 then

				strShipRequirements = UI:GetStringByName( "itemTooltip_requiredShip" )
				strShipRequirements = string.format( "%s: %s", UI:GetStringByName( "itemTooltip_requiredShip" ), strShipName )

			else

				strShipRequirements = UI:GetStringByName( "itemTooltip_requiredShip_many" )

    			local numSubst = 0
    			strShipRequirements, numSubst = string.gsub( strShipRequirements, "%$ship%$", strShipName )

    			if numSubst == 0 then
					sys.log( "UI.ModuleTooltipWnd:UpdateMainInfo()[ERROR]: cannot find placeholder \"$ship$\" in string \"itemTooltip_requiredShip_many\"" )
					strShipRequirements = string.format( "[INVALID STRING] Required ship: %s and premium ships of the same role", strShipName )
    			end

			end

		else

        	local shipType = UI:GetItemShipType( self.defName )
    		local role = UI:GetItemRole( self.defName )

    		local strShipType = ""
    		local strRole = ""

        	local strShipTypeRoleColor = UI:Color2Str( self.color_shipType )
        	local strShipTypeRoleLabel = UI:GetStringByName( "itemTooltip_shipType" )

        	if shipType then

        		local strShipTypeName = UI:ShipType2Str( shipType )
        		local hShipTypeIco = UI:GetShipTypeIco( shipType )
        		local strShipTypeIco = string.format( "$texture [handle %u][alignment CENTER][ignoreFontSize false][color %u]$", hShipTypeIco, self.color_shipType )
        		strShipType = string.format( "%s%s%s", strShipTypeIco, strShipTypeRoleColor, strShipTypeName )	-- color нужен, т.к. метатекст не сможет восстановить цвет после иконки, если он был вписан в строку		

        	end

    		if role ~= -1 then

    			if not shipType then
    				sys.log( "UI.ModuleTooltipWnd:UpdateMainInfo()[ERROR]: role is specified but ship class is not for %s", self.defName )
    			end

    			strRole = string.format( "(%s)", UI:Role2Str( role ) )

    		end

    		if shipType or role ~= -1 then
    			strShipRequirements = string.format( "%s%s: %s%s%s", strShipTypeRoleColor, strShipTypeRoleLabel, strShipType, strShipType ~= "" and strRole ~= "" and " " or "", strRole )
    		end

		end

	end


	-- допустимые ранги корабля, на которые может устанавливаться

	local strRankRange = ""

	local minRank = UI:GetItemEquipMinRank( self.defName )
	local maxRank = UI:GetItemEquipMaxRank( self.defName )

	if minRank ~= -1 and maxRank ~= -1 then

		strRankRange = UI:GetStringByName( "itemTooltip_rankRange" )
		strRankRange = string.format( "%s %d-%d", strRankRange, minRank, maxRank )
		
		if self.dstShipData then
		
			local shipDefName = self.dstShipData:GetDefName()
			local shipRank = UI:GetShipRank( shipDefName )
			
			if shipRank ~= -1 and shipRank < minRank or shipRank > maxRank then
				strRankRange = string.format( "%s%s%s", UI:Color2Str( UI.RED_COLOR ), strRankRange, UI:Color2Str( self:GetColor( self.layers.MAIN_INFO ) ) )
			end
		
		end

	end


	-- раса
	-- ( допустимые случаи: CRYSTAL/все крроме CRYSTAL/не прописана )

	local strRace = ""

	local raceMask = UI:GetItemRaceMask( self.defName )
	if raceMask ~= -1 then

		local race = UI:RaceMask2OneRace( raceMask )

		if race ~= -1 then

			local strId = string.format( "itemTooltip_race_%s", UI:Val2Key( ai.Race, race ) )
			strRace = UI:GetStringByName( strId )

		else

			local nonCrystalMask = 0

			for name, val in pairs( ai.RaceMask ) do
				if val ~= ai.RaceMask.CRYSTAL then
					nonCrystalMask = nonCrystalMask + val
				end
			end

			if raceMask == nonCrystalMask then
				strRace = UI:GetStringByName( "itemTooltip_raceNonCrystal" )
			else
				sys.log( "UI.ModuleTooltipWnd:UpdateMainInfo()[ERROR]: unhandled race mask case (%d) for \"%s\"", raceMask, self.defName )
			end

		end


	end


	-- модули, у которых прописан required_ship, могут быть установлены не более определенного количества

	local strLimitedCount = ""
	
	if not self.bSpecModule and UI:IsItemLimitedEquip( self.defName ) then

		local curCount = 0

		if self.dstShipData and self.dstShipData:GetType() ~= UI.ModuleTooltipWnd.ShipData.types.DEF then

			curCount = 1	-- учитывается тот модуль, для которого показывается тултип

			local equippedItems = self:GetShipEquippedItems( self.dstShipData )
			local dstSlotId = self.dstShipData:GetSlotId()
	
			for defName, slotsIds in pairs( equippedItems ) do
				for slotIdx, slotId in pairs( slotsIds ) do
					if slotId ~= dstSlotId and UI:IsItemLimitedEquip( defName ) then
						curCount = curCount + 1
					end
				end
			end

		end
		
		local maxCountRegular	= _G.GameStore_GetMaxUniqueModules()
		local maxCountPremium	= _G.GameStore_GetMaxUniqueModulesOnPremium()
		
		-- #0098493 - правила того, как это должно отображаться:
		-- 1) Пока модуль на складе писать "Ограничение на уникальные модули: 3(1)", цифру и скобочки писать золотым цветом. Цифры брать из цваров: первая для обычных кораблей, золотая для премиумных
		-- 2) Когда модуль установлен писать "Ограничение на уникальные модули: 1/3", где бы мы ни наводились на установленный модуль. Для премиум кораблей писать строку золотым цветом, для обычных - белым.
		
		if curCount > 0 then
		
			local bShipPremium = UI:IsShipPremium( self.dstShipData:GetDefName() )
			
			local maxCount = bShipPremium  and maxCountPremium or maxCountRegular
			local strVal = string.format( "%d/%d", curCount, maxCount )
			
			strLimitedCount = UI:GetStringByName( "itemTooltip_uniqueModuleCount" )
			
			local numSubst = 0
			strLimitedCount, numSubst = string.gsub( strLimitedCount, "%$count%$", strVal )

			if numSubst == 0 then
				sys.log( "UI.ModuleTooltipWnd:UpdateMainInfo()[ERROR]: cannot find placeholder \"$count$\" in string \"itemTooltip_uniqueModuleCount\"" )
				strLimitedCount = string.format( "[INVALID STRING] Limited amount: %s", strVal )
			end
			
			local baseColor = self:GetColor( self.layers.MAIN_INFO )
			
			local limitedCountStringColor = baseColor
			if curCount > maxCount then
				limitedCountStringColor = UI.PARAM_DELTA_MINUS_COLOR
			else
				if bShipPremium then
					limitedCountStringColor = UI.GOLD_COLOR
				end
			end
			
			strLimitedCount = string.format( "%s%s%s", UI:Color2Str( limitedCountStringColor ), strLimitedCount, UI:Color2Str( baseColor ) )
			
		else
		
			local baseColor = self:GetColor( self.layers.MAIN_INFO )
		
			local strVal = string.format( "%d%s(%d)%s", maxCountRegular, UI:Color2Str( UI.GOLD_COLOR ), maxCountPremium, UI:Color2Str( baseColor ) )
			
			strLimitedCount = UI:GetStringByName( "itemTooltip_uniqueModuleCount" )
			
			local numSubst = 0
			strLimitedCount, numSubst = string.gsub( strLimitedCount, "%$count%$", strVal )

			if numSubst == 0 then
				sys.log( "UI.ModuleTooltipWnd:UpdateMainInfo()[ERROR]: cannot find placeholder \"$count$\" in string \"itemTooltip_uniqueModuleCount\"" )
				strLimitedCount = string.format( "[INVALID STRING] Limited amount: %s", strVal )
			end

		end

	end

	
	-- информация, о том, что дается только на один бой (для расходников)
	
	local strOneFightWarning = ""
	if UI:IsDefAmmo( self.defName ) then
		strOneFightWarning = string.format( "%s%s", UI:Color2Str( self.color_oneFightWarning ), UI:GetStringByName( "tooltip_forOneFightWarning" ) )
	end
	
	
	-- уникальные модули (unique_equip) могут устанавиваться нет более одного
	
	local strUnique = ""
	if UI:IsItemUniqueEquip( self.defName ) then
		strUnique = UI:GetStringByName( "itemTooltip_unique" )
	end

	-- всё вместе

	local strMainInfo = string.format( "%s%s%s%s%s%s%s%s",
		strItemType,
		strItemGroup ~= "" and string.format( "|%s", strItemGroup ) or "",
		strShipRequirements ~= "" and string.format( "|%s", strShipRequirements ) or "",
		strRace ~= "" and string.format( "|%s", strRace ) or "",
		strRankRange ~= "" and string.format( "|%s", strRankRange ) or "",
		strLimitedCount ~= "" and string.format( "|%s", strLimitedCount ) or "",
		strOneFightWarning ~= "" and string.format( "|%s", strOneFightWarning ) or "",
		strUnique ~= "" and string.format( "|%s", strUnique ) or ""
	)

	self.mainInfoMetaText:SetText( strMainInfo, true )

end


--
function UI.ModuleTooltipWnd:UpdateParams()

	local compareParamsData = self:GetCompareShipParamsData()
	local tooltipParams = UI:GetItemTooltipParams( self.defName )

	for paramIdx = 1, #tooltipParams do

		local paramInfo = tooltipParams[ paramIdx ]

		local paramVals = UI:GetParamVals( self.defName, paramInfo, UI.paramSrcTypes.MODULE, self.dstParamsData.data, false, nil, nil, nil, self.dstParamsData.autogenDef )
		if next( paramVals ) then

    		local paramWnd = nil

    		if paramInfo.large then
    			paramWnd = self:ObtainFreePrimParamWnd()
    		else
    			paramWnd = self:ObtainFreeSecParamWnd()
    		end

    		paramWnd:Setup( self.defName, paramInfo, self.dstParamsData, compareParamsData, tooltipParams )

		end

	end		

end  


--
function UI.ModuleTooltipWnd:GetCompareShipParamsData()

	local compareDefName = ""
	local compareParamsData = nil

	if not self.bSecondary and self.compareDefName ~= "" and self.compareTooltipWnd:IsOnScreen() then
		compareDefName = self.compareDefName
		compareParamsData = self:GetItemParamsDataFromShip( self.dstShipData, self.compareDefName )

	elseif self.bEmphasizeBuffs then

		compareDefName = self.defName

		-- #0060059 - для премиум кораблей используется 1-й уровень синергии ( 2-й параметр false в GetShipDefaultSpawnData() )

		if UI:IsDefAmmo( self.defName ) then
			compareParamsData = { params = _G.CL_GetMunitionParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.dstShipData:GetDefName(), false, false ), self.defName ) }
		else
			compareParamsData = { params = _G.CL_GetModuleParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.dstShipData:GetDefName(), false, false ), self.dstShipData:GetSlotId(), self.defName ) }
		end

	end

	if compareDefName ~= "" then
		return { defName = compareDefName, data = compareParamsData }
	else
		return nil
	end

end


--
function UI.ModuleTooltipWnd:UpdateItemSet()

	local setName = UI:GetItemSet( self.defName )

	if setName == "" then

		self:SetLayerVisible( false, self.layers.ITEM_SET_BG )
		self:SetLayerVisible( false, self.layers.ITEM_SET_TEXT )

		return

	end

	self:SetLayerVisible( true, self.layers.ITEM_SET_BG )
	self:SetLayerVisible( true, self.layers.ITEM_SET_TEXT )

	local str = ""

	local baseColor			= self:GetColor( self.layers.ITEM_SET_TEXT )
	local qualityColor		= UI:GetItemColor( self.defName, false )
	local strBaseColor		= UI:Color2Str( baseColor )
	local strQualityColor	= UI:Color2Str( qualityColor )
	local strInactiveColor	= UI:Color2Str( self.color_setInactive )


	-- имя сета

	local strSetLocalizedName = UI:ItemSet2Str( setName )
	strSetLocalizedName = string.format( "%s%s:", strBaseColor, strSetLocalizedName )
	str = strSetLocalizedName


	-- предметы в составе сета

	local strItems = ""

	local setItems			= UI:GetItemSetItems( setName )
	local equippedItems		= self.dstShipData and self:GetShipEquippedItems( self.dstShipData ) or {}

	for idx, defName in ipairs( setItems ) do

		local bHasItem = equippedItems[ defName ] ~= nil
		local strItemColor = bHasItem and strBaseColor or strInactiveColor

		local strItem = UI:GetEntityLocalizedNameByDef( defName, false, nil, false, false )
		strItem = string.format( "    %s%s%s", strItemColor, strItem, strBaseColor )

		strItems = string.format( "%s%s%s", strItems, strItems ~= "" and "|" or "", strItem )

	end

	if strItems ~= "" then
		str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strItems )
	end

	
	-- бонусы

	local strBonuses = ""

	local shipDescParams = UI:GetShipDescParams()	
	local bonuses = UI:GetItemSetBonuses( setName )

	local numEquippedSetItems = 0

	for idx, defName in ipairs( setItems ) do
		if equippedItems[ defName ] then
			numEquippedSetItems = numEquippedSetItems + #equippedItems[ defName ]
		end
	end

	-- по уровням активации (зависят от количества экипированных предметов сета)
	for levelIdx, levelInfo in ipairs( bonuses ) do

		local strLevel = ""

		-- заголовок уровня

		local strLevelCaption = UI:GetStringByName( "itemTooltip_setLevelCaption" )
		local strNumItems = tostring( levelInfo.numItems )

		local numSubst = 0
		strLevelCaption, numSubst = string.gsub( strLevelCaption, "%$num%$", strNumItems )

		if numSubst == 0 then
			sys.log( "UI.ModuleTooltipWnd:UpdateItemSet()[ERROR]: cannot find placeholder \"$num$\" in string \"itemTooltip_setLevelCaption\"" )
			strLevelCaption = string.format( "[INVALID STRING] (%s)Set:", strNumItems )
		end

		strLevelCaption = string.format( "%s%s%s", strQualityColor, strLevelCaption, strBaseColor )
		strLevel = string.format( "%s%s%s", strLevel, strLevel ~= "" and "|" or "", strLevelCaption )


		-- бонусы на уровне

		local bIsLevelActive = numEquippedSetItems >= levelInfo.numItems
		local bonusColor = bIsLevelActive and baseColor or self.color_setInactive

		for bonusIdx, bonusInfo in ipairs( levelInfo.bonuses ) do

			local strBonus = ""

        	local shipDescParamInfo = nil

        	for paramIdx, paramInfo in pairs( shipDescParams ) do
        		if paramInfo.valField == bonusInfo.name then
        			shipDescParamInfo = paramInfo
        			break
        		end
        	end

        	if shipDescParamInfo then

        		local paramData =
        		{
        			paramInfo		= shipDescParamInfo,
        			vals			= UI:FixParamVals( { bonusInfo.val }, shipDescParamInfo, false ),
        			synergyLevel	= -1,				
        		}

        		strBonus = UI:ShipDescParam2Str( paramData, bonusColor, nil, "", -1, false )
				strBonus = string.format( "%s%s", strBonus, strBaseColor )

        	else
        		sys.log( "UI.ModuleTooltipWnd:UpdateItemSet()[ERROR]: cannot find ship desc param to show bonus %s for set %s", bonusInfo.name, setName )
        	end

			if strBonus == "" then
				strBonus = string.format( "%s[ERROR] %s=%f", UI:Color2Str( bonusColor ), bonusInfo.name, bonusInfo.val )
			end

			strLevel = string.format( "%s%s%s", strLevel, strLevel ~= "" and "|" or "", strBonus )

		end

		strBonuses = string.format( "%s%s%s", strBonuses, strBonuses ~= "" and "|" or "", strLevel )

	end

	if strBonuses ~= "" then
		str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strBonuses )
	end	

	self:SetText( str, self.layers.ITEM_SET_TEXT )

end


--
function UI.ModuleTooltipWnd:GetShipEquippedItems( shipData )

	local equippedItems = {}

	if not shipData then
		sys.log( "UI.ModuleTooltipWnd:GetShipEquippedItems()[ERROR]: nil shipData" )
		return equippedItems
	end

	local shipDataType = shipData:GetType()

	if shipDataType == UI.ModuleTooltipWnd.ShipData.types.ENTITY then

		local shipEntId = shipData:GetEntId()

		local shipEnt = _G.Entities[ shipEntId ]
		if shipEnt then

			for slotName, slotId in pairs( ai.SpaceShipModuleSlot ) do

				if slotId ~= ai.SpaceShipModuleSlot.NUM then

					local moduleEnt = shipEnt:GetModule( slotId )
					if moduleEnt then
	
						local moduleDefName = moduleEnt:GetDefName()
						
						if not equippedItems[ moduleDefName ] then
							equippedItems[ moduleDefName ] = {}
						end
						table.insert( equippedItems[ moduleDefName ], slotId )

					end

				end
		
			end

		else
			sys.log( "UI.ModuleTooltipWnd:GetShipEquippedItems()[ERROR]: cannot find entity with id %d", shipEntId )
		end

	elseif shipDataType == UI.ModuleTooltipWnd.ShipData.types.SHIP_INFO then

		local shipInfo = shipData:GetShipInfo()

		for slotName, slotId in pairs( ai.SpaceShipModuleSlot ) do

			if slotId ~= ai.SpaceShipModuleSlot.NUM then

				local moduleVarName = string.format( "module%d", slotId )
				local moduleDefName = shipInfo[ moduleVarName ]

				if not UI:IsStrEmpty( moduleDefName ) then
					
					if not equippedItems[ moduleDefName ] then
						equippedItems[ moduleDefName ] = {}
					end
					table.insert( equippedItems[ moduleDefName ], slotId )

				end

			end

		end

	elseif shipDataType == UI.ModuleTooltipWnd.ShipData.types.VID then

		local vid = shipData:GetVid()

		local shipItem = UI:GetShipItem( vid, false )
		if shipItem then

			for slotId, iid in pairs( shipItem.equipModules ) do
		
				if iid ~= nil and iid ~= UI.INVALID_U64_ID then

					local moduleDefName = UI:Iid2DefName( iid )
					if moduleDefName ~= "" then
						
						if not equippedItems[ moduleDefName ] then
							equippedItems[ moduleDefName ] = {}
						end
						table.insert( equippedItems[ moduleDefName ], slotId )
						
					else
						sys.log( "UI.ModuleTooltipWnd:GetShipEquippedItems()[ERROR]: cannot find ship item for iid %s", _G.U64ToStr( iid ) )
					end

				end
		
			end

		else
			sys.log( "UI.ModuleTooltipWnd:GetShipEquippedItems()[ERROR]: cannot find ship item for vid %s", _G.U64ToStr( vid ) )
		end


	elseif shipDataType == UI.ModuleTooltipWnd.ShipData.types.DEF then
		-- нет экипировки

	else
		sys.log( "UI.ModuleTooltipWnd:GetShipEquippedItems()[ERROR]: unhandled ship data type: %s", tostring( shipDataType ) )
	end

	return equippedItems
	
end


--
function UI.ModuleTooltipWnd:UpdateDesc()

	local compareParamsData = self:GetCompareShipParamsData()
	local desc = UI:GetItemDescEx( self.dstParamsData, compareParamsData, self.color_descSubst, self:GetColor( self.layers.DESC ), true )

	if not UI:IsStrEmpty( desc ) then
		self:SetLayerVisible( true, self.layers.DESC )
		self.descMetaText:SetText( desc, true )
	end

end


--
function UI.ModuleTooltipWnd:UpdateAtlasInfo()

	self:SetLayerVisible( false, self.layers.ATLAS )
	
	if not _G.MasterServer_IsConnected() then
		return
	end
	
	local baseDefName = self.defName
	
	if UI:GetItemUpgradeLevel( self.defName ) ~= -1 then
		baseDefName = UI:GetItemUpgradeBaseDef( self.defName )
	end

	local atlasId = UI:GetItemAtlasId( baseDefName )
	if atlasId == -1 then
		return
	end
	
	local level = UI:GetItemAtlasLevel( baseDefName )
	if level == -1 then
		
		local str = UI:GetStringByName( "itemTooltip_atlas_notPresent" )
		self:SetText( str, self.layers.ATLAS )
		self:SetLayerVisible( true, self.layers.ATLAS )

	else

		-- отображается число порядкового уровня (от 1 до количество_уровней), а не того, который прописан в поле current_upgade_level и связан с марком - #0081865,комм.(0359840)

		local minLevel	= UI:GetItemUpgradeMinLevel( baseDefName )
		local maxLevel 	= UI:GetItemUpgradeMaxLevel( baseDefName )

		if minLevel ~= -1 and maxLevel ~= -1 then
		
			if level < maxLevel then

				local numLevels_sequential	= maxLevel - minLevel + 1
				local level_sequential		= level - minLevel + 1
				
				local strLevel = string.format( "%d/%d", level_sequential, numLevels_sequential )
				
				local str = UI:GetStringByName( "itemTooltip_atlas_level" )
				
				local numSubst = 0
				str, numSubst = string.gsub( str, "%$level%$", strLevel )
				
				if numSubst == 0 then
					sys.log( "UI.ModuleTooltipWnd:UpdateAtlasInfo()[ERROR]: cannot find placeholder \"$level$\" in string \"itemTooltip_atlas_level\"" )
					str = string.format( "[INVALID STRING] No upgrades in atlas (%s)", strLevel )
				end
				
				self:SetText( str, self.layers.ATLAS )
				self:SetLayerVisible( true, self.layers.ATLAS )
				
			end

		end

	end

end


--
function UI.ModuleTooltipWnd:UpdatePrice()

	if not UI:IsDefAutogen( self.defName ) or self.iid == UI.INVALID_U64_ID then
		return
	end
	
	local price, bGold = UI:GetAutogenDismantlePrice( self.iid )
	
	local priceInfo =
	{
		priceType	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS,
		val			= price,
		basePrice	= price,
		bIsBuyPrice	= true,
	}
	
	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, false, nil )
	local str = string.format( "%s: %s", UI:GetStringByName( "autogenDismantlePrice" ), strPrice )
	
	self:SetLayerVisible( true, self.layers.PRICE )
	self.priceMetaText:SetText( str, true )

end


--
function UI.ModuleTooltipWnd:UpdateBonus()

	local bBonus = false
	local text = ""

	if UI:IsDefAmmo( self.defName ) then

		-- актуальная цена 0 в той или иной валюте не означает, что за эту валюту нельзя купить, 0 может образоваться в результате скидки,
		-- поэтому можно или нет купить за данную валюту, проверяется через базовую цену - там 0 означает невозможность купить за данную валюту

		local basePriceCredits, basePriceGold = UI:GetShopAllBaseBuyPricesByDef( self.defName )		-- #0036543, комм.(0132917) - "бонус выдается если поле золотой цены не пустое. Соответственно и описание надо показывать в этом же случае"

		if basePriceGold ~= 0 then
			bBonus = true
			text = UI:GetStringByName( "moduleTooltip_premiumBonus" )
		end

	elseif UI:IsDefModule( self.defName ) then

		if self:IsEnchanted() then

			local bonus = UI:GetEnchantedItemSynergyBonusByDefName( self.defName )
			if bonus ~= 0 then

				bBonus = true

				bonus = UI:Round( bonus * 100 )
				local strBonus = string.format( "%d%%", bonus )

				text = UI:GetStringByName( "moduleTooltip_enchantedSynergyBonus" )

				local strSubst =
				{
					val	= strBonus
				}
				text = string.gsub( text, "%$(.-)%$", strSubst )

			end

		end
		
	end

	self:SetLayerVisible( bBonus, self.layers.BONUS_EFFECT )
	self:SetLayerVisible( bBonus, self.layers.BONUS )

	if bBonus then
		self:SetText( text, self.layers.BONUS )
	end

end


--
function UI.ModuleTooltipWnd:UpdateCompareTooltip()

	if self.bSecondary then
		return
	end

	if self.compareDefName == "" then
		return
	end

	self.compareTooltipData =
	{
		tooltipType		= UI.tooltipTypes.MODULE,
		defName			= self.compareDefName,
		iid				= self.compareIid,
		dstShipData		= self.dstShipData,
	}	

end


--
function UI.ModuleTooltipWnd:UpdateTips()

	if self.bSecondary then
		return
	end

	local bHasTips = false

	if self:IsWithBuffs() then
		self:SetupTip( 1, self.tipTypes.EMPHASIZE_BUFFS )
		bHasTips = true
	end

	if self.bCanBeEquippedByClick then

		self:SetupTip( 2, self.tipTypes.EQUIP )
		bHasTips = true

	elseif self.bCanBeBoughtByClick then

		self:SetupTip( 2, self.tipTypes.BUY )
		bHasTips = true

	end

	if self.compareDefName ~= "" then
		self:SetupTip( 3, self.tipTypes.COMPARE )
		bHasTips = true
	end

	if bHasTips then
		self:SetLayerVisible( true, self.layers.TIPS_EFFECT )
	end

end


--
function UI.ModuleTooltipWnd:SetupTip( tipIdx, tipType )

	if tipIdx > self.MAX_TIPS then
		sys.log( "UI.ModuleTooltipWnd:SetupTip()[ERROR]: cannot show tip %d; max tips is %d", tipIdx, self.MAX_TIPS )
		return
	end

	local tipTypeName = UI:Val2Key( self.tipTypes, tipType )
	local strId = string.format( "itemTooltip_action_%s", tipTypeName )
	local tipText = UI:GetStringByName( strId )

	local tipLayer = self.layers.TIP_1 + tipIdx - 1 

	self:SetLayerVisible( true, tipLayer )
	self:SetText( tipText, tipLayer )	

end


--
function UI.ModuleTooltipWnd:RecalcLayout()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end

	local lastBlockY1 = 0

	-- имя (размер)

	local itemNameFormatRect = UI:Quat( 0, 0, self:GetWidth(), 100000 )

    local itemNameHeight = _G.MeasureText(
   		self:GetText( self.layers.ITEM_NAME ),
   		self:GetFont( self.layers.ITEM_NAME ),
    	itemNameFormatRect,
   		self:GetTextFormatFlags( self.layers.ITEM_NAME ),
    	itemNameFormatRect ).w

	self:SetLayerHeight( itemNameHeight, self.layers.ITEM_NAME )

	lastBlockY1 = self:GetLayerTop( self.layers.ITEM_NAME ) + itemNameHeight + self.space_itemName_sep


	-- иконка (позиция) и main_info (размер, позиция)

	self:ShowSeparator( lastBlockY1 )		

	-- иконка

	local itemIcoY0 = lastBlockY1 + self.space_sep_itemIcoTop
	self.itemIcoWnd:SetTop( itemIcoY0 )

	-- main_info

	local mainInfoText = self.mainInfoMetaText:GetFormattedText()
	local mainInfoFormatParams = self.mainInfoMetaText:GetFormatParams()
	local mainInfoformatRect = UI:Quat( 0, 0, mainInfoFormatParams.formatRectSize.x, mainInfoFormatParams.formatRectSize.y )

    local mainInfoHeight = _G.MeasureText(
   		mainInfoText,
   		mainInfoFormatParams.hFont,
    	mainInfoformatRect,
   		mainInfoFormatParams.formatFlags,
    	mainInfoformatRect ).w

	local mainInfoY0 = lastBlockY1 + self.space_sep_mainInfoTop
	self:SetLayerTop( mainInfoY0, self.layers.MAIN_INFO )

	lastBlockY1 = math.max( mainInfoY0 + mainInfoHeight, itemIcoY0 + self.itemIcoWnd:GetHeight() ) + self.space_mainInfoBtm_premBonus
	

	-- бонус для премиумной аммуниции (позиция)

	if self:IsLayerVisible( self.layers.BONUS_EFFECT ) then

		local premBonusEffect = UI:GetEffectFromLayer( self, self.layers.BONUS_EFFECT )
		if premBonusEffect then

			local premBonusPos = premBonusEffect:GetPos()
			premBonusPos.y = lastBlockY1

			premBonusEffect:SetPos( premBonusPos )

		end

		lastBlockY1 = lastBlockY1 + self.premBonusHeight + self.space_premBonus_sep

	end


	-- параметры (позиции)

	if next( self.curParamWnds ) then

		self:ShowSeparator( lastBlockY1 )		

		local numParams = #self.curParamWnds

		local paramY = lastBlockY1 + self.space_sep_paramsTop

    	for paramIdx = 1, numParams do

			local paramWnd = self.curParamWnds[ paramIdx ]
    		paramWnd:SetTop( paramY )

			local bPrim = UI:IsWndKindOf( paramWnd, "ModuleTooltip_PrimaryParamWnd" )
			paramY = paramY + paramWnd:GetHeight() + ( bPrim and self.space_params_prim or self.space_params_sec )

    	end

		local lastParamWnd = self.curParamWnds[ numParams ]
		lastBlockY1 = lastParamWnd:GetTop() + lastParamWnd:GetHeight() + self.space_paramsBtm_sep

	end


	-- сет (размер, позиция)

	if self:IsLayerVisible( self.layers.ITEM_SET_BG ) then

		self:ShowSeparator( lastBlockY1 )

		-- текст (размер)

		local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.ITEM_SET_TEXT ), 100000 )

        local textHeight = _G.MeasureText(
       		self:GetText( self.layers.ITEM_SET_TEXT ),
       		self:GetFont( self.layers.ITEM_SET_TEXT ),
        	formatRect,
       		self:GetTextFormatFlags( self.layers.ITEM_SET_TEXT ),
        	formatRect ).w

		self:SetLayerHeight( textHeight, self.layers.ITEM_SET_TEXT )

		-- фон (размер, позиция)

		local bgEffect = UI:GetEffectFromLayer( self, self.layers.ITEM_SET_BG )

		local bgY0 = lastBlockY1 + self.space_sep_setBgTop

		if bgEffect then
			bgEffect:SetPos( UI:Vec2( bgEffect:GetPos().x, bgY0 + workEffect:GetPos().y ) )
		end

		local bgHeight = self.space_setBgTop_setTextTop + textHeight + self.space_setTextBtm_setBgBtm
		bgHeight = UI:Clamp( bgHeight, self.setBgMinHeight, self.setBgMaxHeight )

		local animTime = ( bgHeight - self.setBgMinHeight ) / ( self.setBgMaxHeight - self.setBgMinHeight )

		local bgEffect = UI:GetEffectFromLayer( self, self.layers.ITEM_SET_BG )
		if bgEffect then
			bgEffect:SetAnimationTimeAndUpdate( animTime )
		end
		
		lastBlockY1 = bgY0 + bgHeight + self.space_setBgBtm_sep

	end


	-- описание (размер, позиция)

	if self:IsLayerVisible( self.layers.DESC ) then

		self:ShowSeparator( lastBlockY1 )		

		local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 100000 )

        local descHeight = _G.MeasureText(
       		self.descMetaText:GetFormattedText(),
       		self:GetFont( self.layers.DESC ),
        	descFormatRect,
       		self:GetTextFormatFlags( self.layers.DESC ),
        	descFormatRect ).w

		self:SetLayerHeight( descHeight, self.layers.DESC )

		local descY0 = lastBlockY1 + self.space_sep_descTop
		self:SetLayerTop( descY0, self.layers.DESC )

		lastBlockY1 = descY0 + descHeight + self.space_descBtm_sep

	end


	-- информация об атласе (позиция)

	if self:IsLayerVisible( self.layers.ATLAS ) then

		self:ShowSeparator( lastBlockY1 )

		local atlasY0 = lastBlockY1 + self.space_sep_atlasTop
		self:SetLayerTop( atlasY0, self.layers.ATLAS )

		lastBlockY1 = atlasY0 + self:GetLayerHeight( self.layers.ATLAS ) + self.space_atlasBtm_sep

	end


	-- цена (позиция)

	if self:IsLayerVisible( self.layers.PRICE ) then

		self:ShowSeparator( lastBlockY1 )		

		local priceY0 = lastBlockY1 + self.space_sep_priceTop
		self:SetLayerTop( priceY0, self.layers.PRICE )

		lastBlockY1 = priceY0 + self:GetLayerHeight( self.layers.PRICE ) + self.space_btm

	end


	-- размер подложки

	local workY0 = self:GetLayerTop( self.layers.WORK_EFFECT )
	local workHeight = lastBlockY1 - workY0

	local animTime = ( workHeight - self.workMinHeight ) / ( self.workMaxHeight - self.workMinHeight )
	workEffect:SetAnimationTime( animTime )
	workEffect:Update( 0 )


	-- собственный размер

	local selfHeight = lastBlockY1

	if self:IsLayerVisible( self.layers.TIPS_EFFECT ) then

		local tipsPos = workEffect:GetObjPos( self.effectInfo.work.tipsLocator )
		local tipsY1 = tipsPos.y + self.tipsHeight + workY0

		selfHeight = math.max( tipsY1, lastBlockY1 )

	end

	self:SetHeight( selfHeight )

	self:UpdateEffects()

end


--
function UI.ModuleTooltipWnd:ShowSeparator( y )

	local sepIdx = -1

	for idx = 1, self.MAX_SEPARATORS do
		if not self:IsLayerVisible( self.layers.SEPARATOR_1_EFFECT + idx - 1 ) then
			sepIdx = idx
			break
		end
	end

	if sepIdx == -1 then
		sys.log( "UI.ModuleTooltipWnd:ShowSeparator()[ERROR]: no more free separators" )
		return
	end

	local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1

	self:SetLayerVisible( true, sepLayer )

	local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
	if sepEffect then
		local pos = sepEffect:GetPos()
		pos.y = y
		sepEffect:SetPos( pos )
	end

end


--
function UI.ModuleTooltipWnd:PlaceOnScreen()

	UI:PlaceTooltipOnScreen( self, self.data )

end


--
function UI.ModuleTooltipWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1

		if self:IsLayerVisible( sepLayer ) then
			local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
			if sepEffect then
				sepEffect:Update( 0 )
			end
		end

	end

	self.mainInfoMetaText:UpdateScreenOrgFromLayer( self, self.layers.MAIN_INFO )

	local premBonusEffect = UI:GetEffectFromLayer( self, self.layers.BONUS_EFFECT )
	if premBonusEffect then
		premBonusEffect:Update( 0 )
	end
	
	self:UpdateMetaTextPos()

end


--
function UI.ModuleTooltipWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
	self.descMetaText:UpdateScreenOrgFromLayer( self, self.layers.DESC )

end


--
function UI.ModuleTooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MAIN_INFO then
		self.mainInfoMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.DESC then
		self.descMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ModuleTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()
	self:PlaceOnScreen()

end


--
function UI.ModuleTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ModuleTooltipWnd:UpdateDstShipParamsData()

	local data = nil

	if self.dstShipData then
		data = self:GetItemParamsDataFromShip( self.dstShipData, self.defName )
	end

	self.dstParamsData = { defName = self.defName, data = data }
	
	if UI:IsDefAutogen( self.defName ) and ( self.autogenUpgradeLevel ~= -1 or self.autogenItem ) then
	
		local autogenItem = self.autogenItem or UI:GetAutogenItem( self.defName )
		if autogenItem then
		
			local upgradeLevel = self.autogenUpgradeLevel ~= -1 and self.autogenUpgradeLevel or autogenItem.upgradeLevel
		
			if not self.dstParamsData.data then
				self.dstParamsData.data = {}
			end
			
			self.dstParamsData.data.autogen =
			{
				rollData		= autogenItem.rollData,
				upgradeLevel	= upgradeLevel,
				autogenDef		= _G.GenerateAutogenDef( autogenItem.rollData, upgradeLevel ),
			}
			
		else
			sys.log( "UI.ModuleTooltipWnd:UpdateDstShipParamsData()[ERROR]: cannot find autogen item" )
		end
		
	end

end


--
function UI.ModuleTooltipWnd:IsWithBuffs()

	return self.bHasBuffs

end


--
function UI.ModuleTooltipWnd:GetItemParamsDataFromShip( shipData, itemDefName )

	local itemParamsData = nil

	if not shipData then
		return itemParamsData
	end

	local shipDataType = shipData:GetType()

	if shipDataType == UI.ModuleTooltipWnd.ShipData.types.ENTITY then

		if UI:IsDefAmmo( itemDefName ) then
			itemParamsData = { params = _G.CL_GetMunitionParams( shipData:GetEntId(), itemDefName, false--[[SC-112506 без автогенов]] ) }
		else
			itemParamsData = { params = _G.CL_GetModuleParams( shipData:GetEntId(), shipData:GetSlotId(), itemDefName, false--[[SC-112506 без автогенов]] ) }
		end

	elseif shipDataType == UI.ModuleTooltipWnd.ShipData.types.SHIP_INFO then

		if UI:IsDefAmmo( itemDefName ) then
			itemParamsData = { params = _G.CL_GetMunitionParamsFromHangarData( shipData:GetPlayerId(), shipData:GetShipInfo().hangarIdx, itemDefName, false--[[SC-112506 без автогенов]] ) } 
		else
			itemParamsData = { params = _G.CL_GetModuleParamsFromHangarData( shipData:GetPlayerId(), shipData:GetShipInfo().hangarIdx, shipData:GetSlotId(), itemDefName, false--[[SC-112506 без автогенов]] ) }	
		end

	elseif shipDataType == UI.ModuleTooltipWnd.ShipData.types.VID then

		if UI:IsDefAmmo( itemDefName ) then
			itemParamsData = { params = _G.CL_GetMunitionParamsFromSpawnData( UI:GetShipSpawnData( shipData:GetVid(), true, shipData:GetActiveNodesMask(), self.bWithTalents, false--[[SC-112506 без автогенов]] ), itemDefName ) }
		else
			itemParamsData = { params = _G.CL_GetModuleParamsFromSpawnData( UI:GetShipSpawnData( shipData:GetVid(), true, shipData:GetActiveNodesMask(), self.bWithTalents, false--[[SC-112506 без автогенов]] ), shipData:GetSlotId(), itemDefName ) }
		end

	elseif shipDataType == UI.ModuleTooltipWnd.ShipData.types.DEF then

		if UI:IsDefAmmo( itemDefName ) then
			itemParamsData = { params = _G.CL_GetMunitionParamsFromSpawnData( UI:GetShipDefaultSpawnData( shipData:GetDefName(), true ), itemDefName ) }
		else
			itemParamsData = { params = _G.CL_GetModuleParamsFromSpawnData( UI:GetShipDefaultSpawnData( shipData:GetDefName(), true ), shipData:GetSlotId(), itemDefName ) }
		end

	end

	return itemParamsData

end


--
function UI.ModuleTooltipWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:CheckEmphasizeBuffs()
	self:CheckCompareTooltip()

end


--
function UI.ModuleTooltipWnd:CheckEmphasizeBuffs()

	if not self:IsWithBuffs() then
		return
	end

	local bOldEmphasizeBuffs = self.bEmphasizeBuffs

	if _G.Input_IsKeyPressed( UI.Keys.KEY_CONTROL ) and not self.bSecondary and not self.compareTooltipWnd:IsOnScreen() then
		self.bEmphasizeBuffs = true
	else
		self.bEmphasizeBuffs = false
	end

	if self.bEmphasizeBuffs ~= bOldEmphasizeBuffs then
		self:UpdateParamsOnEmphasizeBuffsChanged()
	end

end


--
function UI.ModuleTooltipWnd:UpdateParamsOnEmphasizeBuffsChanged()

	if self.autogenItem and UI.HangarWnd:IsOnScreen() then
		UI:AddTempAutogenDef( self.autogenItem )
	end

	local compareParamsData = self:GetCompareShipParamsData()

	for paramIdx, paramWnd in pairs( self.curParamWnds ) do
		paramWnd:Compare( compareParamsData )
	end

	self:UpdateDesc()

	self:RecalcLayout()	

end


--
function UI.ModuleTooltipWnd:CheckCompareTooltip()

	if self.bSecondary or self.compareDefName == "" then
		return
	end

	local bNeedCompareTooltip = _G.Input_IsKeyPressed( UI.Keys.KEY_SHIFT ) and not self.bEmphasizeBuffs
	local bIsCompareTooltip = self.compareTooltipWnd:IsOnScreen()

	if bNeedCompareTooltip and not bIsCompareTooltip then
		self:ShowCompareTooltip()

	elseif not bNeedCompareTooltip and bIsCompareTooltip then
		self:HideCompareTooltip()
	end

end


--
function UI.ModuleTooltipWnd:ShowCompareTooltip()

	if self.compareTooltipWnd:IsOnScreen() then
		return
	end
	
	-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0091165);
	-- координаты тоже сбрасываются, поэтому их тоже устанавливать перед показом.
	self.compareTooltipWnd:Setup( self.compareTooltipData )
	self.compareTooltipWnd:SetPos( self.compareTooltipPos )

	UI.Root:AddChild( self.compareTooltipWnd )
	UI.Root:MoveChildToLastPosition( self.compareTooltipWnd )

	self:UpdateParamsOnCompareChanged()

end


--
function UI.ModuleTooltipWnd:HideCompareTooltip()

	if not self.compareTooltipWnd or not self.compareTooltipWnd:IsOnScreen() then
		return
	end

	self.compareTooltipWnd:UnlinkFromParent()

	self:UpdateParamsOnCompareChanged()

end   


--
function UI.ModuleTooltipWnd:UpdateParamsOnCompareChanged()

	if self.autogenItem and UI.HangarWnd:IsOnScreen() then
		UI:AddTempAutogenDef( self.autogenItem )
	end

	local compareParamsData = self:GetCompareShipParamsData()

	for paramIdx, paramWnd in pairs( self.curParamWnds ) do
		paramWnd:Compare( compareParamsData )
	end

	self:UpdateDesc()

	self:RecalcLayout()	

end 


--
function UI.ModuleTooltipWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:Reset()

end


--
function UI.ModuleTooltipWnd:HasBuffs()

	local bHasBuffs = false

	if self.dstShipData ~= nil then

    	local data = nil

		-- #0060059 - для премиум кораблей используется 1-й уровень синергии ( 2-й параметр false в GetShipDefaultSpawnData() )
    	if UI:IsDefAmmo( self.defName ) then
    		data = { params = _G.CL_GetMunitionParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.dstShipData:GetDefName(), false, false ), self.defName ) }
    	else
    		data = { params = _G.CL_GetModuleParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.dstShipData:GetDefName(), false, false ), self.dstShipData:GetSlotId(), self.defName ) }
    	end

    	local compareParamsData = { defName = self.defName, data = data }

    	local tooltipParams = UI:GetItemTooltipParams( self.defName )
    	for paramIdx, paramInfo in pairs( tooltipParams ) do

    		if UI:GetItemParamValAsStr( paramInfo, self.dstParamsData, compareParamsData, true, nil, nil, false, tooltipParams, true, false ) ~= "" then
    			bHasBuffs = true
				break
    		end

    	end

		if not bHasBuffs then

        	local descBuffs		= UI:GetItemDescEx( self.dstParamsData, compareParamsData, self.color_descSubst, self:GetColor( self.layers.DESC ) )
        	local descNoBuffs	= UI:GetItemDescEx( self.dstParamsData, nil, self.color_descSubst, self:GetColor( self.layers.DESC ) )

        	bHasBuffs = descBuffs ~= descNoBuffs

		end

	end

	return bHasBuffs

end


-- -------------------------------------------------------------------------------
-- UI.ModuleTooltip_ParamWnd
-- -------------------------------------------------------------------------------

UI.ModuleTooltip_ParamWnd = {}
local mtp = UI.ModuleTooltip_ParamWnd

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ModuleTooltip_ParamWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ModuleTooltip_ParamWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "moduleTooltip_param",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.ModuleTooltip_ParamWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					-- не линкуется по цвету
					{
						objName		= "value",
						layer		= "UI.ModuleTooltip_ParamWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
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

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.ModuleTooltip_ParamWnd:Setup( defName, paramInfo, dstParamsData, compareParamsData, paramsTable )

	self:Reset()

	self.defName 			= defName
	self.paramInfo 			= paramInfo
	self.dstParamsData		= dstParamsData
	self.compareParamsData	= compareParamsData
	self.paramsTable		= paramsTable

	self:UpdateIco()
	self:UpdateName()
	self:UpdateVal()

end


--
function UI.ModuleTooltip_ParamWnd:Compare( compareParamsData )

	self.compareParamsData = compareParamsData
	self:UpdateVal()	

end


--
function UI.ModuleTooltip_ParamWnd:Reset()

	self.defName			= ""
	self.paramInfo			= nil
	self.dstParamsData		= nil
	self.compareParamsData	= nil
	self.paramsTable		= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.NAME )	
	self:SetText( "", self.layers.VAL )	

end

-- -----------------------------------
-- const
-- -----------------------------------

mtp.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
    VAL			= 2,
}

mtp.effectInfo =
{
	main =
	{
		icoSpriteName			= "ico",
		colorValLocator			= "color_data",
		colorBonusPlusLocator	= "color_improv_1",
		colorBonusMinusLocator	= "color_imprair",
		colorUnitsLocator		= "color_unit",		
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

mtp.defName				= ""
mtp.paramInfo			= nil
mtp.dstParamsData		= nil
mtp.compareDefName		= ""
mtp.compareParamsData	= nil
mtp.bCompare			= false

mtp.colorVal			= UI.WHITE_COLOR
mtp.colorBonusPlus		= UI.WHITE_COLOR
mtp.colorBonusMinus		= UI.WHITE_COLOR
mtp.colorUnits			= UI.WHITE_COLOR

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ModuleTooltip_ParamWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.colorVal			= mainEffect:GetObjColor( self.effectInfo.main.colorValLocator )
		self.colorBonusPlus		= mainEffect:GetObjColor( self.effectInfo.main.colorBonusPlusLocator )
		self.colorBonusMinus	= mainEffect:GetObjColor( self.effectInfo.main.colorBonusMinusLocator )
		self.colorUnits			= mainEffect:GetObjColor( self.effectInfo.main.colorUnitsLocator )

	end

end


--
function UI.ModuleTooltip_ParamWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local hTex = UI:GetItemParamIco( self.paramInfo )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.ModuleTooltip_ParamWnd:UpdateName()

	local name = UI:ItemParam2Str( self.paramInfo )
	self:SetText( name, self.layers.NAME )

end


--
function UI.ModuleTooltip_ParamWnd:UpdateVal()

	local str = UI:GetItemParamValAsStr( self.paramInfo, self.dstParamsData, self.compareParamsData, true, self.colorVal, self.colorUnits, false, self.paramsTable )
    self:SetText( str, self.layers.VAL )

end


--
function UI.ModuleTooltip_ParamWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.ModuleTooltip_ParamWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ModuleTooltip_ParamWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end   


-- -------------------------------------------------------------------------------
-- UI.ModuleTooltip_PrimaryParamWnd
-- -------------------------------------------------------------------------------

UI.ModuleTooltip_PrimaryParamWnd = {}
local mtpp = UI.ModuleTooltip_PrimaryParamWnd

local numParamWndLayers = UI:GetTableLength( UI.ModuleTooltip_ParamWnd.layers )

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ModuleTooltip_PrimaryParamWnd.def =
{
	className 	= "Wnd",
	prototype	= "ModuleTooltip_ParamWnd",

	props =
	{
		name		= "ModuleTooltip_PrimaryParamWnd",
		isPrototype	= true,
	},

	layers =
	{
		numLayers = numParamWndLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "moduleTooltip_primaryParam",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.ModuleTooltip_ParamWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					-- не линкуется по цвету
					{
						objName		= "value",
						layer		= "UI.ModuleTooltip_ParamWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					-- не линкуется по цвету
					{
						objName		= "value_2",
						layer		= "UI.ModuleTooltip_PrimaryParamWnd.layers.UNITS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- UNITS
		{
			id				= numParamWndLayers,

			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------    

--
function UI.ModuleTooltip_PrimaryParamWnd:Reset()

	UI.ModuleTooltip_ParamWnd.Reset( self )

	self:SetText( "", self.layers.UNITS )	

end


-- -----------------------------------
-- const
-- -----------------------------------

mtpp.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
    VAL			= 2,
	UNITS		= 3,
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ModuleTooltip_PrimaryParamWnd:UpdateVal()

	local strVal = UI:GetItemParamValAsStr( self.paramInfo, self.dstParamsData, self.compareParamsData, false, self.colorVal, nil, false, self.paramsTable )

    self:SetText( strVal, self.layers.VAL )


	local strUnits = UI:ParamUnits2Str( self.paramInfo )
	if strUnits ~= "" then
		strUnits = string.format( "%s%s", UI:Color2Str( self.colorUnits ), strUnits )	
	end

    self:SetText( strUnits, self.layers.UNITS )

end


-- --------------------------------------------------------------
-- UI.CompareModuleTooltipWnd
-- --------------------------------------------------------------

UI.CompareModuleTooltipWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.CompareModuleTooltipWnd.def =
{
	className	= "Wnd",
	prototype	= "ModuleTooltipWnd",

	props =
	{
		name		= "CompareModuleTooltipWnd",
		isPrototype	= true,
	},	
}

-- --------------------------------------
-- interface funtions
-- --------------------------------------

--
function UI.CompareModuleTooltipWnd:SetPos( pos )

	self.pos = UI:Vec2CopyStable( pos )

	if self:IsOnScreen() then
		self:PlaceOnScreen()
	end	

end

-- --------------------------------------
-- vars
-- --------------------------------------

UI.CompareModuleTooltipWnd.pos			= Vec2( 0, 0 )
UI.CompareModuleTooltipWnd.bSecondary	= true

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.CompareModuleTooltipWnd:F_PostLoad()

	UI.ModuleTooltipWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.pos = Vec2( 0, 0 )	

end


--
function UI.CompareModuleTooltipWnd:Reset()

	UI.ModuleTooltipWnd.Reset( self )
	self.pos.x, self.pos.y = 0, 0

end


--
function UI.CompareModuleTooltipWnd:PlaceOnScreen()

	self:SetLeft( self.pos.x )
	self:SetTop( self.pos.y )

	self:UpdateEffects()

end


-- ----------------------------------------------------------------------------
-- UI.ModuleTooltipWnd.ShipData
-- ----------------------------------------------------------------------------

UI.ModuleTooltipWnd.ShipData = {}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ModuleTooltipWnd.ShipData:CreateForVid( vid, slotId, activeNodesMask )

	local inst = self:GetInstatnce()
	inst:SetupForVid( vid, slotId, activeNodesMask )
	return inst

end


--
function UI.ModuleTooltipWnd.ShipData:CreateForEntity( entId, slotId )

	local inst = self:GetInstatnce()
	inst:SetupForEntity( entId, slotId )
	return inst

end


--
function UI.ModuleTooltipWnd.ShipData:CreateForShipInfo( shipInfo, playerId, slotId )

	local inst = self:GetInstatnce()
	inst:SetupForShipInfo( shipInfo, playerId, slotId )
	return inst

end


--
function UI.ModuleTooltipWnd.ShipData:CreateForDef( defName, slotId )

	local inst = self:GetInstatnce()
	inst:SetupForDef( defName, slotId )
	return inst

end


--
function UI.ModuleTooltipWnd.ShipData:GetType()

	return self.type

end


--
function UI.ModuleTooltipWnd.ShipData:GetVid()

	if self.type ~= self.types.VID then
		sys.log( "UI.ModuleTooltipWnd.ShipData:GetVid()[ERROR]: invalid type" )
		return UI.INVALID_U64_ID
	end

	return self.vid

end


--
function UI.ModuleTooltipWnd.ShipData:GetEntId()

	if self.type ~= self.types.ENTITY then
		sys.log( "UI.ModuleTooltipWnd.ShipData:GetVid()[ERROR]: invalid type" )
		return -1
	end

	return self.entId

end


--
function UI.ModuleTooltipWnd.ShipData:GetShipInfo()

	if self.type ~= self.types.SHIP_INFO then
		sys.log( "UI.ModuleTooltipWnd.ShipData:GetShipInfo()[ERROR]: invalid type" )
		return nil
	end

	return self.shipInfo

end


--
function UI.ModuleTooltipWnd.ShipData:GetPlayerId()

	if self.type ~= self.types.SHIP_INFO then
		sys.log( "UI.ModuleTooltipWnd.ShipData:GetPlayerId()[ERROR]: invalid type" )
		return -1
	end

	return self.playerId

end


--
function UI.ModuleTooltipWnd.ShipData:GetSlotId()

	return self.slotId

end


--
function UI.ModuleTooltipWnd.ShipData:SetSlotId( slotId )

	self.slotId = slotId

end


--
function UI.ModuleTooltipWnd.ShipData:GetDefName()

	local defName = ""

	if self.type == self.types.VID then

		if self.vid ~= UI.INVALID_U64_ID then

    		local shipItem = UI:GetShipItem( self.vid, true )
    		if shipItem then
    			defName = shipItem.defName or ""
			else
				sys.log( "UI.ModuleTooltipWnd.ShipData:GetDefName()[ERROR]: cannot find ship item" )
    		end

		end

	elseif self.type == self.types.ENTITY then

		if self.entId ~= -1 then

    		local ent = _G.Entities[ self.entId ]
    		if ent then
    			defName = ent:GetDefName()
			else
				sys.log( "UI.ModuleTooltipWnd.ShipData:GetDefName()[ERROR]: cannot find entity" )
    		end

		end

	elseif self.type == self.types.SHIP_INFO then
		defName = self.shipInfo.baseDef or ""

	elseif self.type == self.types.DEF then
		defName = self.defName

	else
		sys.log( "UI.ModuleTooltipWnd.ShipData:GetDefName()[ERROR]: unhandled type: %s", tostring( self.type ) )
	end

	return defName

end


--
function UI.ModuleTooltipWnd.ShipData:GetActiveNodesMask()

	return self.activeNodesMask

end


--
function UI.ModuleTooltipWnd.ShipData:IsValidShip()

	if self.type == self.types.VID then
		return self.vid ~= UI.INVALID_U64_ID and UI:GetShipItem( self.vid, true ) ~= nil

	elseif self.type == self.types.ENTITY then
		return self.entId ~= -1 and _G.Entities[ self.entId ] ~= nil

	elseif self.type == self.types.SHIP_INFO then
		return self.shipInfo ~= nil and self.shipInfo.hangarIdx ~= nil and self.playerId ~= -1

	elseif self.type == self.types.DEF then
		return self.defName ~= "" and UI:GetDef( self.defName ) ~= nil

	else
		return false
	end

	return true

end


-- ------------------------------
-- const
-- ------------------------------

UI.ModuleTooltipWnd.ShipData.SHIP_DATA = true

UI.ModuleTooltipWnd.ShipData.types =
{
	VID			= 1,
	ENTITY		= 2,
	SHIP_INFO	= 3,	
	DEF			= 4,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ModuleTooltipWnd.ShipData.type					= -1
UI.ModuleTooltipWnd.ShipData.vid					= UI.INVALID_U64_ID
UI.ModuleTooltipWnd.ShipData.entId					= -1
UI.ModuleTooltipWnd.ShipData.shipInfo				= nil
UI.ModuleTooltipWnd.ShipData.playerId				= -1
UI.ModuleTooltipWnd.ShipData.defName				= ""
UI.ModuleTooltipWnd.ShipData.slotId					= -1
UI.ModuleTooltipWnd.ShipData.activeNodesMask		= nil
UI.ModuleTooltipWnd.ShipData.autogenUpgradeLevel	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ModuleTooltipWnd.ShipData:GetInstatnce()

	local inst = UI:CopyTable2( UI.ModuleTooltipWnd.ShipData )
	inst:Reset()
	return inst

end


--
function UI.ModuleTooltipWnd.ShipData:Reset()

    self.vid					= UI.INVALID_U64_ID
    self.entId					= -1
    self.shipInfo				= nil
    self.playerId				= -1
	self.defName				= ""
    self.slotId					= -1
	self.activeNodesMask		= nil
	self.autogenUpgradeLevel	= -1

end


--
function UI.ModuleTooltipWnd.ShipData:SetupForVid( vid, slotId, activeNodesMask )

	if type( vid ) ~= "userdata" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForVid()[ERROR]: invalid type of the 1-st param (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	if type( slotId ) ~= "number" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForVid()[ERROR]: invalid type of the 2-nd param (\"slotId\"); \"number\" expected, got \"%s\"", type( slotId ) )
		return
	end

	if activeNodesMask ~= nil then
    	if type( activeNodesMask ) ~= "userdata" then
    		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForVid()[ERROR]: invalid type of the 3-rd param (\"activeNodesMask\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( activeNodesMask ) )
    		return
    	end
	end

	self:Reset()

	self.type = self.types.VID

	self.vid				= vid
	self.slotId				= slotId
	self.activeNodesMask	= self.activeNodesMask

end


--
function UI.ModuleTooltipWnd.ShipData:SetupForEntity( entId, slotId )

	if type( entId ) ~= "number" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForEntity()[ERROR]: invalid type of the 1-st param (\"entId\"); \"number\" expected, got \"%s\"", type( entId ) )
		return
	end

	if type( slotId ) ~= "number" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForEntity()[ERROR]: invalid type of the 2-nd param (\"slotId\"); \"number\" expected, got \"%s\"", type( slotId ) )
		return
	end

	self:Reset()

	self.type = self.types.ENTITY

	self.entId	= entId
	self.slotId	= slotId

end


--
function UI.ModuleTooltipWnd.ShipData:SetupForShipInfo( shipInfo, playerId, slotId )

	if type( shipInfo ) ~= "table" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForShipInfo()[ERROR]: invalid type of the 1-st param (\"shipInfo\"); \"table\" expected, got \"%s\"", type( shipInfo ) )
		return
	end

	if type( playerId ) ~= "number" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForShipInfo()[ERROR]: invalid type of the 2-nd param (\"playerId\"); \"number\" expected, got \"%s\"", type( playerId ) )
		return
	end

	if type( slotId ) ~= "number" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForShipInfo()[ERROR]: invalid type of the 3-rd param (\"slotId\"); \"number\" expected, got \"%s\"", type( slotId ) )
		return
	end

	self:Reset()

	self.type = self.types.SHIP_INFO

	self.shipInfo	= shipInfo
	self.playerId	= playerId
	self.slotId		= slotId

end


--
function UI.ModuleTooltipWnd.ShipData:SetupForDef( defName, slotId )

	if type( defName ) ~= "string" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForDef()[ERROR]: invalid type of the 1-st param (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if type( slotId ) ~= "number" then
		sys.log( "UI.ModuleTooltipWnd.ShipData:SetupForDef()[ERROR]: invalid type of the 3-rd param (\"slotId\"); \"number\" expected, got \"%s\"", type( slotId ) )
		return
	end

	self:Reset()

	self.type = self.types.DEF

	self.defName	= defName
	self.slotId		= slotId

end

-- --------------------------------------------------------------
-- инстанс общего тултипа
-- --------------------------------------------------------------

UI.ModuleTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "ModuleTooltipWnd",

    	props =
    	{
    		name		= "ModuleTooltipWnd_shared",
    	},	
	}
}
