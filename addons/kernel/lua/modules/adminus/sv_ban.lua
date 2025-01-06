local CFG = AMB.Adminus.Config

local util = util
local AMB = AMB
local SQL = AMB.SQL

local db = SQL.CreateTable( CFG.db_bans, 'SteamID TEXT, SteamID64 TEXT, OwnerSteamID64 TEXT, IP TEXT, JudgeSteamID TEXT, JudgeGamename TEXT, Reason TEXT, DateExists NUMBER, Date NUMBER' )

local function GetReason( sReason, sJudgeName, nDateExists, nDate )

    local date_exists, date_ban, date = os.date( '%X %d.%m.%Y', nDateExists ), os.date( '%X %d.%m.%Y', nDate ), os.date( '%d.%m.%Y', os.time() )
    return 'Вы забанены на Capture of Terra!\n\n---------------------------\nПричина: '..sReason..'\nСудья: '..sJudgeName..'\nДата Разбана: '..date_exists..'\nДата Бана: '..date_ban..'\n---------------------------\n\nДата: '..date

end

local cache_banned_players = {}

function AMB.Adminus.Ban( ePly, anyJudge, sReason, nDateExistsMin )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return end

    sReason = sReason or ''
    nDateExistsMin = nDateExistsMin or 1
    if ( nDateExistsMin > 60 * 24 * 30 * 12 * 11 ) then nDateExistsMin = 60 * 24 * 30 * 12 * 11 end

    local name_judge = anyJudge and AMB.Gamemode.GetStats( anyJudge, 'Gamename' ) or 'SERVER'
    local steamid_judge = anyJudge and anyJudge:SteamID() or ''

    if anyJudge then

        local name = ePly:IsAuth() and AMB.Gamemode.GetStats( ePly, 'Gamename' ) or ePly:Nick()..' ['..ePly:EntIndex()..']'
        anyJudge:ChatPrint( 'Вы забанили: '..name )

    end

    local date_exists = os.time() + nDateExistsMin * 60
    print( '[Adminus] '..name_judge..' banned '..tostring( ePly )..'('..ePly:SteamID()..') until '..os.date( '%X %d.%m.%Y', date_exists ) )

    local keys = 'SteamID, SteamID64, OwnerSteamID64, IP, JudgeSteamID, JudgeGamename, Reason, DateExists, Date'
    local format = '%s, %s, %s, %s, %s, %s, %s, %i, %i'
    local SteamID, SteamID64, OwnerSteamID64, IP = ePly:SteamID(), ePly:SteamID64(), ePly:OwnerSteamID64(), ePly:IPAddress()
    local Date = os.time()

    if AMB.SQL.IsSelect( db, 'SteamID', 'SteamID', SteamID ) then AMB.SQL.Delete( db, 'SteamID', SteamID ) end

    AMB.SQL.Insert( db, keys, format, SteamID, SteamID64, OwnerSteamID64, IP, steamid_judge, name_judge, sReason, date_exists, Date  )

    ePly:Kick( GetReason( sReason, name_judge, date_exists, Date ) )

    cache_banned_players[ SteamID ] = {

        reason = sReason,
        judge_name = name_judge,
        date_exists = date_exists,
        date_ban = Date

    }

end

function AMB.Adminus.BanOffline( sSteamID, anyJudge, sReason, nDateExistsMin )

    local ply = player.GetBySteamID( sSteamID )
    if ply and IsValid( ply ) then AMB.Adminus.Ban( ply, anyJudge, sReason, nDateExistsMin ) return end

    nDateExistsMin = nDateExistsMin or 0
    sReason = sReason or ''

    local name_judge = anyJudge and AMB.Gamemode.GetStats( anyJudge, 'Gamename' ) or 'SERVER'
    local steamid_judge = anyJudge and anyJudge:SteamID() or ''
    local date_exists = os.time() + nDateExistsMin * 60

    if anyJudge then

        anyJudge:ChatPrint( 'Вы забанили: '..sSteamID )

    end

    local keys = 'SteamID, SteamID64, OwnerSteamID64, IP, JudgeSteamID, JudgeGamename, Reason, DateExists, Date'
    local format = '%s, %s, %s, %s, %s, %s, %s, %i, %i'
    local SteamID, SteamID64, OwnerSteamID64, IP = sSteamID, util.SteamIDTo64( sSteamID ), '', ''
    local Date = os.time()

    if AMB.SQL.IsSelect( db, 'SteamID', 'SteamID', SteamID ) then AMB.SQL.Delete( db, 'SteamID', SteamID ) end

    AMB.SQL.Insert( db, keys, format, SteamID, SteamID64, OwnerSteamID64, IP, steamid_judge, name_judge, sReason, date_exists, Date  )

    cache_banned_players[ sSteamID ] = {

        reason = sReason,
        judge_name = name_judge,
        date_exists = date_exists,
        date_ban = Date

    }

    print( '[Adminus] '..name_judge..' banned offline '..tostring( sSteamID )..' until '..os.date( '%X %d.%m.%Y', date_exists ) )

end

function AMB.Adminus.UnBan( sSteamID, anyJudge, sReason )

    if not SQL.IsSelect( db, 'SteamID', 'SteamID', sSteamID ) then return end

    sReason = sReason or ''

    if anyJudge then

        anyJudge:ChatPrint( 'Вы разбанили: '..sSteamID )

    end

    if cache_banned_players[ sSteamID ] then cache_banned_players[ sSteamID ] = nil end

    local name_judge = anyJudge and AMB.Gamemode.GetStats( anyJudge, 'Gamename' ) or 'SERVER'
    AMB.SQL.Delete( db, 'SteamID', sSteamID )

    print( '[Adminus] '..name_judge..' unbanned '..sSteamID..' on reason: '..sReason )

end

hook.Add( 'CheckPassword', 'AMB.Adminus.CheckBan', function( sSteamID64, sIP, sName )

    local id = util.SteamIDFrom64( sSteamID64 )
    local cache = cache_banned_players[ id ]
    if cache then 
    
        local data_exists = cache.data_exists
        if data_exists and ( os.time() < data_exists ) then return false, GetReason( cache.reason, cache.judge_name, cache.date_exists, cache.date_ban ) end

    end

    local is_banned = SQL.IsSelect( db, 'SteamID', 'SteamID', id )
    if not is_banned then return end

    local date_exists = tonumber( SQL.Select( db, 'DateExists', 'SteamID', id ) )
    if ( os.time() >= date_exists ) then 
    
        AMB.Adminus.UnBan( id, nil, 'Истечение срока!' )
        
        return 
        
    end

    cache_banned_players[ id ] = {

        reason = SQL.Select( db, 'Reason', 'SteamID', id ),
        judge_name = SQL.Select( db, 'JudgeGamename', 'SteamID', id ),
        date_exists = tonumber( SQL.Select( db, 'DateExists', 'SteamID', id ) ),
        date_ban = SQL.Select( db, 'Date', 'SteamID', id )

    }
    cache = cache_banned_players[ id ]

    return false, GetReason( cache.reason, cache.judge_name, cache.date_exists, cache.date_ban )

end )