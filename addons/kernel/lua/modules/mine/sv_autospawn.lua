local count_rocks = 0
local count_buyers = 0
local rocks_random = { 'mine_rock_iron', 'mine_rock_iron', 'mine_rock_copper' }

local Random = math.random

local function SetTimer( eRock, nRock, tData )

    timer.Create( 'MineAutoSpawnRock'..nRock, Random( 50, 70 ), 0, function() 
    
        if eRock and IsValid( eRock ) then return end

        timer.Remove( 'MineAutoSpawnRock'..nRock )
        AMB.Mine.SpawnRock( nRock, tData ) 
    
    end )

end

function AMB.Mine.SpawnRock( nRock, tData )

    local CFG = AMB.Mine.Config

    local pos, ang, skin = tData.pos + Vector( Random( -10, 10 ), Random( -10, 10 ), 10 ), Angle( Random( -30, 30 ), Random( -70, -60 ), Random( -15, 15 ) ), Random( 0, 2 )

    for k, v in pairs( ents.FindInSphere( pos, CFG.autospawn_rocks_radius ) ) do

        if v:IsPlayer() then SetTimer( nil, nRock, tData ) return end

    end

    local rock = ents.Create( table.Random( rocks_random ) )
    rock:SetPos( pos )
    rock:SetAngles( ang )
    rock:Spawn()
    rock:SetSkin( skin ) 

    SetTimer( rock, nRock, tData )

end

local function SpawnRocks()

    local CFG = AMB.Mine.Config
    local list = CFG.autospawn_rocks

    for i, data in pairs( list ) do AMB.Mine.SpawnRock( i, data ) end

    count_rocks = #list

end

local function SpawnBuyers()

    local CFG = AMB.Mine.Config
    local list = CFG.autospawn_buyers

    for i, data in pairs( list ) do 
    
        local npc = ents.Create( 'mine_buyer_metals' )
        npc:SetPos( data.pos )
        npc:SetAngles( data.ang )
        npc:Spawn()
        
    end

    count_buyers = #list

end

function AMB.Mine.AutoSpawnEntities()

    SpawnRocks()
    SpawnBuyers()

    print( '[Mine] Spawned '..count_rocks..' Rocks and '..count_buyers..' Buyers!' )

end
hook.Add( 'PostGamemodeLoaded', 'AMB.Mine.AutoSpawnEntities', function() timer.Simple( 0.1, AMB.Mine.AutoSpawnEntities ) end )
hook.Add( 'PostCleanupMap', 'AMB.Mine.AutoSpawnEntities', function() timer.Simple( 0.1, AMB.Mine.AutoSpawnEntities ) end )