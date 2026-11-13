-- ----------------------------------------------------------------------------
--
-- Workfile: optionsdef.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: optionsdef.lua 5493 2011-12-29 14:06:37Z $
-- ----------------------------------------------------------------------------

-- TODO: хранить опции внутри сетов не по индексам, а по именам в качестве ключей

if UI.Options == nil then
	UI.Options = {}
end

UI.Options.NUM_SLIDER_STEPS = 100

UI.Options.hudOptionsInfo =
{
	onCircleMarksMode				= { userDataName	= "onCircleMarksMode",				profileName	= "onCircleMarksMode",				type = "number"		},
	hudArrowsAreaType				= { userDataName	= "hudArrowsAreaType",				profileName	= "hudArowsAreaType",				type = "number"		},	-- имена отличаютс€ - буквы r в arrows
	allowDamageDir					= { userDataName	= "allowDamageDir",					profileName	= "allowDamageDir",					type = "boolean"	},
	hudPlayerShipInfoAlpha			= { userDataName	= "hudPlayerShipInfoAlpha",			profileName	= "hudPlayerShipInfoAlpha",			type = "number"		},
	showIncomingStates				= { userDataName	= "showIncomingStates",				profileName	= "showIncomingStates",				type = "boolean"	},
	cursorTypes						= { userDataName	= "gameCursorType",					profileName	= "gameCursorType",					type = "number"		},
	cursorCrossTypes				= { userDataName	= "gameCursorCrossType",			profileName	= "gameCursorCrossType",			type = "number"		},
	cursorColors					= { userDataName	= "gameCursorColor",				profileName	= "gameCursorColor",				type = "number"		},
	predictionColors				= { userDataName	= "predictionColor",				profileName	= "predictionColor",				type = "number"		},
	adaptiveMarksSize				= { userDataName	= "adaptiveMarksSize",				profileName	= "adaptiveMarksSize",				type = "boolean"	},
	marksFadeOnDist					= { userDataName	= "marksFadeOnDist",				profileName	= "marksFadeOnDist",				type = "boolean"	},
	hideMarksFramesOutOfShot		= { userDataName	= "hideMarksFramesOutOfShot",		profileName	= "hideMarksFramesOutOfShot",		type = "boolean"	},
	marksTransparentBehindObstacle	= { userDataName	= "marksTransparentBehindObstacle",	profileName	= "marksTransparentBehindObstacle",	type = "boolean"	},
	vpHpAlways						= { userDataName	= "vpHpAlways", 					profileName	= "vpHpAlways", 					type = "boolean"	},
	showPredictionUnderMouse		= { userDataName	= "showPredictionUnderMouse",		profileName	= "showPredictionUnderMouse",		type = "boolean"	},
	scalableHealthBars				= { userDataName	= "scalableHealthBars",				profileName	= "scalableHealthBars",				type = "boolean"	},
	showGameplayInfo				= { userDataName	= "showGameplayInfo",				profileName	= "showGameplayInfo",				type = "boolean"	},
	showQuestTracker				= { userDataName	= "showQuestTracker",				profileName	= "showQuestTracker",				type = "boolean"	},
}

UI.Options.hudMarksOptionsInfo =
{
	name		= { userDataName = "isName",		profileName = "isName",		},
	role		= { userDataName = "isRole",		profileName = "isRole",		},
	specIco		= { userDataName = "isSpecIco",		profileName = "isSpecIco",	},
	rank		= { userDataName = "isRank",		profileName = "isTier"		},	-- отличаетс€
	shipName	= { userDataName = "isShipName",	profileName = "isShipName"	},
	hpShield	= { userDataName = "isHpShield",	profileName = "isHpShield",	},
	dist		= { userDataName = "isDist",		profileName = "isDist",		},
	frame		= { userDataName = "isFrame",		profileName = "isFrame",	},
}

-- --------------------------------
-- graphic presets
-- --------------------------------

UI.Options.graphicPresets =
{
	antialiasing =
	{   		
		quality2Choice	= { low = "0", medium = cvars.r_vendor ~= "INTEL" and "2xMSAA" or "0", high = "4xMSAA" },
		
		choice2Cvar =
		{
			r_msaa		= { [ "0" ] = 0, default = 1 },
			r_msaaMode	= {},
		},

		fValidChoices = function()
        	local choices = {}    
          	local modes = GetAntialiasingModes()
          	choices[ 1 ] = "0"
          	for idx, mode in pairs( modes ) do
          		choices[ idx + 1 ] = mode
          	end
        	return choices
		end,
	},

	filtration =
	{
		quality2Choice	= { low = 2, medium = 4, high = 8 },

		choice2Cvar	=
		{
			r_anisoLevel	= {},
		},

		fValidChoices = function()
        	local choices = {}

          	local maxLevel = GetMaxAnisoLevel()

          	choices[ 1 ] = 0
			local level = 2
			while true do
				if level > maxLevel then
					break
				end
				table.insert( choices, level )
				level = level * 2				
			end

        	return choices
		end,
	},

	shadows =
	{
		quality2Choice	= { low = "low", medium = "medium", high = "high" },

		choice2Cvar =
		{
			g_drawShadows = { low = 1, medium = 2, high = 3 },
		},

		--validChoices = { "low", "medium", "high" },

		fValidChoices = function()
        	local choices = { "low" }

          	local maxQuality = GetMaxShadowsQuality()

			if maxQuality > 1 then
				table.insert( choices, "medium" )
			end
			if maxQuality > 2 then
				table.insert( choices, "high" )
			end

        	return choices
		end,
	},

	shadersQuality =
	{
		quality2Choice	= { low = "low", medium = "high", high = "high" },

		choice2Cvar =
		{
			r_shadersQuality = { low = 0, high = 1 },
			g_softParticles = { low = 0, high = 1 },
			g_drawDepthTex = { low = 0, high = 1 },
		},

		validChoices = { "low", "high" }
	},

	textures =
	{
		quality2Choice	= { low = "low", medium = "medium", high = "high" },

		choice2Cvar =
		{
			r_texturesQuality = { low = 0, medium = 1, high = 3 },
		},

		fValidChoices = function()
        	local choices = { "low", "medium" }

          	local maxQuality = GetMaxTexturesQuality()

			if maxQuality >= 3 then
				table.insert( choices, "high" )
			end

        	return choices
		end,
	},

	lensflare =
	{
		quality2Choice	= { low = false, medium = false, high = false },

		choice2Cvar =
		{
			pe_lensFlare = { [false] = 0, [true] = 1 },
		},

		-- validChoices = { false, true }
		fValidChoices = function()
        	local choices = { false }

          	local maxQuality = GetMaxShadowsQuality()

			if maxQuality > 1 then
				table.insert( choices, true )
			end

        	return choices
		end,
	},


	dof =
	{
		quality2Choice	= { low = false, medium = true, high = true },

		choice2Cvar =
		{
			pe_dof = { [false] = 0, [true] = 1 },
		},

		validChoices = { false, true }
	},

	sharpen =
	{
		quality2Choice	= { low = false, medium = false, high = true },

		choice2Cvar =
		{
			pe_sharpen = { [false] = 0, [true] = 1 },
		},

		validChoices = { false, true }
	},

	auxEffects =
	{
		quality2Choice	= { low = "no", medium = "yes", high = "yes" },

		choice2Cvar =
		{
			cl_brokenParts			= { no = 0, yes = 1 },
			g_specialHitEffects		= { no = 0, yes = 1 },
			g_areaEffect2Enabled	= { no = 0, yes = 1 },
		},

		validChoices = { "no", "yes" }
	},
	
	materialEffects =
	{
		quality2Choice	= { low = false, medium = true, high = true },

		choice2Cvar =
		{
			g_enableMaterialEffects = { [false] = 0, [true] = 1 },
		},

		validChoices = { false, true }
	},
}

-- --------------------------------
-- option sets
-- --------------------------------

UI.Options.sets = {}

-- --------------------------------
-- video
-- --------------------------------

--
UI.Options.sets.Video =
{
	-- fullScreen
	{
		id			= "screenMode",
		strId		= "option_screenMode",

		value		=
		{
			list	= {}, -- fills the list in Init function
			default	= 2,
		},

		Init = function( self )				
			if IsFullscreenAvailable() then
				self.value.list = { 0, 1, 2 }
			else
				self.value.list = { 0, 2 }
			end
			self.value.cur = cvars.r_fullscreen
			self.bDisabled = cvars.g_oculusVR ~= 0
		end,

		Apply = function( self )
		
			-- ничего не делаетс€, переключение разрешени€ вместе с установкой флага r_fullscreen производитс€ опцией resolution
		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
    			local strIds =
    			{
    				[ 0 ]	= "option_screenMode_window",
    				[ 1 ]	= IsStrictedToOculusInFullscreen() and "option_screenMode_fullScreenOculus" or "option_screenMode_fullScreen",
    				[ 2 ]	= "option_screenMode_windowedFullScreen",
    			}

    			return UI:GetStringByName( strIds[ val ] )
			end

		end,

	},	

	-- resolution
	{
		id			= "resolution",
		strId		= "option_resolution",

		value		=
		{
			list	= {},				-- fills the list in Init function
			default	= { width = 1024, height = 768 },				
		},

		Init = function( self )

			self.value.list = {}
			self.bDisabled = cvars.g_oculusVR ~= 0

			local modes = _G.GetDisplayModes()

			-- выбрасываютс€ разрешени€, меньше определенного порога (по высоте)
			local MIN_HEIGHT = 720

			for idx = 1, #modes do
				local mode = modes[ idx ]
				if mode.height >= MIN_HEIGHT then
					table.insert( self.value.list, mode )
				end
			end

			self.value.cur = { width = cvars.r_3dwidth, height = cvars.r_3dheight }

		end,

		Apply = function( self )
			local fullScreenMode = cvars.r_fullscreen
			local fullScreenOption = UI.Options:GetOptionByName( "screenMode" )
			if fullScreenOption then
				fullScreenMode = fullScreenOption.value.cur
			end

		   	UI:SendUiEvent( UI.EV_SET_RESOLUTION, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_NEXT_FRAME, self.value.cur.width, self.value.cur.height, fullScreenMode, 0 )
		end,

		Val2Str = function( self, val )
			return string.format( "%d/%d", val.width, val.height )
		end,
	},

	-- vsync
	{
		id			= "vsync",
		strId		= "option_vsync",

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.r_vsync ~= 0
		end,

		Apply = function( self )
			cvars.r_vsync = self.value.cur and 1 or 0
		end
	},

	-- uiSize
	{
		id			= "uiSize",
		strId		= "option_uiSize",

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 0,
		},


		Init = function( self )
			self.value.cur = UI:Round( cvars.ui_scaleCf * UI.Options.NUM_SLIDER_STEPS )
			self.bDisabled = cvars.g_oculusVR ~= 0
		end,

		Apply = function( self )
			cvars.ui_scaleCf = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	}, 

	-- gamma
	{
		id			= "gamma",
		strId		= "option_gamma",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 50,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.r_gamma * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.r_gamma = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- fpsActive
	{
		id			= "fpsActive",
		strId		= "option_fpsActive",
		bImmediate	= true,

		MIN			= 30,
		MAX			= 230,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 50,
		},

		Cvar2Inner = function( self, val )

			if val == 0 then
				val = self.MAX
			else
				if val < self.MIN or val > self.MAX then
					sys.log( "cl_maxActiveFps has value (%f) that cannot be shown correctly in ui options; from %f to %f or 0 expected", val, self.MIN, self.MAX )
					val = UI:Clamp( val, self.MIN, self.MAX )
				end
			end

			return UI:Round( UI:Lerp( self.value.range.min, self.value.range.max, ( val - self.MIN ) / ( self.MAX - self.MIN ) ) )
		
		end,


		Inner2Cvar = function( self, val )

			val = UI:Lerp( self.MIN, self.MAX, ( val - self.value.range.min ) / ( self.value.range.max - self.value.range.min ) )

			if val == self.MAX then
				val = 0
			end

			return val

		end,
		

		Init = function( self )			

			self.value.cur = self:Cvar2Inner( cvars.cl_maxActiveFps )

		end,


		Apply = function( self )

			cvars.cl_maxActiveFps = self:Inner2Cvar( self.value.cur )

		end,
	},

	-- fpsInactive
	{
		id			= "fpsInactive",
		strId		= "option_fpsInactive",
		bImmediate	= true,

		MIN			= 12,
		MAX			= 62,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 50,
		},

		Cvar2Inner = function( self, val )

			if val < self.MIN or val > self.MAX then

				sys.log( "cl_maxActiveFps has value (%f) that cannot be shown correctly in ui options; from %f to %f expected", val, self.MIN, self.MAX )

    			if val == 0 then
    				val = self.MAX
    			else
    				val = UI:Clamp( val, self.MIN, self.MAX )
    			end

			end	
			
			return UI:Round( UI:Lerp( self.value.range.min, self.value.range.max, ( val - self.MIN ) / ( self.MAX - self.MIN ) ) )

		end,


		Inner2Cvar = function( self, val )

			return UI:Lerp( self.MIN, self.MAX, ( val - self.value.range.min ) / ( self.value.range.max - self.value.range.min ) )

		end,


		Init = function( self )
			
			self.value.cur = self:Cvar2Inner( cvars.cl_maxInactiveFps )

		end,


		Apply = function( self )

			cvars.cl_maxInactiveFps = self:Inner2Cvar( self.value.cur )

		end,
	}, 

	-- graphicQuality
	{
		id		= "graphicQuality",
		strId	= "option_graphicQuality",
		affectedOptions	= { "dof", "lensflare", "antialiasing", "filtration", "shadersQuality", "shadows", "textures", "sharpen", "auxEffects", "materialEffects" },

		value	=
		{
			-- "custom" val is added or not added in Init function
			list = {},
			default = "custom",			
		},

		Val2Str = function( self, val )

			local strIds =
			{
				low		= "option_graphicQuality_low",
				medium	= "option_graphicQuality_medium",
				high	= "option_graphicQuality_high",
			}

			local strId = strIds[ val ]				
			return strId and UI:GetStringByName( strId )

		end,

		Init = function( self )
			if not next( self.value.list ) then
				self:FillList()
			end
			self.value.cur = self:DetectQuality( true )
		end,

		OnMasterOptionChanged = function( self, masterOption )
			self.value.cur = self:DetectQuality( false )
		end,

		-- ------------------
		-- work
		-- ------------------

		--
		FillList = function( self )

			local qualities = { "low", "medium", "high" }

			for i = #qualities, 1, -1 do
				for optionName, optionT in pairs( UI.Options.graphicPresets ) do

					local choiceForQuality = optionT.quality2Choice[ qualities[ i ] ]

					local bFound = false
					for idx, choice in pairs( optionT.validChoices ) do
						if choice == choiceForQuality then
							bFound = true
							break
						end
					end

					if not bFound then
						qualities[ i ] = nil
						break
					end
				end
			end
			
			self.value.list = qualities

		end,
		
		--
		DetectQuality = function( self, bFromConfig )
			
			local candidateQualities = { low = true, medium = true, high = true }

			for optionName, optionT in pairs( UI.Options.graphicPresets ) do
				local option = not bFromConfig and UI.Options:GetOptionByName( optionName ) or nil

				for varName, valsByChoice in pairs( optionT.choice2Cvar ) do
					local curVal = bFromConfig and cvars[ varName ] or UI.Options:GetGraphicCvarValCurrent( option, varName )

					for quality in pairs( candidateQualities ) do							
						local valForQuality = UI.Options:GetGraphicCvarValForQuality( optionName, varName, quality )

						if curVal ~= valForQuality then
							candidateQualities[ quality ] = nil

							if not next( candidateQualities ) then
								return "custom"
							end
						end
					end
				end

			end	

			if #candidateQualities > 1 then
				sys.log( "UI.Options...DetectCurQuality()[WARNING] - there are several graphic quality's presets that are completely equal" )
			end

			local quality = next( candidateQualities )

			-- в конфиге могут быть прописаны значени€ настроек, которые не поддерживаютс€ на данном компьютере;
			-- в таком случае это понимаетс€ как "кастомна€" настройка, к не нельз€ потом будет вернутьс€
			local isPossibleQuality = false
			for valIdx, val in pairs( self.value.list ) do
				if val == quality then
					isPossibleQuality = true
					break
				end
			end

			if not isPossibleQuality then
				quality = "custom"
			end			

			return quality

		end,
	},

	-- videoAdvancedLabel
	{
		id		= "videoAdvancedLabel",
		strId	= "options_videoAdvanced",

		GetTooltipData = function( self )
			return nil
		end,
	},

	-- dof
	{
		id			= "dof",
		strId		= "option_dof",
		affectedOptions	= { "graphicQuality" },

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			if cvars.g_oculusVR == 0 then
				self.bDisabled = false
				self.value.cur = cvars.pe_dof ~= 0
			else
				self.bDisabled = true
				self.value.cur = false
			end
		end,

		OnMasterOptionChanged = function( self, masterOption )
			if cvars.g_oculusVR == 0 then 
				self.value.cur = UI.Options:DetectGraphicChoice( self, false )
			end
		end,

		Apply = function( self )
			if cvars.g_oculusVR == 0 then 
				UI.Options:ApplyGraphicChoice( self )
			end
		end

	},

	-- lensflare
	{
		id			= "lensflare",
		strId		= "option_lensflare",
		affectedOptions	= { "graphicQuality" },

		value		=
		{
			list	= {},
			default	= false,
		},

		Val2Str = function( self, val )
			if val == true then
    			return UI:GetStringByName( "Yes" )
			else
    			return UI:GetStringByName( "No" )
			end
		end, 

		Init = function( self )
			self.value.list = UI.Options.graphicPresets.lensflare.validChoices
			if cvars.g_oculusVR == 0 then
				self.bDisabled = false
				self.value.cur = cvars.pe_lensFlare ~= 0
			else
				self.bDisabled = true
				self.value.cur = false
			end
		end,

		OnMasterOptionChanged = function( self, masterOption )
			if cvars.g_oculusVR == 0 then 
				self.value.cur = UI.Options:DetectGraphicChoice( self, false )
			end
		end,

		Apply = function( self )
			if cvars.g_oculusVR == 0 then 
				UI.Options:ApplyGraphicChoice( self )
			end
		end

	},

	-- antialiasing
	{
		id		= "antialiasing",
		strId	= "option_antialiasing",
		affectedOptions	= { "graphicQuality" },
		
		value	=
		{
			list	= {},
			default	= 0
		},

		Val2Str = function( self, val )
			if val ~= "custom" then
				return val == "0" and UI:GetStringByName( "option_antialiasing_none" ) or val
			end
		end,

		Init = function( self )
			self.value.list = UI.Options.graphicPresets.antialiasing.validChoices
			self.value.cur = UI.Options:DetectGraphicChoice( self, true )
		end,

		OnMasterOptionChanged = function( self, masterOption )				
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
		end,

	},


	-- anisotropic filtration
	{
		id		= "filtration",
		strId	= "option_filtration",
		affectedOptions	= { "graphicQuality" },

		value	=
		{
			list	= {},
			default	= 0,
		},  

		Val2Str = function( self, val )
			if val ~= "custom" then
				return val == 0 and UI:GetStringByName( "option_filtration_none" ) or string.format( "x%d", val )
			end
		end,

		Init = function( self )
			self.value.list = UI.Options.graphicPresets.filtration.validChoices
			self.value.cur = UI.Options:DetectGraphicChoice( self, true )
		end,

		OnMasterOptionChanged = function( self, masterOption )				
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
			cvars.r_forceAniso = self.value.cur == 0 and 0 or 1
		end,		
	},

	-- shadows 
	{
		id		= "shadows",
		strId	= "option_shadows",
		affectedOptions	= { "graphicQuality" },

		value	=
		{
			list 	= {},
			default	= "low"
		},

		Val2Str = function( self, val )

			if val ~= "custom" then
    			local strIds =
    			{
    				low		= "option_graphicQuality_low",
					medium	= "option_graphicQuality_medium",
    				high	= "option_graphicQuality_high",
    			}

    			return UI:GetStringByName( strIds[ val ] )
			end

		end, 

		Init = function( self )
			self.value.list = UI.Options.graphicPresets.shadows.validChoices
			self.value.cur = UI.Options:DetectGraphicChoice( self, true )
		end,

		OnMasterOptionChanged = function( self, masterOption )				
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
		end,		
	},

	-- shaders quality
	{
		id		= "shadersQuality",
		strId	= "option_shaders",
		affectedOptions	= { "graphicQuality" },

		value	=
		{
			list 	= {},
			default	= "low"
		},

		Val2Str = function( self, val )

			if val ~= "custom" then
    			local strIds =
    			{
    				low		= "option_shaders_low",
    				high	= "option_shaders_high",
    			}

    			return UI:GetStringByName( strIds[ val ] )
			end

		end, 

		Init = function( self )
			self.value.list = UI.Options.graphicPresets.shadersQuality.validChoices
			self.value.cur = UI.Options:DetectGraphicChoice( self, true )
		end,

		OnMasterOptionChanged = function( self, masterOption )				
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
		end,		
	},  

	-- textures quality 
	{
		id		= "textures",
		strId	= "option_textures",
		affectedOptions	= { "graphicQuality" },

		value	=
		{
			list 	= {},
			default	= "low"
		},

		Val2Str = function( self, val )

			if val ~= "custom" then
    			local strIds =
    			{
    				low		= "option_graphicQuality_low",
					medium	= "option_graphicQuality_medium",
    				high	= "option_graphicQuality_high",
    			}

    			return UI:GetStringByName( strIds[ val ] )
			end

		end, 

		Init = function( self )
			self.value.list = UI.Options.graphicPresets.textures.validChoices
			self.value.cur = UI.Options:DetectGraphicChoice( self, true )
		end,

		OnMasterOptionChanged = function( self, masterOption )				
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
		end,		
	},

	-- sharpen
	{
		id			= "sharpen",
		strId		= "option_sharpen",
		affectedOptions	= { "graphicQuality" },

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.pe_sharpen ~= 0
		end,

		OnMasterOptionChanged = function( self, masterOption )
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
		end
	},

	-- auxEffects
	{
		id			= "auxEffects",
		strId		= "option_auxEffects",
		affectedOptions	= { "graphicQuality" },

		value	=
		{
			list 	= {},
			default	= "no"
		},

		Val2Str = function( self, val )

			if val ~= "custom" then
    			local strIds =
    			{
    				no		= "option_auxEffects_no",
    				yes		= "option_auxEffects_yes",
    			}

    			return UI:GetStringByName( strIds[ val ] )
			end

		end, 

		Init = function( self )
			self.value.list = UI.Options.graphicPresets.auxEffects.validChoices
			self.value.cur = UI.Options:DetectGraphicChoice( self, true )
		end,

		OnMasterOptionChanged = function( self, masterOption )				
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
		end,
	},
	
	-- materialEffects
	{
		id				= "materialEffects",
		strId			= "option_materialEffects",
		affectedOptions	= { "graphicQuality" },

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.g_enableMaterialEffects ~= 0
		end,

		OnMasterOptionChanged = function( self, masterOption )
			self.value.cur = UI.Options:DetectGraphicChoice( self, false )
		end,

		Apply = function( self )
			UI.Options:ApplyGraphicChoice( self )
		end
	},
	
	-- fishEye
	{
		id			= "fishEye",
		strId		= "option_fishEye",

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
		
			if cvars.g_oculusVR == 0 then
			
				self.bDisabled = false
				
				if UI.HangarWnd and UI.HangarWnd.w and UI.HangarWnd:IsOnScreen() then
					self.value.cur = UI.pe_fishEye_saved ~= 0
				else
					self.value.cur = cvars.pe_fishEye ~= 0
				end
				
			else
				self.bDisabled = true
				self.value.cur = false
			end
			
		end,

		Apply = function( self )
		
			if cvars.g_oculusVR == 0 then 
			
				if UI.HangarWnd and UI.HangarWnd.w and UI.HangarWnd:IsOnScreen() then
					UI.pe_fishEye_saved = self.value.cur and 1 or 0
				else
					cvars.pe_fishEye = self.value.cur and 1 or 0
				end
				
			end
			
		end

	},
	
}

-- --------------------------------
-- audio
-- --------------------------------

--
UI.Options.sets.Audio =
{
	-- masterVolume
	{
		id			= "masterVolume",
		strId		= "option_masterVolume",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 10,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.s_masterVolume * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.s_masterVolume = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- muteSound
	{
		id			= "muteSound",
		strId		= "option_muteSound",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.s_soundEnable ~= 0
		end,

		Apply = function( self )
			cvars.s_soundEnable = self.value.cur and 1 or 0
		end,
	},

	-- musicVolume
	{
		id			= "musicVolume",
		strId		= "option_musicVolume",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 10,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.s_musicVolume * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.s_musicVolume = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- enableMusic
	{
		id			= "enableMusic",
		strId		= "option_enableMusic",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.s_musicMute == 0
		end,

		Apply = function( self )
			cvars.s_musicMute = self.value.cur and 0 or 1
		end,
	},

	-- fxVolume
	{
		id			= "fxVolume",
		strId		= "option_fxVolume",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 10,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.s_fxVolume * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.s_fxVolume = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- voiceVolume
	{
		id			= "voiceVolume",
		strId		= "option_voiceVolume",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 10,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.s_voiceoverVolume * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.s_voiceoverVolume = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- playrsVoices
	{
		id			= "playrsVoices",
		strId		= "option_playrsVoices",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_sentencesTeammate ~= 0
		end,

		Apply = function( self )
			cvars.cl_sentencesTeammate = self.value.cur and 1 or 0
		end,
	},

	-- sentencesHangar
	{
		id			= "sentencesHangar",
		strId		= "option_sentencesHangar",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_sentencesHangar ~= 0
		end,

		Apply = function( self )
			cvars.cl_sentencesHangar = self.value.cur and 1 or 0
		end,
	},

	-- play in background
	{
		id			= "soundInBg",
		strId		= "option_soundInBg",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.s_bgSound ~= 0
		end,

		Apply = function( self )
			cvars.s_bgSound = self.value.cur and 1 or 0
		end,
	},
}

-- --------------------------------
-- game
-- --------------------------------

--
UI.Options.sets.Game =
{
	-- mouseSensitivity
	{
		id			= "mouseSensitivity",
		strId		= "option_mouseSensitivity",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 50,
		},

		MIN = UI.MOUSE_SENS_MIN,
		MAX	= UI.MOUSE_SENS_MAX,

		Init = function( self )

			local val = cvars.ship_mouseSens

			if val < 1 then
				val = 1 / val
				val = val - 1
				val	= -val
			else
				val = val - 1
			end

			self.value.cur = UI:Lerp( 0, UI.Options.NUM_SLIDER_STEPS, ( val - ( self.MIN + 1 ) ) / ( ( self.MAX - 1 ) - ( self.MIN + 1 ) ) )

		end,  

		Apply = function( self )

			local val = UI:Lerp( self.MIN + 1, self.MAX - 1, self.value.cur / UI.Options.NUM_SLIDER_STEPS )

			if val < 0 then
				val = -val
				val = val + 1
				val = 1 / val
			else
				val = val + 1
			end

			cvars.ship_mouseSens = val			

		end
	},
	
	-- mouseSensitivityTurret
	{
		id			= "mouseSensitivityTurret",
		strId		= "option_mouseSensitivityTurret",
		bImmediate	= true,

		MIN	= 0.1,
		MAX	= 0.75,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 0,
		},

		Init = function( self )

			local val = cvars.ship_mouseSensTurret
			local t = ( val - self.MIN ) / ( self.MAX - self.MIN )

			self.value.cur = UI:Round( UI.Options.NUM_SLIDER_STEPS * t )

		end,

		Apply = function( self )

			local t = self.value.cur / UI.Options.NUM_SLIDER_STEPS
			cvars.ship_mouseSensTurret = UI:Clamp( UI:Lerp( self.MIN, self.MAX, t ), self.MIN, self.MAX )

		end,
	},

	-- mouseInversion
	{
		id			= "mouseInversion",
		strId		= "option_mouseInversion",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.ship_mouseInvertY ~= 0
		end,

		Apply = function( self )
			cvars.ship_mouseInvertY = self.value.cur and 1 or 0
		end,
	},

	-- skipVideo
	{
		id			= "skipVideo",
		strId		= "option_skipVideo",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_skipSlideshow ~= 0
		end,

		Apply = function( self )
			cvars.cl_skipSlideshow = self.value.cur and 1 or 0
		end,
	},

	-- gameSpecialLabel
	{
		id		= "gameSpecialLabel",
		strId	= "options_gameSpecial",

		GetTooltipData = function( self )
			return nil
		end,

	},

	-- shipAutoRollUpIdle
	{
		id			= "shipAutoRollUpIdle",
		strId		= "option_shipAutoRollUpIdle",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.ship_ctrlIdleCheck ~= 0
		end,

		Apply = function( self )
			cvars.ship_ctrlIdleCheck = self.value.cur and 1 or 0
		end,
	},

	-- shipAutoLock
	{
		id			= "shipAutoLock",
		strId		= "option_shipAutoLock",
		bImmediate	= true,

		value		=
		{
			list	= { 0, 1, 2 },
			default	= 0,
		},

		Init = function( self )
			self.value.cur = cvars.ship_autoLock
		end,

		Apply = function( self )
			cvars.ship_autoLock = self.value.cur
		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
				local strId = string.format( "option_shipAutoLock_%d", val )
    			return UI:GetStringByName( strId )
			end

		end,
	},

	-- shipControlMode
	{
		id			= "shipControlMode",
		strId		= "option_shipControlMode",
		bImmediate	= true,

		value		=
		{
			list	= { 0, 1 },
			default	= 0,
		},

		Init = function( self )
			if cvars.g_oculusVR ~= 0 then
				self.value.cur = 0
				self.bDisabled = true
			else
				self.value.cur = cvars.ship_selectedControlMode
				self.bDisabled = false
			end
		end,

		Apply = function( self )
			cvars.ship_selectedControlMode = self.value.cur
		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
				local strId = string.format( "option_shipControlMode_%d", val )
    			return UI:GetStringByName( strId )
			end

		end,
	},

	-- shipTrail
	{
		id			= "shipTrail",
		strId		= "option_shipTrail",
		bImmediate	= true,

		value		=
		{
			list	= { 0, 1, 2 },
			default	= 0,
		},

		Init = function( self )
			self.value.cur = cvars.ship_engineTrail
		end,

		Apply = function( self )
			cvars.ship_engineTrail = self.value.cur
		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
				local strId = string.format( "option_shipTrail_%d", val )
    			return UI:GetStringByName( strId )
			end

		end,
	},

	-- defaultShipTooltipMode
	{
		id			= "defaultShipTooltipMode",
		strId		= "option_defaultShipTooltipMode",
		bImmediate	= true,

		value		=
		{
			list	= {},
			default	= UI.DEFAULT_SHIP_TOOLTIP_MODE,
		},

		Init = function( self )			

			self.value.list = {}

			for mode = 1, UI:GetTableLength( UI.shipTooltipModes ) do
				table.insert( self.value.list, mode )
			end

			local profile = _G.GetProfileTable()
			self.value.cur = profile.shipTooltipMode

			if self.value.cur == nil then
				self.value.cur = UI.DEFAULT_SHIP_TOOLTIP_MODE
			end			

		end,

		Apply = function( self )

			local profile = _G.GetProfileTable()
			profile.shipTooltipMode = self.value.cur

		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
				local modeName = UI:Val2Key( UI.shipTooltipModes, val )
				local strId = string.format( "option_defaultShipTooltipMode_%s", modeName )
    			return UI:GetStringByName( strId )
			end

		end,
	},

	-- cameraOffset
	{
		id			= "cameraOffset",
		strId		= "option_cameraOffset",
		bImmediate	= true,

		MIN	= -0.5,
		MAX	= 3,	

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 0,
		},

		Init = function( self )

			local val = cvars.cam_backOffsetAdditionalFactor
			local t = ( val - self.MIN ) / ( self.MAX - self.MIN )

			self.value.cur = UI:Round( UI.Options.NUM_SLIDER_STEPS * t )

		end,

		Apply = function( self )

			local t = self.value.cur / UI.Options.NUM_SLIDER_STEPS
			cvars.cam_backOffsetAdditionalFactor = UI:Clamp( UI:Lerp( self.MIN, self.MAX, t ), self.MIN, self.MAX )

		end,
	},

	-- cl_weaponAccurateAim
	{
		id			= "weaponAccurateAim",
		strId		= "option_weaponAccurateAim",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_weaponAccurateAim ~= 0
		end,

		Apply = function( self )
			cvars.cl_weaponAccurateAim = self.value.cur and 1 or 0
		end,
	},

	-- cl_weaponEtaPingPrediction
	{
		id			= "weaponEtaPingPrediction",
		strId		= "option_weaponEtaPingPrediction",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_weaponEtaPingPrediction ~= 0
		end,

		Apply = function( self )
			cvars.cl_weaponEtaPingPrediction = self.value.cur and 1 or 0
		end,
	},

	-- upgradeItemTooltipAllLevels
	{
		id			= "upgradeItemTooltipAllLevels",
		strId		= "option_upgradeItemTooltipAllLevels",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			local profile = _G.GetProfileTable()
			self.value.cur = profile.upgradeItemTooltipAllLevels

			if self.value.cur == nil then
				self.value.cur = UI.defaultUpgradeItemTooltipAllLevels
			end			

		end,

		Apply = function( self )

			local profile = _G.GetProfileTable()
			profile.upgradeItemTooltipAllLevels = self.value.cur

			UI:OnUpgradeItemTooltipAllLvelsOptionChanged()			

		end,
	},

	-- shipMouseSensFree
	{
		id			= "shipMouseSensFree",
		strId		= "option_shipMouseSensFree",
		bImmediate	= true,

		MIN	= 0.5,
		MAX	= 2,	

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 0,
		},

		Init = function( self )

			local val = cvars.ship_mouseSensFree
			local t = ( val - self.MIN ) / ( self.MAX - self.MIN )

			self.value.cur = UI:Round( UI.Options.NUM_SLIDER_STEPS * t )

		end,

		Apply = function( self )

			local t = self.value.cur / UI.Options.NUM_SLIDER_STEPS
			cvars.ship_mouseSensFree = UI:Clamp( UI:Lerp( self.MIN, self.MAX, t ), self.MIN, self.MAX )

		end,
	},

	-- worldViewAlternative  
	{
		id			= "worldViewAlternative",
		strId		= "option_worldViewAlternative",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )
			self.value.cur = cvars.cam_worldViewAlternative ~= 0
		end,

		Apply = function( self )
			cvars.cam_worldViewAlternative = self.value.cur and 1 or 0
		end,
	},

	-- boostToggle
	{
		id			= "boostToggle",
		strId		= "option_boostToggle",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )
			self.value.cur = cvars.ship_boostToggle ~= 0
		end,

		Apply = function( self )
			cvars.ship_boostToggle = self.value.cur and 1 or 0
		end,
	},

	-- keepMaxSpeed
	{
		id			= "keepMaxSpeed",
		strId		= "option_keepMaxSpeed",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )
			self.value.cur = cvars.ship_keepMaxSpeed ~= 0
		end,

		Apply = function( self )
			cvars.ship_keepMaxSpeed = self.value.cur and 1 or 0
		end,
	},

	-- itemRankMode
	{
		id			= "itemRankMode",
		strId		= "option_itemRankMode",
		bImmediate	= true,

		value		=
		{
			list	= {},
			default	= UI.defaultItemRankMode,
		},

		Init = function( self )			

			self.value.list = {}

			for mode = 1, UI:GetTableLength( UI.itemRankModes ) do
				table.insert( self.value.list, mode )
			end

			self.value.cur = UI:GetItemRankMode()

		end,

		Apply = function( self )

			local profile = _G.GetProfileTable()
			profile.itemRankMode = UI:Val2Key( UI.itemRankModes, self.value.cur )

			UI:OnItemRankModeOptionChanged()

		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
				local modeName = UI:Val2Key( UI.itemRankModes, val )
				local strId = string.format( "option_itemRankMode_%s", modeName )
    			return UI:GetStringByName( strId )
			end

		end,
	},
	
	-- showCyberSport
	{
		id			= "showCyberSport",
		strId		= "option_ishowCyberSport",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = UI:GetShowCyberSportMode()
		end,

		Apply = function( self )

			local profile = _G.GetProfileTable()
			profile.showCyberSport = self.value.cur

			UI:OnShowCyberSportOptionChanged()

		end,

	},
	
	-- deathRecapOpen
	{
		id			= "deathRecapOpen",
		strId		= "option_deathRecapOpen",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_deathRecapOpen ~= 0
		end,

		Apply = function( self )
			cvars.cl_deathRecapOpen = self.value.cur and 1 or 0
		end,
	},
	
	-- showServerTime
	{
		id			= "showServerTime",
		strId		= "option_showServerTime",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = UI:NeedShowServerTime()
		end,

		Apply = function( self )

			local profile = _G.GetProfileTable()
			profile.showServerTime = self.value.cur

			UI:OnShowServerTimeOptionChanged()

		end,

	},

	-- serverOptionsLabel
	{
		id		= "serverOptionsLabel",
		strId	= "options_serverOptionsLabel",

		GetTooltipData = function( self )
			return nil
		end,

		Init = function( self )
			self.bDisabled = not self:IsVisible()
		end,

		IsVisible = function( self )
			return _G.MasterServer_IsConnected()
		end
	},

	-- autoRepair
	{
		id			= "autoRepair",
		strId		= "options_autoRepair",
		bImmediate	= true,

		value =
		{
			list	= { true, false },
			default	= false,	
		},

		Init = function( self )

			self.bDisabled = not self:IsVisible()

			local DEFAULT_VAL = false
			self.value.cur = DEFAULT_VAL

			if not self.bDisabled then

				if UI.serverData.userData.autoRepair ~= nil then
					self.value.cur = UI:IsTrueEx( UI.serverData.userData.autoRepair )
				end

			end

		end,

		Apply = function( self )

			if not self.bDisabled then
				UI.serverData.userData.autoRepair = self.value.cur and 1 or 0
			else
				sys.log( "Option \"autoRepair\" is disabled; cannot apply" )
			end

		end,

		IsVisible = function( self )
			return _G.MasterServer_IsConnected()
		end
	}, 

	-- autoRefill
	{
		id			= "autoRefill",
		strId		= "options_autoRefill",
		bImmediate	= true,

		value =
		{
			list	= { true, false },
			default	= false,	
		},

		Init = function( self )

			self.bDisabled = not self:IsVisible()

			local DEFAULT_VAL = false
			self.value.cur = DEFAULT_VAL

			if not self.bDisabled then

				if UI.serverData.userData.autoRefill ~= nil then
					self.value.cur = UI:IsTrueEx( UI.serverData.userData.autoRefill )
				end

			end

		end,

		Apply = function( self )

			if not self.bDisabled then
				UI.serverData.userData.autoRefill = self.value.cur and 1 or 0
			else
				sys.log( "Option \"autoRefill\" is disabled; cannot apply" )
			end

		end,

		IsVisible = function( self )
			return _G.MasterServer_IsConnected()
		end
	},

	-- civilianFlag
	{
		id			= "civilianFlag",
		strId		= "option_civilianFlag",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )

			self.bDisabled = not self:IsVisible()

			if not self.bDisabled then
				self.value.cur = cvars.cl_desiredCivilianFlag ~= 0
			end

		end,

		Apply = function( self )

			if not self.bDisabled then
				cvars.cl_desiredCivilianFlag = self.value.cur and 1 or 0
			else
				sys.log( "Option \"civilianFlag\" is disabled; cannot apply" )
			end

		end,

		IsVisible = function( self )
--			return cvars.sv_civilianFlagLogic ~= 0
			return true		-- #0036742, комм.(0137921)
		end
	},

	-- battleServerRegion
	{
		id			= "battleServerRegion",
		strId		= "option_battleServerRegion",
		bImmediate	= true,

		value		=
		{
			list	= {},
			default	= -1,
		},

		Init = function( self )

			self.bDisabled = not self:IsVisible()

			if not self.bDisabled then

    			local serverList = {}

    			table.insert( serverList, MasterServer.AuthRegion.AR_UNKNOWN )
    			for k, v in pairs( MasterServer.AuthRegion ) do
    				if k ~= "AR_NUM" and k ~= "AR_UNKNOWN" then
    					table.insert( serverList, v )
    				end
    			end

    			self.value.list = serverList

    			self.value.cur = UI:GetGameRegion()

			end

		end,

		Apply = function( self )

			UI:SetGameRegion( self.value.cur  )

		end,

		Val2Str = function( self, val )

			local regionStr = UI:Val2Key( MasterServer.AuthRegion, val )
			local strId = "region_"..regionStr

    		return UI:GetStringByName( strId )

		end,

		IsVisible = function( self )
			return _G.MasterServer_IsConnected()
		end
	},
	
	-- deleteOvercapResources
	{
		id			= "deleteOvercapResources",
		strId		= "options_deleteOvercapResourcess",
		bImmediate	= true,

		value =
		{
			list	= { true, false },
			default	= false,	
		},

		Init = function( self )

			self.bDisabled = not self:IsVisible()

			local DEFAULT_VAL = false
			self.value.cur = DEFAULT_VAL

			if not self.bDisabled then

				if UI.serverData.userData.deleteOvercapResources ~= nil then
					self.value.cur = UI:IsTrueEx( UI.serverData.userData.deleteOvercapResources )
				end

			end

		end,

		Apply = function( self )

			if not self.bDisabled then
				UI.serverData.userData.deleteOvercapResources = self.value.cur and 1 or 0
			else
				sys.log( "Option \"deleteOvercapResources\" is disabled; cannot apply" )
			end

		end,

		IsVisible = function( self )
			return _G.MasterServer_IsConnected()
		end
	},
}

-- --------------------------------
-- hud
-- --------------------------------

--
UI.Options.sets.Hud =
{
}

UI.Options.sets.HudCommon =
{
	-- onCircleMarksMode
	{
		id			= "onCircleMarksMode",
		strId		= "option_onCircleMarksMode",
		bImmediate	= false,

		value		=
		{
			list	= {},
		},

		Init = function( self )

			self.value.list = {}

			for modeIdx, mode in ipairs( UI.hudOnCircleMarksModesOrder ) do
				table.insert( self.value.list, mode )
			end

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = UI:Val2Key( UI.hudOnCircleMarksModes, self.value.cur )
			--UI:SaveServerUserData()

			UI:OnHudOnCircleMarksModeOptionChanged()			

		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
				local modeName = UI:Val2Key( UI.hudOnCircleMarksModes, val )
				local strId = string.format( "option_onCircleMarksMode_%s", modeName )
    			return UI:GetStringByName( strId )
			end

		end,
	},

	-- hudArrowsAreaType
	{
		id			= "hudArrowsAreaType",
		strId		= "option_hudArrowsAreaType",
		bImmediate	= false,

		value		=
		{
			list	= {},
		},

		Init = function( self )

			self.value.list = {}

			for idx, areaType in ipairs( UI.hudArrowsAreaTypesOrder ) do
				table.insert( self.value.list, areaType )
			end

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )
			
			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = UI:Val2Key( UI.hudArrowsAreaTypes, self.value.cur )
			--UI:SaveServerUserData()

			UI:OnHudArrowsAreaTypeOptionChanged()			

		end,

		Val2Str = function( self, val )

			if val ~= "custom" then
				local typeName = UI:Val2Key( UI.hudArrowsAreaTypes, val )
				local strId = string.format( "option_hudArrowsAreaType_%s", typeName )
    			return UI:GetStringByName( strId )
			end

		end,
	},

	-- allowDamageDir
	{
		id			= "allowDamageDir",
		strId		= "option_allowDamageDir",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnAllowDamageDirOptionChanged()			

		end,
	},  

	-- hudPlayerShipInfoAlpha
	{
		id			= "hudPlayerShipInfoAlpha",
		strId		= "option_hudPlayerShipInfoAlpha",
		bImmediate	= false,

		MIN	= 0,
		MAX	= 255,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 0,
		},

		Init = function( self )

			local alpha = UI.Options:GetHudOptionVal( self.id )
			alpha = UI:Clamp( alpha, self.MIN, self.MAX )

			self.value.cur = UI:Lerp( 0, UI.Options.NUM_SLIDER_STEPS, ( alpha - self.MIN ) / ( self.MAX - self.MIN ) )

		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = UI:Lerp( self.MIN, self.MAX, self.value.cur / UI.Options.NUM_SLIDER_STEPS )
			--UI:SaveServerUserData()

			UI:OnHudPlayerShipInfoAlphaOptionChanged()			

		end,
	},   

	-- showIncomingStates
	{
		id			= "showIncomingStates",
		strId		= "option_showIncomingStates",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnShowIncomingStatesOptionChanged()			

		end,
	},    

	-- cursorTypes
	{
		id			= "cursorTypes",
		strId		= "option_cursorTypes",
		bImmediate	= false,

		value		=
		{
			list = {},
		},

		Init = function( self )

			self.value.list = {}

			for idx, info in ipairs( UI.gameCursorTypes ) do
				table.insert( self.value.list, idx )
			end

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			local typeId = self.value.cur
			local typeInfo = UI.gameCursorTypes[ typeId ]

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = typeInfo and typeInfo.name or ""
			--UI:SaveServerUserData()

			UI:OnGameCursorTypeOptionChanged()			

		end,

		Val2Str = function( self, val )

			local str = "error"

			local typeInfo = UI.gameCursorTypes[ val ]

			if typeInfo and typeInfo.name then
				local strId = string.format( "option_cursorTypes_%s", typeInfo.name )
				str = UI:GetStringByName( strId )
			end

			return str

		end,
	},    

	-- cursorCrossTypes
	{
		id			= "cursorCrossTypes",
		strId		= "option_cursorCrossTypes",
		bImmediate	= false,

		value		=
		{
			list = {},
		},

		Init = function( self )

			self.value.list = {}

			for idx, info in ipairs( UI.gameCursorCrossTypes ) do
				table.insert( self.value.list, idx )
			end

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			local typeId = self.value.cur
			local typeInfo = UI.gameCursorCrossTypes[ typeId ]

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = typeInfo and typeInfo.name or ""
			--UI:SaveServerUserData()

			UI:OnGameCursorCrossTypeOptionChanged()			

		end,

		Val2Str = function( self, val )

			local str = "error"

			local typeInfo = UI.gameCursorCrossTypes[ val ]

			if typeInfo and typeInfo.name then
				local strId = string.format( "option_cursorCrossTypes_%s", typeInfo.name )
				str = UI:GetStringByName( strId )
			end

			return str

		end,
	},     

	-- cursorColors
	{
		id			= "cursorColors",
		strId		= "option_cursorColors",
		bImmediate	= false,

		value		=
		{
			list = {},
		},

		Init = function( self )

			self.value.list = {}

			for idx, info in ipairs( UI.gameCursorColors ) do
				table.insert( self.value.list, idx )
			end

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			local colorId = self.value.cur
			local colorInfo = UI.gameCursorColors[ colorId ]

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = colorInfo and colorInfo.name or ""
			--UI:SaveServerUserData()

			UI:OnGameCursorColorOptionChanged()			

		end,

		Val2Str = function( self, val )

			local str = "error"

			local colorInfo = UI.gameCursorColors[ val ]

			if colorInfo and colorInfo.name then
				local strId = string.format( "option_cursorsColors_%s", colorInfo.name )
				str = UI:GetStringByName( strId )
			end

			return str

		end,
	}, 

	-- predictionColors
	{
		id			= "predictionColors",
		strId		= "option_predictionColors",
		bImmediate	= false,

		value		=
		{
			list = {},
		},

		Init = function( self )

			self.value.list = {}

			for idx, info in ipairs( UI.predictionColors ) do
				table.insert( self.value.list, idx )
			end

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			local colorId = self.value.cur
			local colorInfo = UI.predictionColors[ colorId ]

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = colorInfo and colorInfo.name or ""
			--UI:SaveServerUserData()

			UI:OnPredictionColorOptionChanged()			

		end,

		Val2Str = function( self, val )

			local str = "error"

			local colorInfo = UI.predictionColors[ val ]

			if colorInfo and colorInfo.name then
				local strId = string.format( "option_cursorsColors_%s", colorInfo.name )
				str = UI:GetStringByName( strId )
			end

			return str

		end,
	}, 

	-- highlightTarget
	-- эта опци€ единственна€ из всех опций худа не сохран€етс€ на сервер
	{
		id			= "highlightTarget",
		strId		= "option_highlightTarget",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_selectionHighlight ~= 0
		end,

		Apply = function( self )
			cvars.cl_selectionHighlight = self.value.cur and 1 or 0
		end,
	},

	-- adaptiveMarksSize
	{
		id			= "adaptiveMarksSize",
		strId		= "option_adaptiveMarksSize",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnAdaptiveMarksSizeOptionChanged()			

		end,
	},    

	-- marksFadeOnDist
	{
		id			= "marksFadeOnDist",
		strId		= "option_marksFadeOnDist",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnMarksFadeOnDistChanged()			

		end,
	}, 

	-- hideMarksFramesOutOfShot
	{
		id			= "hideMarksFramesOutOfShot",
		strId		= "option_hideMarksFramesOutOfShot",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnHideMarksFramesOutOfShotOptionChanged()			

		end,
	},
	
	-- marksTransparentBehindObstacle
	{
		id			= "marksTransparentBehindObstacle",
		strId		= "option_marksTransparentBehindObstacle",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnMarksTransparentBehindObstacleOptionChanged()

		end,
	}, 

	-- scalableHealthBars
	{
		id			= "scalableHealthBars",
		strId		= "option_scalableHealthBars",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnScalableHealthBarsOptionChanged()			

		end,

		GetTooltipData = function( self )

        	local tooltipData = {}

        	tooltipData.tooltipType = UI.tooltipTypes.TEXT_LARGE
        	tooltipData.caption		= UI:GetStringByName( self.strId )

        	tooltipData.text = UI:GetStringForPlatform( string.format( "%s_desc", self.strId ) )

			local tSubst =
			{
				small_step		= UI:Num2StrSeparatedBy3( UI.HudObjectMarkWnd_InsideShip_BarWnd.grades[ UI.HudObjectMarkWnd_InsideShip_BarWnd.modes.HP ][ 1 ].scaleStep ),
				large_step		= UI:Num2StrSeparatedBy3( UI.HudObjectMarkWnd_InsideShip_BarWnd.grades[ UI.HudObjectMarkWnd_InsideShip_BarWnd.modes.HP ][ 2 ].scaleStep ),
				val_threshold	= UI:Num2StrSeparatedBy3( UI.HudObjectMarkWnd_InsideShip_BarWnd.grades[ UI.HudObjectMarkWnd_InsideShip_BarWnd.modes.HP ][ 1 ].maxVal ),
			}

			tooltipData.text = string.gsub( tooltipData.text, "%$(.-)%$", tSubst )

			return tooltipData

		end,
	}, 

	-- vpHpAlways
	{
		id			= "vpHpAlways",
		strId		= "option_vpHpAlways",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )

		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnVpHpAlwaysOptionChanged()			

		end,
	},    

	-- showPredictionUnderMouse
	{
		id			= "showPredictionUnderMouse",
		strId		= "option_showPredictionUnderMouse",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnShowPredictionUnderMouseOptionChanged()			

		end,
	},    
	
	-- showGameplayInfo
	{
		id			= "showGameplayInfo",
		strId		= "option_showGameplayInfo",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnShowGameplayInfoOptionChanged()

		end,
	},
	
	-- showQuestTracker
	{
		id			= "showQuestTracker",
		strId		= "option_showQuestTracker",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudOptionVal( self.id )
			
		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			UI.serverData.userData.hudOptions[ UI.Options.hudOptionsInfo[ self.id ].userDataName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnShowQuestTrackeOptionChanged()

		end,
	},
}


--
function l_MakeHudMarkOption( modeName, optionName, bAlly )

	local defaultOptionName = bAlly and "marksElements_default_ally" or "marksElements_default"

	return
	{
		id				= string.format( "marksElements_%s_%s", modeName, optionName ),
		strId			= string.format( "options_marksElements_%s", optionName ),
		bImmediate		= false,
		affectedOptions	= { defaultOptionName },
		marksMode		= modeName,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )

			self.value.cur = UI.Options:GetHudMarkOptionVal( modeName, optionName )

		end,

		Apply = function( self )

			if type( UI.serverData.userData.hudOptions ) ~= "table" then
				UI.serverData.userData.hudOptions = {}
			end
			
			if type( UI.serverData.userData.hudOptions.marksElements ) ~= "table" then
				UI.serverData.userData.hudOptions.marksElements = {}
			end
			
			if type( UI.serverData.userData.hudOptions.marksElements[ modeName ] ) ~= "table" then
				UI.serverData.userData.hudOptions.marksElements[ modeName ] = {}
			end
			
			local fieldName = UI.Options.hudMarksOptionsInfo[ optionName ].userDataName
			UI.serverData.userData.hudOptions.marksElements[ modeName ][ fieldName ] = self.value.cur
			--UI:SaveServerUserData()

			UI:OnMarksElementsChanged()			

		end,

		OnMasterOptionChanged = function( self, masterOption )
			self:Init()
		end,
	}

end


--
function l_MakeHudMarkOptionsForMode( modeName, bAlly )

	local optionsSorted =
	{
		"name",
		"role",
		"specIco",
		"rank",
		"shipName",
		"hpShield",
		"dist",
		"frame",
	}

	local optionsSet = bAlly and UI.Options.sets.HudMarksAlly or UI.Options.sets.HudMarks

	for idx, optionName in ipairs( optionsSorted ) do
    	local option = l_MakeHudMarkOption( modeName, optionName, bAlly )
		table.insert( optionsSet, option )
	end

end


--
UI.Options.sets.HudMarks =
{
	-- marksElements_default
	{
		id			= "marksElements_default",
		strId		= "options_marksElements_default",
		bImmediate	= false,

		affectedOptions	=
		{
            "marksElements_brief_name",
            "marksElements_brief_role",
            "marksElements_brief_specIco",
            "marksElements_brief_rank",
            "marksElements_brief_shipName",
            "marksElements_brief_hpShield",
            "marksElements_brief_dist",
            "marksElements_brief_frame",

            "marksElements_full_name",
            "marksElements_full_role",
            "marksElements_full_specIco",
            "marksElements_full_rank",
            "marksElements_full_shipName",
            "marksElements_full_hpShield",
            "marksElements_full_dist",
            "marksElements_full_frame",

            "marksElements_lock_name",
            "marksElements_lock_role",
            "marksElements_lock_specIco",
            "marksElements_lock_rank",
            "marksElements_lock_shipName",
            "marksElements_lock_hpShield",
            "marksElements_lock_dist",
            "marksElements_lock_frame",
		},

		modes = { "brief", "full", "lock" },

		value =
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )			

			self.value.cur = not self:HasChanged()
			self.bDisabled = self.value.cur

		end,

		Apply = function( self )

			if self.value.cur == true then
			
				if type( UI.serverData.userData.hudOptions ) ~= "table" then
					UI.serverData.userData.hudOptions = {}
				end
				
				if type( UI.serverData.userData.hudOptions.marksElements ) ~= "table" then
					UI.serverData.userData.hudOptions.marksElements = {}
				end
				
				for modeIdx, modeName in pairs( self.modes ) do
				
					if type( UI.serverData.userData.hudOptions.marksElements[ modeName ] ) ~= "table" then
						UI.serverData.userData.hudOptions.marksElements[ modeName ] = {}
					end
					
					for optionName, optionInfo in pairs( UI.Options.hudMarksOptionsInfo ) do
					
						local fieldName = UI.Options.hudMarksOptionsInfo[ optionName ].userDataName
						UI.serverData.userData.hudOptions.marksElements[ modeName ][ fieldName ] = UI.defaultMarksElements[ modeName ][ optionName ]
						
					end
	
				end

				--UI:SaveServerUserData()
				UI:OnMarksElementsChanged()

			end

		end,

		HasChanged = function( self )

			local bHasChanged = false
			
			for modeIdx, modeName in pairs( self.modes ) do
			
				for optionName, optionInfo in pairs( UI.Options.hudMarksOptionsInfo ) do
				
					local val			= UI.Options:GetHudMarkOptionVal( modeName, optionName )
					local defaultVal	= UI.defaultMarksElements[ modeName ][ optionName ]
					
					if val ~= defaultVal then
						bHasChanged = true
						break
					end
				
				end
			
			end

			return bHasChanged

		end,

		OnMasterOptionChanged = function( self, masterOption )
			self:Init()
		end,

		OnValueChanged = function( self )
			self.bDisabled = self.value.cur
		end
	},  

	-- продолжение заполнени€ таблицы см. ниже ...
}


-- продолжение заполнени€ таблицы UI.Options.sets.HudMarks


-- мод "brief"

-- заголовок мода
table.insert( UI.Options.sets.HudMarks,
	{
		id		= "marksElements_brief_label",
		strId	= "options_marksElements_brief_label",
	}
)

-- опции мода
l_MakeHudMarkOptionsForMode( "brief", false )


-- мод "full"

-- заголовок мода
table.insert( UI.Options.sets.HudMarks,
	{
		id		= "marksElements_full_label",
		strId	= "options_marksElements_full_label",

		GetTooltipData = function( self )
			return nil
		end,
	}
)

-- опции мода
l_MakeHudMarkOptionsForMode( "full", false )


-- мод "lock"

-- заголовок мода
table.insert( UI.Options.sets.HudMarks,
	{
		id		= "marksElements_lock_label",
		strId	= "options_marksElements_lock_label",

		GetTooltipData = function( self )
			return nil
		end,
	}
)

-- опции мода
l_MakeHudMarkOptionsForMode( "lock", false )



--
UI.Options.sets.HudMarksAlly =
{
	-- marksElements_default_ally
	{
		id			= "marksElements_default_ally",
		strId		= "options_marksElements_default",
		bImmediate	= false,

		affectedOptions	=
		{
            "marksElements_brief_ally_name",
            "marksElements_brief_ally_role",
            "marksElements_brief_ally_specIco",
            "marksElements_brief_ally_rank",
            "marksElements_brief_ally_shipName",
            "marksElements_brief_ally_hpShield",
            "marksElements_brief_ally_dist",
            "marksElements_brief_ally_frame",

            "marksElements_full_ally_name",
            "marksElements_full_ally_role",
            "marksElements_full_ally_specIco",
            "marksElements_full_ally_rank",
            "marksElements_full_ally_shipName",
            "marksElements_full_ally_hpShield",
            "marksElements_full_ally_dist",
            "marksElements_full_ally_frame",

            "marksElements_lock_ally_name",
            "marksElements_lock_ally_role",
            "marksElements_lock_ally_specIco",
            "marksElements_lock_ally_rank",
            "marksElements_lock_ally_shipName",
            "marksElements_lock_ally_hpShield",
            "marksElements_lock_ally_dist",
            "marksElements_lock_ally_frame",
		},

		modes = { "brief_ally", "full_ally", "lock_ally" },

		value =
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )			

			self.value.cur = not self:HasChanged()
			self.bDisabled = self.value.cur

		end,

		Apply = function( self )

			if self.value.cur == true then
			
				if type( UI.serverData.userData.hudOptions ) ~= "table" then
					UI.serverData.userData.hudOptions = {}
				end
				
				if type( UI.serverData.userData.hudOptions.marksElements ) ~= "table" then
					UI.serverData.userData.hudOptions.marksElements = {}
				end
				
				for modeIdx, modeName in pairs( self.modes ) do
				
					if type( UI.serverData.userData.hudOptions.marksElements[ modeName ] ) ~= "table" then
						UI.serverData.userData.hudOptions.marksElements[ modeName ] = {}
					end
					
					for optionName, optionInfo in pairs( UI.Options.hudMarksOptionsInfo ) do
					
						local fieldName = UI.Options.hudMarksOptionsInfo[ optionName ].userDataName
						UI.serverData.userData.hudOptions.marksElements[ modeName ][ fieldName ] = UI.defaultMarksElements[ modeName ][ optionName ]
						
					end
	
				end
				
				--UI:SaveServerUserData()
				UI:OnMarksElementsChanged()

			end

		end,

		HasChanged = function( self )

			local bHasChanged = false

			for modeIdx, modeName in pairs( self.modes ) do
			
				for optionName, optionInfo in pairs( UI.Options.hudMarksOptionsInfo ) do
				
					local val			= UI.Options:GetHudMarkOptionVal( modeName, optionName )
					local defaultVal	= UI.defaultMarksElements[ modeName ][ optionName ]
					
					if val ~= defaultVal then
						bHasChanged = true
						break
					end
				
				end
			
			end

			return bHasChanged

		end,

		OnMasterOptionChanged = function( self, masterOption )
			self:Init()
		end,

		OnValueChanged = function( self )
			self.bDisabled = self.value.cur
		end
	},  

	-- продолжение заполнени€ таблицы см. ниже ...
}


-- продолжение заполнени€ таблицы UI.Options.sets.HudMarksAlly


-- мод "brief_ally"

-- заголовок мода
table.insert( UI.Options.sets.HudMarksAlly,
	{
		id		= "marksElements_brief_ally_label",
		strId	= "options_marksElements_brief_label",
	}
)

-- опции мода
l_MakeHudMarkOptionsForMode( "brief_ally", true )


-- мод "full_ally"

-- заголовок мода
table.insert( UI.Options.sets.HudMarksAlly,
	{
		id		= "marksElements_full_ally_label",
		strId	= "options_marksElements_full_label",

		GetTooltipData = function( self )
			return nil
		end,
	}
)

-- опции мода
l_MakeHudMarkOptionsForMode( "full_ally", true )


-- мод "lock_ally"

-- заголовок мода
table.insert( UI.Options.sets.HudMarksAlly,
	{
		id		= "marksElements_lock_ally_label",
		strId	= "options_marksElements_lock_label",

		GetTooltipData = function( self )
			return nil
		end,
	}
)

-- опции мода
l_MakeHudMarkOptionsForMode( "lock_ally", true )


-- --------------------------------
-- notifications
-- --------------------------------

--
function UI.Options:InitNotificationOptions()

	-- таблица групп может быть не регул€рным массисом

	local groups = {}
	for groupName, group in pairs( UI.Notifications.groups ) do
		table.insert( groups, group )
	end
	table.sort( groups )
	

	for idx = 1, #groups do

		group = groups[ idx ]

		local groupInfo = UI.Notifications.groupsInfo[ group ]
		if groupInfo and groupInfo.bShowInOptions then

    		local groupName = UI:Val2Key( UI.Notifications.groups, group )

    		local option = {}

    		option.notificationGroup	= group

    		option.id					= string.format( "ntf_%s", groupName )
    		option.strId				= string.format( "option_ntf_%s", groupName )
    		option.bImmediate			= false
    		
    		option.value =
    		{
    			list	= { true, false },
    			default	= true,
    		}

    		option.Init = function( self )
    			self.value.cur = UI.Notifications:IsGroupAllowed( self.notificationGroup )
    		end

    		option.Apply = function( self )
    			UI.Notifications:SetGroupAllowed( self.notificationGroup, self.value.cur, false )
    		end

    		table.insert( self.sets.Notifications, option )

		end

	end

end


UI.Options.sets.Notifications = {}
UI.Options:InitNotificationOptions()

-- --------------------------------
-- chat
-- --------------------------------

UI.Options.sets.Chat =
{
	-- chatGeneralInBattle
	{
		id			= "chatGeneralInBattle",
		strId		= "option_chatGeneralInBattle",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= true,
		},

		Init = function( self )
			self.value.cur = cvars.cl_chatIgnoreGeneralInBattle == 0
		end,

		Apply = function( self )
			cvars.cl_chatIgnoreGeneralInBattle = self.value.cur and 0 or 1
		end,
	},

	-- global language
	{
		id			= "chatGlobalLanguage",
		strId		= "option_chatGlobalLanguage",

		value		=
		{
			list	= UI.Chat:GetSupportedGlobalChannels(),
			default	= UI.Chat:GetGlobalChannelLanguage(),
		},

		Init = function( self )
			language = UI.Chat:GetGlobalChannelLanguage()
			-- try to set
			for k,v in pairs( UI.Chat:GetSupportedGlobalChannels() ) do
				if language == v then
					self.value.cur = v
					return
				end
			end
		end,

		Apply = function( self )
		local profile = _G.GetProfileTable()
			if self.value.cur ~= profile.chat_global_language then
				profile.chat_global_language = self.value.cur
				Profile:Save()
				UI.Chat:InitGlobalTab( true )
			end
		end,

		Val2Str = function( self, val )
			return UI:GetStringByName( "options_chat_globalLang_"..val )
		end,
	},

	-- battle log
	--[[{
		id			= "chatBattleLog",
		strId		= "option_chatBattleLog",

		value		=
		{
			list	= { 0, 1},
			default	= 1,
		},

		Init = function( self )
			self.value.cur = cvars.cl_combatLogInChat
		end,

		Apply = function( self )
			cvars.cl_combatLogInChat = self.value.cur
		end,

		Val2Str = function( self, val )
			return UI:GetStringByName( "options_chat_battleLog_"..val )
		end,
	},]]

	-- cl_tcsChatNotification
	{
		id			= "tcsChatNotification",
		strId		= "option_tcsChatNotification",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.cl_tcsChatNotification ~= 0
		end,

		Apply = function( self )
			cvars.cl_tcsChatNotification = self.value.cur and 1 or 0
		end,
	},      

	-- voicechatLabel
	{
		id		= "voicechatLabel",
		strId	= "options_voicechatLabel",

		GetTooltipData = function( self )
			return nil
		end,
	},

	-- voicechatEnable
	{
		id			= "voicechatEnable",
		strId		= "option_voicechatEnable",
		bImmediate	= true,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.voicechat_enable ~= 0
		end,

		Apply = function( self )
			cvars.voicechat_enable = self.value.cur and 1 or 0
		end,
	},      

	-- voicechatVolume 
	{
		id			= "voicechatVolume",
		strId		= "option_voicechatVolume",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 10,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.s_voicechatVolume * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.s_voicechatVolume  = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- voicechatRecVolume 
	{
		id			= "voicechatRecVolume",
		strId		= "option_voicechatRecVolume",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 10,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.s_recVolume * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.s_recVolume = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- voicechatPriorityAmp
	{
		id			= "voicechatPriorityAmp",
		strId		= "option_voicechatPriorityAmp",
		bImmediate	= true,

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 10,
		},

		Init = function( self )
			self.value.cur = UI:Round( cvars.s_voicechatPriorityAmp * UI.Options.NUM_SLIDER_STEPS )
		end,

		Apply = function( self )
			cvars.s_voicechatPriorityAmp = self.value.cur / UI.Options.NUM_SLIDER_STEPS
		end,
	},

	-- voicechatRecDevices
	{
		id			= "voicechatRecDevices",
		strId		= "option_voicechatRecDevices",
		bImmediate	= true,

		value		=
		{
			list	= {},
			default	= -1,
		},

		devices = {},

		Init = function( self )

			self:UpdateDevices()

		end,

		UpdateDevices = function( self )

			self.value.list = {}
			self.value.cur = -1

			self.devices = _G.RawSound_GetRecordingDevices()
			local numDevices = #self.devices

			if numDevices > 0 then
    			for deviceIdx = 1, numDevices do
    				table.insert( self.value.list, deviceIdx - 1 )
    			end
			else
				table.insert( self.value.list, -1 )
			end

			local curDeviceId = -1

			if numDevices > 0 then

    			curDeviceId = cvars.voicechat_recordDeviceId
    			if ( curDeviceId < 0 or curDeviceId >= numDevices ) then

					local DEFAULT_DEVICE_ID = 0

    				cvars.voicechat_recordDeviceId = DEFAULT_DEVICE_ID
					curDeviceId = DEFAULT_DEVICE_ID

    			end

				cvars.mictest_deviceId = curDeviceId

			end						

			self.value.cur = curDeviceId			

		end,

		Apply = function( self )

			if self.value.cur ~= -1 then
				cvars.voicechat_recordDeviceId = self.value.cur
				cvars.mictest_deviceId = self.value.cur
			end

		end,

		Val2Str = function( self, val )

			if val ~= -1 then
				return self.devices[ val + 1 ]

			else
    			return UI:GetStringByName( "option_voicechatRecDevices_noDevices" )
			end

		end,
	},

	-- voicechatRefreshRecDevices
	{
		id			= "voicechatRefreshRecDevices",
		strId		= "",
		bImmediate	= true,

		isBtn		= true,
		btnStrId	= "option_voicechatRefreshRecDevices",
	},

	-- voicechatRecTestPreview
	{
		id			= "voicechatRecTestPreview",
		strId		= "option_voicechatRecTestPreview",
		bImmediate	= true,
	},

	-- voicechatStartRecTest
	{
		id			= "voicechatStartRecTest",
		strId		= "",
		bImmediate	= true,

		isBtn		= true,
		btnStrId	= "option_voicechatStartRecTest",
	}
}


--
UI.Options.sets.Oculus =
{
	-- oculusEnable
	{
		id			= "oculusEnable",
		strId		= "option_oculusEnable",
		bImmediate	= false,

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.bDisabled = not _G.IsOculusAvailable()
			self.value.cur = cvars.g_oculusVR ~= 0
		end,

		Apply = function( self )
			UI:SendUiEvent( UI.EV_OCULUS_ENABLE, UI.INVALID_UI_HANDLE, UI.INVALID_UI_HANDLE, UI.DELIVER_NEXT_FRAME, self.value.cur and 1 or 0, 0, 0, 0 )
		end,

		GetTooltipData = function( self )

        	local tooltipData =
        	{
        		tooltipType = UI.tooltipTypes.TEXT_LARGE,
        		caption		= UI:GetStringByName( self.strId ),
        	}

			local strBaseColor	= UI:Color2Str( UI.TEXT_BASE_COLOR )
			local strSelColor	= UI:Color2Str( UI.TEXT_SEL_COLOR )

			local strBind = UI:GetBindKeysStr( "toggleOculus", true )
			strBind = string.format( "%s%s%s", strSelColor, strBind, strBaseColor )

        	tooltipData.text = UI:GetStringByName( string.format( "%s_desc", self.strId ) )
			tooltipData.text = string.gsub( tooltipData.text, "%$hot_key%$", strBind )
			tooltipData.text = string.format( "%s%s", strBaseColor, tooltipData.text )

			return tooltipData

		end,
	},      

	-- oculusInterfaceScale
	{
		id			= "oculusInterfaceScale",
		strId		= "option_oculusInterfaceScale",
		bImmediate	= false,

		MIN	= 0.7,
		MAX	= 1.3,	

		value		=
		{
			range	= { min = 0, max = UI.Options.NUM_SLIDER_STEPS, step = 1 },
			default	= 0,
		},

		Init = function( self )

			self.bDisabled = not _G.IsOculusAvailable()

			local val = cvars.g_oculusInterfaceScale
			local t = ( val - self.MIN ) / ( self.MAX - self.MIN )

			self.value.cur = UI:Round( UI.Options.NUM_SLIDER_STEPS * t )

		end,

		Apply = function( self )

			local t = self.value.cur / UI.Options.NUM_SLIDER_STEPS
			cvars.g_oculusInterfaceScale = UI:Clamp( UI:Lerp( self.MIN, self.MAX, t ), self.MIN, self.MAX )

		end,
	},

	-- oculusSuperSampling
	{
		id			= "oculusSuperSampling",
		strId		= "option_oculusSuperSampling",
		bImmediate	= false,

		MIN	= 0.49,
		MAX	= 2.0,

		value		=
		{
			range	= { min = 0, max = 16, step = 1 },
			default	= 0,
		},

		
		Cvar2Inner = function( self, val )

			if val < self.MIN or val > self.MAX then
				sys.log( "g_oculusSSfactor has value (%f) that cannot be shown correctly in ui options; from %f to %f or 0 expected", val, self.MIN, self.MAX )
				val = UI:Clamp( val, self.MIN, self.MAX )
			end

			return UI:Round( UI:Lerp( self.value.range.min, self.value.range.max, ( val - self.MIN ) / ( self.MAX - self.MIN ) ) )
		
		end,


		Inner2Cvar = function( self, val )

			val = UI:Lerp( self.MIN, self.MAX, ( val - self.value.range.min ) / ( self.value.range.max - self.value.range.min ) )

			val = math.ceil( val * 10 ) / 10
			
			return val

		end,

		Init = function( self )			

			self.bDisabled = not _G.IsOculusAvailable()
			self.value.cur = self:Cvar2Inner( cvars.g_oculusSSfactor )

		end,

		Apply = function( self )

			cvars.g_oculusSSfactor = self:Inner2Cvar( self.value.cur )
			-- ss affects to resolution
			UI.Options:RefreshOption( UI.Options:GetOptionByName( "resolution" ) )

		end,
	},

	-- twin window
	{
		id			= "twinWindow",
		strId		= "option_ShowTwinWindow",

		value		=
		{
			list	= { true, false },
			default	= false,
		},

		Init = function( self )
			self.value.cur = cvars.g_oculusShowTwinWindow ~= 0
		end,

		Apply = function( self )
			cvars.g_oculusShowTwinWindow = self.value.cur and 1 or 0
		end
	},

}

UI.Options.sets.Account = {}