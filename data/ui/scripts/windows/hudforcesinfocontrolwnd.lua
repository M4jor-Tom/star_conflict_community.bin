-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfocontrolwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudForcesInfoControlWnd = {}
local fi = UI.HudForcesInfoControlWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoControlWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoControlWnd",
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
				defName 			= "hud_forcesInfoControl_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "friend",
						layer		= "UI.HudForcesInfoControlWnd.layers.FRIEND_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy",
						layer		= "UI.HudForcesInfoControlWnd.layers.ENEMY_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "friend_score",
						layer		= "UI.HudForcesInfoControlWnd.layers.FRIEND_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "enemy_score",
						layer		= "UI.HudForcesInfoControlWnd.layers.ENEMY_SCORE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "indicator_1",
						layer		= "UI.HudForcesInfoControlWnd.layers.COMPARISON_EFFECT",
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

		-- FRIEND_SCORE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- ENEMY_SCORE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- COMPARISON_EFFECT
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

-- для режима Zombie
function UI.HudForcesInfoControlWnd:OnVitalPointTemporaryDisabledTrigger( vpEntityId, bDisabled ) 

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


--
function UI.HudForcesInfoControlWnd:OnVpHpAlwaysOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	for slotIdx, slotWnd in ipairs( self.curVpSlots ) do
		slotWnd:OnVpHpAlwaysOptionChanged()
	end

end


-- для режима Zombie
function UI.HudForcesInfoControlWnd:OnLocalPlayerTeamChanged()

	if not self:IsOnScreen() then
		return
	end

	self:FullUpdate()

end


-- ------------------------------
-- const
-- ------------------------------

fi.layers =
{
    MAIN_EFFECT			= 0,
    FRIEND_LABEL		= 1,
    ENEMY_LABEL			= 2,
    FRIEND_SCORE		= 3,
    ENEMY_SCORE			= 4,
    COMPARISON_EFFECT	= 5,
}

fi.effectInfo =
{
	main =
	{
		vpLocatorPrefix			= "slot_",
	},

	comparison =
	{
		animFriendWin	= "more",
		animEnemyWin	= "less",
		animEqual		= "equally",
	}
}

fi.MAX_VP = 3
fi.MAX_VP_LOCATORS = 3

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
function UI.HudForcesInfoControlWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:CreateVpSlots()

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		self.comparisonAnimId_friendWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animFriendWin )
		self.comparisonAnimId_enemyWin	= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEnemyWin )
		self.comparisonAnimId_equal		= comparisonEffect:GetAnimationId( self.effectInfo.comparison.animEqual )	

	end

end


--
function UI.HudForcesInfoControlWnd:CreateVpSlots()

	for slotIdx = 1, self.MAX_VP do

		local slotWnd = UI:CreateChildWnd( self, UI.HudForcesInfoControl_VpSlotWnd, tostring( slotIdx ) )
		table.insert( self.allVpSlots, slotWnd )

	end

end


--
function UI.HudForcesInfoControlWnd:Reset()

	self:SetText( "0", self.layers.FRIEND_SCORE )
	self:SetText( "0", self.layers.ENEMY_SCORE )

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then
		comparisonEffect:StartAnimation( self.effectInfo.comparison.animEqual )
	end

	self:ResetVpSlots()

	self.myTeam = 1

end


--
function UI.HudForcesInfoControlWnd:ResetVpSlots()

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
function UI.HudForcesInfoControlWnd:FullUpdate()

	self:Reset()

	self.myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if self.myTeam == 0 then
		self.myTeam = 1
	end

	local vps = _G.GetAllVitalPoints()
	local numVps = #vps

	local numVisibleVps = 0

	for idx = 1, #vps do

		local vpEntId = vps[ idx ]
		local vpEnt = _G.Entities[ vpEntId ]

		if vpEnt then

			if not vpEnt:TemporaryDisabledInHUD() then -- в режиме Zombie маяки включаются не сразу

				if numVisibleVps < self.MAX_VP then

            		self:AddSlotForVitalPoint( vpEntId )
    				numVisibleVps = numVisibleVps + 1

				else
					sys.log( "UI.HudForcesInfoControlWnd:FullUpdate()[ERROR]: cannot show one more vital point; can show only %d", self.MAX_VP )
				end

			end

		else
			sys.log( "UI.HudForcesInfoControlWnd:FullUpdate()[ERROR]: cannot find vital point with id %d", vpEntId )
		end

	end

	self:RecalcLayout()

end


--
function UI.HudForcesInfoControlWnd:AddSlotForVitalPoint( vpEntId )

	local slotWnd = self:GetFreeVpSlot()
	if not slotWnd then
		sys.log( "UI.HudForcesInfoControlWnd:AddSlotForVitalPoint()[ERROR]: no free vp slot" )
		return
	end

	self:AddChild( slotWnd )
	slotWnd:Setup( vpEntId )

	table.insert( self.curVpSlots, slotWnd )

end


--
function UI.HudForcesInfoControlWnd:GetFreeVpSlot()	

	for idx, slotWnd in ipairs( self.allVpSlots ) do
		if not slotWnd:IsChildOf( self ) then
			return slotWnd
		end
	end

	return nil

end


--
function UI.HudForcesInfoControlWnd:RecalcLayout()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	if not self.curVpSlots[ 1 ] then
		return
	end

	local firstSlotLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.vpLocatorPrefix, 1 ) )
	local secondSlotLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.vpLocatorPrefix, 2 ) )
	local lastSlotLocatorPos	= mainEffect:GetObjPos( string.format( "%s%d", self.effectInfo.main.vpLocatorPrefix, self.MAX_VP_LOCATORS ) )
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
function UI.HudForcesInfoControlWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateScore()

end


--
function UI.HudForcesInfoControlWnd:UpdateScore()

	local score1, score2 = _G.CL_GetTeamTotalScore()

	local score_friend	= self.myTeam == 1 and score1 or score2
	local score_enemy	= self.myTeam == 1 and score2 or score1

	score_friend	= UI:RoundClampOne( score_friend )
	score_enemy		= UI:RoundClampOne( score_enemy )

	local strScore_friend	= tostring( score_friend )
	local strScore_enemy	= tostring( score_enemy )

	-- текстовое значение очков

	self:SetText( strScore_friend, self.layers.FRIEND_SCORE )
	self:SetText( strScore_enemy, self.layers.ENEMY_SCORE )


	-- знак сравнения очков

	local comparisonEffect = UI:GetEffectFromLayer( self, self.layers.COMPARISON_EFFECT )
	if comparisonEffect then

		local animId = -1

		if score_friend > score_enemy then
			animId = self.comparisonAnimId_friendWin
		elseif score_friend < score_enemy then
			animId = self.comparisonAnimId_enemyWin
		else
			animId = self.comparisonAnimId_equal
		end

		if comparisonEffect:GetCurAnimationId() ~= animId then
			comparisonEffect:StartAnimationById( animId )
		end

	end

end


--
function UI.HudForcesInfoControlWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


-- --------------------------------------------------------------
-- UI.HudForcesInfoControl_VpSlotWnd
-- --------------------------------------------------------------

UI.HudForcesInfoControl_VpSlotWnd = {}
local fis = UI.HudForcesInfoControl_VpSlotWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoControl_VpSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfoControl_VpSlotWnd",
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
				defName 			= "hud_forcesInfoControl_vpSlot",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "value_1",
						layer		= "UI.HudForcesInfoControl_VpSlotWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "progr",
						layer		= "UI.HudForcesInfoControl_VpSlotWnd.layers.HP_PB_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "value_2",
						layer		= "UI.HudForcesInfoControl_VpSlotWnd.layers.HP_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "dron_count",
						layer		= "UI.HudForcesInfoControl_VpSlotWnd.layers.TURRETS_EFFECT",
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

		-- HP_PB_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_forcesInfoControl_vpSlot_hpPb_main",

				links =
				{
					{
						objName		= "progr",
						layer		= "UI.HudForcesInfoControl_VpSlotWnd.layers.HP_PB_BAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "marker",
						layer		= "UI.HudForcesInfoControl_VpSlotWnd.layers.HP_PB_CAPTURE_THRESHOLD_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- HP_PB_BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfoControl_vpSlot_hpPb_bar",
			}}
		},

		-- HP_PB_CAPTURE_THRESHOLD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfoControl_vpSlot_hpPb_captureThres",
				defaultAnimation	= "idle",
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
						layer		= "UI.HudForcesInfoControl_VpSlotWnd.layers.NUM_TURRETS",
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
function UI.HudForcesInfoControl_VpSlotWnd:Setup( entId )

	self:Reset()

	self.entId = entId

	local ent = _G.Entities[ self.entId ]
	self:UpdateName( ent )
	self:UpdateCaptureThreshold( ent )

end


--
function UI.HudForcesInfoControl_VpSlotWnd:Reset()

	self:SetText( "", self.layers.NAME )
	self:SetText( "", self.layers.HP_VAL )
	self:SetLayerVisible( false, self.layers.TURRETS_EFFECT )
	self:SetLayerVisible( false, self.layers.NUM_TURRETS )

	local hpBarEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_BAR_EFFECT )
	if hpBarEffect then
		hpBarEffect:SetAnimationTime( 1 )	-- анимация сделана так, что работает наоборот - 1 соответствует пустой полоске
	end

	local captureThresEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_CAPTURE_THRESHOLD_EFFECT )
	if captureThresEffect then
		captureThresEffect:SetAnimationTime( 0 )
	end

	self.entId			= -1
	self.prevNumTurrets	= -1

end


--
function UI.HudForcesInfoControl_VpSlotWnd:GetVpEntId()

	return self.entId

end


--
function UI.HudForcesInfoControl_VpSlotWnd:OnVpHpAlwaysOptionChanged()

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
    MAIN_EFFECT						= 0,
    NAME							= 1,
    HP_PB_MAIN_EFFECT				= 2,
    HP_PB_BAR_EFFECT				= 3,
    HP_PB_CAPTURE_THRESHOLD_EFFECT	= 4,
    HP_VAL							= 5,
    TURRETS_EFFECT					= 6,
    NUM_TURRETS						= 7,
}

fis.effectInfo =
{
	main =
	{
		animFriend	= "freind",
		animEnemy	= "enemy",
		animNeutral	= "neutral",
	},

	hpPbMain =
	{
		animFriend			= "friend",
		animEnemy			= "ememy",
		animNeutral			= "neutral",
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

fis.entId							= -1
fis.mainAnimId_friend				= -1
fis.mainAnimId_enemy				= -1
fis.mainAnimId_neutral				= -1
fis.hpPbMainAnimId_friend			= -1
fis.hpPbMainAnimId_enemy			= -1
fis.hpPbMainAnimId_neutral			= -1
fis.prevNumTurrets					= -1
fis.hpPbAnimId_hasTurrets			= -1
fis.hpPbAnimId_noTurrets			= -1 
fis.bVpHpAlways						= UI.hudOptionsDefaultVals.vpHpAlways

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoControl_VpSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.mainAnimId_friend				= mainEffect:GetAnimationId( self.effectInfo.main.animFriend )
		self.mainAnimId_enemy				= mainEffect:GetAnimationId( self.effectInfo.main.animEnemy )
		self.mainAnimId_neutral 			= mainEffect:GetAnimationId( self.effectInfo.main.animNeutral )
	end

	local hpPbMainEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_MAIN_EFFECT )
	if hpPbMainEffect then
		self.hpPbMainAnimId_friend			= hpPbMainEffect:GetAnimationId( self.effectInfo.hpPbMain.animFriend )
		self.hpPbMainAnimId_enemy			= hpPbMainEffect:GetAnimationId( self.effectInfo.hpPbMain.animEnemy )
		self.hpPbMainAnimId_neutral			= hpPbMainEffect:GetAnimationId( self.effectInfo.hpPbMain.animNeutral )
	end

	local hpPbEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_BAR_EFFECT )
	if hpPbEffect then

		self.hpPbAnimId_hasTurrets	= hpPbEffect:GetAnimationId( self.effectInfo.hpPb.animHasTurrets )
		self.hpPbAnimId_noTurrets	= hpPbEffect:GetAnimationId( self.effectInfo.hpPb.animNoTurrets )

	end

end


--
function UI.HudForcesInfoControl_VpSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local ent = _G.Entities[ self.entId ]
	local numTurrets = ent:GetNumAliveTurrets()

	local vpRelationsipGroup	= ent:GetRelationshipGroup()
	local myRelationshipGroup	= _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if myRelationshipGroup == 0 then
		myRelationshipGroup = 1
	end
	local relationship			= ai.Relationship:GetRelationship( vpRelationsipGroup, myRelationshipGroup )

	self:UpdateMainAnimation( relationship )
	self:UpdateHpMainAnimation( ent, relationship, myRelationshipGroup )
	self:UpdateHp( ent, numTurrets )
	self:UpdateTurrets( ent, numTurrets )

	self.prevNumTurrets = numTurrets		

end


--
function UI.HudForcesInfoControl_VpSlotWnd:UpdateMainAnimation( relationship )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local animId = -1

	if relationship == ai.RelatioshipType.FRIEND then
		animId = self.mainAnimId_friend

	elseif relationship == ai.RelatioshipType.ENEMY then
		animId = self.mainAnimId_enemy

	elseif relationship == ai.RelatioshipType.NEUTRAL then
		animId = self.mainAnimId_neutral
	end

	if mainEffect:GetCurAnimationId() ~= animId then
		mainEffect:StartAnimationById( animId )	
	end

end


--
function UI.HudForcesInfoControl_VpSlotWnd:UpdateName( ent )

	local name = UI:GetEntityLocalizedName( ent, false )
	self:SetText( name, self.layers.NAME )	

end


--
function UI.HudForcesInfoControl_VpSlotWnd:UpdateHpMainAnimation( ent, relationship, myRelationshipGroup )

	local hpMainEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_MAIN_EFFECT )
	if not hpMainEffect then
		return
	end

	local animId = -1

	if relationship == ai.RelatioshipType.FRIEND then
		animId = self.hpPbMainAnimId_friend

	elseif relationship == ai.RelatioshipType.ENEMY then
		animId = self.hpPbMainAnimId_enemy

	elseif relationship == ai.RelatioshipType.NEUTRAL then

		local desiredRelationshipGroup = ent:GetDesiredRelationshipGroup()
		local desiredRelationship = ai.Relationship:GetRelationship( desiredRelationshipGroup, myRelationshipGroup )

		if desiredRelationship == ai.RelatioshipType.FRIEND then
			animId = self.hpPbMainAnimId_friend

		elseif desiredRelationship == ai.RelatioshipType.ENEMY then
			animId = self.hpPbMainAnimId_enemy

		else
			animId = self.hpPbMainAnimId_neutral
		end			

	end

	if hpMainEffect:GetCurAnimationId() ~= animId then
		hpMainEffect:StartAnimationById( animId )
	end

end


--
function UI.HudForcesInfoControl_VpSlotWnd:UpdateHp( ent, numTurrets )

	local bForceUpdate = self.prevNumTurrets == -1

	if numTurrets > 0 then

		if bForceUpdate or not( self.prevNumTurrets > 0 ) then

    		self:SetLayerVisible( false, self.layers.HP_VAL )

    		local animId = self.hpPbAnimId_hasTurrets

			local hpPbEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_BAR_EFFECT )
    		if hpPbEffect then

    			hpPbEffect:StartAnimationById( animId )
    			self:GetLayer( UI.LAYER_EFFECT, self.layers.HP_PB_BAR_EFFECT, 0 ):SetUpdatable( true )

    		end

		end

	else

		local hpPbEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_BAR_EFFECT )

		if bForceUpdate or self.prevNumTurrets > 0 then

			self:SetLayerVisible( self.bVpHpAlways, self.layers.HP_VAL )

        	local animId = self.hpPbAnimId_noTurrets

        	if hpPbEffect then

        		hpPbEffect:StartAnimationById( animId )
        		self:GetLayer( UI.LAYER_EFFECT, self.layers.HP_PB_BAR_EFFECT, 0 ):SetUpdatable( false )

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
function UI.HudForcesInfoControl_VpSlotWnd:UpdateTurrets( ent, numTurrets )

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
function UI.HudForcesInfoControl_VpSlotWnd:UpdateCaptureThreshold( ent )

	local thresEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_CAPTURE_THRESHOLD_EFFECT )
	if not thresEffect then
		return
	end	

	local defName = ent:GetDefName()
	local def = UI:GetDef( defName )

	local maxHp		= ent:GetMaxHealth()
	local threshold	= def.relation_health or 0

	local animTime = threshold / maxHp

	thresEffect:SetAnimationTime( animTime )
	thresEffect:Update( 0 )

end


--
function UI.HudForcesInfoControl_VpSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateVpHpAlways()
	self:UpdateEffects()

end


--
function UI.HudForcesInfoControl_VpSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

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
function UI.HudForcesInfoControl_VpSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	local thresEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_CAPTURE_THRESHOLD_EFFECT )
	if thresEffect then
		thresEffect:Update( 0 )
	end                      

	local hpBarEffect = UI:GetEffectFromLayer( self, self.layers.HP_PB_BAR_EFFECT )
	if hpBarEffect then
		hpBarEffect:Update( 0 )
	end

end


--
function UI.HudForcesInfoControl_VpSlotWnd:UpdateVpHpAlways()

	self.bVpHpAlways = UI.Options:GetHudOptionVal( "vpHpAlways" )

end