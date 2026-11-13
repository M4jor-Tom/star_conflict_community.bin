-- ----------------------------------------------------------------------------
--
-- Workfile: hudresurrectwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudResurrectWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HudResurrectWnd.def =
{
	className	= "Wnd",	

	props =
	{
		name	= "HudResurrectWnd",
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
				defName 			= "hud_resurrect",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.HudResurrectWnd.layers.MSG",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		}, 

		-- MSG
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children = { "UI.HudResurrect_ResurrectBtn", "UI.HudResurrect_HangarBtn", "UI.HudResurrect_CancelBtn" }
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.HudResurrectWnd:SetupForResurrectionByPlayer( playerId )

	self:Reset()

	if type( playerId ) ~= "number" then
		sys.log( "UI.HudResurrectWnd:SetupForResurrectionByPlayer()[ERROR]: invalid type of the 1-st parameter (\"playerId\"); \"number\"expected, got \"%s\"", type( playerId ) )
		playerId = -1
	end

	self.mode		= self.modes.BY_PLAYER
	self.playerId	= playerId

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudResurrectWnd:SetupForResurrectionByPremium( interval )

	self:Reset()

	self.mode = self.modes.BY_PREMIUM

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudResurrectWnd:SetupForResurrectionByCredits( creditsPrice )

	self:Reset()

	self.mode 			= self.modes.BY_CREDITS
	self.creditsPrice	= creditsPrice

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudResurrectWnd:SetupForResurrectionByNothing()

	self:Reset()

	self.mode = self.modes.NO_RESURRECT

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudResurrectWnd:SetupForResurrectionOtherPlayer( otherPlayerIdx, creditsPrice )

	self:Reset()

	self.mode 			= self.modes.RESURRECT_OTHER_PLAYER
	self.playerId		= otherPlayerIdx
	self.creditsPrice	= creditsPrice

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.HudResurrectWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.HudResurrectWnd:Reset()

	self.mode			= -1
	self.playerId		= -1
	self.numMatrices	= 0
	self.creditsPrice	= 0
	
	self.msgMetaText:SetText( "", true )

	self:ResetBtns()

end


--
function UI.HudResurrectWnd:ResetBtns()

	self.resurrectBtn:Enable( true )
	self.resurrectBtn:SetBtnText( "" )
	self:RemoveControl( self.resurrectBtn, self.layers.MAIN_EFFECT )

	self:RemoveControl( self.hangarBtn, self.layers.MAIN_EFFECT )
	
	self.cancelBtn:Enable( true )
	self:RemoveControl( self.cancelBtn, self.layers.MAIN_EFFECT )

end


--
function UI.HudResurrectWnd:GetMode()

	return self.mode

end


--
function UI.HudResurrectWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result == 0 and self:IsOnScreen() then
		self:UpdatMsg()
		self:UpdateBtns()
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HudResurrectWnd.layers =
{
	MAIN_EFFECT	= 0,
	MSG			= 1,
}

UI.HudResurrectWnd.modes =
{
	BY_PLAYER				= 1,
	BY_PREMIUM				= 2,
	BY_CREDITS				= 3,
	NO_RESURRECT			= 4,
	RESURRECT_OTHER_PLAYER	= 5,
}

UI.HudResurrectWnd.sounds =
{
	resurrect		= "sound/ui/btnClick",
	cancelResurrect	= "sound/ui/btnClick",
	hangar			= UI.sounds.btnClick,
}

UI.HudResurrectWnd.effectInfo =
{
	main =
	{
		resurrectBtnLocator_oneBtn	= "btn",
		resurrectBtnLocator_twoBtns	= "btn_1",
		hangarBtnLocator_oneBtn		= "btn",
		hangarBtnLocator_twoBtns	= "btn_2",
		cancelBtnLocator_oneBtn		= "btn",
		cancelBtnLocator_twoBtns	= "btn_2",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HudResurrectWnd.mode				= -1
UI.HudResurrectWnd.playerId			= -1
UI.HudResurrectWnd.numMatrices		= 0
UI.HudResurrectWnd.creditsPrice		= 0

UI.HudResurrectWnd.resurrectBtn		= nil
UI.HudResurrectWnd.hangarBtn		= nil
UI.HudResurrectWnd.cancelBtn		= nil
UI.HudResurrectWnd.msgMetaText		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HudResurrectWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.resurrectBtn	= UI.HudResurrect_ResurrectBtn
	self.hangarBtn		= UI.HudResurrect_HangarBtn
	self.cancelBtn		= UI.HudResurrect_CancelBtn
	
	self.msgMetaText = UI.MetaText.GetNewInstance()
	self.msgMetaText:InitFromLayer( self, self.layers.MSG )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.HudResurrectWnd:F_Shutdown()

	if self.msgMetaText then
		self.msgMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HudResurrectWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.HudResurrectWnd:UpdateMetaTextPos()
	
	self.msgMetaText:UpdateScreenOrgFromLayer( self, self.layers.MSG )	

end


--
function UI.HudResurrectWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MSG then
		self.msgMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.HudResurrectWnd:FullUpdate()

	if self.mode == -1 then
		return
	end
	
	self:UpdatMsg()
	self:UpdateBtns()

end


--
function UI.HudResurrectWnd:UpdatMsg()

	local strMsg = ""

	if self.mode == self.modes.BY_PLAYER then

		local playerName = UI:MakePlayerNameById( self.playerId, false, false, nil )

		strMsg = UI:GetStringByName( "resurrect_msg_byPlayer" )
		strMsg = string.gsub( strMsg, "%$player%$", playerName )

	elseif self.mode == self.modes.BY_PREMIUM then
		strMsg = UI:GetStringByName( "resurrect_msg_byPremium" )

	elseif self.mode == self.modes.BY_CREDITS then
		strMsg = UI:GetStringByName( "resurrect_msg_byCredits" )

	elseif self.mode == self.modes.NO_RESURRECT then
		strMsg = UI:GetStringByName( "resurrect_msg_noResurrect" )
		
	elseif self.mode == self.modes.RESURRECT_OTHER_PLAYER then
		
		local playerName = UI:MakePlayerNameById( self.playerId, false, false, nil )

		strMsg = UI:GetStringByName( "resurrect_msg_resurrectOtherPlayer" )
		strMsg = string.gsub( strMsg, "%$player%$", playerName )

	else
		sys.log( "UI.HudResurrectWnd:UpdatMsg()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end
	
	-- в пве добавляем количество оставшихся попыток воскрешения (кроме случая, когда воскрешает другой игрок, т.к. попытки отнимутся у него)
	if _G.GetCurrentGameMode() == ai.Gameplay.PVE_MISSION and self.mode ~= self.modes.BY_PLAYER then
	
		local attemptsLeft = _G.CL_GetResurrectionAttemptsLeft()
		
		local missionName = _G.CL_PveGetMissionName()
		local attemptsMax = UI:GetPveMissionMaxResurrectionAttempts( missionName )
		
		local strAttemptsVal = string.format( "%d/%d", attemptsLeft, attemptsMax )
		local strAttempts = UI:GetStringByName( "resurrectionAttempts" )
		
		local numSubst = 0
		strAttempts, numSubst = string.gsub( strAttempts, "%$val%$", strAttemptsVal )
		
		if numSubst == 0 then
			sys.log( "UI.HudResurrectWnd:UpdatMsg()[ERROR]: cannot find placeholder '$val$' in string 'resurrectionAttempts'" )
			strAttempts = string.format( "[INVALID STRING] Attempts left: %s", strAttemptsVal )
		end
		
		strMsg = string.format( "%s|%s", strMsg, strAttempts )
		
	end
	
	-- стоимость в кредитах
	if self.mode == self.modes.BY_CREDITS or self.mode == self.modes.RESURRECT_OTHER_PLAYER then
	
		local priceInfo =
		{
			priceType	= _G.GameStore.CreditsType.CT_CREDITS,
			val			= self.creditsPrice,
			basePrice	= self.creditsPrice,
			bIsBuyPrice	= true,
		}
		
		local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.MSG ), false, true, true, nil )
		
		local numSubst = 0
		strMsg, numSubst = string.gsub( strMsg, "%$cost%$", strPrice )
		
		if numSubst == 0 then
			local strId = self.mode == self.modes.BY_CREDITS and "resurrect_msg_byCredits" or "resurrect_msg_resurrectOtherPlayer"
			sys.log( "UI.HudResurrectWnd:UpdatMsg()[ERROR]: cannot find placeholder '$cost$' in string '%s'", strId )
			strMsg = string.format( "%s [INVALID STRING] Cost: %s", strMsg, strPrice )
		end
		
	end

	self.msgMetaText:SetText( strMsg, true )

end


--
function UI.HudResurrectWnd:UpdateBtns()

	self:ResetBtns()

	local bResurrectBtn	= self.mode ~= self.modes.NO_RESURRECT
	local bHangarBtn	= self.mode ~= self.modes.RESURRECT_OTHER_PLAYER and ( _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE or self.mode == self.modes.NO_RESURRECT )
	local bCancelBtn	= self.mode == self.modes.RESURRECT_OTHER_PLAYER
	
	local numBtns = 0
	if bResurrectBtn then
		numBtns = numBtns + 1
	end	
	if bHangarBtn then
		numBtns = numBtns + 1
	end
	if bCancelBtn then
		numBtns = numBtns + 1
	end
	
	if numBtns > 2 then
		sys.log( "UI.HudResurrectWnd:UpdateBtns(): no locators for 3 btns" )
	end

	local bTwoBtns = bResurrectBtn and bHangarBtn

	if bResurrectBtn then

		local locator = numBtns == 1 and self.effectInfo.main.resurrectBtnLocator_oneBtn or self.effectInfo.main.resurrectBtnLocator_twoBtns
		self:AddControl( self.resurrectBtn, self.layers.MAIN_EFFECT, locator )

		local resurrectBtnText = ""
		local bEnabled = true
		
		if self.mode == self.modes.BY_CREDITS or self.mode == self.modes.RESURRECT_OTHER_PLAYER then
			resurrectBtnText = UI:GetStringByName( "shop_buy" )
			bEnabled = self.creditsPrice <= UI:GetPlayerMoney( false )
		else
			resurrectBtnText = UI:GetStringByName( "resurrect_btnText" )
		end

		self.resurrectBtn:SetBtnText( resurrectBtnText )
		self.resurrectBtn:Enable( bEnabled )

	end

	if bHangarBtn then
		local locator = numBtns == 1 and self.effectInfo.main.hangarBtnLocator_oneBtn or self.effectInfo.main.hangarBtnLocator_twoBtns
		self:AddControl( self.hangarBtn, self.layers.MAIN_EFFECT, locator )
	end
	
	if bCancelBtn then
		local locator = numBtns == 1 and self.effectInfo.main.cancelBtnLocator_oneBtn or self.effectInfo.main.cancelBtnLocator_twoBtns
		self:AddControl( self.cancelBtn, self.layers.MAIN_EFFECT, locator )
	end

end


--
function UI.HudResurrectWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.resurrectBtn then

		self:DoResurrect()

	elseif wnd == self.hangarBtn then

		UI:LoadMainMenuLevel( nil, _G.network.DisconnectReason.CLIENT_RETURN_SPACE_STATION )
		UI:PlayGlobalSound( self.sounds.hangar )
		
	elseif wnd == self.cancelBtn then
		
		self:CancelResurrect()

	end

	return true

end


--
function UI.HudResurrectWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateMetaTextPos()
	self:FullUpdate()

end


--
function UI.HudResurrectWnd:F_OnEventSaveUiState()

	UI.store.HudResurrectWnd =
	{
		mode			= self.mode,
		playerId		= self.playerId,
		numMatrices		= self.numMatrices,
		creditsPrice	= self.creditsPrice
	}

end


--
function UI.HudResurrectWnd:F_OnEventRestoreUiState()

	if UI.store.HudResurrectWnd then

		self.mode			= UI.store.HudResurrectWnd.mode
		self.playerId		= UI.store.HudResurrectWnd.playerId
		self.numMatrices	= UI.store.HudResurrectWnd.numMatrices
		self.creditsPrice	= UI.store.HudResurrectWnd.creditsPrice

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.HudResurrectWnd = nil

	end

end


--
function UI.HudResurrectWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.HudResurrectWnd:RemoveControl( wnd, effectLayer )

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
function UI.HudResurrectWnd:DoResurrect()

	if self.mode == self.modes.RESURRECT_OTHER_PLAYER then
		_G.CL_RequestResurrectOtherPlayerShip( self.playerId, true )
	else
		_G.CL_RequestResurrectShip()
	end
	
	-- блокирование кнопок, которые отправляют запрос на сервер, чтобы нельзя было нажать повторно
	self.resurrectBtn:Enable( false )
	self.cancelBtn:Enable( false )

	UI:PlayGlobalSound( self.sounds.resurrect )

end 


--
function UI.HudResurrectWnd:CancelResurrect()
	
	if self.mode ~= self.modes.RESURRECT_OTHER_PLAYER then
		sys.log( "UI.HudResurrectWnd:CancelResurrect(): not support cancel resurrect for own ship" )
		return
	end
	
	_G.CL_RequestResurrectOtherPlayerShip( self.playerId, false )
	
	-- блокирование кнопок, которые отправляют запрос на сервер, чтобы нельзя было нажать повторно
	self.resurrectBtn:Enable( false )
	self.cancelBtn:Enable( false )
	
	UI:PlayGlobalSound( self.sounds.cancelResurrect )

end


-- ----------------------------------------------------------------
-- UI.HudResurrect_ResurrectBtn
-- ----------------------------------------------------------------

UI.HudResurrect_ResurrectBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn6",

		props =
		{
			name	= "HudResurrect_ResurrectBtn",
		}
	},
}


-- ----------------------------------------------------------------
-- UI.HudResurrect_HangarBtn
-- ----------------------------------------------------------------

UI.HudResurrect_HangarBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn6",

		props =
		{
			name	= "HudResurrect_HangarBtn",
		}
	},

	textId = "resurrect_hangarBtnText"
}


-- ----------------------------------------------------------------
-- UI.HudResurrect_CancelBtn
-- ----------------------------------------------------------------

UI.HudResurrect_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn6",

		props =
		{
			name	= "HudResurrect_CancelBtn",
		}
	},

	textId = "cancel"
}