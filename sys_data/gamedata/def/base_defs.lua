
-- Scene physics entity prototype
Def.ScenePhysicsEntity =
{
	class			= 		'ScenePhysicsEntity',
	in_editor		= 		false,
	damaging 		= 		true,
}

---------- Effect ----------
Def.EffectEntity =
{
	class		=  "EffectEntity",
	in_editor	= false,
}


---------- Animation ----------
Def.AnimatedEntity =
{
	class		= "AnimatedEntity",
	in_editor	= false,
}

---------- Base ----------
Def.BaseEntity =
{
	class		= "BaseEntity",
	in_editor	= false,
}

---------- Model ----------
Def.ModelEntity = 
{
    class    = "BaseEntity",
	in_editor = false,
}

---------- SoftBodyEntity ----------
Def.SoftBodyEntity =
{
	class		= "SoftBodyEntity",
	in_editor	= false,
--	model		= "models/cloth",
}



-------------------------------------------------------------------------------
-- Model preview
-------------------------------------------------------------------------------	


---------- AnimSequencer ----------
Def.AnimSequencer = 
{
	class		= "AnimSequencer",
	in_editor	= false,
	physics		= { solid_type = solid.model, static = true },
}


-- Для того, чтобы можно было в AnimPreview просматривать объекты определенного прототипа, заданного в командной строке
if cvars.anim_sequencerInheritDef ~= "" then
     Def.AnimSequencer.inherit = cvars.anim_sequencerInheritDef
end


---------- StaticEntity ----------
Def.StaticEntity =
{
	class		= "BaseEntity",
	in_editor	= false,
}


---------- ModelPreviewStatic ----------
Def.ModelPreviewStatic =
{
	class		= "BaseEntity",
	in_editor	= false,
	physics		= { solid_type = solid.model, static = true },
}

---------- ModelPreviewDynamic ----------
Def.ModelPreviewDynamic = 
{
    class    	= "BaseEntity",
	in_editor 	= false,
	physics		= { solid_type = solid.model },
}


---------- ModelPreviewRagdoll ----------
Def.ModelPreviewRagdoll = 
{
    class    	= "RagdollEntity",
	in_editor 	= false,
	physics		= { solid_type = solid.model },
}





---------- Path ----------
Def.PathObject = {
	class				=	'PathObject',
	in_editor			=	false
}


---------- Beam ----------
Def.Lights_Beam = 
{
	class           = 	"BeamEntity",
	in_editor       =   true,
}

Def.Lights_BeamWithHalo = 
{
	class                   =   "BeamEntity",

	halo1                   =   false,
	halo1_base_size         =   1.0,
	halo1_size_warp			=    0.2,
	halo1_occl_size			=    1.0,
	halo1_vis_angle			=    180.0,	
	halo1_base_color        =   "255 255 255",
	halo1_texture           =   "textures/star_smooth",
	
	halo2                   =   false,
	halo2_base_size         =   1.0,
	halo2_size_warp			=    0.2,
	halo2_occl_size			=    1.0,
	halo2_vis_angle			=    180.0,	
	halo2_base_color        =   "255 255 255",
	halo2_texture           =   "textures/star_smooth",
}


---------- Projector ----------
Def.Lights_Projector = 
{
    class 			= 'Projector',
}

---------- Flare ----------
Def.Lights_Flare =
{
	class				= 'Flare',
	in_editor			=	true
}

---------- PointLight ----------
Def.Lights_PointLight = {
	class				=	'PointLight',
	in_editor			=	true
}

Def.Lights_PointLightFlickeringOdd = 
{
	class				=	'PointLight',
	flicker ='aazzz',
	fps = 20,
}

Def.Lights_PointLightFlickeringEven = 
{
	class				=	'PointLight',
	flicker ='zzzaa',
	fps = 20,
}


---------- Location ----------
Def.Location_Physics = {
	class				=	'Location',
	in_editor			=	false,
	physics				=	{ static = true, },
}


---------- TriggerRemove ----------
Def.TriggerRemove_Physics = {
	class				=	'TriggerRemove',
	in_editor			=	false,
	physics				=	{ static = true, },
}


---------- Gibs ----------
Def.simple_gib = {
	class			=		"SimpleGib",
	in_editor		=		false,
	physics 		= 		{ solid_type = solid.box, mass = 10, material = 'Flesh', },
}



---------- Clips ----------
Def.Clips_Base = {
	class			=		"BaseClip",
	in_editor		=		false,
}


Def.TriggerHurt =
{
	class				=	'TriggerHurt',
	in_editor			=	false,
	physics				=	{ static = true, },
}

Def.Helpers_TagPoint = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

-- test Cube with physics
Def.Helpers_Cube1m = 
{
	class				=	'BaseEntity',
	in_editor			=	true,
	model				=	"models/misc/cube1m",
    physics				=	{ solid_type = solid.box, mass = 10, static = true, },
}

Def.Helpers_Cube2m = 
{
	class				=	'BaseEntity',
	in_editor			=	true,
	model				=	"models/misc/cube2m",
    physics				=	{ solid_type = solid.box, mass = 20, static = true, },
}

Def.Helpers_Cube4m = 
{
	class				=	'BaseEntity',
	in_editor			=	true,
	model				=	"models/misc/cube4m",
    physics				=	{ solid_type = solid.box, mass = 40, static = true, },
}

Def.Helpers_Cube8m = 
{
	class				=	'BaseEntity',
	in_editor			=	true,
	model				=	"models/misc/cube8m",
    physics				=	{ solid_type = solid.box, mass = 80, static = true, },
}

-- test Cube with physics
Def.Cube = 
{
	class				=	'BaseEntity',
	in_editor			=	false,
	model				=	"models/misc/no_model",
    physics				=	{ solid_type = solid.model, mass = 100, },
}

--
Def.SpellAuraEntity = 
{
	class				=	"SpellAuraEntity",
	in_editor			=	false,
}


Def.AuraHolderEntity = 
{
	class				=	"AuraHolderEntity",
	in_editor			=	false,
}


---------- CameraEntity ----------
Def.CameraEntity =
{
	class 		= "CameraEntity",
	in_editor 	= false
}

Def.SkyDomeBase =
{
	class 		= "SkyDome",
	in_editor   = true
}