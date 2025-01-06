AMB.Adminus.Privileges = AMB.Adminus.Privileges or {}
AMB.Adminus.Privileges.players = AMB.Adminus.Privileges.players or {}

local forever_time = 60 * 24 * 7 * 4 * 128
local db = AMB.SQL.CreateTable( 'amb_adminus_privileges', 'SteamID TEXT, Privilege TEXT, DateStart NUMBER, DateEnd NUMBER' )
local C = AMB.G.C

function AMB.Adminus.Privileges.GetPlayers()

    return AMB.Adminus.Privileges.players

end

function AMB.Adminus.Privileges.PrintPlayers( bFlag )

    if bFlag then PrintTable( AMB.SQL.SelectAll( db ) ) return end

    PrintTable( AMB.Adminus.Privileges.players )

end

function AMB.Adminus.Privileges.SetPrivilege( ePly, sPrivilege, nDataEndInMinutes, sReason )

    if not AMB.Adminus.Privileges.table[ sRank ] then AMB.ErrorLog( 'Adminus', 'Not enough privelege: '..sRank ) return false end
    if not IsValid( ePly ) or not ePly:IsPlayer() then AMB.ErrorLog( 'Adminus', 'Player SetPrivilege('..tostring( ePly )..') not valid!' ) return false end

    sReason = sReason or ''
    local id = ePly:SteamID()
    local date_start = os.time()
    local date_end = os.time()+60*nDataEndInMinutes

    ePly:SetNWString( 'AdminusPrivilege', sPrivilege )
    AMB.UI.Chat.SendMessage( ePly, nil, C.AMBITION, '[•] ', C.ABS_WHITE, 'Вам дана привилегия ', C.FLAT_GREEN, AMB.Adminus.Privileges.table[ sPrivilege ].true_name, C.ABS_WHITE, '. Причина: ', C.AMB_GRAY, sReason )
    AMB.UI.Chat.SendMessage( ePly, nil, C.AMBITION, '[•] ', C.ABS_WHITE, 'Ваш срок закончится ', C.AMB_GRAY, os.date( '[%d.%m.%y %X]', date_end ) )

    AMB.SQL.Get( db, 'Privilege', 'SteamID', id, function()
    
        AMB.SQL.Update( db, 'Privilege', sPrivilege, 'SteamID', id ) 
        AMB.SQL.Update( db, 'DateStart', date_start, 'SteamID', id )
        AMB.SQL.Update( db, 'DateEnd', date_end, 'SteamID', id )
        
        end, function()
        
        AMB.SQL.Insert( db, 'SteamID, Privilege, DateStart, DateEnd', '%s, %s, %i, %i', id, sPrivilege, date_start, date_end )

    end )

    AMB.Adminus.Privileges.players[ id ] = {

        DateEnd = date_end,
        DateStart = date_start,
        Privilege = sPrivilege

    }

    return true

end

function AMB.Adminus.Privileges.RemovePrivilege( ePly, sReason )

    local id = ePly:SteamID()

    if not AMB.Adminus.Privileges.players[ id ] then return false end

    sReason = sReason or 'No reason'

    AMB.Adminus.Privileges.players[ id ] = nil
    AMB.SQL.Delete( db, 'SteamID', id )

    ePly:SetNWString( 'AdminusPrivilege', nil )
    AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_ERROR, '[•] ', C.AMB_WHITE, 'Ваша привилегия удалена. Причина: ', C.AMB_GRAY, sReason )

    return true

end

hook.Add( 'Initialize', 'AMB.Adminus.Privileges.SetTableToPlayers', function() 

    local tab_db = AMB.SQL.SelectAll( db )
    if not tab_db then return end

    local tab_db_without_steamid = {} -- TODO: maybe did it without this table?

    for i = 1, #tab_db do

        local id = tab_db[ i ].SteamID

        tab_db[ i ].SteamID = nil
        tab_db_without_steamid[ id ] = tab_db[ i ]

    end
    
    table.Merge( AMB.Adminus.Privileges.players, tab_db_without_steamid )

end )

hook.Add( 'PlayerInitialSpawn', 'AMB.Adminus.Privileges.SetPrivilegePlayers', function( ePly ) 

    if not AMB.Adminus.Privileges.players[ ePly:SteamID() ] then return end

    local info = AMB.Adminus.Privileges.players[ ePly:SteamID() ]

    if ( tonumber( info.DateEnd ) <= os.time() ) then AMB.Adminus.Privileges.RemovePrivilege( ePly, 'Истёк срок!' ) return end

    timer.Simple( 0, function()

        AMB.Stats.SetStats( ePly, 'adminus_privilege', info.Rank )
        AMB.UI.Chat.SendMessage( ePly, nil, C.AMBITION, '[•] ', C.ABS_WHITE, 'Срок привилегий закончится ', C.AMB_GRAY, os.date( '[%d.%m.%y %X]', info.DateEnd ) )

    end )

end )