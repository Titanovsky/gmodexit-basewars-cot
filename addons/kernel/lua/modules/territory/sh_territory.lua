local pairs = pairs
local Vector = Vector
local IsValid = IsValid

function AMB.Territory.GetChunk( sName )

    return AMB.Territory.Config.chunks[ sName ]

end

function AMB.Territory.GetChunkName( eObj )

    local chunks = AMB.Territory.Config.chunks

    for name, chunk in SortedPairs( chunks ) do

        if eObj:GetPos():WithinAABox( chunk.mins + Vector( 0, 0, -2 ), chunk.maxs + Vector( 0, 0, 2 ) ) then return name end

    end

    return false

end

function AMB.Territory.GetChunkType( eObj )

    local chunks = AMB.Territory.Config.chunks

    for name, chunk in SortedPairs( chunks ) do

        if eObj:GetPos():WithinAABox( chunk.mins + Vector( 0, 0, -2 ), chunk.maxs + Vector( 0, 0, 2 ) ) then return chunk.type end

    end

    return false

end

function AMB.Territory.GetChunkCapter( eObj )

    local chunks = AMB.Territory.Config.chunks

    for name, chunk in SortedPairs( chunks ) do

        if eObj:GetPos():WithinAABox( chunk.mins + Vector( 0, 0, -2 ), chunk.maxs + Vector( 0, 0, 2 ) ) then return chunk.capter end

    end

    return false

end

function AMB.Territory.GetChunksCapter()

    local chunks = AMB.Territory.Config.chunks
    local ret = {}

    for name, chunk in SortedPairs( chunks ) do

        if ( chunk.type == 'capture' ) then 
        
            local count = #ret + 1
            ret[ count ] = chunk 
            ret.name = name
            
        end

    end

    return ret

end

function AMB.Territory.GetChunkOwner( eObj )

    local chunks = AMB.Territory.Config.chunks

    for name, chunk in SortedPairs( chunks ) do

        if eObj:GetPos():WithinAABox( chunk.mins + Vector( 0, 0, -2 ), chunk.maxs + Vector( 0, 0, 2 ) ) then return chunk.owner end

    end

    return false

end