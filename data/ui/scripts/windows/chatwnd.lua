-- ----------------------------------------------------------------------------
--
-- Workfile: chatwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.ChatWnd = {}
local cw = UI.ChatWnd

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.ChatWnd.def =
{
	className	= "Wnd",

	props =
	{
		name			= "ChatWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "chat_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "chat",	
						layer		= "UI.ChatWnd.layers.WORK_EFFECT",
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
				defName 			= "chat_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "input",	
						wnd			= "UI.Chat_EditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn3",
						wnd			= "UI.Chat_ChatBtn_720",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- MAIN_EFFECT_1080
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "chat_main_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "chat",	
						layer		= "UI.ChatWnd.layers.WORK_EFFECT_1080",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- WORK_EFFECT_1080
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "chat_work_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "btn3",	
						wnd			= "UI.Chat_ChatBtn_1080",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn2",	
						wnd			= "UI.Chat_TradingBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children =
	{
		"UI.Chat_ListWnd_BRIEF",
		"UI.Chat_ListWnd_NEW",
		"UI.Chat_EditWnd",
		"UI.Chat_ChatBtn_1080",
		"UI.Chat_ChatBtn_720",
		"UI.Chat_TradingBtn",
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

local l_bInShow = false

--
function UI.ChatWnd:Show()

	-- после self:UnlinkFromParent() может опять сюда зайти в результате сложной цепочки действий,
	-- и это сломает последовательность вызова функций OnAfterShowOnScreen()/OnAfterHideFromScreen,
	-- в результате чего отключится подписка от ивента UI.EV_NEW_FRAME у поля ввода (#0079327)

	if l_bInShow then
		return
	end

	l_bInShow = true

	local oldParent = self:GetParent()
	local newParent = nil

	if UI.HangarWnd:IsOnScreen() and not UI.DebriefingWnd:IsOnScreen() then
		newParent = UI.HangarWnd
	else
		newParent = UI.Root
	end

	if newParent ~= oldParent then

		self:UnlinkFromParent()

		newParent:AddChild( self )
		self:SetPos( newParent:XToWindow( 0 ), newParent:YToWindow( 0 ) )

	end

	l_bInShow = false

end


--
function UI.ChatWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.ChatWnd:GetMode()

	return self.mode

end


--
function UI.ChatWnd:StartInput( bSound )

	if bSound == nil then
		bSound = true
	end

	if self:IsInInputMode() then
		return
	end

	if not self:IsOnScreen() then
		sys.log( "UI.ChatWnd:StartInput()[ERROR]: not on screen" )
		return
	end

	if self:GetMode() == self.modes.OFF then
		self:SetMode( self.modes.HANGAR )
	end

	if bSound then
		UI:PlayGlobalSound( UI.sounds.btnClick )
	end
	
	self.editWnd:RemoveStyle( UI.WS_NOT_KB_REACT )
	UI:SetKeyboardFocus( self.editWnd:GetUiHandle() )

end


--
function UI.ChatWnd:StopInput()

	if not self:IsInInputMode() then
		return
	end
	
	self.editWnd:AddStyle( UI.WS_NOT_KB_REACT )
	UI:ValidateKeyboardFocus()

end


--
function UI.ChatWnd:IsInInputMode()

	return UI:GetKeyboardFocus() == self.editWnd:GetUiHandle()

end


--
function UI.ChatWnd:GetColorByColorType( colorType )

	if colorType ~= nil then
		return self.colors[ colorType ] or UI.WHITE_COLOR
	end
	return UI.WHITE_COLOR

end

--
function UI.ChatWnd:GetMsgColor( msgId )

	local msg = UI.Chat:GetMsg( msgId )
	if not msg then
		sys.log( "UI.ChatWnd:GetMsgColor()[ERROR]: cannot find msg with id %s", tostring( msgId ) )
		return ""
	end

	return self.colors[ msg.color ] or UI.WHITE_COLOR

end


--
function UI.ChatWnd:SetTextAndEdit( text )

	if text and type( text ) == "string" then
		if self:GetMode() == self.modes.OFF then
			self:SetMode( self.modes.HANGAR )
		end
		self:StartInput( false )
		self.editWnd:SetEditText( text )
	else
		sys.log( "UI.ChatWnd:SetText()[ERROR]: param text must be string, but it %s", type( text ) )
	end

end


--
function UI.ChatWnd:InsertLinkAndEdit( linkType, params )

	if not self:IsInInputMode() then

		self:StartInput()

    	if not self:IsInInputMode() then
    		sys.log( "UI.ChatWnd:InsertLinkAndEdit()[ERROR]: fail to set input mode" )
    		return
    	end

		self.editWnd:SetSel( -1, -1 )		

	end

	self.editWnd:InsertLink( linkType, params )

end


--
function UI.ChatWnd:CreateLobbyInviteStr( chatList, data, colorStr )
	local wnd = chatList:ObtainFreeNickNameWnd()
	local handle = wnd:GetUiHandle()
	wnd:SetInviteAccept( data )
	local str = ""
	str = string.format( "$wndk [hWnd %d]$", handle )..colorStr
	return str, wnd
end

--
function UI.ChatWnd:CreateScreenshotStr( chatList, fileName, colorStr )
	if fileName and type( fileName ) == "string" and fileName ~= "" then
		local str = UI:GetStringByName( "chat_screenshot_message" )
		str = string.gsub( str, "%$file_name%$", fileName )
		local wnds = {}
		if _G.FB_IsLoggedIn() then
			local wnd = chatList:ObtainFreeNickNameWnd()
			local handle = wnd:GetUiHandle()
			wnd:SetFacebookScreenshotFileName( fileName )
			str = str..string.format( "$wndk [hWnd %d]$", handle )..colorStr
			table.insert( wnds, wnd )
		end
		if _G.VK_IsLoggedIn() then
			local wnd = chatList:ObtainFreeNickNameWnd()
			local handle = wnd:GetUiHandle()
			wnd:SetVkScreenshotFileName( fileName )
			str = str..string.format( "$wndk [hWnd %d]$", handle )..colorStr
			table.insert( wnds, wnd )
		end
		return str, wnds
	end
	return ""
end

--
function UI.ChatWnd:CreateSHIPStr( chatList, shipDef, colorStr )
	local wnd = chatList:ObtainFreeNickNameWnd()
	local handle = wnd:GetUiHandle()
	wnd:SetShipDef( shipDef )
	local str = ""
	str = string.format( "$wndk [hWnd %d]$", handle )..colorStr
	return str, wnd
end

--
function UI.ChatWnd:CreateNickNameStr( chatList, nickName, uid, baseColorStr, nickNameColor )
	local wnd = chatList:ObtainFreeNickNameWnd()
	local handle = wnd:GetUiHandle()
	wnd:SetName( nickName, uid )
	if nickNameColor then
		wnd:SetColor( nickNameColor )
	end
	local nicknameStr = ""
	if _G.GameChat_NeedShowUids() then
		nicknameStr = "[".._G.U64ToStr( uid ).."]["..string.format( "$wndk [hWnd %d]$", handle )..baseColorStr.."]"
	else
		nicknameStr = "["..string.format( "$wndk [hWnd %d]$", handle )..baseColorStr.."]"
	end
	return nicknameStr, wnd
end

--
function UI.ChatWnd:CreateNickNameStr2( chatList, nickName, uid, baseColorStr, nickNameColor )
	if not nickName then
		sys.log( "UI.ChatWnd:CreateNickNameStr2()[ERROR]: nickName is nil" )
		return ""
	end
	if not uid then
		sys.log( "UI.ChatWnd:CreateNickNameStr2()[ERROR]: uid is nil" )
		return ""
	end
	if not baseColorStr then
		sys.log( "UI.ChatWnd:CreateNickNameStr2()[ERROR]: baseColorStr is nil" )
		baseColorStr = ""
	end
	local wnd = chatList:ObtainFreeNickNameWnd()
	local handle = wnd:GetUiHandle()
	wnd:SetName( nickName, uid )
	if nickNameColor then
		wnd:SetColor( nickNameColor )
	end
	local nicknameStr = ""
	nicknameStr = string.format( "$wndk [hWnd %d]$", handle )..baseColorStr
	return nicknameStr, wnd
end


--
function UI.ChatWnd:CreateLinkStr( chatList, linkType, params, hFont )

	local wnd = chatList:ObtainFreeLinkWnd()
	wnd:Setup( linkType, params, hFont )

	local str = string.format( "$wndk [hWnd %d]$", wnd:GetUiHandle() )

	return str, wnd

end


--
function UI.ChatWnd:CreateSquadFinderLink( chatList, params, baseColor )

	local wnd = chatList:ObtainFreeNickNameWnd()
	local handle = wnd:GetUiHandle()
	
	wnd:SetSquadFinderParams( params )
	
	local linkColor = baseColor	-- какого цвета должна быть ссылка?
	wnd:SetColor( linkColor )
	
	local str = string.format( "$wndk [hWnd %d]$", handle )..UI:Color2Str( baseColor )
	return str, wnd
	
end


--
function UI.ChatWnd:CreateSquadFinderStr( chatList, params, color )
	
	local str = ""
	local wnds = {}	
	
	-- имя игрока
	local strNickNameLink, nickNameLinkWnd = self:CreateNickNameStr( chatList, params.owner_nickName, params.owner_uid, UI:Color2Str( color ), nil )
	table.insert( wnds, nickNameLinkWnd )
	
	-- параметры группы (тип активности, мин.ранг, сообщение)
	local strGroupDesc = ""
	
	-- тип активности (если есть)
	local strActivityType = UI:SquadFinderActivityType2Str( params.activityType )
	strGroupDesc = strGroupDesc.." "..strActivityType
	
	-- мин.ранг (если есть)
	if params.minRank ~= 0 then
		strGroupDesc = strGroupDesc.." "..tostring( params.minRank )
	end
	
	-- сообщение (если есть)
	if params.message ~= "" then
		strGroupDesc = strGroupDesc.." \""..params.message.."\""
	end
	
	-- ссылка для открытия окна сквад-файндера
	local strSquadFinderLink, squadFinderLinkWnd  = self:CreateSquadFinderLink( chatList, params, color )
	table.insert( wnds, squadFinderLinkWnd )
	
	-- все вместе
	str = UI:GetStringByName( "chat_squadFinderGroupCreated" )
	
	local tSubst =
	{
		player 	= strNickNameLink,
		desc	= strGroupDesc,
		link	= strSquadFinderLink,
	}
	
	local numSubst = 0
	str, numSubst = string.gsub( str, "%$([%w_]+)%$", tSubst )
	
	if numSubst < UI:GetTableLength( tSubst ) then
		sys.log( "UI.ChatWnd:CreateSquadFinderStr()[ERROR]: invalid paceholders in string 'chat_squadFinderGroupCreated'; '$player$', '$desc$', '$link$' expected" )
		str = "[INVALID STRING] Player "..strNickNameLink.." created group with params: "..strGroupDesc..". "..strSquadFinderLink
	end
	
	return str, wnds
	
end


--
function UI.ChatWnd:FormatMsgText( msgId, hFont, formatFlags, maxWidth, metaText, chatList )

	local msgType		= UI.Chat:GetMsgType( msgId )
	local text			= UI.Chat:GetMsgLocalizedText( msgId )--.."@ffff8080".."45".."@ffffffff"
	local text2			= ""
	local textHeight	= 0
	local formatRect	= Quat( 0, 0, maxWidth, 10000 )
	local fontHeight	= _G.GetFontLineHeight( hFont )
	local wnd			= {}
	local bShifted		= false

	metaText:SetFormatParams( hFont, formatFlags, UI:Vec2( formatRect.z, formatRect.w ), true )

	if msgType == UI.Chat.msgTypes.SYSTEM_WITH_NICKNAMES or msgType == UI.Chat.msgTypes.KILL_MESSAGE then
		local uid = UI.Chat:GetMsgSenderUid( msgId )
		local nickName = UI.Chat:GetMsgNickname( msgId )
		local defs = {}
		if msgType == UI.Chat.msgTypes.SYSTEM_WITH_NICKNAMES then
			defs = UI.Chat:GetMsgDefs( msgId )
		end
		local colors = {}
		if msgType == UI.Chat.msgTypes.KILL_MESSAGE then
			colors = UI.Chat:GetMsgColors( msgId )
		end

		local function fnSubst( capture )
			local strFixedItemIdx = string.match( capture, "^nickName(%d+)$" )
			if strFixedItemIdx then
				local fixedItemIdx = tonumber( strFixedItemIdx )
				local nickNameStr = nil
				if type( uid ) == "table" then
					nickNameStr, wnd[ #wnd + 1 ] = self:CreateNickNameStr2( chatList, nickName[ fixedItemIdx ], uid[ fixedItemIdx ], UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ), colors[ fixedItemIdx ] )
				else
					nickNameStr, wnd[ #wnd + 1 ] = self:CreateNickNameStr2( chatList, nickName, uid, UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ), colors[ fixedItemIdx ] )
				end
				if nickNameStr then
					return nickNameStr, wnd
				else
					sys.log( "UI.ChatWnd:FormatMsgText()[ERROR]: cannot find user %d for message type %s" , fixedItemIdx, UI:Val2Key( UI.Chat.msgTypes, msgType ) )
					return
				end
			end
			local strFixedItemIdx = string.match( capture, "^defName(%d+)$" )
			if strFixedItemIdx then
				local fixedItemIdx = tonumber( strFixedItemIdx )
				if defs[ fixedItemIdx ] then
					defStr, wnd[ #wnd + 1 ] = self:CreateSHIPStr( chatList, defs[ fixedItemIdx ], UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
					return defStr, wnd
				else
					sys.log( "UI.ChatWnd:FormatMsgText()[ERROR]: cannot find def %d for message type %s" , fixedItemIdx, UI:Val2Key( UI.Chat.msgTypes, msgType ) )
					return
				end
			end
			return nil
		end

		text = string.gsub( text, "%$(.-)%$", fnSubst )

	elseif msgType == UI.Chat.msgTypes.SCREENSHOT then

		text, wnd = self:CreateScreenshotStr( chatList, UI.Chat:GetMsgAdditionalData( msgId ), UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )

	elseif msgType == UI.Chat.msgTypes.LOBBY_INVITE then

		local uid = UI.Chat:GetMsgSenderUid( msgId )
		local nickName = UI.Chat:GetMsgNickname( msgId )
		local nickNameStr = nil
		nickNameStr, wnd[ #wnd + 1 ] = UI.ChatWnd:CreateNickNameStr2( chatList, nickName, uid, UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
		text = text:gsub( "%$nickName%$", nickNameStr )
		if UI.HangarWnd:IsOnScreen() then
			local inviteAcceptStr
			inviteAcceptStr, wnd[ #wnd + 1 ] = UI.ChatWnd:CreateLobbyInviteStr( chatList, UI.Chat:GetMsgAdditionalData( msgId ), UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
			text = text..inviteAcceptStr
		end

	elseif msgType == UI.Chat.msgTypes.PRIVATE_TO or msgType == UI.Chat.msgTypes.PRIVATE_FROM or msgType == UI.Chat.msgTypes.CHANNEL or msgType == UI.Chat.msgTypes.GAMEPLAY or msgType == UI.Chat.msgTypes.QUEST then
		local uid = UI.Chat:GetMsgSenderUid( msgId )
		msg = UI.Chat:GetMsg( msgId )
		if uid ~= UI.INVALID_U64_ID then
			nickname, wnd[ 1 ] = self:CreateNickNameStr( chatList, UI.Chat:GetMsgNickname( msgId ), uid, UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
			--[[if msg.params.isGm then
				nickname = "[GM]"..nickname
			end]]
			if msgType == UI.Chat.msgTypes.PRIVATE_TO or msgType == UI.Chat.msgTypes.PRIVATE_FROM then
				local prefix = ""
				if msgType == UI.Chat.msgTypes.PRIVATE_TO then
					prefix = UI:GetStringByName( "chat_private_to_prefix" )
				else
					prefix = UI:GetStringByName( "chat_private_from_prefix" )
				end
				text = string.format( prefix, nickname )..": "..text
			else
				text = nickname..": "..text
			end
		else
			local messageNickname = UI.Chat:GetMsgNickname( msgId )
			if messageNickname and messageNickname ~= "" then
				text = "["..messageNickname.."]: "..text
				--[[if msg.params.isGm then
					text = "[GM]"..text
				end]]
			end
		end
	elseif msgType == UI.Chat.msgTypes.BATTLE_LOG or msgType == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
		msg = UI.Chat:GetMsg( msgId, tab )
		if msg.additionType == "kill" then

			-- через функции, т.к. нельзя просто написать код создания имен, который будет выполняться всегда, даже если имена не понадобятся,
			-- иначе будет баг - #0076415 - "блуждающие" никнеймы

			local killerNickName = ""

			local function fnMakeKillerName()

				if killerNickName ~= "" then
					return killerNickName
				end

    			if msg.killer.localizedName then
    				killerNickName = msg.killer.localizedName
    			--[[elseif msg.killer.isDef then
    				killerNickName = UI:GetEntityLocalizedNameByDef( msg.killer.name )]]
    			else
    				if msg.killer.uid ~= UI.INVALID_U64_ID then
    					if msgType == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
    						killerNickName, wnd[ 1 ] = self:CreateNickNameStr( chatList, msg.killer.name, msg.killer.uid, "@fffff68f" )
    					else
    						killerNickName, wnd[ 1 ] = self:CreateNickNameStr( chatList, msg.killer.name, msg.killer.uid, UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
    					end
    				else
    					killerNickName = "["..UI:Color2Str( UI.Chat_NickNameWnd.BASE_COLOR )..msg.killer.name.."@fffff68f".."]"	-- #0111012 для ботов (заменяющих игроков) такой же цвет, что и для игроков
    				end
    			end

				if msgType == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
					killerNickName = "@fffff68f"..killerNickName..UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) )
				end

				return killerNickName

			end

			local victimNickName = ""

			local function fnMakeVictimName()

				if victimNickName ~= "" then
					return victimNickName
				end

    			if msg.victim.localizedName then
    				victimNickName = msg.victim.localizedName
    			--[[elseif msg.victim.isDef then
    				victimNickName = UI:GetEntityLocalizedNameByDef( msg.victim.name )]]
    			else
    				if msg.victim.uid ~= UI.INVALID_U64_ID then
    					local wnd2
    					if msgType == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
    						victimNickName, wnd2 = self:CreateNickNameStr( chatList, msg.victim.name, msg.victim.uid, "@fffff68f" )
    					else
    						victimNickName, wnd2 = self:CreateNickNameStr( chatList, msg.victim.name, msg.victim.uid, UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
    					end
    					if wnd2 then
    						table.insert( wnd, wnd2 )
    					end
    				else
    					victimNickName = "["..UI:Color2Str( UI.Chat_NickNameWnd.BASE_COLOR )..msg.victim.name.."@fffff68f".."]"	-- #0111012 для ботов (заменяющих игроков) такой же цвет, что и для игроков
    				end
    			end

				if msgType == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
					victimNickName = "@fffff68f"..victimNickName..UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) )
				end

				return victimNickName

			end

			if msg.itemDefName == "(crash)" then
				if msg.killer.isShip then
					text = UI:GetStringByName( "chat_battlelog_kill_crash" )
					text = string.gsub( text, "%$killer%$", fnMakeKillerName() )
					text = string.gsub( text, "%$victim%$", fnMakeVictimName() )
				else
					text = UI:GetStringByName( "chat_battlelog_self_crash" )
					text = string.gsub( text, "%$victim%$", fnMakeVictimName() )
				end
			elseif msg.itemDefName == "(suicide)" then
					text = UI:GetStringByName( "chat_battlelog_kill_suicide" )
					text = string.gsub( text, "%$victim%$", fnMakeVictimName() )
			else
				local itemName = ""
				itemName = UI:GetEntityLocalizedNameByDef( msg.itemDefName )

				text = UI:GetStringByName( "chat_battleLog_kill" )
				if msg.numAssists and msg.numAssists > 0 then
					local subText = UI:GetStringByName( "chat_battleLog_assist_main" )
					subText = string.gsub( subText, "%$numAssists%$", msg.numAssists )
					text = string.gsub( text, "%$assist%$", subText )
				else
					text = string.gsub( text, "%$assist%$", "" )
				end
				text = string.gsub( text, "%$killer%$", fnMakeKillerName() )
				text = string.gsub( text, "%$victim%$", fnMakeVictimName() )
				text = string.gsub( text, "%$itemDefName%$", UI:Color2Str( UI:GetItemColor( msg.itemDefName ) )..itemName..UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
				if msg.numAssists then
					if msg.damagePercent < 0.1 then
						text = string.gsub( text, "%$damagePercent%$", "<0.1" )
					else
						text = string.gsub( text, "%$damagePercent%$", string.format( "%.1f", msg.damagePercent ) )
					end
				else
					text = string.gsub( text, "%$damagePercent%$", "100" )
				end
			end
			
		elseif msg.additionType == "kill_assistant" then
			formatRect.z = formatRect.z - UI.ChatWnd.SHIFT_X
			metaText:SetFormatParams( hFont, formatFlags, UI:Vec2( formatRect.z, formatRect.w ), true )
			bShifted = true
			local assistantNickName = ""
			if msg.assistant.localizedName then
				assistantNickName = msg.victim.localizedName
			--[[elseif msg.assistant.isDef then
				assistantNickName = UI:GetEntityLocalizedNameByDef( msg.assistant.name )]]
			else
				if msg.assistant.uid ~= UI.INVALID_U64_ID then
					assistantNickName, wnd[ 1 ] = self:CreateNickNameStr( chatList, msg.assistant.name, msg.assistant.uid, "@fffff68f" )
				else
					assistantNickName = "["..UI:Color2Str( UI.Chat_NickNameWnd.BASE_COLOR )..msg.assistant.name.."@fffff68f".."]"	-- #0111012 для ботов (заменяющих игроков) такой же цвет, что и для игроков
				end
			end
			if msgType == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
				assistantNickName = "@fffff68f"..assistantNickName..UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) )
			end
			local damageText = ""
			if msg.damage then
				damageText = UI:GetStringByName( "chat_battleLog_assist_damage" )
				damageText = UI:ShieldSpecSymbolsForLuaGsub( damageText )
				if msg.damage < 0.1 then
					damageText = string.gsub( damageText, "%$damagePercent%$", "<0.1" )
				else
					damageText = string.gsub( damageText, "%$damagePercent%$", string.format( "%.1f", msg.damage ) )
				end
			end
			local buffText = ""
			if msg.buffs and #msg.buffs > 0 then
				buffText = UI:GetStringByName( "chat_battleLog_assist_buff" )
				local buffsList = ""
				for i = 1, #msg.buffs do
					if buffsList ~= "" then
						buffsList = buffsList .. ", "
					end
					local subText = UI:GetStringByName( "chat_battleLog_assist_buff_element" )
					subText = string.gsub( subText, "%$aura%$", UI:SpellAura2Str( UI:GetSpellAura( msg.buffs[ i ].spell, msg.buffs[ i ].aura ) ) )
					subText = string.gsub( subText, "%$device%$", UI:Color2Str( UI:GetItemColor( msg.buffs[ i ].entity ) )..UI:GetEntityLocalizedNameByDef( msg.buffs[ i ].entity )..UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) )
					buffsList = buffsList .. subText
				end
				buffText = string.gsub( buffText, "%$buff_list%$", buffsList )
			end
			local debuffText = ""
			if msg.debuffs and #msg.debuffs > 0 then
				debuffText = UI:GetStringByName( "chat_battleLog_assist_debuff" )
				local debuffsList = ""
				for i = 1, #msg.debuffs do
					if debuffsList ~= "" then
						debuffsList = debuffsList .. ", "
					end
					local subText = UI:GetStringByName( "chat_battleLog_assist_debuff_element" )
					subText = string.gsub( subText, "%$aura%$", UI:SpellAura2Str( UI:GetSpellAura( msg.debuffs[ i ].spell, msg.debuffs[ i ].aura ) ) )
					subText = string.gsub( subText, "%$device%$", UI:Color2Str( UI:GetItemColor( msg.debuffs[ i ].entity ) )..UI:GetEntityLocalizedNameByDef( msg.debuffs[ i ].entity )..UI:Color2Str( UI.ChatWnd:GetMsgColor( msgId ) ) ) 

					debuffsList = debuffsList .. subText
				end
				debuffText = string.gsub( debuffText, "%$debuff_list%$", debuffsList )
			end
			text = UI:GetStringByName( "chat_battleLog_assist_assistant" )
			text = string.gsub( text, "%$assistant%$", assistantNickName )
			text = string.gsub( text, "%$damage%$", damageText )
			text = string.gsub( text, "%$buffs%$", buffText )
			text = string.gsub( text, "%$debuffs%$", debuffText )
		end
		
	elseif msgType == UI.Chat.msgTypes.SQUAD_FINDER then

		text, wnd = self:CreateSquadFinderStr( chatList, UI.Chat:GetMsgAdditionalData( msgId ), UI.ChatWnd:GetMsgColor( msgId ) )
		
	end


	-- создание http ссылок для частей текста, начинающихся на http:// и https://

	local function fnHttpSubst( capture )

		local MAX_HTTP_DISPLAYED_LENGTH = 30
		local strDisplayedText = ""

		if #capture <= MAX_HTTP_DISPLAYED_LENGTH then
			strDisplayedText = capture
		else
			strDisplayedText = string.sub( capture, 1, MAX_HTTP_DISPLAYED_LENGTH - 1 )
			strDisplayedText = string.format( "%s%s", strDisplayedText, UI:GetStringByName( "ellipses" ) )
		end

		strDisplayedText = string.format( "[%s]", strDisplayedText )

		-- SC-114997: на linux открытие ссылок может выполняться через bash, командой "xdg-open '%s'", надо экранировать кавычки
		if _G.IsLinux() then
			capture = string.gsub( capture, "'", "'\\''" )
		end

		local linkParams =
		{
			href	= capture,
			text 	= strDisplayedText,
		}
		
		local linkStr, linkWnd = self:CreateLinkStr( chatList, UI.LinkWnd.linkTypes.HTTP, linkParams, metaText:GetFormatParams().hFont )
		table.insert( wnd, linkWnd )

		return linkStr

	end

	text = string.gsub( text, "(https?://[^%s]+)", fnHttpSubst )


	-- создание ссылок на разные игровые сущности

	local function fnItemSubst( strLinkType, strParams )

		local linkStr = nil

		local linkType, params, plainText = UI.EffectEditLinksWnd:TransferCaptures2LinkParams( strLinkType, strParams )
		if linkType ~= -1 then

			local linkWnd = nil
			linkStr, linkWnd = self:CreateLinkStr( chatList, linkType, params, metaText:GetFormatParams().hFont )

    		if linkWnd then
    			table.insert( wnd, linkWnd )
    		end
			
		else
			linkStr = plainText
		end

		return linkStr

	end

	text = string.gsub( text, UI.EffectEditLinksWnd.transferLinkPattern, fnItemSubst )


	-- #0059192 - это перенесено из UI.Clan перед вызовом UI.Chat:AddClanMotD,
	-- символ переноса строки "\n" заменяется на "|" после того как определяются http ссылки, иначе ссылка захватывает перенос строки и последующий текст
	if msgType == UI.Chat.msgTypes.MOTD then
		text = string.gsub( text, "\n" , "|" )
	end

	metaText:SetText( text, true )
	local realText = text
	text = metaText:GetFormattedText()
	local textSize = _G.MeasureText(
   		text,
   		hFont,
   		formatRect,
   		formatFlags,
   		formatRect )

	textHeight = textSize.w
	return textHeight, wnd, bShifted

end


--
function UI.ChatWnd:OnAfterActivateWithSlash()

	if not self:IsOnScreen() then
		sys.log( "UI.ChatWnd:OnAfterActivateWithSlash()[ERROR]: not on screen" )
		return
	end

	if not self:IsInInputMode() then
		sys.log( "UI.ChatWnd:OnAfterActivateWithSlash()[ERROR]: not in input mode" )
		return
	end

	if self.editWnd:GetEditText() ~= "" then
		sys.log( "UI.ChatWnd:OnAfterActivateWithSlash()[ERROR]: not empty text" )
	end

	self.editWnd:SetEditText( "/" )	

end


--
function UI.ChatWnd:OnChatPageUpBind()

	if not self:IsOnScreen() then
		sys.log( "UI.ChatWnd:OnChatPageUpBind()[ERROR]: not on screen" )
		return
	end

	if self:IsInInputMode() then
		return
	end

	if self.mode == self.modes.HANGAR then
		self.listWnd_NEW:ScrollPageUp( UI.SCROLL_SRC_KEYBOARD )
		return
	end

end


--
function UI.ChatWnd:OnChatPageDownBind()

	if not self:IsOnScreen() then
		sys.log( "UI.ChatWnd:OnChatPageDownBind()[ERROR]: not on screen" )
		return
	end

	if self:IsInInputMode() then
		return
	end

	if self.mode == self.modes.HANGAR then
		self.listWnd_NEW:ScrollPageDown( UI.SCROLL_SRC_KEYBOARD )
		return
	end

end


--
function UI.ChatWnd:ClearTabs()

	self.inited = false
	UI.Chat_Bookmark_List_NEW:Clear()

end


--
function UI.ChatWnd:ChangeTab( tabIndex )

	self.listWnd_BRIEF:Reset()
	self.listWnd_NEW:Reset()
	--[[if self.mode == -1 then
		self.mode = self.DEFAULT_MODE
	end]]
	if tabIndex ~= 0 then
		self:SetMode( self.mode )
	end

end


--
function UI.ChatWnd:GetEditRight()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	local space_edit_listRight = ( workEffect:GetObjPos( "list" ).x + UI.Chat_ListWnd_NEW:GetBaseSize().x ) - ( workEffect:GetObjPos( "input3" ).x + UI.Chat_EditWnd:GetBaseSize().x )

	return ( UI.Chat_ListWnd_NEW:GetLeft() + UI.Chat_ListWnd_NEW:GetWidth() ) - space_edit_listRight

end


--
function UI.ChatWnd:OnTradingWndResult( result, data )

	if not self:IsOnScreen() then
		sys.log( "UI.ChatWnd:OnTradingWndResult()[ERROR]: not on screen" )
		return
	end

	if result then

    	if self:GetMode() ~= self.modes.HANGAR then
    		self:SetMode( self.modes.HANGAR )
			self:SelectTabByType( "TRADING" )	-- автоматический переход на закладку торговли происходит только, если чат до этого был скрыт
    	end
	
		local linkType = UI:Def2LinkType( data.defName )
		if linkType ~= -1 then
			self.editWnd:InsertLink( linkType, { defName = data.defName } )
		else
			sys.log( "UI.ChatWnd:OnTradingWndResult()[ERROR]: cannot find link type for def %s", data.defName )
		end

	end

end


--
function UI.ChatWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.editWnd:SetEditText( "" )

end


--
function UI.ChatWnd:OnEditObtainKeyboardFocus( editWnd )
	
	_G.CL_LocalPlayerControllerSetIgnoreMouse( true )

end


--
function UI.ChatWnd:OnEditLostKeyboardFocus( editWnd )
	
	_G.CL_LocalPlayerControllerSetIgnoreMouse( false )

end


--
function UI.ChatWnd:HideTradingWnd()

	if UI.TradingWnd:GetMainWndName() == self:GetName() then
		UI.TradingWnd:Reset()
		UI.TradingWnd:Hide()
	end

end


--
function UI.ChatWnd:UpdateEditedPos()

	if not self:IsOnScreen() then
		return
	end
	
	self:RecalcLayout()
	
	if UI.Chat_ListWnd_NEW:IsChildOf( self ) then
		UI.Chat_ListWnd_NEW:SetSize( UI.Chat_ListWnd_NEW:GetWidth(), UI.Chat_ListWnd_NEW:GetHeight() )
	end
	
end


--
function UI.ChatWnd:MasterServer_OnPlayerStats( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end
	
	if result ~= 0 then
		return
	end
	
	if UI.Chat_TradingBtn:IsChildOf( self ) then
		self:UpdateTradingBtnState()
	end
	
	if UI.Chat_Bookmark_List_NEW:IsChildOf( self ) then
	
		local recordIdx = UI.Chat_Bookmark_List_NEW:GetRecordByTabType( "TRADING" )
		if recordIdx ~= -1 then
		
			local minBattles			= UI:GetTradingSellerMinBattles()
			local need2StepAuth 		= UI:IsTradingSeller2StepAuthNeeded()
			local machinePlayerBattles	= _G.MasterServer_GetMachineAntibotCounter()
			local playerBattles 		= _G.MasterServer_GetAntibotCounter()
			local player2StepAuth 		= _G.MasterServer_Is2StepAuthEnabled()
			local bTradingEnabled = minBattles == -1
				or minBattles <= machinePlayerBattles
				or ( minBattles <= playerBattles and ( not need2StepAuth or player2StepAuth ) )

			local bDisabled = not bTradingEnabled
			
			local data = UI.Chat_Bookmark_List_NEW:GetRecordData( recordIdx )
			if data.bDisabled ~= bDisabled then
			
				data.bDisabled			= true
				data.bTradingDisabled	= true
				
				UI.Chat_Bookmark_List_NEW:SetRecordData( data, recordIdx )

			end

		end
		
	end

end


--
function UI.ChatWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	-- #0104461(0487482) - при клике за пределами чата (кроме случая линковки в чат предметов) фокус сбрасывается
	-- #0106141(0493173) - в бою это не надо
	if self:IsInInputMode() and not ( UI.HudWnd and UI.HudWnd:IsOnScreen() ) then
	
		local bNeedStopInput = false
		
		local mouseX = UI:GetMouseX()
		local mouseY = UI:GetMouseY()

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )
		if wndUnderMouse ~= self and not wndUnderMouse:IsChildOf( self ) then
			if not UI:CanAddLinkToChatOnClick( mouseX, mouseY ) then
				bNeedStopInput = true
			end
		end
		
		if bNeedStopInput then
			self:StopInput()
		end
		
	end

end


-- -------------------------------------
-- const
-- -------------------------------------

cw.layers =
{
	MAIN_EFFECT			= 0,
	WORK_EFFECT			= 1,
	MAIN_EFFECT_1080	= 2,
	WORK_EFFECT_1080	= 3,
}

cw.modes =
{
	HANGAR 	= 1,
	OFF 	= 2,
}

cw.DEFAULT_HANGAR_MODE = cw.modes.OFF
cw.DEFAULT_HUD_MODE = cw.modes.OFF
cw.SHIFT_X		= 10
cw.OFF_LIST_SIZE = 4

cw.effectInfo =
{
	work =
	{
		listLocator	= "list"
	},

	list =
	{
		color2Locator =
		{
            [ UI.Chat.colorIds.SYSTEM ]				= "cc_system",
            [ UI.Chat.colorIds.IGNORED ]			= "cc_ignored",
            [ UI.Chat.colorIds.SAY ]				= "cc_say",
            [ UI.Chat.colorIds.PARTY ]				= "cc_party",
            [ UI.Chat.colorIds.ENEMY ]				= "cc_enemy",
            [ UI.Chat.colorIds.RAID ]				= "cc_raid",
            [ UI.Chat.colorIds.GUILD ]				= "cc_guild",
            [ UI.Chat.colorIds.YELL ]				= "cc_yell",
            [ UI.Chat.colorIds.WHISPER ]			= "cc_whisper",
            [ UI.Chat.colorIds.CHANNEL_JOIN ]		= "cc_channel_join",
            [ UI.Chat.colorIds.CHANNEL_LEAVE ]		= "cc_channel_leave",
            [ UI.Chat.colorIds.CHANNEL_LIST ]		= "cc_channel_list",
            [ UI.Chat.colorIds.CHANNEL_NOTICE ]		= "cc_channel_notice",
            [ UI.Chat.colorIds.BATTLE_LOG ]			= "cc_channel_butlog",
            [ UI.Chat.colorIds.RED]					= "cc_ignored",
			[ UI.Chat.colorIds.SCRIPTED_REWARD ]	= "cc_channel_butlog",
			[ UI.Chat.colorIds.SCRIPTED_EVENT ]		= "cc_channel_notice3",
		}
	}
}

cw.sounds =
{
	open	= "sound/ui/commonListOpen",
	close	= "sound/ui/commonListClose",
}

cw.secondStringSpace	= UI:XTo1024x768( 10, { x = 1280, y = 720 } )

-- -------------------------------------
-- vars
-- -------------------------------------

cw.listWnd_BRIEF			= nil
cw.listWnd_NEW 				= nil
cw.editWnd					= nil
cw.hangarMode				= -1
cw.hudMode 					= -1
cw.colors					= {}
cw.inited					= false
cw.mode 					= -1
cw.lastHangarMode 			= -1
cw.inHudNow 				= false
cw.selTabTypeToSet			= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.ChatWnd:F_PostLoad()
	
	UI.Wnd.F_PostLoad( self )

	self.listWnd_BRIEF	= UI.Chat_ListWnd_BRIEF
	self.listWnd_NEW 	= UI.Chat_ListWnd_NEW

	self.editWnd		= UI.Chat_EditWnd

	self:InitColors()

	self:ResetList()

	local handle = self:GetUiHandle()

	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )	
	
	self:SetDefaultActivatableChild( self.editWnd:GetName() )

end


--
function UI.ChatWnd:InitColors()

	local listEffect = _G.UI_SpawnEffect( "chat_list", self:GetUiHandle() )

	for colorName, colorId in pairs( UI.Chat.colorIds ) do
		
		local locator = self.effectInfo.list.color2Locator[ colorId ]
		if locator then
			self.colors[ colorId ] = listEffect and listEffect:GetObjColor( locator ) or UI.WHITE_COLOR
		else
			sys.log( "UI.ChatWnd:InitColors()[ERROR]: cannot find locator for color %s", colorName )
			self.colors[ colorId ] = UI.WHITE_COLOR
		end
		
	end

	if listEffect then
		_G.UI_DestroyEffect( listEffect )
	end

end


--
function UI.ChatWnd:F_OnAfterShowOnScreen()
	
	UI.Chat:Connect( true )
	if not self.inited then
		self:FullUpdate()
		self.inited = true
	end
	self:SetMode( self.mode )
	self:OnAfterShowOnScreen()
	
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

end


--
function UI.ChatWnd:FullUpdate()

	local mode = self.mode

	self:Reset()

	self:SetMode( mode )
	local setTabType = nil

	if self.selTabTypeToSet then
		setTabType = self.selTabTypeToSet
		self.selTabTypeToSet = nil
	else
    	if UI.Chat_Bookmark_List_NEW:GetSelectedRecord() ~= -1 then
    		setTabType = UI.Chat_Bookmark_List_NEW:GetRecordData( UI.Chat_Bookmark_List_NEW:GetSelectedRecord() ).tabType
    	end
	end

	UI.Chat_Bookmark_List_NEW:Clear()
	for tabIdx = 1, UI.Chat:GetTabCount() do
		if UI.Chat:IsTabVisible( tabIdx ) then
			local tabType = UI.Chat:GetTabType( tabIdx )
			
			local data =
			{
				tabType			= tabType,
				bDisabled		= false,
			}
			
			if tabType == "TRADING" then
			
				local minBattles			= UI:GetTradingSellerMinBattles()
				local need2StepAuth 		= UI:IsTradingSeller2StepAuthNeeded()
				local machinePlayerBattles	= _G.MasterServer_GetMachineAntibotCounter()
				local playerBattles 		= _G.MasterServer_GetAntibotCounter()
				local player2StepAuth 		= _G.MasterServer_Is2StepAuthEnabled()
				local bTradingEnabled = minBattles == -1
					or minBattles <= machinePlayerBattles
					or ( minBattles <= playerBattles and ( not need2StepAuth or player2StepAuth ) )
				
				if not bTradingEnabled then
					data.bDisabled			= true
					data.bTradingDisabled	= true
				end
				
			end
			
    		local recordIdx = UI.Chat_Bookmark_List_NEW:AddRecord( data )
    		if setTabType and tabType == setTabType then
    			UI.Chat_Bookmark_List_NEW:SelectRecord( recordIdx )
    		end
		end
	end

	if UI.Chat_Bookmark_List_NEW:GetSelectedRecord() == -1 then
		for recordIdx = 1, UI.Chat_Bookmark_List_NEW:GetNumRecords() do
			if not UI.Chat_Bookmark_List_NEW:GetRecordData( recordIdx ).bDisabled then
				UI.Chat_Bookmark_List_NEW:SelectRecord( recordIdx )
				break
			end
		end
	end
	
	if UI.HangarWnd and UI.HangarWnd:IsOnScreen() then
		self:AddChild( UI.Chat_TradingBtn )
		self:UpdateTradingBtnState()
	end

end


--
function UI.ChatWnd:Reset()

	self.listWnd_BRIEF:Reset()	
	self.listWnd_NEW:Reset()
	--self.editWnd:SetEditText( "" )
	self.mode = -1
	UI.Chat_TradingBtn:UnlinkFromParent()
	self:HideTradingWnd()

end


--
function UI.ChatWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end
	
	local mainEffect_1080 = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT_1080 )
	local workEffect_1080 = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT_1080 )

	local listWnd = self:GetCurListWnd()
	if not listWnd then
		return
	end
	
	local listLocatorPos	= workEffect:GetObjPos( self.effectInfo.work.listLocator )
	local listMaxSize		= listWnd:GetBaseSize()
	local selfRect			= self:GetRect()
	local listRect			= listWnd:GetRect()
	local bInHud			= UI.HudWnd and UI.HudWnd:IsOnScreen()
	
	if bInHud then
		mainEffect:UnlinkLayer( self:GetUiHandle(), self.layers.WORK_EFFECT, "" )
		workEffect:SetPos( UI.HudEditor:GetWndPos( "ChatWnd" ) )
	else
		mainEffect:LinkLayer( self:GetUiHandle(), self.layers.WORK_EFFECT, "chat", UI.EffectAnimParams.POS )
	end
	
	local workEffectPos = workEffect:GetPos()
	
	local listX = workEffectPos.x + listLocatorPos.x
	listWnd:SetLeft( listX )
	
	local btm = workEffectPos.y + workEffect:GetObjSize( "self" ).y
	
	if self.mode == self.modes.HANGAR then
		
		local offsetLocator = bInHud and "list2" or "list3"
		local offset = workEffect:GetObjPos( offsetLocator )
		local size = workEffect:GetObjSize( "self" )
		listWnd:SetTop( btm - listRect.w - ( size.y - offset.y ) )
		--UI.Chat_EditWnd:UnlinkFromParent()
		local inputLocator = bInHud and "input2" or "input3"
		UI:AddChildAndLink( self, UI.Chat_EditWnd, workEffect, inputLocator, UI.EffectAnimParams.POS )
	elseif self.mode == self.modes.OFF then
		local pos = workEffect:GetObjPos( "hide_mode" )
		local size = workEffect:GetObjSize( "self" )
		listWnd:SetLeft( pos.x --[[- 15]] )
		listWnd:SetTop( btm - listRect.w - ( size.y - pos.y ) --[[+ 10]] )
		--UI:AddChildAndLink( self, listWnd, workEffect, "hide_mode", UI.EffectAnimParams.POS )
	end
	UI.Chat_EditWnd:RecalcLayout2()

end


--
function UI.ChatWnd:SetMode( mode )

	if UI.HudWnd and UI.HudWnd:IsOnScreen() then
		if not self.inHudNow then
			self.inHudNow = true
			mode = self.DEFAULT_HUD_MODE
		end
		if UI.Chat_ListWnd_NEW.alwaysVisible then
			mode = self.modes.HANGAR
		end
	else
		self.inHudNow = false
	end

	if mode == -1 then
		mode = self.lastHangarMode
		if mode == -1 then
			mode = self.DEFAULT_HANGAR_MODE
		end
	end

	--[[if mode == self.mode then
		return
	end]]

	if UI:Val2Key( self.modes, mode ) == "" then
		sys.log( "UI.ChatWnd:SetMode()[ERROR]: invalid mode; one of the \"UI.ChatWnd.modes\" values expected, got %s", tostring( mode ) )
		return
	end

	self.lastHangarMode = mode
	local forceInput = self.mode ~= mode
	self.mode = mode

	if mode == self.modes.OFF then
		if UI.Chat:GetCurrentTab() ~= 0 then
			self.lastTab = UI.Chat:GetCurrentTab()
		end
		UI.Chat:SetTab( 0 )
	else
		if self.lastTab then
			UI.Chat:SetTab( self.lastTab )
			self.lastTab = nil
		end
	end
	

	self:ResetList()

	local listWnd = self:GetListWndForMode( self.mode ) 
	if listWnd then
		self:AddChild( listWnd )
	end

	local bNeedChatBtn = false
	self:AddChild( UI.Chat_EditWnd )
	if mode == self.modes.HANGAR or mode == self.modes.OFF then
		if mode == self.modes.OFF then
			-- SC-112952 StopInput должен быть обязательно ПЕРЕД отлинковкой Chat_EditWnd,
			-- иначе функция UI.EffectEditWnd:ResetDefaultActivatableChildHierarchy( parent )
			-- неправильно сработает, т.к. не будет парента, и в результате глобальный фокус ввода скривеет
			UI.ChatWnd:StopInput()
			UI.Chat_EditWnd:UnlinkFromParent()
		end

		if mode == self.modes.OFF or not self.inHudNow then
			bNeedChatBtn = true
		end

		--UI.Chat_ListWnd_BRIEF:UnlinkFromParent()
	--[[elseif self.mode == self.modes.OFF then
		UI.Chat_ListWnd_BRIEF:ShowLastMsgs()]]
	end
	
	UI.Chat_ChatBtn_1080:UnlinkFromParent()
	UI.Chat_ChatBtn_720:UnlinkFromParent()
	if bNeedChatBtn then
		if self.inHudNow then
			self:AddChild( UI.Chat_ChatBtn_720 )
		else
			self:AddChild( UI.Chat_ChatBtn_1080 )
		end
	end

	self:RecalcLayout()

	local alwaysVisibleModeOn = UI.Chat_ListWnd_NEW.alwaysVisible and ( UI.HudWnd and UI.HudWnd:IsOnScreen() )
	local bWasInput = UI.ChatWnd:IsInInputMode()
	local bNeedFocus = self.mode == self.modes.HANGAR and ( not alwaysVisibleModeOn or forceInput or bWasInput )
	
	if bNeedFocus then
		self.editWnd:RemoveStyle( UI.WS_NOT_KB_REACT )
	else
		self.editWnd:AddStyle( UI.WS_NOT_KB_REACT )
	end
	UI:ValidateKeyboardFocus()

	if bNeedFocus then
		if UI:CanChatInput() then
			UI:ForceStartChatInput( false )
		end
	end

end


--
function UI.ChatWnd:ResetList()

	if self.listWnd_NEW:IsChildOf( self ) then
		self.listWnd_NEW:Reset()	
		self.listWnd_NEW:UnlinkFromParent()
	end

	if self.listWnd_BRIEF:IsChildOf( self ) then	
		self.listWnd_BRIEF:Reset()	
		self.listWnd_BRIEF:UnlinkFromParent()
	end

end


--
function UI.ChatWnd:GetListWndForMode( mode )

	if mode == self.modes.HANGAR then
		return self.listWnd_NEW

	elseif mode == self.modes.OFF then
		return self.listWnd_BRIEF

	else
		return nil
	end

end


--
function UI.ChatWnd:GetCurListWnd()

	return self:GetListWndForMode( self.mode )

end


--
function UI.ChatWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.editWnd or wnd:IsChildOf( self.editWnd ) then
		UI:CheckStartChatInput()

	elseif wndThatReceivedInput == UI.Chat_ChatBtn_1080:GetUiHandle() or wndThatReceivedInput == UI.Chat_ChatBtn_720:GetUiHandle() then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self:SetMode( self.mode == self.modes.HANGAR and self.modes.OFF or self.modes.HANGAR )


	elseif wndThatReceivedInput == UI.ChatNEW_CrossBtn:GetUiHandle() then
		UI:PlayGlobalSound( "sound/ui/MsgHide" )
		self:StopInput()

		if self:GetMode() == self.modes.HANGAR then
			local bAlwaysVisible = UI.HudWnd and UI.HudWnd:IsOnScreen() and UI.Chat_ListWnd_NEW:IsOnScreen() and UI.Chat_ListWnd_NEW.alwaysVisible
			if not bAlwaysVisible then
				self:SetMode( self.modes.OFF )
			end
		end
		
	elseif wndThatReceivedInput == UI.Chat_TradingBtn:GetUiHandle() then
	
		if not UI.Chat_TradingBtn:IsGray() then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			self:ToggleTrading()
		end
		
		return false	-- чтобы обработалось в UI.HangarWnd - там выключается закладка, если кликнуть на какой-то элемент, не относящийся к окну закладки
		
	end

	return true

end


--
function UI.ChatWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key == UI.Keys.KEY_TAB then
		return true
	end

	if self:OnKeyboardKeyDown( key, wndThatReceivedInput ) then
		return true
	end
		
	return self:HandleKey( key, -2 )	

end


--
function UI.ChatWnd:OnEnter( key, controllerIdx )

	if not self:IsInInputMode() then

		self:StartInput( false )

	else

    	local text = self.editWnd:GetEditText()
    	text = self.editWnd:GetTextInTransferFormat( text )	

    	-- for command "/clear" and other
    	if string.sub( text, 1, 1 ) == "/" then
    		UI.Chat:HandleInput( text )
    	else
    		if UI.HudWnd and UI.HudWnd:IsOnScreen() and not _G.Input_IsKeyPressed( UI.Keys.KEY_CONTROL ) then
    			UI.Chat:StopInput()
    			if UI.Chat_ListWnd_NEW:IsOnScreen() and UI.Chat_ListWnd_NEW.alwaysVisible then

    			else
    				self:SetMode( self.modes.OFF )
    			end
    		end

    		if text ~= "" then
    			UI.Chat:HandleInput( text )
    		end
    	end

    	--[[if not _G.Input_IsKeyPressed( UI.Keys.KEY_CONTROL ) then
    		self.editWnd:SetEditText( "" )
    		UI.Chat:StopInput()
    	else
    		self.editWnd:SetEditText( "" )
    	end]]

    	self.editWnd:SetEditText( "" )

	end

	return true

end


--
function UI.ChatWnd:OnEscape( key, controllerIdx )

	if UI.TradingWnd:IsOnScreen() then

		self:HideTradingWnd()

	else

    	self.editWnd:SetEditText( "" )
    	UI.Chat:StopInput()
		
		if self:GetMode() == self.modes.HANGAR then
			local bAlwaysVisible = UI.HudWnd and UI.HudWnd:IsOnScreen() and UI.Chat_ListWnd_NEW:IsOnScreen() and UI.Chat_ListWnd_NEW.alwaysVisible
			if not bAlwaysVisible then
				self:SetMode( self.modes.OFF )
			end
		end

	end

	return true

end


--
function UI.ChatWnd:OnUp( key, controllerIdx )

	local historyText = UI.Chat:GetHistoryPrev()
	if not UI:IsStrEmpty( historyText ) then
		self.editWnd:SetTextFromTransferFormat( historyText )
	end	

	return true

end


--
function UI.ChatWnd:OnDown( key, controllerIdx )

	local historyText = UI.Chat:GetHistoryNext()
	if not UI:IsStrEmpty( historyText ) then
		self.editWnd:SetTextFromTransferFormat( historyText )
	end	

	return true

end


--
function UI.ChatWnd:OnPageUp( key, controllerIdx )

	if self.mode == self.modes.HANGAR then
		self.listWnd_NEW:ScrollPageUp( UI.SCROLL_SRC_KEYBOARD )
	end

	return true

end


--
function UI.ChatWnd:OnPageDown( key, controllerIdx )

	if self.mode == self.modes.HANGAR then
		self.listWnd_NEW:ScrollPageDown( UI.SCROLL_SRC_KEYBOARD )
	end

	return true

end


--
function UI.ChatWnd:F_OnEventSaveUiState()

	local selTabType = ""

	local selTab = UI.Chat_Bookmark_List_NEW:GetSelectedRecord()
	if selTab and selTab ~= -1 then
		local data = UI.Chat_Bookmark_List_NEW:GetRecordData( selTab )
		if data then
			selTabType = data.tabType
		end
	end

	UI.store.ChatWnd =
	{
		mode		= self.mode,
		lastHangarMode = self.lastHangarMode,
		inHudNow	= self.inHudNow,
		alwaysVisible = UI.Chat_ListWnd_NEW.alwaysVisible,
		text = UI.Chat_EditWnd:GetTextInTransferFormat(),
		selTabType = selTabType,
	}

end


--
function UI.ChatWnd:F_OnEventRestoreUiState()

	if UI.store.ChatWnd then

		_G.CL_LocalPlayerControllerSetIgnoreMouse( false )

		self.mode		= UI.store.ChatWnd.mode
		self.lastHangarMode = UI.store.ChatWnd.lastHangarMode
		self.inHudNow	= UI.store.ChatWnd.inHudNow
		UI.Chat_ListWnd_NEW.alwaysVisible = UI.store.ChatWnd.alwaysVisible
		UI.Chat_EditWnd:SetTextFromTransferFormat( UI.store.ChatWnd.text )
		self.selTabTypeToSet = UI.store.ChatWnd.selTabType

		UI.store.ChatWnd = nil
		
	end

end


--
function UI.ChatWnd:ToggleTrading()

	if UI.TradingWnd:IsOnScreen() then

		self:HideTradingWnd()

	else
	
		if not UI.Chat_TradingBtn:IsChildOf( self ) or not UI.Chat_TradingBtn:IsEnabled() or UI.Chat_TradingBtn:IsGray() then
			sys.log( "UI.ChatWnd:ToggleTrading()[ERROR]: trading is not enabled now" )
			return
		end

		UI.TradingWnd:Setup( UI.TradingWnd.modes.CHAT, self:GetName() )
		UI.TradingWnd:Show()

    	if self:GetMode() ~= self.modes.HANGAR then
    		self:SetMode( self.modes.HANGAR )
			self:SelectTabByType( "TRADING" )	-- автоматический переход на закладку торговли происходит только, если чат до этого был скрыт
    	end

	end

end


--
function UI.ChatWnd:SelectTabByType( tabType )

	if UI.Chat_Bookmark_List_NEW:IsChildOf( self ) then

		local recordIdx = UI.Chat_Bookmark_List_NEW:GetRecordByTabType( tabType )

		if recordIdx ~= -1 then
			UI.Chat_Bookmark_List_NEW:SelectRecord( recordIdx )
		else
			sys.log( "UI.ChatWnd:SelectTabByType()[ERROR]: cannot find tab %s", tabType )
		end

	else
		sys.log( "UI.ChatWnd:SelectTabByType()[ERROR]: tabs is not visible" )
	end

end


--
function UI.ChatWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ChatWnd:UpdateZOrder()

	if UI.Chat_EditWnd and UI.Chat_EditWnd.w and UI.Chat_EditWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Chat_EditWnd )
	end

end


--
function UI.ChatWnd:F_OnEventWndShown( hSender, hWnd )

	if UI.HangarWnd and hWnd == UI.HangarWnd:GetUiHandle() or UI.DebriefingWnd and hWnd == UI.DebriefingWnd:GetUiHandle() then
		if self:GetParent() then
			self:Show()	-- возможная смена родителя
		end
	end

end


--
function UI.ChatWnd:F_OnEventWndHided( hSender, hWnd )

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

    	if UI.HangarWnd and hWnd == UI.HangarWnd:GetUiHandle() or UI.DebriefingWnd and hWnd == UI.DebriefingWnd:GetUiHandle() then
    		if self:GetParent() then
    			self:Show() -- возможная смена родителя
    		end
    	end

	end

end


--
function UI.ChatWnd:F_OnAfterHideFromScreen()
	
	self:OnAfterHideFromScreen()

	self:HideTradingWnd()
	
	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.ChatWnd:UpdateTradingBtnState()

	-- необходимое количество сыгранных боев

	local minBattles			= UI:GetTradingSellerMinBattles()
	local need2StepAuth 		= UI:IsTradingSeller2StepAuthNeeded()
	local machinePlayerBattles	= _G.MasterServer_GetMachineAntibotCounter()
	local playerBattles 		= _G.MasterServer_GetAntibotCounter()
	local player2StepAuth 		= _G.MasterServer_Is2StepAuthEnabled()
	local bTradingEnabled = minBattles == -1
		or minBattles <= machinePlayerBattles
		or ( minBattles <= playerBattles and ( not need2StepAuth or player2StepAuth ) )
	
	if bTradingEnabled then
	
		UI.Chat_TradingBtn:SetGray( false )
		UI.Chat_TradingBtn:SetTooltipData( nil )
		
	else
		
		UI.Chat_TradingBtn:SetGray( true )

		local actualPlayerBattles = machinePlayerBattles
		if playerBattles > machinePlayerBattles and ( not need2StepAuth or player2StepAuth ) then
			actualPlayerBattles = playerBattles
		end
		
		local tooltipText = UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text_invalidNumBattles" )

		local baseColor = UI.TooltipWnd_shared:GetTextColor()

		local strNumBattles = string.format( "%d/%d", actualPlayerBattles, minBattles )
		strNumBattles = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), strNumBattles, UI:Color2Str( baseColor ) )
		
		local numSubst = 0
		tooltipText, numSubst = string.gsub( tooltipText, "%$num_battles%$", strNumBattles )
		if numSubst == 0 then
			sys.log( "UI.ChatWnd:UpdateTradingBtnState()[ERROR]: cannot find placeholder '$num_battles$' in string 'mailCreate_tradingModeBtn_tooltip_text_invalidNumBattles'" )
			tooltipText = string.format( "[INVALID STRING]Num battles required: %s", strNumBattles )
		end

		if playerBattles > machinePlayerBattles and need2StepAuth and not player2StepAuth then
			local text2stepAuth = UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text_2stepAuthNumBattles" )
			local str2stepAuthNumBattles = string.format( "%d/%d", playerBattles, minBattles )
			str2stepAuthNumBattles = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), str2stepAuthNumBattles, UI:Color2Str( baseColor ) )

			local numSubst = 0
			text2stepAuth, numSubst = string.gsub( text2stepAuth, "%$num_battles%$", str2stepAuthNumBattles )
			if numSubst == 0 then
				sys.log( "UI.ChatWnd:UpdateTradingBtnState()[ERROR]: cannot find placeholder '$num_battles$' in string 'mailCreate_tradingModeBtn_tooltip_text_2stepAuthNumBattles'" )
				text2stepAuth = string.format( "[INVALID STRING]Num battles required: %s", str2stepAuthNumBattles )
			end
			
			tooltipText	= string.format( "%s|%s", tooltipText, text2stepAuth )
		end

		local tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_caption" ),
			text		= tooltipText,
		}
		
		UI.Chat_TradingBtn:SetTooltipData( tooltipData )

	end
	
end


-- ------------------------------------------------------------
-- UI.Chat_ListWnd_BRIEF
-- ------------------------------------------------------------

UI.Chat_ListWnd_BRIEF = {}
local clb = UI.Chat_ListWnd_BRIEF

-- -------------------------------------
-- window definitions
-- -------------------------------------

UI.Chat_ListWnd_BRIEF.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Chat_ListWnd_BRIEF",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT + UI.WLS_OWNERDRAW,
			main		= true,			
			updatable	= false,

			effects =
			{{
				defName 			= "chat_list",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.Chat_ListWnd_BRIEF.layers.RECORDS",
						animParams	= UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text",	
						layer		= "UI.Chat_ListWnd_BRIEF.layers.MASK",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- RECORDS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ANIM_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "chat_list_anim",
				defaultAnimation	= "idle",
			}}
		},

		-- MASK
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "notificationsMask",
			visible		= false,
		},
	},
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Chat_ListWnd_BRIEF:Reset()

	self:ResetRecords()
	self.queue = {}

end


--
function UI.Chat_ListWnd_BRIEF:GetBaseSize()

	local maxSize = UI:ZeroVec2()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		maxSize = mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
	end

	return maxSize

end


-- -------------------------------------
-- const
-- -------------------------------------

clb.layers =
{
	MAIN_EFFECT		= 0,
	RECORDS			= 1,
	ANIM_EFFECT		= 2,
	MASK			= 3,
}

clb.effectInfo =
{
	main =
	{
    	maxSizeLocator		= "self",
    	minSizeLocator		= "min_dist",
    	recordsLocator		= "text",
		scrollBarLocator	= "scroll_max",
		headLocator			= "bookmark",
	},

    anim =
    {
    	animatedLocator = "anim"
    }
}

clb.MIN_SHOW_TIME			= 0
clb.MAX_SHOW_TIME			= 17
clb.MOVE_ANIM_TIME			= 0
clb.RECORD_SHOW_ANIM_TIME	= 0
clb.RECORD_HIDE_ANIM_TIME	= 3

clb.recordAnimTypes =
{
	NONE	= 1,
	SHOW	= 2,
	HIDE	= 3,
}

-- -------------------------------------
-- vars
-- -------------------------------------

clb.records				= {}
clb.numRecords			= 0
clb.queue				= {}
clb.recordsRect			= Quat( 0, 0, 0, 0 )
clb.animTime			= -1
clb.animDist			= 0
clb.animatedLocatorId	= -1
clb.lastMsgId			= nil
clb.nicknameWnd			= {}
clb.freeNicknameWnd		= {}
clb.freeLinkWnds		= {}
clb.linkWnds			= {}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Chat_ListWnd_BRIEF:GetMaskParam()

	local maskRect = self:ToScreen( self:GetLayerRect( self.layers.MASK ) )
	if UI.ChatWnd:GetMode() == UI.ChatWnd.modes.OFF then
		maskRect.x = 0
	end
	local hTexMask = self:GetTexture( self.layers.MASK )
	return maskRect, hTexMask

end

--
function UI.Chat_ListWnd_BRIEF:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:SetLayerVisible( false, self.layers.MAIN_EFFECT )

	local animEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_EFFECT )
	if animEffect then
		self.animatedLocatorId = animEffect:GetObjIdByName( self.effectInfo.anim.animatedLocator )
	end

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_CHAT_CLEAR )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_CHAT_MSG )

end


--
function UI.Chat_ListWnd_BRIEF:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	mainEffect:Update( 0 )

	local maxSelfSize			= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
	local minSelfSize			= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )

	local recordsLocatorPos		= mainEffect:GetObjPos( self.effectInfo.main.recordsLocator )
	local recordsLocatorSize	= mainEffect:GetObjSize( self.effectInfo.main.recordsLocator )
	local space_bottom_records	= maxSelfSize.y - ( recordsLocatorPos.y + recordsLocatorSize.y )

	local hFont					= self:GetFont( self.layers.RECORDS )
	local fontHeight			= _G.GetFontLineHeight( hFont )

	local recordsHeight = fontHeight * UI.ChatWnd.OFF_LIST_SIZE
	
	if recordsHeight > recordsLocatorSize.y then
		recordsHeight = math.floor( recordsLocatorSize.y / fontHeight ) * fontHeight
	end

	local selfHeight = recordsLocatorPos.y + recordsHeight + space_bottom_records
	if selfHeight < minSelfSize.y then
		selfHeight = minSelfSize.y
	end

	self.recordsRect = Quat( recordsLocatorPos.x, recordsLocatorPos.y, recordsLocatorSize.x, recordsHeight )

	self:SetWidth( maxSelfSize.x )
	self:SetHeight( selfHeight ) 

	local animTime = ( selfHeight - minSelfSize.y ) / ( maxSelfSize.y - minSelfSize.y )
	mainEffect:SetAnimationTime( animTime ) 

	mainEffect:Update( 0 )	

end 


--
function UI.Chat_ListWnd_BRIEF:ResetRecords()

	while self.numRecords > 0 do
		self:RemoveRecord( self.numRecords )
	end

end


--
function UI.Chat_ListWnd_BRIEF:RemoveRecord( recordIdx )

	local record = self.records[ recordIdx ]
	if not record then
		return
	end

	for k, v in pairs( record.wnd ) do

		if UI:IsWndKindOf( v, "Chat_NickNameWnd" ) then
			self.freeNicknameWnd[ #self.freeNicknameWnd + 1 ] = v

		elseif UI:IsWndKindOf( v, "LinkWnd" ) then
			v:Reset()
			table.insert( self.freeLinkWnds, v )
		end

		v:UnlinkFromParent()

	end
	record.wnd = {}

	record.metaText:Clear()

	table.remove( self.records, recordIdx )
	self.numRecords = self.numRecords - 1

end


--
function UI.Chat_ListWnd_BRIEF:AddRecord( msgId )

	self.lastMsgId = msgId
	
	if self:CanAddRecordNow( false ) then
		self:AddRecordInternal( msgId )
	else
		self:EnqueueRecord( msgId )
	end

end


--
function UI.Chat_ListWnd_BRIEF:CanAddRecordNow( bIgnoreQueue )

	if not bIgnoreQueue then
    	if next( self.queue ) then
    		return false
    	end
	end

	if self.animTime ~= -1 then
		return false
	end

	if self.numRecords > 0 then

		local lastRecordShowTime = self.records[ self.numRecords ].showTime
		if lastRecordShowTime ~= -1 and lastRecordShowTime < self.MIN_SHOW_TIME then
			return false
		end

	end

	return true	

end


--
function UI.Chat_ListWnd_BRIEF:EnqueueRecord( data )

	table.insert( self.queue, data )

end


--
function UI.Chat_ListWnd_BRIEF:AddRecordInternal( msgId )

	local record = self:CreateRecordForMsg( msgId )

	self:PlayRecordShowAnimation( record )

	local y = self.recordsRect.y + self.recordsRect.w - self:GetRecordHeight( record )
	record.srcY = y
	record.dstY = y
	self:SetRecordPos( record, y )

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	if self.numRecords > 1 then
		self:StartMoveAnimation()
	end

end

--
function UI.Chat_ListWnd_BRIEF:ObtainFreeNickNameWnd()
	local nicknameWnd
	if #self.freeNicknameWnd > 0 then
		nicknameWnd = self.freeNicknameWnd[ #self.freeNicknameWnd ]
		table.remove( self.freeNicknameWnd, #self.freeNicknameWnd )
		return nicknameWnd
	end
	nicknameWnd = UI:CreateChildWnd( self, UI.Chat_NickNameWnd, #self.nicknameWnd + 1 )
	self.nicknameWnd[ #self.nicknameWnd + 1 ] = nicknameWnd
	return nicknameWnd
end


--
function UI.Chat_ListWnd_BRIEF:ObtainFreeLinkWnd()

	local linkWnd = nil

	local freeLinkWndIdx, freeLinkWnd = next( self.freeLinkWnds )

	if freeLinkWnd then
		linkWnd = freeLinkWnd
		self.freeLinkWnds[ freeLinkWndIdx ] = nil
	end

	if not linkWnd then
		linkWnd = UI:CreateChildWnd( self, UI.LinkWnd, #self.linkWnds + 1 )
		table.insert( self.linkWnds, linkWnd )
	end

	return linkWnd

end


--
function UI.Chat_ListWnd_BRIEF:CreateRecordForMsg( msgId )

	local record = self:CreateEmptyRecord()

	record.color		= UI.ChatWnd:GetMsgColor( msgId )
	record.metaText = UI.MetaText.GetNewInstance()
	record.metaText:SetParentWindow( self )
	local textHeight, wnd, bShifted = UI.ChatWnd:FormatMsgText( msgId, self:GetFont( self.layers.RECORDS ), self:GetTextFormatFlags( self.layers.RECORDS ), self.recordsRect.z, record.metaText, self )
	record.msgId	= msgId
	record.wnd 		= wnd
	record.bShifted = bShifted
	--[[for k, v in pairs( wnd ) do
		self:AddChild( v )
	end]]

	if record.bShifted then
		record.rect.x, record.rect.z, record.rect.w = UI.ChatWnd.SHIFT_X, self.recordsRect.z - UI.ChatWnd.SHIFT_X, textHeight
	else
		record.rect.x, record.rect.z, record.rect.w = 0, self.recordsRect.z, textHeight
	end

	return record

end


--
function UI.Chat_ListWnd_BRIEF:CreateEmptyRecord()

	local record = {}

	record.msgId		= -1
	record.color		= UI.WHITE_COLOR
	record.text			= ""
	record.text2		= ""
	record.rect			= Quat( 0, 0, 0, 0 )
	record.showTime		= 0	
	record.animType		= self.recordAnimTypes.NONE
	record.animTime		= -1
	record.animAlpha	= 1
	record.posAlpha		= 1
	record.srcY			= 0	
	record.dstY			= 0
	record.bShifted		= false

	return record

end


--
function UI.Chat_ListWnd_BRIEF:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.RECORDS then
		self:DrawRecords()
	end

end


local l_cipRect_BRIEF = Quat( 0, 0, 1024, 768 )	-- вспомогательная переменная, чтобы не выделять память каждый кадр при отрисовке

--
function UI.Chat_ListWnd_BRIEF:DrawRecords()

	if self.numRecords == 0 then
		return
	end

	UI.drawer:EndUiDrawing()

	local hFont			= self:GetFont( self.layers.RECORDS )
	local formatFlags	= self:GetTextFormatFlags( self.layers.RECORDS )
	local fontHeight	= _G.GetFontLineHeight( hFont )

	for recordIdx, record in pairs( self.records ) do

		local formatRect = self:ToScreen( record.rect )
		record.metaText:SetScreenOrg( formatRect )
		local alpha 		= self:GetRecordAlpha( record ) * 255
		local color 		= UI:SetAlpha( record.color, alpha )
		record.metaText:SetColor( color )

		for k, v in pairs( record.wnd ) do
			--[[if UI.Chat:GetMsgType( record.msgId ) == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
				v:SetColor( 0xfffff68f )
			else
				v:SetColor( color )
			end]]
			self:AddChild( v )
			v:SetAlpha( alpha )
		end
		record.metaText:Draw( l_cipRect_BRIEF.x, l_cipRect_BRIEF.y, l_cipRect_BRIEF.z, l_cipRect_BRIEF.w )

		--[[local formatRect	= self:ToScreen( record.rect )
		local alpha 		= self:GetRecordAlpha( record ) * 255
		local color 		= UI:SetAlpha( record.color, alpha )

		if not UI:IsStrEmpty( record.text2 ) then

			local formatRect2 = UI:QuatCopy( formatRect )

			formatRect2.x = formatRect2.x + UI.ChatWnd.secondStringSpace
			formatRect2.z = formatRect2.z - UI.ChatWnd.secondStringSpace
			formatRect2.y = formatRect2.y + fontHeight

            _G.UI_DrawText(
                record.text2,
                hFont,
                formatRect2,
                color,
				0,
                formatFlags,
                l_cipRect_BRIEF
            )
		end]]

	end

	UI.drawer:BeginUiDrawing()

end


--
function UI.Chat_ListWnd_BRIEF:F_OnEventChatMsg( hSender, iParam0, iParam1, fParam0, fParam1 )

	local lastMsgId = UI.Chat:GetLastMsgId( 0 )

	if not self:IsOnScreen() then

		if UI.ChatWnd:IsOnScreen() then
			self.lastMsgId = lastMsgId
		end

		return

	end

	-- disable redundance message
	if self.lastMsgId == lastMsgId then
		return
	end

	if lastMsgId ~= -1 then
		self:AddRecord( lastMsgId )
	end

end


--
function UI.Chat_ListWnd_BRIEF:F_OnEventChatClear( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:ResetRecords()

end


--
function UI.Chat_ListWnd_BRIEF:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcLayout()
	self:ShowLastMsgs()

end


--
function UI.Chat_ListWnd_BRIEF:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Chat_ListWnd_BRIEF:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
function UI.Chat_ListWnd_BRIEF:StartMoveAnimation()

	if self.animTime ~= -1 then
		sys.log( "UI.Chat_ListWnd_BRIEF:StartMoveAnimation()[ERROR]: already animating" )
		return
	end

	if self.numRecords < 2 then
		sys.log( "UI.Chat_ListWnd_BRIEF:StartMoveAnimation()[ERROR]: < 2 records" )
	end

	self.animTime = 0

	local lastRecord = self.records[ self.numRecords ]
	self.animDist = self:GetRecordHeight( lastRecord )

	for recordIdx = 1, self.numRecords - 1 do
		local record = self.records[ recordIdx ]
		local y = self:GetRecordPos( record )
		record.dstY = y - self.animDist
	end 	

end



--
function UI.Chat_ListWnd_BRIEF:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateRecordsShowTime( dt_sys )
	self:UpdateRecordsAnimation( dt_sys )
	self:UpdateMoveAnimation( dt_sys )
	self:RemoveExpiredRecords()
	self:CheckQueue()
	self:UpdateBgAlpha()

end


--
function UI.Chat_ListWnd_BRIEF:UpdateMoveAnimation( dt )

	if self.animTime == -1 then
		return
	end

	for recordIdx = 1, self.numRecords - 1 do

		local record = self.records[ recordIdx ]

		local dist = self.MOVE_ANIM_TIME ~= 0 and ( self.animDist / self.MOVE_ANIM_TIME ) * dt or self.animDist

		local y = self:GetRecordPos( record )
		y = y - dist

		if y <= record.dstY then
			y = record.dstY
			record.srcY = record.dstY
		end

		self:SetRecordPos( record, y )

	end	

	self.animTime = self.animTime + dt

	if self.animTime >= self.MOVE_ANIM_TIME then
		self.animTime = -1
	end
	
end


--
function UI.Chat_ListWnd_BRIEF:RemoveExpiredRecords()

	if self.numRecords == 0 then
		return		
	end

	if self.animTime ~= -1 then
		return
	end

	while self.numRecords > 0 do
		local record = self.records[ 1 ]

		if self:GetRecordAlpha( record ) <= 1e-3 then
			self:RemoveRecord( 1 )			
		else
			break
		end
	end

end


--
function UI.Chat_ListWnd_BRIEF:SetRecordPos( record, y )

	record.rect.y = y 
	record.posAlpha = self:GetAlphaForY( record, y )

end


--
function UI.Chat_ListWnd_BRIEF:GetRecordPos( record )

	return record.rect.y

end


--
function UI.Chat_ListWnd_BRIEF:GetRecordHeight( record )

	return record.rect.w

end


-- returns 0..1
function UI.Chat_ListWnd_BRIEF:GetAlphaForY( record, y )

	if self.recordsRect.y - record.dstY <= 1e-3 then
		return 1
	end

	local alpha = record.srcY ~= record.dstY and ( y - record.dstY ) / ( record.srcY - record.dstY ) or 0
	return UI:Clamp( alpha, 0, 1 )

end


--
function UI.Chat_ListWnd_BRIEF:CheckQueue()

	if not next( self.queue ) then
		return
	end

	if self:CanAddRecordNow( true ) then
		local msgId = table.remove( self.queue, 1 )
		self:AddRecordInternal( msgId )
	end

end


--
function UI.Chat_ListWnd_BRIEF:UpdateRecordsShowTime( dt )

	for idx, record in pairs( self.records ) do

		if record.showTime ~= -1 then

			record.showTime = record.showTime + dt

        	if record.showTime >= self.MAX_SHOW_TIME then
        		record.showTime = -1
        		self:PlayRecordHideAnimation( record )
        	end	

		end

	end

end


--
function UI.Chat_ListWnd_BRIEF:UpdateRecordsAnimation( dt )

	for idx, record in pairs( self.records ) do

		if record.animTime ~= -1 then

			local maxAnimTime = self:GetRecordMaxAnimTime( record.animType )
			local bStop = false

			record.animTime = record.animTime + dt

			if record.animTime >= maxAnimTime then
				record.animTime = maxAnimTime				
				bStop = true
			end

			record.animAlpha = self:GetAlphaForAnim( record.animType, record.animTime ) 

			if bStop then
				record.animTime = -1
				record.animType = self.recordAnimTypes.NONE
			end			

		end

	end

end


--
function UI.Chat_ListWnd_BRIEF:PlayRecordShowAnimation( record )

	record.animType	= self.recordAnimTypes.SHOW
	record.animTime	= 0
	record.animAlpha = self:GetAlphaForAnim( record.animType, record.animTime )

end


--
function UI.Chat_ListWnd_BRIEF:PlayRecordHideAnimation( record )

	record.animType	= self.recordAnimTypes.HIDE
	record.animTime	= 0
	record.animAlpha = self:GetAlphaForAnim( record.animType, record.animTime )

end


-- returns 0..1
function UI.Chat_ListWnd_BRIEF:GetAlphaForAnim( animType, animTime )

	local alpha = 0

	local maxAnimTime = self:GetRecordMaxAnimTime( animType )

	if animType == self.recordAnimTypes.SHOW then
		alpha = UI:Clamp( maxAnimTime ~= 0 and animTime / maxAnimTime or 1, 0, 1 )

	elseif animType == self.recordAnimTypes.HIDE then
		alpha = UI:Clamp( 1 - ( maxAnimTime ~= 0 and animTime / maxAnimTime or 1 ), 0, 1 )
	end

	return alpha

end


--
function UI.Chat_ListWnd_BRIEF:GetRecordMaxAnimTime( animType )

	if animType == self.recordAnimTypes.SHOW then
		return self.RECORD_SHOW_ANIM_TIME

	elseif animType == self.recordAnimTypes.HIDE then
		return self.RECORD_HIDE_ANIM_TIME

	else
		return 0
	end

end


--
function UI.Chat_ListWnd_BRIEF:GetRecordAlpha( record )

	return record.animAlpha * record.posAlpha

end


--
function UI.Chat_ListWnd_BRIEF:ShowLastMsgs()

	self:ResetRecords()

	local lastShownMsg	= self.lastMsgId or -1
	local firstMsgId	= lastShownMsg ~= -1 and lastShownMsg + 1 or UI.Chat:GetFirstMsgId( 0 )
	local lastMsgId		= UI.Chat:GetLastMsgId( 0 )

	if lastMsgId == -1 then
		return
	end

	local y = self.recordsRect.y + self.recordsRect.w

	for msgId = lastMsgId, firstMsgId, -1 do

		local record = self:CreateRecordForMsg( msgId )

		y = y - self:GetRecordHeight( record )

		if self.recordsRect.y - y > 1e-3 then
			break
		end

		record.srcY = y
		record.dstY = y
		self:SetRecordPos( record, y )

		table.insert( self.records, 1, record )
		self.numRecords = self.numRecords + 1

	end

	self.lastMsgId = lastMsgId

end


--
function UI.Chat_ListWnd_BRIEF:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.ANIM_EFFECT ) then
		self:SetLayerVisible( self, self.layers.MAIN_EFFECT )
	end

end


--
function UI.Chat_ListWnd_BRIEF:AnimateBgAlpha()

	self:SetLayerVisible( true, self.layers.MAIN_EFFECT )

	local animEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_EFFECT )
	if animEffect then
		animEffect:RestartAnimation()
	end

end


--
function UI.Chat_ListWnd_BRIEF:UpdateBgAlpha()

	local animEffect = UI:GetEffectFromLayer( self, self.layers.ANIM_EFFECT )	
	if not animEffect or not animEffect:IsAnimationPlaying() then
		return
	end

	local alpha = animEffect:GetObjAlphaById( self.animatedLocatorId )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:SetAlpha( alpha )
		mainEffect:Update( 0 )
	end

end

-- ----------------------------------------------------------------------
-- UI.Chat_Bookmark_List_NEW
-- ----------------------------------------------------------------------

UI.Chat_Bookmark_List_NEW = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.Chat_Bookmark_List_NEW.def =
{
	className 	= "Wnd",

	props =
	{
		name	= "Chat_Bookmark_List_NEW",
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
				defName				= "chat_bookmark_list",
				defaultAnimation    = "idle",
			}}
		},
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

-- интерфейс повторяет UI.ButtonsListWnd, от которого список закладок раньше был производным

--
function UI.Chat_Bookmark_List_NEW:Clear()

	for idx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots	= {}
	self.selIdx		= -1

	self:RecalcLayout()
	UI.Chat_ListWnd_NEW:OnBookmarksChanged()

end	


--
function UI.Chat_Bookmark_List_NEW:AddRecord( data )

	local slotWnd = self:ObtainFreeSlot()

	local idx = #self.curSlots
	slotWnd:Setup( data, idx )

	self:RecalcLayout()
	UI.Chat_ListWnd_NEW:OnBookmarksChanged()

	return idx

end	


--
function UI.Chat_Bookmark_List_NEW:GetNumRecords()

	return #self.curSlots

end


--
function UI.Chat_Bookmark_List_NEW:GetRecordData( recordIdx )

	local slotWnd = self.curSlots[ recordIdx ]
	if slotWnd then
		return slotWnd:GetData()
	else
		sys.log( "UI.Chat_Bookmark_List_NEW:GetRecordData()[ERROR]: invalid recordIdx (%d)", recordIdx )
		return nil
	end

end


--
function UI.Chat_Bookmark_List_NEW:SetRecordData( data, recordIdx )

	local slotWnd = self.curSlots[ recordIdx ]
	if slotWnd then
		slotWnd:Setup( data, recordIdx )
	else
		sys.log( "UI.Chat_Bookmark_List_NEW:SetRecordData()[ERROR]: invalid recordIdx (%d)", recordIdx )
	end

end


--
function UI.Chat_Bookmark_List_NEW:SelectRecord( recordIdx )

	if self.selIdx == recordIdx then
		return
	end
	
	if recordIdx ~= -1 then
		local data = self:GetRecordData( recordIdx )
		if data and data.bDisabled then
			sys.log( "UI.Chat_Bookmark_List_NEW:SelectRecord()[ERROR]: cannot select disabled tab" )
			return
		end
	end

	local oldSelIdx = self.selIdx
	self.selIdx = recordIdx

	local oldSelSlotWnd = oldSelIdx ~= -1 and self.curSlots[ oldSelIdx ]
	if oldSelSlotWnd then
		oldSelSlotWnd:Select( false )
	end

	local newSelSlotWnd = nil

	if recordIdx ~= -1 then
		newSelSlotWnd = self.curSlots[ recordIdx ]
		if not newSelSlotWnd then
			sys.log( "UI.Chat_Bookmark_List_NEW:SelectRecord()[ERROR]: invalid recordIdx (%d)", recordIdx )
		end
	end

	if newSelSlotWnd then
		newSelSlotWnd:Select( true )
	end

	self:OnSelTabChanged()
	
end


--
function UI.Chat_Bookmark_List_NEW:GetSelectedRecord()

	return self.selIdx

end


--
function UI.Chat_Bookmark_List_NEW:GetRecordByTabType( tabType )

	for idx, slotWnd in pairs( self.curSlots ) do
		local data = slotWnd:GetData()
		if data.tabType == tabType then
			return idx
		end
	end

	return -1

end


--
function UI.Chat_Bookmark_List_NEW:GetRecordByTabIdx( tabIdx )

	local tabTye = UI.Chat:GetTabType( tabIdx )
	return self:GetRecordByTabType( tabType )

end


--
function UI.Chat_Bookmark_List_NEW:GetBaseSize()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	return mainEffect:GetObjSize( "self" )

end


-- -----------------------------
-- const
-- -----------------------------

UI.Chat_Bookmark_List_NEW.layers =
{
	MAIN_EFFECT	= 0,
}

UI.Chat_Bookmark_List_NEW.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "btn_",
	}
}

-- -----------------------------
-- vars
-- -----------------------------

UI.Chat_Bookmark_List_NEW.selIdx				= -1
UI.Chat_Bookmark_List_NEW.curSlots				= {}
UI.Chat_Bookmark_List_NEW.allSlots				= {}
UI.Chat_Bookmark_List_NEW.spaceX_slots			= 0
UI.Chat_Bookmark_List_NEW.spaceY_slots			= 0
UI.Chat_Bookmark_List_NEW.spaceX_left_slots		= 0
UI.Chat_Bookmark_List_NEW.spaceX_slots_right	= 0
UI.Chat_Bookmark_List_NEW.spaceY_top_slots		= 0
UI.Chat_Bookmark_List_NEW.spaceY_slots_btm		= 0
UI.Chat_Bookmark_List_NEW.slotWidth				= 0
UI.Chat_Bookmark_List_NEW.slotHeight			= 0

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.Chat_Bookmark_List_NEW:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitSlots()
	self:PrepareLayout()

end


--
function UI.Chat_Bookmark_List_NEW:InitSlots()

	for idx = 1, 1 do
		self:CreateSlot()
	end

end


--
function UI.Chat_Bookmark_List_NEW:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.Chat_Bookmark_Btn, tostring( #self.allSlots + 1 ) )	
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.Chat_Bookmark_List_NEW:ObtainFreeSlot()

	local freeSlotWnd = nil

	for idx, slotWnd in pairs( self.allSlots ) do 
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	return freeSlotWnd

end


--
function UI.Chat_Bookmark_List_NEW:PrepareLayout()

	-- В эффекте индексы расположены слева направо, снизу вверх, по 4 в ряд, в 2 ряда

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd			= self.allSlots[ 1 ]

	local selfSize			= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local slotPos_1_1		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 5 ) ) or Vec2( 0, 0 )
	local slotPos_1_2		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 6 ) ) or Vec2( 0, 0 )
	local slotPos_1_4		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 8 ) ) or Vec2( 0, 0 )
	local slotPos_2_1		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local slotSize			= slotWnd and Vec2( slotWnd:GetWidth(), slotWnd:GetHeight() ) or Vec2( 0, 0 )
	
    self.spaceX_slots		= slotPos_1_2.x - ( slotPos_1_1.x + slotSize.x )
    self.spaceY_slots		= slotPos_2_1.y - ( slotPos_1_1.y + slotSize.y )
    self.spaceX_left_slots	= slotPos_1_1.x
    self.spaceX_slots_right	= selfSize.x - ( slotPos_1_4.x + slotSize.x )
    self.spaceY_top_slots	= slotPos_1_1.y
    self.spaceY_slots_btm	= selfSize.y - ( slotPos_2_1.y + slotSize.y )
    self.slotWidth			= slotSize.x
    self.slotHeight			= slotSize.y	

end


--
function UI.Chat_Bookmark_List_NEW:RecalcLayout()

	-- Закладки показываются в несколько рядов, слева направо, снизу вверх

	local selfWidth		= 0
	local selfHeight	= 0

	if next( self.curSlots ) then

    	local maxRight = UI.Chat_ListWnd_NEW:GetBookmarksRight()
    	local maxWidth = maxRight - self:GetLeft()

    	local slotsPerRow = math.floor( ( maxWidth + self.spaceX_slots - self.spaceX_left_slots - self.spaceX_slots_right + 0.01 ) / ( self.slotWidth + self.spaceX_slots ) )
    	slotsPerRow = math.max( slotsPerRow, 1 )

    	local numSlots	= #self.curSlots
    	local numRows	= math.ceil( numSlots / slotsPerRow )

		local slotsRight	= 0
		local slotsBtm		= 0

    	for row = 1, numRows do

			local rowY = ( self.slotHeight + self.spaceY_slots ) * ( numRows - row ) + self.spaceY_top_slots

			local firstSlotIdx	= ( row - 1 ) * slotsPerRow + 1
			local lastSlotIdx	= math.min( firstSlotIdx + slotsPerRow - 1, numSlots )

			for slotIdx = firstSlotIdx, lastSlotIdx do

				local slotX = ( self.slotWidth + self.spaceX_slots ) * ( slotIdx - firstSlotIdx ) + self.spaceX_left_slots

				local slotWnd = self.curSlots[ slotIdx ]
				slotWnd:SetPos( slotX, rowY )

				local slotRight = slotX + self.slotWidth
				if slotRight > slotsRight then
					slotsRight = slotRight
				end

			end

			local rowBtm = rowY + self.slotHeight
			if rowBtm > slotsBtm then
				slotsBtm = rowBtm
			end

		end

		selfWidth	= slotsRight + self.spaceX_slots_right
		selfHeight	= slotsBtm + self.spaceY_slots_btm		

	end

	self:SetWidth( selfWidth )
	self:SetHeight( selfHeight )

end


--
function UI.Chat_Bookmark_List_NEW:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Chat_Bookmark_Btn" ) then

		if not wnd:IsDisabled() and not wnd:IsSelected() then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			self:SelectRecord( wnd:GetIdx() )
		end

	end

	return true

end


--
function UI.Chat_Bookmark_List_NEW:OnSelTabChanged()

	local selIdx = self:GetSelectedRecord()
	if selIdx ~= -1 then

		local selSlotWnd = self.curSlots[ selIdx ]
		local data = selSlotWnd:GetData()

		UI.Chat:SetTab( UI.Chat:GetTabIdx( data.tabType ) )

	end

end


-- ------------------------------------------------------------------------
-- UI.Chat_Bookmark_Btn
-- ------------------------------------------------------------------------

UI.Chat_Bookmark_Btn = {}

-- -----------------------------
-- window definition
-- -----------------------------

--
UI.Chat_Bookmark_Btn.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT		= 2,
}

--
UI.Chat_Bookmark_Btn.def =
{   	
 	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

 	props =
 	{
 		name			= "Chat_Bookmark_Btn",
		selectSound		= UI.sounds.btnMouseOver,
		isPrototype		= true,
 	},

 	layers =
 	{
		numLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers ) + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "chat_bookmark_btn",
				defaultAnimation    = "disable",
				main				= true,

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Chat_Bookmark_Btn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}			
		},

		-- TEXT
		{
			id				= UI.Chat_Bookmark_Btn.layers.TEXT,
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Tiny" },
		},
 	},
}

-- --------------------------------
-- interface funcitons
-- --------------------------------

--
function UI.Chat_Bookmark_Btn:Setup( data, idx )

	self:Reset()

	self.data	= data
	self.idx	= idx

	self:FullUpdate()

end


--
function UI.Chat_Bookmark_Btn:Reset()

	self.data			= nil
	self.idx			= -1
	self.tooltipData	= nil

	self:Select( false )
	self:SetText( "", self.layers.TEXT )

end


--
function UI.Chat_Bookmark_Btn:Select( bSelect )

	self.bSelected = bSelect
	self:UpdateMainAnimation()

end


--
function UI.Chat_Bookmark_Btn:GetData()

	return self.data

end



--
function UI.Chat_Bookmark_Btn:GetIdx()

	return self.idx

end


--
function UI.Chat_Bookmark_Btn:IsSelected()

	return self.bSelected

end


--
function UI.Chat_Bookmark_Btn:IsDisabled()
	
	return self.data ~= nil and self.data.bDisabled == true	

end


--
function UI.Chat_Bookmark_Btn:GetTooltipData()

	return self.tooltipData

end


-- --------------------------------
-- const
-- --------------------------------

UI.Chat_Bookmark_Btn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "disable",
		animationSelect		= "disable_over",
		animationPressed	= "disable_over",
		animationDisabled	= "disable_idle",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "select",
		animationPressed	= "select",
		animationDisabled	= "select",
	},
}

-- --------------------------------
-- vars
-- --------------------------------

UI.Chat_Bookmark_Btn.data			= nil
UI.Chat_Bookmark_Btn.idx			= -1
UI.Chat_Bookmark_Btn.bSelected		= false
UI.Chat_Bookmark_Btn.tooltipData	= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.Chat_Bookmark_Btn:FullUpdate()

	self:UpdateMainAnimation()
	self:UpdateText()
	self:UpdateTooltip()

end


--
function UI.Chat_Bookmark_Btn:UpdateMainAnimation()

	self:Check( self.bSelected )
	self:SetGray( self:IsDisabled() )

end


--
function UI.Chat_Bookmark_Btn:UpdateText()

	local uiData = self.data and UI.Chat:GetTabUIData( self.data.tabType )

	if uiData and uiData.Name then
		self:SetText( UI:GetStringByName( uiData.Name ), self.layers.TEXT )
	else
		sys.log( "UI.Chat_Bookmark_Btn:Setup()[ERROR]: wrong data for chat tab" )
	end

end


--
function UI.Chat_Bookmark_Btn:UpdateTooltip()

	self.tooltipData = nil

	if self:IsDisabled() then
	
		if self.data and self.data.bTradingDisabled then
			
			local minBattles			= UI:GetTradingSellerMinBattles()
			local need2StepAuth 		= UI:IsTradingSeller2StepAuthNeeded()
			local machinePlayerBattles	= _G.MasterServer_GetMachineAntibotCounter()
			local playerBattles 		= _G.MasterServer_GetAntibotCounter()
			local player2StepAuth 		= _G.MasterServer_Is2StepAuthEnabled()

			local actualPlayerBattles = machinePlayerBattles
			if playerBattles > machinePlayerBattles and ( not need2StepAuth or player2StepAuth ) then
				actualPlayerBattles = playerBattles
			end

			local tooltipText = UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text_invalidNumBattles" )

			local strNumBattles = string.format( "%d/%d", actualPlayerBattles, minBattles )

			local baseColor = UI.TooltipWnd_shared:GetTextColor()
			
			strNumBattles = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), strNumBattles, UI:Color2Str( baseColor ) )
			
			local numSubst = 0
			tooltipText, numSubst = string.gsub( tooltipText, "%$num_battles%$", strNumBattles )
			if numSubst == 0 then
				sys.log( "UI.ChatWnd:UpdateTradingBtnState()[ERROR]: cannot find placeholder '$num_battles$' in string 'mailCreate_tradingModeBtn_tooltip_text_invalidNumBattles'" )
				tooltipText = string.format( "[INVALID STRING]Num battles required: %s", strNumBattles )
			end
			
			if playerBattles > machinePlayerBattles and need2StepAuth and not player2StepAuth then
				local text2stepAuth = UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_text_2stepAuthNumBattles" )
				local str2stepAuthNumBattles = string.format( "%d/%d", playerBattles, minBattles )
				str2stepAuthNumBattles = string.format( "%s%s%s", UI:Color2Str( UI.TEXT_SEL_COLOR ), str2stepAuthNumBattles, UI:Color2Str( baseColor ) )
	
				local numSubst = 0
				text2stepAuth, numSubst = string.gsub( text2stepAuth, "%$num_battles%$", str2stepAuthNumBattles )
				if numSubst == 0 then
					sys.log( "UI.ChatWnd:UpdateTradingBtnState()[ERROR]: cannot find placeholder '$num_battles$' in string 'mailCreate_tradingModeBtn_tooltip_text_2stepAuthNumBattles'" )
					text2stepAuth = string.format( "[INVALID STRING]Num battles required: %s", str2stepAuthNumBattles )
				end
				
				tooltipText	= string.format( "%s|%s", tooltipText, text2stepAuth )
			end

			self.tooltipData =
			{
				tooltipType	= UI.tooltipTypes.TEXT_LARGE,
				caption		= UI:GetStringByName( "mailCreate_tradingModeBtn_tooltip_caption" ),
				text		= tooltipText,
			}
	
		else
			sys.log( "UI.Chat_Bookmark_Btn:UpdateTooltip()[ERROR]: cannot show tooltip for disabled tab; unhandled reason" )
		end
	
	end
	
end


-- ------------------------------------------------------------------------
-- UI.Chat_EditWnd
-- ------------------------------------------------------------------------

UI.Chat_EditWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

--
UI.Chat_EditWnd.layers =
{
    MAIN_EFFECT		= 0,
	FRAME			= 1,
    SELECTION		= 2,
    TEXT			= 3,
	META_TEXT		= 4,
    CURSOR			= 5,
}

--
UI.Chat_EditWnd.def =
{   	
 	className	= "EditWnd",
	prototype	= "EffectEditLinksWnd",

 	props =
 	{
 		name			= "Chat_EditWnd",
 		style			= UI.WS_UPDATE_IF_VISIBLE,	-- в отличие от EffectEditWnd, нет UI.WS_ACTIVATE_ON_LMOUSE_CLICK
		symbolsLimit	= 256,
		textLayer		= UI.Chat_EditWnd.layers.TEXT,
		selectionLayer	= UI.Chat_EditWnd.layers.SELECTION,
		cursorLayer		= UI.Chat_EditWnd.layers.CURSOR,
 		activationOrder	= -1,
        editStyle		= UI.ES_AUTOSCROLL,	-- в отличие от EffectEditLinksWnd, нет UI.ES_SELECT_ON_FOCUS
 	},

 	layers =
 	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,	-- эффект устаревший, фона больше не надо


			effects =
			{{
			  	defName				= "chat_edit",
				defaultAnimation    = "deselect",

				links =
				{
					{
						objName		= "self_2",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}			
		},

		-- FRAME
		{
			layerType	= UI.LAYER_FRAME,
			layerStyle	= UI.WLS_RESIZABLE,
			frame		= "input_chat",
		},

 		-- SELECTION
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			texture		= "white",
 		},

 		-- TEXT
 		{
 			layerType		= UI.LAYER_TEXT,
    		formatFlags		= FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS,
 			formatInfoSz	= { 1, 1 },
    		font			= { fontName = "Small" },
			visible			= false,
 		},

 		-- META_TEXT
 		{
 			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
    		formatFlags		= FONT.TF_LEFT + FONT.TF_VCENTER + FONT.TF_SINGLELINE,
 			formatInfoSz	= { 1, 1 },
    		font			= { fontName = "Small" },
 		},

 		-- CURSOR
 		{
 			layerType	= UI.LAYER_TEXTURE,
 			rect		= Quat( 0, 0, 2, 0 ),
 			texture		= "white",
 		},
 	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.Chat_EditWnd:GetBaseSize()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect:GetObjSize( "self_2" )

end


-- RecalcLayout() уже есть в cpp, поэтому 2
function UI.Chat_EditWnd:RecalcLayout2()

	local selfWidth = ( UI.ChatWnd:GetEditRight() - self:GetLeft() )
	self:SetWidth( selfWidth )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local textPos		= mainEffect:GetObjPos( "login_2" )
	local textBaseSize	= mainEffect:GetObjSize( "login_2" )
	local selfBaseSize	= mainEffect:GetObjSize( "self_2" )
	local edges			= UI:Quat( textPos.x, textPos.y, selfBaseSize.x - ( textPos.x + textBaseSize.x ), selfBaseSize.y - ( textPos.y + textBaseSize.y ) )

	self:SetTextLayerEdges( edges )
	self:SetCursorPos( self:GetCursorPos() )	-- чтобы вызвался автоскролл и курсор стал гарантированно видимым

end


-- -----------------------------
-- const
-- -----------------------------

UI.Chat_EditWnd.effectInfo =
{
	main =
	{
		textObjName				= "login",
		selectionColorObjName	= "select_color",
		cursorColorObjName		= "cursor",
		animActive				= "select",
		animInactive			= "deselect",
	}
}

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.Chat_EditWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcLayout2()

end


-- ------------------------------------------------------------
-- UI.Chat_ListWnd_NEW
-- ------------------------------------------------------------

UI.Chat_ListWnd_NEW = {}
local clf = UI.Chat_ListWnd_NEW

-- -------------------------------------
-- window definitions
-- -------------------------------------

UI.Chat_ListWnd_NEW.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Chat_ListWnd_NEW",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
			main		= true,			
			visible		= false,	-- в эффекте врисован фон, его не надо, фон обеспечивается рамкой в слое MAIN_FRAME 

			effects =
			{{
				defName 			= "chat_list_2",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.Chat_ListWnd_NEW.layers.RECORDS",
						animParams	= UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "bookmark",	
						wnd			= "UI.Chat_Bookmark_List_NEW",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MAIN_FRAME
		{
			layerType	= UI.LAYER_FRAME,
			layerStyle	= UI.WLS_RESIZABLE,
			frame		= "chat",
		},

		-- CONTENT_FRAME
		{
			layerType	= UI.LAYER_FRAME,
			frame		= "input_chat",
		},

		-- RECORDS
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MASK
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "listMask",
			visible		= false,
		},
	},

	children =
	{
		"UI.ChatNEW_ScrollBarWnd",
		"UI.Chat_Bookmark_List_NEW",
		"UI.ChatNEW_CrossBtn",
		"UI.ChatNEW_ResizeBtn",
		"UI.ChatNEW_EyeBtn",
		"UI.ChatNEW_LinksWnd"
	}
}

----------------------------------------
-- interface functions
-- -------------------------------------
--
function UI.Chat_ListWnd_NEW:Reset()
	self:ResetRecords()
end


--
function UI.Chat_ListWnd_NEW:ScrollPageUp( eventSrc )

	self:Scroll( -self:CalcMaxStrings(), eventSrc )

end


--
function UI.Chat_ListWnd_NEW:ScrollPageDown( eventSrc )

	self:Scroll( self:CalcMaxStrings(), eventSrc )

end


--
function UI.Chat_ListWnd_NEW:OnBookmarksChanged()

	if not self:IsOnScreen() then
		return
	end

	self:RecalcLayout()
	UI.ChatWnd:RecalcLayout()

end


--
function UI.Chat_ListWnd_NEW:GetBookmarksRight()

	return self:GetWidth() - self.distX_bookmarks_right

end


--
function UI.Chat_ListWnd_NEW:GetBaseSize()

	return self.baseSize

end


-- -------------------------------------
-- const
-- -------------------------------------

clf.layers =
{
	MAIN_EFFECT		= 0,
	MAIN_FRAME		= 1,
	CONTENT_FRAME	= 2,
	RECORDS			= 3,
	MASK			= 4,
}

clf.effectInfo =
{
	main =
	{
    	recordsLocator		= "text",
		scrollBarLocator	= "scroll_max",
		bookmarksLocator	= "bookmark",
		crossBtnLocator		= "btn_x",
		resizeBtnLocator	= "angle_btn",
		eyeBtnLocator		= "btn_x2",
		contentFrameLocator	= "frame_text",
        baseSizeLocator		= "self",
        defaultSizeLocator  = "self_default",
        minSizeLocator		= "self_min",
        maxSizeLocator		= "self_max",
	}
}

-- -------------------------------------
-- vars
-- -------------------------------------

clf.records						= {}
clf.firstVisibleMsgId			= -1
clf.lastVisibleMsgId			= -1
clf.scrollBar					= nil
clf.recordsRect					= Quat( 0, 0, 0, 0 )
clf.nicknameWnd					= {}
clf.freeNicknameWnd				= {}
clf.freeLinkWnds				= {}
clf.linkWnds					= {}
clf.alwaysVisible				= false
clf.bDragging					= false
clf.dragAnchor					= Vec2( 0, 0 )	-- расстояние между верхним и правым краями окна
clf.bLockUpdateRecords			= false

clf.minSize							= Vec2( 0, 0 )	-- размер, меньше которого нельзя уменьшить
clf.maxSize							= Vec2( 0, 0 )	-- размер, больше которого нельзя увеличить
clf.defaultSize						= Vec2( 0, 0 )	-- размер, который устанавливается по умолчанию, если пользователь еще ни разу не менял размер
clf.baseSize						= Vec2( 0, 0 )	-- размер, с учетом которого чат соотносится с другими элементами в эффекте
clf.distX_crossBtn_right			= 0
clf.distX_resizeBtn_right			= 0
clf.distX_eyeBtn_right				= 0
clf.spaceX_records_right			= 0
clf.spaceY_bookmarks_records		= 0
clf.spaceY_records_btm				= 0
clf.spaceX_scroll_recordsRight		= 0
clf.spaceY_scroll_recordsTop		= 0
clf.spaceY_scroll_recordsBtm		= 0
clf.spaceX_contentFrame_right		= 0
clf.spaceY_bookmarks_contentFrame	= 0
clf.spaceY_contentFrame_btm			= 0
clf.distX_bookmarks_right			= 0

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Chat_ListWnd_NEW:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if wndThatReceivedInput == UI.ChatNEW_ResizeBtn:GetUiHandle() then
		self:StartDragging( self:XToScreen( mouseX ), self:YToScreen( mouseY ) )
		return true

	elseif wndThatReceivedInput == UI.ChatNEW_EyeBtn:GetUiHandle() then
		UI:PlayGlobalSound( UI.sounds.btnClick )
		self.alwaysVisible = not self.alwaysVisible
		UI.ChatNEW_EyeBtn:Update()
	end

	return false	-- ChatWnd обрабатывает нажатия кнопок, поэтому false

end


--
function UI.Chat_ListWnd_NEW:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	if self.bDragging then
		self:Drag( self:XToScreen( mouseX ), self:YToScreen( mouseY ) )
	end

	return true

end


--
function UI.Chat_ListWnd_NEW:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self.bDragging then
		self:StopDragging()
	end

	return true

end


--
function UI.Chat_ListWnd_NEW:GetMaskParam()
	local maskRect = self:ToScreen( self.recordsRect )
	local hTexMask = self:GetTexture( self.layers.MASK )
	return maskRect, hTexMask
end

--
function UI.Chat_ListWnd_NEW:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	self.scrollBar = UI.ChatNEW_ScrollBarWnd
	self:PrepareLayout()
	self:Reset()
	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_CHAT_CLEAR )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_CHAT_MSG )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )
end


--
function UI.Chat_ListWnd_NEW:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local crossBtnPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.crossBtnLocator ) or Vec2( 0, 0 )
	local resizeBtnPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.resizeBtnLocator ) or Vec2( 0, 0 )
	local eyeBtnPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.eyeBtnLocator ) or Vec2( 0, 0 )
	local baseSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.baseSizeLocator ) or Vec2( 0, 0 )
	local defaultSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.defaultSizeLocator ) or Vec2( 0, 0 )
	local minSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local maxSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )
	local recordsPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.recordsLocator ) or Vec2( 0, 0 )
	local recordsSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.recordsLocator ) or Vec2( 0, 0 )
	local scrollPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.scrollBarLocator ) or Vec2( 0, 0 )
	local scrollSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator ) or Vec2( 0, 0 )
	local contentFramePos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.contentFrameLocator ) or Vec2( 0, 0 )
	local contentFrameSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.contentFrameLocator ) or Vec2( 0, 0 )
	local bookmarksPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.bookmarksLocator ) or Vec2( 0, 0 )
	local bookmarksSize		= UI.Chat_Bookmark_List_NEW:GetBaseSize()
	
	self.baseSize						= baseSize	
	self.defaultSize					= defaultSize
	self.minSize						= minSize
	self.maxSize						= maxSize
	self.distX_crossBtn_right			= baseSize.x - crossBtnPos.x
	self.distX_resizeBtn_right			= baseSize.x - resizeBtnPos.x
	self.distX_eyeBtn_right				= baseSize.x - eyeBtnPos.x
	self.spaceX_records_right			= baseSize.x - ( recordsPos.x + recordsSize.x )
	self.spaceY_bookmarks_records		= recordsPos.y - ( bookmarksPos.y + bookmarksSize.y )
	self.spaceY_records_btm				= baseSize.y - ( recordsPos.y + recordsSize.y )
	self.spaceX_scroll_recordsRight		= ( recordsPos.x + recordsSize.x ) - ( scrollPos.x + self.scrollBar:GetWidth() )
	self.spaceY_scroll_recordsTop		= recordsPos.y - scrollPos.y
	self.spaceY_scroll_recordsBtm		= ( recordsPos.y + recordsSize.y ) - ( scrollPos.y + scrollSize.y )
	self.spaceX_contentFrame_right		= baseSize.x - ( contentFramePos.x + contentFrameSize.x )
	self.spaceY_bookmarks_contentFrame	= contentFramePos.y - ( bookmarksPos.y + bookmarksSize.y )
	self.spaceY_contentFrame_btm		= baseSize.y - ( contentFramePos.y + contentFrameSize.y )
	self.distX_bookmarks_right			= baseSize.x - ( bookmarksPos.x + bookmarksSize.x )

	UI.ChatNEW_CrossBtn:SetTop( crossBtnPos.y )
	UI.ChatNEW_ResizeBtn:SetTop( resizeBtnPos.y )
	UI.ChatNEW_EyeBtn:SetTop( eyeBtnPos.y )
	self.recordsRect.x = recordsPos.x
	self:SetLayerLeft( contentFramePos.x, self.layers.CONTENT_FRAME )

end


--
function UI.Chat_ListWnd_NEW:RecalcLayout()

	local selfSize = Vec2( self:GetWidth(), self:GetHeight() )

	-- фон - размер

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetScale( UI:Vec2( selfSize.x / self.baseSize.x, selfSize.y / self.baseSize.y ) )	
	end


	-- кнопки - позиции

	local crossBtnX = selfSize.x - self.distX_crossBtn_right
	UI.ChatNEW_CrossBtn:SetLeft( crossBtnX )

	local resizeBtnX = selfSize.x - self.distX_resizeBtn_right
	UI.ChatNEW_ResizeBtn:SetLeft( resizeBtnX )

	local eyeBtnX = selfSize.x - self.distX_eyeBtn_right
	UI.ChatNEW_EyeBtn:SetLeft( eyeBtnX )


	-- область записей - размер, позиция

	self.recordsRect.y	= UI.Chat_Bookmark_List_NEW:GetTop() + UI.Chat_Bookmark_List_NEW:GetHeight() + self.spaceY_bookmarks_records
	self.recordsRect.z	= selfSize.x - self.spaceX_records_right - self.recordsRect.x
	self.recordsRect.w	= selfSize.y - self.spaceY_records_btm - self.recordsRect.y

	UI.ChatNEW_LinksWnd:SetRect( self.recordsRect )


	-- скроллбар - размер, позиция

	local scrollX		= ( self.recordsRect.x + self.recordsRect.z ) - self.spaceX_scroll_recordsRight - self.scrollBar:GetWidth()
	local scrollY		= self.recordsRect.y - self.spaceY_scroll_recordsTop
	local scrollHeight	= ( self.recordsRect.y + self.recordsRect.w ) - self.spaceY_scroll_recordsBtm - scrollY

	self.scrollBar:SetLeft( scrollX )
	self.scrollBar:SetTop( scrollY )
	self.scrollBar:SetHeight( scrollHeight )

	local scrollEffect		= UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	local scrollEffectSize	= scrollEffect and scrollEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local scrollScale		= scrollHeight / scrollEffectSize.y
	scrollEffect:SetScale( UI:Vec2( 1, scrollScale ) )

	
	-- внутренняя рамка - размер, позиция

	local contentFrameY			= UI.Chat_Bookmark_List_NEW:GetTop() + UI.Chat_Bookmark_List_NEW:GetHeight() + self.spaceY_bookmarks_contentFrame
	local contentFrameWidth		= selfSize.x - self.spaceX_contentFrame_right - self:GetLayerLeft( self.layers.CONTENT_FRAME )
	local contentFrameHeight	= selfSize.y - self.spaceY_contentFrame_btm - contentFrameY

	self:SetLayerTop( contentFrameY, self.layers.CONTENT_FRAME )
	self:SetLayerWidth( contentFrameWidth, self.layers.CONTENT_FRAME )
	self:SetLayerHeight( contentFrameHeight, self.layers.CONTENT_FRAME )


	-- апдейт других элементов, зависимых от размера чата

	self:UpdateRecords()
	UI.ChatNEW_EyeBtn:Update()	-- TODO: зачем? (это было в старой версии)

end


--
function UI.Chat_ListWnd_NEW:SetScrollBarVisible( bVisible )
	bVisible = true
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if bVisible then
		--if not self.scrollBar:IsChildOf( self ) then
			self:AddChild( self.scrollBar )
		--end
	else
		if self.scrollBar:IsChildOf( self ) then
    		self.scrollBar:UnlinkFromParent()
		end
	end
end

--
function UI.Chat_ListWnd_NEW:FullUpdate()

	local tabIdx = UI.Chat:GetCurrentTab()

	if tabIdx > 0 then
		local recordIdx = UI.Chat_Bookmark_List_NEW:GetRecordByTabIdx( tabIdx )
		if recordIdx ~= -1 then
			UI.Chat_Bookmark_List_NEW:SelectRecord( recordIdx )
		end
	end

	self:UpdateAlpha()

	self.bLockUpdateRecords = true
	self:RecalcLayout()
	if not self:RestoreSize() then
		self:SetSize( self.defaultSize.x, self.defaultSize.y )
	end
	self.bLockUpdateRecords = false

	self:UpdateRecords()

end


--
function UI.Chat_ListWnd_NEW:UpdateRecords()

	if self.bLockUpdateRecords then
		return
	end

	self:ResetRecords()

	if UI.Chat:GetNumMsgs() == 0 then
		return
	end

	self:UpdateScrollRange()
	self:SetScrollPos( self:GetMaxScrollPos(), true )

end


--
function UI.Chat_ListWnd_NEW:UpdateScrollRange()
	local min = -1
	local max = -1
	if UI.Chat:GetNumMsgs() > 0 then
		max = UI.Chat:GetLastMsgId()
		min = self:MakeHead()
	end
	self.scrollBar:SetRange( min, max )
	self:UpdateScrollBarVisibility()
end

--
function UI.Chat_ListWnd_NEW:UpdateScrollBarVisibility()
	local needScrollBar = true
	self:SetScrollBarVisible( needScrollBar )	
end

--
function UI.Chat_ListWnd_NEW:GetScrollPos()
	return self.scrollBar:GetPos()
end

--
function UI.Chat_ListWnd_NEW:GetMaxScrollPos()
	return self.scrollBar:GetMax()
end

--
function UI.Chat_ListWnd_NEW:GetMinScrollPos()
	return self.scrollBar:GetMin()
end

--
function UI.Chat_ListWnd_NEW:MakeHead()
	for msgId, record in pairs( self.records ) do
		record.bHead = false
	end
	if UI.Chat:GetNumMsgs() == 0 then
		return -1
	end

	local firstMsgId	= UI.Chat:GetFirstMsgId()
	local lastMsgId		= UI.Chat:GetLastMsgId()

	local minScrollPos = lastMsgId
	local y = self.recordsRect.y
	
	for msgId = firstMsgId, lastMsgId do

		local record = self.records[ msgId ]

		if not record then
			record = self:AddRecord( msgId )			
		end		

		record.bHead = true

		local recordHeight = record.rect.w
		
		y = y + recordHeight

		if ( self.recordsRect.y + self.recordsRect.w ) - y <= 1e-3 then
			minScrollPos = msgId - ( y - ( self.recordsRect.y + self.recordsRect.w ) ) / recordHeight
			break			
		end

	end

	return minScrollPos

end

--
function UI.Chat_ListWnd_NEW:SetScrollPos( scrollPos, bUpdateScrollBar )
	if UI.Chat:GetNumMsgs() == 0 then
		return
	end

	local firstMsgId	= UI.Chat:GetFirstMsgId()
	local lastMsgId		= UI.Chat:GetLastMsgId()
	scrollPos = UI:Clamp( scrollPos, firstMsgId, lastMsgId )

	self.lastVisibleMsgId	= math.ceil( scrollPos )
	self.firstVisibleMsgId	= self.lastVisibleMsgId

	local deltaCf		= self.lastVisibleMsgId - scrollPos
	local recordsRect	= Quat( 0, 0, self.recordsRect.z, self.recordsRect.w )
	local y1			= recordsRect.y + recordsRect.w

	for msgId = self.lastVisibleMsgId, firstMsgId, -1 do

		local record = self.records[ msgId ]

		if not record then
			record = self:AddRecord( msgId )
		end

		self.firstVisibleMsgId = msgId

		local recordHeight = record.rect.w

		if msgId == self.lastVisibleMsgId then
			y1 = y1 + recordHeight * deltaCf
		end

		record.rect.y = y1 - record.rect.w

		y1 = y1 - recordHeight		

		if y1 - recordsRect.y <= 1e-3 then
			break
		end

	end

	for msgId, record in pairs( self.records ) do
		if ( msgId < self.firstVisibleMsgId or msgId > self.lastVisibleMsgId ) then
			--if not record.bHead then
				self:RemoveRecord( msgId )
			--end
		end
	end

	if bUpdateScrollBar then
		self.scrollBar:SetPos( scrollPos )
	end

end

--
function UI.Chat_ListWnd_NEW:ResetRecords()
	for msgId, record in pairs( self.records ) do
		self:RemoveRecord( msgId )
	end

	self.records			= {}
	self.firstVisibleMsgId	= -1
	self.lastVisibleMsgId	= -1	

	self.scrollBar:SetRange( -1, -1 )
	self:SetScrollBarVisible( false )
end

--
function UI.Chat_ListWnd_NEW:RemoveRecord( msgId )
	local record = self.records[ msgId ]
	if not record then
		return
	end

	for k, v in pairs( record.wnd ) do

		if UI:IsWndKindOf( v, "Chat_NickNameWnd" ) then
			self.freeNicknameWnd[ #self.freeNicknameWnd + 1 ] = v

		elseif UI:IsWndKindOf( v, "LinkWnd" ) then
			v:Reset()
			table.insert( self.freeLinkWnds, v )
		end

		v:UnlinkFromParent()

	end
	record.wnd = {}
	
	record.metaText:Clear()
	self.records[ msgId ] = nil	
end

--
function UI.Chat_ListWnd_NEW:AddRecord( msgId )
	if self.records[ msgId ] then
		sys.log( "UI.Chat_ListWnd_NEW:AddRecord()[ERROR]: already exists" )
		return self.records[ msgId ]
	end

	local record = self:CreateRecordForMsg( msgId )
	if record then
		self.records[ msgId ] = record
	end

	return record
end

--
function UI.Chat_ListWnd_NEW:ObtainFreeNickNameWnd()
	local nicknameWnd
	if #self.freeNicknameWnd > 0 then
		nicknameWnd = self.freeNicknameWnd[ #self.freeNicknameWnd ]
		table.remove( self.freeNicknameWnd, #self.freeNicknameWnd )
		return nicknameWnd
	end
	nicknameWnd = UI:CreateChildWnd( self, UI.Chat_NickNameWnd, #self.nicknameWnd + 1 )
	self.nicknameWnd[ #self.nicknameWnd + 1 ] = nicknameWnd
	return nicknameWnd
end


--
function UI.Chat_ListWnd_NEW:ObtainFreeLinkWnd()

	local linkWnd = nil

	local freeLinkWndIdx, freeLinkWnd = next( self.freeLinkWnds )

	if freeLinkWnd then
		linkWnd = freeLinkWnd
		self.freeLinkWnds[ freeLinkWndIdx ] = nil
	end

	if not linkWnd then
		linkWnd = UI:CreateChildWnd( self, UI.LinkWnd, #self.linkWnds + 1 )
		table.insert( self.linkWnds, linkWnd )
	end

	return linkWnd

end


--
function UI.Chat_ListWnd_NEW:CreateRecordForMsg( msgId )
	if msgId < UI.Chat:GetFirstMsgId() or msgId > UI.Chat:GetLastMsgId() then
		sys.log( "UI.Chat_ListWnd_NEW:CreateRecordForMsg()[ERROR]: invalid msgId: %d", msgId )
		return nil
	end

	local record = self:CreateEmptyRecord()

	record.msgId	= msgId
	record.color	= UI.ChatWnd:GetMsgColor( msgId )
	record.metaText = UI.MetaText.GetNewInstance()
	record.metaText:SetParentWindow( self )
	local --[[text, text2, ]]textHeight, wnd, bShifted = UI.ChatWnd:FormatMsgText( msgId, self:GetFont( self.layers.RECORDS ), self:GetTextFormatFlags( self.layers.RECORDS ), self.recordsRect.z, record.metaText, self )
	record.wnd 		= wnd
	record.metaText:SetColor( record.color )
	record.bShifted = bShifted
	--[[for k, v in pairs( record.wnd ) do
		self:AddChild( v )
	end]]
	--[[for k, v in pairs( record.wnd ) do
		if UI.Chat:GetMsgType( record.msgId ) == UI.Chat.msgTypes.BATTLE_LOG_WIDE then
			v:SetColor( 0xfffff68f )
		else
			v:SetColor( record.color )
		end
	end]]
	self:MoveChildToLastPosition( UI.Chat_Bookmark_List_NEW )
	--[[record.text		= text
	record.text2	= text2]]
	if bShifted then
		record.rect.x, record.rect.z, record.rect.w = UI.ChatWnd.SHIFT_X, self.recordsRect.z, textHeight
	else
		record.rect.x, record.rect.z, record.rect.w = 0, self.recordsRect.z, textHeight
	end

	return record
end

--
function UI.Chat_ListWnd_NEW:CreateEmptyRecord()
	local record = {}

	record.bHead	= false
	record.msgId	= -1
	record.color	= UI.WHITE_COLOR
	record.text		= text
	record.text2	= text2
	record.rect		= Quat( 0, 0, 0, 0 )
	record.bShifted	= false

	return record
end

--
function UI.Chat_ListWnd_NEW:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )
	if layerIdx == self.layers.RECORDS then
		self:DrawRecords()
	end
end

local l_cipRect = Quat( 0, 0, 0, 0 )	-- вспомогательная переменная, чтобы не выделять память каждый кадр при отрисовке

--
function UI.Chat_ListWnd_NEW:GetClipRect()
	UI:QuatCopyInplace( self:ToScreen( self.recordsRect ), l_cipRect )
	return l_cipRect
end

--
function UI.Chat_ListWnd_NEW:DrawRecords()
	if self.firstVisibleMsgId == -1 then
		return
	end

	UI.drawer:EndUiDrawing()

	local hFont			= self:GetFont( self.layers.RECORDS )
	local formatFlags	= self:GetTextFormatFlags( self.layers.RECORDS )
	local fontHeight	= _G.GetFontLineHeight( hFont )

	UI:QuatCopyInplace( self:ToScreen( self.recordsRect ), l_cipRect )

	for recordIdx, record in pairs( self.records ) do

		if record.msgId >= self.firstVisibleMsgId and record.msgId <= self.lastVisibleMsgId then

			for k, v in pairs( record.wnd ) do
				UI.ChatNEW_LinksWnd:AddChild( v )
			end

			local screenPos = UI:Vec2( self:XToScreen( record.rect.x + self.recordsRect.x ), self:YToScreen( record.rect.y + self.recordsRect.y ) )

			record.metaText:SetScreenOrg( screenPos )
			if record.bShifted then
				record.metaText:Draw( l_cipRect.x + UI.ChatWnd.SHIFT_X, l_cipRect.y, l_cipRect.z, l_cipRect.w )
			else
				record.metaText:Draw( l_cipRect.x, l_cipRect.y, l_cipRect.z, l_cipRect.w )
			end

		end
	end

	UI.drawer:BeginUiDrawing()
end

--
function UI.Chat_ListWnd_NEW:F_OnEventChatMsg( hSender, iParam0, iParam1, fParam0, fParam1 )
	if not self:IsOnScreen() then
		return
	end

	local oldScrollPos		= self:GetScrollPos()
	local oldMaxScrollPos	= self:GetMaxScrollPos()

	self:UpdateScrollRange()

	if math.abs( oldScrollPos - oldMaxScrollPos ) <= 1e-3 then
		self:SetScrollPos( self:GetMaxScrollPos(), true )

	elseif oldScrollPos < self:GetMinScrollPos() then
		self:SetScrollPos( self:GetMinScrollPos(), true )
	end	
end

--
function UI.Chat_ListWnd_NEW:F_OnEventChatClear( hSender, iParam0, iParam1, fParam0, fParam1 )
	if not self:IsOnScreen() then
		return
	end

	self:ResetRecords()
end

--
function UI.Chat_ListWnd_NEW:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )
	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:SetScrollPos( self.scrollBar:GetPos(), false )
end

--
function UI.Chat_ListWnd_NEW:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self:Scroll( -ticks, UI.SCROLL_SRC_WHEEL ) 
	end

	return true
end

--
function UI.Chat_ListWnd_NEW:Scroll( stringsDelta, eventSrc )
	local firstMsgId	= UI.Chat:GetFirstMsgId()
	local lastMsgId		= UI.Chat:GetLastMsgId()

	local curPos = self.scrollBar:GetPos()
	if curPos == -1 then
		return
	end	

	local nextPos = curPos

	if stringsDelta > 0 then

		local deltaLeft		= stringsDelta
		local msgId			= math.ceil( curPos )
		local stringPos		= self:Msg2StringPos( curPos )
		local numStrings	= self:GetNumMsgStrings( msgId )

		while deltaLeft > 0 do

			local nextStringIdx = math.ceil( stringPos + deltaLeft )

			if nextStringIdx <= numStrings then

				deltaLeft = 0
				stringPos = nextStringIdx

			else

				if msgId < lastMsgId then

					local deltaHandled = numStrings - math.ceil( stringPos )
					deltaLeft = deltaLeft - deltaHandled

					msgId = msgId + 1
					numStrings = self:GetNumMsgStrings( msgId )
					stringPos = 0

				else

					deltaLeft = 0
					stringPos = numStrings

				end

			end

		end	

		nextPos = self:String2MsgPos( msgId, stringPos )

	elseif stringsDelta < 0 then

		local deltaLeft		= math.abs( stringsDelta )
		local msgId			= math.ceil( curPos )
		local stringPos		= self:Msg2StringPos( curPos )
		local numStrings	= self:GetNumMsgStrings( msgId )

		while deltaLeft > 0 do

			local nextStringIdx = math.ceil( stringPos - deltaLeft )

			if nextStringIdx >= 1 then

				deltaLeft = 0
				stringPos = nextStringIdx

			else

				if msgId > firstMsgId then

					local deltaHandled = math.ceil( stringPos )
					deltaLeft = deltaLeft - deltaHandled

					msgId = msgId - 1
					numStrings = self:GetNumMsgStrings( msgId )
					stringPos = numStrings

				else

					deltaLeft = 0
					stringPos = 1

				end

			end

		end	

		nextPos = self:String2MsgPos( msgId, stringPos )

	else
		sys.log( "UI.Chat_ListWnd_NEW:Scroll()[ERROR]: 0 delta" )
	end

	self.scrollBar:SetPos( nextPos, eventSrc )
end

--
function UI.Chat_ListWnd_NEW:Msg2StringPos( msgPos )
	if msgPos == -1 then
		return -1		
	end

	local msgId = math.ceil( msgPos )

	local record = self.records[ msgId ]
	if not record then
		record = self:AddRecord( msgId )
	end

	if not record then
		return -1
	end

	local recordHeight	= record.rect.w
	local hFont			= self:GetFont( self.layers.RECORDS )
	local fontSize		= _G.GetFontLineHeight( hFont )
	local numStrings	= UI:Round( recordHeight / fontSize )

	local stringPos = numStrings * ( msgPos - ( msgId - 1 ) )

	-- из-за погрешности во флоатах может не скроллироваться
	if stringPos - math.floor( stringPos ) <= 1e-3 then
		stringPos = math.floor( stringPos )

	elseif math.ceil( stringPos ) - stringPos <= 1e-3 then
		stringPos = math.ceil( stringPos )
	end

	return stringPos
end


--
function UI.Chat_ListWnd_NEW:String2MsgPos( msgId, stringPos )
	local record = self.records[ msgId ]
	if not record then
		record = self:AddRecord( msgId )
	end

	if not record then
		return -1
	end

	local recordHeight	= record.rect.w
	local hFont			= self:GetFont( self.layers.RECORDS )
	local fontSize		= _G.GetFontLineHeight( hFont )
	local numStrings	= UI:Round( recordHeight / fontSize )

	return ( msgId - 1 ) + ( stringPos * fontSize ) / recordHeight
end

--
function UI.Chat_ListWnd_NEW:GetNumMsgStrings( msgId )
	local record = self.records[ msgId ]
	if not record then
		record = self:AddRecord( msgId )
	end

	if not record then
		return 0
	end

	local recordHeight	= record.rect.w
	local hFont			= self:GetFont( self.layers.RECORDS )
	local fontSize		= _G.GetFontLineHeight( hFont )

	return UI:Round( recordHeight / fontSize )
end

--
function UI.Chat_ListWnd_NEW:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateEffects()
	self:FullUpdate()
	if not UI.HangarWnd:IsOnScreen() then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		self:AddChild( UI.ChatNEW_EyeBtn )
	else
		UI.ChatNEW_EyeBtn:UnlinkFromParent()
	end
end

--
function UI.Chat_ListWnd_NEW:F_OnScreenPosChanged( oldScreenX, oldScreenY )
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
function UI.Chat_ListWnd_NEW:UpdateEffects()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end
end


--
function UI.Chat_ListWnd_NEW:UpdateAlpha()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local alpha = 255

	if UI.HudWnd and UI.HudWnd:IsOnScreen() then
		alpha = mainEffect:GetObjAlpha( "alpha" )
	end

	mainEffect:SetAlpha( alpha )

end


--
function UI.Chat_ListWnd_NEW:StartDragging( mouseScreenX, mouseScreenY )

	if self.bDragging then
		sys.log( "UI.Chat_ListWnd_NEW:StartDragging()[ERROR]: already dragging" )
		return
	end

	local mouseLocalX = self:XToWindow( mouseScreenX )
	local mouseLocalY = self:YToWindow( mouseScreenY )

	self.bDragging	= true
	self.dragAnchor	= Vec2( self:GetWidth() - mouseLocalX, mouseLocalY )	-- расстояние между верхним и правым краями окна

	UI:CaptureMouse( UI.ChatNEW_ResizeBtn:GetUiHandle() )	-- capture на кнопку, потому что в ней курсор прописан

end


--
function UI.Chat_ListWnd_NEW:StopDragging()

	if not self.bDragging then
		return
	end

	self.bDragging	= false
	self.dragAnchor	= Vec2( 0, 0 )
	
	local hWndCapture = UI:GetMouseCapture()
	local wndCapture = hWndCapture ~= UI.INVALID_UI_HANDLE and UI:GetUiObjByHandleT( hWndCapture )
	if wndCapture and ( wndCapture == self or wndCapture:IsChildOf( self ) ) then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end

	if not UI:IsInShutdown() then
		self:SaveSize()
	end

end


--
function UI.Chat_ListWnd_NEW:Drag( mouseScreenX, mouseScreenY )

	if not self.bDragging then
		sys.log( "UI.Chat_ListWnd_NEW:Drag()[ERROR]: not dragging" )
		return
	end

	local newRight_screen	= mouseScreenX + self.dragAnchor.x
	local newTop_screen		= mouseScreenY - self.dragAnchor.y

	local parent = self:GetParent()
	
	local left_screen	= parent:XToWindow( self:GetLeft() )
	local btm_screen	= parent:YToWindow( self:GetTop() ) + self:GetHeight()

	local newWidth	= newRight_screen - left_screen
	local newHeight	= btm_screen - newTop_screen

	self:SetSize( newWidth, newHeight )

end


--
function UI.Chat_ListWnd_NEW:SetSize( width, height )

	local maxWidth	= math.min( self.maxSize.x, 1024 - self:GetLeft() )

	local minTop = UI.HangarWnd:GetTopPanelBtm()
	local parent = self:GetParent()
	if parent then
		parent:YToWindow( minTop )
	end
	local btm = self:GetTop() + self:GetHeight()
	local maxHeight	= math.min( self.maxSize.y, btm - minTop )

	width	= UI:Clamp( width, self.minSize.x, maxWidth )
	height	= UI:Clamp( height, self.minSize.y, maxHeight )

	if math.abs( width - self:GetWidth() ) <= 1e-03 and math.abs( height - self:GetHeight() ) <= 1e-03 then
		return
	end

	self:SetWidth( width )
	self:SetHeight( height )

	UI.Chat_Bookmark_List_NEW:RecalcLayout()
	self:RecalcLayout()
	UI.ChatWnd:RecalcLayout()

end


--
function UI.Chat_ListWnd_NEW:SaveSize()

	local profile = _G.GetProfileTable()

	profile.chatWidth	= UI:XToAbs( self:GetWidth(), true )
	profile.chatHeight	= UI:YToAbs( self:GetHeight(), true )

	Profile:Save()

end


--
function UI.Chat_ListWnd_NEW:RestoreSize()

	local profile = _G.GetProfileTable()

	if type( profile.chatWidth ) == "number" and type( profile.chatHeight ) == "number" then
		self:SetSize( UI:XTo1024x768( profile.chatWidth ), UI:YTo1024x768( profile.chatHeight ) )
		return true
	else
		return false
	end	

end


--
function UI.Chat_ListWnd_NEW:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:StopDragging()
	end

end


--
function UI.Chat_ListWnd_NEW:CalcMaxStrings()

	local hFont			= self:GetFont( self.layers.RECORDS )
	local fontSize		= _G.GetFontLineHeight( hFont )

	return UI:Round( self.recordsRect.w / fontSize )	

end


-- -------------------------------------------------------------------------------
-- UI.ChatNEW_ScrollBarWnd
-- -------------------------------------------------------------------------------

UI.ChatNEW_ScrollBarWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ChatNEW_ScrollBarWnd.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd_Vrt",

	props =
	{
		name		= "ChatNEW_ScrollBarWnd",
		scrollStyle = UI.SWS_VERTICAL + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
	}	
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ChatNEW_ScrollBarWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local curPos = self:GetPos()

	if wndThatReceivedInput == self:GetPrevBtnHandle() then		
		UI.Chat_ListWnd_NEW:Scroll( -1, UI.SCROLL_SRC_UP_BTN )

	elseif wndThatReceivedInput == self:GetNextBtnHandle() then
		UI.Chat_ListWnd_NEW:Scroll( 1, UI.SCROLL_SRC_DOWN_BTN )

	elseif wndThatReceivedInput == self:GetPrevPageHandle() then
		UI.Chat_ListWnd_NEW:ScrollPageUp( UI.SCROLL_SRC_UP_PAGE )

	elseif wndThatReceivedInput == self:GetNextPageHandle() then
		UI.Chat_ListWnd_NEW:ScrollPageDown( UI.SCROLL_SRC_DOWN_PAGE )

	else
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	return false

end


-- ------------------------------------------------------------------------
-- UI.Chat_NickNameWnd
-- ------------------------------------------------------------------------

UI.Chat_NickNameWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name		= "Chat_NickNameWnd",
			style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
			isPrototype = true,
			--selectSound	= UI.sounds.btnMouseOver,
		},

     	layers =
     	{
			-- TEXT_EFFECT
    		{
    			layerType	= UI.LAYER_TEXT,

    			formatFlags		= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Tiny_Bold" },

	   			color			= 0xff8080ff
			},

			-- FACEBOOK_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				effects =
				{{
					defName 			= "friends_list_slot_1_facebook",
					defaultAnimation	= "idle",
				}}
			},

			-- VK_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				effects =
				{{
					defName 			= "friends_list_slot_1_vk",
					defaultAnimation	= "idle",
				}}
			}
		}
	},
}

--
UI.Chat_NickNameWnd.layers = 
{
	TEXT_EFFECT			= 0,
	FACEBOOK_EFFECT 	= 1,
	VK_EFFECT 			= 2,
}

UI.Chat_NickNameWnd.Modes = 
{
	NICKNAME 				= 0,
	SHIP 					= 1,
	FACEBOOK 				= 2,
	VK 						= 3,
	LOBBY_INVITE_ACCEPT 	= 4,
	SQUAD_FINDER 			= 5,
}
UI.Chat_NickNameWnd.BASE_COLOR = 0xff8080ff

UI.Chat_NickNameWnd.color = 0xff8080ff
UI.Chat_NickNameWnd.alpha = 0xff
UI.Chat_NickNameWnd.resultColor = 0xffffffff
UI.Chat_NickNameWnd.mode = nil


--
function UI.Chat_NickNameWnd:GetTooltipData()
	if self.mode == self.Modes.SHIP then
		if self.shipDef then
			local tooltipData =
				{
			    	tooltipType	= UI.tooltipTypes.SHIP,
					defName		= self.shipDef,			
					vid			= UI.INVALID_U64_ID,
					bCompare	= true,
					--logEvent	= _G.MasterServer.PlayerAction.PA_VESSEL_TREE_TOOLTIP,
				}
			return tooltipData
		else
			return nil
		end
	elseif self.mode == self.Modes.FACEBOOK then
		local data = { tooltipType = UI.tooltipTypes.TEXT_SMALL }
		data.text = UI:GetStringByName( "facebook_screenshotBtn" )
		return data
	elseif self.mode == self.Modes.VK then
		local data = { tooltipType = UI.tooltipTypes.TEXT_SMALL }
		data.text = UI:GetStringByName( "vk_screenshotBtn" )
		return data
	elseif self.mode == self.Modes.SQUAD_FINDER then
		local data = { tooltipType = UI.tooltipTypes.TEXT_SMALL }
		data.text = UI:GetStringByName( "chat_squadFinderLink_tooltipText" )
		return data
	else
		return
	end
end

--
function UI.Chat_NickNameWnd:Reset()
	self:SetLayerVisible( false, self.layers.FACEBOOK_EFFECT )
	self:SetLayerVisible( false, self.layers.VK_EFFECT )
	self:SetText( "", self.layers.TEXT_EFFECT )
	self.color = UI.Chat_NickNameWnd.BASE_COLOR
	UI.Wnd.SetColor( self, UI.Chat_NickNameWnd.BASE_COLOR, self.layers.TEXT_EFFECT )
	self.uid = UI.INVALID_U64_ID
	self.nickName = ""
	self.shipDef = ""
	self.fileName = ""
	self.data = {}
end

--
function UI.Chat_NickNameWnd:SetName( name, uid )

	self:Reset()
	self.mode = self.Modes.NICKNAME
	self:SetText( --[["@ffff0000"..]]name, self.layers.TEXT_EFFECT )
	local formatRect	= UI:Quat( 0, 0, 10000, 10000 )
	local hFont			= self:GetFont( self.layers.TEXT_EFFECT )
	local fontHeight	= _G.GetFontLineHeight( hFont )
	local formatFlags = self:GetTextFormatFlags( self.layers.TEXT_EFFECT )
	local textSize = _G.MeasureText(
   		name,
   		hFont,
   		formatRect,
   		formatFlags,
   		formatRect )

	self:SetHeight( textSize.w )
	self:SetWidth( textSize.z )
	self:SetLayerRect( UI:Quat( 0, 0, textSize.z, textSize.w ), self.layers.TEXT_EFFECT, 0 )
	self.uid = uid
	self.nickName = name

end

--
function UI.Chat_NickNameWnd:SetShipDef( shipDef )

	self:Reset()
	self.mode = self.Modes.SHIP
	local shipText = UI:GetEntityLocalizedNameByDef( shipDef, true, nil, true, nil )
	self:SetText( shipText, self.layers.TEXT_EFFECT )
	local formatRect	= UI:Quat( 0, 0, 10000, 10000 )
	local hFont			= self:GetFont( self.layers.TEXT_EFFECT )
	local fontHeight	= _G.GetFontLineHeight( hFont )
	local formatFlags = self:GetTextFormatFlags( self.layers.TEXT_EFFECT )
	local textSize = _G.MeasureText(
   		shipText,
   		hFont,
   		formatRect,
   		formatFlags,
   		formatRect )

	self:SetHeight( textSize.w )
	self:SetWidth( textSize.z )
	self:SetLayerRect( UI:Quat( 0, 0, textSize.z, textSize.w ), self.layers.TEXT_EFFECT, 0 )
	self.shipDef = shipDef

end

--
function UI.Chat_NickNameWnd:SetFacebookScreenshotFileName( fileName )

	self:Reset()
	self.mode = self.Modes.FACEBOOK
	self:SetLayerVisible( true, self.layers.FACEBOOK_EFFECT )
	local facebookEffect = UI:GetEffectFromLayer( self, self.layers.FACEBOOK_EFFECT )
	local size = facebookEffect:GetObjSize( "self" )
	self:SetHeight( size.x )
	self:SetWidth( size.y )
	--self:SetLayerRect( UI:Quat( 0, 0, textSize.z, textSize.w ), self.layers.TEXT_EFFECT, 0 )
	self.fileName = fileName

end

--
function UI.Chat_NickNameWnd:SetVkScreenshotFileName( fileName )

	self:Reset()
	self.mode = self.Modes.VK
	self:SetLayerVisible( true, self.layers.VK_EFFECT )
	local vkEffect = UI:GetEffectFromLayer( self, self.layers.VK_EFFECT )
	local size = vkEffect:GetObjSize( "self" )
	self:SetHeight( size.x )
	self:SetWidth( size.y )
	--self:SetLayerRect( UI:Quat( 0, 0, textSize.z, textSize.w ), self.layers.TEXT_EFFECT, 0 )
	self.fileName = fileName

end

--
function UI.Chat_NickNameWnd:SetInviteAccept( data )

	self:Reset()
	self.mode = self.Modes.LOBBY_INVITE_ACCEPT
	self:SetText( UI:GetStringByName( "chat_lobby_invite_accept_text" ), self.layers.TEXT_EFFECT )
	local formatRect	= UI:Quat( 0, 0, 10000, 10000 )
	local hFont			= self:GetFont( self.layers.TEXT_EFFECT )
	local fontHeight	= _G.GetFontLineHeight( hFont )
	local formatFlags = self:GetTextFormatFlags( self.layers.TEXT_EFFECT )
	local textSize = _G.MeasureText(
   		UI:GetStringByName( "chat_lobby_invite_accept_text" ),
   		hFont,
   		formatRect,
   		formatFlags,
   		formatRect )

	self:SetHeight( textSize.w )
	self:SetWidth( textSize.z )
	self:SetLayerRect( UI:Quat( 0, 0, textSize.z, textSize.w ), self.layers.TEXT_EFFECT, 0 )
	self.data = data

end


--
function UI.Chat_NickNameWnd:SetSquadFinderParams( params )

	self:Reset()
	self.mode = self.Modes.SQUAD_FINDER
	self:SetText( UI:GetStringByName( "chat_squadFinderLink" ), self.layers.TEXT_EFFECT )
	local formatRect	= UI:Quat( 0, 0, 10000, 10000 )
	local hFont			= self:GetFont( self.layers.TEXT_EFFECT )
	local fontHeight	= _G.GetFontLineHeight( hFont )
	local formatFlags = self:GetTextFormatFlags( self.layers.TEXT_EFFECT )
	local textSize = _G.MeasureText(
   		self:GetText( self.layers.TEXT_EFFECT ),
   		hFont,
   		formatRect,
   		formatFlags,
   		formatRect )

	self:SetHeight( textSize.w )
	self:SetWidth( textSize.z )
	self:SetLayerRect( UI:Quat( 0, 0, textSize.z, textSize.w ), self.layers.TEXT_EFFECT, 0 )
	self.data = params
	
end

--
function UI.Chat_NickNameWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self.mode == self.Modes.NICKNAME then
		UI.ContextMenu:Clear()
		-- fill context menu
		UI.ContextMenu:SetName( self.nickName )
		local fromNickName, frombCached, fromRequestId = _G.MasterServer_GetNickName( _G.MasterServer_GetLocalUserId() )
		local toNickName, tobCached, toRequestId = _G.MasterServer_GetNickName( self.uid )
		if frombCached and tobCached then
			UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.COMPLAINT_CHAT + UI.ContextMenuType.PLAYER_TRADING, self.uid, { fromName = fromNickName, toName = toNickName, tabId = UI.Chat:GetCurrentTab() } )
		else
			UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.PLAYER_TRADING, self.uid )
		end
		UI.ContextMenu:Show( mouseX, mouseY )
	end
	return true

end

--
function UI.Chat_NickNameWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self.mode == self.Modes.NICKNAME then
		UI.ChatWnd:SetTextAndEdit( string.format( "/w %s ", self.nickName ) )
	elseif self.mode == self.Modes.SHIP then
		if self.shipDef then
			UI.HangarWnd:OpenShips( self.shipDef, true )
		end
	elseif self.mode == self.Modes.FACEBOOK then
		if self.fileName then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			_G.FB_PostScreenShot( self.fileName )
		end
	elseif self.mode == self.Modes.VK then
		if self.fileName then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			_G.VK_PostScreenShot( self.fileName )
		end
	elseif self.mode == self.Modes.LOBBY_INVITE_ACCEPT then
		if self.data.lid and self.data.lid ~= UI.INVALID_U64_ID then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			UI.GameplayCustom_List:TryJoinLobbyByData( self.data, spectator )
		end
		
	elseif self.mode == self.Modes.SQUAD_FINDER then
	
		if UI.HangarWnd:IsOnScreen() then
		
			if UI.SquadFinder:IsMyGroup() then
				UI.HangarWnd:ShowSquadFinderMyGroupWnd( true )
			else
				UI.HangarWnd:ShowSquadFinderGroupsWnd( true )
			end
		
		end
		
	end
	return true

end

--
function UI.Chat_NickNameWnd:SetColor( col )
	self.color = col
	if self.mode == self.Modes.FACEBOOK then
		local facebookEffect = UI:GetEffectFromLayer( self, self.layers.FACEBOOK_EFFECT )
		facebookEffect:SetAlpha( self.alpha )
	elseif self.mode == self.Modes.VK then
		local vkEffect = UI:GetEffectFromLayer( self, self.layers.VK_EFFECT )
		vkEffect:SetAlpha( self.alpha )
	else
		local color = UI:SetAlpha( self.color, self.alpha )
		UI.Wnd.SetColor( self, color, self.layers.TEXT_EFFECT )
	end
end

--
function UI.Chat_NickNameWnd:SetAlpha( alpha )
	self.alpha = alpha
	if self.mode == self.Modes.FACEBOOK then
		local facebookEffect = UI:GetEffectFromLayer( self, self.layers.FACEBOOK_EFFECT )
		facebookEffect:SetAlpha( self.alpha )
	elseif self.mode == self.Modes.VK then
		local vkEffect = UI:GetEffectFromLayer( self, self.layers.VK_EFFECT )
		vkEffect:SetAlpha( self.alpha )
	else
		local color = UI:SetAlpha( self.color, self.alpha )
		UI.Wnd.SetColor( self, color, self.layers.TEXT_EFFECT )
	end
end

--
function UI.Chat_NickNameWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self.mode == self.Modes.FACEBOOK then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
		local facebookEffect = UI:GetEffectFromLayer( self, self.layers.FACEBOOK_EFFECT )
		facebookEffect:StartAnimation( "over" )
	end
	if self.mode == self.Modes.VK then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
		local vkEffect = UI:GetEffectFromLayer( self, self.layers.VK_EFFECT )
		vkEffect:StartAnimation( "over" )
	end
	return true
end


--
function UI.Chat_NickNameWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self.mode == self.Modes.FACEBOOK then
		local facebookEffect = UI:GetEffectFromLayer( self, self.layers.FACEBOOK_EFFECT )
		facebookEffect:StartAnimation( "idle" )
	end
	if self.mode == self.Modes.VK then
		local vkEffect = UI:GetEffectFromLayer( self, self.layers.VK_EFFECT )
		vkEffect:StartAnimation( "idle" )
	end
	return true
end


-- вспомогаетльное окно - формальный родитель для ссылок в метатексте,
-- чтобы они прокликивались только в его пределах
-- ---------------------------------------------------------------------------
-- UI.ChatNEW_LinksWnd
-- ---------------------------------------------------------------------------

UI.ChatNEW_LinksWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ChatNEW_LinksWnd.def =
{
	className = "Wnd",

	props =
	{
		name 	= "ChatNEW_LinksWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT
	}
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ChatNEW_LinksWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect, hTexMask = UI.Chat_ListWnd_NEW:GetMaskParam()

	UI.drawer:BeginMask( hTexMask, maskRect )
	_G.Font_BeginMask( hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

	_G.Font_EndMask()
	UI.drawer:EndMask()

end


-- ---------------------------------------------------------------------------
-- UI.Chat_ChatBtn_1080
-- ---------------------------------------------------------------------------
UI.Chat_ChatBtn_1080 = {}
-- -------------------------------
-- window definition
-- -------------------------------
UI.Chat_ChatBtn_1080.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	props =
	{
		name		= "Chat_ChatBtn_1080",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
				defName 			= "hangar_chatBtn_1080",
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

UI.Chat_ChatBtn_1080.effectInfo =
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

-- -------------------------------
-- interface functions
-- -------------------------------
--
function UI.Chat_ChatBtn_1080:GetTooltipData()
	local data = { tooltipType = UI.tooltipTypes.TEXT_LARGE }
	data.caption = UI:GetStringByName( "tooltip_chat_btn_caption" )
	data.text = UI:GetStringByName( "tooltip_chat_btn_text" )
	return data
end


-- ---------------------------------------------------------------------------
-- UI.Chat_ChatBtn_720
-- ---------------------------------------------------------------------------
UI.Chat_ChatBtn_720 = {}
-- -------------------------------
-- window definition
-- -------------------------------
UI.Chat_ChatBtn_720.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	props =
	{
		name		= "Chat_ChatBtn_720",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
				defName 			= "hangar_chatBtn_720",
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

UI.Chat_ChatBtn_720.effectInfo =
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

-- -------------------------------
-- interface functions
-- -------------------------------
--
function UI.Chat_ChatBtn_720:GetTooltipData()
	local data = { tooltipType = UI.tooltipTypes.TEXT_LARGE }
	data.caption = UI:GetStringByName( "tooltip_chat_btn_caption" )
	data.text = UI:GetStringByName( "tooltip_chat_btn_text" )
	return data
end

-- ------------------------------------------------------------------------
-- UI.ChatNEW_CrossBtn
-- ------------------------------------------------------------------------

UI.ChatNEW_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "ChatNEW_CrossBtn"
		}
	}
}

--
function UI.ChatNEW_CrossBtn:GetTooltipData()
	return
	{
		tooltipType = UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "chat_tooltip_close_caption" ),
		text		= UI:GetStringByName( "chat_tooltip_close_text" ),
	}
end

-- -----------------------------------------------------------------
-- UI.ChatNEW_ResizeBtn
-- -----------------------------------------------------------------

UI.ChatNEW_ResizeBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ChatNEW_ResizeBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name	= "ChatNEW_ResizeBtn",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		cursor	= "cursor_corner",
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
				defName				= "chat_resize_btn",
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
	},
}

-- ------------------------------
-- const
-- ------------------------------

UI.ChatNEW_ResizeBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "idle",
		animationPressed		= "idle",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "idle",
		animationPressed_focus	= "idle",
	},
}

-- -----------------------------------------------------------------
-- UI.ChatNEW_EyeBtn
-- -----------------------------------------------------------------
UI.ChatNEW_EyeBtn = {}
-- ------------------------------
-- window definition
-- ------------------------------
UI.ChatNEW_EyeBtn.def =
{
	className	= "Wnd",
	props =
	{
		name				= "ChatNEW_EyeBtn",
		style				= UI.WS_UPDATE_IF_VISIBLE,
	},
	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			--updatable	= true,
			effects =
			{{
				defName				= "chat_eye_btn",
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
	},
}

--
function UI.ChatNEW_EyeBtn:GetTooltipData()
	return
	{
		tooltipType = UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "chat_tooltip_eye_caption" ),
		text		= UI:GetStringByName( "chat_tooltip_eye_text" ),
	}
end

UI.ChatNEW_EyeBtn.mouseOver = false

UI.ChatNEW_EyeBtn.layers = 
{
	MAIN_EFFECT 					= 0,
}

--
function UI.ChatNEW_EyeBtn:Update()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local animationName = "idle"
	if not UI.Chat_ListWnd_NEW.alwaysVisible then
		if self.mouseOver then
			animationName = "over"
		else
			animationName = "idle"
		end
	else
		if self.mouseOver then
			animationName = "over_down"
		else
			animationName = "idle_down"
		end
	end
	mainEffect:StartAnimation( animationName )
end

--
function UI.ChatNEW_EyeBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	UI:PlayGlobalSound( UI.HangarWnd.sounds.btnMouseOver )
	self.mouseOver = true
	self:Update()
	return true
end

--
function UI.ChatNEW_EyeBtn:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	self.mouseOver = false
	self:Update()
	return true
end


-- -----------------------------------------------------------------
-- UI.Chat_TradingBtn
-- -----------------------------------------------------------------

UI.Chat_TradingBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name	= "Chat_TradingBtn",
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
    				defName 			= "chat_tradingBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "value43",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.ALL,
    					},
    				}
    			}}
    		},
		}
	},

	textId = "chat_trading",
}