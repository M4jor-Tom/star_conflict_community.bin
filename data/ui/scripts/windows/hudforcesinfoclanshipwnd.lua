-- ----------------------------------------------------------------------------
--
-- Workfile: hudforcesinfoclanshipwnd.lua
-- Copyright é 2015, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShipWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoClanShipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudForcesInfoClanShipWnd",
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
				defName 			= "hud_forcesInfoClanShip_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "pr_friend",
						wnd			= "UI.HudForcesInfoClanShip_TeamWnd_friend",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "pr_enemy",
						wnd			= "UI.HudForcesInfoClanShip_TeamWnd_enemy",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		}
	},

	children = { "UI.HudForcesInfoClanShip_TeamWnd_friend", "UI.HudForcesInfoClanShip_TeamWnd_enemy" }
}

-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_TeamWnd
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_TeamWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoClanShip_TeamWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfoClanShip_TeamWnd",
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
		},   

		-- HP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- SHIELD_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,
		},

		-- GROUP_POINTS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz 	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_TeamWnd:Reset()

    self.hpEffect:SetAnimationTimeAndUpdate( 0 )
    self.shieldEffect:SetAnimationTimeAndUpdate( 0 )

	self:SetText( "", self.layers.GROUP_POINTS )

	self:ResetVitalPoints()
	self:ResetTurrets()
	self:ResetAddSlots()

	self.team			= -1
	self.groupPoints	= -1
	self.hpAnimTime		= -1
	self.shieldAnimTime	= -1

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudForcesInfoClanShip_TeamWnd.layers =
{
    MAIN_EFFECT		= 0,
    HP_EFFECT		= 1,
    SHIELD_EFFECT	= 2,
	GROUP_POINTS	= 3,
}

UI.HudForcesInfoClanShip_TeamWnd.effectInfo =
{
	main =
	{
		vpLocatorPrefix			= "vital_",
		turretLocatorPrefix		= "turret_",
		addSlotLocatorPrefix	= "vital_add_",
	},
}

UI.HudForcesInfoClanShip_TeamWnd.MAX_VITAL_POINTS		= 3
UI.HudForcesInfoClanShip_TeamWnd.MAX_TURRETS			= 4
UI.HudForcesInfoClanShip_TeamWnd.MAX_ADD_SLOTS			= 2

UI.HudForcesInfoClanShip_TeamWnd.vpPrototypeName		= ""
UI.HudForcesInfoClanShip_TeamWnd.turretPrototypeName	= ""
UI.HudForcesInfoClanShip_TeamWnd.addSlotPrototypeName	= ""
UI.HudForcesInfoClanShip_TeamWnd.bFriend				= false

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoClanShip_TeamWnd.allVps			= {}
UI.HudForcesInfoClanShip_TeamWnd.curVps			= {}
UI.HudForcesInfoClanShip_TeamWnd.allTurrets		= {}
UI.HudForcesInfoClanShip_TeamWnd.curTurrets		= {}
UI.HudForcesInfoClanShip_TeamWnd.allAddSlots	= {}
UI.HudForcesInfoClanShip_TeamWnd.curAddSlots	= {}
UI.HudForcesInfoClanShip_TeamWnd.mainEffect		= nil
UI.HudForcesInfoClanShip_TeamWnd.hpEffect		= nil
UI.HudForcesInfoClanShip_TeamWnd.shieldEffect	= nil
UI.HudForcesInfoClanShip_TeamWnd.team			= -1
UI.HudForcesInfoClanShip_TeamWnd.groupPoints	= -1
UI.HudForcesInfoClanShip_TeamWnd.hpAnimTime		= -1
UI.HudForcesInfoClanShip_TeamWnd.shieldAnimTime	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_TeamWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

    self.allVps			= {}
    self.curVps			= {}
    self.allTurrets		= {}
    self.curTurrets		= {}
    self.allAddSlots	= {}
    self.curAddSlots	= {}

	self:CreateControls()

	self.mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    self.hpEffect		= UI:GetEffectFromLayer( self, self.layers.HP_EFFECT )
    self.shieldEffect	= UI:GetEffectFromLayer( self, self.layers.SHIELD_EFFECT )

end


--
function UI.HudForcesInfoClanShip_TeamWnd:CreateControls()

	for vpIdx = 1, self.MAX_VITAL_POINTS do
		local vpWnd = UI:CreateChildWnd( self, UI[ self.vpPrototypeName ], tostring( vpIdx ) )
		table.insert( self.allVps, vpWnd )
	end

	for turretIdx = 1, self.MAX_TURRETS do
		local turretWnd = UI:CreateChildWnd( self, UI[ self.turretPrototypeName ], tostring( turretIdx ) )
		table.insert( self.allTurrets, turretWnd )
	end

	for addSlotIdx = 1, self.MAX_ADD_SLOTS do
		local addSlotWnd = UI:CreateChildWnd( self, UI[ self.addSlotPrototypeName ], tostring( addSlotIdx ) )
		table.insert( self.allAddSlots, addSlotWnd )
	end

end


--
function UI.HudForcesInfoClanShip_TeamWnd:ResetVitalPoints()

	for vpIdx, vpWnd in ipairs( self.curVps ) do

    	vpWnd:Reset()

    	vpWnd:UnlinkFromParent()	
    	self.mainEffect:UnlinkWnd( vpWnd:GetUiHandle(), "" )

	end

	self.curVps = {}

end


--
function UI.HudForcesInfoClanShip_TeamWnd:ResetTurrets()

	for turretIdx, turretWnd in ipairs( self.curTurrets ) do

    	turretWnd:Reset()

    	turretWnd:UnlinkFromParent()	
    	self.mainEffect:UnlinkWnd( turretWnd:GetUiHandle(), "" )

	end

	self.curTurrets = {}

end


--
function UI.HudForcesInfoClanShip_TeamWnd:ResetAddSlots()

	for addSlotIdx, addSlotWnd in ipairs( self.curAddSlots ) do

    	addSlotWnd:Reset()

    	addSlotWnd:UnlinkFromParent()	
    	self.mainEffect:UnlinkWnd( addSlotWnd:GetUiHandle(), "" )

	end

	self.curAddSlots = {}

end


--
function UI.HudForcesInfoClanShip_TeamWnd:FullUpdate()

	self:Reset()

	local myTeam = _G.CL_GetPlayerTeam( UI.HudWnd.localPlayerId )
	if myTeam == 0 then
		myTeam = 1
	end

	local enemyTeam = myTeam == 1 and 2 or 1

	self.team = self.bFriend and myTeam or enemyTeam

	self:SetupVitalPoints()
	self:SetupTurrets()
	self:SetupAddSlots()
	self:UpdateHp()
	self:UpdateShield()
	self:UpdateGroupPoints()

end


--
function UI.HudForcesInfoClanShip_TeamWnd:SetupVitalPoints()

	self:ResetVitalPoints()

	local vps = _G.GetAllVitalPoints()
	for vpIdx, vpEntId in ipairs( vps ) do

		local vpEnt = _G.Entities[ vpEntId ]
		if vpEnt then

    		if vpEnt:GetRelationshipGroup() == self.team then

                local vpWnd = self:GetFreeVitalPointWnd()	
				if vpWnd then
	                vpWnd:Setup( vpEntId )
				else
					break
				end

    		end

		else
			sys.log( "UI.HudForcesInfoClanShip_TeamWnd:SetupVitalPoints()[ERROR]: cannot find entity with id %d", vpEntId )
		end

	end

end


--
function UI.HudForcesInfoClanShip_TeamWnd:SetupTurrets()

	self:ResetTurrets()

	local turrets = _G.CL_GetTurretDefNames( self.team )
	for slotIdx, defName in ipairs( turrets ) do

		if defName ~= "" then

            local turretWnd = self:GetFreeTurretWnd()	
    		if turretWnd then
                turretWnd:Setup( self.team, slotIdx - 1 )
    		else
    			break
    		end

		end

	end

end


--
function UI.HudForcesInfoClanShip_TeamWnd:SetupAddSlots()

	self:ResetAddSlots()

	local addSlots = _G.CL_GetAdditionalsDefNames( self.team )
	for slotIdx, defName in ipairs( addSlots ) do

		if defName ~= "" then

            local addSlotWnd = self:GetFreeAddSlotWnd()	
    		if addSlotWnd then
    			addSlotWnd:Setup( self.team, slotIdx - 1, defName )
    		else
    			break
    		end

		end

	end

end


--
function UI.HudForcesInfoClanShip_TeamWnd:GetFreeVitalPointWnd()

	local vpWnd = nil

	for idx, wnd in ipairs( self.allVps ) do
		if not wnd:IsChildOf( self ) then
			vpWnd = wnd
			break
		end
	end

	if vpWnd then
		table.insert( self.curVps, vpWnd )
		UI:AddChildAndLink( self, vpWnd, self.mainEffect, string.format( "%s%d", self.effectInfo.main.vpLocatorPrefix, #self.curVps ), UI.EffectAnimParams.POS )		
	else
		sys.log( "HudForcesInfoClanShip_TeamWnd:GetFreeVitalPointWnd()[ERROR]: no more free vital point slots" )		
	end

	return vpWnd

end


--
function UI.HudForcesInfoClanShip_TeamWnd:GetFreeTurretWnd()

	local turretWnd = nil

	for idx, wnd in ipairs( self.allTurrets ) do
		if not wnd:IsChildOf( self ) then
			turretWnd = wnd
			break
		end
	end

	if turretWnd then
		table.insert( self.curTurrets, turretWnd )
		UI:AddChildAndLink( self, turretWnd, self.mainEffect, string.format( "%s%d", self.effectInfo.main.turretLocatorPrefix, #self.curTurrets ), UI.EffectAnimParams.POS )		
	else
		sys.log( "HudForcesInfoClanShip_TeamWnd:GetFreeVitalPointWnd()[ERROR]: no more free turret slots" )		
	end

	return turretWnd

end


--
function UI.HudForcesInfoClanShip_TeamWnd:GetFreeAddSlotWnd()

	local addSlotWnd = nil

	for idx, wnd in ipairs( self.allAddSlots ) do
		if not wnd:IsChildOf( self ) then
			addSlotWnd = wnd
			break
		end
	end

	if addSlotWnd then
		table.insert( self.curAddSlots, addSlotWnd )
		UI:AddChildAndLink( self, addSlotWnd, self.mainEffect, string.format( "%s%d", self.effectInfo.main.addSlotLocatorPrefix, #self.curAddSlots ), UI.EffectAnimParams.POS )		
	else
		sys.log( "HudForcesInfoClanShip_TeamWnd:GetFreeVitalPointWnd()[ERROR]: no more free addition slots" )		
	end

	return addSlotWnd

end


--
function UI.HudForcesInfoClanShip_TeamWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateHp()
	self:UpdateShield()
	self:UpdateGroupPoints()

end


--
function UI.HudForcesInfoClanShip_TeamWnd:UpdateHp()

	local hp, maxHp = _G.CL_GetClanShipHealth( self.team )

	local animTime = maxHp ~= 0 and hp / maxHp or 0

	if animTime == self.hpAnimTime then
		return
	end

    self.hpEffect:SetAnimationTimeAndUpdate( animTime )
	self.hpAnimTime = animTime

end


--
function UI.HudForcesInfoClanShip_TeamWnd:UpdateShield()

	local shield, maxShield = _G.CL_GetClanShipShield( self.team )

	local animTime = maxShield ~= 0 and shield / maxShield or 0

	if animTime == self.shieldAnimTime then
		return
	end

    self.shieldEffect:SetAnimationTimeAndUpdate( animTime )
	self.shieldAnimTime = animTime

end


--
function UI.HudForcesInfoClanShip_TeamWnd:UpdateGroupPoints()

	local groupPoints = _G.CL_GetClanShipGroupPoints( self.team )

	if groupPoints == self.groupPoints then
		return
	end

	local strGroupPoints = tostring( groupPoints )
	self:SetText( strGroupPoints, self.layers.GROUP_POINTS )

	self.groupPoints = groupPoints

end


--
function UI.HudForcesInfoClanShip_TeamWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end

-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_TeamWnd_friend
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_TeamWnd_friend =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_TeamWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_TeamWnd_friend",
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
    				defName 			= "hud_forcesInfoClanShip_team_friend",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "armor",
    						layer		= "UI.HudForcesInfoClanShip_TeamWnd.layers.HP_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "shield",
    						layer		= "UI.HudForcesInfoClanShip_TeamWnd.layers.SHIELD_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "text2",
    						layer		= "UI.HudForcesInfoClanShip_TeamWnd.layers.GROUP_POINTS",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BACK_COLOR,
    					},
					}
				}}
    		},   

    		-- HP_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName 			= "hud_forcesInfoClanShip_hp_friend",
    				defaultAnimation	= "idle",
				}}
    		},

    		-- SHIELD_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName 			= "hud_forcesInfoClanShip_shield_friend",
    				defaultAnimation	= "idle",
				}}
    		},
    	},
	},

    vpPrototypeName			= "HudForcesInfoClanShip_VpWnd_friend",
    turretPrototypeName		= "HudForcesInfoClanShip_TurretWnd_friend",
    addSlotPrototypeName	= "HudForcesInfoClanShip_AddSlotWnd_friend",
    bFriend					= true,
}

-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_TeamWnd_enemy
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_TeamWnd_enemy =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_TeamWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_TeamWnd_enemy",
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
    				defName 			= "hud_forcesInfoClanShip_team_enemy",
    				defaultAnimation	= "idle",

    				links =
    				{
    					{
    						objName		= "self",
    						animParams	= UI.EffectAnimParams.SIZE,
    					},

    					{
    						objName		= "armor",
    						layer		= "UI.HudForcesInfoClanShip_TeamWnd.layers.HP_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "shield",
    						layer		= "UI.HudForcesInfoClanShip_TeamWnd.layers.SHIELD_EFFECT",
    						animParams	= UI.EffectAnimParams.POS,
    					},

    					{
    						objName		= "text",
    						layer		= "UI.HudForcesInfoClanShip_TeamWnd.layers.GROUP_POINTS",
							animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.BACK_COLOR,
    					},
					}
				}}
    		},   

    		-- HP_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName 			= "hud_forcesInfoClanShip_hp_enemy",
    				defaultAnimation	= "idle",
				}}
    		},

    		-- SHIELD_EFFECT
    		{
    			layerType	= UI.LAYER_EFFECT,
    			layerStyle	= UI.WLS_RESIZABLE,
    			updatable	= false,

    			effects =
    			{{
    				defName 			= "hud_forcesInfoClanShip_shield_enemy",
    				defaultAnimation	= "idle",
				}}
    		},
    	},
	},

    vpPrototypeName			= "HudForcesInfoClanShip_VpWnd_enemy",
    turretPrototypeName		= "HudForcesInfoClanShip_TurretWnd_enemy",
    addSlotPrototypeName	= "HudForcesInfoClanShip_AddSlotWnd_enemy",
    bFriend					= false,
}

-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_VpWnd
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_VpWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoClanShip_VpWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfoClanShip_VpWnd",
		style		= UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
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
				defName 			= "hud_forcesInfoClanShip_vp",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "vital_progr",
						layer		= "UI.HudForcesInfoClanShip_VpWnd.layers.HP_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "vital_ico",
						layer		= "UI.HudForcesInfoClanShip_VpWnd.layers.ICO_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},   

		-- HP_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfoClanShip_vp_hp",
				defaultAnimation	= "idle",
			}}
		},

		-- ICO_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_objectsMark_specIco",
				defaultAnimation	= "white",
			}}
		},
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_VpWnd:Reset()

	self.entId				= -1
	self.ent				= nil
	self.tooltipData		= nil
	self.hpAnimTime			= -1
	self.mainAnimationId	= -1

	self.mainEffect:StartAnimationById( self.animId_main_idle )

    self.hpEffect:SetAnimationTimeAndUpdate( 0 )

	self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, UI.INVALID_RESOURCE_HANDLE )

	self:SetVisible( false )

end


--
function UI.HudForcesInfoClanShip_VpWnd:Setup( entId )

	self:Reset()

	self.entId	= entId
	self.ent	= _G.Entities[ entId ]

	self:FullUpdate()

end


--
function UI.HudForcesInfoClanShip_VpWnd:GetTooltipData()

	return self.tooltipData

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudForcesInfoClanShip_VpWnd.layers =
{
    MAIN_EFFECT	= 0,
    HP_EFFECT	= 1,
    ICO_EFFECT	= 2,
}

UI.HudForcesInfoClanShip_VpWnd.effectInfo =
{
	main =
	{
		animIdle		= "",
		animCapturing	= "",
	},

	ico =
	{
		spriteName	= "ico",
	}
}

UI.HudForcesInfoClanShip_VpWnd.bFriend = false

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoClanShip_VpWnd.entId					= -1
UI.HudForcesInfoClanShip_VpWnd.ent						= nil
UI.HudForcesInfoClanShip_VpWnd.hpEffect					= nil
UI.HudForcesInfoClanShip_VpWnd.icoEffect				= nil
UI.HudForcesInfoClanShip_VpWnd.mainEffect				= nil
UI.HudForcesInfoClanShip_VpWnd.tooltipData				= nil
UI.HudForcesInfoClanShip_VpWnd.animId_main_idle			= -1
UI.HudForcesInfoClanShip_VpWnd.animId_main_capturing	= -1
UI.HudForcesInfoClanShip_VpWnd.hpAnimTime				= -1
UI.HudForcesInfoClanShip_VpWnd.mainAnimationId			= -1
UI.HudForcesInfoClanShip_VpWnd.bVisible					= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_VpWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect	= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
    self.hpEffect	= UI:GetEffectFromLayer( self, self.layers.HP_EFFECT )
    self.icoEffect	= UI:GetEffectFromLayer( self, self.layers.ICO_EFFECT )

	self.animId_main_idle = self.mainEffect:GetAnimationId( self.effectInfo.main.animIdle )

	if self.effectInfo.main.animCapturing ~= "" then
		self.animId_main_capturing = self.mainEffect:GetAnimationId( self.effectInfo.main.animCapturing )
	end

	self:Reset()

end


--
function UI.HudForcesInfoClanShip_VpWnd:FullUpdate()

	if not self.ent then
		return
	end

	self:UpdateIco()
	self:UpdateTooltip()

	local bVisible = self:UpdateVisible()
	if bVisible then

		self:UpdateMainAnimation()
		self:UpdateHp()

	end

end


--
function UI.HudForcesInfoClanShip_VpWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	if not _G.IsEntIdValid( self.entId ) then
		self.ent = nil
	end

	if not self.ent then
		return
	end

	local bVisible = self:UpdateVisible()
	if bVisible then

		self:UpdateMainAnimation()
		self:UpdateHp()

	end

end


--
function UI.HudForcesInfoClanShip_VpWnd:UpdateIco()

	local defName = self.ent:GetDefName()
	local hTex = UI:GetClanshipVpIco( defName )

	self.icoEffect:SetSpriteTexture( self.effectInfo.ico.spriteName, hTex )

end


--
function UI.HudForcesInfoClanShip_VpWnd:UpdateTooltip()

	local defName = self.ent:GetDefName()

	self.tooltipData =
	{
		tooltipType	= UI.tooltipTypes.TEXT_LARGE,
		caption		= UI:ClanShipPart2Str( defName, true ),
		text		= UI:GetClanShipPartDesc( defName ),
	}

end


--
function UI.HudForcesInfoClanShip_VpWnd:UpdateHp()

	local hp	= self.ent:GetHealth()
	local maxHp	= self.ent:GetMaxHealth()

	local animTime = 1 - UI:Clamp( maxHp > 0 and hp / maxHp or 0, 0, 1 )

	if animTime == self.hpAnimTime then
		return
	end

    self.hpEffect:SetAnimationTimeAndUpdate( animTime )
	self.hpAnimTime = animTime

end


--
function UI.HudForcesInfoClanShip_VpWnd:UpdateMainAnimation()

	local animId = self:IsCapturing( self.ent ) and self.animId_main_capturing or self.animId_main_idle

	if animId ~= mainAnimationId then
		self.mainEffect:StartAnimationById( animId )
		self.mainAnimationId = animId
	end

end


--
function UI.HudForcesInfoClanShip_VpWnd:SetVisible( bVisible )

	if bVisible then
		self:RemoveStyle( UI.WS_NOT_DRAW )
	else
		self:AddStyle( UI.WS_NOT_DRAW )
	end

	self.bVisible = bVisible

end


--
function UI.HudForcesInfoClanShip_VpWnd:IsVisible()

	return self:HasStyle( UI.WS_NOT_DRAW )

end


--
function UI.HudForcesInfoClanShip_VpWnd:UpdateVisible()

	local bVisible = not self.ent:IsDead()

	if bVisible ~= self.bVisible then
		self:SetVisible( bVisible )
	end

	return bVisible

end


--
function UI.HudForcesInfoClanShip_VpWnd:IsCapturing()

	return self.bFriend and self.ent:IsUnderAttack()

end


-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_VpWnd_friend
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_VpWnd_friend =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_VpWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_VpWnd_friend",
    		isPrototype	= true,
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animIdle		= "friend",
			animCapturing	= "blink",
    	},
    },

	bFriend = true,
}


-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_VpWnd_enemy
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_VpWnd_enemy =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_VpWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_VpWnd_enemy",
    		isPrototype	= true,
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animIdle 		= "enemy",
			animCapturing	= "",
    	},
    },

	bFriend = false,
}

-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_TurretWnd
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_TurretWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoClanShip_TurretWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfoClanShip_TurretWnd",
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
				defName 			= "hud_forcesInfoClanShip_turret",
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
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_TurretWnd:Reset()

	self.slotId	= -1
	self.team	= -1
	self.animId	= -1

	self.mainEffect:StartAnimationById( self.animIdMainDead )

end


--
function UI.HudForcesInfoClanShip_TurretWnd:Setup( team, slotId )

	self.team	= team
	self.slotId	= slotId

	self:UpdateAnimation()

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudForcesInfoClanShip_TurretWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.HudForcesInfoClanShip_TurretWnd.effectInfo =
{
	main =
	{
		animAlive	= "",
		animDead	= "idle",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoClanShip_TurretWnd.team				= -1
UI.HudForcesInfoClanShip_TurretWnd.slotId			= -1
UI.HudForcesInfoClanShip_TurretWnd.mainEffect		= nil
UI.HudForcesInfoClanShip_TurretWnd.animIdMainAlive	= -1
UI.HudForcesInfoClanShip_TurretWnd.animIdMainDead	= -1
UI.HudForcesInfoClanShip_TurretWnd.animId			= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_TurretWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.animIdMainAlive	= self.mainEffect:GetAnimationId( self.effectInfo.main.animAlive )
	self.animIdMainDead		= self.mainEffect:GetAnimationId( self.effectInfo.main.animDead )

	self:Reset()

end


--
function UI.HudForcesInfoClanShip_TurretWnd:UpdateAnimation()

	local bAlive = _G.CL_GetTurretState( self.team, self.slotId )

	local animId = bAlive and self.animIdMainAlive or self.animIdMainDead

	if animId ~= self.animId then
		self.mainEffect:StartAnimationById( animId )
		self.animId = animId
	end

end


--
function UI.HudForcesInfoClanShip_TurretWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateAnimation()

end


-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_TurretWnd_friend
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_TurretWnd_friend =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_TurretWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_TurretWnd_friend",
    		isPrototype	= true,
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animAlive	= "friend",
    	},
    }
}


-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_TurretWnd_enemy
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_TurretWnd_enemy =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_TurretWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_TurretWnd_enemy",
    		isPrototype	= true,
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animAlive	= "enemy",
    	},
    }
}


-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_AddSlotWnd
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_AddSlotWnd = {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudForcesInfoClanShip_AddSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudForcesInfoClanShip_AddSlotWnd",
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
				defName 			= "hud_forcesInfoClanShip_addSlot",
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
-- interface functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_AddSlotWnd:Reset()

	self.team		= -1
	self.slotId		= -1
	self.defName	= ""
	self.animId		= -1

	self.mainEffect:StartAnimationById( self.animIdMainDead )
	self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, UI.INVALID_RESOURCE_HANDLE )

end


--
function UI.HudForcesInfoClanShip_AddSlotWnd:Setup( team, slotId, defName )

	self:Reset()

	self.team		= team
	self.slotId		= slotId
	self.defName	= defName

	self:FullUpdate()

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudForcesInfoClanShip_AddSlotWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.HudForcesInfoClanShip_AddSlotWnd.effectInfo =
{
	main =
	{
		animAlive		= "",
		animDead		= "idle",
		icoSpriteName	= "qw6",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

UI.HudForcesInfoClanShip_AddSlotWnd.team			= -1
UI.HudForcesInfoClanShip_AddSlotWnd.slotId			= -1
UI.HudForcesInfoClanShip_AddSlotWnd.defName			= ""
UI.HudForcesInfoClanShip_AddSlotWnd.mainEffect		= nil
UI.HudForcesInfoClanShip_AddSlotWnd.animIdMainAlive	= -1
UI.HudForcesInfoClanShip_AddSlotWnd.animIdMainDead	= -1
UI.HudForcesInfoClanShip_AddSlotWnd.animId			= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudForcesInfoClanShip_AddSlotWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.animIdMainAlive	= self.mainEffect:GetAnimationId( self.effectInfo.main.animAlive )
	self.animIdMainDead		= self.mainEffect:GetAnimationId( self.effectInfo.main.animDead )

	self:Reset()

end


--
function UI.HudForcesInfoClanShip_AddSlotWnd:FullUpdate()

	self:UpdateIco()
	self:UpdateAnimation()

end


--
function UI.HudForcesInfoClanShip_AddSlotWnd:UpdateIco()

	local hTex = UI:GetTex( "NoData" )

	local def = UI:GetDef( self.defName )
	if def then

		if type( def.hud_ico ) == "string" then
			hTex = UI:GetTex( def.hud_ico )
		else
			sys.log( "UI.HudForcesInfoClanShip_AddSlotWnd:UpdateIco()[ERROR]: invalid type of _G.Def[\"%s\"].hud_ico; \"string\" expected, got \"%s\"", self.defName, type( def.hud_ico ) )
		end

	else
		sys.log( "UI.HudForcesInfoClanShip_AddSlotWnd:UpdateIco()[ERROR]: cannot find _G.Def[\"%s\"]", self.defName )
	end

	self.mainEffect:SetSpriteTexture( self.effectInfo.main.icoSpriteName, hTex )

end


--
function UI.HudForcesInfoClanShip_AddSlotWnd:UpdateAnimation()

	local bAlive = _G.CL_GetAdditionalState( self.team, self.slotId )

	local animId = bAlive and self.animIdMainAlive or self.animIdMainDead

	if animId ~= self.animId then
		self.mainEffect:StartAnimationById( animId )
		self.animId = animId
	end

end


--
function UI.HudForcesInfoClanShip_AddSlotWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateAnimation()

end


-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_AddSlotWnd_friend
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_AddSlotWnd_friend =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_AddSlotWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_AddSlotWnd_friend",
    		isPrototype	= true,
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animAlive	= "friend",
    	},
    }
}


-- ----------------------------------------------------------------------------
-- UI.HudForcesInfoClanShip_AddSlotWnd_enemy
-- ----------------------------------------------------------------------------

UI.HudForcesInfoClanShip_AddSlotWnd_enemy =
{
	def =
	{
    	className	= "Wnd",
		prototype	= "HudForcesInfoClanShip_AddSlotWnd",

    	props =
    	{
    		name		= "HudForcesInfoClanShip_AddSlotWnd_enemy",
    		isPrototype	= true,
    	},
	},

    effectInfo =
    {
    	main =
    	{
    		animAlive	= "enemy",
    	},
    }
}