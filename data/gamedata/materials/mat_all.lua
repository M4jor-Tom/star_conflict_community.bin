-- ------------------------------------------------------------------------
-- описание всех материалов в игре. подробнее см. mat_default.lua
-- ------------------------------------------------------------------------

-- Бетон. Concrete. Возможно, понадобится для всяких заброшенных конструкций.
Materials.Concrete = sys.new( Materials.Default )
--Materials.Concrete.vehicle_collision_sound = "ground_collision"

-- Рой. Swarm. 
Materials.Swarm = sys.new( Materials.Default )
Materials.Swarm.phys = phys_mats.swarm
Materials.Swarm.scratch_effect = "particles/materials/rock_scratch"
Materials.Swarm.railgun = { sound = "sound/hit/railgun-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.Swarm.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.Swarm.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/ship_hull_hit",}
Materials.Swarm.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.Swarm.scratch_sound = "sound/collision/silence"
Materials.Swarm.vehicle_collision_sound = "sound/collision/silence"
Materials.Swarm.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Swarm.rocket = { sound = "sound/collision/silence", particle_effect = "particles/materials/ship_hull_hit", }
Materials.Swarm.singularity = { sound = "sound/hit/singularity-common", particle_effect = "particles/materials/ship_hull_hit", }
Materials.Swarm.laser = { particle_effect = "particles/materials/ship_hull_hit", } 
Materials.Swarm.crystal_shard[ "particle_effect" ] =  "particles/materials/ship_hull_hit" 
Materials.Swarm.crystal_shard	= { sound = "sound/hit/railgun-ShipMetalMk1", }
Materials.Swarm.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Swarm.flygun = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.Swarm.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }

-- Скальная порода. Rock. Тип астероида.
Materials.Rock = sys.new( Materials.Default )
Materials.Rock.scratch_effect = "particles/materials/rock_scratch"
Materials.Rock.railgun = { sound = "sound/hit/railgun-Rock", particle_effect = "particles/materials/rock_hit",}
Materials.Rock.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/weapons/plasma/plasma_asteroid_hit",}
Materials.Rock.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/weapons/plasma/plasma_asteroid_hit",}
Materials.Rock.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/weapons/laser/lasersniper_asteroid_hit",}
Materials.Rock.scratch_sound = "sound/collision/scratch_rock"
Materials.Rock.vehicle_collision_sound = "sound/collision/ShipMetalMk1_rock"
Materials.Rock.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Rock.rocket = { sound = "sound/hit/rocket-rock", particle_effect = "particles/materials/rock_rocket_hit", }
Materials.Rock.singularity = { sound = "sound/hit/singularity-common", particle_effect = "particles/materials/rock_rocket_hit", }
Materials.Rock.laser = { particle_effect = "particles/weapons/laser/laser_asteroid_hit", } 
Materials.Rock.crystal_shard[ "particle_effect" ] =  "particles/materials/rock_hit" 
Materials.Rock.crystal_shard	= { sound = "sound/hit/railgun-Rock", }
Materials.Rock.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Rock.flygun = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/weapons/flygun/explode",}
Materials.Rock.empfire = { particle_effect = "particles/gadget/damage_emp_fire", sound = "sound/hit/flame_common",}
Materials.Rock.Ice_hit = { sound = "sound/hit/railgun-Rock", }

-- Лёд твердый трескающийся. Ice. Возможно, потребуется для каких-то астероидов или замороженных объектов.
Materials.Ice = sys.new( Materials.Default )
Materials.Ice.scratch_effect = "particles/materials/ice_scratch"
Materials.Ice.vehicle_collision_sound = "sound/collision/ShipMetalMk1_rock"
Materials.Ice.scratch_sound = "sound/collision/scratch_rock"
Materials.Ice.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Ice.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ice_hit", }
Materials.Ice.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/ice_hit", }
Materials.Ice.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ice_hit", }
Materials.Ice.railgun = { sound = "sound/hit/railgun-ice", particle_effect = "particles/materials/ice_hit", }
Materials.Ice.rocket = { sound = "sound/hit/rocket-rock", particle_effect = "particles/materials/ice_rocket_hit", }
Materials.Ice.singularity = { sound = "sound/hit/singularity-common", particle_effect = "particles/materials/ice_rocket_hit", }
Materials.Ice.crystal_shard[ "particle_effect" ] = "particles/materials/ice_hit" 
Materials.Ice.crystal_shard	= { sound = "sound/hit/railgun-ice", }
Materials.Ice.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Ice.flygun = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ice_hit", }
Materials.Ice.empfire = { particle_effect = "particles/gadget/damage_emp_fire", sound = "sound/hit/flame_common",}
Materials.Ice.Ice_hit = { sound = "sound/hit/railgun-ice", }


--Materials.Ice.vehicle_collision_sound = "ground_collision"


-- Техническое покрытие. TechnoPlex. Очень плотный резинопластик. Часть покрытия каких-то взлетных полос или еще чего-то.
Materials.TechnoPlex = sys.new( Materials.Default )
--Materials.TechnoPlex.vehicle_collision_sound = "ground_collision"


-- Железо, чугун. Iron. Плотное некачественное железо для каких-то заброшенных больших конструкций и тому подобного.
Materials.Iron = sys.new( Materials.Default )
Materials.Iron.plasma  = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Iron.lasersniper  = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Iron.railgun = { sound = "sound/hit/railgun-ShipMetalMk1", }
Materials.Iron.scratch_sound = "sound/collision/scratch_iron"
Materials.Iron.collision_sound = 'sound/collision/ShipMetalMk1'
Materials.Iron.vehicle_collision_sound = "sound/collision/ShipMetalMk1"
Materials.Iron.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Iron.singularity = { sound = "sound/hit/singularity-common", }
Materials.Iron.crystal_shard	= { sound = "sound/hit/crystal-metal", }
Materials.Iron.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Iron.flygun  = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Iron.empfire = { particle_effect = "particles/gadget/damage_emp_fire", sound = "sound/hit/flame_common",}
Materials.Iron.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }


-- Тонкий металл. ThinMetal. Пустые концструкции из тонкого металла, рвущиеся и звенящие при попадании.
Materials.ThinMetal = sys.new( Materials.Default )
--Materials.ThinMetal.collision_sound = "barrel_collision"
--Materials.ThinMetal.vehicle_collision_sound = "barrel_collision"


-- Корабельный металл типа 1. ShipMetalMk1. Металл, из которого изготавливаются корпуса кораблей. Для легких кораблей. Слегка звенящий.
Materials.ShipMetalMk1 = sys.new( Materials.Default )
Materials.ShipMetalMk1.phys = phys_mats.space_ship
Materials.ShipMetalMk1.collision_sound = "sound/collision/ShipMetalMk1"
Materials.ShipMetalMk1.vehicle_collision_sound = "sound/collision/ShipMetalMk1"
Materials.ShipMetalMk1.plasma  = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk1.lasersniper  = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk1.railgun = { sound = "sound/hit/railgun-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk1.scratch_sound = "sound/collision/scratch_MetalMk1"
Materials.ShipMetalMk1.disintegrator = { sound = "sound/hit/disintegrator_hit",}
Materials.ShipMetalMk1.crystal_shard	= { sound = "sound/hit/crystal-metal", }
Materials.ShipMetalMk1.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
--Materials.ShipMetalMk1.rocket = { sound = "", }
Materials.ShipMetalMk1.flygun  = { sound = "sound/hit/plasma-ShipMetalMk1",}
Materials.ShipMetalMk1.empfire = { particle_effect = "particles/materials/ship_hull_hit", sound = "sound/hit/flame_common",}
Materials.ShipMetalMk1.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }


-- Корабельный металл типа 2. ShipMetalMk2. Металл, из которого изготавливаются корпуса кораблей. Для средних кораблей кораблей. Плотный, скрежущий звук попаданий и на разрыв.
Materials.ShipMetalMk2 = sys.new( Materials.Default )
Materials.ShipMetalMk2.phys = phys_mats.space_ship
Materials.ShipMetalMk2.collision_sound = "sound/collision/ShipMetalMk1"
Materials.ShipMetalMk2.vehicle_collision_sound = "sound/collision/ShipMetalMk1"
Materials.ShipMetalMk2.railgun = { sound = "sound/hit/railgun-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk2.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk2.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk2.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk2.scratch_sound = "sound/collision/scratch_MetalMk1"
Materials.ShipMetalMk2.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.ShipMetalMk2.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.ShipMetalMk2.crystal_shard	= { sound = "sound/hit/crystal-metal", }
Materials.ShipMetalMk2.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }

--Materials.ShipMetalMk2.rocket = { sound = "", }
Materials.ShipMetalMk2.flygun  = { sound = "sound/hit/plasma-ShipMetalMk1",}
Materials.ShipMetalMk2.empfire = { particle_effect = "particles/materials/ship_hull_hit", sound = "sound/hit/flame_common",}


-- Корабельный металл типа 3. ShipMetalMk3. Металл, из которого изготавливаются корпуса кораблей. Для тяжелых кораблей. Очень плотный.
Materials.ShipMetalMk3 = sys.new( Materials.Default )
Materials.ShipMetalMk3.phys = phys_mats.space_ship
Materials.ShipMetalMk3.collision_sound = "sound/collision/ShipMetalMk1"
Materials.ShipMetalMk3.vehicle_collision_sound = "sound/collision/ShipMetalMk1"
Materials.ShipMetalMk3.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk3.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk3.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk3.railgun = { sound = "sound/hit/railgun-ShipMetalMk1", particle_effect = "particles/materials/ship_hull_hit",}
Materials.ShipMetalMk3.scratch_sound = "sound/collision/scratch_MetalMk1"
Materials.ShipMetalMk3.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.ShipMetalMk3.crystal_shard	= { sound = "sound/hit/crystal-metal", }
Materials.ShipMetalMk3.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
--Materials.ShipMetalMk3.rocket = { sound = "", }
Materials.ShipMetalMk3.flygun  = { sound = "sound/hit/plasma-ShipMetalMk1",}
Materials.ShipMetalMk3.empfire = { particle_effect = "particles/materials/ship_hull_hit", sound = "sound/hit/flame_common",}
Materials.ShipMetalMk3.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }


-- Титан. Titanium. Эквивалент какого-то суперметалла. Например, для космических станций. Очень прочен. Не звенит, т.к. как ОЧЕНЬ толстые слои.
Materials.Titanium = sys.new( Materials.Default )
Materials.Titanium.collision_sound = "sound/collision/ShipMetalMk1"
Materials.Titanium.vehicle_collision_sound = "sound/collision/ShipMetalMk1"
Materials.Titanium.railgun = { sound = "sound/hit/railgun-ShipMetalMk1",  }
Materials.Titanium.plasma = { sound = "sound/hit/plasma-ShipMetalMk1",   }
Materials.Titanium.plasma_cloud = { sound = "sound/hit/pb_common",   }
Materials.Titanium.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1",   }
Materials.Titanium.scratch_sound = "sound/collision/scratch_MetalMk1"
Materials.Titanium.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Titanium.crystal_shard	= { sound = "sound/hit/crystal-metal", }
Materials.Titanium.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
--Materials.Titanium.rocket = { sound = "", }
Materials.Titanium.flygun  = { sound = "sound/hit/plasma-ShipMetalMk1",}
Materials.Titanium.empfire = { particle_effect = "particles/gadget/damage_emp_fire", sound = "sound/hit/flame_common",}
Materials.Titanium.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }



-- Энергетический щит. EnergyShield. Тонкие энергощиты кораблей.
Materials.EnergyShield = sys.new( Materials.Default )
Materials.EnergyShield.scratch_effect = "particles/materials/energy_scratch"
Materials.EnergyShield.plasma = { sound = "sound/hit/plasma-EnergyShield", }
Materials.EnergyShield.plasma_cloud = { sound = "sound/hit/pb_common", }
Materials.EnergyShield.lasersniper = { sound = "sound/hit/plasma-EnergyShield", }
Materials.EnergyShield.railgun = { sound = "sound/hit/railgun-EnergyShield", }
--Materials.EnergyShield.collision_sound = ""
Materials.EnergyShield.vehicle_collision_sound = "sound/collision/ShipMetalMk1"
Materials.EnergyShield.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.EnergyShield.crystal_shard = { sound = "sound/hit/railgun-EnergyShield", }
Materials.EnergyShield.CrystallSparks = { sound = "sound/hit/plasma-EnergyShield", }
--Materials.EnergyShield.rocket = { sound = "", }
Materials.EnergyShield.flygun = { sound = "sound/hit/plasma-EnergyShield", }
Materials.EnergyShield.empfire = { particle_effect = "particles/empty", sound = "sound/hit/flame_common",}
Materials.EnergyShield.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }


-- Энергетическое поле, купол. ForceField. Мощное поле, которым прикрываются Станции, поглощает любой урон.
Materials.ForceField = sys.new( Materials.Default )
Materials.ForceField.hit_effect = "particles/materials/energy_hit"
Materials.ForceField.scratch_effect = "particles/materials/energy_scratch"
Materials.ForceField.crystal_shard = { sound = "sound/hit/railgun-EnergyShield", }
Materials.ForceField.empfire = { particle_effect = "particles/empty",}
Materials.ForceField.CrystallSparks = { sound = "sound/hit/plasma-EnergyShield", }
--Materials.ForceField.collision_sound =  ""
--Materials.ForceField.vehicle_collision_sound = ""

 --Стационарный синий энергетический щит на кораблях - через него летаешь но пули колизятся.
Materials.AlienShield = sys.new( Materials.Default )
Materials.AlienShield.hit_effect = "particles/materials/alienshield_hit"
Materials.AlienShield.scratch_effect = "particles/materials/alienshield_scratch"
Materials.AlienShield.plasma = { sound = "sound/hit/plasma-EnergyShield", particle_effect = "particles/materials/alienshield_hit",}
Materials.AlienShield.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/alienshield_hit",}
Materials.AlienShield.lasersniper = { sound = "sound/hit/plasma-EnergyShield", particle_effect = "particles/materials/alienshield_hit",}
Materials.AlienShield.railgun = { sound = "sound/hit/railgun-EnergyShield", particle_effect = "particles/materials/alienshield_hit",}
Materials.AlienShield.disintegrator = { sound = "sound/hit/disintegrator_hit", particle_effect = "particles/materials/alienshield_hit",}
Materials.AlienShield.rocket = { sound = "sound/hit/rocket-rock", particle_effect = "particles/materials/alienshield_hit_rocket",}
Materials.AlienShield.crystal_shard[ "particle_effect" ] = "particles/materials/alienshield_hit" 
Materials.AlienShield.crystal_shard = { sound = "sound/hit/railgun-EnergyShield", }
Materials.AlienShield.flygun = { sound = "sound/hit/plasma-EnergyShield", particle_effect = "particles/materials/alienshield_hit",}
Materials.AlienShield.empfire = { particle_effect = "particles/empty", sound = "sound/hit/flame_common",}
Materials.AlienShield.CrystallSparks = { sound = "sound/hit/plasma-EnergyShield", }
Materials.AlienShield.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }

--Щит абилки Module_GigantShield - через него летаешь но пули колизятся.
Materials.GiantShield = sys.new( Materials.Default )
Materials.GiantShield.hit_effect = "particles/materials/giantshield_hit"
Materials.GiantShield.scratch_effect = "particles/empty"
Materials.GiantShield.plasma = { sound = "sound/hit/plasma-EnergyShield", particle_effect = "particles/materials/giantshield_hit",}
Materials.GiantShield.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/giantshield_hit",}
Materials.GiantShield.lasersniper = { sound = "sound/hit/plasma-EnergyShield", particle_effect = "particles/materials/giantshield_hit",}
Materials.GiantShield.railgun = { sound = "sound/hit/railgun-EnergyShield", particle_effect = "particles/materials/giantshield_hit",}
Materials.GiantShield.disintegrator = { sound = "sound/hit/disintegrator_hit", particle_effect = "particles/materials/giantshield_hit",}
Materials.GiantShield.rocket = { sound = "sound/hit/rocket-rock", particle_effect = "particles/materials/giantshield_hit",}
Materials.GiantShield.crystal_shard[ "particle_effect" ] = "particles/materials/alienshield_hit" 
Materials.GiantShield.crystal_shard = { sound = "sound/hit/railgun-EnergyShield", }
Materials.GiantShield.flygun = { sound = "sound/hit/plasma-EnergyShield", particle_effect = "particles/materials/giantshield_hit",}
Materials.GiantShield.empfire = { particle_effect = "particles/empty", sound = "sound/hit/flame_common",}
Materials.GiantShield.CrystallSparks = { sound = "sound/hit/plasma-EnergyShield", }
Materials.GiantShield.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }


-- Заснеженые скалы.
Materials.Snowrocks = sys.new( Materials.Default )
Materials.Snowrocks.scratch_effect = "particles/materials/snowrocks_scratch"
Materials.Snowrocks.vehicle_collision_sound = "sound/collision/ShipMetalMk1_rock"
Materials.Snowrocks.scratch_sound = "sound/collision/scratch_rock"
Materials.Snowrocks.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Snowrocks.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/snowrocks_hit", }
Materials.Snowrocks.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/snowrocks_hit", }
Materials.Snowrocks.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/snowrocks_hit", }
Materials.Snowrocks.railgun = { sound = "sound/hit/railgun-ice", particle_effect = "particles/materials/snowrocks_hit", }
Materials.Snowrocks.rocket = { sound = "sound/hit/rocket-rock", particle_effect = "particles/materials/snowrocks_hit", }
Materials.Snowrocks.singularity = { sound = "sound/hit/singularity-common", particle_effect = "particles/materials/snowrocks_hit", }
Materials.Snowrocks.crystal_shard[ "particle_effect" ] = "particles/materials/snowrocks_hit" 
Materials.Snowrocks.crystal_shard	= { sound = "sound/hit/railgun-Rock", }
Materials.Snowrocks.flygun = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/snowrocks_hit", }
Materials.Snowrocks.empfire = { particle_effect = "particles/gadget/damage_emp_fire", sound = "sound/hit/flame_common",}
Materials.Snowrocks.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Snowrocks.Ice_hit = { sound = "sound/hit/railgun-Rock", }

--Лава
Materials.Lava = sys.new( Materials.Default )
Materials.Lava.scratch_effect = "particles/materials/lava_hit_rocket"
Materials.Lava.vehicle_collision_sound = "sound/collision/ShipMetalMk1_rock"
Materials.Lava.scratch_sound = "sound/collision/scratch_rock"
Materials.Lava.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Lava.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/lava_hit", }
Materials.Lava.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/lava_hit", }
Materials.Lava.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/lava_hit", }
Materials.Lava.railgun = { sound = "sound/hit/railgun-ice", particle_effect = "particles/materials/lava_hit", }
Materials.Lava.rocket = { sound = "sound/hit/rocket-rock", particle_effect = "particles/materials/lava_hit_rocket", }
Materials.Lava.singularity = { sound = "sound/hit/singularity-common", particle_effect = "particles/materials/lava_hit_rocket", }
Materials.Lava.crystal_shard[ "particle_effect" ] = "particles/materials/lava_hit" 
Materials.Lava.crystal_shard	= { sound = "sound/hit/railgun-Rock", }
Materials.Lava.flygun = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/weapons/plasma/hit_y", }
Materials.Lava.empfire = { particle_effect = "particles/empty",}
Materials.Lava.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Lava.Ice_hit = { sound = "sound/hit/railgun-Rock", }

--Вода
Materials.Water = sys.new( Materials.Default )
Materials.Water.scratch_effect = "particles/materials/water_rocket_hit"
Materials.Water.vehicle_collision_sound = "sound/collision/ShipMetalMk1_rock"
Materials.Water.scratch_sound = "sound/collision/scratch_rock"
Materials.Water.disintegrator = { sound = "sound/hit/disintegrator_hit", particle_effect = "particles/materials/water_rocket_hit", }
Materials.Water.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/water_hit", }
Materials.Water.plasma_cloud = { sound = "sound/hit/pb_common", particle_effect = "particles/materials/water_hit", }
Materials.Water.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/water_hit", }
Materials.Water.railgun = { sound = "sound/hit/railgun-ice", particle_effect = "particles/materials/water_hit", }
Materials.Water.rocket = { sound = "sound/hit/rocket-rock", particle_effect = "particles/materials/water_rocket_hit", }
Materials.Water.singularity = { sound = "sound/hit/singularity-common", particle_effect = "particles/materials/water_rocket_hit", }
Materials.Water.crystal_shard[ "particle_effect" ] = "particles/materials/water_hit" 
Materials.Water.crystal_shard	= { sound = "sound/hit/railgun-Rock", }
Materials.Water.flygun = { sound = "sound/hit/plasma-ShipMetalMk1", particle_effect = "particles/materials/water_hit", }
Materials.Water.empfire = { particle_effect = "particles/empty",}
Materials.Water.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Water.Ice_hit = { sound = "sound/hit/railgun-Rock", }

-- флеш-затычка. Flesh.
Materials.Flesh = sys.new( Materials.Default )


-- металлическая затычка, чтобы не ругалось. Metal. 
Materials.Metal = sys.new( Materials.Default )
Materials.Metal.railgun = { sound = "sound/hit/railgun-ShipMetalMk1", }
Materials.Metal.plasma = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Metal.plasma_cloud = { sound = "sound/hit/pb_common", }
Materials.Metal.lasersniper = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Metal.scratch_sound = "sound/collision/scratch_MetalMk1"
Materials.Metal.collision_sound = 'sound/collision/ShipMetalMk1'
Materials.Metal.vehicle_collision_sound = "sound/collision/ShipMetalMk1"
Materials.Metal.crystal_shard	= { sound = "sound/hit/crystal-metal", }
Materials.Metal.disintegrator = { sound = "sound/hit/disintegrator_hit",  }
Materials.Metal.singularity = { sound = "sound/hit/singularity-common", }
Materials.Metal.crystal_shard	= { sound = "sound/hit/crystal-metal", }
Materials.Metal.CrystallSparks = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Metal.flygun = { sound = "sound/hit/plasma-ShipMetalMk1", }
Materials.Metal.rocket = { sound = "", particle_effect = "particles/materials/ship_hull_hit", }
Materials.Metal.empfire = { particle_effect = "particles/gadget/damage_emp_fire", sound = "sound/hit/flame_common",}
Materials.Metal.Ice_hit = { sound = "sound/hit/railgun-ShipMetalMk1", }

-- бумага, для первоапрельской потасовки на бумажных кораблях
Materials.Paper = sys.new( Materials.Default )
Materials.Paper.railgun = { sound = "sound/hit/Papergun_PaperShip", }
Materials.Paper.scratch_sound = "ssound/collision/ShipPaper_slide_common"
Materials.Paper.scratch_effect = "particles/empty"
Materials.Paper.collision_sound = "sound/collision/ShipPaper_common"
Materials.Paper.vehicle_collision_sound = "sound/collision/ShipPaper_common"
Materials.Paper.rocket = { sound = "", particle_effect = "particles/materials/ship_hull_hit", }