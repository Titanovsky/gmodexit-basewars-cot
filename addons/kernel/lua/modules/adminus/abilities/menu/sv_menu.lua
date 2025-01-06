AMB.Adminus = AMB.Adminus or {}
AMB.Adminus.Abilities = AMB.Adminus.Abilities or {} 

AMB.Network.AddString( 'amb_adminus_call_from_menu' ) 
net.Receive( 'amb_adminus_call_from_menu' , function( nLen, ePly ) 

    local ability = net.ReadString()
    if not ability then return end

    local args = net.ReadTable()
    if not args then return end

    for k, arg in pairs( args ) do

        if string.StartWith( arg, 'gamename' ) then

            local name = string.Explode( '_', arg )[ 2 ]
            args[ k ] = 'F'
            args[ k ] = AMB.Adminus.ValidationPlayer( name )

        end

    end

    if not AMB.Adminus.ValidationAccess( ePly, AMB.Adminus.GetAccess( ability ) ) then AMB.Adminus.KickCheater( ePly, '2ad000M', '~p~ попытался вызвать Ability без пройденной валидаций на сервере' ) return end

    AMB.Adminus.Abilities.table[ ability ].func( ePly, args )

end )