AMB.Fine.players = AMB.Fine.players or {}

local C, SND, AddChat = AMB.G.C, AMB.G.SND, AMB.UI.Chat.SendMessage
-- ## SDK #####################
function AMB.Fine.Add( sName, sDescription, nDelay, nAddTime, nMaxTries, fPunishment )

    if not fPunishment or not isfunction( fPunishment ) then AMB.ErrorLog( 'Fine', 'fPunishment in '..tostring( sName )..' not selected!' ) return end

    local id = #AMB.Fine.Config.fines + 1

    for i, v in ipairs( AMB.Fine.Config.fines ) do

        id = ( v.name == sName ) and i or id

    end

    AMB.Fine.Config.fines[ id ] = {

        name = sName or 'TEST',
        desc = sName or 'DESCRIPTION',
        delay = nDelay or 1,
        addtime = nAddTime or 0.05,
        tries = nMaxTries or 2,
        punishment = fPunishment

    }

    print( '[Fine] Added fine: '..sName..' ('..id..')' )

end

function AMB.Fine.Get( sName )

    for i, v in ipairs( AMB.Fine.Config.fines ) do

        if ( v.name == sName ) then return v end

    end

end

-- ## Players ###################
function AMB.Fine.SetPlayerFine( sSteamID64, sName, nCount )

    AMB.Fine.players[ sSteamID64 ][ sName ] = nCount

end

function AMB.Fine.AddPlayerFine( sSteamID64, sName, nCount )

    AMB.Fine.players[ sSteamID64 ][ sName ] = AMB.Fine.GetPlayerFine( sSteamID64, sName ) + nCount

end

function AMB.Fine.GetPlayerFine( sSteamID64, sName )

    return AMB.Fine.players[ sSteamID64 ][ sName ] or 0

end

-- ## Controller ###################
local TCreate, TRemove, TExists, TGetTime = timer.Create, timer.Remove, timer.Exists, function( sName ) return math.Round( timer.TimeLeft( sName ), 2 ) end

function AMB.Fine.Give( ePly, sName )

    if not IsValid( ePly ) then return end

    local fine = AMB.Fine.Get( sName or '' )
    if not fine then return end

    local steamid64 = ePly:SteamID64()
    local timer_name = 'Fine:'..sName..':'..steamid64
    if TExists( timer_name ) then AMB.Fine.Up( ePly, sName, 1 ) return end
    
    AMB.Fine.SetPlayerFine( steamid64, sName, 1 )
    TCreate( timer_name, fine.delay, 1, function() AMB.Fine.SetPlayerFine( steamid64, sName, 0 ) end )

end

function AMB.Fine.Up( ePly, sName, nTries )

    if not IsValid( ePly ) then return end

    local steamid64 = ePly:SteamID64()
    local timer_name = 'Fine:'..sName..':'..steamid64
    if not TExists( timer_name ) then return end

    local fine = AMB.Fine.Get( sName or '' )
    if not fine then return end

    TCreate( timer_name, TGetTime( timer_name ) + fine.addtime, 1, function() AMB.Fine.SetPlayerFine( steamid64, sName, 0 ) end )

    AMB.Fine.AddPlayerFine( steamid64, sName, 1 )

    local count = AMB.Fine.GetPlayerFine( steamid64, sName )

    local try1, try2, try3, try4 = fine.tries - 4, fine.tries - 3, fine.tries - 2, fine.tries - 1
    if ( count == try1 ) or ( count == try2 ) or ( count == try3 ) or ( count == try4 ) then AddChat( ePly, SND.ERROR, C.AMB_GRAY, 'Пожалуйста, подождите..' ) end

    if ( count >= fine.tries ) then

        TRemove( timer_name )
        AMB.Fine.Punish( ePly, sName )

    end

end

function AMB.Fine.Punish( ePly, sName )

    if not IsValid( ePly ) then return end

    local fine = AMB.Fine.Get( sName or '' )
    if not fine then return end

    local name = ePly:IsAuth() and AMB.Gamemode.GetStats( ePly, 'Gamename' )..' ('..ePly:SteamID()..')' or '(NoAuth) '..ePly:Nick()..' ('..ePly:SteamID()..')'
    print( '[Fine] Player '..name..' got a punishment '..sName..' ['..AMB.Fine.GetPlayerFine( ePly:SteamID64(), sName )..'/'..fine.tries..']' )

    fine.punishment( ePly )

    local sid64 = ePly:SteamID64()
    timer.Simple( 2, function()

        AMB.Fine.SetPlayerFine( sid64, sName, 0 )

    end )

end

hook.Add( 'PlayerInitialSpawn', 'AMB.Fine.AddTableForAllPlayers', function( ePly ) 

    if ePly:IsBot() then return end

    AMB.Fine.players[ ePly:SteamID64() ] = AMB.Fine.players[ ePly:SteamID64() ] or {} 
    
end )