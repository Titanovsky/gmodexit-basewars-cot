hook.Add( 'OnNPCKilled', 'AMB.Economic.AddStatsOnNPCKilled', function( eNPC, eAttacker )

    if not IsValid( eAttacker ) or not eAttacker:IsPlayer() then return end

    eAttacker:AddMoneyEco( math.random( 10, 250 ) )
    eAttacker:AddXPEco( math.random( 24, 64 ) )

end )
