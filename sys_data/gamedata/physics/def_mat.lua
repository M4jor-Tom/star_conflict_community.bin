-- ----------------------------------------------------------------------------
--
-- Created: 13-Nov-2006
-- Copyright © 2006, Targem LLC. All rights reserved.
--
-- Do not add other material here! Add own material to materials.lua
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

--	Так считается в bullet:
--
--	inline btScalar	calculateCombinedFriction(const btCollisionObject* body0,const btCollisionObject* body1)
--	{
--		btScalar friction = body0->getFriction() * body1->getFriction();
--
--		const btScalar MAX_FRICTION  = btScalar(10.);
--		if (friction < -MAX_FRICTION)
--		friction = -MAX_FRICTION;
--		if (friction > MAX_FRICTION)
--		friction = MAX_FRICTION;
--		return friction;
--	}

--	inline btScalar	calculateCombinedRestitution(const btCollisionObject* body0,const btCollisionObject* body1)
--	{
--		return body0->getRestitution() * body1->getRestitution();
--	}


-- ---------------------------------------
-- Default scene material
-- ---------------------------------------
phys_mats.default =
{
	friction					= 0.6,
	restitution					= 0.5,
}

-- ---------------------------------------
-- Car material
-- ---------------------------------------
phys_mats.Car =
{
	friction					= 0.05,
	restitution					= 0.0,
}


-- ---------------------------------------
-- SpaceShip material
-- ---------------------------------------
phys_mats.space_ship =
{
	friction					= 0.0,
	restitution					= 1.0,
}


-- ---------------------------------------
-- Swarm material
-- ---------------------------------------
phys_mats.swarm =
{
	friction					= 0.0,
	restitution					= 1.0,
}
