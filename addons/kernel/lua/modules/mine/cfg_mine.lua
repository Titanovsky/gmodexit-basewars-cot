AMB.Mine = AMB.Mine or {}
AMB.Mine.Config = AMB.Mine.Config or {}

AMB.Mine.Config.npc_buyer_delay_for_player_count = 100
AMB.Mine.Config.npc_buyer_delay_for_player_timer = 60 * 15 -- on seconds

AMB.Mine.Config.mine_distance_extract = 400
AMB.Mine.Config.mine_tools_for_extract = { [ 'weapon_laserlink' ] = true }
AMB.Mine.Config.mine_rocks = { 
    
    [ 'mine_rock_iron' ] = true, 
    [ 'mine_rock_copper' ] = true 
    
}
AMB.Mine.Config.sell_list_rocks = {

    [ 'stone' ] = 8,
    [ 'iron' ] = 16,
    [ 'copper' ] = 32

}

AMB.Mine.Config.autospawn_rocks_radius = 32
AMB.Mine.Config.autospawn_buyers = { 
    
    { pos = Vector( -3230, -10030, 72 ), ang = Angle( 0, -180, 0 ) }

}
local z = 100
AMB.Mine.Config.autospawn_rocks = { 
    
    { pos = Vector( -1462, -10152, z ) },
    { pos = Vector( -1464, -10065, z ) },
    { pos = Vector( -1401, -10017, z ) },
    { pos = Vector( -1528, -9974, z ) },
    { pos = Vector( -1537, -10080, z ) },
    { pos = Vector( -1516, -10232, z ) },
    { pos = Vector( -1463, -10309, z ) },
    { pos = Vector( -1523, -10340, z ) },
    { pos = Vector( -1491, -10432, z ) },
    { pos = Vector( -1363, -10428, z ) },
    { pos = Vector( -1280, -10436, z ) },
    { pos = Vector( -1302, -9972, z ) },
    { pos = Vector( -1416, -10238, z ) },
    { pos = Vector( -1346, -10331, z ) },
    { pos = Vector( -656, -9630, z ) },
    { pos = Vector( -1214, -9488, z ) }
    
}