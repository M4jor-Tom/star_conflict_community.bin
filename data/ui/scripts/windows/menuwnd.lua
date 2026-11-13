-- ----------------------------------------------------------------------------
--
-- Workfile: MenuWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: menuwnd.lua 4849 2011-11-01 06:28:24Z $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( cvars.r_height / cvars.r_width )

UI.MenuWnd = {}
local mw = UI.MenuWnd

-- ------------------------------
-- items
-- ------------------------------

-- "static" variable
mw.items =
{
	main	= { "Continue", "Options", "Binds", --[["Support",]] "HangarHelp", "LinkEmailToSteamAccount", "Replay", "SkipTutorial", "Logout", "ExitApp" },
	Pause	= { "Continue", "Help", "Options", "HudEditor", "Binds", --[["Support",]] "Suicide", "DockByRecreationMatrix", "ExitFreeSpace", "ExitFight", "SkipTutorial" },
}

-- ------------------------------
-- window definition
-- ------------------------------

UI.MenuWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name 			= "MenuWnd",
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
				defName 			= "menu_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "menu_bg",	
						layer		= "UI.MenuWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},				

					{
						objName		= "list",	
						layer		= "UI.MenuWnd.layers.WORK_EFFECT",
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
				defName 			= "menu_work",
				defaultAnimation	= "idle",		
				
				links =
				{
					{
						objName		= "title",
						layer		= "UI.MenuWnd.layers.MAIN_CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "caption",
						layer		= "UI.MenuWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",
						wnd			= "UI.Menu_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MAIN_CAPTION
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^menu_caption",
		},  

		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},  
	},

	children = { "UI.Menu_ListWnd" }
}


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.MenuWnd:SetLevel( level, stack --[[optional]] )

	if type( level ) ~= "string" then
		sys.log( "UI.MenuWnd:SetLevel()[ERROR]: invalid type of the 1-st parameter (level); \"string\" expected got \"%s\"", type( level ) )
		return
	end

	if not UI.MenuWnd.items then
		sys.log( "UI.MenuWnd:SetLevel()[ERROR]: invalid 1-st parameter (level); cannot find item with name \"%s\"", level )
		return
	end

	if stack ~= nil then
		if type( stack ) ~= "table" then
			sys.log( "UI.MenuWnd:SetLevel()[ERROR]: invalid type of the 2-nd parameter (stack); \"nil\" or \"table\" expected, got \"%s\"", type( stack ) )
			return
		end

		for stackIdx, stackLevel in pairs( stack ) do
			if not UI.MenuWnd.items[ stackLevel ] then
				sys.log( "UI.MenuWnd:SetLevel()[ERROR]: invalid stack; level \"%s\" not found", tostring( stackLevel ) )
				return
			end
		end
	end

	if stack then
		self.stack = UI:CopyTable2( stack )
	end

	self:SetLevelInternal( level, false )

end


--
function UI.MenuWnd:SelectItem( itemName )

	if type( itemName ) ~= "string" then
		sys.log( "UI.MenuWnd:SelectItem()[ERROR]: invalid type of the 1-st parameter (item); \"string\" expected, got \"%s\"", type( itemName ) )
		return
	end

	local recordIdx = self:GetRecordByItemName( itemName )
	if recordIdx == -1 then
		sys.log( "UI.MenuWnd:SelectItem()[ERROR]: cannot find item \"%s\" for level \"%s\"", itemName, self.level )
		return
	end

	self.listWnd:SelectRecord( recordIdx, false )

end


--
function UI.MenuWnd:GetLevel()

	return self.level

end


--
function UI.MenuWnd:GetSelectedItem()

	local selRecordIdx = self.listWnd:GetSelectedRecord()

	if selRecordIdx ~= -1 then

		local data = self.listWnd:GetRecordData( selRecordIdx )
		return data.item.name

	else
		return ""
	end

end


--
function UI.MenuWnd:MasterServer_OnAttachEmail( result, requestId, param1, param2 )

	if requestId == self.linkEmailToSteamAccountRequestId then

		if result ~= _G.MasterServer.AccountAttachResult.AAR_OK then
			self:ShowMsgOnLinkEmailToSteamAccountError( result )
		end
		
		self.linkEmailToSteamAccountRequestId = 0
		
	end
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.MenuWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.linkEmailToSteamAccountRequestId = 0

end


-- ------------------------------
-- const
-- ------------------------------

mw.layers =
{
	MAIN_EFFECT		= 0, 
    BG_EFFECT       = 1, 
	WORK_EFFECT		= 2,
	MAIN_CAPTION	= 3,
	CAPTION			= 4,
}

mw.sounds =
{
	selectItem				= UI.sounds.btnMouseOver,
	tryActivateLockedItem	= UI.sounds.invalid,
	activateItem			= UI.sounds.btnClick,
	showOptions				= "sound/ui/btnClick",
	showBinds				= UI.sounds.btnClick,
	dockByMatrix			= "sound/ui/btnClick",
	showReplay				= UI.sounds.btnClick,
}

-- ------------------------------
-- vars
-- ------------------------------

mw.level							= ""
mw.stack							= {}
mw.hMsgExitApp						= UI.INVALID_UI_HANDLE
mw.hMsgLogout						= UI.INVALID_UI_HANDLE
mw.hMsgExitFight					= UI.INVALID_UI_HANDLE
mw.hMsgSkipTutorial					= UI.INVALID_UI_HANDLE
mw.hMsgDockByRecreationMatrix		= UI.INVALID_UI_HANDLE
mw.hMsgExitFreeSpace				= UI.INVALID_UI_HANDLE
mw.itemToSelect						= ""
mw.bBindsWereOpen					= false
mw.linkEmailToSteamAccountRequestId	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.MenuWnd:F_PostLoad()    

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.stack = {}

	self:PrepareItems()
    self:FullUpdate()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.MenuWnd:PrepareItems()

	for levelName, levelItems in pairs( UI.MenuWnd.items ) do

		for itemIdx, item in pairs( levelItems ) do

			if type( item ) ~= "table" then
				local tItem = { name = item }
				levelItems[ itemIdx ] = tItem				
				item = tItem
			end

			if item.bHidden == nil then
				item.bHidden = false
			end

			if item.bDisabled == nil then
				item.bDisabled = false
			end

			if item.locName == nil then				
				item.locName = self:ItemName2Localized( item.name )
			end

		end
	end

end


--
function UI.MenuWnd:Reset()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.Reset( self )
	end

	self:SetText( "", self.layers.CAPTION )

end


--
function UI.MenuWnd:FullUpdate()

	UI.FullScreenSelectionWnd.FullUpdate( self )
	self:UpdateCaption()

end


--
function UI.MenuWnd:UpdateList()

	local levelItems = UI.MenuWnd.items[ self.level ]
	if not levelItems then
		return
	end

	self:UpdateItemsStatus()

	for itemIdx = 1, #levelItems do
		local item = levelItems[ itemIdx ]

		if not item.bHidden then

			local data = {}
			data.item		= item
			data.text		= item.locName
			data.bDisabled	= item.bDisabled

			self.listWnd:AddRecord( data )

		end
	end

end


--
function UI.MenuWnd:ValidateListSelection()

	return

end


--
function UI.MenuWnd:UpdateCaption()

	local caption = ""

	if self.level ~= "" then
		caption = self:ItemName2Localized( self.level )
	end

	self:SetText( caption, self.layers.CAPTION )

end


--
function UI.MenuWnd:OnEscape( key, controllerIdx, controllerIdx_ex )

	if self.level == "main" or self.level == "Pause" then
		self:HandleCommand( "Continue", nil, key, controllerIdx, controllerIdx_ex )
	end

	return true

end


--
function UI.FullScreenSelectionWnd:OnEnter( key, controllerIdx )

	return false

end


--
function UI.MenuWnd:OnUp( key, controllerIdx )

	return false

end


--
function UI.MenuWnd:OnDown( key, controllerIdx )

	return false

end


--
function UI.MenuWnd:OnHome( key, controllerIdx )

	return false

end


--
function UI.MenuWnd:OnEnd( key, controllerIdx )

	return false

end


--
function UI.MenuWnd:ActivateSelRecord( key, controllerIdx, controllerIdx_ex )

	local selRecordIdx = self.listWnd:GetSelectedRecord()
	local data = self.listWnd:GetRecordData( selRecordIdx )

	if data.bDisabled then
		UI:PlayGlobalSound( self.sounds.tryActivateLockedItem )
		return
	end

	if self:IsItemLeaf( data.item.name ) then
		self:HandleCommand( data.item.name, true, key, controllerIdx, controllerIdx_ex )
	else
		if not self:HandleCommand( data.item.name, false, key, controllerIdx, controllerIdx_ex ) then
    		table.insert( self.stack, self.level )
			self:SetLevelCrossover( data.item.name, nil, true )
		end
	end

end


--
function UI.FullScreenSelectionWnd:TryActivateLockedRecord()

	UI:PlayGlobalSound( self.sounds.tryActivateLockedItem )

end


--
function UI.MenuWnd:GetRecordByItemName( itemName )

	for recordIdx = 1, self.listWnd:GetNumRecords() do
		local data = self.listWnd:GetRecordData( recordIdx )
		if data.item.name == itemName then
			return recordIdx
		end
	end

	return -1	

end


--
function UI.MenuWnd:IsItemLeaf( itemName )

	return UI.MenuWnd.items[ itemName ] == nil

end


--
function UI.MenuWnd:ItemName2Localized( itemName )	

	local strId = string.format( "menu_%s", itemName )
	return UI:GetStringForPlatform( strId )

end


--
function UI.MenuWnd:UpdateItemsStatus()

	local items = UI.MenuWnd.items[ self.level ]
	if not items then
		return
	end

	for itemIdx, item in pairs( items ) do
		local fnName = string.format( "UpdateItemStatus_%s", item.name )
		local fn = self[ fnName ]
		if fn then
			fn( self, item )
		end
	end

end


--
function UI.MenuWnd:SetLevelInternal( level, bAnimated )

	if bAnimated == nil or not self:IsOnScreen() or self.level == level then
		bAnimated = false
	end

	self.level = level

	if not bAnimated then
		self:FullUpdate()

	else

		self.commandOnHide = { fn = "SetLevelInternal2" }
		self:StartHideAnimation( false )		

	end

end


--
function UI.MenuWnd:SetLevelInternal2()

	self:FullUpdate()
	self:StartShowAnimation( false )

end


-- возможен переход между разными окнами меню в зависимости от уровня меню и стека
-- (в данном проекте не применимо, т.к. окно меню только одно)
function UI.MenuWnd:SetLevelCrossover( level, selItem, bAnimated )

	local menuWnd = UI:GetMenuWndForStack( level, self.stack )

	if menuWnd == self then
		self.itemToSelect = selItem
		self:SetLevelInternal( level, bAnimated )
		return		
	end

	if not bAnimated then
		self:Hide( false, false )

		menuWnd:SetLevel( level, self.stack )
		UI.Root:AddChild( menuWnd )

		if selItem and selItem ~= "" then
			menuWnd:SelectItem( selItem )
		end

		return
	end

	self.commandOnHide = { fn = "SetLevelCrossover2", params = { level = level, stack = self.stack, selItem = selItem } }
	self:Hide( true, true )

end


--
function UI.MenuWnd:SetLevelCrossover2( params )

	local menuWnd = UI:GetMenuWndForStack( params.level, params.stack )

	menuWnd:SetLevel( params.level, params.stack )
	menuWnd:Show( true )

	if params.selItem and params.selItem ~= "" then
		menuWnd:SelectItem( params.selItem )
	end

end


--
function UI.MenuWnd:HandleCommand( itemName, bLeaf, key, controllerIdx, controllerIdx_ex )

	if bAnimated == nil or not self:IsOnScreen() then
		bAnimated = false
	end

	if bLeaf == nil then
		bLeaf = true
	end

	local fnName = string.format( "On%s", itemName )
	local fn = self[ fnName ]

	if fn then
		return fn( self, itemName, key, controllerIdx, controllerIdx_ex )
	else
		if bLeaf then
			sys.log( "UI.MenuWnd:HandleCommand()[ERROR]: cannot find handle for command \"%s\"", itemName )
		end
		return false
	end

end


--
function UI.MenuWnd:ReturnToPrevLevel( bAnimated )

	if not next( self.stack ) then
		return
	end

	local stackSize = #self.stack

	local prevLevel = self.stack[ stackSize ]
	self.stack[ stackSize ] = nil

	self.itemToSelect = self.level
	self:SetLevelCrossover( prevLevel, self.level, true )

end


--
function UI.MenuWnd:F_OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	self.hMsgExitApp				= UI.INVALID_UI_HANDLE
	self.hMsgLogout					= UI.INVALID_UI_HANDLE
	self.hMsgExitFight				= UI.INVALID_UI_HANDLE
	self.hMsgSkipTutorial			= UI.INVALID_UI_HANDLE
	self.hMsgDockByRecreationMatrix	= UI.INVALID_UI_HANDLE
	self.hMsgExitFreeSpace			= UI.INVALID_UI_HANDLE

	-- хаковый коллбэк о том, что бинды поменялись;
	-- возможно они и не менялись - про них на самом деле ничего неизвестно, даже то, открыты они сейчас или нет;
	-- известно лишь что они были открыты из меню, а сейчас меню закрывается, и вероятно что они уже тоже закрылись, и возможно что-то там поменялось

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
    	if self.bBindsWereOpen then
			self.bBindsWereOpen = false
			UI:OnBindsChanged()
    	end
	end

end


--
function UI.MenuWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgExitApp then
		self.hMsgExitApp = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoExit()
		end

	elseif boxHandle == self.hMsgLogout then
		self.hMsgLogout = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoLogout()
		end

	elseif boxHandle == self.hMsgExitFight then
		self.hMsgExitFight = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoExitFight()
		end

	elseif boxHandle == self.hMsgSkipTutorial then
		self.hMsgSkipTutorial = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			UI.Tutorial:Stop( true )
		
			if self.level == "Pause" then
				_G.MasterServer_SendTutorialSkipTaEvent()
				_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_EXIT_FROM_TUTORIAL )
				self:DoExitFight()

			elseif self.level == "main" then
				self:Hide()
			end

		end

	elseif boxHandle == self.hMsgDockByRecreationMatrix then
		self.hMsgDockByRecreationMatrix = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoDockByRecreationMatrix()
		end

	elseif boxHandle == self.hMsgExitFreeSpace then
		self.hMsgExitFreeSpace = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoExitFreeSpace()
		end

	end

end       


--
function UI.MenuWnd:HasLevelOnStack( level )

	if self.level == level then
		return true
	end

	for idx, stackLevel in pairs( self.stack ) do
		if stackLevel == level then
			return true
		end
	end
	
	return false

end


--
function UI.MenuWnd:SetItemHidden( item, bHidden )

	if item then
		item.bHidden = bHidden
	end

end


--
function UI.MenuWnd:SetItemDisabled( item, bDisabled )

	if item then
		item.bDisabled = bDisabled
	end

end


--
function UI.MenuWnd:F_OnEventSaveUiState()

	if self.bToHide then
		self:OnStopHideAnimation()
	end

	UI.store[ self:GetScriptTableName() ] =
	{
		level								= self.level,
		stack								= self.stack,
		selItem								= self:GetSelectedItem(),
		bBindsWereOpen						= self.bBindsWereOpen,
		linkEmailToSteamAccountRequestId	= self.linkEmailToSteamAccountRequestId,
	}

end


--
function UI.MenuWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()	
	local t = UI.store[ name ]
	if t then

		self.bBindsWereOpen = t.bBindsWereOpen

		if t.level ~= "" then
			self:SetLevel( t.level, t.stack )

			if t.selItem ~= "" then
				self:SelectItem( t.selItem )
			end
		end
		
		self.linkEmailToSteamAccountRequestId = t.linkEmailToSteamAccountRequestId

		UI.store[ name ] = nil
	end 

end


--
function UI.MenuWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if self.timeSinceMouseWheel ~= -1 then
		return true
	end

	local recordIdx = -1

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 
	local btn = self:GetSlotByInput( w )

	if btn then
       	recordIdx = btn:GetRecord()
	end

	if recordIdx ~= self.listWnd:GetSelectedRecord() then

		self.listWnd:SelectRecord( recordIdx, true )

		if recordIdx ~= -1 then
			UI:PlayGlobalSound( self.sounds.selectItem )		
		end

	end

	return true

end


--
function UI.MenuWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	return self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

end


--
function UI.MenuWnd:DoExit()

    sys.concmd( "quit" )

end


--
function UI.MenuWnd:DoLogout()

	_G.MasterServer_ClientDisconnect()

end


--
function UI.MenuWnd:DoExitFight()

	if _G.MasterServer_IsConnected() then
		_G.MasterServer_RejoinGame( false )
	end

	UI:LoadMainMenuLevel()

end


--
function UI.MenuWnd:DoDockByRecreationMatrix()

	_G.CL_RequestSpaceStationPortal()
	UI:PlayGlobalSound( self.sounds.dockByMatrix )

	self:Hide()

end


--
function UI.MenuWnd:DoExitFreeSpace()

	_G.CL_RequestFreeSpaceSave()
	self:Hide()

end


--
function UI.MenuWnd:F_OnNewFrame( hSender, dt_sts, dt_game )

	UI.FullScreenSelectionWnd.F_OnNewFrame( self, hSender, dt_sts, dt_game )
	self:UpdateItemsState()

end


--
function UI.MenuWnd:UpdateItemsState()

	if self.level ~= "Pause" then
		return
	end

	self:EnableItem( "ExitFight", self:CanEnableItem_ExitFight() )	
	self:EnableItem( "Help", self:CanEnableItem_Help() )	
	self:EnableItem( "Suicide", self:CanEnableItem_Suicide() )	
	self:EnableItem( "DockByRecreationMatrix", self:CanEnableItem_DockByRecreationMatrix() )	
	self:EnableItem( "ExitFreeSpace", self:CanEnableItem_ExitFreeSpace() )		

end


--
function UI.MenuWnd:CanEnableItem_ExitFight()

	if _G.GetCurrentGameMode() == 0 then
		return false
	end

	if _G.CL_IsGameplayFinished() then
		return false
	end

	return true

end  


--
function UI.MenuWnd:CanEnableItem_Help()

	return UI:TryUserShowContextHelp( true )

end


--
function UI.MenuWnd:CanEnableItem_Suicide()

	if _G.CL_IsGameplayFinished() then
		return false
	end

	local playerId		= _G.Game_LocalClientNum()
	local spectateId	= _G.GetSpectatorTargetIdx()

	if spectateId == playerId then

		local ship = _G.CL_GetPlayerShip( spectateId )

		if ship then
			return true
		end

	end

	return false

end


--
function UI.MenuWnd:CanEnableItem_DockByRecreationMatrix()

	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		return false
	end

	if _G.CL_IsGameplayFinished() then
		return false
	end

	local playerId = _G.Game_LocalClientNum()
	local spectateId = _G.GetSpectatorTargetIdx()

	if spectateId == playerId then

		local ship = _G.CL_GetPlayerShip( spectateId )

		if not ship then
			return false
		end

	end

	return true

end


--
function UI.MenuWnd:CanEnableItem_ExitFreeSpace()

	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		return false
	end

	if _G.CL_IsGameplayFinished() then
		return false
	end

	local playerId = _G.Game_LocalClientNum()
	local spectateId = _G.GetSpectatorTargetIdx()

	if spectateId == playerId then

		local ship = _G.CL_GetPlayerShip( spectateId )

		if not ship then
			return false
		end

	end

	return true

end


--
function UI.MenuWnd:EnableItem( itemName, bEnable )

	local recordIdx = self:GetRecordByItemName( itemName )
	if recordIdx == -1 then
		return
	end

	local data = self.listWnd:GetRecordData( recordIdx )

	local bEnableOld = not data.bDisabled
	if bEnable == bEnableOld then
		return
	end

	data.bDisabled = not bEnable

	local slotWnd = self.listWnd:GetButtonForRecord( recordIdx )
	if slotWnd then
		slotWnd:OnDisabledStateChanged()
	end

end


-- --------------------------------
-- command handlers
-- --------------------------------

--
function UI.MenuWnd:OnContinue( itemName )

	self:Hide()
	UI:PlayGlobalSound( self.sounds.activateItem )

end


--
function UI.MenuWnd:OnExitApp( itemName )

	self.hMsgExitApp = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msg_exitApp" ), UI.MBS_YES_NO )

end


--
function UI.MenuWnd:OnLogout( itemName )

	self.hMsgLogout = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msg_logout" ), UI.MBS_YES_NO )

end


--
function UI.MenuWnd:OnExitFight( itemName )

	local str = UI:GetStringByName( "msg_exitFight" )

	local bShowFineLeaveMsg = _G.IsFineForLeaveEnabled()

	if bShowFineLeaveMsg then
		
		local colorLabel = UI.RED_COLOR
		
		str = string.format( "%s|%s%s", str, UI:Color2Str( colorLabel ), UI:GetStringByName( "msg_exitFightFineLeave" ) )
		
	end

	self.hMsgExitFight = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), str, UI.MBS_YES_NO )

end


--
function UI.MenuWnd:OnDockByRecreationMatrix( itemName )

	self.hMsgDockByRecreationMatrix = UI:MessageBox( UI:GetStringByName( "dockByRecreationMatrix_msgCaption" ), UI:GetStringByName( "dockByRecreationMatrix_msgText" ), UI.MBS_YES_NO )	

end


--
function UI.MenuWnd:OnExitFreeSpace( itemName )

	self.hMsgExitFreeSpace = UI:MessageBox( UI:GetStringByName( "exitFreeSpace_msgCaption" ), UI:GetStringByName( "exitFreeSpace_msgText" ), UI.MBS_YES_NO )

end


--
function UI.MenuWnd:OnOptions( itemName )

	self:Hide( false )
	
	local context = { level = self.level, stack = UI:CopyTable2( self.stack ), selItem = self:GetSelectedItem() }	
	UI.OptionsWnd:Setup( UI.OptionsWnd.modes.MENU, context )
	UI.OptionsWnd:Show( false )	

	UI:PlayGlobalSound( self.sounds.showOptions )

end


--
function UI.MenuWnd:OnSkipTutorial( itemName )

	self.hMsgSkipTutorial = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msg_skipTutorial" ), UI.MBS_YES_NO )	

end


--
function UI.MenuWnd:OnHelp( itemName )

	UI:TryUserShowContextHelp()

end


--
function UI.MenuWnd:OnHangarHelp( itemName )

	self:Hide( false )
	UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.HELP, true, false )

end


--
function UI.MenuWnd:OnSupport( itemName )

	local lang = UI:GetLanguage()
	local langDesc = _G.locale and _G.locale.languages and _G.locale.languages[ lang ]

	local link = langDesc and langDesc.supportLink
	if UI:IsStrEmpty( link ) then

		local engDesc = _G.locale and _G.locale.languages and _G.locale.languages.ENGLISH
		link = engDesc and engDesc.supportLink

	end

	if not UI:IsStrEmpty( link ) then
		_G.ShellExecute( link )
	else
		sys.log( "UI.MenuWnd:OnSupport()[ERROR]: cannot find _G.locale.languages[%s].supportLink", lang )
	end	

end


--
function UI.MenuWnd:OnBinds( itemName )

	self.bBindsWereOpen = true

	UI:PlayGlobalSound( self.sounds.showBinds )
	sys.concmd( "wait;devgui_showBindingUI" )

end


--
function UI.MenuWnd:OnLinkEmailToSteamAccount( itemName )

	if self.linkEmailToSteamAccountRequestId ~= 0 then
		return
	end

	UI:PlayGlobalSound( self.sounds.showOptions )
	
	self.linkEmailToSteamAccountRequestId = _G.MasterServer_AttachEmail()
	
	if self.linkEmailToSteamAccountRequestId == 0 then
		self:ShowMsgOnLinkEmailToSteamAccountError( _G.MasterServer.AccountAttachResult.AAR_ERROR )
	end
	
	self:FullUpdate()
	
end


--
function UI.MenuWnd:ShowMsgOnLinkEmailToSteamAccountError( result )

	UI:ShowErrorMsg( "msg_linkEmailToSteamAccount_error", result, "_G.MasterServer.AccountAttachResult" )

end


--
function UI.MenuWnd:OnSuicide( itemName )

	self:Hide()
	_G.CL_RequestDestructShip()

end


--
function UI.MenuWnd:OnReplay( itemName )	

	UI:PlayGlobalSound( self.sounds.showReplay )
	cvars.replay_debugUi = 1

end


--
function UI.MenuWnd:OnHudEditor( itemName )

	self:Hide( false )
	UI.HudEditorWnd:Show()
	UI:PlayGlobalSound( self.sounds.showOptions )

end

-- -------------------------
-- items status
-- ------------------------- 

--
function UI.MenuWnd:UpdateItemStatus_Logout( item )

	local isConnected = _G.MasterServer_IsConnected()
	self:SetItemHidden( item, not isConnected )

end


--
function UI.MenuWnd:UpdateItemStatus_ExitFight( item )

	if UI.Tutorial:IsActive()
		or _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE then
			self:SetItemHidden( item, true )
	else
		self:SetItemHidden( item, false )
		self:SetItemDisabled( item, not self:CanEnableItem_ExitFight() )
	end

end


--
function UI.MenuWnd:UpdateItemStatus_SkipTutorial( item )

	self:SetItemHidden( item, not UI.Tutorial:IsActive() )

end


--
function UI.MenuWnd:UpdateItemStatus_Help( item )

	if UI.Tutorial:IsActive() then
		self:SetItemHidden( item, true )

	else
		self:SetItemHidden( item, false )
		self:SetItemDisabled( item, not self:CanEnableItem_Help() )
	end

end


--
function UI.MenuWnd:UpdateItemStatus_LinkEmailToSteamAccount( item )

	local bShow = UI:IsSteam() and _G.MasterServer_IsUnattachedSteamAccount()
	self:SetItemHidden( item, not bShow )
	
	if bShow then
		self:SetItemDisabled( item, self.linkEmailToSteamAccountRequestId ~= 0 )
	end

end


--
function UI.MenuWnd:UpdateItemStatus_Binds( item )

	self:SetItemHidden( item, UI.Tutorial:IsActive() )

end


--
function UI.MenuWnd:UpdateItemStatus_Support( item )

	self:SetItemHidden( item, UI.Tutorial:IsActive() )

end


--
function UI.MenuWnd:UpdateItemStatus_Suicide( item )

	if cvars.cl_versionType == "live" or UI.Tutorial:IsActive() or _G.GetCurrentGameMode() == ai.Gameplay.FOOTBALL then
		self:SetItemHidden( item, true )

	else
		self:SetItemHidden( item, false )
		self:SetItemDisabled( item, not self:CanEnableItem_Suicide() )
	end

end


--
function UI.MenuWnd:UpdateItemStatus_DockByRecreationMatrix( item )

	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		self:SetItemHidden( item, true )
	else
		self:SetItemHidden( item, false )
		self:SetItemDisabled( item, not self:CanEnableItem_DockByRecreationMatrix() )
	end

end


--
function UI.MenuWnd:UpdateItemStatus_ExitFreeSpace( item )

	if _G.GetCurrentGameMode() ~= ai.Gameplay.FREE_SPACE then
		self:SetItemHidden( item, true )
	else
		self:SetItemHidden( item, false )
		self:SetItemDisabled( item, not self:CanEnableItem_ExitFreeSpace() )
	end

end


--
function UI.MenuWnd:UpdateItemStatus_Replay( item )

	self:SetItemHidden( item, not _G.MasterServer_IsPromoAccount() )

end


-- ---------------------------------------------------
-- UI.Menu_ListWnd
-- ---------------------------------------------------

UI.Menu_ListWnd = {}
local ml = UI.Menu_ListWnd

-- -------------------------
-- window definition
-- -------------------------

UI.Menu_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "list",
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
				defName				= "menu_list",
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
}

-- -------------------------
-- const
-- -------------------------

ml.MAX_SLOTS	= 9
ml.listStyle	= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK

ml.btnPrototypeName	= "Menu_ListBtn"

ml.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
	}
}

-- ---------------------------------------------------------------------------
-- UI.Menu_ListBtn
-- ---------------------------------------------------------------------------

UI.Menu_ListBtn = {}
local mb = UI.Menu_ListBtn

-- -------------------------------
-- window definition
-- -------------------------------

UI.Menu_ListBtn.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "Menu_ListBtn",
		isPrototype		= true,
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
				defName				= "menu_btn",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Menu_ListBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
    	},

    	-- TEXT
    	{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
    		{
   				scaledForResolution = true,
				patternName = "Small", 
   			},
    	},
    }
}

-- -------------------------------------------
-- const
-- -------------------------------------------

mb.effectInfo =
{
	main  =
	{
		animSel				= "sel_over",
		animUnsel			= "idle",
		animDisabledSel		= "disable_sel",
		animDisabledUnsel	= "disable",
	},	
}

mb.layers =
{
	MAIN_EFFECT		= 0,
	TEXT			= 1,
}

-- -------------------------------------------
-- interface functions
-- -------------------------------------------

--
function UI.Menu_ListBtn:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.TEXT )

end


--
function UI.Menu_ListBtn:Select( bSelect, bAnimated )

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

end


--
function UI.Menu_ListBtn:OnDisabledStateChanged()

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

end


-- -------------------------------------------
-- work functions
-- -------------------------------------------

--
function UI.Menu_ListBtn:UpdateForData( data, bAnimated )

	self:UpdateMainAnimation( data )
	self:UpdateText( data )

end


--
function UI.Menu_ListBtn:UpdateText( data )

	self:SetText( data.text, self.layers.TEXT )

end


--
function UI.Menu_ListBtn:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local isSelected = self:IsSelected()

	local anim = ""
	if data and data.bDisabled then
		anim = isSelected and self.effectInfo.main.animDisabledSel or self.effectInfo.main.animDisabledUnsel
	else
		anim = isSelected and self.effectInfo.main.animSel or self.effectInfo.main.animUnsel
	end

	mainEffect:StartAnimation( anim )

end