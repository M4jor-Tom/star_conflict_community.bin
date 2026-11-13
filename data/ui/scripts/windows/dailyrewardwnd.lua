-- ----------------------------------------------------------------------------
--
-- Workfile: DailyRewardWnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------
-- UI.DailyRewardWnd
-- -----------------------------------------------------

UI.DailyRewardWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.DailyRewardWnd.def =
{
	className = "Wnd",
	prototype = "FullScreenWnd",

	props =
	{
		name	= "DailyRewardWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "daily_reward_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "win",	
						layer 		= "UI.DailyRewardWnd.layers.WIN_EFFECT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- WIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "daily_reward_win",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "btn_sale",	
						wnd			= "UI.DailyReward_OkButton",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title",
						layer		= "UI.DailyRewardWnd.layers.TITLE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_1",
						layer		= "UI.DailyRewardWnd.layers.TEXT_LEFT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_2",
						layer		= "UI.DailyRewardWnd.layers.TEXT_RIGHT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "description_1",
						layer		= "UI.DailyRewardWnd.layers.TEXT_REWARD_DESCRIPTION",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "description_2",
						layer		= "UI.DailyRewardWnd.layers.TEXT_REWARD_TEXT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
					--[[{
						objName		= "description_3",
						layer		= "UI.DailyRewardWnd.layers.TEXT_CLOSE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},]]
				}
			}}
		},

		-- TITLE
    	{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
    		{
				fontName = "Small", 
   			},
			text = "^dailyreward_title",
    	}, 

    	-- TEXT_LEFT
    	{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
    		{
				fontName = "Small", 
   			},
			text = "^dailyreward_text_top_left",
    	}, 

    	-- TEXT_RIGHT
    	{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
    		{
				fontName = "Small", 
   			},
			text = "^dailyreward_text_top_right",
    	}, 

    	-- TEXT_REWARD_DESCRIPTION
    	{
   			layerType	= UI.LAYER_TEXT,
   			layerStyle	= UI.WLS_OWNERDRAW,
   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
    		{
				fontName = "Small", 
   			},
    	}, 

    	-- TEXT_REWARD_TEXT
    	{
   			layerType	= UI.LAYER_TEXT,
   			formatInfoSz= { 1, 2 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_HCENTER + FONT.TF_WORDBREAK,
   			font =
    		{
				fontName = "Small", 
   			},
    	}, 
    	-- TEXT_CLOSE
    	--[[{
   			layerType	= UI.LAYER_TEXT,
   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_WORDBREAK,
   			font =
    		{
				fontName = "Small", 
   			},
   			text 		= "^dailyreward_close_wnd_text"
    	}, ]]
	},

	children = { "UI.DailyReward_OkButton" }
}


UI.DailyRewardWnd.layers = 
{
	MAIN_EFFECT								= 0,
	WIN_EFFECT								= 1,
	TITLE									= 2,
	TEXT_LEFT								= 3,
	TEXT_RIGHT								= 4,
	TEXT_REWARD_DESCRIPTION					= 5,
	TEXT_REWARD_TEXT						= 6,
	--TEXT_CLOSE 								= 7,
}


-- ---------------------------------------
-- interface functions
-- ---------------------------------------

-- --------------------------
-- const
-- --------------------------

--
UI.DailyRewardWnd.sounds = 
{
	on_show = "",
	on_hide = "sound/ui/MsgHide"
}


-- --------------------------
-- vars
-- --------------------------
UI.DailyRewardWnd.slots = {}
UI.DailyRewardWnd.rewardLevel = nil
UI.DailyRewardWnd.rewardMetatext = nil
UI.DailyRewardWnd.params = nil

-- --------------------------
-- work functions
-- --------------------------

function UI.DailyRewardWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	self.rewardMetatext = UI.MetaText.GetNewInstance()
	self.rewardMetatext:InitFromLayer( self, self.layers.TEXT_REWARD_DESCRIPTION ) 
	self.rewardMetatext:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT_REWARD_DESCRIPTION ), self:GetLayerHeight( self.layers.TEXT_REWARD_DESCRIPTION ) ), true )

end

--
function UI.DailyRewardWnd:F_Shutdown()
	if self.rewardMetatext then
		self.rewardMetatext:Clear()
	end
	UI.Wnd.F_Shutdown( self )
end

--
function UI.DailyRewardWnd:MasterServer_OnNotification( notificationId, params )

	if type( notificationId ) ~= "number" then
		sys.log( "UI.DailyRewardWnd:MasterServer_OnNotification()[ERROR]: invalid type of the 1-st parameter (\"notificationId\"); \"number\" expected, got \"%s\"", type( notificationId ) )
		return
	end

	if notificationId ~= _G.MasterServer.ServerNotification.SN_DAILY_LOGIN then
		return
	end

	self.params = params

end

--
function UI.DailyRewardWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.DailyRewardWnd:UpdateMetaTextPos()
	self.rewardMetatext:UpdateScreenOrgFromLayer( self, self.layers.TEXT_REWARD_DESCRIPTION )
end

--
function UI.DailyRewardWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.TEXT_REWARD_DESCRIPTION then
		self.rewardMetatext:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end
end

--
function UI.DailyRewardWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI.DailyReward_OkButton == wnd then
		--
		self:Hide()
	end
	return true
end

--
function UI.DailyRewardWnd:OnEscape()
	--self:Hide()
	return true
end

--
function UI.DailyRewardWnd:Hide()

	UI.FullScreenWnd.Hide( self )

	local bOpenLicenses = false

	local reward = self.rewardLevel and _G.DailyLoginRewards[ self.rewardLevel + 1 ]
	if reward and reward.aura and UI:GetAccountAuraCategory( reward.aura ) == ai.AccountAuraCategory.DISCOUNT_PREM then
		bOpenLicenses = true
	end

	if bOpenLicenses then

		UI.HangarWnd:ShowLicenses( true )

	else

		UI:PlayGlobalSound( self.sounds.on_hide )

		if self.params then
	
	    	if self.params.bundles then

				if type( self.params.bundles ) == "table" then

					for bundleDefName, bundleContent in pairs( self.params.bundles ) do

						if type( bundleDefName ) == "string" and type( bundleContent ) == "table" then

							local bundleNtfParams =
							{
								bundle			= bundleDefName,
								bundleContents	= bundleContent,
							}

							if UI:NeedShowNotificationForBundle( bundleDefName ) then	--#0107019(0507181)
								UI.BundleWowWnd:ShowItems( bundleNtfParams )
								UI.Notifications:AddNotification( UI.Notifications.types.BUNDLE_GOT, bundleNtfParams )
							end

						else
							sys.log( "UI.DailyRewardWnd:Hide()[ERROR]: invalid format of \"bundles\" field; <string>=<table> expected, got <%s>=<%s>", type( bundleDefName ), type( bundleContent ) )
						end

					end

				else
					sys.log( "UI.DailyRewardWnd:Hide()[ERROR]: invalid type of \"bundles\" field; \"table\" or \"nil\" expected, got \"%s\"", type( self.params.bundles ) )
				end

	    	end
	
			self.params = nil
	
		end

	end

	-- force check autohelp
	UI:CheckAutoShowContextHelp( bImmediate )

end

--
function UI.DailyRewardWnd:F_OnEventSaveUiState()
	if self:IsOnScreen() then
		UI.store.DailyRewardWnd =
		{
			curLevel = self.rewardLevel,
			params = self.params,
		}
	end
end

--
function UI.DailyRewardWnd:F_OnEventRestoreUiState()
	if UI.store.DailyRewardWnd then
		self.rewardLevel	= UI.store.DailyRewardWnd.curLevel
		self.params = UI.store.DailyRewardWnd.params
		--self:Update( self.rewardLevel )
	end
end

--
function UI.DailyRewardWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateMetaTextPos()
	self:Update()
end

--
function UI.DailyRewardWnd:Show( level )

	if self.sounds.on_show and self.sounds.on_show ~= "" then
		UI:PlayGlobalSound( self.sounds.on_show )
	end
	self.rewardLevel = level
	UI.FullScreenWnd.Show( self )

end

--
function UI.DailyRewardWnd:GetRewardDescription( curReward, nameOnly )
	local silver = false
	local gold = false
	local premium = false
	local matrices = false
	local bundle = false
	local aura = false
	local strIdentity = "dailyreward_text"
	if curReward.goldCredits and curReward.goldCredits > 0 then
		gold = true
	end
	if curReward.credits and curReward.credits > 0 then
		silver = true
	end
	if curReward.premium and curReward.premium > 0 then
		premium = true
	end
	if curReward.matrices and curReward.matrices > 0 then
		matrices = true
	end
	if curReward.bundle and curReward.bundle ~= "" then
		bundle = true
	end
	if curReward.aura and curReward.aura ~= "" then
		aura = true
	end

	local text = UI:GetStringByName( strIdentity )
	local str = string.gsub( text, "%$color%$", "@ffffdeb4" )
	local t = str
	local comma = false
	if bundle then
		if nameOnly then
			t = ""
			if UI:GetDef( curReward.bundle ) then
				if UI:IsDefBundle( curReward.bundle ) then
					if UI:GetDef( curReward.bundle ).uiName then
						t = UI:GetStringByName( UI:GetDef( curReward.bundle ).uiName )
					else
						sys.log( "UI.DailyRewardWnd:GetRewardDescription()[ERROR]: bundle with name '%s' hasn't uiName field", curReward.bundle )
					end
				else
					sys.log( "UI.DailyRewardWnd:GetRewardDescription()[ERROR]: def with name '%s' is not bundle", curReward.bundle )
				end
			else
				sys.log( "UI.DailyRewardWnd:GetRewardDescription()[ERROR]: can't find bundle '%s'", curReward.bundle )
			end
		else
			t = UI:GetBundleDesc( curReward.bundle )
		end

	elseif aura then
		if nameOnly then
			t = UI:AccountAura2Str( curReward.aura )
		else
			t = UI:GetAccountAuraDesc( curReward.aura )
		end

	else
		if gold then
			if comma then
				t = string.gsub( t, "%$gold%$", ", @ffffdeb4"..UI:Num2StrSeparatedBy3( curReward.goldCredits ) )
			else
				t = string.gsub( t, "%$gold%$", " @ffffdeb4"..UI:Num2StrSeparatedBy3( curReward.goldCredits ) )
			end
			t = string.gsub( t, "%$goldUnits_short%$", "$texture [texName gold_small_icon]$" )
			comma = true
		else
			t = string.gsub( t, "%$gold%$", "" )
			t = string.gsub( t, "%$goldUnits_short%$", "" )
		end
		if silver then
			if comma then
				t = string.gsub( t, "%$silver%$", ", @ffffdeb4"..UI:Num2StrSeparatedBy3( curReward.credits ) )
			else
				t = string.gsub( t, "%$silver%$", " @ffffdeb4"..UI:Num2StrSeparatedBy3( curReward.credits ) )
			end
			t = string.gsub( t, "%$creditunits%$", "$texture [texName silver_small_icon]$" )
			comma = true
		else
			t = string.gsub( t, "%$silver%$", "" )
			t = string.gsub( t, "%$creditunits%$", "" )
		end
		if premium then
			if comma then
				t = string.gsub( t, "%$premium%$", ", @ffffdeb4"..UI:Num2StrSeparatedBy3( math.floor( curReward.premium / 60 ) ) )
			else
				t = string.gsub( t, "%$premium%$", " @ffffdeb4"..UI:Num2StrSeparatedBy3( math.floor( curReward.premium / 60 ) ) )
			end
			t = string.gsub( t, "%$premiumunits%$", "@ffffffff"..UI:GetStringByName( "dailyreward_text_premium_unit" ) )
			comma = true
		else
			t = string.gsub( t, "%$premium%$", "" )
			t = string.gsub( t, "%$premiumunits%$", "" )
		end
		if matrices then
			if comma then
				t = string.gsub( t, "%$matrices%$", ", @ffffdeb4"..UI:Num2StrSeparatedBy3( math.floor( curReward.matrices ) ) )
			else
				t = string.gsub( t, "%$matrices%$", " @ffffdeb4"..UI:Num2StrSeparatedBy3( math.floor( curReward.matrices ) ) )
			end
			t = string.gsub( t, "%$matricesunits%$", "@ffffffff"..UI:GetStringByName( "dailyreward_text_matrices_unit" ) )
			comma = true
		else
			t = string.gsub( t, "%$matrices%$", "" )
			t = string.gsub( t, "%$matricesunits%$", "" )
		end
	end
	return t
end

--
function UI.DailyRewardWnd:Update( level )
	
	local curLevel = level or UI.Profile:GetDailyLoginRewardIdx()
	if curLevel == nil then
		if self.rewardLevel then
			curLevel = self.rewardLevel
		else
			curLevel = 0
		end
	end
	if not self.params then
		self.params = UI.Profile:GetDailyLoginNotificationParams()
	end
	
	-- force check autohelp
	local allReward = DailyLoginRewards--_G.MasterServer_GetDailyLoginChain()
	local wndEffect = UI:GetEffectFromLayer( self, self.layers.WIN_EFFECT )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local parentWidth = mainEffect:GetObjSize( "win" ).x
	local parentLeft = mainEffect:GetObjPos( "win" ).x
	local wnd1Pos = wndEffect:GetObjPos( "slot_1" ).x
	local wnd2Pos = wndEffect:GetObjPos( "slot_2" ).x
	local wndWidth = wnd2Pos - wnd1Pos
	local wndTop = wndEffect:GetObjPos( "slot_1" ).y + mainEffect:GetObjPos( "win" ).y
	local wndLeft = ( parentWidth - ( wndWidth * #allReward ) ) / 2
	for i = 1, #allReward do
		if not self.slots[ i ] then
			self.slots[ i ] = UI:CreateChildWnd( self, UI.DailyReward_Slot, tostring( i ) )
		end
		self:AddChild( self.slots[ i ] )
		self:MoveChildToFirstPosition( self.slots[ i ] )
		self.slots[ i ]:SetData( i, curLevel + 1 )
		self.slots[ i ]:SetTop( wndTop )
		self.slots[ i ]:SetLeft( wndLeft + parentLeft )
		wndLeft = wndLeft + wndWidth
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local texture = UI:GetTex( "daily_gift_"..curLevel + 1 )
	wndEffect:SetSpriteTexture( "ico", texture )

	local str = ""
	local curReward = allReward[ curLevel + 1 ]
	if curReward == nil then
		sys.log( "UI.DailyRewardWnd:Update()[ERROR]: can't find reward for day #%d", curLevel + 1 )
	else
		if curReward.bundle ~= nil and curReward.bundle ~= "" then
			local bundleName = self:GetRewardDescription( curReward, true )
			str = UI:GetStringByName( "dailyreward_text_bundle" )
			str = string.gsub( str, "%$bundle_name%$", bundleName )
			str = string.gsub( str, "%$color%$", "@ffffdeb4" )
		else
			str = self:GetRewardDescription( curReward )
		end
	end
	
	self.rewardMetatext:SetText( str, true )
	self:SetText( UI:GetStringByName( "dailyreward_parting_words_"..tostring( curLevel + 1 ) ), self.layers.TEXT_REWARD_TEXT )

	self.rewardLevel = curLevel
	UI.Profile:ResetNeedShowDailyLoginRewardWnd()

end

-- -----------------------------------------------------
-- UI.DailyReward_Slot
-- -----------------------------------------------------

UI.DailyReward_Slot = {}

-- --------------------------
-- window definition
-- --------------------------

UI.DailyReward_Slot.def =
{
	className = "Wnd",

	props =
	{
		name	= "DailyReward_Slot",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype = true,
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
				defName 			= "daily_reward_slot",
				defaultAnimation	= "passed",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "day",	
						layer		= "UI.DailyReward_Slot.layers.DAY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- DAY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "daily_reward_slot_label",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.DailyReward_Slot.layers.TEXT_EFFECT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT_EFFECT
    	{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
    		{
				fontName = "Small", 
   			},
    	}, 
	}
}

UI.DailyReward_Slot.GetTooltipData = function( self )
		local allReward = DailyLoginRewards--_G.MasterServer_GetDailyLoginChain()
		local curReward = allReward[ self.idx ]
		local t = ""
		if curReward == nil then
			sys.log( "UI.DailyReward_Slot.GetTooltipData()[ERROR]: _G.MasterServer_GetDailyLoginChain()[ %d ] is nil!", self.idx )
		else
			t = UI.DailyRewardWnd:GetRewardDescription( curReward )
		end
		return {
			tooltipType = UI.tooltipTypes.TEXT_LARGE,
			text = t,
			caption = UI.DailyRewardWnd:GetRewardDescription( curReward, true )
		}
	end


UI.DailyReward_Slot.layers = 
{
	MAIN_EFFECT								= 0,
	DAY_EFFECT								= 1,
	TEXT_EFFECT								= 2,
}


-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.DailyReward_Slot:SetData( idx, curIdx )

	self.idx = idx
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local dayEffect = UI:GetEffectFromLayer( self, self.layers.DAY_EFFECT )
	if idx < curIdx then
		mainEffect:StartAnimation( "passed" )
		dayEffect:StartAnimation( "idle" )
	elseif idx == curIdx then
		mainEffect:StartAnimation( "active" )
		dayEffect:StartAnimation( "idle_2" )
	else
		mainEffect:StartAnimation( "inactive" )
		dayEffect:StartAnimation( "idle" )
	end
	self:SetText( UI:GetStringByName( "dailyreward_desc_short_"..idx ), self.layers.TEXT_EFFECT )

	local texture = UI:GetTex( DailyRewardIco[ idx ] )
	mainEffect:SetSpriteTexture( "ico", texture )

end

-- --------------------------
-- const
-- --------------------------


-- --------------------------
-- vars
-- --------------------------


-- --------------------------
-- work functions
-- --------------------------


-- -----------------------------------------------------
-- UI.DailyReward_OkButton
-- -----------------------------------------------------

-- -------------------------------------------------------------------
-- UI.Sale_Btn
-- -------------------------------------------------------------------
local l_numBtnBaseLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.DailyReward_OkButton =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		props =
		{
			name	= "DailyReward_OkButton"
		},
    	layers =
		{
			numLayers = l_numBtnBaseLayers + 1,
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,
				effects =
				{{
					defName 			= "sale_btn",
					defaultAnimation	= "idle",
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
						{
							objName		= "value",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
			-- TEXT
			{
				id				= l_numBtnBaseLayers,
				layerType		= UI.LAYER_TEXT,
	   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
		},
	},
    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
    },
    textId = "dailyreward_grab_btn"
}
