-- ----------------------------------------------------------------------------
--
-- Workfile: hudwarningswnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudWarningsWnd = {}
local hw = UI.HudWarningsWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudWarningsWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudWarningsWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
		rectAbs	= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "hud_warnings_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "base_attack",
						layer		= "UI.HudWarningsWnd.layers.VITAL_POINT_ATTACKED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "lock_me",
						layer		= "UI.HudWarningsWnd.layers.LOCKED_BY_ENEMY_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "warning_rocket_me",
						layer		= "UI.HudWarningsWnd.layers.INCOMING_MISSILE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "warning_bomb_me",
						layer		= "UI.HudWarningsWnd.layers.BOMB_DETECTED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "failure_modules",
						layer		= "UI.HudWarningsWnd.layers.DISABLE_MODULES_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "failure_all",
						layer		= "UI.HudWarningsWnd.layers.DISABLE_ALL_SYSTEMS_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "failure_rocket",
						layer		= "UI.HudWarningsWnd.layers.MISSILE_DESTROYED_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}		
			}}
		},   

		-- LOCKED_BY_ENEMY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_lockedByEnemy",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.HudWarningsWnd.layers.LOCKED_BY_ENEMY_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- LOCKED_BY_ENEMY_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- INCOMING_MISSILE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_incomingMissile",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.HudWarningsWnd.layers.INCOMING_MISSILE_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- INCOMING_MISSILE_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- BOMB_DETECTED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_bombDetected",
				defaultAnimation	= "idle",
			}}
		},

		-- VITAL_POINT_ATTACKED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_vpUnderAttack",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text2",
						layer		= "UI.HudWarningsWnd.layers.VITAL_POINT_ATTACKED_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- VITAL_POINT_ATTACKED_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^warning_vitalPointAttacked",
		}, 

		-- DISABLE_MODULES_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_disableModules",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.HudWarningsWnd.layers.DISABLE_MODULES_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- DISABLE_MODULES_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^warning_disableModules",
		}, 

		-- DISABLE_ALL_SYSTEMS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_disableAllSystems",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.HudWarningsWnd.layers.DISABLE_ALL_SYSTEMS_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- DISABLE_ALL_SYSTEMS_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^warning_disableAllSystems",
		},   

		-- MISSILE_DESTROYED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_missileDestroyed",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text",
						layer		= "UI.HudWarningsWnd.layers.MISSILE_DESTROYED_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.BACK_COLOR,
					},
				}
			}}
		},

		-- MISSILE_DESTROYED_TEXT
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^warning_missileDestroyed",
		}, 
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudWarningsWnd:OnGuidedMissileDestroyed()

	if not self:IsOnScreen() then
		return
	end

	self:ShowMissileDestroyed()

end


--
function UI.HudWarningsWnd:OnApplyAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:UpdateAuras( UI.HudWnd.myShip )
	end

end


--
function UI.HudWarningsWnd:OnCancelAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:UpdateAuras( UI.HudWnd.myShip )
	end

end


-- ------------------------------
-- const
-- ------------------------------

hw.layers =
{
    MAIN_EFFECT						= 0, 
    LOCKED_BY_ENEMY_EFFECT			= 1, 
    LOCKED_BY_ENEMY_TEXT			= 2, 
    INCOMING_MISSILE_EFFECT			= 3, 
	INCOMING_MISSILE_TEXT			= 4,
	BOMB_DETECTED_EFFECT			= 5, 
    VITAL_POINT_ATTACKED_EFFECT		= 6, 
    VITAL_POINT_ATTACKED_TEXT		= 7,
    DISABLE_MODULES_EFFECT			= 8, 
    DISABLE_MODULES_TEXT			= 9, 
    DISABLE_ALL_SYSTEMS_EFFECT		= 10, 
    DISABLE_ALL_SYSTEMS_TEXT		= 11,
    MISSILE_DESTROYED_EFFECT		= 12,
    MISSILE_DESTROYED_TEXT			= 13,
}

hw.LOCKED_BY_ENEMY_UPDATE_TIME		= 0.5	-- иконка "залочен врагом" апдейтится раз в полсекунды

-- ------------------------------
-- vars
-- ------------------------------

hw.numLocks					= 0
hw.numMissiles				= 0
hw.bombDetected				= false
hw.bDisableModules			= false
hw.bDisableAllSystems		= false
hw.shipId					= -1
hw.bHasVpUnderAttack		= false
hw.missileDestroyedEffect	= nil
hw.auras					= {}
hw.lockedByEnemyUpdateTimer	= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudWarningsWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.missileDestroyedEffect = UI:GetEffectFromLayer( self, self.layers.MISSILE_DESTROYED_EFFECT )

end


--
function UI.HudWarningsWnd:Reset()

	for layerIdx = 0, self:GetNumLayers() - 1 do
		self:SetLayerVisible( false, layerIdx )
	end

	self.numLocks					= 0
	self.numMissiles				= 0
	self.bombDetected				= false
	self.bDisableModules			= false
	self.bDisableAllSystems			= false
	self.shipId						= -1
	self.bHasVpUnderAttack			= false
	self.auras						= {}
	self.lockedByEnemyUpdateTimer	= 0

	self:AddStyle( UI.WS_NOT_DRAW )

end


--
function UI.HudWarningsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Reset()

end


--
function UI.HudWarningsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate( dt_sys )

end


--
function UI.HudWarningsWnd:FullUpdate( dt )

	local myShip = UI.HudWnd.myShip
	local shipId = myShip and myShip:GetId() or -1

	if shipId ~= self.shipId then

		self:UpdateAuras( myShip )

		if shipId ~= -1 then
			self:RemoveStyle( UI.WS_NOT_DRAW )
		else
			self:AddStyle( UI.WS_NOT_DRAW )
		end

		self.shipId = shipId

	end

	if self.shipId == -1 then
		return
	end

	local threatAnalyzerLevel = ( myShip and not myShip:IsDead() ) and 2 or 0
	

	self:UpdateVitalPointAttacked()
	self:UpdateIncomingMissile( myShip, threatAnalyzerLevel )
	self:UpdateDetectedBomb( myShip, threatAnalyzerLevel )
	self:UpdateDisableEffects( myShip )
	
	-- иконка "залочен врагом" адпейтится не каждый кадр, т.к. это "тяжелая" операция - надо пройтись по всем кораблям
	self.lockedByEnemyUpdateTimer = self.lockedByEnemyUpdateTimer - dt
	if self.lockedByEnemyUpdateTimer <= 0 then
		self.lockedByEnemyUpdateTimer = self.LOCKED_BY_ENEMY_UPDATE_TIME
		self:UpdateLockedByEnemy( myShip, threatAnalyzerLevel )
	end

end


--
function UI.HudWarningsWnd:UpdateVitalPointAttacked()

	-- TODO: если спектатор поменяется, то данный ворнинг может ему не соответствовать
	local bHasVpUnderAttack = _G.CL_HasVitalPointUnderAttack()

	if bHasVpUnderAttack ~= self.bHasVpUnderAttack then

    	self:SetLayerVisible( bUnderAttack, self.layers.VITAL_POINT_ATTACKED_EFFECT )
    	self:SetLayerVisible( bUnderAttack, self.layers.VITAL_POINT_ATTACKED_TEXT )

		self.bHasVpUnderAttack = bHasVpUnderAttack

	end

end


--
function UI.HudWarningsWnd:UpdateLockedByEnemy( myShip, threatAnalyzerLevel )

	local numLocks = 0

	if threatAnalyzerLevel >= 1 then
	
		-- хак, корабли берутся из маркеров, т.к. общий список кораблей нигде не хранится
		local marks = UI.HudWnd:GetMarks()
		for markIdx, mark in pairs( marks ) do
			if _G.IsEntIdValid( mark.entId ) and mark.ent and mark.bIsShip then
				if mark.ent:GetTargetLock() == myShip then
					numLocks = numLocks + 1
				end
			end
		end
		
	end

	if self.numLocks == numLocks then
		return
	end

	local bEffectNeedVisible	= numLocks > 0
	local bEffectWasVisible		= self.numLocks > 0

	if bEffectNeedVisible ~= bEffectWasVisible then
		self:SetLayerVisible( bEffectNeedVisible, self.layers.LOCKED_BY_ENEMY_EFFECT )
	end

	local bTextNeedVisible	= numLocks > 1
	local bTextWasVisible	= self.numLocks > 1

	if bTextNeedVisible ~= bTextWasVisible then
		self:SetLayerVisible( bTextNeedVisible, self.layers.LOCKED_BY_ENEMY_TEXT )
	end

	if bTextNeedVisible then
		self:SetText( tostring( numLocks ), self.layers.LOCKED_BY_ENEMY_TEXT )
	end	

	self.numLocks = numLocks

end


--
function UI.HudWarningsWnd:UpdateIncomingMissile( myShip, threatAnalyzerLevel )

	local numMissiles = 0

	if threatAnalyzerLevel >= 2 then
		numMissiles	= _G.CL_GetShipNumIncomingMissiles( myShip )
	end

	if self.numMissiles == numMissiles then
		return
	end

	if numMissiles == 0 then

		self:SetLayerVisible( false, self.layers.INCOMING_MISSILE_EFFECT )
		self:SetLayerVisible( false, self.layers.INCOMING_MISSILE_TEXT )

	else

	    self:SetLayerVisible( true, self.layers.INCOMING_MISSILE_EFFECT )

		if numMissiles > 1 then

			self:SetLayerVisible( true, self.layers.INCOMING_MISSILE_TEXT )

    		local strVal = tostring( numMissiles )
    		self:SetText( strVal, self.layers.INCOMING_MISSILE_TEXT )		

		else
			self:SetLayerVisible( false, self.layers.INCOMING_MISSILE_TEXT )
		end

	end

	self.numMissiles = numMissiles

end


--
function UI.HudWarningsWnd:UpdateDetectedBomb( myShip, threatAnalyzerLevel )

	local bombDetected = false

	if threatAnalyzerLevel >= 2 then
		bombDetected = _G.CL_HasDetectedBomb( myShip )
	end

	if self.bombDetected == bombDetected then
		return
	end

	self:SetLayerVisible( bombDetected, self.layers.BOMB_DETECTED_EFFECT )

	self.bombDetected = bombDetected

end


--
function UI.HudWarningsWnd:UpdateDisableEffects( myShip )

	local swarm = ( myShip and myShip:IsRemoteSwarmMode() ) and myShip:GetSwarm()
	
	-- приоритет таймеров и ворнингов:
	-- SC-111359#focus=streamItem-4-576913.0-0

	local bHasSwarmEmergencyTimer = false
	if swarm and swarm:GetEmergencyTimer() ~= -1 then
		bHasSwarmEmergencyTimer = true
	end

	local bHasLeaveTimer = myShip and myShip:GetBattlefieldLeaveTimer() ~= -1
	
	local bHasLeaveSwarmControlZoneTimer = false
	if swarm and swarm:GetControlZoneLeaveTimer() ~= -1 then
		bHasLeaveSwarmControlZoneTimer = true
	end

	-- когда показывается таймер покидания поля боя или покадания зоны контроля свормом (#0105268(0488041)), то эффект для ауры STUN/STASIS не показывается,
	-- потому что они выглядят абсолютно одинаково, и таймер покидания имеет приоритет
	local bDisableAllSystems = not bHasSwarmEmergencyTimer and not bHasLeaveTimer and not bHasLeaveSwarmControlZoneTimer and ( self.auras[ ai.Aura.STUN ] == true or self.auras[ ai.Aura.STASIS ] == true )

	-- когда показывается STUN или STASIS, SILENCE не показывается (т.к. STUN/STASIS включает в себя все эффекты, накладываемые SILENCE)
	local bDisableModules = not bHasLeaveTimer and not bDisableAllSystems and self.auras[ ai.Aura.SILENCE ] == true

	if bDisableAllSystems ~= self.bDisableAllSystems then

    	self.bDisableAllSystems = bDisableAllSystems

    	self:SetLayerVisible( self.bDisableAllSystems, self.layers.DISABLE_ALL_SYSTEMS_EFFECT )
    	self:SetLayerVisible( self.bDisableAllSystems, self.layers.DISABLE_ALL_SYSTEMS_TEXT )	

	end

	if bDisableModules ~= self.bDisableModules then

    	self.bDisableModules = bDisableModules

    	self:SetLayerVisible( self.bDisableModules, self.layers.DISABLE_MODULES_EFFECT )
    	self:SetLayerVisible( self.bDisableModules, self.layers.DISABLE_MODULES_TEXT )	

	end	

end


--
function UI.HudWarningsWnd:ShowMissileDestroyed()

	if not self.missileDestroyedEffect then
		return
	end

	self:SetLayerVisible( true, self.layers.MISSILE_DESTROYED_EFFECT )
	self:SetLayerVisible( true, self.layers.MISSILE_DESTROYED_TEXT )

	self.missileDestroyedEffect:RestartAnimation()	

end


--
function UI.HudWarningsWnd:HideMissileDestroyed()

	self:SetLayerVisible( false, self.layers.MISSILE_DESTROYED_EFFECT )
	self:SetLayerVisible( false, self.layers.MISSILE_DESTROYED_TEXT )

	if self.missileDestroyedEffect then
		self.missileDestroyedEffect:StopAnimation()
	end

end


--
function UI.HudWarningsWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.missileDestroyedEffect then
		self:HideMissileDestroyed()
	end

end


--
function UI.HudWarningsWnd:UpdateAuras( myShip )

	self.auras = {}

	if myShip then

    	for auraIdx = 0, myShip:GetAppliedAuraCount() - 1 do

    		local auraEnt = myShip:GetAppliedAura( auraIdx )
    		if auraEnt then

        		local spellName = auraEnt:GetSpellDefName()
        		local spellDef = UI:GetSpellDef( spellName )

    			if spellDef then

    				if type( spellDef.aura ) == "number" then
    					self.auras[ spellDef.aura ] = true
    				else
    					sys.log( "UI.HudWarningsWnd:UpdateAuras()[ERROR]: invalid type of _G.Spell[\"%s\"].aura; \"number\" expected, got \"%s\"", type( spellDef.aura ) )
    				end

    			else
    				sys.log( "UI.HudWarningsWnd:UpdateAuras()[ERROR]: cannot find def for spell %s", spellName )
    			end

    		else
    			sys.log( "UI.HudWarningsWnd:UpdateAuras()[ERROR]: no applied aura entity for ship %s auraIdx %d", myShip:GetName(), auraIdx )
    		end

    	end	

	end

end