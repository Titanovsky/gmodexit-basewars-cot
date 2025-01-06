local Add, Give = AMB.Fine.Add, AMB.Fine.Give

local antichatflood, tries = 'AntiChatFlood', 8
Add( antichatflood, 'Защита от спама в чат', 1.25, 0.65, tries, function( ePly ) 

    ePly:ChatPrint( 'У Вас мут на 4 минуты, пожалуйста, больше не флудите!' )
    ePly.fine_mute_chat = true

    timer.Simple( 60 * 4, function()

        if not IsValid( ePly ) then return end
        ePly:ChatPrint( 'Мут снят, теперь без флуда, хорошо? Приятной Игры :)' )
        ePly.fine_mute_chat = false

    end )

end )

hook.Add( 'PlayerSay', 'AMB.Fine.AntiFloodChat', function( ePly, sText )

    if ePly.fine_mute_chat then return false end

    if not string.StartWith( sText, '/' ) then

        local count = AMB.Fine.GetPlayerFine( ePly:SteamID64(), antichatflood )
        if ( count >= tries - 4 ) then return false end

        Give( ePly, antichatflood )

    end

    --print( string.len( sText ) ) -- Todo: The bigger len is never!!

end )