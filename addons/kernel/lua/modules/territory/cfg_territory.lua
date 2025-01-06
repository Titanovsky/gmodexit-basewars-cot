AMB.Territory = AMB.Territory or {}
AMB.Territory.Config = AMB.Territory.Config or {}

local C = AMB.G.C

AMB.Territory.Config.chunks = AMB.Territory.Config.chunks or {}

-- ## Spawns ######################################################
AMB.Territory.Config.chunks[ 'spawn1' ] = {

    map = 'bw_terra',
    type = 'safe',
    color = C.AMB_GREEN,
    mins = Vector( -1040, -13328, -1008 ),
    maxs = Vector( -3056, -15344, -610 ),

}

AMB.Territory.Config.chunks[ 'quest1room1' ] = {

    map = 'bw_terra',
    type = 'safe',
    color = C.AMB_GREEN,
    mins = Vector( -512, -15352, -1008 ),
    maxs = Vector( -760, -14728, -720 ),

}

AMB.Territory.Config.chunks[ 'quest1room2' ] = {

    map = 'bw_terra',
    type = 'safe',
    color = C.AMB_GREEN,
    mins = Vector( -192, -15296, -1008 ),
    maxs = Vector( 448, -14656, -814 ),

}

-- ## Out Spawns ###################################################
AMB.Territory.Config.chunks[ 'outspawn_a1' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -5144, -14141, 64 ),
    maxs = Vector( -6408, -15336, 440 ),

}

AMB.Territory.Config.chunks[ 'outspawn_a2' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -6404, -6494, 64 ),
    maxs = Vector( -5144, -7648, 440 ),

}

-- ## Roads ########################################################
AMB.Territory.Config.chunks[ 'road_a1' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -6784, -13440, 64 ),
    maxs = Vector( -7136, -5152, 324 ),

}

AMB.Territory.Config.chunks[ 'road_a2' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -10376, -10096, 64 ),
    maxs = Vector( -5158, -9744, 324 ),

}

AMB.Territory.Config.chunks[ 'road_a3' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -7136, -7808, 64 ),
    maxs = Vector( -10376, -8160, 324 ),

}

AMB.Territory.Config.chunks[ 'road_a4' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -10024, -8160, 64 ),
    maxs = Vector( -10376, -9744, 324 ),

}

AMB.Territory.Config.chunks[ 'road_a5' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -7136, -13088, 64 ),
    maxs = Vector( -11672, -13440, 324 ),

}

AMB.Territory.Config.chunks[ 'road_a6' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -11672, -13440, 64 ),
    maxs = Vector( -11320, -15328, 324 ),

}

-- ## Inputs to Underground ######################################################
AMB.Territory.Config.chunks[ 'door_bunker_a1' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -15206, -8535, 48 ),
    maxs = Vector( -14758, -8277, 206 ),

}

-- ## Bunker ######################################################

AMB.Territory.Config.chunks[ 'bunker' ] = {

    map = 'bw_terra',
    type = 'noprop',
    color = C.AMB_GRAY,
    mins = Vector( -10616, -4088, -696 ),
    maxs = Vector( -6152, 1400, -344 ),

}

-- ## Safe ######################################################
AMB.Territory.Config.chunks[ 'mine' ] = {

    map = 'bw_terra',
    type = 'safe',
    color = C.AMB_GREEN,
    mins = Vector( -4586, -9006, 72 ),
    maxs = Vector( -500, -10858, 937 ),

}

-- ## Capture ######################################################
AMB.Territory.Config.chunks[ 'A0' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -7000, -13440, 64 ),
    maxs = Vector( -8380, -15336, 800 ),

}

AMB.Territory.Config.chunks[ 'A1' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -8984, -15336, 64 ),
    maxs = Vector( -11264, -14128, 800 ),

}

AMB.Territory.Config.chunks[ 'A2' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -11728, -14648, 64 ),
    maxs = Vector( -15346, -15346, 800 ),

}

AMB.Territory.Config.chunks[ 'A3' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -12928, -13248, 64 ),
    maxs = Vector( -14936, -14264, 800 ),

}

AMB.Territory.Config.chunks[ 'A4' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -7152, -10528, 64 ),
    maxs = Vector( -10032, -12576, 1024 ),

}

AMB.Territory.Config.chunks[ 'A5' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -7200, -9566, 64 ),
    maxs = Vector( -9502, -8259, 1024 ),

}

AMB.Territory.Config.chunks[ 'A6' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -11738, -12680, -640 ),
    maxs = Vector( -13181, -8632, 1024 ),

}

AMB.Territory.Config.chunks[ 'A7' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -13181, -12680, -640 ),
    maxs = Vector( -15336, -8632, 1024 ),

}

AMB.Territory.Config.chunks[ 'A8' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -8454, -7808, 64 ),
    maxs = Vector( -10376, -5144, 1024 ),

}

AMB.Territory.Config.chunks[ 'A9' ] = {

    map = 'bw_terra',
    type = 'capture',
    color = C.ABS_WHITE,
    mins = Vector( -10704, -5440, 64 ),
    maxs = Vector( -14360, -8160, 1024 ),

}

AMB.Territory.Config.chunks[ 'AA1' ] = {

    map = 'bw_terra',
    type = 'neutral',
    color = C.FLAT_GREEN,
    mins = Vector( -6538 + 120, -2698 + 2, -696 ),
    maxs = Vector( -6966 - 2, -3254 - 2, -464 ),

}

AMB.Territory.Config.chunks[ 'AA2' ] = {

    map = 'bw_terra',
    type = 'neutral',
    color = C.FLAT_GREEN,
    mins = Vector( -6420, -1608, -696 ),
    maxs = Vector( -6968, -2168, -464 ),

}

AMB.Territory.Config.chunks[ 'AA3' ] = {

    map = 'bw_terra',
    type = 'neutral',
    color = C.FLAT_GREEN,
    mins = Vector( -6546 + 120, -654 + 6, -696 ),
    maxs = Vector( -6958 - 10, -1202 - 6, -464 ),

}

AMB.Territory.Config.chunks[ 'AA4' ] = {

    map = 'bw_terra',
    type = 'neutral',
    color = C.FLAT_GREEN,
    mins = Vector( -10299, -3312 - 8, -696 ),
    maxs = Vector( -9802 + 2, -2762 + 2, -488 ),

}

AMB.Territory.Config.chunks[ 'AA5' ] = {

    map = 'bw_terra',
    type = 'neutral',
    color = C.FLAT_GREEN,
    mins = Vector( -10304, -2232, -696 ),
    maxs = Vector( -9800, -1672, -488 ),

}

AMB.Territory.Config.chunks[ 'AA6' ] = {

    map = 'bw_terra',
    type = 'neutral',
    color = C.FLAT_GREEN,
    mins = Vector( -10310, -1208, -696 ),
    maxs = Vector( -9800, -648, -488 ),

}