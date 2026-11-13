-- ------------------------------------------------------------------------------------------
-- описание игровых(физических) материалов вигре
-- ------------------------------------------------------------------------------------------
--[[
ѕри добавлении/удалении нужно соответственно поправить файл material_list.mel
  	ќн используетс€ в Maya'вских скриптах, чтобы художники могли назначать материалы на статику
	
	“екуща€ реализаци€ системы материалов требует об€зательного наличи€ материалов Default и Flesh.
	
ќписание полей.
	phys - физические параметры материала (friction, restitution, ...), подробнее см. файл sys_data\gamedata\physics\def_mat.lua
	wheels_effect - эффекты из под колес автомобил€ (Insane2)
	effects_color - цвет эффектов из под колес автомобил€ (Insane2)
	suspension_oscillation - искуственное колебание подвески автомобил€ (Insane2)
	skidding_sound - звук скольжени€/заноса автомобил€ (только дл€ машин)
	tire_sound - звук качени€ автомобил€ (только дл€ машин)
	scratch_sound - звук "царапани€" автомобил€/SpaceShip'а о поверхность. играетс€ только дл€ игрока
	scratch_effect - эффект "царапани€" автомобил€/SpaceShip'а о поверхность
	collision_sound	- звук колизии. проигрываетс€ дл€ обоих объектов колизии. одинаковый звуки не дублируютс€, а проигрываютс€ громче
	vehicle_collision_sound - специальный звук колизии Vehicle/SpaceShip с этим материалом. играетс€ только он один(в отличии от collision_sound)
	
	эффекты от попаданий - ключем €вл€етс€ impact_type прописанный в оружии. например railgun plasma. значение - таблица с описанием
	impact_type = 
	{
		particle_effect	- им€ эффекта, проигрываемого в точке попадани€ (ориентирован осью Y)
		sound 			- им€ звука, проигрываемого при попадании
		decal			- декол накладываемый на стаику по которой попали
		decal_size		- размер декола
		violence		- <bool> пометка дл€ "жестоких" эффектов. в режиме LowViolence эффекты не играютс€
	}
	
]]

--
Materials.Default = 
{
	desc = 'Default game material, with default physics',
	phys = phys_mats.default,

	-- звуки коллизии
	--collision_sound = "",
	--vehicle_collision_sound = "",
	--scratch_sound = "",
	scratch_effect = "particles/materials/metal_scratch2",
}

Materials.Default.railgun = { sound = "sound/hit/Railgun-Rock", }
Materials.Default.plasma = { sound = "sound/hit/Plasma-ShipMetalMk1", }
Materials.Default.plasma_cloud = { sound = "sound/hit/Plasma-ShipMetalMk1", }
Materials.Default.disintegrator = { sound = "sound/hit/disintegrator_hit", }
Materials.Default.rocket = { sound = "", }
Materials.Default.singularity = { sound = "", }
Materials.Default.laser = { sound = "", }
Materials.Default.lasersniper = { sound = "sound/hit/Plasma-ShipMetalMk1", }
Materials.Default.crystal_shard = { sound = "sound/hit/Railgun-Rock", }