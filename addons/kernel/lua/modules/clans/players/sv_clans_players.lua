local CFG = AMB.Clans.Config
local C = AMB.G.C

local db = AMB.SQL.CreateTable( CFG.db_players, 'SteamID TEXT, Gamename TEXT, Clan NUMBER, Rank NUMBER, Date NUMBER' )

local function SendTable( nID )

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) ~= nID ) then continue end

        net.Start( 'amb_clans_send_table_client' )
            net.WriteUInt( nID, 12 )
            net.WriteTable( AMB.Clans.table[ nID ] )
        net.Send( ply )

    end

end

function AMB.Clans.AddPlayer( ePly, nID )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not AMB.Clans.GetClan( nID ) then return end
    if AMB.Clans.PlayerIsClan( ePly ) then return end
    if AMB.Clans.GetClanMembersLimit( nID ) then return end

    local steamid = ePly:SteamID()
    local name = AMB.Gamemode.GetStats( ePly, 'Gamename' )
    local rank = ( AMB.Clans.PlayerGetRank( ePly ) == 0 ) and 1 or AMB.Clans.PlayerGetRank( ePly )
    local date = os.time()

    AMB.SQL.Get( db, 'Gamename', 'SteamID', steamid, function()
    
        AMB.SQL.Update( db, 'Gamename', name, 'SteamID', steamid ) 
        AMB.SQL.Update( db, 'Clan', nID, 'SteamID', steamid )
        AMB.SQL.Update( db, 'Rank', rank, 'SteamID', steamid )
        AMB.SQL.Update( db, 'Date', date, 'SteamID', steamid )
        
        end, function()
        
        AMB.SQL.Insert( db, 'SteamID, Gamename, Clan, Rank, Date', '%s, %s, %i, %i, %i', steamid, name, nID, rank, date )

    end )

    AMB.NW.SetInt( ePly, 'Clan', nID )
    AMB.NW.SetInt( ePly, 'ClanRank', rank )
    AMB.Clans.SetModelColor( ePly )

    AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Вы присоединилсь к клану ', AMB.Clans.GetClanColor( nID ), AMB.Clans.GetClanName( nID ), C.ABS_WHITE, ' ['..nID..']' )

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == nID ) then AMB.UI.Chat.SendMessage( ply, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Игрок ', C.AMB_BLUE, AMB.Gamemode.GetStats( ePly, 'Gamename' ), C.ABS_WHITE, ' присоединился в клан!' ) end

    end

    AMB.Clans.SetMembers( nID )
    SendTable( nID )

    hook.Call( 'AmbitionClansConnectedPlayer', nil, ePly, nID, AMB.Clans.GetClan( nID ) )

end

function AMB.Clans.RemovePlayer( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not AMB.Clans.PlayerIsClan( ePly ) then return end

    local ID, CFG = AMB.Clans.PlayerGetClanID( ePly ), AMB.Clans.Config

    AMB.NW.SetInt( ePly, 'Clan', 0 )
    AMB.NW.SetInt( ePly, 'ClanRank', 0 )
    ePly:SetPlayerColor( C.ABS_BLACK:ToVector() )
    AMB.SQL.Delete( db, 'SteamID', ePly:SteamID() )
    AMB.UI.Chat.SendMessage( ePly, CFG.remove_player_sound, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Вы покинули клан: ', C.AMB_RED, ID )

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == ID ) then AMB.UI.Chat.SendMessage( ply, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Игрок ', C.AMB_RED, AMB.Gamemode.GetStats( ePly, 'Gamename'), C.ABS_WHITE, ' покинул клан!' ) end

    end

    AMB.Clans.SetMembers( ID )
    SendTable( ID )

end

function AMB.Clans.RemovePlayerOffline( sSteamID )

    local ply = player.GetBySteamID( sSteamID )
    if ply and IsValid( ply ) then AMB.Clans.RemovePlayer( ply ) return end

    local ID = AMB.SQL.Select( db, 'Clan', 'SteamID', sSteamID )
    if not ID then return end
    ID = tonumber( ID )

    AMB.SQL.Delete( db, 'SteamID', sSteamID )
    AMB.Clans.SetMembers( ID )
    SendTable( ID )

end

function AMB.Clans.RemovePlayers( nID )

    for _, ply in ipairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == nID ) then AMB.Clans.RemovePlayer( ply ) end

    end

    AMB.SQL.Delete( db, 'Clan', nID )
    SendTable( nID )

end

-- ##  ########################################
AMB.Network.AddString( 'amb_clans_players_to_invite' )
function AMB.Clans.InvitePlayer( ePly, nIndex )

    if timer.Exists( 'AMBTimeClansToInvite:'..ePly:SteamID() ) then return end

    ePly.id_invite = nIndex

    timer.Create( 'AMBTimeClansToInvite:'..ePly:SteamID(), CFG.invite_delay, 1, function()

        if not IsValid( ePly ) then return end

        ePly.id_invite = nil

    end )

    net.Start( 'amb_clans_players_to_invite' )
        net.WriteUInt( nIndex, 16 )
    net.Send( ePly )

end

-- ## Change  #################################

function AMB.Clans.SetModelColor( ePly )

    local clan = AMB.Clans.PlayerGetClan( ePly )

    ePly:SetPlayerColor( clan.color:ToVector() )

end

function AMB.Clans.SetRankOffline( sSteamID, nRank, eChanger )

    nRank = math.floor( nRank )

    local ply = player.GetBySteamID( sSteamID )

    if ply and IsValid( ply ) then AMB.Clans.SetRank( ply, nRank, eChanger ) return end

    AMB.SQL.Update( db, 'Rank', nRank, 'SteamID', sSteamID )

    local id = AMB.Clans.PlayerGetClanID( eChanger )
    AMB.Clans.SetMembers( id )
    SendTable( id )

end

function AMB.Clans.SetRank( ePly, nRank, eChanger )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not AMB.Clans.PlayerIsClan( ePly ) then return end

    nRank = math.floor( nRank )

    local old_rank = AMB.Clans.PlayerGetRank( ePly )
    if ( nRank > 6 ) then return end
    if ( nRank < 1 ) then return end

    local changer_name = IsValid( eChanger ) and AMB.Gamemode.GetStats( eChanger, 'Gamename' ) or 'CONSOLE'
    local text_changed = ( old_rank <= nRank ) and ' повысил' or ' понизил'

    AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Со-клановец ', C.FLAT_GREEN, changer_name, C.ABS_WHITE, text_changed..' ваш ранг с ', C.AMB_PURPLE, tostring( old_rank ), C.AMB_GREEN, ' >> ', C.AMB_PURPLE, tostring( nRank ) )

    AMB.NW.SetInt( ePly, 'ClanRank', nRank )
    AMB.SQL.Update( db, 'Rank', nRank, 'SteamID', ePly:SteamID() )

    local id = AMB.Clans.PlayerGetClanID( eChanger )
    AMB.Clans.SetMembers( id )
    SendTable( id )

end

function AMB.Clans.SetHightlight( ePly ) -- TODO

    local id = AMB.Clans.PlayerGetClanID( ePly )
    AMB.Clans.SetMembers( id )
    SendTable( id )

end

-- ## Get Offline ##############################

function AMB.Clans.GetPlayerOfflineClanID( sSteamID )

    local clan_id = AMB.SQL.Select( db, 'Clan', 'SteamID', sSteamID )
    if clan_id then clan_id = tonumber( clan_id ) else return 0 end
    
    return clan_id

end

function AMB.Clans.GetPlayerOfflineRank( sSteamID )

    local rank = AMB.SQL.Select( db, 'Rank', 'SteamID', sSteamID )
    if rank then rank = tonumber( rank ) else return -1 end

    return rank

end

function AMB.Clans.GetPlayerOfflineGamename( sSteamID )

    local gamename = AMB.SQL.Select( db, 'Gamename', 'SteamID', sSteamID )
    if not gamename then return '' end

    return gamename

end

-- #############################################

hook.Add( 'PlayerSpawn', 'AMB.Clans.SetColorModel', function( ePly )

    timer.Simple( 0, function()
    
        if AMB.Clans.PlayerIsClan( ePly ) then AMB.Clans.SetModelColor( ePly ) end

    end )

end )

hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Clans.SetPlayerInClan', function( ePly )

    local SteamID = ePly:SteamID()
    local ID = AMB.SQL.Select( db, 'Clan', 'SteamID', SteamID )
    if AMB.Utility.StringIsNullOrWhitespaces( ID ) then return end

    ID = tonumber( ID )
    local clan = AMB.Clans.GetClan( ID )
    local rank = tonumber( AMB.SQL.Select( db, 'Rank', 'SteamID', SteamID ) )
    local date = tonumber( AMB.SQL.Select( db, 'Date', 'SteamID', SteamID ) )

    if clan then  

        AMB.NW.SetInt( ePly, 'Clan', ID )
        AMB.NW.SetInt( ePly, 'ClanRank', rank )
        AMB.Clans.SetModelColor( ePly )
        AMB.SQL.Update( db, 'Gamename', AMB.Gamemode.GetStats( ePly, 'Gamename' ), 'SteamID', SteamID )
        AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Вы подключены к клану ', clan.color, clan.name, C.ABS_WHITE, ' ['..ID..']' )

    elseif not clan or ( clan.date > date ) then

        AMB.SQL.Delete( db, 'SteamID', SteamID )
        AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Клан ', C.AMB_PURPLE, ID, C.ABS_WHITE, ' был удалён!' )

    end

end )
