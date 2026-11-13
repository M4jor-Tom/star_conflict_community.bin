-- ----------------------------------------------------------------------------
--
-- Workfile: FontDefs.lua
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
-- Basic font definitions
--
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------


--
FONT =
{
	-- флаги форматирования текста
   	TF_LEFT						= 0x00000001,
   	TF_HCENTER					= 0x00000002,
   	TF_RIGHT					= 0x00000004,
   	TF_FULL						= 0x00000008,
   	TF_TOP						= 0x00000010,
   	TF_VCENTER					= 0x00000020,
   	TF_BOTTOM					= 0x00000040,
   	TF_SINGLELINE				= 0x00000080,
   	TF_WORDBREAK				= 0x00000100,
   	TF_NOCLIP					= 0x00000200,
	TF_IGNORE_FORMAT_SYMBOLS	= 0x00000400,
	TF_EDIT						= 0x00000800,

	-- стили шрифта
   	FS_NORMAL				= 0,
   	FS_BOLD					= 1,
   	FS_NORMAL_ITALIC		= 2,
   	FS_BOLD_ITALIC			= 3,

	-- способ создания шрифта
   	FC_WINDOWS 				= 0,
   	FC_HOMEMADE       		= 1,

	-- невалидный идентификатор
	INVALID_FONT_HANDLE		= 0,
}
