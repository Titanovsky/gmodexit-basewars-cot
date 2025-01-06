local Err, Warn = AMB.ErrorLog, AMB.WarningLog

local function SpawnEntity( sClass, vPos, aAng, fPost )

    local ent = ents.Create( sClass )
    ent:SetPos( vPos or Vector( 0, 0, 0 ) )
    ent:SetAngles( aAng or Angle( 0, 0, 0 ) )
    ent:Spawn()

    if not IsValid( ent ) then Warn( 'AutoSpawn', 'Entity '..tab.class..' doesn\'t spawned!' ) return ent end
    if fPost then fPost( ent ) end

    return ent

end

function AMB.AutoSpawn.RemoveOldEntity( sDescription, sClass, vPos )

    local list = AMB.AutoSpawn.Config.list

    for i, obj in ipairs( list ) do 

        if ( obj.desc == sDescription ) and ( obj.class == sClass ) then  

            local ent = obj.ent
            
            if IsValid( ent ) then ent:Remove() end

            return i

        end

    end

end

function AMB.AutoSpawn.Add( sDescription, sClass, vPos, aAng, fPost )

    if ( sClass == nil ) then Err( 'AutoSpawn', 'sClass not selected' ) return end

    if ( vPos == nil ) or ( isvector( vPos ) == false ) then vPos = Vector( 0, 0, 0 ) Warn( 'AutoSpawn', 'vPos not selected or is not a vector' ) end
    if ( aAng == nil ) or ( isangle( aAng ) == false ) then aAng = Angle( 0, 0, 0 ) Warn( 'AutoSpawn', 'aAng not selected or is not a angle' ) end
    if ( sDescription == nil ) or ( isstring( sDescription ) == false ) then sDescription = '' Warn( 'AutoSpawn', 'sDescription not selected or is not a string' ) end

    timer.Simple( 0.25, function()

        local old_count = AMB.AutoSpawn.RemoveOldEntity( sDescription, sClass, vPos )
        
        local entity = SpawnEntity( sClass, vPos, aAng, fPost )
        local len = #AMB.AutoSpawn.Config.list
        local count = len + 1
        count = old_count or count

        AMB.AutoSpawn.Config.list[ count ] = {

            class = sClass,
            pos = vPos,
            ang = aAng,
            desc = sDescription,
            ent = entity,
            post = fPost,

        }

        print( '[AutoSpawn] Added '..sClass..' ('..count..')' )

    end )

end

function AMB.AutoSpawn.Spawn()

    local list = AMB.AutoSpawn.Config.list

    for k, tab in ipairs( list ) do AMB.AutoSpawn.Add( tab.desc, tab.class, tab.pos, tab.ang, tab.post ) end

end
hook.Add( 'PostCleanupMap', 'AMB.AutoSpawn.Spawn', AMB.AutoSpawn.Spawn )