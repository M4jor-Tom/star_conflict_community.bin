-- ----------------------------------------------------------------------------
--
-- Workfile: achievementwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.AchievementWnd = {}
local aw = UI.AchievementWnd

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.AchievementWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "AchievementWnd",
		style			= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,	-- умышленно нет стиля WS_UPDATE_IF_VISIBLE, т.к. подписка на EV_NEW_FRAME производится вручную
		rectAbs			= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "achievement_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "acheiv",	
						layer		= "UI.AchievementWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "achievement_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "etext_name",	
						layer		= "UI.AchievementWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "etext_info",	
						layer		= "UI.AchievementWnd.layers.INFO",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_ETEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			spriteName			= "etext_name_sprite",
			spriteEffectLayer	= "UI.AchievementWnd.layers.WORK_EFFECT",
		}, 

		-- INFO
		{
			layerType		= UI.LAYER_ETEXT,

   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },

			spriteName			= "etext_info_sprite",
			spriteEffectLayer	= "UI.AchievementWnd.layers.WORK_EFFECT",
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.AchievementWnd:MasterServer_OnNotification( notification, params )

	if notification ~= _G.MasterServer.ServerNotification.SN_ACHIEVEMENT_UNLOCKED then
		return
	end

	self:OnAchievementUnlocked( params )

end


-- -----------------------------------
-- const
-- -----------------------------------

aw.layers =
{
    MAIN_EFFECT		= 0,
    WORK_EFFECT		= 1,
    NAME			= 2,
    INFO			= 3,
}

aw.modes =
{
	HANGAR	= 1,
	HUD		= 2,
}

aw.effectInfo =
{
	work =
	{
		icoSpriteName	= "ico",

		animByMode		=
		{		
			[ aw.modes.HANGAR ]	= "idle",
			[ aw.modes.HUD ]	= "idle_2",
		}
	}
}

aw.incompatibleWindows =
{
	"LoginWnd",
	"LoadingScreen_game",
	"LoadingScreen_sys",
	"EffectTreePreviewWnd",
	"ExpUpWnd",
	"PveMissionLevelWowWnd",
}

aw.sounds =
{
	showAchievement = "sound/ui/achievement"
}

aw.DELAY_TIME = 1	-- т.к. ачивменты часто даются одновременно с такими собятиями в игре, как взрыв, задержка необходима для того, чтобы был лучше слышен звук (см. #0022399)

-- -----------------------------------
-- vars
-- -----------------------------------

aw.curAchvData	= { achvId = -1, rank = 0 }
aw.queue		= {}
aw.mode			= -1
aw.delayTimer	= -1

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.AchievementWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_HUD_MODE_CHANGED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.AchievementWnd:Reset()

	self:ResetCurAchievement()
	self.queue = {}
	self:Hide()
	self.delayTimer = -1

end


--
function UI.AchievementWnd:ResetCurAchievement()

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.INFO )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetSpriteTexture( self.effectInfo.work.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self.curAchvData = { achvId = -1, rank = 0 }
	self.mode = -1

end


--
function UI.AchievementWnd:OnAchievementUnlocked( params )

	if type( params ) ~= "table" then
		sys.log( "UI.AchievementWnd:OnAchievementUnlocked()[ERROR]: invalid type of the 1-st param (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
		return
	end

	if type( params.achievementId ) ~= "number" then
		sys.log( "UI.AchievementWnd:OnAchievementUnlocked()[ERROR]: invalid type of the \"achievementId\"; \"number\" expected, got \"%s\"", type( params.achievementId ) )
		return
	end

	if type( params.rank ) ~= "number" then
		sys.log( "UI.AchievementWnd:OnAchievementUnlocked()[ERROR]: invalid type of the \"rank\"; \"number\" expected, got \"%s\"", type( params.rank ) )
		return
	end

	self.delayTimer = self.DELAY_TIME
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )

	local data =
	{
		achvId	= params.achievementId,
		rank	= params.rank
	}

	self:ShowAchievement( data )

end


--
function UI.AchievementWnd:ShowAchievement( params )

	if self:CanShowNewAchievement() then
		self:ShowAchievementInternal( params )
	else
		self:EnqueueAchievement( params )
	end

end


--
function UI.AchievementWnd:CanShowNewAchievement()

	if next( self.queue ) then
		return false
	end

	if self.curAchvData.achvId ~= -1 then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	if self.delayTimer ~= -1 then
		return false
	end

	return true

end


--
function UI.AchievementWnd:CanShowAchievementFromQueue()

	if not next( self.queue ) then
		sys.log( "UI.AchievementWnd:CanShowAchievementFromQueue()[ERROR]: empty queue" )
		return false
	end

	if self.curAchvData.achvId ~= -1 then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	return true

end


--
function UI.AchievementWnd:IsCompatibleEnvironment()

	for idx, wndName in pairs( self.incompatibleWindows ) do
		local wnd = UI[ wndName ]
		if wnd and wnd:IsOnScreen() then
			return false
		end
	end

	if UI.HangarWnd and UI.HangarWnd.w and UI.HangarWnd:IsOnScreen() then
		return true
	end

	if UI.HudWnd and UI.HudWnd.w and UI.HudWnd:IsOnScreen() and UI.HudWnd:GetMode() ~= UI.HudWnd.modes.USER_HIDE then
		return true
	end

	return false

end


--
function UI.AchievementWnd:ShowAchievementInternal( data )

	self:ResetCurAchievement()

	self:Show()

	self.mode = self:DetectMode()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		local anim = self.effectInfo.work.animByMode[ self.mode ] or self.effectInfo.work.animByMode[ self.modes.HANGAR ]
		workEffect:StartAnimation( anim )
	end

	self.curAchvData = data
	self:UpdateForCurAchievement()

	self.delayTimer = -1

	UI:PlayGlobalSound( self.sounds.showAchievement )

end


--
function UI.AchievementWnd:EnqueueAchievement( data )

	table.insert( self.queue, data )

end


--
function UI.AchievementWnd:CheckQueue()

	if not next( self.queue ) then
		return false
	end

	if not self:CanShowAchievementFromQueue() then
		return false
	end

	local data = table.remove( self.queue, 1 )
	self:ShowAchievementInternal( data )

	return true

end


--
function UI.AchievementWnd:F_OnEffectAnimationEnded( effect, animName )

	self:ResetCurAchievement()

	self:CheckQueue()	

	if self.curAchvData.achvId == -1 then
		self:Hide()
	end

end


--
function UI.AchievementWnd:UpdateForCurAchievement()

	local strName = UI:Achievement2Str( self.curAchvData.achvId, self.curAchvData.rank, true )
	strName = string.format( "\"%s\"", strName )
	self:SetText( strName, self.layers.NAME )

	local strInfo = UI:GetAchievementConditionStr( self.curAchvData.achvId, self.curAchvData.rank )
	self:SetText( strInfo, self.layers.INFO )	

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		local hTex = UI:GetAchievementIco( self.curAchvData.achvId, self.curAchvData.rank )
		workEffect:SetSpriteTexture( self.effectInfo.work.icoSpriteName, hTex )
	end

end


--
function UI.AchievementWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.AchievementWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.AchievementWnd:F_OnEventWndHided( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.AchievementWnd:F_OnEventWndShown( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.AchievementWnd:F_OnEventHudModeChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:UpdateVisibility()

end


--
function UI.AchievementWnd:UpdateVisibility()

	local bNeedVisible = false

	if self.curAchvData.achvId ~= -1 then
		bNeedVisible = self:IsCompatibleEnvironment()

	elseif self:CheckQueue() then
		bNeedVisible = true
	end

	local bVisible = self:IsOnScreen()

	if bVisible and not bNeedVisible then
		self:Hide()
	elseif not bVisible and bNeedVisible then
		self:Show()
	end

end


-- вызывается из UI.Root, нет собственной подписки
function UI.AchievementWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end


--
function UI.AchievementWnd:F_OnEventSaveUiState()

	UI.store.AchievementWnd =
	{
		curAchvData	= self.curAchvData,
		queue		= self.queue,
	}

end


--
function UI.AchievementWnd:F_OnEventRestoreUiState()

	if UI.store.AchievementWnd then
	
		self.curAchvData	= UI.store.AchievementWnd.curAchvData
		self.queue			= UI.store.AchievementWnd.queue

		if self.curAchvData.achvId ~= -1 then
			self:UpdateForCurAchievement()
		end

		self:UpdateVisibility()

		UI.store.AchievementWnd = nil

	end

end


--
function UI.AchievementWnd:DetectMode()

	if UI.HangarWnd and UI.HangarWnd:IsOnScreen() then
		return self.modes.HANGAR

	elseif UI.HudWnd and UI.HudWnd:IsOnScreen() then
		return self.modes.HUD

	else
		sys.log( "UI.AchievementWnd:DetectMode()[ERROR]: invalid mode" )
		return -1
	end

end


--
function UI.AchievementWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateDelayTimer( dt_sys )

end


--
function UI.AchievementWnd:UpdateDelayTimer( dt )

	if self.delayTimer ~= -1 then
    	self.delayTimer = self.delayTimer - dt
    	if self.delayTimer <= 0 then

    		self.delayTimer = -1
    		self:CheckQueue()
    		
    	end
	end

	if self.delayTimer == -1 and not self:IsOnScreen() then
    	UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )
    end

end


--
function UI.AchievementWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )

end


--
function UI.AchievementWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() then
		if self.delayTimer == -1 then
			UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_NEW_FRAME )
		end
	end

end