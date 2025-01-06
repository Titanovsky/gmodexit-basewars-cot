AMB.Re = AMB.Re or {}

local C = AMB.G.C
local SND = AMB.G.SND

function AMB.Re.SoundPlay( ePly, sSound )
end

function AMB.Re.ChatError( sText )

    AMB.UI.Chat.SendMessage( SND.ERROR, C.AMB_ERROR, '[•] ', C.ABS_WHITE, sText )

end

function AMB.Re.ChatLog( cColor, sText )

    AMB.UI.Chat.SendMessage( nil, cColor, '[•] ', C.ABS_WHITE, sText )

end

function AMB.Re.Notify( tOptions )

    AMB.UI.Notify.DrawNotify( 3, tOptions )

end

local function PlaySoundsFromBF5()

    local f, ff = file.Find( 'sound/ambition/bf5/*', 'GAME')
    local i = 0 

    for _, name in pairs( f ) do

        i = i + 1
        timer.Simple( i + 3, function() surface.PlaySound( 'ambition/bf5/'..name ) chat.AddText( name )  end )

    end

end

net.Receive( 'amb_re_send_client_con_command', function() LocalPlayer():ConCommand( net.ReadString() ) end )