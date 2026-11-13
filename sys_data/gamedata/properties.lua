
-- descriptions of entities properties
-- used solely by Editor and ScriptDebugger
EntityProps = {}

-- these should match to those in DamageTypes.h
DamageTypes =
{
	"Generic",
	"Kinetic",
	"EMP",
	"Thermal",
}

-- these should match to those in SoundMisc.h
SoundPlaybackFlags =
{
	"Simple sound (most UI and stereo sounds), no panning or 3d distance attenuation applied",
	"Apply panning calculation",
	"Apply 3d distance attenuation",
	"Normal 3d sounds (both panning/distance attenuation applied)",
}

-- these should match to those in in TagPoint.h
TagPointTypes =
{
	"None",
	"SitShelter",
	"StandShelter",
	"InvestigateHere",
	"PatrolPosition",
}

-- default visual props for visible entities w/ model
VisualEntityDefaultProps = {
	{ [ "Max view distance" ] = { key = 'maxViewDist', type = 'float', desc = [=[Entity maximum drawing distance in meters 
(if bellow or equal to 0, then entity drawing does not depend on distance to camera]=] } },
}

-- default props for logic entities
LogicEntityDefaultProps = {
	{ Position        =       { key = 'pos', type = 'vec3', desc = 'World position' } },
	{ Rotation        =       { key = 'rot', type = 'quat', desc = 'World orientation' } },
	{ [ "Relationship group" ] = { key = 'relationshipGroup', type = 'int', desc = 'Relationship group' } },
}

-- default props for logic entities (parenting)
LogicEntityDefaultPropsParenting = {
	{ Position        =       { key = 'pos', type = 'vec3', desc = 'World position' } },
	{ Rotation        =       { key = 'rot', type = 'quat', desc = 'World orientation' } },
	{ [ "Relationship group" ] = { key = 'relationshipGroup', type = 'int', desc = 'Relationship group' } },
	{ BindTo          =       { key = "bindTo", type = "string", desc = "Parent binding description in form 'parent_name:joint_name' (empty if no parent)" } },
}

-- default props for logic entities (removed rotation)
LogicEntityDefaultPropsNoRotation = {
	{ Position        =       { key = 'pos', type = 'vec3', desc = 'World position' } },
	{ [ "Relationship group" ] = { key = 'relationshipGroup', type = 'int', desc = 'Relationship group' } },
}

-- default props for logic entities (parenting, removed rotation)
LogicEntityDefaultPropsNoRotationParenting = {
	{ Position        =       { key = 'pos', type = 'vec3', desc = 'World position' } },
	{ [ "Relationship group" ] = { key = 'relationshipGroup', type = 'int', desc = 'Relationship group' } },
	{ BindTo          =       { key = "bindTo", type = "string", desc = "Parent binding description in form 'parent_name:joint_name' (empty if no parent)" } },
}

EntityProps.BaseEntity = {
	Properties = {
		General = {
			{ Model = { key = 'model', type = 'model', desc = 'Entity visual/physics model' } },
			{ Skin = { key = 'skin', type = 'skin', desc = 'Model skin name' } },
			{ BindTo          =       { key = "bindTo", type = "string", desc = "Parent binding description in form 'parent_name:joint_name' (empty if no parent)" } },
			{ [ "Relationship group" ] = { key = 'relationshipGroup', type = 'int', desc = 'Relationship group' } },
			-- FIXME: remove 'color' property? it seems noone use it anyway...
			--Color = { key = 'color', type = 'color', desc = 'Entity color' },
		},

		Visual = VisualEntityDefaultProps,

		Physics = {
			{ Position					= { key = 'pos', type = 'vec3', desc = 'World position', } },
			{ Rotation					= { key = 'rot', type = 'quat', desc = 'World orientation', } },
			{ [ "Enable collision" ]	= { key = 'collision', type = 'bool', desc = 'if not checked, then do not create collision on spawn', } },
		},
	},

	Events = {
		OnDie = { desc = 'Fired when entity dies (but not removed yet)' },
	},
}

EntityProps.AnimatedEntity = {
	inherit         =               'BaseEntity',
	desc            =               [=[Simple entity with animation]=],

	Properties = {
		Animation = {
			{	Activity = { key = 'activity', type = 'activity', desc = 'play this looped activity' } },
		},
	},
}


EntityProps.AmbientSound = {
        desc            =               [=[Ambient sound spot]=],

        Properties = {
			General = LogicEntityDefaultPropsNoRotationParenting,
                Sound = {
                        { Sound = { key = 'soundname', type = 'sound', desc = 'Sound script name' } },
                        { [ 'Silent by default' ] = { key = 'start_silent', type = 'bool', desc = 'Check if sound should not be played automatically when map starts' } },
                        { [ 'Max distance' ] = { key = 'max_distance', type = 'float', desc = 'Maximum audio distance (the sound can not be heard when out of this distance)' } },
                        { Volume = { key = 'volume', type = 'float', min = 0.01, max = 1.0, granularity = 100, desc = 'Final volume gets multiplied by this factor' } },
						{ Mode = { key = "flags", type = 'enum', choices = SoundPlaybackFlags, desc = "Playback mode" } },
				}
        },
}

EntityProps.EffectEntity = {
	desc            =               [=[Particle system entity]=],

	Properties = {
		General = LogicEntityDefaultPropsParenting,

		Visual = {
			{ [ "Max view distance" ] = { key = 'maxViewDist', type = 'float', desc = [=[Entity maximum drawing distance in meters (if bellow or equal to 0, then entity drawing is not depending on distance to camera]=] } },
		},
		Effect = {
			{ Effect = { key = 'effect', type = 'effect', desc = 'Particles effect' } },
			{ IsPlayed = { key = 'isPlayed', type = 'bool', desc = 'Is effect spawned stopped' } },
			{ Environmental = { key = 'environmental', type = 'bool', desc = 'Environmental mode (draw in Sky pass)' } },
			{ [ "Environmental Scale" ] = { key = 'env_scale', type = 'float', is_slider = true, min = 0.0, max = 256.0, granularity = 1024, desc = 'Effect scaling factor for environmental mode' } },
			{ [ "Environmental Fog Multiplier" ] = { key = 'env_fog_mult', type = 'float', is_slider = true, min = 0.0, max = 1.0, granularity = 128, desc = 'Effect fog multiplier for environmental mode' } },
		},
	}
}

EntityProps.Flare = {
	desc            =               'Flare effect object',

	Properties = {
		General = LogicEntityDefaultPropsParenting,

		Settings = {
			{ [ "Base diameter" ]             = { key = 'size', type = 'float', is_slider = true, min = 0.0, max = 100.0, granularity = 100, desc = 'Value always equal real size on 10 metters from camera.' } },
			{ [ "Nebulosity factor" ]         = { key = 'nebulosity', type = 'float', is_slider = true, min = 0.0, max = 1.0, granularity = 100, desc = 'Nebulosity factor' } },
			{ [ "Flare color" ]               = { key = 'base_color', type = 'color', desc = 'Flare base color' } },
			{ [ "Visible angle" ]             = { key = 'vis_angle', type = 'float', is_slider = true, min = 0.0, max = 180.0, granularity = 100, desc = 'Visibility angle constrain' } },
			{ [ "Start disabled" ]            = { key = "start_disabled", type = "bool", desc = "Whether the flare is disabled on map start" } },
		},
	}
}

EntityProps.BeamEntity = {
	desc            =               'Ligth beam object',
	
	Properties = {
		General = LogicEntityDefaultPropsParenting,

		Beam = {
			{ [ "Length" ]            = { key = 'size', type = 'float', is_slider = true, min = 0.0, max = 1000.0, granularity = 100, desc = 'length of beam' } },
			{ [ "Width" ]             = { key = 'width', type = 'float', is_slider = true, min = 0.0, max = 100.0, granularity = 100, desc = 'width of beam' } },
			{ [ "Beam color" ]        = { key = 'base_color', type = 'color', desc = 'Beam base color' } },
			{ [ "Soft" ]              = { key = 'soft', type = 'bool', desc = 'Is beam has soft edges' } },
			{ [ "FlickerFps" ]        = { key = 'flicker_fps', type = 'float', is_slider = true, min = 1.0, max = 200.0 } },
			{ [ "Flicker" ]       	  = { key = 'flicker', type = 'string' } },
		},

		[ 'Halo 1' ] = {
			{ [ 'Activate halo' ]     = { key = 'has_halo_1', type = 'bool', desc = 'Check to activate this halo' } },
			{ [ "Halo size" ]         = { key = 'halo1_size', type = 'float', is_slider = true, min = 0.0, max = 40.0, granularity = 100, desc = 'Value always equal real size on 10 metters from camera.' } },
			{ [ "Nebulocity factor" ] = { key = 'halo1_nebulosity', type = 'float', is_slider = true, min = 0.0, max = 1.0, granularity = 100, desc = 'Nebulosity factor' } },
			{ [ "Halo color" ]        = { key = 'halo1_base_color', type = 'color', desc = 'Flare base color' } },
			{ [ "Visible angle" ]     = { key = 'halo1_vis_angle', type = 'float', is_slider = true, min = 0.0, max = 180.0, granularity = 100, desc = 'Visibility constrain to angle' } },
		},

		[ 'Halo 2' ] = {
			{ [ 'Activate halo' ]     = { key = 'has_halo_2', type = 'bool', desc = 'Check to activate this halo' } },
			{ [ "Halo size" ]         = { key = 'halo2_size', type = 'float', is_slider = true, min = 0.0, max = 40.0, granularity = 100, desc = 'Value always equal real size on 10 metters from camera.' } },
			{ [ "Nebulocity factor" ] = { key = 'halo2_nebulosity', type = 'float', is_slider = true, min = 0.0, max = 1.0, granularity = 100, desc = 'Nebulosity factor' } },
			{ [ "Occluder size" ]     = { key = 'halo2_occl_size', type = 'float', is_slider = true, min = 0.0, max = 20.0, granularity = 100, desc = 'Size of billboard for occlusion test' } },
			{ [ "Halo color" ]        = { key = 'halo2_base_color', type = 'color', desc = 'Flare base color' } },
			{ [ "Visible angle" ]     = { key = 'halo2_vis_angle', type = 'float', is_slider = true, min = 0.0, max = 180.0, granularity = 100, desc = 'Visibility constrain to angle' } },
			{ [ "Texture" ]           = { key = 'halo2_texture', type = 'texture', desc = 'Flare texture' } },
		},
	}
}

EntityProps.SkyDome = {
	inherit         =               'BaseEntity',
	desc            =               [=[Entity for sky]=],
}

EntityProps.GrassBox = {
	desc            =               [=[Grass colormap description]=],

	Properties = {
		General = LogicEntityDefaultProps,

		Settings = {
			{ [ "Size" ]	= { key = 'box_dimensions', type = 'vec3', desc = 'Colormap box dimensions' } },
			{ Texture 		= { key = 'texture', type = 'texture', desc = 'Colormap texture' } }
		}
	}
}

EntityProps.DecalObject = {
	desc            =               [=[]=],

	Properties = {
		General = LogicEntityDefaultProps,

		Decal = {
			{ [ "Size" ]		= { key = 'box_dimensions', type = 'vec3', desc = 'Decal size' } },
			{ [ "Decal" ]		= { key = 'decal', type = 'decal', desc = 'Decal description' } },
			{ [ "IsFlatten" ]	= { key = 'flatten', type = 'bool', desc = 'Decal not lay on surface' } },
			{ [ "OnlyOnLandscape" ]	= { key = 'land_only', type = 'bool', desc = 'Apply decal only on landscape surface' } },
			{ [ "Transparancy" ]= { key = 'transp', type = 'float', is_slider = true, min = 0.0, max = 1.0, granularity = 50, desc = 'Transparancy of decal' } },
		}
	}
}

EntityProps.DecalDescriptionObject = {
	desc            =               [=[]=],

	Properties = {
		Decal = {
			{ ["Diffuse Texture"]	= { key = 'diff_tex', type = 'texture', desc = 'Diffuse texture' } },
			{ ["Bump Texture"]		= { key = 'bump_tex', type = 'texture', desc = 'Bump texture' } },
			{ ["Masks Texture"]		= { key = 'msk_tex', type = 'texture', desc = 'Masks texture' } },
			{ ["Glow Texture"]		= { key = 'glow_tex', type = 'texture', desc = 'Glow texture' } },
			{ ["Default Size"]		= { key = 'default_size', type = 'float', desc = '' } },
			{ ["UV"]				= { key = 'uv', type = 'string', desc = '' } },
			{ ["Specular color"]	= { key = 'spec_color', type = 'color', desc = '' } },
			{ ["Gloss"]				= { key = 'gloss', type = 'float', desc = '', is_slider = true, min = 0.0, max = 1.0, granularity = 1000 } },
			{ ["Blend Type"] 		= { key = 'blend_type', type = 'enum',
										choices = { 'Alpha', 'Glow' }, desc = '' } },
			{ ["Material Type"] 	= { key = 'material_type', type = 'enum',
										choices = { 'Flat', 'Bump', 'Parallax' }, desc = '' } },
			{ ["Violence"]			= { key = 'violence', type = 'bool', desc = 'Not apply decal for low violence mode' } },
		}
	}
}

EntityProps.CameraEntity = {
	inherit         =               'BaseEntity',
	desc            =               [=[Fixed camera representation]=],

	Properties = {
		Camera = {
			{ [ "FovX" ]			= { key = 'fov',  type = 'float', desc = 'Horizontal field of view (in degrees)' } },
			{ [ "Aim object" ]		= { key = "aimObj", type = "entityName", desc = "The object to look at" } }					
		}
	}
}


EntityProps.EnvFog = {

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Fog = {
			{ Color = { key = "fog_color", type = "color", desc = "Fog color" } },
			{ Start = { key = "fog_start", type = 'float', min = -100.0, max = 100.0, desc = "Fog start distance" } },
			{ End =   { key = "fog_end", type = 'float', min = 0.0, max = 5000.0, desc = "Fog end distance" } },
			{ Power = { key = "fog_power", type = 'float', min = 1.0, max = 300.0, desc = "Fog power factor" } },
			{ Threshold = { key = 'fog_threshold', type = 'float', is_slider = true, min = 0.5, max = 1.0, desc = 'Fog threshold factor' } },
			{ [ "Time to fade" ] = { key = "lerp_time", type = "float", min = 0.0, max = 10.0, desc = "Time to Lerp between old and new settings", } },
		},
	}
}

EntityProps.EnvFogscape = {

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Fog = {
			{ Color = { key = "fog_color", type = "color", desc = "Fog color" } },
			{ Start = { key = "fog_start", type = 'float', min = 0.0, max = 3000.0, desc = "Fog start distance" } },
			{ End =   { key = "fog_end", type = 'float', min = -100.0, max = 100.0, desc = "Fog end distance" } },
			{ Power = { key = "fog_power", type = 'float', min = 1.0, max = 300.0, desc = "Fog power factor" } },
			{ Threshold = { key = 'fog_threshold', type = 'float', is_slider = true, min = 0.5, max = 1.0, desc = 'Fog threshold factor' } },
		},
	}
}

EntityProps.Touchable = {
	desc            =               'Touchable base',

	Properties = {
		General = LogicEntityDefaultProps,

		Trigger = {
			{ [ "Start disabled" ]    = { key = 'start_disabled', type = 'bool', desc = 'Check if location is disabled by default' } },
			{ [ "Box size" ]          = { key = 'box_dimensions', type = 'vec3', desc = 'Trigger box dimensions' } },
		}
	}
}


EntityProps.PointLight = {
	desc            =               'Point light source',

	Properties = {
		General = LogicEntityDefaultPropsNoRotationParenting,
		Settings = {
			{ [ "Radius" ]   		  = { key = 'rad', type = 'float', is_slider = true, min = 0.0, max = 1000.0, granularity = 100, desc = 'Light radius' } },
			{ [ "Color" ]     		  = { key = 'light_color', type = 'color', desc = 'Light color' } },
			{ [ "Start off" ]         = { key = "start_off", type = "bool", desc = "Whether light is disabled by default on map start" } },
		},
	}
}

EntityProps.TriggerBase = {
	inherit         =               'Touchable',
	desc            =               'Base for triggers',

	Properties = {
		Trigger = {
			{ Filter = { key = 'filter', type = 'filter', filter_class = 'BaseFilter', desc = 'Name of filter entity to filter incoming objects' } }
		},
	}
}

EntityProps.Location = {
	inherit         =               'TriggerBase',
	desc            =               'Base game location (area). It checks for entering and leaving entities and fires appropriate events.',
	
	Properties = {
		Reverb = {
			{ [ "Reverb volume" ] = { key = "reverb_volume", type = "bool", desc = "Check if this trigger acts as reverb volume" } }
		},
    }
}

EntityProps.TriggerHurt = {
	inherit         =               'TriggerBase',
	desc            =               'Trigger volume that periodically applies damage to all entities inside it',

	Properties = {
		Damage = {
			{ [ 'Min damage' ] = { key = 'min_damage_per_second', type = 'float', desc = 'Min damage per second' } },
			{ [ 'Max damage' ] = { key = 'max_damage_per_second', type = 'float', desc = 'Max damage per second' } },
			{ [ 'Damage type' ] = { key = 'damage_type', type = 'enum', choices = DamageTypes, desc = 'Damage type' } },
		}
	}
}


EntityProps.TriggerRemove = {
	inherit         =               'TriggerBase',
	desc            =               'Trigger volume that removes all entities inside it.',
}


EntityProps.BaseClip = {
	desc            =               'Clip (invisible collision)',

	Properties = {
		General = LogicEntityDefaultProps,
		Properties = {
			{ [ "Box size" ]          = { key = "box_size", type = "vec3", desc = "Clip box dimensions" } },
			{ [ "Clip type" ]         = { key = "clip_type", type = "enum", 
											choices = { "Player clip", "NPC clip", "Car clip", "Everything" },
											desc = "Type of collision clip" } },
			{ [ "Game material" ]     = { key = "mat_name", type = "string", desc = "Clip's game material name" } },
		}
	}
}


EntityProps.TagPoint = {
	desc            =               'Tag points used simply to reference some position in world',

	Properties = {
		General = LogicEntityDefaultPropsParenting,
		Anchor = {
			{ Type = { type = 'enum', desc = 'TagPoint type', key = 'type', choices = TagPointTypes, } },
		},
	}
}

EntityProps.PointTeleport = {
	desc            =               'Teleports target entity to this position',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Teleport = {
			{ Target    =   { key = 'target', type = 'string', desc = 'Name of entity to teleport' } },
		},
	}
}

EntityProps.BaseFilter = {
	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Filter = {
			{ Negate = { key = 'negate', type = 'bool', desc = 'If set filter negates result' } }
		}
	}
}

EntityProps.FilterClass = {
	inherit                 =               'BaseFilter',
	desc                    =               'Filter entities by class',

	Properties = {
		Filter = {
			{ [ "Entity class" ] = { key = 'filter_class', type = 'class', desc = 'Class name to filter' } },

			{ [ "Exact test" ] = {
				key = 'exact_test', type = 'enum',
				choices = { 'Entity class is kind of specified one', 'Entity class is exactly matches specified one' },
				desc = 'Check type'
			} }
		}
	}
}

EntityProps.FilterName = {
	inherit                 =               'BaseFilter',
	desc                    =               'Filter entities by name',

	Properties = {
		Filter = {
			{ [ "Entity name" ] = { key = 'filter_name', type = 'string', desc = 'Entity name to filter' } },
		}
	}
}


EntityProps.LogicCounter = {
	desc            =       'This entity fires events when its value changed and/or reached minimum/maximum values',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Counter = {
			{ [ "Start value" ]       =       { key = 'current_value',        type = 'float', desc = 'Start value for the counter' } },
			{ [ "Min value" ]         =       { key = 'min_value',            type = 'float', desc = 'Minimum counter value' } },
			{ [ "Max value" ]         =       { key = 'max_value',            type = 'float', desc = 'Maximum counter value' } },
		}
	}
}

EntityProps.LogicTimer = {
	desc            =       'This entity fires events on timer',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Timer = {
			{ [ "Start disabled" ]    =       { key = 'disabled',     type = 'bool', desc = 'Check if timer is disabled by default' } },
			{ Timeout                 =       { key = 'timeout',      type = 'float', desc = 'Time interval to fire event' } },
		}
	}
}

EntityProps.LogicMapLoad = {
	desc            =       'Fires event on first Think and removes itself',

	Properties = {
			General = LogicEntityDefaultPropsNoRotation,
	}
}

EntityProps.LogicChangeLevel = {
	desc            =       'This used to load next level',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Settings = {
			{ [ "Next level name" ] = { key = 'next_level_name', type = 'string', desc = 'Next level name' } },
		}
	}
}

EntityProps.LogicAutoSave = {
	desc            =       'This used to trigger auto-save',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
	}
}

EntityProps.LogicShakeScreen = {
	desc            =       'This used to trigger screen shake',

	Properties = {
		Settings = {
			{ [ "Radius" ] 			= { key = 'radius', 		type = 'float', desc = 'Radius' } },
			{ [ "Amplitude" ] 		= { key = 'amplitude', 		type = 'float', desc = 'Amplitude' } },
			{ [ "Frequency" ] 		= { key = 'frequency', 		type = 'float', desc = 'Frequency' } },
			{ [ "Duration time" ] 	= { key = 'durationTime', 	type = 'float', desc = 'Duration time' } },
		}
	}
}

EntityProps.LogicRelay = {
	desc            =       'Fires events when triggered',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Timer = {
			{ [ "Start disabled" ]    =       { key = 'disabled',     type = 'bool', desc = 'Check if disabled by default' } },
			{ [ "Remove on fire" ]    =       { key = 'remove_on_fire',       type = 'bool', desc = 'Check if auto-remove when triggered' } },
		}
	}
}

EntityProps.LogicBranch = {
	desc            =       'test specified boolean value and fires OnTrue or OnFalse event (similar to "if" operator)',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Timer = {
			{ [ "Initial value" ]     =       { key = 'value',     type = 'bool',     desc = 'Initial branch value' } },
		}
	}
}

EntityProps.LogicConsoleCommand = {
	desc            =       'Exec console commands',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
	}
}

EntityProps.LogicEvalScript = {
	desc            =       'Evaluate script command',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
	}
}

EntityProps.LogicChangeRelationship = {
	desc            =       'Changes relationship between two specified groups',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Groups  = {
			{ [ "First group" ]  = { key = "group1", type = "int", desc = 'First group' } },
			{ [ "Second group" ] = { key = "group2", type = "int", desc = 'Second group' } },
		}
	}
}

EntityProps.EnvSoundscape = {
	desc            =       'Used to specify soundscape (local ambient sound environment)',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Soundscape = {
			{ [ 'Soundscape' ]    =   { key = "soundscape",       type = 'soundscape',    desc = 'Soundscape name' } },
			{ [ 'Pos1' ]          =   { key = "pos1",             type = 'string',    desc = 'Position 1 for random sounds' } },
			{ [ 'Pos2' ]          =   { key = "pos2",             type = 'string',    desc = 'Position 2 for random sounds' } },
			{ [ 'Pos3' ]          =   { key = "pos3",             type = 'string',    desc = 'Position 3 for random sounds' } },
			{ [ 'Pos4' ]          =   { key = "pos4",             type = 'string',    desc = 'Position 4 for random sounds' } },
			{ [ 'Pos5' ]          =   { key = "pos5",             type = 'string',    desc = 'Position 5 for random sounds' } },
			{ [ 'Pos6' ]          =   { key = "pos6",             type = 'string',    desc = 'Position 6 for random sounds' } },
			{ [ 'Pos7' ]          =   { key = "pos7",             type = 'string',    desc = 'Position 7 for random sounds' } },
			{ [ 'Pos8' ]          =   { key = "pos8",             type = 'string',    desc = 'Position 8 for random sounds' } },
		}
	}
}

EntityProps.EnvSoundGroupVolume = {
	desc            =       'Used to change sound group volume scale',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Settings = {
			{ [ 'Fade over time' ]   = { key = "fade_over_time", type = 'float',  desc = 'Default time to fade in seconds' } },
			{ [ 'Sound group mask' ] = { key = "sound_groups",   type = 'int',    desc = 'Sound groups mask for which to apply volume scale' } },
		}
	}
}

EntityProps.PathObject = {
	desc            =               'Special game object containing number of points. Used to define AI movement',

	Properties = {
		General = LogicEntityDefaultProps,
		Visual = {
			{ Color = { key = 'color', type = 'color', desc = 'debug draw color' } },
		},
		Path = {
			{ DefaultSize = { key = 'default_size', type = 'float', desc = 'Default track size' } },
			{ PathType = { key = 'path_type', type = 'enum', choices = { 'NONE', 'RACE_TRACK', 'RACE_SHORTCUT', 'RACE_SUPPORT', 'PLAYER_RESPAWN', 'ROAD', 'ARENA_SUPPORT', 'WITH_DIRECTION', }, desc = 'Path type' } },
			{ [ "Unidirectional Road" ] = { key = 'unidirectional_road', type = 'bool', desc = 'this road can be drived only in one way' } },
		},
		
		SelectedPoint = {
			{ Index			=		{ key = 'sel_idx', type = 'int', desc = '0-based index. 0 means start of the path' } },
			{ Position		=		{ key = 'sel_pos', type = 'vec3', desc = 'World position' } },
			{ Rotation		=		{ key = 'sel_rot', type = 'quat', desc = 'World orientation' } },
			{ StayTime		=		{ key = 'sel_time', type = 'float', desc = 'Number of seconds that entity will stay at this point' } },
		}
	}
}


EntityProps.EnvShake = {
	desc            =               'Simple entity used to trigger screen shakes',

	Properties = {
			General = LogicEntityDefaultPropsNoRotation,
	ShakeData = {
			{ [ 'Player oriented' ]   = { key = 'player_oriented',    type = 'bool',  desc = [=[Check if shake is applied from player point of view,
otherwise (by default) from location of EnvShake entity' ]=] } },
			{ Amplitude               = { key = 'amplitude',          type = 'float', desc = 'Shake amplitude' } },
			{ Frequency               = { key = 'frequency',          type = 'float', desc = 'Shake frequency' } },
			{ Radius                  = { key = 'radius',             type = 'float', desc = 'Shake radius in meters' } },
			{ Duration                = { key = 'duration',           type = 'float', desc = 'Shake duration in seconds' } },
		}
	}
}

EntityProps.EnvFade = {
        desc            =               'Simple entity used to trigger screen fades',

        Properties = {
                General = LogicEntityDefaultPropsNoRotation,
                [ 'Fade data' ] = {
                        Color     = { key = 'fade_color',  type = 'color', desc = 'Fade color' },
                        Alpha     = { key = 'fade_alpha',  type = 'float', desc = 'Fade color alpha' },
                        Time      = { key = 'fade_time',   type = 'float', desc = 'Fade time in seconds' },
                }
        }
}

EntityProps.EnvBeam = {
	desc            =               'A light beam between two points, fires event when someone touches it',

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Beam = {
			{ [ "Beam start" ]     = { key = 'beam_start', type = 'string', desc = 'Entity where beam starts' } },
			{ [ "Beam end" ]       = { key = 'beam_end', type = 'string', desc = 'Entity where beam ends' } },
			{ [ "Start disabled" ] = { key = 'start_disabled', type = 'bool', desc = 'Check if beam is disabled by default' } },
			{ [ "Intensity" ] 	 = { key = 'beam_intensity', type = 'float', is_slider = true, min = 0.0, max = 2.0, desc = 'Default beam intensity' } },
			{ Filter               = { key = 'filter', type = 'filter', filter_class = 'BaseFilter', desc = 'Name of filter entity to filter incoming objects' } }
		}
	}
}

EntityProps.PhysExplosion = {
	desc            =       "When activated - plays impact effects and applies damage/impulse to physics objects",

	Properties = {
		General = LogicEntityDefaultPropsNoRotation,
		Explosion = {
			{ [ 'Min distance' ] = { key = 'blast_minDistance', type = 'float', min = 1.0, max = 20.0, granularity = 100, desc = 'Min explosion radius' } },
			{ [ 'Max distance' ] = { key = 'blast_radius', type = 'float', min = 1.0, max = 20.0, granularity = 100, desc = 'Max explosion radius' } },
			{ [ 'Do not check line-of-sight' ] = { key = 'no_occlusion_check', type = 'bool', desc = 'Check to disable line-of-sight test for each object before applying forces/damage' } },
		},
	},
}


EntityProps.Projector = {
	desc        =       'Projector light',

	Properties = {
		General = LogicEntityDefaultPropsParenting,

		Settings = {
			{ [ "Far distance" ] = { key = 'far_dist', type = 'float', min = 1.1, max = 1000.0, granularity = 100, desc = 'Projector far distance (do not make to big)' } },
			{ [ "Near distance" ] = { key = 'near_dist', type = 'float', min = -100, max = 1000.0, granularity = 100, desc = 'Projector near distance' } },
			{ [ "Fov" ] = { key = 'fov', type = 'float', min = 0.1, max = 3.0, granularity = 100, desc = 'Projector fov' } },
			{ [ "Height" ] = { key = 'height', type = 'float', min = 0.01, max = 100.0, granularity = 100, desc = 'Projector height' } },
			{ [ "Width" ] = { key = 'width', type = 'float', min = 0.01, max = 100.0, granularity = 100, desc = 'Projector width' } },
			{ [ 'Enabled' ] = { key = 'enabled',    type = 'bool',  desc = 'Toggle on/off light' } },
			{ [ 'Shadows' ] = { key = 'shadows',    type = 'bool',  desc = 'Toggle on/off projector shadows' } },
			{ [ "Texture" ] = { key = 'texture', type = 'texture', desc = 'Projected texture' } },
			{ [ "Color" ] = { key = 'base_color', type = 'color', desc = 'Projector base color' } },
		},
	}
}


--[[
EntityProps.RagdollEntity = {
	inherit			=	'BaseEntity',
	desc			=	[=[any ragdoll]=],
}
]]



PhysJointEntity_Entity0 = {
	{ [ "Entity" ]		= { key = 'entity0', type = 'entityName', desc = 'First attached entity', } },
}

PhysJointEntity_Entity1 = {
	{ [ "Entity" ]		= { key = 'entity1', type = 'entityName', desc = 'Second attached entity', } },
}


--spherical joint properties
EntityProps.PhysSphericalJointEntity =
{
	desc            =               [=[Spherical joint]=],
	Properties = {
		Entity0 = PhysJointEntity_Entity0,
		Entity1 = PhysJointEntity_Entity1,

		General = LogicEntityDefaultProps,
		
		[ "Limits" ] = {
			{ [ "Twist" ]			= { key = 'twist', type = 'float', min = 10, max = 360, granularity = 72, is_slider = true, desc = 'Value of twist limit angle', } },
			{ [ "Swing1" ]		= { key = 'swing1', type = 'float', min = 5, max = 180, granularity = 36, is_slider = true, desc = 'Value of swing1 limit angle', } },
			{ [ "Swing2" ]		= { key = 'swing2', type = 'float', min = 5, max = 180, granularity = 36, is_slider = true, desc = 'Value of swing2 limit angle', } },
		},
	}
}


EntityProps.SpawnSpot = 
{
	desc            =       "place where can be spawned player's car",

	Properties = 
	{
		General 		= LogicEntityDefaultProps,
		Logic = 
		{
			{ [ "From Zone" ]	= { key = 'from_zone', type = 'int', desc = 'zoneId from what this spot jump in' } },
			{ [ "Area size" ]	= { key = 'box_dimensions', type = 'vec3', desc = 'Spawn area box dimensions' } },
		}
	}
}


EntityProps.VitalPoint = {
	desc            =               'CtB gameplay vital point',

	Properties = {
		General = 
		{
			{ Position        =       { key = 'pos', type = 'vec3', desc = 'World position' } },
			{ Rotation        =       { key = 'rot', type = 'quat', desc = 'World orientation' } },
		},
	}
}

EntityProps.AnimatedMock = {
	Properties = {
		General = {
			{ Position        =       { key = 'pos', type = 'vec3', desc = 'World position' } },
			{ Rotation        =       { key = 'rot', type = 'quat', desc = 'World orientation' } },
			{ BindTo          =       { key = "bindTo", type = "string", desc = "Parent binding description in form 'parent_name:joint_name' (empty if no parent)" } },
			{ [ "Start hidden" ] =    { key = "start_hidden", type = "bool", desc = "Whether material is hidden by default on map start" } },
		},

		Animation = {
			{	Activity = { key = 'cur_animation', type = 'int', desc = 'play this looped activity' } },
			{	AnimationSpeed = { key = 'animation_speed', type = 'float', desc = 'animation scaler' } },
		},
	},
}


EntityProps.ObstacleEntity = {
	desc            =               'Obstacle to control bots movement',

	Properties = {
		General = 
		{
			{ Position			=	{ key = 'pos', type = 'vec3', desc = 'World position' } },
			{ Radius			=	{ key = 'radius', type = 'float', desc = 'Hard radius' } },
			{ InfluenceRadius	=	{ key = 'influenceRadius', type = 'float', desc = 'Soft radius' } },
		},
	},
}


EntityProps.Nebula = 
{
	desc		= "",
	
	Properties = {
		Visual = VisualEntityDefaultProps,
		General = LogicEntityDefaultProps,
	}
}


EntityProps.SpaceShield = 
{
	desc		= "",

	Properties = {
		General = 
		{
			{ Position			=	{ key = 'pos', type = 'vec3', desc = 'World position' } },
			{ Radius			=	{ key = 'radius', type = 'float', min = 1.0, max = 2001.0, granularity = 1000, is_slider = true, desc = 'Radius' } },
			{ Intensity			=	{ key = 'intensity', type = 'float', min = 0.0, max = 4.0, granularity = 1000, is_slider = true, desc = 'Overall intensity' } },
			{ Tiling			=	{ key = 'tiling', type = 'float', min = 0.1, max = 10.0, granularity = 1000, is_slider = true, desc = 'Detail tiling factor' } },
		},
	}
}


EntityProps.AuraHolderEntity = 
{
	desc		= "",
	
	Properties = {
		Visual = VisualEntityDefaultProps,
		General = LogicEntityDefaultProps,
	}
}


EntityProps.Turret = 
{
	desc		= "",
	
	Properties = {
		Visual = VisualEntityDefaultProps,
		General = LogicEntityDefaultProps,
		Ai = 
		{	
			{ [ "Attack CargoShip" ] = { key = 'do_attack_cargoship', type = 'bool', desc = 'Do attack enemy CargoShips', }, },
		},
	},
}

EntityProps.WarpGate = 
{
	desc		= "",
	
	Properties = {
		Visual = VisualEntityDefaultProps,
		General = LogicEntityDefaultProps,
		Logic = 
		{
			{ Distance = { key = 'warp_distance', type = 'float', desc = 'warp distance', min = 1.0, max = 2000.0, }, },
		}
	}
}

EntityProps.ScBaseEntity = 
{
	desc		= "",
	
	Properties = {
		Visual = VisualEntityDefaultProps,
		General = LogicEntityDefaultProps,
	},
}

EntityProps.JumpDockLocation = 
{
	desc	= "",
	Properties = 
	{
		General = LogicEntityDefaultProps,
		Logic = 
		{
			{ [ "Box size" ] = { key = 'box_dimensions', type = 'vec3', desc = 'Trigger box dimensions' } },
			{ [ "Dock" ] = { key = 'dock', type = 'bool', desc = 'Dock in current Zone' } },
			{ [ "Target Zone" ] = { key = 'target_zone', type = 'int', desc = 'Jump target zoneId' } },
			{ [ "Secret Zone" ] = { key = 'secret_zone', type = 'int', desc = 'Jump secret zoneId' } },
			{ [ "Secret Chance" ] = { key = 'secret_chance', type = 'float', desc = 'Jump secret chance' } },
			{ [ "Fuel Required" ] = { key = 'fuel_required', type = 'int', desc = 'Jump fuel requirement' } },
			{ [ "Fuel Consumption" ] = { key = 'fuel_consumption', type = 'int', desc = 'Jump fuel cost' } },
		}
	},
}

EntityProps.HudMsgLocation = 
{
	desc	= "",
	Properties = 
	{
		General = LogicEntityDefaultProps,
		Logic = 
		{
			{ [ "Message" ] = { key = 'string_id', type = 'string', desc = 'localized string id' } },
		}
	},
}

EntityProps.SpawnAISquadLocation = 
{
	desc	= "",
	Properties = 
	{
		General = LogicEntityDefaultProps,
	},
}

EntityProps.QuestObject = 
{
	desc	= "",
	Properties = 
	{
		General = LogicEntityDefaultProps,
	},
}

EntityProps.PathMovementEntity = 
{
	desc	= "",
	Properties = {
		Visual = VisualEntityDefaultProps,
		General = LogicEntityDefaultProps,
		Logic = 
		{
			{ [ "Path name" ] = { key = 'path_name', type = 'entityName', desc = 'path name' }, },
			{ [ "Respawn time" ] = { key = 'respawn_time', type = 'float', desc = 'respawn time' }, },
			{ ClosedPath = { key = 'closed_path', type = 'bool', desc = 'If true entity will return to the first point after end of path.' } },
		}
	}
}

EntityProps.EntityBuilderTrigger = {
	desc = "",

	Properties = {
		General = LogicEntityDefaultProps,

		Trigger = {
			{ [ "Box size" ]    	= { key = 'box_dimensions', type = 'vec3', desc = 'Trigger box dimensions' } },
			{ [ "Build Entity" ]	= { key = 'buildEntityName', type = 'entityName', desc = 'linked Entity Name to building', } },
		}
	}
}

EntityProps.ClanShipMainTurret = {
	desc = "",

	Properties = {
		General = LogicEntityDefaultPropsParenting,
	}
}

EntityProps.ClanShipTorpedoLauncher = {
	desc = "",

	Properties = {
		General = LogicEntityDefaultPropsParenting,
	}
}