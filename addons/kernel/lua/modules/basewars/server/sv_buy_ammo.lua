local function CalcModify( ePly )

    local CFG = AMB.Gamemode.Config
    local lvl = AMB.Gamemode.GetStats( ePly, 'Level' )
    local modify = ( lvl == 20 ) and 0 or ( 20 - lvl ) * CFG.buy_autu_ammo_modify_cost

    return ( lvl > 20 ) and math.abs( modify ) or -modify

end

function AMB.Gamemode.AddAutoAmmo( ePly, bSpendMoney )

    local CFG = AMB.Gamemode.Config
    local wep = ePly:GetActiveWeapon() 
    if not IsValid( wep ) then return end

    local type = wep:GetPrimaryAmmoType()
    local exception = CFG.buy_auto_ammo_exception[ wep:GetClass() ]
    if exception and ( exception.cost == false ) then return end

    local modify = CalcModify( ePly )
    local cost = exception and exception.cost + modify or CFG.buy_auto_ammo_cost + modify
    local ammo = exception and exception.ammo or CFG.buy_auto_ammo_ammo

    if ( bSpendMoney ) then

        if ( AMB.Gamemode.GetStats( ePly, '$' ) < cost ) then return end

        ePly:AddMoney( -cost )

    end

    ePly:GiveAmmo( ammo, type )

    hook.Call( 'AmbitionGamemodeBuyAutoAmmo', nil, ePly, type, ammo, cost )

end

local net_string = AMB.Network.AddString( 'amb_buy_ammo' )
net.Receive( net_string, function( nLen, ePly ) 

    if not ePly:IsAuth() then AMB.Adminus.KickCheater( ePly, '3ba000A', 'Неавторизованный ~p~ попытался купить патроны' ) return end
    if not ePly:Alive() then AMB.Adminus.KickCheater( ePly, '3ba010A', 'Мёртвый ~p~ попытался купить патроны' ) return end
    if not IsValid( ePly:GetActiveWeapon() ) then AMB.Adminus.KickCheater( ePly, '3ba020A', '~p~ попытался купить патроны на несуществующее оружие' ) return end
    if timer.Exists( 'AmbTimerBuyAmmoDelay:'..ePly:SteamID() ) then AMB.Adminus.KickCheater( ePly, '2ba030A', '~p~ попытался купить патроны во время задержки' ) return end

    local CFG = AMB.Gamemode.Config

    timer.Create( 'AmbTimerBuyAmmoDelay:'..ePly:SteamID(), CFG.buy_auto_ammo_delay - 0.05, 1, function() end )

    AMB.Gamemode.AddAutoAmmo( ePly, true )

end )