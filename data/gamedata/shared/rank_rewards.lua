
--
RankRewards = {}

RankRewards[ ai.Race.EMPIRE ] = {}
RankRewards[ ai.Race.FEDERATION ] = {}
RankRewards[ ai.Race.JERICHO ] = {}

--[[
ai.Reputation:
    T1
	1 Private
    2 Corporal
    3 Sergeant
	T2
    4 MasterSergeant
    5 SergeantMajor
    6 Midshipman
    T3
	7 MasterMidshipman
    8 Ensign
    9 ThirdLieutenant
    T4
	10 SecondLieutenant
    11 FirstLieutenant
    12 LtCommander
    T5
	13 Commander
    14 Captain
    15 Commodore
]]

--[[ 			пример 
RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Corporal ] = 
{
	credits 		= 1,
	gold_credits	= 1,
	tokens			= 1,
	items			=
	{
		-- крафт ресурсы сюда же
		{	"Weapon_Railgun_Basic_T1_ET", 1,	},
		{	"Weapon_Plasmagun_Basic_T1_ET", 1,	},
		{	"Weapon_Laser_Basic_T1_ET", 1,	},
		{	"Iridium_monocrystall", 1,	},
		{	"Module_Suicide_T1_Mk1", 1,	},
		{	"Module_Suicide_T1_Mk2",	},
		{	"SpaceMissile_Standart_T1_Prem", 50, },
		{	"SpaceMissile_Fireworks_T1_Prem", 50, },
		{	"SpaceMissile_DoomDay_T5", 50, },
		{	"WeaponMod_LaserUp1_Basic_T5_Prem", 50, },
		{	"WeaponMod_RailUp1_Basic_T5_Prem", 50, },
		{	"WeaponMod_PlasmaUp1_Basic_T5_Prem", 50, },


		
	},
	premium			= 86400, -- сутки в секундах
	free_exp		= 1,
}
]]

-- Empire

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.Corporal ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T2_ET", 1,	},	---#56612
	},--]]
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.Sergeant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T2_ET", 1,	},	---#56612
		{	"SpaceMissile_Fireworks_T1_Prize", 10, },
	},--]]
}

-- T2
RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.MasterSergeant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T2_ET", 1,	},
		{	"WeaponMod_LaserUp1_Basic_T2_Prem", 10, },
	},--]]
	-- premium			= 86400, 
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.SergeantMajor ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T2_ET", 1,	},
		{	"SpaceMissile_Fireworks_T2_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.Midshipman ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T2_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },	---?
	},--]]
}

-- T3
RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.MasterMidshipman ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T3_ET", 1,	},
		{	"WeaponMod_LaserUp1_Basic_T3_Prem", 10, },
	},--]]
	-- premium			= 86400, 
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.Ensign ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T3_ET", 1,	},
		{	"SpaceMissile_Fireworks_T3_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.ThirdLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T3_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },
	},--]]
}

-- T4
RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.SecondLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T4_ET", 1,	},
		{	"WeaponMod_LaserUp1_Basic_T4_Prem", 10, },
	},--]]
	-- premium			= 172800, 
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.FirstLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T4_ET", 1,	},
		{	"SpaceMissile_Fireworks_T4_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.LtCommander ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T4_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },
	},--]]
}

-- T5
RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.Commander ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T5_ET", 1,	},
		{	"WeaponMod_LaserUp1_Basic_T5_Prem", 10, },
	},--]]
	--premium			= 172800, 
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.Captain ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T5_ET", 1,	},
		{	"SpaceMissile_Fireworks_T5_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.EMPIRE ][ ai.Reputation.Commodore ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T5_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 20, },
	},--]]
	talent_set = 1,
	--premium			= 259200, 
}

-- Federation

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.Corporal ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T2_ET", 1,	},	---#56612
	},--]]
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.Sergeant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T2_ET", 1,	},	---#56612
		{	"SpaceMissile_Fireworks_T1_Prize", 10, },
	},--]]
}

-- T2
RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.MasterSergeant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T2_ET", 1,	},
		{	"WeaponMod_PlasmaUp1_Basic_T2_Prem", 10, },
	},--]]
	--premium			= 86400, 
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.SergeantMajor ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T2_ET", 1,	},
		{	"SpaceMissile_Fireworks_T2_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.Midshipman ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T2_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },	---?
	},--]]
}

-- T3
RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.MasterMidshipman ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T3_ET", 1,	},
		{	"WeaponMod_PlasmaUp1_Basic_T3_Prem", 10, },
	},--]]
	--premium			= 86400, 
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.Ensign ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T3_ET", 1,	},
		{	"SpaceMissile_Fireworks_T3_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.ThirdLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T3_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },
	},--]]
}

-- T4
RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.SecondLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T4_ET", 1,	},
		{	"WeaponMod_PlasmaUp1_Basic_T4_Prem", 10, },
	},--]]
	--premium			= 172800, 
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.FirstLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T4_ET", 1,	},
		{	"SpaceMissile_Fireworks_T4_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.LtCommander ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T4_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },
	},--]]
}

-- T5
RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.Commander ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T5_ET", 1,	},
		{	"WeaponMod_PlasmaUp1_Basic_T5_Prem", 10, },
	},--]]
	--premium			= 172800, 
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.Captain ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T5_ET", 1,	},
		{	"SpaceMissile_Fireworks_T5_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.FEDERATION ][ ai.Reputation.Commodore ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T5_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 20, },
	},--]]
	talent_set = 2,
	--premium			= 259200, 
}

-- Jericho

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Corporal ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T2_ET", 1,	},	---#56612
	},--]]
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Sergeant ] = 
{
	--]]items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T2_ET", 1,	},
		{	"SpaceMissile_Fireworks_T1_Prize", 10, },	---#56612
	},--]]
}

-- T2
RankRewards[ ai.Race.JERICHO ][ ai.Reputation.MasterSergeant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T2_ET", 1,	},
		{	"WeaponMod_RailUp1_Basic_T2_Prem", 10, },
	},--]]
	--premium			= 86400, 
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.SergeantMajor ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T2_ET", 1,	},
		{	"SpaceMissile_Fireworks_T2_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Midshipman ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T2_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },	---?
	},--]]
}

-- T3
RankRewards[ ai.Race.JERICHO ][ ai.Reputation.MasterMidshipman ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T3_ET", 1,	},
		{	"WeaponMod_RailUp1_Basic_T3_Prem", 10, },
	},--]]
	--premium			= 86400, 
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Ensign ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T3_ET", 1,	},
		{	"SpaceMissile_Fireworks_T3_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.ThirdLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T3_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },
	},--]]
}

-- T4
RankRewards[ ai.Race.JERICHO ][ ai.Reputation.SecondLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T4_ET", 1,	},
		{	"WeaponMod_RailUp1_Basic_T4_Prem", 10, },
	},--]]
	--premium			= 172800, 
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.FirstLieutenant ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T4_ET", 1,	},
		{	"SpaceMissile_Fireworks_T4_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.LtCommander ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T4_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 10, },
	},--]]
}

-- T5
RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Commander ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Railgun_Basic_T5_ET", 1,	},
		{	"WeaponMod_RailUp1_Basic_T5_Prem", 10, },
	},--]]
	--premium			= 172800, 
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Captain ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Laser_Basic_T5_ET", 1,	},
		{	"SpaceMissile_Fireworks_T5_Prize", 20, },
	},--]]
}

RankRewards[ ai.Race.JERICHO ][ ai.Reputation.Commodore ] = 
{
	--[[items			=
	{
		{	"Iridium_monocrystall", 1,	},
		{	"Weapon_Plasmagun_Basic_T5_ET", 1,	},
		{	"SpaceMissile_DoomDay_T5", 20, },
	},--]]
	talent_set = 3,
	--premium			= 259200, 
}