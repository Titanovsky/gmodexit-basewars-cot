AMB.Adminus.Modes = AMB.Adminus.Modes or {}
AMB.Adminus.Modes.table = AMB.Adminus.Modes.table or {}

function AMB.Adminus.Modes.Add( sName, sDescription, fAction )

    AMB.Adminus.Modes.table[ string.lower( sName ) ] = { 

        description = sDescription or 'Description',
        func = fAction

    }

end

function AMB.Adminus.Modes.Get( sName )

    return AMB.Adminus.Modes.table[ string.lower( sName ) ]

end

function AMB.Adminus.Modes.GetPlayer( ePly )

    local mode = AMB.NW.GetString( ePly, 'AdminusMode' )
    if not mode or ( #mode == 0 ) then return false end

    return mode

end

function AMB.Adminus.Modes.IsPlayer( ePly, sMode )

    local mode = AMB.NW.GetString( ePly, 'AdminusMode' )
    if not mode or ( #mode == 0 ) then return false end

    return ( mode == sMode )

end

for name, tbl in pairs( AMB.Adminus.Config.modes ) do AMB.Adminus.Modes.Add( name, tbl.description, tbl.func ) end