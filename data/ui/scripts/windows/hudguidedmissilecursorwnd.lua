-- ----------------------------------------------------------------------------
--
-- Workfile: hudguidedmissilecursorwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudGuidedMissileCursorWnd = {}
local hc = UI.HudGuidedMissileCursorWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudGuidedMissileCursorWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudGuidedMissileCursorWnd",
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
				defName 			= "hud_guidedMissileCursor_main",
				defaultAnimation	= "idle",
			}}
		},   

		-- TRAIL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},   

		-- AIM_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_guidedMissileCursor_aim",
				defaultAnimation	= "idle",
			}}
		},   
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------


-- ------------------------------
-- const
-- ------------------------------

hc.layers =
{
	MAIN_EFFECT						= 0,
	TRAIL_EFFECT					= 1,
	AIM_EFFECT						= 2,
}

hc.effectInfo =
{
	main =
	{
		trailItemObjPrefix	= "cursor",
	},

	trail =
	{
		effectName	= "hud_guidedMissileCursor_trail",
		animIdle	= "idle",
	},
}

-- ------------------------------
-- vars
-- ------------------------------

hc.trail						= {}
hc.maxTrailItems				= 0
hc.minTrailColor 				= 0
hc.maxTrailColor 				= 0
hc.centerScreenPos				= Vec2( 1024*0.5, 768*0.5 )
hc.aimRadius_abs				= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudGuidedMissileCursorWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitTrail()
	self:UpdateAbsVals()

end


--
function UI.HudGuidedMissileCursorWnd:InitTrail()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if not mainEffect then
		return
	end

	local pool = self:GetEffectsPool( self.layers.TRAIL_EFFECT )
	local handle = self:GetUiHandle()


	local idx = 1
	while true do

		local objName = string.format( "%s%d", self.effectInfo.main.trailItemObjPrefix, idx )
		local objId = mainEffect:GetObjIdByName( objName )

		if objId == -1 then
			break
		end

		local item = {}

		item.pos_rel	= Vec2( 0, mainEffect:GetObjPosById( objId ).y )

		local locatorSize = mainEffect:GetObjSizeById( objId )
		item.radius_rel	= locatorSize.x * 0.5

		local effect = pool:AddEffect( self.effectInfo.trail.effectName, handle )
		if effect then

			local selfSize = effect:GetObjSize( "self" )

			local scale = locatorSize.x / selfSize.x
			effect:SetScale( UI:Vec2( scale, scale ) )

		end		

		table.insert( self.trail, item )
		idx = idx + 1

	end	

	self.maxTrailItems = #self.trail
	if self.maxTrailItems > 0 then

		local firstObjName = string.format( "%s%d", self.effectInfo.main.trailItemObjPrefix, 1 )
		self.minTrailColor = mainEffect:GetObjColor( firstObjName )

		local lastObjName = string.format( "%s%d", self.effectInfo.main.trailItemObjPrefix, self.maxTrailItems )
		self.maxTrailColor = mainEffect:GetObjColor( lastObjName )		

	end

end


--
function UI.HudGuidedMissileCursorWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:FullUpdate()

end


--
function UI.HudGuidedMissileCursorWnd:FullUpdate()

	local ship = UI.HudWnd.myShip
	local missile = ship and ship:GetGuidedMissile()

	if not missile or missile:IsDead() then
		self:AddStyle( UI.WS_NOT_DRAW )
		return		
	end

	self:RemoveStyle( UI.WS_NOT_DRAW )	
	self:UpdateAimAndTrail()

end


--
function UI.HudGuidedMissileCursorWnd:UpdateAimAndTrail()

	-- aim

	local aimX, aimY = _G.CL_GetLocalPlayerControllerMouseState()

	local halfScreenWidth_abs	= UI.screenWidth * 0.5
	local halfScreenHeight_abs	= UI.screenHeight * 0.5

	local aimDistX_abs = aimX * halfScreenWidth_abs
	local aimDistY_abs = aimY * halfScreenHeight_abs

	local aimX_abs = halfScreenWidth_abs + aimDistX_abs
	local aimY_abs = halfScreenHeight_abs - aimDistY_abs

	local aimEffect = UI:GetEffectFromLayer( self, self.layers.AIM_EFFECT )
	if aimEffect then
		aimEffect:SetScreenPos( UI:PtToRel( UI:Vec2( aimX_abs, aimY_abs ) ) )
	end


	-- trail

	-- detect num visible trail items

	local aimDist_abs = UI:V2Length( UI:Vec2( aimDistX_abs, aimDistY_abs ) )

	local numTrailItems = 0
	for idx = 1, self.maxTrailItems do

		local item = self.trail[ idx ]
		local minItemToAimDist_abs = item.radius_abs + self.aimRadius_abs

		if aimDist_abs - item.pos_abs.y < minItemToAimDist_abs then
			break
		end

		numTrailItems = idx

	end

	local trailPool = self:GetEffectsPool( self.layers.TRAIL_EFFECT )

	local angle = -( math.atan2( aimDistY_abs, aimDistX_abs ) + math.pi * 0.5 ) 	-- начальное положение эффекта  90 градусов по часовой стрелке
	local s = math.sin( angle )
	local c = math.cos( angle )

	for idx = 1, numTrailItems do

		local item = self.trail[ idx ]
		local effect = trailPool:GetEffectById( idx - 1 )

		if effect then

			-- visibility
			trailPool:SetEffectVisible( idx - 1, true )

    		-- position
    		local pos_abs = UI:Rotate2_sc( item.pos_abs, s, c, 0, 0 )

    		pos_abs.x = pos_abs.x + halfScreenWidth_abs
    		pos_abs.y = pos_abs.y + halfScreenHeight_abs
    		
    		effect:SetScreenPos( UI:PtToRel( pos_abs ) )

    		-- color
    		local color = _G.UI_LerpColor( self.minTrailColor, self.maxTrailColor, ( idx - 1 ) / numTrailItems ) 
    		effect:SetColor( color )

		end

	end	

	for idx = numTrailItems + 1, self.maxTrailItems do
		trailPool:SetEffectVisible( idx - 1, false )
	end

end


--
function UI.HudGuidedMissileCursorWnd:UpdateAbsVals()

	for idx, item in ipairs( self.trail ) do
		item.pos_abs	= UI:Vec2CopyStable( UI:PtToAbs( item.pos_rel ) )
		item.radius_abs	= UI:XToAbs( item.radius_rel )
	end

	local aimEffect = UI:GetEffectFromLayer( self, self.layers.AIM_EFFECT )
	if aimEffect then
		self.aimRadius_abs = UI:XToAbs( aimEffect:GetObjSize( "self" ).x * 0.5 )
	end

end


--
function UI.HudGuidedMissileCursorWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:UpdateAbsVals()

end


--
function UI.HudGuidedMissileCursorWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.WARNING_DISABLE_LOCK_TEXT_OUTL or layerIdx == self.layers.WARNING_DISABLE_LOCK_TEXT then

		local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
		_G.SetTextPixelSnapping( false, false )
		
		self:DrawLayer( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ), layerIdx )
		
		_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )
	
	end

end