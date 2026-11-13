-- ----------------------------------------------------------------------------
--
-- Workfile: optionswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.OptionsWnd = {}
local ow = UI.OptionsWnd

-- -------------------------------
-- window definition
-- -------------------------------

UI.OptionsWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",

	props =
	{
		name			= "OptionsWnd",
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
				defName				= "options_main",
				defaultAnimation    = "idle",

				links =
				{     
					{
						objName		= "blackout",
						layer		= "UI.OptionsWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "option_win",
						layer		= "UI.OptionsWnd.layers.WORK_EFFECT",
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
				defName				= "blackBg",
				defaultAnimation    = "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_work",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.OptionsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

 					{
 						objName		= "option_btn_list",
 						wnd			= "UI.Options_SetListWnd",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "setting_list",
 						wnd			= "UI.Options_OptionListWnd",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "setting_list_2",
 						wnd			= "UI.Options_HudMarksOptionListWnd",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "button_1",
 						wnd			= "UI.Options_OkBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "button_2",
 						wnd			= "UI.Options_CancelBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "button_3",
 						wnd			= "UI.Options_ApplyBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "btn_x",
 						wnd			= "UI.Options_CrossBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "setting_list_2",
 						layer		= "UI.OptionsWnd.layers.HUD_COMMON_WORK_EFFECT",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "bookmarks",
 						layer		= "UI.OptionsWnd.layers.SUBSET_TABS_WORK_EFFECT",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "button_3",
 						wnd			= "UI.Options_HudMarksDefaultBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "button_4",
 						wnd			= "UI.Options_ResetOculusBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "setting_list",
 						wnd			= "UI.Options_AccountWnd",
 						animParams	= UI.EffectAnimParams.POS,
 					},
				}
			}}
		},

		-- SUBSET_TABS_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_subSetTabsWork",
				defaultAnimation    = "idle",

				links =
				{
 					{
 						objName		= "button_1",
 						wnd			= "UI.Options_HudCommonTabBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "button_2",
 						wnd			= "UI.Options_HudMarksTabBtn",
 						animParams	= UI.EffectAnimParams.POS,
					},

 					{
 						objName		= "button_3",
 						wnd			= "UI.Options_HudMarksAllyTabBtn",
 						animParams	= UI.EffectAnimParams.POS,
 					},
				}
			}}
		},

		-- HUD_COMMON_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudCommonWork",
				defaultAnimation    = "idle",

				links =
				{
 					{
 						objName		= "list_setting",
 						wnd			= "UI.Options_HudCommonOptionListWnd",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "list_preview",
 						layer		= "UI.OptionsWnd.layers.HUD_PREVIEW_WORK_EFFECT",
 						animParams	= UI.EffectAnimParams.POS,
 					},
				}
			}}
		},

		-- HUD_PREVIEW_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudPreviewWork",
				defaultAnimation    = "idle",

				links =
				{
 					{
 						objName		= "hud_preview",
 						wnd			= "UI.Options_HudCommonPreviewMainWnd",
 						animParams	= UI.EffectAnimParams.POS,
 					},

 					{
 						objName		= "hud_prev_cursor",
 						wnd			= "UI.Options_HudCommonPreviewDetailsWnd",
 						animParams	= UI.EffectAnimParams.POS,
 					},
				}
			}}
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
			text = "^options_caption",
		},  
	},

	children =
	{
		"UI.Options_SetListWnd",
		"UI.Options_OptionListWnd",
		"UI.Options_HudCommonOptionListWnd",
		"UI.Options_HudMarksOptionListWnd",
		"UI.Options_OkBtn",
		"UI.Options_CancelBtn",
		"UI.Options_ApplyBtn",
		"UI.Options_CrossBtn",
		"UI.Options_HudCommonTabBtn",
		"UI.Options_HudMarksTabBtn",
		"UI.Options_HudMarksAllyTabBtn",
		"UI.Options_HudCommonPreviewMainWnd",
		"UI.Options_HudCommonPreviewDetailsWnd",
		"UI.Options_HudMarksDefaultBtn",
		"UI.Options_ResetOculusBtn",
		"UI.Options_AccountWnd",
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.OptionsWnd:Setup( mode, context )

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.OptionsWnd:Setup()[ERROR]: invalid 1-st parameter (\"mode\"); one of the \"UI.OptionsWnd.modes\" values expected, got \"%s\"", tostring( mode ) )
		return
	end

	if mode == self.modes.MENU then
    	if type( context ) ~= "table" then
    		sys.log( "UI.OptionsWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"context\"); \"table\" expected, got \"%s\"", type( context ) )
    		return
    	end
	end

	self.mode = mode
	self.context = context or {}

end


--
function UI.OptionsWnd:SelectSet( setName )

	if type( setName ) ~= "string" then
		sys.log( "UI.OptionsWnd:SelectOptionSet()[ERROR]: invalid 1-st parameter (\"setName\"); \"string\" expected, gont \"%s\"", setName )
		return
	end

	if not UI.Options.sets[ setName ] then
		sys.log( "UI.OptionsWnd:SelectOptionSet()[ERROR]: option set \"%s\" not found", setName )
		return
	end

	local setRecordIdx = self:GetRecordBySetName( setName )
	if setRecordIdx == -1 then
		sys.log( "UI.OptionsWnd:SelectSet()[ERROR]: cannot find record for for set \"%s\"", setName )
		return
	end

	if self:IsOnScreen() then
		self.setsList:SelectRecord( setRecordIdx )
	else
		self.setToSelect = setName
	end

end 


--
function UI.OptionsWnd:GetSelectedSet()

	local selRecordIdx = self.setsList:GetSelectedRecord()

	if selRecordIdx == -1 then
		return ""
	end

	return self.setsList:GetRecordData( selRecordIdx ).setName

end


--
function UI.OptionsWnd:IsCursorOption( optionName )

	for idx, cursorOptionName in pairs( self.cursorOptionsNames ) do
		if optionName == cursorOptionName then
			return true
		end
	end

	return false

end


--
function UI.OptionsWnd:CreateShipMarkDefaultData( shipDefName )

	-- создается имитация структуры двнных из UI.HudObjectsMarksWnd

	if not shipDefName then
		shipDefName = "Ship_Race1_M_T2"
	end

	local shipDef = UI:GetDef( shipDefName )
	if not shipDef then
		sys.log( "UI.OptionsWnd:CreateShipMarkDefaultData()[ERROR]: cannot find _G.Def[%s]", shipDefName )
	end

	local mark = {}

	mark.entId					= -1
	mark.ent					= nil
	mark.defName				= shipDefName
	mark.objType				= UI.HudObjectsMarksWnd.objTypes.PLAYER
	mark.auxId					= -1
	mark.wnd					= nil
	mark.onCircleWnd			= nil
	mark.bInsideScreen			= true
	mark.bInsideArrowsArea		= false
	mark.damageRecords			= nil
	mark.lastDamageRecordIdx	= -1
	mark.lastEntPos				= Vec3( 0, 0, 0 )
	mark.bDead					= false
	mark.hideAnimTime			= -1
	mark.hideAnimStartTime		= -1
	mark.onCircleAlpha			= 1
	mark.bMySquad				= false
	mark.interactionDist		= 0
	mark.bNeedRemove			= false
	mark.visibilityType			= UI.HudObjectsMarksWnd.visibilityTypes.MAJOR	
	mark.bIsShip				= true
	mark.bIsCargoShip			= false
	mark.bIsLootCrate			= false
	mark.bIsQuestObject			= false
	mark.icoName				= ""
	mark.bDamagable				= true
	mark.quests					= {}
	mark.adventures				= {}
	mark.bVp					= false
	mark.boundSphereRadius		= 0

	mark.bPreview				= true
	mark.previewName			= UI:GetStringByName( "hudMarkPreview_playerName" )
	mark.previewMaxHp          	= shipDef and shipDef.hull_health or 100
	mark.previewHp				= mark.previewMaxHp
	mark.previewMaxShield		= shipDef and shipDef.shield_max or 100
	mark.previewShield			= mark.previewMaxShield
	mark.previewSize			= 0

	mark.data = {}		

    mark.data.bFirstUpdate			= true
    mark.data.bFirstUpdateOnCircle	= false
	mark.data.occluderWorldPos 		= Vec3( 0, 0, 0 )
	mark.data.ent					= nil
	mark.data.relationship			= ai.RelatioshipType.ENEMY
	mark.data.dist					= 100
	mark.data.fireDist				= mark.data.dist
	mark.data.isInFireRange			= false
	mark.data.isLock				= false
	mark.data.isLocking				= false
	mark.data.angle					= 0
	mark.data.bMyShip				= false
	mark.data.bVisibleByLeaderOnly	= false
	mark.data.bLeader				= true
	mark.data.bBomber				= false
	mark.data.bAggressor			= false
	mark.data.bCriminal				= false
	mark.data.bCivilian				= false
	mark.data.bNameChanged			= true
	mark.data.fireRange				= mark.data.dist - 1
	mark.data.bBehindObstacle		= false
	mark.data.colorScheme			= UI.gameObjColorSchemes.ENEMY	
	mark.data.bAlly					= false

	return mark

end


--
function UI.OptionsWnd:CreateVpMarkDefaultData()

	-- создается имитация структуры двнных из UI.HudObjectsMarksWnd

	local defName = "VitalPoint_Team1_BeaconA"
	local def = UI:GetDef( defName )
	if not def then
		sys.log( "UI.OptionsWnd:CreateVpMarkDefaultData()[ERROR]: cannot find _G.Def[%s]", defName )
	end

	local mark = {}

	mark.entId					= -1
	mark.ent					= nil
	mark.defName				= defName
	mark.objType				= UI.HudObjectsMarksWnd.objTypes.VITAL_POINT
	mark.auxId					= -1
	mark.wnd					= nil
	mark.onCircleWnd			= nil
	mark.bInsideScreen			= true
	mark.bInsideArrowsArea		= false
	mark.damageRecords			= nil
	mark.lastDamageRecordIdx	= -1
	mark.lastEntPos				= Vec3( 0, 0, 0 )
	mark.bDead					= false
	mark.hideAnimTime			= -1
	mark.hideAnimStartTime		= -1
	mark.onCircleAlpha			= 1
	mark.bMySquad				= false
	mark.interactionDist		= 0
	mark.bNeedRemove			= false
	mark.visibilityType			= UI.HudObjectsMarksWnd.visibilityTypes.MAJOR	
	mark.bIsShip				= false
	mark.bVp					= true
	mark.bPreview				= true
	mark.previewName			= nil
	mark.previewMaxHp          	= def and def.health or 100
	mark.previewHp				= mark.previewMaxHp
	mark.previewMaxShield		= nil
	mark.previewShield			= nil
	mark.quests					= {}
	mark.adventures				= {}

	mark.data = {}		

    mark.data.bFirstUpdate			= true
    mark.data.bFirstUpdateOnCircle	= false
	mark.data.occluderWorldPos 		= Vec3( 0, 0, 0 )
	mark.data.ent					= nil
	mark.data.relationship			= ai.RelatioshipType.ENEMY
	mark.data.dist					= 100
	mark.data.fireDist				= mark.data.dist
	mark.data.isInFireRange			= false
	mark.data.isLock				= false
	mark.data.isLocking				= false
	mark.data.angle					= 0
	mark.data.bMyShip				= false
	mark.data.bVisibleByLeaderOnly	= false
	mark.data.bLeader				= true
	mark.data.bBomber				= false
	mark.data.bAggressor			= false
	mark.data.bCriminal				= false
	mark.data.bCivilian				= false
	mark.data.bNameChanged			= true
	mark.data.fireRange				= mark.data.dist - 1
	mark.data.bBehindObstacle		= false
	mark.data.colorScheme			= UI.gameObjColorSchemes.ENEMY	

	return mark

end


--
function UI.OptionsWnd:GetVoiceChatRecTestTimer()

	return self.recTestTimer

end


--
function UI.OptionsWnd:FB_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end

	UI.Options_AccountWnd:FB_OnEvent( eventId, success, errorCode )

end


--
function UI.OptionsWnd:VK_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end

	UI.Options_AccountWnd:VK_OnEvent( eventId, success, errorCode )

end


--
function UI.OptionsWnd:MasterServer_OnPtrServerStatus( requestId, errcode, status )

	UI.Options_AccountWnd:MasterServer_OnPtrServerStatus( requestId, errcode, status )

end


--
function UI.OptionsWnd:MasterServer_OnPtrAccountStatus( requestId, errcode, status, nextSyncTime )

	UI.Options_AccountWnd:MasterServer_OnPtrAccountStatus( requestId, errcode, status, nextSyncTime )

end


--
function UI.OptionsWnd:MasterServer_OnCreatePtrAccount( requestId, errcode, status, nextSyncTime )

	UI.Options_AccountWnd:MasterServer_OnCreatePtrAccount( requestId, errcode, status, nextSyncTime )

end


--
function UI.OptionsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.Options_AccountWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

end


--
function UI.OptionsWnd:MasterServer_OnCheckYupPurchases( result, requestId, param1, param2 )

	UI.Options_AccountWnd:MasterServer_OnCheckYupPurchases( result, requestId, param1, param2 )

end


-- -------------------------------
-- const
-- -------------------------------

ow.MAX_RESTORE_RESOLUTION_TIME	= 15

ow.layers =
{
	MAIN_EFFECT				= 0, 
    BG_EFFECT           	= 1, 
    WORK_EFFECT         	= 2, 
	SUBSET_TABS_WORK_EFFECT	= 3,
	HUD_COMMON_WORK_EFFECT	= 4,
	HUD_PREVIEW_WORK_EFFECT	= 5,
	CAPTION					= 6,
}

ow.modes =
{
	LOGIN	= 1,
	MENU	= 2,
}

ow.RESOLUTION_TIMER_COLOR = UI.TEXT_SEL_COLOR

ow.sets = { "Video", "Audio", "Game", "Hud", "Notifications", "Chat", --[["Oculus",]] "Account" } -- #0059010 окулус убран, т.к. мы не поддерживаем новую версию окулуса

ow.sounds =
{
	setMouseOver	= "sound/ui/btnMouseOver",
	setSelect		= "sound/ui/btnClick",
	hideOk			= "sound/ui/btnClick",
	hideCancel		= "sound/ui/btnClick",
	apply			= "sound/ui/btnClick",
	hudMarksDefault	= UI.sounds.btnClick,
	subSetSelect	= "sound/ui/btnClick",
	resetOculus		= UI.sounds.btnClick,
}

ow.optionsListModes =
{
	COMMON			= 1,
	HUD_COMMON		= 2,
	HUD_MARKS		= 3,
	ACCOUNT			= 4,
}

ow.cursorOptionsNames = { "cursorTypes", "cursorCrossTypes", "cursorColors", "predictionColors" }

ow.defaultHudSubSet = "HudCommon"

ow.REC_TEST_TIME	= 10

-- -------------------------------
-- vars
-- -------------------------------

ow.setToSelect				= ""
ow.mode 					= -1
ow.context					= {}
ow.prevResolution			= nil
ow.toRestore				= false
ow.toHide					= false
ow.resolutionDirty			= false
ow.hMsgResolution			= UI.INVALID_UI_HANDLE
ow.hTimer_resolution		= -1
ow.setsList					= nil
ow.optionsListMode			= -1
ow.optionsList				= nil
ow.bIgnoreComboSelection	= false
ow.selSubSet				= ""
ow.recTestTimer				= -1

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.OptionsWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.setsList = UI.Options_SetListWnd

	UI.Options_OptionListWnd:UnlinkFromParent()
	UI.Options_HudCommonOptionListWnd:UnlinkFromParent()
	UI.Options_HudMarksOptionListWnd:UnlinkFromParent()
	UI.Options_AccountWnd:UnlinkFromParent()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_OPTIONS_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SLIDER_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )	
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_TIMER )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_TIMER_ACTIVE )

	self:Reset()

end


--
function UI.OptionsWnd:Reset()

	UI.FullScreenSelectionWnd.Reset( self )

	self.setsList:Clear()

	self:ResetOptionsListWnd()

	self.selSubSet = ""
	self:ResetSubSetTabBtns()

	UI.Options_HudCommonPreviewMainWnd:Reset()
	UI.Options_HudCommonPreviewMainWnd:UnlinkFromParent()

	UI.Options_HudCommonPreviewDetailsWnd:Reset()
	UI.Options_HudCommonPreviewDetailsWnd:UnlinkFromParent()

	UI.Options_ApplyBtn:Enable( false )	

end


--
function UI.OptionsWnd:FullUpdate()

	self:Reset()

	self:InitOptions()
	self:UpdateSets()

	if self.setToSelect ~= "" then
		self:SelectSet( self.setToSelect )
		self.setToSelect = ""
	end

	self:ValidateSetSelection()

end


--
function UI.OptionsWnd:UpdateSets()

	for setIdx = 1, #self.sets do

		local setName = self.sets[ setIdx ]

		local bNeedSet = true

		if setName == "Account" or setName == "Hud" then

			if not _G.MasterServer_IsConnected() then
				bNeedSet = false
			end

		end

		if bNeedSet then

			local data = {}
			data.setName = setName
	
			self.setsList:AddRecord( data )		

		end

	end

end


--
function UI.OptionsWnd:ValidateSetSelection()

	if self.setsList:GetSelectedRecord() == -1 and self.setsList:GetNumRecords() > 0 then
		self.setsList:SelectRecord( 1 )
	end 

end


--
function UI.OptionsWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == self.setsList:GetUiHandle() then
		self:OnSetsListSelectionChanged()
	end

end


--
function UI.OptionsWnd:OnSetsListSelectionChanged()

	local setName = self:GetSelectedSet()

	if setName == "Hud" then
		self.selSubSet = self.defaultHudSubSet
	else
		self.selSubSet = ""
	end

	self:UpdateOptionsControls()
	self:UpdateKeyTipPanel()

end


--
function UI.OptionsWnd:UpdateOptionsControls()

	self:UpdateOptionsListWnd()
	self:UpdateSubSetTabBtns()
	self:UpdateHudPreviews()

end


--
function UI.OptionsWnd:ResetOptionsListWnd()

	self:SetLayerVisible( false, self.layers.HUD_COMMON_WORK_EFFECT )

	if self.optionsList then

		self.optionsList:Clear()
		self.optionsList:UnlinkFromParent()		

		self.optionsList = nil

	end

	self.optionsListMode = -1

	self:StopVoiceChatRecTest()

end


--
function UI.OptionsWnd:UpdateOptionsListWnd()

	self:ResetOptionsListWnd()

	local setName = self:GetSelectedSet()

	if setName == "Hud" then

		if self.selSubSet == "HudCommon" then

			self.optionsList		= UI.Options_HudCommonOptionListWnd
			self.optionsListMode	= self.optionsListModes.HUD_COMMON

		elseif self.selSubSet == "HudMarks" then

			self.optionsList		= UI.Options_HudMarksOptionListWnd
			self.optionsListMode	= self.optionsListModes.HUD_MARKS

		elseif self.selSubSet == "HudMarksAlly" then

			self.optionsList		= UI.Options_HudMarksOptionListWnd
			self.optionsListMode	= self.optionsListModes.HUD_MARKS

		else
			sys.log( "UI.OptionsWnd:UpdateOptionsListWnd()[ERROR]: unhandled hud subset: \"%s\"", tostring( self.selSubSet ) )
		end

	elseif setName == "Account" then

		self.optionsList		= UI.Options_AccountWnd
		self.optionsListMode	= self.optionsListModes.ACCOUNT

	elseif setName ~= "" then

		self.optionsList		= UI.Options_OptionListWnd	
		self.optionsListMode	= self.optionsListModes.COMMON

	end

	self:SetLayerVisible( self.optionsListMode == self.optionsListModes.HUD_COMMON, self.layers.HUD_COMMON_WORK_EFFECT )

	if self.optionsList then
		self:AddChild( self.optionsList )
		self:FillOptionsList()
	else
		self.optionsListMode = -1
	end

end


--
function UI.OptionsWnd:ResetSubSetTabBtns()

	UI.Options_HudCommonTabBtn:UnlinkFromParent()
	UI.Options_HudMarksTabBtn:UnlinkFromParent()
	UI.Options_HudMarksAllyTabBtn:UnlinkFromParent()

end


--
function UI.OptionsWnd:UpdateSubSetTabBtns()

	local setName = self:GetSelectedSet()

	if setName ~= "Hud" then
		self:ResetSubSetTabBtns()
		return
	end

	self:AddChild( UI.Options_HudCommonTabBtn )
	self:AddChild( UI.Options_HudMarksTabBtn )
	self:AddChild( UI.Options_HudMarksAllyTabBtn )	

	if self.selSubSet == "HudCommon" then

		UI.Options_HudCommonTabBtn:Check( true )
		UI.Options_HudMarksTabBtn:Check( false )
		UI.Options_HudMarksAllyTabBtn:Check( false )

	elseif self.selSubSet == "HudMarks" then

		UI.Options_HudCommonTabBtn:Check( false )
		UI.Options_HudMarksTabBtn:Check( true )
		UI.Options_HudMarksAllyTabBtn:Check( false )

	elseif self.selSubSet == "HudMarksAlly" then

		UI.Options_HudCommonTabBtn:Check( false )
		UI.Options_HudMarksTabBtn:Check( false )
		UI.Options_HudMarksAllyTabBtn:Check( true )

	else

		UI.Options_HudCommonTabBtn:Check( false )
		UI.Options_HudMarksTabBtn:Check( false )
		UI.Options_HudMarksAllyTabBtn:Check( false )

		sys.log( "UI.OptionsWnd:UpdateSubSetTabBtns()[ERROR]: unhandled hud subset: \"%s\"", tostring( self.selSubSet ) )

	end

end


--
function UI.OptionsWnd:FillOptionsList()

	if not self.optionsList then
		return
	end

	local setName = self:GetSelectedSet()

	if self.optionsListMode == self.optionsListModes.COMMON then

    	local options = UI.Options.sets[ setName ]
    	if not options then
    		return
    	end

    	for optionIdx = 1, #options do

    		local option = options[ optionIdx ]

			local bVisible = true
			if type( option.IsVisible ) == "function" then
				bVisible = option:IsVisible()
			end

			if bVisible then

        		local data = {}
        		data.option = option

        		self.optionsList:AddRecord( data )

			end

    	end

	elseif self.optionsListMode == self.optionsListModes.HUD_COMMON then

		setName = self.selSubSet

    	local options = UI.Options.sets[ setName ]
    	if not options then
    		return
    	end

		local datas = {}

		local bCursorHandled = false

    	for optionIdx = 1, #options do

    		local option = options[ optionIdx ]
			local bIsCursorOption = self:IsCursorOption( option.id )

			if not bIsCursorOption or not bCursorHandled then

	    		local data = {}

				if bIsCursorOption then
					data.bCursor = true
					bCursorHandled = true
				else
		    		data.option = option
				end

				table.insert( datas, data )

			end

    	end

		local numRecords = #datas
		self.optionsList:SetMaxSlots( numRecords )

		for recordIdx = 1, numRecords do
	    	self.optionsList:AddRecord( datas[ recordIdx ] )
		end


	elseif self.optionsListMode == self.optionsListModes.HUD_MARKS then

		setName = self.selSubSet

		local bAlly = setName == "HudMarksAlly"

		self.optionsList:Init( bAlly )

		if bAlly then
    		self.optionsList:AddRecord( { marksMode = "brief_ally", bAlly = bAlly } )
    		self.optionsList:AddRecord( { marksMode = "full_ally", bAlly = bAlly } )
    		self.optionsList:AddRecord( { marksMode = "lock_ally", bAlly = bAlly } )
		else
    		self.optionsList:AddRecord( { marksMode = "brief", bAlly = bAlly } )
    		self.optionsList:AddRecord( { marksMode = "full", bAlly = bAlly } )
    		self.optionsList:AddRecord( { marksMode = "lock", bAlly = bAlly } )
		end

	elseif self.optionsListMode == self.optionsListModes.ACCOUNT then

		self.optionsList:Update()

	end

	if setName == "Chat" then
		self:UpdateVoiceChatRecDisabledState()
	end

end


--
function UI.OptionsWnd:UpdateApplyBtnState()

	local selSet = self:GetSelectedSet()

	if selSet == "Video" or selSet == "Oculus" then

		self:AddChild( UI.Options_ApplyBtn )

		local bEnable = UI.Options:IsChanged( { selSet } )
		UI.Options_ApplyBtn:Enable( bEnable )

	else
		self:RemoveChild( UI.Options_ApplyBtn )
	end

end


--
function UI.OptionsWnd:UpdateHudMarksDefaultBtnState()

	local selSet = self:GetSelectedSet()

	if selSet == "Hud" and ( self.selSubSet == "HudMarks" or self.selSubSet == "HudMarksAlly" ) then

		self:AddChild( UI.Options_HudMarksDefaultBtn )

		local bEnable = false

		local optionName = self.selSubSet == "HudMarks" and "marksElements_default" or "marksElements_default_ally"
		local option = UI.Options:GetOptionByName( optionName )
		if option then
			bEnable = option.value.cur == false
		else
			sys.log( "UI.OptionsWnd:UpdateHudMarksDefaultBtnState()[ERROR]: cannot find option \"%s\"", optionName )
		end		

		UI.Options_HudMarksDefaultBtn:Enable( bEnable )

	else
		self:RemoveChild( UI.Options_HudMarksDefaultBtn )
	end

end


--
function UI.OptionsWnd:UpdateResetOculusBtnState()

	local selSet = self:GetSelectedSet()

	if selSet == "Oculus" then

		self:AddChild( UI.Options_ResetOculusBtn )

		local bEnable = _G.IsOculusAvailable()
		UI.Options_ResetOculusBtn:Enable( bEnable )

	else
		self:RemoveChild( UI.Options_ResetOculusBtn )
	end

end


--
function UI.OptionsWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	local name = self:GetScriptTableName()
	UI.store[ name ] =
	{
		selSetName		= self:GetSelectedSet(),
		mode			= self.mode,
		context			= self.context,
		prevResolution	= self.prevResolution,
		toRestore		= self.toRestore,
		toHide			= self.toHide,
	}	

	-- после перезагрузки ресурсов опции уже не надо показывать?

	if self.toHide and ( self.toRestore or not self.prevResolution ) then
		self:UnlinkFromParent( true )
	end

end


--
function UI.OptionsWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()

	local t = UI.store[ name ]
	if t then

		if t.toHide and ( t.toRestore or not t.prevResolution ) then

    		self:Setup( t.mode, t.context )
			self:ReturnToPrevWindow()

		else

    		self:Setup( t.mode, t.context )

    		if t.selSetName ~= "" then
        		if self:IsOnScreen() then
        			self:SelectSet( t.selSetName )
        		else
        			self.setToSelect = t.selSetName
        		end
    		end
	
			self.prevResolution	= t.prevResolution
			self.toHide			= t.toHide
			self.toRestore		= t.toRestore

    		if	self:GetSelectedSet() == "Video" and
    			self.prevResolution and
    			( self.prevResolution.width ~= cvars.r_3dwidth or self.prevResolution.height ~= cvars.r_3dheight ) then
    				self:AfterResolutionChanged()		
    		end

		end

		UI.store[ name ] = nil

	end   

end


--
function UI.OptionsWnd:InitOptions()

	UI.Options:Reset()

	for idx = 1, #self.sets do
		UI.Options:InitOptions( self.sets[ idx ] )
	end

	UI.Options:InitOptions( "HudCommon" )
	UI.Options:InitOptions( "HudMarks" )
	UI.Options:InitOptions( "HudMarksAlly" )

end


--
function UI.OptionsWnd:GetRecordBySetName( setName )

	for recordIdx = 1, self.setsList:GetNumRecords() do

		local data = self.setsList:GetRecordData( recordIdx )
		if data.setName == setName then
			return recordIdx
		end

	end

	return -1

end


--
function UI.OptionsWnd:F_OnEventOptionsChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	local option = UI.Options.lastUpdatedOption
	if option then

		if self.optionsList then
			self.optionsList:OnOptionValueChanged( option )
		end

		if UI.Options_HudCommonPreviewMainWnd:IsOnScreen() then
			UI.Options_HudCommonPreviewMainWnd:OnOptionValueChanged( option )			
		end

		if UI.Options_HudCommonPreviewDetailsWnd:IsOnScreen() then
			UI.Options_HudCommonPreviewDetailsWnd:OnOptionValueChanged( option )
		end

	end

	self:UpdateKeyTipPanel()

end


--
function UI.OptionsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if w.SET_SLOT then

    	local recordIdx	= w:GetRecord()
    	if recordIdx ~= self.setsList:GetSelectedRecord() and not self.setsList:GetRecordData( recordIdx ).bDisabled then
    		self.setsList:SelectRecord( recordIdx )
			UI:PlayGlobalSound( self.sounds.setSelect )
    	end

	elseif w == UI.Options_CancelBtn then
		self:TryReturnToPrevWindow( false )
		UI:PlayGlobalSound( self.sounds.hideCancel )

	elseif w == UI.Options_OkBtn then
		self:TryReturnToPrevWindow( true )
		UI:PlayGlobalSound( self.sounds.hideOk )

	elseif w == UI.Options_ApplyBtn then
		self:ApplyChanges( true )
		UI:PlayGlobalSound( self.sounds.apply )

	elseif UI:IsWndKindOf( w, "Options_CheckBoxWnd" ) then

		local slotWnd = w:GetParent()
		local option = slotWnd:GetOption()

		UI.Options:SetCustomCurVal( option, not option.value.cur )

	elseif UI:IsWndKindOf( w, "Options_HudCheckBoxWnd" ) then

		local slotWnd = w:GetParent()
		local option = slotWnd:GetOption()

		UI.Options:SetCustomCurVal( option, not option.value.cur )

	elseif w == UI.Options_CrossBtn then
		self:TryReturnToPrevWindow( false )
		UI:PlayGlobalSound( self.sounds.hideCancel )

	elseif w == UI.Options_HudCommonTabBtn then

		if self.selSubSet ~= "HudCommon" then
			self:SelectHudSubSet( "HudCommon" )
			UI:PlayGlobalSound( self.sounds.subSetSelect )		
		end

	elseif w == UI.Options_HudMarksTabBtn then

		if self.selSubSet ~= "HudMarks" then
			self:SelectHudSubSet( "HudMarks" )
			UI:PlayGlobalSound( self.sounds.subSetSelect )		
		end

	elseif w == UI.Options_HudMarksAllyTabBtn then

		if self.selSubSet ~= "HudMarksAlly" then
			self:SelectHudSubSet( "HudMarksAlly" )
			UI:PlayGlobalSound( self.sounds.subSetSelect )		
		end

	elseif w == UI.Options_HudMarksDefaultBtn then
		self:SetHudMarksDefault()
		UI:PlayGlobalSound( self.sounds.hudMarksDefault )

	elseif w == UI.Options_ResetOculusBtn then
		self:ResetOculus()
		UI:PlayGlobalSound( self.sounds.resetOculus )

	elseif UI:IsWndKindOf( w, "Options_ControlBtn" ) then

		local slotWnd = w:GetParent()
		local option = slotWnd:GetOption()

		if option.id == "voicechatRefreshRecDevices" then

			local devicesListOption = UI.Options:GetOptionByName( "voicechatRecDevices" )
			if devicesListOption then		

				devicesListOption:UpdateDevices()

        		if self.optionsList then
        			self.optionsList:OnOptionValueChanged( devicesListOption )
        		end

			end

		elseif option.id == "voicechatStartRecTest" then
			self:StartVoiceChatRecTest()
		end		

	elseif w == UI.Options_FacebookLoginBtn then

		_G.FB_ForceLogIn()


	elseif w == UI.Options_FacebookAddFriendsBtn then

		if not w:IsGray() then
			_G.MasterServer_Social_SuggestFBFriends()
		end

	elseif w == UI.Options_VkLoginBtn then

		_G.VK_ForceLogIn()


	elseif w == UI.Options_VkAddFriendsBtn then

		if not w:IsGray() then
			_G.MasterServer_Social_SuggestVKFriends()
		end

	elseif w == UI.Options_PtrServer_SyncBtn then

		UI.Options_PtrServerWnd:Synchronize()

	elseif w == UI.Options_Arc_ShowSyncBtn then

		UI.Options_ArcWnd:OnShowSync()

	end

	return true

end


--
function UI.OptionsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.optionsList then
		self.optionsList:Scroll( ticks < 0, math.abs( ticks ) )
	end

	return true

end


--
function UI.OptionsWnd:TryReturnToPrevWindow( bApplyChanges )

	if not UI.Options:IsChanged() then
		self:ReturnToPrevWindow()

	else

		self.toHide = true

		if bApplyChanges then

			-- Смена разрешения в результате будет вызвана через посылку сообщения, поэтому не заботимся о том,
			-- что в этой точке окно перестанет существовать (при смене аспекта окна пересоздаются).
			-- Далее, мы придем в одну из двух точек, где нужно показать месседжбокс, предлагающий вернуть старое разрешение:
			-- 1) RestoreUiState() - при смене аспекта,
			-- 2) F_OnResetDevice() - при сохранении аспекта.
			-- Скроем окно только после окончательной установки разрешения

			local bReloadUi = self:ApplyChanges( false )
			if not bReloadUi then
				self:ReturnToPrevWindow()
			end

		else
			UI.Options:CancelChanges()
			self:ReturnToPrevWindow()
		end

	end

end


--
function UI.OptionsWnd:ReturnToPrevWindow()

	self:Hide( false )

	if self.mode == self.modes.MENU then
		UI:ShowMenuInternal( self.context.level, self.context.stack, nil, true )
	end

end  


--
function UI.OptionsWnd:F_OnEventSliderChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	local sliderWnd	= UI:GetUiObjByHandleT( hSender )
	local slotWnd	= sliderWnd:GetParent()

	local val		= sliderWnd:GetVal()
	local option	= slotWnd:GetRecordData().option

	if math.abs( val - option.value.cur ) > 1e-3 then
		UI.Options:SetCustomCurVal( option, val )
	end

end


--
function UI.OptionsWnd:F_OnAfterShowOnScreen()

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )

   	if self.resolutionDirty then
   		self:AfterResolutionChanged()
   	end

end


--
function UI.OptionsWnd:F_OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
	else
		self:OnAfterHideFromScreen()
	end

	self.hMsgResolution			= UI.INVALID_UI_HANDLE
	self.prevResolution			= nil
	self.toRestore				= false
	self.toHide					= false

	if self.hTimer_resolution ~= -1 then
		UI.TimersManager:RemoveTimer( self.hTimer_resolution )
		self.hTimer_resolution = -1
	end

	if not UI:IsInShutdown() then
		self:StopVoiceChatRecTest()
	end

end


--
function UI.OptionsWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgResolution then  

		self.hMsgResolution = UI.INVALID_UI_HANDLE
		self:StopWaitingForRestoreResolution( retCode == UI.MBRET_NO )
		UI:PlayGlobalSound( UI.sounds.btnClick )
	
	end

end  


--
function UI.OptionsWnd:UpdateKeyTipPanel()

	self:UpdateApplyBtnState()
	self:UpdateHudMarksDefaultBtnState()
	self:UpdateResetOculusBtnState()

end 


--
function UI.OptionsWnd:ApplyChanges( bCurSetOnly )

	local sets = nil
	if bCurSetOnly then
		sets = { self:GetSelectedSet() }
	end

	local bResolutionChanged		= UI.Options:IsOptionChanged( "resolution" ) and ( not bCurSetOnly or UI.Options:BelongsOptionToSets( "resolution", sets ) )
	local bFullScreenModeChanged	= UI.Options:IsOptionChanged( "screenMode" ) and ( not bCurSetOnly or UI.Options:BelongsOptionToSets( "screenMode", sets ) )
	local bUiSizeChanged			= UI.Options:IsOptionChanged( "uiSize" ) and ( not bCurSetOnly or UI.Options:BelongsOptionToSets( "uiSize", sets ) )
	local bOculusEnableChanged		= UI.Options:IsOptionChanged( "oculusEnable" ) and ( not bCurSetOnly or UI.Options:BelongsOptionToSets( "oculusEnable", sets ) )

	local bReloadUi = bResolutionChanged or bFullScreenModeChanged or bUiSizeChanged or bOculusEnableChanged

	if bResolutionChanged then
		self.prevResolution = { width = cvars.r_3dwidth, height = cvars.r_3dheight, fullScreen = cvars.r_fullscreen }
	end

	UI.Options:ApplyChanges( false, sets )	

	self:UpdateKeyTipPanel()

	return bReloadUi

end  


--
function UI.OptionsWnd:F_OnResetDevice()

	self:OnResetDevice()
	
	if not self.prevResolution then
		return
	end

	-- эта функция вызывается не только при смене разрешения, но и при смене некоторых других параметров рендера	
	if cvars.r_3dwidth == self.prevResolution.width and cvars.r_3dheight == self.prevResolution.height then
		return
	end

	self:AfterResolutionChanged()

end


--
function UI.OptionsWnd:StartWaitingForRestoreResolution()

	-- окно может быть пока не на экране (после смены аспекта),
	-- но, т.к. нам надо чтобы месседж бокс был на самом верху, то показываем его только после основного окна

	if not self:IsOnScreen() then
		return
	end

	-- могут быть повторные вызовы, т.к. OnResetDevice может много раз вызываться при применении опций
	if self.hMsgResolution ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hTimer_resolution = UI.TimersManager:AddTimer( self:GetUiHandle(), -1, self.MAX_RESTORE_RESOLUTION_TIME, 0, false, false )
	UI.TimersManager:StartTimer( self.hTimer_resolution )


	self.hMsgResolution = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), "", UI.MBS_YES_NO )
	local msgBox = UI:GetUiObjByHandleT( self.hMsgResolution )

	local strMsg = self:MakeRestoreResolutionStr( self.MAX_RESTORE_RESOLUTION_TIME, msgBox )
	msgBox:SetMsg( strMsg )	

end  


--
function UI.OptionsWnd:StopWaitingForRestoreResolution( bRestore )

	UI.TimersManager:RemoveTimer( self.hTimer_resolution )
	self.hTimer_resolution = -1

	if bRestore then
		self.toRestore	= true

	   	UI:SendUiEvent( UI.EV_SET_RESOLUTION, self:GetUiHandle(), UI.INVALID_UI_HANDLE, UI.DELIVER_NEXT_FRAME, self.prevResolution.width, self.prevResolution.height, self.prevResolution.fullScreen, 0 )
		self.prevResolution	= { width = cvars.r_3dwidth, height = cvars.r_3dheight, fullScreen = cvars.r_fullscreen }

	else
		self.prevResolution = nil
		if self.toHide then
			self:ReturnToPrevWindow()
		end
	end

end


--
function UI.OptionsWnd:AfterResolutionChanged()

	if not self:IsOnScreen() then
		self.resolutionDirty = true
		return
	end

	self.resolutionDirty = false

	if self.toRestore then
		self.toRestore = false
		self.prevResolution = nil

		if self.toHide then
			self.toHide = false
			self:ReturnToPrevWindow()
		end
	else
		self:StartWaitingForRestoreResolution()
	end

end


--
function UI.OptionsWnd:MakeRestoreResolutionStr( time, msgBox )

	local color = msgBox:GetColor( UI.MsgBox.layers.MSG )

	local strRestoreResolution = UI:GetStringByName( "msg_restoreResolution" ) 
	local strTimer = string.format( "%s%d%s", UI:Color2Str( self.RESOLUTION_TIMER_COLOR ), math.ceil( time ), UI:Color2Str( color ) )

	return string.format( strRestoreResolution, strTimer ) 

end


--
function UI.OptionsWnd:F_OnEventTimer( hSender, iParam0, iParam1, fParam0, fParam1 )

	if iParam0 ~= self.hTimer_resolution then
		return
	end

   	local box = UI:GetUiObjByHandleT( self.hMsgResolution )
   	if box then
   		box:SetMsg( self:MakeRestoreResolutionStr( fParam0, box ) )
	else
		sys.log( "UI.OptionsWnd:F_OnEventTimer()[ERROR] - timer for restoring resolution is active, but there isn't any message box" )
   	end  

end


--
function UI.OptionsWnd:F_OnEventTimerActive( hSender, iParam0, iParam1, fParam0, fParam1 )

	if iParam1 ~= 0 then
		return
	end

	if iParam0 ~= self.hTimer_resolution then
		return
	end

	UI:RemoveUiObj( self.hMsgResolution )
    self.hMsgResolution = UI.INVALID_UI_HANDLE
    self:StopWaitingForRestoreResolution( true )

end 


--
function UI.OptionsWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	local comboBox = UI:GetUiObjByHandleT( hSender )
	if not comboBox:IsChildOf( self ) then
		return
	end

	if self.bIgnoreComboSelection then
		return
	end

	local selRecordIdx = iParam0
	if selRecordIdx == -1 then
		return
	end

	local option	= nil
	local val		= nil

	-- TODO: переделать! не универсально, нельзя применить Options_IconsComboBox в другом контексте;
	-- нужно сделать чтобы опция так же получалась из родительского слота

	if UI:IsWndKindOf( comboBox, "Options_IconsComboBox" ) then

		local selSlotIdx = fParam0
		local data = comboBox:GetSlotData( selRecordIdx, selSlotIdx )

		option	= data.option
		val		= data.optionVal

	else

    	local slotWnd = comboBox:GetParent()

    	option	= slotWnd:GetOption()
    	val		= comboBox:GetRecordData( selRecordIdx ).optionVal

	end

	UI.Options:SetCustomCurVal( option, val )	

end


--
function UI.OptionsWnd:OnEscape()

	self:TryReturnToPrevWindow( false )
	UI:PlayGlobalSound( self.sounds.hideCancel )

	return true

end


--
function UI.OptionsWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	if self.optionsList then
		self:MoveChildToLastPosition( self.optionsList )
	end

end


--
function UI.OptionsWnd:SelectHudSubSet( subSet )

	self.selSubSet = subSet

	self:UpdateOptionsControls()
	self:UpdateKeyTipPanel()

end


--
function UI.OptionsWnd:UpdateHudPreviews()

	local bVisible = self:GetSelectedSet() == "Hud" and self.selSubSet == "HudCommon"

	if bVisible then

		self:AddChild( UI.Options_HudCommonPreviewMainWnd )
		UI.Options_HudCommonPreviewMainWnd:FullUpdate()

		self:AddChild( UI.Options_HudCommonPreviewDetailsWnd )
		UI.Options_HudCommonPreviewDetailsWnd:FullUpdate()

	else

		if UI.Options_HudCommonPreviewMainWnd:IsChildOf( self ) then
			UI.Options_HudCommonPreviewMainWnd:Reset()
			UI.Options_HudCommonPreviewMainWnd:UnlinkFromParent()
		end

		if UI.Options_HudCommonPreviewDetailsWnd:IsChildOf( self ) then
			UI.Options_HudCommonPreviewDetailsWnd:Reset()
			UI.Options_HudCommonPreviewDetailsWnd:UnlinkFromParent()
		end

	end

end


--
function UI.OptionsWnd:SetHudMarksDefault()

	local optionName = self.selSubSet == "HudMarks" and "marksElements_default" or "marksElements_default_ally"
	local option = UI.Options:GetOptionByName( optionName )
	if option then
		UI.Options:SetCustomCurVal( option, true )
	else
		sys.log( "UI.OptionsWnd:SetHudMarksDefault()[ERROR]: cannot find option \"%s\"", optionName )
	end		

end


--
function UI.OptionsWnd:ResetOculus()

	sys.concmd( "g_resetOculus" )

end


--
function UI.OptionsWnd:StartVoiceChatRecTest()

	self.recTestTimer = self.REC_TEST_TIME
	cvars.mictest_enable = 1

	self:UpdateVoiceChatRecDisabledState()

end


--
function UI.OptionsWnd:StopVoiceChatRecTest()

	self.recTestTimer = -1
	cvars.mictest_enable = 0	

	self:UpdateVoiceChatRecDisabledState()

end


--
function UI.OptionsWnd:UpdateVoiceChatRecDisabledState()

	local bIsTest = self.recTestTimer ~= -1

	local devicesOption = UI.Options:GetOptionByName( "voicechatRecDevices" )
	if devicesOption then

    	devicesOption.bDisabled = bIsTest

		if self.optionsList then
	    	self.optionsList:OnOptionValueChanged( devicesOption )
		end

	end

	local devicesRefreshOption = UI.Options:GetOptionByName( "voicechatRefreshRecDevices" )
	if devicesRefreshOption then

    	devicesRefreshOption.bDisabled = bIsTest

		if self.optionsList then
    		self.optionsList:OnOptionValueChanged( devicesRefreshOption )
		end

	end

	local startTestOption = UI.Options:GetOptionByName( "voicechatStartRecTest" )
	if startTestOption then

		local bInGame = _G.GetCurrentGameMode ~= nil and _G.GetCurrentGameMode() ~= ai.Gameplay.NONE

    	startTestOption.bDisabled = bIsTest or bInGame

		if self.optionsList then
	    	self.optionsList:OnOptionValueChanged( startTestOption )
		end

	end

end


--
function UI.OptionsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateVoiceChatRecTestTimer( dt_sys )

end


--
function UI.OptionsWnd:UpdateVoiceChatRecTestTimer( dt )

	if self.recTestTimer == -1 then
		return
	end

	self.recTestTimer = self.recTestTimer - dt

	if self.recTestTimer <= 0 then
		self:StopVoiceChatRecTest()
	end

end


-- -----------------------------------------------------------------
-- UI.Options_SetListWnd
-- -----------------------------------------------------------------

UI.Options_SetListWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "ButtonsListWnd",

    	props =
    	{
    		name			= "Options_SetListWnd",
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
    				defName				= "options_setList",

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

    btnPrototypeName	= "Options_SetSlotWnd",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "slot",
    		scrollObjName		= "",
    		animIdle			= "idle",
    	}
    },

    listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION,

    MAX_SLOTS = 10,
}


-- -----------------------------------------------------------------
-- UI.Options_SetSlotWnd
-- -----------------------------------------------------------------

UI.Options_SetSlotWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.Options_SetSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Options_SetSlotWnd",
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
				defName				= "options_setSlot",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Options_SetSlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "over",
						layer		= "UI.Options_SetSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName = "Small",
   			},
		},  

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "options_setSlot_mouseOver",
				defaultAnimation    = "idle",
			}}
		}
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.Options_SetSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.TEXT )
	self:SetMouseOver( false )

end


--
function UI.Options_SetSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )
	self:UpdateAnimation()

end


-- --------------------------------
-- const
-- --------------------------------

UI.Options_SetSlotWnd.SET_SLOT = true

UI.Options_SetSlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	TEXT				= 1,
	MOUSE_OVER_EFFECT	= 2,
}

UI.Options_SetSlotWnd.effectInfo =
{
	main =
	{
		animSel					= "select",
		animUnsel				= "idle",
		animDisabled			= "disable",
	}
}

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.Options_SetSlotWnd:UpdateForData( data, bAnimated )

	self:UpdateText( data )
	self:UpdateAnimation( data )

end


--
function UI.Options_SetSlotWnd:UpdateText( data )

    local strId = string.format( "optionSet_%s", data.setName )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.TEXT )		

end


--
function UI.Options_SetSlotWnd:UpdateAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local isSelected = self:IsSelected()
	local isDisabled = data and data.bDisabled or false

	local anim = ""

	if isSelected then
		anim = self.effectInfo.main.animSel
	elseif isDisabled then
		anim = self.effectInfo.main.animDisabled
	else
		anim = self.effectInfo.main.animUnsel
	end

	mainEffect:StartAnimation( anim )	

end


--
function UI.Options_SetSlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Options_SetSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.OptionsWnd.sounds.setMouseOver )
	end

end


--
function UI.Options_SetSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )

	return true

end


--
function UI.Options_SetSlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Options_SetSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOver()

end


-- -----------------------------------------------------------------
-- UI.Options_OptionListWnd
-- -----------------------------------------------------------------

UI.Options_OptionListWnd = {}
local ol = UI.Options_OptionListWnd

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_OptionListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "Options_OptionListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "options_optionList",
				defaultAnimation    = "sample",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_1",
						layer		= "UI.Options_OptionListWnd.layers.CAPTION_1",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- CAPTION_1
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName = "Small",
   			},
		},  

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x44ff0000,
			visible		= false,
		}
	}
}

-- -----------------------------------
-- interface funcions
-- -----------------------------------

--
function UI.Options_OptionListWnd:OnOptionValueChanged( option )

	local recordIdx = self:GetRecordByOptionName( option.id )
	if recordIdx ~= -1 then

		local slot = self:GetButtonForRecord( recordIdx )
		if slot then
			slot:OnOptionValueChanged()
		end

	end

end


-- -----------------------------------
-- const
-- -----------------------------------

ol.btnPrototypeName	= "Options_OptionSlotWnd"

ol.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll",
	}
}

ol.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

ol.MAX_SLOTS = 11

ol.layers =
{
	MAIN_EFFECT		= 0,
	CAPTION_1		= 1,
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_OptionListWnd:GetRecordByOptionName( optionName )

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		if data.option and data.option.id == optionName then
			return recordIdx
		end

	end

	return -1

end


-- -----------------------------------------------------------------
-- UI.Options_OptionSlotWnd
-- -----------------------------------------------------------------

UI.Options_OptionSlotWnd = {}
local os = UI.Options_OptionSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Options_OptionSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "Options_OptionSlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "options_optionSlot",
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

-- ------------------------------
-- interface funcitons
-- ------------------------------

--
function UI.Options_OptionSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:ResetControls()

end


--
function UI.Options_OptionSlotWnd:OnOptionValueChanged()

	local option = self:GetOption()

	if option then
		self:UpdateControlsForOption( option )
		self:UpdateDisabledState( option )
	end

end


--
function UI.Options_OptionSlotWnd:GetControlsType()

	return self.controlsType

end


-- ------------------------------
-- const
-- ------------------------------

os.controlsTypes =
{
	NONE		= 0,
	CHECKBOX	= 1,
	COMBOBOX	= 2,
	SLIDER		= 3,
	LABEL		= 4,
	BTN			= 5,
	REC_TEST	= 6,
}

os.effectInfo =
{
	main =
	{
		controlLocators =
		{				
			Options_CheckBoxWnd			= "chek_box",
			Options_ComboBoxWnd			= "drop_down",
			Options_SliderWnd			= "slider",
			Options_SliderWnd_uiSize	= "slider",
			Options_SliderWnd_fps		= "slider",
			Options_LabelValWnd			= "text_2",
			Options_LabelNameWnd		= "text_over",
			Options_ControlBtn			= "btn",
			Options_RecTestPreviewWnd	= "volume_ind",
		},
	}
}

-- ------------------------------
-- vars
-- ------------------------------

os.controlsType		= os.controlsTypes.NONE
os.checkBoxWnd		= nil
os.comboBoxWnd		= nil
os.sliderWnd		= nil
os.labelNameWnd		= nil
os.labelValWnd		= nil
os.btnWnd			= nil
os.recTestWnd		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Options_OptionSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:Reset()

end


--
function UI.Options_OptionSlotWnd:UpdateForData( data, bAnimated )

	local option = data.option

	if not option then
		self:Reset()
		return
	end

	self:InitControls( option )

	self:UpdateDisabledState( option )
	self:PrepareControlsForOption( option )
	self:UpdateControlsForOption( option )
	self:UpdateTooltip( option )

end


--
function UI.Options_OptionSlotWnd:UpdateTooltip( option )

	local tooltipData = nil

	if type( option.GetTooltipData ) == "function" then

		tooltipData = option:GetTooltipData()

	else

		if not UI:IsStrEmpty( option.strId ) then

        	tooltipData =
        	{
        		tooltipType = UI.tooltipTypes.TEXT_LARGE,
        		caption		= UI:GetStringByName( option.strId ),
        		text		= UI:GetStringForPlatform( string.format( "%s_desc", option.strId ) )
        	}

		end

	end	

	local labelWnd = nil 

	if self.controlsType == self.controlsTypes.LABEL then
    	labelWnd = self.labelValWnd
	else
    	labelWnd = self.labelNameWnd
	end

	if labelWnd then
		labelWnd:SetTooltipData( tooltipData )
	end

end    


--
function UI.Options_OptionSlotWnd:CreateControls()
end


--
function UI.Options_OptionSlotWnd:ResetControls()

	if self.checkBoxWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.checkBoxWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.checkBoxWnd:GetUiHandle() )
		self.checkBoxWnd = nil

	end

	if self.comboBoxWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.comboBoxWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.comboBoxWnd:GetUiHandle() )
		self.comboBoxWnd = nil

	end

	if self.sliderWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.sliderWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.sliderWnd:GetUiHandle() )
		self.sliderWnd = nil

	end

	if self.labelValWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.labelValWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.labelValWnd:GetUiHandle() )
		self.labelValWnd = nil

	end

	if self.labelNameWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.labelNameWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.labelNameWnd:GetUiHandle() )
		self.labelNameWnd = nil

	end

	if self.btnWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.btnWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.btnWnd:GetUiHandle() )
		self.btnWnd = nil

	end

	if self.recTestWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.recTestWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.recTestWnd:GetUiHandle() )
		self.recTestWnd = nil

	end

	self.controlsType = self.controlsTypes.NONE

	UI:Purge()

end


--
function UI.Options_OptionSlotWnd:InitControls( option )

	local controlsType = self:DedectControlsTypeForOption( option )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self:ResetControls()

	if controlsType == self.controlsTypes.CHECKBOX then

		local controlPrototypeName = "Options_CheckBoxWnd"

		self.checkBoxWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )
		self.checkBoxWnd:Check( false )
		UI:AddChildAndLink( self, self.checkBoxWnd, mainEffect, self.effectInfo.main.controlLocators[ controlPrototypeName ], UI.EffectAnimParams.POS )

	elseif controlsType == self.controlsTypes.COMBOBOX then

		local controlPrototypeName = "Options_ComboBoxWnd"

		self.comboBoxWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )		
		self.comboBoxWnd:Reset()
		UI:AddChildAndLink( self, self.comboBoxWnd, mainEffect, self.effectInfo.main.controlLocators[ controlPrototypeName ], UI.EffectAnimParams.POS )

	elseif controlsType == self.controlsTypes.SLIDER then

		local controlPrototypeName = "Options_SliderWnd"

		if option.id == "uiSize" then
			controlPrototypeName = "Options_SliderWnd_uiSize"

		elseif option.id == "fpsActive" or option.id == "fpsInactive" or option.id == "oculusSuperSampling" then
			controlPrototypeName = "Options_SliderWnd_fps"
		end

		self.sliderWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )
		UI:AddChildAndLink( self, self.sliderWnd, mainEffect, self.effectInfo.main.controlLocators[ controlPrototypeName ], UI.EffectAnimParams.POS )

	elseif controlsType == self.controlsTypes.LABEL then

		local controlPrototypeName = "Options_LabelValWnd"

		self.labelValWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )
		self.labelValWnd:Reset()
		UI:AddChildAndLink( self, self.labelValWnd, mainEffect, self.effectInfo.main.controlLocators[ controlPrototypeName ], UI.EffectAnimParams.POS )

	elseif controlsType == self.controlsTypes.BTN then

		local controlPrototypeName = "Options_ControlBtn"

		self.btnWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )		
		self.btnWnd:SetBtnText( "" )
		UI:AddChildAndLink( self, self.btnWnd, mainEffect, self.effectInfo.main.controlLocators[ controlPrototypeName ], UI.EffectAnimParams.POS )

	elseif controlsType == self.controlsTypes.REC_TEST then

		local controlPrototypeName = "Options_RecTestPreviewWnd"

		self.recTestWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )		
		self.recTestWnd:Reset()
		UI:AddChildAndLink( self, self.recTestWnd, mainEffect, self.effectInfo.main.controlLocators[ controlPrototypeName ], UI.EffectAnimParams.POS )

	elseif controlsType == self.controlsTypes.NONE then
		-- nothing

	else
		sys.log( "UI.Options_OptionSlotWnd:InitControls()[ERROR]: unhandled controls type: %s", tostring( controlsType ) )
	end


	if controlsType ~= self.controlsTypes.LABEL then

		local controlPrototypeName = "Options_LabelNameWnd"

		self.labelNameWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )
		self.labelNameWnd:Reset()
		UI:AddChildAndLink( self, self.labelNameWnd, mainEffect, self.effectInfo.main.controlLocators[ controlPrototypeName ], UI.EffectAnimParams.POS )

	end

	self.controlsType = controlsType

end


--
function UI.Options_OptionSlotWnd:PrepareControlsForOption( option )

	-- на данный момент ничего

end


--
function UI.Options_OptionSlotWnd:UpdateControlsForOption( option )

	if self.controlsType == self.controlsTypes.CHECKBOX then

		self.checkBoxWnd:Check( option.value.cur )		

	elseif self.controlsType == self.controlsTypes.COMBOBOX then

		self.comboBoxWnd:Reset()

		for valIdx = 1, #option.value.list do

			local data = {}
			data.optionVal	= option.value.list[ valIdx ]
			data.text		= UI.Options:GetOptionValAsStr( option, data.optionVal )

			if option.id == "cursorColors" then
				data.color = UI.gameCursorColors[ data.optionVal ] and UI.gameCursorColors[ data.optionVal ].color or UI.WHITE_COLOR

			elseif option.id == "predictionColors" then
				data.color = UI.gameCursorColors[ data.optionVal ] and UI.predictionColors[ data.optionVal ].color or UI.WHITE_COLOR
			end

			self.comboBoxWnd:AddRecord( data )

		end

		local selRecord = UI.Options:GetValPos( option, option.value.cur )
		if selRecord ~= -1 then

    		UI.OptionsWnd.bIgnoreComboSelection = true
    		self.comboBoxWnd:SelectRecord( selRecord )
    		UI.OptionsWnd.bIgnoreComboSelection = false

		else

			local str = UI.Options:GetOptionValAsStr( option, option.value.cur )
			self.comboBoxWnd:SetSelectedText( str )

		end

	elseif self.controlsType == self.controlsTypes.SLIDER then

		self.sliderWnd:SetMinMax( option.value.range.min, option.value.range.max )
		self.sliderWnd:SetVal( option.value.cur )		

	elseif self.controlsType == self.controlsTypes.LABEL then

		local text = ""

		if not UI:IsStrEmpty( option.strId ) then
    		text = UI:GetStringByName( option.strId )
		end

    	self.labelValWnd:SetCaption( text )

	elseif self.controlsType == self.controlsTypes.BTN then

		local text = UI:GetStringByName( option.btnStrId )
		self.btnWnd:SetBtnText( text )

	elseif self.controlsType == self.controlsTypes.REC_TEST then
		-- ничего

	elseif self.controlsType == self.controlsTypes.NONE then
		-- ничего

	else
		sys.log( "UI.Options_OptionSlotWnd:UpdateControlsForOption()[ERROR]: unhandled controls type: %s", tostring( self.controlsType ) )
	end

	
	if self.controlsType ~= self.controlsTypes.LABEL then

		local text = ""

		if not UI:IsStrEmpty( option.strId ) then
			text = UI:GetStringByName( option.strId )
		end

		self.labelNameWnd:SetCaption( text )

	end

end


--
function UI.Options_OptionSlotWnd:DedectControlsTypeForOption( option )

	if option.id == "voicechatRecTestPreview" then
		return self.controlsTypes.REC_TEST

	elseif not option.value then

		if option.isBtn then
			return self.controlsTypes.BTN
		else		
			return self.controlsTypes.LABEL
		end

	elseif option.value.range then

		return self.controlsTypes.SLIDER

	elseif option.value.list then

		if #option.value.list == 2 and type( option.value.list[ 1 ] ) == "boolean" and type( option.value.list[ 2 ] ) == "boolean" then
			return self.controlsTypes.CHECKBOX
		else
			return self.controlsTypes.COMBOBOX
		end

	else

		sys.log( "UI.Options_OptionSlotWnd:DedectControlsTypeForOption()[ERROR]: cannot detect controls type for option \"%s\"", option.id )
		return self.controlsTypes.NONE
	
	end

end


--
function UI.Options_OptionSlotWnd:GetOption()

	local data = self:GetRecordData()
	return data and data.option

end


--
function UI.Options_OptionSlotWnd:UpdateDisabledState( option )

	local bDisabled = option and option.bDisabled

	if bDisabled == nil then
		bDisabled = false
	end

	if self.controlsType == self.controlsTypes.CHECKBOX then
		self.checkBoxWnd:Enable( not bDisabled )

	elseif self.controlsType == self.controlsTypes.COMBOBOX then
		self.comboBoxWnd:Enable( not bDisabled )

	elseif self.controlsType == self.controlsTypes.SLIDER then
		self.sliderWnd:Enable( not bDisabled )

	elseif self.controlsType == self.controlsTypes.BTN then
		self.btnWnd:Enable( not bDisabled )
	end

end


--
function UI.Options_OptionSlotWnd:IsDisabled( data )

	local option = self:GetOption()
	local bDisabled = option and option.bDisabled

	if bDisabled == nil then
		bDisabled = false
	end

	return bDisabled

end


-- -----------------------------------------------------------------
-- UI.Options_CheckBoxWnd
-- -----------------------------------------------------------------

UI.Options_CheckBoxWnd =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "EffectCheckBoxWnd",

    	props =
    	{
    		name		= "Options_CheckBoxWnd",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.checkBox,
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
    				defName				= "options_checkBox",
    				defaultAnimation    = "idle",

    				links =
    				{     
    					{
    						objName		= "self_2",
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
    		animationSelect		= "idle_over",
    		animationPressed	= "idle_over",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "chek",
    		animationSelect		= "chek_over",
    		animationPressed	= "chek_over",
    		animationDisabled	= "disable_chek",
    	},
    }
}


-- -----------------------------------------------------------------
-- UI.Options_ComboBoxWnd
-- -----------------------------------------------------------------

UI.Options_ComboBoxWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "Options_ComboBoxWnd",
			isPrototype	= true,
		}
	},

	MAX_VISIBLE_RECORDS = 5
}

-- -----------------------------------------------------------------
-- UI.Options_SliderWnd
-- -----------------------------------------------------------------

UI.Options_SliderWnd =
{
	def =
    {
    	className	= "Wnd",
    	prototype	= "EffectSliderWnd",

    	props =
    	{
    		name		= "Options_SliderWnd",
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
    				defName 			= "options_slider_main",
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
    },

	sliderBarPrototypeName	= "Options_Slider_BarWnd",

    effectInfo =
    {
    	main =
    	{
    		sliderBarObjName	= "slider",
			animIdle			= "idle",
			animDisabled		= "idle",
    	}
    },

    sliderStyle = UI.EffectSliderWnd.sliderStyles.HAS_BAR,
}


-- -----------------------------------------------------------------
-- UI.Options_SliderWnd_uiSize
-- -----------------------------------------------------------------

UI.Options_SliderWnd_uiSize = {}

--
UI.Options_SliderWnd_uiSize.layers =
{
    MAIN_EFFECT					= 0,
    ADDITIONAL_CONTROLS_EFFECT	= 1,
    MIN_LABEL					= 2,
    MAX_LABEL					= 3,
}

--
UI.Options_SliderWnd_uiSize.def =
{
	className	= "Wnd",
	prototype	= "Options_SliderWnd",

	props =
	{
		name		= "Options_SliderWnd_uiSize",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.Options_SliderWnd_uiSize.layers.ADDITIONAL_CONTROLS_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "options_slider_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},


 					{
 						objName		= "slider_tick",
 						layer		= "UI.Options_SliderWnd_uiSize.layers.ADDITIONAL_CONTROLS_EFFECT",
 						animParams	= UI.EffectAnimParams.POS,
 					},
				}
			}}
		},

		-- ADDITIONAL_CONTROLS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "options_slider_additionalUiSize",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_1",	
						layer		= "UI.Options_SliderWnd_uiSize.layers.MIN_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_4",	
						layer		= "UI.Options_SliderWnd_uiSize.layers.MAX_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- MIN_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName = "Small",
   			},
			text = "^options_uiSizeTick_1",
		},  

		-- MAX_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName = "Small",
   			},
			text = "^options_uiSizeTick_4",
		},  
	},
}

-- -----------------------------------------------------------------
-- UI.Options_SliderWnd_fps
-- -----------------------------------------------------------------

UI.Options_SliderWnd_fps = {}

-- ---------------------------
-- window definition
-- ---------------------------

--
UI.Options_SliderWnd_fps.layers =
{
    MAIN_EFFECT					= 0,
    ADDITIONAL_CONTROLS_EFFECT	= 1,
    MIN_LABEL					= 2,
    MAX_LABEL					= 3,
	CUR_VAL						= 4,
}

--
UI.Options_SliderWnd_fps.def =
{
	className	= "Wnd",
	prototype	= "Options_SliderWnd",

	props =
	{
		name		= "Options_SliderWnd_fps",
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.Options_SliderWnd_fps.layers.ADDITIONAL_CONTROLS_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "options_slider_mainFps",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},


 					{
 						objName		= "slider_tick_2",
 						layer		= "UI.Options_SliderWnd_fps.layers.ADDITIONAL_CONTROLS_EFFECT",
 						animParams	= UI.EffectAnimParams.POS,
 					},
				}
			}}
		},

		-- ADDITIONAL_CONTROLS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "options_slider_additionalFps",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_1",	
						layer		= "UI.Options_SliderWnd_fps.layers.MIN_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_4",	
						layer		= "UI.Options_SliderWnd_fps.layers.MAX_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_5",	
						layer		= "UI.Options_SliderWnd_fps.layers.CUR_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- MIN_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName = "Small",
   			},
			text = "^options_fps_min",
		},  

		-- MAX_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
				fontName = "Small",
   			},
			text = "^options_fps_max",
		},  

		-- CUR_VAL
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
}

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Options_SliderWnd_fps:UpdateControls()

	UI.Options_SliderWnd.UpdateControls( self )
	self:UpdateCurValText()

end


--
function UI.Options_SliderWnd_fps:UpdateCurValText()

	local option = self:GetOption()

	local val = option and option:Inner2Cvar( self.val ) or self.val

	local strVal = ""

	if val == 0 then
		strVal = UI:GetStringByName( "unlimitedFps" )
	else
		strVal = string.format( "%.1f", val )
	end

	self:SetText( strVal, self.layers.CUR_VAL )

end


--
function UI.Options_SliderWnd_fps:GetOption()

	local parent = self:GetParent()
	if parent then

		local recordData = parent:GetRecordData()
		if recordData then
			return recordData.option
		end

	end

	return nil

end


-- -----------------------------------------------------------------
-- UI.Options_Slider_BarWnd
-- -----------------------------------------------------------------

UI.Options_Slider_BarWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectSlider_BarWnd",

		props =
		{
			name		= "Options_Slider_BarWnd",
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
    				defName 			= "options_slider_bar",
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
	},

	effectInfo =
	{
		main =
		{
			inputRectObjName	= "dist",
			animIdle			= "idle",
			animDisabled		= "idle_disable",
		}
	}
}

-- ----------------------------------------------------------------------------
--  UI.Options_ControlBtn
-- ----------------------------------------------------------------------------

UI.Options_ControlBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "TextBtn6",

     	props =
     	{
     		name			= "Options_ControlBtn",
    		isPrototype		= true,
     	},
    }
}

-- ----------------------------------------------------------------------------
--  UI.Options_RecTestPreviewWnd
-- ----------------------------------------------------------------------------

UI.Options_RecTestPreviewWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_RecTestPreviewWnd.def =
{   	
 	className	= "Wnd",

 	props =
 	{
 		name			= "Options_RecTestPreviewWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype		= true,
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
				defName				= "options_recTestPreview",
				defaultAnimation    = "idle",

				links =
				{     
            		{
            			objName		= "self",
            			animParams	= UI.EffectAnimParams.SIZE,
            		},

            		{
            			objName		= "title6",
            			layer		= "UI.Options_RecTestPreviewWnd.layers.TIMER",
            			animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
            		},
				}
			}}
		},

		-- TIMER
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	}
}

-- -----------------------------------
-- interface unctions
-- -----------------------------------

--
function UI.Options_RecTestPreviewWnd:Reset()

	self:SetLayerVisible( false, self.layers.TIMER )

	local pbEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if pbEffect then
		pbEffect:SetAnimationTime( 0 )
	end		

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Options_RecTestPreviewWnd.layers =
{
	MAIN_EFFECT	= 0,
	TIMER		= 1,
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_RecTestPreviewWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTimer()
	self:UpdateVolume()

end                      


--
function UI.Options_RecTestPreviewWnd:UpdateTimer()

	local timer = UI.OptionsWnd:GetVoiceChatRecTestTimer()

	if timer == -1 then
		self:SetLayerVisible( false, self.layers.TIMER )

	else
		self:SetLayerVisible( true, self.layers.TIMER )

		local strTimer = tostring( math.ceil( timer ) )
		self:SetText( strTimer, self.layers.TIMER )		
	end

end


--
function UI.Options_RecTestPreviewWnd:UpdateVolume()

	local timer = UI.OptionsWnd:GetVoiceChatRecTestTimer()
	local volume = 0

	if timer ~= -1 then
		volume = _G.MicTest_GetLastVolume()
	end

	local pbEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if pbEffect then
		pbEffect:SetAnimationTime( volume )
		pbEffect:Update( 0 )
	end		
	
end


-- ----------------------------------------------------------------------------
--  UI.Options_Btn
-- ----------------------------------------------------------------------------

UI.Options_Btn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "TextBtn3",

     	props =
     	{
     		name			= "Options_Btn",
    		isPrototype		= true,
     	},
    }
}

-- --------------------------------------------------------------------------------------------
--  UI.Options_OkBtn, UI.Options_CancelBtn, UI.Options_ApplyBtn, UI.Options_HudMarksDefaultBtn
-- --------------------------------------------------------------------------------------------

--
UI.Options_OkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Options_Btn",

		props =
		{
			name = "Options_OkBtn"
		}
	},

	textId = "options_okBtn"
}


--
UI.Options_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Options_Btn",

		props =
		{
			name = "Options_CancelBtn"
		}
	},

	textId = "options_cancelBtn"
}


--
UI.Options_ApplyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Options_Btn",

		props =
		{
			name = "Options_ApplyBtn"
		}
	},

	textId = "options_applyBtn"
}

--
UI.Options_HudMarksDefaultBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Options_Btn",

		props =
		{
			name = "Options_HudMarksDefaultBtn"
		}
	},

	textId = "options_marksElements_default"
}

-- ----------------------------------------------------------------------------
-- UI.Options_ResetOculusBtn
-- ----------------------------------------------------------------------------

UI.Options_ResetOculusBtn = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Options_ResetOculusBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Options_Btn",

	props =
	{
		name = "Options_ResetOculusBtn"
	},
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.Options_ResetOculusBtn:GetTooltipData()

	return self.tooltipData

end

-- ----------------------------------
-- const
-- ----------------------------------

UI.Options_ResetOculusBtn.textId = "options_resetOculusBtn"

-- ----------------------------------
-- vars
-- ----------------------------------

UI.Options_ResetOculusBtn.tooltipData	= nil

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.Options_ResetOculusBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateTooltip()

end


--
function UI.Options_ResetOculusBtn:UpdateTooltip()
	
	self.tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "resetOculus_tooltipCaption" ),
	}

	local strBaseColor	= UI:Color2Str( UI.TEXT_BASE_COLOR )
	local strSelColor	= UI:Color2Str( UI.TEXT_SEL_COLOR )

	local strBind = UI:GetBindKeysStr( "resetOculus", true )
	strBind = string.format( "%s%s%s", strSelColor, strBind, strBaseColor )

	self.tooltipData.text = UI:GetStringByName( "resetOculus_tooltipText" )
	self.tooltipData.text = string.gsub( self.tooltipData.text, "%$hot_key%$", strBind )
	self.tooltipData.text = string.format( "%s%s", strBaseColor, self.tooltipData.text )

end


-- ----------------------------------------------------------------------------
--  UI.Options_LabelWnd
-- ----------------------------------------------------------------------------

UI.Options_LabelWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Options_LabelWnd.def =
{   	
 	className	= "Wnd",

 	props =
 	{
 		name			= "Options_LabelWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype		= true,
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
 	},
}

-- ------------------------------
-- interface function
-- ------------------------------

--
function UI.Options_LabelWnd:SetCaption( text )

	self:SetText( text, self.layers.TEXT )

end


--
function UI.Options_LabelWnd:Reset()

	self:SetText( "", self.layers.TEXT )
	self.tooltipData = nil

end


--
function UI.Options_LabelWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.Options_LabelWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.Options_LabelWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Options_LabelWnd.tooltipData = nil


-- ----------------------------------------------------------------------------
--  UI.Options_LabelNameWnd
-- ----------------------------------------------------------------------------

UI.Options_LabelNameWnd =
{
	def =
    {   	
     	className	= "Wnd",
    	prototype	= "Options_LabelWnd",

     	props =
     	{
     		name			= "Options_LabelNameWnd",
    		isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "options_slot_labelName",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.Options_LabelNameWnd.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}			
    		},
     	},
    }
} 

-- ----------------------------------------------------------------------------
--  UI.Options_LabelValWnd
-- ----------------------------------------------------------------------------

UI.Options_LabelValWnd =
{
	def =
    {   	
     	className	= "Wnd",
    	prototype	= "Options_LabelWnd",

     	props =
     	{
     		name			= "Options_LabelValWnd",
    		isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "options_slot_labelVal",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text_2",
    						layer		= "UI.Options_LabelNameWnd.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}			
    		},
     	},
    }
}    

-- ------------------------------------------------------------------------
-- UI.Options_CrossBtn
-- ------------------------------------------------------------------------

UI.Options_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "Options_CrossBtn"
    	}
	}
}

-- ------------------------------------------------------------------------
-- UI.Options_HudCommonOptionListWnd
-- ------------------------------------------------------------------------

UI.Options_HudCommonOptionListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Options_HudCommonOptionListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "Options_HudCommonOptionListWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "options_hudCommonOptionList",
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

-- -----------------------------------
-- interface funtions
-- -----------------------------------

--
function UI.Options_HudCommonOptionListWnd:GetMaxScrollPos()

	local totalHeight	= self:GetTotalSlotsHeight()
	local visibleHeight	= self.slotsRect.w

	if totalHeight == 0 or visibleHeight == 0 then
		return -1
	end

	return math.max( totalHeight - visibleHeight, 0 )

end


--
function UI.Options_HudCommonOptionListWnd:GetMinScrollPos()

	local totalHeight	= self:GetTotalSlotsHeight()
	local visibleHeight	= self.slotsRect.w

	if totalHeight == 0 or visibleHeight == 0 then
		return -1
	end

	return 0

end


--
function UI.Options_HudCommonOptionListWnd:SetScrollPos( scrollPos, bUpdateScrollBar, bAnimated )

	if scrollPos ~= -1 then

		local maxScrollPos = self:GetMaxScrollPos()
		if maxScrollPos ~= -1 then
			scrollPos = UI:Clamp( scrollPos, 0, maxScrollPos )
		else
			scrollPos = -1
		end

	end

	if scrollPos == self.scrollPos then
		return
	end

	self.scrollPos = scrollPos

	self.firstVisibleRecordIdx = self:GetFirstRecordIdx()

	self:UpdateOnChangeVisibleRange( bUpdateScrollBar, bAnimated )	

end


--
function UI.Options_HudCommonOptionListWnd:SetMaxSlots( maxSlots )

	if self:GetNumRecords() > 0 then
		sys.log( "UI.Options_HudCommonOptionListWnd:InitMaxSlots()[ERROR]: not empty list" )
	end

	self:Clear()

	for idx, slot in pairs( self.allSlots ) do
		if slot.btn then
			UI:RemoveUiObj( slot.btn:GetUiHandle() )
			slot.btn = nil
		end
	end

	UI:Purge()
	self.allSlots = {}

	self.MAX_SLOTS = maxSlots
	self:InitSlots()

	self:RecalcLayout()	
	self:UpdateScrollBarRange()
	self:UpdateScrollBarPageSize()

end


--
function UI.Options_HudCommonOptionListWnd:OnOptionValueChanged( option )

	local recordIdx = self:GetRecordByOptionName( option.id )
	if recordIdx ~= -1 then

		local slot = self:GetButtonForRecord( recordIdx )
		if slot then
			slot:OnOptionValueChanged( option )
		end

	end

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Options_HudCommonOptionListWnd.btnPrototypeName = "Options_HudCommonOptionSlotWnd"

UI.Options_HudCommonOptionListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll",
	}
}

UI.Options_HudCommonOptionListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.Options_HudCommonOptionListWnd.MAX_SLOTS = 0

UI.Options_HudCommonOptionListWnd.SCROLL_STEP = 20


-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_HudCommonOptionListWnd:GetRecordByOptionName( optionName )

	local bIsCursorOption = UI.OptionsWnd:IsCursorOption( optionName )

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )

		if data.bCursor then

			if bIsCursorOption then
    			return recordIdx
			end

		else

    		if not bIsCursorOption and data.option and data.option.id == optionName then
    			return recordIdx
    		end

		end

	end

	return -1

end


--
function UI.Options_HudCommonOptionListWnd:InitScrollBar()	

	UI.ButtonsList3Wnd.InitScrollBar( self )

	self:UpdateScrollBarPageSize()

	if self.scrollBar then
		self.scrollBar:SetStepSize( self.SCROLL_STEP )
	end

end


--
function UI.Options_HudCommonOptionListWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local firstSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) )
	local secondSlotPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) )

	local firstSlotHeight = 0

	local effectOnFirstLocator = _G.UI_SpawnEffect( "options_hudCheckBox", self:GetUiHandle() )
	if effectOnFirstLocator then

		firstSlotHeight = effectOnFirstLocator:GetObjSize( "self" ).y
		_G.UI_DestroyEffect( effectOnFirstLocator )	

	end

	self.slotsSpace = secondSlotPos.y - ( firstSlotPos.y + firstSlotHeight )

	local selfRect = self:GetRect()

	self.slotsRect.x = 0
	self.slotsRect.y = firstSlotPos.y
	self.slotsRect.z = selfRect.z
	self.slotsRect.w = selfRect.w - firstSlotPos.y * 2

	self.slotsWnd:SetRect( self.slotsRect )

	local slotX = firstSlotPos.x - self.slotsWnd:GetLeft()

	for idx, slot in pairs( self.allSlots ) do
		if slot.btn then
			slot.btn:SetLeft( slotX )
		end
	end

end


--
function UI.Options_HudCommonOptionListWnd:GetLastVisibleRecordIdx()

	local lastVisibleRecordIdx = 1

	for recordIdx = self:GetNumRecords(), 1, -1 do

		local btn = self:GetButtonForRecord( recordIdx )
		if btn then

			local slotRect = btn:GetRect()			

			if slotRect.y + slotRect.w >= 0 and slotRect.y <= self.slotsRect.w then
				lastVisibleRecordIdx = recordIdx
				break
			end

		else
			sys.log( "UI.Options_HudCommonOptionListWnd:GetLastVisibleRecordIdx()[ERROR]; cannot find slot btn for record %d", recordIdx )
		end

	end

	return lastVisibleRecordIdx

end


--
function UI.Options_HudCommonOptionListWnd:GetFirstRecordIdx()

	local firstVisibleRecordIdx = -1

	for recordIdx = 1, self:GetNumRecords() do

		local btn = self:GetButtonForRecord( recordIdx )
		if btn then

			local slotRect = btn:GetRect()			

			if slotRect.y + slotRect.w >= 0 and slotRect.y <= self.slotsRect.w then
				firstVisibleRecordIdx = recordIdx
				break
			end

		else
			sys.log( "UI.Options_HudCommonOptionListWnd:GetFirstRecordIdx()[ERROR]; cannot find slot btn for record %d", recordIdx )
		end

	end

	return firstVisibleRecordIdx

end


--
function UI.Options_HudCommonOptionListWnd:SetFirstVisibleRecord( recordIdx, bUpdateScrollBar, bAnimated )

	local scrollPos = -1

	if recordIdx ~= -1 then
		local yInList = self:CalcTotalSlotPos( recordIdx )
		scrollPos = yInList
	end

	self:SetScrollPos( scrollPos, bUpdateScrollBar, bAnimated )
	

end


--
function UI.Options_HudCommonOptionListWnd:SetLastVisibleRecord( recordIdx, bUpdateScrollBar, bAnimated )

	local scrollPos = -1

	if recordIdx ~= -1 then
		local yInList = self:CalcTotalSlotPos( recordIdx )
		scrollPos = ( yInList + self:GetSlotHeight( recordIdx ) ) - self.slotsRect.w
	end

	self:SetScrollPos( scrollPos, bUpdateScrollBar, bAnimated )

end


--
function UI.Options_HudCommonOptionListWnd:UpdateScrollBarVisibility()	

	local totalHeight	= self:GetTotalSlotsHeight()
	local visibleHeight	= self.slotsRect.w

	local bNeedScrollBar = not self:HasListStyle( self.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED ) or totalHeight > visibleHeight

	if bNeedScrollBar then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollObjName, UI.EffectAnimParams.POS )
		end

		self:UpdateScrollBarRange()
		self:UpdateScrollBarPos()

	else

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
		end	

		self:RemoveChild( self.scrollBar )
	
	end

end


--
function UI.Options_HudCommonOptionListWnd:UpdateScrollBarRange()

	if not self.scrollBar or not self.scrollBar:IsChildOf( self ) then
		return
	end

	if self.numRecords == 0 then
		self.scrollBar:SetRange( -1, -1 )

	else
		self.scrollBar:SetRange( 0, self:GetMaxScrollPos() )
	end

end


--
function UI.Options_HudCommonOptionListWnd:AddRecord( data )

	local record =
	{
		idx		= self.numRecords + 1,
		data	= data
	}

	local firstVisibleRecordIdx_prev, lastVisibleRecordIdx_prev = self:GetVisibleRange()

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	local slot = self:GetFreeSlot()
	if slot then		

		slot.recordIdx = record.idx

		self:ShowSlot( slot )
		self:UpdateSlotForRecord( slot )

	else
		sys.log( "UI.Options_HudCommonOptionListWnd:AddRecord()[ERROR]: cannot find free slot (wnd \"%s\")", self:GetScriptTableName() )
	end			

	self:UpdateScrollBarVisibility()

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

	if firstVisibleRecordIdx == -1 then
		self:SetFirstVisibleRecord( 1 )

	elseif firstVisibleRecordIdx ~= firstVisibleRecordIdx_prev or lastVisibleRecordIdx ~= lastVisibleRecordIdx_prev then
		self:UpdateOnChangeVisibleRange( true, false )
	end

	if slot then
		self:UpdateSlotPos( slot )
	end

	return record.idx

end


--
function UI.Options_HudCommonOptionListWnd:UpdateSlotsOnChangeVisibleRange( bAnimated )

	for idx, slot in pairs( self.slots ) do
		self:UpdateSlotPos( slot )
	end

end 


-- 
function UI.Options_HudCommonOptionListWnd:UpdateSlotPos( slot )

	local yInList = self:CalcTotalSlotPos( slot.recordIdx )
	local y = yInList - self.scrollPos

	slot.btn:SetTop( y )

end


--
function UI.Options_HudCommonOptionListWnd:UpdateScrollBarPageSize()

 	self.scrollBar:SetPageSize( self.slotsRect.w )

end


--
function UI.Options_HudCommonOptionListWnd:GetTotalSlotsHeight()

	local totalHeight = 0

	for recordIdx = 1, self:GetNumRecords() do

		totalHeight = totalHeight + self:GetSlotHeight( recordIdx )

		if recordIdx > 1 then
			totalHeight = totalHeight + self.slotsSpace
		end

	end

	return totalHeight

end


--
function UI.Options_HudCommonOptionListWnd:CalcTotalSlotPos( recordIdx )

	local y = 0

	for prevRecordIdx = 1, recordIdx - 1 do
		y = y + self:GetSlotHeight( prevRecordIdx ) + self.slotsSpace
	end

	return y

end


--
function UI.Options_HudCommonOptionListWnd:GetSlotHeight( recordIdx )

	local height = 0

	local btn = self:GetButtonForRecord( recordIdx )
	if btn then
		height = btn:GetHeight()
	else
		sys.log( "UI.Options_HudCommonOptionListWnd:GetSlotHeight()[ERROR]: cannot find slot btn for record %d", recordIdx )
	end

	return height

end


--
function UI.Options_HudCommonOptionListWnd:ScrollVisibleRange( bForward, numSteps )

	if numSteps == nil then
		numSteps = 1
	end

	local delta = numSteps * self.SCROLL_STEP
	self:ScrollSlots( bForward and delta or -delta, true )

end


--
function UI.Options_HudCommonOptionListWnd:ScrollSlots( delta, bUpdateScrollBar )

	local curPos = self.scrollPos
	local nextPos = curPos + delta

	-- обязательно клампить ДО SetScrollPos(), т.е. если получится -1, то там он посчитается за невалидное значение
	local maxScrollPos = self:GetMaxScrollPos()
	if maxScrollPos ~= -1 then
		nextPos = UI:Clamp( nextPos, 0, maxScrollPos )
	else
		nextPos = -1
	end

	self:SetScrollPos( nextPos, bUpdateScrollBar, false )

end


-- ------------------------------------------------------------------------
-- UI.Options_HudCommonOptionSlotWnd
-- ------------------------------------------------------------------------

UI.Options_HudCommonOptionSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Options_HudCommonOptionSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "Options_HudCommonOptionSlotWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype		= true,
	},
}

-- ------------------------------
-- interface funcitons
-- ------------------------------

--
function UI.Options_HudCommonOptionSlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:ResetControls()

end


--
function UI.Options_HudCommonOptionSlotWnd:OnOptionValueChanged( option )

	self:UpdateControls( option )
	self:UpdateDisabledState()

end


--
function UI.Options_HudCommonOptionSlotWnd:GetControlsType()

	return self.controlsType

end


--
function UI.Options_HudCommonOptionSlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.Options_HudCommonOptionSlotWnd.controlsTypes =
{
	NONE		= 0,
	CHECKBOX	= 1,
	COMBOBOX	= 2,
	SLIDER		= 3,
	CURSOR		= 4,	
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Options_HudCommonOptionSlotWnd.controlsType	= UI.Options_HudCommonOptionSlotWnd.controlsTypes.NONE
UI.Options_HudCommonOptionSlotWnd.controlWnd		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Options_HudCommonOptionSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:Reset()

end


--
function UI.Options_HudCommonOptionSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:InitControls()
	self:UpdateControls()
	self:UpdateDisabledState()
	self:UpdateTooltip()
	self:RecalcLayout()

end


--
function UI.Options_HudCommonOptionSlotWnd:UpdateTooltip()

	self.tooltipData = nil

	if self.controlsType == self.controlsTypes.NONE or self.controlsType == self.controlsTypes.CURSOR then
		return
	end

	local option = self:GetOption()

	if type( option.GetTooltipData ) == "function" then

		tooltipData = option:GetTooltipData()

	else

    	tooltipData =
    	{
    		tooltipType = UI.tooltipTypes.TEXT_LARGE,
    		caption		= UI:GetStringByName( option.strId ),
    		text		= UI:GetStringForPlatform( string.format( "%s_desc", option.strId ) )
    	}

	end	

	if self.controlWnd.SetTooltipData then
		self.controlWnd:SetTooltipData( tooltipData )
	else
		sys.log( "UI.Options_HudCommonOptionSlotWnd: no SetTooltipData() function in %s", self.controlWnd:GetName() )
	end

end    


--
function UI.Options_HudCommonOptionSlotWnd:ResetControls()

	if self.controlWnd then

		if mainEffect then
			mainEffect:UnlinkWnd( self.controlWnd:GetUiHandle(), "" )
		end

		UI:RemoveUiObj( self.controlWnd:GetUiHandle() )
		self.controlWnd = nil

	end

	self.controlsType = self.controlsTypes.NONE

	UI:Purge()

end


--
function UI.Options_HudCommonOptionSlotWnd:InitControls()

	local controlsType = self:DedectControlsType()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self:ResetControls()

	if controlsType == self.controlsTypes.CHECKBOX then

		local controlPrototypeName = "Options_HudCheckBoxWnd"

		self.controlWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )
		self.controlWnd:Check( false )
		self:AddChild( self.controlWnd )

	elseif controlsType == self.controlsTypes.COMBOBOX then

		local controlPrototypeName = "Options_HudComboBoxWnd"

		self.controlWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )		
		self.controlWnd:Reset()
		self:AddChild( self.controlWnd )

	elseif controlsType == self.controlsTypes.SLIDER then

		local controlPrototypeName = "Options_HudSliderWnd"

		self.controlWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )
		self:AddChild( self.controlWnd )

	elseif controlsType == self.controlsTypes.CURSOR then

		local controlPrototypeName = "Options_CursorOptionsWnd"

		self.controlWnd = UI:CreateChildWnd( self, UI[ controlPrototypeName ], "" )
		self:AddChild( self.controlWnd )

	elseif controlsType == self.controlsTypes.NONE then
		-- nothing

	else
		sys.log( "UI.Options_HudCommonOptionSlotWnd:InitControls()[ERROR]: unhandled controls type: %s", tostring( controlsType ) )
	end

	self.controlsType = controlsType

end


--
function UI.Options_HudCommonOptionSlotWnd:UpdateControls( changedOption )

	local option = self:GetOption()

	if self.controlsType == self.controlsTypes.CHECKBOX then

		self.controlWnd:Check( option.value.cur )		

	elseif self.controlsType == self.controlsTypes.COMBOBOX then

		self.controlWnd:Reset()

		for valIdx = 1, #option.value.list do

			local data = {}
			data.optionVal	= option.value.list[ valIdx ]
			data.text		= UI.Options:GetOptionValAsStr( option, data.optionVal )

			self.controlWnd:AddRecord( data )

		end

		local selRecord = UI.Options:GetValPos( option, option.value.cur )
		if selRecord ~= -1 then

    		UI.OptionsWnd.bIgnoreComboSelection = true
    		self.controlWnd:SelectRecord( selRecord )
    		UI.OptionsWnd.bIgnoreComboSelection = false

		else

			local str = UI.Options:GetOptionValAsStr( option, option.value.cur )
			self.controlWnd:SetSelectedText( str )

		end

	elseif self.controlsType == self.controlsTypes.SLIDER then

		self.controlWnd:SetMinMax( option.value.range.min, option.value.range.max )
		self.controlWnd:SetVal( option.value.cur )		

	elseif self.controlsType == self.controlsTypes.CURSOR then

		if changedOption then
			self.controlWnd:OnOptionValueChanged( changedOption )
		else
			self.controlWnd:UpdateAll()
		end

	elseif self.controlsType == self.controlsTypes.NONE then
		-- nothing

	else
		sys.log( "UI.Options_HudCommonOptionSlotWnd:UpdateControls()[ERROR]: unhandled controls type: %s", tostring( self.controlsType ) )
	end	


	if self.controlsType ~= self.controlsTypes.NONE and self.controlsType ~= self.controlsTypes.CURSOR then

		if self.controlWnd.SetCaption then

    		local text = UI:GetStringByName( option.strId )
    		self.controlWnd:SetCaption( text )

		else
			sys.log( "UI.Options_HudCommonOptionSlotWnd:UpdateControls()[ERROR]: no SetCaption() function in %s", self.controlWnd:GetName() )
		end

	end

end


--
function UI.Options_HudCommonOptionSlotWnd:DedectControlsType()

	local data = self:GetRecordData()

	if data.bCursor then
		return self.controlsTypes.CURSOR

	else

		local option = data.option

    	if option.value and option.value.range then
    		return self.controlsTypes.SLIDER

    	elseif option.value and option.value.list then

    		if #option.value.list == 2 and type( option.value.list[ 1 ] ) == "boolean" and type( option.value.list[ 2 ] ) == "boolean" then
    			return self.controlsTypes.CHECKBOX
    		else
    			return self.controlsTypes.COMBOBOX
    		end

    	else
    		sys.log( "UI.Options_HudCommonOptionSlotWnd:DedectControlsType()[ERROR]: cannot detect controls type for option \"%s\"", option.id )
    		return self.controlsTypes.NONE    	
    	end

	end

end


--
function UI.Options_HudCommonOptionSlotWnd:GetOption()

	if self.controlsType == self.controlsTypes.CURSOR then
		return nil

	else
		local data = self:GetRecordData()
		return data and data.option
	end

end


--
function UI.Options_HudCommonOptionSlotWnd:UpdateDisabledState()

	if self.controlsType == self.controlsTypes.CURSOR then

		self.controlWnd:UpdateDisabledState()

	else		

		local option = self:GetOption()

    	local bDisabled = option and option.bDisabled

    	if bDisabled == nil then
    		bDisabled = false
    	end

    	if self.controlsType == self.controlsTypes.CHECKBOX then
    		self.controlWnd:Enable( not bDisabled )

    	elseif self.controlsType == self.controlsTypes.COMBOBOX then
    		self.controlWnd:Enable( not bDisabled )
    	end

	end

end


--
function UI.Options_HudCommonOptionSlotWnd:IsDisabled( data )

	local bDisabled = data and data.option and option.bDisabled

	if bDisabled == nil then
		bDisabled = false
	end

	return bDisabled

end


--
function UI.Options_HudCommonOptionSlotWnd:RecalcLayout()

	local width		= 0
	local height	= 0

	if self.controlWnd then
		width	= self.controlWnd:GetWidth()
		height	= self.controlWnd:GetHeight()
	end

	self:SetWidth( width )
	self:SetHeight( height )

end


-- -----------------------------------------------------------------
-- UI.Options_HudCheckBoxWnd
-- -----------------------------------------------------------------

UI.Options_HudCheckBoxWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Options_HudCheckBoxWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Options_HudCheckBoxWnd",
		selectSound	= UI.sounds.btnMouseOver,
		clickSound	= UI.sounds.checkBox,
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
				defName				= "options_checkBox",
				defaultAnimation    = "idle",

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

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Options_HudCheckBoxWnd:SetTooltipData( tooltipData )

	self.labelWnd:SetTooltipData( tooltipData )

end


--
function UI.Options_HudCheckBoxWnd:SetCaption( caption )

	self.labelWnd:SetCaption( caption )

end


-- -------------------------------
-- const
-- -------------------------------

UI.Options_HudCheckBoxWnd.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle_over",
		animationPressed	= "idle_over",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "chek",
		animationSelect		= "chek_over",
		animationPressed	= "chek_over",
		animationDisabled	= "disable_chek",
	},

	labelLocator = "chek_box_text",
}

-- -------------------------------
-- vars
-- -------------------------------

UI.Options_HudCheckBoxWnd.labelWnd = nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Options_HudCheckBoxWnd:F_PostLoad()

	UI.EffectCheckBoxWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.Options_HudCheckBoxWnd:CreateControls()

	self.labelWnd = UI:CreateChildWnd( self, UI.Options_HudLabelWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.labelWnd, mainEffect, self.effectInfo.labelLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

end


-- -----------------------------------------------------------------
-- UI.Options_HudComboBoxWnd
-- -----------------------------------------------------------------

UI.Options_HudComboBoxWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Options_HudComboBoxWnd.def =
{
	className	= "Wnd",
	prototype	= "ComboBox1",

	props =
	{
		name		= "Options_HudComboBoxWnd",
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
				defName				= "options_hudComboBox",
				defaultAnimation	= "select",

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

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Options_HudComboBoxWnd:SetTooltipData( tooltipData )

	self.labelWnd:SetTooltipData( tooltipData )

end


--
function UI.Options_HudComboBoxWnd:SetCaption( caption )

	self.labelWnd:SetCaption( caption )

end    

-- -------------------------------
-- const
-- -------------------------------

UI.Options_HudComboBoxWnd.MAX_VISIBLE_RECORDS = 5

UI.Options_HudComboBoxWnd.effectInfo =
{
	main =
	{
		orientation2Anim =
		{
			[ UI.EffectComboBoxWnd.orientations.DONW ]	= "deselect",
			[ UI.EffectComboBoxWnd.orientations.UP ]	= "",
		},

		selItemObjName		= "drop_down_input",
		listObjName			= "list",
		stateBtnObjName		= "drop_down_btn",

		labelLocator	= "text",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.Options_HudComboBoxWnd.labelWnd	= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Options_HudComboBoxWnd:CreateControls()

	UI.ComboBox1.CreateControls( self )

	self.labelWnd = UI:CreateChildWnd( self, UI.Options_HudLabelWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.labelWnd, mainEffect, self.effectInfo.main.labelLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

end


-- -----------------------------------------------------------------
-- UI.Options_HudSliderWnd
-- -----------------------------------------------------------------

UI.Options_HudSliderWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Options_HudSliderWnd.def =
{
	className	= "Wnd",
	prototype	= "EffectSliderWnd",

	props =
	{
		name		= "Options_HudSliderWnd",
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
				defName 			= "options_hudSlider_main",
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

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Options_HudSliderWnd:SetTooltipData( tooltipData )

	self.labelWnd:SetTooltipData( tooltipData )

end


--
function UI.Options_HudSliderWnd:SetCaption( caption )

	self.labelWnd:SetCaption( caption )

end    

-- -------------------------------
-- const
-- -------------------------------

UI.Options_HudSliderWnd.sliderBarPrototypeName	= "Options_Slider_BarWnd"

UI.Options_HudSliderWnd.effectInfo =
{
	main =
	{
		sliderBarObjName	= "slider",
		labelLocator		= "text",
	}
}

UI.Options_HudSliderWnd.sliderStyle = UI.EffectSliderWnd.sliderStyles.HAS_BAR

-- -------------------------------
-- vars
-- -------------------------------

UI.Options_HudSliderWnd.labelWnd	= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Options_HudSliderWnd:CreateControls()

	UI.EffectSliderWnd.CreateControls( self )

	self.labelWnd = UI:CreateChildWnd( self, UI.Options_HudLabelWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.labelWnd, mainEffect, self.effectInfo.main.labelLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )

end


-- ----------------------------------------------------------------------------
--  UI.Options_HudLabelWnd
-- ----------------------------------------------------------------------------

UI.Options_HudLabelWnd =
{
	def =
    {   	
     	className	= "Wnd",
    	prototype	= "Options_LabelWnd",

     	props =
     	{
     		name			= "Options_HudLabelWnd",
    		isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "options_hudLabel",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.Options_HudLabelWnd.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}			
    		},
     	},
    }
}    

-- ----------------------------------------------------------------------------
--  UI.Options_HudLabelBigWnd
-- ----------------------------------------------------------------------------

UI.Options_HudLabelBigWnd =
{
	def =
    {   	
     	className	= "Wnd",
    	prototype	= "Options_LabelWnd",

     	props =
     	{
     		name			= "Options_HudLabelBigWnd",
    		isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "options_hudLabelBig",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.Options_HudLabelBigWnd.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}			
    		},
     	},
    }
}    


-- ----------------------------------------------------------------------------
--  UI.Options_CursorOptionsWnd
-- ----------------------------------------------------------------------------

UI.Options_CursorOptionsWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Options_CursorOptionsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Options_CursorOptionsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "options_hudCursorOptions",
				defaultAnimation    = "idle",

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

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Options_CursorOptionsWnd:UpdateAll()

	self:UpdateCursorTypes()
	self:UpdateCursorCrossTypes()
	self:UpdateCursorColors()
	self:UpdatePredictionColors()

end


--
function UI.Options_CursorOptionsWnd:OnOptionValueChanged( option )

	if option.id == "cursorTypes" then
		self:UpdateCursorTypes()

	elseif option.id == "cursorCrossTypes" then
		self:UpdateCursorCrossTypes()

	elseif option.id == "cursorColors" then
		self:UpdateCursorColors()

	elseif option.id == "predictionColors" then
		self:UpdatePredictionColors()

	else
		sys.log( "UI.Options_CursorOptionsWnd:OnOptionValueChanged()[ERROR]: unhandled option: \"%s\"", option.id  )
	end

end


--
function UI.Options_CursorOptionsWnd:UpdateDisabledState()	

	-- cursorTypes

	local cursorTypesOption = UI.Options:GetOptionByName( "cursorTypes" )

	local bCursorTypesDisabled = cursorTypesOption and cursorTypesOption.bDisabled
	if bCursorTypesDisabled == nil then
		bDisabled = false
	end

    self.cursorTypesComboBox:Enable( not bCursorTypesDisabled )


	-- cursorCrossTypes

	local cursorCrossTypesOption = UI.Options:GetOptionByName( "cursorCrossTypes" )

	local bCursorCrossTypesDisabled = cursorCrossTypesOption and cursorCrossTypesOption.bDisabled
	if bCursorCrossTypesDisabled == nil then
		bDisabled = false
	end

    self.cursorCrossTypesComboBox:Enable( not bCursorCrossTypesDisabled )


	-- cursorColors

	local cursorColorsOption = UI.Options:GetOptionByName( "cursorColors" )

	local bCursorColorsDisabled = cursorColorsOption and cursorColorsOption.bDisabled
	if bCursorColorsDisabled == nil then
		bDisabled = false
	end

    self.cursorColorsComboBox:Enable( not bCursorColorsDisabled )


	-- predictionColors

	local predictionColorsOption = UI.Options:GetOptionByName( "predictionColors" )

	local bPredictionColorsDisabled = predictionColorsOption and predictionColorsOption.bDisabled
	if bPredictionColorsDisabled == nil then
		bDisabled = false
	end

    self.predictionColorsComboBox:Enable( not bPredictionColorsDisabled )

end


-- -------------------------------
-- const
-- -------------------------------

UI.Options_CursorOptionsWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.Options_CursorOptionsWnd.effectInfo =
{
	main =
	{
        cursorTypesLocator				= "slot_1",
        cursorCrossTypesLocator			= "slot_2",
        cursorColorsLocator				= "slot_3",
        predictionColorsLocator			= "slot_4",

		cursorTypesLabelLocator			= "text_1",
		cursorCrossTypesLabelLocator	= "text_2",
		cursorColorsLabelLocator		= "text_3",
		predictionColorsLabelLocator	= "text_4",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.Options_CursorOptionsWnd.cursorTypesComboBox			= nil
UI.Options_CursorOptionsWnd.cursorCrossTypesComboBox	= nil
UI.Options_CursorOptionsWnd.cursorColorsComboBox		= nil
UI.Options_CursorOptionsWnd.predictionColorsComboBox	= nil

UI.Options_CursorOptionsWnd.cursorTypesLabelWnd			= nil
UI.Options_CursorOptionsWnd.cursorCrossTypesLabelWnd	= nil
UI.Options_CursorOptionsWnd.cursorColorsLabelWnd		= nil
UI.Options_CursorOptionsWnd.predictionColorsLabelWnd	= nil

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Options_CursorOptionsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self:UpdateCaptions()
	self:UpdateTooltips()

end


--
function UI.Options_CursorOptionsWnd:CreateControls()

	self.cursorTypesComboBox		= UI:CreateChildWnd( self, UI.Options_CursorTypesComboBox, "" )
	self.cursorCrossTypesComboBox	= UI:CreateChildWnd( self, UI.Options_CursorCrossTypesComboBox, "" )
	self.cursorColorsComboBox		= UI:CreateChildWnd( self, UI.Options_ColorsComboBox, "_cursor" )
	self.predictionColorsComboBox	= UI:CreateChildWnd( self, UI.Options_ColorsComboBox, "_predicion" )

	self.cursorTypesLabelWnd		= UI:CreateChildWnd( self, UI.Options_HudLabelWnd, "_cursorType" )
	self.cursorCrossTypesLabelWnd	= UI:CreateChildWnd( self, UI.Options_HudLabelWnd, "_cursorCrossType" )
	self.cursorColorsLabelWnd		= UI:CreateChildWnd( self, UI.Options_HudLabelWnd, "_cursorColor" )
	self.predictionColorsLabelWnd	= UI:CreateChildWnd( self, UI.Options_HudLabelWnd, "_predictionColor" )


	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.cursorTypesComboBox, mainEffect, self.effectInfo.main.cursorTypesLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.cursorCrossTypesComboBox, mainEffect, self.effectInfo.main.cursorCrossTypesLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.cursorColorsComboBox, mainEffect, self.effectInfo.main.cursorColorsLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.predictionColorsComboBox, mainEffect, self.effectInfo.main.predictionColorsLocator, UI.EffectAnimParams.POS )

	UI:AddChildAndLink( self, self.cursorTypesLabelWnd, mainEffect, self.effectInfo.main.cursorTypesLabelLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.cursorCrossTypesLabelWnd, mainEffect, self.effectInfo.main.cursorCrossTypesLabelLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.cursorColorsLabelWnd, mainEffect, self.effectInfo.main.cursorColorsLabelLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.predictionColorsLabelWnd, mainEffect, self.effectInfo.main.predictionColorsLabelLocator, UI.EffectAnimParams.POS )

end


--
function UI.Options_CursorOptionsWnd:UpdateCursorTypes()

	self.cursorTypesComboBox:Reset()

	local option = UI.Options:GetOptionByName( "cursorTypes" )
	if not option then
		sys.log( "UI.Options_CursorOptionsWnd:UpdateCursorTypes()[ERROR]: cannot find option \"cursorTypes\"" )
		return
	end

	for valIdx = 1, #option.value.list do

		local typeId = option.value.list[ valIdx ]

		local data =
		{
			param		= typeId,
			option		= option,
			optionVal	= typeId,
		}

		self.cursorTypesComboBox:AddSlot( data )		

	end


	local selRecordIdx	= -1
	local selSlotIdx	= -1
	local param			= option.value.cur

	for recordIdx = 1, self.cursorTypesComboBox:GetNumRecords() do

		local recordData = self.cursorTypesComboBox:GetRecordData( recordIdx )
		for slotIdx, slotData in pairs( recordData.slots ) do

			if slotData.param == param then
				selRecordIdx = recordIdx
				selSlotIdx = slotIdx
				break
			end

		end

	end

	if selRecordIdx ~= -1 and selSlotIdx ~= -1 then

		UI.OptionsWnd.bIgnoreComboSelection = true
		self.cursorTypesComboBox:SelectSlot( selRecordIdx, selSlotIdx )
		UI.OptionsWnd.bIgnoreComboSelection = false

	else
		self.cursorTypesComboBox:SetSelItemParam( param )
	end

end


--
function UI.Options_CursorOptionsWnd:UpdateCursorCrossTypes()

	self.cursorCrossTypesComboBox:Reset()

	local option = UI.Options:GetOptionByName( "cursorCrossTypes" )
	if not option then
		sys.log( "UI.Options_CursorOptionsWnd:UpdateCursorCrossTypes()[ERROR]: cannot find option \"cursorCrossTypes\"" )
		return
	end

	for valIdx = 1, #option.value.list do

		local typeId = option.value.list[ valIdx ]

		local data =
		{
			param		= typeId,
			option		= option,
			optionVal	= typeId,
		}

		self.cursorCrossTypesComboBox:AddSlot( data )		

	end


	local selRecordIdx	= -1
	local selSlotIdx	= -1
	local param			= option.value.cur

	for recordIdx = 1, self.cursorCrossTypesComboBox:GetNumRecords() do

		local recordData = self.cursorCrossTypesComboBox:GetRecordData( recordIdx )
		for slotIdx, slotData in pairs( recordData.slots ) do

			if slotData.param == param then
				selRecordIdx = recordIdx
				selSlotIdx = slotIdx
				break
			end

		end

	end

	if selRecordIdx ~= -1 and selSlotIdx ~= -1 then

		UI.OptionsWnd.bIgnoreComboSelection = true
		self.cursorCrossTypesComboBox:SelectSlot( selRecordIdx, selSlotIdx )
		UI.OptionsWnd.bIgnoreComboSelection = false

	else
		self.cursorCrossTypesComboBox:SetSelItemParam( param )
	end

end


--
function UI.Options_CursorOptionsWnd:UpdateCursorColors()

	self.cursorColorsComboBox:Reset()

	local option = UI.Options:GetOptionByName( "cursorColors" )
	if not option then
		sys.log( "UI.Options_CursorOptionsWnd:UpdateCursorCrossTypes()[ERROR]: cannot find option \"cursorColors\"" )
		return
	end

	for valIdx = 1, #option.value.list do

		local colorId = option.value.list[ valIdx ]
		local colorInfo = UI.gameCursorColors[ colorId ]

		local data =
		{
			param		= colorInfo.color or UI.WHITE_COLOR,
			option		= option,
			optionVal	= colorId,
		}

		self.cursorColorsComboBox:AddSlot( data )		

	end


	local selRecordIdx	= -1
	local selSlotIdx	= -1

	local colorInfo		= UI.gameCursorColors[ option.value.cur ]
	local param			= colorInfo and colorInfo.color or UI.WHITE_COLOR

	for recordIdx = 1, self.cursorColorsComboBox:GetNumRecords() do

		local recordData = self.cursorColorsComboBox:GetRecordData( recordIdx )
		for slotIdx, slotData in pairs( recordData.slots ) do

			if slotData.param == param then
				selRecordIdx = recordIdx
				selSlotIdx = slotIdx
				break
			end

		end

	end

	if selRecordIdx ~= -1 and selSlotIdx ~= -1 then

		UI.OptionsWnd.bIgnoreComboSelection = true
		self.cursorColorsComboBox:SelectSlot( selRecordIdx, selSlotIdx )
		UI.OptionsWnd.bIgnoreComboSelection = false

	else
		self.cursorColorsComboBox:SetSelItemParam( param )
	end

end


--
function UI.Options_CursorOptionsWnd:UpdatePredictionColors()

	self.predictionColorsComboBox:Reset()

	local option = UI.Options:GetOptionByName( "predictionColors" )
	if not option then
		sys.log( "UI.Options_CursorOptionsWnd:UpdatePredictionColors()[ERROR]: cannot find option \"predictionColors\"" )
		return
	end

	for valIdx = 1, #option.value.list do

		local colorId = option.value.list[ valIdx ]
		local colorInfo = UI.predictionColors[ colorId ]

		local data =
		{
			param		= colorInfo.color or UI.WHITE_COLOR,
			option		= option,
			optionVal	= colorId,
		}

		self.predictionColorsComboBox:AddSlot( data )		

	end


	local selRecordIdx	= -1
	local selSlotIdx	= -1

	local colorInfo		= UI.predictionColors[ option.value.cur ]
	local param			= colorInfo and colorInfo.color or UI.WHITE_COLOR

	for recordIdx = 1, self.predictionColorsComboBox:GetNumRecords() do

		local recordData = self.predictionColorsComboBox:GetRecordData( recordIdx )
		for slotIdx, slotData in pairs( recordData.slots ) do

			if slotData.param == param then
				selRecordIdx = recordIdx
				selSlotIdx = slotIdx
				break
			end

		end

	end

	if selRecordIdx ~= -1 and selSlotIdx ~= -1 then

		UI.OptionsWnd.bIgnoreComboSelection = true
		self.predictionColorsComboBox:SelectSlot( selRecordIdx, selSlotIdx )
		UI.OptionsWnd.bIgnoreComboSelection = false

	else
		self.predictionColorsComboBox:SetSelItemParam( param )
	end

end


--
function UI.Options_CursorOptionsWnd:UpdateCaptions()

	for idx, optionName in pairs( UI.OptionsWnd.cursorOptionsNames ) do

		local labelWnd = self:GetLabelWndForOption( optionName )		
		if labelWnd then

			local option = UI.Options:GetOptionByName( optionName )
			if option then

				local str = UI:GetStringByName( option.strId )
				labelWnd:SetCaption( str )

			end

		end

	end

end


--
function UI.Options_CursorOptionsWnd:UpdateTooltips()

	for idx, optionName in pairs( UI.OptionsWnd.cursorOptionsNames ) do

		local labelWnd = self:GetLabelWndForOption( optionName )		
		if labelWnd then

			local tooltipData = nil

			local option = UI.Options:GetOptionByName( optionName )
			if option then

            	if type( option.GetTooltipData ) == "function" then

            		tooltipData = option:GetTooltipData()

				else

                	tooltipData =
                	{
                		tooltipType = UI.tooltipTypes.TEXT_LARGE,
                		caption		= UI:GetStringByName( option.strId ),
                		text		= UI:GetStringForPlatform( string.format( "%s_desc", option.strId ) )
                	}

				end

			end

			labelWnd:SetTooltipData( tooltipData )

		end

	end

end


--
function UI.Options_CursorOptionsWnd:GetLabelWndForOption( optionName )

	if optionName == "cursorTypes" then
		return self.cursorTypesLabelWnd

	elseif optionName == "cursorCrossTypes" then
		return self.cursorCrossTypesLabelWnd

	elseif optionName == "cursorColors" then
		return self.cursorColorsLabelWnd

	elseif optionName == "predictionColors" then
		return self.predictionColorsLabelWnd

	else
		sys.log( "UI.Options_CursorOptionsWnd:GetLabelWndForOption()[ERROR]: unhanlded option \"%s\"", optionName )
		return nil
	end

end


-- ----------------------------------------------------------------------------
-- UI.Options_IconsComboBox
-- ----------------------------------------------------------------------------

UI.Options_IconsComboBox = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Options_IconsComboBox.def =
{
	className	= "Wnd",
	prototype	= "EffectComboBoxWnd",

	props =
	{
		name		= "Options_IconsComboBox",
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
				defName				= "options_iconsComboBox_main",
				defaultAnimation	= "select",

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

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.Options_IconsComboBox:GetSelItemParam()

	return self.selItemWnd:GetParam()

end


--
function UI.Options_IconsComboBox:SetSelItemParam( param )

	local data = { param = param }
	self.selItemWnd:Setup( data )

end


--
function UI.Options_IconsComboBox:AddSlot( data )

	self.listWnd:AddSlot( data )
	self:UpdateListRelPos()

end


--
function UI.Options_IconsComboBox:GetSelectedSlot()

	return self.selSlotIdx

end


--
function UI.Options_IconsComboBox:SelectRecord( recordIdx )

	if self.selRecordIdx == recordIdx then
		return
	end	

	if recordIdx ~= -1 then
		if recordIdx < 1 or recordIdx > self:GetNumRecords() then
			sys.log( "UI.Options_IconsComboBox:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
			return
		end
	end


	local slotIdx = -1

	if recordIdx ~= -1 then

		slotIdx = self.selSlotIdx

		if slotIdx ~= -1 then

			local rowData = self.listWnd:GetRecordData( recordIdx )
			local numSlotsInRow = rowData.slots and #rowData.slots or 0

			if slotIdx > numSlotsInRow then
				slotIdx = numSlotsInRow
			end

		end

	end

	self:SelectSlot( recordIdx, slotIdx )

end


--
function UI.Options_IconsComboBox:SelectSlot( recordIdx, slotIdx )

	if self.selRecordIdx == recordIdx and self.selSlotIdx == slotIdx then
		return
	end	

	if recordIdx ~= -1 then

		if recordIdx < 1 or recordIdx > self:GetNumRecords() then
			sys.log( "UI.Options_IconsComboBox:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
			return
		end

		if slotIdx ~= -1 then

			local rowData = self.listWnd:GetRecordData( recordIdx )
			local numSlotsInRow = rowData.slots and #rowData.slots or 0

			if slotIdx < 1 or slotIdx > numSlotsInRow then
				sys.log( "UI.Options_IconsComboBox:SelectSlot()[ERROR]: invalid slot %d for record %d", slotIdx, recordIdx )
				return
			end

		end

	else

		if slotIdx ~= -1 then
			sys.log( "UI.Options_IconsComboBox:SelectSlot()[ERROR]: invalid slot %s for record %s", tostring( slotIdx ), tostring( recordIdx ) )
			slotIdx = -1
		end

	end

	local oldSelRecordIdx = self.selRecordIdx
	local oldSelSlotIdx = self.selSlotIdx

	self.selRecordIdx = recordIdx
	self.selSlotIdx = slotIdx

	if self.state == self.states.OPEN then
		self.listWnd:SelectSlot( recordIdx, slotIdx )
	end

	self:OnSelectRecord()

	UI:SendUiEvent( UI.EV_COMBO_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, self.selSlotIdx, oldSelSlotIdx )

end


--
function UI.Options_IconsComboBox:Reset()

	UI.EffectComboBoxWnd.Reset( self )

	self.selSlotIdx = -1

end


-- --------------------------------
-- const
-- --------------------------------

UI.Options_IconsComboBox.selItemPrototypeName	= "Options_IconsComboBox_Slot"
UI.Options_IconsComboBox.listPrototypeName		= "Options_IconsComboBox_List"
UI.Options_IconsComboBox.stateBtnPrototypeName	= "Options_IconsComboBox_StateBtn"

UI.Options_IconsComboBox.effectInfo =
{
	main =
	{
		orientation2Anim =
		{
			[ UI.EffectComboBoxWnd.orientations.DONW ]	= "select",
			[ UI.EffectComboBoxWnd.orientations.UP ]	= "",
		},

		selItemObjName		= "drop_down_input",
		listObjName			= "list",
		stateBtnObjName		= "drop_down_btn",
	}
}

UI.Options_IconsComboBox.MAX_VISIBLE_RECORDS = 2

-- --------------------------------
-- vars
-- --------------------------------

UI.Options_IconsComboBox.orientation	= UI.EffectComboBoxWnd.orientations.DOWN
UI.Options_IconsComboBox.selSlotIdx		= -1

-- --------------------------------
-- fork functions
-- --------------------------------

--
function UI.Options_IconsComboBox:OnSelectRecord()

	self:UpdateSelItemWnd()

end


--
function UI.Options_IconsComboBox:UpdateSelItemWnd()

	local slotData = nil

	if self.selRecordIdx ~= -1 and self.selSlotIdx ~= -1 then
		rowData = self.listWnd:GetRecordData( self.selRecordIdx )		
		slotData = rowData.slots and rowData.slots[ self.selSlotIdx ]
	end

	self.selItemWnd:Setup( slotData )
	
end


--
function UI.Options_IconsComboBox:ListOnSlotClick( slotWnd )

	local recordIdx	= slotWnd:GetRow()		
	local slotIdx	= slotWnd:GetSlot()

	self:SelectSlot( recordIdx, slotIdx )
	self:Close()
	UI:PlayGlobalSound( self.soundActivateRecord )

end


--
function UI.Options_IconsComboBox:ResetSelItemWnd()

	self.selItemWnd:Reset()

end


--
function UI.Options_IconsComboBox:ValidateListSelection()

	self.listWnd:SelectSlot( self.selRecordIdx, self.selSlotIdx )

end


--
function UI.Options_IconsComboBox:GetSlotData( recordIdx, slotIdx )

	if recordIdx ~= -1 and slotIdx ~= -1 then

        local rowData = self.listWnd:GetRecordData( recordIdx )
    	if rowData and rowData.slots then
			return rowData.slots[ slotIdx ]
		end

	end

	return nil	

end


-- -----------------------------------------------------------------------
-- UI.Options_IconsComboBox_List
-- -----------------------------------------------------------------------

UI.Options_IconsComboBox_List = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.Options_IconsComboBox_List.def =
{
	className	= "Wnd",
	prototype	= "ComboBox_ListWnd",

	props =
	{
		name			= "Options_IconsComboBox_List",
		isPrototype		= true,
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
				defName				= "options_iconsComboBox_list",
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

-- -----------------------------------
-- interfacde functions
-- -----------------------------------

--
function UI.Options_IconsComboBox_List:GetSelectedSlot()

	return self.selSlotIdx

end


--
function UI.Options_IconsComboBox_List:SelectSlot( recordIdx, slotIdx )

	local oldSelRecordIdx = self.selRecordIdx

	if recordIdx == self.selRecordIdx and slotIdx == self.selSlotIdx then
		return
	end

	self.bSilent = true
	self:SelectRecord( recordIdx, false )
	self.bSilent = false

	if recordIdx ~= -1 then

		if slotIdx ~= -1 and ( slotIdx < 1 or slotIdx > self.MAX_SLOTS_IN_ROW ) then
			sys.log( "UI.Options_IconsComboBox_List:SelectSlot()[ERROR]: invalid slot %s for record %s", tostring( slotIdx ), tostring( recordIdx ) )
		end

	end

	self:SelectSlotInternal( slotIdx )

	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, 0, 0 )

end


--
function UI.Options_IconsComboBox_List:Clear()

	UI.ComboBox_ListWnd.Clear( self )

	self.selSlotIdx = -1

end


--
function UI.Options_IconsComboBox_List:GetNumSlotsForRecord( recordIdx )

	if recordIdx < 1 or recordIdx > self:GetNumRecords() then
		return 0
	end

	local rowWnd = self:GetButtonForRecord( recordIdx )
	if not rowWnd then
		return 0
	end

	return rowWnd:GetNumSlots()	

end


--
function UI.Options_IconsComboBox_List:AddSlot( data )

	local recordData = nil

	local numRecords = self:GetNumRecords()
	if numRecords > 0 then

		local lastRecordData = self:GetRecordData( numRecords )
		local numSlots = lastRecordData.slots and #lastRecordData.slots or 0

		if numSlots < self.MAX_SLOTS_IN_ROW then
			recordData = lastRecordData
		end

	end

	if recordData then

		if not recordData.slots then
			recordData.slots = {}
		end

		table.insert( recordData.slots, data )

		self:SetRecordData( recordData, numRecords )

	else

		recordData = { slots = {} }
		table.insert( recordData.slots, data )

		self:AddRecord( recordData )		

	end

end


-- --------------------------------
-- const
-- --------------------------------

UI.Options_IconsComboBox_List.btnPrototypeName	= "Options_IconsComboBox_Row"

UI.Options_IconsComboBox_List.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
		animIdle			= "open",
		minSizeLocator		= "dist_min",
		maxSizeLocator		= "self"
	}
}

UI.Options_IconsComboBox_List.MAX_SLOTS			= 2
UI.Options_IconsComboBox_List.MAX_SLOTS_IN_ROW	= 2

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Options_IconsComboBox_List.selSlotIdx				= -1
UI.Options_IconsComboBox_List.space_border_slots		= 0
UI.Options_IconsComboBox_List.space_scrollBar_border	= 0
UI.Options_IconsComboBox_List.minWidth					= 0
UI.Options_IconsComboBox_List.maxWidth					= 0

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.Options_IconsComboBox_List:F_PostLoad()

	UI.ComboBox_ListWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local minSizeLocatorSize	= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )
		local maxSizeLocatorSize	= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
		local firstSlotLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) )
		local scrollBarLocatorPos	= mainEffect:GetObjPos( self.effectInfo.main.scrollObjName )
		local scrollBarWidth		= self.scrollBar and self.scrollBar:GetWidth() or 0

		self.minWidth				= minSizeLocatorSize.x
		self.maxWidth				= maxSizeLocatorSize.x
		self.space_border_slots		= firstSlotLocatorPos.x
		self.space_scrollBar_border	= maxSizeLocatorSize.x - ( scrollBarLocatorPos.x + scrollBarWidth )

	end

end


--
function UI.Options_IconsComboBox_List:ClearSlots()

	UI.ComboBox_ListWnd.ClearSlots( self )
	self.selSlotIdx	= -1

end


--
function UI.Options_IconsComboBox_List:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local slotWnd = self:GetSlotWndFromChild( wnd )
	if slotWnd then

		if self.comboBox then
			self.comboBox:ListOnSlotClick( slotWnd )
		end

	end

	return false

end


--
function UI.Options_IconsComboBox_List:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local slotWnd = self:GetSlotWndFromChild( wnd )
	if slotWnd then

		local recordIdx = slotWnd:GetRow()		
		local slotIdx = slotWnd:GetSlot()

		if recordIdx ~= self:GetSelectedRecord() or slotIdx ~= self:GetSelectedSlot() then
			self:SelectSlot( recordIdx, slotIdx )
			UI:PlayGlobalSound( self.selectSound )	
		end	

		return true

	end

	return false

end 


--
function UI.Options_IconsComboBox_List:GetSlotWndFromChild( wnd )

	local selSlotWnd = nil
	local rowWnd = nil

	local parent = wnd:GetParent()
	while parent do

		if parent.BUTTON_LIST_BTN then
			rowWnd = parent
			break
		end

		parent = parent:GetParent()

	end

	if rowWnd then

		for slotIdx = 1, rowWnd:GetNumSlots() do
			local slotWnd = rowWnd:GetSlotWnd( slotIdx )
			if slotWnd then

				if slotWnd == wnd or wnd:IsChildOf( slotWnd ) then
					selSlotWnd = slotWnd
					break
				end

			end
		end

	end

	return selSlotWnd

end


--
function UI.Options_IconsComboBox_List:ValidateSelSlot()

	if self.selSlotIdx == -1 or self.selRecordIdx == -1 then
		return
	end

	local newSlotIdx = self.selSlotIdx

	local rowWnd = self:GetButtonForRecord( self.selRecordIdx )
	if rowWnd then
		newSlotIdx = UI:Clamp( newSlotIdx, 1, rowWnd:GetNumSlots() )
	else			
		newSlotIdx = -1
	end	

	self:SelectSlotInternal( newSlotIdx )

end


--
function UI.Options_IconsComboBox_List:SelectRecordInternal( recordIdx, bAnimated )

	local oldSelRecordIdx = self.selRecordIdx
	local oldSelSlotIdx = self.selSlotIdx

	local wasSilent = self.bSilent
	self.bSilent = true

	UI.BaseListWnd.SelectRecordInternal( self, recordIdx, bAnimated )

	self:ValidateSelSlot()

	if not wasSilent then
		self.bSilent = false
	end

	if not self.bSilent and ( oldSelRecordIdx ~= self.selRecordIdx or oldSelSlotIdx ~= self.selSlotIdx ) then
		UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selRecordIdx, oldSelRecordIdx, 0, 0 )
	end

end


--
function UI.Options_IconsComboBox_List:SelectSlotInternal( slotIdx )

	if self.selSlotIdx == slotIdx then
		return
	end

	self.selSlotIdx = slotIdx

	if self.selRecordIdx ~= -1 then

		local rowWnd = self:GetButtonForRecord( self.selRecordIdx )
		if rowWnd then
			rowWnd:OnSelectSlot( slotIdx )
		end

	end

end   


--
function UI.Options_IconsComboBox_List:RecalcListLayout()

	UI.ComboBox_ListWnd.RecalcListLayout( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local selfWidth = 0

	if self.scrollBar and self.scrollBar:IsChildOf( self ) then
		selfWidth = self.scrollBar:GetLeft() + self.scrollBar:GetWidth() + self.space_scrollBar_border
	else
		local slotWnd = self.allSlots[ 1 ]
		if slotWnd and slotWnd.btn then
			selfWidth = slotWnd.btn:GetLeft() + slotWnd.btn:GetWidth() + self.space_border_slots
		end
	end

	local animTime = ( selfWidth - self.minWidth ) / ( self.maxWidth - self.minWidth )

	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

end


-- -------------------------------------------------------------------------
-- UI.Options_IconsComboBox_Row
-- -------------------------------------------------------------------------

UI.Options_IconsComboBox_Row = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_IconsComboBox_Row.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Options_IconsComboBox_Row",
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
				defName 			= "options_iconsComboBox_row",
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

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Options_IconsComboBox_Row:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	for slotIdx, slotWnd in pairs( self.slots ) do
		self:HideSlot( slotIdx ) 
	end

end


--
function UI.Options_IconsComboBox_Row:Select( bSelect, bAnimated )

	self:UpdateSlotSelection()

end


--
function UI.Options_IconsComboBox_Row:OnSelectSlot( slotIdx )

	self:UpdateSlotSelection()

end


--
function UI.Options_IconsComboBox_Row:GetSelectedSlot()

	if not self:IsSelected() then
		return -1
	end

	local list = self:GetList()
	if not list then
		return -1
	end

	return list:GetSelectedSlot()

end


--
function UI.Options_IconsComboBox_Row:GetSlotData( slotIdx )

	local data = self:GetRecordData()
	return data and data.slots[ slotIdx ]

end


--
function UI.Options_IconsComboBox_Row:GetSlotWnd( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd and slotWnd:IsChildOf( self ) then
		return slotWnd
	end

	return nil
	
end


--
function UI.Options_IconsComboBox_Row:GetNumSlots()

	local numSlots = 0

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			numSlots = numSlots + 1
		end
	end

	return numSlots

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Options_IconsComboBox_Row.effectInfo =
{
	main =
	{
		slotPrefix = "slot_"
	}
}

UI.Options_IconsComboBox_Row.slotPrototypeName	= "Options_IconsComboBox_Slot"
UI.Options_IconsComboBox_Row.parentListName		= "Options_IconsComboBox_List"

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Options_IconsComboBox_Row.slots = {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_IconsComboBox_Row:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.slots = {}

	self:CreateSlots()

end


--
function UI.Options_IconsComboBox_Row:CreateSlots()

	local maxSlots = 0

	local parentList = UI[ self.parentListName ]
	if parentList then

		maxSlots = parentList.MAX_SLOTS_IN_ROW

		if not maxSlots then
			sys.log( "UI.Options_IconsComboBox_Row:CreateSlots()[ERROR]: cannot find \"UI.%s.MAX_SLOTS_IN_ROW\"", self.parentListName )
			maxSlots = 0
		end

	else
		sys.log( "UI.Options_IconsComboBox_Row:CreateSlots()[ERROR]: cannot find parent list \"UI.%s\"", self.parentListName )
	end

	for slotIdx = 1, maxSlots do

		local slotProto = UI[ self.slotPrototypeName ]

		local slotWnd = UI:CreateChildWnd( self, slotProto, tostring( slotIdx ) )

		slotWnd:SetSlot( slotIdx )
		table.insert( self.slots, slotWnd )

	end	

end


--
function UI.Options_IconsComboBox_Row:UpdateForData( data, bAnimated )

	self:Reset()

	if not data then
		return
	end

	for slotIdx = 1, #data.slots do

		self:ShowSlot( slotIdx )

		local slotWnd = self.slots[ slotIdx ]
		if slotWnd then
			slotWnd:Setup( data.slots[ slotIdx ] )
		end		

	end

	self:UpdateSlotSelection()

end


--
function UI.Options_IconsComboBox_Row:UpdateSlotSelection()

	local selSlotIdx = self:GetSelectedSlot()

	for slotIdx, slotWnd in pairs( self.slots ) do
		if slotWnd:IsChildOf( self ) then
			slotWnd:Select( slotIdx == selSlotIdx )
		end
	end

end


--
function UI.Options_IconsComboBox_Row:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.Options_IconsComboBox_Row:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Options_IconsComboBox_Row:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos()
	end

end


--
function UI.Options_IconsComboBox_Row:HideSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if slotWnd then

		slotWnd:Reset()
		slotWnd:UnlinkFromParent()

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
		end

	end

end


--
function UI.Options_IconsComboBox_Row:ShowSlot( slotIdx )

	local slotWnd = self.slots[ slotIdx ]
	if not slotWnd then
		sys.log( "UI.Options_IconsComboBox_Row:ShowSlot()[ERROR]: cannot find slot %d", slotIdx )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local locatorName = string.format( "%s%d", self.effectInfo.main.slotPrefix, slotIdx )

	UI:AddChildAndLink( self, slotWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

end


-- ---------------------------------------------------------------
-- UI.Options_IconsComboBox_Slot
-- ---------------------------------------------------------------

UI.Options_IconsComboBox_Slot = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Options_IconsComboBox_Slot.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "Options_IconsComboBox_Slot",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
  				defName				= "options_iconsComboBox_slot",
  				defaultAnimation	= "idle",

  				links =
  				{
  					{
  						objName		= "self",
  						animParams	= UI.EffectAnimParams.SIZE,
  					},

  					{
  						objName		= "color",
						layer		= "UI.Options_IconsComboBox_Slot.layers.ICO_EFFECT",
  						animParams	= UI.EffectAnimParams.POS,
  					},

  					{
  						objName		= "select",
						layer		= "UI.Options_IconsComboBox_Slot.layers.SEL_EFFECT",
  						animParams	= UI.EffectAnimParams.POS,
  					},

  					{
  						objName		= "over",
						layer		= "UI.Options_IconsComboBox_Slot.layers.MOUSE_OVER_EFFECT",
  						animParams	= UI.EffectAnimParams.POS,
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
  				defName				= "options_iconsComboBox_slot_ico",
  				defaultAnimation	= "idle",
			}}
		},

		-- SEL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

  			effects =
  			{{
  				defName				= "options_iconsComboBox_slot_sel",
  				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

  			effects =
  			{{
  				defName				= "options_iconsComboBox_slot_mouseOver",
  				defaultAnimation	= "idle",
			}}
		},  
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Options_IconsComboBox_Slot:SetSlot( slotIdx )

	self.slotIdx = slotIdx

end


--
function UI.Options_IconsComboBox_Slot:GetSlot()

	return self.slotIdx

end


--
function UI.Options_IconsComboBox_Slot:GetRow()

	local parent = self:GetParent()
	return parent and parent:GetRecord() or -1

end


--
function UI.Options_IconsComboBox_Slot:Setup( data )

	self:Reset()

	self.data = data

	self:UpdateIco()
	self:UpdateSelection()

end


--
function UI.Options_IconsComboBox_Slot:Reset()

	self:Select( false )
	self:ResetIco()

	self.data = nil

end


--
function UI.Options_IconsComboBox_Slot:Select( bSelect )

	self.bSelected = bSelect
	self:UpdateSelection()

end


--
function UI.Options_IconsComboBox_Slot:IsSelected()

	return self.bSelected

end


--
function UI.Options_IconsComboBox_Slot:UpdateEffects()

	self:UpdateMouseOver()

end


--
function UI.Options_IconsComboBox_Slot:GetParam()

	return self.data and self.data.param

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Options_IconsComboBox_Slot.layers =
{
	MAIN_EFFECT			= 0,
    ICO_EFFECT			= 1,
    SEL_EFFECT			= 2,
    MOUSE_OVER_EFFECT	= 3,
}

UI.Options_IconsComboBox_Slot.sounds =
{
	slotMouseOver = UI.sounds.btnMouseOver
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Options_IconsComboBox_Slot.slotIdx	= -1
UI.Options_IconsComboBox_Slot.data		= nil
UI.Options_IconsComboBox_Slot.bSelected 	= false

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Options_IconsComboBox_Slot:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:Reset()

end


--
function UI.Options_IconsComboBox_Slot:ResetIco()
end


--
function UI.Options_IconsComboBox_Slot:UpdateSelection()

	self:SetLayerVisible( self:IsSelected(), self.layers.SEL_EFFECT )

end


--
function UI.Options_IconsComboBox_Slot:UpdateIco()
end



--
function UI.Options_IconsComboBox_Slot:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Options_IconsComboBox_Slot:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.slotMouseOver )
	end

end


--
function UI.Options_IconsComboBox_Slot:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Options_IconsComboBox_Slot:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Options_IconsComboBox_Slot:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()
	self:UpdateMouseOver()

end


--
function UI.Options_IconsComboBox_Slot:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
		self:UpdateMouseOver()
	end

end


--
function UI.Options_IconsComboBox_Slot:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos()
	end

end                                                                                                                          	


-- ------------------------------------------------------------------------
-- UI.Options_IconsComboBox_StateBtn
-- ------------------------------------------------------------------------

UI.Options_IconsComboBox_StateBtn =
{
    def =
    {   	
     	className	= "ButtonWnd",
    	prototype	= "ComboBox_StateBtn",

     	props =
     	{
     		name		= "Options_IconsComboBox_StateBtn",
    		isPrototype	= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

    			effects =
    			{{
    				defName				= "options_iconsComboBox_stateBtn",
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
    },

    effectInfo =
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
    		animationDisabled	= "disable_2",
    	},
    }
}

-- -------------------------------------------------------------
-- UI.Options_ColorsComboBox
-- -------------------------------------------------------------

UI.Options_ColorsComboBox =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "Options_IconsComboBox",

    	props =
    	{
    		name		= "Options_ColorsComboBox",
    		isPrototype	= true,
    	},
    },

	selItemPrototypeName	= "Options_ColorsComboBox_Slot",
	listPrototypeName		= "Options_ColorsComboBox_List",

}

-- -------------------------------------------------------------
-- UI.Options_ColorsComboBox_List
-- -------------------------------------------------------------

UI.Options_ColorsComboBox_List =
{
    def =
    {
    	className 	= "Wnd",
		prototype	= "Options_IconsComboBox_List",

    	props =
    	{
    		name			= "Options_ColorsComboBox_List",
    		isPrototype		= true,
    	},
	},

	btnPrototypeName = "Options_ColorsComboBox_Row"
}

-- -------------------------------------------------------------
-- UI.Options_ColorsComboBox_Row
-- -------------------------------------------------------------

UI.Options_ColorsComboBox_Row =
{
    def =
    {
    	className 	= "Wnd",
		prototype	= "Options_IconsComboBox_Row",

    	props =
    	{
    		name			= "Options_ColorsComboBox_Row",
    		isPrototype		= true,
    	},
	},

	slotPrototypeName	= "Options_ColorsComboBox_Slot",
	parentListName		= "Options_ColorsComboBox_List",
}


-- -------------------------------------------------------------
-- UI.Options_ColorsComboBox_Slot
-- -------------------------------------------------------------

UI.Options_ColorsComboBox_Slot = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_ColorsComboBox_Slot.def =
{
	className	= "Wnd",
	prototype	= "Options_IconsComboBox_Slot",

	props =
	{
		name		= "Options_ColorsComboBox_Slot",
		isPrototype	= true,
	}
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_ColorsComboBox_Slot:ResetIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetColor( UI.WHITE_COLOR )
	end

end


--
function UI.Options_ColorsComboBox_Slot:UpdateIco()

	local color = self.data and self.data.param or UI.WHITE_COLOR

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetColor( color )
	end

end


-- -------------------------------------------------------------
-- UI.Options_CursorTypesComboBox
-- -------------------------------------------------------------

UI.Options_CursorTypesComboBox =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "Options_IconsComboBox",

    	props =
    	{
    		name		= "Options_CursorTypesComboBox",
    		isPrototype	= true,
    	},
    },

    selItemPrototypeName	= "Options_CursorTypesComboBox_Slot",
    listPrototypeName		= "Options_CursorTypesComboBox_List",

}

-- -------------------------------------------------------------
-- UI.Options_CursorTypesComboBox_List
-- -------------------------------------------------------------

UI.Options_CursorTypesComboBox_List =
{
    def =
    {
    	className 	= "Wnd",
		prototype	= "Options_IconsComboBox_List",

    	props =
    	{
    		name			= "Options_CursorTypesComboBox_List",
    		isPrototype		= true,
    	},
	},

	btnPrototypeName = "Options_CursorTypesComboBox_Row"
}

-- -------------------------------------------------------------
-- UI.Options_CursorTypesComboBox_Row
-- -------------------------------------------------------------

UI.Options_CursorTypesComboBox_Row =
{
    def =
    {
    	className 	= "Wnd",
		prototype	= "Options_IconsComboBox_Row",

    	props =
    	{
    		name			= "Options_CursorTypesComboBox_Row",
    		isPrototype		= true,
    	},
	},

	slotPrototypeName	= "Options_CursorTypesComboBox_Slot",
	parentListName		= "Options_CursorTypesComboBox_List",
}


-- -------------------------------------------------------------
-- UI.Options_CursorTypesComboBox_Slot
-- -------------------------------------------------------------

UI.Options_CursorTypesComboBox_Slot = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_CursorTypesComboBox_Slot.def =
{
	className	= "Wnd",
	prototype	= "Options_IconsComboBox_Slot",

	props =
	{
		name		= "Options_CursorTypesComboBox_Slot",
		isPrototype	= true,
	},

	layers =
	{
		-- ICO_EFFECT
		{
			id = UI.Options_IconsComboBox_Slot.layers.ICO_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
			updatable	= false,
		},
	}
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.Options_CursorTypesComboBox_Slot.effectInfo =
{
	main =
	{
		centerLocator	= "center",
		radiusLocator	= "radius",
	},

	ico =
	{
		minSizeLocator	= "min",
		maxSizeLocator	= "max",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Options_CursorTypesComboBox_Slot.radius		= 0
UI.Options_CursorTypesComboBox_Slot.isCircle	= false
UI.Options_CursorTypesComboBox_Slot.centerPos	= Vec2( 0, 0 )

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_CursorTypesComboBox_Slot:F_PostLoad()

	UI.Options_IconsComboBox_Slot.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.centerPos	= mainEffect:GetObjPos( self.effectInfo.main.centerLocator )
		self.radius		= mainEffect:GetObjSize( self.effectInfo.main.radiusLocator ).x

		mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.ICO_EFFECT, "" )

	end                         

end


--
function UI.Options_CursorTypesComboBox_Slot:ResetIco()

	self:SetLayerVisible( false, self.layers.ICO_EFFECT )

	local pool = self:GetEffectsPool( self.layers.ICO_EFFECT )
	if pool then
		pool:Clear()
	end

	self.isCircle	= false

end


--
function UI.Options_CursorTypesComboBox_Slot:UpdateIco()

	self:SetLayerVisible( true, self.layers.ICO_EFFECT )

	local cursorType = self.data.param
	local cursorInfo = cursorType and UI.gameCursorTypes[ cursorType ]

	if not cursorInfo then
		sys.log( "UI.Options_CursorTypesComboBox_Slot:UpdateIco()[ERROR]: cannot find UI.gameCursorTypes[%s]", tostring( cursorType ) )
		return
	end

	local pool = self:GetEffectsPool( self.layers.ICO_EFFECT )
	if pool then

		local effectName = cursorInfo.effect or ""
		if effectName ~= "" then

    		local icoEffect = pool:AddEffect( cursorInfo.effect, self:GetUiHandle() )
    		if icoEffect then

				local anim = cursorInfo.animation or ""
				if anim ~= "" then
	    			icoEffect:StartAnimation( anim )
				else
					sys.log( "UI.Options_CursorTypesComboBox_Slot:UpdateIco()[ERROR]: no animation specified for cursor type \"%s\"", tostring( cursorInfo.name ) )
				end

    			local minSize	= icoEffect:GetObjSize( self.effectInfo.ico.minSizeLocator ).x
    			local maxSize	= icoEffect:GetObjSize( self.effectInfo.ico.maxSizeLocator ).x

    			local animTime = ( self.radius - minSize ) / ( maxSize - minSize )
    			icoEffect:SetAnimationTime( animTime )
				icoEffect:Update( 0 )

				icoEffect:SetPos( self.centerPos )

			else
				sys.log( "UI.Options_CursorTypesComboBox_Slot()[ERROR]: cannot create effect \"%s\" for cursor type \"%s\"", effectName, tostring( cursorInfo.name ) )
    		end

		end

	end

	self.isCircle = cursorInfo.isCircle
	if self.isCircle == nil then
		self.isCircle = true
	end

end


--
function UI.Options_CursorTypesComboBox_Slot:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )	

	if layerIdx == self.layers.ICO_EFFECT then

		local pool = self:GetEffectsPool( self.layers.ICO_EFFECT )
		if pool then
			pool:Render()
		end	

		if self.isCircle then
			UI.drawer:DrawCircle( self:XToScreen( self.centerPos.x ), self:YToScreen( self.centerPos.y ), self.radius, UI.CURSOR_CIRCLE_WIDTH, UI.WHITE_COLOR, 1 )
		end

	end

end


--
function UI.Options_CursorTypesComboBox_Slot:UpdateEffects()

	UI.Options_IconsComboBox_Slot.UpdateEffects( self )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:UpdatePos()
	end

end                                                                                                                          	


-- -------------------------------------------------------------
-- UI.Options_CursorCrossTypesComboBox
-- -------------------------------------------------------------

UI.Options_CursorCrossTypesComboBox =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "Options_IconsComboBox",

    	props =
    	{
    		name		= "Options_CursorCrossTypesComboBox",
    		isPrototype	= true,
    	},
    },

    selItemPrototypeName	= "Options_CursorCrossTypesComboBox_Slot",
    listPrototypeName		= "Options_CursorCrossTypesComboBox_List",
}

-- -------------------------------------------------------------
-- UI.Options_CursorCrossTypesComboBox_List
-- -------------------------------------------------------------

UI.Options_CursorCrossTypesComboBox_List =
{
    def =
    {
    	className 	= "Wnd",
		prototype	= "Options_IconsComboBox_List",

    	props =
    	{
    		name			= "Options_CursorCrossTypesComboBox_List",
    		isPrototype		= true,
    	},
	},

	btnPrototypeName = "Options_CursorCrossTypesComboBox_Row"
}

-- -------------------------------------------------------------
-- UI.Options_CursorCrossTypesComboBox_Row
-- -------------------------------------------------------------

UI.Options_CursorCrossTypesComboBox_Row =
{
    def =
    {
    	className 	= "Wnd",
		prototype	= "Options_IconsComboBox_Row",

    	props =
    	{
    		name			= "Options_CursorCrossTypesComboBox_Row",
    		isPrototype		= true,
    	},
	},

	slotPrototypeName	= "Options_CursorCrossTypesComboBox_Slot",
	parentListName		= "Options_CursorCrossTypesComboBox_List",
}


-- -------------------------------------------------------------
-- UI.Options_CursorCrossTypesComboBox_Slot
-- -------------------------------------------------------------

UI.Options_CursorCrossTypesComboBox_Slot = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_CursorCrossTypesComboBox_Slot.def =
{
	className	= "Wnd",
	prototype	= "Options_IconsComboBox_Slot",

	props =
	{
		name		= "Options_CursorCrossTypesComboBox_Slot",
		isPrototype	= true,
	},

	layers =
	{
		-- ICO_EFFECT
		{
			id = UI.Options_IconsComboBox_Slot.layers.ICO_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},
	}
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.Options_CursorCrossTypesComboBox_Slot.effectInfo =
{
	main =
	{
		centerLocator	= "center"
	},
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Options_CursorCrossTypesComboBox_Slot.centerPos	= Vec2( 0, 0 )

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_CursorCrossTypesComboBox_Slot:F_PostLoad()

	UI.Options_IconsComboBox_Slot.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.centerPos = mainEffect:GetObjPos( self.effectInfo.main.centerLocator )
		mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.ICO_EFFECT, "" )
	end

end


--
function UI.Options_CursorCrossTypesComboBox_Slot:ResetIco()

	self:SetLayerVisible( false, self.layers.ICO_EFFECT )

	local pool = self:GetEffectsPool( self.layers.ICO_EFFECT )
	if pool then
		pool:Clear()
	end

end


--
function UI.Options_CursorCrossTypesComboBox_Slot:UpdateIco()

	self:SetLayerVisible( true, self.layers.ICO_EFFECT )

	local cursorType = self.data.param
	local cursorInfo = cursorType and UI.gameCursorCrossTypes[ cursorType ]
	
	if not cursorInfo then
		sys.log( "UI.Options_CursorCrossTypesComboBox_Slot:UpdateIco()[ERROR]: cannot find UI.gameCursorCrossTypes[%s]", tostring( cursorType ) )
		return
	end

	local pool = self:GetEffectsPool( self.layers.ICO_EFFECT )
	if pool then

		local effectName = cursorInfo.effect or ""
		if effectName ~= "" then

    		local icoEffect = pool:AddEffect( cursorInfo.effect, self:GetUiHandle() )
    		if icoEffect then

				local anim = cursorInfo.animation or ""
				if anim ~= "" then
	    			icoEffect:StartAnimation( anim )
				else
					sys.log( "UI.Options_CursorCrossTypesComboBox_Slot:UpdateIco()[ERROR]: no animation specified for cursor type \"%s\"", tostring( cursorInfo.name ) )
				end

				icoEffect:SetPos( self.centerPos )

			else
				sys.log( "UI.Options_CursorCrossTypesComboBox_Slot()[ERROR]: cannot create effect \"%s\" for cursor type \"%s\"", effectName, tostring( cursorInfo.name ) )
    		end

		end

	end

end


--
function UI.Options_CursorTypesComboBox_Slot:UpdateEffects()

	UI.Options_IconsComboBox_Slot.UpdateEffects( self )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:UpdatePos()
	end

end                                                                                                                          	


-- ----------------------------------------------------------------------------------------------
-- UI.Options_HudCommonPreviewMainWnd
-- ----------------------------------------------------------------------------------------------

UI.Options_HudCommonPreviewMainWnd = {}

-- ----------------------------------
-- window definition
-- ----------------------------------

UI.Options_HudCommonPreviewMainWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Options_HudCommonPreviewMainWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "options_hudPreview_main",
				defaultAnimation    = "idle",

				links =
				{     
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "sh_center",
						layer		= "UI.Options_HudCommonPreviewMainWnd.layers.ARROWS_CIRCLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sh_ellipse",
						layer		= "UI.Options_HudCommonPreviewMainWnd.layers.ARROWS_MOUSE_RADIUS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sh_edge",
						layer		= "UI.Options_HudCommonPreviewMainWnd.layers.ARROWS_SCREEN_RECT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "damage",
						layer		= "UI.Options_HudCommonPreviewMainWnd.layers.DAMAGE_DIR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr",
						layer		= "UI.Options_HudCommonPreviewMainWnd.layers.PLAYER_SHIP_INFO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "enem_damage",
						layer		= "UI.Options_HudCommonPreviewMainWnd.layers.EFFECT_INCOMING_STATES",
						animParams	= UI.EffectAnimParams.POS,
					},    
				}
			}}
		},

		-- ARROWS_CIRCLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudPreview_arrowsCircle",
			}}
		},	

		-- ARROWS_MOUSE_RADIUS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudPreview_arrowsMouseRadius",
			}}
		},	

		-- ARROWS_SCREEN_RECT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudPreview_arrowsScreenRect",
			}}
		},	

		-- DAMAGE_DIR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudPreview_damageDir",
				defaultAnimation    = "idle",
			}}
		},	

		-- PLAYER_SHIP_INFO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudPreview_playerShipInfo",
				defaultAnimation    = "idle",
			}}
		},	

		-- EFFECT_INCOMING_STATES
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudPreview_incomingStates",
				defaultAnimation    = "idle",
			}}
		},	
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.Options_HudCommonPreviewMainWnd:OnOptionValueChanged( option )

	local bNeedReact = false

	for idx, optionName in pairs( self.relevantOptionNames ) do
		if option.id == optionName then
			bNeedReact = true
			break
		end
	end 

	if not bNeedReact then
		return
	end

	self:UpdateOption( option )

end


-- ----------------------------------
-- const
-- ----------------------------------

UI.Options_HudCommonPreviewMainWnd.layers =
{
    MAIN_EFFECT					= 0,   
    ARROWS_CIRCLE_EFFECT		= 1,
    ARROWS_MOUSE_RADIUS_EFFECT	= 2,
    ARROWS_SCREEN_RECT_EFFECT	= 3,
    DAMAGE_DIR_EFFECT			= 4,
    PLAYER_SHIP_INFO_EFFECT		= 5,
    EFFECT_INCOMING_STATES		= 6,
}

UI.Options_HudCommonPreviewMainWnd.relevantOptionNames =
{
    "onCircleMarksMode",
    "hudArrowsAreaType",
    "allowDamageDir",
    "hudPlayerShipInfoAlpha",
    "showIncomingStates",
}

UI.Options_HudCommonPreviewMainWnd.effectInfo =
{
	arrows =
	{
		animsByMode =
		{
			[ UI.hudOnCircleMarksModes.ALL ]			= "all",
			[ UI.hudOnCircleMarksModes.SPECIAL ]		= "points",
			[ UI.hudOnCircleMarksModes.NONE ]			= "hide",
			[ UI.hudOnCircleMarksModes.NOT_FRIENDLY ]	= "hide_friends",
		}
	},
}

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.Options_HudCommonPreviewMainWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:Reset()

end


--
function UI.Options_HudCommonPreviewMainWnd:Reset()

	for layerIdx = 0, self:GetNumLayers() - 1 do
		if layerIdx ~= self.layers.MAIN_EFFECT then
			self:SetLayerVisible( false, layerIdx )
		end
	end

end


--
function UI.Options_HudCommonPreviewMainWnd:FullUpdate()

	self:Reset()

	for idx, optionName in pairs( self.relevantOptionNames ) do

		local option = UI.Options:GetOptionByName( optionName )
		if option then
			self:UpdateOption( option )
		else
			sys.log( "UI.Options_HudCommonPreviewMainWnd:FullUpdate()[ERROR]: cannot find option \"%s\"", optionName )
		end

	end 

end


--
function UI.Options_HudCommonPreviewMainWnd:UpdateOption( option )

	if option.id == "onCircleMarksMode" or option.id == "hudArrowsAreaType" then

		self:SetLayerVisible( false, self.layers.ARROWS_CIRCLE_EFFECT )
		self:SetLayerVisible( false, self.layers.ARROWS_MOUSE_RADIUS_EFFECT )
		self:SetLayerVisible( false, self.layers.ARROWS_SCREEN_RECT_EFFECT )

		local arrowsModeOption = UI.Options:GetOptionByName( "onCircleMarksMode" )
		local arrowsAreaOption = UI.Options:GetOptionByName( "hudArrowsAreaType" )

		local layer = -1
		local areaType = arrowsAreaOption and arrowsAreaOption.value.cur

		if areaType == UI.hudArrowsAreaTypes.CIRCLE then
			layer = self.layers.ARROWS_CIRCLE_EFFECT

		elseif areaType == UI.hudArrowsAreaTypes.MOUSE_RADIUS then
			layer = self.layers.ARROWS_MOUSE_RADIUS_EFFECT

		elseif areaType == UI.hudArrowsAreaTypes.SCREEN_RECT then
			layer = self.layers.ARROWS_SCREEN_RECT_EFFECT

		else
			sys.log( "UI.Options_HudCommonPreviewMainWnd:UpdateOption()[ERROR]: unhandled marks area type: %s", tostring( areaType ) )
		end

		if layer ~= -1 then

			self:SetLayerVisible( true, layer )

			local effect = UI:GetEffectFromLayer( self, layer )
			if effect then

				local mode = arrowsModeOption and arrowsModeOption.value.cur

				local anim = self.effectInfo.arrows.animsByMode[ mode ]
				if anim then
					effect:StartAnimation( anim )
				else
					sys.log( "UI.Options_HudCommonPreviewMainWnd:UpdateOption()[ERROR]: cannot find animation for mode %s", tostring( mode ) )
				end

			end

		end

	elseif option.id == "allowDamageDir" then

		self:SetLayerVisible( option.value.cur, self.layers.DAMAGE_DIR_EFFECT )
		

	elseif option.id == "hudPlayerShipInfoAlpha" then

		local alpha = UI:Lerp( option.MIN, option.MAX, option.value.cur / UI.Options.NUM_SLIDER_STEPS )

		self:SetLayerVisible( true, self.layers.PLAYER_SHIP_INFO_EFFECT )

		local effect = UI:GetEffectFromLayer( self, self.layers.PLAYER_SHIP_INFO_EFFECT )
		if effect then
			effect:SetAlpha( alpha )
		end


	elseif option.id == "showIncomingStates" then

		self:SetLayerVisible( option.value.cur, self.layers.EFFECT_INCOMING_STATES )


	else
		sys.log( "UI.Options_HudCommonPreviewMainWnd:UpdateOption()[ERROR]: unhandled option: \"%s\"", option.id )
	end

end

-- ----------------------------------------------------------------------------------------------
-- UI.Options_HudCommonPreviewDetailsWnd
-- ----------------------------------------------------------------------------------------------

UI.Options_HudCommonPreviewDetailsWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_HudCommonPreviewDetailsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Options_HudCommonPreviewDetailsWnd",
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
				defName				= "options_hudCommonPreviewDetails",
				defaultAnimation    = "idle",

				links =
				{     
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ship_1",
						layer		= "UI.Options_HudCommonPreviewDetailsWnd.layers.SHIP_NEAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_2",
						layer		= "UI.Options_HudCommonPreviewDetailsWnd.layers.SHIP_FAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "base",
						layer		= "UI.Options_HudCommonPreviewDetailsWnd.layers.VP_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CURSOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- CURSOR_CROSS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- CURSOR_CIRCLE
		{
			layerType	= UI.LAYER_INVALID,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
		},

		-- SHIP_NEAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudCommonPreviewDetails_shipNear",
				defaultAnimation    = "idle",
			}}
		},

		-- SHIP_FAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudCommonPreviewDetails_shipFar",
				defaultAnimation    = "idle",
			}}
		},

		-- VP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "options_hudCommonPreviewDetails_vp",
				defaultAnimation    = "idle",
			}}
		},
	},

	children = { "UI.Options_PredictionPreviewWnd" }
}

-- -----------------------------------
-- inerface functions
-- -----------------------------------

--
function UI.Options_HudCommonPreviewDetailsWnd:OnOptionValueChanged( option )

	if option.id == "cursorTypes" then
		self:UpdateCursorType()

	elseif option.id == "cursorCrossTypes" then
		self:UpdateCursorCrossType()

	elseif option.id == "cursorColors" then
		self:UpdateCursorColor()

	elseif option.id == "predictionColors" then
		self:UpdatePredictionColor()

	elseif option.id == "highlightTarget" then
		self:UpdateHighlightTarget()

	elseif option.id == "adaptiveMarksSize" then

		self:UpdateAdaptiveMarksSizeData( self.shipMarkNearPreviewData )
		self:UpdateShipMarkNearWnd()

		self:UpdateAdaptiveMarksSizeData( self.shipMarkFarPreviewData )
		self:UpdateShipMarkFarWnd()			

	elseif option.id == "marksFadeOnDist" then

		self:UpdateMarksFadeOnDistData( self.shipMarkFarPreviewData )
		self:UpdateShipMarkFarWnd()	

	elseif option.id == "hideMarksFramesOutOfShot" then

		self:UpdateHideMarksFramesOutOfShotData( self.shipMarkFarPreviewData )
		self:UpdateShipMarkFarWnd()	

	elseif option.id == "scalableHealthBars" then

		self:UpdateScalableHealthBarsData( self.shipMarkNearPreviewData )
		self:UpdateShipMarkNearWnd()

	elseif option.id == "vpHpAlways" then

		self:UpdateVpHpAlwaysData( self.vpMarkPreviewData )
		self:UpdateVpMarkWnd()

	end

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Options_HudCommonPreviewDetailsWnd.layers =
{
    MAIN_EFFECT			= 0,
    CURSOR_EFFECT		= 1,
    CURSOR_CROSS_EFFECT	= 2,
    CURSOR_CIRCLE		= 3,
	SHIP_NEAR_EFFECT	= 4,
	SHIP_FAR_EFFECT		= 5,
	VP_EFFECT			= 6,
}

UI.Options_HudCommonPreviewDetailsWnd.effectInfo =
{
	main =
	{
		predictionPredictedLocator	= "center_2",
		predictionTargetLocator		= "center_1",
		cursorLocator				= "center_3",
		cursorRadiusLocator			= "radius",
		shipMarkNearLocator			= "center_1",
		shipMarkFarLocator			= "center_ship_2",
		shipMarkNearRadiusLocator	= "radius_ship_1",
		shipMarkFarRadiusLocator	= "radius_ship_2",
		vpMarkLocator				= "center_base",
	},

	cursor =
	{
		minSizeLocator	= "min",
		maxSizeLocator	= "max",
	},

	shipNear =
	{
		animNoHighLight	= "idle",
		animHighLight	= "stroke",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Options_HudCommonPreviewDetailsWnd.predictionWnd				= nil
UI.Options_HudCommonPreviewDetailsWnd.cursorRadius				= 0
UI.Options_HudCommonPreviewDetailsWnd.cursorPos					= Vec2( 0, 0 )
UI.Options_HudCommonPreviewDetailsWnd.cursorColor				= UI.WHITE_COLOR
UI.Options_HudCommonPreviewDetailsWnd.shipMarkNearWnd			= nil
UI.Options_HudCommonPreviewDetailsWnd.shipMarkFarWnd			= nil
UI.Options_HudCommonPreviewDetailsWnd.shipMarkNearRadius		= 0
UI.Options_HudCommonPreviewDetailsWnd.shipMarkFarRadius			= 0
UI.Options_HudCommonPreviewDetailsWnd.shipMarkNearPreviewData	= nil
UI.Options_HudCommonPreviewDetailsWnd.shipMarkFarPreviewData	= nil
UI.Options_HudCommonPreviewDetailsWnd.vpMarkWnd					= nil
UI.Options_HudCommonPreviewDetailsWnd.vpMarkPreviewData			= nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Options_HudCommonPreviewDetailsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.predictionWnd = UI.Options_PredictionPreviewWnd

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local predictedPos	= mainEffect:GetObjPos( self.effectInfo.main.predictionPredictedLocator )
		local targetPos		= mainEffect:GetObjPos( self.effectInfo.main.predictionTargetLocator )
		self.predictionWnd:Setup( predictedPos, targetPos )

		self.cursorRadius		= mainEffect:GetObjSize( self.effectInfo.main.cursorRadiusLocator ).x
		self.cursorPos			= mainEffect:GetObjPos(self.effectInfo.main.cursorLocator )
		self.shipMarkNearRadius	= mainEffect:GetObjSize( self.effectInfo.main.shipMarkNearRadiusLocator ).y
		self.shipMarkFarRadius	= mainEffect:GetObjSize( self.effectInfo.main.shipMarkFarRadiusLocator ).y

	end	

	self:CreateControls()

	self:Reset()

end


--
function UI.Options_HudCommonPreviewDetailsWnd:CreateControls()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	-- корабль вблизи, он же для предикшена

	self.shipMarkNearWnd = UI:CreateChildWnd( self, UI.Options_ShipMarkPreviewWnd, "near" )
	self:AddChild( self.shipMarkNearWnd )

	local shipMarkNearLocatorPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.shipMarkNearLocator ) or UI:ZeroVec2()
	local shipMarkNearOrgPos		= self.shipMarkNearWnd:GetCenter()

	local shipMarkNearPos = shipMarkNearLocatorPos - shipMarkNearOrgPos
	self.shipMarkNearWnd:SetPos( shipMarkNearPos.x, shipMarkNearPos.y )


	-- корабль вдали

	self.shipMarkFarWnd = UI:CreateChildWnd( self, UI.Options_ShipMarkPreviewWnd, "far" )
	self:AddChild( self.shipMarkFarWnd )

	local shipMarkFarLocatorPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.shipMarkFarLocator ) or UI:ZeroVec2()
	local shipMarkFarOrgPos		= self.shipMarkFarWnd:GetCenter()

	local shipMarkFarPos = shipMarkFarLocatorPos - shipMarkFarOrgPos
	self.shipMarkFarWnd:SetPos( shipMarkFarPos.x, shipMarkFarPos.y )


	-- маяк

	self.vpMarkWnd = UI:CreateChildWnd( self, UI.Options_VpMarkPreviewWnd, "" )
	self:AddChild( self.vpMarkWnd )

	local vpMarkLocatorPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.vpMarkLocator ) or UI:ZeroVec2()
	local vpMarkOrgPos		= self.vpMarkWnd:GetCenter()

	local vpMarkPos = vpMarkLocatorPos - vpMarkOrgPos
	self.vpMarkWnd:SetPos( vpMarkPos.x, vpMarkPos.y )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:Reset()

	self:ResetCursorType()
	self:ResetCursorCrossType()

	self.predictionWnd:Reset()
	self.shipMarkNearWnd:Reset()
	self.shipMarkFarWnd:Reset()
	self.vpMarkWnd:Reset()

	self.cursorColor				= UI.WHITE_COLOR
	self.shipMarkNearPreviewData	= nil
	self.shipMarkFarPreviewData		= nil
	self.vpMarkPreviewData			= nil

	local shipNearEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_NEAR_EFFECT )
	if shipNearEffect then		
		shipNearEffect:StartAnimation( self.effectInfo.shipNear.animNoHighLight )
	end		

end


--
function UI.Options_HudCommonPreviewDetailsWnd:ResetCursorType()

	self:SetLayerVisible( false, self.layers.CURSOR_EFFECT )
	self:SetLayerVisible( false, self.layers.CURSOR_CIRCLE )

	local pool = self:GetEffectsPool( self.layers.CURSOR_EFFECT )
	if pool then
		pool:Clear()
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:ResetCursorCrossType()

	self:SetLayerVisible( false, self.layers.CURSOR_CROSS_EFFECT )

	local pool = self:GetEffectsPool( self.layers.CURSOR_CROSS_EFFECT )
	if pool then
		pool:Clear()
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:FullUpdate()

	self:Reset()

	self:UpdateCursorColor()
	self:UpdateCursorType()
	self:UpdateCursorCrossType()
	self:UpdatePredictionColor()
	self:UpdateHighlightTarget()

	self:InitShipMarkNearPreviewData()
	self:UpdateShipMarkNearWnd()

	self:InitShipMarkFarPreviewData()
	self:UpdateShipMarkFarWnd()	

	self:InitVpMarkPreviewData()
	self:UpdateVpMarkWnd()

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorType()

	self:ResetCursorType()

	local option = UI.Options:GetOptionByName( "cursorTypes" )
	if not option then
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorType()[ERROR]: cannot find option \"cursorTypes\"" )
		return
	end

	local cursorType = option.value.cur
	local cursorInfo = cursorType and UI.gameCursorTypes[ cursorType ]

	if not cursorInfo then
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorType()[ERROR]: cannot find UI.gameCursorTypes[%s]", tostring( cursorType ) )
		return
	end

	self:SetLayerVisible( true, self.layers.CURSOR_EFFECT )

	local pool = self:GetEffectsPool( self.layers.CURSOR_EFFECT )
	if pool then

		local effectName = cursorInfo.effect or ""
		if effectName ~= "" then

    		local cursorEffect = pool:AddEffect( cursorInfo.effect, self:GetUiHandle() )
    		if cursorEffect then

				local anim = cursorInfo.animation or ""
				if anim ~= "" then
	    			cursorEffect:StartAnimation( anim )
				else
					sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorType()[ERROR]: no animation specified for cursor type \"%s\"", tostring( cursorInfo.name ) )
				end

    			local minSize	= cursorEffect:GetObjSize( self.effectInfo.cursor.minSizeLocator ).x
    			local maxSize	= cursorEffect:GetObjSize( self.effectInfo.cursor.maxSizeLocator ).x

    			local animTime = ( self.cursorRadius - minSize ) / ( maxSize - minSize )
    			cursorEffect:SetAnimationTime( animTime )
				cursorEffect:Update( 0 )

				cursorEffect:SetPos( self.cursorPos )

				cursorEffect:SetColor( self.cursorColor )

			else
				sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorType()[ERROR]: cannot create effect \"%s\" for cursor type \"%s\"", effectName, tostring( cursorInfo.name ) )
    		end

		end

	end

	local isCircle = cursorInfo.isCircle
	if isCircle == nil then
		isCircle = true
	end

	self:SetLayerVisible( isCircle, self.layers.CURSOR_CIRCLE )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorCrossType()

	self:ResetCursorCrossType()

	local option = UI.Options:GetOptionByName( "cursorCrossTypes" )
	if not option then
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorCrossType()[ERROR]: cannot find option \"cursorCrossTypes\"" )
		return
	end

	local cursorType = option.value.cur
	local cursorInfo = cursorType and UI.gameCursorCrossTypes[ cursorType ]

	if not cursorInfo then
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorCrossType()[ERROR]: cannot find UI.gameCursorCrossTypes[%s]", tostring( cursorType ) )
		return
	end

	self:SetLayerVisible( true, self.layers.CURSOR_CROSS_EFFECT )

	local pool = self:GetEffectsPool( self.layers.CURSOR_CROSS_EFFECT )
	if pool then

		local effectName = cursorInfo.effect or ""
		if effectName ~= "" then

    		local cursorCrossEffect = pool:AddEffect( cursorInfo.effect, self:GetUiHandle() )
    		if cursorCrossEffect then

				local anim = cursorInfo.animation or ""
				if anim ~= "" then
	    			cursorCrossEffect:StartAnimation( anim )
				else
					sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorCrossType()[ERROR]: no animation specified for cursor type \"%s\"", tostring( cursorInfo.name ) )
				end

				cursorCrossEffect:SetPos( self.cursorPos )

				cursorCrossEffect:SetColor( self.cursorColor )

			else
				sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorCrossType()[ERROR]: cannot create effect \"%s\" for cursor type \"%s\"", effectName, tostring( cursorInfo.name ) )
    		end

		end

	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorColor()

	self.cursorColor = UI.WHITE_COLOR

	local option = UI.Options:GetOptionByName( "cursorColors" )
	if option then

    	local colorId = option.value.cur
    	local colorInfo = UI.gameCursorColors[ colorId ]

    	if colorInfo then

			if type( colorInfo.color ) == "number" then
				self.cursorColor = colorInfo.color
			else
				sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorColor()[ERROR]: invalid type of the \"UI.gameCursorColors[%d].color\"; \"number\" expected, got \"%s\"", colorId, type( colorInfo.color ) )
			end

		else
    		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorColor()[ERROR]: cannot find UI.gameCursorColors[%s]", tostring( colorId ) )
    	end

	else
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateCursorColor()[ERROR]: cannot find option \"cursorColors\"" )
	end

	local cursorEffect = UI:GetEffectFromLayer( self, self.layers.CURSOR_EFFECT )
	if cursorEffect then
		cursorEffect:SetColor( self.cursorColor )
	end

	local cursorCrossEffect = UI:GetEffectFromLayer( self, self.layers.CURSOR_CROSS_EFFECT )
	if cursorCrossEffect then
		cursorCrossEffect:SetColor( self.cursorColor )
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdatePredictionColor()

	self.predictionWnd:UpdateColorFromOption()

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateHighlightTarget()

	local option = UI.Options:GetOptionByName( "highlightTarget" )
	if option then

		local bHighlight = option.value.cur

		local shipNearEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_NEAR_EFFECT )
		if shipNearEffect then		

			local anim = bHighlight and self.effectInfo.shipNear.animHighLight or self.effectInfo.shipNear.animNoHighLight
			shipNearEffect:StartAnimation( anim )

		end		

	else
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateHighlightTarget()[ERROR]: cannot find option \"highlightTarget\"" )
	end	

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateHideMarksFramesOutOfShotData( previewData )

	local option = UI.Options:GetOptionByName( "hideMarksFramesOutOfShot" )
	if option then
		previewData.bHideFramesOutOfShot = option.value.cur		
	else
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateHideMarksFramesOutOfShotData()[ERROR]: cannot find option \"hideMarksFramesOutOfShot\"" )
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateMarksFadeOnDistData( previewData )

	local option = UI.Options:GetOptionByName( "marksFadeOnDist" )
	if option then
		previewData.bFadeOnDist = option.value.cur		
	else
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateMarksFadeOnDistData()[ERROR]: cannot find option \"marksFadeOnDist\"" )
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateAdaptiveMarksSizeData( previewData )

	local option = UI.Options:GetOptionByName( "adaptiveMarksSize" )
	if option then
		previewData.bAdaptiveMarksSize = option.value.cur		
	else
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateAdaptiveMarksSizeData()[ERROR]: cannot find option \"adaptiveMarksSize\"" )
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateScalableHealthBarsData( previewData )

	local option = UI.Options:GetOptionByName( "scalableHealthBars" )
	if option then
		previewData.bScalableHealthBars = option.value.cur		
	else
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateScalableHealthBarsData()[ERROR]: cannot find option \"scalableHealthBars\"" )
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateVpHpAlwaysData( previewData )

	local option = UI.Options:GetOptionByName( "vpHpAlways" )
	if option then
		previewData.bVpHpAlways = option.value.cur		
	else
		sys.log( "UI.Options_HudCommonPreviewDetailsWnd:UpdateVpHpAlwaysData()[ERROR]: cannot find option \"vpHpAlways\"" )
	end

end


--
function UI.Options_HudCommonPreviewDetailsWnd:InitShipMarkNearPreviewData()

	local mark = UI.OptionsWnd:CreateShipMarkDefaultData()

	mark.wnd				= self.shipMarkNearWnd
	mark.data.dist			= 100
	mark.data.fireDist		= mark.data.dist
	mark.data.fireRange		= mark.data.dist + 1
	mark.previewSize		= self.shipMarkNearRadius * 2
	mark.data.isLock		= true

	local mode				= UI.HudObjectMarkWnd_InsideShip.modes.LOCK
	local marksElements		= self:CreateDefaultMarksElements()
	local modeMarksElements	= marksElements[ false ][ mode ]

	modeMarksElements.isFrame		= true
	modeMarksElements.isRole		= true
	modeMarksElements.isHpShield	= true


	self.shipMarkNearPreviewData = {}

	self.shipMarkNearPreviewData.mark					= mark
	self.shipMarkNearPreviewData.marksElements			= marksElements
	self.shipMarkNearPreviewData.mode					= mode
	self.shipMarkNearPreviewData.bHideFramesOutOfShot	= false
	self.shipMarkNearPreviewData.bFadeOnDist			= false
	self.shipMarkNearPreviewData.bAdaptiveMarksSize		= true
	self.shipMarkNearPreviewData.bScalableHealthBars	= false


	self:UpdateAdaptiveMarksSizeData( self.shipMarkNearPreviewData )
	self:UpdateScalableHealthBarsData( self.shipMarkNearPreviewData )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:InitShipMarkFarPreviewData()

	local mark = UI.OptionsWnd:CreateShipMarkDefaultData( "Ship_Race2_L_T5_Faction1" )

	mark.wnd				= self.shipMarkFarWnd
	mark.data.dist			= 1000
	mark.data.fireDist		= mark.data.dist
	mark.data.fireRange		= mark.data.dist - 1
	mark.previewSize		= self.shipMarkFarRadius * 2


	local mode				= UI.HudObjectMarkWnd_InsideShip.modes.BRIEF
	local marksElements		= self:CreateDefaultMarksElements()
	local modeMarksElements	= marksElements[ false ][ mode ]

	modeMarksElements.isFrame		= true
	modeMarksElements.isRole		= true


	self.shipMarkFarPreviewData = {}

	self.shipMarkFarPreviewData.mark					= mark
	self.shipMarkFarPreviewData.marksElements			= marksElements
	self.shipMarkFarPreviewData.mode					= mode
	self.shipMarkFarPreviewData.bHideFramesOutOfShot	= false
	self.shipMarkFarPreviewData.bFadeOnDist				= false
	self.shipMarkFarPreviewData.bAdaptiveMarksSize		= true
	self.shipMarkFarPreviewData.bScalableHealthBars		= false


	self:UpdateHideMarksFramesOutOfShotData( self.shipMarkFarPreviewData )
	self:UpdateMarksFadeOnDistData( self.shipMarkFarPreviewData )
	self:UpdateAdaptiveMarksSizeData( self.shipMarkFarPreviewData )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:InitVpMarkPreviewData()

	local mark = UI.OptionsWnd:CreateVpMarkDefaultData()
	mark.wnd = self.vpMarkWnd
	mark.previewHp = mark.previewMaxHp * 0.65

	self.vpMarkPreviewData = {}

	self.vpMarkPreviewData.mark			= mark
	self.vpMarkPreviewData.bVpHpAlways	= false

	self:UpdateVpHpAlwaysData( self.vpMarkPreviewData )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateShipMarkNearWnd()	

	self:UpdateMarkWnd( self.shipMarkNearWnd, self.shipMarkNearPreviewData )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateShipMarkFarWnd()	

	self:UpdateMarkWnd( self.shipMarkFarWnd, self.shipMarkFarPreviewData )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateVpMarkWnd()

	self:UpdateMarkWnd( self.vpMarkWnd, self.vpMarkPreviewData )

end


--
function UI.Options_HudCommonPreviewDetailsWnd:UpdateMarkWnd( markWnd, previewData )

	markWnd:SetPreviewData( previewData )
	markWnd:UpdatePreview()

end


--
function UI.Options_HudCommonPreviewDetailsWnd:CreateDefaultMarksElements()

	local marksElements = { [ false ] = {}, [ true ] = {} }
	
	local elements =
	{
		isName		= false,
		isRole		= false,
		isSpecIco	= false,
		isRank		= false,
		isShipName	= false,
		isHpShield	= false,
		isDist		= false,
		isFrame		= false,
	}

	for modeName, info in pairs( UI.defaultMarksElements ) do

		local hudModeInfo = UI.Options_HudMarksOptionListWnd.marksMode2Hud[ modeName ]

		if hudModeInfo then
			marksElements[ hudModeInfo.bAlly ][ hudModeInfo.mode ] = UI:CopyTable2( elements )
		end

	end

	return marksElements

end


--
function UI.Options_HudCommonPreviewDetailsWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )	

	if layerIdx == self.layers.CURSOR_CIRCLE then
		UI.drawer:DrawCircle( self:XToScreen( self.cursorPos.x ), self:YToScreen( self.cursorPos.y ), self.cursorRadius, UI.CURSOR_CIRCLE_WIDTH, self.cursorColor, 1 )
	end

end


-- ----------------------------------------------------------------------------------------------
-- UI.Options_PredictionPreviewWnd
-- ----------------------------------------------------------------------------------------------

UI.Options_PredictionPreviewWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Options_PredictionPreviewWnd.def =
{
	className	= "Wnd",
	prototype	= "PredictionWnd",

	props =
	{
		name	= "Options_PredictionPreviewWnd"
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Options_PredictionPreviewWnd:Setup( predictedPos, targetPos )

	self.predictedPos	= UI:Vec2CopyStable( predictedPos )
	self.targetPos		= UI:Vec2CopyStable( targetPos )

	if self:IsOnScreen() then
		self:UpdatePosOnScreen()
	end	

end


--
function UI.Options_PredictionPreviewWnd:Reset()

	self:SetColor( UI.WHITE_COLOR )

end


--
function UI.Options_PredictionPreviewWnd:UpdateColorFromOption()

	local option = UI.Options:GetOptionByName( "predictionColors" )
	if not option then
		sys.log( "UI.Options_PredictionPreviewWnd:UpdateColorFromOption()[ERROR]: cannot find option \"predictionColors\"" )
		return
	end

	local colorId = option.value.cur
	local colorInfo = UI.predictionColors[ colorId ]

	local color = colorInfo and colorInfo.color or UI.WHITE_COLOR
	self:SetColor( color )

end


-- -----------------------------------
-- vars
-- -----------------------------------

UI.Options_PredictionPreviewWnd.predictedPos	= Vec2( 0, 0 )	-- относительно родителя
UI.Options_PredictionPreviewWnd.targetPos		= Vec2( 0, 0 )	-- относительно родителя

-- -----------------------------------
-- work functions
-- -----------------------------------

function UI.Options_PredictionPreviewWnd:F_PostLoad()

	UI.PredictionWnd.F_PostLoad( self )

	self.trailEffect:StartAnimationById( self.animIdTrailActive )

end


--
function UI.Options_PredictionPreviewWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdatePosOnScreen()

end


--
function UI.Options_PredictionPreviewWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdatePosOnScreen()
	end

end


--
function UI.Options_PredictionPreviewWnd:F_OnResetDevice()

	UI.PredictionWnd.F_OnResetDevice( self )

	if self:IsOnScreen() then
		self:UpdatePosOnScreen()
	end

end


--
function UI.Options_PredictionPreviewWnd:UpdatePosOnScreen()

	if not self:IsOnScreen() then
		return
	end

	local parent = self:GetParent()

	self.predictedPos_abs	= Vec2( UI:XToAbs( parent:XToScreen( self.predictedPos.x ) ), UI:YToAbs( parent:YToScreen( self.predictedPos.y ) ) )
	self.targetPos_abs		= Vec2( UI:XToAbs( parent:XToScreen( self.targetPos.x ) ), UI:YToAbs( parent:YToScreen( self.targetPos.y ) ) )

	self:RecalcLayout()

end


--
function UI.Options_PredictionPreviewWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	-- ничего
end


--
function UI.Options_PredictionPreviewWnd:FullUpdate( dt )
	-- ничего
end


--
function UI.Options_PredictionPreviewWnd:UpdateColor()
	-- ничего
end 


--
function UI.Options_PredictionPreviewWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

end


-- -------------------------------------------------------------------
-- UI.Options_SubSetTabBtn
-- -------------------------------------------------------------------

UI.Options_SubSetTabBtn = {}

-- -------------------------------
-- window definition
-- -------------------------------

local l_numCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.Options_SubSetTabBtn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

UI.Options_SubSetTabBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Options_SubSetTabBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numCheckBoxLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "msgBox_btn",
				defaultAnimation    = "idle",

				links =
				{     
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.Options_SubSetTabBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= UI.Options_SubSetTabBtn.layers.TEXT,

			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	}
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.Options_SubSetTabBtn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )

end


-- -------------------------------
-- const
-- -------------------------------

UI.Options_SubSetTabBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over_nofocus",
		animationPressed	= "over_nofocus",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "disable",
	},
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Options_SubSetTabBtn.textId = ""

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Options_SubSetTabBtn:F_PostLoad()

	UI.EffectCheckBoxWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	if self.textId ~= "" then
		self:SetBtnText( UI:GetStringByName( self.textId ) )
	end

end

-- -------------------------------------------------------------------
-- UI.Options_HudCommonTabBtn, UI.Options_HudMarksTabBtn, UI.Options_HudMarksAllyTabBtn
-- -------------------------------------------------------------------

--
UI.Options_HudCommonTabBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Options_SubSetTabBtn",

		props =
		{
			name		= "Options_HudCommonTabBtn",
		}
	},

	textId = "optionSet_HudCommon"
}


--
UI.Options_HudMarksTabBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Options_SubSetTabBtn",

		props =
		{
			name		= "Options_HudMarksTabBtn",
		}
	},

	textId = "optionSet_HudMarks"
}

--
UI.Options_HudMarksAllyTabBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Options_SubSetTabBtn",

		props =
		{
			name		= "Options_HudMarksAllyTabBtn",
		}
	},

	textId = "optionSet_HudMarksAlly"
}

-- -----------------------------------------------------------------------
-- UI.Options_HudMarksOptionListWnd
-- -----------------------------------------------------------------------

UI.Options_HudMarksOptionListWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.Options_HudMarksOptionListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name	= "Options_HudMarksOptionListWnd",
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
				defName				= "options_hudMarksOptionList",
				defaultAnimation    = "idle",

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

-- --------------------------
-- interface functions
-- --------------------------

--
function UI.Options_HudMarksOptionListWnd:Init( bAlly )

	self.bAlly = bAlly
	self:UpdateAllMarksElements()

end


--
function UI.Options_HudMarksOptionListWnd:OnOptionValueChanged( option )

	local marksMode = option.marksMode
	if UI:IsStrEmpty( marksMode ) then
		return
	end

	self:UpdateMakrsElementsForOption( option )

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		if data.marksMode == marksMode then

			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnOptionValueChanged( option )
			end

		end
		
	end

end


--
function UI.Options_HudMarksOptionListWnd:GetMarksElements()

	return self.marksElements

end


--
function UI.Options_HudMarksOptionListWnd:Clear()

	UI.ButtonsList3Wnd.Clear( self )

	self.bAlly			= false
	self.marksElements	= { [ false ] = {}, [ true ] = {} }

end


-- --------------------------
-- const
-- --------------------------

UI.Options_HudMarksOptionListWnd.btnPrototypeName	= "Options_HudMarksModeSlotWnd"

UI.Options_HudMarksOptionListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
	}
}

UI.Options_HudMarksOptionListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.Options_HudMarksOptionListWnd.MAX_SLOTS = 3

UI.Options_HudMarksOptionListWnd.marksMode2Hud =
{
	brief		= { mode = UI.HudObjectMarkWnd_InsideShip.modes.BRIEF,	bAlly = false },
	full		= { mode = UI.HudObjectMarkWnd_InsideShip.modes.FULL,	bAlly = false },
	lock		= { mode = UI.HudObjectMarkWnd_InsideShip.modes.LOCK,	bAlly = false },
	brief_ally	= { mode = UI.HudObjectMarkWnd_InsideShip.modes.BRIEF,	bAlly = true },
	full_ally	= { mode = UI.HudObjectMarkWnd_InsideShip.modes.FULL,	bAlly = true },
	lock_ally	= { mode = UI.HudObjectMarkWnd_InsideShip.modes.LOCK,	bAlly = true },
}

-- --------------------------
-- vars
-- --------------------------

UI.Options_HudMarksOptionListWnd.bAlly			= false
UI.Options_HudMarksOptionListWnd.marksElements	= { [ false ] = {}, [ true ] = {} }

-- --------------------------
-- work functions
-- --------------------------

--
function UI.Options_HudMarksOptionListWnd:UpdateAllMarksElements()

	local setOptions = self.bAlly and UI.Options.sets.HudMarksAlly or UI.Options.sets.HudMarks

	for optionIdx, option in pairs( setOptions ) do
		if option.marksMode then
			self:UpdateMakrsElementsForOption( option )
		end
	end

end


--
function UI.Options_HudMarksOptionListWnd:UpdateMakrsElementsForOption( option )

	-- создается имитация структуры двнных из UI.HudObjectsMarksWnd

	local marksMode = option.marksMode
	if UI:IsStrEmpty( marksMode ) then
		sys.log( "UI.Options_HudMarksOptionListWnd:UpdateMakrsElementsForOption()[ERROR]: not marksMode in option \"%s\"", option.id )
		return
	end

	local modeCapture, nameCapture = string.match( option.id, "^marksElements_([%w_]+)_([%w_]+)$" )
	if not modeCapture or not nameCapture then
		sys.log( "UI.Options_HudMarksOptionListWnd:UpdateMakrsElementsForOption()[ERROR]: invalid name format for option \"%s\"", option.id )
		return
	end

	if modeCapture ~= marksMode then
		sys.log( "UI.Options_HudMarksOptionListWnd:UpdateMakrsElementsForOption()[ERROR]: marksMode not match name for option \"%s\"", option.id )
		return
	end

	local hudMarksModeInfo = self.marksMode2Hud[ marksMode ]
	if not hudMarksModeInfo then
		sys.log( "UI.Options_HudMarksOptionListWnd:UpdateMakrsElementsForOption()[ERROR]: invalid marksMode \"%s\" for option \"%s\"", marksMode, option.id )
		return
	end

	local varName = ""

	if nameCapture == "name" then
		varName = "isName"
	elseif nameCapture == "role" then
		varName = "isRole"
	elseif nameCapture == "specIco" then
		varName = "isSpecIco"
	elseif nameCapture == "rank" then
		varName = "isRank"
	elseif nameCapture == "shipName" then
		varName = "isShipName"
	elseif nameCapture == "hpShield" then
		varName = "isHpShield"
	elseif nameCapture == "dist" then
		varName = "isDist"
	elseif nameCapture == "frame" then
		varName = "isFrame"
	else
		sys.log( "UI.Options_HudMarksOptionListWnd:UpdateMakrsElementsForOption()[ERROR]: unhandled option short name \"%s\" for option \"%s\"", nameCapture, option.id )
	end

	if varName == "" then
		return
	end

	local modesOptionVals = self.marksElements[ hudMarksModeInfo.bAlly ][ hudMarksModeInfo.mode ]
	if not modesOptionVals then
		modesOptionVals = {}
		self.marksElements[ hudMarksModeInfo.bAlly ][ hudMarksModeInfo.mode ] = modesOptionVals
	end

	modesOptionVals[ varName ] = option.value.cur

end

-- -----------------------------------------------------------------------
-- UI.Options_HudMarksModeSlotWnd
-- -----------------------------------------------------------------------

UI.Options_HudMarksModeSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_HudMarksModeSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Options_HudMarksModeSlotWnd",
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
				defName				= "options_hudMarksModeSlot",
				defaultAnimation    = "idle",

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

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.Options_HudMarksModeSlotWnd:Reset()

	self:ResetOptionsSlots()
	self.labelWnd:Reset()
	self.previewWnd:Reset()

end


--
function UI.Options_HudMarksModeSlotWnd:OnOptionValueChanged( option )

	local data = self:GetRecordData()
	local marksMode = data and data.marksMode

	if not marksMode or option.marksMode ~= marksMode then
		sys.log( "UI.Options_HudMarksModeSlotWnd:OnOptionValueChanged()[ERROR]: invalid marksMode" )
		return
	end

	for slotIdx, slotWnd in pairs( self.optionsSlots ) do

		local data = slotWnd:GetRecordData()
		if data.option == option then
			slotWnd:OnOptionValueChanged( option )
		end

	end

    self.previewWnd:OnOptionValueChanged( option )

end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Options_HudMarksModeSlotWnd.effectInfo =
{
	main =
	{
		labelLocator		= "title",
		optionSlotPrefix	= "slot_",
		previewLocator		= "lable_ship",
	}
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_HudMarksModeSlotWnd.optionsSlots	= {}
UI.Options_HudMarksModeSlotWnd.labelWnd		= nil
UI.Options_HudMarksModeSlotWnd.previewWnd	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_HudMarksModeSlotWnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	self.optionsSlots = {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.Options_HudMarksModeSlotWnd:CreateControls()

	self.labelWnd	= UI:CreateChildWnd( self, UI.Options_HudLabelBigWnd, "" )
	self.previewWnd	= UI:CreateChildWnd( self, UI.Options_MarksModePreviewWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.labelWnd, mainEffect, self.effectInfo.main.labelLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.previewWnd, mainEffect, self.effectInfo.main.previewLocator, UI.EffectAnimParams.POS )

end


--
function UI.Options_HudMarksModeSlotWnd:ResetOptionsSlots()

	for slotIdx, slotWnd in pairs( self.optionsSlots ) do

		local handle = slotWnd:GetUiHandle()

		if mainEffect then
			mainEffect:UnlinkWnd( handle, "" )
		end

		UI:RemoveUiObj( handle )

	end

	self.optionsSlots = {}
	UI:Purge()

end


--
function UI.Options_HudMarksModeSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:InitOptionsSlots( data )
	self:UpdateLabel( data )
	self:UpdatePreview( data )

end


--
function UI.Options_HudMarksModeSlotWnd:InitOptionsSlots( data )

	if UI:IsStrEmpty( data.marksMode ) then
		sys.log( "UI.Options_HudMarksModeSlotWnd:InitOptionsSlots[ERROR]: invalid marksMode" )
		return
	end

	local modeOptions = {}

	local setOptions = data.bAlly and UI.Options.sets.HudMarksAlly or UI.Options.sets.HudMarks
	for optionIdx = 1, #setOptions do

		local option = setOptions[ optionIdx ]

		if option.marksMode == data.marksMode then
			table.insert( modeOptions, option )
		end

	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for slotIdx = 1, #modeOptions do

		local option = modeOptions[ slotIdx ]				

		local slotWnd = UI:CreateChildWnd( self, UI.Options_HudMarksOptionSlotWnd, tostring( slotIdx ) )

		local locatorName = string.format( "%s%d", self.effectInfo.main.optionSlotPrefix, slotIdx )
		UI:AddChildAndLink( self, slotWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

		table.insert( self.optionsSlots, slotWnd )

		local slotData = { option = option }
		slotWnd:UpdateForData( slotData )

	end	

end


--
function UI.Options_HudMarksModeSlotWnd:UpdateLabel( data )

	local optionName = string.format( "marksElements_%s_label", data.marksMode )

	local option = UI.Options:GetOptionByName( optionName )
	if not option then
		sys.log( "UI.Options_HudMarksModeSlotWnd:InitLabel()[ERROR]: cannot find option \"%s\"", optionName )
		return
	end	

	-- заголовок

	local caption = UI:GetStringByName( option.strId )
	self.labelWnd:SetCaption( caption )	


	-- тултип

	local tooltipData = nil

	if type( option.GetTooltipData ) == "function" then
		tooltipData = option:GetTooltipData()

	else
    	tooltipData =
    	{
    		tooltipType = UI.tooltipTypes.TEXT_LARGE,
    		caption		= UI:GetStringByName( option.strId ),
    		text		= UI:GetStringByName( string.format( "%s_desc", option.strId ) ),
    	}
	end	

	self.labelWnd:SetTooltipData( tooltipData )

end


--
function UI.Options_HudMarksModeSlotWnd:UpdatePreview( data )

	self.previewWnd:Setup( data.marksMode, data.bAlly )

end

-- -----------------------------------------------------------------------
-- UI.Options_HudMarksOptionSlotWnd
-- -----------------------------------------------------------------------

UI.Options_HudMarksOptionSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_HudMarksOptionSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Options_HudCommonOptionSlotWnd",

	props =
	{
		name		= "Options_HudMarksOptionSlotWnd",
		isPrototype	= true,
	},
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.Options_HudMarksOptionSlotWnd:Reset()

	UI.Options_HudCommonOptionSlotWnd.Reset( self )

	self.data = nil

end


--
function UI.Options_HudMarksOptionSlotWnd:GetRecordData()

	return self.data

end

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_HudMarksOptionSlotWnd.data	= nil


-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_HudMarksOptionSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self.data = data

	self:InitControls()
	self:UpdateControls()
	self:UpdateDisabledState()
	self:UpdateTooltip()
	self:RecalcLayout()

end


-- -----------------------------------------------------------------------
-- UI.Options_MarksModePreviewWnd
-- -----------------------------------------------------------------------

UI.Options_MarksModePreviewWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_MarksModePreviewWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Options_MarksModePreviewWnd",
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
				defName				= "options_markPreview",
				defaultAnimation    = "idle",

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

-- ---------------------------------------
-- interface fintions
-- ---------------------------------------

--
function UI.Options_MarksModePreviewWnd:Setup( marksMode, bAlly )

	self:Reset()

	self.marksMode	= marksMode
	self.bAlly		= bAlly

	self:InitMarkPreviewData()
	self:UpdateMarkWnd()

end


--
function UI.Options_MarksModePreviewWnd:Reset()

	self.marksMode	= ""
	self.bAlly		= false

	self.markPreviewData = nil
	self.markWnd:Reset()
	
end


--
function UI.Options_MarksModePreviewWnd:OnOptionValueChanged( option )

	self:UpdateMarksElements()
	self:UpdateMarkWnd()

end


--
function UI.Options_MarksModePreviewWnd:GetMarksMode()

	return self.marksMode

end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Options_MarksModePreviewWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.Options_MarksModePreviewWnd.effectInfo =
{
	main =
	{
		markLocator		= "center_1",
		radiusLocator	= "radius",
	}
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Options_MarksModePreviewWnd.marksMode		= ""
UI.Options_MarksModePreviewWnd.bAlly			= false
UI.Options_MarksModePreviewWnd.markPreviewData	= nil
UI.Options_MarksModePreviewWnd.markWnd			= nil
UI.Options_MarksModePreviewWnd.radius			= 0

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_MarksModePreviewWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local radiusLocatorSize = mainEffect:GetObjSize( self.effectInfo.main.radiusLocator )
		self.radius = radiusLocatorSize.y
	end

	self:CreateControls()

end


--
function UI.Options_MarksModePreviewWnd:CreateControls()

	self.markWnd = UI:CreateChildWnd( self, UI.Options_ShipMarkPreviewWnd, "" )
	self:AddChild( self.markWnd )

	local markLocatorPos = UI:ZeroVec2()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		markLocatorPos = mainEffect:GetObjPos( self.effectInfo.main.markLocator )
	end

	local markOrgPos = self.markWnd:GetCenter()
	local markPos = markLocatorPos - markOrgPos

	self.markWnd:SetPos( markPos.x, markPos.y )

end


--
function UI.Options_MarksModePreviewWnd:InitMarkPreviewData()

	local mark = UI.OptionsWnd:CreateShipMarkDefaultData()

	mark.wnd				= self.markWnd
	mark.data.isLock		= self.marksMode == "lock" or self.marksMode == "lock_ally"
	mark.previewSize		= self.radius * 2
	mark.data.relationship	= self.bAlly and ai.RelatioshipType.FRIEND or ai.RelatioshipType.ENEMY
	mark.data.colorScheme	= self.bAlly and UI.gameObjColorSchemes.FRIEND or UI.gameObjColorSchemes.ENEMY	
	mark.data.bAlly			= self.bAlly

	self.markPreviewData = {}

	self.markPreviewData.mark					= mark
	self.markPreviewData.marksElements			= UI.Options_HudMarksOptionListWnd:GetMarksElements()
	self.markPreviewData.bHideFramesOutOfShot	= false
	self.markPreviewData.bScalableHealthBars	= false
	self.markPreviewData.bAdaptiveMarksSize		= true
	self.markPreviewData.bFadeOnDist			= false
	self.markPreviewData.mode 					= UI.Options_HudMarksOptionListWnd.marksMode2Hud[ self.marksMode ].mode

end


--
function UI.Options_MarksModePreviewWnd:UpdateMarksElements()

	self.markPreviewData.marksElements = UI.Options_HudMarksOptionListWnd:GetMarksElements()

end


--
function UI.Options_MarksModePreviewWnd:UpdateMarkWnd()

	self.markWnd:SetPreviewData( self.markPreviewData )
	self.markWnd:UpdatePreview()

end


-- -----------------------------------------------------------------------
-- UI.Options_ShipMarkPreviewWnd
-- -----------------------------------------------------------------------

UI.Options_ShipMarkPreviewWnd = {}

-- ---------------------------------------
-- window dwfinition
-- ---------------------------------------

UI.Options_ShipMarkPreviewWnd.def =
{
	className	= "Wnd",
	prototype	= "HudObjectMarkWnd_InsideShip",

	props =
	{
		name		= "Options_ShipMarkPreviewWnd",
		isPrototype	= true,
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.Options_ShipMarkPreviewWnd:SetPreviewData( previewData )

	self.previewData = previewData
	self.optionsSrc = self.previewData

end


--
function UI.Options_ShipMarkPreviewWnd:GetPreviewData()

	return self.previewData

end


--
function UI.Options_ShipMarkPreviewWnd:UpdatePreview()

	if not self.previewData then
		sys.log( "UI.Options_ShipMarkPreviewWnd:UpdatePreview()[ERROR]: no previewData" )
		return
	end

	self:Setup( self.previewData.mark )
	self:Update()
--	self:UpdateEffects()
	self:UpdateMetaTextPos()

end


--
function UI.Options_ShipMarkPreviewWnd:Reset()

	UI.HudObjectMarkWnd_InsideShip.Reset( self )

	self.previewData = nil
	self.optionsSrc = self.previewData

end


-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_ShipMarkPreviewWnd.previewData	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_ShipMarkPreviewWnd:F_PostLoad()

	UI.HudObjectMarkWnd_InsideShip.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.optionsSrc = self.previewData

end


--
function UI.Options_ShipMarkPreviewWnd:UpdateMode()

	self.mode = self.previewData and self.previewData.mode or -1
	self.bCustomizableMode = self.mode == self.modes.FULL or self.mode == self.modes.BRIEF or self.mode == self.modes.LOCK

end


--
function UI.Options_ShipMarkPreviewWnd:IsUnderMouse()

	return false

end


-- -----------------------------------------------------------------------
-- UI.Options_VpMarkPreviewWnd
-- -----------------------------------------------------------------------

UI.Options_VpMarkPreviewWnd = {}

-- ---------------------------------------
-- window dwfinition
-- ---------------------------------------

UI.Options_VpMarkPreviewWnd.def =
{
	className	= "Wnd",
	prototype	= "HudObjectMarkWnd_InsideVp",

	props =
	{
		name		= "Options_VpMarkPreviewWnd",
		isPrototype	= true,
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.Options_VpMarkPreviewWnd:SetPreviewData( previewData )

	self.previewData = previewData

end


--
function UI.Options_VpMarkPreviewWnd:GetPreviewData()

	return self.previewData

end


--
function UI.Options_VpMarkPreviewWnd:UpdatePreview()

	if not self.previewData then
		sys.log( "UI.Options_VpMarkPreviewWnd:UpdatePreview()[ERROR]: no previewData" )
		return
	end

	self:Setup( self.previewData.mark )
	self:Update()
--	self:UpdateEffects()

end


--
function UI.Options_VpMarkPreviewWnd:Reset()

	UI.HudObjectMarkWnd_InsideVp.Reset( self )

	self.previewData = nil

end


-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_VpMarkPreviewWnd.previewData	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_VpMarkPreviewWnd:NeedVpHpAlways()

	return self.previewData.bVpHpAlways

end


--
function UI.Options_VpMarkPreviewWnd:IsUnderMouse()

	return false

end


-- ------------------------------------------------------------------------
-- UI.Options_AccountWnd
-- ------------------------------------------------------------------------

UI.Options_AccountWnd = {}

-- ---------------------------------------------
-- window definition
-- ---------------------------------------------

UI.Options_AccountWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "Options_AccountWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName				= "options_optionList",
				defaultAnimation    = "sample",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		}
	},

	children = { "UI.Options_Account_MaskWnd" }
}

-- ---------------------------------------------
-- interface functions
-- ---------------------------------------------

--
function UI.Options_AccountWnd:Clear()

	self:Reset()

end


-- просто для совместимости с классическим окном опций
function UI.Options_AccountWnd:OnOptionValueChanged( option )
end


--
function UI.Options_AccountWnd:Scroll( bForward, ticks )

	if not self.scrollBar:IsChildOf( self ) then
		return
	end

	self.scrollBar:SetPos( self.scrollBar:GetPos() + self.scrollBar:GetStepSize() * ticks * ( bForward and - 1 or 1 ) )

end


--
function UI.Options_AccountWnd:Update()

	self:Reset()

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.Options_AccountWnd:Update()[ERROR]: not connected" )
		return
	end

	self:AddSlot( UI.Options_Account_SocialNetWnd )

	if cvars.cl_versionType == "live" then
		self:AddSlot( UI.Options_PtrServerWnd )
	end

	if _G.Arc_IsInitialized() then
		self:AddSlot( UI.Options_ArcWnd )
	end

	self:RecalcLayout()
	self:UpdateScrollBar()

end


--
function UI.Options_AccountWnd:FB_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end	

	UI.Options_Account_SocialNetWnd:FB_OnEvent( eventId, success, errorCode )

end


--
function UI.Options_AccountWnd:VK_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end	

	UI.Options_Account_SocialNetWnd:VK_OnEvent( eventId, success, errorCode )

end


--
function UI.Options_AccountWnd:MasterServer_OnPtrServerStatus( requestId, errcode, status )

	UI.Options_PtrServerWnd:MasterServer_OnPtrServerStatus( requestId, errcode, status )

end


--
function UI.Options_AccountWnd:MasterServer_OnPtrAccountStatus( requestId, errcode, status, nextSyncTime )

	UI.Options_PtrServerWnd:MasterServer_OnPtrAccountStatus( requestId, errcode, status, nextSyncTime )

end


--
function UI.Options_AccountWnd:MasterServer_OnCreatePtrAccount( requestId, errcode, status, nextSyncTime )

	UI.Options_PtrServerWnd:MasterServer_OnCreatePtrAccount( requestId, errcode, status, nextSyncTime )

end


--
function UI.Options_AccountWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.Options_PtrServerWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.Options_ArcWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

end


--
function UI.Options_AccountWnd:MasterServer_OnCheckYupPurchases( result, requestId, param1, param2 )

	UI.Options_ArcWnd:MasterServer_OnCheckYupPurchases( result, requestId, param1, param2 )

end


-- ---------------------------------------------
-- const
-- ---------------------------------------------

UI.Options_AccountWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Options_AccountWnd.effectInfo =
{
	main = 
	{
		scrollLocator		= "scroll",
		slotLocatorPrefix	= "slot_2_",
	}
}

UI.Options_AccountWnd.SCROLL_STEP = 20

-- ---------------------------------------------
-- vars
-- ---------------------------------------------

UI.Options_AccountWnd.scrollBar		= nil
UI.Options_AccountWnd.space_slots	= 0
UI.Options_AccountWnd.scrollPos		= Vec2( 0, 0 )
UI.Options_AccountWnd.curSlots		= {}

-- ---------------------------------------------
-- work functions
-- ---------------------------------------------

--
function UI.Options_AccountWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:PrepareLayout()
	self:InitScrollBar()

	UI.Options_Account_SocialNetWnd:UnlinkFromParent()
	UI.Options_PtrServerWnd:UnlinkFromParent()
	UI.Options_ArcWnd:UnlinkFromParent()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )

end


--
function UI.Options_AccountWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local NUM_SLOTS = 3

	local firstSlotPos		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local lastSlotPos		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, NUM_SLOTS ) ) or Vec2( 0, 0 )

	local firstSlotWnd		= UI.Options_ArcWnd
	local lastSlotWnd		= UI.Options_Account_SocialNetWnd
	local firstSlotHeight	= firstSlotWnd:GetHeight()
	local lastSlotHeight	= lastSlotWnd:GetHeight()

	self.space_slots = secondSlotPos.y - ( firstSlotPos.y + firstSlotHeight )

	local selfRect = self:GetRect()

	local space_mask_top = firstSlotPos.y
	local space_mask_btm = selfRect.w - ( lastSlotPos.y + lastSlotHeight )

	local maskRect = UI:Quat( 0, space_mask_top, selfRect.z, selfRect.w - space_mask_top - space_mask_btm )
	UI.Options_Account_MaskWnd:SetRect( maskRect )

	UI.Options_Account_ListWnd:SetWidth( maskRect.z )

	self.scrollPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.scrollLocator ) or Vec2( 0, 0 )

end


--
function UI.Options_AccountWnd:InitScrollBar()

	self.scrollBar = UI:CreateChildWnd( self, UI.EffectScrollWnd_Vrt, "" )
	self.scrollBar:RemoveScrollWndStyle( UI.SWS_STEPWISE_THUMB_MOVEMENT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )

	local needSize = mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollLocator ) or Vec2( 0, 0 )
	local baseSize = scrollEffect and scrollEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	local scale_y = baseSize.y ~= 0 and needSize.y / baseSize.y or 0
	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

	self.scrollBar:SetWidth( baseSize.x )
	self.scrollBar:SetHeight( needSize.y )

    self.scrollBar:SetStepSize( self.SCROLL_STEP )
	self.scrollBar:SetPageSize( UI.Options_Account_MaskWnd:GetHeight() )

	self.scrollBar:SetLeft( self.scrollPos.x )
	self.scrollBar:SetTop( self.scrollPos.y )

end


--
function UI.Options_AccountWnd:Reset()

	for idx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

	self:RecalcLayout()
	self:UpdateScrollBar()

end


--
function UI.Options_AccountWnd:AddSlot( slotWnd )

	UI.Options_Account_ListWnd:AddChild( slotWnd )

	local slotY = 0

	for idx, wnd in ipairs( self.curSlots ) do
		slotY = slotY + wnd:GetHeight() + self.space_slots
	end

	slotWnd:SetTop( slotY )

	table.insert( self.curSlots, slotWnd )	

	slotWnd:Update()

end


--
function UI.Options_AccountWnd:RecalcLayout()

	local slotsHeight = 0

	local lastSlotWnd = nil
	if next( self.curSlots ) then
		lastSlotWnd = self.curSlots[ #self.curSlots ]
	end

	if lastSlotWnd then
		local lastSlotRect = lastSlotWnd:GetRect()
		slotsHeight = lastSlotRect.y + lastSlotRect.w
	end

	UI.Options_Account_ListWnd:SetHeight( slotsHeight )

end


--
function UI.Options_AccountWnd:UpdateScrollBar()

	local scrollMax = UI.Options_Account_ListWnd:GetHeight() - UI.Options_Account_MaskWnd:GetHeight()

	local bNeedScrollBar = scrollMax > 0

	if not bNeedScrollBar then
		self.scrollBar:UnlinkFromParent()
		return
	end

	self:AddChild( self.scrollBar )

	self.scrollBar:SetRange( 0, scrollMax )

end


--
function UI.Options_AccountWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateListPosFromScrollBar()

end


--
function UI.Options_AccountWnd:UpdateListPosFromScrollBar()

	local scrollPos = self.scrollBar:GetPos()
	local y = UI:YRel2Snapped( -scrollPos )

	UI.Options_Account_ListWnd:SetTop( y )

end


-- -------------------------------------------------------------------------------
-- UI.Options_Account_MaskWnd
-- -------------------------------------------------------------------------------

UI.Options_Account_MaskWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_Account_MaskWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Options_Account_MaskWnd",
		style		= UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	children = { "UI.Options_Account_ListWnd" }
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_Account_MaskWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.Options_Account_MaskWnd.parent	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_Account_MaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
                                                                                                                     
	if self:IsPrototype() then
		return
	end

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.Options_Account_MaskWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.Options_Account_MaskWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.Options_Account_MaskWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


-- -------------------------------------------------------------------------------
-- UI.Options_Account_ListWnd
-- -------------------------------------------------------------------------------

UI.Options_Account_ListWnd =
{
    def =
    {
    	className	= "Wnd",

    	props =
    	{
    		name		= "Options_Account_ListWnd",
    		style		= UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
    	},

    	children =
    	{
    		"UI.Options_Account_SocialNetWnd",
    		"UI.Options_PtrServerWnd",
    		"UI.Options_ArcWnd",
    	}
    },
}

-- -----------------------------------------------------------------------
-- UI.Options_Account_SlotWnd
-- -----------------------------------------------------------------------

UI.Options_Account_SlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_Account_SlotWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "Options_Account_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},	
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

-- for overriding
function UI.Options_Account_SlotWnd:Reset()
end


-- for overriding
function UI.Options_Account_SlotWnd:Update()
end


-- -----------------------------------------------------------------------
-- UI.Options_Account_SocialNetWnd
-- -----------------------------------------------------------------------

UI.Options_Account_SocialNetWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_Account_SocialNetWnd.def =
{
	className 	= "Wnd",
	prototype	= "Options_Account_SlotWnd",

	props =
	{
		name		= "Options_Account_SocialNetWnd",
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
				defName				= "options_socialNet_list",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "slot_1_13",
						wnd			= "UI.Options_FacebookLoginSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn2",
						wnd			= "UI.Options_FacebookAddFriendsBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_1_14",
						wnd			= "UI.Options_VkLoginSlotWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn3",
						wnd			= "UI.Options_VkAddFriendsBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.Options_FacebookLoginSlotWnd", "UI.Options_FacebookAddFriendsBtn", "UI.Options_VkLoginSlotWnd", "UI.Options_VkAddFriendsBtn" }
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.Options_Account_SocialNetWnd:Reset()

	UI.Options_FacebookLoginSlotWnd:Reset()
	UI.Options_FacebookAddFriendsBtn:Reset()
	UI.Options_VkLoginSlotWnd:Reset()
	UI.Options_VkAddFriendsBtn:Reset()

end


--
function UI.Options_Account_SocialNetWnd:Update()

	UI.Options_FacebookLoginSlotWnd:Update()
	UI.Options_FacebookAddFriendsBtn:Update()
	UI.Options_VkLoginSlotWnd:Update()
	UI.Options_VkAddFriendsBtn:Update()

end


--
function UI.Options_Account_SocialNetWnd:FB_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end

	if not UI:IsTrueEx( success ) then
		return
	end

	if eventId == _G.FBEventType.FBET_LOGIN then

		UI.Options_FacebookLoginSlotWnd:Update()
		UI.Options_FacebookAddFriendsBtn:Update()

	end

end


--
function UI.Options_Account_SocialNetWnd:VK_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end

	if not UI:IsTrueEx( success ) then
		return
	end

	if eventId == _G.FBEventType.FBET_LOGIN then

		UI.Options_VkLoginSlotWnd:Update()
		UI.Options_VkAddFriendsBtn:Update()

	end

end     

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Options_Account_SocialNetWnd.layers =
{
	MAIN_EFFECT 	= 0,
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_Account_SocialNetWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.Options_Account_SocialNetWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Options_Account_SocialNetWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos()
	end

end


-- -----------------------------------------------------------------------
-- UI.Options_FacebookLoginSlotWnd
-- -----------------------------------------------------------------------

UI.Options_FacebookLoginSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_FacebookLoginSlotWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "Options_Facebook_LoginWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "options_facebook_loginSlot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_2",
						layer		= "UI.Options_FacebookLoginSlotWnd.layers.LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn",
						wnd			= "UI.Options_FacebookLoginBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- LABEL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children = { "UI.Options_FacebookLoginBtn" }
}


-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_FacebookLoginSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	LABEL		= 1,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_FacebookLoginSlotWnd.labelMetaText	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_FacebookLoginSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.labelMetaText = UI.MetaText.GetNewInstance()
	self.labelMetaText:InitFromLayer( self, self.layers.LABEL ) 

	self:Reset()

	self:UpdateLabelText()

end


--
function UI.Options_FacebookLoginSlotWnd:F_Shutdown()

	if self.labelMetaText then
		self.labelMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Options_FacebookLoginSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Options_FacebookLoginSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Options_FacebookLoginSlotWnd:UpdateMetaTextPos()

	self.labelMetaText:UpdateScreenOrgFromLayer( self, self.layers.LABEL )

end


--
function UI.Options_FacebookLoginSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.LABEL then
		self.labelMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Options_FacebookLoginSlotWnd:Reset()

	UI.Options_FacebookLoginBtn:Enable( false )

end


--
function UI.Options_FacebookLoginSlotWnd:Update()

	local bEnable = _G.MasterServer_IsConnected() and not _G.FB_IsLoggedIn()
	UI.Options_FacebookLoginBtn:Enable( bEnable )

end


--
function UI.Options_FacebookLoginSlotWnd:UpdateLabelText()

	local strIco = string.format( "$texture [texName %s][ignoreFontSize true][alignment CENTER][color %u]$", "soc_fb_ico", UI.WHITE_COLOR )

	local str = UI:GetStringByName( "option_facebookLogin_label" )
	str = string.format( "%s %s", str, strIco )

	self.labelMetaText:SetText( str, true )

end


-- -----------------------------------------------------------------------
-- UI.Options_FacebookLoginBtn
-- -----------------------------------------------------------------------

UI.Options_FacebookLoginBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn2",

		props =
		{
			name	= "Options_FacebookLoginBtn",
		}
	},

	textId = "option_facebookLogin_btn"
}

-- -----------------------------------------------------------------------
-- UI.Options_FacebookAddFriendsBtn
-- -----------------------------------------------------------------------

UI.Options_FacebookAddFriendsBtn = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_FacebookAddFriendsBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn6",

	props =
	{
		name	= "Options_FacebookAddFriendsBtn",
	}
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Options_FacebookAddFriendsBtn.textId = "option_facebookAddFriends"

UI.Options_FacebookAddFriendsBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "option_facebookAddFriends" ),
	text		= UI:GetStringByName( "option_facebookAddFriends_tooltipText" )
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_FacebookAddFriendsBtn:Reset()

	self:SetGray( true )

end


--
function UI.Options_FacebookAddFriendsBtn:Update()

	local bEnable = _G.MasterServer_IsConnected() and _G.FB_IsLoggedIn()
	self:SetGray( not bEnable )

end 


-- -----------------------------------------------------------------------
-- UI.Options_VkLoginSlotWnd
-- -----------------------------------------------------------------------

UI.Options_VkLoginSlotWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_VkLoginSlotWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name		= "Options_Vk_LoginWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "options_facebook_loginSlot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_2",
						layer		= "UI.Options_VkLoginSlotWnd.layers.LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn",
						wnd			= "UI.Options_VkLoginBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- LABEL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children = { "UI.Options_VkLoginBtn" }
}


-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_VkLoginSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
	LABEL		= 1,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_VkLoginSlotWnd.labelMetaText	= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_VkLoginSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.labelMetaText = UI.MetaText.GetNewInstance()
	self.labelMetaText:InitFromLayer( self, self.layers.LABEL ) 

	self:Reset()

	self:UpdateLabelText()

end


--
function UI.Options_VkLoginSlotWnd:F_Shutdown()

	if self.labelMetaText then
		self.labelMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Options_VkLoginSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Options_VkLoginSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Options_VkLoginSlotWnd:UpdateMetaTextPos()

	self.labelMetaText:UpdateScreenOrgFromLayer( self, self.layers.LABEL )

end


--
function UI.Options_VkLoginSlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.LABEL then
		self.labelMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Options_VkLoginSlotWnd:Reset()

	UI.Options_VkLoginBtn:Enable( false )

end


--
function UI.Options_VkLoginSlotWnd:Update()

	local bEnable = _G.MasterServer_IsConnected() and not _G.VK_IsLoggedIn()
	UI.Options_VkLoginBtn:Enable( bEnable )

end


--
function UI.Options_VkLoginSlotWnd:UpdateLabelText()

	local strIco = string.format( "$texture [texName %s][ignoreFontSize true][alignment CENTER][color %u]$", "soc_vk_ico", UI.WHITE_COLOR )

	local str = UI:GetStringByName( "option_vkLogin_label" )
	str = string.format( "%s %s", str, strIco )

	self.labelMetaText:SetText( str, true )

end


-- -----------------------------------------------------------------------
-- UI.Options_VkLoginBtn
-- -----------------------------------------------------------------------

UI.Options_VkLoginBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn2",

		props =
		{
			name	= "Options_VkLoginBtn",
		}
	},

	textId = "option_vkLogin_btn"
}

-- -----------------------------------------------------------------------
-- UI.Options_VkAddFriendsBtn
-- -----------------------------------------------------------------------

UI.Options_VkAddFriendsBtn = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.Options_VkAddFriendsBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn6",

	props =
	{
		name	= "Options_VkAddFriendsBtn",
	}
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Options_VkAddFriendsBtn.textId = "option_vkAddFriends"

UI.Options_VkAddFriendsBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "option_vkAddFriends" ),
	text		= UI:GetStringByName( "option_vkAddFriends_tooltipText" )
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_VkAddFriendsBtn:Reset()

	self:SetGray( true )

end


--
function UI.Options_VkAddFriendsBtn:Update()

	local bEnable = _G.MasterServer_IsConnected() and _G.VK_IsLoggedIn()
	self:SetGray( not bEnable )

end 

-- -----------------------------------------------------------------------
-- UI.Options_PtrServerWnd
-- -----------------------------------------------------------------------

UI.Options_PtrServerWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

--
UI.Options_PtrServerWnd.layers =
{
	MAIN_EFFECT		= 0,
	SERVER_STATUS	= 1,
	SYNC_STATUS		= 2,
	NEXT_SYNC_TIMER	= 3,
    WAIT_EFFECT		= 4,
}

--
UI.Options_PtrServerWnd.def =
{
	className	= "Wnd",
	prototype	= "Options_Account_SlotWnd",

	props =
	{
		name	= "Options_PtrServerWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.Options_PtrServerWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "options_ptrServer",
				defaultAnimation    = "sample",

				links =
				{     
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_11",
						layer		= "UI.Options_PtrServerWnd.layers.SERVER_STATUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text_1",
						layer		= "UI.Options_PtrServerWnd.layers.SYNC_STATUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn2",
						wnd			= "UI.Options_PtrServer_SyncBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text_12",
						layer		= "UI.Options_PtrServerWnd.layers.NEXT_SYNC_TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn5",
						layer		= "UI.Options_PtrServerWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SERVER_STATUS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- SYNC_STATUS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- NEXT_SYNC_TIMER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
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
			}}
		},
	},

	children = { "UI.Options_PtrServer_SyncBtn" }
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.Options_PtrServerWnd:Synchronize()

	if self:IsWaiting() then
		return
	end

	if not self:CanSync() then
		sys.log( "UI.Options_PtrServerWnd:Synchronize()[ERROR]: cannot cynchronize now" )
		return
	end

	if self.syncRequestId ~= 0 then
		return
	end

	self.syncRequestId = _G.MasterServer_RequestCreatePtrAccount()

	if self.syncRequestId == 0 then
		self:ShowMsgOnSyncError()
	end

	self:UpdateWaitingEffect()

end


--
function UI.Options_PtrServerWnd:MasterServer_OnPtrServerStatus( requestId, errcode, status )

	if errcode == 0 or errcode == self.REQUEST_SUCCESS_CODE then

    	if self:IsOnScreen() then

    		self.serverStatus = status

    		if type( status ) == "number" then

    			if UI:Val2Key( _G.MasterServer.ServerStatus, status ) == "" then
    				sys.log( "UI.Options_PtrServerWnd:MasterServer_OnPtrServerStatus()[ERROR]: invalid status; on of _G.MasterServer.ServerStatus vals expected, got %d", status )
    				self.serverStatus = -1
    			end

    		else
    			sys.log( "UI.Options_PtrServerWnd:MasterServer_OnPtrServerStatus()[ERROR]: invalid type of the 3-rd param (\"status\"); \"number\" expected, got \"%s\"", type( status ) )
    			self.serverStatus = -1
    		end

    		self:UpdateServerStatus()

	    	self:HideMsgOnRequestServerStatusError()

		end

	else

		-- когда уже не на экране, ошибка на запрос не показывается, т.к. игрок явным образом ничего не запрашивал
    	if self:IsOnScreen() then

    		if requestId == self.serverStatusRequestId then
    			self:ShowMsgOnRequestServerStatusError()
    		end

		end

	end

	if requestId == self.serverStatusRequestId then
		self.serverStatusRequestId = 0
	end

	if self.bWaitInitialServerStatusRequest then
		self.bWaitInitialServerStatusRequest = false
		self:UpdateWaitingEffect()
	end

end


--
function UI.Options_PtrServerWnd:MasterServer_OnPtrAccountStatus( requestId, errcode, status, nextSyncTime )

	if errcode == 0 or errcode == self.REQUEST_SUCCESS_CODE then

    	if self:IsOnScreen() then

    		self.syncStatus = status

    		if type( status ) == "number" then

    			if UI:Val2Key( _G.MasterServer.PtrAccountStatus, status ) == "" then
    				sys.log( "UI.Options_PtrServerWnd:MasterServer_OnPtrAccountStatus()[ERROR]: invalid status; on of _G.MasterServer.PtrAccountStatus vals expected, got %d", status )
    				self.syncStatus = -1
    			end

    		else
    			sys.log( "UI.Options_PtrServerWnd:MasterServer_OnPtrAccountStatus()[ERROR]: invalid type of the 3-rd param (\"status\"); \"number\" expected, got \"%s\"", type( status ) )
    			self.syncStatus = -1
    		end

    		self.nextSyncTime = nextSyncTime

    		if type( nextSyncTime ) ~= "userdata" then
    			sys.log( "UI.Options_PtrServerWnd:MasterServer_OnPtrAccountStatus()[ERROR]: invalid type of the 4-th param (\"nextSyncTime\"); \"userdata\" expected, got \"%s\"", type( nextSyncTime ) )
    			self.nextSyncTime = UI.INVALID_U64_ID
    		end

    		self:UpdateSyncStatus()
    		self:UpdateSyncBtn()
    		self:UpdateNextSyncTimer()

	    	self:HideMsgOnRequestSyncStatusError()

		end

	else

		-- когда уже не на экране, ошибка на запрос не показывается, т.к. игрок явным образом ничего не запрашивал
	    if self:IsOnScreen() then

    		if requestId == self.syncStatusRequestId then
    			self:ShowMsgOnRequestSyncStatusError()
    		end

		end

	end

	if requestId == self.syncStatusRequestId then
		self.syncStatusRequestId = 0
	end

	if self.bWaitInitialSyncStatusRequest then
		self.bWaitInitialSyncStatusRequest = false
		self:UpdateWaitingEffect()
	end

end


--
function UI.Options_PtrServerWnd:MasterServer_OnCreatePtrAccount( requestId, errcode, status, nextSyncTime )

	if errcode == 0 or errcode == self.REQUEST_SUCCESS_CODE then

    	if self:IsOnScreen() then

    		self.syncStatus = status

    		if type( status ) == "number" then

    			if UI:Val2Key( _G.MasterServer.PtrAccountStatus, status ) == "" then
    				sys.log( "UI.Options_PtrServerWnd:MasterServer_OnCreatePtrAccount()[ERROR]: invalid status; on of _G.MasterServer.PtrAccountStatus vals expected, got %d", status )
    				self.syncStatus = -1
    			end

    		else
    			sys.log( "UI.Options_PtrServerWnd:MasterServer_OnCreatePtrAccount()[ERROR]: invalid type of the 3-rd param (\"status\"); \"number\" expected, got \"%s\"", type( status ) )
    			self.syncStatus = -1
    		end

    		self.nextSyncTime = nextSyncTime

    		if type( nextSyncTime ) ~= "userdata" then
    			sys.log( "UI.Options_PtrServerWnd:MasterServer_OnCreatePtrAccount()[ERROR]: invalid type of the 4-th param (\"nextSyncTime\"); \"userdata\" expected, got \"%s\"", type( nextSyncTime ) )
    			self.nextSyncTime = UI.INVALID_U64_ID
    		end

			self:UpdateSyncStatus()
			self:UpdateSyncBtn()
			self:UpdateNextSyncTimer()

	    	self:HideMsgOnRequestSyncStatusError()

			if self.syncStatus == _G.MasterServer.PtrAccountStatus.PAS_COPYING then
				self.syncStatusRequestTimer = self.SYNC_STATUS_REQUEST_TIME
			end

		end

	else

		if requestId == self.syncRequestId then
			self:ShowMsgOnSyncError()
		end

	end

	if requestId == self.syncRequestId then
		self.syncRequestId = 0
		self:UpdateWaitingEffect()
	end

	if self.bWaitInitialSyncStatusRequest then
		self.bWaitInitialSyncStatusRequest = false
		self:UpdateWaitingEffect()
	end

end


--
function UI.Options_PtrServerWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

    self.serverStatusRequestId	= 0
    self.syncStatusRequestId	= 0
    self.syncRequestId			= 0

	self:UpdateWaitingEffect()

end


--
function UI.Options_PtrServerWnd:Reset()

	self.bWaitInitialServerStatusRequest	= false
	self.bWaitInitialSyncStatusRequest		= false
	self:UpdateWaitingEffect()

	self.serverStatus						= -1
	self.syncStatus							= -1
	self.nextSyncTime						= UI.INVALID_U64_ID
	self.nextSyncTimer						= -1
	self.serverStatusRequestTimer			= 0
	self.syncStatusRequestTimer				= -1

	self:SetText( "", self.layers.SERVER_STATUS ) 
	self:SetText( "", self.layers.SYNC_STATUS ) 
	self:SetText( "", self.layers.NEXT_SYNC_TIMER ) 

	UI.Options_PtrServer_SyncBtn:Enable( false )

	self:HideMsgOnRequestServerStatusError()
	self:HideMsgOnRequestSyncStatusError()

end


--
function UI.Options_PtrServerWnd:Update()

	self:Reset()

	self.bWaitInitialServerStatusRequest	= true
	self.bWaitInitialSyncStatusRequest		= true
	self:UpdateWaitingEffect()

	self:UpdateServerStatus()
	self:UpdateSyncStatus()
	self:UpdateSyncBtn()
	self:UpdateNextSyncTimer()

end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.Options_PtrServerWnd.effectInfo =
{
	main =
	{
		colorLocator_green	= "color_text_oline",
		colorLocator_red	= "color_text_offline",
		colorLocator_yellow	= "color_text_synchro",
	}
}

UI.Options_PtrServerWnd.strNextSyncTimer			= UI:GetStringByName( "options_ptrServer_nextSyncTimer" )
UI.Options_PtrServerWnd.SERVER_STATUS_REQUEST_TIME	= 10 * 60
UI.Options_PtrServerWnd.SYNC_STATUS_REQUEST_TIME	= 5 * 60
UI.Options_PtrServerWnd.REQUEST_SUCCESS_CODE		= 200		-- какое-то магическое число, обозначающее, наряду с 0, успешный реквест - см. #0046238, комм.(0203697)

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_PtrServerWnd.bWaitInitialServerStatusRequest	= false
UI.Options_PtrServerWnd.bWaitInitialSyncStatusRequest	= false
UI.Options_PtrServerWnd.serverStatusRequestId			= 0
UI.Options_PtrServerWnd.syncStatusRequestId				= 0
UI.Options_PtrServerWnd.syncRequestId					= 0
UI.Options_PtrServerWnd.serverStatus					= -1
UI.Options_PtrServerWnd.syncStatus						= -1
UI.Options_PtrServerWnd.nextSyncTime					= UI.INVALID_U64_ID
UI.Options_PtrServerWnd.nextSyncTimer					= -1
UI.Options_PtrServerWnd.color_green						= 0
UI.Options_PtrServerWnd.color_red						= 0
UI.Options_PtrServerWnd.color_yellow					= 0
UI.Options_PtrServerWnd.hMsgFailRequestServerStatus		= UI.INVALID_UI_HANDLE
UI.Options_PtrServerWnd.hMsgFailRequestSyncStatus		= UI.INVALID_UI_HANDLE
UI.Options_PtrServerWnd.serverStatusRequestTimer		= 0
UI.Options_PtrServerWnd.syncStatusRequestTimer			= -1

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_PtrServerWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.color_green	= mainEffect:GetObjColor( self.effectInfo.main.colorLocator_green )
		self.color_red		= mainEffect:GetObjColor( self.effectInfo.main.colorLocator_red )
		self.color_yellow	= mainEffect:GetObjColor( self.effectInfo.main.colorLocator_yellow )

	end

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.Options_PtrServerWnd:UpdateServerStatus()

	local str = UI:GetStringByName( "options_ptrServer_serverStatus" )

	local strStatus = "unknown"

	if self.serverStatus ~= -1 then

		local bOnline = self.serverStatus == _G.MasterServer.ServerStatus.SS_AVAILABLE

		local statusStrId = bOnline and "options_ptrServer_serverStatus_online" or "options_ptrServer_serverStatus_offline"
		strStatus = UI:GetStringByName( statusStrId )

		local statusColor = bOnline and self.color_green or self.color_red
		local baseColor = self:GetColor( self.layers.SERVER_STATUS ) 

		strStatus = string.format( "%s%s%s", UI:Color2Str( statusColor ), strStatus, UI:Color2Str( baseColor ) )

	else
		strStatus = "..."
	end

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$status%$", strStatus )
	if numSubst == 0 then
		sys.log( "UI.Options_PtrServerWnd:UpdateServerStatus()[ERROR]: cannot find placeholder \"$status$\" in string \"options_ptrServer_serverStatus\"" )
		str = string.format( "[INVALID STRING] Server status is %s", strStatus )
	end				

	self:SetText( str, self.layers.SERVER_STATUS )

end


--
function UI.Options_PtrServerWnd:UpdateSyncStatus()

	local strStatus		= "error"

	local baseColor 	= self:GetColor( self.layers.SYNC_STATUS ) 
	local statusColor	= baseColor

	if self.syncStatus == _G.MasterServer.PtrAccountStatus.PAS_NOT_COPIED then

		strStatus	= UI:GetStringByName( "options_ptrServer_syncStatus_not_copied" )
		statusColor	= self.color_red

	elseif self.syncStatus == _G.MasterServer.PtrAccountStatus.PAS_COPYING then

		strStatus	= UI:GetStringByName( "options_ptrServer_syncStatus_copying" )
		statusColor	= self.color_yellow

	elseif self.syncStatus == _G.MasterServer.PtrAccountStatus.PAS_COPIED then

		strStatus	= UI:GetStringByName( "options_ptrServer_syncStatus_copied" )
		statusColor	= self.color_green

	elseif self.syncStatus == _G.MasterServer.PtrAccountStatus.PAS_ERROR then

		sys.log( "UI.Options_PtrServerWnd:UpdateSyncStatus()[ERROR]: error sync status: %s", tostring( self.syncStatus ) )

	elseif self.syncStatus == -1 then

		if self.bWaitInitialSyncStatusRequest then
			strStatus = "..."
		else
			sys.log( "UI.Options_PtrServerWnd:UpdateSyncStatus()[ERROR]: invalid sync status: %s", tostring( self.syncStatus ) )
		end

	else

		sys.log( "UI.Options_PtrServerWnd:UpdateSyncStatus()[ERROR]: unhandled sync status: %s", tostring( self.syncStatus ) )

	end

	strStatus = string.format( "%s%s%s", UI:Color2Str( statusColor ), strStatus, UI:Color2Str( baseColor ) )

	local str = UI:GetStringByName( "options_ptrServer_syncStatus" )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$status%$", strStatus )
	if numSubst == 0 then
		sys.log( "UI.Options_PtrServerWnd:UpdateSyncStatus()[ERROR]: cannot find placeholder \"$status$\" in string \"options_ptrServer_syncStatus\"" )
		str = string.format( "[INVALID STRING] Sync status is %s", strStatus )
	end				

	self:SetText( str, self.layers.SYNC_STATUS )

end


--
function UI.Options_PtrServerWnd:UpdateSyncBtn()

	local bCanSync = self:CanSync()
	UI.Options_PtrServer_SyncBtn:Enable( bCanSync )

end


--
function UI.Options_PtrServerWnd:UpdateNextSyncTimer()

	local nextSyncTimer = -1

	if not self:CanSync() then

		if self.nextSyncTime ~= UI.INVALID_U64_ID and _G.GetU64Time() < self.nextSyncTime then

    		local curTime = _G.GetU64Time()

    		nextSyncTimer = ( self.nextSyncTime - curTime ).l * 0.001
    		nextSyncTimer = UI:Round( nextSyncTimer )

		end

	end

	if nextSyncTimer == self.nextSyncTimer then
		return
	end

	self.nextSyncTimer = nextSyncTimer

	local str = ""

	if nextSyncTimer ~= -1 then

		local strTime = UI:Time2Str44( nextSyncTimer )

		local numSubst = 0
		str, numSubst = string.gsub( self.strNextSyncTimer, "%$time%$", strTime )
    	if numSubst == 0 then
    		sys.log( "UI.Options_PtrServerWnd:UpdateNextSyncTimer()[ERROR]: cannot find placeholder \"$time$\" in string \"options_ptrServer_nextSyncTimer\"" )
    		str = string.format( "[INVALID STRING] Time left until next sync: %s", strTime )
    	end				

	end

	self:SetText( str, self.layers.NEXT_SYNC_TIMER )	

end


--
function UI.Options_PtrServerWnd:UpdateWaitingEffect()

	local bInitializing = self:IsWaiting()
	self:SetLayerVisible( bInitializing, self.layers.WAIT_EFFECT )

end


--
function UI.Options_PtrServerWnd:IsWaiting()

	return self.bWaitInitialServerStatusRequest or self.bWaitInitialSyncStatusRequest or self.syncRequestId ~= 0

end


--
function UI.Options_PtrServerWnd:RequestServerStatus()

	if self.serverStatusRequestId ~= 0 then
		return
	end

	self.serverStatusRequestId = _G.MasterServer_RequestPtrServerStatus()
	if self.serverStatusRequestId == 0 then

		self:ShowMsgOnRequestServerStatusError()

		self.bWaitInitialServerStatusRequest = false
		self:UpdateWaitingEffect()

	end

	if self.serverStatusRequestTimer ~= -1 then
		self.serverStatusRequestTimer = self.SERVER_STATUS_REQUEST_TIME
	end

end


--
function UI.Options_PtrServerWnd:RequestSyncStatus()

	if self.syncStatusRequestId ~= 0 then
		return
	end

	self.syncStatusRequestId = _G.MasterServer_RequestPtrAccountStatus()
	if self.syncStatusRequestId == 0 then

		self:ShowMsgOnRequestSyncStatusError()

		self.bWaitInitialSyncStatusRequest = false
		self:UpdateWaitingEffect()

	end

	if self.syncStatusRequestTimer ~= -1 then
		self.syncStatusRequestTimer = self.SYNC_STATUS_REQUEST_TIME
	end

end


--
function UI.Options_PtrServerWnd:CanSync()

	local bCanSync = false

	if self.syncStatus ~= -1 and self.syncStatus ~= _G.MasterServer.PtrAccountStatus.PAS_ERROR and self.syncStatus ~= _G.MasterServer.PtrAccountStatus.PAS_COPYING then

		if self.nextSyncTime ~= UI.INVALID_U64_ID and _G.GetU64Time() >= self.nextSyncTime then
			bCanSync = true
		end

	end

	return bCanSync

end


--
function UI.Options_PtrServerWnd:ShowMsgOnRequestServerStatusError()

	if self.hMsgFailRequestServerStatus == UI.INVALID_UI_HANDLE then
		self.hMsgFailRequestServerStatus = UI:ShowErrorMsg( "msg_failRequestPtrServerStatus" )

	end

end


--
function UI.Options_PtrServerWnd:HideMsgOnRequestServerStatusError()

	if self.hMsgFailRequestServerStatus ~= UI.INVALID_UI_HANDLE then

		UI:RemoveUiObj( self.hMsgFailRequestServerStatus )
		UI:Purge()

		self.hMsgFailRequestServerStatus = UI.INVALID_UI_HANDLE

	end

end


--
function UI.Options_PtrServerWnd:ShowMsgOnRequestSyncStatusError()

	if self.hMsgFailRequestSyncStatus == UI.INVALID_UI_HANDLE then
		self.hMsgFailRequestSyncStatus = UI:ShowErrorMsg( "msg_failRequestPtrSyncStatus" )
	end

end


--
function UI.Options_PtrServerWnd:HideMsgOnRequestSyncStatusError()

	if self.hMsgFailRequestSyncStatus ~= UI.INVALID_UI_HANDLE then

		UI:RemoveUiObj( self.hMsgFailRequestSyncStatus )
		UI:Purge()

		self.hMsgFailRequestSyncStatus = UI.INVALID_UI_HANDLE

	end

end


--
function UI.Options_PtrServerWnd:ShowMsgOnSyncError()

	UI:ShowErrorMsg( "msg_failPtrSync" )

end


--
function UI.Options_PtrServerWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgFailRequestServerStatus then  
		self.hMsgFailRequestServerStatus = UI.INVALID_UI_HANDLE
	
	elseif boxHandle == self.hMsgFailRequestSyncStatus then  
		self.hMsgFailRequestSyncStatus = UI.INVALID_UI_HANDLE
	end

end  


--
function UI.Options_PtrServerWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:HideMsgOnRequestServerStatusError()
		self:HideMsgOnRequestSyncStatusError()
	end

	self.hMsgFailRequestServerStatus	= UI.INVALID_UI_HANDLE
	self.hMsgFailRequestSyncStatus		= UI.INVALID_UI_HANDLE

end


--
function UI.Options_PtrServerWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateServerStatusRequestTimer( dt_sys )
	self:UpdateSyncStatusRequestTimer( dt_sys )

	self:UpdateSyncBtn()
	self:UpdateNextSyncTimer()

end


--
function UI.Options_PtrServerWnd:UpdateServerStatusRequestTimer( dt )

	if self.serverStatusRequestTimer ~= -1 then

		self.serverStatusRequestTimer = self.serverStatusRequestTimer - dt

		if self.serverStatusRequestTimer <= 0 then
			self:RequestServerStatus()
		end

	end

end


--
function UI.Options_PtrServerWnd:UpdateSyncStatusRequestTimer( dt )

	local bNeedRequest = self.syncStatus == _G.MasterServer.PtrAccountStatus.PAS_COPYING or self.syncStatus == -1

	if bNeedRequest and self.syncStatusRequestTimer == -1 then
		self.syncStatusRequestTimer = 0

	elseif not bNeedRequest and self.syncStatusRequestTimer ~= -1 then
		self.syncStatusRequestTimer = -1
	end

	if self.syncStatusRequestTimer ~= -1 then

		self.syncStatusRequestTimer = self.syncStatusRequestTimer - dt

		if self.syncStatusRequestTimer <= 0 then
			self:RequestSyncStatus()
		end

	end

end


--
function UI.Options_PtrServerWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.Options_PtrServerWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Options_PtrServerWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos()
	end

end


-- -----------------------------------------------------------------------
-- UI.Options_PtrServer_SyncBtn
-- -----------------------------------------------------------------------

UI.Options_PtrServer_SyncBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn6",

    	props =
    	{
    		name	= "Options_PtrServer_SyncBtn"
    	}
	},

	textId = "options_ptrServer_syncBtn"
}

-- -----------------------------------------------------------------------
-- UI.Options_ArcWnd
-- -----------------------------------------------------------------------

UI.Options_ArcWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

--
UI.Options_ArcWnd.layers =
{
	MAIN_EFFECT	= 0,
	SYNC_HEADER	= 1,
	WAIT_EFFECT	= 2,
}

--
UI.Options_ArcWnd.def =
{
	className	= "Wnd",
	prototype	= "Options_Account_SlotWnd",

	props =
	{
		name	= "Options_ArcWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.Options_ArcWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName				= "options_arc",
				defaultAnimation    = "sample",

				links =
				{     
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",
						layer		= "UI.Options_ArcWnd.layers.SYNC_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn2",
						wnd			= "UI.Options_Arc_ShowSyncBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn5",
						layer		= "UI.Options_ArcWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SYNC_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "options_arc_syncHeader" )
		},  

		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge",
				defaultAnimation	= "idle",
			}}
		},
	},

	children = { "UI.Options_Arc_ShowSyncBtn" }
}

-- ---------------------------------------
-- window definition
-- ---------------------------------------


--
function UI.Options_ArcWnd:OnShowSync()

	if not self:IsWaiting() then
		self:ShowSyncWnd()
	end

end


--
function UI.Options_ArcWnd:OnForgot()

	local language = UI:GetLanguage()
	local langDesc = _G.locale and _G.locale.languages and _G.locale.languages[ language ]

	local link = langDesc and langDesc.restorePasswordLink

	if link then
		_G.ShellExecute( link )
	else
		sys.log( "UI.Options_ArcWnd:OnForgot()[ERROR]: cannot find _G.locale.languages[%s].restorePasswordLink", language )
	end

end


--
function UI.Options_ArcWnd:OnSync()

	if self:IsWaiting() then
		return
	end

	self:Sync()
	self:HideSyncWnd()

end


--
function UI.Options_ArcWnd:OnSyncCancel()

	self:HideSyncWnd()

end


--
function UI.Options_ArcWnd:MasterServer_OnCheckYupPurchases( result, requestId, param1, param2 )

	if requestId == self.syncRequestId then

		if result ~= _G.MasterServer.AccountAttachResult.AAR_OK then
			self:ShowMsgOnSyncError( result )
		end

		self.syncRequestId = 0
		self:UpdateWaitingEffect()

	end

end


--
function UI.Options_ArcWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

    self.syncRequestId = 0
	self:UpdateWaitingEffect()

end


--
function UI.Options_ArcWnd:Reset()

	self:HideSyncWnd()

end


--
function UI.Options_ArcWnd:Update()
end


-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.Options_ArcWnd.syncRequestId = 0

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.Options_ArcWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:UpdateWaitingEffect()

end


--
function UI.Options_ArcWnd:ShowSyncWnd()

	UI.Root:AddChild( UI.Options_ArcSyncAccountWnd )

end


--
function UI.Options_ArcWnd:HideSyncWnd()

	UI.Options_ArcSyncAccountWnd:UnlinkFromParent()

end


--
function UI.Options_ArcWnd:UpdateWaitingEffect()

	self:SetLayerVisible( self:IsWaiting(), self.layers.WAIT_EFFECT )

end


--
function UI.Options_ArcWnd:IsWaiting()

	return self.syncRequestId ~= 0

end


--
function UI.Options_ArcWnd:Sync()

	if self:IsWaiting() then
		sys.log( "UI.Options_ArcWnd:Sync()[ERROR]: still waiting for another request" )
		return
	end

	if not UI.Options_ArcSyncAccountWnd:IsOnScreen() then
		sys.log( "UI.Options_ArcWnd:Sync()[ERROR]: no sync window" )
		return
	end

	local strLogin		= UI.Options_ArcSyncAccountWnd:GetLogin()
	local strPassword	= UI.Options_ArcSyncAccountWnd:GetPassword()

	self.syncRequestId = _G.MasterServer_CheckYupPurchases( strLogin, strPassword )

	if self.syncRequestId == 0 then
		self:ShowMsgOnSyncError( _G.MasterServer.AccountAttachResult.AAR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.Options_ArcWnd:ShowMsgOnSyncError( result )

	UI:ShowErrorMsg( "msg_checkYupPurchasesFail", result, "_G.MasterServer.AccountAttachResult" )

end


--
function UI.Options_ArcWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:HideSyncWnd()

end


--
function UI.Options_ArcWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.Options_ArcWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Options_ArcWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UpdatePos()
	end

end


-- -----------------------------------------------------------------------
-- UI.Options_Arc_ShowSyncBtn
-- -----------------------------------------------------------------------

UI.Options_Arc_ShowSyncBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn6",

    	props =
    	{
    		name	= "Options_Arc_ShowSyncBtn"
    	}
	},

	textId = "options_arc_syncBtn"
}

-- ------------------------------------------------------------------------
-- UI.Options_ArcSyncAccountWnd
-- ------------------------------------------------------------------------

UI.Options_ArcSyncAccountWnd = {}

-- ---------------------------------------------
-- window definition
-- ---------------------------------------------

UI.Options_ArcSyncAccountWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "Options_ArcSyncAccountWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
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
				defName				= "login_importAccount_main",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "bg",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.WORK_EFFECT",
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
				defName				= "blackBg",
				defaultAnimation    = "idle",
			}}
		},

    	-- WORK_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "login_importAccount_work",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.MSG",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "login_slot1",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.ACCOUNT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "login_slot2",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.PASSWORD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "forgot",
						wnd			= "UI.Options_ArcSyncAccount_ForgetBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.Options_ArcSyncAccount_SyncBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.Options_ArcSyncAccount_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
    	},

    	-- CAPTION
    	{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_NOCLIP + FONT.TF_SINGLELINE,
   			font =
    		{
				fontName = "Small", 
   			},
			text = UI:GetStringByName( "options_arcSync_caption" ),
    	}, 

    	-- MSG
    	{
   			layerType	= UI.LAYER_TEXT,

   			formatInfoSz= { 1, 1 },
   			formatFlags	= FONT.TF_WORDBREAK,
   			font =
    		{
				fontName = "Small", 
   			},
			text = UI:GetStringByName( "options_arcSync_msg" ),
    	}, 

		-- ACCOUNT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "login_inputSlot",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "name",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.ACCOUNT_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "login_input",
						wnd			= "UI.Options_ArcSyncAccount_AccountEditWnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- ACCOUNT_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^login_accountLabel",
		}, 

		-- PASSWORD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "login_inputSlot",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "name",
						layer		= "UI.Options_ArcSyncAccountWnd.layers.PASSWORD_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "login_input",
						wnd			= "UI.Options_ArcSyncAccount_PasswordEditWnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		}, 

		-- PASSWORD_LABEL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^login_passwordLabel",
		}, 
	},

	children =
	{
		"UI.Options_ArcSyncAccount_AccountEditWnd",
		"UI.Options_ArcSyncAccount_PasswordEditWnd",
		"UI.Options_ArcSyncAccount_ForgetBtn",
		"UI.Options_ArcSyncAccount_SyncBtn",
		"UI.Options_ArcSyncAccount_CancelBtn",
	}
}

-- --------------------------------------
-- interface functions
-- --------------------------------------

--
function UI.Options_ArcSyncAccountWnd:GetLogin()

	return UI.Options_ArcSyncAccount_AccountEditWnd:GetEditText()

end


--
function UI.Options_ArcSyncAccountWnd:GetPassword()

	return UI.Options_ArcSyncAccount_PasswordEditWnd:GetEditText()

end


-- --------------------------------------
-- const
-- --------------------------------------

UI.Options_ArcSyncAccountWnd.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
    WORK_EFFECT			= 2,
    CAPTION				= 3,
    MSG					= 4,
    ACCOUNT_EFFECT		= 5,
    ACCOUNT_LABEL		= 6,
    PASSWORD_EFFECT		= 7,
    PASSWORD_LABEL		= 8,
}

UI.Options_ArcSyncAccountWnd.IS_FULL_SCREEN = true

-- --------------------------------------
-- work functions
-- --------------------------------------

--
function UI.Options_ArcSyncAccountWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_EDIT_CHANGE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )

end


--
function UI.Options_ArcSyncAccountWnd:Reset()

	UI.Options_ArcSyncAccount_AccountEditWnd:SetEditText( "" )
	UI.Options_ArcSyncAccount_PasswordEditWnd:SetEditText( "" )

	UI.Options_ArcSyncAccount_SyncBtn:Enable( false )

end


--
function UI.Options_ArcSyncAccountWnd:FullUpdate()

	self:Reset()

	self:UpdateSyncBtnState()	

end


--
function UI.Options_ArcSyncAccountWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key ~= UI.Keys.KEY_TAB then
    	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
    		return true
    	end
	end
		
	return self:HandleKey( key, -2 )	

end


--
function UI.Options_ArcSyncAccountWnd:OnTab()

	return false
	
end


--
function UI.Options_ArcSyncAccountWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.Options_ArcSyncAccountWnd:F_OnEventEditChange( hSender, eventSrc )

	if not self:IsOnScreen() then
		return
	end

	if hSender ~= UI.Options_ArcSyncAccount_AccountEditWnd:GetUiHandle() and hSender ~= UI.Options_ArcSyncAccount_PasswordEditWnd:GetUiHandle() then
		return
	end

	self:UpdateSyncBtnState()

end


--
function UI.Options_ArcSyncAccountWnd:UpdateSyncBtnState()

	local strLogin		= UI.Options_ArcSyncAccount_AccountEditWnd:GetEditText()
	local strPassword	= UI.Options_ArcSyncAccount_PasswordEditWnd:GetEditText()

	local bEnable = strLogin ~= "" and strPassword ~= ""
	UI.Options_ArcSyncAccount_SyncBtn:Enable( bEnable )

end


--
function UI.Options_ArcSyncAccountWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if w == UI.Options_ArcSyncAccount_ForgetBtn then
		UI.Options_ArcWnd:OnForgot()

	elseif w == UI.Options_ArcSyncAccount_SyncBtn then
		UI.Options_ArcWnd:OnSync()

	elseif w == UI.Options_ArcSyncAccount_CancelBtn then
		UI.Options_ArcWnd:OnSyncCancel()
	end

	return true

end


--
function UI.Options_ArcSyncAccountWnd:OnEscape()

	UI.Options_ArcWnd:OnSyncCancel()
	return true

end


--
function UI.Options_ArcSyncAccountWnd:F_OnEventSaveUiState()

	self:UnlinkFromParent()	

end


-- ------------------------------------------------------------------------
-- UI.Options_ArcSyncAccount_ForgetBtn
-- ------------------------------------------------------------------------

UI.Options_ArcSyncAccount_ForgetBtn =
{
    def =
    {
    	className 	= "ButtonWnd",
    	prototype	= "Login_Btn",

    	props =
    	{
    		name			= "Options_ArcSyncAccount_ForgetBtn",
    	},
	},

	textId = "login_btnForget",
}

-- ------------------------------------------------------------------------
-- UI.Options_ArcSyncAccount_AccountEditWnd, UI.Options_ArcSyncAccount_PasswordEditWnd
-- ------------------------------------------------------------------------

--
UI.Options_ArcSyncAccount_AccountEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "Login_EditWnd",

     	props =
     	{
     		name		= "Options_ArcSyncAccount_AccountEditWnd",
    		symbolsLimit= 123,
    	}
    }
}


--
UI.Options_ArcSyncAccount_PasswordEditWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "Login_EditWnd",

     	props =
     	{
     		name			= "Options_ArcSyncAccount_PasswordEditWnd",
			editStyle		= UI.ES_SELECT_ON_FOCUS + UI.ES_AUTOSCROLL + UI.ES_PASS,
    		symbolsLimit	= 127,
    	}
    }
}

-- ------------------------------------------------------------------------
-- UI.Options_ArcSyncAccount_SyncBtn
-- ------------------------------------------------------------------------

UI.Options_ArcSyncAccount_SyncBtn =
{
    def =
    {
    	className 	= "ButtonWnd",
    	prototype	= "Login_ImportAccount_Btn",

    	props =
    	{
    		name			= "Options_ArcSyncAccount_SyncBtn",
    	},
	},

	textId = "options_arcSync_syncBtn",
}

-- ------------------------------------------------------------------------
-- UI.Options_ArcSyncAccount_CancelBtn
-- ------------------------------------------------------------------------

UI.Options_ArcSyncAccount_CancelBtn =
{
    def =
    {
    	className 	= "ButtonWnd",
    	prototype	= "Login_ImportAccount_Btn",

    	props =
    	{
    		name			= "Options_ArcSyncAccount_CancelBtn",
    	},
	},

	textId = "login_arcImport_cancelBtn",
}