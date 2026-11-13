-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfopvemissionwnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoPveMissionWnd = {}
local fi = UI.HudForcesInfoPveMissionWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoPveMissionWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoPveMissionWnd",
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
				defName 			= "hud_forcesInfoPveMission_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoPveMissionWnd.layers.RESULT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},   

		-- RESULT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoPveMissionWnd:OnVitalPointTemporaryDisabledTrigger( vpEntityId, bDisabled ) 

	if not self:IsOnScreen() then
		return
	end

	self:UpdateVpSlots()	
	self:RecalcLayout()

end


--
function UI.HudForcesInfoPveMissionWnd:OnVpHpAlwaysOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	for slotIdx, slotWnd in ipairs( self.curVpSlots ) do
		slotWnd:OnVpHpAlwaysOptionChanged()
	end

end


-- ------------------------------
-- const
-- ------------------------------

fi.layers =
{
    MAIN_EFFECT		= 0,
	RESULT			= 1,
}

fi.effectInfo =
{
	main =
	{
		vpLocatorPrefix			= "slot_",
	},
}

fi.MAX_VP = 3

fi.strWaveLabel					= UI:GetStringByName( "hud_forcesInfo_sectorDefence_wave" )
fi.strEnemiesLabel				= UI:GetStringByName( "hud_forcesInfo_sectorDefence_enemies" )
fi.strSabotagrTargetsLabel		= UI:GetStringByName( "hud_forcesInfo_sabotageTargets" )
fi.strVpCpturedLabel			= UI:GetStringByName( "hud_forcesInfo_vitalPoints" )
fi.strTransportDestroyedLabel	= UI:GetStringByName( "hud_forcesInfo_transport_destroyed" )
fi.strTransportArrivedLabel		= UI:GetStringByName( "hud_forcesInfo_transport_arrived" )
fi.strTransportLeftLabel		= UI:GetStringByName( "hud_forcesInfo_transport_left" )
fi.strBoss						= UI:GetStringByName( "hud_forcesInfo_killBoss" )
fi.strLastStandLabel			= UI:GetStringByName( "hud_forcesInfo_lastStand" )

-- ------------------------------
-- vars
-- ------------------------------

fi.allVpSlots	= {}
fi.curVpSlots	= {}
fi.missionName	= ""
fi.roundType	= ""
fi.hudMode		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoPveMissionWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateVpSlots()

end


--
function UI.HudForcesInfoPveMissionWnd:CreateVpSlots()

	for slotIdx = 1, self.MAX_VP do

		local slotWnd = UI:CreateChildWnd( self, UI.HudForcesInfoPveMission_VpSlotWnd, tostring( slotIdx ) )
		table.insert( self.allVpSlots, slotWnd )

	end

end


--
function UI.HudForcesInfoPveMissionWnd:Reset()

	self:SetLayerVisible( false, self.layers.RESULT )
	self:ResetVpSlots()
	self.missionName = ""
	self.roundType = ""
	self.hudMode = -1

end


--
function UI.HudForcesInfoPveMissionWnd:ResetVpSlots()

	for slotIdx, slotWnd in ipairs( self.curVpSlots ) do

    	slotWnd:Reset()

    	slotWnd:UnlinkFromParent()	

    	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    	if mainEffect then
    		mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
    	end

	end

	self.curVpSlots = {}

end


--
function UI.HudForcesInfoPveMissionWnd:FullUpdate()

	local prevRoundType	= self.roundType
	local prevHudMode	= self.hudMode

	self.missionName	= self:GetMissionName()
	self.roundType		= self:GetRoundType()
	self.hudMode		= UI.HudWnd:GetMode()

	self:UpdateVpSlots( prevRoundType, prevHudMode )
	self:UpdateResult( prevRoundType, prevHudMode )

end


--
function UI.HudForcesInfoPveMissionWnd:GetMissionName()

	return _G.CL_PveGetMissionName()

end


--
function UI.HudForcesInfoPveMissionWnd:GetRoundType()

	local curRound, maxRounds = _G.CL_PveGetMissionRound()

	local missionDef = _G.PvE_Missions and _G.PvE_Missions[ self.missionName ]
	local roundDef = missionDef and missionDef.rounds and missionDef.rounds[ curRound + 1 ]

	return roundDef and roundDef.type or ""	

end


--
function UI.HudForcesInfoPveMissionWnd:UpdateVpSlots( prevRoundType, prevHudMode )

	if prevRoundType == self.roundType then
		return
	end

	self:ResetVpSlots()

	if self.roundType == "SURVIVE" then
		return
	end

	local myRelationsipGroup = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if myRelationsipGroup == 0 then
		myRelationsipGroup = 1
	end

	local vps = _G.GetAllVitalPoints()
	local numVisibleVps = 0

	for idx = 1, #vps do

		local vpEntId = vps[ idx ]
		local vpEnt = _G.Entities[ vpEntId ]

		if vpEnt then

			if not vpEnt:TemporaryDisabledInHUD() then

				if numVisibleVps < self.MAX_VP then

            		local vpRelationsipGroup	= vpEnt:GetRelationshipGroup()
            		local relationship			= ai.Relationship:GetRelationship( vpRelationsipGroup, myRelationsipGroup )

            		self:AddSlotForVitalPoint( vpEntId, relationship )
    				numVisibleVps = numVisibleVps + 1

				else
					sys.log( "UI.HudForcesInfoPveMissionWnd:UpdateVpSlots()[ERROR]: cannot show one more vital point; can show only %d", self.MAX_VP )
				end

			end

		else
			sys.log( "UI.HudForcesInfoPveMissionWnd:UpdateVpSlots()[ERROR]: cannot find vital point with id %d", vpEntId )
		end

	end

	self:RecalcLayout()

end


--
function UI.HudForcesInfoPveMissionWnd:AddSlotForVitalPoint( vpEntId, relationship )

	local slotWnd = self:GetFreeVpSlot()
	if not slotWnd then
		sys.log( "UI.HudForcesInfoPveMissionWnd:AddSlotForVitalPoint()[ERROR]: no free vp slot" )
		return
	end

	self:AddChild( slotWnd )
	slotWnd:Setup( vpEntId, relationship )

	table.insert( self.curVpSlots, slotWnd )

end


--
function UI.HudForcesInfoPveMissionWnd:GetFreeVpSlot()	

	for idx, slotWnd in ipairs( self.allVpSlots ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return nil

end


--
function UI.HudForcesInfoPveMissionWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	if not self.curVpSlots[ 1 ] then
		return
	end

	local firstSlotLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.vpLocatorPrefix, 1 ) )
	local secondSlotLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.vpLocatorPrefix, 2 ) )
	local lastSlotLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.vpLocatorPrefix, self.MAX_VP ) )
	local slotWidth				= self.curVpSlots[ 1 ]:GetWidth()
	local space					= secondSlotLocatorPos.x - firstSlotLocatorPos.x - slotWidth
	local slotsMaxWidth			= lastSlotLocatorPos.x + slotWidth - firstSlotLocatorPos.x
	local numSlots				= #self.curVpSlots
	local slotsWidth			= numSlots * slotWidth + ( numSlots - 1 ) * space
	local firstSlotX			= firstSlotLocatorPos.x + ( slotsMaxWidth - slotsWidth ) / 2

	for slotIdx, slotWnd in ipairs( self.curVpSlots ) do		

		local slotX = firstSlotX + ( slotIdx - 1 ) * ( slotWidth + space )

		slotWnd:SetLeft( slotX )
		slotWnd:SetTop( firstSlotLocatorPos.y )

	end

end


--
function UI.HudForcesInfoPveMissionWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()

end


--
function UI.HudForcesInfoPveMissionWnd:UpdateResult( prevRoundType, prevHudMode )

	local bVisible = self.hudMode ~= UI.HudWnd.modes.SELECT_SHIP

	if not bVisible then
		self:SetLayerVisible( false, self.layers.RESULT )
		return
	end

	self:SetLayerVisible( true, self.layers.RESULT )
	local strResult = ""

	if self.roundType == "SECTOR_DEFENCE" then

    	local curWaveIdx, wavesMax = _G.CL_PveGetMissionWave()
    	local enemiesLeft, enemiesMax = _G.CL_PveGetWaveInvaders()

    	curWaveIdx = curWaveIdx + 1
    	local enemiesKilled = enemiesMax - enemiesLeft

		local bIsBoss = _G.CL_PveHasBossInRound() 
		local strBoss = bIsBoss and self.strBoss or ""

    	strResult = string.format( "%s%s%s %d/%d (%s %d/%d)", strBoss, strBoss ~= "" and " " or "", self.strWaveLabel, curWaveIdx, wavesMax, self.strEnemiesLabel, enemiesKilled, enemiesMax )


	elseif self.roundType == "SURVIVE" then

    	local curWaveIdx, wavesMax = _G.CL_PveGetMissionWave()
    	local enemiesLeft, enemiesMax = _G.CL_PveGetWaveInvaders()

    	curWaveIdx = curWaveIdx + 1
    	local enemiesKilled = enemiesMax - enemiesLeft

		local bIsBoss = _G.CL_PveHasBossInRound() 
		local strBoss = bIsBoss and self.strBoss or ""

    	strResult = string.format( "%s%s%s %d/%d (%s %d/%d)", strBoss, strBoss ~= "" and " " or "", self.strWaveLabel, curWaveIdx, wavesMax, self.strEnemiesLabel, enemiesKilled, enemiesMax )


	elseif self.roundType == "SECTOR_CAPTURE" then

    	local myRelationsipGroup = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
		if myRelationsipGroup == 0 then
			myRelationsipGroup = 1
		end

    	local vps = _G.GetAllVitalPoints()

    	local vpsMax = 0
		local vpsKilled = 0

    	for idx, vpEntId in ipairs( vps ) do

    		local vpEnt = _G.Entities[ vpEntId ]
    		if vpEnt then

        		local vpRelationsipGroup	= vpEnt:GetRelationshipGroup()
        		local relationship			= ai.Relationship:GetRelationship( vpRelationsipGroup, myRelationsipGroup )

				if relationship == ai.RelatioshipType.ENEMY then
					vpsMax = vpsMax + 1

					if vpEnt:IsDead() then
						vpsKilled = vpsKilled + 1
					end
				end

			end

		end

    	strResult = string.format( "%s %d/%d", self.strVpCpturedLabel, vpsKilled, vpsMax )


	elseif self.roundType == "SABOTAGE" then

    	local targetsLeft, targetsMax = _G.CL_PveGetSabotageTargetsNum()
    	local targetsKilled = targetsMax - targetsLeft

    	strResult = string.format( "%s %d/%d", self.strSabotagrTargetsLabel, targetsKilled, targetsMax )


	elseif self.roundType == "TRANSPORT_ATTACK" then

		local total, dead, arrived, left = _G.CL_PveGetTransportNum()

		if total > 1 then
			strResult = string.format( "%s: %d/%d. %s: %d", self.strTransportDestroyedLabel, dead, total, self.strTransportLeftLabel, left  )
		else
			strResult = string.format( "%s: %d/%d", self.strTransportDestroyedLabel, dead, total )
		end

	elseif self.roundType == "TRANSPORT_DEFENCE" then

		local total, dead, arrived, left = _G.CL_PveGetTransportNum()

		if total > 1 then
			strResult = string.format( "%s: %d/%d. %s: %d", self.strTransportArrivedLabel, arrived, total, self.strTransportLeftLabel, left  )
		else
			strResult = string.format( "%s: %d/%d", self.strTransportArrivedLabel, arrived, total  )
		end

	elseif self.roundType == "LAST_STAND" then

		local remainTime, totalTime = _G.CL_PveGetSuccessTimer()
		strResult = string.format( "%s: %s", self.strLastStandLabel, UI:Time2Str31( remainTime ) )

	end

	self:SetText( strResult, self.layers.RESULT )

end


--
function UI.HudForcesInfoPveMissionWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Reset()

end


-- --------------------------------------------------------------
-- UI.HudForcesInfoPveMission_VpSlotWnd
-- --------------------------------------------------------------

UI.HudForcesInfoPveMission_VpSlotWnd =
{
	def =
    {
    	className	= "Wnd",
    	prototype	= "HudForcesInfo_VpSlotWnd",

    	props =
    	{
    		name		= "HudForcesInfoPveMission_VpSlotWnd",
    		isPrototype	= true,
    	},
    }
}