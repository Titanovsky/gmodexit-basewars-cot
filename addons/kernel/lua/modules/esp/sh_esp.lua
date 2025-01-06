local C, SND = AMB.G.C, AMB.G.SND

function AMB.ESP.Add( sName, sHeader, sDescription, vPos, cColor, sImage )

    if not sHeader or not sName then return end
    if not cColor then cColor = C.ABS_WHITE end

    AMB.ESP.Config.gps_points[ sName ] = {

        header = sHeader,
        desc = sDescription or '',
        pos = vPos or Vector( 0, 0, 0 ),
        image = sImage and Material( sImage ) or nil,
        color = { 

            r = cColor.r or 0, 
            g = cColor.g or 0, 
            b = cColor.b or 0,
            a = cColor.a or 0,
            
        }

    }

    if CLIENT then concommand.Add( 'amb_esp_gps_'..sName, function() AMB.ESP.SetPoint( sHeader, vPos, sImage, cColor ) end ) end

end

local Add = AMB.ChatCommands.AddCommand
Add( 'marks', 'GPS', 'Показать все точки GPS', 1.5, function( ePly, tArgs ) 

    local gps = AMB.ESP.Config.gps_points

    for name, point in pairs( gps ) do ePly:ChatSend( C.FLAT_RED, name, C.FLAT_GREEN, ' — ', point.desc ) end
 
end )

Add( 'gps', 'GPS', 'Поставить точку на карте /gps [Название]', 0.5, function( ePly, tArgs ) 

    local name = tArgs[ 2 ] or ''
    local gps = AMB.ESP.Config.gps_points

    local point = gps[ name ] 
    if not gps then return end

    ePly:RunCommand( 'amb_esp_gps_'..name )
 
end )