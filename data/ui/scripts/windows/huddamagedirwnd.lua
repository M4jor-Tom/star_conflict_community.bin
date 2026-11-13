-- ----------------------------------------------------------------------------
--
-- Workfile: huddamagedirwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudDamageDirWnd = {}
local dd = UI.HudDamageDirWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudDamageDirWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudDamageDirWnd",
		style	= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,		
		rect	= Quat( 0, 0, 1024, 768 ),
	},

	layers =
	{
		-- MAIN
		{
			layerType	= UI.LAYER_INVALID,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
		}
	}
}

-- ------------------------------
-- interface functions
-- -----------------------------

--
function UI.HudDamageDirWnd:OnPlayerGotDamage( damageVal, attackerEntityId, attackerPlayerIdx, damageFlags, worldPos )

	if not self:IsOnScreen() then
		return
	end

	if not self.bAllowed then
		return
	end

	self:TryAddItem( worldPos, damageFlags )

end


-- вызывается из окна опций при смене значения соответствующей опции
function UI.HudDamageDirWnd:OnAllowDamageDirOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateAllowed()

end


-- ------------------------------
-- UI.HudDamageDirWnd.Items
-- -----------------------------

UI.HudDamageDirWnd.Items = {}


--
UI.HudDamageDirWnd.Items.items		= {}
UI.HudDamageDirWnd.Items.firstIdx	= -1
UI.HudDamageDirWnd.Items.numItems	= 0


--
function UI.HudDamageDirWnd.Items:PushBack( item )

	local idx = self.firstIdx == -1 and 1 or self.firstIdx + self.numItems

	self.items[ idx ] = item

	self.numItems = self.numItems + 1

	if self.firstIdx == -1 then
		self.firstIdx = idx
	end	

end


--
function UI.HudDamageDirWnd.Items:PopFront()

	if self.firstIdx == -1 then
		return nil
	end

	local item = self.items[ self.firstIdx ]
	self.items[ self.firstIdx ] = nil

	self.firstIdx = self.firstIdx + 1
	self.numItems = self.numItems - 1

	if self.numItems == 0 then
		self.firstIdx = -1
	end	

	return item

end


--
function UI.HudDamageDirWnd.Items:GetCount()

	return self.numItems

end


--
function UI.HudDamageDirWnd.Items:Get( idx )

	if self.firstIdx == -1 then
		sys.log( "UI.HudDamageDirWnd.Items()[ERROR]: empty container" )
		return nil
	end

	if idx < 1 or idx > self.numItems then
		sys.log( "UI.HudDamageDirWnd.Items()[ERROR]: invalid idx" )
		return nil
	end

	return self.items[ idx + self.firstIdx - 1 ]

end


--
function UI.HudDamageDirWnd.Items:GetFront()

	return self:Get( 1 )

end


--
function UI.HudDamageDirWnd.Items:Clear()

	self.items		= {}
	self.firstIdx	= -1
	self.numItems	= 0

end


-- ------------------------------
-- const
-- -----------------------------

dd.layers =
{
	MAIN	= 0
}

dd.effectInfo =
{
	main =
	{
    	effectName		= "hud_damageDir",
    	anim			= "idle",
    	orgLocator		= "self"
	},

	colorEffect =
	{
		effectName	= "hud_objectsMark_insideShip_damageRecords",

		colorLocators =
		{
			GENERIC	= "text",
			KINETIC	= "color_2",
			EMP		= "color_3",
			THERMAL	= "color_1",
		}
	}
}

dd.MAX_EFFECTS	= 8

-- ------------------------------
-- vars
-- -----------------------------

dd.effectsPool		= {}
dd.items			= UI.HudDamageDirWnd.Items
dd.itemOrgPos		= Vec2( 0, 0 )
dd.rotCenterPos		= Vec2( 1024/2, 768/2 )
dd.bAllowed			= UI.hudOptionsDefaultVals.allowDamageDir
dd.colors			= nil

-- ------------------------------
-- work funcitons
-- -----------------------------

--
function UI.HudDamageDirWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self:InitEffectsPool()

end


--
function UI.HudDamageDirWnd:InitEffectsPool()

	local handle = self:GetUiHandle()
	for idx = 1, self.MAX_EFFECTS do

		local effect = _G.UI_SpawnEffect( self.effectInfo.main.effectName, handle )
		if effect then

			table.insert( self.effectsPool, effect )
			effect:StartAnimation( self.effectInfo.main.anim )	

		end

	end

	local effect = self.effectsPool[ 1 ]
	if effect then
		self.itemOrgPos = effect:GetObjPos( self.effectInfo.main.orgLocator )
	end

end


--
function UI.HudDamageDirWnd:InitColors()

	if self.colors then
		return
	end

	self.colors = {}

	local colorEffect = _G.UI_SpawnEffect( self.effectInfo.colorEffect.effectName, self:GetUiHandle() )
	if colorEffect then

		for damageTypeName, locatorName in pairs( self.effectInfo.colorEffect.colorLocators ) do

			local damageType = ai.DamageType[ damageTypeName ]
			if damageType then
				self.colors[ damageType ] = colorEffect:GetObjColor( locatorName )
			else
				sys.log( "UI.HudDamageDirWnd:InitColors()[ERROR]: invalid damage type name: %s", damageTypeName )
			end

		end

		_G.UI_DestroyEffect( colorEffect )

	end

end


--
function UI.HudDamageDirWnd:F_Shutdown()

	for idx = 1, self.items:GetCount() do 
		local item = self.items:Get( idx )
		_G.UI_DestroyEffect( item.effect )	
	end 
	self.items:Clear()


	for idx, effect in ipairs( self.effectsPool ) do
		_G.UI_DestroyEffect( effect )	
	end
	self.effectsPool = {}
	
end


--
function UI.HudDamageDirWnd:Reset()

	while self.items:GetCount() > 0 do

		local item = self.items:PopFront()

		item.effect:StopAnimation()
		table.insert( self.effectsPool, item.effect )

	end 

end


--
function UI.HudDamageDirWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local myShip = nil
	if self.bAllowed then
		myShip = UI.HudWnd.myShip
	end

	if not myShip then

		if self.items:GetCount() > 0 then
			self.items:Clear()		
		end
		return

	end

	if self.items:GetCount() == 0 then
		return
	end

	self:CheckRemoveExpired()
	self:UpdateRotation( myShip )
	self:UpdateEffects( dt_sys )

end


--
function UI.HudDamageDirWnd:CheckRemoveExpired()

	while self.items:GetCount() > 0 do

		local item = self.items:GetFront()

		if item.effect:IsAnimationPlaying() then
			break
		end

		self.items:PopFront()

		table.insert( self.effectsPool, item.effect )		

	end

end


--
function UI.HudDamageDirWnd:UpdateEffects( dt )

	for idx = 1, self.items:GetCount() do

		local item = self.items:Get( idx )
		item.effect:Update( dt )

	end

end


--
function UI.HudDamageDirWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.MAIN then
		self:DrawEffects()
	end

end


--
function UI.HudDamageDirWnd:DrawEffects()

	for idx = 1, self.items:GetCount() do

		local item = self.items:Get( idx )
		item.effect:Render( true )

	end

end


--
function UI.HudDamageDirWnd:GetFreeEffect()

	return table.remove( self.effectsPool )

end


--
function UI.HudDamageDirWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Reset()
	self:UpdateAllowed()
	self:InitColors()

end


--
function UI.HudDamageDirWnd:TryAddItem( worldPos, damageFlags )

	if not self.bAllowed then
		return
	end

	-- иногда позиция источника повреждения может быть неопределена
	if not worldPos then
		return
	end

	local effect = self:GetFreeEffect()	
	if not effect then
		return
	end

	local myShip = UI.HudWnd.myShip
	if not myShip then
		return
	end

	local myPos = myShip:GetPos()

	local worldDir = worldPos - myPos
	local viewDir = UI:Vec3( _G.World2View( worldDir ) )

	local item = {}
	item.worldPos		= UI:Vec3CopyStable( worldPos )
	item.effect			= effect
	item.viewDir		= UI:Vec3CopyStable( viewDir )

	local pos = UI:Vec2( self.rotCenterPos.x - self.itemOrgPos.x, self.rotCenterPos.y - self.itemOrgPos.y )
	item.effect:SetPos( pos )

	item.effect:RestartAnimation()

	local damageType = UI:DamageFlags2DamageType( damageFlags )
	local color = self.colors[ damageType ] or UI.WHITE_COLOR
	item.effect:SetColor( color )

	self.items:PushBack( item )

end



--
function UI.HudDamageDirWnd:UpdateRotation( myShip )

	for idx = 1, self.items:GetCount() do

		local item = self.items:Get( idx )

    	local myPos = myShip:GetPos()

    	local worldDir = item.worldPos - myPos
    	local viewDir = UI:Vec3( _G.World2View( worldDir ) )

		local angle = -( math.atan2( item.viewDir.y, item.viewDir.x ) - 0 )	-- начальное положение эффекта 0 градусов

		item.effect:SetRotation( angle, self.itemOrgPos )

	end

end


--
function UI.HudDamageDirWnd:UpdateAllowed()

	self.bAllowed = UI.Options:GetHudOptionVal( "allowDamageDir" )

end