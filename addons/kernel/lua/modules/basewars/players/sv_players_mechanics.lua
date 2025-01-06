hook.Add( 'PlayerSpawn', 'AMB.Gamemode.PlayerSpawn', function( ePly ) 

    local CFG = AMB.Gamemode.Config

    timer.Simple( 0, function()

        ePly:SetHealth( CFG.start_health )
        ePly:SetArmor( CFG.start_armor )

        ePly:SetSlowWalkSpeed( CFG.set_slow_walk_speed )
        ePly:SetWalkSpeed( CFG.set_walk_speed )
        ePly:SetRunSpeed( CFG.set_run_speed )
        ePly:SetCrouchedWalkSpeed( CFG.set_crouched_speed )

        if not CFG.player_pos[ game.GetMap() ] then return end

        local spawn_list = CFG.player_pos[ game.GetMap() ]
        local rand = math.random( 1, #spawn_list )

        ePly:SetPos( spawn_list[ rand ].pos )
        ePly:SetEyeAngles( spawn_list[ rand ].ang )
    
    end )

end )

hook.Add( 'PlayerLoadout', 'AMB.Gamemode.PlayerLoadout', function( ePly ) 

    local CFG = AMB.Gamemode.Config

    if not CFG.weapons_spawn then return true end

    for i = 1, #CFG.weapons_spawn do ePly:Give( CFG.weapons_spawn[ i ] ) end

	return false

end )

hook.Add( 'PostPlayerDeath', 'AMB.Gamemode.SpawnBackpackPostDeath', function( ePly ) 

    if ePly:GetWeapons() and ( #ePly:GetWeapons() == 0 ) and ( ePly:GetMoney() < 1000 ) then return end

    local pos = ePly:GetPos() + Vector( 0, 0, 15 )
    local backpack = ents.Create( 'bw_backpack' )
    backpack:SetPos( pos )
    backpack:SetPlayer( ePly )
    backpack:Spawn()

end )