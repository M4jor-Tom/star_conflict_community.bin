-- ----------------------------------------------------------------------------
--
-- Workfile: tutorialwnd.lua
-- Copyright й 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.TutorialWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.TutorialWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "TutorialWnd",
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
				defName 			= "tutorial_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.TutorialWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "help_tutor_2",	
						layer		= "UI.TutorialWnd.layers.WORK_EFFECT",
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
				defName 			= "tutorial_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title16",
						layer		= "UI.TutorialWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_1",
						layer		= "UI.TutorialWnd.layers.DESC_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "descript_1",
						layer		= "UI.TutorialWnd.layers.DESC_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_2",
						layer		= "UI.TutorialWnd.layers.REWARD",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.Tutorial_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.Tutorial_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_5",
						wnd			= "UI.Tutorial_StartBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "chek_box",
						wnd			= "UI.Tutorial_NotShowAgainCheckBox",
						animParams	= UI.EffectAnimParams.POS,
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
			text			= UI:GetStringByName( "tutorial_caption" ),
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
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- REWARD
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children =
	{
		"UI.Tutorial_CrossBtn",
		"UI.Tutorial_CloseBtn",
		"UI.Tutorial_StartBtn",
		"UI.Tutorial_NotShowAgainCheckBox",
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.TutorialWnd:Setup( launchMode, bRewardGot )

	if type( launchMode ) ~= "number" then
		sys.log( "UI.TutorialWnd:Setup()[ERROR]: invalid type of the #1 parameter (\"launchMode\"); \"number\" expected, got \"%s\"", type( launchMode ) )
		return
	end

	if UI:Val2Key( self.launchModes, launchMode ) == "" then
		sys.log( "UI.TutorialWnd:Setup()[ERROR]: invalid #1 parameter (\"launchMode\"); one of \"UI.TutorialWnd.launchModes\" expected, got \"%d\"", launchMode )
		return
	end

	if launchMode == self.launchModes.WIN then
    	if type( bRewardGot ) ~= "boolean" then
    		sys.log( "UI.TutorialWnd:Setup()[ERROR]: invalid type of the #2 parameter (\"bRewardGot\"); \"boolean\" expected, got \"%s\"", type( bRewardGot ) )
    		bRewardGot = false
    	end	
	end

	self:Reset()

	self.launchMode	= launchMode
	self.bRewardGot = bRewardGot

	if self.launchMode == self.launchModes.FIRST then
		self.contentMode = self.contentModes.START

	elseif self.launchMode == self.launchModes.HELP then
		self.contentMode = self.contentModes.START

	elseif self.launchMode == self.launchModes.WIN then
		self.contentMode = self.contentModes.WIN

	elseif self.launchMode == self.launchModes.LOSE then
		self.contentMode = self.contentModes.LOSE

	else
		sys.log( "UI.TutorialWnd:Setup()[ERROR]: unhandled launchMode %d", launchMode )
	end

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.TutorialWnd.launchModes =
{
	FIRST	= 1,
	HELP	= 2,
	WIN		= 3,
	LOSE	= 4,
}

UI.TutorialWnd.contentModes =
{
	START	= 1,
	WIN		= 2,
	LOSE	= 3,
}

UI.TutorialWnd.layers =
{
    MAIN_EFFECT	= 0,
    BG_EFFECT	= 1,
    WORK_EFFECT	= 2,
    CAPTION		= 3,
    DESC_1		= 4,
    DESC_2		= 5,
    REWARD		= 6,
}

UI.TutorialWnd.effectInfo =
{
	work =
	{
		bgSpriteName	= "ico15"
	}
}

UI.TutorialWnd.stage = 1	-- сейчас только одна стадия

UI.TutorialWnd.sounds =
{
	action		= UI.sounds.btnClick,
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.TutorialWnd.launchMode		= -1
UI.TutorialWnd.bRewardGot		= false
UI.TutorialWnd.contentMode		= -1
UI.TutorialWnd.rewardMetaText	= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.TutorialWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self.rewardMetaText = UI.MetaText.GetNewInstance()
	self.rewardMetaText:InitFromLayer( self, self.layers.REWARD ) 	

end


--
function UI.TutorialWnd:F_Shutdown()

	if self.rewardMetaText then
		self.rewardMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.TutorialWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.TutorialWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.TutorialWnd:UpdateMetaTextPos()

	self.rewardMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARD )

end


--
function UI.TutorialWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REWARD then
		self.rewardMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.TutorialWnd:Reset()

	self.launchMode		= -1
	self.bRewardGot		= false
	self.contentMode	= -1

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetSpriteTexture( self.effectInfo.work.bgSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.DESC_1 )
	self:SetText( "", self.layers.DESC_2 )
	self.rewardMetaText:SetText( "", true )

	UI.Tutorial_StartBtn:UnlinkFromParent()
	UI.Tutorial_NotShowAgainCheckBox:UnlinkFromParent()

end


--
function UI.TutorialWnd:FullUpdate()

	if self.contentMode == -1 then
		return
	end

	self:UpdateBgIco()
	self:UpdateDesc1()
	self:UpdateDesc2()
	self:UpdateReward()
	self:UpdateStartBtn()
	self:UpdateNotShowAgainCheckBox()

end


--
function UI.TutorialWnd:UpdateBgIco()

	local modeName = UI:Val2Key( self.contentModes, self.contentMode )
	local texName = string.format( "tutorial_%s", modeName )
	local hTex = UI:GetTex( texName )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetSpriteTexture( self.effectInfo.work.bgSpriteName, hTex )
	end

end


--
function UI.TutorialWnd:UpdateDesc1()

	local modeName = UI:Val2Key( self.contentModes, self.contentMode )
	local strId = string.format( "tutorial_%s_desc1", modeName )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.DESC_1 )

end


--
function UI.TutorialWnd:UpdateDesc2()

	local modeName = UI:Val2Key( self.contentModes, self.contentMode )
	local strId = string.format( "tutorial_%s_desc2", modeName )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.DESC_2 )

end


--
function UI.TutorialWnd:UpdateReward()

	local str = ""

	if UI.Tutorial:IsStageRewarded( self.stage ) and not self.bRewardGot then

		str = UI:GetStringByName( "tutorialReward_none" )

	else

		local reward = self:GetReward()
		local strReward = self:Reward2Str( reward )

		local strId = ""

		if self.contentMode == self.contentModes.WIN then
			strId = "tutorial_reward_got"
		else
			strId = "tutorial_reward"
		end

		str = UI:GetStringByName( strId )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$reward%$", strReward )

		if numSubst == 0 then
			sys.log( "UI.TutorialWnd:UpdateReward()[ERROR]: cannot find placeholder \"$reward$\" in string \"%s\"", strId )
			str = string.format( "[INVALID STRING] %s: %s", self.contentMode == self.contentModes.WIN and "Reward got" or "Reward", strReward )
		end

	end

	self.rewardMetaText:SetText( str, true )
	
end


--
function UI.TutorialWnd:GetReward()

	local reward = {}

	if type( _G.TutorialRewards ) ~= "table" then
		sys.log( "UI.TutorialWnd:GetReward()[ERROR]: invalid type of \"_G.TutorialRewards\"; \"table\" expected, got \"%s\"", type( _G.TutorialRewards ) )
		return reward
	end

	reward = _G.TutorialRewards[ self.stage ]

	if type( reward ) ~= "table" then
		sys.log( "UI.TutorialWnd:GetReward()[ERROR]: invalid type of \"_G.TutorialRewards[%d]\"; \"table\" expected, got \"%s\"", stage, type( reward ) )
		reward = {}
	end	

	return reward

end


--
function UI.TutorialWnd:Reward2Str( reward )

	local credits		= 0
	local gold			= 0
	local experience	= 0
	local premium		= 0

	if reward.credits ~= nil then
		if type( reward.credits ) == "number" then
			credits = reward.credits
		else
			sys.log( "UI.TutorialWnd:Reward2Str()[ERROR]: invalid type of the field \"credits\"; \"number\" or \"nil\" expected, got \"%s\"", type( reward.credits ) )
		end
	end

	if reward.goldCredits ~= nil then
		if type( reward.goldCredits ) == "number" then
			gold = reward.goldCredits 
		else
			sys.log( "UI.TutorialWnd:Reward2Str()[ERROR]: invalid type of the field \"goldCredits\"; \"number\" or \"nil\" expected, got \"%s\"", type( reward.goldCredits ) )
		end
	end

	if reward.exp ~= nil then
		if type( reward.exp ) == "number" then
			experience = reward.exp
		else
			sys.log( "UI.TutorialWnd:Reward2Str()[ERROR]: invalid type of the field \"experience\"; \"number\" or \"nil\" expected, got \"%s\"", type( reward.exp ) )
		end
	end

	if reward.premium_time ~= nil then
		if type( reward.premium_time ) == "number" then
			premium = reward.premium_time
		else
			sys.log( "UI.TutorialWnd:Reward2Str()[ERROR]: invalid type of the field \"premium_time\"; \"number\" or \"nil\" expected, got \"%s\"", type( reward.premium_time ) )
		end
	end

	local strReward = ""

	if credits > 0 then
		local strCredits = string.format( "%s$credits_big$", UI:Num2StrSeparatedBy3( credits ) )
		strReward = string.format( "%s%s%s", strReward, strReward ~= "" and ", " or "", strCredits )
	end

	if gold > 0 then
		local strGold = string.format( "%s$gold_big$", UI:Num2StrSeparatedBy3( gold ) )
		strReward = string.format( "%s%s%s", strReward, strReward ~= "" and ", " or "", strGold )
	end

	if experience > 0 then
		local strExp = string.format( "%s$synergy_free$", UI:Num2StrSeparatedBy3( experience ) )
		strReward = string.format( "%s%s%s", strReward, strReward ~= "" and ", " or "", strExp )
	end

	if premium > 0 then

		local strPremium = UI:GetStringByName( "licenseDuration" )
		local strPremiumVal = string.format( "%s%s", UI:Num2StrSeparatedBy3( premium ), UI.strHours )

		local numSubst = 0
		strPremium, numSubst = string.gsub( strPremium, "%$time%$", strPremiumVal )

		if numSubst == 0 then
			sys.log( "UI.TutorialWnd:Reward2Str()[ERROR]: cannot find placeholder \"$time$\" in string \"licenseDuration\"" )
			strPremium = string.format( "[INVALID STRING] premium time %s", strPremiumVal )
		end

		strReward = string.format( "%s%s%s", strReward, strReward ~= "" and ", " or "", strPremium )

	end

	if strReward == "" then
		strReward = "none"
	end

	return strReward

end


--
function UI.TutorialWnd:UpdateStartBtn()

	local bNeedBtn = self.contentMode ~= self.contentModes.WIN

	if bNeedBtn then
		self:AddChild( UI.Tutorial_StartBtn )
	else
		UI.Tutorial_StartBtn:UnlinkFromParent()
	end	

end


--
function UI.TutorialWnd:UpdateNotShowAgainCheckBox()

	local bNeedCheckBox =
		self.contentMode ~= self.contentModes.WIN and
		not UI.Tutorial:IsCompleted() and
		not UI.Tutorial:WasCompletedOld() and
		not UI.Tutorial:WasSkipped()

	if bNeedCheckBox then

		self:AddChild( UI.Tutorial_NotShowAgainCheckBox )

		local bNotShow = UI.Tutorial:IsNotShowRequestAgain()
		UI.Tutorial_NotShowAgainCheckBox:Check( bNotShow )

	else
		UI.Tutorial_NotShowAgainCheckBox:UnlinkFromParent()
	end

end


--
function UI.TutorialWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if wnd == UI.Tutorial_CrossBtn then
		self:OnClose()

	elseif wnd == UI.Tutorial_CloseBtn then
		self:OnClose()

	elseif wnd == UI.Tutorial_StartBtn then
		self:OnStart()

	elseif wnd == UI.Tutorial_NotShowAgainCheckBox then
		self:ToggleNotShowAgain()
	end

	return true

end


--
function UI.TutorialWnd:OnClose()

	UI:PlayGlobalSound( self.sounds.action )

	if UI.Tutorial:IsActive() then
		UI.Tutorial:OnTutorialWndResult( false, self.launchMode )
	else
		self:Hide()
	end

end


--
function UI.TutorialWnd:OnStart()

	UI:PlayGlobalSound( self.sounds.action )

	if self.contentMode ~= self.contentModes.START and self.contentMode ~= self.contentModes.LOSE then
		sys.log( "UI.TutorialWnd:OnStart()[ERROR]: invalid contentMode: %s", tostring( self.contentMode ) )
		return
	end

	if UI.Tutorial:IsActive() then

		UI.Tutorial:OnTutorialWndResult( true, self.launchMode )

	else

		if self.launchMode ~= self.launchModes.HELP then
			sys.log( "UI.TutorialWnd:OnStart()[ERROR]: tutorial is not active" )
			return
		end

		UI.Tutorial:Start( UI.Tutorial.modes.HELP )

	end

end


--
function UI.TutorialWnd:ToggleNotShowAgain()

	UI.Tutorial:SetNotShowRequestAgaian( not UI.Tutorial:IsNotShowRequestAgain() )
	self:UpdateNotShowAgainCheckBox()

end


--
function UI.TutorialWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	UI.store.TutorialWnd =
	{
		launchMode = self.launchMode,
		bRewardGot = self.bRewardGot,
	}

end


--
function UI.TutorialWnd:F_OnEventRestoreUiState()

	if UI.store.TutorialWnd then

		if UI.store.TutorialWnd.launchMode ~= -1 then
			self:Setup( UI.store.TutorialWnd.launchMode, UI.store.TutorialWnd.bRewardGot )
		end

		UI.store.TutorialWnd = nil

	end

end


-- ----------------------------------------------------------------------------
-- UI.Tutorial_CrossBtn
-- ----------------------------------------------------------------------------

UI.Tutorial_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "Tutorial_CrossBtn"
    	}
	}
}

-- ----------------------------------------------------------------------------
-- UI.Tutorial_CloseBtn
-- ----------------------------------------------------------------------------

UI.Tutorial_CloseBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "TextBtn3",

    	props =
    	{
    		name = "Tutorial_CloseBtn"
    	}
	},

	textId = "close"
}


-- ----------------------------------------------------------------------------
-- UI.Tutorial_StartBtn
-- ----------------------------------------------------------------------------

UI.Tutorial_StartBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "TextBtn2",
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
    				defName 			= "tutorial_startBtn",
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

	textId = "tutorialQuest_startTutorial",
}


-- ----------------------------------------------------------------------------
-- UI.Tutorial_NotShowAgainCheckBox
-- ----------------------------------------------------------------------------

UI.Tutorial_NotShowAgainCheckBox = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

local l_numBaseCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.Tutorial_NotShowAgainCheckBox.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Tutorial_NotShowAgainCheckBox",
		selectSound	= UI.sounds.btnMouseOver,
		clickSound	= UI.sounds.checkBox,
	},

	layers =
	{
		numLayers = l_numBaseCheckBoxLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "hangar_prepare_checkBox",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.Tutorial_NotShowAgainCheckBox.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= l_numBaseCheckBoxLayers,

			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			text			= UI:GetStringByName( "tutorial_notShowAgain" ),
		},
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Tutorial_NotShowAgainCheckBox:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Tutorial_NotShowAgainCheckBox.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT        = 2,
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Tutorial_NotShowAgainCheckBox.tooltipData =
{
	tooltipType = UI.tooltipTypes.TEXT_LARGE,
	caption = UI:GetStringByName( "tutorial_notShowAgain_tooltipCaption" ),
	text = UI:GetStringByName( "tutorial_notShowAgain_tooltipText" )
}