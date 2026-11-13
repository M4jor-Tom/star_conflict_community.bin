-- ----------------------------------------------------------------------------
--
-- Workfile: prestigeparambarwnd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.PrestigeParamBarWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.PrestigeParamBarWnd.def =
{
	className	= "Wnd",

	props =
	{
		name		= "PrestigeParamBarWnd",
		style		= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "prestigeParamBar_main",
       			defaultAnimation	= "idle",

           		links =
           		{
           			{
           				objName		= "self",
           				animParams	= UI.EffectAnimParams.SIZE,
           			},
           		
           			{
           				objName		= "vol_1",
						layer		= "UI.PrestigeParamBarWnd.layers.LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "prog",
						layer		= "UI.PrestigeParamBarWnd.layers.PB_EFFECT",
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
		},

		-- PB_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,			
			updatable	= false,

			effects =
			{{
				defName 			= "prestigeParamBar_pb",
       			defaultAnimation	= "idle",

           		links =
           		{           			                  
           			{
           				objName		= "vol_1",
						layer		= "UI.PrestigeParamBarWnd.layers.VAL_CUR",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "vol_2",
						layer		= "UI.PrestigeParamBarWnd.layers.VAL_SLASH",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},

           			{
           				objName		= "vol_3",
						layer		= "UI.PrestigeParamBarWnd.layers.VAL_MAX",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
           			},
				}
			}}
		},

		-- VAL_CUR
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},

		-- VAL_SLASH
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= "/",
		},

		-- VAL_MAX
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},
	}
}

-- -------------------------------
-- iterface functions
-- -------------------------------

-- вызывается автоматически из F_OnAfterShowOnScreen(),
-- а также из GameStore_OnVesselLevelUp(), GameStore_OnOwnedVessels(), GameStore_OnSellVessel()

function UI.PrestigeParamBarWnd:Update()

	self:UpdateProgress()

end


--
function UI.PrestigeParamBarWnd:Reset()

	self:ResetProgress()

end


--
function UI.PrestigeParamBarWnd:GameStore_OnVesselLevelUp( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:Update()

end


--
function UI.PrestigeParamBarWnd:GameStore_OnOwnedVessels( result, requestId, param1, param2 )

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:Update()

end


--
function UI.PrestigeParamBarWnd:GameStore_OnRecraftVessel( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:Update()

end


--
function UI.PrestigeParamBarWnd:GameStore_OnVesselActivateNode( result, requestId, param1, param2, u64Param )

	if not self:IsOnScreen() then
		return
	end

	if result ~= _G.GameStore.StoreBuyResult.SBR_OK then
		return
	end

	self:Update()

end


--
function UI.PrestigeParamBarWnd:GameStore_OnSellVessel( result, requestId, param1, param2 ) 

	if not self:IsOnScreen() then
		return
	end

	if result ~= 0 then
		return
	end

	self:Update()

end


-- -------------------------------
-- const
-- -------------------------------

UI.PrestigeParamBarWnd.paramTypes =
{
	COMMON_SHIPS	= 1,
	MAXED_SHIPS		= 2,
	PREMIUM_SHIPS	= 3,
}

UI.PrestigeParamBarWnd.layers =
{
    MAIN_EFFECT	= 0,
    LABEL		= 1,
    PB_EFFECT	= 2,
    VAL_CUR		= 3,
    VAL_SLASH	= 4,
    VAL_MAX		= 5,
}

-- -------------------------------
-- vars
-- -------------------------------

UI.PrestigeParamBarWnd.paramType	= -1

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.PrestigeParamBarWnd:F_PostLoad()

	UI.Wnd.F_PostLoad( self )

	if self:IsPrototype() then
		return
	end

	if self.paramType ~= -1 then
		self:Init( self.paramType )
	end

end


--
function UI.PrestigeParamBarWnd:Init( paramType )

	self:FullReset()

	if type( paramType ) ~= "number" then
		sys.log( "UI.PrestigeParamBarWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"paramType\"); \"number\" expected,got \"%s\"", type( paramType ) )
		return
	end

	if UI:Val2Key( self.paramTypes, paramType ) == "" then
		sys.log( "UI.PrestigeParamBarWnd:Setup()[ERROR]: invalid paramType; one of the \"UI.PrestigeParamBarWnd.paramTypes\" values expected, got %d", paramType )
		return
	end

	self.paramType = paramType
	self:UpdateLabel()

	if self:IsOnScreen() then
		self:Update()
	end

end


--
function UI.PrestigeParamBarWnd:FullReset()

	self.paramType = -1

	self:SetText( "", self.layers.LABEL )
	self:ResetProgress()

end


--
function UI.PrestigeParamBarWnd:ResetProgress()

	self:SetText( "0", self.layers.VAL_CUR )
	self:SetText( "0", self.layers.VAL_MAX )

	local pbEffect = UI:GetEffectFromLayer( self, self.layers.PB_EFFECT )
	if pbEffect then
		pbEffect:SetAnimationTime( 0 )
		pbEffect:Update( 0 )
	end

end


--
function UI.PrestigeParamBarWnd:UpdateLabel()

	if self.paramType == -1 then
		sys.log( "UI.PrestigeParamBarWnd:UpdateLabel()[ERROR]: not inited" )
		return
	end

	local paramTypeName = UI:Val2Key( self.paramTypes, self.paramType )
	local strId = string.format( "prestigeParam_%s", paramTypeName )
	local str = UI:GetStringByName( strId )

	self:SetText( str, self.layers.LABEL )

end


--
function UI.PrestigeParamBarWnd:UpdateProgress()

	if self.paramType == -1 then
		sys.log( "UI.PrestigeParamBarWnd:UpdateProgress()[ERROR]: not inited" )
		return
	end

	local curVal = 0
	local maxVal = 0


	if self.paramType == self.paramTypes.COMMON_SHIPS then

		local boughtCommonShips = self:GetBoughtShips( false )
		curVal = #boughtCommonShips

		local allCommonShips = self:GetAllShips( false )
		maxVal = #allCommonShips


	elseif self.paramType == self.paramTypes.MAXED_SHIPS then

		local boughtCommonShips = self:GetBoughtShips( false )

		for idx, shipItem in pairs( boughtCommonShips ) do

			local level = shipItem.level
			local maxLevel = UI:GetShipMaxLevel( shipItem.defName )

			if level >= maxLevel then
				curVal = curVal + 1
			end

		end

		local allCommonShips = self:GetAllShips( false )
		maxVal = #allCommonShips		


	elseif self.paramType == self.paramTypes.PREMIUM_SHIPS then

		local boughtPremiumShips = self:GetBoughtShips( true )
		curVal = #boughtPremiumShips

		local allPremiumShips = self:GetAllShips( true )
		maxVal = #allPremiumShips


	else
		sys.log( "UI.PrestigeParamBarWnd:UpdatePb()[ERROR]: unhandled param type: %s", tostring( self.paramType ) )
	end


	-- текст

	local strCurVal = UI:Num2StrSeparatedBy3( curVal )
	local strMaxVal = UI:Num2StrSeparatedBy3( maxVal )

	self:SetText( strCurVal, self.layers.VAL_CUR )
	self:SetText( strMaxVal, self.layers.VAL_MAX )


	-- прогрессбар

	local animTime = maxVal ~= 0 and curVal / maxVal or 0

	local pbEffect = UI:GetEffectFromLayer( self, self.layers.PB_EFFECT )
	if pbEffect then
		pbEffect:SetAnimationTime( animTime )
		pbEffect:Update( 0 )
	end

end


--
function UI.PrestigeParamBarWnd:GetAllShips( bPremium )

	local ships = {}

	if type( _G.VesselTree ) ~= "table" then
		sys.log( "UI.PrestigeParamBarWnd:GetAllShips()[ERROR]: invalid type of the \"_G.VesselTree\"; \"table\" expected, got \"%s\"", type( _G.VesselTree ) )
		return ships
	end

	for defName, info in pairs( _G.VesselTree ) do

		if type( defName ) == "string" then

			if UI:IsShipPremium( defName ) == bPremium then
				table.insert( ships, defName )
			end

		else
			sys.log( "UI.PrestigeParamBarWnd:GetAllShips()[ERROR]: invalid type of the key \"%s\" in \"_G.VesselTree\"; \"string\" expected, got \"%s\"", type( defName ) )
		end

	end

	return ships

end


--
function UI.PrestigeParamBarWnd:GetBoughtShips( bPremium )

	local ships = {}

	for idx, shipItem in pairs( UI.serverData.ships ) do

		local bPremiumShip = UI:IsShipPremium( shipItem.defName )

		if bPremiumShip == bPremium then
			table.insert( ships, shipItem )
		end

	end

	return ships

end


--
function UI.PrestigeParamBarWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()
	self:Update()

end