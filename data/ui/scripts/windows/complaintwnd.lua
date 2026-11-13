-- ----------------------------------------------------------------------------
--
-- Workfile: complaintwnd.lua
-- Copyright й 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- ------------------------------
-- UI.Complaint_Wnd
-- ------------------------------

UI.Complaint_Wnd = {}


UI.Complaint_Wnd.def =
{
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name			= "Complaint_Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
		defaultChild	= "Complaint_EditReasonWnd",
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
				defName				= "complaint_main",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "win",	
						layer		= "UI.Complaint_Wnd.layers.WORK_EFFECT",
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
				defName				= "complaint_wnd",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "input",
						wnd			= "UI.Complaint_EditReasonWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.Complaint_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",
						wnd			= "UI.Complaint_CancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.Complaint_ReportBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",
						wnd			= "UI.Complaint_MuteBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_3",
						wnd			= "UI.Complaint_BanBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "drop_down1",	
						wnd			= "UI.Complaint_ReasonCombobox",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "drop_down",
						wnd			= "UI.Complaint_DurationCombobox",
						animParams	= UI.EffectAnimParams.POS,
					},
--[[
					{
						objName		= "drop_down",	
						wnd			= "UI.VoteWnd_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
]]

					{
						objName		= "title",	
						layer		= "UI.Complaint_Wnd.layers.TITLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "t_1",	
						layer		= "UI.Complaint_Wnd.layers.FROM_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "t_2",	
						layer		= "UI.Complaint_Wnd.layers.WHO_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "t_3",	
						layer		= "UI.Complaint_Wnd.layers.REASON_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "t_4",	
						layer		= "UI.Complaint_Wnd.layers.DESC_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "t_8",	
						layer		= "UI.Complaint_Wnd.layers.LOG_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "t_6",	
						layer		= "UI.Complaint_Wnd.layers.PUNISHMENT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "t_9",	
						layer		= "UI.Complaint_Wnd.layers.RULES_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "input1",
						wnd			= "UI.Complaint_EditRulesWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TITLE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^complain_window_caption",
		},

		-- FROM_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},

		-- WHO_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
		},

		-- REASON_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^complain_window_reason",
		},

		-- RULES_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^complain_window_rules",
		},

		-- DESC_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^complain_window_desc",
		},

		-- LOG_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^complain_window_log_attached",
		},

		-- PUNISHMENT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^complain_window_punishment_duration",
		},
	},

	children = { "UI.Complaint_ReasonCombobox", "UI.Complaint_CrossBtn", "UI.Complaint_EditReasonWnd", "UI.Complaint_CancelBtn", "UI.Complaint_ReportBtn", "UI.Complaint_BanBtn", "UI.Complaint_MuteBtn",
		"UI.Complaint_DurationCombobox", "UI.Complaint_EditRulesWnd" }
}


-- ------------------------------
-- const
-- ------------------------------

UI.Complaint_Wnd.layers = 
{
	MAIN_EFFECT				= 0,
	WORK_EFFECT				= 1,
	TITLE_TEXT				= 2,
	FROM_TEXT				= 3,
	WHO_TEXT				= 4,
	REASON_TEXT				= 5,
	RULES_TEXT				= 6,
	DESC_TEXT				= 7,
	LOG_TEXT				= 8,
	PUNISHMENT_TEXT			= 9,
}

UI.Complaint_Wnd.MAX_REPORT_LENGTH = 2048
UI.Complaint_Wnd.DURATIONS_LIST = 
{
	{ text = "complain_window_duration_1_hour", value = 1 },
	{ text = "complain_window_duration_1_day", value = 24 },
	{ text = "complain_window_duration_1_week", value = 168 },
	{ text = "complain_window_duration_2_week", value = 336 },
	{ text = "complain_window_duration_1_month", value = 720 },
	{ text = "complain_window_duration_6_months", value = 4320 },
	{ text = "complain_window_duration_permanent", value = -1 },
}

UI.Complaint_Wnd.Modes = 
{
	COMPLAINT 		= 0,
	PUNISHMENT 		= 1,
}

-- ------------------------------
-- var
-- ------------------------------

--UI.Complaint_Wnd.inited = false
UI.Complaint_Wnd.startParams = {}
UI.Complaint_Wnd.mode = UI.Complaint_Wnd.Modes.COMPLAINT

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Complaint_Wnd:MasterServer_OnAdminCmd( result, requestId )
	if result ~= 0 then
		text = UI:GetStringByName( "admin_task_error" )
		local errorCode = UI:Val2Key( MasterServer.AdminTaskResult, result )
		local reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
	end
end

--
function UI.Complaint_Wnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	--if not self.inited then
	local selRecordIdx = -1
	UI.Complaint_ReasonCombobox:Reset()
	UI.Complaint_DurationCombobox:Reset()

	local records = {}
	for k, v in pairs( MasterServer.AbuseCategory ) do
		if k ~= "ABUSE_NUM" and k ~= "ABUSE_ANTI_CHEAT_BOT" then		-- опция ABUSE_ANTI_CHEAT_BOT должна быть недоступна игроку
			local skip = false
			if self.startParams.tabId == nil then
				if k == "ABUSE_CHAT_ABUSE" then
					skip = true
				end
			end
			if not skip then
				local data = {}
		    	data.value = v
		    	data.text = UI:GetStringByName( "complain_window_reason_"..k )
				records[ #records + 1 ] = data
			end
		end
	end

	local function Sort( record1, record2 )
		return record1.value < record2.value
	end	
	table.sort( records, Sort )

	for i = 1, #records do
		UI.Complaint_ReasonCombobox:AddRecord( records[ i ] )
		if self.startParams and self.startParams.reason and self.startParams.reason ~= -1 then
			if records[ i ].value == self.startParams.reason then
				selRecordIdx = i
			end
		end
	end

	if selRecordIdx == -1 and UI.Complaint_ReasonCombobox:GetNumRecords() > 0 then
		selRecordIdx = 1
	end
	UI.Complaint_ReasonCombobox:SelectRecord( selRecordIdx )

	selRecordIdx = -1
	for i = 1, #self.DURATIONS_LIST do
		local data = UI:CopyTable2( self.DURATIONS_LIST[ i ] )
		data.text = UI:GetStringByName( data.text )
		UI.Complaint_DurationCombobox:AddRecord( data )
		if data.value == self.startParams.duration then
			selRecordIdx = i
		end
	end

	if selRecordIdx == -1 and UI.Complaint_DurationCombobox:GetNumRecords() > 0 then
		selRecordIdx = 1
	end
	UI.Complaint_DurationCombobox:SelectRecord( selRecordIdx )

	if not self.startParams.text then
		self.startParams.text = ""
	end
	UI.Complaint_EditReasonWnd:SetEditText( self.startParams.text )
	self:SetText( UI:GetStringByName( "complain_window_from" ).." "..tostring( self.startParams.fromName ), self.layers.FROM_TEXT )
	self:SetText( UI:GetStringByName( "complain_window_to" ).." "..tostring( self.startParams.toName ), self.layers.WHO_TEXT )

	if UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value == MasterServer.AbuseCategory.ABUSE_CHAT_ABUSE and self.startParams.tabId then
		self:SetLayerVisible( true, self.layers.LOG_TEXT )
	else
		self:SetLayerVisible( false, self.layers.LOG_TEXT )
	end

	if self.mode == self.Modes.PUNISHMENT then
		UI.Complaint_ReportBtn:UnlinkFromParent()
		self:AddChild( UI.Complaint_DurationCombobox )
		self:SetLayerVisible( true, self.layers.PUNISHMENT_TEXT )
		if _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_MUTE ) or _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_MUTE_PERMANENT ) then
			self:AddChild( UI.Complaint_MuteBtn )
		end
		if _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_BAN ) or _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_BAN_PERMANENT ) then
			self:AddChild( UI.Complaint_BanBtn )
		end
		self:UpdatePunishementBtnsStates()

		self:SetLayerVisible( true, self.layers.RULES_TEXT )


		self:AddChild( UI.Complaint_EditRulesWnd )

    	if not self.startParams.rules then
    		self.startParams.rules = ""
    	end
    	UI.Complaint_EditRulesWnd:SetEditText( self.startParams.rules )

		local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )		
		if workEffect then
			workEffect:StartAnimation( "idle_2" )
		end

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )		
		if mainEffect then
			mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.WORK_EFFECT, "" )
			mainEffect:LinkLayer( self:GetUiHandle(), self.layers.WORK_EFFECT, "win_2", UI.EffectAnimParams.POS )
		end

	else
		self:AddChild( UI.Complaint_ReportBtn )
		self:SetLayerVisible( false, self.layers.PUNISHMENT_TEXT )
		UI.Complaint_BanBtn:UnlinkFromParent()
		UI.Complaint_MuteBtn:UnlinkFromParent()
		UI.Complaint_DurationCombobox:UnlinkFromParent()

		self:SetLayerVisible( false, self.layers.RULES_TEXT )
		UI.Complaint_EditRulesWnd:UnlinkFromParent()

		local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )		
		if workEffect then
			workEffect:StartAnimation( "idle" )
		end

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )		
		if mainEffect then
			mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.WORK_EFFECT, "" )
			mainEffect:LinkLayer( self:GetUiHandle(), self.layers.WORK_EFFECT, "win", UI.EffectAnimParams.POS )
		end

	end
	
end

--
function UI.Complaint_Wnd:Show( fromName, toName, toUid, reason, tabId, mode, isBot )
	self.startParams = {}
	self.startParams.text = ""
	self.startParams.fromName = fromName
	self.startParams.toName = toName
	self.startParams.reason = reason
	self.startParams.tabId = tabId
	self.startParams.toUid = toUid
	self.startParams.isBot = isBot or false
	self.startParams.rules = ""
	self.mode = mode or self.Modes.COMPLAINT
	UI.FullScreenWnd.Show( self )
	UI:PlayGlobalSound( "sound/ui/msgBox" )
	UI:SetKeyboardFocus( UI.Complaint_EditReasonWnd:GetUiHandle() )
end

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Complaint_Wnd:F_OnEventComboSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )
	if not self:IsOnScreen() then
		return
	end
	if hSender == UI.Complaint_ReasonCombobox:GetUiHandle() then

    	if UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value == MasterServer.AbuseCategory.ABUSE_CHAT_ABUSE and self.startParams.tabId then
    		self:SetLayerVisible( true, self.layers.LOG_TEXT )
    	else
    		self:SetLayerVisible( false, self.layers.LOG_TEXT )
    	end

	elseif hSender == UI.Complaint_DurationCombobox:GetUiHandle() then
		self:UpdatePunishementBtnsStates()
	end
end

--
function UI.Complaint_Wnd:F_OnEventSaveUiState()
	if not self:IsOnScreen() then
		return
	end

	UI.store.Complaint_Wnd = {
		startParams = self.startParams
	}

	if UI.store.Complaint_Wnd.startParams then
		UI.store.Complaint_Wnd.startParams.reason = UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value
		UI.store.Complaint_Wnd.startParams.duration = UI.Complaint_DurationCombobox:GetRecordData( UI.Complaint_DurationCombobox:GetSelectedRecord() ).value
		UI.store.Complaint_Wnd.startParams.text = UI.Complaint_EditReasonWnd:GetEditText()
		UI.store.Complaint_Wnd.startParams.rules = UI.Complaint_EditRulesWnd:GetEditText()
	end
end

--
function UI.Complaint_Wnd:F_OnEventRestoreUiState()
	if UI.store and UI.store.Complaint_Wnd then
		self.startParams = UI.store.Complaint_Wnd.startParams
	end
	if self:IsOnScreen() then
		self:F_OnAfterShowOnScreen()
	end
end

--
function UI.Complaint_Wnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	UI.Complaint_ReportBtn:SetText( UI:GetStringByName( "complain_window_report" ), UI.VoteWnd_VoteBtn.layers.TEXT )
	UI.Complaint_CancelBtn:SetText( UI:GetStringByName( "close" ), UI.VoteWnd_VoteBtn.layers.TEXT )
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )	
end

--
function UI.Complaint_Wnd:GetFormatedText()
	local text = UI.Complaint_EditReasonWnd:GetEditText()
	if text == nil or text == "" then
		return ""
	end
	local additionalText = ""
	if self.startParams.tabId and UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value == MasterServer.AbuseCategory.ABUSE_CHAT_ABUSE then
		additionalText = "\n\n\nCHAT LOG:\n"
		local lastMsg = UI.Chat:GetLastMsgId()
		local count = 0
		for i = lastMsg, 1, -1 do
			local msgType = UI.Chat:GetMsgType( i, self.startParams.tabId )
			if msgType == UI.Chat.msgTypes.PRIVATE_TO or msgType == UI.Chat.msgTypes.PRIVATE_FROM or msgType == UI.Chat.msgTypes.CHANNEL then

				count = count + 1

        		-- скопирована логика из UI.ChatWnd:FormatMsgText()

        		local msgText	= UI.Chat:GetMsgLocalizedText( i, self.startParams.tabId )
        		local uid		= UI.Chat:GetMsgSenderUid( i, self.startParams.tabId )
        		local nickname	= UI.Chat:GetMsgNickname( i, self.startParams.tabId )

        		if uid ~= UI.INVALID_U64_ID then

                	local nicknameStr = ""
                	if _G.GameChat_NeedShowUids() then
                		nicknameStr = "[".._G.U64ToStr( uid ).."]["..nickname.."]"
                	else
                		nicknameStr = "["..nickname.."]"
                	end

        			if msgType == UI.Chat.msgTypes.PRIVATE_TO or msgType == UI.Chat.msgTypes.PRIVATE_FROM then

        				local prefix = ""

        				if msgType == UI.Chat.msgTypes.PRIVATE_TO then
        					prefix = UI:GetStringByName( "chat_private_to_prefix" )
        				else
        					prefix = UI:GetStringByName( "chat_private_from_prefix" )
        				end

        				msgText = string.format( prefix, nicknameStr )..": "..msgText

        			else
        				msgText = nicknameStr..": "..msgText
        			end

        		else

        			if nickname and nickname ~= "" then
        				msgText = "["..nickname.."]: "..msgText
        			end

        		end

				msgText = msgText.."\n"

				additionalText = additionalText..msgText
				if count >= 20 then
					break
				end
				if string.len( additionalText ) + string.len( text ) > self.MAX_REPORT_LENGTH then
					break
				end
			end
		end
		text = text..additionalText
	end
	return text
end

--
function UI.Complaint_Wnd:SendReport()
	local text = self:GetFormatedText()
	if text == nil or text == "" then
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "complain_window_report_error_message_empty" ), UI.MBS_OK )
		return false
	else
		if not self.startParams.isBot then
			_G.MasterServer_ReportPlayer( self.startParams.toUid, UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value, text, false )
		end
	end
	return true
end

--
function UI.Complaint_Wnd:SendMute()
	local desc = UI.Complaint_EditReasonWnd:GetEditText()
	if desc == "" then
		text = UI:GetStringByName( "admin_task_error" )
		local errorCode = "ATR_EMPTY_REASON"
		local reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		return
	end

	local rules = UI.Complaint_EditRulesWnd:GetEditText()
	if rules == "" then
		text = UI:GetStringByName( "admin_task_error" )
		local reason = UI:GetStringByName( "admin_task_error_emptyRules" )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		return
	end
	
	if not self.startParams.isBot then
		local text = self:GetFormatedText()
		_G.MasterServer_ReportPlayer( self.startParams.toUid, UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value, text, true )
		text = UI.Complaint_EditReasonWnd:GetEditText()
		local duration = UI.Complaint_DurationCombobox:GetRecordData( UI.Complaint_DurationCombobox:GetSelectedRecord() ).value
		if duration == -1 then
			_G.MasterServer_ExecAdminTask( "mutePermanent", { uid = self.startParams.toUid, reason = text,
				category = UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value, rules = rules } )
		else
			_G.MasterServer_ExecAdminTask( "mute", { uid = self.startParams.toUid, reason = text, durationInHours = duration,
				category = UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value, rules = rules } )
		end
	end
	self:Hide()
end

--
function UI.Complaint_Wnd:SendBan()
	local desc = UI.Complaint_EditReasonWnd:GetEditText()
	if desc == "" then
		text = UI:GetStringByName( "admin_task_error" )
		local errorCode = "ATR_EMPTY_REASON"
		local reason = UI:GetStringByName( errorCode )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		return
	end

	local rules = UI.Complaint_EditRulesWnd:GetEditText()
	if rules == "" then
		text = UI:GetStringByName( "admin_task_error" )
		local reason = UI:GetStringByName( "admin_task_error_emptyRules" )
		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text.." "..reason, UI.MBS_OK )
		return
	end

	if not self.startParams.isBot then
		local text = self:GetFormatedText()
		_G.MasterServer_ReportPlayer( self.startParams.toUid, UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value, text, true )
		text = UI.Complaint_EditReasonWnd:GetEditText()
		local duration = UI.Complaint_DurationCombobox:GetRecordData( UI.Complaint_DurationCombobox:GetSelectedRecord() ).value
		if duration == -1 then
			_G.MasterServer_ExecAdminTask( "banPermanent", { uid = self.startParams.toUid, reason = text,
				category = UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value, rules = rules } )
		else
			_G.MasterServer_ExecAdminTask( "ban", { uid = self.startParams.toUid, reason = text, durationInHours = duration,
				category = UI.Complaint_ReasonCombobox:GetRecordData( UI.Complaint_ReasonCombobox:GetSelectedRecord() ).value, rules = rules } )
		end
	end
	self:Hide()
end

--
function UI.Complaint_Wnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if UI.Complaint_ReportBtn == wnd then
		self:OnEnter()
	elseif UI.Complaint_CancelBtn == wnd or wnd == UI.Complaint_CrossBtn then
		self:OnEscape()
	elseif UI.Complaint_MuteBtn == wnd then
		self:SendMute()
		UI:PlayGlobalSound( UI.sounds.btnClick )
	elseif UI.Complaint_BanBtn == wnd then
		self:SendBan()
		UI:PlayGlobalSound( UI.sounds.btnClick )
	end
	return true
end

--
function UI.Complaint_Wnd:OnEnter()
	if self.mode == self.Modes.PUNISHMENT then
		return true
	end
	if self:SendReport() then
		self:Hide()
	end
	UI:PlayGlobalSound( UI.sounds.btnClick )
	return true
end

--
function UI.Complaint_Wnd:OnEscape()
	UI:PlayGlobalSound( "sound/ui/MsgHide" )
	self:UnlinkFromParent()
	return true
end


--
function UI.Complaint_Wnd:UpdatePunishementBtnsStates()

	local duration = nil

	local selRecordIdx = UI.Complaint_DurationCombobox:GetSelectedRecord()
	if selRecordIdx ~= -1 then

		local data = UI.Complaint_DurationCombobox:GetRecordData( selRecordIdx )
		duration = data.value

	end

	if UI.Complaint_MuteBtn:IsChildOf( self ) then

		local bMuteEnabled = false

		if duration ~= nil then

			if duration == -1 then
				bMuteEnabled = _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_MUTE_PERMANENT )
			else
				bMuteEnabled = _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_MUTE )
			end

		end

		UI.Complaint_MuteBtn:Enable( bMuteEnabled )

	end

	if UI.Complaint_BanBtn:IsChildOf( self ) then

		local bBanEnabled = false

		if duration ~= nil then

			if duration == -1 then
				bBanEnabled = _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_BAN_PERMANENT )
			else
				bBanEnabled = _G.MasterServer_CheckAccessPrivilege( MasterServer.Privilege.PRIV_BAN )
			end

		end

		UI.Complaint_BanBtn:Enable( bBanEnabled )

	end

end


-- ---------------------------------------------------------------------------
-- UI.Complaint_ReasonCombobox
-- ---------------------------------------------------------------------------

UI.Complaint_ReasonCombobox =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBoxLong",

		props =
		{
			name		= "Complaint_ReasonCombobox"
		},
	},

	MAX_VISIBLE_RECORDS = 5,
}

-- ---------------------------------------------------------------------------
-- UI.Complaint_DurationCombobox
-- ---------------------------------------------------------------------------

UI.Complaint_DurationCombobox =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ComboBox1",

		props =
		{
			name		= "Complaint_DurationCombobox"
		},
	},

	MAX_VISIBLE_RECORDS = 5,
}

-- ------------------------------------------------------------------------
-- UI.VoteWnd_CrossBtn
-- ------------------------------------------------------------------------

UI.Complaint_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "Complaint_CrossBtn"
		}
	}
}


-- ------------------------------------------------------------------------
-- UI.Complaint_EditReasonWnd
-- ------------------------------------------------------------------------

UI.Complaint_EditReasonWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditMultilineWnd",

     	props =
     	{
     		name			= "Complaint_EditReasonWnd",
     		activationOrder	= 1,
     		bytesLimit		= 4096,	-- константа максимального размера в байтах: 2048
    		--stringsLimit	= 128,
    		--isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "complaint_input",
    				defaultAnimation    = "desel",

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
    		textObjName				= "text",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "sel",
    		animInactive			= "desel",
			scrollBarLocator		= "scroll",
    	}
    }
}

-- ------------------------------------------------------------------------
-- UI.Complaint_EditRulesWnd
-- ------------------------------------------------------------------------

UI.Complaint_EditRulesWnd =
{
    def =
    {   	
     	className	= "EditWnd",
    	prototype	= "EffectEditMultilineWnd",

     	props =
     	{
     		name			= "Complaint_EditRulesWnd",
     		activationOrder	= 1,
     		symbolsLimit	= 251,	-- сделано как в админке ( см. #0064261, комм.(0264384) )
    		--stringsLimit	= 128,
    		--isPrototype		= true,
     	},

     	layers =
     	{
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    			  	defName				= "complaint_input",
    				defaultAnimation    = "desel",

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
    		textObjName				= "text",
    		selectionColorObjName	= "select_color",
    		cursorColorObjName		= "cursor",
    		animActive				= "sel",
    		animInactive			= "desel",
			scrollBarLocator		= "scroll",
    	}
    }
}


--
UI.Complaint_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "Complaint_CancelBtn",
			isPrototype = false,
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
					defName				= "shop_buyBtn",
					defaultAnimation    = "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "text",
							layer		= "UI.MsgBox_Btn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
						},
					}
				}}
			},

			-- TEXT
			{
				id			= l_numBaseBtnLayers,

				layerType	= UI.LAYER_TEXT,

				formatFlags	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz = { 1, 1 },
				font =
				{
					fontName = "Small",
				},
				text		= "^cancel"
			},
   		}
	},
}

UI.Complaint_CancelBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "press",
		animationPressed		= "",
		animationDisabled		= "",
		animationIdle_focus 	= "over",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

--
UI.Complaint_ReportBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "Complaint_ReportBtn",
			isPrototype = false,
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
					defName				= "shop_buyBtn",
					defaultAnimation    = "idle",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "text",
							layer		= "UI.MsgBox_Btn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
						},
					}
				}}
			},

			-- TEXT
			{
				id			= l_numBaseBtnLayers,

				layerType	= UI.LAYER_TEXT,

				formatFlags	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz = { 1, 1 },
				font =
				{
					fontName = "Small",
				},
				text		= "^complain_window_report"
			},
   		}
	},
}

UI.Complaint_ReportBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "press",
		animationPressed		= "",
		animationDisabled		= "",
		animationIdle_focus 	= "over",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}
--
UI.Complaint_MuteBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Complaint_MuteBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^complain_window_mute",
   			},
   		}
	},
}

--
UI.Complaint_BanBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "Complaint_BanBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^complain_window_ban",
   			},
   		}
	},
}