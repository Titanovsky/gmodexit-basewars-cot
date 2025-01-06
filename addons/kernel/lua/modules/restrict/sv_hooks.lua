local CFG = AMB.Restrict.Config

hook.Add( 'PlayerSpawnProp', 'AMB.Restrict.Blocked', function( ePly, sModel )

    return AMB.Restrict.Check( ePly, sModel, 'props', true )

end )

hook.Add( 'PlayerSpawnRagdoll', 'AMB.Restrict.Blocked', function( ePly, sModel )

    return AMB.Restrict.Check( ePly, sModel, 'ragdolls', true )

end )

hook.Add( 'PlayerSpawnSENT', 'AMB.Restrict.Blocked', function( ePly, sClass ) 

    return AMB.Restrict.Check( ePly, sClass, 'sents', true )

end )

hook.Add( 'PlayerSpawnNPC', 'AMB.Restrict.Blocked', function( ePly, sClass, sWeapon ) 

    return AMB.Restrict.Check( ePly, sClass, 'npcs', true )

end )

hook.Add( 'PlayerSpawnVehicle', 'AMB.Restrict.Blocked', function( ePly, sModel, sName, tInfo )

    return AMB.Restrict.Check( ePly, sName, 'vehicles', true )

end )

hook.Add( 'PlayerSpawnEffect', 'AMB.Restrict.Blocked', function( ePly, sModel ) 

    return AMB.Restrict.Check( ePly, sModel, 'effects', true )

end )

hook.Add( 'PlayerSpawnSWEP', 'AMB.Restrict.Blocked', function( ePly, sWeapon, tWeaponInfo ) 

    return AMB.Restrict.Check( ePly, sWeapon, 'weapons', true )

end )

hook.Add( 'PlayerGiveSWEP', 'AMB.Restrict.Blocked', function( ePly, sWeapon ) 

    return AMB.Restrict.Check( ePly, sWeapon, 'weapons', true )

end )

hook.Add( 'CanProperty', 'AMB.Restrict.Blocked', function( ePly, sProperty, eEntity ) 

    return AMB.Restrict.Check( ePly, sProperty, 'properties', true )

end )

hook.Add( 'CanTool', 'AMB.Restrict.Blocked', function( ePly, tTraceInfo, sTool ) 

    return AMB.Restrict.Check( ePly, sTool, 'tools', true )

end )


hook.Add( 'PhysgunPickup' , 'AMB.Restrict.Blocked', function( ePly, eObj )

    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) then return true end
    
    if eObj.restrict_physgun then return false end

end )

hook.Add( 'OnPhysgunReload', 'AMB.Restrict.Blocked', function( eWeapon, ePly )

    return AMB.Restrict.Config.can_reload_physgun

end )

hook.Add( 'PlayerSay', 'AMB.Restrict.BlockedChatSay', function( ePly, sText, bTeamChat )

    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) then return true end

    return ePly:IsAuth()

end )

hook.Add( 'PlayerCanHearPlayersVoice', 'AMB.Restrict.Blocked', function( eListener, eTalker )

    if not eTalker:IsAuth() then return false end
    
    return ( eListener:GetPos():Distance( eTalker:GetPos() ) < AMB.Restrict.Config.voice_max_distance )

end )

hook.Add( 'PlayerNoClip', 'AMB.Restrict.Blocked', function( ePly )

    return AMB.Adminus.ValidationAccess( ePly, 1 )

end )