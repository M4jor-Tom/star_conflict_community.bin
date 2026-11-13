-- ----------------------------------------------------------------------------
--
-- Workfile: hudtargetviewwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudTargetViewWnd = {}
local tv = UI.HudTargetViewWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudTargetViewWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudTargetViewWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_targetView",
				defaultAnimation	= "enemy",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value_1",
						layer		= "UI.HudTargetViewWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}		
			}}
		},   

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ------------------------------
-- interface functiuons
-- ------------------------------

--
function UI.HudTargetViewWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() or self:HasStyle( UI.WS_NOT_DRAW ) then
		return
	end

	if result ~= 0 then
		return
	end

	local target = nil

	local myShip = UI.HudWnd.myShip
	if myShip then
		target = myShip:GetTargetLock()
	end

	if target and UI:IsEntityOfClass( target, "SpaceShip" ) then

		local playerId = target:GetPlayerIdx()
	
		if playerId ~= -1 then
			if UI:GetPlayerClanById( playerId ) == cid then
				self:UpdateName( target )
			end
		end

	end

end


--
function UI.HudTargetViewWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() or self:HasStyle( UI.WS_NOT_DRAW ) then
		return
	end

	if result ~= 0 then
		return
	end
	
	if field ~= _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		return
	end

	local target = nil

	local myShip = UI.HudWnd.myShip
	if myShip then
		target = myShip:GetTargetLock()
	end

	if target and UI:IsEntityOfClass( target, "SpaceShip" ) then

		local playerId = target:GetPlayerIdx()
	
		if playerId ~= -1 then
		
			local playerInfo = _G.GetPlayerInfo( playerId )
			local playerUid = playerInfo.isBot and playerInfo.botUid or playerInfo.uid
			
			if playerUid == uid then
				self:UpdateName( target )
			end
			
		end

	end

end


--
function UI.HudTargetViewWnd:MasterServer_OnAccountRankUp( result, requestId, accountRank )

	if not self:IsOnScreen() or self:HasStyle( UI.WS_NOT_DRAW ) then
		return
	end

	if result ~= 0 then
		return
	end
	
	local target = nil

	local myShip = UI.HudWnd.myShip
	if myShip then
		target = myShip:GetTargetLock()
	end

	if target and UI:IsEntityOfClass( target, "SpaceShip" ) then
		self:UpdateName( target )
	end

end


-- ------------------------------
-- const
-- ------------------------------

tv.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
}

-- ------------------------------
-- vars
-- ------------------------------

tv.targetId				= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudTargetViewWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()

end


--
function UI.HudTargetViewWnd:FullUpdate()

	local target = nil
	local targetId = -1

	local myShip = UI.HudWnd.myShip
	if myShip then
		target = myShip:GetTargetLock()
	end

	if not target then
		if self.targetId ~= -1 then
			self:Reset()
		end
		return
	end

	targetId = target:GetId()

	if targetId ~= self.targetId then

    	self:UpdateName( target )

    	if self.targetId == -1 then
    		self:RemoveStyle( UI.WS_NOT_DRAW )
    	end

	end

	self.targetId = targetId

end


--
function UI.HudTargetViewWnd:Reset()

	self.targetId = -1
	self:AddStyle( UI.WS_NOT_DRAW )

	self:SetText( "", self.layers.NAME )

end


--
function UI.HudTargetViewWnd:UpdateName( target )

	local text = ""

	if UI:IsEntityOfClass( target, "SpaceShip" ) then

		local playerName = ""

    	local playerId = target:GetPlayerIdx()
		
		if playerId ~= -1 then
	    	playerName = UI:MakePlayerNameById( playerId, true, false )
		else
			playerName = UI:GetBotName( target:GetId() )
		end
		
		text = playerName
		
		local bCanShowShipName = true
		if _G.MasterServer_IsConnected() then
			if UI.rankLocks.inGameShipsInfo ~= -1 and UI:GetPlayerAccountRank() < UI.rankLocks.inGameShipsInfo then
				bCanShowShipName = false
			end
		end
		
		if bCanShowShipName then

			local shipName = UI:GetEntityLocalizedName( target, false )
			local shipType = target:GetShipClass()
			local shipTypeName = UI:Val2Key( ai.ShipClass, shipType )
			local shipTypeLocalized = UI:GetStringByName( string.format( "shipType_%s", shipTypeName ) )

			text = string.format( "%s|%s: %s", text, shipTypeLocalized, shipName )
			
		end

		if _G.GetCurrentGameMode() == ai.Gameplay.FREE_SPACE and playerId ~= -1 then

			local karmaLevel = target:GetKarmaLevel()

			local strKarma = string.format( "%s: %d", UI:GetStringByName( "hud_karmaLevel" ), karmaLevel )
			text = string.format( "%s|%s", text, strKarma )
			
		end

	else
		text = UI:GetEntityLocalizedName( target, false )
	end	

	self:SetText( text, self.layers.NAME )	

end


--
function UI.HudTargetViewWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Reset()

end