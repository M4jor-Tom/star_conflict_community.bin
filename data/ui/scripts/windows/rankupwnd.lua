
UI.RankUpWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.RankUpWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "RankUpWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "rankUp_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "lvl_up_2",
						layer		= "UI.RankUpWnd.layers.WORK_EFFECT",
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
				defName 			= "rankUp_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "lvl_up",
						layer		= "UI.RankUpWnd.layers.RANK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "text",
						layer		= "UI.RankUpWnd.layers.INFO_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "btn",
						wnd			= "UI.RankUp_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "tn_x",
						wnd			= "UI.RankUp_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- RANK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "rankUp_rank",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "etext_name",
						layer		= "UI.RankUpWnd.layers.RANK_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- RANK_TEXT
		{
			layerType		= UI.LAYER_ETEXT,
			formatFlags	 	= FONT.TF_SINGLELINE,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },

			spriteName			= "etext_name_sprite",
			spriteEffectLayer	= "UI.RankUpWnd.layers.RANK_EFFECT",
		},
		
		-- INFO_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_WORDBREAK,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			
			text			= UI:GetStringByName( "rankUp_info" ),
		},
	},
	
	children = { "UI.RankUp_CrossBtn", "UI.RankUp_CloseBtn" }
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.RankUpWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if result ~= 0 then
		return
	end

	self:ShowRank( accountRank )
	
end

-- -----------------------------------
-- const
-- -----------------------------------

UI.RankUpWnd.layers =
{
	MAIN_EFFECT		= 0,
	WORK_EFFECT		= 1,
	RANK_EFFECT		= 2,
	RANK_TEXT		= 3,
	INFO_TEXT		= 4,
}

UI.RankUpWnd.effectInfo =
{
	work =
	{
		bgSpriteName	= "objectName331",
	}
}

UI.RankUpWnd.incompatibleWindows =
{
	"LoginWnd",
	"LoadingScreen_game",
	"LoadingScreen_sys",
	"EffectTreePreviewWnd",
	"HudWnd",
}

UI.RankUpWnd.sounds =
{
	showRank = "sound/ui/rank_up"
}

UI.RankUpWnd.IS_FULL_SCREEN	= true

-- -----------------------------------
-- vars
-- -----------------------------------

UI.RankUpWnd.curRank	= -1
UI.RankUpWnd.queue		= {}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.RankUpWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	
	self:UpdateBgTexture()

end


--
function UI.RankUpWnd:Reset()

	self:ResetCurRank()
	self.queue = {}
	self:Hide()

end


--
function UI.RankUpWnd:ResetCurRank()

	self:SetText( "", self.layers.RANK_TEXT )

	self.curRank = -1

end


--
function UI.RankUpWnd:ShowRank( rank )

	if self:CanShowNewRank() then
		self:ShowRankInternal( rank )
	else
		self:EnqueueRank( rank )
	end

end


--
function UI.RankUpWnd:CanShowNewRank()

	if next( self.queue ) then
		return false
	end

	if self.curRank ~= -1 then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	return true

end


--
function UI.RankUpWnd:CanShowRankFromQueue()

	if not next( self.queue ) then
		sys.log( "UI.RankUpWnd:CanShowRankFromQueue()[ERROR]: empty queue" )
		return false
	end

	if self.curRank ~= -1 then
		return false
	end

	if not self:IsCompatibleEnvironment() then
		return false
	end

	return true

end


--
function UI.RankUpWnd:IsCompatibleEnvironment()

	for idx, wndName in pairs( self.incompatibleWindows ) do
		local wnd = UI[ wndName ]
		if wnd and wnd:IsOnScreen() then
			return false
		end
	end

	if UI.HangarWnd and UI.HangarWnd.w and UI.HangarWnd:IsOnScreen() then
		return true
	end

	return false

end


--
function UI.RankUpWnd:ShowRankInternal( rank )

	self:ResetCurRank()

	self:Show()
	
	local rankEffect = UI:GetEffectFromLayer( self, self.layers.RANK_EFFECT )
	if rankEffect then
		rankEffect:RestartAnimation()
	end

	self.curRank = rank
	self:UpdateForCurRank()

	UI:PlayGlobalSound( self.sounds.showRank )

end


--
function UI.RankUpWnd:EnqueueRank( rank )

	table.insert( self.queue, rank )

end


--
function UI.RankUpWnd:CheckQueue()

	if not next( self.queue ) then
		return false
	end

	if not self:CanShowRankFromQueue() then
		return false
	end

	local rank = table.remove( self.queue, 1 )
	self:ShowRankInternal( rank )

	return true

end


--
function UI.RankUpWnd:TryHide()

	if not self:IsOnScreen() then
		return
	end

	self:ResetCurRank()

	self:CheckQueue()	

	if self.curRank == -1 then
		self:Hide()
	end

end


--
function UI.RankUpWnd:UpdateForCurRank()

	local str = UI:GetStringByName( "rankUpNotify" )
	
	local numSubst = 0	
	str, numSubst = string.gsub( str, "%$rank%$", tostring( self.curRank ) )
	
	if numSubst == 0 then
		sys.log( "UI.RankUpWnd:UpdateForCurRank()[ERROR]: cannot find placeholder \"$rank$\" in string \"rankUpNotify\"" )
		str = string.format( "[INVALID STRING] Rank %d achieved", self.curRank )
	end
	
	self:SetText( str, self.layers.RANK_TEXT )
	
end


--
function UI.RankUpWnd:Show()

	UI.Root:AddChild( self )

end


--
function UI.RankUpWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.RankUpWnd:F_OnEventWndHided( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.RankUpWnd:F_OnEventWndShown( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then
		self:UpdateVisibility()
	end

end


--
function UI.RankUpWnd:UpdateVisibility()

	local bNeedVisible = false

	if self.curRank ~= -1 then
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


-- вызывается из UI.HangarWnd, нет собственной подписки
function UI.RankUpWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end


--
function UI.RankUpWnd:F_OnEventSaveUiState()

	UI.store.RankUpWnd =
	{
		curRank	= self.curRank,
		queue	= self.queue,
	}

end


--
function UI.RankUpWnd:F_OnEventRestoreUiState()

	if UI.store.RankUpWnd then
	
		self.curRank	= UI.store.RankUpWnd.curRank
		self.queue		= UI.store.RankUpWnd.queue

		if self.curRank ~= -1 then
			self:UpdateForCurRank()
		end

		self:UpdateVisibility()

		UI.store.RankUpWnd = nil

	end

end


--
function UI.RankUpWnd:UpdateBgTexture()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetSpriteTexture( self.effectInfo.work.bgSpriteName, UI:GetTex( "rankUp_bg" ) )
	end

end


--
function UI.RankUpWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput ) 
	
	if wnd == UI.RankUp_CrossBtn then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:TryHide()
		
	elseif wnd == UI.RankUp_CloseBtn then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:TryHide()
	end
	
	return true

end


-- ------------------------------------------------------------------------------
-- RankUp_CrossBtn
-- ------------------------------------------------------------------------------

UI.RankUp_CrossBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "CrossBtn3_720",
	
		props =
		{
			name = "RankUp_CrossBtn"
		}
	}
}


-- ------------------------------------------------------------------------------
-- RankUp_CloseBtn
-- ------------------------------------------------------------------------------

UI.RankUp_CloseBtn =
{
	def =
	{
		className 	= "ButtonWnd",
		prototype	= "TextBtn3",
	
		props =
		{
			name = "RankUp_CloseBtn"
		}
	},
	
	textId = "close"
}