AMB.Clans.Capture = AMB.Clans.Capture or {}

net.Receive( 'amb_clans_capture_send_table_chunks', function()

    local tab = net.ReadTable()

    AMB.Territory.Config.chunks = {}
    AMB.Territory.Config.chunks = tab

end )

concommand.Add( 'amb_clan_capture', function( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return end
    if ( AMB.Clans.PlayerGetAccess( ePly ) < 4 ) then return end

    net.Start( 'amb_clans_capture_cmd' )
    net.SendToServer()

end)