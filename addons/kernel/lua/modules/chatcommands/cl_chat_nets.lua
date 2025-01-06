local CFG = AMB.ChatCommands.Config

net.Receive( CFG.net_run_console_commands, function()

    LocalPlayer():ConCommand( net.ReadString() or '' )

end )