-- ----------------------------------------------------------------------------
--
-- Workfile: HudAdventureWnd.lua
-- Copyright 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.HudAdventureWnd = {}

local haw = UI.HudAdventureWnd

UI.HudAdventureWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudAdventureWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
		rectAbs	= Quat( 0, 0, 1024, 768 ),
	},
}


--haw.advWnd = nil
UI.HudAdventureWnd.advWnd 		= nil
UI.HudAdventureWnd.giverObject 	= nil

UI.HudAdventureWnd.editWnd		= nil

UI.HudAdventureWnd.requestAtid	= -1

UI.HudAdventureWnd.isActive		= false


--
function UI.HudAdventureWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.advWnd = UI:CreateChildWnd( self, UI.AdventureWnd, "" )
	self:Reset()

end


--
function UI.HudAdventureWnd:F_OnAfterShowOnScreen()

	-- ≈сли изменили разрешение экрана, то провер€ем наличие взаимодействи€ с гивером
	local interactionType, progress, entId = _G.CL_GetLocalPlayerInteraction()

	-- ≈сли взаимодействие с гивером есть, то создаЄм окно приключений
	if interactionType == ai.InteractionType.ADVENTURE_GIVER then
		
		local giverObject = _G.Entities[ entId ]

		self:CreateWnd( giverObject )

	else

		self:Reset()

	end

end


--
function UI.HudAdventureWnd:OnInteractionStart( interactionType, crateEnt )

	if interactionType ~= ai.InteractionType.ADVENTURE_GIVER then
		return
	end

	self:CreateWnd( crateEnt )
	UI:PlayGlobalSound( UI.sounds.btnClick )

end


--
function UI.HudAdventureWnd:OnInteractionStop()

	if self.giverObject ~= nil then
		self:Reset()
	end

end


--
function UI.HudAdventureWnd:IsAdventureList( param )

	if self.advWnd:IsOnScreen() then
		self.requestAtid = -1

		self:UpdateOffers()
	end

end


--
function UI.HudAdventureWnd:CreateWnd( giverObject )

	self.giverObject = giverObject
	self:AddChild( self.advWnd )

	self:MoveChildToFirstPosition( self.advWnd )
	self:UpdateOffers()

	self.isActive = true

	self:Show()

end


--
function UI.HudAdventureWnd:Update( bNeedRequest )

	if self.giverObject == nil then
		self:Cancel()
		return
	end

	if bNeedRequest then

		local adventures = self.giverObject:GetAdventureOffers( _G.Game_LocalClientNum() )
		self.advWnd:SetAdventures( adventures )

		if not next( adventures ) then
			self:Cancel()
		end

	else
		self.advWnd:UpdateAdventures()
	end

end


--
function UI.HudAdventureWnd:UpdateOffers()

	if self.giverObject == nil then
		self:Cancel()
		return
	end

	local adventures = self.giverObject:GetAdventureOffers( _G.Game_LocalClientNum() )
	self.advWnd:SetAdventures( adventures )

	if not next( adventures ) then
		self:Cancel()
		return
	end

	self.advWnd:UpdateGiverTimer( self.giverObject:GetOffersEndTime() )

	if self:NeedLockBtn() then
		self.advWnd:LockSlotActionBtn()
	end

end


--
function UI.HudAdventureWnd:Reset()

	if self.advWnd:IsChildOf( self ) then
		self.advWnd:Reset()
		self.advWnd:UnlinkFromParent()
	end

	self.giverObject = nil
	self.requestAtid = -1

	self.isActive = false
	self:Hide()

end


--
function UI.HudAdventureWnd:StopInteraction()

	_G.CL_RequestStopInteraction()

end


--
function UI.HudAdventureWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Quests_CloseBtn" ) then

		UI:PlayGlobalSound( UI.sounds.btnClick )

		self:Cancel()

	elseif UI:IsWndKindOf( wnd, "Quests_QuestActionBtn" ) then

		if not self:NeedLockBtn() then

			UI:PlayGlobalSound( "sound/ui/apply" )
			local slotWnd = UI:GetAncestorKindOf( wnd, "AdventureSlotWnd" )
			self.advWnd:TakeAdventure( slotWnd.adventureInfo.aoid )
			self.requestAtid = slotWnd.adventureInfo.atid

		end

	else

		--

	end

	return true

end


--
function UI.HudAdventureWnd:MasterServer_OnNewAdventure( param )

	if self.advWnd:IsOnScreen() then
		self.requestAtid = -1

		self:UpdateOffers()
	end

end


function UI.HudAdventureWnd:MasterServer_OnAdventureFinal( param )

	if self.advWnd:IsOnScreen() then
		self.requestAtid = -1

		self:UpdateOffers()
	end

end


--
function UI.HudAdventureWnd:OnEscape()

	UI:PlayGlobalSound( UI.sounds.btnClick )
	self:Cancel()

	return true

end


--
function UI.HudAdventureWnd:Cancel()

	self:Reset()

	self:StopInteraction()

end


--
function UI.HudAdventureWnd:IsActive()

	return self.isActive

end


--
function UI.HudAdventureWnd:OnUpdateAdventureOffers( giverObject )

	if self.advWnd:IsOnScreen() and self.giverObject == giverObject then
		self:UpdateOffers()
	end

end


--
function UI.HudAdventureWnd:NeedLockBtn()

	return #UI.serverData.activeAdventures >= ai.AdventureConst.MAX_PLAYER_ADVENTURES

end


--
function UI.HudAdventureWnd:Show()

	UI.HudWnd:ShowAdventureWnd()

end


--
function UI.HudAdventureWnd:Hide()

	UI.HudWnd:HideAdventureWnd()

end


-- ----------------------------------------------------------------------
-- UI.AdventureWnd
-- ----------------------------------------------------------------------

-- јналог Quests_QuestsListWnd
UI.AdventureWnd = {}

-- -----------------------------------------
-- window definition
-- -----------------------------------------

UI.AdventureWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "AdventureWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE,-- + UI.WS_NOT_KB_REACT,-- + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.QuestsWnd.layers.WAIT_EFFECT,
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,	

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questsList",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "title",
						layer		= "UI.AdventureWnd.layers.CATEGORY_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					{
						objName		= "loading",
						layer		= "UI.AdventureWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- CATEGORY_NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
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
						layer		= "UI.AdventureWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= "^hangar_loading"
		},
	},
}

-- -----------------------------------------
-- const
-- -----------------------------------------

UI.AdventureWnd.layers =
{
	MAIN_EFFECT		= 0,
	CATEGORY_NAME	= 1,
	WAIT_EFFECT		= 2,
	WAIT_TEXT		= 3,
}

UI.AdventureWnd.effectInfo =
{
	main =
	{
		scrollLocaror		= "scroll",
		slotLocatorPrefix	= "q_slot_",
		closeBtnLocator		= "btn_x4",
		timerLocator		= "timer"
	}
}


--
UI.AdventureWnd.SCROLL_STEP			= UI:YToRel( 30, true )
UI.AdventureWnd.WHEEL_SCROLL_STEP	= UI:YToRel( 100, true )

-- -----------------------------------------
-- vars
-- -----------------------------------------

UI.AdventureWnd.closeBtn			= nil
UI.AdventureWnd.scrollBar			= nil

UI.AdventureWnd.adventures			= {}
UI.AdventureWnd.allSlots			= {}
UI.AdventureWnd.curSlots			= {}
UI.AdventureWnd.slotsWnd			= nil
UI.AdventureWnd.maskWnd				= nil
UI.AdventureWnd.timerWnd			= nil

UI.AdventureWnd.bLockRecalcLayout	= false

UI.AdventureWnd.bWaiting			= false

-- -----------------------------------------
-- interface functions
-- -----------------------------------------


--
function UI.AdventureWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.adventures	= {}
	self.allSlots	= {}
	self.curSlots	= {}

	self.bWaiting	= false

	self:UpdateWaitingEffect()

	self:InitControls()
	self:PrepareLayout()

	local uiHandle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( uiHandle, UI.EV_VSCROLL_CHANGE )

end


--
function UI.AdventureWnd:InitControls()

	-- InitControls --
	self.maskWnd	= UI:CreateChildWnd( self, UI.ButtonsList3_SlotsWnd, "" )
	self.slotsWnd 	= UI:CreateChildWnd( self, UI.Quests_QuestsList_SlotsWnd, "" ) -- не пое€л, почему тут добавл€етс€ пустой деф

	self:AddChild( self.maskWnd )
	self.maskWnd:AddChild( self.slotsWnd )

	-- добавл€ем скролл
	self.scrollBar 	= UI:CreateChildWnd( self, UI.EffectScrollWnd_Vrt_3, "" )

	-- добавл€ем крестик
	self.closeBtn 	= UI:CreateChildWnd( self, UI.Quests_CloseBtn, "" )

	-- добавл€ем таймер
	self.timerWnd 	= UI:CreateChildWnd( self, UI.Quests_TimeWnd, "" )


	for idx = 1, 1 do
		self:CreateSlot()
	end

	-- устанавливаем текст
	local str = UI:GetStringByName( "adventure_name" )
	self:SetText( str, self.layers.CATEGORY_NAME )

	-- PrepareLayout --
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollLocaror, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.closeBtn, mainEffect, self.effectInfo.main.closeBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.AdventureWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd = self.allSlots[ 1 ]

	local scrollSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollLocaror ) or Vec2( 0, 0 )
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local slotSize		= Vec2( slotWnd:GetWidth(), slotWnd:GetBaseHeight() )

	self.space_slots = secondSlotPos.y - ( firstSlotPos.y + slotSize.y )

	local maskRect = Quat( firstSlotPos.x, firstSlotPos.y, slotSize.x, self:GetHeight() - firstSlotPos.y )
	self.maskWnd:SetRect( maskRect )

	self.slotsWnd:SetWidth( slotSize.x )

	self.scrollBar:SetHeight( scrollSize.y )
	self.scrollBar:SetPageSize( maskRect.w )
	self.scrollBar:SetStepSize( self.SCROLL_STEP )

end


--
function UI.AdventureWnd:UpdateWaitingEffect()

	self:SetLayerVisible( self.bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( self.bWaiting, self.layers.WAIT_TEXT )

	if self.bWaiting == true then
		self:LockSlotActionBtn()
	end

end


--
function UI.AdventureWnd:LockSlotActionBtn()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:LockActionBtn()
	end

end


--
function UI.AdventureWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.scrollBar:IsChildOf( self ) then
		self:SetScrollPos( self:GetScrollPos() - self.WHEEL_SCROLL_STEP * ticks )
	end

	return true

end


--
function UI.AdventureWnd:SetScrollPos( scrollPos )

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( scrollPos )
	end

end


--
function UI.AdventureWnd:Reset()

	self.adventures	= {}
	self.bWaiting = false

	if next( self.curSlots ) then

		self.bLockRecalcLayout = true
		for slotIdx, slotWnd in pairs( self.curSlots ) do
			slotWnd:Reset()
			slotWnd:UnlinkFromParent()
		end
		self.curSlots = {}

		self.bLockRecalcLayout = false
		self:RecalcLayout()

	end

	if self.timerWnd:IsChildOf( self ) then
		self.timerWnd:Reset()
		self.timerWnd:UnlinkFromParent()
	end

end


--
function UI.AdventureWnd:SetAdventures( adventures )

	self.bLockRecalcLayout = true
	self:Reset()

	self.adventures	= adventures

	for idx, adventureInfo in pairs( self.adventures ) do

		local slotWnd = self:ObtainSlot()
		if slotWnd then
			slotWnd:SetupForAdventure( adventureInfo )
		end

	end

	self.bLockRecalcLayout = false
	self:RecalcLayout()

	self:UpdateWaitingEffect()

end


--
function UI.AdventureWnd:UpdateAdventures()

	local adventures = self.adventures

	self.bLockRecalcLayout = true
	self:Reset()

	self.adventures	= adventures

	for idx, adventureInfo in ipairs( self.adventures ) do

		local slotWnd = self:ObtainSlot()
		if slotWnd then
			slotWnd:SetupForAdventure( adventureInfo )
		end

	end

	self.bLockRecalcLayout = false
	self:RecalcLayout()

	-- если квестов не осталось, то закрываем окно
	if not next( self.curSlots ) then

		local parent = self:GetParent()
		if parent then
			parent:Reset()
		end

	end

end


--
function UI.AdventureWnd:ObtainSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlot()
	end

	if freeSlotWnd then
		table.insert( self.curSlots, freeSlotWnd )
		self.slotsWnd:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.AdventureWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.AdventureSlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	else
		sys.log( "UI.AdventureWnd:CreateSlot()[ERROR]: cannot create slot" )
	end

	return slotWnd

end


--
function UI.AdventureWnd:UpdateGiverTimer( timeDisable )

	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		return
	end

	if not self.timerWnd:IsChildOf( self ) then
		self:CreateGiverTimer()
	end

	self.timerWnd:Setup( timeDisable )

end


--
function UI.AdventureWnd:CreateGiverTimer()

	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		return
	end

	local mainEffect 	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.timerWnd, mainEffect, self.effectInfo.main.timerLocator, UI.EffectAnimParams.POS )

	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "adventureGiverOffersTimer_tooltipCaption" ),
		text		= UI:GetStringByName( "adventureGiverOffersTimer_tooltipText" ),
	}

	self.timerWnd:SetTooltipData( tooltipData )

end


--
function UI.AdventureWnd:OnTimerExpired()

	--self:UpdateTimer()

end


--
function UI.AdventureWnd:OnSlotLayoutChanged( slotWnd )

	if slotWnd:IsChildOf( self ) then
		self:RecalcLayout()
	end

end


--
function UI.AdventureWnd:RecalcLayout()

	if self.bLockRecalcLayout then
		return
	end

	-- позиции слотов

	local slotsBtm = 0

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		local slotY = slotsBtm + ( slotIdx > 1 and self.space_slots or 0 )
		slotWnd:SetTop( UI:YRel2Snapped( slotY ) )

		slotsBtm = slotY + slotWnd:GetHeight()

	end


	-- размер окна слотов
	
	self.slotsWnd:SetHeight( slotsBtm )


	-- скролбар - видимость, max range

	local scrollSize = self.slotsWnd:GetHeight() - self.maskWnd:GetHeight()

	if scrollSize > 1e-3 then
		self.scrollBar:SetRange( 0, scrollSize )
		self:AddChild( self.scrollBar )
	else
		self.scrollBar:SetRange( 0, 0 )
		self.scrollBar:UnlinkFromParent()
	end

	self:OnScrollPosChanged()

end


--
function UI.AdventureWnd:OnScrollPosChanged()

	self.slotsWnd:SetTop( -UI:YRel2Snapped( self:GetScrollPos() ) )

end


--
function UI.AdventureWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:OnScrollPosChanged()

end


--
function UI.AdventureWnd:GetScrollPos()

	return self.scrollBar:IsChildOf( self ) and self.scrollBar:GetPos() or 0

end


--
function UI.AdventureWnd:TakeAdventure( aoid )

	self.bWaiting = true
	self:UpdateWaitingEffect()

	if not _G.CL_FreeSpace_AcceptAdventure( aoid ) then
		UI.HudAdventureWnd:UpdateOffers()
	end

end


--
function UI.AdventureWnd:RefuseAdventure( aiid )

	self.bWaiting = true
	self:UpdateWaitingEffect()

	_G.MasterServer_CancelAdventure( aiid )

end


--
function UI.AdventureWnd:IsWaiting()

	return self.bWaiting

end


--
function UI.AdventureWnd:ShowAdventure( questId, questType, bSelect )

	local slotWnd = self:GetSlotByAdventure( questId, questType )
	if slotWnd then
	
		self:SetScrollPos( slotWnd:GetTop() )
		
		if bSelect then
			self:SelectQuest( questId, questType )
		else
			self:SelectQuest( -1, -1 )
		end

	else
		sys.log( "UI.Quests_QuestsListWnd:ShowQuest()[ERROR]; cannot find slot for quest %d type %d", questId, questType )
	end

end


-- ----------------------------------------------------------------------
-- UI.AdventureWnd
-- ----------------------------------------------------------------------

-- јналог Quests_QuestSlotWnd
UI.AdventureSlotWnd = {}

-- ----------------------------
-- window definition
-- ----------------------------

UI.AdventureSlotWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "AdventureSlotWnd",
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
				defName 			= "gameplay_map_pve_quests_questSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "descript_2",
						layer		= "UI.AdventureSlotWnd.layers.TASK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE,
					},
		
					{
						objName		= "descript_1",
						layer		= "UI.AdventureSlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE,
					},
		
					{
						objName		= "title64",
						layer		= "UI.AdventureSlotWnd.layers.PROGRESS_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
		
					{
						objName		= "try_text",
						layer		= "UI.AdventureSlotWnd.layers.NUM_COMPLETIONS",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "over",
						layer		= "UI.AdventureSlotWnd.layers.SELECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "completed",
						layer		= "UI.AdventureSlotWnd.layers.FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "title",
						layer		= "UI.AdventureSlotWnd.layers.ADVENTURE_NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.POS - UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "spacer_2",
						layer		= "UI.AdventureSlotWnd.layers.SEPARATOR_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "title_2",
						layer		= "UI.AdventureSlotWnd.layers.CHOICE_CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_frame",
				defaultAnimation	= "idle",
			}}
		},
		
		-- SELECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_select",
				defaultAnimation	= "idle",
			}}
		},
		
		-- ADVENTURE_NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- TASK
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
		},
		
		-- CHOICE_CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 3, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "quests_rewardChoiceLabel" ),
		},

		-- PROGRESS_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- NUM_COMPLETIONS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SEPARATOR_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_separator1",
				defaultAnimation	= "idle",
			}}
		},

		-- SEPARATOR_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "gameplay_map_pve_quests_questSlot_separator2",
				defaultAnimation	= "idle",
			}}
		},
	}
}


-- ----------------------------
-- interface functions
-- ----------------------------

--
function UI.AdventureSlotWnd:SetupForAdventure( adventureInfo )

	self:Reset()

	self.adventureInfo = adventureInfo
	self.adventureAtid = adventureInfo.atid

	self:FullUpdate()

end


--
function UI.AdventureSlotWnd:Select( bSelected )
	
	self.bSelected = bSelected
	self:UpdateSelState()

end


--
function UI.AdventureSlotWnd:Reset()

	self.bSelected		= false
	self.adventureInfo	= nil
	self.adventureAtid 	= 0

	self:ResetAdventureControls()	

end


--
function UI.AdventureSlotWnd:FullUpdate()

	self:UpdateAdventureControls()

	self:UpdateSelState()

end


--
function UI.AdventureSlotWnd:UpdateSelState()

	self:SetLayerVisible( self.bSelected, self.layers.SELECT_EFFECT )

end

--
function UI.AdventureSlotWnd:UpdateAdventureControls()

	self:ResetAdventureControls()

	self:UpdateAdventureName()
	self:UpdateTask()
	self:UpdateDesc()
	self:UpdateBtns()
	self:UpdateProgress()
	self:UpdateTime()

	self:UpdateFrame()

	self:RecalcLayout()

end


--
function UI.AdventureSlotWnd:ResetAdventureControls()

	self:SetText( "", self.layers.TASK )
	self:SetText( "", self.layers.PROGRESS_VAL )

	self:SetLayerVisible( false, self.layers.ADVENTURE_NAME )
	self:SetLayerVisible( false, self.layers.DESC )
	self:SetLayerVisible( false, self.layers.CHOICE_CAPTION ) -- выбор награды
	self:SetLayerVisible( false, self.layers.NUM_COMPLETIONS )
	self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT )
	self:SetLayerVisible( false, self.layers.SEPARATOR_2_EFFECT )
	
	self.nameMetaText:SetText( "", true )
	self.taskMetaText:SetText( "", true )

	self.timeWnd:Reset()
	self.timeWnd:UnlinkFromParent()

	
	self:ResetBtns()

end


--
function UI.AdventureSlotWnd:CreateControls()

	--
	self.actionBtn			= UI:CreateChildWnd( self, UI.Quests_QuestActionBtn, "" )
    self.refuseBtn			= UI:CreateChildWnd( self, UI.Quests_RefuseQuestBtn, "" )
    self.timeWnd			= UI:CreateChildWnd( self, UI.Quests_TimeWnd, "" )

	--
	local mainEffect 		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	--
	UI:AddChildAndLink( self, self.actionBtn, mainEffect, self.effectInfo.main.actionBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.refuseBtn, mainEffect, self.effectInfo.main.refuseBtnLocator, UI.EffectAnimParams.POS )

end


--
function UI.AdventureSlotWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( 1 )
	end

	--
	local questNamePos_isCharacter_isReward		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.questNameLocator_isCharacter_isReward ) or Vec2( 0, 0 )
	local questNameSize_isCharacter_isReward	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.questNameLocator_isCharacter_isReward ) or Vec2( 0, 0 )
	local questNamePos_noCharacter_noReward		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.questNameLocator_noCharacter_noReward ) or Vec2( 0, 0 )
	local questNameSize_noCharacter_noReward	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.questNameLocator_noCharacter_noReward ) or Vec2( 0, 0 )
	
	local taskPos_noCharacter_noReward			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.taskLocator_noCharacter_noReward ) or Vec2( 0, 0 )
	local taskSize_noCharacter_noReward			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.taskLocator_noCharacter_noReward ) or Vec2( 0, 0 )	
	local taskPos_isCharacter_isReward			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.taskLocator_isCharacter_isReward ) or Vec2( 0, 0 )
	
	local descPos								= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descSize								= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )

	local sep1Pos								= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.sep1Locator ) or Vec2( 0, 0 )

	local footerSize							= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.footerLocator ) or Vec2( 0, 0 )
	
	local selfMinSize							= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local selfMaxSize							= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )
    
	local actionBtnPos							= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.actionBtnLocator ) or Vec2( 0, 0 )
	local actionBtnWidth						= self.actionBtn:GetWidth()

	local timePos								= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.timeLocator ) or Vec2( 0, 0 )
	local timeSize								= Vec2( self.timeWnd:GetWidth(), self.timeWnd:GetHeight() )

	--
	self.questNameLeft_noCharacter				= questNamePos_noCharacter_noReward.x
	self.questNameRight_noReward				= questNamePos_noCharacter_noReward.x + questNameSize_noCharacter_noReward.x

    self.taskLeft_noCharacter					= taskPos_noCharacter_noReward.x
    self.taskRight_noReward						= taskPos_noCharacter_noReward.x + taskSize_noCharacter_noReward.x

	self.space_top_questName					= questNamePos_isCharacter_isReward.y
	self.space_questName_task					= taskPos_isCharacter_isReward.y - ( questNamePos_isCharacter_isReward.y + questNameSize_isCharacter_isReward.y )
    self.space_sep_desc							= descPos.y - sep1Pos.y

    self.footerHeight							= footerSize.y

	self.minHeight								= selfMinSize.y
	self.maxHeight								= selfMaxSize.y

	self.space_actionBtn_right					= selfMaxSize.x - ( actionBtnPos.x + actionBtnWidth )
	self.space_timer_actionBtn					= actionBtnPos.x - ( timePos.x + timeSize.x )
	self.space_timer_btm						= selfMaxSize.y - ( timePos.y + timeSize.y )


	-- ”станавливаем позицию имени квеста по оси у
	self:SetLayerTop( questNamePos_isCharacter_isReward.y, self.layers.ADVENTURE_NAME )

	self:SetLayerLeft( descPos.x, self.layers.DESC )
	self:SetLayerWidth( descSize.x, self.layers.DESC )

	--
	self:SetWidth( selfMaxSize.x )

end


--
function UI.AdventureSlotWnd:RecalcLayout()
	
	local topPartBtm = self.space_top_questName


	-- им€ квеста
	if self:IsLayerVisible( self.layers.ADVENTURE_NAME ) then
		
		local questNameLeft	= self.questNameLeft_noCharacter
		
		local questNameRight = self.questNameRight_noReward

		local questNameWidth = questNameRight - questNameLeft

		local questNameFormatRect = UI:Quat( 0, 0, questNameWidth, 1000000 )
		self.nameMetaText:SetFormatRectSize( UI:Vec2( questNameFormatRect.z, questNameFormatRect.w ), true )	-- формат текста надо сделать еще ƒќ MeasureText

		local questNameHeight = _G.MeasureText(
			self.nameMetaText:GetFormattedText(),
			self:GetFont( self.layers.ADVENTURE_NAME ),
			questNameFormatRect,
			self:GetTextFormatFlags( self.layers.ADVENTURE_NAME ),
			questNameFormatRect ).w

		self:SetLayerLeft( questNameLeft, self.layers.ADVENTURE_NAME )
		self:SetLayerWidth( questNameWidth, self.layers.ADVENTURE_NAME )
		self:SetLayerHeight( questNameHeight, self.layers.ADVENTURE_NAME )
	
	end


	-- задание
	local taskLeft	= self.taskLeft_noCharacter
	local taskRight = self.taskRight_noReward
	local taskWidth = taskRight - taskLeft

	local taskFormatRect = UI:Quat( 0, 0, taskWidth, 1000000 )
	self.taskMetaText:SetFormatRectSize( UI:Vec2( taskFormatRect.z, taskFormatRect.w ), true )	-- формат текста надо сделать еще ƒќ MeasureText

	local taskHeight = _G.MeasureText(
			self.taskMetaText:GetFormattedText(),
			self:GetFont( self.layers.TASK ),
			taskFormatRect,
			self:GetTextFormatFlags( self.layers.TASK ),
			taskFormatRect ).w

	local taskTop = self.space_top_questName

	if self:IsLayerVisible( self.layers.ADVENTURE_NAME ) then
		local questNameRect = self:GetLayerRect( self.layers.ADVENTURE_NAME )
		taskTop = questNameRect.y + questNameRect.w + self.space_questName_task
	end
	
	self:SetLayerRect( UI:Quat( taskLeft, taskTop, taskWidth, taskHeight ), self.layers.TASK )

	local headerBtm = self:GetLayerTop( self.layers.TASK ) + taskHeight

	topPartBtm = headerBtm

	-- –азделительна€ лини€
	local sep1Y = 0

	if self:IsLayerVisible( self.layers.DESC ) then

		self:SetLayerVisible( true, self.layers.SEPARATOR_1_EFFECT )

		sep1Y = headerBtm
		
		local sep1Effect = UI:GetEffectFromLayer( self, self.layers.SEPARATOR_1_EFFECT )
		if sep1Effect then
			sep1Effect:SetPos( UI:Vec2( sep1Effect:GetPos().x, UI:YRel2Snapped( sep1Y ) ) )
		end

	else
		self:SetLayerVisible( false, self.layers.SEPARATOR_1_EFFECT )
	end


	-- ќписание
	if self:IsLayerVisible( self.layers.DESC ) then

		local descY = sep1Y + self.space_sep_desc

		local descFormatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.DESC ), 1000000 )

		local descHeight = _G.MeasureText(
			self:GetText( self.layers.DESC ),
			self:GetFont( self.layers.DESC ),
			descFormatRect,
			self:GetTextFormatFlags( self.layers.DESC ),
			descFormatRect ).w

		self:SetLayerTop( UI:YRel2Snapped( descY ), self.layers.DESC )
		self:SetLayerHeight( descHeight, self.layers.DESC )

		local descBtm = descY + descHeight + self.space_sep_desc
		topPartBtm = descBtm

	end


	-- высота окна
	local selfHeight = topPartBtm + self.footerHeight
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )

	-- анимаци€ фона
	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

	-- анимаци€ выделени€
	local selectEffect = UI:GetEffectFromLayer( self, self.layers.SELECT_EFFECT )
	if selectEffect then
		selectEffect:SetAnimationTimeAndUpdate( animTime )
	end

	-- анимаци€ рамки
	local frameEffect = UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	if frameEffect then
		frameEffect:SetAnimationTimeAndUpdate( animTime )
	end

	-- позици€ метатекста количества выполнений
	self:UpdateMetaTextPos()

	-- позици€ x и y таймера
	if self.timeWnd:IsChildOf( self ) then
		
		local timerRight = self.actionBtn:IsChildOf( self ) and ( self.actionBtn:GetLeft() - self.space_timer_actionBtn ) or ( self:GetWidth() - self.space_actionBtn_right )
		local timerLeft = timerRight - self.timeWnd:GetWidth()
		self.timeWnd:SetLeft( timerLeft )
		
		local timerY = selfHeight - self.space_timer_btm - self.timeWnd:GetHeight()
		self.timeWnd:SetTop( timerY )
	
	end

	-- оповещение списка, чтобы при изменении размера слота он мог сместить нижележащие слоты
	local adventureWnd = UI:GetAncestorKindOf( self, "AdventureWnd" )
	if adventureWnd then
		adventureWnd:OnSlotLayoutChanged( self )
	end
	
	self:SetHeight( selfHeight )

end


--
function UI.AdventureSlotWnd:UpdateFrame()

	if self.adventureAtid == 0 then
		return
	end

	self:SetLayerVisible( false, self.layers.FRAME_EFFECT )

end


--
function UI.AdventureSlotWnd:UpdateAdventureName()

	local str = self:GetAdventureName()
	
	if str ~= "" then
	
		self:SetLayerVisible( true, self.layers.ADVENTURE_NAME )
		self.nameMetaText:SetText( str, true )
		
	else
		self:SetLayerVisible( false, self.layers.ADVENTURE_NAME )
	end

end


--
function UI.AdventureSlotWnd:GetAdventureName()

	if self.adventureAtid == 0 and self.adventureInfo ~= nil then
		return ""
	end

	return UI:Adventure2Str( self.adventureAtid, "name" )

end


--
function UI.AdventureSlotWnd:UpdateTask()

	local str = ""
	str = self:GetAdventureTask( self.adventureInfo.stage )
	

	if str ~= "" then

		str = string.gsub( str, "%$param1%$", self.adventureInfo.params[1] )
		str = string.gsub( str, "%$param2%$", self.adventureInfo.params[2] )
		str = string.gsub( str, "%$param3%$", self.adventureInfo.params[3] )
		str = string.gsub( str, "%$param4%$", self.adventureInfo.params[4] )
		str = string.gsub( str, "%$param5%$", self.adventureInfo.params[5] )

		self:SetLayerVisible( true, self.layers.TASK )
		self.taskMetaText:SetText( str, true )
		
	else
		self:SetLayerVisible( false, self.layers.TASK )
	end

end


--
function UI.AdventureSlotWnd:GetAdventureTask( stage )

	if self.adventureAtid == 0 and self.adventureInfo ~= nil then
		return ""
	end

	return UI:Adventure2Str( self.adventureAtid, "task", stage )

end


--
function UI.AdventureSlotWnd:UpdateDesc()

	local str = self:GetAdventureDesc( self.adventureInfo.stage )

	if str ~= "" then

		str = string.gsub( str, "%$param1%$", self.adventureInfo.params[1] )
		str = string.gsub( str, "%$param2%$", self.adventureInfo.params[2] )
		str = string.gsub( str, "%$param3%$", self.adventureInfo.params[3] )
		str = string.gsub( str, "%$param4%$", self.adventureInfo.params[4] )
		str = string.gsub( str, "%$param5%$", self.adventureInfo.params[5] )
	
		self:SetLayerVisible( true, self.layers.DESC )
		self:SetText( str, self.layers.DESC )
		
	else
		self:SetLayerVisible( false, self.layers.DESC )
	end

end


--
function UI.AdventureSlotWnd:GetAdventureDesc( stage )

	if self.adventureAtid == 0 and self.adventureInfo ~= nil then
		return ""
	end

	return UI:Adventure2Str( self.adventureAtid, "desc", stage )

end


--
function UI.AdventureSlotWnd:UpdateProgress()

	if self.adventureInfo.aiid == nil then
		return
	end

	local stage = self.adventureInfo.stage
	local maxVal = UI:GetAdventureTaskMaxVal( self.adventureInfo.aiid )
	
	local curVal = self.adventureInfo.progress

	local str = string.format( "%s/%s", UI:Num2StrSeparatedBy3( curVal ), UI:Num2StrSeparatedBy3( maxVal ) )

	self:SetText( str, self.layers.PROGRESS_VAL )

end


--
function UI.AdventureSlotWnd:UpdateTime()

	if self.adventureInfo.aiid == nil or self.adventureInfo.startTime == nil then
		return
	end

	local timeout =  UI:GetAdventureStageTimeout( self.adventureAtid, self.adventureInfo.stage )

	local stageEndTime = self.adventureInfo.startTime + u64( timeout * 1000 )

	if timeout ~= 0 then
		self:AddChild( self.timeWnd )
		self.timeWnd:Setup( stageEndTime )
	else
    	self.timeWnd:Reset()
		self.timeWnd:UnlinkFromParent()
	end

end


--
function UI.AdventureSlotWnd:GetAdventureAoid()

	return self.adventureInfo.aoid

end


--
function UI.AdventureSlotWnd:GetAdventureAiid()

	return self.adventureInfo.aiid

end


--
function UI.AdventureSlotWnd:UpdateBtns()

	if self.adventureAtid == 0 then
		return
	end

	self:ResetBtns()

	if self.adventureInfo.aiid == nil then

		self:AddChild( self.actionBtn )
		self.actionBtn:SetAction( self.actions.TAKE )
		--self.actionBtn:Enable( true )

	else
		if UI:CanAdventureCanceled( self.adventureAtid ) then
			self:AddChild( self.refuseBtn )
		end
	end

end


--
function UI.AdventureSlotWnd:GetBaseHeight()

	return self.maxHeight

end


-- ----------------------------
-- vars
-- ----------------------------

UI.AdventureSlotWnd.bSelected 					= false

UI.AdventureSlotWnd.adventureInfo 				= nil
UI.AdventureSlotWnd.adventureAtid 				= 0

UI.AdventureSlotWnd.numCompletionsMetaText		= nil
UI.AdventureSlotWnd.nameMetaText				= nil
UI.AdventureSlotWnd.taskMetaText				= nil

UI.AdventureSlotWnd.actionBtn					= nil

UI.AdventureSlotWnd.questNameLeft_noCharacter	= 0
UI.AdventureSlotWnd.questNameRight_noReward		= 0
UI.AdventureSlotWnd.taskLeft_noCharacter		= 0
UI.AdventureSlotWnd.taskRight_noReward			= 0

UI.AdventureSlotWnd.space_top_questName			= 0
UI.AdventureSlotWnd.space_questName_task		= 0
UI.AdventureSlotWnd.space_sep_desc				= 0

UI.AdventureSlotWnd.footerHeight				= 0
UI.AdventureSlotWnd.minHeight					= 0
UI.AdventureSlotWnd.maxHeight 					= 0


-- ----------------------------
-- const
-- ----------------------------

UI.AdventureSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	FRAME_EFFECT		= 1,
	SELECT_EFFECT		= 2,
	ADVENTURE_NAME		= 3,
	TASK				= 4,
	DESC				= 5,
	CHOICE_CAPTION		= 6,
	PROGRESS_VAL		= 7,
	NUM_COMPLETIONS		= 8,
	SEPARATOR_1_EFFECT	= 9,
	SEPARATOR_2_EFFECT	= 10,
}

UI.AdventureSlotWnd.actions =
{
	TAKE				= 1,
	COMPLETE			= 2,
	TRANSFER_TO_ZONE	= 3,
	LAUNCH_PVE			= 4,
	SHIPS				= 5,
}

UI.AdventureSlotWnd.effectInfo =
{
	main =
	{
		characterLocator						= "pers_slot",
		rewardLocator							= "item_ico",
		questNameLocator_isCharacter_isReward	= "title",
		questNameLocator_noCharacter_noReward	= "title_3",
		taskLocator_isCharacter_isReward		= "descript_3",
		taskLocator_noCharacter_noReward		= "descript_2",
		descLocator								= "descript_1",
		choiceListLocator						= "diffiulty",
		sep1Locator								= "spacer",
		progressPbLocator						= "progr",
		minSizeLocator							= "dist_min",
		maxSizeLocator							= "self155",
		timeLocator								= "timer2",
		refuseBtnLocator						= "btn_x",
		endShipQuestBtnLocator					= "btn_x",
		groupQuestTaskLocator					= "descript_7",
		footerLocator							= "dist_min_2",
		characterIcoLocator						= "pers_slot",
		actionBtnLocator						= "status",
	},

	characterIco =
	{
		spriteName = "ico"
	},
	
	frame =
	{
		anim_TAKE		= "unlock",
		anim_COMPLETE	= "idle",
		anim_SHIPS		= "assign",
	}
}


-- ----------------------------
-- work functions
-- ----------------------------


--
function UI.AdventureSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.nameMetaText = UI.MetaText.GetNewInstance()
	self.nameMetaText:InitFromLayer( self, self.layers.ADVENTURE_NAME )
	
	self.taskMetaText = UI.MetaText.GetNewInstance()
	self.taskMetaText:InitFromLayer( self, self.layers.TASK )

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.AdventureSlotWnd:F_Shutdown()

	if self.nameMetaText then
		self.nameMetaText:Clear()
	end
	
	if self.taskMetaText then
		self.taskMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.AdventureSlotWnd:ResetBtns()

	self.actionBtn:UnlinkFromParent()
	self.actionBtn:Enable( true )
	self.actionBtn:SetGray( false )
	self.actionBtn:SetTooltipData( nil )

	self.refuseBtn:UnlinkFromParent()
	self.refuseBtn:Enable( true )
	self.refuseBtn:SetGray( false )
	self.refuseBtn:SetTooltipData( nil )

end


--
function UI.AdventureSlotWnd:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.ADVENTURE_NAME )
	self.taskMetaText:UpdateScreenOrgFromLayer( self, self.layers.TASK )

end


--
function UI.AdventureSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.ADVENTURE_NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.TASK then
		self.taskMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.AdventureSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateMetaTextPos()

end


--
function UI.AdventureSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываетьс€ при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.AdventureSlotWnd:LockActionBtn()

	if self.actionBtn:IsChildOf( self ) then
		local text = UI:GetStringByName( "adventureTakeGrayBtn_tooltipText" )
		text = string.gsub( text, "%$max_adventures%$", ai.AdventureConst.MAX_PLAYER_ADVENTURES )

		local tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "adventureTakeGrayBtn_tooltipCaption" ),
			text		= text,
		}
		--self.actionBtn:Enable( false )
		self.actionBtn:SetGray( true )
		self.actionBtn:SetTooltipData( tooltipData )
	end

	if self.refuseBtn:IsChildOf( self ) then
		self.refuseBtn:SetGray( true )
		--self.refuseBtn:Enable( false )
	end

end
