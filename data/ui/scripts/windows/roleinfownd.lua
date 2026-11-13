-- ----------------------------------------------------------------------------
--
-- Workfile: roleinfownd.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.RoleInfoWnd = {}

-- -----------------------------
-- window definition
-- -----------------------------

UI.RoleInfoWnd.def =
{
	className	= "Wnd",
	prototype	= "FullScreenWnd",

	props =
	{
		name	= "RoleInfoWnd",
		style	= UI.EV_UPDATE_IF_VISIBLE,
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
				defName 			= "roleInfo_main",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "help_win",
						layer		= "UI.RoleInfoWnd.layers.WORK_EFFECT",
						animParams	= UI.EffectAnimParams.POS,
					},
				}		
			}}
		},  

		-- BG_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,
		},

		-- WORK_EFFECT
		{
			layerType	= UI.LAYER_EFFECT,
			layerStyle	= UI.WLS_RESIZABLE,

			effects =
			{{
				defName 			= "roleInfo_work",
				defaultAnimation	= "idle",

				links =
				{
					{
						objName		= "title_1",
						layer		= "UI.RoleInfoWnd.layers.CAPTION",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_2",
						layer		= "UI.RoleInfoWnd.layers.ROLE_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_1",
						layer		= "UI.RoleInfoWnd.layers.ROLE_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "text_2",
						layer		= "UI.RoleInfoWnd.layers.PARAMS_LABEL",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "description",
						layer		= "UI.RoleInfoWnd.layers.PARAMS_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_3",
						layer		= "UI.RoleInfoWnd.layers.SPEC_MODULE_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_title_1",
						layer		= "UI.RoleInfoWnd.layers.SPEC_MODULE_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_description_1",
						layer		= "UI.RoleInfoWnd.layers.SPEC_MODULE_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "title_4",
						layer		= "UI.RoleInfoWnd.layers.MODULES_HEADER",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_title_2",
						layer		= "UI.RoleInfoWnd.layers.MODULE_1_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_description_2",
						layer		= "UI.RoleInfoWnd.layers.MODULE_1_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_title_3",
						layer		= "UI.RoleInfoWnd.layers.MODULE_2_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_description_3",
						layer		= "UI.RoleInfoWnd.layers.MODULE_2_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_title_4",
						layer		= "UI.RoleInfoWnd.layers.MODULE_3_NAME",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "module_description_4",
						layer		= "UI.RoleInfoWnd.layers.MODULE_3_DESC",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},

					{
						objName		= "btn_x",
						wnd			= "UI.RoleInfo_CrossBtn",
						animParams	= UI.EffectAnimParams.POS + UI.EffectAnimParams.SIZE + UI.EffectAnimParams.ALIGNMENT + UI.EffectAnimParams.FONT + UI.EffectAnimParams.BLEND + UI.EffectAnimParams.COLOR + UI.EffectAnimParams.ALPHA,
					},
				}
			}}
		},

		-- CAPTION
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

        -- ROLE_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

        -- ROLE_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 10, 1 },
   			font			= { fontName = "Small" },
		},  

        -- PARAMS_LABEL
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "roleInfo_params" ),
		},  

        -- PARAMS_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},  

        -- SPEC_MODULE_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "roleInfo_specModule" ),
		},  

        -- SPEC_MODULE_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

        -- SPEC_MODULE_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},  

        -- MODULES_HEADER
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
			text			= UI:GetStringByName( "roleInfo_modules" ),
		},  

        -- MODULE_1_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

        -- MODULE_2_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		}, 

        -- MODULE_3_NAME
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_SINGLELINE + FONT.TF_NOCLIP,
   			formatInfoSz	= { 1, 1 },
   			font			= { fontName = "Small" },
		},  

        -- MODULE_1_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},  


        -- MODULE_2_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},  

        -- MODULE_3_DESC
		{
			layerType		= UI.LAYER_TEXT,
   			formatFlags		= FONT.TF_WORDBREAK,
   			formatInfoSz	= { 2, 1 },
   			font			= { fontName = "Small" },
		},  
	},

	children = { "UI.RoleInfo_CrossBtn" }
}

-- -----------------------------
-- interface functions
-- -----------------------------

--
function UI.RoleInfoWnd:ShowAsHelp( role )

	if type( role ) ~= "number" then
		sys.log( "UI.RoleInfoWnd:ShowAsHelp()[ERROR]: invalid type of the 1-st parameter (\"role\"); \"number\" expected, got \"%s\"", type( role ) )
		return
	end

	if UI:Val2Key( ai.ShipRoles, role ) == "" then
		sys.log( "UI.RoleInfoWnd:ShowAsHelp()[ERROR]: invalid 1-st parameter (\"role\"); one of the \"ai.ShipRoles\" members expected, got \"%s\"", tostring( role ) )
		return	
	end
	
	self:Reset()

	self.role = role
	self.mode = self.modes.HELP	

	if not self:IsOnScreen() then
		UI.Root:AddChild( self )  -- FullUpdate() будет вызван из F_OnAfterShowOnScreen()
	else
		self:FullUpdate()
	end		

	UI:PlayGlobalSound( self.sounds.showHelp )

end


--
function UI.RoleInfoWnd:ShowAsNotification( role )

	if type( role ) ~= "number" then
		sys.log( "UI.RoleInfoWnd:ShowAsNotification()[ERROR]: invalid type of the 1-st parameter (\"role\"); \"number\" expected, got \"%s\"", type( role ) )
		return
	end

	if UI:Val2Key( ai.ShipRoles, role ) == "" then
		sys.log( "UI.RoleInfoWnd:ShowAsNotification()[ERROR]: invalid 1-st parameter (\"role\"); one of the \"ai.ShipRoles\" members expected, got \"%s\"", tostring( role ) )
		return	
	end
	
	if self:IsRoleShown( role ) then
		sys.log( "UI.RoleInfoWnd:ShowAsNotification()[ERROR]: role %d(%s) was already shown", role, UI:Val2Key( ai.ShipRoles, role ) )
	end
	
	self:Reset()

	self.role = role
	self.mode = self.modes.NOTIFICATION

	if not self:IsOnScreen() then
		UI.Root:AddChild( self )  -- FullUpdate() будет вызван из F_OnAfterShowOnScreen()
	else
		self:FullUpdate()
	end		

	UI:PlayGlobalSound( self.sounds.showNotification )

	self:SetRoleShown( role )

end


--
function UI.RoleInfoWnd:IsRoleShown( role )

	return UI.serverData.userData.rolesShown and UI:IsTrueEx( UI.serverData.userData.rolesShown[ tostring( role ) ] )

end


-- -----------------------------
-- const
-- -----------------------------

UI.RoleInfoWnd.layers =
{
    MAIN_EFFECT			= 0,
    BG_EFFECT			= 1,
    WORK_EFFECT			= 2,
    CAPTION				= 3,
    ROLE_NAME			= 4,
    ROLE_DESC			= 5,
    PARAMS_LABEL		= 6,
    PARAMS_DESC			= 7,
    SPEC_MODULE_HEADER	= 8,
    SPEC_MODULE_NAME	= 9,
    SPEC_MODULE_DESC	= 10,
    MODULES_HEADER		= 11,
    MODULE_1_NAME		= 12,
    MODULE_2_NAME		= 13,
    MODULE_3_NAME		= 14,
    MODULE_1_DESC		= 15,
    MODULE_2_DESC		= 16,
    MODULE_3_DESC		= 17,
}

UI.RoleInfoWnd.effectInfo =
{
	work =
	{
		roleIcoSpriteName		= "ico",
		specModuleIcoLocator	= "module_ico_1",
		moduleIcoLocators =
		{
			"module_ico_2",
			"module_ico_3",
			"module_ico_4",
		}
	}
}

UI.RoleInfoWnd.modes =
{
	NOTIFICATION	= 1,
	HELP			= 2,
}

UI.RoleInfoWnd.MAX_MODULES = 3

UI.RoleInfoWnd.sounds =
{
	hide				= "sound/ui/MsgHide",
	showHelp			= "sound/ui/btnClick",
	showNotification	= "sound/ui/unlock",
}

-- -----------------------------
-- vars
-- -----------------------------

UI.RoleInfoWnd.role				= -1
UI.RoleInfoWnd.mode				= -1
UI.RoleInfoWnd.specModuleIcoWnd	= nil
UI.RoleInfoWnd.moduleIconWnds	= {}

-- -----------------------------
-- work functions
-- -----------------------------

--
function UI.RoleInfoWnd:F_PostLoad()

    UI.FullScreenWnd.F_PostLoad( self )

	self:CreateControls()
	self:Reset()

end


--
function UI.RoleInfoWnd:CreateControls()

	self.specModuleIcoWnd = UI:CreateChildWnd( self, UI.ItemIcoWnd, "" )

	for idx = 1, self.MAX_MODULES  do
		self.moduleIconWnds[ idx ] = UI:CreateChildWnd( self, UI.ItemIcoWnd, tostring( idx ) )
	end

end


--
function UI.RoleInfoWnd:AddControl( wnd, effectLayer, locatorName )

	if not wnd then
		return
	end

    local effect = UI:GetEffectFromLayer( self, effectLayer )

	if wnd:IsChildOf( self ) and effect then
    	effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

	UI:AddChildAndLink( self, wnd, effect, locatorName, UI.EffectAnimParams.POS )

end


--
function UI.RoleInfoWnd:RemoveControl( wnd, effectLayer )

	if not wnd or not wnd:IsChildOf( self ) then
		return
	end

	wnd:UnlinkFromParent()

	local effect = UI:GetEffectFromLayer( self, effectLayer )
	if effect then
		effect:UnlinkWnd( wnd:GetUiHandle(), "" )
	end

end    


--
function UI.RoleInfoWnd:Reset()

	self.role	= -1
	self.mode	= -1

	self:SetText( "", self.layers.CAPTION )
	self:SetText( "", self.layers.ROLE_NAME )
	self:SetText( "", self.layers.ROLE_DESC )
	self:SetText( "", self.layers.PARAMS_DESC )
	self:SetText( "", self.layers.SPEC_MODULE_NAME )
	self:SetText( "", self.layers.SPEC_MODULE_DESC )

	for idx = 1, self.MAX_MODULES  do
		self:SetText( "", self.layers.MODULE_1_NAME + idx - 1 )
		self:SetText( "", self.layers.MODULE_1_DESC + idx - 1 )
	end

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if workEffect then
		workEffect:SetSpriteTexture( self.effectInfo.work.roleIcoSpriteName, UI.INVALID_RESOURCE_HANDLE )
	end

	self.specModuleIcoWnd:Reset()
	self:RemoveControl( self.specModuleIcoWnd, self.layers.WORK_EFFECT )

	for idx = 1, self.MAX_MODULES  do
		local moduleWnd = self.moduleIconWnds[ idx ]
		moduleWnd:Reset()
		self:RemoveControl( moduleWnd, self.layers.WORK_EFFECT )
	end

end


--
function UI.RoleInfoWnd:FullUpdate()

	if self.role == -1 then
		return
	end	

	self:UpdateCaption()
	self:UpdateRoleIco()
	self:UpdateRoleName()
	self:UpdateRoleDesc()
	self:UpdateparamsDesc()
	self:UpdateSpecModule()
	self:UpdateModules()

end


--
function UI.RoleInfoWnd:UpdateCaption()

	local str = ""

	if self.mode == self.modes.NOTIFICATION then
		str = UI:GetStringByName( "roleInfo_caption_NOTIFICATION" )

	elseif self.mode == self.modes.HELP then
		str = UI:GetStringByName( "roleInfo_caption_HELP" )

	else
		sys.log( "UI.RoleInfoWnd:UpdateCaption()[ERROR]: unhandled mode: %s", tostring( self.mode ) )
	end

	self:SetText( str, self.layers.CAPTION )

end


--
function UI.RoleInfoWnd:UpdateRoleIco()

	local workEffect = UI:GetEffectFromLayer( self, self.layers.WORK_EFFECT )
	if not workEffect then
		return
	end

	local hTex = UI:GetRoleIco3( self.role )
	workEffect:SetSpriteTexture( self.effectInfo.work.roleIcoSpriteName, hTex )	
	
end


--
function UI.RoleInfoWnd:UpdateRoleName()

	local shipClass = UI:GetShipClassByRole( self.role )
	local str = string.format( "%s: %s", UI:ShipType2Str( shipClass ), UI:Role2Str( self.role ) )
	
	self:SetText( str, self.layers.ROLE_NAME )

end


--
function UI.RoleInfoWnd:UpdateRoleDesc()

	local str = UI:GetRoleDesc( self.role )
	self:SetText( str, self.layers.ROLE_DESC )

end


--
function UI.RoleInfoWnd:UpdateparamsDesc()

	local str = UI:GetRoleParamsDesc( self.role )
	self:SetText( str, self.layers.PARAMS_DESC )

end


--
function UI.RoleInfoWnd:UpdateSpecModule()

	local roleInfo = _G.RoleDescription and _G.RoleDescription[ self.role ]
	if roleInfo == nil then
		sys.log( "UI.RoleInfoWnd:UpdateSpecModule()[ERROR]: cannot find \"_G.RoleDescription[%d]\"", self.role )
		return
	else
		if type( roleInfo ) ~= "table" then
			sys.log( "UI.RoleInfoWnd:UpdateSpecModule()[ERROR]: invalid type of \"_G.RoleDescription[%d]\"; \"table\" expected, got \"%s\"", self.role, type( roleInfo ) )
			return
		end
	end

	local specModuleSubType = roleInfo.special

	if type( specModuleSubType ) ~= "number" then
		sys.log( "UI.RoleInfoWnd:UpdateSpecModule()[ERROR]: invalid type of \"_G.RoleDescription[%d].special\"; \"number\" expected, got \"%s\"", self.role, type( specModuleSubType ) )
		return
	end

	-- иконка

	self:AddControl( self.specModuleIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.specModuleIcoLocator )
	local hTex = UI:GetItemSubTypeIco( specModuleSubType )
	self.specModuleIcoWnd:SetupIco( hTex ) 	

	-- название

	local strName = UI:ItemSubType2Str2( specModuleSubType )
	self:SetText( strName, self.layers.SPEC_MODULE_NAME )

	-- описание

	local strDesc = UI:GetItemSubTypeDesc( specModuleSubType )
	self:SetText( strDesc, self.layers.SPEC_MODULE_DESC )

end


--
function UI.RoleInfoWnd:UpdateModules()

	local roleInfo = _G.RoleDescription and _G.RoleDescription[ self.role ]
	if roleInfo == nil then
		sys.log( "UI.RoleInfoWnd:UpdateModules()[ERROR]: cannot find \"_G.RoleDescription[%d]\"", self.role )
		return
	else
		if type( roleInfo ) ~= "table" then
			sys.log( "UI.RoleInfoWnd:UpdateModules()[ERROR]: invalid type of \"_G.RoleDescription[%d]\"; \"table\" expected, got \"%s\"", self.role, type( roleInfo ) )
			return
		end
	end

	local modulesInfo = roleInfo.active

	if type( modulesInfo ) ~= "table" then
		sys.log( "UI.RoleInfoWnd:UpdateSpecModule()[ERROR]: invalid type of \"_G.RoleDescription[%d].active\"; \"table\" expected, got \"%s\"", self.role, type( modulesInfo ) )
		return
	end

	local numModules = #modulesInfo
	if numModules > self.MAX_MODULES then
		sys.log( "UI.RoleInfoWnd:UpdateModules()[ERROR]: too many active modules in for role %d; only %d can show", self.role, self.MAX_MODULES )
		numModules = self.MAX_MODULES
	end

	local moduleSubTypes = {}

	for idx = 1, numModules do

		local moduleSubType = modulesInfo[ idx ]
		if type( moduleSubType ) == "number" then
			table.insert( moduleSubTypes, moduleSubType )
		else
			sys.log( "UI.RoleInfoWnd:UpdateSpecModule()[ERROR]: invalid type of \"_G.RoleDescription[%d].active[%d]\"; \"table\" expected, got \"%s\"", self.role, idx, type( moduleSubType ) )
		end

	end

	for idx = 1, #moduleSubTypes do

		local moduleSubType = moduleSubTypes[ idx ]
		local moduleIcoWnd = self.moduleIconWnds[ idx ]

		-- иконка

    	self:AddControl( moduleIcoWnd, self.layers.WORK_EFFECT, self.effectInfo.work.moduleIcoLocators[ idx ] )
    	local hTex = UI:GetItemSubTypeIco( moduleSubType )
    	moduleIcoWnd:SetupIco( hTex ) 	

		-- название

    	local strName = UI:ItemSubType2Str2( moduleSubType )
    	self:SetText( strName, self.layers.MODULE_1_NAME + idx - 1 )

		-- описание

		local strDesc = UI:GetItemSubTypeDesc( moduleSubType )
		self:SetText( strDesc, self.layers.MODULE_1_DESC + idx - 1 )

	end

end


--
function UI.RoleInfoWnd:F_OnEventSaveUiState()

	UI.store.RoleInfoWnd =
	{
		role	= self.role,
		mode	= self.mode,
	}

end


--
function UI.RoleInfoWnd:F_OnEventRestoreUiState()

	if UI.store.RoleInfoWnd then

		self.role	= UI.store.RoleInfoWnd.role
		self.mode	= UI.store.RoleInfoWnd.mode

		if self:IsOnScreen() then
			self:FullUpdate()
		end

		UI.store.RoleInfoWnd = nil

	end

end


--
function UI.RoleInfoWnd:F_OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput )

	if self:OnMouseLButtonDown( mouseX, mouseY, wndThatReceivedInput ) then
		return true
	end

	local w = UI:GetUiObjByHandleT( wndThatReceivedInput ) 

	if w == UI.RoleInfo_CrossBtn then
		UI:PlayGlobalSound( self.sounds.hide )
		self:Hide()
	end

	return true

end


--
function UI.RoleInfoWnd:OnEscape()

	UI:PlayGlobalSound( self.sounds.hide )
	self:Hide()

	return true

end


--
function UI.RoleInfoWnd:SetRoleShown( role )

	if type( role ) ~= "number" or role == -1 then
		sys.log( "UI.RoleInfoWnd:SetRoleShown()[ERROR]: invalid role: %s", tostring( role ) )
		return
	end

	if self:IsRoleShown( role ) then
		return
	end

	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.RoleInfoWnd:SetRoleShown()[ERROR]: master server is not connected" )
		return
	end

	if not UI.serverData.userData.rolesShown then
		UI.serverData.userData.rolesShown = {}
	end

	-- с числовыми ключами глючит, поэтому приходится переводить в строку
	UI.serverData.userData.rolesShown[ tostring( role ) ] = 1
	UI:SaveServerUserData()

end


-- ------------------------------------------------------------------------
-- UI.RoleInfo_CrossBtn
-- ------------------------------------------------------------------------

UI.RoleInfo_CrossBtn =
{
	def =
	{
    	className 	= "ButtonWnd",
    	prototype	= "CrossBtn",

    	props =
    	{
    		name = "RoleInfo_CrossBtn"
    	}
	}
}