-- ----------------------------------------------------------------------------
--
-- Workfile: profile_achievementswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

-- ------------------------------
-- ProfileAchievements_CategoriesListWnd
-- ------------------------------

UI.ProfileAchievements_CategoriesListWnd = {}

UI.ProfileAchievements_CategoriesListWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "ProfileAchievements_CategoriesListWnd",
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

UI.ProfileAchievements_CategoriesListWnd.inited = false
UI.ProfileAchievements_CategoriesListWnd.achiveUnlockStickers = {}
UI.ProfileAchievements_CategoriesListWnd.achiveUnlockPremiumAccess = {}
UI.ProfileAchievements_CategoriesListWnd.achiveUnlockTitle = {}
UI.ProfileAchievements_CategoriesListWnd.achiveUnlockShip = {}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ProfileAchievements_CategoriesListWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.requestId = nil

end


--
function UI.ProfileAchievements_CategoriesListWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if requestId == self.requestId then
		self.requestId = nil
		if result ~= 0 then
			-- TODO: error handling
			--self.achievements = {}
		else
			--self.achievements = UI.Profile:GetAchievements()
			self:ReloadAchievementsList()
		end
		UI.LeaderboardWnd:ShowWait( false )
	end

end

--
function UI.ProfileAchievements_CategoriesListWnd:Update( uid )

	self:SelectMainCategoryRecordInternal( 1, true, false )
	local requestId = UI.Profile:RequestAchievements( uid )
	if requestId then
		self.requestId = requestId
	end
	local achievements = UI.Profile:GetAchievements()
	if requestId == nil and achievements then
		-- looks like allready loaded
		--self.achievements = achievements
		self:ReloadAchievementsList()
	else
		-- async wait
		UI.LeaderboardWnd:ShowWait( true )
		UI.ProfileAchievements_List:Reset()
	end

end

--
function UI.ProfileAchievements_CategoriesListWnd:Init()

	for k, v in pairs( Achievements ) do
		for kk, vv in pairs( v.ranks ) do
			if vv.reward_title then
				if self.achiveUnlockTitle[ k ] == nil then
					self.achiveUnlockTitle[ k ] = {}
				end
				if self.achiveUnlockTitle[ k ][ kk ] == nil then
					self.achiveUnlockTitle[ k ][ kk ] = {}
				end
				table.insert( self.achiveUnlockTitle[ k ][ kk ], vv.reward_title )
			end
			
			if vv.reward_premium_access then
				if self.achiveUnlockPremiumAccess[ k ] == nil then
					self.achiveUnlockPremiumAccess[ k ] = {}
				end
				if self.achiveUnlockPremiumAccess[ k ][ kk ] == nil then
					self.achiveUnlockPremiumAccess[ k ][ kk ] = {}
				end
				table.insert( self.achiveUnlockPremiumAccess[ k ][ kk ], vv.reward_premium_access )
			end
			
			if vv.reward_custom_element then
				if not VesselCustomElements[ vv.reward_custom_element ] then
					sys.log( "Achieve %d[%d] rewards invalid sticker %s", k, kk, vv.reward_custom_element )
				else
					if self.achiveUnlockStickers[ k ] == nil then
						self.achiveUnlockStickers[ k ] = {}
					end
					table.insert( self.achiveUnlockStickers[ k ], vv.reward_custom_element )
				end
			end

			if vv.reward_ship then
				if self.achiveUnlockShip[ k ] == nil then
					self.achiveUnlockShip[ k ] = {}
				end
				if self.achiveUnlockShip[ k ][ kk ] == nil then
					self.achiveUnlockShip[ k ][ kk ] = {}
				end
				table.insert( self.achiveUnlockShip[ k ][ kk ], vv.reward_ship )
			end
		end
	end

end


--
function UI.ProfileAchievements_CategoriesListWnd:AddRecord( data )

	local numRecords = #self.records
	local recordIdx = numRecords + 1

	local record = {}
	record.idx		= recordIdx
	record.data		= data

	local slotWnd = self:ObtainFreeSlotWnd( data.categoryType )
	if not slotWnd then
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:AddRecord()[ERROR]: cannot create slot for record" )
		return -1
	end
	slotWnd:SetupForRecord( recordIdx )	
	record.slotWnd = slotWnd

	table.insert( self.records, record )

	slotWnd:FullUpdate()

	return recordIdx

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetRecordData( recordIdx )

	local record = self.records[ recordIdx ]
	return record and record.data

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetNumTotalRecords()

	return #self.records

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetNumVisibleRecords()

	return #self.visibleRecordIds

end


--
function UI.ProfileAchievements_CategoriesListWnd:IsAnimating()

    return self.state ~= self.states.IDLE	

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetSelectedMainCategoryRecord()

	return self.selMainCategoryRecordIdx

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetSelectedSubCategoryRecord()

	return self.selSubCategoryRecordIdx

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetSelectedMainCategory()

	local data = self:GetRecordData( self.selMainCategoryRecordIdx )
	return data and data.categoryInfo and data.categoryInfo.name or ""

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetSelectedSubCategory()

	local data = self:GetRecordData( self.selSubCategoryRecordIdx )
	return data and data.categoryInfo and data.categoryInfo.name or ""

end


--
function UI.ProfileAchievements_CategoriesListWnd:SelectMainCategory( name, bAnimated, bSound )

	local recordIdx = -1

	if name ~= "" then

		recordIdx = self:FindRecordByCategoryName( name, UI.StoreCategoriesListWnd.categoryTypes.MAIN )
		if recordIdx == -1 then
			sys.log( "UI.ProfileAchievements_CategoriesListWnd:SelectedMainCategory()[ERROR]: cannot find record for category %s", tostring( name ) )
			return
		end

	end

	self:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound )

end


--
function UI.ProfileAchievements_CategoriesListWnd:SelectSubCategory( name, parentName, bSound )

	local recordIdx = -1

	if name ~= "" then

		recordIdx = self:FindRecordByCategoryName( name, UI.StoreCategoriesListWnd.categoryTypes.SUB, parentName )

		if recordIdx == -1 then
			sys.log( "UI.ProfileAchievements_CategoriesListWnd:SelectedSubCategory()[ERROR]: cannot find record for subcategory \"%s.%s\"", tostring( parentName ), tostring( name ) )
			return
		end

		local selMainCategory = self:GetSelectedMainCategory() 
		if selMainCategory == "" or selMainCategory ~= parentName then
			sys.log( "UI.ProfileAchievements_CategoriesListWnd:SelectedSubCategory()[ ERROR]: cannot select a subcategory with the parent category not being selected" )
			return
		end

	end

	self:SelectSubCategoryRecordInternal( recordIdx, bSound )

end


--
function UI.ProfileAchievements_CategoriesListWnd:SelectRecord( recordIdx, bSelect, bAnimated, bSound )

	if recordIdx < 1 or recordIdx > #self.records then
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
		return
	end

	local data = self:GetRecordData( recordIdx )
	if data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
	                                                              	
		--if bSelect then
		self:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound )	

		--[[elseif recordIdx == self.selMainCategoryRecordIdx then
			self:SelectMainCategoryRecordInternal( -1, bAnimated, bSound )]]
		--end

	elseif data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then

		if bSelect then
			self:SelectSubCategoryRecordInternal( recordIdx, bAnimated, bSound )	

		--[[elseif recordIdx == self.selSubCategoryRecordIdx then
			self:SelectSubCategoryRecordInternal( -1, bAnimated, bSound )]]
		end

	end

end


--
function UI.ProfileAchievements_CategoriesListWnd:IsRecordSelected( recordIdx )

	if recordIdx < 1 or recordIdx > #self.records then
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:SelectRecord()[ERROR]: invalid record id: %d", recordIdx )
		return false
	end

	return recordIdx == self.selMainCategoryRecordIdx or recordIdx == self.selSubCategoryRecordIdx

end 


--
function UI.ProfileAchievements_CategoriesListWnd:Reset()

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
function UI.ProfileAchievements_CategoriesListWnd:UpdateVisibleRecordsImmediate()

	self:ResetVisibleRecords()

	self.state = self.states.IDLE

	local selMainCategory = self:GetSelectedMainCategory()

	for recordIdx = 1, #self.records do

		local record = self.records[ recordIdx ]

		if record.data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
			table.insert( self.visibleRecordIds, recordIdx )

		elseif record.data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then
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
function UI.ProfileAchievements_CategoriesListWnd:OnRecordNewStateChanged( recordIdx )

	local slotWnd = self:GetSlotWndForRecord( recordIdx )
	if slotWnd then
		slotWnd:OnNewStateChanged()
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.ProfileAchievements_CategoriesListWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.ProfileAchievements_CategoriesListWnd.states =
{
	IDLE		= 1,
	SHOW_SUB	= 2,
	HIDE_SUB	= 3,	
}

UI.ProfileAchievements_CategoriesListWnd.effectInfo =
{
	main =
	{
		firstRecordObjName		= "button_1",
		secondRecordObjName		= "button_2",		
	}
}

UI.ProfileAchievements_CategoriesListWnd.SHOW_SPEED	= 40	-- слотов/сек
UI.ProfileAchievements_CategoriesListWnd.HIDE_SPEED	= 60	-- слотов/сек

UI.ProfileAchievements_CategoriesListWnd.categoryTypes =
{
	MAIN	= 1,
	SUB		= 2,
}



UI.ProfileAchievements_CategoriesListWnd.sounds =
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

UI.ProfileAchievements_CategoriesListWnd.records					= {}
UI.ProfileAchievements_CategoriesListWnd.visibleRecordIds			= {}
UI.ProfileAchievements_CategoriesListWnd.selMainCategoryRecordIdx	= 1
UI.ProfileAchievements_CategoriesListWnd.selSubCategoryRecordIdx	= -1
UI.ProfileAchievements_CategoriesListWnd.state						= UI.ProfileAchievements_CategoriesListWnd.states.IDLE
UI.ProfileAchievements_CategoriesListWnd.allSlots					= {}
UI.ProfileAchievements_CategoriesListWnd.firstRecordPos				= Vec2( 0, 0 )
UI.ProfileAchievements_CategoriesListWnd.recordsDist				= 0

UI.ProfileAchievements_CategoriesListWnd.animInfo =
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

UI.ProfileAchievements_CategoriesListWnd.inited = false


-- ------------------------------
-- work functions
-- ------------------------------


--
function UI.ProfileAchievements_CategoriesListWnd:F_OnBeforeShowOnScreen()

	UI.Wnd.OnBeforeShowOnScreen( self )

	if not self.inited then
		self:UpdateCategories()
		self:Init()
		self.inited = true
	end

	return true

end


--
function UI.ProfileAchievements_CategoriesListWnd:ReloadAchievementsList()

	-- TODO sort
	--UI.ProfileAchievements_List:Reset()
	UI.ProfileAchievements_List:FullUpdate()
	UI.LeaderboardWnd:ReloadPoints()
	--[[for i = 1, #self.achievements do

	end]]

end


--
function UI.ProfileAchievements_CategoriesListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.firstRecordPos = mainEffect:GetObjPos( self.effectInfo.main.firstRecordObjName )
		local secondRecordPos = mainEffect:GetObjPos( self.effectInfo.main.secondRecordObjName )

		self.recordsDist = secondRecordPos.y - self.firstRecordPos.y

	end

	self:SelectMainCategoryRecordInternal( 1, true, false )
	--self:UpdateCategories()

end


--
function UI.ProfileAchievements_CategoriesListWnd:UpdateCategories()

	local categories = _G.AchievementsInfo and _G.AchievementsInfo.categories
	if not categories then
		return
	end

	-- TODO: вернуть новые?
	--local categoriesState = self:GetCategoriesState()

	for mainCategoryIdx = 1, #categories do		

		local mainCategoryInfo = categories[ mainCategoryIdx ]

		if mainCategoryInfo.shop ~= false then

    		--local mainState = categoriesState[ mainCategoryInfo.name ]

    		local mainData = {}

    		mainData.categoryType		= self.categoryTypes.MAIN
    		mainData.categoryInfo		= mainCategoryInfo
    		--mainData.new				= mainState and mainState.new or 0
    		--mainData.sale				= mainState and mainState.sale or 0
    		mainData.filters			= mainCategoryInfo.filters

    		self:AddRecord( mainData )

    		local subCategories = mainCategoryInfo.subCategories
    		if subCategories then

    			for subCategoryIdx = 1, #subCategories do

    				local subCategoryInfo = subCategories[ subCategoryIdx ]

					if subCategoryInfo.shop ~= false then

        				--local subState = mainState and mainState[ subCategoryInfo.name ]

                		local subData = {}

                		subData.categoryType		= self.categoryTypes.SUB
        				subData.categoryInfo		= subCategoryInfo
        				subData.parentCategoryInfo	= mainCategoryInfo
                		--subData.new				= subState and subState.new or 0
                		--subData.sale				= subState and subState.sale or 0
        				--subData.filters			= subCategoryInfo.filters or mainCategoryInfo.filters

        				self:AddRecord( subData )

					end

    			end

    		else
    			--sys.log( "UI.ShopWnd:UpdateCategories()[ERROR]: no subcategories in category \"%s\"", tostring( mainCategoryInfo.name ) )
    		end				

		end

	end	

	self:UpdateVisibleRecordsImmediate()

end


--
function UI.ProfileAchievements_CategoriesListWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	--[[if self:IsInputBlocked() then
		return true
	end]]

	--[[if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end]]

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
function UI.ProfileAchievements_CategoriesListWnd:ObtainFreeSlotWnd( categoryType )

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
function UI.ProfileAchievements_CategoriesListWnd:CreateSlotWnd( categoryType )

	local proto = nil

	if categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
		proto = UI.ProfileAchievements_CategoriesSlotWnd_main

	elseif categoryType == UI.StoreCategoriesListWnd.categoryTypes.SUB then
		proto = UI.ProfileAchievements_CategoriesSlotWnd_sub

	else
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:CreateSlotWnd()[ERROR]: cannot find prototype slot for category %s", tostring( categoryType ) )
		return nil
	end

	local slotsByCategory = self.allSlots[ categoryType ]
	local numSlots = slotsByCategory and #slotsByCategory or 0

	local slotWnd = UI:CreateChildWnd( self, proto, numSlots + 1 )
	slotWnd:SetLeft( self.firstRecordPos.x )

	return slotWnd

end


--
function UI.ProfileAchievements_CategoriesListWnd:FindRecordByCategoryName( name, categoryType, parentName )

	for recordIdx, record in pairs( self.records ) do
		if record.data.categoryType == categoryType and record.data.categoryInfo.name == name and ( categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN or record.data.parentCategoryInfo.name == parentName ) then
			return recordIdx
		end
	end

	return 	-1

end


--
function UI.ProfileAchievements_CategoriesListWnd:SelectSubCategoryRecordInternal( recordIdx, bSound )

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
		local sound = recordIdx == -1 and UI.ProfileAchievements_CategoriesListWnd.sounds.categoryDeselect or UI.ProfileAchievements_CategoriesListWnd.sounds.categorySelect
		UI:PlayGlobalSound( sound )
	end

	UI.ProfileAchievements_List:FullUpdate()
	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selSubCategoryRecordIdx, oldRecordIdx, 0, 0 )	

end


--
function UI.ProfileAchievements_CategoriesListWnd:SelectMainCategoryRecordInternal( recordIdx, bAnimated, bSound )

	if recordIdx == self.selMainCategoryRecordIdx and -1 == self.selSubCategoryRecordIdx then
		return
	end

	-- по умолчанию при выборе главной категории ни одна подкатегори€ не выбрана;
	-- при развыборе выделение с подкатегории также снимаетс€
	self:SelectSubCategoryRecordInternal( -1 )	


	if recordIdx == self.selMainCategoryRecordIdx then
		bAnimated = false
	end

	-- немедленно завершаетс€ предыдуща€ анимаци€, если была;
	-- но вообще-то такой ситуаии нельз€ допускать

	if self:IsAnimating() then
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:SelectMainCategoryRecordInternal()[WARNING]: already animating")
		self:UpdateVisibleRecordsImmediate()
	end

	local oldRecordIdx = self.selMainCategoryRecordIdx
	self.selMainCategoryRecordIdx = recordIdx

	local sound = UI.ProfileAchievements_CategoriesListWnd.sounds.mouseClick

	if not bAnimated then
		self:UpdateVisibleRecordsImmediate()

	else
		-- показать
		if oldRecordIdx == -1 then
			self:ShowSubCategoriesAnimated( recordIdx )
			--sound = UI.ProfileAchievements_CategoriesListWnd.sounds.categorySelectAnimated

		-- скрыть
		elseif recordIdx == -1 then
			self:HideSubCategoriesAnimated( oldRecordIdx )
			--sound = UI.ProfileAchievements_CategoriesListWnd.sounds.categoryDeselectAnimated

		-- сменить; дл€ этого сначала скрыть предыдущее
		else
			self:HideSubCategoriesAnimated( oldRecordIdx )
			--sound = UI.ProfileAchievements_CategoriesListWnd.sounds.categoryChangeAnimated
		end	
	end

	if bSound and self:IsOnScreen() and sound ~= "" then
		UI:PlayGlobalSound( sound )
	end

	UI.ProfileAchievements_List:FullUpdate()

	UI:SendUiEvent( UI.EV_LIST_SELECT_RECORD, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, self.selMainCategoryRecordIdx, oldRecordIdx, 0, 0 )		

end


--
function UI.ProfileAchievements_CategoriesListWnd:ShowSubCategoriesAnimated( mainRecordIdx )

	if mainRecordIdx == -1 then
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:ShowSubCategoriesAnimated()[ERROR]: invalid record index" )
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
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:ShowSubCategoriesAnimated()[ERROR]: subcategories are already open" )
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
function UI.ProfileAchievements_CategoriesListWnd:HideSubCategoriesAnimated( mainRecordIdx )

	if mainRecordIdx == -1 then
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:HideSubCategoriesAnimated()[ERROR]: invalid record index" )
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
		sys.log( "UI.ProfileAchievements_CategoriesListWnd:HideSubCategoriesAnimated()[ERROR]: subcategories are not open" )
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
function UI.ProfileAchievements_CategoriesListWnd:UpdateAnimation( dt )

	self.animInfo.elapsedTime = self.animInfo.elapsedTime + dt

	local t0 = UI:Clamp( self.animInfo.elapsedTime / self.animInfo.maxTime, 0, 1 )
	local t = self.animInfo.bReversed and 1 - t0 or t0

	local numSubRecords = self.animInfo.lastSubRecordIdx - self.animInfo.firstSubRecordIdx + 1
	local records_t = numSubRecords * t

	local prevIdx = math.floor( records_t )
	local curIdx = UI:Clamp( prevIdx + 1, 1, numSubRecords )

	-- предыдущие субкатегории полностью вывод€тс€ из альфы

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

	-- позици€ всех нижележащих слотов

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
function UI.ProfileAchievements_CategoriesListWnd:OnStopAnimation( recordIdx )

	if self.state == self.states.SHOW_SUB then

		self.state = self.states.IDLE

		-- возвращение возможности слотам подкатегорий реагировать на инпут
		if self.animInfo.firstSubRecordIdx ~= -1 then

    		for subRecordIdx = self.animInfo.firstSubRecordIdx, self.animInfo.lastSubRecordIdx do
    			local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
    			subSlotWnd:Enable( true ) 
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
    		--sys.log( "UI.ProfileAchievements_CategoriesListWnd:OnStopAnimation()[ERROR]: invalid old sel record index" )
		end

		-- подкатегории убираютс€ из визуального списка
		if self.animInfo.firstSubRecordIdx ~= -1 then

    		for subRecordIdx = self.animInfo.firstSubRecordIdx, self.animInfo.lastSubRecordIdx do

    			local subSlotWnd = self:GetSlotWndForRecord( subRecordIdx )
    			subSlotWnd:PartialReset()
				subSlotWnd:UnlinkFromParent()

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

		-- разворачивание подгатегорий дл€ новой выбранной категории
    	if self.selMainCategoryRecordIdx ~= -1 then			
			self:ShowSubCategoriesAnimated( self.selMainCategoryRecordIdx )
		end

	end

end    


--
function UI.ProfileAchievements_CategoriesListWnd:ResetVisibleRecords()

	for visIdx, recordIdx in pairs( self.visibleRecordIds ) do

		local record = self.records[ recordIdx ]
		local slotWnd = record.slotWnd

		slotWnd:PartialReset()
		slotWnd:UnlinkFromParent()

	end

	self.visibleRecordIds = {}

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetAnchorPos( visIdx )

    return self.firstRecordPos.y + self.recordsDist * ( visIdx - 1 )

end


--
function UI.ProfileAchievements_CategoriesListWnd:Record2VisIdx( recordIdx )

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
function UI.ProfileAchievements_CategoriesListWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.state ~= self.states.IDLE then
		self:UpdateAnimation( dt_sys )		
	end

end


--
function UI.ProfileAchievements_CategoriesListWnd:SetUnderlyingRecordsPos( topVisIdx, y )

	for visIdx = topVisIdx, #self.visibleRecordIds do

		local recordIdx = self.visibleRecordIds[ visIdx ]
		local record = self.records[ recordIdx ]

		local recordY = y + ( visIdx - topVisIdx ) * self.recordsDist
		record.slotWnd:SetTop( recordY )	

	end

end


--
function UI.ProfileAchievements_CategoriesListWnd:GetRecordsForAnimating( mainRecordIdx )

	local firstSubRecordIdx		= -1
	local lastSubRecordIdx		= -1
	local nextMainRecordIdx		= -1

	for recordIdx = mainRecordIdx + 1, #self.records do

		local record = self.records[ recordIdx ]

		if record.data.categoryType == UI.StoreCategoriesListWnd.categoryTypes.MAIN then
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
function UI.ProfileAchievements_CategoriesListWnd:GetSlotWndForRecord( recordIdx )

	local record = self.records[ recordIdx ]
	return record and record.slotWnd

end

-- -------------------------------------------------------------------
-- UI.ProfileAchievements_CategoriesSlotWnd
-- -------------------------------------------------------------------

UI.ProfileAchievements_CategoriesSlotWnd = {}
local scs = UI.ProfileAchievements_CategoriesSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

local l_numCheckBoxBaseLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )

UI.ProfileAchievements_CategoriesSlotWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",
	
	props =
	{
		name		= "ProfileAchievements_CategoriesSlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numCheckBoxBaseLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
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
			id			= 2,
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
function UI.ProfileAchievements_CategoriesSlotWnd:SetupForRecord( recordIdx )

	self.recordIdx = recordIdx

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:GetRecord()
         	
	return self.recordIdx

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:FullUpdate()

	local data = self:GetRecordData()
	if not data then
		sys.log( "UI.ProfileAchievements_CategoriesSlotWnd:FullUpdate()[ERROR]: nil data" )
		return
	end

	self:UpdateName( data )
	self:UpdateIco( data )
	--self:UpdateNewState( data )
	--self:UpdateSaleState( data )
	self:UpdateTooltip( data )

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:FullReset()

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
function UI.ProfileAchievements_CategoriesSlotWnd:PartialReset()

	self:Select( false )
	self:SetAlpha( 1 )
	self:Enable( true )

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:Select( bSelect )

	self:Check( bSelect )

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:IsSelected()

	return self:IsChecked()

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:OnNewStateChanged()

	local data = self:GetRecordData()

	if data then
		self:UpdateNewState( data )
	end

end


-- alpha - от 0 до 1
function UI.ProfileAchievements_CategoriesSlotWnd:SetAlpha( alpha )

	-- спрайт, использующийс€ дл€ обозначени€ наведени€ мышью, рисуетс€ с блендом COLOR_ADD, поэтому смена альфы на него не повли€ет;
	-- однако во врем€ анимации слотов, в кооторой и задействована смена альфы, у слота должен быть предварительно выставлен
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
    NAME			= 2,
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
function UI.ProfileAchievements_CategoriesSlotWnd:F_PostLoad()

	UI.EffectCheckBoxWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end
	
	self:FullReset()

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:GetRecordData()

	local data = UI.ProfileAchievements_CategoriesListWnd:GetRecordData( self.recordIdx )
	return data

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:UpdateName( data )

	local localizedName = UI:GetStringByName( "achievementsCategory_"..data.categoryInfo.name )
	self:SetText( localizedName, self.layers.NAME )

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:UpdateIco( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end	

	local texName = string.format( "achievementsCategory_%s", data.categoryInfo.name )
	local hTex = UI:GetTex( texName )
	mainEffect:SetSpriteTexture( self.effectInfo.icoSpriteName, hTex )

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:UpdateNewState( data )

	--self:SetLayerVisible( data.new > 0, self.layers.NEW_EFFECT )
	-- TODO
	return false

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:UpdateSaleState( data )

	--self:SetLayerVisible( data.sale > 0, self.layers.SALE_EFFECT )

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:UpdateTooltip( data )

	--self:SetTooltipData( UI:GetShopCategoryTooltipData( data.categoryInfo.name ) )
	local tipText		= UI:GetStringByName( string.format( "achievementsCategory_desc_%s", data.categoryInfo.name ) )
	local tipCaption	= UI:GetStringByName( "achievementsCategory_"..data.categoryInfo.name )

	self.tooltipData = { tooltipType = UI.tooltipTypes.TEXT_LARGE, text = tipText, caption = tipCaption }

	--self:SetTooltipData(  )

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if self:IsOnScreen() and not UI.ProfileAchievements_CategoriesListWnd:IsAnimating() then
		UI:PlayGlobalSound( UI.ProfileAchievements_CategoriesListWnd.sounds.categoryMouseOver )
	end

	return true

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.ProfileAchievements_CategoriesSlotWnd:GetTooltipData()

	return self.tooltipData
	
end


-- -------------------------------------------------------------------
-- UI.ProfileAchievements_CategoriesSlotWnd_main
-- -------------------------------------------------------------------

UI.ProfileAchievements_CategoriesSlotWnd_main =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ProfileAchievements_CategoriesSlotWnd",
    	
    	props =
    	{
    		name		= "ProfileAchievements_CategoriesSlotWnd_main",
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
    						layer		= "UI.ProfileAchievements_CategoriesSlotWnd_main.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
				}}
    		},

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
}

UI.ProfileAchievements_CategoriesSlotWnd_main.layers = 
{
	MAIN_EFFECT					= 0,
	NAME						= 1,
}


-- -------------------------------------------------------------------
-- UI.ProfileAchievements_CategoriesSlotWnd_sub
-- -------------------------------------------------------------------

UI.ProfileAchievements_CategoriesSlotWnd_sub =
{
	def =
    {
    	className	= "ButtonWnd",
    	prototype	= "ProfileAchievements_CategoriesSlotWnd",
    	
    	props =
    	{
    		name		= "ProfileAchievements_CategoriesSlotWnd_sub",
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
    						layer		= "UI.ProfileAchievements_CategoriesSlotWnd_sub.layers.NAME",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
				}}
    		},

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
}

UI.ProfileAchievements_CategoriesSlotWnd_sub.layers = 
{
	MAIN_EFFECT					= 0,
	NAME						= 1,
}



-- -------------------------------------------------------------------
-- UI.ProfileAchievements_List
-- -------------------------------------------------------------------

UI.ProfileAchievements_List = {}


-- --------------------------
-- window definition
-- --------------------------


UI.ProfileAchievements_List.def =
{
	className = "Wnd",

	props =
	{
		name	= "ProfileAchievements_List",
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
				defName 			= "profile_achievements_list",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "self",
						layer		= "UI.ProfileAchievements_List.layers.MASK",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MASK
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "notificationsMask",
			visible		= false,
		}
	},

	children = { "UI.ProfileAchievementsList_ScrollBarWnd" }
}


UI.ProfileAchievements_List.layers = 
{
	MAIN_EFFECT = 0,
	MASK		= 1,
}

UI.ProfileAchievements_List.effectInfo =
{
	main =
	{
		scrollBarLocator 	= "scroll_max",
	},

	workList =
	{
		firstSlotLocator	= "slot_1",
		secondSlotLocator	= "slot_2",
	}
}

-- --------------------------
-- vars
-- --------------------------

UI.ProfileAchievements_List.records		= {}
UI.ProfileAchievements_List.firstId		= -1
UI.ProfileAchievements_List.lastId		= -1
UI.ProfileAchievements_List.slotWnds	= {}
UI.ProfileAchievements_List.scrollBar	= nil
UI.ProfileAchievements_List.slotsRect	= Quat( 0, 0, 0, 0 )
UI.ProfileAchievements_List.space_slots	= 0
UI.ProfileAchievements_List.achvIdToScroll		= nil
UI.ProfileAchievements_List.achvRankToScroll	= nil

-- --------------------------
-- work functions
-- --------------------------

--
function UI.ProfileAchievements_List:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:MakeConstParams()
	self:InitScrollBar()
	self:Reset()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.ProfileAchievements_List:MakeConstParams()

	local slotSize		= UI:ZeroVec2()
	local firstSlotPos	= UI:ZeroVec2()
	local secondSlotPos	= UI:ZeroVec2()

	local tempSlotEffect = _G.UI_SpawnEffect( "profile_achievements_slot", self:GetUiHandle() )
	if tempSlotEffect then
		slotSize = tempSlotEffect:GetObjSize( "self" )
		_G.UI_DestroyEffect( tempSlotEffect )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local workListRect = mainEffect:GetObjSize( "self" )

	local workListEffect = mainEffect
	if workListEffect then
		firstSlotPos	= workListEffect:GetObjPos( self.effectInfo.workList.firstSlotLocator )
		secondSlotPos	= workListEffect:GetObjPos( self.effectInfo.workList.secondSlotLocator )
	end

	local maskRect = self:GetLayerRect( self.layers.MASK )
	maskRect.x = maskRect.x + workListRect.x
	maskRect.y = maskRect.y + workListRect.y

	self.slotsRect.x = firstSlotPos.x
	self.slotsRect.y = firstSlotPos.y
	self.slotsRect.z = slotSize.x
	self.slotsRect.w = ( maskRect.y + maskRect.w ) - ( firstSlotPos.y - maskRect.y ) - firstSlotPos.y

	self.space_slots = secondSlotPos.y - firstSlotPos.y - slotSize.y

end


--
function UI.ProfileAchievements_List:Reset()

	self:ResetRecords()

	if self.scrollBar then
		self.scrollBar:SetRange( -1, -1 )
		self:SetScrollBarVisible( false )
	end

end


--
function UI.ProfileAchievements_List:ResetRecords()

	for id, record in pairs( self.records ) do
		self:RemoveRecord( id )
	end

	self.records	= {}
	self.firstId	= -1
	self.lastId		= -1	

end


--
function UI.ProfileAchievements_List:RemoveRecord( id )

	local record = self.records[ id ]
	if not record then
		return
	end

	record.slotWnd:Reset()
	record.slotWnd:UnlinkFromParent()

	--self.records[ id ] = nil	

end


--
function UI.ProfileAchievements_List:AddRecord( id )

	if self.records[ id ] then
		sys.log( "UI.ProfileAchievements_List:AddRecord()[ERROR]: already exists" )
		return self.records[ id ]
	end

	local record = {}

	record.id = id
	record.slotWnd = self:ObtainFreeSlotWnd()

	record.slotWnd:SetLeft( self.slotsRect.x --[[- self:GetLeft()]] )	
	record.slotWnd:Setup( id )

	self.records[ id ] = record

	return record

end


--
function UI.ProfileAchievements_List:ObtainFreeSlotWnd()

	for idx, slotWnd in pairs( self.slotWnds ) do
		if slotWnd:GetAchieveId() == -1 then
			return slotWnd
		end
	end

	local slotWnd = UI:CreateChildWnd( self, UI.ProfileAchievementsList_SlotWnd, tostring( #self.slotWnds + 1 ) )
	table.insert( self.slotWnds, slotWnd )

	return slotWnd

end


--
function UI.ProfileAchievements_List:InitScrollBar()

	self.scrollBar = UI.ProfileAchievementsList_ScrollBarWnd

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if not scrollEffect then
		return
	end

	local needSize = mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator ).y
	local baseSize = scrollEffect:GetObjSize( "self" ).y

	scrollEffect:SetScale( UI:Vec2( 1, needSize / baseSize ) )
	self.scrollBar:SetHeight( needSize )

end


--
function UI.ProfileAchievements_List:SetScrollBarVisible( bVisible )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if bVisible then

		--if not self.scrollBar:IsChildOf( self ) then
			UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.POS )		
		--end

	else

		--if self.scrollBar:IsChildOf( self ) then

    		self.scrollBar:UnlinkFromParent()

    		if mainEffect then
    			mainEffect:UnlinkWnd( self.scrollBar:GetUiHandle(), "" )
    		end

		--end

	end

end


--
function UI.ProfileAchievements_List:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self.achvIdToScroll = nil
	self.achvRankToScroll = nil
	--self:FullUpdate()

end


--
function UI.ProfileAchievements_List:FullUpdate()

	self:Reset()

	local achievements = UI.Profile:GetAchievements()
	if achievements and #achievements == 0 then
		return
	end

	self:UpdateScrollRange()

	if self.achvIdToScroll then
		local achvId = self.achvIdToScroll
		local rank = self.achvRankToScroll
		self.achvIdToScroll = nil
		self.achvRankToScroll = nil
		self:ScrollToAchieve( achvId, rank )
	else
		self:SetScrollPos( 1, true )
	end

end


--
function UI.ProfileAchievements_List:UpdateScrollRange()

	local min = -1
	local max = -1

	local achievements = UI.Profile:GetAchievements()
	if achievements and #achievements > 0 then
		min = 1--UI.Notifications:GetFirstNotificationId()
		max = self:MakeTail()
	end

	if self.scrollBar and max then
		self.scrollBar:SetRange( min, max )
		self:UpdateScrollBarVisibility()
	end

	return 

end


--
function UI.ProfileAchievements_List:UpdateScrollBarVisibility()

	local needScrollBar = math.abs( self:GetScrollPos() - self:GetMaxScrollPos() ) > 1e-3	-- TODO: what?
	self:SetScrollBarVisible( needScrollBar )	

end


--
function UI.ProfileAchievements_List:GetScrollPos()

	return self.scrollBar:GetPos()

end


--
function UI.ProfileAchievements_List:GetMaxScrollPos()

	return self.scrollBar:GetMax()

end


--
function UI.ProfileAchievements_List:GetMinScrollPos()

	return self.scrollBar:GetMin()

end


--
function UI.ProfileAchievements_List:GetSortAchievementsArray()
	return self.achievements
end


--
function UI.ProfileAchievements_List:MakeTail()
	local achievements = UI.Profile:GetAchievements()
	if achievements == nil then return end
	local categoryName
	local subcategoryName
	UI.ProfileAchievements_CategoriesListWnd:GetRecordData( recordIdx )
	if UI.ProfileAchievements_CategoriesListWnd:GetSelectedMainCategoryRecord() ~= -1 then
		categoryName = UI.ProfileAchievements_CategoriesListWnd:GetRecordData( UI.ProfileAchievements_CategoriesListWnd:GetSelectedMainCategoryRecord() ).categoryInfo.name
	end
	if UI.ProfileAchievements_CategoriesListWnd:GetSelectedSubCategoryRecord() ~= -1 then
		subcategoryName = UI.ProfileAchievements_CategoriesListWnd:GetRecordData( UI.ProfileAchievements_CategoriesListWnd:GetSelectedSubCategoryRecord() ).categoryInfo.name
	end

	if categoryName ~= nil then
		local filteredAchivments = {}
		local filteredAchivmentsCount = 0

		for i = 1, #achievements do
			local achiev = Achievements[ achievements[ i ].id ]
			if achiev.category == categoryName then
				if achiev.subCategory then
					if achiev.subCategory == subcategoryName then
						filteredAchivmentsCount = filteredAchivmentsCount + 1
						filteredAchivments[ filteredAchivmentsCount ] = achievements[ i ]
						filteredAchivments[ filteredAchivmentsCount ].realId = i
					end
				else
					if subcategoryName == nil then
						filteredAchivmentsCount = filteredAchivmentsCount + 1
						filteredAchivments[ filteredAchivmentsCount ] = achievements[ i ]
						filteredAchivments[ filteredAchivmentsCount ].realId = i
					end
				end
			end
		end

		achievements = filteredAchivments

	end

	--"invisible_by_default" flag
	local ach = {}
	for i = 1, #achievements do
		if not achievements[ i ].achieved and Achievements[ achievements[ i ].id ].invisible_by_default then
			
		else
			ach[ #ach + 1 ] = achievements[ i ]
		end
	end

	achievements = ach

	local function CompareByStatusUp( info1, info2 )
		if info1.achieved == nil and info2.achieved then return false end
		if info2.achieved == nil and info1.achieved then return true end
		if info1.achieved and info2.achieved then
			if info1.date ~= info2.date then
				return info1.date > info2.date
			end
		end
		if info1.id == info2.id then return info1.rank < info2.rank end
		return info1.id < info2.id
	end
	table.sort( achievements, CompareByStatusUp )

	self.achievements = achievements

	local firstId = 1
	local lastId = #achievements

	if achievements and #achievements == 0 then
		return 1
	end

	local maxScrollPos = firstId
	local size = self.slotsRect.y
	for id = firstId, lastId do
		local record = self.records[ id ]
		if not record then
			record = self:AddRecord( id )
			self:AddChild( record.slotWnd )
			record.slotWnd:SetData( id )
		end
		record.slotWnd.defaultTop = size
		local slotHeight = record.slotWnd:GetHeight()
		slotHeight = slotHeight + self.space_slots
		size = size + slotHeight
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local size2 = mainEffect:GetObjSize( "self" ).y
	maxScrollPos = math.max( 1, ( size - size2 + 50 ) / 50 )
	return maxScrollPos

end

--
function UI.ProfileAchievements_List:ScrollToAchieve( id, rank )

	if UI.ProfileAchievements_CategoriesListWnd.requestId then
		self.achvIdToScroll = id
		self.achvRankToScroll = rank
		return
	end

	self:SetScrollPos( 1, true )
	
	local recordIdx = -1
	
	for i = 1, #self.records do
		if self:GetSortAchievementsArray()[ self.records[ i ].slotWnd:GetAchieveId() ].id == id then
		
			if recordIdx == -1 then
				recordIdx = i
			end
			
			if rank == nil or rank == -1 then
				break
			end
			
			if self:GetSortAchievementsArray()[ self.records[ i ].slotWnd:GetAchieveId() ].rank == rank then
				recordIdx = i
				break
			end
			
		end
	end
	
	if recordIdx ~= -1 then
		local top = self.records[ recordIdx ].slotWnd:GetTop()
		top = ( top - self.slotsRect.y ) / 50 + 1
		self:SetScrollPos( top, true )
	end
	
end

--
function UI.ProfileAchievements_List:SetScrollPos( scrollPos, bUpdateScrollBar )

	scrollPos = UI:Clamp( scrollPos, 1, self.scrollBar:GetMax() )

	local achievements = self.achievements

	if achievements == nil then
		return
	end

	if achievements and #achievements == 0 then
		return
	end

	for i = 1, #self.records do
		self.records[ i ].slotWnd:SetTop( self.records[ i ].slotWnd.defaultTop - ( scrollPos - 1 ) * 50 )
	end

	if bUpdateScrollBar then
		self.scrollBar:SetPos( scrollPos )
	end

end


--
function UI.ProfileAchievements_List:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if eventSrc == UI.SCROLL_SRC_UNKNOWN then
		return
	end

	self:SetScrollPos( self.scrollBar:GetPos(), false )

end


--
function UI.ProfileAchievements_List:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		local lastPos = self:GetScrollPos()
		self:Scroll( -ticks, UI.SCROLL_SRC_WHEEL )
		if lastPos ~= self:GetScrollPos() then
			UI:PlayGlobalSound( UI.ProfileAchievements_CategoriesListWnd.sounds.itemsScrollRange )
		end
	end

	return true

end


--
function UI.ProfileAchievements_List:Scroll( delta, eventSrc )

	local curPos = self.scrollBar:GetPos()
	local nextPos = curPos

	if delta > 0 then
		nextPos = math.floor( curPos + math.abs( delta ) )	

	elseif delta < 0 then
		nextPos = math.ceil( curPos - math.abs( delta ) )
	end

	self.scrollBar:SetPos( nextPos, eventSrc )

end


--
function UI.ProfileAchievements_List:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self:ToScreen( self:GetLayerRect( self.layers.MASK ) )
	local hTexMask = self:GetTexture( self.layers.MASK )

	UI.drawer:BeginMask( hTexMask, maskRect )
	_G.Font_BeginMask( hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

	_G.Font_EndMask()
	UI.drawer:EndMask()

end



-- -------------------------------------------------------------------------------
-- UI.ProfileAchievementsList_ScrollBarWnd
-- -------------------------------------------------------------------------------

UI.ProfileAchievementsList_ScrollBarWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ProfileAchievementsList_ScrollBarWnd.def =
{
	className	= "ScrollWnd",
	prototype	= "EffectScrollWnd_Vrt",

	props =
	{
		name		= "ProfileAchievementsList_ScrollBarWnd",
		scrollStyle = UI.SWS_VERTICAL + UI.SWS_THUMB_RESIZABLE,
	}	
}

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ProfileAchievementsList_ScrollBarWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	local curPos = self:GetPos()

	if wndThatReceivedInput == self:GetPrevBtnHandle() then		
		UI.ProfileAchievements_List:Scroll( -1, UI.SCROLL_SRC_UP_BTN )

	elseif wndThatReceivedInput == self:GetNextBtnHandle() then
		UI.ProfileAchievements_List:Scroll( 1, UI.SCROLL_SRC_DOWN_BTN )

	elseif wndThatReceivedInput == self:GetPrevPageHandle() then
		UI.ProfileAchievements_List:Scroll( -1, UI.SCROLL_SRC_UP_PAGE )

	elseif wndThatReceivedInput == self:GetNextPageHandle() then
		UI.ProfileAchievements_List:Scroll( 1, UI.SCROLL_SRC_DOWN_PAGE )

	else
		return self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	end

	return false

end


-- ---------------------------------------
-- ProfileAchievementsList_SlotWnd
-- ---------------------------------------


UI.ProfileAchievementsList_SlotWnd = {}

UI.ProfileAchievementsList_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    ICO_EFFECT			= 1,
    NAME				= 2,
    TEXT				= 3,
    PRICE_EFFECT		= 4,
    PRICE_VAL			= 5,
    PRICE_2_EFFECT		= 6,
    PRICE_2_VAL			= 7,
    TIME_EFFECT			= 8,
    TIME_TEXT			= 9,
    DECOR_EFFECT		= 10,
}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.ProfileAchievementsList_SlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ProfileAchievementsList_SlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ProfileAchievementsList_SlotWnd.layers.PRICE_EFFECT,
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName 			= "profile_achievements_slot",
				defaultAnimation	= "idle_activ",

				links =
				{
					{
						objName		= "icon",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					-- умышленно не линкуетс€ по SIZE
					{
						objName		= "description",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "price",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.PRICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS
					},

					{
						objName		= "time",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.TIME_EFFECT",
						animParams	= UI.EffectAnimParams.POS
					},

					{
						objName		= "decor_1",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.DECOR_EFFECT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_achievements_slot_ico",
				defaultAnimation	= "active",
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,

   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.PRICE_2_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_2_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_achievements_slot_time",

				links =
				{
					{
						objName		= "text",	
						layer		= "UI.ProfileAchievementsList_SlotWnd.layers.TIME_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TIME_TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- DECOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "profile_achievements_slot_decor",
				defaultAnimation	= "idle",
			}}
		}
	}
}


-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.ProfileAchievementsList_SlotWnd.achieveId			= -1
UI.ProfileAchievementsList_SlotWnd.maxHeight			= 0
UI.ProfileAchievementsList_SlotWnd.minHeight			= 0
UI.ProfileAchievementsList_SlotWnd.space_text_bottom	= 0
UI.ProfileAchievementsList_SlotWnd.metaText				= nil
UI.ProfileAchievementsList_SlotWnd.progressSpace		= 0
UI.ProfileAchievementsList_SlotWnd.dependensSpace		= 0
UI.ProfileAchievementsList_SlotWnd.dependensSpace2		= 0
UI.ProfileAchievementsList_SlotWnd.unlockSpace			= 0
UI.ProfileAchievementsList_SlotWnd.endSpace				= 0
UI.ProfileAchievementsList_SlotWnd.unlockLeft			= 0
UI.ProfileAchievementsList_SlotWnd.dependensLeft		= 0
UI.ProfileAchievementsList_SlotWnd.dependensLeft2		= 0

UI.ProfileAchievementsList_SlotWnd.dependensWnd			= nil
UI.ProfileAchievementsList_SlotWnd.globalFreedependensWnd = {}
UI.ProfileAchievementsList_SlotWnd.usedWnd				= 0
UI.ProfileAchievementsList_SlotWnd.priceMetaText		= nil
UI.ProfileAchievementsList_SlotWnd.price2MetaText		= nil

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.ProfileAchievementsList_SlotWnd:Setup( id )
	self.id = id
	--self:FullUpdate()
end

--
function UI.ProfileAchievementsList_SlotWnd:SetData( achievId )
	self.achievId = achievId
	self:FullUpdate()
end

--
function UI.ProfileAchievementsList_SlotWnd:GetAchieveId()
	return self.id
end

--
function UI.ProfileAchievementsList_SlotWnd:Reset()
	self.id = -1
	self.usedWnd = 0
	for i = 1, #self.dependensWnd do
		--table.insert( UI.ProfileAchievementsList_SlotWnd.globalFreedependensWnd, self.dependensWnd[ i ] )
		self:RemoveChild( self.dependensWnd[ i ] )
	end
end


-- ---------------------------------------
-- const
-- ---------------------------------------


UI.ProfileAchievementsList_SlotWnd.effectInfo =
{
	main =
	{
		minSizeLocator		= "distmin",		
		maxSizeLocator		= "self",
		textLocator			= "description",
		dependens1Locator	= "string_1",
		dependens2Locator	= "string_2",
		dependens3Locator	= "string_3",
		progressLocator		= "progress",
		unlockLocator		= "anlock",
		textMinLocator		= "text_min",
		priceLocator		= "price",
	},

	ico =
	{
		icoSpriteName	= "ico",
	},
}

UI.ProfileAchievementsList_SlotWnd.awards = {}


-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.ProfileAchievementsList_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.dependensWnd = {}

	local maxSize
	local minSize
	local progressPos
	local progressSize
	local textMinPos
	local textMinSize
	local unlockPos
	local unlockSize
	local dependens1Pos
	local dependens1Size
	local dependens2Pos
	local dependens2Size
	local pricePos
	local priceSize

	self.awards = {}

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		mainEffect:SetAnimationTime( 1 )
		mainEffect:Update( 0 )
		
		local priceEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )

		maxSize = mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )
		minSize = mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )
		progressPos = mainEffect:GetObjPos( self.effectInfo.main.progressLocator )
		progressSize = mainEffect:GetObjSize( self.effectInfo.main.progressLocator )
		dependens1Pos = mainEffect:GetObjPos( self.effectInfo.main.dependens1Locator )
		dependens1Size = mainEffect:GetObjSize( self.effectInfo.main.dependens1Locator )
		dependens2Pos = mainEffect:GetObjPos( self.effectInfo.main.dependens2Locator )
		dependens2Size = mainEffect:GetObjSize( self.effectInfo.main.dependens2Locator )
		dependens3Pos = mainEffect:GetObjPos( self.effectInfo.main.dependens3Locator )
		textMinPos = mainEffect:GetObjPos( self.effectInfo.main.textMinLocator )
		textMinSize = mainEffect:GetObjSize( self.effectInfo.main.textMinLocator )
		unlockPos = mainEffect:GetObjPos( self.effectInfo.main.unlockLocator )
		unlockSize = mainEffect:GetObjSize( self.effectInfo.main.unlockLocator )
		pricePos = mainEffect:GetObjPos( self.effectInfo.main.priceLocator )
		priceSize = priceEffect and priceEffect:GetObjSize( "self" ) or Vec2( 0, 0)

		self.maxHeight	= maxSize.y
		self.minHeight	= minSize.y
		self.progressSpace = progressPos.y - ( textMinPos.y + textMinSize.y )
		self.dependensSpace = dependens1Pos.y - ( progressPos.y + progressSize.y )
		self.dependensSpace2 = dependens2Pos.y - ( dependens1Pos.y + dependens1Size.y )
		--self.unlockSpace = unlockPos.y - ( progressPos.y + progressSize.y )
		self.unlockSpace = unlockPos.y - ( dependens2Pos.y + dependens2Size.y )
		self.endSpace = maxSize.y - ( pricePos.y + priceSize.y ) --minSize.y - ( unlockPos.y + unlockSize.y )
		self.unlockLeft = unlockPos.x
		self.dependensLeft = dependens1Pos.x
		self.dependensLeft2 = dependens3Pos.x

		local textY			= self:GetLayerTop( self.layers.TEXT )
		local maxTextSize	= mainEffect:GetObjSize( self.effectInfo.main.textLocator )

		--self.space_text_bottom = maxSize.y - ( textY + maxTextSize.y )

		self:SetWidth( maxSize.x )
		self:SetLayerWidth( maxTextSize.x, self.layers.TEXT )		

	end

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 
	self.metaText:SetFormatRectSize( UI:Vec2( self:GetLayerWidth( self.layers.TEXT ), 1000000 ), true )

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE_VAL )	

	self.price2MetaText = UI.MetaText.GetNewInstance()
	self.price2MetaText:InitFromLayer( self, self.layers.PRICE_2_VAL )	

	self.progressWnd = UI:CreateChildWnd( self, UI.ProfileAchievementsListSlot_ProgressWnd, "1" )
	self.progressWnd:SetLeft( progressPos.x )
	self:AddChild( self.progressWnd )

end

--
function UI.ProfileAchievementsList_SlotWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	if self.price2MetaText then
		self.price2MetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end

--
function UI.ProfileAchievementsList_SlotWnd:FullUpdate()

	self:UpdateContent()
	self:RecalcLayout()

end

--
function UI.ProfileAchievementsList_SlotWnd:GetFreeDependenceWnd()
	--[[if #UI.ProfileAchievementsList_SlotWnd.globalFreedependensWnd > 0 then
		local wnd = UI.ProfileAchievementsList_SlotWnd.globalFreedependensWnd[ #UI.ProfileAchievementsList_SlotWnd.globalFreedependensWnd ]
		table.remove( UI.ProfileAchievementsList_SlotWnd.globalFreedependensWnd, #UI.ProfileAchievementsList_SlotWnd.globalFreedependensWnd )
		return wnd
	end]]
	if self.usedWnd < #self.dependensWnd then
		self.usedWnd = self.usedWnd + 1
		return self.dependensWnd[ self.usedWnd ]
	end
	self.usedWnd = self.usedWnd + 1
	local wnd = UI:CreateChildWnd( self, UI.ProfileAchievementsListSlot_DependenceWnd, tostring( #self.dependensWnd + 1 ) )
	table.insert( self.dependensWnd, wnd )
	return wnd
end

--
function UI.ProfileAchievementsList_SlotWnd:UpdateContent()

	--self:Reset()

	local achiev = UI.ProfileAchievements_List:GetSortAchievementsArray()[ self.achievId ]
	local name = UI:Achievement2Str( achiev.id, achiev.rank )
	local desc = UI:GetAchievementConditionStr( achiev.id, achiev.rank )
	local ico = UI:GetAchievementIco( achiev.id, achiev.rank )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if achiev.achieved then
		mainEffect:StartAnimation( "idle_activ" )
		icoEffect:StartAnimation( "active" )
		self:SetLayerVisible( true, self.layers.TIME_EFFECT )
		self:SetLayerVisible( true, self.layers.TIME_TEXT )
		local data = _G.MasterServer_ServerTimeToLocalTimeT( achiev.date )
		self:SetText( UI:DateTime2Date( data ), self.layers.TIME_TEXT )
		self:SetLayerVisible( true, self.layers.DECOR_EFFECT )
	else
		mainEffect:StartAnimation( "idle_inactiv" )
		icoEffect:StartAnimation( "inactive" )
		self:SetLayerVisible( false, self.layers.TIME_EFFECT )
		self:SetLayerVisible( false, self.layers.TIME_TEXT )
		self:SetLayerVisible( false, self.layers.DECOR_EFFECT )
	end

	self.metaText:SetText( desc, true )

	local fp = self.metaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )

	local textHeight = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		fp.hFont,
   		formatRect,
   		fp.formatFlags,
   		formatRect ).w

	local textY = self:GetLayerTop( self.layers.TEXT )

	local selfHeight = textY + textHeight --UI:Clamp( textY + textHeight + self.space_text_bottom, self.minHeight, self.maxHeight )

	self:SetText( name, self.layers.NAME )

	local points = Achievements[ achiev.id ].ranks[ achiev.rank ].points

	local price2Info =
	{
		priceType	= _G.GameStore.CreditsType.CT_GOLD,
		val			= Achievements[ achiev.id ].ranks[ achiev.rank ].gold or 0,
		bIsBuyPrice	= false,
	}
	
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, ico )
	end

	--progress
	if Achievements[ achiev.id ].ranks[ achiev.rank ].value > 1 and Achievements[ achiev.id ].parts == nil then
		selfHeight = selfHeight + self.progressSpace
		self:AddChild( self.progressWnd )
		local max = Achievements[ achiev.id ].ranks[ achiev.rank ].value
		local cur = achiev.value
		self.progressWnd:SetProgress( cur, max )
		self.progressWnd:SetTop( selfHeight )
		selfHeight = selfHeight + self.progressWnd:GetHeight()
	else
		self:RemoveChild( self.progressWnd )
	end
	
	if achiev.achieved and UI.Profile:GetAchieveRankCount( achiev.id ) ~= 1 then
		-- last achieve ranks
		for i = 1, #self.dependensWnd do
			self.dependensWnd[ i ]:UnlinkFromParent()
		end
		selfHeight = selfHeight + self.dependensSpace
		points = 0--Achievements[ achiev.id ].ranks[ achiev.rank ].points
		local priceGold = 0
		local max = math.min( UI.Profile:GetAchieveRankCount( achiev.id ), achiev.rank + 1 )
		for i = 1, max do
			if i ~= 1 then
				selfHeight = selfHeight + self.dependensSpace2
			end
			local wnd = self:GetFreeDependenceWnd()
			wnd:SetLeft( self.dependensLeft )
			wnd:SetTop( selfHeight )
			wnd:Update( UI.ProfileAchievementsListSlot_DependenceWnd.types.ACHIEVEMENT, achiev.id, UI.Profile:IfAchievementUnlocked( achiev.id, i ), i, true )
			selfHeight = selfHeight + wnd:GetHeight()
			self:AddChild( wnd )
			if UI.Profile:IfAchievementUnlocked( achiev.id, i ) then
				points = points + Achievements[ achiev.id ].ranks[ i ].points
				priceGold = priceGold + ( Achievements[ achiev.id ].ranks[ i ].gold or 0 )
			end
		end
		price2Info.val = priceGold
	else
		-- dependense
		for i = 1, #self.dependensWnd do
			self.dependensWnd[ i ]:UnlinkFromParent()
		end
		self.usedWnd = 0
		if Achievements[ achiev.id ].parts then
			selfHeight = selfHeight + self.dependensSpace
			for i = 1, #Achievements[ achiev.id ].parts do
				if i ~= 1 then
					selfHeight = selfHeight + self.dependensSpace2
				end
				local wnd = self:GetFreeDependenceWnd()
				wnd:SetLeft( self.dependensLeft )
				wnd:SetTop( selfHeight )
				if Achievements[ achiev.id ].part_type == ai.AchievementPartType.ACHIEVEMENT then
					wnd:Update( UI.ProfileAchievementsListSlot_DependenceWnd.types.ACHIEVEMENT, Achievements[ achiev.id ].parts[ i ], bit.band( achiev.value or 0, math.pow( 2, i - 1 ) ) == math.pow( 2, i - 1 ), UI.Profile:GetAchieveRankCount( Achievements[ achiev.id ].parts[ i ] ) )
				elseif Achievements[ achiev.id ].part_type == ai.AchievementPartType.SPACE_ZONE then
					wnd:Update( UI.ProfileAchievementsListSlot_DependenceWnd.types.SPACE_ZONE, Achievements[ achiev.id ].parts[ i ], bit.band( achiev.value or 0, math.pow( 2, i - 1 ) ) == math.pow( 2, i - 1 ) )
				elseif Achievements[ achiev.id ].part_type == ai.AchievementPartType.ITEM_NAME then
					wnd:Update( UI.ProfileAchievementsListSlot_DependenceWnd.types.ITEM_NAME, Achievements[ achiev.id ].parts[ i ], bit.band( achiev.value or 0, math.pow( 2, i - 1 ) ) == math.pow( 2, i - 1 ) )
				elseif Achievements[ achiev.id ].part_type == ai.AchievementPartType.SHIP_ROLE then
					wnd:Update( UI.ProfileAchievementsListSlot_DependenceWnd.types.SHIP_ROLE, Achievements[ achiev.id ].parts[ i ], bit.band( achiev.value or 0, math.pow( 2, i - 1 ) ) == math.pow( 2, i - 1 ) )
					if i % 2 == 0 then
						wnd:SetLeft( self.dependensLeft2 )
					else
						if i ~= #Achievements[ achiev.id ].parts then
							selfHeight = selfHeight - wnd:GetHeight()
						end
					end
				elseif Achievements[ achiev.id ].part_type == ai.AchievementPartType.SHIP_NAME then
					wnd:Update( UI.ProfileAchievementsListSlot_DependenceWnd.types.SHIP_NAME, Achievements[ achiev.id ].parts[ i ], bit.band( achiev.value or 0, math.pow( 2, i - 1 ) ) == math.pow( 2, i - 1 ) )
					if i % 2 == 0 then
						wnd:SetLeft( self.dependensLeft2 )
					else
						if i ~= #Achievements[ achiev.id ].parts then
							selfHeight = selfHeight - wnd:GetHeight()
						end
					end
				elseif Achievements[ achiev.id ].part_type == ai.AchievementPartType.QUEST then
					wnd:Update( UI.ProfileAchievementsListSlot_DependenceWnd.types.QUEST, Achievements[ achiev.id ].parts[ i ], bit.band( achiev.value or 0, math.pow( 2, i - 1 ) ) == math.pow( 2, i - 1 ) )
				else
					wnd:UnlinkFromParent()
					sys.log( "UI.ProfileAchievementsList_SlotWnd:UpdateContent()[ERROR]: unknown part's type: %d", Achievements[ achiev.id ].part_type )
				end
				selfHeight = selfHeight + wnd:GetHeight()
				self:AddChild( wnd )
			end
		end
	end
	
	local strPoints = string.format( "%s: %s", UI:GetStringByName( "achievePoints" ), UI:Num2StrSeparatedBy3( points ) )
	local strPointsLink = string.format( "$link [type CUSTOM_TEXT] [params {text=\"%s\", tooltipTextId=\"achievePointsPriceTooltip_desc\", tooltipCaptionId=\"achievePointsPriceTooltip_caption\", colorUnsel=%u, colorSel=%u}]$", strPoints, self:GetColor( self.layers.PRICE_VAL ), self:GetColor( self.layers.PRICE_VAL ) )
	
	local strPrice2	= price2Info.val > 0 and UI:PriceInfo2Str( price2Info, self:GetColor( self.layers.PRICE_2_VAL ), false, false, true, nil ) or ""

	self.priceMetaText:SetText( strPointsLink, true )
	self.price2MetaText:SetText( strPrice2, true )

	--awards
	for i = 1, #self.awards do
		self:RemoveChild( self.awards[ i ] )
	end
	local awards = UI.ProfileAchievements_CategoriesListWnd.achiveUnlockStickers[ achiev.id ]
	if awards ~= nil then 
		for i = 1, #awards do
			if self.awards[ i ] == nil then
				self.awards[ i ] = UI:CreateChildWnd( self, UI.ProfileAchievementsListSlot_AwardWnd, i )
			end
			selfHeight = selfHeight + self.unlockSpace
			self.awards[ i ]:SetLeft( self.unlockLeft )
			self.awards[ i ]:SetTop( selfHeight )
			self:AddChild( self.awards[ i ] )
			
			local award_type = VesselCustomElements[awards[ i ]].type
			if award_type == ai.VesselCustomElementType.STICKER then
				self.awards[ i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.STICKER, awards[ i ] )
			elseif award_type == ai.VesselCustomElementType.MATERIAL then
				self.awards[ i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.MATERIAL, awards[ i ] )
			elseif award_type == ai.VesselCustomElementType.CHILD then
				self.awards[ i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.CHILD, awards[ i ] )
			elseif award_type == ai.VesselCustomElementType.MPRESET then
				self.awards[ i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.MPRESET, awards[ i ] )
			end
			--self.awards[ i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.STICKER, awards[ i ] )
			
			selfHeight = selfHeight + self.awards[ i ]:GetHeight()
		end
	end
	
	local awardCount = awards and #awards or 0
	
	awards = UI.ProfileAchievements_CategoriesListWnd.achiveUnlockTitle[ achiev.id ] and UI.ProfileAchievements_CategoriesListWnd.achiveUnlockTitle[ achiev.id ][ achiev.rank ]
	if awards then
		for i = 1, #awards do
			if self.awards[ awardCount + i ] == nil then
				self.awards[ awardCount + i ] = UI:CreateChildWnd( self, UI.ProfileAchievementsListSlot_AwardWnd, awardCount + i )
			end
			selfHeight = selfHeight + self.unlockSpace
			self.awards[ awardCount + i ]:SetLeft( self.unlockLeft )
			self.awards[ awardCount + i ]:SetTop( selfHeight )
			self:AddChild( self.awards[ awardCount + i ] )
			self.awards[ awardCount + i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.TITLE, awards[ i ] )
			selfHeight = selfHeight + self.awards[ awardCount + i ]:GetHeight()
		end
	end

	awardCount = awardCount + ( awards and #awards or 0 )
	
	awards = UI.ProfileAchievements_CategoriesListWnd.achiveUnlockPremiumAccess[ achiev.id ] and UI.ProfileAchievements_CategoriesListWnd.achiveUnlockPremiumAccess[ achiev.id ][ achiev.rank ]
	if awards then
		for i = 1, #awards do
			if self.awards[ awardCount + i ] == nil then
				self.awards[ awardCount + i ] = UI:CreateChildWnd( self, UI.ProfileAchievementsListSlot_AwardWnd, awardCount + i )
			end
			selfHeight = selfHeight + self.unlockSpace
			self.awards[ awardCount + i ]:SetLeft( self.unlockLeft )
			self.awards[ awardCount + i ]:SetTop( selfHeight )
			self:AddChild( self.awards[ awardCount + i ] )
			self.awards[ awardCount + i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.PREMIUM_ACCESS, awards[ i ] )
			selfHeight = selfHeight + self.awards[ awardCount + i ]:GetHeight()
		end
	end

	awardCount = awardCount + ( awards and #awards or 0 )

	awards = UI.ProfileAchievements_CategoriesListWnd.achiveUnlockShip[ achiev.id ] and UI.ProfileAchievements_CategoriesListWnd.achiveUnlockShip[ achiev.id ][ achiev.rank ]
	if awards then
		for i = 1, #awards do
			if self.awards[ awardCount + i ] == nil then
				self.awards[ awardCount + i ] = UI:CreateChildWnd( self, UI.ProfileAchievementsListSlot_AwardWnd, awardCount + i )
			end
			selfHeight = selfHeight + self.unlockSpace
			self.awards[ awardCount + i ]:SetLeft( self.unlockLeft )
			self.awards[ awardCount + i ]:SetTop( selfHeight )
			self:AddChild( self.awards[ awardCount + i ] )
			self.awards[ awardCount + i ]:SetAwardTypeAndName( UI.ProfileAchievementsListSlot_AwardWnd.types.SHIP, awards[ i ] )
			selfHeight = selfHeight + self.awards[ awardCount + i ]:GetHeight()
		end
	end

	awardCount = awardCount + ( awards and #awards or 0 )	
	
	selfHeight = selfHeight + self.unlockSpace
	local priceEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )
	local priceHeight = priceEffect and priceEffect:GetObjSize( "self" ).y or 0
	selfHeight = selfHeight + priceHeight

	selfHeight = selfHeight + self.endSpace

	-- award realign
	if selfHeight < self.minHeight then
		if self.awards ~= nil then 
			local top = self.minHeight - self.endSpace - priceHeight - self.unlockSpace
			for i = #self.awards, 1, -1 do
				if self.awards[ i ]:IsChildOf( self ) then
    				top = top - self.awards[ i ]:GetHeight()
    				self.awards[ i ]:SetTop( top )
    				top = top - self.unlockSpace
				end
			end
		end
	end

	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )
	--
	self:SetHeight( selfHeight )
	mainEffect:SetAnimationTime( ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight ) )
	self:UpdateEffects()

end


--
function UI.ProfileAchievementsList_SlotWnd:RecalcLayout()

	--
	--[[local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local fp = self.metaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, fp.formatRectSize.x, fp.formatRectSize.y )

	local textHeight = _G.MeasureText(
   		self.metaText:GetFormattedText(),
   		fp.hFont,
   		formatRect,
   		fp.formatFlags,
   		formatRect ).w

	local textY = self:GetLayerTop( self.layers.TEXT )

	local selfHeight = UI:Clamp( textY + textHeight + self.space_text_bottom, self.minHeight, self.maxHeight )

	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )]]

end


--
function UI.ProfileAchievementsList_SlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываетьс€ при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.ProfileAchievementsList_SlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	local priceEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )
	local price2Effect = UI:GetEffectFromLayer( self, self.layers.PRICE_2_EFFECT )
	local pricePos = mainEffect:GetObjPos( "price" )
	--price2Effect:SetTop( pricePos.y )
	local space = mainEffect:GetObjPos( "price" ).x - ( mainEffect:GetObjPos( "price2" ).x + mainEffect:GetObjSize( "price2" ).x )

	local fp = self.priceMetaText:GetFormatParams()
	local formatRect = UI:Quat( 0, 0, 10000, fp.formatRectSize.y )
	local textWidth = _G.MeasureText(
	   		self.priceMetaText:GetFormattedText(),
	   		fp.hFont,
	   		formatRect,
	   		fp.formatFlags,
	   		formatRect ).z

	local priceRight = mainEffect:GetObjPos( "price" ).x + priceEffect:GetObjPos( "price_3" ).x + priceEffect:GetObjSize( "price_3" ).x
	price2Effect:SetPos( UI:Vec2( priceRight - space - price2Effect:GetObjSize( "self" ).x - textWidth, pricePos.y ) )

	self:UpdateMetaTextPos()

end


--
function UI.ProfileAchievementsList_SlotWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )
	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_VAL )	
	self.price2MetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_2_VAL )	

end


--
function UI.ProfileAchievementsList_SlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.ProfileAchievementsList_SlotWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_VAL then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_2_VAL then
		self.price2MetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


-- ------------------------------------------------------------------------
-- UI.ProfileAchievementsListSlot_ProgressWnd
-- ------------------------------------------------------------------------

UI.ProfileAchievementsListSlot_ProgressWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name		= "ProfileAchievementsListSlot_ProgressWnd",
			isPrototype = true,
		},

		layers = 
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				updatable	= false,

				effects =
				{{
					defName 			= "hangar_shipInfo_level",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "text1",	
							layer		= "UI.ProfileAchievementsListSlot_ProgressWnd.layers.PROGRESS_TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- PROGRESS_TEXT
			{
				layerType		= UI.LAYER_TEXT,

	   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
		}
	}
}

--
UI.ProfileAchievementsListSlot_ProgressWnd.layers = 
{
	MAIN_EFFECT			= 0,
	PROGRESS_TEXT		= 1,
}

--
function UI.ProfileAchievementsListSlot_ProgressWnd:F_OnAfterShowOnScreen()
	self:UpdateEffects()
end

--
function UI.ProfileAchievementsListSlot_ProgressWnd:F_OnScreenPosChanged()
	self:UpdateEffects()
end

--
function UI.ProfileAchievementsListSlot_ProgressWnd:UpdateEffects()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:Update( 0 )
end


--
function UI.ProfileAchievementsListSlot_ProgressWnd:SetProgress( cur, max )
	if cur > max then
		cur = max
	end
	--self:SetText( tostring( cur ), self.layers.PROGRESS_TEXT1 )
	self:SetText( UI:Num2StrSeparatedBy3( cur ).."/"..UI:Num2StrSeparatedBy3( max ), self.layers.PROGRESS_TEXT )
	--self:SetText( tostring( max ), self.layers.PROGRESS_TEXT3 )
	local progressEfect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	progressEfect:SetAnimationTime( cur / max )
	progressEfect:Update( 0 )
end


-- ------------------------------------------------------------------------
-- UI.ProfileAchievementsListSlot_AwardWnd
-- ------------------------------------------------------------------------

UI.ProfileAchievementsListSlot_AwardWnd =
{
	def =
	{
		className	= "Wnd",

		props =
		{
			name		= "ProfileAchievementsListSlot_AwardWnd",
			isPrototype = true,
		},

		layers = 
		{
			-- MAIN_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				updatable	= false,

				effects =
				{{
					defName 			= "profile_achievements_slot_award",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "title",	
							layer		= "UI.ProfileAchievementsListSlot_AwardWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},

			-- TEXT
			{
				layerType		= UI.LAYER_TEXT,
				layerStyle		= UI.WLS_OWNERDRAW,

	   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
		}
	}
}

--
UI.ProfileAchievementsListSlot_AwardWnd.layers = 
{
	MAIN_EFFECT			= 0,
	TEXT				= 1,
}

UI.ProfileAchievementsListSlot_AwardWnd.types = 
{
	STICKER				= 0,
	TITLE				= 1,
	SHIP				= 2,
	MATERIAL			= 3,
	CHILD				= 4,
	MPRESET				= 5,
	PREMIUM_ACCESS		= 6,
}

UI.ProfileAchievementsListSlot_AwardWnd.metaText = nil


--
function UI.ProfileAchievementsListSlot_AwardWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.metaText = UI.MetaText.GetNewInstance()
	self.metaText:InitFromLayer( self, self.layers.TEXT ) 	

end


--
function UI.ProfileAchievementsListSlot_AwardWnd:F_Shutdown()

	if self.metaText then
		self.metaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ProfileAchievementsListSlot_AwardWnd:UpdateMetaTextPos()

	self.metaText:UpdateScreenOrgFromLayer( self, self.layers.TEXT )

end


--
function UI.ProfileAchievementsListSlot_AwardWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.TEXT then
		self.metaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end

--
function UI.ProfileAchievementsListSlot_AwardWnd:F_OnAfterShowOnScreen()
	self:OnAfterShowOnScreen()
	self:UpdateEffects()
end

--
function UI.ProfileAchievementsListSlot_AwardWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )
	self:OnScreenPosChanged( oldScreenX, oldScreenY )
	self:UpdateEffects()
end

--
function UI.ProfileAchievementsListSlot_AwardWnd:UpdateEffects()
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	mainEffect:Update( 0 )
	self:UpdateMetaTextPos()
end


--
function UI.ProfileAchievementsListSlot_AwardWnd:SetAwardTypeAndName( typ, id )
	
	if typ == self.types.STICKER then
		self.metaText:SetText( UI:GetStringByName( "profile_achiev_reward_STICKER" ).." @ffffdeb3"..tostring( UI:Sticker2Str( id ) ), true )
	elseif typ == self.types.TITLE then
		self.metaText:SetText( UI:GetStringByName( "profile_achiev_reward_TITLE" ).." @ffffdeb3"..tostring( UI:Title2Str( id ) ), true )
	elseif typ == self.types.MPRESET then
		self.metaText:SetText( UI:GetStringByName( "profile_achiev_reward_MPRESET" ).." @ffffdeb3"..tostring( UI:ShipCustomPreset2Str( id ) ), true )
	elseif typ == self.types.MATERIAL then
		self.metaText:SetText( UI:GetStringByName( "profile_achiev_reward_MATERIAL" ).." @ffffdeb3"..tostring( UI:ShipCustomColor2Str( id ) ), true )
	elseif typ == self.types.CHILD then
		self.metaText:SetText( UI:GetStringByName( "profile_achiev_reward_CHILD" ).." @ffffdeb3"..tostring( UI:ShipCustomChild2Str( id ) ), true )
	elseif typ == self.types.PREMIUM_ACCESS then
		self.metaText:SetText( UI:GetStringByName( "profile_achiev_reward_PREMIUM_ACCESS" ).." @ffffdeb3"..UI:GetStringByName( "profile_achiev_reward_PREMIUM_ACCESS_duration" ), true )
	elseif typ == self.types.SHIP then
		local strShipLink = string.format( "$link [type SHIP][params {defName=\"%s\"}]$", id )
		self.metaText:SetText( UI:GetStringByName( "profile_achiev_reward_SHIP" ) .. " " .. strShipLink, true )
	end
end


-- ------------------------------------------------------------------------
-- UI.ProfileAchievementsListWnd_CrossBtn
-- ------------------------------------------------------------------------

UI.ProfileAchievementsListWnd_CrossBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "CrossBtn",

		props =
		{
			name	= "ProfileAchievementsListWnd_CrossBtn"
		}
	}
}


-- ------------------------------------------------------------------------
-- UI.ProfileAchievementsListSlot_DependenceWnd
-- ------------------------------------------------------------------------

UI.ProfileAchievementsListSlot_DependenceWnd =
{
	def =
	{
		className	= "Wnd",
		props =
		{
			name		= "ProfileAchievementsListSlot_DependenceWnd",
			isPrototype = true,
			style 		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
					defName 			= "profile_achievements_slot_depend",
					defaultAnimation	= "idle_activ",
					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},
						{
							objName		= "acheiv",	
							layer		= "UI.ProfileAchievementsListSlot_DependenceWnd.layers.ICO_EFFECT",
							animParams	= UI.EffectAnimParams.POS,
						},
						{
							objName		= "description",	
							layer		= "UI.ProfileAchievementsListSlot_DependenceWnd.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
						{
							objName		= "description_2",	
							layer		= "UI.ProfileAchievementsListSlot_DependenceWnd.layers.TEXT_2",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
			-- ICO_EFFECT
			{
				layerType	= UI.LAYER_EFFECT,
				layerStyle	= UI.WLS_RESIZABLE,
				effects =
				{{
					defName 			= "profile_achievements_slot_depend_ico",
					defaultAnimation	= "idle",
				}}
			},
			-- TEXT
			{
				layerType		= UI.LAYER_TEXT,

	   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
			-- TEXT_2
			{
				layerType		= UI.LAYER_TEXT,

	   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
	   			formatInfoSz	= { 1, 1 },
	   			font			= { fontName = "Small" },
			},
		}
	}
}

UI.ProfileAchievementsListSlot_DependenceWnd.GetTooltipData = function( self )
	if self.type == self.types.ACHIEVEMENT then
		--[[if self.fake then
			return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				text = UI:GetAchievementConditionStr( self.achieveId, self.rank ),
				caption = UI:DateTime2Date( _G.MasterServer_ServerTimeToLocalTimeT( UI.Profile:GetAchieveUnlockData( self.achieveId, self.rank ) ) )
			}
		else
			return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				text = UI:GetAchievementConditionStr( self.achieveId, self.rank ),
				caption = UI:Achievement2Str( self.achieveId, self.rank )
			}
		end]]
		return 
			{
				tooltipType = UI.tooltipTypes.TEXT_LARGE,
				text = UI:GetAchievementConditionStr( self.achieveId, self.rank ),
				caption = UI:Achievement2Str( self.achieveId, self.rank )
			}
	else
		return nil
	end
end


--
UI.ProfileAchievementsListSlot_DependenceWnd.layers = 
{
	MAIN_EFFECT			= 0,
	ICO_EFFECT 			= 1,
	TEXT				= 2,
	TEXT_2 				= 3,
}

--
UI.ProfileAchievementsListSlot_DependenceWnd.types = 
{
	ACHIEVEMENT 		= 0,
	SPACE_ZONE 			= 1,
	SHIP_ROLE 			= 2,
	SHIP_NAME 			= 3,
	ITEM_NAME 			= 4,
	QUEST 				= 5,
}

UI.ProfileAchievementsListSlot_DependenceWnd.achieveId = nil
UI.ProfileAchievementsListSlot_DependenceWnd.type = nil
UI.ProfileAchievementsListSlot_DependenceWnd.rank = 1
UI.ProfileAchievementsListSlot_DependenceWnd.fake = false

--
function UI.ProfileAchievementsListSlot_DependenceWnd:Update( partType, id, achieved, rank, fake )
	self.type = partType
	self:SetText( "", self.layers.TEXT_2 )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if self.type == self.types.ACHIEVEMENT then
		self.fake = fake
		self.rank = rank
		self.achieveId = id
		if achieved then
			mainEffect:StartAnimation( "idle_activ" )
		else
			mainEffect:StartAnimation( "idle_inactiv" )
		end
		local str = UI:Achievement2Str( id, self.rank )
		if achieved then
			local unlockTime = UI.Profile:GetAchieveUnlockData( self.achieveId, self.rank )
			if type( unlockTime ) == "userdata" then
				str = str.." ("..UI:DateTime2Date( _G.MasterServer_ServerTimeToLocalTimeT( unlockTime ) )..")"
			else
				sys.log( "UI.ProfileAchievementsListSlot_DependenceWnd:Update()[ERROR]: invalid type of unlock time for achievement %d rank %d; \"userdata\" expected, got \"%s\"", self.achieveId, self.rank, type( unlockTime ) )
			end
		end
		self:SetText( str, self.layers.TEXT_2 )
		self:SetText( "", self.layers.TEXT )
		self:SetLayerVisible( true, self.layers.ICO_EFFECT )
		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
		local ico = UI:GetAchievementIco( id, self.rank, true )
		if icoEffect then
			icoEffect:SetSpriteTexture( "objectName", ico )
		end
	elseif self.type == self.types.SPACE_ZONE then
		self:SetLayerVisible( false, self.layers.ICO_EFFECT )
		local zoneName = ""
		for k, v in pairs( SpaceZone ) do
			if v.zone_id == id then
				zoneName = k
				break
			end
		end
		if zoneName ~= "" then
			self:SetText( UI:GetStringByName( "level_"..SpaceZone[ zoneName ].level_name  ), self.layers.TEXT )
			if achieved then
				mainEffect:StartAnimation( "idle_activ" )
			else
				mainEffect:StartAnimation( "idle_inactiv" )
			end
		else
			sys.log( "UI.ProfileAchievementsListSlot_DependenceWnd:Update()[ERROR]: cannot find zone with id %d", id )
			self:SetText( "", self.layers.TEXT )
		end
	elseif self.type == self.types.SHIP_ROLE then
		self:SetLayerVisible( false, self.layers.ICO_EFFECT )
		local name = UI:Val2Key( ai.ShipRoles, id )
		self:SetText( UI:GetStringByName( "shipRoles_"..name ), self.layers.TEXT )
		if achieved then
			mainEffect:StartAnimation( "idle_activ" )
		else
			mainEffect:StartAnimation( "idle_inactiv" )
		end
	elseif self.type == self.types.ITEM_NAME then
		self:SetLayerVisible( false, self.layers.ICO_EFFECT )
		local text = UI:GetEntityLocalizedNameByDef( id )
		self:SetText( text, self.layers.TEXT )
		if achieved then
			mainEffect:StartAnimation( "idle_activ" )
		else
			mainEffect:StartAnimation( "idle_inactiv" )
		end
	elseif self.type == self.types.SHIP_NAME then
		self:SetLayerVisible( false, self.layers.ICO_EFFECT )
		local def = UI:GetDef( id )
		if def then
			self:SetText( UI:GetStringByName( def.ship_name.."_name" ), self.layers.TEXT )
		else
			sys.log( "UI.ProfileAchievementsListSlot_DependenceWnd:Update()[ERROR]: cannot find ship with def %s", id )
			self:SetText( "", self.layers.TEXT )
		end
		
		if achieved then
			mainEffect:StartAnimation( "idle_activ" )
		else
			mainEffect:StartAnimation( "idle_inactiv" )
		end
	elseif self.type == self.types.QUEST then
		self:SetLayerVisible( false, self.layers.ICO_EFFECT )
		self:SetText( UI:Quest2Str( id ), self.layers.TEXT )

		if achieved then
			mainEffect:StartAnimation( "idle_activ" )
		else
			mainEffect:StartAnimation( "idle_inactiv" )
		end
	else
		sys.log( "UI.ProfileAchievementsListSlot_DependenceWnd:Update()[ERROR]: unknown part's type: %d", self.type )
	end
end

--
function UI.ProfileAchievementsListSlot_DependenceWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	if self.type == self.types.ACHIEVEMENT then
		if not self.fake then
			UI:PlayGlobalSound( UI.sounds.btnClick )
			if Achievements[ self.achieveId ].subCategory and Achievements[ self.achieveId ].subCategory ~= "" then
				UI.ProfileAchievements_CategoriesListWnd:SelectSubCategory( Achievements[ self.achieveId ].subCategory, Achievements[ self.achieveId ].category, false )
			else
				UI.ProfileAchievements_CategoriesListWnd:SelectMainCategory( Achievements[ self.achieveId ].category, false, false )
			end
			UI.ProfileAchievements_List:ScrollToAchieve( self.achieveId )
		end
	end
	return true
end