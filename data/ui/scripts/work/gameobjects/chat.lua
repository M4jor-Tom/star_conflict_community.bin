-- ----------------------------------------------------------------------------
--
-- Workfile: chat.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

if UI.Chat then
	return
else
	UI.Chat = {}
end


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Chat:AddMessage( uid, nickName, channel, text, isGm )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Chat:AddMessage()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" (u64) expected, got \"%s\"", type( uid ) )
		uid = UI.INVALID_U64_ID
	end

	if type( nickName ) ~= "string" then
		sys.log( "UI.Chat:AddMessage()[ERROR]: invalid type of the 2-nd parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		nickName = "Unknown"
	end

	if type( channel ) ~= "string" then
		sys.log( "UI.Chat:AddMessage()[ERROR]: invalid type of the 3-rd parameter (\"channel\"); \"string\" expected, got \"%s\"", type( channel ) )
		channel = "Unknown"
	end

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddMessage()[ERROR]: invalid type of the 4-th parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end
	
	if type( isGm ) ~= "boolean" then
		sys.log( "UI.Chat:AddMessage()[ERROR]: invalid type of the 5-th parameter (\"isGm\"); \"boolean\" expected, got \"%s\"", type( isGm ) )
		isGm = false
	end

	local msg = self:CreateEmptyMsg()

	msg.type			= self.msgTypes.CHANNEL
	msg.uid				= uid
	msg.nickName		= nickName
	msg.channel			= channel
	msg.text			= text	
	msg.params.isGm		= isGm

	local channelType = UI.Chat:GetChannelTypeByMsg( msg )

	if _G.GetCurrentGameMode() ~= 0 and channelType == UI.Chat.ChannelTypes.BATTLE then

		local playerInfo = _G.GetPlayerInfoByUid( uid )
		if not playerInfo then
			sys.log( "UI.Chat:AddMessage()[ERROR]: cannot find player info for uid %s", _G.U64ToStr( uid ) )
		end

		local localPlayerInfo = _G.GetPlayerInfo( _G.Game_LocalClientNum() )

		if ( playerInfo and localPlayerInfo and playerInfo.team == localPlayerInfo.team ) or _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE then
			msg.color = self.colorIds.PARTY
		else
			msg.color = self.colorIds.ENEMY
		end

	elseif channelType == UI.Chat.ChannelTypes.SQUAD or channelType == UI.Chat.ChannelTypes.LOBBY then
	
		msg.color = self.colorIds.RAID
	

	elseif channelType == UI.Chat.ChannelTypes.CLAN then

		msg.color = self.colorIds.GUILD

	else

		msg.color = self.colorIds.SAY
	
	end

	self:AddMsgInternal( msg )

end

--
function UI.Chat:AddClanMotD( text )
	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddClanMotD()[ERROR]: invalid type of the 1-th parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end
	local msg = self:CreateEmptyMsg()
	msg.type		= self.msgTypes.MOTD
	msg.uid			= UI.INVALID_U64_ID
	msg.nickName	= ""
	msg.channel		= self.clanChannel
	msg.text		= text	
	msg.params.isGm	= false
	msg.color		= self:GetMsgTypeColor( msg.type )
	self:AddMsgInternal( msg )
end

--
function UI.Chat:AddPrivateMessage( uid, nickName, text, to, isGm )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Chat:AddPrivateMessage()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" (u64) expected, got \"%s\"", type( uid ) )
		uid = UI.INVALID_U64_ID
	end

	if type( nickName ) ~= "string" then
		sys.log( "UI.Chat:AddPrivateMessage()[ERROR]: invalid type of the 2-nd parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		nickName = "Unknown"
	end

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddPrivateMessage()[ERROR]: invalid type of the 3-rd parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end

	local msg = self:CreateEmptyMsg()

	if to then
		msg.type	= self.msgTypes.PRIVATE_TO
	else
		msg.type	= self.msgTypes.PRIVATE_FROM
	end
	msg.color		= self:GetMsgTypeColor( msg.type )
	msg.uid			= uid
	msg.nickName	= nickName
	msg.text		= text	
	msg.params.isGm	= isGm

	self:AddMsgInternal( msg )

	UI:PlayGlobalSound( "sound/ui/incomingPrivateMessage" )

end


--
function UI.Chat:AddQuestMessage( nickName, text )

	if type( nickName ) ~= "string" then
		sys.log( "UI.Chat:AddQuestMessage()[ERROR]: invalid type of the 1-st parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		nickName = "no nickname"
	end

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddQuestMessage()[ERROR]: invalid type of the 2-nd parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end

	local msg = self:CreateEmptyMsg()

	msg.type		= self.msgTypes.QUEST
	msg.color		= self:GetMsgTypeColor( msg.type )
	msg.nickName	= nickName
	msg.text		= text

	self:AddMsgInternal( msg )

end


--
function UI.Chat:AddGameplayMessage( uid, nickName, text )

	if type( nickName ) ~= "string" then
		sys.log( "UI.Chat:AddPrivateMessage()[ERROR]: invalid type of the 2-nd parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		nickName = "Unknown"
	end

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddGameplayMessage()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end

	local msg = self:CreateEmptyMsg()

	msg.type		= self.msgTypes.GAMEPLAY
	msg.color		= self:GetMsgTypeColor( msg.type )
	msg.nickName	= nickName
	msg.uid			= uid
	msg.text		= text

	self:AddMsgInternal( msg )

end


--
function UI.Chat:AddSystemMessageWithNicknames( uid, nickName, text, defs )

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddSystemMessageWithNicknames()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end

	local msg = self:CreateEmptyMsg()

	msg.type	= self.msgTypes.SYSTEM_WITH_NICKNAMES
	msg.color	= self:GetMsgTypeColor( msg.type )
	msg.nickName = nickName
	msg.uid 	= uid
	msg.text	= text	
	msg.defs 	= defs

	self:AddMsgInternal( msg )
	
end 


--
function UI.Chat:AddScreenshotMessage( fileName )

	local msg = self:CreateEmptyMsg()

	msg.type	= self.msgTypes.SCREENSHOT
	msg.color	= self:GetMsgTypeColor( msg.type )
	msg.data 	= fileName

	self:AddMsgInternal( msg )
	
end 


--
function UI.Chat:AddLobbyInviteMessage( uid, nickName, text, lid )

	local msg = self:CreateEmptyMsg()

	msg.type	= self.msgTypes.LOBBY_INVITE
	msg.color	= self:GetMsgTypeColor( msg.type )
	msg.nickName = nickName
	msg.uid 	= uid
	msg.data 	= lid
	msg.text 	= text

	self:AddMsgInternal( msg )
	
end 


--
function UI.Chat:AddSystemMessage( text, colorId )

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddSystemMessage()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end

	if colorId ~= nil then
		if type( colorId ) == "number" then
			if UI:Val2Key( self.colorIds, colorId ) == "" then
				sys.log( "UI.Chat:AddSystemMessage()[ERROR]: invalid colorId %d", colorId )
				colorId = nil
			end
		else
			sys.log( "UI.Chat:AddSystemMessage()[ERROR]: invalid type of the 2-nd parameter (\"colorId\"); \"colorId\" or \"nil\" expected, got \"%s\"", type( colorId ) )
			colorId = nil
		end
	end

	local msg = self:CreateEmptyMsg()

	msg.type	= self.msgTypes.SYSTEM
	msg.color	= colorId or self:GetMsgTypeColor( msg.type )
	msg.text	= text	

	self:AddMsgInternal( msg )
	
end


--
function UI.Chat:AddSystemMessageForChannel( text, channel, colorId )

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:AddSystemMessageForChannel()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		text = "no text"
	end

	if type( channel ) ~= "string" then
		sys.log( "UI.Chat:AddSystemMessageForChannel()[ERROR]: invalid type of the 2-nd parameter (\"channel\"); \"string\" expected, got \"%s\"", type( channel ) )
		channel = ""
	end

	if colorId ~= nil then
		if type( colorId ) == "number" then
			if UI:Val2Key( self.colorIds, colorId ) == "" then
				sys.log( "UI.Chat:AddSystemMessageForChannel()[ERROR]: invalid colorId %d", colorId )
				colorId = nil
			end
		else
			sys.log( "UI.Chat:AddSystemMessageForChannel()[ERROR]: invalid type of the 3-rd parameter (\"colorId\"); \"colorId\" or \"nil\" expected, got \"%s\"", type( colorId ) )
			colorId = nil
		end
	end

	local msg = self:CreateEmptyMsg()

	msg.type	= self.msgTypes.CHANNEL
	msg.color	= colorId or self:GetMsgTypeColor( self.msgTypes.SYSTEM )
	msg.channel	= channel
	msg.text	= text

	self:AddMsgInternal( msg )

end


--
function UI.Chat:AddBattleLogMsg( id, params )
	if type( id ) ~= "string" then
		sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		return
	end

	local msg = self:CreateEmptyMsg()
	msg.type	= self.msgTypes.BATTLE_LOG_WIDE
	msg.color	= self:GetMsgTypeColor( msg.type )
	msg.channel= "battleLog"
	
	if id == "kill" then
		if type( params ) ~= "table" then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: for first param id == \"kill\" invalid type of the 2-st parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
			return
		end
		if not params.killer or type( params.killer ) ~= "table" or not params.victim or type( params.victim ) ~= "table" or not params.itemDefName or type( params.itemDefName ) ~= "string" then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		if params.killer.isDef == nil or type( params.killer.isDef ) ~= "boolean" or 
			not params.killer.name or type( params.killer.name ) ~= "string" or 
			not params.killer.uid or type( params.killer.uid ) ~= "userdata" or
			not params.killer.isShip == nil or type( params.killer.isShip ) ~= "boolean" 
		then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param.killer table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		if params.victim.isDef == nil or type( params.victim.isDef ) ~= "boolean" or 
			not params.victim.name or type( params.victim.name ) ~= "string" or 
			not params.victim.uid or type( params.victim.uid ) ~= "userdata" 
		then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param.victim table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		if params.numAssists then 
			if not type( params.numAssists ) == "number" or not params.damagePercent or not type( params.damagePercent ) == "number" then
				sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
				return
			end
			
		end
		msg.additionType = "kill"
		msg.killer = params.killer
		msg.victim = params.victim
		msg.itemDefName = params.itemDefName
		if params.numAssists then
			msg.numAssists = params.numAssists
			msg.damagePercent = params.damagePercent
		end

		-- hack: battle log visiblem, when battle is ended. This mean that entity may be not valid. Save localized name right now
		if msg.itemDefName == "(crash)" and not msg.killer.isShip then
			msg.killer.localizedName = ""
		else
			if msg.killer.playerId == -1 then
				--params.killer.name
				if params.killer.isShip then
					msg.killer.localizedName = UI:GetBotNameByDef( params.killer.name )
				else
					msg.killer.localizedName = UI:GetEntityLocalizedNameByDef( params.killer.name, false, false, false )
				end
			end
		end

		if params.victim.isShip then
			if msg.victim.playerId == -1 then
				msg.victim.localizedName = UI:GetBotNameByDef( params.victim.name )
			end
		else
			msg.victim.localizedName = UI:GetEntityLocalizedNameByDef( params.victim.name, false, false, false )
		end

		-- disable kill messages in battle channel
		--[[if cvars.cl_combatLogInChat > 0 then
			local msgT = {}
			UI:CopyTable( msg, msgT )
			msgT.type	= self.msgTypes.BATTLE_LOG
			msgT.color	= self.colorIds.BATTLE_LOG
			msgT.channel= "#battle_111"
			self:AddMsgInternal( msgT )
		end]]
		
	elseif id == "kill_assist" then
		if type( params ) ~= "table" then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: for first param id == \"kill\" invalid type of the 2-st parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
			return
		end
		if not params.assistant or type( params.assistant ) ~= "table" then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		if params.assistant.isDef == nil or type( params.assistant.isDef ) ~= "boolean" or 
			not params.assistant.name or type( params.assistant.name ) ~= "string" or 
			not params.assistant.uid or type( params.assistant.uid ) ~= "userdata" 
		then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param.killer table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		if params.damage ~= nil and type( params.damage ) ~= "number" then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		if params.buffs ~= nil and type( params.buffs ) ~= "table" then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		if params.debuffs ~= nil and type( params.debuffs ) ~= "table" then
			sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: invalid param table. See description in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua" )
			return
		end
		
		msg.additionType = "kill_assistant"
		msg.assistant = params.assistant
		msg.damage = params.damage
		msg.buffs = params.buffs
		msg.debuffs = params.debuffs

	elseif id == "clanship_damage" then

		msg = nil

	else
		sys.log( "UI.Chat:AddBattleLogMsg()[ERROR]: unknown id %s. See awailable id in UI:GameChat_AddBattleLogMessage( id, params ) in uipublic.lua", id )
		return
	end

	if msg then
		self:AddMsgInternal( msg )
	end

end


--
function UI.Chat:AddSquadFinderGroupCreateMessage( params )

	local msg = self:CreateEmptyMsg()

	msg.type	= self.msgTypes.SQUAD_FINDER
	msg.color	= self:GetMsgTypeColor( msg.type )
	msg.data	= params

	self:AddMsgInternal( msg )

end


--
function UI.Chat:ClearMessages()

	--self:InitDefaultTab()

	for i = 1, #self.Tabs do
		self:ClearTab( i )
	end

	UI:SendUiEvent( UI.EV_CHAT_CLEAR, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.Chat:ClearTab( tabIdx )

	local tab 
	if tabIdx ~= nil then
		if not self.Tabs[ tabIdx ] then
			sys.log( "UI.Chat:ClearTab()[ERROR]: param tabIdx(%d) out of range", tabIdx )
			return
		end
		tab = self.Tabs[ tabIdx ]
	else
		if not self.Tabs[ self.currentTabId ] then
			sys.log( "UI.Chat:ClearTab()[ERROR]: self.currentTabId(%d) out of range", tabIdx )
			return
		end
		tab = self.Tabs[ self.currentTabId ]
	end

	-- subscribe to tab's channels and init it
	tab.msgs		= {}
	tab.firstMsgId	= UI.Chat.firstMsgId
	tab.numMsgs		= UI.Chat.numMsgs
	tab.history		= {}
	tab.historyIdx	= UI.Chat.historyIdx
	tab.data.tabIdx	= tabIdx
	tab.bHidden		= false

	if tabIdx~= nil then
		if tabIdx == self.currentTabId then
			UI:SendUiEvent( UI.EV_CHAT_CLEAR, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )
		end
	else
		UI:SendUiEvent( UI.EV_CHAT_CLEAR, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )
	end

end


--
function UI.Chat:OnUserJoin( uid, nickName, channel )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Chat:OnUserJoin()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" (u64) expected, got \"%s\"", type( uid ) )
		uid = UI.INVALID_U64_ID
	end

	if type( nickName ) ~= "string" then
		sys.log( "UI.Chat:OnUserJoin()[ERROR]: invalid type of the 2-nd parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		nickName = "Unknown"
	end

	if type( channel ) ~= "string" then
		sys.log( "UI.Chat:OnUserJoin()[ERROR]: invalid type of the 3-rd parameter (\"channel\"); \"string\" expected, got \"%s\"", type( channel ) )
		channel = "Unknown"
	end

	local msg = self:CreateEmptyMsg()

	msg.type		= self.msgTypes.JOIN
	msg.color		= self:GetMsgTypeColor( msg.type )
	msg.uid			= uid
	msg.nickName	= nickName
	msg.channel		= channel

	self:AddMsgInternal( msg )

end


--
function UI.Chat:OnUserLeave( uid, nickName, channel )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Chat:OnUserLeave()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" (u64) expected, got \"%s\"", type( uid ) )
		uid = UI.INVALID_U64_ID
	end

	if type( nickName ) ~= "string" then
		sys.log( "UI.Chat:OnUserLeave()[ERROR]: invalid type of the 2-nd parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		nickName = "Unknown"
	end

	if type( channel ) ~= "string" then
		sys.log( "UI.Chat:OnUserLeave()[ERROR]: invalid type of the 3-rd parameter (\"channel\"); \"string\" expected, got \"%s\"", type( channel ) )
		channel = "Unknown"
	end

	-- в дебажном чате сообщения данного типа вообще не рисуются; их надо, нет??
	if true then
		return
	end

	local msg = self:CreateEmptyMsg()

	msg.type		= self.msgTypes.LEAVE
	msg.color		= self:GetMsgTypeColor( msg.type )
	msg.uid			= uid
	msg.nickName	= nickName
	msg.channel		= channel

	self:AddMsgInternal( msg )

end


--
function UI.Chat:OnMuted( time )

	if type( time ) ~= "number" then
		sys.log( "UI.Chat:OnMuted()[ERROR]: invalid type of the 1-st parameter (\"time\"); \"number\" expected, got \"%s\"", type( time ) )
		time = 0
	end

	local msg = self:CreateEmptyMsg()

	msg.type				= self.msgTypes.IGNORED
	msg.color				= self:GetMsgTypeColor( msg.type )
	msg.params.ignoreTime	= time

	self:AddMsgInternal( msg )

end


--
function UI.Chat:OnNickList( uid, nickName, channel )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Chat:OnNickList()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" (u64) expected, got \"%s\"", type( uid ) )
		uid = UI.INVALID_U64_ID
	end

	if type( nickName ) ~= "string" then
		sys.log( "UI.Chat:OnNickList()[ERROR]: invalid type of the 2-nd parameter (\"nickName\"); \"string\" expected, got \"%s\"", type( nickName ) )
		nickName = "Unknown"
	end

	if type( channel ) ~= "string" then
		sys.log( "UI.Chat:OnNickList()[ERROR]: invalid type of the 3-rd parameter (\"channel\"); \"string\" expected, got \"%s\"", type( channel ) )
		channel = "Unknown"
	end

	local msg = self:CreateEmptyMsg()

	msg.type		= self.msgTypes.LIST
	msg.color		= self:GetMsgTypeColor( msg.type )
	msg.uid			= uid
	msg.nickName	= nickName
	msg.channel		= channel

	self:AddMsgInternal( msg )

end


--
function UI.Chat:OnFinishNickList( channel, usersCount )

	if type( channel ) ~= "string" then
		sys.log( "UI.Chat:OnFinishNickList()[ERROR]: invalid type of the 1-st parameter (\"channel\"); \"string\" expected, got \"%s\"", type( channel ) )
		channel = "Unknown"
	end

	if type( usersCount ) ~= "number" then
		sys.log( "UI.Chat:OnFinishNickList()[ERROR]: invalid type of the 2-nd parameter (\"usersCount\"); \"number\" expected, got \"%s\"", type( usersCount ) )
		number = 0
	end

	local msg = self:CreateEmptyMsg()

	msg.type				= self.msgTypes.LIST_TOTAL
	msg.color				= self:GetMsgTypeColor( msg.type )
	msg.params.usersCount	= usersCount

	self:AddMsgInternal( msg )

end


--
function UI.Chat:GetNumMsgs( tabId )

	if tabId == nil then
		tabId = self.currentTabId
	end

	if not self.Tabs[ tabId ] then
		--sys.log( "UI.Chat:GetNumMsgs()[ERROR]: self.currentTabId(%d) out of range", self.currentTabId )
		return 0
	end

	local tab = self.Tabs[ tabId ]

	return tab.numMsgs

end


--
function UI.Chat:GetFirstMsgId( tabId )

	if tabId == nil then
		tabId = self.currentTabId
	end

	if not self.Tabs[ tabId ] then
		--sys.log( "UI.Chat:GetFirstMsgId()[ERROR]: self.currentTabId(%d) out of range", self.currentTabId )
		return -1
	end

	local tab = self.Tabs[ tabId ]
	return tab.firstMsgId

end


--
function UI.Chat:GetLastMsgId( tabId )

	if tabId == nil then
		tabId = self.currentTabId
	end

	if not self.Tabs[ tabId ] then
		--sys.log( "UI.Chat:GetLastMsgId()[ERROR]: self.currentTabId(%d) out of range", self.currentTabId )
		return -1
	end

	local tab = self.Tabs[ tabId ]

	if tab.numMsgs == 0 then
		return -1
	end

	return tab.firstMsgId + tab.numMsgs - 1

end


--
function UI.Chat:GetMsg( id, tab )

	if not tab then 
		tab = self.currentTabId
	end

	if not self.Tabs[ tab ] then
		sys.log( "UI.Chat:GetMsg()[ERROR]: tab(%d) out of range", tab )
		return nil
	end

	local tab = self.Tabs[ tab ]

	return tab.msgs[ id ]

end


--
function UI.Chat:HandleInput( text )

	if type( text ) ~= "string" then
		sys.log( "UI.Chat:HandleInput()[ERROR]: invalid type of the 1-st parameter (\"text\"); \"string\" expected, got \"%s\"", type( text ) )
		return
	end

	--[[if not self:IsInInputMode() then
		sys.log( "UI.Chat:HandleInput()[ERROR]: chat is not in input mode" )
		return
	end]]

	if UI:IsStrEmpty( text ) then
		return
	end


	local command = string.match( text, "^/([^%s]+)" )
	local bWisper = command == "w" or command == "whisper"

	if self:GetTabType( self.currentTabId ) == "WHISPER" then
		if not bWisper then
			self:AddSystemMessage( UI:GetStringByName( "chat_notWhisper" ) )
			return
		end
	--[[else
		-- SC-116173. В связи с плачевной ситуацией в мире, вынуждены отключить чат
		if not command and ( cvars.cl_versionType == "live" or cvars.cl_versionType == "pubtest" )then
			self:AddSystemMessage( UI:GetStringByName( "chat_notAvailable" ) )
			return
		end]]

	--[[else
		-- SC-116305
		if not command and not self:CanInput() then
			return
		end]]
	end

	local bAllowTradingLinks = true

	if not bWisper then
		local curTab = self.Tabs[ self.currentTabId ]
		if curTab and ( curTab.type == "GLOBAL" or curTab.type == "BATTLE_LOG" ) then
			bAllowTradingLinks = false
		end
	end

	local textToSend = text

	if not bAllowTradingLinks then
		textToSend = UI.EffectEditLinksWnd:Transfer2Plain( text )
	end

	_G.GameChat_HandleInput( textToSend )

	self:AddHistory( text )

end


-- SC-116305. Временное решение органичения ввода в чат из логики торговли
function UI.Chat:CanInput()

	local minBattles			= UI:GetTradingSellerMinBattles()
	local playerBattles 		= _G.MasterServer_GetAntibotCounter()

	local bInputEnable = ( minBattles == -1 ) or ( minBattles <= playerBattles )

	if not bInputEnable then

		local text = UI:GetStringByName( "chat_invalidNumBattles" )
		local strNumBattles = string.format( "%d/%d", playerBattles, minBattles )

		local numSubst = 0
		text, numSubst = string.gsub( text, "%$num_battles%$", strNumBattles )
		if numSubst == 0 then
			sys.log( "UI.Chat:CanInput()[ERROR]: cannot find placeholder '$num_battles$' in string 'chat_invalidNumBattles'" )
			text = string.format( "[INVALID STRING]Num battles required: %s", strNumBattles )
		end

		self:AddSystemMessage( text )

	end

	return bInputEnable

end


--
function UI.Chat:Show()

	if self:IsVisible() then
		return
	end

	if UI.ChatWnd and UI.ChatWnd.w then
		UI.ChatWnd:Show()
	else
		sys.log( "UI.Chat:Show()[ERROR]: cannot find table \"UI.ChatWnd\"" )
	end

end


--
function UI.Chat:Hide()

	if not self:IsVisible() then
		return
	end

	self:StopInput()

	UI.ChatWnd:Hide()

end


--
function UI.Chat:IsVisible()

	return UI.ChatWnd and UI.ChatWnd.w and UI.ChatWnd:IsOnScreen()

end


--
function UI.Chat:StartInput( bSound )

	if self:IsInInputMode() then
		return
	end

	if not self:IsVisible() then
		sys.log( "UI.Chat:StartInput()[ERROR]: chat is not visible" )
		return
	end

	if UI.ChatWnd and UI.ChatWnd.w then
		UI.ChatWnd:StartInput( bSound )
	end

end


--
function UI.Chat:StopInput()

	if not self:IsInInputMode() then
		return
	end

	if UI.ChatWnd and UI.ChatWnd.w then
		UI.ChatWnd:StopInput()
	end

end


--
function UI.Chat:IsInInputMode()

	if not UI.ChatWnd or not UI.ChatWnd.w then
		return false
	end

	return UI.ChatWnd:IsInInputMode()

end

--
function UI.Chat:GetMsgChannel( msgId, tab )
	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgNickname()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return ""
	end
	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgType()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return 0
	end
	if msg.channel then return msg.channel end
	return ""
end

--
function UI.Chat:GetMsgType( msgId, tab )

	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgNickname()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return ""
	end
	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgType()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return 0
	end
	return msg.type
end

--
function UI.Chat:GetMsgSenderUid( msgId, tab )
	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgSenderUid()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return ""
	end
	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgSenderUid()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return u64( 0, 0 )
	end
	if msg.type == UI.Chat.msgTypes.QUEST then
		return u64( 0, 0 )
	elseif msg.uid then
		return msg.uid
	else
		sys.log( "UI.Chat:GetMsgSenderUid()[ERROR]: msg.uid is nil for type '%s'", UI:Val2Key( UI.Chat.msgTypes, msg.type ) )
		return u64( 0, 0 )
	end
end

--
function UI.Chat:GetMsgColors( msgId, tab )
	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgColors()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return ""
	end
	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgColors()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return nil
	end
	if msg.colors == nil then
		sys.log( "UI.Chat:GetMsgColors()[ERROR]: cannot find colors for msgType '%s'", UI:Val2Key( UI.Chat.msgTypes, msg.type ) )
		return {}
	end
	return msg.colors
end

--
function UI.Chat:GetMsgDefs( msgId, tab )
	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgDefs()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return ""
	end
	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgDefs()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return nil
	end
	if msg.defs == nil then
		sys.log( "UI.Chat:GetMsgDefs()[ERROR]: cannot find defs for msgType '%s'", UI:Val2Key( UI.Chat.msgTypes, msg.type ) )
		return {}
	end
	return msg.defs
end

--
function UI.Chat:GetMsgAdditionalData( msgId, tab )
	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgAdditionalData()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return ""
	end
	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgAdditionalData()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return nil
	end
	return msg.data
end

--
function UI.Chat:GetMsgNickname( msgId, tab )
	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgNickname()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return ""
	end
	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgNickname()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return ""
	end
	if msg.type == UI.Chat.msgTypes.SYSTEM_WITH_NICKNAMES or msg.type == UI.Chat.msgTypes.KILL_MESSAGE then
		if type( msg.nickName ) == "table" then
			for k, v in pairs( msg.nickName ) do 
				v = UI:ShieldSpecSymbolsForMetatext( v )
			end
			return msg.nickName
		else
			return UI:ShieldSpecSymbolsForMetatext( msg.nickName )
		end
	elseif msg.type == UI.Chat.msgTypes.QUEST then
		return msg.nickName
	elseif msg.nickName then
		return UI:ShieldSpecSymbolsForMetatext( msg.nickName )
	else
		sys.log( "UI.Chat:GetMsgNickname()[ERROR]: cannot find nickanmes for msgType '%s'", UI:Val2Key( UI.Chat.msgTypes, msg.type ) )
		return ""
	end
end

--
function UI.Chat:GetMsgLocalizedText( msgId, tab )

	local text = ""

	if type( msgId ) ~= "number" then
		sys.log( "UI.Chat:GetMsgLocalizedText()[ERROR]: invalid type of the 1-st parameter (\"msgId\"); \"number\" expected, got \"%s\"", type( msgId ) )
		return text
	end

	local msg = self:GetMsg( msgId, tab )
	if not msg then
		sys.log( "UI.Chat:GetMsgLocalizedText()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return text
	end

	if msg.type == UI.Chat.msgTypes.PRIVATE_TO or msg.type == UI.Chat.msgTypes.PRIVATE_FROM or msg.type == UI.Chat.msgTypes.CHANNEL then

		local userText	= UI:ShieldSpecSymbolsForMetatext( msg.text )
		return userText

	elseif msg.type == UI.Chat.msgTypes.SYSTEM then

		text = UI:ShieldSpecSymbolsForMetatext( msg.text )
	
	elseif msg.type == UI.Chat.msgTypes.JOIN then

		text = UI:GetStringByName( "chat_playerJoinChannel" )
		text = self:FormatTextDefault( text, msg )		

	-- в дебажном чате сообщения данного типа вообще не рисуются; их надо, нет??
	elseif msg.type == UI.Chat.msgTypes.LEAVE then

		text = UI:GetStringByName( "chat_playerLeaveChannel" )
		text = self:FormatTextDefault( text, msg )		

	elseif msg.type == UI.Chat.msgTypes.LIST then

		text = UI:ShieldSpecSymbolsForMetatext( msg.nickName )

	elseif msg.type == UI.Chat.msgTypes.LIST_TOTAL then

		text = UI:GetStringByName( "chat_totalUsers" )
		text = self:FormatTextDefault( text, msg )			

	elseif msg.type == UI.Chat.msgTypes.IGNORED then

		text = UI:GetStringByName( "chat_playerIgnored" )
		text = self:FormatTextDefault( text, msg )		

	elseif msg.type == UI.Chat.msgTypes.BATTLE_LOG or msg.type == UI.Chat.msgTypes.BATTLE_LOG_WIDE then

		text = UI:ShieldSpecSymbolsForMetatext( msg.text )

	elseif msg.type == UI.Chat.msgTypes.GAMEPLAY then

		text = msg.text

	elseif msg.type == UI.Chat.msgTypes.QUEST then

		text = msg.text

	elseif msg.type == UI.Chat.msgTypes.SYSTEM_WITH_NICKNAMES then

		text = msg.text

	elseif msg.type == UI.Chat.msgTypes.SCREENSHOT or msg.type == UI.Chat.msgTypes.LOBBY_INVITE then

		text = msg.text

	elseif msg.type == UI.Chat.msgTypes.MOTD then

		text = msg.text

	elseif msg.type == UI.Chat.msgTypes.KILL_MESSAGE then

		text = msg.text
		
	elseif msg.type == UI.Chat.msgTypes.SQUAD_FINDER then
		
		text = msg.text

	else
		if msg.text then
			sys.log( "UI.Chat_ListWnd:GetMsgText()[ERROR]: unhandled msg type: %s", tostring( msg.type ) )
		end
	end	

	return text

end  


--
function UI.Chat:GetHistoryPrev()

	if not self.Tabs[ self.currentTabId ] then
		sys.log( "UI.Chat:GetHistoryPrev()[ERROR]: self.currentTabId(%d) out of range", self.currentTabId )
		return
	end

	local tab = self.Tabs[ self.currentTabId ]

	if tab.historyIdx == -1 then
		return ""
	end

	tab.historyIdx = tab.historyIdx - 1
	if tab.historyIdx < 1 then
		tab.historyIdx = 1
	end

	return tab.history[ tab.historyIdx ] or ""

end


--
function UI.Chat:GetHistoryNext()

	if not self.Tabs[ self.currentTabId ] then
		sys.log( "UI.Chat:GetHistoryNext()[ERROR]: self.currentTabId(%d) out of range", self.currentTabId )
		return
	end

	local tab = self.Tabs[ self.currentTabId ]

	if tab.historyIdx == -1 then
		return ""
	end

	local historyCount = #tab.history

	tab.historyIdx = tab.historyIdx + 1
	if tab.historyIdx > historyCount then
		tab.historyIdx = historyCount
	end

	return tab.history[ tab.historyIdx ] or ""

end


--
function UI.Chat:OnAfterActivateWithSlash()

	if not self:IsInInputMode() then
		sys.log( "UI.Chat:OnAfterActivateWithSlash()[ERROR]: not in input mode" )	
	end

	UI.ChatWnd:OnAfterActivateWithSlash()

end


--
function UI.Chat:OnChatPageUpBind()

	if not self:IsVisible() then
		sys.log( "UI.Chat:OnChatPageUpBind()[ERROR]: not visible" )	
		return
	end

	UI.ChatWnd:OnChatPageUpBind()

end


--
function UI.Chat:OnChatPageDownBind()

	if not self:IsVisible() then
		sys.log( "UI.Chat:OnChatPageDownBind()[ERROR]: not visible" )	
		return
	end

	UI.ChatWnd:OnChatPageDownBind()

end


--
function UI.Chat:GetTabCount()

	return #self.Tabs

end


--
function UI.Chat:GetTabUIData( tabType )

	local tabIdx = UI.Chat:GetTabIdx( tabType )

	if not self.Tabs[ tabIdx ] then
		sys.log( "UI.Chat:GetTabUIData()[ERROR]: tab idx %d out of range", tabIdx )
		return nil
	end

	return self.Tabs[ tabIdx ].data

end


--
function UI.Chat:GetTabType( tabIdx )

	if not self.Tabs[ tabIdx ] then
		sys.log( "UI.Chat:GetTabType()[ERROR]: tab idx %d out of range", tabIdx )
		return nil
	end

	return self.Tabs[ tabIdx ].type

end


--
function UI.Chat:GetTabIdx( tabType )

	for tabIdx, tab in pairs( self.Tabs ) do
		if tab.type == tabType then
			return tabIdx
		end
	end

	return -1

end


--
function UI.Chat:IsTabVisible( tabIdx )

	local bVisible = false

	if type( tabIdx ) ~= "number" then
		sys.log( "UI.Chat:IsTabVisible()[ERROR]: invalid type of the 1-st parameter (\"tabIdx\"); \"number\" expected, got \"%s\"", type( tabIdx ) )
		return bVisible
	end

	if not self.Tabs[ tabIdx ] then
		sys.log( "UI.Chat:IsTabVisible()[ERROR]: invalid tab idx %d", tabIdx )
	end

	bVisible = self.Tabs[ tabIdx ].bHidden ~= true

	return bVisible

end


--
function UI.Chat:JoinBattleChannel()

	if _G.GameChat_IsConnected() and network.isMultiplayer then
		local localPlayerInfo = _G.GetPlayerInfo( _G.Game_LocalClientNum() )
		local sessionId = _G.MasterServer_GetSessionId()
		if self.battleChannel ~= nil then 
			--sys.log( "UI.Chat:JoinBattleChannel()[ERROR]: self.battleChannel is not nil." )
			self:LeaveBattleChannel()
		end
		-- players from different teams can talk to each other during practice #0024571
		if localPlayerInfo and sessionId then
			-- note that ai.Gameplay.PRACTICE is no longer being used for multiplayer server-side practice
			-- instead, it's being used for the so-called "first fight" (against special easy bots, client-side)
			-- so, this piece of code is harmless
			local gameMode = _G.GetCurrentGameMode()
			if gameMode == ai.Gameplay.PRACTICE or gameMode == ai.Gameplay.FREE_SPACE then
				UI.Chat.battleChannel = "#battle_" .. _G.U64ToStr( sessionId )
			else
				UI.Chat.battleChannel = "#battle_" .. _G.U64ToStr( sessionId ) .. "_" .. localPlayerInfo.team
			end
			
			self.Tabs[ 1 ].tempWriteChannel = self.Tabs[ 1 ].writeChannel
			self.Tabs[ 1 ].writeChannel = nil
			self.Tabs[ 1 ].writeChannelType = { UI.Chat.ChannelTypes.BATTLE }
			
			--sys.log( "GameChat_Join: %s", UI.Chat.battleChannel )
			_G.GameChat_Join( UI.Chat.battleChannel )
		end
		self:SetTab( self.currentTabId, true )
	end

end


--
function UI.Chat:LeaveBattleChannel()

	if _G.GameChat_IsConnected() then
		if not self.battleChannel then 
			--sys.log( "UI.Chat:LeaveBattleChannel()[ERROR]: self.battleChannel is nil." )
			return
		end
		if self.Tabs[ 1 ].tempWriteChannel then
			self.Tabs[ 1 ].writeChannel = self.Tabs[ 1 ].tempWriteChannel
			self.Tabs[ 1 ].writeChannelType = {}
			self.Tabs[ 1 ].tempWriteChannel = nil
		end
		--sys.log( "GameChat_Leave: %s", self.battleChannel )
		_G.GameChat_Leave( self.battleChannel );
		self.battleChannel = nil
		self:SetTab( self.currentTabId, true )
	end

end


--
function UI.Chat:AddTabSorted( newTab )

	for tabIdx, tab in pairs( self.Tabs ) do
		if tab.type == newTab.type then
			sys.log( "UI.Chat:AddTabSorted()[ERROR]: tab %s already exists", newTab.type )
			return tabIdx
		end
	end

	local selTab = self.Tabs[ self.currentTabId ]

	table.insert( self.Tabs, newTab )

	local function fnSort( tab1, tab2 )

		local sortId1 = tab1.sortId or -1
		local sortId2 = tab2.sortId or -1

		return sortId1 < sortId2

	end

	table.sort( self.Tabs, fnSort )

	local newTabIdx = -1
	local selTabIdx = -1

	for tabIdx, tab in pairs( self.Tabs ) do

		if tab == newTab then
			newTabIdx = tabIdx
		end

		if tab == selTab then
			selTabIdx = tabIdx
		end

	end

	self.currentTabId = selTabIdx

	return newTabIdx

end


--
function UI.Chat:JoinLobbyChannel( bUpdateChatWnd )

	if bUpdateChatWnd == nil then
		bUpdateChatWnd = true
	end

	if not UI.Lobby:IsInLobby() then
		return
	end
	
	UI.Chat:Connect( true )

	if self.lobbyChannel ~= nil then 
		--sys.log( "UI.Chat:JoinBattleChannel()[ERROR]: self.battleChannel is not nil." )
	end

	self.lobbyChannel = UI.Chat.ChanelTypeName.LOBBY .. "_" .. _G.U64ToStr( UI.Lobby:GetMyLobby().lid )
	_G.GameChat_Join( self.lobbyChannel )

	local newTabIdx = UI.Chat:GetTabIdx( "LOBBY" )
	if newTabIdx == -1 then

    	local tab = {}
    	UI:CopyTable( UI.Chat.predefinedTabs.LOBBY, tab )
    	newTabIdx = self:AddTabSorted( tab )
		self:ClearTab( newTabIdx )

	end

	if bUpdateChatWnd then
		UI.ChatWnd:FullUpdate()
	end

end    


--
function UI.Chat:LeaveLobbyChannel()
	if self.lobbyChannel == nil then
		sys.log( "UI.Chat:RemoveSquadTab()[ERROR]: self.battleChannel is nil." )
	else
		local removedTab = self:RemoveTab( "LOBBY" )
		if self.currentTabId == removedTab then
			self:SetTab( 1 )
		end
		--sys.log( "GameChat_Leave: %s", self.squadChannel )
		_G.GameChat_Leave( self.lobbyChannel );
		self.lobbyChannel = nil
		UI.ChatWnd:FullUpdate()
	end
end

--
function UI.Chat:Connect( full )

	if full and self.isInited then
		return
	end

	if not self.isInited then
		-- first connect
		self.isInited = true
		self.battleChannel	= nil
		self.lobbyChannel	= nil
		self.squadChannel	= nil
		self.clanChannel	= nil
		self.tradingChannel = nil
		self.general		= nil
		self.Tabs			= {}
		self.currentTabId	= 0
		self:InitGlobalTab()
		self:ClearMessages()
		self:SetTab( 1 )
	else
		
	end

	if UI.Squad:IsInSquad() then
		UI.Chat:AddSquadTab( false )
	end
	if UI.Clan:IsInClan() then
		UI.Chat:AddClanTab( false )
	end
	if UI.Lobby:IsInLobby() then
		UI.Chat:JoinLobbyChannel( false )
	end

	-- subscribe to tab's channels and init it
	for i = 1, #self.Tabs do
		for k, v in pairs( self.Tabs[ i ]. listenChannels ) do
			--sys.log( "GameChat_Join: %s", v )
			_G.GameChat_Join( v )
		end

		for k, v in pairs( self.Tabs[ i ].listenChannelTypes ) do
			for kk, vv in pairs( UI.Chat.ChannelTypes ) do
				if v == vv then
					if UI.Chat.ChannelTypesVar[ kk ] and self[ UI.Chat.ChannelTypesVar[ kk ] ] then
						--sys.log( "GameChat_Join: %s", self[ UI.Chat.ChannelTypesVar[ kk ] ] )
						_G.GameChat_Join( self[ UI.Chat.ChannelTypesVar[ kk ] ] )
					end
				end
			end
		end

	end

	UI.ChatWnd:FullUpdate()

end


--
function UI.Chat:Disconnect()

	self.isInited = false
	self.Tabs = {}
	self.currentTabId = 0
	self:ClearMessages()
	UI.ChatWnd:ClearTabs()

end


--
function UI.Chat:GetCurrentTab()

	return self.currentTabId

end


--
function UI.Chat:SetTab( tabIndex, force )

	if self.currentTabId ~= tabIndex or force then

		local tempTabIndex = nil
		if self.Tabs[ tabIndex ].type == "BATTLE_LOG" then
			tempTabIndex = tabIndex
			tabIndex = 1
		end

		if self.Tabs[ tabIndex ].writeChannel then
			--sys.log( "GameChat_SetChannel: %s", self.Tabs[ tabIndex ].writeChannel )
			_G.GameChat_SetChannel( self.Tabs[ tabIndex ].writeChannel )
		else
			if self.Tabs[ tabIndex ].writeChannelType ~= nil and self.Tabs[ tabIndex ].writeChannelType[ 1 ] then
				for kk, vv in pairs( UI.Chat.ChannelTypes ) do
					if self.Tabs[ tabIndex ].writeChannelType[ 1 ] == vv then
						if UI.Chat.ChannelTypesVar[ kk ] and self[ UI.Chat.ChannelTypesVar[ kk ] ] then
							_G.GameChat_SetChannel( self[ UI.Chat.ChannelTypesVar[ kk ] ] )
						end
					end
				end
			end
		end

		if tempTabIndex then
			tabIndex = tempTabIndex
		end

		self.currentTabId = tabIndex
		UI.ChatWnd:ChangeTab( tabIndex )

	end

end


--
function UI.Chat:AddSquadTab( bUpdateChatWnd )

	if bUpdateChatWnd == nil then
		bUpdateChatWnd = true
	end

	UI.Chat:Connect( true )

	if self.squadChannel ~= nil then
		--sys.log( "UI.Chat:RemoveSquadTab()[ERROR]: self.battleChannel is not nil." )
	else

		self.squadChannel = UI.Chat.ChanelTypeName.SQUAD .. "_" .. _G.U64ToStr( UI.Squad:GetSquadId() )
		--sys.log( "GameChat_Join: %s", self.squadChannel )
		_G.GameChat_Join( self.squadChannel )

		local tab = {}
		UI:CopyTable( UI.Chat.predefinedTabs.SQUAD, tab )
		local newTabIdx = self:AddTabSorted( tab )

    	if bUpdateChatWnd then
    		UI.ChatWnd:FullUpdate()
    	end

    	self:ClearTab( newTabIdx )

	end

end



--
function UI.Chat:RemoveSquadTab()

	if self.squadChannel == nil then
		sys.log( "UI.Chat:RemoveSquadTab()[ERROR]: self.battleChannel is nil." )
	else
		local removedTab = self:RemoveTab( "SQUAD" )
		if self.currentTabId == removedTab then
			self:SetTab( 1 )
		end
		--sys.log( "GameChat_Leave: %s", self.squadChannel )
		_G.GameChat_Leave( self.squadChannel );
		self.squadChannel = nil
		UI.ChatWnd:FullUpdate()
	end

end


--
function UI.Chat:AddClanTab( bUpdateChatWnd )

	if bUpdateChatWnd == nil then
		bUpdateChatWnd = true
	end

	UI.Chat:Connect( true )

	local clanChannel = UI.Chat.ChanelTypeName.CLAN .. "_" .. _G.U64ToStr( UI.Clan:GetCid() )

	if self.clanChannel ~= clanChannel then

		if self.clanChannel then
			self:RemoveClanTab()
		end

		self.clanChannel = clanChannel

    	local tab = {}
    	UI:CopyTable( UI.Chat.predefinedTabs.CLAN, tab )
    	local newTabIdx = self:AddTabSorted( tab )

		self:ClearTab( newTabIdx )

	end	
	
	--sys.log( "GameChat_Join: %s", self.clanChannel )
	_G.GameChat_Join( self.clanChannel )

	if bUpdateChatWnd then
		UI.ChatWnd:FullUpdate()
	end

end


--
function UI.Chat:RemoveClanTab()

	if self.clanChannel == nil then
		sys.log( "UI.Chat:RemoveClanTab()[ERROR]: self.clanChannel is nil." )
	else
		local removedTab = self:RemoveTab( "CLAN" )
		if self.currentTabId == removedTab then
			self:SetTab( 1 )
		end
		--sys.log( "GameChat_Leave: %s", self.clanChannel )
		_G.GameChat_Leave( self.clanChannel );
		self.clanChannel = nil
		UI.ChatWnd:FullUpdate()
	end

end


--
function UI.Chat:UpdateTradingTab( bUpdateChatWnd )

	if bUpdateChatWnd == nil then
		bUpdateChatWnd = true
	end

	UI.Chat:Connect( true )

	local tradingChannel = UI.Chat.ChanelTypeName.TRADING

	if self.tradingChannel ~= tradingChannel then

    	if self.tradingChannel ~= nil then
    		_G.GameChat_Leave( self.tradingChannel )
    	end

		self.tradingChannel = tradingChannel

		local tradingTabIdx = -1

		for tabIdx, tab in pairs( self.Tabs ) do
			if tab.type == "TRADING" then
				tradingTabIdx = tabIdx
				break
			end
		end

		if tradingTabIdx == -1 then
    		local tab = {}
    		UI:CopyTable( UI.Chat.predefinedTabs.TRADING, tab )
    		tradingTabIdx = self:AddTabSorted( tab )
			self:ClearTab( tradingTabIdx )
		end

	end	
	
	--sys.log( "GameChat_Join: %s", self.tradingChannel )
	_G.GameChat_Join( self.tradingChannel )

	self:UpdateTradingTabVisibility( false )

	if bUpdateChatWnd then
		UI.ChatWnd:FullUpdate()
	end

end


--
function UI.Chat:UpdateTradingTabVisibility( bUpdateChatWnd )

	if bUpdateChatWnd == nil then
		bUpdateChatWnd = true
	end

	for tabIdx, tab in pairs( self.Tabs ) do

		if tab.type == "TRADING" then

			local bHidden = _G.GetCurrentGameMode() ~= ai.Gameplay.NONE

			if bHidden ~= tab.bHidden then

				tab.bHidden = bHidden

            	if bUpdateChatWnd then
            		UI.ChatWnd:FullUpdate()
            	end

			end

			break

		end

	end

end


--
function UI.Chat:GetMsgTypeColor( msgType )
	if msgType == self.msgTypes.GAMEPLAY then
		return self.colorIds.YELL
	elseif msgType == self.msgTypes.MOTD then
		return self.colorIds.GUILD
	elseif msgType == self.msgTypes.PRIVATE_TO or msgType == self.msgTypes.PRIVATE_FROM then
		return self.colorIds.WHISPER
	elseif msgType == self.msgTypes.SYSTEM then
		return self.colorIds.SYSTEM
	elseif msgType == self.msgTypes.BATTLE_LOG_WIDE then
		return self.colorIds.BATTLE_LOG
	elseif msgType == self.msgTypes.JOIN then
		return self.colorIds.CHANNEL_JOIN
	elseif msgType == self.msgTypes.LEAVE then
		return self.colorIds.CHANNEL_LEAVE
	elseif msgType == self.msgTypes.IGNORED then
		return self.colorIds.IGNORED
	elseif msgType == self.msgTypes.LIST then
		return self.colorIds.CHANNEL_LIST
	elseif msgType == self.msgTypes.LIST_TOTAL then
		return self.colorIds.CHANNEL_LIST
	elseif msgType == self.msgTypes.QUEST then
		return self.colorIds.SYSTEM
	elseif msgType == self.msgTypes.SYSTEM_WITH_NICKNAMES then
		return self.colorIds.SYSTEM
	elseif msgType == self.msgTypes.KILL_MESSAGE then
		return self.colorIds.SAY
	elseif msgType == self.msgTypes.SCREENSHOT or msgType == self.msgTypes.LOBBY_INVITE or msgType == self.msgTypes.SQUAD_FINDER then
		return self.colorIds.SYSTEM
	end
	sys.log( "UI.Chat:GetMsgTypeColor()[ERROR]: unknown message type %d", msgType )
	return 1
end

--
function UI.Chat:GetHidenTabData()
	return self.Tabs[ 0 ]
end

-- -------------------------------------
-- const
-- -------------------------------------

UI.Chat.MAX_MSGS	  = 200
UI.Chat.MAX_HISTORY	  = 10
UI.Chat.MAX_TABS  	  = 4
UI.Chat.Tabs          = {}

UI.Chat.msgTypes =
{
	PRIVATE_FROM		= 1,
	PRIVATE_TO			= 2,
	CHANNEL				= 3,
	SYSTEM				= 4,
	JOIN				= 5,
	LEAVE				= 6,
	LIST				= 7,
	LIST_TOTAL			= 8,
	IGNORED				= 9,
	BATTLE_LOG			= 10,
	BATTLE_LOG_WIDE		= 11,
	GAMEPLAY 			= 12,
	MOTD 				= 13,
	QUEST 				= 14,
	SYSTEM_WITH_NICKNAMES = 15,
	SCREENSHOT 			= 16,
	LOBBY_INVITE 		= 17,
	KILL_MESSAGE 		= 18,
	TRADING				= 19,
	SQUAD_FINDER		= 20,
}

UI.Chat.colorIds =
{
	SYSTEM			= 1,
	IGNORED			= 2,
	SAY				= 3,
	PARTY			= 4,
	ENEMY			= 5,
	RAID			= 6,
	GUILD			= 7,
	YELL			= 8,
	WHISPER			= 9,
	CHANNEL_JOIN	= 10,
	CHANNEL_LEAVE	= 11,
	CHANNEL_LIST	= 12,
	CHANNEL_NOTICE	= 13,
	BATTLE_LOG		= 14,
	RED				= 15,
	SCRIPTED_REWARD	= 16,
	SCRIPTED_EVENT	= 17,
}

UI.Chat.ChannelTypes = 
{
	GENERAL			= 1,
	BATTLE			= 2,
	SQUAD			= 3,
	CLAN 			= 4,
	LOBBY			= 5,
	BATTLE_LOG		= 6,
	SYSTEM			= 7,
	GAMEPLAY 		= 8,
	PRIVATE 		= 9,
	IGNORED 		= 10,
	QUEST  			= 11,
	KILL_MESSAGE 	= 12,
	TRADING			= 13,
}

UI.Chat.ChanelTypeName =
{
	GENERAL = "#general",
	BATTLE  = "#battle",
	SQUAD	= "#squad",
	CLAN    = "#clan",
	LOBBY   = "#lobby",
	TRADING	= "#trading",
}

UI.Chat.ChannelTypesVar = 
{
	GENERAL			= "general",
	BATTLE			= "battleChannel",
	SQUAD			= "squadChannel",
	CLAN			= "clanChannel",
	LOBBY			= "lobbyChannel",
	TRADING			= "tradingChannel",
}

UI.Chat.predefinedTabs = 
{
	GLOBAL = 
	{ 
		listenChannels = { "#general_" }, -- rewrite after init
		listenChannelTypes = { UI.Chat.ChannelTypes.BATTLE, UI.Chat.ChannelTypes.SQUAD, UI.Chat.ChannelTypes.CLAN, UI.Chat.ChannelTypes.LOBBY, UI.Chat.ChannelTypes.SYSTEM, UI.Chat.ChannelTypes.GAMEPLAY,
			UI.Chat.ChannelTypes.PRIVATE, UI.Chat.ChannelTypes.IGNORED, UI.Chat.ChannelTypes.QUEST, UI.Chat.ChannelTypes.KILL_MESSAGE }, 
		writeChannel = "#general_", -- rewrite after init
		writeChannelType = {},
		data = { Name = "chat_label" }, -- rewrite after init
		type = "GLOBAL",
		sortId = 1,
	},
	WHISPER =
	{
		listenChannels = {},
		listenChannelTypes = { UI.Chat.ChannelTypes.PRIVATE, UI.Chat.ChannelTypes.SYSTEM, UI.Chat.ChannelTypes.IGNORED },
		writeChannel = nil,
		writeChannelType = {},
		data = { Name = "chat_labelWHISPER" },
		type = "WHISPER",
		sortId = 2,
	},
	TRADING = 
	{ 
		listenChannels = {},
		listenChannelTypes = { UI.Chat.ChannelTypes.TRADING, UI.Chat.ChannelTypes.PRIVATE, UI.Chat.ChannelTypes.SYSTEM, UI.Chat.ChannelTypes.IGNORED },
		writeChannel = nil,
		writeChannelType = { UI.Chat.ChannelTypes.TRADING },
		data = { Name = "chat_trading" },
		type = "TRADING",
		sortId = 3,
	},
	BATTLE_LOG = 
	{ 
		listenChannels = {}, -- rewrite after init
		listenChannelTypes = { UI.Chat.ChannelTypes.BATTLE_LOG }, 
		writeChannel = "", -- rewrite after init
		writeChannelType = {},
		data = { Name = "chat_labelBATTLE_LOG" }, -- rewrite after init
		type = "BATTLE_LOG",
		sortId = 4,
	},
	CLAN = 
	{
		listenChannels = {}, 
		listenChannelTypes = { UI.Chat.ChannelTypes.BATTLE, UI.Chat.ChannelTypes.SQUAD, UI.Chat.ChannelTypes.CLAN, UI.Chat.ChannelTypes.LOBBY, UI.Chat.ChannelTypes.SYSTEM, 
			UI.Chat.ChannelTypes.PRIVATE, UI.Chat.ChannelTypes.IGNORED },
		writeChannel = nil,
		writeChannelType = { UI.Chat.ChannelTypes.CLAN },
		data = { Name = "chat_labelCLAN" },
		type = "CLAN",
		sortId = 5,
	},
	SQUAD = 
	{
		listenChannels = {}, 
		listenChannelTypes = { UI.Chat.ChannelTypes.BATTLE, UI.Chat.ChannelTypes.SQUAD, UI.Chat.ChannelTypes.CLAN, UI.Chat.ChannelTypes.LOBBY, UI.Chat.ChannelTypes.SYSTEM, 
			UI.Chat.ChannelTypes.PRIVATE, UI.Chat.ChannelTypes.IGNORED },
		writeChannel = nil,
		writeChannelType = { UI.Chat.ChannelTypes.SQUAD },
		data = { Name = "chat_labelSQUAD" },
		type = "SQUAD",
		sortId = 6,
	},
	LOBBY = 
	{
		listenChannels = {}, 
		listenChannelTypes = { UI.Chat.ChannelTypes.BATTLE, UI.Chat.ChannelTypes.SQUAD, UI.Chat.ChannelTypes.CLAN, UI.Chat.ChannelTypes.LOBBY, UI.Chat.ChannelTypes.SYSTEM,
			UI.Chat.ChannelTypes.PRIVATE, UI.Chat.ChannelTypes.IGNORED },
		writeChannel = nil,
		writeChannelType = { UI.Chat.ChannelTypes.LOBBY },
		data = { Name = "chat_labelLOBBY" },
		type = "LOBBY",
		sortId = 7,
	},
	HIDEN = 
	{
		listenChannels = {}, 
		listenChannelTypes = { UI.Chat.ChannelTypes.BATTLE, UI.Chat.ChannelTypes.CLAN, UI.Chat.ChannelTypes.LOBBY, UI.Chat.ChannelTypes.GAMEPLAY, UI.Chat.ChannelTypes.IGNORED, 
			UI.Chat.ChannelTypes.SYSTEM, UI.Chat.ChannelTypes.PRIVATE, UI.Chat.ChannelTypes.SQUAD, UI.Chat.ChannelTypes.IGNORED, UI.Chat.ChannelTypes.KILL_MESSAGE, UI.Chat.ChannelTypes.QUEST },
		writeChannel = nil,
		writeChannelType = nil,
		data = { Name = "chat_labelHiden" },
		type = "HIDEN",
	},
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Chat.msgs			= {}
UI.Chat.firstMsgId		= -1
UI.Chat.numMsgs			= 0
UI.Chat.history			= {}
UI.Chat.historyIdx		= -1
UI.Chat.isInited		= false
UI.Chat.currentTabId	= 0
UI.Chat.battleChannel	= nil
UI.Chat.squadChannel	= nil
UI.Chat.general			= nil
UI.Chat.currentChannel	= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Chat:RemoveTab( tabType )
	for k, v in pairs( self.Tabs ) do
		if v.type == tabType then
			table.remove( self.Tabs, k )
			return k
		end
	end
end

--
function UI.Chat:CreateEmptyMsg()

	local msg = {}

	msg.id			= -1
	msg.type		= self.msgTypes.SYSTEM
	msg.color		= self:GetMsgTypeColor( msg.type )
	msg.uid			= UI.INVALID_U64_ID
	msg.nickName	= ""
	msg.channel		= ""
	msg.text		= ""
	msg.params		= {}	-- могут быть разные, в зависимости от типа сообщения

	return msg

end


--
function UI.Chat:AddMsgInternal( msg )

	if not self.isInited then
		self:Connect( true )
	end

	local isAdd = false

	for i = 0, #self.Tabs do

		local tab = self.Tabs[ i ]

		if self:IsTabNeedMsg( i, msg ) then

			--sys.log( "Add message \"%s\" to Tab %d", msg.text, i )
			isAdd = true

			if tab.numMsgs == 0 then

				tab.numMsgs = 1
				tab.firstMsgId = 1

			else

				if tab.numMsgs < UI.Chat.MAX_MSGS then
					tab.numMsgs = tab.numMsgs + 1
				else
					tab.msgs[ tab.firstMsgId ] = nil
					tab.firstMsgId = tab.firstMsgId + 1
				end

			end

			local msgId = tab.firstMsgId + tab.numMsgs - 1

			tab.msgs[ msgId ] = UI:CopyTable2( msg )
			msg.id = msgId

		end

	end

	if isAdd then
		UI:SendUiEvent( UI.EV_CHAT_MSG, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )
	end

end


--
function UI.Chat:FormatTextDefault( text, msg )

	local tags =
	{
		player		= UI:ShieldSpecSymbolsForMetatext( msg.nickName ),
		channel		= msg.channel,
		time		= UI:Time2Str45( msg.params.ignoreTime or 0 ),	-- два старших значения #0086155(0513260)
		usersCount	= tostring( msg.params.usersCount or 0 ),
	}

	return string.gsub( text, "%$([%w_]+)%$", tags )	

end


--
function UI.Chat:AddHistory( text )

	if not self.Tabs[ self.currentTabId ] then
		sys.log( "UI.Chat:AddHistory()[ERROR]: self.currentTabId(%d) out of range", self.currentTabId )
		return
	end

	local tab = self.Tabs[ self.currentTabId ]

	-- если точно такая же строка уже содержалась в истории, то она убирается оттуда
	for idx, historyText in pairs( tab.history ) do
		if historyText == text then
			table.remove( tab.history, idx )
			break			
		end
	end

	table.insert( tab.history, text )

	local historyCount = #tab.history
	if historyCount > self.MAX_HISTORY then
		table.remove( tab.history, 1 )
		historyCount = historyCount - 1
	end

	tab.historyIdx = historyCount + 1	-- "+1", т.к. поле ввода сейчас содержит не историю, и для того чтобы при получении предыдущей истории вернулось ее последнее значение

end


--
function UI.Chat:GetChannelTypeByMsg( msg )

	if msg.type == self.msgTypes.BATTLE_LOG then
		return UI.Chat.ChannelTypes.BATTLE
	end

	if msg.type == self.msgTypes.BATTLE_LOG_WIDE then
		return UI.Chat.ChannelTypes.BATTLE_LOG
	end

	if msg.type == self.msgTypes.SYSTEM then
		return UI.Chat.ChannelTypes.SYSTEM
	end

	if msg.type == self.msgTypes.GAMEPLAY then
		return UI.Chat.ChannelTypes.GAMEPLAY
	end

	if msg.type == self.msgTypes.QUEST then
		return UI.Chat.ChannelTypes.QUEST
	end

	if msg.type == self.msgTypes.IGNORED then
		return UI.Chat.ChannelTypes.IGNORED
	end

	if msg.type == self.msgTypes.SYSTEM_WITH_NICKNAMES then
		return UI.Chat.ChannelTypes.SYSTEM
	end

	if msg.type == self.msgTypes.SCREENSHOT then
		return UI.Chat.ChannelTypes.SYSTEM
	end

	if msg.type == self.msgTypes.LOBBY_INVITE then
		return UI.Chat.ChannelTypes.SYSTEM
	end

	if msg.type == self.msgTypes.PRIVATE_FROM or msg.type == self.msgTypes.PRIVATE_TO then
		return UI.Chat.ChannelTypes.PRIVATE
	end

	if msg.type == self.msgTypes.KILL_MESSAGE then
		return UI.Chat.ChannelTypes.KILL_MESSAGE
	end
	
	if msg.type == self.msgTypes.SQUAD_FINDER then
		return UI.Chat.ChannelTypes.SYSTEM
	end	

	if msg.channel then 
		local channelName = msg.channel
		for k, v in pairs( UI.Chat.ChanelTypeName ) do
			if string.sub( channelName, 1, string.len( v ) ) == v then
				return UI.Chat.ChannelTypes[ k ]
			end
		end
	end

end


--
function UI.Chat:IsTabNeedMsg( tabIndex, msg )

	-- check for battle log
	if msg.type == self.msgTypes.BATTLE_LOG_WIDE then
		if self.Tabs[ tabIndex ].type == "BATTLE_LOG" then
			return true
		end
	end

	-- check by channel name
	if self.Tabs[ tabIndex ].listenChannels then
		for k, v in pairs( self.Tabs[ tabIndex ].listenChannels ) do
			if msg.channel == v then
				return true
			end
		end
	end

	-- check by channel type
	local channelType = self:GetChannelTypeByMsg( msg )
	if msg.channel and self.Tabs[ tabIndex ].listenChannelTypes then
		for k, v in pairs( self.Tabs[ tabIndex ].listenChannelTypes ) do
			if channelType == v then
				return true
			end
		end
	end

	return false

end

--
function UI.Chat:InitGlobalTab( force )
	-- unsubscribe
	if self.Tabs and self.Tabs[ 1 ] then
		-- if we in battle
		if self.Tabs[ 1 ].tempWriteChannel then
			--sys.log( "GameChat_Leave: %s", self.Tabs[ 1 ].tempWriteChannel )
			_G.GameChat_Leave( self.Tabs[ 1 ].tempWriteChannel );
		else
			--sys.log( "GameChat_Leave: %s", self.Tabs[ 1 ].writeChannel )
			if self.Tabs[ 1 ].writeChannel then
				_G.GameChat_Leave( self.Tabs[ 1 ].writeChannel );
			end
		end
	end

	if self.Tabs == nil then
		self.Tabs = {}
	end

	if self.Tabs[ 1 ] == nil then
		self.Tabs[ 1 ] = {}
		UI:CopyTable( UI.Chat.predefinedTabs.GLOBAL, self.Tabs[ 1 ] )
	end

	if self.Tabs[ 2 ] == nil then
		self.Tabs[ 2 ] = {}
		UI:CopyTable( UI.Chat.predefinedTabs.BATTLE_LOG, self.Tabs[ 2 ] )
	end

	if self.Tabs[ 0 ] == nil then
		self.Tabs[ 0 ] = {}
		UI:CopyTable( UI.Chat.predefinedTabs.HIDEN, self.Tabs[ 0 ] )
		self:ClearTab( 0 )
	end

	local chat = UI.Chat:GetGlobalChannelLanguage()
	
	-- subscribe
	if self.Tabs[ 1 ].tempWriteChannel then
		self.Tabs[ 1 ].tempWriteChannel = "#general_"..chat
		self.Tabs[ 1 ].listenChannels = { "#general_"..chat  }
		self.Tabs[ 1 ].data = { Name = "chat_label"..chat }
		if force then
			--sys.log( "GameChat_Join: %s", self.Tabs[ 1 ].tempWriteChannel )
			_G.GameChat_Join( self.Tabs[ 1 ].tempWriteChannel )
			if self:GetCurrentTab() == 1 then
				self:SetTab( 1, true )
			end
		end
	else
		self.Tabs[ 1 ].listenChannels = { "#general_"..chat  }
		self.Tabs[ 1 ].writeChannel = "#general_"..chat
		self.Tabs[ 1 ].data = { Name = "chat_label"..chat }
		if force then
			--sys.log( "GameChat_Join: %s", self.Tabs[ 1 ].listenChannels[ 1 ] )
			_G.GameChat_Join( self.Tabs[ 1 ].listenChannels[ 1 ] )
			if self:GetCurrentTab() == 1 then
				self:SetTab( 1, true )
			end
		end
	end

	local bWisperTabFound = false
	for tabIdx, tab in pairs( self.Tabs ) do
		if tab.type == "WHISPER" then
			bWisperTabFound = true
			break
		end
	end
	if not bWisperTabFound then
		local whisperTabIdx = self:AddTabSorted( UI:CopyTable2( UI.Chat.predefinedTabs.WHISPER ) )
		self:ClearTab( whisperTabIdx )
	end

	UI.Chat:UpdateTradingTab( false )

	if force then
		UI.ChatWnd:FullUpdate()
	end	

end

--
function UI.Chat:GetGlobalChannelLanguage()
	if _G.GetProfileTable then
		local profile = _G.GetProfileTable()
		local availableLanguage = UI.Chat:GetSupportedGlobalChannels()
		local language = "ENGLISH"
		-- find in profile
		if profile.chat_global_language then
			for k,v in pairs( availableLanguage ) do
				if v == profile.chat_global_language then
					language = profile.chat_global_language
					return language
				end
			end
		end
		-- try to set by language
		local gameLang = cvars.cl_language
		for k,v in pairs( availableLanguage ) do
			if v == gameLang then
				language = gameLang
				return language
			end
		end
		return UI.Chat:GetDefaultGlobalChannels()
	else
		return UI.Chat:GetDefaultGlobalChannels()
	end
end

--
function UI.Chat:GetSupportedGlobalChannels()
	return { "ENGLISH", "RUSSIAN", "CHINESE", "GERMAN", "ITALIAN", "FRENCH", "SPANISH", "JAPANESE", "PORTUGUESE", "TURKISH", "POLISH", "HUNGARIAN", "CZECH", "UKRAINIAN" }
end

--
function UI.Chat:GetDefaultGlobalChannels()
	return "ENGLISH"
end


--
function UI.Chat:ReplacePlayerMsg( uid, chatType )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.Chat:ReplacePlayerMsg()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" (u64) expected, got \"%s\"", type( uid ) )
		return
	end

	if type( chatType ) ~= "number" then
		sys.log( "UI.Chat:ReplacePlayerMsg()[ERROR]: invalid type of the 2-nd parameter (\"chatType\"); \"number\" (u64) expected, got \"%s\"", type( chatType ) )
		return
	end

	local text = UI:GetStringByName( "chat_msg_deleted" )
	local bChanges = false

	for tabIdx = 1, #self.Tabs do

		local tab = self.Tabs[ tabIdx ]
		
		if self:IsTabNeedReplaceMsg( tab.type, chatType ) then

			for msgIdx = 1, tab.numMsgs do
				
				local msg = tab.msgs[ msgIdx ]

				if msg.uid == uid then

					local needReplace = string.find( msg.channel, self.ChanelTypeName.GENERAL ) or string.find( msg.channel, self.ChanelTypeName.TRADING )

					if needReplace then
						msg.text = text
						msg.color = self.colorIds.SYSTEM
						bChanges = true
					end

				end

			end

		end

	end

	if bChanges then
		UI.ChatWnd:FullUpdate()
	end

end


--
function UI.Chat:IsTabNeedReplaceMsg( tabType, chatType )

	if chatType == _G.MasterServer.ReplaceChatMsg.RCM_GENERAL then
		return tabType == "GLOBAL"
	elseif chatType == _G.MasterServer.ReplaceChatMsg.RCM_TRADING then
		return tabType == "TRADING"
	elseif chatType == _G.MasterServer.ReplaceChatMsg.RCM_RCM_GENERAL_AND_TRADING then
		return tabType == "GLOBAL" or tabType == "TRADING"
	end

	return false

end