-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoWnd = {}
local fi = UI.HudForcesInfoWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoWnd",
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
				defName 			= "hud_forcesInfo_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoWnd.layers.FRIEND_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy",
						layer		= "UI.HudForcesInfoWnd.layers.ENEMY_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "friend_vol",
						layer		= "UI.HudForcesInfoWnd.layers.FRIEND_KILLS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_vol",
						layer		= "UI.HudForcesInfoWnd.layers.ENEMY_KILLS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "indicator_1",
						layer		= "UI.HudForcesInfoWnd.layers.KILLS_COMPARISON_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "indicator_2",
						layer		= "UI.HudForcesInfoWnd.layers.VP_COMPARISON_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},   

		-- FRIEND_LABEL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			text			= "^hud_forces_friends",
		}, 

		-- ENEMY_LABEL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },

			text			= "^hud_forces_enemies",
		}, 

		-- FRIEND_KILLS 
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- ENEMY_KILLS
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- KILLS_COMPARISON_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 	= "hud_forcesInfo_comparison",
			}}
		},

		-- VP_COMPARISON_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 	= "hud_forcesInfo_comparison",
			}}
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoWnd:OnVpHpAlwaysOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	for relationship, slotsForRelationship in pairs( self.curVpSlots ) do
    	for slotIdx, slotWnd in ipairs( slotsForRelationship ) do
			slotWnd:OnVpHpAlwaysOptionChanged()
		end
	end

end


-- ------------------------------
-- const
-- ------------------------------

fi.layers =
{
    MAIN_EFFECT				= 0,
    FRIEND_LABEL			= 1,
    ENEMY_LABEL				= 2,
    FRIEND_KILLS			= 3,
    ENEMY_KILLS				= 4,
    KILLS_COMPARISON_EFFECT	= 5,
    VP_COMPARISON_EFFECT	= 6,
}

fi.effectInfo =
{
	main =
	{
		vpLocatorPrefix_friend		= "slot_",
		vpLocatorPrefix_enemy		= "slot_",
		firstVpLocatorIdx_friend	= 1,
		firstVpLocatorIdx_enemy		= 4,
	},

	comparison =
	{
		animFriendWin	= "more",
		animEnemyWin	= "less",
		animEqual		= "equally",
	}
}

fi.MAX_VP_PER_RELATIONSHIP = 3

-- ------------------------------
-- vars
-- ------------------------------

fi.allVpSlots					= {}
fi.curVpSlots					= {}
fi.myTeam						= 1
fi.comparisonAnimId_friendWin	= -1
fi.comparisonAnimId_enemyWin	= -1
fi.comparisonAnimId_equal		= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateVpSlots()

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.KILLS_COMPARISON_EFFECT )
	if comparisonEffect then

		self.comparisonAnimId_friendWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin )
		self.comparisonAnimId_enemyWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin )
		self.comparisonAnimId_equal		= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEqual )	

	end

end


--
function UI.HudForcesInfoWnd:CreateVpSlots()

	for slotIdx = 1, self.MAX_VP_PER_RELATIONSHIP * 2 do

		local slotWnd = UI:CreateChildWnd( self, UI.HudForcesInfo_VpSlotWnd, tostring( slotIdx ) )
		table.insert( self.allVpSlots, slotWnd )

	end

end


--
function UI.HudForcesInfoWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_KILLS )
	self:SetText( "0", self.layers.ENEMY_KILLS )

	local scoreComparisonEffect = UI:GetEffectFromLayer( self, self.layers.KILLS_COMPARISON_EFFECT )
	if scoreComparisonEffect then
		scoreComparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	local vpComparisonEffect = UI:GetEffectFromLayer( self, self.layers.VP_COMPARISON_EFFECT )
	if vpComparisonEffect then
		vpComparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	self:ResetVpSlots()

	self.myTeam = 1

end


--
function UI.HudForcesInfoWnd:ResetVpSlots()

	for relationship, slotsForRelationship in pairs( self.curVpSlots ) do
    	for slotIdx, slotWnd in ipairs( slotsForRelationship ) do

        	slotWnd:Reset()

        	slotWnd:UnlinkFromParent()	

        	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
        	if mainEffect then
        		mainEffect:UnlinkWnd( slotWnd:GetUiHandle(), "" )
        	end

        	slotsForRelationship[ slotIdx ] = nil

    	end
	end

end


--
function UI.HudForcesInfoWnd:FullUpdate()

	self:Reset()

	local vps = _G.GetAllVitalPoints()

	local vpsSortedByRelationship = {}
	local myRelationsipGroup = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if myRelationsipGroup == 0 then
		myRelationsipGroup = 1
	end

	for idx, vpEntId in ipairs( vps ) do

		local vpEnt = _G.Entities[ vpEntId ]

		if vpEnt then

    		local vpRelationsipGroup	= vpEnt:GetRelationshipGroup()
    		local relationship			= ai.Relationship:GetRelationship( vpRelationsipGroup, myRelationsipGroup )

    		local vpsForRelationship = vpsSortedByRelationship[ relationship ]
    		if not vpsForRelationship then
    			vpsForRelationship = {}
    			vpsSortedByRelationship[ relationship ] = vpsForRelationship
    		end

    		table.insert( vpsForRelationship, vpEntId )

		else
			sys.log( "UI.HudForcesInfoWnd:FullUpdate()[ERROR]: cannot find entity with id %d", vpEntId )
		end

	end

	for relationship, vpsForRelationship in pairs( vpsSortedByRelationship ) do

		local numVpsForRelationship = #vpsForRelationship

		for idx = 1, numVpsForRelationship do
			self:AddSlotForVitalPoint( vpsForRelationship[ idx ], relationship, numVpsForRelationship )
		end

	end

	self.myTeam = myRelationsipGroup

end


--
function UI.HudForcesInfoWnd:AddSlotForVitalPoint( vpEntId, relationship, numVpsForRelationship )

	if relationship ~= ai.RelatioshipType.FRIEND and relationship ~= ai.RelatioshipType.ENEMY then
		sys.log( "UI.HudForcesInfoWnd:AddSlotForVitalPoint()[ERROR]: unsupported relationship: %s", UI:Val2Key( ai.RelatioshipType, relationship ) )
		return
	end

	local slots = self.curVpSlots[ relationship ]
	if not slots then
		slots = {}
		self.curVpSlots[ relationship ] = slots
	end

	local slotIdx = #slots + 1
	if slotIdx > self.MAX_VP_PER_RELATIONSHIP then
		sys.log( "UI.HudForcesInfoWnd:AddSlotForVitalPoint()[ERROR]: max number of slots for relationship %s is reached", UI:Val2Key( ai.RelatioshipType, relationship ) )
		return
	end

	local slotWnd = self:GetFreeVpSlot()
	if not slotWnd then
		sys.log( "UI.HudForcesInfoWnd:AddSlotForVitalPoint()[ERROR]: no free vp slot" )
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local locatorName = self:GetLocatorForVpSlot( relationship, slotIdx, numVpsForRelationship )
	UI:AddChildAndLink( self, slotWnd, mainEffect, locatorName, UI.EffectAnimParams.POS )

	slotWnd:Setup( vpEntId, relationship )

	table.insert( slots, slotWnd )

end


--
function UI.HudForcesInfoWnd:GetFreeVpSlot()	

	for idx, slotWnd in ipairs( self.allVpSlots ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return nil

end


--
function UI.HudForcesInfoWnd:GetLocatorForVpSlot( relationship, slotIdx, numVpsForRelationship )

	local locatorPrefix	= ""
	local locatorIdx	= -1	

	if relationship == ai.RelatioshipType.FRIEND then

		locatorPrefix = self.effectInfo.main.vpLocatorPrefix_friend

		-- слоты выравниваются по правому краю (индексы локаторов слева направо)
		local firstLocatorIdx = ( self.effectInfo.main.firstVpLocatorIdx_friend + self.MAX_VP_PER_RELATIONSHIP - 1 ) - numVpsForRelationship + 1
		locatorIdx = firstLocatorIdx + slotIdx - 1

	elseif relationship == ai.RelatioshipType.ENEMY then

		locatorPrefix = self.effectInfo.main.vpLocatorPrefix_enemy

		-- слоты выравниваются по левому краю (индексы локаторов слева направо)
		local firstLocatorIdx = self.effectInfo.main.firstVpLocatorIdx_enemy
		locatorIdx = firstLocatorIdx + slotIdx - 1

	else
		sys.log( "UI.HudForcesInfoWnd:GetLocatorForVpSlot()[ERROR]: unhandled relationship: %s", tostring( relationship ) )
	end

	return string.format( "%s%d", locatorPrefix, locatorIdx )

end


--
function UI.HudForcesInfoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScore()

end


--
function UI.HudForcesInfoWnd:UpdateScore()

	local numKills1, numKills2 = _G.CL_GetTeamTotalKills()

	local numKills_friend	= self.myTeam == 1 and numKills1 or numKills2
	local numKills_enemy	= self.myTeam == 1 and numKills2 or numKills1


	-- текстовое значение количества убийств

	self:SetText( tostring( numKills_friend ), self.layers.FRIEND_KILLS )
	self:SetText( tostring( numKills_enemy ), self.layers.ENEMY_KILLS )


	-- знак сравнения количества баз

	local vpComparisonEffect = UI:GetEffectFromLayer( self, self.layers.VP_COMPARISON_EFFECT )
	if not vpComparisonEffect then
		return
	end

	local numVps_friend	= self:GetNumVitalPointsByRelationship( ai.RelatioshipType.FRIEND )
	local numVps_enemy	= self:GetNumVitalPointsByRelationship( ai.RelatioshipType.ENEMY )

	local animId = -1

	if numVps_friend > numVps_enemy then
		animId = self.comparisonAnimId_friendWin
	elseif numVps_friend < numVps_enemy then
		animId = self.comparisonAnimId_enemyWin
	else
		animId = self.comparisonAnimId_equal
	end

	if vpComparisonEffect:GetCurAnimationId() ~= animId then
		vpComparisonEffect:StartAnimationById( animId )
	end


	-- знак сравнения количества убийств (показывается только если количество баз равно)

	if numVps_friend == numVps_enemy then

		self:SetLayerVisible( true, self.layers.KILLS_COMPARISON_EFFECT )

    	local scoreComparisonEffect = UI:GetEffectFromLayer( self, self.layers.KILLS_COMPARISON_EFFECT )
    	if scoreComparisonEffect then

    		local animId = -1

    		if numKills_friend > numKills_enemy then
    			animId = self.comparisonAnimId_friendWin
    		elseif numKills_friend < numKills_enemy then
    			animId = self.comparisonAnimId_enemyWin
    		else
    			animId = self.comparisonAnimId_equal
    		end

    		if scoreComparisonEffect:GetCurAnimationId() ~= animId then
    			scoreComparisonEffect:StartAnimationById( animId )
    		end

    	end

	else

		self:SetLayerVisible( false, self.layers.KILLS_COMPARISON_EFFECT )

	end

end


--
function UI.HudForcesInfoWnd:GetNumVitalPointsByRelationship( relationship )

	local slotsForRelationship = self.curVpSlots[ relationship ]
	if not slotsForRelationship then
		return 0
	end

	local numVps = 0

	for slotIdx, slotWnd in ipairs( slotsForRelationship ) do
		local vpEnt = _G.Entities[ slotWnd:GetVpEntId() ]
		if self:IsVpLive( vpEnt ) then
			numVps = numVps + 1
		end
	end

	return numVps

end


--
function UI.HudForcesInfoWnd:IsVpLive( vpEnt )
	
	return vpEnt and not vpEnt:IsDead()

end


--
function UI.HudForcesInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- --------------------------------------------------------------
-- UI.HudForcesInfo_VpSlotWnd
-- --------------------------------------------------------------

UI.HudForcesInfo_VpSlotWnd = {}
local fis = UI.HudForcesInfo_VpSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfo_VpSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfo_VpSlotWnd",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_forcesInfo_vpSlot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value_1",
						layer		= "UI.HudForcesInfo_VpSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "progr",
						layer		= "UI.HudForcesInfo_VpSlotWnd.layers.HP_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "value_2",
						layer		= "UI.HudForcesInfo_VpSlotWnd.layers.HP_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "dron_count",
						layer		= "UI.HudForcesInfo_VpSlotWnd.layers.TURRETS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- NAME
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- HP_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfo_vpSlot_hpPb",
			}}
		},

		-- HP_VAL
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- TURRETS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_forcesInfo_vpSlot_turrets",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.HudForcesInfo_VpSlotWnd.layers.NUM_TURRETS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- NUM_TURRETS
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
function UI.HudForcesInfo_VpSlotWnd:Setup( entId, relationship )

	self:Reset()

	self.entId			= entId
	self.relationship	= relationship

	local ent = _G.Entities[ self.entId ]
	self.bLive = UI.HudForcesInfoWnd:IsVpLive( ent )

	self:UpdateMainAnimation()
	self:UpdateName( ent )

	if self.bLive then
		self:SetLayerVisible( true, self.layers.HP_PB_EFFECT )
	end

end


--
function UI.HudForcesInfo_VpSlotWnd:Reset()

	self:SetText( "", self.layers.NAME )
	self:SetLayerVisible( false, self.layers.HP_PB_EFFECT )
	self:SetLayerVisible( false, self.layers.HP_VAL )
	self:SetLayerVisible( false, self.layers.TURRETS_EFFECT )
	self:SetLayerVisible( false, self.layers.NUM_TURRETS )

	self.entId			= -1
	self.relationship	= -1

	self.bLive			= false
	self.prevNumTurrets	= -1

end


--
function UI.HudForcesInfo_VpSlotWnd:GetVpEntId()

	return self.entId

end


--
function UI.HudForcesInfo_VpSlotWnd:OnVpHpAlwaysOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateVpHpAlways()

	self.prevNumTurrets = -1	-- для форсированного апдейта здоровья и дронов

end          


-- ------------------------------
-- const
-- ------------------------------

fis.layers =
{
    MAIN_EFFECT			= 0,
    NAME				= 1,
    HP_PB_EFFECT		= 2,
    HP_VAL				= 3,
    TURRETS_EFFECT		= 4,
    NUM_TURRETS			= 5,
}

fis.effectInfo =
{
	main =
	{
		animFriend	= "freind",
		animEnemy	= "enemy",
	},

	hpPb =
	{
		animHasTurrets	= "idle_1",
		animNoTurrets	= "idle_2",
	}
}

-- ------------------------------
-- vars
-- ------------------------------

fis.entId						= -1
fis.relationship				= -1
fis.hpPbAnimId_hasTurrets		= -1
fis.hpPbAnimId_noTurrets		= -1
fis.bLive						= false
fis.prevNumTurrets				= -1
fis.bVpHpAlways					= UI.hudOptionsDefaultVals.vpHpAlways

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfo_VpSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local hpPbEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_EFFECT )
	if hpPbEffect then

		self.hpPbAnimId_hasTurrets	= hpPbEffect:GetAnimationId( self.effectInfo.hpPb.animHasTurrets )
		self.hpPbAnimId_noTurrets	= hpPbEffect:GetAnimationId( self.effectInfo.hpPb.animNoTurrets )

	end

end


--
function UI.HudForcesInfo_VpSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if not self.bLive then
		return
	end

	local ent = _G.Entities[ self.entId ]
	self.bLive = UI.HudForcesInfoWnd:IsVpLive( ent )

	if self.bLive then

		local numTurrets = ent:GetNumAliveTurrets()

		self:UpdateHp( ent, numTurrets )
		self:UpdateTurrets( ent, numTurrets )

		self.prevNumTurrets = numTurrets
		
	else

		self:UpdateNotLive()

	end

end


--
function UI.HudForcesInfo_VpSlotWnd:UpdateMainAnimation()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local anim = ""

	if self.relationship == ai.RelatioshipType.FRIEND then
		anim = self.effectInfo.main.animFriend

	elseif self.relationship == ai.RelatioshipType.ENEMY then
		anim = self.effectInfo.main.animEnemy

	else
		sys.log( "UI.HudForcesInfo_VpSlotWnd:UpdateMainAnimation()[ERROR]: unsupported relationship: %s", tostring( self.relationship ) )
	end

	mainEffect:StartAnimation( anim )	

end


--
function UI.HudForcesInfo_VpSlotWnd:UpdateName( ent )

	local name = UI:GetEntityLocalizedName( ent, false )
	self:SetText( name, self.layers.NAME )	

end


--
function UI.HudForcesInfo_VpSlotWnd:UpdateHp( ent, numTurrets )

	local bForceUpdate = self.prevNumTurrets == -1

	if numTurrets > 0 then

		if bForceUpdate or not( self.prevNumTurrets > 0 ) then

    		self:SetLayerVisible( false, self.layers.HP_VAL )

    		local animId = self.hpPbAnimId_hasTurrets

			local hpPbEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_EFFECT )
    		if hpPbEffect then

    			hpPbEffect:StartAnimationById( animId )
    			self:GetLayer( UI.LAYER_EFFECT, self.layers.HP_PB_EFFECT, 0 ):SetUpdatable( true )

    		end

		end

	else

		local hpPbEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_EFFECT )

		if bForceUpdate or self.prevNumTurrets > 0 then

			self:SetLayerVisible( self.bVpHpAlways, self.layers.HP_VAL )

        	local animId = self.hpPbAnimId_noTurrets

        	if hpPbEffect then

        		hpPbEffect:StartAnimationById( animId )
        		self:GetLayer( UI.LAYER_EFFECT, self.layers.HP_PB_EFFECT, 0 ):SetUpdatable( false )

        	end

		end

    	local hp	= ent:GetHealth()
    	local maxHp	= ent:GetMaxHealth()

    	local val = maxHp > 0 and hp / maxHp or 0
    	val = UI:Clamp( val, 0, 1 )    	

		if self.bVpHpAlways then

        	local valPerc = UI:Clamp( math.ceil( val * 100 ), 0, 100 )	-- в #0011753 написано, что округление должно производиться в бОльшую сторону

        	local strVal = tostring( valPerc )
        	self:SetText( strVal, self.layers.HP_VAL )

		end

        if hpPbEffect then
			hpPbEffect:SetAnimationTime( 1 - val )
			hpPbEffect:Update( 0 )			
		end

	end

end


--
function UI.HudForcesInfo_VpSlotWnd:UpdateTurrets( ent, numTurrets )

	local bForceUpdate = self.prevNumTurrets == -1

	if not bForceUpdate and numTurrets == self.prevNumTurrets then
		return
	end

	if numTurrets > 0 and self.bVpHpAlways then

		self:SetLayerVisible( true, self.layers.TURRETS_EFFECT )
		self:SetLayerVisible( true, self.layers.NUM_TURRETS )

		self:SetText( tostring( numTurrets ), self.layers.NUM_TURRETS )

	else

		self:SetLayerVisible( false, self.layers.TURRETS_EFFECT )
		self:SetLayerVisible( false, self.layers.NUM_TURRETS )

	end

end


--
function UI.HudForcesInfo_VpSlotWnd:UpdateNotLive()

	self:SetLayerVisible( false, self.layers.HP_PB_EFFECT )
	self:SetLayerVisible( false, self.layers.HP_VAL )
	self:SetLayerVisible( false, self.layers.TURRETS_EFFECT )
	self:SetLayerVisible( false, self.layers.NUM_TURRETS )

end


--
function UI.HudForcesInfo_VpSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateVpHpAlways()

end


--
function UI.HudForcesInfo_VpSlotWnd:UpdateVpHpAlways()

	self.bVpHpAlways = UI.Options:GetHudOptionVal( "vpHpAlways" )

end