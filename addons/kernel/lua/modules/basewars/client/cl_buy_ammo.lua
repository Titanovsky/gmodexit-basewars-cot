concommand.Add( 'amb_buy_ammo', function() 

    if not LocalPlayer():Alive() then return end
    if not IsValid( LocalPlayer():GetActiveWeapon() ) then return end
    if timer.Exists( 'AmbTimerBuyAmmoDelay' ) then return end

    local CFG = AMB.Gamemode.Config

    timer.Create( 'AmbTimerBuyAmmoDelay', CFG.buy_auto_ammo_delay + 0.55, 1, function() end )

    net.Start( 'amb_buy_ammo' )
    net.SendToServer()

end )