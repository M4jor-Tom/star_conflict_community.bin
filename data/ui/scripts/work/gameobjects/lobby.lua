-- ----------------------------------------------------------------------------
--
-- Workfile: lobby.lua
-- Copyright é 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: lobby.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.Lobby then
	return
end
UI.Lobby = {}
UI.Lobby.isInited = false
UI.Lobby.my_Lobby = {}
UI.Lobby.data = {}
UI.Lobby.list = {}
--
function UI.Lobby:Clear()
	self.isInited = false
	self.my_Lobby = {}
	self.data = {}
	UI.GameplayCustomWnd:StopRequestWaiting()
	UI.GameplayCustomCreateWnd:StopWait()
	UI.GameplayCustomLobbyWnd:StopWait()
	self.list = {}
end

--
function UI.Lobby:IsInited()
	return self.isInited
end

--
function UI.Lobby:ReloadList()
	return MasterServer_RequestLobbies()
end

--
function UI.Lobby:MasterServer_OnLobbyList( result, requestId )
	if result == 0 then
		self.list = _G.MasterServer_GetLobbies() or {}
		self.isInited = true
	end
end

--
function UI.Lobby:GetList()
	return self.list
end

--
function UI.Lobby:UpdateLobby()
	local inLobby = self:IsInLobby()
	self.data = _G.MasterServer_GetLobby() or {}
	if self:IsInLobby() ~= inLobby then
		if self:IsInLobby() then
			UI.HangarWnd:TrySetMenuTab( UI.HangarWnd.menuTabs.CUSTOM_GAME, true, false )
		end
		UI.GameplayWnd:SetLobby( self:IsInLobby() )
		UI.HangarWnd:SetInLobby( self:IsInLobby() )
		if self:IsInLobby() then
			UI.Chat:JoinLobbyChannel()
		else
			UI.Chat:LeaveLobbyChannel()
		end
		UI.HangarWnd:UpdateStartBtnState()
	end
	if self:IsInLobby() then
		UI.GameplayCustomLobbyWnd:Update()
	end
end

--
function UI.Lobby:GetMyLobby()
	return self.data
end

--
function UI.Lobby:CanChangeTeam()
	return self.data and self.data.balancePlayers == false or false
end

--
function UI.Lobby:IsInLobby()
	return self.data and self.data.lid and self.data.lid ~= UI.INVALID_U64_ID or false
end

--
function UI.Lobby:IsLobbyLeader()
	return self:IsInLobby() and self.data.players and self.data.players[ 1 ] and self.data.players[ 1 ].uid == _G.MasterServer_GetLocalUserId() or false
end

--
function UI.Lobby:IsPlayerInLobby( uid )
	if self:IsInLobby() and self.data.players then 
		for i = 1, #self.data.players do
			if self.data.players[ i ].uid == uid then
				return true
			end
		end
	end
	return false
end