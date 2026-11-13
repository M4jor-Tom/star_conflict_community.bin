-- ----------------------------------------------------------------------------
--
-- Workfile: hudquestcompletewnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.HudQuestCompleteWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.HudQuestCompleteWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudQuestCompleteWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,		
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
				defName 			= "hud_questComplete",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title4",
						layer		= "UI.HudQuestCompleteWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text",
						layer		= "UI.HudQuestCompleteWnd.layers.REWARDS_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "awords",
						wnd			= "UI.HudQuestComplete_RewardsListWnd",
						animParams	= UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- CAPTION
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hud_questComplete_caption" ),
    	}, 

    	-- REWARDS_LABEL
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hud_questComplete_rewards" ),
    	}, 

    	-- REWARDS
    	{
   			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 
	},
	
	children = { "UI.HudQuestComplete_RewardsListWnd" }
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

--
function UI.HudQuestCompleteWnd:Setup( questId, completionData )

	self:Reset()

	if type( questId ) ~= "number" then
		sys.log( "UI.HudQuestCompleteWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		questId = -1
	end

	if type( completionData ) ~= "table" then
		sys.log( "UI.HudQuestCompleteWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"completionData\"); \"table\" expected, got \"%s\"", type( completionData ) )
		completionData = nil
	end

	self.questId		= questId
	self.completionData	= completionData

	self:FullUpdate()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:RestartAnimation()
	end

end


--
function UI.HudQuestCompleteWnd:SetupAdventure( completionData )

	self:Reset()

	if type( completionData ) ~= "table" then
		sys.log( "UI.HudQuestCompleteWnd:Setup()[ERROR]: invalid type of the 1-nd parameter (\"completionData\"); \"table\" expected, got \"%s\"", type( completionData ) )
		completionData = nil
	end

	if type( completionData.atid ) ~= "number" then
		sys.log( "UI.HudQuestCompleteWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"completionData.atid\"); \"number\" expected, got \"%s\"", type( completionData.atid ) )
		completionData.atid = 0
	end

	self.adventureAtid	= completionData.atid
	self.completionData	= completionData
	self.rewards 		= UI:GetAdventureRewards( self.adventureAtid, self.completionData.stageFinal, self.completionData )

	if not next( self.rewards ) then
		self:Reset()
		return
	end

	self:FullUpdate()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:RestartAnimation()
	end

end


--
function UI.HudQuestCompleteWnd:SetupScriptReward( reason, rewards )

	self:Reset()
	self.rewards		= rewards
	self.questId		= 0
	self.rewardReason	= reason

	if self:IsOnScreen() then
		self.bNeedPlaySound	= false
		UI:PlayGlobalSound( self.sounds.scriptReward )
	else
		self.bNeedPlaySound	= true
	end

	self:FullUpdate()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:RestartAnimation()
	end
end


--
function UI.HudQuestCompleteWnd:Reset()

	self.questId		= -1
	self.completionData	= nil
	self.bNeedPlaySound	= false
	self.rewardReason	= ai.QuestRewardReasons.QUEST
	self.rewards		= nil
	UI.HudQuestComplete_RewardsListWnd:Reset()

	self.adventureAtid	= 0

end


--
function UI.HudQuestCompleteWnd:HasContentToShow()

	-- return self.questId ~= -1
	return self.questId ~= -1 or self.adventureAtid ~= 0

end


-- -----------------------------------------
-- const
-- -----------------------------------------

UI.HudQuestCompleteWnd.layers =
{
	MAIN_EFFECT		= 0,
    CAPTION			= 1,
    REWARDS_LABEL	= 2,
}

UI.HudQuestCompleteWnd.effectInfo =
{
	main =
	{
		rewardLocator	= "awords"
	}
}

UI.HudQuestCompleteWnd.sounds = { scriptReward = "sound/ui/hudShowQuest" }

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.HudQuestCompleteWnd.questId			= -1
UI.HudQuestCompleteWnd.mainEffect		= nil
UI.HudQuestCompleteWnd.bNeedPlaySound	= false
UI.HudQuestCompleteWnd.rewardReason		= ai.QuestRewardReasons.QUEST
UI.HudQuestCompleteWnd.rewards			= nil

UI.HudQuestCompleteWnd.completionData	= nil

UI.HudQuestCompleteWnd.adventureAtid	= 0

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.HudQuestCompleteWnd:FullUpdate()

	if self.rewards == nil then
		self.rewards = UI:GetQuestRewards( self.questId, false, nil, nil, self.completionData )
	end
	
	if self.rewardReason == ai.QuestRewardReasons.QUEST then
		self:SetText( UI:GetStringByName( "hud_questComplete_caption" ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( "hud_questComplete_rewards" ), self.layers.REWARDS_LABEL )
	else
		local rewardReasonName = UI:Val2Key( ai.QuestRewardReasons, self.rewardReason )
		self:SetText( UI:GetStringByName( string.format( "hud_questReward_%s_caption", rewardReasonName ) ), self.layers.CAPTION )
		self:SetText( UI:GetStringByName( string.format( "hud_questReward_%s_rewards", rewardReasonName ) ), self.layers.REWARDS_LABEL )
	end
	
	UI.HudQuestComplete_RewardsListWnd:Setup( self.rewards )
	
	self:RecalcLayout()

end


--
function UI.HudQuestCompleteWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	if self.bNeedPlaySound then
		UI:PlayGlobalSound( self.sounds.scriptReward )
		self.bNeedPlaySound = false
	end
end

--
function UI.HudQuestCompleteWnd:RecalcLayout()
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	
	local rewardsPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.rewardLocator ) or Vec2( 0, 0 )
	local rewardsWidth	= UI.HudQuestComplete_RewardsListWnd:GetWidth()
	
	local rewardsX = ( self:GetWidth() - rewardsWidth ) * 0.5
	UI.HudQuestComplete_RewardsListWnd:SetPos( rewardsX, rewardsPos.y )

end


--
function UI.HudQuestCompleteWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ) then
		self:Reset()
		UI.HudWnd:OnQuestCompleteHide()
	end	

end


-- ----------------------------------------------------------------------------
-- UI.HudQuestComplete_RewardsListWnd
-- ----------------------------------------------------------------------------

UI.HudQuestComplete_RewardsListWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.HudQuestComplete_RewardsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudQuestComplete_RewardsListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "hud_questComplete_rewardsList",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.HudQuestComplete_RewardsListWnd:Setup( rewards )
	
	self:Reset()
	
	self.rewards = rewards
	
	for rewardIdx, reward in ipairs( rewards ) do
	
		local slotWnd = self:ObtainFreeSlot()
		if slotWnd then
			slotWnd:Setup( reward )
		end
	
	end
	
	self:RecalcLayout()
	
end


--
function UI.HudQuestComplete_RewardsListWnd:Reset()

	self.rewards = {}
	
	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end
	self.curSlots = {}
	
end


-- ---------------------------
-- const
-- ---------------------------

UI.HudQuestComplete_RewardsListWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.HudQuestComplete_RewardsListWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "icon_slot_",
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.HudQuestComplete_RewardsListWnd.rewards	= {}
UI.HudQuestComplete_RewardsListWnd.curSlots	= {}
UI.HudQuestComplete_RewardsListWnd.allSlots	= {}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.HudQuestComplete_RewardsListWnd:ObtainFreeSlot()
	
	local freeSlotWnd = nil
	
	for slotIdx, slotWnd in pairs( self.allSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end
	
	if not freeSlotWnd then
	
		freeSlotWnd = UI:CreateChildWnd( self, UI.HudQuestComplete_RewardSlotWnd, tostring( #self.allSlots + 1 ) )
		
		if freeSlotWnd then
			table.insert( self.allSlots, freeSlotWnd )
		end
		
	end
	
	if freeSlotWnd then
	
		table.insert( self.curSlots, freeSlotWnd )
		self:AddChild( freeSlotWnd )
		
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:LinkWnd( freeSlotWnd:GetUiHandle(), string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ), UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
		end
		
	end
	
	return freeSlotWnd
	
end


--
function UI.HudQuestComplete_RewardsListWnd:RecalcLayout()
	
	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local aSlotWnd		= self.allSlots[ 1 ]
	
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local slotWidth		= aSlotWnd and aSlotWnd:GetWidth() or 0
	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	
	local space_slots	= secondSlotPos.x - ( firstSlotPos.x + slotWidth )
	local slotsY		= firstSlotPos.y
	local slotsX		= 0
	
	-- позиции слотов
	
	for slotIdx, slotWnd in pairs( self.curSlots ) do
		local x = slotsX + ( slotWidth + space_slots ) * ( slotIdx - 1 )
		slotWnd:SetPos( x, slotsY )
	end
	
	-- собственный размер
	
	local selfWidth = 0
	
	if next( self.curSlots ) then
		local lastSlotWnd = self.curSlots[ #self.curSlots ]
		selfWidth = lastSlotWnd:GetLeft() + slotWidth
	end
	
	self:SetWidth( selfWidth )
	self:SetHeight( selfSize.y )

end


-- ----------------------------------------------------------------------------
-- UI.HudQuestComplete_RewardSlotWnd
-- ----------------------------------------------------------------------------

UI.HudQuestComplete_RewardSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.HudQuestComplete_RewardSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ItemIcoWnd",

	props =
	{
		name		= "HudQuestComplete_RewardSlotWnd",	
		isPrototype	= true,
	},
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.HudQuestComplete_RewardSlotWnd:Setup( reward )

	self:Reset()

	self.reward = reward

	local rewardTypeName = UI:Val2Key( UI.questRewardTypes, self.reward.rewardType )

	local fnUpdateName = string.format( "Update_%s", rewardTypeName )
	local fnUpdate = self[ fnUpdateName ]

	if fnUpdate then
		fnUpdate( self )
	else
		sys.log( "UI.HudQuestComplete_RewardSlotWnd:Setup()[ERROR]: cannot find function \"%s()\"", fnUpdateName )
	end

end


--
function UI.HudQuestComplete_RewardSlotWnd:Reset()

	UI.ItemIcoWnd.Reset( self )

	self:HideMain()
	self:HideIcoMain()

	self.reward = nil
	
end


-- ---------------------------
-- vars
-- ---------------------------

UI.HudQuestComplete_RewardSlotWnd.reward	= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.HudQuestComplete_RewardSlotWnd:Update_ITEM()

	local defName = self.reward.defName
	local count = self.reward.count

	-- иконка

	self:SetupForItem( defName )

	if count > 1 then
		self:SetCountResourcesText( UI:Price2Str2( count ) )
	end

	-- тултип

	local tooltipData = UI:GetTooltipForItem( defName )
	self:SetTooltipData( tooltipData )

end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_ACCOUNT_AURA()

	local defName = self.reward.defName

	-- иконка

	local hTex = UI:GetMailAttachmentAccountAuraIco( defName )
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	

	-- тултип

	local tooltipData = {}
	tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	tooltipData.caption		= UI:AccountAura2Str( defName )
	tooltipData.text		= UI:GetAccountAuraDesc( defName )

	self:SetTooltipData( tooltipData )

end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_GOLD()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentGoldIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ), UI.GOLD_COLOR )

	-- тултип

	local tooltipData = {}

	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_GOLD,
		val			= val,
		bIsBuyPrice	= false,
	}

	self:SetTooltipData( tooltipData )

end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_CREDITS()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentCreditsIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_CREDITS,
		val			= val,
		bIsBuyPrice	= false,
	}

	self:SetTooltipData( tooltipData )

end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_TOKENS()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentTokensIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
		val			= val,
		bIsBuyPrice	= false,
	}

	self:SetTooltipData( tooltipData )

end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_SYNERGY()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentSynergyShipIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип
	
	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= UI.exPriceTypes.SYNERGY,
		val			= val,
		bIsBuyPrice	= false,
	}

	self:SetTooltipData( tooltipData )

end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_FREE_SYNERGY()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentSynergyFreeIco()
	self:SetupIco( hTex )
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип
	
	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= UI.exPriceTypes.FREE_SYNERGY,
		val			= val,
		bIsBuyPrice	= false,
	}

	self:SetTooltipData( tooltipData )
end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_CLAN_IRIDIUM()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentClanIridiumIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
		val			= val,
		bIsBuyPrice	= false,
	}

	self:SetTooltipData( tooltipData )

end


--
function UI.HudQuestComplete_RewardSlotWnd:Update_EVENT_CREDITS()

	local val = self.reward.val

	-- иконка

	local hTex = UI:GetMailAttachmentEventCreditsIco()
	self:SetupIco( hTex )

	-- #0100859 - без цвета
	-- local color = UI:GetItemQualityColor( UI.MK1_QUALITY, false )
	-- self:ShowColorBg2( color, false )
	
	self:SetCountResourcesText( UI:Price2Str2( val ) )
	

	-- тултип

	local tooltipData = {}
	
	tooltipData.tooltipType = UI.tooltipTypes.PRICE
	
	tooltipData.priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_EVENT,
		val			= val,
		bIsBuyPrice	= false,
	}

	self:SetTooltipData( tooltipData )

end