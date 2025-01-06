hook.Add( 'PhysgunPickup', 'AMB.Adminus.PhysgunPlayers', function( ePly, eObj )

    if eObj:IsPlayer() then 
    
        local Ranks = AMB.Adminus.Ranks 
        
        if AMB.Adminus.ValidationAccess( ePly, Ranks.table[ Ranks.GetRank( eObj ) or 'user' ].access ) then

            eObj:SetMoveType( MOVETYPE_NONE )

            return true

        end

        return false
        
    end

end )

hook.Add( 'PhysgunDrop', 'AMB.Adminus.PhysgunPlayers', function( ePly, eObj )

    if eObj:IsPlayer() then eObj:SetMoveType( MOVETYPE_WALK ) end

end )

hook.Add( 'PhysgunPickup', 'AMB.Adminus.DevModeCanAllPickup', function( ePly, eObj )

    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) then return true end

end )