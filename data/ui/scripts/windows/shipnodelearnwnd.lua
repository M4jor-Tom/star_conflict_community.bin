-- --------------------------------------------------------------------
-- UI.ShipNodeLearnWnd
-- --------------------------------------------------------------------

UI.ShipNodeLearnWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

--
UI.ShipNodeLearnWnd.layers =
{
	MAIN_EFFECT						= 0,
	BG_EFFECT						= 1, 
	WORK_EFFECT						= 2, 
    CAPTION							= 3, 
    DESC							= 4, 
	PRICE                           = 5,
    WORK_1_EFFECT					= 6, 
	ANIMATION_EFFECT				= 7,
    WAIT_EFFECT						= 8, 
    WAIT_TEXT						= 9, 
}


--
UI.ShipNodeLearnWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name		= "ShipNodeLearnWnd",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipNodeLearnWnd.layers.ANIMATION_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "alienShipCraftWnd_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bg",
						layer		= "UI.ShipNodeLearnWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						layer		= "UI.ShipNodeLearnWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "whiteBg",
				defaultAnimation	= "idle",
			}},
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

        -- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipNodeLearn_desc" ),
		},

        -- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WORK_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- ANIMATION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipNodeLearnWnd_animation",
				defaultAnimation	= "idle",
			}}
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
						layer		= "UI.ShipNodeLearnWnd.layers.WAIT_TEXT",
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
	},
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ShipNodeLearnWnd:Setup( nodeName, vid, chosenNodesMask )

	if type( nodeName ) ~= "string" then
		sys.log( "UI.ShipNodeLearnWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"nodeName\"); \"string\" expected, got \"%s\"", type( nodeName ) )
		return
	end

	if type( vid ) ~= "userdata" then
		sys.log( "UI.ShipNodeLearnWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	if chosenNodesMask ~= nil then
    	if type( chosenNodesMask ) ~= "userdata" then
    		sys.log( "UI.ShipNodeLearnWnd:Setup()[ERROR]: invalid type of the 3-rd parameter (\"chosenNodesMask\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( chosenNodesMask ) )
    		return
    	end
	end

	local shipItem = UI:GetShipItem( vid, false )
	if not shipItem then
		sys.log( "UI.ShipNodeLearnWnd:Setup()[ERROR]: invalid vid; cannot find ship item for ship %s", _G.U64ToStr( vid ) )
		return
	end

	if not UI:IsShipEvolving( shipItem.defName ) then
		sys.log( "UI.ShipNodeLearnWnd:Setup()[ERROR]: %s is not evolving ship", shipItem.defName )
		return
	end

	if not UI:GetEvolvingShipNodeByName( nodeName ) then
		sys.log( "UI.ShipNodeLearnWnd:Setup()[ERROR]: invalid nodeName; cannot find node info for node \"%s\"", nodeName )
		return
	end

	self:Reset()

	self.nodeName			= nodeName
	self.vid				= vid
	self.chosenNodesMask	= chosenNodesMask
	self.shipDefName		= shipItem.defName

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ShipNodeLearnWnd:IsResourceListAnimating()

	local work1Effect = UI:GetEffectFromLayer( self, self.layers.WORK_1_EFFECT )
	return work1Effect and work1Effect:GetCurAnimation() == self.effectInfo.work1.animHide

end


--
function UI.ShipNodeLearnWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

			if u64Param == self.vid then
    			local prices = UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )
    			self:UpdatePrice( prices )
    			self:UpdateLearnBtn( nil, prices )
			end

    		if requestId == self.requestId_learn then
				if self.learnData.vid == self.vid and self.learnData.nodeName == self.nodeName then
					self:StartAnimation()
				end
    		end

		end

	else

		if requestId == self.requestId_learn then
			self:ShowMsgOnLearnError( result )
		end

	end

	if result == _G.GameStore.StoreBuyResult.SBR_OK and requestId == self.requestId_learn then

		if UI:IsEvolvingShipNodeOfTypeBlueprint( self.learnData.nodeName ) then

    		if not self:IsOnScreen() then
    			self:ShowLearnBlueprintNotifyMsg( self.learnData )
    		else
    			self.notifyMsgData = self.learnData
    		end	

		end
		
	end

	if requestId == self.requestId_learn then
		self.requestId_learn = 0
		self.learnData = nil
		self:UpdateWaitingEffect()
	end

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then	
		return
	end

	local prices = UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )
	self:UpdatePrice( prices )
	self:UpdateLearnBtn( nil, prices )

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipNodeLearnWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.ShipNodeLearnWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.ShipNodeLearnWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.ShipNodeLearnWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

    if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnShipSynergyChanged()

end


--
function UI.ShipNodeLearnWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	if u64Param == self.vid then
		self:OnShipSynergyChanged()
	end

end


--
function UI.ShipNodeLearnWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	if u64( param1, param2 ) == self.vid then
		self:OnShipSynergyChanged()
	end

end


--
function UI.ShipNodeLearnWnd:GameStore_OnExtractVesselExp( result, requestId, vids )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	for idx, vid in pairs( vids ) do
		if vid == self.vid then
			self:OnShipSynergyChanged()
			break
		end
	end

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	local quests = self:GetQuests()
	self:UpdateQuestsList( quests )
	self:UpdateLearnBtn( quests, nil )

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.QuestResult.QR_OK then

		if self:IsOnScreen() then

			local questId = param1

			for recordIdx = 1, self.questsList:GetNumRecords() do

				local data = self.questsList:GetRecordData( recordIdx )
				if data.questId == questId then

					data.questState = self:DetectQuestState( questId )
					self.questsList:SetRecordData( data, recordIdx )

					break

				end

			end

		end

	else

		if requestId == self.requstId_takeQuest then
			UI:ShowMsgOnTakeQuestError( result )
		end

	end

	if requestId == self.requstId_takeQuest then
		self.requstId_takeQuest = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	local questId = param1

	for recordIdx = 1, self.questsList:GetNumRecords() do

		local data = self.questsList:GetRecordData( recordIdx )
		if data.questId == questId then

			data.questState = self:DetectQuestState( questId )
			self.questsList:SetRecordData( data, recordIdx )

			self:UpdateLearnBtn()

			break

		end

	end

end


--
function UI.ShipNodeLearnWnd:MasterServer_OnNotification( notification, params )

	if not self:IsOnScreen() then
		return
	end

	if notification == _G.MasterServer.ServerNotification.SN_QUEST_PROGRESS then

    	if type( params.questId ) == "number" then

        	for recordIdx = 1, self.questsList:GetNumRecords() do

        		local data = self.questsList:GetRecordData( recordIdx )
        		if data.questId == params.questId then

					local slotWnd = self.questsList:GetButtonForRecord( recordIdx )
					if slotWnd then
						slotWnd:OnQuestProgressChanged()
					end

        			break

        		end

        	end

		else
    		sys.log( "UI.ShipNodeLearnWnd:MasterServer_OnNotification()[ERROR]: invalid type of \"params.questId\" in notification \"SN_QUEST_PROGRESS\"; \"number\" expected, got \"%s\"", type( params.questId ) )
		end


	end
	
end


--
function UI.ShipNodeLearnWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.requestId_learn	= 0
	self.learnData			= nil
	self.requstId_takeQuest	= 0

	self:UpdateWaitingEffect()

end


--
function UI.ShipNodeLearnWnd:OnBuyWndResult( result, mode, data )
	
	if not self:IsOnScreen() then
		sys.log( "UI.ShipNodeLearnWnd:OnBuyWndResult()[ERROR]: not on screen" )
		return
	end

	if result then
		self:DoLearn()
		UI:PlayGlobalSound( self.sounds.learn )	
	end

end


-- -------------------------------
-- const
-- -------------------------------

UI.ShipNodeLearnWnd.effectInfo =
{
	work =
	{
		work1Locator_isQuests	= "item_tree",
		work1Locator_noQuests	= "item_tree1",
		questsListLocator		= "quest",	
		learnBtnLocator			= "btn_create",
		crossBtnLocator			= "btn_x",
	},

	work1 =
	{
		animIdle				= "idle",
		animHide				= "hide",
		resourcesListLocator	= "tem_tree",		
		nodeIcoLocator			= "study_item_ico",
	}
}

UI.ShipNodeLearnWnd.sounds =
{
	learn			= UI.sounds.btnClick,
	hide			= "sound/ui/MsgHide",
	takeQuest		= "sound/ui/apply",
	tradeWndShow	= "sound/ui/btnClick",
}

UI.ShipNodeLearnWnd.resourcesListWndTableName	= ""
UI.ShipNodeLearnWnd.resourcesListWndTableName	= ""
UI.ShipNodeLearnWnd.learnBtnTableName			= ""

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipNodeLearnWnd.nodeName				= ""
UI.ShipNodeLearnWnd.vid						= UI.INVALID_U64_ID
UI.ShipNodeLearnWnd.chosenNodesMask			= nil
	
UI.ShipNodeLearnWnd.shipDefName				= ""
	
UI.ShipNodeLearnWnd.priceMetaText			= nil
UI.ShipNodeLearnWnd.questsList				= nil
UI.ShipNodeLearnWnd.nodeIco					= nil
UI.ShipNodeLearnWnd.resourcesList			= nil
UI.ShipNodeLearnWnd.learnBtn				= nil
UI.ShipNodeLearnWnd.crossBtn				= nil
UI.ShipNodeLearnWnd.moduleTooltipWnd		= nil
UI.ShipNodeLearnWnd.resourceTooltipWnd		= nil
UI.ShipNodeLearnWnd.secondaryTooltipData	= nil
UI.ShipNodeLearnWnd.buyWnd					= nil
	
UI.ShipNodeLearnWnd.requestId_learn			= 0
UI.ShipNodeLearnWnd.learnData				= nil
UI.ShipNodeLearnWnd.requstId_takeQuest		= 0
UI.ShipNodeLearnWnd.notifyMsgData			= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipNodeLearnWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )

	self:CreateControls()

end


--
function UI.ShipNodeLearnWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipNodeLearnWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.ShipNodeLearnWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipNodeLearnWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.ShipNodeLearnWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipNodeLearnWnd:CreateControls()

	self.moduleTooltipWnd	= UI:CreateChildWnd( self, UI.CompareModuleTooltipWnd, "" )
	self.resourceTooltipWnd	= UI:CreateChildWnd( self, UI.CompareResourceTooltipWnd, "" )

    self.questsList		= UI:CreateChildWnd( self, UI.ShipNodeLearn_QuestsListWnd, "" )
    self.nodeIco		= UI:CreateChildWnd( self, UI.ShipNodeLearn_NodeIcoWnd, "" )
    self.resourcesList	= UI:CreateWndFromTable( self.resourcesListWndTableName )
    self.learnBtn		= UI:CreateWndFromTable( self.learnBtnTableName )
    self.crossBtn		= UI:CreateChildWnd( self, UI.CrossBtn2, "" )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	local work1Effect = UI:GetEffectFromLayer( self, self.layers.WORK_1_EFFECT )

	UI:AddChildAndLink( self, self.questsList, workEffect, self.effectInfo.work.questsListLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.nodeIco, work1Effect, self.effectInfo.work1.nodeIcoLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.resourcesList, work1Effect, self.effectInfo.work1.resourcesListLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )
	UI:AddChildAndLink( self, self.learnBtn, workEffect, self.effectInfo.work.learnBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.crossBtn, workEffect, self.effectInfo.work.crossBtnLocator, UI.EffectAnimParams.POS )

	self.buyWnd = UI:CreateChildWnd( self, UI.BuyWnd, "" )
	self.buyWnd.mainWndName = self:GetName()

end


--
function UI.ShipNodeLearnWnd:Reset()

	self.nodeName			= ""
	self.vid				= UI.INVALID_U64_ID
	self.chosenNodesMask	= nil
	self.shipDefName		= ""

	self:ResetContent()

end


--
function UI.ShipNodeLearnWnd:ResetContent()

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.DESC )
	self.priceMetaText:SetText( "", true )

    self.questsList:Clear()
	self.questsList:UnlinkFromParent()

    self.nodeIco:Reset()

    self.resourcesList:Clear()
	self:AddChild( self.resourcesList )

    self.learnBtn:Enable( false )

	self.moduleTooltipWnd:Reset()
	self.moduleTooltipWnd:UnlinkFromParent()

	self.resourceTooltipWnd:Reset()
	self.resourceTooltipWnd:UnlinkFromParent()
	
	self.secondaryTooltipData = nil

	self:ResetAnimaiton()

end


--
function UI.ShipNodeLearnWnd:FullUpdate()

	self:ResetContent()

	local quests	= self:GetQuests()
	local prices	= UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )

	self:UpdateCaption()
	self:UpdateDesc()
	self:UpdateSecondaryTooltip()
	self:UpdateNodeIco()
	self:UpdateQuestsList( quests )
	self:UpdateResourcesList( prices )
	self:UpdatePrice( prices )
	self:UpdateLearnBtn( quests, prices )
	self:UpdateWaitingEffect()

	self:RecalcLayout()

	if UI:IsEvolvingShipNodeUnlocked( self.nodeName, self.vid ) then
		self:StartAnimation()
	end

end


--
function UI.ShipNodeLearnWnd:UpdateCaption()

	local str = UI:EvolvingShipNode2Str( self.nodeName, self.shipDefName, self.chosenNodesMask, self:GetColor( self.layers.CAPTION ) )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ShipNodeLearnWnd:UpdateDesc()

	local str = UI:GetEvolvingShipNodeDesc( self.nodeName, self.shipDefName, self.chosenNodesMask, substColor, self:GetColor( self.layers.DESC ), false, false )
	self:SetText( str, self.layers.DESC )

end


--
function UI.ShipNodeLearnWnd:UpdateQuestsList( quests )

	if quests == nil then
		quests = self:GetQuests()
	end

	if not next( quests ) then

		if self.questsList:IsChildOf( self ) then
			self.questsList:Clear()
			self.questsList:UnlinkFromParent()
		end

		return

	end

	if #quests ~= self.questsList.MAX_SLOTS then
		sys.log( "UI.ShipNodeLearnWnd:UpdateQuestsList()[ERROR]: unsupported number of quests %d", #quests )
	end

	self:AddChild( self.questsList )
	self.questsList:Clear()

	for idx, questId in ipairs( quests ) do

		local questState = self:DetectQuestState( questId )

		local data =
		{
			questId		= questId,
			questState	= questState,
		}

		self.questsList:AddRecord( data )

	end

end


--
function UI.ShipNodeLearnWnd:GetQuests()

	return UI:GetEvolvingShipNodeRequiredQuests( self.nodeName )

end  


--
function UI.ShipNodeLearnWnd:DetectQuestState( questId )

	local questState =
	{
		bCompleted	= UI:IsQuestCompleted( questId ),
		bTaken		= UI:IsQuestTaken( questId ),
	}

	return questState

end


--
function UI.ShipNodeLearnWnd:UpdateNodeIco()

	self.nodeIco:Setup( self.nodeName )

end


--
function UI.ShipNodeLearnWnd:UpdateResourcesList( prices )
	                                                    	
	if prices == nil then
		prices = UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )
	end

	local resources = {}

	for idx, price in ipairs( prices ) do
		if price.priceType == UI.shipNodePriceTypes.ITEM then
			table.insert( resources, price )
		end
	end

	if #resources > self.resourcesList.MAX_SLOTS then
		sys.log( "UI.ShipNodeLearnWnd:UpdateResourcesList()[ERROR]: unsupported number of resources %d", #resources )
	end

	self.resourcesList:Clear()

	for idx, resource in ipairs( resources ) do

		local data =
		{
			defName		= resource.defName,
			needCount	= resource.count,
			isCount		= UI:GetPlayerResourceCount( resource.defName ),
		}

		self.resourcesList:AddRecord( data )

	end	

end


--
function UI.ShipNodeLearnWnd:UpdatePrice( prices )

	if prices == nil then
		prices = UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )
	end

	local priceInfos = {}
	local playerMoney = {}

	for priceIdx, price in ipairs( prices ) do

		if price.priceType == UI.shipNodePriceTypes.CREDITS then

			local creditsPriceInfo =
			{
        		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
        		bIsBuyPrice	= true,
    			val			= price.val,
        		basePrice	= price.val,
			}

			table.insert( priceInfos, creditsPriceInfo )

		elseif price.priceType == UI.shipNodePriceTypes.TOKENS then

			local iridiumPriceInfo =
			{
        		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
        		bIsBuyPrice	= true,
    			val			= price.val,
        		basePrice	= price.val,
			}

			table.insert( priceInfos, iridiumPriceInfo )


		elseif price.priceType == UI.shipNodePriceTypes.SYNERGY then

			local synergyPriceInfo =
			{
        		priceType	= UI.exPriceTypes.SYNERGY,
        		bIsBuyPrice	= true,
    			val			= price.val,
        		basePrice	= price.val,
			}

			table.insert( priceInfos, synergyPriceInfo )
			playerMoney[ #priceInfos ] = UI:GetShipExpByVid( self.vid ) + UI:GetPlayerFreeSynergy()

		elseif price.priceType ~= UI.shipNodePriceTypes.ITEM then

			sys.log( "UI.ShipNodeLearnWnd:UpdatePrice()[ERROR]: unhandled ship node learn price type: %d", price.priceType )

		end

	end

	local str = UI:PricesInfos2Str( priceInfos, self:GetColor( self.layers.PRICE ), false, true, true, playerMoney, " " )

	self.priceMetaText:SetText( str, true )

end


--
function UI.ShipNodeLearnWnd:UpdateLearnBtn( quests, prices )

	local bEnable =
		not UI:IsEvolvingShipNodeUnlocked( self.nodeName, self.vid )
		and self:IsEnoughFunds( prices )
		and self:IsQuestsFit( quests )

	self.learnBtn:Enable( bEnable )	

end


--
function UI.ShipNodeLearnWnd:IsEnoughFunds( prices )

	local bEnoughFunds = true

	if prices == nil then
		prices = UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )
	end

	for priceIdx, price in pairs( prices ) do	

		local bEnough = false

		if price.priceType == UI.shipNodePriceTypes.CREDITS then
			bEnough = price.val <= UI:GetPlayerCredits()

		elseif price.priceType == UI.shipNodePriceTypes.TOKENS then
			bEnough = price.val <= UI:GetPlayerTokens()

		elseif price.priceType == UI.shipNodePriceTypes.SYNERGY then
			bEnough = price.val <= ( UI:GetShipExpByVid( self.vid ) + UI:GetPlayerFreeSynergy() )

		elseif price.priceType == UI.shipNodePriceTypes.ITEM then

			if UI:IsDefResource( price.defName ) then
				bEnough = price.count <= UI:GetPlayerResourceCount( price.defName )
			else
				sys.log( "UI.ShipNodeLearnWnd:IsEnoughFunds()[ERROR]: \"%s\" is not a resource", price.defName )
			end

		else
			sys.log( "UI.ShipNodeLearnWnd:IsEnoughFunds()[ERROR]: unhandled ship node learn price type: %d", price.priceType )
		end

		if not bEnough then
			bEnoughFunds = false
			break
		end

	end	

	return bEnoughFunds

end


--
function UI.ShipNodeLearnWnd:IsQuestsFit( quests )

	local bFit = true

	if quests == nil then
		quests = self:GetQuests()
	end

	for idx, questId in pairs( quests ) do
		if not UI:IsQuestCompleted( questId ) then
			bFit = false
			break
		end
	end

	return bFit
	

end


--
function UI.ShipNodeLearnWnd:UpdateSecondaryTooltip()

	-- спецмодуль

	if UI:IsEvolvingShipNodeOfTypeSpecModule( self.nodeName ) then

    	local specModuleDefName = UI:GetEvolvingShipNodeSpecModule( self.nodeName, self.shipDefName, self.chosenNodesMask )

		if specModuleDefName ~= "" then

        	self.secondaryTooltipData =
        	{
        		tooltipType		= UI.tooltipTypes.MODULE,
        		defName			= specModuleDefName,
        		dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForVid( self.vid, ai.SpaceShipModuleSlot.SPECIAL, self.chosenNodesMask ),
        	}

		else
			sys.log( "UI.ShipNodeLearnWnd:UpdateSecondaryTooltip()[ERROR]: cannot find spec module for node %s ship %s", self.nodeName, self.shipDefName )
		end


	-- чертеж

	elseif UI:IsEvolvingShipNodeOfTypeBlueprint( self.nodeName ) then

		local blueprintDefName = UI:GetEvolvingShipNodeBlueprint( self.nodeName )
		if blueprintDefName ~= "" then

    		local craftResultDefName = UI:GetResourceCraftResult( blueprintDefName )
			if craftResultDefName ~= "" then

				if UI:IsDefModule( craftResultDefName ) or UI:IsDefAmmo( craftResultDefName ) then

                	self.secondaryTooltipData =
                	{
                		tooltipType		= UI.tooltipTypes.MODULE,
                		defName			= craftResultDefName,
                	}

				elseif UI:IsDefResource( craftResultDefName ) or UI:IsDefBlueprint( craftResultDefName ) then

                	self.secondaryTooltipData =
                	{
                		tooltipType		= UI.tooltipTypes.RESOURCE,
                		defName			= craftResultDefName,
                	}

				else
					sys.log( "UI.ShipNodeLearnWnd:UpdateSecondaryTooltip()[ERROR]: unhandled type of craft result: %s", craftResultDefName )
				end

			else
				sys.log( "UI.ShipNodeLearnWnd:UpdateSecondaryTooltip()[ERROR]: cannot find craft result for blueprint %s", blueprintDefName )
			end

		else
			sys.log( "UI.ShipNodeLearnWnd:UpdateSecondaryTooltip()[ERROR]: cannot find blueprint for node %s", self.nodeName )
		end

	end

end


--
function UI.ShipNodeLearnWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	-- после скрытия по анимации один раз сюда приходит; это может поломать тултип модуля/чертежа (он покажется, если нажат alt)
	if not self:IsOnScreen() then
		return
	end

	self:CheckSecondaryTooltip()

end


--
function UI.ShipNodeLearnWnd:CheckSecondaryTooltip()

	local secondaryTooltipWnd = self:GetSecondaryTooltipWnd()
	if secondaryTooltipWnd then

    	local bNeedSecondaryTooltip	= _G.Input_IsKeyPressed( UI.Keys.KEY_ALT )
    	local bIsSecondaryTooltip	= secondaryTooltipWnd:IsOnScreen()

    	if bNeedSecondaryTooltip and not bIsSecondaryTooltip then
		
			-- setup надо вызывать перед показом, нельзя заранее при апдейте, т.к. после скрытия произойдет резет, и второй раз он не сможет правильно показаться (#0091165);
			secondaryTooltipWnd:Setup( self.secondaryTooltipData )
    		UI.Root:AddChild( secondaryTooltipWnd )
			self:RecalcSecondaryTooltipLayout()

    	elseif not bNeedSecondaryTooltip and bIsSecondaryTooltip then
    		secondaryTooltipWnd:UnlinkFromParent()
    	end

	end

end


--
function UI.ShipNodeLearnWnd:RecalcSecondaryTooltipLayout()

	local secondaryTooltipWnd = self:GetSecondaryTooltipWnd()

	if not secondaryTooltipWnd then
		return
	end

	local x = ( 1024 - secondaryTooltipWnd:GetWidth() ) / 2
	local y = ( 768 - secondaryTooltipWnd:GetHeight() ) / 2

	secondaryTooltipWnd:SetPos( UI:Vec2( x, y ) )
	
end


--
function UI.ShipNodeLearnWnd:GetSecondaryTooltipWnd()

	local secondaryTooltipWnd = nil

	if self.secondaryTooltipData then
	
		if self.secondaryTooltipData.tooltipType == UI.tooltipTypes.MODULE then
			secondaryTooltipWnd = self.moduleTooltipWnd

		elseif self.secondaryTooltipData.tooltipType == UI.tooltipTypes.RESOURCE then
			secondaryTooltipWnd = self.resourceTooltipWnd
		end	
		
	end

	return secondaryTooltipWnd

end


--
function UI.ShipNodeLearnWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if self.moduleTooltipWnd:IsOnScreen() then
		self.moduleTooltipWnd:UnlinkFromParent()
	end

	if self.resourceTooltipWnd:IsOnScreen() then
		self.resourceTooltipWnd:UnlinkFromParent()
	end

	self.buyWnd:Hide()

	if self.notifyMsgData then
		if not UI:IsInRemovingAllWindows() and not UI.bSavingGameState then
    		self:ShowLearnBlueprintNotifyMsg( self.notifyMsgData )
		end
		self.notifyMsgData = nil
	end

end


--
function UI.ShipNodeLearnWnd:RecalcLayout()

	local work1Locator = self.questsList:IsChildOf( self ) and self.effectInfo.work.work1Locator_isQuests or self.effectInfo.work.work1Locator_noQuests

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then

		workEffect:UnlinkLayer( self:GetUiHandle(), self.layers.WORK_1_EFFECT, "" )
		workEffect:LinkLayer( self:GetUiHandle(), self.layers.WORK_1_EFFECT, work1Locator, UI.EffectAnimParams.POS )

	end

end


--
function UI.ShipNodeLearnWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.learnBtn then

		if not self:IsWaiting() and not self:IsAnimating() then
			self:TryLearn()
		end

	elseif wnd == self.crossBtn then

		self:Close( true )

	elseif UI:IsWndKindOf( wnd, "ShipNodeLearn_TakeQuestBtn" ) then

		if not self:IsWaiting() and not self:IsAnimating() then

			local quetSlotWnd = UI:GetAncestorKindOf( wnd, "ShipNodeLearn_QuestSlotWnd" )
			if quetSlotWnd then

				local questId = quetSlotWnd:GetRecordData().questId
				self:TakeQuest( questId )

				UI:PlayGlobalSound( self.sounds.takeQuest )
				
			end

		end

	elseif UI:IsWndKindOf( wnd, "ShipNodeLearn_ResourceSlotWnd" ) then

		if not self:IsWaiting() and not self:IsAnimating() and wnd:CanClick() then
			self:LaunchItemCraftWnd( wnd:GetRecordData().defName )
		end

	end

	return true

end


--
function UI.ShipNodeLearnWnd:OnEscape()

	self:Close( true )
	return true

end


--
function UI.ShipNodeLearnWnd:TryLearn()

	if self:IsWaiting() then
		sys.log( "UI.ShipNodeLearnWnd:TryLearn()[ERROR]: still waiting for another request" )
		return
	end

	if self:IsAnimating() then
		sys.log( "UI.ShipNodeLearnWnd:TryLearn()[ERROR]: cannot do any actions while in animation" )
		return
	end

	self:LaunchBuyWnd()

end


--
function UI.ShipNodeLearnWnd:DoLearn()

	if self:IsWaiting() then
		sys.log( "UI.ShipNodeLearnWnd:DoLearn()[ERROR]: still waiting for another request" )
		return
	end

	if self:IsAnimating() then
		sys.log( "UI.ShipNodeLearnWnd:DoLearn()[ERROR]: cannot learn while animation" )
		return
	end

	local mask = u64( 0 )
	local nodeId = UI:GetEvolvingShipNodeId( self.nodeName )
	UI:BitSetU64( mask, nodeId )

	self.learnData = { vid = self.vid, nodeName = self.nodeName }
	self.requestId_learn = _G.GameStore_VesselUnlockNode( self.vid, mask )

	if self.requestId_learn == 0 then
		self.learnData = nil
		self:ShowMsgOnLearnError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipNodeLearnWnd:ShowMsgOnLearnError( result )

	UI:ShowErrorMsg( "msg_unlockAlienShipNodeError", result, "_G.GameStore.StoreBuyResult" )

end


--
function UI.ShipNodeLearnWnd:F_OnEventSaveUiState()

	local tableName = self:GetScriptTableName()

	local t = {}
	UI.store[ tableName ] = t

	t.requestId_learn		= self.requestId_learn
	t.learnData				= self.learnData
	t.requstId_takeQuest	= self.requstId_takeQuest

	if self:IsOnScreen() then

		t.nodeName			= self.nodeName
		t.vid				= self.vid
		t.chosenNodesMask	= self.chosenNodesMask

	end

end


--
function UI.ShipNodeLearnWnd:F_OnEventRestoreUiState()

	local tableName = self:GetScriptTableName()
	local t = UI.store[ tableName ]	

	if t then

		self.requestId_learn	= t.requestId_learn
		self.learnData			= t.learnData
		self.requstId_takeQuest	= t.requstId_takeQuest

		self:UpdateWaitingEffect()

		if t.nodeName ~= nil and t.nodeName ~= "" then
			self:Setup( t.nodeName, t.vid, t.chosenNodesMask )
		end

		UI.store[ tableName ] = nil

	end

end


--
function UI.ShipNodeLearnWnd:StartAnimation()

	self:SetLayerVisible( true, self.layers.ANIMATION_EFFECT )

	local animationEffect = UI:GetEffectFromLayer( self, self.layers.ANIMATION_EFFECT )
	if animationEffect then
		animationEffect:RestartAnimation()
	end

	local work1Effect = UI:GetEffectFromLayer( self, self.layers.WORK_1_EFFECT )
	if work1Effect then
		work1Effect:StartAnimation( self.effectInfo.work1.animHide )
	end	

end


--
function UI.ShipNodeLearnWnd:ResetAnimaiton()

	self:SetLayerVisible( false, self.layers.ANIMATION_EFFECT )

	local animationEffect = UI:GetEffectFromLayer( self, self.layers.ANIMATION_EFFECT )
	if animationEffect then
		animationEffect:StopAnimation()
	end

	local work1Effect = UI:GetEffectFromLayer( self, self.layers.WORK_1_EFFECT )
	if work1Effect then
		work1Effect:StartAnimation( self.effectInfo.work1.animIdle )
	end	

end


--
function UI.ShipNodeLearnWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.ANIMATION_EFFECT ) then

		self:SetLayerVisible( false, self.layers.ANIMATION_EFFECT )
		self:CheckStopAnimation()

	elseif effect == UI:GetEffectFromLayer( self, self.layers.WORK_1_EFFECT ) and animName == self.effectInfo.work1.animHide then

		self.resourcesList:Clear()
		self.resourcesList:UnlinkFromParent()

		self:CheckStopAnimation()

	end

end


--
function UI.ShipNodeLearnWnd:CheckStopAnimation()

	if self:IsAnimating() then
		self:Close( true )
	end

end


--
function UI.ShipNodeLearnWnd:IsAnimating()

	if self:IsLayerVisible( self.layers.ANIMATION_EFFECT ) then
    	local animationEffect = UI:GetEffectFromLayer( self, self.layers.ANIMATION_EFFECT )
    	if animationEffect then
			if animationEffect:IsAnimationPlaying() then
				return true
			end
    	end
	end

	local work1Effect = UI:GetEffectFromLayer( self, self.layers.WORK_1_EFFECT )
	if work1Effect then
		if work1Effect:GetCurAnimation() == self.effectInfo.work1.animHide then
			return true
		end
	end

	return false

end


--
function UI.ShipNodeLearnWnd:Close( bSound )

	if bSound == nil then
		bSound = false
	end

	self:Hide()

	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end

end


--
function UI.ShipNodeLearnWnd:UpdateWaitingEffect()

    local bIsWaiting = self:IsWaiting()
	self:SetLayerVisible( bIsWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bIsWaiting, self.layers.WAIT_TEXT )	

end


--
function UI.ShipNodeLearnWnd:IsWaiting()

	return
		self.requestId_learn ~= 0
		or self.requstId_takeQuest ~= 0

end


--
function UI.ShipNodeLearnWnd:OnResourcesChanged()

	local prices = UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )

	self:UpdateResourcesList( prices )
	self:UpdateLearnBtn( nil, prices )

end


--
function UI.ShipNodeLearnWnd:OnShipSynergyChanged()

	local prices = UI:GetEvolvingShipNodePrice( self.nodeName, self.shipDefName )

	self:UpdatePrice( prices )
	self:UpdateLearnBtn( nil, prices )

end


--
function UI.ShipNodeLearnWnd:TakeQuest( questId )

	if self:IsWaiting() then
		sys.log( "UI.ShipNodeLearnWnd:TakeQuest()[ERROR]: is waiting for another request" )
		return
	end

	if self:IsAnimating() then
		sys.log( "UI.ShipNodeLearnWnd:TakeQuest()[ERROR]: cannot do any actions while in animation" )
		return
	end

	self.requstId_takeQuest = _G.MasterServer_AcceptQuest( questId )

	if self.takeRequestId == 0 then
		UI:ShowMsgOnTakeQuestError( _G.MasterServer.QuestResult.QR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipNodeLearnWnd:LaunchItemCraftWnd( itemDefName )

	local launchData =
	{
		bShipNodeLearnWnd	= true,
		learnWndTableName	= self:GetScriptTableName(),

		shipNodeLearnParams =
		{
            nodeName			= self.nodeName,
            vid					= self.vid,
            chosenNodesMask		= self.chosenNodesMask,
		}
	}

	UI.HangarWnd:ShowItemCraftSingle( itemDefName, nil, launchData )

end


--
function UI.ShipNodeLearnWnd:ShowLearnBlueprintNotifyMsg( data )

	local baseColor = UI.TEXT_BASE_COLOR

	local blueprintDefName = UI:GetEvolvingShipNodeBlueprint( data.nodeName )

	local blueprintNameLocalized = UI:GetEntityLocalizedNameByDef( blueprintDefName, true, false, nil, nil )
	blueprintNameLocalized = string.format( "%s%s", blueprintNameLocalized, UI:Color2Str( baseColor ) )

	-- заголовок

	local caption = UI:GetStringByName( "shipNodeLearn_msgBlueprintUnlocked_caption" )

	local numSubst = 0
	caption, numSubst = string.gsub( caption, "%$name%$", blueprintNameLocalized )

	if numSubst == 0 then
		sys.log( "UI.ShipNodeLearnWnd:CheckShowNotifyMsg()[ERROR]: cannot find placeholder \"$name$\" in string \"shipNodeLearn_msgBlueprintUnlocked_caption\"" )
		caption = string.format( "[INVALID STRING] %s is unlocked", blueprintNameLocalized )
	end

	caption = string.format( "%s%s", UI:Color2Str( baseColor ), caption )


	-- текст
	
	local msg = UI:GetStringByName( "shipNodeLearn_msgBlueprintUnlocked_text" )

	local numSubst = 0
	msg, numSubst = string.gsub( msg, "%$name%$", blueprintNameLocalized )

	if numSubst == 0 then
		sys.log( "UI.ShipNodeLearnWnd:CheckShowNotifyMsg()[ERROR]: cannot find placeholder \"$name$\" in string \"shipNodeLearn_msgBlueprintUnlocked_text\"" )
		msg = string.format( "[INVALID STRING] Congratulations! %s is unlocked", blueprintNameLocalized )
	end

	msg = string.format( "%s%s", UI:Color2Str( baseColor ), msg )


	UI:MessageBox( caption, msg, UI.MBS_OK )

end


--
function UI.ShipNodeLearnWnd:LaunchBuyWnd()

	self.buyWnd:Setup( UI.BuyWnd.modes.LEARN_NODE, true, { nodeName = self.nodeName, vid = self.vid, chosenNodesMask = self.chosenNodesMask }, bCanShowRefillBtn )
	self.buyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


-- --------------------------------------------------------------------
-- UI.ShipNodeLearn_QuestsListWnd
-- --------------------------------------------------------------------

UI.ShipNodeLearn_QuestsListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipNodeLearn_QuestsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipNodeLearn_QuestsListWnd",
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
				defName = "shipNodeLearn_questsList",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}},
		},
	}
}

-- -------------------------------
-- const
-- -------------------------------

UI.ShipNodeLearn_QuestsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "quest_slot_",
		scrollObjName		= "",
	}
}

UI.ShipNodeLearn_QuestsListWnd.btnPrototypeName	= "ShipNodeLearn_QuestSlotWnd"
UI.ShipNodeLearn_QuestsListWnd.MAX_SLOTS		= 3
UI.ShipNodeLearn_QuestsListWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS


-- --------------------------------------------------------------------
-- UI.ShipNodeLearn_QuestSlotWnd
-- --------------------------------------------------------------------

UI.ShipNodeLearn_QuestSlotWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipNodeLearn_QuestSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipNodeLearn_QuestSlotWnd",		
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
				defName 			= "shipNodeLearn_questSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "note6",
						layer		= "UI.ShipNodeLearn_QuestSlotWnd.layers.TASK",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "status",
						layer		= "UI.ShipNodeLearn_QuestSlotWnd.layers.PROGRESS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.ShipNodeLearn_QuestSlotWnd.layers.DARKENING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},

		-- TASK
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- PROGRESS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "quests_questSlot_progress",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "progr",
						layer		= "UI.ShipNodeLearn_QuestSlotWnd.layers.PROGRESS_BAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "status",
						layer		= "UI.ShipNodeLearn_QuestSlotWnd.layers.PROGRESS_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text5",
						layer		= "UI.ShipNodeLearn_QuestSlotWnd.layers.PROGRESS_TEXT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PROGRESS_BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "quests_questSlot_progress_bar",
				defaultAnimation	= "idle",
			}}
		},

		-- PROGRESS_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "quests_questSlot_progress_ico",
				defaultAnimation	= "made",
			}}
		},

		-- PROGRESS_TEXT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "quests_questSlot_progress_text",
				defaultAnimation	= "finish",

				links =
				{
					{
						objName		= "text6",
						layer		= "UI.ShipNodeLearn_QuestSlotWnd.layers.PROGRESS_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PROGRESS_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- DARKENING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipNodeLearn_questSlot_darkening",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ShipNodeLearn_QuestSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetLayerVisible( false, self.layers.PROGRESS_ICO_EFFECT )
	self:SetText( "", self.layers.PROGRESS_TEXT )

	local progressBarEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BAR_EFFECT )
	if progressBarEffect then
		progressBarEffect:SetAnimationTimeAndUpdate( 0 )
	end	

	self.taskMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.DARKENING_EFFECT )
	self.takeBtn:UnlinkFromParent()

end


--
function UI.ShipNodeLearn_QuestSlotWnd:OnQuestProgressChanged()

	self:UpdateProgress( self:GetRecordData() )

end


-- -------------------------------
-- const
-- -------------------------------

UI.ShipNodeLearn_QuestSlotWnd.layers =
{
    MAIN_EFFECT				= 0,
    TASK					= 1,
    PROGRESS_EFFECT			= 2,
    PROGRESS_BAR_EFFECT		= 3,
    PROGRESS_ICO_EFFECT		= 4,
    PROGRESS_TEXT_EFFECT	= 5,
    PROGRESS_TEXT			= 6,
	DARKENING_EFFECT		= 7,
}

UI.ShipNodeLearn_QuestSlotWnd.effectInfo =
{
	main =
	{
		animIdle		= "idle",
		animCompleted	= "completed",
		takeBtnLocator	= "btn_3",
	},
	
	progressText =
	{
		animActive		= "start",
		animInactive	= "finish",		
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipNodeLearn_QuestSlotWnd.takeBtn		= nil
UI.ShipNodeLearn_QuestSlotWnd.taskMetaText	= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipNodeLearn_QuestSlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.taskMetaText = UI.MetaText.GetNewInstance()
	self.taskMetaText:InitFromLayer( self, self.layers.TASK )

	self:CreateControls()

end


--
function UI.ShipNodeLearn_QuestSlotWnd:F_Shutdown()

	if self.taskMetaText then
		self.taskMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipNodeLearn_QuestSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipNodeLearn_QuestSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipNodeLearn_QuestSlotWnd:UpdateMetaTextPos()

	self.taskMetaText:UpdateScreenOrgFromLayer( self, self.layers.TASK )

end


--
function UI.ShipNodeLearn_QuestSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TASK then
		self.taskMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipNodeLearn_QuestSlotWnd:UpdateMetaTextColor()

	self.taskMetaText:SetColor( self:GetColor( self.layers.TASK ) )

end


--
function UI.ShipNodeLearn_QuestSlotWnd:CreateControls()

	self.takeBtn = UI:CreateChildWnd( self, UI.ShipNodeLearn_TakeQuestBtn, "" )

end


--
function UI.ShipNodeLearn_QuestSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdateTask( data )
	self:UpdateProgress( data )
	self:UpdateDarkening( data )
	self:UpdateTakeBtn( data )

end


-- анимация меняет цвет текста задания
function UI.ShipNodeLearn_QuestSlotWnd:UpdateMainAnimation( data )

	local anim = data.questState.bCompleted and self.effectInfo.main.animCompleted or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

	self:UpdateMetaTextColor()

end


--
function UI.ShipNodeLearn_QuestSlotWnd:UpdateTask( data )

	local stage = 1

	if data.questState.bTaken then
		stage = UI:GetQuestStage( data.questId )
	end

	local str = UI:GetQuestTaskDesc( data.questId, stage, true, self:GetColor( self.layers.TASK ) )
	self.taskMetaText:SetText( str, true )

end


--
function UI.ShipNodeLearn_QuestSlotWnd:UpdateProgress( data )

	-- полоса прогресса

	local progress = 0

	if data.questState.bTaken then

		local curVal = UI:GetQuestTaskCurVal( data.questId )

		local stage = UI:GetQuestStage( data.questId )
		local maxVal = UI:GetQuestTaskMaxVal( data.questId, stage )

		progress = maxVal ~= 0 and curVal / maxVal or 0

	elseif data.questState.bCompleted then

		progress = 1

	end

	local progressBarEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BAR_EFFECT )
	if progressBarEffect then
		progressBarEffect:SetAnimationTimeAndUpdate( progress )
	end


	-- иконка

	self:SetLayerVisible( data.questState.bCompleted, self.layers.PROGRESS_ICO_EFFECT )


	-- текст

	-- анимация текста

	local textAnim = data.questState.bCompleted and self.effectInfo.progressText.animInactive or self.effectInfo.progressText.animActive

	local progressTextEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_TEXT_EFFECT )
	if progressTextEffect then
		progressTextEffect:StartAnimation( textAnim )
	end

	-- строка

	local str = ""
	local curVal = 0

	if data.questState.bTaken then

		local stage = UI:GetQuestStage( data.questId )
		curVal = UI:GetQuestTaskCurVal( data.questId )

	elseif data.questState.bCompleted then

		local stage = UI:GetQuestNumStages( data.questId )
		curVal = UI:GetQuestTaskMaxVal( data.questId, stage )

	end

	str = UI:Num2StrSeparatedBy3( curVal )
	self:SetText( str, self.layers.PROGRESS_TEXT )

end


--
function UI.ShipNodeLearn_QuestSlotWnd:UpdateDarkening( data )

	local bNeedDarkening = not data.questState.bTaken and not data.questState.bCompleted
	self:SetLayerVisible( bNeedDarkening, self.layers.DARKENING_EFFECT )

end


--
function UI.ShipNodeLearn_QuestSlotWnd:UpdateTakeBtn( data )

	local bNeedBtn = not data.questState.bTaken and not data.questState.bCompleted

	if bNeedBtn then
		UI:AddChildAndLink( self, self.takeBtn, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ), self.effectInfo.main.takeBtnLocator, UI.EffectAnimParams.POS )
	else
		self.takeBtn:UnlinkFromParent()
	end

end

-- --------------------------------------------------------------------
-- UI.ShipNodeLearn_TakeQuestBtn
-- --------------------------------------------------------------------

UI.ShipNodeLearn_TakeQuestBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn14",

		props =
		{
			name		= "ShipNodeLearn_TakeQuestBtn",
			isPrototype	= true,
		}
	},

	textId = "tutorialQuest_takeBtn"
}


-- --------------------------------------------------------------------
-- UI.ShipNodeLearn_NodeIcoWnd
-- --------------------------------------------------------------------

UI.ShipNodeLearn_NodeIcoWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipNodeLearn_NodeIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipNodeLearn_NodeIcoWnd",
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
				defName 			= "shipNodeLearnWnd_nodeIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}},
		},
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ShipNodeLearn_NodeIcoWnd:Setup( nodeName )

    self:Reset()

	self.nodeName = nodeName
	self:FullUpdate()
	
end

-- -------------------------------
-- const
-- -------------------------------

UI.ShipNodeLearn_NodeIcoWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.ShipNodeLearn_NodeIcoWnd.effectInfo =
{
	main =
	{
		spriteName_big		= "race_ico6",
		spriteName_small	= "ico_sml",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipNodeLearn_NodeIcoWnd.nodeName	= ""

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipNodeLearn_NodeIcoWnd:Reset()
	
	self.nodeName = ""

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName_big, UI.INVALID_RESOURCE_HANDLE )
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName_small, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.ShipNodeLearn_NodeIcoWnd:FullUpdate()

	local hTex = UI.INVALID_RESOURCE_HANDLE
	local bBigIco = false

	local nodeInfo = UI:GetEvolvingShipNodeByName( self.nodeName )
	if nodeInfo then

		if UI:IsEvolvingShipNodeOfTypeBlueprint( self.nodeName ) then

			local blueprintDefName = UI:GetEvolvingShipNodeBlueprint( self.nodeName )
			if blueprintDefName ~= "" then

				local craftResultDefName, craftResultCount = UI:GetResourceCraftResult( blueprintDefName )

				if craftResultDefName ~= "" then
					hTex = UI:GetShopIco( craftResultDefName )
				else
					sys.log( "UI.ShipNodeLearn_NodeIcoWnd:FullUpdate()[ERROR]: canont find craft result for blueprint \"%s\"", blueprintDefName )
				end

			else
				sys.log( "UI.ShipNodeLearn_NodeIcoWnd:FullUpdate()[ERROR]: canont find blueprint for node \"%s\"", self.nodeName )
			end

		else

        	local texName = nodeInfo.ico

        	if type( texName ) ~= "string" then
        		sys.log( "UI.ShipNodeLearn_NodeIcoWnd:FullUpdate()[ERROR]: invalid type of _G.VesselProgress[\"%s\"].ico; \"string\" expected, got \"%s\"", self.node.name, type( texName ) )
        		texName = ""
        	end

        	if texName ~= "" then
        		texName = string.format( "%s_%s", texName, "big" )
        	end

        	if texName ~= "" then
        		hTex = UI:GetTex( texName )
        	end

			bBigIco = true

		end

	else
		sys.log( "UI.ShipNodeLearn_NodeIcoWnd:FullUpdate()[ERROR]: cannot find node \"%s\"", self.nodeName )
	end

	if hTex == UI.INVALID_RESOURCE_HANDLE then
		hTex = UI:GetTex( "NoData" )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		if bBigIco then
			mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName_big, hTex )
			mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName_small, UI.INVALID_RESOURCE_HANDLE )
		else
			mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName_big, UI.INVALID_RESOURCE_HANDLE )
			mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName_small, hTex )
		end

	end

end


-- --------------------------------------------------------------------
-- UI.ShipNodeLearn_ResourcesListWnd
-- --------------------------------------------------------------------

UI.ShipNodeLearn_ResourcesListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipNodeLearn_ResourcesListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipNodeLearn_ResourcesListWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},
	}
}

-- -------------------------------
-- interface funcitons
-- -------------------------------

--
function UI.ShipNodeLearn_ResourcesListWnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	self:UpdateAnimation()

end


-- используется дочерними слотами для апдейта своей альфы
function UI.ShipNodeLearn_ResourcesListWnd:IsAnimating()

	-- анимируется не сам список, а родительский эффект

	local parent = self:GetParent()
	return parent and parent:IsResourceListAnimating() or false
	
end


-- используется дочерними слотами для апдейта своей альфы
function UI.ShipNodeLearn_ResourcesListWnd:GetSlotAlpha( slotIdx )

	local alpha	= 0
	local color	= 0

	local slotLocator = string.format( "%s%s", self.effectInfo.main.slotObjNamePrefix, slotIdx )

	if self.mainEffect then
		alpha = self.mainEffect:GetObjAlpha( slotLocator )
		color = self.mainEffect:GetObjColor( slotLocator )
	end

	return alpha, color

end


-- -------------------------------
-- const
-- -------------------------------

UI.ShipNodeLearn_ResourcesListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "item_",
		scrollObjName		= "",
	}
}

UI.ShipNodeLearn_ResourcesListWnd.btnPrototypeName	= "ShipNodeLearn_ResourceSlotWnd"
UI.ShipNodeLearn_ResourcesListWnd.MAX_SLOTS			= 3
UI.ShipNodeLearn_ResourcesListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipNodeLearn_ResourcesListWnd.mainEffect	= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipNodeLearn_ResourcesListWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

end


--
function UI.ShipNodeLearn_ResourcesListWnd:AddRecord( data )

	UI.ButtonsListWnd.AddRecord( self, data )

	self:UpdateAnimation()

end


--
function UI.ShipNodeLearn_ResourcesListWnd:UpdateAnimation()

	local numSlots = math.min( self.MAX_SLOTS, self:GetNumRecords() )
	numSlots = math.max( numSlots, 1 )

	local anim = tostring( numSlots )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


-- перегрузка функции базового "класса" - добавлен линк слотов по альфе и цвету
function UI.ShipNodeLearn_ResourcesListWnd:ShowSlot( slot )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local objName = string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, slot.idx )
	UI:AddChildAndLink( self, slot.btn, mainEffect, objName, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )

end


-- --------------------------------------------------------------------
-- UI.AlienShipNodeLearn_ResourcesListWnd
-- --------------------------------------------------------------------

UI.AlienShipNodeLearn_ResourcesListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipNodeLearn_ResourcesListWnd",

    	props =
    	{
    		name		= "AlienShipNodeLearn_ResourcesListWnd",
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
    				defName = "alienShipNodeLearn_resourcesList",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}},
    		},
    	}
    }
}

-- --------------------------------------------------------------------
-- UI.SpecialShipNodeLearn_ResourcesListWnd
-- --------------------------------------------------------------------

UI.SpecialShipNodeLearn_ResourcesListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipNodeLearn_ResourcesListWnd",

    	props =
    	{
    		name		= "SpecialShipNodeLearn_ResourcesListWnd",
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
    				defName = "specialShipNodeLearn_resourcesList",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    				}
    			}},
    		},
    	}
    }
}

-- --------------------------------------------------------------------
-- UI.ShipNodeLearn_ResourceSlotWnd
-- --------------------------------------------------------------------

UI.ShipNodeLearn_ResourceSlotWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipNodeLearn_ResourceSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "EvolvingShipCraft_CabinIngredientSlotWnd",	-- Внимание, хак! Родительский "класс" делался для конкретного окна (UI.AlienShipCraftWnd), и он не предназначался для общего использования

	props =
	{
		name		= "ShipNodeLearn_ResourceSlotWnd",
		isPrototype	= true,
	}
}

-- --------------------------------------------------------------------
-- UI.ShipNodeLearn_LearnBtn
-- --------------------------------------------------------------------

UI.ShipNodeLearn_LearnBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

    	props =
    	{
    		name	= "ShipNodeLearn_LearnBtn",
			isPrototype	= true,
    	}
	},

	textId = "shipNodeLearn_learnBtn"
}

-- --------------------------------------------------------------------
-- UI.AlienShipNodeLearn_LearnBtn
-- --------------------------------------------------------------------

UI.AlienShipNodeLearn_LearnBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipNodeLearn_LearnBtn",

    	props =
    	{
    		name	= "AlienShipNodeLearn_LearnBtn",
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
}

-- --------------------------------------------------------------------
-- UI.SpecialShipNodeLearn_LearnBtn
-- --------------------------------------------------------------------

UI.SpecialShipNodeLearn_LearnBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipNodeLearn_LearnBtn",

    	props =
    	{
    		name	= "SpecialShipNodeLearn_LearnBtn",
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
}

-- --------------------------------------------------------------------
-- UI.AlienShipNodeLearnWnd
-- --------------------------------------------------------------------

UI.AlienShipNodeLearnWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipNodeLearnWnd",

    	props =
    	{
    		name	= "AlienShipNodeLearnWnd"
    	},

    	layers =
    	{
    		-- WORK_EFFECT
    		{
    			id			= UI.ShipNodeLearnWnd.layers.WORK_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "alienShipNodeLearn_work",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "title",
    						layer		= "UI.ShipNodeLearnWnd.layers.CAPTION",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "note",
    						layer		= "UI.ShipNodeLearnWnd.layers.DESC",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "price",
    						layer		= "UI.ShipNodeLearnWnd.layers.PRICE",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "loading",
    						layer		= "UI.ShipNodeLearnWnd.layers.WAIT_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
    				}
    			}},
    		},

    		-- WORK_1_EFFECT
    		{
    			id			= UI.ShipNodeLearnWnd.layers.WORK_1_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "alienShipNodeLearn_work1",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "decor",
    						layer		= "UI.ShipNodeLearnWnd.layers.ANIMATION_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,             	
    					},
    				}
    			}}
    		},
    	},
    },

    resourcesListWndTableName	= "UI.AlienShipNodeLearn_ResourcesListWnd",
    resourcesListWndTableName	= "UI.AlienShipNodeLearn_ResourcesListWnd",
    learnBtnTableName			= "UI.AlienShipNodeLearn_LearnBtn",
}

-- --------------------------------------------------------------------
-- UI.SpecialShipNodeLearnWnd
-- --------------------------------------------------------------------

UI.SpecialShipNodeLearnWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipNodeLearnWnd",

    	props =
    	{
    		name	= "SpecialShipNodeLearnWnd"
    	},

    	layers =
    	{
    		-- WORK_EFFECT
    		{
    			id			= UI.ShipNodeLearnWnd.layers.WORK_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "specialShipNodeLearn_work",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "title",
    						layer		= "UI.ShipNodeLearnWnd.layers.CAPTION",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "note",
    						layer		= "UI.ShipNodeLearnWnd.layers.DESC",
    						animParams	= UI.EffectAnimParams.ALL,
    					},

    					{
    						objName		= "price",
    						layer		= "UI.ShipNodeLearnWnd.layers.PRICE",
    						animParams	= UI.EffectAnimParams.ALL,             	
    					},

    					{
    						objName		= "loading",
    						layer		= "UI.ShipNodeLearnWnd.layers.WAIT_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
    				}
    			}},
    		},

    		-- WORK_1_EFFECT
    		{
    			id			= UI.ShipNodeLearnWnd.layers.WORK_1_EFFECT,
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "specialShipNodeLearn_work1",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "decor",
    						layer		= "UI.ShipNodeLearnWnd.layers.ANIMATION_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,             	
    					},
    				}
    			}}
    		},
    	},
    },

    resourcesListWndTableName	= "UI.SpecialShipNodeLearn_ResourcesListWnd",
    resourcesListWndTableName	= "UI.SpecialShipNodeLearn_ResourcesListWnd",
    learnBtnTableName			= "UI.SpecialShipNodeLearn_LearnBtn",
}