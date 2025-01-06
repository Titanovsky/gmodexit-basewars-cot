local CFG, NetAdd = AMB.ChatCommands.Config, AMB.Network.AddString

NetAdd( CFG.net_run_console_commands )

hook.Add( 'PlayerInitialSpawn', 'AMB.ChatCommands.SetDelayTable', function( ePly ) ePly.delay_for_chat_cmds = {} end )
hook.Add( 'PlayerSay', 'AMB.ChatCommands.ExecuteCommand', function( ePly, sText )

    if not string.StartWith( sText, '/' ) then return end

    local tab = string.Explode( ' ', sText )
    local cmd = string.sub( string.lower( tab[ 1 ] ), 2, #tab[ 1 ] )

    local CFG = AMB.ChatCommands.Config
    local command = CFG.cmds[ cmd ]
    if not command then return end
    if ePly.delay_for_chat_cmds[ cmd ] then return end

    command.action( ePly, tab )

    ePly.delay_for_chat_cmds[ cmd ] = true
    timer.Simple( command.delay, function()
    
        if not IsValid( ePly ) then return end
        ePly.delay_for_chat_cmds[ cmd ] = false

    end )

end )