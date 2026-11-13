-- ----------------------------------------------------
-- UI.OffersWnd
-- ----------------------------------------------------

UI.OffersWnd = {}

-- ------------------------
-- window definition
-- ------------------------

UI.OffersWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "OffersWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "offers",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.OffersWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
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
			text			= UI:GetStringByName( "offers_caption" )
		},
	}
}

-- ------------------------
-- interface functions
-- ------------------------

--
function UI.OffersWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:FullUpdate()

end


--
function UI.OffersWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:FullUpdate()

end


--
function UI.OffersWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:FullUpdate()

end


--
function UI.OffersWnd:F_OnEventGoldRewardStateChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end
	
	self:FullUpdate()

end


-- ------------------------
-- const
-- ------------------------

UI.OffersWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.OffersWnd.btnPrototypeName	= "Offers_SlotWnd"
UI.OffersWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.OffersWnd.MAX_SLOTS			= 5

UI.OffersWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "offer_slot_",
		animIdle			= "idle",
	}
}

UI.OffersWnd.discountTypes =
{	
	BUNDLE	= 1,
	GOLD	= 2,
}

UI.OffersWnd.slotTypes =
{
	ACCOUNT_AURA	= 1,
	GOLD_REWARD		= 2,
}

UI.OffersWnd.sounds =
{
	tradeWndShow	= "sound/ui/btnClick",
}

-- ------------------------
-- work functions
-- ------------------------

--
function UI.OffersWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_GOLD_REWARD_STATE_CHANGED )

end


--
function UI.OffersWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.OffersWnd:Reset()

	self:Clear()

	self:AddStyle( UI.WS_NOT_DRAW )

end


--
function UI.OffersWnd:FullUpdate()

	self:Reset()
	
	-- золотая награда по расписанию
	
	local goldRewardState = UI.RewardSchedule:GetGoldRewardState()
	if goldRewardState.isActive then
	
		local data =
		{
			slotType	= self.slotTypes.GOLD_REWARD,
			endTime		= goldRewardState.nextTime,
		}
		
		self:AddRecord( data )

	end
	
	-- аккаунт-ауры ака "офферы"
	
	local offers = {}

	for idx, auraInfo in pairs( UI.serverData.accountAuras ) do
		if UI:IsAccountAuraOffer( auraInfo.defName ) then
			table.insert( offers, auraInfo.defName )
		end
	end

	if next( offers ) then

		table.sort( offers )

		for idx, defName in ipairs( offers ) do		

			local data =
			{
				slotType		= self.slotTypes.ACCOUNT_AURA,
				defName			= defName,
				discountType	= self:DetectAccountAuraDiscountType( defName ),
			}

			self:AddRecord( data )

		end
		
	end
	
	if self:GetNumRecords() > 0 then
		self:RemoveStyle( UI.WS_NOT_DRAW )
	end

end


--
function UI.OffersWnd:DetectAccountAuraDiscountType( auraDefName )

	local discountType = -1

	if UI:GetAccountAuraCategory( auraDefName ) == ai.AccountAuraCategory.BUY_GOLD_BONUS then

		discountType = self.discountTypes.GOLD

	else

		local discountedDefName, bIsLicense = UI:GetAccountAuraDiscountedItem( auraDefName )
		if discountedDefName ~= "" then

			if not bIsLicense then

				if UI:IsDefBundle( discountedDefName ) then

					if not UI:CantItemBeBoughtByDef( discountedDefName ) then
						discountType = self.discountTypes.BUNDLE
					else
						sys.log( "UI.OffersWnd:DetectAccountAuraDiscountType()[ERROR]: bundle %s discounted in aura %s cant be bought", discountedDefName, auraDefName )
					end

				else
					sys.log( "UI.OffersWnd:DetectAccountAuraDiscountType()[ERROR]: unsupported discounted def type \"%s\" in aura \"%s\"", discountedDefName, auraDefName )
				end

			else
				-- SC-112141 скидка на лицензии через ауры больше не поддерживается, лицензии сейчас покупаются за реал
				sys.log( "UI.OffersWnd:OnOfferClick()[ERROR]: discount for premium-licenses trhrough account auras is not supported any more (aura '%s')", auraDefName )
			end

		else
			sys.log( "UI.OffersWnd:OnOfferClick()[ERROR]: cannot find discounted item for aura \"%s\"", auraDefName )
		end

	end

	return discountType

end


--
function UI.OffersWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Offers_SlotWnd" ) then

		if wnd:CanClick() then

			local data = wnd:GetRecordData()
			
			if data.slotType == self.slotTypes.ACCOUNT_AURA then

				if data.discountType == self.discountTypes.BUNDLE then
					local discountedDefName = UI:GetAccountAuraDiscountedItem( data.defName )
					UI.HangarWnd:ShowBuyBundleWnd( discountedDefName, nil, true )

				elseif data.discountType == self.discountTypes.GOLD then
					UI.HangarWnd:ShowBuyGoldWnd()
					
				else
					sys.log( "UI.OffersWnd:F_OnMouseLButtonDown()[ERROR]: unhandled discount type: %d", data.discountType )
				end
				
			else
				sys.log( "UI.OffersWnd:F_OnMouseLButtonDown()[ERROR]: unhandled slotType %s", tostring( data.slotType ) )
			end

		end

	end

	return true

end


-- ----------------------------------------------------
-- UI.Offers_SlotWnd
-- ----------------------------------------------------

UI.Offers_SlotWnd = {}

-- ------------------------
-- window definition
-- ------------------------

UI.Offers_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Offers_SlotWnd",
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
				defName 			= "offers_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ico",
						layer		= "UI.Offers_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "timer",
						layer		= "UI.Offers_SlotWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "offer_over",
						layer		= "UI.Offers_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}},
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "offers_slot_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "offers_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ------------------------
-- interface functions
-- ------------------------

--
function UI.Offers_SlotWnd:Reset()

	UI.ButtonsList_Btn:Reset( self )

	self.bInBattles		= false
	self.bInTime		= false
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetText( "", self.layers.TIME )

	self:SetMouseOver( false )

end


--
function UI.Offers_SlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------
-- const
-- ------------------------

UI.Offers_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
	ICO_EFFECT			= 1,
    TIME				= 2,
    MOUSE_OVER_EFFECT	= 3,
}

UI.Offers_SlotWnd.effectInfo =
{
	main =
	{
		animIdle		= "idle",
		animDisable		= "disable",
	},

	ico =
	{
		icoSpriteName	= "ico",
	}
}

UI.Offers_SlotWnd.sounds =
{
	mouseOver = UI.sounds.btnMouseOver
}

UI.Offers_SlotWnd.TIME_THRESHOLD = 10*60

-- ------------------------
-- vars
-- ------------------------

UI.Offers_SlotWnd.bInBattles	= false
UI.Offers_SlotWnd.bInTime		= false
UI.Offers_SlotWnd.tooltipData	= nil

-- ------------------------
-- work functions
-- ------------------------

--
function UI.Offers_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()
	
	if data.slotType == UI.OffersWnd.slotTypes.ACCOUNT_AURA then
	
		local maxTime, maxBattles = UI:GetAccountAuraDuration( data.defName )

		if maxTime and maxBattles then
			sys.log( "UI.Offers_SlotWnd:UpdateTime()[ERROR]: both time and battles are present in aura %s", data.defName )

		elseif maxBattles then
			self.bInBattles	= true

		elseif maxTime then
			self.bInTime = true
		end
		
	elseif data.slotType == UI.OffersWnd.slotTypes.GOLD_REWARD then
		self.bInTime = true
		
	else
		sys.log( "UI.Offers_SlotWnd:UpdateForData()[ERROR]: unhandled slotType %s", tostring( data.slotType ) )
	end

	self:UpdateMainAnimation( data )
	self:UpdateIco( data )
	self:UpdateTime( data, true )
	self:UpdateTooltip( data )
	self:UpdateMouseOver()

end


--
function UI.Offers_SlotWnd:UpdateMainAnimation( data )

	local anim = self:CanClick() and self.effectInfo.main.animIdle or self.effectInfo.main.animDisable

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.Offers_SlotWnd:UpdateIco( data )

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if data.slotType == UI.OffersWnd.slotTypes.ACCOUNT_AURA then
		hTex = UI:GetAccountAuraIco5( data.defName )
		
	elseif data.slotType == UI.OffersWnd.slotTypes.GOLD_REWARD then
		hTex = UI:GetTex( "scheduledGoldReward" )
		
	else
		sys.log( "UI.Offers_SlotWnd:UpdateIco()[ERROR]: unhandled slotType %s", tostring( data.slotType ) )
		hTex = UI:GetTex( "NoData" )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
	end

end


--
function UI.Offers_SlotWnd:UpdateTime( data, bLogErrors )

	local str = ""
	
	if data.slotType == UI.OffersWnd.slotTypes.ACCOUNT_AURA then
	
		local timeLeft, battlesLeft = UI:GetAccountAuraLeftTime( data.defName, bLogErrors )

		if self.bInBattles then

			if battlesLeft then
				str = string.format( UI:GetStringByName( "boosters_durationInFights" ), battlesLeft )
			elseif bLogErrors then
				sys.log( "UI.Offers_SlotWnd:UpdateTime()[ERROR]: cannot get battles left value for aura \"%s\"", data.defName )
			end

		elseif self.bInTime then

			if timeLeft then
				str = self:TimeLeft2Str( timeLeft )
			elseif bLogErrors then
				sys.log( "UI.Offers_SlotWnd:UpdateTime()[ERROR]: cannot get time left value for aura \"%s\"", data.defName )
			end

		end
		
	elseif data.slotType == UI.OffersWnd.slotTypes.GOLD_REWARD then
		
		local curTime = _G.MasterServer_GetServerTime()
		local timeLeft = ( data.endTime > curTime ) and ( ( data.endTime - curTime ) * 0.001 ).l or 0
		str = self:TimeLeft2Str( timeLeft )
	
	elseif bLogErrors then
		sys.log( "UI.Offers_SlotWnd:UpdateTime()[ERROR]: unhandled slotType %s", tostring( data.slotType ) )
	end

	self:SetText( str, self.layers.TIME )

end


--
function UI.Offers_SlotWnd:TimeLeft2Str( timeLeft )

	local str = UI:Time2Str45( timeLeft )

	if timeLeft < self.TIME_THRESHOLD then
		str = string.format( "%s%s", UI:Color2Str( UI.PARAM_DELTA_MINUS_COLOR ), str )
	end
	
	return str
	
end


--
function UI.Offers_SlotWnd:UpdateTooltip( data )

	self.tooltipData = nil
	
	if data.slotType == UI.OffersWnd.slotTypes.ACCOUNT_AURA then

		self.tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			text		= UI:GetAccountAuraDesc( data.defName ),
			caption		= UI:AccountAura2Str( data.defName ),
		}
		
	elseif data.slotType == UI.OffersWnd.slotTypes.GOLD_REWARD then
	
		self.tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			text		= UI:GetStringByName( "scheduledGoldReward_offer_tooltip_text" ),
			caption		= UI:GetStringByName( "scheduledGoldReward_offer_tooltip_caption" ),
		}
	
	else
		sys.log( "UI.Offers_SlotWnd:UpdateTooltip()[ERROR]: unhandled slotType %s", tostring( data.slotType ) )
	end

end


--
function UI.Offers_SlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.bInTime then
		self:UpdateTime( self:GetRecordData(), false )
	end

end


--
function UI.Offers_SlotWnd:UpdateMouseOver()

	local bMouseOver = false

	local data = self:GetRecordData()

	if self:CanClick() then
    	bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Offers_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Offers_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Offers_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Offers_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.Offers_SlotWnd:CanClick()
	
	local bCanClick = false
	
	local data = self:GetRecordData()
	if data ~= nil then
	
		if data.slotType == UI.OffersWnd.slotTypes.ACCOUNT_AURA then
			bCanClick = data.discountType ~= -1
			
		elseif data.slotType == UI.OffersWnd.slotTypes.GOLD_REWARD then
			bCanClick = false
			
		else
			sys.log( "UI.Offers_SlotWnd:CanClick()[ERROR]: unhandled slotType %s", tostring( data.slotType ) )
		end
		
	end
	
	return bCanClick

end