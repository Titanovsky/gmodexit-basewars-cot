AMB.Restrict = AMB.Restrict or {}

function AMB.Restrict.Add( sType, sName, nLevel, tRanks )

    if not AMB.Restrict.Config[ sType ] then return end

    AMB.Restrict.Config[ sType ][ sName ] = {
        
        level = nLevel,
        ranks = tRanks or { user = true, helper = true, moder = true, admin = true, creator = true }

    }

end

AMB.Restrict.Add( 'tools', 'light', 4 )
AMB.Restrict.Add( 'tools', 'colour', 4 )

AMB.Restrict.Add( 'tools', 'stacker', 6 )
AMB.Restrict.Add( 'tools', 'advdupe2', 6 )

-- blocked
AMB.Restrict.Add( 'tools', 'duplicator', 99 )
AMB.Restrict.Add( 'tools', 'weld', 99 )
AMB.Restrict.Add( 'tools', 'axis', 99 )
AMB.Restrict.Add( 'tools', 'dynamite', 99 )
AMB.Restrict.Add( 'tools', 'nocollide', 99 )
AMB.Restrict.Add( 'tools', 'rope', 99 )
AMB.Restrict.Add( 'tools', 'slider', 99 )
AMB.Restrict.Add( 'tools', 'ballsocket', 99 )
AMB.Restrict.Add( 'tools', 'elastic', 99 )
AMB.Restrict.Add( 'tools', 'hyudralic', 99 )
AMB.Restrict.Add( 'tools', 'balloon', 99 )
AMB.Restrict.Add( 'tools', 'hoverball', 99 )
AMB.Restrict.Add( 'tools', 'emitter', 99 )