-- ----------------------------------------------------------------------------
--
-- Workfile: hudmapwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.HudMapWnd = {}
local hm = UI.HudMapWnd

-- ------------------------------
-- window definition
-- ------------------------------

UI.HudMapWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "HudMapWnd",
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
				defName 			= "hud_map_main",
				defaultAnimation	= "idle",

				links =
				{
    				{
    					objName		= "self",
    					animParams	= UI.EffectAnimParams.SIZE,
    				},

    				{
    					objName		= "navigator_bg",
    					layer		= "UI.HudMapWnd.layers.RADAR_BG_EFFECT",
    					animParams	= UI.EffectAnimParams.POS,
    				},

    				{
    					objName		= "minimap_bg",
    					layer		= "UI.HudMapWnd.layers.MAP_BG_EFFECT",
    					animParams	= UI.EffectAnimParams.POS,
    				},
				}
			}}
		}, 

		-- RADAR_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "hud_map_radarBg",
				defaultAnimation	= "idle",
			}}
		}, 

		-- MAP_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,

			effects =
			{{
				defName 			= "hud_map_mapBg",
				defaultAnimation	= "idle",
			}}
		},

		-- OBJECTS
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE + UI.WLS_OWNERDRAW,
		}, 
	}
}  


-- ------------------------------
-- interface functions
-- ------------------------------

--
function UI.HudMapWnd:AddVitalPoint( entityId )

	local objType = _G.GetCurrentGameMode() == ai.Gameplay.CLANSHIP and self.objTypes.CLANSHIP_VITAL_POINT or self.objTypes.VITAL_POINT
	self:AddObj( entityId, objType, -1 )

end


--
function UI.HudMapWnd:OnSpawnSpaceShip( shipId )	

	self:AddObj( shipId, -1 )

end


--
function UI.HudMapWnd:OnSpawnAdventureGiver( giverId )

	self:AddObj( giverId, -1 )

end


--
function UI.HudMapWnd:AddHudObj( entId )

	self:AddObj( entId, -1, -1 )

end


--
function UI.HudMapWnd:OnRemoveEntityFromHud( entityId )

	self:DeleteObj( entityId )

end


--
function UI.HudMapWnd:OnPlayerSqidChanged( playerIdx, sqid )

	if _G.GetCurrentGameMode() == ai.Gameplay.NONE then
		return
	end

	local mySqid = _G.CL_GetPlayerSquad( UI.HudWnd.localPlayerId )

	for idx, obj in ipairs( self.objectsArr ) do

    	if obj.playerId ~= -1 then

			local playerSqid = _G.CL_GetPlayerSquad( obj.playerId )
			obj.bMySquad = mySqid ~= UI.INVALID_U64_ID and playerSqid == mySqid

		end

	end

end


-- ------------------------------
-- const
-- ------------------------------

hm.layers =
{
	MAIN_EFFECT		= 0,
	RADAR_BG_EFFECT	= 1,
	MAP_BG_EFFECT   = 2,
	OBJECTS			= 3,
}

hm.icoAnimModes =
{
	REGULAR						= 1,
	VP_UNDER_ATTACK				= 2,
	LOCKED						= 3,
	LOCKING						= 4,
}	

hm.effectInfo =
{
	main =
	{
		radiusLargeObjName	= "dist_1",
		radiusSmallObjName	= "dist_2",
		axisLowObjName		= "navigator_bottom_y",
		axisHighObjName		= "navigator_navigator_top_y",
		planeObjName		= "navigator_plane",
		overlayObjName		= "navigator_top_sprite",
		centerObjPos		= "center",
		mapBgLocator		= "minimap_bg",
	},

	obj =
	{
		effectName		= "hud_map_shipType",

		icoAnims =
		{
        	[ hm.icoAnimModes.REGULAR ] =
			{
            	[ UI.gameObjColorSchemes.FRIEND ]		= "friend",
            	[ UI.gameObjColorSchemes.ENEMY ]		= "enemy",
            	[ UI.gameObjColorSchemes.NEUTRAL ]		= "neutral",
            	[ UI.gameObjColorSchemes.SQUAD ]		= "squad",
				[ UI.gameObjColorSchemes.ME ]			= "me",
            	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= "agressiv",
            	[ UI.gameObjColorSchemes.ALIEN ]		= "nlo",
        	},

        	[ hm.icoAnimModes.VP_UNDER_ATTACK ] =
        	{
				[ UI.gameObjColorSchemes.FRIEND ]		= "friend_locking",
        	},

        	[ hm.icoAnimModes.LOCKED ] =
        	{
            	[ UI.gameObjColorSchemes.FRIEND ]		= "friend_lock",
            	[ UI.gameObjColorSchemes.ENEMY ]		= "lock",
            	[ UI.gameObjColorSchemes.NEUTRAL ]		= "neutral_lock",
            	[ UI.gameObjColorSchemes.SQUAD ]		= "squad_lock",
				[ UI.gameObjColorSchemes.ME ]			= "me_lock",
            	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= "agressiv_lock",
            	[ UI.gameObjColorSchemes.ALIEN ]		= "nlo_lock",
        	},

        	[ hm.icoAnimModes.LOCKING ] =
        	{
            	[ UI.gameObjColorSchemes.FRIEND ]		= "friend_locking",
            	[ UI.gameObjColorSchemes.ENEMY ]		= "locking",
            	[ UI.gameObjColorSchemes.NEUTRAL ]		= "neutral_locking",
            	[ UI.gameObjColorSchemes.SQUAD ]		= "squad_locking",
				[ UI.gameObjColorSchemes.ME ]			= "me_locking",
            	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= "agressiv_locking",
            	[ UI.gameObjColorSchemes.ALIEN ]		= "nlo_locking",
        	}
		},

		icoSpriteName	= "ico",
		centerObjName	= "center",
		textObjName		= "value",
		animWhite		= "friend_lock",
	},

	objLine =
	{
		effectName		= "hud_map_objLine",
		animFriend		= "friend",
		animEnemy		= "enemy",
		animNeutral		= "neutral",
		animSquad		= "squad",
		animMe			= "me",
		animAgressive	= "agressiv",
		animAlien		= "nlo",
	}
}

hm.objTypes =
{
	DEFAULT					= 1, 
	PLAYER					= 2,
	VITAL_POINT				= 3,
	BOMB					= 4, 
	BOMB_SITE				= 5, 
	LOOT					= 6, 
	JUMP_GATE				= 7,
	MISSILE					= 8,
	CLANSHIP_VITAL_POINT	= 9,
}

hm.visibilityTypes =
{
	MAJOR	= 1,	-- отображается сразу как входит в зону видимости (по умолчанию)
	MINOR	= 2,	-- отображается только при приближении на некоторое константное расстояние ( MINOR_OBJECTS_DIST )
}

hm.MINOR_OBJECTS_DIST	= UI.MINOR_OBJECTS_DIST

hm.MAX_OBJECTS_BY_PASS	= 20

-- ------------------------------
-- vars
-- ------------------------------

hm.objects				= {}
hm.objectsArr			= {}
hm.numObjects			= 0
hm.visObjects			= {}
hm.numVisObjects		= 0
hm.radiusLarge_abs  	= 0
hm.radiusSmall_abs		= 0
hm.radarSin				= 0
hm.center_rel			= Vec2( 0, 0 )
hm.objLineSize_rel		= Vec2( 0, 0 )
hm.objIcoCenter_rel		= Vec2( 0, 0 )
hm.mode					= -1
hm.mapRect				= Quat( 0, 0, 0, 0 )
hm.mapMaxRect			= Quat( 0, 0, 0, 0 )
hm.pass					= 1
hm.numPasses			= 1
hm.objectsByPass		= { [1] = { numObjects = 0, objects = {} } }

hm.fnUpdateObjPassFit		= {}
hm.fnUpdateVisObj			= {}
hm.fnCheckAddVisObj			= {}
hm.fnCheckDeleteVisObj		= {}
hm.fnUpdateIcoRot			= {}
hm.fnStartEffectAnimation	= {}
hm.fnNeedObjBeVisibleByType	= {}

hm.animId_line =
{
	[ UI.gameObjColorSchemes.FRIEND ]		= -1,
	[ UI.gameObjColorSchemes.ENEMY ]		= -1,
	[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
	[ UI.gameObjColorSchemes.SQUAD ]		= -1,
	[ UI.gameObjColorSchemes.ME ]			= -1,
	[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
	[ UI.gameObjColorSchemes.ALIEN ]		= -1,
}

hm.icoAnimIds		= {}
hm.icoAnimIdWhite	= -1

-- ------------------------------
-- work functions
-- ------------------------------

--
function UI.HudMapWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )
	
	if self:IsPrototype() then
		return
	end
	
	self.objects					= {}
	self.objectsArr					= {}
	self.visObjects					= {}
	self.center_rel					= Vec2( 0, 0 )
	self.objLineSize_rel			= Vec2( 0, 0 )
	self.objIcoCenter_rel			= Vec2( 0, 0 )
	self.mapRect					= Quat( 0, 0, 0, 0 )
	self.mapMaxRect					= Quat( 0, 0, 0, 0 )
	self.objectsByPass				= { [1] = { numObjects = 0, objects = {} } }
	self.fnUpdateObjPassFit			= {}
	self.fnUpdateVisObj				= {}
	self.fnCheckAddVisObj			= {}
	self.fnCheckDeleteVisObj		= {}
	self.fnUpdateIcoRot				= {}
	self.fnStartEffectAnimation		= {}
	self.fnNeedObjBeVisibleByType	= {}
	self.animId_line =
	{
		[ UI.gameObjColorSchemes.FRIEND ]		= -1,
		[ UI.gameObjColorSchemes.ENEMY ]		= -1,
		[ UI.gameObjColorSchemes.NEUTRAL ]		= -1,
		[ UI.gameObjColorSchemes.SQUAD ]		= -1,
		[ UI.gameObjColorSchemes.ME ]			= -1,
		[ UI.gameObjColorSchemes.AGGRESSIVE ]	= -1,
		[ UI.gameObjColorSchemes.ALIEN ]		= -1,
	}
	self.icoAnimIds		= {}

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		self.center_rel = mainEffect:GetObjPos( self.effectInfo.main.centerObjPos )
	end

	self:RecalcAbsValues()

	local handle = self:GetUiHandle()

	local icoEffect = _G.UI_SpawnEffect( self.effectInfo.obj.effectName, handle )
	if icoEffect then

		for animModeName, animMode in pairs( self.icoAnimModes ) do

			self.icoAnimIds[ animMode ] = {}

			for colorScheme, animName in pairs( self.effectInfo.obj.icoAnims[ animMode ] ) do
				self.icoAnimIds[ animMode ][ colorScheme ] = icoEffect:GetAnimationId( animName )
			end			

		end 

		self.icoAnimIdWhite = icoEffect:GetAnimationId( self.effectInfo.obj.animWhite )

		self.objIcoCenter_rel = icoEffect:GetObjPos( self.effectInfo.obj.centerObjName )

		_G.UI_DestroyEffect( icoEffect )

	end

	local lineEffect = _G.UI_SpawnEffect( self.effectInfo.objLine.effectName, handle )
	if lineEffect then

		self.animId_line = {}
        self.animId_line[ UI.gameObjColorSchemes.FRIEND ]		= lineEffect:GetAnimationId( self.effectInfo.objLine.animFriend )
        self.animId_line[ UI.gameObjColorSchemes.ENEMY ]		= lineEffect:GetAnimationId( self.effectInfo.objLine.animEnemy )
        self.animId_line[ UI.gameObjColorSchemes.NEUTRAL ]		= lineEffect:GetAnimationId( self.effectInfo.objLine.animNeutral )
        self.animId_line[ UI.gameObjColorSchemes.SQUAD ]		= lineEffect:GetAnimationId( self.effectInfo.objLine.animSquad )
		self.animId_line[ UI.gameObjColorSchemes.ME ]			= lineEffect:GetAnimationId( self.effectInfo.objLine.animMe )
        self.animId_line[ UI.gameObjColorSchemes.AGGRESSIVE ]	= lineEffect:GetAnimationId( self.effectInfo.objLine.animAgressive )
        self.animId_line[ UI.gameObjColorSchemes.ALIEN ]		= lineEffect:GetAnimationId( self.effectInfo.objLine.animAlien )

    	self.objLineSize_rel = lineEffect:GetObjSize( "self" )
		_G.UI_DestroyEffect( lineEffect )

	end

	local mapBgEffect = UI:GetEffectFromLayer( self, self.layers.MAP_BG_EFFECT )
	if mapBgEffect then

		local mapPos = mainEffect and mainEffect:GetObjPos( self.effectInfo.main.mapBgLocator ) or UI:ZeroVec2()
		local mapSize = mapBgEffect:GetObjSize( "self" )

		self.mapRect	= Quat( mapPos.x, mapPos.y, mapSize.x, mapSize.y )
		self.mapMaxRect = UI:QuatCopyStable( UI:InflateRect( self.mapRect, -self.objIcoCenter_rel.x, -self.objIcoCenter_rel.y ) )

	end

    self.fnUpdateObjPassFit =
	{
		[ true ]	= self.UpdateObjPassFit_visible,
    	[ false ]	= self.UpdateObjPassFit_notVisible,
	}

	self.fnUpdateVisObj =
	{
		[ true ]	= self.UpdateVisObj,
    	[ false ]	= self.Dumb,
	}

    self.fnCheckAddVisObj =
	{
		[ true ]	= self.AddVisObj,
		[ false ]	= self.Dumb,
	}

    self.fnCheckDeleteVisObj =
	{
		[ true ]	= self.DeleteVisObj,
    	[ false ]	= self.Dumb,
	}

    self.fnUpdateIcoRot =
	{
		[ true ]	= self.UpdateIcoRot,
    	[ false ]	= self.Dumb,
	}

    self.fnStartEffectAnimation =
	{
		[ true ]	= self.StartEffectAnimation,
		[ false ]	= self.Dumb,
	}

	self.fnNeedObjBeVisibleByType =
	{
		[ self.objTypes.DEFAULT ]				= self.NeedObjBeVisibleByType_DEFAULT,
		[ self.objTypes.PLAYER ]				= self.NeedObjBeVisibleByType_PLAYER,
		[ self.objTypes.VITAL_POINT ]			= self.NeedObjBeVisibleByType_VITAL_POINT,
		[ self.objTypes.BOMB ]					= self.NeedObjBeVisibleByType_BOMB,
		[ self.objTypes.BOMB_SITE ]				= self.NeedObjBeVisibleByType_BOMB_SITE,
		[ self.objTypes.LOOT ]					= self.NeedObjBeVisibleByType_default,
		[ self.objTypes.JUMP_GATE ]				= self.NeedObjBeVisibleByType_default,
		[ self.objTypes.MISSILE ]				= self.NeedObjBeVisibleByType_default,
		[ self.objTypes.CLANSHIP_VITAL_POINT ]	= self.NeedObjBeVisibleByType_default,
	}
	
	self:UpdateBackground()

	UI:SubscribeUiObjOnEvent( handle, UI.EV_SAVE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_RESTORE_UI_STATE )
	UI:SubscribeUiObjOnEvent( handle, UI.EV_END_LEVEL )	

end


--
function UI.HudMapWnd:F_Shutdown()

	if not self:IsPrototype() then
		self:ReleaseAllEffects()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.HudMapWnd:AddObj( entId, objType )

	if type( entId ) ~= "number" then
		sys.log( "UI.HudMapWnd:AddObj()[ERROR]: invalid type of the 1-st parameter (\"entId\"); \"number\" expected, got \"%s\"", type( entId ) )
		return
	end

	if type( objType ) == "number" then
		if objType ~= -1 then
        	if UI:Val2Key( self.objTypes, objType ) == "" then
        		sys.log( "UI.HudMapWnd:AddObj()[ERROR]: invalid 2-nd parameter (\"objType\"); one of the \"UI.HudMapWnd.objTypes\" values or -1 expected, got \"%s\"", tostring( objType ) )
				objType = -1
        	end
		end
	else
		sys.log( "UI.HudMapWnd:AddObj()[ERROR]: invalid type of the 2-nd parameter (\"objType\"); \"number\" expected, got \"%s\"", type( objType ) )
		objType = -1
	end

	if self.objects[ entId ] then
		return
	end

	local ent = _G.Entities[ entId ]
	if not ent then
		sys.log( "UI.HudMapWnd:AddObj()[ERROR]: cannot find entity with id %d", entId )
		return
	end

	local playerId = ent:GetPlayerIdx() or -1

	if objType == -1 then
		objType = self:DetectObjType( ent, playerId )
	end

	if objType == -1 then
		sys.log( "UI.HudMapWnd:AddObj()[ERROR]: cannot detect obj type" )
		return
	end

	if playerId == -1 and objType == self.objTypes.PLAYER then
		sys.log( "UI.HudMapWnd:AddObj()[ERROR]: invalid playerId for PLAYER obj type" )
		return
	end

    local defName = ent:GetDefName()
    local def = UI:GetDef( defName )

	local obj = {}

	obj.entId			= entId
	obj.ent				= ent
	obj.defName			= defName
	obj.objType			= objType
	obj.visibilityType	= self:DetectVisibiltyType( ent, objType )
	obj.playerId		= playerId
	obj.bMySquad		= false
	obj.bMyShip			= false

	if playerId ~= -1 then

		local playerSqid = _G.CL_GetPlayerSquad( playerId )
		if playerSqid ~= UI.INVALID_U64_ID then

			local mySqid = _G.CL_GetPlayerSquad( UI.HudWnd.localPlayerId )
			obj.bMySquad = playerSqid == mySqid

		end

	end

	local handle = self:GetUiHandle()

	obj.bVisible	= false
	obj.sortVal		= math.huge		-- Внимание! sortVal нужно обязательно устанавливать в math.huge при bVisible=false, иначе сломается удаление из списка visObjects

	-- эффект - полоса от иконки объекта до горизонтальной плоскости
	
	obj.effects = {}	

	local lineEffect = _G.UI_SpawnEffect( self.effectInfo.objLine.effectName, handle )
	if lineEffect then
		obj.effects[ 1 ] = { effect = lineEffect, animId = -1 }
	end     

	-- эффект - иконка объекта

	local icoEffect = _G.UI_SpawnEffect( self.effectInfo.obj.effectName, handle )
	if icoEffect then

		local hTex = UI:GetTex( "NoData" )

		if objType == self.objTypes.PLAYER then
    		local role = UI:GetItemRole( defName )
    		hTex = UI:GetRoleIco2( role )	-- в ежекадровом апдейте может быть заменена на иконку "мой корабль"

		elseif objType == self.objTypes.VITAL_POINT then
			hTex = UI:GetTex( "icoVitalPoint" )

		elseif objType == self.objTypes.DEFAULT then

			if type( def.hud_ico ) == "string" and def.hud_ico ~= "" then
				local texName = string.format( "%s_minimap", def.hud_ico )
				hTex = UI:GetTex( texName )
			else
				hTex = UI:GetTex( "unknow_navi" )
			end

		elseif objType == self.objTypes.BOMB then
			hTex = UI:GetTex( "shipType_bomb_ico" )

		elseif objType == self.objTypes.BOMB_SITE then
			hTex = UI:GetTex( "icoVitalPoint" )

		elseif objType == self.objTypes.LOOT then
			hTex = UI:GetTex( "loot_navi" )

		elseif objType == self.objTypes.JUMP_GATE then
			hTex = UI:GetTex( "warpgate_navi" )

		elseif objType == self.objTypes.MISSILE then
			hTex = UI:GetTex( "my_rocket" )

		elseif objType == self.objTypes.CLANSHIP_VITAL_POINT then
			hTex = UI:GetClanshipVpIcoSmall( defName )

		else
			sys.log( "UI.HudMapWnd:AddObj()[ERROR]: cannot init texture; unhanlded objType: %d", objType )
		end

		icoEffect:SetSpriteTexture( self.effectInfo.obj.icoSpriteName, hTex )
		obj.effects[ 2 ] = { effect = icoEffect, animId = -1 }

	end

	if objType == self.objTypes.VITAL_POINT or objType == self.objTypes.BOMB_SITE then

		obj.text = self:InitTextFromEffect( icoEffect, self.effectInfo.obj.textObjName )
		if obj.text then
			obj.text.string = UI:GetEntityLocalizedName( ent, false )
			obj.text.effectId = 2
		end

	end

	self.objects[ entId ] = obj	
	table.insert( self.objectsArr, obj )
	self.numObjects = self.numObjects + 1

	self:UpdateNumPasses()
	self:UpdateObjPass( obj )

end


--
function UI.HudMapWnd:DetectObjType( ent, playerId )

	local objType = -1

	local def = ent and UI:GetDef( ent:GetDefName() )
	if not def then
		return objType
	end

	-- прописан явно

	if def.hudType == "bomb" then
		objType = self.objTypes.BOMB

	elseif def.hudType == "bomb_site" then
		objType = self.objTypes.BOMB_SITE

	elseif def.hudType == "target" then
		objType = -1	-- не показывается на радаре, т.к. марка в худе только по кругу

	elseif def.hudType == "loot_crate" then
		objType = self.objTypes.LOOT

	elseif def.hudType == "default" then
		objType = self.objTypes.DEFAULT
	end 

	-- по умолчанию

	if objType == -1 then

		if def.class == "VitalPoint" then
			objType = _G.GetCurrentGameMode() == ai.Gameplay.CLANSHIP and self.objTypes.CLANSHIP_VITAL_POINT or self.objTypes.VITAL_POINT

		elseif _G.IsClassKindOf( def.class, "SpaceShip" ) and playerId ~= -1 then
			objType = self.objTypes.PLAYER

		elseif def.class == "LootCrate" then
			objType = self.objTypes.LOOT

		elseif def.class == "JumpDockLocation" then
			objType = self.objTypes.JUMP_GATE

		else
			objType = self.objTypes.DEFAULT
		end

	end

	return objType

end


--
function UI.HudMapWnd:DetectVisibiltyType( ent, objType )

	local visibilityType = -1

	local defName = ent:GetDefName()

	local def = ent and UI:GetDef( defName )
	if not def then
		return visibilityType
	end

	-- прописан явно

	if def and def.hud_visibility_type ~= nil then

		if type( def.hud_visibility_type ) == "string" then

			if def.hud_visibility_type == "major" then
				visibilityType = self.visibilityTypes.MAJOR	

			elseif def.hud_visibility_type == "minor" then
				visibilityType = self.visibilityTypes.MINOR

			else
				sys.log( "UI.HudMapWnd:DetectVisibiltyType()[ERROR]: unrecognized hud_visibility_type \"%s\" for \"%s\"", def.hud_visibility_type, defName )
			end

		else
			sys.log( "UI.HudMapWnd:DetectVisibiltyType()[ERROR]: invalid type of \"_G.Def[%s].hud_visibility_type\"; \"string\" or \"nil\" expected, got \"%s\"", defName, type( def.hud_visibility_type ) )
		end		

	end

	-- по умолчанию

	if visibilityType == -1 then

		if def.class == "VitalPointTurret" then
			visibilityType = self.visibilityTypes.MINOR

		elseif def.class == "Turret" then
			visibilityType = self.visibilityTypes.MINOR

		else
			visibilityType = self.visibilityTypes.MAJOR
		end
	end

	return visibilityType

end


--
function UI.HudMapWnd:InitTextFromEffect( effect, objName )

	if not effect then
		return nil
	end

	local objId = effect:GetObjIdByName( objName )
	if objId == -1 then
		return nil
	end

	local sz		= effect:GetObjSizeById( objId )
	local pos		= effect:GetObjPosById( objId )
	local alignment	= effect:GetObjAlignmentById( objId ) 
	local font		= effect:GetObjFontNameById( objId )
	local blend		= effect:GetObjBlendModeById( objId )
	local color		= effect:GetObjColorById( objId )
	local alpha		= effect:GetObjAlphaById( objId )
	
	local textInfo = {}
	textInfo.rect			= Quat( pos.x, pos.y, sz.x, sz.y )
	textInfo.format			= self:Alignment2FormatFlags( alignment )
	textInfo.hFont			= ObtainFont( font )
	textInfo.blend			= blend
	textInfo.color			= UI:SetAlpha( color, alpha )
	textInfo.effectObjId	= objId

	return textInfo

end


--
function UI.HudMapWnd:Alignment2FormatFlags( alignment )

	local flags = FONT.TF_SINGLELINE + FONT.TF_NOCLIP

	if bit.band( alignment, UI.EffectObjAlignment.ALIGNMENT_LEFT ) ~= 0 then
		flags = flags + FONT.TF_LEFT
	elseif bit.band( alignment, UI.EffectObjAlignment.ALIGNMENT_HCENTER ) ~= 0 then
		flags = flags + FONT.TF_HCENTER
	elseif bit.band( alignment, UI.EffectObjAlignment.ALIGNMENT_RIGHT ) ~= 0 then
		flags = flags + FONT.TF_RIGHT
	elseif bit.band( alignment, UI.EffectObjAlignment.ALIGNMENT_HFULL ) ~= 0 then
		flags = flags + FONT.TF_FULL
	else
		flags = flags + FONT.TF_LEFT
	end

	if bit.band( alignment, UI.EffectObjAlignment.ALIGNMENT_TOP ) ~= 0 then
		flags = flags + FONT.TF_TOP
	elseif bit.band( alignment, UI.EffectObjAlignment.ALIGNMENT_VCENTER ) ~= 0 then
		flags = flags + FONT.TF_VCENTER
	elseif bit.band( alignment, UI.EffectObjAlignment.ALIGNMENT_BOTTOM ) ~= 0 then
		flags = flags + FONT.TF_BOTTOM
	else
		flags = flags + FONT.TF_TOP
	end

	return flags	

end


--
function UI.HudMapWnd:DeleteObj( entId )

	local obj = self.objects[ entId ]
	if not obj then
		return
	end

	self:RelaseObjEffects( obj )

	self.objects[ entId ] = nil	

	for idx = 1, self.numObjects do

		if self.objectsArr[ idx ].entId == entId then
			
			self.objectsArr[ idx ] = self.objectsArr[ self.numObjects ]
			self.objectsArr[ self.numObjects ] = nil

			self.numObjects = self.numObjects - 1

			break

		end

	end

	if self.objectsByPass[ obj.pass ] then

		local numObjects = self.objectsByPass[ obj.pass ].numObjects
		for idx = 1, numObjects do

			if self.objectsByPass[ obj.pass ].objects[ idx ].entId == entId then

				self.objectsByPass[ obj.pass ].objects[ idx ] = self.objectsByPass[ obj.pass ].objects[ numObjects ]
				self.objectsByPass[ obj.pass ].objects[ numObjects ] = nil

				self.objectsByPass[ obj.pass ].numObjects = self.objectsByPass[ obj.pass ].numObjects - 1

				break

			end

		end

	end	

	for idx = 1, self.numVisObjects do

		if self.visObjects[ idx ].entId == entId then

			self.visObjects[ idx ] = self.visObjects[ self.numVisObjects ]
			self.visObjects[ self.numVisObjects ] = nil

			self.numVisObjects = self.numVisObjects - 1

			break

		end

	end

	self:UpdateNumPasses()

end


--
function UI.HudMapWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:UpdateObjects( false, dt_sys )

end


--
local fnSortPred = function( obj1, obj2 )

	return obj1.sortVal < obj2.sortVal

end


local l_data			= {}
local l_objData			= {}
local l_objObjData		= {}
local l_objectsToDelete	= {}

--
function UI.HudMapWnd:UpdateObjects( bUpdateAllPasses, dt )

	if not UI.HudWnd.myShip and self.mode == UI.minimapModes.RADAR then
		self:AddStyle( UI.WS_NOT_DRAW )
		return
	end

	self:RemoveStyle( UI.WS_NOT_DRAW  )

	local data = l_data
	_G.CL_GetMinimapData( data )
	data.radarWorld2AbsCf = data.visionRadius ~= 0 and self.radiusLarge_abs / data.visionRadius or 0
	data.bDisableLock = UI.HudWnd.myShip ~= nil and UI.HudWnd.myShip:CheckAura( ai.Aura.DISABLE_LOCK )

	local lockEntAlly	= UI.HudWnd.myShip and UI.HudWnd.myShip:GetTargetLockAlly()
	data.lockEntIdAlly	= lockEntAlly and lockEntAlly:GetId() or -1
	data.bLockingAlly	= false

	if data.missileEntId ~= -1 and not self.objects[ data.missileEntId ] then
		self:AddObj( data.missileEntId, self.objTypes.MISSILE, -1 )
	end

	local objectsToDelete = l_objectsToDelete

	local objects		= self.objectsByPass[ self.pass ].objects
	local numObjects	= self.objectsByPass[ self.pass ].numObjects

	if bUpdateAllPasses then
		objects		= self.objectsArr
		numObjects	= self.numObjects
	end

	for idx = 1, numObjects do

		local obj = objects[ idx ]

		local objData = l_objData
		_G.CL_GetMinimapObjData( objData, obj.entId, self.mode )

		if objData.bEntIdValid then

			objData.bHasQuest = UI.HudObjectsMarksWnd:HasMarkQuests( entId ) or UI.HudObjectsMarksWnd:HasMarkAdventures( entId )

			do
            	local bOldMyShip = obj.bMyShip
            	obj.bMyShip = obj.entId == data.myShipEntId

            	-- текстура иконки (апдейт независимо от видимости, т.к. это разовое действие)
                if obj.bMyShip ~= bOldMyShip and obj.objType == self.objTypes.PLAYER then
            	
            		local hTex = obj.bMyShip and UI:GetTex( "my_ship" ) or UI:GetRoleIco2( UI:GetItemRole( obj.defName ) )
                	obj.effects[ 2 ].effect:SetSpriteTexture( self.effectInfo.obj.icoSpriteName, hTex )

            	end

			end

        	self.fnUpdateObjPassFit[ self:NeedObjBeVisible( obj, data, objData ) ]( self, obj, data, objData )

		else
			table.insert( objectsToDelete, obj.entId )
		end

	end	    


	for idx = 1, self.numVisObjects do

		if _G.IsEntIdValid( self.visObjects[ idx ].entId ) then
			-- в данной точке в visObjects могут быть объекты с отключенным флагом bVisible, они будут удалены оттуда только после сортировки массива (в целях оптимизации)
			self.fnUpdateVisObj[ self.visObjects[ idx ].bVisible ]( self, self.visObjects[ idx ], data, dt )
		else
			table.insert( objectsToDelete, self.visObjects[ idx ].entId )
		end

	end  


	for idx, entId in ipairs( objectsToDelete ) do
		self:DeleteObj( entId )
		objectsToDelete[ idx ] = nil
	end  


	table.sort( self.visObjects, fnSortPred )

	for idx = 1, self.numVisObjects do
		self.fnCheckDeleteVisObj[ self.visObjects[ idx ].sortVal == math.huge ]( self, idx, self.visObjects[ idx ] )
	end	


	self.pass = self.pass % self.numPasses + 1

end


--
function UI.HudMapWnd:Dumb()
	-- ничего
end


--
function UI.HudMapWnd:UpdateObjPassFit_visible( obj, data, objData )

	self.fnCheckAddVisObj[ not obj.bVisible ]( self, obj )

	local colorScheme =
		obj.bMyShip
			and -1
			or UI:GetGameObjColorSchemeInternal( objData.relationship, objData.relationshipGroup, objData.secondEnemy, data.gameplay, obj.bMySquad, objData.bAggressor, objData.bCriminal, objData.bCivilian, obj.playerId )

    -- иконка объекта   			
	do
    	local icoAnimMode	= nil

		icoAnimMode =
			( not icoAnimMode and obj.bMyShip )
				and -1
				or icoAnimMode

    	icoAnimMode =
			( not icoAnimMode and objData.bUnderAttack and objData.relationship == ai.RelatioshipType.FRIEND and ( obj.objType == self.objTypes.VITAL_POINT or obj.objType == self.objTypes.CLANSHIP_VITAL_POINT ) )
				and self.icoAnimModes.VP_UNDER_ATTACK
				or icoAnimMode

    	icoAnimMode =
			( not icoAnimMode and ( obj.entId == data.lockEntId and not data.bLocking or obj.entId == data.lockEntIdAlly and not data.bLockingAlly ) )
				and self.icoAnimModes.LOCKED
				or icoAnimMode

    	icoAnimMode =
			( not icoAnimMode and ( obj.entId == data.lockEntId and data.bLocking or obj.entId == data.lockEntIdAlly and data.bLockingAlly ) )
				and self.icoAnimModes.LOCKING
				or icoAnimMode

    	icoAnimMode =
			not icoAnimMode
				and self.icoAnimModes.REGULAR
				or icoAnimMode

		local icoAnimId =
			icoAnimMode ~= -1
				and self.icoAnimIds[ icoAnimMode ][ colorScheme ]
				or self.icoAnimIdWhite

    	self.fnStartEffectAnimation[ icoAnimId ~= obj.effects[ 2 ].animId ]( self, obj.effects[ 2 ], icoAnimId, icoAnimMode )

	end

   	-- линия от объекта до горизонтальной плоскости

   	if self.mode == UI.minimapModes.RADAR then

   		local lineAnimId = self.animId_line[ colorScheme ]
    	self.fnStartEffectAnimation[ lineAnimId ~= obj.effects[ 1 ].animId ]( self, obj.effects[ 1 ], lineAnimId )

   	end

end


--
function UI.HudMapWnd:UpdateObjPassFit_notVisible( obj, data, objData )

	-- из списка видимых предметов удаляется не здесь, а после сортировки (в целях оптимизации)

	obj.bVisible	= false
	obj.sortVal		= math.huge

end


--
function UI.HudMapWnd:UpdateVisObj( obj, data, dt )

	local objPosData = l_objObjData
	_G.CL_GetMinimapObjPos( objPosData, obj.entId, self.mode, self.center_rel, self.radiusSmall_abs, self.radiusLarge_abs, self.mapRect, self.mapMaxRect )

	objPosData.pos_rel_x = UI:XRel2Snapped( objPosData.pos_rel_x )
	objPosData.pos_rel_y = UI:YRel2Snapped( objPosData.pos_rel_y )


	-- иконка объекта			

	-- позиция
	obj.effects[ 2 ].effect:SetPos( UI:Vec2( objPosData.pos_rel_x - self.objIcoCenter_rel.x, objPosData.pos_rel_y - self.objIcoCenter_rel.y ) )

	-- угол поворота
	if self.mode == UI.minimapModes.MAP then
		self.fnUpdateIcoRot[ obj.bMyShip or obj.objType == self.objTypes.MISSILE ]( self, obj )
	end

	-- апдейт анимации
	obj.effects[ 2 ].effect:Update( dt )


	-- линия от объекта до горизонтальной плоскости

	if self.mode == UI.minimapModes.RADAR then

		local lineEffectInfo = obj.effects[ 1 ]

		local pos_plane_rel_y = -objPosData.pos_local_z * self.radarSin * data.radarWorld2AbsCf * UI.abs2Rel_y + self.center_rel.y
		local distToPlain_rel = math.abs( objPosData.pos_rel_y - pos_plane_rel_y )

		-- позиция
		lineEffectInfo.effect:SetPos( UI:Vec2( objPosData.pos_rel_x - self.objLineSize_rel.x  * 0.5, pos_plane_rel_y ) )

		-- поворот
		local angle = objPosData.pos_local_y < 0 and 0 or math.pi
		lineEffectInfo.effect:SetRotation( angle, UI:Vec2( self.objLineSize_rel.x * 0.5, 0 ) )

		-- длина
		local lineTime = distToPlain_rel / self.objLineSize_rel.y
		lineEffectInfo.effect:SetAnimationTime( lineTime )
		lineEffectInfo.effect:UpdateAnimation()

	end

	-- -math.huge означает нахождение в начале списка (выше остальных при рендере) при сортировке
	obj.sortVal = not obj.bMyShip and objPosData.z or -math.huge

end


--
function UI.HudMapWnd:AddVisObj( obj )

	obj.bVisible	= true
	obj.sortVal		= 0

	table.insert( self.visObjects, obj )
	self.numVisObjects = self.numVisObjects + 1

end


--
function UI.HudMapWnd:DeleteVisObj( idx, obj )

	obj.bVisible	= false
	obj.sortVal		= math.huge

	self.visObjects[ idx ] = nil
	self.numVisObjects = self.numVisObjects - 1

end


--
function UI.HudMapWnd:StartEffectAnimation( effectInfo, animId )

	effectInfo.effect:StartAnimationById( animId )
	effectInfo.animId = animId

end


--
function UI.HudMapWnd:UpdateIcoRot( obj )

	local worldObjDir = UI:Vec3( _G.GetEntityMovementDir3( obj.ent ) )
	local viewDir_x, viewDir_y, viewDir_z = _G.WorldLoocCameraWorld2View3( worldObjDir, self.mapRect.z, self.mapRect.w )

	local angle = -( math.atan2( viewDir_y, viewDir_x ) - math.pi * 0.5 )		-- в текстуре стрелка смотрит вверх
    obj.effects[ 2 ].effect:SetRotation( angle, self.objIcoCenter_rel )

end


--
function UI.HudMapWnd:NeedObjBeVisible( obj, data, objData )

	local bVisible = not objData.bDead

	if self.mode == UI.minimapModes.RADAR then
		bVisible =
			bVisible
			and objData.distSq ~= -1 and objData.distSq <= data.visionRadius * data.visionRadius
			and obj.entId ~= data.myShipEntId
			and obj.objType ~= self.objTypes.MISSILE 		
	end

	bVisible =
		bVisible
		and not(
			obj.visibilityType == self.visibilityTypes.MINOR
			and ( objData.distSq == -1 or objData.distSq > self.MINOR_OBJECTS_DIST * self.MINOR_OBJECTS_DIST )
			and obj.entId ~= data.lockEntId
			and obj.entId ~= data.lockEntIdAlly
			and not objData.bHasQuest
		)

	bVisible = bVisible and self.fnNeedObjBeVisibleByType[ obj.objType ]( self, obj, data, objData )

	return bVisible

end


--
function UI.HudMapWnd:NeedObjBeVisibleByType_default( obj, data, objData )

	return objData.bInVision or objData.bHasQuest

end


--
function UI.HudMapWnd:NeedObjBeVisibleByType_PLAYER( obj, data, objData )

	-- проверки на квест нет, т.к. для игроков, в отличие от мобов, не работает правило,
	-- что квестовые должны показываться всегда, даже если невидимы (#0054256,комм.(0218298))

	-- во время стартового варпа не показывается
	local bVisible = not objData.bWarp and not data.bDisableLock

	if data.gameplay == ai.Gameplay.FREE_SPACE then

		bVisible = bVisible and objData.bInVision

	elseif data.gameplay == ai.Gameplay.SENTINEL then

		-- вражеский лидер виден всегда
		-- если вражеский лидер мертв, то все враги видны
		-- еслия я - лидер, то видны все враги

		local bUseInVision =
			objData.relationship == ai.RelatioshipType.ENEMY and	-- друзья видны всегда
			obj.playerId ~= data.enemyLeader and					-- вражеский лидер виден всегда
			not data.bEnemyLeaderDead and							-- если вражеский лидер мертв, то все враги видны
			not data.bIsLeader										-- еслия я - лидер, то видны все враги

		local inVisionInt = objData.bInVision and 1 or 0
		local visibleInt = bUseInVision and inVisionInt or 1

		bVisible = bVisible and visibleInt ~= 0

	else

		local bUseInVision =
			objData.relationship == ai.RelatioshipType.ENEMY		-- друзья видны всегда

		local inVisionInt = objData.bInVision and 1 or 0
		local visibleInt = bUseInVision and inVisionInt or 1

		bVisible = bVisible and visibleInt ~= 0

	end

	return bVisible

end


--
function UI.HudMapWnd:NeedObjBeVisibleByType_VITAL_POINT( obj, data, objData )

	-- #0034457

	-- в геймплее "Царь горы" виден только активный маяк,
	-- во всех остальных видны все маяки всегда

	return not objData.bHidden and not ( data.gameplay == ai.Gameplay.KING_OF_THE_HILL and obj.entId ~= data.curHillEntId )

end


--
function UI.HudMapWnd:NeedObjBeVisibleByType_BOMB( obj, data, objData )

	return not objData.bHidden

end


--
function UI.HudMapWnd:NeedObjBeVisibleByType_BOMB_SITE( obj, data, objData )

	-- видны всегда
	return true

end


--
function UI.HudMapWnd:NeedObjBeVisibleByType_DEFAULT( obj, data, objData )

	return ( objData.bInVision or objData.bHasQuest ) and not data.bDisableLock

end


--
function UI.HudMapWnd:RecalcAbsValues()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )

	self.radiusLarge_abs = UI:YToAbs( mainEffect:GetObjSize( self.effectInfo.main.radiusLargeObjName ).y )
	self.radiusSmall_abs = UI:YToAbs( mainEffect:GetObjSize( self.effectInfo.main.radiusSmallObjName ).y )

	self.radarSin = self.radiusSmall_abs / self.radiusLarge_abs

end


--
function UI.HudMapWnd:F_OnResetDevice()

	self:OnResetDevice()

	self:RecalcAbsValues()

end


--
function UI.HudMapWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx ~= self.layers.OBJECTS then
		return
	end

	for idx = self.numVisObjects, 1, -1 do

		local obj = self.visObjects[ idx ]

		obj.effects[ 2 ].effect:Render( false )

		if self.mode == UI.minimapModes.RADAR then
			obj.effects[ 1 ].effect:Render( false )
		end

		if obj.text then

			UI.drawer:EndUiDrawing()
			
			local bOldPixelSnap_x, bOldPixelSnap_y = _G.GetTextPixelSnapping()
			_G.SetTextPixelSnapping( false, false )
			
			_G.SetTextBlendMode( obj.text.blend )

				local effect = obj.effects[ obj.text.effectId ] and obj.effects[ obj.text.effectId ].effect
				if effect then

					local effectX, effectY = _G.UI_Effect_GetScreenPos2( effect )
					local rect = UI:Quat( effectX + obj.text.rect.x, effectY + obj.text.rect.y, obj.text.rect.z, obj.text.rect.w )

					local color = effect:GetObjColorById( obj.text.effectObjId )
					local alpha = effect:GetAlpha( obj.text.effectObjId )
					color = UI:SetAlpha( color, alpha )

            		_G.UI_DrawText(
               			obj.text.string,
               			obj.text.hFont,
               			rect,
        				color,
						0,
            			obj.text.format,
               			rect
            		)
				end   

        	_G.SetTextBlendMode( UI.BM_ALPHA )
        	_G.SetTextPixelSnapping( bOldPixelSnap_x, bOldPixelSnap_y )
        	UI.drawer:BeginUiDrawing()

		end

	end

end


--
function UI.HudMapWnd:F_OnEventEndLevel( hSender, iParam0, iParam1, fParam0, fParam1 )

	self:Reset()

end


--
function UI.HudMapWnd:Reset()

	self:ReleaseAllEffects()

	self.objects		= {}
	self.objectsArr		= {}
	self.numObjects		= 0
	self.pass			= 1
	self.numPasses		= 1
	self.objectsByPass	= { [1] = { numObjects = 0, objects = {} } }
	self.visObjects		= {}
	self.numVisObjects	= 0

end


--
function UI.HudMapWnd:F_OnEventSaveUiState()

	self:ReleaseAllEffects()

	local name = self:GetScriptTableName()
	UI.store[ name ] =
	{
		objectsArr	= self.objectsArr,
	}

end


--
function UI.HudMapWnd:F_OnEventRestoreUiState()

	local name = self:GetScriptTableName()
	local t = UI.store[ name ]

	if t then

		for idx, obj in ipairs( t.objectsArr ) do
			self:AddObj( obj.entId, obj.objType )
		end

		UI.store[ name ] = nil

	end

end


--
function UI.HudMapWnd:RelaseObjEffects( obj )

	for idx, effectInfo in ipairs( obj.effects ) do
		_G.UI_DestroyEffect( effectInfo.effect )
		obj.effects[ idx ] = nil
	end

end


--
function UI.HudMapWnd:ReleaseAllEffects()

	for idx, obj in ipairs( self.objectsArr ) do
		self:RelaseObjEffects( obj )		
	end

end


--
function UI.HudMapWnd:UpdateBackground()

	self:SetLayerVisible( false, self.layers.RADAR_BG_EFFECT )
	self:SetLayerVisible( false, self.layers.MAP_BG_EFFECT )

	if self.mode == UI.minimapModes.RADAR then
		self:SetLayerVisible( true, self.layers.RADAR_BG_EFFECT )

	elseif self.mode == UI.minimapModes.MAP then
		self:SetLayerVisible( true, self.layers.MAP_BG_EFFECT )
	end

end


--
function UI.HudMapWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateObjects( true, 0 )

end


--
function UI.HudMapWnd:UpdateNumPasses()

	local numPassesOld = self.numPasses

	self.numPasses = math.ceil( self.numObjects / self.MAX_OBJECTS_BY_PASS )
	self.numPasses = math.max( self.numPasses, 1 )

	if self.numPasses > numPassesOld then

		for pass = numPassesOld + 1, self.numPasses do
			self.objectsByPass[ pass ] = { numObjects = 0, objects = {} }
		end

	elseif self.numPasses < numPassesOld then

		for pass = self.numPasses + 1, numPassesOld do
	
			for objIdx = 1, self.objectsByPass[ pass ].numObjects do
				self:UpdateObjPass( self.objectsByPass[ pass ].objects[ objIdx ] )
			end

			self.objectsByPass[ pass ] = nil

		end
	
	end	

	self.pass = math.min( self.pass, self.numPasses )

end


--
function UI.HudMapWnd:UpdateObjPass( obj )

	if obj.pass == nil or obj.pass == -1 or obj.pass > self.numPasses then

		obj.pass = self:GetObjNewPass()

		table.insert( self.objectsByPass[ obj.pass ].objects, obj )
		self.objectsByPass[ obj.pass ].numObjects = self.objectsByPass[ obj.pass ].numObjects + 1

	end		

end


--
function UI.HudMapWnd:GetObjNewPass()

	local minNumObjects = math.huge
	local minPass = 1

	for pass = 1, self.numPasses do

		local numObjectsByPass = self.objectsByPass[ pass ].numObjects

		minNumObjects = math.min( minNumObjects, numObjectsByPass )
		minPass = minNumObjects == numObjectsByPass and pass or minPass

	end

	return minPass

end


-- ----------------------------------------------------------------------------
-- UI.HudMapWnd_map
-- ----------------------------------------------------------------------------

UI.HudMapWnd_map =
{
	def =
	{
		className	= "Wnd",
		prototype	= "HudMapWnd",
		
		props =
		{
			name	= "HudMapWnd_map"
		}
	},
	
	mode = UI.minimapModes.MAP	-- tODO: убрать энум оттуда
}

-- ----------------------------------------------------------------------------
-- UI.HudMapWnd_radar
-- ----------------------------------------------------------------------------

UI.HudMapWnd_radar =
{
	def =
	{
		className	= "Wnd",
		prototype	= "HudMapWnd",
		
		props =
		{
			name	= "HudMapWnd_radar"
		}
	},
	
	mode = UI.minimapModes.RADAR	-- tODO: убрать энум оттуда
}