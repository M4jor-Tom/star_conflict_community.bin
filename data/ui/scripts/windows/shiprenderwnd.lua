-- -----------------------------------------------------------------
-- UI.ShipRenderWnd
-- -----------------------------------------------------------------

UI.ShipRenderWnd = {}

-- -------------------------------
-- window definition
-- -------------------------------

UI.ShipRenderWnd.def =
{
	className	= "Wnd",

	props =
	{
		name	= "ShipRenderWnd",
		style	= UI.WS_UPDATE_IF_VISIBLE + UI.WS_NOT_KB_REACT,
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
				defName 			= "shipRender",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "self",
						animParams	= UI.EffectAnimParams.SIZE,
					},
				}
			}},
		},
	}
}

-- -------------------------------
-- interface functions
-- -------------------------------

--
function UI.ShipRenderWnd:Setup( defName, chosenNodesMask )

	self:Reset()

	if type( defName ) ~= "string" then
		sys.log( "UI.ShipRenderWnd:Setup()[ERROR]: invalid type of the 1-st parameter (\"defName\"); \"string\" expected, got \"%s\"", type( defName ) )
		return
	end

	if not UI:IsDefShip( defName ) then
		sys.log( "UI.ShipRenderWnd:Setup()[ERROR]: \"%s\" is not ship", defName )
		return
	end

	if UI:IsShipEvolving( defName ) then

		if chosenNodesMask ~= nil then

        	if type( chosenNodesMask ) ~= "userdata" then
        		sys.log( "UI.ShipRenderWnd:Setup()[ERROR]: invalid type of the 2-nd parameter (\"chosenNodesMask\"); \"userdata\" or \"nil\" expected, got \"%s\"", type( chosenNodesMask ) )
        		return
        	end

		end

	else
		chosenNodesMask = nil
	end

	self.defName			= defName
	self.chosenNodesMask	= chosenNodesMask

	if self:IsOnScreen() then
		self:FullUpdate()
	end

end


--
function UI.ShipRenderWnd:Reset()

	self.defName			= ""
	self.chosenNodesMask	= nil
	self.angle				= 0

	self:ResetRender()

end


-- -------------------------------
-- const
-- -------------------------------

UI.ShipRenderWnd.layers =
{
	MAIN_EFFECT	= 0
}

UI.ShipRenderWnd.ROTATION_SPEED	= 10	-- градусов в секунду

-- -------------------------------
-- vars
-- -------------------------------

UI.ShipRenderWnd.defName			= ""
UI.ShipRenderWnd.chosenNodesMask	= nil
UI.ShipRenderWnd.entId				= -1
UI.ShipRenderWnd.angle				= 0

-- -------------------------------
-- work functions
-- -------------------------------

--
function UI.ShipRenderWnd:FullUpdate()

	self:SetupRender()

end


--
function UI.ShipRenderWnd:ResetRender()

	if self.entId == -1 then
		return
	end

	if not UI:IsInShutdown() then

    	local curTargetEnt = _G.CL_GetHangarTarget()
    	if curTargetEnt and curTargetEnt:GetId() == self.entId then
    		_G.CL_DisableHangarTarget()
    	end

    	local ent = _G.Entities[ self.entId ]
    	if ent then
    		ent:Remove()
    	else
    		sys.log( "UI.ShipRenderWnd:ResetRender()[ERROR]: ent %d not found", self.entId )
    	end

	end	

	self.entId = -1

end


--
function UI.ShipRenderWnd:SetupRender()

	self:ResetRender()

	if not self:IsOnScreen() then
		sys.log( "UI.ShipRenderWnd:UpdateRender()[ERROR]: not on screen" )
		return
	end

	if self.defName == "" then
		return
	end

	-- создание корабля

	local spawnData = nil
	local shipItem = UI:GetShipItemByDef( self.defName, true )

	if shipItem then
		spawnData = UI:GetShipSpawnData( shipItem.vid, true, self.chosenNodesMask )
	else
		spawnData = UI:GetShipDefaultSpawnData( self.defName )
	end

    local ent = _G.SpawnSpaceShip( spawnData, ai.Container:GenerateUniqueName( "RenderShip" ), false )
	if ent then
		self.entId = ent:GetId()
	else
    	sys.log( "UI.ShipRenderWnd:UpdateRender()[ERROR]: cannot create ship" )
		return
	end

	-- позиция корабля
	ent:SetPos( UI:Vec3( 0, 0, 0 ) )

	-- камера
	_G.CL_EnableHangarTarget( ent, UI:Vec3( 1, 0, 0 ) ) 

end


--
function UI.ShipRenderWnd:F_OnAfterShowOnScreen()

	self:OnAfterShowOnScreen()

	self:FullUpdate()

end


--
function UI.ShipRenderWnd:F_OnAfterHideFromScreen()

	self:OnAfterHideFromScreen()

	self:ResetRender()

end


--
function UI.ShipRenderWnd:F_OnNewFrame( hSender, dt_sys, dt_game )

	self:Rotate( dt_sys )

end


--
function UI.ShipRenderWnd:Rotate( dt )

	if self.entId == -1 then
		return
	end

    local ent = _G.Entities[ self.entId ]
	if not ent then
		return
	end

	self.angle = UI:AngleNormalizePI2( self.angle + math.rad( self.ROTATION_SPEED * dt ) )

	local rot = UI:ZeroQuat()
	rot:RotY( self.angle )

	ent:SetRot( rot )

end