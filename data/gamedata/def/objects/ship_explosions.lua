-----------------------------------------------------------
--BlastWaves from ships explosions
Def.SmallShipExplodeBlastWave = 
{
	class 				= "BlastWave",
	in_editor			= false,
	apply_shake			= false,
	
	damage_kinetic		= 0.0,
	damage_emp			= 0.0,
	damage_thermal		= 100 * 14,

	light_radius		= 30.0,
	light_color			= "255 130 100 255",
	light_time			= 1.3,

	blast_maxDistance	= 10, 
	
	default_icon		= "damage_explosionBlastwave",	
	uiName				= "damage_shipExplodeBlastWave",	-- для нормального отображения в DeathRecap
}


Def.MediumShipExplodeBlastWave = 
{
	inherit 			= "SmallShipExplodeBlastWave",
	damage_thermal		= 150 * 14,
	blast_maxDistance	= 13, 

	light_radius		= 50.0,
}


Def.LargeShipExplodeBlastWave = 
{
	inherit 			= "SmallShipExplodeBlastWave",
	damage_thermal		= 200 * 14,
	blast_maxDistance	= 16, 

	light_radius		= 100.0,
	light_time			= 1.8,
}


Def.SpiralShipExplodeBlastWave = 
{
	inherit 			= "LargeShipExplodeBlastWave",
	blast_maxDistance	= 40,
	damage_thermal		= 200 * 14 * 2,
}


Def.SmallShipExplodeBlastWavePVE = 
{
	inherit				= "SmallShipExplodeBlastWave",
	damage_thermal		= 10 * 14,
}

Def.MediumShipExplodeBlastWavePVE = 
{
	inherit 			= "MediumShipExplodeBlastWave",
	damage_thermal		= 15 * 14,
}

Def.LargeShipExplodeBlastWavePVE = 
{
	inherit 			= "LargeShipExplodeBlastWave",
	damage_thermal		= 20 * 14,
}