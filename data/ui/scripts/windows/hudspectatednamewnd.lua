-- ----------------------------------------------------------------------------
--
-- Workfile: hudspectatednamewnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.HudSpectatedNameWnd = {}
local sn = UI.HudSpectatedNameWnd

-- ---------------------------
-- window definition
-- ---------------------------

UI.HudSpectatedNameWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudSpectatedNameWnd",
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
				defName 			= "hud_spectatedName",
				defaultAnimation	= "neutral",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "player_name",
						layer		= "UI.HudSpectatedNameWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}		
			}}
		},   

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags	 	= FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.HudSpectatedNameWnd:MasterServer_OnClanNameUpdate( result, requestId, cid, clanName )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	if self.playerId ~= -1 then
		if UI:GetPlayerClanById( self.playerId ) == cid then

			self.playerId = -1
			self:Update()

		end
	end

end


--
function UI.HudSpectatedNameWnd:MasterServer_OnUserProfileUpdate( result, requestId, uid, field )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end
	
	if field ~= _G.MasterServer.UserProfileField.UPF_CLAN_ID then
		return
	end

	if self.playerId ~= -1 then
	
		local playerInfo = _G.GetPlayerInfo( self.playerId )
		local playerUid = playerInfo.isBot and playerInfo.botUid or playerInfo.uid

		if playerUid == uid then

			self.playerId = -1
			self:Update()

		end
		
	end

end


--
function UI.HudSpectatedNameWnd:OnPlayerSqidChanged( playerIdx, sqid )

	if not self:IsOnScreen() then
		return
	end

	if self.playerId == playerIdx then

		self.playerId = -1
		self:Update()

	end

end


-- ---------------------------
-- const
-- ---------------------------

sn.layers =
{
	MAIN_EFFECT	= 0,
	NAME		= 1,
}

sn.effectInfo =
{
	main = 
	{
		animFriend	= "friend",
		animEnemy	= "enemy",
		animSquad	= "squad",
		animAlien	= "nlo",
	}
}

-- ---------------------------
-- vars
-- ---------------------------

sn.playerId 	= -1
sn.bBomber		= false
sn.bLeader		= false
sn.nameMetaText	= UI.MetaText.GetNewInstance()

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.HudSpectatedNameWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.nameMetaText:InitFromLayer( self, self.layers.NAME ) 

end


--
function UI.HudSpectatedNameWnd:F_Shutdown()

	self.nameMetaText:Clear()

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HudSpectatedNameWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()
	self:Reset()

end     


--
function UI.HudSpectatedNameWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.HudSpectatedNameWnd:UpdateMetaTextPos()

	self.nameMetaText:UpdateScreenOrgFromLayer( self, self.layers.NAME )

end


--
function UI.HudSpectatedNameWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.NAME then
		self.nameMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.HudSpectatedNameWnd:Reset()

	self.nameMetaText:SetText( "" )

	self.playerId 	= -1
	self.bBomber	= false
	self.bLeader	= false

end


--
function UI.HudSpectatedNameWnd:Update()

	local bLeader 	= false
	local bBomber 	= false
	local bFriend 	= false
	local bMySquad	= false
	local bSecondEnemy = false
	
	local playerId = _G.GetSpectatorTargetIdx()

	if playerId ~= -1 then

		local gameplay = _G.GetCurrentGameMode()

    	local localPlayerId = UI.HudWnd.localPlayerId

		local team = _G.CL_GetPlayerTeam( playerId )
    	local friendTeam = _G.CL_GetPlayerTeam( localPlayerId )
		if friendTeam == 0 then
			if gameplay == ai.Gameplay.THREE_TEAMS_DM then
				friendTeam = ai.ThreeTeamsDMTeam1
			else
				friendTeam = 1
			end
		end

		if gameplay == ai.Gameplay.THREE_TEAMS_DM then
			bSecondEnemy = UI:IsThreeTeamsDMSecondEnemy( friendTeam, team )
		end

    	local enemyTeam = friendTeam == 1 and 2 or 1

		bFriend = team == friendTeam

		if bFriend then

			local playerSquid = _G.CL_GetPlayerSquad( playerId )
			if playerSquid ~= UI.INVALID_U64_ID then

				local mySquid = _G.CL_GetPlayerSquad( localPlayerId )
				bMySquad = playerSquid == mySquid

			end

		end

    	if gameplay == ai.Gameplay.SENTINEL then

    		local leaderId_friend, bLeaderDead_friend = _G.CL_SentinelGetTeamLeader( friendTeam )
    		local leaderId_enemy, bLeaderDead_enemy = _G.CL_SentinelGetTeamLeader( enemyTeam )
    		bLeader = playerId == leaderId_friend or playerId == leaderId_enemy

    	elseif gameplay == ai.Gameplay.BOMB_THE_BASE or gameplay == ai.Gameplay.CLOSE_DISTANCE then

    		local bombersMask = _G.CL_BombTheBaseGetCarrier() 
    		bBomber = UI:BitTst( bombersMask, playerId )

    	elseif gameplay == ai.Gameplay.CLANSHIP then

    		local bombersMask = _G.CL_ClanShipGetBombCarriers() 
    		bBomber = UI:BitTst( bombersMask, playerId )

    	end

	end

	local bChanged = playerId ~= self.playerId or bLeader ~= self.bLeader or bBomber ~= self.bBomber
	if not bChanged then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local anim = ""
		if bMySquad then
			anim = self.effectInfo.main.animSquad
		elseif bFriend then
			anim = self.effectInfo.main.animFriend
		else
			if bSecondEnemy then
				anim = self.effectInfo.main.animAlien
			else
				anim = self.effectInfo.main.animEnemy
			end
		end

		if anim ~= mainEffect:GetCurAnimation() then
			mainEffect:StartAnimation( anim )
    		self.nameMetaText:SetColor( self:GetColor( self.layers.NAME ) )
		end

	end

	local strName = UI:MakePlayerNameById( playerId, true, false )
	local strSpecStatus = ""

	if bLeader then

		local colorScheme = -1

		if bMySquad then
			colorScheme = UI.gameObjColorSchemes.SQUAD
		elseif bFriend then
			colorScheme = UI.gameObjColorSchemes.FRIEND
		else
			colorScheme = UI.gameObjColorSchemes.ENEMY
		end

		strSpecStatus = UI:GetSentinelLeaderIcoMetaString( colorScheme, false )

	elseif bBomber then

		local colorScheme = -1

		if bMySquad then
			colorScheme = UI.gameObjColorSchemes.SQUAD
		elseif bFriend then
			colorScheme = UI.gameObjColorSchemes.FRIEND
		else
			colorScheme = UI.gameObjColorSchemes.ENEMY
		end

		strSpecStatus = UI:GetBomberIcoMetaString( colorScheme, false )
	end       			        			

	local str = string.format( "%s%s", strSpecStatus, strName )

	self.nameMetaText:SetText( str, true )

	self.playerId	= playerId
	self.bLeader	= bLeader
	self.bBomber	= bBomber

end


--
function UI.HudSpectatedNameWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:Update()

end