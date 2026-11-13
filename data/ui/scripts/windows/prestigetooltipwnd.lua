-- ----------------------------------------------------------------------------
--
-- Workfile: prestigetooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.PrestigeTooltipWnd = {}
local ht = UI.PrestigeTooltipWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.PrestigeTooltipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PrestigeTooltipWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "prestigeTooltip",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           		
           			{
           				objName		= "title",
						layer		= "UI.PrestigeTooltipWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "prog_slot_1",
						wnd			= "UI.PrestigeTooltip_BoughtShipsPb",
						animParams	= UI.EffectAnimParams.POS,
           			},

           			{
           				objName		= "prog_slot_2",
						wnd			= "UI.PrestigeTooltip_MaxedShipsPb",
						animParams	= UI.EffectAnimParams.POS,
           			},

           			{
           				objName		= "prog_slot_3",
						wnd			= "UI.PrestigeTooltip_PremiumShipsPb",
						animParams	= UI.EffectAnimParams.POS,
           			},

           			{
           				objName		= "text_1",
						layer		= "UI.PrestigeTooltipWnd.layers.LEADERBOARD_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "text_1_vol_1",
						layer		= "UI.PrestigeTooltipWnd.layers.LEADERBOARD_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},
           		}
			}}		
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},

		-- LEADERBOARD_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- LEADERBOARD_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children = { "UI.PrestigeTooltip_BoughtShipsPb", "UI.PrestigeTooltip_MaxedShipsPb", "UI.PrestigeTooltip_PremiumShipsPb" }
}


-- ------------------------------
-- interdace functions
-- ------------------------------

-- предварительно должен быть добавлен чайлдом к родительскому окну 
function UI.PrestigeTooltipWnd:Setup( tooltipData )

	self:FullUpdate()

	if not ( self:IsOnScreen() and _G.TextPicker_IsActive() ) then
		UI:PlaceTooltipOnScreen( self, tooltipData )
	end

end


--
function UI.PrestigeTooltipWnd:OnRequestLeaderboardError( data, result )

	if self.leaderboardRequestId ~= nil and self.leaderboardRequestId == data.internalRequestId then

		self.leaderboardRequestId = nil
		self:ShowMsgOnLeaderboardError( result )

	end

end


--
function UI.PrestigeTooltipWnd:OnRequestLeaderboard( data )

	if self.leaderboardRequestId ~= nil and self.leaderboardRequestId == data.internalRequestId then

		self.leaderboardRequestId = nil
		self:UpdateLeaderboard( data )

	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.PrestigeTooltipWnd.layers =
{
    MAIN_EFFECT			= 0,
    DESC				= 1,
    LEADERBOARD_LABEL	= 2,
    LEADERBOARD_VAL		= 3,
}

UI.PrestigeTooltipWnd.effectInfo =
{
	main =
	{
		descSubstColorLocator			= "vol_1color_1",
		leaderboardValMaxColorLocator	= "text_1_vol_1_color",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PrestigeTooltipWnd.bougntShipsPb			= nil
UI.PrestigeTooltipWnd.maxedShipsPb			= nil
UI.PrestigeTooltipWnd.premiumShipsPb		= nil
UI.PrestigeTooltipWnd.descSubstColor		= UI.TEXT_SEL_COLOR
UI.PrestigeTooltipWnd.leaderboardValMaxColor= UI.TEXT_BASE_COLOR
UI.PrestigeTooltipWnd.leaderboardRequestId	= nil
UI.PrestigeTooltipWnd.hMsgLeaderboardError	= UI.INVALID_UI_HANDLE

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PrestigeTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.bougntShipsPb	= UI.PrestigeTooltip_BoughtShipsPb
	self.maxedShipsPb	= UI.PrestigeTooltip_MaxedShipsPb
	self.premiumShipsPb	= UI.PrestigeTooltip_PremiumShipsPb

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.descSubstColor			= mainEffect:GetObjColor( self.effectInfo.main.descSubstColorLocator )
		self.leaderboardValMaxColor	= mainEffect:GetObjColor( self.effectInfo.main.leaderboardValMaxColorLocator)
	end

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.PrestigeTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PrestigeTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end     


--
function UI.PrestigeTooltipWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.PrestigeTooltipWnd:Reset()

	self:SetText( "", self.layers.DESC )
	self:SetText( "", self.layers.LEADERBOARD_LABEL )
	self:SetText( "", self.layers.LEADERBOARD_VAL )	

	self.bougntShipsPb:Reset()
	self.maxedShipsPb:Reset()
	self.premiumShipsPb:Reset()

	self.leaderboardRequestId	= nil

end


--
function UI.PrestigeTooltipWnd:FullUpdate()

	self:Reset()

	self:UpdateDesc()
	self:UpdateBars()	
	self:RequestLeaderboard()

end


--
function UI.PrestigeTooltipWnd:UpdateDesc()

	local prestige = UI:GetPrestige()

	local baseColor	= self:GetColor( self.layers.DESC )
	local selColor	= self.descSubstColor

	local strPrestige = tostring( prestige )
	strPrestige = string.format( "%s%s%s", UI:Color2Str( selColor ), strPrestige, UI:Color2Str( baseColor ) )

	local str = UI:GetStringByName( "prestigeTooltip_desc" )
	str = string.gsub( str, "%$val%$", strPrestige )

	self:SetText( str, self.layers.DESC )	

end


--
function UI.PrestigeTooltipWnd:UpdateBars()	

	-- прогрессбары апдейтятся сами при показе

end


--
function UI.PrestigeTooltipWnd:RequestLeaderboard()

	if self.leaderboardRequestId == nil then
		self.leaderboardRequestId = UI.Leaderboards:SetNextRequest( self, "player_prestige", nil, nil, true, true, false, { UI:GetLocalPlayerUid() } )	
	end

end


--
function UI.PrestigeTooltipWnd:UpdateLeaderboard( data )

	local record = data and data.records and data.records[ 1 ]
	if record then

		local curVal = record.p or 0
		if curVal ~= -1 then
			curVal = curVal + 1
		end

		if curVal == -1 then

        	local MIN_PRESTIGE = _G.MasterServer.MIN_PRESTIGE_BONUS_FOR_LEADERBOARD * 100

    		local str = UI:GetStringByName( "prestigeTooltip_leaderboardsUnavailable" )
    		str = string.gsub( str, "%$min_prestige%$", tostring( MIN_PRESTIGE ) )

    		self:SetText( str, self.layers.LEADERBOARD_LABEL )
    		self:SetText( "", self.layers.LEADERBOARD_VAL )

		else

			local maxVal = data.maxRecordsCount or 0

        	local strLabel = UI:GetStringByName( "prestigeTooltip_leaderboards" )
        	self:SetText( strLabel, self.layers.LEADERBOARD_LABEL )

        	local strMaxValColor = UI:Color2Str( self.leaderboardValMaxColor )
        	local strCurVal = UI:Num2StrSeparatedBy3( curVal )
        	local strMaxVal = UI:Num2StrSeparatedBy3( maxVal )

        	local strVal = string.format( "%s%s/%s", strCurVal, strMaxValColor, strMaxVal )
        	self:SetText( strVal, self.layers.LEADERBOARD_VAL )
	
		end

	else
		sys.log( "UI.PrestigeTooltipWnd:UpdateLeaderboard()[ERROR]: no records" )
	end

end


--
function UI.PrestigeTooltipWnd:ShowMsgOnLeaderboardError( result )

	if self.hMsgLeaderboardError ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgLeaderboardError = UI:ShowErrorMsg( "profile_common_presige_get_error", result, "_G.MasterServer.LeaderboardGetResult" )

end    


--
function UI.PrestigeTooltipWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgLeaderboardError then
		self.hMsgLeaderboardError = UI.INVALID_UI_HANDLE
	end

end  


-- ---------------------------------------------------------------------------------------------------------
-- UI.PrestigeTooltip_BoughtShipsPb, UI.PrestigeTooltip_MaxedShipsPb, UI.PrestigeTooltip_PremiumShipsPb
-- ---------------------------------------------------------------------------------------------------------

--
UI.PrestigeTooltip_BoughtShipsPb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PrestigeParamBarWnd",

		props =
		{
			name	= "PrestigeTooltip_BoughtShipsPb"
		}
	},

	paramType = UI.PrestigeParamBarWnd.paramTypes.COMMON_SHIPS,
}


--
UI.PrestigeTooltip_MaxedShipsPb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PrestigeParamBarWnd",

		props =
		{
			name	= "PrestigeTooltip_MaxedShipsPb"
		}
	},

	paramType = UI.PrestigeParamBarWnd.paramTypes.MAXED_SHIPS,
}


--
UI.PrestigeTooltip_PremiumShipsPb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PrestigeParamBarWnd",

		props =
		{
			name	= "PrestigeTooltip_PremiumShipsPb"
		}
	},

	paramType = UI.PrestigeParamBarWnd.paramTypes.PREMIUM_SHIPS,
}