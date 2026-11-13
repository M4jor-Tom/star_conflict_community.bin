-- ----------------------------------------------------------------------------
--
-- Workfile: shiptooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- -----------------------------------------------------------------------
-- UI.ShipTooltipWnd
-- -----------------------------------------------------------------------

UI.ShipTooltipWnd = {}
local st = UI.ShipTooltipWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.ShipTooltipWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ShipTooltipWnd",
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
						layer		= "UI.ShipTooltipWnd.layers.WORK_EFFECT",
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
				defName 			= "shipTooltip_tips",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "vol_1",
						layer		= "UI.ShipTooltipWnd.layers.TIP_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "vol_2",
						layer		= "UI.ShipTooltipWnd.layers.TIP_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "vol_3",
						layer		= "UI.ShipTooltipWnd.layers.TIP_3",
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
				defName 			= "shipTooltip_work",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по цвету
					{
						objName		= "title",
						layer		= "UI.ShipTooltipWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по размеру
					{
						objName		= "description8",
						layer		= "UI.ShipTooltipWnd.layers.CRAFT_INFO",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					-- не линкуется по позиции
					{
						objName		= "text_ship_1",
						layer		= "UI.ShipTooltipWnd.layers.SHIP_TYPE_TEXT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					-- RANK линкуется к трем локаторам: к text_ship_2 по рамеру (и устанавливается по позиции), к text_ship_1 по цвету, к text_ship_3 по шрифту
					{
						objName		= "text_ship_2",
						layer		= "UI.ShipTooltipWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					-- RANK линкуется к трем локаторам: к text_ship_2 по рамеру (и устанавливается по позиции), к text_ship_1 по цвету, к text_ship_3 по шрифту
					{
						objName		= "text_ship_1",
						layer		= "UI.ShipTooltipWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.COLOR,
					},

					-- RANK линкуется к трем локаторам: к text_ship_2 по рамеру (и устанавливается по позиции), к text_ship_1 по цвету, к text_ship_3 по шрифту
					{
						objName		= "text_ship_3",
						layer		= "UI.ShipTooltipWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции, размеру и цвету
					{
						objName		= "text_ship_3",
						layer		= "UI.ShipTooltipWnd.layers.REQUIRED_RANK",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "text_ship_4",
						layer		= "UI.ShipTooltipWnd.layers.LOCK_REASONS",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.ShipTooltipWnd.layers.DESC_PARAMS",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции, размеру и цвету (по цвету линкуется к локатору descript_color_2 эффекта COLORS_EFFECT )
					{
						objName		= "description",
						layer		= "UI.ShipTooltipWnd.layers.DESC_SIMPLE",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "durability",
						layer		= "UI.ShipTooltipWnd.layers.DURABILITY",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
					
					-- не линкуется по позиции
					{
						objName		= "price",
						layer		= "UI.ShipTooltipWnd.layers.REPAIR_PRICE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "notice",
						layer		= "UI.ShipTooltipWnd.layers.TIPS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по позиции
					{
						objName		= "text_sinerge",
						layer		= "UI.ShipTooltipWnd.layers.SYNERGY_LEVEL",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- CRAFT_INFO
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SHIP_TYPE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- REQUIRED_RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- LOCK_REASONS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- ELITE_DESC_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipTooltip_eliteDesc2",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по цвету, позиции и размеру
					{
						objName		= "text",
						layer		= "UI.ShipTooltipWnd.layers.ELITE_DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},   
				}
			}}
		},

		-- ELITE_DESC
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},  

		-- SYNERGY_LEVEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- DESC_PARAMS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- DESC_SIMPLE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- DURABILITY
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- REPAIR_PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},

		-- SEPARATOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_4_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_5_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_6_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_7_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipTooltip_separator",
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

				links =
				{
					-- только по цвету (по остальным параметрам - к локатору description эффекта WORK_EFFECT)
					{
						objName		= "descript_color_2",
						layer		= "UI.ShipTooltipWnd.layers.DESC_SIMPLE",
						animParams	= UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- служебный эффект
		-- SEC_PARAMS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,

			effects =
			{{
				defName 			= "shipTooltip_secParams",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.ShipTooltipWnd:Setup( _data )

	self:Reset()

	if type( _data ) ~= "table" then
		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( _data ) )
		return
	end

	local data = UI:CopyTable2( _data )

	if type( data.defName ) ~= "string" then
		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.defName\"; \"string\" expected, got \"%s\"", type( data.defName ) )
		return
	end

	if data.vid ~= nil and type( data.vid ) ~= "userdata" then
		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.vid\"; \"userdata\" expected, got \"%s\"", type( data.vid ) )
		data.vid = UI.INVALID_U64_ID
	end

	if self.vid ~= UI.INVALID_U64_ID then
		local shipItem = UI:GetShipItem( self.vid )
		if not shipItem then
			data.vid = UI.INVALID_U64_ID
		end
	end

	-- струкутура, возвращаемая CL_GetAvailableShips()
	if data.shipInfo ~= nil and type( data.shipInfo ) ~= "table" then
		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.shipInfo\"; \"table\" expected, got \"%s\"", type( data.shipInfo ) )
		data.shipInfo = nil
	end

	if data.playerId ~= nil and type( data.playerId ) ~= "number" then
		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.playerId\"; \"number\" expected, got \"%s\"", type( data.playerId ) )
		data.playerId = nil
	end

	if data.playerUid ~= nil and type( data.playerUid ) ~= "userdata" then
		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.playerUid\"; \"userdata\" expected, got \"%s\"", type( data.playerUid ) )
		data.playerUid = nil
	end

	if data.shipInfo ~= nil and ( data.playerId == nil or data.playerUid == nil ) then
		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: if shipInfo is specified then playerId and playerUid must be specified as well" )
		return
	end

	if data.mode ~= nil then
		if UI:Val2Key( UI.shipTooltipModes, data.mode ) == "" then
			sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid \"data.mode\"; one of the \"UI.ShipTooltip.modes\" values expected, got \"%s\"", tostring( data.mode ) )
			data.mode = -1
		end
	end	

	if not self.bSecondary then
    	if data.bCompare ~= nil and type( data.bCompare ) ~= "boolean" then
    		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.bCompare\"; \"boolean\" expected, got \"%s\"", type( data.bCompare ) )
    		data.bCompare = false
    	end
	end

	if data.logEvent ~= nil then
		if type( data.logEvent ) == "number" then

			if data.logEvent ~= -1 then
				if UI:Val2Key( _G.MasterServer.PlayerAction, data.logEvent ) == "" then
					sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid \"data.logEvent\"; \"one of the \"_G.MasterServer.PlayerAction\" values or -1 or nil expected, got %d", data.logEvent )
					data.logEvent = -1
				end
			end

		else
			sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.logEvent\"; \"number\" or \"nil\" expected, got \"%s\"", type( data.logEvent ) )
			data.logEvent = -1
		end
	else
		data.logEvent = -1
	end

	if data.craftedSpecModule ~= nil then
		if type( data.craftedSpecModule ) ~= "string" then
    		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.craftedSpecModule\"; \"string\" or \"nil\" expected, got \"%s\"", type( data.craftedSpecModule ) )
			data.craftedSpecModule = nil
		end
	end

	if data.craftedBonuses ~= nil then
		if type( data.craftedBonuses ) ~= "table" then
    		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.craftedBonuses\"; \"table\" or \"nil\" expected, got \"%s\"", type( data.craftedBonuses ) )
			data.craftedBonuses = nil
		end
	end

	if data.craftedModuleSlots ~= nil then
		if type( data.craftedModuleSlots ) ~= "table" then
    		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.craftedModuleSlots\"; \"table\" or \"nil\" expected, got \"%s\"", type( data.craftedModuleSlots ) )
			data.craftedModuleSlots = nil
		end
	end

	if data.chosenNodesMask ~= nil then
		if type( data.chosenNodesMask ) ~= "userdata" then
    		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.chosenNodesMask\"; \"userdata\" or \"nil\" expected, got \"%s\"", type( data.chosenNodesMask ) )
			data.chosenNodesMask = nil
		end
	end

	if data.bWithTalents ~= nil then
		if type( data.bWithTalents ) ~= "boolean" then
    		sys.log( "UI.ShipTooltipWnd:Setup()[ERROR]: invalid type of \"data.bWithTalents\"; \"boolean\" or \"nil\" expected, got \"%s\"", type( data.bWithTalents ) )
			data.bWithTalents = nil
		end
	end

	self.defName				= data.defName
	self.vid					= data.vid or UI.INVALID_U64_ID
	self.shipInfo				= data.shipInfo
	self.playerId				= data.playerId or -1
	self.playerUid				= data.playerUid or UI.INVALID_U64_ID
	self.baseMode				= data.mode or -1
	self.logEvent				= data.logEvent
	self.craftedSpecModule		= data.craftedSpecModule or ""
	self.craftedBonuses			= data.craftedBonuses
	self.chosenNodesMask		= data.chosenNodesMask
	self.bWithTalents			= data.bWithTalents or false

	if data.craftedModuleSlots ~= nil then

		self.craftedModuleSlotsMask = 0

		for slotId, dummy in pairs( data.craftedModuleSlots ) do
			self.craftedModuleSlotsMask = UI:BitSet( self.craftedModuleSlotsMask, slotId )
		end

	end

	if data.bCompare then
		if UI.HangarWnd:IsOnScreen() then
			local selShipItem = UI.HangarWnd:GetSelShipItem()
			if selShipItem then
				self.compareVid = selShipItem.vid
			end
		end
	end

	if self:IsWithBuffs() then
		self.bEmphasizeBuffs = self.bEmphasizeBuffsDefault
	else
		self.bEmphasizeBuffs = false
	end	

	self:ValidateMode()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		self:PlaceOnScreen()
	end

end


-- -----------------------------------
-- const
-- -----------------------------------

st.layers =
{
	MAIN_EFFECT					= 0,
	TIPS_EFFECT					= 1,
	TIP_1						= 2,
	TIP_2						= 3,
	TIP_3						= 4, 
	WORK_EFFECT					= 5, 
	SHIP_NAME					= 6, 
	CRAFT_INFO					= 7, 
	SHIP_TYPE_TEXT				= 8,
	RANK						= 9,
	REQUIRED_RANK				= 10,
	LOCK_REASONS				= 11,
	ELITE_DESC_EFFECT			= 12,
	ELITE_DESC					= 13,
	SYNERGY_LEVEL				= 14,
	DESC_PARAMS					= 15,
	DESC_SIMPLE               	= 16,
	DURABILITY					= 17,
	REPAIR_PRICE				= 18,
	SEPARATOR_1_EFFECT			= 19,
	SEPARATOR_2_EFFECT			= 20,
	SEPARATOR_3_EFFECT			= 21,
	SEPARATOR_4_EFFECT			= 22,
	SEPARATOR_5_EFFECT			= 23,
	SEPARATOR_6_EFFECT			= 24,
	SEPARATOR_7_EFFECT			= 25,
	COLORS_EFFECT				= 26,
	SEC_PARAMS_EFFECT			= 27,
}

st.effectInfo =
{
	work =
	{
		minSizeLocator				= "dist_min",
		maxSizeLocator				= "self",
		descLocator					= "description",
		sepLocatorPrefix			= "spacer_",
		tipsLocator					= "notice",		
		firstSlotLocator			= "module_icon_1",
		secondSlotLocator			= "module_icon_2",
		primParamLocator			= "properties_line_1",
		secParamsLocator			= "properties_line3",
		deviderLocator				= "spacer_2_1",
		specModuleIcoLocator		= "module_icon_3",
		specModuleNameLocator		= "module_title",
		durLocator					= "durability",
		repairPriceLocator			= "price",
		repLocator					= "text_ship_3",
		lockReasonsLocator			= "text_ship_4",
		synergyLevelLocator			= "text_sinerge",
		synergyPbLocator			= "progress",
		shipIcoLocator				= "ship_ico",
		eliteDescLocator			= "premium",
		shipNameLocator				= "title",
		craftInfoLocator			= "description8",
		shipTypeLocator				= "text_ship_1",
		rankLocator					= "text_ship_2",
	},

	secParams =
	{
		secParamCol1Row1Locator		= "properties_line_2_1",
		secParamCol2Row1Locator		= "properties_line_2_2",
		secParamCol1Row2Locator		= "properties_line_2_4",
	},

	colors =
	{
		repFitLocator					= "type_requirements_reputation_true",
		repUnfitLocator					= "type_requirements_reputation_falce",
		durHighLocator					= "durability_100",
		durLowLocator					= "durability_40",
		durZeroLocator					= "durability_0",
		durInfiniteLocator				= "durability_indestructible",
		durMaxLocator					= "durability_100",
		eliteDescColorUnlockCredits		= "white",
		eliteDescColorLock				= "grey",
	},

	role =
	{
		spriteName	= "ico",
	},

	shipIco =
	{
		icoSpriteName			= "ico_ship",
	},

	eliteDesc =
	{
		textLocator		= "text",
		maxSizeLocator	= "self",
		minSizeLocator	= "dist_min",		
	}
}

st.MAX_TIPS			= 3
st.MAX_SEPARATORS	= 8

st.tipTypes =
{
	EMPHASIZE_BUFFS	= 1,
	SPEC_MODULE		= 3,
	COMPARE			= 4,
}

st.slotTypes =
{
	AMMO_PRIMARY	= 1,  
	AMMO_SECONDARY	= 2, 
	ACTIVE			= 3, 
	ENGINE_MOD		= 4, 
	CAPACITOR_MOD	= 5, 
	SHIELD_MOD		= 6, 
	ARMOR_MOD		= 7, 
	CPU_MOD			= 8, 
}

st.moduleSlot2SlotType =
{
	ACTIVE_01			= st.slotTypes.ACTIVE,
	ACTIVE_02			= st.slotTypes.ACTIVE,
	ACTIVE_03			= st.slotTypes.ACTIVE,
	ACTIVE_04			= st.slotTypes.ACTIVE,    	
	ENGINE_MOD_01		= st.slotTypes.ENGINE_MOD,
	ENGINE_MOD_02		= st.slotTypes.ENGINE_MOD,
	ENGINE_MOD_03		= st.slotTypes.ENGINE_MOD,
	CAPACITOR_MOD_01	= st.slotTypes.CAPACITOR_MOD,
	CAPACITOR_MOD_02	= st.slotTypes.CAPACITOR_MOD,
	CAPACITOR_MOD_03	= st.slotTypes.CAPACITOR_MOD,
	SHIELD_MOD_01		= st.slotTypes.SHIELD_MOD,
	SHIELD_MOD_02		= st.slotTypes.SHIELD_MOD,
	SHIELD_MOD_03		= st.slotTypes.SHIELD_MOD,
	ARMOR_MOD_01		= st.slotTypes.ARMOR_MOD,
	ARMOR_MOD_02		= st.slotTypes.ARMOR_MOD,
	ARMOR_MOD_03		= st.slotTypes.ARMOR_MOD,
	CPU_MOD_01			= st.slotTypes.CPU_MOD,
	CPU_MOD_02			= st.slotTypes.CPU_MOD,
	CPU_MOD_03			= st.slotTypes.CPU_MOD,
}

st.ammoType2SlotType =
{
	MBT_PRIMARY		= st.slotTypes.AMMO_PRIMARY,
	MBT_SECONDARY	= st.slotTypes.AMMO_SECONDARY,
}

st.space_compareTooltip			= UI:XTo1024x768( 10, { x = 1280, y = 720 } )
st.space_specModuleTooltips_x	= UI:XTo1024x768( 10, { x = 1280, y = 720 } )
st.space_specModuleTooltips_y	= UI:YTo1024x768( 10, { x = 1280, y = 720 } )

st.bEmphasizeBuffsDefault = false

-- -----------------------------------
-- vars
-- -----------------------------------

st.defName					= ""
st.vid						= UI.INVALID_U64_ID
st.shipInfo					= nil
st.playerId					= -1
st.playerUid				= UI.INVALID_U64_ID
st.compareVid				= UI.INVALID_U64_ID
st.logEvent					= -1
st.craftedSpecModule		= ""
st.craftedBonuses			= nil
st.craftedModuleSlotsMask	= nil
st.chosenNodesMask			= nil
st.bWithTalents				= false

st.allPrimParamWnds			= {}
st.allSecParamWnds			= {}
st.allDeviderWnds			= {}
st.curParamWnds				= {}
st.allSlotWnds				= {}
st.curSlotWnds				= {}
st.curSpecModuleIcons		= {}
st.allSpecModuleIcons		= {}
st.curSpecModuleTooltips	= {}
st.allSpecModuleTooltips	= {}
st.synergyBarWnd			= nil
st.baseMode					= -1
st.mode						= -1
st.bSecondary				= false
st.compareTooltipWnd		= nil
st.bEmphasizeBuffs 			= false
st.eliteDescMetaText		= nil
st.reparPriceMetaText		= nil
st.shipIcoWnd				= nil

st.space_mainInfoBtm_eliteDescEffect		= 0
st.space_eliteDescEffect_sep				= 0
st.space_eliteDescEffectTop_eliteDescText	= 0
st.space_eliteDescText_eliteDescEffectBtm	= 0
st.space_reqRank_lockReasons			= 0
st.space_sep_synergyPb			= 0
st.space_sep_synergyLevelTop	= 0
st.space_synergyLevelBtm_sep	= 0
st.space_sep_slots				= 0
st.space_slots_sep				= 0
st.space_slots					= 0
st.space_sep_paramsTop			= 0
st.space_paramsBtm_sep			= 0
st.space_paramsRows				= 0
st.space_devider_paramTop		= 0
st.space_paramBtm_devider 		= 0
st.space_sep_descTop			= 0
st.space_descBtm_sep			= 0
st.space_sep_specModuleIcoTop	= 0
st.space_specModuleIcoBtm_sep	= 0
st.space_specModuleIcons		= 0
st.space_sep_durTop				= 0
st.space_durBtm_btm				= 0
st.space_sep_repairPriceTop		= 0
st.space_repairPriceBtm_btm		= 0
st.space_shipName_sep			= 0
st.space_craftInfo_sep			= 0
st.space_sep_shipType			= 0
st.space_shipType_rank			= 0
st.space_rank_reqRank			= 0
st.space_sep_shipIco			= 0
st.workMinHeight				= 0
st.workMaxHeight				= 0
st.tipsHeight					= 0
st.paramsCol1X					= 0
st.paramsCol2X					= 0
st.primParamX					= 0
st.deviderX						= 0
st.shipIcoHeight				= 0
st.eliteDescEffectMinHeight		= 0
st.eliteDescEffectMaxHeight		= 0
st.specModuleIconsX				= 0
st.specModuleIcoWidth			= 0
st.specModuleIcoHeight			= 0

st.color_rankFit			= UI.WHITE_COLOR
st.color_rankUnfit			= UI.WHITE_COLOR
st.color_durHigh			= UI.WHITE_COLOR
st.color_durLow				= UI.WHITE_COLOR
st.color_durZero			= UI.WHITE_COLOR
st.color_durInfinite		= UI.WHITE_COLOR
st.color_durMax				= UI.WHITE_COLOR
st.color_descSubst			= UI.TEXT_SEL_COLOR
st.color_eliteDescColorUnlockCredits	= UI.WHITE_COLOR
st.color_eliteDescColorUnlockGold		= UI.WHITE_COLOR
st.color_eliteDescColorLock				= UI.WHITE_COLOR

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ShipTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.allPrimParamWnds		= {}
	self.allSecParamWnds		= {}
	self.allDeviderWnds			= {}
	self.curParamWnds			= {}
	self.allSlotWnds			= {}
	self.curSlotWnds			= {}
	self.curSpecModuleIcons		= {}
	self.allSpecModuleIcons		= {}
	self.curSpecModuleTooltips	= {}
	self.allSpecModuleTooltips	= {}

	self.eliteDescMetaText = UI.MetaText.GetNewInstance()
	self.eliteDescMetaText:InitFromLayer( self, self.layers.ELITE_DESC ) 
	
	self.reparPriceMetaText = UI.MetaText.GetNewInstance()
	self.reparPriceMetaText:InitFromLayer( self, self.layers.REPAIR_PRICE )

	self:CreateControls()
	self:PrepareLayoutParams()

	self:Reset()		

end


--
function UI.ShipTooltipWnd:F_Shutdown()

	if self.eliteDescMetaText then
		self.eliteDescMetaText:Clear()
	end
	
	if self.reparPriceMetaText then
		self.reparPriceMetaText:Clear()
	end

	self:SetText( "", self.layers.RANK )

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipTooltipWnd:CreateControls()

	for icoIdx = 1, 1 do
		self:CreateSpecModuleIco()
	end

	for tooltipIdx = 1, 1 do
		self:CreateSpecModuleTooltip()
	end

	if not self.bSecondary then
		self.compareTooltipWnd = UI:CreateChildWnd( self, UI.CompareShipTooltipWnd, "" )
	end

	for paramIdx = 1, 4 do
		self:CreateSecParamWnd()
	end

	for paramIdx = 1, 1 do
		self:CreatePrimParamWnd()
	end

	for deviderIdx = 1, 3 do
		self:CreateDeviderWnd()
	end

	for slotIdx = 1, 11 do
		self:CreateSlotWnd()
	end

	self.synergyBarWnd = UI:CreateChildWnd( self, UI.SynergyBarWnd, "" )	
	self:AddChild( self.synergyBarWnd )

	self.shipIcoWnd = UI:CreateChildWnd( self, UI.ShipIcoWnd, "" )
	self:AddChild( self.shipIcoWnd )
	self.shipIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )
	
end


--
function UI.ShipTooltipWnd:CreateSecParamWnd()
	
	local paramWnd = UI:CreateChildWnd( self, UI.ShipTooltip_ParamWnd, tostring( #self.allSecParamWnds ) )
	table.insert( self.allSecParamWnds, paramWnd )
	return paramWnd

end


--
function UI.ShipTooltipWnd:ObtainFreeSecParamWnd()

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

	return freeParamWnd

end


--
function UI.ShipTooltipWnd:CreatePrimParamWnd()
	
	local paramWnd = UI:CreateChildWnd( self, UI.ShipTooltip_PrimaryParamWnd, tostring( #self.allPrimParamWnds ) )
	table.insert( self.allPrimParamWnds, paramWnd )
	return paramWnd

end


--
function UI.ShipTooltipWnd:ObtainFreePrimParamWnd()

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

	return freeParamWnd

end       


--
function UI.ShipTooltipWnd:CreateDeviderWnd()
	
	local deviderWnd = UI:CreateChildWnd( self, UI.ShipTooltip_DeviderWnd, tostring( #self.allDeviderWnds ) )
	table.insert( self.allDeviderWnds, deviderWnd )
	return deviderWnd

end


--
function UI.ShipTooltipWnd:ObtainFreeDeviderWnd()

	local freeDeviderWnd = nil

	for idx, deviderWnd in pairs( self.allDeviderWnds ) do
		if not deviderWnd:IsChildOf( self ) then
			freeDeviderWnd = deviderWnd
			break
		end
	end

	if not freeDeviderWnd then
		freeDeviderWnd = self:CreateDeviderWnd()
	end

	table.insert( self.curParamWnds, freeDeviderWnd )

	self:AddChild( freeDeviderWnd )

	return freeDeviderWnd

end


--
function UI.ShipTooltipWnd:CreateSlotWnd()
	
	local slotWnd = UI:CreateChildWnd( self, UI.ShipTooltip_SlotWnd, tostring( #self.allSlotWnds ) )
	table.insert( self.allSlotWnds, slotWnd )
	return slotWnd

end


--
function UI.ShipTooltipWnd:ObtainFreeSlotWnd()

	local freeSlotWnd = nil

	for idx, slotWnd in pairs( self.allSlotWnds ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlotWnd()
	end

	table.insert( self.curSlotWnds, freeSlotWnd )

	self:AddChild( freeSlotWnd )

	return freeSlotWnd

end


--
function UI.ShipTooltipWnd:CreateSpecModuleIco()
	
	local icoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, tostring( #self.allSpecModuleIcons + 1 ) )
	icoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )

	table.insert( self.allSpecModuleIcons, icoWnd )

	return icoWnd

end


--
function UI.ShipTooltipWnd:ObtainFreeSpecModuleIco()

	local freeIcoWnd = nil

	for idx, icoWnd in pairs( self.allSpecModuleIcons ) do
		if not icoWnd:IsChildOf( self ) then
			freeIcoWnd = icoWnd
			break
		end
	end

	if not freeIcoWnd then
		freeIcoWnd = self:CreateSpecModuleIco()
	end

	table.insert( self.curSpecModuleIcons, freeIcoWnd )

	self:AddChild( freeIcoWnd )

	return freeIcoWnd

end


--
function UI.ShipTooltipWnd:CreateSpecModuleTooltip()

	-- Имя тултипа спецмодуля в тултипе корабля сравнения должно отличаться от того, что в основоном корабле,
	-- потому что при сравнении показываются тултипы спецмодулей для обоих кораблей,
	-- а у родителя  (U.Root) не могут быть чайлды с дублирующимися именами
	local namePostfix = string.format( "%s%d", self.bSecondary and "_sec" or "", #self.allSpecModuleTooltips + 1 )
	
	local tooltipWnd = UI:CreateChildWnd( self, UI.ShipTooltip_SpecModuleTooltipWnd, namePostfix )
	table.insert( self.allSpecModuleTooltips, tooltipWnd )
	return tooltipWnd

end


--
function UI.ShipTooltipWnd:ObtainFreeSpecModuleTooltip( data )

	local freeTooltipWnd = nil

	for idx, tooltipWnd in pairs( self.allSpecModuleTooltips ) do
	
		local bCur = false
		for curIdx, curTooltipInfo in pairs( self.curSpecModuleTooltips ) do
			if tooltipWnd == curTooltipInfo.wnd then
				bCur = true
				break
			end
		end
		
		if not bCur then
			freeTooltipWnd = tooltipWnd
			break
		end
		
	end

	if not freeTooltipWnd then
		freeTooltipWnd = self:CreateSpecModuleTooltip()
	end

	table.insert( self.curSpecModuleTooltips, { wnd = freeTooltipWnd, data = data } )

	return freeTooltipWnd

end


--
function UI.ShipTooltipWnd:PrepareLayoutParams()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local tipsEffect = UI:GetEffectFromLayer( self, self.layers.TIPS_EFFECT )
	local colorsEffect = UI:GetEffectFromLayer( self, self.layers.COLORS_EFFECT )
	local eliteDescEffect = UI:GetEffectFromLayer( self, self.layers.ELITE_DESC_EFFECT )
	local secParamsEffect = UI:GetEffectFromLayer( self, self.layers.SEC_PARAMS_EFFECT )	
	local specModuleIcoWnd = self.allSpecModuleIcons[ 1 ]

	local workEffectPos			= workEffect:GetPos()
	local secParamsEffectPos	= workEffect:GetObjPos( self.effectInfo.work.secParamsLocator )
	local shipIcoPos			= workEffect:GetObjPos( self.effectInfo.work.shipIcoLocator )
	local shipIcoSize			= Vec2( self.shipIcoWnd:GetWidth(), self.shipIcoWnd:GetHeight() )
	local repPos				= workEffect:GetObjPos( self.effectInfo.work.repLocator )
	local repSize				= workEffect:GetObjSize( self.effectInfo.work.repLocator )
	local lockReasonsPos		= workEffect:GetObjPos( self.effectInfo.work.lockReasonsLocator )
	local lockReasonsSize		= workEffect:GetObjSize( self.effectInfo.work.lockReasonsLocator )
	local synergyLevelPos		= workEffect:GetObjPos( self.effectInfo.work.synergyLevelLocator )
	local synergyLevelSize		= workEffect:GetObjSize( self.effectInfo.work.synergyLevelLocator )
	local synergyPbPos			= workEffect:GetObjPos( self.effectInfo.work.synergyPbLocator )
	local firstSlotPos			= workEffect:GetObjPos( self.effectInfo.work.firstSlotLocator )
	local secondSlotPos			= workEffect:GetObjPos( self.effectInfo.work.secondSlotLocator )
	local primParamPos 			= workEffect:GetObjPos( self.effectInfo.work.primParamLocator )
	local secParamCol1Row1Pos	= ( secParamsEffect and secParamsEffect:GetObjPos( self.effectInfo.secParams.secParamCol1Row1Locator ) or Vec2() ) + secParamsEffectPos
	local secParamCol2Row1Pos	= ( secParamsEffect and secParamsEffect:GetObjPos( self.effectInfo.secParams.secParamCol2Row1Locator ) or Vec2() ) + secParamsEffectPos
	local secParamCol1Row2Pos	= ( secParamsEffect and secParamsEffect:GetObjPos( self.effectInfo.secParams.secParamCol1Row2Locator ) or Vec2() ) + secParamsEffectPos
	local deviderPos			= workEffect:GetObjPos( self.effectInfo.work.deviderLocator )
	local descPos				= workEffect:GetObjPos( self.effectInfo.work.descLocator )
	local descSize				= workEffect:GetObjSize( self.effectInfo.work.descLocator )
	local specModuleIcoPos		= workEffect:GetObjPos( self.effectInfo.work.specModuleIcoLocator )
	local specModuleNamePos		= workEffect:GetObjPos( self.effectInfo.work.specModuleNameLocator )
	local specModuleIcoSize		= Vec2( specModuleIcoWnd and specModuleIcoWnd:GetWidth(), specModuleIcoWnd and specModuleIcoWnd:GetHeight() )
	local durPos				= workEffect:GetObjPos( self.effectInfo.work.durLocator )
	local durSize				= workEffect:GetObjSize( self.effectInfo.work.durLocator )
	local repairPricePos		= workEffect:GetObjPos( self.effectInfo.work.repairPriceLocator )
	local repairPriceSize		= workEffect:GetObjSize( self.effectInfo.work.repairPriceLocator )
	local eliteDescEffectPos	= workEffect:GetObjPos( self.effectInfo.work.eliteDescLocator )
	local eliteDescEffectMaxSize= eliteDescEffect and eliteDescEffect:GetObjSize( self.effectInfo.eliteDesc.maxSizeLocator ) or Vec2( 0, 0 )
	local eliteDescEffectMinSize= eliteDescEffect and eliteDescEffect:GetObjSize( self.effectInfo.eliteDesc.minSizeLocator ) or Vec2( 0, 0 )
	local eliteDescTextPos		= eliteDescEffect and eliteDescEffect:GetObjPos( self.effectInfo.eliteDesc.textLocator ) or Vec2( 0, 0 )
	local eliteDescTextSize		= eliteDescEffect and eliteDescEffect:GetObjSize( self.effectInfo.eliteDesc.textLocator ) or Vec2( 0, 0 )
	local shipNamePos			= workEffect:GetObjPos( self.effectInfo.work.shipNameLocator )
	local shipNameSize			= workEffect:GetObjSize( self.effectInfo.work.shipNameLocator )
	local craftInfoPos			= workEffect:GetObjPos( self.effectInfo.work.craftInfoLocator )
	local craftInfoSize			= workEffect:GetObjSize( self.effectInfo.work.craftInfoLocator )
	local shipTypePos			= workEffect:GetObjPos( self.effectInfo.work.shipTypeLocator )
	local shipTypeSize			= workEffect:GetObjSize( self.effectInfo.work.shipTypeLocator )
	local rankPos				= workEffect:GetObjPos( self.effectInfo.work.rankLocator )
	local rankSize				= workEffect:GetObjSize( self.effectInfo.work.rankLocator )

	local secParamWnd = self.allSecParamWnds[ 1 ]
	local secParamSize = Vec2( secParamWnd and secParamWnd:GetWidth() or 0, secParamWnd and secParamWnd:GetHeight() or 0 )

	local primParamWnd = self.allPrimParamWnds[ 1 ]
	local primParamSize = Vec2( primParamWnd and primParamWnd:GetWidth() or 0, primParamWnd and primParamWnd:GetHeight() or 0 )

	local deviderWnd = self.allDeviderWnds[ 1 ]
	local deviderSize = Vec2( deviderWnd and deviderWnd:GetWidth() or 0, deviderWnd and deviderWnd:GetHeight() or 0 )

	local slotWnd = self.allSlotWnds[ 1 ]
	local slotSize = Vec2( slotWnd and slotWnd:GetWidth() or 0, slotWnd and slotWnd:GetHeight() or 0 )	

    self.workMinHeight		= workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ).y
    self.workMaxHeight		= workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ).y

	local NUM_SEPARATORS_IN_EFFECT = 8
	local sepsPoss = {}
	for sepIdx = 1, NUM_SEPARATORS_IN_EFFECT do
		local sepPos = workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.sepLocatorPrefix, sepIdx ) )
		table.insert( sepsPoss, sepPos )		
	end

	self.space_mainInfoBtm_eliteDescEffect		= math.min( eliteDescEffectPos.y - ( shipIcoPos.y + shipIcoSize.y ), eliteDescEffectPos.y - ( lockReasonsPos.y + lockReasonsSize.y ) )
	self.space_eliteDescEffect_sep				= sepsPoss[ 2 ].y - ( eliteDescEffectPos.y + eliteDescEffectMaxSize.y )
	self.space_eliteDescEffectTop_eliteDescText	= eliteDescTextPos.y
	self.space_eliteDescText_eliteDescEffectBtm	= eliteDescEffectMaxSize.y - ( eliteDescTextPos.y + eliteDescTextSize.y )
	self.space_reqRank_lockReasons		= lockReasonsPos.y - ( repPos.y + repSize.y )
	self.space_sep_synergyPb			= synergyPbPos.y - sepsPoss[ 2 ].y
	self.space_sep_synergyLevelTop		= synergyLevelPos.y - sepsPoss[ 2 ].y
    self.space_synergyLevelBtm_sep		= sepsPoss[ 3 ].y - ( synergyLevelPos.y + synergyLevelSize.y )
	self.space_sep_slots				= firstSlotPos.y - sepsPoss[ 3 ].y
    self.space_slots_sep				= sepsPoss[ 4 ].y - ( firstSlotPos.y + slotSize.y )
    self.space_slots					= secondSlotPos.x - ( firstSlotPos.x + slotSize.x )
    self.space_sep_paramsTop			= primParamPos.y - sepsPoss[ 4 ].y
    self.space_paramsBtm_sep			= sepsPoss[ 5 ].y - ( secParamCol1Row2Pos.y + secParamSize.y )
    self.space_paramsRows				= secParamCol1Row2Pos.y - ( secParamCol1Row1Pos.y + secParamSize.y )
    self.space_devider_paramTop			= secParamCol1Row1Pos.y - ( deviderPos.y + deviderSize.y )
    self.space_paramBtm_devider 		= deviderPos.y - ( primParamPos.y + primParamSize.y )
    self.space_sep_descTop				= descPos.y - sepsPoss[ 5 ].y
    self.space_descBtm_sep				= sepsPoss[ 6 ].y - ( descPos.y + descSize.y )
    self.space_sep_specModuleIcoTop		= specModuleIcoPos.y - sepsPoss[ 6 ].y
    self.space_specModuleIcoBtm_sep		= sepsPoss[ 7 ].y - ( specModuleIcoPos.y + specModuleIcoSize.y )
	self.space_specModuleIcons			= specModuleNamePos.x - ( ( specModuleIcoPos.x + specModuleIcoSize.x ) )
    self.space_sep_durTop				= durPos.y - sepsPoss[ 7 ].y
	self.space_durBtm_btm				= self.workMaxHeight - ( durPos.y + durSize.y )
	self.space_sep_repairPriceTop		= repairPricePos.y - sepsPoss[ 7 ].y
	self.space_repairPriceBtm_btm		= self.workMaxHeight - ( repairPricePos.y + repairPriceSize.y )
    self.space_shipName_sep				= sepsPoss[ 1 ].y - ( shipNamePos.y + shipNameSize.y )
    self.space_craftInfo_sep			= sepsPoss[ 8 ].y - ( craftInfoPos.y + craftInfoSize.y )
    self.space_sep_shipType				= shipTypePos.y - sepsPoss[ 8 ].y
    self.space_shipType_rank			= rankPos.y - ( shipTypePos.y + shipTypeSize.y )
    self.space_rank_reqRank				= repPos.y - ( rankPos.y + rankSize.y )
    self.space_sep_shipIco				= shipIcoPos.y - sepsPoss[ 8 ].y

    self.tipsHeight						= tipsEffect and tipsEffect:GetObjSize( "self" ).y or 0
	self.paramsCol1X					= secParamCol1Row1Pos.x + workEffectPos.x
	self.paramsCol2X					= secParamCol2Row1Pos.x + workEffectPos.x
	self.primParamX						= primParamPos.x + workEffectPos.x
	self.deviderX						= deviderPos.x + workEffectPos.x
	self.shipIcoHeight					= shipIcoSize.y
	self.eliteDescEffectMinHeight		= eliteDescEffectMinSize.y
	self.eliteDescEffectMaxHeight		= eliteDescEffectMaxSize.y
	self.specModuleIconsX				= specModuleIcoPos.x + workEffectPos.x
	self.specModuleIcoWidth				= specModuleIcoSize.x
	self.specModuleIcoHeight			= specModuleIcoSize.y

	if colorsEffect then

        self.color_rankFit						= colorsEffect:GetObjColor( self.effectInfo.colors.repFitLocator )
        self.color_rankUnfit					= colorsEffect:GetObjColor( self.effectInfo.colors.repUnfitLocator )
        self.color_durHigh						= colorsEffect:GetObjColor( self.effectInfo.colors.durHighLocator )
        self.color_durLow						= colorsEffect:GetObjColor( self.effectInfo.colors.durLowLocator )
        self.color_durZero						= colorsEffect:GetObjColor( self.effectInfo.colors.durZeroLocator )
        self.color_durInfinite					= colorsEffect:GetObjColor( self.effectInfo.colors.durInfiniteLocator )		
        self.color_durMax 						= colorsEffect:GetObjColor( self.effectInfo.colors.durMaxLocator )
		self.color_eliteDescColorUnlockCredits	= colorsEffect:GetObjColor( self.effectInfo.colors.eliteDescColorUnlockCredits )
		self.color_eliteDescColorLock			= colorsEffect:GetObjColor( self.effectInfo.colors.eliteDescColorLock )

	end

	if eliteDescEffect then
		self.color_eliteDescColorUnlockGold	= eliteDescEffect:GetObjColor( self.effectInfo.eliteDesc.textLocator )
	end

	self:SetLayerWidth( craftInfoSize.x, self.layers.CRAFT_INFO )
	self:SetLayerLeft( shipTypePos.x, self.layers.SHIP_TYPE_TEXT )
	self:SetLayerLeft( rankPos.x, self.layers.RANK )
	self:SetLayerLeft( repPos.x, self.layers.REQUIRED_RANK )
	self:SetLayerWidth( repSize.x, self.layers.REQUIRED_RANK )
	self:SetLayerWidth( lockReasonsSize.x, self.layers.LOCK_REASONS )
	self:SetLayerLeft( lockReasonsPos.x, self.layers.LOCK_REASONS )
	self:SetLayerLeft( synergyLevelPos.x, self.layers.SYNERGY_LEVEL )
	self:SetLayerWidth( descSize.x, self.layers.DESC_PARAMS )
	self:SetLayerWidth( descSize.x, self.layers.DESC_SIMPLE )	
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC_PARAMS )
	self:SetLayerLeft( descPos.x + workEffectPos.x, self.layers.DESC_SIMPLE )
	self:SetLayerLeft( durPos.x + workEffectPos.x, self.layers.DURABILITY )
	self:SetLayerLeft( repairPricePos.x + workEffectPos.x, self.layers.REPAIR_PRICE )
	self:SetLayerLeft( eliteDescEffectPos.x + eliteDescTextPos.x, self.layers.ELITE_DESC )

	self.eliteDescMetaText:SetFormatRectSize( UI:Vec2( eliteDescTextSize.x, 1000000 ), false )
	self.reparPriceMetaText:SetFormatRectSize( UI:Vec2( repairPriceSize.x, repairPriceSize.y ), false )

	local sepPos = UI:Vec2( sepsPoss[ 1 ].x + workEffectPos.x, 0 )
	for sepIdx = 1, self.MAX_SEPARATORS do
		local sepLayer = self.layers.SEPARATOR_1_EFFECT + sepIdx - 1
		local sepEffect = UI:GetEffectFromLayer( self, sepLayer )
		if sepEffect then
			sepEffect:SetPos( sepPos )
		end
	end

	self.shipIcoWnd:SetLeft( shipIcoPos.x )

	local eliteDescEffect = UI:GetEffectFromLayer( self, self.layers.ELITE_DESC_EFFECT )
	if eliteDescEffect then		
		eliteDescEffect:SetPos( UI:Vec2( eliteDescEffectPos.x, 0 ) )
	end

	self.synergyBarWnd:SetLeft( synergyPbPos.x + workEffectPos.x )

	local selfWidth = workEffect:GetObjSize( "self" ).x
	self:SetWidth( selfWidth )	

end    


--
function UI.ShipTooltipWnd:Reset()

    self.defName				= ""
    self.vid					= UI.INVALID_U64_ID
	self.shipInfo				= nil
	self.playerId				= -1
	self.playerUid				= UI.INVALID_U64_ID
	self.compareVid				= UI.INVALID_U64_ID
	self.logEvent				= -1
	self.craftedSpecModule		= ""
	self.craftedBonuses			= nil
	self.craftedModuleSlotsMask	= nil
	self.chosenNodesMask		= nil
	self.bWithTalents			= false

	self.baseMode 				= -1
	self.mode					= -1
	self.bEmphasizeBuffs		= false

	self:ResetContent()

end


--
function UI.ShipTooltipWnd:ResetContent()

	self:SetLayerVisible( false, self.layers.TIPS_EFFECT )
	for tipIdx = 1, self.MAX_TIPS do
		self:SetLayerVisible( false, self.layers.TIP_1 + tipIdx - 1 )
	end

	self:SetText( "", self.layers.SHIP_NAME )
	self:SetLayerVisible( false, self.layers.CRAFT_INFO )
	self:SetText( "", self.layers.SHIP_TYPE_TEXT )
	self:SetLayerVisible( false, self.layers.REQUIRED_RANK )
	self:SetLayerVisible( false, self.layers.LOCK_REASONS )
	self:SetLayerVisible( false, self.layers.SYNERGY_LEVEL )
	self:SetLayerVisible( false, self.layers.DESC_PARAMS )
	self:SetLayerVisible( false, self.layers.DESC_SIMPLE )
	self:SetText( "", self.layers.DURABILITY )
	self:SetLayerVisible( false, self.layers.ELITE_DESC_EFFECT )

	self.synergyBarWnd:Reset()
	self.synergyBarWnd:UnlinkFromParent()

	for sepIdx = 1, self.MAX_SEPARATORS do
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT + sepIdx - 1 )
	end
	
	self.eliteDescMetaText:SetText( "", true )
	self.reparPriceMetaText:SetText( "", true )

	self.shipIcoWnd:Reset()

	self:ResetParams()
	self:ResetSlots()
	self:ResetSpecModuleIcons()
	self:ResetSpecModuleTooltips()

	self:HideCompareTooltip()

end


--
function UI.ShipTooltipWnd:ResetParams()

	for idx, paramWnd in pairs( self.curParamWnds ) do

		if paramWnd.Reset then
			paramWnd:Reset()
		end

		paramWnd:UnlinkFromParent()

	end

	self.curParamWnds = {}

end


--
function UI.ShipTooltipWnd:ResetSlots()

	for idx, slotWnd in pairs( self.curSlotWnds ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end
	self.curSlotWnds = {}

end


--
function UI.ShipTooltipWnd:ResetSpecModuleIcons()

	for idx, icoWnd in pairs( self.curSpecModuleIcons ) do
		icoWnd:Reset()
		icoWnd:UnlinkFromParent()
	end
	self.curSpecModuleIcons = {}

end


--
function UI.ShipTooltipWnd:ResetSpecModuleTooltips()

	for idx, tooltipInfo in pairs( self.curSpecModuleTooltips ) do
		tooltipInfo.wnd:Reset()
		tooltipInfo.wnd:UnlinkFromParent()
	end
	self.curSpecModuleTooltips = {}

end


--
function UI.ShipTooltipWnd:UpdateForMode()

	self:ResetContent()

	self:UpdateShipName()
	self:UpdateCraftInfo()
	self:UpdateShipIco()
	self:UpdateShipTypeText()
	self:UpdateRank()
	self:UpdateRequiredRank()
	self:UpdateLockReasons()
	self:UpdateEliteDesc()
	self:UpdateSynergy()
	self:UpdateSlots()
	self:UpdateParams()
	self:UpdateDescParams()
	self:UpdateDescSimple()
	self:UpdateSpecModules()
	self:UpdateDurability()
	self:UpdateRepairPrice()
	self:UpdateTips()
	self:UpdateCompareTooltip()

	self:RecalcLayout()

end


--
function UI.ShipTooltipWnd:UpdateShipName()

	local name = UI:GetEntityLocalizedNameByDef( self.defName, true, nil, nil, nil )
	self:SetText( name, self.layers.SHIP_NAME )

end


--
function UI.ShipTooltipWnd:UpdateCraftInfo()

	local strCraftInfo = ""

	local bBought = false

	if UI:IsShipEvolving( self.defName ) then	
		bBought = UI:GetEvolvingShipItem( self.defName ) ~= nil
	else
		bBought = UI:GetShipItemByDef( self.defName, false ) ~= nil
	end

	if not bBought then

    	local def = UI:GetDef( self.defName )
    	if def then

    		if def.uiWhere ~= nil then

    			if type( def.uiWhere ) == "string" then
    				strCraftInfo = UI:GetStringByName( def.uiWhere )
    			else
    				sys.log( "UI.ShipTooltipWnd:UpdateCraftInfo()[ERROR]: invalid type of _G.Def[\"%s\"].uiWhere; \"string\" or \"nil\" expected, got \"%s\"", self.defName, type( def.uiWhere ) )
    			end

    		end

    	else
    		sys.log( "UI.ShipTooltipWnd:UpdateCraftInfo()[ERROR]: cannot find _G.Def[\"%s\"]", self.defName )
    	end

	end

	if strCraftInfo ~= "" then
		self:SetText( strCraftInfo, self.layers.CRAFT_INFO )
		self:SetLayerVisible( true, self.layers.CRAFT_INFO )
	else
		self:SetLayerVisible( false, self.layers.CRAFT_INFO )
	end

end


--
function UI.ShipTooltipWnd:UpdateShipIco()

	local icoData =
	{
        vid			= self.vid,
        shipInfo	= self.shipInfo,
        playerId	= self.playerId,
        playerUid	= self.playerUid,
	}

	self.shipIcoWnd:Setup( self.defName, icoData )

	self.shipIcoWnd:HideShipName()
	self.shipIcoWnd:AnimateBgNoFrame()

	if UI:IsShipPremium( self.defName ) then
		self.shipIcoWnd:ShowGoldFrame()
	end

end


--
function UI.ShipTooltipWnd:UpdateShipTypeText()

	local text = UI:GetStringByName( "shipTooltip_shipTypeAndRole" )

	local strShipType = ""

	local shipType = UI:GetItemShipType( self.defName ) or -1
	if shipType ~= -1 then
		strShipType = UI:ShipType2Str( shipType )
	else
		sys.log( "UI.ShipTooltipWnd:UpdateShipTypeText()[ERROR]: cannot find _G.Def[%s].ship_class", self.defName )
	end

	local strRole = ""
	
	local def = UI:GetDef( self.defName )
	local role = def and def.role or -1

	if role ~= -1 then
		strRole = UI:Role2Str( role )
	else
		sys.log( "UI.ShipTooltipWnd:UpdateShipTypeText()[ERROR]: cannot find _G.Def[%s].role", self.defName )
	end

	local subst =
	{
		class	= strShipType,
		role	= strRole,
	}

	text = string.gsub( text, "%$(.-)%$", subst )

	self:SetText( text, self.layers.SHIP_TYPE_TEXT )

end


--
function UI.ShipTooltipWnd:UpdateRank()

	local rank = UI:GetShipRank( self.defName )

	local str = UI:GetStringByName( "shipTooltip_rank" )
	str = string.gsub( str, "%$rank%$", tostring( rank ) )

	self:SetText( str, self.layers.RANK )

end


--
function UI.ShipTooltipWnd:UpdateRequiredRank()

	self:SetLayerVisible( false, self.layers.REQUIRED_RANK )

	local needRank		= UI:GetItemRequiredAccountRank( self.defName )
	local playerRank	= UI:GetPlayerAccountRank()

	local bEnoughRank = true
	if _G.GetCurrentGameMode() == 0 then
		bEnoughRank = needRank <= playerRank
	end

	if bEnoughRank then
		return
	end

	self:SetLayerVisible( true, self.layers.REQUIRED_RANK )

	local numSubst = 0
	local str, numSubst = string.gsub( UI:GetStringByName( "shipTooltip_rankRequired" ), "%$rank%$", tostring( needRank ) )

	if numSubst == 0 then
		sys.log( "UI.ShipTooltipWnd:UpdateRequiredRank()[ERROR]: cannot find placeholder \"$rank$\" in string \"shipTooltip_rankRequired\"" )
		str = string.format( "[INVALID STRING] Rank required: %d", needRank )
	end

	str = string.format( "%s%s", UI:Color2Str( self.color_rankUnfit ), str  )

	self:SetText( str, self.layers.REQUIRED_RANK )

end


--
function UI.ShipTooltipWnd:UpdateLockReasons()

	local str = ""
	
	-- залочено потому что не открыт предыдущий корабль
	if UI:IsShipLockedByDependancy( self.defName ) then
		local strLockedByDependancy = UI:IsShipEvolving( self.defName ) and UI:GetStringByName( "ships_tooltip_lockedByDependancy_byRank" ) or UI:GetStringByName( "ships_tooltip_lockedByDependancy" )
		str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strLockedByDependancy )
	end
	
	-- SC-111975 залочено, потому что неподходящее время (некоторые корабли доступны только в определенные даты)
	if UI:IsShipDisabledByTime( self.defName ) then
		local strLockedByTime = UI:GetShipDisabledByTimeString( self.defName )
		str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strLockedByTime )
	end
	
	
	if str ~= "" then
		self:SetLayerVisible( true, self.layers.LOCK_REASONS )
		self:SetText( str, self.layers.LOCK_REASONS )
	end

end


--
function UI.ShipTooltipWnd:UpdateEliteDesc()

	local bPremium = UI:IsShipPremium( self.defName )
	local bElite = self:IsEliteShip()

	-- видимость фона

	self:SetLayerVisible( bPremium, self.layers.ELITE_DESC_EFFECT )


	-- текст

	local strEliteDesc = ""

	local strFreeRepair = ""
	local strFreeSynergy = ""

	local strLockIco = "$effect [effectName shipTooltip_lock]$"

	-- строка о бесплатном ремонте - только для премиума

	if bPremium then
		strFreeRepair = UI:GetStringByName( "shipTooltip_goldDesc" )
		strFreeRepair = string.format( "%s%s", UI:Color2Str( self.color_eliteDescColorUnlockGold ), strFreeRepair )
	end

	strEliteDesc = string.format( "%s%s%s", strEliteDesc, strEliteDesc ~= "" and "|" or "",  strFreeRepair )


	-- строка о свободной синергии

	local freeSynergy = 0

	if bPremium then
		if type( _G.ShipGeneratedFreeSynergyPremium ) == "number" then
			freeSynergy = _G.ShipGeneratedFreeSynergyPremium
		else
			sys.log( "UI.ShipTooltipWnd:UpdateEliteDesc()[ERROR]: invalid type of the _G.ShipGeneratedFreeSynergyPremium; \"number\" expected, got \"%s\"", type( _G.ShipGeneratedFreeSynergyPremium ) )
		end
	else
		if type( _G.ShipGeneratedFreeSynergy ) == "number" then
			freeSynergy = _G.ShipGeneratedFreeSynergy
		else
			sys.log( "UI.ShipTooltipWnd:UpdateEliteDesc()[ERROR]: invalid type of the _G.ShipGeneratedFreeSynergy; \"number\" expected, got \"%s\"", type( _G.ShipGeneratedFreeSynergy ) )
		end
	end

	strFreeSynergy = UI:GetStringByName( "shipTooltip_generateFreeSynergy" )
	strFreeSynergy = string.gsub( strFreeSynergy, "%$synergy%$", tostring( freeSynergy ) )

	local colorFreeSynergy = UI.WHITE_COLOR

	local bAllowFreeSynergy = true

	if bAllowFreeSynergy then
		colorFreeSynergy = bPremium and self.color_eliteDescColorUnlockGold or self.color_eliteDescColorUnlockCredits
	else
		colorFreeSynergy = self.color_eliteDescColorLock
	end

	strFreeSynergy = string.format( "%s%s%s", bAllowFreeSynergy and "" or strLockIco, UI:Color2Str( colorFreeSynergy ), strFreeSynergy )

	strEliteDesc = string.format( "%s%s%s", strEliteDesc, strEliteDesc ~= "" and "|" or "",  strFreeSynergy )


	-- строка о всей синергии

	if bElite then

		local strSynergy = UI:GetStringByName( "shipTooltip_synergyBonus" )
		strEliteDesc = string.format( "%s%s%s", strEliteDesc, strEliteDesc ~= "" and "|" or "", strSynergy )

	end


	-- всё вместе

	self.eliteDescMetaText:SetText( strEliteDesc, true )

end


--
function UI.ShipTooltipWnd:UpdateSynergy()

	if UI:IsShipEvolving( self.defName ) then
		return
	end

	self:SetLayerVisible( true, self.layers.SYNERGY_LEVEL )
	self:AddChild( self.synergyBarWnd )

	local curLevel, maxLevel = self:GetSynergy()

	-- текст

	local strLevelLabel = UI:GetStringByName( "shipTooltip_synergyLevel" )
	local strLevel = string.format( "%s: %d/%d", strLevelLabel, curLevel, maxLevel )
	self:SetText( strLevel, self.layers.SYNERGY_LEVEL )

	-- прогрессбар

	self.synergyBarWnd:Setup( curLevel, maxLevel )

end


--
function UI.ShipTooltipWnd:GetSynergy()

	local defaultLevel = UI:GetShipDefaultLevel( self.defName )
	local maxLevel = UI:GetShipMaxLevel( self.defName )

	local curLevel = defaultLevel

	if self:IsWithBuffs() then

    	if self.shipInfo then
    		curLevel = self.shipInfo.level or 0

    	elseif self.vid ~= UI.INVALID_U64_ID then
    		curLevel = UI:GetShipLevel( UI:GetShipItem( self.vid, true ) )
    	end

	end

	return curLevel, maxLevel

end


--
function UI.ShipTooltipWnd:UpdateSlots()

	if self.mode ~= UI.shipTooltipModes.FULL then
		return
	end


	-- модули

	local evolvingChosenSlotsMask = u64( 0 )
	if UI:IsShipEvolving( self.defName ) and self.chosenNodesMask ~= nil then

		evolvingChosenSlotsMask = UI:GetEvolvingShipSlotsFromNodesMask( self.defName, self.chosenNodesMask )
		local defaultSlotsMask = UI:GetEvolvingShipDefaultSlotsMask( self.defName )

		evolvingChosenSlotsMask = UI:BitBorU64( defaultSlotsMask, evolvingChosenSlotsMask )

	end

	local numSlotsByType = {}

	for moduleSlotName, moduleSlotId in pairs( ai.SpaceShipModuleSlot ) do

		local slotType = self.moduleSlot2SlotType[ moduleSlotName ]
		if slotType then

			local bHasSlot = false
			local bNeedCraft = false

			if UI:IsShipEvolving( self.defName ) and self.chosenNodesMask ~= nil then

				bHasSlot = UI:BitTstU64( evolvingChosenSlotsMask, moduleSlotId )				

			else

    			if self.vid ~= UI.INVALID_U64_ID then
    				bHasSlot = UI:HasShipModuleSlot( UI:GetShipItem( self.vid, true ), moduleSlotId )			

    			elseif self.shipInfo then
    				bHasSlot = UI:HasShipModuleSlotByShipInfo( self.shipInfo, moduleSlotId )

    			else

    				if UI:IsShipCraftable( self.defName ) and ( slotType >= self.slotTypes.ENGINE_MOD and slotType <= self.slotTypes.CPU_MOD ) then

    					if self.craftedModuleSlotsMask ~= nil then
    						bHasSlot = UI:BitTst( self.craftedModuleSlotsMask, moduleSlotId )
    					else
    						local slotsMask = UI:GetShipAllPossibleSlotsMask( self.defName )
    						bHasSlot = UI:BitTstU64( slotsMask, moduleSlotId )
    						bNeedCraft = true
    					end

					elseif UI:IsShipEvolving( self.defName ) then

						local defaultSlotsMask = UI:GetEvolvingShipDefaultSlotsMask( self.defName )
						bHasSlot = UI:BitTstU64( defaultSlotsMask, moduleSlotId )

    				else

    					local slotsMask = UI:GetShipAllPossibleSlotsMask( self.defName )
    					bHasSlot = UI:BitTstU64( slotsMask, moduleSlotId )

    				end

    			end

			end

			if bHasSlot then

				if bNeedCraft then
					numSlotsByType[ slotType ] = -1

				else
        			if not numSlotsByType[ slotType ] then
        				numSlotsByType[ slotType ] = 1
        			else
        				numSlotsByType[ slotType ] = numSlotsByType[ slotType ] + 1
        			end
				end

			end

		end

	end  

	for slotType, numSlots in pairs( numSlotsByType ) do

		local slotWnd = self:ObtainFreeSlotWnd()
		slotWnd:Setup( slotType, numSlots )

	end


	-- аммуниция

	for ammoName, ammoSlotId in pairs( ai.MunitionBayType ) do
		if ammoSlotId ~= ai.MunitionBayType.MBT_NUM then

			local slotType = self.ammoType2SlotType[ ammoName ]
			if slotType then

				local slotWnd = self:ObtainFreeSlotWnd()
				slotWnd:Setup( slotType, 1 )

			end			
		end
	end


	-- сортировка

	local fnSort = function( slotWnd1, slotWnd2 )

		local slotType1 = slotWnd1:GetSlotType()
		local slotType2 = slotWnd2:GetSlotType()

		return slotType1 < slotType2

	end

	table.sort( self.curSlotWnds, fnSort )

end


--
function UI.ShipTooltipWnd:UpdateParams()

	local shipParamsData = self:GetShipParamsData()
	local compareShipParamsData = self:GetCompareShipParamsData()

	local tooltipParams = {}

	if self.mode == UI.shipTooltipModes.BRIEF then
		tooltipParams = UI:GetShipTooltipBriefParams( self.defName )

	elseif self.mode == UI.shipTooltipModes.FULL then
		tooltipParams = UI:GetShipTooltipFullParams( self.defName )

	else
		sys.log( "UI.ShipTooltipWnd:UpdateParams()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end

	if next( tooltipParams ) then

    	for paramIdx = 1, #tooltipParams do

    		local paramInfo = tooltipParams[ paramIdx ]
    		local paramWnd = nil

    		if paramInfo.separator then
    			paramWnd = self:ObtainFreeDeviderWnd()

			else

				-- #0060383 - не показываются параметры, для которых нет значений
				local vals = UI:GetParamVals( shipParamsData.defName, paramInfo, shipParamsData.dataType, shipParamsData.data, false )

				if next( vals ) then

            		if paramInfo.large then
            			paramWnd = self:ObtainFreePrimParamWnd()
            			paramWnd:Setup( self.defName, paramInfo, shipParamsData, compareShipParamsData, tooltipParams )

            		else
            			paramWnd = self:ObtainFreeSecParamWnd()
            			paramWnd:Setup( self.defName, paramInfo, shipParamsData, compareShipParamsData, tooltipParams )
            		end

				end

			end

    	end		

	end

end



--
function UI.ShipTooltipWnd:UpdateDescParams()

	self:SetLayerVisible( false, self.layers.DESC_PARAMS )

	if self.defName == "" then
		return
	end

	local shipParamsData = self:GetShipParamsData()

	local craftedBonuses = nil

    if self.shipInfo then
		craftedBonuses = self.shipInfo.specialGrades
	end

	if self.craftedBonuses then
		self.craftedBonuses = craftedBonuses
	end	

	local desc = UI:GetShipDescEx( shipParamsData, self.color_descSubst, self:GetColor( self.layers.DESC_PARAMS ), craftedBonuses )

	if desc ~= "" then
		self:SetLayerVisible( true, self.layers.DESC_PARAMS )
		self:SetText( desc, self.layers.DESC_PARAMS )
	end

end  


--
function UI.ShipTooltipWnd:UpdateDescSimple()

	self:SetLayerVisible( false, self.layers.DESC_SIMPLE )

	if self.mode ~= UI.shipTooltipModes.BRIEF then
		return
	end

	if self.defName == "" then
		return
	end

    local desc = UI:GetShipDescSimple( self.defName )

	if desc ~= "" then
		self:SetLayerVisible( true, self.layers.DESC_SIMPLE )
		self:SetText( desc, self.layers.DESC_SIMPLE )
	end

end


--
function UI.ShipTooltipWnd:UpdateSpecModules()

	local curSpecModuleDefName	= ""
	local bCurSpecModuleHandled	= false

	if UI:IsShipCraftable( self.defName ) then

		if self.craftedSpecModule ~= "" then
			curSpecModuleDefName = self.craftedSpecModule
			bCurSpecModuleHandled = true
		end

	elseif UI:IsShipEvolving( self.defName ) then

		if self.chosenNodesMask ~= nil then

			curSpecModuleDefName = UI:GetEvolvingShipSpecModuleFromNodesMask( self.defName, self.chosenNodesMask )

			if curSpecModuleDefName == "" then
				curSpecModuleDefName = UI:GetShipDefaultSpecModule( self.defName )
			end

			bCurSpecModuleHandled = true

		end

	end

	if not bCurSpecModuleHandled then

    	if self.vid ~= UI.INVALID_U64_ID then
    		curSpecModuleDefName = UI:GetShipSpecModule( UI:GetShipItem( self.vid, true ) )

    	elseif self.shipInfo then

    		local varName = string.format( "module%d", ai.SpaceShipModuleSlot.SPECIAL )
    		curSpecModuleDefName = self.shipInfo[ varName ]

    		if type( curSpecModuleDefName ) ~= "string" then
    			sys.log( "UI.ShipTooltipWnd:UpdateSpecModules()[ERROR]: cannot find spec module for ship %s", self.defName )
    			curSpecModuleDefName = ""
    		end

    	else
    		curSpecModuleDefName = UI:GetShipDefaultSpecModule( self.defName )
    	end

	end


	local specModules = {}

	if UI:IsShipCraftable( self.defName ) or UI:IsShipEvolving( self.defName ) then

		if curSpecModuleDefName ~= "" then
			table.insert( specModules, curSpecModuleDefName )
		end

	else

    	local defaultSpecModule = UI:GetShipDefaultSpecModule( self.defName )
		if defaultSpecModule ~= "" then
    		table.insert( specModules, defaultSpecModule )
		end

    	local customizableSpecModules = UI:GetShipCustomizableSpecModules( self.defName )
    	for level, specModuleInfo in ipairs( customizableSpecModules ) do
    		table.insert( specModules, specModuleInfo.defName )
    	end

		local bCurSpecModuleFound = false
		for idx, defName in pairs( specModules ) do
			if defName == curSpecModuleDefName then
				bCurSpecModuleFound = true
				break
			end
		end

		if not bCurSpecModuleFound then
			sys.log( "UI.ShipTooltipWnd:UpdateSpecModules()[ERROR]: current specmodule %s on ship %s is neither default nor customizable via budget", curSpecModuleDefName, self.defName )
		end

	end

	if not next( specModules ) then
		sys.log( "UI.ShipTooltipWnd:UpdateSpecModules()[ERROR]: no specmodules for ship %s", self.defName )
		return
	end


	-- иконки

	for idx, specModuleDefName in ipairs( specModules ) do

		local icoWnd = self:ObtainFreeSpecModuleIco()

    	icoWnd:AnimateIcoIdle()
    	icoWnd:SetupForItem( specModuleDefName )

	end


	-- тултипы

	for idx, specModuleDefName in ipairs( specModules ) do

    	local specModuleTooltipData =
    	{
    		tooltipType		= UI.tooltipTypes.MODULE,
    		defName			= specModuleDefName,
    		dstShipData		= nil,
    	}	

    	if self.vid ~= UI.INVALID_U64_ID then
    		specModuleTooltipData.dstShipData	= UI.ModuleTooltipWnd.ShipData:CreateForVid( self.vid, ai.SpaceShipModuleSlot.SPECIAL, self.chosenNodesMask )

    	elseif self.shipInfo then
    		specModuleTooltipData.dstShipData	= UI.ModuleTooltipWnd.ShipData:CreateForShipInfo( self.shipInfo, self.playerId, ai.SpaceShipModuleSlot.SPECIAL )

    	else
    		specModuleTooltipData.dstShipData	= UI.ModuleTooltipWnd.ShipData:CreateForDef( self.defName, ai.SpaceShipModuleSlot.SPECIAL )
    	end

    	self:ObtainFreeSpecModuleTooltip( specModuleTooltipData )

	end

end


--
function UI.ShipTooltipWnd:UpdateDurability()

	local maxDur	= 1
	local dur		= maxDur

	if self.shipInfo then
		dur = self.shipInfo.hullCondition or 0
	elseif self.vid ~= UI.INVALID_U64_ID then
		dur = _G.GameStore_GetVesselHullCondition( self.vid )
	end	

	maxDur	= UI:Clamp( UI:Round( maxDur * 100 ), 0, 100 )
	dur		= UI:Clamp( UI:Round( dur * 100 ), 0, 100 )

	if dur > maxDur then
		dur = maxDur
	end

	local curValColor = self.color_durHigh

	if dur == 0 then
		curValColor = self.color_durZero
	elseif dur <= maxDur * UI.LOW_DURABILITY_THRESHOLD then
		curValColor = self.color_durLow
	end

	local strLabel = UI:GetStringByName( "itemTooltip_durability" )
	local strVal = string.format( "%s%d%s/%d", UI:Color2Str( curValColor ), dur, UI:Color2Str( self.color_durMax ), maxDur )
	
	local str = string.format( "%s: %s", strLabel, strVal )
	self:SetText( str, self.layers.DURABILITY )

end


--
function UI.ShipTooltipWnd:UpdateRepairPrice()

	local price	= UI:GetShipFullRepairPrice( self.defName )
	
	local priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
		val			= price,
		bIsBuyPrice	= true,
		basePrice	= price,
	}

	local strLabel = UI:GetStringByName( "itemTooltip_repairPrice" )
	local strVal = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.REPAIR_PRICE ), true, true, false, nil )
	
	local str = string.format( "%s: %s", strLabel, strVal )
	self.reparPriceMetaText:SetText( str, true )

end


--
function UI.ShipTooltipWnd:UpdateCompareTooltip()

	if self.bSecondary then
		return
	end

	if self.compareVid == UI.INVALID_U64_ID then
		return
	end

	local compareShipItem = UI:GetShipItem( self.compareVid )
	if not compareShipItem then
		return
	end

	local compareTooltipData =
	{
		tooltipType	= UI.tooltipTypes.SHIP,
		defName		= compareShipItem.defName,
		vid			= ( self.vid ~= UI.INVALID_U64_ID or self.shipInfo ) and self.compareVid or UI.INVALID_U64_ID,
		mode		= self.mode,
	}	

	self.compareTooltipWnd:Setup( compareTooltipData )

end


--
function UI.ShipTooltipWnd:UpdateTips()

	if self.bSecondary then
		return
	end

	local bHasTips = false

	if self:IsWithBuffs() then
		self:SetupTip( 1, self.tipTypes.EMPHASIZE_BUFFS )
		bHasTips = true
	end

	if next( self.curSpecModuleIcons ) then
		self:SetupTip( 2, self.tipTypes.SPEC_MODULE )
		bHasTips = true
	end

	if self.compareVid ~= UI.INVALID_U64_ID then
		self:SetupTip( 3, self.tipTypes.COMPARE )
		bHasTips = true
	end

	if bHasTips then
		self:SetLayerVisible( true, self.layers.TIPS_EFFECT )
	end

end


--
function UI.ShipTooltipWnd:SetupTip( tipIdx, tipType )

	if tipIdx > self.MAX_TIPS then
		sys.log( "UI.ShipTooltipWnd:SetupTip()[ERROR]: cannot show tip %d; max tips is %d", tipIdx, self.MAX_TIPS )
		return
	end

	local tipTypeName = UI:Val2Key( self.tipTypes, tipType )
	local strId = string.format( "shipTooltip_action_%s", tipTypeName )
	local tipText = UI:GetStringForPlatform( strId )

	local tipLayer = self.layers.TIP_1 + tipIdx - 1 

	self:SetLayerVisible( true, tipLayer )
	self:SetText( tipText, tipLayer )	

end


--
function UI.ShipTooltipWnd:RecalcLayout()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local lastBlockY1 = self:GetLayerTop( self.layers.SHIP_NAME ) + self:GetLayerHeight( self.layers.SHIP_NAME ) + self.space_shipName_sep
	local nextSepIdx = 1

	-- информация для некоторых крафтовых кораблей (размер)

	if self:IsLayerVisible( self.layers.CRAFT_INFO ) then

		self:ShowSeparator( nextSepIdx, lastBlockY1 )
		nextSepIdx = nextSepIdx + 1

    	local craftInfoFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.CRAFT_INFO ), 1000000 )

        local craftInfoHeight = _G.MeasureText(
       		self:GetText( self.layers.CRAFT_INFO ),
       		self:GetFont( self.layers.CRAFT_INFO ),
        	craftInfoFormatRect,
       		self:GetTextFormatFlags( self.layers.CRAFT_INFO ),
        	craftInfoFormatRect ).w

		self:SetLayerHeight( craftInfoHeight, self.layers.CRAFT_INFO )

		lastBlockY1 = self:GetLayerTop( self.layers.CRAFT_INFO ) + craftInfoHeight + self.space_craftInfo_sep

	end

	-- текстовый блок справа от иконки: тип корабля, ранг, репутация, залоченность

	local mainTextY1 = lastBlockY1 + self.space_sep_shipType

	-- тип корабля (позиция)

	self:ShowSeparator( nextSepIdx, lastBlockY1 )
	nextSepIdx = nextSepIdx + 1

	local shipTypeY = mainTextY1
	self:SetLayerTop( shipTypeY, self.layers.SHIP_TYPE_TEXT )

	mainTextY1 = shipTypeY + self:GetLayerHeight( self.layers.SHIP_TYPE_TEXT )

	-- ранг (позиция)

	local rankY = mainTextY1 + self.space_shipType_rank
	self:SetLayerTop( rankY, self.layers.RANK )

	mainTextY1 = rankY + self:GetLayerHeight( self.layers.RANK )

	-- требуемый аккаунт-ранг (позиция, размер)

	if self:IsLayerVisible( self.layers.REQUIRED_RANK ) then

		local reqRankY = mainTextY1 + self.space_rank_reqRank
		self:SetLayerTop( reqRankY, self.layers.REQUIRED_RANK )

    	local reqRankFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.REQUIRED_RANK ), 100000 )

        local reqRankHeight = _G.MeasureText(
       		self:GetText( self.layers.REQUIRED_RANK ),
       		self:GetFont( self.layers.REQUIRED_RANK ),
        	reqRankFormatRect,
       		self:GetTextFormatFlags( self.layers.REQUIRED_RANK ),
        	reqRankFormatRect ).w

		self:SetLayerHeight( reqRankHeight, self.layers.REQUIRED_RANK )

    	mainTextY1 = reqRankY + reqRankHeight

	end

	-- залоченность (позиция, размер)

	if self:IsLayerVisible( self.layers.LOCK_REASONS ) then

		local lockReasonsY0 = mainTextY1 + self.space_reqRank_lockReasons
		self:SetLayerTop( lockReasonsY0, self.layers.LOCK_REASONS )

		local lockReasonsFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.LOCK_REASONS ), 100000 )

		local lockReasonsHeight = _G.MeasureText(
       		self:GetText( self.layers.LOCK_REASONS ),
       		self:GetFont( self.layers.LOCK_REASONS ),
        	lockReasonsFormatRect,
       		self:GetTextFormatFlags( self.layers.LOCK_REASONS ),
        	lockReasonsFormatRect ).w

		self:SetLayerHeight( lockReasonsHeight, self.layers.LOCK_REASONS )

		mainTextY1 = lockReasonsY0 + lockReasonsHeight

	end


	-- иконка корабля (позиция)

	local mainInfoY1 = mainTextY1

	local shipIcoY = lastBlockY1 + self.space_sep_shipIco
	self.shipIcoWnd:SetTop( shipIcoY  )

	mainInfoY1 = math.max( mainTextY1, shipIcoY + self.shipIcoHeight )


	-- текст бонусов (позиция, размер)

	if self:IsLayerVisible( self.layers.ELITE_DESC ) then

    	local eliteDescText			= self.eliteDescMetaText:GetFormattedText()
    	local eliteDescFormatParams	= self.eliteDescMetaText:GetFormatParams()
    	local eliteDescFormatRect	= UI:Quat( 0, 0, eliteDescFormatParams.formatRectSize.x, eliteDescFormatParams.formatRectSize.y )

    	local eliteDescTextHeight = _G.MeasureText(
       		eliteDescText,
       		eliteDescFormatParams.hFont,
        	eliteDescFormatRect,
       		eliteDescFormatParams.formatFlags,
        	eliteDescFormatRect ).w		

    	local eliteDescTextY =
			self:IsLayerVisible( self.layers.ELITE_DESC_EFFECT )
				and mainInfoY1 + self.space_mainInfoBtm_eliteDescEffect + self.space_eliteDescEffectTop_eliteDescText
				or mainInfoY1 + self.space_mainInfoBtm_eliteDescEffect

		self:SetLayerTop( eliteDescTextY, self.layers.ELITE_DESC )


		-- фон бонусов (позиция, размер)

		if self:IsLayerVisible( self.layers.ELITE_DESC_EFFECT ) then

			local eliteDescEffect = UI:GetEffectFromLayer( self, self.layers.ELITE_DESC_EFFECT )

    		local eliteDescEffectY = eliteDescTextY - self.space_eliteDescEffectTop_eliteDescText

    		local eliteDescEffectPos = eliteDescEffect:GetPos()
    		eliteDescEffectPos.y = eliteDescEffectY
    		eliteDescEffect:SetPos( eliteDescEffectPos )

			local eliteDescEffectHeight = self.space_eliteDescEffectTop_eliteDescText + eliteDescTextHeight + self.space_eliteDescText_eliteDescEffectBtm
			eliteDescEffectHeight = UI:Clamp( eliteDescEffectHeight, self.eliteDescEffectMinHeight, self.eliteDescEffectMaxHeight )

			local animTime = ( eliteDescEffectHeight - self.eliteDescEffectMinHeight ) / ( self.eliteDescEffectMaxHeight - self.eliteDescEffectMinHeight )
			eliteDescEffect:SetAnimationTimeAndUpdate( animTime )

    		mainInfoY1 = eliteDescEffectY + eliteDescEffectHeight 

		else

			mainInfoY1 = eliteDescTextY + eliteDescTextHeight

		end

		lastBlockY1 = mainInfoY1 + self.space_eliteDescEffect_sep

	end

	-- синегрия (позиция) и слоты модулей/аммуниции (позиция)

	if self:IsLayerVisible( self.layers.SYNERGY_LEVEL ) and self.synergyBarWnd:IsChildOf( self ) then

    	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
    	nextSepIdx = nextSepIdx + 1

    	-- синегрия - текст

    	local synergyLevelY0 = lastBlockY1 + self.space_sep_synergyLevelTop
    	self:SetLayerTop( synergyLevelY0, self.layers.SYNERGY_LEVEL )

    	-- синергия - прогрессбар

    	local synergyPbY0 = lastBlockY1 + self.space_sep_synergyPb 
    	self.synergyBarWnd:SetTop( synergyPbY0 )

    	local synergyLevelY1 = synergyLevelY0 + self:GetLayerHeight( self.layers.SYNERGY_LEVEL )
    	lastBlockY1 = synergyLevelY1 + self.space_synergyLevelBtm_sep

	end

	-- слоты

	local numSlots = #self.curSlotWnds
	if numSlots > 0 then

		if not self:IsLayerVisible( self.layers.SYNERGY_LEVEL ) or not self.synergyBarWnd:IsChildOf( self ) then
    		self:ShowSeparator( nextSepIdx, lastBlockY1 )		
    		nextSepIdx = nextSepIdx + 1
		end

		local firstSlotWnd = self.curSlotWnds[ 1 ]
		local slotSize = UI:Vec2( firstSlotWnd:GetWidth(), firstSlotWnd:GetHeight() )

		local slotsWidthTotal = numSlots * slotSize.x + ( numSlots - 1 ) * self.space_slots
		local selfWidth = self:GetWidth()

		local firstSlotX = ( selfWidth - slotsWidthTotal ) / 2
		local slotsY = lastBlockY1 + self.space_sep_slots

		for slotIdx, slotWnd in pairs( self.curSlotWnds ) do

			local x = firstSlotX + ( slotIdx - 1 ) * ( slotSize.x + self.space_slots )
			slotWnd:SetLeft( x )
			slotWnd:SetTop( slotsY )

		end

		lastBlockY1 = slotsY + slotSize.y + self.space_slots_sep

	end	


	-- параметры (позиции)

	if next( self.curParamWnds ) then

		local MAX_COLS = 2

		self:ShowSeparator( nextSepIdx, lastBlockY1 )		
		nextSepIdx = nextSepIdx + 1

		local col = 1
		local prevRowY1 = lastBlockY1 + self.space_sep_paramsTop
		local rowY0 = prevRowY1

		for paramIdx = 1, #self.curParamWnds do
	
			local paramWnd = self.curParamWnds[ paramIdx ]
			local prevParamWnd = paramIdx > 1 and self.curParamWnds[ paramIdx - 1 ]
			
			if UI:IsWndKindOf( paramWnd, "ShipTooltip_DeviderWnd" ) then

				paramWnd:SetLeft( self.deviderX )

				local space = 0
				if prevParamWnd then
					space = self.space_paramBtm_devider 
				end

				rowY0 = prevRowY1 + space
				paramWnd:SetTop( rowY0 )

				prevRowY1 = rowY0 + paramWnd:GetHeight()
				col = 1

			elseif UI:IsWndKindOf( paramWnd, "ShipTooltip_PrimaryParamWnd" ) then

				paramWnd:SetLeft( self.primParamX )
		
				local space = 0
				if prevParamWnd then
					if UI:IsWndKindOf( prevParamWnd, "ShipTooltip_DeviderWnd" ) then
						space = self.space_devider_paramTop
					else
						space = self.space_paramsRows 
					end
				end

				rowY0 = prevRowY1 + space
				prevRowY1 = rowY0 + paramWnd:GetHeight()

				paramWnd:SetTop( rowY0 )

				col = 1				

			else

				paramWnd:SetLeft( col == 1 and self.paramsCol1X or self.paramsCol2X )

				if col == 1 then

    				local space = 0
    				if prevParamWnd then
    					if UI:IsWndKindOf( prevParamWnd, "ShipTooltip_DeviderWnd" ) then
    						space = self.space_devider_paramTop
    					else
    						space = self.space_paramsRows 
    					end
    				end
				
					rowY0 = prevRowY1 + space
					prevRowY1 = rowY0 + paramWnd:GetHeight()

				end

				paramWnd:SetTop( rowY0 )

				col = math.fmod( col, MAX_COLS ) + 1			
				
			end

		end

		lastBlockY1 = prevRowY1 + self.space_paramsBtm_sep

	end


	-- описание c параметрами (размер, позиция)

	if self:IsLayerVisible( self.layers.DESC_PARAMS ) then

    	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
    	nextSepIdx = nextSepIdx + 1

    	local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC_PARAMS ), 100000 )

        local descHeight = _G.MeasureText(
       		self:GetText( self.layers.DESC_PARAMS ),
       		self:GetFont( self.layers.DESC_PARAMS ),
        	descFormatRect,
       		self:GetTextFormatFlags( self.layers.DESC_PARAMS ),
        	descFormatRect).w

    	self:SetLayerHeight( descHeight, self.layers.DESC_PARAMS )

    	local descY0 = lastBlockY1 + self.space_sep_descTop
    	self:SetLayerTop( descY0, self.layers.DESC_PARAMS )

    	lastBlockY1 = descY0 + descHeight + self.space_descBtm_sep

	end


	-- описание простое (размер, позиция)

	if self:IsLayerVisible( self.layers.DESC_SIMPLE ) then

    	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
    	nextSepIdx = nextSepIdx + 1

    	local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC_SIMPLE ), 100000 )

        local descHeight = _G.MeasureText(
       		self:GetText( self.layers.DESC_SIMPLE ),
       		self:GetFont( self.layers.DESC_SIMPLE ),
        	descFormatRect,
       		self:GetTextFormatFlags( self.layers.DESC_SIMPLE ),
        	descFormatRect).w

    	self:SetLayerHeight( descHeight, self.layers.DESC_SIMPLE )

    	local descY0 = lastBlockY1 + self.space_sep_descTop
    	self:SetLayerTop( descY0, self.layers.DESC_SIMPLE )

    	lastBlockY1 = descY0 + descHeight + self.space_descBtm_sep

	end


	-- иконки специальных модулей

	if next( self.curSpecModuleIcons ) then

		self:ShowSeparator( nextSepIdx, lastBlockY1 )		
		nextSepIdx = nextSepIdx + 1

        local y = lastBlockY1 + self.space_sep_specModuleIcoTop

		for idx, icoWnd in ipairs( self.curSpecModuleIcons ) do

        	icoWnd:SetTop( y )

			local x = self.specModuleIconsX + ( self.specModuleIcoWidth + self.space_specModuleIcons ) * ( idx - 1 )
    		icoWnd:SetLeft( x )

		end

    	lastBlockY1 = y + self.specModuleIcoHeight + self.space_specModuleIcoBtm_sep

	end


	-- прочность и цена ремонта (позиции)

	-- прочность

	self:ShowSeparator( nextSepIdx, lastBlockY1 )		
	nextSepIdx = nextSepIdx + 1

	local durY0 = lastBlockY1 + self.space_sep_durTop
	self:SetLayerTop( durY0, self.layers.DURABILITY )
	local durY1 = durY0 + self:GetLayerHeight( self.layers.DURABILITY ) + self.space_durBtm_btm
	
	-- цена ремонта
	
	local repairPriceY0 = lastBlockY1 + self.space_sep_repairPriceTop
	self:SetLayerTop( repairPriceY0, self.layers.REPAIR_PRICE )
	local repairPriceY1 = repairPriceY0 + self:GetLayerHeight( self.layers.REPAIR_PRICE ) + self.space_repairPriceBtm_btm
	
	lastBlockY1 = math.max( durY1, repairPriceY1 )
	

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

end


--
function UI.ShipTooltipWnd:RecalcSpecModulesTooltipsLayout()

	if not next( self.curSpecModuleTooltips ) then
		return
	end

	-- Попытка разместить вертикально,
	-- если не влазит по высоте, то горизонтально.
	-- При сравнения кораблей - только вертикально.

	local bVertical			= true
	local tooltipsHeight	= 0
	local selfX				= self:GetLeft()
	local selfY				= self:GetTop()

	for idx, tooltipInfo in ipairs( self.curSpecModuleTooltips ) do

		if idx > 1 then
			tooltipsHeight = tooltipsHeight + self.space_specModuleTooltips_y
		end

		tooltipsHeight = tooltipsHeight + tooltipInfo.wnd:GetHeight()		

	end

	if tooltipsHeight > 768 and not self:IsComparing() then
		bVertical = false
	end

	local icoY_local = 0

	local specModuleIcoWnd = self.curSpecModuleIcons[ 1 ]
	if specModuleIcoWnd then
		icoY_local = specModuleIcoWnd:GetTop()
	else
		sys.log( "UI.ShipTooltipWnd:RecalcSpecModulesTooltipsLayout()[ERROR]: no spec module ico" )
	end

	local tooltipWidth = self.curSpecModuleTooltips[ 1 ].wnd:GetWidth()

	if bVertical then

		-- По вертикали: попытка разместить выше иконки спецмодуля,
		-- если не влазит сверху, то по верхнему краю экрана.
		-- По горизонтали: по центру тултипа корабля.
		-- Между собой тултипы по горизонтали выровнены по центру.

		local tooltipsX = ( self:GetWidth() - tooltipWidth ) / 2 + selfX

		local tooltipsY = icoY_local - tooltipsHeight + selfY
		if tooltipsY < 0 then
			tooltipsY = 0
		end

		local y = tooltipsY

		for idx, tooltipInfo in ipairs( self.curSpecModuleTooltips ) do

			tooltipInfo.wnd:SetPos( UI:Vec2( tooltipsX, y ) )
			y = y + tooltipInfo.wnd:GetHeight() + self.space_specModuleTooltips_y

		end

	else

		-- По горизонтали: попытка разместить, чтобы первый тултип начинался по центру тултипа корабля,
		-- если не влазит справа, то по правому краю экрана.
		-- По вертикали: выше иконки спецмодуля,
		-- если не влазит сверху, то по верхнему краю экрана.
		-- Между собой тултипы по вертикали выровнены по нижнему краю.

		local numTooltips	= #self.curSpecModuleTooltips
		local tooltipsWidth	= tooltipWidth * numTooltips + self.space_specModuleTooltips_x * ( numTooltips - 1 )

		local maxTooltipsHeight = 0
		for idx, tooltipInfo in pairs( self.curSpecModuleTooltips ) do
			local height = tooltipInfo.wnd:GetHeight()
			if height > maxTooltipsHeight then
				maxTooltipsHeight = height
			end
		end

		local tooltipsX = ( self:GetWidth() - tooltipWidth ) / 2 + selfX
		if tooltipsX + tooltipsWidth > 1024 then
			tooltipsX = 1024 - tooltipsWidth
		end

		local tooltipsY1 = icoY_local + selfY
		if tooltipsY1 - maxTooltipsHeight < 0 then
			tooltipsY1 = maxTooltipsHeight
		end

		for idx, tooltipInfo in ipairs( self.curSpecModuleTooltips ) do

			local x = ( tooltipWidth + self.space_specModuleTooltips_x ) * ( idx - 1 ) + tooltipsX
			local y = tooltipsY1 - tooltipInfo.wnd:GetHeight()

			tooltipInfo.wnd:SetPos( UI:Vec2( x, y ) )

		end

	end
	
end


--
function UI.ShipTooltipWnd:ShowSeparator( sepIdx, y )

	if sepIdx > self.MAX_SEPARATORS then
		sys.log( "UI.ShipTooltipWnd:ShowSeparator()[ERROR]: cannot show separator %d; max separators is %d", sepIdx, self.MAX_SEPARATORS )
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
function UI.ShipTooltipWnd:PlaceOnScreen( bStabilizePos )

	if bStabilizePos == nil then
		bStabilizePos = false
	end

	local pos = UI:ZeroVec2()

	-- если меняется режим просмотра во время, пока окно на экране,
	-- то недопустимо, чтобы радикально менялась позиция на экране - полностью выше курсора или ниже

	if bStabilizePos then

		local oldRect = self:GetRect()

		pos.x = UI:Clamp( oldRect.x, 0, 1024 - oldRect.z )
		pos.y = UI:Clamp( oldRect.y, 0, 768 - oldRect.w )			
		
	else
		pos = UI:GetTooltipDefaultPos( self:GetWidth(), self:GetHeight() )
	end

	-- тултип сравнениня
	if self.compareTooltipWnd and self.compareVid ~= UI.INVALID_U64_ID then

		local mainSeparator2Effect = UI:GetEffectFromLayer( self, self.layers.SEPARATOR_2_EFFECT )
		local compareSeparator2Effect = UI:GetEffectFromLayer( self.compareTooltipWnd, self.layers.SEPARATOR_2_EFFECT )	

		local mainSeparator2Y = mainSeparator2Effect and mainSeparator2Effect:GetPos().y or 0
		local copmpareSeparator2Y = compareSeparator2Effect and compareSeparator2Effect:GetPos().y or 0

		-- по умолчанию - тултип сравнения находится слева от основного, по вертикали выровнян по началу блока синергии
    	local compareTooltipPos = UI:Vec2( pos.x - self.compareTooltipWnd:GetWidth() - self.space_compareTooltip, mainSeparator2Y + pos.y - copmpareSeparator2Y )

		-- фикс вертикальной позиции

		local savedCompareY = compareTooltipPos.y
    	compareTooltipPos.y = UI:Clamp( compareTooltipPos.y, 0, 768 - self.compareTooltipWnd:GetHeight() )

		-- если тултип сравнения не влез по горизонтали, то он смещается так чтобы влезал, а за ним смещается и основной тултип,
		-- чтобы сохранить выравнивание по блоку синергии
		if savedCompareY ~= compareTooltipPos.y then

			pos.y = copmpareSeparator2Y + compareTooltipPos.y - mainSeparator2Y

			-- если после смещения не влез основной тултип, то он смещается так чтобы влезал, а за ним и тултип сравнения,
			-- чтобы сохранить выравнивание по блоку синергии (при этом тултип сравнения может обрезаться)
			local savedMainY = pos.y
			pos.y = UI:Clamp( pos.y, 0, 768 - self:GetHeight() )

			if savedMainY ~= pos.y then
				compareTooltipPos.y = mainSeparator2Y + pos.y - copmpareSeparator2Y
			end

		end		

		-- фикс горизонтальной позиции

		-- если слева не влез, попытка поместить справа
    	if compareTooltipPos.x < 0 then

	    	compareTooltipPos.x = pos.x + self:GetWidth() + self.space_compareTooltip

			-- если справа тоже не влез, то ставится туда, где больше расстояние - слева или справа			
    		if compareTooltipPos.x + self.compareTooltipWnd:GetWidth() > 1024 then

				local leftFreeSpace = pos.x 
				local rightFreeSpace = 1024 - ( pos.x + self:GetWidth() )

				local totalWidth = self:GetWidth() + self.space_compareTooltip + self.compareTooltipWnd:GetWidth()

				-- ставится слева, со смещением основного тултипа
				if leftFreeSpace >= rightFreeSpace then

					-- оба тултипа влазят в экран
					if totalWidth < 1024 then
						compareTooltipPos.x = 0
						pos.x = compareTooltipPos.x + self.space_compareTooltip + self.compareTooltipWnd:GetWidth()

					-- оба тултипа не влазят в экран, поэтому обрезается тултип сравнения
					else
						pos.x = 1024 - self:GetWidth()
						compareTooltipPos.x = pos.x - self.space_compareTooltip - self.compareTooltipWnd:GetWidth()
					end

				-- ставится справа, со смещением основного тултипа
				else

					-- оба тултипа влазят в экран
					if totalWidth < 1024 then
						compareTooltipPos.x = 1024 - self.compareTooltipWnd:GetWidth()
						pos.x = compareTooltipPos.x - self.space_compareTooltip - self:GetWidth()

					-- оба тултипа не влазят в экран, поэтому обрезается тултип сравнения
					else
						pos.x = 0
						compareTooltipPos.x = pos.x + self.space_compareTooltip + self:GetWidth()
					end

				end

    		end

    	end

	    self.compareTooltipWnd:SetPos( compareTooltipPos )

	end

	self:SetLeft( pos.x )
	self:SetTop( pos.y )

	self:UpdateEffects()

	self:RecalcSpecModulesTooltipsLayout()

end


--
function UI.ShipTooltipWnd:UpdateEffects()

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
	
	self.eliteDescMetaText:UpdateScreenOrgFromLayer( self, self.layers.ELITE_DESC )	
	self.reparPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.REPAIR_PRICE )

end


--
function UI.ShipTooltipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.ELITE_DESC then
		self.eliteDescMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
		
	elseif layerIdx == self.layers.REPAIR_PRICE then
		self.reparPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:PlaceOnScreen()


	if not self.bSecondary and self.logEvent ~= -1 and self.logEvent ~= _G.MasterServer.PlayerAction.PA_INVALID and self.logEvent ~= _G.MasterServer.PlayerAction.PA_NUM then
		_G.MasterServer_UpdatePlayerActionsLog( self.logEvent )
	end

end


--
function UI.ShipTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipTooltipWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.bSecondary then
		return
	end

	self:CheckSpecModuleTooltips()
	self:CheckEmphasizeBuffs()
	self:CheckCompareTooltip()

end


--
function UI.ShipTooltipWnd:CheckSpecModuleTooltips()

	if self.bSecondary then
		return
	end

	local bNeedSpecModuleTooltips	= _G.Input_IsKeyPressed( UI.Keys.KEY_ALT ) and next( self.curSpecModuleIcons ) ~= nil
	local bIsSpecModuleTooltips		= self.curSpecModuleTooltips[ 1 ] ~= nil and self.curSpecModuleTooltips[ 1 ].wnd:IsOnScreen()

	if bNeedSpecModuleTooltips and not bIsSpecModuleTooltips then
		self:ShowSpecModuleTooltips()

	elseif not bNeedSpecModuleTooltips and bIsSpecModuleTooltips then
		self:HideSpecModuleTooltips()
	end

end


--
function UI.ShipTooltipWnd:ShowSpecModuleTooltips()

	if not self.curSpecModuleTooltips[ 1 ] or self.curSpecModuleTooltips[ 1 ].wnd:IsOnScreen() then
		return
	end

	for idx, tooltipInfo in pairs( self.curSpecModuleTooltips ) do
		-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0089918)
		tooltipInfo.wnd:Setup( tooltipInfo.data )
		UI.Root:AddChild( tooltipInfo.wnd )
	end	

	if not self.bSecondary then
    	if self.compareTooltipWnd:IsOnScreen() then
    		self.compareTooltipWnd:ShowSpecModuleTooltips()
    	end
	end

	self:UpdateZOrder()
	self:RecalcSpecModulesTooltipsLayout()

end


--
function UI.ShipTooltipWnd:HideSpecModuleTooltips()

	if not self.curSpecModuleTooltips[ 1 ] or not self.curSpecModuleTooltips[ 1 ].wnd:IsOnScreen() then
		return
	end

	for idx, tooltipInfo in pairs( self.curSpecModuleTooltips ) do
		tooltipInfo.wnd:UnlinkFromParent()
	end	

	if not self.bSecondary then
    	if self.compareTooltipWnd:IsOnScreen() then
    		self.compareTooltipWnd:HideSpecModuleTooltips()
    	end
	end

end


--
function UI.ShipTooltipWnd:ValidateMode()

	if self.baseMode == -1 then

    	local profile = _G.GetProfileTable()

    	if profile.shipTooltipMode then
    		self.baseMode = profile.shipTooltipMode
    	end

	end

	if UI:Val2Key( UI.shipTooltipModes, self.baseMode ) == "" then
		self.baseMode = UI.DEFAULT_SHIP_TOOLTIP_MODE
	end

	self:SetMode( self.baseMode )

end


--
function UI.ShipTooltipWnd:SetMode( mode )

	if mode == self.mode then
		return
	end

	self.mode = mode
	self:UpdateForMode()

	if not self.bSecondary then

    	if self:IsOnScreen() then
    		self:PlaceOnScreen( true )
    	end

	end

end


--
function UI.ShipTooltipWnd:CheckEmphasizeBuffs()

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
		self:UpdateOnCompareChanged()
	end

end


--
function UI.ShipTooltipWnd:CheckCompareTooltip()

	if self.bSecondary or self.compareVid == UI.INVALID_U64_ID then
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
function UI.ShipTooltipWnd:ShowCompareTooltip()

	if self.bSecondary then
		sys.log( "UI.ShipTooltipWnd:ShowCompareTooltip()[ERROR]: not allowed for secondary tooltip" )
		return
	end

	if self.compareTooltipWnd:IsOnScreen() then
		return
	end

	UI.Root:AddChild( self.compareTooltipWnd )

	if self.curSpecModuleTooltips[ 1 ] and self.curSpecModuleTooltips[ 1 ].wnd:IsOnScreen() then
		self.compareTooltipWnd:ShowSpecModuleTooltips()
	end

	self:UpdateZOrder()

	if self:IsOnScreen() then
		self:PlaceOnScreen( true )
	end

	self:UpdateOnCompareChanged()

end


--
function UI.ShipTooltipWnd:HideCompareTooltip()

	if self.bSecondary then
		return
	end

	if not self.compareTooltipWnd:IsOnScreen() then
		return
	end

	self.compareTooltipWnd:UnlinkFromParent()

	self:UpdateOnCompareChanged()

end    


--
function UI.ShipTooltipWnd:UpdateOnCompareChanged()

	local shipParamsData = self:GetShipParamsData()
	local compareShipParamsData = self:GetCompareShipParamsData()

	for paramIdx, paramWnd in pairs( self.curParamWnds ) do
		if UI:IsWndKindOf( paramWnd, "ShipTooltip_ParamWnd" ) then
			paramWnd:SetShipParamsData( shipParamsData, compareShipParamsData )
		end
	end

	self:UpdateSynergy()
	self:UpdateDescParams()

	-- цифры внутри текста описания могли поменяться, поэтому размер текста мог измениться,
	-- а значит и расположение нижелажащих элементов
	self:RecalcLayout()
	self:RecalcSpecModulesTooltipsLayout()

end


--
function UI.ShipTooltipWnd:IsComparing()

	return self.bSecondary or ( self.compareTooltipWnd and self.compareTooltipWnd:IsOnScreen() )

end


--
function UI.ShipTooltipWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:HideSpecModuleTooltips()
	self:HideCompareTooltip()

end


--
function UI.ShipTooltipWnd:GetShipParamsData()

	local shipParamsData = { defName = self.defName, data = nil, synergyLevel = UI:GetShipDefaultLevel( self.defName ), dataType = UI.paramSrcTypes.SHIP  }

	if not self:IsWithBuffs() then
	
		shipParamsData.data = { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.defName, true, false ) ) }

	else
		if self.shipInfo and self.shipInfo.hangarIdx then
			shipParamsData.data			= { params = _G.CL_GetShipParamsFromHangarData( self.playerId, self.shipInfo.hangarIdx, false--[[SC-112506 без автогенов]] ) }
			shipParamsData.synergyLevel	= self.shipInfo.level

    	elseif self.vid ~= UI.INVALID_U64_ID then
    		shipParamsData.data			= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.vid, true, self.chosenNodesMask, self.bWithTalents, false--[[SC-112506 без автогенов]] ) ) }
			shipParamsData.synergyLevel	= UI:GetShipLevel( UI:GetShipItem( self.vid, true ) )

		else
    		shipParamsData.data			= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.defName, true, true ) ) }
			shipParamsData.synergyLevel	= UI:GetShipDefaultLevel( self.defName )
    	end
	end	

	return shipParamsData

end


--
function UI.ShipTooltipWnd:GetCompareShipParamsData()

	local compareShipDefName = ""
	local compareShipParamsData = nil

	-- сравнение с другим кораблем; при этом сравниваются "голые" дефинишены
	if not self.bSecondary and self.compareVid ~= UI.INVALID_U64_ID and self.compareTooltipWnd:IsOnScreen() then

		local compareItem = UI:GetShipItem( self.compareVid )

		compareShipDefName		= compareItem and compareItem.defName or ""
		compareShipParamsData	= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipDefaultSpawnData( compareShipDefName, true, false ) ) }

	-- сравнение с "голым" дефинишеном того же корабля
	elseif self.bEmphasizeBuffs then

		compareShipDefName		= self.defName
		compareShipParamsData	= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipDefaultSpawnData( self.defName, true, false ) ) }

	end

	if compareShipDefName ~= "" then
		return { defName = compareShipDefName, data = compareShipParamsData, synergyLevel = UI:GetShipDefaultLevel( compareShipDefName ), dataType = UI.paramSrcTypes.SHIP }
	else
		return nil
	end

end  


--
function UI.ShipTooltipWnd:IsWithBuffs()

	local bComparing = self.bSecondary or ( self.compareTooltipWnd and self.compareTooltipWnd:IsOnScreen() )
    return not bComparing

end


--
function UI.ShipTooltipWnd:IsEliteShip()

	local curLevel, maxLevel = self:GetSynergy()
	return curLevel >= maxLevel

end


--
function UI.ShipTooltipWnd:UpdateZOrder()

	if self.bSecondary then
		return
	end

	UI.Root:MoveChildToLastPosition( self )

	for idx, tooltipInfo in ipairs( self.curSpecModuleTooltips ) do
		if tooltipInfo.wnd:IsOnScreen() then
			UI.Root:MoveChildToLastPosition( tooltipInfo.wnd )
		end
	end

	if self.compareTooltipWnd and self.compareTooltipWnd:IsOnScreen() then

		UI.Root:MoveChildToLastPosition( self.compareTooltipWnd )

    	for idx, tooltipInfo in ipairs( self.compareTooltipWnd.curSpecModuleTooltips ) do
    		if tooltipInfo.wnd:IsOnScreen() then
    			UI.Root:MoveChildToLastPosition( tooltipInfo.wnd )
    		end
    	end

	end

end


-- -------------------------------------------------------------------------------
-- UI.ShipTooltip_ParamWnd
-- -------------------------------------------------------------------------------

UI.ShipTooltip_ParamWnd = {}
local stp = UI.ShipTooltip_ParamWnd

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipTooltip_ParamWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ShipTooltip_ParamWnd",
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
				defName 			= "shipTooltip_param",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.ShipTooltip_ParamWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					-- не линкуется по цвету
					{
						objName		= "value",
						layer		= "UI.ShipTooltip_ParamWnd.layers.VAL",
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
function UI.ShipTooltip_ParamWnd:Setup( defName, paramInfo, shipParamsData, compareShipParamsData, paramsTable )

	self:Reset()

	self.defName				= defName
	self.paramInfo				= paramInfo
	self.shipParamsData			= shipParamsData
	self.compareShipParamsData	= compareShipParamsData
	self.paramsTable			= paramsTable

	self:UpdateIco()
	self:UpdateName()
	self:UpdateVal()

end


--
function UI.ShipTooltip_ParamWnd:SetShipParamsData( shipParamsData, compareShipParamsData )

	self.shipParamsData			= shipParamsData
	self.compareShipParamsData	= compareShipParamsData
	self:UpdateVal()	

end


--
function UI.ShipTooltip_ParamWnd:Reset()

	self.defName				= ""
	self.paramInfo				= nil
	self.shipParamsData			= nil
	self.compareShipParamsData	= nil
	self.paramsTable			= nil

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

stp.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
    VAL			= 2,
}

stp.effectInfo =
{
	main =
	{
		icoSpriteName				= "ico",
		colorValLocator				= "value",
		colorUnitsLocator			= "color_1",		
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

stp.defName					= ""
stp.paramInfo				= nil
stp.shipParamsData			= nil
stp.compareShipParamsData	= nil

stp.colorVal				= UI.WHITE_COLOR
stp.colorUnits				= UI.WHITE_COLOR

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ShipTooltip_ParamWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.colorVal			= mainEffect:GetObjColor( self.effectInfo.main.colorValLocator )
		self.colorUnits			= mainEffect:GetObjColor( self.effectInfo.main.colorUnitsLocator )

	end

end


--
function UI.ShipTooltip_ParamWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local hTex = UI:GetShipParamIco( self.paramInfo )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.ShipTooltip_ParamWnd:UpdateName()

	local name = UI:ShipParam2Str( self.paramInfo )
	self:SetText( name, self.layers.NAME )

end


--
function UI.ShipTooltip_ParamWnd:UpdateVal()

	local str = UI:GetShipParamValAsStr( self.paramInfo, self.shipParamsData, self.compareShipParamsData, true, self.colorVal, self.colorUnits, false, self.paramsTable )
    self:SetText( str, self.layers.VAL )

end


--
function UI.ShipTooltip_ParamWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.ShipTooltip_ParamWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipTooltip_ParamWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end   


-- -------------------------------------------------------------------------------
-- UI.ShipTooltip_PrimaryParamWnd
-- -------------------------------------------------------------------------------

UI.ShipTooltip_PrimaryParamWnd = {}
local stpp = UI.ShipTooltip_PrimaryParamWnd

local numParamWndLayers = UI:GetTableLength( UI.ShipTooltip_ParamWnd.layers )

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipTooltip_PrimaryParamWnd.def =
{
	className 	= "Wnd",
	prototype	= "ShipTooltip_ParamWnd",

	props =
	{
		name		= "ShipTooltip_PrimaryParamWnd",
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
				defName 			= "shipTooltip_primaryParam",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.ShipTooltip_ParamWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					-- не линкуется по цвету
					{
						objName		= "value",
						layer		= "UI.ShipTooltip_ParamWnd.layers.VAL",
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
			layerStyle		= UI.WLS_OWNERDRAW,
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
function UI.ShipTooltip_PrimaryParamWnd:Reset()

	UI.ShipTooltip_ParamWnd.Reset( self )

	self.valMetaText:SetText( "", true )

end


-- -----------------------------------
-- const
-- -----------------------------------

stpp.effectInfo =
{
	main =
	{
		icoSpriteName			= "ico",
		colorValLocator			= "value",
		colorUnitsLocator		= "color_font_1",		
		fontValLocator			= "value",
		fontUnitsLocator		= "color_font_1"
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

stpp.fontVal		= FONT.INVALID_FONT_HANDLE
stpp.fontUnits		= FONT.INVALID_FONT_HANDLE
stpp.valMetaText	= nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ShipTooltip_PrimaryParamWnd:F_PostLoad()

	UI.ShipTooltip_ParamWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local fontValName = mainEffect:GetObjFontName( self.effectInfo.main.fontValLocator )
		self.fontVal = _G.ObtainFont( fontValName )

		local fontUnitsName = mainEffect:GetObjFontName( self.effectInfo.main.fontUnitsLocator )
		self.fontUnits = _G.ObtainFont( fontUnitsName )

	end

	self.valMetaText = UI.MetaText.GetNewInstance()
	self.valMetaText:InitFromLayer( self, self.layers.VAL )

end


--
function UI.ShipTooltip_PrimaryParamWnd:F_Shutdown()

	if not self:IsPrototype() then
		self.valMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end   


--
function UI.ShipTooltip_PrimaryParamWnd:UpdateVal()

	local strVal = UI:GetShipParamValAsStr( self.paramInfo, self.shipParamsData, self.compareShipParamsData, false, self.colorVal, nil, false, self.paramsTable )

	local strUnits = UI:ParamUnits2Str( self.paramInfo )
	if strUnits ~= "" then
		strUnits = string.format( "$text [fontId %d][color %u][alignment BASELINE][text %s]$", self.fontUnits, self.colorUnits, strUnits )
	end

	local str = string.format( "%s%s%s", strVal, strUnits ~= "" and " " or "", strUnits )
	self.valMetaText:SetText( str, true )	

end


--
function UI.ShipTooltip_PrimaryParamWnd:UpdateEffects()

	UI.ShipTooltip_ParamWnd.UpdateEffects( self )

	self.valMetaText:UpdateScreenOrgFromLayer( self, self.layers.VAL )

end   



--
function UI.ShipTooltip_PrimaryParamWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.VAL then
		self.valMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- --------------------------------------------------------------
-- UI.ShipTooltip_DeviderWnd
-- --------------------------------------------------------------

UI.ShipTooltip_DeviderWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipTooltip_DeviderWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ShipTooltip_DeviderWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipTooltip_devider",
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

-- -----------------------------------
-- const
-- -----------------------------------

UI.ShipTooltip_DeviderWnd.layers =
{
	MAIN_EFFECT = 0
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ShipTooltip_DeviderWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipTooltip_DeviderWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end   


-- --------------------------------------------------------------
-- UI.ShipTooltip_SlotWnd
-- --------------------------------------------------------------

UI.ShipTooltip_SlotWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipTooltip_SlotWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ShipTooltip_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipTooltip_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value_1",
						layer		= "UI.ShipTooltip_SlotWnd.layers.SLOTS_NUM",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},
				}
			}}
		},

		-- SLOTS_NUM
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.ShipTooltip_SlotWnd:Setup( slotType, slotsNum )

	self:Reset()

	self.slotType = slotType
	self.slotsNum = slotsNum

	self:FullUpdate()

end


--
function UI.ShipTooltip_SlotWnd:Reset()

	self.slotType	= -1
	self.slotsNum	= 0

	self:SetText( "", self.layers.SLOTS_NUM )

end 


--
function UI.ShipTooltip_SlotWnd:GetSlotType()

	return self.slotType

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.ShipTooltip_SlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    SLOTS_NUM	= 1,
}

UI.ShipTooltip_SlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ShipTooltip_SlotWnd.slotType	= -1
UI.ShipTooltip_SlotWnd.slotsNum	= 0

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ShipTooltip_SlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateSlotsNum()

end


--
function UI.ShipTooltip_SlotWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local slotTypeName = UI:Val2Key( UI.ShipTooltipWnd.slotTypes, self.slotType )
	local texName = string.format( "equipSlot_%s", slotTypeName )

	local hTex = UI:GetTex( texName )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.ShipTooltip_SlotWnd:UpdateSlotsNum()

	local text = ""

	if self.slotsNum > 1 then
		text = string.format( "x%d", self.slotsNum )

	elseif self.slotsNum == -1 then
		text = "x?"
	end 

	self:SetText( text, self.layers.SLOTS_NUM )

end


--
function UI.ShipTooltip_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipTooltip_SlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end	

end


--
function UI.ShipTooltip_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


-- --------------------------------------------------------------
-- UI.ShipTooltip_SpecModuleTooltipWnd
-- --------------------------------------------------------------

UI.ShipTooltip_SpecModuleTooltipWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.ShipTooltip_SpecModuleTooltipWnd.def =
{
	className	= "Wnd",
	prototype	= "ModuleTooltipWnd",

	props =
	{
		name		= "ShipTooltip_SpecModuleTooltipWnd",
		isPrototype	= true,
	},	
}

-- --------------------------------------
-- interface funtions
-- --------------------------------------

--
function UI.ShipTooltip_SpecModuleTooltipWnd:SetPos( pos )

	self.pos = UI:Vec2CopyStable( pos )

	if self:IsOnScreen() then
		self:PlaceOnScreen()
	end	

end

-- --------------------------------------
-- vars
-- --------------------------------------

UI.ShipTooltip_SpecModuleTooltipWnd.pos	= Vec2( 0, 0 )

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.ShipTooltip_SpecModuleTooltipWnd:F_PostLoad()

	UI.ModuleTooltipWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.pos = Vec2( 0, 0 )	

end


--
function UI.ShipTooltip_SpecModuleTooltipWnd:Reset()

	UI.ModuleTooltipWnd.Reset( self )
	self.pos.x, self.pos.y = 0, 0

end


--
function UI.ShipTooltip_SpecModuleTooltipWnd:PlaceOnScreen()

	self:SetLeft( self.pos.x )
	self:SetTop( self.pos.y )

	self:UpdateEffects()

end


-- --------------------------------------------------------------
-- UI.CompareShipTooltipWnd
-- --------------------------------------------------------------

UI.CompareShipTooltipWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.CompareShipTooltipWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipTooltipWnd",

	props =
	{
		name		= "CompareShipTooltipWnd",
		isPrototype	= true,
	},	
}

-- --------------------------------------
-- interface funtions
-- --------------------------------------

--
function UI.CompareShipTooltipWnd:SetPos( pos )

	self.pos = UI:Vec2CopyStable( pos )

	if self:IsOnScreen() then
		self:PlaceOnScreen()
	end	

end

-- --------------------------------------
-- vars
-- --------------------------------------

UI.CompareShipTooltipWnd.pos		= Vec2( 0, 0 )
UI.CompareShipTooltipWnd.bSecondary	= true

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.CompareShipTooltipWnd:F_PostLoad()

	UI.ShipTooltipWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.pos = Vec2( 0, 0 )	

end


--
function UI.CompareShipTooltipWnd:Reset()

	UI.ShipTooltipWnd.Reset( self )
	self.pos.x, self.pos.y = 0, 0

end


--
function UI.CompareShipTooltipWnd:PlaceOnScreen()

	self:SetLeft( self.pos.x )
	self:SetTop( self.pos.y )

	self:UpdateEffects()

	self:RecalcSpecModulesTooltipsLayout()

end


-- --------------------------------------------------------------
-- инстанс общего тултипа
-- --------------------------------------------------------------

UI.ShipTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "ShipTooltipWnd",

    	props =
    	{
    		name		= "ShipTooltipWnd_shared",
    	},	
	}
}