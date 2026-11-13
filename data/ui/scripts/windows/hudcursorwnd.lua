-- ----------------------------------------------------------------------------
--
-- Workfile: hudcursorwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudCursorWnd = {}
local hc = UI.HudCursorWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudCursorWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudCursorWnd",
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
				defName 			= "hud_cursor_main",
				defaultAnimation	= "idle",
			}}
		},   

		-- TRAIL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},   

		-- MOUSE_CROSS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_cursor_mouseCross",
			}}
		},   

		-- AIM_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_cursor_aimMain",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "warning",
						layer		= "UI.HudCursorWnd.layers.WARNING_DISABLE_LOCK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "disintegrator_prog",
						layer		= "UI.HudCursorWnd.layers.DESINTEGRATOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "cursor",
						layer		= "UI.HudCursorWnd.layers.DISPERSION_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "cursor",
						layer		= "UI.HudCursorWnd.layers.CROSS_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "overheat",
						layer		= "UI.HudCursorWnd.layers.HEAT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "hit",
						layer		= "UI.HudCursorWnd.layers.HIT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},   

		-- WARNING_DISABLE_LOCK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_warnings_disableLock",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "text_outl",
						layer		= "UI.HudCursorWnd.layers.WARNING_DISABLE_LOCK_TEXT_OUTL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "text",
						layer		= "UI.HudCursorWnd.layers.WARNING_DISABLE_LOCK_TEXT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},  

		-- WARNING_DISABLE_LOCK_TEXT_OUTL
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
			text = "^warning_disableLock",
		}, 

		-- WARNING_DISABLE_LOCK_TEXT
		{
			layerType	= UI.LAYER_TEXT,
			layerStyle	= UI.WLS_OWNERDRAW,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =                                   
			{
   				fontName = "Small",
   			},
			text = "^warning_disableLock",
		}, 

		-- DESINTEGRATOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 	= "hud_cursor_desintegrator",
			}}
		},

		-- DISPERSION_CIRCLE
		{
			layerType	= UI.LAYER_INVALID,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
		},

		-- DISPERSION_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName = "hud_cursor_dispersion",
			}}
		},

		-- CROSS_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName = "hud_cursor_cross",
			}}
		},

		-- HEAT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_cursor_heat",
			}}
		},

		-- HIT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_cursor_hit",
				defaultAnimation	= "idle",
			}}
		},

		-- DEBUG
		{
			layerType	= UI.LAYER_TEXTURE,
			texture		= "white",
			color		= 0x66ffffff,
			visible		= false,
		}
	},
}

-- ------------------------------
-- interfaced funcions
-- ------------------------------

--
function UI.HudCursorWnd:OnGameCursorTypeOptionChanged()

	if self:IsOnScreen() then
		self:UpdateDispersionEffect()
	end

end


--
function UI.HudCursorWnd:OnGameCursorCrossTypeOptionChanged()

	if self:IsOnScreen() then
		self:UpdateCrossEffect()
	end

end


--
function UI.HudCursorWnd:OnGameCursorColorOptionChanged()

	if self:IsOnScreen() then
		self:UpdateCursorColor()
	end

end


--
function UI.HudCursorWnd:OnPlayerDidDamage( damageVal, victimEntityId, victimPlayerIdx, damageFlags )

	if self:IsOnScreen() then
		self:ShowHit()
	end

end


--
function UI.HudCursorWnd:OnApplyAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:UpdateAuras( UI.HudWnd.myShip )
	end

end


--
function UI.HudCursorWnd:OnCancelAura( spaceShipEntity, auraEntityId )

	if self:IsOnScreen() then
		self:UpdateAuras( UI.HudWnd.myShip )
	end

end


-- ------------------------------
-- const
-- ------------------------------

hc.layers =
{
    MAIN_EFFECT						= 0,
    TRAIL_EFFECT					= 1,
    MOUSE_CROSS_EFFECT				= 2,
    AIM_MAIN_EFFECT					= 3,
    WARNING_DISABLE_LOCK_EFFECT		= 4,
    WARNING_DISABLE_LOCK_TEXT_OUTL	= 5,
    WARNING_DISABLE_LOCK_TEXT		= 6,
    DESINTEGRATOR_EFFECT			= 7,
	DISPERSION_CIRCLE				= 8,
    DISPERSION_EFFECT				= 9,
	CROSS_EFFECT					= 10,
    HEAT_EFFECT						= 11,
	HIT_EFFECT						= 12,
	DEBUG							= 13,
}

hc.effectInfo =
{
	main =
	{
		trailItemObjPrefix	= "cursor",
		dispersionLocator	= "cursor",
	},

	trail =
	{
		effectName	= "hud_cursor_trail",
		animIdle	= "idle",
	},

	desintegrator =
	{
		animProgress	= "idle",
		animFull		= "ready",
	},

	mouseCross =
	{
		animIdle		= "idle",
		animCharging	= "reduction_charge",
		animCharged		= "charge"
	},

	heat =
	{
		animProgress1	= "idle",
		animProgress2	= "overheat_100",
		animWantFire	= "blink",
		animOverheat	= "cooling",
	},

	dispersion =
	{
		minRadiusLocator	= "min",
		maxRadiusLocator	= "max",
	},

	aimMain =
	{
		minBorderDistLocator	= "dist_min",
		animIdle				= "idle",
		animCannotShot			= "blink",
	}
}

hc.HEAT_PROGRESS_THRESOLD	= 0.8
hc.HEAT_WANT_FIRE_THRESHOLD	= 0.8

hc.DISPERSION_CIRCLE_WIDTH	= UI.CURSOR_CIRCLE_WIDTH

-- ------------------------------
-- vars
-- ------------------------------

hc.trail						= {}
hc.maxTrailItems				= 0
hc.minTrailAlpha 				= 0
hc.maxTrailAlpha 				= 0
hc.centerScreenPos				= Vec2( 1024*0.5, 768*0.5 )
hc.mouseCrossRadius_abs			= 0
hc.dispersionMinRadius_abs		= 0
hc.dispersionMaxRadius_abs		= 0
hc.aimMinBorderDist_abs			= 0
hc.animIdDesintegratorProgress	= -1
hc.animIdDesintegratorFull		= -1
hc.animIdMouseCrossIdle			= -1
hc.animIdMouseCrossCharging		= -1
hc.animIdMouseCrossCharged		= -1
hc.animIdHeatProgress1			= -1
hc.animIdHeatProgress2			= -1
hc.animIdHeatWantFire			= -1
hc.animIdOverheat				= -1
hc.animIdAimIdle				= -1
hc.animIdAimCannotShot			= -1
hc.dispersionRadiusX_rel		= 0
hc.aimPos_rel					= Vec2( 0, 0 )
hc.cursorColor					= UI.WHITE_COLOR
hc.desintegratorEffect			= nil
hc.mouseCrossEffect				= nil
hc.heatEffect					= nil
hc.mainEffect					= nil
hc.dispersionEffect				= nil
hc.crossEffect					= nil
hc.aimEffect					= nil
hc.hitEffect					= nil
hc.aimPos_world					= Vec3( 0, 0, 0 )
hc.bOculus						= cvars.g_oculusVR ~= 0		-- при изменении этого сивара вызывается перезагрузка ресурсов ui, так что достаточнго узнать его значение один раз, при инициализации окна
hc.oculusRect					= Quat( 0, 0, 0, 0 )
hc.aimEffectSize				= Vec2( 0, 0 )
hc.trailPool					= nil
hc.bVisible						= true
hc.bTrailVisible				= true
hc.numTrailVisibleItems			= 0
hc.bMouseCrossVisible			= true
hc.mouseCrossAnimId				= -1
hc.mouseCrossLayer				= nil
hc.mouseCrossAnimTime			= 0
hc.auras						= {}
hc.bDisableLockVisible			= true
hc.aimAnimId					= -1
hc.bDesintegratorVisible		= true
hc.desintegratorAnimId			= -1
hc.desintegratorLayer			= nil
hc.desintegratorAnimTime		= 0
hc.dispersionAnimTime			= 0
hc.bHeatVisible					= true
hc.heatAnimId					= -1
hc.heatAnimTime					= 0
hc.heatLayer					= nil
hc.shipId						= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudCursorWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.desintegratorEffect = UI:GetEffectFromLayer( self, self.layers.DESINTEGRATOR_EFFECT )
	if self.desintegratorEffect then

		self.animIdDesintegratorProgress	= self.desintegratorEffect:GetAnimationId( self.effectInfo.desintegrator.animProgress )
		self.animIdDesintegratorFull		= self.desintegratorEffect:GetAnimationId( self.effectInfo.desintegrator.animFull )

		self.desintegratorLayer				= self:GetLayer( UI.LAYER_EFFECT, self.layers.DESINTEGRATOR_EFFECT, 0 )

	end

	self.mouseCrossEffect = UI:GetEffectFromLayer( self, self.layers.MOUSE_CROSS_EFFECT )
	if self.mouseCrossEffect then

		self.animIdMouseCrossIdle		= self.mouseCrossEffect:GetAnimationId( self.effectInfo.mouseCross.animIdle )
		self.animIdMouseCrossCharging	= self.mouseCrossEffect:GetAnimationId( self.effectInfo.mouseCross.animCharging )
		self.animIdMouseCrossCharged	= self.mouseCrossEffect:GetAnimationId( self.effectInfo.mouseCross.animCharged )

		self.mouseCrossLayer			= self:GetLayer( UI.LAYER_EFFECT, self.layers.MOUSE_CROSS_EFFECT, 0 )

	end

	self.heatEffect = UI:GetEffectFromLayer( self, self.layers.HEAT_EFFECT )
	if self.heatEffect then

		self.animIdHeatProgress1	= self.heatEffect:GetAnimationId( self.effectInfo.heat.animProgress1 )
		self.animIdHeatProgress2	= self.heatEffect:GetAnimationId( self.effectInfo.heat.animProgress2 )
		self.animIdHeatWantFire		= self.heatEffect:GetAnimationId( self.effectInfo.heat.animWantFire )
		self.animIdOverheat			= self.heatEffect:GetAnimationId( self.effectInfo.heat.animOverheat )

		self.heatLayer				= self:GetLayer( UI.LAYER_EFFECT, self.layers.HEAT_EFFECT, 0 )

	end

	self.aimEffect = UI:GetEffectFromLayer( self, self.layers.AIM_MAIN_EFFECT )
	if self.aimEffect then
		self.animIdAimIdle			= self.aimEffect:GetAnimationId( self.effectInfo.aimMain.animIdle )
		self.animIdAimCannotShot	= self.aimEffect:GetAnimationId( self.effectInfo.aimMain.animCannotShot )
		self.aimEffectSize			= self.aimEffect:GetObjSize( "self" )
	end

	self.mainEffect			= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.dispersionEffect	= UI:GetEffectFromLayer( self, self.layers.DISPERSION_EFFECT )
	self.crossEffect		= UI:GetEffectFromLayer( self, self.layers.CROSS_EFFECT )	
	self.hitEffect			= UI:GetEffectFromLayer( self, self.layers.HIT_EFFECT )	

	self.trailPool = self:GetEffectsPool( self.layers.TRAIL_EFFECT )

	self:InitTrail()
	self:UpdateAbsVals()

end


--
function UI.HudCursorWnd:InitTrail()

	if not self.mainEffect then
		return
	end

	local handle = self:GetUiHandle()

	local idx = 1
	while true do

		local objName = string.format( "%s%d", self.effectInfo.main.trailItemObjPrefix, idx )
		local objId = self.mainEffect:GetObjIdByName( objName )

		if objId == -1 then
			break
		end

		local item = {}

		item.pos_rel	= Vec2( 0, self.mainEffect:GetObjPosById( objId ).y )

		local locatorSize = self.mainEffect:GetObjSizeById( objId )
		item.radius_rel	= locatorSize.x * 0.5

		local effect = self.trailPool:AddEffect( self.effectInfo.trail.effectName, handle )
		item.effect = effect

		local selfSize = effect:GetObjSize( "self" )

		local scale = locatorSize.x / selfSize.x
		effect:SetScale( UI:Vec2( scale, scale ) )

		table.insert( self.trail, item )
		idx = idx + 1

	end	

	self.maxTrailItems = #self.trail
	if self.maxTrailItems > 0 then

		local firstObjName = string.format( "%s%d", self.effectInfo.main.trailItemObjPrefix, 1 )
		self.minTrailAlpha = self.mainEffect:GetObjAlpha( firstObjName )

		local lastObjName = string.format( "%s%d", self.effectInfo.main.trailItemObjPrefix, self.maxTrailItems )
		self.maxTrailAlpha = self.mainEffect:GetObjAlpha( lastObjName )		

	end

	self.numTrailVisibleItems = self.maxTrailItems

end


--
function UI.HudCursorWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local controlMode = _G.CL_GetLocalPlayerControlMode()

	local oldShipId = self.shipId
	local ship = UI.HudWnd.myShip
	self.shipId = ship and ship:GetId() or -1

	if self.shipId ~= oldShipId then
		self:UpdateAuras( ship )
	end

	if controlMode == UI.ShipControlModes.NUM_MODES or not ship or ship:IsDead() then

		if self.bVisible then
			self:AddStyle( UI.WS_NOT_DRAW )
			self.bVisible = false
		end

		return		

	end

	if not self.bVisible then
		self:RemoveStyle( UI.WS_NOT_DRAW )
		self.bVisible = true
	end


	local mouseX = 0
	local mouseY = 0

	if controlMode == UI.ShipControlModes.FOLLOWING or controlMode == UI.ShipControlModes.COMBINED or controlMode ~= UI.ShipControlModes.ROCKET then
		mouseX, mouseY = _G.CL_GetLocalPlayerControllerMouseState()
	end	

	local bOverheat = ship:IsWeaponOverheat()

	self:UpdateTrail( controlMode, mouseX, mouseY )	
	self:UpdateMouseCrossEffect( ship, controlMode, mouseX, mouseY )
	self:UpdateAimPos( ship )
    self:UpdateDesintegrator( ship, controlMode )
    self:UpdateDispersion( ship )
    self:UpdateHeat( ship, bOverheat )
	self:UpdateAimAnimation( ship, bOverheat )

	if self.bOculus then
		self:CalcOculusRect()
	end

end


--
function UI.HudCursorWnd:UpdateTrail( controlMode, mouseX, mouseY )

	if controlMode ~= UI.ShipControlModes.FOLLOWING and controlMode ~= UI.ShipControlModes.COMBINED and controlMode ~= UI.ShipControlModes.ROCKET or self.bOculus then

		if self.bTrailVisible then
	    	self:SetLayerVisible( false, self.layers.TRAIL_EFFECT )
			self.bTrailVisible = false
		end

		return

	end

	if not self.bTrailVisible then
		self:SetLayerVisible( true, self.layers.TRAIL_EFFECT )
		self.bTrailVisible = true
	end

	local halfScreenWidth_abs	= UI.screenWidth * 0.5
	local halfScreenHeight_abs	= UI.screenHeight * 0.5

	local mouseDistX_abs = mouseX * halfScreenWidth_abs
	local mouseDistY_abs = mouseY * halfScreenHeight_abs


	-- detect num visible trail items

	local mouseDist_abs = UI:V2Length( UI:Vec2( mouseDistX_abs, mouseDistY_abs ) )

	local numTrailItems = 0
	for idx = 1, self.maxTrailItems do

		local item = self.trail[ idx ]
		local minItemToMouseDist_abs = item.radius_abs + self.mouseCrossRadius_abs

		if mouseDist_abs - item.pos_abs.y < minItemToMouseDist_abs then
			break
		end

		numTrailItems = idx

	end

	local angle = -( math.atan2( mouseDistY_abs, mouseDistX_abs ) + math.pi * 0.5 ) 	-- начальное положение эффекта  90 градусов по часовой стрелке
	local s = math.sin( angle )
	local c = math.cos( angle )

	local zeroVec2	= UI:ZeroVec2()
	local itemPos	= UI:ZeroVec2()

	for idx = 1, numTrailItems do

		local item = self.trail[ idx ]
		local effect = self.trail[ idx ].effect

		-- position
		itemPos.x = ( ( item.pos_abs.x * c - item.pos_abs.y * s ) + halfScreenWidth_abs ) * UI.abs2Rel_x
		itemPos.y = ( ( item.pos_abs.x * s + item.pos_abs.y * c ) + halfScreenHeight_abs ) * UI.abs2Rel_y		

		effect:SetScreenPos( itemPos )

		-- rotation
		effect:SetRotation( angle, zeroVec2 )

		-- color
		if numTrailItems ~= self.numTrailVisibleItems then

			local alpha = UI:Lerp( self.minTrailAlpha, self.maxTrailAlpha, ( idx - 1 ) / numTrailItems ) 
			effect:SetAlpha( alpha )

		end

	end	

	if numTrailItems ~= self.numTrailVisibleItems then

		if numTrailItems > self.numTrailVisibleItems then
			self.trailPool:SetEffectVisibleRange( self.numTrailVisibleItems, numTrailItems - 1, true )

		elseif numTrailItems < self.numTrailVisibleItems then
			self.trailPool:SetEffectVisibleRange( numTrailItems, self.numTrailVisibleItems - 1, false )
		end

		self.numTrailVisibleItems = numTrailItems

	end

end


--
function UI.HudCursorWnd:UpdateMouseCrossEffect( ship, controlMode, mouseX, mouseY )

	local chargeMax = ship:GetWeaponChargeMax()

	if chargeMax == 0 and not ship:IsWeaponRotationLimited() and not self:IsWeaponTrackModeOffset( ship ) then

		if self.bMouseCrossVisible then
			self:SetLayerVisible( false, self.layers.MOUSE_CROSS_EFFECT )
			self.bMouseCrossVisible = false
		end

		return

	end

	if not self.bMouseCrossVisible then
		self:SetLayerVisible( true, self.layers.MOUSE_CROSS_EFFECT )
		self.bMouseCrossVisible = true
	end


	-- отставание

	if controlMode ~= UI.ShipControlModes.FOLLOWING and controlMode ~= UI.ShipControlModes.COMBINED and controlMode ~= UI.ShipControlModes.ROCKET then
		-- TODO: не вызывать каждый кадр
		self.mouseCrossEffect:SetScreenPos( self.centerScreenPos )
	else

    	local halfScreenWidth_abs	= UI.screenWidth * 0.5
    	local halfScreenHeight_abs	= UI.screenHeight * 0.5

    	local mouseX_abs = halfScreenWidth_abs + mouseX * halfScreenWidth_abs
    	local mouseY_abs = halfScreenHeight_abs - mouseY * halfScreenHeight_abs

    	self.mouseCrossEffect:SetScreenPos( UI:PtToRel( UI:Vec2( mouseX_abs, mouseY_abs ) ) )

	end


	-- зарядка

	local animId		= -1
	local bUpdatable	= true
	local animTime		= 0

	if chargeMax > 0 then

		local charge = ship:GetWeaponCharge()

		if charge == 0 then
			animId = self.animIdMouseCrossIdle

		elseif math.abs( charge - chargeMax ) <= 1e-3 then
			animId = self.animIdMouseCrossCharged

		else
			animId		= self.animIdMouseCrossCharging
			bUpdatable	= false
			animTime	= charge / chargeMax
		end

	else
		animId = self.animIdMouseCrossIdle
	end

	if self.mouseCrossAnimId ~= animId then

		self.mouseCrossEffect:StartAnimationById( animId )
		self.mouseCrossLayer:SetUpdatable( bUpdatable )

		self.mouseCrossAnimId	= animId
		self.mouseCrossAnimTime	= 0

	end

    if not bUpdatable then

    	if animTime ~= self.mouseCrossAnimTime then

        	self.mouseCrossEffect:SetAnimationTimeAndUpdate( animTime )
    		self.mouseCrossAnimTime = animTime

    	end

	end

end


--
function UI.HudCursorWnd:IsWeaponTrackModeOffset( ship )

	local bTrackModeOffset = false

	local weapon = ship and ship:GetModule( ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 )
	if weapon then
		local def = UI:GetDef( weapon:GetDefName() )
		if def then
			bTrackModeOffset = def.track == ai.TrackMode.OFFSET
		end
	end

	return bTrackModeOffset

end


--
function UI.HudCursorWnd:UpdateWarningDisableLock()

	local bDisableLockVisible = self.auras[ ai.Aura.DISABLE_LOCK ] == true and not self.auras[ ai.Aura.STUN ]

	if bDisableLockVisible ~= self.bDisableLockVisible then

		self:SetLayerVisible( bDisableLockVisible, self.layers.WARNING_DISABLE_LOCK_EFFECT )
		self:SetLayerVisible( bDisableLockVisible, self.layers.WARNING_DISABLE_LOCK_TEXT_OUTL )
		self:SetLayerVisible( bDisableLockVisible, self.layers.WARNING_DISABLE_LOCK_TEXT )

		self.bDisableLockVisible = bDisableLockVisible

	end

end


--
function UI.HudCursorWnd:UpdateDesintegrator( ship, controlMode )

	local bVisible = controlMode == UI.ShipControlModes.LOCAL_TURRET or controlMode == UI.ShipControlModes.REMOTE_TURRET

	if bVisible ~= self.bDesintegratorVisible then
		self:SetLayerVisible( bVisible, self.layers.DESINTEGRATOR_EFFECT )
		self.bDesintegratorVisible = bVisible
	end 

	if not bVisible then
		return
	end

	local chargeVal	= ship:GetDisintegratorChargeValue()
	local bFull		= chargeVal == 1
	local animId	= bFull and self.animIdDesintegratorFull or self.animIdDesintegratorProgress

	if animId ~= self.desintegratorAnimId then

		self.desintegratorEffect:StartAnimationById( animId )
		self.desintegratorLayer:SetUpdatable( bFull )	

		self.desintegratorAnimId	= animId
		self.desintegratorAnimTime	= 0

	end

	if not bFull then

		if chargeVal ~= self.desintegratorAnimTime then

			self.desintegratorEffect:SetAnimationTimeAndUpdate( chargeVal )
			self.desintegratorAnimTime = chargeVal

		end

	end

end


--
function UI.HudCursorWnd:UpdateAimPos( ship )

	UI:Vec3CopyInplace( UI:Vec3( _G.CL_GetShipWeaponAimPos3( ship ) ), self.aimPos_world )

	local aimPos_abs_x, aimPos_abs_y = _G.ProjectPointToScreenClamped( self.aimPos_world, UI:Vec2( self.aimMinBorderDist_abs, self.aimMinBorderDist_abs ), UI:Vec2( UI.screenWidth - self.aimMinBorderDist_abs, UI.screenHeight - self.aimMinBorderDist_abs ) )

	self.aimPos_rel.x	= UI:XAbs2SnappedRel( aimPos_abs_x )
	self.aimPos_rel.y	= UI:YAbs2SnappedRel( aimPos_abs_y )

	self.aimEffect:SetPos( self.aimPos_rel )	

end


--
function UI.HudCursorWnd:UpdateDispersion( ship )

	local dispersion = ship:GetWeaponDispersion()

	local radius_abs = 0
	if dispersion > 0 then
		radius_abs = UI.screenHeight * 0.5 * math.tan( dispersion ) / math.tan( _G.GetCameraFovY() * 0.5 )
		radius_abs = UI:Clamp( radius_abs, self.dispersionMinRadius_abs, self.dispersionMaxRadius_abs )
	end

	-- эффекта может не быть, это законный случай (это управляется из опций)
	if self.dispersionEffect then

    	local animTime = ( radius_abs - self.dispersionMinRadius_abs ) / ( self.dispersionMaxRadius_abs - self.dispersionMinRadius_abs )

		if animTime ~= self.dispersionAnimTime then
	    	self.dispersionEffect:SetAnimationTimeAndUpdate( animTime )
			self.dispersionAnimTime = animTime
		end

	end

	-- даже если эффекта нет, вычисленное здесь значение сохраняется,
	-- потому что может быть еще круг, рисуемый методами дебажной отрисовки, который будет это значение использовать

	self.dispersionRadiusX_rel = UI:XToRel( radius_abs )

end


--
function UI.HudCursorWnd:UpdateHeat( ship, bOverheat )

	local maxHeat	= ship:GetWeaponHeatMax()
	local heat		= maxHeat > 0 and ship:GetWeaponHeat() or 0

	local bVisible = heat > 0

	if bVisible ~= self.bHeatVisible then
		self:SetLayerVisible( bVisible, self.layers.HEAT_EFFECT )
		self.bHeatVisible = bVisible
	end

	if not bVisible then
		return
	end


	local heatCf	= heat / maxHeat

	local animId		= -1
	local bUpdatable	= false
	local animTime		= 0

	if bOverheat then

		if heatCf <= self.HEAT_PROGRESS_THRESOLD then
			animId		= self.animIdOverheat
			animTime	= heatCf / self.HEAT_PROGRESS_THRESOLD
		else
			animId		= self.animIdOverheat
			animTime	= 1
		end

	else

		if heatCf <= self.HEAT_PROGRESS_THRESOLD then

			animId		= self.animIdHeatProgress1
			animTime	= heatCf / self.HEAT_PROGRESS_THRESOLD

		else

			if heatCf > self.HEAT_WANT_FIRE_THRESHOLD and not bOverheat and ship:IsWantFire() then
				animId		= self.animIdHeatWantFire
				bUpdatable	= true
			else
				animId		= self.animIdHeatProgress2
				animTime	= ( heatCf - self.HEAT_PROGRESS_THRESOLD ) / ( 1 - self.HEAT_PROGRESS_THRESOLD )
			end

		end

	end

	if animId ~= self.heatAnimId then

		self.heatEffect:StartAnimationById( animId )
		self.heatLayer:SetUpdatable( bUpdatable )

		self.heatAnimId		= animId
		self.heatAnimTime	= 0
		
	end

	if not bUpdatable then

		if animTime ~= self.heatAnimTime then
			self.heatEffect:SetAnimationTimeAndUpdate( animTime )
			self.heatAnimTime = animTime
		end

	end

end


--
function UI.HudCursorWnd:UpdateAimAnimation( ship, bOverheat )

	local bCanShot =
		not( self.auras[ ai.Aura.SILENCE ] or self.auras[ ai.Aura.STUN ] or self.auras[ ai.Aura.STASIS ] )
		and not bOverheat

	local animId = bCanShot and self.animIdAimIdle or self.animIdAimCannotShot

	if animId ~= self.aimAnimId then
		self.aimEffect:StartAnimationById( animId )
		self.aimAnimId = animId
	end

end


--
function UI.HudCursorWnd:UpdateAbsVals()

	for idx, item in ipairs( self.trail ) do
		item.pos_abs	= UI:Vec2CopyStable( UI:PtToAbs( item.pos_rel ) )
		item.radius_abs	= UI:XToAbs( item.radius_rel )
	end

	if self.mouseCrossEffect then
		self.mouseCrossRadius_abs = UI:XToAbs( self.mouseCrossEffect:GetObjSize( "self" ).x * 0.5 )
	end

	if self.dispersionEffect then
		self.dispersionMinRadius_abs = UI:XToAbs( self.dispersionEffect:GetObjSize( self.effectInfo.dispersion.minRadiusLocator ).x )
		self.dispersionMaxRadius_abs = UI:XToAbs( self.dispersionEffect:GetObjSize( self.effectInfo.dispersion.maxRadiusLocator ).x )
	end

	if self.aimEffect then
		self.aimMinBorderDist_abs = UI:XToAbs( self.aimEffect:GetObjSize( self.effectInfo.aimMain.minBorderDistLocator ).x )
	end

end


--
function UI.HudCursorWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:UpdateAbsVals()

end


--
function UI.HudCursorWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	if self.bOculus then
		UI.drawer:BeginVR3dDraw( self.oculusRect.x, self.oculusRect.y, self.aimPos_rel.x, self.aimPos_rel.y, self.oculusRect.z, self.oculusRect.w, self.aimPos_world )
	end

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )

	if self.bOculus then
		UI.drawer:EndVRDraw()
	end

end


--
function UI.HudCursorWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.WARNING_DISABLE_LOCK_TEXT_OUTL or layerIdx == self.layers.WARNING_DISABLE_LOCK_TEXT then

		local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
		_G.SetTextPixelSnapping( false, false )
		
		self:DrawLayer( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ), layerIdx )
		
		_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )

	elseif layerIdx == self.layers.DISPERSION_CIRCLE then

		local alpha = 255
		if self.dispersionEffect then
			alpha = self.dispersionEffect:GetAlpha()
		end

		UI.drawer:DrawCircle( self.aimPos_rel.x, self.aimPos_rel.y, self.dispersionRadiusX_rel, self.DISPERSION_CIRCLE_WIDTH, self.cursorColor, alpha / 255 )

	end

end


--
function UI.HudCursorWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateDispersionEffect()
	self:UpdateCrossEffect()
	self:UpdateCursorColor()

	self:SetLayerVisible( false, self.layers.HIT_EFFECT )

	self.shipId = -1
	self:UpdateAuras( nil )

end


--
function UI.HudCursorWnd:UpdateDispersionEffect()

	local effectsPool = self:GetEffectsPool( self.layers.DISPERSION_EFFECT )
	if not effectsPool then
		return
	end

	local oldEffect = effectsPool:GetNumEffects() > 0 and effectsPool:GetEffectById( 0 )
	local oldEffectName = oldEffect and oldEffect:GetName() or ""
	local effect = oldEffect

	local typeId = UI.Options:GetHudOptionVal( "cursorTypes" )
	local typeInfo = UI.gameCursorTypes[ typeId ]
	local effectName = typeInfo and typeInfo.effect or ""
	local anim = typeInfo and typeInfo.animation or ""

	if effectName ~= oldEffectName then

    	effectsPool:Clear()

    	if effectName ~= "" then		
    		effect = effectsPool:AddEffect( effectName, self:GetUiHandle() )
    	end

	end

	if effect and anim ~= "" and effect:GetCurAnimation() ~= anim then
		effect:StartAnimation( anim )
	end

	self.dispersionEffect = effect

	if self.dispersionEffect then

		self.dispersionMinRadius_abs = UI:XToAbs( self.dispersionEffect:GetObjSize( self.effectInfo.dispersion.minRadiusLocator ).x )
		self.dispersionMaxRadius_abs = UI:XToAbs( self.dispersionEffect:GetObjSize( self.effectInfo.dispersion.maxRadiusLocator ).x )

		self.dispersionEffect:SetColor( self.cursorColor )

	end

	local bIsCircle = typeInfo.isCircle
	if bIsCircle == nil then
		bIsCircle = true
	end

	self:SetLayerVisible( bIsCircle, self.layers.DISPERSION_CIRCLE )

end


--
function UI.HudCursorWnd:UpdateCrossEffect()

	local effectsPool = self:GetEffectsPool( self.layers.CROSS_EFFECT )
	if not effectsPool then
		return
	end

	local oldEffect = effectsPool:GetNumEffects() > 0 and effectsPool:GetEffectById( 0 )
	local oldEffectName = oldEffect and oldEffect:GetName() or ""
	local effect = oldEffect

	local typeId = UI.Options:GetHudOptionVal( "cursorCrossTypes" )
	local typeInfo = UI.gameCursorCrossTypes[ typeId ]
	local effectName = typeInfo and typeInfo.effect or ""
	local anim = typeInfo and typeInfo.animation or ""

	if effectName ~= oldEffectName then

    	effectsPool:Clear()

    	if effectName ~= "" then		
    		effect = effectsPool:AddEffect( effectName, self:GetUiHandle() )
    	end

	end

	if effect and anim ~= "" and effect:GetCurAnimation() ~= anim then
		effect:StartAnimation( anim )
	end

	self.crossEffect = effect

	if self.crossEffect then
		self.crossEffect:SetColor( self.cursorColor )
	end

end


--
function UI.HudCursorWnd:UpdateCursorColor()

	local colorId = UI.Options:GetHudOptionVal( "cursorColors" )
	local colorInfo = UI.gameCursorColors[ colorId ]

	self.cursorColor = colorInfo and colorInfo.color or UI.WHITE_COLOR

	if self.dispersionEffect then
		self.dispersionEffect:SetColor( self.cursorColor )
	end

	if self.crossEffect then
		self.crossEffect:SetColor( self.cursorColor )
	end

	if self.mouseCrossEffect then
		self.mouseCrossEffect:SetColor( self.cursorColor )
	end

end


--
function UI.HudCursorWnd:CalcOculusRect()

	self.oculusRect.x = self.aimPos_rel.x - self.aimEffectSize.x * 0.5
	self.oculusRect.y = self.aimPos_rel.y - self.aimEffectSize.y * 0.5
	self.oculusRect.z = self.aimEffectSize.x
	self.oculusRect.w = self.aimEffectSize.y

--[[

	local centerScreenPos = UI:Vec2( 1024 * 0.5, 768 * 0.5 )

	if centerScreenPos.x > self.oculusRect.x + self.oculusRect.z then
		self.oculusRect.z = centerScreenPos.x - self.oculusRect.x

	elseif centerScreenPos.x < self.oculusRect.x then
		self.oculusRect.z = ( self.oculusRect.x + self.oculusRect.z ) - centerScreenPos.x
		self.oculusRect.x = centerScreenPos.x		
	end

	if centerScreenPos.y > self.oculusRect.y + self.oculusRect.w then
		self.oculusRect.w = centerScreenPos.y - self.oculusRect.y

	elseif centerScreenPos.y < self.oculusRect.y then
		self.oculusRect.w = ( self.oculusRect.y + self.oculusRect.w ) - centerScreenPos.y
		self.oculusRect.y = centerScreenPos.y
	end	
]]

--	self:SetLayerRect( self.oculusRect, self.layers.DEBUG )

end


--
function UI.HudCursorWnd:ShowHit()

	self:SetLayerVisible( true, self.layers.HIT_EFFECT )
	self.hitEffect:RestartAnimation()

end


--
function UI.HudCursorWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.hitEffect then
		self:SetLayerVisible( false, self.layers.HIT_EFFECT )
	end

end


--
function UI.HudCursorWnd:UpdateAuras( myShip )

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
    					sys.log( "UI.HudCursorWnd:UpdateAuras()[ERROR]: invalid type of _G.Spell[\"%s\"].aura; \"number\" expected, got \"%s\"", type( spellDef.aura ) )
    				end

    			else
    				sys.log( "UI.HudCursorWnd:UpdateAuras()[ERROR]: cannot find def for spell %s", spellName )
    			end

    		else
    			sys.log( "UI.HudCursorWnd:UpdateAuras()[ERROR]: no applied aura entity for ship %s auraIdx %d", myShip:GetName(), auraIdx )
    		end

    	end	

	end

	self:OnAurasChanged()

end


--
function UI.HudCursorWnd:OnAurasChanged()

	self:UpdateWarningDisableLock()

	-- UpdateAimAnimation() не вызывается, т.к. она и так вызывается каждый кадр

end