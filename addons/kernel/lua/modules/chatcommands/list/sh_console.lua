local C, SND, CFG, Add = AMB.G.C, AMB.G.SND, AMB.ChatCommands.Config, AMB.ChatCommands.AddCommand
local type = 'console'

Add( 'retry', type, 'Перезайти на сервер.', 1.5, function( ePly, tArgs ) 

    ePly:RunCommand( 'retry' )

end )

Add( 'stopsound', type, 'Перезайти на сервер.', 1.5, function( ePly, tArgs ) 

    ePly:RunCommand( 'stopsound' )

end )

Add( 'skybox', type, 'Вкл/Выкл Skybox', 1.5, function( ePly, tArgs ) 

    local value = tArgs[ 2 ] or 0
    value = tostring( value )

    ePly:RunCommand( 'r_3dsky '..value )

end )

Add( 'decals', type, 'Очистить декали и спреи', 1.5, function( ePly, tArgs ) 

    for i = 1, 2 do ePly:RunCommand( 'r_cleardecals' )end

end )