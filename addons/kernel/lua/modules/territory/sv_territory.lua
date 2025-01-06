AMB.Territory.table_props = AMB.Territory.table_props or {}

local hook = hook
local pairs = pairs
local IsValid = IsValid
local tostring = tostring
local current_map = game.GetMap()
local delay_check_props_on_chunks = 0.75

hook.Add( 'PlayerSpawnedProp', 'AMB.Territory.SavePropsInTable', function( ePly, _, eProp )

    local chunk_type = AMB.Territory.GetChunkType( eProp )
    if chunk_type and ( chunk_type == 'safe' ) or ( chunk_type == 'noprop' ) then eProp:Remove() return end

    AMB.Territory.table_props[ eProp:EntIndex() ] = eProp

end )

hook.Add( 'EntityRemoved', 'AMB.Territory.RemovePropsInTable', function( eObj )

    if not ( eObj:GetClass() == 'prop_physics' ) then return end

    local ID = eObj:EntIndex()
    if not AMB.Territory.table_props[ ID ] then return end

    AMB.Territory.table_props[ ID ] = nil

end )

local delay = 0
hook.Add( 'Think', 'AMB.Territory.CheckPropsOnChunks', function()

    if ( delay > CurTime() ) then return end

    delay = CurTime() + delay_check_props_on_chunks

    for _, prop in pairs( AMB.Territory.table_props ) do

        if not IsValid( prop ) then continue end

        local chunk_type = AMB.Territory.GetChunkType( prop )
        if chunk_type and ( chunk_type == 'safe' ) or ( chunk_type == 'noprop' ) then prop:Remove() end -- todo: оповещать создателя и заморозить его на 1 секунду

    end

end )

hook.Add( 'EntityTakeDamage', 'AMB.Territory.SafeZones', function( eObj, dmgInfo )

    if not IsValid( eObj ) or not eObj:IsPlayer() then return end

    local attacker = dmgInfo:GetAttacker()

    if ( AMB.Territory.GetChunkType( eObj ) == 'safe' ) then 

        dmgInfo:SetDamage( 0 )

        return false 
        
    end

end )

hook.Add( 'CanTool', 'AMB.Territory.SafeZonesBlockTools', function( ePly, _, sTool )

    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) then return true end
    
    if ( AMB.Territory.GetChunkType( ePly ) == 'safe' ) then 

        return false 
        
    end

end )