-- ----------------------------------------------------------------------------
--
-- Workfile: notifications.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

if UI.Notifications then
	return
else
	UI.Notifications = {}
end

sys.execscript( 'ui/scripts/public/notificationdefs.lua' )

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Notifications:AddNotification( notificationType, params )

	if UI:Val2Key( self.types, notificationType ) == "" then
		sys.log( "UI.Notifications:AddNotification()[ERROR]: invalid 1-st parameter (\"notificationType\"); one of the \"UI.Notifications.types\" expected, got \"%s\"", tostring( notificationType ) )
		return
	end

	if type( params ) ~= "table" then
		sys.log( "UI.Notifications:AddNotification()[ERROR]: invalid type of the 2-nd parameter (\"params\"); \"table\" expected, got \"%s\"", type( params ) )
		return
	end

	local notification =
	{
		type		= notificationType,
		params		= params,
		totalId		= -1,
		id			= -1,
	}

	local bCanAddImmediate = self:FixParams( notification )
	if not bCanAddImmediate then
		return
	end

	self:AddNotificationInternal( notification )

end


--
function UI.Notifications:GetNumNotifications()

	return self.allowedCount

end


--
function UI.Notifications:GetFirstNotificationId()

	return self.allowedFirstId

end


--
function UI.Notifications:GetLastNotificationId()

	if self.allowedCount == 0 then
		return -1
	end

	return self.allowedFirstId + self.allowedCount - 1

end



--
function UI.Notifications:GetNotification( id )

	return self.allowedNotifications[ id ]

end


--
function UI.Notifications:GetNumNotificationsTotal()

	return self.totalCount

end


--
function UI.Notifications:GetFirstNotificationIdTotal()

	return self.totalFirstId

end


--
function UI.Notifications:GetLastNotificationIdTotal()

	if self.totalCount == 0 then
		return -1
	end

	return self.totalFirstId + self.totalCount - 1

end 


--
function UI.Notifications:GetNotificationTotal( id )

	return self.totalNotifications[ id ]

end 


--
function UI.Notifications:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Clear()

end


--
function UI.Notifications:MasterServer_OnNotification( serverNotificationId, params )

	if serverNotificationId == _G.MasterServer.ServerNotification.SN_SQUAD_NOTIFICATION then

		if _G.GetCurrentGameMode() ~= ai.Gameplay.NONE then
			return
		end

		local notificationType = -1

		if params.sqn_type == _G.MasterServer.SquadNotification.SQN_JOINED then

			if params.uid then
				if params.uid == _G.MasterServer_GetLocalUserId() then
					notificationType = self.types.SQUAD_LOCAL_PLAYER_JOINED
				else
					notificationType = self.types.SQUAD_REMOTE_PLAYER_JOINED
				end
			else
				sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: cannot find \"uid\" in notification %s, sqn_type %s", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), UI:Val2Key( _G.MasterServer.SquadNotification, params.sqn_type ) )
			end

		elseif params.sqn_type == _G.MasterServer.SquadNotification.SQN_LEFT then

			if params.uid then
				if params.uid == _G.MasterServer_GetLocalUserId() then
					notificationType = self.types.SQUAD_LOCAL_PLAYER_LEFT
				else
					notificationType = self.types.SQUAD_REMOTE_PLAYER_LEFT
				end
			else
				sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: cannot find \"uid\" in notification %s", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ) )
			end

		elseif params.sqn_type == _G.MasterServer.SquadNotification.SQN_KICKED then

			if params.kickeeUid then
				if params.kickeeUid == _G.MasterServer_GetLocalUserId() then
					notificationType = self.types.SQUAD_LOCAL_PLAYER_KICKED
				else
					notificationType = self.types.SQUAD_REMOTE_PLAYER_KICKED
				end
			else
				sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: cannot find \"kickeeUid\" in notification %s", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ) )
			end

			params.uid = params.kickeeUid

		elseif params.sqn_type == _G.MasterServer.SquadNotification.SQN_MM_ALL_LEFT then

			if params.reason == _G.MasterServer.MMLeaveReason.MMLR_AUTO_WIN then
				notificationType = self.types.SQUAD_AUTOWIN
			end

		end


    	if notificationType ~= -1 then
	    	self:AddNotification( notificationType, params )
		end


	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_SOCIAL_NOTIFICATION then

		if params.result == nil or params.result == _G.MasterServer.SocialOpResult.SOC_RES_OK then

    		local notificationType = -1

    		if params.soc_type == _G.MasterServer.SocialNotification.SOC_NOTIFICATION_ADD_FRIEND then
    			notificationType = self.types.SOCIAL_ADD_FRIEND

    		elseif params.soc_type == _G.MasterServer.SocialNotification.SOC_NOTIFICATION_DELETE_FRIEND then
    			notificationType = self.types.SOCIAL_DELETE_FRIEND
    		end

        	if notificationType ~= -1 then
    	    	self:AddNotification( notificationType, params )
    		end

		end


	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_RACE_RANK then

		local notificationType = self.types.RACE_RANK

		if params.race and params.reputation and params.oldReputation then

			local oldReputation = params.oldReputation[ params.race ] 
			if oldReputation then

				local newRank = UI:Reputation2Rank( params.reputation )
				local oldRank = UI:Reputation2Rank( oldReputation )

				local numParts = newRank - oldRank

				if numParts == 1 then

    				local partParams = UI:CopyTable2( params )

					partParams.reward = {}

					local partIdx = 1
					if type( partParams.rewards ) == "table" then

						local reward = partParams.rewards[ tostring( newRank ) ]
						if type( reward ) == "table" then
							partParams.reward = reward
						else
							sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of \"rewards[\"%d\"]\" in notification SN_RACE_RANK; \"table\" expected, got \"%s\"", partIdx, type( partParams.rewards ) )
						end

					else
						sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of \"rewards\" in notification SN_RACE_RANK; \"table\" expected, got \"%s\"", type( partParams.rewards ) )
					end

					partParams.rewards = nil

			    	self:AddNotification( notificationType, partParams )

				else

    				for partIdx = 1, numParts do

    					local partParams = UI:CopyTable2( params )

    					local partOldRank = oldRank + partIdx - 1
    					local partNewRank = partOldRank + 1

    					partParams.reputation					= partIdx == numParts and params.reputation or UI:Rank2Reputation( partNewRank )
    					partParams.oldReputation[ params.race ]	= partIdx == 1 and oldReputation or UI:Rank2Reputation( partOldRank )
						partParams.rank							= partNewRank

						partParams.reward = {}

						if type( partParams.rewards ) == "table" then

							local reward = partParams.rewards[ tostring( partNewRank ) ]
							if type( reward ) == "table" then
								partParams.reward = reward
							else
								sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of \"rewards[\"%d\"]\" in notification SN_RACE_RANK; \"table\" expected, got \"%s\"", partIdx, type( reward ) )
							end

						else
							sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of \"rewards\" in notification SN_RACE_RANK; \"table\" expected, got \"%s\"", type( partParams.rewards ) )
						end

						partParams.rewards = nil
					
				    	self:AddNotification( notificationType, partParams )

    				end

				end
				
			else
				sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: cannot find old reputation" )
			end

		else
			sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid params format" )
		end

	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_VESSEL_CUSTOM_ELEMENTS_NEW_FREE then

		local MAX_ITEMS = 20

		if type( params.defNames ) == "table" then

    		-- не гарантировано, что это будет нормальный массив c индексами [1],[2], возмжоно там будут индексы ["0"],["1"]; так что переводится в правильный массив
    		local defNames = {}		

    		for key, defName in pairs( params.defNames ) do
    			table.insert( defNames, defName )
    		end

			local function fnSort( defName1, defName2 )

				local customizationType1 = UI:GetCustomizationTypeByName( defName1 )
				local customizationType2 = UI:GetCustomizationTypeByName( defName2 )

				if customizationType1 < customizationType2 then
					return true

				elseif customizationType1 > customizationType2 then
					return false

				else
					return defName1 < defName2
				end

			end

    		table.sort( defNames, fnSort )

			local numItems			= #defNames

			local numParts			= 1
			local estimPartNumItems = 0

			if numItems > 0 then
    			numParts			= math.ceil( numItems / MAX_ITEMS )
    			estimPartNumItems	= UI:Round( numItems / numParts )
    			numParts			= math.ceil( numItems / estimPartNumItems )
			else
				sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: empty table \"defNames\" in notification \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ) )
			end

			for partIdx = 1, numParts do

				local partNumItems		= estimPartNumItems
				local handledNumItems	= ( partIdx - 1 ) * estimPartNumItems

				if partIdx == numParts then
					partNumItems = numItems - handledNumItems
				end

				local partDefNames = {}

				local partFirstItemIdx = handledNumItems + 1
				for itemIdx = partFirstItemIdx, partFirstItemIdx + partNumItems - 1 do
					table.insert( partDefNames, defNames[ itemIdx ] )					
				end

				local partParams = 
				{
					defNames = partDefNames
				}

	    		self:AddNotification( UI.Notifications.types.VESSEL_CUSTOM_ELEMENTS_NEW_FREE, partParams )

			end

		else
			sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of param \"defNames\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( params.defNames ) )
		end	

	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_TEACHING_NOTIFICATION then

		if type( params.command ) == "number" then

			local notificationType = -1

    		if params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_ADD_TEACHER then
				notificationType = self.types.TEACH_ADD_TEACHER

    		elseif params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_DELETE_TEACHER then
				notificationType = self.types.TEACH_DELETE_TEACHER

    		elseif params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_ADD_STUDENT then
				notificationType = self.types.TEACH_ADD_STUDENT

    		elseif params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_DELETE_STUDENT then
				notificationType = self.types.TEACH_DELETE_STUDENT

    		elseif params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_EXP_REWARD then
				notificationType = self.types.TEACH_EXP_REWARD

    		elseif params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_BACAME_TEACHER then
				notificationType = self.types.TEACH_BACAME_TEACHER

    		elseif params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_NO_LONGER_STUDENT then
				notificationType = self.types.TEACH_NO_LONGER_STUDENT

    		elseif params.command == _G.MasterServer.TeachingNotifiction.TEACH_NOTIFICATION_STUDENT_GROWS_UP then
				notificationType = self.types.TEACH_STUDENT_GROWS_UP
			end

        	if notificationType ~= -1 then
    	    	self:AddNotification( notificationType, params )
    		end

		else
			sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of param \"command\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( params.command ) )
		end

	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_TALENT_NOTIFICATION then

		if type( params.type ) == "number" then

			local notificationType = -1

    		if params.type == _G.SkillManager.TalentNotification.TN_BOUGHT_TALENT_SET then
				notificationType = self.types.TALENT_BUY_SET
			end

        	if notificationType ~= -1 then
    	    	self:AddNotification( notificationType, params )
    		end

		else
			sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of param \"type\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( params.type ) )
		end

	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_SHIP_QUEST_ENDED then

		if type( params.completed ) == "number" then

			local notificationType = params.completed ~= 0 and self.types.SHIP_QUEST_COMPLETED or self.types.SHIP_QUEST_ABORTED
    	    self:AddNotification( notificationType, params )

		else
			sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of param \"completed\" in notification \"%s\"; \"number\" expected, got \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( params.completed ) )
		end

	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_LETTER_EXPIRED then

		if type( params.receiver ) == "userdata" then

    		if params.receiver ~= UI:GetLocalPlayerUid() then

    			local name = UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId )
    			local notificationType = self.types[ name ] or -1

    			self:AddNotification( notificationType, params )

    		end

		else
			sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of param \"receiver\" in notification \"%s\"; \"userdata\" expected, got \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( params.receiver ) )
		end

	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_MOTD then

    	local name = UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId )
    	local notificationType = self.types[ name ] or -1

		if params.important ~= nil then

			if type( params.important ) == "number" then

				if params.important ~= 0 then
					notificationType = self.types.MOTD_IMPORTANT	-- отдельный тип нотификации нужен, чтобы поместить в другую группу в опциях
				end

			else
				sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of param \"important\" in notification \"%s\"; \"number\" or \"nil\" expected, got \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( params.important ) )
			end

		end

    	self:AddNotification( notificationType, params )
		
	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_ITEM_CONVERTED then
		
		if type( params.items ) == "table" then
		
			if next( params.items ) then
			
				local bValid = true
				for itemIdx, itemInfo in pairs( params.items ) do
					if type( itemIdx ) ~= "number" or type( itemInfo ) ~= "table" then
						sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid format of \"items\" table in notification \"%s\"; <number>=<table> expected, got <%s>=<%s>", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( itemIdx ), type( itemInfo ) )
						bValid = false
						break
					end
					
				end
				
				if bValid then
					for itemIdx, itemInfo in ipairs( params.items ) do
						self:AddNotification( UI.Notifications.types.ITEM_CONVERTED, itemInfo )
					end
				end
			
			else
				sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: empty \"items\" table in notification \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ) )
			end
		
		else
			sys.log( "UI.Notifications:MasterServer_OnNotification()[ERROR]: invalid type of param \"items\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId ), type( params.items ) )
		end
	
	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_BONUS_BUNDLE then
	
		local bundleDefName = _G.GameStore_GetBonusBundleDef()
		local bShow = UI:NeedShowNotificationForBundle( bundleDefName )	--#0107019(0507181)
		
		if bShow then
		
			local name = UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId )
			local notificationType = self.types[ name ] or -1

			if notificationType ~= -1 then
				self:AddNotification( notificationType, params )
			end
			
		end
		
	elseif serverNotificationId == _G.MasterServer.ServerNotification.SN_ITEM_PURCHASED then
	
		local bShow = true
	
		if type( params.defName ) == "string" then
		
			if UI:IsDefBundle( params.defName ) then
				bShow = UI:NeedShowNotificationForBundle( params.defName )	--#0107019(0507181)
				
			elseif UI:IsDefBlueprint( params.defName ) then
				bShow = false	--#0107019(0508095)
			end
			
		end
		
		if bShow then
		
			local name = UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId )
			local notificationType = self.types[ name ] or -1

			if notificationType ~= -1 then
				self:AddNotification( notificationType, params )
			end
			
		end
	
	else

		local name = UI:Val2Key( _G.MasterServer.ServerNotification, serverNotificationId )
		local notificationType = self.types[ name ] or -1

    	if notificationType ~= -1 then
	    	self:AddNotification( notificationType, params )
		end

	end

end


--
function UI.Notifications:IsGroupAllowed( group )

	if UI:Val2Key( self.groups, group ) == "" then
		sys.log( "UI.Notifications:IsGroupAllowed()[ERROR]: invalid 1-st param (\"group\"); one of the \"UI.Notifications.groups\" values expected, got %s", tostring( group ) )
		return self.ALLOWED_DEFAULT
	end

	local groupInfo = self.groupsInfo[ group ]
	if not groupInfo then
		sys.log( "UI.Notifications:IsGroupAllowed( group )[ERROR]; cannot UI.Notifications.groupsInfo[%s]", UI:Val2Key( self.groups, group ) )
		return self.ALLOWED_DEFAULT
	end

	if groupInfo.bShowInOptions then

    	local profile = _G.GetProfileTable()

    	local bAllowed = profile.notifications and profile.notifications[ group ]
    	if bAllowed ~= nil then
    		return bAllowed
    	end

	end

	if groupInfo.bAllowedDefault == nil then
		sys.log( "UI.Notifications:IsGroupAllowed( group )[ERROR]; cannot UI.Notifications.groupsInfo[%s].bAllowedDefault", UI:Val2Key( self.groups, group ) )
		return self.ALLOWED_DEFAULT
	end	

	return groupInfo.bAllowedDefault

end


--
function UI.Notifications:SetGroupAllowed( group, bAllowed, bUpdateImmediate )

	if UI:Val2Key( self.groups, group ) == "" then
		sys.log( "UI.Notifications:SetGroupAllowed()[ERROR]: invalid 1-st param (\"group\"); one of the \"UI.Notifications.groups\" values expected, got %s", tostring( group ) )
		return
	end

	if type( bAllowed ) ~= "boolean" then
		sys.log( "UI.Notifications:SetGroupAllowed()[ERROR]: invalid type of the 2-nd param (\"bAllowed\"); \"boolean\" expected, got \"%s\"", type( bAllowed ) )
		return		
	end

	if type( bUpdateImmediate ) ~= "boolean" then
		sys.log( "UI.Notifications:SetGroupAllowed()[ERROR]: invalid type of the 3-rd param (\"bUpdateImmediate\"); \"boolean\" expected, got \"%s\"", type( bUpdateImmediate ) )
		bUpdateImmediate = true
	end

	local profile = _G.GetProfileTable()

	if not profile.notifications then
		profile.notifications = {}
	end

	profile.notifications[ group ] = bAllowed

	if bUpdateImmediate then
		self:UpdateAllowedNotifications( false )
	else
		self.bAllowedDirty = true
	end

end


--
function UI.Notifications:UpdateAllowedNotifications( bForce )

	if not bForce and not self.bAllowedDirty then
		return true
	end

	self.allowedNotifications	= {}
	self.allowedFirstId			= -1
	self.allowedCount			= 0

	local allowedStatesByType = self:GetAllowedStatesByType()

	for id = self.totalFirstId, self.totalFirstId + self.totalCount - 1 do

		local notification = self.totalNotifications[ id ]

		local bAllowed = allowedStatesByType[ notification.type ]
		if bAllowed == nil then
			bAllowed = self.ALLOWED_DEFAULT
		end

		if bAllowed then
			self:PushNotifiationAllowed( notification )
		else
			notification.id = -1
		end

	end

	self.bAllowedDirty = false

	UI:SendUiEvent( UI.EV_NOTIFICATIONS_ALLOWED_CHANGED, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.Notifications:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	self:StopPendingNickName( result == 0, uid, nickName )

end


-- ------------------------------
-- const
-- ------------------------------

UI.Notifications.MAX_COUNT = 1000

UI.Notifications.ALLOWED_DEFAULT = true

UI.Notifications.NUM_ADVERT_STRINGS = 5

-- ------------------------------
-- vars
-- ------------------------------

UI.Notifications.totalNotifications		= {}
UI.Notifications.totalFirstId			= -1
UI.Notifications.totalCount				= 0
UI.Notifications.allowedNotifications	= {}
UI.Notifications.allowedFirstId			= -1
UI.Notifications.allowedCount			= 0
UI.Notifications.pendingNotifications	= {}
UI.Notifications.bAllowedDirty			= false
UI.Notifications.lastAdvertStringIdx	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Notifications:AddNotificationInternal( notification )

	self:PushNotifiationTotal( notification )
	UI:SendUiEvent( UI.EV_NOTIFICATIONS_ADD_TOTAL, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

	if self:IsTypeAllowed( notification.type ) then
		self:PushNotifiationAllowed( notification )
		UI:SendUiEvent( UI.EV_NOTIFICATIONS_ADD, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )
	end

end


--
function UI.Notifications:PushNotifiationTotal( notification )

	if self.totalCount == 0 then

		self.totalCount = 1
		self.totalFirstId = 1

	else

		if self.totalCount < self.MAX_COUNT then
			self.totalCount = self.totalCount + 1
		else
			self.totalNotifications[ self.totalFirstId ] = nil
			self.totalFirstId = self.totalFirstId + 1
		end

	end

	local id = self.totalFirstId + self.totalCount - 1

	self.totalNotifications[ id ] = notification
	notification.totalId = id

end


--
function UI.Notifications:PushNotifiationAllowed( notification )

	if self.allowedCount == 0 then

		self.allowedCount = 1
		self.allowedFirstId = 1

	else

		if self.allowedCount < self.MAX_COUNT then
			self.allowedCount = self.allowedCount + 1
		else
			self.allowedNotifications[ self.allowedFirstId ] = nil
			self.allowedFirstId = self.allowedFirstId + 1
		end

	end

	local id = self.allowedFirstId + self.allowedCount - 1

	self.allowedNotifications[ id ] = notification
	notification.id = id

end


--
function UI.Notifications:IsTypeAllowed( notificationType )

	local info = self.notificationsInfo[ notificationType ]
	if not info then
		sys.log( "UI.Notifications:IsTypeAllowed()[ERROR]: cannot find \"UI.Notifications.notificationsInfo.%s\"", UI:Val2Key( self.types, notificationType ) )
		return self.ALLOWED_DEFAULT
	end

	local group = info.group
	if not group then
		sys.log( "UI.Notifications:IsTypeAllowed()[ERROR]: cannot find \"UI.Notifications.notificationsInfo.%s.group\"", UI:Val2Key( self.types, notificationType ) )
		return self.ALLOWED_DEFAULT
	end

	return self:IsGroupAllowed( group )

end


--
function UI.Notifications:GetAllowedStatesByType()

	local states = {}

	for typeName, typeId in pairs( self.types ) do
		states[ typeId ] = self:IsTypeAllowed( typeId )
	end

	return states

end


--
function UI.Notifications:Clear()

	self.totalNotifications		= {}
	self.totalFirstId			= -1
	self.totalCount				= 0
	self.allowedNotifications	= {}
	self.allowedFirstId			= -1
	self.allowedCount			= 0
	self.pendingNotifications	= {}
	self.bAllowedDirty			= false

	UI:SendUiEvent( UI.EV_NOTIFICATIONS_CLEAR, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.Notifications:FixParams( notification )

	local bCanAddImmediate = true

	-- т.к. модуль может быть впоследствии продан, то iid перестанет быть валидным, поэтому запоминается defName или rollData (для автогена)
	if notification.params.iid then

		if not UI:IsStrEmpty( notification.params.defName ) then

			if notification.params.itemType then
				notification.params.itemDefName = notification.params.defName
			else
				sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find \"itemType\" param in notification %s", UI:Val2Key( self.types, notification.type ) )
			end

		end
		
		local inventoryItem, bAutogen = UI:GetInventoryItemEx( notification.params.iid )
		if inventoryItem then
		
			if bAutogen then
			
				notification.params.rollData = inventoryItem.rollData
				notification.params.upgradeLevel = inventoryItem.upgradeLevel
				
			else
			
				if not notification.params.itemDefName then
					notification.params.itemDefName = inventoryItem.defName
					notification.params.itemType = _G.GetStoreItemTypeByDef( inventoryItem.defName )
				end
				
			end
			
		else
			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find inventory item for notification %s", UI:Val2Key( self.types, notification.type ) )
		end

	end

	-- т.к. корабль может быть впоследствии продан, то vid перестанет быть валидным, поэтому запоминается defName
	if notification.params.vid then

		if not UI:IsStrEmpty( notification.params.defName ) and UI:IsDefShip( notification.params.defName ) then

			notification.params.shipDefName = notification.params.defName

		else

    		local shipItem = UI:GetShipItem( notification.params.vid )
    		if shipItem then
    			notification.params.shipDefName = shipItem.defName
    		else
    			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find ship item for notification %s", UI:Val2Key( self.types, notification.type ) )
    		end

		end

	end

	-- т.к. корабль может быть впоследствии продан, то vid перестанет быть валидным, поэтому запоминается defName
	if notification.params.vids then

		notification.params.shipDefNames = {}

		for idx = 1, #notification.params.vids do

    		local shipItem = UI:GetShipItem( notification.params.vids[ idx ] )
    		if shipItem then
    			table.insert( notification.params.shipDefNames, shipItem.defName )
    		else
    			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find ship item for notification %s", UI:Val2Key( self.types, notification.type ) )
    			table.insert( notification.params.shipDefNames, "" )
    		end

		end

	end

	if notification.params.uid then

		if type( notification.params.uid ) == "userdata" then

			if notification.params.uid ~= UI.INVALID_U64_ID then

        		if not self:CheckGetNickName( notification, "uid" ) then
        			bCanAddImmediate = false
        		end

			end

		else
			sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of field \"uid\" in notification %s; \"userdata\" expected, got \"%s\"", UI:Val2Key( self.types, notification.type ), type( notification.params.uid ) )
		end

	end


	if notification.type == self.types.SN_BATTLE_SLOT_VESSEL_INSTALLED then

		if notification.params.vid then
			notification.params.bBroken = _G.GameStore_GetVesselHullCondition( notification.params.vid ) == 0
		else
			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find vid in notification \"%s\"", UI:Val2Key( self.types, notification.type ) )
		end


	elseif notification.type == self.types.SN_GAME_REWARDED or notification.type == self.types.SN_GAME_REWARDED_PREMIUM then

		if type( notification.params.vessels ) == "table" then

			for idx, shipInfo in pairs( notification.params.vessels ) do

				if type( shipInfo ) == "table" then

    				if type( shipInfo.vid ) == "userdata" then

    					shipInfo.defName = ""

        				if shipInfo.vid ~= UI.INVALID_U64_ID then

            				local shipItem = UI:GetShipItem( shipInfo.vid )
            				if shipItem then
    							shipInfo.defName = shipItem.defName
            				else
            					sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find ship item with vid %s for notification \"%s\"", _G.U64ToStr( shipInfo.vid ), UI:Val2Key( self.types, notification.type ) )
            				end

        				end

    				else
    					sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of field \"vessels[%s].vid\" in notification \"%s\"; \"userdata\" expected, got \"%s\"", tostring( idx ), UI:Val2Key( self.types, notification.type ), type( notification.params.vessels ) )
    				end

				else
    				sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of field \"vessels[%s]\" in notification \"%s\"; \"table\" expected, got \"%s\"", tostring( idx ), UI:Val2Key( self.types, notification.type ), type( shipInfo ) )
				end

			end			

		else
			sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of field \"vessels\" in notification \"%s\"; \"table\" expected, got \"%s\"", UI:Val2Key( self.types, notification.type ), type( notification.params.vessels ) )
		end


	elseif notification.type == self.types.RACE_RANK then

		local race = notification.params.race
		if not race then
			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find \"race\" in notification \"%s\"", UI:Val2Key( self.types, notification.type ) )
			race = 0
		end

		local newReputation = notification.params.reputation
		if not newReputation then
			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find \"reputation\" in notification \"%s\"", UI:Val2Key( self.types, notification.type ) )
			newReputation = 0
		end

		local oldReputations = notification.params.oldReputation
		if not oldReputations then
			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find \"oldReputation\" in notification \"%s\"", UI:Val2Key( self.types, notification.type ) )
			oldReputations = {}
		end

		notification.params.unlocks = UI:GetUnlocksForNewRaceRank( race, newReputation, oldReputations )


	elseif notification.type == self.types.SQUAD_REMOTE_PLAYER_LEFT then

    	if notification.params.newLeader then
    		if not self:CheckGetNickName( notification, "newLeader" ) then
    			bCanAddImmediate = false
    		end
    	end


	elseif notification.type == self.types.SN_ITEM_ADVERT then

		notification.params.stringIdx = self.lastAdvertStringIdx

		for attempt = 1, 5 do

			local stringIdx = math.random( 1, self.NUM_ADVERT_STRINGS )

			if stringIdx ~= self.lastAdvertStringIdx then
				notification.params.stringIdx = stringIdx
				break
			end

		end

		self.lastAdvertStringIdx = notification.params.stringIdx


	elseif notification.type == UI.Notifications.types.SN_VESSEL_CUSTOM_ELEMENTS_EXPIRED then

		for idx, shipInfo in pairs( notification.params ) do

			if type( shipInfo ) == "table" then
				if type( shipInfo.vid ) == "userdata" then

            		local shipItem = UI:GetShipItem( shipInfo.vid )
            		if shipItem then
						shipInfo.shipDefName = shipItem.defName
            		else
            			sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find ship item for notification %s", UI:Val2Key( self.types, notification.type ) )
            		end

				else
					sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of params[%s].vid for notification %s; \"table\" expected, got \"%s\"", tostring( idx ), UI:Val2Key( self.types, notification.type ), type( shipInfo.vid ) )
				end
			else
				sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of params[%s] for notification %s; \"table\" expected, got \"%s\"", tostring( idx ), UI:Val2Key( self.types, notification.type ), type( shipInfo ) )
			end

		end


	elseif notification.type == UI.Notifications.types.SN_VESSEL_LEVELUP then

		notification.params.unlockedShips = {}

    	if type( notification.params.shipDefName ) == "string" then

    		if type( notification.params.lvl ) == "number" then
				notification.params.unlockedShips = UI:GetUnlockedShipsOnShipLevelUp( notification.params.shipDefName, notification.params.lvl )
    		else
    			sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of \"lvl\" param in notification SN_VESSEL_LEVELUP; \"number\" expected, got \"%s\"", type( notification.params.lvl ) )
    		end

    	else
    		sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of \"shipDefName\" param in notification SN_VESSEL_LEVELUP; \"string\" expected, got \"%s\"", type( notification.params.shipDefName ) )
    	end


	elseif notification.type == UI.Notifications.types.SN_MODULE_UNEQUIPPED_MULTI then

    	if type( notification.params.modules ) == "table" then	

			for idx, moduleInfo in pairs( notification.params.modules ) do

				if type( moduleInfo ) == "table" then

					if type( moduleInfo.iid ) == "userdata" then

						moduleInfo.defName = ""
						
						local inventoryItem, bAutogen = UI:GetInventoryItemEx( moduleInfo.iid )
						if inventoryItem then
						
							if bAutogen then
								moduleInfo.rollData = inventoryItem.rollData
								moduleInfo.upgradeLevel = inventoryItem.upgradeLevel
							else
								moduleInfo.defName = inventoryItem.defName
							end
							
						else
							sys.log( "UI.Notifications:FixParams()[ERROR]: cannot find inventory item with iid %s for notification SN_MODULE_UNEQUIPPED_MULTI", _G.U64ToStr( moduleInfo.iid ) )
						end

					else
						sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of the field \"modules[%d].iid\" in notification SN_MODULE_UNEQUIPPED_MULTI; \"userdata\" expected, got \"%s\"", idx, type( moduleInfo.iid ) )
					end	

				else
					sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of the field \"modules[%d]\" in notification SN_MODULE_UNEQUIPPED_MULTI; \"table\" expected, got \"%s\"", idx, type( moduleInfo ) )
				end

			end

		else
			sys.log( "UI.Notifications:FixParams()[ERROR]: invalid type of the field \"modules\" in notification SN_MODULE_UNEQUIPPED_MULTI; \"table\" expected, got \"%s\"", type( notification.params.modules ) )
		end


	elseif notification.type == self.types.SN_LETTER_PAYMENT or notification.type == self.types.SN_LETTER_REJECTED or notification.type == self.types.SN_LETTER_EXPIRED then

    	if notification.params.receiver then
    		if not self:CheckGetNickName( notification, "receiver" ) then
    			bCanAddImmediate = false
    		end
    	end
		
	elseif notification.type == self.types.SN_LETTER_GOODS then

		if notification.params.sender then
			if not self:CheckGetNickName( notification, "sender" ) then
				bCanAddImmediate = false
			end
		end

	end

	return bCanAddImmediate

end


--
function UI.Notifications:CheckGetNickName( notification, paramName )

	local bCanAddImmediate = self:FillNickNameInternal( notification, paramName )

	if not bCanAddImmediate then

		if not notification.pendingInfo then
			notification.pendingInfo = {}
		end

		local pendingUids = notification.pendingInfo.uids
		if not pendingUids then
			pendingUids = {}
			notification.pendingInfo.uids = pendingUids
		end

		notification.pendingInfo.uids[ paramName ] = true

		self:AddPending( notification )

	end

	return bCanAddImmediate

end


--
function UI.Notifications:FillNickNameInternal( notification, paramName )

	local uid = notification.params[ paramName ]

	local nickParamName = self:GetNickParamName( paramName )
	notification.params[ nickParamName ] = UI:GetNickNamePlaceHolder( uid )

	local nickName, bCached, requestId = _G.MasterServer_GetNickName( uid )

	if bCached then
		notification.params[ nickParamName ] = nickName
		return true
	else

		-- нет имени и не предвидится, показывается дефолтное
		if requestId == 0 then
			sys.log( "UI.Notifications:FillNickNameInternal()[ERROR]: cannot get nickname for uid %s", _G.U64ToStr( uid ) )
			return true

		-- сейчас нет имени, но был послан запрос
		else
			return false
		end

	end

end


--
function UI.Notifications:GetNickParamName( uidParamName )

	return string.format( "%s_nickName", uidParamName )

end


--
function UI.Notifications:AddPending( notification )

	if not notification.pendingInfo then
		sys.log( "UI.Notifications:AddPending()[ERROR]: no pendingInfo for notification %s", UI:Val2Key( self.types, notification.type ) )
		return
	end

	for idx, ntf in pairs( self.pendingNotifications ) do
		if ntf == notification then
			return
		end
	end

	table.insert( self.pendingNotifications, notification )	

end


--
function UI.Notifications:RemovePending( notification )

	for idx, ntf in pairs( self.pendingNotifications ) do
		if ntf == notification then
			notification.pendingInfo = nil
			table.remove( self.pendingNotifications, idx )
			return
		end
	end	

end


--
function UI.Notifications:StopPendingNickName( bSuccess, uid, nickName )

	for idx, notification in pairs( self.pendingNotifications ) do

    	if notification.pendingInfo and notification.pendingInfo.uids then

        	for paramName in pairs( notification.pendingInfo.uids ) do

				local pendingUid = notification.params[ paramName ]
        		if pendingUid and pendingUid == uid then

        			if bSuccess then
        				local nickParamName = self:GetNickParamName( paramName )
        				notification.params[ nickParamName ] = nickName
        			end

        			notification.pendingInfo.uids[ paramName ] = nil			
        			
        		end

        	end	

			if not next( notification.pendingInfo.uids ) then
				notification.pendingInfo.uids = nil	
			end

		end

	end

	self:CheckStopPendings()

end


--
function UI.Notifications:CheckStopPendings()

	local stoppedPendings = {}

	for idx = 1, #self.pendingNotifications do

		local notification = self.pendingNotifications[ idx ]
		if not notification.pendingInfo or not next( notification.pendingInfo ) then
			table.insert( stoppedPendings, notification )
		end

	end

	for idx = 1, #stoppedPendings do

		local notification = stoppedPendings[ idx ]
		self:RemovePending( notification )
		self:AddNotificationInternal( notification )		

	end
	
end