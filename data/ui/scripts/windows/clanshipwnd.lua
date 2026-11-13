-- ----------------------------------------------------------------------------
--
-- Workfile: clanshipwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.ClanShipWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.ClanShipWnd.layers =
{
	MAIN_EFFECT		= 0,
    WAIT_EFFECT		= 1,
    WAIT_TEXT		= 2,
}


--
UI.ClanShipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ClanShipWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		firstOverlayLayer = UI.ClanShipWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "clanShip_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "sel_dread",
						wnd			= "UI.ClanShip_ShipChoiceWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "dread_mess",
						wnd			= "UI.ClanShip_NoShipWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_main",
						wnd			= "UI.ClanShip_GatherProgressWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer1",
						wnd			= "UI.ClanShip_TimerWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "timer",
						wnd			= "UI.ClanShip_GatherWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.ClanShipWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "dread_mess",
						wnd			= "UI.ClanShip_StartBuildPartWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "dread_mess",
						wnd			= "UI.ClanShip_NoBuildingPartWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_3",
						wnd			= "UI.ClanShip_PropsToggleBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "proper",
						wnd			= "UI.ClanShip_PropsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",
						wnd			= "UI.ClanShip_ShipLocationWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "build_dread_btns",
						wnd			= "UI.ClanShip_ShipIconListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "button_4",
						wnd			= "UI.ClanShip_SetCurrentShipBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
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
						layer		= "UI.ClanShipWnd.layers.WAIT_TEXT",
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

	children =
	{
		"UI.ClanShip_ShipChoiceWnd",
		"UI.ClanShip_NoShipWnd",
		"UI.ClanShip_GatherProgressWnd",
		"UI.ClanShip_TimerWnd",
		"UI.ClanShip_GatherWnd",
		"UI.ClanShip_StartBuildPartWnd",
		"UI.ClanShip_NoBuildingPartWnd",
		"UI.ClanShip_FitSlotsWnd",
		"UI.ClanShip_FitPartsListWnd",
		"UI.ClanShip_PropsToggleBtn",
		"UI.ClanShip_PropsWnd",
		"UI.ClanShip_ShipLocationWnd",
		"UI.ClanShip_ShipIconListWnd",
		"UI.ClanShip_SetCurrentShipBtn",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShipWnd:GetShipName()

	return self.shipName

end


--
function UI.ClanShipWnd:GetState()

	return self.state

end


--
function UI.ClanShipWnd:OnClanDataChanged()

	if not self:IsOnScreen() then
		return
	end

	local gatheredBuildMoney = UI:GetClanShipBuildIridium()
	if gatheredBuildMoney ~= self.gatheredBuildMoney then

		self.gatheredBuildMoney = gatheredBuildMoney
		self:OnGatheredBuildMoneyChanged()

	end

	local clanMoney = UI:GetIridium()
	if clanMoney ~= self.clanMoney then

		self.clanMoney = clanMoney
		self:OnClanMoneyChanged()

	end

	local clanRole = UI.Clan:GetClanMemberRole( UI:GetLocalPlayerUid() )
	if clanRole ~= self.clanRole then

		self.clanRole = clanRole
		self:OnClanRoleChanged()

	end

end


--
function UI.ClanShipWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	local playerMoney = UI:GetPlayerTokens()
	if playerMoney ~= self.playerMoney then

		self.playerMoney = playerMoney
		self:OnPlayerMoneyChanged()

	end

end


--
function UI.ClanShipWnd:MasterServer_OnClanShipInfo( result, requestId, param1, param2 )

	sys.log( "UI.ClanShipWnd:MasterServer_OnClanShipInfo()[ERROR]: this callback is not supposed to be called" )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.ClanShipWnd:MasterServer_OnClanShipBuildingChanged( shipName )

	if self:IsOnScreen() then

		if self.shipName == "" then
			self:FullUpdate()
		else
			if shipName == self.shipName then
				self:OnShipBuildStateChanged()
			else
				self:OnOtherShipBuildStateChanged( shipName )
			end
		end

	end

	if self.bWaitingClanShipData then

		self.bWaitingClanShipData = false
		self:UpdateWaitingEffect()

	end

end


--
function UI.ClanShipWnd:MasterServer_OnClanShipBuild( result, requestId, shipName, partName, slotName )

	-- реальный апдейт происходит в MasterServer_OnClanShipBuildingChanged() 

	if requestId == self.buildRequestId then

		self.buildRequestId = 0

    	if result ~= _G.MasterServer.ClanOpResult.CLR_OK then

			self:ShowMsgOnBuildError( result )
			self.bWaitingClanShipData = false

		end

		self:UpdateWaitingEffect()

	end

end


--
function UI.ClanShipWnd:MasterServer_OnClanBankTransfer( result, requestId, param1, param2 )

	-- реальный апдейт будет из UI.Clan:ReloadList()

	if requestId == self.playerMoneyTransferRequestId then

		if result ~= _G.MasterServer.ClanOpResult.CLR_OK then
			self:ShowMsgOnTransferPlayerMoneyError( result )
		end

		self.playerMoneyTransferRequestId = 0
		self:UpdateWaitingEffect()

	end

end


--
function UI.ClanShipWnd:MasterServer_OnResourceConvert( result, requestId, param1, param2 )

	-- реальный апдейт будет из UI.Clan:ReloadList()

	if requestId == self.clanMoneyTransferRequestId then

		if result ~= _G.MasterServer.ClanOpResult.CLR_OK then
			self:ShowMsgOnTransferClanMoneyError( result )
		end

		self.clanMoneyTransferRequestId = 0
		self:UpdateWaitingEffect()

	end

end


--
function UI.ClanShipWnd:MasterServer_ClanShipBuildingComplete( shipName )

	if not self:IsOnScreen() then
		return
	end

	if shipName == self.shipName then
		self:OnShipBuildStateChanged()
	else
		self:OnOtherShipBuildStateChanged( shipName )
	end

	UI:PlayGlobalSound( self.sounds.buildingComplete )	

end


--
function UI.ClanShipWnd:MasterServer_OnClanShipFit( result, requestId, shipName )

	-- реальный апдейт происходит в MasterServer_OnClanShipBuildingChanged() 

	if requestId == self.fitRequestId then

		self.fitRequestId = 0

    	if result ~= _G.MasterServer.ClanOpResult.CLR_OK then

			self:ShowMsgOnFitError( result )
			self.bWaitingClanShipData = false

		end

		self:UpdateWaitingEffect()

	end

end


--
function UI.ClanShipWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.playerMoneyTransferRequestId	= 0
	self.clanMoneyTransferRequestId		= 0
	self.buildRequestId					= 0
	self.fitRequestId					= 0
	self.bWaitingClanShipData			= false
	self.boostBuildingRequestId			= 0
	self.changeCurrentClanShipRequestId	= 0

	self:UpdateWaitingEffect()

end


--
function UI.ClanShipWnd:GetBgRect()

	local rect = UI:ZeroQuat()

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if bgEffect then

		rect = bgEffect:CalcSpriteRect( self.effectInfo.main.bgSpriteName )

		local effectPos = bgEffect:GetPos()
		rect.x = rect.x + effectPos.x
		rect.y = rect.y + effectPos.y

	end

	return rect

end


--
function UI.ClanShipWnd:GetBgTex()

	local hTex = UI.INVALID_RESOURCE_HANDLE

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if bgEffect then
		hTex = bgEffect:GetSpriteTexture( self.effectInfo.main.bgSpriteName )
	end

	return hTex

end


--
function UI.ClanShipWnd:GetFitSlotsPos()

	local pos = UI:ZeroVec2()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		pos = mainEffect:GetObjPos( self.effectInfo.main.fitSlotsLocator )
	end

	return pos

end


--
function UI.ClanShipWnd:OnSelFitSlotChanged()

	self:UpdateFitPartsList()

end


--
function UI.ClanShipWnd:HandleEscape()

	if self:GetSelFitSlotName() ~= "" then
		self:SelectFitSlot( "" )
		return true
	else
		return false
	end

end


--
function UI.ClanShipWnd:IsInDock()

	return self.bInDock

end


--
function UI.ClanShipWnd:MasterServer_OnClanShipLeave( shipName, zoneId )

	if not self:IsOnScreen() then
		return
	end

	if shipName ~= self.shipName then
		return
	end

	self:UpdateInDockState( true )

	if UI.ClanShip_ShipLocationWnd:IsChildOf( self ) then
		UI.ClanShip_ShipLocationWnd:OnClanShipLeaveZone()
	end

end


--
function UI.ClanShipWnd:MasterServer_OnClanShipBoostBuilding( result, requestId, shipName )

	-- реальный апдейт происходит в MasterServer_OnClanShipBuildingChanged() 

	if requestId == self.boostBuildingRequestId then

		self.boostBuildingRequestId = 0

    	if result ~= _G.MasterServer.ClanOpResult.CLR_OK then

			self:ShowMsgOnBoostBuildingError( result )
			self.bWaitingClanShipData = false

		end

		self:UpdateWaitingEffect()

	end
	
end


--
function UI.ClanShipWnd:MasterServer_OnClanNotification( type, cid, uid, param1, param2 )

	if type == MasterServer.ClanNotification.CLN_NEW_HIGH_RANK then

		if self:IsOnScreen() and UI.ClanShip_ShipChoiceWnd:IsChildOf( self ) then
			UI.ClanShip_ShipChoiceWnd:OnClanNewHighRank()
		end

	end

end


--
function UI.ClanShipWnd:OnHangarPrepareStateChanged()

	if not self:IsOnScreen() then
		return
	end

	if UI.ClanShip_ShipLocationWnd:IsChildOf( self ) then
		UI.ClanShip_ShipLocationWnd:OnHangarPrepareStateChanged()
	end

end


--
function UI.ClanShipWnd:MasterServer_OnClanShipSetCurrent( result, requestId, param1, param2 )

	if result == _G.MasterServer.ClanOpResult.CLR_OK then
	
		if self:IsOnScreen() then
			self:OnCurrentShipChanged()
		end

	else
	
		if requestId == self.changeCurrentClanShipRequestId then
			self:ShowMsgOnSetCurrentError( result )
		end

	end
	
	if requestId == self.changeCurrentClanShipRequestId then
		self.changeCurrentClanShipRequestId = 0
		self:UpdateWaitingEffect()
	end
	
end


-- приходит всем членам клана;
-- если это данный игрок вызвал строительство, то у него уже всё проапдейтилось в MasterServer_OnClanShipSetCurrent, здесь фактически второй раз;
-- но т.к. в этой функии нет никаких данных о том, кто вызвал смену корабля, то не ясно, приходил/придет ли MasterServer_OnClanShipSetCurrent, поэтому апдейт и здесь
function UI.ClanShipWnd:MasterServer_OnClanShipUpdateCurrent( result, requestId, param1, param2 )

	if result == _G.MasterServer.ClanOpResult.CLR_OK then
	
		if self:IsOnScreen() then
			self:OnCurrentShipChanged()
		end

	end
	
end


--
function UI.ClanShipWnd:GetTooltipData_CantBuildMultiple()

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "clanShip_cantBuildMultiple_tooltipCaption" ),
		text		= string.format( "%s%s", UI:Color2Str( UI.RED_COLOR ), UI:GetStringByName( "clanShip_cantBuildMultiple_tooltipText" ) ),
	}
	
	return tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShipWnd.states =
{
	NO_SHIP			= 1,	-- нет выделенное корабля (в ситуации когда нет ни одного корабля, который построен или начал строиться)
	BUILD_NONE		= 2,	-- выбранный корабль еще не начал строиться
	BUILD_BASE		= 3,	-- строятся основные части
	BUILD_FIT		= 4,	-- корабь построен, экипируется модулями
}

UI.ClanShipWnd.effectInfo =
{
	main =
	{
        shipChoiceLocator		= "sel_dread",
        noShipLocator			= "dread_mess",
        gatherProgressLocator	= "progr_main",
        gatherLocator_isTime	= "timer2",
        gatherLocator_noTime	= "timer",
        buildTimerLocator		= "timer1",
		startBuildPartLocator	= "dread_mess",
		noBuildingPartLocator	= "dread_mess",
		propsToggleBtnLocator	= "btn_3",
		propsLocator			= "proper",
		bgSpriteName			= "ico",
		shipLocationLocator		= "text",
		fitSlotsLocator			= "modul",
		shipIconsLocator		= "build_dread_btns",
		setCurrentBtnLocator	= "button_4",
	}
}

UI.ClanShipWnd.bgPath			= "ui/textures/clanship"
UI.ClanShipWnd.defaultTexName	= "NoData"

--
UI.ClanShipWnd.sounds =
{
	shipMouseOver		= "sound/ui/btnMouseOver",
	shipSelect			= UI.sounds.btnClick,
	shipBuild			= "sound/ui/apply",
	moneySourceToggle	= UI.sounds.btnClick,
	transferMoney		= "sound/ui/apply",
	partBuild			= "sound/ui/apply",
	fitSlotMouseOver	= UI.sounds.btnMouseOver,
	fitSlotSelect		= "sound/ui/btnClick",
	fitPartMouseOver	= "sound/ui/btnMouseOver", 
	fitPartsListHide	= "sound/ui/MsgHide",
	fitPartEquip		= "sound/ui/moduleEquip",
	fitPartUnequip		= "sound/ui/cancel",
	buildingComplete	= "sound/ui/clanshipBuild",
}

UI.ClanShipWnd.FIT_PARTS_SPACE_Y		= 3

UI.ClanShipWnd.PROPS_VISIBLE_DEFAULT	= false
UI.ClanShipWnd.GATHER_VISIBLE_DEFAULT	= false

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShipWnd.state							= -1
UI.ClanShipWnd.shipName							= ""
UI.ClanShipWnd.hOriginalTex						= UI.INVALID_RESOURCE_HANDLE
UI.ClanShipWnd.hDefaultTex						= UI.INVALID_RESOURCE_HANDLE
UI.ClanShipWnd.playerMoneyTransferRequestId		= 0
UI.ClanShipWnd.clanMoneyTransferRequestId		= 0
UI.ClanShipWnd.buildRequestId					= 0
UI.ClanShipWnd.fitRequestId						= 0
UI.ClanShipWnd.bWaitingClanShipData				= false
UI.ClanShipWnd.boostBuildingRequestId			= 0
UI.ClanShipWnd.gatheredBuildMoney				= 0
UI.ClanShipWnd.clanMoney						= 0
UI.ClanShipWnd.playerMoney						= 0
UI.ClanShipWnd.clanRole							= -1
UI.ClanShipWnd.hMsgBuildShip					= UI.INVALID_UI_HANDLE
UI.ClanShipWnd.shipNameToBuild					= nil
UI.ClanShipWnd.bInDock							= false
UI.ClanShipWnd.bGatherModeChanged				= false
UI.ClanShipWnd.bBuilding						= false
UI.ClanShipWnd.bGathering						= false
UI.ClanShipWnd.bForceShowGather					= false
UI.ClanShipWnd.changeCurrentClanShipRequestId	= 0
UI.ClanShipWnd.shipNameToSet					= nil
UI.ClanShipWnd.prevShipName						= ""
UI.ClanShipWnd.hMsgSetAsCurrent					= UI.INVALID_UI_HANDLE

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.hOriginalTex = mainEffect:GetSpriteTexture( self.effectInfo.main.bgSpriteName )
	end

	self.hDefaultTex = UI:GetTex( self.defaultTexName )

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.ClanShipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self.prevShipName = ""
	self:FullUpdate()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

end


--
function UI.ClanShipWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:ReleaseBg()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		self:Reset()
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

	end

end


--
function UI.ClanShipWnd:Reset()

	self.gatheredBuildMoney		= 0
	self.clanMoney				= 0
	self.playerMoney			= 0
	self.clanRole				= -1

	self.shipName				= ""
	self.state					= -1
	self.bInDock				= false
	self.bGatherModeChanged		= false
	self.bBuilding				= false
	self.bGathering				= false
	self.bForceShowGather		= false

	self:RemoveControls()
	self:ReleaseBg()

	local bPurge = false

	if self.hMsgBuildShip ~= UI.INVALID_UI_HANDLE then

		if not UI:IsInRemovingAllWindows() then	
    		UI:RemoveUiObj( self.hMsgBuildShip )
    		bPurge = true
		end

		self.hMsgBuildShip = UI.INVALID_UI_HANDLE

	end
	
	if self.hMsgSetAsCurrent ~= UI.INVALID_UI_HANDLE then

		if not UI:IsInRemovingAllWindows() then	
    		UI:RemoveUiObj( self.hMsgSetAsCurrent )
    		bPurge = true
		end

		self.hMsgSetAsCurrent = UI.INVALID_UI_HANDLE

	end

	if bPurge then
		UI:Purge()
	end

	self.shipNameToBuild = nil

end


--
function UI.ClanShipWnd:RemoveControls()

	self:RemoveControl( UI.ClanShip_ShipChoiceWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_NoShipWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_GatherProgressWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_TimerWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_GatherWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_StartBuildPartWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_NoBuildingPartWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_FitSlotsWnd )
	self:RemoveControl( UI.ClanShip_FitPartsListWnd )
	self:RemoveControl( UI.ClanShip_PropsToggleBtn, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_PropsWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_ShipLocationWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_ShipIconListWnd, self.layers.MAIN_EFFECT )
	self:RemoveControl( UI.ClanShip_SetCurrentShipBtn, self.layers.MAIN_EFFECT )

	self:CheckRemoveMsgBoxes()

end


--
function UI.ClanShipWnd:FullUpdate()

	self:Reset()

	self.gatheredBuildMoney		= UI:GetClanShipBuildIridium()
	self.clanMoney				= UI:GetIridium()
	self.playerMoney			= UI:GetPlayerTokens()
	self.clanRole				= UI.Clan:GetClanMemberRole( UI:GetLocalPlayerUid() )

	self:UpdateSelShip()
	self:UpdateWaitingEffect()

end


-- определение корабля, для которого будет показываться интерфейс
function UI.ClanShipWnd:UpdateSelShip()
	
	local selShipName = ""
	
	-- после перезагружки ui восстанавливается выделение 
	if self.shipNameToSet then
	
		selShipName = self.shipNameToSet
		self.shipNameToSet = nil
		
	else
	
		-- если есть корабль, помеченный как "текущий", то выделяется он
		local currentShipName = UI:GetCurrentClanShipName()
		if currentShipName ~= "" then
		
			selShipName = currentShipName
			
		else
		
			-- если нет "текущего" (его может не быть, т.к. этот функционал в коде был сделан позднее, когда у игроков корабль уже мог быть построен),
			-- то выделяется тот, который начался строиться или построен
			
			local allShips = UI:GetAllClanShipNames()
			for shipIdx, shipName in ipairs( allShips ) do
				if UI:IsClanShipBuildStarted( shipName ) then
					selShipName = shipName
					break
				end
			end
			
		end
		
	end
	
	self:SelectShip( selShipName, true )

end


--
function UI.ClanShipWnd:SelectShip( shipName, bForceUpdate )

	if shipName == self.shipName and not bForceUpdate then
		return
	end

	self.prevShipName = self.shipName
	self.shipName = shipName
	
	self:UpdateInDockState( false )
	self:UpdateState( true )
	
end


--
function UI.ClanShipWnd:UpdateState( bAfterChangeShip )

	if bAfterChangeShip == nil then
		bAfterChangeShip = false
	end

	local state = -1

	if UI.Clan:IsInClan() then

		if self.shipName == "" then
			state = self.states.NO_SHIP
		
		elseif not UI:IsClanShipBuildStarted( self.shipName ) then
			state = self.states.BUILD_NONE
		
		elseif UI:GetClanShipNumBuiltBaseParts( self.shipName ) < UI:GetClanShipMaxBaseParts( self.shipName ) then
			state = self.states.BUILD_BASE
			
		else
			state = self.states.BUILD_FIT
		end

	else
		sys.log( "UI.ClanShipWnd:UpdateState()[ERROR]: not in clan" )
	end

	self:SetState( state, bAfterChangeShip )

end


--
function UI.ClanShipWnd:SetState( state, bAfterChangeShip )

	if bAfterChangeShip == nil then
		bAfterChangeShip = false
	end

	if state == self.state and not bAfterChangeShip then
		return
	end

	self.state = state

	self:UpdateBg()			-- должно быть перед UpdateControlsVisibility(), т.к. fit-слоты используют координаты фона
	self:UpdateControlsVisibility( bAfterChangeShip )
 
end


--
function UI.ClanShipWnd:UpdateControlsVisibility( bAfterChangeShip )

	if bAfterChangeShip == nil then
		bAfterChangeShip = false
	end

	if bAfterChangeShip then
		self:RemoveControls()
	end

	local bShipChoice			= false
	local bNoShip				= false
	local bGatherProgress		= false
	local bCanShowGatherWnd		= false
	local bGatherWnd			= false
	local bTimer				= false
	local bStartBuildPart		= false
	local bNoBuildingPart		= false
	local bFitSlots				= false
	local bCanShowFitPartsList	= false
	local bPropsToggleBtn		= false
	local bProps				= false
	local bShipLocation			= false
	local bShipIcons			= false
	local bSetCurrentBtn		= false

	if self.state == self.states.NO_SHIP then

    	if UI:IsRightsToBuildClanShip() then
			bShipChoice = true
    	else
			bNoShip = true
    	end
		
		
	elseif self.state == self.states.BUILD_NONE then
	
		bShipChoice = true
		

	elseif self.state == self.states.BUILD_BASE then

		bGatherProgress = true

        if UI:IsClanShipGatheringMoney( self.shipName ) then
			bTimer = self.bInDock
			bCanShowGatherWnd = self.bInDock

        elseif UI:IsClanShipBuilding( self.shipName ) then
			bTimer = true
			bCanShowGatherWnd = self.bInDock and UI:GetClanShipBoostPriceCap( self.shipName ) > 0

        else

            local numBuiltParts	= UI:GetClanShipNumBuiltBaseParts( self.shipName )	
        	local maxParts		= UI:GetClanShipMaxBaseParts( self.shipName )

        	if numBuiltParts < maxParts then

        		if UI:IsRightsToBuildClanShip() then
					bStartBuildPart = true
        		else
					bNoBuildingPart = true
        		end

        	else
        		sys.log( "UI.ClanShipWnd:UpdateControlsVisibility()[ERROR]: no next base part" )
        	end

        end
		
		bShipIcons = true


	elseif self.state == self.states.BUILD_FIT then

        if UI:IsClanShipGatheringMoney( self.shipName ) then
			bTimer = self.bInDock
			bCanShowGatherWnd = self.bInDock

        elseif UI:IsClanShipBuilding( self.shipName ) then
			bTimer = true
			bCanShowGatherWnd = self.bInDock and UI:GetClanShipBoostPriceCap( self.shipName ) > 0
		end

		bFitSlots				= self.bInDock
		bCanShowFitPartsList	= UI:IsRightsToBuildClanShip() and self.bInDock
		bShipLocation			= not self.bInDock
		bPropsToggleBtn			= true
		bShipIcons				= true
		bSetCurrentBtn			= self.shipName ~= UI:GetCurrentClanShipName() and UI:HasClanPrivilege( _G.MasterServer.ClanActionPrivileges.CAP_SET_CURRENT_CLAN_SHIP )

	else
		sys.log( "UI.ClanShipWnd:UpdateControlsVisibility()[ERROR]: unhandled state %s", tostring( self.state ) )
	end

	if bPropsToggleBtn then

		local bWasPropsToggleBtn = UI.ClanShip_PropsToggleBtn:IsChildOf( self )
		if bWasPropsToggleBtn then
			bProps = UI.ClanShip_PropsWnd:IsChildOf( self )
		else
			bProps = self.PROPS_VISIBLE_DEFAULT
		end

	end

	if bCanShowGatherWnd then

		if self.bForceShowGather then

			bGatherWnd = true

		else

    		local bDefaultGatherVisibility = false

    		if self.bGatherModeChanged then
    			bDefaultGatherVisibility = true
    		else
    			local bWasGatherWndAllowed = UI.ClanShip_TimerWnd:IsChildOf( self ) and UI.ClanShip_TimerWnd:HasGatherToggleBtn()
    			if not bWasGatherWndAllowed then
    				bDefaultGatherVisibility = true
    			end
    		end

    		if bDefaultGatherVisibility then
    			bGatherWnd = self.GATHER_VISIBLE_DEFAULT
    		else
    			bGatherWnd = UI.ClanShip_GatherWnd:IsChildOf( self )
    		end

		end

		if bGatherWnd and not bTimer then
			sys.log( "UI.ClanShipWnd:UpdateControlsVisibility()[ERROR]: cannot show gather wnd without timer" )
			bGatherWnd = false
		end

	end

	self:SetControlVisible( bShipChoice,		UI.ClanShip_ShipChoiceWnd,		self.layers.MAIN_EFFECT,	self.effectInfo.main.shipChoiceLocator )
	self:SetControlVisible( bNoShip,			UI.ClanShip_NoShipWnd,			self.layers.MAIN_EFFECT,	self.effectInfo.main.noShipLocator )
	self:SetControlVisible( bGatherProgress,	UI.ClanShip_GatherProgressWnd,	self.layers.MAIN_EFFECT,	self.effectInfo.main.gatherProgressLocator )
	self:SetControlVisible( bStartBuildPart,	UI.ClanShip_StartBuildPartWnd,	self.layers.MAIN_EFFECT,	self.effectInfo.main.startBuildPartLocator )
	self:SetControlVisible( bNoBuildingPart,	UI.ClanShip_NoBuildingPartWnd,	self.layers.MAIN_EFFECT,	self.effectInfo.main.noBuildingPartLocator )
	self:SetControlVisible( bFitSlots,			UI.ClanShip_FitSlotsWnd )
	self:SetControlVisible( bPropsToggleBtn,	UI.ClanShip_PropsToggleBtn,		self.layers.MAIN_EFFECT,	self.effectInfo.main.propsToggleBtnLocator )
	self:SetControlVisible( bProps,				UI.ClanShip_PropsWnd,			self.layers.MAIN_EFFECT,	self.effectInfo.main.propsLocator )
	self:SetControlVisible( bShipLocation,		UI.ClanShip_ShipLocationWnd,	self.layers.MAIN_EFFECT,	self.effectInfo.main.shipLocationLocator )
	self:SetControlVisible( bTimer,				UI.ClanShip_TimerWnd,			self.layers.MAIN_EFFECT,	self.effectInfo.main.buildTimerLocator )
	self:SetControlVisible( bShipIcons,			UI.ClanShip_ShipIconListWnd,	self.layers.MAIN_EFFECT,	self.effectInfo.main.shipIconsLocator )
	self:SetControlVisible( bSetCurrentBtn,		UI.ClanShip_SetCurrentShipBtn,	self.layers.MAIN_EFFECT,	self.effectInfo.main.setCurrentBtnLocator )

	-- вызывать обязательно после таймера, чтобы правлильно определить локатор
	if bGatherWnd then
		self:AddChild( UI.ClanShip_GatherWnd )
		self:UpdateGatherWndPos()
	else
		self:RemoveControl( UI.ClanShip_GatherWnd, self.layers.MAIN_EFFECT )
	end

	if not bCanShowFitPartsList and self:GetSelFitSlotName() ~= "" then
		self:SelectFitSlot( "" )
	end

	self:CheckRemoveMsgBoxes()

	self:UpdatePropsToggleBtnState()
	self:UpdateGatherToggleBtn()

	self.bGatherModeChanged = false
	self.bForceShowGather = false

end


--
function UI.ClanShipWnd:UpdateGatherWndPos()

	if not UI.ClanShip_GatherWnd:IsChildOf( self ) then
		return
	end

	if not UI.ClanShip_TimerWnd:IsChildOf( self ) then
		sys.log( "UI.ClanShipWnd:UpdateGatherWndPos() timer wnd is not on screen" )
		return
	end

    local effect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if effect then

    	effect:UnlinkWnd( UI.ClanShip_GatherWnd:GetUiHandle(), "" )

		local locator = UI.ClanShip_TimerWnd:HasTime() and self.effectInfo.main.gatherLocator_isTime or self.effectInfo.main.gatherLocator_noTime
    	effect:LinkWnd( UI.ClanShip_GatherWnd:GetUiHandle(), locator, UI.EffectAnimParams.POS )

	end

end


--
function UI.ClanShipWnd:CheckRemoveMsgBoxes()

	local bPurge = false

	if not UI.ClanShip_ShipChoiceWnd:IsChildOf( self ) then
	
		if self.hMsgBuildShip ~= UI.INVALID_UI_HANDLE then
	
			if not UI:IsInRemovingAllWindows() then	
				UI:RemoveUiObj( self.hMsgBuildShip )
				bPurge = true
			end
	
			self.hMsgBuildShip = UI.INVALID_UI_HANDLE
	
		end
	
		self.shipNameToBuild = nil

	end
	
	if not UI.ClanShip_SetCurrentShipBtn:IsOnScreen() then
	
		if self.hMsgSetAsCurrent ~= UI.INVALID_UI_HANDLE then

			if not UI:IsInRemovingAllWindows() then	
				UI:RemoveUiObj( self.hMsgSetAsCurrent )
				bPurge = true
			end

			self.hMsgSetAsCurrent = UI.INVALID_UI_HANDLE

		end
		
	end

	if bPurge then
		UI:Purge()
	end

end


--
function UI.ClanShipWnd:UpdateBg()

	local texFileName = ""

	if self.state == self.states.NO_SHIP then

		texFileName = "no_ship"
		
	elseif self.state == self.states.BUILD_NONE then
	
		texFileName = "no_ship"

	elseif self.state == self.states.BUILD_BASE then

		local partName = ""

    	if UI:IsClanShipGatheringMoney( self.shipName ) then
    		partName = UI:GetClanShipGatheringMoneyPartName( self.shipName )

    	elseif UI:IsClanShipBuilding( self.shipName ) then
    		partName = UI:GetClanShipBuildingPartName( self.shipName )

    	else

			local partIdx = -1

	    	local numBuiltParts	= UI:GetClanShipNumBuiltBaseParts( self.shipName )	
			local maxParts		= UI:GetClanShipMaxBaseParts( self.shipName )

			if maxParts > 0 then
				partIdx = math.min( numBuiltParts + 1, maxParts )
			end

    		if partIdx ~= -1  then
    			partName = UI:ClanShipBasePartIdx2Name( self.shipName, partIdx )
    		end

    	end	

		if partName ~= "" then
			texFileName = self:GetBgTexNameForPart( self.shipName, partName )
		else
			sys.log( "UI.ClanShipWnd:UpdateBg()[ERROR]: cannot find part in BUILD_BASE state" )
		end


	elseif self.state == self.states.BUILD_FIT then

		if self.bInDock then
			texFileName = string.format( "%s_fitting", self.shipName )
		else
			texFileName = string.format( "%s_away", self.shipName )
		end

	else
		sys.log( "UI.ClanShipWnd:UpdateBg()[ERROR]: unhandled state %s", tostring( self.state ) )
	end


	if texFileName ~= "" then
		self:LoadBg( texFileName )
	else
		self:ReleaseBg()
	end

end


--
function UI.ClanShipWnd:GetBgTexNameForPart( shipName, partName )

	return string.format( "%s_%s", shipName, partName )

end


--
function UI.ClanShipWnd:ReleaseBg()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local hTex = mainEffect:GetSpriteTexture( self.effectInfo.main.bgSpriteName )

	if hTex ~= UI.INVALID_RESOURCE_HANDLE then

		mainEffect:SetSpriteTexture( self.effectInfo.main.bgSpriteName, UI.INVALID_RESOURCE_HANDLE )

		if hTex ~= self.hOriginalTex and hTex ~= self.hDefaultTex then
    		UI:UnloadTexture( hTex, true )
		end

	end

end


--
function UI.ClanShipWnd:LoadBg( texFileName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	if texFileName == "" then
		self:ReleaseBg()
		return
	end

	local path		= string.format( "%s/%s", self.bgPath, texFileName )
	local oldPath	= ""

	local hTex = mainEffect:GetSpriteTexture( self.effectInfo.main.bgSpriteName )
	if hTex ~= UI.INVALID_RESOURCE_HANDLE then

		local rc = UI:GetResourceByHandle( hTex )
		oldPath = rc:GetTextureFile()

	end	

	if self:UnifyPath( path ) == self:UnifyPath( oldPath ) then
		return
	end

	self:ReleaseBg()

	local hTex = UI:LoadTexture( "shipClanBg", path, UI:ZeroQuat() )

	if hTex == UI.INVALID_RESOURCE_HANDLE then
		hTex = self.hDefaultTex
	end

	mainEffect:SetSpriteTexture( self.effectInfo.main.bgSpriteName, hTex )

end


--
function UI.ClanShipWnd:UnifyPath( path )

	return string.lower( string.gsub( path, "\\" , "/" ) )

end


--
function UI.ClanShipWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

	if effectLayer and effectLayer ~= -1 then

	    local effect = UI:GetEffectFromLayer( self, effectLayer )

    	if wnd:IsChildOf( self ) and effect then
        	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
    	end

		UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

	else

		self:AddChild( wnd )

	end

end


--
function UI.ClanShipWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	if effectLayer and effectLayer ~= -1 then

    	local effect = UI:GetEffectFromLayer( self, effectLayer )
    	if effect then
    		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
    	end

	end

end  


--
function UI.ClanShipWnd:SetControlVisible( bVisible, wnd, effectLayer, locatorName )

	if bVisible then
		self:AddControl( wnd, effectLayer, locatorName )
	else
		self:RemoveControl( wnd, effectLayer )	
	end

end


--
function UI.ClanShipWnd:OnGatheredBuildMoneyChanged()

	if UI.ClanShip_GatherWnd:IsChildOf( self ) then
		UI.ClanShip_GatherWnd:OnGatheredBuildMoneyChanged()
	end

end


--
function UI.ClanShipWnd:OnClanMoneyChanged()

	if UI.ClanShip_GatherWnd:IsChildOf( self ) then
		UI.ClanShip_GatherWnd:OnClanMoneyChanged()
	end

end


--
function UI.ClanShipWnd:OnPlayerMoneyChanged()  

	if UI.ClanShip_GatherWnd:IsChildOf( self ) then
		UI.ClanShip_GatherWnd:OnPlayerMoneyChanged() 
	end

end


--
function UI.ClanShipWnd:OnClanRoleChanged()

	self:UpdateControlsVisibility()

	if UI.ClanShip_GatherWnd:IsChildOf( self ) then
		UI.ClanShip_GatherWnd:OnClanRoleChanged()
	end

end


--
function UI.ClanShipWnd:OnShipBuildStateChanged()

	local bOldBuilding = self.bBuilding
	local bOldGathering = self.bGathering

	self.bBuilding	= UI:IsClanShipBuilding( self.shipName )
	self.bGathering	= UI:IsClanShipGatheringMoney( self.shipName )

	if self.bBuilding ~= bOldBuilding or self.bGathering ~= bOldGathering then
		self.bGatherModeChanged = true
	end

	local oldState = self.state
	self:UpdateInDockState( false )
	self:UpdateState()

	if self.state == oldState then

    	if self.state == self.states.BUILD_BASE then
    		self:UpdateBg()
    	end

    	self:UpdateControlsVisibility()

	end

	if UI.ClanShip_GatherProgressWnd:IsChildOf( self ) then
		UI.ClanShip_GatherProgressWnd:OnShipBuildStateChanged()
	end

	if UI.ClanShip_FitSlotsWnd:IsChildOf( self ) then
		UI.ClanShip_FitSlotsWnd:OnShipBuildStateChanged()
	end

	if UI.ClanShip_FitPartsListWnd:IsChildOf( self ) then
		UI.ClanShip_FitPartsListWnd:OnShipBuildStateChanged()
	end

	if UI.ClanShip_GatherWnd:IsChildOf( self ) then
		UI.ClanShip_GatherWnd:OnShipBuildStateChanged()
	end

	if UI.ClanShip_TimerWnd:IsChildOf( self ) then
		UI.ClanShip_TimerWnd:OnShipBuildStateChanged()
	end

	if UI.ClanShip_PropsWnd:IsChildOf( self ) then
		UI.ClanShip_PropsWnd:OnShipBuildStateChanged()
	end

	self:UpdateGatherWndPos()

end


--
function UI.ClanShipWnd:OnOtherShipBuildStateChanged( shipName )

	if UI.ClanShip_StartBuildPartWnd:IsChildOf( self ) then
		UI.ClanShip_StartBuildPartWnd:OnOtherShipBuildStateChanged( shipName )
	end
	
	if UI.ClanShip_FitPartsListWnd:IsChildOf( self ) then
		UI.ClanShip_FitPartsListWnd:OnOtherShipBuildStateChanged( shipName )
	end
	
	if UI.ClanShip_ShipChoiceWnd:IsChildOf( self ) then
		UI.ClanShip_ShipChoiceWnd:OnOtherShipBuildStateChanged( shipName )
	end
	
end


--
function UI.ClanShipWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if wnd == UI.ClanShip_Gather_MoneySourceBtn then

		UI.ClanShip_GatherWnd:ToggleMoneySourceType()
		UI:PlayGlobalSound( self.sounds.moneySourceToggle )

	elseif wnd == UI.ClanShip_Gather_TransferBtn then

		if not UI.ClanShip_Gather_TransferBtn:IsGray() then

    		if not self:IsWaiting() then

    			local gatherMode = UI.ClanShip_GatherWnd:GetMode()

    			if gatherMode == UI.ClanShip_GatherWnd.modes.BUILD then

        			self:TransferMoney()
    				UI:PlayGlobalSound( self.sounds.transferMoney )

    			elseif gatherMode == UI.ClanShip_GatherWnd.modes.BUILD_BOOST then

        			self:BoostBuilding()
    				UI:PlayGlobalSound( self.sounds.transferMoney )

    			end

    		end

		end

	elseif wnd == UI.ClanShip_ShipChoice_ActionBtn then

		if not UI.ClanShip_ShipChoice_ActionBtn:IsGray() then

    		if not self:IsWaiting() then

    			local shipName = UI.ClanShip_ShipChoiceWnd:GetSelShipName()
    			self:TryStartBuildShip( shipName ) 

    		end

		end

	elseif wnd == UI.ClanShip_StartBuildPart_ActionBtn then
	
		if not UI.ClanShip_StartBuildPart_ActionBtn:IsGray() then

			if not self:IsWaiting() then			

				local partName = self:GetNextBasePartToBuild()

				self:StartBuild( self.shipName, partName, "" )
				UI:PlayGlobalSound( self.sounds.partBuild )

			end
			
		end

	elseif UI:IsWndKindOf( wnd, "ClanShip_ShipChoice_SlotWnd" ) then

		if wnd:GetRecordData().shipName ~= UI.ClanShip_ShipChoiceWnd:GetSelShipName() then

			UI.ClanShip_ShipChoiceWnd:SelectRecord( wnd:GetRecord() )
			UI:PlayGlobalSound( self.sounds.shipSelect )

		end

	elseif UI:IsWndKindOf( wnd, "ClanShip_FitSlotWnd" ) then

		if UI:IsRightsToBuildClanShip() then
			if not wnd:IsSelected() then

				self:SelectFitSlot( wnd:GetSlotName() )
				UI:PlayGlobalSound( self.sounds.fitSlotSelect )

			end
		end

	elseif wnd == UI.ClanShip_FitParts_CrossBtn then

		self:SelectFitSlot( "" )
		UI:PlayGlobalSound( self.sounds.fitPartsListHide )

	elseif UI:IsWndKindOf( wnd, "ClanShip_FitPart_BuildBtn" ) then

		if not wnd:IsGray() then

    		if not self:IsWaiting() then			

    			local partSlotWnd = wnd:GetParent()
    			local partName = partSlotWnd:GetRecordData().partName
    			local slotName = self:GetSelFitSlotName()

    			if self:StartBuild( self.shipName, partName, slotName ) then

	    			UI:PlayGlobalSound( self.sounds.partBuild )
				
					self:SelectFitSlot( "" )
					self.bForceShowGather = true

				end

    		end

		end

	elseif UI:IsWndKindOf( wnd, "ClanShip_FitPart_UnequipBtn" ) then

		if not self:IsWaiting() then

			local partSlotWnd = wnd:GetParent()
			local data = partSlotWnd:GetRecordData()

			local slotName = self:GetSelFitSlotName()

			self:EquipPart( "", slotName )
			UI:PlayGlobalSound( self.sounds.fitPartUnequip )

		end

	elseif UI:IsWndKindOf( wnd, "ClanShip_FitPart_UpgradeBtn" ) then

		if not wnd:IsGray() then

    		if not self:IsWaiting() then			

    			local partSlotWnd = wnd:GetParent()
    			local partName = partSlotWnd:GetRecordData().nextLevelPartName
    			local slotName = self:GetSelFitSlotName()

    			if self:StartBuild( self.shipName, partName, slotName ) then

	    			UI:PlayGlobalSound( self.sounds.partBuild )

					self:SelectFitSlot( "" )
					self.bForceShowGather = true

				end

    		end

		end

	elseif UI:IsWndKindOf( wnd, "ClanShip_FitPartSlotWnd" ) or UI:HasWndAncestorKindOf( wnd, "ClanShip_FitPartSlotWnd" ) then

		if not self:IsWaiting() then

			local partSlotWnd = nil

			if UI:IsWndKindOf( wnd, "ClanShip_FitPartSlotWnd" ) then
				partSlotWnd = wnd
			else
				partSlotWnd = UI:GetAncestorKindOf( wnd, "ClanShip_FitPartSlotWnd" )
			end

			local data = partSlotWnd:GetRecordData()

			if data.partState.bBuilt and not data.partState.bEquipped then

				local data = partSlotWnd:GetRecordData()

				local slotName = self:GetSelFitSlotName()
				local equipPartName = data.partName

				self:EquipPart( equipPartName, slotName )
				UI:PlayGlobalSound( self.sounds.fitPartEquip )

			end

		end

	elseif wnd == UI.ClanShip_PropsToggleBtn then

		self:TogglePropsWnd()

	elseif wnd == UI.ClanShip_GatherToggleBtn then

		if not UI.ClanShip_GatherToggleBtn:IsGray() then
			self:ToggleGatherWnd()
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end

	elseif wnd == UI.ClanShip_ToMapBtn then

		self:OpenMapWnd()
		
	elseif UI:IsWndKindOf( wnd, "ClanShip_ShipIconSlotWnd" ) then
	
		if not wnd:IsSelected() then
		
			local shipName = wnd:GetRecordData().shipName
			self:SelectShip( shipName )
			UI:PlayGlobalSound( UI.sounds.btnClick )
			
		end
		
	elseif wnd == UI.ClanShip_SetCurrentShipBtn then
		
		if not self:IsWaiting() then
			self.hMsgSetAsCurrent = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "clanShip_setAsCurrentConfirm" ), UI.MBS_YES_NO )
			UI:PlayGlobalSound( UI.sounds.btnClick )
		end
		
	elseif wnd == UI.ClanShip_ShipChoice_BackBtn then
		
		self:SelectShip( self.prevShipName )
		UI:PlayGlobalSound( UI.sounds.btnClick )
		
	end

	return true

end


--
function UI.ClanShipWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "ClanShip_ShipChoice_SlotWnd" ) then

		if not self:IsWaiting() then

			if UI:CanClanBuildClanShip() then

				local data = wnd:GetRecordData()
				self:TryStartBuildShip( data.shipName ) 

			else
				UI:MessageBox( UI:GetStringByName( "clanship_cantBuildClanshipTooltip_caption" ), UI:GetStringByName( "clanship_cantBuildClanshipTooltip_text" ), UI.MBS_OK )
			end

		end

	end

	return true

end


--
function UI.ClanShipWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if not self:IsOnScreen() then
		return
	end

	self:CheckHideFitPartsListOnMouseClick( btnIdx )

end 


--
function UI.ClanShipWnd:CheckHideFitPartsListOnMouseClick( btnIdx )

	if self:GetSelFitSlotName() == "" then
		return
	end

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )

	if not wndUnderMouse then
		return
	end

	-- может быть, например, если открыто "модальное" окно типа продажи или апгрейда, или контекстное меню
	if not ( wndUnderMouse == UI.HangarWnd or wndUnderMouse:IsChildOf( UI.HangarWnd ) ) then
		return
	end

	if wndUnderMouse == UI.ClanShip_FitPartsListWnd or wndUnderMouse:IsChildOf( UI.ClanShip_FitPartsListWnd ) then
		return
	end

	if UI:IsWndKindOf( wndUnderMouse, "ClanShip_FitSlotWnd" ) or UI:HasWndAncestorKindOf( wndUnderMouse, "ClanShip_FitSlotWnd" ) then

		-- левый клик на слоте корабля обрабатывается в F_OnMouseLButtonDown
		if btnIdx == 0 then
			return
		end

	end	

	self:SelectFitSlot( "" )

end


--
function UI.ClanShipWnd:TransferMoney()

	if self:IsWaiting() then
		sys.log( "UI.ClanShipWnd:TransferMoney()[ERROR]: still waiting for another request" )
	end

	local val = UI.ClanShip_GatherWnd:GetMoneyToTransfer()
	if val <= 0 then
		sys.log( "UI.ClanShipWnd:TransferMoney()[ERROR]: zero money to transfer" )
		return
	end

	local bSuccess = true
	local moneySourceType = UI.ClanShip_GatherWnd:GetMoneySourceType()

	if moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.PLAYER then

		self.playerMoneyTransferRequestId = _G.MasterServer_ClanBankTransfer( { [ _G.MasterServer.ClanTransferResource.CTR_IRIDIUM_FOR_CLANSHIP ] = val } )

		if self.playerMoneyTransferRequestId == 0 then
			self:ShowMsgOnTransferPlayerMoneyError( _G.MasterServer.ClanOpResult.CLR_ERROR )
			bSuccess = false
		end

	elseif moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.CLAN then

		self.clanMoneyTransferRequestId = _G.MasterServer_ClanResourceConvert( _G.MasterServer.ClanResource.CRES_IRIDIUM, _G.MasterServer.ClanResource.CRES_IRIDIUM_FOR_CLANSHIP, val )

		if self.clanMoneyTransferRequestId == 0 then
			self:ShowMsgOnTransferClanMoneyError( _G.MasterServer.ClanOpResult.CLR_ERROR )
			bSuccess = false
		end

	else
		sys.log( "UI.ClanShipWnd:TransferMoney()[ERROR]: unhandled source money type %s", tostring( moneySourceType ) )
		bSuccess = false
	end

	if bSuccess then
		UI.ClanShip_GatherWnd:ResetMoneyToTransfer()
	end

	self:UpdateWaitingEffect()

end


--
function UI.ClanShipWnd:BoostBuilding()

	if self:IsWaiting() then
		sys.log( "UI.ClanShipWnd:BoostBuilding()[ERROR]: still waiting for another request" )
	end

	local val = UI.ClanShip_GatherWnd:GetMoneyToTransfer()
	if val <= 0 then
		sys.log( "UI.ClanShipWnd:BoostBuilding()[ERROR]: zero money to transfer" )
		return
	end

	local bClanMoney = nil
	local moneySourceType = UI.ClanShip_GatherWnd:GetMoneySourceType()

	if moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.PLAYER then
		bClanMoney = false

	elseif moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.CLAN then
		bClanMoney = true

	else
		sys.log( "UI.ClanShipWnd:BoostBuilding()[ERROR]: unhandled source money type %s", tostring( moneySourceType ) )
	end

	if bClanMoney == nil then
		return
	end

	self.boostBuildingRequestId = _G.MasterServer_ClanShipBoostBuilding( self.shipName, val, bClanMoney )
	self.bWaitingClanShipData = true

	if self.boostBuildingRequestId ~= 0 then
		UI.ClanShip_GatherWnd:ResetMoneyToTransfer()
	else
		self:ShowMsgOnBoostBuildingError( _G.MasterServer.ClanOpResult.CLR_ERROR )
		self.bWaitingClanShipData = false
	end

	self:UpdateWaitingEffect()

end


--
function UI.ClanShipWnd:TryStartBuildShip( shipName )

	if type( shipName ) ~= "string" or shipName == "" then
		sys.log( "UI.ClanShipWnd:TryStartBuildShip()[ERROR]: invalid ship name" )
		return
	end

	if self.state ~= self.states.NO_SHIP and self.state ~= self.states.BUILD_NONE then
		sys.log( "UI.ClanShipWnd:TryStartBuildShip()[ERROR]: invalid state %s", tostring( self.state ) )
		return
	end

	if self:IsWaiting() then
		return
	end

	local strBaseColor	= UI:Color2Str( UI.TEXT_BASE_COLOR )
	local strSelColor	= UI:Color2Str( UI.TEXT_SEL_COLOR )

	local localizedShipName = UI:ClanShip2Str( shipName )
	localizedShipName = string.format( "%s%s%s", strSelColor, localizedShipName, strBaseColor )

	local msg = UI:GetStringByName( "clanShip_buildShipConfirm" )

	local numSubst = 0
	msg, numSubst = string.gsub( msg, "%$ship%$", localizedShipName )

	if numSubst == 0 then
		sys.log( "UI.ClanShipWnd:TryStartBuildShip()[ERROR]: cannot find placeholder \"$ship$\" in string \"msg_startBuildClanShip_text\"" )
	end

	self.shipNameToBuild = shipName

	self.hMsgBuildShip = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), msg, UI.MBS_YES_NO )

end


--
function UI.ClanShipWnd:DoStartBuildShip( shipName )

	if type( shipName ) ~= "string" or shipName == "" then
		sys.log( "UI.ClanShipWnd:DoStartBuildShip()[ERROR]: invalid ship name" )
		return
	end

	local partName = UI:ClanShipBasePartIdx2Name( shipName, 1 )
	if partName == "" then
		sys.log( "UI.ClanShipWnd:DoStartBuildShip()[ERROR]: cannot find first base part for ship \"%s\"", shipName )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.ClanShipWnd:DoStartBuildShip()[ERROR]: waiting for another request" )
	end

	self:StartBuild( shipName, partName, "" )

end         


--
function UI.ClanShipWnd:StartBuild( shipName, partName, slotName )

	if type( shipName ) ~= "string" or shipName == "" then
		sys.log( "UI.ClanShipWnd:StartBuild()[ERROR]: invalid ship name" )
		return false
	end

	if type( partName ) ~= "string" or partName == "" then
		sys.log( "UI.ClanShipWnd:StartBuild()[ERROR]: invalid part name" )
		return false
	end

	if slotName ~= nil then
    	if type( slotName ) ~= "string"  then
    		sys.log( "UI.ClanShipWnd:StartBuild()[ERROR]: invalid slot name" )
    		return false
    	end
	else
		slotName = ""
	end

	if self:IsWaiting() then
		sys.log( "UI.ClanShipWnd:StartBuild()[ERROR]: waiting for another request" )
	end

	self.buildRequestId = _G.MasterServer_ClanShipBuild( shipName, partName, slotName )
	self.bWaitingClanShipData = true

	if self.buildRequestId == 0 then
		self:ShowMsgOnBuildError( _G.MasterServer.ClanOpResult.CLR_ERROR )
		self.bWaitingClanShipData = false
	end

	self:UpdateWaitingEffect()

    return self.buildRequestId ~= 0

end


--
function UI.ClanShipWnd:EquipPart( partName, slotName )

	if type( partName ) ~= "string" then
		sys.log( "UI.ClanShipWnd:EquipPart()[ERROR]: invalid part name" )
		return
	end

	if type( slotName ) ~= "string" or slotName == "" then
		sys.log( "UI.ClanShipWnd:EquipPart()[ERROR]: invalid slot name" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.ClanShipWnd:EquipPart()[ERROR]: waiting for another request" )
	end

	self.fitRequestId = _G.MasterServer_ClanShipFit( self.shipName, { [ slotName ] =  partName } )
	self.bWaitingClanShipData = true

	if self.fitRequestId == 0 then
		self:ShowMsgOnFitError( _G.MasterServer.ClanOpResult.CLR_ERROR )
		self.bWaitingClanShipData = false
	end

	self:UpdateWaitingEffect()

end


--
function UI.ClanShipWnd:ShowMsgOnTransferPlayerMoneyError( result )

	UI:ShowErrorMsg( "clans_error_cant_exchange_resource", result, "_G.MasterServer.ClanOpResult" )

end


--
function UI.ClanShipWnd:ShowMsgOnTransferClanMoneyError( result )

	self:ShowMsgOnTransferPlayerMoneyError( result )

end


--
function UI.ClanShipWnd:ShowMsgOnBuildError( result )

	UI:ShowErrorMsg( "msg_buildClanShipError", result, "_G.MasterServer.ClanOpResult" )

end


--
function UI.ClanShipWnd:ShowMsgOnFitError( result )

	UI:ShowErrorMsg( "msg_fitClanShipError", result, "_G.MasterServer.ClanOpResult" )

end


--
function UI.ClanShipWnd:ShowMsgOnBoostBuildingError( result )

	UI:ShowErrorMsg( "clanShip_failBoostBuild", result, "_G.MasterServer.ClanOpResult" )

end


--
function UI.ClanShipWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.ClanShipWnd:IsWaiting()

	return
		self.playerMoneyTransferRequestId ~= 0 or
		self.clanMoneyTransferRequestId ~= 0 or
		self.buildRequestId ~= 0 or
		self.fitRequestId ~= 0 or
		self.bWaitingClanShipData or
		self.boostBuildingRequestId ~= 0 or
		self.changeCurrentClanShipRequestId ~= 0
		
end


--
function UI.ClanShipWnd:F_OnEventSaveUiState()

	UI.store.ClanShipWnd =
	{
		shipName						= self.shipName,
		playerMoneyTransferRequestId	= self.playerMoneyTransferRequestId,
		clanMoneyTransferRequestId		= self.clanMoneyTransferRequestId,
		buildRequestId					= self.buildRequestId,
		fitRequestId					= self.fitRequestId,
		bWaitingClanShipData			= self.bWaitingClanShipData,
		boostBuildingRequestId			= self.boostBuildingRequestId,
		changeCurrentClanShipRequestId	= self.changeCurrentClanShipRequestId,
		prevShipName					= self.prevShipName,
	}

end


--
function UI.ClanShipWnd:F_OnEventRestoreUiState()

	if UI.store.ClanShipWnd then

		self.playerMoneyTransferRequestId	= UI.store.ClanShipWnd.playerMoneyTransferRequestId
		self.clanMoneyTransferRequestId		= UI.store.ClanShipWnd.clanMoneyTransferRequestId
		self.buildRequestId					= UI.store.ClanShipWnd.buildRequestId
		self.fitRequestId       			= UI.store.ClanShipWnd.fitRequestId
		self.bWaitingClanShipData			= UI.store.ClanShipWnd.bWaitingClanShipData
		self.boostBuildingRequestId			= UI.store.ClanShipWnd.boostBuildingRequestId
		self.changeCurrentClanShipRequestId	= UI.store.ClanShipWnd.changeCurrentClanShipRequestId
		self.prevShipName					= UI.store.ClanShipWnd.prevShipName

		self:UpdateWaitingEffect()
		
		if UI.store.ClanShipWnd.shipName ~= "" then
			self.shipNameToSet = UI.store.ClanShipWnd.shipName
			if self:IsOnScreen() then
				self:FullUpdate()
			end
		end

		UI.store.ClanShipWnd = nil

	end

end


--
function UI.ClanShipWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgBuildShip then

		self.hMsgBuildShip = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if self.shipNameToBuild then

    			self:DoStartBuildShip( self.shipNameToBuild )
				UI:PlayGlobalSound( self.sounds.shipBuild )

			else
				sys.log( "UI.ClanShipWnd:F_OnEventMsgBoxRet()[ERROR]: no build data" )
			end

		end

    	self.shipNameToBuild = nil
		
	elseif boxHandle == self.hMsgSetAsCurrent then

		self.hMsgSetAsCurrent = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:SetSelShipAsCurrent()
		end

	end

end  


--
function UI.ClanShipWnd:GetNextBasePartToBuild()

	local nextPartName = ""

	local numBuiltParts	= UI:GetClanShipNumBuiltBaseParts( self.shipName )
	local maxParts		= UI:GetClanShipMaxBaseParts( self.shipName )

	local nextPartIdx = -1

	if numBuiltParts < maxParts then
		nextPartIdx = numBuiltParts + 1		
	end                  		

	if nextPartIdx ~= -1 then
		nextPartName = UI:ClanShipBasePartIdx2Name( self.shipName, nextPartIdx )
	end

	return nextPartName

end


--
function UI.ClanShipWnd:SelectFitSlot( slotName )

	if not UI.ClanShip_FitSlotsWnd:IsChildOf( self ) then
		sys.log( "UI.ClanShipWnd:SelectFitSlot()[ERROR]: fit slots are not on screen" )
		return
	end

	UI.ClanShip_FitSlotsWnd:SelectSlot( slotName )

end


--
function UI.ClanShipWnd:GetSelFitSlotName()

	if UI.ClanShip_FitSlotsWnd:IsChildOf( self ) then
		return UI.ClanShip_FitSlotsWnd:GetSelSlotName()
	else
		return ""
	end

end


--
function UI.ClanShipWnd:UpdateFitPartsList()

	local selSlotName = self:GetSelFitSlotName()

	if selSlotName ~= "" then

		self:AddChild( UI.ClanShip_FitPartsListWnd )
		UI.ClanShip_FitPartsListWnd:Setup( selSlotName )

		-- позиция (приоритетная: X - как у слота, Y - над слотом)

		local pos = UI:ZeroVec2()

    	local slotWnd = UI.ClanShip_FitSlotsWnd:GetSlotWndByName( selSlotName )  
    	if slotWnd then

	    	local slotRect	= self:ToWindow( UI.ClanShip_FitSlotsWnd:ToScreen( slotWnd:GetRect() ) )
			local listRect	= UI.ClanShip_FitPartsListWnd:GetRect()
			local selfRect	= self:GetRect()

			local resolution = { x = 1280, y = 720 }
			local spaceY = UI:YTo1024x768( self.FIT_PARTS_SPACE_Y, resolution )
			
			pos.x = slotRect.x
			pos.y = slotRect.y - spaceY - listRect.w

			pos.x = UI:Clamp( pos.x, 0, selfRect.z - listRect.z )
			pos.y = UI:Clamp( pos.y, 0, selfRect.w - listRect.w )

			pos.x = UI:XRel2Snapped( pos.x )
			pos.y = UI:YRel2Snapped( pos.y )

    	end

		UI.ClanShip_FitPartsListWnd:SetPos( pos.x, pos.y )

	else
		UI.ClanShip_FitPartsListWnd:UnlinkFromParent()
	end	

end


--
function UI.ClanShipWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ClanShipWnd:UpdateZOrder()

	if UI.ClanShip_GatherWnd.w and UI.ClanShip_GatherWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ClanShip_GatherWnd )
	end

	if UI.ClanShip_TimerWnd.w and UI.ClanShip_TimerWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ClanShip_TimerWnd )
	end

	if UI.ClanShip_PropsWnd.w and UI.ClanShip_PropsWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ClanShip_PropsWnd )
	end

	if UI.ClanShip_FitPartsListWnd.w and UI.ClanShip_FitPartsListWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ClanShip_FitPartsListWnd )
	end

end


--
function UI.ClanShipWnd:UpdateInDockState( bUpdateControls )

	local bInDock = self.shipName ~= "" and UI:IsClanShipInDock( self.shipName ) 

	if bInDock == self.bInDock then
		return
	end

	self.bInDock = bInDock

	if bUpdateControls then

		self:UpdateBg()
		self:UpdateControlsVisibility()

	end

end


--
function UI.ClanShipWnd:TogglePropsWnd()

	if not UI.ClanShip_PropsToggleBtn:IsChildOf( self ) then
		sys.log( "UI.ClanShipWnd:TogglePropsWnd()[ERROR]: toggle button is not on screen" )
		return
	end

	if UI.ClanShip_PropsWnd:IsChildOf( self ) then
		self:RemoveControl( UI.ClanShip_PropsWnd, self.layers.MAIN_EFFECT )		
	else
		self:AddControl( UI.ClanShip_PropsWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.propsLocator )
	end

	self:UpdatePropsToggleBtnState()

end


--
function UI.ClanShipWnd:UpdatePropsToggleBtnState()

	if not UI.ClanShip_PropsToggleBtn:IsChildOf( self ) then
		return
	end

	local bCheck = UI.ClanShip_PropsWnd:IsChildOf( self )
	UI.ClanShip_PropsToggleBtn:Check( bCheck )

end


--
function UI.ClanShipWnd:ToggleGatherWnd()

	if not UI.ClanShip_TimerWnd:IsChildOf( self ) or not UI.ClanShip_TimerWnd:HasGatherToggleBtn() then
		sys.log( "UI.ClanShipWnd:ToggleGatherWnd()[ERROR]: toggle button is not on screen" )
		return
	end

	if UI.ClanShip_GatherWnd:IsChildOf( self ) then
		self:RemoveControl( UI.ClanShip_GatherWnd, self.layers.MAIN_EFFECT )		
	else
		local locator = UI.ClanShip_TimerWnd:HasTime() and self.effectInfo.main.gatherLocator_isTime or self.effectInfo.main.gatherLocator_noTime
		self:AddControl( UI.ClanShip_GatherWnd, self.layers.MAIN_EFFECT, locator )
	end

	self:UpdateGatherToggleBtn()

end


--
function UI.ClanShipWnd:UpdateGatherToggleBtn()

	if not UI.ClanShip_TimerWnd:IsChildOf( self ) then
		return
	end

	UI.ClanShip_TimerWnd:UpdateGatherToggleBtn()

end


--
function UI.ClanShipWnd:OpenMapWnd()

	local zoneId = UI:GetClanShipZone( self.shipName )
	if zoneId ~= -1 then

    	UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.FREE_SPACE_MAP, true, false, nil )

    	if UI.GameplayPveMapWnd:IsOnScreen() then
    		UI.GameplayPveMapWnd:TryToOpenBFSForZone( zoneId )
    	else
    		sys.log( "UI.ClanShipWnd:OpenMapWnd()[ERROR]: cannot open map wnd right now" )
    	end	

	else
		sys.log( "UI.ClanShipWnd:OpenMapWnd()[ERROR]: cannot open map; invalid zone" )
	end

end


--
function UI.ClanShipWnd:OnCurrentShipChanged()
	
	self:UpdateControlsVisibility()
	
	if UI.ClanShip_ShipIconListWnd:IsChildOf( self ) then
		UI.ClanShip_ShipIconListWnd:OnCurrentShipChanged()
	end
	
end


--
function UI.ClanShipWnd:SetSelShipAsCurrent()
	
	if self.state ~= self.states.BUILD_FIT then
		sys.log( "UI.ClanShipWnd:SetSelShipAsCurrent()[ERROR]: invalid state %s", tostring( self.state ) )
		return
	end
	
	if self.shipName == UI:GetCurrentClanShipName() then
		sys.log( "UI.ClanShipWnd:SetSelShipAsCurrent()[ERROR]: already current" )
		return
	end
	
	if self:IsWaiting() then
		sys.log( "UI.ClanShipWnd:SetSelShipAsCurrent()[ERROR]: is waiting for another request" )
		return
	end
	
	self.changeCurrentClanShipRequestId	= _G.MasterServer_ClanShipSetCurrent( self.shipName )
	
	if type( self.changeCurrentClanShipRequestId ) ~= "number" then
		self.changeCurrentClanShipRequestId = 0
	end
	
	if self.changeCurrentClanShipRequestId == 0 then
		self:ShowMsgOnSetCurrentError( _G.MasterServer.ClanOpResult.CLR_ERROR )
	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.ClanShipWnd:ShowMsgOnSetCurrentError( result )
	
	UI:ShowErrorMsg( "clanShip_setCurrentShipError", result, "_G.MasterServer.ClanOpResult" )
	
end


-- -------------------------------------------------------------------
-- UI.ClanShip_ShipChoiceWnd
-- -------------------------------------------------------------------

UI.ClanShip_ShipChoiceWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_ShipChoiceWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ClanShip_ShipChoiceWnd",
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			visible		= false,	-- чтобы скрыть неактуальный серый фон

			effects =
			{{
				defName 			= "clanShip_shipChoice_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title23",
						layer		= "UI.ClanShip_ShipChoiceWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "start_btn",
						wnd			= "UI.ClanShip_ShipChoice_ActionBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn_40",
						wnd			= "UI.ClanShip_ShipChoice_BackBtn",
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
    		text			= UI:GetStringByName( "clanShip_shipCloice_caption" ),
		},  
	},

	children = { "UI.ClanShip_ShipChoice_ActionBtn", "UI.ClanShip_ShipChoice_BackBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_ShipChoiceWnd:GetSelShipName()

	local selRecordIdx = self:GetSelectedRecord()
	if selRecordIdx ~= -1 then

		local data = self:GetRecordData( selRecordIdx )
		return data.shipName

	end

	return ""

end


--
function UI.ClanShip_ShipChoiceWnd:OnClanNewHighRank()

	self:UpdateActionBtnState()

end


--
function UI.ClanShip_ShipChoiceWnd:OnOtherShipBuildStateChanged( shipName )

	self:UpdateActionBtnState()
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_ShipChoiceWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.ClanShip_ShipChoiceWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ClanShip_ShipChoiceWnd.btnPrototypeName	= "ClanShip_ShipChoice_SlotWnd"
UI.ClanShip_ShipChoiceWnd.MAX_SLOTS			= 3
UI.ClanShip_ShipChoiceWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_ShipChoiceWnd:F_PostLoad()    

	UI.ButtonsListWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )

end


--
function UI.ClanShip_ShipChoiceWnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	UI.ClanShip_ShipChoice_ActionBtn:SetGray( true )
	UI.ClanShip_ShipChoice_ActionBtn:SetTooltipData( nil )
	
	UI.ClanShip_ShipChoice_BackBtn:UnlinkFromParent()

end


--
function UI.ClanShip_ShipChoiceWnd:FullUpdate()

	self:Clear()

	self:UpdateSlots()
	self:UpdateActionBtnState()
	self:SetDefaultSelection()
	self:UpdateBackBtn()

end


--
function UI.ClanShip_ShipChoiceWnd:UpdateSlots()
	
	local state = UI.ClanShipWnd:GetState()
	
	if state == UI.ClanShipWnd.states.BUILD_NONE then
		self:AddRecord( { shipName = UI.ClanShipWnd:GetShipName() } )
	else
		local shipNames = UI:GetAllClanShipNames()
		for idx, shipName in ipairs( shipNames ) do
			self:AddRecord( { shipName = shipName } )
		end
	end
	
	self:RecalcLayout()

end


--
function UI.ClanShip_ShipChoiceWnd:UpdateActionBtnState()

	local bEnoughHighRanks = UI:CanClanBuildClanShip()	-- проверяется поле в данных клана, которое зависит от сивара clan_shipBuildHighRanks ("number of high-rank clan members required for clan ship building")
	local bIsShipBuilding = UI:GetClanShipBuildingOrGatheringMoney() ~= "" -- нельзя строить одновременно несколько #0104977(0488106)

	local bEnable = self:GetSelectedRecord() ~= -1 and bEnoughHighRanks and not bIsShipBuilding
	UI.ClanShip_ShipChoice_ActionBtn:SetGray( not bEnable )

	local tooltipData = nil

	if not bEnoughHighRanks then

		tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "clanship_cantBuildClanshipTooltip_caption" ),
			text		= UI:GetStringByName( "clanship_cantBuildClanshipTooltip_text" ),
		}
		
	elseif bIsShipBuilding then
		tooltipData = UI.ClanShipWnd:GetTooltipData_CantBuildMultiple()
	end

	UI.ClanShip_ShipChoice_ActionBtn:SetTooltipData( tooltipData )

end


--
function UI.ClanShip_ShipChoiceWnd:UpdateBackBtn()

	local bNeedBtn = UI.ClanShipWnd:GetState() == UI.ClanShipWnd.states.BUILD_NONE
	if bNeedBtn then
		self:AddChild( UI.ClanShip_ShipChoice_BackBtn )
	else
		UI.ClanShip_ShipChoice_BackBtn:UnlinkFromParent()
	end

end


--
function UI.ClanShip_ShipChoiceWnd:RecalcLayout()
	
	-- если один слот (в режиме UI.ClanShipWnd.states.BBUILD_NONE), то он рисуется посередине
	
	if self:GetNumRecords() == 1 then 
	
		local slotWnd = self:GetButtonForRecord( 1 )
		if slotWnd then
		
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			if mainEffect then
				mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
			end
		
			local x = ( self:GetWidth() - slotWnd:GetWidth() ) / 2
			slotWnd:SetLeft( x )
		
		end
	
	end
	
end


--
function UI.ClanShip_ShipChoiceWnd:SetDefaultSelection()

	-- если один слот (в режиме UI.ClanShipWnd.states.BBUILD_NONE), то он по умолчанию выбран (иначе кнопка действия не будет активна)

	local selRecordIdx = -1
	
	if self:GetNumRecords() == 1 then
		selRecordIdx = 1
	end
	
	self:SelectRecord( selRecordIdx )

end


--
function UI.ClanShip_ShipChoiceWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ClanShip_ShipChoiceWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == self:GetUiHandle() then
		self:OnSelSlotChanged()
	end

end


--
function UI.ClanShip_ShipChoiceWnd:OnSelSlotChanged()

	self:UpdateActionBtnState()

end


-- -------------------------------------------------------------------
-- UI.ClanShip_ShipChoice_SlotWnd
-- -------------------------------------------------------------------

UI.ClanShip_ShipChoice_SlotWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_ShipChoice_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ClanShip_ShipChoice_SlotWnd",
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
				defName 			= "clanShip_shipChoice_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title26",
						layer		= "UI.ClanShip_ShipChoice_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",
						layer		= "UI.ClanShip_ShipChoice_SlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.ClanShip_ShipChoice_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sel",
						layer		= "UI.ClanShip_ShipChoice_SlotWnd.layers.SEL_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 10, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "clanShip_shipChoice_slot_sel",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "clanShip_shipChoice_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_ShipChoice_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.DESC )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.ClanShip_ShipChoice_SlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	self:UpdateSelection()

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_ShipChoice_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
    DESC				= 2,
	SEL_EFFECT			= 3,
    MOUSE_OVER_EFFECT	= 4,
}

UI.ClanShip_ShipChoice_SlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico10",
	}
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_ShipChoice_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateName( data )
	self:UpdateDesc( data )
	self:UpdateIco( data )
	self:UpdateSelection()

end


--
function UI.ClanShip_ShipChoice_SlotWnd:UpdateSelection()

	self:SetLayerVisible( self:IsSelected(), self.layers.SEL_EFFECT )

end


--
function UI.ClanShip_ShipChoice_SlotWnd:UpdateName( data )

	local str = UI:ClanShip2Str( data.shipName )
	self:SetText( str, self.layers.NAME )

end


--
function UI.ClanShip_ShipChoice_SlotWnd:UpdateDesc( data )

	local str = UI:GetClanShipDesc( data.shipName )
	self:SetText( str, self.layers.DESC )

end


--
function UI.ClanShip_ShipChoice_SlotWnd:UpdateIco( data )

	local hTex = UI:GetClanShipIco( data.shipName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.ClanShip_ShipChoice_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ClanShip_ShipChoice_SlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ClanShip_ShipChoice_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ClanShipWnd.sounds.shipMouseOver )
	end

end


--
function UI.ClanShip_ShipChoice_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ClanShip_ShipChoice_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end

-- -------------------------------------------------------------------
-- UI.ClanShip_ShipChoice_ActionBtn
-- -------------------------------------------------------------------

UI.ClanShip_ShipChoice_ActionBtn = {}

-- ------------------------------
-- window definition 
-- ------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.ClanShip_ShipChoice_ActionBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "ClanShip_ShipChoice_ActionBtn",
	},

	layers =
	{
		numLayers = l_numBaseBtnLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "clanShip_shipChoice_actionBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "start",
						layer		= "UI.ClanShip_ShipChoice_ActionBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= l_numBaseBtnLayers,

			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanShip_shipCloice_btn" ),
		},  
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_ShipChoice_ActionBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.ClanShip_ShipChoice_ActionBtn:GetTooltipData( tooltipData )

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_ShipChoice_ActionBtn.layers =
{
    MAIN_EFFECT	= 0,
	DEBUG		= 1,
    TEXT		= 2,
}

UI.ClanShip_ShipChoice_ActionBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "disable",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_ShipChoice_ActionBtn.tooltipData = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_ShipChoice_ActionBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if UI.EffectButtonWnd.F_OnMouseIn then
		UI.EffectButtonWnd.F_OnMouseIn( self, mouseX, mouseY, wndThatReceivedInput )
	else
		self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	end

	if self:IsEnabled() and not self:IsGray() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

	return true

end


-- -------------------------------------------------------------------
-- UI.ClanShip_ShipChoice_BackBtn
-- -------------------------------------------------------------------

UI.ClanShip_ShipChoice_BackBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn4",
		
		props =
		{
			name	= "ClanShip_ShipChoice_BackBtn"
		}
	},
	
	textId = "clanShip_shipChoice_backBtn"
}

-- -------------------------------------------------------------------
-- UI.ClanShip_NoShipWnd
-- -------------------------------------------------------------------

UI.ClanShip_NoShipWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_NoShipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ClanShip_NoShipWnd",
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
				defName 			= "clanShip_noShip",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self134",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title24",
						layer		= "UI.ClanShip_NoShipWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title25",
						layer		= "UI.ClanShip_NoShipWnd.layers.TEXT",
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
			text			= UI:GetStringByName( "clanShip_noShip_caption" ),
		},  

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanShip_noShip_text" ),
		},  
	}
}

-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_NoShipWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    TEXT		= 2,
}

-- -------------------------------------------------------------------
-- UI.ClanShip_GatherProgressWnd
-- -------------------------------------------------------------------

UI.ClanShip_GatherProgressWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_GatherProgressWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ClanShip_GatherProgressWnd",
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
				defName 			= "clanShip_gatherProgress",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.ClanShip_GatherProgressWnd.layers.CAPTION",
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
		},  
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_GatherProgressWnd:OnShipBuildStateChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateBuildingPart()
	self:UpdateCaption()
	self:UpdateSegmentsProgress()

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_GatherProgressWnd.layers =
{
	MAIN_EFFECT = 0,
	CAPTION		= 1,
}

UI.ClanShip_GatherProgressWnd.effectInfo =
{
	main =
	{
		segmentLocatorPrefix	= "progr_"
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_GatherProgressWnd.allSegments 		= {}
UI.ClanShip_GatherProgressWnd.segments			= {}
UI.ClanShip_GatherProgressWnd.segmentsCenterX	= 0
UI.ClanShip_GatherProgressWnd.segmentsY			= 0
UI.ClanShip_GatherProgressWnd.space_segments	= 0
UI.ClanShip_GatherProgressWnd.segmentWidth		= 0
UI.ClanShip_GatherProgressWnd.buildingPartIdx	= -1
UI.ClanShip_GatherProgressWnd.buildingTimeMax	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_GatherProgressWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitSegments()

	self:PrepareLayout()

end


--
function UI.ClanShip_GatherProgressWnd:InitSegments()

	for idx = 1, 7 do
		self:CreateSegment()
	end

end


--
function UI.ClanShip_GatherProgressWnd:CreateSegment()

	local segmentWnd = UI:CreateChildWnd( self, UI.ClanShip_GatherProgress_SegmentWnd, tostring( #self.allSegments + 1 ) )
	table.insert( self.allSegments, segmentWnd )

	return segmentWnd

end


--
function UI.ClanShip_GatherProgressWnd:AddSegment()

	local segmentWnd = nil

	for idx, wnd in pairs( self.allSegments ) do
		if not wnd:IsChildOf( self ) then
			segmentWnd = wnd
			break
		end
	end

	if not segmentWnd then
		segmentWnd = self:CreateSegment()
	end

	if segmentWnd then
		table.insert( self.segments, segmentWnd )
		self:AddChild( segmentWnd )
	end

	return segmentWnd

end


--
function UI.ClanShip_GatherProgressWnd:ResetSegments()

	for idx, segmentWnd in pairs( self.segments ) do
		segmentWnd:Reset()
		segmentWnd:UnlinkFromParent()
	end

	self.segments = {}

end


--
function UI.ClanShip_GatherProgressWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ClanShip_GatherProgressWnd:Reset()

	self.buildingPartIdx	= -1
	self.buildingTimeMax	= 0

	self:SetText( "", self.layers.CAPTION )
	self:ResetSegments()

end


--
function UI.ClanShip_GatherProgressWnd:FullUpdate()

	self:Reset()

	self:UpdateBuildingPart()
	self:UpdateCaption()
	self:UpdateSegments()

end


--
function UI.ClanShip_GatherProgressWnd:UpdateBuildingPart()

	self.buildingPartIdx	= -1
	self.buildingTimeMax	= 0

	local shipName = UI.ClanShipWnd:GetShipName()
	local buildingPartName = UI:GetClanShipBuildingPartName( shipName )

	if buildingPartName ~= "" then

		self.buildingPartIdx	= UI:ClanShipBasePartName2Idx( shipName, buildingPartName )
		self.buildingTimeMax	= UI:GetClanShipPartBuildingTime( buildingPartName )

	end

end


--
function UI.ClanShip_GatherProgressWnd:UpdateCaption()

	local str = ""

	local shipName = UI.ClanShipWnd:GetShipName()
	local partName = ""

	if UI:IsClanShipGatheringMoney( shipName ) then
		partName = UI:GetClanShipGatheringMoneyPartName( shipName )

	elseif UI:IsClanShipBuilding( shipName ) then
		partName = UI:GetClanShipBuildingPartName( shipName )

	else
		local numBuiltParts = UI:GetClanShipNumBuiltBaseParts( shipName )
		if numBuiltParts > 0 then
			partName = UI:ClanShipBasePartIdx2Name( shipName, numBuiltParts )
		end
	end	

	if partName ~= "" then

		local strId = string.format( "clanShip_gatherProgress_%s", partName )
		str = UI:GetStringByName( strId )

	else
		sys.log( "UI.ClanShip_GatherProgressWnd:UpdateCaption()[ERROR]: cannot find part name" )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ClanShip_GatherProgressWnd:UpdateSegments()

	self:ResetSegments()

	local shipName 		= UI.ClanShipWnd:GetShipName()
	local maxSegments	= UI:GetClanShipMaxBaseParts( shipName )

	for segmentIdx = 1, maxSegments do
		self:AddSegment()
	end	

	self:RecalcLayout()

	self:UpdateSegmentsProgress()

end


--
function UI.ClanShip_GatherProgressWnd:UpdateSegmentsProgress()

	local shipName		= UI.ClanShipWnd:GetShipName()
	local numBuiltParts	= UI:GetClanShipNumBuiltBaseParts( shipName )

	for segmentIdx, segmentWnd in pairs( self.segments ) do

		if segmentIdx ~= self.buildingPartIdx then

			local progress = segmentIdx <= numBuiltParts and 1 or 0
			segmentWnd:SetProgress( progress )

		end

	end

	self:UpdateBuildingSegmentProgress()

end


--
function UI.ClanShip_GatherProgressWnd:UpdateBuildingSegmentProgress()

	if self.buildingPartIdx == -1 then
		return
	end

	local segmentWnd = self.segments[ self.buildingPartIdx ]
	if segmentWnd then

		local timeLeft = UI:GetClanShipBuildingTimeLeft( UI.ClanShipWnd:GetShipName() )

		local progress = self.buildingTimeMax ~= 0 and 1 - timeLeft / self.buildingTimeMax or 1
		progress = UI:Clamp( progress, 0, 1 )

		segmentWnd:SetProgress( progress )

	end

end


--
function UI.ClanShip_GatherProgressWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateBuildingSegmentProgress()

end


--
function UI.ClanShip_GatherProgressWnd:PrepareLayout()

	local NUM_SEGMENTS_IN_EFFECT = 7

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	

	local firstSegmentPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.segmentLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSegmentPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.segmentLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local lastSegmentPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.segmentLocatorPrefix, NUM_SEGMENTS_IN_EFFECT ) ) or Vec2( 0, 0 )

	local segmentWnd	= self.allSegments[ 1 ]
	local segmentWidth	= segmentWnd and segmentWnd:GetWidth() or 0

    self.segmentsCenterX	= ( ( lastSegmentPos.x + segmentWidth ) - firstSegmentPos.x ) * 0.5 + firstSegmentPos.x
    self.segmentsY			= firstSegmentPos.y
    self.space_segments		= secondSegmentPos.x - ( firstSegmentPos.x + segmentWidth )
    self.segmentWidth		= segmentWidth

end


--
function UI.ClanShip_GatherProgressWnd:RecalcLayout()

	local numSegments = #self.segments
	if numSegments == 0 then
		return
	end

	local segmentsWidth	= numSegments * self.segmentWidth + ( numSegments - 1 ) * self.space_segments
	local segmentsX		= self.segmentsCenterX - segmentsWidth * 0.5

	for segmentIdx, segmentWnd in pairs( self.segments ) do

		local x = segmentsX + ( segmentIdx - 1 ) * ( self.segmentWidth + self.space_segments )
		x = UI:XRel2Snapped( x )

		segmentWnd:SetPos( x, self.segmentsY )

	end

end


-- -------------------------------------------------------------------
-- UI.ClanShip_GatherProgress_SegmentWnd
-- -------------------------------------------------------------------

UI.ClanShip_GatherProgress_SegmentWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_GatherProgress_SegmentWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ClanShip_GatherProgress_SegmentWnd",
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
			updatable	= false,

			effects =
			{{
				defName 			= "clanShip_gatherProgress_segment",
				defaultAnimation	= "idle_1",

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
-- interface functions
-- ------------------------------

--
function UI.ClanShip_GatherProgress_SegmentWnd:SetProgress( val )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then

		mainEffect:SetAnimationTime( 1 - UI:Clamp( val, 0, 1 ) )
		mainEffect:Update( 0 )	

	end

end


--
function UI.ClanShip_GatherProgress_SegmentWnd:Reset()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then

		mainEffect:SetAnimationTime( 1 )
		mainEffect:Update( 0 )	

	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_GatherProgress_SegmentWnd.layers =
{
	MAIN_EFFECT = 0
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_GatherProgress_SegmentWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.ClanShip_GatherProgress_SegmentWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanShip_GatherProgress_SegmentWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- -------------------------------------------------------------------
-- UI.ClanShip_TimerWnd
-- -------------------------------------------------------------------

UI.ClanShip_TimerWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_TimerWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ClanShip_TimerWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "clanShip_timer",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self131",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text16",
						layer		= "UI.ClanShip_TimerWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},     

					{
						objName		= "t_1",
						layer		= "UI.ClanShip_TimerWnd.layers.TIME",
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
		},  

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children = { "UI.ClanShip_GatherToggleBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_TimerWnd:OnShipBuildStateChanged()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.ClanShip_TimerWnd:HasGatherToggleBtn()

	return UI.ClanShip_GatherToggleBtn:IsChildOf( self )

end


--
function UI.ClanShip_TimerWnd:HasTime()

	return self:IsLayerVisible( self.layers.TIME ) 

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_TimerWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    TIME		= 2,
}

UI.ClanShip_TimerWnd.modes =
{
	BUILD			= 1,
	GATHER_MONEY	= 2,
}

UI.ClanShip_TimerWnd.effectInfo =
{
	main =
	{
		gatherToggleBtnLocator_isTime	= "button_2",
		gatherToggleBtnLocator_noTime	= "button_3",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_TimerWnd.timeLeft	= -1
UI.ClanShip_TimerWnd.mode		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_TimerWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ClanShip_TimerWnd:Reset()

	self:SetText( "", self.layers.CAPTION )

	self:SetText( "", self.layers.TIME )
	self:SetLayerVisible( false, self.layers.TIME )

	self.timeLeft	= -1
	self.mode		= -1

	self:RemoveControl( UI.ClanShip_GatherToggleBtn, self.layers.MAIN_EFFECT )

end


--
function UI.ClanShip_TimerWnd:FullUpdate()

	self:Reset()

	self:UpdateMode()

	self:UpdateCaption()
	self:UpdateTime()
	self:UpdateGatherToggleBtn()

end


--
function UI.ClanShip_TimerWnd:UpdateMode()

	self.mode = -1

	local shipName = UI.ClanShipWnd:GetShipName()

	if UI:IsClanShipGatheringMoney( shipName ) then
		self.mode = self.modes.GATHER_MONEY

	elseif UI:IsClanShipBuilding( shipName ) then
		self.mode = self.modes.BUILD

	else
		sys.log( "UI.ClanShip_TimerWnd:UpdateMode(): cannot detect mode" )
	end

end


--
function UI.ClanShip_TimerWnd:UpdateCaption()

	local str = ""

	local baseColor = self:GetColor( self.layers.CAPTION )

	if self.mode == self.modes.BUILD then

    	local partName = UI:GetClanShipBuildingPartName( UI.ClanShipWnd:GetShipName() )

		local partLocalizedName = UI:ClanShipPart2Str( partName, true )
		partLocalizedName = string.format( "%s%s", partLocalizedName, UI:Color2Str( baseColor ) )

    	str = UI:GetStringByName( "clanShip_timer_build" )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$name%$", partLocalizedName )

		if numSubst == 0 then
			sys.log( "UI.ClanShip_TimerWnd:UpdateCaption()[ERROR]: cannot find placeholder \"$name$\" in string \"clanShip_timer_build\"" )
			str = string.format( "[INVALID STRING] Building: %s", partLocalizedName )			
		end

	elseif self.mode == self.modes.GATHER_MONEY then

    	local partName = UI:GetClanShipGatheringMoneyPartName( UI.ClanShipWnd:GetShipName() )

		local partLocalizedName = UI:ClanShipPart2Str( partName, true )
		partLocalizedName = string.format( "%s%s", partLocalizedName, UI:Color2Str( baseColor ) )

    	str = UI:GetStringByName( "clanShip_timer_gatherMoney" )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$name%$", partLocalizedName )

		if numSubst == 0 then
			sys.log( "UI.ClanShip_TimerWnd:UpdateCaption()[ERROR]: cannot find placeholder \"$name$\" in string \"clanShip_timer_gatherMoney\"" )
			str = string.format( "[INVALID STRING] Gathering money: %s", partLocalizedName )			
		end

	else
		sys.log( "UI.ClanShip_GatherWnd:UpdateCaption()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ClanShip_TimerWnd:UpdateTime()

	local timeLeft = -1

	if self.mode == self.modes.BUILD then

		timeLeft = UI:GetClanShipBuildingTimeLeft( UI.ClanShipWnd:GetShipName() )

		if timeLeft < 0 then
			timeLeft = 0
		end

	end

	if timeLeft ~= self.timeLeft then

		local str = timeLeft ~= -1 and UI:Time2Str2( timeLeft ) or ""
		self:SetText( str, self.layers.TIME )

		self:SetLayerVisible( str ~= "", self.layers.TIME )

		self.timeLeft = timeLeft

	end

end 


--
function UI.ClanShip_TimerWnd:UpdateGatherToggleBtn()

	local bNeedBtn		= false
	local btnText		= ""
	local bIsTime		= false
	local bCheck		= false
	local bEnabled		= true
	local tooltipData	= nil

	if self.mode == self.modes.BUILD then

		bNeedBtn = UI.ClanShipWnd:IsInDock()
		if bNeedBtn then

    		btnText		= UI:GetStringByName( "clanShip_timer_boostBtn" )
    		bIsTime		= true
    		bCheck		= UI.ClanShip_GatherWnd:IsChildOf( UI.ClanShipWnd )

    		if not UI.ClanShip_GatherWnd:IsChildOf( UI.ClanShipWnd ) then

    			if UI:GetClanShipBoostPriceCap( UI.ClanShipWnd:GetShipName() ) <= 0 then

    				bEnabled = false

    				tooltipData =
    				{
    					tooltipType	= UI.tooltipTypes.TEXT_LARGE,
    					caption		= UI:GetStringByName( "clanShip_cantBoostTooltip_caption" ),
    					text		= UI:GetStringByName( "clanShip_cantBoostTooltip_text" ),
    				}

    			end

    		end

		end

	elseif self.mode == self.modes.GATHER_MONEY then

		bNeedBtn = UI.ClanShipWnd:IsInDock()
		if bNeedBtn then

    		btnText		= UI:GetStringByName( "clanShip_timer_gatherMoneyBtn" )
    		bIsTime		= false
    		bCheck		= UI.ClanShip_GatherWnd:IsChildOf( UI.ClanShipWnd )

		else
			sys.log( "UI.ClanShip_TimerWnd:UpdateGatherToggleBtn()[ERROR]: timer wnd is not supposed to be on screen while gathering money and not in dock" )
		end

	end  

	if bNeedBtn then

		local locator = bIsTime and self.effectInfo.main.gatherToggleBtnLocator_isTime or self.effectInfo.main.gatherToggleBtnLocator_noTime
		self:AddControl( UI.ClanShip_GatherToggleBtn, self.layers.MAIN_EFFECT, locator )

		UI.ClanShip_GatherToggleBtn:SetBtnText( btnText )
		UI.ClanShip_GatherToggleBtn:Check( bCheck )
		UI.ClanShip_GatherToggleBtn:SetGray( not bEnabled )
		UI.ClanShip_GatherToggleBtn:SetTooltipData( tooltipData )	

	else
		self:RemoveControl( UI.ClanShip_GatherToggleBtn, self.layers.MAIN_EFFECT )
	end

end


--
function UI.ClanShip_TimerWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTime()

end


--
function UI.ClanShip_TimerWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.ClanShip_TimerWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end  


-- -------------------------------------------------------------------
-- UI.ClanShip_GatherToggleBtn
-- -------------------------------------------------------------------

UI.ClanShip_GatherToggleBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

local l_baseCheckboxNumLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.ClanShip_GatherToggleBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name	= "ClanShip_GatherToggleBtn",			
	},

	layers =
	{
		numLayers = l_baseCheckboxNumLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "clanShip_gatherToggleBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text23",
						layer		= "UI.ClanShip_GatherToggleBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= l_baseCheckboxNumLayers,

			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_GatherToggleBtn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )

end


--
function UI.ClanShip_GatherToggleBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.ClanShip_GatherToggleBtn:GetTooltipData()

	return self.tooltipData

end

-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_GatherToggleBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

UI.ClanShip_GatherToggleBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "idle_2",
		animationSelect		= "over_2",
		animationPressed	= "over_2",
		animationDisabled	= "idle_2",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_GatherToggleBtn.tooltipData	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_GatherToggleBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if UI.EffectCheckBoxWnd.F_OnMouseIn then
		UI.EffectCheckBoxWnd.F_OnMouseIn( self, mouseX, mouseY, wndThatReceivedInput )
	else
		self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	end

	if not self:IsGray() and self:IsEnabled() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

	return true

end


-- -------------------------------------------------------------------
-- UI.ClanShip_GatherWnd
-- -------------------------------------------------------------------

UI.ClanShip_GatherWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_GatherWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ClanShipWnd",
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
				defName 			= "clanShip_gather",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self132",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text17",
						layer		= "UI.ClanShip_GatherWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text18",
						layer		= "UI.ClanShip_GatherWnd.layers.PROGRESS_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text19",
						layer		= "UI.ClanShip_GatherWnd.layers.PROGRESS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gold_2",
						layer		= "UI.ClanShip_GatherWnd.layers.AVAILABLE_MONEY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "money_2",
						layer		= "UI.ClanShip_GatherWnd.layers.TRANSFER_MONEY",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "buy_slider_main",
						wnd			= "UI.ClanShip_Gather_SliderWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.ClanShip_Gather_TransferBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "dread_btn1",
						wnd			= "UI.ClanShip_Gather_MoneySourceBtn",
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
		},  

		-- PROGRESS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- PROGRESS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- AVAILABLE_MONEY
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- TRANSFER_MONEY
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},

	children = { "UI.ClanShip_Gather_SliderWnd", "UI.ClanShip_Gather_TransferBtn", "UI.ClanShip_Gather_MoneySourceBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_GatherWnd:ToggleMoneySourceType()

	if self.moneySourceType == -1 then
		return
	end

	if not UI.ClanShip_Gather_MoneySourceBtn:IsChildOf( self ) then
		sys.log( "UI.ClanShip_GatherWnd:ToggleMoneySourceType()[ERROR]: no money source btn" )
		return
	end

	local moneySourceType = math.fmod( self.moneySourceType, UI:GetTableLength( self.moneySourceTypes ) ) + 1
	self:SetMoneySource( moneySourceType )

end


--
function UI.ClanShip_GatherWnd:GetMoneySourceType()

	return self.moneySourceType

end


--
function UI.ClanShip_GatherWnd:GetMoneyToTransfer()

	local val = 0

	if not UI.ClanShip_Gather_TransferBtn:IsGray() then
		val = UI.ClanShip_Gather_SliderWnd:GetVal()
	end

	return val

end


--
function UI.ClanShip_GatherWnd:ResetMoneyToTransfer()

	UI.ClanShip_Gather_SliderWnd:SetVal( 0 )

end


--
function UI.ClanShip_GatherWnd:GetMode()

	return self.mode

end


--
function UI.ClanShip_GatherWnd:OnGatheredBuildMoneyChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.mode ~= self.modes.BUILD then
		return
	end

	self:UpdateProgress()
	self:UpdateSlider()

end


--
function UI.ClanShip_GatherWnd:OnClanMoneyChanged()

	if not self:IsOnScreen() then
		return
	end

	if self.moneySourceType ~= self.moneySourceTypes.CLAN then
		return
	end

	self:OnAvailableMoneyChanged()

end


--
function UI.ClanShip_GatherWnd:OnPlayerMoneyChanged() 

	if not self:IsOnScreen() then
		return
	end

	if self.moneySourceType ~= self.moneySourceTypes.PLAYER then
		return
	end

	self:OnAvailableMoneyChanged()

end


--
function UI.ClanShip_GatherWnd:OnClanRoleChanged()

	if not self:IsOnScreen() then
		return
	end

	self:ValidateMoneySource()

end


--
function UI.ClanShip_GatherWnd:OnShipBuildStateChanged()

	if not self:IsOnScreen() then
		return
	end

	local oldMode				= self.mode
	local oldMoneySourceType	= self.moneySourceType
	local oldSliderVal			= UI.ClanShip_Gather_SliderWnd:GetVal()

	self:FullUpdate()

	if oldMoneySourceType ~= -1 then
		self:SetMoneySource( oldMoneySourceType )
	end

	if self.mode == oldMode then
		UI.ClanShip_Gather_SliderWnd:SetVal( oldSliderVal )
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_GatherWnd.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
    PROGRESS_LABEL	= 2,
    PROGRESS		= 3,
    AVAILABLE_MONEY	= 4,
    TRANSFER_MONEY	= 5,
}

UI.ClanShip_GatherWnd.moneySourceTypes =
{
	PLAYER	= 1,
	CLAN	= 2,
}

UI.ClanShip_GatherWnd.defaultMoneySourceType	= UI.ClanShip_GatherWnd.moneySourceTypes.PLAYER

UI.ClanShip_GatherWnd.effectInfo =
{
	main =
	{
		gatherNeedColorLocator	= "color_1",
		moneySourceBtnLocator	= "dread_btn1",
	},
}

UI.ClanShip_GatherWnd.modes =
{
	BUILD			= 1,
	BUILD_BOOST		= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_GatherWnd.moneySourceType				= -1
UI.ClanShip_GatherWnd.gatherNeedColor				= UI.TEXT_BASE_COLOR
UI.ClanShip_GatherWnd.partName						= ""
UI.ClanShip_GatherWnd.mode							= -1
UI.ClanShip_GatherWnd.availableMoneyMetaText		= UI.MetaText.GetNewInstance()
UI.ClanShip_GatherWnd.transferMoneyMetaText			= UI.MetaText.GetNewInstance()
UI.ClanShip_GatherWnd.boostTime						= -1
UI.ClanShip_GatherWnd.bLockOnSliderPosChangedUpdate	= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_GatherWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.gatherNeedColor = mainEffect:GetObjColor( self.effectInfo.main.gatherNeedColorLocator )
	end

	self.availableMoneyMetaText:InitFromLayer( self, self.layers.AVAILABLE_MONEY ) 	
	self.transferMoneyMetaText:InitFromLayer( self, self.layers.TRANSFER_MONEY ) 	

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SLIDER_CHANGED )

end


--
function UI.ClanShip_GatherWnd:F_Shutdown()

	if self.availableMoneyMetaText then
		self.availableMoneyMetaText:Clear()
	end

	if self.transferMoneyMetaText then
		self.transferMoneyMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ClanShip_GatherWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:FullUpdate()

end


--
function UI.ClanShip_GatherWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanShip_GatherWnd:UpdateMetaTextPos()

	self.availableMoneyMetaText:UpdateScreenOrgFromLayer( self, self.layers.AVAILABLE_MONEY )
	self.transferMoneyMetaText:UpdateScreenOrgFromLayer( self, self.layers.TRANSFER_MONEY )

end


--
function UI.ClanShip_GatherWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.AVAILABLE_MONEY then
		self.availableMoneyMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.TRANSFER_MONEY then
		self.transferMoneyMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	end

end


--
function UI.ClanShip_GatherWnd:Reset()

	self.partName			= ""
	self.moneySourceType	= -1
	self.mode				= -1
	self.boostTime			= -1

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.PROGRESS_LABEL )
	self:SetText( "", self.layers.PROGRESS )
	self.availableMoneyMetaText:SetText( "", true )
	self.transferMoneyMetaText:SetText( "", true )

	self.bLockOnSliderPosChangedUpdate = true
    UI.ClanShip_Gather_SliderWnd:SetMinMax( 0, 0 )
	self.bLockOnSliderPosChangedUpdate = false

	self:RemoveControl( UI.ClanShip_Gather_MoneySourceBtn, self.layers.MAIN_EFFECT )

	UI.ClanShip_Gather_TransferBtn:SetBtnText( "" )
	UI.ClanShip_Gather_TransferBtn:SetTooltipData( nil )
    UI.ClanShip_Gather_TransferBtn:SetGray( true )

end


--
function UI.ClanShip_GatherWnd:FullUpdate()

	self:Reset()

	self:UpdateMode()

	self:UpdateCaption()
	self:UpdateProgressLabel()
	self:UpdateProgress()
	self:UpdateMoneySource()
	self:UpdateTransferBtn()

end


--
function UI.ClanShip_GatherWnd:UpdateMode()

	self.mode = self:DetectMode()

	if self.mode == self.modes.BUILD then
		self.partName = UI:GetClanShipGatheringMoneyPartName( UI.ClanShipWnd:GetShipName() )
	end

end


--
function UI.ClanShip_GatherWnd:DetectMode()

	local mode = -1

	local shipName = UI.ClanShipWnd:GetShipName()

	if UI:IsClanShipBuilding( shipName ) then
		mode = self.modes.BUILD_BOOST

	else
		mode = self.modes.BUILD
	end

	return mode

end


--
function UI.ClanShip_GatherWnd:SetMoneySource( moneySourceType )

	if moneySourceType == self.moneySourceType then
		return
	end

	self:ResetMoneyToTransfer()

	self.moneySourceType = moneySourceType

	self:UpdateAvailableMoney()
	self:UpdateTransferMoney()

	if self.mode == self.modes.BUILD_BOOST then
		self:UpdateProgress()
	end

	self:UpdateSlider()

	if UI.ClanShip_Gather_MoneySourceBtn:IsChildOf( self ) then
		self:UdpateMoneySourceBtnState()
	end

end


--
function UI.ClanShip_GatherWnd:UpdateMoneySource()

	self:UpdateMoneySourceBtnVisibility()

	local moneySourceType = self.defaultMoneySourceType 

	if moneySourceType == self.moneySourceTypes.CLAN and not UI:IsRightsToSpendClanMoney() then
		moneySourceType = self.moneySourceTypes.PLAYER
	end

	self:SetMoneySource( moneySourceType )

end


--
function UI.ClanShip_GatherWnd:ValidateMoneySource()

	self:UpdateMoneySourceBtnVisibility()

	if self.moneySourceType == self.moneySourceTypes.CLAN and not UI:IsRightsToSpendClanMoney() then
		self:SetMoneySource( self.moneySourceTypes.PLAYER )
	end

end


--
function UI.ClanShip_GatherWnd:UpdateMoneySourceBtnVisibility()

	local bNeedBtn	= UI:IsRightsToSpendClanMoney()
	local bIsBtn	= UI.ClanShip_Gather_MoneySourceBtn:IsChildOf( self )

	if bNeedBtn and not bIsBtn then
		self:AddControl( UI.ClanShip_Gather_MoneySourceBtn, self.layers.MAIN_EFFECT, self.effectInfo.main.moneySourceBtnLocator )
		self:UdpateMoneySourceBtnState()

	elseif not bNeedBtn and bIsBtn then
		self:RemoveControl( UI.ClanShip_Gather_MoneySourceBtn, self.layers.MAIN_EFFECT)
	end

end


--
function UI.ClanShip_GatherWnd:UdpateMoneySourceBtnState()

	if not UI.ClanShip_Gather_MoneySourceBtn:IsChildOf( self ) then
		sys.log( "UI.ClanShip_GatherWnd:UdpateMoneySourceBtnState()[ERROR]: no money source btn" )
		return
	end

	if self.moneySourceType ~= -1 then
		UI.ClanShip_Gather_MoneySourceBtn:Setup( self.moneySourceType )	
	else
		UI.ClanShip_Gather_MoneySourceBtn:Reset()
	end

end


--
function UI.ClanShip_GatherWnd:UpdateCaption()

	local str = ""

	if self.mode == self.modes.BUILD then
    	str = UI:GetStringByName( "clanShip_gather_build_caption" )

	elseif self.mode == self.modes.BUILD_BOOST then
		str = UI:GetStringByName( "clanShip_gather_boostBuild_caption" )

	else
		sys.log( "UI.ClanShip_GatherWnd:UpdateCaption()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ClanShip_GatherWnd:UpdateProgressLabel()

	local str = ""

	if self.mode == self.modes.BUILD_BOOST then
		str = UI:GetStringByName( "clanShip_gather_boostBuild_time" )

	else
		str = UI:GetStringByName( "clanShip_gatherProgress" )
	end

	self:SetText( str, self.layers.PROGRESS_LABEL )

end


--
function UI.ClanShip_GatherWnd:UpdateProgress()

	local str = ""

	if	self.mode == self.modes.BUILD then

    	local needVal	= self:GetNeedMoney()
    	local isVal		= UI:GetClanShipBuildIridium()

    	str = string.format( "%s%s/%s", UI:Num2StrSeparatedBy3( isVal ), UI:Color2Str( self.gatherNeedColor ), UI:Num2StrSeparatedBy3( needVal ) )

	elseif self.mode == self.modes.BUILD_BOOST then

		local shipName = UI.ClanShipWnd:GetShipName()

		local timeDelta = UI:Round( UI:GetClanShipBuildingBoostTimeDelta( shipName, UI.ClanShip_Gather_SliderWnd:GetVal(), self.moneySourceType == self.moneySourceTypes.CLAN ) )
    	local timeLeft = UI:Round( UI:GetClanShipBuildingTimeLeft( shipName ) )

		local newTime = timeLeft - timeDelta
		
		if newTime < 0 then
			newTime = 0
		end

		if newTime ~= self.boostTime then

			if newTime > 0 then
				str = UI:Time2Str2( newTime )
			else
				str = UI:GetStringByName( "clanship_boostReady" )
			end

			self.boostTime = newTime

		else
			return
		end

	end

    self:SetText( str, self.layers.PROGRESS )

end


--
function UI.ClanShip_GatherWnd:UpdateAvailableMoney()

	local availableMoney	= self:GetAvailableMoney()
	local transferredMoney	= UI.ClanShip_Gather_SliderWnd:GetVal()
	local val = availableMoney - transferredMoney

	local priceType = -1

	if self.moneySourceType == self.moneySourceTypes.PLAYER then
		priceType = _G.GameStore.CreditsType.CT_TOKENS

	elseif self.moneySourceType == self.moneySourceTypes.CLAN then
		priceType = UI.exPriceTypes.CLAN_IRIDIUM

	else
		sys.log( "UI.ClanShip_GatherWnd:UpdateAvailableMoney()[ERROR]: unhandled money source %s", tostring( self.moneySourceType ) )
	end	

	local priceInfo =
	{
		priceType	= priceType,
		val			= val,
		bIsBuyPrice	= false,
	}

	local str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.AVAILABLE_MONEY ), false, true, true, nil )

	self.availableMoneyMetaText:SetText( str, true )

end


--
function UI.ClanShip_GatherWnd:UpdateTransferMoney()

	local val = UI.ClanShip_Gather_SliderWnd:GetVal()
	
	if self.moneySourceType == self.moneySourceTypes.PLAYER then
		local exchangeRate = _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_IRIDIUM_FOR_CLANSHIP ) or 1
		val = math.floor( val / exchangeRate )
	end

	local priceInfo =
	{
		priceType	= UI.exPriceTypes.CLAN_IRIDIUM,
		val			= val,
		bIsBuyPrice	= false,
	}

	local str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.TRANSFER_MONEY ), false, true, true, nil )

	self.transferMoneyMetaText:SetText( str, true )

end


--
function UI.ClanShip_GatherWnd:UpdateSlider()

	local gatheredIridium = 0

	if self.mode == self.modes.BUILD then
		gatheredIridium = UI:GetClanShipBuildIridium()
	end

	local missIridium = 0

	if self.mode == self.modes.BUILD then
	
		local needIridium = self:GetNeedMoney()
		missIridium = needIridium > gatheredIridium and needIridium - gatheredIridium or 0

	elseif self.mode == self.modes.BUILD_BOOST then
	
		local shipName = UI.ClanShipWnd:GetShipName()
		
		missIridium = UI:GetClanShipInstantBuildingBoostCost( shipName )	-- SC-111919 - слайдер ограничивается суммой, на которую можно завершить строительство прямо сейчас
		missIridium = math.min( missIridium, UI:GetClanShipBoostPriceCap( shipName ) )

	else
    	sys.log( "UI.ClanShip_GatherWnd:UpdateSlider()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

	local availableVal = self:GetAvailableMoney()	-- могут быть токены или клановый иридиум, в зависимости от выбранного режима
	
	local transferMaxVal = 0
	local exchangeRate = 1
	
	if self.moneySourceType == self.moneySourceTypes.PLAYER then
	
		exchangeRate = _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_IRIDIUM_FOR_CLANSHIP ) or 1
		transferMaxVal = missIridium * exchangeRate
		
	elseif self.moneySourceType == self.moneySourceTypes.CLAN then
		transferMaxVal = missIridium
	end
	
	transferMaxVal = math.min( transferMaxVal, availableVal )
	transferMaxVal = math.floor( transferMaxVal / exchangeRate ) * exchangeRate	-- максимальное количество показывается кратное стоимости 1 ед. иридиума

	UI.ClanShip_Gather_SliderWnd:SetMax( transferMaxVal )	-- могут быть токены или клановый иридиум, в зависимости от выбранного режима
	UI.ClanShip_Gather_SliderWnd:SetStep( exchangeRate )	-- шаг, кратный стоимости 1 ед. иридиума

end


--
function UI.ClanShip_GatherWnd:UpdateTransferBtnState()

	local bEnabled = false

	local transferVal = UI.ClanShip_Gather_SliderWnd:GetVal()
	if transferVal > 0 then

		if self.mode == self.modes.BUILD then
			bEnabled = true

		elseif self.mode == self.modes.BUILD_BOOST then

			local buildLeftTime		= UI:GetClanShipBuildingTimeLeft( UI.ClanShipWnd:GetShipName() )
			local restrictedTime	= UI:GetClanShipBoostRestrictedTime()

			if buildLeftTime > restrictedTime then
				bEnabled = true
			end

    	else
    		sys.log( "UI.ClanShip_GatherWnd:UpdateTransferBtnState()[ERROR]: unhandled mode %s", tostring( self.mode ) )
    	end

	end

	UI.ClanShip_Gather_TransferBtn:SetGray( not bEnabled )	

end


--
function UI.ClanShip_GatherWnd:UpdateTransferBtn()

	-- текст

	local str = ""

	if self.mode == self.modes.BUILD then
    	str = UI:GetStringByName( "clanShip_transferIridiumBtn" )

	elseif self.mode == self.modes.BUILD_BOOST then
		str = UI:GetStringByName( "clanShip_gather_boostBuild_btn" )

	else
		sys.log( "UI.ClanShip_GatherWnd:UpdateTransferBtn()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

	UI.ClanShip_Gather_TransferBtn:SetBtnText( str )


	-- тултип

	local tooltipData = nil

	if self.mode == self.modes.BUILD then

		tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "clanShip_gather_build_btnTooltip_caption" ),
			text		= UI:GetStringByName( "clanShip_gather_build_btnTooltip_text" ),
		}

	elseif self.mode == self.modes.BUILD_BOOST then

		local text = UI:GetStringByName( "clanShip_gather_boostBuild_btnTooltip_text" )

		local restrictedTime = UI:GetClanShipBoostRestrictedTime()
		local strRestrictedTime = UI:Time2Str44( restrictedTime )

		local numSubst = 0
		text, numSubst = string.gsub( text, "%$time%$", strRestrictedTime )

		if numSubst == 0 then
			sys.log( "UI.ClanShip_GatherWnd:UpdateTransferBtn()[ERROR]: cannot find placeholder \"$time$\" in string \"clanShip_gather_boostBuild_btnTooltip_text\"" )
			text = string.format( "%s. [INVALID STRING]: Restricted time: %s before building end", text, strRestrictedTime )
		end

		tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "clanShip_gather_boostBuild_btnTooltip_caption" ),
			text		= text,
		}

	else
		sys.log( "UI.ClanShip_GatherWnd:UpdateTransferBtn()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

	UI.ClanShip_Gather_TransferBtn:SetTooltipData( tooltipData )

end


--
function UI.ClanShip_GatherWnd:GetAvailableMoney()

	local val = 0

	if self.moneySourceType == self.moneySourceTypes.PLAYER then
		val = UI:GetPlayerTokens()

	elseif self.moneySourceType == self.moneySourceTypes.CLAN then
		val = UI:GetIridium()

	else
		sys.log( "UI.ClanShip_GatherWnd:GetAvailableMoney()[ERROR]: unhandled money source %s", tostring( self.moneySourceType ) )
	end

	return val

end


--
function UI.ClanShip_GatherWnd:GetNeedMoney()

	local val = 0

	if self.mode == self.modes.BUILD then
		val = UI:GetClanShipPartPrice( self.partName )

	else
		sys.log( "UI.ClanShip_GatherWnd:GetNeedMoney()[ERROR]: unhandled mode %s", tostring( self.mode ) )
	end

	return val

end


--
function UI.ClanShip_GatherWnd:OnSliderPosChanged()

	if self.bLockOnSliderPosChangedUpdate then
		return
	end

	self:UpdateTransferMoney()
	self:UpdateTransferBtnState()
	self:UpdateAvailableMoney()

	if self.mode == self.modes.BUILD_BOOST then
		self:UpdateProgress()
	end	

end


--
function UI.ClanShip_GatherWnd:F_OnEventSliderChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.ClanShip_Gather_SliderWnd:GetUiHandle() then
		self:OnSliderPosChanged()
	end

end


--
function UI.ClanShip_GatherWnd:OnAvailableMoneyChanged()

    self:UpdateAvailableMoney()
    self:UpdateSlider()

end


--
function UI.ClanShip_GatherWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.ClanShip_GatherWnd:RemoveControl( wnd, effectLayer )

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
function UI.ClanShip_GatherWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.mode == self.modes.BUILD_BOOST then

		self:UpdateProgress()
		self:UpdateTransferBtnState()
		
	end

end


-- -------------------------------------------------------------------
-- UI.ClanShip_Gather_TransferBtn
-- -------------------------------------------------------------------

UI.ClanShip_Gather_TransferBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "ClanShip_Gather_TransferBtn"
		}
	},
}

-- -------------------------------------------------------------------
-- UI.ClanShip_Gather_MoneySourceBtn
-- -------------------------------------------------------------------

UI.ClanShip_Gather_MoneySourceBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_Gather_MoneySourceBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "ClanShip_Gather_SourceCheckBox",
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
				defName 			= "clanShip_gather_moneySource",
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
-- interface fucntions
-- ------------------------------

--
function UI.ClanShip_Gather_MoneySourceBtn:Setup( moneySourceType )

	self:Reset()

	self.moneySourceType = moneySourceType

	self:FullUpdate()

end


--
function UI.ClanShip_Gather_MoneySourceBtn:Reset()

	self.moneySourceType	= -1
	self.tooltipData		= nil

end


--
function UI.ClanShip_Gather_MoneySourceBtn:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_Gather_MoneySourceBtn.effectInfo =
{
	-- иконка сундучка
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "idle",
	},

	-- иконка человечка
	main_checked =
	{
		animationIdle 		= "idle_2",
		animationSelect		= "over_2",
		animationPressed	= "over_2",
		animationDisabled	= "idle_2",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_Gather_MoneySourceBtn.moneySourceType	= -1
UI.ClanShip_Gather_MoneySourceBtn.tooltipData		= nil

-- ------------------------------
-- vars
-- ------------------------------

--
function UI.ClanShip_Gather_MoneySourceBtn:FullUpdate()

	self:UpdateAnimation()
	self:UpdateTooltip()

end


--
function UI.ClanShip_Gather_MoneySourceBtn:UpdateAnimation()

	local bCheck = false

	if self.moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.PLAYER then
		bCheck = false

	elseif self.moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.CLAN then
		bCheck = true

	else
		sys.log( "UI.ClanShip_Gather_MoneySourceBtn:UpdateAnimation()[ERROR]: unhandled money source %s", tostring( self.moneySourceType ) )
	end

	self:Check( bCheck )

end


--
function UI.ClanShip_Gather_MoneySourceBtn:UpdateTooltip()

	self.tooltipData = nil

	if self.moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.PLAYER then

		self.tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "clanShip_moneySource_tooltipCaption_toClan" ),
			text		= UI:GetStringByName( "clanShip_moneySource_tooltipText_toClan" ),
		}

	elseif self.moneySourceType == UI.ClanShip_GatherWnd.moneySourceTypes.CLAN then

		self.tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "clanShip_moneySource_tooltipCaption_toPlayer" ),
			text		= UI:GetStringByName( "clanShip_moneySource_tooltipText_toPlayer" ),
		}

	end

	local tooltipWnd = nil

	if UI:GetCurTooltipTarget() == self then
		tooltipWnd = UI:GetCurTooltip()
	end

	if tooltipWnd then
		tooltipWnd:Setup( self.tooltipData )
	end

end

-- -------------------------------------------------------------------
-- UI.ClanShip_Gather_SliderWnd
-- -------------------------------------------------------------------

UI.ClanShip_Gather_SliderWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "Slider2Wnd",

    	props =
    	{
    		name	= "ClanShip_Gather_SliderWnd",
    	},
    },
} 

-- -------------------------------------------------------------------
-- UI.ClanShip_NoBuildingPartWnd
-- -------------------------------------------------------------------

UI.ClanShip_NoBuildingPartWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_NoBuildingPartWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ClanShip_NoBuildingPartWnd",
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
				defName 			= "clanShip_noShip",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self134",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title24",
						layer		= "UI.ClanShip_NoBuildingPartWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title25",
						layer		= "UI.ClanShip_NoBuildingPartWnd.layers.TEXT",
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
		},  

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},  
	}
}

-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_NoBuildingPartWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    TEXT		= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_NoBuildingPartWnd.lastBuiltPartName	= ""

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_NoBuildingPartWnd:Reset()

	self.lastBuiltPartName = ""

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.TEXT )

end


--
function UI.ClanShip_NoBuildingPartWnd:FullUpdate()

	self:Reset()

	local shipName = UI.ClanShipWnd:GetShipName()
	local numBuiltParts	= UI:GetClanShipNumBuiltBaseParts( shipName )

	self.lastBuiltPartName = UI:ClanShipBasePartIdx2Name( shipName, numBuiltParts )

	self:UpdateCaption()
	self:UpdateText()

end


--
function UI.ClanShip_NoBuildingPartWnd:UpdateCaption()

	local str = ""

	if self.lastBuiltPartName ~= "" then

		local strId = string.format( "clanShip_endBuild_caption_%s", self.lastBuiltPartName )
		str = UI:GetStringByName( strId )

	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ClanShip_NoBuildingPartWnd:UpdateText()

	local str = ""

	if self.lastBuiltPartName ~= "" then

		local strId = string.format( "clanShip_endBuild_text_%s", self.lastBuiltPartName )
		str = UI:GetStringByName( strId )

		local maxAllowedParts	= cvars.clan_shipPartsCanBuild 
		local numBuiltParts		= UI:GetClanShipNumBuiltBaseParts( UI.ClanShipWnd:GetShipName() )

		local bAllowed = numBuiltParts < maxAllowedParts
		if not bAllowed then

			local strNotAllowed = UI:GetStringByName( "clanship_buildNotAllowed" )
			strNotAllowed = string.format( "%s%s", UI:Color2Str( UI.PARAM_DELTA_MINUS_COLOR ), strNotAllowed )

			str	= string.format( "%s|%s", str, strNotAllowed )

		end

	end

	self:SetText( str, self.layers.TEXT )

end


--
function UI.ClanShip_NoBuildingPartWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- -------------------------------------------------------------------
-- UI.ClanShip_StartBuildPartWnd
-- -------------------------------------------------------------------

UI.ClanShip_StartBuildPartWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_StartBuildPartWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ClanShip_StartBuildPartWnd",
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
				defName 			= "clanShip_startBuildPart",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self140",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title27",
						layer		= "UI.ClanShip_StartBuildPartWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title28",
						layer		= "UI.ClanShip_StartBuildPartWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_24",
						wnd			= "UI.ClanShip_StartBuildPart_ActionBtn",
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
		},  

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children = { "UI.ClanShip_StartBuildPart_ActionBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_StartBuildPartWnd:OnOtherShipBuildStateChanged( shipName )

	self:UpdateActionBtnState()
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_StartBuildPartWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    TEXT		= 2,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_StartBuildPartWnd.lastBuiltPartName	= ""

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_StartBuildPartWnd:Reset()

	self.lastBuiltPartName = ""

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.TEXT )
	UI.ClanShip_StartBuildPart_ActionBtn:SetGray( true )

end


--
function UI.ClanShip_StartBuildPartWnd:FullUpdate()

	self:Reset()

	local shipName = UI.ClanShipWnd:GetShipName()
	local numBuiltParts	= UI:GetClanShipNumBuiltBaseParts( shipName )

	self.lastBuiltPartName = UI:ClanShipBasePartIdx2Name( shipName, numBuiltParts )

	self:UpdateCaption()
	self:UpdateText()
	self:UpdateActionBtnState()

end


--
function UI.ClanShip_StartBuildPartWnd:UpdateCaption()

	local str = ""

	if self.lastBuiltPartName ~= "" then

		local strId = string.format( "clanShip_endBuild_caption_%s", self.lastBuiltPartName )
		str = UI:GetStringByName( strId )

	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ClanShip_StartBuildPartWnd:UpdateText()

	local str = ""

	if self.lastBuiltPartName ~= "" then

		local strId = string.format( "clanShip_endBuild_text_%s", self.lastBuiltPartName )
		str = UI:GetStringByName( strId )

		local maxAllowedParts	= cvars.clan_shipPartsCanBuild 
		local numBuiltParts		= UI:GetClanShipNumBuiltBaseParts( UI.ClanShipWnd:GetShipName() )

		local bAllowed = numBuiltParts < maxAllowedParts
		if not bAllowed then

			local strNotAllowed = UI:GetStringByName( "clanship_buildNotAllowed" )
			strNotAllowed = string.format( "%s%s", UI:Color2Str( UI.PARAM_DELTA_MINUS_COLOR ), strNotAllowed )

			str	= string.format( "%s|%s", str, strNotAllowed )

		end

	end

	self:SetText( str, self.layers.TEXT )

end


--
function UI.ClanShip_StartBuildPartWnd:UpdateActionBtnState()
	
	local maxAllowedParts	= cvars.clan_shipPartsCanBuild 
	local numBuiltParts		= UI:GetClanShipNumBuiltBaseParts( UI.ClanShipWnd:GetShipName() )
	local bAllowed 			= numBuiltParts < maxAllowedParts
	
	local bIsShipBuilding = UI:GetClanShipBuildingOrGatheringMoney() ~= ""	-- нельзя строить одновременно несколько #0104977(0488106)

	local bEnable =
		self.lastBuiltPartName ~= ""
		and bAllowed
		and not bIsShipBuilding

	UI.ClanShip_StartBuildPart_ActionBtn:SetGray( not bEnable )
	
	local tooltipData = nil
	if bIsShipBuilding then
		tooltipData = UI.ClanShipWnd:GetTooltipData_CantBuildMultiple()
	end
	UI.ClanShip_StartBuildPart_ActionBtn:SetTooltipData( tooltipData )

end


--
function UI.ClanShip_StartBuildPartWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- -------------------------------------------------------------------
-- UI.ClanShip_StartBuildPart_ActionBtn
-- -------------------------------------------------------------------

UI.ClanShip_StartBuildPart_ActionBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "ClanShip_StartBuildPart_ActionBtn"
		}
	},

	textId = "clanShip_endBuild_continueBtn"
}

-- -------------------------------------------------------------------
-- UI.ClanShip_FitSlotsWnd
-- -------------------------------------------------------------------

UI.ClanShip_FitSlotsWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_FitSlotsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ClanShip_FitSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_FitSlotsWnd:SelectSlot( slotName )

	if type( slotName ) ~= "string" then
		sys.log( "UI.ClanShip_FitSlotsWnd:SelectSlot()[ERROR]: invalid type of the 1-st parameter (\"slotName\"); \"string\" expected, got \"%s\"", type( slotName ) )
		return
	end

	if slotName ~= "" and not UI:IsRightsToBuildClanShip() then
		sys.log( "UI.ClanShip_FitSlotsWnd:SelectSlot()[ERROR]: no rigths to build" )
		return
	end

	local oldSelSlotName = self:GetSelSlotName()
	if oldSelSlotName == slotName then
		return
	end

	if oldSelSlotName ~= "" then

		local slotWnd = self:GetSlotWndByName( oldSelSlotName )
		if slotWnd then
	        slotWnd:Select( false )
		end

	end

	if slotName ~= "" then

		local slotWnd = self:GetSlotWndByName( slotName )
		if slotWnd then
			slotWnd:Select( true )
		else
			sys.log( "UI.ClanShip_FitSlotsWnd:SelectSlot()[ERROR]: cannot find slot \"%s\"", slotName )
		end

	end

	self:OnSelSlotChanged()

end


--
function UI.ClanShip_FitSlotsWnd:GetSelSlotName()

	local selSlotWnd = self:GetSelSlotWnd()
	return selSlotWnd and selSlotWnd:GetSlotName() or ""

end


--
function UI.ClanShip_FitSlotsWnd:GetSlotWndByName( slotName )

	for idx, slotWnd in pairs( self.curSlots ) do
		if slotWnd:GetSlotName() == slotName then
			return slotWnd
		end
	end

	return nil

end


--
function UI.ClanShip_FitSlotsWnd:OnShipBuildStateChanged()

	if not self:IsOnScreen() then
		return
	end

	for idx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnShipBuildStateChanged()
	end

end


--
function UI.ClanShip_FitSlotsWnd:GetSlotShipPos( slotName )

	local pos = UI:ZeroVec2()

	local shipName = UI.ClanShipWnd:GetShipName()

	if type( _G.ClanShipDefs ) ~= "table" then
		sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: invalid type of \"_G.ClanShipDefs\"; \"table\" expected, got \"%s\"", type( _G.ClanShipDefs ) )
		return pos
	end	

	local shipDef = _G.ClanShipDefs[ shipName ]

	if type( shipDef ) ~= "table" then
		sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"]\"; \"table\" expected, got \"%s\"", shipName, type( shipDef ) )
		return pos
	end	

	if type( shipDef.slots_ui ) ~= "table" then
		sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui\"; \"table\" expected, got \"%s\"", shipName, type( shipDef.slots_ui ) )
		return pos
	end

	local slotInfo = nil

	for idx, info in pairs( shipDef.slots_ui ) do

		if type( info ) == "table" then

			if type( info.name ) == "string" then

				if info.name == slotName then
					slotInfo = info
					break
				end

			else
				sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui[%s].name\"; \"string\" expected, got \"%s\"", shipName, tostring( idx ), type( info.name ) )
			end
	
		else
			sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui[%s]\"; \"table\" expected, got \"%s\"", shipName, tostring( idx ), type( info ) )
		end

	end

	if slotInfo then

		if type( slotInfo.x ) == "number" then
			pos.x = slotInfo.x
		else
			sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui[\"%s\"].x\"; \"number\" expected, got \"%s\"", shipName, slotName, type( slotInfo.x ) )
		end

		if type( slotInfo.y ) == "number" then
			pos.y = slotInfo.y
		else
			sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui[\"%s\"].y\"; \"number\" expected, got \"%s\"", shipName, slotName, type( slotInfo.y ) )
		end

	else
		sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotShipPos()[ERROR]: cannot find ui info for slot %s in ship %s", slotName, shipName )
	end

	pos = self:ShipPos2Local( pos )	

	return pos	

end    


--
function UI.ClanShip_FitSlotsWnd:OnSlotMouseOverChanged( slotWnd )

	if not self:IsOnScreen() then
		return
	end

	self:UpdateLinks()

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_FitSlotsWnd.effectInfo =
{
	slots =
	{
        effectName			= "clanShip_fitSlots",
        slotLocatorPrefix	= "mod_",
        numSlots			= 9,
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_FitSlotsWnd.allSlots		= {}
UI.ClanShip_FitSlotsWnd.curSlots		= {}
UI.ClanShip_FitSlotsWnd.slotWidth		= 0
UI.ClanShip_FitSlotsWnd.slotsSpace		= 0
UI.ClanShip_FitSlotsWnd.slotsCenterX	= 0
UI.ClanShip_FitSlotsWnd.slotsY			= 0
UI.ClanShip_FitSlotsWnd.layoutInited	= false
UI.ClanShip_FitSlotsWnd.allLinks		= {}
UI.ClanShip_FitSlotsWnd.curLinks		= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_FitSlotsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()

end


--
function UI.ClanShip_FitSlotsWnd:Reset()

	self:ResetSlots()
	self:ResetLinks()

end


--
function UI.ClanShip_FitSlotsWnd:ResetSlots()

	local oldSelSlotName = self:GetSelSlotName()

	for idx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

	if oldSelSlotName ~= "" then
		self:OnSelSlotChanged()
	end

end


--
function UI.ClanShip_FitSlotsWnd:ResetLinks( linkWnd )

	for idx, linkWnd in pairs( self.curLinks ) do
		linkWnd:Reset()
		linkWnd:UnlinkFromParent()
	end

	self.curLinks = {}

end


--
function UI.ClanShip_FitSlotsWnd:FullUpdate()

	self:Reset()

	self:UpdateSlots()
	self:UpdateLinks()

end


--
function UI.ClanShip_FitSlotsWnd:UpdateSlots()

	self:ResetSlots()

	local shipName = UI.ClanShipWnd:GetShipName()
	local slotNames = UI:GetClanShipFitSlots( shipName, true )

	-- сортировка

	local sortIdxs = {}

	for slotIdx, slotName in pairs( slotNames ) do
		sortIdxs[ slotName ] = self:GetSlotSortIdx( slotName )
	end

	local fnSort = function( slotName1, slotName2 )

		local sortIdx1 = sortIdxs[ slotName1 ]
		local sortIdx2 = sortIdxs[ slotName2 ]

		if sortIdx1 ~= sortIdx2 then
			return sortIdx1 < sortIdx2
		else
			return slotName1 < slotName2
		end

	end

	table.sort( slotNames, fnSort )

	-- создание

	for slotIdxdx, slotName in ipairs( slotNames ) do

		local slotWnd = self:ObtainFreeSlot()
		if slotWnd then
    		slotWnd:Setup( slotName )
		end
		
	end

	-- позиции

	local numSlots = #self.curSlots
	if numSlots > 0 then
	
    	local slotsWidth = numSlots * self.slotWidth + ( numSlots - 1 ) * self.slotsSpace
    	local slotsX = self.slotsCenterX - slotsWidth * 0.5

    	for slotIdx, slotWnd in pairs( self.curSlots ) do

    		local slotX = slotsX + ( slotIdx - 1 ) * ( self.slotWidth + self.slotsSpace )
			slotX = UI:XRel2Snapped( slotX )

			slotWnd:SetPos( slotX, self.slotsY )

    	end

	end

end


--
function UI.ClanShip_FitSlotsWnd:ShipPos2Local( shipPos )

	local localPos = UI:ZeroVec2()

	local hTex = UI.ClanShipWnd:GetBgTex()
	if hTex == UI.INVALID_RESOURCE_HANDLE then
		return localPos
	end

	local rc = UI:GetResourceByHandle( hTex )

	local texW	= rc:GetTextureWidth()
	local texH	= rc:GetTextureHeight()

	local selfRect	= self:GetRect()
	local bgRect	= UI.ClanShipWnd:GetBgRect()

	localPos.x = ( bgRect.x - selfRect.x ) + bgRect.z * ( shipPos.x / texW )
	localPos.y = ( bgRect.y - selfRect.y ) + bgRect.w * ( shipPos.y / texH )		

	return localPos

end


--
function UI.ClanShip_FitSlotsWnd:GetSlotSortIdx( slotName )

	local sortIdx = -1

	local shipName = UI.ClanShipWnd:GetShipName()

	if type( _G.ClanShipDefs ) ~= "table" then
		sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotSortIdx()[ERROR]: invalid type of \"_G.ClanShipDefs\"; \"table\" expected, got \"%s\"", type( _G.ClanShipDefs ) )
		return sortIdx
	end	

	local shipDef = _G.ClanShipDefs[ shipName ]

	if type( shipDef ) ~= "table" then
		sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotSortIdx()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"]\"; \"table\" expected, got \"%s\"", shipName, type( shipDef ) )
		return sortIdx
	end	

	if type( shipDef.slots_ui ) ~= "table" then
		sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotSortIdx()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui\"; \"table\" expected, got \"%s\"", shipName, type( shipDef.slots_ui ) )
		return sortIdx
	end

	for idx, info in pairs( shipDef.slots_ui ) do

		if type( info ) == "table" then

			if type( info.name ) == "string" then

				if info.name == slotName then

					if type( idx ) == "number" then
						sortIdx = idx
					else
						sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotSortIdx()[ERROR]: invalid type of index in table \"_G.ClanShipDefs[\"%s\"].slots_ui\"; \"number\" expected, got \"%s\"", shipName, type( idx ) )
					end

					break

				end

			else
				sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotSortIdx()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui[%s].name\"; \"string\" expected, got \"%s\"", shipName, tostring( idx ), type( info.name ) )
			end
	
		else
			sys.log( "UI.ClanShip_FitSlotsWnd:GetSlotSortIdx()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots_ui[%s]\"; \"table\" expected, got \"%s\"", shipName, tostring( idx ), type( info ) )
		end

	end

	return sortIdx

end


--
function UI.ClanShip_FitSlotsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:PrepareLayout()	-- из F_PostLoad не работает
	self:FullUpdate()

end


--
function UI.ClanShip_FitSlotsWnd:CreateControls()

	local SLOTS_COUNT = 5
	for idx = 1, SLOTS_COUNT do
		self:CreateSlot()
	end

	local LINKS_COUNT = 2
	for idx = 1, LINKS_COUNT do
		self:CreateLink()
	end

end


--
function UI.ClanShip_FitSlotsWnd:ObtainFreeSlot()

	local slotWnd = nil

	for idx, wnd in pairs( self.allSlots ) do
		if not wnd:IsChildOf( self ) then
			slotWnd = wnd
			break
		end
	end

	if not slotWnd then
		slotWnd = self:CreateSlot()
	end

	if slotWnd then
		self:AddChild( slotWnd )
		table.insert( self.curSlots, slotWnd )
	end

	return slotWnd

end


--
function UI.ClanShip_FitSlotsWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ClanShip_FitSlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	end

	return slotWnd

end


--
function UI.ClanShip_FitSlotsWnd:ObtainFreeLink()

	local linkWnd = nil

	for idx, wnd in pairs( self.allLinks ) do
		if not wnd:IsChildOf( self ) then
			linkWnd = wnd
			break
		end
	end

	if not linkWnd then
		linkWnd = self:CreateLink()
	end

	if linkWnd then
		self:AddChild( linkWnd )
		table.insert( self.curLinks, linkWnd )
	end

	return linkWnd

end


--
function UI.ClanShip_FitSlotsWnd:CreateLink()

	local linkWnd = UI:CreateChildWnd( self, UI.ClanShip_FitLinkWnd, tostring( #self.allLinks + 1 ) )

	if linkWnd then
		table.insert( self.allLinks, linkWnd )
	end

	return linkWnd

end



--
function UI.ClanShip_FitSlotsWnd:OnSelSlotChanged()

	UI.ClanShipWnd:OnSelFitSlotChanged()
	self:UpdateLinks()

end


--
function UI.ClanShip_FitSlotsWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end


--
function UI.ClanShip_FitSlotsWnd:PrepareLayout()

	if self.layoutInited then
		return
	end

	local selfRect = UI.ClanShipWnd:GetBgRect()

	local slotWidth		= 0
	local slotsSpace	= 0
	local slotsCenterX	= 0
	local slotsY		= 0

	local slotWnd = self.allSlots[ 1 ]

	if slotWnd then
		slotWidth = slotWnd:GetWidth()
	end

	local slotsEffect = _G.UI_SpawnEffect( self.effectInfo.slots.effectName, self:GetUiHandle() )
	if slotsEffect then

		local firstSlotPos	= slotsEffect:GetObjPos( string.format( "%s%d", self.effectInfo.slots.slotLocatorPrefix, 1 ) )
		local secondSlotPos	= slotsEffect:GetObjPos( string.format( "%s%d", self.effectInfo.slots.slotLocatorPrefix, 2 ) )
		local lastSlotPos	= slotsEffect:GetObjPos( string.format( "%s%d", self.effectInfo.slots.slotLocatorPrefix, self.effectInfo.slots.numSlots ) )

		slotsSpace = secondSlotPos.x - ( firstSlotPos.x + slotWidth )

		local slotsPos = UI.ClanShipWnd:GetFitSlotsPos()

		slotsCenterX = firstSlotPos.x + ( ( lastSlotPos.x + slotWidth ) - firstSlotPos.x ) * 0.5
		slotsCenterX = slotsCenterX + slotsPos.x - selfRect.x

		slotsY = firstSlotPos.y + slotsPos.y - selfRect.y

		_G.UI_DestroyEffect( slotsEffect )

	end

	self.slotWidth		= slotWidth
	self.slotsSpace		= slotsSpace
	self.slotsCenterX	= slotsCenterX
	self.slotsY			= slotsY

	self:SetRect( selfRect )

	self.layoutInited = true

end


--
function UI.ClanShip_FitSlotsWnd:UpdateLinks()

	self:ResetLinks()

	for idx, slotWnd in pairs( self.curSlots ) do
	
		if slotWnd:IsSelected() or slotWnd:IsMouseOver() then

			local linkWnd = self:ObtainFreeLink()
			if linkWnd then
        		linkWnd:Setup( slotWnd )
			end
		
		end

	end

end


--
function UI.ClanShip_FitSlotsWnd:GetSelSlotWnd()

	for idx, slotWnd in pairs( self.curSlots ) do
		if slotWnd:IsSelected() then
			return slotWnd
		end
	end

	return nil

end


-- -------------------------------------------------------------------
-- UI.ClanShip_FitSlotWnd
-- -------------------------------------------------------------------

UI.ClanShip_FitSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_FitSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ClanShip_FitSlotWnd",
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
				defName 			= "clanShip_fitSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ico",
						layer		= "UI.ClanShip_FitSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "select",
						layer		= "UI.ClanShip_FitSlotWnd.layers.SELECTION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "frame",
						layer		= "UI.ClanShip_FitSlotWnd.layers.BUILDING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ClanShip_FitSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "tir",
						layer		= "UI.ClanShip_FitSlotWnd.layers.TIER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "clanShip_fitSlot_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- TIER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- SELECTION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "clanShip_fitSlot_selection",
				defaultAnimation	= "idle",
			}}
		},

		-- BUILDING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "clanShip_fitSlot_building",
				defaultAnimation	= "build",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "clanShip_fitSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_FitSlotWnd:Setup( slotName )

	self:Reset()

	self.slotName = slotName
	self:FullUpdate()

end


--
function UI.ClanShip_FitSlotWnd:Reset()

	self.slotName 		= ""
	self.tooltipData	= nil
	self.partName		= ""

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )		
	end

	self:Select( false )
	self:SetMouseOver( false )

	self:SetLayerVisible( false, self.layers.TIER )
	self:SetLayerVisible( false, self.layers.SELECTION_EFFECT )
	self:SetLayerVisible( false, self.layers.BUILDING_EFFECT )

end


--
function UI.ClanShip_FitSlotWnd:GetSlotName()

	return self.slotName

end


--
function UI.ClanShip_FitSlotWnd:Select( bSelected )

	self.bSelected = bSelected
	self:UpdateSelection()

end


--
function UI.ClanShip_FitSlotWnd:IsSelected()

	return self.bSelected

end


--
function UI.ClanShip_FitSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ClanShip_FitSlotWnd:OnShipBuildStateChanged()

	self:UpdateBuildingEffect()
	self:UpdatePart()
	self:UpdateIco()
	self:UpdateTier()
	self:UpdateTooltip()
	self:UpdateMouseOver()

end


--
function UI.ClanShip_FitSlotWnd:GetLinkPos()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local pos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.linkPosLoctor ) or UI:ZeroVec2()

	return pos

end


--
function UI.ClanShip_FitSlotWnd:IsMouseOver()

	return self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_FitSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    ICO_EFFECT			= 1,
	TIER				= 2,
	SELECTION_EFFECT	= 3,
    BUILDING_EFFECT		= 4,
    MOUSE_OVER_EFFECT	= 5,
}

UI.ClanShip_FitSlotWnd.effectInfo =
{
	main =
	{
		linkPosLoctor	= "center_2",
	},

	ico =
	{
		spriteName	= "ico",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_FitSlotWnd.slotName		= ""
UI.ClanShip_FitSlotWnd.bSelected	= false
UI.ClanShip_FitSlotWnd.tooltipData	= nil
UI.ClanShip_FitSlotWnd.partName		= ""

-- ------------------------------
-- work functions
-- ------------------------------


--
function UI.ClanShip_FitSlotWnd:FullUpdate()

	self:UpdatePart()
	self:UpdateIco()
	self:UpdateTier()
	self:UpdateBuildingEffect()
	self:UpdateTooltip()
	self:UpdateSelection()
	self:UpdateMouseOver()

end


--
function UI.ClanShip_FitSlotWnd:UpdatePart()

	self.partName = UI:GetClanShipEquippedFitPartInSlot( UI.ClanShipWnd:GetShipName(), self.slotName )

end


--
function UI.ClanShip_FitSlotWnd:UpdateIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if not icoEffect then
		return
	end

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if self.partName ~= "" then
		hTex = UI:GetClanShipPartIco( self.partName )
	else	
		hTex = UI:GetClanShipSlotIco( self.slotName )
	end	

	icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	
end


--
function UI.ClanShip_FitSlotWnd:UpdateTier()

	local tier = -1

	if self.partName ~= "" then
    	tier = UI:GetClanShipPartTier( self.partName )
	end

	if tier ~= -1 then

		self:SetLayerVisible( true, self.layers.TIER )

		local strTier = UI:Tier2Str( tier )
		self:SetText( strTier, self.layers.TIER )

	else
		self:SetLayerVisible( false, self.layers.TIER )
	end

end


--
function UI.ClanShip_FitSlotWnd:UpdateBuildingEffect()

	local bBuilding = false

	local shipName = UI.ClanShipWnd:GetShipName()

	local buildingSlot	= UI:GetClanShipBuildingFitSlot( shipName )
	local gatheringSlot	= UI:GetClanShipGatheringMoneyFitSlot( shipName )

	if buildingSlot == self.slotName or gatheringSlot == self.slotName then
		bBuilding = true
	end

	self:SetLayerVisible( bBuilding, self.layers.BUILDING_EFFECT )

end


--
function UI.ClanShip_FitSlotWnd:UpdateTooltip()

	self.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE }

	if self.partName ~= "" then

		self.tooltipData.caption	= UI:ClanShipPart2Str( self.partName, true )
		self.tooltipData.text		= UI:GetClanShipPartDesc( self.partName )

	else

		self.tooltipData.caption	= UI:ClanShipSlot2Str( self.slotName )
		self.tooltipData.text		= UI:GetClanShipSlotDesc( self.slotName )

	end

end


--
function UI.ClanShip_FitSlotWnd:UpdateSelection()

	self:SetLayerVisible( self.bSelected, self.layers.SELECTION_EFFECT )

end


--
function UI.ClanShip_FitSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if UI:IsRightsToBuildClanShip() then

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		if wndUnderMouse then
			bMouseOver = wndUnderMouse == self
		end

	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ClanShip_FitSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ClanShipWnd.sounds.fitSlotMouseOver )
	end

	if bMouseOver ~= bWasMouseOver then
		UI.ClanShip_FitSlotsWnd:OnSlotMouseOverChanged( self )
	end

end


--
function UI.ClanShip_FitSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ClanShip_FitSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ClanShip_FitSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()
	self:UpdateEffects()

end


--
function UI.ClanShip_FitSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanShip_FitSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:UpdatePos()
	end

end


-- -------------------------------------------------------------------
-- UI.ClanShip_FitLinkWnd
-- -------------------------------------------------------------------

UI.ClanShip_FitLinkWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_FitLinkWnd.def =
{
    className	= "Wnd",

	props =
	{
		name		= "ClanShip_FitLinkWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_FitLinkWnd:Setup( slotWnd )

	self:Reset()

	self.slotWnd = slotWnd
	self:FullUpdate()

end


--
function UI.ClanShip_FitLinkWnd:Reset()

	self.slotWnd = nil

	self:ReleaseParts()

end


--
function UI.ClanShip_FitLinkWnd:GetSlotWnd()

	return self.slotWnd

end


-- -------------------------------
-- const
-- -------------------------------

UI.ClanShip_FitLinkWnd.layers =
{
	MAIN	= 0,
}

UI.ClanShip_FitLinkWnd.effectInfo =
{
	effects =
	{
    	hrz		= "ships_link_hrz",
    	vrt		= "ships_link_vrt",
    	lt		= "ships_link_lt",
    	rt		= "ships_link_rt",
    	mark	= "clanShip_fitSlotLink_mark",
	},

	part =
	{
		animIdle 	= "white",
	},

	mark =
	{	
		animIdle	= "idle"
	},	
}

-- -------------------------------
-- vars
-- -------------------------------

UI.ClanShip_FitLinkWnd.slotWnd		= nil
UI.ClanShip_FitLinkWnd.partSize		= Vec2( 0, 0 )
UI.ClanShip_FitLinkWnd.markSize		= Vec2( 0, 0 )

-- -------------------------------
-- wark functions
-- -------------------------------

--
function UI.ClanShip_FitLinkWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then

    	local partEffect = _G.UI_SpawnEffect( self.effectInfo.effects.hrz, self:GetUiHandle() )
    	if partEffect then
    		self.partSize = partEffect:GetObjSize( "self" )
    		_G.UI_DestroyEffect( partEffect )
    	end	

    	local markEffect = _G.UI_SpawnEffect( self.effectInfo.effects.mark, self:GetUiHandle() )
    	if markEffect then
    		self.markSize = markEffect:GetObjSize( "self" )
    		_G.UI_DestroyEffect( markEffect )
    	end			

	end

end


--
function UI.ClanShip_FitLinkWnd:FullUpdate()

	self:UpdateLayout()

end


--
function UI.ClanShip_FitLinkWnd:ReleaseParts()

	local effectsPool = self:GetEffectsPool( self.layers.MAIN )
	if effectsPool then
		effectsPool:Clear()
	end	

end


--
function UI.ClanShip_FitLinkWnd:UpdateLayout()

	self:ReleaseParts()

	if not self.slotWnd then
		return
	end

	local pool = self:GetEffectsPool( self.layers.MAIN )
	if not pool then
		return
	end


	local selfRect = UI:Quat( 0, 0, UI.ClanShip_FitSlotsWnd:GetWidth(), UI.ClanShip_FitSlotsWnd:GetHeight() )
	self:SetRect( selfRect )


	local slotRect = self.slotWnd:GetRect()
	local linkOrg = self.slotWnd:GetLinkPos()

	local listSlotPos	= Vec2( slotRect.x + linkOrg.x, slotRect.y + linkOrg.y )				-- позиция ui-слота
	local shipSlotPos	= UI.ClanShip_FitSlotsWnd:GetSlotShipPos( self.slotWnd:GetSlotName() )	-- позиция слота корабля

	local halfPartSize = Vec2( self.partSize.x * 0.5, self.partSize.y * 0.5 )

	local bNeedHrz = math.abs( shipSlotPos.x - listSlotPos.x ) > halfPartSize.x

	if not bNeedHrz then
		shipSlotPos.x = listSlotPos.x
	end

	local partsData = {}

	if bNeedHrz then

		local vrtLine = {}
			vrtLine.effectName	= self.effectInfo.effects.vrt
			vrtLine.animation	= self.effectInfo.part.animIdle
			vrtLine.pos			= Vec2( UI:XRel2Snapped( listSlotPos.x - halfPartSize.x ), UI:YRel2Snapped( shipSlotPos.y + halfPartSize.y ) )
			vrtLine.scale		= Vec2( 1, ( listSlotPos.y - vrtLine.pos.y ) / self.partSize.y )
		table.insert( partsData, vrtLine )

		local angle = {}
			angle.effectName	= shipSlotPos.x > listSlotPos.x and self.effectInfo.effects.lt or self.effectInfo.effects.rt
			angle.animation		= self.effectInfo.part.animIdle
			angle.pos			= Vec2( UI:XRel2Snapped( listSlotPos.x - halfPartSize.x ), UI:YRel2Snapped( shipSlotPos.y - halfPartSize.y ) )
			angle.scale			= Vec2( 1, 1 )
		table.insert( partsData, angle )

		local hrzLine = {}

			hrzLine.effectName	= self.effectInfo.effects.hrz
			hrzLine.animation	= self.effectInfo.part.animIdle

			if shipSlotPos.x > listSlotPos.x then
				hrzLine.pos		= Vec2( UI:XRel2Snapped( listSlotPos.x + halfPartSize.x ), UI:YRel2Snapped( shipSlotPos.y - halfPartSize.y ) )
				hrzLine.scale	= Vec2( ( UI:XRel2Snapped( shipSlotPos.x ) - hrzLine.pos.x ) / self.partSize.x, 1 )
			else
				hrzLine.pos		= Vec2( UI:XRel2Snapped( shipSlotPos.x ), UI:YRel2Snapped( shipSlotPos.y - halfPartSize.y ) )
				hrzLine.scale	= Vec2( ( UI:XRel2Snapped( listSlotPos.x - halfPartSize.x ) - hrzLine.pos.x ) / self.partSize.x, 1 )
			end

		table.insert( partsData, hrzLine )

	else

		local vrtLine = {}
			vrtLine.effectName	= self.effectInfo.effects.vrt
			vrtLine.animation	= self.effectInfo.part.animIdle
			vrtLine.pos			= Vec2( UI:XRel2Snapped( listSlotPos.x - halfPartSize.x ), UI:YRel2Snapped( shipSlotPos.y ) )
			vrtLine.scale		= Vec2( 1, ( listSlotPos.y - vrtLine.pos.y ) / self.partSize.y )
		table.insert( partsData, vrtLine )

	end

	local mark = {}
		mark.effectName	= self.effectInfo.effects.mark
		mark.animation	= self.effectInfo.mark.animIdle
		mark.pos		= Vec2( UI:XRel2Snapped( shipSlotPos.x - self.markSize.x * 0.5 ), UI:YRel2Snapped( shipSlotPos.y - self.markSize.y * 0.5 ) )
		mark.scale		= Vec2( 1, 1 )
	table.insert( partsData, mark )


	local handle = self:GetUiHandle()

	for partIdx, partData in pairs( partsData ) do

		local effect = pool:AddEffect( partData.effectName, handle )
		if effect then

			effect:StartAnimation( partData.animation )
			effect:SetPos( partData.pos )
			effect:SetScale( partData.scale )

		else
			sys.log( "UI.ClanShip_FitLinkWnd:Tour_UpdateParts()[ERROR]; cannot create effect \"%s\"", partData.effectName )
		end

	end 

end


-- -------------------------------------------------------------------
-- UI.ClanShip_FitPartsListWnd
-- -------------------------------------------------------------------

UI.ClanShip_FitPartsListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_FitPartsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name		= "ClanShip_FitPartsListWnd",
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
				defName 			= "clanShip_fitParts_list",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ClanShip_FitPartsListWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.ClanShip_FitParts_CrossBtn",
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
		},  
	},

	children = { "UI.ClanShip_FitParts_CrossBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_FitPartsListWnd:Setup( slotName )

	if type( slotName ) ~= "string" then
		sys.log( "UI.ClanShip_FitPartsListWnd:Setup()[ERROR]; invalid type of the 1-st parameter (\"slotName\"); \"string\" expected, got \"%s\"", type( slotName ) )
		return
	end

	if slotName == self.slotName then
		return
	end

	self:Clear()

	self.slotName = slotName
	self:FullUpdate()

end


--
function UI.ClanShip_FitPartsListWnd:Reset()

	self.slotName = ""
	self:SetText( "", self.layers.CAPTION )

	self:Clear()
	
end


--
function UI.ClanShip_FitPartsListWnd:OnShipBuildStateChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSlots( true )

end


--
function UI.ClanShip_FitPartsListWnd:OnOtherShipBuildStateChanged( shipName )

	if not self:IsOnScreen() then
		return
	end
	
	for recordIdx = 1, self:GetNumRecords() do
		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnOtherShipBuildStateChanged( shipName )
		end
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_FitPartsListWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
}

UI.ClanShip_FitPartsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
	}
}

UI.ClanShip_FitPartsListWnd.btnPrototypeName	= "ClanShip_FitPartSlotWnd"
UI.ClanShip_FitPartsListWnd.MAX_SLOTS			= 4
UI.ClanShip_FitPartsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_FitPartsListWnd.slotName	= ""

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_FitPartsListWnd:FullUpdate()

	self:UpdateSlots( false )
	self:UpdateCaption()

end


--
function UI.ClanShip_FitPartsListWnd:UpdateSlots( bRestoreScrollPos )

	self:Clear()

	if self.slotName == "" then
		return
	end

	local oldScrollPos = self:GetScrollPos()

	local buildInfo	= UI:GetClanShipData( UI.ClanShipWnd:GetShipName() )
	local partNames	= self:GetPartNames( buildInfo )

	for recordIdx = 1, #partNames do

		local partInfo = partNames[ recordIdx ]

		local data = 
		{			
			partName			= partInfo.partName,
			nextLevelPartName	= partInfo.nextLevelPartName,
			upgradeLevel		= partInfo.upgradeLevel,
			partState			= self:DetectPartState( partInfo.partName, partInfo.nextLevelPartName, buildInfo ),
		}

		self:AddRecord( data )		

	end     


	local scrollPos = -1

	if bRestoreScrollPos then

		scrollPos = oldScrollPos

	else

    	-- установка скролла таким образом, чтобы экипированный модуль был первым видимым по возможности

    	local equippedRecordIdx = -1

    	for recordIdx = 1, self:GetNumRecords() do

    		local data = self:GetRecordData( recordIdx )
    		if data.partState.bEquipped then

    			equippedRecordIdx = recordIdx
    			break

    		end

    	end

    	if equippedRecordIdx ~= -1 then
			scrollPos = equippedRecordIdx
    	end	

	end

	if scrollPos ~= -1 then
		self:SetScrollPos( scrollPos )
	end	

end


--
function UI.ClanShip_FitPartsListWnd:GetPartNames( buildInfo )

	local partNames = {}

	local shipName = UI.ClanShipWnd:GetShipName()

	if type( _G.ClanShipDefs ) ~= "table" then
		sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs\"; \"table\" expected, got \"%s\"", type( _G.ClanShipDefs ) )
		return partNames
	end

	local shipDef = _G.ClanShipDefs[ shipName ]
	if type( shipDef ) ~= "table" then
		sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"]\"; \"table\" expected, got \"%s\"", shipName, type( shipDef ) )
		return partNames
	end

	local partNamesMap = {}

	if type( shipDef.slots ) == "table" then

		local partsInfo = shipDef.slots[ self.slotName ]
		if type( partsInfo ) == "table" then

			if type( partsInfo.upgrade_lines ) == "table" then

    			for partIdx, partInfo in ipairs( partsInfo.upgrade_lines ) do

    				local partName			= ""
					local nextLevelPartName	= ""
					local level				= -1

    				if type( partInfo ) == "string" then

						partName	= partInfo
						level		= 1

    				elseif type( partInfo ) == "table" then

						local numUpgrades = #partInfo
						for upgradeLevel = 1, numUpgrades do

							local upgradePartName = partInfo[ upgradeLevel ]
							local nextPartName = ""

							if type( upgradePartName ) == "string" then

								if upgradeLevel < numUpgrades then

									nextPartName = partInfo[ upgradeLevel + 1 ]

									if type( nextPartName ) ~= "string" then
    									sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots[%s].upgrade_lines[%s][%s]\"; \"string\" expected, got \"%s\"", shipName, self.slotName, tostring( partIdx ), tostring( upgradeLevel + 1 ), type( nextPartName ) )
										nextPartName = ""
									end

								end

    							local upgradepartState = self:DetectPartState( upgradePartName, nextPartName, buildInfo )
								if upgradepartState.bBuilt then

    								partName			= upgradePartName                      
									nextLevelPartName	= nextPartName
									level				= upgradeLevel

									break

    							end

							else
    							sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots[%s].upgrade_lines[%s][%s]\"; \"string\" expected, got \"%s\"", shipName, self.slotName, tostring( partIdx ), tostring( upgradeLevel ), type( upgradePartName ) )
							end

						end

						if partName == "" then

							local firstLevelPartName = partInfo[ 1 ]
							if type( firstLevelPartName ) == "string" then

								partName	= firstLevelPartName
								level		= 1

								if type( partInfo[ 2 ] ) == "string" then
									nextLevelPartName = partInfo[ 2 ]
								end

							end

						end

    				else
    					sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots[%s].upgrade_lines[%s]\"; \"string\" or \"table\" expected, got \"%s\"", shipName, self.slotName, tostring( partIdx ), type( partInfo ) )
    				end

					if partName ~= "" then						

						if not partNamesMap[ partName ] then
    						table.insert( partNames, { partName = partName, nextLevelPartName = nextLevelPartName, upgradeLevel = level } )
							partNamesMap[ partName ] = true
						else
							sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: duplicate part \"%s\" for slot \"%s\" ship \"%s\"", partName, self.slotName, shipName )
						end

					end

    			end

			else
				sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots[%s].upgrade_lines\"; \"table\" expected, got \"%s\"", shipName, self.slotName, type( partsInfo.upgrade_lines ) )
				return partNames
			end

		else
			sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots[%s]\"; \"table\" expected, got \"%s\"", shipName, self.slotName, type( partsInfo ) )
			return partNames
		end

	else
		sys.log( "UI.ClanShip_FitPartsListWnd:GetPartNames()[ERROR]: invalid type of \"_G.ClanShipDefs[\"%s\"].slots\"; \"table\" expected, got \"%s\"", shipName, type( shipDef.slots ) )
		return partNames
	end

	return partNames

end


--
function UI.ClanShip_FitPartsListWnd:DetectPartState( partName, nextLevelPartName, buildInfo )

	local partState =
	{
		bBuilt			= false,
		bBuilding		= false,
		bUpgrading		= false,
		bGotheringMoney	= false,
		bEquipped		= false,		
	}

	local shipName = UI.ClanShipWnd:GetShipName()

	local timeLeft, buildingPartName, buildingSlotName = _G.MasterServer_ClanShipGetProductionProgress( shipName ) 
	if buildingSlotName == self.slotName and buildingPartName == partName then

		partState.bBuilding = true
		return partState

	end

	local gatheringPartName, gatheringSlotName = _G.MasterServer_ClanShipGetPendedPart( shipName )
	if gatheringSlotName == self.slotName and gatheringPartName == partName then

		partState.bBuilding = true
		partState.bGotheringMoney = true
		return partState

	end

	if not buildInfo then
		buildInfo = UI:GetClanShipData( shipName )
	end

	if type( buildInfo ) == "table" then

		if buildInfo.moduleSlots ~= nil then
    		if type( buildInfo.moduleSlots ) == "table" then

				local slotInfo = buildInfo.moduleSlots[ self.slotName ]

				if slotInfo ~= nil then
					if type( slotInfo ) == "table" then

                		if slotInfo.fit == partName then
							partState.bEquipped = true
							partState.bBuilt = true
                		end

						-- здесь лежат не только построенные, но и строящаяся в данный момент часть, но она отсеялась выше
                		if slotInfo.built ~= nil then
                			if type( slotInfo.built ) == "table" then

                				for builtpartIdx, builtPartName in pairs( slotInfo.built ) do

									-- во время таймера апгрейда предыдущий уровень не считается построенным,
									-- вместо него считается построенным уровень, который апгрейдится

                					if	( builtPartName == partName ) or
										( builtPartName == nextLevelPartName and nextLevelPartName == buildingPartName and buildingSlotName == self.slotName ) then
											partState.bBuilt = true
                							break
                					end

                				end

                			else
                				sys.log( "UI.ClanShip_FitPartsListWnd:DetectPartState()[ERROR]: invalid type of field \"moduleSlots[\"%s\"].built\"; \"table\" or \"nil\" expected, got \"%s\"", self.slotName, type( slotInfo.built ) )
                			end
                		end	
					else
                		sys.log( "UI.ClanShip_FitPartsListWnd:DetectPartState()[ERROR]: invalid type of field \"moduleSlots[\"%s\"]\"; \"table\" or \"nil\" expected, got \"%s\"", self.slotName, type( slotInfo ) )
					end
				end
			else
        		sys.log( "UI.ClanShip_FitPartsListWnd:DetectPartState()[ERROR]: invalid type of field \"moduleSlots\"; \"table\" or \"nil\" expected, got \"%s\"", type( buildInfo.moduleSlots ) )
			end
		end

	else
		sys.log( "UI.ClanShip_FitPartsListWnd:DetectPartState()[ERROR]: invalid type of return value #1 from UI:GetClanShipData(); \"table\" expected, got \"%s\"", type( buildInfo ) )
	end

	if partState.bBuilt and nextLevelPartName ~= "" then

    	if buildingSlotName == self.slotName and buildingPartName == nextLevelPartName then
    		partState.bUpgrading = true

    	elseif gatheringSlotName == self.slotName and gatheringPartName == nextLevelPartName then
    		partState.bUpgrading = true
			partState.bGotheringMoney = true
    	end

	end

	return partState

end


--
function UI.ClanShip_FitPartsListWnd:UpdateCaption()

	local str = UI:ClanShipSlot2Str( self.slotName )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ClanShip_FitPartsListWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end


--
function UI.ClanShip_FitPartsListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.ClanShip_FitPartsListWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ClanShip_FitPartsListWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:UpdatePos()
	end

end


-- ------------------------------------------------------------------------
-- UI.ClanShip_FitParts_CrossBtn
-- ------------------------------------------------------------------------

UI.ClanShip_FitParts_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "ClanShip_FitParts_CrossBtn"
    	}
	}
}

-- -------------------------------------------------------------------
-- UI.ClanShip_FitPartSlotWnd
-- -------------------------------------------------------------------

UI.ClanShip_FitPartSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.ClanShip_FitPartSlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    EQUIPPED_EFFECT		= 1,
    NAME				= 2,
    BUILDING			= 3,
	UPGRADING			= 4,
    PRICE				= 5,
    INACTIVE_EFFECT		= 6,
    MOUSE_OVER_EFFECT	= 7,
}   


--
UI.ClanShip_FitPartSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "ClanShip_FitPartSlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ClanShip_FitPartSlotWnd.layers.INACTIVE_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "clanShip_fitParts_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "product_name",
						layer		= "UI.ClanShip_FitPartSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text10",
						layer		= "UI.ClanShip_FitPartSlotWnd.layers.BUILDING",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по позиции
					{
						objName		= "price",
						layer		= "UI.ClanShip_FitPartSlotWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "select",
						layer		= "UI.ClanShip_FitPartSlotWnd.layers.EQUIPPED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blackout",
						layer		= "UI.ClanShip_FitPartSlotWnd.layers.INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ClanShip_FitPartSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по позиции
					{
						objName		= "text10",
						layer		= "UI.ClanShip_FitPartSlotWnd.layers.UPGRADING",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- EQUIPPED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "clanShip_fitParts_equipped",
				defaultAnimation	= "idle",
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- BUILDING
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanShip_fitPart_building" ),
		},  

		-- UPGRADING
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanShip_fitPart_upgrading" ),
		},  

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- INACTIVE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "clanShip_fitParts_inactive",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "clanShip_fitParts_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_FitPartSlotWnd:Reset()

	self:SetLayerVisible( false, self.layers.EQUIPPED_EFFECT )
	self:SetLayerVisible( false, self.layers.BUILDING )
	self:SetLayerVisible( false, self.layers.UPGRADING )
	self:SetLayerVisible( false, self.layers.INACTIVE_EFFECT )

	self:SetText( "", self.layers.NAME )

	self:SetLayerVisible( false, self.layers.PRICE )
	self.priceMetaText:SetText( "", true )

	self.icoWnd:Reset()
	self:RemoveControl( self.buildBtn, self.layers.MAIN_EFFECT )	
	self:RemoveControl( self.unequipBtn, self.layers.MAIN_EFFECT )
	self:RemoveControl( self.upgradeBtn, self.layers.MAIN_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	self:SetMouseOver( false )

end


--
function UI.ClanShip_FitPartSlotWnd:OnOtherShipBuildStateChanged( shipName )

	local data = self:GetRecordData()
	
	self:UpdateBuildBtn( data )
	self:UpdateUpgradeBtn( data )
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_FitPartSlotWnd.effectInfo =
{
	main =
	{
		icoLocator			= "icon",
		buildBtnLocator		= "btn_1",
		unequipBtnLocator	= "btn_1",
		upgradeBtnLocator	= "btn_1",
		upgradeBtnLocator2	= "btn_10",
		animIdle			= "idle",
		animNotBuilt		= "disable",
		priceLocator		= "price",
		priceLocator2		= "price7",
		upgradingLocator	= "text10",
		upgradingLocator2	= "price",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_FitPartSlotWnd.priceMetaText	= nil
UI.ClanShip_FitPartSlotWnd.icoWnd			= nil
UI.ClanShip_FitPartSlotWnd.buildBtn			= nil
UI.ClanShip_FitPartSlotWnd.unequipBtn		= nil
UI.ClanShip_FitPartSlotWnd.upgradeBtn		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_FitPartSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 	

	self:Reset()

end


--
function UI.ClanShip_FitPartSlotWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ClanShip_FitPartSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()
	self:UpdateMetaTextPos()
	self:UpdateMouseOver()

end


--
function UI.ClanShip_FitPartSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
		self:UpdateMetaTextPos()
	end

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.ClanShip_FitPartSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:UpdatePos()
	end

end


--
function UI.ClanShip_FitPartSlotWnd:CreateControls()

	self.icoWnd		= UI:CreateChildWnd( self, UI.ClanShip_FitPart_IcoWnd, "" )
	self.buildBtn	= UI:CreateChildWnd( self, UI.ClanShip_FitPart_BuildBtn, "" )
	self.unequipBtn	= UI:CreateChildWnd( self, UI.ClanShip_FitPart_UnequipBtn, "" )
	self.upgradeBtn	= UI:CreateChildWnd( self, UI.ClanShip_FitPart_UpgradeBtn, "" )

	self:AddControl( self.icoWnd, self.layers.MAIN_EFFECT, self.effectInfo.main.icoLocator )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdateName( data )
	self:UpdateIco( data ) 
	self:UpdateBuildingState( data ) 
	self:UpdateUpgradingState( data )
	self:UpdatePrice( data ) 
	self:UpdateBuildBtn( data ) 
	self:UpdateUnequipBtn( data ) 
	self:UpdateUpgradeBtn( data ) 
	self:UpdateEquippedEffect( data )
	self:UpdateInactiveEffect( data )
	self:UpdateMouseOver()

	self:RecalcLayout()

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = not data.partState.bBuilt and self.effectInfo.main.animNotBuilt or self.effectInfo.main.animIdle
	mainEffect:StartAnimation( anim )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateName( data )

	local str = UI:ClanShipPart2Str( data.partName, true )
	self:SetText( str, self.layers.NAME )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateIco( data ) 

	-- иконка

	local hTex = UI:GetClanShipPartIco( data.partName )
	self.icoWnd:SetIco( hTex )

	-- тултип

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:ClanShipPart2Str( data.partName, true ),
		text		= UI:GetClanShipPartDesc( data.partName ),
	}

	self.icoWnd:SetTooltipData( tooltipData )

	-- тир

	local tier = UI:GetClanShipPartTier( data.partName )
	self.icoWnd:SetTier( tier )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateBuildingState( data ) 

	self:SetLayerVisible( data.partState.bBuilding, self.layers.BUILDING )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateUpgradingState( data ) 

	self:SetLayerVisible( data.partState.bUpgrading, self.layers.UPGRADING )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdatePrice( data ) 

	local bBuild	= self:NeedBuildBtn( data )
	local bUpgrade	= self:NeedUpgradeBtn( data )

	local bNeedPrice = bBuild or bUpgrade

	if not bNeedPrice then
		self:SetLayerVisible( false, self.layers.PRICE )
		self.priceMetaText:SetText( "", true )
		return
	end

	self:SetLayerVisible( true, self.layers.PRICE )

	local bUpgradeFit = false

	if bBuild then
		bUpgradeFit = data.upgradeLevel <= cvars.clan_shipUpgradeCanBuild

	elseif bUpgrade then
		local nextPartUpgradelevel = data.upgradeLevel + 1
		bUpgradeFit = nextPartUpgradelevel <= cvars.clan_shipUpgradeCanBuild
	end

	local str = ""

	if bUpgradeFit then

    	local partName = bUpgrade and data.nextLevelPartName or data.partName
    	local price = UI:GetClanShipPartPrice( partName )

    	local priceInfo =
    	{
    		priceType	= _G.GameStore.CreditsType.CT_TOKENS,
    		val			= price,
    		bIsBuyPrice	= false,	
    	}

    	str = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, nil )

	else
		str = UI:GetStringByName( "clanship_cantBuild" )
	end

	self.priceMetaText:SetText( str, true )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateBuildBtn( data ) 

	local bCanBuildPart = self:NeedBuildBtn( data )

	if not bCanBuildPart then
		self:RemoveControl( self.buildBtn, self.layers.MAIN_EFFECT )
		return
	end

	self:AddControl( self.buildBtn, self.layers.MAIN_EFFECT, self.effectInfo.main.buildBtnLocator )
	
	local bIsShipBuilding = UI:GetClanShipBuildingOrGatheringMoney() ~= ""	-- нельзя строить одновременно несколько #0104977(0488106)

	local bUpgradeFit = data.upgradeLevel <= cvars.clan_shipUpgradeCanBuild

	local bEnable = not bIsShipBuilding and bUpgradeFit
	self.buildBtn:SetGray( not bEnable )	

	local tooltipData = nil

	if not bUpgradeFit then
	
		tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "clanship_highTierTooltip_caption" ),
			text		= UI:GetStringByName( "clanship_highTierTooltip_text" ),
		}
		
	elseif bIsShipBuilding then
		tooltipData = UI.ClanShipWnd:GetTooltipData_CantBuildMultiple()
	end

	self.buildBtn:SetTooltipData( tooltipData )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateUnequipBtn( data ) 

	if data.partState.bEquipped and not UI:IsClanShipFitSlotAutofit( UI.ClanShipWnd:GetShipName(), UI.ClanShipWnd:GetSelFitSlotName() ) then
		self:AddControl( self.unequipBtn, self.layers.MAIN_EFFECT, self.effectInfo.main.unequipBtnLocator )
	else
		self:RemoveControl( self.unequipBtn, self.layers.MAIN_EFFECT )
	end

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateUpgradeBtn( data ) 

	local bCanUpgrade = self:NeedUpgradeBtn( data )

	if not bCanUpgrade then
		self:RemoveControl( self.upgradeBtn, self.layers.MAIN_EFFECT )
		return
	end

	self:AddChild( self.upgradeBtn )
	
	local bIsShipBuilding = UI:GetClanShipBuildingOrGatheringMoney() ~= ""	-- нельзя строить одновременно несколько #0104977(0488106)

	local nextPartUpgradelevel = data.upgradeLevel + 1
	local bUpgradeFit = nextPartUpgradelevel <= cvars.clan_shipUpgradeCanBuild

	local bEnable = not bIsShipBuilding and bUpgradeFit
	self.upgradeBtn:SetGray( not bEnable )

	local tooltipData = nil

	if not bUpgradeFit then
	
		tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "clanship_highTierTooltip_caption" ),
			text		= UI:GetStringByName( "clanship_highTierTooltip_text" ),
		}
		
	elseif bIsShipBuilding then
		tooltipData = UI.ClanShipWnd:GetTooltipData_CantBuildMultiple()
	end

	self.upgradeBtn:SetTooltipData( tooltipData )

end    


--
function UI.ClanShip_FitPartSlotWnd:UpdateEquippedEffect( data )

	self:SetLayerVisible( data.partState.bEquipped, self.layers.EQUIPPED_EFFECT )

end


--
function UI.ClanShip_FitPartSlotWnd:UpdateInactiveEffect( data )

	local bInactive = data.partState.bBuilding
	self:SetLayerVisible( bInactive, self.layers.INACTIVE_EFFECT )

end


--
function UI.ClanShip_FitPartSlotWnd:RecalcLayout()

	local bIsUnequipBtn = self.unequipBtn:IsChildOf( self )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if self.upgradeBtn:IsChildOf( self ) then

		local upgradeBtnLocator = bIsUnequipBtn and self.effectInfo.main.upgradeBtnLocator2 or self.effectInfo.main.upgradeBtnLocator
		local upgradeBtnHandle = self.upgradeBtn:GetUiHandle()

    	if mainEffect then
        	mainEffect:UnlinkWnd( upgradeBtnHandle, "" )
			mainEffect:LinkWnd( upgradeBtnHandle, upgradeBtnLocator, UI.EffectAnimParams.POS )
    	end

	end	

	if self:IsLayerVisible( self.layers.PRICE ) then

		local priceLocator = bIsUnequipBtn and self.effectInfo.main.priceLocator2 or self.effectInfo.main.priceLocator
		local selfHandle = self:GetUiHandle()

    	if mainEffect then
        	mainEffect:UnlinkLayer( selfHandle, self.layers.PRICE, "" )
			mainEffect:LinkLayer( selfHandle, self.layers.PRICE, priceLocator, UI.EffectAnimParams.POS )
		end

		self:UpdateMetaTextPos()

	end	

	if self:IsLayerVisible( self.layers.UPGRADING ) then

		local upgradingLocator = bIsUnequipBtn and self.effectInfo.main.upgradingLocator2 or self.effectInfo.main.upgradingLocator
		local selfHandle = self:GetUiHandle()

    	if mainEffect then
        	mainEffect:UnlinkLayer( selfHandle, self.layers.UPGRADING, "" )
			mainEffect:LinkLayer( selfHandle, self.layers.UPGRADING, self.effectInfo.main.upgradingLocator, UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
			mainEffect:LinkLayer( selfHandle, self.layers.UPGRADING, upgradingLocator, UI.EffectAnimParams.POS )
		end

	end

end


--
function UI.ClanShip_FitPartSlotWnd:NeedBuildBtn( data )

	return not data.partState.bBuilt and not data.partState.bBuilding

end


--
function UI.ClanShip_FitPartSlotWnd:NeedUpgradeBtn( data )

	return data.partState.bBuilt and data.nextLevelPartName ~= "" and not data.partState.bUpgrading

end


--
function UI.ClanShip_FitPartSlotWnd:AddControl( wnd, effectLayer, locatorName )

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
function UI.ClanShip_FitPartSlotWnd:RemoveControl( wnd, effectLayer )

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
function UI.ClanShip_FitPartSlotWnd:UpdateMouseOver()

	local data = self:GetRecordData()

	local bMouseOver = false

	if data and data.partState.bBuilt then

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self

	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ClanShip_FitPartSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ClanShipWnd.sounds.fitPartMouseOver )
	end

end


--
function UI.ClanShip_FitPartSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ClanShip_FitPartSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


-- -------------------------------------------------------------------
-- UI.ClanShip_FitPart_BuildBtn, UI.ClanShip_FitPart_UnequipBtn
-- -------------------------------------------------------------------

--
UI.ClanShip_FitPart_BuildBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn8",

    	props =
    	{
    		name		= "ClanShip_FitPart_BuildBtn",
    		isPrototype	= true,
    	}
	},

	textId = "clanShip_fitPart_build"
}


--
UI.ClanShip_FitPart_UnequipBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn8",

    	props =
    	{
    		name		= "ClanShip_FitPart_UnequipBtn",
    		isPrototype	= true,
    	}
	},

	textId = "clanShip_fitPart_unequip"
}

-- -------------------------------------------------------------------
-- UI.ClanShip_FitPart_UpgradeBtn
-- -------------------------------------------------------------------

local l_numTextBtnLayers = UI:GetTableLength( UI.TextBtn.layers )

UI.ClanShip_FitPart_UpgradeBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn8",

    	props =
    	{
    		name		= "ClanShip_FitPart_UpgradeBtn",
    		isPrototype	= true,
    	},

		layers =
		{
			numLayers = l_numTextBtnLayers + 1,

    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName 			= "textBtn8",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text_1",
    						layer		= "UI.ClanShip_FitPart_UpgradeBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "upgr",
    						layer		= "UI.ClanShip_FitPart_UpgradeBtn.layers.ARROW_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},

    		-- ARROW_EFFECT
    		{
				id			= l_numTextBtnLayers,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "equipment_itemsList_slot_actionBtn_upgradeArrow",
    				defaultAnimation	= "idle",
				}}
			}
		}
	},

	textId = "equipment_upgradeBtn",

	layers =
	{
		MAIN_EFFECT		= 0,
		DEBUG			= 1,
		TEXT			= 2,
		ARROW_EFFECT	= 3,
	}
}

-- -------------------------------------------------------------------
-- UI.ClanShip_FitPart_IcoWnd
-- -------------------------------------------------------------------

UI.ClanShip_FitPart_IcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_FitPart_IcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ClanShip_FitPart_IcoWnd",
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
				defName 			= "clanShip_fitParts_ico",
				defaultAnimation	= "active",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "tier",
						layer		= "UI.ClanShip_FitPart_IcoWnd.layers.TIER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TIER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_shopTypeTier",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.ClanShip_FitPart_IcoWnd.layers.TIER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_FitPart_IcoWnd:SetIco( hTex )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.ClanShip_FitPart_IcoWnd:SetTier( tier )

	if tier ~= -1 then

		self:SetLayerVisible( true, self.layers.TIER_EFFECT )
		self:SetLayerVisible( true, self.layers.TIER )

		local strTier = UI:Tier2Str( tier )
		self:SetText( strTier, self.layers.TIER )

	else

		self:SetLayerVisible( false, self.layers.TIER_EFFECT )
		self:SetLayerVisible( false, self.layers.TIER )

	end

end


--
function UI.ClanShip_FitPart_IcoWnd:Reset()

	self.tooltipData = nil
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.TIER_EFFECT )
	self:SetLayerVisible( false, self.layers.TIER )

end


--
function UI.ClanShip_FitPart_IcoWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.ClanShip_FitPart_IcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_FitPart_IcoWnd.layers =
{
	MAIN_EFFECT	= 0,
	TIER_EFFECT	= 1,
	TIER		= 2,
}

UI.ClanShip_FitPart_IcoWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico"
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ClanShip_FitPart_IcoWnd.tooltipData	= nil


-- -------------------------------------------------------------------
-- UI.ClanShip_PropsWnd
-- -------------------------------------------------------------------

UI.ClanShip_PropsWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_PropsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "ClanShip_PropsWnd",
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
				defName 			= "clanShip_props_list",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ClanShip_PropsWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "descrip",
						layer		= "UI.ClanShip_PropsWnd.layers.SHIP_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title32",
						layer		= "UI.ClanShip_PropsWnd.layers.PROPS_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- SHIP_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- PROPS_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanship_props" )
		},  
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_PropsWnd:OnShipBuildStateChanged()

	self:UpdateProps()

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_PropsWnd.layers =
{
	MAIN_EFFECT		= 0,
    SHIP_NAME		= 1,
    SHIP_DESC		= 2,
    PROPS_HEADER	= 3,
}

UI.ClanShip_PropsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ClanShip_PropsWnd.btnPrototypeName	= "ClanShip_PropSlotWnd"
UI.ClanShip_PropsWnd.MAX_SLOTS			= 4
UI.ClanShip_PropsWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_PropsWnd:Reset()

	self:Clear()

	self:SetText( "", self.layers.SHIP_NAME )
	self:SetText( "", self.layers.SHIP_DESC )

end


--
function UI.ClanShip_PropsWnd:FullUpdate()

	self:Reset()

	self:UpdateShipName()
	self:UpdateShipDesc()
	self:UpdateProps()

end


--
function UI.ClanShip_PropsWnd:UpdateShipName()

	local shipName = UI.ClanShipWnd:GetShipName()
	local str = UI:ClanShip2Str( shipName ) 

	self:SetText( str, self.layers.SHIP_NAME )

end


--
function UI.ClanShip_PropsWnd:UpdateShipDesc()

	local shipName = UI.ClanShipWnd:GetShipName()
	local str = UI:GetClanShipDesc( shipName ) 

	self:SetText( str, self.layers.SHIP_DESC )

end


--
function UI.ClanShip_PropsWnd:UpdateProps()

	self:Clear()

	local vals = self:GetVals()

	for idx, val in ipairs( vals ) do

		local data = { val = val }
		self:AddRecord( data )

	end

end


--
function UI.ClanShip_PropsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ClanShip_PropsWnd:GetVals()

	local vals = {}

	local shipName = UI.ClanShipWnd:GetShipName()
	if shipName == "" then
		sys.log( "UI.ClanShip_PropsWnd:GetVals()[ERROR]: no ship" )
		return vals
	end

	vals = { _G.ClanShipGetParams( shipName ) }
	for idx, val in pairs( vals ) do

		if type( val ) ~= "number" then
			sys.log( "UI.ClanShip_PropsWnd:GetVals()[ERROR]: invalid type of return value #%d from \"_G.ClanShipGetParams()\" for ship \"%s\"; \"number\" expected, got \"%s\"", idx, shipName, type( val ) )
			vals[ idx ] = 0
		end

	end

	return vals

end


-- -------------------------------------------------------------------
-- UI.ClanShip_PropSlotWnd
-- -------------------------------------------------------------------

UI.ClanShip_PropSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_PropSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ClanShip_PropSlotWnd",
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
				defName 			= "clanShip_props_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title29",
						layer		= "UI.ClanShip_PropSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text",
						layer		= "UI.ClanShip_PropSlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_PropSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )
	
	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.VAL )	

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_PropSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    NAME			= 1,
    VAL				= 2,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_PropSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateName( data )
	self:UpdateVal( data )

end


--
function UI.ClanShip_PropSlotWnd:UpdateName( data )

	local strId = string.format( "clanship_prop_name_%d", self:GetRecord() )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.NAME )

end


--
function UI.ClanShip_PropSlotWnd:UpdateVal( data )

	local val = data.val

	local selColor = UI.TEXT_SEL_COLOR
	local str = string.format( "%s%s", UI:Color2Str( selColor ), UI:FNum2StrSeparatedBy3( val ) )

	local strUnits = ""

	local strIdUnits = string.format( "clanship_prop_units_%d", self:GetRecord() ) 

--[[ #0031105
	local hStr = UI:GetResourceHandleByName( strIdUnits, UI.RES_STRING, true )
	if hStr ~= UI.INVALID_RESOURCE_HANDLE then

		local rc = UI:GetResourceByHandle( hStr )
		if rc then
			strUnits = rc:GetStr()
		end

		UI:ReleaseResourceHandle( hStr )

	end
]]

	-- #0031105
	do
		strUnits = UI:GetStringByName( strIdUnits, false ) or ""
	end

	if strUnits ~= "" then
		local baseColor = self:GetColor( self.layers.VAL )
		str = string.format( "%s %s%s", str, UI:Color2Str( baseColor ), strUnits )
	end

	self:SetText( str, self.layers.VAL )

end


-- -------------------------------------------------------------------
-- UI.ClanShip_PropsToggleBtn
-- -------------------------------------------------------------------

UI.ClanShip_PropsToggleBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "ClanShip_PropsToggleBtn",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.btnClick,
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
    				defName 			= "clanShip_propsToggleBtn",
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
	},

    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		animationDisabled	= "idle",
    	},

    	main_checked =
    	{
    		animationIdle 		= "idle_2",
    		animationSelect		= "over_2",
    		animationPressed	= "over_2",
    		animationDisabled	= "idle_2",
    	},
	}
}

-- -------------------------------------------------------------------
-- UI.ClanShip_ShipLocationWnd
-- -------------------------------------------------------------------

UI.ClanShip_ShipLocationWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_ShipLocationWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name	= "ClanShip_ShipLocationWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,

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
				defName 			= "clanShip_location",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text22",
						layer		= "UI.ClanShip_ShipLocationWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "button_1",
						wnd			= "UI.ClanShip_ToMapBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children = { "UI.ClanShip_ToMapBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_ShipLocationWnd:OnClanShipLeaveZone()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()	

end


--
function UI.ClanShip_ShipLocationWnd:OnHangarPrepareStateChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateToMapBtn()
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_ShipLocationWnd.layers =
{
	MAIN_EFFECT	= 0,	
	TEXT		= 1,
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_ShipLocationWnd:Reset()

	self:SetText( "", self.layers.TEXT )
	UI.ClanShip_ToMapBtn:Enable( false )

end


--
function UI.ClanShip_ShipLocationWnd:FullUpdate()

	self:UpdateText()
	self:UpdateToMapBtn()

end


--
function UI.ClanShip_ShipLocationWnd:UpdateText()

	local str = ""

	local zoneId = UI:GetClanShipZone( UI.ClanShipWnd:GetShipName() )

	if zoneId ~= -1 then

		local zoneName = UI:ZoneId2Name( zoneId )

		local zoneLocaizedName = UI:Zone2Str( zoneName )
		zoneLocaizedName = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), zoneLocaizedName, UI:Color2Str( self:GetColor( self.layers.TEXT ) ) )

		str = UI:GetStringByName( "clanShip_isInZone" )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$zone%$", zoneLocaizedName )

		if numSubst == 0 then
			sys.log( "UI.ClanShip_ShipLocationWnd:UpdateText()[ERROR]: cannot find placeholder \"$zone$\" in string \"%s\"", strId )
			str = string.format( "%s %s", str, zoneLocaizedName )
		end

	end

	self:SetText( str, self.layers.TEXT )

end


--
function UI.ClanShip_ShipLocationWnd:UpdateToMapBtn()

	local bEnable =
		UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.MATCHMAKING
		and UI:GetClanShipZone( UI.ClanShipWnd:GetShipName() ) ~= -1

	UI.ClanShip_ToMapBtn:Enable( bEnable )

end


--
function UI.ClanShip_ShipLocationWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ClanShip_ShipLocationWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end

-- -------------------------------------------------------------------
-- UI.ClanShip_ToMapBtn
-- -------------------------------------------------------------------

UI.ClanShip_ToMapBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name	= "ClanShip_ToMapBtn"
    	}
	},

	textId = "clanShip_toMapBtn"
}

-- -------------------------------------------------------------------
-- UI.ClanShip_ShipIconListWnd
-- -------------------------------------------------------------------

UI.ClanShip_ShipIconListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ClanShip_ShipIconListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ClanShip_ShipIconListWnd",
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
				defName 			= "clanShip_shipIconList",
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
	},
}


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_ShipIconListWnd:OnCurrentShipChanged()

	if not self:IsOnScreen() then
		return
	end

	local currentShipName = UI:GetCurrentClanShipName()
	
	for recordIdx = 1, self:GetNumRecords() do
	
		local data = self:GetRecordData( recordIdx )
		local bCurrent = data.shipName == currentShipName
		
		if data.bCurrent ~= bCurrent then
			data.bCurrent = bCurrent
			self:SetRecordData( data, recordIdx )
		end
	
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_ShipIconListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "build_dread_btn_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ClanShip_ShipIconListWnd.btnPrototypeName	= "ClanShip_ShipIconSlotWnd"
UI.ClanShip_ShipIconListWnd.MAX_SLOTS			= 3
UI.ClanShip_ShipIconListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_ShipIconListWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ClanShip_ShipIconListWnd:FullUpdate()
	
	self:UpdateSlots()
	self:UpdateSelection()

end


--
function UI.ClanShip_ShipIconListWnd:UpdateSlots()

	self:Clear()
	
	local currentShipName = UI:GetCurrentClanShipName()
	
	local shipNames = UI:GetAllClanShipNames()
	for shipIdx, shipName in ipairs( shipNames ) do
	
		local data =
		{
			shipName	= shipName,
			bCurrent	= shipName == currentShipName,
		}
	
		self:AddRecord( data )
		
	end

end


--
function UI.ClanShip_ShipIconListWnd:UpdateSelection()

	local selShipName = UI.ClanShipWnd:GetShipName()
	
	local selRecordIdx = 1
	
	for recordIdx = 1, self:GetNumRecords() do
		if self:GetRecordData( recordIdx ).shipName == selShipName then
			selRecordIdx = recordIdx
			break
		end
	end
	
	self:SelectRecord( selRecordIdx )

end


-- -------------------------------------------------------------------
-- UI.ClanShip_ShipIconSlotWnd
-- -------------------------------------------------------------------

UI.ClanShip_ShipIconSlotWnd = {}

-- ------------------------------
-- window definition 
-- ------------------------------

UI.ClanShip_ShipIconSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ClanShip_ShipIconSlotWnd",
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
				defName 			= "clanShip_shipIconSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				
					{
						objName		= "sel",
						layer		= "UI.ClanShip_ShipIconSlotWnd.layers.SELECTION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text23",
						layer		= "UI.ClanShip_ShipIconSlotWnd.layers.CURRENT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- SELECTION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "clanShip_shipIconSlot_selection",
				defaultAnimation	= "idle",
			}}
		},

		-- CURRENT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "clanShip_shipIcon_current" ),
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ClanShip_ShipIconSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetLayerVisible( false, self.layers.CURRENT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.ClanShip_ShipIconSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	self:UpdateSelection()
	self:UpdateMouseOver()
	
end


-- ------------------------------
-- const
-- ------------------------------

UI.ClanShip_ShipIconSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	SELECTION_EFFECT	= 1,
	CURRENT				= 2,
}

UI.ClanShip_ShipIconSlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
		animIdle		= "idle",
		animMouseOver	= "over",
	}
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ClanShip_ShipIconSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateCurrentState( data )
	self:UpdateSelection()
	self:UpdateMouseOver()

end


--
function UI.ClanShip_ShipIconSlotWnd:UpdateIco( data )

	local hTex = UI:GetClanShipIcoSmall( data.shipName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.ClanShip_ShipIconSlotWnd:UpdateCurrentState( data )	
	
	self:SetLayerVisible( data.bCurrent, self.layers.CURRENT )
	
end


--
function UI.ClanShip_ShipIconSlotWnd:UpdateSelection()

	self:SetLayerVisible( self:IsSelected(), self.layers.SELECTION_EFFECT )
	
end


--
function UI.ClanShip_ShipIconSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ClanShip_ShipIconSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if not self:IsSelected() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ClanShip_ShipIconSlotWnd:SetMouseOver( bMouseOver )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local bWasMouseOver = mainEffect:GetCurAnimation() == self.effectInfo.main.animMouseOver
	
	local anim = bMouseOver and self.effectInfo.main.animMouseOver or self.effectInfo.main.animIdle
	mainEffect:StartAnimation( anim )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ClanShipWnd.sounds.shipMouseOver )
	end

end


--
function UI.ClanShip_ShipIconSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ClanShip_ShipIconSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end

-- -------------------------------------------------------------------
-- UI.ClanShip_SetCurrentShipBtn
-- -------------------------------------------------------------------

UI.ClanShip_SetCurrentShipBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "ClanShip_SetCurrentShipBtn"
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
					defName 			= "clanShip_setCurrentShipBtn",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text23",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
	
	textId = "clanShip_setCurrentShipBtn",
	
	effectInfo =
	{
		main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "over",	-- нет отдельной анимации нажатия
			animationDisabled		= "disable",
			animationIdle_focus 	= "idle",
			animationSelect_focus	= "over",
			animationPressed_focus	= "over",
		},
	}
}