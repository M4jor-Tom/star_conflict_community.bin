-- ----------------------------------------------------------------------------
--
-- Workfile: shipcustomizationwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ShipCustomizationWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipCustomizationWnd.layers =
{
	MAIN_EFFECT			= 0,
	BG_EFFECT           = 1,
	CAPTION				= 2,
	SUMMARY_EFFECT		= 3,
	SUMMARY_COST_LABEL	= 4,
	SUMMARY_COST_VAL	= 5,
	WAIT_EFFECT			= 6,
	WAIT_TEXT			= 7,
}


UI.ShipCustomizationWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name	= "ShipCustomizationWnd"
	},

	layers =
	{
		firstOverlayLayer = UI.ShipCustomizationWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shipCustomization_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ShipCustomizationWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "tree_list",	
						wnd			= "UI.ShipCustomization_TabsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sticker_list",	
						wnd			= "UI.ShipCustomization_ItemsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.ShipCustomization_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "load_modules",	
						layer		= "UI.ShipCustomizationWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sort_btn1",	
						wnd			= "UI.ShipCustomization_ActionBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "total_price",	
						layer		= "UI.ShipCustomizationWnd.layers.SUMMARY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- legacy from FullScreenWnd
		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "customization_caption" )
		},

		-- SUMMARY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_summary",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_1",
						layer		= "UI.ShipCustomizationWnd.layers.SUMMARY_COST_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",
						layer		= "UI.ShipCustomizationWnd.layers.SUMMARY_COST_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SUMMARY_COST_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "customization_summaryCost" )
		},

		-- SUMMARY_COST_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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
						layer		= "UI.ShipCustomizationWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text 			= UI:GetStringByName( "hangar_loading" ),
		},   
	},

	children =
	{
		"UI.ShipCustomization_TabsListWnd",
		"UI.ShipCustomization_ItemsListWnd",
		"UI.ShipCustomization_ActionBtn",
		"UI.ShipCustomization_CrossBtn",
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.ShipCustomizationWnd:GetPrevHangarMenuTab()

	return self.prevHangarMenuTab

end


--
function UI.ShipCustomizationWnd:SetupPrevHangarMenuTab( prevHangarMenuTab )

	self.prevHangarMenuTab = prevHangarMenuTab

end


--
function UI.ShipCustomizationWnd:GetSelShipItem()

	return self.selShipItem

end


-- called from UI.HangarWnd
function UI.ShipCustomizationWnd:OnHangarSelShipChanged()

	if not self:IsOnScreen() then
		return
	end

	-- перед запуском уровня приходит GameStore_OnOwnedVessels(), при этом ангар еще на экране, и окно кастомизации тоже может быть на экране
--	sys.log( "UI.ShipCustomizationWnd:OnHangarSelShipChanged()[ERROR]: this isn't supposed to happen..." )

	self:FullUpdate()

end


--
function UI.ShipCustomizationWnd:OnShipEntChanged()

	if not self:IsOnScreen() then
		return
	end

	self.selShipEntId = UI.HangarWnd:GetSelShipEntId()
	self:Preview()

end


--
function UI.ShipCustomizationWnd:GetItemPrice( customizationType, itemData )

	if not self.selShipItem	then
		sys.log( "UI.ShipCustomizationWnd:GetItemPrice()[ERROR]: no ship" )
		return 0, false
	end

	return UI:GetShipCustomizationPrice( itemData.itemName, self.selShipItem.defName )
	
end


--
function UI.ShipCustomizationWnd:GetUserChoice( customizationType )

	return self.userChoices[ customizationType ]

end


--
function UI.ShipCustomizationWnd:GetUserChoiceItemData( customizationType, bNotAppliedOnly )

	if bNotAppliedOnly == nil then
		bNotAppliedOnly = false
	end

	local itemData = self.userChoices[ customizationType ] and self.userChoices[ customizationType ].itemData

	if itemData and itemData.bApplied and bNotAppliedOnly then
		itemData = nil
	end

	return itemData

end


--
function UI.ShipCustomizationWnd:GetUserChoiceItemName( customizationType, bNotAppliedOnly )

	local itemData = self:GetUserChoiceItemData( customizationType, bNotAppliedOnly )

	if itemData then
		return itemData.itemName
	else
		return nil
	end

end


--
function UI.ShipCustomizationWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.buyRequestId = 0
	self:UpdateWaitEffect()
	self:CheckResetBuyInfo()

end


--
function UI.ShipCustomizationWnd:GameStore_OnVesselCustomElementsExpired( result, requestId, expiredData )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if not self.selShipItem or self.selShipItem.vid ~= expiredData.vid then
		return
	end

	self:OnCustomizationExpired( expiredData )

end


--
function UI.ShipCustomizationWnd:GameStore_OnBuyVesselCustomElements( result, requestId, buyData )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() and self.selShipItem and self.selShipItem.vid == buyData.vid then
			self:OnCustomizationBought( buyData )
		end

	else

		if requestId == self.buyRequestId then
			UI:ShowMsgOnBuyError( result )
		end

	end

	if requestId == self.buyRequestId then
		self.buyRequestId = 0
		self:UpdateWaitEffect()
		self:CheckResetBuyInfo()
	end

end


--
function UI.ShipCustomizationWnd:OnBuyWndResult( result, mode, buyWndInfo )

	if not result then
		return
	end

	if mode == UI.ShipCustomization_BuyWnd.modes.SHIP_CUSTOMIZATION then

		UI:PlayGlobalSound( self.sounds.apply )
		self:DoBuy()

	else
		sys.log( "UI.ShipCustomizationWnd:OnBuyWndResult()[ERROR]: unhandled mode: %s", tostring( mode ) )
	end

end


--
function UI.ShipCustomizationWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	sys.log( "UI.ShipCustomizationWnd:GameStore_OnVesselFreeCustomElements()[ERROR]: this isn't supposed to happen..." )

	self:OnFreeCustomizationsChanged()

end


--
function UI.ShipCustomizationWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	if notification == _G.MasterServer.ServerNotification.SN_VESSEL_CUSTOM_ELEMENTS_NEW_FREE then
		self:OnFreeCustomizationsChanged()
	end

end


--
function UI.ShipCustomizationWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.ShipCustomization_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	local firstVisibleRowIdx, lastVisibleRowIdx = self.itemsList:GetVisibleRange()
	if firstVisibleRowIdx == -1 then
		return
	end

	for rowIdx = firstVisibleRowIdx, lastVisibleRowIdx do

		local rowWnd = self.itemsList:GetButtonForRecord( rowIdx )
		if rowWnd then

			for slotIdx = 1, rowWnd:GetNumSlots() do
				local slotWnd = rowWnd:GetSlotWnd( slotIdx )
				if slotWnd then
					slotWnd:OnPlayerCreditsChanged()
				end
			end

		end

	end

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.ShipCustomizationWnd.customizationTypes =
{
	STICKER	= 1,
	COLOR_1	= 2,
	COLOR_2	= 3,
	COLOR_3	= 4,
	PRESET	= 5,
	DYE		= 6,
	AVATAR	= 7,
	MOTTO	= 8,
	TITLE	= 9,
	CHILD	= 10,
	CHILD_1	= 11,
	CHILD_2	= 12,
	CHILD_3	= 13,
	CHILD_4	= 14,
	CHILD_5	= 15,
}

UI.ShipCustomizationWnd.customiztionSlot2Type =
{
	STICKER_0 	= UI.ShipCustomizationWnd.customizationTypes.STICKER,
	MATERIAL_0	= UI.ShipCustomizationWnd.customizationTypes.COLOR_1,
	MATERIAL_1	= UI.ShipCustomizationWnd.customizationTypes.COLOR_2,
	MATERIAL_2	= UI.ShipCustomizationWnd.customizationTypes.COLOR_3,
	MPRESET_0	= UI.ShipCustomizationWnd.customizationTypes.PRESET,
	CHILD_1		= UI.ShipCustomizationWnd.customizationTypes.CHILD_1,
	CHILD_2		= UI.ShipCustomizationWnd.customizationTypes.CHILD_2,
	CHILD_3		= UI.ShipCustomizationWnd.customizationTypes.CHILD_3,
	CHILD_4		= UI.ShipCustomizationWnd.customizationTypes.CHILD_4,
	CHILD_5		= UI.ShipCustomizationWnd.customizationTypes.CHILD_5,
}


UI.ShipCustomizationWnd.NUM_COLORS	= 3
UI.ShipCustomizationWnd.MAX_CHILD	= 5

UI.ShipCustomizationWnd.sounds =
{
	tabSlotMouseOver	= UI.sounds.btnMouseOver,
	itemMouseOver		= "sound/ui/btnMouseOver",
	itemSelect			= "sound/ui/btnClick",
	confirmBuyCheck		= UI.sounds.checkBox,
	tradeWndShow		= "sound/ui/btnClick",
	apply				= "sound/ui/apply",			
}

UI.ShipCustomizationWnd.effectInfo =
{
	summary =
	{
		confirmBuyLocators =
		{
			[ UI.ShipCustomizationWnd.customizationTypes.STICKER ]	= "slot_1",
			[ UI.ShipCustomizationWnd.customizationTypes.COLOR_1 ]	= "slot_1_6",
			[ UI.ShipCustomizationWnd.customizationTypes.COLOR_2 ]	= "slot_1_7",
			[ UI.ShipCustomizationWnd.customizationTypes.COLOR_3 ]	= "slot_1_9",
			[ UI.ShipCustomizationWnd.customizationTypes.PRESET ]	= "slot_5",
			[ UI.ShipCustomizationWnd.customizationTypes.CHILD_1 ]	= "slot_2",
			[ UI.ShipCustomizationWnd.customizationTypes.CHILD_2 ]	= "slot_3",
			[ UI.ShipCustomizationWnd.customizationTypes.CHILD_3 ]	= "slot_4",
			[ UI.ShipCustomizationWnd.customizationTypes.CHILD_4 ]	= "slot_1_8",
			[ UI.ShipCustomizationWnd.customizationTypes.CHILD_5 ]	= "slot_1_10",
		}
	}
}

UI.ShipCustomizationWnd.presetAffectedCustomizationTypes =	-- все возможные, в конкретном презете может быть меньше
{
	[ UI.ShipCustomizationWnd.customizationTypes.COLOR_1 ]	= true,
	[ UI.ShipCustomizationWnd.customizationTypes.COLOR_2 ]	= true,
	[ UI.ShipCustomizationWnd.customizationTypes.COLOR_3 ]	= true,
	[ UI.ShipCustomizationWnd.customizationTypes.CHILD_1 ]	= true,
	[ UI.ShipCustomizationWnd.customizationTypes.CHILD_2 ]	= true,
	[ UI.ShipCustomizationWnd.customizationTypes.CHILD_3 ]	= true,
	[ UI.ShipCustomizationWnd.customizationTypes.CHILD_4 ]	= true,
	[ UI.ShipCustomizationWnd.customizationTypes.CHILD_5 ]	= true,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ShipCustomizationWnd.tabsList				= nil
UI.ShipCustomizationWnd.itemsList				= nil
UI.ShipCustomizationWnd.confirmBuyWnds			= {}
UI.ShipCustomizationWnd.prevHangarMenuTab		= -1
UI.ShipCustomizationWnd.selShipItem				= nil
UI.ShipCustomizationWnd.selShipEntId			= -1
UI.ShipCustomizationWnd.stickerTextures			= {}
UI.ShipCustomizationWnd.userChoices				= {}
UI.ShipCustomizationWnd.dataToRestore			= nil
UI.ShipCustomizationWnd.summaryCostMetaText		= UI.MetaText.GetNewInstance()
UI.ShipCustomizationWnd.buyRequestId			= 0
UI.ShipCustomizationWnd.buyInfo					= {}
UI.ShipCustomizationWnd.bLockUserChoiceUpdate	= false

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ShipCustomizationWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.tabsList			= UI.ShipCustomization_TabsListWnd
	self.itemsList			= UI.ShipCustomization_ItemsListWnd

	self:CreateControls()

	self.summaryCostMetaText:InitFromLayer( self, self.layers.SUMMARY_COST_VAL ) 

	self:Reset()
	self:HideWaitEffect()

end


--
function UI.ShipCustomizationWnd:F_Shutdown()

	self.summaryCostMetaText:Clear()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipCustomizationWnd:CreateControls()

	local summaryEffect = UI:GetEffectFromLayer( self, self.layers.SUMMARY_EFFECT )

	for customizationTypeName, customizationType in pairs( self.customizationTypes ) do

		if customizationType ~= self.customizationTypes.DYE
			and customizationType ~= self.customizationTypes.AVATAR
			and customizationType ~= self.customizationTypes.MOTTO
			and customizationType ~= self.customizationTypes.TITLE
			and customizationType ~= self.customizationTypes.CHILD then

        		local confirmBuyWnd = UI:CreateChildWnd( self, UI.ShipCustomization_ConfirmBuyWnd, customizationTypeName )
        		UI:AddChildAndLink( self, confirmBuyWnd, summaryEffect, self.effectInfo.summary.confirmBuyLocators[ customizationType ], UI.EffectAnimParams.POS )

        		confirmBuyWnd:Init( customizationType )

        		self.confirmBuyWnds[ customizationType ] = confirmBuyWnd

		end

	end

end


--
function UI.ShipCustomizationWnd:Reset()

	self.tabsList:Reset()
	self:ResetPreview()

	for customizationType, confirmBuyWnd in pairs( self.confirmBuyWnds ) do
		confirmBuyWnd:Reset()
	end

	self.summaryCostMetaText:SetText( "", true )

	self.selShipItem = nil
	self.selShipEntId = -1
	self.userChoices = {}

end


--
function UI.ShipCustomizationWnd:FullUpdate()

	self:Reset()              

	self.selShipItem = UI.HangarWnd:GetSelShipItem()
	if not self.selShipItem then
		-- перед запуском уровня приходит GameStore_OnOwnedVessels(), при этом ангар еще на экране, и окно кастомизации тоже может быть на экране;
		-- при этом сюда приходит дважды - при очистке списка ( shipItem = nil ), и когда выделенный боевой слот восстановлен
--		sys.log( "UI.ShipCustomizationWnd:FullUpdate()[ERROR]: nill shipItem" )
		return
	end

	self.selShipEntId = UI.HangarWnd:GetSelShipEntId()

	self:UpdateTabs()

	if self.dataToRestore then

		self.userChoices = self.dataToRestore.userChoices
		self:SelectTab( self.dataToRestore.selTab, false )
		self.dataToRestore = nil

	else	
		self:SetDefaultTabsSelection()
	end

	self:UpdateUserChoiceRelatedControls()

end


--
function UI.ShipCustomizationWnd:UpdateTabs()

	self.tabsList:Reset()

	-- наклейки

	local bStickersDisabled = UI:IsShipCustomSlotDisabled( self.selShipItem.defName, self:CustomizationType2Slot( self.customizationTypes.STICKER ) )

	local stickersMainData = {}
	stickersMainData.customizationType	= self.customizationTypes.STICKER
	stickersMainData.groupId			= -1
	stickersMainData.bDisabled			= bStickersDisabled
	stickersMainData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
	stickersMainData.categoryInfo		= { name = "STICKER" }

	self.tabsList:AddRecord( stickersMainData )


	local stickerGroupIds = {}

	for groupName, groupId in pairs( _G.StickerGroups ) do
		table.insert( stickerGroupIds, groupId )
	end

	table.sort( stickerGroupIds )

	for groupIdx = 1, #stickerGroupIds do

		local groupId = stickerGroupIds[ groupIdx ]

		local items, bHasItems = self:GetItemNamesForCustomizationType( self.customizationTypes.STICKER, groupId, true )

		if bHasItems then

    		local stickerGroupData = {}
    		stickerGroupData.customizationType	= self.customizationTypes.STICKER
    		stickerGroupData.groupId			= groupId
			stickerGroupData.bDisabled			= bStickersDisabled
			stickerGroupData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.SUB
			stickerGroupData.categoryInfo		= { name = string.format( "STICKER_%d", groupId ) }
			stickerGroupData.parentCategoryInfo	= stickersMainData.categoryInfo

    		self.tabsList:AddRecord( stickerGroupData )		

		end
		
	end

	-- общий пункт для пресетов и цветов

	local bPresetsDisabled = UI:IsShipCustomSlotDisabled( self.selShipItem.defName, self:CustomizationType2Slot( self.customizationTypes.PRESET ) )

	local colorsDisabledState = {}
	for colorCustomizationType = self.customizationTypes.COLOR_1, self.customizationTypes.COLOR_3 do
		colorsDisabledState[ colorCustomizationType ] = UI:IsShipCustomSlotDisabled( self.selShipItem.defName, self:CustomizationType2Slot( colorCustomizationType ) )
	end

	local bHasDye = false

	if not bPresetsDisabled then
		bHasDye = true
	end

	if not bHasDye then
		for colorCustomizationType, bColorDisabled in pairs( colorsDisabledState ) do
			if not bColorDisabled then
				bHasDye = true
				break
			end
		end
	end

	local dyeData 				= {}
	dyeData.customizationType	= self.customizationTypes.DYE
	dyeData.bDisabled			= not bHasDye
	dyeData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
	dyeData.categoryInfo		= { name = "DYE" }

	self.tabsList:AddRecord( dyeData )


	-- пресеты

	local presetsData 				= {}
	presetsData.customizationType	= self.customizationTypes.PRESET
	presetsData.bDisabled			= bPresetsDisabled
	presetsData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.SUB
	presetsData.categoryInfo		= { name = "PRESET" }
	presetsData.parentCategoryInfo	= dyeData.categoryInfo

	self.tabsList:AddRecord( presetsData )

	
	-- цвета

	for channelId = 1, self.NUM_COLORS do

		local colorChannelData = {}		
		colorChannelData.customizationType	= self.customizationTypes.COLOR_1 + channelId - 1
		colorChannelData.channelId			= channelId
		colorChannelData.bDisabled			= colorsDisabledState[ colorChannelData.customizationType ]
		colorChannelData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.SUB
		colorChannelData.categoryInfo		= { name = string.format( "COLOR_%d", channelId ) }
		colorChannelData.parentCategoryInfo	= dyeData.categoryInfo

		self.tabsList:AddRecord( colorChannelData )

	end	


	-- чайлды
	
	local numChldren = math.min( _G.GameStore_GetVesselCustomizationBonesCount( self.selShipEntId ), self.MAX_CHILD )
	
	local childDisabledState = {}
	for childCustomizationType = self.customizationTypes.CHILD_1, self.customizationTypes.CHILD_1 + numChldren - 1 do
		childDisabledState[ childCustomizationType ] = UI:IsShipCustomSlotDisabled( self.selShipItem.defName, self:CustomizationType2Slot( childCustomizationType ) )
	end
	
	local bHasChild = false
	for childCustomizationType, bChildDisabled in pairs( childDisabledState ) do
		if not bChildDisabled then
			bHasChild = true
			break
		end
	end

	local childMainData = {}
	childMainData.customizationType	= self.customizationTypes.CHILD
	childMainData.bDisabled			= not bHasChild
	childMainData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
	childMainData.categoryInfo		= { name = "CHILD" }

	self.tabsList:AddRecord( childMainData )
	
	for childSlotIdx = 1, numChldren do

		local childSubData = {}
		childSubData.customizationType	= self.customizationTypes.CHILD_1 + childSlotIdx - 1
		childSubData.bDisabled			= childDisabledState[ childSubData.customizationType ]
		childSubData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.SUB
		childSubData.categoryInfo		= { name = string.format( "CHILD_%d", childSlotIdx ) }
		childSubData.parentCategoryInfo	= childMainData.categoryInfo

		self.tabsList:AddRecord( childSubData )
		
	end


	-- аватары

	local avatarData 				= {}
	avatarData.customizationType	= self.customizationTypes.AVATAR
	avatarData.bDisabled			= false
	avatarData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
	avatarData.categoryInfo			= { name = "AVATAR" }

	self.tabsList:AddRecord( avatarData )


	-- насмешки

	local mottoData 			= {}
	mottoData.customizationType	= self.customizationTypes.MOTTO
	mottoData.bDisabled			= false
	mottoData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
	mottoData.categoryInfo		= { name = "MOTTO" }

	self.tabsList:AddRecord( mottoData )


	-- звания

	local titleData 			= {}
	titleData.customizationType	= self.customizationTypes.TITLE
	titleData.bDisabled			= false
	titleData.categoryType 		= UI.StoreCategoriesListWnd.categoryTypes.MAIN
	titleData.categoryInfo		= { name = "TITLE" }

	self.tabsList:AddRecord( titleData )
	
	self.tabsList:UpdateVisibleRecordsImmediate()

end


--
function UI.ShipCustomizationWnd:SetDefaultTabsSelection()

	self:SelectTab( 1, false )

end


--
function UI.ShipCustomizationWnd:SelectTab( tabIdx, bAnimated )

	if bAnimated == nil then
		bAnimated = false
	end

	if tabIdx ~= -1 and self.tabsList:IsRecordSelected( tabIdx ) then
		return
	end

	if tabIdx == -1 then
		self.tabsList:SelectMainCategoryRecordInternal( -1, false, false )
		self.tabsList:SelectSubCategoryRecordInternal( -1, false )
		return
	end

	if tabIdx < 0 or tabIdx > self.tabsList:GetNumTotalRecords() then
		sys.log( "UI.ShipCustomizationWnd:SelectTab()[ERROR]: invalid tabIdx: %d", tabIdx )
		return
	end

	local data = self.tabsList:GetRecordData( tabIdx )
	if data and data.bDisabled then
		sys.log( "UI.ShipCustomizationWnd:SelectTab()[ERROR]: tab %d is disabled", tabIdx )
		return	
	end

	-- выделение не может ставиться на главную закладку наклеек, только на закладки групп наклеек;
	-- поэтому при попытке поставить на главную выделение вместо этого ставится на первую группу

	local tabIdxToSelect = tabIdx

	local data = self.tabsList:GetRecordData( tabIdx )

	if data.customizationType == self.customizationTypes.STICKER then

		if data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then

    		local nextTabIdx = tabIdx + 1
    		local nextData = self.tabsList:GetRecordData( nextTabIdx )

    		if nextData.customizationType == self.customizationTypes.STICKER and nextData.categoryType ~= UI.StoreCategoriesListWnd.categoryTypes.MAIN then
    			tabIdxToSelect = nextTabIdx
    		else
    			tabIdxToSelect = -1
    			sys.log( "UI.ShipCustomizationWnd:SelectTab()[ERROR]: cannot select stickers because cannot find any sticker group" )
    		end

		end
		

	-- выделение не может ставиться на закладки "Покраска" и "Декор", т.к. они чисто декоративные, для организации иерархии закладок,
	-- поэтому при попытке поставить на них выделение вместо этого ставится на первую подзакладку

	elseif data.customizationType == self.customizationTypes.DYE or data.customizationType == self.customizationTypes.CHILD then

		local subTabToSelect = -1

		local nextTabIdx = tabIdx + 1
		local nextData = self.tabsList:GetRecordData( nextTabIdx )
		
		while nextData.categoryType ~= UI.StoreCategoriesListWnd.categoryTypes.MAIN do

			if not nextData.bDisabled then
				subTabToSelect = nextTabIdx
				break
			end

			nextTabIdx = nextTabIdx + 1
			nextData = self.tabsList:GetRecordData( nextTabIdx )				

		end

		if subTabToSelect == -1 then
			sys.log( "UI.ShipCustomizationWnd:SelectTab()[ERROR]: cannot select subtab; no enabled subtab found" )
		end

		tabIdxToSelect = subTabToSelect

	-- закладки кастомизаций игрока, которые управляются внешними окнами, работают просто как кнопки, они не выделяются

	elseif data.customizationType == self.customizationTypes.AVATAR
		or data.customizationType == self.customizationTypes.MOTTO
		or data.customizationType == self.customizationTypes.TITLE then
			tabIdxToSelect = -1
	end

	if tabIdxToSelect ~= -1 and not self.tabsList:IsRecordSelected( tabIdxToSelect ) then
		
		local tabToSelectData = self.tabsList:GetRecordData( tabIdxToSelect )
		if tabToSelectData.categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then
		
			local mainTabIdx = -1
			for prevTabIdx = tabIdxToSelect - 1, 1, -1 do
				local prevData = self.tabsList:GetRecordData( prevTabIdx )
				if prevData.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
					mainTabIdx = prevTabIdx
					break
				end
			end
			
			if mainTabIdx ~= -1 then
			
				local bSoundPlayed = false
			
				if not self.tabsList:IsRecordSelected( mainTabIdx ) then
					self.tabsList:SelectRecord( mainTabIdx, true, bAnimated, bAnimated )
					bSoundPlayed = true
				end
				
				self.tabsList:SelectRecord( tabIdxToSelect, true, bAnimated, bAnimated and not bSoundPlayed )
				
			else
				sys.log( "UI.ShipCustomizationWnd:SelectTab()[ERROR]: invalid tabs hierarchy, cannot find main tab" )
			end
			
		else
			self.tabsList:SelectRecord( tabIdxToSelect, true, bAnimated, bAnimated )
		end
		
	end

end


--
function UI.ShipCustomizationWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == self.tabsList:GetUiHandle() then
		self:OnSelTabChanged()

	elseif hSender == self.itemsList:GetUiHandle() then
		self:OnSelItemChanged()
	end

end


--
function UI.ShipCustomizationWnd:OnSelTabChanged()

	self:UpdateItemsList()
	self:MoveCameraToSelCustomization()

end


--
function UI.ShipCustomizationWnd:OnSelItemChanged()

	if not self.bLockUserChoiceUpdate then

    	self:SaveSelectedItemToUserChoice()
		self:UpdateUserChoiceRelatedControls()
		self:MoveCameraToSelCustomization()

	end

end  


--
function UI.ShipCustomizationWnd:SaveSelectedItemToUserChoice()

	local customizationType = self:GetSelCustomizationType()

	if customizationType == -1 then
		return
	end

	local userChoice = self.userChoices[ customizationType ]

	if not userChoice then
		userChoice = {}
		self.userChoices[ customizationType ] = userChoice
	end

	local selRowIdx, selSlotIdx = self:GetSelItemSlot()
	if selRowIdx ~= -1 and selSlotIdx ~= -1 then

		local selSlotData = self:GetItemSlotData( selRowIdx, selSlotIdx )
		userChoice.itemData = UI:CopyTable2( selSlotData )

	else
		userChoice.itemData = nil
	end

	userChoice.bChecked = userChoice.itemData ~= nil and not userChoice.itemData.bApplied

	if customizationType == self.customizationTypes.PRESET then

		if userChoice.itemData then

			if not userChoice.itemData.bEmpty then

				local affectedCustomizationTypes = self:GetPresetAffectedCustomTypes( userChoice.itemData.itemName )
    			for affectedCustomizationType, dummy in pairs( affectedCustomizationTypes ) do

    				local affectedUserChoice = self.userChoices[ affectedCustomizationType ]
    				if affectedUserChoice then

    					affectedUserChoice.itemData = nil
						affectedUserChoice.bChecked = false

    				end

    			end

			end

		end

	elseif self.presetAffectedCustomizationTypes[ customizationType ] then

		if userChoice.itemData then

			local presetChoice = self.userChoices[ self.customizationTypes.PRESET ]
			if presetChoice and presetChoice.itemData and not presetChoice.itemData.bEmpty then

				local affectedCustomizationTypes = self:GetPresetAffectedCustomTypes( presetChoice.itemData.itemName )
				if affectedCustomizationTypes[ customizationType ] then
					presetChoice.itemData = nil
				end

			end			

		end

	end

end


--
function UI.ShipCustomizationWnd:CheckUserChoice( customizationType, bCheck )

	local userChoice = self.userChoices[ customizationType ]
	if not userChoice then
		sys.log( "UI.ShipCustomizationWnd:CheckUserChoice()[ERROR]: cannot fiond user choice for customizationType %s", tostring( customizationType ) )
		return
	end

    userChoice.bChecked = bCheck

	local confirmBuyWnd = self:GetConfirmBuyWnd( customizationType, true )
	if confirmBuyWnd then
		confirmBuyWnd:Check( userChoice.bChecked )
	else
		sys.log( "UI.ShipCustomizationWnd:ShowConfirmBuyWnd()[ERROR]: cannot find confirmBuyWnd for customizationType %s", tostring( customizationType ) )
	end

	self:UpdateUserChoiceRelatedControls()

end


--
function UI.ShipCustomizationWnd:UpdateUserChoiceRelatedControls()
		
	self:UpdateConfirmBuyWnds()
    self:UpdateSummaryCost()
    self:UpdateActionBtnState()
	self:Preview()

end


--
function UI.ShipCustomizationWnd:UpdateConfirmBuyWnds()

	for customizationType, confirmBuyWnd in pairs( self.confirmBuyWnds ) do
		if confirmBuyWnd:IsOnScreen() then
			confirmBuyWnd:Update()
		end
	end 

end


--
function UI.ShipCustomizationWnd:ShowConfirmBuyWnd( customizationType )

	local confirmBuyWnd = self:GetConfirmBuyWnd( customizationType, false )
	if confirmBuyWnd then
		self:AddChild( confirmBuyWnd )
	else
		sys.log( "UI.ShipCustomizationWnd:ShowConfirmBuyWnd()[ERROR]: cannot find confirmBuyWnd for customizationType %s", tostring( customizationType ) )
	end

end


--
function UI.ShipCustomizationWnd:HideConfirmBuyWnd( customizationType )

	local confirmBuyWnd = self:GetConfirmBuyWnd( customizationType, false )
	if confirmBuyWnd then
		confirmBuyWnd:Reset()
		self:RemoveChild( confirmBuyWnd )
	else
		sys.log( "UI.ShipCustomizationWnd:HideConfirmBuyWnd()[ERROR]: cannot find confirmBuyWnd for customizationType %s", tostring( customizationType ) )
	end

end


--
function UI.ShipCustomizationWnd:GetConfirmBuyWnd( customizationType, bVisibleOnly )

	local confirmBuyWnd = self.confirmBuyWnds[ customizationType ]	

	if not confirmBuyWnd then
		return nil
	end

	if bVisibleOnly and ( not confirmBuyWnd:IsOnScreen() or not confirmBuyWnd:IsEnabled() ) then
		return nil
	end

	return confirmBuyWnd

end


--
function UI.ShipCustomizationWnd:UpdateItemsList()

	local bLockUserChoiceUpdateOld = self.bLockUserChoiceUpdate
	self.bLockUserChoiceUpdate = true

	self.itemsList:Clear()

	self.bLockUserChoiceUpdate = bLockUserChoiceUpdateOld

	local selCustomizationType = self:GetSelCustomizationType()
	if selCustomizationType == -1 then
		return
	end
	
	-- некоторые закладки не соответствуют никакой кастомизации, а нужны для организации элементов, или вызова других окон
	local aiCustomSlotId = self:CustomizationType2Slot( selCustomizationType )
	if aiCustomSlotId == -1 then
		return
	end

	local itemNames = self:GetCurItemNames()
	local appliedItemName = self:GetAppliedItemName( selCustomizationType )

	if selCustomizationType == self.customizationTypes.STICKER then
		self:LoadStickerTextures( itemNames )
	end


	-- "пустой" слот

	local slotIdx	= 1
	local rowData	= { slots = {} }

	local emptySlotData = self:CreateEmptyItemData( selCustomizationType )
	rowData.slots[ slotIdx ] = emptySlotData

	slotIdx = slotIdx + 1
	if slotIdx > UI.ShipCustomization_ItemsListWnd.MAX_SLOTS_IN_ROW then

		self.itemsList:AddRecord( rowData )

		slotIdx = 1
		rowData = { slots = {} }
	end


	for itemIdx = 1, #itemNames do

		local itemName = itemNames[ itemIdx ]
		local vceid = UI:ShipCustomizationName2Vceid( itemName )

		local slotData = {}
		slotData.customizationType	= selCustomizationType
		slotData.itemName			= itemName
		slotData.vceid				= vceid
		slotData.bEmpty				= false
		slotData.bFree				= self:IsItemFree( vceid )
		slotData.bApplied			= itemName == appliedItemName
		slotData.marketPlace		= UI:GetShipCustomizationMarketPlace( itemName )

		if not rowData then
			rowData = { slots = {} }
		end

		rowData.slots[ slotIdx ] = slotData

    	slotIdx = slotIdx + 1
    	if slotIdx > UI.ShipCustomization_ItemsListWnd.MAX_SLOTS_IN_ROW then

    		self.itemsList:AddRecord( rowData )

    		slotIdx = 1
    		rowData = { slots = {} }
    	end

	end	

	if next( rowData.slots ) then
		self.itemsList:AddRecord( rowData )
	end


	if not self:TryRestoreItemsSelectionFromUserChoice() then
		self:TrySelectAppliedItemsSlot()
	end

end


--
function UI.ShipCustomizationWnd:CreateEmptyItemData( customizationType )

	local name = ""

	local emptySlotData =
	{
		customizationType	= customizationType,
		itemName			= name,
		vceid				= -1,
		bEmpty				= true,
		bFree				= true,
		bApplied			= self:IsItemApplied( name, customizationType ),
	}

	return emptySlotData

end


--
function UI.ShipCustomizationWnd:GetAppliedItemName( customizationType )

	if not self.selShipItem then
		return ""
	end

	if customizationType == -1 then
		return ""
	end

	return UI:GetShipCustomization( self.selShipItem.vid, self:CustomizationType2Slot( customizationType ) )

end


--
function UI.ShipCustomizationWnd:IsItemApplied( name, customizationType )

	local appliedItemName = self:GetAppliedItemName( customizationType )
	return name == appliedItemName

end


--
function UI.ShipCustomizationWnd:IsItemFree( vceid )

	if not self:IsVceidValid( vceid ) then
		return true
	end

	local itemName = UI:ShipCustomizationNameByVceid2Name( vceid )
	return self:IsItemFreeByName( itemName )

end


--
function UI.ShipCustomizationWnd:IsItemFreeByName( itemName )

	return UI.serverData.freeCustomizations[ itemName ] == true

end


--
function UI.ShipCustomizationWnd:CustomizationSlot2Type( slotId )

	local slotName = UI:Val2Key( ai.VesselCustomSlot, slotId )

	if slotName == "" then
		sys.log( "UI.ShipCustomizationWnd:CustomizationSlot2Type()[ERROR]: invalid slotId: %s", tostring( slotId ) )
		return -1
	end

	return self.customiztionSlot2Type[ slotName ] or -1

end


--
function UI.ShipCustomizationWnd:CustomizationType2Slot( customizationType )

	local slotName = UI:Val2Key( self.customiztionSlot2Type, customizationType )
	return ai.VesselCustomSlot[ slotName ] or -1

end


--
function UI.ShipCustomizationWnd:GetItemNamesForCustomizationType( customizationType, groupId, bCheckHasItemsOnly )

	local itemNames = {}

	if customizationType == -1 then
		sys.log( "UI.ShipCustomizationWnd:GetItemNamesForCustomizationType()[ERROR]: invalis customization type" )
		return itemNames, false
	end

	if customizationType == self.customizationTypes.STICKER then
    	if groupId == -1 then
    		return itemNames, false
    	end
	end

	local aiCustomSlotId = self:CustomizationType2Slot( customizationType )
	if aiCustomSlotId == -1 then
    	return itemNames, false
	end

	local aiCustomType = ai.VesselCustomSlotType[ aiCustomSlotId ] or -1
	if aiCustomType == -1 then
		sys.log( "UI.ShipCustomizationWnd:GetItemNamesForCustomizationType()[ERROR]: cannot find custom slot type for slot %d", aiCustomSlotId )
    	return itemNames, false
	end


	local allAvailableItemNames = _G.GameStore_GetAvailableVesselCustomElements()
	for idx, itemName in pairs( allAvailableItemNames ) do

		local def = _G.VesselCustomElements[ itemName ]
		if def and def.type == aiCustomType then

			local bCanShow = true

    		if groupId == -1 or def.groupId == groupId then
	
				local bCanShow = true

    			-- некупленные dlc не показываются

    			local marketPlace = UI:GetShipCustomizationMarketPlace( itemName )
    			if marketPlace ~= _G.MarketPlaceTypes.NATIVE then

					local vceid = UI:ShipCustomizationName2Vceid( itemName )
    				if not self:IsItemFree( vceid ) then
						bCanShow = false
					end

    			end

    			if bCanShow then

					local slotRestrictGroups = nil

					if self.selShipItem then
						slotRestrictGroups = UI:GetShipCustomSlotRestrictGroups( self.selShipItem.defName, aiCustomSlotId )	-- nil означает, что подходят любые группы; пустая таблица означает, что не подходит ни одна
					end

					if slotRestrictGroups ~= nil then

						local itemRestrictGroup = UI:GetShipCustomizationRestrictGroup( itemName )

						local bGroupFound = false
						for gorupIdx, group in pairs( slotRestrictGroups ) do
							if group == itemRestrictGroup then
								bGroupFound = true
								break
							end
						end

						if not bGroupFound then
							bCanShow = false
						end

					end

				end

    			if bCanShow then

					if bCheckHasItemsOnly then
						return itemNames, true
					else
	    				table.insert( itemNames, itemName )
					end

    			end

    		end

		end
		
	end


	local fnSort = function( itemName1, itemName2 )

		local def1 = _G.VesselCustomElements and _G.VesselCustomElements[ itemName1 ]
		local def2 = _G.VesselCustomElements and _G.VesselCustomElements[ itemName2 ]

		local bOnTop1 = def1 and def1.on_top or false
		local bOnTop2 = def2 and def2.on_top or false

		if bOnTop1 and not bOnTop2 then
			return true

		elseif not bOnTop1 and bOnTop2 then
			return false
		end

		return itemName1 < itemName2

	end

	table.sort( itemNames, fnSort )	

	return itemNames, next( itemNames ) ~= nil

end


--
function UI.ShipCustomizationWnd:GetCurItemNames()

	local customizationType = self:GetSelCustomizationType()

	local groupId = -1
	if customizationType == self.customizationTypes.STICKER then

    	local selTab_sub = self.tabsList:GetSelectedSubCategoryRecord()
    	if selTab_sub ~= -1 then

    		local tabData = self.tabsList:GetRecordData( selTab_sub )
    		groupId = tabData.groupId
			
    	end

	end

	return self:GetItemNamesForCustomizationType( customizationType, groupId, false )

end         


--
function UI.ShipCustomizationWnd:TryRestoreItemsSelectionFromUserChoice()

	local result = false

	local bLockUserChoiceUpdateOld = self.bLockUserChoiceUpdate
	self.bLockUserChoiceUpdate = true

	local customizationType = self:GetSelCustomizationType()
	local itemData = self:GetUserChoiceItemData( customizationType, true )

	if itemData then

		result = true

		local selRecordIdx, selSlotIdx = self:GetItemRecordByName( itemData.itemName )
		self:SelectItemSlot( selRecordIdx, selSlotIdx )

	end

	self.bLockUserChoiceUpdate = bLockUserChoiceUpdateOld

	return result

end


--
function UI.ShipCustomizationWnd:TrySelectAppliedItemsSlot()

	local appliedRowIdx, appliedSlotIdx = self:GetAppliedItemsSlot()
	self:SelectItemSlot( appliedRowIdx, appliedSlotIdx )

end


--
function UI.ShipCustomizationWnd:GetAppliedItemsSlot()

	for rowIdx = 1, self.itemsList:GetNumRecords() do

		local rowData = self.itemsList:GetRecordData( rowIdx )
		if rowData then

			for slotIdx, slotData in pairs( rowData.slots ) do
				if slotData.bApplied then
					return rowIdx, slotIdx
				end
			end

		end

	end

	return -1, -1

end


--
function UI.ShipCustomizationWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true		
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if UI:IsWndKindOf( wnd, "ShipCustomization_ItemsSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "ShipCustomization_ItemsSlotWnd" ) then

		if not self:IsWaitingRequest() then

			local slotWnd = nil
			if UI:IsWndKindOf( wnd, "ShipCustomization_ItemsSlotWnd" ) then
				slotWnd = wnd
			else
				slotWnd = UI:GetAncestorKindOf( wnd, "ShipCustomization_ItemsSlotWnd" )
			end

    		local rowIdx = slotWnd:GetRow()
    		local slotIdx = slotWnd:GetSlot()

    		local selRowIdx, selSlotIdx = self:GetSelItemSlot()

    		if rowIdx ~= selRowIdx or slotIdx ~= selSlotIdx then
    			self:SelectItemSlot( rowIdx, slotIdx )
				UI:PlayGlobalSound( self.sounds.itemSelect )
    		end

		end

    	return true

	elseif wnd == UI.ShipCustomization_ActionBtn then

		if not self:IsWaitingRequest() then
			self:TryBuy()
		end

		return true

	elseif wnd == UI.ShipCustomization_CrossBtn then

		self:Close()
		return true

	elseif UI:IsWndKindOf( wnd, "ShipCustomization_TabsSlotWnd" ) then
	
		if not self.tabsList:IsAnimating() then

			local data = wnd:GetRecordData()
			if not data.bDisabled then

				if data.customizationType == self.customizationTypes.AVATAR then

					UI:PlayGlobalSound( "sound/ui/btnClick" )
					UI.ProfileChangeAvatar_Wnd:Show()

				elseif data.customizationType == self.customizationTypes.MOTTO then

					UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.PROFILE, true, false, nil )

					if UI.HangarWnd:GetMenuTab() == UI.HangarWnd.menuTabs.PROFILE then
						UI.Profile_TabsWnd:SelectTab( "MOTTOS" )
					end

				elseif data.customizationType == self.customizationTypes.TITLE then

					UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.PROFILE, true, false, nil )

					if UI.HangarWnd:GetMenuTab() == UI.HangarWnd.menuTabs.PROFILE then
						UI.Profile_TabsWnd:SelectTab( "TITLES" )
					end

				else
				
					local tabIdx = wnd:GetRecord()
					
					if not self.tabsList:IsRecordSelected( tabIdx ) then
						self:SelectTab( tabIdx, true )
					end

				end

			end
			
		end

    	return true

	elseif UI:IsWndKindOf( wnd, "ShipCustomization_CheckBox" ) then

		local confirmBuyWnd = wnd:GetParent()

		self:CheckUserChoice( confirmBuyWnd:GetCustomizationType(), not confirmBuyWnd:IsChecked() )
		UI:PlayGlobalSound( self.sounds.confirmBuyCheck )

		return true		

	end	

	return false

end


--
function UI.ShipCustomizationWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self.itemsList:Scroll( ticks < 0, math.abs( ticks ) )

	return true

end


--
function UI.ShipCustomizationWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		UI.ShipCustomization_BuyWnd:UnlinkFromParent()
	else
		self:OnAfterHideFromScreen()
	end

	if not UI:IsInRemovingAllWindows() then
		self:Reset()
	else
		self:ResetPreview()
	end

	self:UnloadStickerTextures()

end


--
function UI.ShipCustomizationWnd:Close()

	self:Hide()

	if self.prevHangarMenuTab ~= -1 then
		UI.HangarWnd:TrySetMenuTab( self.prevHangarMenuTab, true, false )
	end

end


--
function UI.ShipCustomizationWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
	
		local selTab = -1
		
		local selTab_main = self.tabsList:GetSelectedMainCategoryRecord()
		local selTab_sub = self.tabsList:GetSelectedSubCategoryRecord()
		
		if selTab_sub ~= -1 then
			selTab = selTab_sub
		elseif selTab_main ~= -1 then
			selTab = selTab_main
		end

    	UI.store.ShipCustomizationWnd =
    	{
    		prevHangarMenuTab	= self.prevHangarMenuTab,
    		userChoices			= self.userChoices,
    		selTab				= selTab,
			buyRequestId		= self.buyRequestId,
			buyInfo				= self.buyInfo,
    	}

	end

end


--
function UI.ShipCustomizationWnd:F_OnEventRestoreUiState()

	if UI.store.ShipCustomizationWnd then

		self.prevHangarMenuTab = UI.store.ShipCustomizationWnd.prevHangarMenuTab

		self.buyRequestId = UI.store.ShipCustomizationWnd.buyRequestId
		self:UpdateWaitEffect()
		self:CheckResetBuyInfo()

		self.dataToRestore =
		{
			userChoices		= UI.store.ShipCustomizationWnd.userChoices,
			selTab			= UI.store.ShipCustomizationWnd.selTab,
		}

		UI.store.ShipCustomizationWnd = nil

		if self:IsOnScreen() then
			self:FullUpdate()
		end

	end

end 


--
function UI.ShipCustomizationWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )	

end


--
function UI.ShipCustomizationWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )	

end


--
function UI.ShipCustomizationWnd:UpdateWaitEffect()

	if self:IsWaitingRequest() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.ShipCustomizationWnd:IsWaitingRequest()

	return self.buyRequestId ~= 0

end


--
function UI.ShipCustomizationWnd:CheckResetBuyInfo()

	if not self:IsWaitingRequest() then
		self.buyInfo = {}
	end

end


--
function UI.ShipCustomizationWnd:LoadStickerTextures( stickerNames )

	for idx, stickerName in pairs( stickerNames ) do

		if not self.stickerTextures[ stickerName ] then
			local path = UI:GetStickerDecalPath( stickerName )
			self.stickerTextures[ stickerName ] = UI:LoadTexture( string.format( "sticker_%s", stickerName ), path, UI:ZeroQuat() )
		end

	end

end


--
function UI.ShipCustomizationWnd:UnloadStickerTextures()

	for stickerName, hTex in pairs( self.stickerTextures ) do
		UI:UnloadTexture( hTex, true )
	end

	self.stickerTextures = {}

end


--
function UI.ShipCustomizationWnd:GetSelCustomizationType()

	local selTabIdx_sub = self.tabsList:GetSelectedSubCategoryRecord()
	if selTabIdx_sub ~= -1 then

		local data = self.tabsList:GetRecordData( selTabIdx_sub )
		return data.customizationType

	end

	local selTabIdx_main = self.tabsList:GetSelectedMainCategoryRecord()
	if selTabIdx_main ~= -1 then

		local data = self.tabsList:GetRecordData( selTabIdx_main )
		return data.customizationType

	end

	return -1

end


--
function UI.ShipCustomizationWnd:GetSelItemSlot()

	return self.itemsList:GetSelectedRecord(), self.itemsList:GetSelectedSlot()

end


--
function UI.ShipCustomizationWnd:SelectItemSlot( recordIdx, slotIdx )

	self.itemsList:SelectSlot( recordIdx, slotIdx )

end


--
function UI.ShipCustomizationWnd:GetItemSlotData( rowIdx, slotIdx )

	if rowIdx ~= -1 and slotIdx ~= -1 then

		local rowdData = self.itemsList:GetRecordData( rowIdx )
		if rowdData then
			return rowdData.slots[ slotIdx ]	
		end
	end

	return nil

end


--
function UI.ShipCustomizationWnd:GetItemSlotWnd( rowIdx, slotIdx )

	if rowIdx ~= -1 and slotIdx ~= -1 then

		local rowWnd = self.itemsList:GetButtonForRecord( rowIdx )
		if rowWnd then
			return rowWnd:GetSlotWnd( slotIdx )
		end
	end

	return nil

end


--
function UI.ShipCustomizationWnd:Preview()

	if UI:IsInShutdown() then
		return
	end

	local presetName = self:GetUserChoiceItemName( self.customizationTypes.PRESET, true )

	if presetName then
		if not self:IsCustomizationBuyConfirmed( self.customizationTypes.PRESET ) then
			presetName = nil
		end
	end

	if not presetName then

		presetName = self:GetAppliedItemName( self.customizationTypes.PRESET )
		if presetName ~= "" then

			local affectedCustomTypes = self:GetPresetAffectedCustomTypes( presetName )
			for affectedCustomType, dummy in pairs( affectedCustomTypes ) do

				if self:IsCustomizationBuyConfirmed( affectedCustomType ) then
					presetName = ""
					break
				end

			end

		end

	end

	-- предварительная очистка цветов/пресетов
	for customizationTypeName, customizationType in pairs( self.customizationTypes ) do
		if self:CustomizationType2Slot( customizationType ) ~= -1 then
			self:PreviewCustomizationInternal( customizationType, "" )
		end
	end
	
	local affectedCustomTypes = presetName ~= "" and self:GetPresetAffectedCustomTypes( presetName ) or ""


	for customizationTypeName, customizationType in pairs( self.customizationTypes ) do

		local aiCustomSlotId = self:CustomizationType2Slot( customizationType )
		if aiCustomSlotId ~= -1 then

			if customizationType == self.customizationTypes.PRESET then

				if presetName ~= "" then
		            self:PreviewCustomizationInternal( customizationType, presetName )
				end

			else

				local bAffectedByPreset = affectedCustomTypes[ customizationType ] == true
				if not bAffectedByPreset then

                	local customName = nil

                	if self:IsCustomizationBuyConfirmed( customizationType ) then
                		customName = self:GetUserChoiceItemName( customizationType )
                	end

    				if not customName then
    					customName = self:GetAppliedItemName( customizationType )
    				end

    				self:PreviewCustomizationInternal( customizationType, customName )

				end

			end			

		end

	end

end


--
function UI.ShipCustomizationWnd:PreviewCustomizationInternal( customizationType, name )

	if UI:IsInShutdown() then
		return
	end
	                                                            
	if self.selShipEntId == -1 then
		return
	end

	local shipEnt = _G.Entities[ self.selShipEntId ]
	if not shipEnt then
		return
	end

	local aiCustomSlotId = self:CustomizationType2Slot( customizationType )
	if aiCustomSlotId == -1 then
		sys.log( "UI.ShipCustomizationWnd:PreviewCustomizationInternal()[ERROR]: invalid customizationType: %d", customizationType )
		return
	end

	shipEnt:SetVesselCustomElement( name, aiCustomSlotId )

end    


--
function UI.ShipCustomizationWnd:ResetPreview()

	if UI:IsInShutdown() then
		return
	end

	if not self.selShipItem then
		return
	end

	if self.selShipEntId == -1 then
		return
	end

	UI:PreviewShipCustomizations( self.selShipItem.vid, self.selShipEntId )

end


--
function UI.ShipCustomizationWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.ShipCustomizationWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipCustomizationWnd:UpdateMetaTextPos()

	self.summaryCostMetaText:UpdateScreenOrgFromLayer( self, self.layers.SUMMARY_COST_VAL )

end


--
function UI.ShipCustomizationWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.SUMMARY_COST_VAL then
		self.summaryCostMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipCustomizationWnd:UpdateSummaryCost()

	local cost_credits = 0
	local cost_gold = 0

	-- #0083985 - при покупке одинаковых кастомизаций (например, цветов), плата будет взята только за один
	local doubleCustomizations = {}

	for customizationTypeName, customizationType in pairs( self.customizationTypes ) do

		local userChoice = self.userChoices[ customizationType ]
		if userChoice and userChoice.itemData and not userChoice.itemData.bApplied and not userChoice.itemData.bFree and self:IsCustomizationBuyConfirmed( customizationType ) then

			if not doubleCustomizations[ userChoice.itemData.itemName ] then

        		local price, bGold = self:GetItemPrice( customizationType, userChoice.itemData )

        		if bGold then
        		    cost_gold = cost_gold + price
        		else
        			cost_credits = cost_credits + price
        		end

				doubleCustomizations[ userChoice.itemData.itemName ] = true

			end

		end

	end

	local str = ""

	if cost_credits > 0 then

    	local creditsPriceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
    		val			= cost_credits,
    		bIsBuyPrice	= true,
    		basePrice	= cost_credits,
    	}

    	local strCredits = UI:PriceInfo2Str( creditsPriceInfo, self:GetColor( self.layers.SUMMARY_COST_VAL ), false, false, true, nil )
		str = string.format( "%s%s%s", str, str ~= "" and " " or "", strCredits )

	end

	if cost_gold > 0 then

    	local goldPriceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_GOLD,
    		val			= cost_gold,
    		bIsBuyPrice	= true,
    		basePrice	= cost_gold,
    	}

    	local strGold = UI:PriceInfo2Str( goldPriceInfo, self:GetColor( self.layers.SUMMARY_COST_VAL ), false, false, true, nil )
		str = string.format( "%s%s%s", str, str ~= "" and " " or "", strGold )

	end
	
	self.summaryCostMetaText:SetText( str, true )

end


--
function UI.ShipCustomizationWnd:UpdateActionBtnState()

	local bNeedAction = false

	for customizationType, userChoice in pairs( self.userChoices ) do
		if userChoice.itemData and not userChoice.itemData.bApplied and self:IsCustomizationBuyConfirmed( customizationType ) then
			bNeedAction = true
			break
		end
	end

	UI.ShipCustomization_ActionBtn:Enable( bNeedAction )

end 


--
function UI.ShipCustomizationWnd:IsCustomizationBuyConfirmed( customizationType )

	local confirmBuyWnd = self:GetConfirmBuyWnd( customizationType, true )
	return confirmBuyWnd ~= nil and confirmBuyWnd:IsChecked()

end


--
function UI.ShipCustomizationWnd:TryBuy()

	if self:IsWaitingRequest() then
		return
	end

	if not self.selShipItem then
		return
	end

	self.buyInfo = {}
	self.buyInfo.vid = self.selShipItem.vid
	self.buyInfo.items = {}

	local cost_credits = 0
	local cost_gold = 0
	local bPrevCustomizationLost = false

	-- #0083985 - при покупке одинаковых кастомизаций (например, цветов), плата будет взята только за один
	local doubleVustomizations = {}

	for customizationType, userChoice in pairs( self.userChoices ) do

		if userChoice.itemData and not userChoice.itemData.bApplied and self:IsCustomizationBuyConfirmed( customizationType ) then

			self.buyInfo.items[ customizationType ] = UI:CopyTable2( userChoice )

			if not userChoice.itemData.bFree then

				if not doubleVustomizations[ userChoice.itemData.itemName ] then

            		local price, bGold = self:GetItemPrice( customizationType, userChoice.itemData )

            		if bGold then
            		    cost_gold = cost_gold + price
            		else
            			cost_credits = cost_credits + price
            		end

					doubleVustomizations[ userChoice.itemData.itemName ] = true

				end

			end

			if not bPrevCustomizationLost then 

				local appliedItemName = self:GetAppliedItemName( customizationType )
				if appliedItemName ~= "" and not self:IsItemFreeByName( appliedItemName ) then
					bPrevCustomizationLost = true
				end

				if not bPrevCustomizationLost then

					if customizationType == self.customizationTypes.PRESET then

						local affectedCustomTypes = self:GetPresetAffectedCustomTypes( presetName )
						for affectedCustomType, dummy in pairs( affectedCustomTypes ) do

            				local affectedAppliedItemName = self:GetAppliedItemName( affectedCustomType )
            				if affectedAppliedItemName ~= "" and not self:IsItemFreeByName( affectedAppliedItemName ) then

            					bPrevCustomizationLost = true
								break

            				end

						end

					else

						local appliedPresetName = self:GetAppliedItemName( self.customizationTypes.PRESET )
						if appliedPresetName ~= "" and not self:IsItemFreeByName( appliedPresetName ) then

							local affectedCustomTypes = self:GetPresetAffectedCustomTypes( presetName )
							if affectedCustomTypes[ customizationType ] then
            					bPrevCustomizationLost = true
							end

						end

					end

				end

			end

		end

	end

	if not next( self.buyInfo.items ) then
		sys.log( "UI.ShipCustomizationWnd:TryBuy()[ERROR]: no items to buy" )
		return
	end

	self:LaunchBuyWnd( { credits = cost_credits, gold = cost_gold, bPrevCustomizationLost = bPrevCustomizationLost } )

end


--
function UI.ShipCustomizationWnd:DoBuy()

	local buyData = {}	

	for customizationType, userChoice in pairs( self.buyInfo.items ) do

		local buyElement =
		{
			defName		= userChoice.itemData.itemName,
			slot		= self:CustomizationType2Slot( customizationType ),
			duration	= -1,
		}

		table.insert( buyData, buyElement )

	end

	local appliedPresetName = self:GetAppliedItemName( self.customizationTypes.PRESET )
	if appliedPresetName ~= "" then

		local bResetPreset = false

		local affectedCustomTypes = self:GetPresetAffectedCustomTypes( appliedPresetName )

    	for customizationType, userChoice in pairs( self.buyInfo.items ) do

    		if affectedCustomTypes[ customizationType ] then
				bResetPreset = true
				break
    		end

    	end

		if bResetPreset then

			local presetSlotId = self:CustomizationType2Slot( self.customizationTypes.PRESET )

			local bHasResetData = false
			for idx, data in pairs( buyData ) do
				if data.slot == presetSlotId and data.defName == "" then
					bHasResetData = true
					break
				end
			end

			if not bHasResetData then

        		local buyElement =
        		{
        			defName		= "",
        			slot		= presetSlotId,
        			duration	= -1,
        		}		

            	table.insert( buyData, buyElement )		

			end

		end		

	end

	self.buyRequestId = _G.GameStore_BuyVesselCustomElements( self.buyInfo.vid, buyData )

	if self.buyRequestId == 0 then
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end	

	self:UpdateWaitEffect()
	self:CheckResetBuyInfo()

end


--
function UI.ShipCustomizationWnd:GetItemRecordByVceid( vceid )

	for rowIdx = 1, self.itemsList:GetNumRecords() do
		local rowData = self.itemsList:GetRecordData( rowIdx )

		for slotIdx, slotData in pairs( rowData.slots ) do
			if slotData.vceid == vceid then
				return rowIdx, slotIdx
			end
		end

	end		

	return -1, -1

end


--
function UI.ShipCustomizationWnd:GetItemRecordByName( itemName )

	for rowIdx = 1, self.itemsList:GetNumRecords() do
		local rowData = self.itemsList:GetRecordData( rowIdx )

		for slotIdx, slotData in pairs( rowData.slots ) do
			if slotData.itemName == itemName then
				return rowIdx, slotIdx
			end
		end

	end

	return -1, -1

end


--
function UI.ShipCustomizationWnd:OnCustomizationBought( buyData )

	self:UpdateItemsListOnCustomizationChanged()
	self:UpdateUserChoicesOnCustomizationChanged()
	self:UpdateUserChoiceRelatedControls()

end


--
function UI.ShipCustomizationWnd:OnCustomizationExpired( expiredData )

	self:UpdateItemsListOnCustomizationChanged()
	self:UpdateUserChoicesOnCustomizationChanged()
	self:UpdateUserChoiceRelatedControls()

end


function UI.ShipCustomizationWnd:UpdateItemsListOnCustomizationChanged()

	for rowIdx = 1, self.itemsList:GetNumRecords() do
		local rowData = self.itemsList:GetRecordData( rowIdx )

		for slotIdx, slotData in pairs( rowData.slots ) do

			local bAppliedOld = slotData.bApplied
			slotData.bApplied = self:IsItemApplied( slotData.itemName, slotData.customizationType )

			if bAppliedOld ~= slotData.bApplied then

    			local slotWnd = self:GetItemSlotWnd( rowIdx, slotIdx )
    			if slotWnd then
    	        	slotWnd:OnCustomizationChanged()
    			end

			end

		end

	end

end


--
function UI.ShipCustomizationWnd:UpdateUserChoicesOnCustomizationChanged()

	for customizationType, userChoice in pairs( self.userChoices ) do
		if userChoice.itemData then
			userChoice.itemData.bApplied = self:IsItemApplied( userChoice.itemData.itemName, customizationType )
		end
	end

end


--
function UI.ShipCustomizationWnd:LaunchBuyWnd( buyWndInfo )

	UI.ShipCustomization_BuyWnd:Setup( UI.ShipCustomization_BuyWnd.modes.SHIP_CUSTOMIZATION, true, buyWndInfo )
	UI.ShipCustomization_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipCustomizationWnd:IsVceidValid( vceid )

	return vceid and vceid ~= 0 and vceid ~= -1

end


--
function UI.ShipCustomizationWnd:OnFreeCustomizationsChanged()

	local selTab = -1
	
	local selTab_main = self.tabsList:GetSelectedMainCategoryRecord()
	local selTab_sub = self.tabsList:GetSelectedSubCategoryRecord()
	
	if selTab_sub ~= -1 then
		selTab = selTab_sub
	elseif selTab_main ~= -1 then
		selTab = selTab_main
	end	

	self.dataToRestore =
	{
		userChoices	= self.userChoices,
		selTab		= selTab,
	}

	self:FullUpdate()

end


--
function UI.ShipCustomizationWnd:GetPresetAffectedCustomTypes( presetName )

	local customizationTypes = {}

	if presetName and presetName ~= "" then

    	local customizations = UI:GetShipCustomizationsInPreset( presetName )
    	for slotId, customName in pairs( customizations ) do

    		local customizationType = self:CustomizationSlot2Type( slotId )
    		if customizationType ~= -1 then
    			customizationTypes[ customizationType ] = true
    		end		

    	end

	end

	return customizationTypes

end


--
function UI.ShipCustomizationWnd:MoveCameraToSelCustomization()

	local customizationType = self:GetSelCustomizationType()
	if customizationType >= self.customizationTypes.CHILD_1 and customizationType <= self.customizationTypes.CHILD_1 + self.MAX_CHILD - 1 then

		local aiCustomSlotId = self:CustomizationType2Slot( customizationType )
    	if aiCustomSlotId ~= -1 then
			_G.DirectHangarCameraToCustomization( self.selShipEntId, aiCustomSlotId )
		else
    		sys.log( "UI.ShipCustomizationWnd:MoveCameraToSelCustomization()[ERROR]: invalid customizationType: %d", customizationType )
    	end

	end

end


-- ----------------------------------------------------------------
-- UI.ShipCustomization_TabsListWnd
-- ----------------------------------------------------------------

UI.ShipCustomization_TabsListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "StoreCategoriesListWnd",

		props =
		{
			name	= "ItemCraftMulty_CategoriesListWnd",
		}
	},
	
	slotPrototypeMain	= "ShipCustomization_TabsSlotWnd_main",
	slotPrototypeSub	= "ShipCustomization_TabsSlotWnd_sub",
}

-- ----------------------------------------------------------------
-- UI.ShipCustomization_TabsSlotWnd
-- ----------------------------------------------------------------

UI.ShipCustomization_TabsSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

local l_numCheckBoxBaseLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.ShipCustomization_TabsSlotWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "StoreCategoriesSlotWnd",
	
	props =
	{
		name		= "ShipCustomization_TabsSlotWnd",
		isPrototype	= true,
	},
	
	layers =
	{
		numLayers = l_numCheckBoxBaseLayers + 2,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- DISABLED_EFFECT
		{
			id			= l_numCheckBoxBaseLayers,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_categories_slot_disable",
				defaultAnimation	= "idle",
			}}
		},

		-- TEXT
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

-- перегрузка
function UI.ShipCustomization_TabsSlotWnd:FullUpdate()

	local data = self:GetRecordData()
	if not data then
		sys.log( "UI.ShipCustomization_TabsSlotWnd:FullUpdate()[ERROR]: nil data" )
		return
	end

	self:UpdateText( data )
	self:UpdateIco( data )
	self:UpdateDisabledState( data )
	
end


-- перегрузка
function UI.ShipCustomization_TabsSlotWnd:FullReset()

	self.parentListWnd	= nil
	self.recordIdx		= -1

	self:SetText( "", self.layers.TEXT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	
	self:SetLayerVisible( false, self.layers.DISABLED_EFFECT )
	
	self:SetGray( false )

	self:Select( false )
	self:SetAlpha( 1 )
	self:Enable( true )

end


-- перегрузка
function UI.ShipCustomization_TabsSlotWnd:OnSaleStateChanged()
	-- ничего
end


-- перегрузка
function UI.StoreCategoriesSlotWnd:GetTooltipData()

	return nil
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipCustomization_TabsSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
	DEBUG			= 1,
	DISABLED_EFFECT	= 2,
    TEXT			= 3,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipCustomization_TabsSlotWnd:UpdateText( data )
	
	local customizationTipeName = UI:Val2Key( UI.ShipCustomizationWnd.customizationTypes, data.customizationType )
	local strId = string.format( "customization_%s", customizationTipeName )

	if data.customizationType == UI.ShipCustomizationWnd.customizationTypes.STICKER and data.groupId ~= -1 then
		local groupName = UI:Val2Key( _G.StickerGroups, data.groupId )
		strId = string.format( "%s_%s", strId, groupName )
	end

	local str = "unknown"

	if strId ~= "" then
		str = UI:GetStringByName( strId )
	end

	self:SetText( str, self.layers.TEXT )

end


--
function UI.ShipCustomization_TabsSlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end	

	local customizationTipeName = UI:Val2Key( UI.ShipCustomizationWnd.customizationTypes, data.customizationType )
	local texId = string.format( "customization_%s", customizationTipeName )

	if data.customizationType == UI.ShipCustomizationWnd.customizationTypes.STICKER and data.groupId ~= -1 then
		local groupName = UI:Val2Key( _G.StickerGroups, data.groupId )
		texId = string.format( "%s_%s", texId, groupName )
	end

	if texId == "" then
		texId = "NoData"
	end

	local hIco = UI:GetTex( texId )
	mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName, hIco )

end


--
function UI.ShipCustomization_TabsSlotWnd:UpdateDisabledState( data )
	
	local bDisabled = data and data.bDisabled or false
	self:SetLayerVisible( bDisabled, self.layers.DISABLED_EFFECT )
	
	self:SetGray( bDisabled )	-- чтобы не реагировало на наведение мыши; Enable( false ) нельзя, т.к. это используется в логике родительского списка
	
end


-- -------------------------------------------------------------------
-- UI.ShipCustomization_TabsSlotWnd_main
-- -------------------------------------------------------------------

UI.ShipCustomization_TabsSlotWnd_main =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipCustomization_TabsSlotWnd",
		
		props =
		{
			name		= "ShipCustomization_TabsSlotWnd_main",
			isPrototype	= true,
		},
	
		layers =
		{
			numLayers = l_numCheckBoxBaseLayers + 2,
			
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,
	
				effects =
				{{
					defName 			= "shop_categories_slotMain",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "value",
							layer		= "UI.ShipCustomization_TabsSlotWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						
						{
							objName		= "red_bg",
							layer		= "UI.ShipCustomization_TabsSlotWnd.layers.DISABLED_EFFECT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
		}
	}
}


-- -------------------------------------------------------------------
-- UI.ShipCustomization_TabsSlotWnd_sub
-- -------------------------------------------------------------------

UI.ShipCustomization_TabsSlotWnd_sub =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipCustomization_TabsSlotWnd",
		
		props =
		{
			name		= "ShipCustomization_TabsSlotWnd_sub",
			isPrototype	= true,
		},
	
		layers =
		{
			numLayers = l_numCheckBoxBaseLayers + 2,
			
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,
	
				effects =
				{{
					defName 			= "shop_categories_slotSub",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
		
						{
							objName		= "value",
							layer		= "UI.ShipCustomization_TabsSlotWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	}
}

-- -------------------------------------------------------------------------
-- UI.ShipCustomization_ItemsListWnd
-- -------------------------------------------------------------------------

UI.ShipCustomization_ItemsListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipCustomization_ItemsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "ShipCustomization_ItemsListWnd",
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
				defName 			= "shipCustomization_itemsList",
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
-- interfacde functions
-- -----------------------------------

--
function UI.ShipCustomization_ItemsListWnd:GetSelectedSlot()

	return self.selSlotIdx

end


--
function UI.ShipCustomization_ItemsListWnd:SelectSlot( recordIdx, slotIdx )

	local oldSelRecordIdx = self.selRecordIdx

	if recordIdx == self.selRecordIdx and slotIdx == self.selSlotIdx then
		return
	end

	self.bSilent = true
	self:SelectRecord( recordIdx, false )
	self.bSilent = false

	if recordIdx ~= -1 then

		if slotIdx ~= -1 and ( slotIdx < 1 or slotIdx > self.MAX_SLOTS_IN_ROW ) then
			sys.log( "UI.ShipCustomization_ItemsListWnd:SelectSlot()[ERROR]: invalid slot %s for record %s", tostring( slotIdx ), tostring( recordIdx ) )
		end

	end

	self:SelectSlotInternal( slotIdx )

	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, 0, 0 )

end


--
function UI.ShipCustomization_ItemsListWnd:Clear()

	if not UI:IsInRemovingAllWindows() then
		UI.ButtonsList3Wnd.Clear( self )
	end

	self.selSlotIdx = -1

end


--
function UI.ShipCustomization_ItemsListWnd:ScrollSlot( bForward )

	if self.selSlotIdx == -1 then
		return
	end

	local selRecordIdx = self:GetSelectedRecord()
	if selRecordIdx == -1 then
		return
	end

	local nextSlotIdx = self.selSlotIdx + ( bForward and 1 or -1 )
	if nextSlotIdx < 1 or nextSlotIdx > self:GetNumSlotsForRecord( selRecordIdx ) then
		return
	end

	self:SelectSlot( selRecordIdx, nextSlotIdx )

end


--
function UI.ShipCustomization_ItemsListWnd:GetNumSlotsForRecord( recordIdx )

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		return 0
	end

	local rowWnd = self:GetButtonForRecord( recordIdx )
	if not rowWnd then
		return 0
	end

	return rowWnd:GetNumSlots()	

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.ShipCustomization_ItemsListWnd.btnPrototypeName = "ShipCustomization_ItemsRowWnd"

UI.ShipCustomization_ItemsListWnd.effectInfo =
{
	main =
	{
		scrollObjName		= "scroll_max",
		slotObjNamePrefix	= "slot_",
		animIdle			= "idle",
	}
}

UI.ShipCustomization_ItemsListWnd.MAX_SLOTS 	= 4
UI.ShipCustomization_ItemsListWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.ShipCustomization_ItemsListWnd.MAX_SLOTS_IN_ROW	= 2

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ShipCustomization_ItemsListWnd.selSlotIdx	= -1

-- ------------------------------------
-- work functions
-- ------------------------------------   

--
function UI.ShipCustomization_ItemsListWnd:ValidateSelSlot()

	if self.selSlotIdx == -1 or self.selRecordIdx == -1 then
		return
	end

	local newSlotIdx = self.selSlotIdx

	local rowWnd = self:GetButtonForRecord( self.selRecordIdx )
	if rowWnd then
		newSlotIdx = UI:Clamp( newSlotIdx, 1, rowWnd:GetNumSlots() )
	else			
		newSlotIdx = -1
	end	

	self:SelectSlotInternal( newSlotIdx )

end


--
function UI.ShipCustomization_ItemsListWnd:SelectRecordInternal( recordIdx, bAnimated )

	local oldSelRecordIdx = self.selRecordIdx
	local oldSelSlotIdx = self.selSlotIdx

	local wasSilent = self.bSilent
	self.bSilent = true

	UI.BaseListWnd.SelectRecordInternal( self, recordIdx, bAnimated )

	self:ValidateSelSlot()

	if not wasSilent then
		self.bSilent = false
	end

	if not self.bSilent and ( oldSelRecordIdx ~= self.selRecordIdx or oldSelSlotIdx ~= self.selSlotIdx ) then
		UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, 0, 0 )
	end

end


--
function UI.ShipCustomization_ItemsListWnd:SelectSlotInternal( slotIdx )

	if self.selSlotIdx == slotIdx then
		return
	end

	self.selSlotIdx = slotIdx

	if self.selRecordIdx ~= -1 then

		local rowWnd = self:GetButtonForRecord( self.selRecordIdx )
		if rowWnd then
			rowWnd:OnSelectSlot( slotIdx )
		end

	end

end   

-- -------------------------------------------------------------------------
-- UI.ShipCustomization_ItemsRowWnd
-- -------------------------------------------------------------------------

UI.ShipCustomization_ItemsRowWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipCustomization_ItemsRowWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "ShipCustomization_ItemsRowWnd",
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
				defName 			= "shipCustomization_itemsRow",
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
-- interface functions
-- -----------------------------------

--
function UI.ShipCustomization_ItemsRowWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	for slotIdx, slotWnd in pairs( self.slots ) do
		self:HideSlot( slotIdx ) 
	end

end


--
function UI.ShipCustomization_ItemsRowWnd:Select( bSelect, bAnimated )

	self:UpdateSlotSelection()

end


--
function UI.ShipCustomization_ItemsRowWnd:OnSelectSlot( slotIdx )

	self:UpdateSlotSelection()

end


--
function UI.ShipCustomization_ItemsRowWnd:GetSelectedSlot()

	if not self:IsSelected() then
		return -1
	end

	local list = self:GetList()
	if not list then
		return -1
	end

	return list:GetSelectedSlot()

end


--
function UI.ShipCustomization_ItemsRowWnd:GetSlotData( slotIdx )

	local data = self:GetRecordData()
	return data and data.slots[ slotIdx ]

end


--
function UI.ShipCustomization_ItemsRowWnd:GetSlotWnd( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd and slotWnd:IsChildOf( self ) then
		return slotWnd
	end

	return nil
	
end


--
function UI.ShipCustomization_ItemsRowWnd:GetNumSlots()

	local numSlots = 0

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			numSlots = numSlots + 1
		end
	end

	return numSlots

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.ShipCustomization_ItemsRowWnd.effectInfo =
{
	main =
	{
		slotPrefix = "slot_"
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ShipCustomization_ItemsRowWnd.slots = {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.ShipCustomization_ItemsRowWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateSlots()

end


--
function UI.ShipCustomization_ItemsRowWnd:CreateSlots()

	for slotIdx = 1, UI.ShipCustomization_ItemsListWnd.MAX_SLOTS_IN_ROW do

		local slotWnd = UI:CreateChildWnd( self, UI.ShipCustomization_ItemsSlotWnd, tostring( slotIdx ) )

		slotWnd:SetSlot( slotIdx )
		table.insert( self.slots, slotWnd )

	end	

end


--
function UI.ShipCustomization_ItemsRowWnd:UpdateForData( data, bAnimated )

	self:Reset()

	if not data then
		return
	end

	for slotIdx = 1, #data.slots do

		self:ShowSlot( slotIdx )

		local slotWnd = self.slots[ slotIdx ]
		if slotWnd then
			slotWnd:Setup( data.slots[ slotIdx ] )
		end		

	end

	self:UpdateSlotSelection()

end


--
function UI.ShipCustomization_ItemsRowWnd:UpdateSlotSelection()

	local selSlotIdx = self:GetSelectedSlot()

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Select( slotIdx == selSlotIdx )
		end
	end

end


--
function UI.ShipCustomization_ItemsRowWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.ShipCustomization_ItemsRowWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipCustomization_ItemsRowWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:UpdateEffects()
		end
	end

end


--
function UI.ShipCustomization_ItemsRowWnd:HideSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd then

		slotWnd:Reset()
		slotWnd:UnlinkFromParent()

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
		end

	end

end


--
function UI.ShipCustomization_ItemsRowWnd:ShowSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if not slotWnd then
		sys.log( "UI.ShipCustomization_RowWnd:ShowSlot()[ERROR]: cannot find slot %d", slotIdx )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local locatorName = string.format( "%s%d", self.effectInfo.main.slotPrefix, slotIdx )

	UI:AddChildAndLink( self, slotWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

end


-- -------------------------------------------------------------------------
-- UI.ShipCustomization_ItemsSlotWnd
-- -------------------------------------------------------------------------

UI.ShipCustomization_ItemsSlotWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ShipCustomization_ItemsSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipCustomization_ItemsSlotWnd",
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
				defName 			= "shipCustomization_itemsSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "eneble",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.APPLIED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "purchased",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.MARKET_PLACE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "purchased",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.LEFT_TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "icon",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "color",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.PRESET_COLORS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "select",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.SELECTION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "purchased",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.PRICE_FREE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- PRESET_COLORS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_presetColors",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "color_1",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.PRESET_COLOR_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "color_2",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.PRESET_COLOR_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "color_3",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.PRESET_COLOR_3_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PRESET_COLOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_presetColor1",
				defaultAnimation	= "idle",
			}}
		},

		-- PRESET_COLOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_presetColor2",
				defaultAnimation	= "idle",
			}}
		},

		-- PRESET_COLOR_3_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_presetColor3",
				defaultAnimation	= "idle",
			}}
		},

		-- SELECTION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_selection",
				defaultAnimation	= "idle",
			}}
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.ShipCustomization_ItemsSlotWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_FREE
		{
			layerType		= UI.LAYER_TEXT,
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "priceFree" ),
		},

		-- MARKET_PLACE
		{
			layerType		= UI.LAYER_TEXT,
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- LEFT_TIME
		{
			layerType		= UI.LAYER_TEXT,
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- APPLIED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_applied",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shipCustomization_itemsSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.ShipCustomization_ItemsSlotWnd:SetSlot( slotIdx )

	self.slotIdx = slotIdx

end


--
function UI.ShipCustomization_ItemsSlotWnd:GetSlot()

	return self.slotIdx

end


--
function UI.ShipCustomization_ItemsSlotWnd:GetRow()

	local parent = self:GetParent()
	return parent and parent:GetRecord() or -1

end


--
function UI.ShipCustomization_ItemsSlotWnd:Reset()

	self:Select( false )

	self:SetLayerVisible( false, self.layers.APPLIED_EFFECT )

	self:ResetTradeStatus()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.ICO_EFFECT )

	local presetColor1Effect = UI:GetEffectFromLayer( self, self.layers.PRESET_COLOR_1_EFFECT )
	if presetColor1Effect then
		presetColor1Effect:SetColor( UI.WHITE_COLOR )
	end

	local presetColor2Effect = UI:GetEffectFromLayer( self, self.layers.PRESET_COLOR_2_EFFECT )
	if presetColor2Effect then
		presetColor2Effect:SetColor( UI.WHITE_COLOR )
	end

	local presetColor3Effect = UI:GetEffectFromLayer( self, self.layers.PRESET_COLOR_3_EFFECT )
	if presetColor3Effect then
		presetColor3Effect:SetColor( UI.WHITE_COLOR )
	end

	self:SetLayerVisible( false, self.layers.PRESET_COLORS_EFFECT )
	self:SetLayerVisible( false, self.layers.PRESET_COLOR_1_EFFECT )
	self:SetLayerVisible( false, self.layers.PRESET_COLOR_2_EFFECT )
	self:SetLayerVisible( false, self.layers.PRESET_COLOR_3_EFFECT )

	self.data = nil
	self.tooltipData = nil
	self.leftTime = self.TIME_UNINITED

end


--
function UI.ShipCustomization_ItemsSlotWnd:Setup( data )

	self:Reset()

	self.data = data

	self:UpdateLeftTime()
	self:UpdateSelection()
	self:UpdateIco()
	self:UpdateAppliedEffect()
	self:UpdateTradeStatus()
	self:UpdateTooltip()

end


--
function UI.ShipCustomization_ItemsSlotWnd:Select( bSelect )

	self.bSelected = bSelect
	self:UpdateSelection()

end


--
function UI.ShipCustomization_ItemsSlotWnd:IsSelected()

	return self.bSelected

end


--
function UI.ShipCustomization_ItemsSlotWnd:OnCustomizationChanged()

	self:UpdateLeftTime()
	self:UpdateTradeStatus()
	self:UpdateTooltip()
	self:UpdateAppliedEffect()

end


--
function UI.ShipCustomization_ItemsSlotWnd:OnPlayerCreditsChanged()

	if self:IsLayerVisible( self.layers.PRICE_VAL ) then
		self:UpdatePriceVal()
	end

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateEffects()

	self:UpdateMouseOver()

end


--
function UI.ShipCustomization_ItemsSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipCustomization_ItemsSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipCustomizationWnd.sounds.itemMouseOver )
	end

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOver()

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.ShipCustomization_ItemsSlotWnd.layers =
{
    MAIN_EFFECT				= 0,
	ICO_EFFECT				= 1,
    PRESET_COLORS_EFFECT    = 2, 
    PRESET_COLOR_1_EFFECT   = 3, 
    PRESET_COLOR_2_EFFECT   = 4, 
    PRESET_COLOR_3_EFFECT   = 5, 
	SELECTION_EFFECT		= 6, 
    PRICE_EFFECT			= 7, 
    PRICE_VAL				= 8, 
	PRICE_FREE				= 9, 
	MARKET_PLACE			= 10,
	LEFT_TIME				= 11,
    APPLIED_EFFECT			= 12,
	MOUSE_OVER_EFFECT		= 13,
}

UI.ShipCustomization_ItemsSlotWnd.effectInfo =
{
	ico =
	{
		icoSpriteName		= "ico",
	},
}

UI.ShipCustomization_ItemsSlotWnd.TIME_UNINITED	= -2
UI.ShipCustomization_ItemsSlotWnd.TIME_FOREVER 	= -1

UI.ShipCustomization_ItemsSlotWnd.strBoughtTimeTooltipLabel = UI:GetStringByName( "stickers_timeLeftTooltip_label" )

-- -----------------------------------
-- vars
-- -----------------------------------

UI.ShipCustomization_ItemsSlotWnd.bSelected		= false
UI.ShipCustomization_ItemsSlotWnd.data			= nil
UI.ShipCustomization_ItemsSlotWnd.tooltipData	= nil
UI.ShipCustomization_ItemsSlotWnd.leftTime		= UI.ShipCustomization_ItemsSlotWnd.TIME_UNINITED
UI.ShipCustomization_ItemsSlotWnd.slotIdx		= -1
UI.ShipCustomization_ItemsSlotWnd.priceMetaText	= nil

-- -----------------------------------
-- work funciotns
-- -----------------------------------

--
function UI.ShipCustomization_ItemsSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL )

	self:Reset()

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipCustomization_ItemsSlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateLeftTime()

	self.leftTime = self:GetLeftTime()

end


--
function UI.ShipCustomization_ItemsSlotWnd:GetLeftTime()

	local time = self.TIME_UNINITED

	if not self.data.bApplied then
		return time
	end

	if self.data.bEmpty then
		return self.TIME_FOREVER
	end

	local shipItem = UI.ShipCustomizationWnd:GetSelShipItem()
	if shipItem then

		local vid = shipItem.vid
		local customSlotId = UI.ShipCustomizationWnd:CustomizationType2Slot( self.data.customizationType )

		time = _G.GameStore_GetAcquiredVesselCustomElementDuration( vid, customSlotId )

	end

	return time

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateSelection()

	self:SetLayerVisible( self.bSelected, self.layers.SELECTION_EFFECT )

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateIco()

	if self.data.customizationType == UI.ShipCustomizationWnd.customizationTypes.PRESET and not self.data.bEmpty then
	
		local hTex, color = self:GetIco()
		if hTex ~= UI.INVALID_RESOURCE_HANDLE then
		
			self:SetLayerVisible( true, self.layers.ICO_EFFECT )
			
			local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
			if icoEffect then
				icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
				icoEffect:SetColor( color )
			end

		else

			self:SetLayerVisible( true, self.layers.PRESET_COLORS_EFFECT )
			self:SetLayerVisible( true, self.layers.PRESET_COLOR_1_EFFECT )
			self:SetLayerVisible( true, self.layers.PRESET_COLOR_2_EFFECT )
			self:SetLayerVisible( true, self.layers.PRESET_COLOR_3_EFFECT )	

			local color1 = UI:GetShipCustomPresetColor( self.data.itemName, ai.VesselCustomSlot.MATERIAL_0 )
			local color2 = UI:GetShipCustomPresetColor( self.data.itemName, ai.VesselCustomSlot.MATERIAL_1 )
			local color3 = UI:GetShipCustomPresetColor( self.data.itemName, ai.VesselCustomSlot.MATERIAL_2 )

			local color1Effect = UI:GetEffectFromLayer( self, self.layers.PRESET_COLOR_1_EFFECT )
			if color1Effect then
				color1Effect:SetColor( color1 )
			end

			local color2Effect = UI:GetEffectFromLayer( self, self.layers.PRESET_COLOR_2_EFFECT )
			if color2Effect then
				color2Effect:SetColor( color2 )
			end

			local color3Effect = UI:GetEffectFromLayer( self, self.layers.PRESET_COLOR_3_EFFECT )
			if color3Effect then
				color3Effect:SetColor( color3 )
			end
			
		end

	else

		self:SetLayerVisible( true, self.layers.ICO_EFFECT )

    	local hTex, color = self:GetIco()

    	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
		if icoEffect then
	    	icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
    		icoEffect:SetColor( color )
		end

	end 
	
end


--
function UI.ShipCustomization_ItemsSlotWnd:GetIco()

	local hTex = UI.INVALID_RESOURCE_HANDLE
	local color = UI.WHITE_COLOR
	local bCanTexMiss = false

	if self.data.customizationType == UI.ShipCustomizationWnd.customizationTypes.STICKER then

    	if self.data.bEmpty then
    		hTex = UI:GetTex( "sticker_none" )
    	else
    		hTex = UI:GetStickerIco( self.data.itemName )
    	end

	elseif self.data.customizationType >= UI.ShipCustomizationWnd.customizationTypes.COLOR_1 and self.data.customizationType <= UI.ShipCustomizationWnd.customizationTypes.COLOR_1 + UI.ShipCustomizationWnd.NUM_COLORS - 1 then

    	if self.data.bEmpty then
    		hTex = UI:GetTex( "sticker_none" )

    	else
			hTex, color = UI:GetShipMaterialIcoColor( self.data.itemName )
    	end

	elseif self.data.customizationType == UI.ShipCustomizationWnd.customizationTypes.PRESET then

    	if self.data.bEmpty then
    		hTex = UI:GetTex( "sticker_none" )

    	else
			hTex = UI:GetShipCustomPresetIco( self.data.itemName )
			bCanTexMiss = true
    	end

	elseif self.data.customizationType >= UI.ShipCustomizationWnd.customizationTypes.CHILD_1 and self.data.customizationType <= UI.ShipCustomizationWnd.customizationTypes.CHILD_1 + UI.ShipCustomizationWnd.MAX_CHILD - 1 then

    	if self.data.bEmpty then
    		hTex = UI:GetTex( "sticker_none" )
    	else
    		hTex = UI:GetShipCustomChildIco( self.data.itemName )
    	end

	else
		sys.log( "UI.ShipCustomization_ItemsSlotWnd:GetIco()[ERROR]: unhandled customization type: %s", tostring( self.data.customizationType ) )
	end

	if hTex == UI.INVALID_RESOURCE_HANDLE and not bCanTexMiss then
		hTex = UI:GetTex( "NoData" )
	end

	return hTex, color

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateAppliedEffect()

	self:SetLayerVisible( self.data.bApplied, self.layers.APPLIED_EFFECT )

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateTradeStatus()

	self:ResetTradeStatus()

	if not self.data.bEmpty then

    	if self.data.bApplied then

    		self:SetLayerVisible( true, self.layers.LEFT_TIME )
    		self:UpdateLeftTimeVal()

		else

			if self.data.bFree then
    			self:SetLayerVisible( true, self.layers.PRICE_FREE )

        	else

        		if self.data.marketPlace == _G.MarketPlaceTypes.NATIVE then

        			self:SetPriceVisible( true )
        			self:UpdatePriceVal()

        		else

        			self:SetLayerVisible( true, self.layers.MARKET_PLACE )
        			self:UpdateMarketPlaceVal()

        		end

        	end	

		end

	end

end


--
function UI.ShipCustomization_ItemsSlotWnd:ResetTradeStatus()

	self:SetLayerVisible( false, self.layers.LEFT_TIME )
	self:SetLayerVisible( false, self.layers.MARKET_PLACE )
	self:SetLayerVisible( false, self.layers.PRICE_FREE )
	self:SetPriceVisible( false )

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateLeftTimeVal()

	local text = ""

	if self.leftTime == -1 then
		text = UI:GetStringByName( "stickers_boughtPermanent" )

	elseif self.leftTime >= 0 then
		text = UI:Time2Str6( self.leftTime )
	end

	self:SetText( text, self.layers.LEFT_TIME )

end


--
function UI.ShipCustomization_ItemsSlotWnd:SetPriceVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.PRICE_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.PRICE_VAL )

	if not bVisible then
		self.priceMetaText:SetText( "", true )
	end

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdatePriceVal()

	local price, bGold = UI.ShipCustomizationWnd:GetItemPrice( self.data.customizationType, self.data )

	local priceInfo =
	{
		priceType	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS,
		val			= price,
		bIsBuyPrice	= true,
		basePrice	= price,
	}

	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, false, true, nil )

	self.priceMetaText:SetText( strPrice, true )

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateMarketPlaceVal()

	local marketPlaceTypeName = UI:Val2Key( _G.MarketPlaceTypes, self.data.marketPlace )
	local strId = string.format( "ships_marketPlace_%s", marketPlaceTypeName )
	local text = UI:GetStringByName( strId )

	self:SetText( text, self.layers.MARKET_PLACE )

end


--
function UI.ShipCustomization_ItemsSlotWnd:UpdateTooltip()

	if not self.data then
		self.tooltipData = nil
		return
	end

	self.tooltipData = {}
	self.tooltipData.tooltipType = UI.tooltipTypes.CUSTOMIZATION

	if self.data.bEmpty then

		local customSlot = UI.ShipCustomizationWnd:CustomizationType2Slot( self.data.customizationType )
		local customType = ai.VesselCustomSlotType[ customSlot ]

		self.tooltipData.type = customType

	else
		self.tooltipData.defName = self.data.itemName
	end

end


--
function UI.ShipCustomization_ItemsSlotWnd:GetOnScreenTooltip()

	local curTooltipWnd = UI:GetCurTooltip()	
	if curTooltipWnd and curTooltipWnd:IsOnScreen() and UI:GetCurTooltipTarget() == self then
		return curTooltipWnd
	else
		return nil
	end

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:Reset()

end


--
function UI.ShipCustomization_ItemsSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.leftTime ~= self.TIME_FOREVER and self.leftTime ~= self.TIME_UNINITED then

		local prevLeftTime = self.leftTime
		self:UpdateLeftTime()

    	if UI:Round( self.leftTime ) ~= UI:Round( prevLeftTime ) then
    		self:UpdateLeftTimeVal()
		end

	end

end


-- -------------------------------------------------------------------------
-- UI.ShipCustomization_ConfirmBuyWnd
-- -------------------------------------------------------------------------

UI.ShipCustomization_ConfirmBuyWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipCustomization_ConfirmBuyWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipCustomization_ConfirmBuyWnd",
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
				defName 			= "shipCustomization_confirmBuy",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ShipCustomization_ConfirmBuyWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price",
						layer		= "UI.ShipCustomization_ConfirmBuyWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.ShipCustomization_ConfirmBuyWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipCustomization_ConfirmBuyWnd:Init( customizationType )

	self.customizationType = customizationType

	self:UpdateText()

end


--
function UI.ShipCustomization_ConfirmBuyWnd:Reset()

	self.priceMetaText:SetText( "", true )
	
	self.checkBox:Check( false )
	self.checkBox:Enable( false )

	self:AnimateInactive()

end


--
function UI.ShipCustomization_ConfirmBuyWnd:GetCustomizationType()

	return self.customizationType

end


--
function UI.ShipCustomization_ConfirmBuyWnd:IsChecked()

	return self.checkBox:IsChecked()

end


--
function UI.ShipCustomization_ConfirmBuyWnd:Check( bCheck )

	if bCheck and not self.checkBox:IsEnabled() then
		sys.log( "UI.ShipCustomization_ConfirmBuyWnd()[ERROR]: not enabled" )
		return
	end

	self.checkBox:Check( bCheck )

end


--
function UI.ShipCustomization_ConfirmBuyWnd:Update()

	self:Reset()

	local userChoice = UI.ShipCustomizationWnd:GetUserChoice( self.customizationType )
	if not userChoice or not userChoice.itemData or userChoice.itemData.bApplied then
		return
	end

	self.checkBox:Enable( true )

	self:AnimateActive()

	if userChoice.bChecked then
		self:Check( true )
	end

	self:UpdatePrice( userChoice )

end


--
function UI.ShipCustomization_ConfirmBuyWnd:IsEnabled()

	return self.checkBox:IsEnabled()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipCustomization_ConfirmBuyWnd.layers =
{
    MAIN_EFFECT			= 0,
    TEXT				= 1,
    PRICE_EFFECT		= 2,
    PRICE_VAL			= 3,
}

UI.ShipCustomization_ConfirmBuyWnd.effectInfo =
{
	main =
	{
		checkBoxLocator	= "chek_box",
		animActive		= "idle",
		animInactive	= "disable",
	},
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipCustomization_ConfirmBuyWnd.customizationType	= -1
UI.ShipCustomization_ConfirmBuyWnd.checkBox				= nil
UI.ShipCustomization_ConfirmBuyWnd.priceMetaText		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipCustomization_ConfirmBuyWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL )

	self:Reset()

end


--
function UI.ShipCustomization_ConfirmBuyWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipCustomization_ConfirmBuyWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipCustomization_ConfirmBuyWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipCustomization_ConfirmBuyWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )

end


--
function UI.ShipCustomization_ConfirmBuyWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipCustomization_ConfirmBuyWnd:CreateControls()

	self.checkBox = UI:CreateChildWnd( self, UI.ShipCustomization_CheckBox, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.checkBox, mainEffect, self.effectInfo.main.checkBoxLocator, UI.EffectAnimParams.POS )

end


--
function UI.ShipCustomization_ConfirmBuyWnd:AnimateActive()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animActive )
	end

end


--
function UI.ShipCustomization_ConfirmBuyWnd:AnimateInactive()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animInactive )
	end

end


--
function UI.ShipCustomization_ConfirmBuyWnd:UpdateText()

	local customizationTipeName = UI:Val2Key( UI.ShipCustomizationWnd.customizationTypes, self.customizationType )
	local strId = string.format( "customization_%s", customizationTipeName )

	local str = UI:GetStringByName( strId )
	self:SetText( str, self.layers.TEXT ) 

end


--
function UI.ShipCustomization_ConfirmBuyWnd:UpdatePrice( userChoice )

	local strPrice = ""

	-- #0083985 - при покупке одинаковых кастомизаций (например, цветов), плата будет взята только за один
	local minChosenDoubleCustomType = -1

	for customizationTypeName, customizationType in pairs( UI.ShipCustomizationWnd.customizationTypes ) do

		local _userChoice = UI.ShipCustomizationWnd:GetUserChoice( customizationType )
		if _userChoice and _userChoice.itemData and not _userChoice.itemData.bApplied and not _userChoice.itemData.bFree and UI.ShipCustomizationWnd:IsCustomizationBuyConfirmed( customizationType ) and _userChoice.itemData.itemName == userChoice.itemData.itemName then

			if minChosenDoubleCustomType == -1 or customizationType < minChosenDoubleCustomType then
				minChosenDoubleCustomType = customizationType
			end

		end
	end

	if userChoice.itemData.bApplied or userChoice.itemData.bFree or minChosenDoubleCustomType ~= -1 and self.customizationType ~= minChosenDoubleCustomType then

		strPrice = UI:GetStringByName( "priceFree" )

	else

    	local price, bGold = UI.ShipCustomizationWnd:GetItemPrice( self.customizationType, userChoice.itemData )

    	local priceInfo =
    	{
    		priceType	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS,
    		val			= price,
    		bIsBuyPrice	= true,
    		basePrice	= price,
    	}

    	strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE_VAL ), false, false, true, nil )

	end

    self.priceMetaText:SetText( strPrice, true )

end


-- -------------------------------------------------------------------------
-- UI.ShipCustomization_CheckBox
-- -------------------------------------------------------------------------

UI.ShipCustomization_CheckBox =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "ShipCustomization_CheckBox",
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
    				defName 			= "shipCustomization_checkBox",
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
	},

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "idle_over",
    		animationPressed	= "idle_over",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "chek",
    		animationSelect		= "chek_over",
    		animationPressed	= "chek_over",
    		animationDisabled	= "disable_chek",
    	},
    },
}

-- -------------------------------------------------------------------------
-- UI.ShipCustomization_DuartionsComboBox
-- -------------------------------------------------------------------------

UI.ShipCustomization_DuartionsComboBox =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "ShipCustomization_DuartionsComboBox"
		},
	},

	MAX_VISIBLE_RECORDS = 5
}

-- -------------------------------------------------------------------------
-- UI.ShipCustomization_ActionBtn
-- -------------------------------------------------------------------------

UI.ShipCustomization_ActionBtn = {}

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipCustomization_ActionBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Stickers_ActionBtn",
		selectSound	= UI.sounds.btnMouseOver,
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
				defName 			= "shop_buyBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",	
						layer		= "UI.ShipCustomization_ActionBtn.layers.TEXT",
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
			text			= UI:GetStringByName( "stickers_btnText_apply" ),
		}, 
	}	
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipCustomization_ActionBtn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )

end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipCustomization_ActionBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

UI.ShipCustomization_ActionBtn.effectInfo =
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

-- -------------------------------------------------------------------------
-- UI.ShipCustomization_CrossBtn
-- -------------------------------------------------------------------------

UI.ShipCustomization_CrossBtn =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name		= "ShipCustomization_CrossBtn",
    	},
	}
}

-- -------------------------------------------------------------------
-- UI.ShipCustomization_BuyWnd
-- -------------------------------------------------------------------

UI.ShipCustomization_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "ShipCustomization_BuyWnd",
    	},
	},

	mainWndName = "ShipCustomizationWnd",
}