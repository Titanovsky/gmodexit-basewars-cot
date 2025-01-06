local CFG = AMB.Quest.Config
local C = AMB.G.C

local db = AMB.SQL.CreateTable( CFG.db, 'SteamID, Gamename, Quest, Step, Count' )
local db_finish = AMB.SQL.CreateTable( CFG.db_finish, 'SteamID, Gamename, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8' )

function AMB.Quest.SaveProgress( ePly )

    if not AMB.Quest.GetPlayerQuest( ePly ) then return false end

    local SteamID = ePly:SteamID()
    local Gamename = AMB.Gamemode.GetStats( ePly, 'Gamename' )
    local Quest = AMB.NW.GetInt( ePly, 'Quest' )
    local Step = AMB.NW.GetInt( ePly, 'QuestStep' )
    local Count = AMB.NW.GetInt( ePly, 'QuestCount' )

    AMB.SQL.Get( db, 'SteamID', 'SteamID', SteamID, function()

        AMB.SQL.Update( db, 'Gamename', Gamename, 'SteamID', SteamID )
        AMB.SQL.Update( db, 'Quest', Quest, 'SteamID', SteamID )
        AMB.SQL.Update( db, 'Step', Step, 'SteamID', SteamID )
        AMB.SQL.Update( db, 'Count', Count, 'SteamID', SteamID )

    end, function()

        AMB.SQL.Insert( db, 'SteamID, Gamename, Quest, Step, Count', '%s, %s, %i, %i, %i', SteamID, Gamename, Quest, Step, Count )

    end )

    return true

end

function AMB.Quest.FinishProgress( ePly )

    if not AMB.Quest.GetPlayerQuest( ePly ) then return end

    local SteamID = ePly:SteamID()
    local Gamename = AMB.Gamemode.GetStats( ePly, 'Gamename' )
    local Quest = AMB.NW.GetInt( ePly, 'Quest' )

    AMB.SQL.Get( db_finish, 'SteamID', 'SteamID', SteamID, function()

        AMB.SQL.Update( db_finish, 'Gamename', Gamename, 'SteamID', SteamID )
        AMB.SQL.Update( db_finish, 'Q'..Quest, '+', 'SteamID', SteamID )

    end, function()

        AMB.SQL.Insert( db_finish, 'SteamID, Gamename, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8', '%s, %s, %s, %s, %s, %s, %s, %s, %s, %s', SteamID, Gamename, '', '', '', '', '', '', '', '' )
        AMB.SQL.Update( db_finish, 'Q'..Quest, '+', 'SteamID', SteamID )

    end )

end

function AMB.Quest.GetFinishQuest( ePly, nID )

    local quest = AMB.SQL.Select( db_finish, 'Q'..nID, 'SteamID', ePly:SteamID() )
    if not quest then return false end

    return ( quest == '+' )

end

local function SendPlayerOnReadyQuests( ePly )

    ePly.quests_ready_list = {}
    for i = 1, 8 do ePly.quests_ready_list[ i ] = AMB.Quest.GetFinishQuest( ePly, i ) end
    
    net.Start( CFG.net_send_ready_quests_to_client )
        net.WriteTable( ePly.quests_ready_list or { false, false, false, false, false, false, false } ) -- пока что делаем 8 квестов
    net.Send( ePly )

end

function AMB.Quest.ClearQuest( ePly, nID )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not nID then return end

    AMB.SQL.Update( db_finish, 'Q'..nID, '', 'SteamID', ePly:SteamID() )
    SendPlayerOnReadyQuests( ePly )

    print( '[Quest] Clear Quest '..nID..' to player '..ePly:GetGamename() )

end

function AMB.Quest.ClearFinishQuests( ePly )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return end

    for i = 1, 8 do

        AMB.SQL.Update( db_finish, 'Q'..i, '', 'SteamID', ePly:SteamID() )
        SendPlayerOnReadyQuests( ePly )
        print( '[Quest] Clear Quest '..i..' to player '..ePly:GetGamename() )

    end

end

function AMB.Quest.ClearQuestFromSteamID( sSteamID, nID )

    if not sSteamID then return end
    if not nID then return end

    local ply = player.GetBySteamID( sSteamID )
    if IsValid( ply ) then AMB.Quest.ClearQuest( ply, nID ) return end

    AMB.SQL.Update( db_finish, 'Q'..nID, '', 'SteamID', sSteamID )

    print( '[Quest] Clear quest '..nID..' to '..sSteamID )

end

function AMB.Quest.RemoveProgress( ePly )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return end

    AMB.SQL.Delete( db, 'SteamID', ePly:SteamID() )
    SendPlayerOnReadyQuests( ePly )

    print( '[Quest] Remove all progress on '..ePly:GetGamename() )

end

function AMB.Quest.RemoveProgressFromSteamID( sSteamID )

    if not sSteamID then return end

    local ply = player.GetBySteamID( sSteamID )
    if IsValid( ply ) then AMB.Quest.RemoveProgress( ply ) return end

    AMB.SQL.Delete( db, 'SteamID', sSteamID )

    print( '[Quest] Remove all progress on '..sSteamID )

end

local Select = function( ePly, sKey ) return tonumber( AMB.SQL.Select( db, sKey, 'SteamID', ePly:SteamID() ) ) end

hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Quest.ReturnProgress', function( ePly )

    if not AMB.SQL.IsSelect( db, 'Quest', 'SteamID', ePly:SteamID() ) then return end

    local player_quest, player_step, player_count = Select( ePly, 'Quest' ), Select( ePly, 'Step' ), Select( ePly, 'Count' )
    
    local quest = AMB.Quest.Config.quests[ player_quest ]
    if not quest then AMB.Quest.RemoveProgress( ePly ) return end

    local step = quest.steps[ player_step ]
    if not step then AMB.Quest.RemoveProgress( ePly ) return end

    AMB.NW.SetInt( ePly, 'Quest', player_quest )
    AMB.NW.SetInt( ePly, 'QuestStep', player_step )
    AMB.NW.SetInt( ePly, 'QuestCount', player_count )

    if step.retry then step.retry( ePly, quest ) end
    if step.check and step.check( ePly ) then AMB.Quest.NextStep( ePly, player_quest, player_step ) end

end )