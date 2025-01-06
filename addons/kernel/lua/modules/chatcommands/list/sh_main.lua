local C, SND, CFG, Add = AMB.G.C, AMB.G.SND, AMB.ChatCommands.Config, AMB.ChatCommands.AddCommand
local type = 'main'

Add( 'cmd', type, 'Показать все чатовые команды.', 1, function( ePly, tArgs ) 

    local ChatPrint, cmds = AMB.UI.Chat.SendMessage, AMB.ChatCommands.Config.cmds

    ChatPrint( ePly, nil, C.AMBITION, '----------------------------' )

    for cmd, tab in SortedPairsByMemberValue( cmds, 'type' ) do ChatPrint( ePly, nil, C.FLAT_BLUE, cmd, C.AMB_WHITE, ' — '..tab.desc  ) end

    ChatPrint( ePly, nil, C.AMBITION, '----------------------------' )

end )