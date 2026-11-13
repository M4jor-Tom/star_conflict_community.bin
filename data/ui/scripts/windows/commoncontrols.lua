-- ----------------------------------------------------------------------------

--[[
содержимое файла:

UI.ItemControlWnd
UI.ItemControl_SpellIcoWnd
UI.ItemControl_ItemTypeWnd
UI.ItemControl_DurabilityIcoWnd
UI.ItemControl_DurabilityIcoWnd_1080
UI.CrossBtn
UI.CrossBtn2
UI.CrossBtn3
UI.CrossBtn3_720
UI.CrossBtn4
UI.HelpBtn
UI.RefillMoneyBtn
UI.TextBtn
UI.TextBtn2
UI.TextBtn3 
UI.TextBtn4 
UI.TextBtn5 
UI.TextBtn6 
UI.TextBtn7 
UI.TextBtn8 
UI.TextBtn9 
UI.TextBtn10 
UI.TextBtn11 
UI.TextBtn12 
UI.TextBtn13 
UI.TextBtn14
UI.TextBtn15
UI.TextBtn16
UI.TextBtn17
UI.TextBtn18
UI.TextBtn19
UI.ShipLevelUpIco
UI.ShipLevelUpIco_1080
UI.FacebookBtn
UI.FacebookBtn1 
UI.FacebookBtn2 
UI.FacebookBtn3 
UI.VKontakteBtn
UI.VKontakteBtn1 
UI.VKontakteBtn2 
UI.VKontakteBtn3 
UI.ShipQuestIcoWnd
UI.ShipPartIcoWnd
UI.SpecModulePartIcoWnd

]]

-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- UI.ItemControlWnd
-- ----------------------------------------------------------------------------

UI.ItemControlWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ItemControlWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "ItemControlWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype		= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		}
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ItemControlWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ItemControlWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.ItemControlWnd:Reset()

	self.tooltipData = nil

end

-- ---------------------------------
-- const
-- ---------------------------------

UI.ItemControlWnd.ITEM_CONTROL = true

UI.ItemControlWnd.layers =
{
	MAIN_EFFECT	= 0
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ItemControlWnd.tooltipData	= nil


-- ----------------------------------------------------------------------------
-- UI.ItemControl_SpellIcoWnd
-- ----------------------------------------------------------------------------

UI.ItemControl_SpellIcoWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ItemControl_SpellIcoWnd.def =
{
	className 	= "Wnd",
	prototype	= "ItemControlWnd",

	props =
	{
		name			= "ItemControl_SpellIcoWnd",
		isPrototype		= true,
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
				defName 			= "spellIco",
				defaultAnimation	= "color",

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
-- interface functions
-- ---------------------------------

--
function UI.ItemControl_SpellIcoWnd:Setup( icoInfo )

	self:Reset()

	self.icoInfo = icoInfo
	self:UpdateIco()

end


--
function UI.ItemControl_SpellIcoWnd:Reset()

	UI.ItemControlWnd.Reset( self )

	self.icoInfo = nil
	self:UpdateIco()

end


-- ---------------------------------
-- vars
-- ---------------------------------

UI.ItemControl_SpellIcoWnd.icoInfo	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ItemControl_SpellIcoWnd:UpdateIco()

	UI:UpdateSpellIco( self.icoInfo, self, self.layers.MAIN_EFFECT )

end


-- ----------------------------------------------------------------------------
-- UI.ItemControl_ItemTypeWnd
-- ----------------------------------------------------------------------------

UI.ItemControl_ItemTypeWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ItemControl_ItemTypeWnd.def =
{
	className 	= "Wnd",
	prototype	= "ItemControlWnd",

	props =
	{
		name			= "ItemControl_ItemTypeWnd",
		isPrototype		= true,
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
				defName 			= "shop_itemsList_slot_itemType",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.ItemControl_ItemTypeWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.ItemControl_ItemTypeWnd:Setup( moduleType )

	self:Reset()
	
	self.itemType = moduleType

	self:UpdateText()
	self:UpdateTooltip()

end


--
function UI.ItemControl_ItemTypeWnd:Reset()

	UI.ItemControlWnd.Reset( self )
	
	self.itemType = -1

	self:SetText( "", self.layers.TEXT )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ItemControl_ItemTypeWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ItemControl_ItemTypeWnd.itemType = -1

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ItemControl_ItemTypeWnd:UpdateText()

	local text = string.format( "[%s]", UI:ModuleType2Str( self.itemType ) )
	self:SetText( text, self.layers.TEXT )

end


--
function UI.ItemControl_ItemTypeWnd:UpdateTooltip()

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= UI:GetModuleTypeDesc( self.itemType ),
		caption		= UI:ModuleType2Str( self.itemType ),
	}
	
	self:SetTooltipData( tooltipData )

end


-- -----------------------------------------------------
-- UI.ItemControl_DurabilityIcoWnd
-- -----------------------------------------------------

UI.ItemControl_DurabilityIcoWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ItemControl_DurabilityIcoWnd.def =
{
	className	= "Wnd",
	prototype	= "ItemControlWnd",

	props =
	{
		name		= "ItemControl_DurabilityIcoWnd",
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
				defName 			= "durabilityIco",

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
-- interface functions
-- ---------------------------------

--
function UI.ItemControl_DurabilityIcoWnd:SetupForShip( vid )

	self:Reset()

	self.mode = self.modes.SHIP

	self.vid = vid
	self:FullUpdate()

end


--
function UI.ItemControl_DurabilityIcoWnd:GetMode()

	return self.mode

end


--
function UI.ItemControl_DurabilityIcoWnd:Reset()

	UI.ItemControlWnd.Reset( self )

	self.mode = -1
	self.vid = UI.INVALID_U64_ID

end


--
function UI.ItemControl_DurabilityIcoWnd:OnDurabilityChanged()

	self:FullUpdate()

end


--
function UI.ItemControl_DurabilityIcoWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ItemControl_DurabilityIcoWnd.modes =
{
	SHIP	= 1,
}

UI.ItemControl_DurabilityIcoWnd.effectInfo =
{
	main =
	{
		zeroDurColorLocator	= "color_1",
		lowDurColorLocator	= "color_2",
		lowMoneyColorLocator= "color_3",
	},

	priceIco =
	{
		effectName		= "shop_items_slot_priceIco",
		animCredits		= "money",
		animGold		= "gold",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ItemControl_DurabilityIcoWnd.vid		= UI.INVALID_U64_ID
UI.ItemControl_DurabilityIcoWnd.mode	= -1

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ItemControl_DurabilityIcoWnd:FullUpdate()

	if self.mode == self.modes.SHIP then
     	if self.vid == UI.INVALID_U64_ID then
     		return
     	end

	else
		return
	end

	self:UpdateTooltip()

end


--
function UI.ItemControl_DurabilityIcoWnd:UpdateTooltip()

	self.tooltipData = nil

	if self.mode ~= self.modes.SHIP then
		sys.log( "UI.ItemControl_DurabilityIcoWnd:UpdateTooltip()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local baseColor = UI.WHITE_COLOR
	local strBaseColor = UI:Color2Str( baseColor )

	local totalPriceCredits = 0
	local totalPriceGold = 0

	-- ремонт

	local strRepair = ""

	local dur =  _G.GameStore_GetVesselHullCondition( self.vid )
	if dur < 1 then

		dur = UI:Round( dur * 100 )
		local repairPrice = _G.GameStore_GetRepairCost( self.vid )		

		local durColor = baseColor

    	if mainEffect then

        	if dur == 0 then
        		durColor = mainEffect:GetObjColor( self.effectInfo.main.zeroDurColorLocator )
        		
        	elseif dur <= 100 * UI.LOW_DURABILITY_THRESHOLD then
        		durColor = mainEffect:GetObjColor( self.effectInfo.main.lowDurColorLocator )
        	end

    	end   

		local strDurColor = UI:Color2Str( durColor )

		local tSubst =
		{
			cur_val	= string.format( "%s%d%s", strDurColor, dur, strBaseColor ),
			max_val	= tostring( 100 ),
		}

		strRepair = UI:GetStringByName( "maintenanceTooltip_repair" )
		strRepair = string.gsub( strRepair, "%$(.-)%$", tSubst )
		
		strRepair = string.format( "%s%s$credits$", strRepair, UI:Num2StrSeparatedBy3( repairPrice ) )

		totalPriceCredits = totalPriceCredits + repairPrice

	end


	-- пополнение ракет

	local stringsRefill = {}

	local shipItem = UI:GetShipItem( self.vid )
	if shipItem then

    	local shipDef = UI:GetDef( shipItem.defName )
    	if shipDef then

			local ammoSlotIds = {}
        	for ammoName, slotIdx in pairs( ai.MunitionBayType ) do
				if slotIdx ~= ai.MunitionBayType.MBT_NUM then
					table.insert( ammoSlotIds, slotIdx )
				end
			end

			table.sort( ammoSlotIds )


        	for idx = 1, #ammoSlotIds do

				local slotIdx = ammoSlotIds[ idx ]
            	local ammoInfo = shipItem.equipAmmo[ slotIdx ]

        		if ammoInfo and ammoInfo.def ~= "" then

        			local invCount = 0

        			local invItemsByDef = UI.serverData.inventoryByDef[ ammoInfo.def ]
        			if invItemsByDef then
        				for invItemIdx, invItem in pairs( invItemsByDef ) do
        					invCount = invCount + invItem.amount
        				end
        			end

					local bCanBeBought = not UI:CantItemBeBoughtByDef( ammoInfo.def )

        			if bCanBeBought or invCount > 0 then

                		local count = ammoInfo.amount
						local maxCount = 1

                		local needCount	= maxCount - count

                		if needCount > 0 then

                			-- если есть в инвентаре, ракеты будут взяты оттуда (и на цену это, соответственно, не повлияет);
                			-- если в инвентаре нет, то они будут куплены

							local slotRefillPrice = 0

							local buyCount = 0
							if bCanBeBought then
                				buyCount = math.max( needCount - invCount, 0 )
							end

							local bGold = false

                			if buyCount > 0 then

								-- параметр bWithAuraSale=false, т.к.при пополнении не учитываются скидки от аур - #0055563,комм.(0223048)
                				local oneRocketPrice = 0
								oneRocketPrice, bGold = UI:GetShopBuyPriceByDef( ammoInfo.def, false, nil, false )	-- #0036543, комм.(0132906) - утверждается, что на расходники должна быть одна цена

                				slotRefillPrice = oneRocketPrice * buyCount

                				if bGold then
                					totalPriceGold = totalPriceGold + slotRefillPrice
                				else
                					totalPriceCredits = totalPriceCredits + slotRefillPrice
                				end				

                			end

							local strSlotName = UI:Val2Key( ai.MunitionBayType, slotIdx )
							local strId = string.format( "maintenanceTooltip_refill_%s", strSlotName )
							local strRefillSlot = UI:GetStringByName( strId )

							local strPrice = ""
							if buyCount > 0 then
								strPrice = string.format( "%s%s", UI:Num2StrSeparatedBy3( slotRefillPrice ), bGold and "$gold$" or "$credits$" )
							else
								strPrice = UI:GetStringByName( "maintenanceTooltip_refill_fromInventory" )
							end

							strRefillSlot = string.format( "%s%s", strRefillSlot, strPrice )

							table.insert( stringsRefill, strRefillSlot )

                		end -- if needCount > 0 then
        			end -- if not UI:CantItemBeBoughtByDef( ammoInfo.def ) then
    			end -- if ammoInfo.def ~= "" then
			end
		else
    		sys.log( "UI:ItemControl_DurabilityIcoWnd:UpdateTooltip()[ERROR]: cannot find def for %s", shipItem.defName )
    	end
	else
		sys.log( "UI.ItemControl_DurabilityIcoWnd:UpdateTooltip()[ERROR]: cannot fin ship item" )
	end

	
	-- общая сумма

	local strCredits = ""
	local strGold = ""

	if totalPriceCredits == 0 and totalPriceGold == 0 then
		strCredits = "0$credits$"

	else

    	local lowMoneyColor = baseColor
    	if mainEffect then
    		lowMoneyColor = mainEffect:GetObjColor( self.effectInfo.main.lowMoneyColorLocator )
    	end

    	if totalPriceCredits > 0 then
    		local playerCredits = UI:GetPlayerMoney( false )
    		local strCreditsColor = totalPriceCredits <= playerCredits and strBaseColor or UI:Color2Str( lowMoneyColor )
    		strCredits = string.format( "%s%s%s$credits$", strCreditsColor, UI:Num2StrSeparatedBy3( totalPriceCredits ), strBaseColor )
    	end

    	if totalPriceGold > 0 then
    		local playerGold = UI:GetPlayerMoney( true )
    		local strGoldColor = totalPriceGold <= playerGold and strBaseColor or UI:Color2Str( lowMoneyColor )
    		strGold = string.format( "%s%s%s$gold$", strGoldColor, UI:Num2StrSeparatedBy3( totalPriceGold ), strBaseColor )
    	end	

	end

	local strSumCost = string.format( "%s%s%s", strGold, strCredits ~= "" and strGold ~= "" and ", " or "", strCredits )
	local strSummary = string.format( "%s%s", UI:GetStringByName( "maintenanceTooltip_summary" ), strSumCost )


	-- всё вместе

	local text = ""

	text = string.format( "%s%s%s", text, text ~= "" and "|" or "", strRepair )
	
	for idx = 1, #stringsRefill do
		text = string.format( "%s%s%s", text, text ~= "" and "|" or "", stringsRefill[ idx ] )
	end

	text = string.format( "%s%s%s", text, text ~= "" and "||" or "", strSummary )


	self.tooltipData = { caption = UI:GetStringByName( "maintenanceTooltip_caption" ), text = text, tooltipType = UI.tooltipTypes.TEXT_LARGE }

end


-- -----------------------------------------------------
-- UI.ItemControl_DurabilityIcoWnd_1080
-- -----------------------------------------------------

UI.ItemControl_DurabilityIcoWnd_1080 = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ItemControl_DurabilityIcoWnd_1080.def =
{
	className	= "Wnd",
	prototype	= "ItemControl_DurabilityIcoWnd",

	props =
	{
		name		= "ItemControl_DurabilityIcoWnd_1080",
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
				defName 			= "durabilityIco_1080",

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


-- -----------------------------------------------------
-- UI.CrossBtn
-- -----------------------------------------------------

UI.CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "CrossBtn",
    		selectSound	= UI.sounds.btnMouseOver,
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
        			defName				= "crossBtn",
        			defaultAnimation    = "idle",

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
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
	}
}


-- -----------------------------------------------------
-- UI.CrossBtn2
-- -----------------------------------------------------

UI.CrossBtn2 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",
		
		props =
		{
			name		= "CrossBtn2",
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
        			defName				= "crossBtn2",
        			defaultAnimation    = "idle",

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
	},
}

-- -----------------------------------------------------
-- UI.CrossBtn3
-- -----------------------------------------------------

UI.CrossBtn3 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",
		
		props =
		{
			name		= "CrossBtn3",
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
        			defName				= "crossBtn3",
        			defaultAnimation    = "idle",

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
	},
}


-- -----------------------------------------------------
-- UI.CrossBtn3_720
-- -----------------------------------------------------

UI.CrossBtn3_720 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",
		
		props =
		{
			name		= "CrossBtn3_720",
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
					defName				= "crossBtn3_720",
					defaultAnimation    = "idle",
		
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
	},
}

-- -----------------------------------------------------
-- UI.CrossBtn4
-- -----------------------------------------------------

UI.CrossBtn4 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",
		
		props =
		{
			name		= "CrossBtn4",
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
        			defName				= "crossBtn4",
        			defaultAnimation    = "idle",

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
	},
}

-- ----------------------------------------------------------------------------------------------------
-- UI.HelpBtn - маленькая кнопка вызова помощи;
-- сама реагирует на клик; сама скрывается, если помощи с таким именем нет
-- ----------------------------------------------------------------------------------------------------

UI.HelpBtn = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.HelpBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	
	props =
	{
		name		= "HelpBtn",
		selectSound	= UI.sounds.btnMouseOver,
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
    			defName				= "helpBtn",
    			defaultAnimation    = "idle",

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

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.HelpBtn:SetTheme( theme )

	if type( theme ) ~= "string" then
		sys.log( "UI.HelpBtn:SetTheme()[ERROR]: invalid type of the 1-st param (\"theme\"); \"string\" expected, got \"%s\"", type( theme ) )
		return
	end

	self.theme = theme

	self:UpdateState()

end


--
function UI.HelpBtn:GetTheme()

	return self.theme

end


--
function UI.HelpBtn:Reset()

	self:SetTheme( "" )

end


--
function UI.HelpBtn:GetTooltipData()

	return self.tooltipData 

end


-- -------------------------------
-- const
-- -------------------------------

UI.HelpBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

-- -------------------------------
-- vars
-- -------------------------------

UI.HelpBtn.theme		= ""
UI.HelpBtn.tooltipData	= { tooltipType = UI.tooltipTypes.TEXT_SMALL, text = UI:GetStringByName( "help" ) }

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.HelpBtn:F_PostLoad()

	UI.EffectButtonWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:UpdateState()

end


--
function UI.HelpBtn:UpdateState()

	if UI:IsHelpThemeValid( self.theme ) then
		self:RemoveStyle( UI.WS_NOT_DRAW + UI.WS_DISABLE )
	else
		self:AddStyle( UI.WS_NOT_DRAW + UI.WS_DISABLE )
	end

end


--
function UI.HelpBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if UI:IsHelpThemeValid( self.theme ) then
		UI:ShowHelp( self.theme, UI.HelpWnd.modes.USER, 1 )
	else
		sys.log( "UI.HelpBtn:F_OnMouseLButtonDown()[ERROR]: invalid theme %s; should not be reacting on mouse", tostring( self.theme ) )
	end

	-- передается дальше на обработку родителю - вдруг ему зачем-нибудь это надо знать
	return false	

end


-- ------------------------------------------------------------------------
-- UI.RefillMoneyBtn
-- ------------------------------------------------------------------------

UI.RefillMoneyBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.RefillMoneyBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "RefillMoneyBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{  
		numLayers = l_numBaseBtnLayers + 2,
		    			
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "refillMoneyBtn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "icon",
						layer		= "UI.RefillMoneyBtn.layers.MONEY_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",
						layer		= "UI.RefillMoneyBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- MONEY_ICO_EFFECT
		{
			id				= l_numBaseBtnLayers,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shop_items_slot_priceIco",
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "refillMoneyBtn" ),
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.RefillMoneyBtn:Setup( mode )

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.RefillMoneyBtn:Setup()[ERROR]: invalid 1-st param (\"mode\"); one of the \"UI.RefillMoneyBtn.modes\" values expected, golt \"%s\"", tostring( mode ) )
	end

	self:Reset()

	self.mode = mode

	self:UpdateMoneyIco()

end


--
function UI.RefillMoneyBtn:Reset()

	self.mode = -1
	self:SetLayerVisible( false, self.layers.MONEY_ICO_EFFECT )

end


--
function UI.RefillMoneyBtn:GetMode()

	return self.mode

end


-- ------------------------------
-- const
-- ------------------------------

UI.RefillMoneyBtn.layers =
{
    MAIN_EFFECT			= 0,
	DEBUG				= 1,
    MONEY_ICO_EFFECT	= 2,
    TEXT				= 3,
}

UI.RefillMoneyBtn.modes =
{
	CREDITS	= 1,
	GOLD	= 2,
}

UI.RefillMoneyBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},

	ico =
	{
		animCredits	= "money",
		animGold	= "gold",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.RefillMoneyBtn.mode = -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.RefillMoneyBtn:UpdateMoneyIco()

	if self.mode == -1 then
		self:SetLayerVisible( false, self.layer.MONEY_ICO_EFFECT )
		return
	end

	self:SetLayerVisible( true, self.layers.MONEY_ICO_EFFECT )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.MONEY_ICO_EFFECT )
	if icoEffect then

		local anim = ""

		if self.mode == self.modes.CREDITS then
			anim = self.effectInfo.ico.animCredits

		elseif self.mode == self.modes.GOLD then
			anim = self.effectInfo.ico.animGold

		else
			sys.log( "UI.RefillMoneyBtn:UpdateMoneyIco()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
		end

		icoEffect:StartAnimation( anim )

	end

end

-- ---------------------------------------------------------------------------------
-- UI.TextBtn
-- ---------------------------------------------------------------------------------

UI.TextBtn = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.TextBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "TextBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numBaseBtnLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "textBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= l_numBaseBtnLayers,

			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.TextBtn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )

end


--
function UI.TextBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.TextBtn:GetTooltipData( tooltipData )

	return self.tooltipData

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.TextBtn.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
}

UI.TextBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.TextBtn.textId		= ""
UI.TextBtn.tooltipData	= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.TextBtn:F_PostLoad()

	UI.EffectButtonWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	if self.textId ~= "" then
		self:SetBtnText( UI:GetStringByName( self.textId ) )
	end

end


-- ---------------------------------------------------------------------------------
-- UI.TextBtn2
-- ---------------------------------------------------------------------------------

UI.TextBtn2 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn2",
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
    				defName 			= "textBtn2",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	}
}

-- ---------------------------------------------------------------------------------
-- UI.TextBtn3
-- ---------------------------------------------------------------------------------

UI.TextBtn3 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn3",
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
    				defName 			= "textBtn3",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn3_1080
-- ---------------------------------------------------------------------------------

UI.TextBtn3_1080 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
	
		props =
		{
			name		= "TextBtn3_1080",
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
					defName 			= "textBtn3_1080",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
		}
	},
}

-- ---------------------------------------------------------------------------------
-- UI.TextBtn4
-- ---------------------------------------------------------------------------------

UI.TextBtn4 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn4",
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
    				defName 			= "textBtn4",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "value",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
		{
    		animationIdle 			= "idle",
    		animationSelect			= "over_nofocus",
    		animationPressed		= "press_nofocus",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "select",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
		}
	}
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn5
-- ---------------------------------------------------------------------------------

UI.TextBtn5 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn5",
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
    				defName 			= "textBtn5",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn6
-- ---------------------------------------------------------------------------------

UI.TextBtn6 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn6",
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
    				defName 			= "textBtn6",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn7
-- ---------------------------------------------------------------------------------

UI.TextBtn7 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn7",
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
    				defName 			= "textBtn7",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn8
-- ---------------------------------------------------------------------------------

UI.TextBtn8 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn8",
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
    				defName 			= "textBtn8",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn9
-- ---------------------------------------------------------------------------------

UI.TextBtn9 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn9",
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
    				defName 			= "textBtn9",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn10
-- ---------------------------------------------------------------------------------

UI.TextBtn10 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn10",
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
    				defName 			= "textBtn10",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn11
-- ---------------------------------------------------------------------------------

UI.TextBtn11 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn11",
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
    				defName 			= "textBtn11",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
		{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
		}
	}
}

-- ---------------------------------------------------------------------------------
-- UI.TextBtn12
-- ---------------------------------------------------------------------------------

UI.TextBtn12 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn12",
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
    				defName 			= "textBtn12",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
		{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
		}
	}
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn13
-- ---------------------------------------------------------------------------------

UI.TextBtn13 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn13",
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
    				defName 			= "textBtn13",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
		{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
		}
	}
}

-- ---------------------------------------------------------------------------------
-- UI.TextBtn14
-- ---------------------------------------------------------------------------------

UI.TextBtn14 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn14",
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
    				defName 			= "textBtn14",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self154",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "name1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
		{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
		}
	}
}

-- ---------------------------------------------------------------------------------
-- UI.TextBtn15
-- ---------------------------------------------------------------------------------

UI.TextBtn15 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn15",
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
    				defName 			= "textBtn15",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self153",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "name7",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

    effectInfo =
    {
    	main =
		{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "idle",
    		animationSelect_focus	= "over",
    		animationPressed_focus	= "press",
		}
	}
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn16
-- ---------------------------------------------------------------------------------

UI.TextBtn16 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn16",
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
    				defName 			= "textBtn16",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}


-- ---------------------------------------------------------------------------------
-- UI.TextBtn17
-- ---------------------------------------------------------------------------------

UI.TextBtn17 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn17",
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
    				defName 			= "textBtn17",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}

-- ---------------------------------------------------------------------------------
-- UI.TextBtn18
-- ---------------------------------------------------------------------------------

UI.TextBtn18 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
	
		props =
		{
			name		= "TextBtn18",
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
					defName 			= "textBtn18",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
		}
	},
}

-- голубая кнопка, аналогичная кнопке "отстыковка" в квестах, но в разрешении 720
-- ---------------------------------------------------------------------------------
-- UI.TextBtn19
-- ---------------------------------------------------------------------------------

UI.TextBtn19 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
	
		props =
		{
			name		= "TextBtn19",
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
					defName 			= "textBtn19",
					defaultAnimation	= "undock",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "try_text2",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},

	effectInfo =
	{
		main =
		{
			animationIdle 			= "undock",
			animationSelect			= "undock_over",
			animationPressed		= "undock_press",
			animationDisabled		= "undock_disable",
			animationIdle_focus 	= "undock_idle",
			animationSelect_focus	= "undock_over",
			animationPressed_focus	= "undock_press",
		},
	}
}

-- ---------------------------------------------------------------------------------
-- UI.ShipLevelUpIco
-- ---------------------------------------------------------------------------------

UI.ShipLevelUpIco = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipLevelUpIco.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "ShipLevelUpIco",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype		= true,
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
				defName 			= "shipLevelUpIco",
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

UI.ShipLevelUpIco.levels =
{
	MAIN_EFFECT	= 0,
}


-- ---------------------------------------------------------------------------------
-- UI.ShipLevelUpIco_1080
-- ---------------------------------------------------------------------------------

UI.ShipLevelUpIco_1080 = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipLevelUpIco_1080.def =
{
	className 	= "Wnd",
	prototype	= "ShipLevelUpIco",

	props =
	{
		name			= "ShipLevelUpIco_1080",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype		= true,
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
				defName 			= "shipLevelUpIco_1080",
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

-- ---------------------------------------------------------------------------------
-- UI.FacebookBtn
-- ---------------------------------------------------------------------------------

UI.FacebookBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.FacebookBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "FacebookBtn",
		selectSound	= UI.MsgBox.sounds.btnMouseOver,
		isPrototype	= true,
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.FacebookBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.FacebookBtn:GetTooltipData( tooltipData )

	return self.tooltipData

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.FacebookBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.FacebookBtn.tooltipData	= nil


-- отличаются размером
-- ---------------------------------------------------------------------------------
-- UI.FacebookBtn1, UI.FacebookBtn2, UI.FacebookBtn3
-- ---------------------------------------------------------------------------------

--
UI.FacebookBtn1 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "FacebookBtn",

    	props =
    	{
    		name		= "FacebookBtn1",
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
    				defName 			= "facebookBtn1",
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
}


--
UI.FacebookBtn2 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "FacebookBtn",

    	props =
    	{
    		name		= "FacebookBtn2",
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
    				defName 			= "facebookBtn2",
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
}


--
UI.FacebookBtn3 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "FacebookBtn",

    	props =
    	{
    		name		= "FacebookBtn3",
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
    				defName 			= "facebookBtn3",
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
}


-- ---------------------------------------------------------------------------------
-- UI.VKontakteBtn
-- ---------------------------------------------------------------------------------

UI.VKontakteBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.VKontakteBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "VKontakteBtn",
		selectSound	= UI.MsgBox.sounds.btnMouseOver,
		isPrototype	= true,
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.VKontakteBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.VKontakteBtn:GetTooltipData( tooltipData )

	return self.tooltipData

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.VKontakteBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.VKontakteBtn.tooltipData	= nil


-- отличаются размером
-- ---------------------------------------------------------------------------------
-- UI.VKontakteBtn1, UI.VKontakteBtn2, UI.VKontakteBtn3
-- ---------------------------------------------------------------------------------

--
UI.VKontakteBtn1 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "VKontakteBtn",

    	props =
    	{
    		name		= "VKontakteBtn1",
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
    				defName 			= "VKontakteBtn1",
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
}


--
UI.VKontakteBtn2 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "VKontakteBtn",

    	props =
    	{
    		name		= "VKontakteBtn2",
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
    				defName 			= "VKontakteBtn2",
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
}


--
UI.VKontakteBtn3 =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "VKontakteBtn",

    	props =
    	{
    		name		= "VKontakteBtn3",
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
    				defName 			= "VKontakteBtn3",
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
}

-- ---------------------------------------------------------------------------------
-- UI.ShipQuestIcoWnd
-- ---------------------------------------------------------------------------------

UI.ShipQuestIcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipQuestIcoWnd.def =
{
	className	= "ButtonWnd",

	props =
	{
		name		= "ShipQuestIcoWnd",
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
				defName 			= "shipQuestIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_buy",
						layer		= "UI.ShipQuestIcoWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small", },
			text			= UI:GetStringByName( "onShipQuest" ),
		}
	}
}

-- ------------------------------
-- interface funcions
-- ------------------------------

--
function UI.ShipQuestIcoWnd:Setup( questId )

	if type( questId ) ~= "number" then
		sys.log( "UI.ShipQuestIcoWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		return
	end

	self:Reset()

	self.questId = questId

	self:FullUpdate()

end


--
function UI.ShipQuestIcoWnd:Reset()

	self.questId		= -1
	self.tooltipData	= nil
	self.bPrevCompleted	= false
	self.prevTimeLeft	= 0

end


--
function UI.ShipQuestIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipQuestIcoWnd.strTimeLeftLabel	= UI:GetStringByName( "shipQuestIcoTooltip_timeLeft" )

UI.ShipQuestIcoWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ShipQuestIcoWnd.questId			= -1
UI.ShipQuestIcoWnd.tooltipData		= nil
UI.ShipQuestIcoWnd.bPrevCompleted	= false
UI.ShipQuestIcoWnd.prevTimeLeft		= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipQuestIcoWnd:FullUpdate()

	self:UpdateTooltip( true )

end


--
function UI.ShipQuestIcoWnd:UpdateTooltip( bForce )

	if self.questId == -1 then
		self.tooltipData = nil
		return
	end

	if not self.tooltipData then

    	self.tooltipData = {}

    	self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
    	self.tooltipData.caption		= UI:AvailableShipQuest2Str( self.questId )
		self.tooltipData.text			= ""

		bForce = true

	end

	local tooltipWnd = nil

	if not bForce then

		tooltipWnd = self:GetTooltipWnd()
		if not tooltipWnd then
			return
		end

	end

	local bCompleted = UI:IsShipQuestCompleted( self.questId )

	local timeLeft = 0
	
	if not bCompleted then

		if UI:IsShipQuestTaken( self.questId ) then
			timeLeft = UI:GetShipQuestTimeLeft( self.questId )
		else
			timeLeft = UI:GetShipQuestMaxTime( self.questId )
		end

	end

	if not bForce then	

		if bCompleted == self.bPrevCompleted and timeLeft == self.prevTimeLeft then
			return
		end

	end

	if bCompleted then
		self.tooltipData.text = UI:GetStringByName( "shipQuestIcoTooltip_completed" )		
	else
		local strTimeLeft = UI:Time2Str421( timeLeft )
		self.tooltipData.text = string.format( "%s: %s", self.strTimeLeftLabel, strTimeLeft )
	end
	
	if tooltipWnd then
		tooltipWnd:Setup( self.tooltipData, true )
	end

	self.bPrevCompleted	= bCompleted
	self.prevTimeLeft	= timeLeft

end


--
function UI.ShipQuestIcoWnd:GetTooltipWnd()

	local tooltipTargetWnd = UI:GetCurTooltipTarget()
	if tooltipTargetWnd ~= self then
		return nil
	end

	return UI:GetCurTooltip()

end


--
function UI.ShipQuestIcoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.questId ~= -1 then
		self:UpdateTooltip( false )
	end

end


-- ----------------------------------------------------------------------------
-- UI.ShipPartIcoWnd
-- ----------------------------------------------------------------------------

UI.ShipPartIcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipPartIcoWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "ShipPartIcoWnd",
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
				defName 			= "shipPartIco_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "frame",
						layer		= "UI.ShipPartIcoWnd.layers.FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "blink",
						layer		= "UI.ShipPartIcoWnd.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "ship_ico",
						layer		= "UI.ShipPartIcoWnd.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count",
						layer		= "UI.ShipPartIcoWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shipPartIco_frame",
				defaultAnimation	= "idle",
			}}
		},

		-- BLINK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shipPartIco_blink",
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

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipPartIcoWnd:Setup( defName, count, bBlink )

	self:Reset()

	if type( defName ) ~= "string" then
		sys.log( "UI.ShipPartIcoWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if count ~= nil then
    	if type( count ) ~= "number" then
    		sys.log( "UI.ShipPartIcoWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"count\"); \"number\" or \"nil\" expected, got \"%s\"", type( count ) )
			count = nil
    	end
	end

	if count == nil then
		count = 1
	end

	if bBlink ~= nil then
    	if type( bBlink ) ~= "boolean" then
    		sys.log( "UI.ShipPartIcoWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"bBlink\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bBlink ) )
			bBlink = nil
    	end
	end

	if bBlink == nil then
		bBlink = false
	end

	self.defName	= defName
	self.count		= count
	self.bBlink		= bBlink

	self:FullUpdate()

end


--
function UI.ShipPartIcoWnd:Reset()

	self.defName		= ""
	self.count			= 0
	self.bBlink			= false
	self.tooltipData	= nil

	local frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetColor( UI.WHITE_COLOR )
	end

	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if shipIcoEffect then
		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	
	self:SetText( "", self.layers.COUNT )

end


--
function UI.ShipPartIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipPartIcoWnd.layers =
{
    MAIN_EFFECT		= 0,
    FRAME_EFFECT	= 1,
    BLINK_EFFECT	= 2,
    SHIP_ICO_EFFECT	= 3,
    COUNT			= 4,
}

UI.ShipPartIcoWnd.effectInfo =
{
	shipIco =
	{
		spriteName	= "ico_ship"
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ShipPartIcoWnd.defName		= ""
UI.ShipPartIcoWnd.count			= 0
UI.ShipPartIcoWnd.bBlink		= false
UI.ShipPartIcoWnd.tooltipData	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipPartIcoWnd:FullUpdate()

	self:UpdateFrame()
	self:UpdateBlinkEffect()
	self:UpdateShipIco()
	self:UpdateCount()
	self:UpdateTooltip()

end


--
function UI.ShipPartIcoWnd:UpdateFrame()

	local color = UI:GetItemColor( self.defName, false )

	local frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetColor( color )
	end

end


--
function UI.ShipPartIcoWnd:UpdateBlinkEffect()

	self:SetLayerVisible( self.bBlink, self.layers.BLINK_EFFECT )

	if self.bBlink then

    	local blinkEffect = UI:GetEffectFromLayer( self, self.layers.BLINK_EFFECT )
    	if blinkEffect then
    		blinkEffect:SetAnimationTimeAndUpdate( 0 )
    	end	

	end

end


--
function UI.ShipPartIcoWnd:UpdateShipIco()

	local hTex = UI.INVALID_RESOURCE_HANDLE

	local shipDefName = UI:GetShipPartShip( self.defName )
	if shipDefName ~= "" then
		hTex = UI:GetShipIco( shipDefName )
	else
		sys.log( "UI.ShipPartIcoWnd:UpdateShipIco()[ERROR]: canot find ship built by \"%s\"", self.defName )
		hTex = UI:GetTex( "NoData" )
	end

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if shipIcoEffect then
		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.spriteName, hTex )
	end

end


--
function UI.ShipPartIcoWnd:UpdateCount()

	local strCount =
		self.count > 1
			and UI:Num2StrSeparatedBy3( self.count )
			or ""

	self:SetText( strCount, self.layers.COUNT )

end


--
function UI.ShipPartIcoWnd:UpdateTooltip()

	self.tooltipData = UI:GetTooltipForItem( self.defName )

end


-- ----------------------------------------------------------------------------
-- UI.SpecModulePartIcoWnd
-- ----------------------------------------------------------------------------

UI.SpecModulePartIcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.SpecModulePartIcoWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "SpecModulePartIcoWnd",
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
				defName 			= "shipPartIco_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "frame",
						layer		= "UI.SpecModulePartIcoWnd.layers.FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ship_ico",
						layer		= "UI.SpecModulePartIcoWnd.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "rank",
						layer		= "UI.SpecModulePartIcoWnd.layers.SHIP_RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "count",
						layer		= "UI.SpecModulePartIcoWnd.layers.COUNT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shipPartIco_frame",
				defaultAnimation	= "idle_2",
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

		-- SHIP_RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.SpecModulePartIcoWnd:Setup( shipDefName, count )

	self:Reset()

	if type( shipDefName ) ~= "string" then
		sys.log( "UI.SpecModulePartIcoWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"shipDefName\"); \"string\" expected, got \"%s\"", type( shipDefName ) )
		return
	end

	if shipDefName == "" then
		sys.log( "UI.SpecModulePartIcoWnd:Setup()[ERROR]: empty ship def name" )
		return
	end

	if count ~= nil then
    	if type( count ) ~= "number" then
    		sys.log( "UI.SpecModulePartIcoWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"count\"); \"number\" or \"nil\" expected, got \"%s\"", type( count ) )
			count = nil
    	end
	end

	if count == nil then
		count = 1
	end

	self.shipDefName	= shipDefName
	self.count		= count

	self:FullUpdate()

end


--
function UI.SpecModulePartIcoWnd:Reset()

	self.shipDefName		= ""
	self.count			= 0
	self.tooltipData	= nil

	local frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetColor( UI.WHITE_COLOR )
	end

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if shipIcoEffect then
		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.SHIP_RANK )
	self:SetText( "", self.layers.COUNT )

end


--
function UI.SpecModulePartIcoWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.SpecModulePartIcoWnd:GetShipDefName()

	return self.shipDefName

end


--
function UI.SpecModulePartIcoWnd:GetCount()

	return self.count

end


-- ------------------------------
-- const
-- ------------------------------

UI.SpecModulePartIcoWnd.layers =
{
    MAIN_EFFECT		= 0,
    FRAME_EFFECT	= 1,
    SHIP_ICO_EFFECT	= 2,
    SHIP_RANK		= 3,
    COUNT			= 4,
}

UI.SpecModulePartIcoWnd.effectInfo =
{
	shipIco =
	{
		spriteName	= "ico_ship"
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.SpecModulePartIcoWnd.shipDefName	= ""
UI.SpecModulePartIcoWnd.count		= 0
UI.SpecModulePartIcoWnd.tooltipData	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.SpecModulePartIcoWnd:FullUpdate()

	self:UpdateFrame()
	self:UpdateShipIco()
	self:UpdateShipRank()
	self:UpdateCount()
	self:UpdateTooltip()

end


--
function UI.SpecModulePartIcoWnd:UpdateFrame()

	local color = UI:GetItemColor( self.shipDefName, false )

	local frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetColor( color )
	end

end


--
function UI.SpecModulePartIcoWnd:UpdateShipIco()

	local hTex = UI:GetShipIco( self.shipDefName )

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if shipIcoEffect then
		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.spriteName, hTex )
	end

end


--
function UI.SpecModulePartIcoWnd:UpdateShipRank()

	local rank = UI:GetShipRank( self.shipDefName )

	local strRank =
		rank ~= -1
			and tostring( rank )
			or ""

	self:SetText( strRank, self.layers.SHIP_RANK )

end


--
function UI.SpecModulePartIcoWnd:UpdateCount()

	local strCount =
		self.count > 1
			and UI:Num2StrSeparatedBy3( self.count )
			or ""

	self:SetText( strCount, self.layers.COUNT )

end


--
function UI.SpecModulePartIcoWnd:UpdateTooltip()

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.SPEC_MODULE_PARTS,
		shipDefName	= self.shipDefName,
	}

end