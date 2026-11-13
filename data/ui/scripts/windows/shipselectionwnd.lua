-- ----------------------------------------------------------------------------
--
-- Workfile: shipselectionwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.ShipSelectionWnd = {}
local ss = UI.ShipSelectionWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipSelectionWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "ShipSelectionWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipSelection_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "ship_change",
						wnd			= "UI.ShipSelection_ShipsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_change3",
						wnd			= "UI.ShipSelection_ShipsBigListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "warning",
						layer		= "UI.ShipSelectionWnd.layers.STATUS_TEXT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.ShipSelectionWnd.layers.TIMER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_left",
						wnd			= "UI.ShipSelection_SpectateBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modules",
						wnd			= "UI.ShipSelection_ModulesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "choise_ship",
						layer		= "UI.ShipSelectionWnd.layers.CHOOSE_SHIP_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_1",
						layer		= "UI.ShipSelectionWnd.layers.GAMEPLAY_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",
						layer		= "UI.ShipSelectionWnd.layers.GAMEPLAY_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "capitan_msg",
						layer		= "UI.ShipSelectionWnd.layers.SENTINEL_LEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_3",
						layer		= "UI.ShipSelectionWnd.layers.CHOOSE_SHIP_2_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_4",
						layer		= "UI.ShipSelectionWnd.layers.SENTINEL_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "pve_msg",
						layer		= "UI.ShipSelectionWnd.layers.PVE_MISSION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_7",
						layer		= "UI.ShipSelectionWnd.layers.BALANCE",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "drop_down",
						wnd			= "UI.ShipSelection_UnlimPveMissionLevelCb",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "text_6",
						layer		= "UI.ShipSelectionWnd.layers.UNLIM_PVE_MISSION_LEVEL_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "text_5",
						layer		= "UI.ShipSelectionWnd.layers.UNLIM_PVE_MISSION_MIN_LEVEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "help_btn",
						wnd			= "UI.ShipSelection_UnlimPveMissionLevelInfoIco",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- no use, just legacy from FullScreenWnd
		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- STATUS_TEXT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipSelection_statusText",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ShipSelectionWnd.layers.STATUS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- STATUS_TEXT
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- BALANCE
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
			text = UI:GetStringByName( "shipSelection_balance" ),
		},

		-- TIMER_TEXT
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
						objName		= "value1",
						layer		= "UI.ShipSelectionWnd.layers.TIMER_TEXT1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value2",
						layer		= "UI.ShipSelectionWnd.layers.TIMER_TEXT2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value3",
						layer		= "UI.ShipSelectionWnd.layers.TIMER_TEXT3",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value4",
						layer		= "UI.ShipSelectionWnd.layers.TIMER_TEXT4",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value5",
						layer		= "UI.ShipSelectionWnd.layers.TIMER_TEXT5",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIMER_TEXT1
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- TIMER_TEXT2
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- TIMER_TEXT3
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- TIMER_TEXT4
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- TIMER_TEXT5
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- CHOOSE_SHIP_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipSelection_chooseShip",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value1",
						layer		= "UI.ShipSelectionWnd.layers.CHOOSE_SHIP_1_TEXT_OUTL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "value2",
						layer		= "UI.ShipSelectionWnd.layers.CHOOSE_SHIP_1_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CHOOSE_SHIP_1_TEXT_OUTL
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- CHOOSE_SHIP_1_TEXT
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- CHOOSE_SHIP_2_TEXT
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- SENTINEL_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^shipSelection_sentinelDesc"
		},

		-- GAMEPLAY_NAME
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_WORDBREAK,
			formatInfoSz = { 5, 3 },
			font =
			{
				fontName = "Small",
			},
		},

		-- GAMEPLAY_DESC
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_WORDBREAK,
			formatInfoSz = { 5, 3 },
			font =
			{
				fontName = "Small",
			},
		},

		-- SENTINEL_LEADER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipSelection_sentinelLeader",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_1",
						layer		= "UI.ShipSelectionWnd.layers.SENTINEL_LEADER_TEXT_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",
						layer		= "UI.ShipSelectionWnd.layers.SENTINEL_LEADER_TEXT_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SENTINEL_LEADER_TEXT_1
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 3 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- SENTINEL_LEADER_TEXT_2
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 3 },
			font =
			{
				fontName = "Small",
			},
		},

		-- PVE_MISSION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipSelection_pveMission",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_1",
						layer		= "UI.ShipSelectionWnd.layers.PVE_MISSION_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "text_2",
						layer		= "UI.ShipSelectionWnd.layers.PVE_MISSION_REWARD_BONUS",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_3",
						layer		= "UI.ShipSelectionWnd.layers.PVE_MISSION_ROUND_DESC",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PVE_MISSION_NAME
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},
		
		-- PVE_MISSION_REWARD_BONUS
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_WORDBREAK,
			formatInfoSz = { 1, 3 },
			font =
			{
				fontName = "Small",
			},
		},
	
	
		-- PVE_MISSION_ROUND_DESC
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_WORDBREAK,
			formatInfoSz = { 1, 3 },
			font =
			{
				fontName = "Small",
			},
		},
		
		-- UNLIM_PVE_MISSION_LEVEL_LABEL
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},
		
		-- UNLIM_PVE_MISSION_MIN_LEVEL
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},
	},

	children =
	{
		"UI.ShipSelection_ShipsListWnd",
		"UI.ShipSelection_ShipsBigListWnd",
		"UI.ShipSelection_SpectateBtn",
		"UI.ShipSelection_ModulesWnd",
		"UI.ShipSelection_UnlimPveMissionLevelCb",
		"UI.ShipSelection_UnlimPveMissionLevelInfoIco",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------


-- called from .cpp code
function UI.ShipSelectionWnd:OnWaitPlayersTimerChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateStatus()

end


-- called from .cpp code
function UI.ShipSelectionWnd:OnProduceShipResponse( result, hangarSlotIdx )

	if not self:IsOnScreen() then
		return
	end

	-- здесь интересен только отрицательный результат, т.к. при положительном придет еще коллбэк OnStartProduceShip()

	-- т.к. визуально выделение устанавливается сразу же при клике мышью, не дожидаясь ответа сервера,
	-- то в этот момент может существовать "преждевременно" выделенный слот;
	-- при ответе сервера, что произошла ошибка, такое выделение снимается

	if result == false then

		local recordIdx = self:GetShipRecordByHangarSlot( hangarSlotIdx )

		if recordIdx == self.shipsList:GetSelectedRecord() then

			self.shipsList:SelectRecord( -1 )

			if self.hMsgProduceError == UI.INVALID_UI_HANDLE then
				self.hMsgProduceError = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_errorProduceShip" ), UI.MBS_OK )
			end

		end

	end

end


-- called from .cpp code
function UI.ShipSelectionWnd:OnStartProduceShip( playerIdx, hangarSlotIdx, timeLeft )

	if not self:IsOnScreen() then
		return
	end

	if playerIdx == UI.HudWnd.localPlayerId then

		local recordIdx = self:GetShipRecordByHangarSlot( hangarSlotIdx )

		if self.shipsList:GetSelectedRecord() ~= recordIdx then
			self.shipsList:SelectRecord( recordIdx )
		end

		self:UpdateStatus()
		self:UpdateSpectateBtnState()
		self:UpdateShipSlotsStatus()

	end

end


-- called from .cpp code
function UI.ShipSelectionWnd:OnShipFactoryShipsChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateShipsList()

end


-- called from .cpp code
function UI.ShipSelectionWnd:OnWarehouseSlotResponse( result, slotIdx )

	if not self:IsOnScreen() then
		return
	end

	-- здесь интересен только отрицательный результат, т.к. при положительном придет еще коллбэк OnSetDesireWarehouseSlot()

	-- т.к. визуально выделение устанавливается сразу же при клике мышью, не дожидаясь ответа сервера,
	-- то в этот момент может существовать "преждевременно" выделенный слот;
	-- при ответе сервера, что произошла ошибка, такое выделение снимается

	if result == false then

		local recordIdx = self:GetShipBigListRecordBySlotIdx( slotIdx )

		if recordIdx == self.shipsBigList:GetSelectedRecord() then

			self.shipsBigList:SelectRecord( -1 )

			if self.hMsgProduceError == UI.INVALID_UI_HANDLE then
				self.hMsgProduceError = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_errorProduceShip" ), UI.MBS_OK )
			end

		end

	end

end


--
function UI.ShipSelectionWnd:ShowTutorialTips()

	self:TrySelectDefaultTutorialShip()
	self.shipsList:ShowTutorialTips()

end


--
function UI.ShipSelectionWnd:HideTutorialTips()

	self.shipsList:HideTutorialTips()

end    


--
function UI.ShipSelectionWnd:OnBindsChanged()

	if not self:IsOnScreen() then
		return
	end

	self.modulesListWnd:OnBindsChanged()

end


--
function UI.ShipSelectionWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self.shipsList:OnAccountRankChanged()

end



--
function UI.ShipSelectionWnd:OnUnlimPveMissionLevelChanged( newLevel )

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdatePveMissionControls()

end


--
function UI.ShipSelectionWnd:OnWavePveStartWaveChanged( newStartWave )

	if not self:IsOnScreen() then
		return
	end
	
	self:UpdatePveMissionControls()

end



-- ------------------------------
-- const
-- ------------------------------

ss.layers =
{
	MAIN_EFFECT						= 0,
	BG_EFFECT						= 1,
	STATUS_TEXT_EFFECT				= 2,
	STATUS_TEXT						= 3,
	BALANCE							= 4, 
	TIMER_EFFECT					= 5, 
	TIMER_TEXT1						= 6, 
	TIMER_TEXT2						= 7, 
	TIMER_TEXT3						= 8, 
	TIMER_TEXT4						= 9, 
	TIMER_TEXT5						= 10,
	CHOOSE_SHIP_1_EFFECT			= 11,
	CHOOSE_SHIP_1_TEXT_OUTL			= 12,
	CHOOSE_SHIP_1_TEXT				= 13,
	CHOOSE_SHIP_2_TEXT				= 14,
	SENTINEL_TEXT					= 15,
    GAMEPLAY_NAME					= 16,
    GAMEPLAY_DESC					= 17,
	SENTINEL_LEADER_EFFECT			= 18,
	SENTINEL_LEADER_TEXT_1			= 19, 
	SENTINEL_LEADER_TEXT_2			= 20,
	PVE_MISSION_EFFECT  			= 21,
	PVE_MISSION_NAME				= 22,
	PVE_MISSION_REWARD_BONUS		= 23,
	PVE_MISSION_ROUND_DESC			= 24,
	UNLIM_PVE_MISSION_LEVEL_LABEL	= 25,
	UNLIM_PVE_MISSION_MIN_LEVEL		= 26,
	
}

ss.effectInfo =
{
	statusText =
	{
		animHasShips	= "readiness",
		animNoShips		= "gameover",
	},

	pveMission =
	{
		text2Locator	= "text_2",
		text3Locator	= "text_3",
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	}
}

ss.sounds =
{
	shipSlotMouseOver	= "sound/ui/btnMouseOver",
	battleSlotSelect	= "sound/ui/btnClick",
	localPlayerChoosing = "sound/ui/lootScanSuccess",
}

ss.IS_FULL_SCREEN	= false

ss.MAX_TIMER_SYMBOLS = 5

ss.tutorialShipTypeName = "MEDIUM"

-- ------------------------------
-- vars
-- ------------------------------

ss.shipsList						= nil
ss.shipsBigList						= nil
ss.modulesListWnd					= nil
ss.hMsgProduceError					= UI.INVALID_UI_HANDLE
ss.timer							= -1
ss.bStartCountdown					= false
ss.bStartCountdownToSet				= nil
ss.bTutorialTipsToSet				= nil
ss.sentinelLeaderId					= -1
ss.bProductionDisabled				= nil
ss.wndState							= -1
ss.warehouseChoiceIdx				= -1
ss.unlimPveMissionLevelToSelect		= nil
ss.bLockMissionLevelsChangeReact	= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipSelectionWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.shipsList 		= UI.ShipSelection_ShipsListWnd
	self.shipsBigList 	= UI.ShipSelection_ShipsBigListWnd
	self.modulesListWnd	= UI.ShipSelection_ModulesWnd

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( self.shipsList:GetUiHandle(), "" )
		mainEffect:UnlinkWnd( self.shipsBigList:GetUiHandle(), "" )
	end

	local handle = self:GetUiHandle()

	local pveMissionEffect = UI:GetEffectFromLayer( self, self.layers.PVE_MISSION_EFFECT )
	if pveMissionEffect then
		pveMissionEffect:Update( 0 )
		pveMissionEffect:UnlinkLayer( handle, self.layers.PVE_MISSION_REWARD_BONUS, "" )
		pveMissionEffect:UnlinkLayer( handle, self.layers.PVE_MISSION_ROUND_DESC, "" )
	end
	
	self:SetColor( UI.GOLD_COLOR, self.layers.PVE_MISSION_REWARD_BONUS )

    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )

end


--
function UI.ShipSelectionWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self.shipsList:Clear()
	self.shipsBigList:Clear()
	self:SetStatusTextVisible( false )
	self:ResetTimer()
	self.bStartCountdown = false
	self:HideModules()
	self:HideTutorialTips()
	UI.ShipSelection_SpectateBtn:UnlinkFromParent()

	self:SetText( "", self.layers.GAMEPLAY_NAME )
	self:SetText( "", self.layers.GAMEPLAY_DESC )

	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_1_EFFECT )
	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_1_TEXT_OUTL )
	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_1_TEXT )
	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_2_TEXT )
	self:SetLayerVisible( false, self.layers.SENTINEL_TEXT )
	self:SetLayerVisible( false, self.layers.SENTINEL_LEADER_EFFECT )
	self:SetLayerVisible( false, self.layers.SENTINEL_LEADER_TEXT_1 )
	self:SetLayerVisible( false, self.layers.SENTINEL_LEADER_TEXT_2 )
	self:SetLayerVisible( false, self.layers.PVE_MISSION_EFFECT )
	self:SetLayerVisible( false, self.layers.PVE_MISSION_NAME )
	self:SetLayerVisible( false, self.layers.PVE_MISSION_REWARD_BONUS )
	self:SetLayerVisible( false, self.layers.PVE_MISSION_ROUND_DESC )
	self:SetLayerVisible( false, self.layers.BALANCE )
	
	self:ResetUnlimPveMissionChoiceControls()
	
	self.sentinelLeaderId = -1
	self.bProductionDisabled = nil
	self.wndState = -1
	self.warehouseChoiceIdx = -1  -- номер игрока в очереди выбора кораблей, который сейчас выбирает корабль	

end


--
function UI.ShipSelectionWnd:FullUpdate()

	self:Reset()
	
	self.bStartCountdown = _G.CL_GetCountDownTimer() > 0
	if self.bStartCountdownToSet ~= nil then
		self.bStartCountdown = self.bStartCountdownToSet
		self.bStartCountdownToSet = nil
	end

	self:UpdateShipsList()
	self:UpdateShipsBigList()
	self:UpdateStatus()
	self:UpdateSpectateBtnState()
	self:UpdateGameplay()
	self:UpdateChooseShipText()
	self:UpdateSentinelText()
	self:UpdateSentinelLeaderText()
	self:UpdatePveMissionControls()
	self:UpdateBalance()
	self:UpdateUnlimPveMissionLevelCb( true )

	if self.bTutorialTipsToSet == true then
		self:ShowTutorialTips()
		self.bTutorialTipsToSet = nil
	end

end


--
function UI.ShipSelectionWnd:UpdateShipsList()

	self.shipsList:Clear()

	local wndState = _G.CL_GetUIShipSelectionWndState()

	if wndState ~= ai.UIShipSelectionWndState.SHIPS_FACTORY or _G.Game_IsObserverMode() then

		self:RemoveChild( self.shipsList )
	else
		if not self.shipsList:IsChildOf( self ) then
			self:AddChild( self.shipsList )
		end

		local playerIdx = UI.HudWnd.localPlayerId
		local shipsInfo = _G.CL_GetAvailableShips( playerIdx ) or {}

		for slotIdx = 1, #shipsInfo do
			self.shipsList:AddRecord( { shipInfo = shipsInfo[ slotIdx ] } )
		end	

		local produceHangarSlotIdx, timeLeft = _G.CL_GetProductionInfo( playerIdx )
		if produceHangarSlotIdx ~= -1 then

			local selRecordIdx = self:GetShipRecordByHangarSlot( produceHangarSlotIdx )
			if selRecordIdx ~= -1 then
				self.shipsList:SelectRecord( selRecordIdx )
			end

		end
		
		self:RecalcLayout()
	end

end


--
function UI.ShipSelectionWnd:UpdateShipsBigList()

	self.shipsBigList:Clear()

	if _G.CL_GetWarehouseChoiceIdx() >= 0 and not _G.Game_IsObserverMode() then

		if not self.shipsBigList:IsChildOf( self ) then
			self:AddChild( self.shipsBigList )
		end

		local playerIdx = UI.HudWnd.localPlayerId
		local shipsInfo = _G.CL_GetWarehouseShips() or {}

		for slotIdx = 1, #shipsInfo do
			self.shipsBigList:AddRecord( { shipInfo = shipsInfo[ slotIdx ] } )
		end

		local slotIdx = _G.CL_GetWarehouseDesireSlot( playerIdx )
		if slotIdx ~= -1 then
			local selRecordIdx = self:GetShipBigListRecordBySlotIdx( slotIdx )
			if selRecordIdx ~= -1 then
				self.shipsBigList:SelectRecord( selRecordIdx )
			end
		end

		self:RecalcLayoutShipBigList()
	else
		self:RemoveChild( self.shipsBigList )
	end	

end


--
function UI.ShipSelectionWnd:GetShipRecordByHangarSlot( hangarSlotIdx )

	for recordIdx = 1, self.shipsList:GetNumRecords() do
		local data = self.shipsList:GetRecordData( recordIdx )
		if data.shipInfo and data.shipInfo.hangarIdx == hangarSlotIdx then
			return recordIdx
		end
	end

	return -1

end


--
function UI.ShipSelectionWnd:GetShipBigListRecordBySlotIdx( slotIdx )

	if slotIdx >= 0 and ( slotIdx + 1 < self.shipsBigList:GetNumRecords() ) then
		local recordIdx = slotIdx + 1
		local data = self.shipsBigList:GetRecordData( recordIdx )
		if data.shipInfo and data.shipInfo.slotIdx == slotIdx then -- check slotIdx just in case
			return recordIdx
		end
	end

	return -1

end


--
function UI.ShipSelectionWnd:RecalcLayout()

	local numSlots = self.shipsList:GetNumVisibleSlots()
	if numSlots == 0 then
		return
	end

	local firstSlotWnd = self.shipsList:GetButtonForSlot( 1 )
	local lastSlotWnd = self.shipsList:GetButtonForSlot( numSlots )

	local firstSlotRect = firstSlotWnd:GetRect()
	local lastSlotRect = lastSlotWnd:GetRect()

	local totalWidth = lastSlotRect.x + lastSlotRect.z - firstSlotRect.x
	local newFirstSlotPosX = ( self:GetWidth() - totalWidth ) * 0.5

	local newListPosX = newFirstSlotPosX - firstSlotRect.x
	self.shipsList:SetLeft( newListPosX )	

	local listMainEffect = UI:GetEffectFromLayer( self.shipsList, self.layers.MAIN_EFFECT )
	if listMainEffect then
		listMainEffect:Update( 0 )
	end

end


--
function UI.ShipSelectionWnd:RecalcLayoutShipBigList()

	local numSlots = self.shipsBigList:GetNumVisibleSlots()
	if numSlots == 0 then
		return
	end

	local firstSlotWnd = self.shipsBigList:GetButtonForSlot( 1 )
	local lastSlotWnd = self.shipsBigList:GetButtonForSlot( numSlots )

	local firstSlotRect = firstSlotWnd:GetRect()
	local lastSlotRect = lastSlotWnd:GetRect()

	local totalWidth = lastSlotRect.x + lastSlotRect.z - firstSlotRect.x
	local newFirstSlotPosX = ( self:GetWidth() - totalWidth ) * 0.5

	local newListPosX = newFirstSlotPosX - firstSlotRect.x
	self.shipsBigList:SetLeft( newListPosX )

	local listMainEffect = UI:GetEffectFromLayer( self.shipsBigList, self.layers.MAIN_EFFECT )
	if listMainEffect then
		listMainEffect:Update( 0 )
	end

end


--
function UI.ShipSelectionWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if UI:IsWndKindOf( w, "ShipSelection_ShipSlotWnd" ) or UI:HasWndAncestorKindOf( w, "ShipSelection_ShipSlotWnd" ) then

		local shipSlotWnd = UI:IsWndKindOf( w, "ShipSelection_ShipSlotWnd" ) and w or UI:GetAncestorKindOf( w, "ShipSelection_ShipSlotWnd" )

		local recordIdx = shipSlotWnd:GetRecord()
		self:TryRequestShip( recordIdx, true )

	elseif UI:IsWndKindOf( w, "ShipSelection_ShipBLSlotWnd" ) or UI:HasWndAncestorKindOf( w, "ShipSelection_ShipBLSlotWnd" ) then

		local shipSlotWnd = UI:IsWndKindOf( w, "ShipSelection_ShipBLSlotWnd" ) and w or UI:GetAncestorKindOf( w, "ShipSelection_ShipBLSlotWnd" )

		local recordIdx = shipSlotWnd:GetRecord()
		self:TryRequestWarehouseSlot( recordIdx, true )

	elseif w == UI.ShipSelection_SpectateBtn then
		sys.concmd( "cl_toggleSpectatorTarget" )
	end

	return true

end


--
function UI.ShipSelectionWnd:TryRequestShip( recordIdx, bSound )

	local data = self.shipsList:GetRecordData( recordIdx )

	local bCanBeBuilt = false

	if data and data.shipInfo then
		local status = _G.CL_GetHangarStatus( UI.HudWnd.localPlayerId, data.shipInfo.hangarIdx )
		bCanBeBuilt = status == ai.HangarStatus.AVAILABLE
	end

	if not bCanBeBuilt then
		return false
	end

	-- запрет повторного последовательного запроса корабля в одном и том же слоте
	if recordIdx == self.shipsList:GetSelectedRecord() then
		return true
	end	

	-- хотя ответ от сервера еще не пришел, и точно нельзя быть уверенным в том,
	-- что данный корабль действительно начнет строиться, тем не менее визуально слот выделяется сразу же
	self.shipsList:SelectRecord( recordIdx )

	_G.CL_RequestProduceShip( data.shipInfo.hangarIdx )	

	if bSound then
		UI:PlayGlobalSound( UI.ShipSelectionWnd.sounds.battleSlotSelect )
	end

	return true

end


--
function UI.ShipSelectionWnd:TryRequestWarehouseSlot( recordIdx, bSound )

	if _G.CL_GetWarehouseTakenSlot( UI.HudWnd.localPlayerId ) >= 0 then
		return false
	end

	local data = self.shipsBigList:GetRecordData( recordIdx )

	local bCanBeBuilt = false

	if data and data.shipInfo then
		local status = _G.CL_GetWarehouseSlotStatus( UI.HudWnd.localPlayerId, data.shipInfo.slotIdx )
		bCanBeBuilt = status == ai.HangarStatus.AVAILABLE
	end

	if not bCanBeBuilt then
		return false
	end

	-- запрет повторного последовательного запроса корабля в одном и том же слоте
	if recordIdx == self.shipsBigList:GetSelectedRecord() then
		return true
	end	

	-- хотя ответ от сервера еще не пришел, и точно нельзя быть уверенным в том,
	-- что данный корабль действительно начнет строиться, тем не менее визуально слот выделяется сразу же
	self.shipsBigList:SelectRecord( recordIdx )

	_G.CL_RequestWarehouseSlot( data.shipInfo.slotIdx )	

	if bSound then
		UI:PlayGlobalSound( UI.ShipSelectionWnd.sounds.battleSlotSelect )
	end

	return true

end


--
function UI.ShipSelectionWnd:F_OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )

    	if self.hMsgProduceError ~= UI.INVALID_UI_HANDLE then
    		UI:RemoveUiObj( self.hMsgProduceError )
    		self.hMsgProduceError = UI.INVALID_UI_HANDLE
    	end

	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.ShipSelectionWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgProduceError then
		self.hMsgProduceError = UI.INVALID_UI_HANDLE
	end

end


--
function UI.ShipSelectionWnd:UpdateStatus()

	local wndState = _G.CL_GetUIShipSelectionWndState()
	if wndState == ai.UIShipSelectionWndState.WAIT_PLAYERS then

		local waitPlayersTimeLeft = _G.CL_GetWaitPlayersTimer()
		self:SetTimerVisible( true )
		self:SetTimerVal( waitPlayersTimeLeft )
		self:SetupStatusWaitPlayers()
	elseif wndState == ai.UIShipSelectionWndState.SHIPS_WAREHOUSE then

		local whoChoosing, choosingTimeLeft = _G.CL_GetWarehouseChoosingInfo()
		if whoChoosing >= 0 and choosingTimeLeft >= 0 then

			self:SetTimerVisible( true )
			self:SetTimerVal( choosingTimeLeft )
		else

			self:ResetTimer()
		end

		self:SetupStatusPlayerChoosing( whoChoosing )
	else

		local produceHangarSlotIdx, produceTimer, spawnGroup, bProductionDisabled = _G.CL_GetProductionInfo( UI.HudWnd.localPlayerId )

		if self:HasReadyShips() then
			
			local countdownTimer = _G.CL_GetCountDownTimer()
			local timer = math.max( produceTimer, countdownTimer )
	
			self:SetTimerVisible( true )
			self:SetTimerVal( timer )
	
			if countdownTimer > 0 then
				self:SetupStatusStart()
			else
				self:SetupStatusContinue()
			end
	
		else

			self:ResetTimer()

			if _G.Game_IsObserverMode() then
				self:SetStatusTextVisible( false )

			elseif bProductionDisabled then
				self:SetupStatusProductionDisabled()

			else
				self:SetupStatusAllShipsKilled()
			end
		end

	end

end


--
function UI.ShipSelectionWnd:HasReadyShips()

	for recordIdx = 1, self.shipsList:GetNumRecords() do

		local data = self.shipsList:GetRecordData( recordIdx )
		if data.shipInfo then

			local status = _G.CL_GetHangarStatus( UI.HudWnd.localPlayerId, data.shipInfo.hangarIdx )
			if status == ai.HangarStatus.AVAILABLE or status == ai.HangarStatus.BUILDING or status == ai.HangarStatus.ACTIVE then
				return true
			end

		end

	end

	return false

end


--
function UI.ShipSelectionWnd:HasMoreThanOneReadyShips()

	local num = 0
	for recordIdx = 1, self.shipsList:GetNumRecords() do

		local data = self.shipsList:GetRecordData( recordIdx )
		if data.shipInfo then

			local status = _G.CL_GetHangarStatus( UI.HudWnd.localPlayerId, data.shipInfo.hangarIdx )
			if status == ai.HangarStatus.AVAILABLE or status == ai.HangarStatus.BUILDING or status == ai.HangarStatus.ACTIVE then
				if num > 0 then
					return true
				else
					num = 1
				end
			end

		end

	end

	return false

end


--
function UI.ShipSelectionWnd:SetTimerVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.TIMER_EFFECT )

	for symbolIdx = 1, self.MAX_TIMER_SYMBOLS do
		self:SetLayerVisible( bVisible, self.layers.TIMER_TEXT1 + symbolIdx - 1 )
	end

end


--
function UI.ShipSelectionWnd:SetTimerVal( val )

	self.timer = val

	if self.timer < 0 then
		self.timer = 0
	end

	for idx = 1, self.MAX_TIMER_SYMBOLS do
		self:SetText( "", self.layers.TIMER_TEXT1 + idx - 1 )
	end
	
	local strTimer = UI:Time2Str5( self.timer )

	local numSymbols = #strTimer
	local layerIdx = self.layers.TIMER_TEXT1 + self.MAX_TIMER_SYMBOLS - 1

	for symbolIdx = numSymbols, 1, -1 do

		local strSymbol = string.sub( strTimer, symbolIdx, symbolIdx )

		self:SetText( strSymbol, layerIdx )

		layerIdx = layerIdx - 1
		if layerIdx < self.layers.TIMER_TEXT1 then
			break
		end

	end

end


--
function UI.ShipSelectionWnd:ResetTimer()

	self.timer = -1
	self:SetTimerVisible( false )

end


--
function UI.ShipSelectionWnd:UpdateTimer( dt )

	if self.timer ~= -1 then
		self:SetTimerVal( self.timer - dt )		
	end

end


--
function UI.ShipSelectionWnd:SetStatusTextVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.STATUS_TEXT_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.STATUS_TEXT )

end


--
function UI.ShipSelectionWnd:SetupStatusWaitPlayers()

	self:SetStatusTextVisible( true )

	local statusText = UI:GetStringByName( "shipSelection_status_waitPlayers" )
	self:SetText( statusText, self.layers.STATUS_TEXT )

	local statusTextEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_TEXT_EFFECT )
	if statusTextEffect then
		statusTextEffect:StartAnimation( self.effectInfo.statusText.animHasShips )
	end  

end


--
function UI.ShipSelectionWnd:SetupStatusPlayerChoosing( whoChoosing )

	self:SetStatusTextVisible( true )

	local localPlayerId = UI.HudWnd.localPlayerId

	local statusText = ""

	if whoChoosing == localPlayerId then

		statusText = UI:GetStringByName( "shipSelection_status_youChoosing" )

	elseif whoChoosing == -1 then

		statusText = UI:GetStringByName( "shipSelection_status_otherTeamsChoosing" )

	else

		statusText = UI:GetStringByName( "shipSelection_status_playerChoosing" )
		local playerInfo = _G.GetPlayerInfo( whoChoosing )
		local playerNickname = playerInfo and UI:MakePlayerNameById( playerInfo.playerId, true, false ) or ""
		statusText = string.format( statusText, playerNickname )

	end

	self:SetText( statusText, self.layers.STATUS_TEXT )

	local statusTextEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_TEXT_EFFECT )
	if statusTextEffect then
		statusTextEffect:StartAnimation( self.effectInfo.statusText.animHasShips )
	end  

end


--
function UI.ShipSelectionWnd:SetupStatusStart()

	self:SetStatusTextVisible( true )

	local statusText = UI:GetStringByName( "shipSelection_status_startGame" )
	self:SetText( statusText, self.layers.STATUS_TEXT )

	local statusTextEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_TEXT_EFFECT )
	if statusTextEffect then
		statusTextEffect:StartAnimation( self.effectInfo.statusText.animHasShips )
	end  

end


--
function UI.ShipSelectionWnd:SetupStatusContinue()

	self:SetStatusTextVisible( true )

	local statusText = UI:GetStringByName( "shipSelection_status_continueGame" )
	self:SetText( statusText, self.layers.STATUS_TEXT )

	local statusTextEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_TEXT_EFFECT )
	if statusTextEffect then
		statusTextEffect:StartAnimation( self.effectInfo.statusText.animHasShips )
	end  

end


--
function UI.ShipSelectionWnd:SetupStatusAllShipsKilled()

	self:SetStatusTextVisible( true )

	local statusText = UI:GetStringByName( "shipSelection_status_noShips" )
	self:SetText( statusText, self.layers.STATUS_TEXT )

	local statusTextEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_TEXT_EFFECT )
	if statusTextEffect then
		statusTextEffect:StartAnimation( self.effectInfo.statusText.animNoShips )
	end

end


--
function UI.ShipSelectionWnd:SetupStatusProductionDisabled()

	self:SetStatusTextVisible( true )

	local statusText = UI:GetStringByName( "shipSelection_status_productionDisabled" )
	self:SetText( statusText, self.layers.STATUS_TEXT )

	local statusTextEffect = UI:GetEffectFromLayer( self, self.layers.STATUS_TEXT_EFFECT )
	if statusTextEffect then
		statusTextEffect:StartAnimation( self.effectInfo.statusText.animNoShips )
	end

end


--
function UI.ShipSelectionWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimer( dt_game )
	self:UpdateSentinelLeaderText()
	self:UpdateProductionOrWarehouseChoiceAvailability()
	self:UpdateUnlimPveMissionLevelCb( false )
	self:UpdateChooseShipText()	-- tODO в пве количество оставшихся попыток устанавливается в правильное значение уже после показа этого окна

end


--
function UI.ShipSelectionWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == self.shipsList:GetUiHandle() then
		self:OnShipsListSelectionChanged()

	elseif hSender == self.shipsBigList:GetUiHandle() then
		self:OnShipsBigListSelectionChanged()

	end

end


--
function UI.ShipSelectionWnd:OnShipsListSelectionChanged()

	local selRecordIdx = self.shipsList:GetSelectedRecord()

	if selRecordIdx == -1 then
		self:HideModules()

	else
		self:ShowModules()

		local data = self.shipsList:GetRecordData( selRecordIdx )
		self.modulesListWnd:Setup( data.shipInfo )
	end

end


--
function UI.ShipSelectionWnd:OnShipsBigListSelectionChanged()

	local selRecordIdx = self.shipsBigList:GetSelectedRecord()

	if selRecordIdx == -1 then
		self:HideModules()

	else
		self:ShowModules()

		local data = self.shipsBigList:GetRecordData( selRecordIdx )
		self.modulesListWnd:Setup( data.shipInfo )
	end

end


--
function UI.ShipSelectionWnd:HideModules()

	self:RemoveChild( self.modulesListWnd )

end


--
function UI.ShipSelectionWnd:ShowModules()

	self:AddChild( self.modulesListWnd )

end


--
function UI.ShipSelectionWnd:UpdateSpectateBtnState()

	local wndState = _G.CL_GetUIShipSelectionWndState()
	local bNeedBtn = wndState == ai.UIShipSelectionWndState.SHIPS_FACTORY and ( not self:HasReadyShips() or _G.Game_IsObserverMode() )

	if bNeedBtn then
		self:AddChild( UI.ShipSelection_SpectateBtn )
	else
		UI.ShipSelection_SpectateBtn:UnlinkFromParent()
	end
	
end


--
function UI.ShipSelectionWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end
	
	local unlimPveSelMissionLevel = 1
	
	if UI.ShipSelection_UnlimPveMissionLevelCb:IsChildOf( self ) then
		local seRecordIdx = UI.ShipSelection_UnlimPveMissionLevelCb:GetSelectedRecord()
		if seRecordIdx ~= -1 then
			unlimPveSelMissionLevel = UI.ShipSelection_UnlimPveMissionLevelCb:GetRecordData( seRecordIdx ).level
		end
	end

	UI.store.ShipSelectionWnd =
	{
		bTutorialTips			= UI.ShipSelection_TutorialTipsWnd:IsChildOf( self.shipsList ),
		unlimPveSelMissionLevel	= unlimPveSelMissionLevel,
		bStartCountdown			= self.bStartCountdown,
	}

end


--
function UI.ShipSelectionWnd:F_OnEventRestoreUiState()

	if UI.store.ShipSelectionWnd then
	
		self.bStartCountdownToSet			= UI.store.ShipSelectionWnd.bStartCountdown
		self.unlimPveMissionLevelToSelect	= UI.store.ShipSelectionWnd.unlimPveSelMissionLevel
		self.bTutorialTipsToSet				= UI.store.ShipSelectionWnd.bTutorialTips		

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.ShipSelectionWnd = nil

	end

end


--
function UI.ShipSelectionWnd:TrySelectDefaultTutorialShip()

	if self.shipsList:GetNumRecords() > 1 then

    	local shipType = ai.ShipClass[ self.tutorialShipTypeName ]

    	local recordIdx = self:GetRecordByShipType( shipType )
    	if recordIdx ~= -1 then

    		if not self:TryRequestShip( recordIdx, false ) then
    			sys.log( "UI.ShipSelectionWnd:TrySelectDefaultTutorialShip()[ERROR]: cannot select ship with default tutorial type \"%s\"", self.tutorialShipTypeName )
    		end

    	else
    		sys.log( "UI.ShipSelectionWnd:TrySelectDefaultTutorialShip()[ERROR]: cannot find ship with default tutorial type \"%s\"", self.tutorialShipTypeName )
    	end	

	end

end


--
function UI.ShipSelectionWnd:GetRecordByShipType( shipType )

	for recordIdx = 1, self.shipsList:GetNumRecords() do

		local data = self.shipsList:GetRecordData( recordIdx )
		if data.shipInfo and UI:GetItemShipType( data.shipInfo.baseDef ) == shipType then
			return recordIdx
		end

	end

	return -1

end


--
function UI.ShipSelectionWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	if UI.ShipSelection_ShipsListWnd and UI.ShipSelection_ShipsListWnd.w and UI.ShipSelection_ShipsListWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ShipSelection_ShipsListWnd )
	end

end


--
function UI.ShipSelectionWnd:UpdateGameplay()

    local gameplay = _G.GetCurrentGameMode()
	if gameplay ~= ai.Gameplay.PVE_MISSION then

    	local gameplayName = UI:Gameplay2Str( gameplay, true )
    	self:SetText( gameplayName, self.layers.GAMEPLAY_NAME )

    	local gameplayDesc = UI:GetGameplayDesc( gameplay, true )
    	self:SetText( gameplayDesc, self.layers.GAMEPLAY_DESC )

	end

end   


--
function UI.ShipSelectionWnd:UpdateChooseShipText()

	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_1_EFFECT )
	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_1_TEXT_OUTL )
	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_1_TEXT )
	self:SetLayerVisible( false, self.layers.CHOOSE_SHIP_2_TEXT )
	
	local wndState = _G.CL_GetUIShipSelectionWndState()
	if wndState ~= ai.UIShipSelectionWndState.SHIPS_FACTORY or _G.Game_IsObserverMode() then
		return
	end
	
	local text = ""
	
	if self:HasMoreThanOneReadyShips() then
		text = UI:GetStringByName( "chooseShip" )
	end

	local gameplay = _G.GetCurrentGameMode()
	
	if gameplay == ai.Gameplay.PVE_MISSION then
	
		local missionName = _G.CL_PveGetMissionName()
		local resurrectionAttemptsMax = UI:GetPveMissionMaxResurrectionAttempts( missionName )
		
		if resurrectionAttemptsMax ~= 0 then
		
			local resurrectionAttemptsLeft = _G.CL_GetResurrectionAttemptsLeft()	-- tODO в пве количество оставшихся попыток устанавливается в правильное значение уже после показа этого окна, поэтому адпйтится каждый кадр
			
			local strSpawns = UI:GetStringByName( "shipSelection_numSpawns" )
			local strSpawnsVal = string.format( "%d/%d", resurrectionAttemptsLeft, resurrectionAttemptsMax )
			
			local numSubst = 0
			strSpawns, numSubst = string.gsub( strSpawns, "%$spawns%$", strSpawnsVal )
			
			if numSubst == 0 then
				sys.log( "UI.ShipSelectionWnd:UpdateChooseShipText()[ERROR]: cannot find placeholde '$spawns$' in string 'shipSelection_numSpawns'" )
				strSpawns = string.format( "[INVALID STRING](num spawns: %s)", strSpawnsVal )
			end
			
			text = text ~= "" and string.format( "%s %s", text, strSpawns ) or strSpawns
			
		end

	else
	
		local maxSpawns, leftSpawns, bCanReuseShips = _G.CL_GetNumSpawns()
		if maxSpawns ~= 0 and bCanReuseShips then
		
			local strSpawns = UI:GetStringByName( "shipSelection_numSpawns" )
			local strSpawnsVal = string.format( "%d/%d", leftSpawns, maxSpawns )
			
			local numSubst = 0
			strSpawns, numSubst = string.gsub( strSpawns, "%$spawns%$", strSpawnsVal )
			
			if numSubst == 0 then
				sys.log( "UI.ShipSelectionWnd:UpdateChooseShipText()[ERROR]: cannot find placeholde '$spawns$' in string 'shipSelection_numSpawns'" )
				strSpawns = string.format( "[INVALID STRING](num spawns: %s)", strSpawnsVal )
			end
			
			text = text ~= "" and string.format( "%s %s", text, strSpawns ) or strSpawns
		
		end
		
	end
	
	if gameplay == ai.Gameplay.SENTINEL then
	
		self:SetLayerVisible( true, self.layers.CHOOSE_SHIP_2_TEXT )
		self:SetText( text, self.layers.CHOOSE_SHIP_2_TEXT )
	
	else
	
		self:SetLayerVisible( true, self.layers.CHOOSE_SHIP_1_EFFECT )
		self:SetLayerVisible( true, self.layers.CHOOSE_SHIP_1_TEXT_OUTL )
		self:SetLayerVisible( true, self.layers.CHOOSE_SHIP_1_TEXT )
		self:SetText( text, self.layers.CHOOSE_SHIP_1_TEXT_OUTL )
		self:SetText( text, self.layers.CHOOSE_SHIP_1_TEXT )

	end

end


--
function UI.ShipSelectionWnd:UpdateSentinelText()

	local gameplay = _G.GetCurrentGameMode()
	local bVisible = gameplay == ai.Gameplay.SENTINEL

	self:SetLayerVisible( bVisible, self.layers.SENTINEL_TEXT )	

end


--
function UI.ShipSelectionWnd:UpdateSentinelLeaderText()

	local gameplay = _G.GetCurrentGameMode()
	if gameplay ~= ai.Gameplay.SENTINEL then
		return
	end

	local localPlayerId = UI.HudWnd.localPlayerId
	local localPlayerTeam = _G.CL_GetPlayerTeam( localPlayerId )
	if localPlayerTeam == 0 then
		localPlayerTeam = 1
	end

	local leaderId, bLeaderDead = _G.CL_SentinelGetTeamLeader( localPlayerTeam )
	if bLeaderDead then
		leaderId = -1
	end

	if leaderId == self.sentinelLeaderId then
		return
	end

	self.sentinelLeaderId = leaderId

	if leaderId ~= -1 then

 		self:SetLayerVisible( true, self.layers.SENTINEL_LEADER_EFFECT )
 		self:SetLayerVisible( true, self.layers.SENTINEL_LEADER_TEXT_1 )
 		self:SetLayerVisible( true, self.layers.SENTINEL_LEADER_TEXT_2 )

		local text1 = ""
		local text2 = ""

		if leaderId == localPlayerId then

			text1 = UI:GetStringByName( "shipSelection_youLeader" )
			text2 = UI:GetStringByName( "shipSelection_youLeaderDesc" )

		else

			text1 = UI:GetStringByName( "shipSelection_somebodyLeader" )
			local leaderPlayerInfo = _G.GetPlayerInfo( leaderId )
			local leaderNickname = leaderPlayerInfo and UI:MakePlayerNameById( leaderPlayerInfo.playerId, true, false ) or ""
			text1 = string.format( text1, leaderNickname )

			text2 = UI:GetStringByName( "shipSelection_somebodyLeaderDesc" )

		end

		self:SetText( text1, self.layers.SENTINEL_LEADER_TEXT_1 )
		self:SetText( text2, self.layers.SENTINEL_LEADER_TEXT_2 )

	else

 		self:SetLayerVisible( false, self.layers.SENTINEL_LEADER_EFFECT )
 		self:SetLayerVisible( false, self.layers.SENTINEL_LEADER_TEXT_1 )
 		self:SetLayerVisible( false, self.layers.SENTINEL_LEADER_TEXT_2 )

	end

end


--
function UI.ShipSelectionWnd:UpdatePveMissionControls()

	self:SetLayerVisible( false, self.layers.PVE_MISSION_EFFECT )
	self:SetLayerVisible( false, self.layers.PVE_MISSION_NAME )
	self:SetLayerVisible( false, self.layers.PVE_MISSION_ROUND_DESC )
	self:SetLayerVisible( false, self.layers.PVE_MISSION_REWARD_BONUS )	


	local gameplay = _G.GetCurrentGameMode()
	if gameplay ~= ai.Gameplay.PVE_MISSION then
		return
	end

	local missionName = _G.CL_PveGetMissionName()

	local missionDef = _G.PvE_Missions and _G.PvE_Missions[ missionName ]
	if not missionDef then
		sys.log( "UI.ShipSelectionWnd:UpdatePveMissionControls()[ERROR]: cannot find _G.PvE_Missions[%s]", tostring( missionName ) )
		return
	end

	local curRoundIdx, maxRounds = _G.CL_PveGetMissionRound()
	if not curRoundIdx then
		sys.log( "UI.ShipSelectionWnd:UpdatePveMissionControls()[ERROR]: nil round" )
		return
	end

	local roundDef = missionDef.rounds and missionDef.rounds[ curRoundIdx + 1 ]
	if not roundDef then
		sys.log( "UI.ShipSelectionWnd:UpdatePveMissionControls()[ERROR]: cannot find _G.PvE_Missions[%s].rounds[%d]", missionName, curRoundIdx )
		return
	end	

	local pveMissionEffect = UI:GetEffectFromLayer( self, self.layers.PVE_MISSION_EFFECT )
	if not pveMissionEffect then
		return
	end
	
	local bIsUnlimPve = _G.CL_IsUnlimPve()
	local bIsWavePve = _G.CL_IsWavePve()
	
	local unlimPveMissionLevel = 1
	if bIsUnlimPve then
		unlimPveMissionLevel = _G.CL_GetUnlimPveMissionLevel()
	elseif bIsWavePve then
		unlimPveMissionLevel = _G.CL_GetWavePveStartWave()
	end

	self:SetLayerVisible( true, self.layers.PVE_MISSION_EFFECT )
	self:SetLayerVisible( true, self.layers.PVE_MISSION_NAME )
	self:SetLayerVisible( true, self.layers.PVE_MISSION_ROUND_DESC )
	
	-- название карты и уровень миссии в бесконечном пве
	
	local strMission = ""

	local levelName = UI:GetPveMissionLevelName( missionName )
	strMission = UI:GetLevelLocalizedName( levelName, false )
	
	if bIsUnlimPve or bIsWavePve then
	
		local missionLevelStringName = ""
		if bIsUnlimPve then
			missionLevelStringName = "pve_buffs_buffLevel"
		elseif bIsWavePve then
			missionLevelStringName = "shipSelection_missionName_startWave"
		end
		
		local strMissionLevel = UI:GetStringByName( missionLevelStringName )
		
		local numSubst = 0
		strMissionLevel, numSubst = string.gsub( strMissionLevel, "%$val%$", tostring( unlimPveMissionLevel ) )
		
		if numSubst == 0 then
			sys.log( "UI.ShipSelectionWnd:UpdatePveMissionControls()[ERROR]: cannot find placeholder '$val$' in string '%s'", missionLevelStringName )
			strMissionLevel = string.format( "[INVALID STRING] lvl %d", unlimPveMissionLevel )
		end
	
		strMission = string.format( "%s %s", strMission, strMissionLevel )
	
	end

	self:SetText( strMission, self.layers.PVE_MISSION_NAME )
	
	-- описание раудна
	
	local roundDesc = "noRoundDesc"
	
	if roundDef.uiRoundDesc then
		roundDesc = UI:GetStringByName( roundDef.uiRoundDesc )
	else
		sys.log( "UI.ShipSelectionWnd:UpdatePveMissionControls()[ERROR]: cannot find _G.PvE_Missions[%s].rounds[%d].uiRoundDesc", missionName, curRoundIdx )
	end
	
	if maxRounds > 1 then
		local strRound = string.format( "%s %d/%d", UI:GetStringByName( "shipSelection_pveRound" ), curRoundIdx + 1, maxRounds )
		roundDesc = string.format( "%s: %s", strRound, roundDesc )
	end
	
	self:SetText( roundDesc, self.layers.PVE_MISSION_ROUND_DESC )
	
	-- бонус к награде в бесконечном пве
	
	if bIsUnlimPve or bIsWavePve then
	
		local bonus = 0
		if bIsUnlimPve then
			bonus = UI:GetUnlimPveCreditsRewardBonus( unlimPveMissionLevel, false )
		elseif bIsWavePve then
			bonus = UI:GetUnlimPveCreditsRewardBonus( unlimPveMissionLevel, true )
		end
		
		if bonus ~= 0 then
		
			local bonusVal = UI:Round( bonus * 100 )
			local strBonusVal = string.format( "+%d%%", bonusVal )
			
			local rewardBonusStringName = ""
			if bIsUnlimPve then
				rewardBonusStringName = "shipSelection_unlimPve_creditsBonus"
			elseif bIsWavePve then
				rewardBonusStringName = "shipSelection_wavePve_creditsBonus"
			end
		
			local strRewardBonus = UI:GetStringByName( rewardBonusStringName )
			
			local tSubst =
			{
				val	= strBonusVal
			}
			
			local numSubst = 0
			strRewardBonus, numSubst = string.gsub( strRewardBonus, "%$(.-)%$", tSubst )
			if numSubst == 0 then
				sys.log( "UI.ShipSelectionWnd:UpdatePveMissionControls()[ERROR]: cannot find placeholder 'val' in string '%s'", rewardBonusStringName )
				strRewardBonus = string.format( "[INVALID STRING] Credits bonus: %s", strBonusVal )
			end
	
			self:SetLayerVisible( true, self.layers.PVE_MISSION_REWARD_BONUS )	
			self:SetText( strRewardBonus, self.layers.PVE_MISSION_REWARD_BONUS )
			
		end
		
	end
	
	

	-- recalc layout

	local rewardBonusLocatorPos		= pveMissionEffect:GetObjPos( self.effectInfo.pveMission.text2Locator )
	local rewardBonusLocatorSize	= pveMissionEffect:GetObjSize( self.effectInfo.pveMission.text2Locator )
	local roundDescLocatorPos		= pveMissionEffect:GetObjPos( self.effectInfo.pveMission.text3Locator )
	local roundDescLocatorSize		= pveMissionEffect:GetObjSize( self.effectInfo.pveMission.text3Locator )
	local minHeight 				= pveMissionEffect:GetObjSize( self.effectInfo.pveMission.minSizeLocator ).y
	local maxHeight 				= pveMissionEffect:GetObjSize( self.effectInfo.pveMission.maxSizeLocator ).y
	local pveMissionEffectPos		= pveMissionEffect:GetPos()
	
	local space_rewardBonus_roundDesc	= roundDescLocatorPos.y - ( rewardBonusLocatorPos.y + rewardBonusLocatorSize.y )
	local space_roundDesc_bottom		= maxHeight - ( roundDescLocatorPos.y + roundDescLocatorSize.y )
	
	local btm = rewardBonusLocatorPos.y	
	
	-- бонус к награде (высота)
	
	if self:IsLayerVisible( self.layers.PVE_MISSION_REWARD_BONUS ) then
	
		local rewardBonusFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.PVE_MISSION_REWARD_BONUS ), 100000 )
		local rewardBonusHeight = _G.MeasureText(
			self:GetText( self.layers.PVE_MISSION_REWARD_BONUS ),
			self:GetFont( self.layers.PVE_MISSION_REWARD_BONUS ),
			rewardBonusFormatRect,
			self:GetTextFormatFlags( self.layers.PVE_MISSION_REWARD_BONUS ),
			rewardBonusFormatRect ).w
			
		self:SetLayerHeight( rewardBonusHeight, self.layers.PVE_MISSION_REWARD_BONUS )
		
		btm = btm + rewardBonusHeight + space_rewardBonus_roundDesc
		
	end
	
	-- описание раунда (y, высота)

	local roundDescFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.PVE_MISSION_ROUND_DESC ), 100000 )
	local roundDescHeight = _G.MeasureText(
		roundDesc,
		self:GetFont( self.layers.PVE_MISSION_ROUND_DESC ),
		roundDescFormatRect,
		self:GetTextFormatFlags( self.layers.PVE_MISSION_ROUND_DESC ),
		roundDescFormatRect ).w

	self:SetLayerHeight( roundDescHeight, self.layers.PVE_MISSION_ROUND_DESC )

	local roundDescY = btm
	self:SetLayerTop( roundDescY + pveMissionEffectPos.y, self.layers.PVE_MISSION_ROUND_DESC )
	
	-- ообший эффект пве (высота)

	local pveMissionEffectHeight = roundDescY + roundDescHeight + space_roundDesc_bottom
	pveMissionEffectHeight = UI:Clamp( pveMissionEffectHeight, minHeight, maxHeight )

	local animTime = ( pveMissionEffectHeight - minHeight ) / ( maxHeight - minHeight )
	pveMissionEffect:SetAnimationTime( animTime )
	pveMissionEffect:Update( 0 )

end


--
function UI.ShipSelectionWnd:UpdateShipSlotsStatus()

	for recordIdx = 1, self.shipsList:GetNumRecords() do
		local slotWnd = self.shipsList:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:UpdateStatus( slotWnd:GetRecordData() )
		end
	end

end


--
function UI.ShipSelectionWnd:UpdateProductionOrWarehouseChoiceAvailability()

	local wndState = _G.CL_GetUIShipSelectionWndState()

	local warehouseChoiceIdx = _G.CL_GetWarehouseChoiceIdx()

	local produceHangarSlotIdx, produceTimer, spawnGroup, bProductionDisabled = _G.CL_GetProductionInfo( UI.HudWnd.localPlayerId )

	if wndState ~= self.wndState or bProductionDisabled ~= self.bProductionDisabled or warehouseChoiceIdx ~= self.warehouseChoiceIdx then

		local needUpdateShipsList = wndState ~= self.wndState and ( wndState == ai.UIShipSelectionWndState.SHIPS_FACTORY
			or self.wndState == ai.UIShipSelectionWndState.SHIPS_FACTORY )
		local needUpdateShipsBigList = warehouseChoiceIdx ~= self.warehouseChoiceIdx

		self.wndState = wndState
		self.bProductionDisabled = bProductionDisabled
		self.warehouseChoiceIdx = warehouseChoiceIdx

		if needUpdateShipsList then
			self:UpdateShipsList()
		end

		if needUpdateShipsBigList then
			self:UpdateShipsBigList()
			local whoChoosing, choosingTimeLeft = _G.CL_GetWarehouseChoosingInfo()
			if whoChoosing == UI.HudWnd.localPlayerId then
				UI:PlayGlobalSound( UI.ShipSelectionWnd.sounds.localPlayerChoosing )
			end
		end

		self:UpdateStatus()
		self:UpdateSpectateBtnState()
		self:UpdateShipSlotsStatus()

	end

end


--
function UI.ShipSelectionWnd:UpdateBalance()

	local bNeedBalance = cvars.sv_mmBattleRank ~= 0 and _G.GetCurrentGameMode() ~= ai.Gameplay.PVE_MISSION	-- #0103184 в пве не покаызвается
	self:SetLayerVisible( bNeedBalance, self.layers.BALANCE )

end


--
function UI.ShipSelectionWnd:UpdateUnlimPveMissionLevelCb( bForceUpdate )

	if bForceUpdate == nil then
		bForceUpdate = true
	end
	
	local bIsUnlimPve = _G.CL_IsUnlimPve()
	local bIsWavePve = _G.CL_IsWavePve()
	
	local minLevel = bIsUnlimPve and _G.CL_GetUnlimPveMinMissionLevel() or 1

	local bCanChangeMissionLevel = false
	if not _G.Game_IsObserverMode() then
		if bIsUnlimPve then
			bCanChangeMissionLevel = _G.CL_CanChangeUnlimPveMissionLevelNow( false )
		elseif bIsWavePve then
			bCanChangeMissionLevel = _G.CL_CanChangeWavePveStartWaveNow( false )
		end
	end
	
	local isMissionChoiceControls = UI.ShipSelection_UnlimPveMissionLevelCb:IsChildOf( self )
	
	if not bCanChangeMissionLevel then
	
		if isMissionChoiceControls then
			self:ResetUnlimPveMissionChoiceControls()
		end
		
		return
		
	end
	
	local bNeedUpdate = not isMissionChoiceControls or bForceUpdate
	if not bNeedUpdate then
		return
	end
	
	self.bLockMissionLevelsChangeReact = true
		UI.ShipSelection_UnlimPveMissionLevelCb:Reset()
		self:AddChild( UI.ShipSelection_UnlimPveMissionLevelCb )
	self.bLockMissionLevelsChangeReact = false
	
	-- заголовок списка уровней
	
	self:SetLayerVisible( true, self.layers.UNLIM_PVE_MISSION_LEVEL_LABEL )
	
	local strLabel = ""
	if bIsUnlimPve then
		strLabel = UI:GetStringByName( "shipSelection_missionLevelsCombobox_caption" )
	elseif bIsWavePve then
		strLabel = UI:GetStringByName( "shipSelection_missionLevelsCombobox_caption_wave" )
	end
	
	self:SetText( strLabel, self.layers.UNLIM_PVE_MISSION_LEVEL_LABEL )
	
	-- информационная иконка с тултипом
	
	self:AddChild( UI.ShipSelection_UnlimPveMissionLevelInfoIco )
	
	if bIsUnlimPve then
		UI.ShipSelection_UnlimPveMissionLevelInfoIco:SetupForUnlimPve()
	elseif bIsWavePve then
		UI.ShipSelection_UnlimPveMissionLevelInfoIco:SetupForWavePve()
	end
	
	-- минимальный возможный уровень миссии
	if bIsUnlimPve and minLevel ~= 1 then
		
		self:SetLayerVisible( true, self.layers.UNLIM_PVE_MISSION_MIN_LEVEL )
		
		local strMinLevel = UI:GetStringByName( "shipSelection_missionLevelsCombobox_minLevel" )
		
		local numSubst = 0
		strMinLevel, numSubst = string.gsub( strMinLevel, "%$level%$", tostring( minLevel ) )
		
		if numSubst == 0 then
			sys.log( "UI.ShipSelectionWnd:UpdateUnlimPveMissionLevelCb()[ERROR]: cannot find placeholder '$level$' in string 'shipSelection_missionLevelsCombobox_minLevel'" )
			strMinLevel = string.format( "[INVALID STRING] Min level: %d", minLevel )
		end
		
		self:SetText( strMinLevel, self.layers.UNLIM_PVE_MISSION_MIN_LEVEL )
		
	end
	
	-- заполнение списка уровней
	
	local localPlayerId = _G.Game_LocalClientNum()

	local localPlayerAvailableLevel = 1
	local maxAvailableLevel = 1
	
	local playersInfo = _G.GetAllPlayersInfo()
	for playerIdx, playerInfo in pairs( playersInfo ) do
	
		local playerAvailableLevel = 1
		
		if bIsUnlimPve then
			playerAvailableLevel = playerInfo.playerSettings and playerInfo.playerSettings.unlimPve_missionLevel or 1
		elseif bIsWavePve then
			playerAvailableLevel = playerInfo.playerSettings and playerInfo.playerSettings.wavePve_availableWave or 1
		end
		
		-- SC-108585 если игра была сматчена для игроков, пришедших из квеста с прописанным в нем минимальным уровнем миссии,
		-- то меньше него выбрать уровень нельзя
		if playerAvailableLevel < minLevel then
			playerAvailableLevel = minLevel
		end
		
		if playerInfo.playerId == localPlayerId then
			localPlayerAvailableLevel = playerAvailableLevel
		end
		
		if not playerInfo.isBot then
			if playerAvailableLevel > maxAvailableLevel then
				maxAvailableLevel = playerAvailableLevel
			end
		end
	
	end
	
	local strLevel = ""
	
	if bIsUnlimPve then
		strLevel = UI:GetStringByName( "shipSelection_missionLevelsCombobox_level" )
	elseif bIsWavePve then
		strLevel = UI:GetStringByName( "shipSelection_missionLevelsCombobox_wave" )
	end
	
	for level = minLevel, maxAvailableLevel do
		local text = string.format( "%s %d", strLevel, level )
		UI.ShipSelection_UnlimPveMissionLevelCb:AddRecord( { level = level, text = text } )
	end
	
	-- выбор уровня миссии по умолчанию	
	-- #0104380 : до 9 уровня аккаунт ранга у игрока всегда выбран по умолчанию его максимальный уровень в этой миссии, а с девятого уровня выбирается максимальный из доступных
	local ACCOUNT_RANK_THRESHOLD = 9
	local playerAccountRank = UI:GetPlayerAccountRank()
	local levelToSelect = ( playerAccountRank < ACCOUNT_RANK_THRESHOLD ) and localPlayerAvailableLevel or maxAvailableLevel
	
	if self.unlimPveMissionLevelToSelect then
		levelToSelect = self.unlimPveMissionLevelToSelect
		self.unlimPveMissionLevelToSelect = nil
	end

	-- теоретически (если потом поменяют логику) уровень миссии может не совпадать с индексом записи, например список может начинаться не с 1, или включать не все уровни,
	-- поэтому честный поиск записи по уровню
	local selRecordIdx = -1
	for recordIdx = 1, UI.ShipSelection_UnlimPveMissionLevelCb:GetNumRecords() do
		if UI.ShipSelection_UnlimPveMissionLevelCb:GetRecordData( recordIdx ).level == levelToSelect then
			selRecordIdx = recordIdx
			break
		end
	end
	
	if selRecordIdx ~= -1 then
		UI.ShipSelection_UnlimPveMissionLevelCb:SelectRecord( selRecordIdx )	-- TODO: брать из playerSettings wanted level?
	end
	
end


--
function UI.ShipSelectionWnd:ResetUnlimPveMissionChoiceControls()

	UI.ShipSelection_UnlimPveMissionLevelCb:UnlinkFromParent()
	UI.ShipSelection_UnlimPveMissionLevelCb:Reset()
	self:SetLayerVisible( false, self.layers.UNLIM_PVE_MISSION_LEVEL_LABEL )
	self:SetText( "", self.layers.UNLIM_PVE_MISSION_LEVEL_LABEL )
	self:SetLayerVisible( false, self.layers.UNLIM_PVE_MISSION_MIN_LEVEL )
	self:SetText( "", self.layers.UNLIM_PVE_MISSION_MIN_LEVEL )
	UI.ShipSelection_UnlimPveMissionLevelInfoIco:UnlinkFromParent()
	UI.ShipSelection_UnlimPveMissionLevelInfoIco:Reset()

end


--
function UI.ShipSelectionWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.ShipSelection_UnlimPveMissionLevelCb:GetUiHandle() then
		self:OnUnlimPveMissionsSelectionChanged()
	end

end


--
function UI.ShipSelectionWnd:OnUnlimPveMissionsSelectionChanged()

	if not self:IsOnScreen() or not UI.ShipSelection_UnlimPveMissionLevelCb:IsChildOf( self ) or UI.bSavingGameState or self.bLockMissionLevelsChangeReact then
		return
	end
	
	local bIsUnlimPve = _G.CL_IsUnlimPve()
	local bIsWavePve = _G.CL_IsWavePve()
	
	local playerInfo = _G.GetPlayerInfo( _G.Game_LocalClientNum() )
	
	local curWantedLevel = 1
	
	if playerInfo.playerSettings then
	
		if bIsUnlimPve then
	
			if playerInfo.playerSettings.unlimPve_wantedMissionLevel then
				curWantedLevel = playerInfo.playerSettings.unlimPve_wantedMissionLevel
			elseif playerInfo.playerSettings.unlimPve_missionLevel then
				curWantedLevel = playerInfo.playerSettings.unlimPve_missionLevel
			end
			
		elseif bIsWavePve then
		
			if playerInfo.playerSettings.wavePve_wantedStartWave then
				curWantedLevel = playerInfo.playerSettings.wavePve_wantedStartWave
			elseif playerInfo.playerSettings.wavePve_availableWave then
				curWantedLevel = playerInfo.playerSettings.wavePve_availableWave
			end

		end
		
	end
	
	-- SC-108585 если игра была сматчена для игроков, пришедших из квеста с прописанным в нем минимальным уровнем миссии,
	-- то меньше него выбрать уровень нельзя
	local minLevel = bIsUnlimPve and _G.CL_GetUnlimPveMinMissionLevel() or 1
	if curWantedLevel < minLevel then
		curWantedLevel = minLevel
	end
	
	local newWantedLevel = 1
	local selRecordIdx = UI.ShipSelection_UnlimPveMissionLevelCb:GetSelectedRecord()
	if selRecordIdx ~= -1 then
		newWantedLevel = UI.ShipSelection_UnlimPveMissionLevelCb:GetRecordData( selRecordIdx ).level
	end
	
	if newWantedLevel ~= curWantedLevel then
	
		local settings = {}
		
		if bIsUnlimPve then
			settings = { unlimPve_wantedMissionLevel = newWantedLevel }
		elseif bIsWavePve then
			settings = { wavePve_wantedStartWave = newWantedLevel }
		end
	
		_G.ChangeLocalPlayerSettings( settings )
		
	end

end


-- ---------------------------------------------------------
-- UI.ShipSelection_ShipsListWnd
-- ---------------------------------------------------------

UI.ShipSelection_ShipsListWnd = {}
local ssl = UI.ShipSelection_ShipsListWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipSelection_ShipsListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "ShipSelection_ShipsListWnd",
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
				defName 			= "shipSelection_shipsList",
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
	},

	children = { "UI.ShipSelection_TutorialTipsWnd" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipSelection_ShipsListWnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	self:HideTutorialTips()

end


--
function UI.ShipSelection_ShipsListWnd:ShowTutorialTips()

	self:AddChild( UI.ShipSelection_TutorialTipsWnd )
	self:UpdateTutorialTipsForSelShipType()
	self:UpdateTutorialTipsPos()

end


--
function UI.ShipSelection_ShipsListWnd:HideTutorialTips()

	UI.ShipSelection_TutorialTipsWnd:Reset()
	UI.ShipSelection_TutorialTipsWnd:UnlinkFromParent()

end


--
function UI.ShipSelection_ShipsListWnd:OnAccountRankChanged()

	for recordIdx = 1, self:GetNumRecords() do
	
		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnAccountRankChanged()
		end
	
	end

end


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipSelection_ShipsListWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )
	self:ArrangeChildren()

end


--
function UI.ShipSelection_ShipsListWnd:SelectRecordInternal( recordIdx, bAnimated )

	UI.ButtonsListWnd.SelectRecordInternal( self, recordIdx, bAnimated )

	self:ArrangeChildren()
	self:UpdateTutorialTipsForSelShipType()

end


--
function UI.ShipSelection_ShipsListWnd:ArrangeChildren()

	if UI.ShipSelection_TutorialTipsWnd and UI.ShipSelection_TutorialTipsWnd.w and UI.ShipSelection_TutorialTipsWnd:IsChildOf( self ) then

		self:MoveChildToLastPosition( UI.ShipSelection_TutorialTipsWnd )

    	local selectedRecordIdx = self:GetSelectedRecord()
    	if selectedRecordIdx ~= -1 then

			local slotWnd = self:GetButtonForRecord( selectedRecordIdx )
			if slotWnd and slotWnd:IsChildOf( self ) then
				self:MoveChildToLastPosition( slotWnd )
			end

    	end

	end

end


--
function UI.ShipSelection_ShipsListWnd:UpdateTutorialTipsForSelShipType()

	if not UI.ShipSelection_TutorialTipsWnd or not UI.ShipSelection_TutorialTipsWnd.w or not UI.ShipSelection_TutorialTipsWnd:IsChildOf( self ) then
		return
	end

	local shipType = -1

	local selectedRecordIdx = self:GetSelectedRecord()
	if selectedRecordIdx ~= -1 then
		local data = self:GetRecordData( selectedRecordIdx )
		if data.shipInfo then
			shipType = UI:GetItemShipType( data.shipInfo.baseDef )
		end
	end

	UI.ShipSelection_TutorialTipsWnd:UpdateForShipType( shipType )

end



--
function UI.ShipSelection_ShipsListWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateTutorialTipsPos()
	end

end


--
function UI.ShipSelection_ShipsListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateTutorialTipsPos()

end


--
function UI.ShipSelection_ShipsListWnd:UpdateTutorialTipsPos()

	if not self:IsOnScreen() then
		return
	end

	if not UI.ShipSelection_TutorialTipsWnd or not UI.ShipSelection_TutorialTipsWnd.w or not UI.ShipSelection_TutorialTipsWnd:IsChildOf( self ) then
		return
	end

	UI.ShipSelection_TutorialTipsWnd:SetLeft( self:XToWindow( 0 ) )
	UI.ShipSelection_TutorialTipsWnd:SetTop( self:YToWindow( 0 ) )
	UI.ShipSelection_TutorialTipsWnd:UpdateEffects()

end


-- ------------------------------
-- const
-- ------------------------------

ssl.listStyle =	UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

ssl.btnPrototypeName = "ShipSelection_ShipSlotWnd"

ssl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

ssl.MAX_SLOTS = 4


-- ---------------------------------------------------------
-- UI.ShipSelection_ShipSlotWnd
-- ---------------------------------------------------------

UI.ShipSelection_ShipSlotWnd = {}
local sss = UI.ShipSelection_ShipSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipSelection_ShipSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipSelection_ShipSlotWnd",
		isPrototype	= true,
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipSelection_ShipSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.shipIcoWnd:Reset()

end


--
function UI.ShipSelection_ShipSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	local data = self:GetRecordData()
	self:UpdateIcoAnimation( data )

end


--
function UI.ShipSelection_ShipSlotWnd:OnAccountRankChanged()
	
	self:UpdateIco( self:GetRecordData() )
	
end


-- ------------------------------
-- vars
-- ------------------------------

UI.ShipSelection_ShipSlotWnd.shipIcoWnd = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipSelection_ShipSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.shipIcoWnd = UI:CreateChildWnd( self, UI.ShipIcoWnd, "" )
	self:AddChild( self.shipIcoWnd )
	self:SetWidth( self.shipIcoWnd:GetWidth() )
	self:SetHeight( self.shipIcoWnd:GetHeight() )

	self:Reset()

end


--
function UI.ShipSelection_ShipSlotWnd:UpdateForData( data, bAnimated )

	self:UpdateIco( data )
	self:UpdateIcoAnimation( data )
	self:UpdateStatus( data )
	self:UpdateMouseOverEnable( data )

end


--
function UI.ShipSelection_ShipSlotWnd:UpdateIco( data )

	local bCanShowTooltip = true
	if _G.MasterServer_IsConnected() then
		if UI.rankLocks.inGameShipsInfo ~= -1 and UI:GetPlayerAccountRank() < UI.rankLocks.inGameShipsInfo then
			bCanShowTooltip = false
		end
	end

	local icoData =
	{
		shipInfo		= data.shipInfo,
		playerId		= UI.HudWnd.localPlayerId,
		playerUid		= UI:GetLocalPlayerUid(),
		tooltipLogEvent	= _G.MasterServer.PlayerAction.PA_VESSEL_TOOLTIP_BATTLE,
		bDisableTooltip	= not bCanShowTooltip,
	}

	self.shipIcoWnd:Setup( data.shipInfo.baseDef, icoData )	

end


--
function UI.ShipSelection_ShipSlotWnd:UpdateIcoAnimation( data )

	if self:IsSelected() then
		self.shipIcoWnd:AnimateBgSelect()
	else
		self.shipIcoWnd:AnimateBgIdle()
	end

end


--
function UI.ShipSelection_ShipSlotWnd:UpdateStatus( data )

	local status = -1
	if data and data.shipInfo then
		status = _G.CL_GetHangarStatus( UI.HudWnd.localPlayerId, data.shipInfo.hangarIdx )
	end

	if status == ai.HangarStatus.KILLED then

		local text = UI:GetStringByName( "shipDestroyed" )
		self.shipIcoWnd:ShowStatus( text )

	elseif status == ai.HangarStatus.DISABLED then

		local statusColor = self.shipIcoWnd:GetStatusColor()
		local text = string.format( "$link [type CUSTOM_TEXT][params {textId=\"shipDisabled\", tooltipTextId=\"shipSelection_shipDisabled_tooltipText\", tooltipCaptionId=\"shipSelection_shipDisabled_tooltipCaption\", colorSel=%u, colorUnsel=%u}]$", statusColor, statusColor )
		self.shipIcoWnd:ShowStatus( text )

	elseif status == ai.HangarStatus.SUSPENDED then

		local text = UI:GetStringByName( "shipDisabled" )
		self.shipIcoWnd:ShowStatus( text )

	else
		self.shipIcoWnd:HideStatus()
	end

end


--
function UI.ShipSelection_ShipSlotWnd:UpdateMouseOverEnable( data )

	local status = _G.CL_GetHangarStatus( UI.HudWnd.localPlayerId, data.shipInfo.hangarIdx )
	local bEnable = status ~= ai.HangarStatus.KILLED and status ~= ai.HangarStatus.DISABLED and status ~= ai.HangarStatus.SUSPENDED

	self.shipIcoWnd:EnableMouseOver( bEnable )

end


-- ---------------------------------------------------------
-- UI.ShipSelection_ShipsBigListWnd
-- ---------------------------------------------------------

UI.ShipSelection_ShipsBigListWnd = {}
local ssbl = UI.ShipSelection_ShipsBigListWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipSelection_ShipsBigListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name			= "ShipSelection_ShipsBigListWnd",
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
				defName 			= "shipSelection_shipsList2",
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
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipSelection_ShipsBigListWnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	--self:HideTutorialTips()

end


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipSelection_ShipsBigListWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )
	self:ArrangeChildren()

end


--
function UI.ShipSelection_ShipsBigListWnd:SelectRecordInternal( recordIdx, bAnimated )

	UI.ButtonsListWnd.SelectRecordInternal( self, recordIdx, bAnimated )

	self:ArrangeChildren()
end


--
function UI.ShipSelection_ShipsBigListWnd:ArrangeChildren()
end


--
function UI.ShipSelection_ShipsBigListWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

end


--
function UI.ShipSelection_ShipsBigListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

end


-- ------------------------------
-- const
-- ------------------------------

ssbl.listStyle =	UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

ssbl.btnPrototypeName = "ShipSelection_ShipBLSlotWnd"

ssbl.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

ssbl.MAX_SLOTS = 8

-- ---------------------------------------------------------
-- UI.ShipSelection_ShipBLSlotWnd
-- ---------------------------------------------------------

UI.ShipSelection_ShipBLSlotWnd = {}
local sssbl = UI.ShipSelection_ShipBLSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipSelection_ShipBLSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipSelection_ShipBLSlotWnd",
		isPrototype	= true,
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipSelection_ShipBLSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.shipIcoWnd:Reset()

end


--
function UI.ShipSelection_ShipBLSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	local data = self:GetRecordData()
	self:UpdateIcoAnimation( data )

end


-- ------------------------------
-- vars
-- ------------------------------

UI.ShipSelection_ShipBLSlotWnd.shipIcoWnd = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipSelection_ShipBLSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.shipIcoWnd = UI:CreateChildWnd( self, UI.ShipIcoWnd, "" )
	self:AddChild( self.shipIcoWnd )
	self:SetWidth( self.shipIcoWnd:GetWidth() )
	self:SetHeight( self.shipIcoWnd:GetHeight() )

	self:Reset()

end


--
function UI.ShipSelection_ShipBLSlotWnd:UpdateForData( data, bAnimated )

	self:UpdateIco( data )
	self:UpdateIcoAnimation( data )
	self:UpdateStatus( data )
	self:UpdateMouseOverEnable( data )

end


--
function UI.ShipSelection_ShipBLSlotWnd:UpdateIco( data )

	local bCanShowTooltip = true
	if _G.MasterServer_IsConnected() then
		if UI.rankLocks.inGameShipsInfo ~= -1 and UI:GetPlayerAccountRank() < UI.rankLocks.inGameShipsInfo then
			bCanShowTooltip = false
		end
	end

	local icoData =
	{
		shipInfo		= data.shipInfo,
		playerId		= UI.HudWnd.localPlayerId,
		playerUid		= UI:GetLocalPlayerUid(),
		tooltipLogEvent	= _G.MasterServer.PlayerAction.PA_VESSEL_TOOLTIP_BATTLE,
		bDisableTooltip	= not bCanShowTooltip,
	}

	self.shipIcoWnd:Setup( data.shipInfo.baseDef, icoData )	

end


--
function UI.ShipSelection_ShipBLSlotWnd:UpdateIcoAnimation( data )

	if self:IsSelected() then
		self.shipIcoWnd:AnimateBgSelect()
	else
		self.shipIcoWnd:AnimateBgIdle()
	end

end


--
function UI.ShipSelection_ShipBLSlotWnd:UpdateStatus( data )

	local status = -1
	if data and data.shipInfo then
		status = _G.CL_GetWarehouseSlotStatus( UI.HudWnd.localPlayerId, data.shipInfo.slotIdx )
	end

	if status == ai.HangarStatus.KILLED then

		local text = UI:GetStringByName( "shipDestroyed" )
		self.shipIcoWnd:ShowStatus( text )

	elseif status == ai.HangarStatus.DISABLED then

		local statusColor = self.shipIcoWnd:GetStatusColor()
		local text = string.format( "$link [type CUSTOM_TEXT][params {textId=\"shipDisabled\", tooltipTextId=\"shipSelection_shipDisabled_tooltipText\", tooltipCaptionId=\"shipSelection_shipDisabled_tooltipCaption\", colorSel=%u, colorUnsel=%u}]$", statusColor, statusColor )
		self.shipIcoWnd:ShowStatus( text )

	elseif status == ai.HangarStatus.SUSPENDED then

		local text = UI:GetStringByName( "shipDisabled" )
		self.shipIcoWnd:ShowStatus( text )
	elseif status == ai.HangarStatus.TAKEN then

		local text = UI:GetStringByName( "shipTaken" )
		self.shipIcoWnd:ShowStatus( text )
	elseif status == ai.HangarStatus.YOURS then

		local text = UI:GetStringByName( "shipYours" )
		self.shipIcoWnd:ShowStatus( text )
	else
		self.shipIcoWnd:HideStatus()
	end

end


--
function UI.ShipSelection_ShipBLSlotWnd:UpdateMouseOverEnable( data )

	local status = _G.CL_GetWarehouseSlotStatus( UI.HudWnd.localPlayerId, data.shipInfo.slotIdx )
	local bEnable = status ~= ai.HangarStatus.KILLED and status ~= ai.HangarStatus.DISABLED and status ~= ai.HangarStatus.SUSPENDED
		and status ~= ai.HangarStatus.TAKEN

	self.shipIcoWnd:EnableMouseOver( bEnable )

end


-- -----------------------------------------------------------------------------
-- UI.ShipSelection_SpectateBtn
-- -----------------------------------------------------------------------------

local l_baseBtnNumLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.ShipSelection_SpectateBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "ShipSelection_SpectateBtn",
			selectSound	= UI.sounds.btnMouseOver,
    	},		

    	layers =
    	{
			numLayers = l_baseBtnNumLayers + 1,

    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,

    			effects =
    			{{
    				defName 			= "shipSelection_spectateBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "value",
    						layer		= "UI.ShipSelection_SpectateBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},

    		-- TEXT
    		{
    			id			= l_baseBtnNumLayers,

    			layerType	= UI.LAYER_TEXT,

       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
    			text = "^shipSelection_spectate",
    		},
		}
	},

    layers =
    {
    	MAIN_EFFECT		= 0,
    	DEBUG			= 1,
    	TEXT			= 2,
    },

    effectInfo =
    {
    	main =
    	{
    		animationIdle 		= "select",
    		animationSelect		= "over_select",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},
    }
}  


-- -------------------------------------------------------------------
-- UI.ShipSelection_TutorialTipsWnd
-- -------------------------------------------------------------------

UI.ShipSelection_TutorialTipsWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.ShipSelection_TutorialTipsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipSelection_TutorialTipsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		rectAbs	= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "shipSelection_tutorialTip_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.ShipSelection_TutorialTipsWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",
						layer		= "UI.ShipSelection_TutorialTipsWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipSelection_tutorialTip_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_1",
						layer		= "UI.ShipSelection_TutorialTipsWnd.layers.TIP_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",
						layer		= "UI.ShipSelection_TutorialTipsWnd.layers.TIP_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},   

		-- TIP_1
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^shipSelection_tutorialTip1",
		},

		-- TIP_2
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.ShipSelection_TutorialTipsWnd:UpdateForShipType( shipType )

	local str = ""

	if shipType ~= -1 then

    	local shipName = UI:ShipType2Str( shipType )

    	str = UI:GetStringByName( "shipSelection_tutorialTip2" )
    	str = string.format( str, shipName )

	end

	self:SetText( str, self.layers.TIP_2 )

end


--
function UI.ShipSelection_TutorialTipsWnd:Reset()

	self:SetText( "", self.layers.TIP_2 )

end


--
function UI.ShipSelection_TutorialTipsWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ----------------------------
-- const
-- ----------------------------

UI.ShipSelection_TutorialTipsWnd.layers =
{
	MAIN_EFFECT	= 0,
	BG_EFFECT	= 1,
	WORK_EFFECT	= 2,
	TIP_1		= 3,
	TIP_2		= 4,
}

-- ----------------------------
-- work functions
-- ----------------------------

--
function UI.ShipSelection_TutorialTipsWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( 0, 0, 1024, 768 ) )
	
end


-- -------------------------------------------------------------------------
-- UI.ShipSelection_ModulesWnd
-- -------------------------------------------------------------------------

UI.ShipSelection_ModulesWnd = {}
local sm = UI.ShipSelection_ModulesWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipSelection_ModulesWnd.def =
{
	className	= "Wnd",
	prototype	= "ModulesWnd",

	props =
	{
		name	= "ShipSelection_ModulesWnd",
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipSelection_ModulesWnd:Setup( shipInfo )

	self:Reset()

	self.shipInfo = shipInfo

	self:FullUpdate()

end


--
function UI.ShipSelection_ModulesWnd:OnBindsChanged()

	self:Setup( self.shipInfo )

end


-- ------------------------------
-- vars
-- ------------------------------

UI.ShipSelection_ModulesWnd.shipInfo		= nil
UI.ShipSelection_ModulesWnd.rocketSlot		= nil
UI.ShipSelection_ModulesWnd.moduleSlots		= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipSelection_ModulesWnd:Reset()

	UI.ModulesWnd.Reset( self )

	self.shipInfo		= nil
	self.rocketSlot		= nil
	self.moduleSlots	= {}

end


--
function UI.ShipSelection_ModulesWnd:FullUpdate()

	if not self.shipInfo then
		return
	end

	self:UpdateWeapon()
	self:UpdateSecondaryAmmo()
	self:UpdateModules()
	self:UpdateSpecailModule()

	self:UpdateCooldowns()

end


--
function UI.ShipSelection_ModulesWnd:UpdateWeapon()

	local moduleVarName = string.format( "module%d", ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
	local moduleDefName = self.shipInfo[ moduleVarName ]

	if not UI:IsStrEmpty( moduleDefName ) then

		local slotWnd = self:GetFreeSlot()
		self:ShowSlot( slotWnd, self.effectInfo.main.slotLocators_WEAPON.locator )

		slotWnd:ShowIco( moduleDefName )
		slotWnd:AnimateIcoActive()

		local color = UI:GetItemColor( moduleDefName )
		local enchantVarName = string.format( "ench%d", ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
		local bEnchanted = UI:IsTrueEx( self.shipInfo[ enchantVarName ] )
		slotWnd:ShowColorBg2( color, bEnchanted )	
		slotWnd:ShowInfluenceColor( UI:GetItemInfluenceColor( moduleDefName ) )

		local tooltipData			= {}
		tooltipData.tooltipType		= UI.tooltipTypes.MODULE
		tooltipData.defName			= moduleDefName
		tooltipData.dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForShipInfo( self.shipInfo, UI.HudWnd.localPlayerId, ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
		tooltipData.bEnchanted		= bEnchanted

		slotWnd:SetTooltipData( tooltipData )

	end

end


--
function UI.ShipSelection_ModulesWnd:UpdateSecondaryAmmo()

	local varName = string.format( "munition%d", ai.MunitionBayType.MBT_SECONDARY )
	local ammoDefName = self.shipInfo[ varName ]	

	if not UI:IsStrEmpty( ammoDefName ) then

		local slotWnd = self:GetFreeSlot()
		self:ShowSlot( slotWnd, self.effectInfo.main.slotLocators_ROCKETS.locator )
		self.rocketSlot = slotWnd

		slotWnd:ShowIco( ammoDefName )
		slotWnd:AnimateIcoActive()

		local color = UI:GetItemColor( ammoDefName )
		slotWnd:ShowColorBg2( color, false )	
		slotWnd:ShowInfluenceColor( UI:GetItemInfluenceColor( ammoDefName ) )

		local tooltipData			= {}
		tooltipData.tooltipType		= UI.tooltipTypes.MODULE
		tooltipData.defName			= ammoDefName
		tooltipData.dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForShipInfo( self.shipInfo, UI.HudWnd.localPlayerId, ai.MunitionBayType.MBT_SECONDARY )

		slotWnd:SetTooltipData( tooltipData )

	end

end       


--
function UI.ShipSelection_ModulesWnd:UpdateModules()

	local moduleSlots = {}
	local locatorIdx = 1

	for moduleSlotId = ai.SpaceShipModuleSlot.ACTIVE_01, ai.SpaceShipModuleSlot.ACTIVE_04 do

		local bHasSlot = UI:HasShipModuleSlotByShipInfo( self.shipInfo, moduleSlotId )
		if bHasSlot then

    		local moduleVarName = string.format( "module%d", moduleSlotId )
    		local moduleDefName = self.shipInfo[ moduleVarName ]

			local slotWnd = self:GetFreeSlot()

			local locator = string.format( "%s%d", self.effectInfo.main.slotLocators_MODULE.locatorPrefix, locatorIdx )
			self:ShowSlot( slotWnd, locator )

			self.moduleSlots[ moduleSlotId ] = slotWnd
    		table.insert( moduleSlots, slotWnd )

    		if not UI:IsStrEmpty( moduleDefName ) then

    			slotWnd:SetKey( UI:GetModuleKey( moduleSlotId ) )
    			slotWnd:ShowKey()
    			slotWnd:AnimateKeyInactive()

    			slotWnd:ShowIco( moduleDefName )
    			slotWnd:AnimateIcoActive()

        		local color = UI:GetItemColor( moduleDefName )
        		local enchantVarName = string.format( "ench%d", moduleSlotId )
        		local bEnchanted = UI:IsTrueEx( self.shipInfo[ enchantVarName ] )
        		slotWnd:ShowColorBg2( color, bEnchanted )	
				slotWnd:ShowInfluenceColor( UI:GetItemInfluenceColor( moduleDefName ) )

    			local tooltipData			= {}
    			tooltipData.tooltipType		= UI.tooltipTypes.MODULE
    			tooltipData.defName			= moduleDefName
    			tooltipData.dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForShipInfo( self.shipInfo, UI.HudWnd.localPlayerId, moduleSlotId )
				tooltipData.bEnchanted		= bEnchanted

    			slotWnd:SetTooltipData( tooltipData )

			else

				slotWnd:SetEmpty()

				slotWnd:SetKey( UI:GetModuleKey( moduleSlotId ) )
				slotWnd:ShowKey()
    			slotWnd:AnimateKeyInactive()

			end

    		locatorIdx = locatorIdx + 1

		end

	end	

end        


--
function UI.ShipSelection_ModulesWnd:UpdateSpecailModule()

	local moduleVarName = string.format( "module%d", ai.SpaceShipModuleSlot.SPECIAL )
	local moduleDefName = self.shipInfo[ moduleVarName ]

	if not UI:IsStrEmpty( moduleDefName ) then

		local slotWnd = self.specSlot
		self:ShowSlot( slotWnd, self.effectInfo.main.slotLocators_SPECIAL.locator )

		slotWnd:SetKey( UI:GetModuleKey( ai.SpaceShipModuleSlot.SPECIAL ) )
		slotWnd:ShowKey()
		slotWnd:AnimateKeyInactive()

		slotWnd:ShowIco( moduleDefName )
		slotWnd:AnimateIcoActive()

    	local tooltipData			= {}
    	tooltipData.tooltipType		= UI.tooltipTypes.MODULE
    	tooltipData.defName 		= moduleDefName
		tooltipData.dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForShipInfo( self.shipInfo, UI.HudWnd.localPlayerId, ai.SpaceShipModuleSlot.SPECIAL )

		slotWnd:SetTooltipData( tooltipData )

	end

end    


--
function UI.ShipSelection_ModulesWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateCooldowns()

end


--
function UI.ShipSelection_ModulesWnd:UpdateCooldowns()

	-- ракеты

	if self.rocketSlot then
		self:UpdateSlotCooldowns( self.rocketSlot, ai.SpaceShipModuleSlot.SECONDARY_WEAPON )
	end
	
	-- активные модули

	for moduleSlotId, moduleSlotWnd in pairs( self.moduleSlots ) do
		self:UpdateSlotCooldowns( moduleSlotWnd, moduleSlotId )
	end

	-- сецмодуль

	if self.specSlot:IsChildOf( self ) then
		self:UpdateSlotCooldowns( self.specSlot, ai.SpaceShipModuleSlot.SPECIAL )
	end

end


--
function UI.ShipSelection_ModulesWnd:UpdateSlotCooldowns( slotWnd, slotId )

	if self.shipInfo.hangarIdx == nil then
		return
	end

	local playerIdx = UI.HudWnd.localPlayerId

	-- кулдаун

    local cooldownVal, cooldownMax = _G.CL_GetSavedCooldownForModule( playerIdx, self.shipInfo.hangarIdx, slotId )

 	local fixedCooldownVal		= cooldownVal > 0 and math.ceil( cooldownVal ) or -1
	local fixedCooldownVal_old	= slotWnd:GetCooldownTime()

	if fixedCooldownVal ~= fixedCooldownVal_old then

     	if fixedCooldownVal ~= -1 then	-- сравнивается на -1, а не на 0, т.к. 0, который был получен в результате округления во время кулдауна, может отображаться
     		slotWnd:ShowCooldownTime( fixedCooldownVal )
     	else
     		slotWnd:HideCooldownTime()
     		slotWnd:ShowFlash()
     	end

	end


	-- количество зарядов

	local ammo = _G.CL_GetSavedAmmoForModule( playerIdx, self.shipInfo.hangarIdx, slotId )

	local ammoOld = slotWnd:GetAmmoCount()
	if ammo ~= ammoOld then

		if ammo ~= -1 then
			slotWnd:ShowAmmoCount( ammo )
		else
			slotWnd:HideAmmoCount()
		end

	end


	-- перезарядка

	local reloadVal = _G.CL_GetSavedAmmoRegenForModule( playerIdx, self.shipInfo.hangarIdx, slotId )

	if reloadVal > 0 then
		slotWnd:ShowAmmoReload( reloadVal )
	else
		slotWnd:HideAmmoReload()
	end


	-- затемнение иконки

	local bActive = cooldownVal == 0

	if bActive then
		slotWnd:AnimateIcoActive()
	else
		slotWnd:AnimateIcoInactive()
	end

end


-- ---------------------------------------------------------------
-- UI.ShipSelection_UnlimPveMissionLevelCb
-- ---------------------------------------------------------------

UI.ShipSelection_UnlimPveMissionLevelCb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",
	
		props =
		{
			name	= "ShipSelection_UnlimPveMissionLevelCb"
		}
	},
	
	MAX_VISIBLE_RECORDS = 4,
}

-- ---------------------------------------------------------------
-- UI.ShipSelection_UnlimPveMissionLevelInfoIco
-- ---------------------------------------------------------------

UI.ShipSelection_UnlimPveMissionLevelInfoIco = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipSelection_UnlimPveMissionLevelInfoIco.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipSelection_UnlimPveMissionLevelInfoIco",
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

-- ------------------------------
-- interface funcitons
-- ------------------------------

--
function UI.ShipSelection_UnlimPveMissionLevelInfoIco:GetTooltipData()

	return self.tooltipData 

end


--
function UI.ShipSelection_UnlimPveMissionLevelInfoIco:SetupForUnlimPve()

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "shipSelection_missionLevelsCombobox_tooltipCaption" ),
		text		= UI:GetStringByName( "shipSelection_missionLevelsCombobox_tooltipText" ),
	}
	
end


--
function UI.ShipSelection_UnlimPveMissionLevelInfoIco:SetupForWavePve()

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "shipSelection_missionLevelsCombobox_tooltipCaption_wave" ),
		text		= UI:GetStringByName( "shipSelection_missionLevelsCombobox_tooltipText_wave" ),
	}

end


--
function UI.ShipSelection_UnlimPveMissionLevelInfoIco:Reset()

	self.tooltipData = nil
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipSelection_UnlimPveMissionLevelInfoIco.tooltipData = nil