function AMB.Adminus.ValidationAccess( ePly, nAccess )

    return AMB.Adminus.Config.ranks[ AMB.Adminus.Ranks.GetRank( ePly ) ].access >= nAccess

end

function AMB.Adminus.ValidationPlayer( sArg )

    sArg = sArg or ''

    local players = {}
    
    if string.StartWith( sArg, 'STEAM_' ) then

        for _, ply in pairs( player.GetAll() ) do

            local ID = ply:SteamID()
            
            if string.find( ID, sArg ) then table.insert( players, ply ) end

        end

    elseif string.StartWith( sArg, '"' ) then

        local arg = string.gsub( sArg, '"', '' ) 

        for _, ply in pairs( player.GetAll() ) do

            if ( AMB.Gamemode.GetStats( ply, 'Gamename' ) == arg ) then return ply end

        end

        return false

    else

        for _, ply in pairs( player.GetAll() ) do

            local gamename = AMB.NW.GetString( ply, 'Gamename' )

            sArg = string.lower( sArg )
            gamename = string.lower( gamename )
            
            if string.find( gamename, sArg ) then table.insert( players, ply ) end
            if ( gamename == sArg ) then return ply end

        end

    end

    if ( #players == 0 ) or ( #players > 1 ) then return false end

    return players[ 1 ]
    
end

function AMB.Adminus.GetAccess( sName )

    if not AMB.Adminus.Abilities.table[ sName ] then return false end

    return AMB.Adminus.Abilities.table[ sName ].access 

end