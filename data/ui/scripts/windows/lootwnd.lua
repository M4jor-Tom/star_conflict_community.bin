-- ----------------------------------------------------------------------------
--
-- Workfile: lootwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.LootWnd = {}
local lw = UI.LootWnd

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.LootWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "LootWnd",
		activationOrder	= -1,
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
				defName 			= "loot_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.LootWnd.layers.CAPTION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer",
						layer		= "UI.LootWnd.layers.TIMER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "tips_2",
						layer		= "UI.LootWnd.layers.NUM_ATTEMPTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "tips_1",
						layer		= "UI.LootWnd.layers.PRESS_KEY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "scan_finish",
						layer		= "UI.LootWnd.layers.STOP_LOOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loot_found",
						wnd			= "UI.Loot_GainedItemWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "tips_3",
						layer		= "UI.LootWnd.layers.NO_SPECIAL_POINT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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

		-- CAPTION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "loot_caption",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.LootWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text 			= "^loot_caption",
    	}, 

		-- TIMER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "loot_timer",
				defaultAnimation	= "finish",

				links =
				{
					{
						objName		= "timer",
						layer		= "UI.LootWnd.layers.TIMER_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- TIMER_TEXT
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

    	-- NUM_ATTEMPTS
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

		-- PRESS_KEY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "loot_pressKey",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "tips_1",
						layer		= "UI.LootWnd.layers.PRESS_KEY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- PRESS_KEY
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
			text			= "^loot_pressKeyToCancel",
    	},     

		-- STOP_LOOT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "loot_stop",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.LootWnd.layers.STOP_LOOT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- STOP_LOOT_TEXT
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
			text			= "^loot_stopped",
    	},     

    	-- NO_SPECIAL_POINT
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	},     
	},

	children = { "UI.Loot_GainedItemWnd", "UI.Loot_SalvageWnd" }
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.LootWnd:CanShowLoot( data )

	if type( data ) ~= "table" then
		sys.log( "UI.LootWnd:CanShowLoot()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( data ) )
		return false
	end

	if _G.Game_IsObserverMode() then
		return false
	end

	local localPlayerData = self:GetLocalPlayerData( data )

	if not localPlayerData then
		sys.log( "UI.LootWnd:CanShowLoot()[ERROR]: cannot find data for local player" )
		return false
	end


	if localPlayerData.lootScanTime == nil then
		sys.log( "UI.LootWnd:CanShowLoot()[ERROR]: nil \"lootScanTime\"" )
		return false
	end

	if localPlayerData.lootScanTime <= 0 then
		sys.log( "UI.LootWnd:CanShowLoot()[ERROR]: lootScanTime is 0" )
		return false
	end

	if localPlayerData.lootAttemptsNum == nil then
		sys.log( "UI.LootWnd:CanShowLoot()[ERROR]: nil \"lootAttemptsNum\"" )
		return false
	end

	if localPlayerData.lootAttemptsNum <= 0 then
		sys.log( "UI.LootWnd:CanShowLoot()[ERROR]: lootAttemptsNum is 0" )
		return false
	end

	if _G.CL_GetLootingTimeLeft() <= 0 then
		sys.log( "UI.LootWnd:CanShowLoot(): timer is 0" )
		return false
	end

	return true

end


--
function UI.LootWnd:Setup( data )

	self.data = nil
	self.maxAttempts = 0
	self.numAttempts = 0
	self.maxScanTime = 0
	self.gainedItems = {}
	self:Reset()

	if not self:CanShowLoot( data ) then
		sys.log( "UI.LootWnd:Setup()[ERROR]: loot cannot be shown" )
		return false
	end

	local localPlayerData = self:GetLocalPlayerData( data )
	           
	self.data = data
	self.maxAttempts = localPlayerData.lootAttemptsNum
	self.numAttempts = self.maxAttempts
	self.maxScanTime = localPlayerData.lootScanTime

	self:FullUpdate()

	return true

end


-- вызывается из Loot_ScanPointWnd
function UI.LootWnd:OnStopScan( scanPointWnd )

	self:TryLoot()	

end


-- вызывается из cpp
function UI.LootWnd:OnScanResult( result, attemptsLeft, defName, amount, skipSalvaging, sellRefund, salvagePrice, salvageRefund, salvageGoldRefund, creditsEarned, tokensEarned, salvagePremiumCantAfford, playerGold )

--	sys.log( "result %d, attemptsLeft %d, defName %s, amount %d, sellRefund %d, salvagePrice %d, salvageRefund %d, salvageGoldRefund %d, creditsEarned %d, tokensEarned %d", result, attemptsLeft, defName, amount, sellRefund, salvagePrice, salvageRefund, salvageGoldRefund, creditsEarned, tokensEarned )

	if not self:GetParent() then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: not on screen" )
		return
	end

	if type( result ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 1-st parameter (\"result\"); \"number\" expected, got \"%s\"", type( result ) )
		result = -1		
	end

	if type( attemptsLeft ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 2-nd parameter (\"attemptsLeft\"); \"number\" expected, got \"%s\"", type( attemptsLeft ) )
		attemptsLeft = 0
	end    

	if type( defName ) ~= "string" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 3-rd parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		defName = ""
	end

	if type( amount ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 4-th parameter (\"amount\"); \"number\" expected, got \"%s\"", type( amount ) )
		amount = 0
	end

	if type( skipSalvaging ) ~= "boolean" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 5-th parameter (\"skipSalvaging\"); \"boolean\" expected, got \"%s\"", type( skipSalvaging ) )
		skipSalvaging = false
	end

	if type( sellRefund ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 6-th parameter (\"sellRefund\"); \"number\" expected, got \"%s\"", type( sellRefund ) )
		sellRefund = 0
	end

	if type( salvagePrice ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 7-th parameter (\"salvagePrice\"); \"number\" expected, got \"%s\"", type( salvagePrice ) )
		salvagePrice = 0
	end

	if type( salvageRefund ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 8-th parameter (\"salvageRefund\"); \"number\" expected, got \"%s\"", type( salvageRefund ) )
		salvageRefund = 0
	end

	if type( salvageGoldRefund ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 9-th parameter (\"salvageGoldRefund\"); \"number\" expected, got \"%s\"", type( salvageGoldRefund ) )
		salvageGoldRefund = 0
	end

	if type( creditsEarned ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 10-th parameter (\"creditsEarned\"); \"number\" expected, got \"%s\"", type( creditsEarned ) )
		creditsEarned = 0
	end

	if type( tokensEarned ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 11-th parameter (\"tokensEarned\"); \"number\" expected, got \"%s\"", type( tokensEarned ) )
		tokensEarned = 0
	end

	if type( salvagePremiumCantAfford ) ~= "boolean" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 12-th parameter (\"salvagePremiumCantAfford\"); \"boolean\" expected, got \"%s\"", type( salvagePremiumCantAfford ) )
		salvagePremiumCantAfford = false
	end

	if type( playerGold ) ~= "userdata" or type( playerGold.h ) ~= "number" or type( playerGold.l ) ~= "number" then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: invalid type of the 13-th parameter (\"playerGold\"); u64 expected, got \"%s\"", type( playerGold ) )
		playerGold = u64( 0, 0 )
	end

	local numEarned = 0
	if creditsEarned > 0 then
		numEarned = numEarned + 1
	end

	if tokensEarned > 0 then
		numEarned = numEarned + 1
	end

	if numEarned > 1 then
		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: more than one type of reward (only one from money/tokens expected) after scanning \"%s\"", defName )

		if tokensEarned > 0 then
			creditsEarned = 0
		end
	end

	if self.scanningPoint then
		self.scanningPoint:OnScanResult( result, defName )
		self:SetScanningPoint( nil )
	end

	local bSoundPlayed = false


	if result == ai.LootScanResult.LSR_NO_ATTEMPTS then

		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: no attempts" )

	elseif result == ai.LootScanResult.LSR_SPACE_JUNK or result == ai.LootScanResult.LSR_ITEM or result == ai.LootScanResult.LSR_ACCOUNT_AURA then

		local item =
		{
			defName						= defName,
			amount						= amount,
			creditsEarned				= creditsEarned,
			tokensEarned				= tokensEarned,
			salvagePrice				= salvagePrice,
			salvageRefund				= salvageRefund,
			salvageGoldRefund			= salvageGoldRefund,
			bSalvaged					= false,
			sellRefund					= sellRefund,
			salvagePremiumCantAfford	= salvagePremiumCantAfford,
			playerGold					= tonumber( _G.U64ToStr( playerGold ) ),
			bAccountAura				= result == ai.LootScanResult.LSR_ACCOUNT_AURA,
		}
		
		if result == ai.LootScanResult.LSR_ITEM and UI:IsDefAutogen( defName ) then
			item.autogenItem = _G.GetAutogenItem( defName )
		end

		if result == ai.LootScanResult.LSR_ITEM and not skipSalvaging then
			self:ShowSalvageWnd( item )
		else
			table.insert( self.gainedItems, item )
			self:ShowGainedItem( item )
		end

		UI:PlayGlobalSound( self.sounds.stopScanSuccess )
		bSoundPlayed = true

	elseif result == ai.LootScanResult.LSR_NOTHING_FOUND then

		UI:PlayGlobalSound( self.sounds.stopScanFail )
		bSoundPlayed = true

	elseif result == ai.LootScanResult.LSR_INVALID_STATE then

		sys.log( "UI.LootWnd:OnScanResult()[ERROR]: LSR_INVALID_STATE" )

	end

	self.numAttempts = attemptsLeft
	self:UpdateNumAttemptsControl()	

	if self.state ~= self.states.STOPPED then

    	local bNeedStop = false

    	if not UI.Loot_SalvageWnd:IsOnScreen() then
    		bNeedStop = attemptsLeft == 0 or not self:HasPointThatCanScan() or result == ai.LootScanResult.LSR_NO_ATTEMPTS or result == ai.LootScanResult.LSR_TIME_EXPIRED
    	end

    	if bNeedStop then

    		self:SetState( self.states.STOPPED )

    		if not bSoundPlayed then
				if self.sounds.stopLoot and self.sounds.stopLoot ~= "" then
    				UI:PlayGlobalSound( self.sounds.stopLoot )			
				end
    		end

    	end

	end

end


--
function UI.LootWnd:OnSalvageResult( result, creditsEarned, tokensEarned )

	if not self:GetParent() then
		return
	end

	if type( result ) ~= "number" then
		sys.log( "UI.LootWnd:OnSalvageResult()[ERROR]: invalid type of the 1-st parameter (\"result\"); \"number\" expected, got \"%s\"", type( result ) )
		result = -1		
	end

	if type( tokensEarned ) ~= "number" then
		sys.log( "UI.LootWnd:OnSalvageResult()[ERROR]: invalid type of the 2-nd parameter (\"tokensEarned\"); \"number\" expected, got \"%s\"", type( tokensEarned ) )
		tokensEarned = 0
	end

	local bSoundPlayed = false

	if result == ai.SalvageOpRes.SALOR_SUCCESS then

		if UI.Loot_SalvageWnd:IsOnScreen() then

    		local item = UI.Loot_SalvageWnd:GetItem()
			self:HideSalvageWnd()

			item.bSalvaged		= true
			item.creditsEarned	= creditsEarned
			item.tokensEarned	= tokensEarned

			table.insert( self.gainedItems, item )
    		self:ShowGainedItem( item )

			UI:PlayGlobalSound( self.sounds.stopScanSuccess )
			bSoundPlayed = true

		else
			sys.log( "UI.LootWnd:OnSalvageResult()[ERROR]: salvage wnd is noton screen" )
		end

	elseif result == ai.SalvageOpRes.SALOR_CANT_AFFORD then

		self:ShowMsgOnSalvageError( result )

	else

		sys.log( "UI.LootWnd:OnSalvageResult()[ERROR]: fail to salvage: error %d", result )
		self:ShowMsgOnSalvageError( result )

	end

	if self.state ~= self.states.STOPPED then

    	local bNeedStop = false

		if not UI.Loot_SalvageWnd:IsOnScreen() then
			bNeedStop = self.numAttempts == 0 or not self:HasPointThatCanScan()
		end

    	if bNeedStop then

    		self:SetState( self.states.STOPPED )

    		if not bSoundPlayed then
				if self.sounds.stopLoot and self.sounds.stopLoot ~= "" then
    				UI:PlayGlobalSound( self.sounds.stopLoot )			
				end
    		end

    	end

	end

end


--
function UI.LootWnd:ShowMsgOnSalvageError( result )

	UI:ShowErrorMsg( "msg_salvageError", result, "ai.SalvageOpRes" )

end


--
function UI.LootWnd:OnBuyAltPriceWndResult( result, mode, data, bGold )

	if mode ~= UI.BuyAltPriceWnd.modes.SALVAGE and mode ~= UI.BuyAltPriceWnd.modes.LOOT_ITEM then
		sys.log( "UI.LootWnd:OnBuyAltPriceWndResult()[ERROR]: unhandled mode: %s", tostring( mode ) )
		return
	end

	if result == true then
		self:DoSalvage( data.slotType )
	end

end


--
function UI.LootWnd:OnTradeResult_Sell( invItem, count )

	self:DoSalvage( UI.Loot_SalvageWnd.slotTypes.SELL )

end


-- --------------------------------------
-- const
-- --------------------------------------

lw.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
	CAPTION_EFFECT		= 2,
    CAPTION				= 3,
    TIMER_EFFECT		= 4,
    TIMER_TEXT			= 5,
    NUM_ATTEMPTS		= 6,
	PRESS_KEY_EFFECT	= 7,
    PRESS_KEY			= 8,
    STOP_LOOT_EFFECT	= 9,
    STOP_LOOT_TEXT		= 10,
	NO_SPECIAL_POINT	= 11,
}

lw.states =
{
	SCANNING	= 1,
	STOPPED		= 2,
}

lw.LOW_TIME		= 10

lw.sounds =
{
	timer					= "sound/ui/lootTimer",
	scanning				= "sound/ui/lootScanning",
	stopScanSuccess 		= "sound/ui/lootScanSuccess",
	stopScanFail			= "sound/ui/lootScanFail",
	stopLoot				= "",
	scanPointMouseOver		= "sound/ui/btnMouseOver",
	salvageSlotMouseOver	= "sound/ui/btnMouseOver",
	tradeWndShow			= "sound/ui/btnClick",
}

lw.strNumAttempts = UI:GetStringByName( "loot_numAttempts"  )

lw.effectInfo =
{
	main =
	{
		gainedItemLocator 	= "loot_found",
		salvageLocator		= "recognition_loot",
	}
}

lw.IS_FULL_SCREEN = false

-- --------------------------------------
-- vars
-- --------------------------------------

lw.allScanPoints			= {}
lw.allSpecScanPoints		= {}
lw.allUnlimPveScanPoints	= {}
lw.allEventScanPoints		= {}
lw.curScanPoints			= {}
lw.data						= nil
lw.maxAttempts				= 0
lw.numAttempts				= 0
lw.hMsgCancelLoot			= UI.INVALID_UI_HANDLE
lw.state					= -1
lw.prevTime					= -1
lw.scanningPoint			= nil
lw.gainedItems				= {}
lw.maxScanTime				= 0

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.LootWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self:Reset()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.LootWnd:GetLocalPlayerData( data )

	local localPlayerId = UI.HudWnd.localPlayerId

	for idx, playerData in ipairs( data.players ) do

		if playerData and playerData.playerId == localPlayerId then
			return playerData
		end

	end

	return nil

end


--
function UI.LootWnd:Reset()

	self:SetLayerVisible( false, self.layers.CAPTION_EFFECT )
	self:SetLayerVisible( false, self.layers.CAPTION )
	self:SetLayerVisible( false, self.layers.TIMER_EFFECT )
	self:SetLayerVisible( false, self.layers.TIMER_TEXT )
	self:SetLayerVisible( false, self.layers.NUM_ATTEMPTS )
	self:SetLayerVisible( false, self.layers.PRESS_KEY_EFFECT )
	self:SetLayerVisible( false, self.layers.PRESS_KEY )
	self:SetLayerVisible( false, self.layers.STOP_LOOT_EFFECT )
	self:SetLayerVisible( false, self.layers.STOP_LOOT_TEXT )

	self:HideGainedItem()
	self:HideSalvageWnd()
	self:ResetScanPoints()

	self.state = -1
	self.prevTime = -1
	self.scanningPoint = nil

	UI:StopGlobalSound( self.sounds.scanning )

end


--
function UI.LootWnd:FullUpdate()

	if not self.data then
		self:ProceedToDebriefing()
		return
	end

	self:Reset()

	local state = self.states.SCANNING

	if UI.bSavingGameState and UI.store.LootWnd then

		state = UI.store.LootWnd.state

    	if UI.store.LootWnd.salvageItem then
    		self:ShowSalvageWnd( UI.store.LootWnd.salvageItem )
    	end

	end

	self:SetState( state )

end


--
function UI.LootWnd:SetState( state )

	local prevState = self.state
	self.state = state

	if state == self.states.SCANNING then

		if prevState ~= -1 then
			sys.log( "UI.LootWnd:SetState()[ERROR]: invalid prev state %d to state %d", prevState, state )
		end

    	self:SetLayerVisible( true, self.layers.CAPTION_EFFECT )
    	self:SetLayerVisible( true, self.layers.CAPTION )
    	self:SetLayerVisible( true, self.layers.TIMER_EFFECT )
    	self:SetLayerVisible( true, self.layers.TIMER_TEXT )
    	self:SetLayerVisible( true, self.layers.NUM_ATTEMPTS )
    	self:SetLayerVisible( true, self.layers.PRESS_KEY_EFFECT )
    	self:SetLayerVisible( true, self.layers.PRESS_KEY )
    	self:SetLayerVisible( false, self.layers.STOP_LOOT_EFFECT )
    	self:SetLayerVisible( false, self.layers.STOP_LOOT_TEXT )

		self:UpdateScanPoints()
		self:UpdateTimer()
		self:UpdateNumAttemptsControl()

		self:UpdateMouseOverScanPoint()


	elseif state == self.states.STOPPED then

    	self:SetLayerVisible( false, self.layers.CAPTION_EFFECT )
    	self:SetLayerVisible( false, self.layers.CAPTION )
    	self:SetLayerVisible( false, self.layers.TIMER_EFFECT )
    	self:SetLayerVisible( false, self.layers.TIMER_TEXT )
    	self:SetLayerVisible( false, self.layers.NUM_ATTEMPTS )
    	self:SetLayerVisible( false, self.layers.PRESS_KEY_EFFECT )
    	self:SetLayerVisible( false, self.layers.PRESS_KEY )
    	self:SetLayerVisible( true, self.layers.STOP_LOOT_EFFECT )
    	self:SetLayerVisible( true, self.layers.STOP_LOOT_TEXT )

		local stopLootEffect = UI:GetEffectFromLayer( self, self.layers.STOP_LOOT_EFFECT )
		if stopLootEffect then
			stopLootEffect:RestartAnimation()
		end

		if prevState == -1 then
			self:UpdateScanPoints()
		end

		for scanPointIdx, scanPoint in pairs( self.curScanPoints ) do
			scanPoint:OnStopLoot()
		end

		self:UpdateMouseOverScanPoint()

    	if self.hMsgCancelLoot ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgCancelLoot )
    		self.hMsgCancelLoot = UI.INVALID_UI_HANDLE
    	end

		self.scanningPoint = nil
		UI:StopGlobalSound( self.sounds.scanning )

		self:HideSalvageWnd()

	else
		sys.log( "UI.LootWnd:SetState()[ERROR]: unhandled state: %s", tostring( state ) )
	end

end


--
function UI.LootWnd:UpdateScanPoints()	

	self:ResetScanPoints()

	if UI.bSavingGameState and UI.store.LootWnd then

		for scanPointIdx, scanPointInfo in pairs( UI.store.LootWnd.scanPoints ) do

			local state = scanPointInfo.state

			if scanPointInfo.state == UI.Loot_ScanPointWnd.states.SCANNING then
				sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: invalid state" )
				state = UI.Loot_ScanPointWnd.states.UNCHECKED
			end

    		local scanPointWnd = nil
			if scanPointInfo.bSpec then
				scanPointWnd = self:AddSpecScanPoint( scanPointInfo.entId, state )
			elseif scanPointInfo.bUnlimPve then
				scanPointWnd = self:AddUnlimPveScanPoint( scanPointInfo.entId, state )
			elseif scanPointInfo.bEvent then
				scanPointWnd = self:AddEventScanPoint( scanPointInfo.entId, state )
			else
				scanPointWnd = self:AddScanPoint( scanPointInfo.entId, state )
			end

			if state == UI.Loot_ScanPointWnd.states.WAITING_FOR_RESULT then
	
				if self.scanningPoint then
					sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: scanningPoint already exists" )
				end
	
				self.scanningPoint = scanPointWnd
	
			end

		end

		return
	end


	-- "фиолетовые" и "синие"(для бесконечного пве) точки
	local palyerData = self:GetLocalPlayerData( self.data )

	local numSpecScanPoints = 0
	if type( palyerData.lootSpecialAllowed ) == "number" then

		numSpecScanPoints = palyerData.lootSpecialAllowed

		if numSpecScanPoints < 0 then
			sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: negative spec points number" )
			numSpecScanPoints = 0
		end

	else
		sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: invalid type od the field \"lootSpecialAllowed\"; \"number\" expected, got \"%s\"", type( palyerData.lootSpecialAllowed ) )
	end
	
	local numUnlimPveScanPoints = 0
	if type( palyerData.lootUnlimPveAllowed ) == "number" then

		numUnlimPveScanPoints = palyerData.lootUnlimPveAllowed

		if numUnlimPveScanPoints < 0 then
			sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: negative unlim pve points number" )
			numUnlimPveScanPoints = 0
		end

	else
		sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: invalid type od the field \"lootUnlimPveAllowed\"; \"number\" expected, got \"%s\"", type( palyerData.lootUnlimPveAllowed ) )
	end
	
	local numEventScanPoints = 0
	if type( palyerData.lootEventAllowed ) == "number" then

		numEventScanPoints = palyerData.lootEventAllowed

		if numEventScanPoints < 0 then
			sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: negative event points number" )
			numEventScanPoints = 0
		end

	else
		sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: invalid type od the field \"lootEventAllowed\"; \"number\" expected, got \"%s\"", type( palyerData.lootEventAllowed ) )
	end


	local entIds, specEntIds, unlimPveEntIds, eventEntIds = self:GetScanPointEntities( numSpecScanPoints, numUnlimPveScanPoints, numEventScanPoints )

	if ( #entIds + #specEntIds + #unlimPveEntIds + #eventEntIds ) < self.maxAttempts then
		sys.log( "UI.LootWnd:UpdateScanPoints()[ERROR]: not enough scan points; num scan points: %d, num attempts %d; level: %s, gameplay: %d", #entIds + #specEntIds + #unlimPveEntIds + #eventEntIds, self.maxAttempts, UI:GetCurLevelName(), _G.GetCurrentGameMode() )
	end

	for scanPointIdx, entId in pairs( entIds ) do
		self:AddScanPoint( entId, UI.Loot_ScanPointWnd.states.UNCHECKED )
	end

	for scanPointIdx, entId in pairs( specEntIds ) do
		self:AddSpecScanPoint( entId, UI.Loot_ScanPointWnd.states.UNCHECKED )
	end
	
	for scanPointIdx, entId in pairs( unlimPveEntIds ) do
		self:AddUnlimPveScanPoint( entId, UI.Loot_ScanPointWnd.states.UNCHECKED )
	end
	
	for scanPointIdx, entId in pairs( eventEntIds ) do
		self:AddEventScanPoint( entId, UI.Loot_ScanPointWnd.states.UNCHECKED )
	end


	-- предупреждение, что фиолетовая точка бывает только раз за день
	if _G.GetCurrentGameMode() == ai.Gameplay.PVE_MISSION then		

		self:SetLayerVisible( true, self.layers.NO_SPECIAL_POINT )

		local str = ""

		local missionName = _G.CL_PveGetMissionName()
		if UI:IsPveMissionRaid( missionName ) then

			local levelName = UI:GetPveMissionLevelName( missionName )

			strId = string.format( "loot_noSpecialPoint_%s", levelName )
			str = UI:GetStringByName( strId )

		else
			str = UI:GetStringByName( "loot_noSpecialPoint" )
		end

		self:SetText( str, self.layers.NO_SPECIAL_POINT )

	end

end


--
function UI.LootWnd:GetScanPointEntities( numSpecPoints, numUnlimPveScanPoints, numEventScanPoints )

	local entIds = {}
	local specEntIds = {}
	local unlimPveEntIds = {}
	local eventEntIds = {}

	local numPoints = 0

	local gameplay = _G.GetCurrentGameMode()
	local gameplayInfo = _G.GameplayDef and _G.GameplayDef[ gameplay ]

	if type( gameplayInfo ) ~= "table" then
		sys.log( "UI.LootWnd:GetScanPointEntities()[ERROR]: invalid type of _G.GameplayDef[%d]; \"table\" expected, got \"%s\"", gameplay, type( gameplayInfo ) )
		gameplayInfo = nil
	end

	if gameplayInfo then

		if type( gameplayInfo.loot_spots_shown ) == "number" then
			numPoints = gameplayInfo.loot_spots_shown
		else
			sys.log( "UI.LootWnd:GetScanPointEntities()[ERROR]: invalid type of _G.GameplayDef[%d].loot_spots_shown; \"number\" expected, got \"%s\"", gameplay, type( gameplayInfo.loot_spots_shown ) )
		end
	
		if numPoints < 0 then
			sys.log( "UI.LootWnd:GetScanPointEntities()[ERROR]: invalid scan points number %d in _G.GameplayDef[%d].loot_spots_shown", numPoints, gameplay )
			numPoints = 0
		end

	end

	local numPointsTotal = numPoints + numSpecPoints + numUnlimPveScanPoints + numEventScanPoints

	if numPointsTotal == 0 then
		return entIds, specEntIds, unlimPveEntIds, eventEntIds
	end


	local entities = {}
	local entIdx = 1

	while true do

		local name = string.format( "LootPoint%d", entIdx )
		local ent = _G.Entities[ name ]

		if ent then
			table.insert( entities, ent )
			entIdx = entIdx + 1
		else
			break
		end

	end

	local numEntities = #entities

	if numPointsTotal > numEntities then

		sys.log( "UI.LootWnd:GetScanPointEntities()[ERROR]: not enough loot point entities; level \"%s\", gameplay %d", UI:GetCurLevelName(), gameplay )

		numPointsTotal = numEntities
		numSpecPoints = math.min( numSpecPoints, numPointsTotal )
		numUnlimPveScanPoints = math.min( numUnlimPveScanPoints, numPointsTotal - numSpecPoints )
		numEventScanPoints = math.min( numEventScanPoints, numPointsTotal - numSpecPoints - numUnlimPveScanPoints )
		numPoints = numPointsTotal - numSpecPoints - numUnlimPveScanPoints - numEventScanPoints

	end

	while numEntities > numPointsTotal do

		local entIdx = math.random( 1, numEntities )
		table.remove( entities, entIdx )
		numEntities = numEntities - 1

	end	

	if numSpecPoints > 0 or numUnlimPveScanPoints > 0 or numEventScanPoints > 0 then 

		local entPoss = {}

		for entIdx, ent in pairs( entities ) do

			local worldPos = UI:Vec3( _G.GetEntityPos3( ent ) )
			local screenPos = UI:Vec3( _G.ProjectPointToScreen( worldPos ) )

			entPoss[ ent ] = screenPos.z > 0 and Vec2( screenPos.x, screenPos.y ) or Vec2( 0, 0 )

		end

		local centerPos = UI:Vec2( UI.screenWidth / 2, UI.screenHeight / 2 )

		-- для "фиолетовых" и "синих" точек выбираются ближайшие к центру позиции
		local function fnSortPred( ent1, ent2 )

			local distSq1 = UI:V2LengthSq( entPoss[ ent1 ] - centerPos )
			local distSq2 = UI:V2LengthSq( entPoss[ ent2 ] - centerPos )

			return distSq1 < distSq2

		end
	
		table.sort( entities, fnSortPred )
		
		for pointIdx = 1, numSpecPoints do
			table.insert( specEntIds, entities[ pointIdx ]:GetId() )
		end
		
		local firstUnlimPveEntIdx = numSpecPoints + 1
		for pointIdx = 1, numUnlimPveScanPoints do
			table.insert( unlimPveEntIds, entities[ firstUnlimPveEntIdx + pointIdx - 1 ]:GetId() )
		end
		
		local firstEventEntIdx = numSpecPoints + numUnlimPveScanPoints + 1
		for pointIdx = 1, numEventScanPoints do
			table.insert( eventEntIds, entities[ firstEventEntIdx + pointIdx - 1 ]:GetId() )
		end

	end
	
	local firstCommonEntIdx = numSpecPoints + numUnlimPveScanPoints + numEventScanPoints + 1
	for pointIdx = 1, numPoints do
		table.insert( entIds, entities[ firstCommonEntIdx + pointIdx - 1 ]:GetId() )
	end


	return entIds, specEntIds, unlimPveEntIds, eventEntIds

end


--
function UI.LootWnd:AddScanPoint( entId, state )

	local scanPointWnd = self:ObtainScanPoint()

	table.insert( self.curScanPoints, scanPointWnd )

	self:AddChild( scanPointWnd )
	scanPointWnd:Setup( #self.curScanPoints, entId, state, self.maxScanTime )

	return scanPointWnd

end


--
function UI.LootWnd:ObtainScanPoint()

	for idx, wnd in pairs( self.allScanPoints ) do
		if not wnd:IsChildOf( self ) then
			return wnd
		end
	end

	local scanPointWnd = UI:CreateChildWnd( self, UI.Loot_ScanPointWnd, tostring( #self.allScanPoints + 1 ) )
	table.insert( self.allScanPoints, scanPointWnd )

	return scanPointWnd

end


--
function UI.LootWnd:AddSpecScanPoint( entId, state )

	local scanPointWnd = self:ObtainSpecScanPoint()

	table.insert( self.curScanPoints, scanPointWnd )

	self:AddChild( scanPointWnd )
	scanPointWnd:Setup( #self.curScanPoints, entId, state, self.maxScanTime )

	return scanPointWnd

end


--
function UI.LootWnd:AddUnlimPveScanPoint( entId, state )

	local scanPointWnd = self:ObtainUnlimPveScanPoint()

	table.insert( self.curScanPoints, scanPointWnd )

	self:AddChild( scanPointWnd )
	scanPointWnd:Setup( #self.curScanPoints, entId, state, self.maxScanTime )

	return scanPointWnd

end


--
function UI.LootWnd:AddEventScanPoint( entId, state )

	local scanPointWnd = self:ObtainEventScanPoint()

	table.insert( self.curScanPoints, scanPointWnd )

	self:AddChild( scanPointWnd )
	scanPointWnd:Setup( #self.curScanPoints, entId, state, self.maxScanTime )

	return scanPointWnd

end


--
function UI.LootWnd:ObtainSpecScanPoint()

	for idx, wnd in pairs( self.allSpecScanPoints ) do
		if not wnd:IsChildOf( self ) then
			return wnd
		end
	end

	local scanPointWnd = UI:CreateChildWnd( self, UI.Loot_SpecScanPointWnd, tostring( #self.allSpecScanPoints + 1 ) )
	table.insert( self.allSpecScanPoints, scanPointWnd )

	return scanPointWnd

end


--
function UI.LootWnd:ObtainUnlimPveScanPoint()

	for idx, wnd in pairs( self.allUnlimPveScanPoints ) do
		if not wnd:IsChildOf( self ) then
			return wnd
		end
	end

	local scanPointWnd = UI:CreateChildWnd( self, UI.Loot_UnlimPveScanPointWnd, tostring( #self.allUnlimPveScanPoints + 1 ) )
	table.insert( self.allUnlimPveScanPoints, scanPointWnd )

	return scanPointWnd

end


--
function UI.LootWnd:ObtainEventScanPoint()

	for idx, wnd in pairs( self.allEventScanPoints ) do
		if not wnd:IsChildOf( self ) then
			return wnd
		end
	end

	local scanPointWnd = UI:CreateChildWnd( self, UI.Loot_EventScanPointWnd, tostring( #self.allEventScanPoints + 1 ) )
	table.insert( self.allEventScanPoints, scanPointWnd )

	return scanPointWnd

end


--
function UI.LootWnd:ResetScanPoints()

	for idx, scanPointWnd in pairs( self.curScanPoints ) do

		scanPointWnd:Reset()
		scanPointWnd:UnlinkFromParent()		

	end

	self.curScanPoints = {}

	self.scanningPoint = nil

	self:SetLayerVisible( false, self.layers.NO_SPECIAL_POINT )

end


--
function UI.LootWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimer()

end


--
function UI.LootWnd:UpdateTimer()

	if self.state ~= self.states.SCANNING then
		return
	end

	local time = _G.CL_GetLootingTimeLeft()

	self:UpdateTimerControl( time )

	if time <= 0 then
		self:OnTimeExpired()
	end

end


--
function UI.LootWnd:UpdateTimerControl( time )

	if time < 0 then
		time = 0
	end

	local timeRound = math.floor( time )

	if timeRound == self.prevTime then
		return
	end

	self.prevTime = timeRound	

	-- текст

	local strTime = UI:Time2Str3( timeRound )
	self:SetText( strTime, self.layers.TIMER_TEXT )

	-- анимация эффекта

	local timerEffect = UI:GetEffectFromLayer( self, self.layers.TIMER_EFFECT )
	if timerEffect then

    	local animTime = 0

    	if timeRound <= self.LOW_TIME then
    		animTime = 1 - timeRound / self.LOW_TIME
    	end		

		timerEffect:SetAnimationTime( animTime )
		timerEffect:Update( 0 )

	end

	-- звук

	if timeRound <= self.LOW_TIME and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.timer )
	end

end


--
function UI.LootWnd:UpdateNumAttemptsControl()

	local str = string.format( self.strNumAttempts, self.numAttempts )
	self:SetText( str, self.layers.NUM_ATTEMPTS )	

end


--
function UI.LootWnd:HideGainedItem()

	UI.Loot_GainedItemWnd:UnlinkFromParent()

end


--
function UI.LootWnd:ShowGainedItem( item )

	local junkPriceInfo = nil
	if item.bSalvaged or ( not item.bAccountAura and UI:IsDefJunk( item.defName ) ) then

		junkPriceInfo = { type = UI.junkPriceTypes.NONE }

		if item.tokensEarned > 0 then

			junkPriceInfo.type		= UI.junkPriceTypes.TOKENS
			junkPriceInfo.tokens	= item.tokensEarned

		elseif item.creditsEarned > 0 then

			junkPriceInfo.type		= UI.junkPriceTypes.CREDITS
			junkPriceInfo.credits	= item.creditsEarned

		else
			sys.log( "UI.LootWnd:ShowGainedItem()[ERROR]: cannot find reward type for %s", item.defName )
		end

	end

	self:AddChild( UI.Loot_GainedItemWnd )
	UI.Loot_GainedItemWnd:Setup( item.defName, item.amount, item.bSalvaged, junkPriceInfo, item.bAccountAura )

end


--
function UI.LootWnd:HideSalvageWnd()

	UI.Loot_SalvageWnd:Reset()
	UI.Loot_SalvageWnd:UnlinkFromParent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( UI.Loot_SalvageWnd:GetUiHandle(), "" )
	end	

	if UI.Loot_ByAltPriceWnd and UI.Loot_ByAltPriceWnd.w then
		UI.Loot_ByAltPriceWnd:UnlinkFromParent()
	end

	if UI.Loot_TradeWnd and UI.Loot_TradeWnd.w then
		UI.Loot_TradeWnd:UnlinkFromParent()
	end

end


--
function UI.LootWnd:ShowSalvageWnd( item )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	UI:AddChildAndLink( self, UI.Loot_SalvageWnd, mainEffect, self.effectInfo.main.salvageLocator, UI.EffectAnimParams.POS )

	UI.Loot_SalvageWnd:Setup( item )

end


--
function UI.LootWnd:TryStartScan( scanPointWnd )

	if self:CanScan() and self:CanPointScan( scanPointWnd ) then
		self:SetScanningPoint( scanPointWnd )
	end

end


--
function UI.LootWnd:TryCancelScan()

	if not self.scanningPoint then
		return
	end

	if self.scanningPoint:GetState() ~= UI.Loot_ScanPointWnd.states.SCANNING then
		return		
	end

	self:SetScanningPoint( nil )

end


--
function UI.LootWnd:SetScanningPoint( scanningPoint )

	local oldScanningPoint = self.scanningPoint
	self.scanningPoint  = scanningPoint

	if oldScanningPoint then
		oldScanningPoint:CancelScan()
	end

	if self.scanningPoint then
		self.scanningPoint:StartScan()
		self:UpdateZOrder()
	end

	if self.scanningPoint then
		UI:PlayGlobalSound( self.sounds.scanning, true, false )
	else
		UI:StopGlobalSound( self.sounds.scanning )
	end

	if self:IsOnScreen() then
		self:UpdateMouseOverScanPoint()
	end

end


--
function UI.LootWnd:TryLoot()

	if not self:IsOnScreen() then
		sys.log( "UI.LootWnd:TryLoot()[ERROR]: not on screen" )
		return
	end

	if self.state ~= self.states.SCANNING then
		sys.log( "UI.LootWnd:TryLoot()[ERROR]: not in SCANNING state" )
		return		
	end

	if not self.scanningPoint then
		sys.log( "UI.LootWnd:TryLoot()[ERROR]: no scanning point" )
		return		
	end
	
	local pointType = ai.LootPointType.LPT_COMMON
	if UI:IsWndKindOf( self.scanningPoint, "Loot_SpecScanPointWnd" ) then
		pointType = ai.LootPointType.LPT_SPECIAL
	elseif UI:IsWndKindOf( self.scanningPoint, "Loot_UnlimPveScanPointWnd" ) then
		pointType = ai.LootPointType.LPT_UNLIM_PVE
	elseif UI:IsWndKindOf( self.scanningPoint, "Loot_EventScanPointWnd" ) then
		pointType = ai.LootPointType.LPT_EVENT
	end
	
	_G.CL_ScanForLoot( pointType )

end


--
function UI.LootWnd:OnTimeExpired()

	self:SetState( self.states.STOPPED )

	if self.sounds.stopLoot and self.sounds.stopLoot ~= "" then
		UI:PlayGlobalSound( self.sounds.stopLoot )
	end

end


--
function UI.LootWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI.Loot_SalvageWnd:IsOnScreen() then

		local slotWnd = nil

		if UI:IsWndKindOf( w, "Loot_Salvage_SlotWnd" ) then
			slotWnd = w
		else
    		local parent = w:GetParent()
    		while parent do
        		if UI:IsWndKindOf( parent, "Loot_Salvage_SlotWnd" ) then
        			slotWnd = parent
    				break
        		end
    			parent = parent:GetParent()
    		end
		end

		if slotWnd and not slotWnd:IsDisabled() then
			self:TrySalvage( slotWnd )
		end		

	else

		if w == self then
    		local scanPointUnderMouse = self:GetScanPointByMousePos( self:XToScreen( mouseX ), self:YToScreen( mouseY ), true )
    		self:TryStartScan( scanPointUnderMouse )
		end

	end

	return true	

end


--
function UI.LootWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput ~= self:GetUiHandle() then
		return true
	end

	self:UpdateMouseOverScanPoint()

	local scanPointUnderMouse = self:GetScanPointByMousePos( self:XToScreen( mouseX ), self:YToScreen( mouseY ), true )
	if self.scanningPoint and scanPointUnderMouse ~= self.scanningPoint then
		self:TryCancelScan()
	end	

	return true

end


--
function UI.LootWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.scanningPoint then
		self:TryCancelScan()
	end

	return true	

end



--
function UI.LootWnd:OnEscape()

	self:TryCancelLoot()
	return true

end


--
function UI.LootWnd:TryCancelLoot()

	if self.state ~= self.states.SCANNING then
		return
	end

	if self.hMsgCancelLoot ~= UI.INVALID_UI_HANDLE then
		sys.log( "UI.LootWnd:TryCancelLoot()[ERROR]: message is already on screen" )
		return		
	end

	self.hMsgCancelLoot = UI:MessageBox( UI:GetStringByName( "msgCapt_lootCancel" ), UI:GetStringByName( "msg_lootCancel" ), UI.MBS_YES_NO )

end


--
function UI.LootWnd:DoCancelLoot()

	if self.state ~= self.states.SCANNING then
		sys.log( "UI.LootWnd:DoCancelLoot()[ERROR]: not in SCANNING mode" )
		return
	end

	self:SetState( self.states.STOPPED )	
	_G.CL_EndLooting()

end


--
function UI.LootWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgCancelLoot then
		self.hMsgCancelLoot = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			self:DoCancelLoot()

			if self.sounds.stopLoot and self.sounds.stopLoot ~= "" then
				UI:PlayGlobalSound( self.sounds.stopLoot )
			end

		end

	end

end


--
function UI.LootWnd:GetScanPointByMousePos( mouseX, mouseY, bIgnoreCompleted )

	for idx, scanPointWnd in pairs( self.curScanPoints ) do

		local bFitState = true

		if bIgnoreCompleted then
			local state = scanPointWnd:GetState()
			if state == UI.Loot_ScanPointWnd.states.ITEM or state == UI.Loot_ScanPointWnd.states.EMPTY or state == UI.Loot_ScanPointWnd.states.FAIL then
				bFitState = false
			end
		end

		if bFitState and scanPointWnd:IsPosInInputZone( mouseX, mouseY ) then
			return scanPointWnd
		end

	end

	return nil

end


--
function UI.LootWnd:CanScan()

	return self.state == self.states.SCANNING and not self.scanningPoint

end


--
function UI.LootWnd:CanPointScan( scanPoint )

	return scanPoint ~= nil and scanPoint:GetState() == UI.Loot_ScanPointWnd.states.UNCHECKED

end


--
function UI.LootWnd:HasPointThatCanScan()

	for idx, scanPoint in pairs( self.curScanPoints ) do
		if self:CanPointScan( scanPoint ) then
			return true
		end
	end

	return false

end


--
function UI.LootWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.STOP_LOOT_EFFECT ) then

		if self.state ~= self.states.STOPPED then
			sys.log( "UI.LootWnd:F_OnEffectAnimationEnded()[ERROR]: wrong state: %s", tostring( self.state ) )
		end

		self:ProceedToDebriefing()
	end

end


--
function UI.LootWnd:ProceedToDebriefing()

	self:Hide( false )
	UI.HudWnd:OnEndGame( self.data )

end


--
function UI.LootWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()

	local scanPoints = {}
	for idx, scanPointWnd in pairs( self.curScanPoints ) do

		local info = {}

		info.entId = scanPointWnd:GetEntId()
		
		local state = scanPointWnd:GetState()
		if state == UI.Loot_ScanPointWnd.SCANNING then
			state = UI.Loot_ScanPointWnd.UNCHECKED
		end

		info.state = state

		if UI:IsWndKindOf( scanPointWnd, "Loot_SpecScanPointWnd" ) then
			info.bSpec = true
		elseif UI:IsWndKindOf( scanPointWnd, "Loot_UnlimPveScanPointWnd" ) then
			info.bUnlimPve = true
		elseif UI:IsWndKindOf( scanPointWnd, "Loot_EventScanPointWnd" ) then
			info.bEvent = true
		end

		table.insert( scanPoints, info )

	end

	UI.store.LootWnd =
	{
		data			= self.data,
		maxAttempts		= self.maxAttempts,
		numAttempts		= self.numAttempts,
		maxScanTime		= self.maxScanTime,
		gainedItems		= self.gainedItems,		
		state			= self.state,
		scanPoints		= scanPoints,
		salvageItem		= UI.Loot_SalvageWnd:IsOnScreen() and UI.Loot_SalvageWnd:GetItem(),
	}	

end


--
function UI.LootWnd:F_OnEventRestoreUiState()

	if not UI.store.LootWnd then
		return
	end

	self.data			= UI.store.LootWnd.data
	self.maxAttempts	= UI.store.LootWnd.maxAttempts
	self.numAttempts	= UI.store.LootWnd.numAttempts
	self.maxScanTime	= UI.store.LootWnd.maxScanTime
	self.gainedItems	= UI.store.LootWnd.gainedItems

	self:FullUpdate()

	UI.store.LootWnd = nil

end


--
function UI.LootWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcAbsVals()
	self:RestoreBgAnimTime()

	self:UpdateMouseOverScanPoint()

	-- НЕ вызывается FullUpdate(), в отличие от базовой реализации в UI.FullScreenWnd

end


--
function UI.LootWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then

		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )
		self:HideChildModals()

		UI:StopGlobalSound( self.sounds.scanning )
		UI:OnLootCompleted( self.gainedItems )

	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.LootWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.LootWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	UI.Loot_ByAltPriceWnd:UnlinkFromParent()
	UI.Loot_TradeWnd:UnlinkFromParent()

end


--
function UI.LootWnd:UpdateMouseOverScanPoint()

	local scanPointUnderMouse = self:GetScanPointByMousePos( UI:GetMouseX(), UI:GetMouseY(), true )
	local scanPointMouseOver = nil

	if scanPointUnderMouse then

		local pointState = scanPointUnderMouse:GetState()

		if pointState == UI.Loot_ScanPointWnd.states.SCANNING or pointState == UI.Loot_ScanPointWnd.states.WAITING_FOR_RESULT or ( pointState == UI.Loot_ScanPointWnd.states.UNCHECKED and self.state == self.states.SCANNING ) then
			scanPointMouseOver = scanPointUnderMouse
		end

	end

	for idx, scanPointWnd in pairs( self.curScanPoints ) do
		scanPointWnd:SetMouseOver( scanPointWnd == scanPointMouseOver )
	end

end


--
function UI.LootWnd:TrySalvage( slotWnd )

	local slotType = slotWnd:GetSlotType()

	if slotType == UI.Loot_SalvageWnd.slotTypes.SELL then

    	local item = slotWnd:GetItem()
		self:LaunchSellTradeWnd( item.defName, item.sellRefund )

	else

    	local item							= slotWnd:GetItem()
    	local slotType						= slotWnd:GetSlotType()
    	local priceCredits, priceGold		= slotWnd:GetPrice()
    	local bEnoughCredits, bEnoughGold	= slotWnd:IsEnoughMoney()
    	local refundIridium					= slotType == UI.Loot_SalvageWnd.slotTypes.GOLD and item.salvageGoldRefund or item.salvageRefund

    	local buyData =
    	{
    		slotType		= slotType,
    		priceCredits	= priceCredits,
    		priceGold		= priceGold,
    		playerCredits	= nil,
    		playerGold		= item.playerGold,
    		defName			= item.defName,
    		refundIridium	= refundIridium,
    	}

    	self:LaunchSalvageBuyWnd( UI.BuyAltPriceWnd.modes.SALVAGE, buyData )

	end

end


--
function UI.LootWnd:DoSalvage( slotType )

	local action = -1

	if slotType == UI.Loot_SalvageWnd.slotTypes.FREE then
		action = ai.SalvageOp.SALOP_SALVAGE

	elseif slotType == UI.Loot_SalvageWnd.slotTypes.GOLD then
		action = ai.SalvageOp.SALOP_PREM_SALVAGE

	elseif slotType == UI.Loot_SalvageWnd.slotTypes.SELL then
		action = ai.SalvageOp.SALOP_SELL

	else
		sys.log( "UI.LootWnd:DoSalvage()[ERROR]: invalid salvage slotType: %s", tostring( slotType ) )
	end

	if not action then
		action = -1
	end

	if action ~= -1 then
		_G.CL_LootSalvage( action )
	else
		sys.log( "UI.LootWnd:DoSalvage()[ERROR]: invalid action for slot type %s", tostring( slotType ) )
	end

end


--
function UI.LootWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.LootWnd:UpdateZOrder()

	if UI.Loot_SalvageWnd and UI.Loot_SalvageWnd.w and UI.Loot_SalvageWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Loot_SalvageWnd )
	end

	if self.scanningPoint and self.scanningPoint:IsChildOf( self ) and self.scanningPoint:GetState() == UI.Loot_ScanPointWnd.states.SCANNING then
		self:MoveChildToLastPosition( self.scanningPoint )
	end

end


--
function UI.LootWnd:LaunchSalvageBuyWnd( buyMode, buyData ) 

	UI.Loot_ByAltPriceWnd:Setup( buyMode, true, buyData, false )
	UI.Loot_ByAltPriceWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.LootWnd:LaunchSellTradeWnd( defName, sellPrice )

	local invItem = UI:CreateInvItem( UI.invItemTypes.MODULE, defName, nil, 1, nil, nil, nil )

	UI.Loot_TradeWnd:SetupForSell( invItem, sellPrice )
	UI.Loot_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


-- ------------------------------------------------------------------------------
-- UI.Loot_ScanPointWnd
-- ------------------------------------------------------------------------------

UI.Loot_ScanPointWnd = {}
local lsp = UI.Loot_ScanPointWnd

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Loot_ScanPointWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Loot_ScanPointWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		rect		= Quat( 0, 0, 500, 500 ),
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
				defName 			= "loot_scanPoint_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "loot_point",
						layer		= "UI.Loot_ScanPointWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loot_name",
						layer		= "UI.Loot_ScanPointWnd.layers.SCAN_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "scan_prog",
						layer		= "UI.Loot_ScanPointWnd.layers.SCAN_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "scan_msg",
						layer		= "UI.Loot_ScanPointWnd.layers.RESULT_MSG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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
				defName 			= "loot_scanPoint_ico",

				links =
				{
					{
						objName		= "over",
						layer		= "UI.Loot_ScanPointWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "loot_scanPoint_mouseOver",
				defaultAnimation	= "idle",
			}}
		},

    	-- SCAN_LABEL
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
			text 			= "^loot_scanning",
    	}, 

		-- SCAN_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "loot_scanPoint_scanPb",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text2",
						layer		= "UI.Loot_ScanPointWnd.layers.SCAN_TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- SCAN_TIMER
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

		-- RESULT_MSG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName		= "loot_scanPoint_resultMsg",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.Loot_ScanPointWnd.layers.RESULT_MSG_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- RESULT_MSG_TEXT
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 
	}
}

-- -----------------------------------------
-- interface functions
-- -----------------------------------------

-- позиция - в сиcтеме координат родительского окна
function UI.Loot_ScanPointWnd:Setup( idx, entId, state, maxScanTime )

	self:Reset()

	self.idx			= idx
	self.maxScanTime	= maxScanTime
	self.entId			= entId

	self:SetState( state, false )

end


--
function UI.Loot_ScanPointWnd:Reset()

	self.idx			= -1
	self.maxScanTime	= 0
	self.entId			= -1
	self.state			= -1

	self:SetState( self.states.UNCHECKED, false )
	self:SetMouseOver( false )

end


--
function UI.Loot_ScanPointWnd:GetState()

	return self.state

end


--
function UI.Loot_ScanPointWnd:GetEntId()

	return self.entId

end


-- координаты мыши - в системе координат экана
function UI.Loot_ScanPointWnd:IsPosInInputZone( mouseX, mouseY )

	return UI:IsPtInRect( self.inputRect, mouseX, mouseY )

end


--
function UI.Loot_ScanPointWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.LootWnd.sounds.scanPointMouseOver )
	end

end


--
function UI.Loot_ScanPointWnd:OnScanResult( result, defName )

	if self.state ~= self.states.WAITING_FOR_RESULT then
		sys.log( "UI.Loot_ScanPointWnd:OnScanResult()[ERROR]: wrong state: %s", tostring( self.state ) )
	end

	local newState = self.state

	if result == ai.LootScanResult.LSR_SPACE_JUNK or result == ai.LootScanResult.LSR_ITEM or result == ai.LootScanResult.LSR_ACCOUNT_AURA then
		self:SetState( self.states.ITEM, true )

	elseif result == ai.LootScanResult.LSR_NOTHING_FOUND then
		self:SetState( self.states.EMPTY, true )

	else
		self:SetState( self.states.FAIL, true )
	end

end


--
function UI.Loot_ScanPointWnd:CancelScan()

	if self.state == self.states.SCANNING then
		self:SetState( self.states.UNCHECKED, true )
	end

end


--
function UI.Loot_ScanPointWnd:StartScan()

	if self.state ~= self.states.UNCHECKED then
		sys.log( "UI.Loot_ScanPointWnd:StartScan()[ERROR]: wrong state: %s", tostring( self.state ) )
	end

	self:SetState( self.states.SCANNING, true )

end


--
function UI.Loot_ScanPointWnd:OnStopLoot()

	if self.state == self.states.UNCHECKED or self.state == self.states.SCANNING then
		self:SetState( self.states.FAIL, true )
	end

end


-- -----------------------------------------
-- const
-- -----------------------------------------

lsp.layers =
{
    MAIN_EFFECT				= 0,
    ICO_EFFECT				= 1,
    MOUSE_OVER_EFFECT		= 2,
    SCAN_LABEL				= 3,
    SCAN_PB_EFFECT			= 4,
    SCAN_TIMER				= 5,
    RESULT_MSG_EFFECT		= 6,
    RESULT_MSG_TEXT			= 7,
}

lsp.states =
{
	UNCHECKED			= 1,
	SCANNING			= 2,
	WAITING_FOR_RESULT	= 3,
	ITEM				= 4,
	EMPTY				= 5,
	FAIL				= 6,
}

lsp.effectInfo =
{
	ico =
	{
		animUnchecked	= "idle",
		animScanning	= "scanning",
		animItem		= "loot_true",
		animEmpty		= "loot_false",
		animShowItem	= "loot_true_show",
		animShowEmpty	= "loot_false_show",

		orgLocator		= "center",
	},

	resultMsg =
	{
		animItem	= "true",
		animEmpty	= "false",
	}
}

-- -----------------------------------------
-- vars
-- -----------------------------------------

lsp.state		= -1
lsp.scanTimer	= -1
lsp.maxScanTime	= 0
lsp.inputRect	= Quat( 0, 0, 0, 0 )	-- в экранных координатах
lsp.entId		= -1
lsp.idx			= -1

-- -----------------------------------------
-- work functions
-- -----------------------------------------

--
function UI.Loot_ScanPointWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.inputRect	= Quat( 0, 0, 0, 0 )
	self.worldPos	= Vec3( 0, 0, 0 )

	self:Reset()

end


--
function UI.Loot_ScanPointWnd:UpdatePos()

	local ent = _G.Entities[ self.entId ]
	if not ent then
		sys.log( "UI.Loot_ScanPointWnd:UpdatePos()[ERROR]: cannot find entity with id %d", self.entId )
		return
	end

	local worldPos = UI:Vec3( _G.GetEntityPos3( ent ) )
	local screenPos_abs = UI:Vec3( _G.ProjectPointToScreen( worldPos ) )

	if screenPos_abs.z <= 0 or screenPos_abs.x < 0 or screenPos_abs.x > UI.screenWidth or screenPos_abs.y < 0 or screenPos_abs.y > UI.screenHeight then

		sys.log( "UI.Loot_ScanPointWnd:UpdatePos()[ERROR]: position of entity \"%s\" is out of screen", ent:GetName() )

		screenPos_abs.x = 50
		screenPos_abs.y = 50 + ( self.idx - 1 ) * 70

	end		

	local screenPos_rel = UI:PtToRel( screenPos_abs )
	self:SetPosRel( screenPos_rel )

end


--
function UI.Loot_ScanPointWnd:SetPosRel( screenPos_rel )

	local parent = self:GetParent()
	local pos = Vec2( parent:XToWindow( screenPos_rel.x ), parent:YToWindow( screenPos_rel.y ) )

	local icoEffectPos	= UI:ZeroVec2()
	local icoEffectSize	= UI:ZeroVec2()
	local orgPos		= UI:ZeroVec2()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then

		icoEffectPos	= icoEffect:GetPos()
		icoEffectSize	= icoEffect:GetObjSize( "self" )
		orgPos			= icoEffect:GetObjPos( self.effectInfo.ico.orgLocator )		

	end

	pos.x = pos.x - ( icoEffectPos.x + orgPos.x )
	pos.y = pos.y - ( icoEffectPos.y + orgPos.y )

	local rect = self:GetRect()
	rect.x = pos.x
	rect.y = pos.y
	self:SetRect( rect )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.Loot_ScanPointWnd:SetState( state, bAnimated )

	if UI:Val2Key( self.states, state ) == "" then
		sys.log( "UI.Loot_ScanPointWnd:SetState()[ERROR]: invalid state: %s", tostring( state ) )
		return
	end

	if state == self.state then
		return
	end

	self.state = state

	self.scanTimer = self.state == self.states.SCANNING and self.maxScanTime or -1

	self:UpdateIcoAnimation( bAnimated )
	self:UpdateScanVisibility()
	self:UpdateResultMsg()

end


--
function UI.Loot_ScanPointWnd:UpdateIcoAnimation( bAnimated )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end	

	local anim = ""

	if self.state == self.states.UNCHECKED then
		anim = self.effectInfo.ico.animUnchecked

	elseif self.state == self.states.SCANNING then
		anim = self.effectInfo.ico.animScanning

	elseif self.state == self.states.WAITING_FOR_RESULT then
		anim = self.effectInfo.ico.animScanning

	elseif self.state == self.states.ITEM then
		anim = bAnimated and self.effectInfo.ico.animShowItem or self.effectInfo.ico.animItem

	elseif self.state == self.states.EMPTY then
		anim = bAnimated and self.effectInfo.ico.animShowEmpty or self.effectInfo.ico.animEmpty

	elseif self.state == self.states.FAIL then
		anim = self.effectInfo.ico.animUnchecked
	end

	if anim ~= icoEffect:GetCurAnimation() then
		icoEffect:StartAnimation( anim )
	end

end


--
function UI.Loot_ScanPointWnd:UpdateScanVisibility()

	local bNeedScanControls = self.state == self.states.SCANNING or self.state == self.states.WAITING_FOR_RESULT

	if bNeedScanControls then

		self:SetLayerVisible( true, self.layers.SCAN_LABEL )
		self:SetLayerVisible( true, self.layers.SCAN_PB_EFFECT )
		self:SetLayerVisible( true, self.layers.SCAN_TIMER )

		self:UpdateScanProgress()

	else

		self:SetLayerVisible( false, self.layers.SCAN_LABEL )
		self:SetLayerVisible( false, self.layers.SCAN_PB_EFFECT )
		self:SetLayerVisible( false, self.layers.SCAN_TIMER )

	end

end


--
function UI.Loot_ScanPointWnd:UpdateScanProgress()

	self:UpdateScanTimerText()
	self:UpdateScanPb()

end


--
function UI.Loot_ScanPointWnd:UpdateScanTimerText()

	local str = ""
	local val = -1

	if self.state == self.states.SCANNING then
		val = self.scanTimer

	elseif self.state == self.states.WAITING_FOR_RESULT then
		val = 0
	end

	if val ~= -1 then
		str = string.format( "%0.02f", val )
	end

	self:SetText( str, self.layers.SCAN_TIMER )

end


--
function UI.Loot_ScanPointWnd:UpdateScanPb()

	local pbEffect = UI:GetEffectFromLayer( self, self.layers.SCAN_PB_EFFECT )
	if not pbEffect then
		return
	end

	local animTime = 0

	if self.state == self.states.SCANNING then
		animTime = 1 - self.scanTimer / self.maxScanTime

	elseif self.state == self.states.WAITING_FOR_RESULT then
		animTime = 1
	end

	pbEffect:SetAnimationTime( animTime )
	pbEffect:Update( 0 )

end


--
function UI.Loot_ScanPointWnd:UpdateResultMsg()

	if self.state == self.states.ITEM or self.state == self.states.EMPTY then

		self:SetLayerVisible( true, self.layers.RESULT_MSG_EFFECT )
		self:SetLayerVisible( true, self.layers.RESULT_MSG_TEXT )

    	local str = ""
		local anim = ""

    	if self.state == self.states.ITEM then
    		str = UI:GetStringByName( "loot_scanResultItem" )
			anim = self.effectInfo.resultMsg.animItem

    	elseif self.state == self.states.EMPTY then
    		str = UI:GetStringByName( "loot_scanResultEmpty" )
			anim = self.effectInfo.resultMsg.animEmpty
    	end

		self:SetText( str, self.layers.RESULT_MSG_TEXT )

		local msgEffect = UI:GetEffectFromLayer( self, self.layers.RESULT_MSG_EFFECT )
		if msgEffect then
			msgEffect:StartAnimation( anim )
		end

	else

		self:SetLayerVisible( false, self.layers.RESULT_MSG_EFFECT )
		self:SetLayerVisible( false, self.layers.RESULT_MSG_TEXT )

	end

end


--
function UI.Loot_ScanPointWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT ) then

		if animName == self.effectInfo.animShowItem then
			effect:StartAnimation( self.effectInfo.animItem )

		elseif animName == self.effectInfo.animShowEmpty then
			effect:StartAnimation( self.effectInfo.animEmpty )
		end

	elseif effect == UI:GetEffectFromLayer( self, self.layers.RESULT_MSG_EFFECT ) then

		self:SetLayerVisible( false, self.layers.RESULT_MSG_EFFECT )
		self:SetLayerVisible( false, self.layers.RESULT_MSG_TEXT )

	end

end


--
function UI.Loot_ScanPointWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateInputRect()
	end

end


--
function UI.Loot_ScanPointWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateInputRect()

end


--
function UI.Loot_ScanPointWnd:UpdateInputRect()

	local icoEffectPos	= UI:ZeroVec2()
	local icoEffectSize	= UI:ZeroVec2()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffectPos	= icoEffect:GetPos()
		icoEffectSize	= icoEffect:GetObjSize( "self" )
	end

	local selfRect = self:GetRect()	

	self.inputRect.x = selfRect.x + icoEffectPos.x
	self.inputRect.y = selfRect.y + icoEffectPos.y
	self.inputRect.z = icoEffectSize.x
	self.inputRect.w = icoEffectSize.y

	local parent = self:GetParent()
	if parent then
		self.inputRect.x = parent:XToScreen( self.inputRect.x )
		self.inputRect.y = parent:YToScreen( self.inputRect.y )		
	end

end


--
function UI.Loot_ScanPointWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdatePos()

	if self.state == self.states.SCANNING then
		self:UpdateScanTimer( dt_sys )
	end

end


--
function UI.Loot_ScanPointWnd:UpdateScanTimer( dt )

	if self.state ~= self.states.SCANNING then
		return
	end

	self.scanTimer = self.scanTimer - dt
	if self.scanTimer <= 0 then

		self.scanTimer = -1

		self:SetState( self.states.WAITING_FOR_RESULT )
		UI.LootWnd:OnStopScan( self )

	else
		self:UpdateScanProgress()
	end

end


-- ------------------------------------------------------------------------------
-- UI.Loot_SpecScanPointWnd
-- ------------------------------------------------------------------------------

UI.Loot_SpecScanPointWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Loot_SpecScanPointWnd.def =
{
	className	= "Wnd",
	prototype	= "Loot_ScanPointWnd",

	props =
	{
		name		= "Loot_SpecScanPointWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- ICO_EFFECT
		{
			id			= UI.Loot_ScanPointWnd.layers.ICO_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "loot_specScanPoint_ico",

				links =
				{
					{
						objName		= "over",
						layer		= "UI.Loot_ScanPointWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	}
}


-- ------------------------------------------------------------------------------
-- UI.Loot_UnlimPveScanPointWnd
-- ------------------------------------------------------------------------------

UI.Loot_UnlimPveScanPointWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Loot_UnlimPveScanPointWnd.def =
{
	className	= "Wnd",
	prototype	= "Loot_ScanPointWnd",

	props =
	{
		name		= "Loot_UnlimPveScanPointWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- ICO_EFFECT
		{
			id			= UI.Loot_ScanPointWnd.layers.ICO_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "loot_unlimPveScanPoint_ico",

				links =
				{
					{
						objName		= "over",
						layer		= "UI.Loot_ScanPointWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	}
}


-- ------------------------------------------------------------------------------
-- UI.Loot_EventScanPointWnd
-- ------------------------------------------------------------------------------

UI.Loot_EventScanPointWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.Loot_EventScanPointWnd.def =
{
	className	= "Wnd",
	prototype	= "Loot_ScanPointWnd",

	props =
	{
		name		= "Loot_EventScanPointWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- ICO_EFFECT
		{
			id			= UI.Loot_ScanPointWnd.layers.ICO_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "loot_scanPoint_ico",	-- #0106956(0506930) - нет отличаются визуально от обычных точек, такой же эффект

				links =
				{
					{
						objName		= "over",
						layer		= "UI.Loot_ScanPointWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	}
}


-- ---------------------------------------------------------------------------------------
-- UI.Loot_GainedItemWnd
-- ---------------------------------------------------------------------------------------

UI.Loot_GainedItemWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "LootNotifyWnd",

		props =
		{
			name	= "Loot_GainedItemWnd"
		}		
	}
}

-- ----------------------------------------------------------------------
-- UI.Loot_SalvageWnd
-- ----------------------------------------------------------------------

UI.Loot_SalvageWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Loot_SalvageWnd.def =
{
	className	= "Wnd",

	props = 
	{
		name	= "Loot_SalvageWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "salvage_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.Loot_SalvageWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "loot_module",
						layer		= "UI.Loot_SalvageWnd.layers.INFO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.Loot_Salvage_GoldSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.Loot_Salvage_FreeSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_3",
						wnd			= "UI.Loot_Salvage_SellSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
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
			text 			= UI:GetStringByName( "loot_salvageCaption" ),
    	}, 

		-- INFO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "salvage_info",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "icon",
						wnd			= "UI.Loot_Salvage_ItemIcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по цвету
					{
						objName		= "loot_name",
						layer		= "UI.Loot_SalvageWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

    	-- ITEM_NAME
    	{
   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 2, 1 },
   			formatFlags		= FONT.TF_WORDBREAK,
   			font			= { fontName = "Small" },
    	},
	},

	children = { "UI.Loot_Salvage_ItemIcoWnd", "UI.Loot_Salvage_FreeSlotWnd", "UI.Loot_Salvage_GoldSlotWnd", "UI.Loot_Salvage_SellSlotWnd" }
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Loot_SalvageWnd:Setup( item )

	self:Reset()

	self.item = item

	self:FullUpdate()

end


--
function UI.Loot_SalvageWnd:GetItem()

	return self.item

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Loot_SalvageWnd.slotTypes =
{
	GOLD	= 1,
	FREE	= 2,
	SELL	= 3,
}

UI.Loot_SalvageWnd.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
    INFO_EFFECT		= 2,
    ITEM_NAME		= 3,
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Loot_SalvageWnd.item					= nil
UI.Loot_SalvageWnd.freeSlotWnd			= nil
UI.Loot_SalvageWnd.goldSlotWnd			= nil
UI.Loot_SalvageWnd.sellSlotWnd			= nil
UI.Loot_SalvageWnd.itemIcoWnd			= nil
UI.Loot_SalvageWnd.slots				= {}

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Loot_SalvageWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.freeSlotWnd	= UI.Loot_Salvage_FreeSlotWnd
	self.goldSlotWnd	= UI.Loot_Salvage_GoldSlotWnd
	self.sellSlotWnd	= UI.Loot_Salvage_SellSlotWnd

	self.slots[ self.slotTypes.GOLD ]	= self.goldSlotWnd
	self.slots[ self.slotTypes.FREE ]	= self.freeSlotWnd
	self.slots[ self.slotTypes.SELL ]	= self.sellSlotWnd

	self.itemIcoWnd		= UI.Loot_Salvage_ItemIcoWnd

end


--
function UI.Loot_SalvageWnd:Reset()

	self.item = nil

	self:SetText( "", self.layers.ITEM_NAME )

	self.freeSlotWnd:Reset()
	self.goldSlotWnd:Reset()	
	self.sellSlotWnd:Reset()	

	self.itemIcoWnd:Reset()

end


--
function UI.Loot_SalvageWnd:FullUpdate()

	self:UpdateItemIco()
	self:UpdateItemName()
	self:UpdateSlots()

end


--
function UI.Loot_SalvageWnd:UpdateItemIco()

	self.itemIcoWnd:SetupForItem( self.item.defName )
	
	local tooltipData = UI:GetTooltipForItem( self.item.defName )
	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Loot_SalvageWnd:UpdateItemName()

	local name = UI:GetEntityLocalizedNameByDef( self.item.defName, false )
	self:SetText( name, self.layers.ITEM_NAME )

	local color = UI:GetItemColor( self.item.defName )
	self:SetColor( color, self.layers.ITEM_NAME )

end


--
function UI.Loot_SalvageWnd:UpdateSlots()

	self.freeSlotWnd:Setup( self.item )
	self.goldSlotWnd:Setup( self.item )
	self.sellSlotWnd:Setup( self.item )

end


--
function UI.Loot_SalvageWnd:GetSlotByType( slotType )

	return self.slots[ slotType ]

end


-- ----------------------------------------------------------------------
-- UI.Loot_Salvage_ItemIcoWnd
-- ----------------------------------------------------------------------

UI.Loot_Salvage_ItemIcoWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ItemIcoWnd",

		props = 
		{
			name	= "Loot_Salvage_ItemIcoWnd"
		}
	}
}

-- ----------------------------------------------------------------------
-- UI.Loot_Salvage_SlotWnd
-- ----------------------------------------------------------------------

UI.Loot_Salvage_SlotWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

--
UI.Loot_Salvage_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	GOLD_FRAME_EFFECT	= 1,
    DESC				= 2,
    PRICE				= 3,
    MOUSE_OVER_EFFECT	= 4,
	INACTIVE_EFFECT		= 5,
}

--
UI.Loot_Salvage_SlotWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "Loot_Salvage_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.Loot_Salvage_SlotWnd.layers.INACTIVE_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "salvage_slot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "gold",
						layer		= "UI.Loot_Salvage_SlotWnd.layers.GOLD_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "t_2",
						layer		= "UI.Loot_Salvage_SlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price",
						layer		= "UI.Loot_Salvage_SlotWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.Loot_Salvage_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.Loot_Salvage_SlotWnd.layers.INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- GOLD_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "salvage_slot_goldFrame",
				defaultAnimation	= "idle",
			}}
		},

    	-- DESC
    	{
   			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 2, 1 },
   			formatFlags		= FONT.TF_WORDBREAK,
   			font			= { fontName = "Small" },
    	}, 

    	-- PRICE
    	{
   			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },
    	}, 

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "salvage_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},

		-- INACTIVE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "salvage_slot_inactive",
				defaultAnimation	= "idle",
			}}
		},       
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Loot_Salvage_SlotWnd:Setup( item )

	self:Reset()

	self.item = item

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.GOLD then
		self:UpdatePrice()
		self:UpdateDisabledState()
	end

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.SELL then
		self:UpdadteItemIco()
	else	
		self:UpdateRefund()
	end

	self:UpdateDesc()

end


--
function UI.Loot_Salvage_SlotWnd:Reset()

	self.item = nil

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.GOLD then
		self.priceMetaText:SetText( "", true )	
	end

	self.bDisabled = false
	self:SetLayerVisible( false, self.layers.INACTIVE_EFFECT )

	self.itemIcoWnd:Reset()
	self:RemoveControl( self.refundIcoWnd, self.layers.MAIN_EFFECT )

	self.refundIcoWnd:Reset()
	self:RemoveControl( self.refundIcoWnd, self.layers.MAIN_EFFECT )

	self:SetText( "", self.layers.DESC )

end


--
function UI.Loot_Salvage_SlotWnd:GetSlotType()

	return self.slotType

end


--
function UI.Loot_Salvage_SlotWnd:IsDisabled()

	return self.bDisabled

end


--
function UI.Loot_Salvage_SlotWnd:GetItem()

	return self.item

end


--
function UI.Loot_Salvage_SlotWnd:GetPrice()

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.GOLD then
		return 0, self.item.salvagePrice
	else
		return 0, 0
	end

end


-- если цены в какой-то валюте нет, то возвращает false для этой валюты;
-- если бесплатно, то возвращает true для любой валюты

function UI.Loot_Salvage_SlotWnd:IsEnoughMoney()

	local bEnoughCredits	= true
	local bEnoughGold		= true

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.GOLD then

		if self.item.salvagePrice > 0 then
			bEnoughGold = not self.item.salvagePremiumCantAfford
		end

		bEnoughCredits = false

	end

	return bEnoughCredits, bEnoughGold

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Loot_Salvage_SlotWnd.effectInfo =
{
	main =
	{
		itemIcoLocator		= "icon",
		refundIcoLocator	= "uniq_icon",
	},

	refund =
	{
		animGold	= "gold",
		animFree	= "idle",
	}
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Loot_Salvage_SlotWnd.slotType			= -1
UI.Loot_Salvage_SlotWnd.priceMetaText		= nil
UI.Loot_Salvage_SlotWnd.descMetaText		= nil
UI.Loot_Salvage_SlotWnd.item				= nil
UI.Loot_Salvage_SlotWnd.itemIcoWnd			= nil
UI.Loot_Salvage_SlotWnd.bDisabled			= false
UI.Loot_Salvage_SlotWnd.refundIcoWnd		= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Loot_Salvage_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

	self.descMetaText = UI.MetaText.GetNewInstance()
	self.descMetaText:InitFromLayer( self, self.layers.DESC ) 

	self:CreateControls()

	self:InitForSlotType()

end


--
function UI.Loot_Salvage_SlotWnd:F_Shutdown()

	if not self:IsPrototype() then
		self.priceMetaText:Clear()
		self.descMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Loot_Salvage_SlotWnd:InitForSlotType()

	self:UpdateGoldFrame()

	if self.slotType ~= UI.Loot_SalvageWnd.slotTypes.GOLD then
		self:UpdatePrice()
	end

end


--
function UI.Loot_Salvage_SlotWnd:CreateControls()

	self.refundIcoWnd	= UI:CreateChildWnd( self, UI.Salvage_Slot_TokensIcoWnd, "" )
	self.itemIcoWnd		= UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )

end


--
function UI.Loot_Salvage_SlotWnd:UpdateDesc()

	local str = ""

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.GOLD then
		str = UI:GetStringByName( "salvage_desc_GOLD" )

	elseif self.slotType == UI.Loot_SalvageWnd.slotTypes.FREE then
		str = UI:GetStringByName( "salvage_desc_FREE" )

	elseif self.slotType == UI.Loot_SalvageWnd.slotTypes.SELL then

		str = UI:GetStringByName( "shop_sell" )

		local priceInfo = {}
		priceInfo.priceType		= _G.GameStore.CreditsType.CT_CREDITS
    	priceInfo.val			= self.item.sellRefund
    	priceInfo.bIsBuyPrice	= false

		local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.DESC ), nil, nil, true, nil )
		str = string.format( "%s|(%s)", str, strPrice )        

	else
		sys.log( "UI.Loot_Salvage_SlotWnd:UpdateDesc()[ERROR]: unhandled slotType: %s", tostring( self.slotType ) )
	end

	self.descMetaText:SetText( str, true )

end


--
function UI.Loot_Salvage_SlotWnd:UpdateGoldFrame()

	self:SetLayerVisible( self.slotType == UI.Loot_SalvageWnd.slotTypes.GOLD, self.layers.GOLD_FRAME_EFFECT )

end


--
function UI.Loot_Salvage_SlotWnd:UpdatePrice()

	local priceCredits, priceGold		= self:GetPrice()
	local bEnoughCredits, bEnoughGold	= self:IsEnoughMoney()

	-- #0035263, комм.(0132360) - если две цены, то рисуется только в серебре;

	if priceCredits > 0 and priceGold > 0 then
		priceGold		= 0
		bEnoughCredits	= bEnoughCredits or bEnoughGold
	end

	local str = ""

	if priceCredits > 0 or priceGold > 0 then

    	if priceCredits > 0 then

			sys.log( "UI.Loot_Salvage_SlotWnd:UpdatePrice()[ERROR]: not supposed credits prices; playerCredits value is invalid" )

    		local priceInfo = {}

    		priceInfo.priceType 	= _G.GameStore.CreditsType.CT_CREDITS
    		priceInfo.val			= priceCredits
    		priceInfo.bIsBuyPrice	= true
    		priceInfo.basePrice		= priceCredits

    		str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, self.item.playerCredits )

    	elseif priceGold > 0 then

    		local priceInfo = {}

    		priceInfo.priceType 	= _G.GameStore.CreditsType.CT_GOLD
    		priceInfo.val			= priceGold
    		priceInfo.bIsBuyPrice	= true
    		priceInfo.basePrice		= priceGold

    		str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, self.item.playerGold )

    	end

	else
		str = UI:GetStringByName( "priceFree" )
	end

	self.priceMetaText:SetText( str, true )

end


--
function UI.Loot_Salvage_SlotWnd:UpdadteItemIco()

	if self.slotType ~= UI.Loot_SalvageWnd.slotTypes.SELL then
		sys.log( "UI.Loot_Salvage_SlotWnd:UpdadteItemIco()[ERROR]: wrong slotType" )
		return
	end

	self:AddControl( self.itemIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.itemIcoLocator )

	self.itemIcoWnd:SetupForItem( self.item.defName )

	local tooltipData = UI:GetTooltipForItem( self.item.defName )
	self.itemIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.Loot_Salvage_SlotWnd:UpdateRefund()

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.SELL then
		sys.log( "UI.Loot_Salvage_SlotWnd:UpdateRefundVal()[ERROR]: wrong slotType" )
		return
	end

	local refundVal		= 0
	local refundIcoMode	= -1

	if self.slotType == UI.Loot_SalvageWnd.slotTypes.GOLD then
		refundVal		= self.item.salvageGoldRefund
		refundIcoMode	= UI.Salvage_Slot_TokensIcoWnd.modes.GOLD

	elseif self.slotType == UI.Loot_SalvageWnd.slotTypes.FREE then
		refundVal		= self.item.salvageRefund
		refundIcoMode	= UI.Salvage_Slot_TokensIcoWnd.modes.FREE

	else
		sys.log( "UI.Loot_Salvage_SlotWnd:UpdateRefundVal()[ERROR]: unhandled slotType: %s", tostring( self.slotType ) )
	end

	self:AddControl( self.refundIcoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.refundIcoLocator )
	self.refundIcoWnd:Setup( refundIcoMode, refundVal )

end


--
function UI.Loot_Salvage_SlotWnd:UpdateDisabledState()

	local bEnoughCredits, bEnoughGold = self:IsEnoughMoney()
	self.bDisabled = not bEnoughCredits and not bEnoughGold

	self:SetLayerVisible( self.bDisabled, self.layers.INACTIVE_EFFECT )

	self:UpdateMouseOver()

end


--
function UI.Loot_Salvage_SlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if not self.bDisabled then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse and wndUnderMouse == self or wndUnderMouse:IsChildOf( self )
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Loot_Salvage_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.LootWnd.sounds.salvageSlotMouseOver )
	end

end


--
function UI.Loot_Salvage_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Loot_Salvage_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


--
function UI.Loot_Salvage_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()
	self:UpdateMouseOver()
	self:UpdateMetaTextPos()

end


--
function UI.Loot_Salvage_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Loot_Salvage_SlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )
	self.descMetaText:UpdateScreenOrgFromLayer( self, self.layers.DESC )

end


--
function UI.Loot_Salvage_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.DESC then
		self.descMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Loot_Salvage_SlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.Loot_Salvage_SlotWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

end


--
function UI.Loot_Salvage_SlotWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end    


-- --------------------------------------------------------------------------------------------
-- UI.Loot_Salvage_FreeSlotWnd, UI.Loot_Salvage_GoldSlotWnd, UI.Loot_Salvage_SellSlotWnd
-- --------------------------------------------------------------------------------------------

--
UI.Loot_Salvage_FreeSlotWnd =
{
	def =	
    {
    	className	= "Wnd",
    	prototype	= "Loot_Salvage_SlotWnd",

    	props =
    	{
    		name	= "Loot_Salvage_FreeSlotWnd"
    	}
    },

	slotType = UI.Loot_SalvageWnd.slotTypes.FREE
}


--
UI.Loot_Salvage_GoldSlotWnd =
{
	def =	
    {
    	className	= "Wnd",
    	prototype	= "Loot_Salvage_SlotWnd",

    	props =
    	{
    		name	= "Loot_Salvage_GoldSlotWnd"
    	}
    },

	slotType = UI.Loot_SalvageWnd.slotTypes.GOLD
}


--
UI.Loot_Salvage_SellSlotWnd =
{
	def =	
    {
    	className	= "Wnd",
    	prototype	= "Loot_Salvage_SlotWnd",

    	props =
    	{
    		name	= "Loot_Salvage_SellSlotWnd"
    	}
    },

	slotType = UI.Loot_SalvageWnd.slotTypes.SELL
}

-- -------------------------------------------------------------------
-- UI.Loot_ByAltPriceWnd
-- -------------------------------------------------------------------

UI.Loot_ByAltPriceWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyAltPriceWnd",

    	props =
    	{
    		name	= "Loot_ByAltPriceWnd",
    	},
	},

	mainWndName = "LootWnd",
}

-- -------------------------------------------------------------------
-- UI.Loot_TradeWnd
-- -------------------------------------------------------------------

UI.Loot_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "Loot_TradeWnd",
    	},
	},

	mainWndName = "LootWnd",
}