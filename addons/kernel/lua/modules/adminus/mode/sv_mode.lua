function AMB.Adminus.Modes.SetPlayer( ePly, sMode )

    sMode = string.lower( sMode )
    if ( sMode == 'user' ) or ( sMode == '' ) then AMB.Adminus.Modes.RemovePlayer( ePly ) return end

    local mode = AMB.Adminus.Modes.Get( sMode )
    if not mode then AMB.ErrorLog( 'Adminus', 'Not exists Mode '..sMode ) return false end
    if AMB.Adminus.Modes.IsPlayer( ePly ) then AMB.Adminus.Modes.RemovePlayer( ePly ) end

    ePly.adminus_mode_return_mat = ePly:GetMaterial()
    ePly.adminus_mode_return_col = ePly:GetColor()

    ePly:ChatPrint( 'Вы вошли: '..sMode )

    mode.func( ePly )
    AMB.NW.SetString( ePly, 'AdminusMode', sMode )
    
    return true
    
end

function AMB.Adminus.Modes.RemovePlayer( ePly )

    if not AMB.Adminus.Modes.GetPlayer( ePly ) then AMB.ErrorLog( 'Adminus', 'Player '..ePly:SteamID()..' is not in Adminus Mode' ) return false end 

    AMB.NW.SetString( ePly, 'AdminusMode', '' )

    ePly:SetMaterial( ePly.adminus_mode_return_mat )
    ePly:SetColor( ePly.adminus_mode_return_col )
    ePly:GodDisable()

    return true

end