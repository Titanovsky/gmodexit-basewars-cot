local Add = AMB.ChatCommands.AddCommand

Add( 'renderzones', 'Capture', 'Вкл/Выкл рендер зон', 0.75, function( ePly, tArgs ) 

    local arg = tArgs[ 2 ] or '0'

    ePly:RunCommand( 'amb_territory_render '..arg )

end )