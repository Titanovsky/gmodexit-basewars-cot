local C = AMB.G.C

AMB.Adminus.log_cheaters = AMB.Adminus.log_cheaters or {}

function AMB.Adminus.KickCheater( ePly, sCode, sWarning )

    if not ePly or not IsValid( ePly ) or not ePly:IsPlayer() then return false end

    sWarning = sWarning or ''
    if not sCode then 
    
        AMB.ErrorLog( 'Adminus', 'Not specified real AntiCheat code' ) 
        nCode = '3ad000M' 
        
    end

    if AMB.Adminus.Modes.IsPlayer( ePly, 'dev' ) or AMB.Adminus.Modes.IsPlayer( ePly, 'admin' ) then

        AMB.Re.ChatError( ePly, 'Вас попытался кикнуть античит #'..sCode )

        return true

    end

    local name_violator = AMB.Utility.StringIsNullOrWhitespaces( AMB.Gamemode.GetStats( ePly, 'Gamename' ) ) and ePly:Nick()..'('..ePly:SteamID()..')' or AMB.Gamemode.GetStats( ePly, 'Gamename' )..'('..ePly:SteamID()..')'
    sWarning = string.Replace( sWarning, '~p~', name_violator )
    MsgC( C.AMB_ERROR, '[Anti-Cheat] ', C.AMB_GRAY, '[#'..sCode..'] ', C.ABS_WHITE, sWarning..'\n' )

    AMB.Adminus.log_cheaters[ #AMB.Adminus.log_cheaters + 1 ] = { entity = ePly, code = '#'..sCode, warning = sWarning, steamid = ePly:SteamID(), steamid64 = ePly:SteamID64(), ip = ePly:IPAddress(), date = os.time() }

    ePly:Kick( 'Вы кикнуты за подозрение в читерстве: #'..sCode..'\n\nПожалуйста, заскриньте код античита [F12]' )

    return true

end