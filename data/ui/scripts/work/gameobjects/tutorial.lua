-- ----------------------------------------------------------------------------
--
-- Workfile: tutorial.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

if UI.Tutorial then
	return
else
	UI.Tutorial = {}
end


-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.Tutorial:IsActive()

	return self.bActive

end


--
function UI.Tutorial:GetMode()

	return self.mode

end


--
function UI.Tutorial:GetStage()

	return self.stage

end


--
function UI.Tutorial:Start( mode, stage )

	if self.bActive then
		sys.log( "UI.Tutorial:Start()[ERROR]: tutorial is already active" )
		return
	end	

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.Tutorial:Start()[ERROR]: invalid 1-st parameter (\"mode\"); one of the \"UI.Tutorial.modes\" values expected, got \"%s\"", tostring( mode ) )
		return
	end

	if stage == nil then

		if mode == self.modes.FIRST or mode == self.modes.HELP then
			stage = _G.MasterServer.TutorialStage.TUT_STAGE_1
		
		else
			sys.log( "UI.Tutorial:Start()[ERROR]: invalid type of the 2-nd parameter (\"stage\"); \"number\" expected, got \"nil\"" )
			return
		end

	else

		if type( stage ) ~= "number" then
			sys.log( "UI.Tutorial:Start()[ERROR]: invalid type of the 2-nd parameter (\"stage\"); \"number\" expected, got \"%s\"", type( stage ) )
			return
		end

	end

	local stageName = UI:Val2Key( _G.MasterServer.TutorialStage, stage )
	if stageName == "" then
		sys.log( "UI.Tutorial:Start()[ERROR]: invalid stage; one of the \"_G.MasterServer.TutorialStage\" values expected, got \"%s\"", tostring( stage ) )
		return
	end

	if not self.gameplayParams[ stageName ] then
		sys.log( "UI.Tutorial:Start()[ERROR]: no gameplay params for stage: %d", stage )
		return	
	end

	self.bActive = true
	self.mode = mode
	self.stage = stage

	UI:SendUiEvent( UI.EV_TUTORIAL_START, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

	if self.mode == self.modes.HELP then
		self:LaunchTutorialGameplay()

	elseif self.mode == self.modes.FIRST then

	--[[
		if UI.HangarWnd:IsOnScreen() then
			self:ShowStartTutorialWnd()
		end
	]]
		self:LaunchTutorialGameplay()	-- #0107207 не показываем окно туториала, сразу запускаем геймплей

	else
		sys.log( "UI.Tutorial:Start()[ERROR]: unhandled mode: %d", self.mode )
	end

end


--
function UI.Tutorial:Stop( bSkipped )

	local mode = self.mode

	if not self.bActive then
		return
	end

	self.bActive					= false
	self.mode						= -1
	self.stage						= -1
	self.startTutorialWndShown		= false
	self.bContinue					= false

	self:ResetGameplayHelp()
	self:HideAllTutorialWindows()

	if bSkipped == nil then
		bSkipped = false
	end
	
	if bSkipped then
		self:SaveSkipped()
	end

	UI:SendUiEvent( UI.EV_TUTORIAL_STOP, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, bSkipped and 1 or 0, 0, 0, 0 )

end


--
function UI.Tutorial:OnTutorialWndResult( result, launchMode )

	if not self.bActive then
		sys.log( "UI.Tutorial:OnTutorialWndResult(): tutorial is not active" )
		return
	end

	if type( result ) ~= "boolean" then
		sys.log( "UI.Tutorial:OnTutorialWndResult()[ERROR]: invalid type of the 1-st parameter (\"result\"); \"boolean\" expected, got \"%s\"", type( result ) )
		self:Stop()
		return
	end

	if type( launchMode ) ~= "number" then
		sys.log( "UI.Tutorial:OnTutorialWndResult()[ERROR]: invalid type of the 2-nd parameter (\"launchMode\"); \"number\" expected, got \"%s\"", type( launchMode ) )
		self:Stop()
		return
	end

	if launchMode == UI.TutorialWnd.launchModes.FIRST or launchMode == UI.TutorialWnd.launchModes.HELP then

		UI.TutorialWnd:Hide()

		if result then
			self:LaunchTutorialGameplay()
		else
			self:Stop( true )
		end

	elseif launchMode == UI.TutorialWnd.launchModes.LOSE then

		UI.TutorialWnd:Hide()

		if result then

			self:ResetGameplayHelp()
			self:LaunchTutorialGameplay()

		else

			self:Stop( true )
			UI:LoadMainMenuLevel()

		end

	elseif launchMode == UI.TutorialWnd.launchModes.WIN then

		if result then
			sys.log( "UI.Tutorial:OnTutorialWndResult()[ERROR]: invalid result" )
		end

		self:Stop()

	else
		sys.log( "UI.Tutorial:OnTutorialWndResult()[ERROR]: unhandled launchMode: %d", launchMode )
		self:Stop()
	end

end


--
function UI.Tutorial:OnDebriefingResult( gameResult )

	if not self.bActive then
		return
	end

	self.bGameplayStarted = true

	local localPlayerId = _G.Game_LocalClientNum()
	local localPlayerTeam = _G.CL_GetPlayerTeam( localPlayerId )
	if localPlayerTeam == 0 then
		localPlayerTeam = 1
	end

	if gameResult.winnerTeam == localPlayerTeam then
		self.bGameplayWin = true
	end

end


--
function UI.Tutorial:LaunchTutorialGameplay()

	if not self.bActive then
		sys.log( "UI.Tutorial:LaunchTutorialGameplay()[ERROR]: tutorial is not active" )
		return
	end

	local stageName = UI:Val2Key( _G.MasterServer.TutorialStage, self.stage )
	if stageName == "" then
		sys.log( "UI.Tutorial:LaunchTutorialGameplay()[ERROR]: invalid stage: %s", tostring( self.stage ) )
		return
	end

	local gameplayParams = self.gameplayParams[ stageName ]
	if not gameplayParams then
		sys.log( "UI.Tutorial:LaunchTutorialGameplay()[ERROR]: cannot find gameplay params for stage %s", stageName )
		return
	end

	self.bGameplayStarted = true
	self.bGameplayWin = false
	_G.MasterServer_LaunchSinglePlayerPractice( gameplayParams.mapName, ai.Gameplay[ gameplayParams.gameTypeName ] or 0, gameplayParams.botsCount, ai.Race[ gameplayParams.race ] )

end


--
function UI.Tutorial:MasterServer_OnRewardTutorial( data )

--[[ сейчас зачем-то приходит этот коллбэк после геймплея PRACTICE, типа за "первый бой" - #0054105, комм.(0216181)
	if not self.bActive then
		sys.log( "UI.Tutorial:MasterServer_OnRewardTutorial()[ERROR]: tutorial is not active" )
	end
]]

	if type( data ) ~= "table" then
		sys.log( "UI.Tutorial:MasterServer_OnRewardTutorial()[ERROR]: invalid type of the 1-st parameter (\"data\" ); \"table\" expected, got \"%s\"", type( data ) )
    	self:Stop()
		return
	end

	if type( data.result ) == "number" then

    	if data.result == _G.MasterServer.RewardTutorialResult.RTR_OK or data.result == _G.MasterServer.RewardTutorialResult.RTR_ALREADY_FINISHED then

			-- апдейт флага "завершено" производится в любом случае - даже если туториал на данный момент по какой-то причине был не активен
        	if self:GetFirstUncompletedStage() == -1 then
        		self:SaveCompleted()
        	end

        	if self.bActive then

				if type( data.tutorialStage ) == "number" then

                	if data.tutorialStage == self.stage then

    					self.bRewardGot = true
    					self:CheckShowWinWnd()

    				else
                		sys.log( "UI.Tutorial:MasterServer_OnRewardTutorial()[ERROR]: mismatch stage; internal stage is %d; reward got on stage %s", self.stage, tostring( data.tutorialStage ) )
    	    			self:Stop()
                	end

				else
					sys.log( "UI.Tutorial:MasterServer_OnRewardTutorial()[ERROR]: invalid type of the field \"tutorialStage\"; \"number\" expected, got \"%s\"", type( data.tutorialStage ) )
    	    		self:Stop()
				end

        	end

    	else

			if self.bActive then
	    		self:ShowMsgOnRewardError( data.result )
    			self:Stop()
			end

    	end

	else
		sys.log( "UI.Tutorial:MasterServer_OnRewardTutorial()[ERROR]: invalid type of the field \"result\"; \"number\" expected, got \"%s\"", type( data.result ) )
    	self:Stop()
	end	

end


--
function UI.Tutorial:NeedStartFirstTime()

	if not UI.tutorialEnabled then
		return false, -1
	end

	if not _G.MasterServer_IsConnected() then
		return false, -1
	end

	if self:IsActive() then
		return false, -1
	end
	
	if self:WasSkipped() then
		return false, -1
	end

	-- учебник может быть уже завершен ( IsCompleted() == true ), хотя не все его стадии, которые сейчас есть, завершены ( GetFirstUncompletedStage() ~= -1 ),
	-- это может быть в случае, если раньше, когда игрок завершил его, стадий было меньше;
	-- в этом случае - если туториал был ранее завершен, он больше не показывается автоматически, даже если с тех пор появились новые стадии

	if self:IsCompleted() then
		return false, -1
	end

	if self:WasCompletedOld() then
		return true
	end

	if self:WasRequestShown() or self:IsNotShowRequestAgain() then
		return false, -1
	end	

	local stage = self:GetFirstUncompletedStage()
	if stage == -1 then
		return false, -1
	end

	return true, stage
	
end 


-- ---------------------------------
-- const
-- ---------------------------------

UI.Tutorial.HUD_HELP_TIME		= 25
UI.Tutorial.FIRST_HUD_HELP_TIME	= 5

UI.Tutorial.gameplayParams =
{
	TUT_STAGE_1 =
	{	
    	mapName			= "tutorial_leviathan",
    	gameTypeName	= "TUTORIAL",
    	botsCount		= 0,
		race			= "EMPIRE",
	},

	TUT_STAGE_2 =
	{	
    	mapName			= "s1550_tutorial2",
    	gameTypeName	= "TUTORIAL",
    	botsCount		= 3,
		race			= "EMPIRE",
	},

	TUT_FIRST_FIGHT =
	{
    	mapName			= "s1340_thar_aliendebris13",
    	gameTypeName	= "PRACTICE",
    	botsCount		= 11,
		race			= "EMPIRE",
	}
}

UI.Tutorial.modes =
{
	FIRST	= 1,
	HELP	= 2,
}


UI.Tutorial.sounds =
{
	showResultsWnd = "sound/ui/btnClick",
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.Tutorial.bActive						= false
UI.Tutorial.bShipSelectionHelpShown		= false
UI.Tutorial.bHudHelpShown				= false
UI.Tutorial.hudHelpTimer				= -1
UI.Tutorial.lastHudHelpIdx				= -1
UI.Tutorial.bGameplayStarted			= false
UI.Tutorial.bGameplayWin 				= false
UI.Tutorial.bRewardGot					= false
UI.Tutorial.stage						= -1
UI.Tutorial.mode						= -1
UI.Tutorial.startTutorialWndShown		= false
UI.Tutorial.bContinue					= false

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.Tutorial:ResetGameplayHelp()

    self.bShipSelectionHelpShown	= false
    self.bHudHelpShown				= false
    self.hudHelpTimer				= -1
    self.lastHudHelpIdx				= -1
	self.bGameplayStarted			= false
	self.bGameplayWin				= false
	self.bRewardGot					= false

end


--
function UI.Tutorial:HideAllTutorialWindows()

	if UI.HelpWnd:IsOnScreen() and UI.HelpWnd:GetMode() == UI.HelpWnd.modes.TUTORIAL then
		UI.HelpWnd:Close( false )
	end

	if UI.ShipSelectionWnd then
		UI.ShipSelectionWnd:HideTutorialTips()
	end

	UI.TutorialWnd:Hide()

end


-- с появлением UiTutorial больше не используется
-- ( #0098843 UiTutorial удален )
function UI.Tutorial:SaveSkipped()

	sys.log( "UI.Tutorial:SaveSkipped()[ERROR]: deprecated" )

--[[
	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:SaveSkipped()[ERROR]: not connected" )
		return
	end

	local val = 1
	if UI.serverData.userData.tutorialSkipped ~= val then
		UI.serverData.userData.tutorialSkipped = val
		UI:SaveServerUserData()
	end
]]

end


--
function UI.Tutorial:SaveCompleted()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:SaveCompleted()[ERROR]: not connected" )
		return
	end

	local val = 1
	if UI.serverData.userData.tutorialCompleted2 ~= val then
		UI.serverData.userData.tutorialCompleted2 = val
		UI:SaveServerUserData()
	end

end


--
function UI.Tutorial:SaveRequestShown()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:SaveRequestShown()[ERROR]: not connected" )
		return
	end

	local val = 1
	if UI.serverData.userData.tutorialRequestShown ~= val then
		UI.serverData.userData.tutorialRequestShown = 1
		UI:SaveServerUserData()
	end

end


--
function UI.Tutorial:WasSkipped()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:WasSkipped()[ERROR]: not connected" )
		return false
	end

	local skipped = UI.serverData.userData.tutorialSkipped
	return skipped ~= nil and skipped ~= false and skipped ~= 0

end


--
function UI.Tutorial:SaveSkipped()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:SaveSkipped()[ERROR]: not connected" )
		return
	end

	local val = 1
	if UI.serverData.userData.tutorialSkipped ~= val then
		UI.serverData.userData.tutorialSkipped = 1
		UI:SaveServerUserData()
	end

end


-- есть две переменных с флагом выполнения:
-- tutorialCompleted (старая, до появления UiTutorial), и tutorialCompleted2 (новая, после появления UiTutorial);
-- новая переменная нужна, чтобы различить - надо ли запускать UiTutorial -
-- если Tutorial был выполнен ранее (когда он был единственным учебником), то UiTutorial не надо запускать,
-- если выполнен уже при появлении UiTutorial, то UiTutorial может быть запущен
-- ( #0098843 UiTutorial удален )

function UI.Tutorial:IsCompleted()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:IsCompleted()[ERROR]: not connected" )
		return false
	end

	if self:WasCompletedOld() then
		return true
	end

	if UI:IsTrueEx( UI.serverData.userData.tutorialCompleted2 ) then
		return true
	end

	return self:GetFirstUncompletedStage() == -1

end


-- есть две переменных с флагом выполнения:
-- tutorialCompleted (старая, до появления UiTutorial), и tutorialCompleted2 (новая, после появления UiTutorial);
-- новая переменная нужна, чтобы различить - надо ли запускать UiTutorial -
-- если Tutorial был выполнен ранее (когда он был единственным учебником), то UiTutorial не надо запускать,
-- если выполнен уже при появлении UiTutorial, то UiTutorial может быть запущен
-- ( #0098843 UiTutorial удален )

function UI.Tutorial:WasCompletedOld()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:WasCompletedOld()[ERROR]: not connected" )
		return false
	end

	return UI:IsTrueEx( UI.serverData.userData.tutorialCompleted )

end


--
function UI.Tutorial:WasRequestShown()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:WasRequestShown()[ERROR]: not connected" )
		return false
	end

	return UI:IsTrueEx( UI.serverData.userData.tutorialRequestShown )

end


--
function UI.Tutorial:IsNotShowRequestAgain()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:IsNotShowRequestAgain()[ERROR]: not connected" )
		return false
	end

	return UI:IsTrueEx( UI.serverData.userData.tutorialRequestNotShowAgain )	

end


--
function UI.Tutorial:SetNotShowRequestAgaian( bNotShow )

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Tutorial:SetNotShowRequestAgaian()[ERROR]: not connected" )
		return
	end

	local val = bNotShow and 1 or 0
	if UI.serverData.userData.tutorialRequestNotShowAgain ~= val then
		UI.serverData.userData.tutorialRequestNotShowAgain = bNotShow
		UI:SaveServerUserData()
	end

end


--
function UI.Tutorial:F_OnEventWndShown( hSender, hWnd )

	if self.bActive then

		if ( UI.HangarWnd and hWnd == UI.HangarWnd:GetUiHandle() ) --[[or ( UI.AntechamberWnd and hWnd == UI.AntechamberWnd:GetUiHandle() )]] then

			if self.bGameplayStarted then

        		if self.bGameplayWin then
					self:CheckShowWinWnd()
    			else
    				self:Stop()
    			end

			else

				if UI.HangarWnd:IsOnScreen() then

        			if self.mode == self.modes.FIRST and not self.startTutorialWndShown then
        				self:ShowStartTutorialWnd()
        				self.startTutorialWndShown = true
        			end

				end

			end

    	end

	end

end


--
function UI.Tutorial:ShowStartTutorialWnd()

	UI.TutorialWnd:Show()
	UI.TutorialWnd:Setup( UI.TutorialWnd.launchModes.FIRST )

	self:SaveRequestShown()

end


--
function UI.Tutorial:ShowWinWnd()

	if UI.TutorialWnd:IsOnScreen() then
		sys.log( "UI.Tutorial:ShowWinWnd()[ERROR]: UI.TutorialWnd wnd is already on screen" )
	end

	UI.TutorialWnd:Setup( UI.TutorialWnd.launchModes.WIN, self.bRewardGot )
	UI.TutorialWnd:Show()
	UI:PlayGlobalSound( self.sounds.showResultsWnd )

end


--
function UI.Tutorial:CheckShowWinWnd()

	if UI.HangarWnd:IsOnScreen() and self.bGameplayStarted and self.bGameplayWin and ( self.bRewardGot or self:IsStageRewarded( self.stage ) ) then
		self:ShowWinWnd()
	end

end


--
function UI.Tutorial:ShowLoseWnd()

	if UI.TutorialWnd:IsOnScreen() then
		sys.log( "UI.Tutorial:ShowLoseWnd()[ERROR]: UI.TutorialWnd wnd is already on screen" )
	end

	UI.TutorialWnd:Setup( UI.TutorialWnd.launchModes.LOSE )
	UI.TutorialWnd:Show()
	UI:PlayGlobalSound( self.sounds.showResultsWnd )

end


--
function UI.Tutorial:ShowMsgOnRewardError( result )

	UI:ShowErrorMsg( "msg_rewardTutorialError", result, "_G.MasterServer.RewardTutorialResult" )

end


--
function UI.Tutorial:F_OnEventWndHided( hSender, hWnd )

	if not self.bActive then
		return
	end

	if UI.HelpWnd and hWnd == UI.HelpWnd:GetUiHandle() then

		if _G.GetCurrentGameMode and _G.GetCurrentGameMode() ~= 0 and UI.HudWnd then

    		local hudMode = UI.HudWnd:GetMode()
    		if self:IsValidHudModeForHelp( hudMode ) then

        		if not self.bHudHelpShown then
        			self.hudHelpTimer = self.HUD_HELP_TIME
        		end

    		end

		end

	end

end


--
function UI.Tutorial:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self.bActive then
		return
	end

	self:CheckShowGameplayHelp()

end


--
function UI.Tutorial:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Stop()

end


--
function UI.Tutorial:Update( dt_sys, dt_game )

	if not self.bActive then
		return
	end

	if self.hudHelpTimer ~= -1 then
		self:UpdateHudHelpTimer( dt_game )
	end

end


--
function UI.Tutorial:UpdateHudHelpTimer( dt )

	if self.hudHelpTimer == -1 then
		return
	end

	self.hudHelpTimer = self.hudHelpTimer - dt

	if self.hudHelpTimer <= 0 then

		local hudMode = UI.HudWnd:GetMode()
		if self:IsValidHudModeForHelp( hudMode ) then

			self.hudHelpTimer = -1

    		if not self:TryShowNextHudHelp() then
				self.bHudHelpShown = true
    		end

		else
			self.hudHelpTimer = 0
		end

	end

end


--
function UI.Tutorial:TryShowNextHudHelp()

	local helpIdx = self.lastHudHelpIdx == -1 and 1 or self.lastHudHelpIdx + 1

	local theme = string.format( "tutorialHud%d", helpIdx ) 
	
	if not UI:IsHelpThemeValid( theme ) then
		return false
	end

	UI:ShowHelp( theme, UI.HelpWnd.modes.TUTORIAL )
	self.lastHudHelpIdx = helpIdx

	return true

end


--
function UI.Tutorial:CheckShowGameplayHelp()

	if not UI.HudWnd or not UI.HudWnd.w or not UI.HudWnd:IsOnScreen() then
		return
	end

	local hudMode = UI.HudWnd:GetMode()

	if hudMode == UI.HudWnd.modes.SELECT_SHIP then

		if not self.bShipSelectionHelpShown and not self:IsCompleted() then
			UI.ShipSelectionWnd:ShowTutorialTips()
			self.bShipSelectionHelpShown = true

		end

	elseif hudMode == UI.HudWnd.modes.TUTORIAL_LOSE then

		if self.bGameplayStarted and not self.bGameplayWin then
			self:ShowLoseWnd()
		else
			sys.log( "UI.Tutorial:CheckShowGameplayHelp(): cannot be here" )
		end

	elseif self:IsValidHudModeForHelp( hudMode ) then

		if not self.bHudHelpShown and self.hudHelpTimer == -1 and self.lastHudHelpIdx == -1 then
			self.hudHelpTimer = self.FIRST_HUD_HELP_TIME
		end

	end

end


--
function UI.Tutorial:IsValidHudModeForHelp( hudMode )

	return hudMode == UI.HudWnd.modes.GAME

end


--
function UI.Tutorial:GetNextStage( stage )

	if stage == -1 then
		return -1
	end

	local curStageIdx = -1

	local stagesOrder = self:GetStagesOrder()
	local numStages = #stagesOrder

	for idx = 1, numStages do
		if stagesOrder[ idx ] == stage then
			curStageIdx = idx
			break
		end
	end

	local nextStage = -1

	if curStageIdx ~= -1 and curStageIdx < numStages then
		local nextStageIdx = curStageIdx + 1
		nextStage = stagesOrder[ nextStageIdx ]
	end

	return nextStage

end


--
function UI.Tutorial:GetNextUncompletedStage( stage )

	local nextStage = self:GetNextStage( stage )
	while nextStage ~= -1 do

		if not self:IsStageCompleted( nextStage ) then
			return nextStage
		end

		nextStage = self:GetNextStage( nextStage )

	end

	return -1

end


--
function UI.Tutorial:GetFirstUncompletedStage()

	local stagesOrder = self:GetStagesOrder()	
	for stageIdx = 1, #stagesOrder do

		local stage = stagesOrder[ stageIdx ]

		if not self:IsStageCompleted( stage ) then
			return stage
		end

	end

	return -1

end


--
function UI.Tutorial:GetNextStageToPlay()

	if not( self.mode == self.modes.FIRST ) then
		return -1
	end

	if self.stage == -1 then
		return self:GetFirstUncompletedStage()
	end

	return self:GetNextUncompletedStage( self.stage )

end


--
function UI.Tutorial:IsStageCompleted( stage )

	return self:IsStageRewarded( stage )

end


--
function UI.Tutorial:IsStageRewarded( stage )

	local rewardedStages = _G.MasterServer_GetRewardedTutorials()

	for idx, rewardedStage in pairs( rewardedStages ) do
		if stage == rewardedStage then
			return true
		end			
	end

	return false

end


--
function UI.Tutorial:GetStagesOrder()

--[[ сейчас только одна стадия
	local stageOrder = {}

	for name, stage in pairs( _G.MasterServer.TutorialStage ) do
		if stage ~= _G.MasterServer.TutorialStage.TUT_FIRST_FIGHT then
			table.insert( stageOrder, stage )
		end
	end

	table.sort( stageOrder )
	table.insert( stageOrder, _G.MasterServer.TutorialStage.TUT_FIRST_FIGHT )

	return stageOrder
]]

	return { _G.MasterServer.TutorialStage.TUT_STAGE_1 }

end