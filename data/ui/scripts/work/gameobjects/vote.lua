-- ----------------------------------------------------------------------------
--
-- Workfile: Vote.lua
-- Copyright é 2013, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: vote.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

if UI.Vote then
	return
end
UI.Vote = {}

UI.Vote.inited			= false
UI.Vote.current 		= nil
UI.Vote.results			= nil

--
function UI.Vote:Init()

	if not self.inited then
		self.inited = true
	end

end

--
function UI.Vote:Clear()

	self.inited = false
	self.current = nil
	self.results = nil

end

--
function UI.Vote:Request()

	if self.current ~= nil then
		self:AddVote( self.current )
	else
		_G.MasterServer_SurveyRequest()
	end

end

--
function UI.Vote:AddVote( vote )

	self.current = vote
	UI.Vote_Wnd:SetData( self.current )
	UI.HangarWnd:SetNewVote( true )

end

--
function UI.Vote:HasVote()
	return self.current ~= nil
end

--
function UI.Vote:AddResults( results )

	if results ~= nil then
		self.results = results
		UI.Vote_Wnd:SetData( self.results, true )
		UI.HangarWnd:SetNewVote( false )
		UI.HangarWnd:HasResults( true )
	else
		self.results = nil
		UI.HangarWnd:SetNewVote( false )
		UI.HangarWnd:HasResults( false )
	end

end

--
function UI.Vote:RecieveVote( answers )
	
	if self:HasVote() then
		_G.MasterServer_SurveyVote( self.current.sid, answers )
	end
	self.current = nil
	UI.HangarWnd:SetNewVote( false )
	--UI.HangarWnd:HasResults( false )

end

--
function UI.Vote:OnRecieveVoteCompleate()

	self:Request()

end