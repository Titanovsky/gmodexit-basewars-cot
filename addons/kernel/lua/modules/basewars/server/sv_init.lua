AMB.Gamemode = AMB.Gamemode or {}

AMB.Gamemode.started = AMB.Gamemode.started or false
AMB.Gamemode.gamemode_loaded = AMB.Gamemode.gamemode_loaded or false
AMB.Gamemode.entities_started = AMB.Gamemode.entities_started or false

hook.Add( 'Initialize', 'AMB.Gamemode.Initialize', function() 

    if not AMB.Gamemode.started then 
    
        AMB.Gamemode.started = true 
        AMB.ConsoleLog( 'Gamemode', 'Server has initialized!' )
    
    end

    return AMB.Gamemode.started

end )

hook.Add( 'OnGamemodeLoaded', 'AMB.Gamemode.OnGamemodeLoaded', function()

    if not AMB.Gamemode.gamemode_loaded then 
    
        AMB.Gamemode.gamemode_loaded = true 
        AMB.ConsoleLog( 'Gamemode', 'Server has loaded the gamemode!' )
    
    end

    return AMB.Gamemode.gamemode_loaded

end )

hook.Add( 'InitPostEntity', 'AMB.Gamemode.InitPostEntity', function() 

    if not AMB.Gamemode.entities_started then 
    
        AMB.Gamemode.entities_started = true 
        AMB.ConsoleLog( 'Gamemode', 'Entities has initialized!' )
    
    end

    return AMB.Gamemode.entities_started

end )
