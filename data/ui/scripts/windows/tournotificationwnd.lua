-- ----------------------------------------------------------------------------
--
-- Workfile: tournotificationwnd.lua
-- Copyright й 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.TourNotificationWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.TourNotificationWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "TourNotificationWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		activationOrder	= 0,
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
				defName 			= "tourNotification",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "etext_name",
						layer		= "UI.TourNotificationWnd.layers.TEXT_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "etext_info",
						layer		= "UI.TourNotificationWnd.layers.TEXT_2",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT_1
		{
			layerType		= UI.LAYER_ETEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			spriteName			= "etext_name_sprite",
			spriteEffectLayer	= "UI.TourNotificationWnd.layers.MAIN_EFFECT",
		},  

		-- TEXT_2
		{
			layerType		= UI.LAYER_ETEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			spriteName			= "etext_info_sprite",
			spriteEffectLayer	= "UI.TourNotificationWnd.layers.MAIN_EFFECT",
		},  
	},
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.TourNotificationWnd:MasterServer_OnTournamentRoundEnded( result, requestId, round )

	if not UI.HangarWnd:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:ShowNotification( self.notificationTypes.ROUND_END, { round = round } )

end


--
function UI.TourNotificationWnd:MasterServer_OnTournamentRoundStarted( result, requestId, round )

	if not UI.HangarWnd:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:ShowNotification( self.notificationTypes.ROUND_START, { round = round } )

end


--
function UI.TourNotificationWnd:MasterServer_OnTournamentTeamAssigned()

	if not UI.HangarWnd:IsOnScreen() then
		return
	end

	self:ShowNotification( self.notificationTypes.TOUR_ENTER )

end


--
function UI.TourNotificationWnd:MasterServer_OnTournamentFinished()

	if not UI.HangarWnd:IsOnScreen() then
		return
	end

	self:ShowNotification( self.notificationTypes.TOUR_END )

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.TourNotificationWnd.IS_FULL_SCREEN = true

UI.TourNotificationWnd.layers =
{
    MAIN_EFFECT	= 0,
    TEXT_1		= 1,
    TEXT_2		= 2,
}

UI.TourNotificationWnd.notificationTypes =
{
	TOUR_ENTER	= 1,
	TOUR_END	= 2,
	ROUND_START	= 3,
	ROUND_END	= 4,
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.TourNotificationWnd.notificationType	= -1
UI.TourNotificationWnd.data				= {}

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.TourNotificationWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.TourNotificationWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.TourNotificationWnd:ShowNotification( notificationType, data )

	self:Reset()

	self.notificationType	= notificationType
	self.data				= data

	self:FullUpdate()

	if not self:IsOnScreen() then
		self:Show()
	else
		self:PlayAnimation()
	end

end


--
function UI.TourNotificationWnd:Reset()

	self.notificationType	= -1
	self.data				= {}

	self:SetText( "", self.layers.TEXT_1 )
	self:SetText( "", self.layers.TEXT_2 )

end


--
function UI.TourNotificationWnd:FullUpdate()

	local text1	= ""
	local text2	= ""


	if self.notificationType == self.notificationTypes.TOUR_ENTER then

		-- заголовок

		text1 = UI:GetStringByName( "tour_tourEnter" )

		-- таймер

		text2 = UI:GetStringByName( "tour_timeBeforeFirstRound" )		

		local round, bCurRound, timeLeft = UI:GetTourRoundTimeInfo()

		if round ~= 1 or bCurRound then
			sys.log( "UI.TourNotificationWnd:FullUpdate()[ERROR]: invalid first round" )
			timeLeft = 0
		end

		local strTimeLeft = UI:Time2Str421( timeLeft, "accusative" )

		local numSubst = 0
		text2, numSubst = string.gsub( text2, "%$time%$", strTimeLeft )

		if numSubst == 0 then
			sys.log( "UI.TourNotificationWnd:FullUpdate()[ERROR]: cannot find placeholder \"$time$\" in string \"tour_timeBeforeFirstRound\"" )
			text2 = string.format( "%s %s", text2, strTimeLeft )
		end		


	elseif self.notificationType == self.notificationTypes.TOUR_END then

		text1 = UI:GetStringByName( "tour_tourEnd" )


	elseif self.notificationType == self.notificationTypes.ROUND_START then

		text1 = UI:GetStringByName( "tour_roundStart" )
		local strRound = tostring( self.data.round )

		local numSubst = 0
		text1, numSubst = string.gsub( text1, "%$round%$", strRound )

		if numSubst == 0 then
			sys.log( "UI.TourNotificationWnd:FullUpdate()[ERROR]: cannot find placeholder \"$round$\" in string \"tour_roundStart\"" )
			text1 = string.format( "%s %s", text1, strRound )
		end		

		text2 = UI:GetStringByName( "tour_roundStartWait" )


	elseif self.notificationType == self.notificationTypes.ROUND_END then

		-- заголовок

		text1 = UI:GetStringByName( "tour_roundEnd" )
		local strRound = tostring( self.data.round )

		local numSubstRound = 0
		text1, numSubstRound = string.gsub( text1, "%$round%$", strRound )

		if numSubstRound == 0 then
			sys.log( "UI.TourNotificationWnd:FullUpdate()[ERROR]: cannot find placeholder \"$round$\" in string \"tour_roundEnd\"" )
			text1 = string.format( "%s %s", text1, strRound )
		end		

		-- таймер

		local nextRound, bCurRound, timeLeft = UI:GetTourRoundTimeInfo()

		if bCurRound then
			sys.log( "UI.TourNotificationWnd:FullUpdate()[ERROR]: invalid round end" )
			timeLeft = 0
		end

		text2 = UI:GetStringByName( "tour_timeBeforeNextRound" )		
		local strTimeLeft = UI:Time2Str421( timeLeft, "accusative" )

		local numSubstTime = 0
		text2, numSubstTime = string.gsub( text2, "%$time%$", strTimeLeft )

		if numSubstTime == 0 then
			sys.log( "UI.TourNotificationWnd:FullUpdate()[ERROR]: cannot find placeholder \"$time$\" in string \"tour_timeBeforeNextRound\"" )
			text2 = string.format( "%s %s", text2, strTimeLeft )
		end		

	else
		sys.log( "UI.TourNotificationWnd:FullUpdate()[ERROR]: unhandled notification type %s", tostring( self.notificationType ) )
	end

	self:SetText( text1, self.layers.TEXT_1 )
	self:SetText( text2, self.layers.TEXT_2 )

end


--
function UI.TourNotificationWnd:PlayAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:RestartAnimation()
	end

end


--
function UI.TourNotificationWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:PlayAnimation()

end


--
function UI.TourNotificationWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end


--
function UI.TourNotificationWnd:F_OnEffectAnimationEnded( effect, animName )

	self:Hide()

end