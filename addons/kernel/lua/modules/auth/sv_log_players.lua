AMB.Auth.log_players = AMB.Auth.log_players or {}

function AMB.Auth.GetLogPlayers()

    return AMB.Auth.log_players

end

hook.Add( 'CheckPassword', 'AMB.Auth.LogPlayers', function( sSteamID64, sIP, _, _, sName )

    local steamid = util.SteamIDFrom64( sSteamID64 )

    print( '[Auth] CheckPassword: ['..sName..'] ['..steamid..'] ['..sIP..'] ['..os.date( '%X', os.time() )..']' )

    timer.Simple( 1, function()

        AMB.Auth.log_players[ steamid ] = {

            name = sName,
            ip = sIP,
            sid64 = sSteamID64,
            date = os.time(),
            valid = false

        }

    end )

end )

hook.Add( 'PlayerDisconnected', 'AMB.Auth.LogPlayers', function( ePly )

    if ePly:IsBot() then return end

    local id = ePly:SteamID()
    AMB.Auth.log_players[ id ].valid = false
    AMB.Auth.log_players[ id ].disconnected = {

        name = ePly:Name(),
        ip = ePly:IPAddress(),
        date = os.time()

    }

end )

hook.Add( 'PlayerInitialSpawn', 'AMB.Auth.LogPlayers', function( ePly )

    if ePly:IsBot() then return end

    local id = ePly:SteamID()
    AMB.Auth.log_players[ id ].valid = true
    AMB.Auth.log_players[ id ].initial = {

        steamid = ePly:SteamID(),
        ownersteamid64 = ePly:OwnerSteamID64(),
        date = os.time()

    }

end )

local GetStats = AMB.Gamemode.GetStats
hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Auth.LogPlayers', function( ePly )

    local id = ePly:SteamID()
    AMB.Auth.log_players[ id ].authorized = {

        gamename = GetStats( ePly, 'Gamename' ),
        level = GetStats( ePly, 'Level' ),
        xp = GetStats( ePly, 'XP' ),
        money = GetStats( ePly, 'Money' ),
        skin = GetStats( ePly, 'Skin' ),
        date = os.time()

    }

end )
