--
Def.DeathRay_Base =
{
	class				= "DeathRay",
	in_editor			= false,
	default_icon 		= "Module_rocket_bomb",
	
	explosion_blast_wave = "DeathRayBlastWave",

	beam_effect			= "particles/weapons/deathray/beam",
	--launch_sound			= "sound/weapons/deathray",
	work_sound			= "sound/weapons/deathray",
	fail_sound			= "sound/weapons/deathray_fail",

}


--
Def.DeathRayBlastWave = 
{
	class 				= "BlastWave",
	in_editor			= false,
	
	effect = "particles/explosions/explosion_big3_electric",
	
	light_radius		= 30.0,
	light_color			= "0 100 255 255",
	light_time			= 0.8,
	sound  				= "sound/weapons/deathray_explosion",
}
