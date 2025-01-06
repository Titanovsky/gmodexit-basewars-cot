function AMB.Economic.GetShopItem( sTag, sType )

    local CFG = AMB.Economic.Config

    sType = string.lower( sType )

    if ( sType == 'weapon' ) then return CFG.shop_weapons[ sTag ]
    elseif ( sType == 'entity' ) then return CFG.shop_entities[ sTag ]
    end

end

function AMB.Economic.Check( ePly, sTag, sType )

    local CFG = AMB.Economic.Config
    local item = nil

    if ( sType == 'weapon' ) then item = CFG.shop_weapons[ sTag ]
    elseif ( sType == 'entity' ) then item = CFG.shop_entities[ sTag ]
    else return false
    end

    local valid_money = AMB.Gamemode.GetStats( ePly, 'Money' ) >= ( item.cost or 1 )
    local valid_lvl = AMB.Gamemode.GetStats( ePly, 'Level' ) >= ( item.lvl or 1 )

    return valid_money and valid_lvl

end