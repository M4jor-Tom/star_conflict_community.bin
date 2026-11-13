-- ----------------------------------------------------------------------------
--
-- Workfile: FriendsListWnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.FriendsListWnd = {}
local fl = UI.FriendsListWnd

-- --------------------------
-- window definition
-- --------------------------

UI.FriendsListWnd.def =
{
	className = "Wnd",
	props =
	{
		name	= "FriendsListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "friends_list_main",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "btn_x",	
						wnd 		= "UI.FriendsList_CrossBtn",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "filter_btn_1",	
						wnd 		= "UI.FriendsList_FriendBtn",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "filter_btn_2",	
						wnd 		= "UI.FriendsList_WatchBtn",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "filter_btn_3",	
						wnd 		= "UI.FriendsList_IgnorBtn",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "filter_btn_4",	
						wnd 		= "UI.FriendsList_NewBtn",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "sort_1",	
						wnd 		= "UI.FriendsList_SortNicknameBtn",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "sort_2",	
						wnd 		= "UI.FriendsList_SortStatusBtn",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "list",	
						wnd 		= "UI.FriendsList_ListWnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "list",	
						wnd 		= "UI.FriendsList_ReferralsListWnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "list",	
						wnd 		= "UI.FriendsList_List2Wnd",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
					{
						objName		= "text",	
						wnd 		= "UI.FriendsListTextWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "chek_box",	
						wnd 		= "UI.FriendsListCheckBoxWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "facedook_btn",	
						wnd 		= "UI.FriendsListWnd_FacebookBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "vk_btn",	
						wnd 		= "UI.FriendsListWnd_VkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "title_1",	
						layer 		= "UI.FriendsListWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT--[[ + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA]],
					},
				}
			}}
		},
		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^invite_friends_wnd_caption"
		}
	},
	children = { "UI.FriendsList_ListWnd", "UI.FriendsList_List2Wnd", "UI.FriendsList_CrossBtn", "UI.FriendsList_FriendBtn", "UI.FriendsList_WatchBtn", "UI.FriendsList_IgnorBtn",
		"UI.FriendsList_NewBtn", "UI.FriendsList_SortStatusBtn", "UI.FriendsList_SortNicknameBtn", "UI.InviteFriendWnd_AddToListBtn",
		"UI.FriendsList_ReferralsListWnd", "UI.FriendsListTextWnd", "UI.FriendsListCheckBoxWnd", "UI.FriendsListWnd_FacebookBtn", "UI.FriendsListWnd_VkBtn" }
}

UI.FriendsListWnd.layers = 
{
	MAIN_EFFECT		= 0,
	CAPTION			= 1,
}


-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.FriendsListWnd:ReloadCurrentList()

	local filter = self:GetFilter()
	if filter ~= UI.FriendsListWnd.filterType.NEW then
		local listWnd
		if filter == UI.FriendsListWnd.filterType.FRIENDS then
			listWnd = UI.FriendsList_ReferralsListWnd
		else
			listWnd = UI.FriendsList_ListWnd
		end

		local scrollPos = listWnd:GetScrollPos()

		listWnd:Clear()
		local list = {}

		if filter == UI.FriendsListWnd.filterType.FRIENDS then
			list = UI.Social:GetFriendList()
		elseif filter == UI.FriendsListWnd.filterType.WATCH then
			list = UI.Social:GetWatchList()
		elseif filter == UI.FriendsListWnd.filterType.IGNORE then
			list = UI.Social:GetIgnorList()
		end

		for i = 1, #list do
			local element = UI:CopyTable2( list[ i ] )
			local nickName, bCached, requestId = _G.MasterServer_GetNickName( element.uid )
			element.nickname = nickName
			listWnd:AddRecord( element )
		end
		if scrollPos and scrollPos ~= -1 then
			listWnd:SetScrollPos( scrollPos, true, false )
		end

	else
		local scrollPos = UI.FriendsList_List2Wnd:GetScrollPos()
		UI.FriendsList_List2Wnd:Clear()
		local new = UI.Social:GetNewList()
		for i = 1, #new do
			local n = UI:CopyTable2( new[ i ] )
			local nickName, bCached, requestId = _G.MasterServer_GetNickName( n.uid )
			n.nickname = nickName
			UI.FriendsList_List2Wnd:AddRecord( n )
		end
		if scrollPos and scrollPos ~= -1 then
			UI.FriendsList_List2Wnd:SetScrollPos( scrollPos, true, false )
		end

	end

	if filter == UI.FriendsListWnd.filterType.FRIENDS then
		if UI:IsPlayerCanBeStudent() then
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			UI:AddChildAndLink( self, UI.FriendsListTextWnd, mainEffect, "text", UI.EffectAnimParams.POS )
			local teacherUid = UI.Social:GetTeacher()
			local str = ""
			if teacherUid then
				local teacherName = UI:MakePlayerNameByUid( teacherUid, false, false, false )
				str = UI:GetStringByName( "friends_teacher_exist" )
				str = string.gsub( str, "%$name%$", teacherName )
			else
				str = UI:GetStringByName( "friends_teacher_non_exist" )
			end
			UI.FriendsListTextWnd:SetMainText( str )
		else
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			UI:AddChildAndLink( self, UI.FriendsListTextWnd, mainEffect, "text", UI.EffectAnimParams.POS )
			local str = UI:GetStringByName( "friends_students_count" )
			str = string.gsub( str, "%$cur%$", #UI.Social:GetStudents() )
			str = string.gsub( str, "%$max%$", MaxStudents )
			if UI:IsPlayerCanBeTeacher() then
				UI.FriendsListTextWnd:SetMainText( str )
			else
				UI.FriendsListTextWnd:SetMainText( str, true )
			end
		end
	else
		UI.FriendsListTextWnd:UnlinkFromParent()
	end

	self:Sort()

	if filter == UI.FriendsListWnd.filterType.FRIENDS then
		self:MoveChildToLastPosition( UI.FriendsListTextWnd )
	end

	self.lastUpdateTime = self.REFRESH_PERIOD

end

--
function UI.FriendsListWnd:ReloadList( filterType )

	if not self:IsOnScreen() then
		return
	end

	if self:GetFilter() == filterType then
		self:ReloadCurrentList()
	end

end

--
function UI.FriendsListWnd:DeleteFromFriend( uid )

	self.msgBoxLeaveH = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msgClan_leave_text" ), UI.MBS_YES_NO )

end

--
function UI.FriendsListWnd:F_OnEventMouseButtonDown( hSender, btnIdx )
	local firstMsgBox = UI:GetFirstMsgBox()
	if firstMsgBox then
		return
	end

	if UI.ContextMenu:IsOnScreen() then
		return
	end

	local mouseX, mouseY = UI:GetMouseX(), UI:GetMouseY()	
	local rect = self:GetRect()
	local parent = self:GetParent()
	if parent then
		rect = parent:ToScreen( rect )
	end
	if not UI:IsPtInRect( rect, mouseX, mouseY ) then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, mouseX, mouseY, true )
		if wndUnderMouse ~= UI.Hangar_FriendListBtn then
			self:Hide()
		end
	end
end


--
function UI.FriendsListWnd:MasterServer_OnUserNotes( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() or result ~= 0 then
		return
	end
	
	local listWnd = nil
	if UI.FriendsList_ReferralsListWnd:IsChildOf( self ) then
		listWnd = UI.FriendsList_ReferralsListWnd
	elseif UI.FriendsList_ListWnd:IsChildOf( self ) then
		listWnd = UI.FriendsList_ListWnd
	end
	
	if listWnd then
	
		for recordIdx = 1, listWnd:GetNumRecords() do
		
			local slotWnd = listWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:UpdateUserNote()
			end
			
		end
		
	end	

end


--
function UI.FriendsListWnd:MasterServer_OnUserNotesAdd( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() or result ~= _G.MasterServer.UserNotesResult.UN_OK then
		return
	end
	
	local listWnd = nil
	if UI.FriendsList_ReferralsListWnd:IsChildOf( self ) then
		listWnd = UI.FriendsList_ReferralsListWnd
	elseif UI.FriendsList_ListWnd:IsChildOf( self ) then
		listWnd = UI.FriendsList_ListWnd
	end
	
	if listWnd then	
	
		local uid = u64Param
	
		for recordIdx = 1, listWnd:GetNumRecords() do
		
			if listWnd:GetRecordData( recordIdx ).uid == uid then
		
				local slotWnd = listWnd:GetButtonForRecord( recordIdx )
				if slotWnd then
					slotWnd:UpdateUserNote()
				end
				
				break
				
			end
			
		end
		
	end


end


--
function UI.FriendsListWnd:MasterServer_OnUserNotesDelete( result, requestId, uids )

	if not self:IsOnScreen() or result ~= _G.MasterServer.UserNotesResult.UN_OK then
		return
	end
	
	local listWnd = nil
	if UI.FriendsList_ReferralsListWnd:IsChildOf( self ) then
		listWnd = UI.FriendsList_ReferralsListWnd
	elseif UI.FriendsList_ListWnd:IsChildOf( self ) then
		listWnd = UI.FriendsList_ListWnd
	end
	
	if listWnd then	
	
		for userIdx, uid in pairs( uids ) do
	
			for recordIdx = 1, listWnd:GetNumRecords() do
			
				if listWnd:GetRecordData( recordIdx ).uid == uid then
			
					local slotWnd = listWnd:GetButtonForRecord( recordIdx )
					if slotWnd then
						slotWnd:UpdateUserNote()
					end
					
					break
					
				end
				
			end
			
		end
		
	end

end


-- --------------------------
-- const
-- --------------------------

fl.effectInfo =
{
	main =
	{
		--scrollBarLocator 	= "scroll_max",
	},

	workList =
	{
		firstSlotLocator	= "line_01",
		secondSlotLocator	= "line_02",
	}
}

fl.sounds =
{
	hide						= UI.sounds.btnClick,
	itemsScrollRange			= "sound/ui/btnMouseOver",
	click						= UI.sounds.btnClick,
	invalid						= "sound/ui/invalid",
}


fl.filterType = 
{
	FRIENDS 		= 1,
	WATCH 			= 2,
	IGNORE 			= 3,
	NEW 			= 4,
}


fl.sortType = 
{
	NAME 		= 1,
	STATUS		= 2,
}


fl.sortDirType =
{
	DOWN 	= 0,
	UP 		= 1,
}

fl.REFRESH_PERIOD = 60


-- --------------------------
-- vars
-- --------------------------

fl.records		= {}
fl.firstId		= -1
fl.lastId		= -1
fl.slotWnds		= {}
--fl.scrollBar	= nil
fl.slotsRect	= Quat( 0, 0, 0, 0 )
fl.space_slots	= 0
fl.workListWnd	= nil
fl.bFriendWnd 	= nil
fl.bWatchWnd 	= nil
fl.bIgnoreWnd 	= nil
fl.bNewWnd 		= nil
fl.bCrossWnd	= nil
fl.filter		= UI.FriendsListWnd.filterType.FRIENDS
fl.sort			= UI.FriendsListWnd.sortType.NAME
fl.sortInited	= false
fl.sortByFilter = {}
fl.sortByFilterAndDir = {}
fl.lastUpdateTime = 0

-- --------------------------
-- work functions
-- --------------------------

-- обновление данных без полной перезагрузке листа
function UI.FriendsListWnd:SoftReloadList()
	if self.filter == UI.FriendsListWnd.filterType.FRIENDS then 
		for i = 1, UI.FriendsList_ReferralsListWnd:GetNumRecords() do
			UI.FriendsList_ReferralsListWnd:SetRecordData( UI.FriendsList_ReferralsListWnd:GetRecordData( i ), i )
		end
	elseif self.filter == UI.FriendsListWnd.filterType.WATCH then
		for i = 1, UI.FriendsList_ListWnd:GetNumRecords() do
			UI.FriendsList_ListWnd:SetRecordData( UI.FriendsList_ListWnd:GetRecordData( i ), i )
		end
	end
end

--
function UI.FriendsListWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self.lastUpdateTime = self.lastUpdateTime - dt_sys
	if self.lastUpdateTime < 0 then
		self.lastUpdateTime = self.REFRESH_PERIOD
		self:SoftReloadList()
	end

end


--
function UI.FriendsListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.workListWnd = UI.FriendsList_WorkList1Wnd

	self.bNewWnd = UI.FriendsList_NewBtn
	self.bFriendWnd = UI.FriendsList_FriendBtn
	self.bWatchWnd = UI.FriendsList_WatchBtn
	self.bIgnoreWnd = UI.FriendsList_IgnorBtn
	self.bCrossWnd = UI.FriendsList_CrossBtn
	self.bSortNickWnd = UI.FriendsList_SortNicknameBtn
	self.bSortStatusWnd = UI.FriendsList_SortStatusBtn

	--self:InitScrollBar()
	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )

	UI.FriendsList_List2Wnd:UnlinkFromParent()
	UI.FriendsList_ListWnd:UnlinkFromParent()
	UI.FriendsList_ReferralsListWnd:UnlinkFromParent()
	self:RemoveChild( UI.FriendsList_List2Wnd )

	self:UpdateFilter()

end


--
function UI.FriendsListWnd:F_OnBeforeShowOnScreen()

	if UI.Social:HasNew() then
		self:SetFilter( UI.FriendsListWnd.filterType.NEW )
	end
	
	return true


end


--
function UI.FriendsListWnd:Hide()

	if not self:IsOnScreen() then
		return
	end

	if UI.InviteFriendWnd:IsOnScreen() then
		return
	end

	self:UnlinkFromParent()		

end


--
function UI.FriendsListWnd:Sort()
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local filter = self:GetFilter()
	UI.FriendsListCheckBoxWnd:UnlinkFromParent()
	if filter == UI.FriendsListWnd.filterType.NEW then
		UI:AddChildAndLink( self, UI.FriendsList_List2Wnd, mainEffect, "list", UI.EffectAnimParams.POS )
		self:RemoveChild( UI.FriendsList_ListWnd )
		self:RemoveChild( UI.InviteFriendWnd_AddToListBtn )
		self:RemoveChild( UI.FriendsListWnd_FacebookBtn )
		self:RemoveChild( UI.FriendsListWnd_VkBtn )
		UI.FriendsList_ReferralsListWnd:UnlinkFromParent()
	elseif filter == UI.FriendsListWnd.filterType.FRIENDS then
		UI:AddChildAndLink( self, UI.FriendsList_ReferralsListWnd, mainEffect, "list", UI.EffectAnimParams.POS )
		self:RemoveChild( UI.FriendsList_List2Wnd )
		self:RemoveChild( UI.FriendsList_ListWnd )
		self:RemoveChild( UI.FriendsListWnd_FacebookBtn )
		self:RemoveChild( UI.FriendsListWnd_VkBtn )
		if filter == UI.FriendsListWnd.filterType.FRIENDS then
			UI:AddChildAndLink( self, UI.FriendsListWnd_FacebookBtn, mainEffect, "facedook_btn", UI.EffectAnimParams.POS )
			UI:AddChildAndLink( self, UI.FriendsListWnd_VkBtn, mainEffect, "vk_btn", UI.EffectAnimParams.POS )
			UI:AddChildAndLink( self, UI.InviteFriendWnd_AddToListBtn, mainEffect, "add_friend_btn_7", UI.EffectAnimParams.POS )
			if UI:IsPlayerCanBeTeacher() or UI:IsPlayerCanBeStudent() then
				self:AddChild( UI.FriendsListCheckBoxWnd )
			end
		else
			self:RemoveChild( UI.InviteFriendWnd_AddToListBtn )
		end
	else
		UI:AddChildAndLink( self, UI.FriendsList_ListWnd, mainEffect, "list", UI.EffectAnimParams.POS )
		UI:AddChildAndLink( self, UI.InviteFriendWnd_AddToListBtn, mainEffect, "add_friend_btn_7", UI.EffectAnimParams.POS )
		self:RemoveChild( UI.FriendsListWnd_FacebookBtn )
		self:RemoveChild( UI.FriendsListWnd_VkBtn )
		self:RemoveChild( UI.FriendsList_List2Wnd )
		UI.FriendsList_ReferralsListWnd:UnlinkFromParent()
	end
	self.sort = UI.FriendsListWnd.sortType.NAME
	self:UpdateSort()

	local records = {}

	if filter == UI.FriendsListWnd.filterType.NEW then
		for i = 1, UI.FriendsList_List2Wnd:GetNumRecords() do
			records[ i ] = UI.FriendsList_List2Wnd:GetRecordData( i )
		end
	elseif filter == UI.FriendsListWnd.filterType.FRIENDS then
		for i = 1, UI.FriendsList_ReferralsListWnd:GetNumRecords() do
			records[ i ] = UI.FriendsList_ReferralsListWnd:GetRecordData( i )
		end
	else
		for i = 1, UI.FriendsList_ListWnd:GetNumRecords() do
			records[ i ] = UI.FriendsList_ListWnd:GetRecordData( i )
		end
	end
	
	local sort = self:GetSortType()
	if sort == self.sortType.NAME then
		local sortDir = self:GetSortDir()
		if sortDir == self.sortDirType.DOWN then
			UI:SortPlayersListByNickname( records, false )
		else
			UI:SortPlayersListByNickname( records, true )
		end
	else
		local sortDir = self:GetSortDir()
		if sortDir == self.sortDirType.DOWN then
			UI:SortPlayersListByStatus( records, false )
		else
			UI:SortPlayersListByStatus( records, true )
		end
	end
	
	if filter == UI.FriendsListWnd.filterType.NEW then
		for i = 1, #records do
			UI.FriendsList_List2Wnd:SetRecordData( records[ i ], i )
		end
	elseif filter == UI.FriendsListWnd.filterType.FRIENDS then
		for i = 1, #records do
			UI.FriendsList_ReferralsListWnd:SetRecordData( records[ i ], i )
		end
	else
		for i = 1, #records do
			UI.FriendsList_ListWnd:SetRecordData( records[ i ], i )
		end
	end

end


--
function UI.FriendsListWnd:Reset()

end

--
function UI.FriendsListWnd:F_OnAfterShowOnScreen()
	UI.Social:Init()
	self:OnAfterShowOnScreen()
	self:FullUpdate()
	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
end

--
function UI.FriendsListWnd:F_OnAfterHideFromScreen()
	self:OnAfterHideFromScreen()
	if not UI:IsInShutdown() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end
end

--
function UI.FriendsListWnd:FullUpdate()

	self:Reset()

	self:UpdateFilter()
	self:UpdateSort()
	self:ReloadCurrentList()

end

--
function UI.FriendsListWnd:SetFilter( filter )

	if self.filter ~= filter then
		self.filter = filter
		self:UpdateFilter()
	end

end

--
function UI.FriendsListWnd:GetFilter()

	return self.filter

end

--
function UI.FriendsListWnd:SetSortType( type )

	self.sortByFilter[ self.filter ] = type

end

--
function UI.FriendsListWnd:GetSortType()

	return self.sortByFilter[ self.filter ]

end

--
function UI.FriendsListWnd:SetSortDir( dir )

	self.sortByFilterAndDir[ self.filter ][ self.sortByFilter[ self.filter ] ] = dir

end

--
function UI.FriendsListWnd:GetSortDir()

	return self.sortByFilterAndDir[ self.filter ][ self.sortByFilter[ self.filter ] ]

end

--
function UI.FriendsListWnd:UpdateFilter()

	local filter = self:GetFilter()
	self.bNewWnd:Deselect()
	self.bFriendWnd:Deselect()
	self.bWatchWnd:Deselect()
	self.bIgnoreWnd:Deselect()
	if filter == UI.FriendsListWnd.filterType.FRIENDS then
		self.bFriendWnd:Select()
	elseif filter == UI.FriendsListWnd.filterType.WATCH then
		self.bWatchWnd:Select()
	elseif filter == UI.FriendsListWnd.filterType.IGNORE then
		self.bIgnoreWnd:Select()
	elseif filter == UI.FriendsListWnd.filterType.NEW then
		self.bNewWnd:Select()
	else
		sys.log( "UI.FriendsListWnd:UpdateFilter()[ERROR]: unknown filter type: %d", filter )
	end

	if self.sortByFilter[ filter ] == nil then
		self.sortByFilter[ filter ] = self.sortType.NAME
	end

	if self.sortByFilterAndDir[ filter ] == nil then
		self.sortByFilterAndDir[ filter ] = {}
	end

	if self.sortByFilterAndDir[ filter ][ self.sortByFilter[ filter ] ] == nil then
		self.sortByFilterAndDir[ filter ][ self.sortByFilter[ filter ] ] = self.sortDirType.UP
	end

	self:UpdateSort()

end

--
function UI.FriendsListWnd:UpdateSort()

	local filter = self:GetFilter()

	if filter == self.filterType.FRIENDS or filter == self.filterType.WATCH then
		if not self.bSortStatusWnd.canBePressed then
			self.bSortStatusWnd.canBePressed = true
		end
	else
		if self.bSortStatusWnd.canBePressed then
			self.bSortStatusWnd.canBePressed = false
		end
	end

	local sort = self:GetSortType()
	self.bSortNickWnd:Deselect()
	self.bSortStatusWnd:Deselect()
	local sortDir = self:GetSortDir()
	if sort == UI.FriendsListWnd.sortType.NAME then
		self.bSortNickWnd:Select( sortDir )
	elseif sort == UI.FriendsListWnd.sortType.STATUS then
		self.bSortStatusWnd:Select( sortDir )
	else
		sys.log( "UI.FriendsListWnd:UpdateSort()[ERROR]: unknown sort type: %d", self.sort )
	end

end

--
function UI.FriendsListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local filter = self:GetFilter()

	if self.bFriendWnd == wnd then
		if filter ~= UI.FriendsListWnd.filterType.FRIENDS then
			self:SetFilter( UI.FriendsListWnd.filterType.FRIENDS )
			UI:PlayGlobalSound( self.sounds.click )
		end
		self:ReloadCurrentList()
	elseif self.bWatchWnd == wnd then
		if filter ~= UI.FriendsListWnd.filterType.WATCH then
			self:SetFilter( UI.FriendsListWnd.filterType.WATCH )
			UI:PlayGlobalSound( self.sounds.click )
		end
		self:ReloadCurrentList()
	elseif self.bIgnoreWnd == wnd then
		if filter ~= UI.FriendsListWnd.filterType.IGNORE then
			self:SetFilter( UI.FriendsListWnd.filterType.IGNORE )
			UI:PlayGlobalSound( self.sounds.click )
		end
		self:ReloadCurrentList()
	elseif self.bNewWnd == wnd then
		if filter ~= UI.FriendsListWnd.filterType.NEW then
			self:SetFilter( UI.FriendsListWnd.filterType.NEW )
			UI:PlayGlobalSound( self.sounds.click )
		end
		self:ReloadCurrentList()
	elseif self.bSortNickWnd == wnd then
		local sort = self:GetSortType()
		if sort == self.sortType.NAME then
			local sortDir = self:GetSortDir()
			if sortDir == self.sortDirType.DOWN then
				self:SetSortDir( self.sortDirType.UP )
			else
				self:SetSortDir( self.sortDirType.DOWN )
			end
		else
			self:SetSortType( UI.FriendsListWnd.sortType.NAME )
		end
		--[[self.bSortNickWnd:Select()
		self.bSortStatusWnd:Deselect()]]
		self:UpdateSort()
		self:Sort()
		UI:PlayGlobalSound( self.sounds.click )
	elseif self.bSortStatusWnd == wnd then
		if not self.bSortStatusWnd.canBePressed then
			UI:PlayGlobalSound( self.sounds.invalid )
			return true
		end
		local sort = self:GetSortType()
		if sort == self.sortType.STATUS then
			local sortDir = self:GetSortDir()
			if sortDir == self.sortDirType.DOWN then
				self:SetSortDir( self.sortDirType.UP )
			else
				self:SetSortDir( self.sortDirType.DOWN )
			end
		else
			self:SetSortType( UI.FriendsListWnd.sortType.STATUS )
		end
		--[[self.bSortStatusWnd:Select()
		self.bSortNickWnd:Deselect()]]
		self:UpdateSort()
		self:Sort()
		UI:PlayGlobalSound( self.sounds.click )
	elseif UI.FriendsListWnd_FacebookBtn == wnd then
		UI.SaleAdvert_AdvertWnd:StartFacebookOperation()
	elseif UI.FriendsListWnd_VkBtn == wnd then
		UI.SaleAdvert_AdvertWnd:StartVkOperation()
	elseif self.bCrossWnd == wnd then

		self:OnCancel()

	end

	return true

end


--
function UI.FriendsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if not self:IsOnScreen() then
		return false
	end

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if UI.FriendsList_ListWnd:IsOnScreen() then
		local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = UI.FriendsList_ListWnd:GetVisibleRange()
		UI.FriendsList_ListWnd:ScrollVisibleRange( ticks < 0 )
		local firstVisibleRecordIdx, lastVisibleRecordIdx = UI.FriendsList_ListWnd:GetVisibleRange()
		if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
			UI:PlayGlobalSound( self.sounds.itemsScrollRange )
		end
	elseif UI.FriendsList_ReferralsListWnd:IsOnScreen() then
		local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = UI.FriendsList_ReferralsListWnd:GetVisibleRange()
		UI.FriendsList_ReferralsListWnd:ScrollVisibleRange( ticks < 0 )
		local firstVisibleRecordIdx, lastVisibleRecordIdx = UI.FriendsList_ReferralsListWnd:GetVisibleRange()
		if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
			UI:PlayGlobalSound( self.sounds.itemsScrollRange )
		end
	else
		local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = UI.FriendsList_List2Wnd:GetVisibleRange()
		UI.FriendsList_List2Wnd:ScrollVisibleRange( ticks < 0 )
		local firstVisibleRecordIdx, lastVisibleRecordIdx = UI.FriendsList_List2Wnd:GetVisibleRange()
		if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
			UI:PlayGlobalSound( self.sounds.itemsScrollRange )
		end
	end

	return true

end


--
function UI.FriendsListWnd:OnEscape( key, controllerIdx )

	self:OnCancel()
	return true

end



--
function UI.FriendsListWnd:OnCancel()

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()

end


-- -----------------------------------------------------------------
-- UI.FriendsList_ListWnd
-- -----------------------------------------------------------------

UI.FriendsList_ListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.FriendsList_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "FriendsList_ListWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "friends_list_3",
				defaultAnimation    = "idle",

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

-- -----------------------------------
-- const
-- -----------------------------------

UI.FriendsList_ListWnd.btnPrototypeName	= "FriendsList_SlotWnd"

UI.FriendsList_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}

UI.FriendsList_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.FriendsList_ListWnd.MAX_SLOTS = 18

-- -----------------------------------------------------------------
-- UI.FriendsList_ReferralsListWnd
-- -----------------------------------------------------------------

UI.FriendsList_ReferralsListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.FriendsList_ReferralsListWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "FriendsList_ReferralsListWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "friends_list_1",
				defaultAnimation    = "idle",

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

-- -----------------------------------
-- const
-- -----------------------------------

UI.FriendsList_ReferralsListWnd.btnPrototypeName	= "FriendsList_SlotWnd"

UI.FriendsList_ReferralsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}

UI.FriendsList_ReferralsListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.FriendsList_ReferralsListWnd.MAX_SLOTS = 17

-- -----------------------------------------------------------------
-- UI.FriendsList_SlotWnd
-- -----------------------------------------------------------------

UI.FriendsList_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------


--
UI.FriendsList_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    OVER_EFFECT			= 1,
    NICKNAME			= 2,
    STATUS				= 3,
    ON_OFF_EFFECT		= 4,
}


--
UI.FriendsList_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name			= "FriendsList_SlotWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "friends_list_slot_1",
				defaultAnimation	= "online",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",	
						layer		= "UI.FriendsList_SlotWnd.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.ALL,-- + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "on_off",	
						layer		= "UI.FriendsList_SlotWnd.layers.ON_OFF_EFFECT",
						animParams	= UI.EffectAnimParams.ALL,-- + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1",	
						layer		= "UI.FriendsList_SlotWnd.layers.NICKNAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_2",	
						layer		= "UI.FriendsList_SlotWnd.layers.STATUS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "friends_list_slot_1_over",
				defaultAnimation	= "idle",
			}}
		},

		-- NICKNAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- STATUS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ON_OFF_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "friends_list_slot_1_on_off",
				defaultAnimation	= "off",
			}}
		},
	}
}


UI.FriendsList_SlotWnd.userNoteIcoWnd = nil

--
function UI.FriendsList_SlotWnd:F_PostLoad()
	
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	
	self.userNoteIcoWnd = UI:CreateChildWnd( self, UI.FriendsListSlot_UserNoteIcoWnd, "" )

end


--
function UI.FriendsList_SlotWnd:UpdateForData( data, bAnimated )

	local text
	if data.nickname then
		text = data.nickname
		if data.isPupil then
			text = text..UI:GetStringByName( "friends_pupil_postfix" )
		end
		if data.isTeacher then
			text = text..UI:GetStringByName( "friends_teacher_postfix" )
		end
		self:SetText( text, self.layers.NICKNAME )
	else
		self:SetText( "", self.layers.NICKNAME )
	end

	if UI.FriendsListWnd:GetFilter() == UI.FriendsListWnd.filterType.IGNORE then
		self:SetLayerVisible( false, self.layers.ON_OFF_EFFECT  )
		self:SetText( "", self.layers.STATUS )
	else
		self:SetLayerVisible( true, self.layers.ON_OFF_EFFECT  )
		local effect = UI:GetEffectFromLayer( self, UI.FriendsList_SlotWnd.layers.MAIN_EFFECT )
		local onoffEffect = UI:GetEffectFromLayer( self, UI.FriendsList_SlotWnd.layers.ON_OFF_EFFECT )
		local str = UI:GetPlayerStatusFullStr( data, UI.FriendsListWnd:GetFilter() ~= UI.FriendsListWnd.filterType.WATCH )
		self:SetText( str, self.layers.STATUS )

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		local color = 0xffffffff
		if data.isPupil or data.isTeacher then
			color = mainEffect:GetObjColor( "text_2_color" )
		else
			color = mainEffect:GetObjColor( "text_1" )
		end

		self:SetColor( color, self.layers.NICKNAME )

		if data.state == MasterServer.UserState.USER_STATE_OFFLINE or data.state == MasterServer.UserState.USER_STATE_NOT_AVAILABLE then
			effect:StartAnimation( "offline" )
			onoffEffect:StartAnimation( "off" )
		else
			effect:StartAnimation( "online" )
			onoffEffect:StartAnimation( "on" )
		end
	end


	if data.fbid or data.vkid then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		local posY = mainEffect:GetObjPos( "facebook_btn" ).y
		local space = mainEffect:GetObjPos( "facebook_btn" ).x - ( mainEffect:GetObjPos( "text_1" ).x + mainEffect:GetObjSize( "text_1" ).x )
		local maxFormatRect	= UI:Quat( 0, 0, 1024, 768 )
		local clipRect		= UI:Quat( 0, 0, 1024, 768 )
		local formatFlags	= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE
		local hFont = self:GetFont( self.layers.NICKNAME ) 
		local width = _G.MeasureText( text, hFont, maxFormatRect, formatFlags, maxFormatRect ).z
		local right = width + mainEffect:GetObjPos( "text_1" ).x
		if data.fbid then
			if not self.facebookBtn then
				self.facebookBtn = UI:CreateChildWnd( self, UI.FriendsListSlot_FacebookBtn, "" )
			end
			self.facebookBtn:SetTop( posY )
			self:AddChild( self.facebookBtn )
			self.facebookBtn:SetLeft( right + space )
			right = right + self.facebookBtn:GetWidth() + space
		else
			if self.facebookBtn then
				self.facebookBtn:UnlinkFromParent()
			end
		end
		if data.vkid then
			if not self.vkBtn then
				self.vkBtn = UI:CreateChildWnd( self, UI.FriendsListSlot_VkBtn, "" )
			end
			self.vkBtn:SetTop( posY )
			self:AddChild( self.vkBtn )
			self.vkBtn:SetLeft( right + space )
			right = right + self.vkBtn:GetWidth() + space
		else
			if self.vkBtn then
				self.vkBtn:UnlinkFromParent()
			end
		end
	else
		if self.facebookBtn then
			self.facebookBtn:UnlinkFromParent()
		end
		if self.vkBtn then
			self.vkBtn:UnlinkFromParent()
		end
	end
	
	self:UpdateUserNote()

end


--
function UI.FriendsList_SlotWnd:UpdateUserNote()

	local data = self:GetRecordData()
	local userNote = data and UI:GetUserNote( data.uid )
	if( userNote ) then
	
		UI:AddChildAndLink( self, self.userNoteIcoWnd, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ), "edit", UI.EffectAnimParams.POS )
		
		local subst =
		{
			[ "\r" ]	= "",	-- CR
			[ "\n" ]	= "|",	-- LF	используется в многострочном едитбоксе для переноса строки (вместо обычного "|") (заметка была введена через многострочный едитбокс)
			[ "@" ]		= "#@",	-- спецсимвол цвета
			[ "^" ] 	= "#^",	-- альтернативный спецсимвол цвета
			[ "|" ] 	= "#|",	-- спецсимвол перевода строки
			[ "#" ]		= "##",	-- спецсимвол отмены спецсимвола 
			[ "$" ]		= "#$",	-- спецсимвол плэйсхолдера в метатексте (в тултипе метатекст)
		}
		userNote = string.gsub( userNote, ".", subst )
		
		local tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "userNote_tooltip_caption" ),
			text		= userNote,
		}		
		self.userNoteIcoWnd:SetTooltipData( tooltipData )
		
	else
		self.userNoteIcoWnd:UnlinkFromParent()
	end

end


--
function UI.FriendsList_SlotWnd:F_OnMouseIn()

	if self:GetRecordData() then
		self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	end
	return true

end


--
function UI.FriendsList_SlotWnd:F_OnMouseOut()

	if self:GetRecordData() then
		self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	end
	return true

end


--
function UI.FriendsList_SlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	-- fill context menu
	local data = self:GetRecordData()
	if data then
		UI.ContextMenu:Clear()
		UI.ContextMenu:SetName( data.nickname )
		UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.PLAYER_USER_NOTE, data.uid )
		UI.ContextMenu:Show( mouseX, mouseY )
	end
	return true

end


--
function UI.FriendsList_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.FriendsList_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.FriendsList_SlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


--
UI.FriendsListSlot_FacebookBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FacebookBtn3",
		props =
		{
			name		= "FriendsListSlot_FacebookBtn",
			isPrototype = true,
		},
	},
	
}

--
function UI.FriendsListSlot_FacebookBtn:GetTooltipData()
	return
	{
		tooltipType = UI.tooltipTypes.TEXT_LARGE, 
		text = UI:GetStringByName( "tooltip_friends_slot_facebook_text" ), 
		caption = UI:GetStringByName( "tooltip_friends_slot_facebook_caption" )
	}
end

--
function UI.FriendsListSlot_FacebookBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local parent = self:GetParent()
	if not parent then
		return true
	end
	if parent.GetRecordData then
		local data = parent:GetRecordData()
		if data and data.fbid then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			_G.ShellExecute( "https://www.facebook.com/profile.php?id=".._G.U64ToStr( data.fbid ) )
		end
	end
end

--
UI.FriendsListSlot_VkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "VKontakteBtn3",
		props =
		{
			name		= "FriendsListSlot_VkBtn",
			isPrototype = true,
		},
	},
	
}

--
function UI.FriendsListSlot_VkBtn:GetTooltipData()
	return
	{
		tooltipType = UI.tooltipTypes.TEXT_LARGE, 
		text = UI:GetStringByName( "tooltip_friends_slot_vk_text" ), 
		caption = UI:GetStringByName( "tooltip_friends_slot_vk_caption" )
	}
end

--
function UI.FriendsListSlot_VkBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local parent = self:GetParent()
	if not parent then
		return true
	end
	if parent.GetRecordData then
		local data = parent:GetRecordData()
		if data and data.vkid then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			_G.ShellExecute( "http://www.vk.com/id".._G.U64ToStr( data.vkid ) )
		end
	end
end


-- -------------------------------------------------------------------
-- UI.FriendsListSlot_UserNoteIcoWnd
-- -------------------------------------------------------------------

UI.FriendsListSlot_UserNoteIcoWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.FriendsListSlot_UserNoteIcoWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",
	
	props =
	{
		name		= "FriendsListSlot_UserNoteIcoWnd",
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
				defName 			= "friends_list_slot_userNote",
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

-- -----------------------------------
-- interface functions
-- -----------------------------------


function UI.FriendsListSlot_UserNoteIcoWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.FriendsListSlot_UserNoteIcoWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData
	
end

-- -----------------------------------
-- const
-- -----------------------------------


UI.FriendsListSlot_UserNoteIcoWnd.effectInfo =
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


-- -----------------------------------
-- vars
-- -----------------------------------

UI.FriendsListSlot_UserNoteIcoWnd.tooltipData = nil


-- -----------------------------------------------------------------
-- UI.FriendsList_List2Wnd
-- -----------------------------------------------------------------

UI.FriendsList_List2Wnd = {}
local ol = UI.FriendsList_List2Wnd

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.FriendsList_List2Wnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",

	props =
	{
		name			= "FriendsList_List2Wnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName				= "friends_list_2",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x44ff0000,
			visible		= false,
		}
	}
}

-- -----------------------------------
-- const
-- -----------------------------------

UI.FriendsList_List2Wnd.btnPrototypeName	= "FriendsList_Slot2Wnd"

UI.FriendsList_List2Wnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}

UI.FriendsList_List2Wnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.FriendsList_List2Wnd.MAX_SLOTS = 16

UI.FriendsList_List2Wnd.layers =
{
	MAIN_EFFECT		= 0,
}


-- -----------------------------------------------------------------
-- UI.FriendsList_SlotWnd
-- -----------------------------------------------------------------

UI.FriendsList_Slot2Wnd = {}
local fl = UI.FriendsList_Slot2Wnd

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.FriendsList_Slot2Wnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList3_Btn",

	props =
	{
		name		= "Friendslist_Slot2Wnd",
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
			updatable	= false,

			effects =
			{{
				defName 			= "friends_list_slot_2",
				defaultAnimation	= "online",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_1",	
						layer		= "UI.FriendsList_Slot2Wnd.layers.NICKNAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "text_2",	
						layer		= "UI.FriendsList_Slot2Wnd.layers.STATUS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},

					{
						objName		= "over",	
						layer		= "UI.FriendsList_Slot2Wnd.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
				}
			}}
		},

		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "friends_list_slot_1_over",
				defaultAnimation	= "idle",
			}}
		},

		-- NICKNAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- STATUS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		--[[-- ON_OFF_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "friends_list_slot_1_on_off",
				defaultAnimation	= "idle",
			}}
		},]]
	}
}


UI.FriendsList_Slot2Wnd.layers = 
{
	MAIN_EFFECT = 0,
	OVER_EFFECT = 1,
	NICKNAME = 2,
	STATUS = 3,
}

UI.FriendsList_Slot2Wnd.colorStr = "0xffffffff"


--
function UI.FriendsList_Slot2Wnd:F_PostLoad()

	UI.ButtonsList3_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		local disableEffect = _G.UI_SpawnEffect( "friends_list_slot_1", self:GetUiHandle() )
		UI.FriendsList_Slot2Wnd.colorStr = UI:Color2Str( disableEffect:GetObjColor( "text_2_color" ) )
		_G.UI_DestroyEffect( disableEffect )
		return
	end

	self.addBtn		= UI:CreateChildWnd( self, UI.FriendsListSlot2_AddWnd, "" )
	self.ignorBtn	= UI:CreateChildWnd( self, UI.FriendsListSlot2_IgnorWnd, "" )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.addBtn, workEffect, "add_btn", UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.ignorBtn, workEffect, "ignor_btn", UI.EffectAnimParams.POS )
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )

end


--
function UI.FriendsList_Slot2Wnd:F_OnAfterShowOnScreen()

	self:SetLayerVisible( false, self.layers.OVER_EFFECT )

end


--
function UI.FriendsList_Slot2Wnd:UpdateForData( data, bAnimated )

	local text = data.nickname
	if data.isPupil then
		text = text..UI:GetStringByName( "friends_pupil_postfix" )
		text = UI.FriendsList_Slot2Wnd.colorStr..text
	end
	if data.isTeacher then
		text = text..UI:GetStringByName( "friends_teacher_postfix" )
		text = UI.FriendsList_Slot2Wnd.colorStr..text
	end
	self:SetText( text, self.layers.NICKNAME )
	--[[local effect = UI:GetEffectFromLayer( self, UI.FriendsList_SlotWnd.layers.MAIN_EFFECT )
	for k, v in pairs( MasterServer.UserState ) do
		if v == data.state then 
			self:SetText( GetStringByName( "state_"..k ), self.layers.STATUS )
		end
	end
	if data.state == 0 then
		effect:StartAnimation( "online" )
	else
		effect:StartAnimation( "offline" )
	end]]

end


--
function UI.FriendsList_Slot2Wnd:F_OnMouseIn()

	self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	return true

end


--
function UI.FriendsList_Slot2Wnd:F_OnMouseOut()

	self:SetLayerVisible( false, self.layers.OVER_EFFECT )
	return true

end



--
function UI.FriendsList_Slot2Wnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	UI.ContextMenu:Clear()

	-- fill context menu
	local data = self:GetRecordData()

	UI.ContextMenu:SetName( data.nickname )

	UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON, data.uid )
	
	UI.ContextMenu:Show( mouseX, mouseY )
	return true

end


--
function UI.FriendsList_Slot2Wnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.FriendsList_Slot2Wnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.FriendsList_Slot2Wnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end



-- -----------------------------------------------------
-- UI.FriendslistSlot2_AddWnd
-- -----------------------------------------------------

UI.FriendsListSlot2_AddWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		props =
		{
			name		= "FriendslistSlot2_AddWnd",
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
        			defName				= "friends_list_slot_2_add",
        			defaultAnimation    = "idle",

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
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
	},
	GetTooltipData = function( self )
		if self.mode == UI.FriendsListSlot2_AddWnd.Modes.FRIEND then
			return 
			{
				tooltipType = UI.tooltipTypes.TEXT_SMALL,
				text		= UI:GetStringByName( "tooltipaccepinvite" ),
			}
		else
			return 
			{
				tooltipType = UI.tooltipTypes.TEXT_SMALL,
				text		= UI:GetStringByName( "tooltip_accept_request_to_clan" ),
			}
		end
	end
}

UI.FriendsListSlot2_AddWnd.Modes = 
{
	FRIEND 			= 0,
	CLAN 			= 1,
}

UI.FriendsListSlot2_AddWnd.mode = UI.FriendsListSlot2_AddWnd.Modes.FRIEND


function UI.FriendsListSlot2_AddWnd:F_OnMouseLButtonDown()

	if self.mode == UI.FriendsListSlot2_AddWnd.Modes.FRIEND then
		local data = self:GetParent():GetRecordData()
		--TODO error handling
		if data.isTeacher or data.isPupil then
			_G.MasterServer_Teaching_Accept( data.uid )
		else
			_G.MasterServer_Social_FriendsAcceptRequest( data.uid )
		end
	else
		_G.MasterServer_ClanJoinReqAccept( self:GetParent():GetRecordData().uid )
	end
	UI:PlayGlobalSound( "sound/ui/apply" )
	return true

end


-- -----------------------------------------------------
-- UI.FriendslistSlot2_IgnorWnd
-- -----------------------------------------------------

UI.FriendsListSlot2_IgnorWnd = 
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",
		
		props =
		{
			name		= "FriendslistSlot2_IgnorWnd",
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
        			defName				= "friends_list_slot_2_ignor",
        			defaultAnimation    = "idle",

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
    		animationIdle 			= "idle",
    		animationSelect			= "over",
    		animationPressed		= "press",
    		animationDisabled		= "",
    		animationIdle_focus 	= "",
    		animationSelect_focus	= "",
    		animationPressed_focus	= "",
    	},
	},
	GetTooltipData = function( self )
		if self.mode == UI.FriendsListSlot2_AddWnd.Modes.FRIEND then
			return 
			{
				tooltipType = UI.tooltipTypes.TEXT_SMALL,
				text		= UI:GetStringByName( "tooltiprejectinvite" ),
			}
		else
			return 
			{
				tooltipType = UI.tooltipTypes.TEXT_SMALL,
				text		= UI:GetStringByName( "tooltip_reject_request_to_clan" ),
			}
		end
	end
}

UI.FriendsListSlot2_IgnorWnd.Modes = 
{
	FRIEND 			= 0,
	CLAN 			= 1,
}


UI.FriendsListSlot2_IgnorWnd.mode = UI.FriendsListSlot2_AddWnd.Modes.FRIEND

--
function UI.FriendsListSlot2_IgnorWnd:F_OnMouseLButtonDown()

	if self.mode == UI.FriendsListSlot2_AddWnd.Modes.FRIEND then
		local data = self:GetParent():GetRecordData()
		--TODO error handling
		if data.isTeacher or data.isPupil then
			_G.MasterServer_Teaching_Reject( data.uid )
		else
			_G.MasterServer_Social_FriendsRejectRequest( data.uid )
		end
	else
		_G.MasterServer_ClanJoinReqCancel( self:GetParent():GetRecordData().uid, UI.Clan:GetCid() )
	end
	UI:PlayGlobalSound( UI.sounds.btnClick )
	return true

end


-- ------------------------------------------------------------------------
-- UI.FriendsList_CrossBtn
-- ------------------------------------------------------------------------

UI.FriendsList_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "FriendsList_CrossBtn"
		}
	}
}


-- ------------------------------------------------------------------------
-- UI.FriendsList_FriendBtn, UI.FriendsList_WatchBtn, UI.FriendsList_IgnorBtn, UI.FriendsList_NewBtn
-- ------------------------------------------------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

--
UI.FriendsList_FilterBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "FriendsList_FilterBtn",
			isPrototype	= true
		},

   		layers =
   		{
   			numLayers = l_numBaseBtnLayers + 1,
		    			
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName				= "friends_list_filter_btn",
					defaultAnimation    = "deselect",

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
			},
   		}
	},
}


UI.FriendsList_FilterBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "deselect",
		animationSelect			= "select",
		animationPressed		= "",
		animationDisabled		= "",
		animationIdle_focus 	= "over_deselect",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

UI.FriendsList_FilterBtn.sounds =
{
	over	= UI.sounds.btnMouseOver,
}

UI.FriendsList_FilterBtn.selected = false


--
function UI.FriendsList_FilterBtn:Select()

	if self.selected then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( self.effectInfo.main.animationSelect )
	self.selected = true

end


--
function UI.FriendsList_FilterBtn:Deselect()

	if not self.selected then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( self.effectInfo.main.animationIdle )
	self.selected = false

end


--
function UI.FriendsList_FilterBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self.selected then
		return true
	end

	UI:PlayGlobalSound( self.sounds.over )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( self.effectInfo.main.animationIdle_focus )
	return true

end


--
function UI.FriendsList_FilterBtn:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self.selected then
		return true
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( self.effectInfo.main.animationIdle )
	return true

end


--
UI.FriendsList_FriendBtn = 
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "FriendsList_FriendBtn",
		},

		layers =
   		{
			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^friends_filer_friends"
   			}
   		}
	}
}


--
UI.FriendsList_WatchBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "FriendsList_WatchBtn",
		},

   		layers =
   		{
			-- TEXT
			{
				id			= UI.MsgBox_Btn.layers.TEXT,
				text		= "^friends_filer_watch",
			},
   		}
	},
}


--
UI.FriendsList_IgnorBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "FriendsList_IgnorBtn",
		},

   		layers =
   		{
			-- TEXT
			{
				id			= UI.MsgBox_Btn.layers.TEXT,
				text		= "^friends_filer_ignore",
			},
   		}
	},
}


--
UI.FriendsList_NewBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_FilterBtn",

		props =
		{
			name		= "FriendsList_NewBtn",
		},

   		layers =
   		{
			-- TEXT
			{
				id			= UI.MsgBox_Btn.layers.TEXT,
				text		= "^friends_filer_new",
			},
   		}
	},
}

-- ------------------------------------------------------------------------
-- UI.FriendsList_SortNicknameBtn, UI.FriendsList_SortStatusBtn
-- ------------------------------------------------------------------------

--
UI.FriendsList_SortBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name		= "FriendsList_SortBtn",
			isPrototype	= true
		},

   		layers =
   		{
   			numLayers = l_numBaseBtnLayers + 2,
		    			
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				main		= true,

				effects =
				{{
					defName				= "friends_list_sort_btn",
					defaultAnimation    = "deselect",

					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "text",
							layer		= "UI.FriendsList_SortBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
						},

						{
							objName		= "arrow",
							layer		= "UI.FriendsList_SortBtn.layers.SORT_TYPE",
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
			},

			-- SORT_TYPE
			{
				id			= numLayers,

				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,

				effects =
				{{
					defName				= "friends_list_sort_type",
					defaultAnimation    = "down",
				}}
			},
   		}
	},
}


UI.FriendsList_SortBtn.layers = 
{
	MAIN_EFFECT = 0,
	DEBUG		= 1,
	TEXT		= 2,
	SORT_TYPE	= 3,
}

UI.FriendsList_SortBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "",
		animationSelect			= "",
		animationPressed		= "",
		animationDisabled		= "",
		animationIdle_focus 	= "",
		animationSelect_focus	= "",
		animationPressed_focus	= "",
	},
}

--
UI.FriendsList_SortBtn.sounds =
{
	over	= "sound/ui/btnMouseOver",
}


UI.FriendsList_FilterBtn.selected = false
UI.FriendsList_SortBtn.canBePressed = true
UI.FriendsList_SortBtn.mouseOver = false


--
function UI.FriendsList_SortBtn:Update()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local arrowEffect = UI:GetEffectFromLayer( self, self.layers.SORT_TYPE )
	if not self.canBePressed then
		self:SetLayerVisible( false, self.layers.SORT_TYPE )
		mainEffect:StartAnimation( "disable" )
	else
		--self:SetLayerVisible( true, self.layers.SORT_TYPE )
		mainEffect:StartAnimation( "select" )	
	end

end


--
function UI.FriendsList_SortBtn:Select( dir )

	if not self.canBePressed then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local arrowEffect = UI:GetEffectFromLayer( self, self.layers.SORT_TYPE )
	self:SetLayerVisible( true, self.layers.SORT_TYPE )
	if dir == UI.FriendsListWnd.sortDirType.DOWN then
		arrowEffect:StartAnimation( "down" )
	else
		arrowEffect:StartAnimation( "up" )
	end

	if self.mouseOver then
		mainEffect:StartAnimation( "select_over" )
	else
		mainEffect:StartAnimation( "select" )
	end
	self.selected = true

end


--
function UI.FriendsList_SortBtn:Deselect()

	--[[if not self.canBePressed then
		return
	end]]

	self:SetLayerVisible( false, self.layers.SORT_TYPE )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not self.canBePressed then
		mainEffect:StartAnimation( "disable" )
		return
	end
	if self.mouseOver then
		mainEffect:StartAnimation( "over_deselect" )
	else
		mainEffect:StartAnimation( "deselect" )
	end
	self.selected = false

end


--
function UI.FriendsList_SortBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if not self.canBePressed then
		return true
	end

	self.mouseOver = true

	UI:PlayGlobalSound( self.sounds.over )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.selected then
		mainEffect:StartAnimation( "select_over" )
	else
		mainEffect:StartAnimation( "over_deselect" )
	end
	return true

end


--
function UI.FriendsList_SortBtn:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if not self.canBePressed then
		return true
	end

	self.mouseOver = false

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if self.selected then
		mainEffect:StartAnimation( "select" )
		return true
	end
	
	mainEffect:StartAnimation( "deselect" )
	return true

end


--
UI.FriendsList_SortNicknameBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_SortBtn",

		props =
		{
			name		= "FriendsList_SortNicknameBtn",
		},

   		layers =
   		{
			-- TEXT
			{
				id			= UI.MsgBox_Btn.layers.TEXT,
				text		= "^friends_sort_nickname",
			},
   		}
	},
}


--
UI.FriendsList_SortStatusBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FriendsList_SortBtn",

		props =
		{
			name		= "FriendsList_SortStatusBtn",
		},

   		layers =
   		{
			-- TEXT
			{
				id			= UI.MsgBox_Btn.layers.TEXT,
				text		= "^friends_sort_status",
			},
   		}
	},
}


--
UI.FriendsList_CancelBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "MsgBox_Btn",

		props =
		{
			name		= "InviteFriendWnd_CancelBtn",
		},

   		layers =
   		{
   			-- TEXT
   			{
   				id		= UI.MsgBox_Btn.layers.TEXT,
   				text	= "^cancel",
   			},
   		}
	},
}  


-- ---------------------------------------------------------------------------
-- UI.Hangar_FriendListBtn
-- ---------------------------------------------------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.InviteFriendWnd_AddToListBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectButtonWnd",

		props =
		{
			name	= "InviteFriendWnd_AddToListBtn"
		},

		layers =
		{
			numLayers = l_numBaseBtnLayers + 1,
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			main		= true,

    			effects =
    			{{
    				defName 			= "msgBox_btn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
							objName		= "value",
							layer		= "UI.InviteFriendWnd_AddToListBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND,
						}
					},
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
				text		= "^friend_list_add_to_list"
			},
		}
	},

	effectInfo =
	{
    	main =
		{
			animationIdle 			= "idle",
			animationSelect			= "over",
			animationPressed		= "select",
			animationDisabled		= "",
			animationIdle_focus 	= "",
			animationSelect_focus	= "",
			animationPressed_focus	= "",
		},
	},

	tooltipData = nil
}

--
UI.InviteFriendWnd_AddToListBtn.sounds = 
{
	over = "sound/ui/btnMouseOver",
}


--
function UI.InviteFriendWnd_AddToListBtn:F_OnMouseLButtonDown()

	local mainEffect = UI:GetEffectFromLayer( self, UI.InviteFriendWnd_AddToListBtn.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "press" )

	local filter = UI.FriendsListWnd:GetFilter()

	if filter == UI.FriendsListWnd.filterType.FRIENDS then
		UI.InviteFriendWnd:Show( UI.InviteFriendWnd.Modes.FRIEND )
	elseif filter == UI.FriendsListWnd.filterType.WATCH then	
		UI.InviteFriendWnd:Show( UI.InviteFriendWnd.Modes.WATCH )
	elseif filter == UI.FriendsListWnd.filterType.IGNORE then	
		UI.InviteFriendWnd:Show( UI.InviteFriendWnd.Modes.IGNORE )
	end

	return true

end


--
function UI.InviteFriendWnd_AddToListBtn:F_OnMouseIn()

	UI:PlayGlobalSound( self.sounds.over )
	local mainEffect = UI:GetEffectFromLayer( self, UI.InviteFriendWnd_AddToListBtn.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "over" )
	return true

end


--
function UI.InviteFriendWnd_AddToListBtn:F_OnMouseOut()

	local mainEffect = UI:GetEffectFromLayer( self, UI.InviteFriendWnd_AddToListBtn.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "idle" )
	return true

end


UI.InviteFriendWnd_AddToListBtn.layers = 
{
	MAIN_EFFECT = 0,
	DEBUG		= 1,
	TEXT		= 2,
}


UI.FriendsListTextWnd = {}
-- --------------------------
-- window definition
-- --------------------------
UI.FriendsListTextWnd.def =
{
	className = "Wnd",
	props =
	{
		name	= "FriendsListTextWnd",
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
				defName 			= "friends_list_text",
				defaultAnimation	= "idle",
				links =
				{
					{
						objName		= "text_1",	
						layer 		= "UI.FriendsListTextWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		-- TEXT 
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall" },
   			text			= "^invite_friends_wnd_caption"
		}
	}
}

--
UI.FriendsListTextWnd.layers = 
{
	MAIN_EFFECT 				= 0,
	TEXT 						= 1,
}

--
function UI.FriendsListTextWnd:GetTooltipData()
	local text = ""
	if UI:IsPlayerCanBeStudent() then
		text = UI:GetStringByName( "tooltip_student_text" )
		text = string.gsub( text, "%$max_rank%$", tostring( StudentMaxRank ) )
		return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				text = text,
				caption = UI:GetStringByName( "tooltip_student_caption" )
			}
	else
		if UI:IsPlayerCanBeTeacher() then
			text = UI:GetStringByName( "tooltip_teacher_text" )
		else
			text = UI:GetStringByName( "tooltip_not_teacher_text" )
			text = string.gsub( text, "%$min_rank%$", tostring( TeacherMinRank ) )
			text = string.gsub( text, "%$min_fights%$", tostring( TeacherMinFights ) )
		end
		return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				text = text,
				caption = UI:GetStringByName( "tooltip_teacher_caption" )
			}
	end
end

--
function UI.FriendsListTextWnd:SetMainText( text, isDisable )
	self:SetText( text, self.layers.TEXT )
	local maxFormatRect	= UI:Quat( 0, 0, 1024, 768 )
	local clipRect		= UI:Quat( 0, 0, 1024, 768 )
	local formatFlags	= FONT.TF_LEFT + FONT.TF_TOP + FONT.TF_SINGLELINE
	local hFont = self:GetFont( self.layers.TEXT ) 
	local width = _G.MeasureText( text, hFont, maxFormatRect, formatFlags, maxFormatRect ).z
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	width = width + mainEffect:GetObjPos( "text_1" ).x
	local height = mainEffect:GetObjSize( "self" ).y
	self:SetHeight( height )
	self:SetWidth( width )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if isDisable then
		mainEffect:StartAnimation( "disable" )
	else
		mainEffect:StartAnimation( "idle" )
	end
end



local l_numBaseCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )
UI.FriendsListCheckBoxWnd =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",
		props =
		{
			name		= "FriendsListCheckBoxWnd",
			selectSound	= UI.sounds.btnMouseOver,
			clickSound	= UI.sounds.checkBox,
		},
		layers =
		{
			numLayers = l_numBaseCheckBoxLayers + 1,
    		-- MAIN_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,			
    			main		= true,
    			effects =
    			{{
    				defName 			= "agreement_checkBox",
    				links =
    				{
    					{
    						objName		= "self_2",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},
    					{
    						objName		= "value",	
							layer		= "UI.FriendsListCheckBoxWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
    		-- TEXT
    		{
				id = l_numBaseCheckBoxLayers,
    			layerType	= UI.LAYER_TEXT,
       			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
       			formatInfoSz = { 1, 1 },
       			font =
    			{
       				fontName = "Small",
       			},
       			text 			= "^friends_teaching_request"
    		},
		}
	},
	layers =
	{
    	MAIN_EFFECT	= 0,
		DEBUG		= 1,
		TEXT		= 2,
	},
    effectInfo =
    {
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "idle_over",
    		animationPressed	= "idle_over",
    		animationDisabled	= "disable",
    	},

    	main_checked =
    	{
    		animationIdle 		= "chek",
    		animationSelect		= "chek_over",
    		animationPressed	= "chek_over",
    		animationDisabled	= "disable",
    	},
    }
}

--
function UI.FriendsListCheckBoxWnd:GetTooltipData()
	local tooltipData = nil
	if UI:IsPlayerCanBeStudent() then
		tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, text = UI:GetStringByName( "tooltip_friends_student_text" ), caption = UI:GetStringByName( "tooltip_friends_student_caption" ) }
	else
		tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, text = UI:GetStringByName( "tooltip_friends_teacher_text" ), caption = UI:GetStringByName( "tooltip_friends_teacher_caption" ) }
	end
	return tooltipData
end

--
function UI.FriendsListCheckBoxWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	if UI:IsPlayerCanBeStudent() then
		self:Check( _G.MasterServer_Teaching_IsAllowRequestsFromTeachers() )
	else
		self:Check( _G.MasterServer_Teaching_IsAllowRequestsFromStudents() )
	end
end

--
function UI.FriendsListCheckBoxWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	self:ToggleCheck()
	_G.MasterServer_Teaching_Allow( self:IsChecked() )
	return true
end


-- ---------------------------------------------------------------
-- UI.FriendsListWnd_FacebookBtn
-- ---------------------------------------------------------------

UI.FriendsListWnd_FacebookBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "FacebookBtn1",
    	props =
    	{
    		name	= "FriendsListWnd_FacebookBtn",
    	},
    },

	tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "option_facebookAddFriends" ), text = UI:GetStringByName( "option_facebookAddFriends_tooltipText" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}


-- -------------------------------------------------------------------
-- UI.FriendsListWnd_VkBtn
-- -------------------------------------------------------------------

UI.FriendsListWnd_VkBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "VKontakteBtn1",
    	props =
    	{
    		name	= "FriendsListWnd_VkBtn",
    	},
    },

    tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, caption = UI:GetStringByName( "option_vkontakteAddFriends" ), text = UI:GetStringByName( "option_vkontakteAddFriends_tooltipText" ) },

	GetTooltipData = function( self )
		return self.tooltipData
	end
}