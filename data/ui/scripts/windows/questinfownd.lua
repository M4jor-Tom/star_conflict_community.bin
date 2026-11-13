-- ---------------------------------------------------------------------
-- UI.QuestInfoWnd
-- ---------------------------------------------------------------------

UI.QuestInfoWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

--
UI.QuestInfoWnd.layers =
{
    MAIN_EFFECT				= 0,  
	WORK_EFFECT				= 1, 
    PROGRESS_EFFECT			= 2, 
    PROGRESS_BAR_EFFECT		= 3, 
    PROGRESS_ICO_EFFECT		= 4, 
    PROGRESS_TEXT_EFFECT	= 5, 
    PROGRESS_TEXT			= 6, 
	NAME					= 7, 
	DESC					= 8, 
	COOLDOWN				= 9, 
	REWARDS					= 10,
    WAIT_EFFECT				= 11,
    WAIT_TEXT				= 12,
}

--
UI.QuestInfoWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "QuestInfoWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
	},

	layers =
	{
		firstOverlayLayer = UI.QuestInfoWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "questInfo_main",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "questInfo_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "status",
						layer		= "UI.QuestInfoWnd.layers.PROGRESS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по размеру
					{
						objName		= "title",
						layer		= "UI.QuestInfoWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					-- не линкуется по позиции и размеру
					{
						objName		= "description",
						layer		= "UI.QuestInfoWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					-- не линкуется по позиции
					{
						objName		= "text",
						layer		= "UI.QuestInfoWnd.layers.COOLDOWN",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					-- не линкуется по размеру
					{
						objName		= "title58",
						layer		= "UI.QuestInfoWnd.layers.REWARDS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "loading",
						layer		= "UI.QuestInfoWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
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
						layer		= "UI.QuestInfoWnd.layers.PROGRESS_BAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "status",
						layer		= "UI.QuestInfoWnd.layers.PROGRESS_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text5",
						layer		= "UI.QuestInfoWnd.layers.PROGRESS_TEXT_EFFECT",
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
						layer		= "UI.QuestInfoWnd.layers.PROGRESS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},

		-- COOLDOWN
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- REWARDS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_NOCLIP,
   			formatInfoSz	= { 2, 1 },
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
						layer		= "UI.QuestInfoWnd.layers.WAIT_TEXT",
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

	children = { "UI.QuestInfo_CloseBtn", "UI.QuestInfo_TakeQuestBtn", "UI.QuestInfo_RewardsListWnd", "UI.QuestInfo_TransferToZoneBtn" }
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.QuestInfoWnd:Setup( questId, questType )

	self:Reset()

	if type( questId ) ~= "number" then
		sys.log( "UI.QuestInfoWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		return
	end

	if UI:Val2Key( UI.questTypes, questType ) == "" then
		sys.log( "UI.QuestInfoWnd:Setup()[ERROR]: ivalid 2-nd parameter (\"questType\"); one of the \"UI.questTypes\" values or \"nil\" expected, got \"%s\"", tostring( questType ) )
		return
	end

	if questType == UI.questTypes.SHIP and not UI:IsShipQuestAvailable( questId ) then
		sys.log( "UI.QuestInfoWnd:Setup()[ERROR]: not available ship quest" )
		return
	end

	self.questInfo = { questId = questId, questType = questType }

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.QuestInfoWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnRegularQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.QuestResult.QR_OK then

		if self:IsOnScreen() then

			self:OnRegularQuestsChanged()

			if requestId == self.takeRequestId then
				self:Close( false )
			end

		end

	else
		if requestId == self.takeRequestId then
			UI:ShowMsgOnTakeQuestError( result )
		end		
	end

	if requestId == self.takeRequestId then
		self.takeRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.QuestInfoWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	self:OnRegularQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	self:OnRegularQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

	if not self:IsOnScreen() then
		return
	end

	self:OnRegularQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnNotification( notification, params )

	if notification ~= _G.MasterServer.ServerNotification.SN_QUEST_PROGRESS then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	if not self.questInfo then
		return
	end

	if self.questInfo.questType ~= UI.questTypes.REGULAR then
		return
	end

	if self.questInfo.questId ~= params.questId then
		return
	end

	self:FullUpdate()	

end


--
function UI.QuestInfoWnd:OnInvasionInfo( spawned, killed )

	if not self:IsOnScreen() then
		return
	end

	if not self.questInfo then
		return
	end

	if self.questInfo.questType ~= UI.questTypes.REGULAR then
		return
	end

	local stage = 1

	if self.questState.bTaken then
		stage = UI:GetQuestStage( self.questInfo.questId )
	end

	local event = UI:GetQuestEventForStage( self.questInfo.questId, stage )

	if event == ai.GameEvent.REPEL_INVASION then

		self:UpdateTasks()
		self:UpdateProgress()

		self:RecalcLayout()

	end

end


--
function UI.QuestInfoWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnShipQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.ShipQuestOpResult.SQOR_OK then
		return
	end

	self:OnShipQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.ShipQuestOpResult.SQOR_OK then
		return
	end

	self:OnShipQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnShipQuestTime( result, requestId, questId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnShipQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnQuestTime( result, requestId, questId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnRegularQuestsChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.QuestInfoWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnAccountAurasChanged()

end


--
function UI.QuestInfoWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.takeRequestId	= 0
	self:UpdateWaitingEffect()

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.QuestInfoWnd.effectInfo =
{
	main =
	{
		workLocator	= "pers_info1",
	},

	work =
	{
		nameColorCompletedLocator	= "color_finish",
		nameColorUncompletedLocator	= "title",
		taskColorCompletedLocator	= "title50",
		taskColorUncompletedLocator	= "color_not_done",
		descLabelColorLocator		= "Color_intro",
		rewardsListLocator			= "awards",
		rewardsTextLocator			= "title58",
		minSizeLocator				= "dist_min",
		maxSizeLocator				= "self",
		descLocator					= "description",
		btnLocatorPrefix			= "btn_",
		taskLocatorPrefix			= "task_",
		nameLocator					= "title",
		cooldownLocator				= "text",
		progressLocator				= "status",
		rewardValColorLocator		= "color_price1",
		rewardLabelColorLocator		= "title58",
	},

	progressIco =
	{
		animCanBeCompleted	= "made",
		animCompleted		= "finish",
		animTime			= "start",
	},
	
	progressText =
	{
		animActive		= "start",
		animInactive	= "finish",		
	}
}

UI.QuestInfoWnd.strCooldown		= UI:GetStringByName( "tutorialQuests_cooldown" )

UI.QuestInfoWnd.sounds =
{
	hide					= "sound/ui/MsgHide",
	take					= "sound/ui/apply",
	shipSelectionWndShow	= "sound/ui/btnClick",
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.QuestInfoWnd.questInfo				= nil
UI.QuestInfoWnd.nameColorCompleted		= UI.WHITE_COLOR
UI.QuestInfoWnd.nameColorUncompleted	= UI.WHITE_COLOR
UI.QuestInfoWnd.taskColorCompleted		= UI.WHITE_COLOR
UI.QuestInfoWnd.taskColorUncompleted	= UI.WHITE_COLOR
UI.QuestInfoWnd.descLabelColor			= UI.WHITE_COLOR
UI.QuestInfoWnd.rewardValColor			= UI.WHITE_COLOR
UI.QuestInfoWnd.rewardLabelColor		= UI.WHITE_COLOR
UI.QuestInfoWnd.nameMetaText			= nil
UI.QuestInfoWnd.rewardsList				= nil
UI.QuestInfoWnd.rewardsMetaText			= nil
UI.QuestInfoWnd.closeBtn				= nil
UI.QuestInfoWnd.takeBtn					= nil
UI.QuestInfoWnd.transferToZoneBtn		= nil
UI.QuestInfoWnd.curTaskWnds				= {}
UI.QuestInfoWnd.allTaskWnds				= {}

UI.QuestInfoWnd.questState =
{
	bTaken			= false,
	bCompleted		= false,
	bCanBeCompleted	= false,
	bCanBeTaken		= false,
}

UI.QuestInfoWnd.minHeight						= 0
UI.QuestInfoWnd.maxHeight						= 0
UI.QuestInfoWnd.space_desc_btns					= 0
UI.QuestInfoWnd.space_btns_btm					= 0
UI.QuestInfoWnd.space_btns						= 0
UI.QuestInfoWnd.btnsCenter						= 0
UI.QuestInfoWnd.progressHeight					= 0
UI.QuestInfoWnd.space_task_desc					= 0
UI.QuestInfoWnd.space_name_task					= 0
UI.QuestInfoWnd.nameY							= 0		-- относительно WORK_EFFECT
UI.QuestInfoWnd.progressY						= 0		-- относительно WORK_EFFECT
UI.QuestInfoWnd.rewardsTextY					= 0		-- относительно WORK_EFFECT
UI.QuestInfoWnd.space_rewardsText_rewardsList	= 0
UI.QuestInfoWnd.space_rewardsList_cooldown		= 0
UI.QuestInfoWnd.rewardsListRight				= 0
UI.QuestInfoWnd.bPremium						= false
UI.QuestInfoWnd.takeRequestId					= 0
UI.QuestInfoWnd.space_tasks						= 0
UI.QuestInfoWnd.tasksX							= 0

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.QuestInfoWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

    self.questState =
    {
    	bTaken			= false,
    	bCompleted		= false,
    	bCanBeCompleted	= false,
		bCanBeTaken		= false,
    }

	self:CreateControls()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then

    	self.nameColorCompleted		= workEffect:GetObjColor( self.effectInfo.work.nameColorCompletedLocator )
    	self.nameColorUncompleted	= workEffect:GetObjColor( self.effectInfo.work.nameColorUncompletedLocator )
    	self.taskColorCompleted		= workEffect:GetObjColor( self.effectInfo.work.taskColorCompletedLocator )
    	self.taskColorUncompleted	= workEffect:GetObjColor( self.effectInfo.work.taskColorUncompletedLocator )
    	self.descLabelColor			= workEffect:GetObjColor( self.effectInfo.work.descLabelColorLocator )
    	self.rewardValColor			= workEffect:GetObjColor( self.effectInfo.work.rewardValColorLocator )
    	self.rewardLabelColor		= workEffect:GetObjColor( self.effectInfo.work.rewardLabelColorLocator )

	end

	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.NAME )

	self.rewardsMetaText = UI.MetaText.GetNewInstance()
	self.rewardsMetaText:InitFromLayer( self, self.layers.REWARDS )

	self:PrepareLayout()

	self:UpdateWaitingEffect()

end


--
function UI.QuestInfoWnd:F_Shutdown()

	if self.nameMetaText then
		self.nameMetaText:Clear()
	end

	if self.taskMetaText then
		self.rewardsMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.QuestInfoWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.QuestInfoWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.QuestInfoWnd:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.NAME )
	self.rewardsMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARDS )

end


--
function UI.QuestInfoWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.REWARDS then
		self.rewardsMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.QuestInfoWnd:CreateControls()

	self.rewardsList		= UI.QuestInfo_RewardsListWnd
	self.closeBtn			= UI.QuestInfo_CloseBtn
	self.takeBtn			= UI.QuestInfo_TakeQuestBtn
	self.transferToZoneBtn	= UI.QuestInfo_TransferToZoneBtn

	for idx = 1, 1 do
		self:CreateTaskWnd()
	end

end


--
function UI.QuestInfoWnd:Reset()

	self.questInfo = nil

	self.takeRequestId	= 0
	self:UpdateWaitingEffect()

	self:ResetContent()

end


--
function UI.QuestInfoWnd:ResetContent()

    self.questState =
    {
    	bTaken			= false,
    	bCompleted		= false,
    	bCanBeCompleted	= false,
		bCanBeTaken		= false,
    }

	self.bPremium = false

	self:SetLayerVisible( false, self.layers.PROGRESS_ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.DESC )
	self:SetLayerVisible( false, self.layers.COOLDOWN )

	self:SetText( "", self.layers.PROGRESS_TEXT )

	self.nameMetaText:SetText( "", true )
	self.rewardsMetaText:SetText( "", true )

	local progressBarEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BAR_EFFECT )
	if progressBarEffect then
		progressBarEffect:SetAnimationTimeAndUpdate( 0 )
	end

	self.rewardsList:Reset()
	self.rewardsList:UnlinkFromParent()	

	self:ResetBtns()
	self:ResetTaskWnds()

end


--
function UI.QuestInfoWnd:FullUpdate()

	self:ResetContent()

	if not self.questInfo then
		return
	end

	self.questState	= self:DetectQuestState()
	self.bPremium	= UI:IsPremium()

	self:UpdateProgress()
	self:UpdateName()
	self:UpdateTasks()
	self:UpdateDesc()
	self:UpdateRewards()
	self:UpdateCooldown()
	self:UpdateBtns()

	self:RecalcLayout()

end


--
function UI.QuestInfoWnd:UpdateProgress()

	local bTimeQuest = false
	if self.questInfo.questType == UI.questTypes.REGULAR then
		local stage = self.questState.bTaken and UI:GetQuestStage( self.questInfo.questId ) or 1
		local event = UI:GetQuestEventForStage( self.questInfo.questId, stage )
		bTimeQuest = event == ai.GameEvent.ONLINE
	end

	-- полоса прогресса

	local progress = 0

	if self.questState.bTaken then

		if self.questInfo.questType == UI.questTypes.REGULAR then

			local curVal = UI:GetQuestTaskCurVal( self.questInfo.questId )

			local stage = UI:GetQuestStage( self.questInfo.questId )
			local maxVal = UI:GetQuestTaskMaxVal( self.questInfo.questId, stage )

			progress = maxVal ~= 0 and curVal / maxVal or 0

		elseif self.questInfo.questType == UI.questTypes.SHIP then

			local leftTime	= UI:GetShipQuestTimeLeft( self.questInfo.questId )
			local maxTime	= UI:GetShipQuestMaxTime( self.questInfo.questId )

			local elapsedTime = maxTime - leftTime
			progress = maxTime ~= 0 and elapsedTime / maxTime or 0

		end

	end

	local progressBarEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_BAR_EFFECT )
	if progressBarEffect then
		progressBarEffect:SetAnimationTimeAndUpdate( progress )
	end


	-- иконка

	local icoAnim = ""

	if self.questState.bCompleted then
		icoAnim = self.effectInfo.progressIco.animCompleted

	elseif self.questState.bTaken then

		if self.questState.bCanBeCompleted then
			icoAnim = self.effectInfo.progressIco.animCanBeCompleted
		else
			if self.questInfo.questType == UI.questTypes.SHIP or bTimeQuest then
				icoAnim = self.effectInfo.progressIco.animTime
			end
		end

	end 

	if icoAnim ~= "" then

		self:SetLayerVisible( true, self.layers.PROGRESS_ICO_EFFECT )

		local progressIcoEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_ICO_EFFECT )
		if progressIcoEffect then
			progressIcoEffect:StartAnimation( icoAnim )
		end
		
	else
		self:SetLayerVisible( false, self.layers.PROGRESS_ICO_EFFECT )
	end


	-- текст

	-- анимация текста

	local textAnim = self.questState.bTaken and self.effectInfo.progressText.animActive or self.effectInfo.progressText.animInactive

	local progressTextEffect = UI:GetEffectFromLayer( self, self.layers.PROGRESS_TEXT_EFFECT )
	if progressTextEffect then
		progressTextEffect:StartAnimation( textAnim )
	end

	-- строка

	local str = ""

	if self.questInfo.questType == UI.questTypes.REGULAR then

		if bTimeQuest then

			local timeLeft = -1

    		if self.questState.bTaken then

    			if not self.questState.bCanBeCompleted then

	    			local stage			= UI:GetQuestStage( self.questInfo.questId )
					local timeMax		= UI:GetQuestTaskMaxVal( self.questInfo.questId, stage )
					local timeElapsed	= UI:GetQuestTaskCurVal( self.questInfo.questId )					

					timeLeft = math.max( timeMax - timeElapsed, 0 )

    			end

			else

				if not self.questState.bCompleted then
    				local stage = 1
	    			timeLeft = UI:GetQuestTaskMaxVal( self.questInfo.questId, stage )
				end

			end

    		if timeLeft ~= -1 then
    			str = UI:Time2Str45( timeLeft )
    		end

		else

    		local curVal = 0
    		local maxVal = 0

    		if self.questState.bTaken then

    			local stage = UI:GetQuestStage( self.questInfo.questId )

    			curVal = UI:GetQuestTaskCurVal( self.questInfo.questId )
    			maxVal = UI:GetQuestTaskMaxVal( self.questInfo.questId, stage )

    		elseif self.questState.bCompleted then

    			local stage = UI:GetQuestNumStages( self.questInfo.questId )

    			maxVal = UI:GetQuestTaskMaxVal( self.questInfo.questId, stage )
    			curVal = maxVal

    		else
    			local stage = 1
    			maxVal = UI:GetQuestTaskMaxVal( self.questInfo.questId, stage )
    		end

    		str = string.format( "%s/%s", UI:Num2StrSeparatedBy3( curVal ), UI:Num2StrSeparatedBy3( maxVal ) )

		end

	elseif self.questInfo.questType == UI.questTypes.SHIP then		

		local time = -1

		if self.questState.bTaken then
			if not self.questState.bCanBeCompleted then
				time = UI:GetShipQuestTimeLeft( self.questInfo.questId )
			end
		else
			time = UI:GetShipQuestMaxTime( self.questInfo.questId )
		end

		if time ~= -1 then
			str = UI:Time2Str45( time )
		end

	end

	self:SetText( str, self.layers.PROGRESS_TEXT )

end


--
function UI.QuestInfoWnd:UpdateName()

	local str	= ""
	local color	= self.questState.bCompleted and self.nameColorCompleted or self.nameColorUncompleted

	if self.questInfo.questType == UI.questTypes.REGULAR then
		str = UI:Quest2Str( self.questInfo.questId, true )

	elseif self.questInfo.questType == UI.questTypes.SHIP then
		str = UI:AvailableShipQuest2Str( self.questInfo.questId )
	end

	if self.questState.bCompleted or self.questState.bCanBeCompleted then
		local strCompleted = UI:GetStringByName( "tutorialQuests_questCompleted" )	
		str = string.format( "%s %s", str, strCompleted )		
	end

	str = string.format( "%s%s", UI:Color2Str( color ), str )

	self.nameMetaText:SetText( str, true )

end


--
function UI.QuestInfoWnd:UpdateTasks()

	self:ResetTaskWnds()

	-- для сданных квестов задание показывается только в развернутом режиме
	local bNeedTasks = not self.questState.bCompleted or self:IsExtended()
	if not bNeedTasks then
		return
	end	

	if self.questInfo.questType == UI.questTypes.REGULAR then

		-- #0074444 - отображение сразу нескольких задач убрано

		local color	= ( self.questState.bCompleted or self.questState.bCanBeCompleted ) and self.taskColorCompleted or self.taskColorUncompleted

		local stage = 1
		if self.questState.bTaken then
			stage = UI:GetQuestStage( self.questInfo.questId )
		end

		local str = UI:GetQuestTaskDesc( self.questInfo.questId, stage, true, color )

		local taskWnd = self:ObtainFreeTaskWnd()
		taskWnd:Setup( str, false, false, false )


	elseif self.questInfo.questType == UI.questTypes.SHIP then

		local color	= ( self.questState.bCompleted or self.questState.bCanBeCompleted ) and self.taskColorCompleted or self.taskColorUncompleted

		local str = UI:GetShipQuestTaskDesc( self.questInfo.questId )
		str = string.format( "%s%s", UI:Color2Str( color ), str )

		local taskWnd = self:ObtainFreeTaskWnd()
		taskWnd:Setup( str, false, false, false )

	end

end


--
function UI.QuestInfoWnd:UpdateDesc()

	if not self:IsExtended() then
		self:SetLayerVisible( false, self.layers.DESC )
		return
	end

	self:SetLayerVisible( true, self.layers.DESC )

	local str				= ""
	local baseColor			= self:GetColor( self.layers.DESC )

	local bNeedStartDesc	= not self.questState.bCanBeCompleted
	local bNeedFinishDesc	= self.questState.bCanBeCompleted or self.questState.bCompleted	

	if bNeedStartDesc then

		local startDesc = ""

		if self.questInfo.questType == UI.questTypes.REGULAR then
			startDesc = UI:GetQuestLoreDesc( self.questInfo.questId, false, baseColor )

		elseif self.questInfo.questType == UI.questTypes.SHIP then
			startDesc = UI:GetAvailableShipQuestLoreDesc( self.questInfo.questId, false, baseColor )
		end

		if self.questState.bCompleted then
			startDesc = string.format( "%s%s|%s%s", UI:Color2Str( self.descLabelColor ), UI:GetStringByName( "tutorialQuests_descLabel_new" ), UI:Color2Str( baseColor ), startDesc )
		end

		str = string.format( "%s%s%s", str, str ~= "" and "||" or "", startDesc )
		
	end

	if bNeedFinishDesc then

		local finishDesc = ""

		if self.questInfo.questType == UI.questTypes.REGULAR then
			finishDesc = UI:GetQuestLoreDesc( self.questInfo.questId, true, baseColor )

		elseif self.questInfo.questType == UI.questTypes.SHIP then
			finishDesc = UI:GetAvailableShipQuestLoreDesc( self.questInfo.questId, true , baseColor )
		end

		if self.questState.bCompleted then
			finishDesc = string.format( "%s%s|%s%s", UI:Color2Str( self.descLabelColor ), UI:GetStringByName( "tutorialQuests_descLabel_completed" ), UI:Color2Str( baseColor ), finishDesc )
		end

		str = string.format( "%s%s%s", str, str ~= "" and "||" or "", finishDesc )

	end


	self:SetText( str, self.layers.DESC )

end


--
function UI.QuestInfoWnd:UpdateRewards()

	local allRewards	= {}
	local moneyRewards	= {}
	local itemRewards	= {}

	if not self.questState.bCompleted then
	
		if self.questInfo.questType == UI.questTypes.REGULAR then
			allRewards = UI:GetQuestRewards( self.questInfo.questId, false, false, false, nil )
	
		elseif self.questInfo.questType == UI.questTypes.SHIP then	
			allRewards = UI:GetShipQuestRewards( self.questInfo.questId )
		end                     

		for rewardIdx, rewardInfo in ipairs( allRewards ) do

			if rewardInfo.rewardType == UI.questRewardTypes.GOLD
				or rewardInfo.rewardType == UI.questRewardTypes.CREDITS
				or rewardInfo.rewardType == UI.questRewardTypes.TOKENS
				or rewardInfo.rewardType == UI.questRewardTypes.SYNERGY
				or rewardInfo.rewardType == UI.questRewardTypes.CLAN_IRIDIUM
				or rewardInfo.rewardType == UI.questRewardTypes.EVENT_CREDITS then
					table.insert( moneyRewards, rewardInfo )

			elseif rewardInfo.rewardType == UI.questRewardTypes.ITEM
				or rewardInfo.rewardType == UI.questRewardTypes.ACCOUNT_AURA then
					table.insert( itemRewards, rewardInfo )

			else
				sys.log( "UI.QuestInfoWnd:UpdateRewards()[ERROR]: unhandled reward type: %s", tostring( rewardInfo.rewardType ) )
			end

		end

	end


	local strRewards = ""

	if next( allRewards ) then
		strRewards = string.format( "%s%s", UI:Color2Str( self.rewardLabelColor ), UI:GetStringByName( "tutorialQuests_rewards" ) )
	end
	
	-- награды-"валюты", в текстовом виде

	if next( moneyRewards ) then
	
		local strMoneyRewards = ""
	
		for rewardIdx, rewardInfo in ipairs( moneyRewards ) do
	
			local priceInfo =
			{
				priceType	= self:RewardType2PriceType( rewardInfo.rewardType ),
				val			= rewardInfo.val,
				bIsBuyPrice	= false,
				basePrice	= rewardInfo.val,
			}
	
			local strReward = UI:PriceInfo2Str( priceInfo, self.rewardValColor, false, true, true, nil )
			strMoneyRewards = string.format( "%s%s%s", strMoneyRewards, strMoneyRewards ~= "" and "|" or "", strReward )
	
		end
	
		strRewards = string.format( "%s|%s", strRewards, strMoneyRewards )

	end

	if strRewards ~= "" then
		self:SetLayerVisible( true, self.layers.REWARDS )
		self.rewardsMetaText:SetText( strRewards, true )
	else
		self:SetLayerVisible( false, self.layers.REWARDS )
		self.rewardsMetaText:SetText( "", true )
	end


	-- награды (вещи, ауры и т.п.) в виде иконок

	if next( itemRewards ) then
		self:AddChild( self.rewardsList )
		self.rewardsList:Setup( self.questInfo.questId, self.questInfo.questType, itemRewards )
	else
		if self.rewardsList:IsChildOf( self ) then
			self.rewardsList:Reset()
			self.rewardsList:UnlnkFromParent()
		end
	end

end


--
function UI.QuestInfoWnd:RewardType2PriceType( rewardType )

	local priceType = -1	

	if rewardType == UI.questRewardTypes.GOLD then
		priceType = _G.GameStore.CreditsType.CT_GOLD

	elseif rewardType == UI.questRewardTypes.CREDITS then
		priceType = _G.GameStore.CreditsType.CT_CREDITS

	elseif rewardType == UI.questRewardTypes.TOKENS then
		priceType = _G.GameStore.CreditsType.CT_TOKENS

	elseif rewardType == UI.questRewardTypes.SYNERGY then
		priceType = UI.exPriceTypes.SYNERGY

	elseif rewardType == UI.questRewardTypes.CLAN_IRIDIUM then
		priceType = UI.exPriceTypes.CLAN_IRIDIUM

	elseif rewardType == UI.questRewardTypes.EVENT_CREDITS then
		priceType = _G.GameStore.CreditsType.CT_EVENT

	else
		sys.log( "UI.QuestInfoWnd:RewardType2PriceType()[ERROR]: unhanlded reward type: %s", tostring( rewardType ) )
	end

	return priceType

end


--
function UI.QuestInfoWnd:UpdateCooldown()

	-- теоретически, после этой функции должен меняться layout,
	-- если сначла был кулдаун, потом его не стало, или наоборот;
	-- но на практике на истечение кулдауна приходит коллбэк, при котором апдейтится вообще всё,
	-- появление же кулдауна происходит только при каких-то других событиях, при которых также падейтится всё

	local cooldown = 0
	
	if	self.questInfo.questType == UI.questTypes.REGULAR
		and UI:IsQuestRecurrent( self.questInfo.questId )
		and not self.questState.bTaken
		and not self.questState.bCanBeTaken then

			cooldown = UI:GetQuestCooldown( self.questInfo.questId )
	end

	if cooldown > 0 then

		self:SetLayerVisible( true, self.layers.COOLDOWN )

    	local strTime = UI:Time2Str45( cooldown )
    	local str, numSubst = string.gsub( self.strCooldown, "%$time%$", strTime )

    	if numSubst == 0 then
    		str = string.format( "[INVALID_STRING] Cooldown: %s", strTime )
    	end

		self:SetText( str, self.layers.COOLDOWN )

	else
		self:SetLayerVisible( false, self.layers.COOLDOWN )
	end

end


--
function UI.QuestInfoWnd:ResetBtns()

	self.closeBtn:UnlinkFromParent()
    self.takeBtn:UnlinkFromParent()
	self.transferToZoneBtn:UnlinkFromParent()

end


--
function UI.QuestInfoWnd:UpdateBtns()

	self:ResetBtns()

	-- закрыть окно

	self:AddChild( self.closeBtn )


	if self.questInfo.questType == UI.questTypes.REGULAR then

		-- взять

		if self.questState.bCanBeTaken then

			self:AddChild( self.takeBtn )
			self.takeBtn:SetGray( false )
			self.takeBtn:SetTooltipData( nil )

		else

			if not self.questState.bTaken and UI:IsQuestRecurrent( self.questInfo.questId ) and UI:IsQuestManuallyOfferable( self.questInfo.questId ) then

				self:AddChild( self.takeBtn )
				self.takeBtn:SetGray( true )

				local tooltipData = nil
				
				local groupId = UI:GetQuestGroup( self.questInfo.questId )

				if UI:GetQuestGroupCooldown( groupId ) > 0 or UI:HasGroupActiveQuest( groupId ) then

					tooltipData =
					{
						tooltipType	= UI.tooltipTypes.TEXT_LARGE,
						caption		= UI:GetStringByName( "tutorialQuest_takeBtn_tooltipCaption_onCooldown" ),
						text		= UI:GetStringByName( "tutorialQuest_takeBtn_tooltipText_onCooldown" ),
					}
					
				else
					sys.log( "UI.QuestInfoWnd:UpdateBtns()[ERROR]: unhandled case - impossible take quest %d, but it is not on cooldown", self.questInfo.questId )
				end

				self.takeBtn:SetTooltipData( tooltipData )

			end			

		end

		-- вылететь в зону	

		if	self.questState.bTaken
			and not self.questState.bCanBeCompleted
			and self:GetZoneToTransfer() ~= -1
			and _G.GetCurrentGameMode() == ai.Gameplay.NONE then

				self:AddChild( self.transferToZoneBtn )

		end

	end

end


-- для поддержания кода, аналогичного окну UI.QuestsWnd (там может быть свернутое и развернутое состояние)
function UI.QuestInfoWnd:IsExtended()

	return not( self.questInfo.questType == UI.questTypes.REGULAR and UI:IsQuestContract( self.questInfo.questId ) )

end


--
function UI.QuestInfoWnd:PrepareLayout()

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local workEffect		= UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	local progressEffect	= UI:GetEffectFromLayer( self, self.layers.PROGRESS_EFFECT )
	local rewardsEffect		= UI:GetEffectFromLayer( self.rewardsList, self.rewardsList.layers.MAIN_EFFECT )
	local taskWnd			= self.allTaskWnds[ 1 ]
	local taskEffect		= taskWnd and UI:GetEffectFromLayer( taskWnd, taskWnd.layers.MAIN_EFFECT )

	local minSize			= workEffect and workEffect:GetObjSize( self.effectInfo.work.minSizeLocator ) or Vec2( 0, 0 )
	local maxSize			= workEffect and workEffect:GetObjSize( self.effectInfo.work.maxSizeLocator ) or Vec2( 0, 0 )
	local descPos			= workEffect and workEffect:GetObjPos( self.effectInfo.work.descLocator ) or Vec2( 0, 0 )
	local descSize			= workEffect and workEffect:GetObjSize( self.effectInfo.work.descLocator ) or Vec2( 0, 0 )
	local firstBtnPos		= workEffect and workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.btnLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondBtnPos		= workEffect and workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.btnLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local btnSize			= UI:Vec2( self.takeBtn:GetWidth(), self.takeBtn:GetHeight() )
	local progressPos		= workEffect and workEffect:GetObjPos( self.effectInfo.work.progressLocator ) or Vec2( 0, 0 )
	local progressSize		= progressEffect and progressEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local firstTaskPos		= workEffect and workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.taskLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondTaskPos		= workEffect and workEffect:GetObjPos( string.format( "%s%d", self.effectInfo.work.taskLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local taskSize			= taskEffect and taskEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local namePos			= workEffect and workEffect:GetObjPos( self.effectInfo.work.nameLocator ) or Vec2( 0, 0 )
	local nameSize			= workEffect and workEffect:GetObjSize( self.effectInfo.work.nameLocator ) or Vec2( 0, 0 )
	local cooldownPos		= workEffect and workEffect:GetObjPos( self.effectInfo.work.cooldownLocator ) or Vec2( 0, 0 )
	local workPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.workLocator ) or Vec2( 0, 0 )
	local rewardsTextPos	= workEffect and workEffect:GetObjPos( self.effectInfo.work.rewardsTextLocator ) or Vec2( 0, 0 )
	local rewardsTextSize	= workEffect and workEffect:GetObjSize( self.effectInfo.work.rewardsTextLocator ) or Vec2( 0, 0 )
	local rewardsListPos	= workEffect and workEffect:GetObjPos( self.effectInfo.work.rewardsListLocator ) or Vec2( 0, 0 )
	local rewardsListSize	= rewardsEffect and rewardsEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local cooldownPos		= workEffect and workEffect:GetObjPos( self.effectInfo.work.cooldownLocator ) or Vec2( 0, 0 )

    self.minHeight						= minSize.y
    self.maxHeight						= maxSize.y
    self.space_desc_btns				= firstBtnPos.y - ( descPos.y + descSize.y )
    self.space_btns_btm					= maxSize.y - ( firstBtnPos.y + btnSize.y )
    self.space_btns						= secondBtnPos.x - ( firstBtnPos.x + btnSize.x )
	self.btnsCenter						= workPos.x + firstBtnPos.x + btnSize.x * 0.5
	self.progressHeight					= progressSize.y
	self.space_task_desc				= descPos.y - ( firstTaskPos.y + taskSize.y )
	self.space_name_task				= firstTaskPos.y - ( namePos.y + nameSize.y )
	self.nameY							= namePos.y
	self.progressY						= progressPos.y
	self.rewardsTextY					= rewardsTextPos.y
	self.space_rewardsText_rewardsList	= rewardsListPos.y - ( rewardsTextPos.y + rewardsTextSize.y )
	self.space_rewardsList_cooldown		= cooldownPos.y - ( rewardsListPos.y + rewardsListSize.y )
	self.rewardsListRight				= rewardsListPos.x + rewardsListSize.x + workPos.x 
	self.space_tasks					= secondTaskPos.y - ( firstTaskPos.y + taskSize.y )
	self.tasksX							= firstTaskPos.x + workPos.x

	self:SetLayerLeft( workPos.x + descPos.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC )
	self:SetLayerLeft( workPos.x + cooldownPos.x, self.layers.COOLDOWN )
	self.nameMetaText:SetFormatRectSize( UI:Vec2( nameSize.x, 100000 ), true )
	self.rewardsMetaText:SetFormatRectSize( UI:Vec2( rewardsTextSize.x, 100000 ), true )

	if workEffect then
		workEffect:SetPos( workPos )
	end

end


--
function UI.QuestInfoWnd:RecalcLayout()

	-- центральный блок; учитываются название, задание, описание, кнопки

	local centerControlsBtm = self.nameY


	-- высота имени

	if self:IsLayerVisible( self.layers.NAME ) then

		local nameFormatParams = self.nameMetaText:GetFormatParams()
		local nameFormatRect = UI:Quat( 0, 0, nameFormatParams.formatRectSize.x, nameFormatParams.formatRectSize.y )

        local nameHeight = _G.MeasureText(
       		self.nameMetaText:GetFormattedText(),
       		nameFormatParams.hFont,
        	nameFormatRect,
       		nameFormatParams.formatFlags,
        	nameFormatRect ).w

		centerControlsBtm =  self.nameY + nameHeight

	end


	-- позиции заданий

	local taskTops = {}

	if next( self.curTaskWnds ) then

    	local y = centerControlsBtm + self.space_name_task

		for idx, taskWnd in ipairs( self.curTaskWnds ) do

			if idx > 1 then
				y = y + self.space_tasks
			end

			table.insert( taskTops, y )
			taskWnd:SetLeft( self.tasksX )

			y = y + taskWnd:GetHeight()

		end

		centerControlsBtm = y

	end


	-- позиция и высота описания

	local descTop = 0

	if self:IsLayerVisible( self.layers.DESC ) then

		-- позиция

		descTop = centerControlsBtm + self.space_task_desc

		-- высота

    	local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 100000 )

        local descHeight = _G.MeasureText(
       		self:GetText( self.layers.DESC ),
       		self:GetFont( self.layers.DESC ),
        	descFormatRect,
       		self:GetTextFormatFlags( self.layers.DESC ),
        	descFormatRect ).w

    	self:SetLayerHeight( descHeight, self.layers.DESC )

    	centerControlsBtm = math.max( centerControlsBtm, descTop + descHeight )

	end


	-- блок наград

	local rewardsBtm = self.rewardsTextY
	
	-- высота текстовых наград

	if self:IsLayerVisible( self.layers.REWARDS ) then

		local rewardsTextFormatParams = self.rewardsMetaText:GetFormatParams()
		local rewardsTextFormatRect = UI:Quat( 0, 0, rewardsTextFormatParams.formatRectSize.x, rewardsTextFormatParams.formatRectSize.y )

        local rewardsTextHeight = _G.MeasureText(
       		self.rewardsMetaText:GetFormattedText(),
       		rewardsTextFormatParams.hFont,
        	rewardsTextFormatRect,
       		rewardsTextFormatParams.formatFlags,
        	rewardsTextFormatRect ).w

    	rewardsBtm = self.rewardsTextY + rewardsTextHeight

	end

	-- позиция иконок наград

	local rewardsListTop = 0

	if self.rewardsList:IsChildOf( self ) then

		local rewardsListLeft = self.rewardsListRight - self.rewardsList:GetWidth()
		self.rewardsList:SetLeft( rewardsListLeft )

		rewardsListTop = rewardsBtm + self.space_rewardsText_rewardsList
		rewardsBtm = math.max( rewardsBtm, rewardsListTop + self.rewardsList:GetHeight() )

	end


	-- позиция кулдауна

	local cooldownTop = 0 
	local cooldownBtm = math.max( rewardsBtm, centerControlsBtm )

	if self:IsLayerVisible( self.layers.COOLDOWN ) then

		cooldownTop = math.max( rewardsBtm, centerControlsBtm ) + self.space_rewardsList_cooldown
		cooldownBtm = cooldownTop + self:GetLayerHeight( self.layers.COOLDOWN )

	end


	-- позиция "x" и "y" кнопок

	local btnsTop = cooldownBtm + self.space_desc_btns
	local btnsBtm = cooldownBtm

	local allBtns =
	{
        self.takeBtn,
		self.transferToZoneBtn,
		self.closeBtn,
	}

	local curBtns = {}

	for btnIdx, btn in ipairs( allBtns ) do
    	if btn:IsChildOf( self ) then
    		table.insert( curBtns, btn )
    	end
	end

	if next( curBtns ) then

		local btnsWidth = 0
		local btnMaxHeight = 0

    	for btnIdx, btn in pairs( curBtns ) do

			btnsWidth = btnsWidth + btn:GetWidth()

			local height = btn:GetHeight()
			if height > btnMaxHeight then
				btnMaxHeight = height
			end

		end

		btnsWidth = btnsWidth + ( #curBtns - 1 ) * self.space_btns

    	local btnsY = cooldownBtm + self.space_desc_btns
		local x = self.btnsCenter - btnsWidth * 0.5

    	for btnIdx, btn in ipairs( curBtns ) do

			btn:SetLeft( x )
    		btn:SetTop( btnsY )

			x = x + btn:GetWidth() + self.space_btns

    	end

		btnsBtm = btnsY + btnMaxHeight

	end


	-- прогресс

	local progressBtm = 0

	if self:IsLayerVisible( self.layers.PROGRESS_EFFECT ) then
		progressBtm = self.progressY + self.progressHeight
	end


	-- учитываются все элементы
	local totalControlsBtm = math.max( btnsBtm, progressBtm )


	-- анимация фона

	local workHeight = totalControlsBtm + self.space_btns_btm
	workHeight = UI:Clamp( workHeight, self.minHeight, self.maxHeight )

	local animTime = ( workHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then		
		workEffect:SetAnimationTimeAndUpdate( animTime )
	end	


	-- позиция "y" фона

	local workTop = self:YToWindow( ( 768 - workHeight ) * 0.5 )

	if workEffect then
		workEffect:SetPos( UI:Vec2( workEffect:GetPos().x, workTop ) )
	end


	-- позиции "y" элементов, зависимых от фона

	if next( self.curTaskWnds ) then
		for taskIdx, taskWnd in ipairs( self.curTaskWnds ) do
			taskWnd:SetTop( taskTops[ taskIdx ] + workTop )
		end
	end

	if self:IsLayerVisible( self.layers.DESC ) then
		self:SetLayerTop( descTop + workTop, self.layers.DESC )
	end

	if self.rewardsList:IsChildOf( self ) then
		self.rewardsList:SetTop( rewardsListTop + workTop )
	end

	if self:IsLayerVisible( self.layers.COOLDOWN ) then
		self:SetLayerTop( cooldownTop + workTop, self.layers.COOLDOWN )
	end

	for btnIdx, btn in pairs( allBtns ) do
		btn:SetTop( btnsTop + workTop )
	end

	self:UpdateMetaTextPos()

end


--
function UI.QuestInfoWnd:DetectQuestState()

	local questState =
	{
		bTaken			= false,
		bCompleted		= false,
		bCanBeCompleted	= false,
		bCanBeTaken		= false,
	}

	if self.questInfo.questType == UI.questTypes.REGULAR then

		questState.bTaken = UI:IsQuestTaken( self.questInfo.questId )

		if not UI:IsQuestRecurrent( self.questInfo.questId ) then
			questState.bCompleted = UI:IsQuestCompleted( self.questInfo.questId )
		end

		if questState.bTaken then
			questState.bCanBeCompleted = UI:CanQuestBeCompleted( self.questInfo.questId )
		else
			if UI:IsQuestRecurrent( self.questInfo.questId ) then
				questState.bCanBeTaken = UI:IsQuestOffered( self.questInfo.questId )
			else
				questState.bCanBeTaken = not questState.bCompleted
			end
		end

	elseif self.questInfo.questType == UI.questTypes.SHIP then

		questState.bTaken = UI:IsShipQuestTaken( self.questInfo.questId )

		if questState.bTaken then
			questState.bCanBeCompleted = UI:IsShipQuestCompleted( self.questInfo.questId )
		else
			if UI:IsShipQuestAvailable( self.questInfo.questId ) then
				questState.bCanBeTaken = true
			end
		end

	end

	return questState

end


--
function UI.QuestInfoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.questState.bTaken and not self.questState.bCanBeCompleted then

		local bTimeQuest = false

		if self.questInfo.questType == UI.questTypes.REGULAR then

        	if self.questInfo.questType == UI.questTypes.REGULAR then
        		local stage = self.questState.bTaken and UI:GetQuestStage( self.questInfo.questId ) or 1
        		local event = UI:GetQuestEventForStage( self.questInfo.questId, stage )
        		bTimeQuest = event == ai.GameEvent.ONLINE
        	end

		elseif self.questInfo.questType == UI.questTypes.SHIP then
			bTimeQuest = true
		end

		if bTimeQuest then
			self:UpdateProgress()
		end

	end

	if self:IsLayerVisible( self.layers.COOLDOWN ) then
		self:UpdateCooldown()
	end

	self:UpdatePremium()

end


--
function UI.QuestInfoWnd:UpdatePremium()

	local bPremiumOld = self.bPremium
	self.bPremium = UI:IsPremium()

	if self.bPremium ~= bPremiumOld then
		self:OnPremiumChanged()
	end

end


--
function UI.QuestInfoWnd:OnPremiumChanged()

	self:UpdateRewards()

end


--
function UI.QuestInfoWnd:OnRegularQuestsChanged()

	if not self.questInfo then
		return
	end

	if self.questInfo.questType ~= UI.questTypes.REGULAR then
		return
	end

	self:FullUpdate()

end


--
function UI.QuestInfoWnd:OnShipQuestsChanged()

	if not self.questInfo then
		return
	end

	if self.questInfo.questType ~= UI.questTypes.SHIP then
		return
	end

	if UI:IsShipQuestAvailable( self.questInfo.questId ) then
		self:FullUpdate()
	else
		self:Close( false )
	end	

end


--
function UI.QuestInfoWnd:OnAccountAurasChanged()

	self:UpdateRewards()

end


--
function UI.QuestInfoWnd:OnEscape()

	self:Close( true )
	return true

end


--
function UI.QuestInfoWnd:Close( bSound )

	if not self:IsOnScreen() then
		return
	end

	self:Hide()

	if bSound then
		UI:PlayGlobalSound( self.sounds.hide )
	end

end


--
function UI.QuestInfoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.closeBtn then

		self:Close( true )

	elseif wnd == self.takeBtn then

		if not wnd:IsGray() then

    		if not self:IsWaiting() then

    			self:TakeQuest()
            	UI:PlayGlobalSound( self.sounds.take )

    		end

		end

	elseif wnd == self.transferToZoneBtn then

    	if not self:IsWaiting() then

			local zoneId = self:GetZoneToTransfer()
			if zoneId ~= -1 then

				UI.GameplayShipSelectWnd:Setup( zoneId )
				UI.GameplayShipSelectWnd:Show()
				UI:PlayGlobalSound( self.sounds.shipSelectionWndShow )

				self:Close( false )			

			else
				sys.log( "UI.QuestInfoWnd:F_OnMouseLButtonDown()[ERROR]: cannot find zone to transfer to" )
			end

		end

	end

	return true

end


--
function UI.QuestInfoWnd:F_OnEventSaveUiState()

	if not self.questInfo then
		return
	end

	UI.store.QuestInfoWnd =
	{
		questInfo 		= self.questInfo,
		takeRequestId	= self.takeRequestId,
	}

end


--
function UI.QuestInfoWnd:F_OnEventRestoreUiState()

	if UI.store.QuestInfoWnd then

		self.questInfo 		= UI.store.QuestInfoWnd.questInfo
		self.takeRequestId	= UI.store.QuestInfoWnd.takeRequestId

		self:UpdateWaitingEffect()

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.QuestInfoWnd = nil

	end

end


--
function UI.QuestInfoWnd:TakeQuest()

	if not self.questInfo then
		sys.log( "UI.QuestInfoWnd:TakeQuest()[ERROR]: invalid quest" )
		return
	end

	if self.questInfo.questType ~= UI.questTypes.REGULAR then
		sys.log( "UI.QuestInfoWnd:TakeQuest()[ERROR]: wrong quest type" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.QuestInfoWnd:TakeQuest()[ERROR]: is waiting for another request" )
		return
	end

	self.takeRequestId = _G.MasterServer_AcceptQuest( self.questInfo.questId )

	if self.takeRequestId == 0 then
		UI:ShowMsgOnTakeQuestError( _G.MasterServer.QuestResult.QR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.QuestInfoWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.QuestInfoWnd:IsWaiting()

	return self.takeRequestId ~= 0

end


--
function UI.QuestInfoWnd:CreateTaskWnd()

	local taskWnd = UI:CreateChildWnd( self, UI.Quests_TaskWnd, #self.allTaskWnds + 1 )
	table.insert( self.allTaskWnds, taskWnd )

	return taskWnd	

end


--
function UI.QuestInfoWnd:ObtainFreeTaskWnd()

	local freeTaskWnd = nil

	for idx, taskWnd in pairs( self.allTaskWnds ) do
		if not taskWnd:IsChildOf( self ) then
			freeTaskWnd = taskWnd
			break
		end
	end

	if not freeTaskWnd then
		freeTaskWnd = self:CreateTaskWnd()
	end

	table.insert( self.curTaskWnds, freeTaskWnd )
	self:AddChild( freeTaskWnd )

	return freeTaskWnd

end


--
function UI.QuestInfoWnd:ResetTaskWnds()

	for idx, taskWnd in pairs( self.curTaskWnds ) do
		taskWnd:Reset()
		taskWnd:UnlinkFromParent()
	end

	self.curTaskWnds = {}

end


--
function UI.QuestInfoWnd:GetZoneToTransfer()

	local zoneId = -1

	if self.questInfo.questType == UI.questTypes.REGULAR then
		zoneId = UI:GetQuestZoneToTransfer( self.questInfo.questId )
	else
		sys.log( "UI.QuestInfoWnd:GetZoneToTransfer()[ERROR]: not supported for ship quests" )
	end

	return zoneId

end


-- ------------------------------------------------------------------------
-- UI.QuestInfo_CloseBtn
-- ------------------------------------------------------------------------

UI.QuestInfo_CloseBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name		= "QuestInfo_CloseBtn",
		}
	},

	textId = "close"
}


-- ------------------------------------------------------------------------
-- UI.QuestInfo_TakeQuestBtn
-- ------------------------------------------------------------------------

UI.QuestInfo_TakeQuestBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name		= "QuestInfo_TakeQuestBtn",
		}
	},

	textId = "tutorialQuest_takeBtn"
}


-- ------------------------------------------------------------------------
-- UI.QuestInfo_TransferToZoneBtn
-- ------------------------------------------------------------------------

UI.QuestInfo_TransferToZoneBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name		= "QuestInfo_TransferToZoneBtn",
		}
	},

	textId = "hangar_undock_btn_text"
}

-- ---------------------------------------------------------------
-- UI.Quests_RewardsListWnd
-- ---------------------------------------------------------------

UI.Quests_RewardsListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Quests_RewardsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_RewardsListWnd",
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
				defName				= "quests_rewardsList",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

-- 
function UI.Quests_RewardsListWnd:Setup( questId, questType, rewards )

	if type( questId ) ~= "number" then
		sys.log( "UI.Quests_RewardsListWnd:Setup()[ERROR]: invalid type of the 1-st param (\"questId\"); \"number\" expected, gor \"%s\"", type( questId ) )
		return
	end

	if type( questType ) ~= "number" then
		sys.log( "UI.Quests_RewardsListWnd:Setup()[ERROR]: invalid type of the 2-nd param (\"questType\"); \"number\" expected, gor \"%s\"", type( questType ) )
		return
	end

	if UI:Val2Key( UI.questTypes, questType ) == "" then
		sys.log( "UI.Quests_RewardsListWnd:Setup()[ERROR]: invalid questType %d", questType )
		return
	end

	if type( rewards ) ~= "table" then
		sys.log( "UI.Quests_RewardsListWnd:Setup()[ERROR]: invalid type of the 3-rd param (\"rewards\"); \"table\" expected, gor \"%s\"", type( rewards ) )
		return
	end

	self:Reset()

	self.questId	= questId
	self.questType	= questType
	self.rewards	= rewards

	self:FullUpdate()

end


--
function UI.Quests_RewardsListWnd:Reset()

	self.questId	= -1
	self.questType	= -1	
	self.rewards	= {}

	self:ResetSlots()

end


--
function UI.Quests_RewardsListWnd:GetQuest()

	return self.questId, self.questType

end

-- ------------------------------
-- const
-- ------------------------------

UI.Quests_RewardsListWnd.layers =
{
	MAIN_EFFECT = 0,
}

UI.Quests_RewardsListWnd.effectInfo =
{
	main =
	{
		slotLocator_11	= "prod_icon_1",
		slotLocator_12	= "prod_icon_2",
		slotLocator_13	= "prod_icon_3",
		slotLocator_21	= "prod_icon_4",
	},
}

UI.Quests_RewardsListWnd.slotTypes =
{
	REGULAR		= 1,
	BIG_AURA	= 2,
	SHIP_PART	= 3,
}

UI.Quests_RewardsListWnd.maxSlotsInRow =
{
	[ UI.Quests_RewardsListWnd.slotTypes.REGULAR ]		= 3,
	[ UI.Quests_RewardsListWnd.slotTypes.BIG_AURA ]		= 2,
	[ UI.Quests_RewardsListWnd.slotTypes.SHIP_PART ]	= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Quests_RewardsListWnd.questId			= -1
UI.Quests_RewardsListWnd.questType			= -1
UI.Quests_RewardsListWnd.rewards			= {}
UI.Quests_RewardsListWnd.curSlots			= {}
UI.Quests_RewardsListWnd.allRegularSlots	= {}
UI.Quests_RewardsListWnd.allAuraBigSlots	= {}
UI.Quests_RewardsListWnd.allShipPartSlots	= {}
UI.Quests_RewardsListWnd.space_top_slots	= 0
UI.Quests_RewardsListWnd.space_slots_btm	= 0
UI.Quests_RewardsListWnd.space_left_slots	= 0
UI.Quests_RewardsListWnd.space_slots_right	= 0
UI.Quests_RewardsListWnd.space_slots_x		= 0
UI.Quests_RewardsListWnd.space_slots_y		= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Quests_RewardsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    self.rewards			= {}
    self.curSlots			= {}
    self.allRegularSlots	= {}
    self.allAuraBigSlots	= {}
	self.allShipPartSlots	= {}

	if self:IsPrototype() then
		return
	end

	self:InitSlots()
	self:PrepareLayout()

end


--
function UI.Quests_RewardsListWnd:InitSlots()

	for idx = 1, 1 do
		self:CreateRegularSlot()
	end

end


--
function UI.Quests_RewardsListWnd:CreateRegularSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Quests_RegularRewardSlotWnd, tostring( #self.allRegularSlots + 1 ) )
	table.insert( self.allRegularSlots, slotWnd )

	return slotWnd

end


--
function UI.Quests_RewardsListWnd:CreateAuraBigSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Quests_AuraBigRewardSlotWnd, tostring( #self.allAuraBigSlots + 1 ) )
	table.insert( self.allAuraBigSlots, slotWnd )

	return slotWnd

end


--
function UI.Quests_RewardsListWnd:CreateShipPartSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipPartIcoWnd, tostring( #self.allShipPartSlots + 1 ) )
	table.insert( self.allShipPartSlots, slotWnd )

	return slotWnd

end


--
function UI.Quests_RewardsListWnd:ObtainRegularSlot()

	local freeSlotWnd = nil

	for idx, slotWnd in pairs( self.allRegularSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateRegularSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	return freeSlotWnd

end


--
function UI.Quests_RewardsListWnd:ObtainAuraBigSlot()

	local freeSlotWnd = nil

	for idx, slotWnd in pairs( self.allAuraBigSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateAuraBigSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	return freeSlotWnd

end


--
function UI.Quests_RewardsListWnd:ObtainShipPartSlot()

	local freeSlotWnd = nil

	for idx, slotWnd in pairs( self.allShipPartSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateShipPartSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	return freeSlotWnd

end


--
function UI.Quests_RewardsListWnd:ResetSlots()

	for idx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.Quests_RewardsListWnd:FullUpdate()

	self:ResetSlots()

	local allSlots = {}

	for rewardIdx, reward in pairs( self.rewards ) do

		local slotType = self.slotTypes.REGULAR

		if reward.rewardType == UI.questRewardTypes.ACCOUNT_AURA then
			if UI:GetAccountAuraIco2Name( reward.defName ) ~= "" then
				slotType = self.slotTypes.BIG_AURA
			end

		elseif reward.rewardType == UI.questRewardTypes.ITEM then
			if UI:IsDefShipPart( reward.defName ) then
				slotType = self.slotTypes.SHIP_PART
			end
		end

		local slotWnd = nil

		if slotType == self.slotTypes.REGULAR then

			slotWnd = self:ObtainRegularSlot()
			slotWnd:Setup( reward )

		elseif slotType == self.slotTypes.BIG_AURA then

			slotWnd = self:ObtainAuraBigSlot()
			slotWnd:Setup( reward )

		elseif slotType == self.slotTypes.SHIP_PART then

			slotWnd = self:ObtainShipPartSlot()
			slotWnd:Setup( reward.defName, reward.count, false )

		end

		if slotWnd then
			table.insert( allSlots, { slotType = slotType, rewardIdx = rewardIdx, slotWnd = slotWnd } )
		end

	end

	local function fnSort( slotInfo1, slotInfo2 )

		if slotInfo1.slotType ~= slotInfo2.slotType then
			return slotInfo1.slotType < slotInfo2.slotType
		end

		return slotInfo1.rewardIdx < slotInfo2.rewardIdx		

	end

	table.sort( allSlots, fnSort )


	local rows		= {}

	local rowSlots	= nil
	local rowType	= nil

	for slotIdx, slotInfo in ipairs( allSlots ) do

		if rowSlots then

    		local bRowFit = slotInfo.slotType == rowType

    		if bRowFit then

    			local maxRowSlots = self.maxSlotsInRow[ rowType ]

    			if #rowSlots >= maxRowSlots then
    				bRowFit = false
    			end

    		end

    		if not bRowFit then
				rowSlots	= nil
				rowType		= nil
    		end

		end

		if not rowSlots then

			rowSlots	= {}
			rowType		= slotInfo.slotType

			table.insert( rows, rowSlots )

		end

		table.insert( rowSlots, slotInfo.slotWnd )

	end


	local maxRowWidth	= 0
	local selfWidth		= 0
	local selfHeight	= 0

	for row, rowSlots in pairs( rows ) do

		local firstSlotWnd	= rowSlots[ 1 ]
		local slotWidth		= firstSlotWnd:GetWidth()
		local slotHeight	= firstSlotWnd:GetHeight()
		local numRowSlots	= #rowSlots
		local rowWidth		= numRowSlots * slotWidth + ( numRowSlots - 1 ) * self.space_slots_x 

		if rowWidth > maxRowWidth then
			maxRowWidth = rowWidth
		end

		selfHeight = selfHeight + slotHeight + ( row > 1 and self.space_slots_y or 0 )

	end

	selfWidth = self.space_left_slots + maxRowWidth + self.space_slots_right


	local rowY = self.space_top_slots

	for row, rowSlots in ipairs( rows ) do	

		local firstSlotWnd	= rowSlots[ 1 ]
		local slotWidth		= firstSlotWnd:GetWidth()
		local slotHeight	= firstSlotWnd:GetHeight()
		local numRowSlots	= #rowSlots
		local rowWidth		= numRowSlots * slotWidth + ( numRowSlots - 1 ) * self.space_slots_x 
		local rowX			= selfWidth - self.space_slots_right - rowWidth

		for slotIdx, slotWnd in pairs( rowSlots ) do

			local slotX = rowX + ( slotIdx - 1 ) * ( slotWidth + self.space_slots_x )
			slotWnd:SetLeft( slotX )

			slotWnd:SetTop( rowY ) 

		end

		rowY = rowY + slotHeight + self.space_slots_y		

	end


	self:SetWidth( selfWidth )
	self:SetHeight( selfHeight )

end


--
function UI.Quests_RewardsListWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd		= self.allRegularSlots[ 1 ]

	local slotPos_11	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.slotLocator_11 ) or Vec2( 0, 0 )
	local slotPos_12	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.slotLocator_12 ) or Vec2( 0, 0 )
	local slotPos_13	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.slotLocator_13 ) or Vec2( 0, 0 )
	local slotPos_21	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.slotLocator_21 ) or Vec2( 0, 0 )

	local slotWidth		= slotWnd and slotWnd:GetWidth() or 0
	local slotHeight	= slotWnd and slotWnd:GetHeight() or 0
	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	-- (нумерация локаторов справа налево)

    self.space_top_slots	= slotPos_11.y
    self.space_slots_btm	= selfSize.y - ( slotPos_11.y + slotHeight )
	self.space_left_slots	= slotPos_13.x
	self.space_slots_right	= selfSize.x - ( slotPos_11.x + slotWidth )
    self.space_slots_x		= slotPos_11.x - ( slotPos_12.x + slotWidth )
    self.space_slots_y		= slotPos_21.y - ( slotPos_11.y + slotHeight )
    self.slotsRight			= slotPos_11.x + slotWidth

end


-- ----------------------------------------------------------------------------
-- UI.Quests_RegularRewardSlotWnd
-- ----------------------------------------------------------------------------

UI.Quests_RegularRewardSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Quests_RegularRewardSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ItemIcoWnd",

	props =
	{
		name		= "Quests_RegularRewardSlotWnd",	
		isPrototype	= true,
	},
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.Quests_RegularRewardSlotWnd:Setup( reward )

	self:Reset()

	self.reward = reward

	local rewardTypeName = UI:Val2Key( UI.questRewardTypes, self.reward.rewardType )

	local fnUpdateName = string.format( "Update_%s", rewardTypeName )
	local fnUpdate = self[ fnUpdateName ]

	if fnUpdate then
		fnUpdate( self )
	else
		sys.log( "UI.Quests_RegularRewardSlotWnd:Setup()[ERROR]: cannot find function \"%s()\"", fnUpdateName )
	end

end


--
function UI.Quests_RegularRewardSlotWnd:Reset()

	UI.ItemIcoWnd.Reset( self )

	self:HideMain()
	self:HideIcoMain()

	self.reward = nil

end


-- ---------------------------
-- const
-- ---------------------------

UI.Quests_RegularRewardSlotWnd.BONUS_COLOR = UI.GOLD_COLOR

-- ---------------------------
-- vars
-- ---------------------------

UI.Quests_RegularRewardSlotWnd.reward	= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Quests_RegularRewardSlotWnd:Update_ITEM()

	local defName = self.reward.defName
	local count = self.reward.count

	-- иконка

	self:SetupForItem( defName )

	if count > 1 then
		self:SetCountResources( count, self.reward.bBonusIncluded and self.BONUS_COLOR or nil )
	end

	-- тултип

	local tooltipData = UI:GetTooltipForItem( defName )
	self:SetTooltipData( tooltipData )	

end


--
function UI.Quests_RegularRewardSlotWnd:Update_ACCOUNT_AURA()

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


-- ------------------------------------------------------------------------
-- UI.Quests_AuraBigRewardSlotWnd
-- ------------------------------------------------------------------------

UI.Quests_AuraBigRewardSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Quests_AuraBigRewardSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_AuraBigRewardSlotWnd",	
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
				defName 			= "auraBigIco",
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

-- ---------------------------
-- interface funcitons
-- ---------------------------

--
function UI.Quests_AuraBigRewardSlotWnd:Setup( reward )

	self:Reset()

	self.reward = reward
	self:FullUpdate()

end


--
function UI.Quests_AuraBigRewardSlotWnd:Reset()

	self.reward			= nil
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.Quests_AuraBigRewardSlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------
-- const
-- ---------------------------

UI.Quests_AuraBigRewardSlotWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Quests_AuraBigRewardSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico"
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Quests_AuraBigRewardSlotWnd.reward		= nil
UI.Quests_AuraBigRewardSlotWnd.tooltipData	= nil

-- ---------------------------
-- work funcitons
-- ---------------------------

--
function UI.Quests_AuraBigRewardSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpateTooltip()

end


--
function UI.Quests_AuraBigRewardSlotWnd:UpdateIco()

	local hTex = UI:GetAccountAuraIco2( self.reward.defName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.Quests_AuraBigRewardSlotWnd:UpateTooltip()

	self.tooltipData = {}

    self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
	self.tooltipData.caption		= UI:AccountAura2Str( self.reward.defName )
	self.tooltipData.text			= UI:GetAccountAuraDesc( self.reward.defName )

end


-- ------------------------------------------------------------------------
-- UI.QuestInfo_RewardsListWnd
-- ------------------------------------------------------------------------

UI.QuestInfo_RewardsListWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Quests_RewardsListWnd",

		props =
		{
			name		= "QuestInfo_RewardsListWnd",
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.Quests_TaskWnd
-- ------------------------------------------------------------------------

UI.Quests_TaskWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Quests_TaskWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Quests_TaskWnd",
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
				defName 			= "quests_task",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "status",
						layer		= "UI.Quests_TaskWnd.layers.CHECKMARK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},					

					-- не линкуется по поозиции и размеру
					{
						objName		= "title50",
						layer		= "UI.Quests_TaskWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- CHECKMARK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "quests_questSlot_progress_ico",
				defaultAnimation	= "made",
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},		
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Quests_TaskWnd:Setup( str, bCheckMark, bCheckMarkGray, bPreservePlaceForCheckMark )

	self:Reset()

    self.str						= str
    self.bCheckMark					= bCheckMark
    self.bCheckMarkGray				= bCheckMarkGray
    self.bPreservePlaceForCheckMark	= bPreservePlaceForCheckMark

	self:FullUpdate()
	
end


--
function UI.Quests_TaskWnd:Reset()

    self.str						= ""
    self.bCheckMark					= false
    self.bCheckMarkGray				= false
    self.bPreservePlaceForCheckMark	= false

	self.metaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.CHECKMARK_EFFECT )

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Quests_TaskWnd.layers =
{
	MAIN_EFFECT			= 0,
	CHECKMARK_EFFECT	= 1,
	TEXT				= 2,
}

UI.Quests_TaskWnd.effectInfo =
{
	main =
	{
		textLocator	= "title50"
	},

	checkMark =
	{
		animGray	= "finish",
		animBright	= "made",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Quests_TaskWnd.str							= ""
UI.Quests_TaskWnd.bCheckMark					= false
UI.Quests_TaskWnd.bCheckMarkGray				= false
UI.Quests_TaskWnd.bPreservePlaceForCheckMark	= false

UI.Quests_TaskWnd.metaText						= nil
UI.Quests_TaskWnd.space_text_btm				= 0
UI.Quests_TaskWnd.space_checkMark_btm			= 0
UI.Quests_TaskWnd.checkMarkHeight				= 0
UI.Quests_TaskWnd.textX_withCheckMark			= 0
UI.Quests_TaskWnd.textX_woCheckMark				= 0
UI.Quests_TaskWnd.textWidth_withCheckMark		= 0
UI.Quests_TaskWnd.textWidth_woCheckMark			= 0

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Quests_TaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT )

	self:PrepareLayout()

end


--
function UI.Quests_TaskWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Quests_TaskWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Quests_TaskWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Quests_TaskWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.Quests_TaskWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Quests_TaskWnd:FullUpdate()

	self:UpdateText()
	self:UpdateCheckMark()

	self:RecalcLayout()

end


--
function UI.Quests_TaskWnd:UpdateText()

	-- размер, в котором будет форматироваться, необходимо выставить до установки текста
	local textMaxWidth =
		( self.bCheckMark or self.bPreservePlaceForCheckMark )
			and self.textWidth_withCheckMark
			or self.textWidth_woCheckMark

	self.metaText:SetFormatRectSize( UI:Vec2( textMaxWidth, 1000000 ), true )

	self.metaText:SetText( self.str, true )

end


--
function UI.Quests_TaskWnd:UpdateCheckMark()

	if self.bCheckMark then

		self:SetLayerVisible( true, self.layers.CHECKMARK_EFFECT )

		local anim = self.bCheckMarkGray and self.effectInfo.checkMark.animGray or self.effectInfo.checkMark.animBright

		local checkMarkEffect = UI:GetEffectFromLayer( self, self.layers.CHECKMARK_EFFECT )
		if checkMarkEffect then
			checkMarkEffect:StartAnimation( anim )
		end

	else
		self:SetLayerVisible( false, self.layers.CHECKMARK_EFFECT )
	end

end


--
function UI.Quests_TaskWnd:PrepareLayout()

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local checkMarkEffect	= UI:GetEffectFromLayer( self, self.layers.CHECKMARK_EFFECT )

	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 ) 
	local textPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.textLocator ) or Vec2( 0, 0 ) 
	local textSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.textLocator ) or Vec2( 0, 0 ) 
	local checkMarkSize	= checkMarkEffect and checkMarkEffect:GetObjSize( "self" ) or Vec2( 0, 0 ) 

	self.space_text_btm				= 0
	self.space_checkMark_btm		= 0
	self.checkMarkHeight			= checkMarkSize.y
	self.textX_withCheckMark		= textPos.x
	self.textX_woCheckMark			= 0
	self.textWidth_withCheckMark	= textSize.x
	self.textWidth_woCheckMark		= textPos.x + textSize.x

	self:SetWidth( selfSize.x )
	self:SetLayerTop( textPos.y, self.layers.TEXT ) 
	
end


--
function UI.Quests_TaskWnd:RecalcLayout()

	-- текст - позииция x

	local textX =
		( self.bCheckMark or self.bPreservePlaceForCheckMark )		
 			and self.textX_withCheckMark
			or self.textX_woCheckMark

	self:SetLayerLeft( textX, self.layers.TEXT )
	self:UpdateMetaTextPos()	

	-- собственная высота

	local formatParams = self.metaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, formatParams.formatRectSize.x, formatParams.formatRectSize.y )

    local textHeight = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		formatParams.hFont,
    	formatRect,
   		formatParams.formatFlags,
    	formatRect ).w

	-- при определении собственного размера галка учитывается всегда, даже если она в данный момент не рисуется,
	-- чтобы всегда было одинаковое расстояние между текстом и низом элемента

	local checkMarkEffect = UI:GetEffectFromLayer( self, self.layers.CHECKMARK_EFFECT )

	local checkMarkY	= checkMarkEffect and checkMarkEffect:GetPos().y or 0
	local textY			= self:GetLayerTop( self.layers.TEXT )

	local btm1 = checkMarkY + self.checkMarkHeight + self.space_checkMark_btm
	local btm2 = textY + textHeight + self.space_text_btm

	local selfHeight = math.max( btm1, btm2 )
	self:SetHeight( selfHeight )

end