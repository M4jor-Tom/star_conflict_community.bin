-- --------------------------------------------------------------------
-- HudEditor
-- --------------------------------------------------------------------

if UI.HudEditor ~= nil then
	return
end

UI.HudEditor = {}

-- ---------------------------------
-- interface functions
-- ---------------------------------

--
function UI.HudEditor:Init()

	self:InitEffectRcs()

end


--
function UI.HudEditor:Shutdown()

	self:ReleaseEffectRcs()

end


--
function UI.HudEditor:GetParam( wndName, paramName )
	
	local param = nil
	
	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:GetParam()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return param
	end
	
	if type( paramName ) ~= "string" then
		sys.log( "UI.HudEditor:GetParam()[ERROR]: invalid type of the 2-nd parameter (\"paramName\"); \"string\" expected, got \"%s\"", type( paramName ) )
		return param
	end
	
	local bNeedDefault = false
	
	-- поиск в измененных данных
	param, bNeedDefault = self:GetParamInternal( wndName, paramName, self.changedData )
	
	-- поиск в сохраненных данных
	if param == nil and not bNeedDefault then
		param = self:GetParamInternal( wndName, paramName, UI.serverData.userData.hudEditor )
	end
	
	-- поиск в дефолтных данных
	if param == nil then
	
		if paramName == self.POS_PARAM_NAME then
		
			local pos = self:GetDefaultWndPosAbs( wndName )
			
			param =
			{
				x		= pos.x,
				y		= pos.y,
				hAnch	= UI:Val2Key( self.hAnchors, self.hAnchors.LEFT ),
				vAnch	= UI:Val2Key( self.vAnchors, self.vAnchors.TOP ),
				res		= { x = self.hudRes.x, y = self.hudRes.y },
			}
			
		elseif paramName == self.SIZE_PARAM_NAME then
		
			local size, res = self:GetDefaultWndSizeAbs( wndName )
			
			param =
			{
				x	= size.x,
				y	= size.y,
				res	= { x = res.x, y = res.y },
			}
			
		else
		
			local wndInfo = self.windowsInfo[ wndName ]
			if wndInfo then
			
				param = wndInfo[ paramName ]
				
				if param == nil then
					sys.log( "UI.HudEditor:GetParam()[ERROR]: no default data for param %s wnd %s", paramName, wndName )
				end

			else
				sys.log( "UI.HudEditor:GetParam()[ERROR]: no info for wnd %s", wndName )
			end
			
		end
		
	end
	
	return param
	
end


--
function UI.HudEditor:SetParam( wndName, paramName, param )

	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:SetParam()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return
	end
	
	if type( paramName ) ~= "string" then
		sys.log( "UI.HudEditor:SetParam()[ERROR]: invalid type of the 2-nd parameter (\"paramName\"); \"string\" expected, got \"%s\"", type( paramName ) )
		return
	end
	
	local curConfigId = self:GetCurConfig()
	local strCurConfigId = tostring( curConfigId )	-- в userData не получается записать числовой ключ; при перелогине он превращается в строковый
	
	if not self.changedData then
	
		if type( UI.serverData.userData.hudEditor ) == "table" then
			self.changedData = UI:CopyTable2( UI.serverData.userData.hudEditor )
		else
			self.changedData = {}
			self.changedData.curConfig = curConfigId
		end
		
	end
	
	if type( self.changedData.configs ) ~= "table" then
		self.changedData.configs = {}
	end
	
	if type( self.changedData.configs[ strCurConfigId ] ) ~= "table" then
		self.changedData.configs[ strCurConfigId ] = {}
	end
	
	if type( self.changedData.configs[ strCurConfigId ][ wndName ] ) ~= "table" then
		self.changedData.configs[ strCurConfigId ][ wndName ] = {}
	end
	
	self.changedData.configs[ strCurConfigId ][ wndName ][ paramName ] = param	
	
	if UI.HudEditorWnd then
		UI.HudEditorWnd:HudEditor_OnParamChanged( curConfigId, wndName, paramName )
	end
	
	if UI.HudWnd then
		UI.HudWnd:HudEditor_OnParamChanged( curConfigId, wndName, paramName )
	end
	
end


-- позиция рамки в редакторе; не обязательно должна совпадать с позицией самого окна
-- в системе координат 1024*768
function UI.HudEditor:GetWndPos( wndName )

	local pos = Vec2( 0, 0 )

	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:GetWndPos()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return pos
	end
	
	local param = self:GetParam( wndName, self.POS_PARAM_NAME )
	
	if param == nil then
		sys.log( "UI.HudEditor:GetWndPos()[ERROR]: no param data for wnd %s", wndName )
		return pos
	end
	
	local bParamValid =
		type( param ) == "table"
		and type( param.hAnch ) == "string"
		and self.hAnchors[ param.hAnch ] ~= nil
		and type( param.vAnch ) == "string"
		and self.vAnchors[ param.vAnch ] ~= nil
		and type( param.x ) == "number"
		and type( param.y ) == "number"
		and type( param.res ) == "table"
		and type( param.res.x ) == "number"
		and type( param.res.y ) == "number"
		
	if not bParamValid then
		sys.log( "UI.HudEditor:GetWndPos()[ERROR]: invalid param format for wnd %s", wndName )
		return pos
	end

	local hAnchor	= self.hAnchors[ param.hAnch ]
	local vAnchor	= self.vAnchors[ param.vAnch ]
	local size		= self:GetWndSize( wndName )	-- в 1024*768
	
	-- перевод в текущее базовое разрешение худа (из того, в котором было сохранено)
	local scale = math.min( self.hudRes.x / param.res.x, self.hudRes.y / param.res.y )
	if scale < 1 then
		scale = 1
	end
	
	local x = param.x * scale
	local y = param.y * scale
	
	-- перевод в 1024*768
	x = UI:XToRel( x, true, self.hudRes )
	y = UI:YToRel( y, true, self.hudRes )

	-- в param было сохранено расстояние от точки привязки, перевод его в координаты на экране
	if hAnchor == self.hAnchors.LEFT then
		pos.x = x
	elseif hAnchor == self.hAnchors.RIGHT then
		pos.x = 1024 - x - size.x
	elseif hAnchor == self.hAnchors.CENTER then
		pos.x = 1024 * 0.5 - x
	else
		sys.log( "UI.HudEditor:GetWndPos()[ERROR]: unhandled hAnchor %d", hAnchor )
	end
	
	if vAnchor == self.vAnchors.TOP then
		pos.y = y
	elseif vAnchor == self.vAnchors.BOTTOM then
		pos.y = 768 - y - size.y
	elseif vAnchor == self.vAnchors.CENTER then
		pos.y = 768 * 0.5 - y
	else
		sys.log( "UI.HudEditor:GetWndPos()[ERROR]: unhandled vAnchor %d", vAnchor )
	end

	return pos
	
end


-- позиция рамки в редакторе; не обязательно должна совпадать с позицией самого окна
-- в системе координат 1024*768
function UI.HudEditor:SetWndPos( wndName, _pos )
	
	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:SetWndPos()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return
	end
	
	if type( _pos ) ~= "userdata" then
		sys.log( "UI.HudEditor:SetWndPos()[ERROR]: invalid type of the 2-nd parameter (\"pos\"); \"userdata\" expected, got \"%s\"", type( _pos ) )
		return
	end
	
	local pos = UI:Vec2CopyStable( _pos )
	
	local x			= pos.x
	local y			= pos.y
	local hAnchor	= self.hAnchors.LEFT
	local vAnchor	= self.vAnchors.TOP
	
	local wndSize = self:GetWndSize( wndName )
	local wndCenter = Vec2( pos.x + wndSize.x * 0.5, pos.y + wndSize.y * 0.5 )
	
	if wndCenter.x <= self.LEFT_ANCHOR_ZONE then
		hAnchor	= self.hAnchors.LEFT
		x		= pos.x
	elseif wndCenter.x >= 1024 - self.RIGHT_ANCHOR_ZONE then
		hAnchor	= self.hAnchors.RIGHT
		x		= 1024 - ( pos.x + wndSize.x )
	else
		hAnchor	= self.hAnchors.CENTER
		x		= 1024 * 0.5 - pos.x
	end
	
	if wndCenter.y <= self.TOP_ANCHOR_ZONE then
		vAnchor	= self.vAnchors.TOP
		y		= pos.y
	elseif wndCenter.y >= 768 - self.BOTTOM_ANCHOR_ZONE then
		vAnchor	= self.vAnchors.BOTTOM
		y		= 768 - ( pos.y + wndSize.y )
	else
		vAnchor	= self.vAnchors.CENTER
		y		= 768 * 0.5 - pos.y
	end
	
	x = UI:XToAbs( x, true, self.hudRes )
	y = UI:YToAbs( y, true, self.hudRes )
	
	local param =
	{
		x		= x,
		y		= y,
		hAnch	= UI:Val2Key( self.hAnchors, hAnchor ),
		vAnch	= UI:Val2Key( self.vAnchors, vAnchor ),
		res		= { x = self.hudRes.x, y = self.hudRes.y },
	}
	
	self:SetParam( wndName, self.POS_PARAM_NAME, param )

end


-- размер рамки в редакторе; не обязательно должен совпадать с размером самого окна
-- в системе координат 1024*768
function UI.HudEditor:GetWndSize( wndName )

	local size = UI:Vec2CopyStable( self.defaultWndSize_abs )
	size.x = UI:XToRel( size.x, true, self.hudRes )
	size.y = UI:YToRel( size.y, true, self.hudRes )
	
	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:GetWndSize()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return size
	end
	
	local param = self:GetParam( wndName, self.SIZE_PARAM_NAME )
	
	if param == nil then
		sys.log( "UI.HudEditor:GetWndSize()[ERROR]: no param data for wnd %s", wndName )
		return size
	end
	
	local bParamValid =
		type( param ) == "table"
		and type( param.x ) == "number"
		and type( param.y ) == "number"
		and type( param.res ) == "table"
		and type( param.res.x ) == "number"
		and type( param.res.y ) == "number"
		
	if not bParamValid then
		sys.log( "UI.HudEditor:GetWndSize()[ERROR]: invalid param format for wnd %s", wndName )
		return size
	end
	
	local res = self.hudRes
	
	local wndInfo = self.windowsInfo[ wndName ]
	if wndInfo then
	
		if wndInfo.GetSize then
		
			local defaultSize = nil
			defaultSize, res = wndInfo.GetSize()
		
		elseif wndInfo.sizeEffect then
		
			local effectRc = self.effectRcs[ wndInfo.sizeEffect.effectName ]
			if effectRc then
				res = effectRc.rc:GetResolution()
			else
				sys.log( "UI.HudEditor:GetWndSize()[ERROR]: no effect %s", wndInfo.sizeEffect.effectName )
			end
		
		else
			sys.log( "UI.HudEditor:GetWndSize()[ERROR]: no size data for wnd %s", wndName )
		end
		
	else
		sys.log( "UI.HudEditor:GetWndSize()[ERROR]: no info for wnd %s", wndName )
	end
	
	-- перевод в текущее базовое разрешение окна (из того, в котором было сохранено)
	local scale = math.min( res.x / param.res.x, res.y / param.res.y )
	if scale < 1 then
		scale = 1
	end
	
	size.x = param.x * scale
	size.y = param.y * scale
	
	-- перевод в 1024*768
	size.x = UI:XToRel( size.x, true, res )
	size.y = UI:YToRel( size.y, true, res )
	
	return size
	
end


-- размер рамки в редакторе; не обязательно должен совпадать с размером самого окна
-- в системе координат 1024*768
function UI.HudEditor:SetWndSize( wndName, _size )

	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:SetWndSize()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return
	end
	
	if type( _size ) ~= "userdata" then
		sys.log( "UI.HudEditor:SetWndSize()[ERROR]: invalid type of the 2-nd parameter (\"size\"); \"userdata\" expected, got \"%s\"", type( _size ) )
		return
	end
	
	local size = UI:Vec2CopyStable( _size )
	
	local res = self.hudRes
	
	local wndInfo = self.windowsInfo[ wndName ]
	if wndInfo then
	
		if wndInfo.GetSize then
		
			local defaultSize = nil
			defaultSize, res = wndInfo.GetSize()
	
		elseif wndInfo.sizeEffect then
		
			local effectRc = self.effectRcs[ wndInfo.sizeEffect.effectName ]
			if effectRc then
				res = effectRc.rc:GetResolution()
			else
				sys.log( "UI.HudEditor:SetWndSize()[ERROR]: no effect %s", wndInfo.sizeEffect.effectName )
			end
		
		else
			sys.log( "UI.HudEditor:SetWndSize()[ERROR]: no size data for wnd %s", wndName )
		end
		
	else
		sys.log( "UI.HudEditor:SetWndSize()[ERROR]: no info for wnd %s", wndName )
	end
	
	size.x = UI:XToAbs( size.x, true, res )
	size.y = UI:YToAbs( size.y, true, res )
	
	local param =
	{
		x		= size.x,
		y		= size.y,
		res		= { x = res.x, y = res.y },
	}
	
	self:SetParam( wndName, self.SIZE_PARAM_NAME, param )
	
end


--
function UI.HudEditor:IsWndVisible( wndName )
	
	local bVisible = true
	
	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:IsWndVisible()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return bVisible
	end
	
	local param = self:GetParam( wndName, self.VISIBLE_PARAM_NAME )
	
	if param == nil then
		sys.log( "UI.HudEditor:IsWndVisible()[ERROR]: no param data for wnd %s", wndName )
		return bVisible
	end
	
	local bParamValid = type( param ) == "number" or type( param ) == "boolean"
	
	if not bParamValid then
		sys.log( "UI.HudEditor:IsWndVisible()[ERROR]: invalid param format for wnd %s", wndName )
		return bVisible
	end
	
	bVisible = UI:IsTrueEx( param )
	
	return bVisible
	
end


--
function UI.HudEditor:SetWndVisible( wndName, bVisible )
	
	if type( wndName ) ~= "string" then
		sys.log( "UI.HudEditor:SetWndVisible()[ERROR]: invalid type of the 1-st parameter (\"wndName\"); \"string\" expected, got \"%s\"", type( wndName ) )
		return
	end
	
	if type( bVisible ) ~= "boolean" then
		sys.log( "UI.HudEditor:SetWndVisible()[ERROR]: invalid type of the 2-nd parameter (\"bVisible\"); \"boolean\" expected, got \"%s\"", type( bVisible ) )
		return
	end
	
	self:SetParam( wndName, self.VISIBLE_PARAM_NAME, bVisible )

end


--
function UI.HudEditor:GetCurConfig()
	
	local curConfigId = 1
	
	if self.changedData and type( self.changedData.curConfig ) == "number" then
		curConfigId = self.changedData.curConfig
	
	else
		if type( UI.serverData.userData.hudEditor ) == "table" and type( UI.serverData.userData.hudEditor.curConfig ) == "number" then
			curConfigId = UI.serverData.userData.hudEditor.curConfig
		end
	end
	
	if curConfigId < 1 or curConfigId > self.MAX_CONFIGS then
		curConfigId = 1
	end
	
	return curConfigId
	
end


--
function UI.HudEditor:SetCurConfig( configId )
	
	if type( configId ) ~= "number" then
		sys.log( "UI.HudEditor:SetCurConfig()[ERROR]: invalid type of the 1-st parameter (\"configId\"); \"number\" expected, got \"%s\"", type( configId ) )
		return
	end
	
	if self:GetCurConfig() == configId then
		return
	end
	
	if configId < 1 or configId > self.MAX_CONFIGS then
		sys.log( "UI.HudEditor:SetCurConfig()[ERROR]: invalid configId %d", configId )
		return
	end
	
	if not self.changedData then
	
		if type( UI.serverData.userData.hudEditor ) == "table" then
			self.changedData = UI:CopyTable2( UI.serverData.userData.hudEditor )
		else
			self.changedData = {}
		end
		
	end
	
	self.changedData.curConfig = configId
	
	if UI.HudEditorWnd then
		UI.HudEditorWnd:HudEditor_OnCurConfigChanged()
	end
	
	if UI.HudWnd then
		UI.HudWnd:HudEditor_OnCurConfigChanged()
	end
	
end


--
function UI.HudEditor:IsChanged()
	
	return self.changedData ~= nil
	
end


--
function UI.HudEditor:CancelChanges()
	
	if self.changedData then
	
		self.changedData = nil
		
		if UI.HudEditorWnd then
			UI.HudEditorWnd:HudEditor_OnCancelChanges()
		end
		
		if UI.HudWnd then
			UI.HudWnd:HudEditor_OnCancelChanges()
		end

	end
	
end


--
function UI.HudEditor:Save()
	
	if not self.changedData then
		return
	end
	
	if not _G.MasterServer_IsConnected() then
		sys.log( "UI.HudEditor:Save()[ERROR]: not connected to server" )
		return
	end
	
	-- параметры, которые нужно сделать по умолчанию, убираются из сохраненных данных;
	-- убираются все пустые таблицы
	
	if type( self.changedData.configs ) == "table" then
	
		for strConfigId, configData in pairs( self.changedData.configs ) do	-- в userData не получается записать числовой ключ; при перелогине он превращается в строковый
			if type( configData ) == "table" then
			
				for wndName, wndData in pairs( configData ) do
					if type( wndData ) == "table" then
					
						for paramName, param in pairs( wndData ) do
							if type( param ) == "table" and param.hudEditor_default == true then
								wndData[ paramName ] = nil
							end
						end
						
						if not next( wndData ) then
							configData[ wndName ] = nil
						end
						
					end
				end
				
				if not next( configData ) then
					self.changedData.configs[ strConfigId ] = nil
				end
				
			end
		end
		
		if not next( self.changedData.configs ) then
			self.changedData.configs = nil
		end
		
	end
	
	UI.serverData.userData.hudEditor = self.changedData
	UI:SaveServerUserData()
	
	self.changedData = nil
	
	if UI.HudEditorWnd then
		UI.HudEditorWnd:HudEditor_OnSaveChanges()
	end
	
	if UI.HudWnd then
		UI.HudWnd:HudEditor_OnSaveChanges()
	end
	
end


--
function UI.HudEditor:ResetConfigToDefault( configId )

	if type( configId ) ~= "number" then
		sys.log( "UI.HudEditor:ResetConfigToDefault()[ERROR]: invalid type of the 1-st parameter (\"configId\"); \"number\" expected, got \"%s\"", type( configId ) )
		return
	end
	
	if configId < 1 or configId > self.MAX_CONFIGS then
		sys.log( "UI.HudEditor:ResetConfigToDefault]: invalid configId %d", configId )
		return
	end
	
	if self:IsConfigDefault( configId ) then
		return
	end
	
	local strConfigId = tostring( configId )	-- в userData не получается записать числовой ключ; при перелогине он превращается в строковый

	if not self.changedData then
	
		if type( UI.serverData.userData.hudEditor ) == "table" then
			self.changedData = UI:CopyTable2( UI.serverData.userData.hudEditor )
		else
			self.changedData = {}
			self.changedData.curConfig = self:GetCurConfig()
		end
		
	end
	
	if type( self.changedData.configs ) ~= "table" then
		self.changedData.configs = {}
	end
	
	self.changedData.configs[ strConfigId ] = {}
	
	if type( UI.serverData.userData.hudEditor ) == "table" and type( UI.serverData.userData.hudEditor.configs ) == "table" and type( UI.serverData.userData.hudEditor.configs[ strConfigId ] ) == "table" then
		for wndName, wndData in pairs( UI.serverData.userData.hudEditor.configs[ strConfigId ] ) do
			if type( wndName ) == "string" and type( wndData ) == "table" then
			
				self.changedData.configs[ strConfigId ][ wndName ] = {}
				
				for paramName, param in pairs( wndData ) do
					if type( paramName ) == "string" then
						self.changedData.configs[ strConfigId ][ wndName ][ paramName ] = { hudEditor_default = true }
					end
				end
				
			end
		end
	end
	
	if UI.HudEditorWnd then
		UI.HudEditorWnd:HudEditor_OnResetConfigToDefault( configId )
	end
	
	if UI.HudWnd then
		UI.HudWnd:HudEditor_OnResetConfigToDefault( configId )
	end
	
end


--
function UI.HudEditor:IsConfigDefault( configId )

	local bIsDefault = true
	
	if type( configId ) ~= "number" then
		sys.log( "UI.HudEditor:IsConfigDefault()[ERROR]: invalid type of the 1-st parameter (\"configId\"); \"number\" expected, got \"%s\"", type( configId ) )
		return bIsDefault
	end
	
	if configId < 1 or configId > self.MAX_CONFIGS then
		sys.log( "UI.HudEditor:SetCurConfigIsConfigDefaultERROR]: invalid configId %d", configId )
		return bIsDefault
	end
	
	local strConfigId = tostring( configId )	-- в userData не получается записать числовой ключ; при перелогине он превращается в строковый
	local data = self.changedData or UI.serverData.userData.hudEditor
	
	if type( data ) == "table" and type( data.configs ) == "table" and type( data.configs[ strConfigId ] ) == "table" then
		for wndName, wndData in pairs( data.configs[ strConfigId ] ) do
		
			for paramName, param in pairs( wndData ) do
				if type( paramName ) == "string" then
				
					local bDefaultParam = type( param ) == "table" and param.hudEditor_default == true
					if not bDefaultParam then
						bIsDefault = false
						break
					end
					
				end
			end
			
			if not bIsDefault then
				break
			end
		
		end
	end
	
	return bIsDefault
	
end


--
function UI.HudEditor:GetWndEditorName( realWndName )

	local wndName = ""
	
	if type( realWndName ) ~= "string" then
		sys.log( "UI.HudEditor:GetWndEditorName()[ERROR]: invalid type of the 1-st parameter (\"realWndName\"); \"string\" expected, got \"%s\"", type( realWndName ) )
		return wndName
	end
	
	for _wndName, wndInfo in pairs( self.windowsInfo ) do
	
		if wndInfo.wnds then
			for realWndIdx, _realWndName in pairs( wndInfo.wnds ) do
				if _realWndName == realWndName then
					wndName = _wndName
					break
				end
			end
		end
		
		if wndName ~= "" then
			break
		end
	
	end
	
	return wndName

end


--
function UI.HudEditor:OnBeforeReloadResources( resourceTypes, srcGroup, dstGroup )

	if bit.band( resourceTypes, UI.RES_EFFECT ) == UI.RES_EFFECT then
		self:ReleaseEffectRcs()
	end

end


--
function UI.HudEditor:OnAfterReloadResources( resourceTypes, srcGroup, dstGroup )

	if bit.band( resourceTypes, UI.RES_EFFECT ) == UI.RES_EFFECT then
		self:InitEffectRcs()
	end

end


-- ---------------------------------
-- const
-- ---------------------------------

UI.HudEditor.windowsInfo =
{
	[ "HudMapWnd_map" ] =
	{
		wnds = { "HudMapWnd_map" },
		
		visible = false,
		
		posEffect =
		{
			effectName	= "hud_main",
			locator		= "navigator",
			
			childEffect =
			{
				effectName	= "hud_workEffect1",
				locator		= "navigator2",
			}
		},
		
		sizeEffect =
		{
			effectName	= "hud_map_main",
			locator		= "self",
		},
	},
	
	[ "HudMapWnd_radar" ] =
	{
		wnds = { "HudMapWnd_radar" },
		
		visible = true,
		
		posEffect =
		{
			effectName	= "hud_main",
			locator		= "navigator",
			
			childEffect =
			{
				effectName	= "hud_workEffect1",
				locator		= "navigator2",
			}
		},
		
		sizeEffect =
		{
			effectName	= "hud_map_main",
			locator		= "self",
		},
	},
	
	[ "HudTargetViewWnd" ] =
	{
		wnds = { "HudTargetViewWnd" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "target_window",
		},
		
		sizeEffect =
		{
			effectName	= "hud_targetView",
			locator		= "self",
		}
	},
	
	[ "HudPveGameplayInfoWnd" ] =
	{
		wnds =
		{
			"HudPveGameplayInfoWnd",
			"HudPvpGameplayInfoWnd",
			"HudQuestTrackerWnd",
		},
		
		visible = true,
		
		posEffect =
		{
			effectName	= "hud_main",
			locator		= "navigator",
			
			childEffect =
			{
				effectName	= "hud_workEffect1",
				locator		= "gmp_info",
			}
		},
		
		sizeEffect =
		{
			effectName	= "hud_pvpGameplayInfo",
			locator		= "self",
		}
	},
	
	[ "HudForcesInfoWnd" ] =
	{
		wnds =
		{
			"HudForcesInfoWnd",
			"HudForcesInfoControlWnd",
			"HudForcesInfoSentinelWnd",
			"HudForcesInfoPveMissionWnd",
			"HudForcesInfoBombWnd",
			"HudForcesInfoCloseDistWnd",
			"HudForcesInfoKingWnd",
			"HudForcesInfoTdmWnd",
			"HudForcesInfoGtdmWnd",
			"HudForcesInfoThreeTdmWnd",
			"HudForcesInfoClanShipWnd",
			"HudForcesInfoCustomWnd",
			"HudForcesInfoHungerWnd",
			"HudForcesinfoOAAWnd",
			"HudBossHpWnd",
			"HudPlayerStatusWnd",
		},
			
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "ratio",
		},
		
		sizeEffect =
		{
			effectName	= "hud_main",
			locator		= "ratio",
		}
	},
	
	[ "HudCargoWnd" ] =
	{
		wnds = { "HudCargoWnd" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "loot",
		},
		
		sizeEffect =
		{
			effectName	= "hud_cargo_main",
			locator		= "self",
		}
	},
	
	[ "HudFriendlyPlayersWnd" ] =
	{
		wnds = { "HudFriendlyPlayersWnd" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "squad_info",
		},
		
		sizeEffect =
		{
			effectName	= "hud_friendlyPlayers_main",
			locator		= "self",
		}
	},
	
	[ "HudAurasWnd_buffs" ] =
	{
		wnds = { "HudAurasWnd_buffs" },
		
		visible = true,
		
		posEffect =
		{
			effectName	= "hud_main",
			locator		= "buff",
			
			childEffect =
			{
				effectName	= "hud_auras_main",
				locator		= "slot_friend",
			}
		},
		
		sizeEffect =
		{
			effectName	= "hud_auras_buffsList",
			locator		= "self",
		}
	},
	
	[ "HudAurasWnd_debuffs" ] =
	{
		wnds = { "HudAurasWnd_debuffs" },
		
		visible = true,
		
		posEffect =
		{
			effectName	= "hud_main",
			locator		= "buff",
			
			childEffect =
			{
				effectName	= "hud_auras_main",
				locator		= "slot_enemy",
			}
		},
		
		sizeEffect =
		{
			effectName	= "hud_auras_debuffsList",
			locator		= "self",
		}
	},

	[ "HudWowWnd" ] =
	{
		wnds = { "HudWowWnd" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "warning",
		},
		
		sizeEffect =
		{
			effectName	= "hud_wow",
			locator		= "text",
		}
	},
	
	[ "HudGameMsg" ] =
	{
		wnds = { "HudGameMsg" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "msg_2",
		},
		
		sizeEffect =
		{
			effectName	= "hud_gameMsg",
			locator		= "text",
		}
	},
	
	[ "HudMedalsWnd" ] =
	{
		wnds = { "HudMedalsWnd" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "medals",
		},
		
		sizeEffect =
		{
			effectName	= "hud_main",
			locator		= "medals",
		}
	},
	
	[ "HudEfficiencyWnd" ] =
	{
		wnds = { "HudEfficiencyWnd" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "score",
			
			childEffect =
			{
				effectName	= "hud_efficiency",
				locator		= "medals",
			}
		},
		
		sizeEffect =
		{
			effectName	= "hud_efficiencyDocked_main",
			locator		= "self",
		}
	},
	
	[ "HudObjInteractionWnd" ] =
	{
		wnds =
		{
			"HudObjInteractionWnd",
			"HudCaptureVpWnd",
			"HudBuildingProgressWnd",
			"HudAdditionalCmdProgressWnd"
		},
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "bomb_prog",
		},
		
		sizeEffect =
		{
			effectName	= "hud_progressBars",
			locator		= "self41",
		}
	},
	
	[ "HudPlayersWnd2_friends" ] =
	{
		wnds = { "HudPlayersWnd2_friends" },
		
		visible = false,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "map_view",
			
			childEffect =
			{
				effectName	= "players_main",
				locator		= "players_slot_left",
			}
		},
		
		sizeEffect =
		{
			effectName	= "playersList",
			locator		= "self",
		}
	},
	
	[ "HudPlayersWnd2_enemies" ] =
	{
		wnds = { "HudPlayersWnd2_enemies" },
		
		visible = false,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "map_view",
			
			childEffect =
			{
				effectName	= "players_main",
				locator		= "short_4_name",
			}
		},
		
		sizeEffect =
		{
			effectName	= "playersList",
			locator		= "self",
		}
	},
	
	[ "HudKillsWnd" ] =
	{
		wnds = { "HudKillsWnd" },
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "killmess",
		},
		
		sizeEffect =
		{
			effectName	= "hud_kills_main",
			locator		= "self",
		}
	},
	
	[ "HudModulesWnd_weapon" ] =
	{
		parentWnd = "HudModulesWnd",
		sortOrder = 1,
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "modules",
			
			childEffect =
			{
				effectName	= "modules_main",
				locator		= "slot_1",
			}
		},
		
		sizeEffect =
		{
			effectName	= "modules_slot",
			locator		= "self",
		}
	},
	
	[ "HudModulesWnd_rockets" ] =
	{
		parentWnd = "HudModulesWnd",
		sortOrder = 2,
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "modules",
			
			childEffect =
			{
				effectName	= "modules_main",
				locator		= "missle_1",
			}
		},
		
		sizeEffect =
		{
			effectName	= "modules_slot",
			locator		= "self",
		}
	},
	
		
	[ "HudModulesWnd_specModule" ] =
	{
		parentWnd = "HudModulesWnd",
		sortOrder = 3,
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "modules",
			
			childEffect =
			{
				effectName	= "modules_main",
				locator		= "modules_special",
			}
		},
		
		sizeEffect =
		{
			effectName	= "modules_specialSlot",
			locator		= "self",
		}
	},
	
	[ "HudModulesWnd_activeModules" ] =
	{
		parentWnd = "HudModulesWnd",
		sortOrder = 4,
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "modules",
			
			childEffect =
			{
				effectName	= "modules_main",
				locator		= "modul_1",
			}
		},
		
		GetSize = function()
		
			local size	= Vec2( 0, 0 )
			local res	= UI.HudEditor.hudRes
			
			local modulesEffectRc	= UI.HudEditor.effectRcs[ "modules_main" ]
			local slotEffectRc		= UI.HudEditor.effectRcs[ "modules_slot" ]
			
			if modulesEffectRc and slotEffectRc then

				res = modulesEffectRc.rc:GetResolution()
				
				local slot1Pos	= modulesEffectRc.rc:GetObjPos( "modul_1" )
				local slot2Pos	= modulesEffectRc.rc:GetObjPos( "modul_2" )
				local slotSize 	= slotEffectRc.rc:GetObjSize( "self" )
				
				local space = slot2Pos.x - ( slot1Pos.x + slotSize.x )
				
				local NUM_SOTS = ai.SpaceShipModuleSlot.ACTIVE_04 - ai.SpaceShipModuleSlot.ACTIVE_01 + 1
				size.x = slotSize.x * NUM_SOTS + space * ( NUM_SOTS - 1 )
				size.y = slotSize.y
		
			else
				sys.log( "UI.HudEditor.HudModulesWnd_activeModules.GetSize()[ERROR]: no effect modules_main or modules_slot" )
			end

			return size, res
		
		end
	},
	
	[ "HudModulesWnd_passiveModules" ] =
	{
		parentWnd = "HudModulesWnd",
		sortOrder = 4,
		
		visible = true,

		posEffect =
		{
			effectName	= "hud_main",
			locator		= "modules",
			
			childEffect =
			{
				effectName	= "modules_main",
				locator		= "missle_2",
			}
		},
		
		GetSize = function()
		
			local size	= Vec2( 0, 0 )
			local res	= UI.HudEditor.hudRes
			
			local modulesEffectRc	= UI.HudEditor.effectRcs[ "modules_main" ]
			local slotEffectRc		= UI.HudEditor.effectRcs[ "modules_slot" ]
			
			if modulesEffectRc and slotEffectRc then

				res = modulesEffectRc.rc:GetResolution()
				
				local slot1Pos	= modulesEffectRc.rc:GetObjPos( "missle_2" )
				local slot2Pos	= modulesEffectRc.rc:GetObjPos( "missle_3" )
				local slotSize 	= slotEffectRc.rc:GetObjSize( "self" )
				
				local space = slot2Pos.x - ( slot1Pos.x + slotSize.x )
				
				local NUM_SOTS = ai.SpaceShipModuleSlot.CPU_MOD_03 - ai.SpaceShipModuleSlot.ENGINE_MOD_01 + 1	-- 15 штук
				size.x = slotSize.x * NUM_SOTS + space * ( NUM_SOTS - 1 )
				size.y = slotSize.y
		
			else
				sys.log( "UI.HudEditor.HudModulesWnd_passiveModules.GetSize()[ERROR]: no effect modules_main or modules_slot" )
			end

			return size, res
		
		end
	},
	
	[ "ChatWnd" ] =
	{
		wnds = { "ChatWnd" },
		
		visible = true,
		
		posEffect =
		{
			effectName	= "chat_main",
			locator		= "chat",
		},
		
		sizeEffect =
		{
			effectName	= "chat_main",
			locator		= "chat",
			
			childEffect =
			{
				effectName	= "chat_work",
				locator		= "self",
			}
		},
	},

	[ "HudAdventureWnd" ] =
	{
		wnds = { "HudAdventureWnd" },
		
		visible = true,
		
		posEffect =
		{
			effectName	= "hud_main",
			locator		= "list",
		},
		
		sizeEffect =
		{
			effectName	= "gameplay_map_pve_quests_questsList",
			locator		= "self",
		}
	},
}

UI.HudEditor.hAnchors =
{
	LEFT	= 1, 
	RIGHT	= 2,
	CENTER	= 3,
}

UI.HudEditor.vAnchors =
{
	TOP		= 1,
	BOTTOM	= 2,
	CENTER	= 3,
}

UI.HudEditor.hudRes				= Vec2( 1280, 720 )
UI.HudEditor.defaultWndSize_abs	= Vec2( 100, 100 )

-- в системе координат 1024*768
UI.HudEditor.LEFT_ANCHOR_ZONE	= math.floor( 1024 / 3 )
UI.HudEditor.RIGHT_ANCHOR_ZONE	= math.floor( 1024 / 3 )
UI.HudEditor.TOP_ANCHOR_ZONE	= math.floor( 768 / 3 )
UI.HudEditor.BOTTOM_ANCHOR_ZONE	= math.floor( 768 / 3 )

UI.HudEditor.POS_PARAM_NAME		= "pos"
UI.HudEditor.SIZE_PARAM_NAME	= "size"
UI.HudEditor.VISIBLE_PARAM_NAME	= "visible"

UI.HudEditor.MAX_CONFIGS		= 4

-- ---------------------------------
-- vars
-- ---------------------------------

UI.HudEditor.changedData	= nil
UI.HudEditor.effectRcs		= {}	-- объекты UiResourceEffect ("дефы" эффектов)

-- ---------------------------------
-- work functions
-- ---------------------------------

--
function UI.HudEditor:GetParamInternal( wndName, paramName, paramsTable )

	local param = nil
	local bNeedDefault = false
	
	if type( paramsTable ) ~= "table" then
		return param, bNeedDefault
	end
	
	local curConfigId = self:GetCurConfig()
	local strCurConfigId = tostring( curConfigId )	-- в userData не получается записать числовой ключ; при перелогине он превращается в строковый
	
	local wndParams = nil
	
	if type( paramsTable.configs ) == "table" and type( paramsTable.configs[ strCurConfigId ] ) == "table" then
		if type( paramsTable.configs[ strCurConfigId ][ wndName ] ) == "table" then
			wndParams = paramsTable.configs[ strCurConfigId ][ wndName ]
		end
	end
	
	if wndParams then
		param = wndParams[ paramName ]
	end
	
	if type( param ) == "table" and param.hudEditor_default == true then
		param			= nil
		bNeedDefault	= true
	end
	
	return param, bNeedDefault
	
end


-- в базовом разрешении худа
function UI.HudEditor:GetDefaultWndPosAbs( wndName )

	local pos = Vec2( 0, 0 )
	
	
	local function fnGetPosRecursive( effectInfo, parentPos )
	
		local _pos = Vec2( 0, 0 )
	
		local effectRc = self.effectRcs[ effectInfo.effectName ]
		if effectRc then
			
			_pos = effectRc.rc:GetObjPos( effectInfo.locator )
			
			if effectInfo.childEffect then
				_pos = fnGetPosRecursive( effectInfo.childEffect, _pos )
			end
		
		else
			sys.log( "UI.HudEditor:GetDefaultWndPosAbs()[ERROR]: no effect %s", effectInfo.effectName )
		end
		
		return _pos + parentPos
	
	end

	
	local wndInfo = self.windowsInfo[ wndName ]
	if wndInfo then
	
		if wndInfo.posEffect then
			pos = fnGetPosRecursive( wndInfo.posEffect, Vec2( 0, 0 ) )
		else
			sys.log( "UI.HudEditor:GetDefaultWndPosAbs()[ERROR]: no pos data for wnd %s", wndName  )
		end
		
	else
		sys.log( "UI.HudEditor:GetDefaultWndPosAbs()[ERROR]: no info for wnd %s", wndName )
	end

	pos.x = UI:XToAbs( pos.x, true, self.hudRes )
	pos.y = UI:YToAbs( pos.y, true, self.hudRes )

	return pos

end


--
function UI.HudEditor:GetDefaultWndSizeAbs( wndName )

	local size	= UI:Vec2CopyStable( self.defaultWndSize_abs )
	local res	= self.hudRes
	
	local wndInfo = self.windowsInfo[ wndName ]
	if wndInfo then
	
		if wndInfo.GetSize then
		
			size, res = wndInfo.GetSize()
			
			size.x = UI:XToAbs( size.x, true, res )
			size.y = UI:YToAbs( size.y, true, res )
			
		elseif wndInfo.sizeEffect then
		
			local effectRc = self.effectRcs[ wndInfo.sizeEffect.effectName ]
			if effectRc then
			
				size	= effectRc.rc:GetObjSize( wndInfo.sizeEffect.locator )
				res		= effectRc.rc:GetResolution()
				
				size.x = UI:XToAbs( size.x, true, res )
				size.y = UI:YToAbs( size.y, true, res )
				
			else
				sys.log( "UI.HudEditor:GetDefaultWndSizeAbs()[ERROR]: no effect %s", wndInfo.sizeEffect.effectName )
			end
			
		else
			sys.log( "UI.HudEditor:GetDefaultWndSizeAbs()[ERROR]: no size data for wnd %s", wndName  )
		end
		
	else
		sys.log( "UI.HudEditor:GetDefaultWndSizeAbs()[ERROR]: no info for wnd %s", wndName )
	end

	return size, res
	
end


--
function UI.HudEditor:InitEffectRcs()
	
	if next( self.effectRcs ) then
		return
	end
	
	local function fnGetEffectRcRecursive( effectInfo )
	
		if not self.effectRcs[ effectInfo.effectName ] then
		
			local handlde = UI:GetResourceHandleByName( effectInfo.effectName, UI.RES_EFFECT )
			if handlde ~= UI.INVALID_RESOURCE_HANDLE then
				
				self.effectRcs[ effectInfo.effectName ] =
				{
					rc		= UI:GetResourceByHandle( handlde ),
					handlde	= handlde
				}
				
			else
				sys.log( "UI.HudEditor:InitEffectRcs()[ERROR]: cannot find effect %s", effectInfo.effectName )
			end
		
		end
		
		if effectInfo.childEffect then
			fnGetEffectRcRecursive( effectInfo.childEffect )
		end
	
	end
	
	for wndName, wndInfo in pairs( self.windowsInfo ) do
	
		if wndInfo.posEffect then
			fnGetEffectRcRecursive( wndInfo.posEffect )
		end
		
		if wndInfo.sizeEffect then
			fnGetEffectRcRecursive( wndInfo.sizeEffect )
		end
	
	end
	
end


--
function UI.HudEditor:ReleaseEffectRcs()
	
	for effectName, effectRc in pairs( self.effectRcs ) do
		UI:ReleaseResourceHandle( effectRc.handlde )
	end
	
	self.effectRcs = {}
	
end


-- ----------------------------------------
-- инициализация во время загрузки файла
-- ----------------------------------------
UI.HudEditor:Init()
-- ----------------------------------------