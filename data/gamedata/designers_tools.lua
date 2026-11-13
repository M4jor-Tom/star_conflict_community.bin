-- ----------------------------------------------------------------------------
if not designers then	--guard	
	-- ----------------------------------------------------------------------------
	-- TODO comment this
	designers = {}
end

if not ai then ai = {} end

ai.SpellTarget = {
	CASTER = 
	{
		target         = ai.SpellTargetGeneral.CASTER,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	HOLDER = 
	{
		target         = ai.SpellTargetGeneral.HOLDER,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	LOCKED_TARGET = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	LOCKED_ALLY_TARGET = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	VISIBLE_LOCKED_TARGET_BY_CASTER = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	VISIBLE_LOCKED_TARGET_BY_HOLDER = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	VISIBLE_LOCKED_ALLY_TARGET_BY_CASTER = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	VISIBLE_LOCKED_ALLY_TARGET_BY_HOLDER = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	ALLY_AROUND = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ENEMY_AROUND = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ALLY_AROUND_EXCLUDE_CASTER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	ALLY_AROUND_EXCLUDE_HOLDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	ALLY_LESSER_HULL_CASTER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LESSER_HULL + ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	ALLY_LESSER_HULL_HOLDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LESSER_HULL + ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	ALLY_LESSER_HULL_HOLDER_NO_STEALTH = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LESSER_HULL + ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED + ai.SpellTargetMisc.HOLDER_SHOULD_NOT_BE_CLOAKED,
	},
	ALLY_LESSER_SHIELD_CASTER = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LESSER_SHIELD + ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	ALLY_LESSER_SHIELD_HOLDER = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LESSER_SHIELD + ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	ALLY_LESSER_SHIELD_HOLDER_NO_STEALTH = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LESSER_SHIELD + ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED + ai.SpellTargetMisc.HOLDER_SHOULD_NOT_BE_CLOAKED,
	},
	CASTER_POSITION_CASTER = 
	{
		target         = ai.SpellTargetGeneral.CASTER,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.POSITION,
	},
	CASTER_POSITION_HOLDER = 
	{
		target         = ai.SpellTargetGeneral.HOLDER,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.POSITION,
	},
	VITALPOINT_ATTACKERS = 
	{
		target         = ai.SpellTargetGeneral.VITALPOINT_ATTACKERS,
		class          = ai.SpellTargetClass.SHIP,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	VITALPOINT_DEFENDERS = 
	{
		target         = ai.SpellTargetGeneral.VITALPOINT_DEFENDERS,
		class          = ai.SpellTargetClass.SHIP,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	SHIPS_AROUND = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	SHIPS_EVERYWHERE = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
	},
	ALLY_SHIPS_AROUND = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ALLY_SHIPS_AROUND_NO_STEALTH = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.NOT_CLOAKED,
	},
	ENEMY_SHIPS_AROUND = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ENEMY_SHIPS_VISIBLE_BY_CASTER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	ENEMY_SHIPS_VISIBLE_BY_HOLDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	RANDOM_ENEMY_SHIP_POSITION = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.POSITION + ai.SpellTargetMisc.RANDOM,
	},
	ENEMY_SHIPS_AROUND_POSITION = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.POSITION,
	},
	ENEMY_LOCKER_OF_CASTER_SHIPS = 
	{
		class          = ai.SpellTargetClass.SHIP,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LOCKER_OF_CASTER,
	},
	ENEMY_LOCKER_OF_HOLDER_SHIPS = 
	{
		class          = ai.SpellTargetClass.SHIP,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.LOCKER_OF_HOLDER,
	},
	INFLICTOR = 
	{
		target         = ai.SpellTargetGeneral.INFLICTOR,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ALLY_SHIPS_AROUND_EXCLUDE_CASTER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	ALLY_SHIPS_AROUND_EXCLUDE_HOLDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	ENEMY_VISIBLE_BY_CASTER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	ENEMY_VISIBLE_BY_HOLDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	ALLY_NPC = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ENEMY_NPC = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ENEMY_OWNED_ENTITIES = 
	{
		class          = ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.GUIDED_DRONE,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ENEMY_OWNED_ENTITIES_IN_CYLINDER = 
	{
		class          = ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.GUIDED_DRONE,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	VISIBLE_LOCKED_TARGET_BY_CASTER_POSITION = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.POSITION,
	},
	VISIBLE_LOCKED_TARGET_BY_HOLDER_POSITION = 
	{
		target         = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.POSITION,
	},
	ALLY_IN_CYLINDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ALLY_SHIPS_IN_CYLINDER = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ENEMY_IN_CYLINDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ALL_IN_CYLINDER_EXCLUDE_CASTER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	ALL_IN_CYLINDER_EXCLUDE_HOLDER = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	AIM_POS = 
	{
		target         = ai.SpellTargetGeneral.AIM,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.POSITION,
	},
	SHIPS_OUTSIDE = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.OUTSIDE,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	ALL_AROUND = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
}

--baseRace(1..3 ), skin_number(base(1) advenced(2) subrace(3) premium(4)) , size(1..3), ship_type (1..5)
function designers.GetShipID( baseRace, skin_number, size, ship_type ) --baseRace(1..3 ), skin_number(base(1) advenced(2) subrace(3) premium(4)) , size(1..3), ship_type (1..5)
--	sys.out(tostring( ( baseRace - 1 ) * 100 + ( skin_number - 1 ) * 15 + ( size - 1 ) * 5 + ship_type	 ))
	return ( baseRace - 1 ) * 100 + ( skin_number - 1 ) * 15 + ( size - 1 ) * 5 + ship_type	
end


-- генерим цену 1 5000  ...  1 000 000
function designers.GetShipPrice( baseRace, skin_number, size, ship_type ) 
	--baseRace(1..3 ), skin_number(base(1) advenced(2) subrace(3) premium(4)) , size(1..3), ship_type (1..5)
	local price = {
			 0, --Т1, -- при нуле будет ошибка.
			 15000, --Т2,
			 25000, 
			 50000, 
			 100000, --T5
			 200000, --T1E  T1P
			 300000, 
			 500000, 
			 750000,
			 1000000,
		}
		
	local lvl_mul = 0
	if skin_number > 1 then
		lvl_mul = 5
	end
	local res = price[ ship_type + lvl_mul ]
	if skin_number == 4 then --премиум деньги в 4 раза "меньше"
		res = math.floor( res / 200 * 0.1 ) * 10  --заодно округлим до 10
	end
	return res
end



designers.StoreId = 5000
function designers:GetStoreId()
	designers.StoreId = designers.StoreId + 1
	return designers.StoreId
end

--Module_ThermalUnlock_T5_Mk1
--ai.SpaceShipModuleSlot.SHIELD_MOD_01
function designers:Module( pass_module, bone )
	local ship = CL_GetLocalPlayerShip( )
	if ship then
		local bone_ = bone or ai.SpaceShipModuleSlot.SHIELD_MOD_01
		res = ship:EquipModule( bone_, pass_module )
	end
end

--одеть корабль, одеть модуль, поставить тестовую цель
function designers:setTestEnv(testmyship, testmodule, testtarget)
	sys.concmd( 'ship_create ' .. testmyship ) --корабль себе
	if Def[testmodule].class == 'ActiveModule' or Def[testmodule].class == 'FiringModule' or Def[testmodule].class == "FrigateDroneModule" then
		sys.concmd( 'cheat_equipActiveModule '.. testmodule ) --если второй аргумент - модуль
	else
		sys.concmd( 'cheat_equipWeapon '.. testmodule ) --если не модуль
	end
	local ship = CL_GetLocalPlayerShip( )
	ship:SetPos(Vec3(-175, 1225, 45)) --сменить позицию корабля
	--ship:SetHealth(100)
	if testtarget then
		local shipTestBalance = ai.Spawn(testtarget) --спавн цели
		shipTestBalance:SetPos(ship:GetPos()+ship:GetDir()*(100)) --смена позиции цели: поставить перед собой впереди на 1 км
	end
end

function designers:addAlly(def1)
	local def = def1 or "Ship_Race1_M_T3"
	local ship = CL_GetLocalPlayerShip( ) 
	local shipTestBalance = ai.Spawn(def) 
	shipTestBalance:SetPos(ship:GetPos()+ship:GetDir()*(100)) 
	shipTestBalance:SetRelationshipGroup(1)
end

function designers:addDummyAlly(distance, def)
	local distance1 = distance or 100
	local ship = CL_GetLocalPlayerShip( ) --опеределить свой корабль
	local def1 = def or "AI_BOSS_T2" -- если не указан деф взять некий дефолтный
	local shipTestBalance = ai.Spawn(def1) --спавн цели
	shipTestBalance:SetPos(ship:GetPos()+ship:GetDir()*(distance1)) --смена позиции цели: поставить перед собой на указанную дистанцию
	shipTestBalance:SetRelationshipGroup(1)
end

function designers:addDummyEnemy(distance, def, count, dist2 )
	local distance1 = distance or 100
	local ship = CL_GetLocalPlayerShip( ) --опеределить свой корабль
	local def1 = def
	if type(def) == "number" then 
		if def == 1 then 
			def1 = "Ship_Race1_S_T5"
		elseif def == 2 then 
			def1 = "Ship_Race1_M_T5"
		elseif def == 3 then 
			def1 = "Ship_Race1_L_T5"
		elseif def == 4 then 
			def1 = "Ship_Race1_H_T5"
		else
			def1 = "Ship_Race1_M_T5"
			sys.out(" distance, def(or def number), count, dist2  ")
		end
	end
	def1 = def1 or "AI_BOSS_T2" -- если не указан деф взять некий дефолтный
	local count1 = count or 1
	local distance2	= dist2 or 20
	for i = 1, count1 do 
		local shipTestBalance = ai.Spawn( def1 ) --спавн цели
		shipTestBalance:SetRelationshipGroup( 2 ) --сменить релейшеншип
		shipTestBalance:SetPos( ship:GetPos() + ship:GetDir() * ( distance1 + distance2 * (i-1) ) ) --смена позиции цели: поставить перед собой на указанную дистанцию
		if i > 1 then
			local shipTestBalance = ai.Spawn( def1 ) --спавн цели
			shipTestBalance:SetRelationshipGroup( 2 ) --сменить релейшеншип
			local ort = ship:GetDir()
			ort.x = ort.x + ort.z
			ort.z = ort.x - ort.z
			ort.x = ort.x - ort.z
			shipTestBalance:SetPos( ship:GetPos() + ship:GetDir() * ( distance1 ) + ort * ( distance2 * i ) ) --смена позиции цели: поставить перед собой на указанную дистанцию
		end
	end
end

function designers:addDummy( def, team, playerId )
	local def = def
	if type(def) == "number" then 
		if def == 1 then 
			def = "Ship_Race1_S_T5"
		elseif def == 2 then 
			def = "Ship_Race1_M_T5"
		elseif def == 3 then 
			def = "Ship_Race1_L_T5"
		elseif def == 4 then
			def = "Ship_Race1_H_T5"
		end
	end
	if not def then
		def = "AI_BOSS_T2"
	end
	local targetEntity = CL_GetPlayerShip( playerId )
	if not targetEntity then
		--=next(Mission.Players)
		return false
	end
	local pos = targetEntity:GetPos()
	local rot = targetEntity:GetDir()
	local ship = ai.Spawn( def )
	ship:SetRelationshipGroup( team )
	ship:SetPos( pos + rot * 10 )
end

function designers:ClassFields(class, fieldstringpart) --вывести все используемые поля класса, с указанным во втором аругменте куском строки
	local listofClassparams = {} --list for class fields

	local function IsKeyInList (list, value) --check if value is in list
		for _, v in pairs(list) do 
			if v[1]==value then
				return true
			end
		end
		return false
	end

	for k, v in pairs(Def) do --go through all entities of the class and check for any unlisted fields in listofClassparams
		if v.class == class then
			for fieldname, fieldcontent in pairs(v) do 
				if not IsKeyInList (listofClassparams, fieldname) then
					listofClassparams[#listofClassparams+1] = {fieldname, k}
				end
			end
		end
	end

	table.sort (listofClassparams, function(k1, k2) return tostring(k1[1])<tostring(k2[1]) end) --sorting the list by the field name

	for k, v in pairs(listofClassparams) do --print results
		if fieldstringpart then
			if string.match(tostring(v[1]), fieldstringpart) then 
				sys.out(tostring(v[1]).."\t-->\t"..tostring(v[2])) 
			end
		else 
			sys.out(tostring(v[1]).."\t-->\t"..tostring(v[2])) 
		end
	end
end

-- #0032755 - hardcoded prices to determine 'sale'
designers.defaultPremiumTimePrices = 
{
	DailyLicenseCard		= 300,
	ThreeDayLicenseCard		= 500,
	WeeklyLicenseCard		= 1000,
	MonthlyLicenseCard		= 3000,
	HalfAnnualLicenseCard	= 8500,
	AnnualLicenseCard		= 15500,
	DailyLicenseCardHidden		= 300,
	ThreeDayLicenseCardHidden	= 500,
	WeeklyLicenseCardHidden		= 1000,
	MonthlyLicenseCardHidden	= 3000,
	HalfAnnualLicenseCardHidden	= 8500,
	AnnualLicenseCardHidden		= 15500,
}


function designers:TestAttack( n , n2 )
	local ship = Entities[n]
	local ship2 = Entities[n2]
	ship:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, ship )
	ship:AI_Attack( ship2 )
end




 
-- ----------------------------------------------------------------------------
--end --guard
-- ----------------------------------------------------------------------------
--[[
football = {}
function football:Update( dt )
	-- стартовые проверки объектов
	if football.ball_playerId and Entities[ football.ball_playerId ] then 
		football.ball_player = Entities[ football.ball_playerId ]
	else 
		football.ball_player = nil
		football.ball_playerId = nil
	end
	for i, v in pairs( football.players ) do
		if  v.ship and v.id and ( not Entities[ v.id ] ) then
			v.ship = nil
		end
	end
	
	if football.ball_player then -- кто то из игроков ведет мяч
		if football.ball_player:GetShieldVal() <= 30  then -- если у игрока ведущего мяч меньше 5 хп щита (минимум надо так как щит регенится и может не быть равным 0)
			football:RemoveBallFromPlayer()
		elseif football.ball_player:GetAppliedAuraCount() > 0 then		
			for i = 1, football.ball_player:GetAppliedAuraCount() do
				local aura = football.ball_player:GetAppliedAura( i-1 )
				if aura and aura:GetSpellDefName() == "Kick" then -- пинок
					
					local dir = football.ball_player:GetDir():GetNormalized() ----football.ball_player:GetWeaponAimPos()
					local pos = football.ball_player:GetPos()
					
					football:RemoveBallFromPlayer()
					
					-- ПАС
					local pas_comp = false
					for i_p, pl in pairs( football.players ) do
						if pl.ship then
							for i_a = 1, pl.ship:GetAppliedAuraCount() do
								local aura2 = pl.ship:GetAppliedAura( i_a-1 )
								if aura2 and aura2:GetSpellDefName() == "KickIn" then -- принимающий пас
									football:GetBall( pl.ship )
									pas_comp = true
									break
								end
							end
						end
						if pas_comp then break end
					end
					
					-- пас не вышел отправляем мяч лететь
					if not pas_comp then 
						football.kick_timer = 1
						local last_dt =  math.max( 0.01,  football.last_dt )
						football.ball_speed = ( football.ball:GetPos() - football.last_ball_pos ) * (1 / last_dt ) + 65 * dir 					
						--void Teleport( quat, vec3 )   /* set entity world rotation and position */
						--football.ball:SetPos( pos + dir * 12 )
						football.ball:Teleport(pos + dir * 15, football.ball:GetRot(), pos + dir * 12 ) -- телепорт так как стукается при простом переносе ( не верная дока?)
					end
				end
			end
		end
	elseif football.players  then -- мяч в свободном полете
		local near_player = false
		if football.kick_timer <= 0 then -- "мяч подхватывается"
		
			-- притяжение
			for i, v in pairs( football.players ) do
				for aId = 1, v.ship:GetAppliedAuraCount() do
					local aura = v.ship:GetAppliedAura( aId-1 )
					if aura and aura:GetSpellDefName() == "BallAttraction" then -- притяжение
						football.ball_speed = football.ball_speed + ( v.ship:GetPos() - football.ball:GetPos() ):GetNormalized() * 10 * dt
					end
				end
			end
			
			local near_player = false
			for i, v in pairs( football.players ) do
				-- если у игрока много щита и он рядом с мячом, то он его берет (пока без прогресс бара)
				if #( v.ship:GetPos() - football.ball:GetPos() ) < 12 then 
					if v.ship and v.ship.GetShieldVal and v.ship:GetShieldVal() > 300 and (not football.offplay) then  
						-- подбор мяча					
						football:GetBall(v.ship)
						break  -- только 1 игрок может взять мяч
						--SV_Pve_ScriptedNotification( "BombSpawned" )
					end
					near_player = true
				end
			end
		end
		
		-- апдейт мяча
		local op = football.ball:GetPos()
		local np = op + football.ball_speed * dt
		football.ball:SetPos( op + football.ball_speed * dt )
		football.ball_speed = football.ball_speed:GetNormalized() * ( #football.ball_speed * ( 1 - 1/3 * dt) )   -- декой скорости за 2+сек		
		if Game_IsServer() then
			if near_player then 
				ServerLuaRpcEx( network.MAX_PLAYERS, "CL_BALL_SYNC", 0,0,0,0,0,0, true )
			else
				ServerLuaRpcEx( network.MAX_PLAYERS, "CL_BALL_SYNC", np.x,np.y,np.z,football.ball_speed.x,football.ball_speed.y,football.ball_speed.z )
			end
		end
		
		if dt > 0 and #( football.last_ball_pos - football.ball:GetPos() ) / dt  < 70 and StartCD <=0 and not football.ball_eff then
		--if  StartCD <=0 and not football.ball_eff then
			football.ball_eff  = ai.Spawn( "Football_eff1" )
			football.ball:AttachToBone( football.ball_eff, "root" )
		end
	end	
	football.kick_timer = football.kick_timer - dt
	football.last_ball_pos = football.ball:GetPos() 
	football.last_dt = dt
	
	-- слабость на игрока "без щита"
	for i, v in pairs( football.players ) do
		-- если у игрока мало щита, то он его берет (пока без прогресс бара)
		if v.ship and  v.ship:GetShieldVal() < 20 then  
			AddAura( v.ship, "NoShieldWeakness" )--
		end
	end
	
	
	
	--чек гола
	if not football.offplay then 
		local x, y, z = 42, 42, 10	
		local team_goal = nil
		for i, v in pairs( football.gates ) do
			local p = v:GetPos()
			if 		football.last_ball_pos.x > p.x - x and football.last_ball_pos.x < p.x + x and 
					football.last_ball_pos.y > p.y - y and football.last_ball_pos.y < p.y + y and 
					football.last_ball_pos.z > p.z - z and football.last_ball_pos.z < p.z + z  then 
				team_goal = i
				break
			end
		end
		--ГОЛ!!!
		if team_goal then
			football.offplay = true
			football.offplay_timer = 3
			football.counter[team_goal] = football.counter[team_goal] + 1
			for i = 1, 32 do 
				local sh = CL_GetPlayerShip( i - 1 ) 
				if sh then
					football:RemoveBallFromPlayer()
					local rel = sh:GetRelationshipGroup()
					local s1, s2 = 0, 0
					if sh then 
						if rel == 1 then 
							s1= football.counter[2]
							s2= football.counter[1]
						else
							s1= football.counter[1]
							s2= football.counter[2]
						end
						local param = { {name = "param1", type = 1, value = s1 }, {name = "param2", type = 1, value = s2 } }
						if Game_IsServer() then
							ServerLuaRpcEx( i-1, "CL_WOW_MSG", "Score", rel~= team_goal, param, 3, "sound/ui/lootScanSuccess" ) -- вау сообщение с раскраской и звуком посреди экрана.
							ServerLuaRpcEx( i-1, "CL_FOOTBALLSCORE", s1, s2 ) -- очки наверху
						else
							CL_WOW_MSG( "Score", rel~= team_goal, param, 3, "sound/ui/lootScanSuccess" )
							if CL_FOOTBALLSCORE then 
								CL_FOOTBALLSCORE( s1, s2 )
							end
						end
					end
				end
			end
		end
	end
	
	-- чекаем оут мяча
	if #( football.ball:GetPos() - football.ball_pos ) > 1000 and football.offplay_timer <= 0 then
		football.offplay = true
		football.offplay_timer = 3
		if Game_IsServer() then
			ServerLuaRpcEx( network.MAX_PLAYERS, "CL_WOW_MSG", "ModuleActivate_OUT_OF_RANGE", false, nil, 3, "sound/ui/lootScanSuccess" )
		else
			CL_WOW_MSG( "ModuleActivate_OUT_OF_RANGE", false, nil, 3, "sound/ui/lootScanSuccess" )
		end
	end
	
	if football.offplay_timer and  football.offplay_timer > 0 then
		football.offplay_timer = football.offplay_timer - dt
		if football.offplay_timer <= 0 then
			football.startPosShift = football.startPosShift + 1
			football:StartPlay()
		end
	end

	
	-- стартовый отсчет
	if StartCD > 0 then
		StartCD = StartCD - dt
		local msg = nil
		if StartCD <= 3 and StartCD + dt > 3 then
			msg = "KEY_3"
			--где создаем бомбу она еще не успевает просраться на клиенте, поэтому обновляем ее позже, тут
			if Game_IsServer() then
				ServerLuaRpcEx( network.MAX_PLAYERS, "ADD_MARK_BY_DEF_NAME", "Football_ball_script", 4, 1 )
			else
				ADD_MARK_BY_DEF_NAME( "Football_ball_script", 4, 1 )
			end
		elseif StartCD <= 2 and StartCD + dt > 2 then
			msg = "KEY_2"
		elseif StartCD <= 1 and StartCD + dt > 1 then
			msg = "KEY_1"
		elseif StartCD <= 0  then
			msg = "quest_ALIEN_ENGI_COOP_2_name"
			football.offplay = false
		end		
		if msg then
			if Game_IsServer() then
				ServerLuaRpcEx( network.MAX_PLAYERS, "CL_WOW_MSG", msg, true, nil, 0.75, "sound/ui/lootScanSuccess" )			--ServerLuaRpcEx( 0, "CL_WOW_MSG", "vein_found", 10 )player_n
			else
				CL_WOW_MSG( msg, true, nil, 0.7, "sound/ui/lootScanSuccess" )
			end
		end
	end
	
	
	-- дебажная отрисовка
	if (not Game_IsServer() ) and ( not Game_IsClient() ) then
		if football.debug_draw then
			for i, v in pairs( football.debug_draw ) do
				if v.draw_type == 1 then
					local color = v.color or 255
					if v.p1 and v.p2 then
						DrawDebugLine( v.p1, v.p2, color )
					end
				end
			end
		end
	end
end


function football:RemoveBallFromPlayer() 
	if football.ball_player then
		football.ball_player:RemoveChild( football.ball )
		RemoveAura( football.ball_player, "BallWeakness" )
		football.ball_player = nil
		football.ball_playerId = nil
		--a:SetActivity("ACTIVE", true )
--		football.ball:SetActivity("IDLE", true )
		if Game_IsServer() then
			ServerLuaRpcEx( network.MAX_PLAYERS, "ADD_ACTIVITY_BY_DEF_NAME", "Football_ball_script", "IDLE" )
		else 
			football.ball:SetActivity("IDLE", true )
		end
	end
end

function football:GetBall( ship )
	football.ball_player = ship
	football.ball_playerId = ship:GetId()
	if not football.ball:GetParent() then 
		ship:AttachToBone( football.ball, "root" ) -- gun_1
	end
	if Game_IsServer() then
		ServerLuaRpcEx( network.MAX_PLAYERS, "CL_BALL_SYNC", 0,0,0,0,0,0, true ) -- отключить синхронизацию
		ServerLuaRpcEx( network.MAX_PLAYERS, "ADD_ACTIVITY_BY_DEF_NAME", "Football_ball_script", "ACTIVE" )
	else 
		football.ball:SetActivity( "ACTIVE", true )
	end
	
	AddAura( football.ball_player, "BallWeakness" )
	if football.ball_eff then
		football.ball_eff:Remove()
		football.ball_eff = nil
	end
end


]]



--[[
function football:Init()
football.debug_draw = {}
-- считаем что у нас игроки релейшиншип 1 и 2 имеют
	football.gate1 = GetEntityIdByDefName("OpenWorld_DeactivateJumpgate")
	football.gate2 = GetEntityIdByDefName("OpenWorld_ActiveJumpgate")
	football.counter = {0,0}  -- счет  [1] сколько пропустила команда 1 [2]сколько пропустила команда 2
	if football.gate1 and football.gate2 then
		football.gates = {} 
		football.gates[1] = Entities[ football.gate1 ]
		football.gates[2] = Entities[ football.gate2 ]
		football.gates[1]:SetRelationshipGroup(1)
		football.gates[2]:SetRelationshipGroup(2)
		football.ball_pos = 0.5 * ( football.gates[1]:GetPos() + football.gates[2]:GetPos() ) -- центр карты и положение мяча
		football.ball_player = nil
		football.ball_playerId = nil
		
		football.offplay_timer = -1

	
		football.team2ball = 450 -- на столько перед воротами спавнятся команды
		football.teamDist = 50  -- столько между членами команды
		football.kick_timer = 0 -- если больше нуля, то мяч нельзя "подобрать"
		
		
				
		-- обнуляем очки на клиентах
			if Game_IsServer() then
				ServerLuaRpcEx( network.MAX_PLAYERS, "CL_FOOTBALLSCORE", 0,0 )			--ServerLuaRpcEx( 0, "CL_WOW_MSG", "vein_found", 10 )player_n
			else
				CL_FOOTBALLSCORE( 0, 0 )
			end

		football:StartPosCalc()
------
		football:StartPlay()
		

		local x, y, z = 42, 42, 10
		table.insert( football.debug_draw, { draw_type = 1, p1 = Entities[ football.gate1 ]:GetPos( ) + Vec3( x , y, z ), p2= Entities[ football.gate1 ]:GetPos( ) + Vec3( -x , y, z ) } )
		table.insert( football.debug_draw, { draw_type = 1, p1 = Entities[ football.gate1 ]:GetPos( ) + Vec3( x , -y, z ), p2= Entities[ football.gate1 ]:GetPos( ) + Vec3( -x , -y, z ) } )
		table.insert( football.debug_draw, { draw_type = 1, p1 = Entities[ football.gate1 ]:GetPos( ) + Vec3( x , y, -z ), p2= Entities[ football.gate1 ]:GetPos( ) + Vec3( -x , y, -z ) } )
		table.insert( football.debug_draw, { draw_type = 1, p1 = Entities[ football.gate1 ]:GetPos( ) + Vec3( x , -y, -z ), p2= Entities[ football.gate1 ]:GetPos( ) + Vec3( -x , -y, -z ) } )
	end
end

function football:StartPosCalc()
-- расчеты стартовых позиций и направлений
		football.players = {}
		football.teamsN = {}
		football.playersPos = {}
		football.playersDir = {}
		football.playersPosByTeam = { [1] = {}, [2] = {} }
			
		local vec = { {Vec3(0,0,0),Vec3(0,0,0),Vec3(0,0,0),}, {Vec3(0,0,0),Vec3(0,0,0),Vec3(0,0,0),} } -- нормали пространства команды
		local player_place = { Vec3(1,0, 0), Vec3(0,0,0), Vec3(1,0,-1), Vec3(1,0,1), Vec3(1,0,-2), Vec3(0,0,2), Vec3(0,1,0), 
					Vec3(0,-1,0), Vec3(0,0,3), Vec3(0,0,-3), Vec3(-1,0,1), Vec3(-1,0,-1), 
					Vec3(0, 1,-2), Vec3(0,1,2), Vec3(0, -1,-2), Vec3(0,-1,2), } -- места для игроков относительно  vec[relationship]
		for i, v in pairs( football.gates ) do  -- заполняем вектора базиса для каждых ворот
			vec[ i ][ 1 ] = ( football.ball_pos - v:GetPos() ) :GetNormalized()
			CrossProduct( vec[ i ][ 1 ], Vec3( 1, 0, 0 ), vec[ i ][ 2 ] )
			CrossProduct( vec[ i ][ 1 ], vec[ i ][ 2 ], vec[ i ][ 3 ] )
		end
		for i = 1, ai.MAX_PLAYERS do --network.MAX_PLAYERS
			local pl = GetPlayerInfo( i - 1 ) 
			if pl then
				--sh:SetRelationshipGroup( math.mod( i, 2 ) + 1 ) -- попарно делим на 2 команды ()
				
				local team = pl.team --sh:GetRelationshipGroup()
				if team == 1 or team == 2 then
					football.teamsN[ team ] = football.teamsN[ team ] and ( football.teamsN[ team ] + 1 ) or 1
					local pp = player_place[football.teamsN[ team ] ]
					football.playersPos[ i ] = ( pp.x * vec[team][1] + pp.y * vec[team][2] + pp.z * vec[team][3] ) * football.teamDist + 
													football.gates[team]:GetPos() + vec[team][1] * football.team2ball
					football.playersDir[ i ] =  vec[team][1]:GetNormalized()
					table.insert( football.playersPosByTeam[team], { pos = football.playersPos[ i ], dir = football.playersDir[ i ]  } )
					--	sh:SetPosDir( football.playersPos[ i ], football.playersDir[ i ] )
				end
			end
		end
end
]]
-- всех выставляем, стартовый отсчет запускаем. перед игрой и после каждого гола.
--[[ function football:StartPlay()
		--создаем список игроков
		football.startPosShift = football.startPosShift and football.startPosShift or 0 
		if football.startPosShift == #football.playersPosByTeam[ 1 ] then 
			football.startPosShift = 0
		end
		local curId = { [1] = football.startPosShift, [2] = football.startPosShift }
		
		football.players = {}
		for i = 1, ai.MAX_PLAYERS do --network.MAX_PLAYERS
			local sh = CL_GetPlayerShip( i - 1 ) 
			if sh then
				--sh:SetRelationshipGroup( math.mod( i, 2 ) + 1 ) -- попарно делим на 2 команды ()
				
				--local team = sh:GetRelationshipGroup()
				if not football.playersPos[ i ] then
					football:StartPosCalc()
				end
				
				local team = sh:GetRelationshipGroup()
				football.players[i] =  { ship = sh, has_ball = false, team = team,  id = sh:GetId() } 
				
				curId[ team ] = curId[ team ] +  1
				if curId[ team ] > #football.playersPosByTeam[ team ] then 
					curId[ team ] = 1
				end
				
				sh:SetPosDir( football.playersPosByTeam[ team ][curId[ team ] ].pos, football.playersPosByTeam[ team ][curId[ team ] ].dir )
				
				AddAura( sh, "StartingStop" ) 
			end
			
				-- метка на враждебные ворота
				local pl = GetPlayerInfo( i - 1 ) 
				if ( pl.team == 1 or pl.team == 2 ) and not pl.isBot then 
					--local g_pos = football.gates[team]:GetPos()
					local other_team = pl.team == 2 and 1 or pl.team == 1 and 2
					if Game_IsServer() then
						--ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_FocusPointsAdd", g_pos.x, g_pos.y, g_pos.z, football.gates[team]:GetDefName() )
						ServerLuaRpcEx( i - 1, "ADD_MARK_BY_DEF_NAME", football.gates[other_team]:GetDefName(), 5 )
					else
						--CL_FocusPointsAdd( g_pos.x, g_pos.y, g_pos.z, football.gates[team]:GetDefName() )
						ADD_MARK_BY_DEF_NAME( football.gates[other_team]:GetDefName(), 5 )
					end
				end
				
		end
		StartCD = 3.5

		if football.ball then
			football.ball:Remove()
		end
		if football.ball_eff then
			football.ball_eff:Remove()
			football.ball_eff = nil
		end
		football.ball = ai.Spawn( "Football_ball_script" )		
		if football.ball then 
			--UI.HudObjectsMarksWnd:AddMark( football.ball:GetId(), 4)
			-- выставляем на мяч значок бомбы
			if Game_IsServer() then
				ServerLuaRpcEx( network.MAX_PLAYERS, "ADD_MARK_BY_DEF_NAME", "Football_ball_script", 4, 1 )			--ServerLuaRpcEx( 0, "CL_WOW_MSG", "vein_found", 10 )player_n
			else
				ADD_MARK_BY_DEF_NAME( "Football_ball_script", 4, 1 )
			end
			--UI:ShowHudMarkNotify( football.ball:GetId(), true )
			football.ball:SetPos( football.ball_pos )
			football.last_ball_pos = football.ball:GetPos()
			football.ball_speed = Vec3(0,0,0)
			football.ball_player = nil
			football.ball_playerId = nil
		end
end ]]

--UI:PlayGlobalSound("sound/ui/lootScanSuccess")
--UI:ShowWowMsg("itemType_RailgunSniper", true ,20)
--"KEY_1"	"1"
--"KEY_2"	"2"
--"KEY_3"	"3"
--"CLR_UID_OFFLINE" "Пилот вне игры."
--"warning_outOfBattleFieldText1"	"Вы вылетели за границы поля боя" 
--"warning_outOfBattleFieldText2"	"ВЕРНИТЕСЬ В БОЕВУЮ ЗОНУ!"
--"ModuleActivate_OUT_OF_RANGE"	"Цель слишком далеко"
--SV_ShowWowMsg( -1, "+1", true, 300, {}, 2 )
function SV_ShowWowMsg( player, text, positive, priority, param, time, sound )
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	if Game_IsServer() then
		ServerLuaRpcEx( player_, "CL_WOW_MSG", text, positive, priority, param, time, sound )		-- network.MAX_PLAYERS, "CL_WOW_MSG", msg, true, nil, 0.75, "sound/ui/lootScanSuccess"
	else
		CL_WOW_MSG( text, positive, priority, param, time, sound )
	end
end

function CL_WOW_MSG( text, positive, priority, param, time, sound )
	UI:ShowWowMsg( text, positive, priority, param, time )  -- textId positive|negative priority params(table) time   
	if sound then
		UI:PlayGlobalSound( sound )
	end
end

--выставляет на клиенте марк для первой попавшейся сущности с defName
function ADD_MARK_BY_DEF_NAME( defName, mark_type, has_questMark )
	local id = GetEntityIdByDefName( defName )
	if id then 
		UI:OnRemoveEntityFromHud( id )
		UI.HudObjectsMarksWnd:AddMark( id, mark_type )
		if has_questMark then 
			if has_questMark == 1 then
				UI:ShowHudMarkNotify( id, true )
			else
				UI:ShowHudMarkNotify( id, false )
			end
		end
	end
end


function ADD_ACTIVITY_BY_DEF_NAME( defName, activity )
	local id = GetEntityIdByDefName( defName )
	if id then
		local ent = Entities[id] 
		if ent then
			ent:SetActivity( activity, true )
		end
	end
end


--[[ function CL_FOOTBALLSCORE( s1, s2 )
	if not football_cl then 
		football_cl = { 0, 0 }
	end
	football_cl [1] = s1
	football_cl [2] = s2
end ]]
--"test_p"

--UI:ShowWowMsg( "test_p", true, 500, { {name = "param1", type = 1, value = 12 }, {name = "param2", type = 1, value = 11 } }, 10 )

--сколько надо попыток чтобы выбить  конкретную вещь в ом
--[[ function TestOWloot()
	local t_per_loot = 15
	local t = {}
	for i = 1, 100000 do ---10000 игроков
		local n = 1
		for j = 1, 300 do
			if  math.random(12) == 1 then -- выбили что искали
				t[n] = t[n] and t[n] + 1 or 1
				break
			else 
				n = n + 1
			end
		end
	end
	dprint(t)
	local s, s20,s30,s50 = 0, 0, 0, 0
	for i, v in pairs (t) do
		s = s + v*i
		if i>=20 then
			s20 = s20+v
		end
		if i>=30 then
			s30 = s30+v
		end
		if i>=50 then
			s50 = s50+v
		end
	end
	dprint( "middle hours: ".. tostring( (s/100000) * t_per_loot/ 60) )
	dprint( "hours: " .. tostring( 20 * t_per_loot/ 60) )
	dprint(s20)
	dprint( "hours: " .. tostring( 30 * t_per_loot/ 60) )
	dprint(s30)
	dprint( "hours: " .. tostring( 50 * t_per_loot/ 60) )
	dprint(s50)

end ]]



----------------------------------------------------------------------------------------------------------------
--**
--**             Говорящая голова
--**
----------------------------------------------------------------------------------------------------------------
--[[ #105583
dialogId UI:ShowDialogScript( params ) -- пример CL_ShowDialogScript( "quest_character_mercenary_medium", "Pirate_Quest_fad_dk", "pve_gen_desttown_convoy_1", 5 )
UI:HideDialogScript( dialogId )
где
    params =
    {
        portrait_id = <string>, -- ид картинки
        name_text_id = <string>, -- ид заголовка
        text_id = <string>, -- ид текста
        time = <number>, -- время в секундах, опциональный, по умолчанию 10 сек.
        sound = <string>, -- звук (голос), опцпиональный
    } ]]
	
--пример
--
	

--SV_ShowDialogScript( -1,"quest_character_mercenary_medium", "Pirate_Quest_fad_dk", "pve_gen_desttown_convoy_1", 5, "sound/gadgets/IsotopeHarvester/ih" )
-- рассылаем игроку/игрокам диалоги   если  player = -1, то всем
function SV_ShowDialogScript( player, portrait_id, name_text_id, text_id, time_show, sound )  
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	if Game_IsServer() then
		ServerLuaRpcEx( player_, "CL_ShowDialogScript", portrait_id, name_text_id, text_id, time_show, sound )
	else
		CL_ShowDialogScript( portrait_id, name_text_id, text_id, time_show, sound )
	end
end

function IsSafeDialogResourcePath( path )
	if type( path ) ~= "string" then
		return false
	end

	if string.find( path, "%.%." ) or string.find( path, ":" ) or string.find( path, "\\" ) then
		return false
	end

	return string.find( path, "^[%w_/%-]+$" ) ~= nil
end

-- клиентская функция показа диалога
function CL_ShowDialogScript( portrait_id, name_text_id, text_id, time_show, sound )
	if type( portrait_id ) ~= "string" or type( name_text_id ) ~= "string" or type( text_id ) ~= "string" then
		sys.log( "CL_ShowDialogScript()[ERROR]: invalid dialog text parameters" )
		return false
	end

	if time_show ~= nil and type( time_show ) ~= "number" then
		sys.log( "CL_ShowDialogScript()[ERROR]: invalid type of the 4-th parameter (\"time_show\"); \"number\" expected, got \"%s\"", type( time_show ) )
		return false
	end

	if sound ~= nil and type( sound ) ~= "string" then
		sys.log( "CL_ShowDialogScript()[ERROR]: invalid type of the 5-th parameter (\"sound\"); \"string\" expected, got \"%s\"", type( sound ) )
		return false
	end

	local params = { portrait_id = portrait_id, name_text_id = name_text_id, text_id = text_id }
	if time_show then
		params[ "time" ] = time_show
	end

	if sound and sound ~= "" then
		if not IsSafeDialogResourcePath( sound ) then
			sys.log( "CL_ShowDialogScript()[ERROR]: invalid dialog sound path \"%s\"", sound )
			return false
		end

		if GetCurrentGameMode() == ai.Gameplay.PVE_MISSION or GetCurrentGameMode() == ai.Gameplay.FREE_SPACE then
			if UI:GetLanguage() == "RUSSIAN" then
				params[ "sound" ] = "ru_voice/vo/ru/" .. sound
			else
				params[ "sound" ] = "en_voice/vo/en/" .. sound
			end
		else
			params[ "sound" ] = sound
		end
	end

	--sys.log( "messageWithsound:   " )
	--sys.log( params[ "sound" ] )
	local dialogId = UI:ShowDialogScript( params )
	return dialogId
end

----------------------------------------------------------------------------------------------------------------
--**
--**             Сообщение в чат
--**
----------------------------------------------------------------------------------------------------------------
--#105583
-- клиентская функция показа диалога
function SV_AddLogMessage( player, messageType, textId, params )
--sys.out(params[1].name)
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	if Game_IsServer() then
		ServerLuaRpcEx( player_, "CL_AddLogMessage", messageType, textId, params )
	else
		CL_AddLogMessage( messageType, textId, params )
	end
end
--CL_AddLogMessage( 2, "ow_Ride_Complete", { { name = "player_winer", type = ai.GameMsgParamType.PLAYER_NAME, value = 0,},} ) --value c 0

function CL_AddLogMessage( messageType, textId, params )
	UI:AddLogMessage( messageType, textId, params )
end

----------------------------------------------------------------------------------------------------------------
--**
--**             Квест - таск - лог 
--**
----------------------------------------------------------------------------------------------------------------
--#105583
function SV_AddTask( player, textId, progress, icoType, personalId_ )-- return personalId 
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	if not personalId_ then
		personalId = personalId and ( personalId + 1 ) or 1	
	end
	local my_id = personalId_ and personalId_ or personalId
	if Game_IsServer() then
		ServerLuaRpcEx( player_, "CL_AddTask", textId, progress, icoType, my_id )
	else
		CL_AddTask( textId, progress, icoType, my_id )
	end
	return my_id
end

function CL_AddTask( textId, progress, icoType, personalId )
	--=UI:AddTask( "ow_Ride_Start", {cur = 3, max= 8} ,1 )
	if personalId then -- приходит ID уникальный для всех клиентов и сервера, сервер попросит удалить например по этому АйДи
		if not personalIdCont then -- создаем контейнер для ид   :-- индекс = personalId , значение = локальный ЭнтитиИд
			personalIdCont = {}
		end
		CL_RemoveTask( personalId )
		local id = UI:AddTask( textId, progress, icoType )
		personalIdCont[ personalId ] = id
	end
end


function SV_UpdateTask( player, progress, personalId )-- 
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	if personalId and progress then
		if Game_IsServer() then
			ServerLuaRpcEx( player_, "CL_UpdateTask", progress, personalId )
		else
			CL_UpdateTask( progress, personalId )
		end
	end
end


function CL_UpdateTask( progress, personalId )
	if personalId and personalIdCont and personalIdCont[ personalId ] and progress then
		UI:UpdateTask( personalIdCont[ personalId ], progress )
	end
end


function SV_RemoveTask( player, personalId )-- return personalId
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	if personalId then
		if Game_IsServer() then
			ServerLuaRpcEx( player_, "CL_RemoveTask", personalId )
		else
			CL_RemoveTask( personalId )
		end
	end
end


function CL_RemoveTask( personalId )
	if personalId and personalIdCont and personalIdCont[ personalId ] then
		UI:RemoveTask( personalIdCont[ personalId ] )
		personalIdCont[ personalId ] = nil
	end
end



----------------------------------------------------------------------------------------------------------------
--**
--**             Ауры
--**
----------------------------------------------------------------------------------------------------------------
-- накинуть ауру на кораблик
function AddAura( ship, auraName ) --, showNotify
	if ship and ship:GetName()  and auraName then
		--sys.concmd( "spell_cast " .. auraName .. " " .. ship:GetName() )  --SV_Pve_CastSpell() -- ship:GetDefName()
		--void SV_Pve_CastSpell( const char* spellDefName, i32 inflictorId, i32 casterId, Object target, Vec3 targetPos )
		--SV_Pve_CastSpell( auraName, ship:GetId(), ship:GetId(), ship, ship:GetPos() )
		return SV_GP_CastSpell( auraName, ship:GetId(), ship:GetId(), ship, ship:GetPos() )
	end
end

--снять ауру с кораблика (по дефу)
function RemoveAura( ship, auraName )
	if ship and ship:GetAppliedAuraCount() and auraName then 
		for i = 1, ship:GetAppliedAuraCount() do
			local aura = ship:GetAppliedAura( i - 1 )
			if aura and aura:GetSpellDefName() == auraName then
				aura:Remove()
				break
			end
		end
	end
end

--снять ауры с кораблика (по дефу)
function RemoveAuras( ship, auraName )
	if ship and ship:GetAppliedAuraCount() and auraName then 
		local isAuraExist = true
		while isAuraExist do
			isAuraExist = false
			for i = 1, ship:GetAppliedAuraCount() do
				local aura = ship:GetAppliedAura( i - 1 )
				if aura and aura:GetSpellDefName() == auraName then
					aura:Remove()
					isAuraExist = true
					break
				end
			end
		end
	end
end

-- почекать есть ли такой тип ауры на кораблике:
-- =Entities[607]:CheckAura(ai.Aura.SLOW_IMMUNE )
----------------------------------------------------------------------------------------------------------------
--**
--**             -- "Персональные" объекты (которые живут только  на единственном клиенте)
--**
----------------------------------------------------------------------------------------------------------------
function SV_SpawnPersonalEntity( player, posX, posY, posZ, DefName, dirX, dirY, dirZ, rot ) -- return personalId    , rot -- ротация нужна ли (модель неверно ориентирована)
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	personalId = personalId and ( personalId + 1 ) or 1
	if Game_IsServer() then
		ServerLuaRpcEx( player_, "CL_SpawnPersonalEntity", posX, posY, posZ, DefName, personalId, dirX, dirY, dirZ, rot )
	else
		CL_SpawnPersonalEntity( posX, posY, posZ, DefName, personalId, dirX, dirY, dirZ, rot )
	end
	return personalId
end
-- создание  Энтити на клиенте, которая живет только у него. но информация о personalId - есть и на клиенте и сервере--
function CL_SpawnPersonalEntity( posX, posY, posZ, defName, personalId, dirX, dirY, dirZ, rot )
	local ent = ai.Spawn( defName )
	if ent then
		if dirX then
			ent:SetPosDir( Vec3( posX, posY, posZ ), Vec3( dirX, dirY, dirZ ) )
			if rot then
				local r = ent:GetRot()
				ent:SetRot( r * Quat( 0.5, 0, 0, 0.5 ) ) 
			end
		else
			ent:SetPos( Vec3( posX, posY, posZ ) )
		end
		if Def[ defName ].setActivityonCreate then
			ent:SetActivity( Def[ defName ].setActivityonCreate )
		end
		if personalId then -- приходит ID уникальный для всех клиентов и сервера, сервер попросит удалить например по этому АйДи
			if not personalIdCont then -- создаем контейнер для ид   :-- индекс = personalId , значение = локальный ЭнтитиИд
				personalIdCont = {}
			end
			personalIdCont[ personalId ] = ent:GetId()
		end
	end
end
--Удаление энтити с специфическим персональным АйДи
function SV_RemovePersonalEntity( player, personalId )
	local player_ = player and player or ai.MAX_PLAYERS
	player_ = ( player_ < 0 ) and ai.MAX_PLAYERS or player_
	if Game_IsServer() then
		ServerLuaRpcEx( player_, "CL_RemovePersonalEntity", personalId )
	else
		CL_RemovePersonalEntity( personalId )
	end
end
function CL_RemovePersonalEntity( personalId )
	if personalId and personalIdCont and personalIdCont[ personalId ] then
		local ent = Entities[ personalIdCont[ personalId ] ]
		if ent then
			ent:Remove()
			personalIdCont[ personalId ] = nil
		end
	end
end


-----------------------------------------------
-- Квадрат расстояния Vec3
-----------------------------------------------
function SquareLen( p1, p2 )  --век3:LengthSq()
	return ( p1.x - p2.x ) * ( p1.x - p2.x ) + ( p1.y - p2.y ) * ( p1.y - p2.y ) + ( p1.z - p2.z ) * ( p1.z - p2.z )
end

--/scriptRunFile gamedata\designers_tools.lua
function designers:AddBot( def, pos, relationship, name, dir, params )
--sys.out("AddBot")
--[[
ai.AiOrder =
{	VITAL_POINT_ATTACK		= 0,
	VITAL_POINT_DEFEND		= 1,
	
	ENTITY_ATTACK			= 2,
	ENTITY_DEFEND			= 3,
	PLAYER_ATTACK			= 4,
	PLAYER_DEFEND			= 5,

	SQUAD_PURSUIT			= 6,
	SELF_DEFEND				= 7,

	MOVE					= 8,
	RETREAT					= 9,
	RETREAT_TO_POINT		= 10,}
--
ai.AiTargetType =
{	VITAL_POINT			= 0,
	ENTITY				= 1,
	POSITION			= 2,}
]]
	--определяем место спавна, pos может быть Vec3 или дистанция перед игроком, если ни то ни другое не определено то 0 карты.
	local pos1 = pos or 100 
	local dir_ =  dir and dir or Vec3( 0, 0, -1 )
	if type( pos1 ) ==  "number" then 
		local ship = CL_GetLocalPlayerShip( ) --опеределить свой корабль
		if ship then 
			pos1 = ship:GetPos() + ship:GetDir() * pos1
		else 
			pos1 = Vec3( 0, 0, 0 )
		end
	end
		
	-- что спавним.
	local def1 = def or "Ship_Race1_M_T5"
	local name1 = name or ""
	local relationship = relationship or ai.RelationshipGroups.Pirate

	local shipTestBalance = nil

	local aiSettings = ""
	if Def[def1].AiSettings then
		aiSettings = Def[def1].AiSettings
	end

	if cvars.sv_gameMode == ai.Gameplay.PVE_MISSION or cvars.sv_gameMode == ai.Gameplay.FREE_SPACE then

		local spawnSpeedAndEffect = params and params.spawnSpeedAndEffect and params.spawnSpeedAndEffect or false
		local alwaysVisible = true	
		if Def[def1].notAlwaysVisible then
			alwaysVisible = false
		end

		local warp =  AID.warp
		if params and params.disable_warp then
			warp = false
		end
		
		shipTestBalance = SV_SpawnNpc( def1, name1, aiSettings, relationship, pos1, dir_, warp, spawnSpeedAndEffect, alwaysVisible )
		
		if shipTestBalance then
			shipTestBalance:AI_EnableModules( false ) -- отключение модулей
			shipTestBalance:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, shipTestBalance )
		else
			sys.out( "WARNING designers:AddBot() failed creating mob ship: " .. def1 )
		end
		
		--	 выставляем значки красивые на крылья киберов  
		if shipTestBalance and  Def[ def1 ].tags and table.find( Def[ def1 ].tags, "cyber" ) then
			--(не работает тут так как корабли видимо еще не существует, надо делать "пост лоадинг")
			--shipTestBalance:EquipDecal( ai.VesselCustomSlot.STICKER_0, "precursor_elit2" )
			shipTestBalance:SetVesselCustomElement( "Precursor_elite", ai.VesselCustomSlot.STICKER_0 ) -- это надо по сети проверить
		end

	else

		--local doSpawnWarm = AID.warp
		local spawnSpeedAndEffect = false
		local alwaysVisible = true
		local warp = false

		shipTestBalance = SV_SpawnNpc(def1, name1, aiSettings, relationship, pos1, dir_, warp, spawnSpeedAndEffect, alwaysVisible )
		--shipTestBalance = SpawnSpaceShip( def1, name1, true )  -- 3ий параметр есть/нет физика  -- У Максима что то не работает по сети  но видимо где то она лучше чем SV_SpawnNpc
		
		if shipTestBalance then 
			shipTestBalance:SetRelationshipGroup( relationship ) --сменить релейшеншип			
			shipTestBalance:SetPosDir( pos1, dir_ ) 
			if Def[def1].AiSettings then
				shipTestBalance:AI_LoadAiSettings( Def[def1].AiSettings )
			end
			shipTestBalance:AI_Enable( true )
			shipTestBalance:AI_EnableModules( false ) -- отключение модулей
			shipTestBalance:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, shipTestBalance )
			--shipTestBalance:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, pos1 )
		else 
			sys.out( "WARNING designers:AddBot() failed creating mob ship: " .. def1 )
		end
	
	end
	
	return shipTestBalance
end

--создаем пак из кораблей units, вокруг точки pos (или перед игроком), через designers:AddBot,  возвращаем таблицу кораблей
function designers:AddPack( units, pos, relationship, name, dir, params )
	if lua_debug then sys.out("AddPack") end
	local res = nil
	local pos1 = pos or 100 
	local name_ =  name and name or nil
	if type( pos1 ) ==  "number" then 
		local ship = CL_GetLocalPlayerShip( ) --опеределить свой корабль
		if ship then 
			pos1 = ship:GetPos() + ship:GetDir() * pos1
		else 
			pos1 = Vec3( 0, 0, 0 )
		end
	end
	if units and type( units ) == "table" then 
		res = {}
		local t_pos = {
			Vec3( 0, 0, 0 ), -- *3
			Vec3( 10, 0, 0 ),
			Vec3( -10, 0, 0 ),
			Vec3( 0, 10, 0 ),
			Vec3( 0, -10, 0 ),
			Vec3( 0, 0, 10 ),
			Vec3( 0, 0, -10 ),
			Vec3( 10, 0, 10 ),
			Vec3( -10, 0, -10 ),
			Vec3( 10, 0, -10 ),
			Vec3( -10, 0, 10 ),
		}
		for i, v in pairs ( units ) do
			local pos_ = i <= #t_pos and ( pos1 + 3 * t_pos[ i ] ) or ( pos1 + Vec3( 12 * ( i - #t_pos ), 5, 5 ) )
			local my_name = name_ and name_ .. tostring( i ) or nil
			res[ i ] = designers:AddBot( v, pos_, relationship, my_name, dir, params )
		end
	end
	return res
end

function designers:AddPackInAID( pack, avt_table, params ) -- список ссылок на корабли, список автоматов поведения этих кораблей | возвращает список id кораблей
	--[[params = { 
		automatConfig = { массив настроек каждого моба 
			[1] = config,
			...
			numMobs
		} , 
		common_states = { 
			buffByNumPlayers = true -- параметры которые войдут во всех ботов ("как есть" дополнится их таблицы) 
		},
		additional_behaviors = {
			{name = "DefendShip", high_priority = true }, 
			{name = "FlyRoute"}, 
			{name = "EscapeByPortal"},
		},
		}	]]
	if AID and pack and type( pack ) == "table" then
		AID.max_packId = AID.max_packId + 1
		AID.packs[ AID.max_packId ] = {}
		local res = {} -- результат как ид добавленных кораблей в системе игры
		local res2 = {} -- результат как ссылки на мобов в системе AID напрямую боты, а не ссылки на их контейнер
		local automatConfig = params and params.automatConfig or nil
		local common_states = params and params.common_states or nil  -- параметры которые будут выданы всем ботам как параметр конфигурирования первого уровня  
		--например common_states = { buffByNumPlayers = true }, 
		for i, ship in pairs( pack ) do 
			if ship and ship:GetId() then
				-- выбираем автомат - или тот что пришел в функцию или тот что был в дефе или Avt.Pack_Dive
				-- по умолчанию включаем в бота поведение "ныряющий пак", потом надо будет смотреть какое поведение приходит вторым параметром				
				local avt = ( avt_table and avt_table[ i ] ) or ( Def[ ship:GetDefName() ].avtomat and Avt[Def[ ship:GetDefName() ].avtomat] ) or Avt.Pack_Dive 
				
--Обработка составных автоматов
				-- то есть берем базовый автомат атаки "искать цель"+"налет со стрельбой"+"отступление", потом накручиваем доп логику из:
				--  params.additional_behaviors = { {name = "DefendShip", high_priority = true }, {name = "FlyRoute"}, {name = "EscapeByPortal"} } 
				-- бехевиары которыми дополняем основной автомат. порядок важен, последовательно выполняем
				-- name -- имя автомата но берем только 1 бехевиор Avt[name][1] 
				-- high_priority - в начало автомата, иначе в конец
				-- другие настройки бехевиаров только через параметры, таблицы не множим и не засоряем
				--  переход обратно в состояние 1, 2  
				if params and params.additional_behaviors and type( params.additional_behaviors ) == "table" then -- автомат составной
					local avt_name = ""
					--исходное имя(индекс) базового автомата???
					for ind_aut, automat in pairs( Avt ) do  -- после этого цикла в avt_name = исходное имя автомата, которое пришло снаружи 
						if avt == automat then
							avt_name = ind_aut
							break
						end
					end
					-- делаем реальный новый индекс, с учетом доп бехевиоров
					for aai, aa in pairs( params.additional_behaviors ) do
						avt_name = avt_name .. "_" .. aa.name
					end
					if not Avt[ avt_name ] then  -- такого автомата реально нет! Надо создавать новый
						local next_behavior_low_prior = {} -- тут номера бехевиоров которые вставим в конец списка next_behavior
						local next_behavior_hi_prior = {} -- тут номера бехевиоров которые вставим в начало списка next_behavior
						Avt[ avt_name ] = sys.new( avt ) -- копируем "базовый автомат"
						for aai, aa in pairs( params.additional_behaviors ) do
							assert( Avt[ aa.name ], string.format( "Not found automat description with name %s in table Avt (automats.lua)", aa.name ) )
							local behavior = sys.new( Avt[ aa.name ][ 1 ] )
								--behavior.next_behavior = { 1, 2 }  -- вставляем из бехевиора переход сначала в базовые положения (обычно выбор врага и полет)
							behavior.next_behavior = sys.new( avt[ 1 ].next_behavior )  -- вставляем из бехевиора переход сначала в базовые положения (обычно выбор врага и полет)
							table.insert( Avt[ avt_name ], behavior ) -- вставляем доп бехевиор в наш новый автомат
							if aa.high_priority then -- каким образом будем попадать в наш бехевиор - в первую очередь или по остаточному принципу.
								table.insert( next_behavior_hi_prior, #Avt[ avt_name ] )
							else
								table.insert( next_behavior_low_prior, #Avt[ avt_name ] )
							end
						end
						-- вписываем в next_behavior полныее цепочки приоритетов
						for bi, behavior in pairs( Avt[ avt_name ] ) do
							behavior.next_behavior_ = sys.new( next_behavior_hi_prior ) -- сначала хай приорити
							for nbi, nb in pairs( behavior.next_behavior ) do -- потом то что было до нас 
								table.insert( behavior.next_behavior_, nb )
							end
							for nbi, nb in pairs( next_behavior_low_prior ) do -- потом лоу приорити
								table.insert( behavior.next_behavior_, nb )
							end
							behavior.next_behavior = behavior.next_behavior_
							behavior.next_behavior_ = nil
						end
					end
					avt = Avt[ avt_name ]  -- продолжаем с новым автоматом (или существовавшим старым)
				end
				
				local config = automatConfig and automatConfig[ i ] or  nil
				--регистрируем бота текущего
				local bot = { 
								entityId = ship:GetId(), 
								maxSpeed = ship:GetMaxSpeed(), 
								defName = ship:GetDefName(), 
								packId = AID.max_packId, 
								avt = avt, 
								healthMax = ship:GetMaxHealth(), 
								isDead = false, 
								config = config, 
								spawn_timer = TimerGetGameTime(),  
								isHideSpot = Def[ ship:GetDefName() ].isHideSpot,  
							}
				if common_states then -- параметры бота заданные снаружи
					for sInd, state in pairs( common_states ) do
						bot[ sInd ] = state
					end 
				end
				if AID.GameMode == ai.Gameplay.FREE_SPACE then
					bot.agroTable = {}
				end
				
				table.insert( AID.bots, bot )
				table.insert( res2, bot )
				table.insert( res, ship:GetId() )
				--регистрируем паки
				table.insert( AID.packs[ AID.max_packId ], { ship:GetId(), bot.maxSpeed } )
				
				-- записываем-регистрируем таги корабля 
				if Mission and Mission.AddDefaultTags then
					Mission:AddDefaultTags( bot.entityId, ship )
				end
				
				--регистрируем модули
				for i = 5, 8 do  -- активные модули 1-4
					local m = ship:GetModule( i )
					--sys.out( tostring(i) )
					if m and m:GetDefName() and Def[m:GetDefName()].AIRules then 
						if lua_debug then sys.out( "Module add to AID: " .. m:GetDefName() ) end
						table.insert( AID.modules, { shipId = ship:GetId(), moduleN = i, AIRules = Def[m:GetDefName()].AIRules, update_time = 0, bot = AID.bots[#AID.bots] } )
					end
				end
			end
		end

		table.sort ( AID.packs[ AID.max_packId ], function( k1, k2 ) return tostring( k1[2]) < tostring(k2[2]) end ) --sorting 
		-- убираем скорость
		local t = {}
		for i, v in pairs( AID.packs[ AID.max_packId ] ) do 
			t[ i ] = v[ 1 ] -- убираем скорость
		end
		AID.packs[ AID.max_packId ] = t
		return res, res2
	end
end

function designers.EntityRemove( entityId, withBlast )
	local entity = assert( Entities[ entityId ], string.format( "Cannot get entity with id %s!", entityId ) )
	if withBlast then
		local name = entity:GetName()
		sys.concmd( "e_event " .. name .. " EmitDeathEffectAndRemove" )
	else
		entity:Remove()
	end
end

function designers:SafeRemove( id )
	local ent = Entities[ id ]
	if ent then
		designers:ScriptDeathEntity( ent ) -- Если надо создать посмертный эффект/модель, для удаляемой сущности то можно вписать в ScriptDeathEntity
	end
	return ent and ent:Remove() or nil
end


function designers:ScriptDeathEntity( dieEntity )
	-- Если надо создать посмертный эффект/модель, для удаляемой сущности то можно вписать в ScriptDeathEntity
	local def = dieEntity:GetDefName()
	if def and Def[ def ] and Def[ def ].scriptDeathEntity then 
		local scriptDeathEnt = ai.Spawn( Def[ def ].scriptDeathEntity )
		if scriptDeathEnt then 
			scriptDeathEnt:SetRot( dieEntity:GetRot() )
			scriptDeathEnt:SetPos( dieEntity:GetPos() )
		end
	end
end

function designers.RunOnClient( clientId, command, ... )
	if not ( type( clientId ) == "number" ) then
		error( "Client ID must be number!" )
	end
	if not ( type( command ) == "string" ) then
		error( "Command must be string!" )
	end
	if not Game_IsServer() then
		error( "This command only valid at server side!" )
	end
	return ServerLuaRpc( { command, ... }, clientId )
end

function designers.RunOnServer( command, ... )
	if not ( type( command ) == "string" ) then
		error( "Command must be string!" )
	end
	if not Game_IsClient() then
		error( "This command only valid at client side!" )
	end
	return ClientLuaRpc( { command, ... } )
end

function designers.RunOnAllClients( command, ... )
	return designers.RunOnClient( ai.MAX_PLAYERS, "designers.RunOnHostProtected", command, ... )
end

function designers.RunLuaSynced( command, ... )
	if Game_IsClient() then
		designers.RunOnServer( "designers.RunOnAllClients", command, ... )
	elseif Game_IsServer() then
		designers.RunOnAllClients( command, ... )
	else
		designers.RunOnHostProtected( command, ... )
	end
end

function designers.RunOnHost( command, ... )
	if not ( type( command ) == "string" ) then
		error( "Command must be string!" )
	end
	if Game_IsClient() then
		designers.RunOnServer( command, ... )
	else
		designers.RunOnHostProtected( command, ... )
	end
end

function designers.RunOnHostProtected( command, ... )
	if not ( type( command ) == "string" ) then
		error( "Command must be string!" )
	end
	local func = loadstring( "return " .. command )
	local _, pFunc = pcall( func )
	if pFunc then
		pcall( pFunc, ... )
	end
end

function designers.Quat2Vec( quat )
	return Vec3( VecRot3( quat, Vec3( 0, 0, -1 ) ) )
end

designers.ControllableDummy = {}

-- Конструктор объекта
local ControllableDummy_Meta = {}
function ControllableDummy_Meta:__call( def, relationship, posOrEntity, rotOrIsInherited )
	-- Проверки
	local def = def or "Ship_Default"
	local relationship = relationship or ai.RelationshipGroups.Default
	
	local pos = posOrEntity or Vec3( 0, 0, 0 )
	local rot = rotOrIsInherited or Quat( 0, 0, 0, 1 )
	
	local entity = posOrEntity
	local inheritRotFromEnt = rotOrIsInherited
	
	if type( entity ) == "number" then
		entity = Entities[ entity ]
		if not entity then
			error( string.format( "Entity with id %i missing!", entity ) )
		end
	end
	
	if type( entity ) == "userdata" and getmetatable( entity ).GetPos then
		local ePos = entity:GetPos()
		local eDir = entity:GetDir()
		pos = ePos + eDir * 50
	end
	
	if inheritRotFromEnt == true then
		rot = entity:GetRot()
	end
	
	pos = Vec3( pos )
	rot = Quat( rot )
	
	local shipEntity = SV_SpawnNpc( def, "", "", relationship, pos, Vec3( 1, 0, 0 ), false, false, false )

	if not shipEntity then
		error( string.format( "Invalid def %q!", def ) )
	end
	
	shipEntity:SetRot( rot )

	local ship =
	{
        entityId = shipEntity:GetId(),
		aiEnabled = false,
	}
	
	-- Работа функций из designers.ControllableDummy
	setmetatable( ship, { __index = self } )
	
	ship:Reset()
	
	return ship
end
setmetatable( designers.ControllableDummy, ControllableDummy_Meta )

function designers.ControllableDummy:Reset()	
	local entity = Entities[ self.entityId ]
    entity:AI_Enable( false )
	entity:AI_EnableModules( false )
	entity:AI_EnablePrimaryWeapon( false )
	return true
end

function designers.ControllableDummy:EnableAI()	
	local entity = Entities[ self.entityId ]
    entity:AI_Enable( true )
	return true
end

function designers.ControllableDummy:Equip( def, slot )
	local def = assert( def, "Def required!" )
	local module_type = Def[ def ] and Def[ def ].module_type or def.type
	if not module_type and not slot then
		error( "Slot required, cannot get default slot for unknown module type!" )
	end
	local slot = slot
	
	if not slot then
		for mSlot, mType in pairs( ai.ModuleTypeOf ) do
			if not ( mSlot == "NUM" ) and module_type == mType then
				slot = mSlot
				break
			end
		end
	end
	
	if not slot then
		error( string.format( "Slot required, cannot get default slot for %i module type!", module_type ) )
	end
	
	local entity = Entities[ self.entityId ]
    entity:EquipModule( slot, def )
	return slot
end

function designers.ControllableDummy:Attack( entityOrId )
	local targetEntity = assert( entityOrId, "Entity or EntityId required!" )
	if type( targetEntity ) == "number" then
		local targetEntity = Entities[ targetEntity ]
		if not targetEntity then
			error( string.format( "Entity with id %i missing!", targetEntity ) )
		end
	end
	
	local entity = Entities[ self.entityId ]
	
	self.aiEnabled = true,
	
	entity:AI_Enable( self.aiEnabled )
	entity:AI_EnablePrimaryWeapon( true )
	entity:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, entity )
	entity:AI_Attack( targetEntity )
	
	return true
end

function designers.ControllableDummy:StopAttack()
	local entity = Entities[ self.entityId ]

	entity:AI_EnablePrimaryWeapon( false )
	
	return true
end

function designers.ControllableDummy:MoveTo( posOrEntity )
	local pos = posOrEntity
	local targetEntity = posOrEntity
	
	if type( targetEntity ) == "number" then
		targetEntity = Entities[ targetEntity ]
		if not targetEntity then
			error( string.format( "Entity with id %i missing!", targetEntity ) )
		end
	end
	
	if type( targetEntity ) == "userdata" and targetEntity.GetPos then
		pos = targetEntity:GetPos()
	end
	
	pos = Vec3( pos )
	
	local entity = Entities[ self.entityId ]

	self.aiEnabled = true,
	
	entity:AI_Enable( self.aiEnabled )
	entity:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, pos )
	
	return true
end

function designers.ControllableDummy:StopMoving()
	local entity = Entities[ self.entityId ]

	local pos = entity:GetPos()
	
	entity:AI_Enable( true )
	entity:AI_NewOrderPos( ai.AiOrder.MOVE, ai.AiTargetType.POSITION, pos )
	entity:AI_Enable( self.aiEnabled )
	
	return true
end

function designers.ControllableDummy:UseModule( defOrSlot, entityOrId )
	local defOrSlot = assert( defOrSlot, "Def or module slot required!" )
	local slot = defOrSlot
	local targetEntity = entityOrId
	if type( targetEntity ) == "number" then
		local targetEntity = Entities[ targetEntity ]
		if not targetEntity then
			error( string.format( "Entity with id %i missing!", targetEntity ) )
		end
	end
	
	local entity = Entities[ self.entityId ]
	
	if type( defOrSlot ) == "string" then
		for mSlotName, mSlot in pairs( ai.SpaceShipModuleSlot ) do
			if not ( mSlotName == "NUM" ) then
				local mod = entity:GetModule( mSlot )
				if mod and ( mod:GetDefName() == defOrSlot ) then
					slot = mSlot
					break
				end
			end
		end
	end
	
	if not ( type( slot ) == "number" ) then
		error( string.format( "Invalid slot number %q!", slot ) )
	end
	
	if entityOrId then
		if not ( type( targetEntity ) == "userdata" ) then
			error( "Entity must be Entity or EntityId!" )
		end
		entity:AI_Enable( true )
		entity:AI_EnableModules( true )
		entity:AI_NewOrder( ai.AiOrder.SELF_DEFEND, ai.AiTargetType.ENTITY, entity )
		entity:AI_Attack( targetEntity )
		local result = entity:AI_ActivateModule( slot )
		entity:AI_Enable( self.aiEnabled )
		return result
	elseif slot == ai.SpaceShipModuleSlot.SPECIAL then
		return entity:SV_ActivateSpecial()
	else
		return entity:SV_ActivateModule( slot )
	end
end

function designers.ControllableDummy:StopUsingModule()
	local entity = Entities[ self.entityId ]
	
	entity:AI_EnableModules( false )
	
	return true
end

function designers.GenerateMul( value )
--	Base formula:
--
--	if( mod < 0 ) then
--		newValue = baseValue / ( 1 - mod )
--	else
--		newValue = baseValue * ( 1 + mod )
--	end

	if value < 0 then
		return 1 - value
	else
		return value - 1
	end
end

function designers:IsCargo( defName )
	if not Def[ defName ] then
		sys.log( "designers:IsCargo(): Invalid def %s", defName )
	end

	local class = Def[ defName ].class
	if ( ( class == "CargoShip" ) or ( class == "PathMovementEntity" ) ) then
		return true
	else
		return false
	end
end

function designers:GetCargoMaxSpeed( defName )
	if not designers:IsCargo( defName ) then
		sys.log( "designers:GetCargoMaxSpeed(): def %s is not a cargo", defName )
	end

	local speed = Def[ defName ].max_lin_speed
	return speed or 0
end

function designers:AddCargo( def, pos, rot, relationship, name, params )
	--определяем место спавна, pos может быть Vec3 или дистанция перед игроком, если ни то ни другое не определено то 0 карты.
	local pos1 = pos or 100 
	local rot1 = rot and rot or Quat( 0, 0, 0, -1 )
	if type( pos1 ) ==  "number" then 
		local ship = CL_GetLocalPlayerShip( ) --опеределить свой корабль
		if ship then 
			pos1 = ship:GetPos() + ship:GetDir() * pos1
		else 
			pos1 = Vec3( 0, 0, 0 )
		end
	end
		
	-- что спавним.
	local def1 = def or "CargoShip"
	local name1 = name or ""
	local relationship = relationship or ai.RelationshipGroups.Pirate

	local shipTestBalance = nil
	
	if not designers:IsCargo( def1 ) then
		sys.out( "WARNING designers:AddCargo() def is not a cargo: " .. def1 )
		return shipTestBalance
	end

	local alwaysVisible = true	
	if Def[def1].notAlwaysVisible then
		alwaysVisible = false
	end

	local warp = true
	if params and params.disable_warp then
		warp = false
	end
	
	local collision_check = false
	if params and params.collision_check then
		collision_check = true
	end
	
	shipTestBalance = ai.Spawn( def1, name1 ) --SV_SpawnNpc( def1, name1, aiSettings, relationship, pos1, dir_, warp, spawnSpeedAndEffect, alwaysVisible )
	
	if shipTestBalance then
		
		if collision_check and CheckOverlapAabb( shipTestBalance, pos1, rot1 ) then
			shipTestBalance:Remove()
			return nil
		end
		
		shipTestBalance:SetRelationshipGroup( relationship )
		shipTestBalance:SetPos( pos1 )
		shipTestBalance:SetRot( rot1 )
		shipTestBalance:AlwaysVisible( alwaysVisible )
		if warp then
			SV_EmitWarpEffect( shipTestBalance, true )
		end
	else
		sys.out( "WARNING designers:AddCargo() failed creating cargo: " .. def1 )
	end
	
	return shipTestBalance
end

function designers.getTableMax( tbl )

	if not ( type( tbl ) == "table" ) then
		error("designers.getTableMax: tbl must be table!")
	end
	
	local max_element = next( tbl )
	if not max_element then
		return nil
	end
	
	for _, element in pairs( tbl ) do
		if element > max_element then
			max_element = element
		end
	end
	
	return max_element
end

function designers.getTableMin( tbl )

	if not ( type( tbl ) == "table" ) then
		error("designers.getTableMax: tbl must be table!")
	end
	
	local min_element = next( tbl )
	if not min_element then
		return nil
	end
	
	for _, element in pairs( tbl ) do
		if element < min_element then
			min_element = element
		end
	end
	
	return min_element
end

function designers:Val2Key( t, val )

	for k, v in pairs( t ) do
	    if v == val then
			return k
		end
	end	

	return ""

end


--убрать музыкальный плейлист
function CL_StopPlaylist()
	sys.concmd( "s_musicStop" )
	return true
end

--установить музыкальный плейлист
function CL_SetPlaylist( playlist )
	if type( playlist ) ~= "string" then
		sys.log( "CL_SetPlaylist()[ERROR]: invalid playlist type \"%s\"", type( playlist ) )
		return false
	end

	if not Music[ playlist ] then
		sys.log( "CL_SetPlaylist()[ERROR]: playlist \"%s\" not found", playlist )
		return false
	end

	if not string.find( playlist, "^[%w_%-]+$" ) then
		sys.log( "CL_SetPlaylist()[ERROR]: invalid playlist name \"%s\"", playlist )
		return false
	end

	sys.concmd( "s_musicPlay " .. playlist )
	return true
end

--сбросить музыкальный плейлист
function CL_ResetPlaylist()
	local playlist = nil
	
	if GetCurrentGameMode() == ai.Gameplay.FREE_SPACE then
		local spaceZoneId = CL_GetCurrentSpaceZoneId()
		local spaceZone = spaceZoneId and SpaceZoneById[ spaceZoneId ]
		playlist = spaceZone and spaceZone.playlist
	elseif GetCurrentGameMode() == ai.Gameplay.PVE_MISSION then
		playlist = "PveMusic" --todo: дописать получение плейлиста
	end
	
	if playlist then
		return CL_SetPlaylist( playlist )
	else
		return CL_StopPlaylist()
	end
end

--убрать музыкальный плейлист
function SV_StopPlaylist( playerId )
	if Game_IsServer() then
		ServerLuaRpcEx( playerId, "CL_StopPlaylist" )
	else
		CL_StopPlaylist()
	end
end

--установить музыкальный плейлист
function SV_SetPlaylist( playerId, playlist )
	if Game_IsServer() then
		ServerLuaRpcEx( playerId, "CL_SetPlaylist", playlist )
	else
		CL_SetPlaylist( playlist )
	end
end

--сбросить музыкальный плейлист
function SV_ResetPlaylist( playerId )
	if Game_IsServer() then
		ServerLuaRpcEx( playerId, "CL_ResetPlaylist" )
	else
		CL_ResetPlaylist()
	end
end

--установить ремап
function CL_SetColorRemap( path )
	if type( path ) ~= "string" then
		sys.log( "CL_SetColorRemap()[ERROR]: invalid type of the 1-st parameter (\"path\"); \"string\" expected, got \"%s\"", type( path ) )
		return false
	end

	if path ~= "" then
		local normalizedPath = string.gsub( path, "\\", "/" )
		if string.find( normalizedPath, "%.%." ) or string.find( normalizedPath, ":" ) or not string.find( normalizedPath, "^textures/posteffects/" ) then
			sys.log( "CL_SetColorRemap()[ERROR]: invalid color remap path \"%s\"", path )
			return false
		end
	end

	SetCvarValue( "env_colorremapTexture", path )
	return true
end

--сбросить ремап
function CL_ResetColorRemap()
	local path = EnvSetting and EnvSetting.colorRemapTexName or ""
	
	return CL_SetColorRemap( path )
end

--установить ремап
function SV_SetColorRemap( playerId, path )
	if Game_IsServer() then
		ServerLuaRpcEx( playerId, "CL_SetColorRemap", path )
	else
		CL_SetColorRemap( path )
	end
end

--сбросить ремап
function SV_ResetColorRemap( playerId )
	if Game_IsServer() then
		ServerLuaRpcEx( playerId, "CL_ResetColorRemap" )
	else
		CL_ResetColorRemap()
	end
end