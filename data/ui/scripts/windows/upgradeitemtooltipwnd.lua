-- ----------------------------------------------------------------------------
--
-- Workfile: upgradeitemtooltipwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

UI.UpgradeItemTooltipWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.UpgradeItemTooltipWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "UpgradeItemTooltipWnd",
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
			updatable	= false,

			effects =
			{{
				defName 			= "upgradeItemTooltip_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.UpgradeItemTooltipWnd.layers.ITEM_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- ITEM_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- LEVELS_BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "upgradeItemTooltip_levelsBg",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.UpgradeItemTooltipWnd:Setup( data )

	self:Reset()

	if type( data ) ~= "table" then
		sys.log( "UI.UpgradeItemTooltipWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"data\"); \"table\" expected, got \"%s\"", type( data ) )
		return
	end

	if type( data.defName ) ~= "string" then
		sys.log( "UI.UpgradeItemTooltipWnd:Setup()[ERROR]: invalid type of the field (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	local vid = UI.INVALID_U64_ID
	if data.vid ~= nil then
    	if type( data.vid ) == "userdata" then
			vid = data.vid
		else
    		sys.log( "UI.UpgradeItemTooltipWnd:Setup()[ERROR]: invalid type of the field (\"vid\"); \"userdata\" expected, got \"%s\"", type( vid ) )
    	end
	end

	local equipSlot = -1
	if data.equipSlot ~= nil then
    	if type( data.equipSlot ) == "number" then
			equipSlot = data.equipSlot
		else
    		sys.log( "UI.UpgradeItemTooltipWnd:Setup()[ERROR]: invalid type of the field (\"equipSlot\"); \"number\" expected, got \"%s\"", type( equipSlot ) )
    	end
	end

	if vid ~= UI.INVALID_U64_ID and equipSlot == -1 then
		sys.log( "UI.UpgradeItemTooltipWnd:Setup()[ERROR]: equip ship is specified but equip slot is not" )
		vid = UI.INVALID_U64_ID
	end

	local iid = UI.INVALID_U64_ID
	if data.iid ~= nil then
    	if type( data.iid ) == "userdata" then
			iid = data.iid
		else
    		sys.log( "UI.UpgradeItemTooltipWnd:Setup()[ERROR]: invalid type of the field (\"iid\"); \"userdata\" expected, got \"%s\"", type( iid ) )
    	end
	end

	self.defName	= data.defName
	self.vid		= vid
	self.equipSlot	= equipSlot
	self.iid		= iid

	self:FullUpdate()

	if self:IsOnScreen() and not _G.TextPicker_IsActive() then
		UI:PlaceTooltipOnScreen( self, data )
	end

end


--
function UI.UpgradeItemTooltipWnd:GetVid()

	return self.vid

end


--
function UI.UpgradeItemTooltipWnd:GetEquipSlot()

	return self.equipSlot

end


-- -------------------------------
-- const
-- -------------------------------

UI.UpgradeItemTooltipWnd.layers =
{
    MAIN_EFFECT			= 0,
    ITEM_NAME			= 1,
	LEVELS_BG_EFFECT	= 2,
}

UI.UpgradeItemTooltipWnd.effectInfo =
{
	main =
	{
		paramLocator1		= "line_1",
		paramLocator2		= "line_2",
		levelSlotLocator1	= "slot_1",
		levelSlotLocator2	= "slot_2",
		levelsBgLocator		= "win_bg",
		minSizelocator		= "dist_min",
		maxSizelocator		= "self",
	},

	levelsBg =
	{
		minSizelocator		= "dist_min",
		maxSizelocator		= "self",
	}
}

-- -------------------------------
-- vars
-- -------------------------------

UI.UpgradeItemTooltipWnd.defName 		= ""
UI.UpgradeItemTooltipWnd.vid			= UI.INVALID_U64_ID
UI.UpgradeItemTooltipWnd.equipSlot		= -1
UI.UpgradeItemTooltipWnd.iid			= UI.INVALID_U64_ID


UI.UpgradeItemTooltipWnd.curParamWnds	= {}
UI.UpgradeItemTooltipWnd.allParamWnds	= {}
UI.UpgradeItemTooltipWnd.curLevelWnds	= {}
UI.UpgradeItemTooltipWnd.allLevelWnds	= {}

UI.UpgradeItemTooltipWnd.firstParamPos			= Vec2( 0, 0 )
UI.UpgradeItemTooltipWnd.space_params			= 0
UI.UpgradeItemTooltipWnd.selfMinHeight			= 0
UI.UpgradeItemTooltipWnd.selfMaxHeight			= 0
UI.UpgradeItemTooltipWnd.paramHeight			= 0
UI.UpgradeItemTooltipWnd.paramBaseColor 		= UI.TEXT_BASE_COLOR
UI.UpgradeItemTooltipWnd.space_params_levelsBg	= 0
UI.UpgradeItemTooltipWnd.space_levels			= 0
UI.UpgradeItemTooltipWnd.space_levelsBg_levels	= 0
UI.UpgradeItemTooltipWnd.space_levelsBg_btm		= 0
UI.UpgradeItemTooltipWnd.levelsBgMinHeight		= 0
UI.UpgradeItemTooltipWnd.levelsBgMaxHeight		= 0
UI.UpgradeItemTooltipWnd.levelsX				= 0

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.UpgradeItemTooltipWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.curParamWnds	= {}
	self.allParamWnds	= {}
	self.curLevelWnds	= {}
	self.allLevelWnds	= {}

	self:InitParamsPool()
	self:InitLevelsPool()

	self:PrepareLayout()

end


--
function UI.UpgradeItemTooltipWnd:Reset()

	self.defName	= ""
	self.vid		= UI.INVALID_U64_ID
	self.equipSlot	= -1
	self.iid		= UI.INVALID_U64_ID

	self:ResetParams()
	self:ResetLevels()
	self:SetText( "", self.layers.ITEM_NAME )

end


--
function UI.UpgradeItemTooltipWnd:InitParamsPool()

	for i = 1, 2 do
		self:CreateParamWnd()
	end

end


--
function UI.UpgradeItemTooltipWnd:ObtainParamWnd()

	local paramWnd = nil

	for idx, wnd in pairs( self.allParamWnds ) do
		if not wnd:IsChildOf( self ) then
			paramWnd = wnd
			break
		end
	end

	if not paramWnd then
		paramWnd = self:CreateParamWnd()
	end

	self:AddChild( paramWnd )
	table.insert( self.curParamWnds, paramWnd )

	return paramWnd

end


--
function UI.UpgradeItemTooltipWnd:CreateParamWnd()

	local paramWnd = UI:CreateChildWnd( self, UI.UpgradeItemTooltip_ParamWnd, tostring( #self.allParamWnds + 1 ) )
	table.insert( self.allParamWnds, paramWnd )

	return paramWnd

end


--
function UI.UpgradeItemTooltipWnd:ResetParams()

	for idx, paramWnd in pairs( self.curParamWnds ) do
		paramWnd:Reset()
		paramWnd:UnlinkFromParent()	
	end

	self.curParamWnds = {}

end


--
function UI.UpgradeItemTooltipWnd:InitLevelsPool()

	for i = 1, 4 do
		self:CreateLevelWnd()
	end

end


--
function UI.UpgradeItemTooltipWnd:ObtainLevelWnd()

	local levelWnd = nil

	for idx, wnd in pairs( self.allLevelWnds ) do
		if not wnd:IsChildOf( self ) then
			levelWnd = wnd
			break
		end
	end

	if not levelWnd then
		levelWnd = self:CreateLevelWnd()
	end

	self:AddChild( levelWnd )
	table.insert( self.curLevelWnds, levelWnd )

	return levelWnd

end


--
function UI.UpgradeItemTooltipWnd:CreateLevelWnd()

	local levelWnd = UI:CreateChildWnd( self, UI.UpgradeItemTooltip_LevelWnd, tostring( #self.allLevelWnds + 1 ) )
	table.insert( self.allLevelWnds, levelWnd )

	return levelWnd

end


--
function UI.UpgradeItemTooltipWnd:ResetLevels()

	for idx, levelWnd in pairs( self.curLevelWnds ) do
		levelWnd:Reset()
		levelWnd:UnlinkFromParent()	
	end

	self.curLevelWnds = {}

end


--
function UI.UpgradeItemTooltipWnd:FullUpdate()

	self:UpdateItemName()
	self:UpdateParams()
	self:UpdateLevels()

	self:RecalcLayout()

end


--
function UI.UpgradeItemTooltipWnd:UpdateItemName()

	local name = UI:GetEntityLocalizedNameByDef( self.defName, true, false, true )
	self:SetText( name, self.layers.ITEM_NAME )

end


--
function UI.UpgradeItemTooltipWnd:UpdateParams()

	local maxLevel = UI:GetItemUpgradeMaxLevel( self.defName )

	local firstLevelDefName = UI:GetItemUpgradeDefForLevel( self.defName, 1 )
	local maxLevelDefName = UI:GetItemUpgradeDefForLevel( self.defName, maxLevel )

	local deltaInfos = UI:GetItemParamDeltas( maxLevelDefName, firstLevelDefName, false, self.vid, self.equipSlot, self.paramBaseColor )

	local dstParamsData		= { defName = self.defName, data = nil }
	local compareParamsData = nil

	if self.vid ~= UI.INVALID_U64_ID then

		if UI:IsDefAmmo( self.defName ) then
			dstParamsData.data = { params = _G.CL_GetMunitionParamsFromSpawnData( UI:GetShipSpawnData( self.vid, true, nil, nil, false--[[SC-112506 SC-112961 без автогенов]] ), self.defName ) }
		else
			dstParamsData.data = { params = _G.CL_GetModuleParamsFromSpawnData( UI:GetShipSpawnData( self.vid, true, nil, nil, false--[[SC-112506 SC-112961 без автогенов]] ), self.equipSlot, self.defName ) }
		end

	end

	if self.defName ~= maxLevelDefName then

    	for deltaIdx = 1, #deltaInfos do

    		local deltaInfo = deltaInfos[ deltaIdx ]
			deltaInfo.strDelta = UI:GetItemParamValAsStr( deltaInfo.paramInfo, dstParamsData, compareParamsData, true, self.paramBaseColor, self.paramBaseColor, deltaInfo.bForceAbs, deltaInfo.paramsTable, false, false )

    	end

	end

	for deltaIdx = 1, #deltaInfos do

		local deltaInfo = deltaInfos[ deltaIdx ]

		local paramWnd = self:ObtainParamWnd()
		paramWnd:Setup( deltaInfo.paramInfo, deltaInfo.strDelta )

	end	

end


--
function UI.UpgradeItemTooltipWnd:UpdateLevels()

	local bAllLevels = UI.defaultUpgradeItemTooltipAllLevels

	local profile = _G.GetProfileTable()
	if profile.upgradeItemTooltipAllLevels ~= nil then
		bAllLevels = profile.upgradeItemTooltipAllLevels
	end

	local nextDefName = UI:GetItemUpgradeNextDef( self.defName )
	while nextDefName ~= "" do

		local levelWnd = self:ObtainLevelWnd()
		levelWnd:Setup( nextDefName, self.defName, self.iid )
		
		if not bAllLevels then
			break
		end

		nextDefName = UI:GetItemUpgradeNextDef( nextDefName )

	end

end


--
function UI.UpgradeItemTooltipWnd:PrepareLayout()

	local paramWnd			= self.allParamWnds[ 1 ]
	local levelWnd			= self.allLevelWnds[ 1 ]
	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local levelsBgEffect	= UI:GetEffectFromLayer( self, self.layers.LEVELS_BG_EFFECT )

	local firstParamPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.paramLocator1 ) or UI:Vec2( 0, 0 )
	local secondParamPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.paramLocator2 ) or UI:Vec2( 0, 0 )
	local selfMinSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizelocator ) or UI:Vec2( 0, 0 )
	local selfMaxSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizelocator ) or UI:Vec2( 0, 0 )
	local paramHeight			= paramWnd and paramWnd:GetHeight() or 0
	local levelsBgPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.levelsBgLocator ) or UI:Vec2( 0, 0 )
	local levelsBgMinSize		= levelsBgEffect and levelsBgEffect:GetObjSize( self.effectInfo.levelsBg.minSizelocator ) or UI:Vec2( 0, 0 )
	local levelsBgMaxSize		= levelsBgEffect and levelsBgEffect:GetObjSize( self.effectInfo.levelsBg.maxSizelocator ) or UI:Vec2( 0, 0 )
	local maxLevelHeight		= levelWnd and levelWnd:GetMaxHeight() or 0
	local firstLevelPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.levelSlotLocator1 ) or UI:Vec2( 0, 0 )
	local secondLevelPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.levelSlotLocator2 ) or UI:Vec2( 0, 0 )

	self.firstParamPos			= firstParamPos
	self.space_params			= secondParamPos.y - ( firstParamPos.y + paramHeight )
	self.selfMinHeight			= selfMinSize.y
	self.selfMaxHeight			= selfMaxSize.y
	self.paramHeight			= paramHeight
	self.space_params_levelsBg	= levelsBgPos.y - ( secondParamPos.y + paramHeight )
	self.space_levels			= secondLevelPos.y - ( firstLevelPos.y + maxLevelHeight )
	self.space_levelsBg_levels	= firstLevelPos.y - levelsBgPos.y
	self.space_levelsBg_btm		= selfMaxSize.y - ( levelsBgPos.y +  levelsBgMaxSize.y )
	self.levelsBgMinHeight		= levelsBgMinSize.y
	self.levelsBgMaxHeight		= levelsBgMaxSize.y
	self.levelsX				= firstLevelPos.x

	if paramWnd then
		self.paramBaseColor = paramWnd:GetValColor()
	end

	if levelsBgEffect then
		levelsBgEffect:SetPos( UI:Vec2( levelsBgPos.x, 0 ) )
	end

	self:SetWidth( selfMaxSize.x )

end


--
function UI.UpgradeItemTooltipWnd:RecalcLayout()

	-- параметры

	local numParams = #self.curParamWnds
	for paramIdx = 1, numParams do

		local paramWnd = self.curParamWnds[ paramIdx ]

		local paramPos = UI:Vec2( self.firstParamPos.x, self.firstParamPos.y + ( self.paramHeight + self.space_params ) * ( paramIdx - 1 ) )
		paramWnd:SetPos( paramPos.x, paramPos.y )

	end


	-- уровни

	local levelsBgY = 0
	if numParams > 0 then
		
		local lastParamWnd = self.curParamWnds[ numParams ]
		levelsBgY = lastParamWnd:GetTop() + lastParamWnd:GetHeight() + self.space_params_levelsBg

	else
		levelsBgY = self.firstParamPos.y
	end

	local numLevels = #self.curLevelWnds

	local levelY = levelsBgY + self.space_levelsBg_levels
	for levelIdx = 1, numLevels do

		local levelWnd = self.curLevelWnds[ levelIdx ]

		local levelPos = UI:Vec2( self.levelsX, levelY )
		levelWnd:SetPos( levelPos.x, levelPos.y )

		levelY = levelY + levelWnd:GetHeight() + self.space_levels

	end


	-- черный фон для уровней

	local levelsBgHeight = 0

	if numLevels > 0 then

		self:SetLayerVisible( true, self.layers.LEVELS_BG_EFFECT )

		local levelsBgEffect = UI:GetEffectFromLayer( self, self.layers.LEVELS_BG_EFFECT )
		if levelsBgEffect then

			local levelsBgPos = levelsBgEffect:GetPos()
			levelsBgPos.y = levelsBgY
			levelsBgEffect:SetPos( levelsBgPos )


			local lastLevelWnd = self.curLevelWnds[ numLevels ]
			if lastLevelWnd then
				levelsBgHeight = ( lastLevelWnd:GetTop() + lastLevelWnd:GetHeight() + self.space_levelsBg_levels ) - levelsBgPos.y
			end

			levelsBgHeight = UI:Clamp( levelsBgHeight, self.levelsBgMinHeight, self.levelsBgMaxHeight )

			local levelsBgAnimTime = ( levelsBgHeight - self.levelsBgMinHeight ) / ( self.levelsBgMaxHeight - self.levelsBgMinHeight )
			levelsBgEffect:SetAnimationTime( levelsBgAnimTime )			

		end

	else
		self:SetLayerVisible( false, self.layers.LEVELS_BG_EFFECT )
	end


	-- собственный размер

	local selfHeight = levelsBgY + levelsBgHeight + self.space_levelsBg_btm
	selfHeight = UI:Clamp( selfHeight, self.selfMinHeight, self.selfMaxHeight )

	self:SetHeight( selfHeight )

	local selfAnimTime = ( selfHeight - self.selfMinHeight ) / ( self.selfMaxHeight - self.selfMinHeight )
	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:SetAnimationTime( selfAnimTime )
	end

end


--
function UI.UpgradeItemTooltipWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end     


--
function UI.UpgradeItemTooltipWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

	local levelsBgEffect = UI:GetEffectFromLayer( self, self.layers.LEVELS_BG_EFFECT )
	if levelsBgEffect then
		levelsBgEffect:Update( 0 )
	end

end


--
function UI.UpgradeItemTooltipWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateEffects()

end


-- -------------------------------------------------------------------------------
-- UI.UpgradeItemTooltip_ParamWnd
-- -------------------------------------------------------------------------------

UI.UpgradeItemTooltip_ParamWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

UI.UpgradeItemTooltip_ParamWnd.def =
{
	className = "Wnd",

	props =
	{
		name		= "UpgradeItemTooltip_ParamWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT,
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
				defName 			= "upgradeItemTooltip_param",
				defaultAnimation	= "idle_1",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},

					{
						objName		= "title",
						layer		= "UI.UpgradeItemTooltip_ParamWnd.layers.NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
					},

					{
						objName		= "value",
						layer		= "UI.UpgradeItemTooltip_ParamWnd.layers.VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.FONT,
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

		-- VAL
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
function UI.UpgradeItemTooltip_ParamWnd:Setup( paramInfo, strVal )

	self:Reset()

	self.paramInfo		= paramInfo
	self.strVal			= strVal

	self:UpdateName()
	self:UpdateVal()

end


--
function UI.UpgradeItemTooltip_ParamWnd:Reset()

	self.paramInfo	= nil
	self.strVal		= ""

	self:SetText( "", self.layers.NAME )	
	self:SetText( "", self.layers.VAL )	

end


--
function UI.UpgradeItemTooltip_ParamWnd:GetValColor()

	return self:GetColor( self.layers.VAL )

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.UpgradeItemTooltip_ParamWnd.layers =
{
    MAIN_EFFECT	= 0,
    NAME		= 1,
    VAL			= 2,
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.UpgradeItemTooltip_ParamWnd.paramInfo	= nil
UI.UpgradeItemTooltip_ParamWnd.strVal		= ""

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.UpgradeItemTooltip_ParamWnd:UpdateName()

	local name = UI:ItemParam2Str( self.paramInfo )
	self:SetText( name, self.layers.NAME )

end


--
function UI.UpgradeItemTooltip_ParamWnd:UpdateVal()

    self:SetText( self.strVal, self.layers.VAL )

end


--
function UI.UpgradeItemTooltip_ParamWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:UpdateEffects()

end


--
function UI.UpgradeItemTooltip_ParamWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateEffects()
	end

end


--
function UI.UpgradeItemTooltip_ParamWnd:UpdateEffects()

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then
		mainEffect:Update( 0 )
	end

end   


-- -------------------------------------------------------------------------------
-- UI.UpgradeItemTooltip_LevelWnd
-- -------------------------------------------------------------------------------

UI.UpgradeItemTooltip_LevelWnd = {}

-- -----------------------------------
-- window definition
-- -----------------------------------

--
UI.UpgradeItemTooltip_LevelWnd.layers =
{
    MAIN_EFFECT				= 0,
	LEVEL_NAME				= 1,
    PRICE_EFFECT			= 2,
    CREDITS_PRICE_VAL		= 3,
    INACTIVE_EFFECT			= 4,
}

--
UI.UpgradeItemTooltip_LevelWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "UpgradeItemTooltip_LevelWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_MOUSE_REACT + UI.WS_NOT_KB_REACT,
		isPrototype	= true,
	},

	layers =
	{
		firstOverlayLayer = UI.UpgradeItemTooltip_LevelWnd.layers.INACTIVE_EFFECT, 

		-- MAIN_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			main		= true,
			updatable	= false,

			effects =
			{{
				defName 			= "upgradeItemTooltip_levelSlot",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title",
						layer		= "UI.UpgradeItemTooltip_LevelWnd.layers.LEVEL_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},

					{
						objName		= "blackout",
						layer		= "UI.UpgradeItemTooltip_LevelWnd.layers.INACTIVE_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}
			}}
		},

		-- LEVEL_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- PRICE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "upgradeItemTooltip_levelSlot_price",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "value",
						layer		= "UI.UpgradeItemTooltip_LevelWnd.layers.CREDITS_PRICE_VAL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.ALPHA + UI.EffectAnimParams.COLOR,
					},
				}
			}}
		},

		-- CREDITS_PRICE_VAL
		{
			layerType		= UI.LAYER_TEXT,
			layerStyle		= UI.WLS_OWNERDRAW,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- INACTIVE_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
			updatable	= false,

			effects =
			{{
				defName 			= "upgradeItemTooltip_levelSlot_inactive",
				defaultAnimation	= "idle",
			}}
		}
	}
}

-- -----------------------------------
-- interface functions
-- -----------------------------------

--
function UI.UpgradeItemTooltip_LevelWnd:Setup( defName, baseDefName, iid )

	self:Reset()

	self.defName		= defName
	self.baseDefName	= baseDefName
	self.iid			= iid

	self:FullUpdate()

end


--
function UI.UpgradeItemTooltip_LevelWnd:Reset()

	self.defName		= ""
	self.baseDefName	= ""
	self.iid			= UI.INVALID_U64_ID

	self:SetText( "", self.layers.LEVEL_NAME )
	self:ResetParams()
	self.creditsPriceMetaText:SetText( "", true )
	self:SetLayerVisible( false, self.layers.PRICE_EFFECT )
	self:SetLayerVisible( false, self.layers.CREDITS_PRICE_VAL )
	self:SetLayerVisible( false, self.layers.INACTIVE_EFFECT )
	self.bPriceActive = false

end


--
function UI.UpgradeItemTooltip_LevelWnd:GetMaxHeight()

	return self.selfMaxHeight

end


-- -----------------------------------
-- const
-- -----------------------------------

UI.UpgradeItemTooltip_LevelWnd.effectInfo =
{
	main =
	{
		paramLocator1	= "line_1",
		paramLocator2	= "line_2",
		minSizelocator	= "dist_min",
		maxSizelocator	= "self",
		sizeLocator		= "self_2",
		priceLocator	= "price",
		inactiveLocator	= "blackout",
	},

	incactive =
	{
		minSizelocator	= "dist_min",
		maxSizelocator	= "self",
	},

	price =
	{
		labelColorLocator = "color"
	}
}

-- -----------------------------------
-- vars
-- -----------------------------------

UI.UpgradeItemTooltip_LevelWnd.defName					= ""
UI.UpgradeItemTooltip_LevelWnd.baseDefName				= ""
UI.UpgradeItemTooltip_LevelWnd.iid						= UI.INVALID_U64_ID

UI.UpgradeItemTooltip_LevelWnd.creditsPriceMetaText		= nil
UI.UpgradeItemTooltip_LevelWnd.curParamWnds				= {}
UI.UpgradeItemTooltip_LevelWnd.allParamWnds				= {}

UI.UpgradeItemTooltip_LevelWnd.bPriceActive				= false

UI.UpgradeItemTooltip_LevelWnd.paramBaseColor			= UI.TEXT_BASE_COLOR
UI.UpgradeItemTooltip_LevelWnd.priceLabelColor			= UI.TEXT_BASE_COLOR
UI.UpgradeItemTooltip_LevelWnd.firstParamPos			= Vec2( 0, 0 )
UI.UpgradeItemTooltip_LevelWnd.space_params				= 0
UI.UpgradeItemTooltip_LevelWnd.space_params_price		= 0
UI.UpgradeItemTooltip_LevelWnd.space_price_btm			= 0
UI.UpgradeItemTooltip_LevelWnd.space_top_inactive		= 0
UI.UpgradeItemTooltip_LevelWnd.selfMinHeight			= 0
UI.UpgradeItemTooltip_LevelWnd.selfMaxHeight			= 0
UI.UpgradeItemTooltip_LevelWnd.inactiveMinHeight		= 0
UI.UpgradeItemTooltip_LevelWnd.inactiveMaxHeight		= 0
UI.UpgradeItemTooltip_LevelWnd.paramHeight				= 0
UI.UpgradeItemTooltip_LevelWnd.priceHeight				= 0

-- -----------------------------------
-- work functions
-- -----------------------------------

--
function UI.UpgradeItemTooltip_LevelWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	self.curParamWnds	= {}
	self.allParamWnds	= {}

	self.creditsPriceMetaText = UI.MetaText.GetNewInstance()
	self.creditsPriceMetaText:InitFromLayer( self, self.layers.CREDITS_PRICE_VAL ) 	

	self:InitParamsPool()
	self:PrepareLayout()

end


--
function UI.UpgradeItemTooltip_LevelWnd:F_Shutdown()

	if self.creditsPriceMetaText then
		self.creditsPriceMetaText:Clear()
	end

	UI.Wnd.F_Shutdown( self )

end


--
function UI.UpgradeItemTooltip_LevelWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:UpdateMetaTextPos()

end


--
function UI.UpgradeItemTooltip_LevelWnd:F_OnScreenPosChanged( oldScreenX, oldScreenY )

	self:OnScreenPosChanged( oldScreenX, oldScreenY )

	-- может вызываеться при инициализации окна, когда еще слои не созданы
	if self:GetNumLayers() == 0 then
		return
	end

	if self:IsOnScreen() then
		self:UpdateMetaTextPos()
	end

end


--
function UI.UpgradeItemTooltip_LevelWnd:UpdateMetaTextPos()

	self.creditsPriceMetaText:UpdateScreenOrgFromLayer( self, self.layers.CREDITS_PRICE_VAL )

end


--
function UI.UpgradeItemTooltip_LevelWnd:F_DrawLayer( x0, y0, width, height, clipX0, clipY0, clipWidth, clipHeight, layerIdx )

	if layerIdx == self.layers.CREDITS_PRICE_VAL then
		self.creditsPriceMetaText:Draw( clipX0, clipY0, clipWidth, clipHeight )
	end

end


--
function UI.UpgradeItemTooltip_LevelWnd:InitParamsPool()

	for i = 1, 2 do
		self:CreateParamWnd()
	end

end


--
function UI.UpgradeItemTooltip_LevelWnd:ObtainParamWnd()

	local paramWnd = nil

	for idx, wnd in pairs( self.allParamWnds ) do
		if not wnd:IsChildOf( self ) then
			paramWnd = wnd
			break
		end
	end

	if not paramWnd then
		paramWnd = self:CreateParamWnd()
	end

	self:AddChild( paramWnd )
	table.insert( self.curParamWnds, paramWnd )

	return paramWnd

end


--
function UI.UpgradeItemTooltip_LevelWnd:CreateParamWnd()

	local paramWnd = UI:CreateChildWnd( self, UI.UpgradeItemTooltip_ParamWnd, tostring( #self.allParamWnds + 1 ) )
	table.insert( self.allParamWnds, paramWnd )

	return paramWnd

end


--
function UI.UpgradeItemTooltip_LevelWnd:ResetParams()

	for idx, paramWnd in pairs( self.curParamWnds ) do
		paramWnd:Reset()
		paramWnd:UnlinkFromParent()	
	end

	self.curParamWnds = {}

end


--
function UI.UpgradeItemTooltip_LevelWnd:FullUpdate()

	self:UpdateName()
	self:UpdateParams()
	self:UpdatePrice()
	self:UpdateInactiveEffect()

	self:RecalcLayout()

end


--
function UI.UpgradeItemTooltip_LevelWnd:UpdateName()

	local mark = UI:GetItemQuality( self.defName )

	local strId = string.format( "upgradeItem_mark_%d", mark )
	local str = UI:GetStringByName( strId )

	local color = UI:GetItemQualityColor( mark, false )
	str = string.format( "%s%s", UI:Color2Str( color ), str )

	self:SetText( str, self.layers.LEVEL_NAME )	

end


--
function UI.UpgradeItemTooltip_LevelWnd:UpdateParams()

	local prevDefName = UI:GetItemUpgradePrevDef( self.defName )
	local tooltipWnd = self:GetParent()

	local deltaInfos = UI:GetItemParamDeltas( self.defName, prevDefName, true, tooltipWnd:GetVid(), tooltipWnd:GetEquipSlot(), self.paramBaseColor )	

	for deltaIdx = 1, #deltaInfos do

		local deltaInfo = deltaInfos[ deltaIdx ]

		local paramWnd = self:ObtainParamWnd()
		paramWnd:Setup( deltaInfo.paramInfo, deltaInfo.strDelta )

	end

end


--
function UI.UpgradeItemTooltip_LevelWnd:UpdatePrice()

	local baseLevel = UI:GetItemUpgradeLevel( self.baseDefName )
	local slotLevel = UI:GetItemUpgradeLevel( self.defName )

	if slotLevel <= baseLevel then

		self:SetLayerVisible( false, self.layers.PRICE_EFFECT )

		self:SetLayerVisible( false, self.layers.CREDITS_PRICE_VAL )
		self.creditsPriceMetaText:SetText( "", true )

	else

		if UI:CanUpgradeItemToDefThroughCraftOnly( self.defName ) then

			self:SetLayerVisible( true, self.layers.PRICE_EFFECT )

			self:SetLayerVisible( true, self.layers.CREDITS_PRICE_VAL )
			self.creditsPriceMetaText:SetText( UI:GetStringByName( "itemUpgradeTooltip_craftable" ), true )

		else

			self:SetLayerVisible( true, self.layers.PRICE_EFFECT )

			local prevDefName = UI:GetItemUpgradePrevDef( self.defName )

			-- кредиты

			self:SetLayerVisible( true, self.layers.CREDITS_PRICE_VAL )

			local creditsPriceInfo = {}
			creditsPriceInfo.priceType		= _G.GameStore.CreditsType.CT_CREDITS
			creditsPriceInfo.val			= UI:GetItemUpgradeCreditsPrice( prevDefName )
			creditsPriceInfo.bIsBuyPrice	= true
			creditsPriceInfo.basePrice		= creditsPriceInfo.val

    		local strCreditsVal		= UI:PriceInfo2Str( creditsPriceInfo, self:GetColor( self.layers.CREDITS_PRICE_VAL ), false, nil, false, nil )
    		local strCreditsLabel	= UI:GetStringByName( "itemTooltip_buyPrice" )
    		local creditsStr		= string.format( "%s%s: %s", UI:Color2Str( self.priceLabelColor ), strCreditsLabel, strCreditsVal )

			self.creditsPriceMetaText:SetText( creditsStr, true )

		end

		local bIsLevelForNextUpgrade = UI:GetItemUpgradeNextDef( self.baseDefName ) == self.defName
		self.bPriceActive = bIsLevelForNextUpgrade

	end       

end


--
function UI.UpgradeItemTooltip_LevelWnd:UpdateInactiveEffect()

	local baseLevel = UI:GetItemUpgradeLevel( self.baseDefName )
	local slotLevel = UI:GetItemUpgradeLevel( self.defName )

	local bInactiveVisible = slotLevel > baseLevel
	self:SetLayerVisible( bInactiveVisible, self.layers.INACTIVE_EFFECT )

end


--
function UI.UpgradeItemTooltip_LevelWnd:PrepareLayout()

	local paramWnd			= self.allParamWnds[ 1 ]
	local mainEffect		= UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	local inactiveEffect	= UI:GetEffectFromLayer( self, self.layers.INACTIVE_EFFECT )
	local priceEffect		= UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )	

	local firstParamPos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.paramLocator1 ) or UI:Vec2( 0, 0 )
	local secondParamPos		= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.paramLocator2 ) or UI:Vec2( 0, 0 )
	local pricePos				= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.priceLocator ) or UI:Vec2( 0, 0 )
	local priceSize				= priceEffect and priceEffect:GetObjSize( "self" ) or UI:Vec2( 0, 0 )
	local selfMinSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.minSizelocator ) or UI:Vec2( 0, 0 )
	local selfMaxSize			= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.maxSizelocator ) or UI:Vec2( 0, 0 )
	local selfSize				= mainEffect and mainEffect:GetObjSize( self.effectInfo.main.sizeLocator ) or UI:Vec2( 0, 0 )
	local selfSizeLocatorPos	= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.sizeLocator ) or UI:Vec2( 0, 0 )
	local inactiveMinSize		= inactiveEffect and inactiveEffect:GetObjSize( self.effectInfo.incactive.minSizelocator ) or UI:Vec2( 0, 0 )
	local inactiveMaxSize		= inactiveEffect and inactiveEffect:GetObjSize( self.effectInfo.incactive.maxSizelocator ) or UI:Vec2( 0, 0 )
	local inactivePos			= mainEffect and mainEffect:GetObjPos( self.effectInfo.main.inactiveLocator ) or UI:Vec2( 0, 0 )
	local paramHeight			= paramWnd and paramWnd:GetHeight() or 0

	self.firstParamPos		= firstParamPos
	self.space_params		= secondParamPos.y - ( firstParamPos.y + paramHeight )
	self.space_params_price	= pricePos.y - ( secondParamPos.y + paramHeight )
	self.space_price_btm	= ( selfSizeLocatorPos.y + selfSize.y ) - ( pricePos.y + priceSize.y )
	self.space_top_inactive	= inactivePos.y
	self.selfMinHeight		= selfMinSize.y
	self.selfMaxHeight		= selfMaxSize.y
	self.inactiveMinHeight	= inactiveMinSize.y
	self.inactiveMaxHeight	= inactiveMaxSize.y
	self.paramHeight		= paramHeight
	self.priceHeight		= priceSize.y

	if paramWnd then
		self.paramBaseColor = paramWnd:GetValColor()
	end

	if priceEffect then
		self.priceLabelColor = priceEffect:GetObjColor( self.effectInfo.price.labelColorLocator )
	end	

	self:SetWidth( selfMaxSize.x )

	if priceEffect then
		priceEffect:SetPos( UI:Vec2( pricePos.x, 0 ) )
	end	

end      


--
function UI.UpgradeItemTooltip_LevelWnd:RecalcLayout()

	local numParams = #self.curParamWnds
	local nameRect = self:GetLayerRect( self.layers.LEVEL_NAME )

	-- параметры

	for paramIdx = 1, numParams do

		local paramWnd = self.curParamWnds[ paramIdx ]

		local paramPos = UI:Vec2( self.firstParamPos.x, self.firstParamPos.y + ( self.paramHeight + self.space_params ) * ( paramIdx - 1 ) )
		paramWnd:SetPos( paramPos.x, paramPos.y )

	end


	-- цена

	if self:IsLayerVisible( self.layers.PRICE_EFFECT ) then

    	local priceY = nameRect.y + nameRect.w + self.space_params_price

    	if numParams > 0 then
			local lastParamWnd = self.curParamWnds[ numParams ]
    		priceY = lastParamWnd:GetTop() + lastParamWnd:GetHeight() + self.space_params_price
    	end

    	local priceEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )
    	if priceEffect then

    		local pricePos = priceEffect:GetPos()
    		pricePos.y = priceY

    		priceEffect:SetPos( pricePos )

    	end

	end	


	-- собственный размер

	local selfHeight = nameRect.y + nameRect.w 

	if self:IsLayerVisible( self.layers.PRICE_EFFECT ) then

    	local priceEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )
		if priceEffect then

    		local pricePos = priceEffect:GetPos()
			selfHeight = pricePos.y + self.priceHeight + self.space_price_btm

		end

	elseif numParams > 0 then

		local lastParamWnd = self.curParamWnds[ numParams ]
		selfHeight = lastParamWnd:GetTop() + lastParamWnd:GetHeight() + self.space_params_price		

	end

	selfHeight = UI:Clamp( selfHeight, self.selfMinHeight, self.selfMaxHeight )
	self:SetHeight( selfHeight )

	local mainEffect = UI:GetEffectFromLayer( self, self.layers.MAIN_EFFECT )
	if mainEffect then

		local mainAnimTime = ( selfHeight - self.selfMinHeight ) / ( self.selfMaxHeight - self.selfMinHeight )
		mainEffect:SetAnimationTimeAndUpdate( mainAnimTime )
		
	end


	-- эффект затемнения

	if self:IsLayerVisible( self.layers.INACTIVE_EFFECT ) then

		local inactiveEffect = UI:GetEffectFromLayer( self, self.layers.INACTIVE_EFFECT )
		if inactiveEffect then

			local inactiveHeight = selfHeight - self.space_top_inactive * 2

			if self:IsLayerVisible( self.layers.PRICE_EFFECT ) and self.bPriceActive then

             	local priceEffect = UI:GetEffectFromLayer( self, self.layers.PRICE_EFFECT )
         		if priceEffect then
             		local pricePos = priceEffect:GetPos()
					inactiveHeight = pricePos.y - self.space_top_inactive
				end

			end

			inactiveHeight = UI:Clamp( inactiveHeight, self.inactiveMinHeight, self.inactiveMaxHeight )

			local inactiveAnimTime = ( inactiveHeight - self.inactiveMinHeight ) / ( self.inactiveMaxHeight - self.inactiveMinHeight )
			inactiveEffect:SetAnimationTimeAndUpdate( inactiveAnimTime )

		end

	end

end


-- --------------------------------------------------------------
-- инстанс общего тултипа
-- --------------------------------------------------------------

UI.UpgradeItemTooltipWnd_shared =
{
	def =
	{
    	className	= "Wnd",
    	prototype	= "UpgradeItemTooltipWnd",

    	props =
    	{
    		name		= "UpgradeItemTooltipWnd_shared",
    	},	
	}
}