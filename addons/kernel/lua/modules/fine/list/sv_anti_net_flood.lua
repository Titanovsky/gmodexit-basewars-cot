local Add, Give, AddPly = AMB.Fine.Add, AMB.Fine.Give, AMB.Fine.AddPlayerFine

AMB.Fine.Config.net_log = true
AMB.Fine.Config.net_delay = 0.25
AMB.Fine.Config.net_addtime = 0.55
AMB.Fine.Config.net_tries = 64
AMB.Fine.Config.net_tries_for_ban = 4

AMB.Fine.tries_for_ban = AMB.Fine.tries_for_ban or {}

local antinetflood = 'AntiNetFlood'
Add( antinetflood, 'Защита от флуда в net сообщениях', AMB.Fine.Config.net_delay, AMB.Fine.Config.net_addtime, AMB.Fine.Config.net_tries, function( ePly )

    local gamename, steamid, steamid64, steamid64owner, ip = ePly:GetGamename(), ePly:SteamID(), ePly:SteamID64(), ePly:OwnerSteamID64(), ePly:IPAddress()
    ePly:Kick( '[AntiCheat] Вы кикнуты за флуд на сервер!' )

    local tries_for_ban = AMB.Fine.tries_for_ban[ steamid ]
    if not tries_for_ban then 
    
        AMB.Fine.tries_for_ban[ steamid ] = 0
        tries_for_ban = 0

    end

    if ( tries_for_ban < AMB.Fine.Config.net_tres_for_ban ) then

        AMB.Fine.tries_for_ban[ steamid ] = tries_for_ban + 1

    elseif ( tries_for_ban == AMB.Fine.Config.net_tres_for_ban ) then

        AMB.Fine.tries_for_ban[ steamid ] = 0
        print( '\n---------- Suspect Cheater -------------' )
        print( '1. Gamename: '..gamename )
        print( '2. SteamID: '..steamid )
        print( '3. SteamID64: '..steamid64 )
        print( '4. SteamID64Owner: '..steamid64owner )
        print( '5. IP: '..ip )
        print( '6. Date: '..os.date( '%x %X', os.time() ) )
        print( '\n----------------------------------------' )

        AMB.Adminus.BanOffline( steamid, nil, 'Подозрение в читерстве (Net-Flood)', 60 * 14 )
        
    end

end )

local function CheckNetReceiver( nLen, ePly )

    if not IsValid( ePly ) then return -1 end

    local steamid64 = ePly:SteamID64()
    if not ePly:IsAuth() then AddPly( steamid64, antinetflood, 1 ) end

    local count, tries = AMB.Fine.GetPlayerFine( steamid64, antinetflood ), AMB.Fine.Config.net_tries
    if ( count >= tries - 4 ) then return -1 end

    return 0

end

local block = {  

    [ 'arccw_rqwpnnet' ] = true,
    [ 'arccw_quicknade' ] = true,
    [ 'arccw_sendattinv' ] = true,
    [ 'arccw_reloadatts' ] = true,
    [ 'arccw_togglecustomize' ] = true,
    [ 'arccw_slidepos' ] = true 

}

function net.Incoming( nLen, ePly )

    if not IsValid( ePly ) then return end

    local count = AMB.Fine.players[ ePly:SteamID64() ][ 'AntiNetFlood' ]
    if count and ( count >= 64 ) then return end

    local message = util.NetworkIDToString( net.ReadHeader() or '' )
	if not message then return end

    if not block[ message ] then Give( ePly, antinetflood ) end
	
	local func = net.Receivers[ message:lower() ]
	if not func then return end
	
    local name, steamid = ePly:IsAuth() and AMB.Gamemode.GetStats( ePly, 'Gamename' ) or ePly:Nick()..' (NoAuth)', ePly:SteamID()
    if AMB.Fine.Config.net_log then print( '[Receive] '..message..' | '..name..' ('..steamid..') | '..AMB.Fine.GetPlayerFine( ePly:SteamID64(), 'AntiNetFlood' )..'/64' ) end

    local result = CheckNetReceiver( nLen, ePly )
    if ( result == 0 ) and IsValid( ePly ) then func( nLen - 16, ePly ) end

end

local n = 0
util.AddNetworkString( '1234' )
net.Receive( '1234', function()

    n = n + 1
    print( '>> '..n )

end )