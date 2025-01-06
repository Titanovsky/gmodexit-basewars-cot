local C = AMB.G.C

function AMB.Kit.Add( sName, sDescription, bOnce, nDelay, fAction )

    if not sName then return end

    AMB.Kit.Config.kits[ sName ] = {

        desc = sDescription or '',
        once = bOnce,
        delay = nDelay or 1,
        action = fAction or function() end

    }

end

function AMB.Kit.Get( sName )

    return AMB.Kit.Config.kits[ sName or '' ]

end

local Add = AMB.ChatCommands.AddCommand

Add( 'kit', 'Наборы', 'Получить набор /kit [Название]', 1.5, function( ePly, tArgs ) 

    local kit = tArgs[ 2 ] or ''

    ePly:GiveKit( kit )
 
end )

Add( 'kits', 'Наборы', 'Показать все доступные наборы.', 1, function( ePly, tArgs ) 

    local kits = AMB.Kit.Config.kits
    for name, kit in pairs( kits ) do ePly:ChatSend( C.FLAT_RED, name, C.ABS_WHITE, ' — ', kit.desc ) end
 
end )