-- ----------------------------------------------------------------------------
--
-- Workfile: clans_leaderboardswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

-- -----------------------------------------------------------------
-- UI.ClansLeaderboards_Wnd
-- -----------------------------------------------------------------

UI.ClansLeaderboards_Wnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.ClansLeaderboards_Wnd.def =
{
	className 	= "Wnd",
	props =
	{
		name			= "ClansLeaderboards_Wnd",
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
				defName				= "clan_members_leaderboard_main",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "tree",
						wnd			= "UI.ClansLeaderboards_CategoriesListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "list",
						wnd			= "UI.ClansMembersLeaderboard_ListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "line_1",
						wnd			= "UI.ClansMembersLeaderboard_MyRatingWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					--[[{
						objName		= "add_slot",
						wnd			= "UI.ClanExpand_Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},]]
				}
			}}
		},
	},
	children = { "UI.ClansLeaderboards_CategoriesListWnd", "UI.ClansMembersLeaderboard_ListWnd", "UI.ClansMembersLeaderboard_MyRatingWnd" }
}

UI.ClansLeaderboards_Wnd.layers = 
{
	MAIN_EFFECT 		= 0,
}


--
function UI.ClansLeaderboards_Wnd:OnLeaderboardCategorySelect()

	if self:IsOnScreen() then
		UI.ClansMembersLeaderboard_ListWnd:FullUpdate( true )
	end
	
end

-- ------------------------------
-- UI.CategoriesListWnd
-- ------------------------------

UI.CategoriesListWnd = {}
UI.CategoriesListWnd.def =
{
	className	= "Wnd",
	props =
	{
		name	= "CategoriesListWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		isPrototype = true,
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
				defName 			= "shop_categories_list",
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

UI.CategoriesListWnd.inited = false

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.CategoriesListWnd:AddRecord( data )
	local numRecords = #self.records
	local recordIdx = numRecords + 1
	local record = {}
	record.idx		= recordIdx
	record.data		= data
	local slotWnd = self:ObtainFreeSlotWnd( data.categoryType )
	if not slotWnd then
		sys.log( "UI.CategoriesListWnd:AddRecord()[ERROR]: cannot create slot for record" )
		return -1
	end
	slotWnd:SetupForRecord( recordIdx )	
	record.slotWnd = slotWnd
	table.insert( self.records, record )
	slotWnd:FullUpdate()
	return recordIdx
end

--
function UI.CategoriesListWnd:GetRecordData( recordIdx )
	local record = self.records[ recordIdx ]
	return record and record.data
end

--
function UI.CategoriesListWnd:GetNumTotalRecords()
	return #self.records
end

--
function UI.CategoriesListWnd:GetNumVisibleRecords()
	return #self.visibleRecordIds
end

--
function UI.CategoriesListWnd:IsAnimating()
    return self.state ~= self.states.IDLE	
end

--
function UI.CategoriesListWnd:GetSelectedMainCategoryRecord()
	return self.selMainCategoryRecordIdx
end

--
function UI.CategoriesListWnd:GetSelectedSubCategoryRecord()
	return self.selSubCategoryRecordIdx
end

--
function UI.CategoriesListWnd:GetSelectedMainCategory()
	local data = self:GetRecordData( self.selMainCategoryRecordIdx )
	return data and data.categoryInfo and data.categoryInfo.name or ""
end

--
function UI.CategoriesListWnd:GetSelectedSubCategory()
	local data = self:GetRecordData( self.selSubCategoryRecordIdx )
	return data and data.categoryInfo and data.categoryInfo.name or ""
end

--
function UI.CategoriesListWnd:SelectMainCategory( name, bAnimated, bSound )
	local recordIdx = -1
	if name ~= "" then
		recordIdx = self:FindRecordByCategoryName( name, UI.CategoriesListWnd.categoryTypes.MAIN )
		if recordIdx == -1 then
			sys.log( "UI.CategoriesListWnd:SelectedMainCategory()[ERROR]: cannot find record for category %s", tostring( name ) )
			return
		end
	end
	self:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound )
end

--
function UI.CategoriesListWnd:SelectSubCategory( name, parentName, bSound )
	local recordIdx = -1
	if name ~= "" then
		recordIdx = self:FindRecordByCategoryName( name, UI.CategoriesListWnd.categoryTypes.SUB, parentName )
		if recordIdx == -1 then
			sys.log( "UI.CategoriesListWnd:SelectedSubCategory()[ERROR]: cannot find record for subcategory \"%s.%s\"", tostring( parentName ), tostring( name ) )
			return
		end
		local selMainCategory = self:GetSelectedMainCategory() 
		if selMainCategory == "" or selMainCategory ~= parentName then
			sys.log( "UI.CategoriesListWnd:SelectedSubCategory()[ ERROR]: cannot select a subcategory with the parent category not being selected" )
			return
		end
	end
	self:SelectSubCategoryRecordInternal( recordIdx, bSound )
end

--
function UI.CategoriesListWnd:SelectRecord( recordIdx, bSelect, bAnimated, bSound, skipLeaderboardSelect )
	if recordIdx < 1 or recordIdx > #self.records then
		sys.log( "UI.CategoriesListWnd:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
		return
	end
	local data = self:GetRecordData( recordIdx )
	if data.categoryType == UI.CategoriesListWnd.categoryTypes.MAIN then
		self:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound, skipLeaderboardSelect )	
	elseif data.categoryType == UI.CategoriesListWnd.categoryTypes.SUB then
		if bSelect then
			self:SelectSubCategoryRecordInternal( recordIdx, bAnimated, bSound, skipLeaderboardSelect )	
		end
	end
end

--
function UI.CategoriesListWnd:IsRecordSelected( recordIdx )
	if recordIdx < 1 or recordIdx > #self.records then
		sys.log( "UI.CategoriesListWnd:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
		return false
	end
	return recordIdx == self.selMainCategoryRecordIdx or recordIdx == self.selSubCategoryRecordIdx
end 

--
function UI.CategoriesListWnd:Reset()
	for recordIdx, record in pairs( self.records ) do
		record.slotWnd:FullReset()
		record.slotWnd:UnlinkFromParent()		
	end
	self.records					= {}
	self.visibleRecordIds			= {}
	self.selMainCategoryRecordIdx	= -1
	self.selSubCategoryRecordIdx	= -1
	self.state						= self.states.IDLE
end

--
function UI.CategoriesListWnd:UpdateVisibleRecordsImmediate()
	self:ResetVisibleRecords()
	self.state = self.states.IDLE
	local selMainCategory = self:GetSelectedMainCategory()

	for recordIdx = 1, #self.records do
		local record = self.records[ recordIdx ]
		if record.data.categoryType == UI.CategoriesListWnd.categoryTypes.MAIN then
			table.insert( self.visibleRecordIds, recordIdx )
		elseif record.data.categoryType == UI.CategoriesListWnd.categoryTypes.SUB then
			if record.data.parentCategoryInfo.name == selMainCategory then
    			table.insert( self.visibleRecordIds, recordIdx )
			end
		end
	end
	
	for visIdx, recordIdx in pairs( self.visibleRecordIds ) do
		local record = self.records[ recordIdx ]
		local slotWnd = record.slotWnd
		self:AddChild( slotWnd )
		slotWnd:Select( recordIdx == self.selMainCategoryRecordIdx or recordIdx == self.selSubCategoryRecordIdx )
		slotWnd:SetAlpha( 1 )
		local y = self:GetAnchorPos( visIdx )
		slotWnd:SetTop( y )
	end	
end

--
function UI.CategoriesListWnd:OnRecordNewStateChanged( recordIdx )
	local slotWnd = self:GetSlotWndForRecord( recordIdx )
	if slotWnd then
		slotWnd:OnNewStateChanged()
	end
end

-- ------------------------------
-- const
-- ------------------------------

UI.CategoriesListWnd.layers =
{
	MAIN_EFFECT	= 0,
}
UI.CategoriesListWnd.states =
{
	IDLE		= 1,
	SHOW_SUB	= 2,
	HIDE_SUB	= 3,	
}
UI.CategoriesListWnd.effectInfo =
{
	main =
	{
		firstRecordObjName		= "button_1",
		secondRecordObjName		= "button_2",		
	}
}
UI.CategoriesListWnd.SHOW_SPEED	= 40	-- слотов/сек
UI.CategoriesListWnd.HIDE_SPEED	= 60	-- слотов/сек
UI.CategoriesListWnd.categoryTypes =
{
	MAIN	= 1,
	SUB		= 2,
}
UI.CategoriesListWnd.sounds =
{
	categoryMouseOver			= UI.sounds.btnMouseOver,
	categorySelect				= "sound/ui/btnClick",
	categoryDeselect			= "sound/ui/commonListClose",
	categorySelectAnimated		= "sound/ui/commonListOpen",
	categoryDeselectAnimated	= "sound/ui/commonListClose",
	categoryChangeAnimated		= "sound/ui/commonListOpen",
	itemMouseOver				= "sound/ui/btnMouseOver",
	itemSelect					= "sound/ui/btnClick",
	itemsScrollRange			= "sound/ui/btnMouseOver",
	itemsModeChange				= "sound/ui/btnClick",
	tradeModeChange				= "sound/ui/btnClick",
	tradeWndShow				= "sound/ui/btnClick",
	cannotTrade					= UI.sounds.invalid,
	mouseClick					= UI.sounds.btnClick,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.CategoriesListWnd.records					= {}
UI.CategoriesListWnd.visibleRecordIds			= {}
UI.CategoriesListWnd.selMainCategoryRecordIdx	= -1
UI.CategoriesListWnd.selSubCategoryRecordIdx	= -1
UI.CategoriesListWnd.state					= UI.CategoriesListWnd.states.IDLE
UI.CategoriesListWnd.allSlots					= {}
UI.CategoriesListWnd.firstRecordPos			= Vec2( 0, 0 )
UI.CategoriesListWnd.recordsDist				= 0
UI.CategoriesListWnd.animInfo =
{
    maxTime	 			= 0,
    elapsedTime			= 0,	
	mainRecordIdx		= 1,
    firstSubRecordIdx	= -1,
    lastSubRecordIdx	= -1,
    lastIdx				= -1,
    nextMainVisIdx		= -1,
	nextMainSrcPos		= 0,
	nextMainDstPos		= 0,
	bReversed			= false,
}
UI.CategoriesListWnd.inited = false

UI.CategoriesListWnd.categories = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.CategoriesListWnd:F_OnBeforeShowOnScreen()
	UI.Wnd.OnBeforeShowOnScreen( self )
	if not self.inited then
		self:UpdateCategories()
		--self:Init()
		self.inited = true
	end
	return true
end

--
function UI.CategoriesListWnd:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	self.allSlots = {}
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.firstRecordPos = mainEffect:GetObjPos( self.effectInfo.main.firstRecordObjName )
		local secondRecordPos = mainEffect:GetObjPos( self.effectInfo.main.secondRecordObjName )
		self.recordsDist = secondRecordPos.y - self.firstRecordPos.y
	end
end

--
function UI.CategoriesListWnd:UpdateCategories( categoryName )
	if categoryName then
		self.categories = categoryName
	end
	local categories = _G[ self.categories ]
	if not categories then
		return
	end

	self:Reset()

	for mainCategoryIdx = 1, #categories do		
		local mainCategoryInfo = categories[ mainCategoryIdx ]
		if mainCategoryInfo.shop ~= false then

    		local mainData = {}
    		mainData.categoryType		= self.categoryTypes.MAIN
    		mainData.categoryInfo 		= {}
    		mainData.categoryInfo.name	= mainCategoryInfo.name
    		mainData.filters			= mainCategoryInfo.filters
    		mainData.hasSubCategories	= false
    		mainData.type 				= mainCategoryInfo.type or "string"
    		mainData.entityType			= mainCategoryInfo.entityType or MasterServer.LeaderboardEntityType.LET_PLAYER
			mainData.bReward			= mainCategoryInfo.reward or false
			mainData.bGold				= mainCategoryInfo.highlight or false
    		self:AddRecord( mainData )

    		local subCategories = mainCategoryInfo.subCategories
    		if subCategories then
    			for subCategoryIdx = 1, #subCategories do
    				local subCategoryInfo = subCategories[ subCategoryIdx ]
					if subCategoryInfo.shop ~= false then
						mainData.hasSubCategories	= true;
                		local subData = {}
                		subData.categoryType		= self.categoryTypes.SUB
        				subData.categoryInfo		= {}
        				subData.categoryInfo.name 	= subCategoryInfo.name
        				subData.type 				= subCategoryInfo.type or "string"
        				subData.entityType			= subCategoryInfo.entityType or MasterServer.LeaderboardEntityType.LET_PLAYER
						subData.bReward				= subCategoryInfo.reward or false
						subData.bGold				= subCategoryInfo.highlight or false
        				subData.parentCategoryInfo	= mainCategoryInfo
        				self:AddRecord( subData )
					end
    			end
    		else
    		end				
		end
	end

	self:SelectRecord( 1, true, false, false, true )
end

--
function UI.CategoriesListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if wnd.CATEGORY_SLOT then
		if not self:IsAnimating() then
    		local recordIdx = wnd:GetRecord()
			self:SelectRecord( recordIdx, not self:IsRecordSelected( recordIdx ), true, true )			
		end
	end
	return true
end

--
function UI.CategoriesListWnd:ObtainFreeSlotWnd( categoryType )
	local slotsByCategory = self.allSlots[ categoryType ]
	if not slotsByCategory then
		slotsByCategory = {}
		self.allSlots[ categoryType ] = slotsByCategory
	end
	local slotWnd = nil
	for idx, slot in pairs( slotsByCategory ) do
		if slot.recordIdx == -1 then
			slotWnd = slot
			break
		end
	end
	if not slotWnd then
		slotWnd = self:CreateSlotWnd( categoryType )
		if slotWnd then
			table.insert( slotsByCategory, slotWnd )
		end
	end
	return slotWnd
end

--
function UI.CategoriesListWnd:CreateSlotWnd( categoryType )
	local proto = nil

	if categoryType == UI.CategoriesListWnd.categoryTypes.MAIN then
		proto = UI.CategoriesList_SlotWnd_main
	elseif categoryType == UI.CategoriesListWnd.categoryTypes.SUB then
		proto = UI.CategoriesList_SlotWnd_sub
	else
		sys.log( "UI.CategoriesListWnd:CreateSlotWnd()[ERROR]: cannot find prototype slot for category %s", tostring( categoryType ) )
		return nil
	end

	local slotsByCategory = self.allSlots[ categoryType ]
	local numSlots = slotsByCategory and #slotsByCategory or 0
	local slotWnd = UI:CreateChildWnd( self, proto, numSlots + 1 )
	slotWnd.parent = self
	slotWnd:SetLeft( self.firstRecordPos.x )
	return slotWnd

end

--
function UI.CategoriesListWnd:FindRecordByCategoryName( name, categoryType, parentName )
	for recordIdx, record in pairs( self.records ) do
		if record.data.categoryType == categoryType and record.data.categoryInfo.name == name and ( categoryType == UI.CategoriesListWnd.categoryTypes.MAIN or record.data.parentCategoryInfo.name == parentName ) then
			return recordIdx
		end
	end
	return 	-1
end

--
function UI.CategoriesListWnd:SelectSubCategoryRecordInternal( recordIdx, bSound )
	if recordIdx == self.selSubCategoryRecordIdx then
		return
	end	
	local oldRecordIdx = self.selSubCategoryRecordIdx
	self.selSubCategoryRecordIdx = recordIdx
	if oldRecordIdx ~= -1 then
		self.records[ oldRecordIdx ].slotWnd:Select( false )
	end
	if self.selSubCategoryRecordIdx ~= -1 then
		self.records[ self.selSubCategoryRecordIdx ].slotWnd:Select( true )
	end
	if bSound and self:IsOnScreen() then
		local sound = recordIdx == -1 and self.sounds.categoryDeselect or self.sounds.categorySelect
		UI:PlayGlobalSound( sound )
	end
	--UI.ProfileAchievements_List:FullUpdate()
	if self.mainWnd and not skipLeaderboardSelect then
		self.mainWnd:OnLeaderboardCategorySelect()
	end
	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selSubCategoryRecordIdx, oldRecordIdx, 0, 0 )	
end

--
function UI.CategoriesListWnd:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound, skipLeaderboardSelect )
	if recordIdx == self.selMainCategoryRecordIdx and -1 == self.selSubCategoryRecordIdx then
		return
	end
	-- по умолчанию при выборе главной категории ни одна подкатегория не выбрана;
	-- при развыборе выделение с подкатегории также снимается
	self:SelectSubCategoryRecordInternal( -1 )	
	if recordIdx == self.selMainCategoryRecordIdx then
		bAnimated = false
	end
	-- немедленно завершается предыдущая анимация, если была;
	-- но вообще-то такой ситуаии нельзя допускать
	if self:IsAnimating() then
		sys.log( "UI.CategoriesListWnd:SelectMainCategoryRecordInternal()[WARNING]: already animating")
		self:UpdateVisibleRecordsImmediate()
	end
	local oldRecordIdx = self.selMainCategoryRecordIdx
	self.selMainCategoryRecordIdx = recordIdx
	local sound = self.sounds.mouseClick

	if not bAnimated then
		self:UpdateVisibleRecordsImmediate()
	else
		-- показать
		if oldRecordIdx == -1 then
			self:ShowSubCategoriesAnimated( recordIdx )
		-- скрыть
		elseif recordIdx == -1 then
			self:HideSubCategoriesAnimated( oldRecordIdx )
		-- сменить; для этого сначала скрыть предыдущее
		else
			self:HideSubCategoriesAnimated( oldRecordIdx )
		end	
	end

	if bSound and self:IsOnScreen() and sound ~= "" then
		UI:PlayGlobalSound( sound )
	end
	--UI.ProfileAchievements_List:FullUpdate()
	local data = self:GetRecordData( recordIdx )
	if data.hasSubCategories then
		self:SelectSubCategoryRecordInternal( recordIdx + 1 )
	else
		if self.mainWnd and not skipLeaderboardSelect then
			self.mainWnd:OnLeaderboardCategorySelect()
		end
		UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selMainCategoryRecordIdx, oldRecordIdx, 0, 0 )		
	end
end

--
function UI.CategoriesListWnd:ShowSubCategoriesAnimated( mainRecordIdx )
	if mainRecordIdx == -1 then
		sys.log( "UI.CategoriesListWnd:ShowSubCategoriesAnimated()[ERROR]: invalid record index" )
		return
	end
	self.state = self.states.SHOW_SUB
	-- выделение сллота категории
	local selSlotWnd = self:GetSlotWndForRecord( mainRecordIdx )
	if not selSlotWnd then
		return
	end
	selSlotWnd:Select( true )
	local firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx = self:GetRecordsForAnimating( mainRecordIdx )
	-- нет подкатегорий
	if firstSubRecordIdx == -1 then		
		self:OnStopAnimation()
		return
	end
	-- подкатегории уже открыты - ошибка!
	local firstSubVisIdx = self:Record2VisIdx( firstSubRecordIdx )
	if firstSubVisIdx ~= -1 then
		sys.log( "UI.CategoriesListWnd:ShowSubCategoriesAnimated()[ERROR]: subcategories are already open" )
		self:OnStopAnimation()
		return
	end
	local mainVisIdx = self:Record2VisIdx( mainRecordIdx ) 

	for subRecordIdx = firstSubRecordIdx, lastSubRecordIdx do
		local subVisIdx = mainVisIdx + ( subRecordIdx - mainRecordIdx )
		table.insert( self.visibleRecordIds, subVisIdx, subRecordIdx )
		local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
		self:AddChild( subSlotWnd )
		subSlotWnd:SetAlpha( 0 )
		subSlotWnd:Enable( false )
		local y = self:GetAnchorPos( subVisIdx )
		subSlotWnd:SetTop( y )
	end

	local numSubCategories = ( lastSubRecordIdx - firstSubRecordIdx + 1 )
	self.animInfo.maxTime	 		= numSubCategories / self.SHOW_SPEED
	self.animInfo.elapsedTime		= 0
	self.animInfo.mainRecordIdx		= mainRecordIdx
	self.animInfo.firstSubRecordIdx	= firstSubRecordIdx
	self.animInfo.lastSubRecordIdx	= lastSubRecordIdx
	self.animInfo.lastIdx			= 1
	self.animInfo.nextMainVisIdx	= self:Record2VisIdx( nextMainRecordIdx ) 
	self.animInfo.bReversed			= false

	if nextMainRecordIdx ~= -1 then
    	self.animInfo.nextMainSrcPos	= self:GetAnchorPos( self:Record2VisIdx( firstSubRecordIdx ) )
    	self.animInfo.nextMainDstPos	= self:GetAnchorPos( self.animInfo.nextMainVisIdx )
	end
end

--
function UI.CategoriesListWnd:HideSubCategoriesAnimated( mainRecordIdx )
	if mainRecordIdx == -1 then
		sys.log( "UI.CategoriesListWnd:HideSubCategoriesAnimated()[ERROR]: invalid record index" )
		return
	end
	self.state = self.states.HIDE_SUB
	local firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx = self:GetRecordsForAnimating( mainRecordIdx )
	-- нет подкатегорий
	if firstSubRecordIdx == -1 then		
		self:OnStopAnimation( mainRecordIdx )
		return
	end
	-- подкатегории уже скрыты - ошибка!
	local firstSubVisIdx = self:Record2VisIdx( firstSubRecordIdx )
	if firstSubVisIdx == -1 then
		sys.log( "UI.CategoriesListWnd:HideSubCategoriesAnimated()[ERROR]: subcategories are not open" )
		self:OnStopAnimation()
		return
	end
	for subRecordIdx = firstSubRecordIdx, lastSubRecordIdx do
		local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
		subSlotWnd:Enable( false )
	end

	local numSubCategories = ( lastSubRecordIdx - firstSubRecordIdx + 1 )
	self.animInfo.maxTime	 		= numSubCategories / self.HIDE_SPEED
	self.animInfo.elapsedTime		= 0	
	self.animInfo.mainRecordIdx		= mainRecordIdx
	self.animInfo.firstSubRecordIdx	= firstSubRecordIdx
	self.animInfo.lastSubRecordIdx	= lastSubRecordIdx
	self.animInfo.lastIdx			= numSubCategories
	self.animInfo.nextMainVisIdx	= self:Record2VisIdx( nextMainRecordIdx ) 
	self.animInfo.bReversed			= true

	if nextMainRecordIdx ~= -1 then
    	self.animInfo.nextMainSrcPos	= self:GetAnchorPos( self.animInfo.nextMainVisIdx )
    	self.animInfo.nextMainDstPos	= self:GetAnchorPos( self:Record2VisIdx( firstSubRecordIdx ) )
	end
end

--
function UI.CategoriesListWnd:UpdateAnimation( dt )

	self.animInfo.elapsedTime = self.animInfo.elapsedTime + dt

	local t0 = UI:Clamp( self.animInfo.elapsedTime / self.animInfo.maxTime, 0, 1 )
	local t = self.animInfo.bReversed and 1 - t0 or t0

	local numSubRecords = self.animInfo.lastSubRecordIdx - self.animInfo.firstSubRecordIdx + 1
	local records_t = numSubRecords * t

	local prevIdx = math.floor( records_t )
	local curIdx = UI:Clamp( prevIdx + 1, 1, numSubRecords )

	-- предыдущие субкатегории полностью выводятся из альфы

	if curIdx ~= self.animInfo.lastIdx then

		for idx = self.animInfo.lastIdx, prevIdx do
			local recordIdx = self.animInfo.firstSubRecordIdx + idx - 1
			local record = self.records[ recordIdx ]
			record.slotWnd:SetAlpha( 1 )
		end

		self.animInfo.lastIdx = curIdx

	end

	-- альфа текущей субкатегории

	local curRecord_t = UI:Clamp( records_t - ( curIdx - 1 ), 0, 1 )
	local curRecordIdx = self.animInfo.firstSubRecordIdx + curIdx - 1
	local curRecord = self.records[ curRecordIdx ]
	curRecord.slotWnd:SetAlpha( curRecord_t )

	-- позиция всех нижележащих слотов

	if self.animInfo.nextMainVisIdx ~= -1 then
    	local y = UI:Lerp( self.animInfo.nextMainSrcPos, self.animInfo.nextMainDstPos, t0 )
    	self:SetUnderlyingRecordsPos( self.animInfo.nextMainVisIdx, y )
	end

	-- завершение анимации
	if t0 >= 1 then
		self:OnStopAnimation()
	end

end


--
function UI.CategoriesListWnd:OnStopAnimation( recordIdx )

	if self.state == self.states.SHOW_SUB then

		self.state = self.states.IDLE

		-- возвращение возможности слотам подкатегорий реагировать на инпут
		if self.animInfo.firstSubRecordIdx ~= -1 then

    		for subRecordIdx = self.animInfo.firstSubRecordIdx, self.animInfo.lastSubRecordIdx do
    			local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
    			if subSlotWnd then
    				subSlotWnd:Enable( true ) 
    			end
    		end

		end


	elseif self.state == self.states.HIDE_SUB then

		self.state = self.states.IDLE

		-- развыделение старого слота категории
		if self.animInfo.mainRecordIdx ~= -1 then
			local oldSelSlotWnd
			if recordIdx then
				oldSelSlotWnd = self:GetSlotWndForRecord( recordIdx )
			else
	    		oldSelSlotWnd = self:GetSlotWndForRecord( self.animInfo.mainRecordIdx )
	    	end
			oldSelSlotWnd:Select( false )
		else
		end

		-- подкатегории убираются из визуального списка
		if self.animInfo.firstSubRecordIdx ~= -1 then

    		for subRecordIdx = self.animInfo.firstSubRecordIdx, self.animInfo.lastSubRecordIdx do

    			local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
    			if subSlotWnd then
	    			subSlotWnd:PartialReset()
					subSlotWnd:UnlinkFromParent()
				end

    		end

			local newVisibleRecordIds = {}

    		for visIdx = 1, #self.visibleRecordIds do
				local recordIdx = self.visibleRecordIds[ visIdx ]

    			if not( recordIdx >= self.animInfo.firstSubRecordIdx and recordIdx <= self.animInfo.lastSubRecordIdx ) then
					table.insert( newVisibleRecordIds, recordIdx )
    			end
    		end

			self.visibleRecordIds = newVisibleRecordIds

		end	

		-- разворачивание подгатегорий для новой выбранной категории
    	if self.selMainCategoryRecordIdx ~= -1 then			
			self:ShowSubCategoriesAnimated( self.selMainCategoryRecordIdx )
		end

	end

end    


--
function UI.CategoriesListWnd:ResetVisibleRecords()

	for visIdx, recordIdx in pairs( self.visibleRecordIds ) do

		local record = self.records[ recordIdx ]
		local slotWnd = record.slotWnd

		slotWnd:PartialReset()
		slotWnd:UnlinkFromParent()

	end

	self.visibleRecordIds = {}

end


--
function UI.CategoriesListWnd:GetAnchorPos( visIdx )

    return self.firstRecordPos.y + self.recordsDist * ( visIdx - 1 )

end


--
function UI.CategoriesListWnd:Record2VisIdx( recordIdx )

	if recordIdx == -1 then
		return -1
	end

	for visIdx, _recordIdx in pairs( self.visibleRecordIds ) do
		if _recordIdx == recordIdx then
			return visIdx
		end
		
	end

	return -1

end


--
function UI.CategoriesListWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.state ~= self.states.IDLE then
		self:UpdateAnimation( dt_sys )		
	end

end


--
function UI.CategoriesListWnd:SetUnderlyingRecordsPos( topVisIdx, y )

	for visIdx = topVisIdx, #self.visibleRecordIds do

		local recordIdx = self.visibleRecordIds[ visIdx ]
		local record = self.records[ recordIdx ]

		local recordY = y + ( visIdx - topVisIdx ) * self.recordsDist
		record.slotWnd:SetTop( recordY )	

	end

end


--
function UI.CategoriesListWnd:GetRecordsForAnimating( mainRecordIdx )

	local firstSubRecordIdx		= -1
	local lastSubRecordIdx		= -1
	local nextMainRecordIdx		= -1

	for recordIdx = mainRecordIdx + 1, #self.records do

		local record = self.records[ recordIdx ]

		if record.data.categoryType == UI.CategoriesListWnd.categoryTypes.MAIN then
			nextMainRecordIdx = recordIdx
			break
		end

		if firstSubRecordIdx == -1 then
			firstSubRecordIdx = recordIdx
		end

		lastSubRecordIdx = recordIdx

	end

	return firstSubRecordIdx, lastSubRecordIdx, nextMainRecordIdx

end


--
function UI.CategoriesListWnd:GetSlotWndForRecord( recordIdx )

	local record = self.records[ recordIdx ]
	return record and record.slotWnd

end

-- -------------------------------------------------------------------
-- UI.CategoriesList_SlotWnd
-- -------------------------------------------------------------------

UI.CategoriesList_SlotWnd = {}
local scs = UI.CategoriesList_SlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

local l_numCheckBoxBaseLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.CategoriesList_SlotWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",
	
	props =
	{
		name		= "CategoriesList_SlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numCheckBoxBaseLayers + 2,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},
		
		-- GOLD_EFFECT
		{
			id			= l_numCheckBoxBaseLayers,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_categories_slot_gold",
				defaultAnimation	= "idle",
			}}
		},

		--[[-- SALE_EFFECT
		{
			id			= l_numCheckBoxBaseLayers,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_categories_slot_sale",
				defaultAnimation	= "idle",
			}}
		},

		-- NEW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_categories_slot_new",
				defaultAnimation	= "idle",
			}}
		},]]

		-- NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	}
} 

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.CategoriesList_SlotWnd:SetupForRecord( recordIdx )

	self.recordIdx = recordIdx

end


--
function UI.CategoriesList_SlotWnd:GetRecord()
         	
	return self.recordIdx

end


--
function UI.CategoriesList_SlotWnd:FullUpdate()

	local data = self:GetRecordData()
	if not data then
		sys.log( "UI.CategoriesList_SlotWnd:FullUpdate()[ERROR]: nil data" )
		return
	end

	self:UpdateName( data )
	self:UpdateIco( data )
	--self:UpdateNewState( data )
	--self:UpdateSaleState( data )
	self:UpdateTooltip( data )
	self:UpdateGoldEffect( data )

end


--
function UI.CategoriesList_SlotWnd:FullReset()

	self.recordIdx = -1

	self:SetText( "", self.layers.NAME )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:Select( false )
	self:SetAlpha( 1 )
	self:Enable( true )

	self:SetTooltipData( {} )

end


--
function UI.CategoriesList_SlotWnd:PartialReset()

	self:Select( false )
	self:SetAlpha( 1 )
	self:Enable( true )

end


--
function UI.CategoriesList_SlotWnd:Select( bSelect )

	self:Check( bSelect )

end


--
function UI.CategoriesList_SlotWnd:IsSelected()

	return self:IsChecked()

end


--
function UI.CategoriesList_SlotWnd:OnNewStateChanged()

	local data = self:GetRecordData()

	if data then
		self:UpdateNewState( data )
	end

end


-- alpha - от 0 до 1
function UI.CategoriesList_SlotWnd:SetAlpha( alpha )

	-- спрайт, использующийся для обозначения наведения мышью, рисуется с блендом COLOR_ADD, поэтому смена альфы на него не повлияет;
	-- однако во время анимации слотов, в кооторой и задействована смена альфы, у слота должен быть предварительно выставлен
	-- стиль WS_DISABLE, поэтому проблемы с данным спрайтом не должно возникнуть

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAlpha( alpha * 255 )
	end

end


-- ------------------------------
-- const
-- ------------------------------

scs.layers =
{
    MAIN_EFFECT		= 0,
	DEBUG			= 1,
	GOLD_EFFECT		= 2,
    NAME			= 3,
}

scs.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "over",
		animationDisabled	= "idle",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "sel_over",
		animationPressed	= "sel_over",
		animationDisabled	= "select",
	},

	icoSpriteName	= "ico"
}

scs.CATEGORY_SLOT = true

-- ------------------------------
-- vars
-- ------------------------------

scs.recordIdx	= -1
scs.tooltipData	= {}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.CategoriesList_SlotWnd:F_PostLoad()

	UI.EffectCheckBoxWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end
	
	self:FullReset()

end


--
function UI.CategoriesList_SlotWnd:GetRecordData()
	local data = self.parent:GetRecordData( self.recordIdx )
	return data
end


--
function UI.CategoriesList_SlotWnd:UpdateName( data )

	local localizedName = UI:GetStringByName( "leaderboard_"..data.categoryInfo.name.."_name" )
	self:SetText( localizedName, self.layers.NAME )

end


--
function UI.CategoriesList_SlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end	

	local hTex = UI:GetTex( data.categoryInfo.name.."_icon" )
	mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName, hTex )

end


--
function UI.CategoriesList_SlotWnd:UpdateNewState( data )

	--self:SetLayerVisible( data.new > 0, self.layers.NEW_EFFECT )
	return false

end


--
function UI.CategoriesList_SlotWnd:UpdateSaleState( data )

	--self:SetLayerVisible( data.sale > 0, self.layers.SALE_EFFECT )

end


--
function UI.CategoriesList_SlotWnd:UpdateTooltip( data )

	text = UI:GetStringByName( "leaderboard_"..data.categoryInfo.name.."_desc" )
	caption = UI:GetStringByName( "leaderboard_"..data.categoryInfo.name.."_name" )
	self.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, text = text, caption = caption }

end


--
function UI.CategoriesList_SlotWnd:UpdateGoldEffect( data )

	-- сейчас не предусмотрено, что этот эффект будет на подкатегории;
	-- для корректного отображения на подкатегории нужна отдельная анимация + прилинковать эффект в дочернем классе субкатегории

	local bGold = data.bGold == true
	self:SetLayerVisible( bGold, self.layers.GOLD_EFFECT )	

end


--
function UI.CategoriesList_SlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self:IsOnScreen() and not UI.CategoriesListWnd:IsAnimating() then
		UI:PlayGlobalSound( UI.CategoriesListWnd.sounds.categoryMouseOver )
	end

	return true

end


--
function UI.CategoriesList_SlotWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.CategoriesList_SlotWnd:GetTooltipData()

	return self.tooltipData
	
end


-- -------------------------------------------------------------------
-- UI.CategoriesList_SlotWnd_main
-- -------------------------------------------------------------------

UI.CategoriesList_SlotWnd_main =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "CategoriesList_SlotWnd",
    	
    	props =
    	{
    		name		= "CategoriesList_SlotWnd_main",
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
    				defName 			= "shop_categories_slotMain",
    				defaultAnimation	= "idle",


    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					--[[{
    						objName		= "sale",	
    						layer		= "UI.Shop_CategoriesSlotWnd.layers.SALE_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "new",	
    						layer		= "UI.Shop_CategoriesSlotWnd.layers.NEW_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},]]

    					{
    						objName		= "value",
    						layer		= "UI.CategoriesList_SlotWnd_main.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
						
						{
    						objName		= "gold",	
    						layer		= "UI.StoreCategoriesSlotWnd.layers.GOLD_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
    					},
    				}
				}}
    		},
		}
	}
}

-- -------------------------------------------------------------------
-- UI.CategoriesList_SlotWnd_sub
-- -------------------------------------------------------------------

UI.CategoriesList_SlotWnd_sub =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "CategoriesList_SlotWnd",
    	
    	props =
    	{
    		name		= "CategoriesList_SlotWnd_sub",
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
    				defName 			= "shop_categories_slotSub",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					--[[{
    						objName		= "sale",	
    						layer		= "UI.Shop_CategoriesSlotWnd.layers.SALE_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "new",	
    						layer		= "UI.Shop_CategoriesSlotWnd.layers.NEW_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},]]

    					{
    						objName		= "value",
    						layer		= "UI.CategoriesList_SlotWnd_sub.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
				}}
    		},
		}
	}
}


-- -----------------------------------------------------------------
-- UI.LeaderboardList
-- -----------------------------------------------------------------
UI.LeaderboardList = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.LeaderboardList.layers = 
{
	MAIN_EFFECT 			= 0,
	HEADER_EFFECT			= 1,
	PLACE					= 2,
	NAME					= 3,
	VALUE					= 4,
	LOADING_EFFECT 			= 5,
}

UI.LeaderboardList.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3Wnd",
	props =
	{
		name			= "LeaderboardList",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype 	= true,
	},	
	layers =
	{
		firstOverlayLayer = UI.LeaderboardList.layers.LOADING_EFFECT,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			effects =
			{{
				defName				= "clan_members_leaderboard_list",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "header",
						layer		= "UI.LeaderboardList.layers.HEADER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "loading3",
						layer		= "UI.LeaderboardList.layers.LOADING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		-- HEADER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "clan_members_leaderboard_list_header",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "rating",
						layer		= "UI.LeaderboardList.layers.PLACE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "name",
						layer		= "UI.LeaderboardList.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "data",
						layer		= "UI.LeaderboardList.layers.VALUE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
				}
			}}
		},
		-- PLACE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^clans_leaderboard_sort_place"
		},
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= "^clans_leaderboard_sort_name"
		},
		-- VALUE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
   			text			= ""
		},
		-- LOADING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			effects =
			{{
				defName				= "hangar_waitCircleLarge",
				defaultAnimation    = "idle",
			}}
		}
	},
}

-- -----------------------------------
-- interface function
-- -----------------------------------

--
function UI.LeaderboardList:GetType()

	return self.currentType

end

--
function UI.LeaderboardList:SetType( type )

	if self.currentType ~= type then
		self.currentType = type
		self:FullUpdate( true )
	end

end


--
function UI.LeaderboardList:SetUid( uid )

	if uid ~= self.uid then
	
		self.uid = uid
		
		if self:IsOnScreen() then
			self:FullUpdate( true )
		end
		
	end
	
end


--
function UI.LeaderboardList:GetUid()

	return self.uid
	
end


-- -----------------------------------
-- const
-- -----------------------------------

UI.LeaderboardList.btnPrototypeName	= "ClansMembersLeaderboardList_SlotWnd"

UI.LeaderboardList.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "line_",
		scrollObjName		= "scroll_max",
	}
}

UI.LeaderboardList.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

UI.LeaderboardList.MAX_SLOTS = 11
UI.LeaderboardList.REQUEST_LONG_TIME_OUT = 5.0
UI.LeaderboardList.REQUEST_SHORT_TIME_OUT = 1.5
UI.LeaderboardList.RANGE_CHANGE_DELAY = 0.5
UI.LeaderboardList.ADDITIONAL_RANGE = 10
UI.LeaderboardList.ADDITIONAL_DATA_REQUEST_TIMEOUT = 20
UI.LeaderboardList.Modes = 
{
	CLANS 				= 0,
	USERS 				= 1,
	LEAGUE 				= 2,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.LeaderboardList.currentType					= nil
UI.LeaderboardList.isInited						= false
UI.LeaderboardList.requestLastTime				= -UI.LeaderboardList.REQUEST_LONG_TIME_OUT
UI.LeaderboardList.needRequest					= false
UI.LeaderboardList.internalRequestId 			= nil
UI.LeaderboardList.data 						= {}
UI.LeaderboardList.waitClanNameRequest 			= false
UI.LeaderboardList.waitLeagueNameRequest 		= false
UI.LeaderboardList.tryUpdate 					= false
UI.LeaderboardList.numRecords 					= 0
UI.LeaderboardList.firstVisibleRecord 			= nil
UI.LeaderboardList.lastVisibleRecord 			= nil
UI.LeaderboardList.visibleRangeChangeTime 		= nil
UI.LeaderboardList.additionDataRequestTime 	= -UI.LeaderboardList.ADDITIONAL_DATA_REQUEST_TIMEOUT
UI.LeaderboardList.mode 						= nil
UI.LeaderboardList.myRatingLine 				= nil
UI.LeaderboardList.skipViewChange 				= false
UI.LeaderboardList.clanMembersRequestId			= nil
UI.LeaderboardList.uid							= UI.INVALID_U64_ID

UI.LeaderboardList.sounds =
{
	itemsScrollRange			= "sound/ui/btnMouseOver",
}

--
function UI.LeaderboardList:SetMode( mode )
	self.mode = mode
end

--
function UI.LeaderboardList:GetMode()
	return self.mode
end

--
function UI.LeaderboardList:StartWait()
	self:SetLayerVisible( true, self.layers.LOADING_EFFECT )
end

--
function UI.LeaderboardList:StopWait()
	self:SetLayerVisible( false, self.layers.LOADING_EFFECT )
end

--
function UI.LeaderboardList:OnRequestLeaderboardError( data, result )
	UI.LeaderboardWnd:ShowError( result )
	self:StopWait()
end

--
function UI.LeaderboardList:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )
	if not self:IsOnScreen() then
		return false
	end
	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	local oldFirstVisibleRecordIdx, oldLastVisibleRecordIdx = self:GetVisibleRange()
	self:ScrollVisibleRange( ticks < 0 )
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= oldFirstVisibleRecordIdx then
		UI:PlayGlobalSound( self.sounds.itemsScrollRange )
	end
	return true
end

--
function UI.LeaderboardList:OnRequestLeaderboard( data )

	--sys.log( "Receive leaderboard data" )
	if self:IsOnScreen() then
		if self.internalRequestId == data.internalRequestId then
			self.data = data
			UI.LeaderboardList.requestLastTime = _G.TimerGetRealTime()
			if self.data.maxRecordsCount and self.data.myRecord then
				UI.LeaderboardList.additionDataRequestTime = _G.TimerGetRealTime()
			else
				if self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN then
					local myCid = UI:GetPlayerClanByUid( self.uid )
					if myCid ~= UI.INVALID_U64_ID then
						for i = 1, #self.data.records do
							if self.data.records[ i ].e == myCid then
								self.data.myRecord = self.data.records[ i ]
							end
						end
					end
				elseif self.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER or self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
					for i = 1, #self.data.records do
						if self.data.records[ i ].e == self.uid then
							self.data.myRecord = self.data.records[ i ]
						end
					end
				elseif self.entityType == MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM then
					if UI.Arena:IsInTeam() and not UI.Arena:IsTeamMajor() then
						for i = 1, #self.data.records do
							if self.data.records[ i ].e == UI.Arena:GetTeamId() then
								self.data.myRecord = self.data.records[ i ]
							end
						end
					end
				elseif self.entityType == MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
					if UI.Arena:IsInTeam() and UI.Arena:IsTeamMajor() then
						for i = 1, #self.data.records do
							if self.data.records[ i ].e == UI.Arena:GetTeamId() then
								self.data.myRecord = self.data.records[ i ]
							end
						end
					end
				end
			end
			self:ReloadCurrentList()
			self.internalRequestId = nil
		elseif self.myPosSubRequest == data.internalRequestId then
			self.data = data
			local pos = self.data.myRecord.p
			local start = math.max( pos - math.floor( self.MAX_SLOTS / 2 ), 0 )
			UI.LeaderboardList.requestLastTime = -UI.LeaderboardList.REQUEST_SHORT_TIME_OUT
			UI.LeaderboardList.additionDataRequestTime = _G.TimerGetRealTime()
			self.skipViewChange = true
			self:SetScrollPos( start + 1, true, false )
			self.skipViewChange = false
			self:RequestLeaderboard( true )
			self.myPosSubRequest = nil
		elseif self.friendsRequestId == data.internalRequestId then 
			self.data = data
			local function SortFunc( info1, info2 )
				if info1.p == -1 then
					return false
				elseif info2.p == -1 then
					return true
				elseif info1.p == info2.p then
					return info1.e < info2.e
				else
					return info1.p < info2.p
				end
			end
			table.sort( self.data.records, SortFunc )
			UI.LeaderboardList.requestLastTime = _G.TimerGetRealTime()
			for i = 1, #self.data.records do
				if self.data.records[ i ].e == self.uid then
					self.data.myRecord = self.data.records[ i ]
				end
			end
			self.skipViewChange = true
			self:SetNumRecords( #self.data.records or 0 )
			self.skipViewChange = false
			self:ReloadCurrentList()
			self.friendsRequestId = nil
		elseif self.clanMembersRequestId == data.internalRequestId then 
			self.data = data
			local function SortFunc( info1, info2 )
				if info1.p == -1 then
					return false
				elseif info2.p == -1 then
					return true
				elseif info1.p == info2.p then
					return info1.e < info2.e
				else
					return info1.p < info2.p
				end
			end
			table.sort( self.data.records, SortFunc )
			UI.LeaderboardList.requestLastTime = _G.TimerGetRealTime()
			for i = 1, #self.data.records do
				if self.data.records[ i ].e == self.uid then
					self.data.myRecord = self.data.records[ i ]
				end
			end
			self.skipViewChange = true
			self:SetNumRecords( #self.data.records or 0 )
			self.skipViewChange = false
			self:ReloadCurrentList()
			self.clanMembersRequestId = nil
		end
	end
end

--
function UI.LeaderboardList:MasterServer_OnLeagueTeamNameUpdate( result, requestId, cid, nickName )
	if self.waitLeagueNameRequest then
		self.waitLeagueNameRequest = false
		self.tryUpdate = true
	end
end

--
function UI.LeaderboardList:MasterServer_OnNickNameUpdate( result, requestId, cid, nickName )
	if self.waitPlayerNameRequest then
		self.waitPlayerNameRequest = false
		self.tryUpdate = true
	end
end

--
function UI.LeaderboardList:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )
	if self.waitClanNameRequest then
		self.waitClanNameRequest = false
		self.tryUpdate = true
	end
end

--
function UI.LeaderboardList:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	if field == MasterServer.UserProfileField.UPF_CLAN_ID then
		if self.waitClanNameRequest then
			self.waitClanNameRequest = false
			self.tryUpdate = true
		end
	end
end

--
function UI.LeaderboardList:OnRequestMaxRecordLeaderboard( data )
	--sys.log( "Receive leaderboard size" )
	if self:IsOnScreen() then
		if self.internalRequestId == data.internalRequestId then
			self:SetNumRecords( data.maxRecordsCount or 0 )
		elseif self.myPosSubRequest == data.internalRequestId then
			self.skipViewChange = true
			self:SetNumRecords( data.maxRecordsCount or 0 )
		end
	end
end

-- -----------------------------------
-- end functions
-- -----------------------------------
--
function UI.LeaderboardList:RequestLeaderboard( skipMyPosRequest )
	self:StartWait()
	-- skip old requests
	self.internalRequestId = nil
	self.myPosSubRequest = nil
	self.internalRequestId = nil
	self.clanMembersRequestId = nil
	local time = _G.TimerGetRealTime()
	local bigRequest = time - UI.LeaderboardList.additionDataRequestTime > UI.LeaderboardList.ADDITIONAL_DATA_REQUEST_TIMEOUT
	if ( not bigRequest and ( time - UI.LeaderboardList.requestLastTime > UI.LeaderboardList.REQUEST_SHORT_TIME_OUT ) ) or 
		( time - UI.LeaderboardList.requestLastTime > UI.LeaderboardList.REQUEST_LONG_TIME_OUT ) then

		self.needRequest = false
		UI.LeaderboardList.requestLastTime = time
		if self.GetView and self:GetView() == self.Views.ME and not skipMyPosRequest and self.entityType ~= MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM and self.entityType ~= MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
			self.visibleRangeChangeTime = nil
			UI.LeaderboardList.additionDataRequestTime = time
			self.myPosSubRequest = UI.Leaderboards:SetNextRequest( self, self.currentType, 0, 0, true, false, true, nil, self.uid )
		elseif self.GetView and self:GetView() == self.Views.FRIENDS and self.entityType ~= MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM and self.entityType ~= MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
			self.visibleRangeChangeTime = nil
			local friends = UI.Social:GetFriendList()
			local list = {}
			for k, v in pairs( friends ) do
				table.insert( list, v.uid )
			end
			table.insert( list, self.uid )
			self.friendsRequestId =  UI.Leaderboards:SetNextRequest( self, self.currentType, nil, nil, false, true, false, list )
		elseif self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
			self.visibleRangeChangeTime = nil
			local clanMembers = UI.Clan:GetMembers()
			local list = {}
			for k, v in pairs( clanMembers ) do
				if not( v.recruit ) then
					table.insert( list, v.uid )
				end
			end
			self.clanMembersRequestId =  UI.Leaderboards:SetNextRequest( self, self.currentType, nil, nil, false, true, false, list )
		else
			local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
			firstVisibleRecordIdx = firstVisibleRecordIdx - UI.LeaderboardList.ADDITIONAL_RANGE
			firstVisibleRecordIdx = math.max( firstVisibleRecordIdx, 1 )
			self.firstVisibleRecord = firstVisibleRecordIdx
			lastVisibleRecordIdx = math.max( lastVisibleRecordIdx, UI.LeaderboardList.MAX_SLOTS )
			lastVisibleRecordIdx = lastVisibleRecordIdx + self.ADDITIONAL_RANGE
			self.lastVisibleRecord = lastVisibleRecordIdx
			self.visibleRangeChangeTime = nil
			if time - UI.LeaderboardList.additionDataRequestTime > self.ADDITIONAL_DATA_REQUEST_TIMEOUT then
				UI.LeaderboardList.additionDataRequestTime = time
				if self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN then
					self.internalRequestId = UI.Leaderboards:SetNextRequest( self, self.currentType, firstVisibleRecordIdx - 1, lastVisibleRecordIdx - firstVisibleRecordIdx, true, true, UI:GetPlayerClanByUid( self.uid ) ~= UI.INVALID_U64_ID, nil, self.uid )
				elseif self.entityType == MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM then
					self.internalRequestId = UI.Leaderboards:SetNextRequest( self, self.currentType, firstVisibleRecordIdx - 1, lastVisibleRecordIdx - firstVisibleRecordIdx, true, true, UI.Arena:IsInTeam() and not UI.Arena:IsTeamMajor() )
				elseif self.entityType == MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
					self.internalRequestId = UI.Leaderboards:SetNextRequest( self, self.currentType, firstVisibleRecordIdx - 1, lastVisibleRecordIdx - firstVisibleRecordIdx, true, true, UI.Arena:IsInTeam() and UI.Arena:IsTeamMajor() )
				else
					self.internalRequestId = UI.Leaderboards:SetNextRequest( self, self.currentType, firstVisibleRecordIdx - 1, lastVisibleRecordIdx - firstVisibleRecordIdx, true, true, true, nil, self.uid )
				end
			else
				self.internalRequestId =  UI.Leaderboards:SetNextRequest( self, self.currentType, firstVisibleRecordIdx - 1, lastVisibleRecordIdx - firstVisibleRecordIdx, false, true, false )
			end
		end
	else
		self.needRequest = true
	end
end


--
function UI.LeaderboardList:F_OnNewFrame( hSender, dt_sys, dt_game )
	if self.tryUpdate then
		 self.tryUpdate = false
		 self:ReloadCurrentList()
	end
	if self.needRequest then
		self:RequestLeaderboard()
	end
	if self.visibleRangeChangeTime then
		if _G.TimerGetRealTime() - self.visibleRangeChangeTime > self.RANGE_CHANGE_DELAY then
			self:RequestLeaderboard()
		end
	end
end

--
function UI.LeaderboardList:Reset()
	self.internalRequestId = nil
	self.clanMembersRequestId = nil
	self.data = {}
end

--
function UI.LeaderboardList:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:FullUpdate( true )
end

--
function UI.LeaderboardList:FullUpdate( reloadLeaderboard )

	if self.uid == UI.INVALID_U64_ID then
		self.uid = UI:GetLocalPlayerUid()
	end

	local allLeaderboardData = {}
	if reloadLeaderboard then
		self.currentType = self.categoriesList:GetSelectedMainCategory()
		--
		local dataIdx = self.categoriesList:GetSelectedMainCategoryRecord()
		allLeaderboardData = self.categoriesList:GetRecordData( dataIdx )
		if allLeaderboardData.hasSubCategories then
			self.currentType = self.categoriesList:GetSelectedSubCategory()
			dataIdx = self.categoriesList:GetSelectedSubCategoryRecord()
			allLeaderboardData = self.categoriesList:GetRecordData( dataIdx )
		end
	end
	if self.currentType == "" then
		return
	end
	self.leaderboardType = allLeaderboardData.type
	self.entityType = allLeaderboardData.entityType
	self.firstVisibleRecord = -1
	self.lastVisibleRecord = nil
	-- skip old requests
	self.internalRequestId = nil
	self.myPosSubRequest = nil
	self.internalRequestId = nil
	self.clanMembersRequestId = nil
	--
	self.needRequest = false
	self.tryUpdate = false
	self.waitClanNameRequest = false
	self.waitPlayerNameRequest = false
	self.waitLeagueNameRequest = false
	--
	self.data = {}
	self.numRecords = 0
	self.visibleRangeChangeTime = nil

	if self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN then
		self:SetText( UI:GetStringByName( "clans_leaderboard_sort_name" ), self.layers.NAME )
	elseif self.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER or self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
		self:SetText( UI:GetStringByName( "leaderboard_players_sort_name" ), self.layers.NAME )
	elseif self.entityType == MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM then
		self:SetText( UI:GetStringByName( "leaderboard_league_sort_name" ), self.layers.NAME )
	elseif self.entityType == MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
		self:SetText( UI:GetStringByName( "leaderboard_league_sort_name" ), self.layers.NAME )
	end

	UI.LeaderboardList.additionDataRequestTime = -self.ADDITIONAL_DATA_REQUEST_TIMEOUT
	self.isInited = true
	if not self.isInited then
		--[[UI.ClansLeaderboardType_List:Clear()
		for k, v in pairs( ClanLeaderboardsList ) do
			local data = {}
			data.name = v
			UI.ClansLeaderboardType_List:AddRecord( data )
			if UI.ClansLeaderboardType_List:GetNumRecords() == 1 then
				self:SetType( data.name )
			end
		end]]
	else
		self:SetText( UI:GetStringByName( "leaderboard_"..self.currentType.."_name" ), self.layers.VALUE )
		--UI.ClansLeaderboardType_List:Update()
		self:Clear()

    	if self.GetView then

			self:UpdateViewBtns()

			local view = self:GetView()

			if view == nil or ( view == self.Views.FRIENDS and self.entityType ~= MasterServer.LeaderboardEntityType.LET_PLAYER ) then
				self:SetView( self.Views.ALL, true )
			end

    	end

		self.myRatingLine:UpdateForData( {} )
		if reloadLeaderboard then
			self:RequestLeaderboard()
		else
			self:ReloadCurrentList()
		end	
	end
end

--
function UI.LeaderboardList:CheckLeagueNames()

	if self.entityType ~= MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM and self.entityType ~= MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
		return true
	end

	local allCashed = true
	if self.data and self.data.records then
		local nickName, bCached, requestId
		for i = 1, #self.data.records do
			--sys.log( "requested name for team id: %s", _G.U64ToStr( self.data.records[ i ].e ) )
			nickName, bCached, requestId = _G.MasterServer_GetLeagueTeamName( self.data.records[ i ].e )
			if not bCached then
				allCashed = false
			end
		end
	end
	return allCashed

end

--
function UI.LeaderboardList:CheckPlayerNames()
	if self.entityType ~= MasterServer.LeaderboardEntityType.LET_PLAYER and self.entityType ~= MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
		return true
	end

	local allCashed = true
	if self.data and self.data.records then
		local nickName, bCached, requestId
		for i = 1, #self.data.records do
			nickName, bCached, requestId = _G.MasterServer_GetNickName( self.data.records[ i ].e )
			if not bCached then
				allCashed = false
			end
		end
	end
	return allCashed
end

--
function UI.LeaderboardList:CheckClanNames()
	if self.entityType == MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM or self.entityType == MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
		return true
	end
	local allCashed = true
	if self.data and self.data.records then
		local nickName, bCached, requestId, tag, emblem

		if self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN then

			for i = 1, #self.data.records do
				nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( self.data.records[ i ].e )
				if not bCached then
					allCashed = false
				end
			end

		elseif self.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER or self.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then

			for i = 1, #self.data.records do
				local cid = _G.MasterServer_UserProfileGet( self.data.records[ i ].e ).clanId
				if not cid then
					_G.MasterServer_UserProfileRequestField( self.data.records[ i ].e, MasterServer.UserProfileField.UPF_CLAN_ID )
					allCashed = false
				else
					if cid ~= UI.INVALID_U64_ID then
						nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( cid )
						if not bCached then
							allCashed = false
						end
					end
				end
			end

		end
	end
	return allCashed
end

--
function UI.LeaderboardList:ReloadCurrentList()
	--sys.log( "Update leaderboard list" )
	if not self:CheckPlayerNames() then
		self.waitPlayerNameRequest = true
		--return
	end
	if not self:CheckLeagueNames() then
		self.waitLeagueNameRequest = true
		--return
	end
	if not self:CheckClanNames() then
		self.waitClanNameRequest = true
		--return
	end
	--[[if self.internalRequestId ~= self.data.internalRequestId then
		return
	end]]
	self:StopWait()
	self:ResetInvisibleRecords()
	self.requestLastTime = _G.TimerGetRealTime()
	self.records = {}
	if self.data and self.data.records then
		for i = 1, #self.data.records do
			local record = self.records[ recordIdx ]
			if not record then
		    	record = { idx = ( self.data.beginRecordIndex or 0 ) + i }
				self.records[ ( self.data.beginRecordIndex or 0 ) + i ] = record
			end
			self.data.records[ i ].leaderboardType = self.leaderboardType
			self.data.records[ i ].entityType = self.entityType
			self.data.records[ i ].numRecords = self:GetNumRecords()
			self:SetRecordData( self.data.records[ i ], ( self.data.beginRecordIndex or 0 ) + i )
		end
	end
	if self.data.myRecord then
		self.data.myRecord.leaderboardType = self.leaderboardType
		self.data.myRecord.entityType = self.entityType
		self.data.myRecord.numRecords = self:GetNumRecords()
		self.myRatingLine:UpdateForData( self.data.myRecord )
	else
		--UI.ClansMembersLeaderboard_MyRatingWnd:UpdateForData( {} )
	end
end

--
function UI.LeaderboardList:SetNumRecords( numRecords )
	if numRecords == self.numRecords then
		return
	end
	self.numRecords = numRecords
	if self.numRecords == 0 then
		if self.firstVisibleRecordIdx ~= -1 then
			self:SetFirstVisibleRecord( -1 )
		end
	elseif self.firstVisibleRecordIdx < 1 then
		self:SetFirstVisibleRecord( 1 )
	elseif self:GetLastVisibleRecordIdx() > self.numRecords then
		self:SetLastVisibleRecord( numRecords )
	end
	self:UpdateScrollBarVisibility()
end

--
function UI.LeaderboardList:IsRecordExists( recordIdx )
	if recordIdx < 1 or recordIdx > self.numRecords then
		local parent = self:GetParent()
		sys.log( "UI.LeaderboardList:IsRecordExists()[ERROR]: invalid recordIdx: %d; maxRecords %d, liderboardId %s", recordIdx, self.numRecords, self.currentType )
		return
	end	
	return self.records[ recordIdx ] ~= nil
end

--
function UI.LeaderboardList:SetupRecord( recordIdx, data )
	if recordIdx < 1 or recordIdx > self.numRecords then
		sys.log( "UI.LeaderboardList:SetupRecord()[ERROR]: invalid recordIdx: %d", recordIdx )
		return
	end	
	if not data then
		sys.log( "UI.LeaderboardList:SetupRecord()[ERROR]: nil data for recordIdx: %d", recordIdx )
		return
	end
	local record = self.records[ recordIdx ]
	if not record then
    	record = { idx = recordIdx }
		self.records[ recordIdx ] = record
	end
	self:SetRecordData( data, recordIdx )
end

--
function UI.LeaderboardList:UpdateRecordsOnChangeVisibleRange()	
	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	if firstVisibleRecordIdx ~= -1 then
    	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do
    		if not self:IsRecordExists( recordIdx ) then
    			local data = {}
    			self:SetupRecord( recordIdx, data )
    		end
    	end
	end
	self:OnListVisibleRangeChanged( firstVisibleRecordIdx, lastVisibleRecordIdx )
end

--
function UI.LeaderboardList:OnListVisibleRangeChanged( firstVisibleRecordIdx, lastVisibleRecordIdx )
	if self.skipViewChange then
		self.skipViewChange = false
		return
	end
	if firstVisibleRecordIdx == -1 then
		return
	end
	if self.GetView and self:GetView() == self.Views.ME then
		self:SetView( self.Views.ALL, true )
	end
	if self.GetView and self:GetView() == self.Views.FRIENDS then
		return
	end
	if self.firstVisibleRecord > firstVisibleRecordIdx or ( self.lastVisibleRecord or -1 ) < lastVisibleRecordIdx then
		self:StartWait()
		self.visibleRangeChangeTime = _G.TimerGetRealTime()
	end
end

--
function UI.LeaderboardList:ResetInvisibleRecords()
	local lastVisibleRecordIdx = self:GetLastVisibleRecordIdx()
	for recordIdx, record in pairs( self.records ) do
		if self.firstVisibleRecordIdx == -1 or recordIdx < self.firstVisibleRecord or recordIdx > ( self.lastVisibleRecord or -1 ) then
        	local slot = self:GetSlotForRecord( record )
        	self.records[ recordIdx ] = nil	
        	if slot then
        		self:UpdateSlotForRecord( slot, false )
        	end
		end
	end
end


-- -----------------------------------------------------------------
-- UI.ClansMembersLeaderboardList_SlotWnd
-- -----------------------------------------------------------------
UI.ClansMembersLeaderboardList_SlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------
--
UI.ClansMembersLeaderboardList_SlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList3_Btn",
	props =
	{
		name			= "ClansMembersLeaderboardList_SlotWnd",
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
				defName				= "clan_members_leaderboard_list_line",
				defaultAnimation    = "idle",
				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "rating",
						layer		= "UI.ClansMembersLeaderboardList_SlotWnd.layers.PLACE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "name",
						layer		= "UI.ClansMembersLeaderboardList_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
					{
						objName		= "data",
						layer		= "UI.ClansMembersLeaderboardList_SlotWnd.layers.RATING",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT,
					},
				}
			}}
		},
		-- PLACE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_IGNORE_FORMAT_SYMBOLS,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
		-- RATING
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "VerySmall_outl2" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------
-- -----------------------------------
-- vars
-- -----------------------------------
-- -----------------------------------
-- const
-- -----------------------------------
--
UI.ClansMembersLeaderboardList_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    PLACE				= 1,
    NAME				= 2,
    RATING				= 3,
}

-- ------------------------------
-- work functions
-- ------------------------------
--
function UI.ClansMembersLeaderboardList_SlotWnd:F_PostLoad()
	UI.ButtonsList3_Btn.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	self.clanEmblemWnd = UI:CreateChildWnd( self, UI.GameplayMapGalaxyClanOwner )
end

--
function UI.ClansMembersLeaderboardList_SlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self.isMyselfLine then
		return true
	end

	-- fill context menu
	--local mode = self.mode ~= nil and self.mode or self:GetParent():GetParent():GetMode()
	local data = self:GetRecordData()
	if data.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER or data.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
		UI.ContextMenu:Clear()
		local nickName, bCached, requestId = _G.MasterServer_GetNickName( data.e )
		UI.ContextMenu:SetName( nickName )
		UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON, data.e )
		UI.ContextMenu:Show( mouseX, mouseY )
	elseif data.entityType == MasterServer.LeaderboardEntityType.LET_CLAN then
		UI.ContextMenu:Clear()
		local nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( data.e )
		UI.ContextMenu:SetName( UI:FormatClanName( nickName, tag ) )
		UI:FillContextMenuForClan( UI.ContextMenuType.CLAN, data.e )
		UI.ContextMenu:Show( mouseX, mouseY )
	end
	return true

end

--
function UI.ClansMembersLeaderboardList_SlotWnd:UpdateForData( data, bAnimated )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local mode = self.mode ~= nil and self.mode or self:GetParent():GetParent():GetMode()
	local skip = false;
	if data.entityType == MasterServer.LeaderboardEntityType.LET_PLAYER or data.entityType == MasterServer.LeaderboardEntityType.LET_CLAN_MEMBER then
		if data.e then
			local nickName = UI:MakePlayerNameByUid( data.e, true, false, false )
			self:SetText( nickName, self.layers.NAME )
		else
			self:SetText( "...", self.layers.NAME )
			self:SetText( "-", self.layers.PLACE )
			self:SetText( "-", self.layers.RATING )
		end

		self.clanEmblemWnd:SetClan( UI.INVALID_U64_ID, self )

	elseif data.entityType == MasterServer.LeaderboardEntityType.LET_CLAN then

		if data.e then

			local nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( data.e )
			if not bCached then
				--sys.log( "UI.ClansLeaderboard_SlotWnd:UpdateForData()[ERROR]: get not cached clan name" )
			end
			if not self.isMyselfLine and UI:GetPlayerClanByUid( self:GetParent():GetParent():GetUid() ) == data.e then
				if tag and tag ~= "" then
					self:SetText( nickName.." ["..tag.."] "..UI:GetStringByName( "clans_my_clan_label" ), self.layers.NAME )
				else
					self:SetText( nickName.." "..UI:GetStringByName( "clans_my_clan_label" ), self.layers.NAME )
				end
			else
				if tag and tag ~= "" then
					self:SetText( nickName.." ["..tag.."] ", self.layers.NAME )
				else
					self:SetText( nickName, self.layers.NAME )
				end
			end
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			UI:AddChildAndLink( self, self.clanEmblemWnd, mainEffect, "clan_ico", UI.EffectAnimParams.POS )
			self.clanEmblemWnd:SetClan( data.e, self )

		else
			self:SetText( "...", self.layers.NAME )
			self.clanEmblemWnd:SetClan( UI.INVALID_U64_ID, self )
			self:SetText( "-", self.layers.PLACE )
			self:SetText( "-", self.layers.RATING )
		end
	elseif data.entityType == MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM or data.entityType == MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then
		if data.e then
			nickName, bCached, requestId = _G.MasterServer_GetLeagueTeamName( data.e )
			local nickName = "..."
			if bCached then
				nickName = UI:GetArenaTeamName( data.e )
			end
			self:SetText( nickName, self.layers.NAME )
		else
			self:SetText( "...", self.layers.NAME )
			self:SetText( "-", self.layers.PLACE )
			self:SetText( "-", self.layers.RATING )
		end

		self.clanEmblemWnd:SetClan( UI.INVALID_U64_ID, self )

	else

		self:SetText( "...", self.layers.NAME )
		self:SetText( "-", self.layers.PLACE )
		self:SetText( "-", self.layers.RATING )

		self.clanEmblemWnd:SetClan( UI.INVALID_U64_ID, self )

	end

	if data.p and data.p ~= -1 then
		self:SetText( UI:Num2StrSeparatedBy3( data.p + 1 ), self.layers.PLACE )
	else
		skip = true
		self:SetText( "-", self.layers.PLACE )
		self:SetText( "-", self.layers.RATING )
	end

	if not skip then
		if data.s then
			if data.leaderboardType == "time" then
				self:SetText( UI:Time2Str3( math.floor( data.s / 1000 ) ), self.layers.RATING )
			else
				self:SetText( UI:Num2StrSeparatedBy3( data.s ), self.layers.RATING )
			end
		else
			self:SetText( "-", self.layers.RATING )
		end
	end

	if self.isMyselfLine then
		mainEffect:StartAnimation( "myself" )

	else

		if data.entityType == MasterServer.LeaderboardEntityType.LET_LEAGUE_TEAM then

    		if data.p == 0 or data.p == 1 then
    			mainEffect:StartAnimation( "gold" )
			else
    			mainEffect:StartAnimation( "olovo" )
			end

		elseif data.entityType == MasterServer.LeaderboardEntityType.LET_MAJOR_LEAGUE_TEAM then

			local lastPlace = data.numRecords and data.numRecords - 1 or -1

			if data.p == lastPlace or data.p == lastPlace - 1 then
				mainEffect:StartAnimation( "red" )
    		elseif data.p == 0 then
    			mainEffect:StartAnimation( "gold" )
    		elseif data.p == 1 then
    			mainEffect:StartAnimation( "silver" )
    		elseif data.p == 2 then
    			mainEffect:StartAnimation( "bronze" )
			else
				mainEffect:StartAnimation( "olovo" )
			end

		else

    		if data.p == 0 then
    			mainEffect:StartAnimation( "gold" )
    		elseif data.p == 1 then
    			mainEffect:StartAnimation( "silver" )
    		elseif data.p == 2 then
    			mainEffect:StartAnimation( "bronze" )
    		else
    			mainEffect:StartAnimation( "olovo" )
    		end

		end

	end

end


UI.ClansMembersLeaderboard_MyRatingWnd = {}
UI.ClansMembersLeaderboard_MyRatingWnd.def =
{
	className 	= "Wnd",
	prototype	= "ClansMembersLeaderboardList_SlotWnd",

	props =
	{
		name			= "ClansMembersLeaderboard_MyRatingWnd",
	},
}

UI.ClansMembersLeaderboard_MyRatingWnd.isMyselfLine = true
UI.ClansMembersLeaderboard_MyRatingWnd.mode = UI.LeaderboardList.Modes.USERS


-- -----------------------------------------------------------------
-- UI.ClansMembersLeaderboard_ListWnd
-- -----------------------------------------------------------------
UI.ClansMembersLeaderboard_ListWnd = {}
-- ------------------------------
-- UI.ClansLeaderboards_CategoriesListWnd
-- ------------------------------
UI.ClansLeaderboards_CategoriesListWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------
UI.ClansMembersLeaderboard_ListWnd.def =
{
	className 	= "Wnd",
	prototype	= "LeaderboardList",
	props =
	{
		name			= "ClansMembersLeaderboard_ListWnd",
		--style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
	},	
}
UI.ClansMembersLeaderboard_ListWnd.myRatingLine = UI.ClansMembersLeaderboard_MyRatingWnd
UI.ClansMembersLeaderboard_ListWnd.categoriesList = UI.ClansLeaderboards_CategoriesListWnd
UI.ClansMembersLeaderboard_ListWnd.mode = UI.LeaderboardList.Modes.USERS

UI.ClansLeaderboards_CategoriesListWnd.def =
{
	className	= "Wnd",
	prototype 	= "CategoriesListWnd",
	props =
	{
		name	= "ClansLeaderboards_CategoriesListWnd",
	},
}

UI.ClansLeaderboards_CategoriesListWnd.categories = "ClanMemberLeaderboardsList"
UI.ClansLeaderboards_CategoriesListWnd.mainWnd = UI.ClansLeaderboards_Wnd


-- -------------------------------------------------------------------
-- UI.GameplayMapGalaxyClanOwner
-- -------------------------------------------------------------------
UI.GameplayMapGalaxyClanOwner =
{
    def =
    {
    	className	= "Wnd",
    	props = 
    	{
    		style		= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
    		name		= "GameplayMapGalaxyClanOwner",
    		isPrototype = true,
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
					defName				= "gameplay_select_galaxy_clan_owner",
					defaultAnimation    = "idle_big",
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
}

UI.GameplayMapGalaxyClanOwner.layers = 
{
	MAIN_EFFECT	= 0,
}

UI.GameplayMapGalaxyClanOwner.showDefaultEmblem = false

--
function UI.GameplayMapGalaxyClanOwner:SetAnim( animName )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( animName )
end

--
function UI.GameplayMapGalaxyClanOwner:F_PostLoad()
	UI.Wnd.F_PostLoad( self )
	if self:IsPrototype() then
		return
	end
	local hTex = UI:GetTex( "clan_icon_empty" )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetSpriteTexture( "ico", hTex )
end

--
function UI.GameplayMapGalaxyClanOwner:SetTexture( textureName )

	local hTex = UI:GetTex( textureName )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:SetSpriteTexture( "ico", hTex )

end

--
function UI.GameplayMapGalaxyClanOwner:SetEmblem( emblemName, wnd )
	if ClanEmblems[ emblemName ] then
		self:SetTexture( ClanEmblems[ emblemName ].decal )
		wnd:AddChild( self )
	else
		if emblemName ~= "" then
			sys.log( "^1UI.GameplayMapGalaxyClanOwner:SetClan()[ERROR]: unknown emblem '%s' for clan", emblemName )
		else
			if self.showDefaultEmblem then
				local hTex = UI:GetTex( "clan_icon_default" )
				local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
				mainEffect:SetSpriteTexture( "ico", hTex )
				wnd:AddChild( self )
			else
				self:UnlinkFromParent()
			end
		end
	end
end

--
function UI.GameplayMapGalaxyClanOwner:SetClan( cid, wnd )
	local nickName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( cid )
	if bCached then
		self:SetEmblem( emblem, wnd )
	else
		self:UnlinkFromParent()
	end
end

--
--[[function UI.GameplayMapGalaxyClanOwner:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "show" )

	return false

end

--
function UI.GameplayMapGalaxyClanOwner:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "idle_2" )

	return false

end]]

function UI.GameplayMapGalaxyClanOwner:FadeIn()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimation( "show" )
end

--
function UI.GameplayMapGalaxyClanOwner:FadeOut()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:StartAnimationSpeed( "show", -1 )
end

--
--[[function UI.GameplayMapGalaxyClanOwner:F_OnEffectAnimationEnded( effect, animName )
	--if UI.GameplayMapWnd:GetCurrentClanOwnedWnd() ~= self then
		if animName == "show" then
			local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
			mainEffect:StartAnimation( "idle_2" )
		end
	--end
end]]