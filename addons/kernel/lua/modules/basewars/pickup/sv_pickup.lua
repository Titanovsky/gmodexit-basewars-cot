AMB.Gamemode.pickups = AMB.Gamemode.pickups or {}

local function RemoveOldPickup( nID )

    for id, pickup in SortedPairs( AMB.Gamemode.pickups ) do 

        if ( id == nID )  then  

            local ent = pickup.ent
            if IsValid( ent ) then ent:Remove() end

        end

    end

end

local function GetRandPos( vPos )

    return Vector( vPos.x + math.random( -24, 24 ), vPos.y + math.random( -16, 16 ), vPos.z + math.random( -2, 2 ) )

end

function AMB.Gamemode.AddPickUp( nID, vPos, tTypes, bDontRandPos )

    if not vPos then return end
    if not tTypes or not istable( tTypes ) then return end

    bDontRandPos = bDontRandPos or false

    timer.Remove( 'RespawnPickup:'..nID )

    RemoveOldPickup( nID )

    local type = table.Random( tTypes )
    local pickup = AMB.Gamemode.SpawnPickUp( type, bDontRandPos and vPos or GetRandPos( vPos ) )
    pickup.id = nID

    local id = nID or #AMB.Gamemode.pickups + 1
    AMB.Gamemode.pickups[ id ] = {

        pos = vPos,
        types = tTypes,
        rand_pos = not bDontRandPos,
        ent = pickup

    }

    print( '[AutoSpawn] Added PickUp: '..id )

end

function AMB.Gamemode.SpawnPickUp( nType, vPos, aAng, sHeader, sModel, nLevel, fTouchAction )

    local type = AMB.Gamemode.Config.pickup_types[ nType ]
    if not type then return end

    local pickup = ents.Create( 'bw_pickup' )
    pickup:SetPos( vPos or Vector( 0, 0, 0 ) )
    pickup:SetAngles( aAng or Angle( 0, 0, 0 ) )
    pickup:SetType( nType )
    pickup:SetHeader( sHeader or type.header )
    pickup:SetLevel( nLevel or type.level )
    pickup:SetTouchAction( fTouchAction or type.action )
    pickup:Spawn()
    pickup:SetModel( sModel or type.model )
    if type.color then pickup:SetColor( type.color ) end
    if type.modelscale then pickup:SetModelScale( type.modelscale, 0.5 ) end

    return pickup

end

hook.Add( 'PostCleanupMap', 'AMB.Gamemode.SpawnPickUps', function()

    for id, pickup in SortedPairs( AMB.Gamemode.pickups ) do

        timer.Remove( 'RespawnPickup:'..id )

        local type, pos, rand_pos = table.Random( pickup.types ), pickup.pos, pickup.rand_pos
        local ent = AMB.Gamemode.SpawnPickUp( type, rand_pos and GetRandPos( pos ) or pos )
        ent.id = id
        AMB.Gamemode.pickups[ id ].ent = ent

    end

end )

hook.Add( 'AmbitionGamemodeGivePickUp', 'AMB.Gamemode.SetTimerPickUp', function( ePly, ePickup )

    local id = ePickup.id

    if id then 
    
        local type, pos, rand_pos = table.Random( AMB.Gamemode.pickups[ id ].types ), AMB.Gamemode.pickups[ id ].pos, AMB.Gamemode.pickups[ id ].rand_pos
        
        local time = AMB.Gamemode.Config.pickup_types[ type ].respawn
        timer.Create( 'RespawnPickup:'..id, time, 1, function() 

            local pickup = AMB.Gamemode.SpawnPickUp( type, rand_pos and GetRandPos( pos ) or pos )
            pickup.id = id
            AMB.Gamemode.pickups[ id ].ent = pickup

        end )
        
    end

end )