-- ----------------------------------------------------------------------------
--
-- Workfile: playerprogresswnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.PlayerProgressWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgressWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenSelectionWnd",
	
	props =
	{
		name		= "PlayerProgressWnd",
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
				defName 			= "playerProgress_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "blackout",
						layer		= "UI.PlayerProgressWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "win",
						layer		= "UI.PlayerProgressWnd.layers.WORK_EFFECT",
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
				defName 			= "playerProgress_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",	
						layer		= "UI.PlayerProgressWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1_1",	
						layer		= "UI.PlayerProgressWnd.layers.CONGRATULATION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1_2",	
						layer		= "UI.PlayerProgressWnd.layers.RANK",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1_3",	
						layer		= "UI.PlayerProgressWnd.layers.UNLOCKS_CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.PlayerProgress_UnlocksListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "buy_btn_2",	
						wnd			= "UI.PlayerProgress_CloseBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "btn_x",	
						wnd			= "UI.PlayerProgress_CrossBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "fb_btn",	
						wnd			= "UI.PlayerProgress_FbBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "vk_btn",	
						wnd			= "UI.PlayerProgress_VkBtn",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "text",
						layer		= "UI.PlayerProgressWnd.layers.SCREENSHOT_LABEL",
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
			text			= UI:GetStringByName( "playerProgress_caption" ),
		},

		-- CONGRATULATION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "playerProgress_congratulation" ),
		},

		-- RANK
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- UNLOCKS_CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "playerProgress_unlocks" ),
		},

		-- SCREENSHOT_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "screenshot" ),
		},		
	},

	children =
	{
		"UI.PlayerProgress_UnlocksListWnd",
		"UI.PlayerProgress_CloseBtn",
		"UI.PlayerProgress_CrossBtn", 
		"UI.PlayerProgress_FbBtn",
		"UI.PlayerProgress_VkBtn",
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

-- нет самостоятеьной подписки, вызывается из UI.HangarWnd
function UI.PlayerProgressWnd:F_OnEventMasterServerDisconnectedSync( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.dataQueue = {}

	if self.data ~= nil then
		self:ResetContent()
		self.data = nil
	end

end


--
function UI.PlayerProgressWnd:FB_OnEvent( eventId, success, desc )

	if not self:IsOnScreen() then
		return
	end

	if eventId == _G.FBEventType.FBET_LOGIN then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.FB_LOGIN then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_MAKE_SCREENSHOT )
			_G.FB_PostScreenShot()
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end		

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_UPLOADING_STARTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.FB_MAKE_SCREENSHOT then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_POST_SCREENSHOT )
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_POSTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.FB_POST_SCREENSHOT then
			return
		end

		self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )

	end
	
end


--
function UI.PlayerProgressWnd:VK_OnEvent( eventId, success, errorCode )

	if not self:IsOnScreen() then
		return
	end

	if eventId == _G.FBEventType.FBET_LOGIN then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.VK_LOGIN then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_MAKE_SCREENSHOT )
			_G.VK_PostScreenShot()
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end		

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_UPLOADING_STARTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.VK_MAKE_SCREENSHOT then
			return
		end

		if UI:IsTrueEx( success ) then
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_POST_SCREENSHOT )
		else
			self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )
		end

	elseif eventId == _G.FBEventType.FBET_SCREENSHOT_POSTED then

		if self.socialNetWaitMode ~= UI.SocialNetWaitingWnd.modes.VK_POST_SCREENSHOT then
			return
		end

		self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )

	end
	
end


--
function UI.PlayerProgressWnd:OnSocialNetWaitingCancel( mode )

	self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )

end


-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgressWnd.layers =
{
    MAIN_EFFECT			= 0,
	BG_EFFECT			= 1,
    WORK_EFFECT			= 2,
    CAPTION				= 3,
	CONGRATULATION		= 4,
	RANK				= 5,
	UNLOCKS_CAPTION		= 6,
	SCREENSHOT_LABEL	= 7,
}

UI.PlayerProgressWnd.effectInfo =
{
	work =
	{
		raceIcoSpriteName	= "ico",
	}
}

--
UI.PlayerProgressWnd.rewardTypes =
{	
	ITEM			= 1,
	CREDITS			= 2,
	GOLD			= 3,
	TOKENS			= 4,
	SYNERGY_FREE	= 5,
	PREMIUM			= 6,
}

UI.PlayerProgressWnd.unlockTypes =
{
	PVP_MAPS				= 1, 
	PVP_GAMEPLAYS			= 2, 
	OPENWORLD_MAP_ENABLE	= 3, 
	OPENWORLD_START_ENABLE	= 4, 
	OPENWORLD_MAPS			= 5, 
	TALENTS_ENABLE			= 6, 
	TALENT_SETS				= 7, 
	TALENTS					= 8, 
	ITEM_CRAFT_ENABLE		= 9, 
	ITEMS					= 10,
}

UI.PlayerProgressWnd.sounds =
{
	hide	= "sound/ui/MsgHide",
	show	= "sound/ui/unlock",
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PlayerProgressWnd.dataQueue			= {}
UI.PlayerProgressWnd.data				= nil
UI.PlayerProgressWnd.socialNetWaitMode	= UI.SocialNetWaitingWnd.modes.NONE
UI.PlayerProgressWnd.socialNetWaitWnd	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgressWnd:F_PostLoad()

	UI.FullScreenSelectionWnd.F_PostLoad( self )

	self.socialNetWaitWnd = UI.PlayerProgress_SocialNetWaitingWnd

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_WND_SHOWN )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_NOTIFICATIONS_ADD_TOTAL )	
	UI:SubscribeUiObjOnEvent( handle, UI.EV_NOTIFICATIONS_CLEAR )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_TUTORIAL_STOP )

end


--
function UI.PlayerProgressWnd:ResetContent()

	self:SetText( "", self.layers.RANK )

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetSpriteTexture( self.effectInfo.work.raceIcoSpriteName, UI.INVALID_RESOURCE_HANDLE ) 
	end

	UI.PlayerProgress_UnlocksListWnd:Clear()

	self:SetLayerVisible( false, self.layers.UNLOCKS_CAPTION )

	self:HideSocialNetWaitEffect()
	
end


--
function UI.PlayerProgressWnd:FullUpdate()

	self:ResetContent()

    self:UpdateSocialNetWaitEffect()

	if not self.data then
		return
	end

	self:UpdateRank()
	self:UpdateRaceIco()
	self:UpdateUnlocks()

end


--
function UI.PlayerProgressWnd:UpdateRank()

	local strRank = "unknown"

	local rank = self.data.rank
	if type( rank ) ~= "number" then
		sys.log( "UI.PlayerProgressWnd:UpdateRank()[ERROR]: invalid type of \"rank\"; \"number\" expected, got \"%s\"", type( rank ) )
		rank = -1
	end

	if rank ~= -1 then
		strRank = tostring( rank )
	end

	local str = UI:GetStringByName( "playerProgress_rank" )
	str = string.gsub( str, "%$rank%$", strRank )

	self:SetText( str, self.layers.RANK )

end


--
function UI.PlayerProgressWnd:UpdateRaceIco()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local hTex = UI:GetTex( "NoData" )

	local race = self.data.race
	if type( race ) ~= "number" then
		sys.log( "UI.PlayerProgressWnd:UpdateRaceIco()[ERROR]: invalid type of \"race\"; \"number\" expected, got \"%s\"", type( race ) )
		race = -1
	end

	if race ~= -1 then

		local raceName = UI:Val2Key( ai.Race, race )
		local texName = string.format( "raceBg_%s", raceName )

		hTex = UI:GetTex( texName )

	end

	workEffect:SetSpriteTexture( self.effectInfo.work.raceIcoSpriteName, hTex )


end


--
function UI.PlayerProgressWnd:UpdateUnlocks()

	UI.PlayerProgress_UnlocksListWnd:Clear()

	local unlocks = self:GetUnlocks()

	for recordIdx = 1, #unlocks do

		local data = unlocks[ recordIdx ]
		UI.PlayerProgress_UnlocksListWnd:AddRecord( data )

	end

	self:SetLayerVisible( UI.PlayerProgress_UnlocksListWnd:GetNumRecords() > 0, self.layers.UNLOCKS_CAPTION )

end


--
function UI.PlayerProgressWnd:GetUnlocks()

	local unlocks = {}

	for unlockType = 1, UI:GetTableLength( self.unlockTypes ) do

		local bEnabled	= false
		local items		= {}

    	local unlockName = UI:Val2Key( self.unlockTypes, unlockType )
		local fnName = string.format( "GetUnlock_%s", unlockName )
		local fn = self[ fnName ]

		if fn then
			bEnabled, items = fn( self )
		else
			sys.log( "UI.PlayerProgressWnd:GetUnlocks()[ERROR]: cannot find function \"%s\"", fnName )
		end

		if bEnabled then

			local unlockData =
			{
				unlockType	= unlockType,
				items		= items,
			}

			table.insert( unlocks, unlockData )

		end

	end

	return unlocks

end


--
function UI.PlayerProgressWnd:GetUnlock_PVP_MAPS()

	local bEnabled	= false
	local items		= {}

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local oldPlayerRank = UI:Reputation2Rank( oldPlayerRep )
	local newPlayerRank = UI:Reputation2Rank( newPlayerRep )		

	if type( _G.SpaceZone ) == "table" then

		for zoneName, zoneInfo in pairs( _G.SpaceZone ) do

			local bCanShowInUnlocks = true

			if zoneInfo.hide_unlock ~= nil then

				if type( zoneInfo.hide_unlock ) == "boolean" then
					bCanShowInUnlocks = not zoneInfo.hide_unlock
				else
					sys.log( "UI.PlayerProgressWnd:GetUnlock_PVP_MAPS()[ERROR]: invalid type of _G.SpaceZone.%s.hide_unlock; \"boolean\" or \"nil\" expected, got \"%s\"", zoneName, type( zoneInfo.hide_unlock ) )
				end

			end

			if bCanShowInUnlocks then

    			local mapName = zoneInfo.pvp_level_name
    			if mapName ~= nil then

    				if type( mapName ) == "string" then

    					if mapName ~= "" then

    						local zoneRank = zoneInfo.min_ship_rank
    						if type( zoneRank ) == "number" then

                            	local bWasAvailable	= oldPlayerRank >= zoneRank
                            	local bIsAvailable	= newPlayerRank >= zoneRank

                            	if not bWasAvailable and bIsAvailable then
    								table.insert( items, mapName )
                            	end

    						else
    							sys.log( "UI.PlayerProgressWnd:GetUnlock_PVP_MAPS()[ERROR]: invalid type of \"_G.SpaceZone.%s.min_ship_rank\"; \"number\" expected, got \"%s\"", zoneName, type( zoneRank ) )
    						end						

    					end

    				else
    					sys.log( "UI.PlayerProgressWnd:GetUnlock_PVP_MAPS()[ERROR]: invalid type of \"_G.SpaceZone.%s.pvp_level_name\"; \"string\" or \"nil\" expected, got \"%s\"", zoneName, type( mapName ) )
    				end

    			end

			end

		end		

	else
		sys.log( "UI.PlayerProgressWnd:GetUnlock_PVP_MAPS()[ERROR]: invalid type of \"_G.SpaceZone\"; \"table\" expected, got \"%s\"", type( _G.SpaceZone ) )
	end

	bEnabled = next( items ) ~= nil

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_PVP_GAMEPLAYS()

	local bEnabled	= false
	local items		= {}

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local oldPlayerRank = UI:Reputation2Rank( oldPlayerRep )
	local newPlayerRank = UI:Reputation2Rank( newPlayerRep )		

	if type( _G.PvPGameplayUnlock ) then

		for gameplay, gameplayRank in pairs( _G.PvPGameplayUnlock ) do

			if type( gameplay ) == "number" then

				if type( gameplayRank ) == "number" then

                	local bWasAvailable	= oldPlayerRank >= gameplayRank
                	local bIsAvailable	= newPlayerRank >= gameplayRank

                	if not bWasAvailable and bIsAvailable then
						table.insert( items, gameplay )
                	end

				else
					sys.log( "UI.PlayerProgressWnd:GetUnlock_PVP_GAMEPLAYS()[ERROR]: invalid type of \"_G.PvPGameplayUnlock[%d]\"; \"number\" expected, got \"%s\"", gameplay, type( gameplayRank ) )
				end				

			else
				sys.log( "UI.PlayerProgressWnd:GetUnlock_PVP_GAMEPLAYS()[ERROR]: invalid type of key in table \"_G.PvPGameplayUnlock\"; \"number\" expected, got \"%s\"", type( gameplay ) )
			end

		end

	else
		sys.log( "UI.PlayerProgressWnd:GetUnlock_PVP_GAMEPLAYS()[ERROR]: invalid type of \"_G.PvPGameplayUnlock\"; \"table\" expected, got \"%s\"", type( _G.PvPGameplayUnlock ) )
	end

	bEnabled = next( items ) ~= nil

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAPS()

	local bEnabled	= false
	local items		= {}

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local oldPlayerRank = UI:Reputation2Rank( oldPlayerRep )
	local newPlayerRank = UI:Reputation2Rank( newPlayerRep )		

	if type( _G.SpaceZone ) == "table" then

		for zoneName, zoneInfo in pairs( _G.SpaceZone ) do

			local bCanShowInUnlocks = true

			if zoneInfo.hide_unlock ~= nil then

				if type( zoneInfo.hide_unlock ) == "boolean" then
					bCanShowInUnlocks = not zoneInfo.hide_unlock
				else
					sys.log( "UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAPS()[ERROR]: invalid type of _G.SpaceZone.%s.hide_unlock; \"boolean\" or \"nil\" expected, got \"%s\"", zoneName, type( zoneInfo.hide_unlock ) )
				end

			end

			if bCanShowInUnlocks then

    			local pvpMapName = zoneInfo.pvp_level_name

    			if pvpMapName ~= nil then
    				if type( pvpMapName ) ~= "string" then
    					sys.log( "UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAPS()[ERROR]: invalid type of \"_G.SpaceZone.%s.pvp_level_name\"; \"string\" or \"nil\" expected, got \"%s\"", zoneName, type( pvpMapName ) )
    					pvpMapName = nil
    				end
    			end

    			if pvpMapName == nil then
    				pvpMapName = ""
    			end

    			local pveMapName = zoneInfo.pve_level_name

    			if pveMapName ~= nil then
    				if type( pveMapName ) ~= "string" then
    					sys.log( "UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAPS()[ERROR]: invalid type of \"_G.SpaceZone.%s.pve_level_name\"; \"string\" or \"nil\" expected, got \"%s\"", zoneName, type( pveMapName ) )
    					pveMapName = nil
    				end
    			end

    			if pveMapName == nil then
    				pveMapName = ""
    			end

    			if pvpMapName == "" and pveMapName == "" then

        			local mapName = zoneInfo.level_name
        			if mapName ~= nil then

        				if type( mapName ) == "string" then

        					if mapName ~= "" then

                				local zoneRank = zoneInfo.min_ship_rank
                				if type( zoneRank ) == "number" then

                                	local bWasAvailable	= oldPlayerRank >= zoneRank
                                	local bIsAvailable	= newPlayerRank >= zoneRank

                                	if not bWasAvailable and bIsAvailable then
                						table.insert( items, mapName )
                                	end

                				else
                					sys.log( "UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAPS()[ERROR]: invalid type of \"_G.SpaceZone.%s.min_ship_rank\"; \"number\" expected, got \"%s\"", zoneName, type( zoneRank ) )
                				end						

            				else
            					sys.log( "UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAPS()[ERROR]: invalid type of \"_G.SpaceZone.%s.level_name\"; \"string\" or \"nil\" expected, got \"%s\"", zoneName, type( mapName ) )
            				end

            			end

            		end		

    			end

			end

		end		

	else
		sys.log( "UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAPS()[ERROR]: invalid type of \"_G.SpaceZone\"; \"table\" expected, got \"%s\"", type( _G.SpaceZone ) )
	end

	bEnabled = next( items ) ~= nil

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_TALENTS_ENABLE()

	local bEnabled	= false
	local items		= {}

	local talentsRep = UI:Rank2Reputation( UI.rankLocks.talents )

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local bWasAvailable	= oldPlayerRep >= talentsRep
	local bIsAvailable	= newPlayerRep >= talentsRep

	bEnabled = not bWasAvailable and bIsAvailable

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_TALENTS()

	local bEnabled	= false
	local items		= {}

	-- если таланты запрещены, то они не показываются
	local talentsRep = UI:Rank2Reputation( UI.rankLocks.talents )

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local oldPlayerRank = UI:Reputation2Rank( oldPlayerRep )
	local newPlayerRank = UI:Reputation2Rank( newPlayerRep )		

	local bWasAvailable	= oldPlayerRep >= talentsRep and oldPlayerRank >= newPlayerRank
	local bIsAvailable	= newPlayerRep >= talentsRep
	
	if not bWasAvailable and bIsAvailable then

		-- если таланты раньше были запрещены, то показываются все таланты за предыдущие ранги

		local bWasForbiddenOnPrevRank = false
		if self.data.rank > 1 then
			local prevRankRep = UI:Rank2Reputation( self.data.rank - 1 )
			bWasForbiddenOnPrevRank = prevRankRep < talentsRep			
		end
	
		local minRank = bWasForbiddenOnPrevRank and 1 or self.data.rank
		local maxRank = self.data.rank

		for rank = minRank, maxRank do

        	local talentsForRank = _G.TalentGroups and _G.TalentGroups[ rank ]
        	if talentsForRank then

        		for idx = 1, #talentsForRank do
        	    	table.insert( items, talentsForRank[ idx ] )
        		end

        	end

		end 

	end

	bEnabled = next( items ) ~= nil

	return bEnabled, items

end 


--
function UI.PlayerProgressWnd:GetUnlock_TALENT_SETS()

	local bEnabled	= false
	local items		= {}

	local talentSetId = -1

	if self.data.reward.talentSet ~= nil then

		if type( self.data.reward.talentSet ) == "number" then
			talentSetId = self.data.reward.talentSet
		else
			sys.log( "UI.PlayerProgressWnd:GetUnlock_TALENT_SETS()[ERROR]: invalid type of \"talentSet\"; \"number\" expected, got \"%s\"", type( self.data.reward.talentSet ) )
		end

	end

	if talentSetId ~= -1 then
		table.insert( items, talentSetId )
	end

	bEnabled = next( items ) ~= nil

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_ITEMS()

	local bEnabled	= false
	local items		= {}

	if type( self.data.unlocks ) == "table" then

		local itemTypes =
		{
			_G.GameStore.ItemType.IT_MODULE,
			_G.GameStore.ItemType.IT_ROCKET,
		}

    	for typeIdx = 1, #itemTypes do

    		local itemType = itemTypes[ typeIdx ]

    	    local unlocksByType = self.data.unlocks[ itemType ]
    		if unlocksByType then

    			for itemIdx = 1, #unlocksByType do
    				local defName = unlocksByType[ itemIdx ]
					table.insert( items, defName )
				end

			end

		end

	else
		sys.log( "UI.PlayerProgressWnd:GetUnlock_ITEMS()[ERROR]: invalid type of field \"unlocks\" in notification RACE_RANK; \"table\" expected, got \"%s\"", type( self.data.unlocks ) )
	end

	bEnabled = next( items ) ~= nil

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_OPENWORLD_MAP_ENABLE()

	local bEnabled	= false
	local items		= {}

	local owMapRep = UI:Rank2Reputation( UI.rankLocks.openWorldMap )

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local bWasAvailable	= oldPlayerRep >= owMapRep
	local bIsAvailable	= newPlayerRep >= owMapRep

	bEnabled = not bWasAvailable and bIsAvailable

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_OPENWORLD_START_ENABLE()

	local bEnabled	= false
	local items		= {}

	local owStartRep = UI:Rank2Reputation( UI.rankLocks.openWorldStart )

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local bWasAvailable	= oldPlayerRep >= owStartRep
	local bIsAvailable	= newPlayerRep >= owStartRep

	bEnabled = not bWasAvailable and bIsAvailable

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:GetUnlock_ITEM_CRAFT_ENABLE()

	local bEnabled	= false
	local items		= {}

	local itemCraftRep = UI:Rank2Reputation( UI.rankLocks.itemCraft )

	local newReps = UI:CopyTable2( self.data.oldReputation )
	newReps[ self.data.race ] = self.data.reputation

	local oldPlayerRep = UI:CalcMaxReputation( self.data.oldReputation )
	local newPlayerRep = UI:CalcMaxReputation( newReps )

	local bWasAvailable	= oldPlayerRep >= itemCraftRep
	local bIsAvailable	= newPlayerRep >= itemCraftRep

	bEnabled = not bWasAvailable and bIsAvailable

	return bEnabled, items

end


--
function UI.PlayerProgressWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput )
	
	if w == UI.PlayerProgress_CloseBtn then
		self:OnClose()
		return true

	elseif w == UI.PlayerProgress_CrossBtn then
		self:OnCross()
		return true

	elseif w == UI.PlayerProgress_FbBtn then

		if self.socialNetWaitMode == UI.SocialNetWaitingWnd.modes.NONE then

    		if _G.FB_IsLoggedIn() then

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_MAKE_SCREENSHOT )
    			_G.FB_PostScreenShot()

    		else

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.FB_LOGIN )
    			_G.FB_ForceLogIn()

    		end

		end

	elseif w == UI.PlayerProgress_VkBtn then

		if self.socialNetWaitMode == UI.SocialNetWaitingWnd.modes.NONE then

    		if _G.VK_IsLoggedIn() then

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_MAKE_SCREENSHOT )
    			_G.VK_PostScreenShot()

    		else

				self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.VK_LOGIN )
    			_G.VK_ForceLogIn()

    		end

		end

	end

	return false

end


--
function UI.PlayerProgressWnd:OnClose()

	self:CheckClose()

end


--
function UI.PlayerProgressWnd:OnCross()

	self:CheckClose()

end


--
function UI.PlayerProgressWnd:OnEscape()

	self:CheckClose()
	return true

end


--
function UI.PlayerProgressWnd:OnEnter()

	self:CheckClose()
	return true

end


--
function UI.PlayerProgressWnd:CheckClose()

	if not next( self.dataQueue ) then
		UI:PlayGlobalSound( self.sounds.hide )
		self:Hide()
	else
		self:ShowDataFromQueue()
	end

end


--
function UI.PlayerProgressWnd:CanShowNewDataNow()

	if self.data then
		return false
	end

	if not UI.HangarWnd:IsOnScreen() then
		return false
	end

	if UI.Tutorial:IsActive() then
		return false
	end

	return true

end


--
function UI.PlayerProgressWnd:ShowDataFromQueue()

	if not next( self.dataQueue ) then
		sys.log( "UI.PlayerProgressWnd:ShowDataFromQueue()[ERROR]: queue is empty" )
		return
	end

	local data = table.remove( self.dataQueue, 1 )
	self:ShowData( data )

end


--
function UI.PlayerProgressWnd:ShowData( data )

	self.data = data

	if not self:IsOnScreen() then
		UI.Root:AddChild( self )  -- FullUpdate() будет вызван из F_OnAfterShowOnScreen()
	else
		self:FullUpdate()
	end		

	UI:PlayGlobalSound( self.sounds.show )

end


--
function UI.PlayerProgressWnd:F_OnEventWndShown( hSender, hWnd )

	if hWnd ~= self:GetUiHandle() then

		if next( self.dataQueue ) and self:CanShowNewDataNow() then
			self:ShowDataFromQueue()
		end

	end

end


--
function UI.PlayerProgressWnd:F_OnEventTutorialStop( hSender, iParam0, iParam1, fParam0, fParam1 )

	if next( self.dataQueue ) and self:CanShowNewDataNow() then
		self:ShowDataFromQueue()
	end

end


--
function UI.PlayerProgressWnd:F_OnAfterHideFromScreen()

	if not UI:IsInRemovingAllWindows() then
		UI.FullScreenSelectionWnd.F_OnAfterHideFromScreen( self )
		self:HideSocialNetWaitEffect()
	else
		self:OnAfterHideFromScreen()
	end

	if not UI:IsInShutdown() and not UI:IsInRemovingAllWindows() then
		self.data = nil
		self:ResetContent()
	end

end


--
function UI.PlayerProgressWnd:F_OnEventSaveUiState()

	self:HideSocialNetWaitEffect()

	UI.store.PlayerProgressWnd =
	{
		data				= self.data,
		dataQueue			= self.dataQueue,		
		socialNetWaitMode	= self.socialNetWaitMode,
	}

end


--
function UI.PlayerProgressWnd:F_OnEventRestoreUiState()

	if UI.store.PlayerProgressWnd then

		self.data				= UI.store.PlayerProgressWnd.data
		self.dataQueue			= UI.store.PlayerProgressWnd.dataQueue
		self.socialNetWaitMode	= UI.store.PlayerProgressWnd.socialNetWaitMode

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.PlayerProgressWnd = nil

	end

end


--
function UI.PlayerProgressWnd:F_OnEventNotificationsAddTotal( hSender, iParam0, iParam1, fParam0, fParam1 )

	local ntfId = UI.Notifications:GetLastNotificationIdTotal()
	local ntf = UI.Notifications:GetNotificationTotal( ntfId )

	if not ntf or ntf.type ~= UI.Notifications.types.RACE_RANK then
		return
	end

	if self:CanShowNewDataNow() then
		self:ShowData( ntf.params )
	else
		table.insert( self.dataQueue, ntf.params )
	end

end


--
function UI.PlayerProgressWnd:F_OnEventNotificationsClear( hSender, iParam0, iParam1, fParam0, fParam1 )

	self.dataQueue = {}
	self.data = nil

	if self:IsOnScreen() then
		self:Hide()
	end

end


--
function UI.PlayerProgressWnd:SetSocialNetWaitMode( mode )

	self.socialNetWaitMode = mode
	self:UpdateSocialNetWaitEffect()

end


--
function UI.PlayerProgressWnd:UpdateSocialNetWaitEffect()

	if not self:IsOnScreen() or self.socialNetWaitMode == UI.SocialNetWaitingWnd.modes.NONE then
		self:HideSocialNetWaitEffect()

	else
		self.socialNetWaitWnd:SetMode( self.socialNetWaitMode )
		UI.Root:AddChild( self.socialNetWaitWnd )
	end

end


--
function UI.PlayerProgressWnd:HideSocialNetWaitEffect()

	if self.socialNetWaitWnd:IsOnScreen() then
		self.socialNetWaitWnd:Reset()
		self.socialNetWaitWnd:UnlinkFromParent()		
	end

end


--
function UI.PlayerProgressWnd:F_OnAfterShowOnScreen()

	self:SetSocialNetWaitMode( UI.SocialNetWaitingWnd.modes.NONE )

	UI.FullScreenSelectionWnd.F_OnAfterShowOnScreen( self )	

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_CrossBtn
-- ------------------------------------------------------------------------

UI.PlayerProgress_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "PlayerProgress_CrossBtn"
    	}
	}
}

-- ------------------------------------------------------------------------
-- UI.PlayerProgress_CloseBtn
-- ------------------------------------------------------------------------

UI.PlayerProgress_CloseBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "TextBtn",

    	props =
    	{
    		name = "PlayerProgress_CloseBtn"
    	}
	},

	textId = "playerProgress_closeBtn"
}

-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlocksListWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlocksListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "ButtonsListWnd",

		props =
		{
			name	= "PlayerProgress_UnlocksListWnd",
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
    				defName 			= "playerProgress_unlocksList",
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
	},

	btnPrototypeName = "PlayerProgress_UnlockSlotWnd",

    effectInfo =
    {
    	main =
    	{
    		slotObjNamePrefix	= "slot_2_",
    		scrollObjName		= "",
    		animIdle			= "idle",
    	}
    },

    MAX_SLOTS = 12,

	listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION,
}

-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockSlotWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "PlayerProgress_UnlockSlotWnd",
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
				defName 			= "playerProgress_unlockSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.PlayerProgress_UnlockSlotWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "color_1",
						layer		= "UI.PlayerProgress_UnlockSlotWnd.layers.NUM",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ico_1",
						layer		= "UI.PlayerProgress_UnlockSlotWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}		
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- NUM
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerProgress_unlockSlot_ico",
				defaultAnimation	= "idle",	
			}}
		},
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.NUM )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	                                       	
end


--
function UI.PlayerProgress_UnlockSlotWnd:GetTooltipData()

	-- функция должна быть определена и надо вернуть не nil, иначе HandleTooltip() не бует вызвана
	return {}

end


--
function UI.PlayerProgress_UnlockSlotWnd:HandleTooltip( targetWnd, tooltipData )

	if targetWnd ~= self then
		sys.log( "UI.PlayerProgress_UnlockSlotWnd:HandleTooltip()[ERROR]: cannot be here" )
		return false, UI.INVALID_UI_HANDLE
	end

	local hTooltip = UI.INVALID_UI_HANDLE

	local data = self:GetRecordData()

	if data.unlockType == UI.PlayerProgressWnd.unlockTypes.TALENTS_ENABLE or data.unlockType == UI.PlayerProgressWnd.unlockTypes.ITEM_CRAFT_ENABLE then

		hTooltip = UI:GetDefaultTooltipWnd( UI.tooltipTypes.TEXT_LARGE )

		local unlockName = UI:Val2Key( UI.PlayerProgressWnd.unlockTypes, data.unlockType )

		local tooltipData =
		{
			tooltipType	= UI.tooltipTypes.TEXT_LARGE,
			caption		= UI:GetStringByName( string.format( "playerProgress_unlockName_%s", unlockName ) ),
			text		= UI:GetStringByName( string.format( "playerProgress_unlockTooltipDesc_%s", unlockName ) ),			
		}

		local tooltipWnd = UI:GetUiObjByHandleT( hTooltip )
		if tooltipWnd then
			tooltipWnd:Setup( tooltipData )
		else
			sys.log( "UI.PlayerProgress_UnlockSlotWnd:UpdateTooltip()[ERROR]: no tooltip window" )
		end

	else

    	local unlockName = UI:Val2Key( UI.PlayerProgressWnd.unlockTypes, data.unlockType )
    	local tooltipWndName = string.format( "PlayerProgress_UnlockTooltipWnd_%s", unlockName )

    	local tooltipWnd = UI[ tooltipWndName ]
    	if tooltipWnd then

    		hTooltip = tooltipWnd:GetUiHandle()
			tooltipWnd:Setup( data )

    	else
    		sys.log( "UI.PlayerProgress_UnlockSlotWnd:UpdateTooltip()[ERROR]: cannot find tooltip for unlock %s", unlockName )
    	end

	end

	return true, hTooltip

end


-- ----------------------------------
-- const
-- ----------------------------------

UI.PlayerProgress_UnlockSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
	CAPTION		= 1,
	NUM			= 2,
	ICO_EFFECT	= 3,
}

UI.PlayerProgress_UnlockSlotWnd.effectInfo =
{
	ico =
	{
		icoSpriteName		= "ico",
	},
}

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockSlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateCaption( data )
	self:UpdateNum( data )
	self:UpdateIco( data )

end


--
function UI.PlayerProgress_UnlockSlotWnd:UpdateCaption( data )

	local unlockName = UI:Val2Key( UI.PlayerProgressWnd.unlockTypes, data.unlockType )
	local strId = string.format( "playerProgress_unlockName_%s", unlockName )

	local str = UI:GetStringByName( strId )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.PlayerProgress_UnlockSlotWnd:UpdateNum( data )

	local str = ""

	if	data.unlockType == UI.PlayerProgressWnd.unlockTypes.PVP_MAPS or
		data.unlockType == UI.PlayerProgressWnd.unlockTypes.PVP_GAMEPLAYS or
		data.unlockType == UI.PlayerProgressWnd.unlockTypes.OPENWORLD_MAPS or
		data.unlockType == UI.PlayerProgressWnd.unlockTypes.TALENTS or
		data.unlockType == UI.PlayerProgressWnd.unlockTypes.TALENT_SETS or
		data.unlockType == UI.PlayerProgressWnd.unlockTypes.ITEMS then

			local num = #data.items
			str = tostring( num )
	end

	self:SetText( str, self.layers.NUM )

end


--
function UI.PlayerProgress_UnlockSlotWnd:UpdateIco( data )

	local hTex = UI.INVALID_RESOURCE_HANDLE	

	if	data.unlockType == UI.PlayerProgressWnd.unlockTypes.OPENWORLD_MAP_ENABLE or
		data.unlockType == UI.PlayerProgressWnd.unlockTypes.OPENWORLD_START_ENABLE then

    		local unlockName = UI:Val2Key( UI.PlayerProgressWnd.unlockTypes, data.unlockType )
    		local texId = string.format( "unlock_%s", unlockName )
    		hTex = UI:GetTex( texId )
	end

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd = {}

-- ----------------------------------
-- work functions
-- ----------------------------------

UI.PlayerProgress_UnlockTooltipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PlayerProgress_UnlockTooltipWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd:Setup( data, bRestorePos )

	if type( data ) ~= "table" then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd:Setup()[ERROR]: invalid type of the 1-st param (\"data\"); \"table\" expected, got \"%s\"", type( data ) )
		return
	end

	self:Reset()

	self.data = data

	if bRestorePos ~= nil then
		if type( bRestorePos ) ~= "boolean" then
			sys.log( "UI.PlayerProgress_UnlockTooltipWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"bRestorePos\"); \"boolean\" or \"nil\" expected, got \"%s\"", type( bRestorePos ) )
			bRestorePos = nil
		end
	end

	if bRestorePos == nil then
		bRestorePos = false
	end

	self:FullUpdate()
	self:RecalcLayout()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then

		local bNeedReplace = false

		if not bRestorePos then
			bNeedReplace = true
		else
			local rect = self:GetRect()
			if not( rect.x >= 0 and rect.x + rect.w <= 1024 and rect.y >= 0 and rect.y + rect.w <= 768 ) then
				bNeedReplace = true
			end
		end

		if bNeedReplace then
			UI:PlaceTooltipOnScreen( self, data )
		end

	end

end


-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd.layers =
{
    MAIN_EFFECT	= 0,
    CAPTION		= 1,
}

UI.PlayerProgress_UnlockTooltipWnd.effectInfo =
{
	main =
	{
		minHeightLocator	= "dist_min",
		maxHeightLocator	= "self",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd.data = nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )	
	if mainEffect then
		mainEffect:UnlinkWnd( self:GetUiHandle(), "self" )
	end

	self:CreateControls()

end


-- for override
function UI.PlayerProgress_UnlockTooltipWnd:CreateControls()
end


-- for override
function UI.PlayerProgress_UnlockTooltipWnd:Reset()

	self.data = nil
	self:SetText( "", self.layers.CAPTION )

end


-- for override
function UI.PlayerProgress_UnlockTooltipWnd:FullUpdate()

	self:UpdateCaption()

end


--
function UI.PlayerProgress_UnlockTooltipWnd:UpdateCaption()

	local unlockName = UI:Val2Key( UI.PlayerProgressWnd.unlockTypes, self.data.unlockType )
	local strId = string.format( "playerProgress_unlockName_%s", unlockName )

	local str = UI:GetStringByName( strId )
	self:SetText( str, self.layers.CAPTION )

end


--
function UI.PlayerProgress_UnlockTooltipWnd:RecalcLayout()

	self:RecalcSelfHeight()

end


--
function UI.PlayerProgress_UnlockTooltipWnd:RecalcSelfHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.maxHeightLocator ).y
	local minSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.minHeightLocator ).y

	local selfHeight = self:GetSelfHeight()
	selfHeight = UI:Clamp( selfHeight, minSelfHeight, maxSelfHeight )
	
	self:SetHeight( selfHeight )

	local animTime = ( selfHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

end


-- for override
function UI.PlayerProgress_UnlockTooltipWnd:GetSelfHeight()

	return 0

end


--
function UI.PlayerProgress_UnlockTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PlayerProgress_UnlockTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.PlayerProgress_UnlockTooltipWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_list
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_list = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_list.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd",

	props =
	{
		name		= "PlayerProgress_UnlockTooltipWnd_list",
		isPrototype	= true,
	},
}

-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_list.effectInfo =
{
	main =
	{
		listLocator = "list",		
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_list.listWnd	= nil

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_list:Reset()

	UI.PlayerProgress_UnlockTooltipWnd.Reset( self )

	self.listWnd:Clear()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_list:FullUpdate()

	self:UpdateCaption()
	self:UpdateItems()

end


-- for override
function UI.PlayerProgress_UnlockTooltipWnd_list:UpdateItems()
end


--
function UI.PlayerProgress_UnlockTooltipWnd_list:RecalcLayout()

	self.listWnd:RecalcLayout()
	self:RecalcSelfHeight()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_list:GetSelfHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local listEffect = UI:GetEffectFromLayer( self.listWnd, self.listWnd.layers.MAIN_EFFECT )

	local listMaxSize	= listEffect and listEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local listPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.listLocator ) or Vec2( 0, 0 )
	local selfMaxHeight = mainEffect and mainEffect:GetObjSize( "self" ).y or 0

	local space_list_btm = selfMaxHeight - ( listPos.y + listMaxSize.y )
	local listRect = self.listWnd:GetRect()

	local selfHeight = listRect.y + listRect.w + space_list_btm

	return selfHeight	

end     


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_simple
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_simple = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_simple.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd",

	props =
	{
		name		= "PlayerProgress_UnlockTooltipWnd_simple",
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
				defName 			= "playerProgress_unlockTooltip_simple",
				defaultAnimation	= "idle",

				links =
				{

					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_simple.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по размеру
					{
						objName		= "description3",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_simple.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ico",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_simple.layers.ICO_EFFECT",
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

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			

			effects =
			{{
				defName 			= "playerProgress_unlockTooltip_simple_ico",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_simple.layers =
{
	MAIN_EFFECT	= 0,
	CAPTION		= 1,
	DESC		= 2,
	ICO_EFFECT	= 3,
}

UI.PlayerProgress_UnlockTooltipWnd_simple.effectInfo =
{
	main =
	{
		minHeightLocator	= "dist_min",
		maxHeightLocator	= "self",
		icoLocator			= "ico",
		descLocator			= "description3",
	},

	ico =
	{
		icoSpriteName = "ico"
	}
}


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_simple:Reset()

	UI.PlayerProgress_UnlockTooltipWnd.Reset( self )

	self:SetText( "", self.layers.DESC )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

end


--
function UI.PlayerProgress_UnlockTooltipWnd_simple:FullUpdate()

	self:UpdateCaption()
	self:UpdateDesc()
	self:UpdateIco()

end


-- for override
function UI.PlayerProgress_UnlockTooltipWnd_simple:UpdateDesc()
end


-- for override
function UI.PlayerProgress_UnlockTooltipWnd_simple:UpdateIco()
end


--
function UI.PlayerProgress_UnlockTooltipWnd_simple:RecalcLayout()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local descBaseSize	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local formatRect	= UI:Quat( 0, 0, descBaseSize.x, 10000000 )
	
    local descHeight = _G.MeasureText(
   		self:GetText( self.layers.DESC ),
   		self:GetFont( self.layers.DESC ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.DESC ),
    	formatRect).w

	self:SetLayerWidth( descBaseSize.x, self.layers.DESC )
	self:SetLayerHeight( descHeight, self.layers.DESC )

	self:RecalcSelfHeight()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_simple:GetSelfHeight()

	local mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local icoEffect		= UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )

	local icoPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.icoLocator ) or Vec2( 0, 0 )
	local icoSize			= icoEffect and icoEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local descPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descBaseSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descRect			= self:GetLayerRect( self.layers.DESC )
	local maxSelfHeight 	= mainEffect and mainEffect:GetObjSize( "self" ).y or 0
	local infoBaseY1		= math.max( icoPos.y + icoSize.y, descPos.y + descBaseSize.y )
	local space_info_btm	= maxSelfHeight - infoBaseY1
	local infoY1			= math.max( icoPos.y + icoSize.y, descRect.y + descRect.w )

	local selfHeight		= infoY1 + space_info_btm

	return selfHeight

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_list",

	props =
	{
		name			= "PlayerProgress_UnlockTooltipWnd_PVP_MAPS",
		activationOrder	= 0,
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
				defName				= "playerProgress_unlockTooltip_maps",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.PlayerProgress_UnlockTooltip_PvpMapsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "hint_1",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.layers.PAGE_EFFECT",
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

		-- PAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerProgress_unlockTooltip_maps_page",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title17",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.layers.PAGE_KEY_TIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title16",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.layers.PAGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PAGE_KEY_TIP
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "playerProgress_unlockTooltip_pageKeyTip" )
		},

		-- PAGE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},       

	},

	children = { "UI.PlayerProgress_UnlockTooltip_PvpMapsListWnd" }
}


-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
    PAGE_EFFECT		= 2,
    PAGE_KEY_TIP	= 3,
    PAGE			= 4,
}

UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.effectInfo =
{
	main =
	{
		pageLocator	= "hint_1",
		listLocator = "list",		
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS.page	= -1


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:CreateControls()

	self.listWnd = UI.PlayerProgress_UnlockTooltip_PvpMapsListWnd

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:Reset()

	UI.PlayerProgress_UnlockTooltipWnd_list.Reset( self )

	self.page = -1

	self:SetLayerVisible( false, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( false, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( false, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:FullUpdate()

	self:UpdateCaption()
	self:SetPage( 1 )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:SetPage( page )

	if self.page == page then
		return
	end

	self.page = page

	self:UpdateItems()
	self:UpdatePageControls()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:UpdateItems()

	self.listWnd:Clear()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:UpdateItems()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	if numItems == 0 then
		return
	end

	local items = {}

	for idx, mapName in pairs( self.data.items ) do

		local item = {}

		item.mapName			= mapName		
		item.mapLocalizedName	= _G.Utf8CaseFold_Transform( UI:GetLevelLocalizedName( mapName ) )

		table.insert( items, item )		
		
	end

	local function fnSort( item1, item2 )
		return item1.mapLocalizedName < item2.mapLocalizedName
	end

	table.sort( items, fnSort )

	local firstitemIdx	= UI:Clamp( ( self.page - 1 ) * self.listWnd.MAX_SLOTS + 1, 1, numItems )
	local lastItemIdx	= UI:Clamp( firstitemIdx + self.listWnd.MAX_SLOTS - 1, 1, numItems )

	for itemIdx = firstitemIdx, lastItemIdx do
		local data = { mapName = items[ itemIdx ].mapName }
		self.listWnd:AddRecord( data )
	end

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:UpdatePageControls()

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	local bPageVisible = numPages > 1 and self.page ~= -1

	self:SetLayerVisible( bPageVisible, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE )

	if not bPageVisible then
		return
	end

	local tSubst =
	{
		cur	= tostring( self.page ),
		max	= tostring( numPages ),
	}

	local str = UI:GetStringByName( "playerProgress_unlockTooltipWnd_page" )
	str = string.gsub( str, "%$(.-)%$", tSubst )

	self:SetText( str, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:RecalcSelfHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.maxHeightLocator ).y
	local minSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.minHeightLocator ).y

	local animHeight = self:GetSelfHeight()
	animHeight = UI:Clamp( animHeight, minSelfHeight, maxSelfHeight )

	local animTime = ( animHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

	local selfHeight = animHeight

	if self:IsLayerVisible( self.layers.PAGE_EFFECT ) then

		local pageEffect = UI:GetEffectFromLayer( self, self.layers.PAGE_EFFECT )
		if pageEffect then

			local pagePos		= mainEffect:GetObjPos( self.effectInfo.main.pageLocator )
			local pageSize		= pageEffect:GetObjSize( "self112" )

			selfHeight = pagePos.y + pageSize.y

		end

	end
	
	self:SetHeight( selfHeight )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key == UI.Keys.KEY_CONTROL and self:OnControl() then
		return true
	end

	UI.PlayerProgressWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )	
	return true

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:OnControl()

	if self.page ~= -1 then
		self:TogglePage()
		return true
	end

	return false

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:TogglePage()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:TogglePage()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	if numPages < 2 then
		return
	end

	local nextPage = math.fmod( self.page, numPages ) + 1
	self:SetPage( nextPage )

	self:RecalcLayout()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_MAPS:F_OnAfterShowOnScreen()

	if self.page ~= -1 and self.page ~= 1 then
		self:SetPage( 1 )
		self:RecalcLayout()
	end	

	UI.PlayerProgress_UnlockTooltipWnd_list.F_OnAfterShowOnScreen( self )

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_PVP_GAMEPLAYS
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_PVP_GAMEPLAYS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_PVP_GAMEPLAYS.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_list",

	props =
	{
		name		= "PlayerProgress_UnlockTooltipWnd_PVP_GAMEPLAYS",
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
				defName				= "playerProgress_unlockTooltip_gameplays",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_PVP_GAMEPLAYS.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.PlayerProgress_UnlockTooltip_PvpGameplaysListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.PlayerProgress_UnlockTooltip_PvpGameplaysListWnd" }
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_GAMEPLAYS:CreateControls()

	self.listWnd = UI.PlayerProgress_UnlockTooltip_PvpGameplaysListWnd

end


--
function UI.PlayerProgress_UnlockTooltipWnd_PVP_GAMEPLAYS:UpdateItems()

	self.listWnd:Clear()

	local items = UI:CopyTable2( self.data.items )
	table.sort( items )

	for idx = 1, #items do
		local data = { gameplay = items[ idx ] }
		self.listWnd:AddRecord( data )
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_list",

	props =
	{
		name			= "PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS",
		activationOrder	= 0,
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
				defName				= "playerProgress_unlockTooltip_maps",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.PlayerProgress_UnlockTooltip_OpenworldMapsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "hint_1",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.layers.PAGE_EFFECT",
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

		-- PAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerProgress_unlockTooltip_maps_page",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title17",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.layers.PAGE_KEY_TIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title16",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.layers.PAGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PAGE_KEY_TIP
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "playerProgress_unlockTooltip_pageKeyTip" )
		},

		-- PAGE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},       
	},

	children = { "UI.PlayerProgress_UnlockTooltip_OpenworldMapsListWnd" }
}

-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
    PAGE_EFFECT		= 2,
    PAGE_KEY_TIP	= 3,
    PAGE			= 4,
}

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.effectInfo =
{
	main =
	{
		pageLocator	= "hint_1",
		listLocator = "list",		
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS.page	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:CreateControls()

	self.listWnd = UI.PlayerProgress_UnlockTooltip_OpenworldMapsListWnd

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:Reset()

	UI.PlayerProgress_UnlockTooltipWnd_list.Reset( self )

	self.page = -1

	self:SetLayerVisible( false, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( false, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( false, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:FullUpdate()

	self:UpdateCaption()
	self:SetPage( 1 )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:SetPage( page )

	if self.page == page then
		return
	end

	self.page = page

	self:UpdateItems()
	self:UpdatePageControls()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:UpdateItems()

	self.listWnd:Clear()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:UpdateItems()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	if numItems == 0 then
		return
	end

	local items = {}

	for idx, mapName in pairs( self.data.items ) do

		local item = {}

		item.mapName			= mapName		
		item.mapLocalizedName	= _G.Utf8CaseFold_Transform( UI:GetLevelLocalizedName( mapName ) )

		table.insert( items, item )		
		
	end

	local function fnSort( item1, item2 )
		return item1.mapLocalizedName < item2.mapLocalizedName
	end

	table.sort( items, fnSort )

	local firstitemIdx	= UI:Clamp( ( self.page - 1 ) * self.listWnd.MAX_SLOTS + 1, 1, numItems )
	local lastItemIdx	= UI:Clamp( firstitemIdx + self.listWnd.MAX_SLOTS - 1, 1, numItems )

	for itemIdx = firstitemIdx, lastItemIdx do
		local data = { mapName = items[ itemIdx ].mapName }
		self.listWnd:AddRecord( data )
	end

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:UpdatePageControls()

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	local bPageVisible = numPages > 1 and self.page ~= -1

	self:SetLayerVisible( bPageVisible, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE )

	if not bPageVisible then
		return
	end

	local tSubst =
	{
		cur	= tostring( self.page ),
		max	= tostring( numPages ),
	}

	local str = UI:GetStringByName( "playerProgress_unlockTooltipWnd_page" )
	str = string.gsub( str, "%$(.-)%$", tSubst )

	self:SetText( str, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:RecalcSelfHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.maxHeightLocator ).y
	local minSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.minHeightLocator ).y

	local animHeight = self:GetSelfHeight()
	animHeight = UI:Clamp( animHeight, minSelfHeight, maxSelfHeight )

	local animTime = ( animHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

	local selfHeight = animHeight

	if self:IsLayerVisible( self.layers.PAGE_EFFECT ) then

		local pageEffect = UI:GetEffectFromLayer( self, self.layers.PAGE_EFFECT )
		if pageEffect then

			local pagePos		= mainEffect:GetObjPos( self.effectInfo.main.pageLocator )
			local pageSize		= pageEffect:GetObjSize( "self112" )

			selfHeight = pagePos.y + pageSize.y

		end

	end
	
	self:SetHeight( selfHeight )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key == UI.Keys.KEY_CONTROL and self:OnControl() then
		return true
	end

	UI.PlayerProgressWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )	
	return true

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:OnControl()

	if self.page ~= -1 then
		self:TogglePage()
		return true
	end

	return false

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:TogglePage()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:TogglePage()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	if numPages < 2 then
		return
	end

	local nextPage = math.fmod( self.page, numPages ) + 1
	self:SetPage( nextPage )

	self:RecalcLayout()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAPS:F_OnAfterShowOnScreen()

	if self.page ~= -1 and self.page ~= 1 then
		self:SetPage( 1 )
		self:RecalcLayout()
	end	

	UI.PlayerProgress_UnlockTooltipWnd_list.F_OnAfterShowOnScreen( self )

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_TALENTS
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_TALENTS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_TALENTS.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_list",

	props =
	{
		name			= "PlayerProgress_UnlockTooltipWnd_TALENTS",
		activationOrder	= 0,
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
				defName				= "playerProgress_unlockTooltip_talents",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_TALENTS.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.PlayerProgress_UnlockTooltip_TalentsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "hint_3",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_TALENTS.layers.PAGE_EFFECT",
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

		-- PAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerProgress_unlockTooltip_items_page",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title17",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_TALENTS.layers.PAGE_KEY_TIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title16",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_TALENTS.layers.PAGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PAGE_KEY_TIP
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "playerProgress_unlockTooltip_pageKeyTip" )
		},

		-- PAGE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},       
	},

	children = { "UI.PlayerProgress_UnlockTooltip_TalentsListWnd" }
}

-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_TALENTS.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
    PAGE_EFFECT		= 2,
    PAGE_KEY_TIP	= 3,
    PAGE			= 4,
}

UI.PlayerProgress_UnlockTooltipWnd_TALENTS.effectInfo =
{
	main =
	{
		pageLocator	= "hint_3",
		listLocator = "list",		
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_TALENTS.page	= -1


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:CreateControls()

	self.listWnd = UI.PlayerProgress_UnlockTooltip_TalentsListWnd

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:Reset()

	UI.PlayerProgress_UnlockTooltipWnd_list.Reset( self )

	self.page = -1

	self:SetLayerVisible( false, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( false, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( false, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:FullUpdate()

	self:UpdateCaption()
	self:SetPage( 1 )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:SetPage( page )

	if self.page == page then
		return
	end

	self.page = page

	self:UpdateItems()
	self:UpdatePageControls()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:UpdateItems()

	self.listWnd:Clear()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_TALENTS:UpdateItems()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	if numItems == 0 then
		return
	end

	local items = UI:CopyTable2( self.data.items )
	table.sort( items )

	local firstitemIdx	= UI:Clamp( ( self.page - 1 ) * self.listWnd.MAX_SLOTS + 1, 1, numItems )
	local lastItemIdx	= UI:Clamp( firstitemIdx + self.listWnd.MAX_SLOTS - 1, 1, numItems )

	for itemIdx = firstitemIdx, lastItemIdx do
		local data = { talentId = items[ itemIdx ] }
		self.listWnd:AddRecord( data )
	end

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:UpdatePageControls()

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	local bPageVisible = numPages > 1 and self.page ~= -1

	self:SetLayerVisible( bPageVisible, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE )

	if not bPageVisible then
		return
	end

	local tSubst =
	{
		cur	= tostring( self.page ),
		max	= tostring( numPages ),
	}

	local str = UI:GetStringByName( "playerProgress_unlockTooltipWnd_page" )
	str = string.gsub( str, "%$(.-)%$", tSubst )

	self:SetText( str, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:RecalcSelfHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.maxHeightLocator ).y
	local minSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.minHeightLocator ).y

	local animHeight = self:GetSelfHeight()
	animHeight = UI:Clamp( animHeight, minSelfHeight, maxSelfHeight )

	local animTime = ( animHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

	local selfHeight = animHeight

	if self:IsLayerVisible( self.layers.PAGE_EFFECT ) then

		local pageEffect = UI:GetEffectFromLayer( self, self.layers.PAGE_EFFECT )
		if pageEffect then

			local pagePos		= mainEffect:GetObjPos( self.effectInfo.main.pageLocator )
			local pageSize		= pageEffect:GetObjSize( "self112" )

			selfHeight = pagePos.y + pageSize.y

		end

	end
	
	self:SetHeight( selfHeight )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key == UI.Keys.KEY_CONTROL and self:OnControl() then
		return true
	end

	UI.PlayerProgressWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )	
	return true

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:OnControl()

	if self.page ~= -1 then
		self:TogglePage()
		return true
	end

	return false

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:TogglePage()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_TALENTS:TogglePage()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	if numPages < 2 then
		return
	end

	local nextPage = math.fmod( self.page, numPages ) + 1
	self:SetPage( nextPage )

	self:RecalcLayout()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENTS:F_OnAfterShowOnScreen()

	if self.page ~= -1 and self.page ~= 1 then
		self:SetPage( 1 )
		self:RecalcLayout()
	end	

	UI.PlayerProgress_UnlockTooltipWnd_list.F_OnAfterShowOnScreen( self )

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_TALENT_SETS
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_TALENT_SETS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_TALENT_SETS.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_list",

	props =
	{
		name		= "PlayerProgress_UnlockTooltipWnd_TALENT_SETS",
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
				defName				= "playerProgress_unlockTooltip_items",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_TALENT_SETS.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.PlayerProgress_UnlockTooltip_TalentSetsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},

	children = { "UI.PlayerProgress_UnlockTooltip_TalentSetsListWnd" }
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_TALENT_SETS:CreateControls()

	self.listWnd = UI.PlayerProgress_UnlockTooltip_TalentSetsListWnd

end


--
function UI.PlayerProgress_UnlockTooltipWnd_TALENT_SETS:UpdateItems()

	self.listWnd:Clear()

	local items = UI:CopyTable2( self.data.items )
	table.sort( items )

	for idx = 1, #items do
		local data = { talentSetId = items[ idx ] }
		self.listWnd:AddRecord( data )
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_ITEMS
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_ITEMS = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_ITEMS.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_list",

	props =
	{
		name			= "PlayerProgress_UnlockTooltipWnd_ITEMS",
		activationOrder	= 0,
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
				defName				= "playerProgress_unlockTooltip_items",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_ITEMS.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "list",	
						wnd			= "UI.PlayerProgress_UnlockTooltip_ItemsListWnd",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "hint_1",	
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_ITEMS.layers.PAGE_EFFECT",
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

		-- PAGE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerProgress_unlockTooltip_items_page",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title17",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_ITEMS.layers.PAGE_KEY_TIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title16",
						layer		= "UI.PlayerProgress_UnlockTooltipWnd_ITEMS.layers.PAGE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- PAGE_KEY_TIP
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "playerProgress_unlockTooltip_pageKeyTip" )
		},

		-- PAGE
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},       
	},

	children = { "UI.PlayerProgress_UnlockTooltip_ItemsListWnd" }
}

-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_ITEMS.layers =
{
    MAIN_EFFECT		= 0,
    CAPTION			= 1,
    PAGE_EFFECT		= 2,
    PAGE_KEY_TIP	= 3,
    PAGE			= 4,
}

UI.PlayerProgress_UnlockTooltipWnd_ITEMS.effectInfo =
{
	main =
	{
		pageLocator	= "hint_1",
		listLocator = "list",		
	}
}

-- ------------------------------
-- vars
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_ITEMS.page	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:CreateControls()

	self.listWnd = UI.PlayerProgress_UnlockTooltip_ItemsListWnd

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:Reset()

	UI.PlayerProgress_UnlockTooltipWnd_list.Reset( self )

	self.page = -1

	self:SetLayerVisible( false, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( false, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( false, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:FullUpdate()

	self:UpdateCaption()
	self:SetPage( 1 )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:SetPage( page )

	if self.page == page then
		return
	end

	self.page = page

	self:UpdateItems()
	self:UpdatePageControls()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:UpdateItems()

	self.listWnd:Clear()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_ITEMS:UpdateItems()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	if numItems == 0 then
		return
	end

	local firstitemIdx	= UI:Clamp( ( self.page - 1 ) * self.listWnd.MAX_SLOTS + 1, 1, numItems )
	local lastItemIdx	= UI:Clamp( firstitemIdx + self.listWnd.MAX_SLOTS - 1, 1, numItems )

	for itemIdx = firstitemIdx, lastItemIdx do
		local data = { defName = self.data.items[ itemIdx ] }
		self.listWnd:AddRecord( data )
	end

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:UpdatePageControls()

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	local bPageVisible = numPages > 1 and self.page ~= -1

	self:SetLayerVisible( bPageVisible, self.layers.PAGE_EFFECT )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE_KEY_TIP )
	self:SetLayerVisible( bPageVisible, self.layers.PAGE )

	if not bPageVisible then
		return
	end

	local tSubst =
	{
		cur	= tostring( self.page ),
		max	= tostring( numPages ),
	}

	local str = UI:GetStringByName( "playerProgress_unlockTooltipWnd_page" )
	str = string.gsub( str, "%$(.-)%$", tSubst )

	self:SetText( str, self.layers.PAGE )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:RecalcSelfHeight()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local maxSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.maxHeightLocator ).y
	local minSelfHeight 	= mainEffect:GetObjSize( self.effectInfo.main.minHeightLocator ).y

	local animHeight = self:GetSelfHeight()
	animHeight = UI:Clamp( animHeight, minSelfHeight, maxSelfHeight )

	local animTime = ( animHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
	mainEffect:SetAnimationTime( animTime )
	mainEffect:Update( 0 )

	local selfHeight = animHeight

	if self:IsLayerVisible( self.layers.PAGE_EFFECT ) then

		local pageEffect = UI:GetEffectFromLayer( self, self.layers.PAGE_EFFECT )
		if pageEffect then

			local pagePos		= mainEffect:GetObjPos( self.effectInfo.main.pageLocator )
			local pageSize		= pageEffect:GetObjSize( "self112" )

			selfHeight = pagePos.y + pageSize.y

		end

	end
	
	self:SetHeight( selfHeight )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:F_OnKeyboardKeyDown( key, wndThatReceivedInput )

	if key == UI.Keys.KEY_CONTROL and self:OnControl() then
		return true
	end

	UI.PlayerProgressWnd:F_OnKeyboardKeyDown( key, wndThatReceivedInput )	
	return true

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:OnControl()

	if self.page ~= -1 then
		self:TogglePage()
		return true
	end

	return false

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:TogglePage()

	if self.page == -1 then
		sys.log( "UI.PlayerProgress_UnlockTooltipWnd_ITEMS:TogglePage()[ERROR]: invalid page" )
		return
	end

	local numItems = #self.data.items
	local numPages = math.ceil( numItems / self.listWnd.MAX_SLOTS )

	if numPages < 2 then
		return
	end

	local nextPage = math.fmod( self.page, numPages ) + 1
	self:SetPage( nextPage )

	self:RecalcLayout()

end


--
function UI.PlayerProgress_UnlockTooltipWnd_ITEMS:F_OnAfterShowOnScreen()

	if self.page ~= -1 and self.page ~= 1 then
		self:SetPage( 1 )
		self:RecalcLayout()
	end	

	UI.PlayerProgress_UnlockTooltipWnd_list.F_OnAfterShowOnScreen( self )

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAP_ENABLE
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAP_ENABLE = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAP_ENABLE.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_simple",

	props =
	{
		name		= "PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAP_ENABLE",
	},
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAP_ENABLE:UpdateDesc()

	local str = UI:GetStringByName( "playerProgress_unlockTooltipDesc_OPENWORLD_MAP_ENABLE" )
	self:SetText( str, self.layers.DESC )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_MAP_ENABLE:UpdateIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		local hTex = UI:GetTex( "unlockTooltip_OPENWORLD_MAP_ENABLE" )
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_START_ENABLE
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_START_ENABLE = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_START_ENABLE.def =
{
	className	= "Wnd",
	prototype	= "PlayerProgress_UnlockTooltipWnd_simple",

	props =
	{
		name		= "PlayerProgress_UnlockTooltipWnd_OPENWORLD_START_ENABLE",
	},
}

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_START_ENABLE:UpdateDesc()

	local str = UI:GetStringByName( "playerProgress_unlockTooltipDesc_OPENWORLD_START_ENABLE" )
	self:SetText( str, self.layers.DESC )

end


--
function UI.PlayerProgress_UnlockTooltipWnd_OPENWORLD_START_ENABLE:UpdateIco()

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		local hTex = UI:GetTex( "unlockTooltip_OPENWORLD_START_ENABLE" )
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )
	end

end


-- ---------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_ListWnd
-- ---------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_ListWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltip_ListWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsListWnd",

	props =
	{
		name		= "PlayerProgress_UnlockTooltip_ListWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
		isPrototype	= true,
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltip_ListWnd:RecalcLayout()		

	local mainEffect 			= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local firstSlotWnd			= self:GetButtonForSlot( 1 )	
	local slotEffect			= firstSlotWnd and UI:GetEffectFromLayer( firstSlotWnd, firstSlotWnd.layers.MAIN_EFFECT )

	local selfBaseSize			= mainEffect and mainEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local firstSlotPos			= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 1 ) ) or Vec2( 0, 0 )
	local secondSlotPos			= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, 2 ) ) or Vec2( 0, 0 )
	local lastSlotPos			= mainEffect and mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.slotObjNamePrefix, self.MAX_SLOTS ) ) or Vec2( 0, 0 )
	local slotBaseSize			= slotEffect and slotEffect:GetObjSize( "self" ) or Vec2( 0, 0 )

	local space_slots			= secondSlotPos.y - ( firstSlotPos.y + slotBaseSize.y )
	local space_lastSlot_btm	= selfBaseSize.y - ( lastSlotPos.y + slotBaseSize.y )

	-- позиции слотов

	local firstVisibleRecordIdx, lastVisibleRecordIdx = self:GetVisibleRange()
	local slotY = firstSlotPos.y

	for recordIdx = firstVisibleRecordIdx, lastVisibleRecordIdx do

		local slotWnd = self:GetButtonForRecord( recordIdx )
		if slotWnd then

			slotWnd:SetLeft( firstSlotPos.x )
			slotWnd:SetTop( slotY )

			slotY = slotY + slotWnd:GetHeight() + space_slots

		end

	end

	-- собственный размер

	local selfHeight = firstSlotPos.y + space_lastSlot_btm

	if lastVisibleRecordIdx ~= -1 then
		local lastSlotWnd = self:GetButtonForRecord( lastVisibleRecordIdx )		
		if lastSlotWnd then
			selfHeight = lastSlotWnd:GetTop() + lastSlotWnd:GetHeight() + space_lastSlot_btm
		end
	end

	self:SetWidth( selfBaseSize.x )
	self:SetHeight( selfHeight )

end


-- ------------------------------
-- const
-- ------------------------------

UI.PlayerProgress_UnlockTooltip_ListWnd.effectInfo =
{
	main =
	{
		slotObjNamePrefix	= "slot_3_",
		scrollObjName		= "",
		animIdle			= "idle",		
	},
}

UI.PlayerProgress_UnlockTooltip_ListWnd.MAX_SLOTS = 7
UI.PlayerProgress_UnlockTooltip_ListWnd.listStyle = UI.BaseListWnd.listStyles.HIDE_SCROLL_BAR_IF_NO_NEED + UI.BaseListWnd.listStyles.HIDE_EMPTY_SLOTS + UI.BaseListWnd.listStyles.FIXED_SELECTION


-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PlayerProgress_UnlockTooltip_ListWnd:ShowSlot( slot )

	self:AddChild( slot.btn )

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_MapsListWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_MapsListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PlayerProgress_UnlockTooltip_ListWnd",

		props =
		{
			name		= "PlayerProgress_UnlockTooltip_MapsListWnd",
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
    				defName 			= "playerProgress_unlockTooltip_mapsList",
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
	},

	btnPrototypeName = "PlayerProgress_UnlockTooltip_MapSlotWnd",
}

-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_PvpMapsListWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_PvpMapsListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PlayerProgress_UnlockTooltip_MapsListWnd",

		props =
		{
			name = "PlayerProgress_UnlockTooltip_PvpMapsListWnd",
		},
	}
}   

-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_OpenworldMapsListWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_OpenworldMapsListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PlayerProgress_UnlockTooltip_MapsListWnd",

		props =
		{
			name = "PlayerProgress_UnlockTooltip_OpenworldMapsListWnd",
		},
	}
}   

-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_MapSlotWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_MapSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltip_MapSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "PlayerProgress_UnlockTooltip_MapSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "playerProgress_unlockTooltip_mapSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title9",
						layer		= "UI.PlayerProgress_UnlockTooltip_MapSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ico",
						layer		= "UI.PlayerProgress_UnlockTooltip_MapSlotWnd.layers.ICO_EFFECT",
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

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerProgress_unlockTooltip_mapSlot_ico",
				defaultAnimation	= "idle",	
			}}
		},
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_MapSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	                                       	
end

-- ----------------------------------
-- const
-- ----------------------------------

UI.PlayerProgress_UnlockTooltip_MapSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
	NAME		= 1,
	ICO_EFFECT	= 2,
}

UI.PlayerProgress_UnlockTooltip_MapSlotWnd.effectInfo =
{
	ico =
	{
		icoSpriteName		= "ico",
	},
}

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_MapSlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateName( data )
	self:UpdateIco( data )

end


--
function UI.PlayerProgress_UnlockTooltip_MapSlotWnd:UpdateName( data )

	local str = UI:GetLevelLocalizedName( data.mapName )
	self:SetText( str, self.layers.NAME )

end


--
function UI.PlayerProgress_UnlockTooltip_MapSlotWnd:UpdateIco( data )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then

		local texId = string.format( "map_%s", data.mapName )
		local hTex = UI:GetTex( texId )

		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )

	end

end


--
function UI.PlayerProgress_UnlockTooltip_MapSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PlayerProgress_UnlockTooltip_MapSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.PlayerProgress_UnlockTooltip_MapSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ---------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_PvpGameplaysListWnd
-- ---------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_PvpGameplaysListWnd =
{
	def =
    {
    	className	= "Wnd",
    	prototype	= "PlayerProgress_UnlockTooltip_ListWnd",

    	props =
    	{
    		name		= "PlayerProgress_UnlockTooltip_PvpGameplaysListWnd",
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
    				defName				= "playerProgress_unlockTooltip_gameplaysList",
    				defaultAnimation	= "idle",
    			}}
    		},
    	},
    },

	btnPrototypeName = "PlayerProgress_UnlockTooltip_GameplaySlotWnd",
}


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "PlayerProgress_UnlockTooltip_GameplaySlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "playerProgress_unlockTooltip_gameplaySlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title9",
						layer		= "UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по размеру
					{
						objName		= "description",
						layer		= "UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ico",
						layer		= "UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd.layers.ICO_EFFECT",
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

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "playerProgress_unlockTooltip_gameplaySlot_ico",
				defaultAnimation	= "idle",	
			}}
		},
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	                                       	
end

-- ----------------------------------
-- const
-- ----------------------------------

UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd.layers =
{
    MAIN_EFFECT	= 0,
	NAME		= 1,
	DESC		= 2,
	ICO_EFFECT	= 3,
}

UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd.effectInfo =
{
	main =
	{
		icoLocator		= "ico",
		descLocator		= "description",
		minSizeLocator	= "dist_min",
		maxSizeLocator	= "self",
	},

	ico =
	{
		icoSpriteName	= "ico",
	},
}

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateName( data )
	self:UpdateDesc( data )
	self:UpdateIco( data )

	self:RecalcLayout()

end


--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:UpdateName( data )

	local str = UI:Gameplay2Str( data.gameplay, false )
	self:SetText( str, self.layers.NAME )

end


--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:UpdateDesc( data )

	local str = UI:GetGameplayDesc( data.gameplay, false )
	self:SetText( str, self.layers.DESC )

end


--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:UpdateIco( data )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then

		local hTex = UI:GetGameplayIco( data.gameplay )
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )

	end

end


--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:RecalcLayout()

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local icoEffect			= UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )

	local icoPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.icoLocator ) or Vec2( 0, 0 )
	local icoSize			= icoEffect and icoEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local descPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descBaseSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local maxSelfHeight 	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ).y or 0
	local minSelfHeight 	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ).y or 0
	local infoBaseY1		= math.max( icoPos.y + icoSize.y, descPos.y + descBaseSize.y )
	local space_info_btm	= maxSelfHeight - infoBaseY1
	local formatRect		= UI:Quat( 0, 0, descBaseSize.x, 10000000 )
	
	-- размер описания

    local descHeight = _G.MeasureText(
   		self:GetText( self.layers.DESC ),
   		self:GetFont( self.layers.DESC ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.DESC ),
    	formatRect).w

	self:SetLayerWidth( descBaseSize.x, self.layers.DESC )
	self:SetLayerHeight( descHeight, self.layers.DESC )

	-- собственный размер

	local infoY1 = math.max( icoPos.y + icoSize.y, descPos.y + descHeight )
	local selfHeight = infoY1 + space_info_btm          	

	selfHeight = UI:Clamp( selfHeight, minSelfHeight, maxSelfHeight )
	self:SetHeight( selfHeight )

	if mainEffect then
		local animTime = ( selfHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
		mainEffect:SetAnimationTime( animTime )
	end

end


--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.PlayerProgress_UnlockTooltip_GameplaySlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ---------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_TalentsListWnd
-- ---------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_TalentsListWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "PlayerProgress_UnlockTooltip_ListWnd",

    	props =
    	{
    		name		= "PlayerProgress_UnlockTooltip_TalentsListWnd",
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
    				defName				= "playerProgress_unlockTooltip_talentsList",
    				defaultAnimation	= "idle",
    			}}
    		},
    	},
    },

	btnPrototypeName = "PlayerProgress_UnlockTooltip_TalentSlotWnd",
}


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_TalentSlotWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "PlayerProgress_UnlockTooltip_TalentSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "playerProgress_unlockTooltip_talentSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title9",
						layer		= "UI.PlayerProgress_UnlockTooltip_TalentSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					-- не линкуется по размеру
					{
						objName		= "description",
						layer		= "UI.PlayerProgress_UnlockTooltip_TalentSlotWnd.layers.DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "ico",
						layer		= "UI.PlayerProgress_UnlockTooltip_TalentSlotWnd.layers.ICO_EFFECT",
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

		-- DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "talents_slot",
				defaultAnimation	= "white",	
			}}
		},
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end
	                                       	
end

-- ----------------------------------
-- const
-- ----------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
	NAME		= 1,
	DESC		= 2,
	ICO_EFFECT	= 3,
}

UI.PlayerProgress_UnlockTooltip_TalentSlotWnd.effectInfo =
{
	main =
	{
		icoLocator		= "ico",
		descLocator		= "description",
		minSizeLocator	= "dist_min5",
		maxSizeLocator	= "self",
	},

	ico =
	{
		icoSpriteName	= "ico",
	},
}

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateName( data )
	self:UpdateDesc( data )
	self:UpdateIco( data )

	self:RecalcLayout()

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:UpdateName( data )

	local str = UI:Talent2Str( data.talentId )
	self:SetText( str, self.layers.NAME )

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:UpdateDesc( data )

	local str = UI:GetTalentDesc( data.talentId, UI.TEXT_SEL_COLOR, self:GetColor( self.layers.DESC ) )
	self:SetText( str, self.layers.DESC )

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:UpdateIco( data )

	local icoEffect = UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )
	if icoEffect then

		local hTex = UI:GetTalentIco( data.talentId )
		icoEffect:SetSpriteTexture( self.effectInfo.ico.icoSpriteName, hTex )

	end

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:RecalcLayout()

	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local icoEffect			= UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )

	local icoPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.icoLocator ) or Vec2( 0, 0 )
	local icoSize			= icoEffect and icoEffect:GetObjSize( "self" ) or Vec2( 0, 0 )
	local descPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local descBaseSize		= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.descLocator ) or Vec2( 0, 0 )
	local maxSelfHeight 	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizeLocator ).y or 0
	local minSelfHeight 	= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizeLocator ).y or 0
	local infoBaseY1		= math.max( icoPos.y + icoSize.y, descPos.y + descBaseSize.y )
	local space_info_btm	= maxSelfHeight - infoBaseY1

	local formatRect		= UI:Quat( 0, 0, descBaseSize.x, 10000000 )
	
	-- размер описания

    local descHeight = _G.MeasureText(
   		self:GetText( self.layers.DESC ),
   		self:GetFont( self.layers.DESC ),
    	formatRect,
   		self:GetTextFormatFlags( self.layers.DESC ),
    	formatRect).w

	self:SetLayerWidth( descBaseSize.x, self.layers.DESC )
	self:SetLayerHeight( descHeight, self.layers.DESC )

	-- собственный размер

	local infoY1 = math.max( icoPos.y + icoSize.y, descPos.y + descHeight )
	local selfHeight = infoY1 + space_info_btm

	selfHeight = UI:Clamp( selfHeight, minSelfHeight, maxSelfHeight )
	self:SetHeight( selfHeight )

	if mainEffect then
		local animTime = ( selfHeight - minSelfHeight ) / ( maxSelfHeight - minSelfHeight )
		mainEffect:SetAnimationTime( animTime )
	end

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.PlayerProgress_UnlockTooltip_TalentSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_TalentSetsListWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSetsListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PlayerProgress_UnlockTooltip_ListWnd",

		props =
		{
			name		= "PlayerProgress_UnlockTooltip_TalentSetsListWnd",
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
    				defName 			= "playerProgress_unlockTooltip_itemsList",
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
	},

	btnPrototypeName	= "PlayerProgress_UnlockTooltip_TalentSetSlotWnd",
	MAX_SLOTS			= 8,
}


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "PlayerProgress_UnlockTooltip_TalentSetSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "playerProgress_unlockTooltip_itemSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title9",
						layer		= "UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )
	self.itemIcoWnd:Reset()
	                                       	
end

-- ----------------------------------
-- const
-- ----------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
	NAME		= 1,
}

UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd.effectInfo =
{
	main =
	{
		icoLocator		= "ico",
	},
}

-- ----------------------------------
-- vars
-- ----------------------------------

UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd.itemIcoWnd	= nil

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:CreateControls()

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.itemIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.itemIcoWnd, mainEffect, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateName( data )
	self:UpdateIco( data )

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:UpdateName( data )

	local str = UI:TalentSet2Str( data.talentSetId )
	self:SetText( str, self.layers.NAME )

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:UpdateIco( data )

	local hTex = UI:GetMailAttachmentTalentSetIco( data.talentSetId )
	self.itemIcoWnd:SetupIco( hTex )

end


--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.PlayerProgress_UnlockTooltip_TalentSetSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_ItemsListWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_ItemsListWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "PlayerProgress_UnlockTooltip_ListWnd",

		props =
		{
			name		= "PlayerProgress_UnlockTooltip_ItemsListWnd",
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
    				defName 			= "playerProgress_unlockTooltip_itemsList",
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
	},

	btnPrototypeName	= "PlayerProgress_UnlockTooltip_ItemSlotWnd",
	MAX_SLOTS			= 8,
}


-- ------------------------------------------------------------------------
-- UI.PlayerProgress_UnlockTooltip_ItemSlotWnd
-- ------------------------------------------------------------------------

UI.PlayerProgress_UnlockTooltip_ItemSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.PlayerProgress_UnlockTooltip_ItemSlotWnd.def =
{
	className	= "Wnd",
	prototype	= "ButtonsList_Btn",

	props =
	{
		name		= "PlayerProgress_UnlockTooltip_ItemSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "playerProgress_unlockTooltip_itemSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title9",
						layer		= "UI.PlayerProgress_UnlockTooltip_ItemSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
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
	}
}

-- ----------------------------------
-- interface functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:Reset()

	UI.ButtonsList_Btn.Reset( self )

	self:SetText( "", self.layers.NAME )
	self.itemIcoWnd:Reset()
	                                       	
end

-- ----------------------------------
-- const
-- ----------------------------------

UI.PlayerProgress_UnlockTooltip_ItemSlotWnd.layers =
{
    MAIN_EFFECT	= 0,
	NAME		= 1,
}

UI.PlayerProgress_UnlockTooltip_ItemSlotWnd.effectInfo =
{
	main =
	{
		icoLocator		= "ico",
	},
}

-- ----------------------------------
-- vars
-- ----------------------------------

UI.PlayerProgress_UnlockTooltip_ItemSlotWnd.itemIcoWnd	= nil

-- ----------------------------------
-- work functions
-- ----------------------------------

--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:F_PostLoad()

	UI.ButtonsList_Btn.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self:CreateControls()

end


--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:CreateControls()

	self.itemIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )
	self.itemIcoWnd:AddStyle( UI.WS_NOT_MOUSE_REACT )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	UI:AddChildAndLink( self, self.itemIcoWnd, mainEffect, self.effectInfo.main.icoLocator, UI.EffectAnimParams.POS )

end


--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:UpdateForData( data )

	self:Reset()

	self:UpdateName( data )
	self:UpdateIco( data )

end


--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:UpdateName( data )

	local str = UI:GetEntityLocalizedNameByDef( data.defName, true, false, true, true )
	self:SetText( str, self.layers.NAME )

end


--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:UpdateIco( data )

	self.itemIcoWnd:SetupForItem( data.defName )

end


--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end     


--
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.PlayerProgress_UnlockTooltip_ItemSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end


-- ----------------------------------------------------------------------------------------
-- UI.PlayerProgress_FbBtn
-- ----------------------------------------------------------------------------------------

UI.PlayerProgress_FbBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "FacebookBtn1",

		props =
		{
			name	= "PlayerProgress_FbBtn"
		}
	},
}

-- ----------------------------------------------------------------------------------------
-- UI.PlayerProgress_VkBtn
-- ----------------------------------------------------------------------------------------

UI.PlayerProgress_VkBtn =
{
	def =
	{
		className	= "ButtonWnd",
		prototype	= "VKontakteBtn1",

		props =
		{
			name	= "PlayerProgress_VkBtn"
		}
	},
}

-- ----------------------------------------------------------------------------------------
-- UI.PlayerProgress_SocialNetWaitingWnd
-- ----------------------------------------------------------------------------------------

UI.PlayerProgress_SocialNetWaitingWnd =
{
	def =
	{
		className	= "Wnd",
		prototype	= "SocialNetWaitingWnd",

		props =
		{
			name	= "PlayerProgress_SocialNetWaitingWnd"
		}
	},

	mainWndName = "PlayerProgressWnd"
}