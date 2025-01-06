AMB.Clans = AMB.Clans or {}
AMB.Clans.table = AMB.Clans.table or {}

net.Receive( 'amb_clans_send_table_client', function() 

    local ID = net.ReadUInt( 12 )
    local tab = net.ReadTable()

    AMB.Clans.table[ ID ] = {}
    table.Merge( AMB.Clans.table[ ID ], tab )

end )