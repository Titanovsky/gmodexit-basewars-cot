local players = {}

hook.Add( 'CheckPassword', 'AMB.Auth.AntiSpamConnections', function( sSteamID64, sIP, _, _, sName )

    --[[] ПУШО НЕАДЕКВАТНАЯ СОБАКА НЕ ХЧОЕТ НОМР РАБОТАТЬ
    local count = players[ sSteamID64 ] or 0
    count = count + 1
    players[ sSteamID64 ] = count

    if ( count > 3 ) then 

        timer.Create( 'TimeCheckPassword:'..sSteamID64, 4, 1, function() players[ sSteamID64 ] = 0 end )

        print( '[Auth] Player '..sName..' ('..util.SteamIDFrom64( sSteamID64 )..') is reached the limit of connections!' )
        return false, 'Пожалуйста, подождите...' 
        
    end
    ]]

end )