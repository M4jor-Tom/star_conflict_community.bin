-- -----------------------------------------------------------------------------------------
-- UI.BattlePassWnd
-- -----------------------------------------------------------------------------------------

UI.BattlePassWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

--
UI.BattlePassWnd.layers =
{
	MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
	WORK_EFFECT		= 2,
	WORK_2_EFFECT	= 3,
	STAGE_END_TIME	= 4,
	WAIT_EFFECT		= 5,
	WAIT_TEXT		= 6,
}

--
UI.BattlePassWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",
	
	props =
	{
		name	= "BattlePassWnd"
	},
	
	layers =
	{
		firstOverlayLayer = UI.BattlePassWnd.layers.WAIT_EFFECT,
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "profile_new",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "bg",
						layer		= "UI.BattlePassWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "nick_name2",
						layer		= "UI.BattlePassWnd.layers.WORK_EFFECT",
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
				defName 			= "profile_bg_new",
				defaultAnimation	= "idle",
			}}
		},
		
		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "battlePass_work",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "banner",
						layer		= "UI.BattlePassWnd.layers.WORK_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bookmark",
						wnd			= "UI.BattlePass_TabsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "list",
						wnd			= "UI.BattlePass_LevelsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bp_btn2_3",
						wnd			= "UI.BattlePass_BuyPremiumDlcBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bp_btn2_4",
						wnd			= "UI.BattlePass_BuyPremiumDlcBtn_vip",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bp_btn2_5",
						wnd			= "UI.BattlePass_BuyUnlockLevelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bp_btn2_2",
						wnd			= "UI.BattlePass_UnlockLevelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn_x",
						wnd			= "UI.BattlePass_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "loading",
						layer		= "UI.BattlePassWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

				}
			}}
		},
		
		-- WORK_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "battlePass_work2",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "text21",
						layer		= "UI.BattlePassWnd.layers.STAGE_END_TIME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "bp_btn7",
						wnd			= "UI.BattlePass_GoToShipBtn_1",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bp_btn8",
						wnd			= "UI.BattlePass_GoToShipBtn_2",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- STAGE_END_TIME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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
						layer		= "UI.BattlePassWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= "^hangar_loading"
		},
	},
	
	children =
	{
		"UI.BattlePass_TabsListWnd",
		"UI.BattlePass_LevelsListWnd",
		"UI.BattlePass_GoToShipBtn_1",
		"UI.BattlePass_GoToShipBtn_2",
		"UI.BattlePass_BuyPremiumDlcBtn",
		"UI.BattlePass_BuyPremiumDlcBtn_vip",
		"UI.BattlePass_BuyUnlockLevelBtn",
		"UI.BattlePass_UnlockLevelBtn",
		"UI.BattlePass_CrossBtn",
	}
}

-- --------------------------------------
-- interface funtions
-- --------------------------------------

--
function UI.BattlePassWnd:SetLaunchData( launchData )
	
	if not self:IsOnScreen() then
		sys.log( "UI.BattlePassWnd:SetLaunchData()[ERROR]: not on screen" )
		return
	end
	
	self.launchData = launchData

end


--
function UI.BattlePassWnd:GetLaunchData()

	return self.launchData

end


--
function UI.BattlePassWnd:GetSelStage()

	return self.selStage

end


--
function UI.BattlePassWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.unlockLevelRequestId = 0
	self:UpdateWaitEffect()

end


--
function UI.BattlePassWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.BattlePass_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	
	if result == 0 and self:IsOnScreen() then
		self:UpdateUnlockLevelBtn()
	end
	
end


--
function UI.BattlePassWnd:MasterServer_OnBattlePassUnlockLevel( result, requestId, param1, param2, u64Param )
	
	if result == _G.MasterServer.BattlePassResult.BPR_OK then
	
		if self:IsOnScreen() then
		
			local stage = param1
			
			if stage == self.selStage then
				self.levelsListWnd:OnBattlePassUnlockLevel()
				self:UpdateBuyUnlockLevelDlcBtns()
				self:UpdateUnlockLevelBtn()
			end
			
		end

	else
	
		if requestId == self.unlockLevelRequestId then
			self:ShowMsgOnUnlockLevelError( result )
		end
	
	end
	
	if requestId == self.unlockLevelRequestId then
		self.unlockLevelRequestId = 0
		self:UpdateWaitEffect()
	end
	
end


--
function UI.BattlePassWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )
	
	if result == _G.MasterServer.BattlePassResult.BPR_OK and self:IsOnScreen() then
		self.levelsListWnd:OnBattlePassUnlockPremium()
		self:UpdateBuyPremiumDlcBtns()
		self:UpdateUnlockLevelBtn()	-- SC-112463 одновременно с покупкой премиума может быть и разлок уровня
		self:UpdateBuyUnlockLevelDlcBtns()
	end
	
end


--
function UI.BattlePassWnd:MasterServer_OnBattlePassActivation( result, requestId, param1, param2, u64Param )
	
	if result == 0 and self:IsOnScreen() then
		
		if not _G.MasterServer_BattlePassIsActive() then
			self:Close()
		else
			self:FullUpdate( true )
		end
		
	end
	
end


--
function UI.BattlePassWnd:GetRestoreStateData()
	
	if not self:IsOnScreen() then
		return nil
	end
	
	local restoreData = {}
	restoreData.selStage = self.selStage
	restoreData.levelsScrollPos = self.levelsListWnd:GetScrollPos()
	 
	return restoreData
	
end


--
function UI.BattlePassWnd:RestoreState( restoreData )
	
	if not self:IsOnScreen() then
		sys.log( "UI.BattlePassWnd:RestoreState()[ERROR]: not on screen" )
		return
	end
	
	if not restoreData then
		return
	end
	
	if restoreData.selStage ~= -1 then
	
		local activStages = UI:GetBattlePassActiveStages()
		
		local bStageFound = false
		for stageIdx, stage in pairs( activStages ) do
			if stage == restoreData.selStage then
				bStageFound = true
				break
			end
		end
		
		if bStageFound then
			self:SelectStage( restoreData.selStage )
			self.levelsListWnd:SetScrollPos( restoreData.levelsScrollPos )
		end
		
	end
	
end


--
function UI.BattlePassWnd:OnBuyWndResult( result, mode, data )

	if not result then
		return
	end
	
	if mode == UI.BuyWnd.modes.BATTLE_PASS_UNLOCK_LEVEL then
		self:DoUnlockLevel( data.stage )
	else
		sys.log( "UI.BattlePassWnd:OnBuyWndResult()[ERROR]: unhandled mode %s", tostring( mode ) )
	end

end


-- --------------------------------------
-- const
-- --------------------------------------

UI.BattlePassWnd.effectInfo =
{
	work =
	{
		dlcBtnLocators = { "bp_btn2_3", "bp_btn2_4" },
		unlockLevelDlcBtnLocators = { "bp_btn2_5" },
	},
	
	work2 =
	{
		bannerSpriteName	= "ico",
		goToShipBtnLocators	= { "bp_btn7", "bp_btn8" },
	}
}

UI.BattlePassWnd.strStageEndTime = UI:GetStringByName( "battlePass_stageTimeLeft" )

-- --------------------------------------
-- vars
-- --------------------------------------

UI.BattlePassWnd.launchData				= nil

UI.BattlePassWnd.tabsListWnd			= nil
UI.BattlePassWnd.levelsListWnd			= nil
UI.BattlePassWnd.goToShipBtn_1			= nil
UI.BattlePassWnd.goToShipBtn_2			= nil
UI.BattlePassWnd.buyPremiumDlcBtn		= nil
UI.BattlePassWnd.buyPremiumDlcBtn_vip	= nil
UI.BattlePassWnd.buyUnlockLevelBtn		= nil
UI.BattlePassWnd.unlockLevelBtn			= nil
UI.BattlePassWnd.crossBtn				= nil
	
UI.BattlePassWnd.selStage				= -1
UI.BattlePassWnd.selStageTimeLeft		= -1
UI.BattlePassWnd.unlockLevelRequestId	= 0

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.BattlePassWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )
	
	self.tabsListWnd			= UI.BattlePass_TabsListWnd
	self.levelsListWnd			= UI.BattlePass_LevelsListWnd
	self.goToShipBtn_1			= UI.BattlePass_GoToShipBtn_1
	self.goToShipBtn_2			= UI.BattlePass_GoToShipBtn_2
	self.buyPremiumDlcBtn		= UI.BattlePass_BuyPremiumDlcBtn
	self.buyPremiumDlcBtn_vip	= UI.BattlePass_BuyPremiumDlcBtn_vip
	self.buyUnlockLevelBtn		= UI.BattlePass_BuyUnlockLevelBtn
	self.unlockLevelBtn			= UI.BattlePass_UnlockLevelBtn
	self.crossBtn				= UI.BattlePass_CrossBtn
	
	self:UpdateWaitEffect()
	
end


--
function UI.BattlePassWnd:Reset()
	
	self.selStage			= -1
	self.selStageTimeLeft	= -1
	
	self.tabsListWnd:UnlinkFromParent()
	self.tabsListWnd:Clear()
	self.levelsListWnd:Clear()
	self.buyPremiumDlcBtn:UnlinkFromParent()
	self.buyPremiumDlcBtn_vip:UnlinkFromParent()
	self.buyUnlockLevelBtn:UnlinkFromParent()
	self.unlockLevelBtn:UnlinkFromParent()
	self.goToShipBtn_1:UnlinkFromParent()
	self.goToShipBtn_2:UnlinkFromParent()
	
	self:HideChildModals()

end


--
function UI.BattlePassWnd:FullUpdate( bSaveLayout )

	if bSaveLayout == nil then
		bSaveLayout = false
	end
	
	local restoreData = nil
	if bSaveLayout then
		restoreData = self:GetRestoreStateData()
	end

	self:Reset()
	
	self.tabsListWnd:UpdateStages()
	self:ValidateSelStage()	
	
	if bSaveLayout then
		self:RestoreState( restoreData )
	end
	
end


--
function UI.BattlePassWnd:ValidateSelStage()

	local selStage = self.selStage
	local activStages = UI:GetBattlePassActiveStages()
	
	if selStage ~= -1 then
		
		local bStageFound = false
		for stageIdx, stage in pairs( activStages ) do
			if stage == selStage then
				bStageFound = true
				break
			end
		end
		
		if not bStageFound then
			selStage = -1
		end
		
	end
	
	-- SC-111613 по умолчанию выбирается последний этап в списке
	if selStage == -1 then
		if next( activStages ) then
			table.sort( activStages )
			selStage = activStages[ #activStages ]
		end
	end
	
	self:SelectStage( selStage )

end


--
function UI.BattlePassWnd:UpdateBannerTexture()

	local texName = "battlePass_banner"
	if self.selStage > 1 then
		texName = string.format( "%s_%d", texName, self.selStage )
	end

	local work2Effect = UI:GetEffectFromLayer( self, self.layers.WORK_2_EFFECT )
	if work2Effect then
		work2Effect:SetSpriteTexture( self.effectInfo.work2.bannerSpriteName, UI:GetTex( texName ) )
	end

end


--
function UI.BattlePassWnd:SelectStage( stage )
	
	if self.selStage == stage then
		return
	end
	
	self.selStage = stage
	self:OnSelStageChanged()
	
end


--
function UI.BattlePassWnd:OnSelStageChanged()

	-- если этап только один, то закладки не показываются
	-- SC-111234#focus=streamItem-4-571675.0-0
	local activStages = UI:GetBattlePassActiveStages()
	if #activStages > 1 then
		self:AddChild( self.tabsListWnd )
		self.tabsListWnd:SelectStage( self.selStage )
	else
		self.tabsListWnd:UnlinkFromParent()
	end
	
	self.levelsListWnd:Update()
	self:UpdateStageEndTime()
	self:UpdateBuyPremiumDlcBtns()
	self:UpdateUnlockLevelBtn()
	self:UpdateBuyUnlockLevelDlcBtns()
	self:UpdateBannerTexture()
	self:UpdateGoToShipBtns()
	
	if UI.BattlePass_BuyWnd:IsOnScreen() and UI.BattlePass_BuyWnd:GetMode() == UI.BuyWnd.modes.BATTLE_PASS_UNLOCK_LEVEL then
		local data = UI.BattlePass_BuyWnd:GetData()
		if not data or data.stage ~= self.selStage then
			UI.BattlePass_BuyWnd:Hide()
		end
	end

end


--
function UI.BattlePassWnd:UpdateStageEndTime()
	
	local stageEndTime	= UI:GetBattlePassStageEndTime( self.selStage )
	local curTime		= _G.MasterServer_IsConnected() and _G.MasterServer_GetServerTime() or  UI.INVALID_U64_ID
	local timeLeftSec	= ( stageEndTime > curTime ) and ( ( stageEndTime - curTime ) * 0.001 ).l or 0
	
	if timeLeftSec ~= self.selStageTimeLeft then
	
		self.selStageTimeLeft = timeLeftSec
		
		local strTime = UI:Time2Str45( timeLeftSec )
		local str = string.format( "%s: %s", self.strStageEndTime, strTime )
		self:SetText( str, self.layers.STAGE_END_TIME )

	end
	
end


--
function UI.BattlePassWnd:UpdateBuyPremiumDlcBtns()

	self.buyPremiumDlcBtn:UnlinkFromParent()
	self.buyPremiumDlcBtn_vip:UnlinkFromParent()

	if UI:IsBattlePassPremiumUnlocked( self.selStage ) then
		return
	end
	
	local dlcName, dlcName_vip = UI:GetBattlePassPremiumDlcNames( self.selStage )
	
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	local locatorIdx = 1
	
	if dlcName ~= "" then
	
		local locator = self.effectInfo.work.dlcBtnLocators[ locatorIdx ]
		if not locator then
			sys.log( "UI.BattlePassWnd:UpdateBuyPremiumDlcBtns(): no locator for dlc btn" )
			locator = ""
		end
		
		UI:AddChildAndLink( self, self.buyPremiumDlcBtn, workEffect, locator, UI.EffectAnimParams.POS )
		
		locatorIdx = locatorIdx + 1
		
	end
	
	if dlcName_vip ~= "" then
	
		local locator = self.effectInfo.work.dlcBtnLocators[ locatorIdx ]
		if not locator then
			sys.log( "UI.BattlePassWnd:UpdateBuyPremiumDlcBtns(): no locator for vip dlc btn" )
			locator = ""
		end
		
		UI:AddChildAndLink( self, self.buyPremiumDlcBtn_vip, workEffect, locator, UI.EffectAnimParams.POS )
		
		locatorIdx = locatorIdx + 1
		
	end
	
end


--
function UI.BattlePassWnd:UpdateBuyUnlockLevelDlcBtns()

	self.buyUnlockLevelBtn:UnlinkFromParent()

	local numLevels = UI:GetBattlePassNumLevels( self.selStage )
	local unlockedLevel = UI:GetBattlePassUnlockedLevel( self.selStage )
	
	local bNeedBtn = numLevels > 0 and unlockedLevel < numLevels

	if not bNeedBtn or _G.GameStore_NeedHideBattlePassUnlockLevelBtn( self.selStage ) then
		return
	end
	
	local unlockLevelName = UI:GetBattleUnlockLevelDlcNames( self.selStage )
	
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	local locatorIdx = 1

	if unlockLevelName ~= "" then
	
		local locator = self.effectInfo.work.unlockLevelDlcBtnLocators[ locatorIdx ]
		if not locator then
			sys.log( "UI.BattlePassWnd:UpdateBuyUnlockLevelDlcBtns(): no locator for unlock level dlc btn" )
			locator = ""
		end
		
		UI:AddChildAndLink( self, self.buyUnlockLevelBtn, workEffect, locator, UI.EffectAnimParams.POS )
		
	end
	

end


--
function UI.BattlePassWnd:UpdateUnlockLevelBtn()
	
	local numLevels = UI:GetBattlePassNumLevels( self.selStage )
	local unlockedLevel = UI:GetBattlePassUnlockedLevel( self.selStage )
	
	local bNeedBtn = numLevels > 0 and unlockedLevel < numLevels
	if bNeedBtn then
	
		self:AddChild( self.unlockLevelBtn )
		
		local nextLevel = unlockedLevel ~= -1 and unlockedLevel + 1 or 1
		self.unlockLevelBtn:Setup( self.selStage, nextLevel )
		
	else
		self.unlockLevelBtn:UnlinkFromParent()
	end
	
end


--
function UI.BattlePassWnd:UpdateGoToShipBtns()
	
	local btns = { self.goToShipBtn_1, self.goToShipBtn_2 }
	for btnIdx, btn in pairs( btns ) do
		btn:UnlinkFromParent()
	end
	
	local ships = UI:GetBattlePassUiShips()	
	local work2Effect = UI:GetEffectFromLayer( self, self.layers.WORK_2_EFFECT )
	
	
	
	if self.selStage == 1 or self.selStage == 2 then -- кнопка корабля на этапов 1 и 2
		local btn = btns[ 1 ]
		if btn then
		
			local locator = self.effectInfo.work2.goToShipBtnLocators[ 1 ]
			if not locator then
				sys.log( "UI.BattlePassWnd:UpdateGoToShipBtns(): no locator for ship %d", 1 )
				locator = ""
			end
				
			UI:AddChildAndLink( self, btn, work2Effect, locator, UI.EffectAnimParams.POS )
				
			local strShipName = UI:GetEntityLocalizedNameByDef( ships[1], true )
			btn:SetBtnText( strShipName )
			
		else
			sys.log( "UI.BattlePassWnd:UpdateGoToShipBtns(): no btn for ship %d", 1 )
		end
	elseif self.selStage >= 3 then -- кнопка корабля для этапа 3
		local btn = btns[ 2 ]
		if btn then
		
		local locator = self.effectInfo.work2.goToShipBtnLocators[ 1 ]
			if not locator then
				sys.log( "UI.BattlePassWnd:UpdateGoToShipBtns(): no locator for ship %d", 2 )
				locator = ""
			end
				
			UI:AddChildAndLink( self, btn, work2Effect, locator, UI.EffectAnimParams.POS )
				
			local strShipName = UI:GetEntityLocalizedNameByDef( ships[2], true )
			btn:SetBtnText( strShipName )
		
		else
			sys.log( "UI.BattlePassWnd:UpdateGoToShipBtns(): no btn for ship %d", 2 )
		end
	end

end


--
function UI.BattlePassWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateStageEndTime()
	
end


--
function UI.BattlePassWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "BattlePass_TabSlotWnd" ) then
		
		local stage = wnd:GetRecordData().stage
		if stage ~= self.selStage then
			self:SelectStage( stage )
		end
	
	elseif wnd == self.goToShipBtn_1 then
		
		UI.HangarWnd:ShowShipPreview( UI:GetBattlePassUiShips()[ 1 ] )
		
	elseif wnd == self.goToShipBtn_2 then
		
		UI.HangarWnd:ShowShipPreview( UI:GetBattlePassUiShips()[ 2 ] )
		
	elseif wnd == self.buyPremiumDlcBtn then

		local dlcName, dlcName_vip = UI:GetBattlePassPremiumDlcNames( self.selStage )

		if _G.Arc_IsInitialized() then
			sys.log( "UI.BattlePassWnd:F_OnMouseLButtonDown()[ERROR]: cannot buy premium dlc on arc; not supported" )
		else
			UI:LaunchDlcLink( dlcName )
		end
		
	elseif wnd == self.buyPremiumDlcBtn_vip then

		local dlcName, dlcName_vip = UI:GetBattlePassPremiumDlcNames( self.selStage )

		if _G.Arc_IsInitialized() then
			sys.log( "UI.BattlePassWnd:F_OnMouseLButtonDown()[ERROR]: cannot buy premium dlc on arc; not supported" )
		else
			UI:LaunchDlcLink( dlcName_vip )
		end
		
	elseif wnd == self.buyUnlockLevelBtn then

		local unlockLevelName = UI:GetBattleUnlockLevelDlcNames( self.selStage )

		if _G.Arc_IsInitialized() then
			sys.log( "UI.BattlePassWnd:F_OnMouseLButtonDown()[ERROR]: cannot buy unlock level on arc; not supported" )
		else
			UI:LaunchDlcLink( unlockLevelName )
		end

	elseif wnd == self.unlockLevelBtn or wnd:IsChildOf( self.unlockLevelBtn ) then	-- чайлд - это цена в метатексте
		
		if not self:IsWaiting() then
			self:TryUnlockLevel()
		end
		
	elseif wnd == self.crossBtn then
		
		self:Close()
		
	end
	
	return true
	
end


--
function UI.BattlePassWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	-- скролл "съедается", чтобы нельзя было во время этого окна скроллировать сцену
	return true

end


--
function UI.BattlePassWnd:HandleEscape()

	self:Close()
	return true

end


--
function UI.BattlePassWnd:TryUnlockLevel()
	
	if self:IsWaiting() then
		sys.log( "UI.BattlePassWnd:TryUnlockLevel()[ERROR]: is waiting for another request" )
		return
	end
	
	self:LaunchBuyWnd( UI.BuyWnd.modes.BATTLE_PASS_UNLOCK_LEVEL, { stage = self.selStage } )
	
end


--
function UI.BattlePassWnd:DoUnlockLevel( stage )

	if self:IsWaiting() then
		sys.log( "UI.BattlePassWnd:DoUnlockLevel()[ERROR]: is waiting for another request" )
		return
	end
	
	self.unlockLevelRequestId = _G.MasterServer_BattlePassUnlockLevel( stage )
	if self.unlockLevelRequestId == 0 then
		self:ShowMsgOnUnlockLevelError( _G.MasterServer.BattlePassResult.BPR_ERROR )
	end
	
	self:UpdateWaitEffect()

end


--
function UI.BattlePassWnd:ShowMsgOnUnlockLevelError( result )

	UI:ShowErrorMsg( "battlePass_unlockLevel_error", result, "_G.MasterServer.BattlePassResult" )
	
end


--
function UI.BattlePassWnd:Close()

	local bHandled = false

	if self.launchData then
	
		if self.launchData.bPveMissions then
		
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, false, false )
			UI.HangarWnd:ShowPveWnd( true )
			bHandled = true
			
		else
			sys.log( "UI.BattlePassWnd:Close()[ERROR]: unhandled launchData" )
		end
	end

	if not bHandled then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	end

end


--
function UI.BattlePassWnd:LaunchBuyWnd( mode, data )

	UI.BattlePass_BuyWnd:Setup( mode, false, data )
	UI.BattlePass_BuyWnd:Show()
	UI:PlayGlobalSound( UI.sounds.btnClick )

end


--
function UI.BattlePassWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end
	
	UI.store.BattlePassWnd =
	{
		unlockLevelRequestId	= self.unlockLevelRequestId,
		launchData				= self.launchData,
	}
	
end


--
function UI.BattlePassWnd:F_OnEventRestoreUiState()

	if UI.store.BattlePassWnd then
	
		self.unlockLevelRequestId = UI.store.BattlePassWnd.unlockLevelRequestId
		self:UpdateWaitEffect()
		
		self.launchData = UI.store.BattlePassWnd.launchData
		
		UI.store.BattlePassWnd = nil
		
	end
	
end


--
function UI.BattlePassWnd:IsWaiting()

	return self.unlockLevelRequestId ~= 0

end


--
function UI.BattlePassWnd:UpdateWaitEffect()

	if self:IsWaiting() then
		self:ShowWaitEffect()
	else
		self:HideWaitEffect()
	end

end


--
function UI.BattlePassWnd:ShowWaitEffect()

	self:SetLayerVisible( true, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( true, self.layers.WAIT_TEXT )

end


--
function UI.BattlePassWnd:HideWaitEffect()

	self:SetLayerVisible( false, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( false, self.layers.WAIT_TEXT )

end


--
function UI.BattlePassWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		return
	end
	
	UI.BattlePass_BuyWnd:Hide()

end


--
function UI.BattlePassWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	self:HideChildModals()

end


--
function UI.BattlePassWnd:F_OnAfterShowOnScreen()

	self:RecalcLayoutForCurResolution()
	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )
	self.launchData = nil

end



--
function UI.BattlePassWnd:RecalcLayoutForCurResolution()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local selfSize = mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	self:SetWidth( selfSize.x )

	local selfHeight = UI.HangarWnd:GetBottomPanelY() - self:GetTop()
	self:SetHeight( selfHeight )
	
end


-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_TabsListWnd
-- -----------------------------------------------------------------------------------------

UI.BattlePass_TabsListWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.BattlePass_TabsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",
	
	props =
	{
		name	= "BattlePass_TabsListWnd",
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
				defName 			= "battlePass_tabsList",
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

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.BattlePass_TabsListWnd:UpdateStages()

	self:Clear()

	-- показываются только активные этапы
	local activStages = UI:GetBattlePassActiveStages()
	table.sort( activStages )
	
	for stageIdx, stage in ipairs( activStages ) do
		self:AddRecord( { stage = stage } )
	end
	
	self:RecalcLayout()

end


--
function UI.BattlePass_TabsListWnd:SelectStage( stage )

	local selRecordIdx = -1

	if stage ~= -1 then
		for recordIdx = 1, self:GetNumRecords() do
			if self:GetRecordData( recordIdx ).stage == stage then
				selRecordIdx = recordIdx
				break
			end
		end
	end

	self:SelectRecord( selRecordIdx )

end


-- --------------------------------------
-- const
-- --------------------------------------

UI.BattlePass_TabsListWnd.btnPrototypeName	= "BattlePass_TabSlotWnd"
UI.BattlePass_TabsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.BattlePass_TabsListWnd.MAX_SLOTS			= 5

UI.BattlePass_TabsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "bookmark_btn_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- --------------------------------------
-- vars
-- --------------------------------------

UI.BattlePass_TabsListWnd.slotsY		= 0
UI.BattlePass_TabsListWnd.space_slots	= 0
UI.BattlePass_TabsListWnd.slotWidth		= 0

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.BattlePass_TabsListWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )
	
	self:PrepareLayout()

end


--
function UI.BattlePass_TabsListWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end
	
	local slotWnd = self.slots[ 1 ].btn
	
	local firstSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) )
	local secondSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) )
	local slotWidth		= slotWnd and slotWnd:GetWidth()
	
	self.slotsY			= firstSlotPos.y
	self.space_slots	= secondSlotPos.x - ( firstSlotPos.x + slotWidth )
	self.slotWidth		= slotWidth

end


--
function UI.BattlePass_TabsListWnd:RecalcLayout()

	-- центрирование слотов по горизонтали
		
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	local numVisibleSlots = firstVisibleRecordIdx ~= -1 and ( lastVisibleRecordIdx - firstVisibleRecordIdx + 1 ) or 0
	
	if numVisibleSlots == 0 then
		return
	end
		
	local slotsWidth = numVisibleSlots * self.slotWidth + ( numVisibleSlots - 1 ) * self.space_slots
	local slotsX = ( self:GetWidth() - slotsWidth ) / 2
	
	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do
	
		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
		
			local x = slotsX + ( recordIdx - firstVisibleRecordIdx ) * ( self.slotWidth + self.space_slots )
			slotWnd:SetPos( x, self.slotsY )
			
		end
		
	end
	
end


-- в отличие от базовой версии в ButtonsListWnd, слот не линкуется к эффекту, вместо этого вызывается RecalcLayout()
function UI.BattlePass_TabsListWnd:ShowSlot( slot )

	self:AddChild( slot.btn )
	self:RecalcLayout()

end

-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_TabSlotWnd
-- -----------------------------------------------------------------------------------------

UI.BattlePass_TabSlotWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.BattlePass_TabSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",
	
	props =
	{
		name		= "BattlePass_TabSlotWnd",
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
				defName 			= "battlePass_tabSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "title",
						layer		= "UI.BattlePass_TabSlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "over",
						layer		= "UI.BattlePass_TabSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

				}
			}}
		},
		
		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "battlePass_tabSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.BattlePass_TabSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )
	
	self:SetText( "", self.layers.TEXT )
	self:SetMouseOver( false )

end


--
function UI.BattlePass_TabSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	
	self:UpdateMainAnimation()
	self:UpdateMouseOver()
	
end


-- --------------------------------------
-- const
-- --------------------------------------

UI.BattlePass_TabSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	TEXT				= 1,
	MOUSE_OVER_EFFECT	= 2,
}

UI.BattlePass_TabSlotWnd.effectInfo =
{
	main =
	{
		animSel		= "select",
		animUnsel	= "idle",
	}

}

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.BattlePass_TabSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()
	
	self:UpdateMainAnimation()
	self:UpdateText( data )
	self:UpdateMouseOver()

end


--
function UI.BattlePass_TabSlotWnd:UpdateMainAnimation()
	
	local anim = self:IsSelected() and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end	

end


--
function UI.BattlePass_TabSlotWnd:UpdateText( data )
	
	local str
	
	if data.stage < 3 then
		 str = UI:GetStringByName( "battlePass_stage" )
		
		local numSubst = 0
		str, numSubst = string.gsub( str, "%$num%$", tostring( data.stage ) )
	
	else 
		str = UI:GetStringByName( "battlePass_stage3" )
	end
	
	if numSubst == 0 then
		sys.log( "UI.BattlePass_TabSlotWnd:UpdateText()[ERROR]: cannot find placeholder '$num$' in string 'battlePass_stage'" )
		str = string.format( "[INVALID STRING] Stage %d", data.stage )
	end
	
	self:SetText( str, self.layers.TEXT )

end


--
function UI.BattlePass_TabSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if not self:IsSelected() then
		bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.BattlePass_TabSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.BattlePass_TabSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.BattlePass_TabSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.BattlePass_TabSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_LevelsListWnd
-- -----------------------------------------------------------------------------------------

UI.BattlePass_LevelsListWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.BattlePass_LevelsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd_HrzScroll",
	
	props =
	{
		name	= "BattlePass_LevelsListWnd",
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
				defName 			= "battlePass_levelsList",
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

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.BattlePass_LevelsListWnd:Update()

	self:Clear()

	local stage = self:GetSelStage()
	local numLevels = UI:GetBattlePassNumLevels( stage )
	
	for level = 1, numLevels do
		self:AddRecord( { level = level } )
	end
	
	self:CenterOnNextLevel()
	
end


--
function UI.BattlePass_LevelsListWnd:OnBattlePassUnlockLevel()
	
	for recordIdx = 1, self:GetNumRecords() do
		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnBattlePassUnlockLevel()
		end
	end
	
end


--
function UI.BattlePass_LevelsListWnd:OnBattlePassUnlockPremium()

	for recordIdx = 1, self:GetNumRecords() do
		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnBattlePassUnlockPremium()
		end
	end

end


-- --------------------------------------
-- const
-- --------------------------------------

UI.BattlePass_LevelsListWnd.btnPrototypeName		= "BattlePass_LevelSlotWnd"
UI.BattlePass_LevelsListWnd.scrollBarPrototypeName	= "EffectScrollWnd_Hrz_3"
UI.BattlePass_LevelsListWnd.listStyle				= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS
UI.BattlePass_LevelsListWnd.MAX_SLOTS				= 6

UI.BattlePass_LevelsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "bp_slot_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.BattlePass_LevelsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self:Scroll( ticks < 0 )
	end

	return true

end


--
function UI.BattlePass_LevelsListWnd:GetSelStage()

	return UI.BattlePassWnd:GetSelStage()

end


--
function UI.BattlePass_LevelsListWnd:CenterOnNextLevel()

	local stage = self:GetSelStage()
	local numLevels = UI:GetBattlePassNumLevels( stage )
	
	if numLevels > 0 then
	
		local scrollPos = 1
	
		local unlockedLevel = UI:GetBattlePassUnlockedLevel( stage )

		-- центрирование на доступном для анлока уровне
		if unlockedLevel < numLevels then
			local nextLevel = unlockedLevel ~= -1 and unlockedLevel + 1 or 1
			scrollPos = nextLevel + 0.5 - self.MAX_SLOTS / 2
			
		-- если все уровни разлочены, то скролл в конец списка
		else
			scrollPos = unlockedLevel + 1 - self.MAX_SLOTS
		end
		
		self:SetScrollPos( scrollPos )
		
	end
	
end


-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_LevelSlotWnd
-- -----------------------------------------------------------------------------------------

UI.BattlePass_LevelSlotWnd = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.BattlePass_LevelSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",
	
	props =
	{
		name		= "BattlePass_LevelSlotWnd",
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
				defName 			= "battlePass_levelSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "name12",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.DESC_1",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "name",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.DESC_2",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "mark",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.REWARD_ACQUIRED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "mark",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.LEVEL_ID_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "frame_1",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.HAS_PREMIUM_REWARD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "name14",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.PREMIUM_REQUIRED_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "mark1",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.LEVEL_UNLOCKED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "name13",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.LEVEL_UNLOCKED_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "frame_1",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.LEVEL_AVAILABLE_FOR_UNLOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "disable",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.DARKENING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- DESC_1
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- DESC_2
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- REWARD_ACQUIRED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "battlePass_levelSlot_mark",
				defaultAnimation	= "2",
			}}
		},
		
		-- LEVEL_ID_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "battlePass_levelSlot_mark",
				defaultAnimation	= "1",
				
				links =
				{
					{
						objName		= "text24",
						layer		= "UI.BattlePass_LevelSlotWnd.layers.LEVEL_ID",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- LEVEL_ID
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- HAS_PREMIUM_REWARD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "battlePass_levelSlot_hasPremiumReward",
				defaultAnimation	= "idle",
			}}
		},
		
		-- PREMIUM_REQUIRED_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "battlePass_premiumRequired" ),
		},
		
		-- LEVEL_UNLOCKED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "battlePass_levelSlot_mark",
				defaultAnimation	= "4",
			}}
		},
		
		-- LEVEL_UNLOCKED_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "battlePass_level" ),
		},
		
		-- LEVEL_AVAILABLE_FOR_UNLOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "battlePass_levelSlot_levelAvailableForUnlock",
				defaultAnimation	= "idle",
			}}
		},
		
		-- DARKENING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "battlePass_levelSlot_darkening",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.BattlePass_LevelSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )
	
	self.tooltipData = nil
	
	self:SetText( "", self.layers.DESC_1 )
	self:SetText( "", self.layers.DESC_2 )
	self:SetLayerVisible( false, self.layers.REWARD_ACQUIRED_EFFECT )
	self:SetLayerVisible( false, self.layers.LEVEL_ID_EFFECT )
	self:SetLayerVisible( false, self.layers.LEVEL_ID )
	self:SetLayerVisible( false, self.layers.HAS_PREMIUM_REWARD_EFFECT )
	self:SetLayerVisible( false, self.layers.PREMIUM_REQUIRED_TEXT )
	self:SetLayerVisible( false, self.layers.LEVEL_AVAILABLE_FOR_UNLOCK_EFFECT )
	self:SetLayerVisible( false, self.layers.DARKENING_EFFECT )
	
	local levelUnlockedEffect = UI:GetEffectFromLayer( self, self.layers.LEVEL_UNLOCKED_EFFECT )
	if levelUnlockedEffect then
		levelUnlockedEffect:StartAnimation( self.effectInfo.levelUnlocked.animNotUnlocked )
	end

end


--
function UI.BattlePass_LevelSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.BattlePass_LevelSlotWnd:OnBattlePassUnlockLevel()

	local data = self:GetRecordData()
	self:UpdateRewardAcquiredEffect( data )
	self:UpdateLevelId( data )
	self:UpdateLevelUnlockedEffect( data )
	self:UpdateLevelAvailableForUnlockEffect( data )
	self:UpdateDarkeningEffect( data )
	
end


--
function UI.BattlePass_LevelSlotWnd:OnBattlePassUnlockPremium()

	-- SC-112463 одновременно с покупкой премиума может быть и разлок уровня
	local data = self:GetRecordData()
	self:UpdateRewardAcquiredEffect( data )
	self:UpdateLevelId( data )
	self:UpdatePremiumRequiredText( data )
	self:UpdateLevelUnlockedEffect( data )
	self:UpdateLevelAvailableForUnlockEffect( data )
	self:UpdateDarkeningEffect( data )


end


-- --------------------------------------
-- const
-- --------------------------------------

UI.BattlePass_LevelSlotWnd.layers =
{
	MAIN_EFFECT							= 0,
	DESC_1								= 1,
	DESC_2								= 2,
	REWARD_ACQUIRED_EFFECT				= 3,
	LEVEL_ID_EFFECT						= 4,
	LEVEL_ID							= 5,
	HAS_PREMIUM_REWARD_EFFECT			= 6,
	PREMIUM_REQUIRED_TEXT				= 7,
	LEVEL_UNLOCKED_EFFECT				= 8,
	LEVEL_UNLOCKED_TEXT					= 9,
	LEVEL_AVAILABLE_FOR_UNLOCK_EFFECT	= 10,
	DARKENING_EFFECT					= 11,
}

UI.BattlePass_LevelSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
	},
	
	levelUnlocked =
	{
		animUnlocked	= "3",
		animNotUnlocked	= "4",
	},
	
	levelId =
	{
		animBright	= "5",
		animDark	= "1",
	}
}

-- --------------------------------------
-- vars
-- --------------------------------------

UI.BattlePass_LevelSlotWnd.tooltipData	= nil

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.BattlePass_LevelSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()
	
	self:UpdateRewardIco( data )
	self:UpdateDesc( data )
	self:UpdateRewardAcquiredEffect( data )
	self:UpdateLevelId( data )
	self:UpdateHasPremiumRewardEffect( data )
	self:UpdatePremiumRequiredText( data )
	self:UpdateLevelUnlockedEffect( data )
	self:UpdateLevelAvailableForUnlockEffect( data )
	self:UpdateDarkeningEffect( data )
	self:UpdateTooltip( data )

end


--
function UI.BattlePass_LevelSlotWnd:UpdateRewardIco( data )
	
	local stage = self:GetSelStage()
	local bundleDefName = UI:GetBattlePassRewardBundle( stage, data.level )
	
	local hTex = UI.INVALID_RESOURCE_HANDLE
	if bundleDefName ~= "" then
		hTex = UI:GetBundleIco( bundleDefName )	-- tODO: надо ли новую иконку?
	else
		hTex = UI:GetTex( "NoData" )
		sys.log( "UI.BattlePass_LevelSlotWnd:UpdateRewardIco()[ERROR]: cannot find bundle for stage %d level %d", stage, data.level )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.BattlePass_LevelSlotWnd:UpdateDesc( data )
	
	local strDesc1 = "error"
	local strDesc2 = "error"
	
	local stage = self:GetSelStage()
	local bundleDefName = UI:GetBattlePassRewardBundle( stage, data.level )
	
	if bundleDefName ~= "" then
	
		local bundleDef = UI:GetDef( bundleDefName )
		if bundleDef then
		
			if type( bundleDef.uiName ) == "string" then
			
				local strId1 = string.format( "battle_pass_1_%s", bundleDef.uiName ) 
				local strId2 = string.format( "battle_pass_2_%s", bundleDef.uiName ) 
				
				strDesc1 = UI:GetStringByName( strId1 )
				strDesc2 = UI:GetStringByName( strId2 )
			
			else
				sys.log( "UI.BattlePass_LevelSlotWnd:UpdateDesc()[ERROR]: invalid type of _G.Def['%s'].uiName (for BattlePass stage %d level %d); 'string' expected, got '%s'", bundleDefName, stage, data.level, type( bundleDef.uiName ) )
			end
		
		else
			sys.log( "UI.BattlePass_LevelSlotWnd:UpdateDesc()[ERROR]: cannot find def for bundle %s (for BattlePass stage %d level %d)", bundleDefName, stage, data.level )
		end
	
	else
		sys.log( "UI.BattlePass_LevelSlotWnd:UpdateDesc()[ERROR]: cannot find bundle defName for BattlePass stage %d level %d", stage, data.level )
	end
	
	self:SetText( strDesc1, self.layers.DESC_1 )
	self:SetText( strDesc2, self.layers.DESC_2 )
	
end


--
function UI.BattlePass_LevelSlotWnd:UpdateRewardAcquiredEffect( data )
	
	local stage = self:GetSelStage()
	local bRewardAcquired = UI:IsBattlePassRewardAcquired( stage, data.level )
	self:SetLayerVisible( bRewardAcquired, self.layers.REWARD_ACQUIRED_EFFECT )
	
end


--
function UI.BattlePass_LevelSlotWnd:UpdateLevelId( data )
	
	local stage = self:GetSelStage()
	local bRewardAcquired = UI:IsBattlePassRewardAcquired( stage, data.level )
	
	-- если награда уже получена, то цифра уровня не показывается, т.к. они в одной точке пространства
	-- теоретически награда может быть получена даже если уровень еще не разлочен, за другой уровень, т.к. получить один бандл можно только один раз за ивент
	if bRewardAcquired then
	
		self:SetLayerVisible( false, self.layers.LEVEL_ID_EFFECT )
		self:SetLayerVisible( false, self.layers.LEVEL_ID )

	else
	
		self:SetLayerVisible( true, self.layers.LEVEL_ID_EFFECT )
		self:SetLayerVisible( true, self.layers.LEVEL_ID )
	
		-- анимация - для разлоченных уровней и доступного уровня цифра яркая, для остальных затемненная
		local anim = ""
		if self:IsLevelUnlocked( data ) or self:IsLevelAvailableForUnlock( data ) then
			anim = self.effectInfo.levelId.animBright
		else
			anim = self.effectInfo.levelId.animDark
		end
		
		local levelIdEffect = UI:GetEffectFromLayer( self, self.layers.LEVEL_ID_EFFECT )
		if levelIdEffect then
			levelIdEffect:StartAnimation( anim )
		end
		
		-- цифра
		self:SetText( tostring( data.level ), self.layers.LEVEL_ID )

	end

end


--
function UI.BattlePass_LevelSlotWnd:UpdateHasPremiumRewardEffect( data )

	local stage = self:GetSelStage()
	local bIsRewardPremium = UI:IsBattlePassRewardPremium( stage, data.level )
	
	self:SetLayerVisible( bIsRewardPremium, self.layers.HAS_PREMIUM_REWARD_EFFECT )
	
end


--
function UI.BattlePass_LevelSlotWnd:UpdatePremiumRequiredText( data )
	
	local stage = self:GetSelStage()
	local bIsRewardPremium = UI:IsBattlePassRewardPremium( stage, data.level )
	local bPremiumUnlocked = UI:IsBattlePassPremiumUnlocked( stage )
	
	self:SetLayerVisible( bIsRewardPremium and not bPremiumUnlocked, self.layers.PREMIUM_REQUIRED_TEXT )

end


--
function UI.BattlePass_LevelSlotWnd:UpdateLevelUnlockedEffect( data )
	
	local bUnlocked = self:IsLevelUnlocked( data )
	local anim = bUnlocked and self.effectInfo.levelUnlocked.animUnlocked or self.effectInfo.levelUnlocked.animNotUnlocked
	
	local levelUnlockedEffect = UI:GetEffectFromLayer( self, self.layers.LEVEL_UNLOCKED_EFFECT )
	if levelUnlockedEffect then
		levelUnlockedEffect:StartAnimation( anim )
	end
	
end


--
function UI.BattlePass_LevelSlotWnd:UpdateLevelAvailableForUnlockEffect( data )
	
	local bAvailableForUnlock = self:IsLevelAvailableForUnlock( data )
	self:SetLayerVisible( bAvailableForUnlock, self.layers.LEVEL_AVAILABLE_FOR_UNLOCK_EFFECT )
	
end


--
function UI.BattlePass_LevelSlotWnd:UpdateDarkeningEffect( data )
	
	local bNeedDarkening = not self:IsLevelUnlocked( data ) and not self:IsLevelAvailableForUnlock( data )
	self:SetLayerVisible( bNeedDarkening, self.layers.DARKENING_EFFECT )
	
end


--
function UI.BattlePass_LevelSlotWnd:UpdateTooltip( data )

	self.tooltipData = nil
	
	local stage = self:GetSelStage()
	local bundleDefName = UI:GetBattlePassRewardBundle( stage, data.level )
	
	if bundleDefName ~= "" then
		self.tooltipData = UI:GetTooltipForItem( bundleDefName )
	else
		sys.log( "UI.BattlePass_LevelSlotWnd:UpdateTooltip()[ERROR]: cannot find bundle defName for BattlePass stage %d level %d", stage, data.level )
	end
	
end


--
function UI.BattlePass_LevelSlotWnd:GetSelStage()

	return UI.BattlePassWnd:GetSelStage()

end


--
function UI.BattlePass_LevelSlotWnd:IsLevelUnlocked( data )
	
	local stage = self:GetSelStage()
	local level = data.level
	
	local unlockedLevel = UI:GetBattlePassUnlockedLevel( stage )
	
	return unlockedLevel ~= -1 and level <= unlockedLevel
	
end


--
function UI.BattlePass_LevelSlotWnd:IsLevelAvailableForUnlock( data )
	
	local stage = self:GetSelStage()
	local level = data.level
	
	local unlockedLevel = UI:GetBattlePassUnlockedLevel( stage )
	local numLevels = UI:GetBattlePassNumLevels( stage )
	
	local nextLevel = unlockedLevel ~= -1 and unlockedLevel + 1 or 1

	return numLevels > 0 and nextLevel <= numLevels and level == nextLevel
	
end


-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_GoToShipBtn_1
-- -----------------------------------------------------------------------------------------

UI.BattlePass_GoToShipBtn_1 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "BattlePass_GoToShipBtn_1"
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
					defName 			= "battlePass_btn2",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text23",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
}


-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_GoToShipBtn_2
-- -----------------------------------------------------------------------------------------

UI.BattlePass_GoToShipBtn_2 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "BattlePass_GoToShipBtn_2"
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
					defName 			= "battlePass_btn2",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text23",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
}

-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_BuyPremiumDlcBtn
-- -----------------------------------------------------------------------------------------

UI.BattlePass_BuyPremiumDlcBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "BattlePass_BuyPremiumDlcBtn"
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
					defName 			= "battlePass_btn6",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text22",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
	
	textId = "battlePass_buyPremiumDlc_btnText"
}

-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_BuyPremiumDlcBtn_vip
-- -----------------------------------------------------------------------------------------

UI.BattlePass_BuyPremiumDlcBtn_vip =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "BattlePass_BuyPremiumDlcBtn_vip"
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
					defName 			= "battlePass_btn5",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text22",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
	
	textId = "battlePass_buyPremiumDlc_btnText_vip"
}

-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_BuyUnlockLevelBtn
-- -----------------------------------------------------------------------------------------

UI.BattlePass_BuyUnlockLevelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "BattlePass_BuyUnlockLevelBtn"
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
					defName 			= "battlePass_btn6",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text22",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
	
	textId = "battlePass_buyUnlockLevel_btnText"
}

-- -----------------------------------------------------------------------------------------
-- UI.BattlePass_UnlockLevelBtn
-- -----------------------------------------------------------------------------------------

UI.BattlePass_UnlockLevelBtn = {}

-- --------------------------------------
-- window definition
-- --------------------------------------

UI.BattlePass_UnlockLevelBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn",
	
	props =
	{
		name	= "BattlePass_UnlockLevelBtn"
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
				defName 			= "battlePass_btn2",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text23",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- TEXT
		{
			id				= UI.TextBtn.layers.TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		}, 
	}
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

-- перегрузка UI.TextBtn
function UI.BattlePass_UnlockLevelBtn:SetBtnText( text )

	self.metaText:SetText( text, true )

end


--
function UI.BattlePass_UnlockLevelBtn:Setup( stage, level )

	self:Reset()

	self.stage	= stage
	self.level	= level
	
	self:UpdateText()

end


--
function UI.BattlePass_UnlockLevelBtn:Reset()

	self.stage	= -1
	self.level	= -1
	
	self.metaText:SetText( "", true )
	
end


-- --------------------------------------
-- vars
-- --------------------------------------

UI.BattlePass_UnlockLevelBtn.stage		= -1
UI.BattlePass_UnlockLevelBtn.level		= -1
UI.BattlePass_UnlockLevelBtn.metaText	= nil

-- --------------------------------------
-- work functions
-- --------------------------------------

function UI.BattlePass_UnlockLevelBtn:F_PostLoad()

	UI.TextBtn.F_PostLoad( self )

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT )

end


--
function UI.BattlePass_UnlockLevelBtn:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.BattlePass_UnlockLevelBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateMetaTextPos()

end


--
function UI.BattlePass_UnlockLevelBtn:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.BattlePass_UnlockLevelBtn:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.BattlePass_UnlockLevelBtn:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.BattlePass_UnlockLevelBtn:UpdateText()
	
	local price = UI:GetBattlePassLevelUnlockPrice( self.stage, self.level )
	
	local priceInfo =
	{
		priceType	= _G.GameStore.CreditsType.CT_EVENT,
		val			= price,
		bIsBuyPrice	= true,
		basePrice	= price,
	}
	
	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.TEXT ), true, true, true, nil )
	local str = UI:GetStringByName( "battlePass_unlockLevel_btnText" )..strPrice
	
	self.metaText:SetText( str, true )

end


-- перегрузка функции из UI.EffectButtonWnd, чтобы наведение на ссылку-цену не сбрасывало выделение с кнопки
function UI.BattlePass_UnlockLevelBtn:UpdateEffectAnimation()

	if UI:IsInRemovingAllWindows() then
		return
	end	

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local mouseState = self:GetMouseState()
	local animation = ""
	local curAnimation = mainEffect:GetCurAnimation()
	local bHasFocus = UI:GetKeyboardFocus() == self:GetUiHandle()

	local bMouseIn = mouseState == UI.MOUSE_IN or mouseState == UI.MOUSE_DOWN
	if not bMouseIn then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseIn = wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) )
	end

	if self.pressTimer ~= -1 then
		animation = self.effectInfo.main.animationPressed

	elseif self:HasStyle( UI.WS_GRAYED ) or self:HasStyle( UI.WS_DISABLE ) then
		animation = self.effectInfo.main.animationDisabled

	elseif mouseState == UI.MOUSE_DOWN then
		animation = bHasFocus and self.effectInfo.main.animationPressed_focus or self.effectInfo.main.animationPressed
		self.pressTimer = self.PRESS_TIME

	elseif bMouseIn then
		animation = bHasFocus and self.effectInfo.main.animationSelect_focus or self.effectInfo.main.animationSelect

	else
		animation = bHasFocus and self.effectInfo.main.animationIdle_focus or self.effectInfo.main.animationIdle
	end

	if animation and animation ~= "" and animation ~= curAnimation then
		mainEffect:StartAnimation( animation )
	end

end


-- ------------------------------------------------------------------
-- UI.BattlePass_CrossBtn
-- ------------------------------------------------------------------

UI.BattlePass_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn3",

		props =
		{
			name	= "BattlePass_CrossBtn"
		}
	}
}

-- ------------------------------------------------------------------
-- UI.BattlePass_BuyWnd
-- ------------------------------------------------------------------

UI.BattlePass_BuyWnd =
{
	def =
	{
		className 	= "Wnd",
		prototype	= "BuyWnd",
	
		props =
		{
			name	= "BattlePass_BuyWnd",
		},
	},

	mainWndName = "BattlePassWnd",
}