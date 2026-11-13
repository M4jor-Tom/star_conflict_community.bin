-- ----------------------------------------------------------------------------
--
-- Workfile: clientstatswnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ClientStatsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ClientStatsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ClientStatsWnd",
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
				defName 			= "clientStats_main",
				defaultAnimation	= "idle",
			}}
		},  
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ClientStatsWnd:OnClientStatsToggleBind()

	if not self:IsOnScreen() then
		return
	end

	self:ToggleItemsSet()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ClientStatsWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.ClientStatsWnd.itemTypes =
{
	FPS			= 1,
	PING		= 2,
	LOSS_RATE	= 4,
	REGION		= 8,
	CAMERA		= 16,
}

UI.ClientStatsWnd.itemsSets =
{
	0,
	UI.ClientStatsWnd.itemTypes.FPS + UI.ClientStatsWnd.itemTypes.PING + UI.ClientStatsWnd.itemTypes.LOSS_RATE,
	UI.ClientStatsWnd.itemTypes.FPS + UI.ClientStatsWnd.itemTypes.REGION + UI.ClientStatsWnd.itemTypes.CAMERA,
}

UI.ClientStatsWnd.DEFAULT_ITEMS_SET_ID = 1

UI.ClientStatsWnd.effectInfo =
{
	main =
	{
		firstSlotLocator	= "fps_info",
		secondSlotLocator	= "ping_info",
	}
}

UI.ClientStatsWnd.fpsSlotPrototypeName		= "ClientStats_FpsSlotWnd"
UI.ClientStatsWnd.pingSlotPrototypeName		= "ClientStats_PingSlotWnd"
UI.ClientStatsWnd.lossRateSlotPrototypeName	= "ClientStats_LossRateSlotWnd"
UI.ClientStatsWnd.regionSlotPrototypeName	= "ClientStats_RegionSlotWnd"
UI.ClientStatsWnd.cameraSlotPrototypeName	= "ClientStats_CameraSlotWnd"

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ClientStatsWnd.itemsSetId	= -1
UI.ClientStatsWnd.allSlots		= {}
UI.ClientStatsWnd.curSetSlots	= {}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ClientStatsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.allSlots		= {}
	self.curSetSlots	= {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self:Reset()

end


--
function UI.ClientStatsWnd:CreateControls()

	self.allSlots[ UI.ClientStatsWnd.itemTypes.FPS ]		= UI:CreateChildWnd( self, UI[ self.fpsSlotPrototypeName  ],		"" )
    self.allSlots[ UI.ClientStatsWnd.itemTypes.PING ]		= UI:CreateChildWnd( self, UI[ self.pingSlotPrototypeName ],		"" )
    self.allSlots[ UI.ClientStatsWnd.itemTypes.LOSS_RATE ]	= UI:CreateChildWnd( self, UI[ self.lossRateSlotPrototypeName ],	"" )
    self.allSlots[ UI.ClientStatsWnd.itemTypes.REGION ]		= UI:CreateChildWnd( self, UI[ self.regionSlotPrototypeName ],		"" )
    self.allSlots[ UI.ClientStatsWnd.itemTypes.CAMERA]		= UI:CreateChildWnd( self, UI[ self.cameraSlotPrototypeName],		"" )

end


--
function UI.ClientStatsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ClientStatsWnd:FullUpdate()

	self:Reset()	

	self:UpdateItemsSet()

end


--
function UI.ClientStatsWnd:Reset()

	self.itemsSetId = -1

	self:ResetSlots()

end


--
function UI.ClientStatsWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.curSetSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()		
	end

	self.curSetSlots = {}

end


--
function UI.ClientStatsWnd:UpdateItemsSet()

	if not self:RestoreItemsSet() then
		self:SetDefaultItemsSet()
	end

end


--
function UI.ClientStatsWnd:RestoreItemsSet()

	local profile = _G.GetProfileTable()

	local itemsSetId = -1

	if type( profile.clientStatsMode ) == "number" and profile.clientStatsMode >= 1 and profile.clientStatsMode <= #self.itemsSets then
		itemsSetId = profile.clientStatsMode
	end

	if itemsSetId ~= -1 then
		self:SetItemsSet( itemsSetId )
		return true
	else
		return false
	end	

end


--
function UI.ClientStatsWnd:SetDefaultItemsSet()

	self:SetItemsSet( self.DEFAULT_ITEMS_SET_ID )

end


--
function UI.ClientStatsWnd:SaveItemsSet()

	if self.itemsSetId == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if profile.clientStatsMode ~= self.itemsSetId then
		profile.clientStatsMode = self.itemsSetId
		Profile:Save()
	end

end


--
function UI.ClientStatsWnd:SetItemsSet( itemsSetId )

	if itemsSetId == self.itemsSetId then
		return
	end

	self:ResetSlots()

	self.itemsSetId = itemsSetId
	self.curSetSlots = self:GetSlotsForItemsSet( itemsSetId, false )

	self:SaveItemsSet()

end


--
function UI.ClientStatsWnd:GetSlotsForItemsSet( itemsSetId, bVisibleOnly )

	local slots = {}

	if itemsSetId == -1 then
		return slots
	end

	local itemTypesOrder = {}
	for itemTypeName, itemType in pairs( self.itemTypes ) do
		table.insert( itemTypesOrder, itemType )
	end
	table.sort( itemTypesOrder )

	local itemsForSet = self.itemsSets[ itemsSetId ]

	for itemTypeIdx = 1, #itemTypesOrder do

		local itemType = itemTypesOrder[ itemTypeIdx ]
	    local bIsItemInSet = bit.band( itemsForSet, itemType ) == itemType

		if bIsItemInSet then

    		local slotWnd = self.allSlots[ itemType ]
			if slotWnd then

				local bFit = true
				if bVisibleOnly then
					bFit = slotWnd:CanShow()
				end

				if bFit then
					table.insert( slots, slotWnd )
				end

			end

		end

	end   

	return slots

end


--
function UI.ClientStatsWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local firstSlot = self.allSlots[ self.itemTypes.FPS ]
	local firstSlotMainEffect = UI:GetEffectFromLayer( firstSlot, firstSlot.layers.MAIN_EFFECT )

	local firstLocatorPos	= mainEffect:GetObjPos( self.effectInfo.main.firstSlotLocator )
	local secondLocatorPos	= mainEffect:GetObjPos( self.effectInfo.main.secondSlotLocator )
	local selfSizeLocator	= mainEffect:GetObjSize( "self" )
	local firstSlotSize		= firstSlotMainEffect:GetObjSize( "self" )

	local y						= firstLocatorPos.y
	local space_slots			= secondLocatorPos.x - ( firstLocatorPos.x + firstSlotSize.x )
	local slotsWidth			= 0
	local space_screen_slots	= firstLocatorPos.x

	local x				= space_screen_slots
	local lastSlotX1	= space_screen_slots

	for slotIdx = 1, #self.curSetSlots do

		local slotWnd = self.curSetSlots[ slotIdx ]

		if slotWnd:IsChildOf( self ) then

    		slotWnd:SetPos( x, y )

    		lastSlotX1 = x + slotWnd:GetWidth()
    		x = lastSlotX1 + space_slots

		end

	end

	self:SetHeight( selfSizeLocator.y )
	self:SetWidth( lastSlotX1 + space_screen_slots )

end


--
function UI.ClientStatsWnd:ToggleItemsSet()

	if self.itemsSetId == -1 then
		return
	end

	-- если после преключения режима не оказывается слотов для отображения (для их показа нет условий), но они предусмотрены,
	-- либо если состав слотов оказался полностью аналогичен предыдущему режиму,
	-- то пытается переключиться на следующий режим

	local newItemsSetId	= self.itemsSetId

	local visibleSlots = {}
	for slotIdx, slotWnd in pairs( self.curSetSlots ) do
		if slotWnd:IsChildOf( self ) then
			table.insert( visibleSlots, slotWnd )
		end
	end

	local oldItems		= self:GetItemsSetFromSlots( visibleSlots )
	local itemsSetId	= self.itemsSetId
	local numSets		= #self.itemsSets

	for try = 1, numSets do

		itemsSetId = math.fmod( itemsSetId, numSets ) + 1

		local slots = self:GetSlotsForItemsSet( itemsSetId, true )		
		local items = self:GetItemsSetFromSlots( slots )

		local needItems = self.itemsSets[ itemsSetId ]

		if ( items ~= 0 or needItems == 0 ) and items ~= oldItems then
			newItemsSetId = itemsSetId
			break
		end

	end

	self:SetItemsSet( newItemsSetId )

end


--
function UI.ClientStatsWnd:GetItemsSetFromSlots( slots )

	local itemsSet = 0

	for slotIdx, slotWnd in pairs( slots ) do
		local itemType = slotWnd:GetItemType()
		itemsSet = bit.bor( itemsSet, itemType )
	end

	return itemsSet

end


--
function UI.ClientStatsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local bNeedRecalcLayout = false

	for slotIdx, slotWnd in pairs( self.curSetSlots ) do

		local bNeedVisible	= slotWnd:Update( dt_sys )
		local bIsVisible	= slotWnd:IsChildOf( self )

		if bNeedVisible and not bIsVisible then

			self:AddChild( slotWnd )
			bNeedRecalcLayout = true

		elseif not bNeedVisible and bIsVisible then

			slotWnd:UnlinkFromParent()
			bNeedRecalcLayout = true

		end
		
	end

	if bNeedRecalcLayout then
		self:RecalcLayout()
	end

end


-- ---------------------------------------------------------------------
-- UI.ClientStats_SlotWnd
-- ---------------------------------------------------------------------

UI.ClientStats_SlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ClientStats_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ClientStats_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

-- for override
function UI.ClientStats_SlotWnd:Reset()
end


--
function UI.ClientStats_SlotWnd:CanShow()

	return self:UpdateInternal( false )

end


--
function UI.ClientStats_SlotWnd:GetItemType()

	return self.itemType

end


--
function UI.ClientStats_SlotWnd:Update( dt )

	return self:UpdateInternal( true, dt )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ClientStats_SlotWnd.itemType = -1


-- ---------------------------------
-- work functions
-- ---------------------------------

-- for override
-- возвращает true/false - может быть показано или нет;
-- если bDoUpdate=false, то реального апдейта не происохоит, только возвращается надо или нет показывать

function UI.ClientStats_SlotWnd:UpdateInternal( bDoUpdate, dt )

	return false

end


-- ---------------------------------------------------------------------
-- UI.ClientStats_FpsSlotWnd
-- ---------------------------------------------------------------------

UI.ClientStats_FpsSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ClientStats_FpsSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ClientStats_SlotWnd",

	props =
	{
		name		= "ClientStats_FpsSlotWnd",
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
				defName 			= "clientStats_fpsSlot",
				defaultAnimation	= "warning",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ClientStats_FpsSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value",
						layer		= "UI.ClientStats_FpsSlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "clientStats_fps" )
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

-- ---------------------------------
-- inerface functions
-- ---------------------------------

-- 
function UI.ClientStats_FpsSlotWnd:Reset()

	self.fps = 1e-9

	self:SetText( "", self.layers.VAL )

end

-- ---------------------------------
-- const
-- ---------------------------------

UI.ClientStats_FpsSlotWnd.itemType = UI.ClientStatsWnd.itemTypes.FPS

UI.ClientStats_FpsSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	VAL			= 2,
}

UI.ClientStats_FpsSlotWnd.effectInfo =
{
	main =
	{
		animNormal	= "warning",
		animGood	= "idle",
		animBad		= "crit",
	}
}

UI.ClientStats_FpsSlotWnd.GOOD_THRES	= 55
UI.ClientStats_FpsSlotWnd.BAD_THRES		= 30

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ClientStats_FpsSlotWnd.fps			= 1e-9
UI.ClientStats_FpsSlotWnd.animIdNormal	= -1
UI.ClientStats_FpsSlotWnd.animIdGood	= -1
UI.ClientStats_FpsSlotWnd.animIdBad		= -1
UI.ClientStats_FpsSlotWnd.mainEffect	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ClientStats_FpsSlotWnd:F_PostLoad()

	UI.ClientStats_SlotWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.animIdNormal	= self.mainEffect:GetAnimationId( self.effectInfo.main.animNormal )
	self.animIdGood		= self.mainEffect:GetAnimationId( self.effectInfo.main.animGood )
	self.animIdBad		= self.mainEffect:GetAnimationId( self.effectInfo.main.animBad )

end


--
function UI.ClientStats_FpsSlotWnd:UpdateInternal( bDoUpdate, dt )

	local bNeedVisible = true

	if bDoUpdate and bNeedVisible then

		self.fps = UI:GetFps()

    	self:UpdateText()
    	self:UpdateAnimation()

	end

	return bNeedVisible

end


--
function UI.ClientStats_FpsSlotWnd:UpdateText()

	local str = string.format( "%.1f", self.fps )
	self:SetText( str, self.layers.VAL )

end


--
function UI.ClientStats_FpsSlotWnd:UpdateAnimation()

	local animId = -1

	if self.fps >= self.GOOD_THRES then
		animId = self.animIdGood
	elseif self.fps <= self.BAD_THRES then
		animId = self.animIdBad
	else
		animId = self.animIdNormal
	end

	if animId ~= -1 and animId ~= self.mainEffect:GetCurAnimationId() then
		self.mainEffect:StartAnimationById( animId )
	end

end


-- ---------------------------------------------------------------------
-- UI.ClientStats_PingSlotWnd
-- ---------------------------------------------------------------------

UI.ClientStats_PingSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ClientStats_PingSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ClientStats_SlotWnd",

	props =
	{
		name		= "ClientStats_PingSlotWnd",
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
				defName 			= "clientStats_pingSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ClientStats_PingSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value",
						layer		= "UI.ClientStats_PingSlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "clientStats_ping" )
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

-- ---------------------------------
-- inerface functions
-- ---------------------------------

-- 
function UI.ClientStats_PingSlotWnd:Reset()

	self.ping = -1
	self:SetText( "", self.layers.VAL )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ClientStats_PingSlotWnd.itemType = UI.ClientStatsWnd.itemTypes.PING

UI.ClientStats_PingSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	VAL			= 2,
}

UI.ClientStats_PingSlotWnd.effectInfo =
{
	main =
	{
		animNormal	= "warning",
		animGood	= "idle",
		animBad		= "crit",
	}
}

UI.ClientStats_PingSlotWnd.GOOD_THRES	= 80
UI.ClientStats_PingSlotWnd.BAD_THRES	= 130

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ClientStats_PingSlotWnd.ping			= -1
UI.ClientStats_PingSlotWnd.animIdNormal	= -1
UI.ClientStats_PingSlotWnd.animIdGood	= -1
UI.ClientStats_PingSlotWnd.animIdBad	= -1
UI.ClientStats_PingSlotWnd.mainEffect	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ClientStats_PingSlotWnd:F_PostLoad()

	UI.ClientStats_SlotWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.animIdNormal	= self.mainEffect:GetAnimationId( self.effectInfo.main.animNormal )
	self.animIdGood		= self.mainEffect:GetAnimationId( self.effectInfo.main.animGood )
	self.animIdBad		= self.mainEffect:GetAnimationId( self.effectInfo.main.animBad )

end


--
function UI.ClientStats_PingSlotWnd:UpdateInternal( bDoUpdate, dt )

	local ping = _G.GetNetPing()
	local bNeedVisible = ping >= 0 

	if bDoUpdate and bNeedVisible then

		self.ping = ping

		self:UpdateText()
		self:UpdateAnimation()

	end

	return bNeedVisible

end


--
function UI.ClientStats_PingSlotWnd:UpdateText()

	local str = ""

	if self.ping >= 0 then
		str = tostring( self.ping )
	end

	self:SetText( str, self.layers.VAL )

end


--
function UI.ClientStats_PingSlotWnd:UpdateAnimation()

	if self.ping < 0 then
		return
	end

	local animId = -1

	if self.ping <= self.GOOD_THRES then
		animId = self.animIdGood
	elseif self.ping >= self.BAD_THRES then
		animId = self.animIdBad
	else
		animId = self.animIdNormal
	end

	if animId ~= -1 and animId ~= self.mainEffect:GetCurAnimationId() then
		self.mainEffect:StartAnimationById( animId )
	end

end


-- ---------------------------------------------------------------------
-- UI.ClientStats_LossRateSlotWnd
-- ---------------------------------------------------------------------

UI.ClientStats_LossRateSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ClientStats_LossRateSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ClientStats_SlotWnd",

	props =
	{
		name		= "ClientStats_LossRateSlotWnd",
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
				defName 			= "clientStats_lossRateSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ClientStats_LossRateSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value",
						layer		= "UI.ClientStats_LossRateSlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "clientStats_lossRate" )
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

-- ---------------------------------
-- inerface functions
-- ---------------------------------

-- 
function UI.ClientStats_LossRateSlotWnd:Reset()

	self.lossRate = 0
	self:SetText( "", self.layers.VAL )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ClientStats_LossRateSlotWnd.itemType = UI.ClientStatsWnd.itemTypes.LOSS_RATE

UI.ClientStats_LossRateSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	VAL			= 2,
}

UI.ClientStats_LossRateSlotWnd.effectInfo =
{
	main =
	{
		animNormal	= "warning",
		animGood	= "idle",
		animBad		= "crit",
	}
}

UI.ClientStats_LossRateSlotWnd.GOOD_THRES	= 0.03
UI.ClientStats_LossRateSlotWnd.BAD_THRES	= 0.15

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ClientStats_LossRateSlotWnd.lossRate		= 0
UI.ClientStats_LossRateSlotWnd.animIdNormal	= -1
UI.ClientStats_LossRateSlotWnd.animIdGood	= -1
UI.ClientStats_LossRateSlotWnd.animIdBad	= -1
UI.ClientStats_LossRateSlotWnd.mainEffect	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ClientStats_LossRateSlotWnd:F_PostLoad()

	UI.ClientStats_SlotWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.animIdNormal	= self.mainEffect:GetAnimationId( self.effectInfo.main.animNormal )
	self.animIdGood		= self.mainEffect:GetAnimationId( self.effectInfo.main.animGood )
	self.animIdBad		= self.mainEffect:GetAnimationId( self.effectInfo.main.animBad )

end


--
function UI.ClientStats_LossRateSlotWnd:UpdateInternal( bDoUpdate, dt )

	local lossRate = _G.GetNetLossRate()
	local bNeedVisible = lossRate >= 0.01 

	if bDoUpdate and bNeedVisible then

		self.lossRate = lossRate

		self:UpdateText()
		self:UpdateAnimation()

	end

	return bNeedVisible

end


--
function UI.ClientStats_LossRateSlotWnd:UpdateText()

	local str = string.format( "%d%%", UI:RoundClampOne( self.lossRate * 100 ) ) 
	self:SetText( str, self.layers.VAL )

end


--
function UI.ClientStats_LossRateSlotWnd:UpdateAnimation()

	local animId = -1

	if self.lossRate <= self.GOOD_THRES then
		animId = self.animIdGood
	elseif self.lossRate >= self.BAD_THRES then
		animId = self.animIdBad
	else
		animId = self.animIdNormal
	end

	if animId ~= -1 and animId ~= self.mainEffect:GetCurAnimationId() then
		self.mainEffect:StartAnimationById( animId )
	end

end


-- ---------------------------------------------------------------------
-- UI.ClientStats_RegionSlotWnd
-- ---------------------------------------------------------------------

UI.ClientStats_RegionSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ClientStats_RegionSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ClientStats_SlotWnd",

	props =
	{
		name		= "ClientStats_RegionSlotWnd",
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
				defName 			= "clientStats_regionSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ClientStats_RegionSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value",
						layer		= "UI.ClientStats_RegionSlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "clientStats_region" )
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

-- ---------------------------------
-- inerface functions
-- ---------------------------------

-- 
function UI.ClientStats_RegionSlotWnd:Reset()

	self.region = -1
	self:SetText( "", self.layers.VAL )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ClientStats_RegionSlotWnd.itemType = UI.ClientStatsWnd.itemTypes.REGION

UI.ClientStats_RegionSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	VAL			= 2,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ClientStats_RegionSlotWnd.region		= -1

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ClientStats_RegionSlotWnd:UpdateInternal( bDoUpdate, dt )

	local region = _G.GetNetRegion()
	if region == _G.MasterServer.AuthRegion.AR_UNKNOWN or region == _G.MasterServer.AuthRegion.AR_NUM then
		region = -1
	end

	local bNeedVisible = region ~= -1

	if bDoUpdate and bNeedVisible then

		if region ~= self.region then
			self.region = region
			self:UpdateText()
		end

	end

	return bNeedVisible

end


--
function UI.ClientStats_RegionSlotWnd:UpdateText()

	local str = ""

	if self.region ~= -1 then
		str = UI:Region2Str( self.region )
	end

	self:SetText( str, self.layers.VAL )

end


-- ---------------------------------------------------------------------
-- UI.ClientStats_CameraSlotWnd
-- ---------------------------------------------------------------------

UI.ClientStats_CameraSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ClientStats_CameraSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ClientStats_SlotWnd",

	props =
	{
		name		= "ClientStats_CameraSlotWnd",
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
				defName 			= "clientStats_cameraSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ClientStats_CameraSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_1",
						layer		= "UI.ClientStats_CameraSlotWnd.layers.VAL_X",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_2",
						layer		= "UI.ClientStats_CameraSlotWnd.layers.VAL_Y",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value_3",
						layer		= "UI.ClientStats_CameraSlotWnd.layers.VAL_Z",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "clientStats_camera" )
		},  

		-- VAL_X
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- VAL_Y
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- VAL_Z
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	}
}

-- ---------------------------------
-- inerface functions
-- ---------------------------------

-- 
function UI.ClientStats_CameraSlotWnd:Reset()

	self.pos = Vec3( 0, 0, 0 )

	self:SetText( "", self.layers.VAL_X )
	self:SetText( "", self.layers.VAL_Y )
	self:SetText( "", self.layers.VAL_Z )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ClientStats_CameraSlotWnd.itemType = UI.ClientStatsWnd.itemTypes.CAMERA

UI.ClientStats_CameraSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	VAL_X		= 2,
	VAL_Y		= 3,
	VAL_Z		= 4,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ClientStats_CameraSlotWnd.pos	= Vec3( 0, 0, 0 )

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ClientStats_CameraSlotWnd:F_PostLoad()

	UI.ClientStats_SlotWnd.F_PostLoad( self )

	self.pos = Vec3( 0, 0, 0 )

end


--
function UI.ClientStats_CameraSlotWnd:UpdateInternal( bDoUpdate, dt )

	local bNeedVisible = true

	if bDoUpdate and bNeedVisible then
		self.pos = _G.GetCameraPos()
		self:UpdateText()
	end

	return bNeedVisible

end


--
function UI.ClientStats_CameraSlotWnd:UpdateText()

	local strX = string.format( "%.1f", self.pos.x )
	local strY = string.format( "%.1f", self.pos.y )
	local strZ = string.format( "%.1f", self.pos.z )

	self:SetText( strX, self.layers.VAL_X )
	self:SetText( strY, self.layers.VAL_Y )
	self:SetText( strZ, self.layers.VAL_Z )

end


-- --------------------------------------------------------------------
-- UI.HangarClientStatsWnd
-- --------------------------------------------------------------------

UI.HangarClientStatsWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HangarClientStatsWnd.def =
{
	className	= "Wnd",
	prototype	= "ClientStatsWnd",

	props =
	{
		name	= "HangarClientStatsWnd"
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HangarClientStatsWnd:IsStatsVisible()

	return self:GetFirstChild() ~= nil

end


-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HangarClientStatsWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:NotifyParentOnSlotsChanged()

end


--
function UI.HangarClientStatsWnd:F_OnAfterRemoveChild( child )

	self:OnAfterRemoveChild( child )

	if not UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then
		self:NotifyParentOnSlotsChanged()
	end

end


--
function UI.HangarClientStatsWnd:NotifyParentOnSlotsChanged()

	UI.HangarWnd:OnClientStatsSlotsChanged()

end


-- --------------------------------------------------------------------
-- UI.HudClientStatsWnd
-- --------------------------------------------------------------------

UI.HudClientStatsWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ClientStatsWnd",

		props =
		{
			name	= "HudClientStatsWnd"
		}
	},
}