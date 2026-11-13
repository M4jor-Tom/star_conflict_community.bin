-- ----------------------------------------------------------------------------
--
-- Workfile: hudpredictionwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.PredictionWnd = {}
local hp = UI.PredictionWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.PredictionWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PredictionWnd",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
		rectAbs		= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "hud_prediction_main",
				defaultAnimation	= "idle",
			}}
		},   

		-- TRAIL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_prediction_trail",
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
	}
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.PredictionWnd:GetCircleRect()

	local rect = nil

	if not self:IsOnScreen() then
		return rect
	end

	if self:HasStyle( UI.WS_NOT_DRAW ) then
		return rect
	end

	rect = UI:ZeroQuat()

	local pos = self.mainEffect:GetPos()
	rect.x = pos.x + self.center.x - self.circleSz.x * 0.5
	rect.y = pos.y + self.center.y - self.circleSz.y * 0.5
	rect.z = self.circleSz.x
	rect.w = self.circleSz.y

	return rect

end


-- вызывается из cpp кода - коллбэк на изменение значения cvar-переменной sv_hudPredictionVisible
function UI.PredictionWnd:OnHudPredictionVisibleChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateLockVisibilityMode()

end


--
function UI.PredictionWnd:OnPredictionColorOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateColor()

end


-- ------------------------------
-- const
-- ------------------------------

hp.layers =
{
    MAIN_EFFECT			= 0,
	TRAIL_EFFECT		= 1,
	DEBUG				= 2,
}

hp.effectInfo =
{
	main =
	{
		centerObjName 		= "center",
		animActive			= "idle",
		animInactive		= "idle_2",		
		animActiveLocked	= "lock",
		animInactiveLockd	= "lock_2",
		animActiveWeakness	= "lock_2_1",
		animInactiveWeakness= "lock_2_2",
	},

	trail =
	{
		animActive		= "idle",
		animInactive	= "idle_grey",
	}					
}

hp.alg = 2

-- TODO: должно быть прописано в каком-нибудь эффекте?
hp.LOCK_RADIUS = 10			-- расстояние до марки залоченного объекта, на котором перестает рисоваться трэйл предикшена

-- ------------------------------
-- vars
-- ------------------------------

hp.center							= Vec2( 0, 0 )
hp.lockRadius_abs					= 0
hp.circleSz							= Vec2( 0, 0 )
hp.bLockVisibility					= false
hp.animIdTrailActive				= -1
hp.animIdTrailInactive				= -1
hp.animIdMainActive					= -1
hp.animIdMainInactive				= -1
hp.animIdMainActiveLocked			= -1
hp.animIdMainInactiveLocked			= -1
hp.animIdMainActiveWeakness			= -1
hp.animIdMainInactiveWeakness		= -1
hp.color							= UI.WHITE_COLOR
hp.bOculus							= cvars.g_oculusVR ~= 0		-- при изменении этого сивара вызывается перезагрузка ресурсов ui, так что достаточнго узнать его значение один раз, при инициализации окна
hp.oculusRect						= Quat( 0, 0, 0, 0 )
hp.predictedPos_world				= Vec3( 0, 0, 0 )
hp.targetPos_world					= Vec3( 0, 0, 0 )
hp.predictedPos_abs					= Vec3( 0, 0, 0 )
hp.targetPos_abs					= Vec3( 0, 0, 0 )
hp.mainEffect						= nil
hp.trailEffect						= nil
hp.trailLengthMin					= 0
hp.trailLengthMax					= 0
hp.trailHeight						= 0

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.PredictionWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.oculusRect			= Quat( 0, 0, 0, 0 )
	self.predictedPos_world	= Vec3( 0, 0, 0 )
	self.targetPos_world	= Vec3( 0, 0, 0 )
	self.predictedPos_abs	= Vec3( 0, 0, 0 )
	self.targetPos_abs		= Vec3( 0, 0, 0 )

	if self:IsPrototype() then
		return
	end

	self:PrepareLayout()
	self:UpdateColor()
	self:UpdateAbsVals()

end


--
function UI.PredictionWnd:PrepareLayout()

	self.mainEffect				= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.trailEffect			= UI:GetEffectFromLayer( self, self.layers.TRAIL_EFFECT )

	self.center						= self.mainEffect:GetObjPos( self.effectInfo.main.centerObjName )
	self.circleSz					= self.mainEffect:GetObjSize( "self" )
	self.animIdMainActive			= self.mainEffect:GetAnimationId( self.effectInfo.main.animActive )
	self.animIdMainInactive			= self.mainEffect:GetAnimationId( self.effectInfo.main.animInactive )
	self.animIdMainActiveLocked		= self.mainEffect:GetAnimationId( self.effectInfo.main.animActiveLocked )
	self.animIdMainInactiveLocked	= self.mainEffect:GetAnimationId( self.effectInfo.main.animInactiveLockd )
	self.animIdMainActiveWeakness	= self.mainEffect:GetAnimationId( self.effectInfo.main.animActiveWeakness )
	self.animIdMainInactiveWeakness	= self.mainEffect:GetAnimationId( self.effectInfo.main.animInactiveWeakness )

	self.animIdTrailActive		= self.trailEffect:GetAnimationId( self.effectInfo.trail.animActive )
	self.animIdTrailInactive	= self.trailEffect:GetAnimationId( self.effectInfo.trail.animInactive )

	local trailSize = self.trailEffect:GetObjSize( "self" )

	self.trailLengthMin			= 0
	self.trailLengthMax			= trailSize.x
	self.trailHeight			= trailSize.y

end


--
function UI.PredictionWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	
	self:FullUpdate( dt_sys )

end


--
function UI.PredictionWnd:FullUpdate( dt_sys )

	self:AddStyle( UI.WS_NOT_DRAW )

	if self.bLockVisibility then
		return
	end

	local myShip, targetObj, bLocked = self:GetObjects()

	if not myShip or not targetObj then
		return
	end

	if not targetObj.GetEstimatePos then
		return				
	end

	if not _G.CL_IsInVision( targetObj ) then
		return		
	end

    UI:Vec3CopyInplace( UI:Vec3( _G.GetEntityChestPos3( targetObj ) ), self.targetPos_world )

	local eta = myShip:GetWeaponETA( self.targetPos_world )
	self.predictedPos_world = targetObj:GetEstimatePos( eta )

	eta = myShip:GetWeaponETA( self.predictedPos_world )
	self.predictedPos_world = targetObj:GetEstimatePos( eta )

	UI:Vec3CopyInplace( UI:Vec3( _G.ProjectPointToScreen( self.predictedPos_world ) ), self.predictedPos_abs )

	if self.predictedPos_abs.z <= 0 then
		return
	end   

	self:RemoveStyle( UI.WS_NOT_DRAW )


    UI:Vec3CopyInplace( UI:Vec3( _G.ProjectPointToScreen( self.targetPos_world ) ), self.targetPos_abs )
	self:SetLayerVisible( self.targetPos_abs.z > 0, self.layers.TRAIL_EFFECT )

	-- позиция

	self:RecalcLayout()

	-- анимация

	local efficiency = myShip:CalcShotEfficiency( targetObj )
	local animId = -1

	if bLocked then

		local bWeakness = false

		local weaknessRadius = UI:GetShipWeaknessAreaRadius( targetObj:GetDefName() )
		if weaknessRadius ~= 0 then

			local myPos = UI:Vec3( _G.GetEntityChestPos3( myShip ) )

			if UI:VLengthSq( UI:Vec3Sub( myPos, self.predictedPos_world ) ) < weaknessRadius * weaknessRadius then
				bWeakness = true
			end

		end

		if bWeakness then
			animId = efficiency > 0 and self.animIdMainActiveWeakness or self.animIdMainInactiveWeakness
		else
			animId = efficiency > 0 and self.animIdMainActiveLocked or self.animIdMainInactiveLocked
		end
		
	else
		animId = efficiency > 0 and self.animIdMainActive or self.animIdMainInactive
	end

	if self.mainEffect:GetCurAnimationId() ~= animId then
		self.mainEffect:StartAnimationById( animId )
	end

	if self:IsLayerVisible( self.layers.TRAIL_EFFECT ) then

    	local trailAnimId = efficiency > 0 and self.animIdTrailActive or self.animIdTrailInactive	

    	if curTrailAnimId ~= self.trailEffect:GetCurAnimationId() then

			local animTime = self.trailEffect:GetAnimationTime()

    		self.trailEffect:StartAnimationById( trailAnimId )

			self.trailEffect:SetAnimationTime( animTime )
			self.trailEffect:UpdateAnimation()

    	end

	end

	if self.bOculus then
		self:CalcOculusRect()
	end

end


-- для перегрузки дочерними классами
function UI.PredictionWnd:GetObjects()

	-- myShip, targetObj, bLocked
	return nil, nil, false

end


--
function UI.PredictionWnd:RecalcLayout()

	local predictedPos_rel = UI:PtToRel( self.predictedPos_abs )

	self.mainEffect:SetScreenPos( UI:Vec2( predictedPos_rel.x - self.center.x, predictedPos_rel.y - self.center.y ) )

	if self:IsLayerVisible( self.layers.TRAIL_EFFECT ) then

    	local dir_abs = UI:Vec2( self.targetPos_abs.x - self.predictedPos_abs.x, self.targetPos_abs.y - self.predictedPos_abs.y )
    	local dist_abs = UI:V2Length( dir_abs )
    	dist_abs = math.max( dist_abs - self.lockRadius_abs, 0 )

		local trailLength_rel = UI:XToRel( dist_abs )
		local trailLength_rel = UI:Clamp( trailLength_rel, self.trailLengthMin, self.trailLengthMax )

		-- время анимации

		local trailAnimTime = ( trailLength_rel - self.trailLengthMin ) / ( self.trailLengthMax - self.trailLengthMin )

		self.trailEffect:SetAnimationTime( trailAnimTime )
		self.trailEffect:UpdateAnimation()

		-- позиция		

		local trailPos_rel = UI:Vec2( predictedPos_rel.x, predictedPos_rel.y - self.trailHeight * 0.5 )
		self.trailEffect:SetScreenPos( trailPos_rel )

		-- поворот

    	local angle = math.atan2( dir_abs.y, dir_abs.x )
		self.trailEffect:SetRotation( angle, UI:Vec2( 0, self.trailHeight * 0.5 ) )

	end

end


--
function UI.PredictionWnd:UpdateAbsVals()

	self.lockRadius_abs = UI:XToAbs( UI:XTo1024x768( self.LOCK_RADIUS, { x = 1280, y = 720 } ) )

end


--
function UI.PredictionWnd:F_OnResetDevice()

	self:OnResetDevice()
	self:UpdateAbsVals()

end


--
function UI.PredictionWnd:UpdateLockVisibilityMode()

	self.bLockVisibility = cvars.sv_hudPredictionVisible == 0

end


--
function UI.PredictionWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateLockVisibilityMode()
	self:UpdateColor()

end


--
function UI.PredictionWnd:UpdateColor()

	local colorId = UI.Options:GetHudOptionVal( "predictionColors" )
	local colorInfo = UI.predictionColors[ colorId ]

	local color = colorInfo and colorInfo.color or UI.WHITE_COLOR
	self:SetColor( color )

end


--
function UI.PredictionWnd:SetColor( color )

	self.color = color

	self.mainEffect:SetColor( self.color )
	self.trailEffect:SetColor( self.color )

end


--
function UI.PredictionWnd:CalcOculusRect()

	local predictedPos_rel	= UI:PtToRel( self.predictedPos_abs )
	local targetPos_rel		= UI:PtToRel( self.targetPos_abs )

	self.oculusRect.x = predictedPos_rel.x - self.circleSz.x * 0.5
	self.oculusRect.y = predictedPos_rel.y - self.circleSz.y * 0.5
	self.oculusRect.z = self.circleSz.x
	self.oculusRect.w = self.circleSz.y

	if targetPos_rel.x > self.oculusRect.x + self.oculusRect.z then
		self.oculusRect.z = targetPos_rel.x - self.oculusRect.x

	elseif targetPos_rel.x < self.oculusRect.x then
		self.oculusRect.z = ( self.oculusRect.x + self.oculusRect.z ) - targetPos_rel.x
		self.oculusRect.x = targetPos_rel.x		
	end

	if targetPos_rel.y > self.oculusRect.y + self.oculusRect.w then
		self.oculusRect.w = targetPos_rel.y - self.oculusRect.y

	elseif targetPos_rel.y < self.oculusRect.y then
		self.oculusRect.w = ( self.oculusRect.y + self.oculusRect.w ) - targetPos_rel.y
		self.oculusRect.y = targetPos_rel.y
	end	

	self:SetLayerRect( self.oculusRect, self.layers.DEBUG )

end


--
function UI.PredictionWnd:F_Draw( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight )

	if self.bOculus then
		local predictedPos_rel = UI:PtToRel( self.predictedPos_abs )
		UI.drawer:BeginVR3dDraw( self.oculusRect.x, self.oculusRect.y, predictedPos_rel.x, predictedPos_rel.y, self.oculusRect.z, self.oculusRect.w, self.predictedPos_world )
	end

	self:Draw( UI:Quat( x0, y0, width, height ), UI:Quat( clipX0, clipY0, clipWidth, clipHeight ) )
	
	if self.bOculus then
		UI.drawer:EndVRDraw()
	end

end