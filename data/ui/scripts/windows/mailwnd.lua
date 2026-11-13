-- ----------------------------------------------------------------------------
--
-- Workfile: mailwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.MailWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.MailWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "MailWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "mail_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "win_1",	
						wnd			= "UI.Mail_LettersWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win_2",	
						wnd			= "UI.Mail_LetterContentWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.Mail_LettersWnd", "UI.Mail_LetterContentWnd" }
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.MailWnd:HasLetterAttachments( letter )

	local attachments = UI:GetLetterAttachments( letter )
	return next( attachments ) ~= nil

end


--
function UI.MailWnd:GetLetterHeaderLocalized( letter, linkTextParams )

	if type( letter ) ~= "table" then
		sys.log( "UI.MailWnd:GetLetterHeaderLocalized()[ERROR]: invalid type of the 1-st parameter (\"letter\" ); \"table\" expected, got \"%s\"", type( letter ) )
		return ""
	end

	local bAllowLinks = linkTextParams ~= nil

	-- тема

	local strTheme = UI:GetLetterTheme( letter )

	if bAllowLinks then

		local strThemeFixed, bWasCut = UI:GetCutTextWithEllipses( strTheme, linkTextParams.maxWidth, linkTextParams.hFont )

		if bWasCut then

			strTheme = string.gsub( strTheme, "\"", "\\\"" )
			strTheme = string.gsub( strTheme, "\r", "\\\r" )
			strTheme = string.gsub( strTheme, "\n", "\\\n" )

			strThemeFixed = string.gsub( strThemeFixed, "\"", "\\\"" )
			strThemeFixed = string.gsub( strThemeFixed, "\r", "\\\r" )
			strThemeFixed = string.gsub( strThemeFixed, "\n", "\\\n" )

			local linkParams = 
			{
				text			= strThemeFixed,
				tooltipCaption	= UI:GetStringByName( "mailCreate_theme" ),
				tooltipText		= strTheme,
				colorSel		= linkTextParams.color,
				colorUnsel		= linkTextParams.color,
			}

			local linkWnd = UI:GetUiObjByHandleT( linkTextParams.hThemeLink )
    		linkWnd:Setup( UI.LinkWnd.linkTypes.CUSTOM_TEXT, linkParams, linkTextParams.hFont, linkTextParams.blendMode, linkTextParams.backColor )

			local linkOwner = UI:GetUiObjByHandleT( linkTextParams.hThemeLinkOwner )
			linkOwner:AddChild( linkWnd )

			strTheme = string.format( "$wndk [hWnd %u]$", linkTextParams.hThemeLink )

		end

	end

	-- автор

	local strAuthorName = "Unknown Author"

	if type( letter.sender ) == "userdata" then

		if letter.sender ~= UI.INVALID_U64_ID then
			strAuthorName = UI:GetPlayerNicknameByUid( letter.sender )
		else
			strAuthorName = UI:GetStringByName( "mail_authorSystem" )
		end

		strAuthorName = UI:ShieldSpecSymbols( strAuthorName )

	else
    	sys.log( "UI.MailWnd:GetLetterHeaderLocalized()[ERROR]: invalid type of \"sender\" in letter %s; \"userdata\" expected, got \"%s\"", _G.U64ToStr( letter.mailId ), type( letter.sender ) )
	end

	local strAuthor = string.format( "%s: %s", UI:GetStringByName( "mail_authorLabel" ), strAuthorName )


	-- дата

	local strDate = "Unknown Date"

	if type( letter.sentAt ) == "userdata" then

		local localDateTime = _G.MasterServer_ServerTimeToLocalTimeT( letter.sentAt )
		strDate = UI:DateTime2Date( localDateTime )

	else
    	sys.log( "UI.MailWnd:GetLetterHeaderLocalized()[ERROR]: invalid type of \"sentAt\" in letter %s; \"userdata\" expected, got \"%s\"", _G.U64ToStr( letter.mailId ), type( letter.sentAt ) )
	end


	-- все вместе
	return string.format( "%s|%s|%s", strTheme, strAuthor, strDate )	

end


--
function UI.MailWnd:GetLetterMsgLocalized( letter )

	if type( letter ) ~= "table" then
		sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: invalid type of the first param (\"letter\" ); \"table\" expected, got \"%s\"", type( letter ) )
		return "", true
	end

	local msg			= "Unknown Message"
	local bSysString    = false

	local bMsgFound		= false

	if type( letter.attachments ) == "table" then

    	for attachmentIdx, attachment in pairs( letter.attachments ) do

    		if attachment.type == _G.MasterServer.AttachmentType.LAT_GAME_MESSAGE then

            	if type( attachment.content ) == "table" then

    	        	if type( attachment.content.stringId ) == "string" then

    					local strId = string.format( "%s_msg", attachment.content.stringId )
    					msg = UI:GetStringByName( strId )
						msg = UI:SubstituteLinks( msg )
						
						-- хак #0108793(0507117) - какой-то индивидуальный параметр подставляется в строку для одного из сообщений
						if attachment.content.stringId == "UniverseReward" then
						
							local zoneId = -1
							if type( attachment.content.zoneId ) == "number" then
								zoneId = attachment.content.zoneId
							else
								sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: invalid type of 'zoneId' for message 'UniverseReward'; 'number' expected, got '%s'", type( attachment.content.zoneId ) )
							end
							
							local strZone = "unknown"
							
							if zoneId ~= -1 then
							
								local zoneName = UI:ZoneId2Name( zoneId )
								
								if zoneName ~= "" then
									strZone = UI:Zone2Str( zoneName, false )
								else
									sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: cannot find zone name for zone id %d", zoneId )
								end
								
							end
							
							local numSubst = 0
							msg, numSubst = string.gsub( msg, "%$zone%$", strZone )
							
							if numSubst == 0 then
								sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: cannot find placeholder '$zone$' in string '%s'", strId )
								msg = string.format( "[INVALID STRING] %s|Zone: %s.", msg, strZone )
							end
							
						-- SC-111984 подставляем в строку курс обмена
						elseif attachment.content.stringId == "DailyCapExtraItems" then
						
							local exchangeRate = _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_OVERCAP_TO_IRIDIUM ) or 1
							local strExchangeRate = UI:Num2StrSeparatedBy3( exchangeRate )
							
							local numSubst = 0
							msg, numSubst = string.gsub( msg, "%$exchange_rate%$", strExchangeRate )
							
							if numSubst == 0 then
								sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: cannot find placeholder 'exchange_rate' in string '%s'", strId )
								msg = string.format( "%s [INVALID STRING] Exchange rate: %s", msg, strExchangeRate )
							end
							
						end

						bSysString = true
    					bMsgFound = true

    				else
    	        		sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: invalid type of \"attachments[%d].content.stringId\" in letter letter %s; \"string\" expected, got \"%s\"", attachmentIdx, _G.U64ToStr( letter.mailId ), type( attachment.content.stringId ) )
    				end								

    			else
            		sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: invalid type of \"attachments[%d].content\" in letter %s; \"table\" expected, got \"%s\"", attachmentIdx, _G.U64ToStr( letter.mailId ), type( attachment.content ) )
            	end

    			break

    		elseif attachment.type == _G.MasterServer.AttachmentType.LAT_MESSAGE then

            	if type( attachment.content ) == "table" then

    	        	if type( attachment.content.body ) == "string" then

    					msg = UI:Ut8ValidateLastSymbol( attachment.content.body )

						local bFromUser = type( letter.sender ) == "userdata" and letter.sender ~= UI.INVALID_U64_ID

						if bFromUser then
							msg = UI:ShieldSpecSymbols( attachment.content.body )
							msg = string.gsub( msg, "\n" , "|" )
						else
							msg = UI:ConvertServerString( msg )
							bSysString = true
						end

    					bMsgFound = true

    				else
    	        		sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: invalid type of \"attachments[%d].content.body\" in letter %s; \"string\" expected, got \"%s\"", attachmentIdx, _G.U64ToStr( letter.mailId ), type( attachment.content.body ) )
    				end								

    			else
            		sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: invalid type of \"attachments[%d].content\" in letter %s; \"table\" expected, got \"%s\"", attachmentIdx, _G.U64ToStr( letter.mailId ), type( attachment.content ) )
            	end

    			break

    		end

    	end

	else
		sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: invalid type of \"attachments\" in letter %s; \"table\" expected, got \"%s\"", _G.U64ToStr( letter.mailId ), type( letter.attachments ) )
	end

	if not bMsgFound then
		sys.log( "UI.MailWnd:GetLetterMsgLocalized()[ERROR]: cannot find message in letter %s", _G.U64ToStr( letter.mailId ) )
	end	

	return msg, bSysString

end


--
function UI.MailWnd:GetLetters()

	return UI.serverData.mail

end


--
function UI.MailWnd:MasterServer_OnMailDeliver( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.MailOpResult.MOR_OK then

		if self:IsOnScreen() then
			self:OnLettersChanged()
		end

	else

		if requestId == self.deliverLetterRequestId then

			local cost = param1
			local bTrading = cost ~= 0
			
			if result == _G.MasterServer.MailOpResult.MOR_IRIDIUM_LIMIT_REACHED and not bTrading then
			
				if UI.Clan:IsInClan() then
				
					self.letterIdToSendIridiumToClan = u64Param
					
					-- SC-111984 подставляем в строку курс обмена
					local exchangeRate = _G.GameStore_GetClanResourceExchangeRate( _G.MasterServer.ClanTransferResource.CTR_OVERCAP_TO_IRIDIUM ) or 1
					local strExchangeRate = UI:Num2StrSeparatedBy3( exchangeRate )
					
					local msg = UI:GetStringByName( "mail_msg_iridiumCap_text_isClan" )
					
					local numSubst = 0
					msg, numSubst = string.gsub( msg, "%$exchange_rate%$", strExchangeRate )
					
					if numSubst == 0 then
						sys.log( "UI.MailWnd:MasterServer_OnMailDeliver()[ERROR]: cannot find placeholder 'exchange_rate' in string 'mail_msg_iridiumCap_text_isClan'" )
						msg = string.format( "%s [INVALID STRING] Exchange rate: %s", msg, strExchangeRate )
					end
					
					self.hMsgIridiumCap_isClan = UI:MessageBox( UI:GetStringByName( "mail_msg_iridiumCap_caption" ), msg, UI.MBS_YES_NO )
					
				else
				
					self.hMsgIridiumCap_noClan = UI:MessageBox( UI:GetStringByName( "mail_msg_iridiumCap_caption" ), UI:GetStringByName( "mail_msg_iridiumCap_text_noClan" ), UI.MBS_OK )
					
				end
				
			else
				self:ShowMsgOnDeliverLetterError( result, bTrading )
			end

		end

	end

	if requestId == self.deliverLetterRequestId then
		self.deliverLetterRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.MailWnd:MasterServer_OnMailRemove( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.MailOpResult.MOR_OK then
		if self:IsOnScreen() then
			self:OnLettersChanged()
		end
	else
		if requestId == self.deleteLetterRequestId then
			self:ShowMsgOnDeleteLetterError( result )
		end
	end

	if requestId == self.deleteLetterRequestId then
		self.deleteLetterRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.MailWnd:MasterServer_OnMailExpired( result, requestId, param1, param2, u64Param )

	if result == _G.MasterServer.MailOpResult.MOR_OK then
		if self:IsOnScreen() then
			self:OnLettersChanged()
		end
	end

end


--
function UI.MailWnd:MasterServer_OnNotification( notification, params )

	if notification ~= _G.MasterServer.ServerNotification.SN_NEW_LETTER then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnLettersChanged()	

end


--
function UI.MailWnd:MasterServer_OnMailGet( result, requestId, param1, param2, u64Param )

	if result ~= _G.MasterServer.MailOpResult.MOR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnLettersChanged()	

end


--
function UI.MailWnd:GetSelLetter()

	return self.selLetterId

end


--
function UI.MailWnd:Hide()

	self:UnlinkFromParent()

end


--
function UI.MailWnd:IsLetterOpen()

	return self.selLetterId ~= UI.INVALID_U64_ID

end


--
function UI.MailWnd:HideLetter( bSound )

	self:SelectLetter( UI.INVALID_U64_ID )

	if bSound then
		UI:PlayGlobalSound( self.sounds.letterHide )
	end

end


--
function UI.MailWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self.lettersWnd:OnNickNameUpdate( uid )

	if self.selLetterId ~= UI.INVALID_U64_ID then
		local letter = UI:GetLetterById( self.selLetterId )
		if letter and letter.sender == uid then
			self.letterContentWnd:OnNickNameUpdate()
		end
	end

end


--
function UI.MailWnd:OnBuyWndResult( result, mode, data )

	if result == true then

		if mode == UI.BuyWnd.modes.INVENTORY_AUTO then
			self:BuyInventory( data.inventoryLevels )
			
		elseif mode == UI.BuyWnd.modes.AUTOGEN_INVENTORY_AUTO then
			self:BuyAutogenInventory( data.autogenInventoryLevels )

		elseif mode == UI.BuyWnd.modes.MAIL_TRADING then

			local letterId = self.letterIdToDeliver
			self.letterIdToDeliver= UI.INVALID_U64_ID

			if letterId ~= UI.INVALID_U64_ID then
				self:TryDeliverLetter2( letterId )
			else
				sys.log( "UI.MailWnd:OnBuyWndResult()[ERROR]: no stored letter id" )
			end

		else
			sys.log( "UI.MailWnd:OnBuyWndResult()[ERROR]: unhandled mode - %s", tostring( mode ) )
			self.letterIdToDeliver = UI.INVALID_U64_ID
		end

	else
		self.letterIdToDeliver = UI.INVALID_U64_ID
	end

end


--
function UI.MailWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if self.buyInventoryRequestId == requestId then
	
		self.buyInventoryRequestId = 0
		self:UpdateWaitingEffect()

		if result == _G.GameStore.StoreBuyResult.SBR_OK then
			if self.letterIdToDeliver ~= UI.INVALID_U64_ID and self:IsOnScreen() then
				self:TryDeliverLetter2( self.letterIdToDeliver )
			end
		else
			self:ShowBuyErrorMsg( result )
		end
	
		if self.buyInventoryRequestId == 0 and self.buyAutogenInventoryRequestId == 0 then
			self.letterIdToDeliver = UI.INVALID_U64_ID
		end
	
	end

end


--
function UI.MailWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	if self.buyAutogenInventoryRequestId == requestId then
	
		self.buyAutogenInventoryRequestId = 0
		self:UpdateWaitingEffect()

		if result == _G.GameStore.StoreBuyResult.SBR_OK then
			if self.letterIdToDeliver ~= UI.INVALID_U64_ID and self:IsOnScreen() then
				self:TryDeliverLetter2( self.letterIdToDeliver )
			end
		else
			self:ShowBuyErrorMsg( result )
		end
	
		if self.buyInventoryRequestId == 0 and self.buyAutogenInventoryRequestId == 0 then
			self.letterIdToDeliver = UI.INVALID_U64_ID
		end
	
	end

end


-- нет самостоятельной подписки, вызывается из uigamefuncs
function UI.MailWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.deleteLetterRequestId			= 0
	self.deliverLetterRequestId			= 0
	self.buyInventoryRequestId			= 0
	self.buyAutogenInventoryRequestId	= 0
	self.letterIdToDelete				= UI.INVALID_U64_ID
	self.letterIdToDeliver				= UI.INVALID_U64_ID
	self.letterIdToSendIridiumToClan	= UI.INVALID_U64_ID

	self:UpdateWaitingEffect()

end


--
function UI.MailWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if not self.letterContentWnd:IsChildOf( self ) then
		return
	end

	self.letterContentWnd:OnPlayerCredits()

end


--
function UI.MailWnd:GetWorkRect()

	local rect = self.lettersWnd:GetRect()

	if self.letterContentWnd:IsOnScreen() then
		rect = UI:CombineRects( rect, self.letterContentWnd:GetRect() )
	end

	return rect
		
end


-- -----------------------------------
-- const
-- -----------------------------------

--
UI.MailWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.MailWnd.sounds =
{
	letterShow			= "sound/ui/btnClick",
	letterHide			= "sound/ui/btnClick",
	letterSlotMouseOver	= "sound/ui/btnMouseOver",
	letterDelete		= "sound/ui/MsgHide",
	letterDeliver		= "sound/ui/MsgHide",
	hide				= UI.sounds.btnClick,
	pageScroll			= "sound/ui/btnClick",
	attachmentsScroll	= "sound/ui/btnClick",
	tradeWndShow		= "sound/ui/btnClick",
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.MailWnd.lettersWnd					= nil
UI.MailWnd.letterContentWnd				= nil
UI.MailWnd.selLetterId					= UI.INVALID_U64_ID
UI.MailWnd.letterIdToDelete				= UI.INVALID_U64_ID
UI.MailWnd.letterIdToDeliver			= UI.INVALID_U64_ID
UI.MailWnd.deleteLetterRequestId		= 0
UI.MailWnd.deliverLetterRequestId		= 0
UI.MailWnd.hMsgDestroyAttachments		= UI.INVALID_UI_HANDLE
UI.MailWnd.buyInventoryRequestId		= 0
UI.MailWnd.buyAutogenInventoryRequestId	= 0
UI.MailWnd.hMsgIridiumCap_isClan		= UI.INVALID_UI_HANDLE
UI.MailWnd.hMsgIridiumCap_noClan		= UI.INVALID_UI_HANDLE
UI.MailWnd.letterIdToSendIridiumToClan	= UI.INVALID_UI_HANDLE

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.MailWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.lettersWnd			= UI.Mail_LettersWnd
	self.letterContentWnd	= UI.Mail_LetterContentWnd

	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.MailWnd:Reset()

	self.lettersWnd:Reset()
	self:SetLetterContentVisible( false )
	self.selLetterId = UI.INVALID_U64_ID

end


--
function UI.MailWnd:FullUpdate()

	self:Reset()

	self.lettersWnd:FullUpdate( false )
	self:UpdateWaitingEffect()

end


--
function UI.MailWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local slotWnd = self:GetSlotByInput( wnd )
	local letterSlotWnd = nil

	if slotWnd and UI:IsWndKindOf( slotWnd, "Mail_Letters_SlotWnd" ) then
		letterSlotWnd = slotWnd
	end

	if letterSlotWnd then

		if not self:IsWaiting() then
    		local letterId = letterSlotWnd:GetRecordData().letter.mailId
    		if letterId ~= self.selLetterId then
    			self:SelectLetter( letterId )
    			UI:PlayGlobalSound( self.sounds.letterShow )
    		end
		end

	elseif wnd == UI.Mail_Letters_CrossBtn then
		self:Hide()
    	UI:PlayGlobalSound( self.sounds.hide )	

	elseif wnd == UI.Mail_LetterContent_DeleteBtn then
		if not self:IsWaiting() then
			self:TryDeleteSelLetter()
		end

	elseif wnd == UI.Mail_LetterContent_GetAttachmentsBtn then
		if not self:IsWaiting() then
			self:TryDeliverSelLetter()
		end

	elseif wnd == UI.Mail_LetterContent_DestroyAttachmentsBtn then
		if not self:IsWaiting() then
			self:TryDeleteSelLetter()
		end

	elseif wnd == UI.Mail_LetterContent_ReplyBtn then
		if not self:IsWaiting() then
			self:ReplyToSelLetter()
		end

	elseif wnd == UI.Mail_Letters_CreateLetterBtn then
		UI.MailCreateWnd:ShowNewLetter( UI.INVALID_U64_ID )
	end

	return true

end


--
function UI.MailWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	-- чтобы сквозь окно почты не зумилась камера в ангаре
	self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	return true

end


--
function UI.MailWnd:GetSlotByInput( w )

	if w.BUTTON_LIST_BTN then
		return w
	end

	local parent = w:GetParent()
	while parent do
		if parent.BUTTON_LIST_BTN then
			return parent
		end
		parent = parent:GetParent()
	end

	return nil

end


--
function UI.MailWnd:TryDeleteSelLetter()

	if self.selLetterId == UI.INVALID_U64_ID then
		sys.log( "UI.MailWnd:DeleteSelLetter()[ERROR]: no sel letter" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.MailWnd:DeleteSelLetter()[ERROR]: still waiting previous request" )
	end

	local letter = UI:GetLetterById( self.selLetterId )

	if UI.MailWnd:HasLetterAttachments( letter ) then

		self.letterIdToDelete = self.selLetterId

		local msgId = UI:IsLetterTrading( letter ) and "msg_mailAttachementsDestroyRequest_trading" or "msg_mailAttachementsDestroyRequest"
		self.hMsgDestroyAttachments = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( msgId ), UI.MBS_YES_NO )

	else
		self:DoDeleteLetter( self.selLetterId )
	end

end


--
function UI.MailWnd:DoDeleteLetter( letterId )

	self.deleteLetterRequestId = _G.MasterServer_MailRemove( letterId )

	if self.deleteLetterRequestId == 0 then
		self:ShowMsgOnDeleteLetterError( _G.MasterServer.MailOpResult.MOR_ERROR )
	else
		UI:PlayGlobalSound( self.sounds.letterDelete )
	end

	self:UpdateWaitingEffect()

end


--
function UI.MailWnd:ShowMsgOnDeleteLetterError( errorCode )

	UI:ShowErrorMsg( "msg_mailDeleteError", errorCode, "_G.MasterServer.MailOpResult" )

end


--
function UI.MailWnd:TryDeliverSelLetter()

	if self.selLetterId == UI.INVALID_U64_ID then
		sys.log( "UI.MailWnd:TryDeliverSelLetter()[ERROR]: no sel letter" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.MailWnd:TryDeliverSelLetter()[ERROR]: still waiting previous request" )
	end

	local letter = UI:GetLetterById( self.selLetterId )

	if UI:IsLetterTrading( letter ) then
		self.letterIdToDeliver = self.selLetterId
		self:LaunchBuyWnd( UI.BuyWnd.modes.MAIL_TRADING, { letter = letter } )
	else
		self:TryDeliverLetter2( self.selLetterId )
	end

end


--
function UI.MailWnd:TryDeliverLetter2( letterId )

	if letterId == UI.INVALID_U64_ID then
		sys.log( "UI.MailWnd:TryDeliverLetter2()[ERROR]: invalid letter id" )
		return
	end

	local letter = UI:GetLetterById( letterId )
	if not letter then
		sys.log( "UI.MailWnd:TryDeliverLetter2()[ERROR]: cannot find letter" )
		return
	end

	local attachments = UI:GetLetterAttachments( letter )
	
	local needSize, needSize_autogen = UI:GetNeedInventorySizeForMailAttachments( attachments )
	
	local usedSize = UI:GetInventoryCurSize()
	local capacity = UI:GetInventoryMaxSizeForCurLevel()
	
	local usedSize_autogen = UI:GetAutogenInventoryCurSize()
	local capacity_autogen = UI:GetAutogenInventoryMaxSizeForCurLevel()

	local bEnoughInventorySize = needSize == 0 or ( usedSize + needSize ) <= capacity
	local bEnoughInventorySize_autogen = needSize_autogen == 0 or ( usedSize_autogen + needSize_autogen ) <= capacity_autogen
	
	if bEnoughInventorySize and bEnoughInventorySize_autogen then

		self:DoDeliverLetter( letterId )

	elseif not bEnoughInventorySize then

		local curLevel = UI:GetInventoryCurLevel()
		local inventoryLevelsToBuy = {}
		
		local newCapacity = capacity
	
		for levelToBuy = curLevel + 1, UI:GetInventoryMaxLevel() do
	
			table.insert( inventoryLevelsToBuy, levelToBuy )
	
			newCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
			if ( usedSize + needSize ) <= newCapacity then
				break
			end
	
		end		
	
		if ( usedSize + needSize ) <= newCapacity then
	
			self.letterIdToDeliver = letterId
			self:LaunchBuyWnd( UI.BuyWnd.modes.INVENTORY_AUTO, { inventoryLevels = inventoryLevelsToBuy } )
	
		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end
		
	else

		local curLevel = UI:GetAutogenInventoryCurLevel()
		local inventoryLevelsToBuy = {}
		
		local newCapacity = capacity_autogen
	
		for levelToBuy = curLevel + 1, UI:GetAutogenInventoryMaxLevel() do
	
			table.insert( inventoryLevelsToBuy, levelToBuy )
	
			newCapacity = UI:GetAutogenInventoryMaxSizeForLevel( levelToBuy )
			if ( usedSize_autogen + needSize_autogen ) <= newCapacity then
				break
			end
	
		end		
	
		if ( usedSize_autogen + needSize_autogen ) <= newCapacity then
	
			self.letterIdToDeliver = letterId
			self:LaunchBuyWnd( UI.BuyWnd.modes.AUTOGEN_INVENTORY_AUTO, { autogenInventoryLevels = inventoryLevelsToBuy } )
	
		else
			UI:MessageBox( UI:GetStringByName( "buyAutogenInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseAutogenInventory_AUTO" ), UI.MBS_OK )
		end

	end

end


--
function UI.MailWnd:DoDeliverLetter( letterId, bSendIridiumToClan )

	if bSendIridiumToClan == nil then
		bSendIridiumToClan = false
	end

	self.deliverLetterRequestId = _G.MasterServer_MailDeliver( letterId, bSendIridiumToClan )

	if self.deliverLetterRequestId == 0 then

		local letter = UI:GetLetterById( letterId )
		local bTrading = UI:IsLetterTrading( letter )

		self:ShowMsgOnDeliverLetterError( _G.MasterServer.MailOpResult.MOR_ERROR, bTrading )

	else
		UI:PlayGlobalSound( self.sounds.letterDeliver )
	end

	self:UpdateWaitingEffect()

end


--
function UI.MailWnd:ShowMsgOnDeliverLetterError( errorCode, bTrading )

	local msgStingId = bTrading and "msg_mailDeliverError_trading" or "msg_mailDeliverError"
	UI:ShowErrorMsg( msgStingId, errorCode, "_G.MasterServer.MailOpResult" )

end


--
function UI.MailWnd:OnLettersChanged()

	self:CheckRemoveSelLetter()
	self:CheckResetLetterToDelete()
	self:CheckResetLetterToDeliver()
	self:CheckResetLetterToSendIridiumToClan()
	self.lettersWnd:FullUpdate( true )
	
end


--
function UI.MailWnd:CheckRemoveSelLetter()

	if self.selLetterId == UI.INVALID_U64_ID then
		return
	end

	if not UI:GetLetterById( self.selLetterId ) then
		self:SelectLetter( UI.INVALID_U64_ID )
	end	

end


--
function UI.MailWnd:CheckResetLetterToDelete()

	if self.letterIdToDelete ~= UI.INVALID_U64_ID then

		local letter = UI:GetLetterById( self.letterIdToDelete )
		if not letter then

			self.letterIdToDelete = UI.INVALID_U64_ID

        	if self.hMsgDestroyAttachments ~= UI.INVALID_UI_HANDLE then

        		UI:RemoveUiObj( self.hMsgDestroyAttachments )
        		self.hMsgDestroyAttachments	= UI.INVALID_UI_HANDLE
        		UI:Purge()

        	end

		end

	end

end


--
function UI.MailWnd:CheckResetLetterToDeliver()

	if self.letterIdToDeliver ~= UI.INVALID_U64_ID then

		local letter = UI:GetLetterById( self.letterIdToDeliver )
		if not letter then

			self.letterIdToDeliver = UI.INVALID_U64_ID

			if UI.Mail_BuyWnd:IsOnScreen() then

				local mode = UI.Mail_BuyWnd:GetMode()

				if mode == UI.BuyWnd.modes.INVENTORY_AUTO or mode == UI.BuyWnd.modes.AUTOGEN_INVENTORY_AUTO or mode == UI.BuyWnd.modes.MAIL_TRADING then
					UI.Mail_BuyWnd:Hide()
				end

			end

		end

	end

end


--
function UI.MailWnd:CheckResetLetterToSendIridiumToClan()

	if self.letterIdToSendIridiumToClan ~= UI.INVALID_U64_ID then

		local letter = UI:GetLetterById( self.letterIdToSendIridiumToClan )
		if not letter then

			self.letterIdToSendIridiumToClan = UI.INVALID_U64_ID

			if self.hMsgIridiumCap_isClan ~= UI.INVALID_UI_HANDLE then
		
				UI:RemoveUiObj( self.hMsgIridiumCap_isClan )
				self.hMsgIridiumCap_isClan = UI.INVALID_UI_HANDLE
				UI:Purge()
		
			end
		
		end

	end
	
end


--
function UI.MailWnd:SelectLetter( letterId )

	if self.selLetterId == letterId then
		return
	end

	self.selLetterId = letterId

	if self.selLetterId ~= UI.INVALID_U64_ID then
		self:SetLetterContentVisible( true )
		self.letterContentWnd:Setup( UI:GetLetterById( letterId ) )
	else
		self:SetLetterContentVisible( false )
	end

	self.lettersWnd:OnSelLetterChanged()

end


--
function UI.MailWnd:SetLetterContentVisible( bVisible )

	if bVisible then
		self:AddChild( self.letterContentWnd )
	else
		self.letterContentWnd:Reset()
		self.letterContentWnd:UnlinkFromParent()
	end

	UI.HangarWnd:UpdateMailWndPosition()

end


--
function UI.MailWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self.lettersWnd:SetLayerVisible( bWaiting, self.lettersWnd.layers.WAIT_EFFECT )
	self.lettersWnd:SetLayerVisible( bWaiting, self.lettersWnd.layers.WAIT_TEXT )

end


--
function UI.MailWnd:IsWaiting()

	return self.deleteLetterRequestId ~= 0 or self.deliverLetterRequestId ~= 0 or self.buyInventoryRequestId ~= 0 or self.buyAutogenInventoryRequestId ~= 0

end


--
function UI.MailWnd:F_OnEventSaveUiState()

	UI.store.MailWnd =
	{
		deleteLetterRequestId			= self.deleteLetterRequestId,
		deliverLetterRequestId			= self.deliverLetterRequestId,
		buyInventoryRequestId			= self.buyInventoryRequestId,
		buyAutogenInventoryRequestId	= self.buyAutogenInventoryRequestId,
	}

end


--
function UI.MailWnd:F_OnEventRestoreUiState()

	if UI.store.MailWnd then

		self.deleteLetterRequestId			= UI.store.MailWnd.deleteLetterRequestId
		self.deliverLetterRequestId			= UI.store.MailWnd.deliverLetterRequestId
		self.buyInventoryRequestId			= UI.store.MailWnd.buyInventoryRequestId
		self.buyAutogenInventoryRequestId	= UI.store.MailWnd.buyAutogenInventoryRequestId
		self:UpdateWaitingEffect()

		UI.store.MailWnd = nil

	end

end    


--
function UI.MailWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

end


--
function UI.MailWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then

		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	
		if self.hMsgDestroyAttachments ~= UI.INVALID_UI_HANDLE then
	
			UI:RemoveUiObj( self.hMsgDestroyAttachments )
			self.hMsgDestroyAttachments	= UI.INVALID_UI_HANDLE
			UI:Purge()
	
		end
		
		if self.hMsgIridiumCap_isClan ~= UI.INVALID_UI_HANDLE then

			UI:RemoveUiObj( self.hMsgIridiumCap_isClan )
			self.hMsgIridiumCap_isClan	= UI.INVALID_UI_HANDLE
			UI:Purge()
	
		end
		
		if self.hMsgIridiumCap_noClan ~= UI.INVALID_UI_HANDLE then

			UI:RemoveUiObj( self.hMsgIridiumCap_noClan )
			self.hMsgIridiumCap_noClan	= UI.INVALID_UI_HANDLE
			UI:Purge()
	
		end

		UI.Mail_BuyWnd:Hide()

		self.letterIdToDelete = UI.INVALID_U64_ID
		self.letterIdToDeliver = UI.INVALID_U64_ID
		self.letterIdToSendIridiumToClan = UI.INVALID_U64_ID

	end

end


--
function UI.MailWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgDestroyAttachments then

		self.hMsgDestroyAttachments = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			self:DoDeleteLetter( self.letterIdToDelete )
		end

		self.letterIdToDelete = UI.INVALID_U64_ID
		
	elseif boxHandle == self.hMsgIridiumCap_isClan then

		self.hMsgIridiumCap_isClan = UI.INVALID_UI_HANDLE
		
		if retCode == UI.MBRET_YES then
		
			if self.letterIdToSendIridiumToClan ~= UI.INVALID_U64_ID then
				self:DoDeliverLetter( self.letterIdToSendIridiumToClan, true )
			else
				sys.log( "UI.MailWnd:F_OnEventMsgBoxRet()[ERROR]: no saved letter id" )
			end
			
		end
		
		self.letterIdToSendIridiumToClan = UI.INVALID_U64_ID
		
	elseif boxHandle == self.hMsgIridiumCap_noClan then

		self.hMsgIridiumCap_noClan = UI.INVALID_UI_HANDLE
		
	end

end


--
function UI.MailWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	-- если клик за пределами экрана, то скрыть
	-- исключение: если показывается перекрывающее окно (месседжбокс и т.п.) - тогда вообще не реагировать

	if UI:GetFirstOverlayWnd() then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	

	if not UI:IsPtInRect( self:ToScreen( self:GetWorkRect() ), mouseX, mouseY ) then

		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )
		if wndUnderMouse ~= UI.Hangar_MailBtn then
			self:Hide()
		end
	end

end


--
function UI.MailWnd:ReplyToSelLetter()

	if self.selLetterId == UI.INVALID_U64_ID then
		sys.log( "UI.MailWnd:ReplyToSelLetter()[ERROR]: no selected letter" )
		return
	end

	local letter = UI:GetLetterById( self.selLetterId )

	UI.MailCreateWnd:ShowReplyToLetter( letter )

end


--
function UI.MailWnd:LaunchBuyWnd( mode, data )

	UI.Mail_BuyWnd:Setup( mode, true, data )
	UI.Mail_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.MailWnd:BuyInventory( inventoryLevels )

	local maxLevel = inventoryLevels[ #inventoryLevels ]
	self.buyInventoryRequestId = _G.GameStore_BuyInventoryExtension( maxLevel )

	if self.buyInventoryRequestId == 0 then
		self.letterIdToDeliver = UI.INVALID_U64_ID
		self:ShowBuyErrorMsg( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end
	
	self:UpdateWaitingEffect()

end


--
function UI.MailWnd:BuyAutogenInventory( inventoryLevels )
	
	local maxLevel = inventoryLevels[ #inventoryLevels ]
	self.buyAutogenInventoryRequestId = _G.GameStore_BuyAutogenInventoryExtension( maxLevel )
	sys.log( "UI.MailWnd:BuyAutogenInventory(): buy autogen inventory level '%d'", maxLevel )

	if self.buyAutogenInventoryRequestId == 0 then
		self.letterIdToDeliver = UI.INVALID_U64_ID
		self:ShowBuyErrorMsg( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end
	
	self:UpdateWaitingEffect()

end


--
function UI.MailWnd:ShowBuyErrorMsg( result )

	local msg = UI:GetStringByName( "msg_buyError" )

	local resultName = UI:Val2Key( _G.GameStore.StoreBuyResult, result )
	local resultStr = UI:GetStringByName( string.format( "buyError_%s", resultName ) )
	
	msg = string.format( msg, resultStr )
	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

end

-- --------------------------------------------------------------------------------
-- UI.Mail_LettersWnd
-- --------------------------------------------------------------------------------

UI.Mail_LettersWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.Mail_LettersWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    WAIT_EFFECT	= 2,
	WAIT_TEXT	= 3,
}


--
UI.Mail_LettersWnd.def =
{
	className 	= "Wnd",

	props =
	{
		name			= "Mail_LettersWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,		
	},

	layers =
	{
		firstOverlayLayer = UI.Mail_LettersWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,			

			effects =
			{{
				defName 			= "mail_letters",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",	
						layer		= "UI.Mail_LettersWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.Mail_Letters_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "choose",	
						wnd			= "UI.Mail_Letters_ChoiceWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.Mail_Letters_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",	
						layer		= "UI.Mail_LettersWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "btn_1",	
						wnd			= "UI.Mail_Letters_CreateLetterBtn",
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

			text			= UI:GetStringByName( "mail_caption" )
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
						layer		= "UI.Mail_LettersWnd.layers.WAIT_TEXT",
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

	children =
	{
		"UI.Mail_Letters_ListWnd",
		"UI.Mail_Letters_ChoiceWnd",
		"UI.Mail_Letters_CrossBtn",
		"UI.Mail_Letters_CreateLetterBtn",
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Mail_LettersWnd:FullUpdate( bRestorePage )

	local oldPage = self.page

	self:Reset()

	self.letters = UI.MailWnd:GetLetters()
	self.numLetters = #self.letters

	self.numPages = math.ceil( self.numLetters / self.listWnd.MAX_SLOTS )

	local page = -1

	if self.numPages > 0 then
		local defaultPage = 1
		page = bRestorePage and oldPage or defaultPage
		page = UI:Clamp( page, 1, self.numPages )		
	end

	self:SetPage( page )

end


--
function UI.Mail_LettersWnd:Reset()

	self:SetPage( -1 )

	self.numPages	= 0
	self.letters	= {}
	self.numLetters	= 0

end


--
function UI.Mail_LettersWnd:OnSelLetterChanged()

	self:UpdateSelection()

end


--
function UI.Mail_LettersWnd:OnNickNameUpdate( uid )

	for recordIdx = 1, self.listWnd:GetNumRecords() do

		local data = self.listWnd:GetRecordData( recordIdx )
		if data.letter.sender == uid then

			local slotWnd = self.listWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnNickNameUpdate()
			end

		end

	end	

end


-- -----------------------------------
-- const
-- -----------------------------------

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Mail_LettersWnd.page						= -1
UI.Mail_LettersWnd.numPages					= 0
UI.Mail_LettersWnd.letters					= 0
UI.Mail_LettersWnd.numLetters				= 0
UI.Mail_LettersWnd.listWnd					= nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Mail_LettersWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.listWnd	= UI.Mail_Letters_ListWnd
	self.choiceWnd	= UI.Mail_Letters_ChoiceWnd	

end


--
function UI.Mail_LettersWnd:SetPage( page )

	self.page = page

	self:UpdateList()
	self:UpdateChoice()

end


--
function UI.Mail_LettersWnd:UpdateList()

	self:ResetList()

	if self.page == -1 then
		return
	end

	if self.numLetters == 0 then
		return
	end

	local firstLetterIdx	= ( self.page - 1 ) * self.listWnd.MAX_SLOTS + 1
	local lastLetterIdx		= UI:Clamp( firstLetterIdx + self.listWnd.MAX_SLOTS - 1, 1, self.numLetters )

	for letterIdx = firstLetterIdx, lastLetterIdx do

		local data = {}
		data.letter = self.letters[ letterIdx ]
		
		self.listWnd:AddRecord( data )

	end

	self:UpdateSelection()

end


--
function UI.Mail_LettersWnd:UpdateChoice()

	self:ResetChoice()

	if self.numPages < 2 then
		return
	end

	local text = string.format( "%d/%d", self.page, self.numPages )
	self.choiceWnd:Setup( text, self.page > 1, self.page < self.numPages )

	self.choiceWnd:ShowArrows()

end


--
function UI.Mail_LettersWnd:ResetList()

	self.listWnd:Clear()

end


--
function UI.Mail_LettersWnd:ResetChoice()

	self.choiceWnd:Reset()
	self.choiceWnd:HideArrows()

end


--
function UI.Mail_LettersWnd:GetRecordByLetterId( letterId )

	for recordIdx = 1, self.listWnd:GetNumRecords() do
		local data = self.listWnd:GetRecordData( recordIdx ) 
		if data.letter.mailId == letterId then
			return recordIdx
		end
	end

	return -1

end


--
function UI.Mail_LettersWnd:UpdateSelection()

	local selLetterId = UI.MailWnd:GetSelLetter()

	if selLetterId == UI.INVALID_U64_ID then
		self.listWnd:SelectRecord( -1 )
	else
    	local recordIdx = self:GetRecordByLetterId( selLetterId )
		self.listWnd:SelectRecord( recordIdx  )
	end

end


--
function UI.Mail_LettersWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd.CHOICE_ARROW_LEFT then
		self:ScrollPage( false )
		return true

	elseif wnd.CHOICE_ARROW_RIGHT then
		self:ScrollPage( true )
		return true
	end

	return false

end    


--
function UI.Mail_LettersWnd:ScrollPage( bForward )

	if self.page == -1 then
		return
	end

	local nextPage = UI:Clamp( self.page + ( bForward and 1 or -1 ), 1, self.numPages )

	if nextPage ~= self.page then
		self:SetPage( nextPage )
		UI:PlayGlobalSound( UI.MailWnd.sounds.pageScroll )
	end

end


-- --------------------------------------------------------------------------------
-- UI.Mail_Letters_ListWnd
-- --------------------------------------------------------------------------------

UI.Mail_Letters_ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Mail_Letters_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "Mail_Letters_ListWnd",
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
				defName 			= "mail_letters_list",
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
-- const
-- -----------------------------------

UI.Mail_Letters_ListWnd.btnPrototypeName = "Mail_Letters_SlotWnd"

UI.Mail_Letters_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.Mail_Letters_ListWnd.MAX_SLOTS = 6

UI.Mail_Letters_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION


-- --------------------------------------------------------------------------------
-- UI.Mail_Letters_SlotWnd
-- --------------------------------------------------------------------------------

UI.Mail_Letters_SlotWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Mail_Letters_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "Mail_Letters_SlotWnd",
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
				defName 			= "mail_letters_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.Mail_Letters_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",	
						layer		= "UI.Mail_Letters_SlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "mail_letters_slot_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -----------------------------------
-- interface funcitons
-- -----------------------------------

--
function UI.Mail_Letters_SlotWnd:Reset()

	UI.ButtonsList3_Btn.Reset( self )

	self:ResetMetaText()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetMouseOver( false )

	self.timeLeftWnd:Reset()

end


--
function UI.Mail_Letters_SlotWnd:Select( bSelect, bAnimated )

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

end


--
function UI.Mail_Letters_SlotWnd:OnNickNameUpdate()

	local data = self:GetRecordData()
	self:UpdateText( data )

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Mail_Letters_SlotWnd.layers =
{
	MAIN_EFFECT			= 0,
	TEXT				= 1,
	MOUSE_OVER_EFFECT	= 2,
}

UI.Mail_Letters_SlotWnd.effectInfo =
{
	main =
	{
		icoSpriteName	= "ico",
		animIdle		= "idle",
		animSel			= "select",
		timeLeftLocator	= "timer",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Mail_Letters_SlotWnd.timeLeftWnd		= nil
UI.Mail_Letters_SlotWnd.headerMetaText	= nil
UI.Mail_Letters_SlotWnd.themeLinkWnd	= nil

-- -----------------------------------
-- work funcitons
-- -----------------------------------

--
function UI.Mail_Letters_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.headerMetaText = UI.MetaText.GetNewInstance()
	self.headerMetaText:InitFromLayer( self, self.layers.TEXT ) 	

	self:CreateControls()

end


--
function UI.Mail_Letters_SlotWnd:F_Shutdown()

	if self.headerMetaText then
		self.headerMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Mail_Letters_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Mail_Letters_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Mail_Letters_SlotWnd:UpdateMetaTextPos()

	self.headerMetaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.Mail_Letters_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.headerMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Mail_Letters_SlotWnd:CreateControls()

	self.timeLeftWnd	= UI:CreateChildWnd( self, UI.Mail_Letters_Slot_LeftTimeWnd, "" )
	self.themeLinkWnd	= UI:CreateChildWnd( self, UI.LinkWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.timeLeftWnd, mainEffect, self.effectInfo.main.timeLeftLocator, UI.EffectAnimParams.POS )

end


--
function UI.Mail_Letters_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation( data )
	self:UpdateIco( data )
	self:UpdateText( data )
	self:UpdateTimeLeft( data )
	self:UpdateMouseOver()

end


--
function UI.Mail_Letters_SlotWnd:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local bSelected = self:IsSelected()
	local anim = bSelected and self.effectInfo.main.animSel or self.effectInfo.main.animIdle

	mainEffect:StartAnimation( anim )

end


--
function UI.Mail_Letters_SlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local bHasAttachements = UI.MailWnd:HasLetterAttachments( data.letter )

	local texName = ""

	if UI:IsLetterImportant( data.letter ) then
		texName = bHasAttachements and "mail_attach_important" or "mail_empty_important"

	elseif UI:IsLetterTrading( data.letter ) then
		texName = "mail_attach_trading"

	else
		texName = bHasAttachements and "mail_attach_new" or "mail_empty_new"
	end

	local hTex = UI:GetTex( texName )

	mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.Mail_Letters_SlotWnd:UpdateText( data )

	self:ResetMetaText()

	local linkTextParams =
	{
		maxWidth		= self.headerMetaText:GetFormatRectSize().x,
		hFont			= self.headerMetaText:GetFormatParams().hFont,
		color			= self.headerMetaText:GetColor(),
		blendMode		= self.headerMetaText:GetBlendMode(),
		backColor		= self.headerMetaText:GetBackColor(),
		hThemeLink		= self.themeLinkWnd:GetUiHandle(),
		hThemeLinkOwner	= self:GetUiHandle(),
	}

	local str = UI.MailWnd:GetLetterHeaderLocalized( data.letter, linkTextParams )
	self.headerMetaText:SetText( str, true )

end


--
function UI.Mail_Letters_SlotWnd:UpdateTimeLeft( data )

	local timeLeft = UI:GetLetterLeftTime( data.letter )
	self.timeLeftWnd:SetTime( timeLeft )

end


--
function UI.Mail_Letters_SlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	
	self:UpdateTimeLeft( self:GetRecordData() )

end


--
function UI.Mail_Letters_SlotWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Mail_Letters_SlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.MailWnd.sounds.letterSlotMouseOver )
	end

end


--
function UI.Mail_Letters_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.Mail_Letters_SlotWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Mail_Letters_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOver()

end


--
function UI.Mail_Letters_SlotWnd:ResetMetaText()

	self.headerMetaText:SetText( "", true )

	self.themeLinkWnd:Reset()
	self.themeLinkWnd:UnlinkFromParent()

end


-- --------------------------------------------------------------------------------
-- UI.Mail_Letters_Slot_LeftTimeWnd
-- --------------------------------------------------------------------------------

UI.Mail_Letters_Slot_LeftTimeWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.Mail_Letters_Slot_LeftTimeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Mail_Letters_Slot_LeftTimeWnd",
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

			effects =
			{{
				defName				= "mail_letters_slot_leftTime",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "timer",
						layer		= "UI.Mail_Letters_Slot_LeftTimeWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- TEXT
		{
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
function UI.Mail_Letters_Slot_LeftTimeWnd:SetTime( time )

	local timeOld = self.time

	self.time = UI:Round( time )

	if self.time ~= timeOld then
		self:UpdateText()
		self:UpdateTooltip( true )
	end

end


--
function UI.Mail_Letters_Slot_LeftTimeWnd:Reset()

	self.time = -1
	self.tooltipData = nil

	self:SetText( "", self.layers.TEXT )

end


--
function UI.Mail_Letters_Slot_LeftTimeWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Mail_Letters_Slot_LeftTimeWnd:HandleTooltip( targetWnd, tooltipData )

	if targetWnd ~= self then
		return false
	end

	self:UpdateTooltip( false )

	local hTooltipWnd = UI:GetDefaultTooltipWnd( self.tooltipData.tooltipType )
	local tooltipWnd = UI:GetUiObjByHandleT( hTooltipWnd )
	if tooltipWnd then
		tooltipWnd:Setup( self.tooltipData, false )
	end

	return true, hTooltipWnd

end


-- ------------------------------------
-- const
-- ------------------------------------

UI.Mail_Letters_Slot_LeftTimeWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.Mail_Letters_Slot_LeftTimeWnd.strTooltipLabel = UI:GetStringByName( "mail_timeLeftTooltip_text" )

-- ------------------------------------
-- vars
-- ------------------------------------

UI.Mail_Letters_Slot_LeftTimeWnd.time			= -1
UI.Mail_Letters_Slot_LeftTimeWnd.tooltipData	= nil

-- ------------------------------------
-- work functions
-- ------------------------------------

--
function UI.Mail_Letters_Slot_LeftTimeWnd:UpdateText()

	local strTime = UI:Time2Str6( self.time )
	self:SetText( strTime, self.layers.TEXT )		

end


--
function UI.Mail_Letters_Slot_LeftTimeWnd:UpdateTooltip( bIfOnScreenOnly )

	if not self.tooltipData then

		self.tooltipData = {}
		self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption = UI:GetStringByName( "mail_timeLeftTooltip_caption" )

	end

	local tooltipWnd = self:GetOnScreenTooltip()
	if bIfOnScreenOnly and not tooltipWnd then
		return
	end

	local strTime = UI:Time2Str43( self.time )
	self.tooltipData.text = string.gsub( self.strTooltipLabel, "%$time%$", strTime )

	if tooltipWnd then
		tooltipWnd:Setup( self.tooltipData, true )
	end
	
end


--
function UI.Mail_Letters_Slot_LeftTimeWnd:GetOnScreenTooltip()

	if UI:GetCurTooltipTarget() == self then
		return UI:GetCurTooltip()
	else
		return nil
	end

end


-- --------------------------------------------------------------------------------
-- UI.Mail_Letters_ChoiceWnd
-- --------------------------------------------------------------------------------

UI.Mail_Letters_ChoiceWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Mail_Letters_ChoiceWnd.def =
{
	className 	= "Wnd",
	prototype	= "ChoiceWnd",

	props =
	{
		name		= "Mail_Letters_ChoiceWnd",
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
				defName				= "mail_letters_choice",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "t_",
						layer		= "UI.Mail_Letters_ChoiceWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		}
	}
}

-- ------------------------------------
-- const
-- ------------------------------------

UI.Mail_Letters_ChoiceWnd.effectInfo =
{
	main =
	{
		leftArrowObjName	= "btn_1",
		rightArrowObjName   = "btn_2",
	}
}

UI.Mail_Letters_ChoiceWnd.leftArrowPrototypeName	= "Mail_Letters_Choice_BtnLeft"
UI.Mail_Letters_ChoiceWnd.rightArrowPrototypeName	= "Mail_Letters_Choice_BtnRight"


-- --------------------------------------------------------------------------------
-- UI.Mail_Letters_Choice_BtnLeft
-- --------------------------------------------------------------------------------

local l_numBaceChoiceBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.Mail_Letters_Choice_BtnLeft = 
{
	def =
	{
    	className 	= "ButtonWnd",
		prototype	= "Choice_ArrowBtn_Left",

    	props =
    	{
    		name		= "Mail_Letters_Choice_BtnLeft",
			isPrototype	= true,
    	},	

		layers =
		{
			numLayers = l_numBaceChoiceBtnLayers + 1,

			-- MAIN_EFFECT
			{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

    			effects =
    			{{
    				defName				= "mail_letters_choice_btnLeft",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "t_1",	
    						layer		= "UI.Mail_Letters_Choice_BtnLeft.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
					}
				}}
			},

    		-- TEXT
    		{
				id 				= l_numBaceChoiceBtnLayers,
    			layerType		= UI.LAYER_TEXT,
       			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz	= { 1, 1 },
       			font			= { fontName = "Small" },

				text			= UI:GetStringByName( "mail_pagePrev" ),
    		},
		}
	},

	layers =
	{
		MAIN_EFFECT	= 0,
		DEBUG		= 1,
		TEXT		= 2,
	}
}


-- --------------------------------------------------------------------------------
-- UI.Mail_Letters_Choice_BtnRight
-- --------------------------------------------------------------------------------

UI.Mail_Letters_Choice_BtnRight = 
{
	def =
	{
    	className 	= "ButtonWnd",
		prototype	= "Choice_ArrowBtn_Right",

    	props =
    	{
    		name		= "Mail_Letters_Choice_BtnRight",
			isPrototype	= true,
    	},	

		layers =
		{
			numLayers = l_numBaceChoiceBtnLayers + 1,

			-- MAIN_EFFECT
			{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

    			effects =
    			{{
    				defName				= "mail_letters_choice_btnRight",
    				defaultAnimation    = "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "t_1",	
    						layer		= "UI.Mail_Letters_Choice_BtnRight.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
					}
				}}
			},

    		-- TEXT
    		{
				id 				= l_numBaceChoiceBtnLayers,
    			layerType		= UI.LAYER_TEXT,
       			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz	= { 1, 1 },
       			font			= { fontName = "Small" },

				text			= UI:GetStringByName( "mail_pageNext" ),
    		},
		}
	},

	layers =
	{
		MAIN_EFFECT	= 0,
		DEBUG		= 1,
		TEXT		= 2,
	}
}

-- --------------------------------------------------------------------------------
-- UI.Mail_Letters_CrossBtn
-- --------------------------------------------------------------------------------

UI.Mail_Letters_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "Mail_Letters_CrossBtn"
    	}
	}
}

-- ----------------------------------------------------------------------------
-- UI.Mail_Letters_CreateLetterBtn
-- ----------------------------------------------------------------------------

UI.Mail_Letters_CreateLetterBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name	= "Mail_Letters_CreateLetterBtn",
    	},
	},

	textId = "mail_btnCreateLetter",
}

-- ----------------------------------------------------------------------------
-- UI.Mail_LetterContentWnd
-- ----------------------------------------------------------------------------

UI.Mail_LetterContentWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Mail_LetterContentWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "Mail_LetterContentWnd",
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
				defName 			= "mail_letterContent_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "descrip",	
						wnd			= "UI.Mail_LetterContent_MsgWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "attach",	
						wnd			= "UI.Mail_LetterContent_AttachmentsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",	
						wnd			= "UI.Mail_LetterContent_GetAttachmentsBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_2",	
						wnd			= "UI.Mail_LetterContent_ReplyBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",	
						wnd			= "UI.Mail_LetterContent_DeleteBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_1",	
						wnd			= "UI.Mail_LetterContent_DestroyAttachmentsBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price",	
						layer		= "UI.Mail_LetterContentWnd.layers.PRICE",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- PRICE
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= {fontName = "Small" },
		},
	},

	children =
	{
		"UI.Mail_LetterContent_MsgWnd",
		"UI.Mail_LetterContent_AttachmentsWnd",
		"UI.Mail_LetterContent_GetAttachmentsBtn",
		"UI.Mail_LetterContent_ReplyBtn",
		"UI.Mail_LetterContent_DeleteBtn",
		"UI.Mail_LetterContent_DestroyAttachmentsBtn",
	}	
}

-- ------------------------------
-- interface funciotns
-- ------------------------------

--
function UI.Mail_LetterContentWnd:Setup( letter )

	if type( letter ) ~= "table" then
		sys.log( "UI.Mail_LetterContentWnd:Setup()[ERROR]: invalid type of the 1-st param (\"letter\"); \"table\" expected, gor \"%s\"", type( letter ) )
		return
	end

	self:Reset()

	self.letter = letter

	local bHasAttachments = UI.MailWnd:HasLetterAttachments( letter )


	-- сообщение

	local msgSizeMode = -1
	if UI:IsLetterTrading( letter ) then
		msgSizeMode = UI.Mail_LetterContent_MsgWnd.sizeModes.TRADING
	elseif bHasAttachments then
		msgSizeMode = UI.Mail_LetterContent_MsgWnd.sizeModes.SMALL
	else
		msgSizeMode = UI.Mail_LetterContent_MsgWnd.sizeModes.LARGE
	end

	self.msgWnd:Setup( letter, msgSizeMode )


	-- список аттачментов

	if bHasAttachments then
		self:AddChild( self.attachmentsWnd )
		self.attachmentsWnd:Setup( letter )
	end


	-- кнопки

	if bHasAttachments then

		-- удалить письмо и забрать аттачменты
		self:AddChild( self.getAttachmentsBtn )
		local textId = UI:IsLetterTrading( letter ) and "mail_btnGetAttachments_trading" or "mail_btnGetAttachments"
		self.getAttachmentsBtn:SetBtnText( UI:GetStringByName( textId ) )

		-- удалить письмо и аттачменты
		self:AddChild( self.destroyAttachmentsBtn )
		local textId = UI:IsLetterTrading( letter ) and "mail_btnDestroyAttachments_trading" or "mail_btnDestroyAttachments"
		self.destroyAttachmentsBtn:SetBtnText( UI:GetStringByName( textId ) )

	else

		-- удалить письмо
		self:AddChild( self.deleteBtn )

	end	

	-- ответить
	if ( type( self.letter.sender ) == "userdata" and self.letter.sender ~= UI.INVALID_U64_ID ) and not UI:IsLetterTrading( letter ) then
		self:AddChild( self.replyBtn )
	end	


	-- торговая цена
	self:UpdatePrice()


	-- собственная анимация

	local anim = UI:IsLetterTrading( letter ) and self.effectInfo.main.animTrading or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then	
		mainEffect:StartAnimation( anim )
	end	

end


--
function UI.Mail_LetterContentWnd:Reset()

	self.letter = nil

	self.msgWnd:Reset()

	self.attachmentsWnd:Clear()
	self.attachmentsWnd:UnlinkFromParent()

	self.getAttachmentsBtn:UnlinkFromParent()
	self.replyBtn:UnlinkFromParent()
	self.deleteBtn:UnlinkFromParent()
	self.destroyAttachmentsBtn:UnlinkFromParent()

	self:SetLayerVisible( false, self.layers.PRICE )
	self.priceMetaText:SetText( "", true )

end


--
function UI.Mail_LetterContentWnd:OnNickNameUpdate()

	self.msgWnd:OnNickNameUpdate()

end


--
function UI.Mail_LetterContentWnd:OnPlayerCredits()

	self:UpdatePrice()

end


-- ------------------------------
-- const
-- ------------------------------

UI.Mail_LetterContentWnd.layers =
{
	MAIN_EFFECT	= 0,
	PRICE		= 1,
}

UI.Mail_LetterContentWnd.effectInfo =
{
	main =
	{
		animIdle	= "idle",
		animTrading	= "idle_3",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Mail_LetterContentWnd.letter					= nil
UI.Mail_LetterContentWnd.msgWnd					= nil
UI.Mail_LetterContentWnd.attachmentsWnd			= nil
UI.Mail_LetterContentWnd.getAttachmentsBtn		= nil
UI.Mail_LetterContentWnd.replyBtn				= nil
UI.Mail_LetterContentWnd.deleteBtn				= nil
UI.Mail_LetterContentWnd.destroyAttachmentsBtn	= nil
UI.Mail_LetterContentWnd.priceMetaText			= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Mail_LetterContentWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

    self.msgWnd					= UI.Mail_LetterContent_MsgWnd
    self.attachmentsWnd			= UI.Mail_LetterContent_AttachmentsWnd
    self.getAttachmentsBtn		= UI.Mail_LetterContent_GetAttachmentsBtn
	self.replyBtn				= UI.Mail_LetterContent_ReplyBtn
	self.deleteBtn				= UI.Mail_LetterContent_DeleteBtn
	self.destroyAttachmentsBtn	= UI.Mail_LetterContent_DestroyAttachmentsBtn

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE ) 

	self:Reset()

end


--
function UI.Mail_LetterContentWnd:F_Shutdown()

	if self.preiceMetaTextthen then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Mail_LetterContentWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Mail_LetterContentWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Mail_LetterContentWnd:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.Mail_LetterContentWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Mail_LetterContentWnd:UpdatePrice()

	self:SetLayerVisible( false, self.layers.PRICE )
	self.priceMetaText:SetText( "", true )

	local letter = nil

	local selLetterId = UI.MailWnd:GetSelLetter()
	if selLetterId ~= UI.INVALID_U64_ID then
		letter = UI:GetLetterById( selLetterId )
	end

	if not letter or not UI:IsLetterTrading( letter ) then
		return
	end


	self:SetLayerVisible( true, self.layers.PRICE )

	local str = ""

	local price = 0
	if type( letter.goldCost ) == "number" then
		price = letter.goldCost
	else
    	sys.log( "UI.Mail_LetterContentWnd:UpdatePrice()[ERROR]: invalid type of field \"goldCost\" in letter letter %s; \"number\" or \"nil\" expected, got \"%s\"", _G.U64ToStr( letter.mailId ), type( letter.goldCost ) )
	end

	local priceInfo =
	{
        priceType 	= _G.GameStore.CreditsType.CT_GOLD,
        val			= price,
        bIsBuyPrice	= true,
        basePrice	= price,
	}
	local strPrice = UI:PriceInfo2Str( priceInfo, self:GetColor( self.layers.PRICE ), false, true, true, nil )

	str = string.format( "%s: %s", UI:GetStringByName( "mail_tradingPrice" ), strPrice )

	self.priceMetaText:SetText( str, true )	

end


-- ----------------------------------------------------------------------------
-- UI.Mail_LetterContent_MsgWnd
-- ----------------------------------------------------------------------------

UI.Mail_LetterContent_MsgWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Mail_LetterContent_MsgWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "Mail_LetterContent_MsgMaskWnd",
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
				defName 			= "mail_letterContent_msg",
				defaultAnimation	= "idle_1",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "content",	
						wnd			= "UI.Mail_LetterContent_MsgMaskWnd",
						animParams	= UI.EffectAnimParams.SIZE,

					},

					{
						objName		= "scroll",	
						wnd			= "UI.Mail_LetterContent_MsgScrollBar",
						animParams	= UI.EffectAnimParams.SIZE,

					},
				}
			}}
		},
	},

	children = { "UI.Mail_LetterContent_MsgMaskWnd", "UI.Mail_LetterContent_MsgScrollBar" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Mail_LetterContent_MsgWnd:Reset()

	self.letter = nil

	self:ResetHeaderMetaText()
	self.contentWnd.msgMetaText:SetText( "", true )

	self.contentWnd:SetHeight( 0 )

	self:UpdateScrollBar()

end


--
function UI.Mail_LetterContent_MsgWnd:Setup( letter, sizeMode )

	if type( letter ) ~= "table" then
		sys.log( "UI.Mail_LetterContent_MsgWnd:Setup()[ERROR]: invalid type of the 1-st param (\"letter\"); \"table\" expected, gor \"%s\"", type( letter ) )
		return
	end

	if UI:Val2Key( self.sizeModes, sizeMode ) == "" then
		sys.log( "UI.Mail_LetterContent_MsgWnd:Setup()[ERROR]: invalid 2-nd param (\"sizeMode\"); one of the \"UI.Mail_LetterContent_MsgWnd.sizeModes\" values expected, got \"%s\"", tostring( sizeMode ) )
		return
	end

	self:Reset()

	self.letter = letter
	self.sizeMode = sizeMode

	self:FullUpdate()

end


--
function UI.Mail_LetterContent_MsgWnd:OnNickNameUpdate()

	self:UpdateHeader()

end


-- ------------------------------
-- const
-- ------------------------------

UI.Mail_LetterContent_MsgWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.Mail_LetterContent_MsgWnd.effectInfo =
{
	main =
	{
		scrollBarLocator	= "scroll",
		animMax				= "idle_1",
		animMin				= "idle_2",
		animTrading			= "idle_3",
		maxSizeLocator		= "self",
		minSizeLocator		= "dist_min",
		tradingSizeLocator	= "dist_min_2",	
		maskLocator			= "content",
	},

	content =
	{
		msgLocator	= "text_4",
		sizeLocator	= "self",
	}
}

UI.Mail_LetterContent_MsgWnd.sizeModes =
{
	SMALL	= 1,
	LARGE	= 2,
	TRADING	= 3,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Mail_LetterContent_MsgWnd.contentWnd			= nil
UI.Mail_LetterContent_MsgWnd.maskWnd			= nil
UI.Mail_LetterContent_MsgWnd.scrollBar			= nil
UI.Mail_LetterContent_MsgWnd.space_msg_btm		= 0
UI.Mail_LetterContent_MsgWnd.maxHeight			= 0
UI.Mail_LetterContent_MsgWnd.minHeight			= 0
UI.Mail_LetterContent_MsgWnd.tradingHeight		= 0
UI.Mail_LetterContent_MsgWnd.space_mask_btm		= 0
UI.Mail_LetterContent_MsgWnd.space_scroll_btm	= 0
UI.Mail_LetterContent_MsgWnd.letter				= nil
UI.Mail_LetterContent_MsgWnd.sizeMode			= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Mail_LetterContent_MsgWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.contentWnd	= UI.Mail_LetterContent_MsgContentWnd
	self.maskWnd	= UI.Mail_LetterContent_MsgMaskWnd

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.Mail_LetterContent_MsgWnd:PrepareLayout()

	local contentEffect = UI:GetEffectFromLayer( self.contentWnd, self.contentWnd.layers.MAIN_EFFECT )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local maskEffect = UI:GetEffectFromLayer( self.maskWnd, self.maskWnd.layers.MAIN_EFFECT )

	if not mainEffect or not contentEffect or not maskEffect then
		return
	end

	local contentSize		= contentEffect:GetObjSize( self.effectInfo.content.sizeLocator )
	local msgPos			= contentEffect:GetObjPos( self.effectInfo.content.msgLocator )
	local msgSize			= contentEffect:GetObjSize( self.effectInfo.content.msgLocator )
	local maxSelfSize		= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
	local minSelfSize		= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )
	local tradingSelfSize	= mainEffect:GetObjSize( self.effectInfo.main.tradingSizeLocator )
	local maskPos			= mainEffect:GetObjPos( self.effectInfo.main.maskLocator )
	local maskSize			= maskEffect:GetObjSize( "self" )
	local scrollPos			= mainEffect:GetObjPos( self.effectInfo.main.scrollBarLocator )
	local scrollSize		= mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator )

	self.space_msg_btm		= contentSize.y - ( msgPos.y + msgSize.y )
	self.maxHeight			= maxSelfSize.y
	self.minHeight			= minSelfSize.y	
	self.tradingHeight		= tradingSelfSize.y
	self.space_mask_btm 	= maxSelfSize.y - ( maskPos.y + maskSize.y )
	self.space_scroll_btm	= maxSelfSize.y - ( scrollPos.y + scrollSize.y )

	self.contentWnd:SetLayerWidth( msgSize.x, self.contentWnd.layers.MSG )
	self.contentWnd:SetLayerHeight( 1000000, self.contentWnd.layers.MSG )
	self.contentWnd.msgMetaText:SetFormatRectSize( UI:Vec2( self.contentWnd:GetLayerWidth( self.contentWnd.layers.MSG ), self.contentWnd:GetLayerHeight( self.contentWnd.layers.MSG ) ), true )

	self.contentWnd:SetWidth( maskSize.x )
	self.maskWnd:SetWidth( maskSize.x )

	self:InitScrollBar()

end


--
function UI.Mail_LetterContent_MsgWnd:InitScrollBar()

	self.scrollBar = UI.Mail_LetterContent_MsgScrollBar

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )

	if scrollEffect then
    	local baseSize = scrollEffect:GetObjSize( "self" )
    	self.scrollBar:SetWidth( baseSize.x )
	end

	local hMsgFont = self.contentWnd:GetFont( self.contentWnd.layers.MSG )
	local msgFontSize = _G.GetFontLineHeight( hMsgFont )
    self.scrollBar:SetStepSize( msgFontSize )

	self.scrollBar:UnlinkFromParent()

end


--
function UI.Mail_LetterContent_MsgWnd:FullUpdate()

	if not self.letter then
		return
	end

	self:UpdateHeader()
	self:UpdateMsg()

	self:RecalcLayout()

end


--
function UI.Mail_LetterContent_MsgWnd:UpdateHeader()

	self:ResetHeaderMetaText()

	local linkTextParams =
	{
		maxWidth		= self.contentWnd.headerMetaText:GetFormatRectSize().x,
		hFont			= self.contentWnd.headerMetaText:GetFormatParams().hFont,
		color			= self.contentWnd.headerMetaText:GetColor(),
		blendMode		= self.contentWnd.headerMetaText:GetBlendMode(),
		backColor		= self.contentWnd.headerMetaText:GetBackColor(),
		hThemeLink		= self.contentWnd.themeLinkWnd:GetUiHandle(),
		hThemeLinkOwner	= self.contentWnd:GetUiHandle(),
	}

	local str = UI.MailWnd:GetLetterHeaderLocalized( self.letter, linkTextParams )
	self.contentWnd.headerMetaText:SetText( str, true )
	
end


--
function UI.Mail_LetterContent_MsgWnd:UpdateMsg()

	local str, bSysString = UI.MailWnd:GetLetterMsgLocalized( self.letter )

	if bSysString then
		self.contentWnd.msgMetaText:SetText( str, true )
	else
		self.contentWnd.msgMetaText:ResetFormat()
		self.contentWnd.msgMetaText.text_original	= str
		self.contentWnd.msgMetaText.text_formatted	= str
	end
	
end


--
function UI.Mail_LetterContent_MsgWnd:RecalcLayout()

	-- высота слоя сообщения

	local msgFormatRect = UI:Quat( 0, 0, self.contentWnd:GetLayerWidth( self.contentWnd.layers.MSG ), 1000000 )

    local msgHeight = _G.MeasureText(
   		self.contentWnd.msgMetaText:GetFormattedText(),
   		self.contentWnd:GetFont( self.contentWnd.layers.MSG ),
    	msgFormatRect,
   		self.contentWnd:GetTextFormatFlags( self.contentWnd.layers.MSG ),
    	msgFormatRect).w


	-- высота окна контента

	local msgTop = self.contentWnd:GetLayerTop( self.contentWnd.layers.MSG )	
	local contentHeight = msgTop + msgHeight + self.space_msg_btm

	self.contentWnd:SetHeight( contentHeight )


	-- собственная высота

	local selfHeight = 0
	if self.sizeMode == self.sizeModes.SMALL then
		selfHeight = self.minHeight
	elseif self.sizeMode == self.sizeModes.LARGE then
		selfHeight = self.maxHeight
	elseif self.sizeMode == self.sizeModes.TRADING then
		selfHeight = self.tradingHeight
	end

	self:SetHeight( selfHeight )	

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local anim = ""

    	if self.sizeMode == self.sizeModes.SMALL then
    		anim = self.effectInfo.main.animMin
    	elseif self.sizeMode == self.sizeModes.LARGE then
    		anim = self.effectInfo.main.animMax
    	elseif self.sizeMode == self.sizeModes.TRADING then
    		anim = self.effectInfo.main.animTrading
    	end

		mainEffect:StartAnimation( anim )

	end


	-- высота окна маски

	local maskTop = self.maskWnd:GetTop()
	local maskHeight = ( selfHeight - self.space_mask_btm ) - maskTop

	self.maskWnd:SetHeight( maskHeight )


	-- скроллбар

	self:UpdateScrollBar()

end


--
function UI.Mail_LetterContent_MsgWnd:UpdateScrollBar()

	local contentHeight = self.contentWnd:GetHeight()
	local maskHeight = self.maskWnd:GetHeight()

	-- видимость
	local bNeedScroll = contentHeight - maskHeight > 1e-3 
	local bIsScroll = self.scrollBar:IsChildOf( self )

	local mainffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if bNeedScroll then

		-- размер
    	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )

    	if mainEffect and scrollEffect then

			local needSize = ( self:GetHeight() - self.space_scroll_btm ) - self.scrollBar:GetTop()
        	local baseSize = scrollEffect:GetObjSize( "self" ).y

        	local scale_y = needSize / baseSize
        	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

        	self.scrollBar:SetHeight( needSize )

    	end

		-- пределы
		self.scrollBar:SetRange( 0, contentHeight - maskHeight )

		-- страница
    	self.scrollBar:SetPageSize( self.maskWnd:GetHeight() )

		if not bIsScroll then

			self:AddChild( self.scrollBar )

			if mainffect then
				mainffect:LinkWnd( self.scrollBar:GetUiHandle(), self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.POS )
			end

			self.scrollBar:SetPos( 0 )

		end

	else

		if bIsScroll then

    		self.scrollBar:SetRange( 0, 0 )
    		self.scrollBar:UnlinkFromParent()

    		if mainffect then
    			mainffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
    		end

		end
		
	end

end


--
function UI.Mail_LetterContent_MsgWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateContentPosFromScrollBar()

end


--
function UI.Mail_LetterContent_MsgWnd:UpdateContentPosFromScrollBar()

	local scrollPos = self.scrollBar:GetPos()
	local y = UI:YRel2Snapped( -scrollPos )

	self.contentWnd:SetTop( y )

end


--
function UI.Mail_LetterContent_MsgWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if w ~= self and not w:IsChildOf( self ) then
		return false
	end

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( self.scrollBar:GetPos() - self.scrollBar:GetStepSize() * ticks )
	end

	return true

end   


--
function UI.Mail_LetterContent_MsgWnd:ResetHeaderMetaText()

	self.contentWnd.headerMetaText:SetText( "", true )

	self.contentWnd.themeLinkWnd:Reset()
	self.contentWnd.themeLinkWnd:UnlinkFromParent()

end


-- --------------------------------------------------------------------------------
-- UI.Mail_LetterContent_MsgMaskWnd
-- --------------------------------------------------------------------------------

UI.Mail_LetterContent_MsgMaskWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Mail_LetterContent_MsgMaskWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "Mail_LetterContent_MsgMaskWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			visible		= false,

			effects =
			{{
				defName 			= "mail_letterContent_msgMask",
				defaultAnimation	= "idle_1",
			}}
		},
	},

	children = { "UI.Mail_LetterContent_MsgContentWnd" }
}

-- ------------------------------
-- const
-- ------------------------------

UI.Mail_LetterContent_MsgMaskWnd.layers =
{
	MAIN_EFFECT	= 0,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Mail_LetterContent_MsgMaskWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.Mail_LetterContent_MsgMaskWnd.parent		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Mail_LetterContent_MsgMaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.Mail_LetterContent_MsgMaskWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


--
function UI.Mail_LetterContent_MsgMaskWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.Mail_LetterContent_MsgMaskWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )

	self.parent = nil

end


-- ----------------------------------------------------------------------------
-- UI.Mail_LetterContent_MsgContentWnd
-- ----------------------------------------------------------------------------

UI.Mail_LetterContent_MsgContentWnd = {}

-- --------------------------
-- window definition
-- --------------------------

UI.Mail_LetterContent_MsgContentWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "Mail_LetterContent_MsgContentWnd",
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
				defName 			= "mail_letterContent_msgContent",
				defaultAnimation	= "idle_1",

				links =
				{
					{
						objName		= "text_1",	
						layer		= "UI.Mail_LetterContent_MsgContentWnd.layers.HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по размеру
					{
						objName		= "text_4",	
						layer		= "UI.Mail_LetterContent_MsgContentWnd.layers.MSG",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- HEADER
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- MSG
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 10, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- --------------------------
-- const
-- --------------------------

UI.Mail_LetterContent_MsgContentWnd.layers =
{
	MAIN_EFFECT	= 0,
	HEADER		= 1,
	MSG			= 2,
}

-- --------------------------
-- vars
-- --------------------------

UI.Mail_LetterContent_MsgContentWnd.msgMetaText 	= UI.MetaText.GetNewInstance()
UI.Mail_LetterContent_MsgContentWnd.headerMetaText	= UI.MetaText.GetNewInstance()
UI.Mail_LetterContent_MsgContentWnd.themeLinkWnd	= nil

-- --------------------------
-- work functions
-- --------------------------

--
function UI.Mail_LetterContent_MsgContentWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.msgMetaText:InitFromLayer( self, self.layers.MSG )
	self.headerMetaText:InitFromLayer( self, self.layers.HEADER )

	self:CreateControls()

end


--
function UI.Mail_LetterContent_MsgContentWnd:F_Shutdown()

	if self.msgMetaText then
		self.msgMetaText:Clear()
	end

	if self.headerMetaText then
		self.headerMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Mail_LetterContent_MsgContentWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.Mail_LetterContent_MsgContentWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Mail_LetterContent_MsgContentWnd:UpdateMetaTextPos()

	self.msgMetaText:UpdateScreenOrgFromLayer( self, self.layers.MSG )
	self.headerMetaText:UpdateScreenOrgFromLayer( self, self.layers.HEADER )

end


--
function UI.Mail_LetterContent_MsgContentWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MSG then
		self.msgMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.HEADER then
		self.headerMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.Mail_LetterContent_MsgContentWnd:CreateControls()

	self.themeLinkWnd = UI:CreateChildWnd( self, UI.LinkWnd, "" )

end


-- --------------------------------------------------------------------------------
-- UI.Mail_LetterContent_MsgScrollBar
-- --------------------------------------------------------------------------------

UI.Mail_LetterContent_MsgScrollBar =
{
	def =
	{
		className	= "ScrollWnd",
		prototype	= "EffectScrollWnd_Vrt",

		props =
		{
			name		= "Mail_LetterContent_MsgScrollBar",
    		scrollStyle = UI.SWS_VERTICAL + UI.SWS_THUMB_RESIZABLE + UI.SWS_ALLOW_DISABLE_BTNS,
		}	
	}
}

-- ----------------------------------------------------------------------------
-- UI.Mail_LetterContent_AttachmentsWnd
-- ----------------------------------------------------------------------------

UI.Mail_LetterContent_AttachmentsWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Mail_LetterContent_AttachmentsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "Mail_LetterContent_AttachmentsWnd",
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
				defName				= "mail_letterContent_attachments_main",
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

	children = { "UI.Mail_LetterContent_Attachments_LeftArrowBtn", "UI.Mail_LetterContent_Attachments_RightArrowBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Mail_LetterContent_AttachmentsWnd:Setup( letter )

	if type( letter ) ~= "table" then
		sys.log( "UI.Mail_LetterContent_AttachmentsWnd:Setup()[ERROR]: invalid type of the 1-st param (\"letter\"); \"table\" expected, gor \"%s\"", type( letter ) )
		return
	end

	self:Clear()

	self.letter = letter

	self:FullUpdate()

end


--
function UI.Mail_LetterContent_AttachmentsWnd:Clear()

	UI.ButtonsListWnd.Clear( self )

	self.letter = nil

end


-- ------------------------------
-- const
-- ------------------------------

UI.Mail_LetterContent_AttachmentsWnd.btnPrototypeName	= "MailAttachmentSlotWnd"

UI.Mail_LetterContent_AttachmentsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
		leftBtnLocator		= "btn_left",
		rightBtnLocator		= "btn_right",
	}
}

UI.Mail_LetterContent_AttachmentsWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.Mail_LetterContent_AttachmentsWnd.MAX_SLOTS = 5

-- ------------------------------
-- vars
-- ------------------------------

UI.Mail_LetterContent_AttachmentsWnd.leftBtn	= nil
UI.Mail_LetterContent_AttachmentsWnd.rightBtn	= nil
UI.Mail_LetterContent_AttachmentsWnd.letter		= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Mail_LetterContent_AttachmentsWnd:FullUpdate()

	local attachments = UI:GetLetterAttachments( self.letter )

	for recordIdx = 1, #attachments do

		local data = { attachment = attachments[ recordIdx ] }
		self:AddRecord( data )

	end

	self:RecalcLayout()

end


--
function UI.Mail_LetterContent_AttachmentsWnd:InitScrollBar()	

	self.leftBtn 	= UI.Mail_LetterContent_Attachments_LeftArrowBtn
	self.rightBtn	= UI.Mail_LetterContent_Attachments_RightArrowBtn

	self:UpdateArrowsVisibility()

end


--
function UI.Mail_LetterContent_AttachmentsWnd:UpdateScrollBarVisibility()	

	self:UpdateArrowsVisibility()

end


--
function UI.Mail_LetterContent_AttachmentsWnd:UpdateScrollBarPos()

	self:UpdateArrowsState()

end


--
function UI.Mail_LetterContent_AttachmentsWnd:UpdateArrowsVisibility()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local bNeedArrows = self.numRecords > self.numSlots

	if bNeedArrows then

		UI:AddChildAndLink( self, self.leftBtn, mainEffect, self.effectInfo.main.leftBtnLocator, UI.EffectAnimParams.POS )
		UI:AddChildAndLink( self, self.rightBtn, mainEffect, self.effectInfo.main.rightBtnLocator, UI.EffectAnimParams.POS )		

		self:UpdateArrowsState()

	else

		self.leftBtn:UnlinkFromParent()
		self.rightBtn:UnlinkFromParent()

		if mainEffect then
			mainEffect:UnlinkWnd( self.leftBtn:GetUiHandle(), "" )
			mainEffect:UnlinkWnd( self.rightBtn:GetUiHandle(), "" )
		end

	end

end


--
function UI.Mail_LetterContent_AttachmentsWnd:UpdateArrowsState()

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()

	self.leftBtn:Enable( firstVisibleRecordIdx > 1 )
	self.rightBtn:Enable( lastVisibleRecordIdx ~= -1 and lastVisibleRecordIdx < self:GetNumRecords() )

end


--
function UI.Mail_LetterContent_AttachmentsWnd:RecalcLayout()

	if self.numRecords >= self.numSlots or self.numRecords == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local firstLocatorX		= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ).x
	local secondLocatorX	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ).x
	local lastLocatorX		= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.MAX_SLOTS ) ).x
	local slotW				= self:GetButtonForRecord( 1 ):GetWidth()
	local areaX				= firstLocatorX
	local areaW				= ( lastLocatorX + slotW ) - firstLocatorX
	local spaceSlots		= secondLocatorX - firstLocatorX - slotW
	local slotsW			= self.numRecords * slotW + ( self.numRecords - 1 ) * spaceSlots
	local slotsX			= ( areaW - slotsW ) / 2 + areaX

	for recordIdx = 1, self.numRecords do

		local slotWnd = self:GetButtonForRecord( recordIdx )

		mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )

		local slotX = slotsX + ( recordIdx - 1 ) * ( slotW + spaceSlots )
		slotWnd:SetLeft( slotX )

	end

end


--
function UI.Mail_LetterContent_AttachmentsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if wnd == self.leftBtn then
		self:ScrollVisibleRange( false, 1 )
		UI:PlayGlobalSound( UI.MailWnd.sounds.attachmentsScroll )
		return true

	elseif wnd == self.rightBtn then
		self:ScrollVisibleRange( true, 1 )
		UI:PlayGlobalSound( UI.MailWnd.sounds.attachmentsScroll )
		return true
	end

	return false

end


--
function UI.Mail_LetterContent_AttachmentsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if w ~= self and not w:IsChildOf( self ) then
		return false
	end

	local oldFirstVisibleRecordIdx = self.firstVisibleRecordIdx
	self:ScrollVisibleRange( ticks < 0, math.abs( ticks ) )

	if oldFirstVisibleRecordIdx ~= self.firstVisibleRecordIdx then
		--#0029079, комм.(0093446)
--		UI:PlayGlobalSound( UI.MailWnd.sounds.attachmentsScroll )
	end

	return true

end   


-- --------------------------------------------------------------------------------
-- UI.Mail_LetterContent_Attachments_ArrowBtn
-- --------------------------------------------------------------------------------

UI.Mail_LetterContent_Attachments_ArrowBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "EffectButtonWnd",

    	props =
    	{
    		name		= "Mail_LetterContent_Attachments_ArrowBtn",
    		selectSound	= UI.sounds.btnMouseOver,
    		isPrototype	= true,
    	},
	},

    effectInfo =
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
    },
}

-- -----------------------------------------------------------------------------------------------
-- UI.Mail_LetterContent_Attachments_LeftArrowBtn, UI.Mail_LetterContent_Attachments_RightArrowBtn
-- -----------------------------------------------------------------------------------------------

--
UI.Mail_LetterContent_Attachments_LeftArrowBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Mail_LetterContent_Attachments_ArrowBtn",

    	props =
    	{
    		name		= "Mail_LetterContent_Attachments_LeftArrowBtn",
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
    				defName 			= "mail_letterContent_attachments_arrowLeft",
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
	},
}


--
UI.Mail_LetterContent_Attachments_RightArrowBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "Mail_LetterContent_Attachments_ArrowBtn",

    	props =
    	{
    		name		= "Mail_LetterContent_Attachments_RightArrowBtn",
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
    				defName 			= "mail_letterContent_attachments_arrowRight",
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
	},
}

-- ---------------------------------------------------------------------------------------------------------
-- UI.Mail_LetterContent_GetAttachmentsBtn, UI.Mail_LetterContent_ReplyBtn
-- ---------------------------------------------------------------------------------------------------------

--
UI.Mail_LetterContent_GetAttachmentsBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "Mail_LetterContent_GetAttachmentsBtn",
    	},
	},
}


--
UI.Mail_LetterContent_ReplyBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "Mail_LetterContent_ReplyBtn",
    	},
	},

	textId = "mail_btnReply",
}


-- ----------------------------------------------------------------------------
-- UI.Mail_LetterContent_DeleteBtn
-- ----------------------------------------------------------------------------

UI.Mail_LetterContent_DeleteBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "Mail_LetterContent_DeleteBtn",
    	},
	},

	textId = "mail_btnDelete",
}

-- ------------------------------------------------------------------------
-- UI.Mail_LetterContent_DestroyAttachmentsBtn
-- ------------------------------------------------------------------------

UI.Mail_LetterContent_DestroyAttachmentsBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name		= "Mail_LetterContent_DestroyAttachmentsBtn",
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
    				defName 			= "textBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					-- не линкуется по цвету, по цвету линкуется к другому локатору
    					{
    						objName		= "text",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
    					},

    					{
    						objName		= "text_color_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.COLOR,
    					},
    				}
    			}}
    		},
    	}
    }
}


-- -------------------------------------------------------------------
-- UI.Mail_BuyWnd
-- -------------------------------------------------------------------

UI.Mail_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "Mail_BuyWnd",
    	},
	},

	mainWndName = "MailWnd",
}