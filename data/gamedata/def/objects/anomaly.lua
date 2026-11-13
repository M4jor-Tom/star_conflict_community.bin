
Def.Anomaly_PandoraSun = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "Anomaly_PandoraSun",

	uiName			= "Anomaly_PandoraSun",
}

Def.Anomaly_PandoraSunFatal = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "Anomaly_PandoraSunFatal",

	uiName			= "Anomaly_PandoraSun",
}

Def.PlasmaHurt =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	
	uiName				= "plasma_beem",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
}

Def.PlasmaHurtWS =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	
	uiName="plasma_beem",
}

Def.AnomalyHurt =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	
	uiName				= "Anomaly_PandoraSun",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
}

Def.Anomaly_PW_LavaTrigger =
{
	class				= 'TriggerHurt',
	in_editor			= true,
	physics				= { static = true, },
	uiName				= "LavaTrigger",
}

Def.MonsterHurt =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName				= "plasma_beem",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 4000.0, 150.0, 150.0 ),
	max_dps				= 4000,
	min_dps				= 4000,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.MonsterHurt1 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName				= "plasma_beem",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 950.0, 2000.0, 20.0 ),
	max_dps				= 12000,
	min_dps				= 12000,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.MonsterHurt2 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName				= "plasma_beem",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 950.0, 20.0, 2000.0 ),
	max_dps				= 14000,
	min_dps				= 14000,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.MonsterHurt3 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName				= "plasma_beem",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 250.0, 2000.0, 20.0 ),
	max_dps				= 12000,
	min_dps				= 12000,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.MonsterHurt4 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName				= "plasma_beem",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 250.0, 20.0, 2000.0 ),
	max_dps				= 14000,
	min_dps				= 14000,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.MonsterHurt5 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName				= "Character_Monster",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 2200.0, 1400.0, 500.0 ),
	max_dps				= 12000000,
	min_dps				= 12000000,
	damage_type			= 1,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.MonsterHurt6 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	true,
	spell_on_spawn		= "Plasma_beem",
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName				= "Character_Monster",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 2200.0, 1400.0, 500.0 ),
	max_dps				= 12000000,
	min_dps				= 12000000,
	damage_type			= 1,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.Anomaly_DeathStar = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "Anomaly_DeathStar",

	uiName			= "Anomaly_DeathStar",
}