local CFG, C, SND = AMB.PropCore.Config, AMB.G.C, AMB.G.SND

AMB.PropCore.entities = AMB.PropCore.entities or {}

local Player = FindMetaTable( 'Player' )

function Player:PropCoreAdd( eEnt )

    local gamename = self:GetGamename()

    AMB.PropCore.entities[ gamename ][ #AMB.PropCore.entities[ gamename ] + 1 ] = eEnt

    AMB.NW.SetEntity( eEnt, 'PropCoreOwner', self )
    AMB.NW.SetString( eEnt, 'PropCoreOwnerName', gamename )

    eEnt.propcore_owner_gamename = gamename

end

hook.Add( 'AmbitionAuthPlayer', 'AMB.PropCore.SetTableEntities', function( ePly )

    timer.Simple( 0.5, function()

        local gamename = ePly:GetGamename()

        local tab = AMB.PropCore.entities[ gamename ]
        AMB.PropCore.entities[ gamename ] = tab or {}
        timer.Remove( 'PropCoreDeleteEntities:'..gamename )

        if tab and ( #tab > 0 ) then ePly:NotifySend( { type = 2, time = 15, color = C.FLAT_BLUE, text = 'Ваши предметы/пропы остались на карте!' } ) end

        for _, ent in pairs( AMB.PropCore.entities[ gamename ] ) do 

            if IsValid( ent ) then 
            
                if ( ent:GetClass() == 'prop_physics' ) then 
                
                    ePly:AddCleanup( 'props', ent )
                    
                end

                AMB.NW.SetEntity( ent, 'PropCoreOwner', ePly )
                AMB.NW.SetString( ent, 'PropCoreOwnerName', gamename ) 
                
            end

        end

    end )

end )

hook.Add( 'PlayerDisconnected', 'AMB.PropCore.SetTimerDeleteEntities', function( ePly )

    local gamename = ePly:GetGamename()

    local tab = AMB.PropCore.entities[ gamename ]
    if not tab or ( #tab == 0 ) then return end

    for _, ent in pairs( tab ) do 

        if IsValid( ent ) then AMB.NW.SetString( ent, 'PropCoreOwnerName', AMB.NW.GetString( ent, 'PropCoreOwnerName' )..' (disconnected)' ) end

    end

    timer.Create( 'PropCoreDeleteEntities:'..gamename, 60 * 2, 1, function()

        if not tab then return end

        for _, ent in pairs( tab ) do 

            if IsValid( ent ) then ent:Remove() end

        end

        timer.Simple( 1, function() AMB.PropCore.entities[ gamename ] = nil end )

    end )

end )

hook.Add( 'EntityRemoved', 'AMB.PropCore.DeleteEntitiesInTable', function( eObj ) 

    local gamename = eObj.propcore_owner_gamename
    if gamename then  

        for i, ent in pairs( AMB.PropCore.entities[ gamename ] ) do

            if ( ent == eObj ) then AMB.PropCore.entities[ gamename ][ i ] = nil end

        end

    end

end )

hook.Add( 'PlayerSpawnedProp', 'AMB.PropCore.SettingProps', function( ePly, sMdl, eObj )

    ePly:PropCoreAdd( eObj )

    if CFG.spawn_props_freeze then

        local phys = eObj:GetPhysicsObject()
        if IsValid( phys ) then 
        
            phys:EnableMotion( false ) 
            
        end

    end

    if CFG.protect_damage_props_enable then eObj:SetHealth( eObj:GetPhysicsObject():GetMass() * 2 or 100 ) end
    if CFG.spawn_props_no_collision_with_other_props then eObj:SetCustomCollisionCheck( true ) end

end )

hook.Add( 'ShouldCollide', 'AMB.PropCore.DisableCollisionPropOnProp', function( eObj1, eObj2 )

    if ( eObj1:GetClass() ~= 'prop_physics' ) then return end
    if ( eObj2:GetClass() ~= 'prop_physics' ) then return end

    return false

end )

local one_damage_types = {

    [ DMG_BULLET ] = true,
    [ DMG_BUCKSHOT ] = true,
    [ DMG_CLUB ] = true,
    [ DMG_SNIPER ] = true,
    [ DMG_ALWAYSGIB ] = true,
    [ DMG_NEVERGIB ] = true,
    [ DMG_ENERGYBEAM ] = true,
    [ DMG_BURN ] = true,
    [ DMG_SLASH ] = true

}

hook.Add( 'EntityTakeDamage', 'AMB.PropCore.OnDamageProps', function( eProp, dmgInfo ) 

    if not CFG.protect_damage_props_enable then return end
    if not IsValid( eProp ) or ( eProp:GetClass() ~= 'prop_physics' ) then return end

    local attacker = dmgInfo:GetAttacker()
    if not IsValid( attacker ) or not attacker:IsPlayer() then return end

    local type = dmgInfo:GetDamageType()
    if ( type == DMG_CRUSH ) or ( type == DMG_PHYSGUN ) or ( type == DMG_GENERIC ) then dmgInfo:SetDamage( 0 ) return false end

    local damage = math.floor( dmgInfo:GetDamage() )
    if one_damage_types[ type ] then 
    
        damage = 1 
        dmgInfo:SetDamage( damage )

    elseif ( type == DMG_BLAST ) then
    
        damage = damage * math.random( 2, 4 )
        dmgInfo:SetDamage( damage ) 
        
    end

    eProp:SetHealth( eProp:Health() - damage )

    if ( eProp:Health() <= 0 ) and IsValid( eProp ) then 
    
        attacker:NotifySend( { type = 10, color = C.AMB_RED, time = 5, text = 'Проп '..tostring( eProp:EntIndex() )..' уничтожен!' } ) 
        eProp:Remove() 
        
    end

end )

hook.Add( 'PhysgunPickup', 'AMB.PropCore.BlockOtherEntity', function( ePly, eObj )

    local owner = AMB.NW.GetString( eObj, 'PropCoreOwnerName' )
    
    if ( ePly:GetGamename() == owner ) then return true end
    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) then return true end

    return false

end )

hook.Add( 'CanTool', 'AMB.PropCore.BlockToolOnOtherEntity', function( ePly, traceInfo )

    local ent = traceInfo.Entity
    if not IsValid( ent ) then return end

    local owner = AMB.NW.GetString( ent, 'PropCoreOwnerName' )
    
    if ( ePly:GetGamename() == owner ) then return true end
    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) then return true end

    return false

end )

hook.Add( 'OnPhysgunPickup', 'AMB.PropCore.PhysGunPickUpDisableCollision', function( ePly, eObj )

    if not IsValid( eObj ) or ( eObj:GetClass() ~= 'prop_physics' ) then return end

    eObj.old_collision, eObj.old_material = eObj.old_collision or eObj:GetCollisionGroup(), eObj.old_material or eObj:GetMaterial()

    eObj:SetCollisionGroup( COLLISION_GROUP_WORLD )
    eObj:SetMaterial( 'models/props_combine/portalball001_sheet' )

end )

hook.Add( 'PhysgunDrop', 'AMB.PropCore.BlockOtherEntities', function( ePly, eObj )

    if not IsValid( eObj ) or ( eObj:GetClass() ~= 'prop_physics' ) then return end

    eObj:GetPhysicsObject():EnableMotion( false )

    local around_entities = ents.FindInSphere( eObj:LocalToWorld( eObj:OBBCenter() ), eObj:BoundingRadius() )

    for _, ent in ipairs( around_entities ) do

        if ent:IsPlayer() then return false end

    end

    eObj:SetCollisionGroup( eObj.old_collision or 0 )
    eObj:SetMaterial( eObj.old_material or '' )
    eObj.old_collision, eObj.old_material = nil

end )

hook.Add( 'GravGunPickupAllowed', 'AMB.PropCore.BlockOtherEntities', function( ePly, eObj )

    return true

end )

hook.Add( 'GravGunPunt', 'AMB.PropCore.BlockPunt', function()

    return false

end )