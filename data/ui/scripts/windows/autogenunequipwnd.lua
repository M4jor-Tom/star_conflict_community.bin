-- ---------------------------------------------------------------------------
-- UI.AutogenUnequipWnd
-- ---------------------------------------------------------------------------

UI.AutogenUnequipWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

--
UI.AutogenUnequipWnd.layers =
{
	MAIN_EFFECT	= 0,
	BG_EFFECT	= 1,
	WORK_EFFECT	= 2,
	CAPTION		= 3,
	MSG			= 4,
	WAIT_EFFECT	= 5,
	WAIT_TEXT	= 6,
}

--
UI.AutogenUnequipWnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "AutogenUnequipWnd",
	},

	layers =
	{
		firstOverlayLayer = UI.AutogenUnequipWnd.layers.WAIT_EFFECT,
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "buy_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.AutogenUnequipWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.AutogenUnequipWnd.layers.WORK_EFFECT",
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
				defName 			= "buy_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.AutogenUnequipWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "description",
						layer		= "UI.AutogenUnequipWnd.layers.MSG",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "button_2",
						wnd			= "UI.AutogenUnequip_CancelBtn",
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
			text			= UI:GetStringByName( "autogenUnequip_caption" ),
		},
	
		-- MSG
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
			formatFlags		= FONT.TF_WORDBREAK,
			formatInfoSz	= { 3, 1 },
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
						layer		= "UI.AutogenUnequipWnd.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- WAIT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small", },
			text			= "^hangar_loading",
		}, 
	},
	
	children =
	{
		"UI.AutogenUnequip_DestroyBtn",
		"UI.AutogenUnequip_DismantleBtn",
		"UI.AutogenUnequip_CancelBtn",
	}
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.AutogenUnequipWnd:Setup( items, cancelMode, mainWndName, customData )
	
	if type( items ) ~= "table" then
		sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: invalid type of the 1-st param ('items'); 'table' expected, got '%s'", type( items ) )
		return
	end
	
	if not next( items ) then
		sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: empty table 'items'" )
		return
	end
	
	for itemIdx, item in pairs( items ) do
	
		if type( itemIdx ) ~= "number" or type( item ) ~= "table" then
			sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: invalid format of 'items'; <number>=<table> expected, got <%s>=<%s>", type( itemIdx ), type( item ) )
			return
		end
		
		if type( item.iid ) ~= "userdata" then
			sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: invalid type of 'iid' in item %d; 'userdata' expected, got '%s'", itemIdx, type( item.iid ) )
			return
		end
		
		if type( item.actions ) ~= "number" then
			sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: invalid type of 'actions' in item %d; 'number' expected, got '%s'", itemIdx, type( item.actions ) )
			return
		end
		
		if not UI:GetAutogenInventoryItem( item.iid ) then
			sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: iid %s is not autogen", _G.U64ToStr( item.iid ) )
			return
		end
		
		if not UI:GetEquippedShipItem( item.iid ) then
			sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: item %s is not equipped", _G.U64ToStr( item.iid ) )
			return
		end
	
	end
	
	if type( cancelMode ) ~= "number" then
		sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: invalid type of the 2-nd param ('cancelMode'); 'number' expected, got '%s'", type( cancelMode ) )
		return
	end
	
	if UI:Val2Key( self.cancelModes, cancelMode ) == "" then
		sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: invalid 'cancelMode' (%d)", cancelModes )
		return
	end
	
	if type( mainWndName ) ~= "string" then
		sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: invalid type of the 3-rd param ('mainWndName'); 'string' expected, got '%s'", type( mainWndName ) )
		return
	end
	
	if mainWndName == "" then
		sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: empty 'mainWndName'" )
		return
	end
	
	if self.mainWndName ~= "" and self.mainWndName ~= mainWndName and self:IsOnScreen() then
		sys.log( "UI.AutogenUnequipWnd:Setup()[ERROR]: already have another main window" )
		return
	end
	
	self:Reset()
	
	self.items			= UI:CopyTable2( items )
	self.cancelMode		= cancelMode
	self.mainWndName	= mainWndName
	self.customData		= customData
	
	for itemIdx, item in pairs( items ) do
		item.result = self.itemResults.NOT_HANDLED
	end
	
	self.curItemIdx = 1
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end
	
end


--
function UI.AutogenUnequipWnd:GetMainWndName()

	return self.mainWndName

end


--
function UI.AutogenUnequipWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.requestId = 0
	self.isRequestOld = false

end


--
function UI.AutogenUnequipWnd:GameStore_OnAutogenDestroy( result, requestId, params )

	if result == _G.GameStore.ModuleEquipResult.MER_OK then
		
		if self:IsOnScreen() and requestId == self.requestId and not self.isRequestOld then -- если self.isRequestOld значит это реквест с прошлого показа окна и на него не надо реагировать, кроме показа ошибки
			
			local curIid = self:GetCurIid()
			local requestedIid = params.autogenItem.iid
			
			if curIid == requestedIid then
			
				self.items[ self.curItemIdx ].result = self.itemResults.DESTROYED
				self:ProceedToNextItem()
				
			else
			
				-- что-то пошло не так, такого не должно быть
				sys.log( "UI.AutogenUnequipWnd:GameStore_OnAutogenDestroy()[ERROR]: mismatched iids" )
				self:OnError( self.actions.DESTROY, _G.GameStore.ModuleEquipResult.MER_ERROR, false )
				
			end
			
		end
	
	else
	
		if requestId == self.requestId then
			self:OnError( self.actions.DESTROY, result, self.isRequestOld )
		end
		
	end

	if requestId == self.requestId then
		self.requestId = 0
		self.isRequestOld = false
		self:UpdateWaitingEffect()
	end

end


--
function UI.AutogenUnequipWnd:GameStore_OnAutogenDismantle( result, requestId, params )

	if result == _G.GameStore.ModuleEquipResult.MER_OK then
		
		if self:IsOnScreen() and requestId == self.requestId and not self.isRequestOld then -- если self.isRequestOld значит это реквест с прошлого показа окна и на него не надо реагировать, кроме показа ошибки
			
			local curIid = self:GetCurIid()
			local requestedIid = params.iid
			
			if curIid == requestedIid then
			
				self.items[ self.curItemIdx ].result = self.itemResults.DISMANTLED
				self:ProceedToNextItem()
				
			else
				-- что-то пошло не так, такого не должно быть
				sys.log( "UI.AutogenUnequipWnd:GameStore_OnAutogenDismantle()[ERROR]: mismatched iids" )
				self:OnError( self.actions.DISMNANTLE, _G.GameStore.ModuleEquipResult.MER_ERROR, false )
			end
			
		end
	
	else
	
		if requestId == self.requestId then
			self:OnError( self.actions.DISMNANTLE, result, self.isRequestOld )
		end
		
	end

	if requestId == self.requestId then
		self.requestId = 0
		self.isRequestOld = false
		self:UpdateWaitingEffect()
	end

end


--
function UI.AutogenUnequipWnd:OnBuyWndResult( result, mode, data )
	
	if mode == UI.BuyWnd.modes.AUTOGEN_DISMANTLE then
	
		if result and self:IsOnScreen() then
		
			if data.iid == self:GetCurIid() then
				self:DoDismantle()
			else
				sys.log( "UI.AutogenUnequipWnd:OnBuyWndResult()[ERROR]: mismatching iids" )
			end
			
		end
	
	else
		sys.log( "UI.AutogenUnequipWnd:OnBuyWndResult()[ERROR]: unhandled mode %d", mode )
	end
	
end


--
function UI.AutogenUnequipWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.AutogenUnequip_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end  


-- ---------------------------------------
-- const
-- ---------------------------------------

-- что делать если игрок нажал cancel или произошла ошибка
UI.AutogenUnequipWnd.cancelModes =
{
	CONTINUE	= 1,	-- при отмене - переход к следующему модулю, при ошибке остемся на текущем модуле
	BREAK		= 2,	-- при отмене - возврат в вызывающее окно, при ошибке возврат в вызывающее окно
}

UI.AutogenUnequipWnd.defaultCancelMode = UI.AutogenUnequipWnd.cancelModes.BREAK

-- После закрытия в вызывающее окно передается таблица с описанием действий, которые были сделаны с каждым модулем
UI.AutogenUnequipWnd.itemResults =
{
	DESTROYED			= 1,	-- снят и уничтожен
	DISMANTLED			= 2,	-- снят и сохранен
	CANCELLED			= 3,	-- отмена пользователем снятия
	NOT_HANDLED			= 4,	-- очередь не дошла
	ERROR				= 5,	-- ошибка при снятии
	WAITING_DESTROY		= 6,	-- окно закрыли в момент ожидания ответа сервера
	WAITING_DISAMANTLE	= 7,	-- окно закрыли в момент ожидания ответа сервера
}

-- Внимании! При добавлении учитывать, что значение должно быть степенью двойки
UI.AutogenUnequipWnd.actions =
{
	DESTROY		= 1,
	DISMNANTLE	= 2,
}

UI.AutogenUnequipWnd.effectInfo =
{
	work =
	{
		btnLocators	= { "button_1", "button_4" },	-- справа налево
	}
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.AutogenUnequipWnd.items			= {}
UI.AutogenUnequipWnd.cancelMode		= UI.AutogenUnequipWnd.defaultCancelMode
UI.AutogenUnequipWnd.mainWndName	= ""
UI.AutogenUnequipWnd.customData		= nil

UI.AutogenUnequipWnd.msgMetaText	= nil
UI.AutogenUnequipWnd.curItemIdx		= -1
UI.AutogenUnequipWnd.requestId		= 0
UI.AutogenUnequipWnd.isRequestOld	= false	-- если true, значит, что requestId остался еще с прошлого показа окна; сам реквест не обнуляется для того чтобы можно было показать ошибку
UI.AutogenUnequipWnd.hMsgDestroy	= UI.INVALID_UI_HANDLE

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.AutogenUnequipWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )
	
	-- TODO нужен локатор для куртяшки
	local waitEffect = UI:GetEffectFromLayer( self, self.layers.WAIT_EFFECT )
	if waitEffect then
	
		local rect = waitEffect:CalcApproximateRect()
		local x = ( 1024 - rect.z ) / 2
		local y = ( 768 - rect.w ) / 2
		
		waitEffect:SetPos( UI:Vec2( x, y ) )
		
	end
	
	self.msgMetaText = UI.MetaText.GetNewInstance()
	self.msgMetaText:InitFromLayer( self, self.layers.MSG )
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )

end


--
function UI.BuyWnd:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	if self.msgMetaText then
		self.msgMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.AutogenUnequipWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.AutogenUnequipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.AutogenUnequipWnd:UpdateMetaTextPos()
	
	self.msgMetaText:UpdateScreenOrgFromLayer( self, self.layers.MSG )

end


--
function UI.AutogenUnequipWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MSG then
		self.msgMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.AutogenUnequipWnd:Reset()
	
	self.items			= {}
	self.cancelMode		= self.defaultCancelMode
	self.mainWndName	= ""
	self.customData		= nil
	self.curItemIdx		= -1
	
	if self:IsWaiting() then
		self.isRequestOld = true
	end
	
	self:ResetContent()

end


--
function UI.AutogenUnequipWnd:ResetContent()
	
	self.msgMetaText:SetText( "", true )
	UI.AutogenUnequip_DestroyBtn:UnlinkFromParent()
	UI.AutogenUnequip_DismantleBtn:UnlinkFromParent()
	
	self:HideChildModals()
	
end


--
function UI.AutogenUnequipWnd:FullUpdate()
	
	self:ResetContent()
	
	self:UpdateMsg()
	self:UpdateBtns()
	self:UpdateWaitingEffect()
	
end


--
function UI.AutogenUnequipWnd:UpdateMsg()
		
	local str = ""
		
	local curIid = self:GetCurIid()
	if curIid ~= UI.INVALID_U64_ID then
		
		local defName = UI:Iid2DefName( curIid )
		local strNameLink = string.format( "$link [type ITEM][params {defName=\"%s\"}]$", defName )
		
		str = UI:GetStringByName( "autogenUnequip_text" )
		
		local numSubst = 0
		str, numSubst = string.gsub( str, "%$name%$", strNameLink )
		
		if numSubst == 0 then
			sys.log( "UI.AutogenUnequipWnd:UpdateMsg()[ERROR]: cannot find placeholder '$name$' in string 'autogenUnequipWnd_text'" )
			str = string.format( "[INVALID STRING] Unequipping item %s", strNameLink )
		end

	end
	
	self.msgMetaText:SetText( str, true )

end


--
function UI.AutogenUnequipWnd:UpdateBtns()
	
	UI.AutogenUnequip_DestroyBtn:UnlinkFromParent()
	UI.AutogenUnequip_DismantleBtn:UnlinkFromParent()
	
	if self.curItemIdx == -1 then
		return
	end
	
	-- положение кнопок слева направо: "уничтожить", "демонтировать", "отмена";
	-- выравниваются по правому краю;
	-- кнопка "отмена" показывается всегда
	
	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	local btnIdx = 1
	
	if bit.band( self.items[ self.curItemIdx ].actions, self.actions.DISMNANTLE ) ~= 0 then
	
		local locator = self.effectInfo.work.btnLocators[ btnIdx ]
		if locator then
			UI:AddChildAndLink( self, UI.AutogenUnequip_DismantleBtn, workEffect, locator, UI.EffectAnimParams.POS )
		else
			sys.log( "UI.AutogenUnequipWnd:UpdateBtns()[ERROR]: not enough button locators" )
		end
		
		btnIdx = btnIdx + 1

	end
	
	if bit.band( self.items[ self.curItemIdx ].actions, self.actions.DESTROY ) ~= 0 then
	
		local locator = self.effectInfo.work.btnLocators[ btnIdx ]
		if locator then
			UI:AddChildAndLink( self, UI.AutogenUnequip_DestroyBtn, workEffect, locator, UI.EffectAnimParams.POS )
		else
			sys.log( "UI.AutogenUnequipWnd:UpdateBtns()[ERROR]: not enough button locators" )
		end
		
		btnIdx = btnIdx + 1

	end

end


--
function UI.AutogenUnequipWnd:GetCurIid()

	return self.curItemIdx ~= -1 and self.items[ self.curItemIdx ].iid or UI.INVALID_U64_ID

end


--
function UI.AutogenUnequipWnd:IsWaiting()

	return UI:IsWaitingRequests()

end


--
function UI.AutogenUnequipWnd:UpdateWaitingEffect()

	local bIsWaiting = self:IsWaiting()

	self:SetLayerVisible( bIsWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bIsWaiting, self.layers.WAIT_TEXT )

end


--
function UI.AutogenUnequipWnd:F_OnEventStartWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateWaitingEffect()

end


--
function UI.AutogenUnequipWnd:F_OnEventStopWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateWaitingEffect()

end


--
function UI.AutogenUnequipWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	UI.store.AutogenUnequipWnd =
	{
		items			= self.items,
		cancelMode		= self.cancelMode,
		mainWndName		= self.mainWndName,
		customData		= self.customData,
		curItemIdx		= self.curItemIdx,
		requestId		= self.requestId,
		isRequestOld	= self.isRequestOld,
	}

end


--
function UI.AutogenUnequipWnd:F_OnEventRestoreUiState()

	if UI.store.AutogenUnequipWnd then
		
		self.items			= UI.store.AutogenUnequipWnd.items
		self.cancelMode		= UI.store.AutogenUnequipWnd.cancelMode
		self.mainWndName	= UI.store.AutogenUnequipWnd.mainWndName
		self.customData		= UI.store.AutogenUnequipWnd.customData
		self.curItemIdx		= UI.store.AutogenUnequipWnd.curItemIdx
		self.requestId		= UI.store.AutogenUnequipWnd.requestId
		self.isRequestOld	= UI.store.AutogenUnequipWnd.isRequestOld
		
		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.AutogenUnequipWnd = nil
	
	end

end


--
function UI.AutogenUnequipWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if wnd == UI.AutogenUnequip_DestroyBtn then
	
		if not self:IsWaiting() then
			self:TryDestroy()
		end
		
	elseif wnd == UI.AutogenUnequip_DismantleBtn then
	
		if not self:IsWaiting() then
			self:TryDismantle()
		end
		
	elseif wnd == UI.AutogenUnequip_CancelBtn then
		
		self:OnCancel()
		
	end

	return true

end


--
function UI.AutogenUnequipWnd:OnEscape()

	self:OnCancel()
	return true
	
end


--
function UI.AutogenUnequipWnd:TryDestroy()
	
	if self:IsWaiting() then
		sys.log( "UI.AutogenUnequipWnd:TryDestroy()[ERROR]: still waiting for another request" )
		return
	end
	
	local iid = self:GetCurIid()
	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.AutogenUnequipWnd:TryDestroy()[ERROR]: invalid iid" )
		return
	end
	
	local defName = UI:Iid2DefName( iid )
	local strNameLink = string.format( "$link [type ITEM][params {defName=\"%s\"}]$", defName )
	
	local str = UI:GetStringByName( "autogenUnequip_destroyConfirm_text" )
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$name%$", strNameLink )
	
	if numSubst == 0 then
		sys.log( "UI.AutogenUnequipWnd:UpdateMsg()[ERROR]: cannot find placeholder '$name$' in string 'autogenUnequip_destroyMsg_text'" )
		str = string.format( "[INVALID STRING] Unequipping item %s", strNameLink )
	end
	
	self.hMsgDestroy = UI:MessageBox( UI:GetStringByName( "autogenUnequip_destroyConfirm_caption" ), str, UI.MBS_YES_NO )

end


--
function UI.AutogenUnequipWnd:DoDestroy()

	if self:IsWaiting() then
		sys.log( "UI.AutogenUnequipWnd:DoDestroy()[ERROR]: still waiting for another request" )
		return
	end
	
	local iid = self:GetCurIid()
	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.AutogenUnequipWnd:DoDestroy()[ERROR]: invalid iid" )
		return
	end
	
	self.requestId = _G.GameStore_AutogenDestroy( iid )
	self.isRequestOld = false
	
	if self.requestId ~= 0 then
		self.items[ self.curItemIdx ].result = self.itemResults.WAITING_DESTROY
		UI:AddWaitingRequest( self.requestId )
	else
		self:OnError( self.actions.DESTROY, _G.GameStore.ModuleEquipResult.MER_ERROR, false )
	end
	
	self:UpdateWaitingEffect()
	
end


--
function UI.AutogenUnequipWnd:TryDismantle()
	
	if self:IsWaiting() then
		sys.log( "UI.AutogenUnequipWnd:TryDismantle()[ERROR]: still waiting for another request" )
		return
	end
	
	local iid = self:GetCurIid()
	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.AutogenUnequipWnd:TryDismantle()[ERROR]: invalid iid" )
		return
	end
	
	self:LaunchBuyWnd( UI.BuyWnd.modes.AUTOGEN_DISMANTLE, { iid = iid } )
	
end


--
function UI.AutogenUnequipWnd:DoDismantle()

	if self:IsWaiting() then
		sys.log( "UI.DoDestroy:DoDismantle()[ERROR]: still waiting for another request" )
		return
	end
	
	local iid = self:GetCurIid()
	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.DoDestroy:DoDismantle()[ERROR]: invalid iid" )
		return
	end
	
	self.requestId = _G.GameStore_AutogenDismantle( iid )
	self.isRequestOld = false
	
	if self.requestId ~= 0 then
		self.items[ self.curItemIdx ].result = self.itemResults.WAITING_DISAMANTLE
		UI:AddWaitingRequest( self.requestId )
	else
		self:OnError( self.actions.DISMNANTLE, _G.GameStore.ModuleEquipResult.MER_ERROR, false )
	end
	
	self:UpdateWaitingEffect()
	
end



--
function UI.AutogenUnequipWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgDestroy then
	
		self.hMsgDestroy = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoDestroy()
		end
		
	end
	
end


--
function UI.AutogenUnequipWnd:OnCancel()

	local bProceedToNextItem = false
	local bReturnToMainWnd = false
	
	if self.cancelMode == self.cancelModes.CONTINUE then
		
		local isNextItem = self.curItemIdx ~= -1 and self.curItemIdx < #self.items
		if isNextItem then
		
			-- мы не можем перейти к другому предмету если ждем реквеста на наш запрос;
			-- IsWaiting() не совсем подходит - она вернет true в том числе и если ждем старый реквест, и даже если ждем вообще не связанный с этим окном реквест;
			-- но такой посторонний реквест не дожен помешать переключиться на следующий предмет
			local isActualRequestWaiting = self.requestId ~= 0 and not self.isRequestOld
			if not isActualRequestWaiting then
				bProceedToNextItem = true
			end
			
		else
			bReturnToMainWnd = true
		end
		
	elseif self.cancelMode == self.cancelModes.BREAK then
		bReturnToMainWnd = true
		
	else
		sys.log( "UI.AutogenUnequipWnd:OnCancel()[ERROR]: unhandled cancelMode %s", tostring( self.cancelMode ) )
	end
	
	if self.curItemIdx ~= -1 then
		local oldResult = self.items[ self.curItemIdx ].result
		if oldResult == self.itemResults.NOT_HANDLED or oldResult == self.itemResults.ERROR then	-- статусы WAITING_DESTROY и WAITING_DISAMANTLE не перезаписываются, других не дожно стоять
			self.items[ self.curItemIdx ].result = self.itemResults.CANCELLED
		end
	end
	
	if bProceedToNextItem then
		self:ProceedToNextItem()
		
	elseif bReturnToMainWnd then
		self:ReturnToMainWnd()
	end

end


--
function UI.AutogenUnequipWnd:OnError( actionType, result, isRequestOld )

	if actionType == self.actions.DESTROY then
		self:ShowMsgOnDestroyError( result )
		
	elseif actionType == self.actions.DISMNANTLE then
		self:ShowMsgOnDismantleError( result )
	else
		sys.log( "UI.AutogenUnequipWnd:OnError()[ERROR]: unhandled actionType %s", tostring( actionType ) )
	end

	if self:IsOnScreen() and not isRequestOld then
	
		if self.curItemIdx ~= -1 then
			self.items[ self.curItemIdx ].result = self.itemResults.ERROR
		else
			sys.log( "UI.AutogenUnequipWnd:OnError()[ERROR]: invalid self.curItemIdx" )
		end

		if self.cancelMode == self.cancelModes.CONTINUE then
			-- остаемся на текущем модуле, ждем когда игрок повторит попытку или сделает отмену
			
		elseif self.cancelMode == self.cancelModes.BREAK then
			self:ReturnToMainWnd()	-- возврат в вызывающее окно
			
		else
			sys.log( "UI.AutogenUnequipWnd:OnError()[ERROR]: unhandled cancelMode %s", tostring( self.cancelMode ) )
			self:ReturnToMainWnd()
		end
		
	end
	
end


--
function UI.AutogenUnequipWnd:ShowMsgOnDestroyError( result )

	UI:ShowErrorMsg( "msg_autogenDestroyError", result, "_G.GameStore.ModuleEquipResult" )
	
end


--
function UI.AutogenUnequipWnd:ShowMsgOnDismantleError( result )

	UI:ShowErrorMsg( "msg_autogenDismantleError", result, "_G.GameStore.ModuleEquipResult" )
	
end


--
function UI.AutogenUnequipWnd:ReturnToMainWnd()

	if not self:IsOnScreen() then
		return
	end

	if self.mainWndName ~= "" then
	
		local mainWnd = UI[ self.mainWndName ]
		if mainWnd then
		
			if mainWnd.OnAutogenUnequipWnd then
				mainWnd:OnAutogenUnequipWnd( self.items, self.cancelMode, self.customData )
			else
				sys.log( "UI.AutogenUnequipWnd:ReturnToMainWnd()[ERROR]: main wnd %s doesnn't have function 'OnAutogenUnequipWnd()'", self.mainWndName )
			end

		else
			sys.log( "UI.AutogenUnequipWnd:ReturnToMainWnd()[ERROR]: cannot find main wnd %s", self.mainWndName )
		end
		
	end
	
	self:Hide()

end


--
function UI.AutogenUnequipWnd:ProceedToNextItem()

	-- переходим к следующему модулю
	if self.curItemIdx ~= -1 and self.curItemIdx < #self.items then
	
		self.curItemIdx = self.curItemIdx + 1
		self:FullUpdate()
		
	-- был последний модуль, возвращаемся в окно вызова
	else
		self:ReturnToMainWnd()
	end

end


--
function UI.AutogenUnequipWnd:LaunchBuyWnd( mode, data )

	UI.AutogenUnequip_BuyWnd:Setup( mode, true, data, true )
	UI.AutogenUnequip_BuyWnd:Show()
	
end


--
function UI.AutogenUnequipWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:Reset()
	else
		self:OnAfterHideFromScreen()
	end

end


--
function UI.AutogenUnequipWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.AutogenUnequipWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	if self.hMsgDestroy ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgDestroy )
		UI:Purge()
		self.hMsgDestroy = UI.INVALID_UI_HANDLE
	end
	
	UI.AutogenUnequip_BuyWnd:Hide()

end


-- ---------------------------------------------------------------------------
-- UI.AutogenUnequip_DestroyBtn
-- ---------------------------------------------------------------------------

UI.AutogenUnequip_DestroyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn4",
		
		props =
		{
			name	= "AutogenUnequip_DestroyBtn"
		}
	},
	
	textId = "autogenUnequip_destroyBtn"
}

-- ---------------------------------------------------------------------------
-- UI.AutogenUnequip_DismantleBtn
-- ---------------------------------------------------------------------------

UI.AutogenUnequip_DismantleBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn4",
		
		props =
		{
			name	= "AutogenUnequip_DismantleBtn"
		}
	},
	
	textId = "autogenUnequip_dismantleBtn"
}

-- ---------------------------------------------------------------------------
-- UI.AutogenUnequip_CancelBtn
-- ---------------------------------------------------------------------------

UI.AutogenUnequip_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn4",
		
		props =
		{
			name	= "AutogenUnequip_CancelBtn"
		}
	},
	
	textId = "cancel"
}

-- ---------------------------------------------------------------------------
-- UI.AutogenUnequip_BuyWnd
-- ---------------------------------------------------------------------------

UI.AutogenUnequip_BuyWnd =
{
	def =
	{
		className = "Wnd",
		prototype = "BuyWnd",
		
		props =
		{
			name = "AutogenUnequip_BuyWnd"
		}
	},
	
	mainWndName = "AutogenUnequipWnd"
}