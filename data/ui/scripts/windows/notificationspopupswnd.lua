-- ----------------------------------------------------------------------------
--
-- Workfile: notificationspopupswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.NotificationsPopUpsWnd = {}
local pu = UI.NotificationsPopUpsWnd

-- ---------------------------------------
-- window dewfinition
-- ---------------------------------------

UI.NotificationsPopUpsWnd.def =
{
	className	= "Wnd",

	props = 
	{
		name	= "NotificationsPopUpsWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		rectAbs	= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "notificationsPopUps_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "notice_popup",	
						layer		= "UI.NotificationsPopUpsWnd.layers.WORK_EFFECT",
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
				defName 			= "notificationsPopUps_work",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

-- видимость управляется окном UI.HangarWnd
function UI.NotificationsPopUpsWnd:Show()

	if not UI.HangarWnd:IsOnScreen() then
		sys.log( "UI.NotificationsPopUpsWnd:Show()[ERROR]: cannot show; UI.HangarWnd is not on screen" )
		return
	end

	UI.Root:AddChild( self )

end


-- видимость управляется окном UI.HangarWnd
function UI.NotificationsPopUpsWnd:Hide()

	self:UnlinkFromParent()

end


-- используется сразу после загрузки ангара, чтобы показать нотификации, которые пришли после логина и до загрузки ангара
-- вызывается из UI.HangarWnd
function UI.NotificationsPopUpsWnd:CheckUnshownNotifications()

	if not self:IsOnScreen() then
		sys.log( "UI.NotificationsPopUpsWnd:ShowStartNotifications()[ERROR]: not on screen" )
		return
	end

	if self.lastUnshownNotificationId == -1 then
		return
	end

	for ntfId = self.lastUnshownNotificationId, UI.Notifications:GetLastNotificationId() do
		self:AddNotification( ntfId )	
	end

	self.lastUnshownNotificationId = -1

end


-- ---------------------------------------
-- const
-- ---------------------------------------

pu.layers =
{
	MAIN_EFFECT	= 0,
	WORK_EFFECT	= 1,
}

pu.MIN_DISPLAY_TIME		= 1
pu.MAX_DISPLAY_TIME		= 6
pu.ANIM_TIME			= 0.1

pu.effectInfo =
{
	work =
	{
		firstSlotLocator	= "slot_1",
		secondSlotLocator	= "slot_2",
	}
}

pu.animTypes =
{
	NONE	= 1,
	UP		= 2,
	DOWN	= 3,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

pu.slotsRect					= Quat( 0, 0, 0, 0 )
pu.space_slots					= 0
pu.slotWnds						= {}
pu.records						= {}
pu.numRecords					= 0
pu.queue						= {}
pu.animType						= pu.animTypes.NONE
pu.animDist						= -1
pu.animSpeed					= 0
pu.animFirstRecordIdx			= -1
pu.lastUnshownNotificationId	= -1
pu.nextAnimData					= nil

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.NotificationsPopUpsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:MakeConstParams()
	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_NOTIFICATIONS_ADD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_NOTIFICATIONS_CLEAR )

end


--
function UI.NotificationsPopUpsWnd:MakeConstParams()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local slotSize = UI:ZeroVec2()

	local tempSlotEffect = _G.UI_SpawnEffect( "notifications_slot", self:GetUiHandle() )
	if tempSlotEffect then
		slotSize = tempSlotEffect:GetObjSize( "self" )
		_G.UI_DestroyEffect( tempSlotEffect )
	end

	local workEffectPos	= workEffect:GetPos()
	local firstSlotPos	= workEffect:GetObjPos( self.effectInfo.work.firstSlotLocator )
	local secondSlotPos	= workEffect:GetObjPos( self.effectInfo.work.secondSlotLocator )

	self.slotsRect.x = firstSlotPos.x + workEffectPos.x
	self.slotsRect.y = 0
	self.slotsRect.z = slotSize.x
	self.slotsRect.w = firstSlotPos.y + slotSize.y + workEffectPos.y

	self.space_slots = firstSlotPos.y - ( secondSlotPos.y + slotSize.y )

end


--
function UI.NotificationsPopUpsWnd:Reset()

	self.queue = {}
	self:ResetAnim()
	self.nextAnimData = nil

	while self.numRecords > 0 do
		self:RemoveRecordInternal( 1 )
	end

	self.lastUnshownNotificationId = -1

end


--
function UI.NotificationsPopUpsWnd:RemoveRecordInternal( recordIdx )

	local record = self.records[ recordIdx ]

	if not record then
		return
	end

	record.slotWnd:Reset()
	record.slotWnd:UnlinkFromParent()

	table.remove( self.records, recordIdx )
	self.numRecords = self.numRecords - 1

end


--
function UI.NotificationsPopUpsWnd:F_OnEventNotificationsAdd( hSender, iParam0, iParam1, fParam0, fParam1 )

	if self:IsOnScreen() then

		-- не была вызвана вовремя CheckUnshownNotifications() ?
		if self.lastUnshownNotificationId ~= -1 then
			sys.log( "UI.NotificationsPopUpsWnd:F_OnEventNotificationsAdd()[ERROR]: there were unshown notifications" )
			self.lastUnshownNotificationId = -1
		end

		local lastId = UI.Notifications:GetLastNotificationId()
		self:AddNotification( lastId )	

	else

		-- если нотификация пришла во время, когда нотификации в принципе не показываются (нет ангара),
		-- то запоминается последняя непоказанная нотификация, чтобы потом, когда появится возможность (покажется ангар), показать их все скопом
		-- (во время дебрифинга, хотя он и в ангаре, нотификации тоже не показываются - #0107243)

		if not( UI.HangarWnd:IsOnScreen() and not UI.DebriefingWnd:IsOnScreen() ) then
			if self.lastUnshownNotificationId == -1 then
				self.lastUnshownNotificationId = UI.Notifications:GetLastNotificationId()
			end
		else
			-- возможно, в ангаре стоит режим отображения нотификаций "полный список",
			-- в этом случае показывать скопом все непоказанные сообщения уже не надо
			self.lastUnshownNotificationId = -1
		end
		
	end

end


--
function UI.NotificationsPopUpsWnd:F_OnEventNotificationsClear( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:Reset()

end


--
function UI.NotificationsPopUpsWnd:F_OnEventNotificationsAllowedChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:Reset()

end


--
function UI.NotificationsPopUpsWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:Reset()

end


--
function UI.NotificationsPopUpsWnd:AddNotification( notificationId )	

	if not self:CanShowNewRecordNow( false ) then
		table.insert( self.queue, notificationId )
		return
	end

	self:AddRecordAnimated( notificationId )

end


--
function UI.NotificationsPopUpsWnd:CanShowNewRecordNow( bIgnoreQueue )

	if not bIgnoreQueue then
    	if next( self.queue	) then
    		return false
    	end
	end

	if self.animType ~= self.animTypes.NONE then
		return false
	end

	if self.nextAnimData then
		return false
	end

	local lastRecord = self.records[ self.numRecords ]
	if lastRecord and lastRecord.displayTime < self.MIN_DISPLAY_TIME then
		return false
	end

	return true

end


--
function UI.NotificationsPopUpsWnd:AddRecordAnimated( notificationId )

	local record = self:AddRecordInternal( notificationId, true )
	record.slotWnd:AnimateShow()

	if self.numRecords == 1 then
		return
	end

	local animUpDist = record.slotWnd:GetHeight() + self.space_slots

	local animUpData =
	{
    	animType			= self.animTypes.UP,
    	animDist			= animUpDist,
    	animSpeed			= animUpDist / self.ANIM_TIME,
    	animFirstRecordIdx	= self.numRecords - 1,
	}

	-- если новая нотификация не влазит, а вверху оказывается неудаляемая нотификация,
	-- то удаляются нотификации ниже неудаляемой, пока не освободится место для новой - 
	-- удаляются резко, без фэйда, после этого неудалаяемая нотификация плавно смещается вниз на их место,
	-- после этого все нотификации, кроме новой, плавно смещаются вверх, на место над новой.	
	-- ВАЖНО! неудаляемая нотификация должна быть только одна. Случай, когда их несклько, не поддерживается
	-- Если новая влазит, или если неудаляемой нотификации нет, то сразу выполняется пункт - все нотификации, кроме новой, плавно смещаются вверх, на место над новой.

	if self:IsNotificationPersistent( self.records[ 1 ].notificationId ) then
	
		local animDownDist = 0

		local totalHeight = 0
		for recordIdx, record in pairs( self.records ) do
			totalHeight = totalHeight + record.slotWnd:GetHeight()
		end
		totalHeight = totalHeight + self.numRecords * self.space_slots

		while self.numRecords > 2 do

    		if totalHeight > self.slotsRect.w then

				local deletetHeight = self.records[ 2 ].slotWnd:GetHeight() + self.space_slots
				animDownDist = animDownDist + deletetHeight
				totalHeight = totalHeight - deletetHeight

				self:RemoveRecordInternal( 2 )

			else
				break
    		end

		end

		if animDownDist > 0 then

        	self.animType			= self.animTypes.DOWN
        	self.animDist			= animDownDist
        	self.animSpeed			= animDownDist / self.ANIM_TIME
        	self.animFirstRecordIdx	= 1

			animUpData.animFirstRecordIdx = self.numRecords - 1
			self.nextAnimData = animUpData			

		end

	end

	if self.animType == self.animTypes.NONE then

    	self.animType			= animUpData.animType
    	self.animDist			= animUpData.animDist
    	self.animSpeed			= animUpData.animSpeed
    	self.animFirstRecordIdx	= animUpData.animFirstRecordIdx				

	end

end


--
function UI.NotificationsPopUpsWnd:AddRecordInternal( notificationId )

	local record = {}
	record.notificationId	= notificationId
	record.displayTime		= 0

	local slotWnd = self:ObtainFreeSlotWnd()

	self:AddChild( slotWnd )
	slotWnd:Setup( notificationId, UI.NotificationsSlotWnd.modes.POP_UPS )
	slotWnd:SetTop( self.slotsRect.y + self.slotsRect.w - slotWnd:GetHeight() )

	record.slotWnd = slotWnd

	table.insert( self.records, record )
	self.numRecords = self.numRecords + 1

	return record

end


--
function UI.NotificationsPopUpsWnd:ObtainFreeSlotWnd()

	for idx, slotWnd in pairs( self.slotWnds ) do
		if slotWnd:GetNotificationId() == -1 then
			return slotWnd
		end
	end

	local slotWnd = UI:CreateChildWnd( self, UI.NotificationsSlotWnd, tostring( #self.slotWnds + 1 ) )
	slotWnd:SetLeft( self.slotsRect.x )

	table.insert( self.slotWnds, slotWnd )

	return slotWnd

end    


--
function UI.NotificationsPopUpsWnd:ResetAnim()

	self.animType			= self.animTypes.NONE
	self.animDist			= -1
	self.animSpeed			= 0
	self.animFirstRecordIdx	= -1

end


--
function UI.NotificationsPopUpsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateAnimation( dt_sys )
	self:UpdateDisplayTime( dt_sys )
	self:Purge()
	self:CheckShowNextRecord()

end


--
function UI.NotificationsPopUpsWnd:UpdateAnimation( dt )

	if self.animType ~= self.animTypes.NONE then

    	local oldDist = self.animDist
    	local delta = dt * self.animSpeed
    	local bStop = false

    	self.animDist = self.animDist - delta
    	if self.animDist <= 0 then
    		self.animDist = 0
    		delta = oldDist
    		bStop = true
    	end	

    	for recordIdx = self.animFirstRecordIdx, 1, -1 do

    		local record = self.records[ recordIdx ]

    		local y = record.slotWnd:GetTop()	
    		y = y + ( self.animType == self.animTypes.UP and -delta or delta )
    		record.slotWnd:SetTop( y )

			-- у неудаляемых альфа от позиции не меняется
			if not self:IsNotificationPersistent( record.notificationId ) then
    			local alpha = self:GetAlphaByY( y )
    			record.slotWnd:SetAlpha( alpha )
			end

    	end

    	if bStop then
    		self:ResetAnim()
    	end

	end

	if self.animType == self.animTypes.NONE and self.nextAnimData then

    	self.animType			= self.nextAnimData.animType
    	self.animDist			= self.nextAnimData.animDist
    	self.animSpeed			= self.nextAnimData.animSpeed
    	self.animFirstRecordIdx	= self.nextAnimData.animFirstRecordIdx				

		self.nextAnimData = nil

	end

end


--
function UI.NotificationsPopUpsWnd:GetAlphaByY( y )

	local lastRecord = self.records[ self.numRecords ]

	local minY = 0
	local maxY = lastRecord.slotWnd:GetTop()

	return UI:Clamp( ( y - minY )/( maxY - minY ), 0, 1 )

end


--
function UI.NotificationsPopUpsWnd:UpdateDisplayTime( dt )

	for recordIdx = 1, self.numRecords do

		local record = self.records[ recordIdx ]

		record.displayTime = record.displayTime + dt

		if record.displayTime >= self.MAX_DISPLAY_TIME and not record.slotWnd:IsHiding() and not record.slotWnd:IsHidden() and not self:IsNotificationPersistent( record.notificationId ) then
			record.slotWnd:AnimateHide()
		end

	end

end


--
function UI.NotificationsPopUpsWnd:Purge()

	if self.animType ~= self.animTypes.NONE then
		return
	end

	local notificationsToPurge = nil

	for recordIdx = 1, self.numRecords do

		local record = self.records[ recordIdx ]

		if record.slotWnd:GetAlpha() == 0 or record.slotWnd:IsHidden() then
			if not notificationsToPurge then
				notificationsToPurge = {}
			end
			table.insert( notificationsToPurge, record.notificationId )
		end

	end

	if notificationsToPurge then

		 for idx, notificationId in ipairs( notificationsToPurge ) do

			local recordIdx = self:GetRecordIdxByNotificationId( notificationId )

			if recordIdx > 1 then
				self:RemoveNotificationAnimated( notificationId )	-- со смещением вышележащих на освободившееся место (вышележащей может быть неудаляемая нотификация)
				break
			else
				self:RemoveRecordInternal( recordIdx )
			end

		end

	end

end


--
function UI.NotificationsPopUpsWnd:CheckShowNextRecord()

	if not next( self.queue ) then
		return
	end

	if not self:CanShowNewRecordNow( true ) then
		return
	end

	local notificationId = table.remove( self.queue, 1 )
	self:AddRecordAnimated( notificationId )

end


--
function UI.NotificationsPopUpsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )
	local slotWnd = nil

	if w.NOTIFICATION_SLOT then
		slotWnd = w
	else  		
		local parent = w:GetParent()
		while parent do
			if parent.NOTIFICATION_SLOT then
				slotWnd = parent
				break
			end
			parent = parent:GetParent()
		end
	end

	if slotWnd then

		if self.animType == self.animTypes.NONE then
			self:RemoveNotificationAnimated( slotWnd:GetNotificationId() )
		end

	end

	return true

end


--
function UI.NotificationsPopUpsWnd:RemoveNotificationAnimated( notificationId )

	if self.animType ~= self.animTypes.NONE then
		return
	end

	local recordIdx = self:GetRecordIdxByNotificationId( notificationId )
	if recordIdx == -1 then
		sys.log( "UI.NotificationsPopUpsWnd:RemoveNotificationAnimated()[ERROR]: cannot find record" )
		return
	end

	local record = self.records[ recordIdx ]
	local slotHeight = record.slotWnd:GetHeight()

	self:RemoveRecordInternal( recordIdx )

	if recordIdx > 1 then

		self.animType			= self.animTypes.DOWN
		self.animDist			= slotHeight + self.space_slots
		self.animSpeed			= self.animDist / self.ANIM_TIME
		self.animFirstRecordIdx	= recordIdx - 1
				
	end	

end


--
function UI.NotificationsPopUpsWnd:GetRecordIdxByNotificationId( notificationId )

	for recordIdx, record in pairs( self.records ) do
		if record.notificationId == notificationId then
			return recordIdx
		end
	end

	return -1

end


-- определение неудаляемой нотификации - она не пропадает от времени и при добавлении новых, пропадает только по клику
function UI.NotificationsPopUpsWnd:IsNotificationPersistent( notificationId )

	local notification = UI.Notifications:GetNotification( notificationId )
	return notification and notification.type == UI.Notifications.types.MOTD_IMPORTANT	

end