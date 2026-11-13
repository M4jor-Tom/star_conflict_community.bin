-- ----------------------------------------------------------------------------
--
-- Workfile: hudfriendlyplayerswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudFriendlyPlayersWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HudFriendlyPlayersWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name	= "HudFriendlyPlayersWnd",
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
				defName 			= "hud_friendlyPlayers_main",
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

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HudFriendlyPlayersWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		if UI:GetPlayerClanById( data.playerInfo.playerId ) == cid then

			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:UpdateName()
			end

		end

	end

end


--
function UI.HudFriendlyPlayersWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	if field ~= _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		return
	end
	
	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		local playerUid = data.playerInfo.isBot and data.playerInfo.botUid or data.playerInfo.uid
		
		if playerUid == uid then

			local slotWnd = self:GetButtonForRecord( recordIdx )
			if slotWnd then
				slotWnd:UpdateName()
			end

		end

	end

end


--
function UI.HudFriendlyPlayersWnd:OnPlayerSqidChanged( playerIdx, sqid )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


-- -----------------------------
-- const
-- -----------------------------

UI.HudFriendlyPlayersWnd.btnPrototypeName = "HudFriendlyPlayers_SlotWnd"

UI.HudFriendlyPlayersWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_",
		scrollObjName		= "",
		animIdle			= "idle",
	}
}

UI.HudFriendlyPlayersWnd.MAX_SLOTS = 16
UI.HudFriendlyPlayersWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HudFriendlyPlayersWnd:F_PostLoad()

	UI.ButtonsListWnd.F_PostLoad( self )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_ON_REMOVE_PLAYER )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_PLAYER_STATUS_CHANGED )

end


--
function UI.HudFriendlyPlayersWnd:FullUpdate()

	self:Clear()

	local datas = {}

	local playersInfo = _G.GetAllPlayersInfo() or {}
	for idx, playerInfo in ipairs( playersInfo ) do

		if self:NeedPlayerSlot( playerInfo ) then

			local allShips = _G.CL_GetAvailableShips( playerInfo.playerId ) or {}

			local data = {}
			data.playerInfo			= playerInfo
			data.shipsSummaryLevel  = self:GetPlayerShipsSummaryLevel( allShips )	-- нужно для сортировки
			
			table.insert( datas, data )

		end

	end

	local fnSort = function( data1, data2 )
		return data1.shipsSummaryLevel > data2.shipsSummaryLevel
	end

	table.sort( datas, fnSort )

	for idx = 1, #datas do
		self:AddRecord( datas[ idx ] )
	end	

end


--
function UI.HudFriendlyPlayersWnd:NeedPlayerSlot( playerInfo )

	if not playerInfo then
		return false
	end

	local localPlayerId = UI.HudWnd.localPlayerId

	if playerInfo.status ~= network.PlayerStatus.PS_ACTIVE then
		return false
	end

	local gameMode = _G.GetCurrentGameMode()
	if gameMode ~= ai.Gameplay.PVE_MISSION then

		local mySquid		= _G.CL_GetPlayerSquad( localPlayerId )	
		local playerSquid	= _G.CL_GetPlayerSquad( playerInfo.playerId )

		if mySquid == UI.INVALID_U64_ID or mySquid ~= playerSquid then
			return false
		end		
	
	end

	return true

end


--
function UI.HudFriendlyPlayersWnd:GetPlayerShipsSummaryLevel( ships )

	local summaryLevel = 0

	for idx, shipInfo in ipairs( ships ) do
		if not UI:IsStrEmpty( shipInfo.baseDef ) then

			local def = UI:GetDef( shipInfo.baseDef )
			if def and def.ship_tier then
				summaryLevel = math.max( summaryLevel, def.ship_tier )
			end

		end
	end

	return summaryLevel

end


--
function UI.HudFriendlyPlayersWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:FullUpdate()

end


--
function UI.HudFriendlyPlayersWnd:F_OnEventRemovePlayer( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.HudFriendlyPlayersWnd:F_OnEventPlayerStatusChanged( hSender, iParam0, iParam1, fParam0, fParam1 )

	if not self:IsOnScreen() then
		return
	end

	self:OnPlayerStatusChanged( iParam0 )

end


--
function UI.HudFriendlyPlayersWnd:OnPlayerStatusChanged( playerIdx )

	local playerInfo = _G.GetPlayerInfo( playerIdx )
	local recordIdx	= self:GetRecordForPlayer( playerIdx )

	local needSlot	= self:NeedPlayerSlot( playerInfo )
	local isSlot	= recordIdx ~= -1

	if ( needSlot and not isSlot ) or ( not needSlot and isSlot ) then
		self:FullUpdate()
	end

end 


--
function UI.HudFriendlyPlayersWnd:GetRecordForPlayer( playerIdx )

	for recordIdx = 1, self:GetNumRecords() do

		local data = self:GetRecordData( recordIdx )
		if data.playerInfo.playerId == playerIdx then
			return recordIdx
		end

	end

	return -1

end


-- -----------------------------------------------------------------------
-- UI.HudFriendlyPlayers_SlotWnd
-- -----------------------------------------------------------------------

UI.HudFriendlyPlayers_SlotWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.HudFriendlyPlayers_SlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "HudFriendlyPlayers_SlotWnd",
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
				defName 			= "hud_friendlyPlayers_slot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "name",
						layer		= "UI.HudFriendlyPlayers_SlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "arm",
						layer		= "UI.HudFriendlyPlayers_SlotWnd.layers.SHIELD_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "shild",
						layer		= "UI.HudFriendlyPlayers_SlotWnd.layers.HP_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "role",
						layer		= "UI.HudFriendlyPlayers_SlotWnd.layers.ROLE_ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}		
			}}
		},  

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- SHIELD_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_objectsMark_insideShip_shield",
				defaultAnimation	= "idle",
			}}
		},

		-- HP_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_objectsMark_insideShip_hp",
				defaultAnimation	= "idle",
			}}
		},

		-- ROLE_ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_map_shipType",
			}}
		}
	}
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.HudFriendlyPlayers_SlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )

	self:SetLayerVisible( false, self.layers.HP_PB_EFFECT )
	if self.hpPbEffect then
		self.hpPbEffect:SetAnimationTime( 0 )
	end

	self:SetLayerVisible( false, self.layers.SHIELD_PB_EFFECT )
	if self.shieldPbEffect then
		self.shieldPbEffect:SetAnimationTime( 0 )
	end

	self:SetLayerVisible( false, self.layers.ROLE_ICO_EFFECT )

	self.shipId = -1

end


-- -----------------------------
-- const
-- -----------------------------

UI.HudFriendlyPlayers_SlotWnd.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
    SHIELD_PB_EFFECT	= 2,
    HP_PB_EFFECT		= 3,
	ROLE_ICO_EFFECT		= 4,
}

UI.HudFriendlyPlayers_SlotWnd.effectInfo =
{
	roleIco =
	{
		icoSpriteName	= "ico",
		animFriend		= "friend",
		animSquad		= "squad",
	}
}

-- -----------------------------
-- vars
-- -----------------------------

UI.HudFriendlyPlayers_SlotWnd.shipId			= -1
UI.HudFriendlyPlayers_SlotWnd.mainEffect 		= nil
UI.HudFriendlyPlayers_SlotWnd.shieldPbEffect	= nil
UI.HudFriendlyPlayers_SlotWnd.hpPbEffect 		= nil
UI.HudFriendlyPlayers_SlotWnd.roleIcoEffect		= nil

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.HudFriendlyPlayers_SlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect 	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.shieldPbEffect = UI:GetEffectFromLayer( self, self.layers.SHIELD_PB_EFFECT )
	self.hpPbEffect 	= UI:GetEffectFromLayer( self, self.layers.HP_PB_EFFECT )
	self.roleIcoEffect	= UI:GetEffectFromLayer( self, self.layers.ROLE_ICO_EFFECT )

end


--
function UI.HudFriendlyPlayers_SlotWnd:UpdateForData( data, bAnimated )

	self:Reset()

	self:UpdateName()

	local shipEnt = _G.CL_GetPlayerShip( data.playerInfo.playerId )
	local shipId = shipEnt and shipEnt:GetId() or -1

	self:UpdateHp( shipEnt )
	self:UpdateShield( shipEnt )
	self:UpdateRole( shipEnt )

	self.shipId = shipId

end


--
function UI.HudFriendlyPlayers_SlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local data = self:GetRecordData()
	local shipEnt = _G.CL_GetPlayerShip( data.playerInfo.playerId )
	local shipId = shipEnt and shipEnt:GetId() or -1

	self:UpdateHp( shipEnt )
	self:UpdateShield( shipEnt )

	if shipId ~= self.shipId then
		self:UpdateRole( shipEnt )
		self.shipId = shipId
	end
	
end


--
function UI.HudFriendlyPlayers_SlotWnd:UpdateName()

	local data = self:GetRecordData()

	local str = UI:MakePlayerNameById( data.playerInfo.playerId, true, false )
	self:SetText( str, self.layers.NAME )

end


--
function UI.HudFriendlyPlayers_SlotWnd:UpdateHp( shipEnt )

	if shipEnt then

		self:SetLayerVisible( true, self.layers.HP_PB_EFFECT )

		local hp	= shipEnt:GetHealth()
    	local maxHP	= shipEnt:GetMaxHealth()

    	local animTime = maxHP ~= 0 and hp / maxHP or 0

    	if self.hpPbEffect then
    		self.hpPbEffect:SetAnimationTime( animTime )
    		self.hpPbEffect:Update( 0 )
    	end

	else
		self:SetLayerVisible( false, self.layers.HP_PB_EFFECT )
	end

end


--
function UI.HudFriendlyPlayers_SlotWnd:UpdateShield( shipEnt )

	if shipEnt then

		self:SetLayerVisible( true, self.layers.SHIELD_PB_EFFECT )

    	local shield	= shipEnt:GetShieldVal()
    	local maxShield	= shipEnt:GetShieldMax()

    	local animTime = maxShield ~= 0 and shield / maxShield or 0

		if self.shieldPbEffect then
	    	self.shieldPbEffect:SetAnimationTime( animTime )
    		self.shieldPbEffect:Update( 0 )
		end

	else
		self:SetLayerVisible( false, self.layers.SHIELD_PB_EFFECT )
	end

end


--
function UI.HudFriendlyPlayers_SlotWnd:UpdateRole( shipEnt )

	local role = -1

	if shipEnt then
		local shipDefName = shipEnt:GetDefName()
		role = UI:GetItemRole( shipDefName )
	end

	if role ~= -1 then

		self:SetLayerVisible( true, self.layers.ROLE_ICO_EFFECT )

		local bMySquad = false

		local localPlayerId = UI.HudWnd.localPlayerId
		local mySquid		= _G.CL_GetPlayerSquad( localPlayerId )	

		if mySquid ~= UI.INVALID_U64_ID then

			local data = self:GetRecordData()
			local playerSquid = _G.CL_GetPlayerSquad( data.playerInfo.playerId )

			if playerSquid == mySquid then
				bMySquad = true
			end

		end		

		local anim = bMySquad and self.effectInfo.roleIco.animSquad or self.effectInfo.roleIco.animFriend
		self.roleIcoEffect:StartAnimation( anim )

		local hTex = UI:GetRoleIco( role )
		self.roleIcoEffect:SetSpriteTexture( self.effectInfo.roleIco.icoSpriteName, hTex )

	else
		self:SetLayerVisible( false, self.layers.ROLE_ICO_EFFECT )		
	end

end


--
function UI.HudFriendlyPlayers_SlotWnd:F_OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseRButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	self:TryShowContextMenu( mouseX, mouseY )

	return true

end


--
function UI.HudFriendlyPlayers_SlotWnd:TryShowContextMenu( mouseX, mouseY )

	local data = self:GetRecordData()

	local uid = data.playerInfo.isBot and data.playerInfo.botUid or data.playerInfo.uid
	if uid == UI.INVALID_U64_ID then
		return
	end

	UI.ContextMenu:Clear()
	UI.ContextMenu:SetName( data.playerInfo.nickName )
	UI:FillContextMenuForPlayer( UI.ContextMenuType.PLAYER_COMMON + UI.ContextMenuType.PLAYER_SQUAD, uid, nil, data.playerInfo.isBot )

	UI.ContextMenu:Show( mouseX, mouseY )

end