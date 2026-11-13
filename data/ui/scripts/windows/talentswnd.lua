-- ----------------------------------------------------------------------------
--
-- Workfile: skills2wnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.TalentsWnd = {}
local tw = UI.TalentsWnd

-- ------------------------------
-- const
-- ------------------------------

tw.NUM_TIERS			= 5
tw.NUM_RANKS_PER_TIER	= UI.NUM_RANKS_PER_TIER
tw.NUM_TALENTS_PER_RANK	= 3
tw.NUM_RANKS			= tw.NUM_TIERS * tw.NUM_RANKS_PER_TIER
tw.NUM_TALENTS			= tw.NUM_RANKS * tw.NUM_TALENTS_PER_RANK

tw.layers =
{
    MAIN_EFFECT							= 0, 
	BG_EFFECT							= 1, 
    WORK_EFFECT							= 2, 
	CAPTION								= 3, 
    DECOR_1_EFFECT						= 4, 
    TREE_EFFECT							= 5,  
	TREE_TIER_1_EFFECT					= 6, 
    TREE_TIER_1_HEADER_EFFECT			= 7, 
    TREE_TIER_1_HEADER_RANK_1_EFFECT	= 8,  
    TREE_TIER_1_HEADER_RANK_1			= 9,  
    TREE_TIER_1_HEADER_RANK_2_EFFECT	= 10,
    TREE_TIER_1_HEADER_RANK_2			= 11,
    TREE_TIER_1_HEADER_RANK_3_EFFECT	= 12,
    TREE_TIER_1_HEADER_RANK_3			= 13,
    TREE_TIER_1_ROW_1_EFFECT			= 14,
    TREE_TIER_1_ROW_2_EFFECT			= 15,
    TREE_TIER_1_ROW_3_EFFECT			= 16,
	TREE_TIER_2_EFFECT					= 17,
    TREE_TIER_2_HEADER_EFFECT			= 18,
    TREE_TIER_2_HEADER_RANK_1_EFFECT	= 19,
    TREE_TIER_2_HEADER_RANK_1			= 20,
    TREE_TIER_2_HEADER_RANK_2_EFFECT	= 21,
    TREE_TIER_2_HEADER_RANK_2			= 22,
    TREE_TIER_2_HEADER_RANK_3_EFFECT	= 23,
    TREE_TIER_2_HEADER_RANK_3			= 24,
    TREE_TIER_2_ROW_1_EFFECT			= 25,
    TREE_TIER_2_ROW_2_EFFECT			= 26,
    TREE_TIER_2_ROW_3_EFFECT			= 27,
	TREE_TIER_3_EFFECT					= 28,
    TREE_TIER_3_HEADER_EFFECT			= 29,
    TREE_TIER_3_HEADER_RANK_1_EFFECT	= 30,
    TREE_TIER_3_HEADER_RANK_1			= 31,
    TREE_TIER_3_HEADER_RANK_2_EFFECT	= 32,
    TREE_TIER_3_HEADER_RANK_2			= 33,
    TREE_TIER_3_HEADER_RANK_3_EFFECT	= 34,
    TREE_TIER_3_HEADER_RANK_3			= 35,
    TREE_TIER_3_ROW_1_EFFECT			= 36,
    TREE_TIER_3_ROW_2_EFFECT			= 37,
    TREE_TIER_3_ROW_3_EFFECT			= 38,    
	TREE_TIER_4_EFFECT					= 39,
    TREE_TIER_4_HEADER_EFFECT			= 40,
    TREE_TIER_4_HEADER_RANK_1_EFFECT	= 41,
    TREE_TIER_4_HEADER_RANK_1			= 42,
    TREE_TIER_4_HEADER_RANK_2_EFFECT	= 43,
    TREE_TIER_4_HEADER_RANK_2			= 44,
    TREE_TIER_4_HEADER_RANK_3_EFFECT	= 45,
    TREE_TIER_4_HEADER_RANK_3			= 46,
    TREE_TIER_4_ROW_1_EFFECT			= 47,
    TREE_TIER_4_ROW_2_EFFECT			= 48,
    TREE_TIER_4_ROW_3_EFFECT			= 49,
	TREE_TIER_5_EFFECT					= 50,
    TREE_TIER_5_HEADER_EFFECT			= 51,
    TREE_TIER_5_HEADER_RANK_1_EFFECT	= 52,
    TREE_TIER_5_HEADER_RANK_1			= 53,
    TREE_TIER_5_HEADER_RANK_2_EFFECT	= 54,
    TREE_TIER_5_HEADER_RANK_2			= 55,
    TREE_TIER_5_HEADER_RANK_3_EFFECT	= 56,
    TREE_TIER_5_HEADER_RANK_3			= 57,
    TREE_TIER_5_ROW_1_EFFECT			= 58,
    TREE_TIER_5_ROW_2_EFFECT			= 59,
    TREE_TIER_5_ROW_3_EFFECT			= 60,
	WAIT_EFFECT							= 61,
	WAIT_TEXT							= 62,
}

tw.effectInfo =
{
	row =
	{
		slotLocatorPrefix = "icon_"
	},

	tier =
	{
		animActive		= "active",
		animInactive	= "inactive",
	},

	rank =
	{
		animActive		= "active",
		animInactive	= "inactive",
	}
}

tw.sounds =
{
	tradeWndShow			= "sound/ui/btnClick",
	slotMouseOver			= "sound/ui/btnMouseOver",
	reset					= "sound/ui/cancel",
	commit					= "sound/ui/apply",
	choose					= "sound/ui/btnClick",
	invalid					= UI.sounds.invalid,
	talentSetSlotMouseOver	= "sound/ui/btnMouseOver", 
	selectTalentSet			= "sound/ui/btnClick",
	buyTalentSet			= "sound/ui/apply",
	bindTalentSet			= "sound/ui/btnClick",
}

tw.PLAYER_STATS_UPDATE_DELAY	= 5

tw.delayedActions =
{
	NONE			= -1,
	COMMIT			= 1,
	RESET_CHOSEN	= 2,
}

-- ------------------------------
-- window definition
-- ------------------------------

UI.TalentsWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",
	
	props =
	{
		name	= "TalentsWnd",
	},

	layers =
	{
		firstOverlayLayer = tw.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "skills_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "win",	
						layer		= "UI.TalentsWnd.layers.WORK_EFFECT",
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
			visible		= false,
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "talents_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bg_1",	
						layer		= "UI.TalentsWnd.layers.DECOR_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "slots",	
						layer		= "UI.TalentsWnd.layers.TREE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "title",	
						layer		= "UI.TalentsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},	

					{
						objName		= "buy_btn",	
						wnd			= "UI.Talents_CommitBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "loading",	
						layer		= "UI.TalentsWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "skills_reset",	
						wnd			= "UI.Talents_ResetBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "btn_x",	
						wnd			= "UI.Talents_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "btn_help",	
						wnd			= "UI.Talents_HelpBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "skill_set",	
						wnd			= "UI.Talents_TalentSet_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		}, 

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "^talents_caption",
		}, 

		-- DECOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "talents_decor1",
				defaultAnimation	= "idle",
			}}
		},

		-- TREE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "talents_tree",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "tree_1",	
						layer		= "UI.TalentsWnd.layers.TREE_TIER_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "tree_2",	
						layer		= "UI.TalentsWnd.layers.TREE_TIER_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "tree_3",	
						layer		= "UI.TalentsWnd.layers.TREE_TIER_3_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "tree_4",	
						layer		= "UI.TalentsWnd.layers.TREE_TIER_4_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "tree_5",	
						layer		= "UI.TalentsWnd.layers.TREE_TIER_5_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
				}
			}}
		},

		-- WAIT_EFFECT
		[ tw.layers.WAIT_EFFECT + 1 ] =
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
						layer		= "UI.TalentsWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WAIT_TEXT
		[ tw.layers.WAIT_TEXT + 1 ] =
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

	children = { "UI.Talents_CommitBtn", "UI.Talents_ResetBtn", "UI.Talents_CrossBtn", "UI.Talents_HelpBtn", "UI.Talents_TalentSet_ListWnd" }
}


-- продолжение определения слоев

for tier = 1, tw.NUM_TIERS do

	local tierLayersDesc =
	{
		-- TREE_TIER_%d_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_tierMain",
    			defaultAnimation	= "idle",

    			links =
    			{
    				{
    					objName		= "tir",	
    					layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_HEADER_EFFECT", tier ),
    					animParams	= UI.EffectAnimParams.POS,
    				},	

            		{
            			objName		= "slot_1",
            			layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_ROW_1_EFFECT", tier ),
            			animParams	= UI.EffectAnimParams.POS,			
            		},

            		{
            			objName		= "slot_2",
            			layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_ROW_2_EFFECT", tier ),
            			animParams	= UI.EffectAnimParams.POS,			
            		},

            		{
            			objName		= "slot_3",
            			layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_ROW_3_EFFECT", tier ),
            			animParams	= UI.EffectAnimParams.POS,			
            		}
    			}
    		}}		
    	},

		-- TREE_TIER_%d_HEADER_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_tierHeader",
    			defaultAnimation	= "inactive",

    			links =
    			{
            		{
            			objName		= "rank_1",
            			layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_HEADER_RANK_1_EFFECT", tier ),
            			animParams	= UI.EffectAnimParams.POS,			
            		},

            		{
            			objName		= "rank_2",
            			layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_HEADER_RANK_2_EFFECT", tier ),
            			animParams	= UI.EffectAnimParams.POS,			
            		},

            		{
            			objName		= "rank_3",
            			layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_HEADER_RANK_3_EFFECT", tier ),
            			animParams	= UI.EffectAnimParams.POS,			
            		}
    			}
    		}}		
    	},

		-- TREE_TIER_%d_HEADER_RANK_1_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_rank",
    			defaultAnimation	= "inactive",

    			links =
    			{
    				{
    					objName		= "rank_1",	
    					layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_HEADER_RANK_1", tier ),
    					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    				},	
				}
			}}
		},

		-- TREE_TIER_%d_HEADER_RANK_1
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= tostring( ( tier - 1 ) * tw.NUM_RANKS_PER_TIER + 1 ),
		}, 

		-- TREE_TIER_%d_HEADER_RANK_2_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_rank",
    			defaultAnimation	= "inactive",

    			links =
    			{
    				{
    					objName		= "rank_1",	
    					layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_HEADER_RANK_2", tier ),
    					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    				},	
				}
			}}
		},   

		-- TREE_TIER_%d_HEADER_RANK_2
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= tostring( ( tier - 1 ) * tw.NUM_RANKS_PER_TIER + 2 ),
		}, 

		-- TREE_TIER_%d_HEADER_RANK_3_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_rank",
    			defaultAnimation	= "inactive",

    			links =
    			{
    				{
    					objName		= "rank_1",	
    					layer		= string.format( "UI.TalentsWnd.layers.TREE_TIER_%d_HEADER_RANK_3", tier ),
    					animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    				},	
				}
			}}
		},

		-- TREE_TIER_%d_HEADER_RANK_3
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= tostring( ( tier - 1 ) * tw.NUM_RANKS_PER_TIER + 3 ),
		}, 

		-- TREE_TIER_%d_ROW_1_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_row",
    			defaultAnimation	= "idle",
			}}
		},

		-- TREE_TIER_%d_ROW_2_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_row",
    			defaultAnimation	= "idle",
			}}
		},

		-- TREE_TIER_%d_ROW_3_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

    		effects =
    		{{
    			defName 			= "talents_row",
    			defaultAnimation	= "idle",
			}}
		},
	}

	local numTierLayers = #tierLayersDesc
	local firstLayerIdx = tw.layers.TREE_TIER_1_EFFECT + ( tier - 1 ) * numTierLayers

	for tierLayerIdx = 1, numTierLayers do
		tw.def.layers[ firstLayerIdx + tierLayerIdx ] = tierLayersDesc[ tierLayerIdx ]
	end

end


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.TalentsWnd:IsTalentChosen( talent )

	for rank, chosenTalent in pairs( self.chosenTalents ) do
		if chosenTalent == talent then
			return true
		end
	end

	return false

end


--
function UI.TalentsWnd:OnBuyWndResult( result, mode, data )

	if result == true then

		if mode == UI.BuyWnd.modes.TALENTS_RESET then
			self:DoResetActiveTalents()

		elseif mode == UI.BuyWnd.modes.BUY_TALENT_SET then
			self:DoBuyTalentSet( data.talentSetId )

		else
			sys.log( "UI.TalentsWnd:OnBuyWndResult()[ERROR]: unhandled mode - %s", tostring( mode ) )
		end

	end

end


--
function UI.TalentsWnd:SkillManager_OnTalentsUpdate( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.SkillManager.TalentResult.TR_OK then
		return
	end

	UI.Talents_TalentSet_ListWnd:OnTalentsUpdate()

	self:ValidateChosenTalents()
	self:UpdateSlots()	
	self:UpdateResetBtnState()

end


--
function UI.TalentsWnd:SkillManager_OnTalentsReset( result, requestId, talentSetId )

	local resetRequestId = self.resetRequestId

	if requestId == self.resetRequestId then
		self.resetRequestId = 0
		self:UpdateWaitingState()
	end

	if result == _G.SkillManager.TalentResult.TR_OK	then

		if self:IsOnScreen() then
		
			UI.Talents_TalentSet_ListWnd:OnTalentsReset( talentSetId )

			if talentSetId == self:GetSelTalentSet() then

    			self:ResetChosenTalents()
    			self:UpdateSlots()	
    			self:UpdateResetBtnState()

			end

		end

	else

		if requestId == resetRequestId then
			self:ShowMsgOnResetError( result )
		end

	end

end


--
function UI.TalentsWnd:SkillManager_OnTalentsAcquisition( result, requestId, talents, talentSetId )

	local commitRequestId = self.commitRequestId

	if requestId == self.commitRequestId then
		self.commitRequestId = 0
		self:UpdateWaitingState()
	end

	if result == _G.SkillManager.TalentResult.TR_OK	then

		if self:IsOnScreen() then
		
			UI.Talents_TalentSet_ListWnd:OnTalentsAcquisition( talentSetId )

			if talentSetId == self:GetSelTalentSet() then

    			self:ValidateChosenTalents()
    			self:UpdateSlotsOnCommit()
    			self:UpdateResetBtnState()

			end

		end

	else

		if requestId == commitRequestId then
			self:ShowMsgOnCommitError( result )
		end

	end

end


--
function UI.TalentsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.Talents_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end


--
function UI.TalentsWnd:MasterServer_OnMaxVesselRankChange( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	UI.Talents_TalentSet_ListWnd:OnMaxVesselRankChange()
	
	self:ValidateChosenTalents()
	self:UpdateSlots()
	self:UpdateReputation()

end


--
function UI.TalentsWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end

	UI.Talents_TalentSet_ListWnd:OnAccountRank()

end


--
function UI.TalentsWnd:HasUncommittedTalents()

	return next( self.chosenTalents ) ~= nil

end


--
function UI.TalentsWnd:CheckClose()

	if not self:HasUncommittedTalents() then
		return true
	end

	self:ShowCommitTalentRequest()

	return false

end


--
function UI.TalentsWnd:SkillManager_OnBuyTalentSet( result, requestId, param1, param2 )

	if result == _G.MasterServer.GenericResponderResult.GRR_OK then

		if self:IsOnScreen() then
			UI.Talents_TalentSet_ListWnd:OnBuyTalentSet()
		end

	else

		if requestId == self.buyTalentSetRequestId then
			self:ShowMsgOnBuyTalentSetError( result )
		end

	end

	if requestId == self.buyTalentSetRequestId then
		self.buyTalentSetRequestId = 0
		self:UpdateWaitingState()
	end

end


--
function UI.TalentsWnd:SkillManager_OnSetTalentBindings( result, requestId, param1, param2 )

	if result == _G.MasterServer.GenericResponderResult.GRR_OK then

		if self:IsOnScreen() then
			UI.Talents_TalentSet_ListWnd:OnSetTalentBindings()
		end

	else

		if requestId == self.talentSetBindRequestId then
			self:ShowMsgOnBindTalentSetError( result )
		end

	end

	if requestId == self.talentSetBindRequestId then
		self.talentSetBindRequestId = 0
		self:UpdateWaitingState()
	end

end


-- нет самостоятельной подписки, вызывается из UI.Root:F_OnEventMasterServerDisconnectedSync
function UI.TalentsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

    self.resetRequestId			= 0
    self.commitRequestId		= 0
    self.buyTalentSetRequestId	= 0
    self.talentSetBindRequestId	= 0

	self.savedSelTalentSet = nil

	self:UpdateWaitingEffect()

end


-- ------------------------------
-- vars
-- ------------------------------

tw.slots						= {}
tw.chosenTalents				= {}
tw.resetRequestId				= 0
tw.commitRequestId				= 0
tw.buyTalentSetRequestId		= 0
tw.talentSetBindRequestId		= 0
tw.hMsgCommitBeforeClose		= UI.INVALID_UI_HANDLE
tw.savedSelTalentSet			= nil
tw.bLockTalentSlotsUpdate		= false
tw.delayedAction				= tw.delayedActions.NONE
tw.talentSetToSelectAfterCommit	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.TalentsWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.TalentsWnd:F_OnAfterShowOnScreen()

	if not next( self.slots ) then
		self:InitSlots()
	end

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

end


--
function UI.TalentsWnd:InitSlots()

	if next( self.slots ) then
		return
	end

	if type( _G.TalentGroups ) ~= "table" then
		sys.log( "UI.TalentsWnd:InitSlots()[ERROR]: cannot find _G.TalentGroups or it is not of type \"table\"" )
		return
	end

	for rank = 1, #_G.TalentGroups do

		local talentsByRank = _G.TalentGroups[ rank ]
		for row = 1, #talentsByRank do

			local slotIdx = self:RankRow2SlotIdx( rank, row )
			if slotIdx >= 1 and slotIdx <= self.NUM_TALENTS then

				local talent = talentsByRank[ row ]

				local slotWnd = UI:CreateChildWnd( self, UI.Talents_SlotWnd, talent )
				slotWnd:Init( talent )

				local tier = math.floor( ( rank - 1 ) / self.NUM_RANKS_PER_TIER ) + 1

				local slotParentLayerName = string.format( "TREE_TIER_%d_ROW_%d_EFFECT", tier, row )
				local slotParentLayer = self.layers[ slotParentLayerName ]
				local slotParentEffect = UI:GetEffectFromLayer( self, slotParentLayer )

				local locatorName = string.format( "%s%d", self.effectInfo.row.slotLocatorPrefix, math.fmod( rank - 1, self.NUM_RANKS_PER_TIER ) + 1 )

				UI:AddChildAndLink( self, slotWnd, slotParentEffect, locatorName, UI.EffectAnimParams.POS )

				self.slots[ slotIdx ] = slotWnd				

			else
				sys.log( "UI.TalentsWnd:InitSlots()[ERROR]: cannot show slot with rank %d and row %d", rank, row )				
			end

		end

	end

end


--
function UI.TalentsWnd:RankRow2SlotIdx( rank, row )

	return self.NUM_TIERS * self.NUM_RANKS_PER_TIER * ( row - 1 )  + ( rank - 1 ) + 1

end


--
function UI.TalentsWnd:Reset()

	self:ResetSlots()
	UI.Talents_CommitBtn:Enable( false )
	UI.Talents_ResetBtn:Reset()
	self:ResetLockedTierEffect()
	self.chosenTalents = {}
	UI.Talents_TalentSet_ListWnd:Clear()
	self.delayedAction = self.delayedActions.NONE
	self.talentSetToSelectAfterCommit = -1

end


--
function UI.TalentsWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
	end

end


--
function UI.TalentsWnd:FullUpdate()

	local chosenTalents		= self.chosenTalents
	local delayedAction		= self.delayedAction

	self:Reset()

	self.bLockTalentSlotsUpdate = true

	UI.Talents_TalentSet_ListWnd:Update()
	self:ValidateTalentSetSelection()	

	self.bLockTalentSlotsUpdate = false

	if UI.bSavingGameState then
		self.chosenTalents	= chosenTalents
		self.delayedAction	= delayedAction
	end

	self:UpdateSlots()
	self:UpdateReputation()
	self:UpdateCommitBtnState()
	self:UpdateResetBtnState()
	self:UpdateLockedTierEffect()
	self:UpdateWaitingState()

end


--
function UI.TalentsWnd:UpdateSlots()

	if self.bLockTalentSlotsUpdate then
		return
	end

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:FullUpdate()
	end

end


--
function UI.TalentsWnd:UpdateReputation()
	
	local playerShipsRank = UI:GetShipsMaxRank()
	local playerTier = self:GetTierForRank( playerShipsRank )

	for tier = 1, self.NUM_TIERS do

		local tierLayerName = string.format( "TREE_TIER_%d_HEADER_EFFECT", tier )
		local tierLayer = self.layers[ tierLayerName ]
		local tierEffect = UI:GetEffectFromLayer( self, tierLayer )

		if tierEffect then

			local bTierActive = tier <= playerTier

			local anim = bTierActive and self.effectInfo.tier.animActive or self.effectInfo.tier.animInactive
			tierEffect:StartAnimation( anim )			

		end

	end

	for rank = 1, self.NUM_RANKS do

		local tier = self:GetTierForRank( rank )
		local idxInTier = math.fmod( rank - 1, self.NUM_RANKS_PER_TIER ) + 1

		local rankLayerName = string.format( "TREE_TIER_%d_HEADER_RANK_%d_EFFECT", tier, idxInTier )
		local rankLayer = self.layers[ rankLayerName ]
		local rankEffect = UI:GetEffectFromLayer( self, rankLayer )

		if rankEffect then

			local bRankActive = rank <= playerShipsRank
			local anim = bRankActive and self.effectInfo.rank.animActive or self.effectInfo.rank.animInactive
			rankEffect:StartAnimation( anim )

		end

	end

end


--
function UI.TalentsWnd:GetTierForRank( rank )

	return math.floor( ( rank - 1 ) / self.NUM_TALENTS_PER_RANK ) + 1

end


--
function UI.TalentsWnd:ResetChosenTalents()

	for rank, talent in pairs( self.chosenTalents ) do
		self:ResetChosenTalentForRank( rank )
	end

end


--
function UI.TalentsWnd:ChooseTalent( talent )

	if self:IsWaiting() then
		sys.log( "UI.TalentsWnd:ChooseTalent()[ERROR]: is waiting!" )
	end

	if not self:CanChooseTalent( talent, false ) then
		sys.log( "UI.TalentsWnd:ChooseTalent()[ERROR]: cannot choose talent \"%s\"", talent )
		return
	end

    local talentRank = UI:GetTalentRank( talent )

	local oldTalent = self.chosenTalents[ talentRank ] or ""

	local talentSetId = UI.TalentsWnd:GetSelTalentSet()
	local bActive = UI:IsTalentActive( talent, talentSetId )

	if not bActive then
		self.chosenTalents[ talentRank ] = talent
	else
		self.chosenTalents[ talentRank ] = nil
	end

	if oldTalent ~= "" then
		local oldTalentSlot = self:GetSlotForTalent( oldTalent )
		if oldTalentSlot then
			oldTalentSlot:Choose( false )
		else
			sys.log( "UI.TalentsWnd:ChooseTalent()[ERROR]: cannot find slot for talent %s", oldTalent )
		end
	end

	if not bActive then
    	local newTalentSlot = self:GetSlotForTalent( talent )
    	if newTalentSlot then
    		newTalentSlot:Choose( true )
    	else
    		sys.log( "UI.TalentsWnd:ChooseTalent()[ERROR]: cannot find slot for talent %s", talent )
    	end
	end

	self:OnChosenTalentsChanged()

end


--
function UI.TalentsWnd:ResetChosenTalentForRank( rank )

	local oldTalent = self.chosenTalents[ rank ]

	if UI:IsStrEmpty( oldTalent ) then
		return
	end

	self.chosenTalents[ rank ] = nil

	local oldTalentSlot = self:GetSlotForTalent( oldTalent )
	if oldTalentSlot then
		oldTalentSlot:Choose( false )
	else
		sys.log( "UI.TalentsWnd:ResetChosenTalentForRank()[ERROR]: cannot find slot for talent %s", oldTalent )
	end

	self:OnChosenTalentsChanged()

end


--
function UI.TalentsWnd:GetSlotForTalent( talent )

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:GetTalent() == talent then
			return slotWnd
		end
	end

	sys.log( "UI.TalentsWnd:GetSlotForTalent()[ERROR]; cannot find slot for talent \"%s\"", talent )
	return nil

end


--
function UI.TalentsWnd:CanChooseTalent( talent, bIgnoreCurChosen )

	if type( talent ) ~= "string" or talent == "" then
		sys.log( "UI.TalentsWnd:CanChooseTalent()[ERROR]: invalid param: %s", tostring( talent ) )
		return false
	end

	local talentSetId = self:GetSelTalentSet()
	if talentSetId == -1 then
		return false
	end

	if not UI:IsTalentAvailable( talent, talentSetId ) then
		return false
	end

	if not bIgnoreCurChosen then
    	if self:IsTalentChosen( talent ) then
    		return false
    	end	
	end

	return true	

end


--
function UI.TalentsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( w, "Talents_SlotWnd" ) then
		self:TryChooseTalent( w:GetTalent() )

	elseif w == UI.Talents_CommitBtn then

		self:TryCommitChosenTalents()

	elseif w == UI.Talents_ResetBtn or ( w:IsChildOf( UI.Talents_ResetBtn ) and UI.Talents_ResetBtn:IsEnabled() and not UI.Talents_ResetBtn:IsGray() ) then

		self:TryResetActiveTalents()

	elseif w == UI.Talents_CrossBtn then

		self.talentSetToSelectAfterCommit = -1
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )

	elseif UI:IsWndKindOf( w, "Talents_TalentSet_SlotWnd" ) then

		local data = w:GetRecordData()		
		if data.talentSetId ~= self:GetSelTalentSet() then

			if data.bUnlocked then
    			self:TrySelectTalentSet( data.talentSetId )
			else
				UI:PlayGlobalSound( self.sounds.invalid )
			end

		end

	elseif UI:IsWndKindOf( w, "Talents_TalentSet_BuyBtn" ) then

		local talentSetId = w:GetParent():GetRecordData().talentSetId
		self:TryBuyTalentSet( talentSetId )			

	elseif UI:IsWndKindOf( w, "Talents_TalentSet_BattleSlotIcoWnd" ) then
	
		if not w:IsGray() then

			local battleSlotIdx	= w:GetBattleSlotIdx()
			local talentSetId	= w:GetParent():GetTalentSetId()

			self:TryToggleTalentSetBind( battleSlotIdx, talentSetId )

		else
			UI:PlayGlobalSound( self.sounds.invalid )
		end

	end

	return true

end


--
function UI.TalentsWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )	

	if UI:IsWndKindOf( w, "Talents_SlotWnd" ) then

		local talent = w:GetTalent()
		
		if not UI:IsTalentActive( talent, self:GetSelTalentSet() ) and self:CanChooseTalent( talent, true ) then
			self:DoCommitTalents( { talent } )
		end

	end

	return true

end


--
function UI.TalentsWnd:TryChooseTalent( talent )

	if self:IsWaiting() then
		return
	end

	if not self:CanChooseTalent( talent, false ) then
		return
	end

	self:ChooseTalent( talent )
	UI:PlayGlobalSound( self.sounds.choose )

end


--
function UI.TalentsWnd:OnChosenTalentsChanged()

	self:UpdateCommitBtnState()	

	if self.talentSetToSelectAfterCommit ~= -1 then
		self:SelectTalentSet( self.talentSetToSelectAfterCommit )
		self.talentSetToSelectAfterCommit = -1		
	else
		UI.HangarWnd:CheckContinueSetMenuTab( self )
	end

end


--
function UI.TalentsWnd:LaunchBuyWnd( mode, data )

	UI.Talents_BuyWnd:Setup( mode, true, data )
	UI.Talents_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.TalentsWnd:UpdateCommitBtnState()

	local bHasChosenTalents = next( self.chosenTalents ) ~= nil
	UI.Talents_CommitBtn:Enable( bHasChosenTalents )

end


--
function UI.TalentsWnd:UpdateResetBtnState()

	UI.Talents_ResetBtn:Update()

end


--
function UI.TalentsWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		UI.Talents_BuyWnd:UnlinkFromParent()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.TalentsWnd:TryResetActiveTalents()

	if self:IsWaiting() then
		return
	end

	self:LaunchBuyWnd( UI.BuyWnd.modes.TALENTS_RESET, nil )	

end


--
function UI.TalentsWnd:DoResetActiveTalents()

	local talentSetId = self:GetSelTalentSet()

	self.resetRequestId = _G.SkillManager_ResetTalents( talentSetId )

	if self.resetRequestId == 0 then
		self:ShowMsgOnResetError( _G.SkillManager.TalentResult.TR_ERROR )
	else
		self:UpdateWaitingState()
		UI:PlayGlobalSound( self.sounds.reset )
	end

end


--
function UI.TalentsWnd:TryCommitChosenTalents()

	if self:IsWaiting() then
		return
	end

	if not next( self.chosenTalents ) then
		return
	end

	local talents = {}
	for rank, talent in pairs( self.chosenTalents ) do
		table.insert( talents, talent )
	end

	self:DoCommitTalents( talents )

end


--
function UI.TalentsWnd:DoCommitTalents( talents )

	local talentSetId = self:GetSelTalentSet()

	self.commitRequestId = _G.SkillManager_AcquireTalents( talents, talentSetId ) or 0

	if self.commitRequestId == 0 then
		self:ShowMsgOnCommitError( _G.SkillManager.TalentResult.TR_ERROR )
	else
		self:UpdateWaitingState()
		UI:PlayGlobalSound( self.sounds.commit )
	end

end


--
function UI.TalentsWnd:UpdateWaitingState()

	self:UpdateWaitingEffect()

	if self:IsOnScreen() and self.delayedAction ~= self.delayedActions.NONE and not self:IsWaiting() then
		self:DoDelayedAction()
	end

end


--
function UI.TalentsWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.TalentsWnd:IsWaiting()

	return
		self.resetRequestId ~= 0 or
		self.commitRequestId ~= 0 or
		self.buyTalentSetRequestId ~= 0 or
		self.talentSetBindRequestId ~= 0

end


--
function UI.TalentsWnd:UpdateSlotsOnCommit()

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:OnCommit()
	end

end


--
function UI.TalentsWnd:ShowMsgOnResetError( result )

	UI:ShowErrorMsg( "msg_resetTalentsError", result, "_G.SkillManager.TalentResult" )
	
end


--
function UI.TalentsWnd:ShowMsgOnCommitError( result )

	UI:ShowErrorMsg( "msg_applyTalentsError", result, "_G.SkillManager.TalentResult" )
	
end


--
function UI.TalentsWnd:ShowMsgOnBuyTalentSetError( result )

	UI:ShowErrorMsg( "msg_buyTalentSetError", result, "_G.SkillManager.TalentResult" )

end


--
function UI.TalentsWnd:ShowMsgOnBindTalentSetError( result )

	UI:ShowErrorMsg( "msg_bindTalentSetError", result, "_G.MasterServer.GenericResponderResult" )

end


--
function UI.TalentsWnd:F_OnEventSaveUiState()

	UI.store.TalentsWnd =
	{
        chosenTalents			= self.chosenTalents,
        resetRequestId			= self.resetRequestId,
        commitRequestId			= self.commitRequestId,
		buyTalentSetRequestId	= self.buyTalentSetRequestId,
		talentSetBindRequestId	= self.talentSetBindRequestId,
		delayedAction			= self.delayedAction,
		savedSelTalentSet		= self:GetSelTalentSet(),
	}

end


--
function UI.TalentsWnd:F_OnEventRestoreUiState()

	if UI.store.TalentsWnd then
		
        self.chosenTalents			= UI.store.TalentsWnd.chosenTalents
        self.resetRequestId			= UI.store.TalentsWnd.resetRequestId
        self.commitRequestId		= UI.store.TalentsWnd.commitRequestId
		self.buyTalentSetRequestId	= UI.store.TalentsWnd.buyTalentSetRequestId
		self.talentSetBindRequestId	= UI.store.TalentsWnd.talentSetBindRequestId
		self.delayedAction			= UI.store.TalentsWnd.delayedAction
		self.savedSelTalentSet		= UI.store.TalentsWnd.savedSelTalentSet

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.TalentsWnd = nil

	end

end


--
function UI.TalentsWnd:ValidateChosenTalents()

	for rank, talent in pairs( self.chosenTalents ) do
		if UI:IsTalentActive( talent, self:GetSelTalentSet() ) or not self:CanChooseTalent( talent, true ) then
			self:ResetChosenTalentForRank( rank )
		end
	end

end


--
function UI.TalentsWnd:ResetLockedTierEffect()
	-- сейчас нет
end


--
function UI.TalentsWnd:UpdateLockedTierEffect()
	-- сейчас нет
end


--
function UI.TalentsWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgCommitBeforeClose then

		self.hMsgCommitBeforeClose = UI.INVALID_UI_HANDLE

		-- пока висел месседжбокс, выбранных талантов могло не стать, т.к. мог завершиться какой-нибудь ранее начатый запрос
		if next( self.chosenTalents ) then

			if retCode == UI.MBRET_YES then

				if not self:IsWaiting() then
					self:TryCommitChosenTalents()
				else
					self.delayedAction = self.delayedActions.COMMIT
				end

			else
				self:ResetChosenTalents()
			end
			
		end

	end

end   


--
function UI.TalentsWnd:DoDelayedAction()

	if self:IsWaiting() then
		sys.log( "UI.TalentsWnd:DoDelayedAction()[ERROR]: is waiting" )
		return
	end

	if self.delayedAction == self.delayedActions.NONE then
		sys.log( "UI.TalentsWnd:DoDelayedAction()[ERROR]: no delayed action" )

	elseif self.delayedAction == self.delayedActions.COMMIT then
		self:TryCommitChosenTalents()

	elseif self.delayedAction == self.delayedActions.RESET_CHOSEN then
		self:ResetChosenTalents()

	else
		sys.log( "UI.TalentsWnd:DoDelayedAction()[ERROR]: unhandled delayed action - %s", tostring( self.delayedAction ) )
	end

	self.delayedAction = self.delayedActions.NONE

end


--
function UI.TalentsWnd:ValidateTalentSetSelection()

	local selTalentSetId = 0

	if self.savedSelTalentSet then

		if UI.bSavingGameState and self.savedSelTalentSet ~= -1 then
			selTalentSetId = self.savedSelTalentSet
		end

		self.savedSelTalentSet = nil

	end

	self:SelectTalentSet( selTalentSetId )

end


function UI.TalentsWnd:TrySelectTalentSet( talentSetId )

	if not self:IsWaiting() then

    	if self:HasUncommittedTalents() then

    		self.talentSetToSelectAfterCommit = talentSetId
    		self:ShowCommitTalentRequest()

    	else

    		self:SelectTalentSet( talentSetId )
	        UI:PlayGlobalSound( self.sounds.selectTalentSet )

    	end

	else
		UI:PlayGlobalSound( self.sounds.invalid )
	end

end


--
function UI.TalentsWnd:SelectTalentSet( talentSetId )

	if self:IsWaiting() then
		sys.log( "UI.TalentsWnd:SelectTalentSet()[ERROR]: is waiting" )
	end

	UI.Talents_TalentSet_ListWnd:SelectTalentSet( talentSetId )

end


--
function UI.TalentsWnd:GetSelTalentSet()

	local selTalentSetId = -1

	local selRecordIdx = UI.Talents_TalentSet_ListWnd:GetSelectedRecord()
	if selRecordIdx ~= -1 then

		local data = UI.Talents_TalentSet_ListWnd:GetRecordData( selRecordIdx )
		selTalentSetId = data.talentSetId		

	end

	return selTalentSetId

end  


--
function UI.TalentsWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == UI.Talents_TalentSet_ListWnd:GetUiHandle() then
		self:OnSelTalentSetChanged()
	end

end


--
function UI.TalentsWnd:OnSelTalentSetChanged()

	self:ResetChosenTalents()
	self:UpdateSlots()
	self:UpdateResetBtnState()

end


--
function UI.TalentsWnd:TryBuyTalentSet( talentSetId )

	if self:IsWaiting() then
		return
	end

	self:LaunchBuyWnd( UI.BuyWnd.modes.BUY_TALENT_SET, { talentSetId = talentSetId } )

end


--
function UI.TalentsWnd:DoBuyTalentSet( talentSetId )

	self.buyTalentSetRequestId = _G.SkillManager_BuyTalentSet( talentSetId )

	if self.buyTalentSetRequestId ~= 0 then
		UI:PlayGlobalSound( self.sounds.buyTalentSet )
	else
		self:ShowMsgOnBuyTalentSetError( _G.SkillManager.TalentResult.TR_ERROR )
	end

	self:UpdateWaitingState()

end


--
function UI.TalentsWnd:TryToggleTalentSetBind( battleSlotIdx, talentSetId )

	if self:IsWaiting() then
		return
	end

	self:DoToggleTalentSetBind( battleSlotIdx, talentSetId )

end


--
function UI.TalentsWnd:DoToggleTalentSetBind( battleSlotIdx, talentSetId )

	local bindings = UI:CopyTable2( UI.serverData.talentSetBinds )
	
	local oldTalentSetId = bindings[ battleSlotIdx ] or -1
	if oldTalentSetId == talentSetId then
		bindings[ battleSlotIdx ] = -1
	else
		bindings[ battleSlotIdx ] = talentSetId
	end

	self.talentSetBindRequestId = _G.SkillManager_SetTalentBindings( bindings )

	if self.talentSetBindRequestId ~= 0 then
		UI:PlayGlobalSound( self.sounds.bindTalentSet )
	else
		self:ShowMsgOnBindTalentSetError( _G.MasterServer.GenericResponderResult.GRR_ERROR )
	end

	self:UpdateWaitingState()

end


--
function UI.TalentsWnd:ShowCommitTalentRequest()

	if self.hMsgCommitBeforeClose == UI.INVALID_UI_HANDLE then
		self.hMsgCommitBeforeClose = UI:MessageBox( UI:GetStringByName( "talents_msgCapt_hasUnapplied" ), UI:GetStringByName( "talents_msg_hasUnapplied" ), UI.MBS_YES_NO )
	end

end


-- -----------------------------------------------------------------
-- UI.Talents_SlotWnd
-- -----------------------------------------------------------------

UI.Talents_SlotWnd = {}
local tws = UI.Talents_SlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Talents_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
	    name		= "Talents_SlotWnd",
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
				defName 			= "talents_slot",
				defaultAnimation	= "inactive",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",	
						layer		= "UI.Talents_SlotWnd.layers.MOUSE_OVER_EFFECT",
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
				defName 			= "talents_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Talents_SlotWnd:Init( talent )

	self.talent = talent

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.Talents_SlotWnd:GetTalent()
	
	return self.talent

end


--
function UI.Talents_SlotWnd:GetState()

	return self.state

end


--
function UI.Talents_SlotWnd:Choose( bChosen )

	if bChosen and self.state ~= self.states.UNLOCKED then
		sys.log( "UI.Talents_SlotWnd:Choose()[ERROR]: wrong state for choosing: %s", tostring( self.state ) )
	end

	self:UpdateState()

end


--
function UI.Talents_SlotWnd:OnCommit()

	self:UpdateState()

end


--
function UI.Talents_SlotWnd:FullUpdate()

	self:UpdateState()
	
end


--
function UI.Talents_SlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

tws.layers =
{
    MAIN_EFFECT			= 0,
    MOUSE_OVER_EFFECT	= 1,
}

tws.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",

		animLocked		= "inactive",
		animUnlocked	= "active",
		animActive		= "learn",
		animChosen		= "sel_inactiv",
	}
}

tws.states =
{
	LOCKED		= 1,
	UNLOCKED	= 2,
	ACTIVE		= 3,
	CHOSEN		= 4,
}

-- ------------------------------
-- vars
-- ------------------------------

tws.talent			= ""
tws.state			= tws.states.LOCKED
tws.tooltipData		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Talents_SlotWnd:F_PostLoad()
	
	UI.Wnd.F_PostLoad( self )

	if not self:IsPrototype() then
		self:Reset()
	end

end


--
function UI.Talents_SlotWnd:Reset()

	self.state = self.states.LOCKED

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animLocked )
	end

	self:SetMouseOver( false )

end


--
function UI.Talents_SlotWnd:UpdateState()

	local state = self.states.LOCKED

	local talentSetId = UI.TalentsWnd:GetSelTalentSet()

	if talentSetId ~= -1 then

    	if UI:IsTalentActive( self.talent, talentSetId ) then
    		state = self.states.ACTIVE

    	elseif UI.TalentsWnd:IsTalentChosen( self.talent ) then
    		state = self.states.CHOSEN

    	elseif UI:IsTalentAvailable( self.talent, talentSetId ) then
    		state = self.states.UNLOCKED
    	end

	end

	self:SetState( state )

end


--
function UI.Talents_SlotWnd:SetState( state )

	self.state = state

	self:UpdateMainAnimation()
	self:UpdateMouseOver()

end


--
function UI.Talents_SlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = ""

	if self.state == self.states.LOCKED then
		anim = self.effectInfo.main.animLocked

	elseif self.state == self.states.UNLOCKED then
		anim = self.effectInfo.main.animUnlocked

	elseif self.state == self.states.ACTIVE then
		anim = self.effectInfo.main.animActive

	elseif self.state == self.states.CHOSEN then
		anim = self.effectInfo.main.animChosen

	else
		sys.log( "UI.Talents_SlotWnd:UpdateMainAnimation()[ERROR]: unhandled state: %s", tostring( self.state ) )
	end

	mainEffect:StartAnimation( anim )

end


--
function UI.Talents_SlotWnd:UpdateIco()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local hTex = UI:GetTalentIco( self.talent )
	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )	

end


--
function UI.Talents_SlotWnd:UpdateTooltip()

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TALENT,
		talent		= self.talent,
	}

end


--
function UI.Talents_SlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if self.state ~= self.states.LOCKED then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Talents_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.TalentsWnd.sounds.slotMouseOver )
	end

end


--
function UI.Talents_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Talents_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true	

end


-- -----------------------------------------------------
-- UI.Talents_CommitBtn
-- -----------------------------------------------------

local l_effectBtnNumLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.Talents_CommitBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

    	props =
    	{
    		name			= "Talents_CommitBtn",
			selectSound		= UI.sounds.btnMouseOver,
    	},

        layers =
        {
    		numLayers = l_effectBtnNumLayers + 1,

        	-- MAIN_EFFECT
        	{
        		layerType	= UI.LAYER_EFFECT,
        		layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName				= "shop_buyBtn",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.Talents_CommitBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
    					},
    				}
    			}}
        	},

        	-- TEXT
        	{
				id = l_effectBtnNumLayers,

       			layerType		= UI.LAYER_TEXT,

       			formatInfoSz	= { 1, 1 },
       			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
       			font			= { fontName = "Small" },
				text 			= "^talents_applyBtn",
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
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "press",
    		animationDisabled	= "disable",
    	},
    }
}

-- -------------------------------------------------------------------------------
-- UI.Talents_ResetBtn
-- -------------------------------------------------------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.Talents_ResetBtn = {} 

-- ------------------------------
-- window definition
-- ------------------------------

UI.Talents_ResetBtn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "TextBtn",

 	props =
 	{
 		name = "Talents_ResetBtn",
 	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Talents_ResetBtn:Update()

	local selTalentSetId = UI.TalentsWnd:GetSelTalentSet()
	local talents = UI.serverData.talents[ selTalentSetId ] or {}
	local bHasActiveTalents = next( talents ) ~= nil

	self:Enable( bHasActiveTalents )

end


--
function UI.Talents_ResetBtn:Reset()

	self:Enable( false )

end


-- ------------------------------
-- const
-- ------------------------------

UI.Talents_ResetBtn.textId = "talents_resetBtn"


-- -----------------------------------------------------
-- UI.Talents_BuyWnd
-- -----------------------------------------------------

UI.Talents_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "Talents_BuyWnd",
    	},
	},

	mainWndName = "TalentsWnd",
}

-- ------------------------------------------------------------------------
-- UI.Talents_CrossBtn
-- ------------------------------------------------------------------------

UI.Talents_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Talents_CrossBtn"
		}
	}
}

-- ------------------------------------------------------------------------
-- UI.Talents_HelpBtn
-- ------------------------------------------------------------------------

UI.Talents_HelpBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "HelpBtn",

		props =
		{
			name	= "Shop_HelpBtn"
		}
	},

	theme = "skills"
}

-- ------------------------------------------------------------------------
-- UI.Talents_TalentSet_ListWnd
-- ------------------------------------------------------------------------

UI.Talents_TalentSet_ListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Talents_TalentSet_ListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "Talents_TalentSet_ListWnd",
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
				defName 			= "talents_talentSet_list",
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

-- ------------------------------
-- interace functions
-- ------------------------------

--
function UI.Talents_TalentSet_ListWnd:Update()

	self:Clear()

	local states = UI:GetTalentSetsStates()
	for slotIdx, state in ipairs( states ) do

		local talentSetId = slotIdx - 1

		local data =
		{
			talentSetId	= talentSetId,
			bUnlocked	= state,
		}

		self:AddRecord( data )

	end	

end


--
function UI.Talents_TalentSet_ListWnd:OnMaxVesselRankChange()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnPlayerCredits()
		end

	end

end


--
function UI.Talents_TalentSet_ListWnd:OnAccountRank()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnAccountRank()
		end

	end

end


--
function UI.Talents_TalentSet_ListWnd:OnBuyTalentSet()
	
	for recordIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( recordIdx )
		data.bUnlocked = UI:IsTalentSetUnlocked( data.talentSetId )

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnBuyTalentSet()
		end		

	end

end


--
function UI.Talents_TalentSet_ListWnd:OnSetTalentBindings()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnSetTalentBindings()
		end

	end

end


--
function UI.Talents_TalentSet_ListWnd:OnTalentsUpdate()

	for recordIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( recordIdx )
		data.bUnlocked = UI:IsTalentSetUnlocked( data.talentSetId )

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnTalentsUpdate()
		end		

	end

end


--
function UI.Talents_TalentSet_ListWnd:OnTalentsReset( talentSetId )

	for recordIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( recordIdx )
		if data.talentSetId == talentSetId then

			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnTalentsUpdate()
			end
			
			break
			
		end

	end

end


--
function UI.Talents_TalentSet_ListWnd:OnTalentsAcquisition( talentSetId )

	for recordIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( recordIdx )
		if data.talentSetId == talentSetId then

			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnTalentsUpdate()
			end
			
			break
			
		end

	end
	
end


--
function UI.Talents_TalentSet_ListWnd:SelectTalentSet( selTalentSetId )

	local selRecordIdx = -1

	if selTalentSetId ~= -1 then
		selRecordIdx = selTalentSetId + 1
	end

	if selRecordIdx ~= -1 then

		if selRecordIdx <= self:GetNumRecords() then

        	local data = self:GetRecordData( selRecordIdx )
        	if not data.bUnlocked then
        		sys.log( "UI.Talents_TalentSet_ListWnd:SetDefaultSelection()[ERROR]: try to select not unlocked set %d", selTalentSetId )
        		selRecordIdx = -1
        	end


		else
			sys.log( "UI.Talents_TalentSet_ListWnd:SelectTalentSet()[ERROR]: cannot find record for talent set %d", selTalentSetId )
			selRecordIdx = -1
		end

	end

	self:SelectRecord( selRecordIdx )

end


-- ------------------------------
-- const
-- ------------------------------

UI.Talents_TalentSet_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_1_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.Talents_TalentSet_ListWnd.btnPrototypeName 	= "Talents_TalentSet_SlotWnd"
UI.Talents_TalentSet_ListWnd.MAX_SLOTS 			= UI.MAX_TALENT_SETS
UI.Talents_TalentSet_ListWnd.listStyle 			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------------------------------------------------
-- UI.Talents_TalentSet_SlotWnd
-- ------------------------------------------------------------------------

UI.Talents_TalentSet_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Talents_TalentSet_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Talents_TalentSet_SlotWnd",
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
				defName 			= "talents_talentSet_slot",
				defaultAnimation	= "idle",

				links =
				{		
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name7",	
						layer		= "UI.Talents_TalentSet_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},	

					{
						objName		= "name8",	
						layer		= "UI.Talents_TalentSet_SlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},	

					{
						objName		= "select",	
						layer		= "UI.Talents_TalentSet_SlotWnd.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "over",	
						layer		= "UI.Talents_TalentSet_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "disable",	
						layer		= "UI.Talents_TalentSet_SlotWnd.layers.DARKENING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	
					
					{
						objName		= "blink",	
						layer		= "UI.Talents_TalentSet_SlotWnd.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

    	-- DARKENING_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "talents_talentSet_darkening",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "lock",
						layer		= "UI.Talents_TalentSet_SlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
    	},

    	-- LOCK_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "talents_talentSet_lock",
				defaultAnimation    = "idle",
			}}
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
		
		-- BLINK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_menu_btn_notify_720",
				defaultAnimation	= "idle",
			}}
		},

		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "talents_talentSet_slot_select",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "talents_talentSet_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Talents_TalentSet_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )
	self:SetLayerVisible( false, self.layers.RANK )
	self:SetLayerVisible( false, self.layers.DARKENING_EFFECT )
	self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )
	self:RemoveControl( self.battleSlotsWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( self.buyBtn, self.layers.MAIN_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.Talents_TalentSet_SlotWnd:Select( bSelect, bAnimated )

	self:UpdateSelection()

end 


--
function UI.Talents_TalentSet_SlotWnd:OnMaxVesselRankChange()  

	local data = self:GetRecordData()
	self:UpdateBlink( data )

end


--
function UI.Talents_TalentSet_SlotWnd:OnAccountRank()

	local data = self:GetRecordData()

	if not data.bUnlocked then
		self:UpdateRank( data )
	end

end


--
function UI.Talents_TalentSet_SlotWnd:OnBuyTalentSet()

	local data = self:GetRecordData()

	self:UpdateRank( data )
	self:UpdateBattleSlots( data )
	self:UpdateBuyBtn( data )
	self:UpdateDarkening( data )
	self:UpdateMouseOver( data )
	self:UpdateBlink( data )

end


--
function UI.Talents_TalentSet_SlotWnd:OnTalentsUpdate()

	local data = self:GetRecordData()

	self:UpdateRank( data )
	self:UpdateBattleSlots( data )
	self:UpdateBuyBtn( data )
	self:UpdateDarkening( data )
	self:UpdateMouseOver( data )
	self:UpdateBlink( data )

end


--
function UI.Talents_TalentSet_SlotWnd:OnSetTalentBindings()

	local data = self:GetRecordData()
	self:UpdateBlink( data )

	if self.battleSlotsWnd:IsChildOf( self ) then
		self.battleSlotsWnd:OnSetTalentBindings()
	end

end


--
function UI.Talents_TalentSet_SlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.Talents_TalentSet_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
	DARKENING_EFFECT	= 2,
	LOCK_EFFECT			= 3,
    RANK				= 4,
	BLINK_EFFECT		= 5,
    SELECT_EFFECT		= 6,
    MOUSE_OVER_EFFECT	= 7,
}

UI.Talents_TalentSet_SlotWnd.effectInfo =
{
	main =
	{
		battleSlotsLocator	= "indic",
		buyBtnLocator		= "price_btn",
		icoSpriteName		= "ico",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Talents_TalentSet_SlotWnd.battleSlotsWnd	= nil
UI.Talents_TalentSet_SlotWnd.buyBtn			= nil

UI.Talents_TalentSet_SlotWnd.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "talentSet_tooltip_caption" ),
	text		= UI:GetStringByName( "talentSet_tooltip_text" ),
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Talents_TalentSet_SlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.Talents_TalentSet_SlotWnd:CreateControls()

	self.battleSlotsWnd	= UI:CreateChildWnd( self, UI.Talents_TalentSet_BattleSlotsListWnd, "" )
	self.buyBtn			= UI:CreateChildWnd( self, UI.Talents_TalentSet_BuyBtn, "" )

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateName( data )
	self:UpdateIco( data )
	self:UpdateRank( data )
	self:UpdateBattleSlots( data )
	self:UpdateBuyBtn( data )
	self:UpdateSelection()
	self:UpdateDarkening( data )
	self:UpdateMouseOver( data )
	self:UpdateBlink( data )

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateName( data )

	local str = UI:TalentSet2Str( data.talentSetId )
	self:SetText( str, self.layers.NAME )

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local texName = string.format( "talentSet_%d", data.talentSetId )
	local hTex = UI:GetTex( texName )

	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateRank( data )

	self:SetLayerVisible( false, self.layers.RANK )

	if not data.bUnlocked then

		local talentSetRank = UI:GetTalentSetRank( data.talentSetId )

		if talentSetRank ~= -1 then
    		
    		local playerRank = UI:GetPlayerAccountRank()

    		if talentSetRank > playerRank then

    			self:SetLayerVisible( true, self.layers.RANK )

    			local strRank = UI:GetStringByName( "shop_requiredRank" )
				local strRankVal = tostring( talentSetRank )

				local numSubstRank = 0
    			strRank, numSubstRank = string.gsub( strRank, "%$rank%$", strRankVal )
				if numSubstRank == 0 then
					sys.log( "UI.Talents_TalentSet_SlotWnd:UpdateRank()[ERROR]; cannot find placeholder \"$rank$\" in string \"shop_requiredRank\"" )
					strRank = string.format( "%s %s", strRank, strRankVal )
				end

    			self:SetText( strRank, self.layers.RANK )

    		end

		end

	end	

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateBattleSlots( data )

	if data.bUnlocked then
		self:AddControl( self.battleSlotsWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.battleSlotsLocator )
		self.battleSlotsWnd:Setup( data.talentSetId )
	else
		self:RemoveControl( self.battleSlotsWnd, self.layers.MAIN_EFFECT )
	end
	
end


--
function UI.Talents_TalentSet_SlotWnd:UpdateBuyBtn( data )

	local bCanBuy = not data.bUnlocked

	if bCanBuy then
		self:AddControl( self.buyBtn, self.layers.MAIN_EFFECT, self.effectInfo.main.buyBtnLocator )
	else
		self:RemoveControl( self.buyBtn, self.layers.MAIN_EFFECT )
	end

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateSelection( data )

	local bSelected = self:IsSelected()
	self:SetLayerVisible( bSelected, self.layers.SELECT_EFFECT )

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateDarkening( data )

	local bNeedDarkening = not data.bUnlocked

	self:SetLayerVisible( bNeedDarkening, self.layers.DARKENING_EFFECT )
	self:SetLayerVisible( bNeedDarkening, self.layers.LOCK_EFFECT )

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateBlink( data )

	local bBlink = false
	
	if data.bUnlocked then	-- в принципе, это можно и не проверять - залоченный сет все равно не будет забинден на боевой слот
	
		-- мигает по тем же правилам, что и закладка в ангаре:
		-- #0044769, комм.(0170939) - "Мигать про все закладки которые назначены на боевые слоты и в которых не изучены скилы." 
		local bBound = false
		for battleSlotIdx, talentSetId in pairs( UI.serverData.talentSetBinds ) do
			if talentSetId == data.talentSetId then
				bBound = true
				break
			end
		end
		
		if bBound then
		
			local playerShipsRank = UI:GetShipsMaxRank()
			local maxTalentsRank = _G.TalentGroups and #_G.TalentGroups or 1
			local maxTalents = math.min( playerShipsRank, maxTalentsRank )

			local talents = UI.serverData.talents[ data.talentSetId ] or {}
			local numTalents = #talents
			
			bBlink = numTalents < maxTalents
			
		end
		
	end
	
	self:SetLayerVisible( bBlink, self.layers.BLINK_EFFECT )
	
end


--
function UI.Talents_TalentSet_SlotWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.Talents_TalentSet_SlotWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end   


--
function UI.Talents_TalentSet_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	local data = self:GetRecordData()
	self:UpdateMouseOver( data )

end


--
function UI.Talents_TalentSet_SlotWnd:UpdateMouseOver( data )

	local bMouseOver = false

	if data ~= nil and data.bUnlocked then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Talents_TalentSet_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.TalentsWnd.sounds.talentSetSlotMouseOver )
	end

end


--
function UI.Talents_TalentSet_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local data = self:GetRecordData()
	self:UpdateMouseOver( data )

	return true

end


--
function UI.Talents_TalentSet_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- ------------------------------------------------------------------------
-- UI.Talents_TalentSet_BattleSlotsListWnd
-- ------------------------------------------------------------------------

UI.Talents_TalentSet_BattleSlotsListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Talents_TalentSet_BattleSlotsListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Talents_TalentSet_BattleSlotsListWnd",
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
				defName 			= "talents_talentSet_battleSlotsList",
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

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Talents_TalentSet_BattleSlotsListWnd:Setup( talentSetId )

	self:Reset()

	self.talentSetId = talentSetId

	self:UpdateSlots()

end


--
function UI.Talents_TalentSet_BattleSlotsListWnd:GetTalentSetId()

	return self.talentSetId

end


--
function UI.Talents_TalentSet_BattleSlotsListWnd:Reset()

	self.talentSetId = -1

	for slotIdx, slotWnd in pairs( self.slots ) do
		slotWnd:Reset()
	end

end


--
function UI.Talents_TalentSet_BattleSlotsListWnd:OnSetTalentBindings()

	self:UpdateSlots()

end


-- ------------------------------
-- const
-- ------------------------------

UI.Talents_TalentSet_BattleSlotsListWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Talents_TalentSet_BattleSlotsListWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "slot_2_"
	}
}

UI.Talents_TalentSet_BattleSlotsListWnd.MAX_SLOTS	= 4

-- ------------------------------
-- vars
-- ------------------------------

UI.Talents_TalentSet_BattleSlotsListWnd.talentSetId	= -1
UI.Talents_TalentSet_BattleSlotsListWnd.slots		= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Talents_TalentSet_BattleSlotsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.slots = {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self:Reset()

end


--
function UI.Talents_TalentSet_BattleSlotsListWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for slotIdx = 1, self.MAX_SLOTS do

		local slotWnd = UI:CreateChildWnd( self, UI.Talents_TalentSet_BattleSlotIcoWnd, tostring( slotIdx ) )
		UI:AddChildAndLink( self, slotWnd, mainEffect, string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, slotIdx ), UI.EffectAnimParams.POS )

		slotWnd:Init( slotIdx )

		self.slots[ slotIdx ] = slotWnd

	end

end


--
function UI.Talents_TalentSet_BattleSlotsListWnd:UpdateSlots()

	for battleSlotIdx, slotWnd in pairs( self.slots ) do

		local bDisabled = battleSlotIdx > UI.serverData.battleSlotsCount
		slotWnd:SetGray( bDisabled )

		local bActive = false

		if not bDisabled then
			local boundTalentSetId = UI.serverData.talentSetBinds[ battleSlotIdx ] or -1
			bActive = boundTalentSetId == self.talentSetId
		end

		slotWnd:SetActive( bActive )

	end

end


-- ------------------------------------------------------------------------
-- UI.Talents_TalentSet_BattleSlotIcoWnd
-- ------------------------------------------------------------------------

UI.Talents_TalentSet_BattleSlotIcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Talents_TalentSet_BattleSlotIcoWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Talents_TalentSet_BattleSlotIcoWnd",
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
				defName 			= "talents_talentSet_battleSlotIco",
				defaultAnimation	= "inactive",

				links =
				{		
					{
						objName		= "self108",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Talents_TalentSet_BattleSlotIcoWnd:Init( battleSlotIdx )

	self.battleSlotIdx = battleSlotIdx
	self:UpdateTooltip()

end


--
function UI.Talents_TalentSet_BattleSlotIcoWnd:GetBattleSlotIdx()

	return self.battleSlotIdx

end


--
function UI.Talents_TalentSet_BattleSlotIcoWnd:SetActive( bActive )

	self.bActive = bActive
	self:Check( self.bActive )

end


--
function UI.Talents_TalentSet_BattleSlotIcoWnd:IsActive()

	return self.bActive

end


--
function UI.Talents_TalentSet_BattleSlotIcoWnd:Reset()

	self.bActive = false
	self:Check( false )
	self:SetGray( true )

end


--
function UI.Talents_TalentSet_BattleSlotIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.Talents_TalentSet_BattleSlotIcoWnd.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "inactive",
		animationSelect		= "inactive_over",
		animationPressed	= "inactive_over",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "active",
		animationSelect		= "active_over",
		animationPressed	= "active_over",
		animationDisabled	= "active",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Talents_TalentSet_BattleSlotIcoWnd.battleSlotIdx	= -1
UI.Talents_TalentSet_BattleSlotIcoWnd.bActive		= false
UI.Talents_TalentSet_BattleSlotIcoWnd.tooltipData	= nil


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Talents_TalentSet_BattleSlotIcoWnd:UpdateTooltip()

	local text = UI:GetStringByName( "talents_battleSlotIcoToltip_text" )
	text = string.gsub( text, "%$slot%$", tostring( self.battleSlotIdx ) )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "talents_battleSlotIcoToltip_caption" ),
		text		= text,
	}	

end


--
function UI.Talents_TalentSet_BattleSlotIcoWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if not self:IsGray() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

	return true

end


-- ------------------------------------------------------------------------
-- UI.Talents_TalentSet_BuyBtn
-- ------------------------------------------------------------------------

UI.Talents_TalentSet_BuyBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Talents_TalentSet_BuyBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Talents_TalentSet_BuyBtn",	
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers	= l_effectBtnNumLayers + 1,

    	-- MAIN_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "ships_shipSlot_priceBtn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					-- не линкуется по цвету, по цвету линкуется к другому локатору
					{
						objName		= "dlc_text",
						layer		= "UI.Talents_TalentSet_BuyBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "price",
						layer		= "UI.Talents_TalentSet_BuyBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.COLOR,
					},
				}
			}}
    	},

    	-- TEXT
    	{
			id = l_effectBtnNumLayers,

   			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 1, 1 },
   			formatFlags		= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font			= { fontName = "Small" },

			text			= UI:GetStringByName( "talents_talentSetBuy" ),
    	}, 
	}	
}

-- ------------------------------
-- const
-- ------------------------------

UI.Talents_TalentSet_BuyBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

UI.Talents_TalentSet_BuyBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}