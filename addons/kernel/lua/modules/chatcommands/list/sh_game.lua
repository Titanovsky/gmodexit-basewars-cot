local C, SND, CFG, Add = AMB.G.C, AMB.G.SND, AMB.ChatCommands.Config, AMB.ChatCommands.AddCommand
local type = 'game'

Add( 'help', type, 'Показать помощь.', 1, function( ePly, tArgs ) 

    local ChatPrint = AMB.UI.Chat.SendMessage

    ChatPrint( ePly, nil, C.AMB_GREEN, '♦ ', C.ABS_WHITE, 'Просто играй и наслаждайся, родненький ;)' )

end )

Add( 'shop', type, 'Открыть магазин.', 0.25, function( ePly, tArgs ) 

    ePly:RunCommand( 'amb_mm 2' )
 
end )

Add( 'f4', type, 'Изменить страницу при открытий Главного Меню на F4.', 0.25, function( ePly, tArgs ) 

    local value = tArgs[ 2 ] or ''

    ePly:RunCommand( 'amb_mm_cot_page_f4 '..value )
 
end )

Add( 'tab', type, 'Изменить страницу при открытий Главного Меню на TAB.', 0.25, function( ePly, tArgs ) 

    local value = tArgs[ 2 ] or ''

    ePly:RunCommand( 'amb_mm_cot_page_tab '..value )
 
end )

Add( 'hud', type, 'Изменить худ.', 0.25, function( ePly, tArgs ) 

    local value = tArgs[ 2 ] or '0'

    ePly:RunCommand( 'amb_hud_cot '..value )
 
end )

-- urls

local type = 'urls'
Add( 'content', type, 'Открыть контент сервера', 1, function( ePly, tArgs ) 

    ePly:SendLua( 'gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=2464641173")' )
    ePly:ChatSend( C.AMBITION, '>> ', C.FLAT_BLUE, 'https://steamcommunity.com/sharedfiles/filedetails/?id=2464641173' )
 
end )

Add( 'discord', type, 'Открыть дискорд', 1, function( ePly, tArgs ) 

    ePly:SendLua( 'gui.OpenURL("https://discord.gg/36kWMP3FHm")' )
    ePly:ChatSend( C.AMBITION, '>> ', C.FLAT_BLUE, 'https://discord.gg/36kWMP3FHm' )
 
end )

Add( 'steam', type, 'Открыть Steam группу', 1, function( ePly, tArgs ) 

    ePly:SendLua( 'gui.OpenURL("https://steamcommunity.com/groups/ambitiongmod")' )
    ePly:ChatSend( C.AMBITION, '>> ', C.FLAT_BLUE, 'https://steamcommunity.com/groups/ambitiongmod' )
 
end )

Add( 'vk', type, 'Открыть группу Вконтакте', 1, function( ePly, tArgs ) 

    ePly:SendLua( 'gui.OpenURL("https://vk.com/ambgmod")' )
    ePly:ChatSend( C.AMBITION, '>> ', C.FLAT_BLUE, 'https://vk.com/ambgmod' )
 
end )

Add( 'ip', type, 'Узнать IP адрес сервера', 1, function( ePly, tArgs ) 

    ePly:ChatSend( C.AMBITION, '>> ', C.FLAT_BLUE, game.GetIPAddress() )
 
end )