--------------------------------------------------------------------------------------------------------------------------------
-- SC-114376:
-- Проигрывается плейлист того активного состояния, у которого наивысший приоритет.
-- Если нет активного состояния - играет музыка окружения (ambient).
-- Активностью ai.MusicStateType.BATTLE и ai.MusicStateType.INVASION управляет код.
-- Значения типов состояний из ai.MusicStateType.*** должны быть в промежутке [ai.MusicStateType.CODE_DRIVEN_NUM, 31].
-- Имена плейлистов лежат в "sound/playlist.lua"
-- Приоритеты сотояний в MusicStateDef не должны повторятся.
--------------------------------------------------------------------------------------------------------------------------------

-- ai.MusicStateType.BATTLE = 0,
-- ai.MusicStateType.INVASION = 1,
-- ai.MusicStateType.CODE_DRIVEN_NUM = 2,

-- Дизайнерские состояния музыкального окружения.
ai.MusicStateType.BOSS = ai.MusicStateType.CODE_DRIVEN_NUM
ai.MusicStateType.DREADNOUGHT = ai.MusicStateType.CODE_DRIVEN_NUM + 1

MusicStateDef = {
	[ai.MusicStateType.BATTLE] = 		{ priority = 0,		playlist = "FreeSpaceCriminalMusic" }, -- музыка боя, обязательно должна быть определена
	[ai.MusicStateType.INVASION] = 		{ priority = 1,		playlist = "FreeSpaceInvasionMusic"}, -- музыка вторжения, обязательно должна быть определена
	[ai.MusicStateType.BOSS] = 			{ priority = 2,		playlist = "RaidMusic_special"},
	[ai.MusicStateType.DREADNOUGHT] = 	{ priority = 3,		playlist = "ClanShipMusic"},
}

-- просто для примера настройки эмбиента.
-- На дедике нет самой музыки, дедик сейчас не читает "sound/playlist.lua", ссылаться как либо на него прямо тут нельзя.
ai.AmbientPlaylistPreset = 
{
	Imperial = 0,
	Federation = 1,
	Jericho = 2,
}

AmbientPlaylistPresetDef =
{
	[ai.AmbientPlaylistPreset.Imperial] = "desttown",
	[ai.AmbientPlaylistPreset.Federation] = "FreeSpace_fed_sector",
	[ai.AmbientPlaylistPreset.Jericho] = "FreeSpace_jer_sector",
}
