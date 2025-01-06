AMB.Utility = AMB.Utility or {}

function AMB.Utility.FindPlayerOnData( sArg, fData, bOnlyHumans )

    if not sData then AMB.ErrorLog( 'Ambition.Utility', 'Not specified fData' ) return false end
    sArg = sArg or ''

    local players = {}
    local find_tbl = bOnlyHumans and player.GetHumans() or player.GetAll()

    for _, ply in pairs( find_tbl ) do

        local data = fData( ply )

        sArg = string.lower( sArg )
        data = string.lower( data )
            
        if string.find( data, sArg ) then table.insert( players, ply ) end
        if ( data == sArg ) then return ply end

    end

    if ( #players == 0 ) or ( #players > 1 ) then return false end

    return players[ 1 ]

end

function AMB.Utility.GetRussianDate( nDate )

    return os.date( '%d.%m.%Y', nDate )

end

function AMB.Utility.StringIsNullOrWhitespaces( sString )

    if not sString or not isstring( sString ) then return true end

    for _, char in ipairs( string.Explode( '', sString ) ) do

        if ( char ~= ' ' ) then return false end

    end

    return true

end

function AMB.Utility.ValidString( sString )

    if not sString or not isstring( sString ) then return false end

    for _, char in ipairs( string.Explode( '', sString ) ) do

        if ( char ~= ' ' ) then return true end

    end

    return false

end

function AMB.Utility.GetTextSizeX( sText, sFont )

    if not CLIENT then return end

    surface.SetFont( sFont )
    local x, _ = surface.GetTextSize( sText )

    return x

end

function AMB.Utility.GetTextSizeY( sText, sFont )

    if not CLIENT then return end

    surface.SetFont( sFont )
    local _, y = surface.GetTextSize( sText )

    return y

end

function AMB.Utility.GetFrontPos( ePly, nMultiply )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end

    -- TODO: fix pos, then Entity spawned with nMultiply to Wall or behind Wall

    local angle = ePly:EyeAngles()
    local shoot_pos = ePly:GetShootPos()
    local aim_pos = ePly:GetAimVector()
    
    return shoot_pos + ( aim_pos * ( nMultiply or 70 ) )

end

-- ## Coding ####################################################################

-- Source: https://gist.github.com/liukun/f9ce7d6d14fa45fe9b924a3eed5c3d99

AMB.Utility.Coding = AMB.Utility.Coding or {}

local format, byte, gsub, char = string.format, string.byte, string.gsub, string.char

function AMB.Utility.Coding.CharToHEX( sChar )

    return format( '%%%02X', byte( sChar ) )

end

function AMB.Utility.Coding.HEXToChar( sHEX )

    return char( tonumber( sHEX, 16 ) )

end

function AMB.Utility.Coding.EncodeURL( sStr )

    if ( sStr == nil ) then return '' end

    local url = ''
    url = gsub( sStr, '\n', '\r\n' )
    url = gsub( url, '([^%w ])', AMB.Utility.Coding.CharToHEX )
    url = gsub( url, ' ', '+' )
    
    return url

end

function AMB.Utility.Coding.DecodeURL( sUrl )

    if ( sUrl == nil ) then return '' end

    local str = ''
    str = gsub( sUrl, '+', ' ' )
    str = gsub( str, '%%(%x%x)', AMB.Utility.Coding.CharToHEX )

    return str

end