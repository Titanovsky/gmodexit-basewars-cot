function AMB.Economic.ShopAddEntity( sClass, nCost, nLevel, nAmmo, sName, sCategory, sDescription, sModel, fPostAction )

    if not sClass then return end
    
    AMB.Economic.Config.shop_weapons[ sClass ] = {

        class = sClass,
        name = sName or sClass,
        desc = sDescription or '',
        model = sModel or 'models/props_borealis/door_wheel001a.mdl',
        category = sCategory or 'Другое',
        lvl = nLevel or 1,
        ammo = nAmmo or 0,
        cost = nCost or 200,
        post = fPostAction

    }

end

function AMB.Economic.ShopAddWeapon( sClass, nCost, nLevel, nAmmo, sName, sCategory, sDescription, sModel )

    if not sClass then return end

    AMB.Economic.Config.shop_weapons[ sClass ] = {

        class = sClass,
        name = sName or sClass,
        desc = sDescription or '',
        model = sModel or 'models/weapons/w_Physics.mdl',
        category = sCategory or 'Другое',
        lvl = nLevel or 1,
        ammo = nAmmo or 0,
        cost = nCost or 200

    }

end