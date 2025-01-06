function AMB.Gamemode.PlayerFreeze( ePly, bFreeze )

    ePly.basewars_freeze = bFreeze

end

hook.Add( 'SetupMove', 'AMB.Gamemode.PlayerFreeze', function( ePly, cmoveInfo, cuserCommand )

    if not ePly.basewars_freeze then return end

    if cmoveInfo:KeyDown( IN_FORWARD ) or cmoveInfo:KeyDown( IN_MOVELEFT ) or cmoveInfo:KeyDown( IN_MOVERIGHT ) or cmoveInfo:KeyDown( IN_BACK ) then  

        cmoveInfo:SetForwardSpeed( 0.00 )
        cmoveInfo:SetSideSpeed( 0.00 )
        cmoveInfo:SetUpSpeed( 0.00 )

    end

end )