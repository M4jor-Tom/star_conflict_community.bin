-- ----------------------------------------------------------------------------
--
-- Workfile: hangarwnd_new.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )
local l_baseBtnNumLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.HangarWnd = {}
local hw = UI.HangarWnd

-- ------------------------------
-- window definition
-- ------------------------------

hw.layers =
{                                               			
    MAIN_EFFECT					= 0,    
	NEW_RES_EFFECT				= 1, 
	PREPARE_CONTROLS_EFFECT		= 2, 
	NOTIFICATIONS_EFFECT        = 3, 
	PREVIEW_SHIP_NAME			= 4, 
	DAMAGE_MSG_EFFECT			= 5, 
	DAMAGE_MSG                  = 6, 
	IN_BATTLE_MSG_EFFECT        = 7, 
	IN_BATTLE_MSG               = 8, 
	WORK_1_EFFECT				= 9,  
	TIME						= 10,
	WORK_2_EFFECT				= 11,
}


UI.HangarWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "HangarWnd",
		rectAbs	= Quat( 0, 0, 1024, 768 ),
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_REDIRECT_ACTIVATION_TO_CHILDREN,
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
				defName 			= "hangar_main_720",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "win",
						wnd			= "UI.ShopWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						wnd			= "UI.TalentsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						wnd			= "UI.LeaderboardWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						wnd			= "UI.ClansMainWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						wnd			= "UI.Profile_Wnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{	
						objName		= "win",
						wnd			= "UI.GameplayWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "damage_msg",
						layer		= "UI.HangarWnd.layers.DAMAGE_MSG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "in_battle_msg",
						layer		= "UI.HangarWnd.layers.IN_BATTLE_MSG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "notice",
						layer		= "UI.HangarWnd.layers.NOTIFICATIONS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "sticker_2",	
						wnd			= "UI.ShipCustomizationWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win_fs",
						wnd			= "UI.ShipsTreeWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "help_list_2",
						wnd			= "UI.HelpListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "name_ship",
						layer		= "UI.HangarWnd.layers.PREVIEW_SHIP_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
					{
						objName		= "craft",
						wnd			= "UI.ShipCraftWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						wnd			= "UI.ItemCraftMultiWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{	
						objName		= "win_fs",
						wnd			= "UI.MarketingWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "friend_win",	
						wnd			= "UI.FriendsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "friend_win",	
						wnd			= "UI.SquadFinder_GroupsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "friend_win",	
						wnd			= "UI.SquadFinder_MyGroupWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "friend_win",	
						wnd			= "UI.SquadFinder_CreateMyGroupWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "edit_ship",	
						wnd			= "UI.ShipWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "bp_btn1",
						wnd			= "UI.Hangar_CurrentEventInfoWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

				}
			}}
		},

		-- NEW_RES_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_main_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "castom_btn",
						wnd			= "UI.Hangar_ShipCustomizationBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "header",	
						wnd			= "UI.Hangar_TopPanelWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "decor_btn3",	
						wnd			= "UI.Hangar_BundlesBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "castom_btn3",
						wnd			= "UI.Hangar_NotificationsModeBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "repair",
						layer		= "UI.HangarWnd.layers.PREPARE_CONTROLS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "pvp_couple_btn",
						wnd			= "UI.Hangar_EMMWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win_fsw",
						wnd			= "UI.ProfileWnd_new",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "fps_info",
						wnd			= "UI.HangarClientStatsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "fps_info",
						layer		= "UI.HangarWnd.layers.WORK_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "btn_x",
						wnd			= "UI.Hangar_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "quest_win",
						wnd			= "UI.Hangar_QuestsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "win_fsw",
						wnd			= "UI.BattlePassWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PREPARE_CONTROLS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_prepareControls",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "offer",	
						wnd			= "UI.OffersWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NOTIFICATIONS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_notifications",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "list",
						wnd			= "UI.NotificationsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PREVIEW_SHIP_NAME
		{
			layerType	= UI.LAYER_TEXT,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP + FONT.TF_TOP + FONT.TF_HCENTER,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Large",
   			},
		},

		-- DAMAGE_MSG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_damageMsg",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "damage_progress",
						layer		= "UI.HangarWnd.layers.DAMAGE_MSG",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- DAMAGE_MSG
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_damageMsg"
		},   

		-- IN_BATTLE_MSG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_damageMsg",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "damage_progress",
						layer		= "UI.HangarWnd.layers.IN_BATTLE_MSG",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- IN_BATTLE_MSG
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^hangar_inBattleMsg"
		},

		-- WORK_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "clientStats_main",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по позиции
					{
						objName		= "time2",
						layer		= "UI.HangarWnd.layers.TIME",
						animParams	= UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
		
		-- WORK_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "equipment_main_new_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "ship_slots",
						wnd			= "UI.Hangar_BattleListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "crew_",
						wnd			= "UI.Hangar_TalentsBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children =
	{
		"UI.Hangar_BattleListWnd",
		"UI.MatchMakingContainerWnd",
		"UI.ShopWnd",
		"UI.EquipmentWnd",
		"UI.TalentsWnd",
		"UI.Hangar_WaitingWnd",
		"UI.Hangar_NotificationsModeBtn",
		"UI.NotificationsListWnd",
		"UI.Hangar_ShipCustomizationBtn",
		"UI.FriendsListWnd",
		"UI.Vote_Wnd",
		"UI.SquadWnd",
		"UI.ShipsTreeWnd",
		"UI.LeaderboardWnd",
		"UI.ClansMainWnd",
		"UI.Profile_Wnd",
		"UI.ProfileWnd_new",
		"UI.GameplayWnd",
		"UI.SaleAdvert_Wnd",
		"UI.HelpListWnd",
		"UI.MailWnd",
		"UI.ShipCustomizationWnd",
		"UI.HangarClientStatsWnd",
		"UI.ShipCraftWnd",
		"UI.ItemCraftMultiWnd",
		"UI.Hangar_BundlesBtn",
		"UI.MarketingWnd",
		"UI.SquadFinder_GroupsWnd",
		"UI.SquadFinder_MyGroupWnd",
		"UI.SquadFinder_CreateMyGroupWnd",
		"UI.ShipWnd",
		"UI.OffersWnd",
		"UI.Hangar_TopPanelWnd",
		"UI.Hangar_EMMWnd",
		"UI.Hangar_QuestsWnd",
		"UI.Hangar_CrossBtn",
		"UI.Hangar_TalentsBtn",
		"UI.BattlePassWnd",
		"UI.Hangar_CurrentEventInfoWnd",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HangarWnd:MasterServer_OnServerInfo( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	UI.GameplayChoiceWnd:MasterServer_OnServerInfo( result, requestId, param1, param2 )
	UI.ArenaWnd:MasterServer_OnServerInfo( result, requestId, param1, param2 )

	if result == 0 then

		self:UpdateBlock_ServerInfo()

	elseif result == 1 and requestId == self.lastRequestId_ServerInfo then

		self:ShowMessageOnTimeOut()

	end

	if requestId == self.lastRequestId_ServerInfo then
		self.lastRequestId_ServerInfo = 0
	end

end


--
function UI.HangarWnd:MasterServer_OnPlayerCredentials( result, requestId, param1, param2 )

	UI.Yup2GoldWnd:MasterServer_OnPlayerCredentials( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 0 then	
		self:UpdatePlayerNameAndClan()
	end

end


--
function UI.HangarWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	UI.ShopWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.TalentsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Gold2CreditsWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ShipCustomizationWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Hangar_BuyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ClansMainWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.SynergyTransferWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Hangar_TradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ShipCraftWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ClanShipWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ProfileChangeAvatar_Wnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.PveChoiceWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.PveWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.MarketingWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.MailCreateWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.MailWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.MoneyWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.BattlePassWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.AutogenUpgradeWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.AutogenUnequipWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )
	UI.Hangar_UpgradeItemWnd:MasterServer_OnPlayerCredits( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 0 then
		
		self:UpdateBattleSlotsLockState()
		self:UpdateShipSlotsOnPlayerCreditsChanged()

	end

end


--
function UI.HangarWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )	

	UI.Hangar_BuyWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )	
	UI.MarketingWnd:MasterServer_OnBuyPremium( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnBuyGold( result, requestId, param1, param2 )	

	UI.Yup2GoldWnd:GameStore_OnBuyGold( result, requestId, param1, param2 )	
	UI.GoldArcWnd:GameStore_OnBuyGold( result, requestId, param1, param2 )	

end


--
function UI.HangarWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	UI.EquipmentWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:GameStore_OnChangeEquipment( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.ModuleEquipResult.MER_OK then
		return
	end

	local shipId = u64( param1, param2 )
	local selShipItem = self:GetSelShipItem()

	self:OnEquipModulesChanged( shipId )

	if selShipItem and selShipItem.vid == shipId then
		self:OnSelShipAmmoChanged()
	end

	self:UpdateShipSlotsOnShipAmmoChanged( shipId )

end


--
function UI.HangarWnd:GameStore_OnChangeEquipmentMulti( result, requestId, param1, param2, u64Param )

	UI.EquipmentWnd:GameStore_OnChangeEquipmentMulti( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:GameStore_OnChangeEquipmentMulti( result, requestId, param1, param2, u64Param )
	
	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.ModuleEquipResult.MER_OK then
		return
	end

	local shipId = u64( param1, param2 )
	local selShipItem = self:GetSelShipItem()
	
	self:OnEquipModulesChanged( shipId )

	if selShipItem and selShipItem.vid == shipId then
		self:OnSelShipAmmoChanged()
	end

	self:UpdateShipSlotsOnShipAmmoChanged( shipId )
	
end


--
function UI.HangarWnd:GameStore_OnStripEquipment( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnStripEquipment( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.ModuleEquipResult.MER_OK then

    	local shipId = u64( param1, param2 )
    	local selShipItem = self:GetSelShipItem()

    	self:OnEquipModulesChanged( shipId )

    	if selShipItem and selShipItem.vid == shipId then
    		self:OnSelShipAmmoChanged()
    	end

    	self:UpdateShipSlotsOnShipAmmoChanged( shipId )

	else

    	if requestId == self.shipStripRequestId then
			UI:ShowMessageOnEquipError( result )
    	end

	end

	if requestId == self.shipStripRequestId then
		self.shipStripRequestId = 0    		
	end

end  


--
function UI.HangarWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

	UI.EquipmentWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:GameStore_OnTransferEquipment( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.ModuleEquipResult.MER_OK then
		return
	end

	local shipId1 = u64( param1, param2 )
	local shipId2 = u64Param

	self:OnEquipModulesChanged( shipId1 )
	self:OnEquipModulesChanged( shipId2 )

	local selShipItem = self:GetSelShipItem()

	if selShipItem and ( selShipItem.vid == shipId1 or selShipItem.vid == shipId2 ) then
		self:OnSelShipAmmoChanged()
	end

	self:UpdateShipSlotsOnShipAmmoChanged( shipId1 )
	self:UpdateShipSlotsOnShipAmmoChanged( shipId2 )

end


--
function UI.HangarWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	UI.EquipmentWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:GameStore_OnChangeMunition( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.MunitionResult.MR_OK then
		return
	end

	local shipId = u64( param1, param2 )
	local selShipItem = self:GetSelShipItem()

	if selShipItem and selShipItem.vid == shipId then
		self:OnSelShipAmmoChanged()
	end

	self:UpdateShipSlotsOnShipAmmoChanged( shipId )

end


--
function UI.HangarWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

	UI.EquipmentWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:GameStore_OnTransferMunition( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.MunitionResult.MR_OK then
		return
	end

	local shipId1 = u64( param1, param2 )
	local shipId2 = u64Param

	local selShipItem = self:GetSelShipItem()

	if selShipItem and ( selShipItem.vid == shipId1 or selShipItem.vid == shipId2 ) then
		self:OnSelShipAmmoChanged()
	end

	self:UpdateShipSlotsOnShipAmmoChanged( shipId1 )
	self:UpdateShipSlotsOnShipAmmoChanged( shipId2 )

end


--
function UI.HangarWnd:GameStore_OnInventory( result, requestId, param1, param2 )

	UI.EquipmentWnd:GameStore_OnInventory( result, requestId, param1, param2, u64Param )
	UI.ShopWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.MarketingWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.BuyBundleWnd:GameStore_OnInventory( result, requestId, param1, param2 )
	UI.Hangar_UpgradeItemWnd:GameStore_OnInventory( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

	UI.EquipmentWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )
	UI.MarketingWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )
	UI.BuyBundleWnd:GameStore_OnAutogenInventory( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )
	UI.HelpListWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )
	UI.GameplayChoiceWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:GameStore_OnBattleSlots( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end	

	if result == 0 then
		self:UpdateBattleSlots()
	end

end


--
function UI.HangarWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )
	UI.HelpListWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )
	UI.GameplayChoiceWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:GameStore_OnSwapBattleSlotVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end	

	if result == _G.GameStore.ChangeBSResult.CBSR_OK then

		self:UpdateBattleSlots()

		if self.slotToSelectAfterChangeShip ~= nil then
			self:SelectBattleSlot( self.slotToSelectAfterChangeShip )
		end

	else

		if requestId == self.swapBattleSlotVesselsRequstId then
			UI:ShowMsgOnChangeBatleSlotVesselError( result )
		end

	end

	if requestId == self.swapBattleSlotVesselsRequstId then
		self.swapBattleSlotVesselsRequstId = 0
	end

	self.slotToSelectAfterChangeShip = nil

end


--
function UI.HangarWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	UI.GameplayCustom_List:Update()
	UI.HelpListWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	UI.GameplayChoiceWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	UI.ShipWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:GameStore_OnChangeBattleSlotVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.ChangeBSResult.CBSR_OK then	

		local dstSlotIdx = param1 + 1
		local srcSlotIdx = param2 ~= -1 and param2 + 1 or -1

		self:UpdateBattleSlotsOnAssignToBattleResult( true, dstSlotIdx )

		if self:IsShipInSlotFromBattleSlot( dstSlotIdx ) then

    		self:UpdateShipEntInSlot( dstSlotIdx )

    		if dstSlotIdx == UI.Hangar_BattleListWnd:GetSelectedRecord() then
    			self:OnSelShipChanged()
			end

    	end

		if srcSlotIdx ~= -1 then

    		self:UpdateBattleSlotsOnAssignToBattleResult( true, srcSlotIdx )

			if self:IsShipInSlotFromBattleSlot( srcSlotIdx ) then

            	self:UpdateShipEntInSlot( srcSlotIdx )

            	if srcSlotIdx == UI.Hangar_BattleListWnd:GetSelectedRecord() then
            		self:OnSelShipChanged()
            	end

			end

		end

		if self.slotToSelectAfterChangeShip ~= nil then

			if self.slotToSelectAfterChangeShip == dstSlotIdx then
				self:SelectBattleSlot( self.slotToSelectAfterChangeShip )
			else
				sys.log( "UI.HangarWnd:GameStore_OnChangeBattleSlotVessel()[ERROR]: mismatch slot" )
			end

		end

	elseif requestId == self.lastRequestId_ChangeBattleSlotVessel then

		UI:ShowMsgOnChangeBatleSlotVesselError( result )

		local slotIdx = param1 + 1

		self:UpdateBattleSlotsOnAssignToBattleResult( false, slotIdx )

	end

	if requestId == self.lastRequestId_ChangeBattleSlotVessel then
		self.lastRequestId_ChangeBattleSlotVessel = 0
	end

	self.slotToSelectAfterChangeShip = nil

end


--
function UI.HangarWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	UI.PvpMatchmakingWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )
	UI.PveChoiceWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )
	UI.ArenaWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )
	UI.GameplayPveMapWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )
	UI.Hangar_QuestsWnd:MasterServer_OnEnterMMQueue( result, requestId, params, mmRanks, mmValues )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.MasterServer.MMJoinResult.MMJR_OK then
		self:SetPrepareState( self.prepareStates.MATCHMAKING )

	elseif requestId == self.lastRequestId_EnterMatchmakingQueue then

		local function fnShowError()

			local strError = UI:Val2Key( _G.MasterServer.MMJoinResult, result )
			local strId = string.format( "mmError_%s", strError )
			local strErrorLocalized = UI:GetStringByName( strId )

			if result == _G.MasterServer.MMJoinResult.MMJR_VESSEL_RANK_ALL or result == _G.MasterServer.MMJoinResult.MMJR_VESSEL_RANK_ANY then
				strErrorLocalized = string.gsub( strErrorLocalized, "%$min_rank%$", params.minRank )
				strErrorLocalized = string.gsub( strErrorLocalized, "%$max_rank%$", params.maxRank )
				
			elseif result == _G.MasterServer.MMJoinResult.MMJR_INVALID_ACCOUNT_RANK then
				strErrorLocalized = string.gsub( strErrorLocalized, "%$rank%$", params.accountRank )

			elseif result == _G.MasterServer.MMJoinResult.MMJR_LEAGUE_FORBIDDEN_EQUIPMENT then
			
				local badEquipment = UI:CopyTable2( params.badLeagueEquipment or {} )
				strErrorLocalized = UI:FormatLeagueForbiddenEquipmetnMsg( strErrorLocalized, badEquipment )

			elseif result == _G.MasterServer.MMJoinResult.MMJR_BANNED_FOR_LEAVE then

				local curTime = _G.MasterServer_GetServerTime()
				local timeLeft = 0
				if params.leaverBanTill > curTime then
					timeLeft = ( ( params.leaverBanTill - curTime ) * 0.001 ).l
				end

				local strTime = UI:Time2Str45( timeLeft )
				local baseColor = UI.TEXT_BASE_COLOR
				local YELLOW_COLOR	= 0xffffff00
				strTime = string.format( "%s%s%s", UI:Color2Str( YELLOW_COLOR ), strTime, UI:Color2Str( baseColor ) )
				strErrorLocalized = string.gsub( strErrorLocalized, "%$time_left%$", strTime )

			elseif result == _G.MasterServer.MMJoinResult.MMJR_WING_SIZE_INCORRECT then
				
				strErrorLocalized = string.gsub( strErrorLocalized, "%$min_wing%$", params.minWing )
				strErrorLocalized = string.gsub( strErrorLocalized, "%$max_wing%$", params.maxWing )

			end

			local msg = UI:GetStringByName( "msg_mmError" )
			msg = string.format( msg, strErrorLocalized )

			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

		end

    	if result == _G.MasterServer.MMJoinResult.MMJR_TIMEOUT then
    		self:ShowMessageOnTimeOut()

    	elseif result == _G.MasterServer.MMJoinResult.MMJR_QUEUE_DISABLED then

			self.serverInfo.mmDisabled = true
			self:UpdateStartBtnState()

			self:ShowMatchMakingDisabledMsg()

		elseif result == _G.MasterServer.MMJoinResult.MMJR_BAD_SQUAD_CONDITION then

			local text = ""
			if params.result == _G.MasterServer.MMJoinResult.MMJR_OK then
				text = UI:LocalizeSquadNotification( _G.MasterServer.SquadNotification.SQN_MM_JOIN_FAILURE_PLAYER_OFFLINE, params.uid, params.result, false, params.uid == _G.MasterServer_GetLocalUserId() )
			else
				text = UI:LocalizeSquadNotification( _G.MasterServer.SquadNotification.SQN_MM_JOIN_FAILURE_SQUAD_MEMBER_HAS_ISSUES, params.uid, params.result, false, params.uid == _G.MasterServer_GetLocalUserId(), params )
			end

			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), text, UI.MBS_OK )

		elseif result == _G.MasterServer.MMJoinResult.MMJR_UNIVERSE_DISABLED 
			or result == _G.MasterServer.MMJoinResult.MMJR_VESSEL_TIER_INAPPROPRIATE 
			or result == _G.MasterServer.MMJoinResult.MMJR_WRONG_UNIVERSE_TYPE --[[#0108744(0510984)]] 
			or result == _G.MasterServer.MMJoinResult.MMJR_NOT_WING --[[SC-113084]] then

			-- #0076544, комм.(0340648)
			-- вторая попытка встать в очередь - теперь в случайную локацию, соответствующую тиру кораблей
			
			local universeType = _G.MasterServer.UniverseType.UT_BFS
			if self.prepareGameParams and self.prepareGameParams.mmParams and self.prepareGameParams.mmParams.universeType then
				universeType = self.prepareGameParams.mmParams.universeType
			end

			if UI:CanStartBfsInRandomZone( universeType ) then
				self.universeTypeToStartRandom = universeType
				self.hMsgRandomBfs = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msg_randomBfsConfirm" ), UI.MBS_YES_NO )
			else
				fnShowError()
			end
			
		else
			fnShowError()			
		end
		
		if self.prepareState == self.prepareStates.MATCHMAKING_WAIT then
			self:SetPrepareState( self.prepareStates.NONE )
		end

	end

	if requestId == self.lastRequestId_EnterMatchmakingQueue then
		self.lastRequestId_EnterMatchmakingQueue = 0
	end  

end


--
function UI.HangarWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )

	local gameParams = self.prepareGameParams
	local bWasMatchmakingControlOnScreen = UI.HangarWnd:IsMatchmakingControlOnScreen()

	UI.MatchMakingWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	UI.PvpMatchmakingWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	UI.DebriefingWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	UI.PveChoiceWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	UI.ArenaWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnLeaveMMQueue( result, requestId, param1, param2 )
	
	if bWasMatchmakingControlOnScreen then
	
		local queueInfo = _G.MasterServer_GetQueueInfo()	-- все параметры очереди в этот момент сохранены, только inQueue=false
		
		if UI:IsTrueEx( queueInfo.enqueuementParams.arcade ) then
		
			if self:IsOnScreen() and self.prepareState == self.prepareStates.NONE then
				self:ShowGameplayChoiceWnd( false )
			end
			
		end

		if UI:IsTrueEx( queueInfo.enqueuementParams.pve ) then
		
			if self:IsOnScreen() and self.prepareState == self.prepareStates.NONE then
		
				local bCanShowPveWnd = UI:GetPlayerAccountRank() >= UI.rankLocks.pve_missions
			
				if not UI:IsStrEmpty( queueInfo.enqueuementParams.pve_mission ) then
				
					if gameParams and gameParams.bQuests_map then
						UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.FREE_SPACE_MAP, false, false )
					elseif gameParams and gameParams.bQuests_hangar then
						UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, false, false )
					elseif bCanShowPveWnd then
						self:ShowPveWnd( false )
					else
						self:ShowGameplayChoiceWnd( false )
					end

				else
				
					if gameParams and not gameParams.bGameplayChoiceWnd and bCanShowPveWnd then
						self:ShowPveWnd( false )
					else
						self:ShowGameplayChoiceWnd( false )
					end

				end
				
			end
			
		end

		if UI:IsTrueEx( queueInfo.enqueuementParams.league ) then

			if self:IsOnScreen() and self.prepareState == self.prepareStates.NONE then
				self:ShowArenaWnd( false, false )
			end

		end
		
	end

end


--
function UI.HangarWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )	

	UI.MatchMakingWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )
--	UI.GameplayMapWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )
	UI.PvpMatchmakingWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )
	UI.PveChoiceWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )
	UI.ArenaWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )	
	UI.GameplayPveMapWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnQueueInfo( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnUndockSpaceStation( result, requestId )

	if requestId == self.freeSpaceRequestId then
		if result ~= 0 then
			self:SetPrepareState( self.prepareStates.NONE )
			if self:IsOnScreen() then
				UI:ShowMsgOnUndockError( result )
			end
		else
			self.freeSpaceUndockTimer = self.FREESPACE_UNDOCK_WAIT_MAX
			self:SetPrepareState( self.prepareStates.MATCHMAKING_WAIT )
		end
		self.freeSpaceRequestId = nil
	end

end


--
function UI.HangarWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.SynergyTransferWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.HelpListWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.Profile_CommonWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.MarketingWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.ShipWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.BuyBundleWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == 0 then

		if self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
			local selShipItem = UI:GetShipItemByDef( self.previewShipDefName, true )
			if selShipItem.vid == vid then
				self:TrySetMenuTab( self.menuTabs.MAIN, false, false )
			end
		end

		self:UpdateBattleSlots()

	end

end


--
function UI.HangarWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )	
	UI.HelpListWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )	
	UI.SynergyTransferWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	UI.Profile_CommonWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	UI.GameplayChoiceWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:GameStore_OnSellVessel( result, requestId, param1, param2 )
	
	if result == _G.GameStore.StoreBuyResult.SBR_OK then
	
		if self:IsOnScreen() then
		
			local vid = u64( param1, param2 )		

			if vid == self.customShipVid then
				self:ResetCustomShip()
			end

			if self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
				local selShipItem = UI:GetShipItemByDef( self.previewShipDefName, true )
				if selShipItem.vid == vid then
					self:TrySetMenuTab( self.menuTabs.MAIN, false, false )
				end
			end

			for recordIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do
				local data = UI.Hangar_BattleListWnd:GetRecordData( recordIdx )
				if data.shipItem and data.shipItem.vid == vid then
					self:UpdateBattleSlots()
					break
				end
			end			
			
		end
	
	else
		
		if self.sellShipRequestId == requestId then
			self:ShowMsgOnSellShipError( result )			
		end
		
	end

	if self.sellShipRequestId == requestId then
		self.sellShipRequestId = requestId
	end

end


--
function UI.HangarWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )

	UI.ShipCraftWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnCraftVessel( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	UI.ShopWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.SynergyTransferWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.HelpListWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.Profile_CommonWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.ShipCraftWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )
	UI.EquipmentWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )


	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnShipFullUpdate( u64Param )

end


--
function UI.HangarWnd:GetSelShipItem()

	if self.previewShipDefName ~= "" then
		return UI:GetShipItemByDef( self.previewShipDefName, false )

	elseif self.customShipVid ~= UI.INVALID_U64_ID then
		return UI:GetShipItem( self.customShipVid, false )

	else
		return self:GetShipItemInSelBattleSlot()
	end

end


--
function UI.HangarWnd:GetSelShipDefName()

	if self.previewShipDefName ~= "" then
		return self.previewShipDefName

	elseif self.customShipVid ~= UI.INVALID_U64_ID then
	
		local shipItem = UI:GetShipItem( self.customShipVid, false )
		if shipItem then
			return shipItem.defName
		else
			sys.log( "UI.HangarWnd:GetSelShipDefName(): cannot find ship item" )
			return ""
		end		

	else
		local shipItem = self:GetShipItemInSelBattleSlot()
		return shipItem and shipItem.defName or ""
	end

end


--
function UI.HangarWnd:GetSelShipSlot()	

	if self.previewShipDefName ~= "" or self.customShipVid ~= UI.INVALID_U64_ID then
		return self.selShipSlotIdx
	else
		return UI.Hangar_BattleListWnd:GetSelectedRecord()
	end

end


--
function UI.HangarWnd:GetSelShipEntId()

	return self.selShipEntId

end


--
function UI.HangarWnd:GetShipItemInSelBattleSlot()

	local selRecordIdx = UI.Hangar_BattleListWnd:GetSelectedRecord()

	if selRecordIdx ~= -1 then
		local data = UI.Hangar_BattleListWnd:GetRecordData( selRecordIdx )
		return data.shipItem
	end

	return nil

end


-- c 1
function UI.HangarWnd:GetSelBattleSlot()

	return UI.Hangar_BattleListWnd:GetSelectedRecord()

end


--
function UI.HangarWnd:HandleTooltip( targetWnd, tooltipData )

	if UI.EquipmentWnd:IsOnScreen() and UI.EquipmentWnd:IsDD() then
		return true, UI.INVALID_UI_HANDLE
	end

	return UI.FullScreenWnd.HandleTooltip( self, targetWnd, tooltipData )

end


--
function UI.HangarWnd:GetCurTab()

	return self.menuTab	

end


--
function UI.HangarWnd:GameStore_OnVesselEquipment( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnVesselEquipment( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnVesselEquipment( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	local shipId = u64( param1, param2 )
	local selShipItem = self:GetSelShipItem()

	self:OnEquipModulesChanged( shipId )

	if selShipItem and selShipItem.vid == shipId then
		self:OnSelShipAmmoChanged()
	end

	self:UpdateShipSlotsOnShipAmmoChanged( shipId )

end


-- ВНИМАНИЕ! индексы в vids с 0
function UI.HangarWnd:GameStore_OnVesselsEquipment( vids )

	UI.ShipsTreeWnd:GameStore_OnVesselsEquipment( vids )

	if not self:IsOnScreen() then
		return
	end

    local selShipItem = self:GetSelShipItem()

	for idx, vid in pairs( vids ) do

    	self:OnEquipModulesChanged( vid )

    	if selShipItem and selShipItem.vid == vid then
    		self:OnSelShipAmmoChanged()
    	end

    	self:UpdateShipSlotsOnShipAmmoChanged( vid )

	end

end


--
function UI.HangarWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	
	UI.EquipmentWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ItemCraftMultiWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ItemCraftSingleWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ProfileChangeAvatar_Wnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ProfileTitles_Wnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.MarketingWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.ShipWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )
	UI.BuyBundleWnd:GameStore_OnBuyItem( result, requestId, param1, param2, u64Param )

	if requestId ~= 0 and requestId == self.buyRequestId then

    	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
			if self:IsOnScreen() then
    			UI:ShowMsgOnBuyError( result )
			end
    	end

		self.buyRequestId = 0

		if self:IsOnScreen() then
			self.expiredMsgTimer = self.EXPIRED_MSG_DELAY
		end

	end

end


--
function UI.HangarWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnSellItem( result, requestId, param1, param2 )
	UI.EquipmentWnd:GameStore_OnSellItem( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnSellItem( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnSellItems( result, requestId, param1, param2 )
	UI.EquipmentWnd:GameStore_OnSellItems( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnSellItems( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )
	UI.EquipmentWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnSalvageItem( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnUpgradeItems( result, requestId, iids )

	UI.EquipmentWnd:GameStore_OnUpgradeItems( result, requestId, iids )
	UI.ShopWnd:GameStore_OnUpgradeItems( result, requestId, iids )
	UI.ShipsTreeWnd:GameStore_OnUpgradeItems( result, requestId, iids )
	UI.Hangar_UpgradeItemWnd:GameStore_OnUpgradeItems( result, requestId, iids )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then
	
		if self:IsOnScreen() then
			
			if requestId == self.upgradeItemRequestId then
				UI.EquipmentWnd:ShowUpgradeItemWowEffect( iids )
			end
			
			for idx, iid in pairs( iids ) do
				
				local shipItem = UI:GetEquippedShipItem( iid )
				if shipItem then
					self:OnEquipModulesChanged( shipItem.vid )
				end
				
			end
			
		end

	else

		if requestId == self.upgradeItemRequestId then
			self:ShowMsgOnUpgradeItemError( result )
		end

	end

	if requestId == self.upgradeItemRequestId then
		self.upgradeItemRequestId = 0
	end

end


--
function UI.HangarWnd:GameStore_OnExchangeGold( result, requestId, param1, param2 )	

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		UI:ShowMsgOnBuyError( result )		
	end

end


--
function UI.HangarWnd:MasterServer_GameEnded()

	if not self:IsOnScreen() then
		return
	end

	if self.hMsgRejoinGame ~= UI.INVALID_UI_HANDLE then

		UI:RemoveUiObj( self.hMsgRejoinGame )
		self.hMsgRejoinGame = UI.INVALID_UI_HANDLE

		UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_gameEnded" ), UI.MBS_OK )

	end

end


--
function UI.HangarWnd:MasterServer_OnRejoinGame( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.MasterServer.RejoinResult.RJR_JOINING then
		self:SetPrepareState( self.prepareStates.MATCHMAKING )

	elseif result ~= _G.MasterServer.RejoinResult.RJR_GAME_ABANDONED then
		self:ShowMsgOnRejoinGameError( result )		
	end

end


--
function UI.HangarWnd:OnPrepareWndResult( result )

	local operationType = UI.Hangar_PrepareWnd:GetOperationType()
	local callType = UI.Hangar_PrepareWnd:GetCallType()

	-- совершить действие
	if result == UI.Hangar_PrepareWnd.results.OK then

		-- отремонтировать
		if operationType == UI.Hangar_PrepareWnd.operationTypes.REPAIR then

			if callType == UI.Hangar_PrepareWnd.callTypes.BY_REQUEST then
				self:DoRepairByRequest( UI.Hangar_PrepareWnd:GetShipItem() )

			elseif callType == UI.Hangar_PrepareWnd.callTypes.BEFORE_FIGHT then

				if _G.GameStore_RepairBattleVessels( true ) ~= 0 then
					self:SetPrepareState( self.prepareStates.REPAIR_WAIT )
				else
					self:SetPrepareState( self.prepareStates.NONE )
					self:ShowMsgOnSendRequestError()
				end

			else
				sys.log( "UI.HangarWnd:OnPrepareWndResult()[ERROR]: unhandled call type: %s", tostring( callType ) )
			end

		-- пополнить
		elseif operationType == UI.Hangar_PrepareWnd.operationTypes.REFILL then

			if callType == UI.Hangar_PrepareWnd.callTypes.BY_REQUEST then
				self:DoRefillByRequest( UI.Hangar_PrepareWnd:GetShipItem() )

			elseif callType == UI.Hangar_PrepareWnd.callTypes.BEFORE_FIGHT then

				if _G.GameStore_RefillBattleVessels() ~= 0 then
					self:SetPrepareState( self.prepareStates.REFILL_WAIT )
				else
					self:SetPrepareState( self.prepareStates.NONE )
					self:ShowMsgOnSendRequestError()
				end

			else
				sys.log( "UI.HangarWnd:OnPrepareWndResult()[ERROR]: unhandled call type: %s", tostring( callType ) )
			end

		else
			sys.log( "UI.HangarWnd:OnPrepareWndResult()[ERROR]: unhandled operation type: %s", tostring( operationType ) )
		end

	-- отказаться от действия и продолжить дальше (только перед битвой и только для пополнения)
	elseif result == UI.Hangar_PrepareWnd.results.CANCEL then

		if callType == UI.Hangar_PrepareWnd.callTypes.BEFORE_FIGHT then

    		if operationType == UI.Hangar_PrepareWnd.operationTypes.REPAIR then
				sys.log( "UI.HangarWnd:OnPrepareWndResult()[ERROR]: wrong result" )

    		elseif operationType == UI.Hangar_PrepareWnd.operationTypes.REFILL then
				self:CheckStartMatchMaking( self.prepareBattleSlot, self.prepareGameParams, self.prepareCheckReadyType, self.prepareEmm )

    		else
				sys.log( "UI.HangarWnd:OnPrepareWndResult()[ERROR]: unhandled operation type: %s", tostring( operationType ) )
    		end		

		end

	-- отказаться от действия; если перед битвой, то прервать подготовку к битве
	elseif result == UI.Hangar_PrepareWnd.results.RETURN then

		if self.prepareState ~= self.prepareStates.NONE then
			self:SetPrepareState( self.prepareStates.NONE )
		end

	else
		sys.log( "UI.HangarWnd:OnPrepareWndResult()[ERROR]: unhandled result: %s", tostring( result ) )
	end

end


--
function UI.HangarWnd:GameStore_OnRefillMunition( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnRefillMunition( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.MunitionResult.MR_OK then

    	local shipId = u64( param1, param2 )
    	local selShipItem = self:GetSelShipItem()

    	if selShipItem and selShipItem.vid == shipId then
	    	self:OnSelShipAmmoChanged()
    	end		

		self:UpdateShipSlotsOnShipAmmoChanged( shipId )

		if self.prepareState == self.prepareStates.REFILL_WAIT then
			self:CheckStartMatchMaking( self.prepareBattleSlot, self.prepareGameParams, self.prepareCheckReadyType, self.prepareEmm )
		end

	else

		UI:ShowMsgOnRefillError( result )

		if self.prepareState == self.prepareStates.REFILL_WAIT then
			self:SetPrepareState( self.prepareStates.NONE )
		end

	end

end


--
function UI.HangarWnd:GameStore_OnRepairVessel( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnRepairVessel( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

    	local shipId = u64( param1, param2 )

		self:UpdateShipSlotsOnShipDamageChanged( shipId )
		self:UpdateDamageMsg()

	else
		UI:ShowMsgOnRepairError( result )
	end

end


--
function UI.HangarWnd:GameStore_OnRepairBattleVessels( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnRepairBattleVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

		self:UpdateShipSlotsOnDamageChanged()
		self:UpdateDamageMsg()

		if self.prepareState == self.prepareStates.REPAIR_WAIT then
			self:CheckStartMatchMaking( self.prepareBattleSlot, self.prepareGameParams, self.prepareCheckReadyType, self.prepareEmm )
		end

	else

		UI:ShowMsgOnRepairError( result )

		if self.prepareState == self.prepareStates.REPAIR_WAIT then
			self:SetPrepareState( self.prepareStates.NONE )
		end

	end

end


--
function UI.HangarWnd:GameStore_OnRefillBattleVessels( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnRefillBattleVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result == _G.GameStore.MunitionResult.MR_OK then

		self:UpdateShipSlotsOnAmmoChanged()

		if self.prepareState == self.prepareStates.REFILL_WAIT then
			self:CheckStartMatchMaking( self.prepareBattleSlot, self.prepareGameParams, self.prepareCheckReadyType, self.prepareEmm )
		end

	else

		UI:ShowMsgOnRefillError( result )

		if self.prepareState == self.prepareStates.REFILL_WAIT then
			self:SetPrepareState( self.prepareStates.NONE )
		end

	end

end


--
function UI.HangarWnd:MasterServer_OnNotification( notification, params )

	UI.MailWnd:MasterServer_OnNotification( notification, params )
	UI.QuestInfoWnd:MasterServer_OnNotification( notification, params )
	UI.ShipCustomizationWnd:MasterServer_OnNotification( notification, params )
	UI.BundleWowWnd:MasterServer_OnNotification( notification, params )
	UI.DailyRewardWnd:MasterServer_OnNotification( notification, params )
	UI.DebriefingWnd:MasterServer_OnNotification( notification, params )
	UI.Yup2GoldWnd:MasterServer_OnNotification( notification, params )
	UI.ShipsTreeWnd:MasterServer_OnNotification( notification, params )
	UI.MarketingWnd:MasterServer_OnNotification( notification, params )
	UI.BuyBundleWnd:MasterServer_OnNotification( notification, params )
	UI.GameplayPveMapWnd:MasterServer_OnNotification( notification, params )
	UI.Hangar_QuestsWnd:MasterServer_OnNotification( notification, params )

	if self:IsOnScreen() then

		if notification == _G.MasterServer.ServerNotification.SN_NEW_LETTER then

			self:UpdateMailBtnState()	
			UI:PlayGlobalSound( self.sounds.newLetter )

		end

	end

end


-- для тестирования художниками позиций кораблей
function UI.HangarWnd:HackedSetShip( slotIdx, shipDefName )

	if not self:IsOnScreen() then
		return
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.HangarWnd:HackedSetShip()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	if slotIdx < 1 or slotIdx > UI.Hangar_BattleListWnd:GetNumRecords() then
		sys.log( "UI.HangarWnd:HackedSetShip()[ERROR]: invalid slotIdx; from 1 to %d expected", UI.Hangar_BattleListWnd:GetNumRecords() )	
		return
	end

	if type( shipDefName ) ~= "string" then
		sys.log( "UI.HangarWnd:HackedSetShip()[ERROR]: invalid type of the 2-nd parameter (\"shipDefName\"); \"string\" expected, got \"%s\"", type( shipDefName ) )
		return
	end

	local shipDef = UI:GetDef( shipDefName )
	if not shipDef then
		sys.log( "UI.HangarWnd:HackedSetShip()[ERROR]: invalid ship def name" )
		return
	end

	if UI.Hangar_BattleListWnd:GetSelectedRecord() ~= slotIdx then
		UI.Hangar_BattleListWnd:SelectRecord( slotIdx )
	end 

	-- уничтожение предыдущего корабля
	self:DestroyShipEntInSlot( slotIdx )


	-- заполнятся информация для создания корабля (формат можно посмотреть в С++ SpaceShipSpawnData::FromScriptTable())
	local spawnData = { baseDef = shipDefName }

	-- спаун

	local shipEntId = -1

	-- при спауне корабля вызывается подгрузка моделей, и, как результат, ui::UpdateWhileLoadingScreen(), и UI.HangarWnd:F_OnNewFrame();
	-- это ломает некоторые вещи (в частности, нотификации - см. #0050751)
	
	self.bLockNewFrameUpdate = true
	local ship = _G.SpawnSpaceShip( spawnData, ai.Container:GenerateUniqueName( "HangarShip" ), false )
	self.bLockNewFrameUpdate = false

	if ship then

		shipEntId = ship:GetId()
		
    	-- привязка корабля к слоту на карте

    	local spawnSpotEntId = self.spawnSpotEntIds[ slotIdx ]
    	local spawnSpot = _G.Entities[ spawnSpotEntId ]

    	if spawnSpot then    	
    		spawnSpot:AddChild( ship )
			self:UpdateShipEntPos( ship, slotIdx )
    	else
    		sys.log( "UI.HangarWnd:HackedSetShip()[ERROR]: cannot find spawn spot for slot %d", slotIdx )		
    	end

	else
		sys.log( "UI.HangarWnd:HackedSetShip()[ERROR]: cannot create ship" )
	end	

	self.shipEntIds[ slotIdx ] = shipEntId

	self:SetSelShipEnt( shipEntId )

	-- при стандартном SetSelShipEnt() камера не сработает для еще не купленного боевого слота, поэтому выставляется наверняка
	_G.Hangar:SetCameraSlot( slotIdx, self.shipEntIds[ slotIdx ] or -1, self.bCameraTransitionLocked )

end


--
function UI.HangarWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	UI.EquipmentWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.ShopWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.MailWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.MarketingWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.ShipWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )
	UI.BuyBundleWnd:GameStore_OnBuyInventoryExtension( result, requestId, param1, param2 )

	if self.buyInventoryRequestId == requestId then

		self.buyInventoryRequestId = 0

    	if result == _G.GameStore.StoreBuyResult.SBR_OK then

			if self:IsOnScreen() then

        		if self.itemToBuy then

                	if UI:IsDefBundle( self.itemToBuy.defName ) then
                		self:DoBuyBundle( self.itemToBuy )
					else
						sys.log( "UI.HangarWnd:GameStore_OnBuyInventoryExtension()[ERROR]: unhandled def type %s", self.itemToBuy.defName )
                	end

        		end		

			end

    	else
    		UI:ShowMsgOnBuyError( result )
    	end

        self.itemToBuy = nil

	end

end


--
function UI.HangarWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

	UI.ShopWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )
	UI.MarketingWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )
	UI.BuyBundleWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )
	UI.MailWnd:GameStore_OnBuyAutogenInventoryExtension( result, requestId, param1, param2 )

end


-- вызывается из биндов
function UI.HangarWnd:OnTabShipsBind()

	self:OnMenuTabBind( self.menuTabs.SHIPS )

end


-- вызывается из биндов
function UI.HangarWnd:OnTabSkillsBind()

	self:OnMenuTabBind( self.menuTabs.SKILLS )

end


-- вызывается из биндов
function UI.HangarWnd:OnTabShopBind()

	self:OnMenuTabBind( self.menuTabs.SHOP )

end


-- вызывается из биндов
function UI.HangarWnd:OnTabItemCraftBind()

	self:OnMenuTabBind( self.menuTabs.ITEM_CRAFT )

end


-- вызывается из биндов
function UI.HangarWnd:OnTabLeaderboardsBind()

	self:OnMenuTabBind( self.menuTabs.LEADERBOARDS )

end


-- вызывается из биндов
function UI.HangarWnd:OnTabHelpBind()

	self:OnMenuTabBind( self.menuTabs.HELP )

end


-- вызывается из биндов
function UI.HangarWnd:OnProfileBind()

	self:OnMenuTabBind( self.menuTabs.PROFILE )

end


-- вызывается из биндов
function UI.HangarWnd:OnClanBind()

	self:OnMenuTabBind( self.menuTabs.CLAN )

end


-- вызывается из биндов
function UI.HangarWnd:OnHangarSlotBind( slotIdx )

	if not self:IsOnScreen() then
		return
	end

	local hFocus = UI:GetKeyboardFocus()
	if hFocus ~= self:GetUiHandle() and hFocus ~= UI.EquipmentWnd:GetUiHandle() then
		return
	end

	if self.menuTab == self.menuTabs.SHIP_PREVIEW or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
		return
	end

	if UI.DebriefingWnd:IsOnScreen() then
		return
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.HangarWnd:OnHangarSlotBind()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	self:SelectBattleSlot( slotIdx )

end


--
function UI.HangarWnd:SelectBattleSlot( slotIdx )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:SelectBattleSlot()[ERROR]: not on screen" )
		return
	end

	if type( slotIdx ) ~= "number" then
		sys.log( "UI.HangarWnd:SelectBattleSlot()[ERROR]: invalid type of the 1-st parameter (\"slotIdx\"); \"number\" expected, got \"%s\"", type( slotIdx ) )
		return
	end

	self:SelectBattleSlotInternal( slotIdx )

end


--
function UI.HangarWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	
	UI.QuestInfoWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Hangar_BuyWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.GameplayChoiceWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ProfileChangeAvatar_Wnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ProfileTitles_Wnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ShopWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Hangar_TradeWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.MarketingWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.OffersWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Yup2GoldWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.GoldArcWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnAccountAuras( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdateShipEntAccountAuras()

	self:OnAccountAurasChanged()

end


--
function UI.HangarWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	
	UI.QuestInfoWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Hangar_BuyWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.GameplayChoiceWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ProfileChangeAvatar_Wnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ProfileTitles_Wnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ShopWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Hangar_TradeWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.MarketingWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.OffersWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Yup2GoldWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.GoldArcWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnAddAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdateShipEntAccountAuras()

	self:OnAccountAurasChanged()

end


--
function UI.HangarWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	
	UI.QuestInfoWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Hangar_BuyWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.GameplayChoiceWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ProfileChangeAvatar_Wnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ProfileTitles_Wnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ShopWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Hangar_TradeWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.MarketingWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.OffersWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Yup2GoldWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.GoldArcWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnCancelAccountAura( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:UpdateShipEntAccountAuras()

	self:OnAccountAurasChanged()

end


--
function UI.HangarWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

	UI.ShipCustomizationWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )
	UI.MarketingWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )
	UI.BuyBundleWnd:GameStore_OnVesselFreeCustomElements( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnVesselCustomElementsExpired( result, requestId, expiredData )

	UI.ShipCustomizationWnd:GameStore_OnVesselCustomElementsExpired( result, requestId, expiredData )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:OnShipCustomizationChanged( expiredData.vid )

end


--
function UI.HangarWnd:GameStore_OnBuyVesselCustomElements( result, requestId, buyData )

	UI.ShipCustomizationWnd:GameStore_OnBuyVesselCustomElements( result, requestId, buyData )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:OnShipCustomizationChanged( buyData.vid )
	
end      


--
function UI.HangarWnd:OpenStoreForItem( defName, iid )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:OpenStoreForItem()[ERROR]: hangar is not on screen" )
		return
	end

	if self.menuTab ~= self.menuTabs.SHOP then
		self:TrySetMenuTab( self.menuTabs.SHOP, true, false, { fn = UI.HangarWnd.OpenStoreForItem, params = { self, defName, iid } } )
	end

	if self.menuTab ~= self.menuTabs.SHOP then
		return
	end

	UI.ShopWnd:ShowAndSelectStoreItem( defName, iid )

	self:HideOverlayWindows()

end


--
function UI.HangarWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	UI.DebriefingOWWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.DebriefingWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.ArenaWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.SquadFinder_GroupsWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.SquadFinder_MyGroupWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.ProfileWnd_new:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.Trading_AdvertsWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )
	UI.ClanWarWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	local playerCid = UI:GetLocalPlayerCid()
	if cid == playerCid then
		self:UpdatePlayerNameAndClan()
	end

end


--
function UI.HangarWnd:MasterServer_OnClanCreate( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.ClanOpResult.CLR_OK then
		return
	end

	self:UpdatePlayerNameAndClan()

end


--
function UI.HangarWnd:MasterServer_OnClanInviteAccept( result, requestId, unused, unused, cid )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.ClanOpResult.CLR_OK then
		return
	end

	self:UpdatePlayerNameAndClan()

end


--
function UI.HangarWnd:MasterServer_OnClanLeave( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.ClanOpResult.CLR_OK then
		return
	end

	self:UpdatePlayerNameAndClan()

end


--
function UI.HangarWnd:MasterServer_OnClanNotification( type, cid, uid, param1, param2 )

	UI.ClanShipWnd:MasterServer_OnClanNotification( type, cid, uid, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if type ~= _G.MasterServer.ClanNotification.CLN_KICKED then
		return
	end

	self:UpdatePlayerNameAndClan()

end


--
function UI.HangarWnd:MasterServer_OnChangePlayerNickName( result, requestId, nickName )

	if not self:IsOnScreen() then
		return
	end

	self:UpdatePlayerNameAndClan()

end


--
function UI.HangarWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	UI.DebriefingOWWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.ArenaWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.MarketingWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.SquadFinder_GroupsWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.SquadFinder_MyGroupWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.BuyBundleWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.ProfileWnd_new:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.DebriefingWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )
	UI.Trading_AdvertsWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

end


--
function UI.HangarWnd:SetNewFriendRequest( b )

	UI.Hangar_FriendListBtn:SetNotification( b )

end


--
function UI.HangarWnd:SetFriendOnlineCount( count )

	UI.Hangar_FriendListBtn:SetFriendOnlineCount( count )

end


--
function UI.HangarWnd:SetNewVote( b )

	UI.Hangar_VoteBtn:SetNotification( b )

end

--
function UI.HangarWnd:HasResults( b )

	UI.Hangar_VoteBtn:SetResults( b )

end

--
function UI.HangarWnd:TryBuyAdvertItem( defName, vid, slot )	

	-- открывается эквипмент
	self:TrySetMenuTab( self.menuTabs.MAIN, true, false, { fn = UI.HangarWnd.TryBuyAdvertItem, params = { self, defName, vid, slot } } )

	if self.menuTab ~= self.menuTabs.MAIN then
		return
	end

	if type( vid ) ~= "userdata" then
		sys.log( "UI.HangarWnd:TryBuyAdvertItem()[ERROR]: invalid type of the 2-nd parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	-- устанавливается выделение на соответствующий корабль

	local selShipItem = self:GetSelShipItem()

	if not selShipItem or selShipItem.vid ~= vid then

    	local slotIdx = UI:GetShipBattleSlotByVid( vid )
    	if slotIdx == -1 then
    		sys.log( "UI.HangarWnd:TryBuyAdvertItem()[ERROR]: cannot find battle slot for ship %s", _G.U64ToStr( vid ) )
    		return
    	end

    	self:SelectBattleSlotInternal( slotIdx )

		selShipItem = self:GetSelShipItem()
		if not selShipItem or selShipItem.vid ~= vid then
			sys.log( "UI.HangarWnd:TryBuyAdvertItem()[ERROR]: cannot select battle slot %d", slotIdx )
			return
		end

	end

	self:SetNotificationsMode( self.notificationsModes.POP_UPS )

	-- далее логика - в окне эквипмента (выделение слота, поиск в списке, показ окна покупки и т.п.)
	UI.EquipmentWnd:TryBuyAdvertItem( defName, slot )

end


--
function UI.HangarWnd:SkillManager_OnTalentsUpdate( result, requestId )

	UI.TalentsWnd:SkillManager_OnTalentsUpdate( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.SkillManager.TalentResult.TR_OK	then
		return
	end

	self:UpdateShipEntTalents()
	self:UpdateTalentsMenuBtnBlink()

end


--
function UI.HangarWnd:SkillManager_OnTalentsAcquisition( result, requestId, talentNames, talentSetId )

	UI.TalentsWnd:SkillManager_OnTalentsAcquisition( result, requestId, talentNames, talentSetId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.SkillManager.TalentResult.TR_OK	then
		return
	end

	self:UpdateShipEntTalents()
	self:UpdateTalentsMenuBtnBlink()

end


--
function UI.HangarWnd:SkillManager_OnTalentsReset( result, requestId, talentSetId )

	UI.TalentsWnd:SkillManager_OnTalentsReset( result, requestId, talentSetId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.SkillManager.TalentResult.TR_OK	then
		return
	end

	self:UpdateShipEntTalents()
	self:UpdateTalentsMenuBtnBlink()

end


--
function UI.HangarWnd:ShowProfile( uid, modeName, bSound, restoreData, launchData )

	if type( uid ) ~= "userdata" then
		sys.log( "UI.HangarWnd:ShowProfile()[ERROR]: invalid type of the 1-st parameter (\"uid\"); \"userdata\" expected, got \"%s\"", type( uid ) )
		return
	end

	if uid == UI.INVALID_U64_ID then
		sys.log( "UI.HangarWnd:ShowProfile()[ERROR]: invalid uid" )
		return
	end

	if modeName ~= nil then
		if type( modeName ) ~= "string" then
			sys.log( "UI.HangarWnd:ShowProfile()[ERROR]: invalid type of the 2-nd parameter (\"modeName\"); \"string\" or \"nil\" expected, got \"%s\"", type( modeName ) )
			modeName = nil
		end
	end

	if bSound ~= nil then
		if type( bSound ) ~= "boolean" then
			sys.log( "UI.HangarWnd:ShowProfile()[ERROR]: invalid type of the 3-rd parameter (\"bSound\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSound ) )
			bSound = nil
		end
	end

	if bSound == nil then
		bSound = false
	end

	if modeName == "ATLAS" then

    	if UI.ProfileWnd_new:IsOnScreen() then

			local mode = UI.ProfileWnd_new.modes[ modeName ]
    		UI.ProfileWnd_new:Setup( uid, mode, launchData )

			if restoreData then
				UI.ProfileWnd_new:RestoreState( restoreData )
			end

    	else

    		self:TrySetMenuTab( self.menuTabs.PROFILE_NEW, bSound, false, { fn = UI.HangarWnd.ShowProfile, params = { self, uid, modeName, bSound, restoreData, launchData } } )

        	if self.menuTab ~= self.menuTabs.PROFILE_NEW then
        		return
        	end

			local mode = UI.ProfileWnd_new.modes[ modeName ]
    		UI.ProfileWnd_new:Setup( uid, mode, launchData )

			if restoreData then
				UI.ProfileWnd_new:RestoreState( restoreData )
			end

    		if UI.FriendsListWnd:IsOnScreen() then
    			UI.FriendsListWnd:UnlinkFromParent()
    			UI.Hangar_FriendListBtn:UpdateAnim()
    		end

    	end
		
	elseif modeName == "ACHIEVEMENTS" or modeName == "MEDALS" or modeName == "LEADERBOARDS" then

		if UI.LeaderboardWnd:IsOnScreen() then
			
			UI.LeaderboardWnd:Setup( uid, launchData )
			
			if modeName ~= nil then
    			UI.Leaderboard_TabsWnd:SelectTab( modeName )
    		end
	
		else
	
			self:TrySetMenuTab( self.menuTabs.LEADERBOARDS, bSound, false, { fn = UI.HangarWnd.ShowProfile, params = { self, uid, modeName, bSound, restoreData, launchData } } )
	
			if self.menuTab ~= self.menuTabs.LEADERBOARDS then
				return
			end
			
			UI.LeaderboardWnd:Setup( uid, launchData )
			
			if modeName ~= nil then
    			UI.Leaderboard_TabsWnd:SelectTab( modeName )
    		end	
	
			if UI.FriendsListWnd:IsOnScreen() then
				UI.FriendsListWnd:UnlinkFromParent()
				UI.Hangar_FriendListBtn:UpdateAnim()
			end
	
		end

	else

    	if UI.Profile_Wnd:IsOnScreen() then

    		UI.Profile_Wnd:Setup( uid )
    		UI.Profile_Wnd:UpdateMode()

    		if modeName ~= nil then
    			UI.Profile_TabsWnd:SelectTab( modeName )
    		end

    	else

    		self:TrySetMenuTab( self.menuTabs.PROFILE, bSound, false, { fn = UI.HangarWnd.ShowProfile, params = { self, uid, modeName, bSound, restoreData } } )

        	if self.menuTab ~= self.menuTabs.PROFILE then
        		return
        	end

    		UI.Profile_Wnd:Setup( uid )
    		UI.Profile_Wnd:UpdateMode()

    		if modeName ~= nil then
    			UI.Profile_TabsWnd:SelectTab( modeName )
    		end

    		if UI.FriendsListWnd:IsOnScreen() then
    			UI.FriendsListWnd:UnlinkFromParent()
    			UI.Hangar_FriendListBtn:UpdateAnim()
    		end

    	end

	end
	
end


--
function UI.HangarWnd:ShowAchievement( achvId, rank )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowAchievement()[ERROR]: not on screen" )
		return
	end

	self:TrySetMenuTab( self.menuTabs.LEADERBOARDS, true, false, { fn = UI.HangarWnd.ShowAchievement, params = { self, achvId, rank } } )

    if self.menuTab ~= self.menuTabs.LEADERBOARDS then
    	return
    end

	UI.LeaderboardWnd:ShowAchievement( achvId, rank )

end


--
function UI.HangarWnd:ShowTitle( titleId )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowTitle()[ERROR]: not on screen" )
		return
	end

	UI:ShowProfile( UI:GetLocalPlayerUid(), "TITLES", true, nil, nil )
	UI.Profile_Wnd:ShowTitle( titleId )

end


--
function UI.HangarWnd:UpdateVoteWndPosition()

	local x = self:XToWindow( ( 1024 - UI.Vote_Wnd:GetWidth() ) / 2 )
	local y = self:YToWindow( ( 768 - UI.Vote_Wnd:GetHeight() ) / 2 )

	UI.Vote_Wnd:SetPos( x, y )

end


--
function UI.HangarWnd:UpdateMailWndPosition()

	local rect = UI.MailWnd:GetWorkRect()
	
	local x = self:XToWindow( ( 1024 - rect.z ) / 2 ) - rect.x
	local y = self:YToWindow( ( 768 - rect.w ) / 2 ) - rect.y

	UI.MailWnd:SetPos( x, y )

end


--
function UI.HangarWnd:MasterServer_OnAttachSteamAccount( result, requestId, param1, param2 )

	UI.Yup2GoldWnd:MasterServer_OnAttachSteamAccount( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:OnTradeResult_Sell( invItem, count )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:OnTradeResult_Sell()[ERROR]: not on screen" )
		return
	end

	if invItem.itemType ~= UI.invItemTypes.SHIP then
		sys.log( "UI.HangarWnd:OnTradeResult_Sell()[ERROR]: unhandled item type: %s", tostring( invItem.itemType ) )
		return
	end

	self:DoSellShip( invItem.shipItem.vid )

end


--
function UI.HangarWnd:OnTradeResult_Buy( shopItem, count )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:OnTradeResult_Buy()[ERROR]: not on screen" )
		return
	end

	if UI:IsDefBundle( shopItem.defName ) then
		self:DoBuyBundle( shopItem )

	else
		sys.log( "UI.HangarWnd:OnTradeResult_Buy()[ERROR]: unhandled item type \"%s\"", shopItem.defName )
	end

end


--
function UI.HangarWnd:GetMenuTab()

	return self.menuTab

end


--
function UI.HangarWnd:GetPrepareState()

	return self.prepareState

end


--
function UI.HangarWnd:MasterServer_OnMailGet( result, requestId )

	UI.MailWnd:MasterServer_OnMailGet( result, requestId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.MailOpResult.MOR_OK then
		return
	end

	self:UpdateMailBtnState()	

end


--
function UI.HangarWnd:MasterServer_OnMailDeliver( result, requestId, param1, param2, u64Param )

	UI.MailWnd:MasterServer_OnMailDeliver( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.MailOpResult.MOR_OK then
		return
	end

	self:UpdateMailBtnState()	

end


--
function UI.HangarWnd:MasterServer_OnMailRemove( result, requestId, unused, unused, mailId )

	UI.MailWnd:MasterServer_OnMailRemove( result, requestId, unused, unused, mailId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.MailOpResult.MOR_OK then
		return
	end

	self:UpdateMailBtnState()	

end


--
function UI.HangarWnd:MasterServer_OnMailExpired( result, requestId, unused, unused, mailId )

	UI.MailWnd:MasterServer_OnMailExpired( result, requestId, unused, unused, mailId )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.MasterServer.MailOpResult.MOR_OK then
		return
	end

	self:UpdateMailBtnState()

end


--
function UI.HangarWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

	UI.MailWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.MailCreateWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.DebriefingOWWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.ArenaWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.SquadFinder_GroupsWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.SquadFinder_MyGroupWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.ProfileWnd_new:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )
	UI.Trading_AdvertsWnd:MasterServer_OnNickNameUpdate( result, requestId, uid, nickName )

end


--
function UI.HangarWnd:GameStore_OnSpoiled( result, requestId )

	UI.ShopWnd:GameStore_OnSpoiled( result, requestId )
	UI.EquipmentWnd:GameStore_OnSpoiled( result, requestId )
	UI.ShipsTreeWnd:GameStore_OnSpoiled( result, requestId )
	UI.ItemCraftMultiWnd:GameStore_OnSpoiled( result, requestId )
	UI.ItemCraftSingleWnd:GameStore_OnSpoiled( result, requestId )
	UI.MarketingWnd:GameStore_OnSpoiled( result, requestId )

	if result ~= 0 then
		return
	end

	if self:IsOnScreen() then

		UI.Hangar_TradeWnd:UnlinkFromParent()
		UI.Hangar_BuyWnd:UnlinkFromParent()

		if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
			UI.BuyBundleWnd:UnlinkFromParent()
		end

		UI.Hangar_BuyWithInventoryWnd:UnlinkFromParent()
    	self.itemToBuy = nil

		self:ReloadShop()

	else
		self.bShopNeedReload = true
	end

end


--
function UI.HangarWnd:GameStore_OnLoadingComplete( storeSize )

	UI.ShopWnd:GameStore_OnLoadingComplete( storeSize )
	UI.EquipmentWnd:GameStore_OnLoadingComplete( storeSize )
	UI.ShipsTreeWnd:GameStore_OnLoadingComplete( storeSize )
	UI.ItemCraftMultiWnd:GameStore_OnLoadingComplete( storeSize )
	UI.ItemCraftSingleWnd:GameStore_OnLoadingComplete( storeSize )
	UI.MarketingWnd:GameStore_OnLoadingComplete( storeSize )
	UI.GoldArcWnd:GameStore_OnLoadingComplete( storeSize )
	UI.Yup2GoldWnd:GameStore_OnLoadingComplete( storeSize )
	UI.MailCreateWnd:GameStore_OnLoadingComplete( storeSize )

	UI.Hangar_TradeWnd:UnlinkFromParent()
	UI.Hangar_BuyWnd:UnlinkFromParent()

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
		UI.BuyBundleWnd:UnlinkFromParent()
	end

	UI.Hangar_BuyWithInventoryWnd:UnlinkFromParent()
    self.itemToBuy = nil

	if self.bWaitingStore then
		self.bWaitingStore = false
		self:UpdateWaitingWnd()
	end

	if self:IsOnScreen() then
		self:UpdateShipsMenuBtnSale()
		UI.Hangar_BundlesBtn:OnLoadingComplete()
	end

end


--
function UI.HangarWnd:GameStore_OnLoadingTimeout()

	if self.bWaitingStore then

		self.bWaitingStore = false
		self:UpdateWaitingWnd()

		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_timeOut" ), UI.MBS_OK )

	end

end


--
function UI.HangarWnd:ShowBuyGoldWnd()

--[[	self:SetNotificationsMode( self.notificationsModes.POP_UPS )
	self:HideMail( false )

	if _G.Arc_IsInitialized() then
	    UI.GoldArcWnd:Show()
	else
		UI.Yup2GoldWnd:Show()
	end ]]

	UI:PlayGlobalSound( UI.HangarWnd.sounds.yup2GoldWndShow ) 

end


--
function UI.HangarWnd:ShowBuyCreditsWnd()

	self:SetNotificationsMode( self.notificationsModes.POP_UPS )
	self:HideMail( false )

	UI.Gold2CreditsWnd:Show()
	UI:PlayGlobalSound( UI.HangarWnd.sounds.gold2CreditsWndShow )

end


--
function UI.HangarWnd:MasterServer_OnMailSend( result, requestId, param1, param2, u64Param )

	UI.MailCreateWnd:MasterServer_OnMailSend( result, requestId, param1, param2, u64Param )

end

--
function UI.HangarWnd:SetInLobby( bool )
	if bool then
		UI.HangarWnd:SetPrepareState( self.prepareStates.MATCHMAKING )
	else
		UI.HangarWnd:SetPrepareState( self.prepareStates.NONE )
	end
end


--
function UI.HangarWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

	UI.GameplayPveMapWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )
	--UI.HudAdventureWnd:MasterServer_OnAdventures( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

	UI.GameplayPveMapWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnAdventureCancel( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

	UI.QuestInfoWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnQuests( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnQuests( result, requestId, param1, param2 )	
	UI.Hangar_QuestsWnd:MasterServer_OnQuests( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )

	UI.QuestInfoWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnAcceptQuest( result, requestId, param1, param2 )
	self:UpdateStartBtnState()
	--UI.GameplayWnd:UpdateQuestAvailable()

end


--
function UI.HangarWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )

	UI.QuestInfoWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnCompleteQuest( result, requestId, param1, param2 )
	self:UpdateStartBtnState()
	--UI.GameplayWnd:UpdateQuestAvailable()

end


--
function UI.HangarWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )

	UI.QuestInfoWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnChangeQuest( result, requestId, param1, param2 )
	self:UpdateStartBtnState()
	--UI.GameplayWnd:UpdateQuestAvailable()

end


--
function UI.HangarWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

	UI.QuestInfoWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )
	UI.ShipsTreeWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )
	UI.GameplayPveMapWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )
	UI.Hangar_QuestsWnd:MasterServer_OnQuestGroupsCooldownEnd( groups )

end


--
function UI.HangarWnd:MasterServer_OnPremiumStatus( result, requestId, param1, param2 )

	UI.Hangar_BuyWnd:MasterServer_OnPremiumStatus( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnAdventureFinal( param )

	UI.GameplayPveMapWnd:MasterServer_OnAdventureFinal( param )
	UI.Hangar_QuestsWnd:MasterServer_OnAdventureFinal( param )

end


--
function UI.HangarWnd:MasterServer_OnNewAdventure( param )

	UI.GameplayPveMapWnd:MasterServer_OnNewAdventure( param )
	UI.Hangar_QuestsWnd:MasterServer_OnNewAdventure( param )

end


--
function UI.HangarWnd:OnUpdateAdventureOffers( giverObject )

	UI.HudAdventureWnd:OnUpdateAdventureOffers( giverObject )

end


--
function UI.HangarWnd:ShowShipPreview( defName )

	if type( defName ) ~= "string" then
		sys.log( "UI.HangarWnd:ShowShipPreview()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if defName == "" then
		sys.log( "UI.HangarWnd:ShowShipPreview()[ERROR]: empty defName" )
		return
	end
	
	if defName == self.previewShipDefName and self.menuTab == self.menuTabs.SHIP_PREVIEW then
		return
	end
	
	local previewShipLaunchData = self:MakePreviewLaunchData()
	
	self:ResetPreviewShip()

	self:TrySetMenuTab( self.menuTabs.SHIP_PREVIEW, true, false, { fn = UI.HangarWnd.ShowShipPreview, params = { self, defName } } )

	if self.menuTab == self.menuTabs.SHIP_PREVIEW then

		self.previewShipDefName = defName
		
		if self.selShipSlotIdx == -1 then
			self.selShipSlotIdx = 1
		end
		
		self:UpdateShipEntInSlot( self.selShipSlotIdx )

		if self:GetSelBattleSlot() ~= -1 then
			self:SelectBattleSlot( -1 )
		else
			self:OnSelShipChanged()
		end		
		
		self.previewShipLaunchData = previewShipLaunchData

	end

end


--
function UI.HangarWnd:ShowShipCraft( defName, launchData, dataToRestore )

	if type( defName ) ~= "string" then
		sys.log( "UI.HangarWnd:ShowShipCraft()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if defName == "" then
		sys.log( "UI.HangarWnd:ShowShipCraft()[ERROR]: empty defName" )
		return
	end
	
	self:ResetPreviewShip()

	self:TrySetMenuTab( self.menuTabs.SHIP_CRAFT, true, false, { fn = UI.HangarWnd.ShowShipCraft, params = { self, defName, launchData, dataToRestore } } )

	if self.menuTab == self.menuTabs.SHIP_CRAFT then

		self.previewShipDefName = defName
		
		if self.selShipSlotIdx == -1 then
			self.selShipSlotIdx = 1
		end
		
		self:UpdateShipEntInSlot( self.selShipSlotIdx )

		if self:GetSelBattleSlot() ~= -1 then
			self:SelectBattleSlot( -1 )
		else
			self:OnSelShipChanged()
		end		

		if not UI.bSavingGameState then
			UI.ShipCraftWnd:Setup( defName, launchData, dataToRestore )
		end

	end

end 


--
function UI.HangarWnd:ShowShipBuyWnd( defName, launchData, bSound )

	if type( defName ) ~= "string" then
		sys.log( "UI.HangarWnd:ShowShipWnd()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if defName == "" then
		sys.log( "UI.HangarWnd:ShowShipBuyWnd()[ERROR]: empty defName" )
		return
	end
	
	self:ResetPreviewShip()

	self:TrySetMenuTab( self.menuTabs.SHIP_BUY, bSound, false, { fn = UI.HangarWnd.ShowShipBuyWnd, params = { self, defName, launchData, bSound } } )

	if self.menuTab == self.menuTabs.SHIP_BUY then

		self.previewShipDefName = defName
		
		if self.selShipSlotIdx == -1 then
			self.selShipSlotIdx = 1
		end
		
		self:UpdateShipEntInSlot( self.selShipSlotIdx )

		if self:GetSelBattleSlot() ~= -1 then
			self:SelectBattleSlot( -1 )
		else
			self:OnSelShipChanged()
		end		

		if not UI.bSavingGameState then
			UI.ShipWnd:Setup( defName, launchData, dataToRestore )
		end

	end

end 


--
function UI.HangarWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.SynergyTransferWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.Profile_CommonWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )
	UI.EquipmentWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	if result == _G.GameStore.StoreBuyResult.SBR_OK then

    	if self:IsOnScreen() then

        	local vid = u64( param1, param2 )
			self:OnVesselExpChanged( vid )

		end

	else

		if requestId == self.shipUpgradeRequestId then
			self:ShowMsgOnShipUpgradeError( result )
		end

	end

	if requestId == self.shipUpgradeRequestId then
		self.shipUpgradeRequestId = 0
		UI.ShipsTreeWnd:OnHangarWaitingShipUpgradeChanged()
	end

end


--
function UI.HangarWnd:GameStore_OnExtractVesselExp( result, requestId, vids )

	UI.SynergyTransferWnd:GameStore_OnExtractVesselExp( result, requestId, vids )
	UI.ShipsTreeWnd:GameStore_OnExtractVesselExp( result, requestId, vids )
	UI.EquipmentWnd:GameStore_OnExtractVesselExp( result, requestId, vids )

	if result ~= 0 then
		return
	end

	if not self:IsOnScreen() then
		return
	end

	for shipIdx, vid in pairs( vids ) do
		self:OnVesselExpChanged( vid )
	end

end


--
function UI.HangarWnd:MasterServer_OnFreeSpaceDebriefing( data )

	if self:IsOnScreen() then
		self:ShowDebriefingOW( data )
		self.owDebriefingData = nil
	else
		self.owDebriefingData = data
	end

end


--
function UI.HangarWnd:OnDebriefing( gameResult )

	local bCanShowDebriefing = not UI.Tutorial:IsActive()
	
	if bCanShowDebriefing then
	
		if type( gameResult ) == "table" then
		
			if gameResult.gameMode == ai.Gameplay.TUTORIAL then
				bCanShowDebriefing = false
			end
			
			if ( gameResult.gameMode == ai.Gameplay.PRACTICE or gameResult.singleplayer ) and not UI.bShowDebriefingAfterPractice then
				bCanShowDebriefing = false
			end
			
		end
		
	end

	if not bCanShowDebriefing then
		return
	end

	local debriefingData = { gameResult = gameResult, lootItems = {} }

	if self:IsOnScreen() then
		self:ShowDebriefing( debriefingData )
		self.debriefingData = nil
	else
		self.debriefingData = debriefingData
	end

end


--
function UI.HangarWnd:OnLootCompleted( lootItems )

	if self.debriefingData then
		self.debriefingData.lootItems = lootItems
	end

end


--
function UI.HangarWnd:IsSuitableForStartupWindows()

	if not self:IsOnScreen() then
		return false
	end

	-- 1. это должен быть не первый ангар для игрока
	if self.bFirstHangarForPalyer then
		return false
	end	

	-- 2. это должен быть первый ангар в данной сессии логина
	if not self.bFirstHangarForLoginSession then
		return false
	end	

	return true

end


--
function UI.HangarWnd:MasterServer_OnSquadInfo( result, requestId, param1, param2 )

	UI.HelpListWnd:MasterServer_OnSquadInfo( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnSquadInviteAccept( result, requestId, uid, param2 )

	UI.HelpListWnd:MasterServer_OnSquadInviteAccept( result, requestId, uid, param2 )

end


--
function UI.HangarWnd:MasterServer_OnSquadLeave( result, requestId, param1, param2 )

	UI.HelpListWnd:MasterServer_OnSquadLeave( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnSquadInviteSend( result, requestId, param1, param2 )

	UI.HelpListWnd:MasterServer_OnSquadInviteSend( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnSquadNotification( type, squad, uid, params )

	UI.HelpListWnd:MasterServer_OnSquadNotification( type, squad, uid, params )
	UI.SquadFinder_MyGroupWnd:MasterServer_OnSquadNotification( type, squad, uid, params )

end


--
function UI.HangarWnd:OnCheckReadyFail()

	if self.hMsgReadyCheck ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgReadyCheck )
		self.hMsgReadyCheck = UI.INVALID_UI_HANDLE		
	end

end


--
function UI.HangarWnd:OnShipDDDrop( ddData, dstWnd )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: hangar is not on screen" )
		return
	end

	if UI:IsWaitingRequests() then
		return
	end

	if type( ddData ) ~= "table" then
		sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: invalid type of the 1-st parameter (\"ddData\"); \"table\" expected, got \"%s\"", type( ddData ) )
		return
	end

	if type( ddData.vid ) ~= "userdata" then
		sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: invalid type of the field \"ddData.vid\"; \"userdata\" expected, got \"%s\"", type( ddData.vid ) )
		return
	end

	if type( ddData.srcType ) ~= "number" then
		sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: invalid type of the field \"ddData.srcType\"; \"number\" expected, got \"%s\"", type( ddData.srcType ) )
		return
	end

	if UI:Val2Key( UI.ShipDDWnd.srcTypes, ddData.srcType ) == "" then
		sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: invalid \"ddData.srcType\"; one of the \"UI.ShipDDWnd.srcTypes\" values expected, got %d", ddData.srcType )
		return
	end

	if dstWnd ~= nil then

    	if type( dstWnd ) ~= "table" then
    		sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: invalid type of the 2-nd parameter (\"dstWnd\"); \"table\" or \"nil\" expected, got \"%s\"", type( dstWnd ) )
    		return
    	end

    	if not UI:IsWndKindOf( dstWnd, "Hangar_ShipSlotWnd_proto" ) and not UI:IsWndKindOf( dstWnd, "ShipsTree_BattleSlotWnd" ) then
    		sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: dstWnd is not of handled type" )
    		return
    	end

	end

	if dstWnd then

    	if not dstWnd:IsShipDDFit( ddData ) then
    		return
    	end

		if UI:IsWndKindOf( dstWnd, "Hangar_ShipSlotWnd_proto" ) or ( UI:IsWndKindOf( dstWnd, "ShipsTree_BattleSlotWnd" ) and not UI:IsWndKindOf( dstWnd, "ShipsTree_QuestShipSlotWnd" ) ) then	-- ShipsTree_QuestShipSlotWnd наследует от ShipsTree_BattleSlotWnd

        	local slotIdx = dstWnd:GetRecord()
    		local bSwapShips = ddData.srcType == UI.ShipDDWnd.srcTypes.BATTLE_SLOT

			local bSuccess = false

        	if self.menuTab == self.menuTabs.SHIPS then
        		bSuccess = UI.ShipsTreeWnd:ChangeShipInBattleSlot( slotIdx, ddData.vid, true, bSwapShips )
        	else
        		bSuccess = self:ChangeShipInBattleSlot( slotIdx, ddData.vid, bSwapShips )
        	end

			if bSuccess then
				self.slotToSelectAfterChangeShip = slotIdx
			end

		elseif UI:IsWndKindOf( dstWnd, "ShipsTree_QuestShipSlotWnd" ) then

        	local slotIdx = dstWnd:GetRecord()
    		local bSwapShips = ddData.srcType == UI.ShipDDWnd.srcTypes.QUEST_SHIP

			UI.ShipsTreeWnd:SetQuestShip( ddData.vid, slotIdx, bSwapShips, true, true )

		end

	else

		if ddData.srcType == UI.ShipDDWnd.srcTypes.BATTLE_SLOT then
			
			local srcBattleSlotId = UI:GetShipBattleSlotByVid( ddData.vid )
			if srcBattleSlotId ~= -1 then

            	if self.menuTab == self.menuTabs.SHIPS then
            		UI.ShipsTreeWnd:ChangeShipInBattleSlot( srcBattleSlotId, UI.INVALID_U64_ID, true )
            	else
            		self:ChangeShipInBattleSlot( srcBattleSlotId, UI.INVALID_U64_ID )
            	end

			else
				sys.log( "UI.HangarWnd:OnShipDDDrop()[ERROR]: cannot find source ship battle slot" )
			end

		elseif ddData.srcType == UI.ShipDDWnd.srcTypes.QUEST_SHIP then

			if UI.ShipsTreeWnd:IsOnScreen() then
				UI.ShipsTreeWnd:SetQuestShip( UI.INVALID_U64_ID, ddData.questSlotIdx, false, true )
			end

		end
		
	end

end


--
function UI.HangarWnd:OnClientStatsToggleBind()

	UI.HangarClientStatsWnd:OnClientStatsToggleBind()

end


--
function UI.HangarWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

	UI.ShipCraftWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.PveWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )
	UI.AutogenUpgradeWnd:MasterServer_OnCraftResources( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

	UI.ShopWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.ShipCraftWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.ItemCraftMultiWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.PveWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )
	UI.AutogenUpgradeWnd:MasterServer_OnUseCraftResource( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

	UI.ShopWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.ShipCraftWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.PveWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )
	UI.AutogenUpgradeWnd:MasterServer_OnSellCraftResource( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

	UI.ShopWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.ShipCraftWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.ShipWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.BuyBundleWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.PveWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )
	UI.AutogenUpgradeWnd:MasterServer_OnSellCraftResources( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

	UI.ItemCraftMultiWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.ShipCraftWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.ShipWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.Hangar_BuyWithInventoryWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.BuyBundleWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.EquipmentWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.PveWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )
	UI.AutogenUpgradeWnd:GameStore_OnCraftUpgradeItem( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )

	UI.GameplayPveMapWnd:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnFreeSpaceAccess( result, requestId, param1, param2 )

	local hasAccess = _G.MasterServer_HasFreeSpaceAccess()

	if self.hasFreeSpaceAccess ~= nil then
		if self.hasFreeSpaceAccess ~= hasAccess then
			if self.hasFreeSpaceAccess then
				self:ShowFreeSpaceDisabledMsg()
			end
		end
	end

	self.hasFreeSpaceAccess = hasAccess

	if self:IsOnScreen() then
		UI.HangarWnd:UpdateStartBtnState()
	end
	
	UI.Profile_CommonWnd:UpdateFreeSpaceElements()

end


--
function UI.HangarWnd:OnBindsChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateMenuBtnsTooltips()

end


--
function UI.HangarWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

	UI.ItemCraftMultiWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )
	UI.ItemCraftSingleWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnBlueprints( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

	UI.ItemCraftMultiWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.ItemCraftSingleWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.ShipsTreeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.ShipWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.BuyBundleWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.EquipmentWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.ProfileWnd_new:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.PveWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )
	UI.AutogenUpgradeWnd:MasterServer_OnLearnBlueprints( result, requestId, defName )

end


--
function UI.HangarWnd:GameStore_OnBuyArcDLC( result, requestId, param1, param2 )

	UI.Yup2GoldWnd:GameStore_OnBuyArcDLC( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:OpenItemCraftMultiForBlueprint( blueprintDefName, launchData )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:OpenItemCraftMultiForBlueprint()[ERROR]: hangar is not on screen" )
		return
	end

	UI.ItemCraftMultiWnd:SetLaunchData( launchData )

	if self.menuTab ~= self.menuTabs.ITEM_CRAFT then
		self:TrySetMenuTab( self.menuTabs.ITEM_CRAFT, true, false, { fn = UI.HangarWnd.OpenItemCraftMultiForBlueprint, params = { self, blueprintDefName, launchData } } )
	end

	if self.menuTab ~= self.menuTabs.ITEM_CRAFT then
		return
	end

	UI.ItemCraftMultiWnd:ShowAndSelectBlueprint( blueprintDefName )

	self:HideOverlayWindows()

end


--
function UI.HangarWnd:ShowItemCraftMulti( launchData, dataToRestore, bSound )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowItemCraftMulti()[ERROR]: hangar is not on screen" )
		return
	end

	if self.menuTab ~= self.menuTabs.ITEM_CRAFT then
		self:TrySetMenuTab( self.menuTabs.ITEM_CRAFT, bSound, false, { fn = UI.HangarWnd.ShowItemCraftMulti, params = { self, launchData, dataToRestore, bSound } } )
	end

	if self.menuTab ~= self.menuTabs.ITEM_CRAFT then
		return
	end

	UI.ItemCraftMultiWnd:SetLaunchData( launchData, dataToRestore )

	self:HideOverlayWindows()

end


--
function UI.HangarWnd:ShowItemCraftSingle( itemDefName, bEnchanted, launchData, bApplyLaunchContextImmediate, dataToRestore, bSound, blueprintDefName )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowItemCraftSingle()[ERROR]: hangar is not on screen" )
		return
	end

	if bSound == nil then
		bSound = true
	end

	self:HideOverlayWindows()

	UI.ItemCraftSingleWnd:Setup( itemDefName, blueprintDefName, bEnchanted, launchData, bApplyLaunchContextImmediate, dataToRestore )
	UI.ItemCraftSingleWnd:Show()

	if bSound then
		UI:PlayGlobalSound( self.sounds.tradeWndShow )
	end

end


--
function UI.HangarWnd:FB_OnEvent( eventId, success, errorCode )

	UI.PlayerProgressWnd:FB_OnEvent( eventId, success, errorCode )
	UI.SaleAdvert_AdvertWnd:FB_OnEvent( eventId, success, errorCode )
	UI.DebriefingWnd:FB_OnEvent( eventId, success, errorCode )
	
end


--
function UI.HangarWnd:VK_OnEvent( eventId, success, errorCode )

	UI.PlayerProgressWnd:VK_OnEvent( eventId, success, errorCode )
	UI.SaleAdvert_AdvertWnd:VK_OnEvent( eventId, success, errorCode )
	UI.DebriefingWnd:VK_OnEvent( eventId, success, errorCode )
	
end


--
function UI.HangarWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

	UI.ShopWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )
	UI.EquipmentWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )
	UI.ShipsTreeWnd:MasterServer_OnDisassembleItem( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:OnInvasionInfo( spawned, killed )
	
	UI.QuestInfoWnd:OnInvasionInfo( spawned, killed )
	UI.GameplayPveMapWnd:OnInvasionInfo( spawned, killed )
	UI.Hangar_QuestsWnd:OnInvasionInfo( spawned, killed )

end


--
function UI.HangarWnd:SkillManager_OnBuyTalentSet( result, requestId, param1, param2 )

	UI.TalentsWnd:SkillManager_OnBuyTalentSet( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:SkillManager_OnSetTalentBindings( result, requestId, param1, param2 )

	UI.TalentsWnd:SkillManager_OnSetTalentBindings( result, requestId, param1, param2 )

	if result == _G.MasterServer.GenericResponderResult.GRR_OK then

		if self:IsOnScreen() then
			self:UpdateTalentsMenuBtnBlink()
			self:UpdateShipEntTalents()
		end

	end

end


--
function UI.HangarWnd:OnClientStatsSlotsChanged()

	if UI.HangarClientStatsWnd:IsChildOf( self ) then
		self:UpdateTimePos()
	end

end


--
function UI.HangarWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )
	UI.QuestInfoWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnShipQuests( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )
	UI.QuestInfoWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnStartShipQuest( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

	UI.ShipsTreeWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )
	UI.QuestInfoWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )
	UI.Hangar_QuestsWnd:MasterServer_OnEndShipQuest( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnShipQuestTime( retCode, requestId, questId )

	UI.QuestInfoWnd:MasterServer_OnShipQuestTime( retCode, requestId, questId )
	UI.GameplayPveMapWnd:MasterServer_OnShipQuestTime( retCode, requestId, questId )
	UI.Hangar_QuestsWnd:MasterServer_OnShipQuestTime( retCode, requestId, questId )

end


--
function UI.HangarWnd:LaunchQuestWnd( questId, questType, bSound )

	UI.QuestInfoWnd:Setup( questId, questType )
	UI.QuestInfoWnd:Show()

	if bSound then
		UI:PlayGlobalSound( self.sounds.showQuestWnd )
	end

end


--
function UI.HangarWnd:MasterServer_OnClanShipInfo( result, requestId, param1, param2 )

	UI.ClanShipWnd:MasterServer_OnClanShipInfo( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_OnClanShipBuildingChanged( shipName )

	UI.ClanShipWnd:MasterServer_OnClanShipBuildingChanged( shipName )

end


--
function UI.HangarWnd:MasterServer_OnClanShipBuild( result, requestId, shipName, partName, slotName )

	UI.ClanShipWnd:MasterServer_OnClanShipBuild( result, requestId, shipName, partName, slotName )

end


--
function UI.HangarWnd:MasterServer_OnClanBankTransfer( result, requestId, resource, amount )

	UI.ClanShipWnd:MasterServer_OnClanBankTransfer( result, requestId, resource, amount )

end


--
function UI.HangarWnd:MasterServer_OnResourceConvert( result, requestId, param1, param2 )

	UI.ClanShipWnd:MasterServer_OnResourceConvert( result, requestId, param1, param2 )

end


--
function UI.HangarWnd:MasterServer_ClanShipBuildingComplete( shipName )

	UI.ClanShipWnd:MasterServer_ClanShipBuildingComplete( shipName )

end


--
function UI.HangarWnd:MasterServer_OnClanShipFit( result, requestId, shipName )

	UI.ClanShipWnd:MasterServer_OnClanShipFit( result, requestId, shipName )

end


--
function UI.HangarWnd:MasterServer_OnUniverseGet( result, requestId )

	UI.GameplayChoiceWnd:MasterServer_OnUniverseGet( result, requestId )
	UI.DebriefingWnd:MasterServer_OnUniverseGet( result, requestId )

end


--
function UI.HangarWnd:MasterServer_OnClanShipLeave( shipName, zoneId )

	UI.ClanShipWnd:MasterServer_OnClanShipLeave( shipName, zoneId )

end


--
function UI.HangarWnd:ShowTourWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if UI.TourWnd:IsOnScreen() then
		return
	end

	UI.TourWnd:Show()

	if bSound then
		UI:PlayGlobalSound( self.sounds.tournamentShow )
	end


	self:UpdateStartBtnState()

end


--
function UI.HangarWnd:HideTourWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if not UI.TourWnd:IsOnScreen() then
		return
	end

	UI.TourWnd:UnlinkFromParent()

	if bSound then
		UI:PlayGlobalSound( self.sounds.tournamentHide )
	end

end


--
function UI.HangarWnd:MasterServer_OnEnterTournament( result, requestId, params )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then

		local strError = UI:Val2Key( _G.MasterServer.MMJoinResult, result )
		local strErrorLocalized = UI:GetStringByName( string.format( "mmError_%s", strError ) )

		if result == _G.MasterServer.MMJoinResult.MMJR_VESSEL_RANK_ALL or result == _G.MasterServer.MMJoinResult.MMJR_VESSEL_RANK_ANY then
			strErrorLocalized = string.gsub( strErrorLocalized, "%$min_rank%$", params.minRank )
			strErrorLocalized = string.gsub( strErrorLocalized, "%$max_rank%$", params.maxRank )

		elseif result == _G.MasterServer.MMJoinResult.MMJR_WING_SIZE_INCORRECT then
				
			strErrorLocalized = string.gsub( strErrorLocalized, "%$min_wing%$", params.minWing )
			strErrorLocalized = string.gsub( strErrorLocalized, "%$max_wing%$", params.maxWing )

			
		end

		local msg = UI:GetStringByName( "msg_mmError" )
		msg = string.format( msg, strErrorLocalized )

		UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

		if self.prepareState == self.prepareStates.MATCHMAKING_WAIT then
			self:SetPrepareState( self.prepareStates.NONE )
		end

		return

	end

	self:SetPrepareState( self.prepareStates.MATCHMAKING )	

end


--
function UI.HangarWnd:MasterServer_OnLeaveTournament( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:SetPrepareState( self.prepareStates.NONE )	
	self:HideTourWnd( false )

end


--
function UI.HangarWnd:MasterServer_OnTournamentTeamsInfo( result, requestId, round )

	UI.TourWnd:MasterServer_OnTournamentTeamsInfo( result, requestId, round )

	if result ~= 0 then
		return
	end

	local teamInfo = self.lastTourTeamInfo
	self.lastTourTeamInfo = _G.MasterServer_GetTournamentTeamsInfo()

	if not self:IsOnScreen() then
		return
	end

	if not UI:IsTourTeamExist() and UI:IsTourFinished() then

		UI:MessageBox( UI:GetStringByName( "msgCapt_tournamentEnded" ), UI:GetStringByName( "msg_tournamentEnded" ), UI.MBS_OK )
		self:SetPrepareState( self.prepareStates.NONE )
		return

	end

	if UI:IsTourTeamExist() and UI:IsInTournament() then

		if self:IsOnScreen() then
			if teamInfo == nil or teamInfo.finished then
				self:ShowTourWnd( true )
			end
		end

		if self.prepareState ~= self.prepareStates.MATCHMAKING then
			self:SetPrepareState( self.prepareStates.MATCHMAKING )
		end

	end

	-- показ результатов турнира
	if not _G.MasterServer_IsInTournament() then

		if self:IsOnScreen() then
			self:ShowTourWnd( true )
		else
			sys.log( "UI.HangarWnd:MasterServer_OnTournamentTeamsInfo()[ERROR]: cannot show tournament results - UI.HangarWnd is not on screen" )
		end

		self:SetPrepareState( self.prepareStates.NONE )

	end

end


--
function UI.HangarWnd:MasterServer_OnTournamentRoundStarted( result, requestId, round )

	UI.TourNotificationWnd:MasterServer_OnTournamentRoundStarted( result, requestId, round )

end


--
function UI.HangarWnd:MasterServer_OnTournamentRoundEnded( result, requestId, round )

	UI.TourNotificationWnd:MasterServer_OnTournamentRoundEnded( result, requestId, round )

end


--
function UI.HangarWnd:MasterServer_OnTournamentTeamAssigned()

	UI.TourNotificationWnd:MasterServer_OnTournamentTeamAssigned()

end


--
function UI.HangarWnd:MasterServer_OnTournamentFinished()

	UI.TourNotificationWnd:MasterServer_OnTournamentFinished()

end


--
function UI.HangarWnd:MasterServer_OnClanShipBoostBuilding( result, requestId, shipName )

	UI.ClanShipWnd:MasterServer_OnClanShipBoostBuilding( result, requestId, shipName )

end


--
function UI.HangarWnd:MasterServer_OnSquadInviteCancel( result, requestId, unused1, unused2, uid )

	UI.SquadWnd:MasterServer_OnSquadInviteCancel( result, requestId, unused1, unused2, uid )

	if requestId == self.cancelSquadInvitesRequestId then

		self.cancelSquadInvitesRequestId = 0

    	if result == _G.MasterServer.SquadOpResult.SOR_OK then

    		if self.prepareState == self.prepareStates.CANCEL_SQUAD_INVITES_WAIT then
    			self:CheckStartMatchMaking( self.prepareBattleSlot, self.prepareGameParams, self.prepareCheckReadyType, self.prepareEmm )
    		end

    	else

			self:ShowMsgOnCancelSquadInvitesError( result )

			if self.prepareState == self.prepareStates.CANCEL_SQUAD_INVITES_WAIT then
				self:SetPrepareState( self.prepareStates.NONE )
			end

    	end

	end

end


--
function UI.HangarWnd:ShowGameplayChoiceWnd( bSound )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowGameplayChoiceWnd()[ERROR]: not on screen" )
		return
	end

	if bSound == nil then
		bSound = false
	end

	self:TrySetMenuTab( UI.HangarWnd.menuTabs.MAIN, false, false, { fn = UI.HangarWnd.ShowGameplayChoiceWnd, params = { self, bSound } } )

	if self.menuTab ~= self.menuTabs.MAIN and self.menuTab ~= self.menuTabs.EMPTY then
		return
	end

	UI.GameplayChoiceWnd:Show()

	if bSound then
		UI:PlayGlobalSound( self.sounds.gameplaceChoiceShow )
	end

end


--
function UI.HangarWnd:HideGameplayChoiceWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if not UI.GameplayChoiceWnd:GetParent() then
		return
	end

	UI.GameplayChoiceWnd:UnlinkFromParent()

	if bSound and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.gameplaceChoiceHide )
	end

end


--
function UI.HangarWnd:ShowPveChoiceWnd( mode, bSound )

	if not self:IsOnScreen() and mode == UI.PveChoiceWnd.modes.CHOICE then
		sys.log( "UI.HangarWnd:ShowPveChoiceWnd()[ERROR]: not on screen" )
		return
	end

	if UI.PveChoiceWnd:GetParent() and UI.PveChoiceWnd:GetMode() == mode then
		return
	end

	if bSound == nil then
		bSound = false
	end

	UI.PveChoiceWnd:Setup( mode )
	UI.PveChoiceWnd:Show()

    self:UpdateStartBtnState()

	if bSound then
		UI:PlayGlobalSound( self.sounds.pveChoiceShow )
	end

end


--
function UI.HangarWnd:HidePveChoiceWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if not UI.PveChoiceWnd:GetParent() then
		return
	end

	UI.PveChoiceWnd:UnlinkFromParent()
    self:UpdateStartBtnState()

	if bSound and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.pveChoiceHide )
	end

end


--
function UI.HangarWnd:ShowPveWnd( bSound )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowPveWnd()[ERROR]: not on screen" )
		return
	end

	if UI.PveWnd:GetParent() then
		return
	end

	if bSound == nil then
		bSound = false
	end
	
	UI.PveWnd:Show()

    self:UpdateStartBtnState() 	-- tODO: надо?

	if bSound then
		UI:PlayGlobalSound( self.sounds.pveChoiceShow )
	end

end


--
function UI.HangarWnd:HidePveWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if not UI.PveWnd:GetParent() then
		return
	end

	UI.PveWnd:UnlinkFromParent()
    self:UpdateStartBtnState()	-- tODO: надо?

	if bSound and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.pveChoiceHide )
	end
	
end


--
function UI.HangarWnd:ShowArenaWnd( bMatchmaking, bSound )

	if not self:IsOnScreen() and not bMatchmaking then
		sys.log( "UI.HangarWnd:ShowArenaWnd()[ERROR]: not on screen" )
		return
	end

	if bSound == nil then
		bSound = false
	end

	local bWasOnScreen = UI.ArenaWnd:IsOnScreen()

	UI.ArenaWnd:Setup( bMatchmaking )
	UI.ArenaWnd:Show()

    self:UpdateStartBtnState()

	if bSound and not bWasOnScreen then
		UI:PlayGlobalSound( self.sounds.arenaShow )
	end

end


--
function UI.HangarWnd:HideArenaWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if not UI.ArenaWnd:GetParent() then
		return
	end

	UI.ArenaWnd:UnlinkFromParent()
    self:UpdateStartBtnState()

	if bSound and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.arenaHide )
	end

end


--
function UI.HangarWnd:OnSquadDataChanged()

	UI.DebriefingWnd:OnSquadDataChanged()
	UI.ArenaWnd:OnSquadDataChanged()
	UI.SquadFinder_GroupsWnd:OnSquadDataChanged()
	UI.Hangar_SquadBtn:OnSquadDataChanged()
	UI.PveWnd:OnSquadDataChanged()

	self:UpdateStartBtnState()

end


--
function UI.HangarWnd:IsShownInLoginSession()

	return self.bShownInLoginSession

end


--
function UI.HangarWnd:NeedShowDebriefing()

	return self.debriefingData ~= nil

end


--
function UI.HangarWnd:MasterServer_OnLeagueTeamNameUpdate( result, requestId, ltid, teamName )

	UI.ArenaWnd:MasterServer_OnLeagueTeamNameUpdate( result, requestId, ltid, teamName )

end


--
function UI.HangarWnd:ShowArenaLeaderboards( bMajor )

	if self.menuTab ~= self.menuTabs.LEADERBOARDS then
		self:TrySetMenuTab( self.menuTabs.LEADERBOARDS , true, false, { fn = UI.HangarWnd.ShowArenaLeaderboards, params = { self, bMajor } } )
	end

	if self.menuTab ~= self.menuTabs.LEADERBOARDS then
		return
	end

	UI.LeaderboardWnd:ShowArenaLeaderboards( bMajor )

	self:HideOverlayWindows()		

end


--
function UI.HangarWnd:GetBottomPanelY()

	return self:YToWindow( 768 )

end


-- низ полной высоты панели, включая кнопку профиля, которая выступает за фон
function UI.HangarWnd:GetTopPanelBtm()

	return self:YToScreen( UI.Hangar_TopPanelWnd:GetTop() + UI.Hangar_TopPanelWnd:GetHeight() )

end


-- низ фона панели
function UI.HangarWnd:GetTopPanelBtm2()

	return self:YToScreen( UI.Hangar_TopPanelWnd:GetTop() + UI.Hangar_TopPanelWnd:GetBgHeight() )

end


--
function UI.HangarWnd:ShowActions( bSound )

	if bSound == nil then
		bSound = false
	end

	-- вызывается ДО TrySetMenuTab(), чтобы при показе окна не установилась дефолтная закладка и, соответственно, ненужное окно стало бы апдейтиться
	UI.MarketingWnd:SetMode( UI.MarketingWnd.modes.ACTIONS )

	if self.menuTab ~= self.menuTabs.MARKETING then
    	self:TrySetMenuTab( self.menuTabs.MARKETING, bSound, false, { fn = UI.HangarWnd.ShowActions, params = { self, bSound } } )
	end

	if self.menuTab == self.menuTabs.MARKETING then

		if UI.MarketingWnd:GetMode() == UI.MarketingWnd.modes.ACTIONS then
			UI.SaleAdvert:SetAlreadyShow()
		else
			sys.log( "UI.HangarWnd:ShowActions()[ERROR]: invalid marketing mode" )
		end

	end

end


--
function UI.HangarWnd:ShowBundles( bSound, launchData )

	if bSound == nil then
		bSound = false
	end

	-- вызывается ДО TrySetMenuTab(), чтобы при показе окна не установилась дефолтная закладка и, соответственно, ненужное окно стало бы апдейтиться
	UI.MarketingWnd:SetMode( UI.MarketingWnd.modes.BUNDLES )

	if self.menuTab ~= self.menuTabs.MARKETING then
    	self:TrySetMenuTab( self.menuTabs.MARKETING, bSound, false, { fn = UI.HangarWnd.ShowBundles, params = { self, bSound, launchData } } )
	end

	if self.menuTab == self.menuTabs.MARKETING then

		if UI.MarketingWnd:GetMode() == UI.MarketingWnd.modes.BUNDLES then

    		if launchData then
    			UI.MarketingWnd:SetLaunchData( launchData )
    		end

		else
			sys.log( "UI.HangarWnd:ShowBundles()[ERROR]: invalid marketing mode" )
		end

	end

end


--
function UI.HangarWnd:OpenFreeBundle( bSound )

	if bSound == nil then
		bSound = false
	end

	-- вызывается ДО TrySetMenuTab(), чтобы при показе окна не установилась дефолтная закладка и, соответственно, ненужное окно стало бы апдейтиться
	UI.MarketingWnd:SetMode( UI.MarketingWnd.modes.BUNDLES )

	if self.menuTab ~= self.menuTabs.MARKETING then
    	self:TrySetMenuTab( self.menuTabs.MARKETING, bSound, false, { fn = UI.HangarWnd.OpenFreeBundle, params = { self, bSound } } )
	end

	if self.menuTab == self.menuTabs.MARKETING then

		if UI.MarketingWnd:GetMode() == UI.MarketingWnd.modes.BUNDLES then
			UI.MarketingWnd:OpenFreeBundle()
		else
			sys.log( "UI.HangarWnd:OpenFreeBundle()[ERROR]: invalid marketing mode" )
		end

	end

end


--
function UI.HangarWnd:OpenBundle( defName, bSound, launchData )

	if bSound == nil then
		bSound = false
	end

	-- вызывается ДО TrySetMenuTab(), чтобы при показе окна не установилась дефолтная закладка и, соответственно, ненужное окно стало бы апдейтиться
	UI.MarketingWnd:SetMode( UI.MarketingWnd.modes.BUNDLES )

	if self.menuTab ~= self.menuTabs.MARKETING then
    	self:TrySetMenuTab( self.menuTabs.MARKETING, bSound, false, { fn = UI.HangarWnd.OpenBundle, params = { self, defName, bSound, launchData } } )
	end

	if self.menuTab == self.menuTabs.MARKETING then

		if UI.MarketingWnd:GetMode() == UI.MarketingWnd.modes.BUNDLES then

    		if launchData then
    			UI.MarketingWnd:SetLaunchData( launchData )
    		end

    		UI.MarketingWnd:OpenBundle( defName )

		else
			sys.log( "UI.HangarWnd:OpenBundle()[ERROR]: invalid marketing mode" )
		end

	end

end


--
function UI.HangarWnd:OpenAction( actionId, bSound, launchData )

	if bSound == nil then
		bSound = false
	end

	-- вызывается ДО TrySetMenuTab(), чтобы при показе окна не установилась дефолтная закладка и, соответственно, ненужное окно стало бы апдейтиться
	UI.MarketingWnd:SetMode( UI.MarketingWnd.modes.ACTIONS )

	if self.menuTab ~= self.menuTabs.MARKETING then
    	self:TrySetMenuTab( self.menuTabs.MARKETING, bSound, false, { fn = UI.HangarWnd.OpenAction, params = { self, actionId, bSound, launchData } } )
	end

	if self.menuTab == self.menuTabs.MARKETING then

		if UI.MarketingWnd:GetMode() == UI.MarketingWnd.modes.ACTIONS then

    		if launchData then
    			UI.MarketingWnd:SetLaunchData( launchData )
    		end

    		UI.MarketingWnd:OpenAction( actionId )

		else
			sys.log( "UI.HangarWnd:OpenAction()[ERROR]: invalid marketing mode" )
		end

	end

end


--
function UI.HangarWnd:ShowVouchers( bSound )

	if bSound == nil then
		bSound = false
	end

	-- вызывается ДО TrySetMenuTab(), чтобы при показе окна не установилась дефолтная закладка и, соответственно, ненужное окно стало бы апдейтиться
	UI.MarketingWnd:SetMode( UI.MarketingWnd.modes.VOUCHERS )

	if self.menuTab ~= self.menuTabs.MARKETING then
    	self:TrySetMenuTab( self.menuTabs.MARKETING, bSound, false, { fn = UI.HangarWnd.ShowVouchers, params = { self, bSound } } )
	end

end


--
function UI.HangarWnd:ShowLicenses( bSound, launchData )

	if bSound == nil then
		bSound = false
	end

	-- вызывается ДО TrySetMenuTab(), чтобы при показе окна не установилась дефолтная закладка и, соответственно, ненужное окно стало бы апдейтиться
	UI.MarketingWnd:SetMode( UI.MarketingWnd.modes.LICENSES )

	if self.menuTab ~= self.menuTabs.MARKETING then
    	self:TrySetMenuTab( self.menuTabs.MARKETING, bSound, false, { fn = UI.HangarWnd.ShowLicenses, params = { self, bSound, launchData } } )
	end

end


--
function UI.HangarWnd:HideMarketingWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if self.menuTab == self.menuTabs.MARKETING then
	    self:TrySetMenuTab( self.menuTabs.MAIN, bSound, false, { fn = UI.HangarWnd.HideMarketingWnd, params = { self, bSound } } )
	end

end


--
function UI.HangarWnd:OpenShips( shipDefNameCenterOn, bSound, bEvolvingEditMode, evolvingEditParams, launchData )

	if type( shipDefNameCenterOn ) ~= "string" then
		sys.log( "UI.HangarWnd:OpenShips()[ERROR]: invalid type of the 1-st parameter (\"shipDefNameCenterOn\"); \"string\" expected, got \"%s\"", type( shipDefNameCenterOn ) )
		shipDefNameCenterOn = ""
	end

	if bSound ~= nil then
    	if type( bSound ) ~= "boolean" then
    		sys.log( "UI.HangarWnd:OpenShips()[ERROR]: invalid type of the 2-nd parameter (\"bSound\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSound ) )
    		bSound = nil
    	end
	end

	if bSound == nil then
		bSound = false
	end

	if bEvolvingEditMode ~= nil then
    	if type( bEvolvingEditMode ) ~= "boolean" then
    		sys.log( "UI.HangarWnd:OpenShips()[ERROR]: invalid type of the 3-rd parameter (\"bEvolvingEditMode\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bEvolvingEditMode ) )
    		bEvolvingEditMode = nil
    	end
	end

	if bEvolvingEditMode == nil then
		bEvolvingEditMode = false
	end

    self:TrySetMenuTab( self.menuTabs.SHIPS, bSound, false, { fn = UI.HangarWnd.OpenShips, params = { self, shipDefNameCenterOn, bSound, bEvolvingEditMode, evolvingEditParams, launchData } } )

	if self.menuTab == self.menuTabs.SHIPS then

		if bEvolvingEditMode then
			UI.ShipsTreeWnd:OpenEvolvingEdit( shipDefNameCenterOn, evolvingEditParams )
		else
    		if shipDefNameCenterOn ~= "" then
    			UI.ShipsTreeWnd:CenterOnShip( shipDefNameCenterOn, bEvolvingEditMode )
    		end
		end

		UI.ShipsTreeWnd:SetLaunchData( launchData )

	end

end


--
function UI.HangarWnd:OpenShipsForQuest( shipQuestId, launchData, selectedShips, bSound )

	if type( shipQuestId ) ~= "number" then
		sys.log( "UI.HangarWnd:OpenShipsForQuest()[ERROR]: invalid type of the 1-st parameter (\"shipQuestId\"); \"number\" expected, got \"%s\"", type( shipQuestId ) )
		return
	end

	if selectedShips ~= nil then
    	if type( selectedShips ) ~= "table" then
    		sys.log( "UI.HangarWnd:OpenShipsForQuest()[ERROR]: invalid type of the 3-rd parameter (\"selectedShips\"); \"table\" expected, got \"%s\"", type( selectedShips ) )
			selectedShips = nil
    	end
	end

	if bSound ~= nil then
    	if type( bSound ) ~= "boolean" then
    		sys.log( "UI.HangarWnd:OpenShipsForQuest()[ERROR]: invalid type of the 4-th parameter (\"bSound\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSound ) )
    		bSound = nil
    	end
	end

	if bSound == nil then
		bSound = false
	end

    self:TrySetMenuTab( self.menuTabs.SHIPS, bSound, false, { fn = UI.HangarWnd.OpenShipsForQuest, params = { self, shipQuestId, selectedShips, bSound } } )

	if self.menuTab == self.menuTabs.SHIPS then

		UI.ShipsTreeWnd:SetShipQuest( shipQuestId, launchData )

		if UI.ShipsTreeWnd:GetShipQuest() ~= -1 then

			if selectedShips then

				for slotIdx, vid in pairs( selectedShips ) do
					if vid ~= UI.INVALID_U64_ID then
						UI.ShipsTreeWnd:SetQuestShip( vid, slotIdx, false, false )
					end
				end

			end

		end

	end

end


--
function UI.HangarWnd:OnClanConfirmWndResult( result, mode, data )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:OnClanConfirmWndResult()[ERROR]: not on screen" )
		return
	end

	if mode == UI.ClanConfirmWnd.Modes.SHIP_UPGRADE then

		if result == true then

			if type( data ) == "table" and type( data.vid ) == "userdata" then
				if self.shipUpgradeRequestId == 0 then
					self:DoUpgradeShip( data.vid )
				end
			else
				sys.log( "UI.HangarWnd:OnClanConfirmWndResult()[ERROR]: invalid data format" )
			end
			
		end

	else
		sys.log( "UI.HangarWnd:OnClanConfirmWndResult()[ERROR]: unhandled mode %s", tostring( mode ) )
	end

end


--
function UI.HangarWnd:MasterServer_OnVesselBudgetLevelUp( result, requestId, param1, param2, u64Param )

	UI.EquipmentWnd:MasterServer_OnVesselBudgetLevelUp( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:MasterServer_OnVesselBudgetChanged( vid )

	UI.EquipmentWnd:MasterServer_OnVesselBudgetChanged( vid )
	UI.ShipsTreeWnd:MasterServer_OnVesselBudgetChanged( vid )

end


--
function UI.HangarWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

	UI.EquipmentWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )
	UI.MarketingWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )
	UI.BuyBundleWnd:MasterServer_OnVesselBudgetActivate( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:MasterServer_OnAddThumbUp( result, requestId, param1, param2, u64Param )

	UI.DebriefingWnd:MasterServer_OnAddThumbUp( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )

	UI.SynergyTransferWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )	
	UI.ShipsTreeWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )	
	UI.EquipmentWnd:GameStore_OnVesselUnlockNode( result, requestId, param1, param2, u64Param )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

    if not self:IsOnScreen() then
		return
	end

	self:OnVesselExpChanged( u64Param )

end


--
function UI.HangarWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	UI.ShopWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.SynergyTransferWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.HelpListWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.Profile_CommonWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )
	UI.EquipmentWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

    if not self:IsOnScreen() then
		return
	end

	self:OnShipFullUpdate( u64Param )

end


--
function UI.HangarWnd:GetCharactersListMaxY()

	return UI.Hangar_NotificationsModeBtn:GetTop()

end


--
function UI.HangarWnd:ShowShipEquipment( vid, iid )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowShipEquipment()[ERROR]: not on screen" )
		return
	end

	if type( vid ) ~= "userdata" then
		sys.log( "UI.HangarWnd:ShowShipEquipment()[ERROR]: invalid type of the 1-st parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	if vid == UI.INVALID_U64_ID then
		sys.log( "UI.HangarWnd:ShowShipEquipment()[ERROR]: invalid vid" )
		return
	end

	if iid ~= nil then
    	if type( iid ) ~= "userdata" then
    		sys.log( "UI.HangarWnd:ShowShipEquipment()[ERROR]: invalid type of the 2-nd parameter (\"iid\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( iid ) )
			iid = nil
    	end
	end

	if iid == nil then
		iid = UI.INVALID_U64_ID
	end

	local battleSlotIdx = UI:GetShipBattleSlotByVid( vid )
	if battleSlotIdx ~= -1 then

    	if self.menuTab ~= self.menuTabs.MAIN then

    		if self:ValidateMenuTabForPrepareState( self.menuTabs.MAIN, self.prepareState ) == self.menuTabs.MAIN then
    			self:TrySetMenuTab( self.menuTabs.MAIN, true, false, { fn = UI.HangarWnd.ShowShipEquipment, params = { self, vid, iid } } )
    		else
    			sys.log( "UI.HangarWnd:ShowShipEquipment()[ERROR]: cannot show equipment right now" )
    		end

		end

    	if self.menuTab == self.menuTabs.MAIN then

			self:SelectBattleSlot( battleSlotIdx )

			if iid ~= UI.INVALID_U64_ID then

				local shipItem = UI:GetShipItem( vid, false )
				if not UI:IsShipInBattle( shipItem ) and not UI:IsShipOnShipQuest( shipItem ) then
					UI.EquipmentWnd:ShowModule( iid )
				end

			end

		end

	else
		self:ShowEquipmentPreview( vid, iid )
	end

end


--
function UI.HangarWnd:ShowEquippedModule( iid )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowEquippedModule()[ERROR]: not on screen" )
		return
	end

	if type( iid ) ~= "userdata" then
		sys.log( "UI.HangarWnd:ShowEquippedModule()[ERROR]: invalid type of the 1-st parameter (\"iid\"); \"userdata\" expected, got \"%s\"", type( iid ) )
		return
	end

	if iid == UI.INVALID_U64_ID then
		sys.log( "UI.HangarWnd:ShowEquippedModule()[ERROR]: invalid iid" )
		return
	end

	local shipItem = UI:GetEquippedShipItem( iid )
	if not shipItem then
		sys.log( "UI.HangarWnd:ShowEquippedModule()[ERROR]: module is not equipped" )
		return
	end

	self:ShowShipEquipment( shipItem.vid, iid )

end


--
function UI.HangarWnd:ShowSquadFinderCreateMyGroupWnd( bEdited, bSound )

	if bSound == nil then
		bSound = false
	end

	self:HideSquadFinderGroupsWnd( false )
	self:HideSquadFinderMyGroupWnd( false )

	UI.SquadFinder_CreateMyGroupWnd:Setup( bEdited )

	if not UI.SquadFinder_CreateMyGroupWnd:IsChildOf( self ) then

		self:AddChild( UI.SquadFinder_CreateMyGroupWnd )

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.squadShow )
		end

	end

end


--
function UI.HangarWnd:HideSquadFinderCreateMyGroupWnd( bSound )

	if bSound == nil then
		bSound = false
	end	

	if UI.SquadFinder_CreateMyGroupWnd:IsChildOf( self ) then

		UI.SquadFinder_CreateMyGroupWnd:UnlinkFromParent()

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.squadHide )
		end

	end	

end


--
function UI.HangarWnd:ShowSquadFinderGroupsWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	self:HideSquadFinderCreateMyGroupWnd( false )
	self:HideSquadFinderMyGroupWnd( false )

	if not UI.SquadFinder_GroupsWnd:IsChildOf( self ) then

		self:AddChild( UI.SquadFinder_GroupsWnd )

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.squadShow )
		end

	end

end


--
function UI.HangarWnd:HideSquadFinderGroupsWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if UI.SquadFinder_GroupsWnd:IsChildOf( self ) then

		UI.SquadFinder_GroupsWnd:UnlinkFromParent()

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.squadHide )
		end

	end	

end


--
function UI.HangarWnd:ShowSquadFinderMyGroupWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	self:HideSquadFinderGroupsWnd( false )
	self:HideSquadFinderCreateMyGroupWnd( false )

	if not UI.SquadFinder_MyGroupWnd:IsChildOf( self ) then

		self:AddChild( UI.SquadFinder_MyGroupWnd )

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.squadShow )
		end

	end

end


--
function UI.HangarWnd:HideSquadFinderMyGroupWnd( bSound )

	if bSound == nil then
		bSound = false
	end

	if UI.SquadFinder_MyGroupWnd:IsChildOf( self ) then

		UI.SquadFinder_MyGroupWnd:UnlinkFromParent()

		if bSound and self:IsOnScreen() then
			UI:PlayGlobalSound( self.sounds.squadHide )
		end

	end	

end


--
function UI.HangarWnd:HideSquadFinder( bSound )

	if bSound == nil then
		bSound = false
	end

	local bSquadFinderOnScreen = false

	if UI.SquadFinder_CreateMyGroupWnd:IsChildOf( self ) then
		UI.SquadFinder_CreateMyGroupWnd:UnlinkFromParent()
		bSquadFinderOnScreen = true
	end	

	if UI.SquadFinder_GroupsWnd:IsChildOf( self ) then
		UI.SquadFinder_GroupsWnd:UnlinkFromParent()
		bSquadFinderOnScreen = true
	end	

	if UI.SquadFinder_MyGroupWnd:IsChildOf( self ) then
		UI.SquadFinder_MyGroupWnd:UnlinkFromParent()
		bSquadFinderOnScreen = true
	end	

	if bSound and bSquadFinderOnScreen and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.squadHide )
	end

end


--
function UI.HangarWnd:SquadFinder_OnWaitingChanged()

	UI.SquadFinder_GroupsWnd:SquadFinder_OnWaitingChanged()
	UI.SquadFinder_MyGroupWnd:SquadFinder_OnWaitingChanged()
	UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnWaitingChanged()

end


--
function UI.HangarWnd:SquadFinder_OnGroupsRequest()

	UI.SquadFinder_GroupsWnd:SquadFinder_OnGroupsRequest()

end


--
function UI.HangarWnd:SquadFinder_OnJoined( gid )

	UI.SquadFinder_GroupsWnd:SquadFinder_OnJoined( gid )

end


--
function UI.HangarWnd:SquadFinder_OnGroupDeleted( gid )

	UI.SquadFinder_GroupsWnd:SquadFinder_OnGroupDeleted( gid )

end


--
function UI.HangarWnd:SquadFinder_OnCancelMyJoin( gid )

	UI.SquadFinder_GroupsWnd:SquadFinder_OnCancelMyJoin( gid )

end


--
function UI.HangarWnd:SquadFinder_OnGroupChanged( gid )

	UI.SquadFinder_GroupsWnd:SquadFinder_OnGroupChanged( gid )

end


--
function UI.HangarWnd:SquadFinder_OnMyGroupCreate()

	UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupCreate()
	UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnMyGroupCreate()
	UI.SquadWnd:SquadFinder_OnMyGroupCreate()
	UI.Hangar_SquadBtn:SquadFinder_OnMyGroupCreate()

end


--
function UI.HangarWnd:SquadFinder_OnMyGroupChanged()

	UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupChanged()
	UI.SquadWnd:SquadFinder_OnMyGroupChanged()
	UI.Hangar_SquadBtn:SquadFinder_OnMyGroupChanged()

end


--
function UI.HangarWnd:SquadFinder_OnRejectJoin( uid )

	UI.SquadFinder_MyGroupWnd:SquadFinder_OnRejectJoin( uid )
	UI.SquadWnd:SquadFinder_OnRejectJoin( uid )
	UI.Hangar_SquadBtn:SquadFinder_OnRejectJoin( uid )

end


--
function UI.HangarWnd:SquadFinder_OnMyGroupDelete()

	UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupDelete()
	UI.SquadWnd:SquadFinder_OnMyGroupDelete()
	UI.Hangar_SquadBtn:SquadFinder_OnMyGroupDelete()

end


--
function UI.HangarWnd:SquadFinder_OnMyGroupEdit()

	UI.SquadFinder_MyGroupWnd:SquadFinder_OnMyGroupEdit()
	UI.SquadFinder_CreateMyGroupWnd:SquadFinder_OnMyGroupEdit()

end


--
function UI.HangarWnd:OnSquadInviteRemove()

	if self.hMsgAcceptSquadInvite ~= UI.INVALID_UI_HANDLE then
		UI:RemoveUiObj( self.hMsgAcceptSquadInvite )
		UI:Purge()
		self.hMsgAcceptSquadInvite = UI.INVALID_UI_HANDLE
	end

end


--
function UI.HangarWnd:MasterServer_OnDealsNumChanged( result, requestId, param1, param2, u64Param )

	UI.MailCreateWnd:MasterServer_OnDealsNumChanged( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:ShowBuyBundleWnd( defName, data, bSound )

	UI.BuyBundleWnd:Setup( defName, data, self:GetScriptTableName(), false )
	UI.BuyBundleWnd:Show()

	if bSound then
		UI:PlayGlobalSound( self.sounds.tradeWndShow )
	end

end


--
function UI.HangarWnd:OnBuyBundleWndResult( result, defName, data )
end


--
function UI.HangarWnd:OnBuyWithInventoryWndResult( result, data )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:OnBuyWithInventoryWndResult()[ERROR]: not on screen" )
		return
	end

	if result == true then
		self:BuyInventory( data.inventoryLevels )
	else
		self.itemToBuy = nil
	end

end


--
function UI.HangarWnd:HideGameplayPveMap()

	if UI.GameplayPveMapWnd:IsChildOf( self ) then

		UI.GameplayPveMapWnd:UnlinkFromParent()

		local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
		if mainEffect then
			mainEffect:UnlinkWnd( UI.GameplayPveMapWnd:GetUiHandle(), "" )
		end

	end

end


--
function UI.HangarWnd:CanChatStartInput()

	-- #0107794 чат сейчас есть во всех полноэкранных окнах
	return
		self:IsOnScreen()
		and UI.ChatWnd:IsChildOf( self )

end


--
function UI.HangarWnd:CanShowChat()

	-- #0107794 чат сейчас есть во всех полноэкранных окнах
	return true
	
end


--
function UI.HangarWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	
	UI.EquipmentWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.ShipCraftWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.ShipWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.BuyBundleWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.TradingWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )
	UI.PveWnd:MasterServer_OnAdvertCreate( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	
	UI.EquipmentWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.ShipCraftWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.ShipWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.BuyBundleWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.TradingWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )
	UI.PveWnd:MasterServer_OnAdvertDelete( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	
	UI.EquipmentWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.ShipCraftWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.ShipWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.Hangar_BuyWithInventoryWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.BuyBundleWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.TradingWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )
	UI.PveWnd:MasterServer_OnAdvertExpired( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:MasterServer_OnAdvertHeaderGetData( data )
	
	UI.TradingWnd:MasterServer_OnAdvertHeaderGetData( data )

end


--
function UI.HangarWnd:MasterServer_OnAdvertGetData( data )
	
	UI.TradingWnd:MasterServer_OnAdvertGetData( data )
	UI.Trading_AdvertsWnd:MasterServer_OnAdvertGetData( data )

end


--
function UI.HangarWnd:MasterServer_OnBuyProductFromAdvert( result, requestId, param1, param2, u64Param )
	
	UI.Trading_AdvertsWnd:MasterServer_OnBuyProductFromAdvert( result, requestId, param1, param2, u64Param )
	
end



--
function UI.HangarWnd:OnSquadWndReload()

	UI.Hangar_SquadBtn:OnSquadWndReload()

end


--
function UI.HangarWnd:MasterServer_OnEMMChangeReady( result, requestId, isReady )

	if result == 0 then

		UI.Hangar_EMMWnd:OnReadyChanged()

		if self:IsOnScreen() then

			if isReady ~= 0 then
				self:SetPrepareState( self.prepareStates.EMM )
			else
				if self.prepareState == self.prepareStates.EMM or self.prepareState == self.prepareStates.EMM_WAIT or self.prepareState == self.prepareStates.EMM_STOP_WAIT then
					self:SetPrepareState( self.prepareStates.NONE )
				end
			end

		end

	else

		if requestId == self.emmChangeReadyRequestId then
			self:ShowMsgOnEmmChangeReadyError()
			self:SetPrepareState( self.prepareStates.NONE )
		end

	end

	if requestId == self.emmChangeReadyRequestId then
		self.emmChangeReadyRequestId = 0
	end	

end


--
function UI.HangarWnd:MasterServer_OnEMMChangeExistOpponent( result, requestId, existOpponent )

	if result == 0 then
		UI.Hangar_EMMWnd:OnOpponentChanged()
	end

end


--
function UI.HangarWnd:MasterServer_OnQuestTime( result, requestId, questId )
	
	UI.QuestInfoWnd:MasterServer_OnQuestTime( result, requestId, questId )
	UI.GameplayPveMapWnd:MasterServer_OnQuestTime( result, requestId, questId )
	UI.Hangar_QuestsWnd:MasterServer_OnQuestTime( result, requestId, questId )

end


--
function UI.HangarWnd:IsWaitingShipUpgrade()

	return self.shipUpgradeRequestId ~= 0

end


--
function UI.HangarWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	
	UI.ShipsTreeWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.GameplayPveMapWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.EquipmentWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.ShopWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.TalentsWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.Hangar_QuestsWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.GameplayChoiceWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.DebriefingWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.RankUpWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.PveWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )
	UI.PveChoiceWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if self:IsOnScreen() and result == 0 then
		
		UI.Hangar_BundlesBtn:OnAccountRankChanged()
		UI.Hangar_ProfileBtn:OnAccountRankChanged()
		UI.Hangar_ExpWnd:OnAccountRankChanged()
		
		self:UpdateTalentsMenuBtnDisable()
		self:UpdateTalentsMenuBtnBlink()
		self:UpdateItemCraftMenuBtnDisable()
		self:UpdateBattleSlotMouseOverState( 4 ) --#0098387 - 4-й слот нельзя купить до определенного ранга
		
	end

end


function UI.HangarWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )

	UI.GameplayPveMapWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )
	UI.Hangar_QuestsWnd:MasterServer_OnAccountExpPoolChange( result, requestId, oldExp, newExp )

	if self:IsOnScreen() and result == 0 then
	
		UI.Hangar_ExpWnd:OnAccountExpChanged( oldExp, newExp )
		UI.Hangar_ProfileBtn:OnAccountExpChanged()
		
		self:CheckShowAccountRankReadyMsg( oldExp, newExp )
		
	end

end


--
function UI.HangarWnd:MasterServer_OnChangeIntervalQuests()

	UI.GameplayPveMapWnd:MasterServer_OnChangeIntervalQuests()
	UI.Hangar_QuestsWnd:MasterServer_OnChangeIntervalQuests()

end


--
function UI.HangarWnd:GetGameplayPveMapPos()
	
	local newResEffect = UI:GetEffectFromLayer( self, self.layers.NEW_RES_EFFECT )
	return newResEffect and newResEffect:GetObjPos( self.effectInfo.newRes.gameplayPveMapLocator ) or UI:ZeroVec2()

end


--
function UI.HangarWnd:MasterServer_OnMaxVesselRankChange( result, requestId, param1, param2 )

	UI.TalentsWnd:MasterServer_OnMaxVesselRankChange( result, requestId, param1, param2 )

end


-- вызывается из UI.GameplayPveMapWnd
function UI.HangarWnd:OnGameplayPveMapUpdateQuests()

	if self:IsOnScreen() then
		self:UpdateStartBtnState()
	end

end


--
function UI.HangarWnd:MasterServer_OnUniverseSetCivilianZone( result, requestId, param1, param2 )

	UI.GameplayPveMapWnd:MasterServer_OnUniverseSetCivilianZone( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:ShowQuest( questId, questType, bSelect )
	
	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowQuest()[ERROR]: not on screen" )
		return
	end
	
	self:HideOverlayWindows()
	
	if self.menuTab == self.menuTabs.FREE_SPACE_MAP then
	
		UI.GameplayPveMapWnd:ShowQuest( questId, questType, bSelect )
	
	else

		if self.menuTab ~= self.menuTabs.MAIN then
			UI.HangarWnd:TrySetMenuTab( self.menuTabs.MAIN, true, false, { fn = UI.HangarWnd.ShowQuest, params = { self, questId, questType, bSelect } } )
		end
		
		if self.menuTab == self.menuTabs.MAIN then

			if UI.Hangar_QuestsWnd:IsChildOf( self ) then
				UI.Hangar_QuestsWnd:ShowQuest( questId, questType, bSelect )
			else
				sys.log( "UI.HangarWnd:ShowQuest()[ERROR]: quests wnd is not on screen" )
			end
			
		end
		
	end

end


--
function UI.HangarWnd:ShowRankUpQuest( bSelect )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowRankUpQuest()[ERROR]: not on screen" )
		return
	end
	
	self:HideOverlayWindows()

	if self.menuTab == self.menuTabs.FREE_SPACE_MAP then
	
		UI.GameplayPveMapWnd:ShowRankUpQuest( bSelect )
	
	else

		if self.menuTab ~= self.menuTabs.MAIN then
			UI.HangarWnd:TrySetMenuTab( self.menuTabs.MAIN, true, false, { fn = UI.HangarWnd.ShowRankUpQuest, params = { self, bSelect } } )
		end
		
		if self.menuTab == self.menuTabs.MAIN then

			if UI.Hangar_QuestsWnd:IsChildOf( self ) then
				UI.Hangar_QuestsWnd:ShowRankUpQuest( bSelect )
			else
				sys.log( "UI.HangarWnd:ShowRankUpQuest()[ERROR]: quests wnd is not on screen" )
			end
			
		end
		
	end

end


--
function UI.HangarWnd:ShowQuestCategory( category )
	
	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowQuestCategory()[ERROR]: not on screen" )
		return
	end
	
	self:HideOverlayWindows()

	if self.menuTab == self.menuTabs.FREE_SPACE_MAP then
	
		UI.GameplayPveMapWnd:ShowQuestCategory( category )
	
	else

		if self.menuTab ~= self.menuTabs.MAIN then
			UI.HangarWnd:TrySetMenuTab( self.menuTabs.MAIN, true, false, { fn = UI.HangarWnd.ShowQuestCategory, params = { self, category } } )
		end
		
		if self.menuTab == self.menuTabs.MAIN then

			if UI.Hangar_QuestsWnd:IsChildOf( self ) then
				UI.Hangar_QuestsWnd:ShowQuestCategory( category )
			else
				sys.log( "UI.HangarWnd:ShowQuestCategory()[ERROR]: quests wnd is not on screen" )
			end
			
		end
		
	end
	
end


--
function UI.HangarWnd:F_OnEventArenaMajorChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.GameplayPveMapWnd:F_OnEventArenaMajorChanged( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.Hangar_QuestsWnd:F_OnEventArenaMajorChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

end


--
function UI.HangarWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	
	UI.PveWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	UI.GameplayPveMapWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	UI.Hangar_QuestsWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	UI.ShipsTreeWnd:MasterServer_OnPveScheduledLevels( result, requestId, param1, param2, u64Param )
	
end


--
function UI.HangarWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )
	
	UI.PveWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )
	UI.PveChoiceWnd:MasterServer_OnUnlimPveMissionLevelChanged( missionName, level )

end


--
function UI.HangarWnd:MasterServer_OnUnlimPveUpgradePlayerLevel( result, requestId, levelId, level )

	UI.PveWnd:MasterServer_OnUnlimPveUpgradePlayerLevel( result, requestId, levelId, level )

end


--
function UI.HangarWnd:MasterServer_OnClanShipSetCurrent( result, requestId, param1, param2 )

	UI.ClanShipWnd:MasterServer_OnClanShipSetCurrent( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:MasterServer_OnClanShipUpdateCurrent( result, requestId, param1, param2 )

	UI.ClanShipWnd:MasterServer_OnClanShipUpdateCurrent( result, requestId, param1, param2 )
	UI.GameplayPveMapWnd:MasterServer_OnClanShipUpdateCurrent( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:MasterServer_OnClanHistoryGet( data )

	UI.Clans_HistoryWnd:MasterServer_OnClanHistoryGet( data )
	
end


--
function UI.HangarWnd:MasterServer_OnWarMapRequest( result, requestId, param1, param2 )

	UI.ClanWarWnd:MasterServer_OnWarMapRequest( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:OnClanDataChanged()

	UI.ClanShipWnd:OnClanDataChanged()
	UI.ClanWarWnd:OnClanDataChanged()
	
end


--
function UI.HangarWnd:MasterServer_OnWarStart( result, requestId, param1, param2 )

	UI.ClanWarWnd:MasterServer_OnWarStart( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:MasterServer_OnWarClanRevive( result, requestId, param1, param2 )

	UI.ClanWarWnd:MasterServer_OnWarClanRevive( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:OnQuestsOpenStateChanged()

	if not self:IsOnScreen() then
		return
	end
	
	if UI.Hangar_QuestsWnd:IsOpen() then
	
		local bNeedSwithToMainTab =	
			self.menuTab ~= self.menuTabs.MAIN
			and self.menuTab ~= self.menuTabs.SHIP_PREVIEW
			and self.menuTab ~= self.menuTabs.EMPTY
			and self.menuTab ~= self.menuTabs.FREE_SPACE_MAP
			and self.menuTab ~= self.menuTabs.EQUIPMENT_PREVIEW
			
		if bNeedSwithToMainTab then
			UI.HangarWnd:TrySetMenuTab( self.menuTabs.MAIN, false, false )
		end
			
	end

end


--
function UI.HangarWnd:ShipPreset_OnSaveCurrentToPreset( vid, presetId )

	UI.EquipmentWnd:ShipPreset_OnSaveCurrentToPreset( vid, presetId )
	
end


--
function UI.HangarWnd:ShipPreset_OnAddPreset( vid, id )

	UI.EquipmentWnd:ShipPreset_OnAddPreset( vid, id )
	
end


--
function UI.HangarWnd:ShipPreset_OnRemovePreset( shipDefName, presetId )

	UI.EquipmentWnd:ShipPreset_OnRemovePreset( shipDefName, presetId )
	
end


--
function UI.HangarWnd:ShipPreset_OnSetSelPreset( shipDefName, presetId )

	UI.EquipmentWnd:ShipPreset_OnSetSelPreset( shipDefName, presetId )
	
end


--
function UI.HangarWnd:MasterServer_OnUserNotes( result, requestId, param1, param2, u64Param )

	UI.FriendsListWnd:MasterServer_OnUserNotes( result, requestId, param1, param2, u64Param )
	
end


--
function UI.HangarWnd:MasterServer_OnUserNotesAdd( result, requestId, param1, param2, u64Param )

	UI.ClanCreateWnd:MasterServer_OnUserNotesAdd( result, requestId, param1, param2, u64Param )
	UI.FriendsListWnd:MasterServer_OnUserNotesAdd( result, requestId, param1, param2, u64Param )

end


--
function UI.HangarWnd:MasterServer_OnUserNotesDelete( result, requestId, uids )

	UI.ClanCreateWnd:MasterServer_OnUserNotesDelete( result, requestId, uids )
	UI.FriendsListWnd:MasterServer_OnUserNotesDelete( result, requestId, uids )
	
end


--
function UI.HangarWnd:MasterServer_OnPlayerStats( result, requestId, param1, param2, u64Param )

	UI.MailCreateWnd:MasterServer_OnPlayerStats( result, requestId, param1, param2, u64Param )
	
end


--
function UI.HangarWnd:MasterServer_OnBattlePassUnlockLevel( result, requestId, param1, param2, u64Param )

	UI.BattlePassWnd:MasterServer_OnBattlePassUnlockLevel( result, requestId, param1, param2, u64Param )
	
end


--
function UI.HangarWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )

	UI.BattlePassWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )
	UI.GameplayPveMapWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )
	UI.Hangar_QuestsWnd:MasterServer_OnBattlePassUnlockPremium( result, requestId, param1, param2, u64Param )
	
end


--
function UI.HangarWnd:MasterServer_OnBattlePassActivation( result, requestId, param1, param2, u64Param )

	UI.BattlePassWnd:MasterServer_OnBattlePassActivation( result, requestId, param1, param2, u64Param )
	
	if result == 0 and self:IsOnScreen() then
		self:UpdateCurrentEventInfoName()
		self:UpdateCurrentEventInfoVisibility()
	end
	
end


--
function UI.HangarWnd:MasterServer_OnCurrentEventStateChanged()
	
	if self:IsOnScreen() then
		self:UpdateCurrentEventInfoName()
		self:UpdateCurrentEventInfoVisibility()
	end
	
end


--
function UI.HangarWnd:ShowBattlePass( bSound, launchData, restoreData )
	
	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowBattlePass()[ERROR]: not on screen" )
		return
	end
	
	if not _G.MasterServer_BattlePassIsActive() then
		sys.log( "UI.HangarWnd:ShowBattlePass()[ERROR]: BattlePass is not active" )
		return
	end

	self:TrySetMenuTab( self.menuTabs.BATTLE_PASS, bSound, false, { fn = UI.HangarWnd.ShowBattlePass, params = { self, bSound, launchData, restoreData } } )
	
	if self.menuTab ~= self.menuTabs.BATTLE_PASS then
		return
	end

	UI.BattlePassWnd:RestoreState( restoreData )
	UI.BattlePassWnd:SetLaunchData( launchData )

end


--
function UI.HangarWnd:MasterServer_OnZonesLuaActiveEventsUpdate( result, requestId, param1, param2 )

	UI.GameplayPveMapWnd:MasterServer_OnZonesLuaActiveEventsUpdate( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:MasterServer_OnBeforeUpgradeAutogenItem( result, requestId, param1, param2, u64Param )

	-- SC-112665 снятие автоген-модуля с "куклы" корабля перед апгрейдом модуля,
	-- иначе после апгерйда упадет, т.к. будет создан новый деф, а в модуле хранится указатель на старый протухший
	local iid = u64Param
	self:UnequipAutogenModuleFromShipEnt( iid )

end


--
function UI.HangarWnd:GameStore_OnUpgradeAutogenItem( result, requestId, params )
	
	UI.AutogenUpgradeWnd:GameStore_OnUpgradeAutogenItem( result, requestId, params )
	
	if self:IsOnScreen() and result == _G.GameStore.StoreBuyResult.SBR_OK then
	
		local iid = params.iid
		
		local shipItem = UI:GetEquippedShipItem( iid )
		if shipItem then
			self:OnEquipModulesChanged( shipItem.vid )
		end
		
	end
	
end


--
function UI.HangarWnd:MasterServer_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )

	UI.MarketingWnd:MasterServer_OnYupPurchasesPricesResponse( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:OnShipDisabledByTimeChanged( defName )

	UI.ShipsTreeWnd:OnShipDisabledByTimeChanged( defName )

end


--
function UI.HangarWnd:GameStore_OnAutogenDestroy( result, requestId, params )

	UI.AutogenUnequipWnd:GameStore_OnAutogenDestroy( result, requestId, params )
	UI.ShopWnd:GameStore_OnAutogenDestroy( result, requestId, params )
	UI.EquipmentWnd:GameStore_OnAutogenDestroy( result, requestId, params )
	
end


--
function UI.HangarWnd:GameStore_OnAutogenDismantle( result, requestId, params )

	UI.AutogenUnequipWnd:GameStore_OnAutogenDismantle( result, requestId, params )
	
end


--
function UI.HangarWnd:OnAutogenUnequipWnd( items, cancelMode, customData )

	if not self:IsOnScreen() then
		return
	end

	-- проверяем, что всё, что нужно было снять, было снято
	if cancelMode == UI.AutogenUnequipWnd.cancelModes.BREAK then
	
		local bAllUnequipped = true
		for itemIdx, item in pairs( items ) do
			if not( item.result == UI.AutogenUnequipWnd.itemResults.DESTROYED or item.result == UI.AutogenUnequipWnd.itemResults.DISMANTLED ) then
				bAllUnequipped = false
				break
			end
		end
		
		if not bAllUnequipped then
			return
		end
		
	end
	
	-- вызываем снова ту же функцию и с теми же параметрами, которую пытались вызвать до показа окна снятия автогена
	if customData.fnName and customData.fnName ~= "" then
		self[ customData.fnName ]( self, unpack( customData.params ) )
	end

end


--
function UI.HangarWnd:MasterServer_OnTradeMoneyChanged( result, requestId, param1, param2 )

	UI.TradingWnd:MasterServer_OnTradeMoneyChanged( result, requestId, param1, param2 )
	
end


--
function UI.HangarWnd:OnShowServerTimeOptionChanged()

	UI.GameplayPveMapWnd:OnShowServerTimeOptionChanged()
	
	if self:IsOnScreen() then
		self:UpdateTime()
	end
	
end


--
function UI.HangarWnd:OnBuyWndResult( result, mode, data )
	
	if not result then
		return
	end
	
	if mode == UI.BuyWnd.modes.UPGRADE_ITEMS_MULTI then
		self:TryUpgradeItem( data.itemsForUpgrade )
	else
		sys.log( "UI.HangarWnd:OnBuyWndResult()[ERROR]: unhandled mode %s", tostring( mode ) )
	end
	
end


--
function UI.HangarWnd:OnUpgradeItemWndResult( result, iid, vid, equipSlot, customData )
	
	if result then
		UI.EquipmentWnd:ShowUpgradeItemWowEffect( { iid } )
	end

end


-- ------------------------------
-- const
-- ------------------------------

hw.menuTabs =
{
	MAIN				= 1,	-- эквипмент
	SHIPS				= 2,
	SHOP				= 3,
	ITEM_CRAFT			= 4,
	PROFILE_NEW			= 5,
	LEADERBOARDS		= 6,
	HELP 				= 7,
	PROFILE				= 8,
	SKILLS				= 9,
	STICKERS			= 10,
	SHIP_PREVIEW		= 11,
	CLAN				= 12,
	SHIP_CRAFT			= 13,
	EMPTY				= 14,	-- без элементов эквипмента
	FREE_SPACE_MAP 		= 15,
	CUSTOM_GAME			= 16,
	MARKETING			= 17,
	EQUIPMENT_PREVIEW	= 18,	-- только эквипмент, без боевых слотов, квестов и пр.; может быть показыван и для корабля, не стоящегов боевом слоте
	SHIP_BUY			= 19,
	BATTLE_PASS			= 20,
}

hw.menuTab2BindName =
{
    [ hw.menuTabs.SHIPS ]			= "hangarTabShips",
    [ hw.menuTabs.SKILLS ]			= "hangarTabSkills",
    [ hw.menuTabs.SHOP ]			= "hangarTabShop",
    [ hw.menuTabs.ITEM_CRAFT ]		= "hangarTabItemCraft",
    [ hw.menuTabs.LEADERBOARDS ]	= "hangarTabLeaderboards",
    [ hw.menuTabs.PROFILE ]			= "hangarProfile",
    [ hw.menuTabs.CLAN ]			= "hangarClan",
}

hw.effectInfo =
{
	main =
	{
		battleListLocator			= "ship_list",
		activeModuleLocator			= "modules_slot",
	},

	newRes =
	{
		gameplayPveMapLocator		= "map",
	},

	wait =
	{
		animIdle	= "idle",
		animHide	= "hide",
	},

	notificatios =
	{
		listLocator	= "list"
	},

	work1 =
	{
		timeLocatorIsStats	= "time3",
		timeLocatorNoStats	= "time2",		
	}
}

hw.SHIP_ROTATION_SENSITIVITY	= 0.01	-- radians per pixel in base aspect coordinate system

hw.sounds =
{
	shipSlotMouseOver	= "sound/ui/btnMouseOver",
	battleSlotSelect	= "sound/ui/battleSlotSelect",
	shipsListShow		= "sound/ui/commonListOpen",
	shipsListHide		= "sound/ui/commonListClose",
	changeBattleShip	= "sound/ui/btnClick",
	statsTabSelect		= "sound/ui/btnClick",
	menuTabSelect		= "sound/ui/btnClick",
	btnMouseOver		= UI.sounds.btnMouseOver,
	btnClick			= UI.sounds.btnClick,
	startMatchmaking	= "sound/ui/btnClick",
	maximizeMatchmaking	= "sound/ui/btnClick",
	openMenu			= UI.sounds.btnClick,
	prepareWndShow		= "sound/ui/btnClick",
	prepareWndHide		= "sound/ui/MsgHide",
	refill				= "sound/ui/btnClick",
	repair				= "sound/ui/btnClick",
	unlockBattleSlot	= "sound/ui/unlock",
	yup2GoldWndShow 	= "sound/ui/btnClick",
	gold2CreditsWndShow	= "sound/ui/btnClick",
	battleSlotLocked	= UI.sounds.invalid,
	notificationsListClose	= "sound/ui/commonListClose",
	notificationsListOpen	= "sound/ui/commonListOpen",
	tradeWndShow			= "sound/ui/btnClick",
	tradeWndHide			= "ssound/ui/MsgHide",
	mailShow				= UI.sounds.btnClick,
	mailHide				= UI.sounds.btnClick,
	newLetter				= "sound/ui/incomingPrivateMessage",
	durabilityIcoClick	= UI.sounds.btnClick,
	showQuestWnd		= "sound/ui/btnClick",
	tournamentHide		= "sound/ui/MsgHide",
	tournamentShow		= "sound/ui/btnClick",
	gameplaceChoiceHide	= "sound/ui/MsgHide",
	gameplaceChoiceShow	= "sound/ui/btnClick",
	pveChoiceHide		= "sound/ui/MsgHide",
	pveChoiceShow		= "sound/ui/btnClick",
	arenaHide			= "sound/ui/MsgHide",
	arenaShow			= "sound/ui/btnClick",
	bundlesHide			= "sound/ui/MsgHide",
	bundlesShow			= "sound/ui/btnClick",
	squadShow			= UI.sounds.btnClick,
	squadHide			= UI.sounds.btnClick,
	buyBundle			= UI.sounds.btnClick,
	friendsShow			= UI.sounds.btnClick,
	friendsHide			= UI.sounds.btnClick,
	voteShow			= UI.sounds.btnClick,
	voteHide			= UI.sounds.btnClick,
	startEMM			= UI.sounds.btnClick,
	stopEMM				= UI.sounds.btnClick,
	upgrade				= "sound/ui/ModuleUpgrade",
}

hw.SERVER_INFO_REQUEST_DELAY	= 25 -- sec
hw.VOTE_INFO_REQUEST_DELAY		= 5 * 60
hw.FREESPACE_UNDOCK_WAIT_MAX	= 30

hw.prepareStates =
{
	NONE							= 1,
	CANCEL_SQUAD_INVITES_REQUEST	= 2,
	CANCEL_SQUAD_INVITES_WAIT		= 3,					
	SQUAD_READY_CHECK				= 4,
	REPAIR_REQUEST					= 5,
	REPAIR_WAIT						= 6,
	REFILL_REQUEST					= 7,
	REFILL_WAIT						= 8,
	MATCHMAKING_WAIT				= 9,
	MATCHMAKING						= 10,
	EMM_WAIT						= 11,
	EMM								= 12,
	EMM_STOP_WAIT					= 13,
}		

hw.notificationsModes =
{
	LIST	= 1,
	POP_UPS	= 2,
}

hw.EXPIRED_MSG_DELAY		= 1.3

-- ------------------------------
-- vars
-- ------------------------------

hw.menuTab						= -1
hw.menuTabToSet					= nil
hw.workWnd						= nil
hw.shipEntIds					= {}
hw.selShipEntId					= -1
hw.spawnSpotEntIds				= {}					
hw.hMsgTimeOut					= UI.INVALID_UI_HANDLE
hw.hMsgRejoinGame				= UI.INVALID_UI_HANDLE
hw.hMsgMatchMakingDisabled		= UI.INVALID_UI_HANDLE
hw.hMsgFreeSpaceDisabled		= UI.INVALID_UI_HANDLE
hw.hMsgAcceptSquadInvite		= UI.INVALID_UI_HANDLE
hw.hMsgAcceptClanInvite			= UI.INVALID_UI_HANDLE
hw.hMsgReadyCheck				= UI.INVALID_UI_HANDLE
hw.hMsgCancelSquadInvites		= UI.INVALID_UI_HANDLE
hw.hMsgGoldRefill				= UI.INVALID_UI_HANDLE
hw.hMsgRandomBfs				= UI.INVALID_UI_HANDLE
hw.hMsgPremiumExpired			= UI.INVALID_UI_HANDLE
hw.bRotatingCamera				= false
hw.savedMousePos				= Vec2( 0, 0 )
hw.serverInfoRequestTimer		= -1
hw.prepareState					= hw.prepareStates.NONE
hw.prepareStateToSet			= nil
hw.prepareBattleSlot			= nil
hw.prepareBattleSlotToSet	 	= nil
hw.prepareGameParams			= nil
hw.prepareGameParamsToSet		= nil
hw.prepareCheckReadyType		= nil
hw.prepareCheckReadyTypeToSet	= nil
hw.prepareEmm					= nil
hw.prepareEmmToSet				= nil
hw.prevGameTypeRecordIdx		= -1
hw.serverInfo					= {}
hw.bCameraTransitionLocked		= false
hw.notificationsMode			= -1
hw.bMatchmakingToShow			= false
hw.bPvpMatchmakingToShow		= false
hw.bPveMatchmakingToShow		= false
hw.bArenaMatchmakingToShow		= false
hw.lastVoteRequestTime			= 0
hw.gameTypeToLaunch				= ""
hw.bWaitingStore				= false
hw.bShopNeedReload				= false
hw.previewShipDefName			= ""
hw.previewShipToSet				= nil
hw.previewShipLaunchData		= nil
hw.customShipVid				= UI.INVALID_U64_ID
hw.customShipVidToSet			= nil
hw.selShipSlotIdx				= -1
hw.selShipSlotToSelect			= nil
hw.shipStripRequestId			= 0
hw.bFirstHangarForPalyer		= true
hw.bFirstHangarForLoginSession	= true
hw.bShownInLoginSession			= false
hw.sellShipRequestId			= 0
hw.buyRequestId					= 0
hw.expiredMsgTimer				= -1
hw.continueSetMenuTabData		= nil
hw.wndUnderLastMouseDown		= nil
hw.hasFreeSpaceAccess			= nil
hw.owDebriefingData				= nil
hw.debriefingData				= nil
hw.freeSpaceRequestId			= nil
hw.freeSpaceUndockTimer			= nil
hw.bLockNewFrameUpdate			= false
hw.bInUpdateBattleSlots			= false
hw.shipCraftLaunchDataToSet		= nil
hw.shipBuyLaunchDataToSet		= nil
hw.stickersLaunchDataToSet		= nil
hw.shipUpgradeRequestId			= 0
hw.bLockCameraUpdate			= false
hw.shipItemForMaintenance		= nil
hw.slotToSelectAfterChangeShip	= nil
hw.squadFinderGroupDescLinkWnd	= nil
hw.lastRequestId_ServerInfo					= 0
hw.lastRequestId_ChangeBattleSlotVessel		= 0
hw.lastRequestId_EnterMatchmakingQueue		= 0
hw.lastRequestId_QueueInfo					= 0
hw.swapBattleSlotVesselsRequstId			= 0
hw.cancelSquadInvitesRequestId				= 0
hw.itemToBuy					= nil
hw.buyInventoryRequestId		= 0
hw.emmChangeReadyRequestId		= 0
hw.gameplay						= -1
hw.bShowMapAfterFreeSpace		= false
hw.universeTypeToStartRandom	= nil
hw.bNeedCheckShowBattlePass		= true
hw.upgradeItemRequestId			= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HangarWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	self:InitMenu()

	UI.MatchMakingContainerWnd:UnlinkFromParent()
	UI.ShopWnd:UnlinkFromParent()
	UI.EquipmentWnd:UnlinkFromParent()
	UI.TalentsWnd:UnlinkFromParent()
	UI.NotificationsListWnd:UnlinkFromParent()
	UI.ShipCustomizationWnd:UnlinkFromParent()
	UI.ShipsTreeWnd:UnlinkFromParent()
	UI.LeaderboardWnd:UnlinkFromParent()
	UI.ClansMainWnd:UnlinkFromParent()
	UI.Profile_Wnd:UnlinkFromParent()
	UI.ProfileWnd_new:UnlinkFromParent()
	UI.GameplayWnd:UnlinkFromParent()
	UI.SaleAdvert_Wnd:UnlinkFromParent()
	UI.HelpListWnd:UnlinkFromParent()
	UI.MailWnd:UnlinkFromParent()
	UI.ShipCraftWnd:UnlinkFromParent()
	UI.ItemCraftMultiWnd:UnlinkFromParent()
	UI.MarketingWnd:UnlinkFromParent()
	UI.SquadFinder_GroupsWnd:UnlinkFromParent()
	UI.SquadFinder_MyGroupWnd:UnlinkFromParent()
	UI.SquadFinder_CreateMyGroupWnd:UnlinkFromParent()
	UI.ShipWnd:UnlinkFromParent()
	UI.BattlePassWnd:UnlinkFromParent()

	self.squadFinderGroupDescLinkWnd = UI:CreateChildWnd( self, UI.LinkWnd, "" )

	self:UpdateSquadWndPos()

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_SELECT_RECORD )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_MSGBOX_RET )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_PLAYER_DISCONNECTED )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_INV_ITEMS_CHANGED )
    UI:SubscribeUiObjOnEvent( handle, UI.EV_COMBO_SELECT_RECORD )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_LIST_ACTIVATE_RECORD )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_TUTORIAL_STOP )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_START_LEVEL )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_ARENA_MAJOR_CHANGED )

end


--
function UI.HangarWnd:InitMenu()

	for menuTab = 1, UI:GetTableLength( self.menuTabs ) do

		if	menuTab ~= self.menuTabs.MAIN and
			menuTab ~= self.menuTabs.STICKERS and
			menuTab ~= self.menuTabs.FREE_SPACE_MAP and
			menuTab ~= self.menuTabs.CUSTOM_GAME and
			menuTab ~= self.menuTabs.SHIP_PREVIEW and
			menuTab ~= self.menuTabs.PROFILE and
			menuTab ~= self.menuTabs.CLAN and
			menuTab ~= self.menuTabs.SHIP_CRAFT and 
			menuTab ~= self.menuTabs.SHIP_BUY and
			menuTab ~= self.menuTabs.EMPTY and
			menuTab ~= self.menuTabs.MARKETING and
			menuTab ~= self.menuTabs.EQUIPMENT_PREVIEW and
			menuTab ~= self.menuTabs.HELP and
			menuTab ~= self.menuTabs.SKILLS and
			menuTab ~= self.menuTabs.BATTLE_PASS then

    			local data = {}
    			data.menuTab		= menuTab
    			data.bBlink			= false
    			data.bLocked		= false
    			data.bSale			= false

            	local tooltipData = {}

            	tooltipData.tooltipType	= UI.tooltipTypes.TEXT_LARGE
            	tooltipData.caption		= ""
            	tooltipData.text		= ""

    			data.tooltipData = tooltipData

    			UI.Hangar_MenuWnd:AddRecord( data )

		end

	end

end


--
function UI.HangarWnd:Reset()

	UI.FullScreenWnd.Reset( self )

	self:TrySetMenuTab( self.menuTabs.MAIN, false, true )
	
	UI.Hangar_BattleListWnd:Clear()

	self:SetPrepareState( self.prepareStates.NONE )

	UI.Hangar_TopPanelWnd:SetText( "", UI.Hangar_TopPanelWnd.layers.PLAYER_NAME_CLAN )

    self.lastRequestId_ServerInfo				= 0
	self.lastRequestId_ChangeBattleSlotVessel	= 0
	self.lastRequestId_EnterMatchmakingQueue	= 0
	self.lastRequestId_QueueInfo				= 0
	self.shipStripRequestId						= 0
	self.swapBattleSlotVesselsRequstId			= 0
	self.slotToSelectAfterChangeShip			= nil

	self.serverInfoRequestTimer	= -1

	self:DestroyShipEnts()

	self:HideDamageMsg()
	self:HideInBattleMsg()

	UI.Hangar_StartBtn:UnlinkFromParent()
	local topPanelEffect = UI:GetEffectFromLayer( UI.Hangar_TopPanelWnd, UI.Hangar_TopPanelWnd.layers.MAIN_EFFECT )
	UI:AddChildAndLink( UI.Hangar_TopPanelWnd, UI.Hangar_StartBtn, topPanelEffect, "start_button", UI.EffectAnimParams.POS )
	UI.Hangar_StartBtn:Reset()

	self:HideWaitingWnd()
	self.prepareState = self.prepareStates.NONE
	self.prepareBattleSlot = nil
	self.prepareGameParams = nil
	self.prepareCheckReadyType = nil
	self.prepareEmm = nil

	UI.FriendsListWnd:UnlinkFromParent()
	UI.Vote_Wnd:UnlinkFromParent()
	UI.SquadWnd:UnlinkFromParent()
	UI.SquadFinder_GroupsWnd:UnlinkFromParent()
	UI.SquadFinder_MyGroupWnd:UnlinkFromParent()
	UI.SquadFinder_CreateMyGroupWnd:UnlinkFromParent()

	self.prevGameTypeRecordIdx = -1
	if self.serverInfo == nil then
		self.serverInfo = {}
	end

	self:StopRotatingCamera()

	self:ResetNotifcationControls()

	UI.Hangar_ShipCustomizationBtn:Enable( false )

	self:SetText( "", self.layers.TIME )

	hw.lastVoteRequestTime			= 0
	UI.Hangar_VoteBtn:SetNotification( false )

	self:HideMail( false )
	UI.Hangar_MailBtn:Reset()

	self.gameTypeToLaunch = ""

	UI.Hangar_FriendListBtn:SetFriendOnlineCount( UI.Social:GetFriendOnlineCount() )

	self.previewShipDefName = ""	
	self:SetText( "", self.layers.PREVIEW_SHIP_NAME )
	self.customShipVid = UI.INVALID_U64_ID	
	
	self.sellShipRequestId = 0

	self.buyRequestId = 0
	self.expiredMsgTimer = -1

	self.continueSetMenuTabData = nil

	self.wndUnderLastMouseDown = nil

	UI.GameplayChoiceWnd:UnlinkFromParent()

	if UI.PveChoiceWnd:GetMode() == UI.PveChoiceWnd.modes.CHOICE then
		UI.PveChoiceWnd:UnlinkFromParent()
	end
	UI.PveWnd:UnlinkFromParent()

	if UI.ArenaWnd:GetMode() ~= UI.ArenaWnd.modes.MATCHMAKING then
		UI.ArenaWnd:UnlinkFromParent()
	end

    self.itemToBuy = nil
	self.buyInventoryRequestId = 0
	
	UI.Hangar_QuestsWnd:UnlinkFromParent()

end


--
function UI.HangarWnd:FullUpdate()

	self.bCameraTransitionLocked = true

	self:Reset()

	UI:UpdateInvItems()

	self:RequestBlock_ServerInfo( true )
	
	self:UpdateBattleSlots()

	if self.menuTabToSet then

		if self.menuTabToSet == self.menuTabs.SHIP_PREVIEW and self.previewShipToSet then
			
			self:ShowShipPreview( self.previewShipToSet.defName )
			
			self.previewShipLaunchData	= self.previewShipToSet.restoreData
			self.customShipVid			= self.customShipVidToSet

		elseif self.menuTabToSet == self.menuTabs.EQUIPMENT_PREVIEW and self.previewShipToSet then
			
			local shipItem = UI:GetShipItemByDef( self.previewShipToSet.defName, false )
			if shipItem then

				self:ShowEquipmentPreview( shipItem.vid )
				
				self.previewShipLaunchData	= self.previewShipToSet.restoreData
				self.customShipVid			= self.customShipVidToSet

			else
				sys.log( "UI.HangarWnd:FullUpdate()[ERROR]: cannot find ship item for eqiuipment preview" )
			end

		elseif self.menuTabToSet == self.menuTabs.SHIP_CRAFT then
			
			self:ShowShipCraft( self.shipCraftLaunchDataToSet.shipDefName, self.shipCraftLaunchDataToSet.launchData )
			self.customShipVid = self.customShipVidToSet

		elseif self.menuTabToSet == self.menuTabs.SHIP_BUY then
			
			self:ShowShipBuyWnd( self.shipBuyLaunchDataToSet.shipDefName, self.shipBuyLaunchDataToSet.launchData, false )
			self.customShipVid = self.customShipVidToSet

		elseif self.menuTabToSet == self.menuTabs.STICKERS then

			if self.stickersLaunchDataToSet.prevMenuTab == self.menuTabs.EQUIPMENT_PREVIEW then

				local shipItem = UI:GetShipItemByDef( self.previewShipToSet.defName, false )
				if shipItem then

    				self:ShowEquipmentPreview( shipItem.vid )
    				self.previewShipLaunchData = self.previewShipToSet.restoreData

				else
					sys.log( "UI.HangarWnd:F_OnEventRestoreUiState()[ERROR]: cannot find ship item for equipment preview" )
				end

			end

			self:TrySetMenuTab( self.menuTabToSet, false, true )

			self.customShipVid = self.customShipVidToSet

		else
		
			self:TrySetMenuTab( self.menuTabToSet, false, true )

			if self.customShipVidToSet and self.customShipVidToSet ~= UI.INVALID_U64_ID then				
    			self:SetCustomShip( self.customShipVidToSet )
			end			

		end
		
	end

	self.menuTabToSet				= nil
	self.previewShipToSet			= nil
	self.shipCraftLaunchDataToSet	= nil
	self.shipBuyLaunchDataToSet		= nil
	self.stickersLaunchDataToSet	= nil
	self.customShipVidToSet			= nil


	if self.prepareStateToSet then
	
		self.prepareBattleSlot		= self.prepareBattleSlotToSet
		self.prepareGameParams		= self.prepareGameParamsToSet
		self.prepareCheckReadyType	= self.prepareCheckReadyTypeToSet
		self.prepareEmm				= self.prepareEmmToSet
	
		self:SetPrepareState( self.prepareStateToSet )
		
		self.prepareStateToSet 			= nil
		self.prepareBattleSlotToSet		= nil
		self.prepareGameParamsToSet		= nil
		self.prepareCheckReadyTypeToSet	= nil
		self.prepareEmmToSet			= nil
		
	end

	if self.bMatchmakingToShow == true then
		self:AddChild( UI.MatchMakingContainerWnd )
		self.bMatchmakingToShow = nil
	end

	if self.bPvpMatchmakingToShow == true then
		UI.PvpMatchmakingWnd:Show()
		self.bPvpMatchmakingToShow = nil
	end

	if self.bPveMatchmakingToShow == true then
		UI.PveChoiceWnd:Show()
		self.bPveMatchmakingToShow = nil
	end	

	if self.bArenaMatchmakingToShow == true then
		UI.ArenaWnd:Show()
		self.bArenaMatchmakingToShow = nil
	end	

	-- если игрок в прошлый раз разлогинился, не завершив бой, и этот бой еще идет,
	-- то показ месседжбокса с выбором: вернуться в бой/выйти из боя

	if _G.MasterServer_IsInGame() then
		self:ShowRejoinGameMsg()
	end

	self:UpdateStartBtnState( true )
	self:UpdatePlayerNameAndClan()
	self:UpdateTalentsMenuBtnBlink()
	self:UpdateTalentsMenuBtnDisable()
	self:UpdateItemCraftMenuBtnDisable()
	self:UpdateShipsMenuBtnSale()
	self:UpdateMailBtnState()
	self:UpdateMenuBtnsTooltips()
	self:UpdateTimePos()

	self:SetNotificationsMode( self.notificationsModes.POP_UPS )
	if not UI.DebriefingWnd:IsOnScreen() then
		UI.NotificationsPopUpsWnd:CheckUnshownNotifications()
	end

	UI.Chat:LeaveBattleChannel()
	
	self.bCameraTransitionLocked = false

	self.expiredMsgTimer = self.EXPIRED_MSG_DELAY

	if _G.MasterServer_IsInTournament() or UI:IsEnqueued() then
		self:SetPrepareState( self.prepareStates.MATCHMAKING )
	end

	UI.SquadWnd:Reload()
	
	UI.Hangar_ExpWnd:CheckBlink()
	
	self:UpdateQuestsWnd()

end


--
function UI.HangarWnd:RequestBlock_ServerInfo( bWait )

    self.lastRequestId_ServerInfo = _G.MasterServer_RequestServerInfo()
	self.serverInfoRequestTimer = self.SERVER_INFO_REQUEST_DELAY

end


--
function UI.HangarWnd:UpdateBlock_ServerInfo()

	local bPrevMatchmakingDisabled = self.serverInfo.mmDisabled
	if bPrevMatchmakingDisabled == nil then
		bPrevMatchmakingDisabled = false
	end

	local bPrevSandboxAccess = self.serverInfo.sandboxAccess
	if bPrevSandboxAccess == nil then
		bPrevSandboxAccess = false
	end

	self.serverInfo = _G.MasterServer_GetServerInfo() or {}

	self:UpdateStartBtnState()

	-- Во время мачмейкинга и подготовки к нему месседжбокс на дисэйбл мачмейкинга не показывается -
	-- если окно мачмейкинга уже на экране (была вызвана MasterServer_OnEnterMMQueue(), то игрок может пройти в игру);
	-- если идет подготовка, то прерывание ее чревато глюками, месседжбокс покажется после вызова MasterServer_OnEnterMMQueue(),
	-- которая вернет соответствующий код ошибки.
	-- Если игрок вручную прервал процесс (закрыл окно мачмейкига или подготовки), то месседжбокс покажется на это стобытие

	if	not UI.MatchMakingContainerWnd:IsOnScreen()
		and not UI.PvpMatchmakingWnd:IsOnScreen()
		and not ( UI.PveChoiceWnd:IsOnScreen() and UI.PveChoiceWnd:GetMode() == UI.PveChoiceWnd.modes.MATCHMAKING )
		and not ( UI.ArenaWnd:IsOnScreen() and UI.ArenaWnd:GetMode() == UI.ArenaWnd.modes.MATCHMAKING )
		and self.prepareState == self.prepareStates.NONE then

        	local bMatchmakingDisabled = self.serverInfo.mmDisabled
        	if bMatchmakingDisabled and not bPrevMatchmakingDisabled then
        		self:ShowMatchMakingDisabledMsg()
        	end
	end

end


-- SC-112665 снятие автоген-модуля с "куклы" корабля перед апгрейдом модуля,
-- иначе после апгерйда упадет, т.к. будет создан новый деф, а в модуле хранится указатель на старый протухший
function UI.HangarWnd:UnequipAutogenModuleFromShipEnt( iid )

	local shipItem, moduleSlotId = UI:GetEquippedShipItemAndSlot( iid )
	
	if not shipItem then
		return
	end
	
	local shipSlotIdx = self:GetShipSlotByVid( shipItem.vid )
	if shipSlotIdx == -1 then
		return
	end
	
	local shipEntId = self.shipEntIds[ shipSlotIdx ]
	if shipEntId == nil or shipEntId == -1 then
		return
	end
	
	local shipEnt = _G.Entities[ shipEntId ]
	if not shipEnt then
		return
	end
	
	shipEnt:EquipModule( moduleSlotId, "" )

end


--
function UI.HangarWnd:OnEquipModulesChanged( vid )

	local shipSlotIdx = self:GetShipSlotByVid( vid )
	if shipSlotIdx == -1 then
		return
	end

	local shipEntId = self.shipEntIds[ shipSlotIdx ]
	if shipEntId == nil or shipEntId == -1 then
		return
	end

	local shipEnt = _G.Entities[ shipEntId ]
	if not shipEnt then
		return
	end

	local shipItem = UI:GetShipItem( vid, false )

	local equipmentDefs = {}
	for moduleSlotId, iid in pairs( shipItem.equipModules ) do

	    if iid ~= UI.INVALID_U64_ID then

    		local item = UI:GetInventoryItemEx( iid )
    		if item then
    			equipmentDefs[ moduleSlotId ] = item.defName
    		end

		end

	end            

	for moduleSlotId = 0, ai.SpaceShipModuleSlot.NUM - 1 do		

		if UI:HasShipModuleSlotByEnt( shipEnt, moduleSlotId ) and ai.IsModuleSlotEquipableInHangar( moduleSlotId ) then

			local curModule = shipEnt:GetModule( moduleSlotId )
			local curModuleDefName = curModule and curModule:GetDefName() or ""

			local needModuleDefName = equipmentDefs[ moduleSlotId ] or ""

			if curModuleDefName ~= needModuleDefName then
				shipEnt:EquipModule( moduleSlotId, needModuleDefName )
			end

		end

	end

end


--
function UI.HangarWnd:OnSelShipAmmoChanged()

	if self.selShipEntId ~= -1 then

    	local selShipItem	= self:GetSelShipItem()
    	local shipEnt			= _G.Entities[ self.selShipEntId ]

		if shipEnt then

			for ammoName, ammoSlotId in pairs( ai.MunitionBayType ) do
				if ammoSlotId ~= ai.MunitionBayType.MBT_NUM then

					local ammoInfo = selShipItem and selShipItem.equipAmmo[ ammoSlotId ]
					local ammoDef = ""

					if ammoInfo and ammoInfo.def ~= "" and ammoInfo.amount > 0 then
						ammoDef = ammoInfo.def
					end

		    		shipEnt:EquipMunition( ammoSlotId, ammoDef )

				end
			end

		end

	end

end


--
function UI.HangarWnd:UpdatePlayerNameAndClan()

	local nickName = UI.serverData.playerCredentials.nickname or ""

	local clanTag = ""

	local cid = UI:GetLocalPlayerCid()
	if cid ~= UI.INVALID_U64_ID then
		clanTag = UI:GetClanTag( cid )
	end

	local str = UI:MakePlayerNameInternal( nickName, clanTag, -1 )

	UI.Hangar_TopPanelWnd:SetText( str, UI.Hangar_TopPanelWnd.layers.PLAYER_NAME_CLAN )	


end


--
function UI.HangarWnd:UpdateBattleSlots()

	if self.bInUpdateBattleSlots then
		return
	end

	self.bInUpdateBattleSlots = true

	local oldSelSlotIdx = UI.Hangar_BattleListWnd:GetSelectedRecord()

	UI.Hangar_BattleListWnd:Clear()

	for slotIdx = 1, UI.serverData.battleSlotsMax do

		local data = {}
		data.shipSlotIdx = slotIdx - 1

		if slotIdx <= UI.serverData.battleSlotsCount then

			data.bSlotBought = true

			data.shipItem = nil

			local vid = UI.serverData.battleSlots[ slotIdx ]
			if vid ~= nil and vid ~= UI.INVALID_U64_ID then
				data.shipItem = UI:GetShipItem( vid, false )
			end

		else

			data.bSlotBought	= false
			data.bSlotLockBuy	= slotIdx ~= ( UI.serverData.battleSlotsCount + 1 )
			data.bPriceGold		= false

		end

		UI.Hangar_BattleListWnd:AddRecord( data )
		self:UpdateBattleSlotMouseOverState( UI.Hangar_BattleListWnd:GetNumRecords() )

	end	

	local selSlotIdx = -1

	if self.selShipSlotToSelect then
		selSlotIdx = self.selShipSlotToSelect
		self.selShipSlotToSelect = nil

	elseif oldSelSlotIdx ~= -1 then
		selSlotIdx = oldSelSlotIdx
		
	else
		if self.previewShipDefName == "" and self.customShipVid == UI.INVALID_U64_ID then
			selSlotIdx = 1
		end		
	end

	if selSlotIdx ~= -1 then
		UI.Hangar_BattleListWnd:SelectRecord( selSlotIdx )
	else
		self:OnSelShipChanged()
	end

	self:UpdateDamageMsg()
	self:UpdateInBattleMsg()
	self:UpdateStartBtnState()
	self:UpdateShipEnts()

	self.bInUpdateBattleSlots = false

end


--
function UI.HangarWnd:UpdateBattleSlotsOnAssignToBattleResult( bSuccess, slotIdx )

	if slotIdx < 1 or slotIdx > UI.Hangar_BattleListWnd:GetNumRecords() then
		return
	end

	local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )

	data.bWait = false

	if bSuccess then

		data.shipItem = nil

		local vid = UI.serverData.battleSlots[ slotIdx ]

		if vid ~= nil and vid ~= UI.INVALID_U64_ID then
			data.shipItem = UI:GetShipItem( vid, false )
		end

	end

	local btn = UI.Hangar_BattleListWnd:GetButtonForRecord( slotIdx )
	if btn then
		btn:FullUpdate()
	end
	
	self:UpdateBattleSlotMouseOverState( slotIdx )

	self:UpdateDamageMsg()
	self:UpdateInBattleMsg()
	self:UpdateStartBtnState()

end


--
function UI.HangarWnd:OnMouseLButtonDownDelayed( mouseX, mouseY, wndThatReceivedInput )

	-- неоходима при клике на боевые слоты во время открытого окна талантов с незакоммиченными талантами
	-- (боевые слоты реагируют на отпускание мыши, а не нанажатие, поэтому эмулируются обе функции)

	self:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )
	self:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

end


--
function UI.HangarWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	-- если было открыто окно типа магазина, и клик произошел в элемент, не принадлежащий ему, то это окно закрывается
	if	self.menuTab ~= self.menuTabs.MAIN
		and self.menuTab ~= self.menuTabs.EMPTY
		and self.menuTab ~= self.menuTabs.STICKERS
		and self.menuTab ~= self.menuTabs.SHIP_PREVIEW
		and self.menuTab ~= self.menuTabs.SHIP_CRAFT
		and self.menuTab ~= self.menuTabs.SHIP_BUY
		and self.menuTab ~= self.menuTabs.FREE_SPACE_MAP
		and self.menuTab ~= self.menuTabs.CUSTOM_GAME
		and self.menuTab ~= self.menuTabs.EQUIPMENT_PREVIEW
		and self.menuTab ~= self.menuTabs.PROFILE_NEW
		and self.menuTab ~= self.menuTabs.BATTLE_PASS then

		local workWnd = self:GetWorkWndForTab( self.menuTab )
		local bClickOnWorkWnd = workWnd and ( w == workWnd or w:IsChildOf( workWnd ) )		

		if not bClickOnWorkWnd and w ~= self and not w.MENU_BTN and w ~= UI.Hangar_ProfileBtn and w ~= UI.Hangar_ProfileBtn_RankWnd and w ~= UI.Hangar_ClanBtn and w ~= UI.Hangar_TalentsBtn then

			local validMenuTab = UI.HangarWnd:ValidateMenuTabForPrepareState( self.menuTabs.MAIN, self.prepareState )
			self:TrySetMenuTab( validMenuTab, true, false, { fn = UI.HangarWnd.OnMouseLButtonDownDelayed, params = { self, mouseX, mouseY, wndThatReceivedInput } } )

			if self.menuTab ~= validMenuTab then
				return true
			end

		end

	end

	if w.MENU_BTN then

       	local recordIdx = w:GetRecord()

		if not w:IsDisabled() then

			local menuTab = UI.Hangar_MenuWnd:GetMenuTabForRecord( recordIdx )

			if recordIdx ~= UI.Hangar_MenuWnd:GetSelectedRecord() then
				self:TrySetMenuTab( menuTab, true, false )
			else

				if menuTab == self.menuTabs.SHIPS then
					UI.ShipsTreeWnd:HandleEscape()
				else
					self:TrySetMenuTab( self.menuTabs.MAIN, true, false )
				end	
			end

		end


	elseif w == UI.Hangar_ShipCustomizationBtn or w:IsChildOf( UI.Hangar_ShipCustomizationBtn ) then

		self:TrySetMenuTab( self.menuTabs.STICKERS, true, false )

	elseif w == UI.Hangar_ProfileBtn or w == UI.Hangar_ProfileBtn_RankWnd then

		if self.menuTab ~= self.menuTabs.PROFILE and self.menuTab ~= self.menuTabs.PROFILE_NEW then
			UI:PlayGlobalSound( UI.HangarWnd.sounds.openMenu )
			self:TrySetMenuTab( self.menuTabs.PROFILE, false, false )
		elseif self.menuTab == self.menuTabs.PROFILE or self.menuTab == self.menuTabs.PROFILE_NEW then
			self:TrySetMenuTab( self.menuTabs.MAIN, true, false )
		end

	elseif w == UI.Hangar_ClanBtn and ( not UI.Hangar_ClanBtn:HasStyle( UI.WS_GRAYED ) ) then

		if self.menuTab ~= self.menuTabs.CLAN then
			UI:PlayGlobalSound( UI.HangarWnd.sounds.openMenu )
			self:TrySetMenuTab( self.menuTabs.CLAN, false, false )
		else
			self:TrySetMenuTab( self.menuTabs.MAIN, true, false )
		end

	elseif w == UI.Hangar_StartBtn then

		if not UI.Hangar_StartBtn:IsGray() then
			self:OnStartBtn()
		end
		
	elseif w == UI.Hangar_FriendListBtn then

		self:ToggleFriendsList()

	elseif w == UI.Hangar_VoteBtn then

		if UI.Hangar_VoteBtn:IsEnabled() then
			self:ToggleVoteWnd()
		else
			--UI:PlayGlobalSound( UI.sounds.invalid )
		end

	elseif w == UI.Hangar_MainMenuBtn then

		UI:PlayGlobalSound( UI.HangarWnd.sounds.openMenu )
		UI:ShowMainMenu()

    elseif w == UI.Hangar_ProfileBtn_LicenseBtn then

		self:ShowLicenses( true )

	elseif w == UI.Hangar_NotificationsModeBtn then

		self:ToggleNotificationsMode()

	elseif UI:IsWndKindOf( w, "ItemControl_DurabilityIcoWnd" ) then

		local shipSlotWnd = w:GetParent()
		if UI:IsWndKindOf( shipSlotWnd, "Hangar_ShipSlotWnd_proto" ) then

			local data = shipSlotWnd:GetRecordData()
			local shipItem = data.shipItem
			if shipItem then
				self:TryRefillAndRepairByRequest( shipItem )
				UI:PlayGlobalSound( self.sounds.durabilityIcoClick )
			end

		end

	elseif w == self then

		self:TrySelectShipEntByMouse()

	elseif w == UI.Hangar_MailBtn then

		if not UI.MailWnd:IsOnScreen() then
			self:ShowMail( true )
		else
			self:HideMail( true )
		end

	elseif w == UI.Hangar_BundlesBtn then

		self:ShowBundles( true )

	elseif w == UI.Hangar_EMM_StartBtn then

		if not UI.Hangar_EMM_StartBtn:IsGray() then
			self:CheckStartMatchMaking( nil, nil, nil, true )
			UI:PlayGlobalSound( self.sounds.startEMM )
		end

	elseif w == UI.Hangar_EMM_StopBtn then

		if not UI.Hangar_EMM_StopBtn:IsGray() then
			self:StopEMM()
			UI:PlayGlobalSound( self.sounds.stopEMM )
		end

	elseif w == UI.Hangar_CrossBtn then
	
		if self.menuTab == self.menuTabs.SHIP_PREVIEW or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW  then
			self:ReturnFromPreview()
		else
			sys.log( "UI.HangarWnd:F_OnMouseLButtonDown()[ERROR]: unhandled menuTab %d", self.menuTab )
		end
		
	elseif w == UI.Hangar_TalentsBtn and not UI.Hangar_TalentsBtn:IsGray() then

		if self.menuTab ~= self.menuTabs.SKILLS then
			self:TrySetMenuTab( self.menuTabs.SKILLS, true, false )
		else
			self:TrySetMenuTab( self.menuTabs.MAIN, true, false )
		end
		
	elseif w == UI.Hangar_CurrentEventInfo_ShowWindowBtn then
		
		local bHandled = false
		
		if _G.MasterServer_BattlePassIsActive() and self.menuTab ~= self.menuTabs.BATTLE_PASS then
			self:ShowBattlePass( true )
			bHandled = true
		elseif _G.MasterServer_GetLeadingAdvertInfo().isActive and self.menuTab ~= self.menuTabs.MARKETING then
			local marketingLaunchData = UI.MarketingWnd:GetLaunchData()
			local actionId = UI.Marketing_ActionsWnd:GetLeadingActionId()
			self:OpenAction( actionId, true, marketingLaunchData )
			bHandled = true
		end
		
		if not bHandled then
			self:TrySetMenuTab( self.menuTabs.MAIN, true, false )
		end
	end

	return true

end 


--
function UI.HangarWnd:F_OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:IsInputBlocked() then
		return true
	end

	if self:OnMouseLButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if w ~= self.wndUnderLastMouseDown then
		return true
	end

	-- #0032857: боевые слоты реагируют не на нажатие, а но отпускание мыши, чтобы не пересекаться с драг-эн-дропом кораблей
	if UI:IsWndKindOf( w, "Hangar_ShipSlotWnd_proto" ) then

		local list = w:GetList()

		if list == UI.Hangar_BattleListWnd then

			local recordIdx = w:GetRecord()
			local data = UI.Hangar_BattleListWnd:GetRecordData( recordIdx )
	
			if data.bSlotBought then

				if recordIdx ~= UI.Hangar_BattleListWnd:GetSelectedRecord() then

					UI.Hangar_BattleListWnd:SelectRecord( recordIdx )
					UI:PlayGlobalSound( UI.HangarWnd.sounds.battleSlotSelect )

				else

					if recordIdx ~= UI.Hangar_BattleListWnd:GetSelectedRecord() then
						UI.Hangar_BattleListWnd:SelectRecord( recordIdx )
					end

					local shipDefName = data.shipItem and data.shipItem.defName or ""
					self:OpenShips( shipDefName, true )

				end

			end

		end

	end

	return true

end


--
function UI.HangarWnd:F_OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput )

	if self:OnMouseMove( mouseX, mouseY, deltaX, deltaY, wndThatReceivedInput ) then
		return true
	end

	local bNeedRotatingCamera = wndThatReceivedInput == self:GetUiHandle() and ( _G.Input_IsKeyPressed( UI.Keys.KEY_MOUSE_BUTTON2 ) or _G.Input_IsKeyPressed( UI.Keys.KEY_MOUSE_BUTTON3 ) ) and not UI:IsContextMenuOnScreen()

	if bNeedRotatingCamera and not self.bRotatingCamera then
		self:StartRotatingCamera()

	elseif not bNeedRotatingCamera and self.bRotatingCamera then
		self:StopRotatingCamera()

	elseif self.bRotatingCamera and _G.Input_IsKeyPressed( UI.Keys.KEY_MOUSE_BUTTON2 ) then
		_G.Hangar:RotateCamera( deltaX, deltaY )

	elseif self.bRotatingCamera and _G.Input_IsKeyPressed( UI.Keys.KEY_MOUSE_BUTTON3 ) then
		_G.Hangar:MoveCamera( deltaX, deltaY )

	end

	return true

end


--
function UI.HangarWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if UI:IsWndKindOf( w, "Hangar_ShipSlotWnd_proto" ) then

		local data = w:GetRecordData()
		if data.shipItem then

			local bCanChangeNow = false

			if not UI:IsWaitingRequests() then
				bCanChangeNow = self.lastRequestId_ChangeBattleSlotVessel == 0 and self.swapBattleSlotVesselsRequstId == 0
			end

			if bCanChangeNow then
				UI:ShowPopUpMenuForShip( data.shipItem.defName, self:GetUiHandle() )
			end

		end

	end

	return true

end


--
function UI.HangarWnd:F_OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonUp( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:StopRotatingCamera()

	return true

end


--
function UI.HangarWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	_G.Hangar:ZoomCamera( ticks )
	return true	

end


--
function UI.HangarWnd:TrySetMenuTab( menuTab, bSound, bForce, continueData )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: not on screen" )
		return
	end

	if type( menuTab ) ~= "number" then
		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: invalid type of the 1-st parameter (\"menuTab\"); \"number\" expected, got \"%s\"", type( menuTab )  )
		return
	end

	if menuTab ~= -1 and UI:Val2Key( self.menuTabs, menuTab ) == "" then
		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: invalid 1-st parameter (\"menuTab\"); one of the \"UI.HangarWnd.menuTabs\" values or -1 expected, got %d", menuTab  )
		return
	end

	if bSound ~= nil and type( bSound ) ~= "boolean" then
		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: invalid type of the 2-nd parameter (\"bSound\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bSound )  )
		bSound = nil
	end

	if bForce ~= nil and type( bForce ) ~= "boolean" then
		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: invalid type of the 3-rd parameter (\"bForce\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bForce )  )
		bForce = nil
	end

	if continueData ~= nil and type( continueData ) ~= "table" then
		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: invalid type of the 4-th parameter (\"continueData\"); \"table\" or \"nil\" expected, got \"%s\"", type( continueData )  )
		continueData = nil
	end

	if bSound == nil then
		bSound = true
	end

	if bForce == nil then
		bForce = true
	end

	menuTab = self:ValidateMenuTabForPrepareState( menuTab, self.prepareState )

	if self.menuTab == menuTab then
		return
	end

	if UI.Hangar_MenuWnd:IsTabDisabled( menuTab ) then
		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: tab %s is disabled", UI:Val2Key( self.menuTabs, menuTab ) )
		return
	end

	if self.menuTab == self.menuTabs.SKILLS and not bForce then

		if not UI.TalentsWnd:CheckClose() then

			self.continueSetMenuTabData				= {}
			self.continueSetMenuTabData.lockingWnd	= UI.TalentsWnd
			self.continueSetMenuTabData.menuTab		= menuTab
			self.continueSetMenuTabData.fn			= nil
			self.continueSetMenuTabData.params		= {}

			if continueData then

            	if continueData.fn ~= nil then
					if type( continueData.fn ) == "function" then

						self.continueSetMenuTabData.fn = continueData.fn

                    	if continueData.params ~= nil then

        					if type( continueData.params ) == "table" then
								self.continueSetMenuTabData.params = continueData.params
							else
        	            		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: invalid type of the field (\"continueData.params\"); \"table\" or \"nil\" expected, got \"%s\"", type( continueData.params )  )
								self.continueSetMenuTabData.fn = nil
        					end

                    	end

					else
	            		sys.log( "UI.HangarWnd:TrySetMenuTab()[ERROR]: invalid type of the field (\"continueData.fn\"); \"function\" or \"nil\" expected, got \"%s\"", type( continueData.fn )  )
					end
            	end

			end

			return

		end

	end

	self.continueSetMenuTabData = nil

	local prevMenuTab = self.menuTab
	self.menuTab = menuTab

	local menuTabRecordIdx = UI.Hangar_MenuWnd:GetRecordForMenuTab( self.menuTab )
	UI.Hangar_MenuWnd:SelectRecord( menuTabRecordIdx, false )

	self:UpdateWorkWndMenuTab( prevMenuTab )
	self:UpdateControlsVisibility()

	if self.menuTab ~= self.menuTabs.MAIN and self.menuTab ~= self.menuTabs.EMPTY then
	
		self:SetNotificationsMode( self.notificationsModes.POP_UPS )
		self:HideMail( false )
		self:HideTourWnd()
		self:HideGameplayChoiceWnd()
		self:HideArenaWnd()
		UI.ChatWnd:HideTradingWnd()
		UI.FriendsListWnd:UnlinkFromParent()
		UI.Vote_Wnd:UnlinkFromParent()
		self:HidePveWnd()

		if UI.PveChoiceWnd:GetMode() == UI.PveChoiceWnd.modes.CHOICE then
			self:HidePveChoiceWnd()
		end

	end

	if self:IsOnScreen() and bSound then
		UI:PlayGlobalSound( UI.HangarWnd.sounds.menuTabSelect )
	end


	local previewModes =
	{
		[ self.menuTabs.SHIP_PREVIEW ]		= true,
		[ self.menuTabs.EQUIPMENT_PREVIEW ]	= true,
		[ self.menuTabs.STICKERS ]			= true,
		[ self.menuTabs.SHIP_CRAFT ]		= true,
		[ self.menuTabs.SHIP_BUY ]			= true,
	}

	if previewModes[ prevMenuTab ] and not previewModes[ self.menuTab ] then
		self:ResetPreviewShip()
	end


	-- специальная камера для окна кастомизации и окна крафта

	local selSlotIdx = self:GetSelShipSlot()
	if selSlotIdx ~= -1 then

    	if		( prevMenuTab ~= self.menuTabs.STICKERS and self.menuTab == self.menuTabs.STICKERS ) or
				( prevMenuTab ~= self.menuTabs.SHIP_CRAFT and self.menuTab == self.menuTabs.SHIP_CRAFT ) then
	    			_G.Hangar:SetDefaultCameraForSlot( selSlotIdx, self.selShipEntId, true )

    	elseif	( prevMenuTab == self.menuTabs.STICKERS and self.menuTab ~= self.menuTabs.STICKERS ) or
				( prevMenuTab == self.menuTabs.SHIP_CRAFT and self.menuTab ~= self.menuTabs.SHIP_CRAFT ) then
	    			_G.Hangar:SetDefaultCameraForSlot( selSlotIdx, self.selShipEntId, false )
    	end

	end

	UI:SendUiEvent( UI.EV_HANGAR_TAB_CHANGED, self:GetUiHandle(), UI.INVALID_RESOURCE_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )

end


--
function UI.HangarWnd:CheckContinueSetMenuTab( lockingWnd )

	if not self.continueSetMenuTabData then
		return
	end

	if type( lockingWnd ) ~= "table" or type( lockingWnd.w ) ~= "userdata" then
		sys.log( "UI.HangarWnd:CheckContinueSetMenuTab()[ERROR]: invalid type of the 1-st parameter (\"lockingWnd\"); window expected, got \"%s\"", type( lockingWnd ) )
		return
	end

	if self.continueSetMenuTabData.lockingWnd ~= lockingWnd then
		return		
	end


	local savedContinueSetMenuTabData = self.continueSetMenuTabData	

	self:TrySetMenuTab( self.continueSetMenuTabData.menuTab, false, true )	

	local fn = savedContinueSetMenuTabData.fn
	if fn then
		fn( unpack( savedContinueSetMenuTabData.params ) )
	end

	self.continueSetMenuTabData = nil

end


--
function UI.HangarWnd:UpdateControlsVisibility()

	if	self.menuTab == self.menuTabs.STICKERS
		or self.menuTab == self.menuTabs.SHIP_PREVIEW
		or self.menuTab == self.menuTabs.SHIP_CRAFT
		or self.menuTab == self.menuTabs.SHIP_BUY
		or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW
		or self.menuTab == self.menuTabs.PROFILE_NEW
		or self.menuTab == self.menuTabs.BATTLE_PASS then

			self:SetLayerVisible( false, self.layers.PREPARE_CONTROLS_EFFECT )
			self:SetLayerVisible( self.menuTab == self.menuTabs.SHIP_PREVIEW, self.layers.PREVIEW_SHIP_NAME )
			UI.Hangar_BundlesBtn:UnlinkFromParent()
			UI.HangarClientStatsWnd:UnlinkFromParent()
			self:SetLayerVisible( false, self.layers.TIME )
			UI.OffersWnd:UnlinkFromParent()
			UI.Hangar_NotificationsModeBtn:UnlinkFromParent()
			UI.Hangar_EMMWnd:UnlinkFromParent()
			UI.Hangar_TalentsBtn:UnlinkFromParent()

			if self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
				self:AddChild( UI.Hangar_ShipCustomizationBtn )
			else
				UI.Hangar_ShipCustomizationBtn:UnlinkFromParent()
			end
		

	elseif self.menuTab == self.menuTabs.MAIN then

		self:SetLayerVisible( true, self.layers.PREPARE_CONTROLS_EFFECT )
		self:SetLayerVisible( false, self.layers.PREVIEW_SHIP_NAME )
		self:AddChild( UI.Hangar_ShipCustomizationBtn )
		self:AddChild( UI.Hangar_BundlesBtn )
		self:AddChild( UI.HangarClientStatsWnd )
		self:SetLayerVisible( true, self.layers.TIME )
		self:AddChild( UI.OffersWnd )
		self:AddChild( UI.Hangar_NotificationsModeBtn )
		self:AddChild( UI.Hangar_EMMWnd )
		self:AddChild( UI.Hangar_TalentsBtn )

	else

		self:SetLayerVisible( false, self.layers.PREPARE_CONTROLS_EFFECT )
		self:SetLayerVisible( false, self.layers.PREVIEW_SHIP_NAME )
		self:AddChild( UI.Hangar_ShipCustomizationBtn )
		self:AddChild( UI.Hangar_BundlesBtn )
		self:AddChild( UI.HangarClientStatsWnd )
		self:SetLayerVisible( true, self.layers.TIME )
		self:AddChild( UI.OffersWnd )
		self:AddChild( UI.Hangar_NotificationsModeBtn )
		self:AddChild( UI.Hangar_EMMWnd )
		UI.Hangar_TalentsBtn:UnlinkFromParent()

	end
	
	UI:UpdateChatVisibility()
	self:UpdateQuestsWnd()
	self:UpdateCurrentEventInfoName()
	self:UpdateCurrentEventInfoVisibility()
	self:UpdateBattleSlotsVisibility()
	
	if self.menuTab == self.menuTabs.SHIP_PREVIEW or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
		self:AddChild( UI.Hangar_CrossBtn )
	else
		UI.Hangar_CrossBtn:UnlinkFromParent()
	end

end


--
function UI.HangarWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

end


--
function UI.HangarWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end


--
function UI.HangarWnd:UpdateWorkWndMenuTab( prevMenuTab )

	self:HideWorkWnd()

	local workWnd = self:GetWorkWndForTab( self.menuTab )
	if workWnd then

		self:ShowWorkWnd( workWnd )

		if self.menuTab == self.menuTabs.FREE_SPACE_MAP then
			UI.GameplayPveMapWnd:SetMode( UI.GameplayPveMapWnd.modes.FREE_SPACE )

		elseif self.menuTab == self.menuTabs.CUSTOM_GAME then
			UI.GameplayWnd:SetMode( UI.GameplayWnd.Modes.CUSTOM_GAME )
		end

		if not UI.bSavingGameState then

    		if self.menuTab == self.menuTabs.STICKERS then
    			workWnd:SetupPrevHangarMenuTab( prevMenuTab )
    		end

		end

	end

	UI.Hangar_ProfileBtn:Update()
	UI.Hangar_ClanBtn:Update()
	
end


--
function UI.HangarWnd:HideWorkWnd()

	if self.workWnd then

		if self.workWnd == UI.GameplayPveMapWnd then
			UI.GameplayPveMapWnd:Unlink()	-- UI.GameplayPveMapWnd может быть чайлдом другого окна (UI.GameplayPveMapHudContainerWnd), в функции Unlink() оно отлинковывается, в т.ч. и от эффекта

		elseif self.workWnd:IsChildOf( self ) then
			self.workWnd:UnlinkFromParent()
		end

		self.workWnd = nil

	end

end


--
function UI.HangarWnd:ShowWorkWnd( workWnd )

	if workWnd then

		if not workWnd:IsChildOf( self ) then

			if workWnd == UI.GameplayPveMapWnd then

				UI.GameplayPveMapWnd:Unlink()	-- UI.GameplayPveMapWnd может быть чайлдом другого окна (UI.GameplayPveMapHudContainerWnd), в функции Unlink() оно отлинковывается, в т.ч. и от эффекта

				local newResEffect = UI:GetEffectFromLayer( self, self.layers.NEW_RES_EFFECT )
				if newResEffect  then
        			newResEffect:LinkWnd( workWnd:GetUiHandle(), self.effectInfo.newRes.gameplayPveMapLocator, UI.EffectAnimParams.POS )
				end

			elseif workWnd:GetParent() then

				workWnd:UnlinkFromParent()

			end

			self:AddChild( workWnd )

		end

		self.workWnd = workWnd

	end

end


--
function UI.HangarWnd:GetWorkWndForTab( menuTab )

	if menuTab == self.menuTabs.EMPTY then
		return nil

	elseif menuTab == self.menuTabs.SHOP then
		return UI.ShopWnd

	elseif menuTab == self.menuTabs.MAIN then	
		return UI.EquipmentWnd

	elseif menuTab == self.menuTabs.SHIPS then	
		return UI.ShipsTreeWnd

	elseif menuTab == self.menuTabs.SKILLS then	
		return UI.TalentsWnd

	elseif menuTab == self.menuTabs.STICKERS then	
		return UI.ShipCustomizationWnd

	elseif menuTab == self.menuTabs.LEADERBOARDS then	
		return UI.LeaderboardWnd

	elseif menuTab == self.menuTabs.HELP then	
		return UI.HelpListWnd

	elseif menuTab == self.menuTabs.PROFILE then	
		return UI.Profile_Wnd

	elseif menuTab == self.menuTabs.PROFILE_NEW then	
		return UI.ProfileWnd_new

	elseif menuTab == self.menuTabs.CLAN then	
		return UI.ClansMainWnd

	elseif menuTab == self.menuTabs.SHIP_PREVIEW then	
		return nil

	elseif menuTab == self.menuTabs.SHIP_CRAFT then	
		return UI.ShipCraftWnd

	elseif menuTab == self.menuTabs.SHIP_BUY then	
		return UI.ShipWnd

	elseif menuTab == self.menuTabs.ITEM_CRAFT then	
		return UI.ItemCraftMultiWnd

	elseif menuTab == self.menuTabs.FREE_SPACE_MAP then
		return UI.GameplayPveMapWnd

	elseif menuTab == self.menuTabs.CUSTOM_GAME then
		return UI.GameplayWnd

	elseif menuTab == self.menuTabs.MARKETING then	
		return UI.MarketingWnd

	elseif menuTab == self.menuTabs.EQUIPMENT_PREVIEW then	
		return UI.EquipmentWnd
		
	elseif menuTab == self.menuTabs.BATTLE_PASS then
		return UI.BattlePassWnd

	else
		sys.log( "UI.HangarWnd:GetWorkWndForTab()[ERROR]: unhandled tab: %s", tostring( menuTab ) )
		return nil
	end

end


--
function UI.HangarWnd:StartMatchMaking()

	local bSuccess = false

    local gameParams = self.prepareGameParams

	if gameParams == nil then

		sys.log( "UI.HangarWnd:StartMatchMaking()[ERROR]: game type gameParams is nil" )

	else

    	-- freespace
    	if gameParams and gameParams.mode == "FREE_SPACE" then

			bSuccess = true
    		self:SetPrepareState( self.prepareStates.MATCHMAKING_WAIT )

			local zoneId = gameParams.zoneId
			if zoneId == nil or zoneId == -1 then
				zoneId = _G.MasterServer_GetSpaceStationZoneId()
			end

    		self.freeSpaceRequestId = _G.MasterServer_FreeSpaceUndock( { battle_slot = gameParams.battleSlot - 1, civilian = cvars.cl_desiredCivilianFlag, region = UI:GetGameRegion(), zoneId = zoneId } )

    	else

    		-- мультиплеер
        	local mmParams = gameParams.mmParams

        	if mmParams ~= nil and type( mmParams ) ~= "table" then

        		sys.log( "UI.HangarWnd:StartMatchMaking()[ERROR]: invalid type of mmParams; \"table\" or \"nil\" expected, got \"%s\"", type( mmParams ) )

        	else

            	self.gameTypeToLaunch = gameParams.caption or ""

            	--self.lastRequestId_EnterMatchmakingQueue = _G.MasterServer_EnterMatchmakingQueue( mmParams )
            	if mmParams.tournament then
            		self.lastRequestId_EnterMatchmakingQueue =  _G.MasterServer_EnterTournament( mmParams )
            	else
            		self.lastRequestId_EnterMatchmakingQueue = _G.MasterServer_EnterMatchmakingQueue( mmParams )
            	end

            	if self.lastRequestId_EnterMatchmakingQueue ~= 0 then
					bSuccess = true
            		self:SetPrepareState( self.prepareStates.MATCHMAKING_WAIT )
            		-- не закрывать текущее окно, пока не встали в очередь #44507
            		--self:TrySetMenuTab( self.menuTabs.EMPTY, false, true )
            	else
                	UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), UI:GetStringByName( "msg_failStartMatchmaking" ), UI.MBS_OK )
            	end

			end

		end

	end

	if not bSuccess then
    	self:SetPrepareState( self.prepareStates.NONE )
	end

end


--
function UI.HangarWnd:StartEMM()

	if self.emmChangeReadyRequestId ~= 0 then
		sys.log( "UI.HangarWnd:StartEMM()[ERROR]: still waiting for another request" )
		return
	end

	if UI:IsEMMReady() then
		sys.log( "UI.HangarWnd:StartEMM()[ERROR]: player is already ready" )
		return
	end

	self.emmChangeReadyRequestId = _G.MasterServer_EMMChangeReady( true )

	if self.emmChangeReadyRequestId ~= 0 then
    	self:SetPrepareState( self.prepareStates.EMM_WAIT )
	else
		self:ShowMsgOnEmmChangeReadyError()
    	self:SetPrepareState( self.prepareStates.NONE )
	end

end


--
function UI.HangarWnd:StopEMM()

	if self.emmChangeReadyRequestId ~= 0 then
		sys.log( "UI.HangarWnd:StopEMM()[ERROR]: still waiting for another request" )
		return
	end

	if not UI:IsEMMReady() then
		sys.log( "UI.HangarWnd:StartEMM()[ERROR]: player is already not ready" )
		return
	end

	self.emmChangeReadyRequestId = _G.MasterServer_EMMChangeReady( false )

	if self.emmChangeReadyRequestId ~= 0 then
    	self:SetPrepareState( self.prepareStates.EMM_STOP_WAIT )
	else
		self:ShowMsgOnEmmChangeReadyError()
	end

end


--
function UI.HangarWnd:ActivateMatchMaking()

	UI.MatchMakingWnd:SetActive( self.gameTypeToLaunch )

end


--
function UI.HangarWnd:ResetMatchMaking()

	if UI.bSavingGameState then
		return
	end

	if UI.MatchMakingWnd:IsActive() then
		UI.MatchMakingWnd:Reset()
	end

end


--
function UI.HangarWnd:ShowMatchMakingWnd()

	if not UI.MatchMakingContainerWnd:GetParent() then

    	self:AddChild( UI.MatchMakingContainerWnd )
    	self:UpdateStartBtnState()

	end

end


--
function UI.HangarWnd:HideMatchMakingWnd()

	if UI.MatchMakingContainerWnd:GetParent() then
		UI.MatchMakingContainerWnd:UnlinkFromParent()
	end

end 


--
function UI.HangarWnd:ShowPvpMatchmakingWnd()

	if not UI.PvpMatchmakingWnd:GetParent() then

		UI.PvpMatchmakingWnd:Show()
    	self:UpdateStartBtnState()

	end

end


--
function UI.HangarWnd:HidePvpMatchmakingWnd()

	if UI.PvpMatchmakingWnd:GetParent() then

		UI.PvpMatchmakingWnd:UnlinkFromParent()
    	self:UpdateStartBtnState()

	end

end


--
function UI.HangarWnd:F_OnEventListSelectRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if hSender == UI.Hangar_BattleListWnd:GetUiHandle() then
		self:OnSelBattleSlotChanged()
	end

end


--
function UI.HangarWnd:OnSelBattleSlotChanged()

	local selBattleSlotIdx = self:GetSelBattleSlot()

	if selBattleSlotIdx ~= -1 then	
		self:ResetCustomShip( true )
		self:ResetPreviewShip( true )

		if self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then		-- условие введено тикетом SC-114203
			self:TrySetMenuTab( self.menuTabs.MAIN, true, false)
		end
	end
	
	if self.previewShipDefName == "" and self.customShipVid == UI.INVALID_U64_ID then
		self.selShipSlotIdx	= selBattleSlotIdx
	end	
	
	self:OnSelShipChanged()
	
end


--
function UI.HangarWnd:OnSelShipChanged()

	self:UpdateSelShipEnt()
	self:UpdateCameraForSelSlot()
	self:UpdateStickersBtn()	
	self:UpdatePreviewShipControls()

	UI.EquipmentWnd:OnHangarSelShipChanged()
	UI.ShipCustomizationWnd:OnHangarSelShipChanged()
	UI.ShopWnd:OnHangarSelShipChanged()
	UI.ShipsTreeWnd:OnHangarSelShipChanged()

end


--
function UI.HangarWnd:UpdateSelShipEnt()

	local selShipEntId = -1

	local selSlotIdx = self:GetSelShipSlot()

	if selSlotIdx ~= -1 then
		selShipEntId = self.shipEntIds[ selSlotIdx ] or -1
	end

	self:SetSelShipEnt( selShipEntId )

end


--
function UI.HangarWnd:SetSelShipEnt( shipEntId )

	if shipEntId == self.selShipEntId then
		return
	end

	self.selShipEntId = shipEntId
	
	self:OnSelShipEntChanged()

end


--
function UI.HangarWnd:OnSelShipEntChanged()

	if not self.bLockCameraUpdate then
		self:UpdateCameraForSelSlot()
	end

	UI.ShipCustomizationWnd:OnShipEntChanged()

end


--
function UI.HangarWnd:UpdateShipEnts()

	self:DestroyShipEnts()

	for slotIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do
		self:UpdateShipEntInSlot( slotIdx )
	end	

end


--
function UI.HangarWnd:UpdateShipEntInSlot( slotIdx )

	local oldShipEntId	= self.shipEntIds[ slotIdx ] or -1
	local shipEntId		= -1


	-- заполнятся информация для создания корабля (формат можно посмотреть в С++ SpaceShipSpawnData::FromScriptTable())

	local spawnData = nil

	local shipDefName = self:GetShipDefNameInSlot( slotIdx )
	if shipDefName ~= "" then

    	local shipItem = UI:GetShipItemByDef( shipDefName, false )

    	if shipItem then
    		spawnData = UI:GetShipSpawnData( shipItem.vid, true )
    	else
    		spawnData = UI:GetShipDefaultSpawnData( shipDefName )
    	end

	end


	if spawnData then

    	-- собственно спаун

    	-- при спауне корабля вызывается подгрузка моделей, и, как результат, ui::UpdateWhileLoadingScreen(), и UI.HangarWnd:F_OnNewFrame();
    	-- это ломает некоторые вещи (в частности, нотификации - см. #0050751)

    	self.bLockNewFrameUpdate = true
    	local ship = _G.SpawnSpaceShip( spawnData, ai.Container:GenerateUniqueName( "HangarShip" ), false )
    	self.bLockNewFrameUpdate = false

    	if ship then

    		shipEntId = ship:GetId()
    --		sys.log( "UI.HangarWnd:UpdateShipEntInSlot(): SpawnSpaceShip shipId %d  slot %d", shipEntId, slotIdx )
    		
        	-- привязка корабля к слоту на карте

        	local spawnSpotEntId = self.spawnSpotEntIds[ slotIdx ]
        	local spawnSpot = _G.Entities[ spawnSpotEntId ]
    	
        	if spawnSpot then    	
        		spawnSpot:AddChild( ship )
    			self:UpdateShipEntPos( ship, slotIdx )
        	else
        		sys.log( "UI.HangarWnd:UpdateShipEntInSlot()[ERROR]: cannot find spawn spot for slot %d", slotIdx )		
        	end

    	else
    		sys.log( "UI.HangarWnd:UpdateShipEntInSlot()[ERROR]: cannot create ship" )
    	end

	end


	-- уничтожение предыдущего корабля
	if oldShipEntId ~= -1 then

		self.bLockCameraUpdate = shipEntId ~= -1
		self:DestroyShipEntInSlot( slotIdx )
		self.bLockCameraUpdate = false

	end

	if shipEntId ~= -1 then

    	self.shipEntIds[ slotIdx ] = shipEntId

    	if slotIdx == self:GetSelShipSlot() then
    		self:SetSelShipEnt( shipEntId )
    	end

	end

end  


--
function UI.HangarWnd:DestroyShipEnts()

	for slotIdx, shipEntId in pairs( self.shipEntIds ) do
		self:DestroyShipEntInSlot( slotIdx )
	end

	self.shipEntIds = {}
	self:SetSelShipEnt( -1 )

end


--
function UI.HangarWnd:DestroyShipEntInSlot( slotIdx )

	local shipEntId = self.shipEntIds[ slotIdx ]

	if not shipEntId or shipEntId == -1 then
		return
	end

	-- SC-116185. Добавил проверку на наличие Entities, чтобы не пытались получить Entities, когда их нет
	if not UI:IsInShutdown() and ai.GetNumEntities() > 0 then

    	local ship = _G.Entities[ shipEntId ]
    	if ship then
    		--sys.log( "UI.HangarWnd:DestroyShipEntInSlot(): Remove shipId %d in slot %d", shipEntId, slotIdx )
    		ship:Remove()
    	else
    		sys.log( "UI.HangarWnd:DestroyShipEntInSlot()[ERROR]: ship %d in slot %d not found", shipEntId, slotIdx )
    	end

	end

	self.shipEntIds[ slotIdx ] = -1

	if shipEntId == self.selShipEntId then
		self:SetSelShipEnt( -1 )
	end

end


--
function UI.HangarWnd:UpdateCameraForSelSlot()

	local selSlotIdx = self:GetSelShipSlot()

	if selSlotIdx ~= -1 then

		local bSlotBought = true

		if self:IsShipInSlotFromBattleSlot( selSlotIdx ) then
			local data = UI.Hangar_BattleListWnd:GetRecordData( selSlotIdx )
			bSlotBought = data.bSlotBought
		end

		if bSlotBought then
			_G.Hangar:SetCameraSlot( selSlotIdx, self.shipEntIds[ selSlotIdx ] or -1, self.bCameraTransitionLocked )
		end

	end

end


--
function UI.HangarWnd:UpdateShipEntPos( shipEnt, slot )

	if not shipEnt then
		sys.log( "UI.HangarWnd:UpdateShipEntPos()[ERROR]: nil shipEnt" )
		return
	end

	local spawnSpotId = self.spawnSpotEntIds[ slot ]
	local spawnSpotEnt = spawnSpotId ~= -1 and _G.Entities[ spawnSpotId ]

	if spawnSpotEnt then
		
		local shipPos = UI:ZeroVec3()
		local modelOffset = _G.GetShipHangarOffset( shipEnt )
	
		if modelOffset then
			shipPos = modelOffset
		else

			local preset = _G.Hangar:GetCameraPresetForShip( shipEnt )
			if preset.shipPos then
				shipPos = preset.shipPos
			end
		end

		shipEnt:SetPos( UI:Vec3Add( UI:Vec3( _G.GetEntityPos3( spawnSpotEnt ) ), shipPos ) )

	end	

end


--
function UI.HangarWnd:ChangeShipInBattleSlot( slotIdx, vid, bSwapShips )

	if bSwapShips == nil then
		bSwapShips = false
	end

	if self.lastRequestId_ChangeBattleSlotVessel ~= 0 or self.swapBattleSlotVesselsRequstId ~= 0 then
		sys.log( "UI.HangarWnd:ChangeShipInBattleSlot()[ERROR]: previous request is still unanswered" )
	end

	if vid ~= UI.INVALID_U64_ID and UI:IsShipOnShipQuestByVid( vid ) then
		sys.log( "UI.HangarWnd:ChangeShipInBattleSlot()[ERROR]: ship is on quest" )
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
    	end

    	local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )
    	local data2 = UI.Hangar_BattleListWnd:GetRecordData( slot2Idx )

    	data.bWait = true
    	data2.bWait = true

    	local battleSlotWnd = UI.Hangar_BattleListWnd:GetButtonForRecord( slotIdx )
    	if battleSlotWnd then
    		battleSlotWnd:FullUpdate()
    	end

    	local battleSlot2Wnd = UI.Hangar_BattleListWnd:GetButtonForRecord( slot2Idx )
    	if battleSlot2Wnd then
    		battleSlot2Wnd:FullUpdate()
    	end

    	self:UpdateBattleSlotMouseOverState( slotIdx )
    	self:UpdateBattleSlotMouseOverState( slot2Idx )

	else

    	self.lastRequestId_ChangeBattleSlotVessel = _G.GameStore_ChangeBattleSlotVessel( slotIdx - 1, vid )

    	if self.lastRequestId_ChangeBattleSlotVessel == 0 then
    		UI:ShowMsgOnChangeBatleSlotVesselError( _G.GameStore.ChangeBSResult.CBSR_ERROR )
    		return false
    	end

    	local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )

    	data.bWait = true

    	local battleSlotWnd = UI.Hangar_BattleListWnd:GetButtonForRecord( slotIdx )
    	if battleSlotWnd then
    		battleSlotWnd:FullUpdate()
    	end

    	self:UpdateBattleSlotMouseOverState( slotIdx )

	end

	UI:PlayGlobalSound( UI.HangarWnd.sounds.changeBattleShip )	
	return true

end


--
function UI.HangarWnd:F_OnAfterHideFromScreen()

--	sys.log( "UI.HangarWnd:F_OnAfterHideFromScreen()" )
	
	if not UI:IsInRemovingAllWindows() then

		UI.FullScreenWnd.F_OnAfterHideFromScreen( self )

		UI.Gold2CreditsWnd:UnlinkFromParent()	
		UI.Yup2GoldWnd:UnlinkFromParent()
		UI.GoldArcWnd:UnlinkFromParent()
		UI.MenuWnd:UnlinkFromParent()
		UI.Hangar_PrepareWnd:UnlinkFromParent()
		UI.Hangar_WaitingWnd:UnlinkFromParent()
		UI.Hangar_BuyWnd:UnlinkFromParent()
		UI.Hangar_TradeWnd:UnlinkFromParent()
		UI.MailCreateWnd:UnlinkFromParent()
		self:HideMail( false )
		UI.SynergyTransferWnd:UnlinkFromParent()
		UI.PlayerProgressWnd:UnlinkFromParent()
		UI.ItemCraftSingleWnd:UnlinkFromParent()

		self:ResetNotifcationControls()
		self:SetPrepareState( self.prepareStates.NONE )

		UI.Hangar_BuyWithInventoryWnd:UnlinkFromParent()
    	self.itemToBuy = nil

	else
		self:OnAfterHideFromScreen()
	end

	if not UI:IsInShutdown() then
		self:DestroyShipEnts()
	end

	self:ResetSpawnSpots()

	self.hMsgTimeOut				= UI.INVALID_UI_HANDLE
	self.hMsgRejoinGame				= UI.INVALID_UI_HANDLE
	self.hMsgAcceptClanInvite		= UI.INVALID_UI_HANDLE
	self.hMsgReadyCheck				= UI.INVALID_UI_HANDLE
	self.hMsgMatchMakingDisabled	= UI.INVALID_UI_HANDLE
	self.hMsgFreeSpaceDisabled		= UI.INVALID_UI_HANDLE
	self.hMsgCancelSquadInvites		= UI.INVALID_UI_HANDLE
	self.hMsgGoldRefill				= UI.INVALID_UI_HANDLE
	self.hMsgRandomBfs				= UI.INVALID_UI_HANDLE
	self.hMsgPremiumExpired			= UI.INVALID_UI_HANDLE
	self.universeTypeToStartRandom	= nil
	self.freeSpaceUndockTimer 		= nil

	self.hMsgAcceptSquadInvite = UI.INVALID_UI_HANDLE
	self:ResetSquadFinderGroupDescLink()

	cvars.pe_fishEye = UI.pe_fishEye_saved
	cvars.cl_inHangar = false

	self:StopRotatingCamera()

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		UI:UnsubscribeUiObjFromEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )
	end

	self.shipItemForMaintenance = nil

end


--
function UI.HangarWnd:GetLayerForEffect( effect )

	for layerIdx = 0, self:GetNumLayers() - 1 do

		local layer = self:GetLayer( -1, layerIdx, 0 )
		if layer:GetLayerType() == UI.LAYER_EFFECT then

			local pool = layer:GetEffectsPool()
			if pool:GetNumEffects() > 0 and pool:GetEffectById( 0 ) == effect then
				return layerIdx
			end

		end

	end

	return -1

end


--
function UI.HangarWnd:CheckInvite( onlySquadInvite )

	local invite = UI.Squad:GetInvite()
	if invite then

		if UI:IsMsgBoxOnScreen() or UI:IsMenuWindowsOnScreen() then
			return
		end

		local playerColor = UI.ChatWnd:GetColorByColorType( UI.Chat.colorIds.SYSTEM )
		local nicknameStr = UI:Color2Str( playerColor )..tostring( invite.nickname ).."@ffffffff"

		self.hMsgAcceptSquadInvite = UI:MessageBox( UI:GetStringByName( "squad_invite_caption" ), "", UI.MBS_YES_NO )
		local msgBox = UI:GetUiObjByHandleT( self.hMsgAcceptSquadInvite )

		local msg = ""
		local baseColor = msgBox:GetColor( UI.MsgBox.layers.MSG )

		if invite.gid ~= nil and invite.gid ~= 0 then

			local desc = "unknown"

			local groupInfo = UI.SquadFinder:GetGroupInfoById( invite.gid )
			if groupInfo then

				desc = groupInfo.message		

				if desc == "" then

					desc = UI:GetStringByName( "squadFinder_groupDescEmpty" )

				else

    				desc = string.gsub( desc, "\n", " " )
					local descOriginal = desc

    				desc = UI:Substr( desc, 1, 50 )
					local bWasCut = desc ~= descOriginal

					desc = UI:ShieldSpecSymbolsForMetatext( desc )

					local bWasCut2 = false
    				desc, bWasCut2 = UI:GetCutTextWithEllipses( desc, msgBox:GetLayerWidth( UI.MsgBox.layers.MSG ) - 5, msgBox:GetFont( UI.MsgBox.layers.MSG ) )	-- -5 для ширины, т.к. реально ссылка с этим текстом займет немного больше места, т.к. место для нее в метатексте выделяется с помощью вставки невидимых символов

    				if bWasCut or bWasCut2 then

						if not bWasCut2 then
							desc = string.format( "%s%s", desc, UI:GetStringByName( "ellipses" ) )
						end

                		local strTooltip = UI:ShieldSpecSymbolsForMetatext( groupInfo.message )
                		strTooltip = string.gsub( strTooltip, "\n", "|" )

                		local linkParams =
                		{
                			text			= desc,
                			tooltipText		= strTooltip,
                			tooltipCaption	= UI:GetStringByName( "squadFinder_groupDescTooltipCaption" ),
                			colorSel		= baseColor,
                			colorUnsel		= baseColor,
                		}

                		local backColor = 0

                    	local layerObj = msgBox:GetLayer( UI.LAYER_TEXT, UI.MsgBox.layers.MSG, 0 )
                    	if layerObj then
                			backColor = layerObj:GetBackColor()
                    	end

						self:ResetSquadFinderGroupDescLink()
                		self.squadFinderGroupDescLinkWnd:Setup( UI.LinkWnd.linkTypes.CUSTOM_TEXT, linkParams, msgBox:GetFont( UI.MsgBox.layers.MSG ), msgBox:GetBlendMode( UI.MsgBox.layers.MSG ), backColor )
                		msgBox:AddChild( self.squadFinderGroupDescLinkWnd )

                		desc = string.format( "$wndk [hWnd %u][alignment BASELINE]$", self.squadFinderGroupDescLinkWnd:GetUiHandle() )

					end

				end

			else
				sys.log( "UI.HangarWnd:CheckInvite()[ERROR]: cannot find group info" )
			end		

			msg = UI:GetStringByName( "squad_invite_squadFinderGroup" )

			local tSubst =
			{
				player	= nicknameStr,
				desc	= desc,
			}

			local numSubst = 0
			msg, numSubst = string.gsub( msg, "%$(.-)%$", tSubst )

			-- TODO: даже если плэйсхолдер прописан не тот, все равно возвращает якобы правильное количество поодстановок
			if numSubst ~= 2 then
				sys.log( "UI.HangarWnd:CheckInvite()[ERROR]: invalid placeholders in string \"squad_invite_squadFinderGroup\"; \"$player$\" and \"$desc$\" expected" )
				msg = string.format( "Player %s invites you to squad (%s)", nicknameStr, desc )
			end

		else
			msg = string.format( UI:GetStringByName( "squad_invite" ), nicknameStr )
		end

		msg = string.format( "%s%s", UI:Color2Str( baseColor ), msg )

		msgBox:SetMsg( msg )	

		return

	end

	if onlySquadInvite then
		return
	end

	invite = UI.Clan:GetInvite()
	if invite then

		if UI:IsMsgBoxOnScreen() or UI:IsMenuWindowsOnScreen() then
			return
		end

		local color1 = UI.ChatWnd:GetColorByColorType( UI.Chat.colorIds.SYSTEM )
		local nicknameStr = UI:Color2Str( color1 )..tostring( invite.nickname ).."@ffffffff"
		local color2 = UI.ChatWnd:GetColorByColorType( UI.Chat.colorIds.GUILD )
		local clanNameStr = UI:Color2Str( color2 )..tostring( invite.clanname ).."@ffffffff"
		self.hMsgAcceptClanInvite = UI:MessageBox( UI:GetStringByName( "clans_invite_caption" ), string.format( UI:GetStringByName( "clans_invite" ), nicknameStr, clanNameStr ), UI.MBS_YES_NO )
		return
	end

	if UI.Arena and UI.Arena:CheckShowInviteToMeMsg() then
		return
	end

end


--
function UI.HangarWnd:ResetSquadFinderGroupDescLink()

	self.squadFinderGroupDescLinkWnd:Reset()
	self.squadFinderGroupDescLinkWnd:UnlinkFromParent()

end


--
function UI.HangarWnd:ReadyCheckUpdate()

	if self.hMsgReadyCheck == UI.INVALID_UI_HANDLE then

		if UI.Squad:IsInSquad() and not UI.Squad:IsLeader() then
			local bool, readyCheckType = UI.Squad:IsReadyCheckRequestExist()
			if bool then
				local gameplayStr = "unknown"
				if readyCheckType ~= -1 then
					gameplayStr = UI:GetStringByName( "squad_ready_check_type_"..UI:Val2Key( UI.GameplayWnd.squadInviteType, readyCheckType ) )
				end
				local inviteText = UI:GetStringByName( "squad_ready_check" )
				inviteText = string.gsub( inviteText, "%$gameplay_type%$", gameplayStr )
				self.hMsgReadyCheck = UI:MessageBox( UI:GetStringByName( "squad_ready_check_caption" ), inviteText, UI.MBS_YES_NO )
			end
		end

	end

end

--[[ SC-111371 -- пока активен баттлпасс, то вместо окна ежедневной награды показывается окно баттлпасса
function UI.HangarWnd:CheckDailyReward()

	if UI.Profile:IsNeedShowDailyLoginRewardWnd() then
		if not UI.Tutorial:IsActive() then
			if not UI.HangarWnd:IsSuitableForStartupWindows() then
				UI.Profile:ResetNeedShowDailyLoginRewardWnd()
			else
				if not UI.MarketingWnd:IsOnScreen() and not UI.ShopWnd:IsOnScreen() then
					local firstMsgBox = UI:GetFirstMsgBox()
					if not firstMsgBox then
						UI.DailyRewardWnd:Show()
					end
				end
			end
		end
	end
	
end
]]


--
function UI.HangarWnd:CheckShowBattlePassOnStart()
	
	if self.bNeedCheckShowBattlePass then
		if not _G.MasterServer_BattlePassIsActive() then
			self.bNeedCheckShowBattlePass = false
		end
	end
	
	-- калька ллогики с CheckDailyReward
	if self.bNeedCheckShowBattlePass then
		if not UI.Tutorial:IsActive() then
			if not UI.HangarWnd:IsSuitableForStartupWindows() then
				self.bNeedCheckShowBattlePass = false
			else
				if not UI.MarketingWnd:IsOnScreen() and not UI.ShopWnd:IsOnScreen() then
					local firstMsgBox = UI:GetFirstMsgBox()
					if not firstMsgBox then
						UI.HangarWnd:ShowBattlePass( false, nil, nil )
						self.bNeedCheckShowBattlePass = false
					end
				end
			end
		end
	end

end


--
function UI.HangarWnd:CheckSaleAdvert()

	if UI.SaleAdvert:IsLoaded() and not UI.SaleAdvert:IsAlreadyShow() and UI.SaleAdvert:GetNumData() > 0 then
		if UI.HangarWnd:IsSuitableForStartupWindows() then
			local firstMsgBox = UI:GetFirstMsgBox()
			if not firstMsgBox then
				if not UI.Tutorial:IsActive() then
					if not UI.DailyRewardWnd:IsOnScreen() and not UI.BattlePassWnd:IsOnScreen() and not UI.MarketingWnd:IsOnScreen() then
						self:ShowActions( true )
					end
				end
			end
		end
	end

end


-- force move ship to their current position for fix issue with applying RenderEntity's global illumination
function UI.HangarWnd:ForceUpdateShipsPosition()

	for idx, shipEntId in pairs( self.shipEntIds ) do
		if shipEntId ~= -1 then
			local ship = Entities[ shipEntId ]

			if ship then
				ship:SetPos( ship:GetPos() );
			end
		end
	end

end


--
function UI.HangarWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if self.bLockNewFrameUpdate then
		return
	end

	self:CheckResetSquadReadyCheckPrepareState()
	self:UpdateRequestServerInfoTimer( dt_sys )
	self:UpdateVoteRequestTimer( dt_sys )
	self:UpdateTime()
	self:UpdateMatchmakingTime()
	self:ReadyCheckUpdate()
	self:CheckInvite()
	--self:CheckDailyReward()
	self:CheckShowBattlePassOnStart()
	self:CheckSaleAdvert()
	self:ForceUpdateShipsPosition()

	if self.prepareState ~= self.prepareStates.MATCHMAKING and UI.Lobby:IsInLobby() then
		UI.HangarWnd:SetPrepareState( self.prepareStates.MATCHMAKING )
	end

	self:UpdateExpiredMsgTimer( dt_sys )
	
	if self.freeSpaceUndockTimer ~= nil then
		self.freeSpaceUndockTimer = self.freeSpaceUndockTimer - dt_sys
		if self.freeSpaceUndockTimer < 0 then
			self:SetPrepareState( self.prepareStates.NONE )
			if self:IsOnScreen() then
				UI:ShowMsgOnUndockError( _G.MasterServer.ZoneInstanceTravelResult.ZITR_TIMEOUT )
			end
			self.freeSpaceUndockTimer = nil
		end
	end
	
end


--
function UI.HangarWnd:ShowMessageOnTimeOut()

	if self.hMsgTimeOut ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgTimeOut = UI:ShowMessageOnTimeOut()

end


--
function UI.HangarWnd:UpdateBattleSlotMouseOverState( recordIdx )

	local data = UI.Hangar_BattleListWnd:GetRecordData( recordIdx )

    local btn = UI.Hangar_BattleListWnd:GetButtonForRecord( recordIdx )
	if btn then
		btn:UpdateMouseOverLockState( data )
	end

end


--
function UI.HangarWnd:F_OnEventMsgBoxRet( hSender, retCode, boxHandle )

	-- может быть отправлен из HUD, когда окна ангара нет на экране
	if boxHandle == self.hMsgAcceptSquadInvite then
		self.hMsgAcceptSquadInvite = UI.INVALID_UI_HANDLE
		if retCode == UI.MBRET_YES then
			UI:PlayGlobalSound( UI.HangarWnd.sounds.btnClick )
			UI.Squad:AcceptCurInvite()
		else
			UI.Squad:RejectCurInvite()
		end	
	end

	if not self:IsOnScreen() then
		return
	end

	if boxHandle == self.hMsgTimeOut then
		self.hMsgTimeOut = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgRejoinGame then
		self.hMsgRejoinGame = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			_G.MasterServer_RejoinGame( true )
			UI:PlayGlobalSound( UI.sounds.msgBoxClose )
		else
			_G.MasterServer_RejoinGame( false )
		end			

	elseif boxHandle == self.hMsgMatchMakingDisabled then
		self.hMsgMatchMakingDisabled = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgFreeSpaceDisabled then
		self.hMsgFreeSpaceDisabled = UI.INVALID_UI_HANDLE

	elseif boxHandle == self.hMsgAcceptClanInvite then
		self.hMsgAcceptClanInvite = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			UI:PlayGlobalSound( UI.HangarWnd.sounds.btnClick )
			UI.Clan:AcceptCurInvite()
		else
			UI.Clan:RejectCurInvite()
		end
	elseif boxHandle == self.hMsgReadyCheck then
		self.hMsgReadyCheck = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			UI.Squad:ReadyCheckAccept()
		else
			UI.Squad:ReadyCheckReject()
		end	

	elseif boxHandle == self.hMsgCancelSquadInvites then

		self.hMsgCancelSquadInvites = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then

			UI:PlayGlobalSound( UI.HangarWnd.sounds.btnClick )

			self.cancelSquadInvitesRequestId = _G.MasterServer_SquadInviteCancel( UI.INVALID_U64_ID )

			if self.cancelSquadInvitesRequestId ~= 0 then

        		if self.prepareState == self.prepareStates.CANCEL_SQUAD_INVITES_REQUEST then
        			self:SetPrepareState( self.prepareStates.CANCEL_SQUAD_INVITES_WAIT )
				end

			else

				self:ShowMsgOnCancelSquadInvitesError( _G.MasterServer.SquadOpResult.SOR_ERROR )

        		if self.prepareState == self.prepareStates.CANCEL_SQUAD_INVITES_REQUEST then
        			self:SetPrepareState( self.prepareStates.NONE )
        		end

			end

		else

    		if self.prepareState == self.prepareStates.CANCEL_SQUAD_INVITES_REQUEST then
    			self:SetPrepareState( self.prepareStates.NONE )
    		end

		end

	elseif boxHandle == self.hMsgGoldRefill then

		self.hMsgGoldRefill = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
			UI:PlayGlobalSound( UI.HangarWnd.sounds.btnClick )
			self:DoRefillAndRepairByRequest( self.shipItemForMaintenance )
		end

		self.shipItemForMaintenance = nil

	elseif boxHandle == self.hMsgRandomBfs then

		self.hMsgRandomBfs = UI.INVALID_UI_HANDLE

		if retCode == UI.MBRET_YES then
		
			local bCanStartRandomBfs = false
			local shipsMinRank = -1
			local shipsMaxRank = -1
			
			if self.universeTypeToStartRandom ~= nil then
				bCanStartRandomBfs, shipsMinRank, shipsMaxRank = UI:CanStartBfsInRandomZone( self.universeTypeToStartRandom )
			else
				sys.log( "UI.HangarWnd:F_OnEventMsgBoxRet()[ERROR]: no 'universeTypeToStartRandom' saved" )
			end
			
			if bCanStartRandomBfs then

    			UI:PlayGlobalSound( UI.HangarWnd.sounds.btnClick )

    			UI.GameplayWnd:SetGameplay( { mmParams = { universe = true, rankMin = shipsMinRank, rankMax = shipsMaxRank, universeType = self.universeTypeToStartRandom } } )
    			UI.GameplayWnd:StartMatchMaking()

			else			

    			local strError = UI:Val2Key( _G.MasterServer.MMJoinResult, _G.MasterServer.MMJoinResult.MMJR_ERROR )
    			local strErrorLocalized = UI:GetStringByName( string.format( "mmError_%s", strError ) )

    			local msg = UI:GetStringByName( "msg_mmError" )
    			msg = string.format( msg, strErrorLocalized )

    			UI:MessageBox( UI:GetStringByName( "msgCapt_error" ), msg, UI.MBS_OK )

			end

		end
		
		self.universeTypeToStartRandom = nil
		
	elseif boxHandle == self.hMsgPremiumExpired then
	
		self.hMsgPremiumExpired = UI.INVALID_UI_HANDLE
		
		if retCode == UI.MBRET_YES then
			UI.HangarWnd:ShowLicenses( true )
		end

	end

end


--
function UI.HangarWnd:ShowUnavailableInDemoMsgBox()

	UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_unavailableInDemo" ), UI.MBS_OK )

end


--
function UI.HangarWnd:F_OnAfterShowOnScreen()

	UI.pe_fishEye_saved = cvars.pe_fishEye
	cvars.pe_fishEye = 0	-- #0019369, комм.(0049844)

	self:InitSpawnSpots()

	_G.Hangar:InitCamera()
	_G.Hangar:SetCameraSlot( 1, self.shipEntIds[ 1 ] or -1, true )

	cvars.cl_inHangar = true	

	if not UI.bSavingGameState and _G.MasterServer_IsConnected() then

		-- является ли первым ангаром для игрока
		self.bFirstHangarForPalyer = false

		if not UI:IsTrueEx( UI.serverData.userData.hangarShown ) then

			-- в старых аккаунтах не было переменной hangarShown, но ангар там показывался; поэтому попытка определить, что это "старый" аккаунт
			local bOldAccount = not _G.MasterServer_GetEarlyPlayerStatus()

			if not bOldAccount then
				self.bFirstHangarForPalyer = true
			end

			UI.serverData.userData.hangarShown = 1
			UI:SaveServerUserData()

		end

		-- является ли первым ангаром в данной сессии логина
		self.bFirstHangarForLoginSession = false

		if not self.bShownInLoginSession then
			self.bFirstHangarForLoginSession = true
			self.bShownInLoginSession = true
		end

	end

	if self.freeSpace_Matchmaking then
		self:SetPrepareState( self.prepareStates.NONE )
		self.freeSpace_Matchmaking = false
	end

	-- исправление #0043442 - до апдпейта дочерних окон не должны оставаться старые данные в ангаре
	self:Reset()

	if self.owDebriefingData then
		self:ShowDebriefingOW( self.owDebriefingData )
		self.owDebriefingData = nil
	end

	-- #0053013,комм.(0220199) - не переносить показ дебрифинга после UI.FullScreenWnd.F_OnAfterShowOnScreen( self )!
	-- Там вызывается FullUpdate, и в нем спаун кораблей.
	-- При спауне корабля вызывается подгрузка моделей, и, как результат, ui::UpdateWhileLoadingScreen(),
	-- и полный апдейт интерфейса, в том числе отрисовка.
	-- Из-за этого между показом ангара и показом дебрифинга будет пауза

	if self.debriefingData then
		self:ShowDebriefing( self.debriefingData )
		self.debriefingData = nil
	end
	
	UI.GameplayPveMapWnd:UpdateFreespaceQuests()
	UI.GameplayPveMapWnd:UpdateFreespaceAdventures()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	if self.bShopNeedReload then
		self:ReloadShop()
	end

	if UI.Lobby:IsInLobby() then
		self:TrySetMenuTab( self.menuTabs.CUSTOM_GAME, false, true )
	end
		
	if self.bShowMapAfterFreeSpace then
		self:TrySetMenuTab( self.menuTabs.FREE_SPACE_MAP, false, true )
		self.bShowMapAfterFreeSpace = false
	end

	UI:SubscribeUiObjOnEvent( self:GetUiHandle(), UI.EV_MOUSE_BUTTON_DOWN )	

	UI.Hangar_ProfileBtn:RequestAvatarIfNeed()
	UI.Hangar_ClanBtn:RequestClanNameIfNeed()

	self:CheckShowUndockError()
	
	-- запрос цен на юплей покупки (премиум-лицензии в том числе)
	UI:RequestYupPurchasesPrices( false )

end


--
function UI.HangarWnd:StopRotatingCamera()

	if not self.bRotatingCamera then
		return
	end

	self.bRotatingCamera = false

	if UI:GetMouseCapture() == self:GetUiHandle() then
		UI:CaptureMouse( UI.INVALID_UI_HANDLE )
	end

	sys.concmd( "showCursor" )

	sys.concmd( string.format( "setMousePos %d %d", self.savedMousePos.x, self.savedMousePos.y ) )

end


--
function UI.HangarWnd:StartRotatingCamera()

	if self.bRotatingCamera then
		return
	end

	self.bRotatingCamera = true

	self.savedMousePos.x, self.savedMousePos.y = UI:XToAbs( UI:GetMouseX() ), UI:YToAbs( UI:GetMouseY() )

	UI:CaptureMouse( self:GetUiHandle() )

	sys.concmd( "hideCursor" )

end


--
function UI.HangarWnd:UpdateRequestServerInfoTimer( dt )

	if self.serverInfoRequestTimer ~= -1 then
		self.serverInfoRequestTimer = self.serverInfoRequestTimer - dt
		if self.serverInfoRequestTimer <= 0 then
	        self:RequestBlock_ServerInfo( false )
		end
	end

end

--
function UI.HangarWnd:UpdateVoteRequestTimer( dt )

	self.lastVoteRequestTime = self.lastVoteRequestTime - dt
	if self.lastVoteRequestTime <= 0 then
		self.lastVoteRequestTime = self.VOTE_INFO_REQUEST_DELAY
        UI.Vote:Request()
	end

end


--
function UI.HangarWnd:F_OnAfterAddChild( child )

	self:OnAfterAddChild( child )

	if UI.GameplayWnd and child == UI.GameplayWnd then

		if UI.Lobby:IsInLobby() then
			self:UpdateStartBtnState()
		end

	elseif UI.HangarClientStatsWnd and child == UI.HangarClientStatsWnd then
 		self:UpdateTimePos()
		
	elseif UI.GameplayPveMapWnd and child == UI.GameplayPveMapWnd then
		self:UpdateStartBtnState()
	end

	self:UpdateZOrder()
	
	if UI.ChatWnd and UI.ChatWnd.w and UI.ChatWnd:IsChildOf( self ) and not self:CanChatStartInput() then
		UI.Chat:StopInput()
	end
	UI:ValidateKeyboardFocus()


end


--
function UI.HangarWnd:UpdateZOrder()

	if UI.EquipmentWnd and UI.EquipmentWnd.w and UI.EquipmentWnd:IsChildOf( self ) then

		self:MoveChildToLastPosition( UI.EquipmentWnd )
		
		if UI.Hangar_QuestsWnd and UI.Hangar_QuestsWnd.w and UI.Hangar_QuestsWnd:IsChildOf( self ) then
			self:MoveChildToLastPosition( UI.Hangar_QuestsWnd )
		end

		if UI.NotificationsListWnd and UI.NotificationsListWnd.w and UI.NotificationsListWnd:IsChildOf( self ) then
			self:MoveChildToLastPosition( UI.NotificationsListWnd )
		end

		if UI.Hangar_BattleListWnd and UI.Hangar_BattleListWnd.w and UI.Hangar_BattleListWnd:IsChildOf( self ) then
			self:MoveChildToLastPosition( UI.Hangar_BattleListWnd )
		end

	end

	-- эти окна ниже чата

	if UI.ShopWnd and UI.ShopWnd.w and UI.ShopWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ShopWnd )

	elseif UI.TalentsWnd and UI.TalentsWnd.w and UI.TalentsWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.TalentsWnd )

		if self:IsOnScreen() then
			self:UpdateTalentsMenuBtnBlink()
		end

	elseif UI.LeaderboardWnd and UI.LeaderboardWnd.w and UI.LeaderboardWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.LeaderboardWnd )

	elseif UI.ClansMainWnd and UI.ClansMainWnd.w and UI.ClansMainWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ClansMainWnd )

	elseif UI.Profile_Wnd and UI.Profile_Wnd.w and UI.Profile_Wnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Profile_Wnd )

	elseif UI.GameplayWnd and UI.GameplayWnd.w and UI.GameplayWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.GameplayWnd )

	elseif UI.HelpListWnd and UI.HelpListWnd.w and UI.HelpListWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.HelpListWnd )

	elseif UI.ItemCraftMultiWnd and UI.ItemCraftMultiWnd.w and UI.ItemCraftMultiWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ItemCraftMultiWnd )
		
	elseif UI.GameplayPveMapWnd and UI.GameplayPveMapWnd.w and UI.GameplayPveMapWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.GameplayPveMapWnd )
	end

	if UI.ShipsTreeWnd and UI.ShipsTreeWnd.w and UI.ShipsTreeWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ShipsTreeWnd )

	elseif UI.ShipWnd and UI.ShipWnd.w and UI.ShipWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ShipWnd )

	elseif UI.MarketingWnd and UI.MarketingWnd.w and UI.MarketingWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.MarketingWnd )

	elseif UI.ProfileWnd_new and UI.ProfileWnd_new.w and UI.ProfileWnd_new:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ProfileWnd_new )
	
	elseif UI.BattlePassWnd and UI.BattlePassWnd.w and UI.BattlePassWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.BattlePassWnd )
	end

	
	
	-- чат
	if UI.ChatWnd and UI.ChatWnd.w and UI.ChatWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.ChatWnd )
	end


	-- эти окна выше чата
	
	if UI.Hangar_TopPanelWnd and UI.Hangar_TopPanelWnd.w and UI.Hangar_TopPanelWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Hangar_TopPanelWnd )
	end

	if UI.SquadWnd and UI.SquadWnd.w and UI.SquadWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.SquadWnd )
	end

	if UI.FriendsListWnd and UI.FriendsListWnd.w and UI.FriendsListWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.FriendsListWnd )
		if self:IsOnScreen() then
			UI.Hangar_FriendListBtn:UpdateAnim()
		end
	end

	if UI.SquadFinder_GroupsWnd and UI.SquadFinder_GroupsWnd.w and UI.SquadFinder_GroupsWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.SquadFinder_GroupsWnd )
	end

	if UI.SquadFinder_MyGroupWnd and UI.SquadFinder_MyGroupWnd.w and UI.SquadFinder_MyGroupWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.SquadFinder_MyGroupWnd )
	end

	if UI.SquadFinder_CreateMyGroupWnd and UI.SquadFinder_CreateMyGroupWnd.w and UI.SquadFinder_CreateMyGroupWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.SquadFinder_CreateMyGroupWnd )
	end

	if UI.Vote_Wnd and UI.Vote_Wnd.w and UI.Vote_Wnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Vote_Wnd )
		if self:IsOnScreen() then
			UI.Hangar_VoteBtn:UpdateAnim()
		end
	end

	if UI.MailWnd and UI.MailWnd.w and UI.MailWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.MailWnd )

    	if self:IsOnScreen() then
			self:UpdateMailBtnState()
		end
	end

	if UI.NotificationsListWnd and UI.NotificationsListWnd.w and UI.NotificationsListWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.NotificationsListWnd )
	end

	if UI.MatchMakingContainerWnd and UI.MatchMakingContainerWnd.w and UI.MatchMakingContainerWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.MatchMakingContainerWnd )
	end

	if UI.NotificationsPopUpsWnd and UI.NotificationsPopUpsWnd.w and UI.NotificationsPopUpsWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.NotificationsPopUpsWnd )
	end

	if UI.Hangar_WaitingWnd and UI.Hangar_WaitingWnd.w and UI.Hangar_WaitingWnd:IsChildOf( self ) then
		self:MoveChildToLastPosition( UI.Hangar_WaitingWnd )
	end

end


--
function UI.HangarWnd:F_OnAfterRemoveChild( child )

	self:OnAfterRemoveChild( child )

	if not UI:IsInRemovingAllWindows() and not UI:IsInShutdown() then

    	if UI.MatchMakingContainerWnd and child == UI.MatchMakingContainerWnd then

			if not UI.MatchMakingWnd:IsActive() and self.prepareState == self.prepareStates.MATCHMAKING then
				self:SetPrepareState( self.prepareStates.NONE )
			end

			self:UpdateStartBtnState()

		elseif UI.GameplayWnd and child == UI.GameplayWnd then

			if UI.Lobby:IsInLobby() then
				self:UpdateStartBtnState()
			end

    	elseif UI.TalentsWnd and child == UI.TalentsWnd then		

    		if self:IsOnScreen() then
    			self:UpdateTalentsMenuBtnBlink()
    		end

    	elseif UI.MailWnd and child == UI.MailWnd then		
    		if self:IsOnScreen() then
				self:UpdateMailBtnState()
			end

		elseif UI.FriendsListWnd and child == UI.FriendsListWnd then
			if self:IsOnScreen() then
				UI.Hangar_FriendListBtn:UpdateAnim()
			end

		elseif UI.Vote_Wnd and child == UI.Vote_Wnd then
			if self:IsOnScreen() then
				UI.Hangar_VoteBtn:UpdateAnim()
			end
			
		elseif UI.GameplayPveMapWnd and child == UI.GameplayPveMapWnd then
			if self:IsOnScreen() then
				self:UpdateStartBtnState()
			end
    	end

	end

	if child == UI.HangarClientStatsWnd then
		self:UpdateTimePos()
	end

end


--
function UI.HangarWnd:F_OnEventSaveUiState()

	-- #0083425
	UI.store.HangarWnd =
	{
		owDebriefingData			= self.owDebriefingData,
		debriefingData				= self.debriefingData,
		gameplay					= self.gameplay,
		bShowMapAfterFreeSpace		= self.bShowMapAfterFreeSpace,
		bNeedCheckShowBattlePass	= self.bNeedCheckShowBattlePass,
		upgradeItemRequestId		= self.upgradeItemRequestId,
	}

	if not self:IsOnScreen() then
		return
	end

	UI.Hangar_TradeWnd:UnlinkFromParent()
	UI.Hangar_BuyWnd:UnlinkFromParent()

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
		UI.BuyBundleWnd:UnlinkFromParent()
	end

	UI.Hangar_BuyWithInventoryWnd:UnlinkFromParent()
	self.itemToBuy = nil

	-- tODO: если окно не на экране, то эти данные теряются; проверить что здесь хранится и сохранять нужное независимо от того, на экране или нет;
	-- ошибка уже проявилась для дебрифинга - #0083425; временное решение - исправить только дебрифинг, остальное пока не трогать, чтобы не сломать что-нибудь
	UI.store.HangarWnd.onScreenData =
	{
		menuTab						= self.menuTab,
		prepareState				= self.prepareState,
		prepareBattleSlot			= self.prepareBattleSlot,
		prepareGameParams			= self.prepareGameParams,
		prepareCheckReadyType		= self.prepareCheckReadyType,
		prepareEmm					= self.prepareEmm,
		bMatchmaking				= UI.MatchMakingContainerWnd:IsChildOf( self ),
		bPvpMatchmaking				= UI.PvpMatchmakingWnd:IsChildOf( self ),
		bPveMatchmaking				= UI.PveChoiceWnd:IsOnScreen() and UI.PveChoiceWnd:GetMode() == UI.PveChoiceWnd.modes.MATCHMAKING,
		bArenaMatchmaking			= UI.ArenaWnd:IsOnScreen() and UI.ArenaWnd:GetMode() == UI.ArenaWnd.modes.MATCHMAKING,
		bWaitingStore				= self.bWaitingStore,
		bShopNeedReload				= self.bShopNeedReload,		
		previewShipDefName			= self.previewShipDefName,
		previewShipLaunchData		= self.previewShipLaunchData,
		customShipVid				= self.customShipVid,		
		selShipSlotIdx				= self.selShipSlotIdx,
		bFirstHangarForPalyer		= self.bFirstHangarForPalyer,
		bShownInLoginSession		= self.bShownInLoginSession,
		bFirstHangarForLoginSession	= self.bFirstHangarForLoginSession,
		serverInfo 					= self.serverInfo,
		hasFreeSpaceAccess 			= self.hasFreeSpaceAccess,
		freeSpaceUndockTimer		= self.freeSpaceUndockTimer,
		freeSpaceRequestId 			= self.freeSpaceRequestId,
		cancelSquadInvitesRequestId	= self.cancelSquadInvitesRequestId,
		shipUpgradeRequestId		= self.shipUpgradeRequestId,
		emmChangeReadyRequestId		= self.emmChangeReadyRequestId,
	}

	if self.menuTab == self.menuTabs.SHIP_CRAFT then
		UI.store.HangarWnd.onScreenData.shipCraftLaunchData = { shipDefName = UI.ShipCraftWnd:GetShipDefName(), launchData = UI.ShipCraftWnd:GetLaunchData() }
	end

	if self.menuTab == self.menuTabs.SHIP_BUY then
		UI.store.HangarWnd.onScreenData.shipBuyLaunchData = { shipDefName = UI.ShipWnd:GetShipDefName(), launchData = UI.ShipWnd:GetLaunchData() }
	end

	if self.menuTab == self.menuTabs.STICKERS then
		UI.store.HangarWnd.onScreenData.stickersLaunchData = { prevMenuTab = UI.ShipCustomizationWnd:GetPrevHangarMenuTab() }
	end	

end


--
function UI.HangarWnd:F_OnEventRestoreUiState()

	if UI.store.HangarWnd == nil then
		return
	end

	-- #0083425
	self.owDebriefingData	= UI.store.HangarWnd.owDebriefingData
	self.debriefingData		= UI.store.HangarWnd.debriefingData
	
	self.gameplay				= UI.store.HangarWnd.gameplay
	self.bShowMapAfterFreeSpace	= UI.store.HangarWnd.bShowMapAfterFreeSpace
	
	self.bNeedCheckShowBattlePass	= UI.store.HangarWnd.bNeedCheckShowBattlePass
	
	self.upgradeItemRequestId = UI.store.HangarWnd.upgradeItemRequestId

	-- tODO: если окно не на экране, то эти данные теряются; проверить что здесь хранится и сохранять нужное независимо от того, на экране или нет;
	-- ошибка уже проявилась для дебрифинга - #0083425; временное решение - исправить только дебрифинг, остальное пока не трогать, чтобы не сломать что-нибудь
	if UI.store.HangarWnd.onScreenData then

		self.bWaitingStore					= UI.store.HangarWnd.onScreenData.bWaitingStore
		self.bShopNeedReload				= UI.store.HangarWnd.onScreenData.bShopNeedReload
		self.serverInfo 					= UI.store.HangarWnd.onScreenData.serverInfo
		self.bFirstHangarForPalyer			= UI.store.HangarWnd.onScreenData.bFirstHangarForPalyer
		self.bShownInLoginSession			= UI.store.HangarWnd.onScreenData.bShownInLoginSession
		self.bFirstHangarForLoginSession	= UI.store.HangarWnd.onScreenData.bFirstHangarForLoginSession
		self.hasFreeSpaceAccess 			= UI.store.HangarWnd.onScreenData.hasFreeSpaceAccess
		self.freeSpaceUndockTimer 			= UI.store.HangarWnd.onScreenData.freeSpaceUndockTimer
		self.freeSpaceRequestId				= UI.store.HangarWnd.onScreenData.freeSpaceRequestId
		self.cancelSquadInvitesRequestId	= UI.store.HangarWnd.onScreenData.cancelSquadInvitesRequestId
		self.emmChangeReadyRequestId		= UI.store.HangarWnd.onScreenData.emmChangeReadyRequestId

		self.shipUpgradeRequestId = UI.store.HangarWnd.onScreenData.shipUpgradeRequestId
		UI.ShipsTreeWnd:OnHangarWaitingShipUpgradeChanged()

		if self:IsOnScreen() then
		
			UI.Hangar_BattleListWnd:SelectRecord( UI.store.HangarWnd.onScreenData.selShipSlotIdx )

			if UI.store.HangarWnd.onScreenData.menuTab == self.menuTabs.SHIP_PREVIEW and UI.store.HangarWnd.onScreenData.previewShipDefName ~= "" then				

				self:ShowShipPreview( UI.store.HangarWnd.onScreenData.previewShipDefName )
				self.previewShipLaunchData = UI.store.HangarWnd.onScreenData.previewShipLaunchData

				self.customShipVid = UI.store.HangarWnd.onScreenData.customShipVid				

			elseif UI.store.HangarWnd.onScreenData.menuTab == self.menuTabs.EQUIPMENT_PREVIEW and UI.store.HangarWnd.onScreenData.previewShipDefName ~= "" then				

				local shipItem = UI:GetShipItemByDef( UI.store.HangarWnd.onScreenData.previewShipDefName, false )
				if shipItem then

    				self:ShowEquipmentPreview( shipItem.vid )
    				self.previewShipLaunchData = UI.store.HangarWnd.onScreenData.previewShipLaunchData

    				self.customShipVid = UI.store.HangarWnd.onScreenData.customShipVid

				else
					sys.log( "UI.HangarWnd:F_OnEventRestoreUiState()[ERROR]: cannot find ship item for equipment preview" )
				end

			elseif UI.store.HangarWnd.onScreenData.menuTab == self.menuTabs.SHIP_CRAFT then				

				self:ShowShipCraft( UI.store.HangarWnd.onScreenData.shipCraftLaunchData.shipDefName, UI.store.HangarWnd.onScreenData.shipCraftLaunchData.launchData )
				self.customShipVid = UI.store.HangarWnd.onScreenData.customShipVid				

			elseif UI.store.HangarWnd.onScreenData.menuTab == self.menuTabs.SHIP_BUY then				

				self:ShowShipBuyWnd( UI.store.HangarWnd.onScreenData.shipBuyLaunchData.shipDefName, UI.store.HangarWnd.onScreenData.shipBuyLaunchData.launchData, false )
				self.customShipVid = UI.store.HangarWnd.onScreenData.customShipVid

			elseif UI.store.HangarWnd.onScreenData.menuTab == self.menuTabs.STICKERS then

				if UI.store.HangarWnd.onScreenData.stickersLaunchData.prevMenuTab == self.menuTabs.EQUIPMENT_PREVIEW then

    				local shipItem = UI:GetShipItemByDef( UI.store.HangarWnd.onScreenData.previewShipDefName, false )
    				if shipItem then

        				self:ShowEquipmentPreview( shipItem.vid )
        				self.previewShipLaunchData = UI.store.HangarWnd.onScreenData.previewShipLaunchData

    				else
    					sys.log( "UI.HangarWnd:F_OnEventRestoreUiState()[ERROR]: cannot find ship item for equipment preview" )
    				end

				end

				self:TrySetMenuTab( UI.store.HangarWnd.onScreenData.menuTab, false, true )

				self.customShipVid = UI.store.HangarWnd.onScreenData.customShipVid

			else
			
				self:TrySetMenuTab( UI.store.HangarWnd.onScreenData.menuTab, false, true )

    			if self.customShipVid ~= UI.INVALID_U64_ID then					
    				self:SetCustomShip( self.customShipVid )
    			end				

			end
			
			self.prepareBattleSlot		= UI.store.HangarWnd.onScreenData.prepareBattleSlot
			self.prepareGameParams		= UI.store.HangarWnd.onScreenData.prepareGameParams
			self.prepareCheckReadyType	= UI.store.HangarWnd.onScreenData.prepareCheckReadyType
			self.prepareEmm				= UI.store.HangarWnd.onScreenData.prepareEmm

			self:SetPrepareState( UI.store.HangarWnd.onScreenData.prepareState )

			if UI.store.HangarWnd.onScreenData.bMatchmaking then
				self:AddChild( UI.MatchMakingContainerWnd )
			end

			if UI.store.HangarWnd.onScreenData.bPvpMatchmaking then
				UI.PvpMatchmakingWnd:Show()
			end

			if UI.store.HangarWnd.onScreenData.bPveMatchmaking then
				UI.PveChoiceWnd:Show()
			end

			if UI.store.HangarWnd.onScreenData.bArenaMatchmaking then
				UI.ArenaWnd:Show()
			end

			if self.bShopNeedReload then
				self:ReloadShop()
			end

		else
			self.menuTabToSet = UI.store.HangarWnd.onScreenData.menuTab
			self.prepareStateToSet = UI.store.HangarWnd.onScreenData.prepareState
			self.prepareBattleSlotToSet = UI.store.HangarWnd.onScreenData.prepareBattleSlot
			self.prepareGameParamsToSet = UI.store.HangarWnd.onScreenData.prepareGameParams
			self.prepareCheckReadyTypeToSet = UI.store.HangarWnd.onScreenData.prepareCheckReadyType
			self.prepareEmmToSet = UI.store.HangarWnd.onScreenData.prepareEmm
			self.bMatchmakingToShow = UI.store.HangarWnd.onScreenData.bMatchmaking
			self.bPvpMatchmakingToShow = UI.store.HangarWnd.onScreenData.bPvpMatchmaking
			self.bPveMatchmakingToShow = UI.store.HangarWnd.onScreenData.bPveMatchmaking
			self.bArenaMatchmakingToShow = UI.store.HangarWnd.onScreenData.bArenaMatchmakingToShow			
			self.selShipSlotToSelect = UI.store.HangarWnd.onScreenData.selShipSlotIdx
			self.shipCraftLaunchDataToSet = UI.store.HangarWnd.onScreenData.shipCraftLaunchData
			self.shipBuyLaunchDataToSet = UI.store.HangarWnd.onScreenData.shipBuyLaunchData
			self.stickersLaunchDataToSet = UI.store.HangarWnd.onScreenData.stickersLaunchData

			if UI.store.HangarWnd.onScreenData.previewShipDefName ~= "" then
            	self.previewShipToSet =
				{
					defName 		= UI.store.HangarWnd.onScreenData.previewShipDefName,
					restoreData		= UI.store.HangarWnd.onScreenData.previewShipLaunchData,
				}
			end

			self.customShipVidToSet = UI.store.HangarWnd.onScreenData.customShipVid

		end

	end

	UI.store.HangarWnd = nil

end


--
function UI.HangarWnd:ShowMsgOnRejoinGameError( result )

	UI:ShowErrorMsg( "msg_rejoinError", result, "_G.MasterServer.RejoinResult" )

end


--
function UI.HangarWnd:ShowMsgOnSellShipError( result )

	UI:ShowErrorMsg( "msg_sellShipError", result, "_G.GameStore.StoreBuyResult" )

end


--
function UI.HangarWnd:ShowRejoinGameMsg()

	if self.hMsgRejoinGame == UI.INVALID_UI_HANDLE then

		self.hMsgRejoinGame = UI:MessageBox( UI:GetStringByName( "msgCapt_actionConfirm" ), UI:GetStringByName( "msg_rejoinGame" ), UI.MBS_YES_NO )
		
		-- #0044596 - не нравится, что закрывается по эскейпу - можно по инерции нажать, пытаясь закрыть окно с рекламой
		local msgBox = UI:GetUiObjByHandleT( self.hMsgRejoinGame )
		if msgBox then
			msgBox:AllowOnEscape( false )
		end

	end

end


--
function UI.HangarWnd:F_OnEventPlayerDisconnected( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:SetPrepareState( self.prepareStates.NONE )

	if _G.MasterServer_IsInGame() then
		self:ShowRejoinGameMsg()		
	end

	local reason = iParam1
	UI:ShowMsgOnMpConnectionLost( reason, false )

end


-- нет самостоятеьной подписки, вызывается из uigamefuncs
function UI.HangarWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.ShipsTreeWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.MailWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.MailCreateWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ShopWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ShipCustomizationWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.SynergyTransferWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.EquipmentWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ShipCraftWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.PlayerProgressWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ItemCraftMultiWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ItemCraftSingleWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.Yup2GoldWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.GoldArcWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.TalentsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ClanShipWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.SquadWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.PvpMatchmakingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.DebriefingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.GameplayChoiceWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.PveChoiceWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.PveWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ArenaWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.MarketingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.QuestInfoWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.SquadFinder_GroupsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ShipWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.BuyBundleWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ProfileWnd_new:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.GameplayPveMapWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.Hangar_QuestsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.RankUpWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.TradingWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.Trading_AdvertsWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.Clans_HistoryWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.ClanWarWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.BattlePassWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.AutogenUpgradeWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.AutogenUnequipWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )
	UI.Hangar_UpgradeItemWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	UI.Hangar_ProfileBtn:ResetAvatar()
	UI.Hangar_ClanBtn:ResetEmblem()

	self.bFirstHangarForPalyer 						= true
	self.bFirstHangarForLoginSession				= true
	self.bShownInLoginSession						= false
	self.hasFreeSpaceAccess							= nil
	self.owDebriefingData							= nil
	self.debriefingData								= nil
	self.cancelSquadInvitesRequestId				= 0
	self.shipUpgradeRequestId						= 0
	self.emmChangeReadyRequestId					= 0
	self.bShowMapAfterFreeSpace						= false
	self.bNeedCheckShowBattlePass					= true
	self.upgradeItemRequestId						= 0

end


--
function UI.HangarWnd:OnEscape( key, controllerIdx )

	if self:IsInputBlocked() then
		return true
	end

	if UI.MatchMakingContainerWnd:IsOnScreen() then
		return true
	end

	if self.notificationsMode == self.notificationsModes.LIST then
		self:SetNotificationsMode( self.notificationsModes.POP_UPS )
		return true
	end

	if UI.MailWnd:IsChildOf( self ) then

		if UI.MailWnd:IsLetterOpen() then
			UI.MailWnd:HideLetter( true )
		else
			self:HideMail( true )
		end

		return true		
	end
	
	if UI.Vote_Wnd:IsChildOf( self ) then
		self:ToggleVoteWnd()
		return true
	end

	if UI.FriendsListWnd:IsChildOf( self ) then
		self:ToggleFriendsList()
		return true
	end

	if UI.SquadFinder_GroupsWnd:IsChildOf( self ) then
		self:HideSquadFinderGroupsWnd( true )
		return true
	end

	if UI.SquadFinder_MyGroupWnd:IsChildOf( self ) then
		self:HideSquadFinderMyGroupWnd( true )
		return true
	end

	if UI.SquadFinder_CreateMyGroupWnd:IsChildOf( self ) then
		self:HideSquadFinderCreateMyGroupWnd( true )
		return true
	end
	
	if UI.Hangar_QuestsWnd:IsChildOf( self ) and UI.Hangar_QuestsWnd:IsOpen() and self.menuTab == self.menuTabs.MAIN--[[SC-112654]] then
		UI.Hangar_QuestsWnd:Close()
		return true
	end

	if self.menuTab == self.menuTabs.STICKERS then

		local prevMenuTab = UI.ShipCustomizationWnd:GetPrevHangarMenuTab()

		if prevMenuTab ~= -1 then
			self:TrySetMenuTab( prevMenuTab, true, false )
			return true
		end

	elseif self.menuTab == self.menuTabs.SHIP_PREVIEW then

		self:ReturnFromPreview()
		return true

	elseif self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then

		self:ReturnFromPreview()
		return true

	elseif self.menuTab == self.menuTabs.SHIP_CRAFT then

		if UI.ShipCraftWnd:HandleEscape() then
			return true
		end

	elseif self.menuTab == self.menuTabs.SHIP_BUY then

		if UI.ShipWnd:HandleEscape() then
			return true
		end

	elseif self.menuTab == self.menuTabs.MAIN then

		if UI.EquipmentWnd:HandleEscape() then
			return true
		end

	elseif self.menuTab == self.menuTabs.ITEM_CRAFT then

		if UI.ItemCraftMultiWnd:HandleEscape() then
			return true
		end

	elseif self.menuTab == self.menuTabs.SHIPS then

		if UI.ShipsTreeWnd:HandleEscape() then
			return true
		end

	elseif self.menuTab == self.menuTabs.CLAN then

		if UI.ClanShipWnd:IsOnScreen() then
			if UI.ClanShipWnd:HandleEscape() then
				return true
			end
		end

	elseif self.menuTab == self.menuTabs.MARKETING then

		if UI.MarketingWnd:HandleEscape() then
			return true
		end

	elseif self.menuTab == self.menuTabs.FREE_SPACE_MAP then

		if UI.GameplayPveMapWnd:HandleEscape() then
			return true
		end
		
	elseif self.menuTab == self.menuTabs.PROFILE_NEW then

		if UI.ProfileWnd_new:OnEscape() then
			return true
		end
		
	elseif self.menuTab == self.menuTabs.LEADERBOARDS then

		if UI.LeaderboardWnd:OnEscape() then
			return true
		end
		
	elseif self.menuTab == self.menuTabs.BATTLE_PASS then

		if UI.BattlePassWnd:HandleEscape() then
			return true
		end

	end

	if UI.GameplayWnd:IsOnScreen() then
		if UI.GameplayWnd:OnEscape( key, controllerIdx ) then
			return true
		end
	end

	if self.menuTab ~= self.menuTabs.MAIN then
		self:TrySetMenuTab( self.menuTabs.MAIN, true, false )
		return true		
	end

	UI:ShowMainMenu()

	return true

end


--
function UI.HangarWnd:OnEnter( key, controllerIdx )

	local skip = false
	local hWnd = UI:GetKeyboardFocus()
	local wnd = UI:GetUiObjByHandleT( hWnd )
	if wnd and wnd.GetClassName then
		if wnd:GetClassName() == "EditWnd" then
			return false
		end
	end

	if self:IsInputBlocked() then
		return true
	end

	UI:CheckStartChatInput()

	return true

end


--
function UI.HangarWnd:DoRefillByRequest( selShipItem )

	if not selShipItem then
		sys.log( "UI.HangarWnd:DoRefillByRequest()[ERROR]: no ship selected" )
		return
	end

	if _G.GameStore_RefillMunition( selShipItem.vid ) == 0 then
		UI:ShowMsgOnRefillError( _G.GameStore.MunitionResult.MR_ERROR )
	end

end


--
function UI.HangarWnd:F_OnEventInvItemsChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateShipSlotsOnAmmoChanged()

end


--
function UI.HangarWnd:DoRepairByRequest( selShipItem )

	if not selShipItem then
		sys.log( "UI.HangarWnd:DoRepairByRequest()[ERROR]: no ship selected" )
		return
	end

	if _G.GameStore_RepairVessel( selShipItem.vid ) == 0 then
		UI:ShowMsgOnRepairError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.HangarWnd:TryRefillAndRepairByRequest( selShipItem )

	if not selShipItem then
		sys.log( "UI.HangarWnd:TryRefillAndRepairByRequest()[ERROR]: no ship selected" )
		return
	end

	local bCanContinue	= true

	local refillInfo	= UI:GetShipRefillInfo( selShipItem )
	local bNeedRefill	= refillInfo.bHasAvailable and not refillInfo.bFullAmmo

	if bNeedRefill then

		if refillInfo.gold > 0 then

			self.hMsgGoldRefill = UI:MessageBox( UI:GetStringByName( "maintenanceTooltip_caption" ), UI:GetStringByName( "goldMaintenanceConfirm" ), UI.MBS_YES_NO )

			self.shipItemForMaintenance = selShipItem
			bCanContinue = false

		end

	end

	if bCanContinue then
		self:DoRefillAndRepairByRequest( selShipItem )
	end

end


--
function UI.HangarWnd:DoRefillAndRepairByRequest( selShipItem )

	if not selShipItem then
		sys.log( "UI.HangarWnd:DoRefillAndRepairByRequest()[ERROR]: no ship selected" )
		return
	end

	local hp = _G.GameStore_GetVesselHullCondition( selShipItem.vid )
	local refillInfo = UI:GetShipRefillInfo( selShipItem )

	local bNeedRepair = hp < 1
	local bNeedRefill = refillInfo.bHasAvailable and not refillInfo.bFullAmmo

	if bNeedRepair then
    	if _G.GameStore_RepairVessel( selShipItem.vid ) == 0 then
    		UI:ShowMsgOnRepairError( _G.GameStore.StoreBuyResult.SBR_ERROR )
    	end
	end

	if bNeedRefill then
    	if _G.GameStore_RefillMunition( selShipItem.vid ) == 0 then
    		UI:ShowMsgOnRefillError( _G.GameStore.MunitionResult.MR_ERROR )
    	end
	end

end


--
function UI.HangarWnd:UpdateShipSlotsOnDamageChanged()

	for slotIdx = 1, UI.Hangar_BattleListWnd:GetNumVisibleSlots() do

		local slotWnd = UI.Hangar_BattleListWnd:GetButtonForSlot( slotIdx )
		if slotWnd then
			slotWnd:OnDamageChanged()
		end

	end

end


--
function UI.HangarWnd:UpdateShipSlotsOnShipDamageChanged( vid )

	for recordIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do

		local data = UI.Hangar_BattleListWnd:GetRecordData( recordIdx )
		if data.shipItem and data.shipItem.vid == vid then

			local slotWnd = UI.Hangar_BattleListWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnDamageChanged()
			end

			break

		end

	end

end


--
function UI.HangarWnd:UpdateShipSlotsOnAmmoChanged()

	for slotIdx = 1, UI.Hangar_BattleListWnd:GetNumVisibleSlots() do

		local slotWnd = UI.Hangar_BattleListWnd:GetButtonForSlot( slotIdx )
		if slotWnd then
			slotWnd:OnAmmoChanged()
		end

	end

end


--
function UI.HangarWnd:UpdateShipSlotsOnShipAmmoChanged( vid )

	for recordIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do

		local data = UI.Hangar_BattleListWnd:GetRecordData( recordIdx )
		if data.shipItem and data.shipItem.vid == vid then

			local slotWnd = UI.Hangar_BattleListWnd:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:OnAmmoChanged()
			end

			break

		end

	end

end


--
function UI.HangarWnd:UpdateShipSlotsOnPlayerCreditsChanged()

	for slotIdx = 1, UI.Hangar_BattleListWnd:GetNumVisibleSlots() do

		local slotWnd = UI.Hangar_BattleListWnd:GetButtonForSlot( slotIdx )
		if slotWnd then
			slotWnd:OnPlayerCreditsChanged()
		end

	end

end


--
function UI.HangarWnd:HideDamageMsg()

	self:SetLayerVisible( false, self.layers.DAMAGE_MSG_EFFECT )
	self:SetLayerVisible( false, self.layers.DAMAGE_MSG )

end


--
function UI.HangarWnd:ShowDamageMsg()

	self:SetLayerVisible( true, self.layers.DAMAGE_MSG_EFFECT )
	self:SetLayerVisible( true, self.layers.DAMAGE_MSG )

end


--
function UI.HangarWnd:UpdateDamageMsg()

	local repairInfo = UI:GetAllShipsRepairInfo( true )

	if not repairInfo.bFullDur and repairInfo.bZeroDur then
		self:ShowDamageMsg()
	else
		self:HideDamageMsg()
	end

end


--
function UI.HangarWnd:ToggleFriendsList()

	if UI.FriendsListWnd:IsOnScreen() then
		UI.FriendsListWnd:UnlinkFromParent()
		UI:PlayGlobalSound( self.sounds.friendsHide )
		UI.Hangar_FriendListBtn:UpdateAnim()
	else
		UI:PlayGlobalSound( self.sounds.friendsShow )
		self:AddChild( UI.FriendsListWnd )
		UI.Hangar_FriendListBtn:UpdateAnim()
	end

end


--
function UI.HangarWnd:ToggleVoteWnd()

	if UI.Vote_Wnd:IsOnScreen() then
		UI.Vote_Wnd:UnlinkFromParent()
		UI:PlayGlobalSound( self.sounds.voteHide )
		UI.Hangar_VoteBtn:UpdateAnim()
	else
		UI:PlayGlobalSound( self.sounds.voteShow )
		self:AddChild( UI.Vote_Wnd )
		self:UpdateVoteWndPosition()
		UI.Hangar_VoteBtn:UpdateAnim()
	end

end


--
function UI.HangarWnd:UpdateSquadWndPos()

	if UI.Hangar_TopPanelWnd and UI.Hangar_TopPanelWnd.w and UI.SquadWnd and UI.SquadWnd.w then

		local squadWndPos = UI.Hangar_TopPanelWnd:GetSquadWndScreenPos()
		squadWndPos.x = self:XToWindow( squadWndPos.x )
		squadWndPos.y = self:YToWindow( squadWndPos.y )
		UI.SquadWnd:SetPos( squadWndPos.x, squadWndPos.y )
		
	end

end


--
function UI.HangarWnd:TryShowSquadWnd( bSound )

	if bSound == nil then
		bSound = true
	end

	if not UI.SquadWnd:IsOnScreen() then
		self:AddChild( UI.SquadWnd )
		if bSound then
			UI:PlayGlobalSound( self.sounds.squadShow )
		end
	end

end


--
function UI.HangarWnd:HideSquadWnd( bSound )

	if bSound == nil then
		bSound = true
	end

	if UI.SquadWnd:IsOnScreen() then
		UI.SquadWnd:UnlinkFromParent()
		if bSound then
			UI:PlayGlobalSound( self.sounds.squadHide )
		end
	end

end


--
function UI.HangarWnd:OnStartBtn()

	-- скрыть

	if UI.TourWnd:IsOnScreen() then

		self:HideTourWnd( true )

	elseif UI.GameplayChoiceWnd:IsOnScreen() then

		self:HideGameplayChoiceWnd( true )

	elseif UI.PveChoiceWnd:IsOnScreen() then

		self:HidePveChoiceWnd( true )
		
	elseif UI.PveWnd:IsOnScreen() then

		self:HidePveWnd( true )

	elseif UI.ArenaWnd:IsOnScreen() then

		self:HideArenaWnd( true )

	elseif UI.GameplayWnd:IsOnScreen() then

		self:TrySetMenuTab( self.menuTabs.MAIN, true, true )

	elseif UI.GameplayPveMapWnd:IsOnScreen() then

		self:TrySetMenuTab( self.menuTabs.MAIN, true, true )

	elseif UI.MatchMakingWnd:IsOnScreen() then

		UI:PlayGlobalSound( self.sounds.maximizeMatchmaking )
		self:HideMatchMakingWnd()

	elseif UI.PvpMatchmakingWnd:IsOnScreen() then

		UI:PlayGlobalSound( self.sounds.maximizeMatchmaking )
		self:HidePvpMatchmakingWnd()

	-- показать

	else

    	if UI.Tutorial:IsActive() then

    		if not UI.bSavingGameState then
    			_G.MasterServer_UpdatePlayerActionsLog( _G.MasterServer.PlayerAction.PA_LAUNCH_BATTLE )
    		end

    		UI.Tutorial:LaunchTutorialGameplay()

		elseif UI.Lobby:IsInLobby() then

    		self:TrySetMenuTab( self.menuTabs.CUSTOM_GAME, true, true )

		elseif UI:IsTourTeamExist() and UI:IsInTournament() then

			self:ShowTourWnd( true )

		elseif self.prepareState ~= self.prepareStates.NONE then

			if self.prepareState == self.prepareStates.MATCHMAKING then

				if UI:IsPvpEnqueued() or UI.MatchMakingWnd:IsPvp() then

					UI:PlayGlobalSound( self.sounds.maximizeMatchmaking )
					self:ShowPvpMatchmakingWnd()

				elseif UI:IsCoopVsAiEnqueued() or UI.MatchMakingWnd:IsCoopVsAi() then

					UI:PlayGlobalSound( self.sounds.maximizeMatchmaking )
					self:ShowPvpMatchmakingWnd()

				elseif UI:IsPveEnqueued() or UI.MatchMakingWnd:IsPve() then

					self:ShowPveChoiceWnd( UI.PveChoiceWnd.modes.MATCHMAKING, true )

				elseif UI:IsArenaEnqueued() or UI.MatchMakingWnd:IsArena() then

					self:ShowArenaWnd( true, true )

				else

					UI:PlayGlobalSound( self.sounds.maximizeMatchmaking )
    				self:ShowMatchMakingWnd()

				end

			else
				self:ShowGameplayChoiceWnd( true )
			end

		else
			self:ShowGameplayChoiceWnd( true )
		end

	end

end


--
function UI.HangarWnd:CanStartCheckMatchMatchMaking()

	return self.prepareState == self.prepareStates.NONE
	
end


--
function UI.HangarWnd:CheckStartMatchMaking( battleSlot, gameParams, checkReadyType, bEmm )

	if bEmm == nil then
		bEmm = false
	end
	
	self.prepareBattleSlot		= battleSlot
	self.prepareGameParams		= gameParams
	self.prepareCheckReadyType	= checkReadyType
	self.prepareEmm				= bEmm
	
	local handled = false
	
	if not handled then
		if self.prepareState == self.prepareStates.NONE then
			if self:CheckCancelSquadInvitesBeforeFight() then
				handled = true
			end
		end
	end

	if not handled then
		if self.prepareState <= self.prepareStates.CANCEL_SQUAD_INVITES_WAIT then
			if self:CheckSquadReadyBeforeFight() then
				handled = true
			end
		end
	end

	if not handled then
		if self.prepareState <= self.prepareStates.SQUAD_READY_CHECK then
			if self:CheckRepairBeforeFight() then
				handled = true
			end
		end
	end

	if not handled then
		if self.prepareState <= self.prepareStates.REPAIR_WAIT then
			if self:CheckRefillBeforeFight() then
				handled = true
			end
		end
	end

	if not handled then
		if bEmm then
			self:StartEMM()
		else
			self:StartMatchMaking()
		end
	end
	
	if self.prepareState == self.prepareStates.NONE then
		self.prepareBattleSlot		= nil
		self.prepareGameParams		= nil
		self.prepareCheckReadyType	= nil
		self.prepareEmm				= nil
	end

end


--
function UI.HangarWnd:CheckCancelSquadInvitesBeforeFight()

	local bNeedCancelInvites = false

	if UI.Squad:GetInvitedPlayersCount() > 0 then

		bNeedCancelInvites = true

		self:SetPrepareState( self.prepareStates.CANCEL_SQUAD_INVITES_REQUEST )
		self.hMsgCancelSquadInvites = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_cantStartFightWithSquadInvites" ), UI.MBS_YES_NO )

	end

	return bNeedCancelInvites

end


--
function UI.HangarWnd:CheckSquadReadyBeforeFight()

	local bReadyCheck = false

	if UI.Squad:IsInSquad() and UI.Squad:IsLeader() and UI.Squad:GetPilotsCount() > 1 and self.prepareCheckReadyType then

 		UI.Squad:CheckReadyLeaderStart( self.prepareCheckReadyType, self.prepareGameParams )
		bReadyCheck = UI.Squad:IsLeaderDoingReadyCheck()

		if bReadyCheck then
			self:SetPrepareState( self.prepareStates.SQUAD_READY_CHECK )
		end

	end

	return bReadyCheck

end


--
function UI.HangarWnd:CheckResetSquadReadyCheckPrepareState()

	if self.prepareState == self.prepareStates.SQUAD_READY_CHECK then

		if not UI.Squad:IsLeaderDoingReadyCheck() then
			self:SetPrepareState( self.prepareStates.NONE )
		end

	end

end


--
function UI.HangarWnd:CheckRepairBeforeFight()

	local bNeedRepair = false
	local repairInfo = nil 
	if self.prepareBattleSlot ~= nil then
		local vid = UI.serverData.battleSlots[ self.prepareBattleSlot ]
		if vid and vid ~= INVALID_U64_ID then
			repairInfo = UI:GetShipRepairInfo( vid, bZeroDurOnly )
		else
			sys.log( "UI.HangarWnd:CheckRepairBeforeFight()[ERROR]: self.prepareBattleSlot %d is empty", self.prepareBattleSlot )
		end
	else
		repairInfo = UI:GetAllShipsRepairInfo( true )
	end

	if not repairInfo.bFullDur and repairInfo.bZeroDur then

		bNeedRepair = true
		local bSilent = repairInfo.credits == 0 and repairInfo.gold == 0

		if not bSilent then
			self:SetPrepareState( self.prepareStates.REPAIR_REQUEST )
			self:ShowRepairWndBeforeFight( self.prepareBattleSlot )

		else
			if self.prepareBattleSlot ~= nil then
				if _G.GameStore_RepairVessel( UI.serverData.battleSlots[ battleSlot ] ) ~= 0 then
					self:SetPrepareState( self.prepareStates.REPAIR_WAIT )
				else
					self:SetPrepareState( self.prepareStates.NONE )
					self:ShowMsgOnSendRequestError()
				end
			else
				if _G.GameStore_RepairBattleVessels( true ) ~= 0 then
					self:SetPrepareState( self.prepareStates.REPAIR_WAIT )
				else
					self:SetPrepareState( self.prepareStates.NONE )
					self:ShowMsgOnSendRequestError()
				end
			end
		end

	end

	return bNeedRepair

end


--
function UI.HangarWnd:CheckRefillBeforeFight()

	local bNeedRefill = false
	local refillInfo = nil
	if self.prepareBattleSlot ~= nil then
		local vid = UI.serverData.battleSlots[ self.prepareBattleSlot ]
		if vid and vid ~= INVALID_U64_ID then
			local shipItem = UI:GetShipItem( vid, true )
			refillInfo = UI:GetShipRefillInfo( shipItem )
		else
			sys.log( "UI.HangarWnd:CheckRefillBeforeFight()[ERROR]: self.prepareBattleSlot %d is empty", self.prepareBattleSlot )
		end
	else
		refillInfo = UI:GetAllShipsRefillInfo()
	end

	if not refillInfo.bFullAmmo then

		bNeedRefill = true
		local bSilent = refillInfo.credits == 0 and refillInfo.gold == 0

		if not bSilent then
			self:SetPrepareState( self.prepareStates.REFILL_REQUEST )
			self:ShowRefillWndBeforeFight( self.prepareBattleSlot )

		else
			if self.prepareBattleSlot ~= nil then
				if _G.GameStore_RefillMunition( UI.serverData.battleSlots[ self.prepareBattleSlot ] ) ~= 0 then
					self:SetPrepareState( self.prepareStates.REFILL_WAIT )
				else
					self:SetPrepareState( self.prepareStates.NONE )
					self:ShowMsgOnSendRequestError()
				end
			else
				if _G.GameStore_RefillBattleVessels() ~= 0 then
					self:SetPrepareState( self.prepareStates.REFILL_WAIT )
				else
					self:SetPrepareState( self.prepareStates.NONE )
					self:ShowMsgOnSendRequestError()
				end
			end
		end

	end
	
	return bNeedRefill

end 


--
function UI.HangarWnd:ShowRepairWndBeforeFight( battleSlot )

	UI.Hangar_PrepareWnd:Setup( UI.Hangar_PrepareWnd.callTypes.BEFORE_FIGHT, UI.Hangar_PrepareWnd.operationTypes.REPAIR, battleSlot ~= nil and UI:GetShipItem( UI.serverData.battleSlots[ battleSlot ] ) or nil )
	UI.Hangar_PrepareWnd:Show()

	UI:PlayGlobalSound( self.sounds.prepareWndShow )

end


--
function UI.HangarWnd:ShowRefillWndBeforeFight( battleSlot )

	UI.Hangar_PrepareWnd:Setup( UI.Hangar_PrepareWnd.callTypes.BEFORE_FIGHT, UI.Hangar_PrepareWnd.operationTypes.REFILL, battleSlot ~= nil and UI:GetShipItem( UI.serverData.battleSlots[ battleSlot ] ) or nil )
	UI.Hangar_PrepareWnd:Show()

	UI:PlayGlobalSound( self.sounds.prepareWndShow )

end


--
function UI.HangarWnd:ShowMsgOnSendRequestError()

	UI:ShowErrorMsg( "msg_failSendRequest" )

end


--
function UI.HangarWnd:HideWaitingWnd()

	UI.Hangar_WaitingWnd:UnlinkFromParent()

end


--
function UI.HangarWnd:ShowWaitingWnd( text, bShowBlackBg )

	if bShowBlackBg == nil then
		bShowBlackBg = true
	end

	self:AddChild( UI.Hangar_WaitingWnd )

	UI.Hangar_WaitingWnd:SetWaitText( text )
	UI.Hangar_WaitingWnd:SetBlackBgVisible( bShowBlackBg )


end


--
function UI.HangarWnd:UpdateWaitingWnd()

	if self.bWaitingStore then
		self:ShowWaitingWnd( UI:GetStringByName( "hangar_reloadShop" ), true )

	elseif self.prepareState == self.prepareStates.CANCEL_SQUAD_INVITES_WAIT then
		self:ShowWaitingWnd( UI:GetStringByName( "hangar_cancelSquadIvitesInProcess" ), false )

	elseif self.prepareState == self.prepareStates.REPAIR_WAIT then
		self:ShowWaitingWnd( UI:GetStringByName( "hangar_repairInProcess" ), false )

	elseif self.prepareState == self.prepareStates.REFILL_WAIT then
		self:ShowWaitingWnd( UI:GetStringByName( "hangar_refillInProcess" ), false )

	elseif self.prepareState == self.prepareStates.MATCHMAKING_WAIT then
		self:ShowWaitingWnd( UI:GetStringByName( "hangar_preparingBeforeFight" ), false )

	elseif self.prepareState == self.prepareStates.SQUAD_READY_CHECK then
		self:ShowWaitingWnd( UI:GetStringByName( "hangar_squadReadyCheckInProgress" ), false )

	else
		self:HideWaitingWnd()
	end

end


--
function UI.HangarWnd:HideInBattleMsg()

	self:SetLayerVisible( false, self.layers.IN_BATTLE_MSG_EFFECT )
	self:SetLayerVisible( false, self.layers.IN_BATTLE_MSG )

end


--
function UI.HangarWnd:ShowInBattleMsg()

	self:SetLayerVisible( true, self.layers.IN_BATTLE_MSG_EFFECT )
	self:SetLayerVisible( true, self.layers.IN_BATTLE_MSG )

end


--
function UI.HangarWnd:UpdateInBattleMsg()

	local bInBattle = self:IsInBattle()

	if bInBattle then
		self:ShowInBattleMsg()
	else
		self:HideInBattleMsg()
	end

end


--
function UI.HangarWnd:UpdateStartBtnState( bForceUpdateQuests )

	if not self:IsOnScreen() then
		return
	end
	
	-- квесты апдейтятся только если ангар на экране,
	-- поэтому в сам момент показа ангара, когда надо апдейтить кнопку старта, они невалидны,
	-- параметр bForceUpdateQuests заставляет немедленно проапдейтить квесты
	
	if bForceUpdateQuests == nil then
		bForceUpdateQuests = false
	end

	if not UI.Hangar_StartBtn or not UI.Hangar_StartBtn.w then
		return
	end
	
	local bInBattle = self:IsInBattle()

	local bMatchmakingDisabled = self.serverInfo.mmDisabled 
	if bMatchmakingDisabled == nil then
		bMatchmakingDisabled = false
	end

	local bEnableStartBtn =
		not bInBattle
		and not bMatchmakingDisabled
		and not UI:IsEMMReady()
		or UI.Lobby:IsInLobby()

	UI.Hangar_StartBtn:SetGray( not bEnableStartBtn )
	
	local bNeedWaiting = self.prepareState == self.prepareStates.MATCHMAKING and not UI.Lobby:IsInLobby() and not self:IsMatchmakingControlOnScreen()
	local bNeedTimer = bNeedWaiting

	if bNeedWaiting then
		UI.Hangar_StartBtn:ShowWaiting()
	else
		UI.Hangar_StartBtn:HideWaiting()
	end

	if bNeedTimer then
		UI.Hangar_StartBtn:HideStartText()
		UI.Hangar_StartBtn:ShowMatchmakingTime()
		self:UpdateMatchmakingTime()
	else        
		UI.Hangar_StartBtn:HideMatchmakingTimer()
		UI.Hangar_StartBtn:ShowStartText()
	end
	
	local text =
		( UI.GameplayPveMapWnd and UI.GameplayPveMapWnd.w and UI.GameplayPveMapWnd:IsChildOf( self ) )
			and UI:GetStringByName( "hangar_startBtn_toHangar" )
			or UI:GetStringByName( "hangar_startGame" )
			
	UI.Hangar_StartBtn:SetStartText( text )
	
end


--
function UI.HangarWnd:IsMatchmakingControlOnScreen()

	if UI.MatchMakingContainerWnd:IsOnScreen() then
		return true
	end

	if UI.TourWnd:IsOnScreen() then
		return true
	end

	if UI.PvpMatchmakingWnd:IsOnScreen() then
		return true
	end

	if UI.PveChoiceWnd:IsOnScreen() and UI.PveChoiceWnd:GetMode() == UI.PveChoiceWnd.modes.MATCHMAKING then
		return true
	end

	if UI.ArenaWnd:IsOnScreen() and UI.ArenaWnd:GetMode() == UI.ArenaWnd.modes.MATCHMAKING then
		return true
	end

	return false

end


--
function UI.HangarWnd:IsInBattle()

	return UI:IsInBattle()

end


--
function UI.HangarWnd:UpdateBattleSlotsLockState()

	for recordIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do

		local data = UI.Hangar_BattleListWnd:GetRecordData( recordIdx )

		if not data.bSlotBought then

        	local slotWnd = UI.Hangar_BattleListWnd:GetButtonForRecord( recordIdx )
    		if slotWnd then
    			slotWnd:FullUpdate()
    		end

    		self:UpdateBattleSlotMouseOverState( recordIdx )
			
		end

	end

end


--
function UI.HangarWnd:UpdateShipEntTalents()

	for slotIdx, shipEntId in pairs( self.shipEntIds ) do

		if shipEntId ~= -1 then

			local talentSetId = UI.serverData.talentSetBinds[ slotIdx ] or -1
			local talents = UI.serverData.talents[ talentSetId ] or {}

			_G.CL_ForceSetSpaceShipTalents( shipEntId, talents )

		end

	end

end


--
function UI.HangarWnd:UpdateShipEntAccountAuras()

	for idx, shipEntId in pairs( self.shipEntIds ) do

		if shipEntId ~= -1 then
			_G.CL_ForceSetSpaceShipAccountAuras( shipEntId, UI.serverData.accountAuras )
		end

	end

end


-- 
function UI.HangarWnd:SetPrepareState( prepareState )

	local lastPrepareState = self.prepareState
	self.prepareState = prepareState
	
	if prepareState == self.prepareStates.NONE then
		self.prepareBattleSlot			= nil
		self.prepareGameParams			= nil
		self.prepareCheckReadyType		= nil
		self.prepareEmm					= nil
	end

	if self.prepareState == self.prepareStates.MATCHMAKING and not UI.Lobby:IsInLobby() then
		self:ActivateMatchMaking()
	else
		self:ResetMatchMaking()
	end

	self:UpdateMatchmakingControl()

	if self:IsMatchmakingControlOnScreen() then
		self:TrySetMenuTab( self.menuTabs.MAIN, false, true )
    	self:SetNotificationsMode( self.notificationsModes.POP_UPS )
    	self:HideMail( false )
	end

	self:UpdateWaitingWnd()
	self:UpdateStartBtnState()
	self:UpdateShipSlotsOnPrepareStateChanged()
	UI.HelpListWnd:OnHangarPrepareStateChanged()
	UI.ShipsTreeWnd:OnHangarPrepareStateChanged()
	UI.GameplayChoiceWnd:OnHangarPrepareStateChanged()
	UI.PvpMatchmakingWnd:OnHangarPrepareStateChanged()
	UI.DebriefingWnd:OnHangarPrepareStateChanged()
	UI.PveChoiceWnd:OnHangarPrepareStateChanged()
	UI.ArenaWnd:OnHangarPrepareStateChanged()
	UI.ClanShipWnd:OnHangarPrepareStateChanged()
	UI.GameplayPveMapWnd:OnHangarPrepareStateChanged()
	UI.Hangar_QuestsWnd:OnHangarPrepareStateChanged()

	-- месседжбокс на дисэйбл мачмейкинга не показывается, пока идет подготовка;
	-- но если она закончена, то надо проверить и, при необходимости, показать его

	if self.prepareState == self.prepareStates.NONE and self:IsOnScreen() and lastPrepareState ~= self.prepareStates.NONE then
    	if self.serverInfo.mmDisabled then
    		self:ShowMatchMakingDisabledMsg()
    	end
	end

	if self:IsOnScreen() then
		local menuTab = self:ValidateMenuTabForPrepareState( self.menuTab, self.prepareState )
		self:TrySetMenuTab( menuTab, false, true )
	end

	if self.prepareState == self.prepareStates.NONE then
		if UI.Squad:IsInSquad() and UI.Squad:IsLeader() then
			UI.Squad:LeaderCancelReady()
		end
	end

	if self.prepareState == self.prepareStates.MATCHMAKING then
		
		if self.menuTab == self.menuTabs.FREE_SPACE_MAP then
			self:TrySetMenuTab( self.menuTabs.MAIN, false, true )
		end
		
		self:HideGameplayChoiceWnd()

		if UI.PveChoiceWnd:GetMode() ~= UI.PveChoiceWnd.modes.MATCHMAKING then
			self:HidePveChoiceWnd()
		end
		
		self:HidePveWnd()

		if UI.ArenaWnd:GetMode() ~= UI.ArenaWnd.modes.MATCHMAKING then
			self:HideArenaWnd()
		end

	end

end


--
function UI.HangarWnd:UpdateMatchmakingControl()

	self:HideMatchMakingWnd()
	self:HidePvpMatchmakingWnd()

	if UI.PveChoiceWnd:GetMode() == UI.PveChoiceWnd.modes.MATCHMAKING then
		self:HidePveChoiceWnd()
	end

	if UI.ArenaWnd:GetMode() == UI.ArenaWnd.modes.MATCHMAKING then
		self:HideArenaWnd()
	end

	-- окно UI.TourWnd форсированно не скрывается, т.к. оно может показываться после заверщения турнира, когда уже нет матчмейкинга

	if self.prepareState ~= self.prepareStates.MATCHMAKING or UI.Lobby:IsInLobby() then
		return
	end

	local bInTour = UI:IsTourTeamExist() and UI:IsInTournament()

	if bInTour then
		self:ShowTourWnd( true )

	elseif UI.DebriefingWnd:IsOnScreen() and UI.DebriefingWnd:CanStartBattle() then
		-- ничего

	elseif UI:IsPvpEnqueued() or UI.MatchMakingWnd:IsPvp() then
		self:ShowPvpMatchmakingWnd()

	elseif UI:IsCoopVsAiEnqueued() or UI.MatchMakingWnd:IsCoopVsAi() then
		self:ShowPvpMatchmakingWnd()

	elseif UI:IsPveEnqueued() or UI.MatchMakingWnd:IsPve() then
		self:ShowPveChoiceWnd( UI.PveChoiceWnd.modes.MATCHMAKING, false )

	elseif UI:IsArenaEnqueued() or UI.MatchMakingWnd:IsArena() then
		self:ShowArenaWnd( true, false )

	else
		self:ShowMatchMakingWnd()
	end

end


--
function UI.HangarWnd:ValidateMenuTabForPrepareState( menuTab, prepareState )

	if self.prepareState == self.prepareStates.MATCHMAKING and menuTab == self.menuTabs.FREE_SPACE_MAP then
		return self.menuTabs.MAIN
	end

	return menuTab

end


--
function UI.HangarWnd:ShowFreeSpaceDisabledMsg()

	if self.hMsgFreeSpaceDisabled ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgFreeSpaceDisabled = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_freespaceUnavailable" ), UI.MBS_OK )

end


--
function UI.HangarWnd:ShowMatchMakingDisabledMsg()

	if self.hMsgMatchMakingDisabled ~= UI.INVALID_UI_HANDLE then
		return
	end

	self.hMsgMatchMakingDisabled = UI:MessageBox( UI:GetStringByName( "msgCapt_warning" ), UI:GetStringByName( "msg_matchmakingUnavailable" ), UI.MBS_OK )

end


--
function UI.HangarWnd:InitSpawnSpots()

	self:ResetSpawnSpots()

	for slotIdx = 1, UI.Hangar_BattleListWnd.MAX_SLOTS do

		local entId = -1

		local entName = string.format( "SpawnSpot%d", slotIdx )
		local ent = _G.Entities[ entName ]

		if ent then
			entId = ent:GetId()
		else
			sys.log( "UI.HangarWnd:InitSpawnSpots()[ERROR]: cannot find entity %s", entName )
		end

		self.spawnSpotEntIds[ slotIdx ] = entId

	end

end


--
function UI.HangarWnd:ResetSpawnSpots()

	self.spawnSpotEntIds = {}

end


--
function UI.HangarWnd:F_OnLostKeyboardFocus()

	self:OnLostKeyboardFocus()
	self:StopRotatingCamera()

end


--
function UI.HangarWnd:OnMenuTabBind( menuTab )

	if not self:IsOnScreen() then
		return
	end

	if self.menuTab == menuTab then
		return
	end

	if UI.Hangar_MenuWnd:IsTabDisabled( menuTab ) then
		return
	end

	local bCanReactOnKey = false
	local hFocus = UI:GetKeyboardFocus()

	if hFocus == self:GetUiHandle() then
		bCanReactOnKey = not self:IsInputBlocked()
	else
		local workWnd = self:GetWorkWndForTab( self.menuTab )
		if workWnd and workWnd:GetUiHandle() == hFocus and ( not workWnd.IsInputBlocked or not workWnd:IsInputBlocked() ) then
			bCanReactOnKey = true
		end
	end

	if not bCanReactOnKey then
		return
	end

	if UI.DebriefingWnd:IsOnScreen() then
		return
	end

	self:TrySetMenuTab( menuTab, true, false )

end


--
function UI.HangarWnd:ResetNotifcationControls()

	local mainEffect			= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local notificationsEffect 	= UI:GetEffectFromLayer( self, self.layers.NOTIFICATIONS_EFFECT )

	UI.NotificationsListWnd:UnlinkFromParent()
	if notificationsEffect then
		notificationsEffect:UnlinkWnd( UI.NotificationsListWnd:GetUiHandle(), "" )
	end

	UI.NotificationsPopUpsWnd:Hide()

	UI.Hangar_NotificationsModeBtn:Check( false )

	self.notificationsMode = -1

end


--
function UI.HangarWnd:SetNotificationsMode( notificationsMode )

	if notificationsMode == self.notificationsMode then
		return
	end

	if notificationsMode ~= -1 and not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:SetNotificationsMode()[ERROR]: not on screen" )
		return	
	end

	self:ResetNotifcationControls()

	self.notificationsMode = notificationsMode
	
	if self.notificationsMode == self.notificationsModes.LIST then
		local notificationsEffect = UI:GetEffectFromLayer( self, self.layers.NOTIFICATIONS_EFFECT )
		UI:AddChildAndLink( self, UI.NotificationsListWnd, notificationsEffect, self.effectInfo.notificatios.listLocator, UI.EffectAnimParams.POS )		
		
	elseif self.notificationsMode == self.notificationsModes.POP_UPS then
		UI.NotificationsPopUpsWnd:Show()

	else
		sys.log( "UI.HangarWnd:SetNotificationsMode()[ERROR]: invalid notification mode: %s", tostring( notificationsMode ) )
	end

	UI.Hangar_NotificationsModeBtn:Check( self.notificationsMode == self.notificationsModes.LIST )

end


--
function UI.HangarWnd:ToggleNotificationsMode()

	if self.notificationsMode == self.notificationsModes.LIST then
		UI:PlayGlobalSound( self.sounds.notificationsListClose )
		self:SetNotificationsMode( self.notificationsModes.POP_UPS )
	else
		UI:PlayGlobalSound( self.sounds.notificationsListOpen )
		self:SetNotificationsMode( self.notificationsModes.LIST )
	end

end


-- скрытие нотификаций на клик мышью в любом месте;
-- это нельзя сделать в F_OnMouseLButtonDown, т.к. она не вызывается, если клик был в пределах окна, которое само ловит ввод (магазин/квесты и т.п.)
function UI.HangarWnd:F_OnEventMouseButtonDown( hSender, btnIdx )

	self.wndUnderLastMouseDown = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )

	-- закрытие списка нотификаций
	if not UI:GetFirstOverlayWnd() then

    	if self.notificationsMode == self.notificationsModes.LIST then

        	local wndUnderMouse = self.wndUnderLastMouseDown

        	if not wndUnderMouse or ( wndUnderMouse ~= UI.NotificationsListWnd and not wndUnderMouse:IsChildOf( UI.NotificationsListWnd ) and wndUnderMouse ~= UI.Hangar_NotificationsModeBtn ) then
        		self:SetNotificationsMode( self.notificationsModes.POP_UPS )
        	end

		end

	end

end


--
function UI.HangarWnd:TrySelectShipEntByMouse()

	if	self.menuTab == self.menuTabs.STICKERS
		or self.menuTab == self.menuTabs.SHIP_PREVIEW
		or self.menuTab == self.menuTabs.SHIP_CRAFT
		or self.menuTab == self.menuTabs.SHIP_BUY
		or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW
		or self.menuTab == self.menuTabs.PROFILE_NEW
		or self.menuTab == self.menuTabs.BATTLE_PASS then
			return
	end

	local traceInfo = {}

	for slotIdx, entId in pairs( self.shipEntIds ) do

		if entId ~= -1 then

			local ent = _G.Entities[ entId ]
			local bHit, intersectPoint, camPos = _G.TraceEntityAabb( ent )

			if bHit then
				local distSq = UI:VLengthSq( intersectPoint - camPos )
				table.insert( traceInfo, { slotIdx = slotIdx, distSq = distSq } )
			end			

		end

	end

	if not next( traceInfo ) then
		return
	end

	local minDist = math.huge
	local minSlotIdx = -1

	for idx, info in pairs( traceInfo ) do

		if info.distSq <= minDist then
			minDist = info.distSq
			minSlotIdx = info.slotIdx
		end
			
	end

	if minSlotIdx ~= -1 then
		self:SelectBattleSlotInternal( minSlotIdx )
	end

end


--
function UI.HangarWnd:SelectBattleSlotInternal( slotIdx )

	if slotIdx ~= -1 and ( slotIdx < 1 or slotIdx > UI.Hangar_BattleListWnd.MAX_SLOTS ) then
		sys.log( "UI.HangarWnd:SelectBattleSlotInternal()[ERROR]: invalid slotId: %d", slotIdx )
		return
	end

	if slotIdx == UI.Hangar_BattleListWnd:GetSelectedRecord() then
		return
	end

	if slotIdx > UI.Hangar_BattleListWnd:GetNumRecords() then
		return
	end

	if slotIdx ~= -1 then
    	local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )
        if not data.bSlotBought then
    		UI:PlayGlobalSound( self.sounds.battleSlotLocked )
    		return
    	end
	end

	UI.Hangar_BattleListWnd:SelectRecord( slotIdx )

	if slotIdx ~= -1 then
		UI:PlayGlobalSound( UI.HangarWnd.sounds.battleSlotSelect )
	end

end


--
function UI.HangarWnd:UpdateStickersBtn()

	local selShipItem = self:GetSelShipItem()
	local bEnabled = selShipItem and selShipItem.lockedInGame == UI.INVALID_U64_ID

	UI.Hangar_ShipCustomizationBtn:Enable( bEnabled )

end


--
function UI.HangarWnd:UpdateTime()
	
	if self:IsLayerVisible( self.layers.TIME ) then
	
		-- SC-112041 локальное или серверное - зависит от опции
		
		local time = UI.INVALID_U64_ID
		
		local serverTime = _G.MasterServer_IsConnected() and _G.MasterServer_GetServerTime() or UI.INVALID_U64_ID
		
		if UI:NeedShowServerTime() then
			time = serverTime
		else
			time = _G.MasterServer_ServerTimeToLocalTime( serverTime )
		end
		
		local dateTime = _G.PlatformTimeToTable( time )
		
		local timeOfDay = dateTime.hour * 3600 + dateTime.minute * 60 + dateTime.second		
		
    	local strTime = UI:Time2Str7( timeOfDay )
    	self:SetText( strTime, self.layers.TIME )

	end

end


--
function UI.HangarWnd:GetNumPlayersInQueue( queuesInfo, mmParams )

	for queueIdx, queueInfo in pairs( queuesInfo ) do
		if queueInfo.mmParams and self:IsEqualMmParams( queueInfo.mmParams, mmParams ) then
			return queueInfo.total
		end
	end

	return 0

end


--
function UI.HangarWnd:IsEqualMmParams( params1, params2 )

	for name1, val1 in pairs( params1 ) do
		local val2 = params2[ name1 ] or 0
		if val1 ~= val2 then
			return false
		end
	end

	for name2, val2 in pairs( params2 ) do
		local val1 = params1[ name2 ] or 0
		if val1 ~= val2 then
			return false
		end
	end

	return  true

end


--
function UI.HangarWnd:UpdateTalentsMenuBtnBlink()
	
	local bBlink = false

	if not UI.TalentsWnd:IsChildOf( UI.HangarWnd ) then

		if UI:IsTalentsAvailable() then

			-- #0044769, комм.(0170939) - "Мигать про все закладки которые назначены на боевые слоты и в которых не изучены скилы." 

			local boundTalentSets = {}

			for battleSlotIdx, talentSetId in pairs( UI.serverData.talentSetBinds ) do
				if talentSetId ~= -1 then
					boundTalentSets[ talentSetId ] = true
				end
			end

			local playerRep = UI:GetPlayerMaxReputationForRace()
			local playerRank = UI:Reputation2Rank( playerRep )
	
			local maxTalentsRank = _G.TalentGroups and #_G.TalentGroups or 1
			local maxTalentsApplied = math.min( playerRank, maxTalentsRank )

			for talentSetId, val in pairs( boundTalentSets ) do

				local talents = UI.serverData.talents[ talentSetId ] or {}
				local numTalentsApplied = #talents

				if numTalentsApplied < maxTalentsApplied then
					bBlink = true
					break
				end

			end

		end

	end
	
	UI.Hangar_TalentsBtn:Blink( bBlink )
	
end


--
function UI.HangarWnd:UpdateTalentsMenuBtnDisable()

	local talentsMinRank	= UI.rankLocks.talents
	local playerRank		= UI:GetPlayerAccountRank()	
		
	local bLocked = playerRank < talentsMinRank
	UI.Hangar_TalentsBtn:SetGray( bLocked )
	
	local tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= self:GetMenuBtnTooltipText( self.menuTabs.SKILLS ),
		caption		= self:GetMenuBtnTooltipCaption( self.menuTabs.SKILLS ),
	}
	UI.Hangar_TalentsBtn:SetTooltipData( tooltipData )
	
end


--
function UI.HangarWnd:UpdateItemCraftMenuBtnDisable()

	local craftMinRank	= UI.rankLocks.itemCraft
	local playerRank	= UI:GetPlayerAccountRank()

	local recordIdx = UI.Hangar_MenuWnd:GetRecordForMenuTab( self.menuTabs.ITEM_CRAFT )
	local data = UI.Hangar_MenuWnd:GetRecordData( recordIdx )

	local bLockedOld = data.bLocked
	data.bLocked = playerRank < craftMinRank

	if data.bLocked ~= bLockedOld then

		data.tooltipData.text = self:GetMenuBtnTooltipText( data.menuTab )

    	local craftMenuBtn = UI.Hangar_MenuWnd:GetButtonForRecord( recordIdx )
    	if craftMenuBtn then
    		craftMenuBtn:UpdateOnDisabledChanged()
    	end		

	end

end


--
function UI.HangarWnd:GetMenuBtnDefaultDescTooltipText( menuTab )

	local strId = string.format( "hangar_menuTab_desc_%s", UI:Val2Key( UI.HangarWnd.menuTabs, menuTab ) )
	return UI:GetStringByName( strId )

end


--
function UI.HangarWnd:GetMenuBtnBindTooltipText( menuTab, colorBase )

	local bindName = self.menuTab2BindName[ menuTab ]
	if UI:IsStrEmpty( bindName ) then
		return ""
	end

	local strKeys = UI:GetBindKeysStr( bindName, true )
	if strKeys == "" then
		return ""
	end

	if colorBase == nil then
		colorBase = UI.TEXT_BASE_COLOR
	end

	local strBaseColor	= UI:Color2Str( colorBase )
	local strSelColor	= UI:Color2Str( UI.TEXT_SEL_COLOR )

	strKeys = string.format( "%s%s%s", strSelColor, strKeys, strBaseColor ) 

	local strBind = UI:GetStringByName( "hangar_menuTab_hotKey" )
	strBind = string.gsub( strBind, "%$hot_key%$", strKeys )
	strBind = string.format( "%s%s", strBaseColor, strBind )

	return strBind

end


--
function UI.HangarWnd:GetMenuBtnTooltipText( menuTab )

	local text = ""

	local tooltipWnd = nil

	local hTooltipWnd = UI:GetDefaultTooltipWnd( UI.tooltipTypes.TEXT_LARGE )
	if hTooltipWnd ~= UI.INVALID_UI_HANDLE then
		tooltipWnd = UI:GetUiObjByHandleT( hTooltipWnd )
	end

	local colorBase = tooltipWnd and tooltipWnd:GetTextColor() or UI.TEXT_BASE_COLOR

	local strColorBase = UI:Color2Str( colorBase )
	local strColorSel = UI:Color2Str( UI.TEXT_SEL_COLOR )

	if menuTab == self.menuTabs.SKILLS then

		local talentMinRank	= UI.rankLocks.talents
		local playerRank	= UI:GetPlayerAccountRank()

		local bEnoughRank = playerRank >= talentMinRank
		if not bEnoughRank then		

			local strTalentMinRank = string.format( "%s[%d]%s", strColorSel, talentMinRank, strColorBase )

			text = UI:GetStringByName( "shipsTree_accountRankRequired" )
			text = string.gsub( text , "%$rank%$", strTalentMinRank )

		end

	elseif menuTab == self.menuTabs.ITEM_CRAFT then

		local craftMinRank	= UI.rankLocks.itemCraft
		local playerRank	= UI:GetPlayerAccountRank()

		local bEnoughRank = playerRank >= craftMinRank
		if not bEnoughRank then		

			local strCraftMinRank = string.format( "%s[%d]%s", strColorSel, craftMinRank, strColorBase )

			text = UI:GetStringByName( "shipsTree_accountRankRequired" )
			text = string.gsub( text , "%$rank%$", strCraftMinRank )

		end

	elseif menuTab == self.menuTabs.CLAN then

		if not UI.Clan:IsInClan() then
			text = UI:GetStringByName( "hangar_menuTab_desc_CLAN_disable_text" )
		end

	end

	if text == "" then
		text = self:GetMenuBtnDefaultDescTooltipText( menuTab )
	end

	text = string.format( "%s%s", strColorBase, text )

	return text

end


--
function UI.HangarWnd:GetMenuBtnTooltipCaption( menuTab )

	local tooltipWnd = nil

	local hTooltipWnd = UI:GetDefaultTooltipWnd( UI.tooltipTypes.TEXT_LARGE )
	if hTooltipWnd ~= UI.INVALID_UI_HANDLE then
		tooltipWnd = UI:GetUiObjByHandleT( hTooltipWnd )
	end

	local colorBase = tooltipWnd and tooltipWnd:GetCaptionColor() or UI.TEXT_BASE_COLOR
	local strColorBase = UI:Color2Str( colorBase )

	local caption = ""

	local strId = string.format( "hangar_menuTab_%s", UI:Val2Key( UI.HangarWnd.menuTabs, menuTab ) )
    caption = UI:GetStringByName( strId )

	local strBind = self:GetMenuBtnBindTooltipText( menuTab, colorBase )
	if strBind ~= "" then
		caption = string.format( "%s%s %s", strColorBase, caption, strBind )
	end

	return caption

end


--
function UI.HangarWnd:UpdateMenuBtnsTooltips()

	for recordIdx = 1, UI.Hangar_MenuWnd:GetNumRecords() do

		local data = UI.Hangar_MenuWnd:GetRecordData( recordIdx )

		if data.tooltipData then
			data.tooltipData.text		= self:GetMenuBtnTooltipText( data.menuTab )
			data.tooltipData.caption	= self:GetMenuBtnTooltipCaption( data.menuTab )
		end

	end
	
	local talentsTooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		text		= self:GetMenuBtnTooltipText( self.menuTabs.SKILLS ),
		caption		= self:GetMenuBtnTooltipCaption( self.menuTabs.SKILLS ),
	}
	UI.Hangar_TalentsBtn:SetTooltipData( talentsTooltipData )

end


--
function UI.HangarWnd:LaunchBuyWnd( mode, data )

	UI.Hangar_BuyWnd:Setup( mode, true, data )
	UI.Hangar_BuyWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.HangarWnd:LaunchSellTradeWnd( invItem )

	UI.Hangar_TradeWnd:SetupForSell( invItem )
	UI.Hangar_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.HangarWnd:LaunchBuyTradeWnd( shopItem, bForceNoStack )

	UI.Hangar_TradeWnd:SetupForBuy( shopItem, bForceNoStack )
	UI.Hangar_TradeWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.HangarWnd:LaunchTradeWithInventoryWnd( shopItem, inventoryLevelsToBuy, bBuyForShipParts )

	UI.Hangar_BuyWithInventoryWnd:Setup( shopItem, inventoryLevelsToBuy, bBuyForShipParts )
	UI.Hangar_BuyWithInventoryWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.HangarWnd:ShowMail( bSound )

	if UI.MailWnd:IsChildOf( self ) then
		return
	end

	self:AddChild( UI.MailWnd )
	self:UpdateMailWndPosition()

	if bSound and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mailShow )
	end

end


--
function UI.HangarWnd:HideMail( bSound )

	if not UI.MailWnd:IsChildOf( self ) then
		return
	end

	UI.MailWnd:UnlinkFromParent()

	if bSound and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mailHide )
	end

end


--
function UI.HangarWnd:UpdateMailBtnState()

	UI.Hangar_MailBtn:Update()

end


--
function UI.HangarWnd:UpdateShipSlotsOnPrepareStateChanged()

	for slotIdx = 1, UI.Hangar_BattleListWnd:GetNumVisibleSlots() do

		local slotWnd = UI.Hangar_BattleListWnd:GetButtonForSlot( slotIdx )
		if slotWnd then
			slotWnd:OnPrepareStateChanged()
		end

	end

end


--
function UI.HangarWnd:UpdateMatchmakingTime()

	if self.prepareState == self.prepareStates.MATCHMAKING and not UI.Lobby:IsInLobby() and not self:IsMatchmakingControlOnScreen() then

		if UI.MatchMakingWnd:IsActive() then
			UI.Hangar_StartBtn:SetMatchmakingTime( UI.MatchMakingWnd:GetWaitingTime() )

		elseif _G.MasterServer_IsInTournament() then
			local round, bCurRound, timeLeft = UI:GetTourRoundTimeInfo()
			UI.Hangar_StartBtn:SetMatchmakingTime( timeLeft )
		end

	end

end


--
function UI.HangarWnd:F_OnEventListActivateRecord( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	if hSender == UI.PopUpMenuWnd:GetUiHandle() and UI.PopUpMenuWnd:GetOwner() == self:GetUiHandle() then

    	local menuType = UI.PopUpMenuWnd:GetMenuType()
    	if menuType == UI.popUpMenuTypes.SHIP then
    		self:OnShipPopUpMenu( iParam0 )
    	else
    		sys.log( "UI.HangarWnd:F_OnEventListActivateRecord()[ERROR]: unhandled pop-up menu type: \"%s\"", tostring( menuType ) )
    	end

	end

end  


--
function UI.HangarWnd:OnShipPopUpMenu( recordIdx )

	local data = UI.PopUpMenuWnd:GetRecordData( recordIdx )
	if not data then
		sys.log( "UI.HangarWnd:OnShipPopUpMenu()[ERROR]: cannot find pop-up menu data for record %d", recordIdx )
		return
	end

	if data.slotType == UI.popUpMenuSlotTypes.BATTLE_SLOT then

		if self.prepareState == self.prepareStates.NONE then

    		if self.menuTab == self.menuTabs.SHIPS then
    			UI.ShipsTreeWnd:ChangeShipInBattleSlot( data.slotIdx, data.vid, true )
    		else
    			self:ChangeShipInBattleSlot( data.slotIdx, data.vid )
    		end

		else
			sys.log( "UI.HangarWnd:OnShipPopUpMenu()[ERROR]: cannot change ship in battle slot while matchmaking is in process" )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_PREVIEW then

		self:ShowShipPreview( data.defName )

	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_STRIP_EQUIPMENT then
	
		local shipItem = UI:GetShipItem( data.vid )
		if shipItem then
		
			-- автоген-модули не могут быть просто так сняты, для них нужна специальная процедура, поэтому сначала показываем специальное окно для них
			--[[
			local autogenItems = {}
			for slotIdx, iid in pairs( shipItem.equipModules ) do
				if iid ~= UI.INVALID_U64_ID and UI:GetAutogenInventoryItem( iid ) then
					table.insert( autogenItems, { iid = iid, actions = UI.AutogenUnequipWnd.actions.DESTROY + UI.AutogenUnequipWnd.actions.DISMNANTLE } )
				end
			end
			
			if next( autogenItems ) then
														  можно отказаться от снятия отдельных автоген-модулей
				UI.AutogenUnequipWnd:Setup( autogenItems, UI.AutogenUnequipWnd.cancelModes.CONTINUE, self:GetName(), { fnName = "StripEquipment", params = { data.vid } } )
				UI.AutogenUnequipWnd:Show()
			else
				self:StripEquipment( data.vid )
			end
			]]
			self:StripEquipment( data.vid )

		else
			sys.log( "UI.HangarWnd:OnShipPopUpMenu()[ERROR]: SHIP_STRIP_EQUIPMENT - cannot find ship item" )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_SELL then

		if not UI:IsShipInMatchmakingByVid( data.vid ) then

    		local shipItem = UI:GetShipItem( data.vid )
    		if shipItem then
			
				local shipInvItem = UI:CreateInvItem( UI.invItemTypes.SHIP, shipItem.defName, nil, 1, nil, nil, shipItem )
			
				-- если на корабле есть установленные автоген-модули, то его нельзя продать, поэтому сначала снимаем их через специальное окно
				local autogenItems = {}
				for slotIdx, iid in pairs( shipItem.equipModules ) do
					if iid ~= UI.INVALID_U64_ID and UI:GetAutogenInventoryItem( iid ) then
						table.insert( autogenItems, { iid = iid, actions = UI.AutogenUnequipWnd.actions.DESTROY + UI.AutogenUnequipWnd.actions.DISMNANTLE } )
					end
				end
				
				if next( autogenItems ) then
					UI.AutogenUnequipWnd:Setup( autogenItems, UI.AutogenUnequipWnd.cancelModes.BREAK, self:GetName(), { fnName = "LaunchSellTradeWnd", params = { shipInvItem } } )
					UI.AutogenUnequipWnd:Show()
				else
					self:LaunchSellTradeWnd( shipInvItem )
				end

    		else
    			sys.log( "UI.HangarWnd:OnShipPopUpMenu()[ERROR]: SHIP_SELL - cannot find ship item" )
    		end

		else
			sys.log( "UI.HangarWnd:OnShipPopUpMenu()[ERROR]: cannot sell ship - ship is in matchmaking queue" )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_REMOVE_FROM_QUEST_SLOT then

		if UI.ShipsTreeWnd:IsOnScreen() then
			UI.ShipsTreeWnd:RemoveQuestShip( data.vid )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.GO_TO_SHIP_QUEST then

		UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.FREE_SPACE_MAP, true, false )
		UI.GameplayPveMapWnd:ShowQuest( data.questId, UI.questTypes.SHIP )

	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_RECRAFT then

		local shipItem = UI:GetShipItem( data.vid )
		if shipItem then

			local launchData = nil

			if self.menuTab == self.menuTabs.SHIPS then

				launchData = {}

				launchData.bShipsTree			= true
                launchData.shipQuestId			= UI.ShipsTreeWnd:GetShipQuest()
				launchData.shipsTreeLaunchData	= UI.ShipsTreeWnd:GetLaunchData()
				launchData.selectedShips		= launchData.shipQuestId ~= -1 and UI.ShipsTreeWnd:GetQuestShips()
				
			end

			UI.HangarWnd:ShowShipCraft( shipItem.defName, launchData )

		else
			sys.log( "UI.HangarWnd:OnShipPopUpMenu()[ERROR]: cannot find ship item" )
		end

	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_UPGRADE then

		self:TryUpgradeShip( data.vid )

	elseif data.slotType == UI.popUpMenuSlotTypes.SHOW_SHIP_EQUIPMENT then

		self:ShowShipEquipment( data.vid )
		
	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_TEST_DRIVE then

		UI:LaunchTestDrive( data.defName )
		
	elseif data.slotType == UI.popUpMenuSlotTypes.SHIP_UPGRADE_ITEMS then
		
		if not UI:IsWaitingRequests() then
	
			local numLevelsTotal = 0
			for itemIdx, info in pairs( data.itemsForUpgrade ) do
				numLevelsTotal = numLevelsTotal + info.numLevels
			end
			
			if numLevelsTotal == 1 then
			
				-- окно апгрейда сделает апгрейд самостоятельно, дополнительных действий здесь больше не требуется
				self:LaunchUpgradeItemWnd( data.itemsForUpgrade[ 1 ].iid )
				
			else
			
				local data =
				{
					itemsForUpgrade	= UI:CopyTable2( data.itemsForUpgrade ),
					numUpgrades		= numLevelsTotal,
					price			= data.totalPrice,
				}
				
				self:LaunchBuyWnd( UI.BuyWnd.modes.UPGRADE_ITEMS_MULTI, data )
				
			end
			
		end
		
	else
		sys.log( "UI.HangarWnd:OnShipPopUpMenu()[ERROR]: unhandled slot type: \"%s\"", tostring( data.slotType ) )
	end

end


--
function UI.HangarWnd:ReloadShop()

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ReloadShop()[ERROR]: not on screen" )
		return
	end

	if self.bWaitingStore then
		sys.log( "UI.HangarWnd:ReloadShop()[WARNING]: still waiting previous request" )
	end
	
	self.bShopNeedReload = false

	if _G.GameStore_ForceReload() then
		self.bWaitingStore = true
		self:UpdateWaitingWnd()
	end

end


--
function UI.HangarWnd:UpdateShipsMenuBtnSale()

	local recordIdx = UI.Hangar_MenuWnd:GetRecordForMenuTab( self.menuTabs.SHIPS )
	local data = UI.Hangar_MenuWnd:GetRecordData( recordIdx )

	local bSaleOld = data.bSale
	data.bSale = UI:HasSaleShips()

	if data.bSale ~= bSaleOld then

    	local shipsMenuBtn = UI.Hangar_MenuWnd:GetButtonForRecord( recordIdx )
    	if shipsMenuBtn then
    		shipsMenuBtn:UpdateOnSaleChanged()
    	end		

	end

end


--
function UI.HangarWnd:UpdatePreviewShipControls()

	if self.menuTab == self.menuTabs.SHIP_PREVIEW then
		local localizedShipName = UI:GetEntityLocalizedNameByDef( self.previewShipDefName, true, false, false )
		self:SetText( localizedShipName, self.layers.PREVIEW_SHIP_NAME )
	else
		self:SetText( "", self.layers.PREVIEW_SHIP_NAME )
	end

end


--
function UI.HangarWnd:ShowDebriefingOW( data )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowDebriefingOW()[ERROR]: not on screen" )
		return
	end

	UI.DebriefingOWWnd:Setup( data )
	UI.DebriefingOWWnd:Show()	

end


--
function UI.HangarWnd:ShowDebriefing( data )

	if not self:IsOnScreen() then
		sys.log( "UI.HangarWnd:ShowDebriefing()[ERROR]: not on screen" )
		return
	end

	UI.DebriefingWnd:Setup( data.gameResult, data.lootItems )
	UI.DebriefingWnd:Show()	

end


--
function UI.HangarWnd:DoSellShip( vid )

	self.sellShipRequestId = _G.GameStore_SellVessel( vid )

	if self.sellShipRequestId ~= 0 then

		UI:AddWaitingRequest( self.sellShipRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )

	else
		self:ShowMsgOnSellShipError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.HangarWnd:OnShipCustomizationChanged( vid )

	-- если корабль в данный момент рассматривается в окне наклеек, то наклейки на нем полностью управляются экраном наклеек,
	-- и здесь, соответственно, не трогаются

	if self.menuTab == self.menuTabs.STICKERS then

		local selShipItem = self:GetSelShipItem()
		if selShipItem and selShipItem.vid == vid then
			return
		end

	end

	local slotIdx = self:GetShipSlotByVid( vid )
	if slotIdx ~= -1 then

    	local shipEntId = self.shipEntIds[ slotIdx ]

    	if shipEntId ~= nil and shipEntId ~= -1 then
    		UI:PreviewShipCustomizations( vid, shipEntId )
		end

	end

end


--
function UI.HangarWnd:CheckShowExpiredMsg()

	if	UI.MarketingWnd:IsOnScreen() or
		UI.DailyRewardWnd:IsOnScreen() or
		UI.BattlePassWnd:IsOnScreen() or
		UI.RoleInfoWnd:IsOnScreen() or
		UI.Hangar_TradeWnd:IsOnScreen() or
		UI.Hangar_BuyWithInventoryWnd:IsOnScreen() or
		UI.Hangar_BuyWnd:IsOnScreen() or		
		UI.Tutorial:IsActive() or
		self.buyRequestId ~= 0 then
			return
	end

	-- лицензия

	if _G.MasterServer_IsPremiumTimeExpired() then

		if not UI:IsTrueEx( UI.serverData.userData.premiumExpiredMsgShown ) then
		
			self.hMsgPremiumExpired = UI:MessageBox( UI:GetStringByName( "buyWnd_premiumExpired_caption" ), UI:GetStringByName( "buyWnd_premiumExpired_msg" ), UI.MBS_YES_NO )

			UI.serverData.userData.premiumExpiredMsgShown = true
			UI:SaveServerUserData()

			return

		end

	end

end


--
function UI.HangarWnd:UpdateExpiredMsgTimer( dt )

	if self.expiredMsgTimer == -1 then
		return
	end

	self.expiredMsgTimer = self.expiredMsgTimer - dt
	if self.expiredMsgTimer <= 0 then

		self.expiredMsgTimer = -1
		self:CheckShowExpiredMsg()

	end

end


--
function UI.HangarWnd:F_OnEventWndHided( hSender, hWnd )

	if not self:IsOnScreen() then
		return
	end

	if	hWnd == UI.MarketingWnd:GetUiHandle() or
		hWnd == UI.DailyRewardWnd:GetUiHandle() or
		hWnd == UI.RoleInfoWnd:GetUiHandle() or
		hWnd == UI.Hangar_TradeWnd:GetUiHandle() or
		hWnd == UI.Hangar_BuyWithInventoryWnd:GetUiHandle() or
		hWnd == UI.Hangar_BuyWnd:GetUiHandle() then

			self.expiredMsgTimer = self.EXPIRED_MSG_DELAY
	end

	if hWnd == UI.TourWnd:GetUiHandle() then
		self:UpdateStartBtnState()
	end

	if hWnd == self.hMsgAcceptSquadInvite then
		self:ResetSquadFinderGroupDescLink()
	end
	
	if hWnd == UI.DebriefingWnd:GetUiHandle() then
		self:SetNotificationsMode( self.notificationsModes.POP_UPS )
		UI.NotificationsPopUpsWnd:CheckUnshownNotifications()
	end

end


--
function UI.HangarWnd:F_OnEventTutorialStop( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end
	
	self.expiredMsgTimer = self.EXPIRED_MSG_DELAY

end


--
function UI.HangarWnd:UpdateTimePos()

	local work1Effect = UI:GetEffectFromLayer( self, self.layers.WORK_1_EFFECT )
	if not work1Effect then
		return
	end

	local bIsStats = UI.HangarClientStatsWnd:IsChildOf( self ) and UI.HangarClientStatsWnd:IsStatsVisible()

	local locator = bIsStats and self.effectInfo.work1.timeLocatorIsStats or self.effectInfo.work1.timeLocatorNoStats

	local locatorPos = work1Effect:GetObjPos( locator )
	local effectPos = work1Effect:GetPos()

	local timePos = effectPos + locatorPos

	self:SetLayerLeft( timePos.x, self.layers.TIME )
	self:SetLayerTop( timePos.y, self.layers.TIME )

end


--
function UI.HangarWnd:CheckShowUndockError()

	if UI.undockError == _G.MasterServer.ZoneInstanceTravelResult.ZITR_OK then
		return
	end

	UI:ShowMsgOnUndockError( UI.undockError )

	UI.undockError = _G.MasterServer.ZoneInstanceTravelResult.ZITR_OK

end


--
function UI.HangarWnd:ShowMsgOnCancelSquadInvitesError( result )

	UI:ShowErrorMsg( "squad_inviteError", result, "_G.MasterServer.SquadOpResult" )

end


--
function UI.HangarWnd:OnAccountAurasChanged()
	
	self:UpdateShipsMenuBtnSale()
	UI.Hangar_BundlesBtn:OnAccountAurasChanged()

	if UI.BuyBundleWnd:IsOnScreen() and UI.BuyBundleWnd:GetMainWndName() == self:GetScriptTableName() then
		if UI:IsItemLockedByAccountAura( UI.BuyBundleWnd:GetDefName() ) then
			UI.BuyBundleWnd:Hide()
		end
	end

end


--
function UI.HangarWnd:TryUpgradeShip( vid )

	local shipItem = UI:GetShipItem( vid )
	if not shipItem then
		sys.log( "UI.HangarWnd:TryUpgradeShip()[ERROR]: cannot find ship item" )
		return
	end

	if UI:IsShipOnShipQuest( shipItem ) then
		sys.log( "UI.HangarWnd:TryUpgradeShip()[ERROR]: ship is on quest" )
		return
	end

	if UI:IsShipInBattle( shipItem ) then
		sys.log( "UI.HangarWnd:TryUpgradeShip()[ERROR]: ship is in battle" )
		return
	end

	local needExp	= UI:GetShipUpgradeCost( shipItem )
	local shipExp	= UI:GetShipExp( shipItem )

	local prices = {}

	if shipExp >= needExp then
		prices.synergy			= needExp
		prices.commonSynergy	= 0
	else
		prices.synergy			= shipExp
		prices.commonSynergy	= needExp - shipExp
	end

	UI.ClanConfirmWnd:Show( UI.ClanConfirmWnd.Modes.SHIP_UPGRADE, UI.EquipmentShipUpgrade_Btn:FormatTooltip( shipItem ).text, { prices }, { ownerWnd = self, vid = vid } )
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.HangarWnd:DoUpgradeShip( vid )

	if self.shipUpgradeRequestId ~= 0 then
		sys.log( "UI.HangarWnd:DoUpgradeShip()[ERROR]: still waiting for another request" )
	end

	self.shipUpgradeRequestId = _G.GameStore_VesselLevelUp( vid )

	if self.shipUpgradeRequestId == 0 then
		self:ShowMsgOnShipUpgradeError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

	UI.ShipsTreeWnd:OnHangarWaitingShipUpgradeChanged()

end


--
function UI.HangarWnd:ShowMsgOnShipUpgradeError( result )

	UI:ShowErrorMsg( "msg_shipUpgradeError", result, "_G.GameStore.StoreBuyResult" )

end


--
function UI.HangarWnd:OnVesselExpChanged( vid )

	for slotIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do

		local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )
		if data.shipItem and data.shipItem.vid == vid then

			local slotWnd = UI.Hangar_BattleListWnd:GetButtonForRecord( slotIdx )
			if slotWnd then
				slotWnd:OnVesselExpChanged()
			end
			
			break

		end
	end

end


--
function UI.HangarWnd:OnShipFullUpdate( vid )

	local battleSlotIdx = -1

	for recordIdx = 1, UI.Hangar_BattleListWnd:GetNumRecords() do

		local data = UI.Hangar_BattleListWnd:GetRecordData( recordIdx )
		if data.shipItem and data.shipItem.vid == vid then

			data.shipItem = UI:GetShipItem( vid, true )
			UI.Hangar_BattleListWnd:SetRecordData( data, recordIdx )

			battleSlotIdx = recordIdx

			break

		end

	end

	local selShipItem = self:GetSelShipItem()
	if selShipItem and selShipItem.vid == vid then
		self:OnSelShipChanged()
	end

	if battleSlotIdx ~= -1 then
		self:UpdateDamageMsg()
		self:UpdateInBattleMsg()
		self:UpdateStartBtnState()
	end

	local slotIdx = self:GetShipSlotByVid( vid )
	if slotIdx ~= -1 then
		self:UpdateShipEntInSlot( slotIdx )
	end

end


-- отображается ли в данном слоте ангара "кукла" одного из кораблей, стоящих в боевых слотах
function UI.HangarWnd:IsShipInSlotFromBattleSlot( slotIdx )	

	if slotIdx == self:GetSelShipSlot() then
		return self.previewShipDefName == "" and self.customShipVid == UI.INVALID_U64_ID
	else
		return true
	end	

end


--
function UI.HangarWnd:GetShipItemInSlot( slotIdx )
                  
	if slotIdx == self:GetSelShipSlot() then
		return self:GetSelShipItem()
	else
    	local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )
    	return data and data.shipItem		
	end

end


--
function UI.HangarWnd:GetShipDefNameInSlot( slotIdx )
                  
	if slotIdx == self:GetSelShipSlot() then
		return self:GetSelShipDefName()
	else
    	local data = UI.Hangar_BattleListWnd:GetRecordData( slotIdx )
    	return data and data.shipItem and data.shipItem.defName or ""
	end

end


--
function UI.HangarWnd:GetShipSlotByVid( vid )

	for slotIdx = 1, UI.serverData.battleSlotsMax do

		local shipItem = self:GetShipItemInSlot( slotIdx )
		if shipItem and shipItem.vid == vid then
			return slotIdx
		end

	end

	return -1                  

end


--
function UI.HangarWnd:SetCustomShip( vid, bForceUpdate )

	if type( vid ) ~= "userdata" then
		sys.log( "UI.HangarWnd:SetCustomShip()[ERROR]: invalid type of the 1-st parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end
	
	if vid == UI.INVALID_U64_ID then
		sys.log( "UI.HangarWnd:SetCustomShip()[ERROR]: invalid vid" )
		return
	end
	
	if bForceUpdate ~= nil then
		if type( bForceUpdate ) ~= "boolean" then
			sys.log( "UI.HangarWnd:SetCustomShip()[ERROR]: invalid type of the 2-nd parameter (\"bForceUpdate\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bForceUpdate ) )
			bForceUpdate = nil
		end
	end
	
	if bForceUpdate == nil then
		bForceUpdate = false
	end
	
	if self.previewShipDefName ~= "" then
		sys.log( "UI.HangarWnd:SetCustomShip()[ERROR]: in preview" )
		return
	end
	
	if vid == self.customShipVid and not bForceUpdate then
		return
	end
	
	self:ResetCustomShip()	
	
	local shipItem = UI:GetShipItem( vid, false )
	if not shipItem then
		sys.log( "UI.HangarWnd:SetCustomShip()[ERROR]: cannot find ship item" )
		return
	end

	-- если данный корабль уже стоит в одном из боевых слотов, то просто ставится выделение на этот слот
	local battleSlotIdx = UI:GetShipBattleSlot( shipItem )
	if battleSlotIdx ~= -1 then		
	
		self:SelectBattleSlot( battleSlotIdx )

	else
	
    	self.customShipVid = vid		
		
		if self.selShipSlotIdx == -1 then
			self.selShipSlotIdx = 1
		end   	
		
		self:UpdateShipEntInSlot( self.selShipSlotIdx )

		if self:GetSelBattleSlot() ~= -1 then
			self:SelectBattleSlot( -1 )
		else
			self:OnSelShipChanged()
		end
		
	end

end


--
function UI.HangarWnd:ResetCustomShip( bCallFromBattleList )

	if self.customShipVid == UI.INVALID_U64_ID then
		return
	end
	
	self.customShipVid = UI.INVALID_U64_ID	
	
	if self.previewShipDefName == "" then
		
		if not bCallFromBattleList then
		
			if self:GetSelBattleSlot() ~= self.selShipSlotIdx then
				self:SelectBattleSlot( self.selShipSlotIdx )
			else
				self:OnSelShipChanged()
			end
			
		end

		self:UpdateShipEntInSlot( self.selShipSlotIdx )
		
	end
	
end


--
function UI.HangarWnd:ResetPreviewShip( bCallFromBattleList )

	if self.previewShipDefName == "" then
		return
	end
	
	self.previewShipDefName			= ""
	self.previewShipLaunchData		= nil
	
	if not bCallFromBattleList then
	
		if self.customShipVid ~= UI.INVALID_U64_ID then
		
			self:SetCustomShip( self.customShipVid, true )
			
		else

			local selShipSlotIdx = self.selShipSlotIdx		

            self:UpdateBattleSlots()

			if self:GetSelBattleSlot() ~= selShipSlotIdx then
				self:SelectBattleSlot( selShipSlotIdx )
			else
				self:OnSelShipChanged()
			end
			
		end
		
	end

	self:UpdateShipEntInSlot( self.selShipSlotIdx )
	
end


--
function UI.HangarWnd:MakePreviewLaunchData()

	local previewShipLaunchData =
	{
		menuTab = self.menuTab
	}

	if self.menuTab == self.menuTabs.SHIPS then
		
		previewShipLaunchData.launchData = UI.ShipsTreeWnd:GetLaunchData()

		local shipQuestId = UI.ShipsTreeWnd:GetShipQuest()
		if shipQuestId ~= -1 then

			previewShipLaunchData.shipQuestId	= shipQuestId

			if not UI:IsShipQuestTaken( shipQuestId ) then
				previewShipLaunchData.vids = UI.ShipsTreeWnd:GetQuestShips()
			end

		end

		local bundleDefName, bundleData = UI.ShipsTreeWnd:GetOpenBundle()
		if bundleDefName ~= "" then

			previewShipLaunchData.bundleDefName	= bundleDefName
			previewShipLaunchData.bundleData	= bundleData

		end

	elseif self.menuTab == self.menuTabs.MARKETING then
	
		local marketingMode = UI.MarketingWnd:GetMode()

		if marketingMode == UI.MarketingWnd.modes.BUNDLES then

			previewShipLaunchData.bBundles		= true
			previewShipLaunchData.bundleDefName	= UI.Marketing_BundlesWnd:GetSelBundle()
			previewShipLaunchData.launchData	= UI.MarketingWnd:GetLaunchData()
			
		elseif marketingMode == UI.MarketingWnd.modes.ACTIONS then
		
			previewShipLaunchData.bActions		= true
			previewShipLaunchData.selActionId	= UI.Marketing_ActionsWnd:GetSelActionId()
			previewShipLaunchData.launchData	= UI.MarketingWnd:GetLaunchData()

		else
			sys.log( "UI.HangarWnd:MakePreviewLaunchData()[ERROR]: unhandled marketing mode %d", UI.MarketingWnd:GetMode() )
		end

	elseif self.menuTab == self.menuTabs.MAIN then

		local selInfo = UI.EquipmentWnd:GetSelShipSlotInfo()
		if selInfo then
			previewShipLaunchData.selInfo = selInfo
		end

		local bundleDefName, bundleData = UI.EquipmentWnd:GetOpenBundle()
		if bundleDefName ~= "" then

			previewShipLaunchData.bundleDefName	= bundleDefName
			previewShipLaunchData.bundleData	= bundleData

		end

	elseif self.menuTab == self.menuTabs.SHOP then

		previewShipLaunchData.restoreData = UI.ShopWnd:GetRestoreStateData()

	elseif self.menuTab == self.menuTabs.PROFILE_NEW then
		
		previewShipLaunchData.uid			= UI.ProfileWnd_new:GetUid()
		previewShipLaunchData.mode			= UI.ProfileWnd_new:GetMode()
		previewShipLaunchData.restoreData	= UI.ProfileWnd_new:GetRestoreStateData()
		previewShipLaunchData.launchData	= UI.ProfileWnd_new:GetLaunchData()
		
	elseif previewShipLaunchData.menuTab == self.menuTabs.SHIP_PREVIEW then
	
		previewShipLaunchData.previewShipDefName = self.previewShipDefName
	
	elseif previewShipLaunchData.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
	
		previewShipLaunchData.previewShipVid			= self:GetSelShipItem().vid
		previewShipLaunchData.previewShipLaunchData		= UI:CopyTable2( self.previewShipLaunchData )
		previewShipLaunchData.equipmentSelShipSlotInfo	= UI.EquipmentWnd:GetSelShipSlotInfo()
		
	elseif previewShipLaunchData.menuTab == self.menuTabs.BATTLE_PASS then
		
		previewShipLaunchData.restoreData	= UI.BattlePassWnd:GetRestoreStateData()
		previewShipLaunchData.launchData	= UI.BattlePassWnd:GetLaunchData()

	elseif self.menuTab ~= self.menuTabs.EMPTY then

		sys.log( "UI.HangarWnd:MakePreviewLaunchData()[ERROR]: unhandled context; cannot restore data after preview finish" )

	end
	
	return previewShipLaunchData

end


--
function UI.HangarWnd:GetPreviewLaunchData()

	return self.previewShipLaunchData

end


--
function UI.HangarWnd:ReturnFromPreview()

	local bHandled = false
	
	if not self.previewShipLaunchData then
		sys.log( "UI.HangarWnd:ReturnFromPreview()[ERROR]: no previewShipLaunchData" )
		return
	end
	
	-- при установке новой закладки эта переменная обнуляется, а ее нужно использовать и после этого
	local previewShipLaunchData = self.previewShipLaunchData
	
	if previewShipLaunchData.menuTab == self.menuTabs.SHIPS then

		if previewShipLaunchData then

			if previewShipLaunchData.shipQuestId then
				UI.HangarWnd:OpenShipsForQuest( previewShipLaunchData.shipQuestId, previewShipLaunchData.launchData, previewShipLaunchData.vids, true )
			else
				self:TrySetMenuTab( previewShipLaunchData.menuTab, true, false )
				UI.ShipsTreeWnd:SetLaunchData( previewShipLaunchData.launchData )
			end

			if previewShipLaunchData.bundleDefName then
				UI.ShipsTreeWnd:OpenBundle( previewShipLaunchData.bundleDefName, previewShipLaunchData.bundleData )
			end

			bHandled = true

		end

	elseif previewShipLaunchData.menuTab == self.menuTabs.MARKETING then

		if previewShipLaunchData then

			if previewShipLaunchData.bBundles == true then
				self:OpenBundle( previewShipLaunchData.bundleDefName, true, previewShipLaunchData.launchData )
				bHandled = true
				
			elseif previewShipLaunchData.bActions == true then
				self:OpenAction( previewShipLaunchData.selActionId, true, previewShipLaunchData.launchData )
				bHandled = true

			else
				sys.log( "UI.HangarWnd:ReturnFromPreview()[ERROR]: unhandled format of previewShipLaunchData" )
			end

		end

	elseif previewShipLaunchData.menuTab == self.menuTabs.MAIN then

		if previewShipLaunchData then

			self:TrySetMenuTab( previewShipLaunchData.menuTab, true, false )

			if previewShipLaunchData.selInfo then
				UI.EquipmentWnd:SelectShipSlotByInfo( previewShipLaunchData.selInfo )
			else
				sys.log( "UI.HangarWnd:ReturnFromPreview()[ERROR]: no selected slot info stored" )
			end

			if previewShipLaunchData.bundleDefName then
				UI.EquipmentWnd:OpenBundle( previewShipLaunchData.bundleDefName, previewShipLaunchData.bundleData )
			end

			bHandled = true

		end

	elseif previewShipLaunchData.menuTab == self.menuTabs.SHOP then

		self:TrySetMenuTab( previewShipLaunchData.menuTab, true, false )

		if previewShipLaunchData then
			UI.ShopWnd:RestoreState( previewShipLaunchData.restoreData )
		end

		bHandled = true

	elseif previewShipLaunchData.menuTab == self.menuTabs.SHIP_PREVIEW then
	
		UI.HangarWnd:ShowShipPreview( self.previewShipLaunchData.previewShipDefName )
		bHandled = true
		
	elseif previewShipLaunchData.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
	
		UI.HangarWnd:ShowEquipmentPreview( previewShipLaunchData.previewShipVid, nil, previewShipLaunchData.previewShipLaunchData )
		
		if UI.EquipmentWnd:IsOnScreen() then
			UI.EquipmentWnd:SelectShipSlotByInfo( previewShipLaunchData.equipmentSelShipSlotInfo )
		end
		
		bHandled = true
		
	elseif previewShipLaunchData.menuTab == self.menuTabs.PROFILE_NEW then

		self:ShowProfile( previewShipLaunchData.uid, UI:Val2Key( UI.ProfileWnd_new.modes, previewShipLaunchData.mode ), false, previewShipLaunchData.restoreData, previewShipLaunchData.launchData )
		bHandled = true
		
	elseif previewShipLaunchData.menuTab == self.menuTabs.BATTLE_PASS then
		
		if _G.MasterServer_BattlePassIsActive() then
			self:ShowBattlePass( true, previewShipLaunchData.launchData, previewShipLaunchData.restoreData )
		else
			self:TrySetMenuTab( self.menuTabs.MAIN, true, false )
		end

		bHandled = true

	end

	if not bHandled then
		if previewShipLaunchData.menuTab ~= -1 then
			self:TrySetMenuTab( previewShipLaunchData.menuTab, true, false )
		end
	end

end


--
function UI.HangarWnd:ShowEquipmentPreview( vid, iid, previewShipLaunchData )

	if type( vid ) ~= "userdata" then
		sys.log( "UI.HangarWnd:ShowEquipmentPreview()[ERROR]: invalid type of the 1-st parameter (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
		return
	end

	if vid == UI.INVALID_U64_ID then
		sys.log( "UI.HangarWnd:ShowEquipmentPreview()[ERROR]: invalid vid" )
		return
	end

	local shipItem = UI:GetShipItem( vid, false )
	if not shipItem then
		sys.log( "UI.HangarWnd:ShowEquipmentPreview()[ERROR]: ship is not bought" )
		return
	end

	if iid ~= nil then
    	if type( iid ) ~= "userdata" then
    		sys.log( "UI.HangarWnd:ShowEquipmentPreview()[ERROR]: invalid type of the 2-nd parameter (\"iid\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( iid ) )
			iid = nil
    	end
	end

	if iid == nil then
		iid = UI.INVALID_U64_ID
	end
	
	if previewShipLaunchData ~= nil then
		if type( previewShipLaunchData ) ~= "table" then
			sys.log( "UI.HangarWnd:ShowEquipmentPreview()[ERROR]: invalid type of the 3-rd parameter (\"previewShipLaunchData\"); \"table\" or \"nil\" expected, got \"%s\"", type( previewShipLaunchData ) )
			previewShipLaunchData = nil
		end
	end
	
	local curPreviewShipLaunchData = self:MakePreviewLaunchData()
	
	if self.previewShipDefName ~= shipItem.defName or self.menuTab ~= self.menuTabs.EQUIPMENT_PREVIEW then
		
		self:ResetPreviewShip()
		
		self:TrySetMenuTab( self.menuTabs.EQUIPMENT_PREVIEW, true, false, { fn = UI.HangarWnd.ShowEquipmentPreview, params = { self, vid, iid, previewShipLaunchData } } )

		if self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then

			self.previewShipDefName = shipItem.defName
			
			if self.selShipSlotIdx == -1 then
				self.selShipSlotIdx = 1
			end
			
			self:UpdateShipEntInSlot( self.selShipSlotIdx )

			if self:GetSelBattleSlot() ~= -1 then
				self:SelectBattleSlot( -1 )
			else
				self:OnSelShipChanged()
			end

		end
		
	end
	
	if self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
	
		if iid ~= UI.INVALID_U64_ID then
			if not UI:IsShipInBattle( shipItem ) and not UI:IsShipOnShipQuest( shipItem ) then
				UI.EquipmentWnd:ShowModule( iid )
			end
		end
		
		self.previewShipLaunchData = previewShipLaunchData or curPreviewShipLaunchData
		
	end

end 


--
function UI.HangarWnd:TryBuyBundle( bundleDefName )

	if self.buyRequestId ~= 0 then
		return
	end

	if type( bundleDefName ) ~= "string" then
		sys.log( "UI.HangarWnd:TryBuyBundle()[ERROR]: invalid type of the 1-st parameter (\"bundleDefName\"); \"string\" expected, got \"%s\"", type( bundleDefName ) )
		return
	end

	if UI:IsBundleContentFullyCollected( bundleDefName ) then
		sys.log( "UI.HangarWnd:TryBuyBundle()[ERROR]: bundle \"%s\" is considered to be fully collected", bundleDefName )
		UI:MessageBox( UI:GetStringByName( "msgBundleContentCollected_caption" ), UI:GetStringByName( "msgBundleContentCollected_text" ), UI.MBS_OK )
		return
	end

	local shopItem = UI:GetShopItemByDef( bundleDefName )
	if not shopItem then
		sys.log( "UI.HangarWnd:TryBuyBundle()[ERROR]: cannot find shop item for \"%s\"", bundleDefName )
		return
	end

	if UI:IsEnoughPlaceInInventoryForItem( bundleDefName ) then

		self:LaunchBuyTradeWnd( shopItem )

	else

		if UI:CanIncreaseInventory() then

			self.itemToBuy		= shopItem

			-- tODO проверка расширение автоген-инвентаря
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
function UI.HangarWnd:DoBuyBundle( shopItem )

	if self.buyRequestId ~= 0 then
		sys.log( "UI.HangarWnd:DoBuyBundle()[ERROR]: still is waiting for some other request" )
		return
	end

	local price, priceType = UI:GetBundleRealBuyPrice( shopItem )
	self.buyRequestId = _G.GameStore_Buy( shopItem.id, 1, priceType )

	if self.buyRequestId ~= 0 then
		UI:AddWaitingRequest( self.buyRequestId )
	else
		UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.HangarWnd:BuyInventory( inventoryLevels )

	if self.buyInventoryRequestId ~= 0 then
		self.itemToBuy = nil
		sys.log( "UI.HangarWnd:BuyInventory()[ERROR]: is still waiting for some other request" )
		return
	end

	if type( inventoryLevels ) ~= "table" or not next( inventoryLevels ) then
		self.itemToBuy = nil
		sys.log( "UI.HangarWnd:BuyInventory()[ERROR]: invalid \"inventoryLevels\" param" )
		return
	end

	local maxLevel = inventoryLevels[ #inventoryLevels ]
	self.buyInventoryRequestId = _G.GameStore_BuyInventoryExtension( maxLevel )

	if self.buyInventoryRequestId ~= 0 then
		UI:AddWaitingRequest( self.buyInventoryRequestId )
	else
    	self.itemToBuy = nil
    	UI:ShowMsgOnBuyError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


-- скрываются все окна, которые рисуются НАД ангаром и которые безопасно скрыть в любой момент без последствий;
-- используется при переходе по ссылке в окно магазина;
-- так как ссылка может быть в нотификации, а нотификации показываются поверх вообще всего и в любой момент,
-- то на экране в это время может быть что угодно

function UI.HangarWnd:HideOverlayWindows()

	UI.Gold2CreditsWnd:UnlinkFromParent()	
	UI.Yup2GoldWnd:UnlinkFromParent()
	UI.GoldArcWnd:UnlinkFromParent()
	UI.MenuWnd:UnlinkFromParent()
	UI.Hangar_BuyWnd:UnlinkFromParent()
	UI.MailCreateWnd:UnlinkFromParent()
	UI.OptionsWnd:UnlinkFromParent()
	UI.HelpWnd:UnlinkFromParent()
	UI.QuestInfoWnd:UnlinkFromParent()
	UI.ContextMenu:UnlinkFromParent()
	UI.PopUpMenuWnd:UnlinkFromParent()
	UI.ItemCraftSingleWnd:UnlinkFromParent()

	self:HideMail( false )
	self:HideSquadFinder( false )
	self:HideSquadWnd( false )
	self:SetNotificationsMode( self.notificationsModes.POP_UPS )

	-- проверка
	local child = UI.Root:GetLastChild()
	while child do

		if child == self then
			break
		end

		if UI:IsWndKindOf( child, "MsgBoxWnd" ) or UI:IsOverlayWnd( child ) then
			sys.log( "UI.HangarWnd:HideOverlayWindows()[WARNING]: not all overlay windows hided; last window is \"%s\"", child:GetName() )
		end

		child = child:GetPrevSibling()

	end

end


--
function UI.HangarWnd:ShowMsgOnEmmChangeReadyError()

	UI:ShowErrorMsg( "msg_emmChangeReadyError" )

end


--
function UI.HangarWnd:CheckShowAccountRankReadyMsg( oldExp, newExp )

	if newExp > oldExp then

		local rank = UI:GetPlayerAccountRank()
		local maxRank = UI:GetMaxAccountRank()
		
		if rank < maxRank then
		
			local nextRank = rank + 1
			if nextRank >= UI.MIN_RANK_UP_SHOW then
			
				local nextRankCost = UI:GetPlayerAccountRankExpCost( nextRank )
				if oldExp < nextRankCost and newExp >= nextRankCost then
					UI:MessageBox( UI:GetStringByName( "msg_newRankReady_caption" ), UI:GetStringByName( "msg_newRankReady_text" ), UI.MBS_OK )
				end
				
			end
			
		end

	end
	
end


--
function UI.HangarWnd:F_OnEventStartLevel( hSender, iParam0, iParam1, fParam0, fParam1 )
	
	if self.gameplay == ai.Gameplay.FREE_SPACE then
		self.bShowMapAfterFreeSpace = true
	end
	
	self.gameplay = _G.GetCurrentGameMode()
	
	if self:IsOnScreen() then
		if self.bShowMapAfterFreeSpace then
			self:TrySetMenuTab( self.menuTabs.FREE_SPACE_MAP, false, true )
			self.bShowMapAfterFreeSpace = true
		end
	end
	
end


--
function UI.HangarWnd:UpdateQuestsWnd()

	if self:CanShowQuests() then
		self:AddChild( UI.Hangar_QuestsWnd )
	else
		UI.Hangar_QuestsWnd:UnlinkFromParent()
	end

end


-- можно ли принципиально показывать квесты в данный момент
function UI.HangarWnd:CanShowQuests()

	if not UI.GameplayPveMapWnd:CanShowQuests() then
		return
	end

	local bWrongMenuTab =
		self.menuTab == self.menuTabs.STICKERS
		or self.menuTab == self.menuTabs.SHIP_PREVIEW
		or self.menuTab == self.menuTabs.SHIP_CRAFT
		or self.menuTab == self.menuTabs.SHIP_BUY
		or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW
		or self.menuTab == self.menuTabs.PROFILE_NEW
		or self.menuTab == self.menuTabs.BATTLE_PASS
		
	return not bWrongMenuTab

end


--
function UI.HangarWnd:UpdateCurrentEventInfoName()

	UI.Hangar_CurrentEventInfo_ShowWindowBtn:UpdateName()

end


--
function UI.HangarWnd:UpdateCurrentEventInfoVisibility()

	local bNeedShow = false
	
	if _G.MasterServer_BattlePassIsActive() or _G.MasterServer_GetLeadingAdvertInfo().isActive then
	
		local menuTabFit =
			not( self.menuTab == self.menuTabs.STICKERS
			or self.menuTab == self.menuTabs.SHIP_PREVIEW
			or self.menuTab == self.menuTabs.SHIP_CRAFT
			or self.menuTab == self.menuTabs.SHIP_BUY
			or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW
			or self.menuTab == self.menuTabs.PROFILE_NEW
			or self.menuTab == self.menuTabs.BATTLE_PASS )
			
		if menuTabFit then
			bNeedShow = true
		end

	end
		
	if bNeedShow then
		self:AddChild( UI.Hangar_CurrentEventInfoWnd )
	else
		UI.Hangar_CurrentEventInfoWnd:UnlinkFromParent()
	end

end


--
function UI.HangarWnd:UpdateBattleSlotsVisibility()

	if self.menuTab == self.menuTabs.MAIN or self.menuTab == self.menuTabs.EQUIPMENT_PREVIEW then
		self:AddChild( UI.Hangar_BattleListWnd )
	else
		UI.Hangar_BattleListWnd:UnlinkFromParent()
	end

end


--
function UI.HangarWnd:StripEquipment( vid )

	-- проверяем, что есть что снимать;
	-- если остался только автоген (а он мог остаться, т.к. игрок мог отказываться от снятия отдельных автоген-модулей),
	-- то не вызываем GameStore_StripEquipment(), т.к. эта функция не снимает автоген
	-- (автоген снимается ДО вызова этой функции в специальном окне)
	
	local shipItem = UI:GetShipItem( vid, false )
	if not shipItem then
		sys.log( "UI.HangarWnd:StripEquipment()[ERROR]: cannot find ship item" )
		return
	end

	local bHasNonAutogenEquipment = false

	for slotId, iid in pairs( shipItem.equipModules ) do
		if iid ~= UI.INVALID_U64_ID and not UI:GetAutogenInventoryItem( iid ) then
			bHasNonAutogenEquipment = true
			break
		end
	end

	if not bHasNonAutogenEquipment then
		for slotId, ammoInfo in pairs( shipItem.equipAmmo ) do
			if ammoInfo.def ~= "" then
				bHasNonAutogenEquipment = true
				break
			end
		end
	end

	if not bHasNonAutogenEquipment then
		return
	end

	self.shipStripRequestId = _G.GameStore_StripEquipment( vid )

	if self.shipStripRequestId ~= 0 then
		UI:AddWaitingRequest( self.shipStripRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
	end

end


--
function UI.HangarWnd:LaunchUpgradeItemWnd( iid )

	UI.Hangar_UpgradeItemWnd:Setup( iid, UI.INVALID_U64_ID, -1, true )
	UI.Hangar_UpgradeItemWnd:Show()
	UI:PlayGlobalSound( self.sounds.tradeWndShow )

end


--
function UI.HangarWnd:TryUpgradeItem( itemsForUpgrade )

	if UI:IsWaitingRequests() then
		sys.log( "UI.HangarWnd:TryUpgradeItem()[ERROR]: still waiting for another request" )
		return
	end
	
	if type( itemsForUpgrade ) ~= "table" then
		sys.log( "UI.HangarWnd:TryUpgradeItem()[ERROR]: invalid type of the 1-st param ('itemsForUpgrade'); 'table' expected, got \"%s\"", type( itemsForUpgrade ) )
		return
	end
	
	for idx, info in pairs( itemsForUpgrade ) do
	
		if type( idx ) ~= "number" or type( info ) ~= "table" then
			sys.log( "UI.HangarWnd:TryUpgradeItem()[ERROR]: invalid format od table 'itemsForUpgrade'; <number>=<table> expected, got <%s>=<%s>", type( idx ), type( info ) )
			return
		end
		
		if type( info.iid ) ~= "userdata" then
			sys.log( "UI.HangarWnd:TryUpgradeItem()[ERROR]: invalid type of 'iid' at index %d; 'userdata' expected, got '%s'", idx, type( info.iid ) )
			return
		end
		
		if type( info.numLevels ) ~= "number" then
			sys.log( "UI.HangarWnd:TryUpgradeItem()[ERROR]: invalid type of 'numLevels' at index %d; 'number' expected, got '%s'", idx, type( info.numLevels ) )
			return
		end
		
	end

	self.upgradeItemRequestId = _G.GameStore_UpgradeItems( itemsForUpgrade )
	
	if type( self.upgradeItemRequestId ) ~= "number" then
		self.upgradeItemRequestId = 0
	end

	if self.upgradeItemRequestId ~= 0 then
		
		UI:AddWaitingRequest( self.upgradeItemRequestId )
		UI:AddWaitingRequest( UI.INVENTORY_REQUEST_ID )
		
		UI:PlayGlobalSound( self.sounds.upgrade )

	else
		self:ShowMsgOnUpgradeItemError( _G.GameStore.StoreBuyResult.SBR_ERROR )
	end

end


--
function UI.HangarWnd:ShowMsgOnUpgradeItemError( result )

	UI:ShowErrorMsg( "msg_upgradeError", result, "_G.GameStore.StoreBuyResult" )

end


-- ------------------------------------------------------------------------
-- UI.Hangar_MenuWnd
-- ------------------------------------------------------------------------

UI.Hangar_MenuWnd = {}
local hm = UI.Hangar_MenuWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_MenuWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "Hangar_MenuWnd",
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
				defName 			= "hangar_menu",
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

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Hangar_MenuWnd:IsTabDisabled( menuTab )

	local bDisabled = false

	local recordIdx = self:GetRecordForMenuTab( menuTab )
	if recordIdx ~= -1 then

		local data = self:GetRecordData( recordIdx )	
		bDisabled = data.bLocked
		
	end

	return bDisabled

end


--
function UI.Hangar_MenuWnd:GetButtonForMenuTab( menuTab )

	local btn = nil

	local recordIdx = self:GetRecordForMenuTab( menuTab )
	if recordIdx ~= -1 then
		btn = self:GetButtonForRecord( recordIdx )
	end

	return btn

end


--
function UI.Hangar_MenuWnd:GetRecordForMenuTab( menuTab )

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		if data.menuTab == menuTab then
			return recordIdx
		end

	end

	return -1

end


--
function UI.Hangar_MenuWnd:GetMenuTabForRecord( recordIdx )

	local menuTab = -1

	if recordIdx >= 1 and recordIdx <= self:GetNumRecords() then
		local data = self:GetRecordData( recordIdx )
		menuTab = data.menuTab
	end

	return menuTab

end


-- ------------------------------
-- const
-- ------------------------------

hm.btnPrototypeName = "Hangar_MenuBtn"

hm.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "menu_btn_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

hm.MAX_SLOTS = 5

-- ------------------------------
-- vars
-- ------------------------------

hm.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- ------------------------------------------------------------------------
-- UI.Hangar_MenuBtn
-- ------------------------------------------------------------------------

UI.Hangar_MenuBtn = {}
local hmb = UI.Hangar_MenuBtn

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_MenuBtn.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "Hangar_MenuBtn",
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
 				defName 			= "hangar_menu_btn",
 				defaultAnimation	= "idle",

 				links =
 				{
 					{
 						objName		= "self",
 						animParams	= UI.EffectAnimParams.SIZE,
 					},

					{
						objName		= "value",
						layer		= "UI.Hangar_MenuBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "sale",
						layer		= "UI.Hangar_MenuBtn.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blink",
						layer		= "UI.Hangar_MenuBtn.layers.NOTIFY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "blink",
						layer		= "UI.Hangar_MenuBtn.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
 				}
 			}}
		},

		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			

 			effects =
 			{{
 				defName 			= "hangar_menu_btn_sale",
 				defaultAnimation	= "idle",
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- NOTIFY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			

 			effects =
 			{{
 				defName 			= "hangar_menu_btn_notify",
 				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

 			effects =
 			{{
 				defName 			= "hangar_menu_btn_mouseOver",
 				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Hangar_MenuBtn:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetMouseOver( false )
	self:SetLayerVisible( false, self.layers.SALE_EFFECT )

end


--
function UI.Hangar_MenuBtn:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	local data = self:GetRecordData()
	self:UpdateEffectAnimation( data, bAnimated )

end


--
function UI.Hangar_MenuBtn:GetTooltipData()

	local data = self:GetRecordData()
	return data and data.tooltipData

end


--
function UI.Hangar_MenuBtn:UpdateOnBlinkChanged()

	local data = self:GetRecordData()
	self:UpdateNotifyEffect( data )

end


--
function UI.Hangar_MenuBtn:UpdateOnDisabledChanged()

	local data = self:GetRecordData()

	self:UpdateMouseOver()
	self:UpdateEffectAnimation( data )	

end


--
function UI.Hangar_MenuBtn:IsDisabled()

	local data = self:GetRecordData()	
	return data ~= nil and data.bLocked

end


--
function UI.Hangar_MenuBtn:UpdateOnSaleChanged()

	local data = self:GetRecordData()		
	self:UpdateSale( data )

end

-- ------------------------------
-- const
-- ------------------------------

hmb.MENU_BTN = true

hmb.layers =
{
	MAIN_EFFECT			= 0,
	SALE_EFFECT			= 1,
	TEXT				= 2,
	NOTIFY_EFFECT		= 3,
	MOUSE_OVER_EFFECT	= 4,
}

hmb.effectInfo =
{
	main =
	{
		animUnsel		= "idle",
		animSel  		= "select",
		animDisabled	= "lock",
	}
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_MenuBtn:UpdateForData( data, bAnimated )	

	self:UpdateMouseOver()
	self:UpdateText( data )
	self:UpdateEffectAnimation( data )
	self:UpdateSale( data )
	self:UpdateNotifyEffect( data )

end


--
function UI.Hangar_MenuBtn:UpdateText( data )

	local strName = string.format( "hangar_menuTab_%s", UI:Val2Key( UI.HangarWnd.menuTabs, data.menuTab ) )
	local str = UI:GetStringByName( strName )

	self:SetText( str, self.layers.TEXT )

end


--
function UI.Hangar_MenuBtn:UpdateEffectAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return		
	end

	local anim = ""

	if self:IsDisabled() then	
		anim = self.effectInfo.main.animDisabled

	elseif self:IsSelected() then
		anim = self.effectInfo.main.animSel

	else
		anim = self.effectInfo.main.animUnsel
	end

	if anim ~= mainEffect:GetCurAnimation() then
		mainEffect:StartAnimation( anim )
	end
	
end


--
function UI.Hangar_MenuBtn:UpdateSale( data )

	self:SetLayerVisible( data.bSale, self.layers.SALE_EFFECT )

end


--
function UI.Hangar_MenuBtn:UpdateNotifyEffect( data )

	self:SetLayerVisible( data.bBlink, self.layers.NOTIFY_EFFECT )

end


--
function UI.Hangar_MenuBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()

	return true

end


--
function UI.Hangar_MenuBtn:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )

	return true

end


--
function UI.Hangar_MenuBtn:SetMouseOver( bMouseOver )

	if self:IsDisabled() and bMouseOver then
		sys.log( "UI.Hangar_MenuBtn:SetMouseOver()[ERROR]: btn is disabled" )
		return
	end

	local bMouseOverOld = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )
	if bMouseOver ~= bMouseOverOld then

		self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

		if bMouseOver then
	    	UI:PlayGlobalSound( UI.HangarWnd.sounds.btnMouseOver )
		end

	end

end


--
function UI.Hangar_MenuBtn:UpdateMouseOver()

	local bMouseOver = false

	if not self:IsDisabled() then
		local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
		bMouseOver = wndUnderMouse == self
	end	

	self:SetMouseOver( bMouseOver )

end


--
function UI.Hangar_MenuBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOver()

end


-- ------------------------------------------------------------------------
-- UI.Hangar_StartBtn
-- ------------------------------------------------------------------------

UI.Hangar_StartBtn = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Hangar_StartBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Hangar_StartBtn",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
	},		

	layers =
	{
		numLayers = l_baseBtnNumLayers + 3,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			
			main		= true,

			effects =
			{{
				defName 			= "hangar_startBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "start",
						layer		= "UI.Hangar_StartBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "loading",
						layer		= "UI.Hangar_StartBtn.layers.WAITING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			id			= l_baseBtnNumLayers,
			
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- WAITING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_waitCircleLarge2",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.Hangar_StartBtn.layers.TIMER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TIMER
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font = { fontName = "Small" },
		},
	},
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Hangar_StartBtn:GetTooltipData()

	local text = UI:GetStringByName( "tooltip_hangar_start_btn_text" )
	if not self:IsGray() then
		if UI:IsTourTeamExist() and UI:IsInTournament() then
			text = UI:GetStringByName( "tooltip_hangar_start_btn_show_call_to_arms" )
		else
			if UI.Lobby:IsInLobby() then
				text = UI:GetStringByName( "tooltip_hangar_start_btn_show_custom_game" )
			end
		end
	else
		if UI.HangarWnd.serverInfo.mmDisabled then
			text = UI:GetStringByName( "tooltip_hangar_start_btn_disable_mm_off" )
		else
			if UI.HangarWnd:IsInBattle() then
				text = UI:GetStringByName( "tooltip_hangar_start_btn_disable_in_battle" )
			else
				if UI.Squad:IsInSquad() and not UI.Squad:IsLeader() then
					text = UI:GetStringByName( "tooltip_hangar_start_btn_disable_not_squad_leader" )
				end
			end
		end
	end

	return
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( "hangar_startGame" ),
			text		= text,
		}
	
end


--
function UI.Hangar_StartBtn:ShowMatchmakingTime()

	self:SetLayerVisible( true, self.layers.TIMER )

end


--
function UI.Hangar_StartBtn:SetMatchmakingTime( matchmakingTime )

	local str = ""

	local oldMatchmakingTime = self.matchmakingTime
	self.matchmakingTime = matchmakingTime

	local roundTime = math.floor( matchmakingTime )
	if oldMatchmakingTime == -1 or roundTime ~= math.floor( oldMatchmakingTime ) then

		if roundTime ~= -1 then
			str = UI:Time2Str3( roundTime )
		end

		self:SetText( str, self.layers.TIMER )

	end

end   


--
function UI.Hangar_StartBtn:HideMatchmakingTimer()

	self:SetLayerVisible( false, self.layers.TIMER )
	self:SetText( "", self.layers.TIMER )

	self.matchmakingTime = -1

end


--
function UI.Hangar_StartBtn:ShowWaiting()

	self:SetLayerVisible( true, self.layers.WAITING_EFFECT )

end


--
function UI.Hangar_StartBtn:HideWaiting()

	self:SetLayerVisible( false, self.layers.WAITING_EFFECT )

end


--
function UI.Hangar_StartBtn:ShowStartText()

	self:SetLayerVisible( true, self.layers.TEXT )

end


--
function UI.Hangar_StartBtn:HideStartText()

	self:SetLayerVisible( false, self.layers.TEXT )

end


--
function UI.Hangar_StartBtn:SetStartText( text )

	self:SetText( text, self.layers.TEXT )

end


--
function UI.Hangar_StartBtn:Reset()

	self:ShowStartText()
	self:SetStartText( UI:GetStringByName( "hangar_startGame" ) )
	self:HideMatchmakingTimer()
	self:HideWaiting()
	self:Enable( true )

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Hangar_StartBtn.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
	WAITING_EFFECT	= 3,
	TIMER			= 4,
}

UI.Hangar_StartBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "disable",		
	},
}

-- -------------------------------------
-- vars
-- -------------------------------------

UI.Hangar_StartBtn.matchmakingTime	= -1


-- ------------------------------------------------------------------------
-- UI.Hangar_MainMenuBtn
-- ------------------------------------------------------------------------

UI.Hangar_MainMenuBtn = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Hangar_MainMenuBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Hangar_MainMenuBtn",
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
				defName 			= "hangar_mainMenuBtn",
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

--
function UI.Hangar_MainMenuBtn:GetTooltipData()

	return self.tooltipData

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Hangar_MainMenuBtn.effectInfo =
{
	main =
	{
		animationIdle 		= "idle",
		animationSelect		= "over",
		animationPressed	= "press",
		animationDisabled	= "idle",
	},
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Hangar_MainMenuBtn.tooltipData =
{
	caption		= UI:GetStringByName( "hangar_mainMenu" ),
	text		= UI:GetStringByName( "hangar_mainMenu_desc" ),
	tooltipType = UI.tooltipTypes.TEXT_LARGE,
}

-- ---------------------------------------------------
-- UI.Hangar_BattleListWnd_proto
-- ---------------------------------------------------

UI.Hangar_BattleListWnd_proto = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Hangar_BattleListWnd_proto.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "Hangar_BattleListWnd_proto",
		isPrototype	= true,
	},
}

-- -------------------------------
-- const
-- -------------------------------

UI.Hangar_BattleListWnd_proto.btnPrototypeName	= ""
UI.Hangar_BattleListWnd_proto.listStyle			= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.ACTIVATE_BY_MOUSE_CLICK
UI.Hangar_BattleListWnd_proto.MAX_SLOTS			= 4

UI.Hangar_BattleListWnd_proto.effectInfo =
{
	main =
	{
		slotObjNamePrefix		= "ship_list_slot_",
		scrollObjName			= "",
		animIdle				= "idle",
	}
}

UI.Hangar_BattleListWnd_proto.slotTypes =
{
	SHIP		= 1,
	BUY_SHIP	= 2,
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Hangar_BattleListWnd_proto:InitSlots()	

	UI.ButtonsListWnd.InitSlots( self )

	for slotIdx, slot in pairs( self.slots ) do
		if slot.btn then
			slot.btn:SetMode( UI.Hangar_ShipSlotWnd_proto.modes.BATTLE )
		end
	end

end

-- ---------------------------------------------------
-- UI.Hangar_BattleListWnd
-- ---------------------------------------------------

UI.Hangar_BattleListWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Hangar_BattleListWnd.def =
{
	className 	= "Wnd",
	prototype	= "Hangar_BattleListWnd_proto",

	props =
	{
		name	= "Hangar_BattleListWnd",
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
				defName 			= "hangar_battleList_new",
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
}


-- -------------------------------
-- const
-- -------------------------------

UI.Hangar_BattleListWnd.btnPrototypeName	= "Hangar_ShipSlotWnd"

-- ------------------------------------------------------------------------
-- UI.Hangar_ShipSlotWnd_proto
-- ------------------------------------------------------------------------

UI.Hangar_ShipSlotWnd_proto = {}
local ss = UI.Hangar_ShipSlotWnd_proto

-- -------------------------------------
-- window definition
-- -------------------------------------

ss.layers =
{
    MAIN_EFFECT						= 0,
	SHIP_ICO_EFFECT					= 1, 
    DAMAGE_EFFECT    				= 2,
	IN_BATTLE_EFFECT				= 3, 
	IN_BATTLE_TEXT      			= 4,  
    SHIP_NAME						= 5,  
	MAX_SYNERGY_EFFECT				= 6, 
    ROLE_ICO_EFFECT					= 7,  
	SHIP_TYPE_NAME					= 8,  
    SHIP_RANK						= 9,  
	RACE_ICO_EFFECT					= 10, 
    TEXT_BUY						= 11, 
	LOCK_EFFECT						= 12, 	
	LOCK_TEXT						= 13,
	WAIT_EFFECT						= 14, 
	WAIT_TEXT						= 15, 
	MOUSE_OVER_EFFECT				= 16, 
	SHIP_DD_OVER_EFFECT				= 17,
	MATCHMAKING_EFFECT          	= 18,
	MATCHMAKING_HOURGLASS_EFFECT	= 19,
}

UI.Hangar_ShipSlotWnd_proto.def =
{
	className 	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name			= "Hangar_ShipSlotWnd_proto",
		isPrototype		= true,
	},

	layers =
	{
		firstOverlayLayer = ss.layers.MATCHMAKING_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
		},

		-- SHIP_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- DAMAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
			updatable	= false,
		},

		-- IN_BATTLE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
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
		},

		-- ROLE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- SHIP_TYPE_NAME
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- SHIP_RANK
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- RACE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- TEXT_BUY
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},
		
		-- LOCK_TEXT
		{
			layerType	= UI.LAYER_TEXT,
	
			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- WAIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
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

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
		},   

		-- SHIP_DD_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
		},   

		-- MATCHMAKING_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
		},

		-- MATCHMAKING_HOURGLASS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
		},
	}
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Hangar_ShipSlotWnd_proto:Reset()

	UI.ButtonsList_Btn.Reset( self )

	for layer = 0, self:GetNumLayers() - 1 do
		if layer ~= self.layers.MAIN_EFFECT and layer ~= self.layers.SHIP_ICO_EFFECT then
			self:SetLayerVisible( false, layer )
		end 
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( self.effectInfo.main.animIdle )
	end

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if shipIcoEffect then
		shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.icoSpriteName, UI.INVALID_RESOURCE_HANDLE ) 
	end     

	self.bMouseOverStateLocked = false

	self.tooltipData = nil

	self:HideControl( self.maintenanceIcoWnd )
	self:HideControl( self.levelUpIcoWnd )

end


--
function UI.Hangar_ShipSlotWnd_proto:Select( bSelect, bAnimated )

	UI.ButtonsList_Btn.Select( self, bSelect, bAnimated )

	local data = self:GetRecordData()
	self:UpdateMainAnimation( data )

end


--
function UI.Hangar_ShipSlotWnd_proto:SetMode( mode )

	self.mode = mode

end


--
function UI.Hangar_ShipSlotWnd_proto:GetMode()

	return self.mode

end


--
function UI.Hangar_ShipSlotWnd_proto:FullUpdate()

	local data = self:GetRecordData()
	self:UpdateForData( data, false )

end


--
function UI.Hangar_ShipSlotWnd_proto:LockMouseOverState( bLock )

    self.bMouseOverStateLocked = bLock

	if bLock then
		self:ShowMouseOverEffect( false )
	else
		self:UpdateMouseOverState()
	end
	
end


--
function UI.Hangar_ShipSlotWnd_proto:OnDamageChanged()

	local data = self:GetRecordData()
	self:UpdateDamageEffect( data )
	self:UpdateMaintenanceIco( data )

end


--
function UI.Hangar_ShipSlotWnd_proto:OnAmmoChanged()

	local data = self:GetRecordData()
	self:UpdateMaintenanceIco( data )

end


--
function UI.Hangar_ShipSlotWnd_proto:OnPlayerCreditsChanged()

	if self.maintenanceIcoWnd:IsChildOf( self ) then
		self.maintenanceIcoWnd:UpdateTooltip()
	end

	local data = self:GetRecordData()
	self:UpdateLevelUpIco( data )

end


--
function UI.Hangar_ShipSlotWnd_proto:OnPrepareStateChanged()

	local data = self:GetRecordData()
	self:UpdateMatchmakingEffect( data )

end


--
function UI.Hangar_ShipSlotWnd_proto:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.Hangar_ShipSlotWnd_proto:GetTooltipData()

	return self.tooltipData

end


--
function UI.Hangar_ShipSlotWnd_proto:OnVesselExpChanged()

	local data = self:GetRecordData()
	self:UpdateLevelUpIco( data )
	self:UpdateMaxSynergyEffect( data )

end


--
function UI.Hangar_ShipSlotWnd_proto:GetShipDDData()

	local data = self:GetRecordData()

	if	not data or
		self.mode ~= self.modes.BATTLE or
		data.bWait or
		not data.shipItem or
		UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE or
		UI:IsWaitingRequests() then
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
function UI.Hangar_ShipSlotWnd_proto:OnShipDDOver( bOver, ddData )	

	if bOver then
		self:SetLayerVisible( self:IsShipDDFit( ddData ), self.layers.SHIP_DD_OVER_EFFECT )
	else
		self:SetLayerVisible( false, self.layers.SHIP_DD_OVER_EFFECT )
	end

end


--
function UI.Hangar_ShipSlotWnd_proto:IsShipDDFit( ddData )

	if UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE then
		return false
	end

	local data = self:GetRecordData()

	if not data or self.mode ~= self.modes.BATTLE or data.bWait or not data.bSlotBought then
		return false
	end

	if data.shipItem and ddData.vid == data.shipItem.vid then
		return false
	end

	if UI:IsShipOnShipQuestByVid( ddData.vid ) then
		return false
	end

	if UI:IsShipInMatchmakingByVid( ddData.vid ) then
		return false
	end

	return true	

end

-- -------------------------------------
-- const
-- -------------------------------------

ss.effectInfo =
{
	main  =
	{
		animIdle				= "idle",
		animSelect				= "select",
		animAssignToBattle		= "equiped",
		durabilityIcoLocator	= "btn_repair",
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
		icoSpriteName	= "ico",
	},

	raceIco =
	{
		icoSpriteName	= "ico_fraction",
	}
}

ss.noShipTex		= "hangar_noShip"
ss.strSelectShip	= UI:GetStringByName( "hangar_selectShip" )
ss.strBuyShip		= UI:GetStringByName( "hangar_buyShip" )

ss.modes =
{
	BATTLE		= 1,
	SHIP_SELECT = 2,
}

-- -------------------------------------
-- vars
-- -------------------------------------

ss.mode						= -1
ss.bMouseOverStateLocked	= false
ss.tooltipData				= nil
ss.maintenanceIcoWnd		= nil
ss.levelUpIcoWnd			= nil

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Hangar_ShipSlotWnd_proto:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.Hangar_ShipSlotWnd_proto:CreateControls()

	-- в разрешени 1080

	self.maintenanceIcoWnd = UI:CreateChildWnd( self, UI.ItemControl_DurabilityIcoWnd_1080, "" )
	self.levelUpIcoWnd = UI:CreateChildWnd( self, UI.ShipLevelUpIco_1080, "" )

end


--
function UI.Hangar_ShipSlotWnd_proto:ShowControl( wnd, locator )

	if wnd:IsChildOf( self ) then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, wnd, mainEffect, locator, UI.EffectAnimParams.POS )

end


--
function UI.Hangar_ShipSlotWnd_proto:HideControl( wnd )

	if not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateForData( data, bAnimated )

	self:UpdateMouseOverLockState( data )
	self:UpdateMainAnimation( data )
	self:UpdateShipName( data )
	self:UpdateShipIco( data )
	self:UpdateRace( data )
	self:UpdateRoleIco( data )
	self:UpdateShipTypeName( data )
	self:UpdateShipRank( data )
	self:UpdateBuyText( data )
	self:UpdateWaitState( data )
	self:UpdateInBattleState( data )
	self:UpdateDamageEffect( data )
	self:UpdateMaintenanceIco( data )
	self:UpdateLockEffect( data )
	self:UpdateTooltipData( data )
	self:UpdateMatchmakingEffect( data )
	self:UpdateLevelUpIco( data )
	self:UpdateMaxSynergyEffect( data )

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateMouseOverLockState( data )

	local bLock = false

	if data then
		bLock = data.bWait or not data.bSlotBought
	end

	if not bLock then

    	local parent = self:GetParent()

    	if parent and parent.NeedLockMouseOverState then
    		bLock = parent:NeedLockMouseOverState()
    	end

	end

	self:LockMouseOverState( bLock )

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateMainAnimation( data )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = ""

	if self:IsSelected() then
		anim = self.effectInfo.main.animSelect
	else
		anim = self.effectInfo.main.animIdle
	end

	mainEffect:StartAnimation( anim )

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateShipName( data )
	
	if not data.bWait and data.shipItem then

		self:SetLayerVisible( true, self.layers.SHIP_NAME )

		local nameLocalized = UI:GetEntityLocalizedNameByDef( data.shipItem.defName, true )
		self:SetText( nameLocalized, self.layers.SHIP_NAME )

		self:UpdateShipNamePos()

	else
		self:SetLayerVisible( false, self.layers.SHIP_NAME )
	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateShipNamePos()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local baseLocator = self.effectInfo.main.shipNameLocator
	local posLocator = self.levelUpIcoWnd:IsChildOf( self ) and self.effectInfo.main.shipNameLocator2 or self.effectInfo.main.shipNameLocator
	local handle = self:GetUiHandle()

	mainEffect:UnlinkLayer( handle, self.layers.SHIP_NAME, "" )
	mainEffect:LinkLayer( handle, self.layers.SHIP_NAME, baseLocator, UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA )
	mainEffect:LinkLayer( handle, self.layers.SHIP_NAME, posLocator, UI.EffectAnimParams.POS )	
	
end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateLevelUpIco( data )

	local bNeedLevelUpIco = false

	if data.shipItem then
		bNeedLevelUpIco = UI:CanShipLevelUp( data.shipItem.vid ) and self.mode ~= self.modes.SHIP_SELECT
	end

	local bIsLevelUpIco = self.levelUpIcoWnd:IsChildOf( self )

	if bNeedLevelUpIco and not bIsLevelUpIco then

		self:ShowControl( self.levelUpIcoWnd, self.effectInfo.main.levelUpLocator )
		self:UpdateShipNamePos()

	elseif not bNeedLevelUpIco and bIsLevelUpIco then

		self:HideControl( self.levelUpIcoWnd )
		self:UpdateShipNamePos()

	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateShipIco( data )

	local shipIcoEffect = UI:GetEffectFromLayer( self, self.layers.SHIP_ICO_EFFECT )
	if not shipIcoEffect then
		return
	end

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if not data.bWait then

    	if data.shipItem then
    		hTex = UI:GetShipIco( data.shipItem.defName )
		end

	end

	shipIcoEffect:SetSpriteTexture( self.effectInfo.shipIco.icoSpriteName, hTex )

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateRace( data )

	self:SetLayerVisible( false, self.layers.RACE_ICO_EFFECT )

	if not data.bWait and data.shipItem then

    	local race = UI:GetItemRace( data.shipItem.defName )
		if race ~= -1 then

			self:SetLayerVisible( true, self.layers.RACE_ICO_EFFECT )

           	local raceEffect = UI:GetEffectFromLayer( self, self.layers.RACE_ICO_EFFECT )
        	if raceEffect then

    			local hTex = UI:GetRaceIcoMediumColored( race )
    			raceEffect:SetSpriteTexture( self.effectInfo.raceIco.icoSpriteName, hTex )

    		end

		end

	end

end  


--
function UI.Hangar_ShipSlotWnd_proto:UpdateRoleIco( data )

	local roleEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if not roleEffect then
		return
	end

	local role = -1

	if data.shipItem then
		role = UI:GetItemRole( data.shipItem.defName )
	end        

	if role ~= -1 then

		self:SetLayerVisible( true, self.layers.ROLE_ICO_EFFECT )

		local hTexRole = UI:GetRoleIco( role )
		roleEffect:SetSpriteTexture( self.effectInfo.role.icoSpriteName, hTexRole )

		local color = UI:GetItemColor( data.shipItem.defName )
		roleEffect:SetColor( color )

	else
		self:SetLayerVisible( false, self.layers.ROLE_ICO_EFFECT )
	end
           
end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateShipTypeName( data )

	local text = ""

	if self.mode == self.modes.BATTLE or self.mode == self.modes.SHIP_SELECT then

		if not data.bWait and not data.shipItem then

			local shipClassMask = UI.serverData.battleSlotTypes[ data.shipSlotIdx ]

			-- #0027368, комм.(0085095) - для слотов, в которые можно ставить любые корабли, текст не пишется
			if UI:ShipTypeMask2OneShipType( shipClassMask ) then
				text = UI:ShipSlotType2Str( shipClassMask ) 
			end

		end

	end

	if text ~= "" then

		self:SetLayerVisible( true, self.layers.SHIP_TYPE_NAME )
		self:SetText( text, self.layers.SHIP_TYPE_NAME )
		
	else
		self:SetLayerVisible( false, self.layers.SHIP_TYPE_NAME )
	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateShipRank( data )

	self:SetLayerVisible( false, self.layers.SHIP_RANK )

	if not data.bWait and data.shipItem then

		local rank = UI:GetShipRank( data.shipItem.defName )		
		if rank ~= -1 then
			self:SetLayerVisible( true, self.layers.SHIP_RANK )
			self:SetText( tostring( rank ), self.layers.SHIP_RANK )			
		end		

	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateDamageEffect( data )

	self:SetLayerVisible( false, self.layers.DAMAGE_EFFECT )

	-- для кораблей, которые в битве, повреждения игнорируются
	if data.shipItem and data.shipItem.lockedInGame == UI.INVALID_U64_ID then

    	local hp = _G.GameStore_GetVesselHullCondition( data.shipItem.vid )

		if hp == 0 and self.mode ~= self.modes.SHIP_SELECT then
	    	self:SetLayerVisible( true, self.layers.DAMAGE_EFFECT )
		end

	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateMaintenanceIco( data )

	self:HideControl( self.maintenanceIcoWnd )

	-- для кораблей, которые в битве, повреждения игнорируются
	if data.shipItem and data.shipItem.lockedInGame == UI.INVALID_U64_ID then

    	local hp = _G.GameStore_GetVesselHullCondition( data.shipItem.vid )
    	local refillInfo = UI:GetShipRefillInfo( data.shipItem )

		local bNeedRepair = hp < 1
		local bNeedRefill = refillInfo.bHasAvailable and not refillInfo.bFullAmmo

    	if ( bNeedRepair or bNeedRefill ) and self.mode ~= self.modes.SHIP_SELECT then

			self:ShowControl( self.maintenanceIcoWnd, self.effectInfo.main.durabilityIcoLocator )
			self.maintenanceIcoWnd:SetupForShip( data.shipItem.vid ) 

    	end

	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateBuyText( data )

	self:SetLayerVisible( false, self.layers.TEXT_BUY )

	local text = ""

	if not data.bWait then

    	if self.mode == self.modes.BATTLE then

    		if data.bSlotBought then
    			if not data.shipItem then
    				text = self.strSelectShip
    			end
    		end

    	end

	end

	if text ~= "" then
		self:SetLayerVisible( true, self.layers.TEXT_BUY )
		self:SetText( text, self.layers.TEXT_BUY )
	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateWaitState( data )

	self:SetLayerVisible( data.bWait, self.layers.WAIT_EFFECT )
	self:SetLayerVisible( data.bWait, self.layers.WAIT_TEXT )

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateInBattleState( data )

	local bInBattle = data.shipItem and data.shipItem.lockedInGame ~= UI.INVALID_U64_ID

	self:SetLayerVisible( bInBattle, self.layers.IN_BATTLE_EFFECT )
	self:SetLayerVisible( bInBattle, self.layers.IN_BATTLE_TEXT )

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateLockEffect( data )

	local bVisible = false

	if self.mode == self.modes.BATTLE then
		bVisible = not data.bWait and not data.bSlotBought
	end

	self:SetLayerVisible( bVisible, self.layers.LOCK_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.LOCK_TEXT )
	
	if bVisible then
	

		local requiredRank = UI.serverData.battleSlotsRankReq[ data.shipSlotIdx ] or -1
		local strRank = tostring( requiredRank )
		
		local str = UI:GetStringByName( "gameplayChoice_requiredRank" )

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$rank%$", strRank )

		if numSubst == 0 then
			sys.log( "UI.Hangar_ShipSlotWnd_proto:UpdateLockEffect()[ERROR]: cannot find placeholder \"$rank$\" in string \"gameplayChoice_requiredRank\"" )
			str = string.format( "[INVALID STRING]required rank %s", strRank )
		end
		
		self:SetText( str, self.layers.LOCK_TEXT )

	end

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateMatchmakingEffect( data )

	local bVisible = self:NeedMatchmakingEffect( data )

	self:SetLayerVisible( bVisible, self.layers.MATCHMAKING_EFFECT )
	self:SetLayerVisible( bVisible, self.layers.MATCHMAKING_HOURGLASS_EFFECT )
	
end


--
function UI.Hangar_ShipSlotWnd_proto:NeedMatchmakingEffect( data )

	return
		UI.HangarWnd:GetPrepareState() ~= UI.HangarWnd.prepareStates.NONE
		and self.mode == self.modes.BATTLE
		and data.bSlotBought

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateTooltipData( data )

	local tooltipData = nil

	if data.shipItem then

		tooltipData =
		{
			tooltipType		= UI.tooltipTypes.SHIP,
			defName			= data.shipItem.defName,
			vid				= data.shipItem.vid,
			logEvent		= _G.MasterServer.PlayerAction.PA_VESSEL_TOOLTIP_HANGAR,
			bWithTalents	= true,
		}

	else

		if self.mode == self.modes.BATTLE or self.mode == self.modes.SHIP_SELECT then
	
			if not data.bSlotBought then
				tooltipData = UI:GetLockedBattleSlotTooltipData( data.shipSlotIdx )
			end
	
		end

	end

	self:SetTooltipData( tooltipData )

end


--
function UI.Hangar_ShipSlotWnd_proto:ShowMouseOverEffect( bShow )

	if self.bMouseOverStateLocked and bShow then
		return
	end

	self:SetLayerVisible( bShow, self.layers.MOUSE_OVER_EFFECT )	

end


--
function UI.Hangar_ShipSlotWnd_proto:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if not self.bMouseOverStateLocked then
		self:ShowMouseOverEffect( true )
		UI:PlayGlobalSound( UI.HangarWnd.sounds.shipSlotMouseOver )
	end

	return true

end


--
function UI.Hangar_ShipSlotWnd_proto:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:ShowMouseOverEffect( false )
	return true

end


--
function UI.Hangar_ShipSlotWnd_proto:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateMouseOverState()

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateMouseOverState()

	local bMouseOver = self:IsPtInBounds( UI:GetMouseX(), UI:GetMouseY() )
	self:ShowMouseOverEffect( bMouseOver )

end


--
function UI.Hangar_ShipSlotWnd_proto:GetShipClassMask()

	local battleSlotIdx = -1

	if self.mode == self.modes.BATTLE or self.mode == self.modes.SHIP_SELECT then
		local data = self:GetRecordData()
		battleSlotIdx = data and data.shipSlotIdx or -1

	else
		local list = self:GetParent()
		battleSlotIdx = list and list:GetBattleSlotIdx() or -1
	end

	return UI.serverData.battleSlotTypes[ battleSlotIdx ] or 0

end


--
function UI.Hangar_ShipSlotWnd_proto:UpdateMaxSynergyEffect( data )

	local bMaxSynergy = data.shipItem ~= nil and UI:GetShipLevel( data.shipItem ) >= UI:GetShipMaxLevel( data.shipItem.defName )
	self:SetLayerVisible( bMaxSynergy, self.layers.MAX_SYNERGY_EFFECT )

end


-- ------------------------------------------------------------------------
-- UI.Hangar_ShipSlotWnd - в разрешении 720
-- ------------------------------------------------------------------------

UI.Hangar_ShipSlotWnd_720 = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Hangar_ShipSlotWnd_720.def =
{
	className 	= "Wnd",
	prototype	= "Hangar_ShipSlotWnd_proto",

	props =
	{
		name			= "Hangar_ShipSlotWnd_720",
		isPrototype		= true,
	},

	layers =
	{
		firstOverlayLayer = ss.layers.MATCHMAKING_EFFECT,

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
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "gmp_icon",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_type_val",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_RANK",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "ship_type_val",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_TYPE_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_buy",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.TEXT_BUY",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load_info",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_DD_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_ico",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "fraction_ico",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.RACE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "in_battle",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lock",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "broken",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.DAMAGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "in_battle",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "role_max",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MAX_SYNERGY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SHIP_ICO_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.SHIP_ICO_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_shipIco",
				defaultAnimation	= "idle",
			}}
		},

		-- DAMAGE_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.DAMAGE_EFFECT,
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
			id			= UI.Hangar_ShipSlotWnd_proto.layers.IN_BATTLE_EFFECT,
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
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.IN_BATTLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- MAX_SYNERGY_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MAX_SYNERGY_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_battleSlot_maxSynergy",
				defaultAnimation	= "gold",
			}}
		},

		-- ROLE_ICO_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.ROLE_ICO_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},
		
		-- RACE_ICO_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.RACE_ICO_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName	= "hangar_shipSlot_faction",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.LOCK_EFFECT,
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
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.LOCK_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- WAIT_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.WAIT_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hangar_waitCircleSmall",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MOUSE_OVER_EFFECT,
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
			id			= UI.Hangar_ShipSlotWnd_proto.layers.SHIP_DD_OVER_EFFECT,
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
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_EFFECT,
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
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_HOURGLASS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- MATCHMAKING_HOURGLASS_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_HOURGLASS_EFFECT,
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
-- work functions
-- -------------------------------------

--
function UI.Hangar_ShipSlotWnd_720:CreateControls()

	self.maintenanceIcoWnd = UI:CreateChildWnd( self, UI.ItemControl_DurabilityIcoWnd, "" )
	self.levelUpIcoWnd = UI:CreateChildWnd( self, UI.ShipLevelUpIco, "" )

end


-- ------------------------------------------------------------------------
-- UI.Hangar_ShipSlotWnd	- в разрешении 1080
-- ------------------------------------------------------------------------

UI.Hangar_ShipSlotWnd = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

UI.Hangar_ShipSlotWnd.def =
{
	className 	= "Wnd",
	prototype	= "Hangar_ShipSlotWnd_proto",

	props =
	{
		name			= "Hangar_ShipSlotWnd",
		isPrototype		= true,
	},

	layers =
	{
		firstOverlayLayer = ss.layers.MATCHMAKING_EFFECT,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "hangar_shipSlot_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name_ship",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "gmp_icon",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_type_val",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_RANK",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "ship_type_val",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_TYPE_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "text_buy",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.TEXT_BUY",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "load_info",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_DD_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "ship_ico",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.SHIP_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "fraction_ico",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.RACE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "in_battle",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.IN_BATTLE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lock",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "broken",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.DAMAGE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "in_battle",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "role_max",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MAX_SYNERGY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- SHIP_ICO_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.SHIP_ICO_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_shipIco_1080",
				defaultAnimation	= "idle",
			}}
		},

		-- DAMAGE_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.DAMAGE_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,
			updatable	= false,

			effects =
			{{
				defName				= "hangar_shipSlot_damageIco_1080",
				defaultAnimation	= "idle",
			}}
		},

		-- IN_BATTLE_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.IN_BATTLE_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hangar_shipSlot_inBattle_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_buy",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.IN_BATTLE_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- MAX_SYNERGY_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MAX_SYNERGY_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipsTree_battleSlot_maxSynergy_1080",
				defaultAnimation	= "gold",
			}}
		},

		-- ROLE_ICO_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.ROLE_ICO_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hud_objectsMark_specIco_1080",
				defaultAnimation	= "white",
			}}
		},
		
		-- RACE_ICO_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.RACE_ICO_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_faction_1080",
				defaultAnimation	= "idle",
			}}
		},

		-- LOCK_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.LOCK_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName				= "hangar_shipSlot_lock_1080",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "text",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.LOCK_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- WAIT_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.WAIT_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hangar_waitCircleSmall_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.WAIT_TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MOUSE_OVER_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "hangar_shipSlot_mouseOver_1080",
				defaultAnimation	= "idle",
			}}
		},   

		-- SHIP_DD_OVER_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.SHIP_DD_OVER_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName				= "hangar_shipSlot_mouseOver_1080",
				defaultAnimation	= "idle",
			}}
		},   

		-- MATCHMAKING_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hangar_shipSlot_matchmaking_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "waiting",
						layer		= "UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_HOURGLASS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- MATCHMAKING_HOURGLASS_EFFECT
		{
			id			= UI.Hangar_ShipSlotWnd_proto.layers.MATCHMAKING_HOURGLASS_EFFECT,
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hourglass_1080",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------------------------------------------------
-- UI.Hangar_BundlesBtn
-- ------------------------------------------------------------------------

UI.Hangar_BundlesBtn = {}

-- -------------------------------------
-- window definition
-- -------------------------------------

local l_numBaseBtnLayers = UI:GetTableLength( UI.EffectButtonWnd.layers )

UI.Hangar_BundlesBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name		= "Hangar_BundlesBtn",
		selectSound	= UI.HangarWnd.sounds.btnMouseOver,
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
				defName 			= "hangar_bundlesBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value43",
						layer 		= "UI.Hangar_BundlesBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "ico",
						layer 		= "UI.Hangar_BundlesBtn.layers.SALE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= l_numBaseBtnLayers,

			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
   			text 			= UI:GetStringByName( "hangar_bundlesBtn" )
		},

		-- SALE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			

			effects =
			{{		
				defName 	= "hangar_bundlesBtn_sale",
			}}
		}
	},
}

-- -------------------------------------
-- interface functions
-- -------------------------------------

--
function UI.Hangar_BundlesBtn:OnAccountAurasChanged()

	if self:IsOnScreen() then
		self:UpdateSale()
	end

end


--
function UI.Hangar_BundlesBtn:OnLoadingComplete()

	if self:IsOnScreen() then
		self:UpdateSale()
	end

end


--
function UI.Hangar_BundlesBtn:OnAccountRankChanged()

	if self:IsOnScreen() then
		self:UpdateSale()
	end

end


--
function UI.Hangar_BundlesBtn:GetTooltipData()

	return self.tooltipData

end


-- -------------------------------------
-- const
-- -------------------------------------

UI.Hangar_BundlesBtn.layers = 
{
	MAIN_EFFECT 		= 0,
	DEBUG				= 1,
	TEXT 				= 2,
	SALE_EFFECT			= 3,
}

UI.Hangar_BundlesBtn.effectInfo =
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

	sale =
	{
		animSale	= "sale",
		animFree	= "present",
		animNoSale	= "idle",
	}
}

UI.Hangar_BundlesBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "hangar_bundlesBtn_tooltipCaption" ),
	text		= UI:GetStringByName( "hangar_bundlesBtn_tooltipText" ),
}

-- -------------------------------------
-- work functions
-- -------------------------------------

--
function UI.Hangar_BundlesBtn:UpdateSale()

	local bHasSale	= false
	local bHasFree	= false

	-- tODO: debug, убрать
	local freeDefName = ""

	for defName, item in pairs( UI.serverData.shopByDef ) do

		if UI:IsItemVisibleInBundlesWnd( item ) then

			local price		= 0
			local basePrice	= 0

			local baseTokenPrice		= UI:GetShopBaseTokenPrice( item ) 
			local baseEventCreditsPrice	= UI:GetShopBaseEventCreditsPrice( item )

			if baseTokenPrice then
				price		= UI:GetShopTokenPrice( item ) 
				basePrice	= baseTokenPrice

        	elseif baseEventCreditsPrice then
				price		= UI:GetShopEventCreditsPrice( item ) 
				basePrice	= baseEventCreditsPrice
			else
				price		= UI:GetShopBuyPrice( item, false, false, true )
				basePrice	= UI:GetShopBaseBuyPrice( item, false, false )
			end

			if price < basePrice then
				bHasSale = true
			end

			if price == 0 then
				bHasFree = true
			end

			if bHasFree then
				freeDefName = defName
				break
			end

		end

	end

	local anim = ""

	if bHasFree then
		anim = self.effectInfo.sale.animFree

	elseif bHasSale then
		anim = self.effectInfo.sale.animSale

	else
		anim = self.effectInfo.sale.animNoSale
	end

	local saleEffect = UI:GetEffectFromLayer( self, self.layers.SALE_EFFECT )
	if saleEffect then
		saleEffect:StartAnimation( anim )
	end

	return freeDefName

end


--
function UI.Hangar_BundlesBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateSale()

end


-- ---------------------------------------------------------------------------
-- UI.Hangar_PrepareWnd
-- ---------------------------------------------------------------------------

UI.Hangar_PrepareWnd = {}

-- --------------------------------
-- window definition
-- --------------------------------

UI.Hangar_PrepareWnd.def =
{	
	className 	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "Hangar_PrepareWnd",
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
				defName 			= "hangar_refill_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",	
						layer		= "UI.Hangar_PrepareWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "window",	
						layer		= "UI.Hangar_PrepareWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_refill_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.Hangar_PrepareWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",	
						layer		= "UI.Hangar_PrepareWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "price_1",	
						layer		= "UI.Hangar_PrepareWnd.layers.PRICE_1_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "price_2",	
						layer		= "UI.Hangar_PrepareWnd.layers.PRICE_2_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_2",	
						wnd			= "UI.Hangar_Prepare_Btn1",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_1",	
						wnd			= "UI.Hangar_Prepare_Btn2",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "button_3",	
						wnd			= "UI.Hangar_Prepare_Btn3",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "chek_box",	
						wnd			= "UI.Hangar_Prepare_CheckBox",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},  

		-- TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_WORDBREAK,
   			formatInfoSz = { 4, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},  

		-- PRICE_1_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.Hangar_PrepareWnd.layers.PRICE_1_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_2_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shop_items_slot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "price_3",	
						layer		= "UI.Hangar_PrepareWnd.layers.PRICE_2_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PRICE_1_VAL
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- PRICE_2_VAL
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,
   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
	},

	children =
	{
		"UI.Hangar_Prepare_Btn1",
		"UI.Hangar_Prepare_Btn2",
		"UI.Hangar_Prepare_Btn3",
		"UI.Hangar_Prepare_CheckBox",
	}
}

-- --------------------------------
-- interface functions
-- --------------------------------

--
function UI.Hangar_PrepareWnd:Setup( callType, operationType, shipItem )

	self.callType		= callType
	self.operationType	= operationType
	self.shipItem		= shipItem
	
	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.Hangar_PrepareWnd:GetCallType()

	return self.callType

end


--
function UI.Hangar_PrepareWnd:GetOperationType()

	return self.operationType

end


--
function UI.Hangar_PrepareWnd:GetShipItem()

	return self.shipItem

end


-- --------------------------------
-- const
-- --------------------------------

UI.Hangar_PrepareWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WORK_EFFECT		= 2,
    CAPTION			= 3,
    TEXT			= 4,
    PRICE_1_EFFECT	= 5,
    PRICE_2_EFFECT	= 6,
    PRICE_1_VAL		= 7,
    PRICE_2_VAL		= 8,
}

UI.Hangar_PrepareWnd.results =
{
	OK		= 1,
	CANCEL	= 2,
	RETURN	= 3,	
}

UI.Hangar_PrepareWnd.callTypes =
{
	BY_REQUEST			= 1,
	BEFORE_FIGHT		= 2,
}

UI.Hangar_PrepareWnd.operationTypes =
{
	REFILL	= 1,
	REPAIR	= 2,
}

UI.Hangar_PrepareWnd.MAX_BTNS = 3

-- --------------------------------
-- vars
-- --------------------------------

UI.Hangar_PrepareWnd.shipItem		= nil
UI.Hangar_PrepareWnd.callType		= -1
UI.Hangar_PrepareWnd.operationType	= -1
UI.Hangar_PrepareWnd.btns			= {}
UI.Hangar_PrepareWnd.checkBox		= nil
UI.Hangar_PrepareWnd.price1MetaText	= nil
UI.Hangar_PrepareWnd.price2MetaText	= nil

-- --------------------------------
-- work functions
-- --------------------------------

--
function UI.Hangar_PrepareWnd:F_PostLoad()

	UI.FullScreenWnd.F_PostLoad( self )

	for btnIdx = 1, self.MAX_BTNS do
		local btnName = string.format( "Hangar_Prepare_Btn%d", btnIdx )
		self.btns[ btnIdx ] = UI[ btnName ]
	end

	self.checkBox = UI.Hangar_Prepare_CheckBox

	self.price1MetaText = UI.MetaText.GetNewInstance()
	self.price1MetaText:InitFromLayer( self, self.layers.PRICE_1_VAL ) 	

	self.price2MetaText = UI.MetaText.GetNewInstance()
	self.price2MetaText:InitFromLayer( self, self.layers.PRICE_2_VAL ) 	

end


--
function UI.Hangar_PrepareWnd:F_Shutdown()

	if self.price1MetaText then
		self.price1MetaText:Clear()
	end

	if self.price2MetaText then
		self.price2MetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.Hangar_PrepareWnd:F_OnAfterShowOnScreen()

	UI.FullScreenWnd.F_OnAfterShowOnScreen( self )

	self:UpdateMetaTextPos()

end


--
function UI.Hangar_PrepareWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.Hangar_PrepareWnd:UpdateMetaTextPos()

	self.price1MetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_1_VAL )
	self.price2MetaText:UpdateScreenOrgFromLayer( self, self.layers.PRICE_2_VAL )

end


--
function UI.Hangar_PrepareWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.PRICE_1_VAL then
		self.price1MetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	elseif layerIdx == self.layers.PRICE_2_VAL then
		self.price2MetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )

	end

end


--
function UI.Hangar_PrepareWnd:FullUpdate()

	self:Reset()

	local credits, gold = 0, 0

	if self.operationType == self.operationTypes.REFILL then

		if self.callType == self.callTypes.BY_REQUEST then
			local refillInfo = UI:GetShipRefillInfo( self.shipItem )
			credits, gold = refillInfo.credits, refillInfo.gold

		elseif self.callType == self.callTypes.BEFORE_FIGHT then
			local refillInfo = nil
			if self.shipItem then
				refillInfo = UI:GetShipRefillInfo( self.shipItem )
			else
				refillInfo = UI:GetAllShipsRefillInfo()
			end
			credits, gold = refillInfo.credits, refillInfo.gold
		end

	elseif self.operationType == self.operationTypes.REPAIR then

		if self.callType == self.callTypes.BY_REQUEST then

			local repairInfo = UI:GetShipRepairInfo( self.shipItem.vid, false )
			credits			= repairInfo.credits
			gold			= repairInfo.gold

		elseif self.callType == self.callTypes.BEFORE_FIGHT then
			local repairInfo = nil
			if self.shipItem then
				repairInfo = UI:GetShipRepairInfo( self.shipItem.vid )
			else
				repairInfo = UI:GetAllShipsRepairInfo( true )
			end
			credits			= repairInfo.credits
			gold			= repairInfo.gold

		end

	end

	self:UpdatePrice( credits, gold )
	self:UpdateCaption()
	self:UpdateText()
	self:UpdateBtns( credits, gold )
	self:UpdateCheckBox()

end


--
function UI.Hangar_PrepareWnd:Reset()

	self.price1MetaText:SetText( "", true )
	self.price2MetaText:SetText( "", true )

	self:SetText( "", self.layers.CAPTION )

	self:ResetBtns()

	self.checkBox:UnlinkFromParent()

end


--
function UI.Hangar_PrepareWnd:ResetBtns()

	for btnIdx, btn in pairs( self.btns ) do
		btn:UnlinkFromParent()
	end

end


--
function UI.Hangar_PrepareWnd:UpdatePrice( credits, gold )

	local slotIdx = 1

	if credits > 0 or credits == 0 and gold == 0 then
		self:SetupPriceSlot( slotIdx, credits, false )
		slotIdx = slotIdx + 1
	end

	if gold > 0 then
		self:SetupPriceSlot( slotIdx, gold, true )
	end

end


--
function UI.Hangar_PrepareWnd:SetupPriceSlot( slotIdx, price, bGold, bEnough )

	local metaText = slotIdx == 1 and self.price1MetaText or self.price2MetaText

	local priceInfo =
	{
		priceType	= bGold and _G.GameStore.CreditsType.CT_GOLD or _G.GameStore.CreditsType.CT_CREDITS,
		val			= price,
		bIsBuyPrice	= true,
		basePrice	= price,
	}

	local strPrice = UI:PriceInfo2Str( priceInfo, metaText:GetColor(), false, true, true, nil )

	metaText:SetText( strPrice, true )

end


--
function UI.Hangar_PrepareWnd:UpdateBtns( credits, gold )

	self:ResetBtns()

	local btnsInfo = {}

	-- 1

	local btnInfo1 = {}
	btnInfo1.result	= self.results.OK
	btnInfo1.enabled = ( credits == 0 or credits <= UI.serverData.playerCredits.credits ) and ( gold == 0 or gold <= UI.serverData.playerCredits.goldCredits )

	local text1 = ""

	if self.operationType == self.operationTypes.REFILL then
		text1 = UI:GetStringByName( "hangar_prepare_refillBtn" )

	elseif self.operationType == self.operationTypes.REPAIR then
		text1 = UI:GetStringByName( "hangar_prepare_repairBtn" )
	end

	btnInfo1.text = text1

	table.insert( btnsInfo, btnInfo1 )


	-- 2

	local btnInfo2 = {}

	if self.callType == self.callTypes.BEFORE_FIGHT and self.operationType == self.operationTypes.REFILL then
		btnInfo2.result	= self.results.CANCEL
		btnInfo2.enabled = true
		btnInfo2.text = UI:GetStringByName( "hangar_prepare_refuseBtn" ) 
	else
		btnInfo2.result	= self.results.RETURN
		btnInfo2.enabled = true
		btnInfo2.text = UI:GetStringByName( "hangar_prepare_returnBtn" ) 
	end

	table.insert( btnsInfo, btnInfo2 )


	-- 3

	if self.callType == self.callTypes.BEFORE_FIGHT and self.operationType == self.operationTypes.REFILL then

		local btnInfo3 = {}

		btnInfo3.result	= self.results.RETURN
		btnInfo3.enabled = true
		btnInfo3.text = UI:GetStringByName( "hangar_prepare_returnBtn" ) 

		table.insert( btnsInfo, btnInfo3 )

	end

	local idx_rightAligned = 1
	local numBtns = #btnsInfo

	for idx = numBtns, 1, -1 do

    	local btnInfo = btnsInfo[ idx ]
		local btn = self.btns[ idx_rightAligned ]

		if btn then
    		self:AddChild( btn )
    		btn:Enable( btnInfo.enabled )
    		btn:SetBtnText( btnInfo.text )
    		btn:SetResult( btnInfo.result )
		else
			sys.log( "UI.Hangar_PrepareWnd:UpdateBtns()[ERROR]: cannot find btn %d", idx_rightAligned )
		end

		idx_rightAligned = idx_rightAligned + 1

	end   	

end


--
function UI.Hangar_PrepareWnd:UpdateCaption()

	local text = ""

	if self.operationType == self.operationTypes.REFILL then
		text = UI:GetStringByName( "hangar_prepare_refillCaption" )

	elseif self.operationType == self.operationTypes.REPAIR then
		text = UI:GetStringByName( "hangar_prepare_repairCaption" )
	end

	self:SetText( text, self.layers.CAPTION )

end


--
function UI.Hangar_PrepareWnd:UpdateText()

	local text = ""

	if self.operationType == self.operationTypes.REFILL then

		if self.callType == self.callTypes.BY_REQUEST then
			text = UI:GetStringByName( "hangar_prepare_refillText" )

		elseif self.callType == self.callTypes.BEFORE_FIGHT then
			if self.shipItem ~= nil then
				text = UI:GetStringByName( "hangar_prepare_refillText" )				
			else
				text = UI:GetStringByName( "hangar_prepare_refillAllText" )
			end
		end

	elseif self.operationType == self.operationTypes.REPAIR then

		if self.callType == self.callTypes.BY_REQUEST then
			text = UI:GetStringByName( "hangar_prepare_repairText" )

		elseif self.callType == self.callTypes.BEFORE_FIGHT then
			if self.shipItem ~= nil then
				text = UI:GetStringByName( "hangar_prepare_repairText" )				
			else
				text = UI:GetStringByName( "hangar_prepare_repairAllText_ships" )
			end
		end

	end

	self:SetText( text, self.layers.TEXT )

end


--
function UI.Hangar_PrepareWnd:UpdateCheckBox()

	if self.operationType == self.operationTypes.REFILL then

		self:AddChild( self.checkBox )

    	local bAutoRefill = false
    	if UI.serverData.userData.autoRefill ~= nil then
    		bAutoRefill = UI:IsTrueEx( UI.serverData.userData.autoRefill )
    	end

    	self.checkBox:Check( bAutoRefill )

		self.checkBox:SetCheckBoxText( UI:GetStringByName( "hangar_prepare_autoRefill" ) )

	elseif self.operationType == self.operationTypes.REPAIR then

		self:AddChild( self.checkBox )

    	local autoRepair = false
    	if UI.serverData.userData.autoRepair ~= nil then
    		autoRepair = UI:IsTrueEx( UI.serverData.userData.autoRepair )
    	end

    	self.checkBox:Check( autoRepair )

		self.checkBox:SetCheckBoxText( UI:GetStringByName( "hangar_prepare_autoRepair" ) )

	else

		sys.log( "UI.Hangar_PrepareWnd:UpdateCheckBox()[ERROR]: unhandled operation type: %s", tostring( self.operationType ) )
		self.checkBox:UnlinkFromParent()

	end

end


--
function UI.Hangar_PrepareWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local wnd = UI:GetUiObjByHandleT( wndThatReceivedInput )

	if UI:IsWndKindOf( wnd, "Hangar_Prepare_Btn" ) then

		local result = wnd:GetResult()

		if result == self.results.OK then

    		if self.operationType == self.operationTypes.REFILL then
    			UI:PlayGlobalSound( UI.HangarWnd.sounds.refill )
    		elseif self.operationType == self.operationTypes.REPAIR then
    			UI:PlayGlobalSound( UI.HangarWnd.sounds.repair )
    		end

		else
			UI:PlayGlobalSound( UI.HangarWnd.sounds.prepareWndHide )
		end

		self:Hide()
		UI.HangarWnd:OnPrepareWndResult( result )

	elseif wnd == self.checkBox then

		self:OnCheckBox()

	end


	return true

end  


--
function UI.Hangar_PrepareWnd:OnEnter( key, controllerIdx )

	if self.operationType == self.operationTypes.REFILL then
		UI:PlayGlobalSound( UI.HangarWnd.sounds.refill )
	elseif self.operationType == self.operationTypes.REPAIR then
		UI:PlayGlobalSound( UI.HangarWnd.sounds.repair )
	end

	self:Hide()
	UI.HangarWnd:OnPrepareWndResult( self.results.OK )

	return true

end


--
function UI.Hangar_PrepareWnd:OnEscape()

	UI:PlayGlobalSound( UI.HangarWnd.sounds.prepareWndHide )

	self:Hide()
	UI.HangarWnd:OnPrepareWndResult( self.results.RETURN )

	return true

end


--
function UI.Hangar_PrepareWnd:F_OnEventSaveUiState()

	if not self:IsOnScreen() then
		return
	end

	UI.store.Hangar_PrepareWnd =
	{
		shipItem		= self.shipItem,
		callType		= self.callType,
		operationType	= self.operationType,
	}

end


--
function UI.Hangar_PrepareWnd:F_OnEventRestoreUiState()

	if UI.store.Hangar_PrepareWnd then

		self:Setup( UI.store.Hangar_PrepareWnd.callType, UI.store.Hangar_PrepareWnd.operationType, UI.store.Hangar_PrepareWnd.shipItem )
		UI.store.Hangar_PrepareWnd = nil

	end

end


--
function UI.Hangar_PrepareWnd:OnCheckBox()

	if self.operationType == self.operationTypes.REFILL then

    	local bAutoRefill = self.checkBox:IsChecked()

    	self.checkBox:Check( not bAutoRefill )

    	UI.serverData.userData.autoRefill = not bAutoRefill
    	UI:SaveServerUserData()

	elseif self.operationType == self.operationTypes.REPAIR then

    	local bAutoRepair = self.checkBox:IsChecked()

    	self.checkBox:Check( not bAutoRepair )

    	UI.serverData.userData.autoRepair = not bAutoRepair
    	UI:SaveServerUserData()

	else

		sys.log( "UI.Hangar_PrepareWnd:OnCheckBox()[ERROR]: unhandled operation type: %s", tostring( self.operationType ) )
		self.checkBox:UnlinkFromParent()

	end

end


-- ----------------------------------------------------------------------------------------
-- UI.Hangar_Prepare_Btn
-- ----------------------------------------------------------------------------------------

UI.Hangar_Prepare_Btn = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Hangar_Prepare_Btn.def =
{
	className	= "ButtonWnd",
	prototype	= "MsgBox_Btn",

	props =
	{
		name			= "Hangar_Prepare_Btn",
		isPrototype		= true,
	},
}

-- -----------------------------------
-- interdace functions
-- -----------------------------------

--
function UI.Hangar_Prepare_Btn:SetBtnText( text )

	self:SetText( text, self.layers.TEXT )

end


--
function UI.Hangar_Prepare_Btn:SetResult( result )

	self.result =result

end


--
function UI.Hangar_Prepare_Btn:GetResult()

	return self.result

end

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Hangar_Prepare_Btn.result = -1

-- ----------------------------------------------------------------------------------------
-- UI.Hangar_Prepare_Btn1, UI.Hangar_Prepare_Btn2, UI.Hangar_Prepare_Btn3
-- ----------------------------------------------------------------------------------------

--
UI.Hangar_Prepare_Btn1 =
{
    def =
    {
    	className	= "ButtonWnd",
		prototype	= "Hangar_Prepare_Btn",

    	props =
    	{
    		name			= "Hangar_Prepare_Btn1",
    	},
    },
}

--
UI.Hangar_Prepare_Btn2 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Hangar_Prepare_Btn",

		props =
		{
			name		= "Hangar_Prepare_Btn2",
		},
	},
}

--
UI.Hangar_Prepare_Btn3 =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "Hangar_Prepare_Btn",

		props =
		{
			name		= "Hangar_Prepare_Btn3",
		},
	},
}

-- ----------------------------------------------------------------------------------------
-- UI.Hangar_Prepare_CheckBox
-- ----------------------------------------------------------------------------------------

UI.Hangar_Prepare_CheckBox = {}

-- ------------------------------
-- window definition
-- ------------------------------

local l_numBaseCheckBoxLayers = UI:GetTableLength( UI.EffectCheckBoxWnd.layers )


UI.Hangar_Prepare_CheckBox.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name	= "Hangar_Prepare_CheckBox",
	},

	layers =
	{
		numLayers = l_numBaseCheckBoxLayers + 1,

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
			  	defName				= "hangar_prepare_checkBox",
				defaultAnimation    = "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value",
						layer		= "UI.Hangar_Prepare_CheckBox.layers.TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- TEXT
		{
			id				= l_numBaseCheckBoxLayers,

			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Hangar_Prepare_CheckBox:SetCheckBoxText( text )

	self:SetText( text, self.layers.TEXT )

end


-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_Prepare_CheckBox.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle_over",
		animationPressed	= "idle_over",
		animationDisabled	= "",
	},

	main_checked =
	{
		animationIdle 		= "chek",
		animationSelect		= "chek_over",
		animationPressed	= "chek_over",
		animationDisabled	= "",
	},
}

UI.Hangar_Prepare_CheckBox.layers =
{
	MAIN_EFFECT	= 0,
	DEBUG		= 1,
	TEXT        = 2,
}

-- ----------------------------------------------------------------------------------------
-- UI.Hangar_WaitingWnd
-- ----------------------------------------------------------------------------------------

UI.Hangar_WaitingWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Hangar_WaitingWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Hangar_WaitingWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		rectAbs		= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "waiting_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.Hangar_WaitingWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "loading",
						layer		= "UI.Hangar_WaitingWnd.layers.WAIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "blackBg",
				defaultAnimation	= "idle",
			}}
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
						layer		= "UI.Hangar_WaitingWnd.layers.WAIT_TEXT",
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
		},   
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Hangar_WaitingWnd:SetWaitText( text )

	self:SetText( text, self.layers.WAIT_TEXT )

end


--
function UI.Hangar_WaitingWnd:SetBlackBgVisible( bVisible )

	self:SetLayerVisible( bVisible, self.layers.BG_EFFECT )

end


-- -------------------------------
-- const
-- -------------------------------

UI.Hangar_WaitingWnd.layers =
{
    MAIN_EFFECT		= 0,
    BG_EFFECT		= 1,
    WAIT_EFFECT		= 2,
    WAIT_TEXT		= 3,
}

-- ---------------------------------------------------------------------------
-- UI.Hangar_NotificationsModeBtn
-- ---------------------------------------------------------------------------

UI.Hangar_NotificationsModeBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "EffectCheckBoxWnd",

		props =
		{
			name		= "Hangar_NotificationsModeBtn",
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
    				defName 			= "hangar_notificationsModeBtn",
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
	},

	effectInfo =
	{
    	main_unchecked =
    	{
    		animationIdle 		= "idle",
    		animationSelect		= "over",
    		animationPressed	= "over",
    		animationDisabled	= "",
    	},

    	main_checked =
    	{
    		animationIdle 		= "select",
    		animationSelect		= "sel_over",
    		animationPressed	= "sel_over",
    		animationDisabled	= "",
    	},
	},

	tooltipData =
	{
		tooltipType = UI.tooltipTypes.TEXT_SMALL,
		text		= UI:GetStringByName( "tooltipToggleNotificationsList" ),
	},

	GetTooltipData = function( self )
		return self.tooltipData
	end
}


-- ---------------------------------------------------------------------------
-- UI.Hangar_UtilBtn
-- ---------------------------------------------------------------------------

UI.Hangar_UtilBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_UtilBtn.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Hangar_UtilBtn",
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
				defName 			= "hangar_utilBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text",
						layer		= "UI.Hangar_UtilBtn.layers.COUNT",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "ico",
						layer		= "UI.Hangar_UtilBtn.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.Hangar_UtilBtn.layers.MOUSE_OVER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},		

		-- COUNT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_utilBtn_ico",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_utilBtn_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Hangar_UtilBtn:SetDisabled( bDisabled )

	self.bDisabled = bDisabled

	self:UpdateIco()
	self:UpdateMouseOver()

end


--
function UI.Hangar_UtilBtn:IsDisabled()

	return self.bDisabled

end


--
function UI.Hangar_UtilBtn:SetSelected( bSelected )

	self.bSelected = bSelected
	self:UpdateIco()

end


--
function UI.Hangar_UtilBtn:IsSelected()

	return self.bSelected

end


--
function UI.Hangar_UtilBtn:SetBlink( bBlink )

	self.bBlink = bBlink

	local anim = bBlink and self.effectInfo.ico.animBlink or self.effectInfo.ico.animIdle

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:StartAnimation( anim )
	end

end


--
function UI.Hangar_UtilBtn:IsBlink()

	return self.bBlink

end


--
function UI.Hangar_UtilBtn:SetCount( count )

	self.count = count

	local str = UI:Num2StrSeparatedBy3( count )
	self:SetText( str, self.layers.COUNT )

	local color = count > 0 and self.countColor_regular or self.countColor_gray
	self:SetColor( color, self.layers.COUNT )

end


--
function UI.Hangar_UtilBtn:GetCount()

	return self.count

end


--
function UI.Hangar_UtilBtn:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData

end


--
function UI.Hangar_UtilBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.Hangar_UtilBtn:Reset()

	self.tooltipData = nil

    self:SetDisabled( false )
    self:SetSelected( false )
    self:SetBlink( false )
    self:SetCount( 0 )
	self:SetMouseOver( false )

end


-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_UtilBtn.layers =
{
    MAIN_EFFECT			= 0,
    COUNT				= 1,
    ICO_EFFECT			= 2,
    MOUSE_OVER_EFFECT	= 3,
}

UI.Hangar_UtilBtn.sounds =
{
	mouseOver	= UI.sounds.btnMouseOver,
}

UI.Hangar_UtilBtn.effectInfo =
{
	main =
	{
		countColorLocator_regular	= "text",
		countColorLocator_gray		= "disable",
	},

	ico	=
	{
		animIdle	= "idle",
		animBlink	= "blink",
		spriteName	= "ico",
	}
}


-- ------------------------------
-- vars
-- ------------------------------

UI.Hangar_UtilBtn.bDisabled				= false
UI.Hangar_UtilBtn.bSelected				= false
UI.Hangar_UtilBtn.bBlink				= false
UI.Hangar_UtilBtn.count					= 0
UI.Hangar_UtilBtn.tooltipData			= nil

UI.Hangar_UtilBtn.countColor_regular	= UI.WHITE_COLOR
UI.Hangar_UtilBtn.countColor_gray		= UI.WHITE_COLOR

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_UtilBtn:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.countColor_regular	= mainEffect:GetObjColor( self.effectInfo.main.countColorLocator_regular )
		self.countColor_gray	= mainEffect:GetObjColor( self.effectInfo.main.countColorLocator_gray )
	end

	self:Reset()

end


--
function UI.Hangar_UtilBtn:UpdateIco()

	local hTex = UI.INVALID_RESOURCE_HANDLE

	if self:IsDisabled() then
		hTex = self:GetDisabledIco()

	elseif self:IsSelected() then
		hTex = self:GetSelectedIco()

	else
		hTex = self:GetRegularIco()
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

end


-- для перегрузки
function UI.Hangar_UtilBtn:GetDisabledIco()

	return UI:GetTex( "NoData" )

end


-- для перегрузки
function UI.Hangar_UtilBtn:GetSelectedIco()

	return UI:GetTex( "NoData" )

end


--  для перегрузки
function UI.Hangar_UtilBtn:GetRegularIco()

	return UI:GetTex( "NoData" )

end


--
function UI.Hangar_UtilBtn:UpdateMouseOver()

	local bMouseOver = false

	if not self:IsDisabled() then
		bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end

	self:SetMouseOver( bMouseOver )

end


--
function UI.Hangar_UtilBtn:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( self.sounds.mouseOver )
	end

end


--
function UI.Hangar_UtilBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Hangar_UtilBtn:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Hangar_UtilBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end


-- ---------------------------------------------------------------------------
-- UI.Hangar_FriendListBtn
-- ---------------------------------------------------------------------------

UI.Hangar_FriendListBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_FriendListBtn.def =
{
	className	= "Wnd",
	prototype	= "Hangar_UtilBtn",

	props =
	{
		name	= "Hangar_FriendListBtn",
	},
}

-- ------------------------------
-- interface functions (интерфейс и логика сохранены из предыдущей версии, авторства М.Кузнецова)
-- ------------------------------

--
function UI.Hangar_FriendListBtn:SetNotification( b )

	self:SetBlink( b )

end


--
function UI.Hangar_FriendListBtn:UpdateAnim()

	self:SetSelected( UI.FriendsListWnd:IsOnScreen() )

end


--
function UI.Hangar_FriendListBtn:SetFriendOnlineCount( count )

	self:SetCount( count )

end

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_FriendListBtn:F_PostLoad()

	UI.Hangar_UtilBtn.F_PostLoad( self )

    local tooltipData =
    {
    	tooltipType = UI.tooltipTypes.TEXT_SMALL,
    	text		= UI:GetStringByName( "tooltipShowFriendList" ),
    }
	self:SetTooltipData( tooltipData )

end


--
function UI.Hangar_FriendListBtn:GetSelectedIco()

	return UI:GetTex( "btn_h_friend_select_ico" )

end


--
function UI.Hangar_FriendListBtn:GetRegularIco()

	return UI:GetTex( "btn_h_friend_idle_ico" )

end

-- ---------------------------------------------------------------------------
-- UI.Hangar_VoteBtn
-- ---------------------------------------------------------------------------

UI.Hangar_VoteBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_VoteBtn.def =
{
	className	= "Wnd",
	prototype	= "Hangar_UtilBtn",

	props =
	{
		name	= "Hangar_VoteBtn",
	},
}

-- ------------------------------
-- interface functions (интерфейс и логика сохранены из предыдущей версии, авторства М.Кузнецова)
-- ------------------------------

--
function UI.Hangar_VoteBtn:SetNotification( b )

	if b then
		self:SetBlink( true )
		self:SetCount( 1 )
		self:SetDisabled( false )
	else
		self:SetBlink( false )
		self:SetCount( 0 )
	end

end


--
function UI.Hangar_VoteBtn:SetResults( b )

	self:SetDisabled( not b )

end


--
function UI.Hangar_VoteBtn:IsEnabled()

	return not self:IsDisabled()

end


--
function UI.Hangar_VoteBtn:UpdateAnim()

	self:SetSelected( UI.Vote_Wnd:IsOnScreen() )

end


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_VoteBtn:F_PostLoad()

	UI.Hangar_UtilBtn.F_PostLoad( self )

	self:SetDisabled( true )

    local tooltipData =
    {
    	tooltipType = UI.tooltipTypes.TEXT_SMALL,
    	text		= UI:GetStringByName( "tooltipVoteWnd" ),
    }
	self:SetTooltipData( tooltipData )	

end


--
function UI.Hangar_VoteBtn:GetDisabledIco()

	return UI:GetTex( "btn_h_voit_disable_ico" )

end


--
function UI.Hangar_VoteBtn:GetSelectedIco()

	return UI:GetTex( "btn_h_voit_select_ico" )

end


--
function UI.Hangar_VoteBtn:GetRegularIco()

	return UI:GetTex( "btn_h_voit_idle_ico" )

end


-- -------------------------------------------------------------------
-- UI.Hangar_ShipCustomizationBtn
-- -------------------------------------------------------------------

UI.Hangar_ShipCustomizationBtn =
{
    def =
    {
    	className	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name	= "Hangar_ShipCustomizationBtn",
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
    				defName 			= "hangar_shipCustomizationBtn",
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
    	},
    },

	textId = "hangar_stickerBtn"
}

-- -----------------------------------------------------
-- UI.Hangar_BuyWnd
-- -----------------------------------------------------

UI.Hangar_BuyWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWnd",

    	props =
    	{
    		name	= "Hangar_BuyWnd",
    	},
	},

	mainWndName = "HangarWnd",
}

-- -------------------------------------------------------------------
-- UI.Hangar_TradeWnd
-- -------------------------------------------------------------------

UI.Hangar_TradeWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "TradeWnd",

    	props =
    	{
    		name	= "Hangar_TradeWnd",
    	},
	},

	mainWndName = "HangarWnd",
}

-- ------------------------------------------------------------
-- UI.Hangar_BuyWithInventoryWnd
-- ------------------------------------------------------------

UI.Hangar_BuyWithInventoryWnd =
{
    def =
    {
    	className 	= "Wnd",
    	prototype	= "BuyWithInventoryWnd",

    	props =
    	{
    		name	= "Hangar_BuyWithInventoryWnd",
    	},
	},

	mainWndName = "HangarWnd",
}

-- -------------------------------------------------------------------
-- UI.Hangar_UpgradeItemWnd
-- -------------------------------------------------------------------

UI.Hangar_UpgradeItemWnd =
{
	def =
	{
		className 	= "Wnd",
		prototype	= "UpgradeItemWnd",
	
		props =
		{
			name	= "Hangar_UpgradeItemWnd",
		},
	},

	mainWndName = "HangarWnd",
}

-- ---------------------------------------------------------------------------
-- UI.Hangar_MailBtn
-- ---------------------------------------------------------------------------

UI.Hangar_MailBtn = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Hangar_MailBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "Hangar_UtilBtn",

	props =
	{
		name		= "Hangar_MailBtn",
	},
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Hangar_MailBtn:Update()

	self:SetSelected( UI.MailWnd:IsOnScreen() )
	self:SetCount( #UI.serverData.mail )
	self:SetTooltipData( { tooltipType = UI.tooltipTypes.TEXT_SMALL, text = UI:GetStringByName( "hangar_mailBtnTooltip" ) } )

end

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Hangar_MailBtn:HasImportantLetters()

	local bHasImportant = false

	for letterIdx, letter in pairs( UI.serverData.mail ) do
		if UI:IsLetterImportant( letter ) then
			bHasImportant = true
			break
		end
	end

	return bHasImportant

end


--
function UI.Hangar_MailBtn:GetSelectedIco()

	return self:HasImportantLetters() and UI:GetTex( "btn_h_mail_gold_select_ico" ) or UI:GetTex( "btn_h_mail_select_ico" )

end


--
function UI.Hangar_MailBtn:GetRegularIco()

	return self:HasImportantLetters() and UI:GetTex( "btn_h_mail_gold_ico" ) or UI:GetTex( "btn_h_mail_idle_ico" )

end


-- ---------------------------------------------------------------------------
-- UI.Hangar_ProfileBtn
-- ---------------------------------------------------------------------------

UI.Hangar_ProfileBtn = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Hangar_ProfileBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Hangar_ProfileBtn",
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
				defName 			= "hangar_profileBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "ico",	
						layer 		= "UI.Hangar_ProfileBtn.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "over",	
						layer 		= "UI.Hangar_ProfileBtn.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "add",	
						wnd 		= "UI.Hangar_ProfileBtn_LicenseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "time",	
						wnd 		= "UI.Hangar_ProfileBtn_LicenseTimeWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "premium",	
						layer		= "UI.Hangar_ProfileBtn.layers.PREMIUM_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "progr_count",
						wnd			= "UI.Hangar_ProfileBtn_RankWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},	
		-- PREMIUM_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_profileBtn_premium",
				defaultAnimation	= "idle",
			}}
		},
		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_profileBtn_ico",
				defaultAnimation	= "idle",
			}}
		},
		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_profileBtn_over",
				defaultAnimation	= "idle",
			}}
		},		
	},

	children = { "UI.Hangar_ProfileBtn_LicenseBtn", "UI.Hangar_ProfileBtn_LicenseTimeWnd", "UI.Hangar_ProfileBtn_RankWnd" }
}

UI.Hangar_ProfileBtn.layers = 
{
	MAIN_EFFECT 			= 0,
	PREMIUM_EFFECT			= 1,
	ICO_EFFECT 				= 2,
	OVER_EFFECT 			= 3,
}

UI.Hangar_ProfileBtn.avatarRequested = false
UI.Hangar_ProfileBtn.requestId = nil
UI.Hangar_ProfileBtn.inputRect = Quat( 0, 0, 0, 0 )

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.Hangar_ProfileBtn:OnAccountRankChanged()

	UI.Hangar_ProfileBtn_RankWnd:OnAccountRankChanged()
	
end


--
function UI.Hangar_ProfileBtn:OnAccountExpChanged()

	UI.Hangar_ProfileBtn_RankWnd:OnAccountExpChanged()
	
end


--
function UI.Hangar_ProfileBtn:ResetAvatar()

	self.avatarRequested = false
	self:SetLayerVisible( false, self.layers.ICO_EFFECT )


end


--
function UI.Hangar_ProfileBtn:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if self.requestId == requestId then
		if result == 0 then
			self:UpdateAvatar()
			self.requestId = nil
		else
			self.avatarRequested = false
		end
	end

end


--
function UI.Hangar_ProfileBtn:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	self:SetLayerVisible( false, self.layers.ICO_EFFECT )
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local inputRectPos	= mainEffect:GetObjPos( "self_2" )
		local inputRectSize	= mainEffect:GetObjSize( "self_2" )
		self.inputRect.x, self.inputRect.y, self.inputRect.z, self.inputRect.w = inputRectPos.x, inputRectPos.y, inputRectSize.x, inputRectSize.y

	end

end


--
function UI.Hangar_ProfileBtn:RequestAvatarIfNeed()

	if not self.avatarRequested then
		local requestId = UI.Profile:RequestAvatars( _G.MasterServer_GetLocalUserId() )
		if requestId == nil then
			self:UpdateAvatar()
		else
			self.requestId = requestId
		end
		self.avatarRequested = true
	end

end


--
function UI.Hangar_ProfileBtn:UpdateAvatar()

	local curAvatar = UI.Profile:GetCurrentAvatar( _G.MasterServer_GetLocalUserId() )
	if curAvatar then
		self:SetLayerVisible( true, self.layers.ICO_EFFECT )
		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
		icoEffect:SetSpriteTexture( "ico", UI:GetAvatarTexture( curAvatar ) )
	end

end


--
function UI.Hangar_ProfileBtn:Update()

	self:Check( UI.Profile_Wnd:IsOnScreen() or UI.ProfileWnd_new:IsOnScreen() )

end


--
function UI.Hangar_ProfileBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	-- элемент времени визуально находится за пределами кнопки профиля, поэтому селф кнопки больше, чем ее видимая часть;
	-- следующая проверка нужна, чтобы наводилось только на тут часть, которая визуально ассоциируется с кнопкой профиля

	if UI:IsPtInRect( self.inputRect, mouseX, mouseY ) then
		self:SetLayerVisible( true, self.layers.OVER_EFFECT )
	end

	return true

end


--
function UI.Hangar_ProfileBtn:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetLayerVisible( false, self.layers.OVER_EFFECT )

	return true

end


--
function UI.Hangar_ProfileBtn:Reset()

	self:Check( false )	

end


--
function UI.Hangar_ProfileBtn:GetTooltipData()

	local data = { tooltipType = UI.tooltipTypes.TEXT_LARGE }
	data.text = UI.HangarWnd:GetMenuBtnTooltipText( UI.HangarWnd.menuTabs.PROFILE )
	data.caption = UI.HangarWnd:GetMenuBtnTooltipCaption( UI.HangarWnd.menuTabs.PROFILE )
	return data

end


-- -------------------------------
-- const
-- -------------------------------

UI.Hangar_ProfileBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle",
		animationPressed	= "idle",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "select",
		animationPressed	= "idle",
		animationDisabled	= "disable",
	},
}

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.Hangar_ProfileBtn:F_OnNewFrame( hSender, dt_sys, dt_game )

	UI.EffectCheckBoxWnd.F_OnNewFrame( self, hSender, dt_sys, dt_game )

	self:UpdateLicenseControls()

end


--
function UI.Hangar_ProfileBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateLicenseControls()

end


--
function UI.Hangar_ProfileBtn:UpdateLicenseControls()

	local bHasLicense = _G.MasterServer_GetPremiumTimeLeftSeconds() > 0
	self:SetLayerVisible( bHasLicense, self.layers.PREMIUM_EFFECT )

end


--
function UI.Hangar_ProfileBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	-- элемент времени визуально находится за пределами кнопки профиля, поэтому селф кнопки больше, чем ее видимая часть;
	-- следующая проверка нужна, чтобы кликать можно было только на тут часть, которая визуально ассоциируется с кнопкой профиля

	if wndThatReceivedInput == self:GetUiHandle() then
		if not UI:IsPtInRect( self.inputRect, mouseX, mouseY ) then
			return true	-- это не позволит передать обработку нажатия выше по иерархии - в UI.HangarWnd
		end
	end

	return false

end


-- ------------------------------------------------------------------------
-- UI.Hangar_ProfileBtn_LicenseBtn
-- ------------------------------------------------------------------------

UI.Hangar_ProfileBtn_LicenseBtn = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Hangar_ProfileBtn_LicenseBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Hangar_ProfileBtn_LicenseBtn",
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
				defName 			= "hangar_profileBtn_licenseBtn",
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

--
function UI.Hangar_ProfileBtn_LicenseBtn:GetTooltipData()

	return self.tooltipData

end


--
function UI.Hangar_ProfileBtn_LicenseBtn:HandleTooltip( targetWnd, tooltipData )

	self:UpdateTooltip( true )
	return false

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Hangar_ProfileBtn_LicenseBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},

	main_checked =
	{
		animationIdle 			= "idle_2",
		animationSelect			= "over_2",
		animationPressed		= "press_2",
		animationDisabled		= "idle_2",
		animationIdle_focus 	= "idle_2",
		animationSelect_focus	= "over_2",
		animationPressed_focus	= "press_2",
	},
}

UI.Hangar_ProfileBtn_LicenseBtn.strTooltipText_hasLicense = UI:GetStringByName( "hangar_premuimAccLeft" )

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Hangar_ProfileBtn_LicenseBtn.time = -1

UI.Hangar_ProfileBtn_LicenseBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "hangar_buyPremiumAcc" ),
	text		= "",
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Hangar_ProfileBtn_LicenseBtn:Reset()

	self.time				= -1
	self.tooltipData.text	= ""

	self:Check( false )

end


--
function UI.Hangar_ProfileBtn_LicenseBtn:F_OnNewFrame( hSender, dt_sys, dt_game )

	UI.EffectCheckBoxWnd.F_OnNewFrame( self, hSender, dt_sys, dt_game )

	self:UpdateTime()

end


--
function UI.Hangar_ProfileBtn_LicenseBtn:UpdateTime()

	local time = math.floor( _G.MasterServer_GetPremiumTimeLeftSeconds() )	-- если нет лицензии, возвращает 0

	if math.abs( time - self.time ) < 1 then
		return
	end

	self.time = time

	self:UpdateIco()
	self:UpdateTooltip( false )

end


--
function UI.Hangar_ProfileBtn_LicenseBtn:UpdateIco()

	self:Check( self.time > 0 )

end


--
function UI.Hangar_ProfileBtn_LicenseBtn:UpdateTooltip( bForce )

	local bNeedUpdate = true

	if not bForce then

		local bTooltipOnScreen = UI:GetCurTooltipTargetHandle() == self:GetUiHandle() and UI:GetCurTooltipHandle() ~= UI.INVALID_UI_HANDLE
		if not bTooltipOnScreen then
			bNeedUpdate = false
		end

	end

	if not bNeedUpdate then
		return
	end

	self.tooltipData.text = self.time > 0 and string.gsub( self.strTooltipText_hasLicense, "%$time%$", UI:Time2Str43( self.time ) ) or UI:GetStringByName( "hangar_usualAcc" )

	if UI:GetCurTooltipTargetHandle() == self:GetUiHandle() then

    	local curTooltipWnd = UI:GetCurTooltip()
    	if curTooltipWnd then
    		curTooltipWnd:Setup( self.tooltipData, true )
    	end

	end

end


--
function UI.Hangar_ProfileBtn_LicenseBtn:FullUpdate()

	self:UpdateTime()

end


--
function UI.Hangar_ProfileBtn_LicenseBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- ------------------------------------------------------------------------
-- UI.Hangar_ProfileBtn_LicenseTimeWnd
-- ------------------------------------------------------------------------

UI.Hangar_ProfileBtn_LicenseTimeWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Hangar_ProfileBtn_LicenseTimeWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Hangar_ProfileBtn_LicenseTimeWnd",
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
				defName 			= "hangar_profileBtn_licenseTime",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "time",
						layer		= "UI.Hangar_ProfileBtn_LicenseTimeWnd.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- TEXT
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small"},
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:HandleTooltip( targetWnd, tooltipData )

	self:UpdateTooltip( true )
	return false

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Hangar_ProfileBtn_LicenseTimeWnd.layers =
{
	MAIN_EFFECT	= 0,
	TEXT		= 1,
}

UI.Hangar_ProfileBtn_LicenseTimeWnd.strTooltipText_hasLicense = UI:GetStringByName( "hangar_premuimAccLeft" )

UI.Hangar_ProfileBtn_LicenseTimeWnd.colorIsPremium	= UI.GOLD_COLOR
UI.Hangar_ProfileBtn_LicenseTimeWnd.colorNoPremium	= UI.TEXT_BASE_COLOR

UI.Hangar_ProfileBtn_LicenseTimeWnd.effectInfo =
{
	main =
	{
		colorIsPremiumLocator	= "time",
		colorNoPremiumLocator	= "time_color",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Hangar_ProfileBtn_LicenseTimeWnd.time = -1

UI.Hangar_ProfileBtn_LicenseTimeWnd.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "hangar_buyPremiumAcc" ),
	text		= "",
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		self.colorIsPremium	= mainEffect:GetObjColor( self.effectInfo.main.colorIsPremiumLocator )
		self.colorNoPremium	= mainEffect:GetObjColor( self.effectInfo.main.colorNoPremiumLocator)

	end

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:Reset()

	self.time				= -1
	self.tooltipData.text	= ""

	self:SetText( "", self.layers.TEXT )

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateTime()

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:UpdateTime()

	local time = math.floor( _G.MasterServer_GetPremiumTimeLeftSeconds() )	-- если нет лицензии, возвращает 0

	if math.abs( time - self.time ) < 1 then
		return
	end

	self.time = time

	self:UpdateText()
	self:UpdateTooltip( false )

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:UpdateText()

	local bHasLicense = self.time > 0

	local str = bHasLicense and UI:Time2Str45( self.time ) or UI:GetStringByName( "noPremLicense" )
	self:SetText( str, self.layers.TEXT )

	local color = bHasLicense and self.colorIsPremium or self.colorNoPremium
	self:SetColor( color, self.layers.TEXT )

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:UpdateTooltip( bForce )

	local bNeedUpdate = true

	if not bForce then

		local bTooltipOnScreen = UI:GetCurTooltipTargetHandle() == self:GetUiHandle() and UI:GetCurTooltipHandle() ~= UI.INVALID_UI_HANDLE
		if not bTooltipOnScreen then
			bNeedUpdate = false
		end

	end

	if not bNeedUpdate then
		return
	end

	self.tooltipData.text = self.time > 0 and string.gsub( self.strTooltipText_hasLicense, "%$time%$", UI:Time2Str43( self.time ) ) or UI:GetStringByName( "hangar_usualAcc" )

	if UI:GetCurTooltipTargetHandle() == self:GetUiHandle() then

    	local curTooltipWnd = UI:GetCurTooltip()
    	if curTooltipWnd then
    		curTooltipWnd:Setup( self.tooltipData, true )
    	end

	end

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:FullUpdate()

	self:UpdateTime()

end


--
function UI.Hangar_ProfileBtn_LicenseTimeWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- ------------------------------------------------------------------------
-- UI.Hangar_ProfileBtn_RankWnd
-- ------------------------------------------------------------------------

UI.Hangar_ProfileBtn_RankWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.Hangar_ProfileBtn_RankWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "Hangar_ProfileBtn_RankWnd",
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
				defName 			= "hangar_profileBtn_rank",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "level_text",
						layer		= "UI.Hangar_ProfileBtn_RankWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz 	= { 1, 1 },
			font			= { fontName = "Small"},
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.Hangar_ProfileBtn_RankWnd:OnAccountRankChanged()

	self:FullUpdate()

end


--
function UI.Hangar_ProfileBtn_RankWnd:OnAccountExpChanged()

	self:UpdateTooltip()
	
end


--
function UI.Hangar_ProfileBtn_RankWnd:GetTooltipData()

	return self.tooltipData

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Hangar_ProfileBtn_RankWnd.layers =
{
	MAIN_EFFECT	= 0,
	RANK		= 1,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Hangar_ProfileBtn_RankWnd.tooltipData = nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Hangar_ProfileBtn_RankWnd:FullUpdate()

	self:UpdateText()
	self:UpdateTooltip()

end


--
function UI.Hangar_ProfileBtn_RankWnd:UpdateText()

	local rank = UI:GetPlayerAccountRank()
	self:SetText( tostring( rank ), self.layers.RANK )
	
end


--
function UI.Hangar_ProfileBtn_RankWnd:UpdateTooltip()

	self.tooltipData = UI:GetAccountRankTooltipData()
	
end


--
function UI.Hangar_ProfileBtn_RankWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:FullUpdate()

end


-- ---------------------------------------------------------------------------
-- UI.Hangar_ClanBtn
-- ---------------------------------------------------------------------------

UI.Hangar_ClanBtn = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.Hangar_ClanBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectCheckBoxWnd",

	props =
	{
		name		= "Hangar_ClanBtn",
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
				defName 			= "hangar_clanBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},
					{
						objName		= "ico",	
						layer 		= "UI.Hangar_ClanBtn.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					{
						objName		= "over27",	
						layer 		= "UI.Hangar_ClanBtn.layers.OVER_EFFECT",
						animParams	= UI.EffectAnimParams.SIZE,
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
				defName 			= "hangar_clanBtn_ico",
				defaultAnimation	= "idle",
			}}
		},
		-- OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_clanBtn_over",
				defaultAnimation	= "idle",
			}}
		}
	}
}



UI.Hangar_ClanBtn.layers = 
{
	MAIN_EFFECT 			= 0,
	ICO_EFFECT 				= 1,
	OVER_EFFECT 			= 2,
}

UI.Hangar_ClanBtn.clanEmblemRequested = false
UI.Hangar_ClanBtn.requestId = nil

-- -------------------------------
-- interface functions
-- -------------------------------


--
function UI.Hangar_ClanBtn:ResetEmblem()

	self.clanEmblemRequested = false
	self:SetDefaultIco()

end


--
function UI.Hangar_ClanBtn:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if self.requestId == requestId then
		if result == 0 then
			self:RequestClanNameIfNeed( true )
			self.requestId = nil
		else
			self.clanEmblemRequested = false
		end
	end

end


--
function UI.Hangar_ClanBtn:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName, clanTag )

	if self.requestId == requestId then
		if result == 0 then
			self:RequestClanNameIfNeed( true )
			self.requestId = nil
		else
			self.clanEmblemRequested = false
		end
	end

end


--
function UI.Hangar_ClanBtn:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	self:SetDefaultIco()
	self:SetLayerVisible( false, self.layers.OVER_EFFECT )

end


--
function UI.Hangar_ClanBtn:RequestClanNameIfNeed( force )

	if not self.clanEmblemRequested or force then

		if UI.Clan:IsInClan() then

			local clanId = UI.Clan:GetCid()

			local clanName, bCached, requestId, tag, emblem = _G.MasterServer_GetClanName( clanId )
			if bCached then
				self:UpdateClanEmblem( emblem )
			else
				self.requestId = requestId
			end


		else

			self:SetDefaultIco()

		end

		self.clanEmblemRequested = true

	end

end


--
function UI.Hangar_ClanBtn:UpdateClanEmblem( emblemName )

	if ClanEmblems[ emblemName ] then
		local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
		icoEffect:SetSpriteTexture( "ico", UI:GetTex( ClanEmblems[ emblemName ].decal ) )
	else
		if emblemName ~= "" then
			sys.log( "^1UI.GameplayMapGalaxyClanOwner:SetClan()[ERROR]: unknown emblem '%s' for clan", emblemName )
		else
			self:SetDefaultIco()
		end
	end

end


--
function UI.Hangar_ClanBtn:SetDefaultIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	icoEffect:SetSpriteTexture( "ico", UI:GetTex( "default_clan_ico" ) )

end


--
function UI.Hangar_ClanBtn:Update()

	self:Check( UI.ClansMainWnd:IsOnScreen() )

end


--
function UI.Hangar_ClanBtn:Reset()

	self:Check( false )	

end


--
function UI.Hangar_ClanBtn:GetTooltipData()

	local data = { tooltipType = UI.tooltipTypes.TEXT_LARGE }
	data.caption = UI.HangarWnd:GetMenuBtnTooltipCaption( UI.HangarWnd.menuTabs.CLAN )
	data.text = UI.HangarWnd:GetMenuBtnTooltipText( UI.HangarWnd.menuTabs.CLAN )
	return data

end


-- -------------------------------
-- const
-- -------------------------------

UI.Hangar_ClanBtn.effectInfo =
{
	main_unchecked =
	{
		animationIdle 		= "idle",
		animationSelect		= "idle",
		animationPressed	= "idle",
		animationDisabled	= "disable",
	},

	main_checked =
	{
		animationIdle 		= "select",
		animationSelect		= "select",
		animationPressed	= "select",
		animationDisabled	= "disable",
	},
}


--
function UI.Hangar_ClanBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetLayerVisible( true, self.layers.OVER_EFFECT )

	return true

end


--
function UI.Hangar_ClanBtn:F_OnMouseOut( wndThatReceivedInput )

	if self:OnMouseOut( wndThatReceivedInput ) then
		return true
	end

	self:SetLayerVisible( false, self.layers.OVER_EFFECT )

	return true

end


-- ----------------------------------------------------------------------------------------
-- UI.Hangar_SquadBtn
-- ----------------------------------------------------------------------------------------

UI.Hangar_SquadBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

--
UI.Hangar_SquadBtn.def =
{
	className	= "Wnd",

	props =
	{
		name		= "Hangar_SquadBtn",
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
				defName 			= "hangar_squadBtn",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "text_8",
						layer		= "UI.Hangar_SquadBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "blink",
						layer		= "UI.Hangar_SquadBtn.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_ico",
						layer		= "UI.Hangar_SquadBtn.layers.ARROW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "over",
						layer		= "UI.Hangar_SquadBtn.layers.MOUSE_OVER_EFFECT",
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

		-- ARROW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_squadBtn_arrow",
			}}
		},

		-- BLINK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_menu_btn_notify",
				defaultAnimation	= "idle",
			}}
		},

		-- MOUSE_OVER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_TEXT_PICKER_TRANSPARENT,

			effects =
			{{
				defName 			= "hangar_squadBtn_mouseOver",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Hangar_SquadBtn:OnSquadDataChanged()

	UI.PveWnd:OnSquadDataChanged()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.Hangar_SquadBtn:SquadFinder_OnMyGroupCreate()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.Hangar_SquadBtn:SquadFinder_OnMyGroupDelete()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.Hangar_SquadBtn:SquadFinder_OnMyGroupChanged()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.Hangar_SquadBtn:SquadFinder_OnRejectJoin( uid )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.Hangar_SquadBtn:OnSquadWndReload()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.Hangar_SquadBtn:GetTooltipData()

	return self.tooltipData

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.Hangar_SquadBtn.layers =
{
	MAIN_EFFECT			= 0,
	TEXT				= 1,
	ARROW_EFFECT		= 2,
	BLINK_EFFECT		= 3,
	MOUSE_OVER_EFFECT	= 4,
}

UI.Hangar_SquadBtn.effectInfo =
{
	main =
	{
		animationIdle 	= "idle",
		animationSelect	= "sel",
	},

	arrow =
	{
		animUp		= "up",
		animDown	= "down",
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.Hangar_SquadBtn.tooltipData	= nil

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.Hangar_SquadBtn:F_PostLoad()

	UI.EffectCheckBoxWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_HIDED )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )

end


--
function UI.Hangar_SquadBtn:FullUpdate()

	self:UpdateText()
	self:UpdateBlink()
	self:UpdateTooltip()
	self:UpdateArrow()
	self:UpdateSelection()
	self:UpdateMouseOver()

end


--
function UI.Hangar_SquadBtn:UpdateText()

	local text = ""

	if UI.Squad:IsInSquad() then

		if UI.Squad:IsReadyCheckNeedShowStatus() then

			local numMembersTotal	= UI.Squad:GetPilotsCount()
			local numMembersReady	= 0
			local bHasRejects		= false

    		for memberIdx = 1, numMembersTotal do

    			local memberInfo = UI.Squad:GetPilotsInfo( memberIdx )
				if memberInfo then

    				local bReady =
    					memberInfo.offlineStatus ~= MasterServer.UserState.USER_STATE_OFFLINE
    					and memberInfo.readyCheckStatus == 1

    				if bReady then
    					numMembersReady = numMembersReady + 1
    				end

					if memberInfo.readyCheckStatus == -1 then
						bHasRejects = true
					end

				end

			end

			local baseColor		= self:GetColor( self.layers.TEXT )
			local readyColor	= bHasRejects and UI.PARAM_DELTA_MINUS_COLOR or baseColor

			text = string.format( "%s %s%d%s/%d", UI:GetStringByName( "hangar_squadBtn_ready" ), UI:Color2Str( readyColor ), numMembersReady, UI:Color2Str( baseColor ), numMembersTotal )

		else

    		if UI.Squad:IsWing() then
    			text = UI:GetStringByName( "squad_wnd_caption_wing" )
    		else
    			text = UI:GetStringByName( "squad_wnd_caption" )
    		end

    		local numPlayers = UI.Squad:GetPilotsCount()
    		text = string.format( "%s (%d)", text, numPlayers )

		end

	else
		text = UI:GetStringByName( "hangar_squadBtn_find" )
	end

	self:SetText( text, self.layers.TEXT )

end


--
function UI.Hangar_SquadBtn:UpdateBlink()

	local bBlink = false

	if UI.SquadFinder:IsMyGroup() then

		local bHasNewJoins = false

		local groupInfo = UI.SquadFinder:GetMyGroupInfo()
		for joinIdx, joinInfo in pairs( groupInfo.joinReqs ) do
			if not joinInfo.invited then
				bHasNewJoins = true
				break
			end
		end

		if bHasNewJoins then
			bBlink = true
		end

	end	

	if bBlink then
		self:StartBlink()
	else
		self:StopBlink()
	end

end


--
function UI.Hangar_SquadBtn:StopBlink()

	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )

end


--
function UI.Hangar_SquadBtn:StartBlink()

	self:SetLayerVisible( true, self.layers.BLINK_EFFECT )

end


--
function UI.Hangar_SquadBtn:UpdateTooltip()

	self.tooltipData = nil

	if UI.Squad:IsInSquad() and not UI.Squad:IsReadyCheckNeedShowStatus() then

		if UI.Squad:IsWing() then

            self.tooltipData =
        	{
        		tooltipType = UI.tooltipTypes.TEXT_LARGE,
        		caption		= UI:GetStringByName( "squad_tooltip_convert_to_wing_help_caption" ),
        		text		= UI:GetStringByName( "squad_tooltip_convert_to_wing_help_text" ),
        	}

		else

            self.tooltipData =
        	{
        		tooltipType = UI.tooltipTypes.TEXT_LARGE,
        		caption		= UI:GetStringByName( "hangar_squadBtn_squadTooltip_caption" ),
        		text		= UI:GetStringByName( "hangar_squadBtn_squadTooltip_text" ),
        	}

		end

	end

end


--
function UI.Hangar_SquadBtn:UpdateArrow()

	if UI.Squad:IsInSquad() then

		self:SetLayerVisible( true, self.layers.ARROW_EFFECT )

		local anim = UI.SquadWnd:IsOnScreen() and self.effectInfo.arrow.animUp or self.effectInfo.arrow.animDown

		local arrowEffect = UI:GetEffectFromLayer( self, self.layers.ARROW_EFFECT )
		if arrowEffect then
			arrowEffect:StartAnimation( anim )
		end

	else
		self:SetLayerVisible( false, self.layers.ARROW_EFFECT )
	end

end


--
function UI.Hangar_SquadBtn:UpdateSelection()

	local bSelect = false

	if UI.Squad:IsInSquad() then
		bSelect = UI.SquadWnd:IsOnScreen()
	else
		bSelect = UI:IsSquadFinderOnScreen()
	end

	local anim = bSelect and self.effectInfo.main.animationSelect or self.effectInfo.main.animationIdle

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:StartAnimation( anim )
	end

end


--
function UI.Hangar_SquadBtn:UpdateMouseOver()

	local wndUnderMouse = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true )
	local bMouseOver = wndUnderMouse == self

	self:SetMouseOver( bMouseOver )

end


--
function UI.Hangar_SquadBtn:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.Hangar_SquadBtn:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Hangar_SquadBtn:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Hangar_SquadBtn:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	if UI.Squad:IsInSquad() then

		if not UI.SquadWnd:IsOnScreen() then
        	UI.HangarWnd:TryShowSquadWnd( true )
		else
			UI.HangarWnd:HideSquadWnd( true )
		end

	else

		if UI:IsSquadFinderOnScreen() then
			UI.HangarWnd:HideSquadFinder( true )
		else
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
function UI.Hangar_SquadBtn:F_OnEventWndShown( hSender, hWnd )

	if hWnd == UI.SquadWnd:GetUiHandle() then
		self:UpdateSelection()
		self:UpdateArrow()

	elseif UI:IsWndOfSquadFinder( hWnd ) then
		self:UpdateSelection()
	end

end


--
function UI.Hangar_SquadBtn:F_OnEventWndHided( hSender, hWnd )

	if hWnd == UI.SquadWnd:GetUiHandle() then
		self:UpdateSelection()
		self:UpdateArrow()

	elseif UI:IsWndOfSquadFinder( hWnd ) then
		self:UpdateSelection()
	end

end


--
function UI.Hangar_SquadBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end

-- ----------------------------------------------------------------------------
--  UI.Hangar_TopPanelWnd
-- ----------------------------------------------------------------------------

UI.Hangar_TopPanelWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_TopPanelWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Hangar_TopPanelWnd",
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
				defName 			= "hangar_topPanel",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "esc_menu",
						wnd			= "UI.Hangar_MainMenuBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "start_slot",
						wnd			= "UI.MoneyWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "menu",
						wnd			= "UI.Hangar_MenuWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "start_button",
						wnd			= "UI.Hangar_StartBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "account",
						layer		= "UI.Hangar_TopPanelWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "name",
						layer		= "UI.Hangar_TopPanelWnd.layers.PLAYER_NAME_CLAN",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "level_progr",
						wnd			= "UI.Hangar_ExpWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "squad_btn",
						wnd			= "UI.Hangar_SquadBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- PLAYER_NAME_CLAN
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Large" },
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_topPanel_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "friend_btn",	
						wnd			= "UI.Hangar_FriendListBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "voiting_btn",	
						wnd			= "UI.Hangar_VoteBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "mail_btn",	
						wnd			= "UI.Hangar_MailBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "help_btn",	
						wnd			= "UI.Hangar_ClanBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "help_btn5",	
						wnd			= "UI.Hangar_ProfileBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children =
	{
		"UI.Hangar_MainMenuBtn",
		"UI.MoneyWnd",
		"UI.Hangar_MenuWnd",
		"UI.Hangar_StartBtn",
		"UI.Hangar_VoteBtn",
		"UI.Hangar_MailBtn",
		"UI.Hangar_FriendListBtn",
		"UI.Hangar_ClanBtn",
		"UI.Hangar_ProfileBtn",
		"UI.Hangar_SquadBtn",
		"UI.Hangar_ExpWnd",
	}
}

-- ------------------------------
-- interface funtions
-- ------------------------------

--
function UI.Hangar_TopPanelWnd:GetSquadWndScreenPos()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	
	local pos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.squadWndLocator ) or Vec2( 0, 0 )
	
	local parent = self:GetParent()
	if parent then
		pos.x = parent:XToScreen( pos.x )
		pos.y = parent:YToScreen( pos.y )
	end

	return pos	

end


--
function UI.Hangar_TopPanelWnd:GetBgHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	return mainEffect and mainEffect:GetObjSize( self.effectInfo.main.bgSizeLocator ).y or 0

end


-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_TopPanelWnd.layers =
{
	MAIN_EFFECT			= 0,
	PLAYER_NAME_CLAN	= 1,
	WORK_EFFECT			= 2,
}

UI.Hangar_TopPanelWnd.effectInfo =
{
	main =
	{
		squadWndLocator		= "squad_list",
		bgSizeLocator		= "self_2",
	}
}


-- ----------------------------------------------------------------------------
--  UI.Hangar_EMMWnd
-- ----------------------------------------------------------------------------

UI.Hangar_EMMWnd = {}

-- ------------------------------
-- window deinition
-- ------------------------------

UI.Hangar_EMMWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Hangar_EMMWnd",		
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
				defName				= "hangar_emm",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "couple_btn",
						wnd			= "UI.Hangar_EMM_StartBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "wait_btn",
						wnd			= "UI.Hangar_EMM_StopBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.Hangar_EMM_StartBtn", "UI.Hangar_EMM_StopBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Hangar_EMMWnd:OnReadyChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateStartBtnVisibility()
	self:UpdateStopBtnVisibility()

	if UI.Hangar_EMM_StartBtn:IsOnScreen() then
		UI.Hangar_EMM_StartBtn:OnReadyChanged()
	end

end


--
function UI.Hangar_EMMWnd:OnOpponentChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateStartBtnVisibility()

	if UI.Hangar_EMM_StartBtn:IsOnScreen() then
		UI.Hangar_EMM_StartBtn:OnOpponentChanged()
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_EMMWnd.layers =
{
	MAIN_EFFECT	= 0,
}

-- ------------------------------
-- work functions
-- ------------------------------


--
function UI.Hangar_EMMWnd:FullUpdate()

	self:UpdateStartBtnVisibility()
	self:UpdateStopBtnVisibility()

end


--
function UI.Hangar_EMMWnd:UpdateStartBtnVisibility()

	-- #0093493 - элемент предварительной очереди скрыт на неопределенное время, до прояснения ситуации
	local bNeedStartBtn = false -- UI:IsEMMReady() or UI:IsEMMOpponent()
	if bNeedStartBtn then
		self:AddChild( UI.Hangar_EMM_StartBtn )
	else
		UI.Hangar_EMM_StartBtn:UnlinkFromParent()	
	end

end


--
function UI.Hangar_EMMWnd:UpdateStopBtnVisibility()

	-- #0093493 - элемент предварительной очереди скрыт на неопределенное время, до прояснения ситуации
	local bNeedStopBtn = false-- UI:IsEMMReady()
	if bNeedStopBtn then
		self:AddChild( UI.Hangar_EMM_StopBtn )
	else
		UI.Hangar_EMM_StopBtn:UnlinkFromParent()	
	end

end


--
function UI.Hangar_EMMWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- ----------------------------------------------------------------------------
--  UI.Hangar_EMM_StartBtn
-- ----------------------------------------------------------------------------

UI.Hangar_EMM_StartBtn = {}

-- ------------------------------
-- window deinition
-- ------------------------------

UI.Hangar_EMM_StartBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn",

	props =
	{
		name	= "Hangar_EMM_StartBtn",		
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
				defName 			= "hangar_emm_startBtn",

				links =
				{
					{
						objName		= "self",	
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.TextBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
	}	
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Hangar_EMM_StartBtn:OnReadyChanged()

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.Hangar_EMM_StartBtn:OnOpponentChanged()

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_EMM_StartBtn.animModes =
{
	NO_OPPONENT			= 1,
	IS_OPPONENT			= 2,
	IS_READY_OPPONENT	= 3,
	READY				= 4,
}

UI.Hangar_EMM_StartBtn.effectInfo =
{

	anims =
	{
    	[ UI.Hangar_EMM_StartBtn.animModes.NO_OPPONENT ] =
    	{
    		animationIdle 			= "disable",
    		animationSelect			= "disable",
    		animationPressed		= "disable",
    		animationDisabled		= "disable",
    		animationIdle_focus 	= "disable",
    		animationSelect_focus	= "disable",
    		animationPressed_focus	= "disable",
    	},

    	[ UI.Hangar_EMM_StartBtn.animModes.IS_OPPONENT ] =
    	{
    		animationIdle 			= "found",
    		animationSelect			= "found_over",
    		animationPressed		= "found_press",
    		animationDisabled		= "found",
    		animationIdle_focus 	= "found",
    		animationSelect_focus	= "found_over",
    		animationPressed_focus	= "found_press",
    	},

    	[ UI.Hangar_EMM_StartBtn.animModes.IS_READY_OPPONENT ] =
    	{
    		animationIdle 			= "ready",
    		animationSelect			= "ready_over",
    		animationPressed		= "ready_press",
    		animationDisabled		= "ready",
    		animationIdle_focus 	= "ready",
    		animationSelect_focus	= "ready_over",
    		animationPressed_focus	= "ready_press",
    	},

    	[ UI.Hangar_EMM_StartBtn.animModes.READY ] =
    	{
    		animationIdle 			= "waiting",
    		animationSelect			= "waiting",
    		animationPressed		= "waiting",
    		animationDisabled		= "waiting",
    		animationIdle_focus 	= "waiting",
    		animationSelect_focus	= "waiting",
    		animationPressed_focus	= "waiting",
    	},
	}
}

-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_EMM_StartBtn.tooltipData =
{
	tooltipType	= UI.tooltipTypes.TEXT_LARGE,
	caption		= UI:GetStringByName( "emmStartBtn_tooltip_caption" ),
	text		= UI:GetStringByName( "emmStartBtn_tooltip_text" ),
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Hangar_EMM_StartBtn.animMode	= UI.Hangar_EMM_StartBtn.animModes.NO_OPPONENT

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_EMM_StartBtn:Reset()

	self:SetAnimMode( self.animModes.NO_OPPONENT )
	self:SetBtnText( "" )
	self:SetGray( true )

end


--
function UI.Hangar_EMM_StartBtn:FullUpdate()

	self:Reset()

	self:UpdateAnimation()
	self:UpdateText()
	self:UpdateEnableState()	

end


--
function UI.Hangar_EMM_StartBtn:UpdateAnimation()

	local animMode = self.animModes.NO_OPPONENT

	if UI:IsEMMReady() then

		animMode = self.animModes.READY

	else

		local bIsOpponent, bIsReadyOponent = UI:IsEMMOpponent()

		if bIsReadyOponent then
			animMode = self.animModes.IS_READY_OPPONENT
		elseif bIsOpponent then
			animMode = self.animModes.IS_OPPONENT
		else
			animMode = self.animModes.NO_OPPONENT	-- после #0083551 этой ситуации не может быть, т.к. кнопка просто скрывается
		end

	end

	self:SetAnimMode( animMode )

end


--
function UI.Hangar_EMM_StartBtn:UpdateText()

	local str = ""

	if UI:IsEMMReady() then

		str = UI:GetStringByName( "emmStartBtn_text_ready" )

	else

		local bIsOpponent, bIsReadyOponent = UI:IsEMMOpponent()

		if bIsOpponent then
			str = UI:GetStringByName( "emmStartBtn_text_isOpponent" )
		else
			str = UI:GetStringByName( "emmStartBtn_text_noOpponent" )
		end
	
	end

	self:SetBtnText( str )

end


--
function UI.Hangar_EMM_StartBtn:UpdateEnableState()

	local bEnable = not UI:IsEMMReady() and UI:IsEMMOpponent()
	self:SetGray( not bEnable )

end


--
function UI.Hangar_EMM_StartBtn:SetAnimMode( animMode )

	self.animMode = animMode
	self:UpdateEffectAnimation()

end


--
function UI.Hangar_EMM_StartBtn:UpdateEffectAnimation()

	if UI:IsInRemovingAllWindows() then
		return
	end	

	self.effectInfo.main = self.effectInfo.anims[ self.animMode ]

	UI.TextBtn.UpdateEffectAnimation( self )

end


--
function UI.Hangar_EMM_StartBtn:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()	

end


-- ----------------------------------------------------------------------------
--  UI.Hangar_EMM_StopBtn
-- ----------------------------------------------------------------------------

UI.Hangar_EMM_StopBtn = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_EMM_StopBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "EffectButtonWnd",

	props =
	{
		name	= "Hangar_EMM_StopBtn",		
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
				defName 			= "hangar_emm_stopBtn",
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

-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_EMM_StopBtn.effectInfo =
{
	main =
	{
		animationIdle 			= "idle",
		animationSelect			= "over",
		animationPressed		= "press",
		animationDisabled		= "idle",
		animationIdle_focus 	= "idle",
		animationSelect_focus	= "over",
		animationPressed_focus	= "press",
	},
}

-- ----------------------------------------------------------------------------
--  UI.Hangar_ExpWnd
-- ----------------------------------------------------------------------------

UI.Hangar_ExpWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_ExpWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "Hangar_ExpWnd",
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
				defName 			= "hangar_exp",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "progr_count",
						layer		= "UI.Hangar_ExpWnd.layers.NEW_EXP_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "level_progr",
						wnd			= "UI.Hangar_Exp_PBWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "progr_btn",
						wnd			= "UI.Hangar_Exp_FullExpBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "blink",
						layer		= "UI.Hangar_ExpWnd.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- NEW_EXP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			visible		= false,

			effects =
			{{
				defName 			= "hangar_exp_newExp",
				defaultAnimation	= "idle",

				links =
				{
					
					{
						objName		= "level_text",
						layer		= "UI.Hangar_ExpWnd.layers.NEW_EXP",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- NEW_EXP
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small", },
			visible			= false,
		},
		
		-- BLINK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hangar_exp_blink",
				defaultAnimation	= "idle",
			}}
		},
	},
	
	children = { "UI.Hangar_Exp_PBWnd", "UI.Hangar_Exp_FullExpBtn" }
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.Hangar_ExpWnd:OnAccountExpChanged( oldExp, newExp )

	if newExp > oldExp then

		self:StopAnimatingNewExp()

		self.bAnimatingNewExpVal	= true
		self.anim_startTime			= _G.TimerGetGameTime()
		self.anim_oldExp			= oldExp
		self.anim_newExp			= newExp
		self.anim_rank				= UI:GetPlayerAccountRank()
		
		self:SetLayerVisible( true, self.layers.NEW_EXP_EFFECT )
		self:SetLayerVisible( true, self.layers.NEW_EXP )
		UI:GetEffectFromLayer( self, self.layers.NEW_EXP_EFFECT ):StartAnimation( self.effectInfo.newExp.animIdle )
		
		self:SetExp( self.anim_oldExp, self.anim_rank )

	else
	
		if not self:IsAnimatingNewExp() then
			self:SetActualExp()
		end
		
	end
	
	self:UpdateTooltip()
	
end


--
function UI.Hangar_ExpWnd:OnAccountRankChanged()
	
	if not self:IsAnimatingNewExp() then
		self:SetActualExp()
	end
	
	self:UpdateTooltip()

end


--
function UI.Hangar_ExpWnd:CheckBlink()

	if not self:IsOnScreen() then
		return
	end
	
	if not UI.Hangar_Exp_FullExpBtn:IsChildOf( self ) then
		return
	end
	
	local rank = UI:GetPlayerAccountRank()
	if rank < UI:GetMaxAccountRank() and UI:GetPlayerAccountExp() >= UI:GetPlayerAccountRankExpCost( rank + 1 ) then
		
		self:SetLayerVisible( true, self.layers.BLINK_EFFECT )
		
		local blinkEffect = UI:GetEffectFromLayer( self, self.layers.BLINK_EFFECT )
		if blinkEffect then
			blinkEffect:RestartAnimation()
		end
		
	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_ExpWnd.layers =
{
	MAIN_EFFECT		= 0,
	NEW_EXP_EFFECT	= 1,
	NEW_EXP			= 2,
	BLINK_EFFECT	= 3,
}

UI.Hangar_ExpWnd.effectInfo =
{
	newExp =
	{
		animIdle	= "idle",
		animHide	= "hide",
	}
}

UI.Hangar_ExpWnd.ANIMATION_TIME = 1

-- ------------------------------
-- vars
-- ------------------------------

UI.Hangar_ExpWnd.bAnimatingNewExpVal	= false
UI.Hangar_ExpWnd.anim_startTime			= UI.INVALID_U64_ID
UI.Hangar_ExpWnd.anim_oldExp			= 0
UI.Hangar_ExpWnd.anim_newExp			= 0
UI.Hangar_ExpWnd.anim_rank				= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_ExpWnd:StopAnimatingNewExp( bSoftHide )

	if bSoftHide == nil then
		bSoftHide = false
	end
	
	self.bAnimatingNewExpVal	= false
	self.anim_startTime			= UI.INVALID_U64_ID
	self.anim_oldExp			= 0
	self.anim_newExp			= 0
	self.anim_rank				= -1
	
	if self:IsLayerVisible( self.layers.NEW_EXP_EFFECT ) then
	
		if bSoftHide then
		
			local newExpEffect = UI:GetEffectFromLayer( self, self.layers.NEW_EXP_EFFECT )
		
			if newExpEffect:GetCurAnimation() ~= self.effectInfo.newExp.animHide then
				newExpEffect:StartAnimation( self.effectInfo.newExp.animHide )
			end
		
		else
			self:SetLayerVisible( false, self.layers.NEW_EXP_EFFECT )
			self:SetLayerVisible( false, self.layers.NEW_EXP )
		end
		
	end

end


--
function UI.Hangar_ExpWnd:IsAnimatingNewExp()

	if self.bAnimatingNewExpVal then
		return true
	end
	
	if self:IsLayerVisible( self.layers.NEW_EXP_EFFECT ) and UI:GetEffectFromLayer( self, self.layers.NEW_EXP_EFFECT ):GetCurAnimation() == self.effectInfo.newExp.animHide then
		return true
	end
	
	return false

end


--
function UI.Hangar_ExpWnd:SetExp( exp, rank )
	
	local progress	= 1
	local maxRank	= UI:GetMaxAccountRank()
	
	-- прогрессбар/кнопка
	
	if rank < maxRank then
	
		local nextRankCost = UI:GetPlayerAccountRankExpCost( rank + 1 )
		
		progress = nextRankCost ~= 0 and exp / nextRankCost or 0
		progress = math.min( progress, 1 )
		
		if exp >= nextRankCost and not self:IsAnimatingNewExp() then
		
			self:RemoveChild( UI.Hangar_Exp_PBWnd )
			self:AddChild( UI.Hangar_Exp_FullExpBtn )
			
		else
		
			self:RemoveChild( UI.Hangar_Exp_FullExpBtn )
	
			self:AddChild( UI.Hangar_Exp_PBWnd )
			UI.Hangar_Exp_PBWnd:SetProgress( progress )
			
		end
		
	else
	
		self:RemoveChild( UI.Hangar_Exp_FullExpBtn )
	
		self:AddChild( UI.Hangar_Exp_PBWnd )
		UI.Hangar_Exp_PBWnd:SetProgress( progress )

	end
	
	-- цифра
	
	if self.bAnimatingNewExpVal then
		local deltaExp = exp - self.anim_oldExp
		local strDelatExp = string.format( "+%s", UI:Num2StrSeparatedBy3( deltaExp ) )
		self:SetText( strDelatExp, self.layers.NEW_EXP )
	end

end


--
function UI.Hangar_ExpWnd:SetActualExp()

	self:SetExp( UI:GetPlayerAccountExp(), UI:GetPlayerAccountRank() )
	
end


--
function UI.Hangar_ExpWnd:UpdateTooltip()

	local tooltipData = UI:GetAccountRankTooltipData()

	UI.Hangar_Exp_PBWnd:SetTooltipData( tooltipData )
	UI.Hangar_Exp_FullExpBtn:SetTooltipData( tooltipData )
	
end


--
function UI.Hangar_ExpWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:StopAnimatingNewExp()
	self:SetActualExp()
	self:SetLayerVisible( false, self.layers.BLINK_EFFECT )
	self:UpdateTooltip()

end


--
function UI.Hangar_ExpWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if not self.bAnimatingNewExpVal then
		return
	end
	
	local curTime = _G.TimerGetGameTime()
	
	local exp = UI:Lerp( self.anim_oldExp, self.anim_newExp, ( curTime - self.anim_startTime ) / self.ANIMATION_TIME )
	exp = UI:Round( exp )
	exp = UI:Clamp( exp, self.anim_oldExp, self.anim_newExp )
	
	self:SetExp( exp, self.anim_rank )
	
	if curTime >= self.anim_startTime + self.ANIMATION_TIME then
		self:StopAnimatingNewExp( true )
	end
	
end


--
function UI.Hangar_ExpWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == UI:GetEffectFromLayer( self, self.layers.NEW_EXP_EFFECT ) then
	
		if animName == self.effectInfo.newExp.animHide then
		
			self:SetLayerVisible( true, self.layers.NEW_EXP_EFFECT )
			self:SetLayerVisible( true, self.layers.NEW_EXP )
			
			self:SetActualExp()
			self:CheckBlink()
			
		end
		
	elseif effect == UI:GetEffectFromLayer( self, self.layers.BLINK_EFFECT ) then

		self:SetLayerVisible( false, self.layers.BLINK_EFFECT )
		
	end

end


--
function UI.Hangar_ExpWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end
	
	local rank = UI:GetPlayerAccountRank()
	if rank < UI:GetMaxAccountRank() and UI:GetPlayerAccountExp() >= UI:GetPlayerAccountRankExpCost( rank + 1 ) then
		UI.HangarWnd:ShowRankUpQuest( true )
	end

	return true
	
end


-- ----------------------------------------------------------------------------
--  UI.Hangar_Exp_PBWnd
-- ----------------------------------------------------------------------------

UI.Hangar_Exp_PBWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.Hangar_Exp_PBWnd.def =
{
	className	= "Wnd",
	
	props =
	{
		name	= "Hangar_Exp_PBWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "hangar_exp_pb",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "over",
						layer		= "UI.Hangar_Exp_PBWnd.layers.MOUSE_OVER_EFFECT",
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
				defName 			= "hangar_exp_pb_mouseOver",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ------------------------------
-- interface funtions
-- ------------------------------

--
function UI.Hangar_Exp_PBWnd:SetProgress( val )
	
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( val )
	end

end


--
function UI.Hangar_Exp_PBWnd:SetTooltipData( tooltipData )

	self.tooltipData = tooltipData
	
end


--
function UI.Hangar_Exp_PBWnd:GetTooltipData()

	return self.tooltipData

end

-- ------------------------------
-- const
-- ------------------------------

UI.Hangar_Exp_PBWnd.layers =
{
	MAIN_EFFECT			= 0,
	MOUSE_OVER_EFFECT	= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

UI.Hangar_Exp_PBWnd.tooltipData = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_Exp_PBWnd:UpdateMouseOver()

	local bMouseOver = false

	local rank = UI:GetPlayerAccountRank()
	local bCanClick = rank < UI:GetMaxAccountRank() and UI:GetPlayerAccountExp() >= UI:GetPlayerAccountRankExpCost( rank + 1 )
	
	if bCanClick then
		bMouseOver = UI:FindWindowUnderMouse( UI.Root, UI:GetMouseX(), UI:GetMouseY(), true ) == self
	end
	
	self:SetMouseOver( bMouseOver )

end


--
function UI.Hangar_Exp_PBWnd:SetMouseOver( bMouseOver )

	local bWasMouseOver = self:IsLayerVisible( self.layers.MOUSE_OVER_EFFECT )

	self:SetLayerVisible( bMouseOver, self.layers.MOUSE_OVER_EFFECT )

	if bMouseOver and not bWasMouseOver and self:IsOnScreen() then
		UI:PlayGlobalSound( UI.sounds.btnMouseOver )
	end

end


--
function UI.Hangar_Exp_PBWnd:F_OnMouseIn( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseIn( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:UpdateMouseOver()
	return true

end


--
function UI.Hangar_Exp_PBWnd:F_OnMouseOut( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseOut( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:SetMouseOver( false )
	return true	

end


--
function UI.Hangar_Exp_PBWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMouseOver()

end

-- ----------------------------------------------------------------------------
--  UI.Hangar_Exp_FullExpBtn
-- ----------------------------------------------------------------------------

UI.Hangar_Exp_FullExpBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name		= "Hangar_Exp_FullExpBtn",
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
					defName 			= "hangar_exp_fullExpBtn",
					defaultAnimation	= "idle",

					links =
					{
						{
							objName		= "self",	
							animParams	= UI.EffectAnimParams.SIZE,
						},

						{
							objName		= "text",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
	
	textId = "hangar_fullExpBtn"
}

-- -------------------------------------------------------------------------
-- UI.Hangar_QuestsWnd
-- -------------------------------------------------------------------------

UI.Hangar_QuestsWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Hangar_QuestsWnd.def =
{
	className	= "ButtonWnd",
	prototype	= "QuestsWnd",

	props =
	{
		name		= "Hangar_QuestsWnd",
	},
}

-- ---------------------------
-- const
-- ---------------------------

UI.Hangar_QuestsWnd.mainWndName = "HangarWnd"

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Hangar_QuestsWnd:GetBundleLaunchData()

	return nil

end


--
function UI.Hangar_QuestsWnd:GetShipsLaunchData()

	return nil

end


-- вызывается из UI.Quests_TabsWnd
function UI.Hangar_QuestsWnd:OnSelTabChanged()

	UI.QuestsWnd.OnSelTabChanged( self )
	UI.HangarWnd:OnQuestsOpenStateChanged()
	
end

-- ------------------------------------------------------------
-- UI.Hangar_CrossBtn
-- ------------------------------------------------------------

UI.Hangar_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn2",

    	props =
    	{
    		name = "Hangar_CrossBtn"
    	}
	}
}

-- ------------------------------------------------------------
-- UI.Hangar_TalentsBtn
-- ------------------------------------------------------------

UI.Hangar_TalentsBtn = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Hangar_TalentsBtn.layers =
{
	MAIN_EFFECT		= 0,
	DEBUG			= 1,
	TEXT			= 2,
	BLINK_EFFECT	= 3,
}

UI.Hangar_TalentsBtn.def =
{
	className	= "ButtonWnd",
	prototype	= "TextBtn",

	props =
	{
		name	= "Hangar_TalentsBtn"
	},
	
	layers =
	{
		numLayers = UI:GetTableLength( UI.Hangar_TalentsBtn.layers ),
		
		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "hangar_talentsBtn_new",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value43",
						layer		= "UI.Hangar_TalentsBtn.layers.TEXT",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "blink6",
						layer		= "UI.Hangar_TalentsBtn.layers.BLINK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

				}
			}}
		},
		
		-- BLINK_EFFECT
		{
			id			= UI.Hangar_TalentsBtn.layers.BLINK_EFFECT,
			
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

 			effects =
 			{{
 				defName 			= "hangar_menu_btn_notify",
 				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------
-- vars
-- ---------------------------

--
function UI.Hangar_TalentsBtn:Blink( bBlink )

	self:SetLayerVisible( bBlink, self.layers.BLINK_EFFECT )
	
end

-- ---------------------------
-- const
-- ---------------------------

UI.Hangar_TalentsBtn.textId = "hangar_menuTab_SKILLS"

-- ------------------------------------------------------------
-- UI.Hangar_CurrentEventInfoWnd
-- ------------------------------------------------------------

UI.Hangar_CurrentEventInfoWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.Hangar_CurrentEventInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "Hangar_CurrentEventInfoWnd",
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
				defName 			= "hangar_battlePassInfo",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "text26",
						layer		= "UI.Hangar_CurrentEventInfoWnd.layers.EVENT_END_TIME",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "bp_btn3",
						wnd			= "UI.Hangar_CurrentEventInfo_ShowWindowBtn",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- EVENT_END_TIME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	},
	
	children = { "UI.Hangar_CurrentEventInfo_ShowWindowBtn" }
}

-- ---------------------------
-- const
-- ---------------------------

UI.Hangar_CurrentEventInfoWnd.layers =
{
	MAIN_EFFECT		= 0,
	EVENT_END_TIME	= 1,
}

-- ---------------------------
-- vars
-- ---------------------------

UI.Hangar_CurrentEventInfoWnd.timeLeft = -1

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.Hangar_CurrentEventInfoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateEventEndTime()
	
end


--
function UI.Hangar_CurrentEventInfoWnd:UpdateEventEndTime()
	
	local timeLeftSec = 0
	
	if _G.MasterServer_BattlePassIsActive() then
		local endTime		= UI:GetBattlePassEndTime()
		local curTime		= _G.MasterServer_IsConnected() and _G.MasterServer_GetServerTime() or  UI.INVALID_U64_ID
		timeLeftSec			= ( endTime > curTime ) and ( ( endTime - curTime ) * 0.001 ).l or 0
	elseif _G.MasterServer_GetLeadingAdvertInfo().isActive then
		timeLeftSec			= _G.MasterServer_GetLeadingAdvertInfo().leftSeconds
	end
	
	if timeLeftSec ~= self.timeLeft then
	
		self.timeLeft = timeLeftSec
		
		local strTime = UI:Time2Str45( timeLeftSec )
		self:SetText( strTime, self.layers.EVENT_END_TIME )

	end

end


-- ------------------------------------------------------------
-- UI.Hangar_CurrentEventInfo_ShowWindowBtn
-- ------------------------------------------------------------

UI.Hangar_CurrentEventInfo_ShowWindowBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "TextBtn",
		
		props =
		{
			name	= "Hangar_CurrentEventInfo_ShowWindowBtn"
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
					defName 			= "battlePass_btn3",
					defaultAnimation	= "idle",
	
					links =
					{
						{
							objName		= "self",
							animParams	= UI.EffectAnimParams.SIZE,
						},
	
						{
							objName		= "text22",
							layer		= "UI.TextBtn.layers.TEXT",
							animParams	= UI.EffectAnimParams.ALL,
						},
					}
				}}
			},
		}
	},
	
	textId = "currentEvent_showWindowBtn"
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.Hangar_CurrentEventInfo_ShowWindowBtn:UpdateName()

	if _G.MasterServer_BattlePassIsActive() then
	
		self:SetBtnText( UI:GetStringByName( "battlePass_showWindowBtn" ) )
	
	elseif _G.MasterServer_GetLeadingAdvertInfo().isActive then
	
		local advertId = UI.Marketing_ActionsWnd:GetLeadingActionId()
		local localizedName = UI.Marketing_ActionsWnd:GetActionName( advertId )
		
		if localizedName and localizedName ~= "" then
		
			self:SetBtnText( localizedName )
		
		else
		
			self:SetBtnText( UI:GetStringByName( "currentEvent_showWindowBtn" ) )
		
		end
		
	end
	
end

-- -----------------------------------------------------------
-- UI.HangarShipInfoWnd
-- -----------------------------------------------------------

UI.HangarShipInfoWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.HangarShipInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HangarShipInfoWnd",
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
				defName 			= "ship_info_1080",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру и цвету
					{
						objName		= "name",
						layer		= "UI.HangarShipInfoWnd.layers.SHIP_NAME",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.SIZE - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role",
						layer		= "UI.HangarShipInfoWnd.layers.ROLE_ICO_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "role_title",
						layer		= "UI.HangarShipInfoWnd.layers.ROLE_NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},

					{
						objName		= "sinerg",
						layer		= "UI.HangarShipInfoWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
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

		-- ROLE_ICO_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "shipRole_big_main_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "role_ico",
						layer		= "UI.HangarShipInfoWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- ROLE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco_1080",
				defaultAnimation	= "white",
			}}
		},

		-- ROLE_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "ship_info_work_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "role_title1",
						layer		= "UI.HangarShipInfoWnd.layers.RANK_LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},

					-- не линкуется по цвету
					{
						objName		= "name7",
						layer		= "UI.HangarShipInfoWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "role_title2",
						layer		= "UI.HangarShipInfoWnd.layers.SYNERGY_LEVEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},

		-- RANK_LABEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "shipInfo_rank" ),
		},
	
		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	
		-- SYNERGY_LEVEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	}
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.HangarShipInfoWnd:Setup( shipDefName )

	self:Reset()

	self.shipDefName = shipDefName
	self:FullUpdate()

end


--
function UI.HangarShipInfoWnd:Reset()

	self.shipDefName	= shipDefName
	self.tooltipData	= nil

	self:SetText( "", self.layers.SHIP_NAME )
	self:SetText( "", self.layers.ROLE_NAME )
	self:SetText( "", self.layers.RANK )
	self:SetText( "", self.layers.SYNERGY_LEVEL )

	local roleIcoMainEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_MAIN_EFFECT )
	if roleIcoMainEffect then
		roleIcoMainEffect:SetSpriteTexture( self.effectInfo.roleIcoMain.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.HangarShipInfoWnd:GetTooltipData()

	return self.tooltipData

end


--
function UI.HangarShipInfoWnd:OnVesselLevelUp()

	self:UpdateSynergy()
	
end


--
function UI.HangarShipInfoWnd:OnVesselActivateNode()

	self:UpdateRank()
	
end


-- ---------------------------
-- const
-- ---------------------------

UI.HangarShipInfoWnd.layers =
{
    MAIN_EFFECT				= 0,
    SHIP_NAME				= 1,
    ROLE_ICO_MAIN_EFFECT	= 2,
    ROLE_ICO_EFFECT			= 3,
    ROLE_NAME				= 4,
    WORK_EFFECT				= 5,	-- нужен, чтобы не двигать по отдельности элементы в зависимости от длины имени корабля
    RANK_LABEL				= 6,
    RANK					= 7,
    SYNERGY_LEVEL			= 8,
}

UI.HangarShipInfoWnd.effectInfo =
{
	main =
	{
		shipNameLocator	= "name",
		roleNameLocator	= "role_title",
		workLocator		= "sinerg",
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	},

	roleIcoMain =
	{
		spriteName = "race_ico9"
	},

	roleIco =
	{
		spriteName = "ico"
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.HangarShipInfoWnd.shipDefName		= ""
UI.HangarShipInfoWnd.tooltipData		= nil
UI.HangarShipInfoWnd.space_name_work	= 0
UI.HangarShipInfoWnd.space_work_right	= 0
UI.HangarShipInfoWnd.minWidth			= 0
UI.HangarShipInfoWnd.maxWidth			= 0
UI.HangarShipInfoWnd.workWidth			= 0

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.HangarShipInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end

	self:PrepareLayout()

end


--
function UI.HangarShipInfoWnd:FullUpdate()

	self:UpdateShipName()
	self:UpdateRole()
	self:UpdateRank()
	self:UpdateSynergy()
	self:UpdateTooltip()

	self:RecalcLayout()

end


--
function UI.HangarShipInfoWnd:UpdateShipName()

	local name = UI:GetEntityLocalizedNameByDef( self.shipDefName, true, false, nil, nil, true--[["альтернативный" цвет]] )
	self:SetText( name, self.layers.SHIP_NAME )

end


--
function UI.HangarShipInfoWnd:UpdateRole()

	local role = UI:GetItemRole( self.shipDefName )

	-- фон иконки

	local race = UI:GetShipRace( self.shipDefName )
	local raceName = UI:Val2Key( ai.Race, race )

	local texBgName = string.format( "shipRole_bg_%s", raceName )
	local hTexBg = UI:GetTex( texBgName )

	local roleIcoMainEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_MAIN_EFFECT )
	if roleIcoMainEffect then
		roleIcoMainEffect:SetSpriteTexture( self.effectInfo.roleIcoMain.spriteName, hTexBg )
	end

	-- иконка

	local hTexRole = UI:GetRoleIco( role )
	local color = UI:GetItemColor( self.shipDefName, false, true--[["альтернативный" цвет]] )

	local roleIcoEffect = UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )
	if roleIcoEffect then
		roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.spriteName, hTexRole )
		roleIcoEffect:SetColor( color )
	end

	-- имя

	local strRole = UI:Role2Str( role )
	self:SetText( strRole, self.layers.ROLE_NAME )
	
end


--
function UI.HangarShipInfoWnd:UpdateRank()

	local rank = UI:GetShipRank( self.shipDefName )
	self:SetText( tostring( rank ), self.layers.RANK )
	
	local color = UI:GetItemColor( self.shipDefName, false, true--[["альтернативный" цвет]] )
	self:SetColor( color, self.layers.RANK )
	
end


--
function UI.HangarShipInfoWnd:UpdateSynergy()

	local str = ""
	
	if not UI:IsShipEvolving( self.shipDefName ) then
	
		local level = 1

		local shipItem = UI:GetShipItemByDef( self.shipDefName, true--[[-- в т.ч. если ранее был куплен, но потом продан]] )
		if shipItem then
			level = UI:GetShipLevel( shipItem )
		else
			level = UI:GetShipDefaultLevel( self.shipDefName )	-- уровень, с которым будет создан
		end
		
		str = tostring( level )
		
	end
	
	self:SetText( str, self.layers.SYNERGY_LEVEL )

end


--
function UI.HangarShipInfoWnd:UpdateTooltip()

	local shipItem = UI:GetShipItemByDef( self.shipDefName, true )

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.SHIP,
		defName		= self.shipDefName,
		vid			= shipItem and shipItem.vid or UI.INVALID_U64_ID,
	}

end


--
function UI.HangarShipInfoWnd:PrepareLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local workEffect	= UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )

	local shipNamePos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.shipNameLocator ) or Vec2( 0, 0 )
	local shipNameSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.shipNameLocator ) or Vec2( 0, 0 )
	local roleNamePos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.roleNameLocator ) or Vec2( 0, 0 )
	local roleNameSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.roleNameLocator ) or Vec2( 0, 0 )
	local workPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.workLocator ) or Vec2( 0, 0 )
	local workSize		= workEffect and workEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local selfMinSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ) or Vec2( 0, 0 )
	local selfMaxSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ) or Vec2( 0, 0 )

    self.space_name_work	= workPos.x - ( math.max( shipNamePos.x + shipNameSize.x, roleNamePos.x + roleNameSize.x ) )
    self.space_work_right	= selfMinSize.x - ( workPos.x + workSize.x )
    self.minWidth			= selfMinSize.x
    self.maxWidth			= selfMaxSize.x
	self.workWidth			= workSize.x

	self:SetHeight( selfMaxSize.y )
	self:SetLayerHeight( shipNameSize.y, self.layers.SHIP_NAME )

end


--
function UI.HangarShipInfoWnd:RecalcLayout()

	-- имя корабля - ширина

	local formatRect = UI:Quat( 0, 0, 10000000, self:GetLayerHeight( self.layers.SHIP_NAME ) )
	
	local shipNameWidth = _G.MeasureText(
		self:GetText( self.layers.SHIP_NAME ),
		self:GetFont( self.layers.SHIP_NAME ),
		formatRect,
		self:GetTextFormatFlags( self.layers.SHIP_NAME ),
		formatRect ).z

	self:SetLayerWidth( shipNameWidth, self.layers.SHIP_NAME )


	-- элементы правее имени (WORK_EFFECT с дочерние) - позиция x

	local nameRight = math.max( self:GetLayerLeft( self.layers.SHIP_NAME ) + self:GetLayerWidth( self.layers.SHIP_NAME ), self:GetLayerLeft( self.layers.ROLE_NAME ) + self:GetLayerWidth( self.layers.ROLE_NAME ) )
	local workX = nameRight + self.space_name_work

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetPos( UI:Vec2( workX, workEffect:GetPos().y ) )

	end


	-- собственная ширина и анимация фона

	local selfWidth = workX + self.workWidth + self.space_work_right
	selfWidth = UI:Clamp( selfWidth, self.minWidth, self.maxWidth )
	
	self:SetWidth( selfWidth )

	local animTime = ( selfWidth - self.minWidth ) / ( self.maxWidth - self.minWidth )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTimeAndUpdate( animTime )
	end

end

-- ------------------------------------------------------------
-- UI.HangarShipMainParamsWnd
-- ------------------------------------------------------------

UI.HangarShipMainParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipMainParamsWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "HangarShipMainParamsWnd",
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
				defName 			= "shipsTree_alienEdit_mainParams_1080",
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
function UI.HangarShipMainParamsWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.HangarShipMainParamsWnd:Reset()

	self.shipDefName		= ""
	self.chosenNodesMask	= nil
	self.shipItem			= nil

	self:Clear()

end


--
function UI.HangarShipMainParamsWnd:OnOwnedVessels()

	if UI:IsShipEvolving( self.shipDefName ) then
		self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )
	else
		self.shipItem = UI:GetShipItemByDef( self.shipDefName, true--[[-- в т.ч. если ранее был куплен, но потом продан]] )
	end

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnOwnedVessels()
		end

	end


end


--
function UI.HangarShipMainParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnChosenActiveNodesChanged()
		end

	end

end


--
function UI.HangarShipMainParamsWnd:OnEventInvItemsChanged()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnEventInvItemsChanged()
		end

	end

end


--
function UI.HangarShipMainParamsWnd:OnVesselLevelUp()

	for recordIdx = 1, self:GetNumRecords() do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then
			slotWnd:OnVesselLevelUp()
		end

	end
	
end


--
function UI.HangarShipMainParamsWnd:GetShipDefName()

	return self.shipDefName

end


--
function UI.HangarShipMainParamsWnd:GetChosenActiveNodesMask()

	return self.chosenNodesMask

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HangarShipMainParamsWnd.btnPrototypeName	= "HangarShipMainParamSlotWnd"
UI.HangarShipMainParamsWnd.MAX_SLOTS		= 4
UI.HangarShipMainParamsWnd.listStyle		= UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION

UI.HangarShipMainParamsWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "progr_prop_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.HangarShipMainParamsWnd.paramNames =
{
	"hull_health",
	"shield_max",
	"energy_max",
	"max_speed",
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HangarShipMainParamsWnd.shipDefName		= ""
UI.HangarShipMainParamsWnd.chosenNodesMask	= nil
UI.HangarShipMainParamsWnd.shipItem			= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HangarShipMainParamsWnd:FullUpdate()
	
	if UI:IsShipEvolving( self.shipDefName ) then
		self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )
	else
		self.shipItem = UI:GetShipItemByDef( self.shipDefName, true--[[-- в т.ч. если ранее был куплен, но потом продан]] )
	end

	self:UpdateSlots()

end


--
function UI.HangarShipMainParamsWnd:UpdateSlots()

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
			self:AddRecord( { paramInfo = paramInfo } )
		else
			sys.log( "UI.HangarShipMainParamsWnd:UpdateSlots()[ERROR]; cannot find param info for \"%s\"", paramName )
		end

	end

end


-- ------------------------------------------------------------
-- UI.HangarShipMainParamSlotWnd
-- ------------------------------------------------------------

UI.HangarShipMainParamSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipMainParamSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "HangarShipMainParamSlotWnd",
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
				defName 			= "shipsTree_alienEdit_mainParamSlot_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "slot",
						layer		= "UI.HangarShipMainParamSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_1",
						layer		= "UI.HangarShipMainParamSlotWnd.layers.BAR_DEC_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_2",
						layer		= "UI.HangarShipMainParamSlotWnd.layers.BAR_INC_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "progr_3",
						layer		= "UI.HangarShipMainParamSlotWnd.layers.BAR_CUR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "count",
						layer		= "UI.HangarShipMainParamSlotWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,	-- не линкуется по цвету
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
				defName 			= "ship_mainParamSlot_ico_1080",
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
				defName 			= "shipsTree_alienEdit_mainParamSlot_barDec_1080",
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
				defName 			= "shipsTree_alienEdit_mainParamSlot_barInc_1080",
				defaultAnimation	= "idle",
			}}
		},

		-- BAR_CUR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
			
			effects =
			{{
				defName 			= "ship_mainParamSlot_bar_1080",
				defaultAnimation	= "idle",
			}}
		},
		
		-- VAL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Large" },
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.HangarShipMainParamSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT ) 
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self:ResetBar()

end


--
function UI.HangarShipMainParamSlotWnd:OnOwnedVessels()

	self:UpdateBar( self:GetRecordData() )

end


--
function UI.HangarShipMainParamSlotWnd:OnChosenActiveNodesChanged()

	self:UpdateBar( self:GetRecordData() )

end


--
function UI.HangarShipMainParamSlotWnd:OnEventInvItemsChanged()

	self:UpdateBar( self:GetRecordData() )
	
end


--
function UI.HangarShipMainParamSlotWnd:OnVesselLevelUp()

	self:UpdateBar( self:GetRecordData() )
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HangarShipMainParamSlotWnd.layers =
{
	MAIN_EFFECT		= 0,
	ICO_EFFECT		= 1,
	BAR_DEC_EFFECT	= 2,
	BAR_INC_EFFECT	= 3,
	BAR_CUR_EFFECT	= 4,
	VAL				= 5,
}

UI.HangarShipMainParamSlotWnd.effectInfo =
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
function UI.HangarShipMainParamSlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateIco( data )
	self:UpdateBar( data )

end


--
function UI.HangarShipMainParamSlotWnd:UpdateIco( data )

	local hTex = UI:GetShipParamIco( data.paramInfo )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT ) 
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )
	end

end


--
function UI.HangarShipMainParamSlotWnd:UpdateBar( data )

	self:ResetBar()

	local shipDefName = self:GetShipDefName()
	
	local shipItem = nil
	if UI:IsShipEvolving( shipDefName ) then
		shipItem = UI:GetEvolvingShipItem( shipDefName )
	else
		shipItem = UI:GetShipItemByDef( shipDefName, true--[[-- в т.ч. если ранее был куплен, но потом продан]] )
	end
	
	local spawnDataCommitted = shipItem and UI:GetShipSpawnData( shipItem.vid, true, nil, true--[[с талантами SC-112894]], false--[[без автогенов SC-112894]] ) or UI:GetShipDefaultSpawnData( shipDefName )
	local dataCommitted = { params = _G.CL_GetShipParamsFromSpawnData( spawnDataCommitted ) }
	local valsCommitted = UI:GetParamVals( shipDefName, data.paramInfo, UI.paramSrcTypes.SHIP, dataCommitted, false )
	
	local valsChosen = nil
	if shipItem and not shipItem.conserved then
		
		local chosenNodesMask = self:GetChosenActiveNodesMask()
		if chosenNodesMask then
		
			local spawnDataChosen = UI:GetShipSpawnData( shipItem.vid, true, chosenNodesMask, true--[[с талантами SC-112894]] )
			local dataChosen = { params = _G.CL_GetShipParamsFromSpawnData( spawnDataChosen ) }
			valsChosen = UI:GetParamVals( shipDefName, data.paramInfo, UI.paramSrcTypes.SHIP, dataChosen, false )
			
		end

	end

	if #valsCommitted ~= 1 or ( valsChosen and #valsChosen ~= 1 ) then
		sys.log( "UI.HangarShipMainParamSlotWnd:UpdateBar()[ERROR]: expected only one val per parameter" )
		return
	end

	local valCommitted	= valsCommitted[ 1 ]
	local valChosen		= valsChosen and valsChosen[ 1 ]
	local valMax		= UI:GetShipParamMaxVal( shipDefName, data.paramInfo.name )
	
	local barCurEffect = UI:GetEffectFromLayer( self, self.layers.BAR_CUR_EFFECT ) 
	local barIncEffect = UI:GetEffectFromLayer( self, self.layers.BAR_INC_EFFECT ) 
	local barDecEffect = UI:GetEffectFromLayer( self, self.layers.BAR_DEC_EFFECT ) 
	
	local shipColor = UI:GetItemColor( shipDefName, false, true--[["альтернативный" цвет]] )
	if barCurEffect then
		barCurEffect:SetColor( shipColor )
	end

	if valChosen and valChosen > valCommitted then

		-- полоса цветом корабля
		local curAnimTime = valMax ~= 0 and math.min( valCommitted / valMax, 1 ) or 1
		if barCurEffect then
			barCurEffect:SetAnimationTimeAndUpdate( curAnimTime )
		end

		-- зеленая полоса
		self:SetLayerVisible( true, self.layers.BAR_INC_EFFECT )

		local incAnimTime = valMax ~= 0 and math.min( valChosen / valMax, 1 ) or 1
		if barIncEffect then
			barIncEffect:SetAnimationTimeAndUpdate( incAnimTime )
		end
	
	elseif valChosen and valChosen < valCommitted then

		-- полоса цветом корабля
		local curAnimTime = valMax ~= 0 and math.min( valChosen / valMax, 1 ) or 1
		if barCurEffect then
			barCurEffect:SetAnimationTimeAndUpdate( curAnimTime )
		end

		-- красная полоса
		self:SetLayerVisible( true, self.layers.BAR_DEC_EFFECT )

		local decAnimTime = valMax ~= 0 and math.min( valCommitted / valMax, 1 ) or 1
		if barDecEffect then
			barDecEffect:SetAnimationTimeAndUpdate( decAnimTime )
		end

	else

		-- полоса цветом корабля
		local curAnimTime = valMax ~= 0 and math.min( valCommitted / valMax, 1 ) or 1
		if barCurEffect then
			barCurEffect:SetAnimationTimeAndUpdate( curAnimTime )
		end

	end
	
	-- значение в текстовом виде (цветом корабля)
	local valForText = valChosen or valCommitted
	local strVal = UI:Num2StrSeparatedBy3( valForText )
	self:SetText( strVal, self.layers.VAL )
	self:SetColor( shipColor, self.layers.VAL )

end


--
function UI.HangarShipMainParamSlotWnd:ResetBar()

	self:SetLayerVisible( false, self.layers.BAR_DEC_EFFECT )
	self:SetLayerVisible( false, self.layers.BAR_INC_EFFECT )

	local barCurEffect = UI:GetEffectFromLayer( self, self.layers.BAR_CUR_EFFECT ) 
	if barCurEffect then
		barCurEffect:SetAnimationTimeAndUpdate( 0 )
	end
	
	self:SetText( "", self.layers.VAL )

end


--
function UI.HangarShipMainParamSlotWnd:GetShipDefName()

	local shipDefName = ""

	local parent = self:GetParent()
	if parent then

		if parent.GetShipDefName then
			shipDefName = parent:GetShipDefName()
		else
			sys.log( "UI.HangarShipMainParamSlotWnd:GetShipDefName()[ERROR]: no way to get ship item - parent doesn't support GetShipDefName()" )
		end

	else
		sys.log( "UI.HangarShipMainParamSlotWnd:GetShipDefName()[ERROR]: no way to get ship item - no parent" )
	end

	return shipDefName

end


--
function UI.HangarShipMainParamSlotWnd:GetChosenActiveNodesMask()

	local chosenNodesMask = nil

	local parent = self:GetParent()
	if parent then

		if parent.GetChosenActiveNodesMask then
			chosenNodesMask = parent:GetChosenActiveNodesMask()
		else
			sys.log( "UI.HangarShipMainParamSlotWnd:GetChosenActiveNodesMask()[ERROR]: no way to get chosen nodes mask - parent doesn't support GetChosenActiveNodesMask()" )
		end

	else
		sys.log( "UI.HangarShipMainParamSlotWnd:GetChosenActiveNodesMask()[ERROR]: no way to get dchosen nodes mask - no parent" )
	end

	return chosenNodesMask

end


-- ------------------------------------------------------------
-- UI.HangarShipSurvivabilityWnd
-- ------------------------------------------------------------

UI.HangarShipSurvivabilityWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipSurvivabilityWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HangarShipSurvivabilityWnd",
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
				defName 			= "shipsTree_alienEdit_survivability_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title_survival",
						layer		= "UI.HangarShipSurvivabilityWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},

					-- не линкуется по цвету
					{
						objName		= "vol_survival",
						layer		= "UI.HangarShipSurvivabilityWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.ALL - UI.EffectAnimParams.COLOR,
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
function UI.HangarShipSurvivabilityWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.HangarShipSurvivabilityWnd:Reset()

	self.shipDefName		= ""
	self.chosenNodesMask	= nil
	self.shipItem			= nil

	self.valMetaText:SetText( "", true )

end


--
function UI.HangarShipSurvivabilityWnd:OnOwnedVessels()

	self:FullUpdate()

end


--
function UI.HangarShipSurvivabilityWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask
	
	self:FullUpdate()

end


--
function UI.HangarShipSurvivabilityWnd:OnEventInvItemsChanged()

	self:FullUpdate()
	
end


--
function UI.HangarShipSurvivabilityWnd:OnVesselLevelUp()

	self:FullUpdate()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HangarShipSurvivabilityWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	VAL			= 2,
}

UI.HangarShipSurvivabilityWnd.paramName = "effective_health"

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HangarShipSurvivabilityWnd.shipDefName		= ""
UI.HangarShipSurvivabilityWnd.chosenNodesMask	= nil
UI.HangarShipSurvivabilityWnd.shipItem			= nil
UI.HangarShipSurvivabilityWnd.valMetaText		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HangarShipSurvivabilityWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.valMetaText = UI.MetaText.GetNewInstance()
	self.valMetaText:InitFromLayer( self, self.layers.VAL )

	self:InitCaption()

end


--
function UI.HangarShipSurvivabilityWnd:F_Shutdown()

	if self.valMetaText then
		self.valMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HangarShipSurvivabilityWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.HangarShipSurvivabilityWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.HangarShipSurvivabilityWnd:UpdateMetaTextPos()

	self.valMetaText:UpdateScreenOrgFromLayer( self, self.layers.VAL )

end


--
function UI.HangarShipSurvivabilityWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.VAL then
		self.valMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.HangarShipSurvivabilityWnd:InitCaption()

	local str = UI:ShipParam2StrByName( self.paramName )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.HangarShipSurvivabilityWnd:FullUpdate()

	if UI:IsShipEvolving( self.shipDefName ) then
		self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )
	else
		self.shipItem = UI:GetShipItemByDef( self.shipDefName, true--[[-- в т.ч. если ранее был куплен, но потом продан]] )
	end

	self:UpdateVal()

end


--
function UI.HangarShipSurvivabilityWnd:UpdateVal()

	local str = ""
	
	local paramInfo = nil

	local params = UI:GetShipTooltipAllParams( self.shipDefName )
	for paramIdx, _paramInfo in pairs( params ) do

		if _paramInfo.name == self.paramName then
			paramInfo = _paramInfo
			break
		end

	end
	
	if paramInfo then

		local spawnDataCur = self.shipItem and UI:GetShipSpawnData( self.shipItem.vid, true, nil, true--[[с талантами SC-112894]], false--[[без автогенов SC-112894]] ) or UI:GetShipDefaultSpawnData( self.shipDefName )
		local dataCur = { params = _G.CL_GetShipParamsFromSpawnData( spawnDataCur ) }
		local valsCur = UI:GetParamVals( self.shipDefName, paramInfo, UI.paramSrcTypes.SHIP, dataCur, false )

		local valsToShow = valsCur
		
		if self.shipItem and not self.shipItem.conserved then

			if self.chosenNodesMask then
				local spawnDataChosen = UI:GetShipSpawnData( self.shipItem.vid, true, self.chosenNodesMask, true--[[с талантами SC-112894]] )
				local dataChosen = { params = _G.CL_GetShipParamsFromSpawnData( spawnDataChosen ) }
				valsToShow = UI:GetParamVals( self.shipDefName, paramInfo, UI.paramSrcTypes.SHIP, dataChosen, false )
			end
			
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
			sys.log( "UI.HangarShipSurvivabilityWnd:UpdateVal()[ERROR]: unhandled case - exactly one val expected" )
		end			

		local color = UI:GetItemColor( self.shipDefName, false, true--[["альтернативный" цвет]] )

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
			sys.log( "UI.HangarShipSurvivabilityWnd:UpdateVal()[ERROR]: fail to convert vals to string" )
		end

	else
		sys.log( "UI.HangarShipSurvivabilityWnd:UpdateVal()[ERROR]: cannot find info for parameter \"%s\"", self.paramName )
	end

	self.valMetaText:SetText( str, true )

end


-- ------------------------------------------------------------
-- UI.HangarShipParamsWnd
-- ------------------------------------------------------------

UI.HangarShipParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipParamsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HangarShipParamsWnd",
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
				defName 			= "shipsTree_alienEdit_params_1080",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.HangarShipParamsWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "not_bonus",
						layer		= "UI.HangarShipParamsWnd.layers.NO_PARAMS",
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
function UI.HangarShipParamsWnd:Setup( shipDefName, chosenNodesMask, bShowBonuses, bHideIfNoParams )

	self:Reset()
	
	self.bHideIfNoParams = bHideIfNoParams

	self.changedParamsWnd:Setup( shipDefName, chosenNodesMask )
	
	if bShowBonuses then
		self.workWnd:AddChild( self.bonusesWnd )
		self.bonusesWnd:Setup( shipDefName, chosenNodesMask )
	end

	self:UpdateNoParams()

	self:RecalcLayout( false )

end


--
function UI.HangarShipParamsWnd:Reset()

	self.bHideIfNoParams = false

	self:SetLayerVisible( false, self.layers.NO_PARAMS )
	self:SetLayerVisible( true, self.layers.CAPTION )
	self:SetLayerVisible( true, self.layers.MAIN_EFFECT )
	self.changedParamsWnd:Reset()
	self.bonusesWnd:Reset()
	self.bonusesWnd:UnlinkFromParent()

	self:RecalcLayout( false )

end


--
function UI.HangarShipParamsWnd:OnOwnedVessels()

	self.changedParamsWnd:OnOwnedVessels()
	
	if self.bonusesWnd:IsChildOf( self ) then
		self.bonusesWnd:OnOwnedVessels()
	end

	self:UpdateNoParams()

	self:RecalcLayout( true )

end


--
function UI.HangarShipParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.changedParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )
	
	if self.bonusesWnd:IsChildOf( self ) then
		self.bonusesWnd:OnChosenActiveNodesChanged( chosenNodesMask )
	end

	self:UpdateNoParams()

	self:RecalcLayout( true )

end


--
function UI.HangarShipParamsWnd:OnEventInvItemsChanged()

	self.changedParamsWnd:OnEventInvItemsChanged()
	
	if self.bonusesWnd:IsChildOf( self ) then
		self.bonusesWnd:OnEventInvItemsChanged()
	end

	self:UpdateNoParams()

	self:RecalcLayout( true )
	
end


--
function UI.HangarShipParamsWnd:OnVesselLevelUp()

	self.changedParamsWnd:OnVesselLevelUp()
	
	if self.bonusesWnd:IsChildOf( self ) then
		self.bonusesWnd:OnVesselLevelUp()
	end

	self:UpdateNoParams()

	self:RecalcLayout( true )
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HangarShipParamsWnd.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	NO_PARAMS	= 2,
}

UI.HangarShipParamsWnd.SCROLL_STEP				= UI:YTo1024x768( 30 )
UI.HangarShipParamsWnd.space_controls_scrollBar	= UI:XTo1024x768( 5 )

UI.HangarShipParamsWnd.effectInfo =
{
	main =
	{
		changedParamsLocator	= "proper",
		bonusesLocator			= "proper1",
		scrollBarLocator		= "scroll",
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HangarShipParamsWnd.bHideIfNoParams	= false

UI.HangarShipParamsWnd.maskWnd			= nil
UI.HangarShipParamsWnd.workWnd			= nil
UI.HangarShipParamsWnd.scrollBar		= nil
UI.HangarShipParamsWnd.changedParamsWnd	= nil
UI.HangarShipParamsWnd.bonusesWnd		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HangarShipParamsWnd:F_PostLoad()

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
function UI.HangarShipParamsWnd:CreateControls()

	self.maskWnd = UI:CreateChildWnd( self, UI.HangarShipParams_MaskWnd, "" )
	self:AddChild( self.maskWnd )
	
	self.workWnd = UI:CreateChildWnd( self, UI.HangarShipParams_WorkWnd, "" )
	self.maskWnd:AddChild( self.workWnd )

	self.changedParamsWnd = UI:CreateChildWnd( self, UI.HangarShipParams_ChangedParamsWnd, "" )
	self.workWnd:AddChild( self.changedParamsWnd )

	self.bonusesWnd = UI:CreateChildWnd( self, UI.HangarShipParams_BonusesWnd, "" )	

end


--
function UI.HangarShipParamsWnd:InitScrollBar()	

	self.scrollBar = UI:CreateChildWnd( self, UI.EffectScrollWnd_Vrt_2_1080, "" )
	self.scrollBar:SetStepSize( self.SCROLL_STEP )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:LinkWnd( self.scrollBar:GetUiHandle(), self.effectInfo.main.scrollBarLocator, UI.EffectAnimParams.ALL )
	end

end


--
function UI.HangarShipParamsWnd:RecalcLayout( bSaveScrollPos )

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
	
	if self.bonusesWnd:IsChildOf( self ) then

		local bonusesPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.bonusesLocator ) or Vec2( 0, 0 )
		self.bonusesWnd:SetLeft( bonusesPos.x - workX )

		local space_changedParams_bonuses = bonusesPos.y - ( changedParamsPos.y + self.changedParamsWnd:GetBaseHeight() )
		local bonusesTop = self.changedParamsWnd:GetTop() + self.changedParamsWnd:GetHeight() + space_changedParams_bonuses
		self.bonusesWnd:SetTop( bonusesTop )
		
	end

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
	
	local selfHeight = self:CalcBottom() - self:GetTop()
	self:SetHeight( selfHeight )

	-- высота маски

	local maskHeight = selfHeight - maskY
	self.maskWnd:SetHeight( maskHeight )

	-- высота скроллируемого окна

	local workHeight = 0
	if self.bonusesWnd:IsChildOf( self ) then
		workHeight = self.bonusesWnd:GetTop() + self.bonusesWnd:GetHeight()
	else
		workHeight = self.changedParamsWnd:GetTop() + self.changedParamsWnd:GetHeight()
	end
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
function UI.HangarShipParamsWnd:CalcBottom()

	local parent = self:GetParent()
	return parent and parent:GetHeight() or 0

end


--
function UI.HangarShipParamsWnd:UpdateWorkWndPosFromScrollBar()

	local scrollPos = self.scrollBar:IsChildOf( self ) and self.scrollBar:GetPos() or 0
	self.workWnd:SetTop( UI:YRel2Snapped( -scrollPos ) )

end


--
function UI.HangarShipParamsWnd:F_OnEventVScrollChange( hSender, eventSrc, newPos, oldPos )

	self:UpdateWorkWndPosFromScrollBar()

end


--
function UI.HangarShipParamsWnd:F_OnMouseWheel( ticks, mouseX, mouseY, wndThatReceivedInput )

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
function UI.HangarShipParamsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcLayout( false )

end


--
function UI.HangarShipParamsWnd:UpdateNoParams()

	local bHasParams = self.changedParamsWnd:HasParams() or self.bonusesWnd:IsChildOf( self ) and self.bonusesWnd:HasBonuses()
	
	if bHasParams then
	
		self:SetLayerVisible( false, self.layers.NO_PARAMS )
		self:SetLayerVisible( true, self.layers.CAPTION )
		self:SetLayerVisible( true, self.layers.MAIN_EFFECT )
		
	else
		
		-- SC-112532 если нет измененых параметров, то вообще скрывается
		if self.bHideIfNoParams then
		
			self:SetLayerVisible( false, self.layers.NO_PARAMS )
			self:SetLayerVisible( false, self.layers.CAPTION )
			self:SetLayerVisible( false, self.layers.MAIN_EFFECT )
			
		else
		
			self:SetLayerVisible( true, self.layers.NO_PARAMS )
			self:SetLayerVisible( false, self.layers.CAPTION )
			self:SetLayerVisible( false, self.layers.MAIN_EFFECT )

		end
	
	end

end


-- ------------------------------------------------------------
-- UI.HangarShipParams_MaskWnd
-- ------------------------------------------------------------

UI.HangarShipParams_MaskWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipParams_MaskWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HangarShipParams_MaskWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HangarShipParams_MaskWnd.hTexMask	= UI.INVALID_RESOURCE_HANDLE
UI.HangarShipParams_MaskWnd.parent		= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HangarShipParams_MaskWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.hTexMask = UI:GetTex( "listMask" )

end


--
function UI.HangarShipParams_MaskWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	local maskRect = self.parent:ToScreen( self:GetRect() )

	UI.drawer:PushMask( self.hTexMask, maskRect )
	_G.Font_PushMask( self.hTexMask, maskRect )

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

	_G.Font_PopMask()
	UI.drawer:PopMask()
	
end


-- функция GetParent() ведет к выделению памяти (при создании возвращаемого объекта userdata),
-- поэтому, т.к. она должна вызываться каждый кадр, parent запоминается
function UI.HangarShipParams_MaskWnd:F_OnAfterAddToParent()

	self:OnAfterAddToParent()

	self.parent = self:GetParent()

end


--
function UI.HangarShipParams_MaskWnd:F_OnAfterRemoveFromParent( parent )

	self:OnAfterRemoveFromParent( parent )
	self.parent	= nil

end


-- ------------------------------------------------------------
-- UI.HangarShipParams_WorkWnd
-- ------------------------------------------------------------

UI.HangarShipParams_WorkWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipParams_WorkWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HangarShipParams_WorkWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},
}


-- ------------------------------------------------------------
-- UI.HangarShipParams_ChangedParamsWnd
-- ------------------------------------------------------------

UI.HangarShipParams_ChangedParamsWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipParams_ChangedParamsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HangarShipParams_ChangedParamsWnd",
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
				defName 			= "shipsTree_alienEdit_changedParams_1080",
				defaultAnimation	= "idle",
				
				links =
				{
					{
						objName		= "prop_text",
						layer		= "UI.HangarShipParams_ChangedParamsWnd.layers.PARAMS",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
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
function UI.HangarShipParams_ChangedParamsWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.HangarShipParams_ChangedParamsWnd:Reset()

	self.shipDefName		= ""
	self.chosenNodesMask	= nil
	self.shipItem			= nil

	self:SetText( "", self.layers.PARAMS )

	self:RecalcLayout()

end


--
function UI.HangarShipParams_ChangedParamsWnd:GetBaseHeight()

	local height = 0

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		height = mainEffect:GetObjSize( "self" ).y
	end

	return height

end


--
function UI.HangarShipParams_ChangedParamsWnd:HasParams()

	return self:GetText( self.layers.PARAMS ) ~= ""

end


--
function UI.HangarShipParams_ChangedParamsWnd:OnOwnedVessels()

	self:FullUpdate()

end


--
function UI.HangarShipParams_ChangedParamsWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask
	self:FullUpdate()

end


--
function UI.HangarShipParams_ChangedParamsWnd:OnEventInvItemsChanged()
	
	self:FullUpdate()
	
end


--
function UI.HangarShipParams_ChangedParamsWnd:OnVesselLevelUp()
	
	self:FullUpdate()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HangarShipParams_ChangedParamsWnd.layers =
{
	MAIN_EFFECT	= 0,
	PARAMS		= 1,
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HangarShipParams_ChangedParamsWnd.shipDefName		= ""
UI.HangarShipParams_ChangedParamsWnd.chosenNodesMask	= nil
UI.HangarShipParams_ChangedParamsWnd.shipItem			= nil

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HangarShipParams_ChangedParamsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:PrepareLayout()

end


--
function UI.HangarShipParams_ChangedParamsWnd:FullUpdate()

	if UI:IsShipEvolving( self.shipDefName ) then
		self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )
	else
		self.shipItem = UI:GetShipItemByDef( self.shipDefName, true--[[-- в т.ч. если ранее был куплен, но потом продан]] )
	end

	self:UpdateParams()
	self:RecalcLayout()

end


--
function UI.HangarShipParams_ChangedParamsWnd:UpdateParams()

	local str = ""

	-- для некупленного корабля изменения не отображаются
	if self.shipItem and not self.shipItem.conserved then
	
	    local dataBase	= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.shipItem.vid, false--[[без модулей/аур/талантов]],	u64( 0 )--[[без нод]] ) ) }
    	local dataCur	= { params = _G.CL_GetShipParamsFromSpawnData( UI:GetShipSpawnData( self.shipItem.vid, true--[[с модулями/аурами/талантами]],	nil--[[с нодами]], true--[[с талантами SC-112894]], false--[[без автогенов SC-112894]] ) ) }
		
		-- chosenNodesMask пока никак не обрабатывается
		
		local baseColor = self:GetColor( self.layers.PARAMS )

		local params = UI:GetShipTooltipAllParams( self.shipDefName )
		for paramIdx, paramInfo in ipairs( params ) do

			if not paramInfo.separator then

				local valsBase		= UI:GetParamVals( self.shipDefName, paramInfo, UI.paramSrcTypes.SHIP, dataBase, false )
				local valsCur		= UI:GetParamVals( self.shipItem.defName, paramInfo, UI.paramSrcTypes.SHIP, dataCur, false )

				local strVal = UI:ParamVals2Str( paramInfo, valsCur, valsBase, true, nil, baseColor, true--[[bWithDeltaOnly]], true--[[bShowOnlyDelta]] )	-- показываются только измененные параметры, а число - только дельта изменения
				if strVal ~= "" then

					local strName = UI:ShipParam2Str( paramInfo )
					local strParam = string.format( "%s: %s", strName, strVal )

					str = string.format( "%s%s%s", str, str ~= "" and "|" or "", strParam )

				end

			end

		end
		
	end

	self:SetText( str, self.layers.PARAMS )	

end


--
function UI.HangarShipParams_ChangedParamsWnd:PrepareLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local selfSize = mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	self:SetWidth( selfSize.x )

end


--
function UI.HangarShipParams_ChangedParamsWnd:RecalcLayout()

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
-- UI.HangarShipParams_BonusesWnd
-- ------------------------------------------------------------

UI.HangarShipParams_BonusesWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipParams_BonusesWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HangarShipParams_BonusesWnd",
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
				defName 			= "shipsTree_alienEdit_bonuses_1080",
				defaultAnimation	= "idle",
			}}
		},
	}
}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.HangarShipParams_BonusesWnd:Setup( shipDefName, chosenNodesMask )

	self:Reset()

	self.shipDefName		= shipDefName
	self.chosenNodesMask	= chosenNodesMask

	self:FullUpdate()

end


--
function UI.HangarShipParams_BonusesWnd:Reset()

	self.shipDefName		= ""
	self.chosenNodesMask	= nil
	self.shipItem			= nil

	self:ResetSlots()

end


--
function UI.HangarShipParams_BonusesWnd:HasBonuses()

	return next( self.curSlots ) ~= nil

end


--
function UI.HangarShipParams_BonusesWnd:OnOwnedVessels()

	self:FullUpdate()

end


--
function UI.HangarShipParams_BonusesWnd:OnChosenActiveNodesChanged( chosenNodesMask )

	self.chosenNodesMask = chosenNodesMask

	self:FullUpdate()

end


--
function UI.HangarShipParams_BonusesWnd:OnEventInvItemsChanged()
	
	self:FullUpdate()
	
end


--
function UI.HangarShipParams_BonusesWnd:OnVesselLevelUp()
	
	self:FullUpdate()
	
end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HangarShipParams_BonusesWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.HangarShipParams_BonusesWnd.effectInfo =
{
	main =
	{
		slotLocatorPrefix	= "bonus_slot_"
	}
}

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HangarShipParams_BonusesWnd.shipDefName		= ""
UI.HangarShipParams_BonusesWnd.chosenNodesMask	= nil
UI.HangarShipParams_BonusesWnd.shipItem			= nil
UI.HangarShipParams_BonusesWnd.allSlots			= {}
UI.HangarShipParams_BonusesWnd.curSlots			= {}
UI.HangarShipParams_BonusesWnd.space_slots		= 0
UI.HangarShipParams_BonusesWnd.space_top_slots	= 0
UI.HangarShipParams_BonusesWnd.space_slots_btm	= 0
UI.HangarShipParams_BonusesWnd.slotsX			= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HangarShipParams_BonusesWnd:F_PostLoad()

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
function UI.HangarShipParams_BonusesWnd:CreateControls()

	for slotIdx = 1, 3 do
		self:CreateSlot()
	end

end


--
function UI.HangarShipParams_BonusesWnd:FullUpdate()

	if UI:IsShipEvolving( self.shipDefName ) then
		self.shipItem = UI:GetEvolvingShipItem( self.shipDefName )
	else
		self.shipItem = UI:GetShipItemByDef( self.shipDefName, true--[[-- в т.ч. если ранее был куплен, но потом продан]] )
	end

	self:UpdateSlots()

	self:RecalcLayout()

end


--
function UI.HangarShipParams_BonusesWnd:ResetSlots()

	for slotIdx, slotWnd in pairs( self.curSlots ) do
		slotWnd:Reset()
		slotWnd:UnlinkFromParent()
	end

	self.curSlots = {}

end


--
function UI.HangarShipParams_BonusesWnd:UpdateSlots()

	self:ResetSlots()
	
	-- "бонусы" - это параметры, короые прописаны в ShipTooltipParamsDescription и которые есть в этом дефе (напрямую или в special_grades)
	local shipSynergyLevel = self.shipItem and UI:GetShipLevel( self.shipItem ) or UI:GetShipDefaultLevel( self.shipDefName )
	local spawnData = self.shipItem and UI:GetShipSpawnData( self.shipItem.vid, true, nil ) or UI:GetShipDefaultSpawnData( self.shipDefName )

	local shipParamsData =
	{
		defName			= self.shipDefName,
		data			= { params = _G.CL_GetShipParamsFromSpawnData( spawnData ) },
		synergyLevel	= shipSynergyLevel,
		dataType		= UI.paramSrcTypes.SHIP
	}

	local bonusesData = UI:GetShipDescParamsEx( shipParamsData )

	for bonusIdx, bonusData in ipairs( bonusesData ) do

		local bonusSynergyLevel = bonusData.synergyLevel or -1
		if bonusSynergyLevel == -1 or bonusSynergyLevel <= shipSynergyLevel then

			local slotWnd = self:ObtainFreeSlot()
			if slotWnd then
				slotWnd:Setup( bonusData, shipParamsData )
			end
	
		end
		
	end

end


--
function UI.HangarShipParams_BonusesWnd:CreateSlot()

	local slotWnd = UI:CreateChildWnd( self, UI.HangarShipParams_BonusSlotWnd, tostring( #self.allSlots + 1 ) )

	if slotWnd then
		table.insert( self.allSlots, slotWnd )
	end

	return slotWnd

end


--
function UI.HangarShipParams_BonusesWnd:ObtainFreeSlot()

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
function UI.HangarShipParams_BonusesWnd:PrepareLayout()

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
function UI.HangarShipParams_BonusesWnd:RecalcLayout()

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
-- UI.HangarShipParams_BonusSlotWnd
-- ------------------------------------------------------------

UI.HangarShipParams_BonusSlotWnd = {}

-- ---------------------------------
-- window definition
-- ---------------------------------

UI.HangarShipParams_BonusSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HangarShipParams_BonusSlotWnd",
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
				defName 			= "shipsTree_alienEdit_bonusSlot_1080",
				defaultAnimation	= "idle",

				links =
				{
					-- не линкуется по размеру
					{
						objName		= "title",
						layer		= "UI.HangarShipParams_BonusSlotWnd.layers.TEXT",
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
function UI.HangarShipParams_BonusSlotWnd:Setup( bonusData, shipParamsData )

	self:Reset()

	self.bonusData		= bonusData
	self.shipParamsData	= shipParamsData

	self:FullUpdate()

end


--
function UI.HangarShipParams_BonusSlotWnd:Reset()

	self.bonusData		= nil
	self.shipParamsData	= nil

	self:SetText( "", self.layers.TEXT )

	self:RacalLayout()

end


--
function UI.HangarShipParams_BonusSlotWnd:GetBaseHeight()

	return self.maxHeight

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HangarShipParams_BonusSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
    TEXT		= 1,
}

UI.HangarShipParams_BonusSlotWnd.effectInfo =
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

UI.HangarShipParams_BonusSlotWnd.bonusData		= nil
UI.HangarShipParams_BonusSlotWnd.shipParamsData	= nil
UI.HangarShipParams_BonusSlotWnd.minHeight		= 0
UI.HangarShipParams_BonusSlotWnd.maxHeight		= 0
UI.HangarShipParams_BonusSlotWnd.space_text_btm	= 0

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HangarShipParams_BonusSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:PrepareLayout()

end


--
function UI.HangarShipParams_BonusSlotWnd:FullUpdate()

	self:UpdateText()
	self:RacalLayout()

end


--
function UI.HangarShipParams_BonusSlotWnd:UpdateText()

	local str = UI:ShipDescParam2Str( self.bonusData, self:GetColor( self.layers.TEXT ), nil, self.shipParamsData.defName, -1, false )	
	self:SetText( str, self.layers.TEXT )

end


--
function UI.HangarShipParams_BonusSlotWnd:PrepareLayout()

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
function UI.HangarShipParams_BonusSlotWnd:RacalLayout()

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