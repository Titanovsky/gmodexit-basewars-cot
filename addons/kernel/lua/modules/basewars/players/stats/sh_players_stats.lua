local CFG = AMB.Gamemode.Config

function AMB.Gamemode.GetBasewarsCategory( eObj )

    if not IsValid( eObj ) then return false end
    if not AMB.NW.GetInt( eObj, 'Level' ) then return 'UNCATEGORY' end

    if eObj:IsPlayer() then

        if not CFG.basewars_ranks_players[ AMB.NW.GetInt( eObj, 'Level' ) ] then

            local tab = table.Reverse( CFG.basewars_ranks_players )

            for lvl, name in ipairs( tab ) do

                if ( AMB.NW.GetInt( ePly, 'Level' ) >= lvl ) then return name end

            end

        end

        return CFG.basewars_ranks_players[ AMB.NW.GetInt( eObj, 'Level' ) ]

    else

        if not CFG.basewars_categories_entities[ AMB.NW.GetInt( eObj, 'Level' ) ] then

            local tab = table.Reverse( CFG.basewars_categories_entities )

            for lvl, v in ipairs( tab ) do

                if ( AMB.NW.GetInt( ePly, 'Level' ) >= lvl ) then 
                
                    if eObj:IsWeapon() then return v.wep end

                    return v.ent
                    
                end

            end

        end

        return CFG.basewars_categories_entities[ AMB.NW.GetInt( eObj, 'Level' ) ]

    end

end

function AMB.Gamemode.GetStats( eObj, sType )

    sType = string.lower( sType )

    if ( sType == 'gamename' ) or ( sType == '@' ) or ( sType == 'gn' ) then

        return AMB.NW.GetString( eObj, 'Gamename' )

    elseif ( sType == 'level' ) or ( sType == '!' ) or ( sType == 'l' ) then

        return AMB.NW.GetInt( eObj, 'Level' )

    elseif ( sType == 'xp' ) or ( sType == '/' ) then
    
        return AMB.NW.GetInt( eObj, 'XP' )

    elseif ( sType == 'nxp' ) or ( sType == '//' ) then
    
        return AMB.NW.GetInt( eObj, 'NXP' )

    elseif ( sType == 'money' ) or ( sType == '$' ) or ( sType == 'm' ) then

        return AMB.NW.GetInt( eObj, 'Money' )

    elseif ( sType == 'skin' ) or ( sType == '^' ) or ( sType == 's' ) then

        return AMB.NW.GetString( eObj, 'Skin' )

    end

    AMB.ErrorLog( 'Gamemode', 'sType '..sType..' not founded' )

    return false

end