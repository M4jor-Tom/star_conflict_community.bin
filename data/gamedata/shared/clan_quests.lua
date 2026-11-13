ClanQuestId =
{
	--CQ_SAMPLE = 0,
}

--
ClanQuests = {}

--[[
ClanQuests[ ClanQuestId.CQ_SAMPLE ] =
{
	questId = QuestId.SAMPLE,
	target = 100000,
	costAccept = 1000,
	rewardDefId = DefId.ID_SAMPLE,
	rewardDefDuration = 60 * 60 * 24, -- сутки
	rewardAura = "First_Day_Bundle_Discount",
}
--]]

--
for clanQuestId, clanQuest in pairs( ClanQuests ) do

	if clanQuest.questId ~= nil and Quests[ clanQuest.questId ] ~= nil then
		Quests[ clanQuest.questId ].related = true
	else
		sys.log( "^1ClanQuest: Invalid related-quest: clanQuestId %u, questId %d", clanQuestId, clanQuest.questId or -1 )
	end
end
