-- ----------------------------------------------------------------------------
--
-- Workfile: hudplayershipinfownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

local resolution = UI:GetCoordinateSystemForAspect( UI.screenHeight / UI.screenWidth )

UI.HudPlayerShipInfoWnd = {}
local si = UI.HudPlayerShipInfoWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudPlayerShipInfoWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "HudPlayerShipInfoWnd",
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
				defName 			= "hud_playerShipInfo_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "boost",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SPEED_VAL_BOOST_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "speed",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SPEED_VAL_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "energy_progress",
						layer		= "UI.HudPlayerShipInfoWnd.layers.ENERGY_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "armor_progress_2",
						layer		= "UI.HudPlayerShipInfoWnd.layers.HP_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "progress_swarm_bg",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_HP_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
					
					{
						objName		= "progress_swarm",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_HP_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "progress_module_shield_bg",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_SHIELD_BG_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "progress_module_shield",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_SHIELD_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "armor_progress",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SHIELD_MAIN_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "energy_value",
						layer		= "UI.HudPlayerShipInfoWnd.layers.ENERGY_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "armor_value",
						layer		= "UI.HudPlayerShipInfoWnd.layers.HP_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
					
					{
						objName		= "armor_value3",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_HP_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "health_value",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SHIELD_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "armor_value4",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_SHIELD_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},

					{
						objName		= "critical_armor",
						layer		= "UI.HudPlayerShipInfoWnd.layers.HP_LOW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "critical_armor_swarm",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_HP_LOW_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "horizont_line",
						layer		= "UI.HudPlayerShipInfoWnd.layers.CENTER_POINT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "boost_progress",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SPEED_BOOST_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},

					{
						objName		= "speed_progress",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SPEED_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "default_speed",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SPEED_FACTOR_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},   

		-- ENERGY_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_energy",
				defaultAnimation	= "idle",
			}}
		},

		-- HP_LOW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_hp_low",
				defaultAnimation	= "idle",
			}}
		},
		
		-- SLAVE_HP_LOW_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_swarm_hp_low",
				defaultAnimation	= "idle",
			}}
		},

		-- SHIELD_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_hpShield_main",
				defaultAnimation	= "armor",

  				links =
  				{
  					{
  						objName		= "armor_progress",
  						layer		= "UI.HudPlayerShipInfoWnd.layers.SHIELD_BAR_EFFECT",
  						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
  					},
  				}
			}}
		},

		-- SHIELD_BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_hpShield_bar",
				defaultAnimation	= "idle",
      		}}
		},   

		-- HP_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_hpShield_main",
				defaultAnimation	= "shield",

  				links =
  				{
  					{
  						objName		= "armor_progress",
  						layer		= "UI.HudPlayerShipInfoWnd.layers.HP_BAR_EFFECT",
  						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
  					},
  				}
      		}}
		},

		-- HP_BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_hpShield_bar",
				defaultAnimation	= "idle",
      		}}
		},
		
		-- SLAVE_HP_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_swarm_hp_bg",
				defaultAnimation	= "idle",
			}}
		},
		
		-- SLAVE_HP_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_swarm_hp_main",
				defaultAnimation	= "shield",

				links =
				{
					{
						objName		= "armor_progress",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_HP_BAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- SLAVE_HP_BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_swarm_hp_bar",
				defaultAnimation	= "idle",
			}}
		},

		-- SLAVE_SHIELD_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_module_shield_bg",
				defaultAnimation	= "idle",
			}}
		},
		
		-- SLAVE_SHIELD_MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_module_shield_main",
				defaultAnimation	= "shield",

				links =
				{
					{
						objName		= "armor_progress",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SLAVE_SHIELD_BAR_EFFECT",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},


		-- SLAVE_SHIELD_BAR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_swarm_hp_bar",
				defaultAnimation	= "idle",
			}}
		},


		-- SPEED_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_speed",
				defaultAnimation	= "idle",
			}}
		},

		-- SPEED_BOOST_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_speedBoost",
				defaultAnimation	= "idle",
			}}
		},

		-- SPEED_FACTOR_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_speedFactor",
				defaultAnimation	= "idle",
			}}
		},

		-- SPEED_VAL_BOOST_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_speedValBoostBg",
				defaultAnimation	= "idle",
			}}
		},

		-- SPEED_VAL_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_playerShipInfo_speedVal",
				defaultAnimation	= "boost",

				links =
				{
					{
						objName		= "speed_value",
						layer		= "UI.HudPlayerShipInfoWnd.layers.SPEED_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND,
					},
				}
			}}
		},

		-- SPEED_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- ENERGY_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		}, 

		-- HP_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},
		
		-- SLAVE_HP_VAL
		{
			layerType	= UI.LAYER_TEXT,

			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz = { 1, 1 },
			font =
			{
				fontName = "Small",
			},
		},

		-- SHIELD_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- SLAVE_SHIELD_VAL
		{
			layerType	= UI.LAYER_TEXT,

   			formatFlags	 = FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz = { 1, 1 },
   			font =
			{
   				fontName = "Small",
   			},
		},

		-- по смыслу д.б. в окне курсора, а не здесь
		-- CENTER_POINT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_playerShipInfo_centerPoint",
				defaultAnimation	= "idle",
			}}
		}
	},
}

-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudPlayerShipInfoWnd:OnHudPlayerShipInfoAlphaOptionChanged()

	if not self:IsOnScreen() then
		return
	end

	self:UpdateAlpha()

end


-- ------------------------------
-- const
-- ------------------------------

si.HP_LOW		= 0.2		-- коэффициент здоровья, при достижении которого показывается эффект критически низкого здоровья

si.layers =
{
	MAIN_EFFECT					= 0,
	ENERGY_EFFECT				= 1,
	HP_LOW_EFFECT   			= 2,
	SLAVE_HP_LOW_EFFECT   		= 3,
	SHIELD_MAIN_EFFECT			= 4,
	SHIELD_BAR_EFFECT			= 5,
	HP_MAIN_EFFECT				= 6,
	HP_BAR_EFFECT				= 7,
	SLAVE_HP_BG_EFFECT			= 8,
	SLAVE_HP_MAIN_EFFECT		= 9,
	SLAVE_HP_BAR_EFFECT			= 10,
	SLAVE_SHIELD_BG_EFFECT		= 11,
	SLAVE_SHIELD_MAIN_EFFECT	= 12,
	SLAVE_SHIELD_BAR_EFFECT		= 13,
	SPEED_EFFECT				= 14, 
	SPEED_BOOST_EFFECT			= 15, 
	SPEED_FACTOR_EFFECT			= 16, 
	SPEED_VAL_BOOST_BG_EFFECT   = 17,
	SPEED_VAL_EFFECT			= 18,
	SPEED_VAL					= 19,
	ENERGY_VAL					= 20,
	HP_VAL						= 21,
	SLAVE_HP_VAL				= 22,
	SHIELD_VAL					= 23,
	SLAVE_SHIELD_VAL			= 24,
	CENTER_POINT_EFFECT			= 25,
}

si.effectInfo =
{
	hpMain =
	{
		animIdle	= "shield",
		animHit		= "shield_damage",
	},
	
	slaveHpMain =
	{
		animIdle	= "shield",
		animHit		= "shield_damage",
	},

	shieldMain =
	{
		animIdle		= "armor",
		animHit			= "armor_damage",
		animActiveIdle	= "arm_white",
		animActivedHit	= "arm_white_damage",
	},

	slaveShieldMain =
	{
		animIdle		= "shield",
		animHit			= "shield_damage",
		animActiveIdle	= "arm_white",
		animActivedHit	= "arm_white_damage",
	},

	speedVal =
	{
		textLocator = "speed_value",
		anim		= "boost",
	},

	speedValBoostBg =
	{
		anim		= "idle",
	},

	speed =
	{
		animForward			= "idle",
		animBackward		= "back",
		boostTime			= 0.80,
	},

	speedFactor =
	{
		zeroTime		= 0.18
	},
}

-- ------------------------------
-- vars
-- ------------------------------

si.animId_speed_forward			= -1
si.animId_speed_backward		= -1
si.animId_hpMain_idle			= -1
si.animId_hpMain_hit			= -1
si.animId_slaveHpMain_idle	= -1
si.animId_slaveHpMain_hit		= -1
si.animId_shieldMain_idle		= -1
si.animId_shieldMain_hit		= -1
si.animId_shieldMain_active_idle= -1
si.animId_shieldMain_active_hit	= -1
si.animId_slaveShieldMain_idle	= -1
si.animId_slaveShieldMain_hit	= -1
si.animId_slaveShieldMain_active_idle	= -1
si.animId_slaveShieldMain_active_hit	= -1
si.speed						= -1
si.speedFactor					= 0
si.energyForText				= -1
si.hp							= -1
si.slaveHp						= -1
si.shield						= -1
si.slaveShield					= -1
si.speedBaseColor				= UI.WHITE_COLOR
si.strSpeedBaseColor			= ""
si.bBoost						= false
si.speedBoostEffect				= nil
si.speedEffect					= nil
si.hpMainEffect					= nil
si.slaveHpMainEffect			= nil
si.shieldMainEffect				= nil
si.slaveShieldMainEffect		= nil
si.speedValEffect				= nil
si.speedValBoostBgEffect		= nil
si.speedFactorEffect			= nil
si.energyEffect					= nil
si.hpBarEffect					= nil
si.slaveHpBarEffect				= nil
si.shieldBarEffect				= nil
si.slaveShieldBarEffect			= nil
si.mainEffect					= nil
si.hpLowEffect					= nil
si.alpha						= UI.hudOptionsDefaultVals.hudPlayerShipInfoAlpha
si.bOculus						= cvars.g_oculusVR ~= 0		-- при изменении этого сивара вызывается перезагрузка ресурсов ui, так что достаточнго узнать его значение один раз, при инициализации окна
si.bVisible						= true
si.bCenterPointVisible			= true
si.speedPbAnimId				= -1
si.speedPbAnimTime				= 0
si.bSpeedBoostVisible			= true
si.speedBoostAnimTime			= 0
si.speedFactorAnimTime			= 0
si.energyAnimTime				= 0
si.hpBarAnimTime				= 0
si.slaveHpBarAnimTime			= 0
si.bHpLowVisible				= true
si.bSlaveHpLowVisible			= true
si.hpMainAnimId					= -1
si.slaveHpMainAnimId			= -1
si.shieldBarAnimTime			= 0
si.slaveShieldBarAnimTime		= 0
si.shieldMainAnimId				= -1
si.slaveShieldMainAnimId		= -1
si.hpForText					= -1
si.swarmHpForText				= -1
si.shieldForText				= -1
si.slaveShieldForText			= -1
si.activeShieldEntId			= -1
si.slaveActiveShieldEntId		= -1
si.bSlaveHpVisible				= true
si.bSlaveShieldVisible			= true
si.slaveLowHpCoef				= 0
si.slaveId						= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudPlayerShipInfoWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	self.speedEffect = UI:GetEffectFromLayer( self, self.layers.SPEED_EFFECT )
	self.animId_speed_forward		= self.speedEffect:GetAnimationId( self.effectInfo.speed.animForward )
	self.animId_speed_backward		= self.speedEffect:GetAnimationId( self.effectInfo.speed.animBackward )

	self.hpMainEffect = UI:GetEffectFromLayer( self, self.layers.HP_MAIN_EFFECT )
	self.animId_hpMain_idle			= self.hpMainEffect:GetAnimationId( self.effectInfo.hpMain.animIdle )
	self.animId_hpMain_hit			= self.hpMainEffect:GetAnimationId( self.effectInfo.hpMain.animHit )
	
	self.slaveHpMainEffect = UI:GetEffectFromLayer( self, self.layers.SLAVE_HP_MAIN_EFFECT )
	self.animId_slaveHpMain_idle	= self.slaveHpMainEffect:GetAnimationId( self.effectInfo.slaveHpMain.animIdle )
	self.animId_slaveHpMain_hit		= self.slaveHpMainEffect:GetAnimationId( self.effectInfo.slaveHpMain.animHit )

	self.shieldMainEffect = UI:GetEffectFromLayer( self, self.layers.SHIELD_MAIN_EFFECT )
	self.animId_shieldMain_idle			= self.shieldMainEffect:GetAnimationId( self.effectInfo.shieldMain.animIdle )
	self.animId_shieldMain_hit			= self.shieldMainEffect:GetAnimationId( self.effectInfo.shieldMain.animHit )
	self.animId_shieldMain_active_idle	= self.shieldMainEffect:GetAnimationId( self.effectInfo.shieldMain.animActiveIdle )
	self.animId_shieldMain_active_hit	= self.shieldMainEffect:GetAnimationId( self.effectInfo.shieldMain.animActivedHit )

	self.slaveShieldMainEffect = UI:GetEffectFromLayer( self, self.layers.SLAVE_SHIELD_MAIN_EFFECT )
	self.animId_slaveShieldMain_idle		= self.slaveShieldMainEffect:GetAnimationId( self.effectInfo.slaveShieldMain.animIdle )
	self.animId_slaveShieldMain_hit			= self.slaveShieldMainEffect:GetAnimationId( self.effectInfo.slaveShieldMain.animHit )
	self.animId_slaveShieldMain_active_idle	= self.slaveShieldMainEffect:GetAnimationId( self.effectInfo.slaveShieldMain.animActiveIdle )
	self.animId_slaveShieldMain_active_hit	= self.slaveShieldMainEffect:GetAnimationId( self.effectInfo.slaveShieldMain.animActivedHit )


	self.speedValEffect = UI:GetEffectFromLayer( self, self.layers.SPEED_VAL_EFFECT )
	self.speedValEffect:Update( 0 )

	self.speedBaseColor = self.speedValEffect:GetObjColor( self.effectInfo.speedVal.textLocator )
	self.strSpeedBaseColor = UI:Color2Str( UI:SetAlpha( self.speedBaseColor, self.alpha ) )

	self.speedFactorEffect		= UI:GetEffectFromLayer( self, self.layers.SPEED_FACTOR_EFFECT )
	self.energyEffect			= UI:GetEffectFromLayer( self, self.layers.ENERGY_EFFECT )
	self.hpBarEffect			= UI:GetEffectFromLayer( self, self.layers.HP_BAR_EFFECT )
	self.slaveHpBarEffect		= UI:GetEffectFromLayer( self, self.layers.SLAVE_HP_BAR_EFFECT )
	self.shieldBarEffect		= UI:GetEffectFromLayer( self, self.layers.SHIELD_BAR_EFFECT )
	self.slaveShieldBarEffect	= UI:GetEffectFromLayer( self, self.layers.SLAVE_SHIELD_BAR_EFFECT )
	self.mainEffect				= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	self.speedValBoostBgEffect	= UI:GetEffectFromLayer( self, self.layers.SPEED_VAL_BOOST_BG_EFFECT )
	self.hpLowEffect			= UI:GetEffectFromLayer( self, self.layers.HP_LOW_EFFECT )
	self.speedBoostEffect		= UI:GetEffectFromLayer( self, self.layers.SPEED_BOOST_EFFECT )

	self:Reset()

	self:SetAlpha( self.alpha )

end


--
function UI.HudPlayerShipInfoWnd:Reset()

	self.hp				= -1
	self.slaveHp		= -1
	self.shield			= -1
	self.slaveShield	= -1
	self.bBoost			= false

	self:SetText( "0", self.layers.SPEED_VAL )
    self.speed			= 0
	self.speedFactor	= 0

	self:SetText( "0", self.layers.ENERGY_VAL )
	self.energyForText = 0

	self:SetText( "0", self.layers.HP_VAL )
	self.hpForText = 0
	
	self:SetText( "0", self.layers.SLAVE_HP_VAL )
	self.swarmHpForText = 0

	self:SetText( "0", self.layers.SHIELD_VAL )
	self.shieldForText = 0

	self:SetText( "0", self.layers.SLAVE_SHIELD_VAL )
	self.slaveShieldForText = 0

	self:SetLayerVisible( false, self.layers.HP_LOW_EFFECT )
	self.bHpLowVisible = false
	
	self:SetLayerVisible( false, self.layers.SLAVE_HP_LOW_EFFECT )
	self.bSlaveHpLowVisible = false

	self:SetLayerVisible( false, self.layers.SPEED_BOOST_EFFECT )
	self.bSpeedBoostVisible = false

	self:AnimateHpMainIdle()
	self:AnimateSlaveHpMainIdle()
	self:AnimateShieldMainIdle()
	self:AnimateSlaveShieldMainIdle()

	self.shieldMainEffect:SetColor( UI.WHITE_COLOR )
	self.activeShieldEntId = -1

	self.slaveShieldMainEffect:SetColor( UI.WHITE_COLOR )
	self.slaveActiveShieldEntId = -1

	self.speedEffect:SetAnimationTimeAndUpdate( 0 )
	self.speedPbAnimTime = 0

	self.speedFactorEffect:SetAnimationTimeAndUpdate( 0 )
	self.speedFactorAnimTime = 0

	self.energyEffect:SetAnimationTimeAndUpdate( 0 )
	self.energyAnimTime = 0

	self.hpBarEffect:SetAnimationTimeAndUpdate( 0 )
	self.hpBarAnimTime = 0
	
	self.slaveHpBarEffect:SetAnimationTimeAndUpdate( 0 )
	self.slaveHpBarAnimTime = 0	

	self.shieldBarEffect:SetAnimationTimeAndUpdate( 0 )
	self.shieldBarAnimTime = 0

	self.slaveShieldBarEffect:SetAnimationTimeAndUpdate( 0 )
	self.slaveShieldBarAnimTime = 0

	self:AnimateSpeedValBoostOff()

	self:AddStyle( UI.WS_NOT_DRAW )
	self.bVisible = false

	self:SetLayerVisible( true, self.layers.CENTER_POINT_EFFECT )
	self.bCenterPointVisible = true
	
	self:SetLayerVisible( false, self.layers.SLAVE_HP_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.SLAVE_HP_MAIN_EFFECT )
	self:SetLayerVisible( false, self.layers.SLAVE_HP_BAR_EFFECT )
	self:SetLayerVisible( false, self.layers.SLAVE_HP_VAL )
	self:SetLayerVisible( false, self.layers.SLAVE_SHIELD_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.SLAVE_SHIELD_MAIN_EFFECT )
	self:SetLayerVisible( false, self.layers.SLAVE_SHIELD_BAR_EFFECT )
	self:SetLayerVisible( false, self.layers.SLAVE_SHIELD_VAL )
	self.bSlaveHpVisible = false
	self.bSlaveShieldVisible = false
	self.slaveLowHpCoef = 0
	self.slaveId = -1

end


--
function UI.HudPlayerShipInfoWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:Reset()
	self:UpdateAlpha()

end


--
function UI.HudPlayerShipInfoWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	local ship = UI.HudWnd.myShip

	local bVisible = ship ~= nil
	if bVisible ~= self.bVisible then

    	if bVisible then
    		self:RemoveStyle( UI.WS_NOT_DRAW )
    	else
    		self:AddStyle( UI.WS_NOT_DRAW )
    	end

		self.bVisible = bVisible

	end
	
	if not ship then
		return
	end
	
	local slave = ship and ship:GetSlaveEntity()
	local swarm = nil
	if slave and UI:IsEntityOfClass( slave, "SwarmPack" ) then
		swarm = slave
	end

	local bInSwarmMode = swarm and ship:IsRemoteSwarmMode()	
	
	local slaveId = slave and slave:GetId() or -1
	if slaveId ~= self.slaveId then	
		self.slaveId = slaveId
		self:UpdateSlaveLowHpCoef( slave )
	end

	self:UpdateSpeed( ship, swarm, bInSwarmMode )
	self:UpdateEnergy( ship )
	self:UpdateHp( ship )
	self:UpdateShield( ship )
	self:UpdateCenterPointEffect()
	self:UpdateSlaveHp( slave )
	self:UpdateSlaveShield( slave )

end


--
function UI.HudPlayerShipInfoWnd:UpdateSlaveLowHpCoef( slave )

	self.slaveLowHpCoef = self.HP_LOW
	
	if not slave then
		return
	end

	local defName = slave:GetDefName()
	local def = UI:GetDef( defName )
	
	if def then
		if type( def.start_work_health_percent ) == "number" then
			self.slaveLowHpCoef = def.start_work_health_percent
		elseif UI:IsEntityOfClass( slave, "SwarmPack" ) then
			sys.log( "UI.HudPlayerShipInfoWnd:UpdateSlaveLowHpCoef()[ERROR]: invalid type of _G.Def['%s'].start_work_health_percent; 'number' expected, got '%s'", defName, type( def.start_work_health_percent ) )
		end
	else
		sys.log( "UI.HudPlayerShipInfoWnd:UpdateSlaveLowHpCoef()[ERROR]: cannot find _G.Def['%s']", defName )
	end

end


--
function UI.HudPlayerShipInfoWnd:UpdateSpeed( ship, swarm, bInSwarmMode )

	local speed				= 0
	local maxForwardSpeed	= 0
	local maxBackwardSpeed	= 0
	local minSpeed			= 0	-- SC-115445: в потасовке GT_CLOSE_DISTANCE у кораблей есть минимальная скорость
	local maxSpeed			= 0	
	local speedFactor		= 0
    local bBoostEnable		= false
	local bBoost			= false
    local boostCf			= 1
	
	-- в режиме управления роем параметры скорости берутся от него
	if swarm and bInSwarmMode then
	
		speed				= swarm:GetUiSpeed()
		maxForwardSpeed		= swarm:GetMaxSpeed()
		maxBackwardSpeed	= swarm:GetMaxRearSpeed()
		speedFactor			= _G.CL_GetShipSpeedFactor( ship )	-- берется из корабля, он передается кораблем рою
		
		bBoostEnable		= _G.CL_IsBoosEnable( ship )
		bBoost				= ship:IsBoostActive()
		boostCf				= _G.CL_GetShipSpeedMul( ship )

	else
	
		speed				= _G.CL_GetShipSpeed( ship )
		minSpeed			= ship:GetMinSpeed()
		maxForwardSpeed		= ship:GetMaxSpeed()
		maxBackwardSpeed	= ship:GetMaxRearSpeed()
		speedFactor			= _G.CL_GetShipSpeedFactor( ship )
		bBoostEnable		= _G.CL_IsBoosEnable( ship )
		bBoost				= ship:IsBoostActive()
		boostCf				= _G.CL_GetShipSpeedMul( ship )

	end

	local maxSpeed		= speed >= 0 and maxForwardSpeed or maxBackwardSpeed
	local speedFixed	= UI:Round( speed * 10 )


	-- текст

	if bBoost and not self.bBoost then
		self:AnimateSpeedValBoostStart()

	elseif not bBoost and self.bBoost then
		self:AnimateSpeedValBoostStop()
	end	

	if self.speed ~= speedFixed or speedFactor ~= self.speedFactor then

		local text = ""

		if math.abs( speedFactor ) > 1e-3 then

			local maxAutoSpeed	= speedFactor > 0 and maxForwardSpeed or maxBackwardSpeed
			local autoSpeed		= minSpeed + ( maxAutoSpeed - minSpeed ) * speedFactor
			autoSpeed = UI:Round( autoSpeed * 10 )

			text = string.format( "%d%s->%d", speedFixed, self.strSpeedBaseColor, autoSpeed )	-- цвет стрелки и второй цифры не будет меняться от анимации

		else
			text = string.format( "%d", speedFixed )
		end

		self:SetText( text, self.layers.SPEED_VAL )

		self.speed			= speedFixed
		self.speedFactor	= speedFactor

	end


	-- полоса прогресса

	local pbAnimId = -1
	local pbAnimTime = 0

	if speed < 0 then

		pbAnimId = self.animId_speed_backward
		pbAnimTime = -speed / maxSpeed
		
	else

		pbAnimId = self.animId_speed_forward

		if speed > maxSpeed then

			local maxSpeedWithBoost = maxSpeed * boostCf
			local t = ( speed - maxSpeed ) / ( maxSpeedWithBoost - maxSpeed )
			pbAnimTime = self.effectInfo.speed.boostTime + t * ( 1 - self.effectInfo.speed.boostTime )

		else
			pbAnimTime = speed / maxSpeed * self.effectInfo.speed.boostTime
		end

	end


	if pbAnimId ~= self.speedPbAnimId then
		self.speedEffect:StartAnimationById( pbAnimId )
		self.speedPbAnimId = pbAnimId
	end

	if pbAnimTime ~= self.speedPbAnimTime then
		self.speedEffect:SetAnimationTimeAndUpdate( pbAnimTime )
		self.speedPbAnimTime = pbAnimTime
	end

	if bBoostEnable ~= self.bSpeedBoostVisible then
		self:SetLayerVisible( bBoostEnable, self.layers.SPEED_BOOST_EFFECT )
		self.bSpeedBoostVisible = bBoostEnable
	end

	if bBoostEnable then
		if pbAnimTime ~= self.speedBoostAnimTime then
	    	self.speedBoostEffect:SetAnimationTimeAndUpdate( pbAnimTime )
			self.speedBoostAnimTime = pbAnimTime
		end
	end


	-- дефолтная скорость на полосе прогресса

	local zeroTime = self.effectInfo.speedFactor.zeroTime
	local animTime = zeroTime

	if speedFactor < 0 then
		animTime = zeroTime + zeroTime * speedFactor

	elseif speedFactor > 0 then
		animTime = zeroTime + ( 1 - zeroTime ) * speedFactor
	end

	if animTime ~= self.speedFactorAnimTime then
		self.speedFactorEffect:SetAnimationTimeAndUpdate( animTime )
		self.speedFactorAnimTime = animTime
	end

	self.bBoost = bBoost

end


--
function UI.HudPlayerShipInfoWnd:AnimateSpeedValBoostStart()

	local speedValLayer = self:GetLayer( UI.LAYER_EFFECT, self.layers.SPEED_VAL_EFFECT, 0 )
	if speedValLayer then
		speedValLayer:SetUpdatable( true )
	end

	if self.speedValEffect:GetCurAnimation() ~= self.effectInfo.speedVal.anim then
		self.speedValEffect:StartAnimationSpeed( self.effectInfo.speedVal.anim, 1 )
	else
		self.speedValEffect:SetAnimationSpeed( 1 )
	end


	self:SetLayerVisible( true, self.layers.SPEED_VAL_BOOST_BG_EFFECT )

	local speedValBgLayer = self:GetLayer( UI.LAYER_EFFECT, self.layers.SPEED_VAL_BOOST_BG_EFFECT, 0 )
	if speedValBgLayer then
		speedValBgLayer:SetUpdatable( true )
	end

	if self.speedValBoostBgEffect:GetCurAnimation() ~= self.effectInfo.speedValBoostBg.anim then
		self.speedValBoostBgEffect:StartAnimationSpeed( self.effectInfo.speedValBoostBg.anim, 1 )
	else
		self.speedValBoostBgEffect:SetAnimationSpeed( 1 )
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateSpeedValBoostStop()

	local speedValLayer = self:GetLayer( UI.LAYER_EFFECT, self.layers.SPEED_VAL_EFFECT, 0 )
	if speedValLayer then
		speedValLayer:SetUpdatable( true )
	end

	if self.speedValEffect:GetCurAnimation() ~= self.effectInfo.speedVal.anim then
		self.speedValEffect:StartAnimationSpeed( self.effectInfo.speedVal.anim, -1 )
	else
		self.speedValEffect:SetAnimationSpeed( -1 )
	end


	self:SetLayerVisible( true, self.layers.SPEED_VAL_BOOST_BG_EFFECT )

	local speedValBgLayer = self:GetLayer( UI.LAYER_EFFECT, self.layers.SPEED_VAL_BOOST_BG_EFFECT, 0 )
	if speedValBgLayer then
		speedValBgLayer:SetUpdatable( true )
	end

	if self.speedValBoostBgEffect:GetCurAnimation() ~= self.effectInfo.speedValBoostBg.anim then
		self.speedValBoostBgEffect:StartAnimationSpeed( self.effectInfo.speedValBoostBg.anim, -1 )
	else
		self.speedValBoostBgEffect:SetAnimationSpeed( -1 )
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateSpeedValBoostOff()

	local speedValLayer = self:GetLayer( UI.LAYER_EFFECT, self.layers.SPEED_VAL_EFFECT, 0 )
	if speedValLayer then
		speedValLayer:SetUpdatable( false )
	end

	if self.speedValEffect:GetCurAnimation() ~= self.effectInfo.speedVal.anim then
		self.speedValEffect:StartAnimationSpeed( self.effectInfo.speedVal.anim, 1 )
	else
		self.speedValEffect:SetAnimationSpeed( 1 )
	end

	self.speedValEffect:SetAnimationTime( 0 )
	self.speedValEffect:Update( 0 )

	self:SetLayerVisible( false, self.layers.SPEED_VAL_BOOST_BG_EFFECT )

end


--
function UI.HudPlayerShipInfoWnd:AnimateSpeedValBoostOn()

	local speedValLayer = self:GetLayer( UI.LAYER_EFFECT, self.layers.SPEED_VAL_EFFECT, 0 )
	if speedValLayer then
		speedValLayer:SetUpdatable( false )
	end

	if self.speedValEffect:GetCurAnimation() ~= self.effectInfo.speedVal.anim then
		self.speedValEffect:StartAnimationSpeed( self.effectInfo.speedVal.anim, 1 )
	else
		self.speedValEffect:SetAnimationSpeed( 1 )
	end

	self.speedValEffect:SetAnimationTime( 1 )
	self.speedValEffect:Update( 0 )


	self:SetLayerVisible( true, self.layers.SPEED_VAL_BOOST_BG_EFFECT )

	local speedValBgLayer = self:GetLayer( UI.LAYER_EFFECT, self.layers.SPEED_VAL_BOOST_BG_EFFECT, 0 )
	if speedValBgLayer then
		speedValBgLayer:SetUpdatable( false )
	end

	if self.speedValBoostBgEffect:GetCurAnimation() ~= self.effectInfo.speedValBoostBg.anim then
		self.speedValBoostBgEffect:StartAnimationSpeed( self.effectInfo.speedValBoostBg.anim, 1 )
	else
		self.speedValBoostBgEffect:SetAnimationSpeed( 1 )
	end

	self.speedValBoostBgEffect:SetAnimationTime( 1 )
	self.speedValBoostBgEffect:Update( 0 )

end


--
function UI.HudPlayerShipInfoWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.speedValEffect then

		if self.bBoost then
			self:AnimateSpeedValBoostOn()
		else
			self:AnimateSpeedValBoostOff()
		end

	end

end


--
function UI.HudPlayerShipInfoWnd:UpdateEnergy( ship )

	local energy = ship:GetEnergy()
		
	-- прогрессбар

	local val = energy / ship:GetMaxEnergy()

	if val ~= self.energyAnimTime then
		self.energyEffect:SetAnimationTimeAndUpdate( val )
		self.energyAnimTime = val
	end

	-- текст

	local energyForText = UI:Round( energy )

	if energyForText ~= self.energyForText then
		self:SetText( tostring( energyForText ), self.layers.ENERGY_VAL )
		self.energyForText = energyForText
	end

end


--
function UI.HudPlayerShipInfoWnd:UpdateHp( ship )

	local maxHp		= ship:GetMaxHealth()
	local hp		= ship:GetHealth()
	local hpValRel	= hp / maxHp

	-- прогрессбар

	if hpValRel ~= self.hpBarAnimTime then
		self.hpBarEffect:SetAnimationTimeAndUpdate( hpValRel )
		self.hpBarAnimTime = hpValRel
	end

	-- текст

	local hpForText = UI:Round( hp )

	if hpForText ~= self.hpForText then
		self:SetText( tostring( hpForText ), self.layers.HP_VAL )
		self.hpForText = hpForText
	end

	-- эффект критически низкого здоровья

	local bHpLowVisible = hpValRel <= self.HP_LOW

	if bHpLowVisible ~= self.bHpLowVisible then
		self:SetLayerVisible( bHpLowVisible, self.layers.HP_LOW_EFFECT )
		self.bHpLowVisible = bHpLowVisible
	end
	
	-- эффект попадания

	if self.hp > hp then
		self:AnimateHpMainHit()
	end

	self.hp = hp

end


--
function UI.HudPlayerShipInfoWnd:UpdateSlaveHp( slave )

	local bSlaveHpVisible = slave ~= nil	-- здоровье дополнительного энтити показывается всегда
	if bSlaveHpVisible ~= self.bSlaveHpVisible then

		self:SetLayerVisible( bSlaveHpVisible, self.layers.SLAVE_HP_BG_EFFECT )
		self:SetLayerVisible( bSlaveHpVisible, self.layers.SLAVE_HP_MAIN_EFFECT )
		self:SetLayerVisible( bSlaveHpVisible, self.layers.SLAVE_HP_BAR_EFFECT )
		self:SetLayerVisible( bSlaveHpVisible, self.layers.SLAVE_HP_VAL )
		self.bSlaveHpVisible = bSlaveHpVisible

		self:SetLayerVisible( false, self.layers.SLAVE_HP_LOW_EFFECT )
		self.bSlaveHpLowVisible = false
		
	end
	
	if not bSlaveHpVisible then
		return
	end

	local maxHp		= 1
	local hp		= 0	

	if UI:IsEntityOfClass( slave, "SwarmPack" ) then
		maxHp		= slave:GetMaxSharedHealth()
		hp			= slave:GetSharedHealth()
	else
		maxHp		= slave:GetMaxHealth()
		hp			= slave:GetHealth()
	end

	local hpValRel	= hp / maxHp

	-- прогрессбар

	if hpValRel ~= self.slaveHpBarAnimTime then
		self.slaveHpBarEffect:SetAnimationTimeAndUpdate( hpValRel )
		self.slaveHpBarAnimTime = hpValRel
	end

	-- текст

	local hpForText = UI:Round( hp )

	if hpForText ~= self.swarmHpForText then
		self:SetText( tostring( hpForText ), self.layers.SLAVE_HP_VAL )
		self.swarmHpForText = hpForText
	end

	-- эффект критически низкого здоровья

	local bHpLowVisible = hp < ( maxHp * self.slaveLowHpCoef )

	if bHpLowVisible ~= self.bSlaveHpLowVisible then
		self:SetLayerVisible( bHpLowVisible, self.layers.SLAVE_HP_LOW_EFFECT )
		self.bSlaveHpLowVisible = bHpLowVisible
	end
	
	-- эффект попадания

	if self.slaveHp > hp then
		self:AnimateSlaveHpMainHit()
	end

	self.slaveHp = hp

end


--
function UI.HudPlayerShipInfoWnd:UpdateSlaveShield( slave )

	local bSlaveShieldVisible = slave and UI:IsEntityOfClass( slave, "SpaceShip" )
	
	if bSlaveShieldVisible ~= self.bSlaveShieldVisible then
	
		self:SetLayerVisible( bSlaveShieldVisible, self.layers.SLAVE_SHIELD_BG_EFFECT )
		self:SetLayerVisible( bSlaveShieldVisible, self.layers.SLAVE_SHIELD_MAIN_EFFECT )
		self:SetLayerVisible( bSlaveShieldVisible, self.layers.SLAVE_SHIELD_BAR_EFFECT )
		self:SetLayerVisible( bSlaveShieldVisible, self.layers.SLAVE_SHIELD_VAL )
		self.bSlaveShieldVisible = bSlaveShieldVisible
	end
	
	if not bSlaveShieldVisible then
		return
	end

	local activeShieldEnt	= slave:GetActiveShell()
	local activeShieldEntId	= activeShieldEnt and activeShieldEnt:GetId() or -1

	local maxShield	= 0
	local shield	= 0

	if activeShieldEnt then
		maxShield 	= activeShieldEnt:GetMaxHealth()
		shield		= activeShieldEnt:GetHealth()
	else
		maxShield 	= slave:GetShieldMax()
		shield		= slave:GetShieldVal()
	end

	local shieldValRel	= ( maxShield ~= 0 ) and shield / maxShield or 0

	-- прогрессбар

	if shieldValRel ~= self.slaveShieldBarAnimTime then
		self.slaveShieldBarEffect:SetAnimationTimeAndUpdate( shieldValRel )
		self.slaveShieldBarAnimTime = shieldValRel
	end

	-- цвет и анимация главного эффекта щита

	if activeShieldEntId ~= self.slaveActiveShieldEntId then

		local color = UI.WHITE_COLOR

		if activeShieldEntId ~= -1 then
			local activeShieldDefName = activeShieldEnt:GetDefName()
			color = UI:GetActiveShieldColor( activeShieldDefName )
		end

		self.slaveShieldMainEffect:SetColor( color )

		if activeShieldEntId ~= -1 then
			self:AnimateSlaveShieldMainActiveIdle()
		else
			self:AnimateSlaveShieldMainIdle()
		end

	end

-- текст

	local slaveShieldForText = UI:Round( shield )
		
	if slaveShieldForText ~= self.slaveShieldForText then
		self:SetText( tostring( slaveShieldForText ), self.layers.SLAVE_SHIELD_VAL )
		self.slaveShieldForText = slaveShieldForText
	end

	-- эффект попадания

	if self.slaveShield > shield then

		if activeShieldEnt then
			self:AnimateSlaveShieldMainActiveHit()
		else
			self:AnimateSlaveShieldMainHit()
		end

	end

	self.slaveShield				= shield
	self.slaveActiveShieldEntId		= activeShieldEntId
end


--
function UI.HudPlayerShipInfoWnd:UpdateShield( ship )

	local activeShieldEnt	= ship:GetActiveShell()
	local activeShieldEntId	= activeShieldEnt and activeShieldEnt:GetId() or -1

	local maxShield	= 0
	local shield	= 0

	if activeShieldEnt then
		maxShield 	= activeShieldEnt:GetMaxHealth()
		shield		= activeShieldEnt:GetHealth()
	else
		maxShield 	= ship:GetShieldMax()
		shield		= ship:GetShieldVal()
	end

	local shieldValRel	= ( maxShield ~= 0 ) and shield / maxShield or 0

	-- прогрессбар

	if shieldValRel ~= self.shieldBarAnimTime then
		self.shieldBarEffect:SetAnimationTimeAndUpdate( shieldValRel )
		self.shieldBarAnimTime = shieldValRel
	end

	-- цвет и анимация главного эффекта щита

	if activeShieldEntId ~= self.activeShieldEntId then

		local color = UI.WHITE_COLOR

		if activeShieldEntId ~= -1 then
			local activeShieldDefName = activeShieldEnt:GetDefName()
			color = UI:GetActiveShieldColor( activeShieldDefName )
		end

		self.shieldMainEffect:SetColor( color )

		if activeShieldEntId ~= -1 then
			self:AnimateShieldMainActiveIdle()
		else
			self:AnimateShieldMainIdle()
		end

	end

	-- текст

	local shieldForText = UI:Round( shield )
	
	if shieldForText ~= self.shieldForText then
		self:SetText( tostring( shieldForText ), self.layers.SHIELD_VAL )
		self.shieldForText = shieldForText
	end
	
	-- эффект попадания

	if self.shield > shield then

		if activeShieldEnt then
			self:AnimateShieldMainActiveHit()
		else
			self:AnimateShieldMainHit()
		end

	end

	self.shield				= shield
	self.activeShieldEntId	= activeShieldEntId

end


--
function UI.HudPlayerShipInfoWnd:AnimateHpMainIdle()

	local animId = self.animId_hpMain_idle
	if animId ~= self.hpMainAnimId then
		self.hpMainEffect:StartAnimationById( animId )
		self.hpMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateHpMainHit()

	local animId = self.animId_hpMain_hit
	if animId ~= self.hpMainAnimId then
		self.hpMainEffect:StartAnimationById( animId )
		self.hpMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateSlaveHpMainIdle()

	local animId = self.animId_slaveHpMain_idle
	if animId ~= self.slaveHpMainAnimId then
		self.slaveHpMainEffect:StartAnimationById( animId )
		self.slaveHpMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateSlaveHpMainHit()

	local animId = self.animId_slaveHpMain_hit
	if animId ~= self.slaveHpMainAnimId then
		self.slaveHpMainEffect:StartAnimationById( animId )
		self.slaveHpMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateShieldMainIdle()

	local animId = self.animId_shieldMain_idle
	if animId ~= self.shieldMainAnimId then
		self.shieldMainEffect:StartAnimationById( animId )
		self.shieldMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateShieldMainHit()

	local animId = self.animId_shieldMain_hit
	if animId ~= self.shieldMainAnimId then
		self.shieldMainEffect:StartAnimationById( animId )
		self.shieldMainAnimId = animId
	end
	
end


--
function UI.HudPlayerShipInfoWnd:AnimateShieldMainActiveIdle()

	local animId = self.animId_shieldMain_active_idle
	if animId ~= self.shieldMainAnimId then
		self.shieldMainEffect:StartAnimationById( animId )
		self.shieldMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateShieldMainActiveHit()

	local animId = self.animId_shieldMain_active_hit
	if animId ~= self.shieldMainAnimId then
		self.shieldMainEffect:StartAnimationById( animId )
		self.shieldMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateSlaveShieldMainIdle()

	local animId = self.animId_slaveShieldMain_idle
	if animId ~= self.slaveShieldMainAnimId then
		self.slaveShieldMainEffect:StartAnimationById( animId )
		self.slaveShieldMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateSlaveShieldMainHit()

	local animId = self.animId_slaveShieldMain_hit
	if animId ~= self.slaveShieldMainAnimId then
		self.slaveShieldMainEffect:StartAnimationById( animId )
		self.slaveShieldMainAnimId = animId
	end
	
end


--
function UI.HudPlayerShipInfoWnd:AnimateSlaveShieldMainActiveIdle()

	local animId = self.animId_slaveShieldMain_active_idle
	if animId ~= self.slaveShieldMainAnimId then
		self.slaveShieldMainEffect:StartAnimationById( animId )
		self.slaveShieldMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:AnimateSlaveShieldMainActiveHit()

	local animId = self.animId_slaveShieldMain_active_hit
	if animId ~= self.slaveShieldMainAnimId then
		self.slaveShieldMainEffect:StartAnimationById( animId )
		self.slaveShieldMainAnimId = animId
	end

end


--
function UI.HudPlayerShipInfoWnd:F_OnEffectAnimationEnded( effect, animName )

	if effect == self.hpMainEffect then
		self:AnimateHpMainIdle()

	elseif effect == self.slaveHpMainEffect then
		self:AnimateSlaveHpMainIdle()

	elseif effect == self.shieldMainEffect then

		if animName == self.effectInfo.shieldMain.animActivedHit then
			self:AnimateShieldMainActiveIdle()
		else
			self:AnimateShieldMainIdle()
		end

	elseif effect == self.slaveShieldMainEffect then

		if animName == self.effectInfo.shieldMain.animActivedHit then
			self:AnimateSlaveShieldMainActiveIdle()
		else
			self:AnimateSlaveShieldMainIdle()
		end

	end

end


--
function UI.HudPlayerShipInfoWnd:UpdateCenterPointEffect()

	local controlMode = _G.CL_GetLocalPlayerControlMode()
	local bVisible = controlMode ~= UI.ShipControlModes.LOCAL_TURRET and controlMode ~= UI.ShipControlModes.REMOTE_TURRET and not self.bOculus

	if bVisible ~= self.bCenterPointVisible then

		self:SetLayerVisible( bVisible, self.layers.CENTER_POINT_EFFECT )
		self.bCenterPointVisible = bVisible

	end

end


--
function UI.HudPlayerShipInfoWnd:SetAlpha( alpha )

	self.alpha = alpha

	self.mainEffect:SetAlpha( self.alpha )

	local color = UI:MakeArgb( alpha, alpha, alpha, alpha )

	self.speedValBoostBgEffect:SetColor( color )
	self.hpLowEffect:SetColor( color )
	self.speedBoostEffect:SetColor( color )

	self.strSpeedBaseColor = UI:Color2Str( UI:SetAlpha( self.speedBaseColor, self.alpha ) )

	local speedValText = _G.SetInternalTextAlpha( self:GetText( self.layers.SPEED_VAL ), self.alpha )
	if speedValText then
		self:SetText( speedValText, self.layers.SPEED_VAL )
	end	

end


--
function UI.HudPlayerShipInfoWnd:UpdateAlpha()

	local alpha = UI.Options:GetHudOptionVal( "hudPlayerShipInfoAlpha" )
	self:SetAlpha( alpha )

end