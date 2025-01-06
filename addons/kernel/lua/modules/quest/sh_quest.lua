-- Generic Methods --
function AMB.Quest.GetQuest( nID )

    return AMB.Quest.Config.quests[ nID ]

end

-- Player Methods --
function AMB.Quest.GetPlayerQuest( ePly )

    local quest_id = AMB.NW.GetInt( ePly, 'Quest' )

    if not quest_id or ( quest_id <= 0 ) then return false end

    return AMB.Quest.Config.quests[ quest_id ] or false

end

function AMB.Quest.GetPlayerQuestID( ePly )

    return AMB.NW.GetInt( ePly, 'Quest' )

end

function AMB.Quest.GetPlayerQuestStep( ePly )

    return AMB.NW.GetInt( ePly, 'QuestStep' )

end

function AMB.Quest.GetPlayerQuestCount( ePly )

    return AMB.NW.GetInt( ePly, 'QuestCount' )

end

function AMB.Quest.CheckPlayer( ePly, nQuest, nStep )

    return ( AMB.NW.GetInt( ePly, 'Quest' ) == nQuest ) and ( AMB.NW.GetInt( ePly, 'QuestStep' ) == nStep )

end

-- Entity Methods --
function AMB.Quest.GetEntityQuestID( eEnt )

    return AMB.NW.GetInt( eEnt, 'Quest' )

end

function AMB.Quest.GetEntityQuestStep( eEnt )

    return AMB.NW.GetInt( eEnt, 'QuestStep' )

end

function AMB.Quest.GetEntityQuestCount( eEnt )

    return AMB.NW.GetInt( eEnt, 'QuestCount' )

end
