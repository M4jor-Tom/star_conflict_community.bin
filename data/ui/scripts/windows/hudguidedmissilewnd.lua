-- ----------------------------------------------------------------------------
--
-- Workfile: hudmissilewnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudGuidedMissileWnd = {}
local mw = UI.HudGuidedMissileWnd

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.HudGuidedMissileWnd.def =
{
	className = "Wnd",

	props =
	{
		name			= "HudGuidedMissileWnd",
		style			= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		rectAbs			= Quat( 0, 0, 1024, 768 ),
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
				defName 			= "hud_missile_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "bg",	
						layer		= "UI.HudGuidedMissileWnd.layers.BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "value_1",
						layer		= "UI.HudGuidedMissileWnd.layers.DIST_LEFT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},  

					{
						objName		= "value_2",
						layer		= "UI.HudGuidedMissileWnd.layers.DIST_TO_TARGET",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "value_3",
						layer		= "UI.HudGuidedMissileWnd.layers.KEYTIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "value_4",
						layer		= "UI.HudGuidedMissileWnd.layers.TARGETS_IN_BLAST_ZONE",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "value14",
						layer		= "UI.HudGuidedMissileWnd.layers.BOOST_KEYTIP",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_missile_bg",
				defaultAnimation	= "idle",
			}}
		},

		-- DIST_LEFT
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- DIST_TO_TARGET
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- KEYTIP
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

		-- TARGETS_IN_BLAST_ZONE
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- BOOST_KEYTIP
		{
			layerType		= UI.LAYER_TEXT,

   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.HudGuidedMissileWnd:OnBindsChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateKeytip()
	self:UpdateBoostKeyTip()

end


-- -----------------------------------
-- const
-- -----------------------------------

mw.layers =
{
    MAIN_EFFECT				= 0,
    BG_EFFECT				= 1,
    DIST_LEFT				= 2,
    DIST_TO_TARGET			= 3,
    KEYTIP					= 4,
	TARGETS_IN_BLAST_ZONE	= 5,
	BOOST_KEYTIP			= 6,
}

mw.strMeterUnits 			= UI:GetStringByName( "meter" )
mw.strDistLeft				= UI:GetStringByName( "guidedMissile_distLeft" )
mw.strDistToTarget			= UI:GetStringByName( "guidedMissile_distToTarget" )
mw.strTargetsInBlastZone	= UI:GetStringByName( "guidedMissile_targetsInBlastZone" )

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.HudGuidedMissileWnd:Reset()

	self:SetText( "", self.layers.DIST_LEFT )
	self:SetText( "", self.layers.DIST_TO_TARGET )
	self:SetText( "", self.layers.TARGETS_IN_BLAST_ZONE )
	self:SetText( "", self.layers.KEYTIP )
	self:SetText( "", self.layers.BOOST_KEYTIP )

	-- TODO: cursor?

end


--
function UI.HudGuidedMissileWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local ship = UI.HudWnd.myShip
	local missile = ship and ship:GetGuidedMissile()

	if not missile or missile:IsDead() then
		self:Reset()
		return
	end

	self:UpdateDistLeft( ship, missile )
	self:UpdateDistToTarget( ship, missile )
	self:UpdateObjectsInBlastZone( ship, missile )

end


--
function UI.HudGuidedMissileWnd:UpdateDistLeft( ship, missile )

	local dist = missile:GetDistanceLeft()
	dist = UI:Round( dist * 10 )
	
	local text = string.format( "%s %d %s", self.strDistLeft, dist, self.strMeterUnits )

	self:SetText( text, self.layers.DIST_LEFT )

end


--
function UI.HudGuidedMissileWnd:UpdateDistToTarget( ship, missile )

	local text = ""

	local target = ship:GetTargetLock()
	if target then

		local missilePos	= UI:Vec3( _G.GetEntityChestPos3( missile ) )
		local targetPos		= UI:Vec3( _G.GetEntityChestPos3( target ) )

		local dir = UI:Vec3Sub( targetPos, missilePos )
		local dist = UI:VLength( dir )
		dist = UI:Round( dist * 10 )

		text = string.format( "%s %d %s", self.strDistToTarget, dist, self.strMeterUnits )

	end

	self:SetText( text, self.layers.DIST_TO_TARGET )

end


--
function UI.HudGuidedMissileWnd:UpdateObjectsInBlastZone( ship, missile )

	local numTargets = missile:GetPotentialBlastTargetsCount() 
	local text = string.format( "%s: %d", self.strTargetsInBlastZone, numTargets )

	self:SetText( text, self.layers.TARGETS_IN_BLAST_ZONE )

end


--
function UI.HudGuidedMissileWnd:UpdateKeytip()

	local str = UI:GetStringByName( "guidedMissile_blow" )
	local strkey = UI:GetModuleKey( ai.SpaceShipModuleSlot.SPECIAL )

	local numSubst = 0
	str, numSubst = string.gsub( str, "%$EXPLODE%$", strkey )

	if numSubst == 0 then
		sys.log( "UI.HudGuidedMissileWnd:UpdateKeytip()[ERROR]: cannot find placeholder \"$EXPLODE$\" in string \"guidedMissile_blow\"" )
		str = string.format( "[INVALID STRING] Press %s to explode", strkey )
	end

	self:SetText( str, self.layers.KEYTIP )	

end


--
function UI.HudGuidedMissileWnd:UpdateBoostKeyTip()

	local str = ""

	local ship = UI.HudWnd.myShip
	local missile = ship and ship:GetGuidedMissile()

	if missile and not missile:IsDead() and UI:IsEntityOfClass( missile, "Rocket" ) and missile:HasBoostMode() then

		str = UI:GetStringByName( "guidedMissile_boost" )
		local strkey = UI:GetBoostKey()

		local numSubst = 0
		str, numSubst = string.gsub( str, "%$BOOST%$", strkey )

		if numSubst == 0 then
			sys.log( "UI.HudGuidedMissileWnd:UpdateBoostKeyTip()[ERROR]: cannot find placeholder \"$BOOST$\" in string \"guidedMissile_boost\"" )
			str = string.format( "[INVALID STRING] Press %s to boost", strkey )
		end

	end	

	self:SetText( str, self.layers.BOOST_KEYTIP )

end


--
function UI.HudGuidedMissileWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateKeytip()
	self:UpdateBoostKeyTip()

end