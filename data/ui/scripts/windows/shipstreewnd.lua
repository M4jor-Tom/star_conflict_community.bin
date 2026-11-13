-- ------------------------------------------------------------
-- UI.ShipsTreeWnd
-- ------------------------------------------------------------

UI.ShipsTreeWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.ShipsTreeWnd.layers =
{
	MAIN_EFFECT		= 0,
	BG_EFFECT		= 1,
	CAPTION			= 2,
	WAIT_EFFECT		= 3,
	WAIT_TEXT		= 4,
}


--
UI.ShipsTreeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipsTreeWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE,
		activationOrder	= 0,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipsTreeWnd.layers.WAIT_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTreeWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.ShipsTree_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",	
						layer		= "UI.ShipsTreeWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "prestige",	
						wnd			= "UI.ShipsTree_PrestigeWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "edit_ship_win",	
						wnd			= "UI.ShipsTree_AlienEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "edit_ship_win",	
						wnd			= "UI.ShipsTree_SpecialEditWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_bg",
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
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
						layer		= "UI.ShipsTreeWnd.layers.WAIT_TEXT",
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
		"UI.ShipsTree_CrossBtn",
		"UI.ShipsTree_PrestigeWnd",
		"UI.ShipsTree_RacesWnd",
		"UI.ShipsTree_RolesWnd",
		"UI.ShipsTree_TreeWnd",
		"UI.ShipsTree_AlienTreeWnd",
		"UI.ShipsTree_SpecialTreeWnd",
		"UI.ShipsTree_AlienEditWnd",
		"UI.ShipsTree_SpecialEditWnd",
		"UI.ShipsTree_BattleSlotsPanelWnd",
		"UI.ShipsTree_QuestPanelWnd",
		"UI.ShipsTree_PanelHeaderWnd",
	}
}


-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTreeWnd:SetShipQuest( shipQuestId, launchData )

	if type( shipQuestId ) ~= "number" then
		sys.log( "UI.ShipsTreeWnd:SetShipQuest()[ERROR]: invalid type of the 1-st parameter (\"shipQuestId\"); \"number\" expected, got \"%s\"", type( shipQuestId ) )
		return
	end

	if not self:IsOnScreen() then
		sys.log( "UI.ShipsTreeWnd:SetShipQuest()[ERROR]: not on screen" )
		return		
	end

	if shipQuestId == self.shipQuestId then
		return
	end

	self.shipQuestId	= shipQuestId
	self.launchData		= launchData

	self.questShips				= {}
	self.selQuestSlotIdx		= -1

	if self.shipQuestId ~= -1 then

		if UI:IsShipQuestTaken( self.shipQuestId ) then
			self.questShips = UI:GetShipQuestShips( self.shipQuestId )

		else
			for slotIdx = 1, UI:GetShipQuestMaxShips( self.shipQuestId ) do
				table.insert( self.questShips, UI.INVALID_U64_ID )
			end
		end

		if next( self.questShips ) then
			self.selQuestSlotIdx = 1
		end

	end

	self.questShipToSetData	= nil
	self.autoShipsToAssign	= nil

	self:UpdateShipQuestRecommendedRoles()

	self:UpdatePanel()

	self:UpdateShipRacesStates()

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		UI.ShipsTree_TreeWnd:OnShipQuestStateChanged()
	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialTreeWnd:OnShipQuestStateChanged()
	end

end


--
function UI.ShipsTreeWnd:GetShipQuest()

	return self.shipQuestId

end


--
function UI.ShipsTreeWnd:GetLaunchData()

	return self.launchData

end


--
function UI.ShipsTreeWnd:SetLaunchData( launchData )

	self.launchData = launchData

end


--
function UI.ShipsTreeWnd:SetQuestShip( vid, questSlotIdx, bSwap, bSound, bSelectSlot )

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: not in quest mode" )
		return		
	end

	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: cannot change quest ships while quest is taken" )
		return
	end

	if type( vid ) ~= "userdata" then
		sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: invalid type of the 1-st parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	if type( questSlotIdx ) ~= "number" then
		sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: invalid type of the 2-nd parameter (\"questSlotIdx\"); \"number\" expected, got \"%s\"", type( questSlotIdx ) )
		return
	end

	if bSwap ~= nil then
    	if type( bSwap ) ~= "boolean" then
    		sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: invalid type of the 3-rd parameter (\"bSwap\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSwap ) )
			bSwap = nil
    	end
	end

	if bSwap == nil then
		bSwap = false
	end

	if bSound ~= nil then
    	if type( bSound ) ~= "boolean" then
    		sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: invalid type of the 4-th parameter (\"bSound\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSound ) )
			bSound = false
    	end		
	end

	if bSound == nil then
		bSound = false
	end

	if bSelectSlot ~= nil then
    	if type( bSelectSlot ) ~= "boolean" then
    		sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: invalid type of the 5-th parameter (\"bSelectSlot\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSelectSlot ) )
			bSelectSlot = false
    	end		
	end

	if bSelectSlot == nil then
		bSelectSlot = false
	end

	if vid ~= UI.INVALID_U64_ID then

		local shipItem = UI:GetShipItem( vid, false )
		if not shipItem then
			sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: cannot find ship item for ship %s", _G.U64ToStr( vid ) )
			return
		end

		if UI:IsShipInBattle( shipItem ) then
			sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: cannot assign ship to quest; ship is in battle" )
			return
		end

		if UI:IsShipInMatchmaking( shipItem ) then
			sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: cannot assign ship to quest; ship is in matchmaking queue" )
			return
		end

		if UI:IsShipOnShipQuest( shipItem )	then
			sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: cannot assign ship to quest; ship is already on quest" )
			return
		end
		
		if UI:IsShipDisabledByTime( shipItem.defName ) then
			sys.log( "UI.ShipsTreeWnd:SetQuestShip()[ERROR]: cannot assign ship %s to quest; this ship is available only at certain time of year", shipItem.defName )
			return
		end

		-- перед установкой в квестовый слот корабль вынимается из боевого слота

		local battleSlotIdx = UI:GetShipBattleSlot( shipItem )
		if battleSlotIdx ~= -1 then

			self.questShipToSetData =
			{
				vid		= vid,
				slotIdx	= questSlotIdx,		
			}

			self:ChangeShipInBattleSlot( battleSlotIdx, UI.INVALID_U64_ID, true, false )

			return

		end

	end

	self:SetQuestShipInternal( vid, questSlotIdx, bSwap )

	if bSelectSlot then
		self:SelectQuestSlot( questSlotIdx, false )
	end

	if bSound then
    	UI:PlayGlobalSound( self.sounds.changeShipInBattleSlot )
	end

end


--
function UI.ShipsTreeWnd:RemoveQuestShip( vid )

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:RemoveQuestShip()[ERROR]: not in quest mode" )
		return		
	end

	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:RemoveQuestShip()[ERROR]: cannot change quest ships while quest is taken" )
		return
	end

	if type( vid ) ~= "userdata" then
		sys.log( "UI.ShipsTreeWnd:RemoveQuestShip()[ERROR]: invalid type of the 1-st parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	local questSlotIdx = self:GetShipQuestSlot( vid )
	if questSlotIdx == -1 then
		sys.log( "UI.ShipsTreeWnd:RemoveQuestShip()[ERROR]: ship is not in quest list" )
		return
	end	

	self:SetQuestShip( UI.INVALID_U64_ID, questSlotIdx, false, false )	

end


--
function UI.ShipsTreeWnd:HasQuestShip( vid )

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:HasQuestShip()[ERROR]: not in quest mode" )
		return false
	end

	if type( vid ) ~= "userdata" then
		sys.log( "UI.ShipsTreeWnd:HasQuestShip()[ERROR]: invalid type of the 1-st parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return false
	end

	if vid == UI.INVALID_U64_ID then
		sys.log( "UI.ShipsTreeWnd:HasQuestShip()[ERROR]: invalid vid" )
		return false
	end

	return self:GetShipQuestSlot( vid ) ~= -1

end


--
function UI.ShipsTreeWnd:GetQuestShips()

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:GetQuestShips()[ERROR]: not in quest mode" )
		return {}
	end

	return self.questShips

end


--
function UI.ShipsTreeWnd:GetSelQuestSlot()

	return self.selQuestSlotIdx

end


--
function UI.ShipsTreeWnd:CenterOnShip( defName )

	if not self:IsOnScreen() then
		sys.log( "UI.ShipsTreeWnd:CenterOnShip()[ERROR]: not on screen" )
		return
	end

	if type( defName ) ~= "string" then
		sys.log( "UI.ShipsTreeWnd:CenterOnShip()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if defName == "" then
		return
	end

	local shipRace = UI:GetItemRace( defName )
	if shipRace == -1 then
		sys.log( "UI.ShipsTreeWnd:CenterOnShip()[ERROR]: cannot find race for ship %s", defName )
		return
	end

	if self:IsRaceDisabled( shipRace ) then
		sys.log( "UI.ShipsTreeWnd:CenterOnShip()[ERROR]: race %d is disabled", shipRace )
		return
	end

	self:SelectRace( shipRace )

	if self:GetSelRace() ~= shipRace then
		sys.log( "UI.ShipsTreeWnd:CenterOnShip()[ERROR]: cannot select race %s (for ship %s)", tostring( shipRace ), defName )
		return
	end

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		UI.ShipsTree_TreeWnd:CenterOnShip( defName )

	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienTreeWnd:CenterOnShip( defName )

	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialTreeWnd:CenterOnShip( defName )

	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienEditWnd:Setup( defName )

	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialEditWnd:Setup( defName )
	end

end


--
function UI.ShipsTreeWnd:OpenEvolvingEdit( defName, params )

	if not self:IsOnScreen() then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: not on screen" )
		return
	end

	if type( defName ) ~= "string" then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if defName == "" then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: empty defName" )
		return
	end

	if not UI:IsShipEvolving( defName ) then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: ship %s is not evolving", defName )
		return
	end

	local shipRace = UI:GetItemRace( defName )
	if shipRace ~= ai.Race.CRYSTAL and shipRace ~= ai.Race.SPECIAL then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: ship \"%s\" is not of race CRYSTAL or SPECIAL", defName )
		return
	end

	local baseDefName = UI:GetEvolvingShipBaseDef( defName )
	if baseDefName == "" then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: cannot find base def for %s", defName )
		return
	end

	if not UI:IsShipVisibleInShipsTree( baseDefName ) then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: ship \"%s\" is not visible in ships tree", baseDefName )
		return
	end

	local shipItem = UI:GetEvolvingShipItem( defName )
	if not shipItem then

    	local bAdvert, bByFlag = UI:IsShipAdvert( baseDefName )
    	if bAdvert and not bByFlag then
    		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: ship \"%s\" is advert and cannot be shown in nodes editor", baseDefName )
    		return
    	end

	end

	self:SelectRace( shipRace )

	if self:GetSelRace() ~= shipRace then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: cannot select race %d", shipRace )
		return
	end

	self:SetEditEvolvingMode( baseDefName )

	local editWnd = shipRace == ai.Race.CRYSTAL and UI.ShipsTree_AlienEditWnd or UI.ShipsTree_SpecialEditWnd

	if not editWnd:IsChildOf( self ) then
		sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: fail to show evolving edit mode for ship \"%s\"", baseDefName )
		return
	end

	if params ~= nil then

		if type( params ) == "table" then

			editWnd:SetChosenActiveNodesMask( params.chosenNodesMask )
			editWnd:SelectItemSlotByInfo( params.selItemInfo )

		else
			sys.log( "UI.ShipsTreeWnd:OpenEvolvingEdit()[ERROR]: invalid type of the 2-nd parameter (\"params\"); \"table\" or \"nil\" expected, got \"%s\"", type( params ) )
		end

	end

end


--
function UI.ShipsTreeWnd:GetOpenBundle()

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
		return UI.BuyBundleWnd:GetDefName(), UI.BuyBundleWnd:GetData()
	else
		return "", nil
	end

end


--
function UI.ShipsTreeWnd:OpenBundle( defName, data )

	if not self:IsOnScreen() then
		sys.log( "UI.ShipsTreeWnd:OpenBundle()[ERROR]: not on screen" )
		return
	end

	if type( defName ) ~= "string" then
		sys.log( "UI.ShipsTreeWnd:OpenBundle()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if defName == "" then
		sys.log( "UI.ShipsTreeWnd:OpenBundle()[ERROR]: empty defName" )
		return
	end

	if data ~= nil then
		if type( data ) ~= "table" then
			sys.log( "UI.ShipsTreeWnd:OpenBundle()[ERROR]: invalid type of the 2-nd parameter (\"data\"); \"table\" or \"nil\" expected, got \"%s\"", type( data ) )
			return
		end
	end

	self:LaunchBuyBundleWnd( defName, data )

end


--
function UI.ShipsTreeWnd:GetRolesSorted()

	local roles = {}

	if type( _G.ship_roles ) ~= "table" then
		sys.log( "UI.ShipsTreeWnd:GetRolesSorted()[ERROR]: invalid type of \"_G.ship_roles\"; \"table\" expected, got \"%s\"", type( _G.ship_roles ) )
		return roles		
	end

	for idx, roleName in ipairs( _G.ship_roles ) do

		local role = ai.ShipRoles[ roleName ]
		if role then
			table.insert( roles, role )
		else
			sys.log( "UI.ShipsTreeWnd:GetRolesSorted()[ERROR]: invalid role name: \"%s\"", tostring( roleName ) )
		end

	end

	table.insert( roles, self.PREMIUM_ROLE )

	return roles

end


--
function UI.ShipsTreeWnd:IsShipPremiumColumn( defName )

	if UI:IsShipPremium( defName ) then
		return true
	end

	local def = UI:GetDef( defName )
	return def and def.premium_column == true

end


--
function UI.ShipsTreeWnd:GetSelRace()

	return UI.ShipsTree_RacesWnd:GetSelRace()

end


--
function UI.ShipsTreeWnd:GetShips()

	return self.ships[ self:GetSelRace() ] or {}

end


--
function UI.ShipsTreeWnd:GetAllShips()

	return self.ships

end


--
function UI.ShipsTreeWnd:GetNumRoleCols( role )

	return role == self.PREMIUM_ROLE and self.NUM_PREMIUM_COLUMNS or 1

end


--
function UI.ShipsTreeWnd:GetRoleColCenterX( role, roleColIdx )

	local center = UI.ShipsTree_RolesWnd:GetColCenterX( role, roleColIdx )
	return self:XToScreen( center + UI.ShipsTree_RolesWnd:GetLeft() )	

end


--
function UI.ShipsTreeWnd:GetRolesScreenX()

	return self:XToScreen( UI.ShipsTree_RolesWnd:GetLeft() )

end


--
function UI.ShipsTreeWnd:GetRolesWidth()

	return UI.ShipsTree_RolesWnd:GetWidth()

end


--
function UI.ShipsTreeWnd:GetShipsAvailableHeight( bWithoutPanel )

	if bWithoutPanel == nil then
		bWithoutPanel = false
	end

	local btm = self:GetHeight()

	if not bWithoutPanel then

    	if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    		btm = UI.ShipsTree_BattleSlotsPanelWnd:GetTop()

    	elseif UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    		btm = UI.ShipsTree_QuestPanelWnd:GetTop()
		end

	end

	local shipsTop = 0

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		shipsTop = UI.ShipsTree_TreeWnd:GetTop()

	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
		shipsTop = UI.ShipsTree_AlienEditWnd:GetTop()

	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		shipsTop = UI.ShipsTree_SpecialEditWnd:GetTop()

	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
		shipsTop = UI.ShipsTree_AlienTreeWnd:GetTop()

	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		shipsTop = UI.ShipsTree_SpecialTreeWnd:GetTop()
	end

	return btm - shipsTop

end


--
function UI.ShipsTreeWnd:GetPanelTop()

	local panelTop = self:GetHeight()

	if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
		panelTop = UI.ShipsTree_BattleSlotsPanelWnd:GetTop()

	elseif UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
		panelTop = UI.ShipsTree_QuestPanelWnd:GetTop()
	end

	return panelTop

end


--
function UI.ShipsTreeWnd:GetShipQuestRecommendedRoles()

	return self.shipQuestRecommendedRoles

end


--
function UI.ShipsTreeWnd:GetQuestAutoShips()

	local availableShips		= {}
	local bestShips				= {}
	local bBestShipsDeffrent	= false

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:GetQuestAutoShips()[ERROR]: not in quest mode" )
		return availableShips, bestShips, bBestShipsDeffrent
	end
	
	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:GetQuestAutoShips()[ERROR]: ship quest %d is already taken", self.shipQuestId )
		return availableShips, bestShips, bBestShipsDeffrent
	end
	
	-- корабли, которые можно в принципе отправить на этот квест
	local fitShips = {}

	local minShipRank	= UI:GetShipQuestMinShipRank( self.shipQuestId )
	local maxShipRank	= UI:GetShipQuestMaxShipRank( self.shipQuestId )

	local function l_fnIsShipFit( shipItem )

		if not shipItem then
			return false
		end

		local shipRank = UI:GetShipRank( shipItem.defName )

		if minShipRank ~= -1 and ( shipRank == -1 or shipRank < minShipRank ) then
			return false
		end

    	if maxShipRank ~= -1 and ( shipRank == -1 or shipRank > maxShipRank ) then
    		return false
    	end

		-- #0068954,комм.(0287180) - зеленые корабли временно нельзя отправлять на задание
		-- #0084889,комм.(0376831) - спец. корабли тоже нельзя отправлять
		
		local shipRace = UI:GetShipRace( shipItem.defName )
		if shipRace == ai.Race.CRYSTAL or shipRace == ai.Race.SPECIAL then
			return false
		end
		
		-- SC-111975 некоторые корабли доступны для игры только в определенное время
		if UI:IsShipDisabledByTime( shipItem.defName ) then
			return false
		end

		return true

	end

	for race, raceShips in pairs( self.ships )  do
	
		for defName, dummy in pairs( raceShips ) do

			local shipItem = UI:GetShipItemByDef( defName, false )

			if l_fnIsShipFit( shipItem ) then			

				local shipData =
				{
					shipItem	= shipItem,
					rewardCf	= UI:GetShipQuestRewardCoef( self.shipQuestId, { shipItem.vid }, true ),
					bAvailable	= not UI:IsShipInBattle( shipItem ) and not UI:IsShipInMatchmaking( shipItem ) and not UI:IsShipOnShipQuest( shipItem ) and UI:GetShipBattleSlot( shipItem ) == -1 and not UI:IsShipDisabledByTime( shipItem.defName ),
				}

				table.insert( fitShips, shipData )

			end

		end
	end

	local function l_fnSort( shipData1, shipData2 )

		if shipData1.rewardCf ~= shipData2.rewardCf then
			return shipData1.rewardCf > shipData2.rewardCf
		end

		if shipData1.bAvailable ~= shipData2.bAvailable then
			return shipData1.bAvailable
		end

		return shipData1.shipItem.defName < shipData2.shipItem.defName

	end

	table.sort( fitShips, l_fnSort )


	local maxQuestShips = UI:GetShipQuestMaxShips( self.shipQuestId )

	-- подбор наилучших кораблей для квеста, которые в принципе можно отправить на этот квест (могут в данный момент быть в бою или на другом квесте)

	for shipIdx = 1, math.min( maxQuestShips, #fitShips ) do
		table.insert( bestShips, fitShips[ shipIdx ].shipItem.vid )
	end

	-- подбор наилучших кораблей для квеста, которые можно отправить на этот квест прямо сейчас

	local numAvailableShips = 0
	for shipIdx, shipData in ipairs( fitShips ) do

		if numAvailableShips >= maxQuestShips then
			break
		end

		if shipData.bAvailable then
			table.insert( availableShips, shipData.shipItem.vid )
			numAvailableShips = numAvailableShips + 1
		else
			bBestShipsDeffrent = true
		end

	end	

	return availableShips, bestShips, bBestShipsDeffrent

end


--
function UI.ShipsTreeWnd:HandleEscape()

	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then

		if not UI.ShipsTree_AlienEditWnd:HandleEscape() then

			if self.launchData and self.launchData.bReturnFromEvolvingEdit then
				self:Close()
			else
				self:SetTreeEvolvingMode()
			end

		end

	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then

		if not UI.ShipsTree_SpecialEditWnd:HandleEscape() then

			if self.launchData and self.launchData.bReturnFromEvolvingEdit then
				self:Close()
			else
				self:SetTreeEvolvingMode()
			end

		end

	else
		self:Close()
	end
	
	return true	

end


--
function UI.ShipsTreeWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	UI.ShipsTree_PrestigeWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.AlienShipCraftWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if result == 0 then

		if self:IsOnScreen() then

        	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_TreeWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienEditWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialEditWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_AlienTreeWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialTreeWnd:OnOwnedVessels()
        	end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnOwnedVessels()
    			end

			else

				self:ValidateQuestShips()

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnOwnedVessels()
				end

			end

		end

	end
	
	if self.bWaitOwnVessels then

		self.bWaitOwnVessels = false
		self:UpdateWaitingEffect()

    	if self.newShipToInstall ~= "" then

    		if result == 0 then
    	
    			local shipItem = UI:GetShipItemByDef( self.newShipToInstall, false )
    			if shipItem then
    				self:ChangeShipInBattleSlot( self.battleSlotToInstallNewShip, shipItem.vid, false )
    			else
    				sys.log( "UI.ShipsTreeWnd:GameStore_OnOwnedVessels()[ERROR]: cannot find ship item for \"%s\" that was supposedly just bought", self.newShipToInstall )
    			end

			end

    		self.newShipToInstall			= ""
    		self.battleSlotToInstallNewShip	= -1

    	end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_PrestigeWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

        	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_TreeWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienEditWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialEditWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienTreeWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialTreeWnd:OnOwnedVessels()
        	end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnOwnedVessels()
    			end

			else

				self:ValidateQuestShips()

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnOwnedVessels()
				end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	UI.ShipsTree_PrestigeWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	if result == 0 then

    	if self:IsOnScreen() then

			local vid = u64( param1, param2 )

			if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
				UI.ShipsTree_TreeWnd:OnSellVessel( vid )
			end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnSellVessel( vid )
    			end

			else

				self:ValidateQuestShip( vid )

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnSellVessel( vid )
				end

			end

    	end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	UI.ShipsTree_PrestigeWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

			local vid = u64( param1, param2 )

			if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
				UI.ShipsTree_TreeWnd:OnVesselLevelUp( vid )
				
			elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialTreeWnd:OnVesselLevelUp( vid )

			elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
				UI.ShipsTree_AlienEditWnd:OnVesselLevelUp( vid )
		
			elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialEditWnd:OnVesselLevelUp( vid )
			end

			if self.shipQuestId == -1 then

				if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_BattleSlotsPanelWnd:OnVesselLevelUp( vid )
				end

			else

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnVesselLevelUp( vid )
				end

			end

		end

	end

end


-- 
function UI.ShipsTreeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.AlienShipCraftWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ShipsTree_AlienEditWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )	-- хак; апдейт идет в UI.ShipsTree_AlienEditWnd:OnPlayerCreditsChanged(), а это нужно просто чтобы передать ивент в UI.ShipsTree_EvolvingEdit_ItemsWnd
	UI.ShipsTree_SpecialEditWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )	-- хак; апдейт идет в UI.ShipsTree_SpecialEditWnd:OnPlayerCreditsChanged(), а это нужно просто чтобы передать ивент в UI.ShipsTree_EvolvingEdit_ItemsWnd

	if result == 0 then

    	if self:IsOnScreen() then

			if not UI.serverData.playerCredits.raceRepChanged then

            	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
					UI.ShipsTree_TreeWnd:OnPlayerCreditsChanged()
            	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
					UI.ShipsTree_SpecialTreeWnd:OnPlayerCreditsChanged()
        		elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        			UI.ShipsTree_AlienEditWnd:OnPlayerCreditsChanged()
        		elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        			UI.ShipsTree_SpecialEditWnd:OnPlayerCreditsChanged()
				end

				if self.shipQuestId == -1 then

        			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
        				UI.ShipsTree_BattleSlotsPanelWnd:OnPlayerCreditsChanged()
        			end

				else

    				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    					UI.ShipsTree_QuestPanelWnd:OnPlayerCreditsChanged()
    				end

				end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	UI.ShipsTree_AlienEditWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.ShipsTree_SpecialEditWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if result == 0 then

		if self:IsOnScreen() then
		
			if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
				UI.ShipsTree_TreeWnd:OnPlayerAccountRankChanged()
			elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_AlienTreeWnd:OnPlayerAccountRankChanged()
			elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialTreeWnd:OnPlayerAccountRankChanged()
			end
			
			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
				UI.ShipsTree_BattleSlotsPanelWnd:OnAccountRankChanged()
			end
			
			self:UpdateShipRacesStates()
		
		end

	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.AlienShipCraftWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ShipsTree_AlienEditWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result == 0 then

    	if self:IsOnScreen() then
			if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
				UI.ShipsTree_TreeWnd:OnAccountAurasChanged()
			elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialTreeWnd:OnAccountAurasChanged()
			end
    	end

	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.AlienShipCraftWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_AlienEditWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result == 0 then

    	if self:IsOnScreen() then
			if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
				UI.ShipsTree_TreeWnd:OnAccountAurasChanged()
			elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialTreeWnd:OnAccountAurasChanged()
			end
    	end

	end

end



--
function UI.ShipsTreeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.AlienShipCraftWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_AlienEditWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result == 0 then

    	if self:IsOnScreen() then
			if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
				UI.ShipsTree_TreeWnd:OnAccountAurasChanged()
			elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialTreeWnd:OnAccountAurasChanged()
			end
    	end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

	if result == 0 then

    	if self:IsOnScreen() then

        	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_TreeWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienEditWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialEditWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienTreeWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialTreeWnd:OnBattleSlotsChanged()
        	end

        	if UI.ShipsTree_PanelHeaderWnd:IsChildOf( self ) then
				UI.ShipsTree_PanelHeaderWnd:OnBattleSlotsChanged()
			end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnBattleSlots()
    			end

			else

				self:ValidateQuestShips()

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnBattleSlots()
				end

			end

    	end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	UI.AlienShipCraftWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	if result == _G.GameStore.ChangeBSResult.CBSR_OK then

		if self:IsOnScreen() then

        	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_TreeWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienEditWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialEditWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienTreeWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialTreeWnd:OnBattleSlotsChanged()
        	end

        	if UI.ShipsTree_PanelHeaderWnd:IsChildOf( self ) then
				UI.ShipsTree_PanelHeaderWnd:OnBattleSlotsChanged()
			end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnChangeBattleSlotVessel()
    			end

			else

				self:ValidateQuestShips()

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnBattleSlots()
				end

			end

			if requestId == self.changeBattleSlotVesselRequiestId then

    			if self.questShipToSetData then
    				self:SetQuestShipInternal( self.questShipToSetData.vid, self.questShipToSetData.slotIdx, false )	
    			end

				if self.bToHideAfterDblClick then
					self:Close()
				end

			end

		end

	else
		
		if requestId == self.changeBattleSlotVesselRequiestId then
    		UI:ShowMsgOnChangeBatleSlotVesselError( result )
		end

	end

	if requestId == self.changeBattleSlotVesselRequiestId then

		self.changeBattleSlotVesselRequiestId = 0
		self:UpdateWaitingEffect()

		self.questShipToSetData		= nil
		self.bToHideAfterDblClick	= false

	end


	if self.changeBattleSlotVesselBeforeAutoRequests[ requestId ] then

		self.changeBattleSlotVesselBeforeAutoRequests[ requestId ] = nil

		if result == _G.GameStore.ChangeBSResult.CBSR_OK then

    		if not next( self.changeBattleSlotVesselBeforeAutoRequests ) then

				if self.autoShipsToAssign and self:IsOnScreen() then
    				self:AssignQuestAutoShips2( self.autoShipsToAssign )
				end

				self.autoShipsToAssign = nil

    		end

		else

    		UI:ShowMsgOnChangeBatleSlotVesselError( result )

			self.changeBattleSlotVesselBeforeAutoRequests = {}
			self.autoShipsToAssign = nil

		end

		self:UpdateWaitingEffect()

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

	if result == _G.GameStore.ChangeBSResult.CBSR_OK then

    	if self:IsOnScreen() then

        	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_TreeWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienEditWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialEditWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienTreeWnd:OnBattleSlotsChanged()
        	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialTreeWnd:OnBattleSlotsChanged()
        	end

        	if UI.ShipsTree_PanelHeaderWnd:IsChildOf( self ) then
				UI.ShipsTree_PanelHeaderWnd:OnBattleSlotsChanged()
			end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnSwapBattleSlotVessels()
    			end

			else

				self:ValidateQuestShips()

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnBattleSlots()
				end

			end

    	end

	else

		if requestId == self.swapBattleSlotVesselsRequstId then
			UI:ShowMsgOnChangeBatleSlotVesselError( result )
		end

	end

	if requestId == self.swapBattleSlotVesselsRequstId then
		self.swapBattleSlotVesselsRequstId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.ShipsTreeWnd:OnHangarPrepareStateChanged()

	if self:IsOnScreen() then

    	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
    		UI.ShipsTree_TreeWnd:OnHangarPrepareStateChanged()
    	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
    		UI.ShipsTree_AlienTreeWnd:OnHangarPrepareStateChanged()
    	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
    		UI.ShipsTree_SpecialTreeWnd:OnHangarPrepareStateChanged()
    	end

		if self.shipQuestId == -1 then

    		if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    			UI.ShipsTree_BattleSlotsPanelWnd:OnHangarPrepareStateChanged()
    		end

		else

    		if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    			UI.ShipsTree_QuestPanelWnd:OnHangarPrepareStateChanged()
    		end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnSpoiled( result, requestId )

	UI.ShipsTree_AlienEditWnd:GameStore_OnSpoiled( result, requestId )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnSpoiled( result, requestId )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()

end


--
function UI.ShipsTreeWnd:GameStore_OnLoadingComplete( storeSize )

	UI.ShipsTree_AlienEditWnd:GameStore_OnLoadingComplete( storeSize )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()

	self:SaveSelRace()
	self:SaveScrollPos()
	Profile:Save()

	if self.shipQuestId ~= -1 then

		self.shipQuestToSetData = {}

		self.shipQuestToSetData.questId		= self.shipQuestId
		self.shipQuestToSetData.vids		= self.questShips
		self.shipQuestToSetData.selSlotIdx	= self.selQuestSlotIdx
		
	end

	self:FullUpdate()

end


-- коллбэк, вызывается из окна покупки/продажи
function UI.ShipsTreeWnd:OnTradeResult_Buy( shopItem, count, priceType, bBuyForShipParts )

	if UI:IsDefShip( shopItem.defName ) then
		self:DoBuyShip( shopItem, bBuyForShipParts )

	elseif UI:IsDefBundle( shopItem.defName ) then
		self:DoBuyBundle( shopItem )
	end

end


--
function UI.ShipsTreeWnd:OnBuyWithInventoryWndResult( result, data )

	if result == true then
		self:BuyInventory( data.inventoryLevels )
	else
		self.itemToBuy			= nil
		self.bToBuyForShipParts	= false
	end

end


--
function UI.ShipsTreeWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	UI.AlienShipCraftWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.SpecialShipCraftWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ShipsTree_AlienEditWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId ~= 0 and requestId == self.buyRequestId then

		if result ~= _G.GameStore.StoreBuyResult.SBR_OK then

			UI:ShowMsgOnBuyError( result )

			self.bWaitOwnVessels			= false
			self.newShipToInstall			= ""
			self.battleSlotToInstallNewShip	= -1

		end

		self.buyRequestId = 0
		self:UpdateWaitingEffect()

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	UI.AlienShipCraftWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.ShipsTree_AlienEditWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if self.buyInventoryRequestId == requestId then

		self.buyInventoryRequestId = 0

    	if result == _G.GameStore.StoreBuyResult.SBR_OK then

			if self:IsOnScreen() then

        		if self.itemToBuy then

                	if UI:IsDefShip( self.itemToBuy.defName ) then
                		self:DoBuyShip( self.itemToBuy, self.bToBuyForShipParts )

                	elseif UI:IsDefBundle( self.itemToBuy.defName ) then
                		self:DoBuyBundle( self.itemToBuy )
                	end

        		end		

			end

    	else
    		UI:ShowMsgOnBuyError( result )
    	end

		self:UpdateWaitingEffect()

        self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

	end

end  


--
function UI.ShipsTreeWnd:F_OnEventStartWaitingRequests()

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:F_OnEventStopWaitingRequests()

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:OnHangarWaitingShipUpgradeChanged()

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.AlienShipCraftWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.SpecialShipCraftWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.AlienShipNodeLearnWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.SpecialShipNodeLearnWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ShipsTree_AlienEditWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ShipsTree_SpecialEditWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.buyRequestId						= 0
	self.bWaitOwnVessels					= false
	self.newShipToInstall					= ""
	self.battleSlotToInstallNewShip			= -1
    self.itemToBuy							= nil
	self.bToBuyForShipParts					= false
	self.changeBattleSlotVesselRequiestId	= 0
	self.questShipToSetData					= nil
	self.buyInventoryRequestId				= 0
	self.repairRequestId					= 0
	self.refillRequestId					= 0
	self.swapBattleSlotVesselsRequstId		= 0
	self.startShipQuestRequestId			= 0
	self.startShipQuestData					= nil
	self.repairQuestShipsRequestIds			= {}
	self.autoShipsToAssign					= nil
	self.changeBattleSlotVesselBeforeAutoRequests	= {}
	self.bToHideAfterDblClick				= false
	self.activateAlienNodesRequestId		= 0

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:OnHangarSelShipChanged()

	if self:IsOnScreen() then

		if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
			UI.ShipsTree_BattleSlotsPanelWnd:OnSelBattleSlotChanged()
		end

	end

end


--
function UI.ShipsTreeWnd:GetRaceButtons()

	local raceBtns = {}

	for recordIdx = 1, UI.ShipsTree_RacesWnd:GetNumRecords() do

		local btn = UI.ShipsTree_RacesWnd:GetButtonForRecord( recordIdx )
		if btn then
			table.insert( raceBtns, btn )
		end

	end

	return raceBtns

end


--
function UI.ShipsTreeWnd:GetAvailableShipToBuy()

	local buyBtn = self:GetAvailableShipBuyBtn()
	if buyBtn then
		return buyBtn:GetDefName()
	end

	return ""

end


--
function UI.ShipsTreeWnd:GetAvailableShipBuyBtn()

	local buyBtn = nil

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then

    	for rank = 1, UI:GetMaxRank() do

    		local rankSlotWnd = UI.ShipsTree_Tree_ListWnd:GetSlotForRank( rank )
    		if rankSlotWnd then

    			local minX		= math.huge
    			local minBuyBtn	= nil

    			local shipSlots = rankSlotWnd:GetSlots()
    			for shipIdx, shipSlotWnd in pairs( shipSlots ) do

    				local defName = shipSlotWnd:GetDefName()

    				if not UI:IsShipGold( defName ) and not UI:IsShipCraftable( defName ) and not shipSlotWnd:IsLocked() then

    					local shipBuyBtn = shipSlotWnd:GetPriceBtn()
    					if	shipBuyBtn
    						and shipBuyBtn:IsChildOf( shipSlotWnd )
    						and not shipBuyBtn:IsGray()
    						and shipBuyBtn:IsEnabled()
    						and shipBuyBtn:GetMode() == UI.ShipsTree_PriceBtn.modes.PRICE then

        						local shipSlotX = shipSlotWnd:GetLeft()
        						if shipSlotX < minX then

        							minX		= shipSlotX
        							minBuyBtn	= shipBuyBtn

        						end

    					end					

    				end

    			end

    			if minBuyBtn then
    				buyBtn = minBuyBtn
    				break
    			end

    		end

    	end

	end

	return buyBtn

end


--
function UI.ShipsTreeWnd:IsRaceDisabled( race )

	local bDisabled, requiredRank = self:GetRaceDisabledState( race )
	return bDisabled

end


--
function UI.ShipsTreeWnd:GetRaceDisabledState( race )

	local bDisabled		= false
	local requiredRank	= -1

	if type( race ) ~= "number" then
		sys.log( "UI.ShipsTreeWnd:GetRaceDisabledState()[ERROR]: invalid type of the 1-st parameter (\"race\"); \"number\" expected, got \"%s\"", type( race ) )
		return bDisabled, requiredRank
	end
	
	-- #0068954,комм.(0287180)	- зеленые корабли временно нельзя отправлять на задание
	-- #0084889,комм.(0376831)	- спец. корабли тоже нельзя отправлять
	if self.shipQuestId ~= -1 then
		if race == ai.Race.CRYSTAL or race == ai.Race.SPECIAL then
			bDisabled = true
		end
	end

	-- (бфло - #0097264 - зеленые и специальные показываются только после 7-го ранга, или если у игрока уже есть корабль такой расы)
	-- #0106449 - все расы, кроме империи, залочены по рангу
	if not bDisabled then
	
		local requiredRankByRace = UI.rankLocks.shipsByRace[ UI:Val2Key( ai.Race, race ) ] or -1
	
		if requiredRankByRace ~= -1 and UI:GetPlayerAccountRank() < requiredRankByRace then
		
			local bHasBoughtShips = false	-- купленные сейчас или когда-то покупавшиеся
		
			local raceShips = self.ships[ race ] or {}
			for defName, data in pairs( raceShips ) do
			
				local shipItem = nil
				if UI:IsShipEvolving( defName ) then
					shipItem = UI:GetEvolvingShipItem( defName )
				else
					shipItem = UI:GetShipItemByDef( defName, true )
				end
			
				if shipItem then
					bHasBoughtShips = true
					break
				end
				
			end
			
			if not bHasBoughtShips then
				bDisabled		= true
				requiredRank	= requiredRankByRace
			end
		
		end
	
	end

	return bDisabled, requiredRank

end


--
function UI.ShipsTreeWnd:GameStore_OnRepairBattleVessels( result, requestId, param1, param2 )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnRepairBattleVessels()
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnRepairBattleVessels()
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnRepairVessel( result, requestId, param1, param2 )

	-- сообщение об ошибке не показывается, т.к. оно покажется ангаром

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

    		local vid = u64( param1, param2 )

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnRepairVessel( vid )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnRepairVessel( vid )
    			end

			end

		end

	end

	if requestId == self.repairRequestId then
		self.repairRequestId = 0
		self:UpdateWaitingEffect()
	end


	if self.repairQuestShipsRequestIds[ requestId ] then

		self.repairQuestShipsRequestIds[ requestId ] = nil

		if result == _G.GameStore.StoreBuyResult.SBR_OK then

			if not next( self.repairQuestShipsRequestIds ) and self.startShipQuestData then
				self:DoStartShipQuest( self.startShipQuestData.questId, self.startShipQuestData.vids )
				self.startShipQuestData = nil
			end

		else

			self.repairQuestShipsRequestIds = {}
			self.startShipQuestData = nil

		end

		self:UpdateWaitingEffect()

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnRefillBattleVessels( result, requestId, param1, param2 )

	if result == _G.GameStore.MunitionResult.MR_OK then

		if self:IsOnScreen() then

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnRefillBattleVessels()
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnRefillBattleVessels()
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnRefillMunition( result, requestId, param1, param2 )

	if result == _G.GameStore.MunitionResult.MR_OK then

		if self:IsOnScreen() then

    		local vid = u64( param1, param2 )

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnRefillMunition( vid )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnRefillMunition( vid )
    			end

			end

		end

	else

		if requestId == self.refillRequestId then
    		UI:ShowMsgOnRefillError( result )
		end

	end

	if requestId == self.refillRequestId then
		self.refillRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.ShipsTreeWnd:GameStore_OnVesselEquipment( result, requestId, param1, param2 )

	if result == 0 then

		if self:IsOnScreen() then

    		local vid = u64( param1, param2 )

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnVesselEquipment( vid )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnVesselEquipment( vid )
    			end

			end

		end

	end

end


-- ВНИМАНИЕ! индексы в vids с 0
function UI.ShipsTreeWnd:GameStore_OnVesselsEquipment( vids )

	if self:IsOnScreen() then

		for idx, vid in pairs( vids ) do

    		if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnVesselEquipment( vid )
    			end

    		else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnVesselEquipment( vid )
    			end

    		end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	UI.ShipsTree_AlienEditWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	if result == _G.GameStore.ModuleEquipResult.MER_OK then

		if self:IsOnScreen() then

    		local vid = u64( param1, param2 )

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnChangeEquipment( vid )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnChangeEquipment( vid )
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_AlienEditWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

	if result == _G.GameStore.ModuleEquipResult.MER_OK then

		if self:IsOnScreen() then

    		local vid1 = u64( param1, param2 )
			local vid2 = u64Param

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnTransferEquipment( vid1, vid2 )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnTransferEquipment( vid1, vid2 )
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnStripEquipment( result, requestId, param1, param2 )

	if result == _G.GameStore.ModuleEquipResult.MER_OK then

		if self:IsOnScreen() then

	    	local vid = u64( param1, param2 )

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnStripEquipment( vid )
    			end		

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnStripEquipment( vid )
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	UI.ShipsTree_AlienEditWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	if result == _G.GameStore.MunitionResult.MR_OK then

		if self:IsOnScreen() then

    		local vid = u64( param1, param2 )

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnChangeMunition( vid )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnChangeMunition( vid )
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_AlienEditWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

	if result == _G.GameStore.MunitionResult.MR_OK then

		if self:IsOnScreen() then

    		local vid1 = u64( param1, param2 )
			local vid2 = u64Param

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnTransferMunition( vid1, vid2 )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnTransferMunition( vid1, vid2 )
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnChangeEquipmentMulti( result, requestId, param1, param2, u64Param )

	if result == _G.GameStore.ModuleEquipResult.MER_OK then

		if self:IsOnScreen() then

    		local vid = u64( param1, param2 )

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnChangeMunition( vid )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnChangeMunition( vid )
    			end

			end

		end

	end
	
end


--
function UI.ShipsTreeWnd:GameStore_OnExtractVesselExp( result, requestId, vids )

	UI.AlienShipNodeLearnWnd:GameStore_OnExtractVesselExp( result, requestId, vids )
	UI.SpecialShipNodeLearnWnd:GameStore_OnExtractVesselExp( result, requestId, vids )

	if result == 0 then

		if self:IsOnScreen() then

        	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienEditWnd:OnExtractVesselExp( vids )
        	end

        	if UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialEditWnd:OnExtractVesselExp( vids )
        	end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnExtractVesselExp( vids )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnExtractVesselExp( vids )
    			end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

	if result == 0 then

		if self:IsOnScreen() then

			if self.shipQuestId ~= -1 then

            	self:ValidateShipQuest()

				if self.shipQuestId ~= -1 then

					if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
						UI.ShipsTree_TreeWnd:OnShipQuestStateChanged()
                	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
                		UI.ShipsTree_SpecialTreeWnd:OnShipQuestStateChanged()
					end

    				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
						UI.ShipsTree_QuestPanelWnd:OnShipQuestStateChanged()
					end

				end	

			end

		end

	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.ShipQuestOpResult.SQOR_OK then

		if self:IsOnScreen() then

			if self.shipQuestId ~= -1 then

    			if requestId == self.startShipQuestRequestId then
					self:Close()
    			end

				if self:IsOnScreen() and param1 == self.shipQuestId then

					if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
						UI.ShipsTree_TreeWnd:OnShipQuestStateChanged()
                	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
                		UI.ShipsTree_SpecialTreeWnd:OnShipQuestStateChanged()
					end

    				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
						UI.ShipsTree_QuestPanelWnd:OnShipQuestStateChanged()
					end

				end

			end

		end

	else

		if requestId == self.startShipQuestRequestId then
			self:ShowMsgOnStartShipQuestError( result )
		end

	end

	if requestId == self.startShipQuestRequestId then
		self.startShipQuestRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

	if result == _G.MasterServer.ShipQuestOpResult.SQOR_OK then

		if self:IsOnScreen() then

			if self.shipQuestId ~= -1 then

    			self:ValidateShipQuest()

				if self.shipQuestId ~= -1 and param1 == self.shipQuestId then

					if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
						UI.ShipsTree_TreeWnd:OnShipQuestStateChanged()
                	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
                		UI.ShipsTree_SpecialTreeWnd:OnShipQuestStateChanged()
					end

    				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
						UI.ShipsTree_QuestPanelWnd:OnShipQuestStateChanged()
					end

				end

			end

		end

	end

end


--
function UI.ShipsTreeWnd:OnBuyWndResult( result, mode, data )	

	if mode == UI.BuyWnd.modes.SHIPS_REPAIR then

		if result then

    		self.repairQuestShipsRequestIds = {}

    		for idx, vid in pairs( data.vids ) do

    			local requestId = _G.GameStore_RepairVessel( vid )

    			if requestId ~= 0 then

    				self.repairQuestShipsRequestIds[ requestId ] = true

    			else

    				UI:ShowMsgOnRepairError( _G.GameStore.StoreBuyResult.SBR_ERROR )

    				self.repairQuestShipsRequestIds = {}
    				self.startShipQuestData = nil

    				break

    			end

    		end

    		self:UpdateWaitingEffect()

		else
			self.startShipQuestData = nil
		end

	elseif mode == UI.BuyWnd.modes.INVENTORY_AUTO then

    	if result then
    		self:BuyInventory( data.inventoryLevels )
    	end

	else
		sys.log( "UI.ShipsTreeWnd:OnBuyWndResult()[ERROR]: unhandled mode %d", mode )
	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.AlienShipCraftWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipsTreeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	UI.ShipsTree_TradeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.ShipsTree_BuyWithInventoryWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.AlienShipNodeLearnWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	UI.ShipsTree_TradeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.AlienShipCraftWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.SpecialShipCraftWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	
	UI.ShipsTree_TradeWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.AlienShipNodeLearnWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	
	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.ShipsTreeWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_TradeWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.AlienShipNodeLearnWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	
	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end



--
function UI.ShipsTreeWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_TradeWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.ShipsTree_BuyWithInventoryWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.AlienShipNodeLearnWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	
	if result ~= _G.MasterServer.AdvertResult.AR_OK then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	self:OnResourcesChanged()
	
end


--
function UI.ShipsTreeWnd:OnShipSlotLayoutChanged( slotWnd )

	if slotWnd:IsChildOf( UI.ShipsTree_TreeWnd ) then

    	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
    		UI.ShipsTree_TreeWnd:OnShipSlotLayoutChanged( slotWnd )
    	else
    		sys.log( "UI.ShipsTreeWnd:OnShipSlotLayoutChanged()[ERROR]: invalid call" )
    	end

	elseif slotWnd:IsChildOf( UI.ShipsTree_SpecialTreeWnd ) then

    	if UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
    		UI.ShipsTree_SpecialTreeWnd:OnShipSlotLayoutChanged( slotWnd )
    	else
    		sys.log( "UI.ShipsTreeWnd:OnShipSlotLayoutChanged()[ERROR]: invalid call" )
    	end

	end

end


--
function UI.ShipsTreeWnd:OnBuyBundleWndResult( result, defName, data )
end


--
function UI.ShipsTreeWnd:MasterServer_OnNotification( notification, params )

	UI.AlienShipNodeLearnWnd:MasterServer_OnNotification( notification, params )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnNotification( notification, params )

end


--
function UI.ShipsTreeWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	UI.AlienShipCraftWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.ShipsTree_AlienEditWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI.ShipsTreeWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	UI.ShipsTree_AlienEditWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

end


--
function UI.ShipsTreeWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	UI.AlienShipNodeLearnWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	UI.AlienShipNodeLearnWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	UI.AlienShipNodeLearnWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	UI.SpecialShipNodeLearnWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.QuestResult.QR_OK then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.ShipsTreeWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

	if not self:IsOnScreen() then
		return
	end

	self:OnQuestsChanged()

end


--
function UI.ShipsTreeWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ShipsTreeWnd:UpdateZOrder()

	if UI.ShipsTree_TreeWnd and UI.ShipsTree_TreeWnd.w and UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( UI.ShipsTree_TreeWnd )
	end

	if UI.ShipsTree_AlienEditWnd and UI.ShipsTree_AlienEditWnd.w and UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( UI.ShipsTree_AlienEditWnd )
	end

	if UI.ShipsTree_SpecialEditWnd and UI.ShipsTree_SpecialEditWnd.w and UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( UI.ShipsTree_SpecialEditWnd )
	end

	if UI.ShipsTree_AlienTreeWnd and UI.ShipsTree_AlienTreeWnd.w and UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( UI.ShipsTree_AlienTreeWnd )
	end

	if UI.ShipsTree_SpecialTreeWnd and UI.ShipsTree_SpecialTreeWnd.w and UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( UI.ShipsTree_SpecialTreeWnd )
	end

	if UI.ShipsTree_RolesWnd and UI.ShipsTree_RolesWnd.w and UI.ShipsTree_RolesWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( UI.ShipsTree_RolesWnd )
	end

end


--
function UI.ShipsTreeWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )

	UI.AlienShipCraftWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )
	
end


--
function UI.ShipsTreeWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )

	UI.AlienShipNodeLearnWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )
	UI.SpecialShipNodeLearnWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

    	if self:IsOnScreen() then

			local vid = u64Param

			if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
				UI.ShipsTree_AlienEditWnd:OnVesselUnlockNode( vid )
			end

			if UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
				UI.ShipsTree_SpecialEditWnd:OnVesselUnlockNode( vid )
			end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnVesselUnlockNode( vid )
    			end

			else

    			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_QuestPanelWnd:OnVesselUnlockNode( vid )
    			end

			end

    	end

	end

end


--
function UI.ShipsTreeWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_PrestigeWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.AlienShipNodeLearnWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.SpecialShipNodeLearnWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		if self:IsOnScreen() then

        	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_TreeWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienEditWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialEditWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_AlienTreeWnd:OnOwnedVessels()
        	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
        		UI.ShipsTree_SpecialTreeWnd:OnOwnedVessels()
        	end

			if self.shipQuestId == -1 then

    			if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
    				UI.ShipsTree_BattleSlotsPanelWnd:OnOwnedVessels()
    			end

			else

				self:ValidateQuestShips()

				if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
					UI.ShipsTree_QuestPanelWnd:OnOwnedVessels()
				end

			end

		end

	else

		if requestId == self.activateAlienNodesRequestId then
			self:ShowMsgOnAlienNodesActivateError( result )
		end

	end

	if requestId == self.activateAlienNodesRequestId then
		self.activateAlienNodesRequestId = 0
		self:UpdateWaitingEffect()
	end

end


--
function UI.ShipsTreeWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

	UI.AlienShipCraftWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )
	UI.SpecialShipCraftWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

end


--
function UI.ShipsTreeWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

	UI.ShipsTree_AlienEditWnd:GameStore_OnSellItem( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

end


--
function UI.ShipsTreeWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	UI.ShipsTree_AlienEditWnd:GameStore_OnSellItems( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

end


--
function UI.ShipsTreeWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

	UI.ShipsTree_AlienEditWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

end


--
function UI.ShipsTreeWnd:GameStore_OnUpgradeItems( result, requestId, iids )

	UI.ShipsTree_AlienEditWnd:GameStore_OnUpgradeItems( result, requestId, iids )
	UI.ShipsTree_SpecialEditWnd:GameStore_OnUpgradeItems( result, requestId, iids )

end


--
function UI.ShipsTreeWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

	UI.ShipsTree_AlienEditWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )
	UI.ShipsTree_SpecialEditWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

end


--
function UI.ShipsTreeWnd:MasterServer_OnVesselBudgetChanged( vid )

	UI.ShipsTree_AlienEditWnd:MasterServer_OnVesselBudgetChanged( vid )
	UI.ShipsTree_SpecialEditWnd:MasterServer_OnVesselBudgetChanged( vid )

end


--
function UI.ShipsTreeWnd:GetPanelHeaderHeight()

	return UI.ShipsTree_PanelHeaderWnd:GetHeight()

end


--
function UI.ShipsTreeWnd:ShowNoticeOnNode( nodeName )

	if type( nodeName ) ~= "string" then
		sys.log( "UI.ShipsTreeWnd:ShowNoticeOnNode()[ERROR]: invalid type of the 1-st parameter (\"nodeName\"); \"string\" expected, got \"%s\"", type( nodeName ) )
		return
	end

	if not self:IsOnScreen() then
		sys.log( "UI.ShipsTreeWnd:ShowNoticeOnNode()[ERROR]: not on screen" )
		return
	end
	
	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienEditWnd:ShowNoticeOnNode( nodeName )
		
	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialEditWnd:ShowNoticeOnNode( nodeName )
		
	else
		sys.log( "UI.ShipsTreeWnd:ShowNoticeOnNode()[ERROR]: not in node edit mode" )
	end

end


--
function UI.ShipsTreeWnd:IsWaitingForStartShispQuest()

	return self.startShipQuestRequestId ~= 0
	
end


--
function UI.ShipsTreeWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnQuestsChanged()
	
end


--
function UI.ShipsTreeWnd:OnShipDisabledByTimeChanged( defName )
	
	if not self:IsOnScreen() then
		return
	end
	
	local shipRace = UI:GetItemRace( defName )
	if shipRace == -1 then
		sys.log( "UI.ShipsTreeWnd:OnShipDisabledByTimeChanged()[ERROR]: cannot find race for ship %s", defName )
		return
	end

	if self:GetSelRace() ~= shipRace then
		return
	end
	
	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		UI.ShipsTree_TreeWnd:OnShipDisabledByTimeChanged( defName )

	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienTreeWnd:OnShipDisabledByTimeChanged( defName )

	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialTreeWnd:OnShipDisabledByTimeChanged( defName )
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTreeWnd.sounds =
{
	shipSlotMouseOver		= "sound/ui/btnMouseOver",
	raceSlotMouseOver		= UI.sounds.btnMouseOver,
	selectRace 				= "sound/ui/btnClick",
	tradeWndShow			= "sound/ui/btnClick",
	tradeWndHide			= "sound/ui/MsgHide",
	changeShipInBattleSlot	= "sound/ui/btnClick",
	durabilityIcoClick		= UI.sounds.btnClick,
	battleSlotMouseOver		= "sound/ui/btnMouseOver",
	panelHeaderMouseover	= UI.sounds.btnMouseOver,
	questSlotSelect			= UI.sounds.btnClick,
	questAutoShips			= UI.sounds.btnClick,
	buyBundle				= UI.sounds.btnClick,
	alienShipNodeMouseOver	= UI.sounds.btnMouseOver,
	alienShipCabinMouseOver	= UI.sounds.btnMouseOver,
	startQuest				= UI.sounds.btnClick,
}

UI.ShipsTreeWnd.PREMIUM_ROLE		= -2	-- фейковая "роль", для единообразия обработки премиум кораблей, для которых истинная роль не используется для определения позиции в дереве
UI.ShipsTreeWnd.NUM_PREMIUM_COLUMNS	= 3

UI.ShipsTreeWnd.effectInfo =
{
	main =
	{
		rolesLocator		= "role",
		shipsLocator		= "list",
		alienShipsLocator	= "list_2",
		battleSlotsLocator	= "quest",
		racesLocator		= "race_sel",
	},

	bg =
	{
		animRegular	= "idle",
		animAlien	= "idle_2",		
	}
}

UI.ShipsTreeWnd.BATTLE_SLOTS_PANEL_DEFAULT_OPEN	= true
UI.ShipsTreeWnd.QUEST_PANEL_DEFAULT_OPEN		= true

UI.ShipsTreeWnd.EVOLVING_NODE_MAX_ID = 63

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTreeWnd.ships								= {}	-- всех рас
UI.ShipsTreeWnd.itemToBuy							= nil
UI.ShipsTreeWnd.bToBuyForShipParts					= false
UI.ShipsTreeWnd.buyRequestId						= 0
UI.ShipsTreeWnd.bWaitOwnVessels						= false
UI.ShipsTreeWnd.newShipToInstall 					= ""
UI.ShipsTreeWnd.battleSlotToInstallNewShip			= -1
UI.ShipsTreeWnd.changeBattleSlotVesselRequiestId	= 0
UI.ShipsTreeWnd.buyInventoryRequestId				= 0
UI.ShipsTreeWnd.repairRequestId						= 0
UI.ShipsTreeWnd.refillRequestId						= 0
UI.ShipsTreeWnd.swapBattleSlotVesselsRequstId		= 0
UI.ShipsTreeWnd.shipQuestId							= -1
UI.ShipsTreeWnd.launchData							= nil
UI.ShipsTreeWnd.shipQuestToSetData					= nil
UI.ShipsTreeWnd.questShipToSetData					= nil
UI.ShipsTreeWnd.wndUnderLastMouseDown				= nil
UI.ShipsTreeWnd.startShipQuestRequestId				= 0
UI.ShipsTreeWnd.startShipQuestData					= nil
UI.ShipsTreeWnd.repairQuestShipsRequestIds			= {}
UI.ShipsTreeWnd.shipQuestRecommendedRoles			= {}
UI.ShipsTreeWnd.questShips							= {}
UI.ShipsTreeWnd.selQuestSlotIdx						= -1
UI.ShipsTreeWnd.autoShipsToAssign					= nil
UI.ShipsTreeWnd.changeBattleSlotVesselBeforeAutoRequests	= {}
UI.ShipsTreeWnd.hMsgGoldRefill						= UI.INVALID_UI_HANDLE
UI.ShipsTreeWnd.shipItemForMaintenance				= nil
UI.ShipsTreeWnd.bToHideAfterDblClick				= false
UI.ShipsTreeWnd.activateAlienNodesRequestId			= 0
UI.ShipsTreeWnd.hMsgActivateAlienNodes				= UI.INVALID_UI_HANDLE
UI.ShipsTreeWnd.activateAlienNodesData				= nil
UI.ShipsTreeWnd.hMsgAdvertLink						= UI.INVALID_UI_HANDLE
UI.ShipsTreeWnd.advertLinkToOpen					= ""

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTreeWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:PrepareLayout()	

	self:UpdateWaitingEffect()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )

end


--
function UI.ShipsTreeWnd:Reset()

	self:SelectRace( -1 )

	self:ResetPanel()

	self.ships						= {}
	self.shipQuestId				= -1
	self.questShips					= {}
	self.selQuestSlotIdx			= -1
	self.wndUnderLastMouseDown		= nil
	self.shipQuestRecommendedRoles	= {}	

	UI.ShipsTree_RacesWnd:Reset()

	self:SetText( "", self.layers.CAPTION )

end


--
function UI.ShipsTreeWnd:FullUpdate()

	self:Reset()
	
	self:UpdateShips()

	UI.ShipsTree_RacesWnd:Update()
	self:RecalcRacesLayout()

	self:UpdatePanel()
	self:ValidateSelRace()	-- вызывать только после UpdatePanel(), чтобы правильно установился скроллбар дерева

	if self.shipQuestToSetData then

		self:SetShipQuest( self.shipQuestToSetData.questId, self.launchData )

		for slotIdx, vid in pairs( self.shipQuestToSetData.vids ) do
			self:SetQuestShip( vid, slotIdx, false, false )
		end

		self:SelectQuestSlot( self.shipQuestToSetData.selSlotIdx, false )

		self.shipQuestToSetData = nil

	end

end


--
function UI.ShipsTreeWnd:UpdatePanel()

	self:ResetPanel()

	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) or UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		self:SetPanelVisibility( false, true )
	else
		self:SetPanelVisibility( self:GetPanelFixedState(), false )
	end

end


--
function UI.ShipsTreeWnd:ResetPanel()

	UI.ShipsTree_BattleSlotsPanelWnd:Reset()
	UI.ShipsTree_BattleSlotsPanelWnd:UnlinkFromParent()

	UI.ShipsTree_QuestPanelWnd:Reset()
	UI.ShipsTree_QuestPanelWnd:UnlinkFromParent()

	UI.ShipsTree_PanelHeaderWnd:Reset()
	UI.ShipsTree_PanelHeaderWnd:UnlinkFromParent()

end


--
function UI.ShipsTreeWnd:TogglePanelFixedState()

	local bOpen = self:GetPanelFixedState()
	self:SetPanelVisibility( not bOpen, false )

end


--
function UI.ShipsTreeWnd:SetPanelVisibility( bOpen, bAuto )

	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) or UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then

		if bOpen then
			sys.log( "UI.ShipsTreeWnd:SetPanelVisibility()[ERROR]: cannot show panel in edit nodes mode" )
			bOpen = false
		end

		if not bAuto then
			sys.log( "UI.ShipsTreeWnd:SetPanelVisibility()[ERROR]: cannot save panel state in edit nodes mode" )
			bAuto = true
		end
		
	end

	local panelWnd = nil

	if not UI.ShipsTree_AlienEditWnd:IsChildOf( self ) and not UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then

		if self.shipQuestId ~= -1 then
			panelWnd = UI.ShipsTree_QuestPanelWnd
		else
			panelWnd = UI.ShipsTree_BattleSlotsPanelWnd
		end

	end

	if panelWnd then

		local bWasOpen = panelWnd:IsOnScreen()

		if bOpen and not bWasOpen then

			self:AddChild( panelWnd )
			panelWnd:FullUpdate()

		elseif not bOpen and bWasOpen then

			panelWnd:Reset()
			panelWnd:UnlinkFromParent()

		end
		
	end

	if not bAuto then
		self:SavePanelState()
	end

	self:OnPanelStateChanged()

end


--
function UI.ShipsTreeWnd:GetPanelFixedState()

	local bOpen = false

	if not UI.ShipsTree_AlienEditWnd:IsChildOf( self ) and not UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then

    	if self.shipQuestId ~= -1 then

        	bOpen = self.QUEST_PANEL_DEFAULT_OPEN

        	local profile = _G.GetProfileTable()
        	if type( profile.shipsTree ) == "table" then

        		if type( profile.shipsTree.questPanelOpen ) == "boolean" then
        			bOpen = profile.shipsTree.questPanelOpen
        		end

        	end

    	else

        	bOpen = self.BATTLE_SLOTS_PANEL_DEFAULT_OPEN

        	local profile = _G.GetProfileTable()
        	if type( profile.shipsTree ) == "table" then

        		if type( profile.shipsTree.battleSlotsPanelOpen ) == "boolean" then
        			bOpen = profile.shipsTree.battleSlotsPanelOpen
        		end

        	end

    	end

	else
		sys.log( "UI.ShipsTreeWnd:GetPanelFixedState()[ERROR]: no panel enabled in edit nodes mode" )
	end

	return bOpen

end


--
function UI.ShipsTreeWnd:SavePanelState()

	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) or UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		sys.log( "UI.ShipsTreeWnd:SavePanelState()[ERROR]: no panel enabled in edit nodes mode" )
		return
	end

    local profile = _G.GetProfileTable()

	if type( profile.shipsTree ) ~= "table" then
		profile.shipsTree = {}
	end

	if self.shipQuestId ~= -1 then

		local bOpen = UI.ShipsTree_QuestPanelWnd:IsChildOf( self )

		if profile.shipsTree.questPanelOpen ~= bOpen then

			local bSave = true

			if profile.shipsTree.questPanelOpen == nil then
				bSave = bOpen ~= self.QUEST_PANEL_DEFAULT_OPEN
			end

			if bSave then
				profile.shipsTree.questPanelOpen = bOpen
			end

		end

	else

		local bOpen = UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self )

		if profile.shipsTree.battleSlotsPanelOpen ~= bOpen then

			local bSave = true

			if profile.shipsTree.battleSlotsPanelOpen == nil then
				bSave = bOpen ~= self.BATTLE_SLOTS_PANEL_DEFAULT_OPEN
			end

			if bSave then
				profile.shipsTree.battleSlotsPanelOpen = bOpen
			end

		end

	end

	-- Profile:Save() будет вызвано только при закрытии окна

end


--
function UI.ShipsTreeWnd:UpdatePanelHeader()

	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) or UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then

		UI.ShipsTree_PanelHeaderWnd:Reset()
		UI.ShipsTree_PanelHeaderWnd:UnlinkFromParent()

	else

		self:AddChild( UI.ShipsTree_PanelHeaderWnd )

    	local mode				= -1
   		local bOpen				= false
		local panelHeaderBtm	= self:GetHeight()

    	if self.shipQuestId ~= -1 then

    		mode = UI.ShipsTree_PanelHeaderWnd.modes.QUEST

   			if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
				bOpen = true
				panelHeaderBtm = UI.ShipsTree_QuestPanelWnd:GetTop()
			end

    	else

    		mode = UI.ShipsTree_PanelHeaderWnd.modes.BATTLE_SLOTS

	   		if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
				bOpen = true
				panelHeaderBtm = UI.ShipsTree_BattleSlotsPanelWnd:GetTop()
			end

    	end

    	UI.ShipsTree_PanelHeaderWnd:Setup( mode )

       	if bOpen then
			local bAuto = not self:GetPanelFixedState()
       		UI.ShipsTree_PanelHeaderWnd:SetOpen( bAuto )
       	else
       		UI.ShipsTree_PanelHeaderWnd:SetClosed()
       	end

		local panelHeaderTop = panelHeaderBtm - UI.ShipsTree_PanelHeaderWnd:GetHeight()
		UI.ShipsTree_PanelHeaderWnd:SetTop( panelHeaderTop )

	end

end


--
function UI.ShipsTreeWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( 1 )
	end

	local rolesPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.rolesLocator ) or Vec2( 0, 0 )
	local shipsPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.shipsLocator ) or Vec2( 0, 0 )
	local alienShipsPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.alienShipsLocator ) or Vec2( 0, 0 )
	local battleSlotsPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.battleSlotsLocator ) or Vec2( 0, 0 )
	local racesLocator		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.racesLocator ) or Vec2( 0, 0 )
	
	UI.ShipsTree_RolesWnd:SetTop( rolesPos.y )
	UI.ShipsTree_TreeWnd:SetTop( shipsPos.y )
	UI.ShipsTree_AlienTreeWnd:SetTop( alienShipsPos.y )	
	UI.ShipsTree_SpecialTreeWnd:SetTop( alienShipsPos.y )	
	UI.ShipsTree_BattleSlotsPanelWnd:SetLeft( battleSlotsPos.x )
	UI.ShipsTree_QuestPanelWnd:SetLeft( battleSlotsPos.x )
	UI.ShipsTree_RacesWnd:SetTop( racesLocator.y )
	
end


--
function UI.ShipsTreeWnd:RecalcLayoutForCurResolution()

	-- собственный размер
	
	local selfX = self:GetLeft()
	local selfX2 = UI.HangarWnd:XToWindow( 1024 )
	
	local selfWidth = selfX2 - selfX
	self:SetWidth( selfWidth )
	
	local selfY			= self:GetTop()
	local bottomPanelY	= UI.HangarWnd:GetBottomPanelY()

	local selfHeight = bottomPanelY - selfY
	self:SetHeight( selfHeight )
	

	local screenX = self:XToWindow( 0 )

	-- корабли: позиция x
	UI.ShipsTree_TreeWnd:SetLeft( screenX )
	UI.ShipsTree_AlienTreeWnd:SetLeft( screenX )
	UI.ShipsTree_SpecialTreeWnd:SetLeft( screenX )

	-- панель боевых слотов: позиция y
	UI.ShipsTree_BattleSlotsPanelWnd:SetTop( selfHeight - UI.ShipsTree_BattleSlotsPanelWnd:GetHeight() )

	-- панель квеста: позиция y
	UI.ShipsTree_QuestPanelWnd:SetTop( selfHeight - UI.ShipsTree_QuestPanelWnd:GetHeight() )

	-- заголовок панели: позиция x
	local panelHeaderX = self:XToWindow( 1024 * 0.5 ) - UI.ShipsTree_PanelHeaderWnd:GetWidth() * 0.5
	UI.ShipsTree_PanelHeaderWnd:SetLeft( panelHeaderX )

	-- размер фона
	self:UpdateBgAnimationTime()

	-- высота фона премиум-кораблей
	if UI.ShipsTree_RolesWnd:IsChildOf( self ) then
		UI.ShipsTree_RolesWnd:RecalcLayout()
	end

end


--
function UI.ShipsTreeWnd:RecalcRolesLayout()

	local screenX		= self:XToWindow( 0 )
	local rolesWidth	= UI.ShipsTree_RolesWnd:GetWidth()
	local rolesX		= screenX + 1024 / 2 - rolesWidth / 2

	UI.ShipsTree_RolesWnd:SetLeft( rolesX )

end


--
function UI.ShipsTreeWnd:RecalcRacesLayout()

	local screenX		= self:XToWindow( 0 )
	local racesWidth	= UI.ShipsTree_RacesWnd:GetWidth()
	local racesX		= screenX + 1024 / 2 - racesWidth / 2
	                                      
	UI.ShipsTree_RacesWnd:SetLeft( racesX )

end


--
function UI.ShipsTreeWnd:OnPanelStateChanged()

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		UI.ShipsTree_TreeWnd:OnShipsTreePanelChanged()
	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienTreeWnd:OnShipsTreePanelChanged()
	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialTreeWnd:OnShipsTreePanelChanged()
	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienEditWnd:OnShipsTreePanelChanged()
	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialEditWnd:OnShipsTreePanelChanged()
	end

	if UI.ShipsTree_RolesWnd:IsChildOf( self ) then
		UI.ShipsTree_RolesWnd:OnShipsTreePanelChanged()
	end

	self:UpdatePanelHeader()

end


--
function UI.ShipsTreeWnd:SelectRace( race )

	UI.ShipsTree_RacesWnd:SelectRace( race )

end


--
function UI.ShipsTreeWnd:OnSelRaceChanged( oldSelRace )

	if not self:IsOnScreen() then
		return
	end

	local selRace = self:GetSelRace()

	if oldSelRace ~= -1 then
		self:SaveScrollPos()
		-- Profile:Save() будет вызвано только при закрытии окна
	end

	UI.ShipsTree_RolesWnd:UnlinkFromParent()
	UI.ShipsTree_TreeWnd:UnlinkFromParent()
	UI.ShipsTree_AlienEditWnd:UnlinkFromParent()
	UI.ShipsTree_SpecialEditWnd:UnlinkFromParent()
	UI.ShipsTree_AlienTreeWnd:UnlinkFromParent()
	UI.ShipsTree_SpecialTreeWnd:UnlinkFromParent()

	self:AddChild( UI.ShipsTree_RacesWnd )
	self:AddChild( UI.ShipsTree_PrestigeWnd )

	if selRace == ai.Race.CRYSTAL then

		self:AddChild( UI.ShipsTree_AlienTreeWnd )
		UI.ShipsTree_AlienTreeWnd:FullUpdate()

	elseif selRace == ai.Race.SPECIAL then

		self:AddChild( UI.ShipsTree_SpecialTreeWnd )
		UI.ShipsTree_SpecialTreeWnd:FullUpdate()

	elseif selRace ~= -1 then

		self:AddChild( UI.ShipsTree_RolesWnd )
    	UI.ShipsTree_RolesWnd:FullUpdate()
    	self:RecalcRolesLayout()

		self:AddChild( UI.ShipsTree_TreeWnd )
    	UI.ShipsTree_TreeWnd:FullUpdate()	-- апдепйт дерева кораблей должен быть после апдейта списка ролей, т.к. используются их координаты

	end

	self:UpdatePanel()
	self:UpdateBg()
	self:UpdateCaption()

	if UI.ShipsTree_BattleSlotsPanelWnd:IsChildOf( self ) then
		UI.ShipsTree_BattleSlotsPanelWnd:OnSelRaceChanged()

	elseif UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
		UI.ShipsTree_QuestPanelWnd:OnSelRaceChanged()
	end

	if UI.ShipsTree_PanelHeaderWnd:IsChildOf( self ) then
		UI.ShipsTree_PanelHeaderWnd:OnSelRaceChanged()
	end	

end


--
function UI.ShipsTreeWnd:SetTreeEvolvingMode()

	local selRace = self:GetSelRace()

	if selRace ~= ai.Race.CRYSTAL and selRace ~= ai.Race.SPECIAL then
		sys.log( "UI.ShipsTreeWnd:SetTreeEvolvingMode()[ERROR]: wrong race selected" )
		return
	end

	local treeWnd = selRace == ai.Race.CRYSTAL and UI.ShipsTree_AlienTreeWnd or UI.ShipsTree_SpecialTreeWnd
	local editWnd = selRace == ai.Race.CRYSTAL and UI.ShipsTree_AlienEditWnd or UI.ShipsTree_SpecialEditWnd

	if treeWnd:IsChildOf( self ) then
		return
	end

	editWnd:UnlinkFromParent()

	self:AddChild( treeWnd )
	treeWnd:FullUpdate()

	self:AddChild( UI.ShipsTree_RacesWnd )	
	self:AddChild( UI.ShipsTree_PrestigeWnd )

	self:UpdatePanel()
	self:UpdateCaption()

end


--
function UI.ShipsTreeWnd:SetEditEvolvingMode( defName )

	local shipRace = UI:GetItemRace( defName )
	if shipRace ~= ai.Race.CRYSTAL and shipRace ~= ai.Race.SPECIAL then
		sys.log( "UI.ShipsTreeWnd:SetEditEvolvingMode()[ERROR]: wrong ship race" )
		return
	end

	if self:GetSelRace() ~= shipRace then
		sys.log( "UI.ShipsTreeWnd:SetEditEvolvingMode()[ERROR]: ship race is not selected" )
		return
	end

	local treeWnd = shipRace == ai.Race.CRYSTAL and UI.ShipsTree_AlienTreeWnd or UI.ShipsTree_SpecialTreeWnd
	local editWnd = shipRace == ai.Race.CRYSTAL and UI.ShipsTree_AlienEditWnd or UI.ShipsTree_SpecialEditWnd

	if treeWnd:IsChildOf( self ) then
		self:SaveScrollPos()
		treeWnd:UnlinkFromParent()
	end

	editWnd:Setup( defName )
	self:AddChild( editWnd )

	UI.ShipsTree_RacesWnd:UnlinkFromParent()
	UI.ShipsTree_PrestigeWnd:UnlinkFromParent()

	self:UpdatePanel()
	self:UpdateCaption()

end


--
function UI.ShipsTreeWnd:UpdateShips()

	self.ships = {}

	local allShips = UI:GetShipsVisibleInShipsTree()
	
	for race, raceShips in pairs( allShips ) do
	
		if not self.ships[ race ] then
			self.ships[ race ] = {}
		end

		for defName, dummy in pairs( raceShips ) do

			local shipData =
			{
				in_links	= {},
				out_links	= {},
			}
			
			self.ships[ race ][ defName ] = shipData

		end
		
	end
	
	for race, raceShips in pairs( self.ships ) do

		for defName, shipData in pairs( raceShips ) do

			shipData.in_links = UI:GetShipsTheShipDependOn( defName )

			for parentIdx, parentDefName in pairs( shipData.in_links ) do

				local parentShipData = raceShips[ parentDefName ]
				if parentShipData then
					table.insert( parentShipData.out_links, defName )
				else
					sys.log( "UI.ShipsTreeWnd:UpdateShips()[ERROR]: parent ship \"%s\" for ship \"%s\" is not in tree", parentDefName, defName )
				end

			end

		end
		
	end

end


--
function UI.ShipsTreeWnd:F_OnAfterShowOnScreen()

	-- вызвается ДО того, как будет вызван OnAfterShowOnScreen дочерних элементов,
	-- т.к. их размер может зависеть от размера главного окна
	self:RecalcLayoutForCurResolution()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

	if not UI.bSavingGameState then
		_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_OPEN_VESSEL_TREE )
	end

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

end


--
function UI.ShipsTreeWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == UI.ShipsTree_RacesWnd:GetUiHandle() then
		self:OnSelRaceChanged( iParam1 )
	end

end


--
function UI.ShipsTreeWnd:SaveScrollPos()

	if self:GetSelRace() == -1 then
		return
	end

	-- сохраняется не просто позиция в пикселах, а позиция относительно первого видимого ранга,
	-- т.к. позиция в пикселах может отличаться для разных рас, а также зависит от состояния нижней панели

	local profile = _G.GetProfileTable()

	if not profile.shipsTree then
		profile.shipsTree = {}
	end

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then

		local pos = UI.ShipsTree_TreeWnd:GetPosToSave()
    	if pos ~= -1 then
    		profile.shipsTree.pos = pos
		end

	elseif UI.ShipsTree_AlienTreeWnd:IsChildOf( self ) then

		local pos = UI.ShipsTree_AlienTreeWnd:GetPosToSave()
    	if pos ~= -1 then
    		profile.shipsTree.alienPos = pos
		end

	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then

		local pos = UI.ShipsTree_SpecialTreeWnd:GetPosToSave()
    	if pos ~= -1 then
    		profile.shipsTree.alienPos = pos
		end

	end

end


--
function UI.ShipsTreeWnd:SaveSelRace()

	local selRace = self:GetSelRace()
	if selRace == -1 then
		return
	end

	local profile = _G.GetProfileTable()

	if type( profile.shipsTree ) ~= "table" then
		profile.shipsTree = {}
	end

	profile.shipsTree.selRace = selRace

end


--
function UI.ShipsTreeWnd:RestoreSelRace()

	local profile = _G.GetProfileTable()

	if type( profile.shipsTree ) ~= "table" then	
		return false
	end

	local race = profile.shipsTree.selRace
	
	if type( race ) ~= "number" then	
		return false
	end

	if UI:Val2Key( ai.Race, race ) == "" or race == ai.Race.NUM then
		return false
	end

	if self:IsRaceDisabled( race ) then
		return false
	end

	self:SelectRace( race )

	return true

end


--
function UI.ShipsTreeWnd:SetDefaultSelRace()

	self:SelectRace( ai.Race.EMPIRE )

end


--
function UI.ShipsTreeWnd:ValidateSelRace()

	if not self:RestoreSelRace() then
		self:SetDefaultSelRace()
	end

end


--
function UI.ShipsTreeWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:HideChildModals()
	end

	if not UI:IsInShutdown() then

		self:SaveSelRace()
		self:SaveScrollPos()

		Profile:Save()

	end

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

	self.launchData = nil
	
	if not UI:IsInRemovingAllWindows() then
		self:Reset()
	end

end


--
function UI.ShipsTreeWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w == UI.ShipsTree_CrossBtn then

    	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) or UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then

			if self.launchData and self.launchData.bReturnFromEvolvingEdit then
				self:Close()
			else
				self:SetTreeEvolvingMode()
			end

    	else
    		self:Close()
    	end

	elseif UI:IsWndKindOf( w, "ShipsTree_RaceSlotWnd" ) then

		if not w:IsDisabled() then

    		local race = w:GetRace()
    		if race ~= self:GetSelRace() then

    			self:SelectRace( race )
    			UI:PlayGlobalSound( self.sounds.selectRace )

    			_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_VESSEL_TREE_RACE_SELECT )

    		end

		end

	elseif UI:IsWndKindOf( w, "ShipsTree_PriceBtn" ) or UI:HasWndAncestorKindOf( w, "ShipsTree_PriceBtn" ) then

		if not self:IsWaiting() then

			local priceBtn = nil
			if UI:IsWndKindOf( w, "ShipsTree_PriceBtn" ) then
				priceBtn = w
			else
				priceBtn = UI:GetAncestorKindOf( w, "ShipsTree_PriceBtn" )
			end

			-- даже если сама кнопка задисэйблена, ссылка с ценой активна, поэтому на нее можно кликнуть
			if priceBtn:IsEnabled() then

				local shipDefName = priceBtn:GetDefName()				
				self:LaunchBuyShipWnd( shipDefName )

			end

		end

	elseif UI:IsWndKindOf( w, "ShipsTree_CraftBtn" ) then

		if not self:IsWaiting() then

			local shipSlotWnd	= w:GetParent()
			local defName		= shipSlotWnd:GetDefName()

			UI.HangarWnd:ShowShipCraft( defName, { bShipsTree = true, shipQuestId = self.shipQuestId, shipsTreeLaunchData = self.launchData, selectedShips = self.questShips } )

		end
		
	elseif UI:IsWndKindOf( w, "ShipsTree_EvolvingEdit_DlcBtn" ) then
	
		if not self:IsWaiting() then

			local editWnd = UI:GetAncestorKindOf( w, "ShipsTree_EvolvingEditWnd" )
			if editWnd then

				local dlcName = UI:GetShipDlcName( editWnd:GetBaseDefName() )

				if _G.Arc_IsInitialized() then
					self:TryBuyArcDlc( dlcName )
				else
					UI:LaunchDlcLink( dlcName )
				end
				
			else
				sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDown()[ERROR]: cannot find node edit wnd for dlc btn" )
			end

		end

	elseif UI:IsWndKindOf( w, "ShipsTree_DlcBtn" ) then

		if not self:IsWaiting() then

			local shipSlotWnd = w:GetParent()
			
			if UI:IsWndKindOf( shipSlotWnd, "ShipsTree_Tree_ShipSlotWnd" ) then
				self:LaunchBuyShipWnd( shipSlotWnd:GetDefName() )
				
			elseif UI:IsWndKindOf( shipSlotWnd, "ShipsTree_AlienTree_ShipSlotWnd" ) then
				self:SetEditEvolvingMode( shipSlotWnd:GetBaseDefName() )
				UI:PlayGlobalSound( UI.sounds.btnClick )

			else
				sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDown()[ERROR]: unhandled slot type for dlc btn: %s", shipSlotWnd:GetPrototypeName() )
			end

		end

	elseif UI:IsWndKindOf( w, "ShipsTree_RoleIcoWnd" ) then

		UI.RoleInfoWnd:ShowAsHelp( w:GetRole() )

	elseif UI:IsWndKindOf( w, "ItemControl_DurabilityIcoWnd" ) then

		if not self:IsWaiting() then

			local battleSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_BattleSlotWnd" )
			if battleSlotWnd then			

    			local data = battleSlotWnd:GetRecordData()

    			self:TryRefillAndRepairShip( data.shipItem )
    			UI:PlayGlobalSound( self.sounds.durabilityIcoClick )

			else
				sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDown()[ERROR]: cannot find slot from durabilty ico" )
			end

		end

	elseif w == UI.ShipsTree_QuestCancelBtn then

		self:Close()

	elseif w == UI.ShipsTree_QuestStartBtn then

		if not self:IsWaiting() then
			self:TryStartShipQuest()
			UI:PlayGlobalSound( self.sounds.startQuest )			
		end

	elseif w == UI.ShipsTree_PanelHeaderWnd then

		self:TogglePanelFixedState()

	elseif w == UI.ShipsTree_AutoShipsBtn then

		if not UI.ShipsTree_AutoShipsBtn:IsGray() then
			if not self:IsWaiting() then

				self:AssignQuestAutoShips()
				UI:PlayGlobalSound( self.sounds.questAutoShips )

			end
		end

	elseif UI:IsWndKindOf( w, "ShipsTree_ResourceQuestBtn" ) then

		local shipSlot = UI:GetAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
		if shipSlot then
			self:LaunchQuestInfoWndForResourceQuest( shipSlot:GetDefName() )
		end

	elseif w == UI.ShipsTree_AlienEdit_BuyBtn then

		if not self:IsWaiting() then
			self:LaunchCraftAlienShipWnd( UI.ShipsTree_AlienEditWnd:GetBaseDefName() )    			
		end

	elseif w == UI.ShipsTree_SpecialEdit_BuyBtn then

		if not self:IsWaiting() then
			self:LaunchCraftSpecialShipWnd( UI.ShipsTree_SpecialEditWnd:GetBaseDefName() )
		end

	elseif UI:IsWndKindOf( w, "ShipsTree_EvolvingEdit_NodeWnd" ) then

		if w:CanClick() then

    		if not self:IsWaiting() then

    			local shipSlotWnd	= w:GetParent()
				local node			= w:GetNode()

				if node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED then

					local race = self:GetSelRace()

					if race == ai.Race.CRYSTAL then
						self:LaunchLearnAlienShipNodeWnd( node.name, shipSlotWnd:GetVid(), shipSlotWnd:GetChosenActiveNodesMask() )

					elseif race == ai.Race.SPECIAL then
						self:LaunchLearnSpecialShipNodeWnd( node.name, shipSlotWnd:GetVid(), shipSlotWnd:GetChosenActiveNodesMask() )
					end

				elseif node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE then
					shipSlotWnd:TryChooseNode( node, false )

				elseif node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE then
					shipSlotWnd:TryChooseNode( node, true )

				else
					sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDown()[ERROR]: unhandled node status %d", node.status )
				end
    			
    		end

		end

	elseif w == UI.ShipsTree_AlienEdit_CommitBtn then

    	if not self:IsWaiting() then
			self:TryActivateChosenEvolvingNodes( UI.ShipsTree_AlienEditWnd:GetShipItem(), UI.ShipsTree_AlienEditWnd:GetChosenActiveNodesMask() )
		end	

	elseif w == UI.ShipsTree_SpecialEdit_CommitBtn then

    	if not self:IsWaiting() then
			self:TryActivateChosenEvolvingNodes( UI.ShipsTree_SpecialEditWnd:GetShipItem(), UI.ShipsTree_SpecialEditWnd:GetChosenActiveNodesMask() )
		end

	elseif UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipBuyBtn" ) then

    	local shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )
		self:SetEditEvolvingMode( shipSlotWnd:GetBaseDefName() )
		UI:PlayGlobalSound( UI.sounds.btnClick )

	elseif UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipEditBtn" ) then

    	local shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )
		self:SetEditEvolvingMode( shipSlotWnd:GetBaseDefName() )
		UI:PlayGlobalSound( UI.sounds.btnClick )

	elseif UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipInfoBtn" ) then

    	local shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )
		self:SetEditEvolvingMode( shipSlotWnd:GetBaseDefName() )
		UI:PlayGlobalSound( UI.sounds.btnClick )

	elseif UI:IsWndKindOf( w, "ShipsTree_ShipAdvertBtn" ) then

		local link = ""
		local shipDefName = ""

		if UI:HasWndAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" ) then

    		local shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )
			shipDefName = shipSlotWnd:GetBaseDefName()

		elseif UI:HasWndAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) then

    		local shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
			shipDefName = shipSlotWnd:GetDefName()

		else
			sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDown()[ERROR]: unhandled kind of parent" )
		end

		if shipDefName ~= "" then
			link = UI:GetShipAdvertLink( shipDefName )
		else
			sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDown()[ERROR]: cannot detect ship" )
		end

		if link ~= "" then
			self.hMsgAdvertLink = UI:MessageBox( UI:GetStringByName( "msg_httpLinkOpen_caption" ), UI:GetStringByName( "msg_httpLinkOpen_text" ), UI.MBS_YES_NO )
			self.advertLinkToOpen = link
		else
			sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDown()[ERROR]: advert link not found" )
		end

	end

	return true

end


--
function UI.ShipsTreeWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if w ~= self.wndUnderLastMouseDown then
		return true
	end

	-- #0032857: боевые слоты реагируют не на нажатие, а но отпускание мыши, чтобы не пересекаться с драг-эн-дропом кораблей

	if	UI:IsWndKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
		or
		(
			UI:HasWndAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
			and not UI:IsWndKindOf( w, "ShipsTree_PriceBtn" )
			and not UI:IsWndKindOf( w, "ShipsTree_CraftBtn" )
			and not UI:IsWndKindOf( w, "ShipsTree_DlcBtn" ) 
		)
		or UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )
		or
		(
			UI:HasWndAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )
			and not UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipBuyBtn" )
			and not UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipEditBtn" )
			and not UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipInfoBtn" )
		) then

		if self.shipQuestId ~= -1 then

			if not self:IsWaiting() then

				if not UI:IsShipQuestTaken( self.shipQuestId ) then

    				local shipSlotWnd = nil

					if UI:IsWndKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) then
						shipSlotWnd = w

					elseif UI:HasWndAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) then
						shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )

					else
						sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonUp()[ERROR]: unhandled wnd kind for quest mode (%s)", w:GetScriptTableName() )
					end

					if shipSlotWnd then

    					local shipItem = shipSlotWnd:GetShipItem()

    					if shipSlotWnd:IsFitForShipQuest() then

            				local questSlotIdx = -1

            				for slotIdx, qestVid in ipairs( self.questShips ) do
        						if qestVid == shipItem.vid then
        							questSlotIdx = slotIdx 
    								break
            					end
            				end

    						if self.selQuestSlotIdx ~= -1 and questSlotIdx ~= self.selQuestSlotIdx then
        						self:SetQuestShip( shipItem.vid, self.selQuestSlotIdx, false, true )
    						end

    					end

					end

				end

			end

		else

			if not self:IsWaiting() then

    			if UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then

    				local shipSlotWnd = nil

					if UI:IsWndKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) then
						shipSlotWnd = w

					elseif UI:HasWndAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) then
						shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )

					elseif	UI:IsWndKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" ) then
						shipSlotWnd = w

					elseif UI:HasWndAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" ) then
						shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )

					else
						sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonUp()[ERROR]: unhandled wnd kind for non quest mode (%s)", w:GetScriptTableName() )
					end			

					if shipSlotWnd then

        				local shipItem = shipSlotWnd:GetShipItem()

        				if shipSlotWnd:IsBought() and not UI:IsShipOnShipQuest( shipItem ) and not UI:IsShipInMatchmaking( shipItem ) and not UI:IsShipInBattle( shipItem ) and not UI:IsShipDisabledByTime( shipItem.defName ) then

                			local selBattleSlotIdx = UI.HangarWnd:GetSelBattleSlot()

                			if selBattleSlotIdx ~= -1 and UI:GetShipBattleSlot( shipItem ) ~= selBattleSlotIdx then
                	    		self:ChangeShipInBattleSlot( selBattleSlotIdx, shipItem.vid, true, false )
            				end

        				end

					end

				end

			end

		end

	elseif UI:IsWndKindOf( w, "ShipsTree_BattleSlotWnd" ) then

		local listWnd = w:GetList()	-- не путать с GetParent(); parent-ом в списках, производных от UI.ButtonsList3Wnd, будет техническое окно маски

		if listWnd == UI.ShipsTree_BattleSlotsListWnd then
		
			local data = w:GetRecordData()

			if data.bSlotBought then
				UI.HangarWnd:SelectBattleSlot( w:GetRecord() )
			end

		elseif listWnd == UI.ShipsTree_QuestShipsListWnd then
			self:SelectQuestSlot( w:GetRecord(), true )
		end

	end   

	return true

end


--
function UI.ShipsTreeWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if not self:IsOnScreen() then
		return
	end

	self.wndUnderLastMouseDown = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )

end 


--
function UI.ShipsTreeWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) or UI:HasWndAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) then

		if not self:IsWaiting() then

			local shipSlotWnd = nil

			if UI:IsWndKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) then
				shipSlotWnd = w
			else
				shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
			end

			UI:ShowPopUpMenuForShip( shipSlotWnd:GetDefName(), UI.HangarWnd:GetUiHandle() )

		end

	elseif UI:IsWndKindOf( w, "ShipsTree_BattleSlotWnd" ) or UI:HasWndAncestorKindOf( w, "ShipsTree_BattleSlotWnd" ) then

		if not self:IsWaiting() then

			local battleSlotWnd = nil

			if UI:IsWndKindOf( w, "ShipsTree_BattleSlotWnd" ) then
				battleSlotWnd = w
			else
				battleSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_BattleSlotWnd" )
			end

			local data = battleSlotWnd:GetRecordData()
			if data.shipItem then
				UI:ShowPopUpMenuForShip( data.shipItem.defName, UI.HangarWnd:GetUiHandle() )
			end

		end	

	elseif UI:IsWndKindOf( w, "ShipsTree_Evolving_ShipIcoWnd" ) then

		if UI:HasWndAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" ) then

    		if not self:IsWaiting() then		

				local shipSlotWnd = UI:GetAncestorKindOf( w, "ShipsTree_AlienTree_ShipSlotWnd" )
    			UI:ShowPopUpMenuForShip( shipSlotWnd:GetCurDefName(), UI.HangarWnd:GetUiHandle() )			

    		end

		end

	end

	return true

end


--
function UI.ShipsTreeWnd:F_OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDblClick( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if	UI:IsWndKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
		or
		(
			UI:HasWndAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
			and not UI:IsWndKindOf( w, "ShipsTree_PriceBtn" )
			and not UI:IsWndKindOf( w, "ShipsTree_CraftBtn" )
			and not UI:IsWndKindOf( w, "ShipsTree_DlcBtn" ) 
		) then

		-- TODO: выяснить, что делать в режиме квеста
		if self.shipQuestId == -1 then

			if UI.HangarWnd:GetPrepareState() == UI.HangarWnd.prepareStates.NONE then

				local shipSlotWnd	= UI:IsWndKindOf( w, "ShipsTree_Tree_ShipSlotWnd" ) and w or UI:GetAncestorKindOf( w, "ShipsTree_Tree_ShipSlotWnd" )
				local shipItem		= shipSlotWnd:GetShipItem()

				if shipSlotWnd:IsBought() and not UI:IsShipOnShipQuest( shipItem ) and not UI:IsShipInMatchmaking( shipItem ) and not UI:IsShipInBattle( shipItem ) and not UI:IsShipDisabledByTime( shipItem.defName ) then

					if self.changeBattleSlotVesselRequiestId == 0 then

            			local selBattleSlotIdx = UI.HangarWnd:GetSelBattleSlot()

            			if selBattleSlotIdx ~= -1 and UI:GetShipBattleSlot( shipItem ) == selBattleSlotIdx then
							self:Close()
						else
							sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDblClick()[ERROR]: ship is not in selected battle slot" )
        				end

					else
						self.bToHideAfterDblClick = true
					end

				end

			end

		end

	elseif UI:IsWndKindOf( w, "ShipsTree_BattleSlotWnd" ) then

		local listWnd = w:GetList()	-- не путать с GetParent(); parent-ом в списках, производных от UI.ButtonsList3Wnd, будет техническое окно маски

		if listWnd == UI.ShipsTree_BattleSlotsListWnd then

			if w:GetRecordData().shipItem then

				if w:IsSelected() then
					self:Close()
				else
					sys.log( "UI.ShipsTreeWnd:F_OnMouseLButtonDblClick()[ERROR]: battle slot is not selected" )
				end

			end

		end

	end   

	return true

end


--
function UI.ShipsTreeWnd:UpdateWaitingEffect()

	local bWaiting = self:IsWaiting()

	self:SetLayerVisible( bWaiting, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( bWaiting, self.layers.WAIT_TEXT )

end


--
function UI.ShipsTreeWnd:IsWaiting()

	return
		self.buyRequestId ~= 0
		or self.bWaitOwnVessels
		or self.changeBattleSlotVesselRequiestId ~= 0
		or self.buyInventoryRequestId ~= 0
		or self.repairRequestId ~= 0
		or self.refillRequestId ~= 0
		or self.swapBattleSlotVesselsRequstId ~= 0
		or self.startShipQuestRequestId ~= 0
		or next( self.repairQuestShipsRequestIds ) ~= nil
		or next( self.changeBattleSlotVesselBeforeAutoRequests ) ~= nil
		or UI:IsWaitingRequests()
		or self.activateAlienNodesRequestId ~= 0
		or UI.ShipsTree_AlienEditWnd:HasWaitingRequests()
		or UI.ShipsTree_SpecialEditWnd:HasWaitingRequests()
		or UI.HangarWnd:IsWaitingShipUpgrade()

end


--
function UI.ShipsTreeWnd:TryBuyShip( defName, bForShipParts )

	if self:IsWaiting() then
		return
	end

	local shopItem = UI:GetShopItemByDef( defName )
	if not shopItem then
		sys.log( "UI.ShipsTreeWnd:TryBuyShip()[ERROR]: cannot find shopItem for \"%s\"", tostring( defName ) )
		return
	end

	local bEnoughInventorySize = true
	if not UI:GetShipItemByDef( defName, true ) then	-- при расконсервации ранее купленного корабля места на складе не нужно
		bEnoughInventorySize = UI:IsEnoughPlaceInInventoryForItem( defName )
	end

	if bEnoughInventorySize then

		self:LaunchTradeWnd( shopItem, bForShipParts )

	else

		if UI:CanIncreaseInventory() then

			self.itemToBuy			= shopItem
			self.bToBuyForShipParts	= bForShipParts

    		local needSize		= UI:GetNeedInventorySizeForItem( defName )
    		local curLevel		= UI:GetInventoryCurLevel()
    		local curUsedSize	= UI:GetInventoryCurSize()

    		local inventoryLevelsToBuy = {}

    		for levelToBuy = curLevel + 1, UI:GetInventoryMaxLevel() do

    			table.insert( inventoryLevelsToBuy, levelToBuy )

    			local newCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
    			if ( curUsedSize + needSize ) <= newCapacity then
    				break
    			end

    		end		

			self:LaunchTradeWithInventoryWnd( shopItem, inventoryLevelsToBuy, bForShipParts )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end	


--
function UI.ShipsTreeWnd:DoBuyShip( shopItem, bForShipParts )

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:DoBuyShip()[ERROR]: still is waiting for some other request" )
		return
	end

	self.bWaitOwnVessels			= false
	self.newShipToInstall			= ""
	self.battleSlotToInstallNewShip	= -1

	if bForShipParts then
		self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1 )
	else
		local bGold = UI:IsShipGold( shopItem.defName )
		local creditsType = bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS		
		self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1, creditsType )
	end

	if self.buyRequestId ~= 0 then

		self.bWaitOwnVessels = true

		local shipItemInSelBattleSlot = UI.HangarWnd:GetShipItemInSelBattleSlot()
		if not shipItemInSelBattleSlot then

	    	self.newShipToInstall			= shopItem.defName
	    	self.battleSlotToInstallNewShip	= UI.HangarWnd:GetSelBattleSlot()

		end

	else
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:TryBuyArcDlc( dlcName )

	if self:IsWaiting() then
		return
	end

	if type( dlcName ) ~= "string" then
		sys.log( "UI.ShipsTreeWnd:TryBuyArcDlc()[ERROR]: invalid type of the 1-st parameter (\"dlcName\"); \"string\" expected, got \"%s\"", type( dlcName ) )
		return
	end

	local bundleDefName = UI:GetDlcArcBundle( dlcName )
	if bundleDefName == "" then
		sys.log( "UI.ShipsTreeWnd:TryBuyArcDlc()[ERROR]: cannot find arc bundle for dlc \"%s\"", dlcName )
		return
	end

	self:TryBuyBundle( bundleDefName )

end


--
function UI.ShipsTreeWnd:TryBuyBundle( bundleDefName )

	if self:IsWaiting() then
		return
	end

	if type( bundleDefName ) ~= "string" then
		sys.log( "UI.ShipsTreeWnd:TryBuyBundle()[ERROR]: invalid type of the 1-st parameter (\"bundleDefName\"); \"string\" expected, got \"%s\"", type( bundleDefName ) )
		return
	end

	if UI:IsBundleContentFullyCollected( bundleDefName ) then
		sys.log( "UI.ShipsTreeWnd:TryBuyBundle()[ERROR]: bundle \"%s\" is considered to be fully collected", bundleDefName )
		UI:MessageBox( UI:GetStringByName( "msgBundleContentCollected_caption" ), UI:GetStringByName( "msgBundleContentCollected_text" ), UI.MBS_OK )
		return
	end

	local shopItem = UI:GetShopItemByDef( bundleDefName )
	if not shopItem then
		sys.log( "UI.ShipsTreeWnd:TryBuyBundle()[ERROR]: cannot find shop item for \"%s\"", bundleDefName )
		return
	end

	if UI:IsEnoughPlaceInInventoryForItem( bundleDefName ) then

		self:LaunchTradeWnd( shopItem )

	else

		if UI:CanIncreaseInventory() then

			self.itemToBuy			= shopItem
			self.bToBuyForShipParts	= false

    		local needSize		= UI:GetNeedInventorySizeForItem( bundleDefName )
    		local curLevel		= UI:GetInventoryCurLevel()
    		local curUsedSize	= UI:GetInventoryCurSize()

    		local inventoryLevelsToBuy = {}

    		for levelToBuy = curLevel + 1, UI:GetInventoryMaxLevel() do

    			table.insert( inventoryLevelsToBuy, levelToBuy )

    			local newCapacity = UI:GetInventoryMaxSizeForLevel( levelToBuy )
    			if ( curUsedSize + needSize ) <= newCapacity then
    				break
    			end

    		end		

			self:LaunchTradeWithInventoryWnd( shopItem, inventoryLevelsToBuy )

		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end

	end

end


--
function UI.ShipsTreeWnd:DoBuyBundle( shopItem )

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:DoBuyBundle()[ERROR]: still is waiting for some other request" )
		return
	end

	local price, priceType = UI:GetBundleRealBuyPrice( shopItem )

	self.bWaitOwnVessels			= false
	self.newShipToInstall			= ""
	self.battleSlotToInstallNewShip	= -1

	self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1, priceType )

	if self.buyRequestId == 0 then
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:LaunchTradeWnd( shopItem, bBuyForShipParts )

	UI.ShipsTree_TradeWnd:SetupForBuy( shopItem, nil, bBuyForShipParts )
	UI.ShipsTree_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShipsTreeWnd:LaunchTradeWithInventoryWnd( shopItem, inventoryLevelsToBuy, bBuyForShipParts )

	UI.ShipsTree_BuyWithInventoryWnd:Setup( shopItem, inventoryLevelsToBuy, bBuyForShipParts )
	UI.ShipsTree_BuyWithInventoryWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipsTreeWnd:LaunchBuyWnd( mode, data )

	UI.ShipsTree_BuyWnd:Setup( mode, true, data, true )
	UI.ShipsTree_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipsTreeWnd:HideChildModals()

	UI.ShipsTree_TradeWnd:UnlinkFromParent()

	UI.ShipsTree_BuyWithInventoryWnd:UnlinkFromParent()
    self.itemToBuy			= nil
	self.bToBuyForShipParts	= false

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
		UI.BuyBundleWnd:Hide()
	end

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
		UI.BuyBundleWnd:Hide()
	end

	if self.hMsgGoldRefill ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgGoldRefill )
		self.hMsgGoldRefill = UI.INVALID_UI_HANDLE
	end
	self.shipItemForMaintenance = nil

	UI.AlienShipCraftWnd:Hide()
	UI.SpecialShipCraftWnd:Hide()
	UI.AlienShipNodeLearnWnd:Hide()
	UI.SpecialShipNodeLearnWnd:Hide()

	if self.hMsgActivateAlienNodes ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgActivateAlienNodes )
		self.hMsgActivateAlienNodes = UI.INVALID_UI_HANDLE
	end
	self.activateAlienNodesData = nil

	if self.hMsgAdvertLink ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgAdvertLink )
		self.hMsgAdvertLink = UI.INVALID_UI_HANDLE
	end
	self.advertLinkToOpen = ""

end


--
function UI.ShipsTreeWnd:F_OnEventSaveUiState()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	local shipQuestData = nil

	if self:IsOnScreen() then

		if self.shipQuestId ~= -1 then

			shipQuestData = {}

			shipQuestData.questId				= self.shipQuestId
			shipQuestData.vids					= self.questShips
			shipQuestData.selSlotIdx			= self.selQuestSlotIdx
			
		end

	end

	UI.store.ShipsTreeWnd =
	{
		buyRequestId						= self.buyRequestId,
		bWaitOwnVessels						= self.bWaitOwnVessels,
		newShipToInstall 					= self.newShipToInstall,
		battleSlotToInstallNewShip			= self.battleSlotToInstallNewShip,
		changeBattleSlotVesselRequiestId	= self.changeBattleSlotVesselRequiestId,
		buyInventoryRequestId				= self.buyInventoryRequestId,
		repairRequestId						= self.repairRequestId,
		refillRequestId						= self.refillRequestId,
		swapBattleSlotVesselsRequstId		= self.swapBattleSlotVesselsRequstId,
		shipQuestData						= shipQuestData,
		questShipToSetData					= self.questShipToSetData,
		startShipQuestRequestId				= self.startShipQuestRequestId,
		startShipQuestData					= self.startShipQuestData,
		repairQuestShipsRequestIds			= self.repairQuestShipsRequestIds,
		autoShipsToAssign					= self.autoShipsToAssign,
		changeBattleSlotVesselBeforeAutoRequests	= self.changeBattleSlotVesselBeforeAutoRequests,
		bToHideAfterDblClick				= self.bToHideAfterDblClick,
		activateAlienNodesRequestId			= self.activateAlienNodesRequestId,
		launchData							= self.launchData,
	}

end


--
function UI.ShipsTreeWnd:F_OnEventRestoreUiState()

	if UI.store.ShipsTreeWnd then

		self.buyRequestId						= UI.store.ShipsTreeWnd.buyRequestId
		self.bWaitOwnVessels					= UI.store.ShipsTreeWnd.bWaitOwnVessels
		self.newShipToInstall 					= UI.store.ShipsTreeWnd.newShipToInstall
		self.battleSlotToInstallNewShip			= UI.store.ShipsTreeWnd.battleSlotToInstallNewShip
		self.changeBattleSlotVesselRequiestId	= UI.store.ShipsTreeWnd.changeBattleSlotVesselRequiestId
		self.buyInventoryRequestId				= UI.store.ShipsTreeWnd.buyInventoryRequestId
		self.repairRequestId					= UI.store.ShipsTreeWnd.repairRequestId
		self.refillRequestId					= UI.store.ShipsTreeWnd.refillRequestId
		self.swapBattleSlotVesselsRequstId		= UI.store.ShipsTreeWnd.swapBattleSlotVesselsRequstId
		self.questShipToSetData					= UI.store.ShipsTreeWnd.questShipToSetData
		self.startShipQuestRequestId			= UI.store.ShipsTreeWnd.startShipQuestRequestId
		self.startShipQuestData					= UI.store.ShipsTreeWnd.startShipQuestData
		self.repairQuestShipsRequestIds			= UI.store.ShipsTreeWnd.repairQuestShipsRequestIds
		self.autoShipsToAssign					= UI.store.ShipsTreeWnd.autoShipsToAssign
		self.changeBattleSlotVesselBeforeAutoRequests	= UI.store.ShipsTreeWnd.changeBattleSlotVesselBeforeAutoRequests
		self.bToHideAfterDblClick				= UI.store.ShipsTreeWnd.bToHideAfterDblClick
		self.activateAlienNodesRequestId		= UI.store.ShipsTreeWnd.activateAlienNodesRequestId
		self.launchData							= UI.store.ShipsTreeWnd.launchData

		self:UpdateWaitingEffect()

		if self:IsOnScreen() then

			local shipQuestData = UI.store.ShipsTreeWnd.shipQuestData
			if shipQuestData then

				self:SetShipQuest( shipQuestData.questId, UI.store.ShipsTreeWnd.launchData )

				for slotIdx, vid in pairs( shipQuestData.vids ) do
					self:SetQuestShip( vid, slotIdx, false, false )
				end

				self:SelectQuestSlot( shipQuestData.selSlotIdx, false )

			end

		else
			self.shipQuestToSetData = UI.store.ShipsTreeWnd.shipQuestData
		end

		UI.store.ShipsTreeWnd = nil

	end

end


--
function UI.ShipsTreeWnd:ShowMsgOnStartShipQuestError( result )

	UI:ShowErrorMsg( "msg_startQuestShipError", result, "_G.MasterServer.ShipQuestOpResult" )

end  


--
function UI.ShipsTreeWnd:ChangeShipInBattleSlot( slotIdx, vid, bSound, bSwapShips )

	if bSwapShips == nil then
		bSwapShips = false
	end

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:ChangeShipInBattleSlot()[ERROR]: is still waiting for some other request" )
		return false
	end

	if vid ~= UI.INVALID_U64_ID and UI:IsShipOnShipQuestByVid( vid ) then
		sys.log( "UI.ShipsTreeWnd:ChangeShipInBattleSlot()[ERROR]: ship is on quest" )
		return false
	end

	local slot2Idx = -1

	if bSwapShips then

		local slot1OldVid = UI.serverData.battleSlots[ slotIdx ]
		if slot1OldVid ~= nil and slot1OldVid ~= UI.INVALID_U64_ID then
			slot2Idx = UI:GetShipBattleSlotByVid( vid )
		end

	end

	if slot2Idx == -1 then
		bSwapShips = false
	end

	if bSwapShips then

    	self.swapBattleSlotVesselsRequstId = _G.GameStore_SwapBattleSlotVessels( slotIdx - 1, slot2Idx - 1 )

    	if self.swapBattleSlotVesselsRequstId == 0 then
    		UI:ShowMsgOnChangeBatleSlotVesselError( _G.GameStore.ChangeBSResult.CBSR_ERROR )
			return false

    	else
        	if bSound then
            	UI:PlayGlobalSound( self.sounds.changeShipInBattleSlot )
        	end
    	end

	else

		-- перед установкой в боевой слот корабль убирается из квестового слота

		if vid ~= UI.INVALID_U64_ID then

			if self.shipQuestId ~= -1 then

				if not UI:IsShipQuestTaken( self.shipQuestId ) then

					for questShipIdx, questShipVid in pairs( self.questShips ) do

						if questShipVid == vid then

							self:SetQuestShipInternal( UI.INVALID_U64_ID, questShipIdx )
							break

						end

					end

				end		

			end

		end

    	self.changeBattleSlotVesselRequiestId = _G.GameStore_ChangeBattleSlotVessel( slotIdx - 1, vid )

    	if self.changeBattleSlotVesselRequiestId == 0 then

			self.questShipToSetData = nil
    		UI:ShowMsgOnChangeBatleSlotVesselError( _G.GameStore.ChangeBSResult.CBSR_ERROR )

			return false

    	else

        	if bSound then
            	UI:PlayGlobalSound( self.sounds.changeShipInBattleSlot )
        	end

    	end

	end

	self:UpdateWaitingEffect()
	return true

end


--
function UI.ShipsTreeWnd:BuyInventory( inventoryLevels )

	if self:IsWaiting() then

		self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

		sys.log( "UI.ShipsTreeWnd:BuyInventory()[ERROR]: is still waiting for some other request" )

		return

	end

	if type( inventoryLevels ) ~= "table" or not next( inventoryLevels ) then

		self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

		sys.log( "UI.ShipsTreeWnd:BuyInventory()[ERROR]: invalid \"inventoryLevels\" param" )

		return

	end

	local maxLevel = inventoryLevels[ #inventoryLevels ]
	self.buyInventoryRequestId = _G.GameStore_BuyInventoryExtension( maxLevel )

	if self.buyInventoryRequestId == 0 then

    	self.itemToBuy					= nil
		self.bToBuyForShipParts			= false

    	UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )

	end

    self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:TryRefillAndRepairShip( shipItem )

	if not shipItem then
		sys.log( "UI.ShipsTreeWnd:TryRefillAndRepairShip()[ERROR]: nill shipItem" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:TryRefillAndRepairShip()[ERROR]: still waiting for another request" )
		return
	end

	if UI:IsShipInBattle( shipItem ) then
		sys.log( "UI.ShipsTreeWnd:TryRefillAndRepairShip()[ERROR]: the ship is in battle" )
		return
	end

	if UI:IsShipOnShipQuest( shipItem ) then
		sys.log( "UI.ShipsTreeWnd:TryRefillAndRepairShip()[ERROR]: the ship is on quest" )
		return
	end

	local bCanContinue	= true

	local refillInfo	= UI:GetShipRefillInfo( shipItem )
	local bNeedRefill	= refillInfo.bHasAvailable and not refillInfo.bFullAmmo

	if bNeedRefill then

		if refillInfo.gold > 0 then

			self.hMsgGoldRefill = UI:MessageBox( UI:GetStringByName( "maintenanceTooltip_caption" ), UI:GetStringByName( "goldMaintenanceConfirm" ), UI.MBS_YES_NO )

			self.shipItemForMaintenance = shipItem
			bCanContinue = false

		end

	end

	if bCanContinue then
		self:DoRefillAndRepairShip( shipItem )
	end

end


--
function UI.ShipsTreeWnd:DoRefillAndRepairShip( shipItem )

	if not shipItem then
		sys.log( "UI.ShipsTreeWnd:DoRefillAndRepairShip()[ERROR]: nill shipItem" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:DoRefillAndRepairShip()[ERROR]: still waiting for another request" )
		return
	end

	if UI:IsShipInBattle( shipItem ) then
		sys.log( "UI.ShipsTreeWnd:DoRefillAndRepairShip()[ERROR]: the ship is in battle" )
		return
	end

	if UI:IsShipOnShipQuest( shipItem ) then
		sys.log( "UI.ShipsTreeWnd:DoRefillAndRepairShip()[ERROR]: the ship is on quest" )
		return
	end

	local hp			= _G.GameStore_GetVesselHullCondition( shipItem.vid )
	local refillInfo	= UI:GetShipRefillInfo( shipItem )

	local bNeedRepair = hp < 1
	local bNeedRefill = refillInfo.bHasAvailable and not refillInfo.bFullAmmo

	if bNeedRepair then		

    	self.repairRequestId = _G.GameStore_RepairVessel( shipItem.vid )

		if self.repairRequestId == 0 then
    		UI:ShowMsgOnRepairError( _G.GameStore.StoreBuyResult.SBR_ERROR )
    	end

	end

	if bNeedRefill then

    	self.refillRequestId = _G.GameStore_RefillMunition( shipItem.vid )

		if self.refillRequestId == 0 then
    		UI:ShowMsgOnRefillError( _G.GameStore.MunitionResult.MR_ERROR )
    	end

	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:SetQuestShipInternal( vid, dstSlotIdx, bSwap )

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: not in quest mode" )
		return		
	end

	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: the quest is taken; cannot move ships" )
		return
	end

	if type( vid ) ~= "userdata" then
		sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: invalid type of the 1-st parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	if type( dstSlotIdx ) ~= "number" then
		sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: invalid type of the 2-nd parameter (\"dstSlotIdx\"); \"number\" expected, got \"%s\"", type( dstSlotIdx ) )
		return
	end

	if bSwap ~= nil then
    	if type( bSwap ) ~= "boolean" then
    		sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: invalid type of the 3-rd parameter (\"bSwap\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSwap ) )
    	end
	end

	if bSwap == nil then
		bSwap = false
	end

	local shipItem = nil

	if vid ~= UI.INVALID_U64_ID then

		shipItem = UI:GetShipItem( vid, true )
		if not shipItem then
			sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: cannot find ship item for vid %s", _G.U64ToStr( vid ) )
			return
		end

		if UI:IsShipInBattle( shipItem ) then
			sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: cannot assign ship to quest; ship is in battle" )
			return
		end

		if UI:IsShipInMatchmaking( shipItem ) then
			sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: cannot assign ship to quest; ship is in matchmaking queue" )
			return
		end

		if UI:IsShipOnShipQuest( shipItem ) then
			sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: cannot assign ship to quest; ship is already on quest" )
			return
		end
		
		if UI:IsShipDisabledByTime( shipItem.defName ) then
			sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: cannot assign ship to quest; ship %s is disabled at current time", shipItem.defName )
			return
		end

	end

	if dstSlotIdx < 1 or dstSlotIdx > #self.questShips then
		sys.log( "UI.ShipsTreeWnd:SetQuestShipInternal()[ERROR]: invalid slot %d", dstSlotIdx )
		return
	end

    -- предыдущий корабль в слоте, куда ставим
	local dstVid = self.questShips[ dstSlotIdx ]

	-- изменений не требуется
    if vid == dstVid then
		return
	end

	-- слот, из которого вынули
	local srcSlotIdx = -1

	if vid ~= UI.INVALID_U64_ID then

		for slotIdx, shipVid in pairs( self.questShips ) do
			if shipVid == vid then
				srcSlotIdx = slotIdx
				break
			end
		end

	end

	-- апдейт слота назначения
	self.questShips[ dstSlotIdx ] = vid

	-- апдейт слота, из которого вынули
	if srcSlotIdx ~= -1 then
		self.questShips[ srcSlotIdx ] = bSwap and dstVid or UI.INVALID_U64_ID
	end

	self:OnQuestShipsChanged()

end


--
function UI.ShipsTreeWnd:ValidateShipQuest()

	if self.shipQuestId == -1 then
		return
	end

	if UI:IsShipQuestAvailable( self.shipQuestId ) then
		return
	end

	sys.log( "UI.ShipsTreeWnd:ValidateShipQuest()[ERROR]: quest %d is no more available", self.shipQuestId )
	self:SetShipQuest( -1 )

end


--
function UI.ShipsTreeWnd:TryStartShipQuest()

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:TryStartShipQuest()[ERROR]: still waiting for another request" )
		return
	end

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:TryStartShipQuest(): not in quest mode" )
		return
	end

	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:TryStartShipQuest(): quest is already taken" )		
		return
	end

	local bHasShips = false
	for slotIdx, vid in pairs( self.questShips ) do
		if vid ~= UI.INVALID_U64_ID then
			bHasShips = true
			break
		end
	end

	if not bHasShips then
		sys.log( "UI.ShipsTreeWnd:TryStartShipQuest(): no ships" )		
		return
	end

	local brokenVids = {}

	for slotIdx, vid in pairs( self.questShips ) do

		if vid ~= UI.INVALID_U64_ID then

    		local hp = _G.GameStore_GetVesselHullCondition( vid )

    		if hp == 0 then
    			table.insert( brokenVids, vid )
    		end

		end

	end

	if next( brokenVids ) then

		self.startShipQuestData =
		{
			questId	= self.shipQuestId,
			vids	= self.questShips,
		}

		self:LaunchBuyWnd( UI.BuyWnd.modes.SHIPS_REPAIR, { vids = brokenVids } )

	else
		self:DoStartShipQuest( self.shipQuestId, self.questShips )
	end

end


--
function UI.ShipsTreeWnd:DoStartShipQuest( questId, vids )
	
	self.startShipQuestRequestId = _G.MasterServer_StartShipQuest( questId, vids )

	if self.startShipQuestRequestId == 0 then
		self:ShowMsgOnStartShipQuestError( _G.MasterServer.ShipQuestOpResult.SQOR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:Close()

	local bHandled = false
	
	local launchData = self.launchData	-- после вызова UI.HangarWnd:TrySetMenuTab это поле обнулится

	if launchData then

		if launchData.bItemCraftSingle then

			UI.HangarWnd:ShowItemCraftSingle( launchData.itemDefName, launchData.bEnchanted, launchData.itemCraftLaunchData, true, launchData.dataToRestore )
			bHandled = true

		elseif launchData.bItemCraftMulti then

			UI.HangarWnd:ShowItemCraftMulti( launchData.itemCraftLaunchData, launchData.dataToRestore )
			bHandled = true

		elseif launchData.bAtlas then

			if type( launchData.uid ) == "userdata" then
				UI:ShowProfile( launchData.uid, "ATLAS", true, launchData.restoreData, launchData.profileLaunchData )
				bHandled = true
			else
				sys.log( "UI.ShipsTreeWnd:Close()[ERROR]: invalid type of launchData.uid for bAtlas data mode; \"userdata\" expected, got \"%s\"", type( launchData.uid ) )
			end

		elseif launchData.bGameplayPveMap then

			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.FREE_SPACE_MAP, true, false )
			bHandled = true

			if type( launchData.mode ) == "number" then
				if UI.GameplayPveMapWnd:GetMode() ~= launchData.mode then
					UI.GameplayPveMapWnd:SetMode( launchData.mode )
				end
			else
				sys.log( "UI.ShipsTreeWnd:Close()[ERROR]: invalid type of launchData.mode for bGameplayPveMap data mode; \"number\" expected, got \"%s\"", type( launchData.mode ) )
			end

			if launchData.questId ~= nil then
				if type( launchData.questId ) == "number" then
					if type( launchData.questType ) == "number" then
						UI.GameplayPveMapWnd:ShowQuest( launchData.questId, launchData.questType )
					else
						sys.log( "UI.ShipsTreeWnd:Close()[ERROR]: invalid type of launchData.questType for bGameplayPveMap data mode; \"number\" expected, got \"%s\"", type( launchData.questType ) )
					end
				else
					sys.log( "UI.ShipsTreeWnd:Close()[ERROR]: invalid type of launchData.questId for bGameplayPveMap data mode; \"number\" or \"nil\" expected, got \"%s\"", type( launchData.questId ) )
				end
			end
			
		elseif launchData.bEquipment then
		
			if launchData.bPreview then
				UI.HangarWnd:ShowEquipmentPreview( launchData.vid, nil, launchData.previewLaunchData )
			else
				UI.HangarWnd:ShowShipEquipment( launchData.vid )
			end
			
			UI.EquipmentWnd:SelectShipSlotByInfo( launchData.selInfo )
			
			bHandled = true
			
		elseif launchData.bActions then
		
			UI.HangarWnd:OpenAction( launchData.selActionId, true, launchData.marketingLaunchData )
			bHandled = true
			
		else
		
			if launchData.questId ~= nil then
			
				UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
				bHandled = true
				
				if type( launchData.questId ) == "number" then
					if type( launchData.questType ) == "number" then
						UI.HangarWnd:ShowQuest( launchData.questId, launchData.questType )
					else
						sys.log( "UI.ShipsTreeWnd:Close()[ERROR]: invalid type of launchData.questType; \"number\" expected, got \"%s\"", type( launchData.questType ) )
					end
				else
					sys.log( "UI.ShipsTreeWnd:Close()[ERROR]: invalid type of launchData.questId; \"number\" or \"nil\" expected, got \"%s\"", type( launchData.questId ) )
				end
				
			end

		end

		self.launchData = nil

	end

	if not bHandled then
		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, true, false )
	end

end


--
function UI.ShipsTreeWnd:UpdateShipQuestRecommendedRoles()

	self.shipQuestRecommendedRoles = {}

	if self.shipQuestId == -1 then
		return
	end

	local roles = UI:GetShipQuestRecommendedRoles( self.shipQuestId )
	
	for idx, role in pairs( roles ) do
		self.shipQuestRecommendedRoles[ role ] = true
	end

end


--
function UI.ShipsTreeWnd:ValidateQuestShips()

	local bChanged = false

	for slotIdx, vid in pairs( self.questShips ) do
		if self:ValidateQuestShipInternal( slotIdx ) then
			bChanged = true
		end
	end

	if bChanged then
		self:OnQuestShipsChanged()
	end

end


--
function UI.ShipsTreeWnd:ValidateQuestShip( vid )

	local slotIdx = -1

	for questSlotIdx, questVid in pairs( self.questShips ) do
		if questVid == vid then
			slotIdx = questSlotIdx
			break
		end
	end

	if slotIdx ~= -1 then
    	if self:ValidateQuestShipInternal( slotIdx ) then
			self:OnQuestShipsChanged()
		end
	end

end


--
function UI.ShipsTreeWnd:ValidateQuestShipInternal( slotIdx )

	local bChanged = false

	local vid = self.questShips[ slotIdx ]

	if vid ~= UI.INVALID_U64_ID then

		local shipItem = UI:GetShipItem( vid, false )

		local bFit = shipItem and not UI:IsShipInBattle( shipItem ) and UI:GetShipBattleSlot( shipItem ) == -1

		if not bFit then
			self.questShips[ slotIdx ] = UI.INVALID_U64_ID
			bChanged = true
		end

	end

	return bChanged

end


--
function UI.ShipsTreeWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	-- делается здесь, а не в эвентах от мыши, т.к. при драг-энд-дропе они не приходят (поглощаются перетаскиваемым элементом)
	self:UpdatePanelAutoState()

end


--
function UI.ShipsTreeWnd:UpdatePanelAutoState()

	local panelWnd = nil

	if not UI.ShipsTree_AlienEditWnd:IsChildOf( self ) and not UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then

    	if self.shipQuestId == -1 then
    		panelWnd = UI.ShipsTree_BattleSlotsPanelWnd
    	else
    		panelWnd = UI.ShipsTree_QuestPanelWnd
    	end

	end

	if panelWnd then

    	-- скрыть?
    	if panelWnd:IsChildOf( self ) then

    		if not self:GetPanelFixedState() then

    			if not UI.ShipDDWnd:IsOnScreen() then

        			local mouseX = self:XToWindow( UI:GetMouseX() )
        			local mouseY = self:YToWindow( UI:GetMouseY() )

    				if not UI:IsPtInRect( panelWnd:GetRect(), mouseX, mouseY ) and not UI:IsPtInRect( UI.ShipsTree_PanelHeaderWnd:GetRect(), mouseX, mouseY ) then
                		self:SetPanelVisibility( false, true )
    				end

    			end

    		end				

    	-- открыть?
    	else
    		if UI.ShipDDWnd:IsOnScreen() then
    			self:SetPanelVisibility( true, true )
    		end
    	end

	end

end


--
function UI.ShipsTreeWnd:OnQuestShipsChanged()

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		UI.ShipsTree_TreeWnd:OnShipQuestStateChanged()
	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialTreeWnd:OnShipQuestStateChanged()
	end

	if UI.ShipsTree_PanelHeaderWnd:IsChildOf( self ) then
		UI.ShipsTree_PanelHeaderWnd:OnQuestSlotsChanged()
	end

	if UI.ShipsTree_QuestPanelWnd:IsChildOf( self ) then
		UI.ShipsTree_QuestPanelWnd:OnShipsChanged()
	end

end


--
function UI.ShipsTreeWnd:SelectQuestSlot( slotIdx, bSound )

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:SelectQuestSlot()[ERROR]: not in quest mode" )
		return
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.ShipsTreeWnd:SelectQuestSlot()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	if slotIdx == self.selQuestSlotIdx then
		return
	end

	if slotIdx ~= -1 and ( slotIdx < 1 or slotIdx > #self.questShips ) then
		sys.log( "UI.ShipsTreeWnd:SelectQuestSlot()[ERROR]: invalid slotIdx %d", slotIdx  )
		return
	end

	if bSound ~= nil then
		if type( bSound ) ~= "boolean" then
			sys.log( "UI.ShipsTreeWnd:SelectQuestSlot()[ERROR]: invalid type of the 2-nd parameter (\"bSound\"); \"boolean\" expected, got \"%s\"", type( bSound ) )
			bSound = nil
		end
	end

	if bSound == nil then
		bSound = false
	end

	self.selQuestSlotIdx = slotIdx

	if bSound and self.selQuestSlotIdx ~= -1 then
		UI:PlayGlobalSound( self.sounds.questSlotSelect )
	end

	UI.ShipsTree_QuestPanelWnd:OnSelQuestSlotChanged()

end


--
function UI.ShipsTreeWnd:AssignQuestAutoShips()

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:AssignQuestAutoShips()[ERROR]: not in quest mode" )
		return
	end

	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:AssignQuestAutoShips()[ERROR]: cannot assign ships; the quest is taken" )
		return
	end

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:AssignQuestAutoShips()[ERROR]: is still waiting for another request" )
		return
	end	

	local autoShips = self:GetQuestAutoShips()
	if not next( autoShips ) then
		sys.log( "UI.ShipsTreeWnd:AssignQuestAutoShips()[ERROR]: no available auto autoShips" )
		return
	end

	self:ClearQuestShips()

	for shipIdx, vid in pairs( autoShips ) do

		local battleSlotIdx = UI:GetShipBattleSlotByVid( vid )
		if battleSlotIdx ~= -1 then

    		local requestId = _G.GameStore_ChangeBattleSlotVessel( battleSlotIdx - 1, UI.INVALID_U64_ID )

        	if requestId ~= 0 then
				self.changeBattleSlotVesselBeforeAutoRequests[ requestId ] = true
			else
        		UI:ShowMsgOnChangeBatleSlotVesselError( _G.GameStore.ChangeBSResult.CBSR_ERROR )
				self.changeBattleSlotVesselBeforeAutoRequests = {}
			end

			self:UpdateWaitingEffect()

		end

	end

	if next( self.changeBattleSlotVesselBeforeAutoRequests ) then
		self.autoShipsToAssign = autoShips
	else
		self:AssignQuestAutoShips2( autoShips )		
	end

end


--
function UI.ShipsTreeWnd:AssignQuestAutoShips2( autoShips )

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:AssignQuestAutoShips2()[ERROR]: not in quest mode" )
		return
	end

	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:AssignQuestAutoShips()2[ERROR]: cannot assign ships; the quest is taken" )
		return
	end

	local numSlots = #self.questShips

	for slotIdx, vid in pairs( autoShips ) do

		if slotIdx <= numSlots then
			self.questShips[ slotIdx ] = vid
		else
			sys.log( "UI.ShipsTreeWnd:AssignQuestAutoShips2()[ERROR]: invalid slot" )
		end

	end

	self:OnQuestShipsChanged()

end


--
function UI.ShipsTreeWnd:ClearQuestShips()

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:ClearQuestShips()[ERROR]: not in quest mode" )
		return
	end

	if UI:IsShipQuestTaken( self.shipQuestId ) then
		sys.log( "UI.ShipsTreeWnd:ClearQuestShips()[ERROR]: cannot clear ships; the quest is taken" )
		return
	end

	self.questShips = {}

	for slotIdx = 1, UI:GetShipQuestMaxShips( self.shipQuestId ) do
		table.insert( self.questShips, UI.INVALID_U64_ID )
	end

	self:OnQuestShipsChanged()

end


--
function UI.ShipsTreeWnd:GetShipQuestSlot( vid )

	local slotIdx = -1

	if self.shipQuestId == -1 then
		sys.log( "UI.ShipsTreeWnd:GetShipQuestSlot()[ERROR]: not in quest mode" )
		return slotIdx
	end

	for questSlotIdx, questVid in pairs( self.questShips ) do
		if questVid == vid then
			slotIdx = questSlotIdx
			break
		end
	end

	return slotIdx

end


--
function UI.ShipsTreeWnd:OnResourcesChanged()

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		UI.ShipsTree_TreeWnd:OnResourcesChanged()
	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialTreeWnd:OnResourcesChanged()
	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienEditWnd:OnResourcesChanged()
	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialEditWnd:OnResourcesChanged()
	end

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then

		local shipDefName = UI.BuyBundleWnd:GetData().shipDefName

		if UI:IsShipBuildableFromShipParts( shipDefName ) and UI:IsEnoughShipPartsForShip( shipDefName ) then
			UI.BuyBundleWnd:Hide()
		end		

	end

end


--
function UI.ShipsTreeWnd:LaunchBuyBundleWnd( bundleDefName, data )

	UI.BuyBundleWnd:Setup( bundleDefName, data, self:GetScriptTableName(), false )
	UI.BuyBundleWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipsTreeWnd:OnQuestsChanged()

	if UI.ShipsTree_TreeWnd:IsChildOf( self ) then
		UI.ShipsTree_TreeWnd:OnQuestsChanged()

	elseif UI.ShipsTree_SpecialTreeWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialTreeWnd:OnQuestsChanged()

	elseif UI.ShipsTree_AlienEditWnd:IsChildOf( self ) then
		UI.ShipsTree_AlienEditWnd:OnQuestsChanged()

	elseif UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		UI.ShipsTree_SpecialEditWnd:OnQuestsChanged()
	end

end


--
function UI.ShipsTreeWnd:LaunchQuestInfoWndForResourceQuest( shipDefName )

	local questId = UI:GetResourceQuestForShip( shipDefName )
	if questId == -1 then
		sys.log( "UI.ShipsTreeWnd:LaunchQuestInfoWndForResourceQuest()[ERROR]: cannot find ship parts quest for ship %s", tostring( shipDefName ) )
		return
	end

	UI.HangarWnd:LaunchQuestWnd( questId, UI.questTypes.REGULAR, true )

end


--
function UI.ShipsTreeWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if boxHandle == self.hMsgGoldRefill then

		self.hMsgGoldRefill = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			UI:PlayGlobalSound( UI.HangarWnd.sounds.btnClick )
			self:DoRefillAndRepairShip( self.shipItemForMaintenance )
		end

		self.shipItemForMaintenance = nil

	elseif boxHandle == self.hMsgActivateAlienNodes then

		self.hMsgActivateAlienNodes = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if self.activateAlienNodesData then
				self:DoActivateChosenAlienNodes( self.activateAlienNodesData.vid, self.activateAlienNodesData.nodesMask )
			else
				sys.log( "UI.ShipsTreeWnd:F_OnEventMsgBoxRet()[ERROR]: no data for activation stored" )
			end

			UI:PlayGlobalSound( UI.HangarWnd.sounds.btnClick )
		end

		self.activateAlienNodesData = nil

	elseif boxHandle == self.hMsgAdvertLink then

		self.hMsgAdvertLink = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if self.advertLinkToOpen ~= "" then
				_G.ShellExecute( self.advertLinkToOpen )
				UI:PlayGlobalSound( UI.sounds.btnClick )
			else
				sys.log( "UI.ShipsTreeWnd:F_OnEventMsgBoxRet()[ERROR]: no advert link stored" )
			end

		end

		self.advertLinkToOpen = ""

	end

end


--
function UI.ShipsTreeWnd:UpdateShipRacesStates()

	if self:IsRaceDisabled( self:GetSelRace() ) then
		self:SetDefaultSelRace()
	end

	UI.ShipsTree_RacesWnd:UpdateShipRacesStates()

end


--
function UI.ShipsTreeWnd:LaunchCraftAlienShipWnd( shipDefName )

	UI.AlienShipCraftWnd:Setup( shipDefName )
	UI.AlienShipCraftWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShipsTreeWnd:LaunchCraftSpecialShipWnd( shipDefName )

	UI.SpecialShipCraftWnd:Setup( shipDefName )
	UI.SpecialShipCraftWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShipsTreeWnd:LaunchLearnAlienShipNodeWnd( nodeName, vid, chosenNodesMask )

	UI.AlienShipNodeLearnWnd:Setup( nodeName, vid, chosenNodesMask )
	UI.AlienShipNodeLearnWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShipsTreeWnd:LaunchLearnSpecialShipNodeWnd( nodeName, vid, chosenNodesMask )

	UI.SpecialShipNodeLearnWnd:Setup( nodeName, vid, chosenNodesMask )
	UI.SpecialShipNodeLearnWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )	

end


--
function UI.ShipsTreeWnd:TryActivateChosenEvolvingNodes( shipItem, nodesMask )

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:TryActivateChosenEvolvingNodes()[ERROR]: is waiting for another request" )
		return
	end

	if shipItem == nil then
		sys.log( "UI.ShipsTreeWnd:ActivateChosenAlienNodes()[ERROR]: no shipItem" )
		return
	end

	if nodesMask == nil then
		sys.log( "UI.ShipsTreeWnd:ActivateChosenAlienNodes()[ERROR]: no choice" )
		return
	end


	local bEquipmentRemove = false

	local curRank = UI:GetShipRank( shipItem.defName )

	local shipDefNameAfterActivation = UI:CalcEvolvingShipDefNameFromNodesMask( shipItem.defName, nodesMask )
	local rankAfterActivation = UI:GetShipRank( shipDefNameAfterActivation )

	if curRank ~= rankAfterActivation then

		for slotId, iid in pairs( shipItem.equipModules ) do

			if iid ~= UI.INVALID_U64_ID then

				local itemDefName = UI:Iid2DefName( iid )

				if not UI:IsItemFitForShipByTierAndRank( itemDefName, shipDefNameAfterActivation ) then
					bEquipmentRemove = true
					break
				end				

			end 

		end

		if not bEquipmentRemove then

			for slotId, ammoInfo in pairs( shipItem.equipAmmo ) do

				if ammoInfo.def ~= "" and ammoInfo.amount > 0 then

    				if not UI:IsItemFitForShipByTierAndRank( ammoInfo.def, shipDefNameAfterActivation ) then
    					bEquipmentRemove = true
    					break
    				end

				end

			end

		end

	end		


	if bEquipmentRemove then

		self.activateAlienNodesData =
		{
			vid			= shipItem.vid,
			nodesMask	= nodesMask,
		}

		self.hMsgActivateAlienNodes = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "shipsTree_msg_equipmentRemove" ), UI.MBS_YES_NO )

	else
		self:DoActivateChosenAlienNodes( shipItem.vid, nodesMask )
	end	

end


--
function UI.ShipsTreeWnd:DoActivateChosenAlienNodes( vid, nodesMask )

	if self:IsWaiting() then
		sys.log( "UI.ShipsTreeWnd:DoActivateChosenAlienNodes()[ERROR]: is waiting for another request" )
		return
	end

	if type( vid ) ~= "userdata" or vid == UI.INVALID_U64_ID or type( nodesMask ) ~= "userdata" then
		sys.log( "UI.ShipsTreeWnd:DoActivateChosenAlienNodes()[ERROR]: invalid params" )
		return
	end

	self.activateAlienNodesRequestId = _G.GameStore_VesselActivateNode( vid, nodesMask )

	if self.activateAlienNodesRequestId == 0 then
		self:ShowMsgOnAlienNodesActivateError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTreeWnd:ShowMsgOnAlienNodesActivateError( result )

	UI:ShowErrorMsg( "msg_activateAlienShipNodesError", result, "_G.GameStore.StoreBuyResult" )

end


--
function UI.ShipsTreeWnd:UpdateBg()

	local race = self:GetSelRace()

	local anim = race == ai.Race.CRYSTAL and self.effectInfo.bg.animAlien or self.effectInfo.bg.animRegular

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if bgEffect then
		bgEffect:StartAnimation( anim )
	end

	self:UpdateBgAnimationTime()

end


--
function UI.ShipsTreeWnd:UpdateBgAnimationTime()

	local animTime = 0

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		animTime = mainEffect:GetAnimationTime()
	end

	local bgEffect = UI:GetEffectFromLayer( self, self.layers.BG_EFFECT )
	if bgEffect then

		if bgEffect:GetCurAnimation() ~= "" then
			bgEffect:SetAnimationTimeAndUpdate( animTime )
		end

	end

end


--
function UI.ShipsTreeWnd:UpdateCaption()

	local str = ""

	if UI.ShipsTree_AlienEditWnd:IsChildOf( self ) or UI.ShipsTree_SpecialEditWnd:IsChildOf( self ) then
		str = UI:GetStringByName( "ships_caption_editShip" )
	else
		str = UI:GetStringByName( "ships_caption" )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ShipsTreeWnd:LaunchBuyShipWnd( shipDefName )

	UI.HangarWnd:ShowShipBuyWnd( shipDefName, { bShipsTree = true, shipsTreeLaunchData = self.launchData }, true )

end


-- ------------------------------------------------------------
-- UI.ShipsTree_RacesWnd
-- ------------------------------------------------------------

UI.ShipsTree_RacesWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RacesWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipsTree_RacesWnd",
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
				defName 			= "shipsTree_races",
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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_RacesWnd:Update()

	self:Clear()

	local races = UI:GetRaces()

	for idx, race in ipairs( races ) do
	
		local bDisabled, requiredRank = UI.ShipsTreeWnd:GetRaceDisabledState( race )

		local data =
		{
			race			= race,
			bDisabled		= bDisabled,
			requiredRank	= requiredRank,
		}

		self:AddRecord( data )

	end

	self:RecalcLayout()

end


--
function UI.ShipsTree_RacesWnd:Reset()

	self:Clear()

end


--
function UI.ShipsTree_RacesWnd:SelectRace( race )

	local selRecordIdx = -1
	local bCanSelect = true

	if race ~= -1 then

		local bFound = false

    	for recordIdx = 1, self:GetNumRecords() do

    		local data = self:GetRecordData( recordIdx )
    		if data.race == race then

				bFound = true

				if not data.bDisabled then
        			selRecordIdx = recordIdx
				else
					sys.log( "UI.ShipsTree_RacesWnd:SelectRace()[ERROR]: race %d is disabled", race )
					bCanSelect = false
				end

    			break

    		end

    	end

		if not bFound then
			sys.log( "UI.ShipsTree_RacesWnd:SelectRace()[ERROR]: cannot find slot for race %d", race )
			bCanSelect = false
		end

	end

	if bCanSelect then
		self:SelectRecord( selRecordIdx )
	end

end


--
function UI.ShipsTree_RacesWnd:GetSelRace()

	local selRace = -1

	local selRecordIdx = self:GetSelectedRecord()
	if selRecordIdx ~= -1 then

		local data = self:GetRecordData( selRecordIdx )
		selRace = data.race

	end

	return selRace

end


--
function UI.ShipsTree_RacesWnd:UpdateShipRacesStates()

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		local bDisabled, requiredRank = UI.ShipsTreeWnd:GetRaceDisabledState( data.race )

		if data.bDisabled ~= bDisabled or data.requiredRank ~= requiredRank then
		
			data.bDisabled		= bDisabled
			data.requiredRank	= requiredRank
			
			self:SetRecordData( data, recordIdx )

		end

	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_RacesWnd.btnPrototypeName	= "ShipsTree_RaceSlotWnd"
UI.ShipsTree_RacesWnd.MAX_SLOTS			= 5
UI.ShipsTree_RacesWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.ShipsTree_RacesWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "race_btn_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_RacesWnd:RecalcLayout()

	local selfWidth = 0

	local minVisibleRecordIdx, maxVisibleRecordIdx = self:GetVisibleRange()

	local lastVisibleSlot = minVisibleRecordIdx ~= -1 and self:GetButtonForSlot( maxVisibleRecordIdx )
	if lastVisibleSlot then
		selfWidth = lastVisibleSlot:GetLeft() + lastVisibleSlot:GetWidth()
	end

	self:SetWidth( selfWidth )

end


-- ------------------------------------------------------------
-- UI.ShipsTree_RaceSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_RaceSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RaceSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipsTree_RaceSlotWnd",
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
				defName 			= "shipsTree_raceSlot",
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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_RaceSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.tooltipData = nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetMouseOver( false )

end


--
function UI.ShipsTree_RaceSlotWnd:Select( bSelect, bAnimated )

	if bSelect and self:IsDisabled() then
		sys.log( "UI.ShipsTree_RaceSlotWnd:SetMouseOver()[ERROR]: attempt to select while disabled" )
	end

	self:UpdateMainAnimation()
	self:UpdateMouseOver()

end


--
function UI.ShipsTree_RaceSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_RaceSlotWnd:GetRace()

	local data = self:GetRecordData()
	return data and data.race or -1

end


--
function UI.ShipsTree_RaceSlotWnd:IsDisabled()

	local data = self:GetRecordData()
	return data ~= nil and data.bDisabled

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_RaceSlotWnd.effectInfo =
{
	main =
	{
		animIdle		= "idle",
		animSel			= "select",
		animMouseOver	= "over",
		animDisabled	= "disable",
		icoSpriteName	= "race_ico8",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_RaceSlotWnd.tooltipData	= nil
UI.ShipsTree_RaceSlotWnd.bMouseOver		= false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_RaceSlotWnd:UpdateForData( data, bAnimated )

	self:UpdateIco( data )
	self:UpdateTooltip( data )
	self:UpdateMainAnimation()
	self:UpdateMouseOver()

end


--
function UI.ShipsTree_RaceSlotWnd:UpdateMainAnimation()

	local anim = ""

	if self:IsDisabled() then
		anim = self.effectInfo.main.animDisabled

	elseif self:IsSelected() then
		anim = self.effectInfo.main.animSel

	elseif self.bMouseOver then
		anim = self.effectInfo.main.animMouseOver

	else
		anim = self.effectInfo.main.animIdle
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.ShipsTree_RaceSlotWnd:UpdateIco( data )

	local hTex = UI:GetRaceIcoBigColored( data.race )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )
	end

end


--
function UI.ShipsTree_RaceSlotWnd:UpdateTooltip( data )

	local raceName = UI:Val2Key( ai.Race, data.race )
	
	local textId = string.format( "shipsTree_raceTooltip_%s", raceName )
	local text = UI:GetStringByName( textId )
	
	if data and data.bDisabled and data.requiredRank and data.requiredRank ~= -1 then
	
		local strRequiredRank = UI:GetStringByName( "shipsTree_accountRankRequired" )
		local strRankVal = tostring( data.requiredRank )
		
		local numSubst = 0
		strRequiredRank, numSubst = string.gsub( strRequiredRank, "%$rank%$", strRankVal )
		
		if numSubst == 0 then
			sys.log( "UI.ShipsTree_RaceSlotWnd:UpdateTooltip()[ERROR]: cannot find placeholder \"$rank$\" in string \"shipsTree_accountRankRequired\"" )
			strRequiredRank = string.format( "[INVALID STRING] Required rank: %s", strRankVal )
		end
		
		strRequiredRank = string.format( "%s%s%s", UI:Color2Str( UI.RED_COLOR ), strRequiredRank, UI:Color2Str( UI.TooltipWnd_shared:GetTextColor() ) )
		
		text = string.format( "%s||%s", text, strRequiredRank )
	
	end

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:Race2Str( data.race ),
		text		= text,
	}

end


--
function UI.ShipsTree_RaceSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if not self:IsSelected() and not self:IsDisabled() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipsTree_RaceSlotWnd:SetMouseOver( bMouseOver )

	if bMouseOver and self:IsDisabled() then
		sys.log( "UI.ShipsTree_RaceSlotWnd:SetMouseOver()[ERROR]: attempt to set mouse over while disabled" )
	end

	local bWasMouseOver = self.bMouseOver
	self.bMouseOver = bMouseOver

	self:UpdateMainAnimation()

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipsTreeWnd.sounds.raceSlotMouseOver )
	end

end


--
function UI.ShipsTree_RaceSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ShipsTree_RaceSlotWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ShipsTree_RaceSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- ------------------------------------------------------------
-- UI.ShipsTree_RolesWnd
-- ------------------------------------------------------------

UI.ShipsTree_RolesWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RolesWnd.def =
{
	className		= "Wnd",

	props =
	{
		name	= "ShipsTree_RolesWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipsTree_roles",
				defaultAnimation	= "idle",
			}}
		},

		-- PREMIUM_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_roles_premiumBg",
				defaultAnimation	= "idle",
			}}
		},
	},

	children = { "UI.ShipsTree_RoleSlotWnd_premium" }
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_RolesWnd:Reset()

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		if slotWnd.Reset then
			slotWnd:Reset()
		end

		slotWnd:UnlinkFromParent()

	end

	self.curSlots = {}

end


--
function UI.ShipsTree_RolesWnd:FullUpdate()

	self:Reset()

	if UI.ShipsTreeWnd:GetSelRace() == -1 then
		return
	end

	local roles	= UI.ShipsTreeWnd:GetRolesSorted()
	local ships	= UI.ShipsTreeWnd:GetShips()
	
	local shipsByRolePresent = {}
	
	for defName, shipData in pairs( ships ) do

		if not UI.ShipsTreeWnd:IsShipPremiumColumn( defName ) then

			local role = UI:GetItemRole( defName )
			shipsByRolePresent[ role ] = true

		end

	end

	for roleIdx, role in ipairs( roles ) do

		if role == UI.ShipsTreeWnd.PREMIUM_ROLE then

			table.insert( self.curSlots, self.premiumSlot )
			self:AddChild( self.premiumSlot )	

		else
		
    		local slotWnd = nil

    		if shipsByRolePresent[ role ] then
    			slotWnd = self:ObtainFreeActiveSlot()
    		else
    			slotWnd = self:ObtainFreeInactiveSlot()
    		end

    		slotWnd:Setup( role )

		end

	end

	self:RecalcLayout()

end


--
function UI.ShipsTree_RolesWnd:GetColCenterX( role, roleColIdx )

	local centerX = 0

	if role == UI.ShipsTreeWnd.PREMIUM_ROLE then

		centerX = self.premiumSlot:GetColCenterX( roleColIdx )
		centerX = centerX + self.premiumSlot:GetLeft()

	else

		if not( roleColIdx == nil or roleColIdx == 1 ) then
			sys.log( "UI.ShipsTree_RolesWnd:GetColCenterX()[ERROR]: invalid roleColIdx %s for role %d", tostring( roleColIdx ), role )
		end

    	local slotWnd = self:GetSlotForRole( role )
    	if slotWnd then

    		local slotRect = slotWnd:GetRect()
    		centerX = slotRect.x + slotRect.z * 0.5

    	else
    		sys.log( "UI.ShipsTree_RolesWnd:GetColCenterX()[ERROR]: cannot find slot for role %d", role )
    	end

	end

	return centerX

end


--
function UI.ShipsTree_RolesWnd:OnShipsTreePanelChanged()

	self:RecalcLayout()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_RolesWnd.layers =
{
	MAIN_EFFECT			= 0,
	PREMIUM_BG_EFFECT	= 1,
}

UI.ShipsTree_RolesWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "role_",
		premBgLocator		= "premium_b",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_RolesWnd.allActiveSlots	= {}
UI.ShipsTree_RolesWnd.allInactiveSlots	= {}
UI.ShipsTree_RolesWnd.premiumSlot		= nil
UI.ShipsTree_RolesWnd.curSlots			= {}
UI.ShipsTree_RolesWnd.space_slots		= 0
UI.ShipsTree_RolesWnd.slotsY			= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_RolesWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitControls()
	self:PrepareLayout()

	self:Reset()

end


--
function UI.ShipsTree_RolesWnd:InitControls()

	for idx = 1, 5 do
		self:CreateActiveSlot()		
	end

	for idx = 1, 3 do
		self:CreateInactiveSlot()
	end

	self.premiumSlot = UI.ShipsTree_RoleSlotWnd_premium

end


--
function UI.ShipsTree_RolesWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local premBgEffect = UI:GetEffectFromLayer( self, self.layers.PREMIUM_BG_EFFECT )
	local firstLostWnd = self.allActiveSlots[ 1 ]

	local firstSlotPos		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos		= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local firstSlotWidth	= firstLostWnd and firstLostWnd:GetWidth() or 0
	local premBgPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.premBgLocator ) or Vec2( 0, 0 )

	self.space_slots		= secondSlotPos.x - ( firstSlotPos.x + firstSlotWidth )
	self.slotsY				= firstSlotPos.y

	self.premiumSlot:SetTop( firstSlotPos.y )

	if premBgEffect then
		premBgEffect:SetPos( UI:Vec2( 0, premBgPos.y ) )
	end

end


--
function UI.ShipsTree_RolesWnd:RecalcLayout()

	-- позиции слотов

	local slotX = 0

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		slotWnd:SetLeft( UI:XRel2Snapped( slotX ) )
		slotX = slotX + slotWnd:GetWidth() + self.space_slots

	end

	local lastSlotWnd = nil
	if next( self.curSlots ) then
		lastSlotWnd = self.curSlots[ #self.curSlots ]
	end


	-- фон для премиума - позиция и высота

	local premBgEffect = UI:GetEffectFromLayer( self, self.layers.PREMIUM_BG_EFFECT )

	local premBgPos = premBgEffect and premBgEffect:GetPos() or Vec2( 0, 0 )
	premBgPos.x = self.premiumSlot:GetLeft()

	if premBgEffect then
		premBgEffect:SetPos( premBgPos )
	end	

	local premBgBtm = UI.ShipsTreeWnd:GetPanelTop() - self:GetTop()
	local premBgHeight = premBgBtm - premBgPos.y

	local premBgMaxHeight	= premBgEffect and premBgEffect:GetObjSize( "self" ).y or 0
	local premBgMinHeight	= 0

	premBgHeight = UI:Clamp( premBgHeight, premBgMinHeight, premBgMaxHeight )
	local premBgAnimTime = ( premBgHeight - premBgMinHeight ) / ( premBgMaxHeight - premBgMinHeight )

	if premBgEffect then
		premBgEffect:SetAnimationTimeAndUpdate( premBgAnimTime )
	end


	-- собственный размер

	local selfWidth = lastSlotWnd and ( lastSlotWnd:GetLeft() + lastSlotWnd:GetWidth() ) or 0
	self:SetWidth( selfWidth )

	local selfHeight = premBgBtm
	self:SetHeight( selfHeight )

end


--
function UI.ShipsTree_RolesWnd:ObtainFreeActiveSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allActiveSlots ) do 
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateActiveSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	freeSlotWnd:SetTop( self.slotsY )

	return freeSlotWnd

end


--
function UI.ShipsTree_RolesWnd:CreateActiveSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_RoleSlotWnd_active, tostring( #self.allActiveSlots + 1 ) )
	table.insert( self.allActiveSlots, slotWnd )

	return slotWnd

end


--
function UI.ShipsTree_RolesWnd:ObtainFreeInactiveSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allInactiveSlots ) do 
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateInactiveSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	freeSlotWnd:SetTop( self.slotsY )

	return freeSlotWnd

end


--
function UI.ShipsTree_RolesWnd:CreateInactiveSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_RoleSlotWnd_inactive, tostring( #self.allInactiveSlots + 1 ) )
	table.insert( self.allInactiveSlots, slotWnd )

	return slotWnd

end


--
function UI.ShipsTree_RolesWnd:GetSlotForRole( role )

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		if slotWnd.GetRole ~= nil and slotWnd:GetRole() == role then
			return slotWnd
		end

	end

	return nil

end


-- ------------------------------------------------------------
-- UI.ShipsTree_RoleSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_RoleSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd.def =
{
	className		= "Wnd",

	props =
	{
		name		= "ShipsTree_RoleSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.ShipsTree_RoleSlotWnd:Setup( role )

	self:Reset()

	self.role = role
	self:FullUpdate()

end


--
function UI.ShipsTree_RoleSlotWnd:Reset()

	self.role = -1

	self.icoWnd:Reset()

end


--
function UI.ShipsTree_RoleSlotWnd:GetRole()

	return self.role

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
}

UI.ShipsTree_RoleSlotWnd.effectInfo =
{
	main  =
	{
		icoLocator	= "role_ico",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd.role	= -1
UI.ShipsTree_RoleSlotWnd.icoWnd	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_RoleSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.ShipsTree_RoleSlotWnd:CreateControls()

	self.icoWnd = UI:CreateChildWnd( self, UI.ShipsTree_RoleIcoWnd, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.icoWnd, mainEffect, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR )

end


--
function UI.ShipsTree_RoleSlotWnd:FullUpdate()

	self:UpdateIco()

end


--
function UI.ShipsTree_RoleSlotWnd:UpdateIco()

	self.icoWnd:Setup( self.role )

end

-- ------------------------------------------------------------
-- UI.ShipsTree_RoleSlotWnd_active
-- ------------------------------------------------------------

UI.ShipsTree_RoleSlotWnd_active = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd_active.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_RoleSlotWnd",	

	props =
	{
		name		= "ShipsTree_RoleSlotWnd_active",
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
				defName 			= "shipsTree_roleSlot_active",
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

-- ------------------------------------------------------------
-- UI.ShipsTree_RoleSlotWnd_inactive
-- ------------------------------------------------------------

UI.ShipsTree_RoleSlotWnd_inactive = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd_inactive.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_RoleSlotWnd",	

	props =
	{
		name		= "ShipsTree_RoleSlotWnd_inactive",
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
				defName 			= "shipsTree_roleSlot_inactive",
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

-- ------------------------------------------------------------
-- UI.ShipsTree_RoleIcoWnd
-- ------------------------------------------------------------

UI.ShipsTree_RoleIcoWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RoleIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_RoleIcoWnd",
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
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",	
						layer		= "UI.ShipsTree_RoleIcoWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_roleSlot_roleIco_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.ShipsTree_RoleIcoWnd:Setup( role )

	self:Reset()

	self.role = role
	self:FullUpdate()

end


--
function UI.ShipsTree_RoleIcoWnd:Reset( role )

	self.role			= -1
	self.tooltipData	= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.ShipsTree_RoleIcoWnd:GetRole()

	return self.role

end


--
function UI.ShipsTree_RoleIcoWnd:GetTooltipData()

	return self.tooltipData
 
end

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_RoleIcoWnd.layers =
{
	MAIN_EFFECT			= 0,
	MOUSE_OVER_EFFECT	= 1,
}

UI.ShipsTree_RoleIcoWnd.effectInfo =
{
	main =
	{
		spriteName	= "ico",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_RoleIcoWnd.role		= -1
UI.ShipsTree_RoleIcoWnd.tooltipData	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_RoleIcoWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateTooltip()

end


--
function UI.ShipsTree_RoleIcoWnd:UpdateIco()

	local hTex = UI:GetRoleIco( self.role )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, hTex )
	end

end


--
function UI.ShipsTree_RoleIcoWnd:UpdateTooltip()

	local shipClass = UI:GetShipClassByRole( self.role )
	local caption = string.format( "%s: %s", UI:ShipType2Str( shipClass ), UI:Role2Str( self.role ) )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= caption,
		text		= UI:GetRoleDesc( self.role ),
	}

end


--
function UI.ShipsTree_RoleIcoWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipsTree_RoleIcoWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )
	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

end


--
function UI.ShipsTree_RoleIcoWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ShipsTree_RoleIcoWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ShipsTree_RoleIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- ------------------------------------------------------------
-- UI.ShipsTree_RoleSlotWnd_premium
-- ------------------------------------------------------------

UI.ShipsTree_RoleSlotWnd_premium = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd_premium.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipsTree_RoleSlotWnd_premium",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipsTree_roleSlot_premium",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text9",
						layer		= "UI.ShipsTree_RoleSlotWnd_premium.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "shipsTree_premiumShips" ),
		},
	},
}

-- ---------------------------------
-- interface funtions
-- ---------------------------------

--
function UI.ShipsTree_RoleSlotWnd_premium:GetColCenterX( colIdx )

	if colIdx < 1 or colIdx > self.NUM_COLUMNS then
		sys.log( "UI.ShipsTree_RoleSlotWnd_premium:GetColCenter()[ERROR]: invalid colIdx %d", colIdx )
		return UI:ZeroVec2()
	end

	return self.colCenters[ colIdx ]

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd_premium.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.ShipsTree_RoleSlotWnd_premium.effectInfo =
{
	main =
	{
		colCenterLocatorPrefix	= "center_"
	}
}

UI.ShipsTree_RoleSlotWnd_premium.NUM_COLUMNS	= UI.ShipsTreeWnd.NUM_PREMIUM_COLUMNS

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_RoleSlotWnd_premium.colCenters	= {}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_RoleSlotWnd_premium:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	for colIdx = 1, self.NUM_COLUMNS do
		self.colCenters[ colIdx ] = mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.colCenterLocatorPrefix, colIdx ) ).x or 0
	end

end

-- ------------------------------------------------------------
-- UI.ShipsTree_TreeWnd
-- ------------------------------------------------------------

UI.ShipsTree_TreeWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.ShipsTree_TreeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_TreeWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipsTree_ships",
				defaultAnimation	= "idle",
			}}
		}
	},

	children = { "UI.ShipsTree_Tree_MaskWnd", "UI.ShipsTree_Tree_ScrollBarWnd" }
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_TreeWnd:Reset()

	self.listWnd:Reset()
	self.linksWnd:Reset()

	self:ResetScrollBar()

end


--
function UI.ShipsTree_TreeWnd:FullUpdate()

	self:Reset()

	if UI.ShipsTreeWnd:GetSelRace() == -1 then
		return
	end

	self.listWnd:FullUpdate()
	self.linksWnd:FullUpdate()	-- это вызов должен быть обязательно после self.listWnd:FullUpdate(), т.к. используются его данные

	self:RecalcLayout()

	self:ValidateScrollPos()

end


--
function UI.ShipsTree_TreeWnd:CenterOnShip( defName )

	if not self.scrollBar:IsChildOf( self ) then
		return
	end

	local shipSlotWnd = self:GetShipSlot( defName )
	if not shipSlotWnd then
		sys.log( "UI.ShipsTree_TreeWnd:CenterOnShip()[ERROR]: cannot find slot for ship \"%s\"", defName )
		return
	end

	local slotCenterY	= self.listWnd:YToWindow( shipSlotWnd:GetParent():YToScreen( shipSlotWnd:GetTop() ) ) + shipSlotWnd:GetHeight() * 0.5
	local scrollPos		= slotCenterY - self.maskWnd:GetHeight() * 0.5

	self.scrollBar:SetPos( scrollPos )
	
end


--
function UI.ShipsTree_TreeWnd:GetSlotsSpace()

	return self.space_slots

end


--
function UI.ShipsTree_TreeWnd:GetShipSlot( defName )

	local shipRank = UI:GetShipRank( defName )
	local shipsRowWnd = self.listWnd:GetSlotForRank( shipRank )

	if not shipsRowWnd then
		sys.log( "UI.ShipsTree_TreeWnd:GetShipSlot()[ERROR]: cannot find row for rank %d", shipRank )
		return nil
	end

	return shipsRowWnd:GetSlotForShip( defName )

end


--
function UI.ShipsTree_TreeWnd:GetRankSlot( rank )

	return self.listWnd:GetSlotForRank( rank )

end


--
function UI.ShipsTree_TreeWnd:GetShipsListSize()

	return UI:Vec2( self.listWnd:GetWidth(), self.listWnd:GetHeight() )

end


--
function UI.ShipsTree_TreeWnd:GetScrollPos()

	return self.scrollBar:GetPos()

end


--
function UI.ShipsTree_TreeWnd:GetPosToSave()

	local posToSave	= -1
	local scrollPos	= self.scrollBar:GetPos()	

	for rank = 1, UI:GetMaxRank() do

		local slotWnd = self.listWnd:GetSlotForRank( rank )
		if slotWnd then
			
			local slotRect = slotWnd:GetRect()

			if scrollPos >= slotRect.y and scrollPos <= slotRect.y + slotRect.w then

				posToSave = rank + ( scrollPos - slotRect.y ) / slotRect.w
				break

			end

		end

	end

	return posToSave

end


--
function UI.ShipsTree_TreeWnd:OnOwnedVessels()

	self.listWnd:OnOwnedVessels()
	self.linksWnd:OnOwnedVessels()

end


--
function UI.ShipsTree_TreeWnd:OnSellVessel( vid )

	self.listWnd:OnSellVessel( vid )

end


--
function UI.ShipsTree_TreeWnd:OnVesselLevelUp( vid )

	self.listWnd:OnVesselLevelUp( vid )
	self.linksWnd:OnVesselLevelUp( vid )

end


--
function UI.ShipsTree_TreeWnd:OnPlayerAccountRankChanged()

	self.listWnd:OnPlayerAccountRankChanged()
	self.linksWnd:OnPlayerAccountRankChanged()

end


--
function UI.ShipsTree_TreeWnd:OnPlayerCreditsChanged()

	self.listWnd:OnPlayerCreditsChanged()

end


--
function UI.ShipsTree_TreeWnd:OnAccountAurasChanged()

	self.listWnd:OnAccountAurasChanged()

end


--
function UI.ShipsTree_TreeWnd:OnBattleSlotsChanged()

	self.listWnd:OnBattleSlotsChanged()

end


--
function UI.ShipsTree_TreeWnd:OnHangarPrepareStateChanged()

	self.listWnd:OnHangarPrepareStateChanged()

end


--
function UI.ShipsTree_TreeWnd:OnShipQuestStateChanged()

	self.listWnd:OnShipQuestStateChanged()

end


--
function UI.ShipsTree_TreeWnd:OnShipsTreePanelChanged()

	self:RecalcLayout()

end


--
function UI.ShipsTree_TreeWnd:OnResourcesChanged()

	self.listWnd:OnResourcesChanged()

end


--
function UI.ShipsTree_TreeWnd:OnShipSlotLayoutChanged( slotWnd )

	self.linksWnd:OnShipSlotLayoutChanged( slotWnd )

end


--
function UI.ShipsTree_TreeWnd:OnQuestsChanged()

	self.listWnd:OnQuestsChanged()

end



--
function UI.ShipsTree_TreeWnd:OnShipDisabledByTimeChanged( defName )

	self.listWnd:OnShipDisabledByTimeChanged( defName )
	self.linksWnd:OnShipDisabledByTimeChanged( defName )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_TreeWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.ShipsTree_TreeWnd.effectInfo =
{
	main =
	{
		scrollBarLocator	= "scroll",		
		slotLocatorPrefix	= "line_",
		slotEffectName		= "shipsTree_shipsRow",
	}
}

UI.ShipsTree_TreeWnd.space_list_scrollBar	= UI:XTo1024x768( 10, { x = 1280, y = 720 } )

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_TreeWnd.scrollBar				= nil
UI.ShipsTree_TreeWnd.maskWnd				= nil
UI.ShipsTree_TreeWnd.listWnd				= nil
UI.ShipsTree_TreeWnd.linksWnd				= nil
UI.ShipsTree_TreeWnd.space_scrollBar_btm	= 0
UI.ShipsTree_TreeWnd.scrollBarY			= 0
UI.ShipsTree_TreeWnd.space_slots			= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_TreeWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.scrollBar	= UI.ShipsTree_Tree_ScrollBarWnd
	self.maskWnd	= UI.ShipsTree_Tree_MaskWnd
	self.listWnd	= UI.ShipsTree_Tree_ListWnd
	self.linksWnd	= UI.ShipsTree_Tree_LinksWnd

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.ShipsTree_TreeWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local scrollBarPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.scrollBarLocator ) or Vec2( 0, 0 )
	local scrollBarSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator ) or Vec2( 0, 0 )
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )

	local slotSize = Vec2( 0, 0 )

	local slotEffect = _G.UI_SpawnEffect( self.effectInfo.main.slotEffectName, self:GetUiHandle() )
	if slotEffect then

		slotSize = slotEffect:GetObjSize( "self" )
		_G.UI_DestroyEffect( slotEffect )

	end

	self.space_scrollBar_btm	= selfSize.y - ( scrollBarPos.y + scrollBarSize.y )
	self.scrollBarY				= scrollBarPos.y
	self.space_slots			= secondSlotPos.y - ( firstSlotPos.y + slotSize.y )

end


--
function UI.ShipsTree_TreeWnd:RecalcLayout()

	-- собственный размер

	local selfWidth 	= 1024	-- на всю ширину экрана
	local selfHeight	= UI.ShipsTreeWnd:GetShipsAvailableHeight()

	self:SetWidth( selfWidth )
	self:SetHeight( selfHeight )


	-- размер маски

	self.maskWnd:SetWidth( selfWidth )
	self.maskWnd:SetHeight( selfHeight )


	-- скроллбар

	self:UpdateScrollBar()

end


-- апдейт скроллбара, зависимый от содержимого дерева
function UI.ShipsTree_TreeWnd:UpdateScrollBar()

	-- размер

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local scrollEffect	= UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	local selfHeight	= self:GetHeight()

	if mainEffect and scrollEffect then

		local needHeight	= selfHeight - self.space_scrollBar_btm - self.scrollBarY
		local baseSize		= scrollEffect:GetObjSize( "self" )

		local scale_y = needHeight / baseSize.y
		scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

		self.scrollBar:SetWidth( baseSize.x )
		self.scrollBar:SetHeight( needHeight )

	end

	-- page
	self.scrollBar:SetPageSize( selfHeight )

	-- y
	self.scrollBar:SetTop( self.scrollBarY )

	-- x
	local x = self:XToWindow( UI.ShipsTreeWnd:GetRolesScreenX() ) + UI.ShipsTreeWnd:GetRolesWidth() + self.space_list_scrollBar
	self.scrollBar:SetLeft( UI:XRel2Snapped( x ) )	

	-- range
	
	local listHeight	= self.listWnd:GetHeight()
	local maskHeight	= self.maskWnd:GetHeight()

	local scrollMin	= 0
	local scrollMax	= listHeight - maskHeight

	local shipQuestId = UI.ShipsTreeWnd:GetShipQuest()

	if shipQuestId ~= -1 then

		local minShipRank = UI:GetShipQuestMinShipRank( shipQuestId )
		local maxShipRank = UI:GetShipQuestMaxShipRank( shipQuestId )

		if minShipRank ~= -1 then

			local minRankSlotWnd = self.listWnd:GetSlotForRank( minShipRank )
			if minRankSlotWnd then
				scrollMin = minRankSlotWnd:GetTop()
			else
				sys.log( "UI.ShipsTree_TreeWnd:UpdateScrollBar()[ERROR]: cannot find slot for min rank %d for quest %d", minShipRank, shipQuestId )
			end

		end

		if maxShipRank ~= -1 then

			local maxRankSlotWnd = self.listWnd:GetSlotForRank( maxShipRank )
			if maxRankSlotWnd then
				scrollMax = ( maxRankSlotWnd:GetTop() + maxRankSlotWnd:GetHeight() ) - maskHeight
			else
				sys.log( "UI.ShipsTree_TreeWnd:UpdateScrollBar()[ERROR]: cannot find slot for max rank %d for quest %d", maxShipRank, shipQuestId )
			end

		end

	end

	scrollMax = math.max( scrollMax, scrollMin )

	-- мин/макс выставляется даже когда скроллбар не показывается (мин==макс), т.к. от этого зависит минимальный отображаемый ранг
	self.scrollBar:SetRange( scrollMin, scrollMax )

	-- видимость

	if math.abs( scrollMax - scrollMin ) > 1e-3 then
		self:AddChild( self.scrollBar )
	else
		self.scrollBar:UnlinkFromParent()
	end
	
	self:OnScrollPosChanged()	-- если скроллбар на момент смены позиции не был чайлдом, то ивент EV_VSCROLL_CHANGE не пошлется, поэтому вызываем апдейт вручную

end


--
function UI.ShipsTree_TreeWnd:ResetScrollBar()

	self.scrollBar:SetRange( 0, 0 )
	self.scrollBar:UnlinkFromParent()

end


--
function UI.ShipsTree_TreeWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if not self:IsOnScreen() then
		return
	end

	self:OnScrollPosChanged()

	if eventSrc ~= UI.SCROLL_SRC_UNKNOWN then
		_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_VESSEL_TREE_SCROLL )
	end

end


--
function UI.ShipsTree_TreeWnd:OnScrollPosChanged()

	local scrollPos	= self:GetScrollPos()
	local y			= -scrollPos

	self.listWnd:SetTop( UI:YRel2Snapped( y ) )
	self.linksWnd:SetTop( UI:YRel2Snapped( y ) )

end


--
function UI.ShipsTree_TreeWnd:RestoreScrollPos()

	local profile = _G.GetProfileTable()

	if type( profile.shipsTree ) ~= "table" then	
		return false
	end
	
	if type( profile.shipsTree.pos ) ~= "number" then	
		return false
	end

	if profile.shipsTree.pos < 1 then
		return false
	end

	if self.scrollBar:IsChildOf( self ) then

		-- сохраняется не просто позиция в пикселах, а позиция относительно первого видимого ранга,
		-- т.к. позиция в пикселах может отличаться для разных рас, а также зависит от состояния нижней панели

		local rank			= math.floor( profile.shipsTree.pos )
		local relPosInRank  = profile.shipsTree.pos - rank

		local slotWnd = self.listWnd:GetSlotForRank( rank )
		if not slotWnd then
			return false			
		end

		local slotRect = slotWnd:GetRect()
		local scrollPos = slotRect.y + slotRect.w * relPosInRank

		self.scrollBar:SetPos( scrollPos )

	end

	return true

end


--
function UI.ShipsTree_TreeWnd:SetDefaultScrollPos()

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( 0 )
	end

end


--
function UI.ShipsTree_TreeWnd:ValidateScrollPos()

	if not self:RestoreScrollPos() then
		self:SetDefaultScrollPos()
	end

end


--
function UI.ShipsTree_TreeWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( self.scrollBar:GetPos() - ticks * self.scrollBar:GetStepSize(), UI.SCROLL_SRC_WHEEL )
	end

	return true

end


-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_MaskWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_MaskWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_MaskWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_MaskWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},

	layers =
	{
		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x4400ffff,
			visible		= false,
		}
	},

	children = { "UI.ShipsTree_Tree_LinksWnd", "UI.ShipsTree_Tree_ListWnd" }
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_MaskWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.ShipsTree_Tree_MaskWnd.parent	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_MaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.ShipsTree_Tree_MaskWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.ShipsTree_Tree_MaskWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.ShipsTree_Tree_MaskWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end

-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_ScrollBarWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_ScrollBarWnd =
{
	def =
	{
		className	= "ScrollWnd",
		prototype	= "EffectScrollWnd_Vrt_2",

		props =
		{
			name	= "ShipsTree_Tree_ScrollBarWnd",
			step	= UI:YTo1024x768( 30, { x = 1280, y = 720 } ),
		}	
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_ListWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_ListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_ListWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_ListWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},	
}

-- ---------------------------------
-- interface definition
-- ---------------------------------

--
function UI.ShipsTree_Tree_ListWnd:Reset()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()		
	end

	self.curSlots = {}

end


--
function UI.ShipsTree_Tree_ListWnd:FullUpdate()

	self:Reset()

	for rank = 1, UI:GetMaxRank() do
		local slotWnd = self:ObtainFreeSlot()
		slotWnd:Setup( rank )
	end

	self:RecalcLayout()

end


--
function UI.ShipsTree_Tree_ListWnd:GetSlotForRank( rank )

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		if slotWnd:GetRank() == rank then
			return slotWnd
		end

	end

	return nil

end


--
function UI.ShipsTree_Tree_ListWnd:OnOwnedVessels()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnOwnedVessels()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnSellVessel( vid )

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnSellVessel( vid )
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnVesselLevelUp( vid )

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnVesselLevelUp( vid )
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnPlayerAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnPlayerAccountRankChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnPlayerCreditsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnPlayerCreditsChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnAccountAurasChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnAccountAurasChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnBattleSlotsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnBattleSlotsChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnHangarPrepareStateChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnHangarPrepareStateChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnShipQuestStateChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnShipQuestStateChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnResourcesChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnResourcesChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnQuestsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnQuestsChanged()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:OnShipDisabledByTimeChanged( defName )

	for rowIdx, rowWnd in pairs( self.curSlots ) do
		if rowWnd:GetSlotForShip( defName ) then
			rowWnd:OnShipDisabledByTimeChanged( defName )
			break
		end
	end

end


-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_ListWnd.curSlots		= {}
UI.ShipsTree_Tree_ListWnd.allSlots		= {}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_ListWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipsTree_Tree_ListWnd:CreateControls()

	for slotIdx = 1, 15 do
		self:CreateSlot()
	end

end


--
function UI.ShipsTree_Tree_ListWnd:ObtainFreeSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
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
function UI.ShipsTree_Tree_ListWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_Tree_RowWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.ShipsTree_Tree_ListWnd:PrepareLayout()

	local selfWidth	= 1024	-- на всю ширину экрана
	self:SetWidth( selfWidth )	

end


--
function UI.ShipsTree_Tree_ListWnd:RecalcLayout()

	-- позиции слотов

	local slotY			= 0
	local space_slots	= UI.ShipsTree_TreeWnd:GetSlotsSpace()

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		slotWnd:SetTop( UI:YRel2Snapped( slotY ) )
		slotY = slotY + slotWnd:GetHeight() + space_slots

	end

	-- собственный размер	

	local selfHeight = 0

	local lastSlotWnd = self.curSlots[ #self.curSlots ]
	if lastSlotWnd then
		selfHeight = lastSlotWnd:GetTop() + lastSlotWnd:GetHeight()
	end

	selfHeight  = selfHeight + UI.ShipsTreeWnd:GetPanelHeaderHeight()	-- дополнительное расстояние снизу, чтобы заголовок панели боевых слотов не скрывал нижнюю часть слотов при максимальной позиции скроллбара

	self:SetHeight( selfHeight )

end


-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_RowWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_RowWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_RowWnd.layers =
{
    MAIN_EFFECT				= 0,
    RANK					= 1,
    UNLOCKED_LINE_EFFECT	= 2,
    UNLOCK_CONDITION		= 3,
}

--
UI.ShipsTree_Tree_RowWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_RowWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipsTree_Tree_RowWnd.layers.RANK,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shipsTree_shipsRow",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по позиции и цвету
					{
						objName		= "rank",	
						layer		= "UI.ShipsTree_Tree_RowWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- UNLOCKED_LINE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_shipsRow_unlockedLine",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_RowWnd:Setup( rank )

	self:Reset()

	self.rank = rank
	self:FullUpdate()

end


--
function UI.ShipsTree_Tree_RowWnd:Reset()

	self.rank			= -1
	self.bRankLocked	= false

	self:ResetSlots()
	self.darkeningWnd:UnlinkFromParent()

	self:SetText( "", self.layers.RANK )

	self:SetLayerVisible( false, self.layers.UNLOCKED_LINE_EFFECT )

	self.lockLineWnd:UnlinkFromParent()
	self.lockLineWnd.unlockConditionMetaText:SetText( "", true )

end


--
function UI.ShipsTree_Tree_RowWnd:GetRank()

	return self.rank

end


--
function UI.ShipsTree_Tree_RowWnd:GetSlotForShip( defName )

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		if slotWnd:GetDefName() == defName then
			return slotWnd
		end

	end

	return nil

end


--
function UI.ShipsTree_Tree_RowWnd:GetSlots()

	return self.curSlots

end


--
function UI.ShipsTree_Tree_RowWnd:OnOwnedVessels()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnOwnedVessels()
	end

	self:UpdateZOrder()

end


--
function UI.ShipsTree_Tree_RowWnd:OnSellVessel( vid )

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnSellVessel( vid )
	end

	self:UpdateZOrder()

end


--
function UI.ShipsTree_Tree_RowWnd:OnVesselLevelUp( vid )

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnVesselLevelUp( vid )
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnPlayerAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnPlayerAccountRankChanged()
	end
	
	self:OnRankLockChanged()

end


--
function UI.ShipsTree_Tree_RowWnd:OnPlayerCreditsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnPlayerCreditsChanged()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnAccountAurasChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnAccountAurasChanged()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnBattleSlotsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnBattleSlotsChanged()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnHangarPrepareStateChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnHangarPrepareStateChanged()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnShipQuestStateChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnShipQuestStateChanged()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnResourcesChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnResourcesChanged()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnQuestsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnQuestsChanged()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:OnShipDisabledByTimeChanged( defName )

	local slotWnd = self:GetSlotForShip( defName )
	if slotWnd then
		slotWnd:OnShipDisabledByTimeChanged()
	end
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Tree_RowWnd.effectsInfo =
{
	main =
	{
		rankColorLocator_unlocked	= "rank",
		rankColorLocator_locked		= "color_",
		firstRowSlotLocator			= "slot_1",
		secondRowSlotLocator		= "slot_2",
		rankLocator					= "rank",
		lineUnlockedLocator			= "spacer_1",
		lineLockedLocator			= "spacer_2",
	},

	lineUnlocked =
	{
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	},
}


-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_RowWnd.rank					= -1
UI.ShipsTree_Tree_RowWnd.curSlots				= {}
UI.ShipsTree_Tree_RowWnd.allSlots				= {}
UI.ShipsTree_Tree_RowWnd.darkeningWnd			= nil
UI.ShipsTree_Tree_RowWnd.bRankLocked			= false
UI.ShipsTree_Tree_RowWnd.rankColor_unlocked		= UI.WHITE_COLOR
UI.ShipsTree_Tree_RowWnd.rankColor_locked		= UI.WHITE_COLOR
UI.ShipsTree_Tree_RowWnd.space_top_slots		= 0
UI.ShipsTree_Tree_RowWnd.space_slots_btm		= 0
UI.ShipsTree_Tree_RowWnd.space_slots_y			= 0
UI.ShipsTree_Tree_RowWnd.slotHeight				= 0
UI.ShipsTree_Tree_RowWnd.lineUnlockedMinWidth	= 0
UI.ShipsTree_Tree_RowWnd.lineUnlockedMaxWidth	= 0
UI.ShipsTree_Tree_RowWnd.space_rank_line		= 0
UI.ShipsTree_Tree_RowWnd.lockLineWnd			= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_RowWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.curSlots	= {}
	self.allSlots	= {}	

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipsTree_Tree_RowWnd:CreateControls()

	for slotIdx = 1, 3 do
		self:CreateSlot()
	end

	self.darkeningWnd	= UI:CreateChildWnd( self, UI.ShipsTree_Tree_Row_DarkeningWnd, "" )
	self.lockLineWnd	= UI:CreateChildWnd( self, UI.ShipsTree_Tree_Row_LockedLineWnd, "" )

end


--
function UI.ShipsTree_Tree_RowWnd:ObtainFreeSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
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
function UI.ShipsTree_Tree_RowWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_Tree_ShipSlotWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.ShipsTree_Tree_RowWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.ShipsTree_Tree_RowWnd:FullUpdate()

	self:UpdateRankLock()

	self:UpdateSlots()
	self:UpdateRankText()
	self:UpdateRankColor()
	self:UpdateDarkening()
	self:UpdateLineControls()

	self:UpdateZOrder()
	self:RecalcLayout()

end


--
function UI.ShipsTree_Tree_RowWnd:UpdateRankText()

	local strRank = tostring( self.rank )
	self:SetText( strRank, self.layers.RANK )

end


--
function UI.ShipsTree_Tree_RowWnd:UpdateRankColor()

	local color = self.bRankLocked and self.rankColor_locked or self.rankColor_unlocked
	self:SetColor( color, self.layers.RANK )

end


--
function UI.ShipsTree_Tree_RowWnd:UpdateSlots()

	self:ResetSlots()

	local allShips = UI.ShipsTreeWnd:GetShips()	
	local rankShips = {}
	
	for defName, shipData in pairs( allShips ) do

		local shipRank = UI:GetShipRank( defName )

		if shipRank == self.rank then
			table.insert( rankShips, defName )
		end

	end
	
	for shipIdx, defName in pairs( rankShips ) do

		local slotWnd = self:ObtainFreeSlot()
		slotWnd:Setup( defName )

	end	

end


--
function UI.ShipsTree_Tree_RowWnd:UpdateDarkening()

	if self.bRankLocked then
		self:AddChild( self.darkeningWnd )
	else
		self.darkeningWnd:UnlinkFromParent()
	end

end


--
function UI.ShipsTree_Tree_RowWnd:UpdateLineControls()

	if self.bRankLocked then

		self:SetLayerVisible( false, self.layers.UNLOCKED_LINE_EFFECT )

		self:AddChild( self.lockLineWnd )
		
		local requiredRank = UI:GetShipsRequiredRank( UI.ShipsTreeWnd:GetSelRace(), self.rank )
		local strRequiredRankVal = tostring( requiredRank )

		local str = UI:GetStringByName( "shipsTree_unlockRank", leftNeedShips, "count" )
		
		local numSubst = 0
		str, numSubst = string.gsub( str, "%$rank%$", strRequiredRankVal )
		
		if numSubst == 0 then
			sys.log( "UI.ShipsTree_Tree_RowWnd:UpdateLineControls()[ERROR]: cannot find placeholder \"$rank$\" in string \"shipsTree_unlockRank\"" )
			str = string.format( "(INVALID STRING) Required Rank: %s", strRequiredRankVal )
		end
		
		local color		= self.lockLineWnd:GetColor( self.lockLineWnd.layers.UNLOCK_CONDITION )
		local strLink	= string.format( "$link [type CUSTOM_TEXT] [params {text=\"%s\", tooltipCaptionId=\"shipsTree_unlockRank_tooltipCaption\", tooltipTextId=\"shipsTree_unlockRank_tooltipText\", colorUnsel=%u, colorSel=%u}]$", str, color, color )

		self.lockLineWnd.unlockConditionMetaText:SetText( strLink, true )

	else

		self.lockLineWnd:UnlinkFromParent()
		self.lockLineWnd.unlockConditionMetaText:SetText( "", true )

		self:SetLayerVisible( true, self.layers.UNLOCKED_LINE_EFFECT )

	end

end


--
function UI.ShipsTree_Tree_RowWnd:UpdateZOrder()

	if not self.darkeningWnd:IsChildOf( self ) then
		return
	end

	self:MoveChildToLastPosition( self.darkeningWnd )
	self:MoveChildToLastPosition( self.lockLineWnd )

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		-- незалоченными отображаются 1)золотые, 2)dlc, 3)которые уже были хотя бы раз куплены, 4)которые еще не поступили в продажу

		local defName = slotWnd:GetDefName()

		if UI:IsShipPremium( defName ) or UI:GetShipItemByDef( defName, true ) ~= nil or UI:IsShipAdvert( defName ) then
			self:MoveChildToLastPosition( slotWnd )
		end

	end

end


--
function UI.ShipsTree_Tree_RowWnd:PrepareLayout()

	local mainEffect			= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local lineUnlockedEffect	= UI:GetEffectFromLayer( self, self.layers.UNLOCKED_LINE_EFFECT )
	local slotWnd				= self.allSlots[ 1 ]

	local firstRowSlotPos		= mainEffect and mainEffect:GetObjPos( self.effectsInfo.main.firstRowSlotLocator ) or Vec2( 0, 0 )
	local secondRowSlotPos		= mainEffect and mainEffect:GetObjPos( self.effectsInfo.main.secondRowSlotLocator ) or Vec2( 0, 0 )
	local lineUnlockedPos		= mainEffect and mainEffect:GetObjPos( self.effectsInfo.main.lineUnlockedLocator ) or Vec2( 0, 0 )
	local lineLockedPos			= mainEffect and mainEffect:GetObjPos( self.effectsInfo.main.lineLockedLocator ) or Vec2( 0, 0 )
	local lineUnlockedMinSize	= lineUnlockedEffect and lineUnlockedEffect:GetObjSize( self.effectsInfo.lineUnlocked.minSizeLocator ) or Vec2( 0, 0 )
	local lineUnlockedMaxSize	= lineUnlockedEffect and lineUnlockedEffect:GetObjSize( self.effectsInfo.lineUnlocked.maxSizeLocator ) or Vec2( 0, 0 )
	local slotHeight			= slotWnd and slotWnd:GetBaseHeight() or 0
	local selfSize				= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local rankPos				= mainEffect and mainEffect:GetObjPos( self.effectsInfo.main.rankLocator ) or Vec2( 0, 0 )
	local rankSize				= mainEffect and mainEffect:GetObjSize( self.effectsInfo.main.rankLocator ) or Vec2( 0, 0 )
	local selfWidth				= 1024	-- в ширину экрана

    self.space_top_slots		= firstRowSlotPos.y
    self.space_slots_btm		= selfSize.y - ( secondRowSlotPos.y + slotHeight )
    self.space_slots_y			= secondRowSlotPos.y - ( firstRowSlotPos.y + slotHeight )
    self.slotHeight				= slotHeight
    self.lineUnlockedMinWidth	= lineUnlockedMinSize.x
    self.lineUnlockedMaxWidth	= lineUnlockedMaxSize.x
	self.space_rank_line		= lineUnlockedPos.x - ( rankPos.x + rankSize.x )

	if lineUnlockedEffect then
		lineUnlockedEffect:SetPos( UI:Vec2( 0, lineUnlockedPos.y ) )
	end

	self.lockLineWnd:SetTop( lineLockedPos.y )

	self:SetTop( rankPos.y, self.layers.RANK ) 

	self:SetWidth( selfWidth )
	self.darkeningWnd:SetWidth( selfWidth )

	if mainEffect then
		self.rankColor_unlocked	= mainEffect:GetObjColor( self.effectsInfo.main.rankColorLocator_unlocked )
		self.rankColor_locked	= mainEffect:GetObjColor( self.effectsInfo.main.rankColorLocator_locked )
	end

end


--
function UI.ShipsTree_Tree_RowWnd:RecalcLayout()

	-- позиции слотов

	local function l_fnSortShips( shipData1, shipData2 )

		if shipData1.bIsDlc ~= shipData2.bIsDlc then
			return not shipData1.bIsDlc
		end

		if shipData1.bIsCraftable ~= shipData2.bIsCraftable then
			return not shipData1.bIsCraftable
		end

		if not shipData1.bIsDlc and not shipData1.bIsCraftable then

			if shipData1.bGold ~= shipData2.bGold then
				return not shipData1.bGold
			end

			if shipData1.price ~= shipData2.price then
				return shipData1.price < shipData2.price
			end

		end		

		return shipData1.defName < shipData2.defName

	end


	local shipsByRole = {}

	for slotidx, slotWnd in pairs( self.curSlots ) do

		local defName = slotWnd:GetDefName()
		local role = UI.ShipsTreeWnd:IsShipPremiumColumn( defName ) and UI.ShipsTreeWnd.PREMIUM_ROLE or UI:GetItemRole( defName )

		local roleShips = shipsByRole[ role ]

		if not roleShips then
			roleShips = {}
			shipsByRole[ role ] = roleShips
		end
		
		local price, bGold = UI:GetShopBaseBuyPriceByDef( defName, false, false )

		local shipData =
		{
			slotWnd			= slotWnd,
			defName			= defName,
			bIsDlc			= UI:IsShipDlc( defName ),
			bIsCraftable	= UI:IsShipCraftable( defName ),			
			price			= price,
			bGold			= bGold,
		}

		table.insert( roleShips, shipData )

	end

	for role, roleShips in pairs( shipsByRole ) do
		table.sort( roleShips, l_fnSortShips )
	end


	local maxSlotsHeight = 0

	for role, roleShips in pairs( shipsByRole ) do

		local numRoleShips		= #roleShips
		local numRoleCols		= UI.ShipsTreeWnd:GetNumRoleCols( role )
		local numRoleRows		= math.ceil( numRoleShips / numRoleCols )

		local roleSlotsHeight = self.slotHeight * numRoleRows + self.space_slots_y * ( numRoleRows - 1 )

		if roleSlotsHeight > maxSlotsHeight then
			maxSlotsHeight = roleSlotsHeight
		end

	end

	for role, roleShips in pairs( shipsByRole ) do

		local numRoleShips		= #roleShips
		local numRoleCols		= UI.ShipsTreeWnd:GetNumRoleCols( role )
		local numRoleRows		= math.ceil( numRoleShips / numRoleCols )
		local roleSlotsHeight	= self.slotHeight * numRoleRows + self.space_slots_y * ( numRoleRows - 1 )
		local roleSlotsY		= self.space_top_slots + maxSlotsHeight * 0.5 - roleSlotsHeight * 0.5

		for shipIdx, shipData in pairs( roleShips ) do

			-- x

			local colIdx = ( shipIdx - 1 ) % numRoleCols + 1

			local colCenterX = UI.ShipsTreeWnd:GetRoleColCenterX( role, colIdx )
			local parent = self:GetParent()
			if parent then
				colCenterX = parent:XToWindow( colCenterX )
			end

			local slotX = colCenterX - shipData.slotWnd:GetWidth() * 0.5
			shipData.slotWnd:SetLeft( UI:XRel2Snapped( slotX ) )

			-- y

			local rowIdx = math.ceil( shipIdx / numRoleCols )

            local slotY = roleSlotsY + ( self.slotHeight + self.space_slots_y ) * ( rowIdx - 1 )
			shipData.slotWnd:SetTop( UI:YRel2Snapped( slotY ) )

		end

	end


	-- позиция и длина полосы

	local lineX = UI.ShipsTreeWnd:GetRolesScreenX()
	local parent = self:GetParent()
	if parent then
		lineX = parent:XToWindow( lineX )
	end

	local lineWidth = UI.ShipsTreeWnd:GetRolesWidth()

	-- активная полоса

	local lineUnlockedAnimTime = ( lineWidth - self.lineUnlockedMinWidth ) / ( self.lineUnlockedMaxWidth - self.lineUnlockedMinWidth )

	local lineUnlockedEffect = UI:GetEffectFromLayer( self, self.layers.UNLOCKED_LINE_EFFECT )
	if lineUnlockedEffect then
		lineUnlockedEffect:SetAnimationTimeAndUpdate( lineUnlockedAnimTime )
	end

	lineUnlockedEffect:SetPos( UI:Vec2( lineX, lineUnlockedEffect:GetPos().y ) )

	-- неактивная полоса

	self.lockLineWnd:SetAnimWidth( lineWidth )
	self.lockLineWnd:SetLeft( lineX )


	-- позиция цифры ранга

	local rankX = lineX - self.space_rank_line - self:GetLayerWidth( self.layers.RANK )
	self:SetLayerLeft( rankX, self.layers.RANK )


	-- собственная высота

	local selfHeight = self.space_top_slots + maxSlotsHeight + self.space_slots_btm
	self:SetHeight( selfHeight )	


	-- высота затемнения

	self.darkeningWnd:SetAnimHeight( selfHeight )

end


--
function UI.ShipsTree_Tree_RowWnd:OnRankLockChanged()

	self:UpdateRankLock()

	self:UpdateRankColor()
	self:UpdateDarkening()
	self:UpdateLineControls()

	self:UpdateZOrder()

end


--
function UI.ShipsTree_Tree_RowWnd:UpdateRankLock()

	self.bRankLocked = UI:GetShipsRequiredRank( UI.ShipsTreeWnd:GetSelRace(), self.rank ) > UI:GetPlayerAccountRank()
	
end


-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_Row_DarkeningWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_Row_DarkeningWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_Row_DarkeningWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_Row_DarkeningWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
    			defName 			= "shipsTree_shipsRow_darkening",
    			defaultAnimation	= "idle",
    		}}
    	}
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_Row_DarkeningWnd:SetAnimHeight( height )

	self:SetHeight( height )

	local animTime = ( height - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Tree_Row_DarkeningWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.ShipsTree_Tree_Row_DarkeningWnd.effectInfo =
{
	main =
	{
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_Row_DarkeningWnd.minHeight	= 0
UI.ShipsTree_Tree_Row_DarkeningWnd.maxHeight	= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_Row_DarkeningWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:PrepareLayout()

end


--
function UI.ShipsTree_Tree_Row_DarkeningWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if mainEffect then
		self.minHeight	= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ).y
		self.maxHeight	= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ).y
	end	

end


-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_Row_LockedLineWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_Row_LockedLineWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_Row_LockedLineWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_Row_LockedLineWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipsTree_shipsRow_lockedLine",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "count3",	
						layer		= "UI.ShipsTree_Tree_Row_LockedLineWnd.layers.UNLOCK_CONDITION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- UNLOCK_CONDITION
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_Row_LockedLineWnd:SetAnimWidth( width )

	self:SetWidth( width )

	local animTime = ( width - self.minWidth ) / ( self.maxWidth - self.minWidth )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Tree_Row_LockedLineWnd.layers =
{
	MAIN_EFFECT			= 0,
	UNLOCK_CONDITION	= 1,
}

UI.ShipsTree_Tree_Row_LockedLineWnd.effectInfo =
{
	main =
	{
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_Row_LockedLineWnd.minWidth				= 0
UI.ShipsTree_Tree_Row_LockedLineWnd.maxWidth				= 0
UI.ShipsTree_Tree_Row_LockedLineWnd.unlockConditionMetaText	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_Row_LockedLineWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.unlockConditionMetaText = UI.MetaText.GetNewInstance()
	self.unlockConditionMetaText:InitFromLayer( self, self.layers.UNLOCK_CONDITION )

	self:PrepareLayout()

end


--
function UI.ShipsTree_Tree_Row_LockedLineWnd:F_Shutdown()

	if self.unlockConditionMetaText then
		self.unlockConditionMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipsTree_Tree_Row_LockedLineWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipsTree_Tree_Row_LockedLineWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ShipsTree_Tree_Row_LockedLineWnd:UpdateMetaTextPos()

	self.unlockConditionMetaText:UpdateScreenOrgFromLayer( self, self.layers.UNLOCK_CONDITION )

end


--
function UI.ShipsTree_Tree_Row_LockedLineWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.UNLOCK_CONDITION then
		self.unlockConditionMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipsTree_Tree_Row_LockedLineWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	if mainEffect then

		local minSize	= mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator )
		local maxSize	= mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )

		self.minWidth	= minSize.x
		self.maxWidth	= maxSize.x

		self:SetHeight( maxSize.y )

	end	

end


-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_ShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_ShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_ShipSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_ShipSlotWnd",
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
				defName 			= "shipsTree_shipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "ship_ico",	
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "role_ico2",	
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "full",	
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.MAX_SYNERGY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по цвету
					{
						objName		= "sinergy",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SYNERGY_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "indic2",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "mark",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "mark",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.HOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "mark",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.NEW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.BATTLE_SLOT_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indic",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.BATTLE_SLOT_NUM_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "advertisement",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.ADVERT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indic",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_QUEST_SLOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.RECOMMENDED_FOR_SHIP_QUEST_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "quest_percent",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_QUEST_REWARD_CF_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ADVERT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_advert",
				defaultAnimation	= "idle",
			}}
		},

		-- SYNERGY_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- MAX_SYNERGY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_maxSynergy",
				defaultAnimation	= "idle",
			}}
		},

		-- BATTLE_SLOT_FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_battleSlotFrame",
				defaultAnimation	= "idle",
			}}
		},

		-- RECOMMENDED_FOR_SHIP_QUEST_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_fitForQuest",
				defaultAnimation	= "idle",
			}}
		},

		-- SHIP_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_shipSlot_shipIco",
				defaultAnimation	= "idle",
			}}
		},

		-- ROLE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- SYNERGY_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- SHIP_NAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_shipName",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "name",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- BATTLE_SLOT_NUM_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_battleSlotNum",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.BATTLE_SLOT_NUM",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- BATTLE_SLOT_NUM
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- SHIP_QUEST_SLOT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_questSlot",
				defaultAnimation	= "idle",
			}}
		},

		-- SHIP_QUEST_REWARD_CF_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_rewardCf",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_QUEST_REWARD_CF",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- SHIP_QUEST_REWARD_CF
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_inBattle",
				defaultAnimation	= "idle",
			}}
		},
		
		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_sale",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SALE_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SALE_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- HOT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_hot",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.HOT_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- HOT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipsTree_hit" ),
		},

		-- NEW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_new",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.NEW_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- NEW_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipsTree_new" ),
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_ShipSlotWnd:Setup( defName )

	self:Reset()

	self.defName = defName
	self:FullUpdate()

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:Reset()

	self.defName				= ""
	self.shipItem				= nil
	self.tooltipData			= nil
	self.inLinksSorted			= nil
	self.outLinksSorted			= nil
	self.inLinksCenterDefName	= ""
	self.outLinksCenterDefName	= ""

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetColor( UI.WHITE_COLOR )
		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:SetLayerVisible( false, self.layers.SYNERGY_PB_EFFECT )
	self:DeleteSynergyPb()

	self:SetLayerVisible( true, self.layers.MAIN_EFFECT )	
	
	self:SetLayerVisible( false, self.layers.SHIP_ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.MAX_SYNERGY_EFFECT )
	self:SetLayerVisible( false, self.layers.SYNERGY_TEXT )
	self:SetLayerVisible( false, self.layers.BATTLE_SLOT_FRAME_EFFECT )
	self:SetLayerVisible( false, self.layers.BATTLE_SLOT_NUM_EFFECT )
	self:SetLayerVisible( false, self.layers.BATTLE_SLOT_NUM )
	self:SetLayerVisible( false, self.layers.IN_BATTLE_EFFECT )
	self:SetLayerVisible( false, self.layers.SALE_EFFECT )
	self:SetLayerVisible( false, self.layers.SALE_TEXT )
	self:SetLayerVisible( false, self.layers.HOT_EFFECT )
	self:SetLayerVisible( false, self.layers.HOT_TEXT )
	self:SetLayerVisible( false, self.layers.NEW_EFFECT )
	self:SetLayerVisible( false, self.layers.NEW_TEXT )
	self:SetLayerVisible( false, self.layers.ADVERT_EFFECT )	
	self:SetLayerVisible( false, self.layers.SHIP_QUEST_SLOT_EFFECT )
	self:SetLayerVisible( false, self.layers.RECOMMENDED_FOR_SHIP_QUEST_EFFECT )
	self:SetLayerVisible( false, self.layers.SHIP_QUEST_REWARD_CF_EFFECT )
	self:SetLayerVisible( false, self.layers.SHIP_QUEST_REWARD_CF )

	self:SetText( "", self.layers.SHIP_NAME )

	self:SetMouseOver( false )

	self:ResetBuyBtns()
	self.shipQuestIcoWnd:UnlinkFromParent()
	self.resourceQuestBtn:UnlinkFromParent()

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetDefName()

	return self.defName

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetVid()

	return self.shipItem and self.shipItem.vid or UI.INVALID_U64_ID

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetShipItem()

	return self.shipItem

end


-- куплено в настоящий момет
function UI.ShipsTree_Tree_ShipSlotWnd:IsBought()

	return self.shipItem and not self.shipItem.conserved

end


-- было куплено хотя бы раз (в настоящий момет может быть продано)
function UI.ShipsTree_Tree_ShipSlotWnd:WasBought()

	return self.shipItem ~= nil

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetPriceBtn()

	if self.buyBtn and UI:IsWndKindOf( self.buyBtn, "ShipsTree_PriceBtn" ) then
		return self.buyBtn

	elseif self.buyBtn2 and UI:IsWndKindOf( self.buyBtn2, "ShipsTree_PriceBtn" ) then
		return self.buyBtn2

	else
		return nil
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnOwnedVessels()

	self.shipItem = UI:GetShipItemByDef( self.defName, true )

	self:UpdateMainEffect()
	self:UpdateSynergyPb()
	self:UpdateSynergyText()
	self:UpdateMaxSynergyEffect()
	self:UpdateShipNameColor()
	self:UpdateBattleSlot()
	self:UpdateInBattleEffect()
	self:UpdateOnShipQuest()
	self:UpdateShipQuestSlot()
	self:UpdateRecommendedForShipQuest()
	self:UpdateShipQuestRewardCf()
	self:UpdateBuyBtns()
	self:UpdateResourceQuestBtn()
	self:UpdateAction()
	self:UpdateTooltip()
	self:UpdateMouseOver()
	self:UpdateAdvertBtn()
	
end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnSellVessel( vid )

	-- продали этот корабль?
	if self:WasBought() and vid == self.shipItem.vid then

		self.shipItem = UI:GetShipItemByDef( self.defName, true )

		self:UpdateMainEffect()
		self:UpdateSynergyPb()
		self:UpdateSynergyText()
		self:UpdateMaxSynergyEffect()
		self:UpdateShipNameColor()
		self:UpdateBattleSlot()
		self:UpdateInBattleEffect()
		self:UpdateOnShipQuest()
		self:UpdateShipQuestSlot()
		self:UpdateRecommendedForShipQuest()
		self:UpdateShipQuestRewardCf()
		self:UpdateBuyBtns()
		self:UpdateResourceQuestBtn()
		self:UpdateAction()
		self:UpdateTooltip()
		self:UpdateMouseOver()
		self:UpdateAdvertBtn()

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnPlayerAccountRankChanged()

	if not self:WasBought() then
		self:UpdateMainEffect()
		self:UpdateBuyBtns()
		self:UpdateResourceQuestBtn()
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnPlayerCreditsChanged()

	if self.buyBtn and UI:IsWndKindOf( self.buyBtn, "ShipsTree_PriceBtn" ) and self.buyBtn:IsChildOf( self ) then
		self.buyBtn:OnPlayerCreditsChanged()
	end

	if self.buyBtn2 and UI:IsWndKindOf( self.buyBtn2, "ShipsTree_PriceBtn" ) and self.buyBtn2:IsChildOf( self ) then
		self.buyBtn2:OnPlayerCreditsChanged()
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnAccountAurasChanged()

	if self.buyBtn and UI:IsWndKindOf( self.buyBtn, "ShipsTree_PriceBtn" ) and self.buyBtn:IsChildOf( self ) then
		self.buyBtn:OnAccountAurasChanged()
	end

	if self.buyBtn2 and UI:IsWndKindOf( self.buyBtn2, "ShipsTree_PriceBtn" ) and self.buyBtn2:IsChildOf( self ) then
		self.buyBtn2:OnAccountAurasChanged()
	end

	if not self:IsBought() then
		self:UpdateAction()
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnVesselLevelUp( vid )

	-- повысил уровень этот корабль?
	if self:WasBought() and vid == self.shipItem.vid then

		self:UpdateSynergyPb()
		self:UpdateSynergyText()
		self:UpdateMaxSynergyEffect()
		self:UpdateShipQuestRewardCf()

	else

		-- повысил уровень корабль, от которого зависит этот корабль?
    	if not self:WasBought() then

    		local upgradedShipItem = UI:GetShipItem( vid, true )    		
    		if upgradedShipItem then

				if UI:IsShipDependFromShip( self.defName, upgradedShipItem.defName ) then
					self:UpdateMainEffect()
					self:UpdateBuyBtns()
					self:UpdateResourceQuestBtn()
				end
				
			else
				sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:OnVesselLevelUp()[ERROR]: cannot find ship item" )
    		end

    	end

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnBattleSlotsChanged()

	if self:IsBought() then

		self:UpdateMainEffect()
		self:UpdateShipNameColor()
		self:UpdateBattleSlot()
		self:UpdateInBattleEffect()
		self:UpdateRecommendedForShipQuest()
		self:UpdateShipQuestRewardCf()
		self:UpdateMouseOver()

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnHangarPrepareStateChanged()

	if self:IsBought() then

		self:UpdateMainEffect()
		self:UpdateShipNameColor()
		self:UpdateInBattleEffect()
		self:UpdateRecommendedForShipQuest()
		self:UpdateShipQuestRewardCf()
		self:UpdateBattleSlotFrame()
		self:UpdateMouseOver()

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnShipQuestStateChanged()

	self:UpdateShipQuestSlot()
	self:UpdateRecommendedForShipQuest()
	self:UpdateShipQuestRewardCf()
	self:UpdateBattleSlotFrame()

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnResourcesChanged()

	if not self:WasBought() then
		self:UpdateBuyBtns()
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetOutLinkPos( dstSlotWnd )

	self:InitLinks()

	local x = self:GetLinkX( dstSlotWnd, self.outLinksSorted, self.outLinksX_min, self.outLinksX_max, self.outLinksCenterDefName )
	local y = self:GetHeight() + self.space_name_outLinks

	return Vec2( x, y )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetInLinkPos( srcSlotWnd )	

	self:InitLinks()
	
	local x = self:GetLinkX( srcSlotWnd, self.inLinksSorted, self.inLinksX_min, self.inLinksX_max, self.inLinksCenterDefName )
	local y = self.inLinksY

	return Vec2( x, y )
	
end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetShipDDData()

	if	not self:IsBought()
		or UI:IsShipInMatchmaking( self.shipItem )
		or UI:IsShipInBattle( self.shipItem )
		or UI:IsShipOnShipQuest( self.shipItem )
		or UI:IsShipDisabledByTime( self.defName )
		or UI.ShipsTreeWnd:IsWaiting()
		or ( UI.ShipsTreeWnd:GetShipQuest() ~= -1 and not self:IsFitForShipQuest() ) then
			return nil
	end

	local ddData =
	{
		srcType		= UI.ShipDDWnd.srcTypes.TREE_SLOT,
		vid			= self.shipItem.vid,
	}

	return ddData

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetBaseHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjSize( "self" ).y or 0

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnQuestsChanged()

	if not self:WasBought() then
		self:UpdateResourceQuestBtn()
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:OnShipDisabledByTimeChanged()

	self:UpdateMainEffect()
	self:UpdateShipNameColor()
	self:UpdateInBattleEffect()
	self:UpdateRecommendedForShipQuest()
	self:UpdateShipQuestRewardCf()
	self:UpdateBuyBtns()
	self:UpdateBattleSlotFrame()
	self:UpdateMouseOver()
	self:UpdateResourceQuestBtn()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Tree_ShipSlotWnd.layers =
{
    MAIN_EFFECT					= 0, 
	ADVERT_EFFECT				= 1, 
    SYNERGY_PB_EFFECT			= 2, 
	MAX_SYNERGY_EFFECT			= 3, 
	BATTLE_SLOT_FRAME_EFFECT	= 4, 
	RECOMMENDED_FOR_SHIP_QUEST_EFFECT= 5, 
    SHIP_ICO_EFFECT				= 6, 
    ROLE_ICO_EFFECT				= 7, 
    SYNERGY_TEXT				= 8, 
    SHIP_NAME_EFFECT			= 9, 
    SHIP_NAME					= 10,
	BATTLE_SLOT_NUM_EFFECT      = 11,
	BATTLE_SLOT_NUM             = 12,
	SHIP_QUEST_SLOT_EFFECT		= 13,
	SHIP_QUEST_REWARD_CF_EFFECT	= 14,
	SHIP_QUEST_REWARD_CF		= 15,
    IN_BATTLE_EFFECT			= 16,
    SALE_EFFECT					= 17,
    SALE_TEXT					= 18,
    HOT_EFFECT					= 19,
    HOT_TEXT					= 20,
    NEW_EFFECT					= 21,
    NEW_TEXT					= 22,
    MOUSE_OVER_EFFECT			= 23,
}

UI.ShipsTree_Tree_ShipSlotWnd.effectInfo =
{
	main =
	{
		animIdle					= "idle",
		animLocked					= "disable",
		quetsIcoLocator				= "indic2",
		synergyPbLocator			= "syn_progr",
		linkLocatorPrefix			= "link_",
		buyBtnLocator				= "btn",
		buyBtn2Locator				= "btn_2",
		nameLocator					= "name",
		name2Locator				= "name_2",
		resourceQuestBtnLocator		= "quest_btn",
		advertBtnLocator			= "info_btn",
	},

	shipIco =
	{
		spriteName = "ico_ship",
	},

	roleIco =
	{
		spriteName		= "ico",
	},

	shipName =
	{
		animRegular				= "idle",
		animRegular_disabled	= "idle_d",
		animPremium				= "gold",
		animPremium_disabled	= "gold_d",
		animCraft				= "craft",
		animCraft_disabled		= "craft_d",
		nameLocator				= "name",
	},

	synergyPb =
	{
		effectNamePrefix_regular	= "shipsTree_shipSlot_synergyPb_regular_",
		effectNamePrefix_premium	= "shipsTree_shipSlot_synergyPb_premium_",
		effectNamePrefix_craft		= "shipsTree_shipSlot_synergyPb_craft_",
	},

	advert =
	{
		spriteName	= "que56",
	}
}

UI.ShipsTree_Tree_ShipSlotWnd.shipsWndName = "ShipsTree_TreeWnd"

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_ShipSlotWnd.defName				= ""
UI.ShipsTree_Tree_ShipSlotWnd.buyBtn				= nil
UI.ShipsTree_Tree_ShipSlotWnd.buyBtn2				= nil
UI.ShipsTree_Tree_ShipSlotWnd.tooltipData			= nil
UI.ShipsTree_Tree_ShipSlotWnd.shipItem				= nil
UI.ShipsTree_Tree_ShipSlotWnd.shipQuestIcoWnd		= nil
UI.ShipsTree_Tree_ShipSlotWnd.outLinksX_min			= 0
UI.ShipsTree_Tree_ShipSlotWnd.outLinksX_max			= 0
UI.ShipsTree_Tree_ShipSlotWnd.inLinksX_min			= 0
UI.ShipsTree_Tree_ShipSlotWnd.inLinksX_max			= 0
UI.ShipsTree_Tree_ShipSlotWnd.inLinksY				= 0
UI.ShipsTree_Tree_ShipSlotWnd.space_name_outLinks	= 0
UI.ShipsTree_Tree_ShipSlotWnd.inLinksSorted			= nil
UI.ShipsTree_Tree_ShipSlotWnd.outLinksSorted		= nil
UI.ShipsTree_Tree_ShipSlotWnd.inLinksCenterDefName	= ""
UI.ShipsTree_Tree_ShipSlotWnd.outLinksCenterDefName	= ""
UI.ShipsTree_Tree_ShipSlotWnd.resourceQuestBtn		= nil
UI.ShipsTree_Tree_ShipSlotWnd.dlcBtn				= nil
UI.ShipsTree_Tree_ShipSlotWnd.craftBtn				= nil
UI.ShipsTree_Tree_ShipSlotWnd.goldBtn				= nil
UI.ShipsTree_Tree_ShipSlotWnd.creditsBtn			= nil
UI.ShipsTree_Tree_ShipSlotWnd.advertBtn				= nil

-- ---------------------------------
-- work function
-- ---------------------------------

--
function UI.ShipsTree_Tree_ShipSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:CreateControls()	

	self.shipQuestIcoWnd	= UI:CreateChildWnd( self, UI.ShipsTree_QuestIcoWnd, "" )
	self.resourceQuestBtn	= UI:CreateChildWnd( self, UI.ShipsTree_ResourceQuestBtn, "" )
	self.advertBtn			= UI:CreateChildWnd( self, UI.ShipsTree_ShipAdvertBtn, "" )	

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:FullUpdate()

	self.shipItem = UI:GetShipItemByDef( self.defName, true )

	self:InitSynergyPb()
	self:InitBuyBtns()

	self:UpdateMainEffect()
	self:UpdateShipIco()
	self:UpdateRoleIco()
	self:UpdateSynergyPb()
	self:UpdateSynergyText()
	self:UpdateMaxSynergyEffect()
	self:UpdateShipName()
	self:UpdateBattleSlot()
	self:UpdateInBattleEffect()
	self:UpdateOnShipQuest()
	self:UpdateShipQuestSlot()
	self:UpdateRecommendedForShipQuest()
	self:UpdateShipQuestRewardCf()
	self:UpdateBuyBtns( false )
	self:UpdateAction()
	self:UpdateTooltip()
	self:UpdateMouseOver()
	self:UpdateAdvertEffect()
	self:UpdateAdvertBtn()
	self:UpdateResourceQuestBtn()

	self:RecalcLayout()

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateMainEffect()

	if not self:IsAdvert() then
	
		self:SetLayerVisible( true, self.layers.MAIN_EFFECT )
	
		-- залоченная анимация делает серым иконку корабля, иконку роли, "веточки" около роли, цифры синергии, прогрессбар синергии
	
		local bLocked =
			( not self:IsBought() and self:IsLocked() )
			or self:IsInBattle()
			or self:IsOnMatchmaking()
			or self:IsOnShipQuest()
			or ( UI.ShipsTreeWnd:GetShipQuest() ~= -1 and not self:IsFitForShipQuest() )
			or UI:IsShipDisabledByTime( self.defName )
			
		local anim = bLocked and self.effectInfo.main.animLocked or self.effectInfo.main.animIdle
	
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:StartAnimation( anim )
		end
	
	else
	
		self:SetLayerVisible( false, self.layers.MAIN_EFFECT )
	
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:StartAnimation( self.effectInfo.main.animIdle )
		end
	
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateShipIco()

	if not self:IsAdvert() then

		self:SetLayerVisible( true, self.layers.SHIP_ICO_EFFECT )

    	local hTex = UI:GetShipIco( self.defName )

    	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
    	if shipIcoEffect then
    		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.spriteName, hTex )
    	end

	else
		self:SetLayerVisible( false, self.layers.SHIP_ICO_EFFECT )
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateRoleIco()

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if not roleIcoEffect then
		return
	end

	-- цвет

	local color = UI:GetItemColor( self.defName )
	roleIcoEffect:SetColor( color )

	-- текстура

	local role = UI:GetItemRole( self.defName )
	roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, UI:GetRoleIco( role ) )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateMaxSynergyEffect()

	local bMaxSynergy = self:IsBought() and UI:GetShipLevel( self.shipItem ) >= UI:GetShipMaxLevel( self.defName )
	self:SetLayerVisible( bMaxSynergy, self.layers.MAX_SYNERGY_EFFECT )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:DeleteSynergyPb()

	local effectsPool = self:GetEffectsPool( self.layers.SYNERGY_PB_EFFECT )
	effectsPool:Clear()
	
end


--
function UI.ShipsTree_Tree_ShipSlotWnd:InitSynergyPb()

	self:DeleteSynergyPb()

	-- создание эффекта

	local effectsPool	= self:GetEffectsPool( self.layers.SYNERGY_PB_EFFECT )
	local maxLevel		= UI:GetShipMaxLevel( self.defName )

	local effectName = ""

	if UI:IsShipPremium( self.defName ) then
		effectName = self.effectInfo.synergyPb.effectNamePrefix_premium

	elseif UI:IsShipCraftable( self.defName ) then
		effectName = self.effectInfo.synergyPb.effectNamePrefix_craft

	else
		effectName = self.effectInfo.synergyPb.effectNamePrefix_regular
	end

	effectName = string.format( "%s%d", effectName, maxLevel )

	local effect = effectsPool:AddEffect( effectName, self:GetUiHandle() )
	if not effect then
		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:InitSynergyPb()[ERROR]: cannot create effect \"%s\"", effectName )
		return
	end

	-- линк эффекта (позиция и альфа)

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local handle = self:GetUiHandle()

        mainEffect:UnlinkLayer( handle, self.layers.SYNERGY_PB_EFFECT, "" )
		mainEffect:LinkLayer( handle, self.layers.SYNERGY_PB_EFFECT, self.effectInfo.main.synergyPbLocator, UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA )
		
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateSynergyPb()

	if not self:IsBought() then
		self:SetLayerVisible( false, self.layers.SYNERGY_PB_EFFECT )
		return
	end

	local maxLevel	= UI:GetShipMaxLevel( self.defName )
	local curLevel	= math.min( UI:GetShipLevel( self.shipItem ), maxLevel )	

	if curLevel < maxLevel then

		self:SetLayerVisible( true, self.layers.SYNERGY_PB_EFFECT )

    	local anim = tostring( curLevel )

    	local synergyPbEffect = UI:GetEffectFromLayer( self, self.layers.SYNERGY_PB_EFFECT )
    	if synergyPbEffect then
    		synergyPbEffect:StartAnimation( anim )
    	end

	else
		self:SetLayerVisible( false, self.layers.SYNERGY_PB_EFFECT )
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateSynergyText()

	if not self:IsBought() then

		self:SetLayerVisible( false, self.layers.SYNERGY_TEXT )

	else

		self:SetLayerVisible( true, self.layers.SYNERGY_TEXT )

    	local curLevel	= UI:GetShipLevel( self.shipItem )
    	local maxLevel	= UI:GetShipMaxLevel( self.defName )

    	local str = string.format( "%d/%d", curLevel, maxLevel )
    	self:SetText( str, self.layers.SYNERGY_TEXT )

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateShipName()

	local name = ""

	if not self:IsAdvert() then
		name = UI:GetEntityLocalizedNameByDef( self.defName, false )
	else
		name = UI:GetStringByName( "ships_promoShip_text" )
	end

	self:SetText( name, self.layers.SHIP_NAME )

	self:UpdateShipNameColor()

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateShipNameColor()

	local bDisabled =
		( not self:IsBought() and not self:IsAdvert() and self:IsLocked() )
		or self:IsInBattle()
		or self:IsOnMatchmaking()
		or self:IsOnShipQuest()
		or ( UI.ShipsTreeWnd:GetShipQuest() ~= -1 and not self:IsFitForShipQuest() )
		or UI:IsShipDisabledByTime( self.defName )

	local anim = ""

	if UI:IsShipPremium( self.defName ) then
		anim = bDisabled and self.effectInfo.shipName.animPremium_disabled or self.effectInfo.shipName.animPremium

	elseif UI:IsShipCraftable( self.defName ) then
		anim = bDisabled and self.effectInfo.shipName.animCraft_disabled or self.effectInfo.shipName.animCraft

	else
		anim = bDisabled and self.effectInfo.shipName.animRegular_disabled or self.effectInfo.shipName.animRegular
	end

	local shipNameEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_NAME_EFFECT )
	if shipNameEffect then
		shipNameEffect:StartAnimation( anim )
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateBattleSlot()

	self:UpdateBattleSlotNum()
	self:UpdateBattleSlotFrame()

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateBattleSlotNum()

	local slotId = -1

	if self:IsBought() then
		slotId = UI:GetShipBattleSlot( self.shipItem )
	end

	if slotId ~= -1 then

		self:SetLayerVisible( true, self.layers.BATTLE_SLOT_NUM_EFFECT )
		self:SetLayerVisible( true, self.layers.BATTLE_SLOT_NUM )

		self:SetText( tostring( slotId ), self.layers.BATTLE_SLOT_NUM )

	else

		self:SetLayerVisible( false, self.layers.BATTLE_SLOT_NUM_EFFECT )
		self:SetLayerVisible( false, self.layers.BATTLE_SLOT_NUM )

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateBattleSlotFrame()

	local slotId = -1

	if self:IsBought() then
		slotId = UI:GetShipBattleSlot( self.shipItem )
	end

	-- если рисуется рамка "подходит для квеста", то рамка боевого слота игнорируется, т.к. они рисуются на одном месте
	local bVisible = slotId ~= -1 and not self:NeedRecommendedForShipQuestEffect()

	self:SetLayerVisible( bVisible, self.layers.BATTLE_SLOT_FRAME_EFFECT )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateInBattleEffect()

	self:SetLayerVisible( self:IsInBattle() or self:IsOnMatchmaking(), self.layers.IN_BATTLE_EFFECT )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateOnShipQuest()

	local questId = -1

	if self:IsBought() then
		questId = UI:GetShipQuestForShip( self.shipItem )
	end	

	if questId ~= -1 then

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

		UI:AddChildAndLink( self, self.shipQuestIcoWnd, mainEffect, self.effectInfo.main.quetsIcoLocator, UI.EffectAnimParams.POS )
		self.shipQuestIcoWnd:Setup( questId )

	else
		self.shipQuestIcoWnd:UnlinkFromParent()
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateShipQuestSlot()

	local bInQuestSlot = false

	if UI.ShipsTreeWnd:GetShipQuest() ~= -1 and self:IsBought() then
		bInQuestSlot = UI.ShipsTreeWnd:HasQuestShip( self.shipItem.vid )
	end

	self:SetLayerVisible( bInQuestSlot, self.layers.SHIP_QUEST_SLOT_EFFECT )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateRecommendedForShipQuest()

	self:SetLayerVisible( self:NeedRecommendedForShipQuestEffect(), self.layers.RECOMMENDED_FOR_SHIP_QUEST_EFFECT )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateShipQuestRewardCf()

	local bVisible = false

	if UI.ShipsTreeWnd:GetShipQuest() ~= -1 and self:IsBought() then
		bVisible = self:IsFitForShipQuest()
	end

	if bVisible  then

		self:SetLayerVisible( true, self.layers.SHIP_QUEST_REWARD_CF_EFFECT )
		self:SetLayerVisible( true, self.layers.SHIP_QUEST_REWARD_CF )

		local rewardCf = UI:GetShipQuestRewardCoef( UI.ShipsTreeWnd:GetShipQuest(), { self.shipItem.vid }, true )
		rewardCf = UI:Clamp( UI:Round( rewardCf * 100 ), 0, 100 )

		local str = string.format( "+%d%%", rewardCf )
		self:SetText( str, self.layers.SHIP_QUEST_REWARD_CF )		

	else

		self:SetLayerVisible( false, self.layers.SHIP_QUEST_REWARD_CF_EFFECT )
		self:SetLayerVisible( false, self.layers.SHIP_QUEST_REWARD_CF )

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:ResetBuyBtns()

	if self.buyBtn then
		self.buyBtn:UnlinkFromParent()
		self.buyBtn = nil
	end

	if self.buyBtn2 then
		self.buyBtn2:UnlinkFromParent()
		self.buyBtn2 = nil
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:InitBuyBtns()

	self:ResetBuyBtns()

	if UI:IsShipDlc( self.defName ) then

		self.buyBtn = self:ObtainDlcBtn()

		if UI:IsShipBuildableFromShipParts( self.defName ) then
			self.buyBtn2 = self:ObtainGoldBtn()
		end

	elseif UI:IsShipCraftable( self.defName ) then

		self.buyBtn = self:ObtainCraftBtn()

	else

    	if UI:IsShipBuildableFromShipParts( self.defName ) then		
    		self.buyBtn = self:ObtainGoldBtn()
		else
    		if UI:IsShipGold( self.defName ) then
    			self.buyBtn = self:ObtainGoldBtn()
			else
				self.buyBtn = self:ObtainCreditsBtn()
			end
		end

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:ObtainDlcBtn()

	if not self.dlcBtn then
		self.dlcBtn = UI:CreateChildWnd( self, UI.ShipsTree_DlcBtn, "" )
	end

	if self.dlcBtn and not self.dlcBtn:IsChildOf( self ) then
		return self.dlcBtn
	else
		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:ObtainDlcBtn()[ERROR]: no free dlc btn" )
		return nil
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:ObtainCraftBtn()

	if not self.craftBtn then
		self.craftBtn = UI:CreateChildWnd( self, UI.ShipsTree_CraftBtn, "" )
	end

	if self.craftBtn and not self.craftBtn:IsChildOf( self ) then
		return self.craftBtn
	else
		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:ObtainCraftBtn()[ERROR]: no free craft btn" )
		return nil
	end


end


--
function UI.ShipsTree_Tree_ShipSlotWnd:ObtainGoldBtn()

	if not self.goldBtn then
		self.goldBtn = UI:CreateChildWnd( self, UI.ShipsTree_PriceBtn_gold, "" )
	end

	if self.goldBtn and not self.goldBtn:IsChildOf( self ) then
		return self.goldBtn
	else
		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:ObtainGoldBtn()[ERROR]: no free gold btn" )
		return nil
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:ObtainCreditsBtn()

	if not self.creditsBtn then
		self.creditsBtn = UI:CreateChildWnd( self, UI.ShipsTree_PriceBtn_credits, "" )
	end

	if self.creditsBtn and not self.creditsBtn:IsChildOf( self ) then
		return self.creditsBtn
	else
		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:ObtainCreditsBtn()[ERROR]: no free credits btn" )
		return nil
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns( bRecalcLayout )

	if bRecalcLayout == nil then
		bRecalcLayout = true
	end


	local numBtnsOld = 0
	if self.buyBtn and self.buyBtn:IsChildOf( self ) then
		numBtnsOld = numBtnsOld + 1
	end
	if self.buyBtn2 and self.buyBtn2:IsChildOf( self ) then
		numBtnsOld = numBtnsOld + 1
	end


	if self.buyBtn then
		self.buyBtn:UnlinkFromParent()
	end

	if self.buyBtn2 then
		self.buyBtn2:UnlinkFromParent()
	end


	if not self:IsBought() and not self:IsAdvert() and not UI:IsShipDisabledByTime( self.defName ) then -- SC-111975 если задисэйблен по времени, то кнопка покупки не отображается

		if UI:IsShipDlc( self.defName ) then

    		if not self:WasBought() then

    			if self.buyBtn and UI:IsWndKindOf( self.buyBtn, "ShipsTree_DlcBtn" ) then

            		self:AddChild( self.buyBtn )
            		self.buyBtn:Setup( UI:GetShipDlcName( self.defName ) )    		

    			else
    				sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: invalid buy btn type" )
    			end

    			if UI:IsShipBuildableFromShipParts( self.defName ) then

        			if self.buyBtn2 and UI:IsWndKindOf( self.buyBtn2, "ShipsTree_PriceBtn" ) then

                		self:AddChild( self.buyBtn2 )
            			self.buyBtn2:SetupShipParts( self.defName )

        			else
        				sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: invalid buy btn2 type" )
        			end

				end

			else
        		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: unhandled case - dlc ship is in conserved state" )
			end


        elseif UI:IsShipCraftable( self.defName ) then

			if self.buyBtn and UI:IsWndKindOf( self.buyBtn, "ShipsTree_CraftBtn" ) then

    			self:AddChild( self.buyBtn )

        		if self:IsLocked() then

        			self.buyBtn:SetInactive()
        			self.buyBtn:Enable( false )

    			else

        			self.buyBtn:Reset()
        			self.buyBtn:Enable( true )

        		end

			else
				sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: invalid buy btn type" )
			end

		else

    		if UI:IsShipBuildableFromShipParts( self.defName ) then

        		if not self:WasBought() then

        			if self.buyBtn and UI:IsWndKindOf( self.buyBtn, "ShipsTree_PriceBtn" ) then

            			self:AddChild( self.buyBtn )

            			self.buyBtn:SetupShipParts( self.defName )
            			self.buyBtn:Enable( not self:IsLocked() )

        			else
        				sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: invalid buy btn type" )
        			end

				else
            		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: unhandled case - buildable from parts ship is in conserved state" )
				end

            else

				local bAddBtn = true

				if UI:IsShipGold( self.defName ) then
    				if self:WasBought() then
    					sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: unhandled case - gold ship is in conserved state" )
						bAddBtn = false
					end
				end

				if bAddBtn then

        			if self.buyBtn and UI:IsWndKindOf( self.buyBtn, "ShipsTree_PriceBtn" ) then

            			self:AddChild( self.buyBtn )

                    	if self:IsLocked() then

                    		self.buyBtn:SetupInactive( self.defName )
                    		self.buyBtn:Enable( false )

        				else

                			self.buyBtn:SetupPrice( self.defName )
                    		self.buyBtn:Enable( true )

        				end

        			else
        				sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:UpdateBuyBtns()[ERROR]: invalid buy btn type" )
        			end

				end

    		end

		end

	end


	-- пересчет расположения элементов

	if bRecalcLayout then
	
    	local numBtns = 0
    	if self.buyBtn and self.buyBtn:IsChildOf( self ) then
    		numBtns = numBtns + 1
    	end
    	if self.buyBtn2 and self.buyBtn2:IsChildOf( self ) then
    		numBtns = numBtns + 1
    	end

    	if numBtns ~= numBtnsOld then
    		self:RecalcLayout()
			UI.ShipsTreeWnd:OnShipSlotLayoutChanged( self )
    	end

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateAction()

	self:SetLayerVisible( false, self.layers.SALE_EFFECT )
	self:SetLayerVisible( false, self.layers.SALE_TEXT )
	self:SetLayerVisible( false, self.layers.HOT_EFFECT )
	self:SetLayerVisible( false, self.layers.HOT_TEXT )
	self:SetLayerVisible( false, self.layers.NEW_EFFECT )
	self:SetLayerVisible( false, self.layers.NEW_TEXT )

	local action = self:GetAction()

	if action == UI.shopItemActions.SALE then
	
		self:SetLayerVisible( true, self.layers.SALE_EFFECT )
		self:SetLayerVisible( true, self.layers.SALE_TEXT )

		local price, bGold = UI:GetShopBuyPriceByDef( self.defName, false, true, true )
		local basePrice = UI:GetShopBaseBuyPriceByDef( self.defName, false, true )

		local salePerc = UI:Round( ( basePrice - price ) / basePrice * 100 )
		local str = string.format( "-%d%%", salePerc )

		self:SetText( str, self.layers.SALE_TEXT )

	elseif action == UI.shopItemActions.NEW then

		self:SetLayerVisible( true, self.layers.NEW_EFFECT )
		self:SetLayerVisible( true, self.layers.NEW_TEXT )

	elseif action == UI.shopItemActions.HOT then

		self:SetLayerVisible( true, self.layers.HOT_EFFECT )
		self:SetLayerVisible( true, self.layers.HOT_TEXT )

	end	

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetAction()

	local action = -1

	if self:IsBought() or self:IsAdvert() then
		return action
	end

	local shopItem = UI:GetShopItemByDef( self.defName )
	if not shopItem then
		sys.log( "UI.ShipsTree_Tree_ShipSlotWnd:GetAction()[ERROR]: cannot find shop item for \"%s\"", self.defName )
		return action
	end	
	
	local bSale	= UI:IsItemSale( shopItem )
	local bNew	=  not self:WasBought() and UI:IsItemNew( shopItem )
	local bHot	=  not self:WasBought() and UI:IsItemHot( shopItem )
	
	if bSale then
		action = UI.shopItemActions.SALE

	elseif bNew then
		action = UI.shopItemActions.NEW

	elseif bHot then
		action = UI.shopItemActions.HOT
	end

	return action

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateAdvertEffect()

	if self:IsAdvert() then

		self:SetLayerVisible( true, self.layers.ADVERT_EFFECT )

		local hTex = UI:GetShipAdvertIco( self.defName )

		local advertEffect = UI:GetEffectFromLayer( self, self.layers.ADVERT_EFFECT )
		if advertEffect then
			advertEffect:SetSpriteTexture( self.effectInfo.advert.spriteName, hTex )
		end

	else
		self:SetLayerVisible( false, self.layers.ADVERT_EFFECT )
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateTooltip()

	if not self:IsAdvert() then

    	self.tooltipData =
    	{
        	tooltipType	= UI.tooltipTypes.SHIP,
    		defName		= self.defName,			
    		vid			= self.shipItem and self.shipItem.vid or UI.INVALID_U64_ID,
    		bCompare	= true,
    		logEvent	= _G.MasterServer.PlayerAction.PA_VESSEL_TREE_TOOLTIP,
    	}

	else

    	self.tooltipData =
    	{
        	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
        	caption		= UI:GetStringByName( "ships_promoShip_tooltipCaption" ),
        	text		= UI:GetStringByName( "ships_promoShip_tooltipText" ),
		}

	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateResourceQuestBtn()

	local bNeedBtn = false

	if	not self:WasBought()
		and not self:IsAdvert()
		and not self:IsLocked() then

		local quesdtId = UI:GetResourceQuestForShip( self.defName )
		if quesdtId ~= -1 then

			local questState = UI:GetQuestState( quesdtId, nil )
			if questState.bVisible and questState.bCanBeTaken then
				bNeedBtn = true
			end

		end

	end

	if bNeedBtn then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )		
		UI:AddChildAndLink( self, self.resourceQuestBtn, mainEffect, self.effectInfo.main.resourceQuestBtnLocator, UI.EffectAnimParams.POS )
	else
		self.resourceQuestBtn:UnlinkFromParent()
	end	

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateAdvertBtn()

	local bNeedAdvertBtn =
		not self:IsBought()
		and UI:GetShipAdvertLink( self.defName ) ~= ""

	if bNeedAdvertBtn then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.advertBtn, mainEffect, self.effectInfo.main.advertBtnLocator, UI.EffectAnimParams.POS )
	else
		self.advertBtn:UnlinkFromParent()
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:UpdateMouseOver()

	local bMouseOver = false

	if	self.defName ~= ""
		and self:IsBought()
		and not self:IsInBattle()
		and not self:IsOnMatchmaking()
		and not self:IsOnShipQuest()
		and not( UI.ShipsTreeWnd:GetShipQuest() ~= -1 and not self:IsFitForShipQuest() )
		and not UI:IsShipDisabledByTime( self.defName ) then
		
			local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
			bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipsTreeWnd.sounds.shipSlotMouseOver )
	end

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- некупленный и запрещенный для покупки
function UI.ShipsTree_Tree_ShipSlotWnd:IsLocked()
	
	if not self:IsBought() then
	
		-- SC-111975
		if UI:IsShipDisabledByTime( self.defName ) then
			return true
		end
		
		-- если был куплен хотя бы раз, то повторно можно купить всегда;
		-- dlc можно купить всегда

		if not self:WasBought() and not UI:IsShipDlc( self.defName ) then

			-- аккаунт-ранг
			if not UI:IsEnoughAccountRankForItem( self.defName ) then
				return true
			end

			-- хотя бы один из кораблей, от которых зависит данный, должен быть куплен и прокачан до определенного уровня синергии
			if UI:IsShipLockedByDependancy( self.defName ) then
				return true
			end

		end
		
	end

	return false

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:IsInBattle()

	return
		self:IsBought()
		and UI:IsShipInBattle( self.shipItem )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:IsOnMatchmaking()

	return
		self:IsBought()
		and UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE
		and UI:GetShipBattleSlot( self.shipItem ) ~= -1

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:IsOnShipQuest()

	return 
		self:IsBought()
		and UI:IsShipOnShipQuest( self.shipItem )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:InitLinks()

	if self.inLinksSorted then
		return
	end

	self.inLinksSorted			= {}
	self.outLinksSorted			= {}
	self.inLinksCenterDefName	= ""
	self.outLinksCenterDefName	= ""

	local ships		= UI.ShipsTreeWnd:GetShips()
	local shipData	= ships[ self.defName ]

	if shipData then
		self.inLinksSorted	= UI:CopyTable2( shipData.in_links )
		self.outLinksSorted	= UI:CopyTable2( shipData.out_links )
	end

	local selfX = self:GetParent():XToScreen( self:GetLeft() )

	local otherSlotsPositions = {}

	local shipsWnd = UI[ self.shipsWndName ]

	for idx, defName in pairs( self.inLinksSorted ) do
	
		local otherSlotWnd = shipsWnd and shipsWnd.GetShipSlot and shipsWnd:GetShipSlot( defName )
		if otherSlotWnd then
		
			local otherSlotX = otherSlotWnd:GetParent():XToScreen( otherSlotWnd:GetLeft() )		
			local otherSlotY = otherSlotWnd:GetParent():YToScreen( otherSlotWnd:GetTop() )		
			otherSlotsPositions[ defName ] = Vec2( otherSlotX, otherSlotY )
			
			if math.abs( otherSlotX - selfX ) < 1e-3 then
				self.inLinksCenterDefName = defName
			end
			
		end
		
	end
	
	for idx, defName in pairs( self.outLinksSorted ) do
	
		local otherSlotWnd = shipsWnd and shipsWnd.GetShipSlot and shipsWnd:GetShipSlot( defName )
		if otherSlotWnd then
		
			local otherSlotX = otherSlotWnd:GetParent():XToScreen( otherSlotWnd:GetLeft() )		
			local otherSlotY = otherSlotWnd:GetParent():YToScreen( otherSlotWnd:GetTop() )
			otherSlotsPositions[ defName ] = Vec2( otherSlotX, otherSlotY )
			
			if math.abs( otherSlotX - selfX ) < 1e-3 then
				self.outLinksCenterDefName = defName
			end
			
		end
		
	end

	local function fnSort( defName1, defName2 )

		local pos1 = otherSlotsPositions[ defName1 ] or UI:ZeroVec2()
		local pos2 = otherSlotsPositions[ defName2 ] or UI:ZeroVec2()

		if math.abs( pos1.x - pos2.x ) > 1e-3 then
			return pos1.x < pos2.x
		else
			return pos1.y < pos2.y		-- #0062918,комм.(0257873)
		end		

	end

	table.sort( self.inLinksSorted, fnSort )
	table.sort( self.outLinksSorted, fnSort )	

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:GetLinkX( otherSlot, links, linksX_min, linksX_max, centerLinkDefName )
	
	local linkX				= 0	

	local selfX 			= self:GetParent():XToScreen( self:GetLeft() )
	local otherSlotX		= otherSlot:GetParent():XToScreen( otherSlot:GetLeft() )		
	local numLinks			= #links

	if math.abs( otherSlotX - selfX ) < 1e-3 or numLinks == 1 then
	
		linkX = UI:Lerp( linksX_min, linksX_max, 0.5 )
		
	else

		local linkIdx			= -1
		local centerLinkIdx		= -1
		local linkIdx_min		= -1
		local linkIdx_max		= -1
		local x_min				= 0
		local x_max				= 0
		local otherSlotDefName	= otherSlot:GetDefName()
		
		for idx, defName in ipairs( links ) do
		
			if defName == otherSlotDefName then
				linkIdx = idx
			end
			
			if defName == centerLinkDefName then
				centerLinkIdx = idx
			end

		end
	
		if centerLinkDefName == "" then

			linkIdx_min	= 1
			linkIdx_max	= numLinks		
			x_min		= linksX_min
			x_max		= linksX_max			
		
		else
		
			local x_center = UI:Lerp( linksX_min, linksX_max, 0.5 )
		
			if otherSlotX < selfX then

				linkIdx_min	= 1
				linkIdx_max	= centerLinkIdx
				x_min		= linksX_min
				x_max		= x_center

			else

				linkIdx_min	= centerLinkIdx
				linkIdx_max	= numLinks
				x_min		= x_center
				x_max		= linksX_max

			end
			
		end
		
		local t = ( linkIdx_max ~= linkIdx_min ) and ( linkIdx - linkIdx_min ) / ( linkIdx_max - linkIdx_min ) or 0
		linkX = UI:Lerp( x_min, x_max, t )	
		
	end

	return linkX

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:IsAdvert()

	return not self:WasBought() and UI:IsShipAdvert( self.defName )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:IsFitForShipQuest()

	local questId = UI.ShipsTreeWnd:GetShipQuest()
	if questId == -1 then
		return false
	end

	if UI:IsShipQuestTaken( questId ) then
		return false
	end

	if not self:IsBought() then
		return false
	end

	if UI:IsShipInBattle( self.shipItem ) then
		return false
	end

	if UI:IsShipInMatchmaking( self.shipItem ) then
		return false
	end

	if UI:IsShipOnShipQuest( self.shipItem ) then
		return false
	end
	
	if UI:IsShipDisabledByTime( self.defName ) then
		return false
	end

	local shipRank			= UI:GetShipRank( self.defName )
	local questMinShipRank	= UI:GetShipQuestMinShipRank( questId )
	local questMaxShipRank	= UI:GetShipQuestMaxShipRank( questId )

	if questMinShipRank ~= -1 and ( shipRank == -1 or shipRank < questMinShipRank ) then
		return false
	end

	if questMaxShipRank ~= -1 and ( shipRank == -1 or shipRank > questMaxShipRank ) then
		return false
	end

	return true

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:IsRecommendedForShipQuest()

	if not self:IsFitForShipQuest() then
		return false
	end

	local shipRole = UI:GetItemRole( self.shipItem.defName )	
	local roles = UI.ShipsTreeWnd:GetShipQuestRecommendedRoles()

	if not roles[ shipRole ] then
		return false
	end

	return true

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:NeedRecommendedForShipQuestEffect()

	return
		self:IsRecommendedForShipQuest()
		and not UI.ShipsTreeWnd:HasQuestShip( self.shipItem.vid ) 

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local nameEffect	= UI:GetEffectFromLayer( self, self.layers.SHIP_NAME_EFFECT )

	local firstInLinkPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.linkLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local lasttInLinkPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.linkLocatorPrefix, 3 ) ) or Vec2( 0, 0 )
	local firstOutLinkPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.linkLocatorPrefix, 4 ) ) or Vec2( 0, 0 )
	local lasttOutLinkPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.linkLocatorPrefix, 6 ) ) or Vec2( 0, 0 )
	local selfSize			= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local nameEffectPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.nameLocator ) or Vec2( 0, 0 )
	local namePos			= nameEffect and nameEffect:GetObjPos( self.effectInfo.shipName.nameLocator ) or Vec2( 0, 0 )
	local nameSize			= nameEffect and nameEffect:GetObjSize( self.effectInfo.shipName.nameLocator ) or Vec2( 0, 0 )

    self.inLinksX_min			= firstInLinkPos.x
    self.inLinksX_max			= lasttInLinkPos.x
    self.inLinksY				= firstInLinkPos.y
    self.outLinksX_min			= firstOutLinkPos.x
    self.outLinksX_max			= lasttOutLinkPos.x
	self.space_name_outLinks	= firstOutLinkPos.y - ( nameEffectPos.y + namePos.y + nameSize.y )

	self:SetWidth( selfSize.x )
	self:SetLayerWidth( nameSize.x, self.layers.SHIP_NAME )

end


--
function UI.ShipsTree_Tree_ShipSlotWnd:RecalcLayout()

	local btns = {}
	if self.buyBtn and self.buyBtn:IsChildOf( self ) then
		table.insert( btns, self.buyBtn )
	end
	if self.buyBtn2 and self.buyBtn2:IsChildOf( self ) then
		table.insert( btns, self.buyBtn2 )
	end

	local numBtns = #btns

	local shipPartsBtn = nil
	for btnIdx, btn in ipairs( btns ) do
		if UI:IsWndKindOf( btn, "ShipsTree_PriceBtn" ) and btn:GetMode() == UI.ShipsTree_PriceBtn.modes.SHIP_PARTS then
			shipPartsBtn = btn
			break
		end
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )


	-- позиции кнопок покупки

	for btnIdx, btn in pairs( btns ) do

		local btnLocator =
			( numBtns == 1 or btn == shipPartsBtn )
				and self.effectInfo.main.buyBtnLocator
				or self.effectInfo.main.buyBtn2Locator 

    	if mainEffect then

    		local uiHandle = btn:GetUiHandle()
    		mainEffect:UnlinkWnd( uiHandle, "" )
    		mainEffect:LinkWnd( uiHandle, btnLocator, UI.EffectAnimParams.POS )

    	end		

	end


	-- позиция имени	

	local nameLocator = numBtns > 1 and self.effectInfo.main.name2Locator or self.effectInfo.main.nameLocator

	if mainEffect then

		local uiHandle = self:GetUiHandle()
		mainEffect:UnlinkLayer( uiHandle, self.layers.SHIP_NAME_EFFECT, "" )
		mainEffect:LinkLayer( uiHandle, self.layers.SHIP_NAME_EFFECT, nameLocator, UI.EffectAnimParams.POS )		

	end


	-- высота имени

	local nameFormatRect = Quat( 0, 0, self:GetLayerWidth( self.layers.SHIP_NAME ), 1000000 )

    local nameHeight = _G.MeasureText(
   		self:GetText( self.layers.SHIP_NAME ),
   		self:GetFont( self.layers.SHIP_NAME ),
    	nameFormatRect,
   		self:GetTextFormatFlags( self.layers.SHIP_NAME ),
    	nameFormatRect ).w

	self:SetLayerHeight( nameHeight, self.layers.SHIP_NAME )
	

	-- собственная высота

	local selfHeight = self:GetLayerTop( self.layers.SHIP_NAME ) + nameHeight
	self:SetHeight( selfHeight )

end


-- ------------------------------------------------------------
-- UI.ShipsTree_PriceBtn
-- ------------------------------------------------------------

UI.ShipsTree_PriceBtn = {}

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )
                            	
-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_PriceBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "ShipsTree_PriceBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = l_numBaseBtnLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- PRICE
		{
			id				= l_numBaseBtnLayers,

			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_PriceBtn:SetupPrice( defName )

	self:Reset()

	self.mode		= self.modes.PRICE
	self.defName	= defName

	self:UpdateText()

end


--
function UI.ShipsTree_PriceBtn:SetupShipParts( defName )

	self:Reset()

	self.mode		= self.modes.SHIP_PARTS
	self.defName	= defName

	self:UpdateText()

end


--
function UI.ShipsTree_PriceBtn:SetupInactive( defName )

	self:Reset()

	self.mode		= self.modes.INACTIVE
	self.defName	= defName

	self:UpdateText()

end


--
function UI.ShipsTree_PriceBtn:GetMode()

	return self.mode

end


--
function UI.ShipsTree_PriceBtn:GetDefName()

	return self.defName

end


--
function UI.ShipsTree_PriceBtn:Reset()

	self.mode		= -1
	self.defName	= ""

	self.priceMetaText:SetText( "", true )

end


--
function UI.ShipsTree_PriceBtn:OnPlayerCreditsChanged()

	if self.mode ~= self.modes.PRICE then
		return
	end

	self:UpdateText()

end


--
function UI.ShipsTree_PriceBtn:OnAccountAurasChanged()

	if self.mode ~= self.modes.PRICE then
		return
	end

	self:UpdateText()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_PriceBtn.layers =
{
    MAIN_EFFECT	= 0,
	DEBUG		= 1,
    PRICE		= 2,
}

UI.ShipsTree_PriceBtn.effectInfo =
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

UI.ShipsTree_PriceBtn.modes =
{
	PRICE		= 1,
	SHIP_PARTS	= 2,
	INACTIVE	= 3,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_PriceBtn.defName		= ""
UI.ShipsTree_PriceBtn.priceMetaText	= nil
UI.ShipsTree_PriceBtn.mode			= -1

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_PriceBtn:F_PostLoad()

	UI.EffectButtonWnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.priceMetaText = UI.MetaText.GetNewInstance()
	self.priceMetaText:InitFromLayer( self, self.layers.PRICE )

end


--
function UI.ShipsTree_PriceBtn:F_Shutdown()

	if self.priceMetaText then
		self.priceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipsTree_PriceBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipsTree_PriceBtn:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ShipsTree_PriceBtn:UpdateMetaTextPos()

	self.priceMetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE )

end


--
function UI.ShipsTree_PriceBtn:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE then
		self.priceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipsTree_PriceBtn:UpdateMetaTextColor()

	self.priceMetaText:SetColor( self:GetColor( self.layers.PRICE ) )

end


--
function UI.ShipsTree_PriceBtn:UpdateText()

	self.priceMetaText:SetText( "", true )
	self:UpdateMetaTextColor()

	if self.mode == self.modes.INACTIVE then

		self.priceMetaText:SetText( UI:GetStringByName( "shipsTree_inactiveBtn" ), true )

	elseif self.mode == self.modes.PRICE then

		local price, bGold = UI:GetShopBuyPriceByDef( self.defName, false, true, true )

    	local priceInfo = {}

    	priceInfo.priceType 	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS
    	priceInfo.val			= price
    	priceInfo.bIsBuyPrice	= true
    	priceInfo.basePrice		= price

    	local strPrice = UI:PriceInfo2Str( priceInfo, self.priceMetaText:GetColor(), false, nil, true, nil )
    	self.priceMetaText:SetText( strPrice, true )

	elseif self.mode == self.modes.SHIP_PARTS then

		local str = ""

    	local resourceDefName, needRecourceCount = UI:GetShipPartsForShip( self.defName )
    	if resourceDefName ~= "" then

    		local isResourceCount = UI:GetPlayerResourceCount( resourceDefName )

        	local priceInfo = {}

        	priceInfo.priceType 	= UI.exPriceTypes.SHIP_PARTS
        	priceInfo.val			= needRecourceCount
    		priceInfo.defName		= resourceDefName
        	priceInfo.bIsBuyPrice	= true
        	priceInfo.basePrice		= needRecourceCount
    		priceInfo.valAsString	= string.format( "%s/%s", UI:Num2StrSeparatedBy3( isResourceCount ), UI:Num2StrSeparatedBy3( needRecourceCount ) )

        	str = UI:PriceInfo2Str( priceInfo, self.priceMetaText:GetColor(), false, false, true, nil )

    	else
    		sys.log( "UI.ShipsTree_PriceBtn:UpdateText()[ERROR]: no resource price found for ship" )
    	end

		self.priceMetaText:SetText( str, true )

	end

end


-- перегрузка функции из UI.EffectButtonWnd, чтобы наведение на ссылку-цену не сбрасывало выделение с кнопки;
-- а также для апдейта цвета метатекста в зависимости от анимации
function UI.ShipsTree_PriceBtn:UpdateEffectAnimation()

	if UI:IsInRemovingAllWindows() then
		return
	end	

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local mouseState = self:GetMouseState()
	local animation = ""
	local curAnimation = mainEffect:GetCurAnimation()
	local bHasFocus = UI:GetKeyboardFocus() == self:GetUiHandle()

	local bMouseIn = mouseState == UI.MOUSE_IN or mouseState == UI.MOUSE_DOWN
	if not bMouseIn then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseIn = wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) )
	end

	if self.pressTimer ~= -1 then
		animation = self.effectInfo.main.animationPressed

	elseif self:HasStyle( UI.WS_GRAYED ) or self:HasStyle( UI.WS_DISABLE ) then
		animation = self.effectInfo.main.animationDisabled

	elseif mouseState == UI.MOUSE_DOWN then
		animation = bHasFocus and self.effectInfo.main.animationPressed_focus or self.effectInfo.main.animationPressed
		self.pressTimer = self.PRESS_TIME

	elseif bMouseIn then
		animation = bHasFocus and self.effectInfo.main.animationSelect_focus or self.effectInfo.main.animationSelect

	else
		animation = bHasFocus and self.effectInfo.main.animationIdle_focus or self.effectInfo.main.animationIdle
	end

	if animation and animation ~= "" and animation ~= curAnimation then
		mainEffect:StartAnimation( animation )
		self:UpdateMetaTextColor()
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_PriceBtn_credits, UI.ShipsTree_PriceBtn_gold
-- ------------------------------------------------------------

--
UI.ShipsTree_PriceBtn_credits =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "ShipsTree_PriceBtn",

    	props =
		{
			name		= "ShipsTree_PriceBtn_credits",
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
    				defName 			= "shipsTree_shipSlot_creditsPriceBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self154",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "name1",
    						layer		= "UI.ShipsTree_PriceBtn.layers.PRICE",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
    }
}


--
UI.ShipsTree_PriceBtn_gold =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "ShipsTree_PriceBtn",

    	props =
		{
			name		= "ShipsTree_PriceBtn_gold",
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
    				defName 			= "shipsTree_shipSlot_goldPriceBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "name6",
    						layer		= "UI.ShipsTree_PriceBtn.layers.PRICE",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
    }
}

-- ------------------------------------------------------------
-- UI.ShipsTree_DlcBtn
-- ------------------------------------------------------------

UI.ShipsTree_DlcBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_DlcBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn15",

	props =
	{
		name		= "ShipsTree_DlcBtn",
		isPrototype	= true,
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_DlcBtn:Setup( dlcName )

	self:Reset()

	self.dlcName = dlcName
	self:UpdateTooltip()

end


--
function UI.ShipsTree_DlcBtn:Reset()

	self.dlcName		= ""
	self.tooltipData	= nil

end


--
function UI.ShipsTree_DlcBtn:GetDlcName()

	return self.dlcName
	
end


--
function UI.ShipsTree_DlcBtn:GetTooltipData()

	return self.tooltipData

end

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_DlcBtn.textId	= "ships_marketPlace_STEAM_BUNDLE"

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_DlcBtn.dlcName		= ""
UI.ShipsTree_DlcBtn.tooltipData	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_DlcBtn:UpdateTooltip()

	if _G.Arc_IsInitialized() then

		local bundleDefName = UI:GetDlcArcBundle( self.dlcName )

		local textColor = UI.TEXT_BASE_COLOR

		local hToltipWnd = UI:GetDefaultTooltipWnd( UI.tooltipTypes.TEXT_LARGE )
		if hToltipWnd ~= UI.INVALID_UI_HANDLE then
			local tooltipWnd = UI:GetUiObjByHandleT( hToltipWnd )
    		if tooltipWnd and tooltipWnd.GetTextColor then
    			textColor = tooltipWnd:GetTextColor()
    		end
		end

		self.tooltipData = {}
		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= UI:GetEntityLocalizedNameByDef( bundleDefName, true, false, true, true )
		self.tooltipData.text			= UI:GetBundleDesc( bundleDefName, false, textColor )

	else

		local dlcLocalizedName = UI:GetDlcLocalizedName( self.dlcName )

		local caption = UI:GetStringByName( "shipDlcTooltip_caption" )
		caption = string.gsub( caption, "%$dlc_name%$", dlcLocalizedName )

		local textId = string.format( "dlc_%s_desc", self.dlcName )
		local text = UI:GetStringByName( textId )

		self.tooltipData = {}
		self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption		= caption
		self.tooltipData.text			= text

	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_DlcBtn
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_DlcBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipsTree_DlcBtn",

		props =
		{
			name		= "ShipsTree_EvolvingEdit_DlcBtn",
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
					defName 			= "textBtn13",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "title_1",
							layer		= "UI.ShipsTree_EvolvingEdit_DlcBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
						},
					}
				}}
			},
		}
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_CraftBtn
-- ------------------------------------------------------------

UI.ShipsTree_CraftBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_CraftBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn",

	props =
	{
		name		= "ShipsTree_CraftBtn",
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
				defName 			= "shipsTree_shipSlot_craftBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name6",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_CraftBtn:SetInactive()

	self.bInactive = true
	self:UpdateText()

end


--
function UI.ShipsTree_CraftBtn:IsInactive()

	return self.bInactive

end


--
function UI.ShipsTree_CraftBtn:Reset()

	self.bInactive = false
	self:UpdateText()

end


-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_CraftBtn.bInactive = false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_CraftBtn:F_PostLoad()

	UI.TextBtn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end      

	self:Reset()

end


--
function UI.ShipsTree_CraftBtn:UpdateText()

	local str = self.bInactive and UI:GetStringByName( "shipsTree_inactiveBtn" ) or UI:GetStringByName( "shipCraft_craftBtn" )
	self:SetText( str, self.layers.TEXT )

end


-- ---------------------------------------------------------------------------------
-- UI.ShipsTree_QuestIcoWnd
-- ---------------------------------------------------------------------------------

UI.ShipsTree_QuestIcoWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipsTree_QuestIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_QuestIcoWnd",
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
				defName 			= "shipsTree_shipSlot_onQuest",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self151",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},
	}
}

-- ------------------------------
-- interface funcions
-- ------------------------------

--
function UI.ShipsTree_QuestIcoWnd:Setup( questId )

	if type( questId ) ~= "number" then
		sys.log( "UI.ShipsTree_QuestIcoWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"questId\"); \"number\" expected, got \"%s\"", type( questId ) )
		return
	end

	self:Reset()

	self.questId = questId

	self:FullUpdate()

end


--
function UI.ShipsTree_QuestIcoWnd:Reset()

	self.questId		= -1
	self.tooltipData	= nil
	self.bPrevCompleted	= false
	self.prevTimeLeft	= 0

end


--
function UI.ShipsTree_QuestIcoWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipsTree_QuestIcoWnd.strTimeLeftLabel	= UI:GetStringByName( "shipQuestIcoTooltip_timeLeft" )

UI.ShipsTree_QuestIcoWnd.layers =
{
	MAIN_EFFECT	= 0,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ShipsTree_QuestIcoWnd.questId		= -1
UI.ShipsTree_QuestIcoWnd.tooltipData	= nil
UI.ShipsTree_QuestIcoWnd.bPrevCompleted	= false
UI.ShipsTree_QuestIcoWnd.prevTimeLeft	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipsTree_QuestIcoWnd:FullUpdate()

	self:UpdateTooltip( true )

end


--
function UI.ShipsTree_QuestIcoWnd:UpdateTooltip( bForce )

	if self.questId == -1 then
		self.tooltipData = nil
		return
	end

	if not self.tooltipData then

    	self.tooltipData = {}

    	self.tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
    	self.tooltipData.caption		= UI:AvailableShipQuest2Str( self.questId )
		self.tooltipData.text			= ""

		bForce = true

	end

	local tooltipWnd = nil

	if not bForce then

		tooltipWnd = self:GetTooltipWnd()
		if not tooltipWnd then
			return
		end

	end

	local bCompleted = UI:IsShipQuestCompleted( self.questId )

	local timeLeft = 0
	
	if not bCompleted then

		if UI:IsShipQuestTaken( self.questId ) then
			timeLeft = UI:GetShipQuestTimeLeft( self.questId )
		else
			timeLeft = UI:GetShipQuestMaxTime( self.questId )
		end

	end

	if not bForce then	

		if bCompleted == self.bPrevCompleted and timeLeft == self.prevTimeLeft then
			return
		end

	end

	if bCompleted then
		self.tooltipData.text = UI:GetStringByName( "shipQuestIcoTooltip_completed" )		
	else
		local strTimeLeft = UI:Time2Str421( timeLeft )
		self.tooltipData.text = string.format( "%s: %s", self.strTimeLeftLabel, strTimeLeft )
	end
	
	if tooltipWnd then
		tooltipWnd:Setup( self.tooltipData, true )
	end

	self.bPrevCompleted	= bCompleted
	self.prevTimeLeft	= timeLeft

end


--
function UI.ShipsTree_QuestIcoWnd:GetTooltipWnd()

	local tooltipTargetWnd = UI:GetCurTooltipTarget()
	if tooltipTargetWnd ~= self then
		return nil
	end

	return UI:GetCurTooltip()

end


--
function UI.ShipsTree_QuestIcoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.questId ~= -1 then
		self:UpdateTooltip( false )
	end

end

-- ------------------------------------------------------------
-- UI.ShipsTree_ResourceQuestBtn
-- ------------------------------------------------------------

UI.ShipsTree_ResourceQuestBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_ResourceQuestBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "ShipsTree_ResourceQuestBtn",
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
				defName 			= "shipsTree_resourceQuestBtn",
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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_ResourceQuestBtn:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_ResourceQuestBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "idle",
	},
}

UI.ShipsTree_ResourceQuestBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "shipsTree_shipPartsQuestBtn_tooltipCaption" ),
	text		= UI:GetStringByName( "shipsTree_shipPartsQuestBtn_tooltipText" ),	
}

-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_LinksWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_LinksWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_LinksWnd.def =
{
	className = "Wnd",

	props =
	{
		name	= "ShipsTree_Tree_LinksWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_LinksWnd:FullUpdate()

	self:Reset()

	local ships = UI.ShipsTreeWnd:GetShips()

	for dstDefName, dstShipData in pairs( ships ) do

		local dstSlotWnd = UI.ShipsTree_TreeWnd:GetShipSlot( dstDefName )
		if dstSlotWnd then

    		for srcShipIdx, srcDefName in pairs( dstShipData.in_links ) do

				local srcSlotWnd = UI.ShipsTree_TreeWnd:GetShipSlot( srcDefName )
				if srcSlotWnd then

					local linkWnd = self:ObtainFreeLink()
					linkWnd:Setup( srcSlotWnd, dstSlotWnd )

				else
            		sys.log( "UI.ShipsTree_Tree_LinksWnd:FullUpdate()[ERROR]: cannot find slot for ship \"%s\"", srcDefName )
				end

    		end		

		else
            sys.log( "UI.ShipsTree_Tree_LinksWnd:FullUpdate()[ERROR]: cannot find slot for ship \"%s\"", dstDefName )
		end          

	end

	self:RecalcLayout()

end


--
function UI.ShipsTree_Tree_LinksWnd:Reset()

	for linkIdx, linkWnd in pairs( self.curLinks ) do
		linkWnd:Reset()
		linkWnd:UnlinkFromParent()		
	end

	self.curLinks = {}

end


--
function UI.ShipsTree_Tree_LinksWnd:OnOwnedVessels()

	for linkIdx, linkWnd in pairs( self.curLinks ) do
		linkWnd:OnOwnedVessels()
	end

end


--
function UI.ShipsTree_Tree_LinksWnd:OnPlayerAccountRankChanged()

	for linkIdx, linkWnd in pairs( self.curLinks ) do
		linkWnd:OnPlayerAccountRankChanged()
	end

end


--
function UI.ShipsTree_Tree_LinksWnd:OnVesselLevelUp( vid )

	for linkIdx, linkWnd in pairs( self.curLinks ) do
		linkWnd:OnVesselLevelUp( vid )
	end

end


--
function UI.ShipsTree_Tree_LinksWnd:OnShipSlotLayoutChanged( slotWnd )

	for linkIdx, linkWnd in pairs( self.curLinks ) do

		local srcSlotWnd, dstSlotWnd = linkWnd:GetLinkedShipSlots()

		if slotWnd == srcSlotWnd or slotWnd == dstSlotWnd then
			linkWnd:OnLinkedShipSlotLayoutChanged()
		end
		
	end

end


--
function UI.ShipsTree_Tree_LinksWnd:OnShipDisabledByTimeChanged( defName )
	
	for linkIdx, linkWnd in pairs( self.curLinks ) do

		local srcSlotWnd, dstSlotWnd = linkWnd:GetLinkedShipSlots()

		if srcSlotWnd:GetDefName() == defName or dstSlotWnd:GetDefName() == defName then
			linkWnd:OnShipDisabledByTimeChanged()
		end
		
	end

end


-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_LinksWnd.allLinks	= {}
UI.ShipsTree_Tree_LinksWnd.curLinks	= {}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_LinksWnd:ObtainFreeLink()

	local freeLinkWnd = nil

	for linkiIdx, linkWnd in pairs( self.allLinks ) do

		if not linkWnd:IsChildOf( self ) then
			freeLinkWnd = linkWnd
			break
		end

	end

	if not freeLinkWnd then
		freeLinkWnd = self:CreateLink()
	end

	table.insert( self.curLinks, freeLinkWnd )
	self:AddChild( freeLinkWnd )

	return freeLinkWnd

end


--
function UI.ShipsTree_Tree_LinksWnd:CreateLink()

	local linkWnd = UI:CreateChildWnd( self, UI.ShipsTree_Tree_LinkWnd, tostring( #self.allLinks + 1 ) )
	table.insert( self.allLinks, linkWnd )

	return linkWnd

end


--
function UI.ShipsTree_Tree_LinksWnd:RecalcLayout()

	local size = UI.ShipsTree_TreeWnd:GetShipsListSize()

	self:SetWidth( size.x )
	self:SetHeight( size.y )	

end


-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_LinkWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_LinkWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_LinkWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_LinkWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		-- MAIN
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_LinkWnd:Setup( srcSlotWnd, dstSlotWnd )

	self:Reset()

	self.srcSlotWnd	= srcSlotWnd
	self.dstSlotWnd	= dstSlotWnd

	self:FullUpdate()

end


--
function UI.ShipsTree_Tree_LinkWnd:Reset()

	self.srcSlotWnd	= nil
	self.dstSlotWnd	= nil
	self.bLocked	= true

	self:ReleaseParts()

	self:ResetDependLock()

end


--
function UI.ShipsTree_Tree_LinkWnd:GetLinkedShipSlots()

	return self.srcSlotWnd, self.dstSlotWnd

end


--
function UI.ShipsTree_Tree_LinkWnd:OnOwnedVessels()

	self:UpdateLockState()	
	self:UpdateAnimation()
	self:UpdateDependLock()

end


--
function UI.ShipsTree_Tree_LinkWnd:OnPlayerAccountRankChanged()

	if ( self.srcSlotWnd and not self.srcSlotWnd:WasBought() ) or ( self.dstSlotWnd and not self.dstSlotWnd:WasBought() ) then
	
		self:UpdateLockState()	
		self:UpdateAnimation()
		self:UpdateDependLock()
		
	end

end


--
function UI.ShipsTree_Tree_LinkWnd:OnVesselLevelUp( vid )

	-- проапгрейдили корабль-источник или корабль, от которого корабль-источник засисит?
	local upgradedShipItem = UI:GetShipItem( vid, true )    		
    if upgradedShipItem then
	
		if ( self.srcSlotWnd and vid == self.srcSlotWnd:GetVid() ) or UI:IsShipDependFromShip( self.srcSlotWnd:GetDefName(), upgradedShipItem.defName ) then

			self:UpdateLockState()	
			self:UpdateAnimation()
			self:UpdateDependLock()
			
		end
		
	else
		sys.log( "UI.ShipsTree_Tree_LinkWnd:OnVesselLevelUp()[ERROR]: cannot find ship item" )		
	end

end


--
function UI.ShipsTree_Tree_LinkWnd:OnLinkedShipSlotLayoutChanged()

	self:UpdateLayout()
	self:UpdateAnimation()

end


--
function UI.ShipsTree_Tree_LinkWnd:OnShipDisabledByTimeChanged()

	self:UpdateLockState()
	self:UpdateAnimation()
	self:UpdateDependLock()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Tree_LinkWnd.layers =
{
	MAIN	= 0,
}

UI.ShipsTree_Tree_LinkWnd.effectInfo =
{
	effects =
	{
    	hrz			= "shipsTree_link_hrz",
    	vrt			= "shipsTree_link_vrt",
    	lt			= "shipsTree_link_lt",
    	rt			= "shipsTree_link_rt",
    	lb			= "shipsTree_link_lb",
    	rb			= "shipsTree_link_rb",
	},

	part =
	{
		animLocked 		= "inactive",
		animUnlocked	= "active",
	},
}

UI.ShipsTree_Tree_LinkWnd.space_rankLine_hrzLink	= UI:YTo1024x768( 20, { x = 1280, y = 720 } )

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_LinkWnd.srcSlotWnd	= nil
UI.ShipsTree_Tree_LinkWnd.dstSlotWnd	= nil
UI.ShipsTree_Tree_LinkWnd.bLocked		= true
UI.ShipsTree_Tree_LinkWnd.partSize		= Vec2( 0, 0 )
UI.ShipsTree_Tree_LinkWnd.dependLockWnd	= nil

-- ---------------------------------
-- wark functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_LinkWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then

		local partEffect = _G.UI_SpawnEffect( self.effectInfo.effects.hrz, self:GetUiHandle() )
		if partEffect then
			self.partSize = partEffect:GetObjSize( "self" )
			_G.UI_DestroyEffect( partEffect )
		end

	else
		self:CreateControls()
	end

end


--
function UI.ShipsTree_Tree_LinkWnd:CreateControls()

	self.dependLockWnd = UI:CreateChildWnd( self, UI.ShipsTree_Tree_Link_LockWnd, "" )

end


--
function UI.ShipsTree_Tree_LinkWnd:FullUpdate()

	self:UpdateLockState()
	self:UpdateLayout()
	self:UpdateAnimation()
	self:UpdateDependLock()

end


--
function UI.ShipsTree_Tree_LinkWnd:UpdateLockState()

	self.bLocked = true

	if not self.dstSlotWnd or not self.srcSlotWnd then
		return
	end
	
	local srcDefName	= self.srcSlotWnd:GetDefName()
	local dstDefName	= self.dstSlotWnd:GetDefName()

	if not self.srcSlotWnd:IsLocked() then

    	if not self.dstSlotWnd:IsLocked() then
    		self.bLocked = false

    	elseif UI:IsEnoughAccountRankForItem( dstDefName ) and not UI:IsShipDisabledByTime( dstDefName ) then

    		local srcShipItem = UI:GetShipItemByDef( srcDefName, true )
    		if srcShipItem then

    			local dependLevel = UI:GetShipDependLevel( dstDefName, srcDefName )
    			if dependLevel ~= -1 then

    				local srcShipLevel = UI:GetShipLevel( srcShipItem )
    				if srcShipLevel >= dependLevel then
    					self.bLocked = false
    				end

    			else
    				self.bLocked = false
    			end

    		end

		end

	end

end


--
function UI.ShipsTree_Tree_LinkWnd:ReleaseParts()

	local effectsPool = self:GetEffectsPool( self.layers.MAIN )
	if effectsPool then
		effectsPool:Clear()
	end	

end


--
function UI.ShipsTree_Tree_LinkWnd:UpdateLayout()

	self:ReleaseParts()

	if not self.srcSlotWnd or not self.dstSlotWnd then
		return
	end

	local effectsPool = self:GetEffectsPool( self.layers.MAIN )
	if not effectsPool then
		return
	end

	local srcPos	= self.srcSlotWnd:GetOutLinkPos( self.dstSlotWnd )
	local dstPos	= self.dstSlotWnd:GetInLinkPos( self.srcSlotWnd )

	srcPos.x = self.srcSlotWnd:XToScreen( srcPos.x )
	srcPos.y = self.srcSlotWnd:YToScreen( srcPos.y )
	dstPos.x = self.dstSlotWnd:XToScreen( dstPos.x )
	dstPos.y = self.dstSlotWnd:YToScreen( dstPos.y )

	local handle = self:GetUiHandle()

	local distX = math.abs( srcPos.x - dstPos.x )
	local distY = math.abs( srcPos.y - dstPos.y )

	local lockWidth		= self.dependLockWnd:GetWidth()
	local lockHeight	= self.dependLockWnd:GetHeight()

	local spaceLeft	= math.max( self.partSize.x, lockWidth ) * 0.5
	local spaceTop	= math.max( self.partSize.y, lockHeight ) * 0.5

	local selfWidth		= distX + spaceLeft * 2
	local selfHeight	= distY + spaceTop * 2

	self:SetWidth( selfWidth )
	self:SetHeight( selfHeight )

	local minPosX = math.min( srcPos.x, dstPos.x )
	local minPosY = math.min( srcPos.y, dstPos.y )

	local srcPos_local = Vec2( srcPos.x - minPosX + spaceLeft, srcPos.y - minPosY + spaceTop )
	local dstPos_local = Vec2( dstPos.x - minPosX + spaceLeft, dstPos.y - minPosY + spaceTop )

	local dependLockOrg = self.dependLockWnd and self.dependLockWnd:GetOrg() or Vec2( 0, 0 )

	-- только одна вертикаль
	if distX < self.partSize.x or distY < self.partSize.y then

		local vrtHeight = distY
		if vrtHeight > 0 then

    		local vrt = effectsPool:AddEffect( self.effectInfo.effects.vrt, handle )
    		if vrt then
    			vrt:SetScale( UI:Vec2( 1, vrtHeight / self.partSize.y ) )
	    		vrt:SetPos( UI:Vec2( srcPos_local.x - self.partSize.x * 0.5, srcPos_local.y ) )
    		end

		end

		-- замок (посередине вертикали)

		if self.dependLockWnd then

			local lockPos = UI:Vec2( srcPos_local.x - dependLockOrg.x, srcPos_local.y + distY * 0.5 - dependLockOrg.y )
			self.dependLockWnd:SetLeft( lockPos.x )
			self.dependLockWnd:SetTop( lockPos.y )

		end

	-- полный набор
	else

		-- вертикали

		local dstRank		= UI:GetShipRank( self.dstSlotWnd:GetDefName() )
		local rankSlotWnd	= UI.ShipsTree_TreeWnd:GetRankSlot( dstRank )
		local rankSlotY		= rankSlotWnd:GetParent():YToScreen( rankSlotWnd:GetTop() )

		local vrt1Hight	= ( rankSlotY + self.space_rankLine_hrzLink ) - srcPos.y - self.partSize.y * 0.5
		if vrt1Hight > 0 then

    		local vrt1 = effectsPool:AddEffect( self.effectInfo.effects.vrt, handle )
    		if vrt1 then
    			vrt1:SetScale( UI:Vec2( 1, vrt1Hight / self.partSize.y ) )
	    		vrt1:SetPos( UI:Vec2( srcPos_local.x - self.partSize.x * 0.5, srcPos_local.y ) )
    		end

		end

		local vrt2Hight = ( dstPos.y - srcPos.y ) - vrt1Hight - self.partSize.y
		if vrt2Hight > 0 then

    		local vrt2 = effectsPool:AddEffect( self.effectInfo.effects.vrt, handle )
    		if vrt2 then
    			vrt2:SetScale( UI:Vec2( 1, vrt2Hight / self.partSize.y ) )
        		vrt2:SetPos( UI:Vec2( dstPos_local.x - self.partSize.x * 0.5, dstPos_local.y - vrt2Hight ) )
    		end

		end


		-- горизонталь

		local hrzWidth = distX - self.partSize.x
		if hrzWidth > 0 then

    		local hrz = effectsPool:AddEffect( self.effectInfo.effects.hrz, handle )
    		if hrz then
    			hrz:SetScale( UI:Vec2( hrzWidth / self.partSize.x, 1 ) )
	    		hrz:SetPos( UI:Vec2( ( selfWidth - hrzWidth ) * 0.5, srcPos_local.y + vrt1Hight ) )
    		end

		end


		-- углы

		local cornerName1 = srcPos.x > dstPos.x and self.effectInfo.effects.rb or self.effectInfo.effects.lb
		local cornerName2 = srcPos.x > dstPos.x and self.effectInfo.effects.lt or self.effectInfo.effects.rt

		local corner1 = effectsPool:AddEffect( cornerName1, handle )
		if corner1 then
			corner1:SetPos( UI:Vec2( srcPos_local.x - self.partSize.x * 0.5, srcPos_local.y + vrt1Hight ) )
		end

		local corner2 = effectsPool:AddEffect( cornerName2, handle )
		if corner2 then
			corner2:SetPos( UI:Vec2( dstPos_local.x - self.partSize.x * 0.5, dstPos_local.y - vrt2Hight - self.partSize.y ) )
		end


		-- замок (посередине горизонтали)

		if self.dependLockWnd then

			local lockPos = UI:Vec2( ( srcPos_local.x + dstPos_local.x ) * 0.5 - dependLockOrg.x, srcPos_local.y + vrt1Hight + self.partSize.y * 0.5 - dependLockOrg.y )
			self.dependLockWnd:SetLeft( lockPos.x )
			self.dependLockWnd:SetTop( lockPos.y )

		end

	end


	-- позиция внутри родительского окна

	self:SetLeft( self:XToParent( self:XToWindow( srcPos.x - srcPos_local.x ) ) )
	self:SetTop( self:YToParent(  self:YToWindow( srcPos.y - srcPos_local.y ) ) )

end


--
function UI.ShipsTree_Tree_LinkWnd:UpdateAnimation()

	local effectsPool = self:GetEffectsPool( self.layers.MAIN )
	if not effectsPool then
		return
	end

	local animName = self.bLocked and self.effectInfo.part.animLocked or self.effectInfo.part.animUnlocked

	for idx = 0, effectsPool:GetNumEffects() - 1 do

		local effect = effectsPool:GetEffectById( idx )
		if effect then
			effect:StartAnimation( animName )
		end

	end

end


--
function UI.ShipsTree_Tree_LinkWnd:UpdateDependLock()

	self:ResetDependLock()

	if not self.bLocked then
		return
	end

	if not self.srcSlotWnd or not self.dstSlotWnd then
		return
	end

	if self.srcSlotWnd:IsLocked() then
		return
	end

	local srcDefName	= self.srcSlotWnd:GetDefName()
	local dstDefName	= self.dstSlotWnd:GetDefName()

	local dependLevel = UI:GetShipDependLevel( dstDefName, srcDefName )
	if dependLevel == -1 then
		return		
	end
	
	if UI:IsShipDisabledByTime( dstDefName ) then
		return
	end

	self:AddChild( self.dependLockWnd )

	local srcShipLevel = 0

	local srcShipItem = UI:GetShipItemByDef( srcDefName, true )
	if srcShipItem then
		srcShipLevel = UI:GetShipLevel( srcShipItem )
	end

	self.dependLockWnd:Setup( srcShipLevel, dependLevel )

end


--
function UI.ShipsTree_Tree_LinkWnd:ResetDependLock()

	self.dependLockWnd:Reset()
	self.dependLockWnd:UnlinkFromParent()

end


-- ------------------------------------------------------------
-- UI.ShipsTree_Tree_Link_LockWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree_Link_LockWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree_Link_LockWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "ShipsTree_Tree_Link_LockWnd",
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
				defName 			= "shipsTree_link_lock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},	

					{
						objName		= "text",	
						layer		= "UI.ShipsTree_Tree_Link_LockWnd.layers.LEVEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},	
				}
			}}

		},

		-- LEVEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},		
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.ShipsTree_Tree_Link_LockWnd:Setup( curLevel, needLevel )

	self.curLevel 		= curLevel
	self.needLevel		= needLevel

	self:UpdateLevelText()
	self:UpdateTooltip()

end


--
function UI.ShipsTree_Tree_Link_LockWnd:Reset()

	self.curLevel 		= 0
	self.needLevel		= 0

	self.tooltipData = nil

	self:SetText( "", self.layers.LEVEL )

end


--
function UI.ShipsTree_Tree_Link_LockWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_Tree_Link_LockWnd:GetOrg()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjPos( self.effectInfo.main.orgLocator ) or Vec2( 0, 0 )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Tree_Link_LockWnd.layers =
{
	MAIN_EFFECT		= 0,
	LEVEL			= 1,
}

UI.ShipsTree_Tree_Link_LockWnd.effectInfo =
{
	main =
	{
		orgLocator	= "center"
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree_Link_LockWnd.curLevel		= 0
UI.ShipsTree_Tree_Link_LockWnd.needLevel		= 0
UI.ShipsTree_Tree_Link_LockWnd.tooltipData	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree_Link_LockWnd:UpdateLevelText()

	local str = string.format( "%d", self.needLevel )
	self:SetText( str, self.layers.LEVEL )

end


--
function UI.ShipsTree_Tree_Link_LockWnd:UpdateTooltip()

	self.tooltipData = {}

	self.tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
	self.tooltipData.caption = UI:GetStringByName( "ship_lockedTooltip_caption" )

	self.tooltipData.text = UI:GetStringByName( "ship_lockedTooltip_text" )

	local strCurLevel	= tostring( self.curLevel )
	local strNeedLevel	= tostring( self.needLevel )

	local tSubst =
	{
		curLevel	= strCurLevel,
		needLevel	= strNeedLevel,
	}

	local numSubst = 0
	self.tooltipData.text, numSubst = string.gsub( self.tooltipData.text, "%$(.-)%$", tSubst )

	if numSubst < 2 then
		sys.log( "UI.ShipsTree_Tree_Link_LockWnd:UpdateTooltip()[ERROR]: invalid placeholders in string \"ship_lockedTooltip_text\"; \"$curLevel$\" and \"$needLevel$\" expected" )
		self.tooltipData.text = string.format( "[INVALID STRING] Previous ship must have synergy level %s. Current level is %s", strNeedLevel, strCurLevel )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_CrossBtn
-- ------------------------------------------------------------

UI.ShipsTree_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn2",

    	props =
    	{
    		name = "ShipsTree_CrossBtn"
    	}
	}
}


-- ------------------------------------------------------------
-- UI.ShipsTree_TradeWnd
-- ------------------------------------------------------------

UI.ShipsTree_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "ShipsTree_TradeWnd",
    	},
	},

	mainWndName = "ShipsTreeWnd",
}

-- ------------------------------------------------------------
-- UI.ShipsTree_BuyWithInventoryWnd
-- ------------------------------------------------------------

UI.ShipsTree_BuyWithInventoryWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWithInventoryWnd",

    	props =
    	{
    		name	= "ShipsTree_BuyWithInventoryWnd",
    	},
	},

	mainWndName = "ShipsTreeWnd",
}

-- ------------------------------------------------------------------------
-- UI.ShipsTree_BuyWnd
-- ------------------------------------------------------------------------

UI.ShipsTree_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "ShipsTree_BuyWnd",
    	},
	},

	mainWndName = "ShipsTreeWnd",
}

-- ------------------------------------------------------------------------
-- UI.ShipsTree_PrestigeWnd
-- ------------------------------------------------------------------------

UI.ShipsTree_PrestigeWnd = {}

-- ------------------------------------
-- window definition
-- ------------------------------------

UI.ShipsTree_PrestigeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipsTree_PrestigeWnd",
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
				defName 			= "ships_prestige",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ico",	
						wnd			= "UI.ShipsTree_Prestige_IcoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "prog2",	
						layer		= "UI.ShipsTree_PrestigeWnd.layers.CAPTION_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CAPTION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "prestigeCaption",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_PrestigeWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
			text			= UI:GetStringByName( "profile_common_prestige" ),
		},
	},

	children = { "UI.ShipsTree_Prestige_IcoWnd" }
}

-- ------------------------------------
-- interface functions
-- ------------------------------------

--
function UI.ShipsTree_PrestigeWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_PrestigeWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	UI.ShipsTree_Prestige_IcoWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_PrestigeWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	UI.ShipsTree_Prestige_IcoWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_PrestigeWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_Prestige_IcoWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

end


--
function UI.ShipsTree_PrestigeWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	UI.ShipsTree_Prestige_IcoWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

end


--
function UI.ShipsTree_PrestigeWnd:GameStore_OnSellVessel( result, requestId, param1, param2 ) 

	UI.ShipsTree_Prestige_IcoWnd:GameStore_OnSellVessel( result, requestId, param1, param2 ) 

end

-- ------------------------------------
-- const
-- ------------------------------------

UI.ShipsTree_PrestigeWnd.layers =
{
    MAIN_EFFECT		= 0,
	CAPTION_EFFECT	= 1,
	CAPTION			= 2,
}

-- ------------------------------------
-- vars
-- ------------------------------------

UI.ShipsTree_PrestigeWnd.tooltipData = { tooltipType = UI.tooltipTypes.PRESTIGE }


-- -------------------------------------------------------------------
-- UI.ShipsTree_Prestige_IcoWnd
-- -------------------------------------------------------------------

UI.ShipsTree_Prestige_IcoWnd =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "PrestigeIcoWnd",

    	props =
    	{
    		name	= "ShipsTree_Prestige_IcoWnd",
    		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,	-- добавлен UI.WS_NOT_MOUSE_REACT
    	}
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_BattleSlotsPanelWnd
-- ------------------------------------------------------------

UI.ShipsTree_BattleSlotsPanelWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_BattleSlotsPanelWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_BattleSlotsPanelWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipsTree_battleSlotsPanel",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.ShipsTree_BattleSlotsPanelWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ship_slots",	
						wnd			= "UI.ShipsTree_BattleSlotsListWnd",
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
			text			= UI:GetStringByName( "shipsTree_battleSlots" ),
		},
	},

	children = { "UI.ShipsTree_BattleSlotsListWnd" }
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_BattleSlotsPanelWnd:FullUpdate()

	UI.ShipsTree_BattleSlotsListWnd:FullUpdate()
	self:UpdateMainAnimation()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:Reset()

	UI.ShipsTree_BattleSlotsListWnd:Clear()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animRegular )
	end

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnBattleSlots()

	UI.ShipsTree_BattleSlotsListWnd:OnBattleSlots()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnOwnedVessels()

	UI.ShipsTree_BattleSlotsListWnd:OnOwnedVessels()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnChangeBattleSlotVessel()

	UI.ShipsTree_BattleSlotsListWnd:OnChangeBattleSlotVessel()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnSwapBattleSlotVessels()

	UI.ShipsTree_BattleSlotsListWnd:OnSwapBattleSlotVessels()

end



--
function UI.ShipsTree_BattleSlotsPanelWnd:OnSellVessel( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnSellVessel( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnRepairBattleVessels()

	UI.ShipsTree_BattleSlotsListWnd:OnRepairBattleVessels()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnRepairVessel( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnRepairVessel( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnRefillBattleVessels()

	UI.ShipsTree_BattleSlotsListWnd:OnRefillBattleVessels()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnRefillMunition( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnRefillMunition( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnVesselEquipment( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnVesselEquipment( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnChangeEquipment( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnChangeEquipment( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnTransferEquipment( vid1, vid2 )

	UI.ShipsTree_BattleSlotsListWnd:OnTransferEquipment( vid1, vid2 )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnStripEquipment( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnStripEquipment( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnChangeMunition( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnChangeMunition( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnTransferMunition( vid1, vid2 )

	UI.ShipsTree_BattleSlotsListWnd:OnTransferMunition( vid1, vid2 )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnPlayerCreditsChanged()

	UI.ShipsTree_BattleSlotsListWnd:OnPlayerCreditsChanged()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnHangarPrepareStateChanged()

	UI.ShipsTree_BattleSlotsListWnd:OnHangarPrepareStateChanged()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnVesselLevelUp( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnVesselLevelUp( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnExtractVesselExp( vids )

	UI.ShipsTree_BattleSlotsListWnd:OnExtractVesselExp( vids )

end



--
function UI.ShipsTree_BattleSlotsPanelWnd:OnSelBattleSlotChanged()

	UI.ShipsTree_BattleSlotsListWnd:OnSelBattleSlotChanged()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnVesselUnlockNode( vid )

	UI.ShipsTree_BattleSlotsListWnd:OnVesselUnlockNode( vid )

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnSelRaceChanged()

	self:UpdateMainAnimation()

end


--
function UI.ShipsTree_BattleSlotsPanelWnd:OnAccountRankChanged()

	UI.ShipsTree_BattleSlotsListWnd:OnAccountRankChanged()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_BattleSlotsPanelWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
}

UI.ShipsTree_BattleSlotsPanelWnd.effectInfo =
{
	main =
	{
		animRegular	= "idle",
		animAlien	= "idle_2",
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_BattleSlotsPanelWnd:UpdateMainAnimation()

	local anim = UI.ShipsTreeWnd:GetSelRace() == ai.Race.CRYSTAL and self.effectInfo.main.animAlien or self.effectInfo.main.animRegular

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_BattleSlotsListWnd
-- ------------------------------------------------------------

UI.ShipsTree_BattleSlotsListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_BattleSlotsListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipsTree_BattleSlotsListWnd",
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
				defName 			= "shipsTree_battleSlotsList",
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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_BattleSlotsListWnd:FullUpdate()

	self:Clear()

	for slotIdx = 0, UI.serverData.battleSlotsMax - 1 do

		local data = {}

		data.shipSlotIdx	= slotIdx
		data.bSlotBought	= false
		data.shipItem		= nil

		if slotIdx < UI.serverData.battleSlotsCount then

			data.bSlotBought = true

			local vid = UI.serverData.battleSlots[ slotIdx + 1 ]
			if vid ~= nil and vid ~= UI.INVALID_U64_ID then
				data.shipItem = UI:GetShipItem( vid, true )
			end

		end

		self:AddRecord( data )

	end	

	self:UpdateSelSlot()

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnBattleSlots()

	self:FullUpdate()

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnOwnedVessels()

	self:FullUpdate()

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnChangeBattleSlotVessel()

	self:FullUpdate()

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnSwapBattleSlotVessels()

	self:FullUpdate()

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnSellVessel( vid )

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx ) 
		if data.shipItem and data.shipItem.vid == vid then

			data.shipItem = nil
			self:SetRecordData( data, recordIdx )

			break

		end
		
	end

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnRepairBattleVessels()

	for recordIdx = 1, self:GetNumRecords() do

    	local data = self:GetRecordData( recordIdx )
    	if data.shipItem then

    		local slotWnd = self:GetButtonForRecord( recordIdx )
    		if slotWnd then
    			slotWnd:OnRepair()
    		end

    	end
		
	end

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnRepairVessel( vid )

	for recordIdx = 1, self:GetNumRecords() do

    	local data = self:GetRecordData( recordIdx )
    	if data.shipItem and data.shipItem.vid == vid then

    		local slotWnd = self:GetButtonForRecord( recordIdx )
    		if slotWnd then
    			slotWnd:OnRepair()
    		end

    		break

    	end

	end

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnRefillBattleVessels()

	self:OnAmmoChanged()

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnRefillMunition( vid )

	self:OnAmmoChanged( vid )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnVesselEquipment( vid )

	self:OnAmmoChanged( vid )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnChangeEquipment( vid )

	self:OnAmmoChanged( vid )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnTransferEquipment( vid1, vid2 )

	self:OnAmmoChanged( vid1 )
	self:OnAmmoChanged( vid2 )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnStripEquipment( vid )

	self:OnAmmoChanged( vid )

end  


--
function UI.ShipsTree_BattleSlotsListWnd:OnChangeMunition( vid )

	self:OnAmmoChanged( vid )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnTransferMunition( vid1, vid2 )

	self:OnAmmoChanged( vid1 )
	self:OnAmmoChanged( vid2 )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnPlayerCreditsChanged()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnPlayerCreditsChanged()
		end
		
	end

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnHangarPrepareStateChanged()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnHangarPrepareStateChanged()
		end
		
	end

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnVesselLevelUp( vid )

	self:OnVesselExpChanged( vid )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnExtractVesselExp( vids )

	for shipIdx, vid in pairs( vids ) do
		self:OnVesselExpChanged( vid )
	end

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnSelBattleSlotChanged()

	self:UpdateSelSlot()

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnVesselUnlockNode( vid )

	self:OnVesselExpChanged( vid )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnAccountRankChanged()

	local additionalSlotWnd = self:GetButtonForRecord( 4 )
	if additionalSlotWnd then
		additionalSlotWnd:OnAccountRankChanged()
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_BattleSlotsListWnd.btnPrototypeName	= "ShipsTree_BattleSlotWnd"
UI.ShipsTree_BattleSlotsListWnd.MAX_SLOTS			= 4
UI.ShipsTree_BattleSlotsListWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.ShipsTree_BattleSlotsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "sh_slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_BattleSlotsListWnd:OnAmmoChanged( vid )

	for recordIdx = 1, self:GetNumRecords() do

    	local data = self:GetRecordData( recordIdx )
    	if data.shipItem then

			if vid then

    			if data.shipItem.vid == vid then

            		local slotWnd = self:GetButtonForRecord( recordIdx )
            		if slotWnd then
            			slotWnd:OnAmmoChanged()
            		end

            		break

				end

			else

        		local slotWnd = self:GetButtonForRecord( recordIdx )
        		if slotWnd then
        			slotWnd:OnAmmoChanged()
        		end

			end

    	end

	end

end


--
function UI.ShipsTree_BattleSlotsListWnd:UpdateSelSlot()

	local selSlotIdx = UI.HangarWnd:GetSelBattleSlot()
	self:SelectRecord( selSlotIdx )

end


--
function UI.ShipsTree_BattleSlotsListWnd:OnVesselExpChanged( vid )

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		if data.shipItem and data.shipItem.vid == vid then

			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnVesselExpChanged()
			end

			break

		end

	end

end


-- ------------------------------------------------------------------------
-- UI.ShipsTree_BattleSlotWnd
-- ------------------------------------------------------------------------

UI.ShipsTree_BattleSlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.ShipsTree_BattleSlotWnd.layers =
{
    MAIN_EFFECT						= 0,
	SHIP_ICO_EFFECT					= 1, 
    BROKEN_EFFECT    				= 2,
	IN_BATTLE_EFFECT				= 3, 
	IN_BATTLE_TEXT      			= 4,  
    SHIP_NAME						= 5,  
	MAX_SYNERGY_EFFECT              = 6, 
    ROLE_EFFECT						= 7,  
    RANK							= 8, 
	RACE_EFFECT						= 9,  
    EMPTY_TEXT						= 10, 
	NOT_BOUGHT_EFFECT				= 11,
	NOT_BOUGHT_TEXT					= 12,
	MOUSE_OVER_EFFECT				= 13,
	SHIP_DD_OVER_EFFECT				= 14,
	MATCHMAKING_EFFECT          	= 15,
	MATCHMAKING_HOURGLASS_EFFECT	= 16,
}

UI.ShipsTree_BattleSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "ShipsTree_BattleSlotWnd",
		isPrototype		= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipsTree_BattleSlotWnd.layers.MATCHMAKING_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "hangar_shipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name_ship",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "gmp_icon",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.ROLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_type_val",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_buy",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.EMPTY_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.SHIP_DD_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_ico",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "fraction_ico",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.RACE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "in_battle",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lock",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.NOT_BOUGHT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "broken",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.BROKEN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "in_battle",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.MATCHMAKING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "role_max",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.MAX_SYNERGY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

				}
			}}
		},

		-- SHIP_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_shipIco",
				defaultAnimation	= "idle",
			}}
		},

		-- BROKEN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
			updatable	= false,

			effects =
			{{
				defName				= "hangar_shipSlot_damageIco",
				defaultAnimation	= "idle",
			}}
		},

		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hangar_shipSlot_inBattle",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_buy",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.IN_BATTLE_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- IN_BATTLE_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^inBattle"
		}, 

		-- SHIP_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- MAX_SYNERGY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_battleSlot_maxSynergy",
				defaultAnimation	= "gold",
			}}
		},

		-- ROLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- RANK
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- RACE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName	= "hangar_shipSlot_faction",
				defaultAnimation	= "idle",
			}}
		},

		-- EMPTY_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = UI:GetStringByName( "hangar_selectShip" ),
		},

		-- NOT_BOUGHT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_lock",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "text",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.NOT_BOUGHT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- NOT_BOUGHT_TEXT
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "hangar_shipSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},   

		-- SHIP_DD_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "hangar_shipSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},   

		-- MATCHMAKING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hangar_shipSlot_matchmaking",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "waiting",
						layer		= "UI.ShipsTree_BattleSlotWnd.layers.MATCHMAKING_HOURGLASS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MATCHMAKING_HOURGLASS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hourglass",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.ShipsTree_BattleSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self.tooltipData = nil

	for layer = 0, self:GetNumLayers() - 1 do
		if layer ~= self.layers.MAIN_EFFECT then
			self:SetLayerVisible( false, layer )
		end 
	end

	self.maintenanceIcoWnd:UnlinkFromParent()
	self.levelUpIcoWnd:UnlinkFromParent()

end


--
function UI.ShipsTree_BattleSlotWnd:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	self:UpdateMainAnimation( data )

end


--
function UI.ShipsTree_BattleSlotWnd:OnRepair()

	local data = self:GetRecordData()

	if not data.shipItem then
		return
	end

	self:UpdateBrokenEffect( data )
	self:UpdateMaintenanceIco( data )

end


--
function UI.ShipsTree_BattleSlotWnd:OnAmmoChanged()

	local data = self:GetRecordData()

	if not data.shipItem then
		return
	end

	self:UpdateMaintenanceIco( data )

end


--
function UI.ShipsTree_BattleSlotWnd:OnPlayerCreditsChanged()

	local data = self:GetRecordData()

	if not data.shipItem then
		return
	end

	if self.maintenanceIcoWnd:IsChildOf( self ) then
		self.maintenanceIcoWnd:UpdateTooltip()
	end

	self:UpdateLevelUpIco( data )

end


--
function UI.ShipsTree_BattleSlotWnd:OnHangarPrepareStateChanged()

	local data = self:GetRecordData()
	self:UpdateMatchmakingEffect( data )

end


--
function UI.ShipsTree_BattleSlotWnd:OnVesselExpChanged()

	local data = self:GetRecordData()

	if not data.shipItem then
		return
	end

	self:UpdateLevelUpIco( data )
	self:UpdateMaxSynergyEffect( data )

end


--
function UI.ShipsTree_BattleSlotWnd:OnAccountRankChanged()

	self:UpdateMouseOver()
	
end


--
function UI.ShipsTree_BattleSlotWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_BattleSlotWnd:GetShipDDData()

	local data = self:GetRecordData()

	if	not data.shipItem
		or UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE
		or UI.ShipsTreeWnd:IsWaiting() then
			return nil
	end

	local ddData =
	{
		srcType		= UI.ShipDDWnd.srcTypes.BATTLE_SLOT,
		vid			= data.shipItem.vid,
	}

	return ddData

end


--
function UI.ShipsTree_BattleSlotWnd:OnShipDDOver( bOver, ddData )	

	if bOver then
		self:SetLayerVisible( self:IsShipDDFit( ddData ), self.layers.SHIP_DD_OVER_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.SHIP_DD_OVER_EFFECT )
	end

end


--
function UI.ShipsTree_BattleSlotWnd:IsShipDDFit( ddData )

	if UI.ShipsTreeWnd:IsWaiting() then
		return false
	end

	if UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE then
		return false
	end

	if UI:IsShipOnShipQuestByVid( ddData.vid ) then
		return false
	end

	local data = self:GetRecordData()

	if not data.bSlotBought then
		return false
	end

	if data.shipItem and ddData.vid == data.shipItem.vid then
		return false
	end

	return true	

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.ShipsTree_BattleSlotWnd.effectInfo =
{
	main =
	{
		animIdle				= "idle",
		animSelect				= "select",
		maintenanceIcoLocator	= "btn_repair",
		shipNameLocator			= "name_ship",
		shipNameLocator2		= "name_ship_2",
		levelUpLocator			= "lvlup",
	},

	shipIco =
	{
		icoSpriteName	= "ico_ship",
	},

	role =
	{
		animRegular		= "white",
		animPremium		= "ico_gold",
		icoSpriteName	= "ico",
	},

	race =
	{
		icoSpriteName	= "ico_fraction",
	},
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.ShipsTree_BattleSlotWnd.tooltipData			= nil
UI.ShipsTree_BattleSlotWnd.maintenanceIcoWnd	= nil
UI.ShipsTree_BattleSlotWnd.levelUpIcoWnd		= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.ShipsTree_BattleSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.ShipsTree_BattleSlotWnd:CreateControls()

	self.maintenanceIcoWnd	= UI:CreateChildWnd( self, UI.ItemControl_DurabilityIcoWnd, "" )
	self.levelUpIcoWnd		= UI:CreateChildWnd( self, UI.ShipLevelUpIco, "" )

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateMainAnimation()
	self:UpdateShipName( data )
	self:UpdateShipIco( data )
	self:UpdateRace( data )
	self:UpdateRole( data )
	self:UpdateMaxSynergyEffect( data )
	self:UpdateRank( data )
	self:UpdateEmptyText( data )
	self:UpdateInBattleEffect( data )
	self:UpdateBrokenEffect( data )
	self:UpdateMaintenanceIco( data )
	self:UpdateNotBoughtEffect( data )
	self:UpdateTooltip( data )
	self:UpdateMatchmakingEffect( data )
	self:UpdateLevelUpIco( data )
	self:UpdateMouseOver()

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = self:IsSelected() and self.effectInfo.main.animSelect or self.effectInfo.main.animIdle
	mainEffect:StartAnimation( anim )

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateShipName( data )
	
	if data.shipItem then

		self:SetLayerVisible( true, self.layers.SHIP_NAME )

		local nameLocalized = UI:GetEntityLocalizedNameByDef( data.shipItem.defName, true )
		self:SetText( nameLocalized, self.layers.SHIP_NAME )

		self:UpdateShipNamePos()

	else
		self:SetLayerVisible( false, self.layers.SHIP_NAME )
	end

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateShipNamePos()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local baseLocator	= self.effectInfo.main.shipNameLocator
	local posLocator	= self.levelUpIcoWnd:IsChildOf( self ) and self.effectInfo.main.shipNameLocator2 or self.effectInfo.main.shipNameLocator
	local handle		= self:GetUiHandle()

	mainEffect:UnlinkLayer( handle, self.layers.SHIP_NAME, "" )
	mainEffect:LinkLayer( handle, self.layers.SHIP_NAME, baseLocator, UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	mainEffect:LinkLayer( handle, self.layers.SHIP_NAME, posLocator, UI.EffectAnimParams.POS )	
	
end


--
function UI.ShipsTree_BattleSlotWnd:UpdateLevelUpIco( data )

	local bNeedLevelUpIco = false

	if data.shipItem then
		bNeedLevelUpIco = UI:CanShipLevelUp( data.shipItem.vid )
	end

	local bIsLevelUpIco = self.levelUpIcoWnd:IsChildOf( self )

	if bNeedLevelUpIco and not bIsLevelUpIco then

		UI:AddChildAndLink( self, self.levelUpIcoWnd, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ), self.effectInfo.main.levelUpLocator, UI.EffectAnimParams.POS )
		self:UpdateShipNamePos()

	elseif not bNeedLevelUpIco and bIsLevelUpIco then

		self.levelUpIcoWnd:UnlinkFromParent()
		self:UpdateShipNamePos()

	end

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateShipIco( data )

	if data.shipItem then

		self:SetLayerVisible( true, self.layers.SHIP_ICO_EFFECT )

    	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
    	if shipIcoEffect then

    		local hTex = UI:GetShipIco( data.shipItem.defName )
			shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.icoSpriteName, hTex )

    	end

	else
		self:SetLayerVisible( false, self.layers.SHIP_ICO_EFFECT )
	end

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateRace( data )

	local race = -1

	if data.shipItem then
    	race = UI:GetItemRace( data.shipItem.defName )
	end

	if race ~= -1 then

		self:SetLayerVisible( true, self.layers.RACE_EFFECT )

       	local raceEffect = UI:GetEffectFromLayer( self, self.layers.RACE_EFFECT )
    	if raceEffect then

			local hTex = UI:GetRaceIcoMediumColored( race )
			raceEffect:SetSpriteTexture( self.effectInfo.race.icoSpriteName, hTex )

		end

	else
		self:SetLayerVisible( false, self.layers.RACE_EFFECT )
	end

end  


--
function UI.ShipsTree_BattleSlotWnd:UpdateRole( data )

	local role = -1

	if data.shipItem then
		role = UI:GetItemRole( data.shipItem.defName )
	end        

	if role ~= -1 then

		self:SetLayerVisible( true, self.layers.ROLE_EFFECT )

		local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_EFFECT )
		if roleEffect then

			local hTexRole = UI:GetRoleIco( role )
			roleEffect:SetSpriteTexture( self.effectInfo.role.icoSpriteName, hTexRole )

			local color = UI:GetItemColor( data.shipItem.defName )
			roleEffect:SetColor( color )

		end

	else
		self:SetLayerVisible( false, self.layers.ROLE_EFFECT )
	end
           
end


--
function UI.ShipsTree_BattleSlotWnd:UpdateMaxSynergyEffect( data )

	local bMaxSynergy = data.shipItem ~= nil and UI:GetShipLevel( data.shipItem ) >= UI:GetShipMaxLevel( data.shipItem.defName )
	self:SetLayerVisible( bMaxSynergy, self.layers.MAX_SYNERGY_EFFECT )

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateRank( data )

	local rank = -1

	if data.shipItem then
		rank = UI:GetShipRank( data.shipItem.defName )		
	end

	if rank ~= -1 then
		self:SetLayerVisible( true, self.layers.RANK )
		self:SetText( tostring( rank ), self.layers.RANK )
	else
		self:SetLayerVisible( false, self.layers.RANK )
	end

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateBrokenEffect( data )

	local bBroken = false

	-- для кораблей, которые в битве, повреждения игнорируются
	if data.shipItem and not UI:IsShipInBattle( data.shipItem ) then

    	local hp = _G.GameStore_GetVesselHullCondition( data.shipItem.vid )
		bBroken = hp == 0

	end

	self:SetLayerVisible( bBroken, self.layers.BROKEN_EFFECT )

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateMaintenanceIco( data )

	local bNeedMaintenanceIco = false

	if data.shipItem and not UI:IsShipInBattle( data.shipItem ) and not UI:IsShipOnShipQuest( data.shipItem ) then

    	local hp			= _G.GameStore_GetVesselHullCondition( data.shipItem.vid )
    	local refillInfo	= UI:GetShipRefillInfo( data.shipItem )

		local bNeedRepair	= hp < 1
		local bNeedRefill	= refillInfo.bHasAvailable and not refillInfo.bFullAmmo

		bNeedMaintenanceIco = bNeedRepair or bNeedRefill

	end

	if bNeedMaintenanceIco then
		UI:AddChildAndLink( self, self.maintenanceIcoWnd, UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT ), self.effectInfo.main.maintenanceIcoLocator, UI.EffectAnimParams.POS )
		self.maintenanceIcoWnd:SetupForShip( data.shipItem.vid ) 
	else
		self.maintenanceIcoWnd:UnlinkFromParent()
	end

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateEmptyText( data )

	local bNeedEmptyText = data.bSlotBought and not data.shipItem
	self:SetLayerVisible( bNeedEmptyText, self.layers.EMPTY_TEXT )

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateInBattleEffect( data )

	local bInBattle = data.shipItem ~= nil and UI:IsShipInBattle( data.shipItem )

	self:SetLayerVisible( bInBattle, self.layers.IN_BATTLE_EFFECT )
	self:SetLayerVisible( bInBattle, self.layers.IN_BATTLE_TEXT )

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateNotBoughtEffect( data )

	local bVisible = not data.bSlotBought
	
	self:SetLayerVisible( bVisible, self.layers.NOT_BOUGHT_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.NOT_BOUGHT_TEXT )
	
	if bVisible then

		local requiredRank = UI.serverData.battleSlotsRankReq[ data.shipSlotIdx ] or -1
		local strRank = tostring( requiredRank )
		
		local str = UI:GetStringByName( "gameplayChoice_requiredRank" )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$rank%$", strRank )

		if numSubst == 0 then
			sys.log( "UI.ShipsTree_BattleSlotWnd:UpdateLockEffect()[ERROR]: cannot find placeholder \"$rank$\" in string \"gameplayChoice_requiredRank\"" )
			str = string.format( "[INVALID STRING]required rank %s", strRank )
		end
		
		self:SetText( str, self.layers.NOT_BOUGHT_TEXT )

	end

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateMatchmakingEffect( data )

	local bVisible = UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE and data.bSlotBought

	self:SetLayerVisible( bVisible, self.layers.MATCHMAKING_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.MATCHMAKING_HOURGLASS_EFFECT )
	
end


--
function UI.ShipsTree_BattleSlotWnd:UpdateTooltip( data )

	self.tooltipData = nil

	if data.shipItem then

		self.tooltipData =
		{
			tooltipType		= UI.tooltipTypes.SHIP,
			defName			= data.shipItem.defName,
			vid				= data.shipItem.vid,
			bWithTalents	= true,
		}

	else

        if not data.bSlotBought then
        	self.tooltipData = UI:GetLockedBattleSlotTooltipData( data.shipSlotIdx )
        end

	end

end


--
function UI.ShipsTree_BattleSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ShipsTree_BattleSlotWnd:UpdateMouseOver()

	local bMouseOver = false
	
	local bCanClick = data and data.bSlotBought
		
	if bCanClick then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		if wndUnderMouse == self then
			bMouseOver = true
		end
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipsTree_BattleSlotWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipsTreeWnd.sounds.battleSlotMouseOver )
	end

end

--
function UI.ShipsTree_BattleSlotWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ShipsTree_BattleSlotWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


-- при инициализации списка слоты меняют позицию, поэтому состояние наведения мышью может потом стать неактуальным
function UI.ShipsTree_BattleSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMouseOver()
	end

end


-- ------------------------------------------------------------------------
-- UI.ShipsTree_QuestPanelWnd
-- ------------------------------------------------------------------------

UI.ShipsTree_QuestPanelWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.ShipsTree_QuestPanelWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_QuestPanelWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipsTree_questPanel",
				defaultAnimation	= "idle_2",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "ship_slots",
						wnd			= "UI.ShipsTree_QuestShipsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title",	
						layer		= "UI.ShipsTree_QuestPanelWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},	

					{
						objName		= "title54",	
						layer		= "UI.ShipsTree_QuestPanelWnd.layers.TASK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},	

					{
						objName		= "title56",	
						layer		= "UI.ShipsTree_QuestPanelWnd.layers.REWARD_CF",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.BACK_COLOR,
					},	

					{
						objName		= "title55",	
						layer		= "UI.ShipsTree_QuestPanelWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "btn_2",	
						wnd			= "UI.ShipsTree_QuestStartBtn",
						animParams	= UI.EffectAnimParams.POS,
					},	

					{
						objName		= "btn_1",	
						wnd			= "UI.ShipsTree_QuestCancelBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "title57",
						layer		= "UI.ShipsTree_QuestPanelWnd.layers.AUTO_SHIPS_REWARD_CF",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_4",	
						wnd			= "UI.ShipsTree_AutoShipsBtn",
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
		},

		-- TASK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- REWARD_CF
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- TIME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- AUTO_SHIPS_REWARD_CF
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},

	children =
	{
		"UI.ShipsTree_QuestShipsListWnd",
		"UI.ShipsTree_QuestStartBtn",
		"UI.ShipsTree_QuestCancelBtn",
		"UI.ShipsTree_AutoShipsBtn",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipsTree_QuestPanelWnd:FullUpdate()

	self:Reset()

	self:UpdateCaption()
	self:UpdateTask()
	self:UpdateShipsList( false )
	self:UpdateRewardCf()
	self:UpdateTime()
	self:UpdateStartBtn()
	self:UpdateAutoShips()
	self:UpdateMainAnimation()

end


--
function UI.ShipsTree_QuestPanelWnd:GetQuestId()

	return UI.ShipsTreeWnd:GetShipQuest()

end


--
function UI.ShipsTree_QuestPanelWnd:Reset()

	self:ResetAutoShipsInfo()

	self.shipsListWnd:Clear()

	self.rewardCfMetaText:SetText( "", true )
	self:SetText( "", self.layers.TASK )
	self:SetText( "", self.layers.TIME )
	self.autoShipsRewardCfMetaText:SetText( "", true )

	self.startBtn:Enable( false )
	self.autoShipsBtn:SetGray( true )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animRegular )
	end

end


--
function UI.ShipsTree_QuestPanelWnd:OnShipsChanged()

	self:UpdateShipsList( true )
	self:UpdateRewardCf()
	self:UpdateStartBtn()

end


--
function UI.ShipsTree_QuestPanelWnd:OnShipQuestStateChanged()

	self:UpdateStartBtn()
	self:UpdateAutoShips()

end


--
function UI.ShipsTree_QuestPanelWnd:OnRepairBattleVessels()

	for recordIdx = 1, self.shipsListWnd:GetNumRecords() do

		local data = self.shipsListWnd:GetRecordData( recordIdx )
		if data.shipItem then

			local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( recordIdx )
			if shipSlotWnd then
				shipSlotWnd:OnRepair()
			end

		end

	end

end


--
function UI.ShipsTree_QuestPanelWnd:OnRepairVessel( vid )

	local recordIdx = self:GetShipRecord( vid )
	if recordIdx ~= -1 then

		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( recordIdx )
		if shipSlotWnd then
			shipSlotWnd:OnRepair()
		end

	end

end


--
function UI.ShipsTree_QuestPanelWnd:OnVesselEquipment( vid )

	self:OnEquipmentChanged( vid )

end


--
function UI.ShipsTree_QuestPanelWnd:OnChangeEquipment( vid )

	self:OnEquipmentChanged( vid )

end


--
function UI.ShipsTree_QuestPanelWnd:OnTransferEquipment( vid1, vid2 )

	self:OnEquipmentChanged( vid1 )
	self:OnEquipmentChanged( vid2 )

end


--
function UI.ShipsTree_QuestPanelWnd:OnStripEquipment( vid )

	self:OnEquipmentChanged( vid )

end  


--
function UI.ShipsTree_QuestPanelWnd:OnChangeMunition( vid )

	self:OnEquipmentChanged( vid )

end


--
function UI.ShipsTree_QuestPanelWnd:OnTransferMunition( vid1, vid2 )

	self:OnEquipmentChanged( vid1 )
	self:OnEquipmentChanged( vid2 )

end


--
function UI.ShipsTree_QuestPanelWnd:OnRefillBattleVessels()

	self:OnEquipmentChanged()

end


--
function UI.ShipsTree_QuestPanelWnd:OnRefillMunition( vid )

	self:OnEquipmentChanged( vid )

end


--
function UI.ShipsTree_QuestPanelWnd:OnPlayerCreditsChanged()

	for recordIdx = 1, self.shipsListWnd:GetNumRecords() do

		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( recordIdx )
		if shipSlotWnd then
			shipSlotWnd:OnPlayerCreditsChanged()
		end

	end

end


--
function UI.ShipsTree_QuestPanelWnd:OnVesselLevelUp( vid )

	local shipRecordIdx = self:GetShipRecord( vid )
	if shipRecordIdx ~= -1 then

		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( shipRecordIdx )
		if shipSlotWnd then
			shipSlotWnd:OnVesselExpChanged()
		end

		self:UpdateRewardCf()

	end

	self:UpdateAutoShips()

end


--
function UI.ShipsTree_QuestPanelWnd:OnExtractVesselExp( vids )

	for shipIdx, vid in pairs( vids ) do

		local shipRecordIdx = self:GetShipRecord( vid )
		if shipRecordIdx ~= -1 then

    		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( shipRecordIdx )
    		if shipSlotWnd then
    			shipSlotWnd:OnVesselExpChanged()
    		end

		end

	end

end


--
function UI.ShipsTree_QuestPanelWnd:OnHangarPrepareStateChanged()

	for recordIdx = 1, self.shipsListWnd:GetNumRecords() do

		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( recordIdx )
		if shipSlotWnd then
			shipSlotWnd:OnHangarPrepareStateChanged()
		end

	end

	self:UpdateAutoShips()

end


--
function UI.ShipsTree_QuestPanelWnd:OnSelQuestSlotChanged()

	self:UpdateSelSlot()

end


--
function UI.ShipsTree_QuestPanelWnd:OnOwnedVessels()

	-- перед приходом коллбэка на взятие квеста вызывается апдейт кораблей,
	-- при этом данные о состоянии квеста в ui еще не обновлены, квест еще считается не взятым,
	-- поэтому, чтобы не было ошибок в логе, это сообщение игнорируется
	if not UI.ShipsTreeWnd:IsWaitingForStartShispQuest() then
		self:UpdateAutoShips()
	end

end


--
function UI.ShipsTree_QuestPanelWnd:OnSellVessel( vid )

	self:UpdateAutoShips()

end


--
function UI.ShipsTree_QuestPanelWnd:OnBattleSlots()

	self:UpdateAutoShips()
	
end


--
function UI.ShipsTree_QuestPanelWnd:OnVesselUnlockNode( vid )

	local shipRecordIdx = self:GetShipRecord( vid )
	if shipRecordIdx ~= -1 then

		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( shipRecordIdx )
		if shipSlotWnd then
			shipSlotWnd:OnVesselExpChanged()
		end

	end

end


--
function UI.ShipsTree_QuestPanelWnd:OnSelRaceChanged()

	self:UpdateMainAnimation()

end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipsTree_QuestPanelWnd.layers =
{
	MAIN_EFFECT				= 0,
	CAPTION					= 1,
	TASK					= 2,
	REWARD_CF				= 3,
	TIME					= 4,
	AUTO_SHIPS_REWARD_CF	= 5,
}

UI.ShipsTree_QuestPanelWnd.effectInfo =
{
	main =
	{
		autoShipsDisabledColorLocator	= "color_auto",
		animRegular						= "idle_2",
		animAlien						= "idle",
	}
}

UI.ShipsTree_QuestPanelWnd.strAutoShipsOnQuest	= UI:GetStringByName( "shipsTree_questAutoShips_onQuestTime" )

-- ------------------------------
-- vars
-- ------------------------------

UI.ShipsTree_QuestPanelWnd.shipsListWnd					= nil
UI.ShipsTree_QuestPanelWnd.startBtn						= nil
UI.ShipsTree_QuestPanelWnd.autoShipsBtn					= nil
UI.ShipsTree_QuestPanelWnd.rewardCfMetaText				= nil
UI.ShipsTree_QuestPanelWnd.autoShipsDisabledColor		= UI.WHITE_COLOR
UI.ShipsTree_QuestPanelWnd.autoShipsInfo				= nil
UI.ShipsTree_QuestPanelWnd.autoShipsRewardCfMetaText	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipsTree_QuestPanelWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.shipsListWnd	= UI.ShipsTree_QuestShipsListWnd
	self.startBtn		= UI.ShipsTree_QuestStartBtn
	self.autoShipsBtn	= UI.ShipsTree_AutoShipsBtn

	self.rewardCfMetaText = UI.MetaText.GetNewInstance()
	self.rewardCfMetaText:InitFromLayer( self, self.layers.REWARD_CF )

	self.autoShipsRewardCfMetaText = UI.MetaText.GetNewInstance()
	self.autoShipsRewardCfMetaText:InitFromLayer( self, self.layers.AUTO_SHIPS_REWARD_CF )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		local autoShipsDisabledColor	= mainEffect:GetObjColor( self.effectInfo.main.autoShipsDisabledColorLocator )
		local autoShipsDisabledApha		= mainEffect:GetObjAlpha( self.effectInfo.main.autoShipsDisabledColorLocator )
		self.autoShipsDisabledColor = UI:SetAlpha( autoShipsDisabledColor, autoShipsDisabledApha )
	end	

	self:Reset()

end


--
function UI.ShipsTree_QuestPanelWnd:F_Shutdown()

	if self.rewardCfMetaText then
		self.rewardCfMetaText:Clear()
	end

	if self.autoShipsRewardCfMetaText then
		self.autoShipsRewardCfMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipsTree_QuestPanelWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipsTree_QuestPanelWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.ShipsTree_QuestPanelWnd:UpdateMetaTextPos()

	self.rewardCfMetaText:UpdateScreenOrgFromLayer( self, self.layers.REWARD_CF )	
	self.autoShipsRewardCfMetaText:UpdateScreenOrgFromLayer( self, self.layers.AUTO_SHIPS_REWARD_CF )

end


--
function UI.ShipsTree_QuestPanelWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.REWARD_CF then
		self.rewardCfMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.AUTO_SHIPS_REWARD_CF then
		self.autoShipsRewardCfMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateCaption()

	local str = UI:GetStringByName( "shipsTree_questCaption" )
	local strQuest = UI:AvailableShipQuest2Str( self:GetQuestId() )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$quest%$", strQuest )

	if numSubst == 0 then
		sys.log( "UI.ShipsTree_QuestPanelWnd:UpdateCaption()[ERROR]: cannot find placeholder \"$quest$\" in string \"shipsTree_questCaption\"" )
		str = string.format( "[INVALID STRING] Ships for quest %s", strQuest )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateTask()

	local str = UI:GetShipQuestTaskDesc( self:GetQuestId() )
	self:SetText( str, self.layers.TASK )
	
end


--
function UI.ShipsTree_QuestPanelWnd:UpdateShipsList( bSaveScrollPos )

	local scrollPos = self.shipsListWnd:GetScrollPos()

	self.shipsListWnd:Clear()

	local ships = self:GetShips()
	for slotIdx, vid in ipairs( ships ) do

		local data = {}
		data.bSlotBought = true		-- UI.ShipsTree_BattleSlotWnd, производным от которого является квестовый слот, использует это

		if vid ~= UI.INVALID_U64_ID then
			data.shipItem = UI:GetShipItem( vid, false )
		end

		self.shipsListWnd:AddRecord( data )

	end

	-- вызывать обязательно ДО восстановления позиции скролла, т.к. иначе позиция скролла встанет на выделенный слот
	self:UpdateSelSlot()

	if bSaveScrollPos and scrollPos ~= -1 then
		self.shipsListWnd:SetScrollPos( scrollPos )
	end
	
end


--
function UI.ShipsTree_QuestPanelWnd:GetShipRecord( vid )

	for recordIdx = 1, self.shipsListWnd:GetNumRecords() do

		local data = self.shipsListWnd:GetRecordData( recordIdx )

		if data.shipItem and data.shipItem.vid == vid then
			return recordIdx
		end
	end

	return -1

end


--
function UI.ShipsTree_QuestPanelWnd:OnEquipmentChanged( vid )

	if vid then

		local recordIdx = self:GetShipRecord( vid )
		if recordIdx ~= -1 then

    		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( recordIdx )
    		if shipSlotWnd then
    			shipSlotWnd:OnAmmoChanged()
    		end

		end

	else

    	for recordIdx = 1, self.shipsListWnd:GetNumRecords() do

			local data = self.shipsListWnd:GetRecordData( recordIdx )
			if data.shipItem then

        		local shipSlotWnd = self.shipsListWnd:GetButtonForRecord( recordIdx )
        		if shipSlotWnd then
        			shipSlotWnd:OnAmmoChanged()
        		end

			end

    	end

	end

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateRewardCf()

	local cf = UI:GetShipQuestRewardCoef( self:GetQuestId(), self:GetShips(), true )
	cf = UI:Clamp( UI:Round( cf * 100 ), 0, 100 )

	local baseColor = self:GetColor( self.layers.REWARD_CF )

	local strVal = string.format( "%d%%", cf )
	local strValLink = string.format( "$link [type CUSTOM_TEXT] [params {text=\"%s\",tooltipCaptionId=\"shipQuest_rewardCoef_tooltipCaption\",tooltipTextId=\"shipQuest_rewardCoef_tooltip\",colorUnsel=%u,colorSel=%u}]$", strVal, baseColor, baseColor )

	local str = UI:GetStringByName( "ships_quest_rewardCoef_label" )
	str = string.format( "%s %s", str, strValLink )

	self.rewardCfMetaText:SetText( str, true )

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateTime()

	local str = UI:GetStringByName( "shipsTree_questTime" )

	local time = UI:GetShipQuestMaxTime( self:GetQuestId() )
	local strTime = UI:Time2Str6( time )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$time%$", strTime )

	if numSubst == 0 then
		sys.log( "UI.ShipsTree_QuestPanelWnd:UpdateTime()[ERROR]: cannot find placeholder \"$time$\" in string \"shipsTree_questTime\"" )
		str = string.format( "[INVALID STRING] Time: %s", strTime )
	end

	self:SetText( str, self.layers.TIME )

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateStartBtn()

	local bEnable = false

	if not UI:IsShipQuestTaken( self:GetQuestId() ) then

		local ships = self:GetShips()

		for slotIdx, vid in pairs( ships ) do
			if vid ~= UI.INVALID_U64_ID then
				bEnable = true
				break
			end
		end

	end

	self.startBtn:Enable( bEnable )

end


--
function UI.ShipsTree_QuestPanelWnd:GetShips()

	return UI.ShipsTreeWnd:GetQuestShips()

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateSelSlot()

	local selSlotIdx = UI.ShipsTreeWnd:GetSelQuestSlot()
	self.shipsListWnd:SelectRecord( selSlotIdx )

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateAutoShips()

	self:ResetAutoShipsInfo()

	local questId = self:GetQuestId()
	
	if UI:IsShipQuestTaken( questId ) then
		self.rewardCfMetaText:SetText( "", true )
		self.autoShipsBtn:SetGray( true )
		return
	end
	
	
	local availableShips, bestShips, bBestShipsDeffrent = UI.ShipsTreeWnd:GetQuestAutoShips()

	-- текст

	if next( availableShips ) then

		self.autoShipsInfo.bHasAvailable	= true
		self.autoShipsInfo.rewardCf			= UI:GetShipQuestRewardCoef( questId, availableShips, true )

	end

	if bBestShipsDeffrent then

		self.autoShipsInfo.bHasBest			= true
		self.autoShipsInfo.best_rewardCf	= UI:GetShipQuestRewardCoef( questId, bestShips, true )

		local maxQuestTime				= -1
		local questIdWithMaxTime		= -1
		local bHasShipsInBattle			= false
		local bHasShipsInBattleSlots	= false

		for shipIdx, vid in pairs( bestShips ) do

    		local shipItem = UI:GetShipItem( vid, false )
    		if shipItem then

				if UI:IsShipOnShipQuest( shipItem ) then 

					local shipQuestId	= UI:GetShipQuestForShip( shipItem )
					local shipQuestTime	= UI:GetShipQuestTimeLeft( shipQuestId )

					if shipQuestTime > maxQuestTime then
						maxQuestTime		= shipQuestTime
						questIdWithMaxTime	= shipQuestId
					end					

				end

				if UI:IsShipInBattle( shipItem ) or UI:IsShipInMatchmaking( shipItem ) then
					bHasShipsInBattle = true
				end

				if UI:GetShipBattleSlot( shipItem ) ~= -1 then
					bHasShipsInBattleSlots = true
				end

			else
    			sys.log( "UI.ShipsTree_QuestPanelWnd:UpdateAutoShips()[ERROR]: cannot find ship item for ship %s", _G.U64ToStr( vid ) )
    		end

		end

		if questIdWithMaxTime ~= -1 then
			self.autoShipsInfo.best_questId		= questIdWithMaxTime
			self.autoShipsInfo.best_questTime	= maxQuestTime

		elseif bHasShipsInBattle then
			self.autoShipsInfo.best_bInBattle = true

		elseif bHasShipsInBattleSlots then
			self.autoShipsInfo.best_bInBattleSlots = true
		end

	end

	self:UpdateAutoShipsText()
	

	-- кнопка

	local bBtnEnabled = next( availableShips ) ~= nil
	self.autoShipsBtn:SetGray( not bBtnEnabled )

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateAutoShipsText()

	local rewardCf = UI:Clamp( UI:Round( self.autoShipsInfo.rewardCf * 100 ), 0, 100 )
	local str = string.format( "%d%%", rewardCf )

	if not self.autoShipsInfo.bHasAvailable then
		str = string.format( "%s%s", UI:Color2Str( self.autoShipsDisabledColor ), str )
	end

	if self.autoShipsInfo.bHasBest then

		local best_rewardCf = UI:Clamp( UI:Round( self.autoShipsInfo.best_rewardCf * 100 ), 0, 100 )
		local strBestRewardCf = string.format( "%d%%", best_rewardCf )

		local strBestStatus = "error"

		if self.autoShipsInfo.best_questId ~= -1 then

			local strTime = UI:Time2Str6( self.autoShipsInfo.best_questTime )

			local numSubst = 0
			strBestStatus, numSubst = string.gsub( self.strAutoShipsOnQuest, "%$time%$", strTime )

			if numSubst == 0 then
				strBestStatus = string.format( "[INVALID STRING] %s left", strTime )
			end			

		elseif self.autoShipsInfo.best_bInBattle then

			strBestStatus = UI:GetStringByName( "shipsTree_questAutoShips_inBattle" )

		elseif self.autoShipsInfo.best_bInBattleSlots then

			strBestStatus = UI:GetStringByName( "shipsTree_questAutoShips_inBattleSlots" )

		end

		str = string.format( "%s %s(%s %s)", str, UI:Color2Str( self.autoShipsDisabledColor ), strBestRewardCf, strBestStatus )

	end

	local baseColor = self:GetColor( self.layers.AUTO_SHIPS_REWARD_CF )
	local strLink = string.format( "$link [type CUSTOM_TEXT] [params {text=\"%s\",tooltipCaptionId=\"shipsTree_questAutoShips_tooltipCaption\",tooltipTextId=\"shipsTree_questAutoShips_tooltipText\",colorUnsel=%u,colorSel=%u}]$", str, baseColor, baseColor )

	self.autoShipsRewardCfMetaText:SetText( strLink, true )

end


--
function UI.ShipsTree_QuestPanelWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateAutoShipsOnQuestTime()

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateAutoShipsOnQuestTime()

	if not self.autoShipsInfo.bHasBest or self.autoShipsInfo.best_questId == -1 then
		return
	end

	self.autoShipsInfo.best_questTime = UI:GetShipQuestTimeLeft( self.autoShipsInfo.best_questId )

	self:UpdateAutoShipsText()

end


--
function UI.ShipsTree_QuestPanelWnd:ResetAutoShipsInfo()

    self.autoShipsInfo =
    {
		bHasAvailable		= false,
    	rewardCf			= 0,
    	bHasBest			= false,
    	best_rewardCf		= 0,
    	best_bInBattle		= false,
		best_bInBattleSlots	= false,
    	best_questId		= -1,
		best_questTime		= -1,
    }

end


--
function UI.ShipsTree_QuestPanelWnd:UpdateMainAnimation()

	local anim = UI.ShipsTreeWnd:GetSelRace() == ai.Race.CRYSTAL and self.effectInfo.main.animAlien or self.effectInfo.main.animRegular

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_QuestStartBtn
-- ------------------------------------------------------------

UI.ShipsTree_QuestStartBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn13",
	
		props =
		{
			name	= "ShipsTree_QuestStartBtn",
		}
	},

	textId = "ships_quest_startQuestBtn",
}

-- ------------------------------------------------------------
-- UI.ShipsTree_QuestCancelBtn
-- ------------------------------------------------------------

UI.ShipsTree_QuestCancelBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn11",
	
		props =
		{
			name	= "ShipsTree_QuestCancelBtn",
		}
	},

	textId = "cancel",
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AutoShipsBtn
-- ------------------------------------------------------------

UI.ShipsTree_AutoShipsBtn =
{
	def =
	{
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",
	
		props =
		{
			name	= "ShipsTree_AutoShipsBtn",
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
    				defName 			= "shipsTree_questPanel_autoShipsBtn",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self154",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "name1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},

	textId = "shipsTree_questAutoShips_btnText",

	tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:GetStringByName( "shipsTree_questAutoShips_tooltipCaption" ),
		text		= UI:GetStringByName( "shipsTree_questAutoShips_tooltipText" ),
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_QuestShipsListWnd
-- ------------------------------------------------------------

UI.ShipsTree_QuestShipsListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_QuestShipsListWnd.def =
{

	className	= "Wnd",
	prototype	= "ButtonsList3Wnd_HrzScroll",

	props =
	{
		name		= "ShipsTree_QuestShipsListWnd",
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
				defName 			= "shipsTree_battleSlotsList",
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

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_QuestShipsListWnd.btnPrototypeName	= "ShipsTree_QuestShipSlotWnd"

UI.ShipsTree_QuestShipsListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "sh_slot_",
		scrollObjName		= "scroll",
		animIdle			= "idle",
	}
}

UI.ShipsTree_QuestShipsListWnd.listStyle	= UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.FIXED_SELECTION
UI.ShipsTree_QuestShipsListWnd.MAX_SLOTS	= 4

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_QuestShipsListWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self:Scroll( ticks < 0 )
	end

	return true

end


-- перегрузка базовой функции - если слотов меньше максимального числа, то центрирование по горизонтали
function UI.ShipsTree_QuestShipsListWnd:UpdateSlotPos( slot )

	local x = 0

	if self.numRecords >= self.MAX_SLOTS then
		x = self.slotsRect.x + ( slot.recordIdx - self.scrollPos ) * ( self.slotWidth + self.slotsSpace ) - self.slotsWnd:GetLeft()
	else
		local slotsWidth = self.numRecords * self.slotWidth + ( self.numRecords - 1 ) * self.slotsSpace
		local slotsX = ( self.slotsWnd:GetWidth() - slotsWidth ) * 0.5
		x = slotsX + ( slot.idx - 1 ) * ( self.slotWidth + self.slotsSpace )
	end
	
	slot.btn:SetLeft( x )

end


-- ------------------------------------------------------------
-- UI.ShipsTree_QuestShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_QuestShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

local l_numBattleSlotLayers = UI:GetTableLength( UI.ShipsTree_BattleSlotWnd.layers )

UI.ShipsTree_QuestShipSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "ShipsTree_BattleSlotWnd",

	props =
	{
		name			= "ShipsTree_QuestShipSlotWnd",
		isPrototype		= true,
	},

	layers =
	{
		numLayers = l_numBattleSlotLayers + 2,

		-- REWARD_CF_EFFECT
		{
			id			= l_numBattleSlotLayers,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_questSlot_rewardCf",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_buy",
						layer		= "UI.ShipsTree_QuestShipSlotWnd.layers.QUEST_REWARD_CF",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- QUEST_REWARD_CF
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_QuestShipSlotWnd:OnVesselExpChanged()

	UI.ShipsTree_BattleSlotWnd.OnVesselExpChanged( self )

	local data = self:GetRecordData()

	if not data.shipItem then
		return
	end

	self:UpdateQuestRewardCf( data )

end


--
function UI.ShipsTree_QuestShipSlotWnd:GetShipDDData()

	local data = self:GetRecordData()

	if	not data.shipItem
		or UI:IsShipQuestTaken( self:GetQuestId() )
		or UI.ShipsTreeWnd:IsWaiting() then
			return nil
	end

	local ddData =
	{
		srcType			= UI.ShipDDWnd.srcTypes.QUEST_SHIP,
		vid				= data.shipItem.vid,
		questSlotIdx	= self:GetRecord(),
	}

	return ddData

end


--
function UI.ShipsTree_QuestShipSlotWnd:IsShipDDFit( ddData )

	if UI.ShipsTreeWnd:IsWaiting() then
		return false
	end

	if UI:IsShipQuestTaken( self:GetQuestId() ) then
		return false
	end

	local data = self:GetRecordData()

	if data.shipItem and ddData.vid == data.shipItem.vid then
		return false
	end

	local ddShipItem = UI:GetShipItem( ddData.vid, true )
	if not ddShipItem then
		return false
	end

	if UI:IsShipOnShipQuest( ddShipItem ) then
		return false
	end

	if UI:IsShipInBattle( ddShipItem ) then
		return false
	end

	if UI:IsShipInMatchmaking( ddShipItem ) then
		return false
	end
	
	if UI:IsShipDisabledByTime( ddShipItem.defName ) then
		return false
	end

	local questId = self:GetQuestId()

	local questMinShipRank	= UI:GetShipQuestMinShipRank( questId )
	local questMaxShipRank	= UI:GetShipQuestMaxShipRank( questId )
	local shipRank			= UI:GetShipRank( ddShipItem.defName )

	if questMinShipRank ~= -1 and ( shipRank == -1 or shipRank < questMinShipRank ) then
		return false
	end

	if questMaxShipRank ~= -1 and ( shipRank == -1 or shipRank > questMaxShipRank ) then
		return false
	end

	return true	

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_QuestShipSlotWnd.layers =
{
    MAIN_EFFECT						= 0,
	SHIP_ICO_EFFECT					= 1, 
    BROKEN_EFFECT    				= 2,
	IN_BATTLE_EFFECT				= 3, 
	IN_BATTLE_TEXT      			= 4,  
    SHIP_NAME						= 5,  
	MAX_SYNERGY_EFFECT              = 6, 
    ROLE_EFFECT						= 7,  
    RANK							= 8, 
	RACE_EFFECT						= 9,  
    EMPTY_TEXT						= 10, 
	NOT_BOUGHT_EFFECT				= 11,
	NOT_BOUGHT_TEXT					= 12,
	MOUSE_OVER_EFFECT				= 13,
	SHIP_DD_OVER_EFFECT				= 14,
	MATCHMAKING_EFFECT          	= 15,
	MATCHMAKING_HOURGLASS_EFFECT	= 16,
	QUEST_REWARD_CF_EFFECT			= 17,
	QUEST_REWARD_CF                 = 18,
}

UI.ShipsTree_QuestShipSlotWnd.effectInfo =
{
	main =
	{
		questRewardCfLocator	= "over",
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_QuestShipSlotWnd:F_PostLoad()

	UI.ShipsTree_BattleSlotWnd.F_PostLoad( self )

	-- чтобы не копировать линк всех слоев в определении окна, добавочный слой линкуется вручную
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkLayer( self:GetUiHandle(), self.layers.QUEST_REWARD_CF_EFFECT, self.effectInfo.main.questRewardCfLocator, UI.EffectAnimParams.POS )
	end	

end


--
function UI.ShipsTree_QuestShipSlotWnd:Reset()

	UI.ShipsTree_BattleSlotWnd.Reset( self )

	self:SetLayerVisible( false, self.layers.QUEST_REWARD_CF_EFFECT )
	self:SetLayerVisible( false, self.layers.QUEST_REWARD_CF )

end


--
function UI.ShipsTree_QuestShipSlotWnd:UpdateForData( data, bAnimated )

	UI.ShipsTree_BattleSlotWnd.UpdateForData( self, data, bAnimated )

	self:UpdateQuestRewardCf( data )

end


--
function UI.ShipsTree_QuestShipSlotWnd:UpdateEmptyText( data )
	-- ничего
end


--
function UI.ShipsTree_QuestShipSlotWnd:UpdateQuestRewardCf( data )

	if data.shipItem then

    	self:SetLayerVisible( true, self.layers.QUEST_REWARD_CF_EFFECT )
    	self:SetLayerVisible( true, self.layers.QUEST_REWARD_CF )

    	local rewardCf = UI:GetShipQuestRewardCoef( UI.ShipsTreeWnd:GetShipQuest(), { data.shipItem.vid }, true )
    	rewardCf = UI:Clamp( UI:Round( rewardCf * 100 ), 0, 100 )

    	local str = string.format( "+%d%%", rewardCf )
    	self:SetText( str, self.layers.QUEST_REWARD_CF )

	else

		self:SetLayerVisible( false, self.layers.QUEST_REWARD_CF_EFFECT )
		self:SetLayerVisible( false, self.layers.QUEST_REWARD_CF )

	end

end


--
function UI.ShipsTree_QuestShipSlotWnd:GetQuestId()

	return UI.ShipsTree_QuestPanelWnd:GetQuestId()

end


--
function UI.ShipsTree_QuestShipSlotWnd:UpdateMatchmakingEffect( data )
	-- ничего	
end


-- ------------------------------------------------------------
-- UI.ShipsTree_PanelHeaderWnd
-- ------------------------------------------------------------

UI.ShipsTree_PanelHeaderWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_PanelHeaderWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipsTree_PanelHeaderWnd",
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
				defName 			= "shipsTree_panelHeader",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.ShipsTree_PanelHeaderWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "arrow",
						layer		= "UI.ShipsTree_PanelHeaderWnd.layers.STATE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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

		-- STATE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_panelHeader_state",
			}}
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_PanelHeaderWnd:Setup( mode )

	self:Reset()
	
	self.mode = mode

	self:FullUpdate()

end


--
function UI.ShipsTree_PanelHeaderWnd:SetOpen( bAuto )

	if self.bOpen and self.bAuto == bAuto then
		return
	end

	self.bOpen	= true
	self.bAuto	= bAuto

	self:UpdateStateEffect()
	
end


--
function UI.ShipsTree_PanelHeaderWnd:SetClosed()

	if not self.bOpen then
		return
	end

	self.bOpen = false

	self:UpdateStateEffect()

end


--
function UI.ShipsTree_PanelHeaderWnd:Reset()

	self.mode	= -1
	self.bOpen	= false
	self.bAuto	= false

	self:SetText( "", self.layers.TEXT )
	
	local stateEffect = UI:GetEffectFromLayer( self, self.layers.STATE_EFFECT )
	if stateEffect then
		stateEffect:StartAnimation( self.effectInfo.state.animClosed )
	end

	self:UpdateMainAnimation()

end


--
function UI.ShipsTree_PanelHeaderWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_PanelHeaderWnd:OnBattleSlotsChanged()

	if self.mode ~= self.modes.BATTLE_SLOTS then
		return
	end

	self:UpdateText()

end


--
function UI.ShipsTree_PanelHeaderWnd:OnQuestSlotsChanged()

	if self.mode ~= self.modes.QUEST then
		return
	end

	self:UpdateText()

end


--
function UI.ShipsTree_PanelHeaderWnd:OnSelRaceChanged()

	self:UpdateMainAnimation()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_PanelHeaderWnd.layers =
{
    MAIN_EFFECT		= 0,
    TEXT			= 1,
    STATE_EFFECT	= 2,
}

UI.ShipsTree_PanelHeaderWnd.effectInfo =
{
	main =
	{
		shipsCountColorLocator	= "color",
		animRegular_idle		= "idle",
		animRegular_mouseOver	= "over",
		animAlien_idle			= "idle_2",
		animAlien_mouseOver		= "over_2",
	},

	state =
	{
		animOpen	= "down",
		animClosed	= "up",
	}
}

UI.ShipsTree_PanelHeaderWnd.modes =
{
	BATTLE_SLOTS	= 1,
	QUEST			= 2,
}

UI.ShipsTree_PanelHeaderWnd.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "shipsTree_selectedShips_tooltipCaption" ),
	text		= UI:GetStringByName( "shipsTree_selectedShips_tooltipText" ),
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_PanelHeaderWnd.mode			= -1
UI.ShipsTree_PanelHeaderWnd.bOpen			= false
UI.ShipsTree_PanelHeaderWnd.bAuto			= false
UI.ShipsTree_PanelHeaderWnd.shipsCountColor	= UI.WHITE_COLOR
UI.ShipsTree_PanelHeaderWnd.bMouseOver		= false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_PanelHeaderWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		shipsCountColor = mainEffect:GetObjColor( self.effectInfo.main.shipsCountColorLocator )
	end

end


--
function UI.ShipsTree_PanelHeaderWnd:FullUpdate()

	if self.mode == -1 then
		return
	end

	self:UpdateText()
	self:UpdateStateEffect()
	self:UpdateMainAnimation()

end


--
function UI.ShipsTree_PanelHeaderWnd:UpdateText()

	local curCount	= 0
	local maxCount	= 0

	if self.mode == self.modes.BATTLE_SLOTS then

		maxCount = UI.serverData.battleSlotsCount

		for slotIdx, vid in pairs( UI.serverData.battleSlots ) do
			if vid and vid ~= UI.INVALID_U64_ID then
				curCount = curCount + 1
			end
		end

	elseif self.mode == self.modes.QUEST then

		local ships = UI.ShipsTreeWnd:GetQuestShips()

		maxCount = #ships

		for slotIdx, vid in pairs( ships ) do
			if vid ~= UI.INVALID_U64_ID then
				curCount = curCount + 1
			end
		end
		
	end	

	local strCountColor	= UI:Color2Str( self.shipsCountColor )
	local strBaseColor	= UI:Color2Str( self:GetColor( self.layers.TEXT ) )

	local strCount = string.format( "%s%d/%d%s", strCountColor, curCount, maxCount, strBaseColor )

	local str = UI:GetStringByName( "shipsTree_selectedShips" )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$count%$", strCount )

	if numSubst == 0 then
		sys.log( "UI.ShipsTree_PanelHeaderWnd:UpdateText()[ERROR]: cannot find placeholder \"$count$\" in string \"shipsTree_selectedShips\"" )
		str = string.format( "[INVALID STRING] ShipsSelected: %s", strCount )
	end

	self:SetText( str, self.layers.TEXT )

end


--
function UI.ShipsTree_PanelHeaderWnd:UpdateStateEffect()

	local stateEffect = UI:GetEffectFromLayer( self, self.layers.STATE_EFFECT )
	if not stateEffect then
		return
	end

	-- если открытое состояние автоматическое, то оно не отражается на эффекте, который показывается как для закрытого состояния
	local anim = ( self.bOpen and not self.bAuto ) and self.effectInfo.state.animOpen or self.effectInfo.state.animClosed
	stateEffect:StartAnimation( anim )

end


--
function UI.ShipsTree_PanelHeaderWnd:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipsTree_PanelHeaderWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self.bMouseOver
	self.bMouseOver = bMouseOver

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipsTreeWnd.sounds.panelHeaderMouseover )
	end

	self:UpdateMainAnimation()

end


--
function UI.ShipsTree_PanelHeaderWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( true )
	return true

end


--
function UI.ShipsTree_PanelHeaderWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true

end


--
function UI.ShipsTree_PanelHeaderWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ShipsTree_PanelHeaderWnd:UpdateMainAnimation()

	local anim = ""

	if UI.ShipsTreeWnd:GetSelRace() == ai.Race.CRYSTAL then
		anim = self.bMouseOver and self.effectInfo.main.animAlien_mouseOver or self.effectInfo.main.animAlien_idle
	else
		anim = self.bMouseOver and self.effectInfo.main.animRegular_mouseOver or self.effectInfo.main.animRegular_idle
	end	

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEditWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEditWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEditWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEditWnd",
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
				defName 			= "shipsTree_alienEdit",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "name",
						layer		= "UI.ShipsTree_EvolvingEditWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "color_1",
						layer		= "UI.ShipsTree_EvolvingEditWnd.layers.LOCK_REASON",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "name5",
						layer		= "UI.ShipsTree_EvolvingEditWnd.layers.ADVERT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "name4",
						layer		= "UI.ShipsTree_EvolvingEditWnd.layers.SYNERGY",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- LOCK_REASON
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ADVERT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "ships_promoShip_text" ),
		},

		-- SYNERGY
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEditWnd:Setup( defName )

	self:Reset()

	if type( defName ) ~= "string" then
		sys.log( "UI.ShipsTree_EvolvingEditWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	self.baseDefName = UI:GetEvolvingShipBaseDef( defName )

	if self.baseDefName == "" then
		sys.log( "UI.ShipsTree_EvolvingEditWnd:Setup()[ERROR]: cannot find base def for \"%s\"", defName )
		return
	end

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:Reset()

	self.baseDefName	= ""
	self.shipItem		= nil

	self:ResetContent()

end


--
function UI.ShipsTree_EvolvingEditWnd:GetBaseDefName()

	return self.baseDefName

end


--
function UI.ShipsTree_EvolvingEditWnd:GetShipItem()

	return self.shipItem

end


--
function UI.ShipsTree_EvolvingEditWnd:GetChosenActiveNodesMask()

	return self.shipSlotWnd:GetChosenActiveNodesMask()

end


--
function UI.ShipsTree_EvolvingEditWnd:SetChosenActiveNodesMask( chosenActiveNodesMask )

	if not self:IsBought() then
		sys.log( "UI.ShipsTree_EvolvingEditWnd:SetChosenActiveNodesMask()[ERROR]: cannot set chosen nodes mask; the ship is not bought" )
		return
	end

	self.shipSlotWnd:SetChosenActiveNodesMask( chosenActiveNodesMask )

end


--
function UI.ShipsTree_EvolvingEditWnd:SelectItemSlotByInfo( selItemInfo )

	if not self:IsBought() then
		sys.log( "UI.ShipsTree_EvolvingEditWnd:SelectItemSlotByInfo()[ERROR]: cannot set selected item; the ship is not bought" )
		return
	end

	self.itemSlotsWnd:SelectShipSlotByInfo( selItemInfo )

end


--
function UI.ShipsTree_EvolvingEditWnd:HasWaitingRequests()

	return self.itemSlotsWnd:HasWaitingRequests()

end


--
function UI.ShipsTree_EvolvingEditWnd:GetItemsSlotsPos()

	local pos = UI:ZeroVec2()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		pos = mainEffect:GetObjPos( self.effectInfo.main.itemsSlotsLocator )
	end

	pos.x = self:XToScreen( pos.x )
	pos.y = self:YToScreen( pos.y )

	return pos

end


--
function UI.ShipsTree_EvolvingEditWnd:HandleEscape()

	return self.itemSlotsWnd:HandleEscape()

end


--
function UI.ShipsTree_EvolvingEditWnd:OnOwnedVessels()

	self.shipItem = UI:GetEvolvingShipItem( self.baseDefName )

	self.shipSlotWnd:OnOwnedVessels()

	self:UpdateShipName()
	self:UpdateLockReason()
	self:UpdateAdvertText()
	self:UpdateSynergy()
	self:UpdateBuyBtn()
	self:UpdateCommitBtn()
	self:UpdateItemsSlots()

	local bParamsJustInited = self:UpdateParams()
	if self.paramsWnd:IsChildOf( self ) and not bChangedParamsJustInited then
		self.paramsWnd:OnOwnedVessels()
	end

	local bMainParamsJustInited = self:UpdateMainParams()
	if self.mainParamsWnd:IsChildOf( self ) and not bMainParamsJustInited then
		self.mainParamsWnd:OnOwnedVessels()
	end

	local bSurvivabilityJustInited = self:UpdateSurvivability()
	if self.survivabilityWnd:IsChildOf( self ) and not bSurvivabilityJustInited then
		self.survivabilityWnd:OnOwnedVessels()
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:OnChosenActiveNodesChanged( baseDefName )

	if self.paramsWnd:IsChildOf( self ) then
		self.paramsWnd:OnChosenActiveNodesChanged( self.shipSlotWnd:GetChosenActiveNodesMask() )
	end

	if self.mainParamsWnd:IsChildOf( self ) then
		self.mainParamsWnd:OnChosenActiveNodesChanged( self.shipSlotWnd:GetChosenActiveNodesMask() )
	end	

	if self.survivabilityWnd:IsChildOf( self ) then
		self.survivabilityWnd:OnChosenActiveNodesChanged( self.shipSlotWnd:GetChosenActiveNodesMask() )
	end

	self:UpdateShipName()
	self:UpdateCommitBtn()

end


--
function UI.ShipsTree_EvolvingEditWnd:OnExtractVesselExp()

	self.shipSlotWnd:OnExtractVesselExp()

	if self:IsBought() then
		self:UpdateSynergy()
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:OnVesselLevelUp( vid )

	self.shipSlotWnd:OnVesselLevelUp( vid )

	if self:IsBought() then
	
		if vid == self.shipItem.vid then
		
			self:UpdateSynergy()
			
			if self.mainParamsWnd:IsChildOf( self ) then
				self.mainParamsWnd:OnVesselLevelUp()
			end
			
			if self.survivabilityWnd:IsChildOf( self ) then
				self.survivabilityWnd:OnVesselLevelUp()
			end
			
			if self.paramsWnd:IsChildOf( self ) then
				self.paramsWnd:OnVesselLevelUp()
			end
			
		end
		
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:OnBattleSlotsChanged()

	self.shipSlotWnd:OnBattleSlotsChanged()

end


--
function UI.ShipsTree_EvolvingEditWnd:OnResourcesChanged()

	self.shipSlotWnd:OnResourcesChanged()

end


--
function UI.ShipsTree_EvolvingEditWnd:OnVesselUnlockNode()

	self.shipSlotWnd:OnVesselUnlockNode()

end


--
function UI.ShipsTree_EvolvingEditWnd:OnPlayerCreditsChanged()

	self.shipSlotWnd:OnPlayerCreditsChanged()

	if self:IsBought() then
		self:UpdateSynergy()
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:OnQuestsChanged()

	self.shipSlotWnd:OnQuestsChanged()

end


--
function UI.ShipsTree_EvolvingEditWnd:OnShipsTreePanelChanged()

	self:RecalcLayout()

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

	self.itemSlotsWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

	self.itemSlotsWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnUpgradeItems( result, requestId, iids )

	self.itemSlotsWnd:GameStore_OnUpgradeItems( result, requestId, iids )

end


--
function UI.ShipsTree_EvolvingEditWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	self.itemSlotsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	self.itemSlotsWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	
	if result == 0 and self:IsOnScreen() then
	
		self.shipSlotWnd:OnPlayerAccountRankChanged()
		
		if not self:IsBought() then
			self:UpdateLockReason()
			self:UpdateBuyBtn()
		end
		
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnSpoiled( result, requestId )

	self.itemSlotsWnd:GameStore_OnSpoiled( result, requestId )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnLoadingComplete( storeSize )

	self.itemSlotsWnd:GameStore_OnLoadingComplete( storeSize )

end


--
function UI.ShipsTree_EvolvingEditWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.itemSlotsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

end


--
function UI.ShipsTree_EvolvingEditWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

	self.itemSlotsWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	self.itemSlotsWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	self.itemSlotsWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	self.itemSlotsWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:MasterServer_OnVesselBudgetChanged( vid )

	self.itemSlotsWnd:MasterServer_OnVesselBudgetChanged( vid )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	self.itemSlotsWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEditWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	self.itemSlotsWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

end


--
function UI.ShipsTree_EvolvingEditWnd:ShowNoticeOnNode( nodeName )

	self.shipSlotWnd:ShowNoticeOnNode( nodeName )
	
end


--
function UI.ShipsTree_EvolvingEditWnd:F_OnEventInvItemsChanged()
	
	if not self:IsOnScreen() then
		return
	end
	
	if self:IsBought() then	
	
		if self.mainParamsWnd:IsChildOf( self ) then
			self.mainParamsWnd:OnEventInvItemsChanged()
		end
		
		if self.survivabilityWnd:IsChildOf( self ) then
			self.survivabilityWnd:OnEventInvItemsChanged()
		end
		
		-- self.paramsWnd показывают парметры без учета экипировки
		
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEditWnd.layers =
{
    MAIN_EFFECT	= 0,
    SHIP_NAME	= 1,
    LOCK_REASON	= 2,
    ADVERT_TEXT	= 3,
    SYNERGY		= 4,
}

UI.ShipsTree_EvolvingEditWnd.effectInfo =
{
	main =
	{
		minSizeLocator			= "min_dist",
		maxSizeLocator			= "self",
		itemsSlotsLocator		= "ship_modules",
		shipSlotLocator			= "sh_tr_slot",
        commitBtnLocator		= "btn_4",
        buyBtnLocator			= "btn_4",
        mainParamsLocator       = "progr_prop",
        survivabilityLocator	= "survival",
        paramsLocator			= "ship_proper",
	}
}

UI.ShipsTree_EvolvingEditWnd.itemsSlotsTableName	= ""
UI.ShipsTree_EvolvingEditWnd.shipSlotTableName		= ""
UI.ShipsTree_EvolvingEditWnd.commitBtnTableName		= ""
UI.ShipsTree_EvolvingEditWnd.buyBtnTableName		= ""
UI.ShipsTree_EvolvingEditWnd.mainParamsTableName	= ""
UI.ShipsTree_EvolvingEditWnd.survivabilityTableName	= ""
UI.ShipsTree_EvolvingEditWnd.paramsTableName		= ""

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEditWnd.baseDefName		= ""
UI.ShipsTree_EvolvingEditWnd.shipItem			= nil
UI.ShipsTree_EvolvingEditWnd.shipSlotWnd		= nil
UI.ShipsTree_EvolvingEditWnd.commitBtn			= nil
UI.ShipsTree_EvolvingEditWnd.buyBtn				= nil
UI.ShipsTree_EvolvingEditWnd.dlcBtn				= nil
UI.ShipsTree_EvolvingEditWnd.itemSlotsWnd		= nil
UI.ShipsTree_EvolvingEditWnd.mainParamsWnd		= nil
UI.ShipsTree_EvolvingEditWnd.survivabilityWnd	= nil
UI.ShipsTree_EvolvingEditWnd.paramsWnd			= nil
UI.ShipsTree_EvolvingEditWnd.synergyMetaText	= nil
UI.ShipsTree_EvolvingEditWnd.minHeight			= 0
UI.ShipsTree_EvolvingEditWnd.maxHeight			= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEditWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self.synergyMetaText = UI.MetaText.GetNewInstance()
	self.synergyMetaText:InitFromLayer( self, self.layers.SYNERGY )

	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )

end


--
function UI.ShipsTree_EvolvingEditWnd:F_Shutdown()

	if self.synergyMetaText then
		self.synergyMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipsTree_EvolvingEditWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEditWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateMetaTextPos()

	self.synergyMetaText:UpdateScreenOrgFromLayer( self, self.layers.SYNERGY )

end


--
function UI.ShipsTree_EvolvingEditWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.SYNERGY then
		self.synergyMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:CreateControls()

	self.itemSlotsWnd		= UI:CreateWndFromTable( self.itemsSlotsTableName )
    self.shipSlotWnd		= UI:CreateWndFromTable( self.shipSlotTableName )
    self.commitBtn			= UI:CreateWndFromTable( self.commitBtnTableName )
    self.buyBtn				= UI:CreateWndFromTable( self.buyBtnTableName )
	self.dlcBtn				= UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_DlcBtn, "" )
	self.mainParamsWnd		= UI:CreateWndFromTable( self.mainParamsTableName )
	self.survivabilityWnd	= UI:CreateWndFromTable( self.survivabilityTableName )
	self.paramsWnd			= UI:CreateWndFromTable( self.paramsTableName )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	UI:AddChildAndLink( self, self.shipSlotWnd, mainEffect, self.effectInfo.main.shipSlotLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.commitBtn, mainEffect, self.effectInfo.main.commitBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.buyBtn, mainEffect, self.effectInfo.main.buyBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.dlcBtn, mainEffect, self.effectInfo.main.buyBtnLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.mainParamsWnd, mainEffect, self.effectInfo.main.mainParamsLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.survivabilityWnd, mainEffect, self.effectInfo.main.survivabilityLocator, UI.EffectAnimParams.POS )
	UI:AddChildAndLink( self, self.paramsWnd, mainEffect, self.effectInfo.main.paramsLocator, UI.EffectAnimParams.POS )

end


--
function UI.ShipsTree_EvolvingEditWnd:ResetContent()

	self:SetText( "", self.layers.SHIP_NAME )
	self:SetLayerVisible( false, self.layers.LOCK_REASON )
	self:SetLayerVisible( false, self.layers.ADVERT_TEXT )

	self:SetLayerVisible( false, self.layers.SYNERGY )
	self.synergyMetaText:SetText( "", true )

	self.shipSlotWnd:Reset()

	self.commitBtn:UnlinkFromParent()
	self.buyBtn:UnlinkFromParent()
	self.dlcBtn:UnlinkFromParent()

	self:HideItemsSlots()

	if self.mainParamsWnd:IsChildOf( self ) then
		self.mainParamsWnd:Reset()
		self.mainParamsWnd:UnlinkFromParent()
	end

	if self.paramsWnd:IsChildOf( self ) then
		self.paramsWnd:Reset()
		self.paramsWnd:UnlinkFromParent()
	end

	if self.survivabilityWnd:IsChildOf( self ) then
		self.survivabilityWnd:Reset()
		self.survivabilityWnd:UnlinkFromParent()
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:FullUpdate()

	self:ResetContent()                                             

	if self.baseDefName == "" then
		return
	end

	self.shipItem = UI:GetEvolvingShipItem( self.baseDefName )

	self:UpdateShipSlot()	-- должно быть до апдейта всего остального, т.к. из слота потом получается информация

	self:UpdateShipName()
	self:UpdateLockReason()
	self:UpdateAdvertText()
	self:UpdateSynergy()
	self:UpdateBuyBtn()
	self:UpdateCommitBtn()	
	self:UpdateParams()
	self:UpdateItemsSlots()
	self:UpdateMainParams()
	self:UpdateSurvivability()

	self:RecalcLayout()

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateShipName()

	local name = UI:GetEntityLocalizedNameByDef( self.shipSlotWnd:GetDefNameForVisualization(), true, false, nil, nil, true )
	self:SetText( name, self.layers.SHIP_NAME )

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateShipSlot()

	self.shipSlotWnd:Setup( self.baseDefName )

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateLockReason()

	local text = ""

	if self:IsBought() then

		if self:IsInBattle() then
			text = UI:GetStringByName( "inBattle" )
		end

	else

		if not UI:IsShipAdvert( self.baseDefName ) then
			
			local needRank	= UI:GetItemRequiredAccountRank( self.baseDefName )
			local isRank	= UI:GetPlayerAccountRank()

			if needRank > isRank then

				local strNeedRank = UI:Num2StrSeparatedBy3( needRank )
				text = UI:GetStringByName( "shipsTree_accountRankRequired" )

				local numSubst = 0
				text, numSubst = string.gsub( text, "%$rank%$", strNeedRank )

				if numSubst == 0 then
					sys.log( "UI.ShipsTree_EvolvingEditWnd:UpdateLockReason()[ERROR]: cannot find placeholder \"$rank$\" in string \"shipsTree_accountRankRequired\"" )
					text = string.format( "[INVALID STRING] Required account-rank: %s", strNeedRank )
				end
				
			end
			
		end

	end

	if text ~= "" then
		self:SetLayerVisible( true, self.layers.LOCK_REASON )
		self:SetText( text, self.layers.LOCK_REASON )
	else
		self:SetLayerVisible( false, self.layers.LOCK_REASON )
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateAdvertText()

	local bNeedAdvertText = not self:IsBought() and UI:IsShipAdvert( self.baseDefName )
	self:SetLayerVisible( bNeedAdvertText, self.layers.ADVERT_TEXT )

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateSynergy()

	if self:IsBought() then		

		-- внутрення синергия корабля

		local shipSynergy = UI:GetShipExp( self.shipItem )

		local shipSynergyPriceInfo =
		{
			priceType	= UI.exPriceTypes.SYNERGY,
			val			= shipSynergy,
			bIsBuyPrice	= false,
		}

		local strShipSynergyVal = UI:PriceInfo2Str( shipSynergyPriceInfo, self:GetColor( self.layers.SYNERGY ), nil, nil, true, nil )
		local strShipSynergy = UI:GetStringByName( "shipsTree_synergyForNodes" )
		
		local numSubst = 0
		strShipSynergy, numSubst = string.gsub( strShipSynergy, "%$val%$", strShipSynergyVal )

		if numSubst == 0 then
			sys.log( "UI.ShipsTree_EvolvingEditWnd:UpdateSynergy()[ERROR]: cannot find placeholder \"$val$\" in string \"shipsTree_synergyForNodes\"" )
			strShipSynergy = string.format( "[INVALID STRING] Synergy: %s", strShipSynergyVal )
		end		


		-- свободная синергия

		local freeSynergy = UI:GetPlayerFreeSynergy()

		local freeSynergyPriceInfo =
		{
			priceType	= UI.exPriceTypes.FREE_SYNERGY,
			val			= freeSynergy,
			bIsBuyPrice	= false,
		}

		local strFreeSynergyVal = UI:PriceInfo2Str( freeSynergyPriceInfo, self:GetColor( self.layers.SYNERGY ), nil, nil, true, nil )
		local strFreeSynergy = UI:GetStringByName( "shipsTree_freeSynergyForNodes" )
		
		strFreeSynergy, numSubst = string.gsub( strFreeSynergy, "%$val%$", strFreeSynergyVal )

		if numSubst == 0 then
			sys.log( "UI.ShipsTree_EvolvingEditWnd:UpdateSynergy()[ERROR]: cannot find placeholder \"$val$\" in string \"shipsTree_freeSynergyForNodes\"" )
			strFreeSynergy = string.format( "[INVALID STRING] Free synergy: %s", strFreeSynergyVal )
		end


		-- всё вместе

		self:SetLayerVisible( true, self.layers.SYNERGY )

		local str = string.format( "%s|%s", strShipSynergy, strFreeSynergy ) 
		self.synergyMetaText:SetText( str, true )

	else

		self:SetLayerVisible( false, self.layers.SYNERGY )
		self.synergyMetaText:SetText( "", true )

	end

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateBuyBtn()

	self.buyBtn:UnlinkFromParent()
	self.dlcBtn:UnlinkFromParent()

	if not self:IsBought() and not UI:IsShipAdvert( self.baseDefName ) then
	
		if UI:IsShipDlc( self.baseDefName ) then
			self:AddChild( self.dlcBtn )
		else
			if UI:GetItemRequiredAccountRank( self.baseDefName ) <= UI:GetPlayerAccountRank() then
				self:AddChild( self.buyBtn )
			end
		end
		
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateCommitBtn()

	if self:IsBought() and not self:IsInBattle() then

		self:AddChild( self.commitBtn )
		self.commitBtn:Enable( self.shipSlotWnd:GetChosenActiveNodesMask() ~= nil )

	else
		self.commitBtn:UnlinkFromParent()
	end		

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateParams()

	local bJustInited = false

	if self:IsBought() then

		if not self.mainParamsWnd:IsChildOf( self ) then

			self:AddChild( self.paramsWnd )
			self.paramsWnd:Setup( self.baseDefName, self:GetChosenActiveNodesMask() )

			bJustInited = true

		end

	else

		self.mainParamsWnd:Reset()
		self.mainParamsWnd:UnlinkFromParent()

	end

	return bJustInited

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateItemsSlots()

	if self:IsBought() then

		if not self.itemSlotsWnd:IsOnScreen() then
			UI.Root:AddChild( self.itemSlotsWnd )
			UI.Root:MoveChildAfter( self.itemSlotsWnd, UI.HangarWnd )	-- чтобы не показалось поверх окна AlienShipCraftWnd/SpecialShipCraftWnd
		else
			self.itemSlotsWnd:OnSelShipChanged()
		end

	else
		self:HideItemsSlots()
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateMainParams()

	local bJustInited = false

	if self:IsBought() then

		if not self.mainParamsWnd:IsChildOf( self ) then

			self:AddChild( self.mainParamsWnd )
			self.mainParamsWnd:Setup( self.baseDefName, self:GetChosenActiveNodesMask() )

			bJustInited = true

		end

	else

		self.mainParamsWnd:Reset()
		self.mainParamsWnd:UnlinkFromParent()

	end

	return bJustInited

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateSurvivability()

	local bJustInited = false

	if self:IsBought() then

		if not self.survivabilityWnd:IsChildOf( self ) then

			self:AddChild( self.survivabilityWnd )
			self.survivabilityWnd:Setup( self.baseDefName, self:GetChosenActiveNodesMask() )

			bJustInited = true

		end

	else

		self.survivabilityWnd:Reset()
		self.survivabilityWnd:UnlinkFromParent()

	end

	return bJustInited

end


--
function UI.ShipsTree_EvolvingEditWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local minSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local maxSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )

	self.minHeight	= minSize.y
	self.maxHeight	= maxSize.y

end


--
function UI.ShipsTree_EvolvingEditWnd:RecalcLayout()

	-- собственный размер и анимация
	-- (локаторы нижних текстов и кнопок, а также слота смещаются анимацией)

	local selfHeight = UI.ShipsTreeWnd:GetShipsAvailableHeight()
	self:SetHeight( selfHeight )

	local width = self:XToParent( self:XToWindow( 1024 ) ) - self:GetLeft()		-- ширина на весь экран; на self нельзя расчитывать, т.к. он не увеличивается в зависимости от разрешения, и на больших разрешениях его может не хватить
	self:SetWidth( width )

	local animHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )
	local animTime = ( animHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

	self:UpdateMetaTextPos()

	self.itemSlotsWnd:RecalcLayout()
	self.paramsWnd:RecalcLayout()

end


--
function UI.ShipsTree_EvolvingEditWnd:IsBought()

	return self.shipItem ~= nil

end


--
function UI.ShipsTree_EvolvingEditWnd:IsInBattle()

	return
		self:IsBought()
		and UI:IsShipInBattle( self.shipItem )

end


--
function UI.ShipsTree_EvolvingEditWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then
		self:HideItemsSlots()
	end	

end


--
function UI.ShipsTree_EvolvingEditWnd:F_OnEventSaveUiState()

	self:HideItemsSlots()

end


--
function UI.ShipsTree_EvolvingEditWnd:HideItemsSlots()

	if self.itemSlotsWnd:IsOnScreen() then
		self.itemSlotsWnd:Reset()
		self.itemSlotsWnd:UnlinkFromParent()	
	end

end


--
function UI.ShipsTree_EvolvingEditWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ShipsTree_EvolvingEditWnd:UpdateZOrder()

	if self.paramsWnd and self.paramsWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( self.paramsWnd )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEditWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEditWnd =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "ShipsTree_EvolvingEditWnd",

    	props =
    	{
    		name	= "ShipsTree_AlienEditWnd",
    	},
	},

    itemsSlotsTableName		= "UI.ShipsTree_AlienEdit_ItemsWnd",
    shipSlotTableName		= "UI.ShipsTree_AlienEdit_ShipSlotWnd",
    commitBtnTableName		= "UI.ShipsTree_AlienEdit_CommitBtn",
    buyBtnTableName			= "UI.ShipsTree_AlienEdit_BuyBtn",
    mainParamsTableName		= "UI.ShipsTree_AlienEdit_MainParamsWnd",
    survivabilityTableName	= "UI.ShipsTree_AlienEdit_SurvivabilityWnd",
    paramsTableName			= "UI.ShipsTree_AlienEdit_ParamsWnd",
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEditWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEditWnd =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "ShipsTree_EvolvingEditWnd",

    	props =
    	{
    		name	= "ShipsTree_SpecialEditWnd",
    	},
	},

    itemsSlotsTableName		= "UI.ShipsTree_SpecialEdit_ItemsWnd",
    shipSlotTableName		= "UI.ShipsTree_SpecialEdit_ShipSlotWnd",
    commitBtnTableName		= "UI.ShipsTree_SpecialEdit_CommitBtn",
    buyBtnTableName			= "UI.ShipsTree_SpecialEdit_BuyBtn",
    mainParamsTableName		= "UI.ShipsTree_SpecialEdit_MainParamsWnd",
    survivabilityTableName	= "UI.ShipsTree_SpecialEdit_SurvivabilityWnd",
    paramsTableName			= "UI.ShipsTree_SpecialEdit_ParamsWnd",
}

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_CommitBtn
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_CommitBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",

		props =
		{
			name		= "ShipsTree_EvolvingEdit_CommitBtn",
			isPrototype	= true,
		}
	},

	textId = "shipsTree_commitChosenNodes"
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_CommitBtn
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_CommitBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipsTree_EvolvingEdit_CommitBtn",

		props =
		{
			name		= "ShipsTree_AlienEdit_CommitBtn",
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
    				defName 			= "textBtn13",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_CommitBtn
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_CommitBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipsTree_EvolvingEdit_CommitBtn",

		props =
		{
			name		= "ShipsTree_SpecialEdit_CommitBtn",
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
    				defName 			= "textBtn11",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",	
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "title_1",
    						layer		= "UI.TextBtn.layers.TEXT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
    		},
		}
	},
}

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_BuyBtn
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_BuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn11",

		props =
		{
			name	= "ShipsTree_EvolvingEdit_BuyBtn",
			isPrototype	= true,
		}
	},

	textId = "shipCraft_craftBtn"
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_BuyBtn
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_BuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipsTree_EvolvingEdit_BuyBtn",

		props =
		{
			name		= "ShipsTree_AlienEdit_BuyBtn",
		}
	},
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_BuyBtn
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_BuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "ShipsTree_EvolvingEdit_BuyBtn",

		props =
		{
			name		= "ShipsTree_SpecialEdit_BuyBtn",
		}
	},
}

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_ShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_ShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers =
{
    MAIN_EFFECT									= 0, 
	BATTLE_SLOT_EFFECT							= 1, 
	RANK										= 2, 
    ROLE_ICO_EFFECT								= 3, 
	LINKS										= 4, 
	EVOLUTION_BAR_BG_EFFECT						= 5, 
	EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT	= 6, 
	EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5    = 7, 
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6	= 8, 
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7	= 9, 
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8	= 10,
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9	= 11,
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10	= 12,
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11   = 13,
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12	= 14,
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13	= 15,
    EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14	= 16,
    EVOLUTION_BAR_PROGRESSES_EFFECT				= 17,
    EVOLUTION_BAR_PROGRESS_EFFECT_5				= 18,
    EVOLUTION_BAR_PROGRESS_EFFECT_6				= 19,
    EVOLUTION_BAR_PROGRESS_EFFECT_7				= 20,
    EVOLUTION_BAR_PROGRESS_EFFECT_8				= 21,
    EVOLUTION_BAR_PROGRESS_EFFECT_9				= 22,
    EVOLUTION_BAR_PROGRESS_EFFECT_10			= 23,
    EVOLUTION_BAR_PROGRESS_EFFECT_11			= 24,
    EVOLUTION_BAR_PROGRESS_EFFECT_12			= 25,
    EVOLUTION_BAR_PROGRESS_EFFECT_13			= 26,
    EVOLUTION_BAR_PROGRESS_EFFECT_14			= 27,
	EVOLUTION_VAL								= 28, 
    IN_BATTLE_EFFECT							= 29,
	LOCK_EFFECT									= 30,
}

--
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "ShipsTree_EvolvingEdit_ShipSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_VAL,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- BATTLE_SLOT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ROLE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- LINKS
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_bg",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESSES_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_5
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_6
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_7
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_8
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_9
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_10
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_11
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_12
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_13
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_14
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- EVOLUTION_VAL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_inBattle",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:Setup( baseDefName )

	self:Reset()

	self.baseDefName = baseDefName
	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:Reset()

	self.baseDefName			= ""
	self.shipItem				= nil
	self.shownNodesGroup		= -1

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self.shipIcoWnd:Reset()
	
	self:SetLayerVisible( false, self.layers.IN_BATTLE_EFFECT )
	self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
	self:SetLayerVisible( false, self.layers.BATTLE_SLOT_EFFECT )
	self:SetLayerVisible( false, self.layers.EVOLUTION_VAL )

	self:SetText( "", self.layers.RANK )

	self:ResetEvolutionBar()
	self:ResetNodes()
	self:ResetLinks()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetBaseDefName()

	return self.baseDefName

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GeCurDefName()

	return self.shipItem and self.shipItem.defName or self.baseDefName

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetVid()

	return self.shipItem and self.shipItem.vid or UI.INVALID_U64_ID

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetShipItem()

	return self.shipItem

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsBought()

	return self.shipItem ~= nil

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnOwnedVessels()

	self.shipItem = UI:GetEvolvingShipItem( self.baseDefName )

	self:CheckResetActiveNodesChoice()

	self:UpdateMainEffect()
	self:UpdateShipIco()
	self:UpdateRank()
	self:UpdateEvolutionBar()
	self:UpdateEvolutionVal()
	self:UpdateNodes()
	self:UpdateLinks()
	self:UpdateBattleSlot()
	self:UpdateInBattleEffect()
	self:UpdateLockEffect()
	self:UpdateTooltip()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnBattleSlotsChanged()

	if self:IsBought() then
		self:UpdateBattleSlot()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnResourcesChanged()

	if self:IsBought() then
		self:UpdateNodes()
		self:UpdateLinks()
	end
	
end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:TryChooseNode( selNode, bChoose )

	if not self:IsActiveNodeChoiceEnabled() then
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:TryChooseNode()[ERROR]: cannot change nodes on this ship right now" )
		return
	end

	local realMask		= UI:GetEvolvingShipActiveNodesMask( self.shipItem.vid )
	local chosenMask	= u64( self.chosenActiveNodesMask or realMask )


	local function fnDeactivateChildNodes( node )

		for childIdx, childNode in pairs( node.children ) do
			UI:BitRstU64( chosenMask, UI:GetEvolvingShipNodeId( childNode.name ) )
			fnDeactivateChildNodes( childNode )			
		end

	end


	local function fnDeactivateNonFitRanks()

		local maxAvailableRank	= -1

		local evolution			= 0
		local minRank			= UI:GetEvolvingShipMinRank( self.baseDefName )
		local maxRank			= UI:GetEvolvingShipMaxRank( self.baseDefName )

		local nodesByRank = {}

		for nodeIdx, node in pairs( self.nodes ) do

			if nodesByRank[ node.rank ] == nil then
				nodesByRank[ node.rank ] = {}
			end

			table.insert( nodesByRank[ node.rank ], node )

		end

		for rank = minRank, maxRank do

			local needEvolution = UI:GetEvolvingShipRankEvolutionCost( self.baseDefName, rank )
			if evolution >= needEvolution then

				maxAvailableRank = rank

				if nodesByRank[ rank ] then

					for nodeIdx, node in pairs( nodesByRank[ rank ] ) do

						if UI:BitTstU64( chosenMask, UI:GetEvolvingShipNodeId( node.name ) ) then
							evolution = evolution + UI:GetEvolvingShipNodeEvolutionPoints( node.name )
						end

					end

				end

			else
				break
			end
			
		end
	
		for rank = minRank, maxRank do

			if rank > maxAvailableRank then

				if nodesByRank[ rank ] then

					for nodeIdx, node in pairs( nodesByRank[ rank ] ) do
						UI:BitRstU64( chosenMask, UI:GetEvolvingShipNodeId( node.name ) )
					end

				end

			end

		end

	end


	if bChoose then

		-- деактивируются ноды той же группы

		local group = UI:GetEvolvingShipNodeGroup( selNode.name )
		if group ~= -1 then

			for nodeIdx, node in pairs( self.nodes ) do
				if node ~= selNode and UI:GetEvolvingShipNodeGroup( node.name ) == group then

					UI:BitRstU64( chosenMask, UI:GetEvolvingShipNodeId( node.name ) )

					-- деактививируются дочерние ноды
					fnDeactivateChildNodes( node )

				end
			end

		end

		-- деактививируются последующие ранги, если они на них перестало хватать очков эволюции
		fnDeactivateNonFitRanks()

		-- после деактивации прежней ноды в группе ранг корабля может уменьшиться, и новая нода может стать недоступной по рангу;
		-- в этом случае нода не деактивируется, показывается сообщение		

		local rank = UI:CalcEvolvingShipRankFromNodesMask( self.baseDefName, chosenMask )
		if rank < selNode.rank then

			UI:MessageBox( UI:GetStringByName( "shipsTree_msg_cannotActivateGroupNode_caption" ), UI:GetStringByName( "shipsTree_msg_cannotActivateGroupNode_text" ), UI.MBS_OK )
			return

		end

		-- активация

		UI:BitSetU64( chosenMask, UI:GetEvolvingShipNodeId( selNode.name ) )

	else

		UI:BitRstU64( chosenMask, UI:GetEvolvingShipNodeId( selNode.name ) )

		-- деактививируются дочерние ноды
		fnDeactivateChildNodes( selNode )

		-- деактививируются последующие ранги, если они на них перестало хватать очков эволюции
		fnDeactivateNonFitRanks()

		-- в результате вторичных деактиваций могли быть деактивированы все ноды в группах,
		-- в которых обязательно должна быть одна из нод активирована (группы, где есть нода с параметром is_default);
		-- поэтому здесь активируется дефолтная нода в каждой такой группе

		local groupsInfo = {}	

		for nodeIdx, node in pairs( self.nodes ) do

			local group = UI:GetEvolvingShipNodeGroup( node.name )
			if group ~= -1 then

				local groupInfo = groupsInfo[ group ]

				if not groupInfo then

					groupInfo =
					{
						nodes		= {},
						defaultNode	= nil,
					}

					groupsInfo[ group ] = groupInfo

				end

				table.insert( groupInfo.nodes, node )

				if UI:IsEvolvingShipNodeGroupDefault( node.name ) then
					groupInfo.defaultNode = node
				end				

			end

		end		

		local rank = UI:CalcEvolvingShipRankFromNodesMask( self.baseDefName, chosenMask )

		for group, groupInfo in ipairs( groupsInfo ) do

			if groupInfo.defaultNode then

				local bHasActive = false

				for nodeIdx, node in pairs( groupInfo.nodes ) do

					if UI:BitTstU64( chosenMask, UI:GetEvolvingShipNodeId( node.name ) ) then
						bHasActive = true
						break
					end

				end
				
				if not bHasActive then

					local bCanActivateDefault = groupInfo.defaultNode.rank <= rank

					if bCanActivateDefault then

						-- по идее, родителя у дефолтной ноды не должно быть, но всё равно проверка на всякий случай
						if groupInfo.defaultNode.parent then

							if not UI:BitTstU64( chosenMask, UI:GetEvolvingShipNodeId( groupInfo.defaultNode.parent.name ) ) then
								bCanActivateDefault = false
							end

						end

					end

					if bCanActivateDefault then
						UI:BitSetU64( chosenMask, UI:GetEvolvingShipNodeId( groupInfo.defaultNode.name ) )
					else
						sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:TryChooseNode()[ERROR]: cannot activate default node for group %d on ship %s", group, self.baseDefName )
					end

				end

			end

		end

	end


	local chosenActiveNodesMask_old = self.chosenActiveNodesMask

	if chosenMask ~= realMask then	
		self.chosenActiveNodesMask = chosenMask
	else
		self.chosenActiveNodesMask = nil
	end

	if self.chosenActiveNodesMask ~= chosenActiveNodesMask_old then
		self:OnChosenActiveNodesChanged()
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetChosenActiveNodesMask()

	return self.chosenActiveNodesMask

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:SetChosenActiveNodesMask( chosenActiveNodesMask )

	if not self:IsBought() then
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:SetChosenActiveNodesMask()[ERROR]: cannot set chosen nodes mask; the ship is not bought" )
		return
	end

	local chosenActiveNodesMask_old = self.chosenActiveNodesMask
	self.chosenActiveNodesMask = chosenActiveNodesMask

	if self.chosenActiveNodesMask ~= chosenActiveNodesMask_old then
		self:OnChosenActiveNodesChanged()
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnVesselUnlockNode()

	self:UpdateEvolutionBar()
	self:UpdateEvolutionVal()
	self:UpdateNodes()
	self:UpdateLinks()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnVesselLevelUp( vid )

	if self:IsBought() then

		if vid == self.shipItem.vid then
			self:UpdateNodes()
			self:UpdateLinks()
		end

	end	

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnExtractVesselExp()

	self:UpdateNodes()
	self:UpdateLinks()

end


-- здесь может меняться свободная синергия, необходимая для изучения нодов
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnPlayerCreditsChanged()

	if not self:IsBought() then
		return
	end

	self:UpdateNodes()
	self:UpdateLinks()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnQuestsChanged()

	if not self:IsBought() then
		return
	end

	self:UpdateNodes()
	self:UpdateLinks()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnNodeMouseIn( nodeWnd, mouseX, mouseY, wndThatReceivedInput )

	self:UpdateNodesGroup()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnNodeMouseOut( nodeWnd, mouseX, mouseY, wndThatReceivedInput )

	self:UpdateNodesGroup()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnPlayerAccountRankChanged()

	self:UpdateNodes()
	self:UpdateLinks()
	
	if not self:IsBought() then
		self:UpdateMainEffect()
		self:UpdateLockEffect()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ShowNoticeOnNode( nodeName )
	
	local bFound = false
	
	for idx, nodeWnd in pairs( self.curNodeWnds ) do
	
		local node = nodeWnd:GetNode()
		if node.name == nodeName then
		
			nodeWnd:ShowNotice( true)
			bFound = true
			break
			
		end

	end
	
	if not bFound then
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ShowNoticeOnNode()[ERROR]: canot find node %s", nodeName )
	end
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ShipSlotWnd.effectInfo =
{
	main =
	{
		animIdle			= "idle",
		animLocked			= "disable",
		centerLocator		= "center",
		shipicoLocator		= "ship_ico",
	},

	shipIco =
	{
		spriteName = "ship_ico",
	},

	roleIco =
	{
		spriteName = "ico",
	},

	evolutionBarOverlay =
	{
		nodeLocarorPrefix = "point_",
	},

	linkCircle =
	{
		[ 1 ] =
		{
    		effectName		= "",
    		radiusLocator	= "radius",
    		centerLocator	= "center",
    		animActive		= "active",
    		animInactive	= "bought",
			animLocked		= "idle",
		},

		[ 2 ] = 
		{
    		effectName		= "",
    		radiusLocator	= "radius",
    		centerLocator	= "center",
    		animActive		= "active",
    		animInactive	= "bought",
			animLocked		= "idle",
		},

		[ 3 ] = 
		{
    		effectName		= "",
    		radiusLocator	= "radius",
    		centerLocator	= "center",
    		animActive		= "active",
    		animInactive	= "bought",
			animLocked		= "idle",
		}
	},

	linkLine =
	{
		effectName		= "",
		sizeLocator		= "self",
		animActive		= "ictive",
    	animInactive	= "bought",
		animLocked		= "idle",
	},

	battleSlot =
	{
		animIdle	= "idle",
	}
}

-- диапазон рангов, на который рассчитаны эффекты
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.MIN_RANK	= 5
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.MAX_RANK	= 15

UI.ShipsTree_EvolvingEdit_ShipSlotWnd.MAX_NODE_CIRCLE	= 3

UI.ShipsTree_EvolvingEdit_ShipSlotWnd.smallRankNodePrototype	= ""
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.bigRankNodePrototype		= ""

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ShipSlotWnd.baseDefName						= ""
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.shipItem							= nil
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.allRankNodeWndsSmall				= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.allRankNodeWndsBig				= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.curRankNodeWnds					= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.allRegularNodeWnds				= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.allNonActivatableLockedNodeWnds	= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.allSpecModuleNodeWnds				= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.curNodeWnds						= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.nodes								= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.chosenActiveNodesMask				= nil
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.chosenDefName						= ""
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.links								= {}	-- ВНИМАНИЕ! не регулярный массив
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.linkCircleEffectsPool				= {}	-- ВНИМАНИЕ! для каждого круга - не регулярный массив
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.centerPos							= Vec2( 0, 0 )
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.linkCircleRadius_abs				= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.linkCircleCenterPos				= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.linkLineSize_abs					= Vec2( 0, 0 )
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.linkCircleWidth_abs				= {}	-- толщина линии окружности
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.lineAngleRadius					= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.linksEffectLayerPool				= nil
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.linkLineEffectsPool				= {}
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.shownNodesGroup					= -1
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.shipIcoWnd						= nil
UI.ShipsTree_EvolvingEdit_ShipSlotWnd.evolutionBarTooltipAreaWnd		= nil

-- ---------------------------------
-- work function
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )	

    self.allRankNodeWndsSmall				= {}
    self.allRankNodeWndsBig					= {}
    self.curRankNodeWnds					= {}
    self.allRegularNodeWnds					= {}
    self.allNonActivatableLockedNodeWnds	= {}
    self.allSpecModuleNodeWnds				= {}
    self.curNodeWnds						= {}
    self.nodes								= {}
    self.links								= {}
    self.linkCircleEffectsPool				= {}
    self.centerPos							= Vec2( 0, 0 )
    self.linkCircleRadius_abs				= {}
    self.linkCircleCenterPos				= {}
    self.linkLineSize_abs					= Vec2( 0, 0 )
    self.linkCircleWidth_abs				= {}
    self.lineAngleRadius					= {}
    self.linkLineEffectsPool				= {}

	if self:IsPrototype() then
		return
	end

	for circle = 1, self.MAX_NODE_CIRCLE do

		self.linkCircleEffectsPool[ circle ]	= {}
		self.linkCircleCenterPos[ circle ]		= Vec2( 0, 0 )
		self.linkCircleRadius_abs[ circle ]		= 0
		self.linkCircleWidth_abs[ circle ]		= 0
		self.lineAngleRadius[ circle ]			= 0

	end

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:F_Shutdown()

	if not self:IsPrototype() then
		self:DestroyEffects()
	end	

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:DestroyEffects()

	if self.linksEffectLayerPool then
		self.linksEffectLayerPool:Clear()
	end

	for linkIdx, link in pairs( self.links ) do
		for effectName, effects in pairs( link.effects ) do
			for effectIdx, effect in pairs( effects ) do
				_G.UI_DestroyEffect( effect )
			end
			link.effects[ effectName ] = nil
		end
	end

	for circle = 1, self.MAX_NODE_CIRCLE do
    	for idx, effect in pairs( self.linkCircleEffectsPool[ circle ] ) do
    		_G.UI_DestroyEffect( effect )
    	end
		self.linkCircleEffectsPool[ circle ] = {}
	end

	for idx, effect in pairs( self.linkLineEffectsPool ) do
		_G.UI_DestroyEffect( effect )
	end
	self.linkLineEffectsPool = {}

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateControls()	

	self.evolutionBarTooltipAreaWnd	= UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd, "" )
	self:AddChild( self.evolutionBarTooltipAreaWnd )

	self.shipIcoWnd = UI:CreateChildWnd( self, UI.ShipsTree_Evolving_ShipIcoWnd, "" )
	self.shipIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )	-- иконку для корабля показывает элемент self.evolutionBarTooltipAreaWnd

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.shipIcoWnd, mainEffect, self.effectInfo.main.shipicoLocator, UI.EffectAnimParams.POS )

	for idx = 1, 6 do
		self:CreateRankNodeWndBig()
	end

	for idx = 1, 5 do
		self:CreateRankNodeWndSmall()
	end

	for idx = 1, 10 do
		self:CreateRegularNodeWnd()
	end

	for idx = 1, 1 do
		self:CreateNonActivatableLockedNodeWnd()
	end

	for idx = 1, 4 do
		self:CreateSpecModuleNodeWnd()
	end

	for circle = 1, self.MAX_NODE_CIRCLE do
		for idx = 1, 5 do
			self:CreateLinkCircleEffect( circle )
		end
	end

	for idx = 1, 5 do
		self:CreateLinkLineEffect()
	end

	self.linksEffectLayerPool = self:GetEffectsPool( self.layers.LINKS )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:PrepareLayout()

	local uiHandle = self:GetUiHandle()

	local mainEffect						= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local linkLineIdx, linkLineEffect		= next( self.linkLineEffectsPool )

	self.centerPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.centerLocator ) or Vec2( 0, 0 )

	self.linkLineSize_abs = linkLineEffect and linkLineEffect:GetObjSize( self.effectInfo.linkLine.sizeLocator ) or Vec2( 0, 0 )
	self.linkLineSize_abs.x = UI:XToAbs( self.linkLineSize_abs.x )
	self.linkLineSize_abs.y = UI:YToAbs( self.linkLineSize_abs.y )

	for circle = 1, self.MAX_NODE_CIRCLE do

		local linkCircleIdx, linkCircleEffect = next( self.linkCircleEffectsPool[ circle ] )

        self.linkCircleRadius_abs[ circle ]	= UI:XToAbs( linkCircleEffect and linkCircleEffect:GetObjSize( self.effectInfo.linkCircle[ circle ].radiusLocator ).x or 0 )
    	self.linkCircleCenterPos[ circle ]	= linkCircleEffect and linkCircleEffect:GetObjPos( self.effectInfo.linkCircle[ circle ].centerLocator ) or Vec2( 0, 0 )
		self.linkCircleWidth_abs[ circle ]	= self.linkLineSize_abs.x
		self.lineAngleRadius[ circle ]		= self:CalcAngleRadius( self.linkLineSize_abs.x * 0.5, self.linkCircleRadius_abs[ circle ] )

	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:FullUpdate()

	self:InitEvolutionBar()
	self:InitNodes()	-- вызывать после InitEvolutionBar(), т.к. используются ее результаты
	self:InitLinks()	-- вызывать после InitEvolutionBar() и InitNodes(), т.к. используются их результаты

	self.shipItem = UI:GetEvolvingShipItem( self.baseDefName )

	self:UpdateMainEffect()
	self:UpdateShipIco()
	self:UpdateRank()
	self:UpdateRoleIco()
	self:UpdateEvolutionBar()
	self:UpdateEvolutionVal()
	self:UpdateNodes()
	self:UpdateLinks()	-- вызывать после UpdateEvolutionBar() и UpdateNodes(), т.к. используются их результаты
	self:UpdateBattleSlot()
	self:UpdateInBattleEffect()
	self:UpdateLockEffect()
	self:UpdateTooltip()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateMainEffect()

	-- залоченная анимация делает серым иконку роли, ранг

	local bLocked = false

	if self:IsBought() then
		if self:IsInBattle() then
			bLocked = true
		end
	else
		if UI:IsShipAdvert( self.baseDefName ) or UI:GetItemRequiredAccountRank( self.baseDefName ) > UI:GetPlayerAccountRank() then
			bLocked = true
		end
	end

	local anim = bLocked and self.effectInfo.main.animLocked or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateShipIco()

	local texName = UI:GetAlienShipTreeIcoName( self:GetDefNameForVisualization() )

	if self:IsBought() then

		if self:IsInBattle() then
			texName = string.format( "%s_locked", texName )
		end

	else

		if UI:IsShipAdvert( self.baseDefName ) then
			texName = string.format( "%s_advert", texName )
		else
			texName = string.format( "%s_locked", texName )
		end

	end

	local hTex = UI:GetTex( texName )
	self.shipIcoWnd:SetTex( hTex )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateRank()

	local rank = self:GetRankForVisualization()

	local strRank = tostring( rank )
	self:SetText( strRank, self.layers.RANK )

	local color = UI:GetItemColor( self.baseDefName )
	self:SetColor( color, self.layers.RANK )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateRoleIco()

	local role = UI:GetItemRole( self.baseDefName )
	local color = UI:GetItemColor( self.baseDefName )

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, UI:GetRoleIco( role ) )
		roleIcoEffect:SetColor( color )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateBattleSlot()

	if self:IsBought() then

		self:SetLayerVisible( true, self.layers.BATTLE_SLOT_EFFECT )

		local slotId = UI:GetShipBattleSlot( self.shipItem )

		local anim = slotId ~= -1 and tostring( slotId ) or self.effectInfo.battleSlot.animIdle

    	local battleSlotEffect = UI:GetEffectFromLayer( self, self.layers.BATTLE_SLOT_EFFECT )
    	if battleSlotEffect then
    		battleSlotEffect:StartAnimation( anim )
    	end		

	else
		self:SetLayerVisible( false, self.layers.BATTLE_SLOT_EFFECT )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateInBattleEffect()

	self:SetLayerVisible( self:IsInBattle(), self.layers.IN_BATTLE_EFFECT )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateTooltip()

	local defName = self:GetDefNameForVisualization()

	local tooltipData =
	{
    	tooltipType		= UI.tooltipTypes.SHIP,
		defName			= defName,			
		vid				= self.shipItem and self.shipItem.vid or UI.INVALID_U64_ID,
		bCompare		= true,
		logEvent		= _G.MasterServer.PlayerAction.PA_VESSEL_TREE_TOOLTIP,
		chosenNodesMask	= self.chosenActiveNodesMask and u64( self.chosenActiveNodesMask ),
	}

	self.evolutionBarTooltipAreaWnd:SetShipIcoTooltipData( tooltipData )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateLockEffect()

	local bLockVisible =
		not self:IsBought()
		and not UI:IsShipAdvert( self.baseDefName )
		and UI:GetItemRequiredAccountRank( self.baseDefName ) > UI:GetPlayerAccountRank()

	self:SetLayerVisible( bLockVisible, self.layers.LOCK_EFFECT )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateNodesGroup()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateNodesGroup()

	local group = -1

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	if wndUnderMouse and wndUnderMouse:IsChildOf( self ) and UI:IsWndKindOf( wndUnderMouse, "ShipsTree_EvolvingEdit_NodeWnd" ) then

		local node = wndUnderMouse:GetNode()

		if not( UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED and UI:CantBeBoughtEvolvingShipNode( node.name ) ) then
			group = UI:GetEvolvingShipNodeGroup( node.name )
		end

	end

	if group ~= self.shownNodesGroup then

		self.shownNodesGroup = group

    	for idx, nodeWnd in pairs( self.curNodeWnds ) do
    		local node = nodeWnd:GetNode()
    		nodeWnd:ShowGroup( group ~= -1 and group == UI:GetEvolvingShipNodeGroup( node.name ) and not( UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED and UI:CantBeBoughtEvolvingShipNode( node.name ) ) )
    	end	

	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsInBattle()

	return
		self:IsBought()
		and UI:IsShipInBattle( self.shipItem )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcDefNameFromMask( mask )

	local defName = ""

	if mask == nil then
		return defName
	end

	local evolutionPoints = self:CalcEvolutionPointsFromMask( mask )
	local mainDefName = self:CalcDefNameFromEvolutionPoints( evolutionPoints )
	defName = mainDefName

	local nodesById = {}
	for nodeName, node in pairs( self.nodes ) do
		nodesById[ UI:GetEvolvingShipNodeId( node.name ) ] = node
	end

	for nodeId = 0, UI.ShipsTreeWnd.EVOLVING_NODE_MAX_ID do

		if UI:BitTstU64( mask, nodeId ) then

			local node = nodesById[ nodeId ]
			if node then

				if UI:IsEvolvingShipNodeOfTypeSpecModule( node.name ) then

    				local shipVariants = UI:GetEvolvingShipNodeShipVariants( node.name )
	        		altDefName = shipVariants[ mainDefName ]

					if altDefName ~= nil and altDefName ~= "" then
						defName = altDefName
					else
						sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcDefNameFromMask()[ERROR]: cannot find variant def for main def %s for node %s", mainDefName, node.name )
					end

					break

				end

			else
				sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcDefNameFromMask()[ERROR]: cannot find node with id %d", nodeId )
			end

		end

	end

	return defName

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcEvolutionPointsFromMask( mask )

	local evolutionPoints = 0

	if mask == nil then
		return evolutionPoints
	end

	local nodesById = {}

	for nodeName, node in pairs( self.nodes ) do
		nodesById[ UI:GetEvolvingShipNodeId( node.name ) ] = node
	end

	for nodeId = 0, UI.ShipsTreeWnd.EVOLVING_NODE_MAX_ID do

		if UI:BitTstU64( mask, nodeId ) then

			local node = nodesById[ nodeId ]
			if node then
				evolutionPoints = evolutionPoints + UI:GetEvolvingShipNodeEvolutionPoints( node.name )
			else
				sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcEvolutionPointsFromMask()[ERROR]: cannot find node with id %d", nodeId )
			end

		end

	end

	return evolutionPoints

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcDefNameFromEvolutionPoints( evolutionPoints )

	local chosenDefName = ""

	local defName = self.baseDefName
	while defName ~= "" do

		if UI:GetEvolvingShipEvolutionCost( defName ) > evolutionPoints then
			break
		end

		chosenDefName = defName

		defName = UI:GetEvolvingShipNextDef( defName )

	end	

	if chosenDefName == "" then
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcDefNameFromEvolutionPoints()[ERROR]: cannot find chosen def" )
	end

	return chosenDefName

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:OnChosenActiveNodesChanged()

	self.chosenDefName = self:CalcDefNameFromMask( self.chosenActiveNodesMask )

	self:UpdateShipIco()
	self:UpdateRank()
	self:UpdateEvolutionBar()
	self:UpdateEvolutionVal()
	self:UpdateNodes()
	self:UpdateLinks()
	self:UpdateTooltip()

	local parent = self:GetParent()
	if parent and parent.OnChosenActiveNodesChanged then
		parent:OnChosenActiveNodesChanged( self.baseDefName )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetDefNameForVisualization()

	if self.chosenDefName ~= "" then
		return self.chosenDefName

	elseif self.shipItem then
		return self.shipItem.defName

	else
		return self.baseDefName
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetRankForVisualization()

	local rank = -1

	local defName = self:GetDefNameForVisualization()
	if defName ~= "" then
		rank = UI:GetShipRank( defName )
	end

	return rank

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ObtainFreeRankNodeWndSmall()

	local freeNodeWnd = nil

	for idx, nodeWnd in pairs( self.allRankNodeWndsSmall ) do
		if not nodeWnd:IsChildOf( self ) then
			freeNodeWnd = nodeWnd
			break
		end
	end

	if not freeNodeWnd then
		freeNodeWnd = self:CreateRankNodeWndSmall()
	end

	if freeNodeWnd then
		self:AddChild( freeNodeWnd )
		table.insert( self.curRankNodeWnds, freeNodeWnd )
	end

	return freeNodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ObtainFreeRankNodeWndBig()

	local freeNodeWnd = nil

	for idx, nodeWnd in pairs( self.allRankNodeWndsBig ) do
		if not nodeWnd:IsChildOf( self ) then
			freeNodeWnd = nodeWnd
			break
		end
	end

	if not freeNodeWnd then
		freeNodeWnd = self:CreateRankNodeWndBig()
	end

	if freeNodeWnd then
		self:AddChild( freeNodeWnd )
		table.insert( self.curRankNodeWnds, freeNodeWnd )
	end

	return freeNodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateRankNodeWndSmall()

	local nodeWnd = UI:CreateChildWnd( self, UI[ self.smallRankNodePrototype ], #self.allRankNodeWndsSmall + 1 )

	if nodeWnd then
		table.insert( self.allRankNodeWndsSmall, nodeWnd )
	end

	return nodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateRankNodeWndBig()

	local nodeWnd = UI:CreateChildWnd( self, UI[ self.bigRankNodePrototype ], #self.allRankNodeWndsBig + 1 )

	if nodeWnd then
		table.insert( self.allRankNodeWndsBig, nodeWnd )
	end

	return nodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ResetEvolutionBar()

	self:SetLayerVisible( false, self.layers.EVOLUTION_BAR_BG_EFFECT )

	for idx, nodeWnd in pairs( self.curRankNodeWnds ) do
		nodeWnd:Reset()
		nodeWnd:UnlinkFromParent()
	end
	self.curRankNodeWnds = {}


	local firstProgressLayerName			= string.format( "EVOLUTION_BAR_PROGRESS_EFFECT_%d", self.MIN_RANK )
	local firstProgressLayer				= self.layers[ firstProgressLayerName ]
	local firstUnlockedProgressLayerName	= string.format( "EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_%d", self.MIN_RANK )
	local firstUnlockedProgressLayer		= self.layers[ firstUnlockedProgressLayerName ]	

	for rank = self.MIN_RANK, self.MAX_RANK - 1 do

		local progressLayer = firstProgressLayer + ( rank - self.MIN_RANK )
		self:SetLayerVisible( false, progressLayer )

		local unlockedProgressLayer = firstUnlockedProgressLayer + ( rank - self.MIN_RANK )
		self:SetLayerVisible( false, unlockedProgressLayer )

	end

	self.evolutionBarTooltipAreaWnd:Reset()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitEvolutionBar()

	self:ResetEvolutionBar()

	local minRank	= UI:GetEvolvingShipMinRank( self.baseDefName )
	local maxRank	= UI:GetEvolvingShipMaxRank( self.baseDefName )

	if minRank == -1 or maxRank == -1 then
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitEvolutionBar()[ERROR]: invalid ranks for ship %s", self.baseDefName )
		return
	end


	-- фон
	-- (эффект фона имеет ограниченный набор анимаций: для рангов 5-15, 7-15 и 9-15)

	local bgAnim = ""

	if maxRank == self.MAX_RANK then    	

    	local bgEffect = UI:GetEffectFromLayer( self, self.layers.EVOLUTION_BAR_BG_EFFECT )
    	if bgEffect then

			bgAnim = tostring( minRank )

			if bgEffect:HasAnimation( bgAnim ) then
				bgEffect:StartAnimation( bgAnim )
			else
				bgAnim = ""
			end
    		
    	end

	end

	if bgAnim ~= "" then
		self:SetLayerVisible( true, self.layers.EVOLUTION_BAR_BG_EFFECT )
	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitEvolutionBar()[ERROR]: cannot show evolution bg for ranks range %d-%d (ship %s)", minRank, maxRank, self.baseDefName )
	end


	-- ноды рангов

	local overlayEffect		= UI:GetEffectFromLayer( self, self.layers.EVOLUTION_BAR_PROGRESSES_EFFECT )
	local overlayEffectPos	= overlayEffect and overlayEffect:GetPos() or Vec2( 0, 0 )

	for rank = minRank, maxRank do

		local bOdd = math.fmod( rank, 2 ) ~= 0

		local nodeWnd = nil
		if bOdd then
			nodeWnd = self:ObtainFreeRankNodeWndBig()
		else
			nodeWnd = self:ObtainFreeRankNodeWndSmall()
		end

		nodeWnd:Init( rank )

		local pos = overlayEffect and overlayEffect:GetObjPos( string.format( "%s%d", self.effectInfo.evolutionBarOverlay.nodeLocarorPrefix, rank ) ) or UI:ZeroVec2()
		pos = pos + overlayEffectPos

		nodeWnd:SetPos( pos.x, pos.y )

	end


	-- прогресс между рангами

	if minRank < self.MIN_RANK or minRank > self.MAX_RANK or maxRank < self.MIN_RANK or maxRank > self.MAX_RANK then
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitEvolutionBar()[ERROR]: errors while showing evolution progress for ship %s - unsupported rank range %d-%d; %d-%d expected", self.baseDefName, minRank, maxRank, self.MIN_RANK, self.MAX_RANK )
	end

	local firstProgressLayerName			= string.format( "EVOLUTION_BAR_PROGRESS_EFFECT_%d", self.MIN_RANK )
	local firstProgressLayer				= self.layers[ firstProgressLayerName ]
	local firstUnlockedProgressLayerName	= string.format( "EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_%d", self.MIN_RANK )
	local firstUnlockedProgressLayer		= self.layers[ firstUnlockedProgressLayerName ]

	for rank = math.max( minRank, self.MIN_RANK ), math.min( maxRank, self.MAX_RANK ) - 1 do

		local progressLayer = firstProgressLayer + ( rank - self.MIN_RANK )
		self:SetLayerVisible( true, progressLayer )	

		local unlockedProgressLayer = firstUnlockedProgressLayer + ( rank - self.MIN_RANK )
		self:SetLayerVisible( true, unlockedProgressLayer )	

	end


	-- область окна для тултипа

	-- внутренний и внешний радиусы области нодов

	local centerPos_abs = Vec2( UI:PtToAbs( self.centerPos ) )

	local firstNodeWnd = self:GetRankNodeWndForRank( minRank )	
	local firstNodeRect = firstNodeWnd and firstNodeWnd:GetRect() or UI:ZeroQuat()
	local firstNodeCenter_abs = UI:PtToAbs( UI:Vec2( firstNodeRect.x + firstNodeRect.z * 0.5, firstNodeRect.y + firstNodeRect.w * 0.5 ) )

	local tooltipRadius_abs = UI:V2Length( firstNodeCenter_abs - centerPos_abs )

	local bigNodeWnd = self.allRankNodeWndsBig[ 1 ]
	local bigNodeRadius_abs = UI:XToAbs( bigNodeWnd and bigNodeWnd:GetWidth() * 0.5 or 0 )

	local tooltipMinRadius_abs	= tooltipRadius_abs - bigNodeRadius_abs
	local tooltipMaxRadius_abs	= tooltipRadius_abs + bigNodeRadius_abs


	-- сектор, где нет нодов, между первым и последним нодами
	-- (предполагается, что ноды располагаются по часовой стрелке)

	local tooltipGapMinAngle	= 0		-- край первого нода
	local tooltipGapMaxAngle	= 0		-- край последнего нода

	local minRankNodeWnd = self:GetRankNodeWndForRank( minRank )
	local maxRankNodeWnd = self:GetRankNodeWndForRank( maxRank )

	if minRankNodeWnd then

		local nodeRect = minRankNodeWnd:GetRect()
		local nodeCenter_abs = UI:PtToAbs( UI:Vec2( nodeRect.x + nodeRect.z * 0.5, nodeRect.y + nodeRect.w * 0.5 ) )

		local dir = nodeCenter_abs - centerPos_abs
		local nodeAngle = math.atan2( -dir.y, dir.x )
		local nodeRadius_abs = UI:XToAbs( nodeRect.z * 0.5 )
		local nodeAngleRadius = self:CalcAngleRadius( nodeRadius_abs, tooltipRadius_abs )

		tooltipGapMinAngle = UI:AngleNormalizePI( nodeAngle + nodeAngleRadius )
		
	end

	if maxRankNodeWnd then

		local nodeRect = maxRankNodeWnd:GetRect()
		local nodeCenter_abs = UI:PtToAbs( UI:Vec2( nodeRect.x + nodeRect.z * 0.5, nodeRect.y + nodeRect.w * 0.5 ) )

		local dir = nodeCenter_abs - centerPos_abs
		local nodeAngle = math.atan2( -dir.y, dir.x )
		local nodeRadius_abs = UI:XToAbs( nodeRect.z * 0.5 )
		local nodeAngleRadius = self:CalcAngleRadius( nodeRadius_abs, tooltipRadius_abs )

		tooltipGapMaxAngle = UI:AngleNormalizePI( nodeAngle - nodeAngleRadius )
		
	end

	self.evolutionBarTooltipAreaWnd:SetupLayout( self.centerPos, tooltipMinRadius_abs, tooltipMaxRadius_abs, tooltipGapMinAngle, tooltipGapMaxAngle )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateEvolutionBar()

	local curRank	= self:GetRankForVisualization()
	local minRank	= UI:GetEvolvingShipMinRank( self.baseDefName )
	local maxRank	= UI:GetEvolvingShipMaxRank( self.baseDefName )

	local evolutionPoints = 0

	if self.chosenActiveNodesMask ~= nil then
		evolutionPoints = self:CalcEvolutionPointsFromMask( self.chosenActiveNodesMask )

	elseif self.shipItem then
		evolutionPoints = UI:GetEvolvingShipEvolutionPoints( self.shipItem )		
	end

	local unlockedEvolutionPoints = self:IsBought() and self:GetUnlockedEvolutionPoints() or 0
	local maxEvolutionPoints = UI:GetEvolvingShipMaxEvolutionPoints( self.baseDefName, self.shipItem and UI:GetEvolvingShipUnlockedNodesMask( self.shipItem.vid ) )

	-- ноды рангов

	for idx, nodeWnd in pairs( self.curRankNodeWnds ) do

		local state = UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.LOCKED

		if self:IsBought() then

			local nodeRank = nodeWnd:GetRank()

    		if curRank ~= -1 and nodeRank <= curRank then

    			state = UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.ACTIVE

			else

				local rankEvolutionCost = UI:GetEvolvingShipRankEvolutionCost( self.baseDefName, nodeRank )

				local bUnlocked = unlockedEvolutionPoints >= rankEvolutionCost
				if bUnlocked then

					local bProgressBarFurther = nodeRank < maxRank and unlockedEvolutionPoints ~= rankEvolutionCost
					state = bProgressBarFurther and UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.UNLOCKED or UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.UNLOCKED_MAX

				end

    		end

		end

		nodeWnd:SetState( state )
		
	end


	-- прогресс между рангами

	local firstProgressLayerName			= string.format( "EVOLUTION_BAR_PROGRESS_EFFECT_%d", self.MIN_RANK )
	local firstProgressLayer				= self.layers[ firstProgressLayerName ]
	local firstUnlockedProgressLayerName	= string.format( "EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_%d", self.MIN_RANK )
	local firstUnlockedProgressLayer		= self.layers[ firstUnlockedProgressLayerName ]	

	for rank = math.max( minRank, self.MIN_RANK ), math.min( maxRank, self.MAX_RANK ) - 1 do

		local animTime			= 0
		local animTimeUnlocked	= 0

		if self:IsBought() then

			local rankCost		= UI:GetEvolvingShipRankEvolutionCost( self.baseDefName, rank )
			local nextRankCost	= UI:GetEvolvingShipRankEvolutionCost( self.baseDefName, rank + 1 )
			
			if evolutionPoints > rankCost then
				animTime = ( nextRankCost ~= rankCost ) and ( evolutionPoints - rankCost ) / ( nextRankCost - rankCost ) or 1
			end
			
			if unlockedEvolutionPoints > rankCost then
				animTimeUnlocked = ( nextRankCost ~= rankCost ) and ( unlockedEvolutionPoints - rankCost ) / ( nextRankCost - rankCost ) or 1
			end

		end

		local layer			= firstProgressLayer + ( rank - self.MIN_RANK )
		local layerUnlocked	= firstUnlockedProgressLayer + ( rank - self.MIN_RANK )

		local progressEffect = UI:GetEffectFromLayer( self, layer )
		if progressEffect then
			progressEffect:SetAnimationTimeAndUpdate( animTime )
		end

		local unlockedProgressEffect = UI:GetEffectFromLayer( self, layerUnlocked )
		if unlockedProgressEffect then
			unlockedProgressEffect:SetAnimationTimeAndUpdate( animTimeUnlocked )
		end

	end


	-- тултип

	local tooltipData = {}
	tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
	tooltipData.caption		= UI:GetStringByName( "shipsTree_evolutionBarTooltip_caption" )

	local strTooltipVal = string.format( "%s/%s", UI:Num2StrSeparatedBy3( evolutionPoints ), UI:Num2StrSeparatedBy3( maxEvolutionPoints ) )

	tooltipData.text = UI:GetStringByName( "shipsTree_evolutionBarTooltip_text" )

	local numSubst = 0
	tooltipData.text, numSubst = string.gsub( tooltipData.text, "%$val%$", strTooltipVal )

	if numSubst == 0 then
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateEvolutionBar()[ERROR]: cannot find placeholder \"$val$\" in string \"shipsTree_evolutionBarTooltip_text\"" )
		tooltipData.text = string.format( "%s|[INVALID STRING] Available points: %s", tooltipData.text, strTooltipVal )
	end

	self.evolutionBarTooltipAreaWnd:SetEvolutionBarTooltipData( tooltipData )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateEvolutionVal()

	if self:IsBought() then

		self:SetLayerVisible( true, self.layers.EVOLUTION_VAL )

		local curEvolutionPoints	= self.chosenActiveNodesMask and self:CalcEvolutionPointsFromMask( self.chosenActiveNodesMask ) or UI:GetEvolvingShipEvolutionPoints( self.shipItem )
		local maxEvolutionPoints	= UI:GetEvolvingShipMaxEvolutionPoints( self.baseDefName, self.shipItem and UI:GetEvolvingShipUnlockedNodesMask( self.shipItem.vid ) )

		local str = string.format( "%s/%s|%s", UI:Num2StrSeparatedBy3( curEvolutionPoints ), UI:Num2StrSeparatedBy3( maxEvolutionPoints ), UI:GetStringByName( "shipsTree_evolutionPoints" ) )
		self:SetText( str, self.layers.EVOLUTION_VAL )

	else
		self:SetLayerVisible( false, self.layers.EVOLUTION_VAL )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ObtainFreeRegularNodeWnd()

	local freeNodeWnd = nil

	for idx, nodeWnd in pairs( self.allRegularNodeWnds ) do
		if not nodeWnd:IsChildOf( self ) then
			freeNodeWnd = nodeWnd
			break
		end
	end

	if not freeNodeWnd then
		freeNodeWnd = self:CreateRegularNodeWnd()
	end

	if freeNodeWnd then
		self:AddChild( freeNodeWnd )
		table.insert( self.curNodeWnds, freeNodeWnd )
	end

	return freeNodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateRegularNodeWnd()

	local nodeWnd = UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_RegularNodeWnd, #self.allRegularNodeWnds + 1 )

	if nodeWnd then
		table.insert( self.allRegularNodeWnds, nodeWnd )
	end

	return nodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ObtainFreeNonActivatableLockedNodeWnd()

	local freeNodeWnd = nil

	for idx, nodeWnd in pairs( self.allNonActivatableLockedNodeWnds ) do
		if not nodeWnd:IsChildOf( self ) then
			freeNodeWnd = nodeWnd
			break
		end
	end

	if not freeNodeWnd then
		freeNodeWnd = self:CreateNonActivatableLockedNodeWnd()
	end

	if freeNodeWnd then
		self:AddChild( freeNodeWnd )
		table.insert( self.curNodeWnds, freeNodeWnd )
	end

	return freeNodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateNonActivatableLockedNodeWnd()

	local nodeWnd = UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_NonActivatableLockedNodeWnd, #self.allNonActivatableLockedNodeWnds + 1 )

	if nodeWnd then
		table.insert( self.allNonActivatableLockedNodeWnds, nodeWnd )
	end

	return nodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ObtainFreeSpecModuleNodeWnd()

	local freeNodeWnd = nil

	for idx, nodeWnd in pairs( self.allSpecModuleNodeWnds ) do
		if not nodeWnd:IsChildOf( self ) then
			freeNodeWnd = nodeWnd
			break
		end
	end

	if not freeNodeWnd then
		freeNodeWnd = self:CreateSpecModuleNodeWnd()
	end

	if freeNodeWnd then
		self:AddChild( freeNodeWnd )
		table.insert( self.curNodeWnds, freeNodeWnd )
	end

	return freeNodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateSpecModuleNodeWnd()

	local nodeWnd = UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_SpecModuleNodeWnd, #self.allSpecModuleNodeWnds + 1 )

	if nodeWnd then
		table.insert( self.allSpecModuleNodeWnds, nodeWnd )
	end

	return nodeWnd

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ResetNodes()

	self.nodes					= {}
	self.chosenActiveNodesMask	= nil
	self.chosenDefName			= ""

	for idx, nodeWnd in pairs( self.curNodeWnds ) do
		nodeWnd:Reset()
		nodeWnd:UnlinkFromParent()
	end

	self.curNodeWnds = {}

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ResetNodeWnd( nodeWnd )

	for idx, wnd in pairs( self.curNodeWnds ) do

		if wnd == nodeWnd then

			wnd:Reset()
			wnd:UnlinkFromParent()

			table.remove( self.curNodeWnds, idx )

			break

		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitNodes()

	self:ResetNodes()

	self.nodes = UI:GetEvolvingShipNodes( self.baseDefName )

	for nodeName, node in pairs( self.nodes ) do

		local nodeWnd = nil

		if not self:IsNodeHidden( node ) then

    		if UI:IsEvolvingShipNodeNonActivatable( node.name ) then
    			nodeWnd = self:ObtainFreeNonActivatableLockedNodeWnd()

    		elseif UI:IsEvolvingShipNodeOfTypeSpecModule( node.name ) then
    			nodeWnd = self:ObtainFreeSpecModuleNodeWnd()

    		else
    			nodeWnd = self:ObtainFreeRegularNodeWnd()
    		end

		end
		
		if nodeWnd then
			self:InitNodeWnd( nodeWnd, node )
		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitNodeWnd( nodeWnd, node )

	nodeWnd:Init( node )

	local circle, angleFromRankNode = UI:GetEvolvingShipNodeCoords( node.name )
	if circle == -1 then
		return
	end

	-- позиция

	local rankNodeWnd				= self:GetRankNodeWndForRank( node.rank )
	local rankNodeCenterPos			= rankNodeWnd:GetCenterPos()
	local xRankNodeFromCenter_abs	= UI:XToAbs( rankNodeWnd:GetLeft() + rankNodeCenterPos.x - self.centerPos.x )
	local yRankNodeFromCenter_abs	= UI:YToAbs( rankNodeWnd:GetTop() + rankNodeCenterPos.y - self.centerPos.y )
	local rankNodeAngle				= math.atan2( -yRankNodeFromCenter_abs, xRankNodeFromCenter_abs )

	local angle				= rankNodeAngle + angleFromRankNode
	local circleRadius_abs	= self.linkCircleRadius_abs[ circle ]

	local xFromCenter_abs	= math.cos( angle ) * circleRadius_abs
	local yFromCenter_abs	= -math.sin( angle ) * circleRadius_abs

	local nodeCenterPos		= nodeWnd:GetCenterPos()

	local x = self.centerPos.x + UI:XToRel( xFromCenter_abs ) - nodeCenterPos.x
	local y = self.centerPos.y + UI:YToRel( yFromCenter_abs ) - nodeCenterPos.y

	nodeWnd:SetPos( x, y )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateNodes()

	local unlockedNodesMask = u64( 0 )
	local activeNodesMask	= u64( 0 )

	if self:IsBought() then
		unlockedNodesMask	= UI:GetEvolvingShipUnlockedNodesMask( self.shipItem.vid )
		activeNodesMask		= self.chosenActiveNodesMask or UI:GetEvolvingShipActiveNodesMask( self.shipItem.vid )
	end

	local curShipRank		= self:GetRankForVisualization()
	local unlockedShipRank	= self:GetUnlockedRank()

	local bCommonEnabled =
		self:IsBought()
		and not self:IsInBattle()

	local evolutionPoints = 0

	if self.chosenActiveNodesMask ~= nil then
		evolutionPoints = self:CalcEvolutionPointsFromMask( self.chosenActiveNodesMask )

	elseif self.shipItem then
		evolutionPoints = UI:GetEvolvingShipEvolutionPoints( self.shipItem )		
	end

	local maxEvolutionPoints = UI:GetEvolvingShipMaxEvolutionPoints( self.baseDefName, self.shipItem and UI:GetEvolvingShipUnlockedNodesMask( self.shipItem.vid ) ) 

	local linkRanksToReinit	= {}

	local nodeWndsByName = {}
	for idx, nodeWnd in pairs( self.curNodeWnds ) do
		nodeWndsByName[ nodeWnd:GetNode().name ] = nodeWnd		
	end


	local function fnDetectNodeStatus( node )

		local status = -1

    	local nodeId = UI:GetEvolvingShipNodeId( node.name )

    	if nodeId == -1 then
			return status
		end

		if UI:BitTstU64( unlockedNodesMask, nodeId ) then

			if UI:IsEvolvingShipNodeNonActivatable( node.name ) then

				if node.parent then
					local parentId = UI:GetEvolvingShipNodeId( node.parent.name )
					status = UI:BitTstU64( activeNodesMask, parentId ) and UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE or UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE
				else
					status = ( node.rank <= curShipRank ) and UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE or UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE
				end
				
			else
				status = UI:BitTstU64( activeNodesMask, nodeId ) and UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE or UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE
			end

		else
			status = UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED
		end

		return status

	end


	for nodeName, node in pairs( self.nodes ) do		

		node.status						= -1
		node.bCanClick					= true
		node.bGray						= false
		node.resourceState				= UI.ShipsTree_EvolvingEdit_NodeWnd.resourceStates.NONE
		node.bRankActive				= node.rank <= curShipRank
		node.bDisabledByEvolutionCap	= false
		node.bDisabledByParent			= false
		node.bHidden					= self:IsNodeHidden( node )


		-- статус - не изучен/активен/неактивен

		node.status = fnDetectNodeStatus( node )


		-- запрет кликать

		node.bCanClick = bCommonEnabled


		-- "серый" оттенок

		node.bGray = not bCommonEnabled


		-- проверка ранга	

		local bRankFit = false

		if node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED then
			bRankFit = node.rank <= unlockedShipRank

		elseif node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE then
			bRankFit = node.rank <= curShipRank

		elseif node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE then
			bRankFit = true
		end


		-- проверка состояния родителя

		local bParentFit = false

		if node.parent then

			local parentStatus = fnDetectNodeStatus( node.parent )

			if node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED then
				bParentFit = parentStatus == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE or parentStatus == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE

			elseif node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE then
				bParentFit = parentStatus == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE

			elseif node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE then
				bParentFit = true
			end

		else
			bParentFit = true
		end
		
		
		-- для неизученных - проверка требуемого аккаунт-ранга
		
		local accountRankFit = true
		
		if node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED then
		
			if UI:GetEvolvingShipNodeRequiredAccountRank( nodeName ) > UI:GetPlayerAccountRank() then
				accountRankFit = false
			end
			
		end
		


		if not bRankFit or not bParentFit or not accountRankFit then

			node.bCanClick = false

    		if not bParentFit or ( not node.parent and not bRankFit ) then
    			node.bDisabledByParent = true
    		end

		end


		-- изученный неактивируемый нод нельзя кликать

		if node.bCanClick then

			if UI:IsEvolvingShipNodeNonActivatable( node.name ) and node.status ~= UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED then
				node.bCanClick = false
			end

		end


		-- для изученных неактивированных - проверка, что активация нода не превысит максимальное значение эволюции

		if node.bCanClick then

			if self:IsBought() and node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE and not UI:IsEvolvingShipNodeNonActivatable( node.name ) then

				local nodeEvolutionPoints = UI:GetEvolvingShipNodeEvolutionPoints( node.name )

				if evolutionPoints + nodeEvolutionPoints > maxEvolutionPoints then
					node.bCanClick = false
					node.bDisabledByEvolutionCap = true
				end			

			end

		end


		-- неизученный нельзя кликать, если он cant_be_bought

		if node.bCanClick then

			if node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED and UI:CantBeBoughtEvolvingShipNode( node.name ) then
				node.bCanClick = false
			end

		end


		-- активированный нод-спецмодуль нельзя деактивировать кликом (можно только, активировав другой нод-спецмодуль)

		if node.bCanClick then

			if UI:IsEvolvingShipNodeOfTypeSpecModule( node.name ) and node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE then
				node.bCanClick = false
			end

		end


		-- хватает ли ресурсов (только для неизученных, для которых соблюдены основные условия изучения)

		if node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED then

			if self:IsBought() and bRankFit and bParentFit and accountRankFit and not UI:CantBeBoughtEvolvingShipNode( node.name ) then
				node.resourceState = ( self:IsEnoughFundsToUnlockNode( node ) and self:IsQuestsFitToUnlockNode( node ) ) and UI.ShipsTree_EvolvingEdit_NodeWnd.resourceStates.ENOUGH or UI.ShipsTree_EvolvingEdit_NodeWnd.resourceStates.NOT_ENOUGH
			end

		end


		if UI:IsEvolvingShipNodeNonActivatable( node.name ) then

			local nodeWnd = nodeWndsByName[ node.name ]
			local bNeedVisible = node.status == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED and not node.bHidden

			local bReinitLinks = false 
			
			if bNeedVisible and not nodeWnd then

				local newNodeWnd = self:ObtainFreeNonActivatableLockedNodeWnd()
				if newNodeWnd then
					self:InitNodeWnd( newNodeWnd, node )
				end

				bReinitLinks = true

			elseif not bNeedVisible and nodeWnd then

				self:ResetNodeWnd( nodeWnd )
				bReinitLinks = true

			end

			if bReinitLinks then
				linkRanksToReinit[ node.rank ] = true
			end

		end

	end

	for idx, nodeWnd in pairs( self.curNodeWnds ) do

		nodeWnd:Update()

		local node = nodeWnd:GetNode()
		if self.shownNodesGroup ~= -1 and self.shownNodesGroup == UI:GetEvolvingShipNodeGroup( node.name ) and not( UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED and UI:CantBeBoughtEvolvingShipNode( node.name ) ) then
			nodeWnd:ShowGroup( true )
		end

	end

	for rank, dummy  in pairs( linkRanksToReinit ) do
		self:InitLinks( rank )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsNodeHidden( node )

	return UI:IsEvolvingShipNodeHidden( node.name, true, self.baseDefName, self.nodes )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetNodeById( nodeId )

	for nodeName, node in pairs( self.nodes ) do
		if UI:GetEvolvingShipNodeId( node.name ) == nodeId then
			return node
		end
	end

	return nil

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateLinkCircleEffect( circle )

	local effect = _G.UI_SpawnEffect( self.effectInfo.linkCircle[ circle ].effectName, self:GetUiHandle() )

	if effect then
		table.insert( self.linkCircleEffectsPool[ circle ], effect )
	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateLinkCircleEffect()[ERROR]: canot create effect %s", self.effectInfo.linkCircle[ circle ].effectName )
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CreateLinkLineEffect()

	local effect = _G.UI_SpawnEffect( self.effectInfo.linkLine.effectName, self:GetUiHandle() )

	if effect then
		table.insert( self.linkLineEffectsPool, effect )
	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ShipsTree_EvolvingEdit_ShipSlotWnd()[ERROR]: canot create effect %s", self.effectInfo.linkLine.effectName )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ObtainFreeLinkCircleEffect( link, circle )

	local idx, effect = next( self.linkCircleEffectsPool[ circle ] )

	if not effect then
		self:CreateLinkCircleEffect( circle )
	end

	idx, effect = next( self.linkCircleEffectsPool[ circle ] )

	if effect then

		self.linkCircleEffectsPool[ circle ][ idx ] = nil

		local name = string.format( "circle%d", circle )

		if not link.effects[ name ] then
			link.effects[ name ] = {}
		end

		table.insert( link.effects[ name ], effect )

		if self.linksEffectLayerPool then
			self.linksEffectLayerPool:PushEffect( effect )
		end

	end

	return effect

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ObtainFreeLinkLineEffect( link )

	local idx, effect = next( self.linkLineEffectsPool )	

	if not effect then
		self:CreateLinkLineEffect()
	end

	idx, effect = next( self.linkLineEffectsPool )	

	if effect then

		self.linkLineEffectsPool[ idx ] = nil

		if not link.effects.line then
			link.effects.line = {}
		end

		table.insert( link.effects.line, effect )

		if self.linksEffectLayerPool then
			self.linksEffectLayerPool:PushEffect( effect )
		end

	end

	return effect

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:ResetLinks( modifiedRank )

	if modifiedRank == nil then
		modifiedRank = -1
	end

	local bHasLinksDeleted = false

	for linkIdx, link in pairs( self.links ) do

		if modifiedRank == -1 or link.rank == modifiedRank then

    		for circle = 1, self.MAX_NODE_CIRCLE do

    			local name = string.format( "circle%d", circle )

        		if link.effects[ name ] then
        			for effectIdx, effect in pairs( link.effects[ name ] ) do
        				table.insert( self.linkCircleEffectsPool[ circle ], effect )
        			end
        		end			

    		end

    		if link.effects.line then
    			for effectIdx, effect in pairs( link.effects.line ) do
    				table.insert( self.linkLineEffectsPool, effect )
    			end
    		end

			self.links[ linkIdx ] = nil
			bHasLinksDeleted = true

		end

	end	


	if bHasLinksDeleted then

    	if self.linksEffectLayerPool then

    		self.linksEffectLayerPool:Clear()

			-- если были удалены линки только одного ранга, то пул пересобирается из оставшихся линков

        	for linkIdx, link in pairs( self.links ) do
				for name, effects in pairs( link.effects ) do
					for effectIdx, effect in pairs( effects ) do
						self.linksEffectLayerPool:PushEffect( effect )
					end
				end
        	end

    	end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitLinks( modifiedRank )

	if modifiedRank == nil then
		modifiedRank = -1
	end

	self:ResetLinks( modifiedRank )


	local rankNodesChildren	= {}
	for idx, node in pairs( self.nodes ) do
		if not node.parent then
			if not rankNodesChildren[ node.rank ] then
				rankNodesChildren[ node.rank ] = {}
			end
			table.insert( rankNodesChildren[ node.rank ], node )
		end
	end

	local nodeWndsByName = {}
	for idx, nodeWnd in pairs( self.curNodeWnds ) do
		nodeWndsByName[ nodeWnd:GetNode().name ] = nodeWnd		
	end

	local rankNodeWndsByRank = {}
	for idx, rankNodeWnd in pairs( self.curRankNodeWnds ) do
		rankNodeWndsByRank[ rankNodeWnd:GetRank() ] = rankNodeWnd
	end

    local centerPos_abs = UI:Vec2CopyStable( UI:PtToAbs( self.centerPos ) )


	local function fnCreateEmptyLink()

    	return
    	{
			srcNode		= nil,
    		rank		= nil,	-- srcNodeWnd недостаточно для определения ранга, т.к. он нужен в ResetLinks(), где окно-нод уже может быть заменено другим (в UpdateNodes() для неактивируемых нодов)
    		effects		= {},
    	}

	end


	local function fnGetCircleRadiusAbs( circle, rankNodeWnd )
		
		local circleRadius_abs = 0

		if circle == 0 then
			local rankNodePos_abs = UI:PtToAbs( UI:Vec2( rankNodeWnd:GetLeft(), rankNodeWnd:GetTop() ) + rankNodeWnd:GetCenterPos() )
			circleRadius_abs = UI:V2Length( centerPos_abs - rankNodePos_abs )
		else
			circleRadius_abs = self.linkCircleRadius_abs[ circle ]
		end

		return circleRadius_abs

	end

	local function fnIsDstNodeVisible( node )

		if nodeWndsByName[ node.name ] then
			return true
		end

		for childIdx, childNode in pairs( node.children ) do
			if fnIsDstNodeVisible( childNode ) then
				return true
			end
		end

		return false

	end


	local function fnInitLinksFromNode( node, rank )

		if node and rank then
			sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitLinks()[ERROR]: both node and rank are not nill" )
			return
		end

		local children = nil
		if node then
			children = node.children
		else
			children = rankNodesChildren[ rank ]
		end		
		if not children or not next( children ) then
			return
		end

		if node and node.bHidden then
			return
		end

		local srcNodeWnd = nil
		if node then
			srcNodeWnd = nodeWndsByName[ node.name ]
		end

		local rankNodeWnd = nil
		if node then
			rankNodeWnd = rankNodeWndsByRank[ node.rank ]
		else
			rankNodeWnd = rankNodeWndsByRank[ rank ]
		end
		if not rankNodeWnd then
			sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitLinks()[ERROR]: cannot find rank node" )
			return
		end

		local link = fnCreateEmptyLink()
		link.srcNode	= node
		link.rank		= node and node.rank or rank

		local rankNodeCenterPos			= rankNodeWnd:GetCenterPos()
		local xRankNodeFromCenter_abs	= UI:XToAbs( rankNodeWnd:GetLeft() + rankNodeCenterPos.x - self.centerPos.x )
		local yRankNodeFromCenter_abs	= UI:YToAbs( rankNodeWnd:GetTop() + rankNodeCenterPos.y - self.centerPos.y )
		local rankNodeAngle				= math.atan2( -yRankNodeFromCenter_abs, xRankNodeFromCenter_abs )

		local srcCircle				= 0
		local srcAngleFromRankNode  = 0
		if node then
			srcCircle, srcAngleFromRankNode = UI:GetEvolvingShipNodeCoords( node.name )
		end

		local lines = {}


		for dstNodeIdx, dstNode in pairs( children ) do

			if fnIsDstNodeVisible( dstNode ) then

				local dstNodeWnd = nodeWndsByName[ dstNode.name ]
    			local dstCircle, dstAngleFromRankNode = UI:GetEvolvingShipNodeCoords( dstNode.name )

    			-- прямая линия (здесь не всё, будет продолжение ниже)

    			if srcCircle ~= dstCircle and srcCircle ~= -1 and dstCircle ~= -1 then

					-- минусовой fixDist должен уменьшить линию со своего конца (чтобы она не налезала на ноды), плюсовой - увеличить (чтобы создать правильный угол с примыкающей окружностью)

					local srcFixDist_abs = 0
					if ( node ~= nil ) then
						if srcNodeWnd then
							srcFixDist_abs = -srcNodeWnd:GetRadiusAbs()
						else
							srcFixDist_abs = self.linkCircleWidth_abs[ srcCircle ] * 0.5
						end
					else
						srcFixDist_abs = -rankNodeWnd:GetRadiusAbs()
					end

    				local dstFixDist_abs = 0
    				if srcAngleFromRankNode == dstAngleFromRankNode then
						if dstNodeWnd then
    						dstFixDist_abs = -dstNodeWnd:GetRadiusAbs()
						else
							dstFixDist_abs = self.linkCircleWidth_abs[ dstCircle ] * 0.5
						end
    				else
    					dstFixDist_abs = self.linkCircleWidth_abs[ dstCircle ] * 0.5
    				end

					local bSrcMin = srcCircle < dstCircle
    				local line =
    				{
    					minCircle			= bSrcMin and srcCircle or dstCircle,
    					minFixDist_abs		= bSrcMin and srcFixDist_abs or dstFixDist_abs,
    					maxCircle			= bSrcMin and dstCircle or srcCircle,
    					maxFixDist_abs		= bSrcMin and dstFixDist_abs or srcFixDist_abs,
    					angleFromRankNode	= srcAngleFromRankNode,
    				}
    				table.insert( lines, line )

    			end


    			-- дуга

    			if srcAngleFromRankNode ~= dstAngleFromRankNode and dstCircle ~= -1 and dstCircle ~= 0 then

    				local circleEffect = self:ObtainFreeLinkCircleEffect( link, dstCircle )
					if circleEffect then

						local circle = dstCircle

						-- минусовой fixAngle должен уменьшить дугу со своего конца (чтобы она не налезала на ноды и линии), плюсовой - увеличить
        				local srcFixAngle = 0
        				if srcCircle == dstCircle then
							if srcNodeWnd then
								srcFixAngle = -self:CalcAngleRadius( srcNodeWnd:GetRadiusAbs(), self.linkCircleRadius_abs[ circle ] )
							else
								srcFixAngle = -self.lineAngleRadius[ circle ]
							end
        				else
        					srcFixAngle = -self.lineAngleRadius[ circle ]
        				end

						local dstFixAngle = 0
						if dstNodeWnd then
							dstFixAngle = -self:CalcAngleRadius( dstNodeWnd:GetRadiusAbs(), self.linkCircleRadius_abs[ circle ] )
						else
							dstFixAngle = -self.lineAngleRadius[ circle ]
						end

						local bSrcMin = srcAngleFromRankNode < dstAngleFromRankNode

        				local minAngle		= bSrcMin and srcAngleFromRankNode or dstAngleFromRankNode
        				local minFixAngle	= bSrcMin and srcFixAngle or dstFixAngle
        				local maxAngle		= bSrcMin and dstAngleFromRankNode or srcAngleFromRankNode
        				local maxFixAngle	= bSrcMin and dstFixAngle or srcFixAngle

        				local minAngleFixed = minAngle - minFixAngle
        				local maxAngleFixed	= maxAngle + maxFixAngle

        				-- размер (время анимации)

        				local animAngle	= maxAngleFixed - minAngleFixed
        				local animTime	= animAngle / ( math.pi * 0.5 )	-- в эффекте нарисовано только 90 градусов
        				circleEffect:SetAnimationTime( animTime )

						-- позиция

						local effectCenterPos = self.linkCircleCenterPos[ circle ]
						circleEffect:SetPos( self.centerPos - effectCenterPos )	-- ставится в центр слота

        				-- поворот

        				local rotAngle	= rankNodeAngle + maxAngleFixed	- math.pi * 0.5 -- в эффекте анимация показывает угол по часовой стрелке (поэтому maxAngleFixed, а не min), начиная с 90 градусов (поэтому -math.pi*0.5)
        				local rotPos	= self.linkCircleCenterPos[ circle ]
        				circleEffect:SetRotation( -rotAngle, rotPos )	-- эта функция поворачивает по часовой стрелке, поэтому минус

					else
						sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitLinks()[ERROR]: cannot find circle effect" )
					end

    			end

			end

		end


		-- прямая линия (продолжение); из нескольких частично совпадающих рисуется одна, самая длинная

		for lineIdx, line in pairs( lines ) do

			for lineIdx2, line2 in pairs( lines ) do

				if line ~= line2 then

    				if not( line.maxCircle <= line2.minCircle or line.minCircle >= line2.maxCircle ) then	-- проверка на непересекаемость

    					local lineLength	= line.maxCircle - line.minCircle
    					local line2Length	= line2.maxCircle - line2.minCircle

    					if lineLength <= line2Length then
    						lines[ lineIdx ] = nil
    						break
    					end					

    				end

				end

			end

		end

		for lineIdx, line in pairs( lines ) do

			local lineEffect = self:ObtainFreeLinkLineEffect( link )
			if lineEffect then

				local minCircleRadiusFixed_abs = fnGetCircleRadiusAbs( line.minCircle, rankNodeWnd ) - line.minFixDist_abs
				local maxCircleRadiusFixed_abs = fnGetCircleRadiusAbs( line.maxCircle, rankNodeWnd ) + line.maxFixDist_abs

				-- размер (шкалирование)

    			local lineLength_abs = maxCircleRadiusFixed_abs - minCircleRadiusFixed_abs
    			local scale = self.linkLineSize_abs.y ~= 0 and lineLength_abs / self.linkLineSize_abs.y or 0
    			lineEffect:SetScale( UI:Vec2( 1, scale ) )

				-- позиция

    			local linePos_abs = UI:Vec2( centerPos_abs.x, centerPos_abs.y + minCircleRadiusFixed_abs )	-- x=0 находится посредине эффекта линии
    			lineEffect:SetPos( UI:PtToRel( linePos_abs ) )	-- ставится на радиус того из двух нодов, который ближе к центру слота

				-- поворот

    			local rotAngle = rankNodeAngle + line.angleFromRankNode + math.pi * 0.5	-- в эффекте нарисована вертикальная линия, т.е. с поворотом в -90 градусов
    			local rotPos = UI:PtToRel( UI:Vec2( 0, -minCircleRadiusFixed_abs / scale ) )	-- точка вращения - вокруг центра слота, но в переводе в систему координат эффекта; на scale деление, т.к. функция SetScale() исказит центр поворота
    			lineEffect:SetRotation( -rotAngle, rotPos )	-- эта функция поворачивает по часовой стрелке, поэтому минус

			else
				sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:InitLinks()[ERROR]: cannot find line effect" )
			end

		end


		if next( link.effects ) then
			table.insert( self.links, link )
		end

	end


	if modifiedRank == -1 then

    	for rank = UI:GetEvolvingShipMinRank( self.baseDefName ), UI:GetEvolvingShipMaxRank( self.baseDefName ) do
    		fnInitLinksFromNode( nil, rank )
    	end

    	for idx, node in pairs( self.nodes ) do
    		fnInitLinksFromNode( node, nil )
    	end

	else

    	fnInitLinksFromNode( nil, modifiedRank )

    	for idx, node in pairs( self.nodes ) do
    		if node.rank == modifiedRank then
    			fnInitLinksFromNode( node, nil )
    		end
    	end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateLinks()

	local linkStates =
	{
		ACTIVE		= 1,
		INACTIVE	= 2,
		LOCKED		= 3,
	}

	local nodeWndsByName = {}
	for idx, nodeWnd in pairs( self.curNodeWnds ) do
		nodeWndsByName[ nodeWnd:GetNode().name ] = nodeWnd		
	end

	local rankNodeWndsByRank = {}
	for idx, rankNodeWnd in pairs( self.curRankNodeWnds ) do
		rankNodeWndsByRank[ rankNodeWnd:GetRank() ] = rankNodeWnd
	end


	local function fnGetVisibleParentNodeWnd( node )

		if node.parent then

			local nodeWnd = nodeWndsByName[ node.parent.name ]
			if nodeWnd then
				return nodeWnd
			else
				return fnGetVisibleParentNodeWnd( node.parent )
			end

		else
			return rankNodeWndsByRank[ node.rank ]
		end

	end


	for linkIdx, link in pairs( self.links ) do

		local srcNodeWnd = nil

		if link.srcNode then

			srcNodeWnd = nodeWndsByName[ link.srcNode.name ]
			if not srcNodeWnd then
				srcNodeWnd = fnGetVisibleParentNodeWnd( link.srcNode )
			end		

		else
			srcNodeWnd = rankNodeWndsByRank[ link.rank ]
		end

		local linkState = -1

		if srcNodeWnd then

			if UI:IsWndKindOf( srcNodeWnd, "ShipsTree_EvolvingEdit_RankNodeWnd" ) then

    			local rankNodeState = srcNodeWnd:GetState()

    			if rankNodeState == UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.ACTIVE then
    				linkState = linkStates.ACTIVE

    			elseif rankNodeState == UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.UNLOCKED or rankNodeState == UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.UNLOCKED_MAX then
    				linkState = linkStates.INACTIVE

    			elseif rankNodeState == UI.ShipsTree_EvolvingEdit_RankNodeWnd.states.LOCKED then

    				linkState = linkStates.LOCKED

    			else
    				sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateLinks()[ERROR]: unhandled rank node state %d", rankNodeState )
    			end                                                             

			elseif UI:IsWndKindOf( srcNodeWnd, "ShipsTree_EvolvingEdit_NodeWnd" ) then

    			local nodeState = srcNodeWnd:GetStatus()

    			if nodeState == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.LOCKED then
    				linkState = linkStates.LOCKED

    			elseif nodeState == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.ACTIVE then
    				linkState = linkStates.ACTIVE	

    			elseif nodeState == UI.ShipsTree_EvolvingEdit_NodeWnd.statuses.INACTIVE then
    				linkState = linkStates.INACTIVE

    			else
    				sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateLinks()[ERROR]: unhandled node state %d", nodeState )
    			end

			else
				sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateLinks()[ERROR]: unhandled node type" )
			end

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateLinks()[ERROR]: cannot find visible source node wnd for link: source node name \"%s\", rank %d", link.srcNode and link.srcNode.name or "", link.srcNode.rank )
		end


		for circle = 1, self.MAX_NODE_CIRCLE do

			local name = string.format( "circle%d", circle )

    		if link.effects[ name ] then

    			for effectIdx, effect in pairs( link.effects[ name ] ) do

					local anim = ""

					if linkState == linkStates.ACTIVE then
						anim = self.effectInfo.linkCircle[ circle ].animActive

					elseif linkState == linkStates.INACTIVE then
						anim = self.effectInfo.linkCircle[ circle ].animInactive

					elseif linkState == linkStates.LOCKED then
						anim = self.effectInfo.linkCircle[ circle ].animLocked
					end


    				local animTime = effect:GetAnimationTime()

    				effect:StartAnimation( anim )
    				effect:SetAnimationTimeAndUpdate( animTime )

    			end

    		end

		end


		if link.effects.line then

			for effectIdx, effect in pairs( link.effects.line ) do

				local anim = ""

				if linkState == linkStates.ACTIVE then
					anim = self.effectInfo.linkLine.animActive

				elseif linkState == linkStates.INACTIVE then
					anim = self.effectInfo.linkLine.animInactive

				elseif linkState == linkStates.LOCKED then
					anim = self.effectInfo.linkLine.animLocked
				end

				effect:StartAnimation( anim )

			end

		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CheckResetActiveNodesChoice()

	if self.chosenActiveNodesMask == nil then
		return
	end

	local bNeedReset = false

	if self:IsActiveNodeChoiceEnabled() then
		if self.chosenActiveNodesMask == UI:GetEvolvingShipActiveNodesMask( self.shipItem.vid ) then
			bNeedReset = true
		end
	else
		bNeedReset = true
	end

	if bNeedReset then
		self.chosenActiveNodesMask = nil
		self:OnChosenActiveNodesChanged()	
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsActiveNodeChoiceEnabled()

	return
		self:IsBought()
		and not self:IsInBattle()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:CalcAngleRadius( objRadius, circleRadius )

	return 2 * math.asin( objRadius / ( 2 * circleRadius ) )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetUnlockedEvolutionPoints()

	if not self.shipItem then
		return 0
	end

	local unlockedNodesMask = UI:GetEvolvingShipUnlockedNodesMask( self.shipItem.vid )
	local unlockedEvolutionPoints = self:CalcEvolutionPointsFromMask( unlockedNodesMask )

	local maxEvolutionPoints = UI:GetEvolvingShipMaxEvolutionPoints( self.baseDefName, self.shipItem and UI:GetEvolvingShipUnlockedNodesMask( self.shipItem.vid ) )
	unlockedEvolutionPoints = math.min( unlockedEvolutionPoints, maxEvolutionPoints )

	return unlockedEvolutionPoints

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetUnlockedDefName()

	if not self.shipItem then
		return ""
	end

	local evolutionPoints = self:GetUnlockedEvolutionPoints()
	return self:CalcDefNameFromEvolutionPoints( evolutionPoints )

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetUnlockedRank()

	local rank = -1

	local defName = self:GetUnlockedDefName()

	if defName ~= "" then
		rank = UI:GetShipRank( defName )
	end

	return rank

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsEnoughFundsToUnlockNode( node )

	local bEnoughFunds = true

	local prices = UI:GetEvolvingShipNodePrice( node.name, self.baseDefName )

	for priceIdx, price in pairs( prices ) do	

		local bEnough = false

		if price.priceType == UI.shipNodePriceTypes.CREDITS then
			bEnough = price.val <= UI:GetPlayerCredits()

		elseif price.priceType == UI.shipNodePriceTypes.TOKENS then
			bEnough = price.val <= UI:GetPlayerTokens()

		elseif price.priceType == UI.shipNodePriceTypes.SYNERGY then
			bEnough = price.val <= ( self.shipItem and UI:GetShipExp( self.shipItem ) or 0 ) + UI:GetPlayerFreeSynergy()

		elseif price.priceType == UI.shipNodePriceTypes.ITEM then

			if UI:IsDefResource( price.defName ) then
				bEnough = price.count <= UI:GetPlayerResourceCount( price.defName )
			else
				sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsEnoughFundsToUnlockNode()[ERROR]: \"%s\" is not a resource", price.defName )
			end

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsEnoughFundsToUnlockNode()[ERROR]: unhandled ship node learn price type: %d", price.priceType )
		end

		if not bEnough then
			bEnoughFunds = false
			break
		end

	end	

	return bEnoughFunds

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:IsQuestsFitToUnlockNode( node )

	local bFit = true

	local quests = UI:GetEvolvingShipNodeRequiredQuests( node.name )

	for idx, questId in pairs( quests ) do
		if not UI:IsQuestCompleted( questId ) then
			bFit = false
			break
		end
	end

	return bFit
	

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:UpdateZOrder()

	if self.shipIcoWnd and self.shipIcoWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( self.shipIcoWnd )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ShipSlotWnd:GetRankNodeWndForRank( rank )

	for idx, nodeWnd in pairs( self.curRankNodeWnds ) do
		if nodeWnd:GetRank() == rank then
			return nodeWnd
		end
	end

	return nil

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_ShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_ShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_AlienEdit_ShipSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_ShipSlotWnd",
	
	props =
	{
		name		= "ShipsTree_AlienEdit_ShipSlotWnd",
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
				defName 			= "shipsTree_alienShipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					-- не линкуется по цвету
					{
						objName		= "rank",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "lock",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bg",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "points",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESSES_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "points",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indic2",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_indic_",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.BATTLE_SLOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "count",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- BATTLE_SLOT_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.BATTLE_SLOT_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_battleSlot",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_overlay",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "progr_5",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_6",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_7",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_8",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_9",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_10",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_11",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_12",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_13",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_14",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress5",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress6",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress7",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress8",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress9",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress10",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress11",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress12",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress13",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress14",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_PROGRESSES_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESSES_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_overlay",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "progr_5",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_5",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_6",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_6",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_7",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_7",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_8",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_8",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_9",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_9",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_10",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_10",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_11",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_11",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_12",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_12",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_13",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_13",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_14",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_14",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_5
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_5,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress5",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_6
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_6,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress6",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_7
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_7,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress7",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_8
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_8,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress8",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_9
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_9,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress9",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_10
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_10,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress10",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_11
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_11,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress11",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_12
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_12,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress12",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_13
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_13,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress13",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_14
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_14,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_evolutionBar_progress14",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.LOCK_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_lock",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_AlienEdit_ShipSlotWnd.effectInfo =
{
	linkCircle =
	{
		[ 1 ] =
		{
    		effectName		= "shipsTree_alienShipSlot_linkCircle1",
		},

		[ 2 ] = 
		{
    		effectName		= "shipsTree_alienShipSlot_linkCircle2",
		},

		[ 3 ] = 
		{
    		effectName		= "shipsTree_alienShipSlot_linkCircle3",
		}
	},

	linkLine =
	{
		effectName		= "shipsTree_alienShipSlot_linkLine",
	},
}

UI.ShipsTree_AlienEdit_ShipSlotWnd.smallRankNodePrototype	= "ShipsTree_AlienEdit_RankNodeWnd_small"
UI.ShipsTree_AlienEdit_ShipSlotWnd.bigRankNodePrototype		= "ShipsTree_AlienEdit_RankNodeWnd_big"

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_ShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_ShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialEdit_ShipSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_ShipSlotWnd",
	
	props =
	{
		name		= "ShipsTree_SpecialEdit_ShipSlotWnd",
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
				defName 			= "shipsTree_specialEdit_shipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					-- не линкуется по цвету
					{
						objName		= "rank",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "lock",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "bg",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "points",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESSES_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "points",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indic2",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_indic_",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.BATTLE_SLOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "count",
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- BATTLE_SLOT_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.BATTLE_SLOT_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialTree_evolvingShipSlot_battleSlot",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESSES_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_overlay",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "progr_5",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_6",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_7",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_8",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_9",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_10",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_11",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_12",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_13",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_14",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_5,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress5",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_6,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress6",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_7,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress7",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_8,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress8",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_9,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress9",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_10,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress10",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_11,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress11",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_12,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress12",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_13,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress13",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_UNLOCKED_PROGRESS_EFFECT_14,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress14",
				defaultAnimation	= "idle_2",
			}}
		},

		-- EVOLUTION_BAR_PROGRESSES_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESSES_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_overlay",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "progr_5",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_5",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_6",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_6",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_7",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_7",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_8",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_8",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_9",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_9",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_10",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_10",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_11",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_11",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_12",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_12",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_13",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_13",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_14",	
						layer		= "UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_14",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_5
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_5,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress5",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_6
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_6,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress6",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_7
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_7,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress7",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_8
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_8,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress8",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_9
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_9,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress9",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_10
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_10,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress10",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_11
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_11,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress11",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_12
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_12,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress12",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_13
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_13,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress13",
				defaultAnimation	= "idle",
			}}
		},

		-- EVOLUTION_BAR_PROGRESS_EFFECT_14
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.EVOLUTION_BAR_PROGRESS_EFFECT_14,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_shipSlot_evolutionBar_progress14",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_ShipSlotWnd.layers.LOCK_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialTree_evolvingShipSlot_lock",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_SpecialEdit_ShipSlotWnd.effectInfo =
{
	linkCircle =
	{
		[ 1 ] =
		{
    		effectName		= "shipsTree_specialEdit_shipSlot_linkCircle1",
		},

		[ 2 ] = 
		{
    		effectName		= "shipsTree_specialEdit_shipSlot_linkCircle2",
		},

		[ 3 ] = 
		{
    		effectName		= "shipsTree_specialEdit_shipSlot_linkCircle3",
		}
	},

	linkLine =
	{
		effectName		= "shipsTree_specialEdit_shipSlot_linkLine",
	},
}

UI.ShipsTree_SpecialEdit_ShipSlotWnd.smallRankNodePrototype		= "ShipsTree_SpecialEdit_RankNodeWnd_small"
UI.ShipsTree_SpecialEdit_ShipSlotWnd.bigRankNodePrototype		= "ShipsTree_SpecialEdit_RankNodeWnd_big"


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_RankNodeWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_RankNodeWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_RankNodeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_RankNodeWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,		
	},

	layers =
	{
    	-- MAIN_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,
    		main		= true,
    	}
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:Init( rank )

	self:Reset()

	self.rank = rank

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:SetState( state )

	self.state = state

	self:UpdateMainAnimation()

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:Reset()

	self.rank		= -1
	self.state		= -1

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animLocked )
	end

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:GetRank()

	return self.rank

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:IsActive()

	return self.state == self.states.ACTIVE

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:GetState()

	return self.state

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:GetCenterPos()

	return UI:Vec2( self:GetWidth() * 0.5, self:GetHeight() * 0.5 )

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:GetRadiusAbs()

	return UI:XToAbs( self:GetWidth() * 0.5 )
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_RankNodeWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.ShipsTree_EvolvingEdit_RankNodeWnd.effectInfo =
{
	main =
	{
    	animActive				= "idle",
    	animLocked				= "off",
		animUnlockedPrefix		= "op_",
		animUnlockedMaxPrefix	= "cl_",
	}
}

UI.ShipsTree_EvolvingEdit_RankNodeWnd.states =
{	
	ACTIVE			= 1,
	UNLOCKED		= 2,
	UNLOCKED_MAX	= 3,
	LOCKED			= 4,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_RankNodeWnd.rank	= -1
UI.ShipsTree_EvolvingEdit_RankNodeWnd.state	= -1

-- ---------------------------------
-- work function
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd:UpdateMainAnimation()

	local anim = ""

	if self.state == self.states.ACTIVE then
		anim = self.effectInfo.main.animActive

	elseif self.state == self.states.UNLOCKED then
		anim = string.format( "%s%d", self.effectInfo.main.animUnlockedPrefix, self.rank )

	elseif self.state == self.states.UNLOCKED_MAX then
		anim = string.format( "%s%d", self.effectInfo.main.animUnlockedMaxPrefix, self.rank )

	elseif self.state == self.states.LOCKED then
		anim = self.effectInfo.main.animLocked

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_RankNodeWnd:UpdateMainAnimation()[ERROR]: unhandled state %d", self.state )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_RankNodeWnd_small
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_RankNodeWnd_small =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipsTree_EvolvingEdit_RankNodeWnd",

    	props =
    	{
    		name		= "ShipsTree_EvolvingEdit_RankNodeWnd_small",
    		isPrototype	= true,		
    	},
    }
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_RankNodeWnd_small
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_RankNodeWnd_small =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipsTree_EvolvingEdit_RankNodeWnd_small",

    	props =
    	{
    		name		= "ShipsTree_AlienEdit_RankNodeWnd_small",
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
    				defName 			= "shipsTree_alienShipSlot_rankNode_small",
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
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_RankNodeWnd_small
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_RankNodeWnd_small =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipsTree_EvolvingEdit_RankNodeWnd_small",

    	props =
    	{
    		name		= "ShipsTree_SpecialEdit_RankNodeWnd_small",
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
    				defName 			= "shipsTree_specialTree_shipSlot_rankNode_small",
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
}

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_RankNodeWnd_big
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_RankNodeWnd_big = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

local l_numBaseRankNodeLevels = UI:GetTableLength( UI.ShipsTree_EvolvingEdit_RankNodeWnd.layers )

UI.ShipsTree_EvolvingEdit_RankNodeWnd_big.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_RankNodeWnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_RankNodeWnd_big",
		isPrototype	= true,		
	},

	layers =
	{
		numLayers = l_numBaseRankNodeLevels + 1,

    	-- MAIN_EFFECT
    	{
    		layerType	= UI.LAYER_EFFECT,
    		layerStyle	= UI.WLS_RESIZABLE,
    		main		= true,
    	},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd_big:Reset()

	UI.ShipsTree_EvolvingEdit_RankNodeWnd.Reset( self )

	self:SetText( "", self.layers.RANK )

end


--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd_big:SetState( state )

	UI.ShipsTree_EvolvingEdit_RankNodeWnd.SetState( self, state )

	self:UpdateRankText()

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_RankNodeWnd_big.layers =
{
	MAIN_EFFECT	= 0,
	RANK		= 1,
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_RankNodeWnd_big:UpdateRankText()

	local strRank = ""

	if self.state ~= self.states.ACTIVE then
		strRank = tostring( self.rank )
	end

	self:SetText( strRank, self.layers.RANK )

end


-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_RankNodeWnd_big
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_RankNodeWnd_big =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipsTree_EvolvingEdit_RankNodeWnd_big",

    	props =
    	{
    		name		= "ShipsTree_AlienEdit_RankNodeWnd_big",
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
    				defName 			= "shipsTree_alienShipSlot_rankNode_big",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "vol",
    						layer		= "UI.ShipsTree_EvolvingEdit_RankNodeWnd_big.layers.RANK",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
        	},
    	}
    }
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_RankNodeWnd_big
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_RankNodeWnd_big =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipsTree_EvolvingEdit_RankNodeWnd_big",

    	props =
    	{
    		name		= "ShipsTree_SpecialEdit_RankNodeWnd_big",
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
    				defName 			= "shipsTree_specialEdit_shipSlot_rankNode_big",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "vol",
    						layer		= "UI.ShipsTree_EvolvingEdit_RankNodeWnd_big.layers.RANK",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
    					},
    				}
    			}}
        	},
    	}
    }
}


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_NodeWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_NodeWnd = {}

-- ---------------------------------
-- window defitition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_NodeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_NodeWnd",
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
		},

		-- RESOURCE_STATE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName	= "shipsTree_alienShipSlot_node_unlockState",
			}}
		},

		-- GROUP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shipsTree_alienShipSlot_regularNode_group",
				defaultAnimation	= "idle",
			}}
		},
		
		-- NOTICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "shipsTree_alienShipSlot_regularNode_notice",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		}
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_NodeWnd:Init( node )

	self:Reset()

	self.node = node

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:Update()

	self:FullUpdate()

end



--
function UI.ShipsTree_EvolvingEdit_NodeWnd:Reset()

	self.node			= nil
	self.bShowGroup		= false
	self.bShowNotice	= false

	self:ResetContent()

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:GetNode()

	return self.node

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:GetStatus()

	return self.node and self.node.status or -1

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:CanClick()

	if self.node then
		return self.node.bCanClick
	else
		return true
	end

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:GetCenterPos()

	return UI:Vec2( self:GetWidth() * 0.5, self:GetHeight() * 0.5 )

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:GetRadiusAbs()

	return UI:XToAbs( self:GetWidth() * 0.5 )
end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:ShowGroup( bShowGroup )

	self.bShowGroup = bShowGroup
	self:UpdateGroupEffect()

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:ShowNotice( bShowNotice )

	self.bShowNotice = bShowNotice
	self:UpdateNoticeEffect( true )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_NodeWnd.layers =
{
	MAIN_EFFECT				= 0,
	RESOURCE_STATE_EFFECT	= 1,
	GROUP_EFFECT			= 2,
	NOTICE_EFFECT			= 3,
	MOUSE_OVER_EFFECT		= 4,
}

UI.ShipsTree_EvolvingEdit_NodeWnd.effectInfo =
{
	main =
	{
		spriteName		= "ico",
		animIdle		= "idle",
		animDisabled	= "disable",
	},

	resourceState =
	{
		animGreen	= "green",
		animRed		= "red",
	}
}

UI.ShipsTree_EvolvingEdit_NodeWnd.statuses =
{
	LOCKED		= 1,
	ACTIVE		= 2,
	INACTIVE	= 3,	
}

UI.ShipsTree_EvolvingEdit_NodeWnd.resourceStates =
{
	NONE		= -1,
	ENOUGH		= 1,
	NOT_ENOUGH	= 2,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_NodeWnd.node			= nil
UI.ShipsTree_EvolvingEdit_NodeWnd.tooltipData	= nil
UI.ShipsTree_EvolvingEdit_NodeWnd.bShowGroup	= false
UI.ShipsTree_EvolvingEdit_NodeWnd.bShowNotice	= false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_NodeWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateMainAnimation()
	self:UpdateResourceStateEffect()
	self:UpdateMouseOver()
	self:UpdateTooltip()
	self:UpdateGroupEffect()
	self:UpdateNoticeEffect( false )

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:ResetContent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, UI.INVALID_RESOURCE_HANDLE )
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	self:SetLayerVisible( false, self.layers.RESOURCE_STATE_EFFECT )
	self:SetLayerVisible( false, self.layers.GROUP_EFFECT )
	self:SetLayerVisible( false, self.layers.NOTICE_EFFECT )

	self:SetMouseOver( false )

	self.tooltipData = nil

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateIco()

	local texName = ""

	if self.node.status == self.statuses.LOCKED and UI:CantBeBoughtEvolvingShipNode( self.node.name ) then

		-- SC-120217
			texName = "node_cant_be_bought" -- для зеленых кораблей
			--texName = "r_4_node_cant_be_bought" -- для обычных кораблей

	else

    	texName = self.node.nodeInfo.ico

    	if type( texName ) ~= "string" then
    		sys.log( "UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateIco()[ERROR]: invalid type of _G.VesselProgress[\"%s\"].ico; \"string\" expected, got \"%s\"", self.node.name, type( texName ) )
    		texName = ""
    	end

    	if texName ~= "" then

    		local postfix = ""

    		if self.node.status == self.statuses.LOCKED then
    			postfix = "locked"

    		elseif self.node.status == self.statuses.ACTIVE then
    			postfix = "active"

    		elseif self.node.status == self.statuses.INACTIVE then
    			postfix = ( self.node.bDisabledByEvolutionCap or self.node.bDisabledByParent ) and "inactive_parentInactive" or "inactive_parentActive"

    		else
    			sys.log( "UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateIco()[ERROR]: unhandled status %d", self.node.status )			
    		end

    		if postfix ~= "" then
    			texName = string.format( "%s_%s", texName, postfix )
    		else
    			texName = ""
    		end		

    	end

	end

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if texName ~= "" then
		hTex = UI:GetTex( texName )
	else
		hTex = UI:GetTex( "NoData" )
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, hTex )
	end	

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateMainAnimation()

	local anim = self.node.bGray and self.effectInfo.main.animDisabled or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateResourceStateEffect()

	if self.node.resourceState == self.resourceStates.NONE then

		self:SetLayerVisible( false, self.layers.RESOURCE_STATE_EFFECT )

	else

		self:SetLayerVisible( true, self.layers.RESOURCE_STATE_EFFECT )

		local anim = ( self.node.resourceState == self.resourceStates.ENOUGH ) and self.effectInfo.resourceState.animGreen or self.effectInfo.resourceState.animRed

		local unlockStateEffect = UI:GetEffectFromLayer( self, self.layers.RESOURCE_STATE_EFFECT )
		if unlockStateEffect then
			unlockStateEffect:StartAnimation( anim )
		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateTooltip()

	local shipSlotWnd = self:GetParent()
	if not shipSlotWnd then
		return
	end

	self.tooltipData = {}

	if self.node.status == self.statuses.LOCKED and UI:CantBeBoughtEvolvingShipNode( self.node.name ) then

		self.tooltipData.tooltipType		= UI.tooltipTypes.TEXT_LARGE
		self.tooltipData.caption			= UI:GetStringByName( "node_tooltip_cantBeBought_caption" )
		self.tooltipData.text				= UI:GetStringByName( "node_tooltip_cantBeBought_text" )

	else

    	self.tooltipData.tooltipType		= UI.tooltipTypes.SHIP_NODE
    	self.tooltipData.nodeName			= self.node.name
    	self.tooltipData.shipDefName		= shipSlotWnd:GetBaseDefName()
    	self.tooltipData.vid				= shipSlotWnd:GetVid()	
    	self.tooltipData.chosenNodesMask	= shipSlotWnd:GetChosenActiveNodesMask()

	end

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateGroupEffect()

	self:SetLayerVisible( self.bShowGroup, self.layers.GROUP_EFFECT )

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateNoticeEffect( bStart )

	self:SetLayerVisible( self.bShowNotice, self.layers.NOTICE_EFFECT )
	
	if self.bShowNotice then
	
		local noticeEffect = UI:GetEffectFromLayer( self, self.layers.NOTICE_EFFECT )
		if noticeEffect then
		
			if not noticeEffect:IsAnimationPlaying() then
				bStart = true
			end
			
			if bStart then
				noticeEffect:RestartAnimation()
			end
		
		end
		
	end

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:UpdateMouseOver()

	local bMouseOver = false

	if self.node ~= nil and self.node.bCanClick then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipsTreeWnd.sounds.alienShipNodeMouseOver )
	end

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()

	local parent = self:GetParent()
	if parent and parent.OnNodeMouseIn then
		parent:OnNodeMouseIn( self, mouseX, mouseY, wndThatReceivedInput )
	end

	return true

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )

	local parent = self:GetParent()
	if parent and parent.OnNodeMouseOut then
		parent:OnNodeMouseOut( self, mouseX, mouseY, wndThatReceivedInput )
	end

	return true	

end


--
function UI.ShipsTree_EvolvingEdit_NodeWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.NOTICE_EFFECT ) then
		self:ShowNotice( false )
	end
		
end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_RegularNodeWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_RegularNodeWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipsTree_EvolvingEdit_NodeWnd",

    	props =
    	{
    		name		= "ShipsTree_EvolvingEdit_RegularNodeWnd",
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
    				defName 			= "shipsTree_alienShipSlot_regularNode",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "plus",
    						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.RESOURCE_STATE_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "group_hode_mark",
    						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.GROUP_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "over",
    						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.MOUSE_OVER_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
						
						{
    						objName		= "active_mark",
    						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.NOTICE_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
    				}
    			}}
    		},

    		-- MOUSE_OVER_EFFECT
    		{
    			id			= UI.ShipsTree_EvolvingEdit_NodeWnd.layers.MOUSE_OVER_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "shipsTree_alienShipSlot_regularNode_mouseOver",
    				defaultAnimation	= "idle",
    			}}
    		}
    	}
    }
}


-- меньше обычных нод; используется для неактивируемых (can_be_activated = false) нод, когда они не изучены
-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_NonActivatableLockedNodeWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_NonActivatableLockedNodeWnd = {}

-- ---------------------------------
-- window defitition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_NonActivatableLockedNodeWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_NodeWnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_NonActivatableLockedNodeWnd",
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
				defName 			= "shipsTree_alienShipSlot_nonActivatableLockedNode",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "plus",
						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.RESOURCE_STATE_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "slot_mark",
						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.NOTICE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_NodeWnd.layers.MOUSE_OVER_EFFECT,

			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_nonActivatableLockedNode_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_NonActivatableLockedNodeWnd:ShowGroup( bShowGroup )

	if bShowGroup then
		sys.log( "UI.ShipsTree_EvolvingEdit_NonActivatableLockedNodeWnd:ShowGroup(): not supported" )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_SpecModuleNodeWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_SpecModuleNodeWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "ShipsTree_EvolvingEdit_NodeWnd",

    	props =
    	{
    		name		= "ShipsTree_EvolvingEdit_SpecModuleNodeWnd",
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
    				defName 			= "shipsTree_alienShipSlot_specModuleNode",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "plus",
    						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.RESOURCE_STATE_EFFECT",
    						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
    					},

    					{
    						objName		= "group_hode_mark",
    						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.GROUP_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "over",
    						layer		= "UI.ShipsTree_EvolvingEdit_NodeWnd.layers.MOUSE_OVER_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},
    				}
    			}}
    		},

    		-- MOUSE_OVER_EFFECT
    		{
    			id			= UI.ShipsTree_EvolvingEdit_NodeWnd.layers.MOUSE_OVER_EFFECT,

    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,

    			effects =
    			{{
    				defName 			= "shipsTree_alienShipSlot_regularNode_mouseOver",
    				defaultAnimation	= "idle",
    			}}
    		}
    	}
    }
}

-- ------------------------------------------------------------
-- UI.ShipsTree_Evolving_ShipIcoWnd
-- ------------------------------------------------------------

UI.ShipsTree_Evolving_ShipIcoWnd = {}
                            	
-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Evolving_ShipIcoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Evolving_ShipIcoWnd",
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
				defName 			= "shipsTree_alienShipSlot_shipIco",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "over",	
						layer		= "UI.ShipsTree_Evolving_ShipIcoWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_shipIco_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.ShipsTree_Evolving_ShipIcoWnd:SetTex( hTex )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, hTex )
	end

end


--
function UI.ShipsTree_Evolving_ShipIcoWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.ShipsTree_Evolving_ShipIcoWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.ShipsTree_Evolving_ShipIcoWnd:EnableMouseOver( bEnable )

	self.bMouseOverEnabled = bEnable
	self:UpdateMouseOver()

end


--
function UI.ShipsTree_Evolving_ShipIcoWnd:Reset()

	self.tooltipData		= nil
	self.bMouseOverEnabled	= false

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetSpriteTexture( self.effectInfo.main.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end	

	self:SetMouseOver( false )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Evolving_ShipIcoWnd.layers =
{
	MAIN_EFFECT			= 0,
	MOUSE_OVER_EFFECT	= 1,
}

UI.ShipsTree_Evolving_ShipIcoWnd.effectInfo =
{
	main =
	{
		spriteName = "ship_ico",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Evolving_ShipIcoWnd.tooltipData		= nil
UI.ShipsTree_Evolving_ShipIcoWnd.bMouseOverEnabled	= false

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Evolving_ShipIcoWnd:UpdateMouseOver()

	local bMouseOver = false

	if self.bMouseOverEnabled then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse and ( wndUnderMouse == self or wndUnderMouse:IsChildOf( self ) )
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.ShipsTree_Evolving_ShipIcoWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.ShipsTreeWnd.sounds.shipSlotMouseOver )
	end

end


--
function UI.ShipsTree_Evolving_ShipIcoWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.ShipsTree_Evolving_ShipIcoWnd:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end



--
function UI.ShipsTree_Evolving_ShipIcoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd",
		style		= UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
    	-- DEBUG
    	{
    		layerType	= UI.LAYER_TEXTURE,
    		layerStyle	= UI.WLS_RESIZABLE,
    		texture		= "white",
    		color		= 0x66ff0000,
			visible		= false,
    	},

    	-- DEBUG_MIN_CIRCLE
    	{
    		layerType	= UI.LAYER_TEXTURE,
    		layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
    		texture		= "white",
			visible		= false,
    	},

    	-- DEBUG_MAX_CIRCLE
    	{
    		layerType	= UI.LAYER_TEXTURE,
    		layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
    		texture		= "white",
			visible		= false,
    	},
	}
}

UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.layers =
{
    DEBUG				= 0,
    DEBUG_MIN_CIRCLE	= 1,
    DEBUG_MAX_CIRCLE	= 2,
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

-- centerPos - в системе 1024/768, позиция относительно родителя
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:SetupLayout( centerPos, minRadius_abs, maxRadius_abs, gapMinAngle, gapMaxAngle )

    self.minRadius_abs	= minRadius_abs
    self.maxRadius_abs	= maxRadius_abs
    self.gapMinAngle	= gapMinAngle
    self.gapMaxAngle	= gapMaxAngle

	local halfWidth		= UI:XToRel( maxRadius_abs )
	local halfHeight	= UI:YToRel( maxRadius_abs )

	local rect = UI:Quat( centerPos.x - halfWidth, centerPos.y - halfHeight, halfWidth * 2, halfHeight * 2 )
	self:SetRect( rect )

	self.centerPos = Vec2( halfWidth, halfHeight )

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:SetEvolutionBarTooltipData( tooltipData )

	self.evolutionBarTooltipData = tooltipData

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:SetShipIcoTooltipData( tooltipData )

	self.shipIcoTooltipData = tooltipData

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:Reset()

	self.evolutionBarTooltipData	= nil
	self.shipIcoTooltipData			= nil

    self.centerPos					= Vec2( 0, 0 )
    self.minRadius_abs				= 0
    self.maxRadius_abs				= 0
    self.gapMinAngle				= 0
    self.gapMaxAngle				= 0

	self.lastAreaType				= self.areaTypes.NONE

	self:SetWidth( 0 )
	self:SetHeight( 0 )

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:GetTooltipData()

	local areaType = self:GetAreaType()

	if areaType == self.areaTypes.EVOLUTION_BAR then
		return self.evolutionBarTooltipData

	elseif areaType == self.areaTypes.SHIP_ICO then
		return self.shipIcoTooltipData

	else
		return nil
	end

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:HandleTooltip( targetWnd, tooltipData )

	self.lastAreaType = self:GetAreaType()
	return false

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.areaTypes =
{
	EVOLUTION_BAR	= 1,
	SHIP_ICO		= 2,
	NONE			= -1,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.evolutionBarTooltipData	= nil
UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.shipIcoTooltipData			= nil

UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.centerPos					= Vec2( 0, 0 )
UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.minRadius_abs				= 0
UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.maxRadius_abs				= 0
UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.gapMinAngle				= 0
UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.gapMaxAngle				= 0

UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.lastAreaType				= UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd.areaTypes.NONE

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:GetAreaType()

	local mousePos = UI:Vec2( UI:GetMouseX(), UI:GetMouseY() )

	local rect = self:GetRect()
	local parent = self:GetParent()
	if parent then
		rect = parent:ToScreen( rect )
	end

	if not UI:IsPtInRect( rect, mousePos.x, mousePos.y ) then
		return self.areaTypes.NONE
	end

	local centerPos_abs = UI:PtToAbs( UI:Vec2( self:XToScreen( self.centerPos.x ), self:YToScreen( self.centerPos.y ) ) )	
	local mousePos_abs = UI:PtToAbs( mousePos )

	local dir = mousePos_abs - centerPos_abs
	local dist_abs = UI:V2Length( dir )

	if dist_abs < self.minRadius_abs then
		return self.areaTypes.SHIP_ICO
	end

	if dist_abs > self.maxRadius_abs then
		return self.areaTypes.NONE
	end

	local angle = UI:AngleNormalizePI( math.atan2( -dir.y, dir.x ) )

	if angle > self.gapMinAngle and angle < self.gapMaxAngle then
		return self.areaTypes.NONE
	end	
	 
	return self.areaTypes.EVOLUTION_BAR

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return
	end

	-- Если во время показа тултипа мышь не выходит за пределы окна, то GetTooltipData() не будет вызвана,
	-- и, соответственно, тултип не скроется/поменяется, если мышь покинула/поменяла зону.
	-- Поэтому проверка зоны и скрытие тултипа производится здесь.

	self:ValidateTooltipWnd()

	return true

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:ValidateTooltipWnd()

	if UI:GetCurTooltipTargetHandle() == self:GetUiHandle() and UI:GetCurTooltipHandle() ~= UI.INVALID_UI_HANDLE then
		if self:GetAreaType() ~= self.lastAreaType then
			UI:ResetTooltip()	-- новый тултип, если нужен, покажется автоматически ui-менеджером
		end
	end

end


--
function UI.ShipsTree_EvolvingEdit_EvolutionBarTooltipAreaWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.DEBUG_MIN_CIRCLE then

		local x = self:XToScreen( self.centerPos.x )
		local y = self:YToScreen( self.centerPos.y )

		UI.drawer:DrawCircle( x, y, UI:XToRel( self.minRadius_abs ), 1, 0xffffff00, 1 )

	elseif layerIdx == self.layers.DEBUG_MAX_CIRCLE then

		local x = self:XToScreen( self.centerPos.x )
		local y = self:YToScreen( self.centerPos.y )

		UI.drawer:DrawCircle( x, y, UI:XToRel( self.maxRadius_abs ), 1, 0xff0000ff, 1 )

	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_ItemsWnd
-- Это окно представляет собой на 90% копипаст с UI.EquipmentWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_ItemsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ItemsWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "ShipsTree_EvolvingEdit_ItemsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		rectAbs		= Quat( 0, 0, 1024, 768 ),
		isPrototype	= true,
	},

	layers =
	{
		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title_weapon",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.WEAPON_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title_active_modul",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.ACTIVE_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "title_passive_modul",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.PASSIVE_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "passive_modules",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.ENGINE_MOD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_2",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.CAPACITOR_MOD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_3",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.SHIELD_MOD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_4",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.ARMOR_MOD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "passive_modules_5",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.CPU_MOD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- WEAPON_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_weapon" ),
		},

		-- ACTIVE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_activeModules" ),
		},

		-- PASSIVE_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_passiveModules" ),
		},

        -- ENGINE_MOD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.ENGINE_MOD_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- ENGINE_MOD_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_ENGINE_MOD_tipCaption" ),
		},

        -- CAPACITOR_MOD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.CAPACITOR_MOD_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- CAPACITOR_MOD_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_CAPACITOR_MOD_tipCaption" ),
		},

        -- SHIELD_MOD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.SHIELD_MOD_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- SHIELD_MOD_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_SHIELD_MOD_tipCaption" ),
		},

        -- ARMOR_MOD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.ARMOR_MOD_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- ARMOR_MOD_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_ARMOR_MOD_tipCaption" ),
		},

        -- CPU_MOD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_itemsSlots_slotsBlock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_ItemsWnd.layers.CPU_MOD_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- CPU_MOD_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipSlot_CPU_MOD_tipCaption" ),
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:HasWaitingRequests()

	return UI:IsWaitingRequests()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnSelShipChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateSelShip()	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.ModuleEquipResult.MER_OK then
		UI:ShowMessageOnEquipError( result )
	end

end  


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param  )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.ModuleEquipResult.MER_OK then
		self.equipTransferInfo = nil
		UI:ShowMessageOnEquipError( result )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.MunitionResult.MR_OK then
		UI:ShowMessageOnChangeMunitionError( result ) 
	end

end  


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.MunitionResult.MR_OK then
		UI:ShowMessageOnChangeMunitionError( result ) 
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.upgradeItemWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	if result == 1 then
		self:ShowMessageOnTimeOut()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 1 then
		self:ShowMessageOnTimeOut()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId == 0 or requestId ~= self.buyRequestId then
		return
	end

	self.buyRequestId = 0

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		-- сначала этот коллбэк должен обработаться в UI:UpdateServerData_OnBuyItem;
		-- оттуда должен был уже прийти и быть обработан евент EV_INV_ITEMS_CHANGED

		if not self:IsWaiting() then

        	if u64Param ~= nil and u64Param ~= UI.INVALID_U64_ID then
				self.buyInfo.boughtIid = u64Param
        		self:EquipBoughtModule( self.buyInfo )
			else

				local shopItem = UI:GetShopItemById( param1 ) 				
				if shopItem then
					sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnBuyItem()[ERROR]: invalid iid" )	
				end
        	end

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnBuyItem()[ERROR]: still waiting some requests" )
		end

	else

		self:ShowBuyErrorMsg( result )

	end

	self:ResetBuyInfo()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 1 then
		self:ShowMessageOnTimeOut()
	elseif result == 2 then
		UI:ShowMsgOnSellError()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	self.salvageWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 1 then
		self:ShowMessageOnTimeOut()
	elseif result == 2 then
		UI:ShowMsgOnSellError()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

	self.salvageWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnUpgradeItems( result, requestId, iids2 )

	self.upgradeItemWnd:GameStore_OnUpgradeItems( result, requestId, iids )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetSelShipItem()

	return self.selShipItem

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetSelShipSlot()

	return self.selShipSlot

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetSelShipSlotInfo()

	local selInfo = nil

	if self.selShipSlot then

		selInfo =
		{
			slotType			= self.selShipSlot:GetShipSlotType(),
			slotId				= self.selShipSlot:GetSlotId(),			
			itemsLayout			= nil,
			itemsUpLevelLayout	= nil,
		}

		if self.itemsListWnd:IsOnScreen() then

			selInfo.itemsLayout = { subType = -1, rank = -1, scrollPos = -1 }

			selInfo.itemsLayout.subType, selInfo.itemsLayout.rank = self:GetOpenItemsSubType()
			selInfo.itemsLayout.scrollPos = self.itemsListWnd:GetScrollPos()

			if selInfo.itemsLayout.subType ~= -1 then
				selInfo.itemsUpLevelLayout = self.savedItemsUpLevelLayout
			end

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:GetSelShipSlotInfo()[ERROR]: intems list is not on screen" )
		end

	end

	return selInfo

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo( selInfo )

	if not self:IsOnScreen() then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: not on screen" )
		return
	end
	
	if selInfo == nil then
		self:SelectShipSlot( nil )
		return
	end

	if type( selInfo ) ~= "table" then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of 1-st parameter (\"selInfo\"); \"table\" or \"nil\" expected, got \"%s\"", type( selInfo ) )
		return
	end

	if type( selInfo.slotType ) ~= "number" then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.slotType; \"number\" expected, got \"%s\"", type( selInfo.slotType ) )
		return
	end

	if type( selInfo.slotId ) ~= "number" then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.slotId; \"number\" expected, got \"%s\"", type( selInfo.slotId ) )
		return
	end

	local bAmmo = self:IsShipSlotTypeAmmo( selInfo.slotType )

	local slotWnd = bAmmo and self:GetShipSlotForAmmoId( selInfo.slotId ) or self:GetShipSlotForModuleId( selInfo.slotId ) 

	if not slotWnd then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: cannot find slot for type %d id %d", selInfo.slotId, selInfo.slotId )
		return
	end

	self:SelectShipSlot( slotWnd )


	local function fnSetItemsLayout()

		if selInfo.itemsLayout == nil then
			return
		end

    	if type( selInfo.itemsLayout ) ~= "table" then
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsLayout; \"table\" or \"nil\" expected, got \"%s\"", type( selInfo.itemsLayout ) )
			return
    	end

    	if type( selInfo.itemsLayout.subType ) ~= "number" and type( selInfo.itemsLayout.subType ) ~= "string" then
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsLayout.subType; \"number\" or \"string\" expected, got \"%s\"", type( selInfo.itemsLayout.subType ) )
			return
    	end

    	if type( selInfo.itemsLayout.rank ) ~= "number" then
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsLayout.rank; \"number\" expected, got \"%s\"", type( selInfo.itemsLayout.rank ) )
			return
    	end

		if selInfo.itemsLayout.subType ~= -1 then

			self:OpenItemsSubType( selInfo.itemsLayout.subType, selInfo.itemsLayout.rank, false )

			local openSubType, openRank = self:GetOpenItemsSubType()
			if openSubType ~= selInfo.itemsLayout.subType or openRank ~= selInfo.itemsLayout.rank then
				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: cannot open subtype %d and rank %d", selInfo.itemsLayout.subType, selInfo.itemsLayout.rank )
				return
			end

			if selInfo.itemsUpLevelLayout ~= nil then

				local bValidUpLevelLayout = true

    			if type( selInfo.itemsUpLevelLayout ) == "table" then

                	if type( selInfo.itemsUpLevelLayout.subType ) ~= "number" and type( selInfo.itemsLayout.subType ) ~= "string" then
                		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsUpLevelLayout.subType; \"number\" or \"string\" expected, got \"%s\"", type( selInfo.itemsUpLevelLayout.subType ) )
						bValidUpLevelLayout = false
                	end

                	if type( selInfo.itemsUpLevelLayout.rank ) ~= "number" then
                		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsUpLevelLayout.rank; \"number\" expected, got \"%s\"", type( selInfo.itemsUpLevelLayout.rank ) )
						bValidUpLevelLayout = false
                	end

                	if type( selInfo.itemsUpLevelLayout.scrollPos ) ~= "number" then
                		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsUpLevelLayout.scrollPos; \"number\" expected, got \"%s\"", type( selInfo.itemsUpLevelLayout.scrollPos ) )
						bValidUpLevelLayout = false
                	end

				else
    				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsUpLevelLayout; \"table\" or \"nil\" expected, got \"%s\"", type( selInfo.itemsUpLevelLayout ) )
					bValidUpLevelLayout = false
				end

				if bValidUpLevelLayout then
					self.savedItemsUpLevelLayout = selInfo.itemsUpLevelLayout
				end
				
			end
		
		end

    	if type( selInfo.itemsLayout.scrollPos ) == "number" then

			if selInfo.itemsLayout.scrollPos ~= -1 then
				self.itemsListWnd:SetScrollPos( selInfo.itemsLayout.scrollPos )
			end
	
		else
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlotByInfo()[ERROR]: invalid type of selInfo.itemsLayout.scrollPos; \"number\" expected, got \"%s\"", type( selInfo.itemsLayout.scrollPos ) )
		end

	end

	fnSetItemsLayout()

end


-- коллбэк, вызывается из окна покупки
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnTradeResult_Buy( shopItem, count, priceType )

	if UI:IsDefAmmo( shopItem.defName ) then

		UI:PlayGlobalSound( self.sounds.equip )

		self:EquipAmmoInternal( self.buyInfo.shopItem.defName, self.buyInfo.shipItem.vid, self.buyInfo.slotId )

    	if self:GetOpenItemsSubType() ~= -1 then
    		self:OpenItemsSubType( -1, -1, true )
    	end

	else

		UI:PlayGlobalSound( self.sounds.equip )

		if not UI:IsDefBundle( self.buyInfo.shopItem.defName ) and not UI:IsDefAmmo( self.buyInfo.shopItem.defName ) then
    		self.buyRequestId = _G.GameStore_Buy( self.buyInfo.shopItem.id, count, priceType, 2 )	-- #0072739, (0309199) - 2 нужна для сбора статистики
		else
    		self.buyRequestId = _G.GameStore_Buy( self.buyInfo.shopItem.id, count, priceType )
		end

    	if self.buyRequestId ~= 0 then
    		UI:AddWaitingRequest( self.buyRequestId )
    	end

	end

end


-- коллбэк, вызывается из окна покупки
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnTradeResult_Sell( invItem, count )

	if invItem.itemType == UI.invItemTypes.MODULE then

		local iids = {}
		for i = 1, count do
			table.insert( iids, invItem.iids[ i ] )
		end

		UI:AddWaitingRequest( _G.GameStore_SellItems( iids ) )

		if invItem.equipShipItem then

			UI:AddWaitingRequest( UI.VESSEL_EQUIPMENT_REQUEST_ID )

			if UI:GetModuleType( invItem.defName ) == ai.ModuleType.WEAPON then
				self:CheckShowMsgOnUnequipPrimaryAmmo( invItem.equipShipItem, ai.WeaponClass.UNKNOWN )
			end

		end

	elseif invItem.itemType == UI.invItemTypes.AMMO then

		if invItem.equipShipItem then
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnTradeResult_Sell()[ERROR]: trying to sell equipped ammo" )
		else
			UI:AddWaitingRequest( _G.GameStore_SellItem( invItem.iids[ 1 ], count ) )
		end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnTradeResult_Sell()[ERROR]: unhandled type of item: %s", tostring( invItem.itemType ) )
	end

end


-- коллбэк, вызывается из окна покупки
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnTradeResult_Cancel()

	self:ResetBuyInfo()

end


-- коллбэк, вызывается из окна увеличения инвентаря
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnBuyWndResult( result, mode, data )

	if mode == UI.BuyWnd.modes.INVENTORY_AUTO then

    	if result == true then
    		self:BuyInventory()
    	else
    		self:ResetBuyInfo()		
    	end

	elseif mode == UI.BuyWnd.modes.SALVAGE then

    	if result == true then
			self:DoSalvageItem2( data.iid )
		end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnBuyWndResult()[ERROR]: unhandled mode %d", mode )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.tradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	self.buyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	self.upgradeItemWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	self.salvageWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self:IsItemsPanelVisible() then
		if not UI.serverData.playerCredits.raceRepChanged then
	    	self.itemsListWnd:OnPlayerCreditsChanged()
		end
	end

	for slotId, slotWnd in pairs( self.shipSlots ) do
		if UI:IsWndKindOf( slotWnd, "ShipsTree_EvolvingEdit_Items_ModuleSlotWnd" ) then
			slotWnd:OnPlayerCreditsChanged()
		end
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if self:IsItemsPanelVisible() then
		self:UpdateItems( true )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if requestId == self.requestId_buyInventory then

		self.requestId_buyInventory = 0

    	if result == _G.GameStore.StoreBuyResult.SBR_OK then

    		if self.buyInfo.shopItem then
				self:LaunchTradeWnd( self.buyInfo.shopItem, false )
    		else
    			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnBuyInventoryExtension(): nil itemToBuy" )
    		end

    	else
			self:ResetBuyInfo()
    		self:ShowBuyErrorMsg( result )
    	end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnSpoiled( result, requestId )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	if self.tradeWnd:IsOnScreen() or self.buyWnd:IsOnScreen() then
		self:ResetBuyInfo()
	end

	self.tradeWnd:UnlinkFromParent()
	self.buyWnd:UnlinkFromParent()
	self.salvageWnd:UnlinkFromParent()
	self.upgradeItemWnd:UnlinkFromParent()

	if self.hMsgRemoveItemFromOtherShip ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgRemoveItemFromOtherShip )
		self.hMsgRemoveItemFromOtherShip = UI.INVALID_UI_HANDLE
		UI:Purge()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GameStore_OnLoadingComplete( storeSize )

	if not self:IsOnScreen() then
		return
	end

	self:HideChildModals()
	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.upgradeItemWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

	if requestId == self.salvage2RequestId then

		if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
			UI:ShowMsgOnSalvage2Error( result )
		end

		self.salvage2RequestId = 0

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.tradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	self.buyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self:IsItemsPanelVisible() then
	    self.itemsListWnd:OnAccountAurasChanged()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.tradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	self.buyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self:IsItemsPanelVisible() then
	    self.itemsListWnd:OnAccountAurasChanged()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	self.tradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	self.buyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if result ~= 0 then
		return
	end

	if self:IsItemsPanelVisible() then
	    self.itemsListWnd:OnAccountAurasChanged()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MasterServer_OnVesselBudgetChanged( vid )

	if not self:IsOnScreen() then
		return
	end

	if not self.selShipItem or self.selShipItem.vid ~= vid then
		return
	end

	if self:IsItemsPanelVisible() then
		self.itemsListWnd:OnVesselBudgetChanged()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnUpgradeItemWndResult( result, iid, vid, equipSlot, customData )

	if not self:IsOnScreen() then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnUpgradeItemWndResult()[ERROR]: not on screen" )
		return
	end

	if result == false then
		return
	end

	-- вау-эффект апгрейда на иконке модуля

	if customData.bInShipSlot then
		-- на слоте корабля
		self:ShowUpgradeItemWowEffect( { iid } )
	else
		if self.itemsListWnd:IsOnScreen() then
			self.itemsListWnd:ShowUpgradeItemWowEffect( iid )
		end
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowUpgradeItemWowEffect( iids )

	if not self:IsOnScreen() then
		return
	end
	
	if type( iids ) ~= "table" then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowUpgradeItemWowEffect[ERROR]: invalid type of the 1-st param (\"iids\"); \"table\" expected, got \"%s\"", type( iids ) )
		return
	end
	
	for idx, iid in pairs( iids ) do
		if type( idx ) ~= "number" or type( iid ) ~= "userdata" then
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowUpgradeItemWowEffect()[ERROR]: invalid format od table \"iids\"; <number>=<userdata> expected, got <%s>=<%s>", type( idx ), type( iid ) )
			return
		end
	end

	for itemIdx, iid in pairs( iids ) do
	
		local bSlotFound = false

		for slotId, slotWnd in pairs( self.shipSlots ) do
		
			if UI:IsWndKindOf( slotWnd, "ShipsTree_EvolvingEdit_Items_ModuleSlotWnd" ) and slotWnd:GetItemId() == iid then
				
				slotWnd:GetParent():MoveChildToLastPosition( slotWnd )	-- вау-эффект залазит на соседние слоты, надо чтобы он рисовался над ними, а не под
				slotWnd:ShowUpgradeItemWowEffect()
				
				bSlotFound = true
				break
				
			end
			
		end
		
		if not bSlotFound then
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowUpgradeItemWowEffect()[ERROR]: slot for iid %s not found", _G.U64ToStr( iid ) )
		end
		
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetShipItem()

	return UI[ self.editWndName ]:GetShipItem()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemDragging()

	return self.ddInfo.ddState == self.ddStates.DRAG

end


-- ------------------------------
-- const
-- ------------------------------

UI.ShipsTree_EvolvingEdit_ItemsWnd.layers =
{
	WORK_EFFECT				= 0,
    WEAPON_LABEL			= 1,
    ACTIVE_LABEL			= 2,
    PASSIVE_LABEL			= 3,
	ENGINE_MOD_EFFECT		= 4,
    ENGINE_MOD_LABEL		= 5,
	CAPACITOR_MOD_EFFECT	= 6,
    CAPACITOR_MOD_LABEL		= 7,
	SHIELD_MOD_EFFECT		= 8,
    SHIELD_MOD_LABEL		= 9,
	ARMOR_MOD_EFFECT		= 10,
    ARMOR_MOD_LABEL			= 11,
	CPU_MOD_EFFECT			= 12,
    CPU_MOD_LABEL			= 13,
}

UI.ShipsTree_EvolvingEdit_ItemsWnd.DD_MOUSE_THRESHOLD	= 5	-- в пределах смещения мыши на это расстояние drag_and_drop не начинается

UI.ShipsTree_EvolvingEdit_ItemsWnd.ddStates			= UI.EquipmentWnd.ddStates
UI.ShipsTree_EvolvingEdit_ItemsWnd.itemTypes 			= UI.EquipmentWnd.itemTypes

UI.ShipsTree_EvolvingEdit_ItemsWnd.sounds =
{
	shipSlotSelect						= "sound/ui/btnClick",
	ddStart								= "",
	ddStop								= "",
	equip								= "sound/ui/moduleEquip",
	unequip								= "sound/ui/cancel",
	cannotEquip							= UI.sounds.invalid,
	tradeWndShow						= "sound/ui/MsgHide",
	cannotSelectShipSlot				= UI.sounds.invalid,
	openSubType							= UI.sounds.btnClick,
	hideItemsList						= "sound/ui/MsgHide",
	salvage								= "sound/ui/lootScanSuccess",	
	tradeWndHide						= "sound/ui/MsgHide",
}

UI.ShipsTree_EvolvingEdit_ItemsWnd.shipSlotType2ModuleType =
{
	[ UI.shipSlotTypes.WEAPON ]			= { "PRIMARY_WEAPON_01" },
	[ UI.shipSlotTypes.ACTIVE ]			= { "ACTIVE_01", "ACTIVE_02","ACTIVE_03", "ACTIVE_04" },
	[ UI.shipSlotTypes.ARMOR_MOD ]		= { "ARMOR_MOD_01", "ARMOR_MOD_02", "ARMOR_MOD_03" },
	[ UI.shipSlotTypes.SHIELD_MOD ]		= { "SHIELD_MOD_01", "SHIELD_MOD_02", "SHIELD_MOD_03" },
	[ UI.shipSlotTypes.CAPACITOR_MOD ]	= { "CAPACITOR_MOD_01", "CAPACITOR_MOD_02","CAPACITOR_MOD_03" },
	[ UI.shipSlotTypes.ENGINE_MOD]		= { "ENGINE_MOD_01", "ENGINE_MOD_02", "ENGINE_MOD_03" },
	[ UI.shipSlotTypes.CPU_MOD ]		= { "CPU_MOD_01", "CPU_MOD_02", "CPU_MOD_03" },
	[ UI.shipSlotTypes.SPECIAL ]		= { "SPECIAL" },
}

UI.ShipsTree_EvolvingEdit_ItemsWnd.shipSlotType2AmmoType =
{
	[ UI.shipSlotTypes.AMMO_PRIMARY ]	= "MBT_PRIMARY",
	[ UI.shipSlotTypes.AMMO_SECONDARY ]	= "MBT_SECONDARY",
}

UI.ShipsTree_EvolvingEdit_ItemsWnd.sortModes =
{
	ASC		= 1,
	DESC	= 2,
}

UI.ShipsTree_EvolvingEdit_ItemsWnd.DEFAULT_SORT_MODE = UI.ShipsTree_EvolvingEdit_ItemsWnd.sortModes.DESC	-- #0065534,комм.(0269650)

UI.ShipsTree_EvolvingEdit_ItemsWnd.editWndName = ""

UI.ShipsTree_EvolvingEdit_ItemsWnd.effectInfo =
{
	main =
	{
		specModuleLocator	= "modul_special"
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.ShipsTree_EvolvingEdit_ItemsWnd.shipSlots					= {}
UI.ShipsTree_EvolvingEdit_ItemsWnd.bLockItemsUpdate			= false
UI.ShipsTree_EvolvingEdit_ItemsWnd.hMsgTimeOut					= UI.INVALID_UI_HANDLE
UI.ShipsTree_EvolvingEdit_ItemsWnd.hMsgRemoveItemFromOtherShip	= UI.INVALID_UI_HANDLE
UI.ShipsTree_EvolvingEdit_ItemsWnd.hMsgUneqipAmmo				= UI.INVALID_UI_HANDLE
UI.ShipsTree_EvolvingEdit_ItemsWnd.ddInfo =
{
	ddState		= UI.ShipsTree_EvolvingEdit_ItemsWnd.ddStates.NONE,
	shipSlot	= nil,
	mouseX_abs	= 0,
	mouseY_abs	= 0,
}
UI.ShipsTree_EvolvingEdit_ItemsWnd.ddIco					= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.ddMouseThreshold_abs		= 0
UI.ShipsTree_EvolvingEdit_ItemsWnd.ddAcceptShipSlot			= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.selShipItem				= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.itemForQuickEquip		= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.popMenuDataToEquip		= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.selShipSlot				= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.buyInfo					= {}
UI.ShipsTree_EvolvingEdit_ItemsWnd.itemsListWnd				= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.requestId_buyInventory	= 0
UI.ShipsTree_EvolvingEdit_ItemsWnd.buyRequestId				= 0
UI.ShipsTree_EvolvingEdit_ItemsWnd.sortMode					= -1
UI.ShipsTree_EvolvingEdit_ItemsWnd.treeItems				= {}
UI.ShipsTree_EvolvingEdit_ItemsWnd.equipTransferInfo		= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.savedItemsUpLevelLayout	= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.wndUnderLastMouseDown	= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.specModuleSlotWnd		= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.tradeWnd					= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.buyWnd					= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.salvageWnd				= nil
UI.ShipsTree_EvolvingEdit_ItemsWnd.upgradeItemWnd			= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.shipSlots	= {}
	self.buyInfo	= {}
	self.treeItems	= {}

    self.ddInfo =
    {
    	ddState		= UI.ShipsTree_EvolvingEdit_ItemsWnd.ddStates.NONE,
    	shipSlot	= nil,
    	mouseX_abs	= 0,
    	mouseY_abs	= 0,
    }

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self:ResetBuyInfo()

	local handle = self:GetUiHandle()
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_START_WAITING_REQUESTS )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_STOP_WAITING_REQUESTS )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_ACTIVATE_RECORD )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CreateControls()

	self.ddIco				= UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_Items_DDIco, "" )
	self.itemsListWnd		= UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_Items_ListWnd, "" )
	self.specModuleSlotWnd	= UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd, "" )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	UI:AddChildAndLink( self, self.specModuleSlotWnd, workEffect, self.effectInfo.main.specModuleLocator, UI.EffectAnimParams.POS )
	self:AddChild( self.itemsListWnd )

	self.tradeWnd = UI:CreateChildWnd( self, UI.TradeWnd, "" )
	self.tradeWnd.mainWndName = self:GetName()

	self.buyWnd = UI:CreateChildWnd( self, UI.BuyWnd, "" )
	self.buyWnd.mainWndName = self:GetName()

	self.salvageWnd = UI:CreateChildWnd( self, UI.SalvageWnd, "" )

	self.upgradeItemWnd = UI:CreateChildWnd( self, UI.UpgradeItemWnd, "" )
	self.upgradeItemWnd.mainWndName = self:GetName()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CreateShipSlots()

	for slotTypeName, slotType in pairs( UI.shipSlotTypes ) do

		if slotType ~= UI.shipSlotTypes.SPECIAL then

    		local bAmmo = self:IsShipSlotTypeAmmo( slotType )
    		local proto = bAmmo and UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd or UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd

    		for inTypeIdx = 1, self:GetMaxShipSlotsOfType( slotType ) do

    			local slotWnd = UI:CreateChildWnd( self, proto, string.format( "%s_%d", slotTypeName, inTypeIdx ) )

    			local slotId = bAmmo and self:ShipSlot2AmmoId( slotType, inTypeIdx ) or self:ShipSlot2ModuleId( slotType, inTypeIdx )
    			slotWnd:Init( slotType, slotId )

    			table.insert( self.shipSlots, slotWnd )

    		end

		end

	end

	self:LayoutShipSlots()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsShipSlotTypeAmmo( slotType )

	return slotType == UI.shipSlotTypes.AMMO_PRIMARY or slotType == UI.shipSlotTypes.AMMO_SECONDARY

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:Reset()

	self.bLockItemsUpdate = true
	self:ResetSelShip()
	self:ResetItemsList()
	self.bLockItemsUpdate = false
	self:ResetDD()
	self.itemForQuickEquip = nil
	self.popMenuDataToEquip = nil
	self:ResetBuyInfo()
	self.requestId_buyInventory = 0
	self:SetSortMode( -1 )
	self.equipTransferInfo = nil
	self.savedItemsUpLevelLayout = nil
	self.wndUnderLastMouseDown = nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ResetSelShip()

	self.selShipItem = nil

	self:ResetShipSlots()
	self:ResetDD()
	self:UpdateItemsPanelVisibility()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ResetShipSlots()

	for idx, slotWnd in pairs( self.shipSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.specModuleSlotWnd:Reset()
	self.specModuleSlotWnd:UnlinkFromParent()	

	self:SelectShipSlot( nil )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:FullUpdate()

	self:Reset()

	self.bLockItemsUpdate = true

	self:ValidateSortMode()
	self:UpdateSelShip()

	self.bLockItemsUpdate = false	
	self:UpdateItems( false )

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateSelShip()

	-- может вызываться, когда vid тот же, но shipItem поменялся (например, при рекрафте корабля)

	local oldSelShipSlot = self.selShipSlot
	local oldVid = self.selShipItem and self.selShipItem.vid or UI.INVALID_U64_ID

	self:ResetSelShip()

	self.selShipItem = self:GetShipItem()

	if not self.selShipItem then
		return
	end

	self:UpdateItemsPanelVisibility()

	local bLockItemsUpdate_old = self.bLockItemsUpdate
	self.bLockItemsUpdate = true

	self:UpdateShipSlots()

	if oldVid ~= self.selShipItem.vid then
		oldSelShipSlot = nil
	end
	self:ValidateShipSlotSelection( oldSelShipSlot )

	self.bLockItemsUpdate = bLockItemsUpdate_old

	self:UpdateItems( oldVid == self.selShipItem.vid )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateShipSlots()

	self:ResetShipSlots()

	if not self.selShipItem then
		return
	end

	-- модули

	local evolvingShipSlotsMask = UI:GetEvolvingShipAllPossibleSlotsMask( self.selShipItem.defName )

	for slotId = 0, ai.SpaceShipModuleSlot.NUM - 1 do
		if UI:BitTstU64( evolvingShipSlotsMask, slotId ) then
			self:UpdateModuleShipSlot( slotId )
		end
	end  


	-- аммуниция

	for ammoIdName, ammoId in pairs( ai.MunitionBayType ) do
		if ammoId ~= ai.MunitionBayType.MBT_NUM then
			self:UpdateAmmoShipSlot( ammoId )
		end
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateModuleShipSlot( moduleId )

	if moduleId == ai.SpaceShipModuleSlot.SPECIAL then

		local itemDefName = UI:GetShipSpecModule( self.selShipItem )

		self:AddChild( self.specModuleSlotWnd )
		self.specModuleSlotWnd:Setup( itemDefName )

	else

    	local slotWnd = self:GetShipSlotForModuleId( moduleId )
    	if not slotWnd then
    		return
    	end

    	local itemId = self.selShipItem.equipModules[ moduleId ] or UI.INVALID_U64_ID

    	local moduleItem = nil
    	if itemId ~= UI.INVALID_U64_ID then
    		moduleItem = UI:GetInventoryItemEx( itemId )
    	end

    	local itemDefName = moduleItem and moduleItem.defName or ""

    	local activeState	= UI.Equipment_ShipSlotWnd.activeStates.ACTIVE
    	local nodeName		= UI:GetEvolvingShipNodeForShipSlot( self.selShipItem.defName, moduleId )

		if nodeName ~= "" then

			if not UI:IsEvolvingShipNodeUnlocked( nodeName, self.selShipItem.vid ) then				
				activeState	= UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_NOT_LEARNED_NODE

			elseif not UI:IsEvolvingShipNodeActive( nodeName, self.selShipItem.vid ) then
				activeState	= UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_INACTIVE_NODE
			end

		end

    	self:AddChild( slotWnd )
    	slotWnd:Setup( activeState, nodeName )

    	if itemDefName ~= "" then
    		slotWnd:SetItem( itemId, itemDefName )
    	end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateAmmoShipSlot( ammoId )

	local slotWnd = self:GetShipSlotForAmmoId( ammoId )
	if not slotWnd then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateAmmoShipSlot()[ERROR]: cannot find ship slot for ammunition type %s", tostring( ammoId ) )
		return
	end

    local ammoInfo = self.selShipItem.equipAmmo[ ammoId ]
	local itemDefName = ammoInfo and ammoInfo.def or ""

	-- Аммуниция для основного оружия должна соответствовать текущему установленному оружию, поэтому если оружия нет, то слот аммуниции для него неактивен.
	-- Исключение - если в слоте уже почему-то стоит неподходящая аммуниция; в этом случае слот не блокируется, чтобы эту аммуницию можно было оттуда снять.

	local slotActiveState = UI.Equipment_ShipSlotWnd.activeStates.ACTIVE

	if ammoId == ai.MunitionBayType.MBT_PRIMARY then

		local curWeaponClass = self:GetCurWeaponClass()
		if curWeaponClass == ai.WeaponClass.UNKNOWN then

			if itemDefName == "" then
				slotActiveState = UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_WEAPON
			else
				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
			end

		else

			if itemDefName ~= "" then
				local itemWeaponClass = UI:GetWeaponClass( itemDefName )
				if itemWeaponClass ~= curWeaponClass then
					sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
				end 
			end

		end


		local curWeaponAmmoSubType = self:GetCurWeaponAmmoSubType()
		if curWeaponAmmoSubType == -1 then

			if itemDefName == "" then
				slotActiveState = UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_WEAPON
			else
				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
			end

		-- если 0 - значит этот параметр не используется для данного оружия
		elseif curWeaponAmmoSubType ~= 0 then

			if itemDefName ~= "" then
				local itemSubType = UI:GetItemSubType( itemDefName )
				if itemSubType ~= curWeaponAmmoSubType then
					sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateAmmoShipSlot()[ERROR]: primary ammo slot is filled with ammo unfit for cur weapon" )
				end 
			end

		end

	end

	self:AddChild( slotWnd )
	slotWnd:Setup( slotActiveState )

	if itemDefName ~= "" then
		slotWnd:SetItem( itemDefName, ammoInfo.amount or 0 )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetShipSlotForModuleId( moduleId )

	for idx, shipSlot in pairs( self.shipSlots ) do
		if not self:IsShipSlotTypeAmmo( shipSlot:GetShipSlotType() ) and shipSlot:GetSlotId() == moduleId then
			return shipSlot
		end
	end

	return nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetShipSlotForAmmoId( ammoId )

	for idx, shipSlot in pairs( self.shipSlots ) do
		if self:IsShipSlotTypeAmmo( shipSlot:GetShipSlotType() ) and shipSlot:GetSlotId() == ammoId then
			return shipSlot
		end
	end

	return nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShipSlot2ModuleId( shipSlotType, slotIdx )

	local moduleId = -1	

	local moduleTypes = self.shipSlotType2ModuleType[ shipSlotType ]
	if moduleTypes then

		local moduleIdName = moduleTypes[ slotIdx ]

		if moduleIdName then

			moduleId = ai.SpaceShipModuleSlot[ moduleIdName ]
			if not moduleId then
				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShipSlot2ModuleId()[ERROR]: invalid module slot name: %s", moduleIdName )
				moduleId = -1
			end

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShipSlot2ModuleId()[ERROR]: cannot find UI.ShipsTree_EvolvingEdit_ItemsWnd.shipSlotType2ModuleType[%d][%s]", shipSlotType, tostring( slotIdx ) )
		end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShipSlot2ModuleId()[ERROR]: cannot find UI.ShipsTree_EvolvingEdit_ItemsWnd.shipSlotType2ModuleType[%s]", tostring( shipSlotType ) )
	end

	return moduleId

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShipSlot2AmmoId( shipSlotType, slotIdx )

	local ammoId = -1

	local ammoIdName = self.shipSlotType2AmmoType[ shipSlotType ]
	if ammoIdName then

		ammoId = ai.MunitionBayType[ ammoIdName ]
		if not ammoId then
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShipSlot2AmmoId()[ERROR]: invalid ammo name: %s", ammoIdName )
			ammoId = -1
		end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShipSlot2AmmoId()[ERROR]: cannot find UI.ShipsTree_EvolvingEdit_ItemsWnd.shipSlotType2AmmoType[%s]", tostring( shipSlotType ) )
	end

	return ammoId

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetMaxShipSlotsOfType( shipSlotType )

	if self:IsShipSlotTypeAmmo( shipSlotType ) then
		return 1

	else
		local moduleTypes = self.shipSlotType2ModuleType[ shipSlotType ]

		if moduleTypes then
			return #moduleTypes
		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:GetMaxShipSlotsOfType()[ERROR]: cannot find UI.ShipsTree_EvolvingEdit_ItemsWnd.shipSlotType2ModuleType[%s]", tostring( shipSlotType ) )
			return 0
		end
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:LayoutShipSlots()

	for idx, slotWnd in pairs( self.shipSlots ) do

		local shipSlotType	= slotWnd:GetShipSlotType()
		local slotId		= slotWnd:GetSlotId()

		local layer		= -1
		local locator	= ""
	
		if shipSlotType == UI.shipSlotTypes.WEAPON then

			layer	= self.layers.WORK_EFFECT
			locator	= "weap_modules_1"

		elseif shipSlotType == UI.shipSlotTypes.ACTIVE then

			layer	= self.layers.WORK_EFFECT
			locator	= string.format( "active_modules_%d", slotId - ai.SpaceShipModuleSlot.ACTIVE_01 + 1 )

		elseif shipSlotType == UI.shipSlotTypes.ENGINE_MOD then

			layer	= self.layers.ENGINE_MOD_EFFECT
			locator	= string.format( "pass_modules_%d", slotId - ai.SpaceShipModuleSlot.ENGINE_MOD_01 + 1 )

		elseif shipSlotType == UI.shipSlotTypes.CAPACITOR_MOD then

			layer	= self.layers.CAPACITOR_MOD_EFFECT
			locator	= string.format( "pass_modules_%d", slotId - ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 + 1 )

		elseif shipSlotType == UI.shipSlotTypes.SHIELD_MOD then

			layer	= self.layers.SHIELD_MOD_EFFECT
			locator	= string.format( "pass_modules_%d", slotId - ai.SpaceShipModuleSlot.SHIELD_MOD_01 + 1 )

		elseif shipSlotType == UI.shipSlotTypes.ARMOR_MOD then

			layer	= self.layers.ARMOR_MOD_EFFECT
			locator	= string.format( "pass_modules_%d", slotId - ai.SpaceShipModuleSlot.ARMOR_MOD_01 + 1 )

		elseif shipSlotType == UI.shipSlotTypes.CPU_MOD then

			layer	= self.layers.CPU_MOD_EFFECT
			locator	= string.format( "pass_modules_%d", slotId - ai.SpaceShipModuleSlot.CPU_MOD_01 + 1 )

		elseif shipSlotType == UI.shipSlotTypes.AMMO_PRIMARY then

			layer	= self.layers.WORK_EFFECT
			locator	= "weap_modules_2"

		elseif shipSlotType == UI.shipSlotTypes.AMMO_SECONDARY then

			layer	= self.layers.WORK_EFFECT
			locator	= "weap_modules_3"

		elseif shipSlotType == UI.shipSlotTypes.SPECIAL then

			-- ничего (отдельное окно)

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:LayoutShipSlots()[ERROR]: unhandled ship slot type %d", shipSlotType )
		end

		if layer ~= -1 and locator ~= "" then

			local effect = UI:GetEffectFromLayer( self, layer )
			if effect then
				effect:LinkWnd( slotWnd:GetUiHandle(), locator, UI.EffectAnimParams.POS )
			end

		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end

	self:ResetDD()

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local itemSlotWnd = nil
	if UI:IsWndKindOf( wnd, "Equipment_Items_SlotWnd" ) then
		itemSlotWnd = wnd
	else
		itemSlotWnd = UI:GetAncestorKindOf( wnd, "Equipment_Items_SlotWnd" )
	end

	if UI:IsWndKindOf( wnd, "Equipment_Items_ActionBtn" ) then

		if not wnd:IsGray() then

        	local itemSlotWnd = self:GetItemSlotByActionBtn( wnd )
    		if itemSlotWnd then

    			local data = itemSlotWnd:GetRecordData()

    			local item = data.item
    			if item.itemType == self.itemTypes.SUB_TYPE then
    				item = item.subItemToShow
    			end

				if item then

        			if item.itemType == self.itemTypes.SHOP then

                   		if not self:IsWaiting() then

							if UI:CantItemBeBought( item.shopItem ) then

								self:LaunchItemCraftWnd( item.shopItem.defName, false )
								return true		-- обязательно, иначе мышь будет обработана ангаром, и окно крафта закроется

							else
	                   			self:TryQuickEquip( item )
							end

                   		else
                   			UI:PlayGlobalSound( self.sounds.cannotEquip )
                   		end

        			elseif item.itemType == self.itemTypes.INVENTORY then

                   		if not self:IsWaiting() then

        					if item.inventoryItems then
        						local inventoryItem = item.inventoryItems[ 1 ]
        						if inventoryItem then

									local btnMode = wnd:GetMode()

									if ( btnMode == UI.Equipment_Items_ActionBtn.modes.CRAFT ) or ( btnMode == UI.Equipment_Items_ActionBtn.modes.CRAFT_UPGRADE ) then

										local nextDefName = UI:GetItemUpgradeNextDef( inventoryItem.defName )
										if nextDefName ~= "" then

											self:LaunchItemCraftWnd( nextDefName, true, inventoryItem.iid )
											return true		-- обязательно, иначе мышь будет обработана ангаром, и окно крафта закроется

										else
											sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonDown()[ERROR]: cannot find def for next upgrade for item \"%s\"", inventoryItem.defName )
										end

									elseif btnMode == UI.Equipment_Items_ActionBtn.modes.UPGRADE then

										--if UI:GetItemUpgradeCreditsPrice( inventoryItem.defName ) <= UI:GetPlayerCredits() then
		        							self:LaunchUpgradeItemWnd( inventoryItem.iid, false )
										--else
										--	self:ShowMsgBoxOnNotEnoughMoney( _G.GameStore.CreditsType.CT_CREDITS )
										--end

									else
										sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonDown()[ERROR]: unhandled btn mode %d", btnMode )
									end

        						end
        					end

        				end

        			else
        				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonDown()[ERROR]: unhandled item type: %s", tostring( item.itemType ) )
        			end

				end

    		else
    			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonDown()[ERROR]: cannot find slot" )
    		end	

		end

	elseif UI:IsWndKindOf( wnd, "Equipment_Items_OpenSubTreeBtn" ) then

		if not wnd:IsGray() then

        	local itemSlotWnd = self:GetItemSlotByOpenSubTreeBtn( wnd )
    		if itemSlotWnd then

            	local data = itemSlotWnd:GetRecordData()
    			if data.item.itemType == self.itemTypes.SUB_TYPE then

    				if self:IsItemSubTypeAvailable( data.item.subType ) then

        				if not data.item.bOpen then

        					self:OpenItemsSubType( data.item.subType, data.item.rank, true )
							UI:PlayGlobalSound( self.sounds.openSubType )
					
        				end

    				else
    	        		UI:PlayGlobalSound( self.sounds.cannotEquip )
    				end

    			else
    				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonDown()[ERROR]: wrong slot type" )
    			end

    		else
    			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonDown()[ERROR]: cannot find slot" )
    		end	

		end  

	elseif itemSlotWnd then

    	local data = itemSlotWnd:GetRecordData()

		local item = data.item
		if item.itemType == self.itemTypes.SUB_TYPE then
			item = item.subItemToShow
		end

		if item then

			if item.itemType == self.itemTypes.INVENTORY then

        		if not self:IsWaiting() then
        			self:TryQuickEquip( item )
        		else
        			UI:PlayGlobalSound( self.sounds.cannotEquip )
        		end

			end

		end

	elseif wnd.EQUIP_SHIP_SLOT then

		local bInBattle		= self.selShipItem and ( UI:IsShipInBattle( self.selShipItem ) or UI:IsShipOnShipQuest( self.selShipItem ) )
		local activeState	= wnd:GetActiveState()

    	if	( activeState == UI.Equipment_ShipSlotWnd.activeStates.ACTIVE or activeState == UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_INACTIVE_NODE )
			and wnd:GetDefName() ~= ""
			and not bInBattle
			and not self:IsWaiting()
			and wnd:GetShipSlotType() ~= UI.shipSlotTypes.SPECIAL then
            	self:SetDDState_WAIT_MOUSE( wnd, mouseX, mouseY )
		end

	elseif UI:IsWndKindOf( wnd, "Equipment_ItemsList_BackBtn" ) then

    	self:OpenItemsSubType( -1, -1, true )
		UI:PlayGlobalSound( self.sounds.openSubType )

	elseif UI:IsWndKindOf( wnd, "Equipment_ItemsList_CrossBtn" ) then

		self:SelectShipSlot( nil )
		UI:PlayGlobalSound( self.sounds.hideItemsList )

	elseif wnd == UI.EquipmentShipUpgrade_Btn then
		UI.EquipmentShipUpgrade_Btn:OnMouseClick()

	end

	-- HangarWnd нуждается в обработке мыши
	return false

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	local itemSlotWnd = nil
	if UI:IsWndKindOf( wnd, "Equipment_Items_SlotWnd" ) then
		itemSlotWnd = wnd
	else
		itemSlotWnd = UI:GetAncestorKindOf( wnd, "Equipment_Items_SlotWnd" )
	end

	if wnd.EQUIP_SHIP_SLOT then

		local activeState	= wnd:GetActiveState()
		local bInBattle		= self.selShipItem and ( UI:IsShipInBattle( self.selShipItem ) or UI:IsShipOnShipQuest( self.selShipItem ) )
		local itemDefName	= wnd:GetDefName()

    	if	( activeState == UI.Equipment_ShipSlotWnd.activeStates.ACTIVE or activeState == UI.Equipment_ShipSlotWnd.activeStates.LOCKED_FOR_INACTIVE_NODE )
			and not bInBattle
			and not self:IsWaiting()
			and itemDefName ~= ""
			and wnd:GetShipSlotType() ~= UI.shipSlotTypes.SPECIAL then

			local menuDatas = {}

			local bAmmo = self:IsShipSlotTypeAmmo( wnd:GetShipSlotType() )
			local slotId = wnd:GetSlotId()

			-- снять

			local unequipData = {}

    		unequipData.slotType	= UI.popUpMenuSlotTypes.REMOVE_EQUIPPED_ITEM
			unequipData.text		= UI:GetStringByName( "popUpMenu_unequipItem" )
			unequipData.vid			= self.selShipItem.vid
			unequipData.slotId		= slotId
			unequipData.defName 	= itemDefName

			if not bAmmo then
				unequipData.iid = wnd:GetItemId()
			end

			table.insert( menuDatas, unequipData )


			-- продать (кроме аммуниции)

			if not bAmmo then

				local sellData = {}

    			sellData.slotType	= UI.popUpMenuSlotTypes.SELL_ITEM
				sellData.text		= UI:GetStringByName( "popUpMenu_sellItem" )
				sellData.vid		= self.selShipItem.vid
				sellData.defName	= itemDefName
				sellData.count		= 1
				sellData.iids		= { wnd:GetItemId() }

				table.insert( menuDatas, sellData )

			end


			-- пополнить аммуницию

			if bAmmo and wnd:GetCount() == 0 then

				local refillData = {}

				if self:CanRefillAmmoFropmInventory( itemDefName ) then

        			refillData.slotType		= UI.popUpMenuSlotTypes.REFILL_AMMO_FROM_INVENTORY
					refillData.text			= UI:GetStringByName( "popUpMenu_refillAmmoFromInventory" )
					refillData.vid			= self.selShipItem.vid
					refillData.slotId		= slotId
					refillData.defName		= itemDefName

					table.insert( menuDatas, refillData )

				elseif self:CanRefillAmmoFromShop( itemDefName ) then

        			refillData.slotType		= UI.popUpMenuSlotTypes.REFILL_AMMO_FROM_SHOP
					refillData.text			= UI:GetStringByName( "popUpMenu_refillAmmoFromShop" )
					refillData.vid			= self.selShipItem.vid
					refillData.slotId		= slotId
					refillData.defName		= itemDefName

					table.insert( menuDatas, refillData )

				end

			end


			-- разобрать

			if UI:CanItemBeSalvaged( itemDefName ) or UI:CanItemBeSalvaged2( itemDefName ) then

				local salvageData = {}

    			salvageData.slotType	= UI.popUpMenuSlotTypes.SALVAGE_ITEM
				salvageData.text		= UI:GetStringByName( "popUpMenu_salvageItem" )
				salvageData.iid			= wnd:GetItemId()

				table.insert( menuDatas, salvageData )

			end


			-- апгрейдить

			if UI:IsItemUpgradable( itemDefName ) then

				local upgradeData = UI:GetItemPopUpMenuDataForUpgrade( wnd:GetItemId() )
				if upgradeData then

					upgradeData.customData = { bInShipSlot = true }
					table.insert( menuDatas, upgradeData )

				end

			end
			
			
			-- показать в атласе
			
			if UI:IsItemVisibleInAtlas( UI:GetItemUpgradeBaseDef( itemDefName ) ) then
			
				local atlasData = {}

    			atlasData.slotType	= UI.popUpMenuSlotTypes.SHOW_ATLAS
				atlasData.text		= UI:GetStringByName( "popUpMenu_showAtlas" )
				atlasData.defName	= itemDefName

				table.insert( menuDatas, atlasData )

			end
			
			
			-- открыть окно торговли с другими игроками
			
			if UI:IsItemTrading( itemDefName ) then
			
				local tradingData = {}

    			tradingData.slotType	= UI.popUpMenuSlotTypes.TRADING_ITEM
				tradingData.text		= UI:GetStringByName( "popUpMenu_tradingItem" )
				tradingData.defName		= itemDefName

				table.insert( menuDatas, tradingData )

			end


			if next( menuDatas ) then

	        	UI.PopUpMenuWnd:Setup( self:GetUiHandle(), UI.popUpMenuTypes.ITEM, UI:GetEntityLocalizedNameByDef( itemDefName, true, false, true ) )

				for idx, data in ipairs( menuDatas ) do
					UI.PopUpMenuWnd:AddRecord( data )
				end

			else
				UI:PlayGlobalSound( self.sounds.cannotSelectShipSlot )
			end

		end

	elseif itemSlotWnd then

    	local data = itemSlotWnd:GetRecordData()

    	local item = data.item
    	if data.item.itemType == self.itemTypes.SUB_TYPE then
    		item = item.subItemToShow
    	end			

		local bNeedPopUpMenu = item and item.itemType ~= self.itemTypes.SUB_TYPE and self:IsItemAvailable( item ) and not self:IsWaiting()
		if bNeedPopUpMenu then

			local itemDefName	= item.defName
			local bAmmo			= UI:IsDefAmmo( itemDefName )
			local selSlotId		= self.selShipSlot:GetSlotId()

			local menuDatas = {}

			-- купить (и после этого экипировать)

			if item.itemType == self.itemTypes.SHOP and not UI:CantItemBeBought( item.shopItem ) then

				local buyData = {}

        		buyData.slotType	= UI.popUpMenuSlotTypes.BUY_AND_EQUIP_ITEM
				buyData.text		= UI:GetStringByName( "popUpMenu_buyItem" )
				buyData.vid			= self.selShipItem.vid
				buyData.slotId		= selSlotId
				buyData.shopItem	= item.shopItem

				table.insert( menuDatas, buyData )

			end

			-- экипировать

			if item.itemType == self.itemTypes.INVENTORY and item.equipShipItem ~= self.selShipItem then

				local equipData = {}

        		equipData.slotType		= UI.popUpMenuSlotTypes.EQUIP_ITEM
				equipData.text			= UI:GetStringByName( "popUpMenu_equipItem" )
				equipData.dstVid		= self.selShipItem.vid
				equipData.dstSlotId		= selSlotId
				equipData.srcVid   		= item.equipShipItem and item.equipShipItem.vid or UI.INVALID_U64_ID
				equipData.srcSlotId		= item.equipShipItem and item.slotId or -1
				equipData.defName		= itemDefName

				if not bAmmo then
					local idx, inventoryItem = next( item.inventoryItems )
					equipData.iid = inventoryItem.iid
				end

				table.insert( menuDatas, equipData )

			end

			-- снять

			if item.itemType == self.itemTypes.INVENTORY and item.equipShipItem then

				local unequipData = {}

        		unequipData.slotType	= UI.popUpMenuSlotTypes.REMOVE_EQUIPPED_ITEM
				unequipData.text		= UI:GetStringByName( "popUpMenu_unequipItem" )
				unequipData.vid			= item.equipShipItem.vid
				unequipData.slotId		= item.slotId
				unequipData.defName 	= itemDefName

				if not bAmmo then
					local idx, inventoryItem = next( item.inventoryItems )
					unequipData.iid = inventoryItem.iid
				end

				table.insert( menuDatas, unequipData )

			end

			-- продать (кроме установленной аммуниции)

			if item.itemType == self.itemTypes.INVENTORY and not ( bAmmo and item.equipShipItem )  then

				local sellData = {}

    			sellData.slotType	= UI.popUpMenuSlotTypes.SELL_ITEM
				sellData.text		= UI:GetStringByName( "popUpMenu_sellItem" )
				sellData.vid		= item.equipShipItem and item.equipShipItem.vid or UI.INVALID_U64_ID
				sellData.defName	= itemDefName
				sellData.count		= 0

				sellData.iids		= {}
				for idx, inventoryItem in pairs( item.inventoryItems ) do
					table.insert( sellData.iids, inventoryItem.iid )
					local itemCount = inventoryItem.amount or 1	-- если итем автоген, то в нем нет поля amount
					sellData.count = sellData.count + itemCount
				end

				table.insert( menuDatas, sellData )

			end

			-- разобрать

			if item.itemType == self.itemTypes.INVENTORY and ( UI:CanItemBeSalvaged( itemDefName ) or UI:CanItemBeSalvaged2( itemDefName ) ) then

				local salvageData = {}

    			salvageData.slotType	= UI.popUpMenuSlotTypes.SALVAGE_ITEM
				salvageData.text		= UI:GetStringByName( "popUpMenu_salvageItem" )

				local idx, inventoryItem = next( item.inventoryItems )
				salvageData.iid = inventoryItem.iid

				table.insert( menuDatas, salvageData )

			end    

			-- апгрейдить/активировать

			if item.itemType == self.itemTypes.INVENTORY and UI:IsItemUpgradable( item.defName ) then

				local inventoryItem = item.inventoryItems and item.inventoryItems[ 1 ]
				local iid = inventoryItem and inventoryItem.iid or UI.INVALID_U64_ID

				if iid ~= UI.INVALID_U64_ID then

    				local upgradeData = UI:GetItemPopUpMenuDataForUpgrade( iid )
    				if upgradeData then
						upgradeData.customData = { bInShipSlot = false }
    					table.insert( menuDatas, upgradeData )
    				end

				end

			end
			
			-- показать в атласе
			
			if UI:IsItemVisibleInAtlas( UI:GetItemUpgradeBaseDef( itemDefName ) ) then
			
				local atlasData = {}

    			atlasData.slotType	= UI.popUpMenuSlotTypes.SHOW_ATLAS
				atlasData.text		= UI:GetStringByName( "popUpMenu_showAtlas" )
				atlasData.defName	= itemDefName

				table.insert( menuDatas, atlasData )

			end
			
			-- открыть окно торговли с другими игроками
			
			if UI:IsItemTrading( itemDefName ) then
			
				local tradingData = {}

    			tradingData.slotType	= UI.popUpMenuSlotTypes.TRADING_ITEM
				tradingData.text		= UI:GetStringByName( "popUpMenu_tradingItem" )
				tradingData.defName		= itemDefName

				table.insert( menuDatas, tradingData )

			end

			if next( menuDatas ) then

	        	UI.PopUpMenuWnd:Setup( self:GetUiHandle(), UI.popUpMenuTypes.ITEM, UI:GetEntityLocalizedNameByDef( itemDefName, true, false, true ) )

				for idx = 1, #menuDatas do
					UI.PopUpMenuWnd:AddRecord( menuDatas[ idx ] )
				end

			end

		end

	end

	-- HangarWnd нуждается в обработке мыши
	return false

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	if not self:IsOnScreen() then
		return
	end

	self.wndUnderLastMouseDown = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )

	self:CheckHideItemsListOnMouseClick( btnIdx )

end 


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CheckHideItemsListOnMouseClick( btnIdx )

	if not self.selShipSlot then
		return
	end

	local wndUnderMouse = self.wndUnderLastMouseDown

	if not wndUnderMouse then
		return
	end

	-- может быть, например, если открыто "модальное" окно типа продажи или апгрейда, или контекстное меню
	if not ( wndUnderMouse == UI.HangarWnd or wndUnderMouse:IsChildOf( UI.HangarWnd ) ) then
		return
	end

	if wndUnderMouse == self.itemsListWnd or wndUnderMouse:IsChildOf( self.itemsListWnd ) then
		return
	end


	if UI:IsWndKindOf( wndUnderMouse, "Equipment_ShipSlotWnd" ) or UI:HasWndAncestorKindOf( wndUnderMouse, "Equipment_ShipSlotWnd" ) then

		-- левый клик на слоте корабля обрабатывается в F_OnMouseLButtonDown
		if btnIdx == 0 then
			return
		end

	end	

	self:SelectShipSlot( nil )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return false
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if self.ddInfo.ddState == self.ddStates.DRAG then

		if not self:IsWaiting() then

    		local slotWnd = self:GetShipSlotUnderMouse( mouseX, mouseY )

    		-- уронили над принимающим слотом -> экипировка
    		if self.ddAcceptShipSlot and self.ddAcceptShipSlot.EQUIP_SHIP_SLOT and slotWnd == self.ddAcceptShipSlot then
    			self:TryEquipDDItem()
    			UI:PlayGlobalSound( self.sounds.equip )
    			
    		-- уронили над непринимающим слотом -> без последствий
    		elseif slotWnd and slotWnd:IsVisible() then
    			self:ResetDD()
				if self.sounds.ddStop and self.sounds.ddStop ~= "" then
    				UI:PlayGlobalSound( self.sounds.ddStop )
				end

    		-- уронили в любом другом месте -> разэкипировка
    		else
    			self:TryUnequipDDItem()
    			UI:PlayGlobalSound( self.sounds.unequip )
    		end

		else
    		self:ResetDD()
			if self.sounds.ddStop and self.sounds.ddStop ~= "" then
    			UI:PlayGlobalSound( self.sounds.ddStop )
			end
		end

	else

    	local slotWnd = nil

		if self.ddInfo.ddState ~= self.ddStates.NONE then
			self:ResetDD()
    		slotWnd = self:GetShipSlotUnderMouse( mouseX, mouseY )	-- при драг-энд-дропе мышь капчурится окном эквипмента, поэтому mouse up приходит для него
		else
        	if UI:IsWndKindOf( w, "Equipment_ShipSlotWnd" ) and w:IsVisible() then
        		slotWnd = w
        	end
		end

		if slotWnd and slotWnd == self.wndUnderLastMouseDown then

        	if slotWnd == self.selShipSlot and self.itemsListWnd:IsOnScreen() then

            	self:SelectShipSlot( nil )

        	else

            	if slotWnd:IsActive() then                                                

        			local bCanBeSelected = true

					if bCanBeSelected then
        				local bInBattle = self.selShipItem and ( UI:IsShipInBattle( self.selShipItem ) or UI:IsShipOnShipQuest( self.selShipItem ) )
        				if bInBattle then
							bCanBeSelected = false
						end
					end

					if bCanBeSelected then
	        	    	if self:IsWaiting() then
							bCanBeSelected = false
						end
					end

					if bCanBeSelected then
						if slotWnd:GetShipSlotType() == UI.shipSlotTypes.SPECIAL then
							if not UI:IsSpecModuleCustomizableOnShip( self.selShipItem.defName ) then
								bCanBeSelected = false
							end
						end
					end

        			if bCanBeSelected then

    					if slotWnd ~= self.selShipSlot then

    	    				self:SelectShipSlot( slotWnd )
    						UI:PlayGlobalSound( self.sounds.shipSlotSelect )

    					end

					else
        				UI:PlayGlobalSound( self.sounds.cannotSelectShipSlot )
        			end

        		end
        	end
		end
	end

	return false

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return false
	end

	if self.ddInfo.ddState == self.ddStates.DRAG then

		self.ddIco:UpdatePos( self:XToScreen( mouseX ), self:YToScreen( mouseY ) )
		self:UpdateAcceptSlot( mouseX, mouseY )

	elseif self.ddInfo.ddState == self.ddStates.WAIT_MOUSE then

		local mouseX_abs	= UI:XToAbs( mouseX )
		local mouseY_abs 	= UI:YToAbs( mouseY )

		local dir = UI:Vec2( mouseX_abs - self.ddInfo.mouseX_abs, mouseY_abs - self.ddInfo.mouseY_abs )
		local distSq_abs = UI:V2LengthSq( dir )

		if distSq_abs > self.ddMouseThreshold_abs * self.ddMouseThreshold_abs then
			self:SetDDState_DRAG()
		end			

	end

	return false

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if not self.itemsListWnd then
		return true
	end	

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )
	if not( wnd == self.itemsListWnd or wnd:IsChildOf( self.itemsListWnd ) ) then
		return true
	end	

	self.timeSinceMouseWheel = 0
	self.itemsListWnd:ScrollVisibleRange( ticks < 0 )

	return true

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEditMissMouse( editWnd )

	if self:GetDefaultActivatableChildName() == editWnd:GetName() then
		self:SetDefaultActivatableChild( "" )
		UI:ValidateKeyboardFocus()
	end
	
end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		self:HideChildModals()
	end

	if not UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then
		self:Reset()
	end

	self.hMsgTimeOut 							= UI.INVALID_UI_HANDLE
	self.hMsgRemoveItemFromOtherShip			= UI.INVALID_UI_HANDLE
	self.hMsgUneqipAmmo							= UI.INVALID_UI_HANDLE
	
	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:HideChildModals()

	if UI:IsInRemovingAllWindows() then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:HideChildModals()[ERROR]: UI:IsInRemovingAllWindows()" )
		return
	end

	if self.hMsgRemoveItemFromOtherShip ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgRemoveItemFromOtherShip )
		UI:Purge()
		self.hMsgRemoveItemFromOtherShip = UI.INVALID_UI_HANDLE
	end

	self.tradeWnd:UnlinkFromParent()
	self.buyWnd:UnlinkFromParent()
	self.salvageWnd:UnlinkFromParent()
	self.upgradeItemWnd:UnlinkFromParent()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcAbsVals()
	self:RecalcLayout()

	-- здесь, а не в PostLoad, т.к. во время PostLoad еще не загружены скриптовые файлы с константами ai
	if not next( self.shipSlots ) then
		self:CreateShipSlots()
	end

	self:FullUpdate()

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ResetItemsList()

	if self.itemsListWnd then
		self.itemsListWnd:Reset()
	end

	self.treeItems = {}

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateItems( bRestoreLayout )

	if self.bLockItemsUpdate then
		return
	end

	local oldOpenSubType, oldOpenRank = self:GetOpenItemsSubType()
	local oldScrollPos = self.itemsListWnd:GetScrollPos()

	self:ResetItemsList()

	if not self.selShipSlot then
		self.savedItemsUpLevelLayout = nil
		return
	end


	-- построение дерева

	self.treeItems = self:GetItemsFiltered()


	-- определяется открытая папка
	local openSubType = -1
	local openRank = -1

	-- существующая открытая папка сохраняется
	if bRestoreLayout then
		openSubType = oldOpenSubType
		openRank = oldOpenRank

	-- открытая папка по умолчанию - отсутствует
	else
		openSubType = -1
		openRank = -1
	end

	-- #0034304 не допускается открытие пустой папки
	if openSubType ~= -1 then

		local bHasSubTreeItems = false

		local subTypeItem = self:GetItemBySubType( openSubType, openRank )
		if subTypeItem then
		
			local subTreeItems = self:GetSubtreeItems( subTypeItem )
			bHasSubTreeItems = next( subTreeItems ) ~= nil

		end

		if not bHasSubTreeItems then
			openSubType = -1
			openRank = -1
		end

	end		

	self:SetItemTreeOpenSubTypeInternal( openSubType, openRank )
	openSubType, openRank = self:GetOpenItemsSubType()

	-- построение списка по дереву
	self:UpdateItemsListFromTree()


	-- установка позиции скролла

	if self.itemsListWnd:GetNumRecords() > 0 then

    	local scrollPos = 0

    	if bRestoreLayout then

    		if oldScrollPos ~= -1 then
    			scrollPos = oldScrollPos		
			end

    	else
    		local curItem = self:GetCurTreeItem( openSubType ~= -1 )
    		if curItem then
    			local recordIdx = self:GetRecordByItem( curItem )
    			if recordIdx ~= -1 then
    				scrollPos = recordIdx
    			end
    		end
    	end


    	self.itemsListWnd:SetScrollPos( scrollPos )

	end


	-- если лэйаут списка строится с нуля, то сброс запомненной информации о верхнем уровне лэйаута
	if not bRestoreLayout then
		self.savedItemsUpLevelLayout = nil
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MakeTreeItemsIndices( treeItems )

	for idx, item in pairs( treeItems ) do
		item.treeIdx = idx
	end

	return treeItems	

end  


-- для аммуниции "субтайпом" считается ее деф, а не нстоящий субтайп, потому что на верхнем уровне списка именно дефы, а не настоящие субтайпы - #0036878,комм.(0135117)
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemSubTypeEx( item )

	if not item then
		return -1, -1
	end

	if item.itemType == self.itemTypes.SUB_TYPE then
		return item.subType, item.rank
	end

	return self:GetItemSubTypeExByDefName( item.defName )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemSubTypeExByDefName( defName )

	local bAmmo = UI:IsDefAmmo( defName )

	if bAmmo then
		return defName, -1

	else

	   	local def = UI:GetDef( defName )
		local subType = def.item_subtype or -1

		local rank = -1
		if self:NeedGroupByRank() then
			rank = UI:GetItemEquipMinRank( defName )
		end

		return subType, rank

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OpenItemsSubType( subType, rank, bPreserveScrollPos )

	local oldSubType, oldRank = self:GetOpenItemsSubType()
	self:SetItemTreeOpenSubTypeInternal( subType, rank )
	local newSubType, newRank = self:GetOpenItemsSubType()

	-- при переходе на нижний уровень дерева сохраняется позиция скролла для последующего восстановления

	local bGoUp = oldSubType ~= -1 and newSubType == -1
	local bGoDown = oldSubType == -1 and newSubType ~= -1
	local bNeedSaveUpLevelLayout = false

	if bPreserveScrollPos then
    	if bGoDown then
			self.savedItemsUpLevelLayout = { subType = subType, rank = rank, scrollPos = self.itemsListWnd:GetScrollPos() }
			bNeedSaveUpLevelLayout = true
    	end
	end

	-- создание списка
	self:UpdateItemsListFromTree()

	-- при переходе на верхний уровень дерева восстанавливается сохраненная позиция скролла

	local scrollPos = 0

	local bScrollPosHandled = false
	if bPreserveScrollPos then
    	if bGoUp and self.savedItemsUpLevelLayout and self.savedItemsUpLevelLayout.subType == oldSubType and self.savedItemsUpLevelLayout.rank == oldRank then
			scrollPos = self.savedItemsUpLevelLayout.scrollPos
			bScrollPosHandled = true
		end
	end

	if not bScrollPosHandled then
		
		local curItem = self:GetCurTreeItem( newSubType ~= -1 )
		if curItem then
			local recordIdx = self:GetRecordByItem( curItem )
			if recordIdx ~= -1 then
				scrollPos = recordIdx
			end
		end		

	end

	self.itemsListWnd:SetScrollPos( scrollPos )


	-- сброс сохраненной позиции скролла при необходиости

	if not bNeedSaveUpLevelLayout then
		self.savedItemsUpLevelLayout = nil
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SetItemTreeOpenSubTypeInternal( subType, rank )

	if subType ~= -1 and not self:IsItemSubTypeAvailable( subType ) then
		subType = -1
	end

	local oldOpenItem	= nil
	local newOpenItem	= nil

	for idx, item in pairs( self.treeItems ) do

		if item.itemType == self.itemTypes.SUB_TYPE then

			if item.bOpen then
				oldOpenItem = item
			end

			if subType ~= -1 and item.subType == subType and item.rank == rank then
				newOpenItem = item
			end

		end

	end

	if newOpenItem == oldOpenItem then
		return
	end

	if oldOpenItem then
		oldOpenItem.bOpen = false
	end

	if newOpenItem then
		newOpenItem.bOpen = true
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetOpenItem()

	for idx, item in pairs( self.treeItems ) do
		if item.bOpen then
			return item
		end
	end

	return nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetOpenItemsSubType()

	local openItem = self:GetOpenItem()

	local subType = openItem and openItem.subType or -1
	local rank = openItem and openItem.rank or -1

	return subType, rank

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetSubtreeFirstItem( rootItem )

	local nextItem = self.treeItems[ rootItem.treeIdx + 1 ]

	if nextItem.itemType ~= self.itemTypes.SUB_TYPE then
		return nextItem
	else
		return nil
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetSubtreeLastItem( rootItem )

	local lastSubtreeItem = nil

	for idx = rootItem.treeIdx + 1, #self.treeItems do

		local item = self.treeItems[ idx ]
		if item.itemType ~= self.itemTypes.SUB_TYPE then
			lastSubtreeItem = item
		else
			break
		end

	end

	return lastSubtreeItem

end   


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetSubtreeItems( rootItem, items )

	if items == nil then
		items = self.treeItems
	end

	local subtreeItems = {}

	for idx = rootItem.treeIdx + 1, #items do

		local item = items[ idx ]
		if item.itemType ~= self.itemTypes.SUB_TYPE then
			table.insert( subtreeItems, item )
		else
			break
		end

	end

	return subtreeItems	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetCurTreeItem( bHasOpenSubType )

	local bFindSubTypeItem = not bHasOpenSubType

	if self.selShipSlot and self.selShipSlot:GetShipSlotType() == UI.shipSlotTypes.SPECIAL then
		bFindSubTypeItem = false
	end

	for idx, item in pairs( self.treeItems ) do

		if ( bFindSubTypeItem and item.itemType == self.itemTypes.SUB_TYPE ) or ( not bFindSubTypeItem and item.itemType ~= self.itemTypes.SUB_TYPE ) then
    		if self:IsItemCurrent( item ) then
    			return item
    		end
		end

	end

	return nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetRecordByItem( item )

	for recordIdx = 1, self.itemsListWnd:GetNumRecords() do

		local data = self.itemsListWnd:GetRecordData( recordIdx )
		if data.item == item then
			return recordIdx
		end

	end

	return -1

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetRecordBySubType( subType, rank )

	for recordIdx = 1, self.itemsListWnd:GetNumRecords() do

		local data = self.itemsListWnd:GetRecordData( recordIdx )
		if data.item.itemType == self.itemTypes.SUB_TYPE and data.item.subType == subType and data.item.rank == rank then
			return recordIdx
		end

	end

	return -1	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemBySubType( subType, rank )

	for idx, item in pairs( self.treeItems ) do

		if item.itemType == self.itemTypes.SUB_TYPE and item.subType == subType and item.rank == rank then
			return item
		end

	end

	return nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateItemsListFromTree()	

	local openSubType, openRank = self:GetOpenItemsSubType()
	local bAmmo = self.selShipSlot and self:IsShipSlotTypeAmmo( shipSlotType )

	self.itemsListWnd:Reset()

	self.itemsListWnd:UpdateMaxSlots()
	self.itemsListWnd:SetMode( self.itemsListWnd.modes.REGULAR )

	for idx = 1, #self.treeItems do

		local item = self.treeItems[ idx ] 

		local bShow = false

		if openSubType == -1 then
			bShow = item.itemType == self.itemTypes.SUB_TYPE
		else
			local subType, rank = self:GetItemSubTypeEx( item )
			bShow = item.itemType ~= self.itemTypes.SUB_TYPE and subType == openSubType and rank == openRank
		end

		if bShow then
			local data = { item = item }
			self.itemsListWnd:AddRecord( data )
		end

	end

	self.itemsListWnd:UpdateBackBtn()
	self:UpdateItemsCaption()
	self:UpdateItemsListLayout()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:AdjustItemsList()

	-- находится открытая папка

	local openItem = self:GetOpenItem()
	if not openItem then
		return
	end

	local openItemRecordIdx = self:GetRecordByItem( openItem )
	if openItemRecordIdx == -1 then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:AdjustItemsList()[ERROR]: cannot find record for open item" )
		return
	end


	-- находится последний элемент открытого поддерева

	local lastSubtreeItem = self:GetSubtreeLastItem( openItem )
	if not lastSubtreeItem then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:AdjustItemsList()[ERROR]: cannot find last subtree item" )
		return
	end

	local lastSubtreeRecordIdx = self:GetRecordByItem( lastSubtreeItem )
	if lastSubtreeRecordIdx == -1 then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:AdjustItemsList()[ERROR]: cannot find record for last subtree item" )
		return
	end


	-- если элемент открытой папки видим и последний элемент поддерева не является последний видимым, то ничего дополнительно делать не надо	

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self.itemsListWnd:GetVisibleRange()
	if openItemRecordIdx >= firstVisibleRecordIdx and lastSubtreeRecordIdx < lastVisibleRecordIdx then
		return
	end


	local newFirstVisibleRecordIdx = -1

	-- не влазит сверху

	if openItemRecordIdx < firstVisibleRecordIdx then
		newFirstVisibleRecordIdx = openItemRecordIdx

	-- не влазит снизу
	else

		-- последним видимым делается последний элемент поддерева
    	
    	local newLastVisibleRecordIdx = lastSubtreeRecordIdx
    	if newLastVisibleRecordIdx > self.itemsListWnd:GetNumRecords() then
    		newLastVisibleRecordIdx = lastSubtreeRecordIdx
    	end

    	newFirstVisibleRecordIdx = newLastVisibleRecordIdx - self.itemsListWnd.MAX_SLOTS + 1
    	if newFirstVisibleRecordIdx < 1 then
    		newFirstVisibleRecordIdx = 1
    	end


    	-- если при этом перестал влезать сверху элемент открытой папки, то делаем его первым видимым,
    	-- а открытое поддерево покажется сколько получится

    	if openItemRecordIdx < newFirstVisibleRecordIdx then
    		newFirstVisibleRecordIdx = openItemRecordIdx
    	end

	end

	-- установка позиции
	self.itemsListWnd:SetScrollPos( newFirstVisibleRecordIdx, true, false )	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemVisScrollDelta( item )

	local recordIdx = self:GetRecordByItem( item )
	if recordIdx == -1 then
		return 0
	else
		return recordIdx - self.itemsListWnd:GetScrollPos()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SetItemVisScrollDelta( item, visScrollDelta )

	local recordIdx = self:GetRecordByItem( item )
	if recordIdx ~= -1 then
		self.itemsListWnd:SetScrollPos( recordIdx - visScrollDelta )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemsFiltered()

	if not self.selShipSlot then
		return {}
	end

	return self:GetRegularItems()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetRegularItems()

	if not self.selShipSlot then
		return {}
	end

	local bAmmo = self:IsShipSlotTypeAmmo( self.selShipSlot:GetShipSlotType() )

	local filterInfo = {}

	-- category
	-- категории убраны (#0030266, комм.(0099171))
	
	filterInfo.mainCategory	= ""
	filterInfo.subCategory	= ""

	-- other filters
	-- галки для фильтров были убраны, и сейчас это просто константы (#0029697, комм.(0098022))

	filterInfo.bHideShop			= false
	filterInfo.bHideOtherEquipped	= false		-- #0134923 - показываются установленные на других кораблях, но не показываются установленные в других слотах этого же корабля
	
	local curWeaponClass = self:GetCurWeaponClass()
	local curWeaponAmmoSubType = self:GetCurWeaponAmmoSubType()
	local selSlotId = self.selShipSlot:GetSlotId()

	-- список всех подходящих дефинишенов
	-- (дефинишены представлены shopItem-ами - предполагается, что любая вещь, которая может лежать в инвентаре или быть экипирована, есть в магазине)
	local allDefs = {}
	for defName, shopItem in pairs( UI.serverData.shopByDef ) do

		if self:TestItem( shopItem.defName, self.selShipSlot, filterInfo, curWeaponClass, curWeaponAmmoSubType ) then
			table.insert( allDefs, shopItem.defName )
		end

	end
	
	-- автоген
	for autogenItemIdx, autogenItem in pairs( UI.serverData.autogenInventory ) do
	
		if self:TestItem( autogenItem.defName, self.selShipSlot, filterInfo, curWeaponClass, curWeaponAmmoSubType ) then
			table.insert( allDefs, autogenItem.defName )
		end

	end

	-- при сортировке игнорируются категории, чтобы ни при каких обстоятельствах не оказалось, чтобы вещи с одинаковым item_subtype оказались не рядом
	UI:SortDefs( allDefs, self.sortMode == self.sortModes.DESC, true )



	-- список слотов (на один дефинишен может приходиться несколько слотов)
	local items				= {}

	local bGroupByRank		= self:NeedGroupByRank()
	local prevSubType		= bAmmo and "" or -1	-- для аммуниции вместо субтайпа используется деф - см.#0036878, комм.(0135117)
	local prevRank			= -1
	local prevSubTypeItem	= nil
	local prevSubItems		= {}
	local enchantedModes	= ( self.sortMode == self.sortModes.ASC ) and { false, true } or { true, false }

	local function fnCheckAddSubTypeItem( prevSubTypeItem )

		-- #0037258, комм.(0135978) - если в поддереве нет предмета, установленного в данный слот/на складе/можно купить,
		-- то данный сабтайп вообще не показывается

		local bHasGoodSubItem = false

		for subItemIdx, subItem in pairs( prevSubItems ) do

			-- установлен в текущий слот текущего корабля?
			if not bHasGoodSubItem then
				if self:IsItemCurrent( subItem ) then
					bHasGoodSubItem = true
				end
			end

			-- на складе?
			if not bHasGoodSubItem then
				if subItem.itemType == self.itemTypes.INVENTORY and not subItem.equipShipItem then
					bHasGoodSubItem = true
				end
			end

			-- в магазине?
			if not bHasGoodSubItem then
				if subItem.itemType == self.itemTypes.SHOP then
					bHasGoodSubItem = true
				end
			end

			if bHasGoodSubItem then
				break
			end

		end

		local bNeedShowSubType = bHasGoodSubItem or next( prevSubTypeItem.shopItems ) ~= nil 
		if bNeedShowSubType then

	    	table.insert( items, prevSubTypeItem )

			for subItemIdx = 1, #prevSubItems do
				table.insert( items, prevSubItems[ subItemIdx ] )
			end				

		end

	end


	-- #0046636 -  если есть продаваемый за деньги, то крафтовые не показываются 
	local function fnValidateShopItems( shopItems )

		local bHasItemThatCanBeBought	= false
		local craftableOnlyItems		= nil

		for itemIdx, item in pairs( shopItems ) do

			if not UI:CantItemBeBought( item ) then
				bHasItemThatCanBeBought = true

			else

				if not craftableOnlyItems then
					craftableOnlyItems = {}
				end

				table.insert( craftableOnlyItems, item )

			end

		end

		if bHasItemThatCanBeBought and craftableOnlyItems then

			for craftableItemIdx, craftableItem in pairs( craftableOnlyItems ) do

				for itemIdx, item in pairs( shopItems ) do

					if item == craftableItem then
						table.remove( shopItems, itemIdx )
						break
					end

				end

			end

		end

	end


	for idx, defName in ipairs( allDefs ) do
		
		local def = UI:GetDef( defName )

		-- для аммуниции вместо субтайпа используется деф - см.#0036878, комм.(0135117)
		local subType = nil

		if bAmmo then
			subType = defName
		else
			subType = def.item_subtype or -1
		end

		-- #0056479, комм.(0225187) - группировка по рангам, если включена данная логика (для аммуниции не надо, т.к. она не группируется, а показывается по дефам)
		local rank = -1
		if bGroupByRank and not bAmmo then
			rank = UI:GetItemEquipMinRank( defName )
		end

		local subTypeItem	= prevSubTypeItem
		local subItems		= prevSubItems

		if subType ~= prevSubType or rank ~= prevRank then

			subItems = {}

			subTypeItem =
			{
				itemType		= self.itemTypes.SUB_TYPE,
				subType			= subType,
				rank			= rank,
				bOpen			= false,
				shopItems		= {}
			}

			if prevSubTypeItem then
				fnCheckAddSubTypeItem( prevSubTypeItem )
			end

		end

		-- энчантед и не-энчантед трактуются как разные дефы, только энчантед не продаются в магазине

		for enchantedModeIdx = 1, #enchantedModes do

			local bEnchanted = enchantedModes[ enchantedModeIdx ]
			if bEnchanted then

        		if _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_MODULE then
        			self:MakeSubTreeItems( defName, true, filterInfo, subItems )
        		end

			else
        		self:MakeSubTreeItems( defName, false, filterInfo, subItems )
			end

		end          

		if self:CanShowShopSlotForItem( defName ) then
			local shopItem = UI.serverData.shopByDef[ defName ]
			table.insert( subTypeItem.shopItems, shopItem )
			fnValidateShopItems( subTypeItem.shopItems )
		end

		prevSubType		= subType
		prevRank		= rank
		prevSubTypeItem	= subTypeItem
		prevSubItems	= subItems

	end

	if prevSubTypeItem then
		fnCheckAddSubTypeItem( prevSubTypeItem )
	end

	self:MakeTreeItemsIndices( items )

	for itemIdx, item in pairs( items ) do
		if item.itemType == self.itemTypes.SUB_TYPE then
			self:InitSubTypeItem( item, items )
		end
	end

	return items

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:NeedGroupByRank()

	-- #0056479, (0225731) - от группировки по рангам отказались
	-- #0095786 (0451322),(0451640) - снова вернули
	return true

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CanShowShopSlotForItem( defName )

	if UI:IsDefAutogen( defName ) then
		return false
	end
	
	local itemBuyRank = UI:GetItemRequiredAccountRank( defName )
	if itemBuyRank ~= -1 then		

		local playerRank = UI:GetPlayerAccountRank()

		if playerRank < itemBuyRank then
			return false
		end

	end
	
	-- предмет можно:
	-- купить
	-- скрафтить
	-- "добыть"

	if UI:CantItemBeBoughtByDef( defName ) then
	
		local blueprintDefName = UI:GetBlueprintForItemCraft( defName, true )
		if blueprintDefName == "" then
		
			-- если нельзя купить или скрафтить, то предмет показывается с кнопкой "добыть"
			
			-- #0089469,комм.(0406379) - то, можно ли показать предмет с кнопкой "добыть", проверяется по наличию атлас id
			if UI:GetItemAtlasId( defName ) == -1 then
				return false
			end
			
		end
	
    	local upgradeLevel = UI:GetItemUpgradeLevel( defName )
    	if not( upgradeLevel == -1 or upgradeLevel == 1 ) then
    		return false
    	end
		
	end

	return true

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:InitSubTypeItem( subTypeItem, items )

	subTypeItem.numInvSubtreeItems	= 0
	subTypeItem.subItemToShow		= nil
	subTypeItem.bestSubtreeItem		= nil

	local curSubtreeItem			= nil
	local bestInvSubtreeItem		= nil
	local bestShopItem				= nil
	local bestSubtreeItem			= nil

	local function l_IsItemBetter( item1, item2 )

		local bIsBetter = false

		if self.sortMode == self.sortModes.DESC then
			bIsBetter = item1.treeIdx < item2.treeIdx
		else
			bIsBetter = item1.treeIdx > item2.treeIdx
		end

		return bIsBetter

	end


	local subtreeItems = self:GetSubtreeItems( subTypeItem, items )
	for idx, subtreeItem in pairs( subtreeItems ) do

		if subtreeItem.itemType == self.itemTypes.INVENTORY then

			subTypeItem.numInvSubtreeItems = subTypeItem.numInvSubtreeItems + subtreeItem.countInInventory

			if subtreeItem.equipShipItem then

				if not curSubtreeItem then
	    			if self:IsItemCurrent( subtreeItem ) then
						curSubtreeItem = subtreeItem
					end
    			end

			else

				if not bestInvSubtreeItem then
				    bestInvSubtreeItem = subtreeItem

				else
					if l_IsItemBetter( subtreeItem, bestInvSubtreeItem ) then
					    bestInvSubtreeItem = subtreeItem
					end
				end

			end

		elseif subtreeItem.itemType == self.itemTypes.SHOP then

			if not bestShopItem then
			    bestShopItem = subtreeItem

			else
				if l_IsItemBetter( subtreeItem, bestShopItem ) then
				    bestShopItem = subtreeItem
				end
			end

		end

		-- #0036878, комм.(0134923) - при определении лучшей вещи в списке второго уровня вещи, установленные на других кораблях, не учитываются
		if not( subtreeItem.equipShipItem and subtreeItem.equipShipItem ~= self.selShipItem ) then

    		if not bestSubtreeItem then
    			bestSubtreeItem = subtreeItem

    		else
    			if l_IsItemBetter( subtreeItem, bestSubtreeItem ) then
    			    bestSubtreeItem = subtreeItem
    			end
    		end

		end

	end

	if curSubtreeItem then
		subTypeItem.subItemToShow = curSubtreeItem

	elseif bestInvSubtreeItem then
		subTypeItem.subItemToShow = bestInvSubtreeItem

	elseif bestShopItem then
		subTypeItem.subItemToShow = bestShopItem

	else

		-- магазин может не показываться в поддереве, поэтому магазинный итем создается здесь
		if subTypeItem.shopItems then

			local shopItem = nil

			if self.sortMode == self.sortModes.DESC then
				shopItem = subTypeItem.shopItems[ 1 ]
			else
				shopItem = subTypeItem.shopItems[ #subTypeItem.shopItems ]
			end

			if shopItem then

    			local item = {}

    			item.itemType		= self.itemTypes.SHOP
    			item.defName		= shopItem.defName
    			item.shopItem		= shopItem
    			item.equipShipItem	= nil
    			item.slotId			= -1
    			item.count			= -1
				item.maxCount		= -1
				item.inventoryItems	= {}

				subTypeItem.subItemToShow = item

			end

		end

	end

	if not subTypeItem.subItemToShow then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateItemsListFromTree()[ERROR]: cannot find subtree item to show on the folder level for subtype %s rank %s on ship %s", tostring( subTypeItem.subType ), tostring( subTypeItem.rank ), self.selShipItem.defName )
	end	

	if not bestSubtreeItem then
		bestSubtreeItem = subTypeItem.subItemToShow
	end

	subTypeItem.bestSubtreeItem = bestSubtreeItem

end


-- энчантед и не-энчантед трактуются как разные дефы, только энчантед не продаются в магазине
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MakeSubTreeItems( defName, bEnchanted, filterInfo, items )

	
	local selSlotId = self.selShipSlot:GetSlotId()

	local bShowAllOfDef = true

	-- установлен в выделенный слот корабля -> в списке для данного дефа возможно будет только этот слот;

	local curItem = nil

	if self.selShipSlot:GetDefName() == defName then

		-- расстрелянная аммуниция не показывается как установленная
		if not( _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_ROCKET and self.selShipSlot:GetCount() == 0 ) then

			local bEquippedItemEnchanted = false

			if _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_MODULE then
				local equippedItemId = self.selShipSlot:GetItemId()
				bEquippedItemEnchanted = UI:IsInventoryItemEnchantedById( equippedItemId )				
			end

			if bEquippedItemEnchanted == bEnchanted then

    			local item = {}

    			item.itemType			= self.itemTypes.INVENTORY			
    			item.defName			= defName
    			item.shopItem			= nil
    			item.equipShipItem		= self.selShipItem
    			item.slotId				= selSlotId
    			item.count				= 1
    			item.maxCount			= 1
				item.countInInventory	= self:GetNumItemsInInventory( defName, bEnchanted )

    			if _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_MODULE then
					local inventoryIem = UI:GetInventoryItemEx( self.selShipSlot:GetItemId() )
    				item.inventoryItems	= { inventoryIem }
    			else
    				item.inventoryItems	= {}
    			end

    			table.insert( items, item )

				curItem = item

--    			bShowAllOfDef = false	-- #0036878 - сейчас если есть установленный в данный слот предмет, то другие тоже показываются

			end

		end

	end

	-- for test
	if _EQ_ALL then
		bShowAllOfDef = true
	end


	-- НЕ установлен в выделенный слот корабля; либо установлен, но количество не максимальное -> в списке для данного дефа будет несколько слотов (установленные, на складе/в магазине)
	if bShowAllOfDef then

		local inStoreItems	= {}		-- НЕ экипированные вещи
		local equipItems	= {}		-- экипированные вещи

		-- все, что у нас есть в инвентаре с данным дефом (сюда входят установленные модули, но НЕ входит установленная аммуниция)
		local inventoryItemsByDef = UI.serverData.inventoryByDef[ defName ]
		if inventoryItemsByDef then

			for idx = 1, #inventoryItemsByDef do

				local inventoryItem = inventoryItemsByDef[ idx ]

				local bInventoryItemEnchanted = UI:IsInventoryItemEnchanted( inventoryItem )
				if bInventoryItemEnchanted == bEnchanted then

    				-- находится корабль, на который модуль установлен
    				local equipShipItem = UI:GetEquippedShipItem( inventoryItem.iid )

    				-- вещь установлена на корабль
    				if equipShipItem then

                		-- проверка фильтра, надо ли показывать вещи, установленные на других кораблях
						-- (#0036878 - флаг bHideOtherEquipped=false сейчас означает, что показываются утсановленные на других кораблях вещи,
						-- но не показываются вещи, установленные на том же корабле в другом слоте)

						if not filterInfo.bHideOtherEquipped and equipShipItem ~= self.selShipItem then

        					-- из установленного в инвентаре могут быть только модули, установленные ракеты в инвентаре не лежат
        					if _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_MODULE then

            					-- находится слот, в который модуль установлен
    							local equipSlotId = -1	
        						for slotId, iid in pairs( equipShipItem.equipModules ) do
        							if iid == inventoryItem.iid then
    									equipSlotId = slotId
    									break
    								end
    							end					

                    			local item = {}

                    			item.itemType			= self.itemTypes.INVENTORY			
                    			item.defName			= defName
                    			item.shopItem			= nil
                    			item.equipShipItem		= equipShipItem
                    			item.slotId				= equipSlotId
                    			item.count				= 1
								item.maxCount			= -1
								item.inventoryItems		= { inventoryItem }
								item.countInInventory	= self:GetNumItemsInInventory( defName, bEnchanted )

                    			table.insert( equipItems, item )

        					else
        						sys.log( "UI.EquipmentWnd:MakeSubTreeItems()[ERROR]: equipped item in inventory is not IT_MODULE" )
        					end
						end
    					
    				-- вещь не установлена на корабль, т.е. "на складе"
    				else

						local bCanShow = true
						
						 -- итемы для аммуниции раньше могли лежать в инвентаре и с количеством 0, поэтому на всякий случай проверка
						if bCanShow then
							if inventoryItem.amount <= 0 then
								sys.log( "UI.EquipmentWnd:MakeSubTreeItems()[ERROR]: item \"%s\" in inventory with 0 amount", defName )
								bCanShow = false
							end
						end
						
						-- #0098460 - предметы, которые выставлены на продажу между игроками, не должны показываться больше нигде
						if bCanShow then
							local bAdverted = UI:IsItemAdverted( inventoryItem.iid )
							if bAdverted then
								bCanShow = false
							end
						end
						
						if bCanShow then

							local item = nil

							-- для модулей для каждого iid создается свой слот;
							-- для аммуниции, по идее, всегда существует только один iid, другие типы предметов в этом списке не присутствуют,
							-- но, на всякий случай, для них предусмотрен один сборный слот на все возможные iid

        					if _G.GetStoreItemTypeByDef( defName ) ~= _G.GameStore.ItemType.IT_MODULE then
								item = inStoreItems[ 1 ]
							end

    						if not item then

                    			item = {}

                    			item.itemType			= self.itemTypes.INVENTORY			
                    			item.defName			= defName
                    			item.shopItem			= nil
                    			item.equipShipItem		= nil
                    			item.slotId				= -1
                    			item.count				= 0
    							item.maxCount			= -1
    							item.inventoryItems		= {}
								item.countInInventory	= self:GetNumItemsInInventory( defName, bEnchanted )

    						end

    						item.count = item.count + inventoryItem.amount
    						table.insert( item.inventoryItems, inventoryItem )							

							table.insert( inStoreItems, item )

    					end

    				end	

				end				

			end				

		end


		-- экипированные ракеты не лежат в инвентаре, поэтому они собираются по кораблям	
		if _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_ROCKET and not bEnchanted then

    		-- проверка фильтра, надо ли показывать вещи, установленные на других кораблях
			-- (#0036878 - флаг bHideOtherEquipped=false сейчас означает, что показываются утсановленные на других кораблях вещи,
			-- но не показываются вещи, установленные на том же корабле в другом слоте)

			if not filterInfo.bHideOtherEquipped then

				for idx = 1, #UI.serverData.ships do

					local shipItem = UI.serverData.ships[ idx ]
					if shipItem ~= self.selShipItem then

    					for slotId, ammoInfo in pairs( shipItem.equipAmmo ) do

    						-- аммуниция может быть "расстреляна" - количество 0; ее необходимо игнорировать
    						if ammoInfo.def == defName and ammoInfo.amount > 0 then

                    			local item = {}

                    			item.itemType			= self.itemTypes.INVENTORY			
                    			item.defName			= defName
                    			item.shopItem			= nil
                    			item.equipShipItem		= shipItem
                    			item.slotId				= slotId
                    			item.count				= ammoInfo.amount
    							item.maxCount			= -1
    							item.inventoryItems		= {}
								item.countInInventory	= self:GetNumItemsInInventory( defName, bEnchanted )

                    			table.insert( equipItems, item )

    						end

    					end
					end
				end
			end
		end
		
		
		-- автоген с данным дефом в инвентаре или установленный
		local autogenItem = not bEnchanted and UI.serverData.autogenInventoryByDef[ defName ]
		if autogenItem then

			-- находится корабль, на который модуль установлен
			local equipShipItem = UI:GetEquippedShipItem( autogenItem.iid )

			-- вещь установлена на корабль
			if equipShipItem then

				-- проверка фильтра, надо ли показывать вещи, установленные на других кораблях
				-- (#0036878 - флаг bHideOtherEquipped=false сейчас означает, что показываются утсановленные на других кораблях вещи,
				-- но не показываются вещи, установленные на том же корабле в другом слоте)

				if not filterInfo.bHideOtherEquipped and equipShipItem ~= self.selShipItem then

					-- из установленного в инвентаре могут быть только модули, установленные ракеты в инвентаре не лежат
					if _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_MODULE then

						-- находится слот, в который модуль установлен
						local equipSlotId = -1	
						for slotId, iid in pairs( equipShipItem.equipModules ) do
							if iid == autogenItem.iid then
								equipSlotId = slotId
								break
							end
						end					

						local item = {}

						item.itemType			= self.itemTypes.INVENTORY			
						item.defName			= defName
						item.shopItem			= nil
						item.equipShipItem		= equipShipItem
						item.slotId				= equipSlotId
						item.count				= 1
						item.maxCount			= -1
						item.inventoryItems		= { autogenItem }
						item.countInInventory	= self:GetNumItemsInInventory( defName, bEnchanted )

						table.insert( equipItems, item )

					else
						sys.log( "UI.EquipmentWnd:MakeSubTreeItems()[ERROR]: equipped item in inventory is not IT_MODULE" )
					end
					
				end
				
			-- вещь не установлена на корабль, т.е. "на складе"
			else

				local item = {}

				item.itemType			= self.itemTypes.INVENTORY
				item.defName			= defName
				item.shopItem			= nil
				item.equipShipItem		= nil
				item.slotId				= -1
				item.count				= 1
				item.maxCount			= -1
				item.inventoryItems		= { autogenItem }
				item.countInInventory	= self:GetNumItemsInInventory( defName, bEnchanted )

				table.insert( inStoreItems, item )

			end

		end

		-- сортировка

		-- вещи на складе (отсортированы по iid)

		if next( inStoreItems ) then

        	if _G.GetStoreItemTypeByDef( defName ) == _G.GameStore.ItemType.IT_MODULE then

    			local function fnSort( item1, item2 )

					local inventoryItem1 = item1.inventoryItems[ 1 ]
					local inventoryItem2 = item2.inventoryItems[ 1 ]
  				
    				return inventoryItem1.iid < inventoryItem1.iid

    			end

    			table.sort( inStoreItems, fnSort )

			end

			for inStoreIdx, item in ipairs( inStoreItems ) do
				table.insert( items, item )
			end

		end

		-- если нет вещей на складе и данная вещь не является установленной в текущий слот, то первым показывается слот из магазина (если вещь в принципе покупаемая)

		if not next( inStoreItems ) and not bEnchanted and not filterInfo.bHideShop and not curItem then 

			if self:CanShowShopSlotForItem( defName ) then

    			local item = {}

    			item.itemType		= self.itemTypes.SHOP
    			item.defName		= defName
    			item.shopItem		= UI.serverData.shopByDef[ defName ]
    			item.equipShipItem	= nil
    			item.slotId			= -1
    			item.count			= -1
				item.maxCount		= -1
				item.inventoryItems	= {}
				item.countInInventory	= self:GetNumItemsInInventory( defName, bEnchanted )

                table.insert( items, item )

			end
		end

		-- далее показываются установленные вещи (отсортированные по кораблям, а корабли отсортированы по локализованному имени)
		if next( equipItems ) then

            local function SortEquipItemsPredicat( item1, item2 )

            	-- вначале - вещи, экипированные на данный корабль
            	if item1.equipShipItem == self.selShipItem and item2.equipShipItem ~= self.selShipItem then
            		return true

            	elseif item1.equipShipItem ~= self.selShipItem and item2.equipShipItem == self.selShipItem then
            		return false

            	-- далее сортировка по локализованному имени (не чувствительно к регистру)
            	else
            		return item1.equipShipItem.localizedName_lower < item2.equipShipItem.localizedName_lower		
            	end

            end

			table.sort( equipItems, SortEquipItemsPredicat )

			for idx = 1, #equipItems do
                table.insert( items, equipItems[ idx ] )
			end
		end

	end

end

-- количество неустановленных на корабли вещей данного дефа
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetNumItemsInInventory( defName, bEnchanted )

	local selSlotId = self.selShipSlot and self.selShipSlot:GetSlotId() or -1
    local count = 0
	
	if UI:IsDefAutogen( defName ) then
	
		local inventoryItem = UI:GetAutogenInventoryItemByDef( defName )
		if inventoryItem and not UI:GetEquippedShipItem( inventoryItem.iid ) then
			count = 1
		end
	
	else

		local inventoryItemsByDef = UI.serverData.inventoryByDef[ defName ]
		if inventoryItemsByDef then

			for idx, inventoryItem in pairs( inventoryItemsByDef ) do

				if UI:IsInventoryItemEnchanted( inventoryItem ) == bEnchanted then

					local equipShipItem = UI:GetEquippedShipItem( inventoryItem.iid )
					if not equipShipItem then
					
						-- #0098460 - предметы, которые выставлены на продажу между игроками, не должны показываться больше нигде
						local bAdverted = UI:IsItemAdverted( inventoryItem.iid )
						if not bAdverted then
							count = count + inventoryItem.amount
						end
						
					end

				end

			end

		end
		
	end

	return count

end   


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:TestItem( defName, shipSlot, filterInfo, curWeaponClass, curWeaponAmmoSubType )

	-- не предназначен для экипировки
	if UI:CantItemBeEquippedByDef( defName ) then
		return false		
	end

	local itemType = self:IsShipSlotTypeAmmo( shipSlot:GetShipSlotType() ) and _G.GameStore.ItemType.IT_ROCKET or _G.GameStore.ItemType.IT_MODULE

	-- подходит тип товара (модуль/аммуниция)?
	if _G.GetStoreItemTypeByDef( defName ) ~= itemType then
		return false
	end

    local def = UI:GetDef( defName )
    if not def then
    	return false
    end

	-- если прописан единственный подходящий корабль, то проверка на него
	if not UI:IsItemFitForShipByRequiredShip( defName, self.selShipItem.defName ) then
		return false
	end

	-- подходит класс корабля?
	if not UI:IsItemFitForShipByClass( defName, self.selShipItem.defName ) then
		return false
	end

	-- подходит тир?
	if not UI:IsItemFitForShipByTierAndRank( defName, self.selShipItem.defName ) then
		return false
	end

	-- подходит раса?
	if not UI:IsItemFitForShipByRace( defName, self.selShipItem.defName ) then
		return false
	end

	-- подходит роль?
	if not UI:IsItemFitForShipByRole( defName, self.selShipItem.defName ) then
		return false
	end

	-- подходит слот?
	if itemType == _G.GameStore.ItemType.IT_ROCKET then

		local shopAmmoType = def.MunitionBayType or -1
		local shipSlotAmmoType = shipSlot:GetSlotId()

		if shopAmmoType ~= shipSlotAmmoType then
			return false
		end

	elseif itemType == _G.GameStore.ItemType.IT_MODULE then

		local shopItemModuleType = def.module_type or -1
		local shipSlotModuleId = shipSlot:GetSlotId()

		if ai.ModuleTypeOf[ shipSlotModuleId ] ~= shopItemModuleType then
    		return false
		end

	end

	-- для аммуниции основного оружия - проверка, подходит ли эта аммуниция к установленному на данный момент оружию
	if itemType == _G.GameStore.ItemType.IT_ROCKET and def.MunitionBayType == ai.MunitionBayType.MBT_PRIMARY then

		if def.weapon_class ~= curWeaponClass then
    		return false
		end

		-- елси 0 - значит этот параметр для данного оружия не используется
		if curWeaponAmmoSubType ~= 0 then
    		if def.item_subtype ~= curWeaponAmmoSubType then
        		return false
    		end
		end
		
	end

	-- подходит категория?
	if filterInfo.mainCategory ~= "" or filterInfo.subCategory ~= "" then
    	if not self:IsItemFitForCategory( defName, filterInfo.mainCategory, filterInfo.subCategory ) then
    		return false
    	end
	end

    local selSlotId = self.selShipSlot:GetSlotId()
    if ( selSlotId >= ai.SpaceShipModuleSlot.ACTIVE_01 and selSlotId <= ai.SpaceShipModuleSlot.CPU_MOD_03 and UI:IsItemUniqueEquip( defName ) ) then
		if UI:HasShipEquippedModuleOfSubType( self.selShipItem.vid, UI:GetItemSubType( defName ), selSlotId ) then
			return false
		end
	end

	-- для активных слотов один сабтайп может выставляться только в один слот
	if not self:IsItemSubTypeAvailable( UI:GetItemSubType( defName ) ) then
    	return false
	end

	return true

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemFitForCategory( defName, mainCategory, subCategory )

    local def = UI:GetDef( defName )
    if not def then
    	return false
    end

	if def.shopCategory ~= mainCategory then
		return false
	end
	
	if subCategory ~= "" and def.shopSubCategory ~= subCategory then
		return false
	end

	return true

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgTimeOut then
		self.hMsgTimeOut = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgRemoveItemFromOtherShip then
		self.hMsgRemoveItemFromOtherShip = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			if ( self.itemForQuickEquip and self.popMenuDataToEquip ) or ( not self.itemForQuickEquip and not self.popMenuDataToEquip ) then
				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventMsgBoxRet()[ERROR]: invalid data to equip" )

			else

    			if self.itemForQuickEquip then			
    				self:DoQuickEquip()

    			elseif self.popMenuDataToEquip then
					self:DoQuickEquipFromPopUp( self.popMenuDataToEquip )
					self.popMenuDataToEquip = nil
				end

    			UI:PlayGlobalSound( self.sounds.equip )

			end

		else
			self:ResetDD()
		end

	elseif boxHandle == self.hMsgUneqipAmmo then
		self.hMsgUneqipAmmo = UI.INVALID_UI_HANDLE
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowMessageOnTimeOut()

	if self.hMsgTimeOut ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgTimeOut = UI:ShowMessageOnTimeOut()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemAvailable( item )

	local bAvailable = true

	if item.itemType == self.itemTypes.INVENTORY then
    	bAvailable = not self:IsItemInBattle( item ) and not self:IsItemOnShipQuest( item )

	elseif item.itemType == self.itemTypes.SUB_TYPE then
		bAvailable = self:IsItemSubTypeAvailable( item.subType )
	end

	return bAvailable

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemSubTypeAvailable( subType )

	if self.selShipItem and self.selShipSlot and not self:IsShipSlotTypeAmmo( self.selShipSlot:GetShipSlotType() ) then

    	local selSlotId = self.selShipSlot:GetSlotId()
    	if ( selSlotId >= ai.SpaceShipModuleSlot.ACTIVE_01 and selSlotId <= ai.SpaceShipModuleSlot.ACTIVE_04 ) then

			if UI:HasShipEquippedModuleOfSubType( self.selShipItem.vid, subType, self.selShipSlot:GetSlotId() ) then
				return false
			end

    	end

	end

	return true

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:RecalcAbsVals()

	self.ddMouseThreshold_abs = UI:XToAbs( UI:XTo1024x768( self.DD_MOUSE_THRESHOLD, { x = 1280, y = 720 } ) )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ResetDD()

	if self.ddInfo.ddState == self.ddStates.NONE then
		return
	end

	self.ddInfo.ddState		= self.ddStates.NONE
	self.ddInfo.shipSlot	= nil
	self.ddInfo.mouseX_abs	= 0
	self.ddInfo.mouseY_abs	= 0

	self.ddAcceptShipSlot = nil

	-- убирается подсветка слотов корабля
	for slotIdx, slotWnd in pairs( self.shipSlots ) do
		slotWnd:OnDDStop()
	end

	-- скрывается drag-and-drop иконка
	self.ddIco:Reset()
	self.ddIco:UnlinkFromParent()

	-- отаускается мышь
	self:ReleaseMouse()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SetDDState_DRAG()

	if self.ddInfo.ddState ~= self.ddStates.WAIT_MOUSE then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SetDDState_DRAG()[ERROR]: invalid states sequence" )
		return
	end

	self.ddInfo.ddState	= self.ddStates.DRAG

	-- показывается drag-and-drop иконка
	UI.Root:AddChild( self.ddIco )	-- линкуется к руту, т.к. д.б. поверх остальных чайлдов ангара, а не только эквипмента

	self.ddIco:SetupForShipSlot( self.ddInfo.shipSlot )

	self.ddIco:UpdatePos( UI:GetMouseX(), UI:GetMouseY() )


	-- подсветка подходящих слотов корабля
	for slotIdx, slotWnd in pairs( self.shipSlots ) do
		
		slotWnd:OnDDStart()

		if self:IsShipSlotDDFit( slotWnd ) then
			slotWnd:SetDDFit( true )
		end

	end	

	-- скрывается список предметов
	self:SelectShipSlot( nil )

	if self.sounds.ddStart and self.sounds.ddStart ~= "" then
		UI:PlayGlobalSound( self.sounds.ddStart )
	end

end 


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SetDDState_WAIT_MOUSE( shipSlot, mouseX, mouseY )

	if self.ddInfo.ddState ~= self.ddStates.NONE then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:SetDDState_WAIT_MOUSE()[ERROR]: invalid states sequence" )
		return
	end

	UI:ResetTooltip()

	self.ddInfo.ddState		= self.ddStates.WAIT_MOUSE
	self.ddInfo.mouseX_abs	= UI:XToAbs( mouseX )
	self.ddInfo.mouseY_abs	= UI:YToAbs( mouseY )
	self.ddInfo.shipSlot	= shipSlot

	self:CaptureMouse()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsShipSlotDDFit( slotWnd )

	if self.ddInfo.ddState == self.ddStates.NONE then
		return false
	end

	local ddDefName = self.ddInfo.shipSlot:GetDefName()
	return slotWnd ~= self.ddInfo.shipSlot and self:IsShipSlotFitForItem( ddDefName, slotWnd )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsShipSlotFitForItem( srcItemDefName, dstSlotWnd )

	if not dstSlotWnd:IsActive() then
		return false
	end

	local srcDef = UI:GetDef( srcItemDefName )
	if not srcDef then
		return false
	end

	local srcIsAmmo = UI:IsDefAmmo( srcItemDefName )

	if srcIsAmmo then
		return false

	else

		if self:IsShipSlotTypeAmmo( dstSlotWnd:GetShipSlotType() ) then
			return false

		else
    		local srcModuleType = srcDef.module_type or -1
			local dstSlotModuleId = dstSlotWnd:GetSlotId()

    		return ai.ModuleTypeOf[ dstSlotModuleId ] == srcModuleType
		end

	end

end



--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CaptureMouse()

	self:RemoveStyle( UI.WS_NOT_MOUSE_REACT )
	UI:CaptureMouse( self:GetUiHandle() )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ReleaseMouse()

	if UI:GetMouseCapture() == self:GetUiHandle() then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end

	self:AddStyle( UI.WS_NOT_MOUSE_REACT )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateAcceptSlot( mouseX, mouseY )

	local acceptSlotWnd = nil

	local slotWnd = self:GetShipSlotUnderMouse( mouseX, mouseY )
	if slotWnd and slotWnd:IsDDFit() then
		acceptSlotWnd = slotWnd
	end

	self:SetAcceptShipSlot( acceptSlotWnd )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SetAcceptShipSlot( slotWnd )

	if slotWnd == self.ddAcceptShipSlot then
		return
	end

	local oldAcceptSlot = self.ddAcceptShipSlot
	self.ddAcceptShipSlot = slotWnd

	if oldAcceptSlot then
		oldAcceptSlot:SetDDAccept( false )
	end

	if self.ddAcceptShipSlot then
		self.ddAcceptShipSlot:SetDDAccept( true )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetShipSlotUnderMouse( mouseX, mouseY )

	for slotIdx, slotWnd in pairs( self.shipSlots ) do
		if slotWnd:IsVisible() and UI:IsPtInRect( slotWnd:GetRect(), mouseX, mouseY ) then
			return slotWnd
		end
	end

	return nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:TryEquipDDItem()

    self:EquipSlot2Slot( self.ddInfo.shipSlot, self.ddAcceptShipSlot )

    self:ResetDD()		

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:TryUnequipDDItem()

	local isAmmo = self:IsShipSlotTypeAmmo( self.ddInfo.shipSlot:GetShipSlotType() )

	if isAmmo then
		self:UnequipAmmoInternal( self.selShipItem.vid, self.ddInfo.shipSlot:GetSlotId() )
	else
		self:UnequipModuleInternal( self.selShipItem.vid, self.ddInfo.shipSlot:GetSlotId() )
	end

	self:ResetDD() 

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UnequipModuleInternal( vid, slotId )

	local requestId, bForbidden = UI:SafeChangeEquipment( vid, slotId, UI.INVALID_U64_ID )

	if requestId ~= 0 then

		UI:AddWaitingRequest( requestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID ) -- ждем апдейта инвентаря, который будет вызван из кода cpp

    	if slotId == ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 then
    		self:CheckShowMsgOnUnequipPrimaryAmmo( UI:GetShipItem( vid ), ai.WeaponClass.UNKNOWN )
    	end

	elseif not bForbidden then
		UI:ShowMessageOnEquipError( _G.GameStore.ModuleEquipResult.MER_ERROR )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UnequipAmmoInternal( vid, slotId )

	local requestId, bForbidden = UI:SafeChangeMunition( vid, slotId, _G.GameStore.CreditsType.CT_INVALID, "" )

	if requestId ~= 0 then
		UI:AddWaitingRequest( requestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID ) -- ждем апдейта инвентаря, который будет вызван из кода cpp
	elseif not bForbidden then
		UI:ShowMessageOnChangeMunitionError( _G.GameStore.MunitionResult.MR_ERROR )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:TryQuickEquip( item )

	if not self.selShipSlot then
		UI:PlayGlobalSound( self.sounds.cannotEquip )
		return
	end

	if not self:IsItemAvailable( item ) then
		UI:PlayGlobalSound( self.sounds.cannotEquip )
		return
	end

	local bBuy = item.itemType == self.itemTypes.SHOP or ( item.itemType == self.itemTypes.INVENTORY and item.count < item.maxCount )

	-- уже экипировано в выделенный слот?
	if not bBuy and item.equipShipItem == self.selShipItem and item.slotId == self.selShipSlot:GetSlotId() then
		UI:PlayGlobalSound( self.sounds.cannotEquip )
		return
	end

	if bBuy then

		self:TryBuy( self.selShipItem, item.shopItem, self.selShipSlot:GetSlotId() )

	else

		self.itemForQuickEquip = item
	
    	if item.equipShipItem and item.equipShipItem ~= self.selShipItem then
    		self:ShowRequestTranspherFromOtherShipMsg( item.defName, item.equipShipItem.defName )
    	else
    		self:DoQuickEquip()
			UI:PlayGlobalSound( self.sounds.equip )
		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:TryBuy( equipShipItem, shopItem, slotId )

    self.buyInfo =
    {
		shopItem	= shopItem,
    	shipItem	= equipShipItem,
    	slotId		= slotId,
    	boughtIid	= UI.INVALID_U64_ID,
    }		

	if UI:IsEnoughPlaceInInventoryForItem( shopItem.defName ) then
		self:LaunchTradeWnd( shopItem, false )
	else
		if UI:CanIncreaseInventory() then
			self:LaunchBuyWnd( self.buyWnd.modes.INVENTORY_AUTO )
		else
			UI:MessageBox( UI:GetStringByName( "buyInventory_caption_AUTO" ), UI:GetStringByName( "msg_cannotIncreaseInventory_AUTO" ), UI.MBS_OK )
		end
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:DoQuickEquip()

	if not self.itemForQuickEquip then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:DoQuickEquip()[ERROR]: no item" )
		return
	end

	local item = self.itemForQuickEquip
	self.itemForQuickEquip = nil

	if not self.selShipSlot then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:DoQuickEquip()[ERROR]: no sel slot" )
		return
	end

	self:EquipItem2Slot( item, self.selShipSlot )

	if self:GetOpenItemsSubType() ~= -1 then
		self:OpenItemsSubType( -1, -1, true )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:DoQuickEquipFromPopUp( data )

	local bAmmo = UI:IsDefAmmo( data.defName )
	if bAmmo then
		self:EquipAmmoInternal( data.defName, data.dstVid, data.dstSlotId, data.srcVid, data.srcSlotId )
	else
		self:EquipModuleInternal( data.dstVid, data.dstSlotId, data.iid )
	end

	if self:GetOpenItemsSubType() ~= -1 then
		self:OpenItemsSubType( -1, -1, true )
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipItem2Slot( srcItem, dstShipSlot )

	if _G.GetStoreItemTypeByDef( srcItem.defName ) == _G.GameStore.ItemType.IT_ROCKET then
		self:EquipAmmoItem2Slot( srcItem, dstShipSlot )
	else
		self:EquipModuleItem2Slot( srcItem, dstShipSlot )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipSlot2Slot( srcShipSlot, dstShipSlot )

	if self:IsShipSlotTypeAmmo( srcShipSlot:GetShipSlotType() ) then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipSlot2Slot()[ERROR]: cannot equip ammo slot from slot" )
	else
		self:EquipModuleSlot2Slot( srcShipSlot, dstShipSlot )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipAmmoItem2Slot( srcItem, dstShipSlot )

	if srcItem.defName == dstShipSlot:GetDefName() and dstShipSlot:GetCount() > 0 then
		return
	end

	self:EquipAmmoInternal( srcItem.defName, self.selShipItem.vid, dstShipSlot:GetSlotId(), srcItem.equipShipItem and srcItem.equipShipItem.vid or UI.INVALID_U64_ID, srcItem.equipShipItem and srcItem.slotId or -1 )

end 


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipAmmoInternal( defName, dstVid, dstSlotId, srcVid, srcSlotId )

	local bShowGoldAmmoWarning = false

	if UI:IsTrueEx( UI.serverData.userData.autoRefill ) then

    	local price, bGold = UI:GetShopBaseBuyPriceByDef( defName, false )
    	if bGold then
    		bShowGoldAmmoWarning = true
    	end

	end

	if srcVid ~= nil and srcVid ~= UI.INVALID_U64_ID then

		local requestId, bForbidden = UI:SafeTransferMunition( srcVid, dstVid, srcSlotId, dstSlotId )

		if requestId ~= 0 then
			UI:AddWaitingRequest( requestId )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )	-- ждем апдейта инвентаря, который будет вызван из кода cpp
		else
			if not bForbidden then
				UI:ShowMessageOnChangeMunitionError( _G.GameStore.MunitionResult.MR_ERROR )
			end
			bShowGoldAmmoWarning = false
		end

	else
    	
    	local priceType = UI:GetShopSmartBuyPriceOneByDef( defName )
		local requestId, bForbidden = UI:SafeChangeMunition( dstVid, dstSlotId, priceType, defName )

		if requestId ~= 0 then
			UI:AddWaitingRequest( requestId )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )	-- ждем апдейта инвентаря, который будет вызван из кода cpp
		else
			if not bForbidden then
				UI:ShowMessageOnChangeMunitionError( _G.GameStore.MunitionResult.MR_ERROR )
			end
			bShowGoldAmmoWarning = false
		end

	end	

	if bShowGoldAmmoWarning then
		UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "goldAmmoWarning" ), UI.MBS_OK )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipModuleItem2Slot( srcItem, dstShipSlot )

	local idx, inventoryItem = next( srcItem.inventoryItems )
	local iid = inventoryItem.iid

	self:EquipModuleInternal( self.selShipItem.vid, dstShipSlot:GetSlotId(), iid )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipModuleInternal( vid, slotId, iid )

	local oldEquipShip = UI:GetEquippedShipItem( iid )
	local bSuccess = false

	-- модуль не был экипирован
	if not oldEquipShip then

		local requestId, bForbidden = UI:SafeChangeEquipment( vid, slotId, iid )

		if requestId ~= 0 then
			UI:AddWaitingRequest( requestId )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )	-- ждем апдейта инвентаря, который будет вызван из кода cpp
			bSuccess = true
		elseif not bForbidden then
			UI:ShowMessageOnEquipError( _G.GameStore.ModuleEquipResult.MER_ERROR )
		end

	-- модуль был экипирован
	else
  		-- снятие тащимого модуля со старого корабля и установка на новый

		local oldSlotId = -1

		for slotId, moduleIid in pairs( oldEquipShip.equipModules ) do
			if moduleIid == iid then
				oldSlotId = slotId
				break
			end
		end

		local requestId, bForbidden = UI:SafeTransferEquipment( oldEquipShip.vid, vid, oldSlotId, slotId )

		if requestId ~= 0 then
			UI:AddWaitingRequest( requestId )
    	  	UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )	-- ждем апдейта инвентаря, который будет вызван из кода cpp
			bSuccess = true
		elseif not bForbidden then
			UI:ShowMessageOnEquipError( _G.GameStore.ModuleEquipResult.MER_ERROR )
		end	

	end

	if slotId == ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 and bSuccess then

		if oldEquipShip then
			self:CheckShowMsgOnUnequipPrimaryAmmo( oldEquipShip, ai.WeaponClass.UNKNOWN )
		end

		local invItem = UI:GetInventoryItemEx( iid )
		self:CheckShowMsgOnUnequipPrimaryAmmo( UI:GetShipItem( vid ), UI:GetWeaponClass( invItem.defName ) )

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipModuleSlot2Slot( srcShipSlot, dstShipSlot )

	self.equipTransferInfo = nil

	local requestId, bForbidden = UI:SafeTransferEquipment( self.selShipItem.vid, self.selShipItem.vid, srcShipSlot:GetSlotId(), dstShipSlot:GetSlotId() )
	if requestId ~= 0 then

		UI:AddWaitingRequest( requestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )	-- ждем апдейта инвентаря, который будет вызван из кода cpp

		self.equipTransferInfo = { slotType = dstShipSlot:GetShipSlotType(), slotId = dstShipSlot:GetSlotId() }

	elseif not bForbidden then
		UI:ShowMessageOnEquipError( _G.GameStore.ModuleEquipResult.MER_ERROR )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:EquipBoughtModule( buyInfo )

	local changeEquipmentRequestId, bForbidden = UI:SafeChangeEquipment( buyInfo.shipItem.vid, buyInfo.slotId, buyInfo.boughtIid )
	if changeEquipmentRequestId ~= 0 then

		UI:AddWaitingRequest( changeEquipmentRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID ) -- ждем апдейта инвентаря, который будет вызван из кода cpp

		if buyInfo.slotId == ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 then
			self:CheckShowMsgOnUnequipPrimaryAmmo( buyInfo.shipItem, UI:GetWeaponClass( self.buyInfo.shopItem.defName ) )
		end

		if self:GetOpenItemsSubType() ~= -1 then
			self:OpenItemsSubType( -1, -1, true )
		end
		
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CheckShowMsgOnUnequipPrimaryAmmo( shipItem, dstWeaponClass )

	local bHasPrimaryAmmo = false

	local primaryAmmoInfo = shipItem.equipAmmo[ ai.MunitionBayType.MBT_PRIMARY ]
	if primaryAmmoInfo and primaryAmmoInfo.def ~= "" and primaryAmmoInfo.amount > 0 then
		bHasPrimaryAmmo = true
	end

	if not bHasPrimaryAmmo then
		return
	end

	local ammoWeaponClass = UI:GetWeaponClass( primaryAmmoInfo.def )
	if ammoWeaponClass == dstWeaponClass then
		return
	end

   	if self.hMsgUneqipAmmo == UI.INVALID_UI_HANDLE then
   		self.hMsgUneqipAmmo = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_unfitModsDrop" ), UI.MBS_OK )
   	end

end       


-- TODO: найти замену - собственно invItems не используются
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventInvItemsChanged()

	if not self:IsOnScreen() then
		return
	end

	self:ResetDD()

	local bLockItemsUpdate_old = self.bLockItemsUpdate
	self.bLockItemsUpdate = true

	local slotToSelect = self.selShipSlot	
	self:UpdateShipSlots()
	
	if self.equipTransferInfo then
		local bAmmo = self:IsShipSlotTypeAmmo( self.equipTransferInfo.slotType )
		slotToSelect = bAmmo and self:GetShipSlotForAmmoId( self.equipTransferInfo.slotId ) or self:GetShipSlotForModuleId( self.equipTransferInfo.slotId )
		self.equipTransferInfo = nil
	end

	self:ValidateShipSlotSelection( slotToSelect )

	self.bLockItemsUpdate = bLockItemsUpdate_old
	self:UpdateItems( true )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowRequestTranspherFromOtherShipMsg( itemDefName, shipDefName )

	local strBaseColor = UI:Color2Str( UI.TEXT_BASE_COLOR )

	local shipName = UI:GetEntityLocalizedNameByDef( shipDefName, true )
	shipName = string.format( "\"%s\"%s", shipName, strBaseColor )

	local itemName = UI:GetEntityLocalizedNameByDef( itemDefName, true )
	itemName = string.format( "\"%s\"%s", itemName, strBaseColor )

	local tags =
	{
		ship	= shipName,
		item	= itemName,
	}

	local msg = UI:GetStringByName( "equip_msg_itemRemove" )
	msg = string.gsub( msg, "%$([%w_]+)%$", tags )			
	msg = string.format( "%s%s", strBaseColor, msg )

	self.hMsgRemoveItemFromOtherShip = UI:MessageBox( UI:GetStringByName( "equip_msgCapt_itemRemove" ), msg, UI.MBS_YES_NO )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsWaiting()

	return UI.ShipsTreeWnd:IsWaiting()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateWaitingEffect()

	UI.ShipsTreeWnd:UpdateWaitingEffect()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventStartWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventStopWaitingRequests()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateWaitingEffect()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:HandleTooltip( targetWnd, tooltipData )

	if self.ddInfo.ddState ~= self.ddStates.NONE then
		return true, UI.INVALID_UI_HANDLE
	end

	return false

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ValidateShipSlotSelection( oldSelShipSlot )

	if not self.selShipItem then
		self:SelectShipSlot( nil )
		return
	end

	local bInBattle = UI:IsShipInBattle( self.selShipItem ) or UI:IsShipOnShipQuest( self.selShipItem )
	if bInBattle then
		self:SelectShipSlot( nil )
		return
	end

	if oldSelShipSlot and oldSelShipSlot:IsActive() then
		self:SelectShipSlot( oldSelShipSlot )
		return
	end

	self:SetDefaultShipSlotSelection()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SetDefaultShipSlotSelection()

	self:SelectShipSlot( nil )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CanShipSlotBeSelected( slotWnd )

	if not slotWnd then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:CanShipSlotBeSelected()[ERROR]: nil param" )
		return true
	end

    if not slotWnd:IsActive() then
		return false
	end

	local bInBattle = self.selShipItem and ( UI:IsShipInBattle( self.selShipItem ) or UI:IsShipOnShipQuest( self.selShipItem ) )
	if bInBattle then
		return false
	end

	if self:IsWaiting() then
		return false
	end

	if slotWnd:GetShipSlotType() == UI.shipSlotTypes.SPECIAL then
		if not UI:IsSpecModuleCustomizableOnShip( self.selShipItem.defName ) then
			return false
		end
	end

	return true

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SelectShipSlot( shipSlot )

	if self.selShipSlot == shipSlot then
		return
	end

	local oldSelShipSlot = self.selShipSlot
	self.selShipSlot = shipSlot

	if oldSelShipSlot then
		oldSelShipSlot:Select( false )
	end

	if self.selShipSlot then
		self.selShipSlot:Select( true )
	end	

	self:OnShipSlotSelectionChanged()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnShipSlotSelectionChanged()

	self:UpdateItemsPanelVisibility()

	if self:IsItemsPanelVisible() then

		self:UpdateItems( false )
		
	end

	if self.itemsListWnd:IsOnScreen() and self.selShipSlot and UI:GetCurTooltipTarget() == self.selShipSlot then
		UI:ResetTooltip()
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ResetBuyInfo()

    self.buyInfo =
    {
    	shopItem	= nil,
    	shipItem	= nil,
    	slotId		= -1,
    	boughtIid	= UI.INVALID_U64_ID,
    }

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemCurrent( item )

	local bCurrent = false

	if item.itemType == self.itemTypes.SUB_TYPE then

		local subtreeItems = self:GetSubtreeItems( item )
		for idx, subtreeItem in pairs( subtreeItems ) do
			if self:IsItemCurrent( subtreeItem ) then
				bCurrent = true
				break
			end
		end

	elseif item.itemType == self.itemTypes.INVENTORY then

    	bCurrent =
    		self.selShipItem
    		and self.selShipSlot
    		and item.equipShipItem == self.selShipItem
    		and item.slotId == self.selShipSlot:GetSlotId()

	end

	return bCurrent

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateItemsCaption()

	local text = ""

	local openSubType = self:GetOpenItemsSubType()
	if openSubType ~= -1 then

		if type( openSubType ) == "string" then
			text = UI:GetEntityLocalizedNameByDef( openSubType, true, false, true )
		else
			text = UI:ItemSubType2Str2( openSubType )
		end

	else
    	if self.selShipSlot then

    		local shipSlotType = self.selShipSlot:GetShipSlotType()

    		local shipSlotTypeName = UI:Val2Key( UI.shipSlotTypes, shipSlotType )
    		text = UI:GetStringByName( string.format( "equipSlot_%s_tipCaption", shipSlotTypeName ) )

    	end
	end	

	self.itemsListWnd:SetCaption( text )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetCurWeaponClass()

	local curWeaponClass = ai.WeaponClass.UNKNOWN

	local slotWnd = self:GetShipSlotForModuleId( ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
	if slotWnd and slotWnd:IsActive() then

		local defName = slotWnd:GetDefName()
		if defName ~= "" then
		   	curWeaponClass = UI:GetWeaponClass( defName )
		end

	end

	return curWeaponClass

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetCurWeaponAmmoSubType()

	local curWeaponAmmoSubType = -1

	local slotWnd = self:GetShipSlotForModuleId( ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
	if slotWnd and slotWnd:IsActive() then

		local defName = slotWnd:GetDefName()
		if defName ~= "" then
		   	curWeaponAmmoSubType = UI:GetWeaponAmmoSubType( defName )	-- если без разницы, то вернет 0
		end

	end

	return curWeaponAmmoSubType

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemInBattle( item )

	local bInBattle = false

	if item.itemType == self.itemTypes.INVENTORY then

    	if item.equipShipItem then
    		bInBattle = UI:IsShipInBattle( item.equipShipItem )
    	end

	end

	return bInBattle

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemOnShipQuest( item )

	return self:GetItemShipQuest( item ) ~= -1

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemShipQuest( item )

	local questId = -1

	if item.itemType == self.itemTypes.INVENTORY then

    	if item.equipShipItem then
    		questId = UI:GetShipQuestForShip( item.equipShipItem )
    	end		

	end

	return questId

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateItemsPanelVisibility()

	local bInBattle = self.selShipItem and ( UI:IsShipInBattle( self.selShipItem ) or UI:IsShipOnShipQuest( self.selShipItem ) )

	local bNeedVisible = self.selShipItem and self.selShipSlot and not bInBattle
	local bIsVisible = self:IsItemsPanelVisible()

	if bNeedVisible and not bIsVisible then
		self:ShowItemsPanel()

	elseif not bNeedVisible and bIsVisible then
		self:HideItemsPanel()
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:HideItemsPanel()

	self.itemsListWnd:UnlinkFromParent()
	self:HideChildModals()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowItemsPanel()

	self:AddChild( self.itemsListWnd )

	self:UpdateItems( false )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:IsItemsPanelVisible()

	return self.itemsListWnd:GetParent() ~= nil

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchTradeWnd( item, bSell )

	if bSell then
		self.tradeWnd:SetupForSell( item )
	else
		self.tradeWnd:SetupForBuy( item, true )
	end

	self.tradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchBuyWnd( mode, data )

	self.buyWnd:Setup( mode, nil, data )
	self.buyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchSalvageWnd( iid )

	self.salvageWnd:Setup( iid )
	self.salvageWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchSalvage2Wnd( iid )

	local data =
	{
		price	= 0,
		bGold	= false,
		iid		= iid,
	}

	self:LaunchBuyWnd( UI.BuyWnd.modes.SALVAGE, data )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchUpgradeItemWnd( iid, bInShipSlot )

	local slotId = -1

	if self.selShipSlot then
		slotId = self.selShipSlot:GetSlotId()
	else
		slotId = UI:GetEquippedSlot( iid )
	end

	if slotId == -1 then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchUpgradeItemWnd()[ERROR]: cannot find slot for compare info" )
	end
                                                                           	
	self.upgradeItemWnd:Setup( iid, self:GetSelShipItem().vid, slotId, true, { bInShipSlot = bInShipSlot } )
	self.upgradeItemWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowBuyErrorMsg( result )

	-- #0056553, комм.(0228526)
	if result == _G.GameStore.StoreBuyResult.SBR_NO_DISCOUNT then
		return
	end

	local msg = UI:GetStringByName( "msg_buyError" )

	local resultName = UI:Val2Key( _G.GameStore.StoreBuyResult, result )
	local resultStr = UI:GetStringByName( string.format( "buyError_%s", resultName ) )
	
	msg = string.format( msg, resultStr )
	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:HasShipSlotsOfType( shipSlotType )

	for slotIdx, slotWnd in pairs( self.shipSlots ) do
		if slotWnd:IsVisible() and slotWnd:GetShipSlotType() == shipSlotType then
			return true
		end
	end

	return false

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:BuyInventory( inventoryLevels )

	if self:IsWaiting() then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:BuyInventory()[ERROR]: is still waiting for some other request" )
	end

	local level = -1

	if inventoryLevels == nil then

		level = UI:GetInventoryCurLevel() + 1

	else

    	if type( inventoryLevels ) ~= "table" or not next( inventoryLevels ) then
			self:ResetBuyInfo()
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:BuyInventory()[ERROR]: invalid \"inventoryLevels\" param" )
    		return
    	end

		level = inventoryLevels[ #inventoryLevels ]

	end

	self.requestId_buyInventory = _G.GameStore_BuyInventoryExtension( level )

	if self.requestId_buyInventory ~= 0 then
		UI:AddWaitingRequest( self.requestId_buyInventory )
	else
		self:ResetBuyInfo()
		self:ShowBuyErrorMsg( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:SetSortMode( sortMode )

	if sortMode == self.sortMode then
		return
	end

	self.sortMode = sortMode

	self:UpdateItems( true )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ValidateSortMode()

	self:SetSortMode( self.DEFAULT_SORT_MODE )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventSaveUiState()

	self:HideChildModals()

	if self:IsOnScreen() then
		self:HideChildModals()
	end

	local tableName = self:GetScriptTableName()

	UI.store[ tableName ] =
	{
		salvage2RequestId = self.salvage2RequestId,
	}

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventRestoreUiState()

	local tableName = self:GetScriptTableName()
	local t = UI.store[ tableName ]

	if t then

		self.salvage2RequestId = t.salvage2RequestId

		self:UpdateWaitingEffect()

		UI.store[ tableName ] = nil

	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventListActivateRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.PopUpMenuWnd:GetUiHandle() and UI.PopUpMenuWnd:GetOwner() == self:GetUiHandle() then

    	local menuType = UI.PopUpMenuWnd:GetMenuType()
    	if menuType == UI.popUpMenuTypes.ITEM then
    		self:OnEquippedItemPopUpMenu( iParam0 )
    	else
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnEventListActivateRecord()[ERROR]: unhandled pop-up menu type: \"%s\"", tostring( menuType ) )
    	end

	end

end  


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu( recordIdx )

	local data = UI.PopUpMenuWnd:GetRecordData( recordIdx )
	if not data then
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot find pop-up menu data for record %d", recordIdx )
		return
	end

	if data.slotType == UI.popUpMenuSlotTypes.REMOVE_EQUIPPED_ITEM then

		local shipItem = UI:GetShipItem( data.vid )
		if shipItem then

			local bAmmo = UI:IsDefAmmo( data.defName )
        	if bAmmo then

				local curAmmoInfo = shipItem.equipAmmo[ data.slotId ]
				if curAmmoInfo and curAmmoInfo.def == data.defName then
			    	self:UnequipAmmoInternal( data.vid, data.slotId )					
	    			UI:PlayGlobalSound( self.sounds.unequip )
				else
					sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: ammo def name mismatch; probably equipment has been changed since initiation of poup menu" )
				end

        	else

				local curIid = shipItem.equipModules[ data.slotId ] or UI.INVALID_U64_ID

				if curIid == data.iid then
	    			self:UnequipModuleInternal( data.vid, data.slotId )
	    			UI:PlayGlobalSound( self.sounds.unequip )
				else
					sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot remove - module iid mismatch; probably equipment has been changed since initiation of poup menu" )
				end					

        	end

		else
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot find ship item" )
		end


	elseif data.slotType == UI.popUpMenuSlotTypes.SELL_ITEM then

		local invItem = self:MakeInvItemForSell( data.defName, data.count, data.iids, data.vid )
		self:LaunchTradeWnd( invItem, true )


	elseif data.slotType == UI.popUpMenuSlotTypes.REFILL_AMMO_FROM_INVENTORY then

		local shipItem = UI:GetShipItem( data.vid )
		if shipItem then

    		local curAmmoInfo = shipItem.equipAmmo[ data.slotId ]
    		if curAmmoInfo and curAmmoInfo.def == data.defName then

    			if curAmmoInfo.amount == 0 then

					if self:CanRefillAmmoFropmInventory( data.defName ) then
						self:EquipAmmoInternal( data.defName, data.vid, data.slotId )
					else
						sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot refill ammo from inventory; probably equipment or inventory has been changed since initiation of poup menu" )
					end    				

    			else
    				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: ammo already full; probably equipment has been changed since initiation of poup menu" )
    			end					    			
    		else
    			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot refill - ammo def name mismatch; probably equipment has been changed since initiation of poup menu" )
    		end
		else
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot find ship item" )
		end


	elseif data.slotType == UI.popUpMenuSlotTypes.REFILL_AMMO_FROM_SHOP then

		local shipItem = UI:GetShipItem( data.vid )
		if shipItem then

    		local curAmmoInfo = shipItem.equipAmmo[ data.slotId ]
    		if curAmmoInfo and curAmmoInfo.def == data.defName then

    			if curAmmoInfo.amount == 0 then

					if self:CanRefillAmmoFromShop( data.defName ) and not self:CanRefillAmmoFropmInventory( data.defName ) then
						self:TryBuy( shipItem, UI.serverData.shopByDef[ data.defName ], data.slotId )
					else
						sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot refill ammo from shop; probably equipment or inventory has been changed since initiation of poup menu" )
					end    				

    			else
    				sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: ammo already full; probably equipment has been changed since initiation of poup menu" )
    			end					    			
    		else
    			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot refill - ammo def name mismatch; probably equipment has been changed since initiation of poup menu" )
    		end
		else
    		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: cannot find ship item" )
		end


	elseif data.slotType == UI.popUpMenuSlotTypes.BUY_AND_EQUIP_ITEM then

		self:TryBuy( UI:GetShipItem( data.vid ), data.shopItem, data.slotId )


	elseif data.slotType == UI.popUpMenuSlotTypes.EQUIP_ITEM then		
	
    	if data.srcVid and data.srcVid ~= UI.INVALID_U64_ID and data.srcVid ~= self.selShipItem.vid then

			self.popMenuDataToEquip = data

			local srcEquipShipItem = UI:GetShipItem( data.srcVid )
    		self:ShowRequestTranspherFromOtherShipMsg( data.defName, srcEquipShipItem.defName )

    	else

			self:DoQuickEquipFromPopUp( data )
    		UI:PlayGlobalSound( self.sounds.equip )

		end

	elseif data.slotType == UI.popUpMenuSlotTypes.SALVAGE_ITEM then

		local invItem = UI:GetInventoryItem( data.iid )
		if UI:CanItemBeSalvaged( invItem.defName ) then
			self:LaunchSalvageWnd( data.iid )
		else
			self:LaunchSalvage2Wnd( data.iid )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.UPGRADE_ITEM then

		self:LaunchUpgradeItemWnd( data.iid, data.customData and data.customData.bInShipSlot or false )

	elseif data.slotType == UI.popUpMenuSlotTypes.SHOW_ATLAS then
	
		UI.HangarWnd:ShowProfile( UI:GetLocalPlayerUid(), "ATLAS", true, nil, self:MakeDefaultLaunchData() )
		UI.Profile_AtlasWnd:ShowItem( data.defName )
		
	elseif data.slotType == UI.popUpMenuSlotTypes.TRADING_ITEM then
	
		UI.TradingWnd:Setup( UI.TradingWnd.modes.COMMON, self:GetName() )
		UI.TradingWnd:Show()
		UI.TradingWnd:ShowItem( data.defName )

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:OnEquippedItemPopUpMenu()[ERROR]: unhandled slot type: \"%s\"", tostring( data.slotType ) )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CanRefillAmmoFropmInventory( defName )

	local itemsByDef = UI.serverData.inventoryByDef[ defName ]
	if not itemsByDef then
		return false
	end

	for idx, item in pairs( itemsByDef ) do
		if item.amount > 0 then
			return true
		end
	end

	return false

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:CanRefillAmmoFromShop( defName )

	return not UI:CantItemBeBoughtByDef( defName )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MakeInvItemForSell( defName, count, iids, equipVid )

	local equipShipItem = nil
	if equipVid ~= UI.INVALID_U64_ID then
		equipShipItem = UI:GetShipItem( equipVid )
	end

	local invItem = UI:CreateInvItem( UI:IsDefAmmo( defName ) and UI.invItemTypes.AMMO or UI.invItemTypes.MODULE, defName, equipShipItem, count, nil, nil, nil )
	invItem.iids = iids

	return invItem

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:HandleEscape()

	if self.selShipSlot then
		self:SelectShipSlot( nil )
		return true
	else
		return false
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:UpdateItemsListLayout()

	if not self.selShipSlot then
		return
	end

	self.itemsListWnd:UpdateLayout()

	self:MoveChildToLastPosition( self.itemsListWnd )
	self:MoveChildToLastPosition( self.selShipSlot )	

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:DoSalvageItem2( iid )

	self.salvage2RequestId = _G.MasterServer_DisassembleItem( iid, 1 )
	if self.salvage2RequestId ~= 0 then

		UI:AddWaitingRequest( self.salvage2RequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
		UI:AddWaitingRequest( UI.RESOURCES_REQUEST_ID )

		local bEquipped = UI:GetEquippedShipItem( iid ) ~= nil
		if bEquipped then
			UI:AddWaitingRequest( UI.VESSEL_EQUIPMENT_REQUEST_ID )
		end

		UI:PlayGlobalSound( self.sounds.salvage )

	else
		UI:ShowMsgOnSalvage2Error( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchItemCraftWnd( itemDefNameToCraft, bUpgrade, upgradedIid )

	local launchData = self:MakeDefaultLaunchData()

	-- эти параметры нужны только если скрафченный предмет надо установить на корабль
	launchData.bUpgrade			= nil
	launchData.iid				= nil
	launchData.vidToEquip		= nil
	launchData.slotIdToEquip	= nil

	if bUpgrade then

		local equipShipItem = UI:GetEquippedShipItem( upgradedIid )
		if equipShipItem then

			launchData.bUpgrade			= true
			launchData.iid				= upgradedIid

		end

	else

		if self.selShipSlot then

			launchData.bUpgrade			= false
			launchData.vidToEquip		= self.selShipItem.vid
			launchData.slotIdToEquip	= self.selShipSlot:GetSlotId()

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:LaunchItemCraftWnd()[ERROR]: no selected ship slot" )
		end

	end

	UI.HangarWnd:ShowItemCraftSingle( itemDefNameToCraft, nil, launchData )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:MakeDefaultLaunchData()

	local launchData = 
	{
		bShipsTree			= true,
		bEvolvingEdit		= true,
		shipDefNameCenterOn	= self.selShipItem.defName, 
		shipsTreeLaunchData	= UI.ShipsTreeWnd:GetLaunchData(),
		
		evolvingEditParams =
		{
			chosenNodesMask	= UI[ self.editWndName ]:GetChosenActiveNodesMask(),
			selItemInfo		= self:GetSelShipSlotInfo(),
		},
	}
	
	return launchData 

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowMsgBoxOnNotEnoughMoney( priceType )

    local priceTypeName = UI:Val2Key( _G.GameStore.CreditsType, priceType )

    local caption = UI:GetStringByName( string.format( "msg_notEnoughMoney_caption_%s", priceTypeName ) )

    local text = UI:GetStringByName( string.format( "msg_notEnoughMoney_text_%s", priceTypeName ) )

	local strBaseColor = UI:Color2Str( UI.TEXT_BASE_COLOR )
	text = string.format( "%s%s", strBaseColor, text )

	local desc = ""

	if priceType == _G.GameStore.CreditsType.CT_CREDITS then
		desc = UI:GetStringByName( "creditsPriceTooltip_desc" )

	elseif priceType == _G.GameStore.CreditsType.CT_GOLD then
		desc = UI:GetStringByName( "goldPriceTooltip_desc" )

	elseif priceType == _G.GameStore.CreditsType.CT_TOKENS then
		desc = UI:GetStringByName( "tokensPriceTooltip_desc" )

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ItemsWnd:ShowMsgBoxOnNotEnoughMoney()[ERROR]: unhandled price type: %s", tostring( priceType ) )
	end

	if desc ~= "" then
	    text = string.format( "%s|%s", text, desc )
	end

    UI:MessageBox( caption, text, UI.MBS_OK )

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemSlotByActionBtn( actionBtn )

	local fitSlotWnd = nil

	if not actionBtn then
		return fitSlotWnd
	end

	for recordIdx = 1, self.itemsListWnd:GetNumRecords() do

		local slotWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )

		if slotWnd and slotWnd:GetActionBtnRaw() == actionBtn then
			fitSlotWnd = slotWnd
			break
		end

	end

	return fitSlotWnd

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:GetItemSlotByOpenSubTreeBtn( subTreeBtn )

	local fitSlotWnd = nil

	if not subTreeBtn then
		return fitSlotWnd
	end

	for recordIdx = 1, self.itemsListWnd:GetNumRecords() do

		local slotWnd = self.itemsListWnd:GetButtonForRecord( recordIdx )

		if slotWnd and slotWnd:GetOpenSubTreeBtnRaw() == subTreeBtn then
			fitSlotWnd = slotWnd
			break
		end

	end

	return fitSlotWnd

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:RecalcAbsVals()

end


--
function UI.ShipsTree_EvolvingEdit_ItemsWnd:RecalcLayout()

	local screenPos = UI[ self.editWndName ]:GetItemsSlotsPos()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetScreenPos( screenPos )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_ItemsWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_ItemsWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ShipsTree_EvolvingEdit_ItemsWnd",

		props =
		{
			name	= "ShipsTree_AlienEdit_ItemsWnd"
		}
	},

	editWndName = "ShipsTree_AlienEditWnd"
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_ItemsWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_ItemsWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ShipsTree_EvolvingEdit_ItemsWnd",

		props =
		{
			name	= "ShipsTree_SpecialEdit_ItemsWnd"
		}
	},

	editWndName = "ShipsTree_SpecialEditWnd"
}


-- ********************************************************************************************************************
-- Внимение, хак! "Классы" UI.Equipment_ShipSlotWnd, UI.Equipment_ModuleShipSlotWnd и UI.Equipment_AmmoShipSlotWnd
-- изначально не предназначались для использования за пределами окна UI.EquipmentWnd, и ничего про дерево кораблей не знают.
-- Делая изменения там, надо убедиться, что здесь не сломалось.

-- ********************************************************************************************************************

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Equipment_ModuleShipSlotWnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_Items_ModuleSlotWnd",
		isPrototype	= true,
	}
}

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd:GetShipItem()

	local parent = self:GetParent()
	return parent and parent:GetShipItem()

end


--
function UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd:GetShipDefName()

	local shipItem = self:GetShipItem()
	return shipItem and shipItem.defName or ""

end


--
function UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd:IsItemDragging()

	local parent = self:GetParent()
	return parent and parent:IsItemDragging() or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd:SetBgDefaultAnimation()

	self.icoWnd:AnimateIcoIdleAlien()

end


--
function UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd:SetBgDDFitAnimation()

	self.icoWnd:AnimateIcoSelAlien()

end


--
function UI.ShipsTree_EvolvingEdit_Items_ModuleSlotWnd:SetupTooltipForItem()

	UI.Equipment_ModuleShipSlotWnd.SetupTooltipForItem( self )

	if self.tipData then
		self.tipData.bWithTalents = false
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Equipment_AmmoShipSlotWnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_Items_AmmoSlotWnd",
		isPrototype	= true,
	}
}

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd:GetShipItem()

	local parent = self:GetParent()
	return parent and parent:GetShipItem()

end


--
function UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd:GetShipDefName()

	local shipItem = self:GetShipItem()
	return shipItem and shipItem.defName or ""

end


--
function UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd:IsItemDragging()

	local parent = self:GetParent()
	return parent and parent:IsItemDragging() or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd:SetBgDefaultAnimation()

	self.icoWnd:AnimateIcoIdleAlien()

end


--
function UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd:SetBgDDFitAnimation()

	self.icoWnd:AnimateIcoSelAlien()

end


--
function UI.ShipsTree_EvolvingEdit_Items_AmmoSlotWnd:SetupTooltipForItem()

	UI.Equipment_AmmoShipSlotWnd.SetupTooltipForItem( self )

	if self.tipData then
		self.tipData.bWithTalents = false
	end

end


-- -------------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd
-- -------------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd",
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
				defName 			= "shipsTree_alienEdit_specModuleSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "modul_special",
						layer		= "UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.layers.ICO_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "modul_special_title",
						layer		= "UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "modul_special_name",
						layer		= "UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- ICO_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_specModuleSlot_icoMain",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "buff_icon",
						layer		= "UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.layers.ICO_WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ICO_WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_specModuleSlot_icoWork",
				defaultAnimation	= "color",
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "equipment_specModule" ),
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface funcitons
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd:Setup( defName )

	self:Reset()

	self.defName = defName
	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd:Reset()

	self.defName = ""

	UI:ResetItemIco( self, self.layers.ICO_WORK_EFFECT )
	self:SetText( "", self.layers.NAME )
	self.tooltipData = nil

end


--
function UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd:GetTooltipData()

	return self.tooltipData

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    ICO_MAIN_EFFECT	= 1,
    ICO_WORK_EFFECT	= 2,
    CAPTION			= 3,
    NAME			= 4,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.defName		= ""
UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd.tooltipData	= nil

-- ---------------------------------
-- work funcitons
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateName()
	self:UpdateTooltip()

end


--
function UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd:UpdateIco()

	UI:UpdateItemIco( self.defName, self, self.layers.ICO_WORK_EFFECT, false )

end


--
function UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd:UpdateName()

	local name = UI:GetEntityLocalizedNameByDef( self.defName, true, false )
	self:SetText( name, self.layers.NAME )

end


--
function UI.ShipsTree_EvolvingEdit_Items_SpecModuleSlotWnd:UpdateTooltip()

	local parentWnd = self:GetParent()
	shipItem = parentWnd and parentWnd.GetShipItem and parentWnd:GetShipItem()

	self.tooltipData =
	{
		tooltipType		= UI.tooltipTypes.MODULE,
		defName			= self.defName,
		dstShipData		= UI.ModuleTooltipWnd.ShipData:CreateForVid( shipItem.vid, ai.SpaceShipModuleSlot.SPECIAL ),
	}

end


-- ************************************************************
-- Внимание, хак! Этот список наследует от списка в эквипменте, который изначально
-- не был предназначен для использования за пределами окна UI.EquipmentWnd.
-- Внося изменения там, надо убедиться, что здесь ничего не сломалось

-- ************************************************************

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Items_ListWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Items_ListWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_ListWnd.def =
{
	className	= "Wnd",
	prototype	= "Equipment_ItemsListWnd_proto",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_Items_ListWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- LINK_EFFECT
		{
			id			= UI.Equipment_ItemsListWnd_proto.layers.LINK_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "equipment_itemsList_link",
				defaultAnimation	= "idle_2",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:UpdateLayout()

	local selShipSlot = self:GetSelShipSlot()
	if not selShipSlot then
		sys.log( "UI.ShipsTree_EvolvingEdit_Items_ListWnd:UpdateLayout()[ERROR]: no selected ship slot" )
		return
	end

	-- собственная высота

	local numVisibleSlots = math.min( self:GetNumRecords(), self.MAX_SLOTS )
	local slotsHeight = self.slotHeight * numVisibleSlots  + self.slotsSpace * ( numVisibleSlots - 1 )

	local selfHeight = slotsHeight + self.space_top_slots + self.space_slots_btm
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )

	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end


	-- собственная позиция
	
	local slotOrgLocatorPos = selShipSlot:GetOrg()
	local slotPos = UI:Vec2( selShipSlot:GetLeft(), selShipSlot:GetTop() )

	local slotOrgX_screen = slotPos.x + slotOrgLocatorPos.x
	local slotOrgY_screen = slotPos.y + slotOrgLocatorPos.y

	local slotParent = selShipSlot:GetParent()
	if slotParent then
		slotOrgX_screen = slotParent:XToScreen( slotOrgX_screen )
		slotOrgY_screen = slotParent:YToScreen( slotOrgY_screen )
	end

	local selfY_screen = slotOrgY_screen - self.linkOrg.y - self.linkY

	if selfY_screen + selfHeight > 768 then
		selfY_screen = 768 - selfHeight
	end

	local linkX_screen		= slotOrgX_screen - self.linkOrg.x
	local selfRight_screen	= linkX_screen + self.space_link_right
	local selfX_screen		= selfRight_screen - self:GetWidth()

	local selfParent = self:GetParent()
	local selfX_local = selfParent and selfParent:XToWindow( selfX_screen ) or selfX_screen
	local selfY_local = selfParent and selfParent:YToWindow( selfY_screen ) or selfY_screen

	self:SetPos( selfX_local, selfY_local )


	-- позиция линка

	local linkEffect = UI:GetEffectFromLayer( self, self.layers.LINK_EFFECT )		
	if linkEffect then

		local linkX_local = self:XToWindow( slotOrgX_screen - self.linkOrg.x )
		local linkY_local = self:YToWindow( slotOrgY_screen - self.linkOrg.y )

		linkEffect:SetPos( UI:Vec2( linkX_local, linkY_local ) )

	end

	
	-- позиция эффекта ожидания

	local waitEffect = UI:GetEffectFromLayer( self, self.layers.WAIT_EQUIP_EFFECT )
	if waitEffect then

		local waitPos = UI:Vec2( self.waitX, ( selfHeight - self.waitHeight ) * 0.5 )
		waitEffect:SetPos( waitPos )
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_ListWnd.btnPrototypeName = "ShipsTree_EvolvingEdit_Items_List_SlotWnd"

UI.Equipment_ItemsListWnd_proto.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "scroll_max",
		animIdle			= "idle",
		backBtn				= "btn_3",
		linkLocator			= "modul_bg",
		numSlotsLocators	= 4,
		minHeightLocator	= "dist_min",
		maxHeightLocator	= "self",		
		waitLocator			= "load_modules",
		linkLocator_vert	= "modul_bg_2",
	},

	link =
	{
		orgLocator	= "center"
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_ListWnd.space_link_right	= 0
UI.ShipsTree_EvolvingEdit_Items_ListWnd.linkY				= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:GetOpenItemsSubType()

	local parent = self:GetParent()
	return parent and parent:GetOpenItemsSubType() or -1

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:GetSelShipSlot()

	local parent = self:GetParent()
	return parent and parent:GetSelShipSlot()

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:IsItemCurrent( item )

	local parent = self:GetParent()
	return parent and parent:IsItemCurrent( item ) or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:IsItemAvailable( item )

	local parent = self:GetParent()
	return parent and parent:IsItemAvailable( item ) or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:GetSelShipItem()

	local parent = self:GetParent()
	return parent and parent:GetSelShipItem()

end


function UI.ShipsTree_EvolvingEdit_Items_ListWnd:IsItemInBattle( item )

	local parent = self:GetParent()
	return parent and parent:IsItemInBattle( item ) or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:IsItemOnShipQuest( item )

	local parent = self:GetParent()
	return parent and parent:IsItemOnShipQuest( item ) or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:GetSubtreeItems( rootItem, items )

	local parent = self:GetParent()
	return parent and parent:GetSubtreeItems( rootItem, items ) or {}

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:UpdateMaxSlots()

	if self:GetNumRecords() ~= 0 then
		sys.log( "UI.Equipment_ItemsListWnd_proto:UpdateMaxSlots()[ERROR]: not empty" )
		return
	end

	local maxSlots = 0

	local selfMaxHeight = 768 - UI.HangarWnd:GetTopPanelBtm()
	selfMaxHeight = UI:Clamp( selfMaxHeight, self.minHeight, self.maxHeight )

	local slotsMaxHeight = selfMaxHeight - self.space_top_slots - self.space_slots_btm
	slotsMaxHeight = math.max( slotsMaxHeight, 0 )

	local slotHeight	= UI.Equipment_Items_SlotWnd:GetAssumedHeight()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )
	local space_slots	= secondSlotPos.y - ( firstSlotPos.y + slotHeight )

	if slotHeight + space_slots ~= 0 then
		maxSlots = math.floor( ( slotsMaxHeight + space_slots ) / ( slotHeight + space_slots ) )
	end

	if maxSlots == self.MAX_SLOTS then
		return
	end

	self:ResetMaxSlots()

	self.MAX_SLOTS = maxSlots

	for slotIdx = 1, self.MAX_SLOTS + 1 do

		local slot = { idx = slotIdx }	
		table.insert( self.allSlots, slot )

		slot.btn = self:ObtainBtn()
		if slot.btn then
			slot.btn:SetSlot( slotIdx, self )
		end

	end

	-- вызов базовой функции для адейта маски и др. параметров
	self:RecalcLayout()


	-- скроллбар

	self.scrollBar:SetPageSize( self.MAX_SLOTS )

	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	if mainEffect and scrollEffect then

		local selfMaxHeightFixed = slotHeight * maxSlots + space_slots * ( maxSlots - 1 ) + self.space_top_slots + self.space_slots_btm

    	local scrollNeedHeight = selfMaxHeightFixed - self.space_scroll_btm - self.space_top_scroll
    	local scrollBaseHeight = scrollEffect:GetObjSize( "self" ).y

    	local scrollScale_y = scrollNeedHeight / scrollBaseHeight
    	scrollEffect:SetScale( UI:Vec2( 1, scrollScale_y ) )

    	self.scrollBar:SetHeight( scrollNeedHeight )

    	self:UpdateScrollBarVisibility()

	end

end


--
function UI.ShipsTree_EvolvingEdit_Items_ListWnd:PrepareLayout()

	UI.Equipment_ItemsListWnd_proto.PrepareLayout( self )

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local linkPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.linkLocator_vert ) or Vec2( 0, 0 )
	local selfMaxSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxHeightLocator ) or Vec2( 0, 0 )

	self.space_link_right	= selfMaxSize.x - linkPos.x
	self.linkY				= linkPos.y

end


-- ************************************************************
-- Внимание, хак! Этот "класс" наследует от Equipment_Items_SlotWnd, который изначально
-- не был предназначен для использования за пределами окна UI.EquipmentWnd.
-- Внося изменения там, надо убедиться, что здесь ничего не сломалось

-- ************************************************************

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "Equipment_Items_SlotWnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_Items_List_SlotWnd",
		isPrototype	= true,
	}	
}


-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:IsItemCurrent( item )

	local listWnd = self:GetList()
	return listWnd and listWnd:IsItemCurrent( item ) or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:IsSpecModuleUnlocked( defName )

	sys.log( "UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd()[ERROR]: not supported" )
	return false

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:IsItemAvailable( item )

	local listWnd = self:GetList()
	return listWnd and listWnd:IsItemAvailable( item ) or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:GetSelShipItem()

	local listWnd = self:GetList()	
	return listWnd and listWnd:GetSelShipItem()

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:IsItemInBattle( item )

	local listWnd = self:GetList()	
	return listWnd and listWnd:IsItemInBattle( item )

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:IsItemOnShipQuest( item )

	local listWnd = self:GetList()	
	return listWnd and listWnd:IsItemOnShipQuest( item ) or false

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:GetSelShipSlot()

	local listWnd = self:GetList()	
	return listWnd and listWnd:GetSelShipSlot()

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:GetSubtreeItems( rootItem, items )

	local listWnd = self:GetList()	
	return listWnd and listWnd:GetSubtreeItems( rootItem, items ) or {}

end


--
function UI.ShipsTree_EvolvingEdit_Items_List_SlotWnd:UpdateIcoTooltip( data )

	UI.Equipment_Items_SlotWnd.UpdateIcoTooltip( self, data )

	local tooltipData = self.icoWnd:GetTooltipData()
	if tooltipData then
		tooltipData.bWithTalents = false
	end

end


-- -------------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Items_DDIco
-- -------------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Items_DDIco =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "Equipment_DDIco_proto",

    	props =
    	{
    		name		= "ShipsTree_EvolvingEdit_Items_DDIco",
			isPrototype	= true,
    	}
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_MainParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_MainParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_MainParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_MainParamsWnd",
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
				defName 			= "shipsTree_alienEdit_mainParams",
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

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:Reset()

    self.shipDefName		= ""
    self.chosenNodesMask	= nil
    self.shipItem			= nil

	self:Clear()

end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:OnOwnedVessels()

	self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnOwnedVessels()
		end

	end


end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnChosenActiveNodesChanged()
		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:OnEventInvItemsChanged()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnEventInvItemsChanged()
		end

	end
	
end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:OnVesselLevelUp()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnEventInvItemsChanged()
		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:GetShipItem()

	return self.shipItem

end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:GetChosenActiveNodesMask()

	return self.chosenNodesMask

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_MainParamsWnd.btnPrototypeName	= ""
UI.ShipsTree_EvolvingEdit_MainParamsWnd.MAX_SLOTS			= 4
UI.ShipsTree_EvolvingEdit_MainParamsWnd.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.ShipsTree_EvolvingEdit_MainParamsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "progr_prop_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.ShipsTree_EvolvingEdit_MainParamsWnd.paramNames =
{
    "hull_health",
    "shield_max",
    "energy_max",
    "max_speed",
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_MainParamsWnd.shipDefName		= ""
UI.ShipsTree_EvolvingEdit_MainParamsWnd.chosenNodesMask	= nil
UI.ShipsTree_EvolvingEdit_MainParamsWnd.shipItem		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:FullUpdate()

	self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )

	self:UpdateSlots()

end


--
function UI.ShipsTree_EvolvingEdit_MainParamsWnd:UpdateSlots()

	self:Clear()

	local namesToShowMap = {}
	for paramIdx, paramName in pairs( self.paramNames ) do
		namesToShowMap[ paramName ] = true
	end

	local allParams = UI:GetShipTooltipAllParams()

	local paramsToShowMap = {}
	for paramIdx, paramInfo in pairs( allParams ) do
		if namesToShowMap[ paramInfo.name ] then
			paramsToShowMap[ paramInfo.name ] = paramInfo
		end
	end

	for paramIdx, paramName in ipairs( self.paramNames ) do

		local paramInfo = paramsToShowMap[ paramName ]
		if paramInfo then

			local data = { paramInfo = paramInfo }
			self:AddRecord( { paramInfo = paramInfo } )

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_MainParamsWnd:UpdateSlots()[ERROR]; cannot find param info for \"%s\"", paramName )
		end		

	end

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_MainParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_MainParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_AlienEdit_MainParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_MainParamsWnd",

	props =
	{
		name	= "ShipsTree_AlienEdit_MainParamsWnd"
	},
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_AlienEdit_MainParamsWnd.btnPrototypeName = "ShipsTree_AlienEdit_MainParamSlotWnd"

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_MainParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_MainParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialEdit_MainParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_MainParamsWnd",

	props =
	{
		name	= "ShipsTree_SpecialEdit_MainParamsWnd"
	},
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_SpecialEdit_MainParamsWnd.btnPrototypeName = "ShipsTree_SpecialEdit_MainParamSlotWnd"

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_MainParamSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_MainParamSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_MainParamSlotWnd",
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
				defName 			= "shipsTree_alienEdit_mainParamSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "slot",
						layer		= "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_1",
						layer		= "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.layers.BAR_DEC_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_2",
						layer		= "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.layers.BAR_INC_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_3",
						layer		= "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.layers.BAR_CUR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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
				defName 			= "shipsTree_alienEdit_mainParamSlot_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- BAR_DEC_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_mainParamSlot_barDec",
				defaultAnimation	= "idle",
			}}
		},

		-- BAR_INC_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_mainParamSlot_barInc",
				defaultAnimation	= "idle",
			}}
		},

		-- BAR_CUR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT ) 
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:ResetBar()

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:OnOwnedVessels()

	self:UpdateBar( self:GetRecordData() )

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:OnChosenActiveNodesChanged()

	self:UpdateBar( self:GetRecordData() )

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:OnEventInvItemsChanged()

	self:UpdateBar( self:GetRecordData() )
	
end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:OnVesselLevelUp()

	self:UpdateBar( self:GetRecordData() )
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.layers =
{
    MAIN_EFFECT		= 0,
    ICO_EFFECT		= 1,
    BAR_DEC_EFFECT	= 2,
    BAR_INC_EFFECT	= 3,
    BAR_CUR_EFFECT	= 4,
}

UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.effectInfo =
{
	ico =
	{
		spriteName	= "ico"
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateBar( data )

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:UpdateIco( data )

	local hTex = UI:GetShipParamIco( data.paramInfo )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT ) 
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:UpdateBar( data )

	self:ResetBar()

	local shipItem = self:GetShipItem()
	if not shipItem then
		sys.log( "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:UpdateBar()[ERROR]: no ship item" )
		return
	end

	local chosenNodesMask = self:GetChosenActiveNodesMask()

	local dataCommitted	= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( shipItem.vid, true, nil ) ) }

	local dataChosen = nil
	if chosenNodesMask then
		dataChosen = { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( shipItem.vid, true, chosenNodesMask ) ) }
	end

	local valsCommitted		= UI:GetParamVals( shipItem.defName, data.paramInfo, UI.paramSrcTypes.SHIP, dataCommitted, false )
	local valsChosen		= chosenNodesMask and UI:GetParamVals( shipItem.defName, data.paramInfo, UI.paramSrcTypes.SHIP, dataChosen, false ) or valsCommitted

	if #valsCommitted ~= 1 or #valsChosen ~= 1 then
		sys.log( "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:UpdateBar()[ERROR]: expected only one val per parameter" )
		return
	end

	local valCommitted	= valsCommitted[ 1 ]
	local valChosen		= valsChosen[ 1 ]
	local valMax		= UI:GetShipParamMaxVal( shipItem.defName, data.paramInfo.name )


	if valChosen > valCommitted then

		-- светло-зеленая полоса

		local curAnimTime = valMax ~= 0 and math.min( valCommitted / valMax, 1 ) or 1

    	local barCurEffect = UI:GetEffectFromLayer( self, self.layers.BAR_CUR_EFFECT ) 
    	if barCurEffect then
    		barCurEffect:SetAnimationTimeAndUpdate( curAnimTime )
    	end

		-- темно-зеленая полоса

		self:SetLayerVisible( true, self.layers.BAR_INC_EFFECT )

		local incAnimTime = valMax ~= 0 and math.min( valChosen / valMax, 1 ) or 1

    	local barIncEffect = UI:GetEffectFromLayer( self, self.layers.BAR_INC_EFFECT ) 
    	if barIncEffect then
    		barIncEffect:SetAnimationTimeAndUpdate( incAnimTime )
    	end
	
	elseif valChosen < valCommitted then

		-- светло-зеленая полоса

		local curAnimTime = valMax ~= 0 and math.min( valChosen / valMax, 1 ) or 1

    	local barCurEffect = UI:GetEffectFromLayer( self, self.layers.BAR_CUR_EFFECT ) 
    	if barCurEffect then
    		barCurEffect:SetAnimationTimeAndUpdate( curAnimTime )
    	end

		-- красная полоса

		self:SetLayerVisible( true, self.layers.BAR_DEC_EFFECT )

		local decAnimTime = valMax ~= 0 and math.min( valCommitted / valMax, 1 ) or 1

    	local barDecEffect = UI:GetEffectFromLayer( self, self.layers.BAR_DEC_EFFECT ) 
    	if barDecEffect then
    		barDecEffect:SetAnimationTimeAndUpdate( decAnimTime )
    	end

	else

		-- светло-зеленая полоса

		local curAnimTime = valMax ~= 0 and math.min( valCommitted / valMax, 1 ) or 1		

    	local barCurEffect = UI:GetEffectFromLayer( self, self.layers.BAR_CUR_EFFECT ) 
    	if barCurEffect then
    		barCurEffect:SetAnimationTimeAndUpdate( curAnimTime )
    	end

	end	

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:ResetBar()

	self:SetLayerVisible( false, self.layers.BAR_DEC_EFFECT )
	self:SetLayerVisible( false, self.layers.BAR_INC_EFFECT )

	local barCurEffect = UI:GetEffectFromLayer( self, self.layers.BAR_CUR_EFFECT ) 
	if barCurEffect then
		barCurEffect:SetAnimationTimeAndUpdate( 0 )
	end

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:GetShipItem()

	local shipItem = nil

	local parent = self:GetParent()
	if parent then

		if parent.GetShipItem then			
			shipItem = parent:GetShipItem()
		else
			sys.log( "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:GetShipItem()[ERROR]: no way to get ship item - parent doesn't support GetShipItem()" )
		end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:GetShipItem()[ERROR]: no way to get ship item - no parent" )
	end

	return shipItem

end


--
function UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:GetChosenActiveNodesMask()

	local chosenNodesMask = nil

	local parent = self:GetParent()
	if parent then

		if parent.GetShipItem then			
			chosenNodesMask = parent:GetChosenActiveNodesMask()
		else
			sys.log( "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:GetShipItem()[ERROR]: no way to get chosen nodes mask - parent doesn't support GetChosenActiveNodesMask()" )
		end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_MainParamSlotWnd:GetShipItem()[ERROR]: no way to get dchosen nodes mask - no parent" )
	end

	return chosenNodesMask

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_MainParamSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_MainParamSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_AlienEdit_MainParamSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_MainParamSlotWnd",

	props =
	{
		name		= "ShipsTree_AlienEdit_MainParamSlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- BAR_CUR_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.layers.BAR_CUR_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_alienEdit_mainParamSlot_barCur",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_MainParamSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_MainParamSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialEdit_MainParamSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_MainParamSlotWnd",

	props =
	{
		name		= "ShipsTree_SpecialEdit_MainParamSlotWnd",
		isPrototype	= true,
	},

	layers =
	{
		-- BAR_CUR_EFFECT
		{
			id			= UI.ShipsTree_EvolvingEdit_MainParamSlotWnd.layers.BAR_CUR_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "shipsTree_specialEdit_mainParamSlot_barCur",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_ParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_ParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ParamsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_ParamsWnd",
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
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipsTree_params" ),
		},

		-- NO_PARAMS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipsTree_noChangedParams" ),
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:Setup( shipDefName, chosenNodesMask )

	self.changedParamsWnd:Setup( shipDefName, chosenNodesMask )
	self.bonusesWnd:Setup( shipDefName, chosenNodesMask )

	self:UpdateNoParams()

	self:RecalcLayout( false )

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:Reset()

	self:SetLayerVisible( false, self.layers.NO_PARAMS )
	self.changedParamsWnd:Reset()
	self.bonusesWnd:Reset()

	self:RecalcLayout( false )

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:OnOwnedVessels()

	self.changedParamsWnd:OnOwnedVessels()
	self.bonusesWnd:OnOwnedVessels()

	self:UpdateNoParams()

	self:RecalcLayout( true )

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.changedParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )
	self.bonusesWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self:UpdateNoParams()

	self:RecalcLayout( true )

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:OnVesselLevelUp()

	self.changedParamsWnd:OnVesselLevelUp()
	self.bonusesWnd:OnVesselLevelUp()
	
	self:UpdateNoParams()

	self:RecalcLayout( true )
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ParamsWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	NO_PARAMS	= 2,
}

UI.ShipsTree_EvolvingEdit_ParamsWnd.SCROLL_STEP					= UI:YTo1024x768( 30, { x = 1280, y = 720 } )
UI.ShipsTree_EvolvingEdit_ParamsWnd.space_controls_scrollBar	= UI:XTo1024x768( 5, { x = 1280, y = 720 } )

UI.ShipsTree_EvolvingEdit_ParamsWnd.effectInfo =
{
	main =
	{
		changedParamsLocator	= "proper",
		bonusesLocator			= "proper1",
		scrollBarLocator		= "scroll",
	}
}

UI.ShipsTree_EvolvingEdit_ParamsWnd.changedParamsWndTableName	= ""

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ParamsWnd.maskWnd				= nil
UI.ShipsTree_EvolvingEdit_ParamsWnd.workWnd				= nil
UI.ShipsTree_EvolvingEdit_ParamsWnd.scrollBar			= nil
UI.ShipsTree_EvolvingEdit_ParamsWnd.changedParamsWnd	= nil
UI.ShipsTree_EvolvingEdit_ParamsWnd.bonusesWnd			= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

	self:InitScrollBar()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:CreateControls()

	self.maskWnd = UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_Params_MaskWnd, "" )
	self:AddChild( self.maskWnd )
	
	self.workWnd = UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_Params_WorkWnd, "" )
	self.maskWnd:AddChild( self.workWnd )

	self.changedParamsWnd = UI:CreateWndFromTable( self.changedParamsWndTableName )
	self.workWnd:AddChild( self.changedParamsWnd )

	self.bonusesWnd = UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_BonusesWnd, "" )
	self.workWnd:AddChild( self.bonusesWnd )

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:InitScrollBar()	

	self.scrollBar = UI:CreateChildWnd( self, UI.EffectScrollWnd_Vrt_2, "" )
	self.scrollBar:SetStepSize( self.SCROLL_STEP )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( self.scrollBar:GetUiHandle(), self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.ALL )
	end	

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:RecalcLayout( bSaveScrollPos )

	if not self:IsOnScreen() then
		return
	end


	if bSaveScrollPos == nil then
		bSaveScrollPos = true
	end

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local changedParamsPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.changedParamsLocator ) or Vec2( 0, 0 )


	-- позиция маски

	local maskX = 0
	local maskY = changedParamsPos.y
	self.maskWnd:SetPos( maskX, maskY )

	-- позиция скроллируемого окна

	local workX = 0		-- относительно данного окна
	self.workWnd:SetLeft( workX - maskX )

	-- позиции дочерних элементов

	-- позиция измененных параметров

	self.changedParamsWnd:SetPos( changedParamsPos.x - workX, 0 )


	-- позиция бонусов

	local bonusesPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.bonusesLocator ) or Vec2( 0, 0 )
	self.bonusesWnd:SetLeft( bonusesPos.x - workX )

	local space_changedParams_bonuses = bonusesPos.y - ( changedParamsPos.y + self.changedParamsWnd:GetBaseHeight() )
	local bonusesTop = self.changedParamsWnd:GetTop() + self.changedParamsWnd:GetHeight() + space_changedParams_bonuses
	self.bonusesWnd:SetTop( bonusesTop )

	-- собственная ширина

	local selfWidth = mainEffect and mainEffect:GetObjSize( "self" ).x or 0
	self:SetWidth( selfWidth )

	-- ширина маски

	local maskWidth = selfWidth
	self.maskWnd:SetWidth( maskWidth )

	-- ширина скроллируемого окна

	local workWidth = selfWidth
	self.workWnd:SetWidth( workWidth )

	-- собственная высота		

	local parent = self:GetParent()
	local selfHeight = ( parent and parent:GetHeight() or 0 ) - self:GetTop()
	self:SetHeight( selfHeight )

	-- высота маски

	local maskHeight = selfHeight - maskY
	self.maskWnd:SetHeight( maskHeight )

	-- высота скроллируемого окна

	local workHeight = self.bonusesWnd:GetTop() + self.bonusesWnd:GetHeight()
	self.workWnd:SetHeight( workHeight )


	-- скроллбар

	local scrollSize = 0
	if workHeight > maskHeight then
		scrollSize = workHeight - maskHeight
	end

	-- видимость

	local bNeedScrollBar = math.abs( scrollSize ) > 1e-3

	if bNeedScrollBar then

		local oldScrollPos = 0

		if self.scrollBar:IsChildOf( self ) then
			oldScrollPos = self.scrollBar:GetPos()
		else
			self:AddChild( self.scrollBar )
		end

		-- высота

    	local scrollEffect = UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
    	if scrollEffect then

        	local needHeight = selfHeight - self.scrollBar:GetTop()
        	local baseHeight = scrollEffect:GetObjSize( "self" ).y

        	local scale_y = needHeight / baseHeight
        	scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )
        	self.scrollBar:SetHeight( needHeight )

    	end

		-- page
		self.scrollBar:SetPageSize( selfHeight )

		-- range
		self.scrollBar:SetRange( 0, scrollSize )

		-- scrollPos
		local scrollPos = bSaveScrollPos and oldScrollPos or 0
		self.scrollBar:SetPos( scrollPos )

	else
		self.scrollBar:UnlinkFromParent()
	end

	self:UpdateWorkWndPosFromScrollBar()

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:UpdateWorkWndPosFromScrollBar()

	local scrollPos = self.scrollBar:IsChildOf( self ) and self.scrollBar:GetPos() or 0
	self.workWnd:SetTop( UI:YRel2Snapped( -scrollPos ) )	

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateWorkWndPosFromScrollBar()

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then

		local scrollPos = self.scrollBar:GetPos()
		scrollPos = scrollPos - ticks * self.SCROLL_STEP

		self.scrollBar:SetPos( scrollPos )		
		
	end

	return true

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcLayout( false )

end


--
function UI.ShipsTree_EvolvingEdit_ParamsWnd:UpdateNoParams()

	local bHasParams = self.changedParamsWnd:HasParams() or self.bonusesWnd:HasBonuses()
	self:SetLayerVisible( not bHasParams, self.layers.NO_PARAMS )

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_ParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_ParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_AlienEdit_ParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_ParamsWnd",

	props =
	{
		name	= "ShipsTree_AlienEdit_ParamsWnd",
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
				defName 			= "shipsTree_alienEdit_params",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_ParamsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "not_bonus",
						layer		= "UI.ShipsTree_EvolvingEdit_ParamsWnd.layers.NO_PARAMS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	},
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_AlienEdit_ParamsWnd.changedParamsWndTableName = "UI.ShipsTree_AlienEdit_ChangedParamsWnd"

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_ParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_ParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialEdit_ParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_ParamsWnd",

	props =
	{
		name	= "ShipsTree_SpecialEdit_ParamsWnd",
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
				defName 			= "shipsTree_specialEdit_params",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_ParamsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "not_bonus",
						layer		= "UI.ShipsTree_EvolvingEdit_ParamsWnd.layers.NO_PARAMS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	},
}

-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_SpecialEdit_ParamsWnd.changedParamsWndTableName = "UI.ShipsTree_SpecialEdit_ChangedParamsWnd"

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Params_MaskWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Params_MaskWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Params_MaskWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipsTree_EvolvingEdit_Params_MaskWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Params_MaskWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.ShipsTree_EvolvingEdit_Params_MaskWnd.parent		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_Params_MaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	if self:IsPrototype() then
		return
	end

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.ShipsTree_EvolvingEdit_Params_MaskWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого объекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.ShipsTree_EvolvingEdit_Params_MaskWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.ShipsTree_EvolvingEdit_Params_MaskWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_Params_WorkWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_Params_WorkWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_Params_WorkWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_Params_WorkWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},
}


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_ChangedParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_ChangedParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ChangedParamsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_ChangedParamsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipsTree_alienEdit_changedParams",
				defaultAnimation	= "idle",
			}}
		},

		-- PARAMS
		{
			layerType		= UI.LAYER_TEXT,
   			formatInfoSz	= { 5, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:Reset()

    self.shipDefName		= ""
    self.chosenNodesMask	= nil
    self.shipItem			= nil

	self:SetText( "", self.layers.PARAMS )

	self:RecalcLayout()

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:GetBaseHeight()

	local height = 0

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		height = mainEffect:GetObjSize( "self" ).y
	end

	return height

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:HasParams()

	return self:GetText( self.layers.PARAMS ) ~= ""

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:OnOwnedVessels()

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:OnVesselLevelUp()

	self:FullUpdate()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ChangedParamsWnd.layers =
{
	MAIN_EFFECT	= 0,
	PARAMS		= 1,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_ChangedParamsWnd.shipDefName		= ""
UI.ShipsTree_EvolvingEdit_ChangedParamsWnd.chosenNodesMask	= nil
UI.ShipsTree_EvolvingEdit_ChangedParamsWnd.shipItem			= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:PrepareLayout()

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:FullUpdate()

	self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )

	self:UpdateParams()
	self:RecalcLayout()

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:UpdateParams()

	local str = ""

	if self.shipItem then

    	local dataBase	= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.shipItem.vid, false, u64( 0 ) ) ) }
    	local dataCur	= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.shipItem.vid, false, nil ) ) }

    	local dataChosen = nil
    	if self.chosenNodesMask then
    		dataChosen = { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.shipItem.vid, false, self.chosenNodesMask ) ) }
    	end

    	local params = UI:GetShipTooltipAllParams( self.shipDefName )
    	for paramIdx, paramInfo in ipairs( params ) do

    		if not paramInfo.separator then

            	local valsBase		= UI:GetParamVals( self.shipDefName, paramInfo, UI.paramSrcTypes.SHIP, dataBase, false )
            	local valsCur		= UI:GetParamVals( self.shipItem.defName, paramInfo, UI.paramSrcTypes.SHIP, dataCur, false )
            	local valsChosen	= self.chosenNodesMask and UI:GetParamVals( self.shipItem.defName, paramInfo, UI.paramSrcTypes.SHIP, dataChosen, false )

        		local strVal = self:ParamVals2Str( paramInfo, valsBase, valsCur, valsChosen )

        		if strVal ~= "" then

        			local strName = UI:ShipParam2Str( paramInfo )
        			local strParam = string.format( "%s: %s", strName, strVal )

        			str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strParam )

        		end

			end

    	end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:UpdateParams()[ERROR]: no ship item" )
	end

	self:SetText( str, self.layers.PARAMS )	

end


-- переработанная UI:ParamVals2Str(), с учетом того, что значение берется из сравнения с одними данными, а цвет из сравнения с другими
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:ParamVals2Str( paramInfo, valsBase, valsCur, valsChosen )

	local str = ""

	if #valsBase ~= #valsCur or ( valsChosen and #valsBase ~= #valsChosen ) then
		sys.log( "UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:ParamVals2Str()[ERROR]: mismatch number of vals (ship %s, param %s)", self.shipDefName, paramInfo.name )
		return	str
	end

	local tStr			= {}
	local baseColor		= self:GetColor( self.layers.PARAMS )
	local valColor		= baseColor
	local strBaseColor	= UI:Color2Str( baseColor )
	local strValColor	= UI:Color2Str( valColor )
	local bHasDelta		= false

	for valIdx, valBase in ipairs( valsBase ) do

		local valCur = valsCur[ valIdx ]

		local deltaCur = valCur - valBase
		if math.abs( deltaCur ) < 1e-2 then
			deltaCur = 0
		end

		local valChosen		= nil
		local deltaChosen	= 0

		if valsChosen then

			valChosen = valsChosen[ valIdx ]

    		deltaChosen = valChosen - valBase
    		if math.abs( deltaChosen ) < 1e-2 then
    			deltaChosen = 0
    		end

		end

		local strVal = ""

		-- параметр отображается, если он изменился относительно базового либо в примененном, либо в желаемом состоянии 
		if deltaCur ~= 0 or deltaChosen ~= 0 then

			bHasDelta = true

			-- число, которое рисуется - это разница между желаемым (если есть) или примененным (если нет желаемого) и базовым
			local delta = valsChosen and deltaChosen or deltaCur

			-- цвет - зависит от разницы между желаемым и примененным
			local color = valColor

			local deltaChosenCur = 0

			if valsChosen then
				deltaChosenCur = valChosen - valCur
        		if math.abs( deltaChosenCur ) < 1e-2 then
        			deltaChosenCur = 0
        		end				
			end

			if deltaChosenCur ~= 0 then

    			local bIsNegativeParam = false

    			if paramInfo.negative ~= nil then

    				if type( paramInfo.negative ) == "boolean" then
    					bIsNegativeParam = paramInfo.negative

    				elseif type( paramInfo.negative ) == "table" then

    					if type( paramInfo.negative[ valIdx ] ) == "boolean" then
    						bIsNegativeParam = paramInfo.negative[ valIdx ]
    					else
    						sys.log( "UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:ParamVals2Str()[ERROR]: invalid type of \"negative[%d]\" for param \"%s\"; \"boolean\" expected, got \"%s\"", valIdx, paramInfo.name, type( paramInfo.negative[ valIdx ] ) )
    					end

    				else
    					sys.log( "UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:ParamVals2Str()[ERROR]: invalid type of \"negative\" for param \"%s\"; \"boolean\" or \"table\" expected, got \"%s\"", paramInfo.name, type( paramInfo.negative ) )
    				end

    			end

    			local bIsBetter = ( bIsNegativeParam and deltaChosenCur < 0 ) or ( not bIsNegativeParam and deltaChosenCur > 0 )
				color = bIsBetter and UI.PARAM_DELTA_PLUS_COLOR or UI.PARAM_DELTA_MINUS_COLOR

			end

			strVal = UI:ParamVal2Str( paramInfo, math.abs( delta ) )
    		strVal = string.format( "%s%s", delta >= 0 and "+" or "-", strVal )
			strVal = string.format( "%s%s%s", UI:Color2Str( color ), strVal, strBaseColor )

		end


		-- индивидуальные единицы измерения для каждого значения (могут быть общие, тогда они обрабтаются после всех значений)

		if strVal ~= "" then

    		local strUnits = UI:ParamUnits2Str( paramInfo, valIdx )
			if strUnits ~= "" then
    			strVal = string.format( "%s %s", strVal, strUnits )
			end

		end

		tStr[ valIdx ] = strVal

	end


	-- fix delta

	if not bHasDelta then
		return str
	end

	for strIdx = 1, #tStr do
		if UI:IsStrEmpty( tStr[ strIdx ] ) then
			tStr[ strIdx ] = string.format( "%s0%s", strValColor, strBaseColor )
		end
	end

	local numStr = #tStr
	if numStr > 1 then

		if type( paramInfo.concat ) == "string" then
			str = string.format( paramInfo.concat, unpack( tStr ) )
		else
			sys.log( "UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:ParamVals2Str()[ERROR]: cannot find \"concat\" in param \"%s\" or it is of invalid type", tostring( paramInfo.name ) )
			str = table.concat( tStr, ", " )
		end

	elseif numStr == 1 then
		str = tStr[ 1 ]
	end

	-- общие единицы измерения для всех значений (могут быть индивидуальные для каждого значения, тогда они уже добавились при обработке этого значения)

	if str ~= "" then

		local strUnits = UI:ParamUnits2Str( paramInfo, -1 )
		if strUnits ~= "" then
			str = string.format( "%s %s", str, strUnits )
		end

	end
	
	if str ~= "" then
		str = string.format( "%s%s", strBaseColor, str )
	end

	return str

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selfSize = mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	self:SetWidth( selfSize.x )

end


--
function UI.ShipsTree_EvolvingEdit_ChangedParamsWnd:RecalcLayout()

	-- высота слоя параметров

	local formatRect = UI:Quat( 0, 0, self:GetLayerWidth( self.layers.PARAMS ), 10000000 )

    local paramsHeight = _G.MeasureText(
   		self:GetText( self.layers.PARAMS ),
   		self:GetFont( self.layers.PARAMS ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.PARAMS ),
    	formatRect ).w

	self:SetLayerHeight( paramsHeight, self.layers.PARAMS )


	-- собственная высота

	local selfHeight = self:GetLayerTop( self.layers.PARAMS ) + paramsHeight
	self:SetHeight( selfHeight )

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_ChangedParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_ChangedParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_AlienEdit_ChangedParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_ChangedParamsWnd",

	props =
	{
		name	= "ShipsTree_AlienEdit_ChangedParamsWnd",
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
				defName 			= "shipsTree_alienEdit_changedParams",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "prop_text",
						layer		= "UI.ShipsTree_EvolvingEdit_ChangedParamsWnd.layers.PARAMS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_ChangedParamsWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_ChangedParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialEdit_ChangedParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_ChangedParamsWnd",

	props =
	{
		name	= "ShipsTree_SpecialEdit_ChangedParamsWnd",
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
				defName 			= "shipsTree_specialEdit_changedParams",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "prop_text",
						layer		= "UI.ShipsTree_EvolvingEdit_ChangedParamsWnd.layers.PARAMS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_BonusesWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_BonusesWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_BonusesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_BonusesWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipsTree_alienEdit_bonuses",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:Reset()

	self.shipDefName		= ""
	self.chosenNodesMask	= nil
	self.shipItem			= nil

	self:ResetSlots()

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:HasBonuses()

	return next( self.curSlots ) ~= nil

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:OnOwnedVessels()

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:OnVesselLevelUp()

	-- ничего не надо делать, отображаемое значение от уровня синергии не зависит никак

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_BonusesWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.ShipsTree_EvolvingEdit_BonusesWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "bonus_slot_"
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_BonusesWnd.shipDefName		= ""
UI.ShipsTree_EvolvingEdit_BonusesWnd.chosenNodesMask	= nil
UI.ShipsTree_EvolvingEdit_BonusesWnd.shipItem			= nil
UI.ShipsTree_EvolvingEdit_BonusesWnd.allSlots			= {}
UI.ShipsTree_EvolvingEdit_BonusesWnd.curSlots			= {}
UI.ShipsTree_EvolvingEdit_BonusesWnd.space_slots		= 0
UI.ShipsTree_EvolvingEdit_BonusesWnd.space_top_slots	= 0
UI.ShipsTree_EvolvingEdit_BonusesWnd.space_slots_btm	= 0
UI.ShipsTree_EvolvingEdit_BonusesWnd.slotsX				= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.allSlots	= {}
	self.curSlots	= {}

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:CreateControls()

	for slotIdx = 1, 3 do
		self:CreateSlot()
	end

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:FullUpdate()

	self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )

	self:UpdateSlots()

	self:RecalcLayout()

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:UpdateSlots()

	self:ResetSlots()

	if not self.shipItem then
		sys.log( "UI.ShipsTree_EvolvingEdit_BonusesWnd:UpdateSlots()[ERROR]: no ship item" )
		return
	end

	local bonusesInfos = {}

	local nodes				= UI:GetEvolvingShipNodes( self.shipDefName )
	local activeNodesMask	= self.chosenNodesMask or UI:GetEvolvingShipActiveNodesMask( self.shipItem.vid )

	local nodesById = {}
	for nodeName, node in pairs( nodes ) do
		local nodeId = UI:GetEvolvingShipNodeId( nodeName )
		if nodeId ~= -1 then
			nodesById[ nodeId ] = node
		else
			sys.log( "UI.ShipsTree_EvolvingEdit_BonusesWnd:UpdateSlots()[ERROR]: invalid nodeId for node \"%s\"", nodeName )
		end
	end

	local MAX_ID = 63
	for nodeId = 0, MAX_ID do

		if UI:BitTstU64( activeNodesMask, nodeId ) then

			local node = nodesById[ nodeId ]
			if node then

        		if UI:IsEvolvingShipNodeOfTypeShipBonus( node.name ) then

        			local bonuses = UI:GetEvolvingShipNodeShipBonuses( node.name )

					for bonusName, bonusVal in pairs( bonuses ) do

        				if type( bonusName ) == "string" and type( bonusVal ) == "number" then

							local bonusInfo =
							{
								nodeName	= node.name,
								bonusName	= bonusName,
							}

							table.insert( bonusesInfos, bonusInfo )

        				else
        					sys.log( "UI.ShipsTree_EvolvingEdit_BonusesWnd:UpdateSlots()[ERROR]: invalid format of bonuses for node %s; <string>=<number> expected, got <%s>=<%s>", nodeName, type( bonusName ), type( bonusVal ) )
        				end

					end

				end

			else
				sys.log( "UI.ShipsTree_EvolvingEdit_BonusesWnd:UpdateSlots()[ERROR]: invalid unlocked node - cannot find child node with id %d for ship \"%s\"", nodeId, self.shipDefName )
			end

		end

	end

	local function fnSort( bonusInfo1, bonusInfo2 )
		return bonusInfo1.bonusName < bonusInfo2.bonusName
	end

	table.sort( bonusesInfos, fnSort )

	for bonusIdx, bonusInfo in ipairs( bonusesInfos ) do

		local slotWnd = self:ObtainFreeSlot()
		if slotWnd then
			slotWnd:Setup( bonusInfo.bonusName, bonusInfo.nodeName, self.shipDefName )
		end

	end

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_EvolvingEdit_BonusSlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	end

	return slotWnd

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:ObtainFreeSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateSlot()
	end

	if freeSlotWnd then
		table.insert( self.curSlots, freeSlotWnd )
		self:AddChild( freeSlotWnd )
	end

	return freeSlotWnd

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local slotWnd		= self.allSlots[ 1 ]

	local NUM_SLOTS_IN_EFFECT = 3

	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local firstSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, 2 ) ) or Vec2( 0, 0 )
	local lastSlotPos	= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotLocatorPrefix, NUM_SLOTS_IN_EFFECT ) ) or Vec2( 0, 0 )
	local slotSize		= slotWnd and Vec2( slotWnd:GetWidth(), slotWnd:GetBaseHeight() ) or Vec2( 0, 0 )

    self.space_slots		= secondSlotPos.y - ( firstSlotPos.y + slotSize.y )
    self.space_top_slots	= firstSlotPos.y
    self.space_slots_btm	= selfSize.y - ( lastSlotPos.y + slotSize.y )
    self.slotsX				= firstSlotPos.x

	self:SetWidth( selfSize.x )

end


--
function UI.ShipsTree_EvolvingEdit_BonusesWnd:RecalcLayout()

	local slotY = self.space_top_slots

	for slotIdx, slotWnd in ipairs( self.curSlots ) do

		slotWnd:SetLeft( self.slotsX )
		slotWnd:SetTop( slotY )

		slotY = slotY + slotWnd:GetHeight() + self.space_slots

	end

	local selfHeight = 0

	if next( self.curSlots ) then
		local lastSlotWnd = self.curSlots[ #self.curSlots ]
		selfHeight = lastSlotWnd:GetTop() + lastSlotWnd:GetHeight() + self.space_slots_btm		
	end

	self:SetHeight( selfHeight )

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_BonusSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_BonusSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_BonusSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_BonusSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipsTree_alienEdit_bonusSlot",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "title",
						layer		= "UI.ShipsTree_EvolvingEdit_BonusSlotWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.SIZE,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:Setup( bonusName, nodeName, shipDefName )

	self:Reset()

	self.bonusName		= bonusName
	self.nodeName		= nodeName
	self.shipDefName	= shipDefName

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:Reset()

	self.bonusName		= ""
	self.nodeName		= ""
	self.shipDefName	= ""

	self:SetText( "", self.layers.TEXT )

	self:RacalLayout()

end


--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:GetBaseHeight()

	return self.maxHeight

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_BonusSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    TEXT		= 1,
}

UI.ShipsTree_EvolvingEdit_BonusSlotWnd.effectInfo =
{
	main =
	{
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
		textLocator		= "title",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_BonusSlotWnd.bonusName		= ""
UI.ShipsTree_EvolvingEdit_BonusSlotWnd.nodeName			= ""
UI.ShipsTree_EvolvingEdit_BonusSlotWnd.shipDefName		= ""
UI.ShipsTree_EvolvingEdit_BonusSlotWnd.minHeight		= 0
UI.ShipsTree_EvolvingEdit_BonusSlotWnd.maxHeight		= 0
UI.ShipsTree_EvolvingEdit_BonusSlotWnd.space_text_btm	= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:PrepareLayout()

end


--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:FullUpdate()

	self:UpdateText()
	self:RacalLayout()

end


--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:UpdateText()

	local str = ""

    local shipDescParams = UI:GetShipDescParams( shipDefName )

	local shipDescParamInfo = nil

	for paramIdx, paramInfo in pairs( shipDescParams ) do
		if paramInfo.valField == self.bonusName then
			shipDescParamInfo = paramInfo
			break
		end
	end

	if shipDescParamInfo then

		local bonusData =
		{
			paramInfo		= shipDescParamInfo,
			vals			= UI:GetParamVals( self.nodeName, shipDescParamInfo, UI.paramSrcTypes.SHIP_NODE, nil, false, nil, nil, true ),
			synergyLevel	= -1,				
		}

		str = UI:ShipDescParam2Str( bonusData, self:GetColor( self.layers.TEXT ), nil, self.shipDefName, -1, false )

	else
		sys.log( "ShipsTree_EvolvingEdit_BonusSlotWnd:UpdateText()[ERROR]: cannot find ship desc param to show bonus %s for node %s", self.bonusName, self.nodeName )
	end

	if str == "" then
		sys.log( "ShipsTree_EvolvingEdit_BonusSlotWnd:UpdateText()[ERROR]: cannot make string for bonus \"%s\" for node \"%s\"", self.bonusName, self.nodeName )
		str = "error"
	end

	self:SetText( str, self.layers.TEXT )

end


--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local minSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local maxSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator )  or Vec2( 0, 0 )
	local textPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.textLocator )  or Vec2( 0, 0 )
	local textSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.textLocator )  or Vec2( 0, 0 )

	self.minHeight		= minSize.y
	self.maxHeight		= maxSize.y
	self.space_text_btm	= maxSize.y - ( textPos.y + textSize.y )

	self:SetWidth( maxSize.x )
	self:SetLayerWidth( textSize.x, self.layers.TEXT )

end


--
function UI.ShipsTree_EvolvingEdit_BonusSlotWnd:RacalLayout()

	-- высота текстового слоя

	local formatRect = Quat( 0, 0, self:GetLayerWidth( self.layers.TEXT ), 1000000 )

    local textHeight = _G.MeasureText(
   		self:GetText( self.layers.TEXT ),
   		self:GetFont( self.layers.TEXT ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.TEXT ),
    	formatRect).w

	self:SetLayerHeight( textHeight, self.layers.TEXT )


	-- собственная высота

	local selfHeight = self:GetLayerTop( self.layers.TEXT ) + textHeight + self.space_text_btm
	selfHeight = UI:Clamp( selfHeight, self.minHeight, self.maxHeight )

	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - self.minHeight ) / ( self.maxHeight - self.minHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_EvolvingEdit_SurvivabilityWnd
-- ------------------------------------------------------------

UI.ShipsTree_EvolvingEdit_SurvivabilityWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_EvolvingEdit_SurvivabilityWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "shipsTree_alienEdit_survivability",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_survival",
						layer		= "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "vol_survival",
						layer		= "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL,
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
		},

		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:Reset()

	self.shipDefName		= ""
	self.chosenNodesMask	= nil
	self.shipItem			= nil

	self.valMetaText:SetText( "", true )

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:OnOwnedVessels()

	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask
	
	self:FullUpdate()

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:OnEventInvItemsChanged()

	self:FullUpdate()
	
end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:OnVesselLevelUp()

	self:FullUpdate()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
    VAL			= 2,
}

UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.paramName = "effective_health"

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.shipDefName		= ""
UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.chosenNodesMask	= nil
UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.shipItem			= nil
UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.valMetaText		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.valMetaText = UI.MetaText.GetNewInstance()
	self.valMetaText:InitFromLayer( self, self.layers.VAL )

	self:InitCaption()

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:F_Shutdown()

	if self.valMetaText then
		self.valMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:UpdateMetaTextPos()

	self.valMetaText:UpdateScreenOrgFromLayer( self, self.layers.VAL )

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.VAL then
		self.valMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:InitCaption()

	local str = UI:ShipParam2StrByName( self.paramName )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:FullUpdate()

	self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )

	self:UpdateVal()

end


--
function UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:UpdateVal()

	local str = ""

	if self.shipItem then

		local paramInfo = nil

    	local params = UI:GetShipTooltipAllParams( self.shipDefName )
    	for paramIdx, _paramInfo in pairs( params ) do

			if _paramInfo.name == self.paramName then
				paramInfo = _paramInfo
				break
			end

		end

		if paramInfo then

        	local dataCur = { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.shipItem.vid, true, nil ) ) }
        	local valsCur = UI:GetParamVals( self.shipItem.defName, paramInfo, UI.paramSrcTypes.SHIP, dataCur, false )

			local valsToShow = nil

			if self.chosenNodesMask then
        		local dataChosen = { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.shipItem.vid, true, self.chosenNodesMask ) ) }
        		valsToShow = UI:GetParamVals( self.shipItem.defName, paramInfo, UI.paramSrcTypes.SHIP, dataChosen, false )
			else
				valsToShow = valsCur
			end

			local bIsBetter	= false
			local bIsWorse	= false

			if #valsToShow == 1 and #valsCur == 1 then

				local valToShow	= valsToShow[ 1 ]
				local valCur	= valsCur[ 1 ]
				local bNegative	= paramInfo.negative == true

				if valToShow < valCur then

        			if bNegative then
						bIsBetter = true
					else
						bIsWorse = true
					end

				elseif valToShow > valCur then

        			if bNegative then
						bIsWorse = true
					else
						bIsBetter = true
					end

				end

			else
				sys.log( "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:UpdateVal()[ERROR]: unhandled case - exactly one val expected" )
			end			

			local color = self:GetColor( self.layers.VAL )

			if bIsBetter then
				color = UI.PARAM_DELTA_PLUS_COLOR
			elseif bIsWorse then
				color = UI.PARAM_DELTA_MINUS_COLOR
			end

    		local strVal = UI:ParamVals2Str( paramInfo, valsToShow, nil, false, color, color, false, false )

    		if strVal ~= "" then

				local arrowIcoMetaString = ""

				local arrowIcoTexName = ""
				if bIsBetter then
					arrowIcoTexName = "arrow_up"
				elseif bIsWorse then
					arrowIcoTexName = "arrow_down"
				end

				if arrowIcoTexName ~= "" then
					arrowIcoMetaString = string.format( "$texture [texName %s][ignoreFontSize true][alignment CENTER][color %u]$", arrowIcoTexName, UI.WHITE_COLOR )
				end

    			str = string.format( "%s%s", strVal, arrowIcoMetaString )

			else
				sys.log( "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:UpdateVal()[ERROR]: fail to convert vals to string" )
    		end

		else
			sys.log( "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:UpdateVal()[ERROR]: cannot find info for parameter \"%s\"", self.paramName )
		end

	else
		sys.log( "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd:UpdateVal()[ERROR]: no ship item" )
	end

	self.valMetaText:SetText( str, true )

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienEdit_SurvivabilityWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienEdit_SurvivabilityWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_AlienEdit_SurvivabilityWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_SurvivabilityWnd",

	props =
	{
		name		= "ShipsTree_AlienEdit_SurvivabilityWnd",
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
				defName 			= "shipsTree_alienEdit_survivability",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_survival",
						layer		= "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "vol_survival",
						layer		= "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	},
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialEdit_SurvivabilityWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialEdit_SurvivabilityWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialEdit_SurvivabilityWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_EvolvingEdit_SurvivabilityWnd",

	props =
	{
		name		= "ShipsTree_SpecialEdit_SurvivabilityWnd",
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
				defName 			= "shipsTree_specialEdit_survivability",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_survival",
						layer		= "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "vol_survival",
						layer		= "UI.ShipsTree_EvolvingEdit_SurvivabilityWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	},
}

-- ------------------------------------------------------------
-- UI.ShipsTree_Tree2Wnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree2Wnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.ShipsTree_Tree2Wnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree2Wnd",
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
		}
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_Tree2Wnd:Reset()

	self.slotsWnd:Reset()
	self:ResetScrollBar()

end


--
function UI.ShipsTree_Tree2Wnd:FullUpdate()

	self:Reset()

	if UI.ShipsTreeWnd:GetSelRace() ~= ai.Race[ self.raceName ] then
		return
	end

	self.slotsWnd:FullUpdate()

	self:RecalcLayout()

	self:ValidateScrollPos()

end


--
function UI.ShipsTree_Tree2Wnd:CenterOnShip( defName )

	if not self.scrollBar:IsChildOf( self ) then
		return
	end

	local shipSlotWnd = self:GetShipSlot( defName )
	if not shipSlotWnd then
		sys.log( "UI.ShipsTree_Tree2Wnd:CenterOnShip()[ERROR]: cannot find slot for ship \"%s\"", defName )
		return
	end

	local slotCenterY	= shipSlotWnd:GetTop() + shipSlotWnd:GetHeight() * 0.5
	local scrollPos		= slotCenterY - self.maskWnd:GetHeight() * 0.5

	self.scrollBar:SetPos( scrollPos )
	
end


--
function UI.ShipsTree_Tree2Wnd:GetShipSlot( defName )

	return self.slotsWnd:GetShipSlot( defName )

end


--
function UI.ShipsTree_Tree2Wnd:GetScrollPos()

	return self.scrollBar:GetPos()

end


--
function UI.ShipsTree_Tree2Wnd:GetPosToSave()

	return self.scrollBar:GetPos()

end


--
function UI.ShipsTree_Tree2Wnd:GetSlotsWndSize()

	return UI:Vec2( self.slotsWnd:GetWidth(), self.slotsWnd:GetHeight() )

end


--
function UI.ShipsTree_Tree2Wnd:OnOwnedVessels()

	self.slotsWnd:OnOwnedVessels()

end


--
function UI.ShipsTree_Tree2Wnd:OnBattleSlotsChanged()

	self.slotsWnd:OnBattleSlotsChanged()

end


--
function UI.ShipsTree_Tree2Wnd:OnHangarPrepareStateChanged()

	self.slotsWnd:OnHangarPrepareStateChanged()

end


--
function UI.ShipsTree_Tree2Wnd:OnShipsTreePanelChanged()

	self:RecalcLayout()

end


--
function UI.ShipsTree_Tree2Wnd:OnPlayerAccountRankChanged()

	self.slotsWnd:OnPlayerAccountRankChanged()

end


--
function UI.ShipsTree_Tree2Wnd:OnShipDisabledByTimeChanged( defName )

	self.slotsWnd:OnShipDisabledByTimeChanged( defName )
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_Tree2Wnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.ShipsTree_Tree2Wnd.effectInfo =
{
	main =
	{
		scrollBarLocator	= "scroll",		
	}
}

UI.ShipsTree_Tree2Wnd.space_list_scrollBar	= UI:XTo1024x768( 10, { x = 1280, y = 720 } )

UI.ShipsTree_Tree2Wnd.raceName 			= ""
UI.ShipsTree_Tree2Wnd.slotsWndTableName	= ""

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree2Wnd.scrollBar				= nil
UI.ShipsTree_Tree2Wnd.maskWnd				= nil
UI.ShipsTree_Tree2Wnd.slotsWnd				= nil
UI.ShipsTree_Tree2Wnd.space_scrollBar_btm	= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree2Wnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()
	self:PrepareLayout()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_VSCROLL_CHANGE )	

end


--
function UI.ShipsTree_Tree2Wnd:CreateControls()

	self.scrollBar	= UI:CreateChildWnd( self, UI.ShipsTree_Tree2_ScrollBarWnd, "" )
	self.maskWnd	= UI:CreateChildWnd( self, UI.ShipsTree_Tree2_MaskWnd, "" )
	self.slotsWnd	= UI:CreateWndFromTable( self.slotsWndTableName )

	self:AddChild( self.maskWnd )
	self.maskWnd:AddChild( self.slotsWnd )	

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.scrollBar, mainEffect, self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.POS )

end


--
function UI.ShipsTree_Tree2Wnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selfSize		= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local scrollBarPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.scrollBarLocator ) or Vec2( 0, 0 )
	local scrollBarSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.scrollBarLocator ) or Vec2( 0, 0 )

	self.space_scrollBar_btm	= selfSize.y - ( scrollBarPos.y + scrollBarSize.y )

end


--
function UI.ShipsTree_Tree2Wnd:RecalcLayout()

	-- собственный размер

	local selfWidth 	= 1024	-- на всю ширину экрана
	local selfHeight	= UI.ShipsTreeWnd:GetShipsAvailableHeight()

	self:SetWidth( selfWidth )
	self:SetHeight( selfHeight )

	-- размер маски

	self.maskWnd:SetWidth( selfWidth )
	self.maskWnd:SetHeight( selfHeight )

	-- скроллбар

	self:UpdateScrollBar()

end


-- апдейт скроллбара, зависимый от содержимого дерева
function UI.ShipsTree_Tree2Wnd:UpdateScrollBar()

	-- размер

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local scrollEffect	= UI:GetEffectFromLayer( self.scrollBar, self.scrollBar.layers.MAIN_EFFECT )
	local selfHeight	= self:GetHeight()

	if mainEffect and scrollEffect then

		local needHeight	= selfHeight - self.space_scrollBar_btm - self.scrollBar:GetTop()
		local baseSize		= scrollEffect:GetObjSize( "self" )

		local scale_y = needHeight / baseSize.y
		scrollEffect:SetScale( UI:Vec2( 1, scale_y ) )

		self.scrollBar:SetWidth( baseSize.x )
		self.scrollBar:SetHeight( needHeight )

	end

	-- page

	self.scrollBar:SetPageSize( selfHeight )


	-- range
	
	local slotsHeight	= self.slotsWnd:GetHeight()
	local maskHeight	= self.maskWnd:GetHeight()

	local scrollMin	= 0
	local scrollMax	= slotsHeight - maskHeight

	scrollMax = math.max( scrollMax, scrollMin )
	self.scrollBar:SetRange( scrollMin, scrollMax )

	-- видимость

	if math.abs( scrollMax - scrollMin ) > 1e-3 then
		self:AddChild( self.scrollBar )
	else
		self.scrollBar:UnlinkFromParent()
	end	

end


--
function UI.ShipsTree_Tree2Wnd:ResetScrollBar()

	self.scrollBar:SetRange( 0, 0 )
	self.scrollBar:UnlinkFromParent()

end


--
function UI.ShipsTree_Tree2Wnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	if not self:IsOnScreen() then
		return
	end

	self:OnScrollPosChanged()

	if eventSrc ~= UI.SCROLL_SRC_UNKNOWN then
		_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_VESSEL_TREE_SCROLL )
	end

end


--
function UI.ShipsTree_Tree2Wnd:OnScrollPosChanged()

	local scrollPos	= self:GetScrollPos()
	local y			= -scrollPos

	self.slotsWnd:SetTop( UI:YRel2Snapped( y ) )

end


--
function UI.ShipsTree_Tree2Wnd:RestoreScrollPos()

	local profile = _G.GetProfileTable()

	if type( profile.shipsTree ) ~= "table" then	
		return false
	end
	
	if type( profile.shipsTree.alienPos ) ~= "number" then	
		return false
	end

	if profile.shipsTree.alienPos < 0 then
		return false
	end

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( profile.shipsTree.alienPos )
	end

	return true

end


--
function UI.ShipsTree_Tree2Wnd:SetDefaultScrollPos()

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( self.slotsWnd:GetSlotsYFix() )
	end

end


--
function UI.ShipsTree_Tree2Wnd:ValidateScrollPos()

	if not self:RestoreScrollPos() then
		self:SetDefaultScrollPos()
	end

end


--
function UI.ShipsTree_Tree2Wnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end	

	if self.scrollBar:IsChildOf( self ) then
		self.scrollBar:SetPos( self.scrollBar:GetPos() - ticks * self.scrollBar:GetStepSize(), UI.SCROLL_SRC_WHEEL )
	end

	return true

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienTreeWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienTreeWnd =
{
    def =
    {
    	className	= "Wnd",
		prototype	= "ShipsTree_Tree2Wnd",

    	props =
    	{
    		name		= "ShipsTree_AlienTreeWnd",
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
    				defName 			= "shipsTree_alienShips",
    				defaultAnimation	= "idle",
    			}}
    		}
    	},
    },

	raceName 			= "CRYSTAL",
	slotsWndTableName	= "UI.ShipsTree_AlienTree_ShipsSlotsWnd",
}

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialTreeWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialTreeWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialTreeWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_Tree2Wnd",

	props =
	{
		name		= "ShipsTree_SpecialTreeWnd",
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
				defName 			= "shipsTree_specialShips",
				defaultAnimation	= "idle",
			}}
		}
	},
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_SpecialTreeWnd:OnShipSlotLayoutChanged( slotWnd )

	self.slotsWnd:OnShipSlotLayoutChanged( slotWnd )
	self:RecalcLayout()

end


--
function UI.ShipsTree_SpecialTreeWnd:OnPlayerCreditsChanged()

	self.slotsWnd:OnPlayerCreditsChanged()

end


--
function UI.ShipsTree_SpecialTreeWnd:OnAccountAurasChanged()

	self.slotsWnd:OnAccountAurasChanged()

end


--
function UI.ShipsTree_SpecialTreeWnd:OnShipQuestStateChanged()

	self.slotsWnd:OnShipQuestStateChanged()

end


--
function UI.ShipsTree_SpecialTreeWnd:OnResourcesChanged()

	self.slotsWnd:OnResourcesChanged()

end


--
function UI.ShipsTree_SpecialTreeWnd:OnQuestsChanged()

	self.slotsWnd:OnQuestsChanged()
	
end


--
function UI.ShipsTree_SpecialTreeWnd:OnVesselLevelUp( vid )

	self.slotsWnd:OnVesselLevelUp( vid )

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_SpecialTreeWnd.raceName 			= "SPECIAL"
UI.ShipsTree_SpecialTreeWnd.slotsWndTableName	= "UI.ShipsTree_SpecialTree_ShipsSlotsWnd"

-- ------------------------------------------------------------
-- UI.ShipsTree_Tree2_MaskWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree2_MaskWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_Tree2_MaskWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_Tree2_MaskWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},

	layers =
	{
		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			layerStyle	= UI.WLS_RESIZABLE,
			texture		= "white",
			color		= 0x4400ffff,
			visible		= false,
		}
	},
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_Tree2_MaskWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.ShipsTree_Tree2_MaskWnd.parent	= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_Tree2_MaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )                                                                                                                     

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.ShipsTree_Tree2_MaskWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	                                                                              	
	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого ообъекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.ShipsTree_Tree2_MaskWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.ShipsTree_Tree2_MaskWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end

-- ------------------------------------------------------------
-- UI.ShipsTree_Tree2_ScrollBarWnd
-- ------------------------------------------------------------

UI.ShipsTree_Tree2_ScrollBarWnd =
{
	def =
	{
		className	= "ScrollWnd",
		prototype	= "EffectScrollWnd_Vrt_2",

		props =
		{
			name		= "ShipsTree_Tree2_ScrollBarWnd",
			step		= UI:YTo1024x768( 30, { x = 1280, y = 720 } ),
			isPrototype	= true
		}	
	}
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienTree_ShipsSlotsWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienTree_ShipsSlotsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_AlienTree_ShipsSlotsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_AlienTree_ShipsSlotsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},	
}

-- ---------------------------------
-- interface definition
-- ---------------------------------

--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:Reset()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()		
	end

	self.curSlots = {}
	self.slotsYFix = 0

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:FullUpdate()

	self:Reset()

	local ships = UI.ShipsTreeWnd:GetShips()
	for defName, shipData in pairs( ships ) do

		local slotWnd = self:ObtainFreeSlot()
		slotWnd:Setup( defName )

	end

	self:RecalcLayout()

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:GetShipSlot( defName )

	local baseDefName = UI:GetEvolvingShipBaseDef( defName )
	if baseDefName == "" then
		sys.log( "UI.ShipsTree_AlienTree_ShipsSlotsWnd:GetShipSlot()[ERROR]: cannot find base def for ship \"defName\"", defName )
		return nil
	end

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		if slotWnd:GetBaseDefName() == baseDefName then
			return slotWnd
		end

	end

	return nil

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:OnOwnedVessels()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnOwnedVessels()
	end

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:OnBattleSlotsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnBattleSlotsChanged()
	end

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:OnHangarPrepareStateChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnHangarPrepareStateChanged()
	end

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:GetSlotsYFix()

	return self.slotsYFix

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:OnPlayerAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnPlayerAccountRankChanged()		
	end

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:OnShipDisabledByTimeChanged( defName )

	local slotWnd = self:GetShipSlot( defName )
	if slotWnd then
		slotWnd:OnShipDisabledByTimeChanged()
	end

end


-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_AlienTree_ShipsSlotsWnd.curSlots	= {}
UI.ShipsTree_AlienTree_ShipsSlotsWnd.allSlots	= {}
UI.ShipsTree_AlienTree_ShipsSlotsWnd.slotsYFix	= 0		-- насколько координаты смещены относительно прописанного дизайнерами (смещаются, если есть Y<0, чтобы нормально скроллировалось - #0081866); используется для установки дефолтной позиции скроллбара

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:CreateControls()

	for slotIdx = 1, 3 do
		self:CreateSlot()
	end

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:ObtainFreeSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allSlots ) do
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
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_AlienTree_ShipSlotWnd, tostring( #self.allSlots + 1 ) )
	table.insert( self.allSlots, slotWnd )

	return slotWnd

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:PrepareLayout()

	local selfWidth	= 1024	-- на всю ширину экрана
	self:SetWidth( selfWidth )	

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:RecalcLayout()

	self.slotsYFix = 0

	-- позиции слотов

	local slotsPoss	= {}
	local minSlotsY	= math.huge
	local maxSlotsY	= 0

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		local pos = self:DetectShipPos( slotWnd:GetBaseDefName() )
		slotsPoss[ slotIdx ] = pos

		if pos.y < minSlotsY then
			minSlotsY = pos.y
		end

		local slotBtm = pos.y + slotWnd:GetHeight()
		if slotBtm > maxSlotsY then
			maxSlotsY = slotBtm
		end

	end

	-- если есть слоты с координатами <0, то все слоты смещаются, чтобы нормально скроллировалось (#0081866)
	if minSlotsY < 0 then

		local yFix = -minSlotsY

		for slotIdx, pos in pairs( slotsPoss ) do
			slotsPoss[ slotIdx ].y = pos.y + yFix
		end

		maxSlotsY = maxSlotsY + yFix

		self.slotsYFix = yFix

	end

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		local pos = slotsPoss[ slotIdx ]
		slotWnd:SetPos( pos.x, pos.y )
	end

	-- собственный размер

	local selfHeight = maxSlotsY + UI.ShipsTreeWnd:GetPanelHeaderHeight()	-- дополнительное расстояние снизу, чтобы заголовок панели боевых слотов не скрывал нижнюю часть слотов при максимальной позиции скроллбара	
	self:SetHeight( selfHeight )

end


--
function UI.ShipsTree_AlienTree_ShipsSlotsWnd:DetectShipPos( defName )

	local pos = Vec2( 0, 0 )
	
	local def = UI:GetDef( defName )
	if not def then
		sys.log( "UI.ShipsTree_AlienTree_ShipsSlotsWnd:DetectShipPos()[ERROR]: cannot find _G.Def[\"%s\"]", defName )
		return pos
	end

	-- позиция в дефе указывается относительно центра - по горизонтали и вертикали,
	-- для мелкого масштаба интерфейса;
	-- соответствует середине слота корабля

	if type( def.ui_tree_x ) == "number" then
		pos.x = def.ui_tree_x
	else
		sys.log( "UI.ShipsTree_AlienTree_ShipsSlotsWnd:DetectShipPos()[ERROR]: invalid type of _G.Def[\"%s\"].ui_tree_x; \"number\" expected, got \"%s\"", defName, type( def.ui_tree_x ) )
	end

	if type( def.ui_tree_y ) == "number" then
		pos.y = def.ui_tree_y
	else
		sys.log( "UI.ShipsTree_AlienTree_ShipsSlotsWnd:DetectShipPos()[ERROR]: invalid type of _G.Def[\"%s\"].ui_tree_y; \"number\" expected, got \"%s\"", defName, type( def.ui_tree_y ) )
	end

	pos.x = UI:XTo1024x768( pos.x, { x = 1280, y = 720 } )	-- расстояния были прописаны, когда базовым было разрешение 1280*720
	pos.y = UI:YTo1024x768( pos.y, { x = 1280, y = 720 } )

	local slotWnd = self.allSlots[ 1 ]
	local slotCenterPos = slotWnd and slotWnd:GetCenterPos() or UI:ZeroVec2()

	pos.x = self:GetWidth() * 0.5 + pos.x - slotCenterPos.x
	pos.y = UI.ShipsTreeWnd:GetShipsAvailableHeight( true ) * 0.5 + pos.y - slotCenterPos.y

	return pos

end

-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialTree_ShipsSlotsWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialTree_ShipsSlotsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialTree_ShipsSlotsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "ShipsTree_SpecialTree_ShipsSlotsWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
	},	
}

-- ---------------------------------
-- interface definition
-- ---------------------------------

--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:Reset()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()		
	end

	self.curSlots = {}
	self.slotsYFix = 0

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:FullUpdate()

	self:Reset()

	local ships = UI.ShipsTreeWnd:GetShips()
	for defName, shipData in pairs( ships ) do

		local slotWnd = UI:IsShipEvolving( defName ) and self:ObtainFreeEvolvingSlot() or self:ObtainFreeRegularSlot()
		slotWnd:Setup( defName )

	end

	self:RecalcLayout()

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:GetShipSlot( defName )

	local baseDefName = UI:GetEvolvingShipBaseDef( defName )
	if baseDefName == "" then
		sys.log( "UI.ShipsTree_SpecialTree_ShipsSlotsWnd:GetShipSlot()[ERROR]: cannot find base def for ship \"defName\"", defName )
		return nil
	end

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		local slotDefName = ""

		if UI:IsWndKindOf( slotWnd, "ShipsTree_SpecialTree_ShipSlotWnd" ) then
			slotDefName = slotWnd:GetDefName()
		elseif UI:IsWndKindOf( slotWnd, "ShipsTree_SpecialTree_EvolvingShipSlotWnd" ) then
			slotDefName = slotWnd:GetBaseDefName()
		end

		if slotDefName == baseDefName then
			return slotWnd
		end

	end

	return nil

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnOwnedVessels()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnOwnedVessels()
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnBattleSlotsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnBattleSlotsChanged()
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnHangarPrepareStateChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:OnHangarPrepareStateChanged()
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:GetSlotsYFix()

	return self.slotsYFix

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnPlayerAccountRankChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd.OnPlayerAccountRankChanged then
			slotWnd:OnPlayerAccountRankChanged()
		end
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnPlayerCreditsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd.OnPlayerCreditsChanged then
			slotWnd:OnPlayerCreditsChanged()
		end
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnAccountAurasChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd.OnAccountAurasChanged then
			slotWnd:OnAccountAurasChanged()
		end
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnShipQuestStateChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd.OnShipQuestStateChanged then
			slotWnd:OnShipQuestStateChanged()
		end
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnResourcesChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd.OnResourcesChanged then
			slotWnd:OnResourcesChanged()
		end
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnQuestsChanged()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd.OnQuestsChanged then
			slotWnd:OnQuestsChanged()
		end
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnVesselLevelUp( vid )

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		if slotWnd.OnVesselLevelUp then
			slotWnd:OnVesselLevelUp( vid )
		end
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnShipSlotLayoutChanged( slotWnd )

	self:RecalcLayout()

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:OnShipDisabledByTimeChanged( defName )

	local slotWnd = self:GetShipSlot( defName )
	if slotWnd then
		slotWnd:OnShipDisabledByTimeChanged()
	end

end


-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_SpecialTree_ShipsSlotsWnd.curSlots			= {}
UI.ShipsTree_SpecialTree_ShipsSlotsWnd.allRegularSlots	= {}
UI.ShipsTree_SpecialTree_ShipsSlotsWnd.allEvolvingSlots	= {}
UI.ShipsTree_SpecialTree_ShipsSlotsWnd.slotsYFix		= 0		-- насколько координаты смещены относительно прописанного дизайнерами (смещаются, если есть Y<0, чтобы нормально скроллировалось - #0081866); используется для установки дефолтной позиции скроллбара

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateControls()
	self:PrepareLayout()

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:CreateControls()

	for slotIdx = 1, 1 do
		self:CreateRegularSlot()
	end

	for slotIdx = 1, 1 do
		self:CreateEvolvingSlot()
	end

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:ObtainFreeRegularSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allRegularSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateRegularSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	return freeSlotWnd	

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:ObtainFreeEvolvingSlot()

	local freeSlotWnd = nil

	for slotIdx, slotWnd in pairs( self.allEvolvingSlots ) do
		if not slotWnd:IsChildOf( self ) then
			freeSlotWnd = slotWnd
			break
		end
	end

	if not freeSlotWnd then
		freeSlotWnd = self:CreateEvolvingSlot()
	end

	table.insert( self.curSlots, freeSlotWnd )
	self:AddChild( freeSlotWnd )

	return freeSlotWnd	

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:CreateRegularSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_SpecialTree_ShipSlotWnd, tostring( #self.allRegularSlots + 1 ) )
	table.insert( self.allRegularSlots, slotWnd )

	return slotWnd

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:CreateEvolvingSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.ShipsTree_SpecialTree_EvolvingShipSlotWnd, tostring( #self.allEvolvingSlots + 1 ) )
	table.insert( self.allEvolvingSlots, slotWnd )

	return slotWnd

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:PrepareLayout()

	local selfWidth	= 1024	-- на всю ширину экрана
	self:SetWidth( selfWidth )	

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:RecalcLayout()

	self.slotsYFix = 0

	-- позиции слотов

	local slotsPoss	= {}
	local minSlotsY	= math.huge
	local maxSlotsY	= 0

	for slotIdx, slotWnd in pairs( self.curSlots ) do

		local defName = ""

		if UI:IsWndKindOf( slotWnd, "ShipsTree_SpecialTree_ShipSlotWnd" ) then
			defName = slotWnd:GetDefName()
		elseif UI:IsWndKindOf( slotWnd, "ShipsTree_SpecialTree_EvolvingShipSlotWnd" ) then
			defName = slotWnd:GetBaseDefName()
		end

		local pos = self:DetectShipPos( defName ) - slotWnd:GetCenterPos()
		slotsPoss[ slotIdx ] = pos

		if pos.y < minSlotsY then
			minSlotsY = pos.y
		end

		local slotBtm = pos.y + slotWnd:GetHeight()
		if slotBtm > maxSlotsY then
			maxSlotsY = slotBtm
		end

	end

	-- если есть слоты с координатами <0, то все слоты смещаются, чтобы нормально скроллировалось (#0081866)
	if minSlotsY < 0 then

		local yFix = -minSlotsY

		for slotIdx, pos in pairs( slotsPoss ) do
			slotsPoss[ slotIdx ].y = pos.y + yFix
		end

		maxSlotsY = maxSlotsY + yFix

		self.slotsYFix = yFix

	end

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		local pos = slotsPoss[ slotIdx ]
		slotWnd:SetPos( pos.x, pos.y )
	end

	-- собственный размер
	-- SC-112308 - добавляем некоторое расстояние, чтобы было не вплотную к нижней панели
	local resolution = { x = 1280, y = 720 }
	local space_btm = UI:YTo1024x768( 8, resolution )

	local selfHeight = maxSlotsY + space_btm + UI.ShipsTreeWnd:GetPanelHeaderHeight()	-- дополнительное расстояние снизу, чтобы заголовок панели боевых слотов не скрывал нижнюю часть слотов при максимальной позиции скроллбара	
	self:SetHeight( selfHeight )

end


--
function UI.ShipsTree_SpecialTree_ShipsSlotsWnd:DetectShipPos( defName )

	local pos = Vec2( 0, 0 )
	
	local def = UI:GetDef( defName )
	if not def then
		sys.log( "UI.ShipsTree_SpecialTree_ShipsSlotsWnd:DetectShipPos()[ERROR]: cannot find _G.Def[\"%s\"]", defName )
		return pos
	end

	-- позиция в дефе указывается относительно центра - по горизонтали и вертикали,
	-- для мелкого масштаба интерфейса;
	-- соответствует середине слота корабля

	if type( def.ui_tree_x ) == "number" then
		pos.x = def.ui_tree_x
	else
		sys.log( "UI.ShipsTree_SpecialTree_ShipsSlotsWnd:DetectShipPos()[ERROR]: invalid type of _G.Def[\"%s\"].ui_tree_x; \"number\" expected, got \"%s\"", defName, type( def.ui_tree_x ) )
	end

	if type( def.ui_tree_y ) == "number" then
		pos.y = def.ui_tree_y
	else
		sys.log( "UI.ShipsTree_SpecialTree_ShipsSlotsWnd:DetectShipPos()[ERROR]: invalid type of _G.Def[\"%s\"].ui_tree_y; \"number\" expected, got \"%s\"", defName, type( def.ui_tree_y ) )
	end

	pos.x = UI:XTo1024x768( pos.x, { x = 1280, y = 720 } )	-- расстояния были прописаны, когда базовым было разрешение 1280*720
	pos.y = UI:YTo1024x768( pos.y, { x = 1280, y = 720 } )

	pos.x = self:GetWidth() * 0.5 + pos.x
	pos.y = UI.ShipsTreeWnd:GetShipsAvailableHeight( true ) * 0.5 + pos.y

	return pos

end

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienTree_ShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_AlienTree_ShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.ShipsTree_AlienTree_ShipSlotWnd.layers =
{
    MAIN_EFFECT			= 0, 
	BATTLE_SLOT_EFFECT	= 1, 
	RANK				= 2, 
    ROLE_ICO_EFFECT		= 3, 
    SHIP_NAME			= 4, 
	LOCK_EFFECT			= 5, 
	LOCK_REASON			= 6,
	ADVERT_TEXT			= 7,
    IN_BATTLE_EFFECT	= 8,
}

--
UI.ShipsTree_AlienTree_ShipSlotWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name		= "ShipsTree_AlienTree_ShipSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.ShipsTree_AlienTree_ShipSlotWnd.layers.RANK,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shipsTree_alienTree_shipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					-- не линкуется по цвету
					{
						objName		= "rank",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role",	
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по цвету
					{
						objName		= "name",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "lock",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_indic_",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.BATTLE_SLOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "requir",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.LOCK_REASON",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sinergy",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.ADVERT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "indic3",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BATTLE_SLOT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_battleSlot",
				defaultAnimation	= "idle",
			}}
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ROLE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},

		-- SHIP_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_alienShipSlot_lock",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_REASON
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ADVERT_TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "ships_promoShip_text" ),
		},

		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_shipSlot_inBattle",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_AlienTree_ShipSlotWnd:Setup( baseDefName )

	self:Reset()

	self.baseDefName = baseDefName
	self:FullUpdate()

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:Reset()

	self.baseDefName			= ""
	self.shipItem				= nil

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	self.shipIcoWnd:Reset()
	
	self:SetLayerVisible( false, self.layers.IN_BATTLE_EFFECT )
	self:SetLayerVisible( false, self.layers.LOCK_EFFECT )
	self:SetLayerVisible( false, self.layers.BATTLE_SLOT_EFFECT )
	self:SetLayerVisible( false, self.layers.LOCK_REASON )
	self:SetLayerVisible( false, self.layers.ADVERT_TEXT )
	self:SetLayerVisible( false, self.layers.SHIP_NAME )
	self:SetLayerVisible( false, self.layers.RANK )
	self:SetLayerVisible( false, self.layers.ROLE_ICO_EFFECT )

	self:ResetBtn()

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:GetBaseDefName()

	return self.baseDefName

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:GetCurDefName()

	return self.shipItem and self.shipItem.defName or self.baseDefName

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:GetVid()

	return self.shipItem and self.shipItem.vid or UI.INVALID_U64_ID

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:GetShipItem()

	return self.shipItem

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:IsBought()

	return self.shipItem ~= nil

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:GetCenterPos()

	return self.centerPos

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:OnOwnedVessels()

	self.shipItem = UI:GetEvolvingShipItem( self.baseDefName )

	self:UpdateMainEffect()
	self:UpdateShipIco()
	self:UpdateShipName()
	self:UpdateRank()
	self:UpdateRoleIco()
	self:UpdateBattleSlot()
	self:UpdateBtn()
	self:UpdateInBattleEffect()
	self:UpdateLockEffect()
	self:UpdateTooltip()
	self:UpdateMouseOverEnable()
	self:UpdateLockReason()
	self:UpdateAdvertText()
	self:UpdateAdvertBtn()

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:OnBattleSlotsChanged()

	if self:IsBought() then

		self:UpdateBattleSlot()
		self:UpdateMouseOverEnable()

	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:OnHangarPrepareStateChanged()

	if self:IsBought() then
		self:UpdateMouseOverEnable()
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:OnPlayerAccountRankChanged()

	if not self:IsBought() then

		self:UpdateMainEffect()
		self:UpdateBtn()
		self:UpdateLockEffect()
		self:UpdateLockReason()

	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:GetShipDDData()

	if	not self:IsBought()
		or UI:IsShipInMatchmaking( self.shipItem )
		or UI:IsShipInBattle( self.shipItem )
		or UI:IsShipDisabledByTime( self.baseDefName )
		or UI.ShipsTreeWnd:IsWaiting() then
			return nil		
	end

	local ddData =
	{
		srcType		= UI.ShipDDWnd.srcTypes.TREE_SLOT,
		vid			= self.shipItem.vid,
	}

	return ddData

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:OnShipDisabledByTimeChanged()

	self:UpdateMainEffect()
	self:UpdateShipIco()
	self:UpdateBtn()
	self:UpdateLockEffect()
	self:UpdateMouseOverEnable()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_AlienTree_ShipSlotWnd.effectInfo =
{
	main =
	{
		animIdle			= "idle",
		animLocked			= "disable",
		btnLocator			= "btn",
		centerLocator		= "center",
		shipIcoLocator		= "ship_ico",
		advertBtnLocator	= "info_btn",
	},

	shipIco =
	{
		spriteName = "ship_ico",
	},

	roleIco =
	{
		spriteName = "ico",
	},

	battleSlot =
	{
		animIdle	= "idle",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.ShipsTree_AlienTree_ShipSlotWnd.baseDefName	= ""
UI.ShipsTree_AlienTree_ShipSlotWnd.buyBtn		= nil
UI.ShipsTree_AlienTree_ShipSlotWnd.editBtn		= nil
UI.ShipsTree_AlienTree_ShipSlotWnd.infoBtn		= nil
UI.ShipsTree_AlienTree_ShipSlotWnd.dlcBtn		= nil
UI.ShipsTree_AlienTree_ShipSlotWnd.shipItem		= nil
UI.ShipsTree_AlienTree_ShipSlotWnd.centerPos	= Vec2( 0, 0 )
UI.ShipsTree_AlienTree_ShipSlotWnd.shipIcoWnd	= nil
UI.ShipsTree_AlienTree_ShipSlotWnd.advertBtn	= nil

-- ---------------------------------
-- work function
-- ---------------------------------

--
function UI.ShipsTree_AlienTree_ShipSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.centerPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.centerLocator ) or Vec2( 0, 0 )

	self:CreateControls()

	local alienShipColor = UI:GetItemQualityColor( UI.ALIEN_SHIP_COLOR_ID )

	self:SetColor( alienShipColor, self.layers.RANK )
	self:SetColor( alienShipColor, self.layers.SHIP_NAME )

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetColor( alienShipColor )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:CreateControls()	

	self.buyBtn		= UI:CreateChildWnd( self, UI.ShipsTree_AlienTree_ShipBuyBtn, "" )
	self.editBtn	= UI:CreateChildWnd( self, UI.ShipsTree_AlienTree_ShipEditBtn, "" )
	self.infoBtn	= UI:CreateChildWnd( self, UI.ShipsTree_AlienTree_ShipInfoBtn, "" )
	self.shipIcoWnd	= UI:CreateChildWnd( self, UI.ShipsTree_Evolving_ShipIcoWnd, "" )
	self.advertBtn	= UI:CreateChildWnd( self, UI.ShipsTree_ShipAdvertBtn, "" )	
	self.dlcBtn		= UI:CreateChildWnd( self, UI.ShipsTree_DlcBtn, "" )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.shipIcoWnd, mainEffect, self.effectInfo.main.shipIcoLocator, UI.EffectAnimParams.POS )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:FullUpdate()

	self.shipItem = UI:GetEvolvingShipItem( self.baseDefName )

	self:UpdateMainEffect()
	self:UpdateShipIco()
	self:UpdateShipName()
	self:UpdateRank()
	self:UpdateRoleIco()
	self:UpdateBattleSlot()
	self:UpdateBtn()
	self:UpdateInBattleEffect()
	self:UpdateLockEffect()
	self:UpdateTooltip()
	self:UpdateMouseOverEnable()
	self:UpdateLockReason()
	self:UpdateAdvertText()
	self:UpdateAdvertBtn()

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateMainEffect()

	-- залоченная анимация делает серым иконку роли, ранг, имя

	local bLocked = false

	if self:IsBought() then
		if self:IsInBattle() or UI:IsShipDisabledByTime( self.baseDefName ) then
			bLocked = true
		end
	else
		if UI:IsShipAdvert( self.baseDefName ) or ( not UI:IsShipDlc( self.baseDefName ) and UI:GetItemRequiredAccountRank( self.baseDefName ) > UI:GetPlayerAccountRank() ) or UI:IsShipDisabledByTime( self.baseDefName ) then
			bLocked = true
		end
	end

	local anim = bLocked and self.effectInfo.main.animLocked or self.effectInfo.main.animIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateShipIco()

	local texName = UI:GetAlienShipTreeIcoName( self:GetCurDefName() )

	if self:IsBought() then

		if self:IsInBattle() or UI:IsShipDisabledByTime( self.baseDefName ) then
			texName = string.format( "%s_locked", texName )
		end

	else

		if UI:IsShipAdvert( self.baseDefName ) then
			texName = string.format( "%s_advert", texName )
		else
			texName = string.format( "%s_locked", texName )
		end

	end

	local hTex = UI:GetTex( texName )
	self.shipIcoWnd:SetTex( hTex )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateRank()

	local bAdvert, bByFlag = UI:IsShipAdvert( self.baseDefName ) 
	local bNeedRank = not bAdvert or bByFlag

	if bNeedRank then

		self:SetLayerVisible( true, self.layers.RANK )

    	local rank = UI:GetShipRank( self:GetCurDefName() )

    	local strRank = tostring( rank )
    	self:SetText( strRank, self.layers.RANK )

	else
		self:SetLayerVisible( false, self.layers.RANK )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateRoleIco()

	local bAdvert, bByFlag = UI:IsShipAdvert( self.baseDefName ) 
	local bNeedRole = not bAdvert or bByFlag

	if bNeedRole then

		self:SetLayerVisible( true, self.layers.ROLE_ICO_EFFECT )

    	local role = UI:GetItemRole( self.baseDefName )

    	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
    	if roleIcoEffect then
    		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, UI:GetRoleIco( role ) )
    	end

	else
		self:SetLayerVisible( false, self.layers.ROLE_ICO_EFFECT )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateShipName()

	local bAdvert, bByFlag = UI:IsShipAdvert( self.baseDefName ) 
	local bNeedName = not bAdvert or bByFlag

	if bNeedName then

		self:SetLayerVisible( true, self.layers.SHIP_NAME )

    	local defName = self:GetCurDefName()

    	local name = UI:GetEntityLocalizedNameByDef( defName, false )
    	self:SetText( name, self.layers.SHIP_NAME )

	else
		self:SetLayerVisible( false, self.layers.SHIP_NAME )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateBattleSlot()

	if self:IsBought() then

		self:SetLayerVisible( true, self.layers.BATTLE_SLOT_EFFECT )

		local slotId = UI:GetShipBattleSlot( self.shipItem )

		local anim = slotId ~= -1 and tostring( slotId ) or self.effectInfo.battleSlot.animIdle

    	local battleSlotEffect = UI:GetEffectFromLayer( self, self.layers.BATTLE_SLOT_EFFECT )
    	if battleSlotEffect then
    		battleSlotEffect:StartAnimation( anim )
    	end		

	else
		self:SetLayerVisible( false, self.layers.BATTLE_SLOT_EFFECT )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateInBattleEffect()

	self:SetLayerVisible( self:IsInBattle(), self.layers.IN_BATTLE_EFFECT )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateBtn()

	self:ResetBtn()

	local btn = nil

	if self:IsBought() then

		if self:IsInBattle() then
			btn = self.infoBtn
		else
			btn = self.editBtn
		end		

	else

		local bAdvert, bAdvertByFlag = UI:IsShipAdvert( self.baseDefName )

		if bAdvert then
		
    		if bAdvertByFlag then
    			btn = self.infoBtn
    		end
			
		else
		
			if UI:IsShipDisabledByTime( self.baseDefName ) then
				btn = self.infoBtn
			else
				if UI:IsShipDlc( self.baseDefName ) then
					btn = self.dlcBtn
				else
					if UI:GetItemRequiredAccountRank( self.baseDefName ) > UI:GetPlayerAccountRank() then
						btn = self.infoBtn
					else
						btn = self.buyBtn
					end
				end
			end
			
		end
		
	end

	if btn then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, btn, mainEffect, self.effectInfo.main.btnLocator, UI.EffectAnimParams.POS )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:ResetBtn()

	if self.buyBtn:IsChildOf( self ) then
		self.buyBtn:UnlinkFromParent()
	end

	if self.editBtn:IsChildOf( self ) then
		self.editBtn:UnlinkFromParent()
	end

	if self.infoBtn:IsChildOf( self ) then
		self.infoBtn:UnlinkFromParent()
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateTooltip()

	local tooltipData = nil

	local bAdvert, bAdvertByFlag = UI:IsShipAdvert( self.baseDefName )
	if not bAdvert or bAdvertByFlag then

    	tooltipData =
    	{
        	tooltipType		= UI.tooltipTypes.SHIP,
    		defName			= self:GetCurDefName(),
    		vid				= self.shipItem and self.shipItem.vid or UI.INVALID_U64_ID,
    		bCompare		= true,
    		logEvent		= _G.MasterServer.PlayerAction.PA_VESSEL_TREE_TOOLTIP,
    	}

	end

	self.shipIcoWnd:SetTooltipData( tooltipData )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateLockEffect()

	local bLockVisible =
		not self:IsBought()
		and not UI:IsShipAdvert( self.baseDefName )
		and ( not UI:IsShipDlc( self.baseDefName ) and UI:GetItemRequiredAccountRank( self.baseDefName ) > UI:GetPlayerAccountRank() ) or UI:IsShipDisabledByTime( self.baseDefName )

	self:SetLayerVisible( bLockVisible, self.layers.LOCK_EFFECT )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateMouseOverEnable()

	local bMouseOverEnabled =
		self:IsBought()
		and not self:IsInBattle()
		and not self:IsOnMatchmaking()
		and not UI:IsShipDisabledByTime( self.baseDefName )

	self.shipIcoWnd:EnableMouseOver( bMouseOverEnabled )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateLockReason()

	local text = ""

	if self:IsBought() then

		if self:IsInBattle() then
			text = UI:GetStringByName( "inBattle" )
			
		elseif UI:IsShipDisabledByTime( self.baseDefName  ) then
			text = UI:GetShipDisabledByTimeString( self.baseDefName )
		end

	else

		if not UI:IsShipAdvert( self.baseDefName ) and not UI:IsShipDlc( self.baseDefName ) then
		
			if UI:IsShipDisabledByTime( self.baseDefName  ) then
			
				text = UI:GetShipDisabledByTimeString( self.baseDefName )
				
			else

				local needRank	= UI:GetItemRequiredAccountRank( self.baseDefName )
				local isRank	= UI:GetPlayerAccountRank()

				if needRank > isRank then

					local strNeedRank = UI:Num2StrSeparatedBy3( needRank )
					text = UI:GetStringByName( "shipsTree_accountRankRequired" )

					local numSubst = 0
					text, numSubst = string.gsub( text, "%$rank%$", strNeedRank )

					if numSubst == 0 then
						sys.log( "UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateLockReason()[ERROR]: cannot find placeholder \"$rank$\" in string \"shipsTree_accountRankRequired\"" )
						text = string.format( "[INVALID STRING] Required account-rank: %s", strNeedRank )
					end
					
				end
				
			end
			
		end

	end

	if text ~= "" then
		self:SetLayerVisible( true, self.layers.LOCK_REASON )
		self:SetText( text, self.layers.LOCK_REASON )
	else
		self:SetLayerVisible( false, self.layers.LOCK_REASON )
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateAdvertText()

	local bNeedAdvertText = not self:IsBought() and UI:IsShipAdvert( self.baseDefName )
	self:SetLayerVisible( bNeedAdvertText, self.layers.ADVERT_TEXT )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateAdvertBtn()

	local bNeedAdvertBtn =
		not self:IsBought()
		and UI:GetShipAdvertLink( self.baseDefName ) ~= ""

	if bNeedAdvertBtn then
		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		UI:AddChildAndLink( self, self.advertBtn, mainEffect, self.effectInfo.main.advertBtnLocator, UI.EffectAnimParams.POS )
	else
		self.advertBtn:UnlinkFromParent()
	end

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:IsInBattle()

	return
		self:IsBought()
		and UI:IsShipInBattle( self.shipItem )

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:IsOnMatchmaking()

	return
		self:IsBought()
		and UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE
		and UI:GetShipBattleSlot( self.shipItem ) ~= -1

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	self:UpdateZOrder()

end


--
function UI.ShipsTree_AlienTree_ShipSlotWnd:UpdateZOrder()

	if self.shipIcoWnd and self.shipIcoWnd:IsChildOf( self ) then
		self:MoveChildToFirstPosition( self.shipIcoWnd )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_AlienTree_ShipBuyBtn   
-- ------------------------------------------------------------

UI.ShipsTree_AlienTree_ShipBuyBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn14",

		props =
		{
			name		= "ShipsTree_AlienTree_ShipBuyBtn",
			isPrototype	= true,
		}
	},

	textId = "shipCraft_craftBtn"
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienTree_ShipEditBtn
-- ------------------------------------------------------------

UI.ShipsTree_AlienTree_ShipEditBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn15",

		props =
		{
			name		= "ShipsTree_AlienTree_ShipEditBtn",
			isPrototype	= true,
		}
	},

	textId = "shipsTree_editNodesBtn"
}

-- ------------------------------------------------------------
-- UI.ShipsTree_AlienTree_ShipInfoBtn
-- ------------------------------------------------------------

UI.ShipsTree_AlienTree_ShipInfoBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn14",

		props =
		{
			name		= "ShipsTree_AlienTree_ShipInfoBtn",
			isPrototype	= true,
		}
	},

	textId = "shipsTree_shipInfoBtn"
}

-- ------------------------------------------------------------
-- UI.ShipsTree_ShipAdvertBtn
-- ------------------------------------------------------------

UI.ShipsTree_ShipAdvertBtn = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

--
UI.ShipsTree_ShipAdvertBtn.layers =
{
    MAIN_EFFECT	= 0,
	DEBUG		= 1,
    TEXT		= 2,
}


--
UI.ShipsTree_ShipAdvertBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "ShipsTree_ShipAdvertBtn",
		selectSound	= UI.sounds.btnMouseOver,
		isPrototype	= true,
	},

	layers =
	{
		numLayers = UI:GetTableLength( UI.ShipsTree_ShipAdvertBtn.layers ),

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "shipsTree_alienTree_shipSlot_advertBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.ShipsTree_ShipAdvertBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= UI.ShipsTree_ShipAdvertBtn.layers.TEXT,
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipsTree_advertBtn" ),
		},
	}
}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_ShipAdvertBtn.effectInfo =
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


-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialTree_ShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialTree_ShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialTree_ShipSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_Tree_ShipSlotWnd",

	props =
	{
		name		= "ShipsTree_SpecialTree_ShipSlotWnd",
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
				defName 			= "shipsTree_specialTree_shipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "ship_ico",	
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "role_ico2",	
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "full",	
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.MAX_SYNERGY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					-- не линкуется по цвету
					{
						objName		= "sinergy",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SYNERGY_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "indic2",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "mark",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "mark",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.HOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "mark",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.NEW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.BATTLE_SLOT_FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indic",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.BATTLE_SLOT_NUM_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "advertisement",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.ADVERT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indic",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_QUEST_SLOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.RECOMMENDED_FOR_SHIP_QUEST_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "quest_percent",
						layer		= "UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_QUEST_REWARD_CF_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ADVERT_EFFECT
		{
			id			= UI.ShipsTree_Tree_ShipSlotWnd.layers.ADVERT_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialTree_shipSlot_advert",
				defaultAnimation	= "idle",
			}}
		},

		-- MAX_SYNERGY_EFFECT
		{
			id			= UI.ShipsTree_Tree_ShipSlotWnd.layers.MAX_SYNERGY_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialTree_shipSlot_maxSynergy",
				defaultAnimation	= "idle",
			}}
		},

		-- BATTLE_SLOT_FRAME_EFFECT
		{
			id			= UI.ShipsTree_Tree_ShipSlotWnd.layers.BATTLE_SLOT_FRAME_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialTree_shipSlot_battleSlotFrame",
				defaultAnimation	= "idle",
			}}
		},

		-- SHIP_ICO_EFFECT
		{
			id			= UI.ShipsTree_Tree_ShipSlotWnd.layers.SHIP_ICO_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_specialTree_shipSlot_shipIco",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			id			= UI.ShipsTree_Tree_ShipSlotWnd.layers.MOUSE_OVER_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "shipsTree_specialTree_shipSlot_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.ShipsTree_SpecialTree_ShipSlotWnd:GetCenterPos()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local centerPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.centerLocator ) or Vec2( 0, 0 )
	return centerPos

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.ShipsTree_SpecialTree_ShipSlotWnd.effectInfo =
{
	main =
	{
		centerLocator = "center",
	},

	synergyPb =
	{
		effectNamePrefix_regular	= "shipsTree_specialTree_shipSlot_synergyPb_regular_",
		effectNamePrefix_premium	= "shipsTree_specialTree_shipSlot_synergyPb_premium_",
		effectNamePrefix_craft		= "shipsTree_specialTree_shipSlot_synergyPb_craft_",
	},
}

UI.ShipsTree_SpecialTree_ShipSlotWnd.shipsWndName = "ShipsTree_SpecialTreeWnd"

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_SpecialTree_ShipSlotWnd:InitLinks()	
	-- ничего
end


-- перегрузка базовой функции - используется большая иконка
function UI.ShipsTree_SpecialTree_ShipSlotWnd:UpdateShipIco()

	if not self:IsAdvert() then

		self:SetLayerVisible( true, self.layers.SHIP_ICO_EFFECT )

    	local hTex = UI:GetAlienShipTreeIco( self.defName )

    	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
    	if shipIcoEffect then
    		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.spriteName, hTex )
    	end

	else
		self:SetLayerVisible( false, self.layers.SHIP_ICO_EFFECT )
	end

end


-- ------------------------------------------------------------
-- UI.ShipsTree_SpecialTree_EvolvingShipSlotWnd
-- ------------------------------------------------------------

UI.ShipsTree_SpecialTree_EvolvingShipSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.ShipsTree_SpecialTree_EvolvingShipSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ShipsTree_AlienTree_ShipSlotWnd",
	
	props =
	{
		name		= "ShipsTree_SpecialTree_EvolvingShipSlotWnd",
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
				defName 			= "shipsTree_specialTree_evolvingShipSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					-- не линкуется по цвету
					{
						objName		= "rank",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role",	
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по цвету
					{
						objName		= "name",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "lock",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "slot_indic_",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.BATTLE_SLOT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "requir",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.LOCK_REASON",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sinergy",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.ADVERT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "indic3",
						layer		= "UI.ShipsTree_AlienTree_ShipSlotWnd.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BATTLE_SLOT_EFFECT
		{
			id			= UI.ShipsTree_AlienTree_ShipSlotWnd.layers.BATTLE_SLOT_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialTree_evolvingShipSlot_battleSlot",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_EFFECT
		{
			id			= UI.ShipsTree_AlienTree_ShipSlotWnd.layers.LOCK_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_specialTree_evolvingShipSlot_lock",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.ShipsTree_SpecialTree_EvolvingShipSlotWnd:UpdateRank()

	UI.ShipsTree_AlienTree_ShipSlotWnd.UpdateRank( self )

	if self:IsLayerVisible( self.layers.RANK ) then
		local color = UI:GetItemColor( self.baseDefName, false, false )
		self:SetColor( color, self.layers.RANK )
	end

end


--
function UI.ShipsTree_SpecialTree_EvolvingShipSlotWnd:UpdateRoleIco()

	UI.ShipsTree_AlienTree_ShipSlotWnd.UpdateRoleIco( self )

	if self:IsLayerVisible( self.layers.ROLE_ICO_EFFECT ) then

		local color = UI:GetItemColor( self.baseDefName, false, false )

		local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
		if roleEffect then
			roleEffect:SetColor( color )
		end

	end

end


--
function UI.ShipsTree_SpecialTree_EvolvingShipSlotWnd:UpdateShipName()

	UI.ShipsTree_AlienTree_ShipSlotWnd.UpdateShipName( self )

	if self:IsLayerVisible( self.layers.SHIP_NAME ) then
		local color = UI:GetItemColor( self.baseDefName, false, true )
		self:SetColor( color, self.layers.SHIP_NAME )
	end

end