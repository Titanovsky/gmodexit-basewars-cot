AMB.Gamemode.npcs_guard1 = AMB.Gamemode.npcs_guard1 or {}
AMB.Gamemode.npcs_guard2 = AMB.Gamemode.npcs_guard2 or {}

local poses = {

    [ 1 ] = { 

        Vector( -7096, -13270, 107 ),
        Vector( -8387, -13274, 120 ),
        Vector( -9669, -13244, 125 ),
        Vector( -11399, -13237, 141 ),
        Vector( -6924, -11440, 124 ),
        Vector( -6965, -9981, 126 ),
        Vector( -8653, -9938, 124 ),
        Vector( -10175, -9913, 128 ),
        Vector( -10216, -8062, 137 ),
        Vector( -7013, -7983, 126 )

    },

    [ 2 ] = {

        Vector( 1196, -1000, 519 ),
        Vector( -813, -970, 505 ),
        Vector( -863, -226, 511 ),
        Vector( -832, 667, 508 ),
        Vector( 1112, 693, 529 ),
        Vector( 1218, 2167, 525 ),
        Vector( 3310, 2195, 537 ),
        Vector( 3425, 860, 546 ),
        Vector( -550, 2189, 547 ),
        Vector( -596, 4064, 540 ),
        Vector( 3348, 4105, 528 ),
        Vector( 1791, 6208, 539 )

    }

}

local weapons = { 'arccw_sg552', 'arccw_p90', 'arccw_aug', 'arccw_famas', 'arccw_bizon', 'arccw_mp5' }

local function CreateNPCGuard( nLocation )

    local pos = table.Random( poses[ nLocation ] )

    for _, ent in ipairs( ents.FindInSphere( pos, 120 ) ) do

        if ent:IsPlayer() or ( ent:IsNPC() and ( ent:GetClass() == 'npc_monk' ) ) then timer.Simple( 120, function() CreateNPCGuard( nLocation ) end ) return end

    end

    local npc = ents.Create( 'npc_combine_s' )
    npc:SetPos( pos )
    npc:Spawn()
    npc:SetHealth( math.random( 200, 600 ) )
    npc:Give( table.Random( weapons ) )
    npc.npc_guard_location = nLocation

end

local function CreateNPCGuards()

    for i = 1, 2 do CreateNPCGuard( 1 ) end
    for i = 1, 4 do CreateNPCGuard( 2 ) end

end

hook.Add( 'EntityRemoved', 'AMB.Gamemode.RespawnNPCGuard', function( eObj )

    local loc = eObj.npc_guard_location
    if loc then timer.Simple( 120, function() CreateNPCGuard( loc ) end ) end

end )

hook.Add( 'PostGamemodeLoaded', 'AMB.Gamemode.SpawnNPCGuard', function() 

    timer.Simple( 1, function() CreateNPCGuards() end ) 
    
end )

hook.Add( 'PostCleanupMap', 'AMB.Gamemode.SpawnNPCGuard', function() 

    timer.Simple( 1, function() CreateNPCGuards() end )

end )