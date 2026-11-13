-- ------------------------------------------------------------
-- Clans_HistoryWnd
-- ------------------------------------------------------------

UI.Clans_HistoryWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.Clans_HistoryWnd.layers =
{
	MAIN_EFFECT		= 0,
	WAIT_EFFECT		= 1,
	WAIT_TEXT		= 2,
}


--
UI.Clans_HistoryWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Clans_HistoryWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		firstOverlayLayer = UI.Clans_HistoryWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "clans_history_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "list",
						wnd			= "UI.Clans_History_TextBoxWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "drop_down",
						wnd			= "UI.Clans_History_ActionsCb",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading8",
						layer		= "UI.Clans_HistoryWnd.layers.WAIT_EFFECT",
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
						layer		= "UI.Clans_HistoryWnd.layers.WAIT_TEXT",
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

	children = { "UI.Clans_History_TextBoxWnd", "UI.Clans_History_ActionsCb" }
}

-- ------------------------------
-- interface funcitons
-- ------------------------------

--
function UI.Clans_HistoryWnd:MasterServer_OnClanHistoryGet( data )
	
	local requestId = -1	-- -1 обозначает, что он не смог прочитаться из data
	local result = 0
	local history = {}
	
	-- хак: requestId и result не передаются здесь отдельно, как во всех коллбэках, а засунуты вместе с данными, поэтому приходится их вытаскивать
	requestId, result, history = self:CheckAndParseData( data )
	
	local action = -1
	if requestId == self.requestId then
		action = self.requestedAction
	else
		sys.log( "UI.Clans_HistoryWnd:MasterServer_OnClanHistoryGet()[ERROR]: got data for unknown action" )
	end
	
	if result == 0 then
	
		if self:IsOnScreen() then
			
			if action == self.selAction then
				self.history = history
				self:UpdateText()
			end
			
		end
		
	else
	
		if requestId ~= 0 and requestId ~= -1 and requestId == self.requestId then
			self:ShowMsgOnHistoryGetError( result )
		end
		
	end
	
	if requestId ~= 0 and requestId == self.requestId or requestId == -1  then	-- если requestId==-1, значит бесполезно продолжать ожидание, формат таблицы поменялся
		self.requestId = 0
		self.requestedAction = -1
	end
	
	self:UpdateWaitingEffect()
	
	-- если данные пришли не для выбранного сейчас действия, то запрашиваем снова
	if self:IsOnScreen() and self.selAction ~= -1 and action ~= self.selAction then
		self:RequestHistory( true )
	end

end


--
function UI.Clans_HistoryWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.requestId = 0
	self.requestedAction = -1
	self:UpdateWaitingEffect()

end


-- ------------------------------
-- const
-- ------------------------------

UI.Clans_HistoryWnd.REQUEST_TIME	= 30			-- [сек] время между периодическими запросами на сервер

-- ------------------------------
-- vars
-- ------------------------------

UI.Clans_HistoryWnd.requestTimer 		= 0
UI.Clans_HistoryWnd.requestId			= 0
UI.Clans_HistoryWnd.requestedAction		= -1
UI.Clans_HistoryWnd.history				= {}
UI.Clans_HistoryWnd.hErrorMsgWnd		= UI.INVALID_UI_HANDLE
UI.Clans_HistoryWnd.selAction			= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Clans_HistoryWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	self:UpdateWaitingEffect()
	
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )

end


--
function UI.Clans_HistoryWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:InitActionsCb()
	self:SelectAction( _G.MasterServer.ClanAction.CA_ALL, true )

end


--
function UI.Clans_HistoryWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()
	
	if UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then
		
		if self.hErrorMsgWnd ~= UI.INVALID_UI_HANDLE then
			UI:RemoveUiObj( self.hErrorMsgWnd )
			UI:Purge()
			self.hErrorMsgWnd = UI.INVALID_UI_HANDLE
		end
		
	end
	
end


--
function UI.Clans_HistoryWnd:RequestHistory( bIgnoreTimer )

	if not self:IsOnScreen() then
		sys.log( "UI.Clans_HistoryWnd:RequestHistory()[ERROR]: not on screen" )
		return
	end
	
	if self.requestTimer > 0 and not bIgnoreTimer then
		sys.log( "UI.Clans_HistoryWnd:RequestHistory()[ERROR]: timer not yet expired" )
		return
	end
	
	if self.selAction == -1 then
		sys.log( "UI.Clans_HistoryWnd:RequestHistory()[ERROR]: no selected action" )
		return
	end
	
	-- уже ожидаем запроса? Если action этого запроса не совпадает с текущим выбранным, то после прихода данных они будут проигнорированы и будет послан новый запрос
	if self.requestId ~= 0 then
		return
	end
		
	self.requestId = _G.MasterServer_ClanHistoryGet( self.selAction, UI.INVALID_U64_ID )
	
	if self.requestId ~= 0 then
		self.requestedAction = self.selAction
	else
		self.requestedAction = -1
		self:ShowMsgOnHistoryGetError( 1 )
	end
	
	self:UpdateWaitingEffect()
	
	self.requestTimer = self.REQUEST_TIME
	
end


--
function UI.Clans_HistoryWnd:ShowMsgOnHistoryGetError( result )

	-- нет специальных кодов ошибки, тлько 0(успех) и 1(ошибка)
	if result ~= 1 then
		sys.log( "UI.Clans_HistoryWnd:ShowMsgOnHistoryGetError()[ERROR]: unknown result %d", result )
	end
	
	if self.hErrorMsgWnd ~= UI.INVALID_UI_HANDLE then
		return
	end
	
	self.hErrorMsgWnd = UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "clanHistory_failGetHistoryError_msg" ), UI.MBS_OK )

end


--
function UI.Clans_HistoryWnd:CheckAndParseData( data )

	local requestId = -1
	local result = 0
	local history = {}
	
	if type( data ) ~= "table" then
		sys.log( "UI.Clans_HistoryWnd:CheckAndParseData()[ERROR]: invalid 'data' type; 'table' expected, got '%s'", type( data ) )
		return requestId, result, history
	end
	
	if type( data.requestId ) == "number" then
		requestId = data.requestId
	else
		sys.log( "UI.Clans_HistoryWnd:CheckAndParseData()[ERROR]: invalid type of 'data.requestId'; 'number' expected, got '%s'", type( data.requestId ) )
	end
	
	if type( data.result ) == "number" then
		result = data.result
	else
		sys.log( "UI.Clans_HistoryWnd:CheckAndParseData()[ERROR]: invalid type of 'data.result'; 'number' expected, got '%s'", type( data.result ) )
	end
	
	-- здесь только самая общая структура проверяется, структура каждой записи проверяется уже перед добавлением текста; даже если она невалидна, все равно какая-то заглушка нарисуется
	if type( data.history ) == "table" then
	
		local bHistoryValid = true
		
		for idx, record in pairs( data.history ) do
			if type( idx ) ~= "number" or type( record ) ~=  "table" then
				sys.log( "UI.Clans_HistoryWnd:CheckAndParseData()[ERROR]: invalid format of 'data.history'; <number>=<table> pairs expected, got <%s>=<%s>", type( idx ), type( record ) )
				bHistoryValid = false
				break
			end
		end
		
		if bHistoryValid then
			-- пляски с бубном, чтобы убедиться, что это регулярный массив
			if data.history[ 0 ] ~= nil or UI:GetTableLength( data.history ) ~= #data.history or table.maxn( data.history ) ~= #data.history then
				sys.log( "UI.Clans_HistoryWnd:CheckAndParseData()[ERROR]: invalid format of 'data.history'; 1-based regular array expected" )
				bHistoryValid = false
			end
		end
		
		if bHistoryValid then
			history = data.history
		end
		
	else
		sys.log( "UI.Clans_HistoryWnd:CheckAndParseData()[ERROR]: invalid type of 'data.history'; 'table' expected, got '%s'", type( data.history ) )
	end
	
	return requestId, result, history

end


--
function UI.Clans_HistoryWnd:UpdateText()
	
	local oldScrollPos = UI.Clans_History_TextBoxWnd:GetScrollPos()
	local bAtEnd = math.abs( oldScrollPos - UI.Clans_History_TextBoxWnd:GetScrollMax() ) <= 1e-3
	
	UI.Clans_History_TextBoxWnd:Reset()
	
	local text = ""
	
	for recordIdx = #self.history, 1, -1 do		-- записи хранятся в массиве самые первые - это самые новые, а показывается - новые внизу
		local record = self.history[ recordIdx ]
		local strRedcord = self:HistoryRecord2Str( record )
		text = string.format( "%s%s%s", text, text ~= "" and "|" or "", strRedcord )
	end
	
	UI.Clans_History_TextBoxWnd:SetScrollText( text )
	
	if bAtEnd then
		UI.Clans_History_TextBoxWnd:ScrollEnd()
	else
		UI.Clans_History_TextBoxWnd:SetScrollPos( oldScrollPos )
	end
	
end


--
function UI.Clans_HistoryWnd:HistoryRecord2Str( record )
	
	local strRecord = ""
	
	-- время
	local strTime = "unknown time"
	
	if type( record.time ) == "userdata" then
		local localDateTime = _G.MasterServer_ServerTimeToLocalTimeT( record.time )
		strTime = UI:DateTime2FullDateTime( localDateTime )
	else
		sys.log( "UI.Clans_HistoryWnd:HistoryRecord2Str()[ERROR]: infalid typeof field 'time'; 'userdata' expected, got '%s'", type( record.time ) )
	end
	
	
	-- вспомогательные функции
	local function fnSafeGetParam( fieldName, fieldType, defaultVal )
	
		local val = defaultVal
		
		if type( record.params ) == "table" then
		
			val = record.params[ fieldName ]
			
			if type( val ) ~= fieldType then
			
				local bFixed = false
			
				if fieldType == "boolean" then
					if type( val ) == "number" and ( val == 1 or val == 0 ) then
						val = val == 1
						bFixed = true
					end
				end
			
				if not bFixed then
					sys.log( "UI.Clans_HistoryWnd:HistoryRecord2Str()[ERROR]: invalid type of 'params.%s' for action %d('%s'); '%s' expected, got '%s'", fieldName, record.action, UI:Val2Key( _G.MasterServer.ClanAction, record.action ), fieldType, type( val ) )
					val = defaultVal
				end
				
			end
			
		else
			sys.log( "UI.Clans_HistoryWnd:HistoryRecord2Str()[ERROR]: invalid type of 'params'; 'table' expected, got '%s'", type( record.params ) )
		end
		
		return val
		
	end
	
	local function fnGetPlayer( fieldName )
	
		local str = "unknown player"
	
		local uid = fnSafeGetParam( fieldName, "userdata", UI.INVALID_U64_ID )
		if uid ~= UI.INVALID_U64_ID then
			str = UI:MakePlayerNameByUid( uid, false, false )
		end
	
		return str
		
	end
	
	local function fnGetRole( fieldName )
	
		local str = "unknown role"
	
		local role = fnSafeGetParam( fieldName, "number", -1 )
		
		if role ~= -1 then
			local roleName = UI:Val2Key( _G.MasterServer.ClanRole, role )
			if roleName ~= "" then
				local strId = string.format( "clanRole_%s", roleName )
				str = UI:GetStringByName( strId )
			else
				sys.log( "UI.Clans_HistoryWnd:HistoryRecord2Str()[ERROR]: invalid role %d", role )
			end
		end
	
		return str
		
	end	
	
	local function fnGetClanShip( fieldName )
	
		local str = "unknown object"
		
		local defName = fnSafeGetParam( fieldName, "string", "" )
		if defName ~= "" then
			str = UI:ClanShip2Str( defName )
		end
		
		return str
	
	end
	
	local function fnGetZone( fieldName )
	
		local str = "unknown zone"
		
		local zoneId = fnSafeGetParam( fieldName, "number", -1 )
		
		if zoneId ~= -1 then
			local zoneName = UI:ZoneId2Name( zoneId )
			str = UI:Zone2Str( zoneName, false )
		end
		
		return str
	
	end
	
	local function fnGetIridiumPrice( fieldName )
	
		-- иконки пока не подерживаются; предполагается, что название валюты будет в строке зашито
		local val = fnSafeGetParam( fieldName, "number", 0 )
		return UI:Num2StrSeparatedBy3( val )
	
	end
	
	local function fnGetClan( fieldName )
	
		local str = "unknown clan"
	
		local cid = fnSafeGetParam( fieldName, "userdata", UI.INVALID_U64_ID )
		if cid ~= UI.INVALID_U64_ID then
			str = UI:GetFullClanName( cid )
		end
	
		return str
		
	end
	
	local function fnMakeMsg( action, tSubst )
	
		local actionName = UI:Val2Key( _G.MasterServer.ClanAction, action )
		local strId = string.format( "clanHistory_action_%s", actionName )
		
		local str = UI:GetStringByName( strId )
		
		if tSubst and next( tSubst ) then
		
			local numSubst = 0
			str, numSubst = string.gsub( str, "%$(.-)%$", tSubst )
			
			if numSubst ~= UI:GetTableLength( tSubst ) then
			
				local strPlaceholders = ""
				for placeholder, val in pairs( tSubst ) do
					strPlaceholders = string.format( "%s%s%s", strPlaceholders, strPlaceholders ~= "" and ", " or "", placeholder )
				end
				sys.log( "UI.Clans_HistoryWnd:HistoryRecord2Str()[ERROR]: invalid placeholders in string %s; expected: %s", strId, strPlaceholders )
				
			end
			
		end
		
		return str
		
	end
	
	
	-- тело сообщения
	local strMsg = "unknown message"
	
	if type( record.action ) == "number" then
	
		if record.action == _G.MasterServer.ClanAction.CA_MEMBER_ADD then
			
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				target_player		= fnGetPlayer( "targetUid" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_MEMBER_REMOVE then
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				target_player		= fnGetPlayer( "targetUid" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
		
		elseif record.action == _G.MasterServer.ClanAction.CA_MEMBER_CHANGE_ROLE then
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				target_player		= fnGetPlayer( "targetUid" ),
				target_role_new		= fnGetRole( "targetRoleNew" ),
				target_role_old		= fnGetRole( "targetRoleOld" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
		
		elseif record.action == _G.MasterServer.ClanAction.CA_SHIP_MOVE then

			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				ship				= fnGetClanShip( "shipDef" ),
				zone				= fnGetZone( "zoneId" ),
				price				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
		
		elseif record.action == _G.MasterServer.ClanAction.CA_SHIP_SET_CURRENT then
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				ship				= fnGetClanShip( "shipDef" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
		
		elseif record.action == _G.MasterServer.ClanAction.CA_ZONE_SET_CIVILIAN then
			
			local bCivilian = fnSafeGetParam( "isCivilian", "boolean", false )
			local strZoneRegime = UI:GetStringByName( bCivilian and "clanHistory_zoneRegime_civilian" or "clanHistory_zoneRegime_nonCivilian" )
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				zone				= fnGetZone( "zoneId" ),
				zone_regime			= strZoneRegime,
				price				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_WAR_CLAN_REVIVE then
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				price				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_WAR_START then
			
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				clan				= fnGetClan( "rivalCid" ),
				price				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_WAR_START_BY_RIVAL then
		
			local tSubst =
			{
				clan				= fnGetClan( "rivalCid" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_WAR_WIN then
		
			local tSubst =
			{
				clan				= fnGetClan( "rivalCid" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_WAR_LOSS then
		
			local tSubst =
			{
				clan				= fnGetClan( "rivalCid" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_RESOURCE_CONVERT then
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				amount				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_RESOURCE_TRANSFER then
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				amount				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_RESOURCE_ADD_BY_QUEST then
		
			local tSubst =
			{
				initiator_player	= fnGetPlayer( "initiatorUid" ),
				initiator_role		= fnGetRole( "initiatorRole" ),
				amount				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_RESOURCE_ADD_BY_ZONE then
		
			local tSubst =
			{
				zone				= fnGetZone( "zoneId" ),
				amount				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		elseif record.action == _G.MasterServer.ClanAction.CA_RESOURCE_ADD_BY_WAR then
		
			local tSubst =
			{
				clan				= fnGetClan( "rivalCid" ),
				amount				= fnGetIridiumPrice( "amount" ),
			}
			strMsg = fnMakeMsg( record.action, tSubst )
			
		else
			strMsg = string.format( "unknown action %d", record.action )
			sys.log( "UI.Clans_HistoryWnd:HistoryRecord2Str()[ERROR]: unhandled action %d ('%s')", record.action, UI:Val2Key( _G.MasterServer.ClanAction, record.action ) )
		end
	
	else
		sys.log( "UI.Clans_HistoryWnd:HistoryRecord2Str()[ERROR]: infalid typeof field 'action'; 'number' expected, got '%s'", type( record.action ) )
	end
	
	-- всё вместе
	strRecord = string.format( "%s: %s", strTime, strMsg )
	
	return strRecord
	
end


--
function UI.Clans_HistoryWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateRequestHistoryTimer( dt_sys )

end

 
--
function UI.Clans_HistoryWnd:UpdateRequestHistoryTimer( dt )

	self.requestTimer = self.requestTimer - dt
	if self.requestTimer <= 0 then
		self:RequestHistory( false )
	end

end


--
function UI.Clans_HistoryWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )
	
	if boxHandle == self.hErrorMsgWnd then
		self.hErrorMsgWnd = UI.INVALID_UI_HANDLE
	end

end


--
function UI.Clans_HistoryWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting() and not next( self.history )	-- крутяшка показывается только при первом запросе (когда история пустая)

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.Clans_HistoryWnd:IsWaiting()

	return self.requestId ~= 0

end


--
function UI.Clans_HistoryWnd:F_OnEventSaveUiState()

	UI.store.Clans_HistoryWnd =
	{
		requestId		= self.requestId,
		requestedAction	= self.requestedAction,
	}

end


--
function UI.Clans_HistoryWnd:F_OnEventRestoreUiState()

	if UI.store.Clans_HistoryWnd then
	
		self.requestId			= UI.store.Clans_HistoryWnd.requestId
		self.requestedAction	= UI.store.Clans_HistoryWnd.requestedAction
		self:UpdateWaitingEffect()
		
		UI.store.Clans_HistoryWnd = nil
		
	end

end


local l_lockActionsCbRaction = false

--
function UI.Clans_HistoryWnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == UI.Clans_History_ActionsCb:GetUiHandle() then
	
		if not l_lockActionsCbRaction then
	
			local selAction = -1
			
			local selRecordIdx = UI.Clans_History_ActionsCb:GetSelectedRecord()
			if selRecordIdx ~= -1 then
				selAction = UI.Clans_History_ActionsCb:GetRecordData( selRecordIdx ).action
			end
			
			self:SelectAction( selAction, false )
			
		end
		
	end

end


--
function UI.Clans_HistoryWnd:SelectAction( selAction, bForceRequest )

	local bNeedRequest = selAction ~= self.selAction or bForceRequest

	if selAction ~= self.selAction then
	
		self.selAction = selAction
		
		local selRecordIdx = -1
		if selAction ~= -1 then	
			for recordIdx = 1, UI.Clans_History_ActionsCb:GetNumRecords() do
				if UI.Clans_History_ActionsCb:GetRecordData( recordIdx ).action == selAction then
					selRecordIdx = recordIdx
					break
				end
			end
		end
		
		l_lockActionsCbRaction = true
		UI.Clans_History_ActionsCb:SelectRecord( selRecordIdx )
		l_lockActionsCbRaction = false
		
	end
	
	if bNeedRequest then
	
		self.history = {}
		UI.Clans_History_TextBoxWnd:Reset()
		self:UpdateWaitingEffect()
	
		if self.selAction ~= -1 then
			self:RequestHistory( true )
		end
		
	end

end


--
function UI.Clans_HistoryWnd:InitActionsCb()

	if UI.Clans_History_ActionsCb:GetNumRecords() > 0 then
		return
	end
	
	local actions = {}
	for actionName, action in pairs( _G.MasterServer.ClanAction ) do
		table.insert( actions, action )
	end	
	table.sort( actions )
	
	for idx, action in ipairs( actions ) do
	
		local data = {}
		data.action = action
		
		local ationName = UI:Val2Key( _G.MasterServer.ClanAction, action )
		local strId = string.format( "clanHistory_action_name_%s", ationName )
		data.text = UI:GetStringByName( strId )
	
		UI.Clans_History_ActionsCb:AddRecord( data )
		
	end
	
end


-- ------------------------------------------------------------
-- Clans_History_TextBoxWnd
-- ------------------------------------------------------------

UI.Clans_History_TextBoxWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "EffectTextBox2Wnd",
	
		props =
		{
			name		= "Clans_History_TextBoxWnd",
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
					defName 			= "clans_history_textBox",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						-- не линкуется по ALIGNMENT
						{
							objName		= "descript",
							layer		= "UI.EffectTextBoxWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
			
			-- TEXT
			{
				layerType	= UI.LAYER_TEXT,
				layerStyle	= UI.WLS_OWNERDRAW,

				formatInfoSz= { 20, 3 },
				formatFlags	= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_WORDBREAK,	-- по сравнению с баовым классом, убран стиль FONT.TF_FULL
				font =
				{
					fontName = "Small",
				},
			},

		},
	},

	effectInfo =
	{
		main =
		{
			scrollObjName		= "scroll",
			textObjName			= "descript"
		}
	},

	scrollBarPrototypeName = "EffectScrollWnd_Vrt_2",
}


-- ---------------------------------------------------------------
-- UI.Clans_History_ActionsCB
-- ---------------------------------------------------------------

UI.Clans_History_ActionsCb =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "Clans_History_ActionsCB"
		},
	},
	
	MAX_VISIBLE_RECORDS = 10,
}