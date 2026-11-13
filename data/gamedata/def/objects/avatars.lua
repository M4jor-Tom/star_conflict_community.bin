--
local AvatarsStoreItemIdCounter = 130000
local function Avatars_GetNextStoreItemId()
	AvatarsStoreItemIdCounter = AvatarsStoreItemIdCounter + 1
	return AvatarsStoreItemIdCounter
end
--
Def.AvatarBase = 
{
	in_editor		= false,
	is_avatar		= true,
	stacks			= false,
	shopCategory	= "OFFICE",
	shopSubCategory	= "AVATAR",
}

Def.Avatar_Custom = 
{
	inherit				= "AvatarBase",
	price				= 50,
	storeItemId			= Avatars_GetNextStoreItemId(),
	depends_on_uid 		= true,
	texturePrefix 		= "custom_avatar_",
}

Def.Avatar_1 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_1",
}

Def.Avatar_2 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_2",
}

Def.Avatar_3 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_3",
}

Def.Avatar_4 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_4",
}

Def.Avatar_5 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_5",
}

Def.Avatar_6 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_6",
}

Def.Avatar_7 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_7",
}

Def.Avatar_8 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_8",
}

Def.Avatar_9 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_9",
}

--
Def.Avatar_10 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_10",
}

Def.Avatar_11 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_11",
}

Def.Avatar_12 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_12",
}

Def.Avatar_13 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_13",
}

Def.Avatar_14 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_14",
}

Def.Avatar_15 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_15",
}

Def.Avatar_16 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_16",
}

Def.Avatar_17 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_17",
}

Def.Avatar_18 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_18",
}

Def.Avatar_19 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_19",
}

-- набор спец аватарок #52133
for n = 20, 39 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	-- SC-115721
	-- price				= 1,
	-- storeItemId			= Avatars_GetNextStoreItemId(),
	-- textureId			= "avatar_"..n,
	-- cant_be_bought		= true,
}
end

-- 2й пак аватораок #58609
for n = 1, 20 do
nn = 39 + n
Def["Avatar_"..nn] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_pack2_"..n,
}
end

 -- Аватарки на день рождения
 
 Def.Avatar_60 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_40",
}

 Def.Avatar_61 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_41",
}

 Def.Avatar_62 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_42",
}

 Def.Avatar_63 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_43",
}

 Def.Avatar_64 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_44",
}

-- #85678
ava_order = {42,49,44,40,46,47,48,43,54,53,52,63,64,41,56,50,51,55,59,4,61,11,58,2,3,57,1,9,8,6,45,60,13,14,15,16,17,18,62,12,5,19,10,7}
for i=1, #ava_order do
	Def["Avatar_"..ava_order[i]].sort = i+100
end


-- ещё пак аваторок #86052
for n = 45, 56 do
nn = 20 + n
Def["Avatar_"..nn] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 500,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	sort				= n,	-- все они будут раньше старых
}
end
-- последний номер задействован 76! следующие нумеровать с 77!

Def.Avatar_067 = 
{
	inherit				= "AvatarBase",
	price				= 500000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_67",
	sort				= 10,
}

Def.Avatar_068 = 
{
	inherit				= "AvatarBase",
	price				= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_68",
	sort				= 11,
}

-- баттл-пасс SC-109929
Def.Avatar_80 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_69",
	sort				= 9999,
}
Def.Avatar_81 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_70",
	sort				= 9999,
}
Def.Avatar_82 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_71",
	sort				= 9999,
}
Def.Avatar_83 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_72",
	sort				= 9999,
}
Def.Avatar_84 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_73",
	sort				= 9999,
}
Def.Avatar_85 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_74",
	sort				= 9999,
}
Def.Avatar_86 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_75",
	sort				= 9999,
}
Def.Avatar_87 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_100",
	sort				= 9999,
}
Def.Avatar_88 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_101",
	sort				= 9999,
}
Def.Avatar_89 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_102",
	sort				= 9999,
}
Def.Avatar_90 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_103",
	sort				= 9999,
}

Def.Avatar_104 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_104",
	sort				= 9999,
}

Def.Avatar_105 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_105",
	sort				= 9999,
}

Def.Avatar_106 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_106",
	sort				= 9999,
}

Def.Avatar_107 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_107",
	sort				= 9999,
}

-- набор аватарок баттлпасса летнего 2020 #SC-113566
for n = 108, 119 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

--спец аватар для длс Polar Bear
Def.Avatar_120 =
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_120",
	sort				= 9999,
}

-- набор аватарок баттлпасса нового 2021 года #SC-114056
for n = 121, 132 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

--спец аватар для длс Relic
Def.Avatar_133 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_133",
	sort				= 9999,
}

--спец аватар для длс Papa Crab SC-114721
Def.Avatar_134 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_134",
	sort				= 9999,
}

-- SC-114720 Портрет пилота корабля "Салют-СТ"
Def.Avatar_135 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_135",
	sort				= 9999,
}

-- SC-114947 Боевой пропуск лето 2021г.
for n = 136, 147 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-114907 Аватарка/портрет пилота корабля Mole
Def.Avatar_148 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_148",
	sort				= 9999,
}

-- SC-115126 Футбольный ивент. Аватарка в награду
Def.Avatar_149 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_149",
	sort				= 9999,
}

-- SC-114701 Портрет командира эсминца Империи
Def.Avatar_150 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_150",
	sort				= 9999,
}

-- Портрет DLC Shark
Def.Avatar_151 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_151",
	sort				= 9999,
}

-- Портрет DLC Protazan
Def.Avatar_152 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_152",
	sort				= 9999,
}

-- Портреты пиратских героев SC-115525
for n = 153, 156 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-115479 Портрет в DLC с кораблем Naglfar
Def.Avatar_157 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_157",
	sort				= 9999,
}

-- SC-115617 Перевыпустить Joker. Аватарка для dlc
Def.Avatar_158 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_158",
	sort				= 9999,
}

--SC-115743 Аватарки для первого этапа боевого пропуска зима 2021-2022г.
for n = 159, 164 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-115704 Thor. Аватарка для dlc
Def.Avatar_165 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_165",
	sort				= 9999,
}

-- SC-115749 Аватарка персонажа из Пве в пиратском сеттинге. Сокровище Левасера
Def.Avatar_166 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_166",
	sort				= 9999,
}

-- SC-115557 Аватарки Боевой пропуск зима 2021-2022г. / Battlepass winter 2021-2022 (2 этап)
for n = 167, 172 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-115702 DLC Razor новый. Аватарка
Def.Avatar_173 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_173",
	sort				= 9999,
}

-- SC-116079 DLC Sawtooth новый. Аватарка
Def.Avatar_174 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_174",
	sort				= 9999,
}

-- SC-115989 Аватарки Боевой пропуск весна 2022г. / Battlepass spring 2022
for n = 175, 180 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-116192 dlc Blood Tormentor. Аватарка
Def.Avatar_181 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_181",
	sort				= 9999,
}

-- SC-115983 Колаб с Пикабу 12 апреля. Аватарка Печенавт
Def.Avatar_182 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_182",
	sort				= 9999,
}

-- SC-116252 DLC Phoenix простой и элитный. Аватарка
Def.Avatar_183 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_183",
	sort				= 9999,
}

-- SC-116249 Портрет для наборов DLC Kirishima простой и элитный
Def.Avatar_184 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_184",
	sort				= 9999,
}

-- SC-116258 Аватарки Боевой пропуск 2 этап весна 2022г. / Battlepass spring 2nd step 2022
for n = 185, 190 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-116390 Аватарки Боевой пропуск 1 этап лето 2022г. / Battlepass summer 1st step 2022
for n = 191, 195 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-116414 DLC Cutter. Аватарка
Def.Avatar_196 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_196",
	sort				= 9999,
}

-- SC-116436 Черная Эстафета
Def.Avatar_197 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_197",
	sort				= 9999,
}

-- SC-116585 Аватарка для DLC “Star Conflict: Kusarigama” и “Star Conflict: Kusarigama. Элитный набор”
Def.Avatar_198 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_198",
	sort				= 9999,
}

-- SC-116552 Аватарки Боевой пропуск 2 этап лето 2022г. / Battlepass summer 2nd step 2022
for n = 199, 203 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-116721 Аватарки Боевой пропуск 1 этап осень 2022г. / Battlepass autumn 1st step 2022
for n = 204, 208 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-116618 DLC Reaper. Аватарка
Def.Avatar_209 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_209",
	sort				= 9999,
}

-- SC-116877 DLC корабля Thrasher на Хеллоуин 2022
Def.Avatar_210 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_210",
	sort				= 9999,
}

-- SC-116723 Аватарки Боевой пропуск 2 этап осень 2022г. / Battlepass autumn 2nd step 2022
for n = 211, 215 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-116995 Аватарка для Irbis || SC-116926 Аватарка для Bear
for n = 216, 217 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117024 Аватарки Боевой пропуск 1 этап зима 2022-2023 / Battlepass winter 1st step 2022-2023
for n = 218, 222 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117093 Аватарка для DLC Разведчик новогодний 2022
Def.Avatar_223 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_223",
	sort				= 9999,
}

-- SC-117141 Аватарки Боевой пропуск 2 этап зима 2022-2023 / Battlepass winter 2nd step 2022-2023
for n = 224, 228 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117200 Аватарка для Имперского штурмовика Typhon
Def.Avatar_229 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_229",
	sort				= 9999,
}

-- SC-117097 Аватарка к  DLC перезапуск Dragonfly
Def.Avatar_230 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_230",
	sort				= 9999,
}

-- SC-117219 Аватарка для DLC Star Conflict: Wasp
Def.Avatar_231 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_231",
	sort				= 9999,
}

-- SC-117266 Аватарки Боевой пропуск 1 этап весна 2023г. / Battlepass spring 1st step 2023
for n = 232, 236 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117354 Аватарка пилота корабля Nyx
Def.Avatar_237 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_237",
	sort				= 9999,
}

-- SC-117495 Аватарка для DLC Sai
Def.Avatar_238 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_238",
	sort				= 9999,
}

-- SC-117501 Аватарка пилота корабля Confessor
Def.Avatar_239 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_239",
	sort				= 9999,
}

-- SC-117429 Аватарки Боевой пропуск 2 этап весна 2023г. / Battlepass spring 2nd step 2023
for n = 240, 244 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117632 Аватарки Боевой пропуск 1 этап лето 2023г. / Battlepass summer 1st step 2023
for n = 245, 248 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117338 Аватарка для DLC Palom
Def.Avatar_249 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_249", 
	sort				= 9999,
}

-- SC-117637 Аватарки Боевой пропуск 2 этап лето 2023г. / Battlepass summer 2nd step 2023
for n = 250, 253 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117952 Аватарка для DLC Grim
Def.Avatar_254 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_254", 
	sort				= 9999,
}

-- SC-117942 Аватарка для DLC с кораблем Seeress простой и элитный
Def.Avatar_255 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_255", 
	sort				= 9999,
}

-- SC-117857 Аватарка для DLC с кораблем Helicon простой и элитный
Def.Avatar_256 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_256", 
	sort				= 9999,
}

-- SC-117873 Аватарки Боевой пропуск 1 фаза осень 2023г. / Battlepass autumn 1st phase 2023
for n = 257, 260 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-117982 Аватарка для DLC Mauler
Def.Avatar_261 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_261", 
	sort				= 9999,
}

-- SC-118247 Аватарка для DLC Hadrian
Def.Avatar_262 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_262", 
	sort				= 9999,
}

-- SC-118250 Аватарка для DLC Baphomet
Def.Avatar_263 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_263", 
	sort				= 9999,
}

-- SC-117874 Аватарки Боевой пропуск 2 фаза осень 2023г. / Battlepass autumn 2nd phase 2023
for n = 264, 267 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-118257 Аватарка к DLC Loki
Def.Avatar_268 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_268", 
	sort				= 9999,
}

-- SC-118210 Аватарки Боевой пропуск 1 фаза зима 2023-2024 / Battlepass winter 1st phase 2023-2024
for n = 269, 272 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-118421 Аватарка пилота штурмовика федерации Manul
Def.Avatar_273 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_273", 
	sort				= 9999,
}

-- SC-??? Аватарки Боевой пропуск 2 фаза зима 2023-2024 / Battlepass winter 2nd phase 2023-2024
for n = 274, 277 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-118419 Аватарка командира корабля Salamander, в китайской стилистике. Для DLC с кораблем Salamander простой и элитный
Def.Avatar_278 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_278", 
	sort				= 9999,
}

-- SC-118586 Аватарка капитана эсминца федерации Procyon. Для DLC с кораблем Procyon простой и элитный
Def.Avatar_279 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_279", 
	sort				= 9999,
}

-- SC-118551 Аватарка к DLC на новый корабль Cor Vulnus
Def.Avatar_280 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_280", 
	sort				= 9999,
}

-- SC-118588 Аватарка для фрегата иерихона Priest Bartle
Def.Avatar_281 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_281", 
	sort				= 9999,
}

-- SC-118627 Аватарки Боевой пропуск 1 фаза весна 2024 / Battlepass spring 1st phase 2024
for n = 282, 285 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-118733 Аватарка к DLC на перевыпуск корабля Vigilant

Def.Avatar_286 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_286", 
	sort				= 9999,
}

-- SC-118691 Аватарки Боевой пропуск 2 фаза весна 2024 / Battlepass spring 2nd phase 2024
for n = 287, 290 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-118824 Аватарка к DLC с кораблем Bark-2

Def.Avatar_291 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_291", 
	sort				= 9999,
}

-- SC-118772 Аватарка к DLC корабля Yith'Mor

Def.Avatar_292 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_292", 
	sort				= 9999,
}

-- SC-118888 Аватарки Боевой пропуск 1 фаза лето 2024 / Battlepass summer 1st phase 2024
for n = 293, 296 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-118851 Аватарка к DLC корабля Shrike

Def.Avatar_297 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_297", 
	sort				= 9999,
}

-- SC-119015 Аватарка. Pilum. Перехватчик диверсии Иерихон. ИП Эхо Империй (BP16_3 / SUM24)

Def.Avatar_298 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_298", 
	sort				= 9999,
}

-- SC-118991 Аватарки. Неведомые горизонты. Вторая фаза: BP16_2 / SUM24_2
for n = 299, 302 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119128 Аватарки. Боевой пропуск "Сердце тьмы. Первая фаза". BP17_1 / AUT24_1. Осень 2024.
for n = 303, 306 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119191 Аватарка. Helios. Фрегат снайпер Империи. БП Сердце тьмы (BP17 / AUT24)

Def.Avatar_307 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_307", 
	sort				= 9999,
}

-- SC-119306 Аватарка. Psiloi. Перехватчик разведки Империи. ИП Хеллоуин (BP17_3 / AUT24_3)

Def.Avatar_308 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_308", 
	sort				= 9999,
}

-- SC-119229 Аватарки. Боевой пропуск "Сердце тьмы. Вторая фаза". BP17_2 / AUT24_2. Осень 2024.
for n = 309, 312 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119183 Аватарки. Боевой пропуск "Забытые звезды. Первая фаза". BP18_1 / NY25_1. Зима 2025.
for n = 313, 316 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119361 Аватарка на штурмовик-заградитель Уникальный "Persei-8". Ивентпасс "Архивы ЕЦН: Призрачный фронтир". EP18_3 / NY25_3. Зима 2025

Def.Avatar_317 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_317", 
	sort				= 9999,
}

-- SC-119183 Аватарки. Боевой пропуск "Забытые звезды. Вторая фаза". BP18_2 / NY25_2. Зима 2025.
for n = 318, 321 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119377 Аватарка на эсминец подавления уникальный "Bashe". Боевой пропуск BP18 / NY25. Зима 2025.

Def.Avatar_322 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_322", 
	sort				= 9999,
}

-- SC-119183 Аватарки. Боевой пропуск "Забытые звезды. Вторая фаза". BP18_2 / NY25_2. Зима 2025.
for n = 323, 326 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119561 Аватарка на фрегат инженерный "Каталина", в Ивентпасс BP19_3 / NY25_3 Весна 2025. («Леон «Seadog» О'Хейг»)

Def.Avatar_327 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_327", 
	sort				= 9999,
}

-- SC-119562 Аватарка на Фрегат прикрытия Эллидиум, в Боевой пропуск BP19_2 / NY25_2 Весна 2025. («Зейл Эллестон»)

Def.Avatar_328 = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_328", 
	sort				= 9999,
}

-- SC-119579 Аватарки. Боевой пропуск "Союзники и соперники. BP19_2 / SPR25_2. Весна 2025.
for n = 329, 332 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119579 Аватарки. Боевой пропуск "Союзники и соперники. BP19_2 / SPR25_2. Весна 2025.
for n = 333, 336 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119836 Аватарка на штурмовик заградитель уникальный "Amber" («Добрыня Всеславович»)

Def.Avatar_337 = -- Добрыня Всеславович
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_337", 
	sort				= 9999,
}

-- SC-119837 Аватарка на перехватчик РЭБ Иерихон "Cinquedea"

Def.Avatar_338 = -- Красная Тишина 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_338", 
	sort				= 9999,
}

-- SC-119693 Аватарки. Боевой пропуск Лето 2025. Вторая фаза. BP20_2
for n = 339, 342 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119850 Аватарки. Боевой пропуск Осень первая фаза. BP21_1 / AUT25_1. Осень 2025.
for n = 343, 346 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-120053 Аватарка на Перехватчик Разведки Федерация "Ace". Ивент-пасс Осень 2025.

Def.Avatar_347 = -- Спектр-17 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_347", 
	sort				= 9999,
}

-- SC-120026 Аватарки. Боевой пропуск Осень вторая фаза. BP21_2 / AUT25_2. Осень 2025.
for n = 348, 351 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-119987 Аватарка на фрегат дальнобойный "Carolingian" Иерихон, БП Осень 2025

Def.Avatar_352 = -- Сигрид Фростейн 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_352", 
	sort				= 9999,
}

-- SC-120106 Аватарки. Боевой пропуск "Перекрёсток галактик. Первая фаза". BP22_1 / NY26_1. Зима 2025 - 26.
for n = 353, 356 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-120205 Аватарка на Штурмовик Ударный «Apeiron», ИП Зима 2026

Def.Avatar_357 = -- «Экзоскафандр «Прислужник»»
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_357", 
	sort				= 9999,
}

-- SC-120106 Аватарки. Боевой пропуск "Перекрёсток галактик. Первая фаза". BP22_1 / NY26_1. Зима 2025 - 26.
for n = 358, 361 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-120120 Аватарка на Эсминец Подавления Уникальный “Saturn”. Боевой пропуск BP22 / NY26. Зима 2025-26

Def.Avatar_362 = -- Башар Тефий
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_362", 
	sort				= 9999,
}

-- SC-120322 Аватарка на Перехватчик Разведки Империи «CorLegibus». Ивентпасс BP22_4 / NY26. Зима 2025-26 (14е февраля 2026). 

Def.Avatar_363 = -- Валентине Вега
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_363", 
	sort				= 9999,
}

-- SC-120255 Аватарки. Боевой пропуск "Раскол альянсов". Первая фаза BP23_1 / SPR26_1. Весна 2026.
for n = 364, 367 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-120365 Аватарки. Боевой пропуск "Раскол альянсов". Вторая фаза: BP23_2 / SPR26_2. Весна 2026.
for n = 368, 371 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-120378 Аватарка на Перехватчик диверсии Элидиум «Tau'Kita». Боевой пропуск "Раскол альянсов" BP23 / SPR26. Весна 2026.

Def.Avatar_372 = -- Тайрон Солвик
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_372", 
	sort				= 9999,
}

-- SC-120412 Аватарка на Штурмовик Уникальный «???». Ивентпасс BP24_3 / SPR26_3. Весна 2026 (9 мая 2026)

Def.Avatar_373 = -- Харро Леман
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_373", 
	sort				= 9999,
}

-- SC-120413 Аватарка «Ночная Ведьма». ИвентПасс "Кровь Фронтира" BP23_3 / SPR26_3. Весна 2026.

Def.Avatar_374 = -- Ночная Ведьма
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	cant_be_bought		= true,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_374", 
	sort				= 9999,
}

-- SC-120397 Аватарки. Боевой пропуск "Наследие предтеч". Первая фаза: BP24_1 / SPR26_1. Лето 2026.
for n = 375, 378 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

-- SC-120435 Аватарки. Боевой пропуск "Наследие предтеч". Вторая фаза: BP24_2 / SPR26_2. Лето 2026.
for n = 379, 382 do
Def["Avatar_"..n] = 
{
	inherit				= "AvatarBase",
	premiumPrice		= 900000,
	storeItemId			= Avatars_GetNextStoreItemId(),
	textureId			= "avatar_"..n,
	cant_be_bought		= true,
	sort				= 9999,
}
end

