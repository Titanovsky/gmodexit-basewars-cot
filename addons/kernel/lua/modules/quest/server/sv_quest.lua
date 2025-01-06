local CFG = AMB.Quest.Config
local C = AMB.G.C
local SND = AMB.G.SND

local function SendPlayerOnReadyQuests( ePly )

    ePly.quests_ready_list = {}
    for i = 1, 8 do ePly.quests_ready_list[ i ] = AMB.Quest.GetFinishQuest( ePly, i ) end
    
    net.Start( CFG.net_send_ready_quests_to_client )
        net.WriteTable( ePly.quests_ready_list or { false, false, false, false, false, false, false } ) -- пока что делаем 8 квестов
    net.Send( ePly )

end

function AMB.Quest.Start( ePly, nID )

    if not AMB.Auth.IsPlayer( ePly ) then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' has not valid, not real player or not authorizated' ) return end

    local player_quest = AMB.Quest.GetPlayerQuest( ePly )
    if player_quest then AMB.ErrorLog( 'Quest', 'Must not to start, because Player '..tostring( ePly )..' already to walkthrough any quest' ) return end

    local quest = AMB.Quest.GetQuest( nID )
    if not quest then AMB.ErrorLog( 'Quest', 'Quest '..nID..' not exists' ) return end

    if ( nID > 1 ) then

        if not ePly.quests_ready_list[ nID - 1 ] then return end

    end
    if ePly.quests_ready_list[ nID ] then AMB.Re.ChatError( ePly, 'Вы уже прошли квест: '..quest.name ) return end

    AMB.NW.SetInt( ePly, 'Quest', nID )
    AMB.NW.SetInt( ePly, 'QuestStep', 0 )
    AMB.NW.SetInt( ePly, 'QuestCount', 0 )

    AMB.Debug( function() MsgC( C.ABS_RED, '[DEBUG] ', C.ABS_WHITE, 'Quest.Start '..tostring( ePly )..' Quest '..nID..'\n' ) end )

    AMB.Quest.NextStep( ePly, nID, 0 )

    return

end

function AMB.Quest.AddCount( ePly, nCount, nQuestID, nQuestStep )

    if not AMB.Auth.IsPlayer( ePly ) then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' has not valid, not real player or not authorizated' ) return false end
    if not nCount or not isnumber( nCount ) then AMB.ErrorLog( 'Quest', 'Unspecified nCount for Quest.AddCount' ) return false end
    if not nQuestID or not isnumber( nQuestID ) then AMB.ErrorLog( 'Quest', 'Unspecified nQuestID for Quest.AddCount' ) return false end
    if not nQuestStep or not isnumber( nQuestStep ) then AMB.ErrorLog( 'Quest', 'Unspecified nQuestStep for Quest.AddCount' ) return false end

    local quest = AMB.Quest.GetPlayerQuest( ePly )
    if not quest then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' doesnt to walkthrough quest' ) return false end

    local player_quest_id, player_quest_step = AMB.Quest.GetPlayerQuestID( ePly ), AMB.Quest.GetPlayerQuestStep( ePly )
    if ( player_quest_id ~= nQuestID ) then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' to walkthrough Quest '..player_quest_id..' but nQuestID = '..nQuestID ) return false end
    if ( player_quest_step ~= nQuestStep ) then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' on Step '..player_quest_step..' but nQuestStep = '..nQuestStep ) return false end

    local step = quest.steps[ player_quest_step ]
    if not step.count or ( step.count == 0 ) then step.count = 1 end

    AMB.NW.SetInt( ePly, 'QuestCount', AMB.NW.GetInt( ePly, 'QuestCount' ) + nCount )
    local current_count = AMB.NW.GetInt( ePly, 'QuestCount' )

    AMB.Quest.SaveProgress( ePly )

    AMB.Debug( function() 

        MsgC( C.ABS_RED, '[DEBUG] ', C.ABS_WHITE, 'Quest.AddCount '..tostring( ePly )..' Quest[ Q:'..player_quest_id..' S:'..player_quest_step..'/'..#quest.steps..' C:'..current_count..'/'..step.count..' ]\n' ) 
        
    end )

    if ( current_count >= step.count ) then AMB.Quest.NextStep( ePly, nQuestID, nQuestStep ) end

    return true

end

function AMB.Quest.NextStep( ePly, nQuestID, nQuestStep )

    if not AMB.Auth.IsPlayer( ePly ) then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' has not valid, not real player or not authorizated' ) return false end
    if not nQuestID or not isnumber( nQuestID ) then AMB.ErrorLog( 'Quest', 'Unspecified nQuestID for Quest.NextStep' ) return false end
    if not nQuestStep or not isnumber( nQuestStep ) then AMB.ErrorLog( 'Quest', 'Unspecified nQuestStep for Quest.NextStep' ) return false end

    local quest = AMB.Quest.GetPlayerQuest( ePly )
    if not quest then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' doesnt to walkthrough quest' ) return false end

    local player_quest_id, player_quest_step = AMB.Quest.GetPlayerQuestID( ePly ), AMB.Quest.GetPlayerQuestStep( ePly )
    if ( player_quest_id ~= nQuestID ) then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' to walkthrough Quest '..player_quest_id..' but nQuestID = '..nQuestID ) return false end
    if ( player_quest_step ~= nQuestStep ) then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' on Step '..player_quest_step..' but nQuestStep = '..nQuestStep ) return false end

    AMB.NW.SetInt( ePly, 'QuestCount', 0 )
    AMB.NW.SetInt( ePly, 'QuestStep', AMB.Quest.GetPlayerQuestStep( ePly ) + 1 )

    local current_step = AMB.Quest.GetPlayerQuestStep( ePly ) -- ID
    local step = quest.steps[ current_step ] -- Table

    AMB.Quest.SaveProgress( ePly )

    if ( current_step > #quest.steps ) then AMB.Quest.End( ePly, true, true ) return true end -- должна вызываться перед step.start() и step.check()

    AMB.Debug( function() 
    
        local player_count = AMB.NW.GetInt( ePly, 'QuestCount' )
        if not step then step = { count = 0 } end
        if not step.count or ( step.count == 0 ) then step.count = 1 end

        MsgC( C.ABS_RED, '[DEBUG] ', C.ABS_WHITE, 'Quest.NextStep '..tostring( ePly )..' Quest[ Q:'..player_quest_id..' S:'..current_step..'/'..#quest.steps..' C:'..player_count..'/'..step.count..' ]\n' ) 
        
    end )

    if step.start then step.start( ePly, quest ) end
    if step.check and step.check( ePly ) then AMB.Quest.NextStep( ePly, nQuestID, current_step ) end

    return true

end

function AMB.Quest.End( ePly, bGiveReward, bSave )

    local quest = AMB.Quest.GetPlayerQuest( ePly )
    if not quest then AMB.ErrorLog( 'Quest', 'Player '..tostring( ePly )..' doesnt to walkthrough quest' ) return false end

    local current_quest_id = AMB.NW.GetInt( ePly, 'Quest' )

    AMB.Debug( function() 
    
        local color = bGiveReward and C.AMB_GREEN or C.AMB_RED
        MsgC( C.ABS_RED, '[DEBUG] ', C.ABS_WHITE, 'Quest.End '..tostring( ePly )..' Quest '..current_quest_id..' bGiveReward = ', color, tostring( bGiveReward )..'\n' ) 

    end )

    if bGiveReward then AMB.Quest.Config.quests[ current_quest_id ].reward.give( ePly, quest ) end
    if bSave then AMB.Quest.FinishProgress( ePly ) end

    AMB.Quest.RemoveProgress( ePly )

    AMB.NW.SetInt( ePly, 'Quest', 0 )
    AMB.NW.SetInt( ePly, 'QuestStep', 0 )
    AMB.NW.SetInt( ePly, 'QuestCount', -1 )

    SendPlayerOnReadyQuests( ePly )

    return true

end

function AMB.Quest.Check( ePly, nCount, nQuestID, nQuestStep )

    -- TODO: AMB.Quest.AddCount( ePly, nCount, nQuestID, nQuestStep ) без ErrorLog проверки
    -- Типа, ошибки и варнинги будут идти и засорять консоль, а эта фича не даст им это сделать, и ошибки/варнинги будут именно тогда, когда будут реальные несостыковки

end

local net_string = AMB.Network.AddString( CFG.net_take_quest )
net.Receive( net_string, function( nLen, ePly )

    if not ePly:IsAuth() then AMB.Adminus.KickCheater( ePly, '3qu000Q', 'Неавторизованный ~p~ попытался взять квест' ) return end
    if AMB.Quest.GetPlayerQuest( ePly ) then AMB.Adminus.KickCheater( ePly, '3qu010Q', 'Проходящий квест ~p~ попытался взять другой квест' ) return end
    if not ePly:Alive() then AMB.Adminus.KickCheater( ePly, '3qu020Q', 'Мёртвый ~p~ попытался взять квест' ) return end

    local id = net.ReadUInt( 4 )
    if ePly.quests_ready_list[ id ] then AMB.Adminus.KickCheater( ePly, '2qu030Q', '~p~ попытался взять пройденный квест' ) return end

    AMB.Quest.Start( ePly, id )

end )

local net_string = AMB.Network.AddString( CFG.net_send_ready_quests_to_client )
hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Quest.SetListReadyQuests', function( ePly )

    SendPlayerOnReadyQuests( ePly )

end )