local tab = {

    { pos = Vector( 294, -15193, -1008 ), ang = Angle( 0, 135, 0 ) },
    { pos = Vector( -28, -14927, -1008 ), ang = Angle( 0, -50, 0 ) }

}

local function SpawnZombie( nID )

    local zombie = ents.Create( 'npc_zombie' )
    zombie:SetPos( tab[ nID ].pos )
    zombie:SetAngles( tab[ nID ].ang )
    zombie:Spawn()
    zombie:SetHealth( 200 )
    zombie:EmitSound( 'ambient/creatures/town_child_scream1.wav' )
    zombie.spec_quest1_id = nID
    AMB.Quest.AddEntity( zombie, 1, 5 )

end

hook.Add( 'InitPostEntity', 'AMB.Quest.ForZombiesQuest1', function() 

    timer.Simple( 1, function() 

        for i = 1, 2 do SpawnZombie( i ) end

    end )

end )

hook.Add( 'PostCleanupMap', 'AMB.Quest.ForZombiesQuest1', function() 

    for i = 1, 2 do SpawnZombie( i ) end

end )

hook.Add( 'OnNPCKilled', 'AMB.Quest.ForZombiesQuest1', function( eNPC, eAttacker )

    if not eNPC.spec_quest1_id then return end
    if not IsValid( eAttacker ) or not eAttacker:IsPlayer() then return end

    local id = eNPC.spec_quest1_id
    timer.Simple( 4, function() SpawnZombie( id ) end )

end )