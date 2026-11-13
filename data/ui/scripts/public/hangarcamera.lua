UI.HangarCamera =
{
	presets =
	{
		default =
		{
			minDist			= 4, 
			maxDist			= 10,
			aim				= Vec3( 0, 0.5, 0 ),	-- точка, в которую смотрит камера
			shipPos			= Vec3( 0, 0, 0 ),
			minAngleY		= math.rad( 10 ),
			maxAngleY		= math.rad( 60 ),
			defaultAngleY	= math.rad( 20 ),
			defaultAngleX	= math.rad( 45 ),
			defaultZoom		= 0.5,					-- от 0 до 1
		},

		LARGE =
		{
			minDist			= 7.5, 
			maxDist			= 11,
			aim				= Vec3( 0, 0.5, 0 ),
			shipPos			= Vec3( 0, 0, 0 ),
			minAngleY		= math.rad( 29 ), --8
			maxAngleY		= math.rad( 29 ), --60
			defaultAngleY	= math.rad( 29 ),
			defaultAngleX	= math.rad( 45 ),
			defaultZoom		= 0.5,
		},

		MEDIUM =
		{
			minDist			= 3.8, 
			maxDist			= 6,
			aim				= Vec3( 0, 0, 0 ),
			shipPos			= Vec3( 0, 0.2, 0 ),
			minAngleY		= math.rad( 20 ), --8
			maxAngleY		= math.rad( 20 ), --60
			defaultAngleY	= math.rad( 20 ),
			defaultAngleX	= math.rad( 45 ),
			defaultZoom		= 0.5,
		},

		SMALL =
		{
			minDist			= 3.0, 
			maxDist			= 4,
			aim				= Vec3( 0, -0.3, 0 ),
			shipPos			= Vec3( 0, -0.3, 0 ),
			minAngleY		= math.rad( 16 ), --8
			maxAngleY		= math.rad( 16 ), --60
			defaultAngleY	= math.rad( 16 ),
			defaultAngleX	= math.rad( 45 ),
			defaultZoom		= 0.6,
		},
	},

	interpolationSpeed			= 5,					-- [m/sec]		- средняя скорость смещения позиции камеры при смене пресета, а также при зуме колесом       
	rotationSensitivity			= math.rad( 0.5 ),		-- [rad/pixel]	- скорость поворота по оси X при движении мышью (пикселы - в системе 1024*768)  
	zoomSensitivity				= 0.1,					-- [ 0.. 1 ]	- коэффициент зума на один поворот колеса мыши                                     
}

