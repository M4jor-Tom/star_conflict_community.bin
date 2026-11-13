-- ----------------------------------------------------------------------------
--
-- Workfile: hudbosshpwnd.lua
-- Copyright й 2014, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudBossHpWnd= {}

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudBossHpWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudBossHpWnd",
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
				defName 			= "hud_bossHp",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "prog",
						layer		= "UI.HudBossHpWnd.layers.HP_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "vol_1",
						layer		= "UI.HudBossHpWnd.layers.HP_VAL_AND_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "shield",
						layer		= "UI.HudBossHpWnd.layers.SHIELD_PB_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "name1",
						layer		= "UI.HudBossHpWnd.layers.AVANPOSTS",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "name1",
						layer		= "UI.HudBossHpWnd.layers.TARGET",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- HP_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_bossHp_hpPb",
				defaultAnimation	= "idle",
			}}
		}, 

		-- HP_VAL_AND_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" }
		},  

		-- SHIELD_PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_bossHp_shieldPb",
				defaultAnimation	= "idle",
			}}
		}, 

		-- AVANPOSTS
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" }
		},  

		-- TARGET
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags	 	= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" }
		},

	},
}

-- ------------------------------
-- interface functions
-- ------------------------------


--
function UI.HudBossHpWnd:ResetOnGameEnd()

	self.bNeedAvanposts = false
	self.avanposts		= {}
	self.maxAvanposts	= 0
	self.bInited		= false

end


-- ------------------------------
-- const
-- ------------------------------

UI.HudBossHpWnd.layers =
{
    MAIN_EFFECT			= 0,
    HP_PB_EFFECT		= 1,
    HP_VAL_AND_NAME		= 2,
	SHIELD_PB_EFFECT	= 3,
	AVANPOSTS			= 4,
	TARGET				= 5,
}

UI.HudBossHpWnd.strAvanposts	= UI:GetStringByName( "hud_boss_avanposts" )
UI.HudBossHpWnd.strTarget		= UI:GetStringByName( "hud_boss_target" )
UI.HudBossHpWnd.strM			= UI:GetStringByName( "meter" )

-- ------------------------------
-- vars
-- ------------------------------

UI.HudBossHpWnd.entId					= -1
UI.HudBossHpWnd.bCargoShip				= false
UI.HudBossHpWnd.bShip					= false
UI.HudBossHpWnd.prevHpAnimTime			= -1
UI.HudBossHpWnd.prevHpTextVal			= -1
UI.HudBossHpWnd.hpPbEffect				= nil
UI.HudBossHpWnd.bPrevShieldVisible		= false
UI.HudBossHpWnd.prevShieldVal			= -1
UI.HudBossHpWnd.shieldPbEffect			= nil
UI.HudBossHpWnd.bossName				= ""
UI.HudBossHpWnd.bNeedAvanposts			= false
UI.HudBossHpWnd.avanposts				= {}
UI.HudBossHpWnd.maxAvanposts			= 0
UI.HudBossHpWnd.prevNumLiveAvanposts	= -1
UI.HudBossHpWnd.targetEnt				= nil
UI.HudBossHpWnd.targetEntId				= -1
UI.HudBossHpWnd.prevTargetDist			= -1
UI.HudBossHpWnd.bInited					= false

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudBossHpWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.hpPbEffect		= UI:GetEffectFromLayer( self, self.layers.HP_PB_EFFECT )
	self.shieldPbEffect	= UI:GetEffectFromLayer( self, self.layers.SHIELD_PB_EFFECT )

	local handle = self:GetUiHandle()
	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )

end


--
function UI.HudBossHpWnd:Init()

	if self.bInited then
		return
	end

	self:InitAvanposts()

	self.bInited = true

end


--
function UI.HudBossHpWnd:InitAvanposts()	

	self.bNeedAvanposts = false
	self.avanposts		= {}
	self.maxAvanposts	= 0
	
	if _G.GetCurrentGameMode() ~= ai.Gameplay.PVE_MISSION then
		return
	end

	local avanpostDefName = ""

	local missionName = _G.CL_PveGetMissionName()

	local missionDef = _G.PvE_Missions[ missionName ]
	if type( missionDef ) == "table" then

		if missionDef.avanpost_count ~= nil then
			if type( missionDef.avanpost_count ) == "number" then

				if missionDef.avanpost_count > 0 then

					self.bNeedAvanposts = true
					self.maxAvanposts	= missionDef.avanpost_count

					if type( missionDef.avanpost_def ) == "string" then
						avanpostDefName = missionDef.avanpost_def
					else
						sys.log( "UI.HudBossHpWnd:InitAvanposts()[ERROR]: invalid type of _G.PvE_Missions[\"%s\"].avanpost_def; \"string\" expected, got \"%s\"", missionName, type( missionDef.avanpost_def ) )
					end					

				end

			else
				sys.log( "UI.HudBossHpWnd:InitAvanposts()[ERROR]: invalid type of _G.PvE_Missions[\"%s\"].avanpost_count; \"number\" or \"nil\" expected, got \"%s\"", missionName, type( missionDef.avanpost_count ) )
			end
		end

	else
		sys.log( "UI.HudBossHpWnd:InitAvanposts()[ERROR]: invalid type of _G.PvE_Missions[\"%s\"]; \"table\" expected, got \"%s\"", missionName, type( missionDef ) )
	end

	if self.bNeedAvanposts then

		local ents = _G.GetEntitiesByClass( "ScBaseEntity" )	-- tODO: переделать на _G.GetEntitiesByDef

		for entIdx, entId in pairs( ents ) do

			local ent = _G.Entities[ entId ]
			if ent then

				if ent:GetDefName() == avanpostDefName then
					self.avanposts[ entId ] = ent
				end

			else
				sys.log( "UI.HudBossHpWnd:InitAvanposts()[ERROR]: cannot find entity" )
			end

		end

	end

end


--
function UI.HudBossHpWnd:GetTargetId( bossEnt )

	local targetEntId = -1

	if not bossEnt then
		return targetEntId
	end

	local targetDefName = ""

	local bossDef = UI:GetDef( bossEnt:GetDefName() )
	if bossDef then

		if bossDef.target_def ~= nil then
			if type( bossDef.target_def ) == "string" then
				targetDefName = bossDef.target_def
			else
				sys.log( "UI.HudBossHpWnd:UpdateTarget()[ERROR]: invalid type of Def[\"%s\"].target_def; \"string\" or \"nil\" expected, got \"%s\"", bossEnt:GetDefName(), type( bossDef.target_def ) )
			end
		end

	else
		sys.log( "UI.HudBossHpWnd:UpdateToTarget()[ERROR]: cannot find Def[\"%s\"]", bossEnt:GetDefName() )
	end

	if targetDefName ~= "" then

		local entIds = _G.GetEntitiesByDef( targetDefName )

		local numEnts = #entIds

		if numEnts == 0 then
			sys.log( "UI.HudBossHpWnd:UpdateTarget()[ERROR]: entity with def \"%s\" in mission \"%s\" not found", targetDefName, missionName )

		else

			if numEnts > 1 then
				sys.log( "UI.HudBossHpWnd:UpdateTarget()[ERROR]: more than one entities with def \"%s\" in mission \"%s\"", targetDefName, missionName )
			end

			targetEntId = entIds[ 1 ]

		end

	end

	return targetEntId

end


--
function UI.HudBossHpWnd:Reset()

	self.entId					= -1
	self.bCargoShip				= false
	self.bShip					= false
	self.targetEntId			= -1
	self.targetEnt				= nil
	self.prevHpAnimTime			= -1
	self.prevHpTextVal			= -1
	self.bPrevShieldVisible		= false
	self.prevShieldVal			= -1
	self.bossName				= ""
	self.prevNumLiveAvanposts	= -1
	self.prevTargetDist			= -1

	self:SetText( "", self.layers.HP_VAL_AND_NAME )
	self:SetText( "", self.layers.AVANPOSTS )
	self:SetText( "", self.layers.TARGET )

	self.hpPbEffect:SetAnimationTime( 1 )
	self.hpPbEffect:UpdateAnimation( 0 )

	self:SetLayerVisible( false, self.layers.SHIELD_PB_EFFECT )	

	self:AddStyle( UI.WS_NOT_DRAW )

end


--
function UI.HudBossHpWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local oldEntId = self.entId

	self.entId = -1	
	local gameplay = _G.GetCurrentGameMode()
	local playerIdx = -1
	local ent = nil
	
	if gameplay == ai.Gameplay.PVE_MISSION then
		self.entId = UI:GetPveBossId( false )
		
	else
		self.entId = _G.CL_GetHudBossId()
	end

	if self.entId == -1 then

		if oldEntId ~= -1 then
			self:Reset()
		end

		return

	end

	if not ent then
		ent = _G.Entities[ self.entId ]
	end

	if self.entId ~= oldEntId then

		self:Init()	-- вызывается здесь, т.к. в момент общей инициализации худа на клиенте может не быть энтити аванпостов	(#0082779,комм.(0364506))

		self:RemoveStyle( UI.WS_NOT_DRAW )

		local defName = ent:GetDefName()
		local def = UI:GetDef( defName )
		
		self.bCargoShip	= _G.IsClassKindOf( def.class, "CargoShip" )
		self.bShip		= _G.IsClassKindOf( def.class, "SpaceShip" )

		self.bossName = playerIdx ~= -1 and UI:MakePlayerNameById( playerIdx, false, false ) or UI:GetBotName( self.entId )

		self.targetEntId = self:GetTargetId( ent )

		if self.targetEntId ~= -1 then
			self.targetEnt = _G.Entities[ self.targetEntId ]
		else
			self.targetEnt = nil
		end		

	end

	self:UpdateHpAndName( ent, self.entId ~= oldEntId )
	self:UpdateShield( ent )

	if self.bNeedAvanposts then
		self:UpdateAvanposts()
	end

	if self.targetEntId ~= -1 then
		self:UpdateTarget( ent )
	end

end


--
function UI.HudBossHpWnd:UpdateHpAndName( ent, bNameChanged )

	local hp	= ent:GetHealth()
	local maxHp	= ent:GetMaxHealth()

	-- анимация

	local animTime = math.max( 1 - ( maxHp ~= 0 and hp / maxHp or 0 ), 0 )

	if self.prevHpAnimTime ~= animTime then

		self.hpPbEffect:SetAnimationTimeAndUpdate( animTime )
		self.prevHpAnimTime = animTime

	end

	-- текст (в процентах, округленное до сотых - SC-112409#focus=streamItem-4-626210.0-0)
	local textVal = maxHp ~= 0 and hp / maxHp * 100 or 0

	if textVal ~= self.prevHpTextVal or bNameChanged then

		local str = string.format( "%s %.2f%%", self.bossName, textVal )
		self:SetText( str, self.layers.HP_VAL_AND_NAME )
		self.prevHpTextVal = textVal

	end

end


--
function UI.HudBossHpWnd:UpdateShield( ent )

	local bShieldVisible =
		self.bShip
		or self.bCargoShip and ent:IsShieldActive()

    local shieldVal = -1

	if bShieldVisible then

		self:SetLayerVisible( true, self.layers.SHIELD_PB_EFFECT )	

    	local shield	= 0
    	local maxShield	= 0

		if self.bCargoShip then
    		shield		= ent:GetShieldHealth()
    		maxShield	= ent:GetShieldMaxHealth()
		else
    		shield		= ent:GetShieldVal()
    		maxShield	= ent:GetShieldMax()
		end

		shieldVal = maxShield ~= 0 and shield / maxShield or 0

    	if bShieldVisible ~= self.bPrevShieldVisible or shieldVal ~= self.prevShieldVal then

	    	self.shieldPbEffect:SetAnimationTime( 1 - shieldVal )
    		self.shieldPbEffect:UpdateAnimation( 0 )

		end

	else
		self:SetLayerVisible( false, self.layers.SHIELD_PB_EFFECT )	
	end

	self.bPrevShieldVisible	= bShieldVisible
	self.prevShieldVal		= shieldVal

end


--
function UI.HudBossHpWnd:UpdateAvanposts()

	if not self.bNeedAvanposts then
		return
	end

	local numLiveAvanposts = 0

	for entId, ent in pairs( self.avanposts ) do

		if ent then

			if _G.IsEntIdValid( entId ) then

				if not ent:IsDead() then
					numLiveAvanposts = numLiveAvanposts + 1
				end

			else
				self.avanposts[ entId ] = nil
			end

		end

	end

	if numLiveAvanposts == self.prevNumLiveAvanposts then
		return
	end

	self.prevNumLiveAvanposts = numLiveAvanposts

	local str = string.format( "%s %d/%d", self.strAvanposts, numLiveAvanposts, self.maxAvanposts )
	self:SetText( str, self.layers.AVANPOSTS )	

end


--
function UI.HudBossHpWnd:UpdateTarget( bossEnt )

	if self.targetEntId == -1 then
		return
	end

	if not _G.IsEntIdValid( self.targetEntId ) then
		self.targetEnt = nil
	end

	local dist = -1

	if self.targetEnt and bossEnt then

		local targetPos	= UI:Vec3( _G.GetEntityChestPos3( self.targetEnt ) )
		local bossPos	= UI:Vec3( _G.GetEntityChestPos3( bossEnt ) )

		dist = UI:VLength( UI:Vec3( targetPos.x - bossPos.x, targetPos.y - bossPos.y, targetPos.z - bossPos.z ) ) * 10
		dist = math.floor( dist )

	end

	if dist == self.prevTargetDist then
		return
	end

	self.prevTargetDist = dist

	local str = string.format( "%s %d %s", self.strTarget, dist, self.strM )
	self:SetText( str, self.layers.TARGET )	

end


--
function UI.HudBossHpWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Reset()

end


--
function UI.HudBossHpWnd:F_OnEventSaveUiState()

	UI.store.HudBossHpWnd =
	{
		bNeedAvanposts	= self.bNeedAvanposts,
		avanposts		= self.avanposts,
		maxAvanposts	= self.maxAvanposts,
		bInited			= self.bInited,
	}

end


--
function UI.HudBossHpWnd:F_OnEventRestoreUiState()

	if UI.store.HudBossHpWnd then

		self.bNeedAvanposts	= UI.store.HudBossHpWnd.bNeedAvanposts
		self.avanposts		= UI.store.HudBossHpWnd.avanposts
		self.maxAvanposts	= UI.store.HudBossHpWnd.maxAvanposts
		self.bInited		= UI.store.bInited

		UI.store.HudBossHpWnd = nil

	end

end