-- ----------------------------------------------------------------------------
--
-- Workfile: Options.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: options.lua 3341 2011-06-03 13:11:32Z $
-- ----------------------------------------------------------------------------

sys.execscript( "ui/scripts/work/gameobjects/optionsdef.lua" )

if UI.Options == nil then
	UI.Options = {}
end


-- --------------------------------------------------------
-- initalization
-- --------------------------------------------------------

function UI.Options:Init()

    for optionSetName, optionSet in pairs( self.sets ) do
    	for idx, option in pairs( optionSet ) do
    		if option.value and option.value.range then
    			if not option.value.range.step then
    				option.value.range.step = 1
    			end
    		end
    	end
    end

-- TODO: check for duplicate option names


end
UI.Options:Init()

-- --------------------------------------------------------
-- interface functions
-- --------------------------------------------------------

--
function UI.Options:GetHudOptionVal( optionName )

	local val = nil
	
	if type( optionName ) ~= "string" then
		sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid type of the 1-st parameter (\"optionName\"); \"string\" expected, got \"%s\"", type( optionName ) )
		return val
	end
	
	local info = self.hudOptionsInfo[ optionName ]
	if not info then
		sys.log( "UI.Options:GetHudOptionVal()[ERROR]: cannot find saved val for option \"%s\", unhandled option", optionName )
		return val
	end
	
	-- сейчас опции хранятся на сервере в userData, но раньше они хранились в локальном профиле;
	-- чтобы игроки не заметили перехода, то сделано, что если нет сохраненных опций на сервере, то берутся старые из профиля;
	-- имя и тип хранимых данных могли поменяться, ниже эти особенности учитываются;
	-- если игрок играет без сервера, то берутся по умолчанию
	
	if _G.MasterServer_IsConnected() then
	
		if type( UI.serverData.userData.hudOptions ) == "table" then
			val = UI.serverData.userData.hudOptions[ info.userDataName ]
		end
		
		if val == nil then
			local profile = _G.GetProfileTable()
			val = profile[ info.profileName ]
		end
		
	end
	
	-- особые случаи
	
	if val ~= nil then
	
		if optionName == "onCircleMarksMode" then
		
			if type( val ) == "string" then
			
				local valName = val
				val = UI.hudOnCircleMarksModes[ valName ]
				
				if val == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: unhanlded saved val name \"%s\" for option \"%s\"", valName, optionName )
				end
				
			elseif type( val ) == "number" then
			
				if UI:Val2Key( UI.hudOnCircleMarksModes, val ) == "" then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: unhandled saved val %d for option \"%s\"", val, optionName )
					val = nil
				end
				
			end
			
		elseif optionName == "hudArrowsAreaType" then
		
			if type( val ) == "string" then
			
				local valName = val
				val = UI.hudArrowsAreaTypes[ valName ]
				
				if val == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val name \"%s\" for option \"%s\"", valName, optionName )
				end
				
			elseif type( val ) == "number" then
			
				if UI:Val2Key( UI.hudArrowsAreaTypes, val ) == "" then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val %d for option \"%s\"", val, optionName )
					val = nil
				end
				
			end
			
		elseif optionName == "cursorTypes" then
		
			if type( val ) == "string" then
			
				local valName = val
				val = nil

				for id, cursorInfo in pairs( UI.gameCursorTypes ) do
					if cursorInfo.name == valName then
						val = id
						break
					end
				end
				
				if val == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val name \"%s\" for option \"%s\"", valName, optionName )
				end
				
			elseif type( val ) == "number" then
			
				if UI.gameCursorTypes[ val ] == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val %d for option \"%s\"", val, optionName )
					val = nil
				end
				
			end
			
		elseif optionName == "cursorCrossTypes" then
			
			if type( val ) == "string" then
			
				local valName = val
				val = nil

				for id, cursorInfo in pairs( UI.gameCursorCrossTypes ) do
					if cursorInfo.name == valName then
						val = id
						break
					end
				end
				
				if val == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val name \"%s\" for option \"%s\"", valName, optionName )
				end
				
			elseif type( val ) == "number" then
			
				if UI.gameCursorCrossTypes[ val ] == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val %d for option \"%s\"", val, optionName )
					val = nil
				end
				
			end
			
		elseif optionName == "cursorColors" then
			
			if type( val ) == "string" then
			
				local valName = val
				val = nil

				for id, cursorInfo in pairs( UI.gameCursorColors ) do
					if cursorInfo.name == valName then
						val = id
						break
					end
				end
				
				if val == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val name \"%s\" for option \"%s\"", valName, optionName )
				end
				
			elseif type( val ) == "number" then
			
				if UI.gameCursorColors[ val ] == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val %d for option \"%s\"", val, optionName )
					val = nil
				end
				
			end
			
		elseif optionName == "predictionColors" then
			
			if type( val ) == "string" then
			
				local valName = val
				val = nil

				for id, cursorInfo in pairs( UI.predictionColors ) do
					if cursorInfo.name == valName then
						val = id
						break
					end
				end
				
				if val == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val name \"%s\" for option \"%s\"", valName, optionName )
				end
				
			elseif type( val ) == "number" then
			
				if UI.predictionColors[ val ] == nil then
					sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val %d for option \"%s\"", val, optionName )
					val = nil
				end
				
			end

		end
	
	end
	
	if val ~= nil then
	
		if info.type == "boolean" then
			if type( val ) == "number" then
				val = val ~= 0
			end
		end
		
		if type( val ) ~= info.type then
			sys.log( "UI.Options:GetHudOptionVal()[ERROR]: invalid saved val type for option \"%s\"; \"%s\" expected, got \"%s\"", optionName, info.type, type( val ) )
			val = nil
		end
	
	end
	
	if val == nil then
	
		val = UI.hudOptionsDefaultVals[ optionName ]
		
		if val == nil then
			sys.log( "UI.Options:GetHudOptionVal()[ERROR]: cannot find default val for option \"%s\"", optionName )
		end
	
	end
	
	return val
	
end


--
function UI.Options:GetHudMarkOptionVal( modeName, optionName )

	local val = nil
	
	if type( modeName ) ~= "string" then
		sys.log( "UI.Options:GetHudMarkOptionVal()[ERROR]: invalid type of the 1-st parameter (\"modeName\"); \"string\" expected, got \"%s\"", type( modeName ) )
		return val
	end
	
	if type( optionName ) ~= "string" then
		sys.log( "UI.Options:GetHudMarkOptionVal()[ERROR]: invalid type of the 2-nd parameter (\"optionName\"); \"string\" expected, got \"%s\"", type( optionName ) )
		return val
	end
	
	local info = self.hudMarksOptionsInfo[ optionName ]
	if not info then
		sys.log( "UI.Options:GetHudMarkOptionVal()[ERROR]: cannot find saved val for option \"%s\", unhandled option", optionName )
		return val
	end
	
	-- сейчас опции хранятся на сервере в userData, но раньше они хранились в локальном профиле;
	-- чтобы игроки не заметили перехода, то сделано, что если нет сохраненных опций на сервере, то берутся старые из профиля;
	-- имя хранимых данных могло поменяться, ниже эти особенности учитываются;
	-- если игрок играет без сервера, то берутся по умолчанию
	
	if _G.MasterServer_IsConnected() then
	
		if	type( UI.serverData.userData.hudOptions ) == "table"
			and type( UI.serverData.userData.hudOptions.marksElements ) == "table"
			and type( UI.serverData.userData.hudOptions.marksElements[ modeName ] ) == "table" then
				val = UI.serverData.userData.hudOptions.marksElements[ modeName ][ info.userDataName ]
		end
		
		if val == nil then
		
			local profile = _G.GetProfileTable()
			
			if	type( profile.marksElements ) == "table" 
				and type( profile.marksElements[ modeName ] ) == "table" then
					val = profile.marksElements[ modeName ][ info.profileName ]
			end
			
		end
		
	end
	
	if val ~= nil then
	
		if type( val ) == "number" then
			val = val ~= 0
		end
		
		if type( val ) ~= "boolean" then
			sys.log( "UI.Options:GetHudMarkOptionVal()[ERROR]: invalid saved val type for option \"%s\"; \"boolean\" expected, got \"%s\"", optionName, type( val ) )
			val = nil
		end
	
	end
	
	if val == nil then
	
		val = UI.defaultMarksElements[ modeName ][ optionName ]
		
		if val == nil then
			sys.log( "UI.Options:GetHudMarkOptionVal()[ERROR]: cannot find default val for option \"%s\"", optionName )
		end
	
	end
	
	return val
	
end


-- --------------------------------------------------------
-- const
-- --------------------------------------------------------

UI.Options.supportedAspects =
{
	{ name = "standard",	vals = { 3/4, 4/5 } },
  	{ name = "wide",		vals = { 9/16, 10/16 } },
}

UI.Options.graphicQualitySrc =
{
	CONFIG		= 1,
	CUSTOM		= 2,
	AVAILABLE	= 3,
}

UI.Options.aspectName2Val = {}
for idx, aspect in pairs( UI.Options.supportedAspects ) do
	UI.Options.aspectName2Val[ aspect.name ] = aspect.vals
end

-- --------------------------------------------------------
-- vars
-- --------------------------------------------------------

UI.Options.changedOptions			= {}
UI.Options.lastUpdatedOption		= nil
UI.Options.activeSets				= {}
UI.Options.bGraphicChoicesInited	= false

UI.Options.input =
{
	bXinput		= false,
	bJoystick	= false,
	bRucap		= false,
}

-- --------------------------------------------------------
-- work functions
-- --------------------------------------------------------


--
function UI.Options:InitOptions( setName )

	if ( setName == "Video" or setName == "VideoAdvanced" ) and not self.bGraphicChoicesInited then
		self:InitGraphicChoices()

--[[
	elseif setName == "Joystick" then
    	self.input.bXInput		= IsXInputConnected()
    	self.input.bJoystick	= IsJoystickAvailable()
]]

	elseif setName == "XInput" then
    	self.input.bXInput		= IsXInputConnected()

	elseif setName == "Rucap" then
    	self.input.bRucap		= cvars.rucap_driverInstalled ~= 0
	end

	table.insert( self.activeSets, setName )

	local set = self.sets[ setName ]
	if not set then
		sys.log( "UI.Options:InitOptions()[ERROR] - cannot find options' set '%s'", tostring( setName ) )
		return
	end

   	for idx, option in pairs( set ) do
   		self:InitOption( option )
   	end

end


--
function UI.Options:Reset()

	self.activeSets = {}
	self.changedOptions = {}
	self.lastUpdatedOption = nil

end


--
function UI.Options:InitOption( option )

	-- если уже есть выбранное пользователем текущее значение опции, то отображаем его,
	-- если нет - то значение по умолчанию;
	-- если значение по умолчанию явно не прописано, то отображаем первое значение из списка (или минимальное из пределов)

	if not option then
		sys.log( "UI.Options:InitOption()[ERROR]: nil option" )
		return
	end

	if option.value then
		option.value.cur = nil
	end

	if option.Init then
		option:Init()
	end

	if option.value and option.value.cur == nil then

    	if option.value.default ~= nil then
    		option.value.cur = option.value.default
    	elseif option.value.list then
       		option.value.cur = option.value.list[ 1 ]
       	elseif option.range then
       		option.value.cur = option.range.min
       	end

    	if option.value.cur == nil then
    		sys.log( "ERROR: UI.Options:InitOption - cannot init current value for option \"%s\"", option.id )
    	end
	end

	if option.value then
		option.value.original = option.value.cur
		self:OnOptionValueChanged( option )
	end

end


--
function UI.Options:GetOptionValAsStr( option, val )

	local errorStr = "error"

	if val == nil then
		return errorStr
	end

	local str = option.Val2Str and option:Val2Str( val )
	if str then
		return str
	end

  	if val == "custom" then
  		return UI:GetStringByName( "option_custom" )
  	end
	
	local valType = type( val )

	if valType == "number" then
		return tostring( val )

	elseif valType == "boolean" then
		return UI:GetStringByName( val and "option_yes" or "option_no" )

	elseif valType == "string" then
		return val

	else
		sys.log( "ERROR: UI.Options:GetOptionValAsStr - invalid option value type (for option \"%s\")", option.id )
		return errorStr
	end

end


--
function UI.Options:SetCustomCurVal( option, val, bSuppressHandlingAffected )

	if option.bDisabled then
		sys.log( "UI.Options:SetCustomCurVal()[ERROR] - cannot change the value of the option '%s'; the option is disabled", option.id )
		return false
	end

	if not option.value then
		sys.log( "UI.Options:SetCustomCurVal()[ERROR]: option \"%s\" has no value", option.id )
		return false
	end

	local bDisabled = option.bDisabled

	option.value.cur = val  

	if option.OnValueChanged then
		option:OnValueChanged()
	end

	self:OnOptionValueChanged( option )

	if option.bImmediate and not bDisabled then
		self:ApplyOption( option )
	end

	if not bSuppressHandlingAffected and option.affectedOptions then
   		for idx, affectedOptionId in pairs( option.affectedOptions ) do
			local affectedOption = self:GetOptionByName( affectedOptionId )
			if affectedOption then
				self:UpdateAffectedOption( affectedOption, option )
			end
		end
	end

	return true

end


--
function UI.Options:UpdateAffectedOption( affectedOption, masterOption )

	if affectedOption.OnMasterOptionChanged then
		affectedOption:OnMasterOptionChanged( masterOption )
		self:OnOptionValueChanged( affectedOption )
	else
		sys.log( "UI.Options:UpdateAffectedOption[ERROR] - cannot find method 'OnMasterOptionChanged' for option '%s'", tostring( affectedOption.id ) )
	end 

end


--
function UI.Options:ApplyChanges( bNotSaveProfile, sets )

	local bSetsCheck = sets ~= nil and next( sets ) ~= nil

	local changedOptionsInSets = {}
	for name, option in pairs( self.changedOptions ) do
		if not bSetsCheck or self:BelongsOptionToSets( name, sets ) then
			changedOptionsInSets[ name ] = option
		end
	end


	local bHasChangedOptions	= next( changedOptionsInSets ) ~= nil

	local bResolutionChanged	= false
	local bFullScreenChanged	= false
	local bUiSizeChanged		= false
	local bNotificationsChanged	= false
	local bOculusEnableChanged	= false
	local bServerOptionsChanged	= false	

	for name, option in pairs( changedOptionsInSets ) do

		if name == "resolution" then
			bResolutionChanged = true

		elseif name == "screenMode" then
			bFullScreenChanged = true

		elseif name == "uiSize" then
			bUiSizeChanged = true

		elseif name == "oculusEnable" then
			bOculusEnableChanged = true

		elseif not bNotificationsChanged and self:GetOptionSet( name ) == "Notifications" then
			bNotificationsChanged = true

		elseif name == "autoRepair" or name == "autoRefill" or name == "deleteOvercapResources" then
			bServerOptionsChanged = true
		end
		
		if self:BelongsOptionToSets( name, { "HudCommon", "HudMarks", "HudMarksAlly" } ) then
			bServerOptionsChanged = true
		end

	end

	for name, option in pairs( changedOptionsInSets ) do

		if not option.bImmediate then
			self:ApplyOption( option )
		end

		if option.value then
			option.value.original = option.value.cur
		end

		self.changedOptions[ name ] = nil

		if self.lastUpdatedOption and self.lastUpdatedOption.id == name then
			self.lastUpdatedOption = nil
		end

	end

	if bNotificationsChanged then
		if UI.Notifications then
			UI.Notifications:UpdateAllowedNotifications( false )
		end
	end

	if bFullScreenChanged and not bResolutionChanged then
		local resolutionOption = self:GetOptionByName( "resolution" )
		self:ApplyOption( resolutionOption )
	end

	if bUiSizeChanged and not bResolutionChanged and not bFullScreenChanged  and not bOculusEnableChanged then
		UI:SendUiEvent( UI.EV_RELOAD_RESOURCES, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_NEXT_FRAME, 0, 0, 0, 0 )
	end

	if not ( bResolutionChanged or bFullScreenChanged ) and not bOculusEnableChanged and not bNotSaveProfile and bHasChangedOptions then
		Profile:Save()
	end

	if bServerOptionsChanged then
		UI:SaveServerUserData()
	end

end


--
function UI.Options:ApplyOption( option )

   	if option.Apply then
	   	option:Apply()
	end

end


--
function UI.Options:CancelChanges()

	for optionId, option in pairs( self.changedOptions ) do
		self:CancelOptionChanges( option )
	end

end


--
function UI.Options:CancelOptionChanges( option )

	if option.value then
		self:SetCustomCurVal( option, option.value.original, true )
	end

end


--
function UI.Options:Refresh()

	for setIdx, setName in pairs( self.activeSets ) do
		local set = self.sets[ setName ]
		for optionIdx, option in pairs( set ) do
			self:RefreshOption( option )
		end
	end

end


--
function UI.Options:RefreshOption( option )

	self:InitOption( option )

end


function UI.Options:SetCustomCurValues( curVals )

	for idx, valDef in pairs( curVals ) do	
		local option = self:GetOptionByName( valDef.id )
		if option then
			self:SetCustomCurVal( option, valDef.val )
		end
	end

end


--
function UI.Options:GetCustomCurValues()

	local curVals = {}

	for setIdx, setName in pairs( self.activeSets ) do
		local set = self.sets[ setName ]
		for idx, option in pairs( set ) do
			table.insert( curVals, { id = option.id, val = option.value and option.value.cur } )
		end
	end

	return curVals

end


--
function UI.Options:IsChanged( sets )

	local bSetsCheck = sets ~= nil and next( sets ) ~= nil

	local changedOptionsInSets = {}
	for name, option in pairs( self.changedOptions ) do
		if not bSetsCheck or self:BelongsOptionToSets( name, sets ) then
			changedOptionsInSets[ name ] = option
		end
	end

	return next( changedOptionsInSets ) ~= nil

end


--
function UI.Options:IsOptionChanged( optionName )

	return self.changedOptions[ optionName ] and true or false

end


--
function UI.Options:IsGraphicFeaturesRestricted()
	
	local gqOption = self:GetOptionByName( "graphicQuality" )
	local qualities = { "low", "medium", "high" }

	for i = #qualities, 1, -1 do
		local quality = qualities[ i ]
		local bFound = false
		for idx, val in pairs( gqOption.value.list ) do
			if val == quality then
				bFound = true
				break
			end
		end

		if not bFound then
			return true
		end
	end

	return false

end


--
function UI.Options:GetOptionByName( optionName )

	for setName, set in pairs( self.sets ) do
    	for idx, option in pairs( set ) do
    		if option.id == optionName then
    			return option
    		end
    	end
	end

end


--
function UI.Options:GetGraphicCvarValCurrent( option, cvarName )	

--	local choice = self:ExtractActualValFromDef( option.value.cur )
	local choice = option.value.cur

	if choice == "custom" then
		return cvars[ cvarName ]
	else
		return self:GetGraphicCvarValByChoice( option.id, cvarName, choice )
	end


end


--
function UI.Options:GetGraphicCvarValForQuality( optionName, cvarName, quality )

	local choice = self.graphicPresets[ optionName ].quality2Choice[ quality ]

	if choice ~= nil then
		return self:GetGraphicCvarValByChoice( optionName, cvarName, choice )
	end
							
end


--
function UI.Options:GetGraphicCvarValByChoice( optionName, cvarName, choice )

	local presets = self.graphicPresets[ optionName ].choice2Cvar[ cvarName ]

   	if next( presets ) ~= nil then
   		return presets[ choice ] or presets.default
   	else
   		return choice
   	end

end


--
function UI.Options:DetectGraphicChoice( option, bFromConfig )

   	if bFromConfig then

		local candidateChoices = {}
		for idx, choice in pairs( option.value.list ) do
			candidateChoices[ choice ] = true
		end		

   		for varName, valsByChoice in pairs( self.graphicPresets[ option.id ].choice2Cvar ) do
   			local curVal = cvars[ varName ]

   			for choice in pairs( candidateChoices ) do							
   				local valForChoice = self:GetGraphicCvarValByChoice( option.id, varName, choice )

   				if curVal ~= valForChoice then
   					candidateChoices[ choice ] = nil

   					if not next( candidateChoices ) then
   						return "custom"
   					end
   				end
   			end
   		end

		if UI:GetTableLength( candidateChoices ) > 1 then
			sys.log( "UI.Options:DetectGraphicChoice()[WARNING] - there are several optioт choices for option '%s' that correspond to equal config values", option.id )
		end
		return next( candidateChoices )

   	else

   		local quality = self:GetOptionByName( "graphicQuality" ).value.cur
   		if quality ~= "custom"  then
   			return self.graphicPresets[ option.id ].quality2Choice[ quality ]
   		else
   			return option.value.cur
   		end

   	end

end


--
function UI.Options:ApplyGraphicChoice( option )

   	for cvarName, vals in pairs( self.graphicPresets[ option.id ].choice2Cvar ) do
   		cvars[ cvarName ] = self:GetGraphicCvarValCurrent( option, cvarName )
   	end

end


--
function UI.Options:AddCustomChoiceToValueList( list )

	for idx, valDef in pairs( list ) do
--		if self:ExtractActualValFromDef( valDef ) == "custom" then
		if valDef == "custom" then
			return
		end
	end

	table.insert( list, "custom" )

end


--
function UI.Options:RemoveCustomChoiceFromValueList( list )

	for idx, valDef in pairs( list ) do
--		if self:ExtractActualValFromDef( valDef ) == "custom" then
		if valDef == "custom" then
			list[ idx ] = nil
			return
		end
	end

end


--
function UI.Options:UpdateCustomChoiceInValueList( option )

	if not option.value or not option.value.list then
		return
	end

	if option.value.cur == "custom" then
		self:AddCustomChoiceToValueList( option.value.list )
	else
		self:RemoveCustomChoiceFromValueList( option.value.list )
	end

end


--
function UI.Options:GetNextVal( option, delta )

	if option.value == nil or option.value.cur == nil then
		return nil
	end

	local curPos = self:GetValPos( option, option.value.cur )
	if curPos == -1 then
		return nil
	end

	-- в случае с range pos тожет иметь дробное значение, если
	-- значение находится между шагами
	if option.value.range and math.fmod( curPos, option.value.range.step ) ~= 0 then
		curPos = delta > 0 and math.floor( curPos ) or math.ceil( curPos )
	end

	return self:GetValByPos( option, curPos + delta )

end



function UI.Options:GetValPos( option, val )

	if not option.value then
		return -1
	end

	if option.value.list then

		if type( val ) == "table" then

    		for valIdx, valInList in pairs( option.value.list ) do

				local bEqual = true
				for fieldKey, fieldVal in pairs( valInList ) do
					if fieldVal ~= val[ fieldKey ] then
						bEqual = false
						break
					end
				end

				if bEqual then
					return valIdx
				end

    		end

		else
    		for i, v in pairs( option.value.list ) do
    			if v == val then
    				return i
    			end
    		end
		end

	elseif option.value.range then

		if type( val ) ~= "table" then

    		local vmin = option.value.range.min
    		local vmax = option.value.range.max

    		if val < vmin or ( vmax and val > vmax ) then
    			return -1
    		end

    		return ( val - vmin ) / option.value.range.step + 1

		else
			sys.log( "UI.Options:GetValPos()[ERROR]: cannot compare table values" )
		end

	end	

	return -1

end


--
function UI.Options:GetValByPos( option, pos )

	if not option.value then
		return nil

	elseif option.value.list then
	    return option.value.list[ pos ]
		
	elseif option.value.range then
		local vmin = option.value.range.min
		local vmax = option.value.range.max

		local v = vmin + ( pos - 1 ) * option.value.range.step 
		return ( v >= vmin and ( not vmax or v <= vmax ) ) and v or nil
	end

end


--
function UI.Options:OnOptionValueChanged( option )

	if not option.value then
		return
	end

	if option.value.cur ~= option.value.original then
		self.changedOptions[ option.id ] = option
	else
		self.changedOptions[ option.id ] = nil
	end

	self:UpdateCustomChoiceInValueList( option )

   	self.lastUpdatedOption = option
   	UI:SendUiEvent( UI.EV_OPTIONS_CHANGED, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_IMMEDIATE, 0, 0, 0, 0 )
	self.lastUpdatedOption = nil

end


--
function UI.Options:SaveUiState()

	UI.store.Options = 
	{
		sets					= self.sets,
		changedOptions			= self.changedOptions,
		lastUpdatedOption		= self.lastUpdatedOption,
		activeSets				= self.activeSets,
		graphicPresets			= self.graphicPresets,
		bGraphicChoicesInited	= self.bGraphicChoicesInited,
	}

end


--
function UI.Options:RestoreUiState()

	if UI.store.Options then
		self.sets					= UI.store.Options.sets				
		self.changedOptions     	= UI.store.Options.changedOptions		
		self.lastUpdatedOption  	= UI.store.Options.lastUpdatedOption	
		self.activeSets        		= UI.store.Options.activeSets			
		self.graphicPresets			= UI.store.Options.graphicPresets
		self.bGraphicChoicesInited	= UI.store.Options.bGraphicChoicesInited

		UI.store.Options = nil
	end

end


--
function UI.Options:F_OnEventSetResolution( hSender, iParam0, iParam1, fParam0, fParam1 )

	sys.concmd( "s_pauseGroup 1 1" )
    sys.concmd( string.format( "resolution %d %d %d", iParam0, iParam1, fParam0 ) )
	sys.concmd( "s_pauseGroup 1 0" ) 

	local bResolutionActive = false

	for idx, setName in pairs( self.activeSets ) do
		if setName == "Video" or setName == "VideoAdvanced" then
			bResolutionActive = true
			break
		end
	end	

	if not bResolutionActive then
		return
	end

	self:RefreshOption( self:GetOptionByName( "resolution" ) )
	self:RefreshOption( self:GetOptionByName( "screenMode" ) )

	Profile:Save()

end


--
function UI.Options:F_OnEventOculusEnable( hSender, iParam0, iParam1, fParam0, fParam1 )

	cvars.g_oculusVR = iParam0

	local bOculusOptionsActive = false

	for idx, setName in pairs( self.activeSets ) do
		if setName == "Oculus" then
			bOculusOptionsActive = true
			break
		end
	end	

	if not bOculusOptionsActive then
		return
	end

	self:RefreshOption( self:GetOptionByName( "oculusEnable" ) )

	Profile:Save()
	
end


--
function UI.Options:InitGraphicChoices()

	-- определяем допустимые значения графических настроек
	for optionName, t in pairs( self.graphicPresets ) do
		if t.fValidChoices  then
			t.validChoices = t.fValidChoices()
		end

	end

	self.bGraphicChoicesInited = true

end  


--
function UI.Options:UpdateDrawDepthTex()

   	if cvars.pe_heatHaze == 0 --[[ and cvars.pe_dofEnabled == 0 ]] and cvars.g_softParticles == 0 --[[and cvars.pe_motionBlur == 0]] and cvars.g_drawDepthTex == 1 then
   		cvars.g_drawDepthTex = 0

   	elseif cvars.g_drawDepthTex == 0 then
   		cvars.g_drawDepthTex = 1

	end

end


--
function UI.Options:DisplayMode2Str( width, height )

	return string.format( "%dx%d", width, height )

end


--
function UI.Options:RestoreSetDefault( setName )

	local set = self.sets[ setName ]
	if not set then
		sys.log( "UI.Options:RestoreSetDefault()[ERROR]: cannot find set with name \"%s\"", tostring( setName ) )
		return
	end

	for optionIdx, option in pairs( set ) do

		if option and option.value and not option.bDisabled then
			if option.value.default == nil then
				sys.log( "UI.Options:RestoreSetDefault()[ERROR]: cannot find default value for option \"%s\"", option.id )
			else
				self:SetCustomCurVal( option, option.value.default )
			end

			if self.changedOptions[ option.id ] then
				self.changedOptions[ option.id ] = nil
			end
		end		

	end
end


--
function UI.Options:GetOptionSet( optionName )

	for setName, setInfo in pairs( self.sets ) do
		for optionId, optionInfo in pairs( setInfo ) do
			if optionInfo.id == optionName then
				return setName
			end
		end
	end

	return ""	

end


--
function UI.Options:BelongsOptionToSets( optionName, sets )

	if not optionName or not sets then
		return false
	end

	local optionSet = self:GetOptionSet( optionName )

	for setIdx, setName in pairs( sets ) do
		if optionSet == setName then
			return true
		end
	end

	return false

end