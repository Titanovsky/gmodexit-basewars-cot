AMB.Adminus.Ranks = AMB.Adminus.Ranks or {}
AMB.Adminus.Ranks.players = AMB.Adminus.Ranks.players or {}
AMB.Adminus.Ranks.forever_time = 60 * 24 * 7 * 4 * 128

local db = AMB.SQL.CreateTable( 'amb_adminus_ranks', 'SteamID TEXT, Rank TEXT, DateStart NUMBER, DateEnd NUMBER' )
local C = AMB.G.C

function AMB.Adminus.Ranks.GetPlayers()

    return AMB.Adminus.Ranks.players

end

function AMB.Adminus.Ranks.PrintPlayers( bFlag )

    if bFlag then PrintTable( AMB.SQL.SelectAll( db ) ) return end

    PrintTable( AMB.Adminus.Ranks.players )

end

function AMB.Adminus.Ranks.SetRank( ePly, sRank, nDataEndMin, sReason )

    if not AMB.Adminus.Config.ranks[ sRank ] then AMB.ErrorLog( 'Adminus', 'Not enough rank: '..sRank ) return false end
    if not IsValid( ePly ) or not ePly:IsPlayer() then AMB.ErrorLog( 'Adminus', 'Player not valid!' ) return false end

    sReason = sReason or ''
    local id = ePly:SteamID()
    local date_start = os.time()
    if ( nDataEndMin > 60*24*4200 ) then nDataEndMin = 60*24*4200 end
    local date_end = os.time()+60*nDataEndMin

    ePly:SetUserGroup( sRank )
    AMB.UI.Chat.SendMessage( ePly, nil, C.AMBITION, '[•] ', C.ABS_WHITE, 'Вы стали ', C.FLAT_GREEN, AMB.Adminus.Config.ranks[ sRank ].true_name, C.ABS_WHITE, '. Причина: ', C.AMB_GRAY, sReason )
    AMB.UI.Chat.SendMessage( ePly, nil, C.AMBITION, '[•] ', C.ABS_WHITE, 'Ваш срок закончится - ', C.AMB_GRAY, os.date( '%d.%m.%y %X', date_end ) )

    AMB.SQL.Get( db, 'Rank', 'SteamID', id, function()
    
        AMB.SQL.Update( db, 'Rank', sRank, 'SteamID', id ) 
        AMB.SQL.Update( db, 'DateStart', date_start, 'SteamID', id )
        AMB.SQL.Update( db, 'DateEnd', date_end, 'SteamID', id )
        
        end, function()
        
        AMB.SQL.Insert( db, 'SteamID, Rank, DateStart, DateEnd', '%s, %s, %i, %i', id, sRank, date_start, date_end )

    end )

    AMB.Adminus.Ranks.players[ id ] = {

        DateEnd = date_end,
        DateStart = date_start,
        Rank = sRank

    }

    return true

end

function AMB.Adminus.Ranks.RemoveRank( ePly, sReason )

    local id = ePly:SteamID()

    if not AMB.Adminus.Ranks.players[ id ] then return end

    sReason = sReason or 'No reason'

    AMB.Adminus.Ranks.players[ id ] = nil
    AMB.SQL.Delete( db, 'SteamID', id )

    ePly:SetUserGroup( 'user' )
    AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_ERROR, '[•] ', C.AMB_WHITE, 'Ваш ранг удалён. Причина: ', C.AMB_GRAY, sReason )

end

hook.Add( 'PostGamemodeLoaded', 'AMB.Adminus.Ranks.SetTableToPlayers', function() 

    local tab_db = AMB.SQL.SelectAll( db )
    if not tab_db then return end

    local tab_db_without_steamid = {} -- TODO: maybe did it without this table?

    for i = 1, #tab_db do

        local id = tab_db[ i ].SteamID

        tab_db[ i ].SteamID = nil
        tab_db_without_steamid[ id ] = tab_db[ i ]

    end
    
    table.Merge( AMB.Adminus.Ranks.players, tab_db_without_steamid )

end )

hook.Add( 'PlayerInitialSpawn', 'AMB.Adminus.Ranks.SetRanksPlayers', function( ePly ) 

    if not AMB.Adminus.Ranks.players[ ePly:SteamID() ] then return end

    local info = AMB.Adminus.Ranks.players[ ePly:SteamID() ] -- по стилю это значение используется два раза (выше), и оно вроде должно быть в начале, но ради оптимизаций оно тут

    if ( tonumber( info.DateEnd ) <= os.time() ) then AMB.Adminus.Ranks.RemoveRank( ePly, 'Истёк срок!' ) return end

    timer.Simple( 0, function() -- timer it is workaround for PlayerInitialSpawn hook. 

        ePly:SetUserGroup( info.Rank )
        AMB.UI.Chat.SendMessage( ePly, nil, C.AMBITION, '[•] ', C.ABS_WHITE, 'Ваш срок закончится - ', C.AMB_GRAY, os.date( '%d.%m.%y %X', info.DateEnd ) )

    end )

end )