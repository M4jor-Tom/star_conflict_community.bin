-- ----------------------------------------------------------------------------
--
-- Workfile: synergybarwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.SynergyBarWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.SynergyBarWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "SynergyBarWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
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
				defName 			= "synergyBar_main",
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

-- ---------------------------
-- interface functions
-- ---------------------------

--
function UI.SynergyBarWnd:Setup( curLevel, maxLevel )

	if type( curLevel ) ~= "number" then
		sys.log( "UI.SynergyBarWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"curLevel\"); \"number\" expected, got \"%s\"", type( curLevel ) )
		curLevel = 0
	end

	if type( maxLevel ) ~= "number" then
		sys.log( "UI.SynergyBarWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"maxLevel\"); \"number\" expected, got \"%s\"", type( maxLevel ) )
		maxLevel = 1
	end

	if curLevel < 0 then
		sys.log( "UI.SynergyBarWnd:Setup()[ERROR]: invalid curLevel: %d", curLevel )
		curLevel = 0
	end

	if maxLevel <= 0 then
		sys.log( "UI.SynergyBarWnd:Setup()[ERROR]: invalid maxLevel: %d", maxLevel )
		maxLevel = 1
	end

	self.curLevel	= curLevel
	self.maxLevel	= maxLevel

	self:FullUpdate()

end


-- ---------------------------
-- const
-- ---------------------------

UI.SynergyBarWnd.layers =
{
	MAIN_EFFECT	= 0,
}

UI.SynergyBarWnd.effectInfo =
{
	main =
	{
		firstSegmentLocator		= "seg_1",
		secondSegmentLocator	= "seg_2",
	},

	segment =
	{	
		animActive		= "idle_1",
		animInactive	= "idle_2",
		maxSizeLocator	= "self",
		minSizeLocator	= "dist_min"
	}
}

-- ---------------------------
-- vars
-- ---------------------------

UI.SynergyBarWnd.curLevel			= 0
UI.SynergyBarWnd.maxLevel			= 0
UI.SynergyBarWnd.segmentWnds		= nil

-- ---------------------------
-- work functions
-- ---------------------------

--
function UI.SynergyBarWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.segmentWnds = {}

end


--
function UI.SynergyBarWnd:Reset()

	self.curLevel	= 0
	self.maxLevel	= 0

	self:ResetSegments()

end


--
function UI.SynergyBarWnd:ResetSegments()

	for i = 1, #self.segmentWnds do

		self.segmentWnds[ i ]:UnlinkFromParent()

	end

end


--
function UI.SynergyBarWnd:FullUpdate()

	self:CreateSegments()

	self:UpdateSegmetsAnimations()

end


--
function UI.SynergyBarWnd:CreateSegments()

	self:RecalcLayout()

end


--
function UI.SynergyBarWnd:RecalcLayout()

	local numSegments = self.maxLevel

	local mainEffefct = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	local firstLocatorPos = mainEffefct:GetObjPos( self.effectInfo.main.firstSegmentLocator ) or Vec2( 0, 0 )
	local secondLocatorPos = mainEffefct:GetObjPos( self.effectInfo.main.secondSegmentLocator ) or Vec2( 0, 0 )

	if self.segmentWnds[ 1 ] == nil then
		self.segmentWnds[ 1 ] = UI:CreateChildWnd( self, UI.SynergyBarSlotWnd, tostring( idx ) )
	end

	local firstSegmentEffect = UI:GetEffectFromLayer( self.segmentWnds[ 1 ], self.segmentWnds[ 1 ].layers.MAIN_EFFECT )

	local segmentMaxWidth = firstSegmentEffect and firstSegmentEffect:GetObjSize( self.effectInfo.segment.maxSizeLocator ).x or 0
	local segmentMinWidth = firstSegmentEffect and firstSegmentEffect:GetObjSize( self.effectInfo.segment.minSizeLocator ).x or 0

	local space_segments = secondLocatorPos.x - ( firstLocatorPos.x + segmentMaxWidth )

	local selfWidth = self:GetWidth()
	local segmentsWidthTotal = selfWidth - ( firstLocatorPos.x * 2 ) - space_segments * ( numSegments - 1 )
	local segmentNeedWidth = UI:Clamp( segmentsWidthTotal / numSegments, segmentMinWidth, segmentMaxWidth )

	local segmentAnimTime = ( segmentNeedWidth - segmentMinWidth ) / ( segmentMaxWidth - segmentMinWidth )

	for idx = 1, self.maxLevel do

		if self.segmentWnds[ idx ] == nil then
			self.segmentWnds[ idx ] = UI:CreateChildWnd( self, UI.SynergyBarSlotWnd, tostring( idx ) )
		end

		if self:GetParent() == UI.EquipmentShipUpgradeWnd then
			self.segmentWnds[ idx ].level = idx - 1
			self.segmentWnds[ idx ]:RemoveStyle( UI.WS_NOT_MOUSE_REACT )
		end

		self.segmentWnds[ idx ]:SetTop( firstLocatorPos.y )

		local x = firstLocatorPos.x + ( idx - 1 ) * ( segmentNeedWidth + space_segments )
		self.segmentWnds[ idx ]:SetLeft( x )

		self.segmentWnds[ idx ]:SetWidth( segmentNeedWidth )

		local mainEffefct = UI:GetEffectFromLayer( self.segmentWnds[ idx ], self.segmentWnds[ idx ].layers.MAIN_EFFECT )
		mainEffefct:SetAnimationTime( segmentAnimTime )
		mainEffefct:Update( 0 )

		self:AddChild( self.segmentWnds[ idx ] )

	end

	for i = self.maxLevel + 1, #self.segmentWnds do

		self.segmentWnds[ i ]:UnlinkFromParent()

	end

end


--
function UI.SynergyBarWnd:UpdateSegmetsAnimations()

	for idx = 1, self.maxLevel do

		if self.segmentWnds[ idx ] then

			local effect = UI:GetEffectFromLayer( self.segmentWnds[ idx ], self.segmentWnds[ idx ].layers.MAIN_EFFECT )

			if effect then

				local prevAnimTime = effect:GetAnimationTime()
				local anim = ( idx ) <= self.curLevel and self.effectInfo.segment.animActive or self.effectInfo.segment.animInactive

				if anim ~= effect:GetCurAnimation() then
					effect:StartAnimation( anim )
					effect:SetAnimationTime( prevAnimTime )
					effect:Update( 0 )
				end

			end

		end

	end

end


--
function UI.SynergyBarWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:RecalcLayout()

end


--
function UI.SynergyBarWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	self:RecalcLayout()

end


--
UI.SynergyBarSlotWnd = {}

-- ---------------------------
-- window definition
-- ---------------------------

UI.SynergyBarSlotWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "SynergyBarSlotWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "synergyBar_segment",
				defaultAnimation	= "idle_1",

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


UI.SynergyBarSlotWnd.layers = 
{
	MAIN_EFFECT = 0,
}

UI.SynergyBarSlotWnd.GetTooltipData = function( self )
		if self.level and self.level ~= 0 then
			return UI.EquipmentShipUpgrade_Btn:FormatTooltip( UI.EquipmentShipUpgradeWnd:GetVessel(), self.level )
		else
			return nil
		end
	end

--
UI.SynergyBarSlotWnd.level = nil


--
function UI.SynergyBarSlotWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


--
function UI.SynergyBarSlotWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

end


--
function UI.SynergyBarSlotWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end
