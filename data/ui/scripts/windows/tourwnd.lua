-- ----------------------------------------------------------------------------
--
-- Workfile: tourwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.TourWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.TourWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name		= "TourWnd",
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
				defName 			= "tour_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.TourWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},


					{
						objName		= "window7",
						layer		= "UI.TourWnd.layers.WORK_EFFECT",
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
				defName 			= "tour_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.TourWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.Tour_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.Tour_MinimizeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer_title",
						layer		= "UI.TourWnd.layers.ROUND",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "timer_vol",
						layer		= "UI.TourWnd.layers.TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",
						wnd			= "UI.Tour_CompetitorsListWnd_nonFinished",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "list",
						wnd			= "UI.Tour_CompetitorsListWnd_finished",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "aword_mess",
						layer		= "UI.TourWnd.layers.WINS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "item",
						wnd			= "UI.Tour_InfoIcoWnd",
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
			text			= UI:GetStringByName( "tour_caption" ),
		},  

		-- ROUND
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- TIMER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- WINS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "tour_wins",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text27",
						layer		= "UI.TourWnd.layers.WINS_NUM",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text28",
						layer		= "UI.TourWnd.layers.WINS_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text",
						layer		= "UI.TourWnd.layers.REWARD",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WINS_NUM
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},   

		-- WINS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},   

		-- REWARD
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},   
	},

	children = { "UI.Tour_CrossBtn", "UI.Tour_MinimizeBtn", "UI.Tour_CompetitorsListWnd_nonFinished", "UI.Tour_CompetitorsListWnd_finished", "UI.Tour_InfoIcoWnd" }
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.TourWnd:MasterServer_OnTournamentTeamsInfo( result, requestId, round )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate( true )

end


--
function UI.TourWnd:GetData()

	return self.data

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.TourWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
	CAPTION			= 3,
	ROUND			= 4,
	TIMER			= 5,
    WINS_EFFECT		= 6,
    WINS_NUM		= 7,
	WINS_LABEL		= 8,
    REWARD			= 9,
}

UI.TourWnd.effectInfo =
{
	work =
	{
		crossBtnLocator		= "btn_x",
		minimizeBtnLocator	= "btn_x",
	}
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.TourWnd.round			= -1
UI.TourWnd.bCurRound		= false
UI.TourWnd.timeLeft			= 0
UI.TourWnd.data				= nil
UI.TourWnd.rewardMetaText	= UI.MetaText.GetNewInstance()

-- ------------------------------------
-- work functions
-- ------------------------------------


--
function UI.TourWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.rewardMetaText:InitFromLayer( self, self.layers.REWARD ) 	

	self:Reset()

end


--
function UI.TourWnd:F_Shutdown()

	if self.rewardMetaText then
		self.rewardMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.TourWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.TourWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.TourWnd:UpdateMetaTextPos()

	self.rewardMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARD )

end


--
function UI.TourWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REWARD then
		self.rewardMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.TourWnd:Reset()

	self.data = nil

	self:SetRound( -1, false, true )
	self:SetTimer( 0, true )

	if UI.Tour_CompetitorsListWnd_nonFinished:IsChildOf( self ) then
		UI.Tour_CompetitorsListWnd_nonFinished:Reset()
		UI.Tour_CompetitorsListWnd_nonFinished:UnlinkFromParent()
	end

	if UI.Tour_CompetitorsListWnd_finished:IsChildOf( self ) then
		UI.Tour_CompetitorsListWnd_finished:Reset()
		UI.Tour_CompetitorsListWnd_finished:UnlinkFromParent()
	end

	self:RemoveControl( UI.Tour_CrossBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( UI.Tour_MinimizeBtn, self.layers.WORK_EFFECT )

	self:SetLayerVisible( false, self.layers.WINS_EFFECT )
	self:SetLayerVisible( false, self.layers.WINS_NUM )
	self:SetLayerVisible( false, self.layers.WINS_LABEL )
	self:SetLayerVisible( false, self.layers.REWARD )

	self.rewardMetaText:SetText( "", true )
	self:SetText( "", self.layers.WINS_NUM )

end


--
function UI.TourWnd:FullUpdate( bPeriodicUpdate )

	if bPeriodicUpdate == nil then
		bPeriodicUpdate = false
	end

	self:UpdateData()

	self:UpdateRoundAndTimer()
	self:UpdateCompetitors( bPeriodicUpdate )
	self:UpdateCloseBtn()
	self:UpdateWins()
	self:UpdateReward()

end


--
function UI.TourWnd:UpdateData()

	-- debug
--[[
	do
    	self.data = {}

		self.data.teamIdOffset = 0
		self.data.myTeamId = 23
		self.data.finished = true

		self.data.teams = {}
    	for idx = 1, 60 do
			self.data.teams[ idx ] = { teamId = idx, wins = math.random( 0, UI:GetTourNumRounds() ) }    		
    	end

	end
]]

	self.data = _G.MasterServer_GetTournamentTeamsInfo()

	if type( self.data ) ~= "table" then
		sys.log( "UI.TourWnd:UpdateData()[ERROR]: invalid type of return value from \"_G.MasterServer_GetTournamentTeamsInfo()\"; \"table\" expected, got \"%s\"", type( self.data ) )
		self.data = nil
	end

end


--
function UI.TourWnd:UpdateRoundAndTimer()	

	local round, bCurRound, timeLeft = UI:GetTourRoundTimeInfo()

	self:SetRound( round, bCurRound, false )
	self:SetTimer( timeLeft, false )

end


-- 
function UI.TourWnd:SetRound( round, bCurRound, bForceUpdate )

	if bForceUpdate == nil then
		bForceUpdate = true
	end

	if not bForceUpdate then
    	if round == self.round and bCurRound == self.bCurRound then
    		return
    	end
	end

	self.round		= round
	self.bCurRound	= bCurRound

	local str = ""

	if self.round ~= -1 then

		local strId = bCurRound and "tour_timer_curRound" or "tour_timer_nextRound"
		str = UI:GetStringByName( strId )

		local numRounds = UI:GetTourNumRounds()

		local strRound = string.format( "%d/%d", self.round, numRounds )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$round%$", strRound )

		if numSubst == 0 then
			sys.log( "UI.SetRound:UpdateRound()[ERROR]: cannot find placeholder \"$round$\" in string \"%s\"", strId )
			str = string.format( "%s %s", str, strRound )
		end

	else
		str = UI:GetStringByName( "tour_timer_finished" )
	end

	self:SetText( str, self.layers.ROUND )

end


--
function UI.TourWnd:SetTimer( timeLeft, bForceUpdate )

	if bForceUpdate == nil then
		bForceUpdate = true
	end

	if not bForceUpdate then
      	if timeLeft == self.timeLeft then
      		return
      	end
	end

	self.timeLeft = timeLeft

	local str = UI:Time2Str3( timeLeft )
	self:SetText( str, self.layers.TIMER )

end


--
function UI.TourWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	UI.FullScreenSelectionWnd.F_OnNewFrame( self, hSender, dt_sys, dt_game )

	self:UpdateRoundAndTimer( false )

end


--
function UI.TourWnd:UpdateCompetitors( bPeriodicUpdate )

	if self:IsTourFinished() then		

		UI.Tour_CompetitorsListWnd_nonFinished:UnlinkFromParent()

		self:AddChild( UI.Tour_CompetitorsListWnd_finished )
		UI.Tour_CompetitorsListWnd_finished:Update( bPeriodicUpdate )

	else

		UI.Tour_CompetitorsListWnd_finished:UnlinkFromParent()

		self:AddChild( UI.Tour_CompetitorsListWnd_nonFinished )
		UI.Tour_CompetitorsListWnd_nonFinished:Update( bPeriodicUpdate )

	end

end


--
function UI.TourWnd:UpdateCloseBtn()

	self:RemoveControl( UI.Tour_CrossBtn, self.layers.WORK_EFFECT )
	self:RemoveControl( UI.Tour_MinimizeBtn, self.layers.WORK_EFFECT )

	if self:IsTourTeamExist() and not self:IsTourFinished() then
		self:AddControl( UI.Tour_MinimizeBtn, self.layers.WORK_EFFECT, self.effectInfo.work.minimizeBtnLocator )
	else
		self:AddControl( UI.Tour_CrossBtn, self.layers.WORK_EFFECT, self.effectInfo.work.crossBtnLocator )
	end

end


--
function UI.TourWnd:UpdateWins()

	local numWins = self:GetNumWins()

	if numWins == 0 then

    	self:SetLayerVisible( false, self.layers.WINS_EFFECT )
    	self:SetLayerVisible( false, self.layers.WINS_NUM )
    	self:SetLayerVisible( false, self.layers.WINS_LABEL )

		self:SetText( "", self.layers.WINS_NUM )

		return

	end


	self:SetLayerVisible( true, self.layers.WINS_EFFECT )
	self:SetLayerVisible( true, self.layers.WINS_NUM )
	self:SetLayerVisible( true, self.layers.WINS_LABEL )

	local strWins		= UI:Num2StrSeparatedBy3( numWins )
	local strWinsLabel	= UI:SubstituteValLocalizedByStringId( "tour_numWins", numWins, "wins", "" )

	self:SetText( strWins, self.layers.WINS_NUM )
	self:SetText( strWinsLabel, self.layers.WINS_LABEL )

end


--
function UI.TourWnd:UpdateReward()

	local numWins = self:GetNumWins()

	if numWins == 0 then

    	self:SetLayerVisible( false, self.layers.REWARD )
		self.rewardMetaText:SetText( "", true )

		return

	end


	self:SetLayerVisible( true, self.layers.REWARD )

	local strReward		= ""

	local gold			= _G.MasterServer_GetTournamentGoldReward()
	local eventCredits	= _G.MasterServer_GetTournamentEventCreditsReward()
	local iridium		= _G.MasterServer_GetTournamentTokenCreditsReward()

	local rewardVal		= 0
	local rewardType	= -1
	local numRewards	= 0	

	if gold ~= 0 then
		numRewards = numRewards + 1
	end
	if eventCredits ~= 0 then
		numRewards = numRewards + 1
	end
	if iridium ~= 0 then
		numRewards = numRewards + 1
	end

	if numRewards == 0 then
		sys.log( "UI.TourWnd:UpdateReward()[ERROR]: no reward" )
	elseif numRewards > 1 then
		sys.log( "UI.TourWnd:UpdateReward()[ERROR]: %d rewards, only one expected", numRewards )
	end

	if gold ~= 0 then
		rewardVal	= gold
		rewardType	= _G.GameStore.CreditsType.CT_GOLD

	elseif eventCredits ~= 0 then
		rewardVal	= eventCredits
		rewardType	= _G.GameStore.CreditsType.CT_EVENT

	elseif iridium ~= 0 then
		rewardVal	= iridium
		rewardType	= _G.GameStore.CreditsType.CT_TOKENS
	end

	local strRewardVal = "error"

	if rewardVal ~= 0 then

    	local priceInfo =
    	{
    		priceType 	= rewardType,
    		val			= rewardVal,
    		bIsBuyPrice	= false,
    	}

    	strRewardVal = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.REWARD ), nil, nil, true, nil )

	end

	if self:IsTourFinished() then

    	strReward = UI:GetStringByName( "tour_rewardBonus_finished" )

    	local numSubst = 0
    	strReward, numSubst = string.gsub( strReward, "%$gold%$", strRewardVal )

    	if numSubst == 0 then
    		sys.log( "UI.TourWnd:UpdateReward()[ERROR]: cannot find placeholder \"$gold$\" in string \"tour_rewardBonus_finished\"" )
    		strReward = string.format( "[INVALID STRING] Reward for tournament: %s", strRewardVal )
    	end

	else

    	-- бонус к награде за следующий бой

    	local rewardBonus = _G.MasterServer_GetTournamentRewardMult()
    	local strRewardBonus = string.format( "%d%%", rewardBonus )

    	-- все вместе

    	strReward = UI:GetStringByName( "tour_rewardBonus" )

    	-- не заменять на простую подстановку строки! Иначе не нарисуется "%"
    	local tSubst =
    	{
    		val		= strRewardBonus,
    		gold	= strRewardVal,
    	}

    	local numSubst = 0
    	strReward, numSubst = string.gsub( strReward, "%$(.-)%$", tSubst )

    	if numSubst ~= 2 then
    		sys.log( "UI.TourWnd:UpdateReward()[ERROR]: invalid placeholders in string \"tour_rewardBonus\"; \"$val$\" and \"$gold$\" expected" )
    		strReward = string.format( "[INVALID STRING] Reward %s for round + %s after tournament", strRewardBonus, strRewardVal )
    	end

	end

	self.rewardMetaText:SetText( strReward, true )

end


--
function UI.TourWnd:GetNumWins()

	if type( self.data.myTeamId ) ~= "number" then
		sys.log( "UI.TourWnd:GetNumWins()[ERROR]: invalid type of field \"myTeamId\", \"number\" expected, got \"%s\"", self.data.myTeamId )
		return 0
	end

	if self.data.myTeamId == 0 then
		return 0
	end

	if type( self.data.teams ) ~= "table" then
		sys.log( "UI.TourWnd:GetNumWins()[ERROR]: invalid type of field \"teams\", \"table\" expected, got \"%s\"", self.data.teams )
		return 0
	end

	local numWins = 0

	for teamIdx, teamData in pairs( self.data.teams ) do

		if type( teamData ) == "table" then

			if type( teamData.teamId ) == "number" then

				if teamData.teamId == self.data.myTeamId then

    				if type( teamData.wins ) == "number" then
						numWins = teamData.wins
    				else
    					sys.log( "UI.TourWnd:GetNumWins()[ERROR]: invalid type of field \"teams[%s].wins\"; \"number\" expected, got \"%s\"", tostring( teamIdx ), type( teamData.wins ) )
    				end

					break

				end

			else
				sys.log( "UI.TourWnd:GetNumWins()[ERROR]: invalid type of field \"teams[%s].teamId\"; \"number\" expected, got \"%s\"", tostring( teamIdx ), type( teamData.teamId ) )
			end
		end

	end

	return numWins

end


--
function UI.TourWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	self.timeSinceMouseWheel = 0

	if UI.Tour_CompetitorsListWnd_nonFinished:IsChildOf( self ) then
		UI.Tour_CompetitorsListWnd_nonFinished:Scroll( ticks < 0, math.abs( ticks ) )

	elseif UI.Tour_CompetitorsListWnd_finished:IsChildOf( self ) then
		UI.Tour_CompetitorsListWnd_finished:Scroll( ticks < 0, math.abs( ticks ) )		
	end

	return true

end


--
function UI.TourWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == UI.Tour_CrossBtn or wnd == UI.Tour_MinimizeBtn then
		self:Close( true )
	end

	return true

end


--
function UI.TourWnd:OnEscape( key, controllerIdx )

	self:Close( true )
	return true

end


--
function UI.TourWnd:Close( bSound )

	UI.HangarWnd:HideTourWnd( bSound )

end


--
function UI.TourWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.TourWnd:RemoveControl( wnd, effectLayer )

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
function UI.TourWnd:IsTourTeamExist()

	if self.data and type( self.data.myTeamId ) == "number" and self.data.myTeamId ~= 0 then
		return true
	end

	return false

end 


--
function UI.TourWnd:IsTourFinished()

	if self.data and type( self.data.finished ) == "boolean" then
		return self.data.finished
	end

	return true

end


-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsListWnd
-- --------------------------------------------------------------------

UI.Tour_CompetitorsListWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Tour_CompetitorsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "Tour_CompetitorsListWnd",
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

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Tour_CompetitorsListWnd:Update( bPersistScrollPos )

	self:UpdateData()
	self:UpdateList( bPersistScrollPos )

end


--
function UI.Tour_CompetitorsListWnd:Reset()

	self.data			= nil
	self.nameIdOffset	= 0

	self:Clear()

end


--
function UI.Tour_CompetitorsListWnd:GetNameIdOffset()

	return self.nameIdOffset

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Tour_CompetitorsListWnd.layers =
{
    MAIN_EFFECT	= 0,
}

UI.Tour_CompetitorsListWnd.MAX_SLOTS	= 12
UI.Tour_CompetitorsListWnd.listStyle	= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Tour_CompetitorsListWnd.data			= nil
UI.Tour_CompetitorsListWnd.nameIdOffset	= 0

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Tour_CompetitorsListWnd:UpdateData()

	self.data			= nil
	self.nameIdOffset	= 0	

	self.data = UI.TourWnd:GetData()

	if not self.data then
		return
	end

	if type( self.data.teamIdOffset ) == "number" then
		self.nameIdOffset = self.data.teamIdOffset
	else
		sys.log( "UI.Tour_CompetitorsListWnd:UpdateList()[ERROR]: invalid type of field \"teamIdOffset\", \"number\" expected, got \"%s\"", type( self.data.teamIdOffset ) )
	end

end


-- для перегрузки в производных списках
function UI.Tour_CompetitorsListWnd:UpdateList( bPersistScrollPos )
end


-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsListWnd_nonFinished
-- --------------------------------------------------------------------

UI.Tour_CompetitorsListWnd_nonFinished = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Tour_CompetitorsListWnd_nonFinished.def =
{
	className	= "Wnd",
	prototype	= "Tour_CompetitorsListWnd",

	props =
	{
		name		= "Tour_CompetitorsListWnd_nonFinished",
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
				defName 			= "tour_competitors_list",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text21",
						layer		= "UI.Tour_CompetitorsListWnd_nonFinished.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text",
						layer		= "UI.Tour_CompetitorsListWnd_nonFinished.layers.WINS_HEADER_LEFT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text20",
						layer		= "UI.Tour_CompetitorsListWnd_nonFinished.layers.WINS_HEADER_RIGHT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "tour_competitors_caption" )
		},

		-- WINS_HEADER_LEFT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tour_competitors_wins" )
		},

		-- WINS_HEADER_RIGHT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tour_competitors_wins" )
		},
	}
}

-- ------------------------------------
-- const
-- ------------------------------------

UI.Tour_CompetitorsListWnd_nonFinished.layers =
{
    MAIN_EFFECT			= 0,
    CAPTION				= 1,
    WINS_HEADER_LEFT	= 2,
    WINS_HEADER_RIGHT	= 3,
}

UI.Tour_CompetitorsListWnd_nonFinished.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_5_",
		scrollObjName		= "scrol",
		animIdle			= "idle",
	}
}

UI.Tour_CompetitorsListWnd_nonFinished.btnPrototypeName	= "Tour_CompetitorsRowWnd"

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Tour_CompetitorsListWnd_nonFinished:UpdateList( bPersistScrollPos )

	local oldScrollPos = self:GetScrollPos()

	self:Clear()

	if not self.data then
		return
	end

	if type( self.data.teams ) ~= "table" then
		sys.log( "UI.Tour_CompetitorsListWnd_nonFinished:UpdateList()[ERROR]: invalid type of field \"teams\", \"table\" expected, got \"%s\"", self.data.teams )
		return
	end

	local numTeams = #self.data.teams

	if numTeams % 2 ~= 0 then
		sys.log( "UI.Tour_CompetitorsListWnd_nonFinished:UpdateList()[ERROR]: not even number of competitors" )
		return
	end


	local myTeamId = -1

	if type( self.data.myTeamId ) == "number" then

		myTeamId = self.data.myTeamId

		if myTeamId == 0 then
			myTeamId = -1
		end

	else
		sys.log( "UI.Tour_CompetitorsListWnd_nonFinished:UpdateList()[ERROR]: invalid type of field \"myTeamId\", \"number\" expected, got \"%s\"", self.data.myTeamId )
	end


	local myTeamRecordIdx = -1

	for rowIdx = 1, numTeams / 2 do

		local rowData = { slots = {} }

		for slotIdx = 1, 2 do

			local slotData =
			{
            	teamId		= -1,
            	wins		= 0,
            	bMyTeam		= false,
			}

			local teamIdx = ( rowIdx - 1 ) * 2 + slotIdx
			local teamData = self.data.teams[ teamIdx ]

			if type( teamData ) == "table" then

				if type( teamData.teamId ) == "number" then

					slotData.teamId = teamData.teamId

					if slotData.teamId == 0 then
						slotData.teamId = -1
						sys.log( "UI.Tour_CompetitorsListWnd_nonFinished:UpdateList()[ERROR]: invalid teamId (0) in \"teams[%d]\"", teamIdx )
					end

				else
					sys.log( "UI.Tour_CompetitorsListWnd_nonFinished:UpdateList()[ERROR]: invalid type of field \"teams[%d].teamId\"; \"number\" expected, got \"%s\"", teamIdx, type( teamData.teamId ) )
				end

				if type( teamData.wins ) == "number" then
					slotData.wins = teamData.wins
				else
					sys.log( "UI.Tour_CompetitorsListWnd_nonFinished:UpdateList()[ERROR]: invalid type of field \"teams[%d].wins\"; \"number\" expected, got \"%s\"", teamIdx, type( teamData.wins ) )
				end

				slotData.bMyTeam = myTeamId ~= -1 and myTeamId == teamData.teamId

				if slotData.bMyTeam then
					myTeamRecordIdx = rowIdx
				end

			else
				sys.log( "UI.Tour_CompetitorsListWnd_nonFinished:UpdateList()[ERROR]: invalid type of field \"teams[%d]\"; \"table\" expected, got \"%s\"", teamIdx, type( teamData ) )
			end

			rowData.slots[ slotIdx ] = slotData

		end

		self:AddRecord( rowData )

	end


	local scrollPos = -1

	if bPersistScrollPos then
		scrollPos = oldScrollPos
	end

	if scrollPos == -1 then
		if myTeamRecordIdx ~= -1 then
	 		scrollPos = myTeamRecordIdx - math.floor( self.MAX_SLOTS / 2 ) 
		end
	end

	if scrollPos ~= -1 then
		self:SetScrollPos( scrollPos )
	end

end


-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsListWnd_finished
-- --------------------------------------------------------------------

UI.Tour_CompetitorsListWnd_finished = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Tour_CompetitorsListWnd_finished.def =
{
	className	= "Wnd",
	prototype	= "Tour_CompetitorsListWnd",

	props =
	{
		name		= "Tour_CompetitorsListWnd_finished",
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
				defName 			= "tour_competitors_list_finished",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Tour_CompetitorsListWnd_finished.layers.WINS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text20",
						layer		= "UI.Tour_CompetitorsListWnd_finished.layers.TEAMS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- WINS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tour_competitors_wins" )
		},

		-- TEAMS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "tour_competitors_teams" )
		},
	}
}

-- ------------------------------------
-- const
-- ------------------------------------

UI.Tour_CompetitorsListWnd_finished.layers =
{
    MAIN_EFFECT		= 0,
    WINS_HEADER		= 1,
    TEAMS_HEADER	= 2,
}

UI.Tour_CompetitorsListWnd_finished.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_5_",
		scrollObjName		= "scrol",
		animIdle			= "idle",
	}
}

UI.Tour_CompetitorsListWnd_finished.btnPrototypeName	= "Tour_CompetitorsSlotWnd_finished"

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Tour_CompetitorsListWnd_finished:UpdateList( bPersistScrollPos )

	local oldScrollPos = self:GetScrollPos()

	self:Clear()

	if not self.data then
		return
	end

	if type( self.data.teams ) ~= "table" then
		sys.log( "UI.Tour_CompetitorsListWnd_finished:UpdateList()[ERROR]: invalid type of field \"teams\", \"table\" expected, got \"%s\"", self.data.teams )
		return
	end

	local myTeamId = -1

	if type( self.data.myTeamId ) == "number" then

		myTeamId = self.data.myTeamId

		if myTeamId == 0 then
			myTeamId = -1
		end

	else
		sys.log( "UI.Tour_CompetitorsListWnd_finished:UpdateList()[ERROR]: invalid type of field \"myTeamId\", \"number\" expected, got \"%s\"", self.data.myTeamId )
	end

	local myTeamRecordIdx = -1

	for teamIdx, teamData in ipairs( self.data.teams ) do

		local slotData =
		{
        	teamId		= -1,
        	wins		= 0,
        	bMyTeam		= false,
		}

		if type( teamData ) == "table" then

			if type( teamData.teamId ) == "number" then

				slotData.teamId = teamData.teamId

				if slotData.teamId == 0 then
					slotData.teamId = -1
					sys.log( "UI.Tour_CompetitorsListWnd_finished:UpdateList()[ERROR]: invalid teamId (0) in \"teams[%d]\"", teamIdx )
				end

			else
				sys.log( "UI.Tour_CompetitorsListWnd_finished:UpdateList()[ERROR]: invalid type of field \"teams[%d].teamId\"; \"number\" expected, got \"%s\"", teamIdx, type( teamData.teamId ) )
			end

			if type( teamData.wins ) == "number" then
				slotData.wins = teamData.wins
			else
				sys.log( "UI.Tour_CompetitorsListWnd_finished:UpdateList()[ERROR]: invalid type of field \"teams[%d].wins\"; \"number\" expected, got \"%s\"", teamIdx, type( teamData.wins ) )
			end

			slotData.bMyTeam = myTeamId ~= -1 and myTeamId == teamData.teamId

			if slotData.bMyTeam then
				myTeamRecordIdx = teamIdx
			end

		else
			sys.log( "UI.Tour_CompetitorsListWnd_finished:UpdateList()[ERROR]: invalid type of field \"teams[%d]\"; \"table\" expected, got \"%s\"", teamIdx, type( teamData ) )
		end

		self:AddRecord( slotData )

	end


	local scrollPos = -1

	if bPersistScrollPos then
		scrollPos = oldScrollPos
	end

	if scrollPos == -1 then
		if myTeamRecordIdx ~= -1 then
	 		scrollPos = myTeamRecordIdx - math.floor( self.MAX_SLOTS / 2 ) 
		end
	end

	if scrollPos ~= -1 then
		self:SetScrollPos( scrollPos )
	end

end


-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsRowWnd
-- --------------------------------------------------------------------

UI.Tour_CompetitorsRowWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Tour_CompetitorsRowWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Tour_CompetitorsRowWnd",
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
				defName 			= "tour_competitors_row",
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

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Tour_CompetitorsRowWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Reset()
		end
	end

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Tour_CompetitorsRowWnd.effectInfo =
{
	main =
	{
		slotLeftLocator		= "slot_l",
		slotRightLocator	= "slot_r",
	}
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Tour_CompetitorsRowWnd.slots = {}

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Tour_CompetitorsRowWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	self.slots = {}

	if not self:IsPrototype() then
		self:CreateControls()
	end

end


--
function UI.Tour_CompetitorsRowWnd:CreateControls()

	self.slots[ 1 ] = UI:CreateChildWnd( self, UI.Tour_CompetitorsSlotWnd_left, "" )
	self.slots[ 2 ] = UI:CreateChildWnd( self, UI.Tour_CompetitorsSlotWnd_right, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.slots[ 1 ], mainEffect, self.effectInfo.main.slotLeftLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.slots[ 2 ], mainEffect, self.effectInfo.main.slotRightLocator, UI.EffectAnimParams.POS )

end


--
function UI.Tour_CompetitorsRowWnd:UpdateForData( data, bAnimated )

	for slotIdx, slotWnd in pairs( self.slots ) do

		slotWnd:SetSlot( slotIdx, self:GetList() )
		slotWnd:UpdateForData( data.slots[ slotIdx ] )

	end

end


-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsSlotWnd
-- --------------------------------------------------------------------

UI.Tour_CompetitorsSlotWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Tour_CompetitorsSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Tour_CompetitorsSlotWnd",
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
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WINS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MY_TEAM_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Tour_CompetitorsSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self.data = data

	self:UpdateName()
	self:UpdateWins()
	self:UpdateMainAnimation()
	self:UpdateMyTeamEffect()
	self:UpdateBg()

end


--
function UI.Tour_CompetitorsSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self.data = nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if bgEffect then
		bgEffect:StartAnimation( self.effectInfo.bg.animIdle )
	end

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.WINS )
	self:SetLayerVisible( false, self.layers.MY_TEAM_EFFECT ) 	

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Tour_CompetitorsSlotWnd.layers =
{
	MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
	NAME			= 2,
	WINS			= 3,
	MY_TEAM_EFFECT	= 4,	
}

UI.Tour_CompetitorsSlotWnd.effectInfo =
{
	main =
	{
		animIdle	= "idle",
		animMyTeam	= "squad",
	},

	bg =
	{
		animIdle	= "idle",

		animByPlace =
		{
			[ 1 ]	= "idle_gold",
			[ 2 ]	= "silver",
			[ 3 ]	= "bronze",
		}
	}
}

UI.Tour_CompetitorsSlotWnd.MAX_UNIQUE_NAMES = 100

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Tour_CompetitorsSlotWnd.data   = nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Tour_CompetitorsSlotWnd:UpdateName()

	local str = "unknown team"
	
	if self.data.teamId ~= -1 then

		local nameId = ( self.data.teamId - 1 ) % self.MAX_UNIQUE_NAMES + 1 + self:GetList():GetNameIdOffset()

		local strId = string.format( "single_tournament_name_%d", nameId )
		str = UI:GetStringByName( strId )

		if self.data.teamId > self.MAX_UNIQUE_NAMES then

			local duplicateIdx = math.floor( ( self.data.teamId - 1 ) / self.MAX_UNIQUE_NAMES )
			str = string.format( "%s %d", str, duplicateIdx )

		end

	end

	self:SetText( str, self.layers.NAME )

end


--
function UI.Tour_CompetitorsSlotWnd:UpdateWins()

	local str = UI:Num2StrSeparatedBy3( self.data.wins )
	self:SetText( str, self.layers.WINS )	

end


--
function UI.Tour_CompetitorsSlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = self.data.bMyTeam and self.effectInfo.main.animMyTeam or self.effectInfo.main.animIdle
	mainEffect:StartAnimation( anim )	

end


--
function UI.Tour_CompetitorsSlotWnd:UpdateMyTeamEffect()

	self:SetLayerVisible( self.data.bMyTeam, self.layers.MY_TEAM_EFFECT )

end


--
function UI.Tour_CompetitorsSlotWnd:UpdateBg()

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if not bgEffect then
		return
	end

	local numRounds = UI:GetTourNumRounds()
	local place = -1

	if numRounds > 0 then

    	if self.data.wins <= numRounds then
    		place = ( numRounds - self.data.wins ) + 1
    	else
    		sys.log( "UI.Tour_CompetitorsSlotWnd:UpdateBg()[ERROR]: invalid wins count" )
    	end

	end

	local anim = ""

	if place ~= -1 and place <= 3 then
		anim = self.effectInfo.bg.animByPlace[ place ]
	else
		anim = self.effectInfo.bg.animIdle
	end	

	bgEffect:StartAnimation( anim )

end


-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsSlotWnd_left
-- --------------------------------------------------------------------

UI.Tour_CompetitorsSlotWnd_left =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Tour_CompetitorsSlotWnd",

		props =
		{
			name		= "Tour_CompetitorsSlotWnd_left",
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
    				defName 			= "tour_competitors_slot_mainLeft",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "bg",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.BG_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "name",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.WINS",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "sq_mark_l",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.MY_TEAM_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
    				}
				}}
    		},

    		-- BG_EFFECT
    		{
				id			= UI.Tour_CompetitorsSlotWnd.layers.BG_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "tour_competitors_slot_bg",
    			}}
    		},

    		-- MY_TEAM_EFFECT
    		{
				id			= UI.Tour_CompetitorsSlotWnd.layers.MY_TEAM_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
	
				effects =
				{{
    				defName 			= "tour_competitors_slot_myTeamLeaft",
    				defaultAnimation	= "idle",
				}}
    		},
		}		
	}
}


-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsSlotWnd_right
-- --------------------------------------------------------------------

UI.Tour_CompetitorsSlotWnd_right =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Tour_CompetitorsSlotWnd",

		props =
		{
			name		= "Tour_CompetitorsSlotWnd_right",
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
    				defName 			= "tour_competitors_slot_mainRigth",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "bg",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.BG_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "text25",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "text24",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.WINS",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "sq_mark_r",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.MY_TEAM_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
    				}
				}}
    		},

    		-- BG_EFFECT
    		{
				id			= UI.Tour_CompetitorsSlotWnd.layers.BG_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "tour_competitors_slot_bg",
    			}}
    		},

    		-- MY_TEAM_EFFECT
    		{
				id			= UI.Tour_CompetitorsSlotWnd.layers.MY_TEAM_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
	
				effects =
				{{
    				defName 			= "tour_competitors_slot_myTeamRigth",
    				defaultAnimation	= "idle",
				}}
    		},
		}		
	}
}

-- --------------------------------------------------------------------
-- UI.Tour_CompetitorsSlotWnd_finished
-- --------------------------------------------------------------------

UI.Tour_CompetitorsSlotWnd_finished =
{
	def =
	{
		className	= "Wnd",
		prototype	= "Tour_CompetitorsSlotWnd",

		props =
		{
			name		= "Tour_CompetitorsSlotWnd_finished",
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
    				defName 			= "tour_competitors_slot_finished",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "bg",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.BG_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "name",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.WINS",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "sq_mark_l",
    						layer		= "UI.Tour_CompetitorsSlotWnd.layers.MY_TEAM_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
    				}
				}}
    		},

    		-- BG_EFFECT
    		{
				id			= UI.Tour_CompetitorsSlotWnd.layers.BG_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "tour_competitors_slot_bg_finished",
    			}}
    		},

    		-- MY_TEAM_EFFECT
    		{
				id			= UI.Tour_CompetitorsSlotWnd.layers.MY_TEAM_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
	
				effects =
				{{
    				defName 			= "tour_competitors_slot_myTeamLeaft",
    				defaultAnimation	= "idle",
				}}
    		},
		}		
	}
}


-- --------------------------------------------------------------------
-- UI.Tour_CrossBtn
-- --------------------------------------------------------------------

UI.Tour_CrossBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name	= "Tour_CrossBtn"
    	}
	}
}

-- -----------------------------------------------------
-- UI.Tour_MinimizeBtn
-- -----------------------------------------------------

UI.Tour_MinimizeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "Tour_MinimizeBtn",
    		selectSound	= UI.sounds.btnMouseOver,
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
        			defName				= "tour_minimizeBtn",
        			defaultAnimation    = "idle_down",

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
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle_down",
    		animationSelect			= "over_down",
    		animationPressed		= "press_down",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
	}
}

-- -----------------------------------------------------
-- UI.Tour_InfoIcoWnd
-- -----------------------------------------------------

UI.Tour_InfoIcoWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "Tour_InfoIcoWnd",
    		selectSound	= UI.sounds.btnMouseOver,
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
        			defName				= "tour_infoIco",
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
	},

    effectInfo =
    {
    	main =
    	{
    		animationIdle 			= "idle",
    		animationSelect			= "idle",
    		animationPressed		= "idle",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
	},

	tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "tour_infoTooltip_caption" ),
		text		= UI:GetStringByName( "tour_infoTooltip_text" ),
	},

	GetTooltipData = function( self )

		return self.tooltipData

	end,
}