-- OAA = геймплей "one against all"
-- ----------------------------------------------------------------------------
-- UI.HudForcesinfoOAAWnd
-- ----------------------------------------------------------------------------

UI.HudForcesinfoOAAWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.HudForcesinfoOAAWnd.def =
{
	className = "Wnd",
	
	props =
	{
		name	= "HudForcesinfoOAAWnd",
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
				defName 			= "hud_forcesInfo_oaa_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "progr_players",
						wnd			= "UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "progr_boss",
						wnd			= "UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "p_progr",
						wnd			= "UI.HudForcesinfoOAA_GeneratorsWnd",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
	},
	
	children =
	{
		"UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide",
		"UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide",
		"UI.HudForcesinfoOAA_GeneratorsWnd",
	}
}

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.HudForcesinfoOAAWnd.layers =
{
	MAIN_EFFECT	= 0,
}

-- ---------------------------------------
-- work function
-- ---------------------------------------

--
function UI.HudForcesinfoOAAWnd:ResetEnemyInfo()

	if UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide:IsChildOf( self ) then
		UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide:Reset()
		UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide:UnlinkFromParent()
	end
	
	if UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:IsChildOf( self ) then
		UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:Reset()
		UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:UnlinkFromParent()
	end

end

--
function UI.HudForcesinfoOAAWnd:UpdateEnemyInfo()

	self:ResetEnemyInfo()
	
	if UI:IsLocalPlayerOAABoss() then
		self:AddChild( UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide )
	else
		self:AddChild( UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide )
	end
	
end


--
function UI.HudForcesinfoOAAWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:UpdateEnemyInfo()

end


-- показывается и на стороне босса, и на стороне обычных игроков
-- три генератора - главный и два второстепенных
-- ----------------------------------------------------------------------------
-- UI.HudForcesinfoOAA_GeneratorsWnd
-- ----------------------------------------------------------------------------

UI.HudForcesinfoOAA_GeneratorsWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.HudForcesinfoOAA_GeneratorsWnd.def =
{
	className = "Wnd",
	
	props =
	{
		name		= "HudForcesinfoOAA_GeneratorsWnd",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "hud_forcesInfo_oaa_generators",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
					
					{
						objName		= "p_progr_2",
						wnd			= "UI.HudForcesinfoOAA_GeneratorWnd_MAIN",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "p_progr_1",
						wnd			= "UI.HudForcesinfoOAA_GeneratorWnd_LEFT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "p_progr_3",
						wnd			= "UI.HudForcesinfoOAA_GeneratorWnd_RIGHT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "p_link_1",
						layer		= "UI.HudForcesinfoOAA_GeneratorsWnd.layers.LINK_LEFT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "p_link_2",
						layer		= "UI.HudForcesinfoOAA_GeneratorsWnd.layers.LINK_RIGHT_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- LINK_LEFT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_forcesInfo_oaa_generators_link",
				defaultAnimation	= "idle",
			}}
		},
		
		-- LINK_RIGHT_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "hud_forcesInfo_oaa_generators_link",
				defaultAnimation	= "idle",
			}}
		}
	},
	
	children =
	{
		"UI.HudForcesinfoOAA_GeneratorWnd_MAIN",
		"UI.HudForcesinfoOAA_GeneratorWnd_LEFT",
		"UI.HudForcesinfoOAA_GeneratorWnd_RIGHT",
	}
}

-- ---------------------------------------
-- interface funtions
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_GeneratorsWnd:Reset()
	
	self.mainEntId	= -1
	self.leftEntId	= -1
	self.rightEntId	= -1
	self.mainEnt	= nil
	self.leftEnt	= nil
	self.rightEnt	= nil
	
	self:SetLayerVisible( false, self.layers.LINK_LEFT_EFFECT )
	self.bLeftLinkVisible = false
	
	self:SetLayerVisible( false, self.layers.LINK_RIGHT_EFFECT )
	self.bRightLinkVisible = false
	
	UI.HudForcesinfoOAA_GeneratorWnd_MAIN:Reset()
	UI.HudForcesinfoOAA_GeneratorWnd_LEFT:Reset()
	UI.HudForcesinfoOAA_GeneratorWnd_RIGHT:Reset()

end


-- если хотя бы один из второстепенных генераторов жив, то на главном генераторе есть щит
function UI.HudForcesinfoOAA_GeneratorsWnd:HasMainGeneratorShield()

	local bLeftGeneratorAlive = _G.IsEntIdValid( self.leftEntId ) and not self.leftEnt:IsDead()
	local bRightGeneratorAlive = _G.IsEntIdValid( self.rightEntId ) and not self.rightEnt:IsDead()
	
	return bLeftGeneratorAlive or bRightGeneratorAlive

end

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.HudForcesinfoOAA_GeneratorsWnd.layers =
{
	MAIN_EFFECT			= 0,
	LINK_LEFT_EFFECT	= 1,
	LINK_RIGHT_EFFECT	= 2,
}

UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes =
{
	MAIN	= 1,
	LEFT	= 2,
	RIGHT	= 3,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.HudForcesinfoOAA_GeneratorsWnd.mainEntId			= -1
UI.HudForcesinfoOAA_GeneratorsWnd.leftEntId			= -1
UI.HudForcesinfoOAA_GeneratorsWnd.rightEntId		= -1
UI.HudForcesinfoOAA_GeneratorsWnd.mainEnt			= nil
UI.HudForcesinfoOAA_GeneratorsWnd.leftEnt			= nil
UI.HudForcesinfoOAA_GeneratorsWnd.rightEnt			= nil

UI.HudForcesinfoOAA_GeneratorsWnd.bLeftLinkVisible	= false
UI.HudForcesinfoOAA_GeneratorsWnd.bRightLinkVisible	= false

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_GeneratorsWnd:FullUpdate()

	self:Reset()
	
	local mainEntIds = _G.GetEntitiesByDef( "OAA_MainGenerator" )
	if #mainEntIds == 1 then
		self.mainEntId = mainEntIds[ 1 ]
		self.mainEnt = self.mainEntId ~= -1 and _G.Entities[ self.mainEntId ]
	else
		sys.log( "UI.HudForcesinfoOAA_GeneratorsWnd:FullUpdate()[ERROR]: %s", #mainEntIds == 0 and "no entity of def 'OAA_MainGenerator' found" or "more than one entity of def 'OAA_MainGenerator'" )
	end
	
	local leftEntIds = _G.GetEntitiesByDef( "OAA_SideGenerator1" )
	if #leftEntIds == 1 then
		self.leftEntId = leftEntIds[ 1 ]
		self.leftEnt = self.leftEntId ~= -1 and _G.Entities[ self.leftEntId ]
	else
		sys.log( "UI.HudForcesinfoOAA_GeneratorsWnd:FullUpdate()[ERROR]: %s", #leftEntIds == 0 and "no entity of def 'OAA_SideGenerator1' found" or "more than one entity of def 'OAA_SideGenerator1'" )
	end
	
	local rightEntIds = _G.GetEntitiesByDef( "OAA_SideGenerator2" )
	if #rightEntIds == 1 then
		self.rightEntId = rightEntIds[ 1 ]
		self.rightEnt = self.rightEntId ~= -1 and _G.Entities[ self.rightEntId ]
	else
		sys.log( "UI.HudForcesinfoOAA_GeneratorsWnd:FullUpdate()[ERROR]: %s", #rightEntIds == 0 and "no entity of def 'OAA_SideGenerator2' found" or "more than one entity of def 'OAA_SideGenerator2'" )
	end
	
	UI.HudForcesinfoOAA_GeneratorWnd_MAIN:Setup( self.mainEnt )
	UI.HudForcesinfoOAA_GeneratorWnd_LEFT:Setup( self.leftEnt )
	UI.HudForcesinfoOAA_GeneratorWnd_RIGHT:Setup( self.rightEnt )
	
	self:UpdateLinks()

end


--
function UI.HudForcesinfoOAA_GeneratorsWnd:UpdateLinks()

	-- перемычки между главным и второстепенными генераторами,
	-- отображаются только если соответствующий второстепенный генератор жив
	
	local bLeftLinkVisible = _G.IsEntIdValid( self.leftEntId ) and not self.leftEnt:IsDead()
	
	if bLeftLinkVisible ~= self.bLeftLinkVisible then
		self:SetLayerVisible( bLeftLinkVisible, self.layers.LINK_LEFT_EFFECT )
		self.bLeftLinkVisible = bLeftLinkVisible
	end
	
	local bRightLinkVisible = _G.IsEntIdValid( self.rightEntId ) and not self.rightEnt:IsDead()
	
	if bRightLinkVisible ~= self.bRightLinkVisible then
		self:SetLayerVisible( bRightLinkVisible, self.layers.LINK_RIGHT_EFFECT )
		self.bRightLinkVisible = bRightLinkVisible
	end

end


--
function UI.HudForcesinfoOAA_GeneratorsWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.HudForcesinfoOAA_GeneratorsWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateLinks()
	
end


-- ----------------------------------------------------------------------------
-- UI.HudForcesinfoOAA_GeneratorWnd
-- ----------------------------------------------------------------------------

UI.HudForcesinfoOAA_GeneratorWnd = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.HudForcesinfoOAA_GeneratorWnd.def =
{
	className = "Wnd",
	
	props =
	{
		name		= "HudForcesinfoOAA_GeneratorWnd",
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
				defName 			= "hud_forcesInfo_oaa_generator",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "p_progr_1",
						layer		= "UI.HudForcesinfoOAA_GeneratorWnd.layers.CENTER_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "p_progr_2",
						layer		= "UI.HudForcesinfoOAA_GeneratorWnd.layers.FRAME_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- CENTER_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfo_oaa_generator_center",
				
				links =
				{
					{
						objName		= "title",
						layer		= "UI.HudForcesinfoOAA_GeneratorWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- NAME
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
		
		-- FRAME_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfo_oaa_generator_frame",
				defaultAnimation	= "idle",
			}}
		},
	},
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_GeneratorWnd:Setup( ent )

	self:Reset()
	
	self.ent = ent
	self.entId = ent and ent:GetId() or -1
	
	self:UpdateName()
	
	self:Update()	-- апдейт всего, что апдейтится каждый кадр

end


--
function UI.HudForcesinfoOAA_GeneratorWnd:Reset()

	self.entId = -1
	self.ent = nil
	
	self:SetText( "", self.layers.NAME )
	
	self:SetLayerVisible( false, self.layers.NAME )
	self.bNameVisible = false
	
	if self.centerEffect and self.centerAnimId_dead ~= -1 then
		self.centerEffect:StartAnimationById( self.centerAnimId_dead )
		self.centerAnimId = self.centerAnimId_dead
	end
	
	self:SetCenterProgress( 1 )
	self:SetFrameProgress( 1 )
	
end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.HudForcesinfoOAA_GeneratorWnd.layers =
{
	MAIN_EFFECT		= 0,
	CENTER_EFFECT	= 1,
	NAME			= 2,
	FRAME_EFFECT	= 3,
}

UI.HudForcesinfoOAA_GeneratorWnd.effectInfo =
{
	center =
	{
		animShield		= "idle_2",
		animProgress	= "idle_3",
		animDead		= "idle",
	},
	
	frame =
	{
		animLeft	= "idle_1",
		animRight	= "idle_2",
	},
}

UI.HudForcesinfoOAA_GeneratorWnd.generatorType = -1	-- переопределяется в дочерних классах

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.HudForcesinfoOAA_GeneratorWnd.entId					= -1
UI.HudForcesinfoOAA_GeneratorWnd.ent					= nil

UI.HudForcesinfoOAA_GeneratorWnd.centerEffect			= nil
UI.HudForcesinfoOAA_GeneratorWnd.frameEffect			= nil
UI.HudForcesinfoOAA_GeneratorWnd.centerAnimId_shield	= -1
UI.HudForcesinfoOAA_GeneratorWnd.centerAnimId_progress	= -1
UI.HudForcesinfoOAA_GeneratorWnd.centerAnimId_dead		= -1

UI.HudForcesinfoOAA_GeneratorWnd.bNameVisible			= false
UI.HudForcesinfoOAA_GeneratorWnd.centerAnimId			= -1
UI.HudForcesinfoOAA_GeneratorWnd.centerProgress			= 1
UI.HudForcesinfoOAA_GeneratorWnd.frameProgress			= 1

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_GeneratorWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self.centerEffect	= UI:GetEffectFromLayer( self, self.layers.CENTER_EFFECT )
	self.frameEffect	= UI:GetEffectFromLayer( self, self.layers.FRAME_EFFECT )
	
	if self.centerEffect then
		self.centerAnimId_shield	= self.centerEffect:GetAnimationId( self.effectInfo.center.animShield )
		self.centerAnimId_progress	= self.centerEffect:GetAnimationId( self.effectInfo.center.animProgress )
		self.centerAnimId_dead		= self.centerEffect:GetAnimationId( self.effectInfo.center.animDead )
	end
	
	-- анимация обводки разная для левого и правого генераторов (рост по/против часовой стрелки)
	if self.frameEffect then
		local animId = self.generatorType == UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.LEFT and self.effectInfo.frame.animLeft or self.effectInfo.frame.animRight
		self.frameEffect:StartAnimation( animId )
	end
	
end


--
function UI.HudForcesinfoOAA_GeneratorWnd:UpdateName()
	
	local strIds =
	{
		[ UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.MAIN ]	= "gameplay_oaa_main",
		[ UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.LEFT ]	= "gameplay_oaa_gen1",
		[ UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.RIGHT ]	= "gameplay_oaa_gen2",
	}
	
	local strId = strIds[ self.generatorType ] or ""
	local name = UI:GetStringByName( strId )
	
	self:SetText( name, self.layers.NAME )
	
end


--
function UI.HudForcesinfoOAA_GeneratorWnd:Update()
	
	local animId			= -1
	local bNameVisible		= false
	local centerProgress	= 1
	local frameProgress		= 1
	
	-- главный генератор
	if self.generatorType == UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.MAIN then
	
		-- мертвый
		-- фон серый, имя черное, обводки нет
		if not _G.IsEntIdValid( self.entId ) or self.ent:IsDead() then
		
			animId			= self.centerAnimId_dead
			bNameVisible	= true
			frameProgress	= 0
		
		-- живой, есть щит (щит есть, если жив хотя бы один второстепенный генератор);
		-- фон в виде иконка щита, имени нет, обводка полностью заполненная
		elseif UI.HudForcesinfoOAA_GeneratorsWnd:HasMainGeneratorShield() then
		
			animId			= self.centerAnimId_shield
			bNameVisible	= false
			frameProgress	= 1

		-- живой, щита нет;
		-- фон красный, является прогрессбаром здоровья, имя белое, обводки нет
		else
		
			animId			= self.centerAnimId_progress
			bNameVisible	= true
			frameProgress	= 0

			local health = self.ent:GetHealth()
			local maxHealth = self.ent:GetMaxHealth()
			centerProgress = maxHealth ~= 0 and health / maxHealth or 0

		end
	
	-- второстепенные генераторы
	else
	
		-- мертвый;
		-- фон серый, имя черное, обводки нет
		if not _G.IsEntIdValid( self.entId ) or self.ent:IsDead() then
		
			animId			= self.centerAnimId_dead
			bNameVisible	= true
			frameProgress	= 0
		
		-- живой
		-- фон красный, имя белое, обводка является прогрессбаром здоровья
		else
		
			animId			= self.centerAnimId_progress
			bNameVisible	= true
			
			local health = self.ent:GetHealth()
			local maxHealth = self.ent:GetMaxHealth()
			frameProgress = maxHealth ~= 0 and health / maxHealth or 0
			
		end
	
	end
	
	if animId ~= self.centerAnimId and animId ~= -1 then
	
		if self.centerEffect then
		
			self.centerEffect:StartAnimationById( animId )
			self.centerAnimId = animId
			
			-- при смене анимации время сбрасывется в 0, поэтому обязательная установка времени
			self:SetCenterProgress( centerProgress )
			
		end
		
	end
	
	if bNameVisible ~= self.bNameVisible then
		self:SetLayerVisible( bNameVisible, self.layers.NAME )
		self.bNameVisible = bNameVisible
	end
	
	if centerProgress ~= self.centerProgress then
		self:SetCenterProgress( centerProgress )
	end
	
	if frameProgress ~= self.frameProgress then
		self:SetFrameProgress( frameProgress )
	end

end


--
function UI.HudForcesinfoOAA_GeneratorWnd:SetCenterProgress( centerProgress )

	if self.centerEffect then
		self.centerEffect:SetAnimationTimeAndUpdate( 1 - UI:Clamp( centerProgress, 0, 1 ) ) -- анимация в эффекте сделана наоборот - 0 это полностью заполненный прогрессбар
		self.centerProgress = centerProgress
	end
	
end


--
function UI.HudForcesinfoOAA_GeneratorWnd:SetFrameProgress( frameProgress )
	
	if self.frameEffect then
		self.frameEffect:SetAnimationTimeAndUpdate( 1 - UI:Clamp( frameProgress, 0, 1 ) ) -- анимация в эффекте сделана наоборот - 0 это полностью заполненный прогрессбар
		self.frameProgress = frameProgress
	end
	
end


--
function UI.HudForcesinfoOAA_GeneratorWnd:F_OnNewFrame( hSender, dt_sys, dt_game )
	
	self:Update()
	
end


-- ----------------------------------------------------------------------------
-- UI.HudForcesinfoOAA_GeneratorWnd_MAIN,
-- UI.HudForcesinfoOAA_GeneratorWnd_LEFT
-- UI.HudForcesinfoOAA_GeneratorWnd_RIGHT
-- ----------------------------------------------------------------------------

--
UI.HudForcesinfoOAA_GeneratorWnd_MAIN =
{
	def =
	{
		className	= "Wnd",
		prototype	= "HudForcesinfoOAA_GeneratorWnd",
		
		props =
		{
			name	= "HudForcesinfoOAA_GeneratorWnd_MAIN",
		}
	},
	
	generatorType = UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.MAIN
}


--
UI.HudForcesinfoOAA_GeneratorWnd_LEFT =
{
	def =
	{
		className	= "Wnd",
		prototype	= "HudForcesinfoOAA_GeneratorWnd",
		
		props =
		{
			name	= "HudForcesinfoOAA_GeneratorWnd_LEFT",
		}
	},
	
	generatorType = UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.LEFT
}


--
UI.HudForcesinfoOAA_GeneratorWnd_RIGHT =
{
	def =
	{
		className	= "Wnd",
		prototype	= "HudForcesinfoOAA_GeneratorWnd",
		
		props =
		{
			name	= "HudForcesinfoOAA_GeneratorWnd_RIGHT",
		}
	},
	
	generatorType = UI.HudForcesinfoOAA_GeneratorsWnd.generatorTypes.RIGHT
}

-- показывается только на стороне босса
-- сколько врагов осталось
-- ----------------------------------------------------------------------------
-- UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide
-- ----------------------------------------------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide.def =
{
	className = "Wnd",
	
	props =
	{
		name		= "HudForcesinfoOAA_EnemyInfoWnd_BossSide",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "hud_forcesInfo_oaa_enemyInfo_bossSide",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title10",
						layer		= "UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide.layers.LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "title8",
						layer		= "UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide.layers.PLAYERS_LEFT",
						animParams	= UI.EffectAnimParams.ALL,
					},
				}
			}}
		},
		
		-- LABEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hudForcesInfo_oaa_playersLeft" ),
		},
		
		-- PLAYERS_LEFT
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
		},
	},
}

-- ---------------------------------------
-- interface functions
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide:Reset()

	self:SetText( "", self.layers.PLAYERS_LEFT )
	self.playersLeft = -1

end

-- ---------------------------------------
-- const
-- ---------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide.layers =
{
	MAIN_EFFECT		= 0,
	LABEL			= 1,
	PLAYERS_LEFT	= 2,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide.playersLeft = -1

-- ---------------------------------------
-- work functions
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide:Update()

	local playersLeft, playerTotal = _G.CL_GetNumSurvivors()

	if playersLeft ~= self.playersLeft then
		self:SetText( tostring( playersLeft ), self.layers.PLAYERS_LEFT )
		self.playersLeft = playersLeft
	end

end


--
function UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:Update()
	
end


-- показывается только на стороне обычных игроков
-- отображает здоровье и щит босса
-- ----------------------------------------------------------------------------
-- UI.HudForcesinfoOAA_EnemyInfoWnd_BossSide
-- ----------------------------------------------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide = {}

-- ---------------------------------------
-- window definition
-- ---------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.def =
{
	className = "Wnd",
	
	props =
	{
		name		= "HudForcesinfoOAA_EnemyInfoWnd_PlayersSide",
		style		= UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT + UI.WS_UPDATE_IF_VISIBLE,
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
				defName 			= "hud_forcesInfo_oaa_enemyInfo_playersSide",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title8",
						layer		= "UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.layers.LABEL",
						animParams	= UI.EffectAnimParams.ALL,
					},
					
					{
						objName		= "progr_1",
						layer		= "UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.layers.PB_EFFECT_SHIELD",
						animParams	= UI.EffectAnimParams.POS,
					},
					
					{
						objName		= "progr_2",
						layer		= "UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.layers.PB_EFFECT_HP",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},
		
		-- LABEL
		{
			layerType		= UI.LAYER_TEXT,
			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
			formatInfoSz	= { 1, 1 },
			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "hudForcesInfo_oaa_boss" ),
		},
		
		-- PB_EFFECT_SHIELD
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfo_oaa_enemyInfo_playersSide_pb_shield",
				defaultAnimation	= "idle",
			}}
		},
		
		-- PB_EFFECT_HP
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "hud_forcesInfo_oaa_enemyInfo_playersSide_pb_hp",
				defaultAnimation	= "idle",
			}}
		}
	},
}

-- ---------------------------------------
-- interface funcitons
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:Reset()

	self.bossPlayerIdx = -1
	
	if self.hpEffect then
		self.hpEffect:SetAnimationTimeAndUpdate( 0 )
		self.hpAnimTime = 0
	end
	
	if self.shieldEffect then
		self.shieldEffect:SetAnimationTimeAndUpdate( 0 )
		self.shieldAnimTime	= 0
	end

end


-- ---------------------------------------
-- const
-- ---------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.layers =
{
	MAIN_EFFECT			= 0,
	LABEL				= 1,
	PB_EFFECT_SHIELD	= 2,
	PB_EFFECT_HP		= 3,
}

-- ---------------------------------------
-- vars
-- ---------------------------------------

UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.bossPlayerIdx	= -1

UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.hpEffect		= nil
UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.shieldEffect	= nil

UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.hpAnimTime		= 0
UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide.shieldAnimTime	= 0

-- ---------------------------------------
-- work funcitons
-- ---------------------------------------

--
function UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:F_PostLoad()
	
	UI.Wnd.F_PostLoad( self )
	
	self.hpEffect		= UI:GetEffectFromLayer( self, self.layers.PB_EFFECT_HP )
	self.shieldEffect	= UI:GetEffectFromLayer( self, self.layers.PB_EFFECT_SHIELD )
	
end


--
function UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:Update()

	local ent = _G.CL_GetPlayerShip( self.bossPlayerIdx )
	
	local hp		= ent and ent:GetHealth() or 0
	local maxHp		= ent and ent:GetMaxHealth() or 0
	local shield	= ent and ent:GetShieldVal() or 0
	local maxShield	= ent and ent:GetShieldMax() or 0
	
	local maxHpAndShieldSum	= maxHp + maxShield
	local hpPart			= maxHpAndShieldSum ~= 0 and maxHp / maxHpAndShieldSum or 0
	local shieldPart		= maxHpAndShieldSum ~= 0 and maxShield / maxHpAndShieldSum or 0

	-- щит рисуется ПОД здоровьем, начало слева у них одно,
	-- но выглядеть должно так, будто слева здоровье, а правее щит
	local hpAnimTime		= UI:Clamp( maxHp ~= 0 and hp / maxHp or 0, 0, 1 ) * hpPart
	local shieldAnimTime	= UI:Clamp( maxShield ~= 0 and shield / maxShield or 0, 0, 1 ) * shieldPart + hpAnimTime
	
	if hpAnimTime ~= self.hpAnimTime then
		if self.hpEffect then
			self.hpEffect:SetAnimationTimeAndUpdate( hpAnimTime )
			self.hpAnimTime = hpAnimTime
		end
	end
	
	if shieldAnimTime ~= self.shieldAnimTime then
		if self.shieldEffect then
			self.shieldEffect:SetAnimationTimeAndUpdate( shieldAnimTime )
			self.shieldAnimTime = shieldAnimTime
		end
	end
	
end


--
function UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	
	self:Reset()
	
	self.bossPlayerIdx = UI:GetOAABossPlayerIdx()
	
	self:Update()	-- апдейт всего, что апдейтится каждый кадр

end


--
function UI.HudForcesinfoOAA_EnemyInfoWnd_PlayersSide:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:Update()
	
end