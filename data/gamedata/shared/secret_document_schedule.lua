-- таблица ротации времени появления секретных документов #35481
--[[SecretDocumentSchedule = 
{
	-- минуты от начала дня
	{	start = 1 * 60 + 0, 	finish = 1 * 60 + 30,	},		-- 01:00 - 01:30
	{	start = 8 * 60 + 0,		finish = 8 * 60 + 30,	},		-- 08:00 - 08:30
	{	start = 12 * 60 + 30,	finish = 13 * 60 + 0,	},		-- 12:30 - 13:00
	{	start = 18 * 60 + 30,	finish = 19 * 60 + 0,	},		-- 18:30 - 19:00
	{	start = 23 * 60 + 30,	finish = 0 * 60 + 30,	},		-- 23:30 - 00:30
}--]]

SecretDocumentScheduleLootCrate = {}

for i = 0, 23 do
	SecretDocumentScheduleLootCrate[i] = {start = i * 60 + 0, 	finish = i * 60 + 30,}
end

--
SecretDocumentScheduleAISquad = {}

for i = 0, 23 do
	SecretDocumentScheduleAISquad[i] = {start = i * 60 + 0, 	finish = i * 60 + 30,}
end