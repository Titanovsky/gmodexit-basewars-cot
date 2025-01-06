function AMB.Auth.IsPlayer( ePly )

    if not ePly:IsPlayer() then return false end

    return AMB.NW.GetBool( ePly, 'Auth' )

end

function AMB.Auth.IsAuth( ePly )

    if not ePly:IsPlayer() then return false end

    return AMB.NW.GetBool( ePly, 'Auth' )

end

local unverif_chars = { [ '_' ] = true, [ ';' ] = true, [ '`' ] = true, [ '\'' ] = true, [ '"' ] = true, [ '/' ] = true, [ '\\' ] = true, [ '*' ] = true, [ '@' ] = true, [ '^' ] = true, [ '%' ] = true }

function AMB.Auth.IsVerifNick( sNick )

    for char, _ in pairs( unverif_chars ) do

        local start_pos_unverif_char = string.find( sNick, char )

        if start_pos_unverif_char then return false end

    end

    return true

end

function AMB.Auth.VerificateName( sNick )

    local tbl_str = string.Explode( '', sNick )
    local str_from_tbl = ''

    for i, char in ipairs( tbl_str ) do

        if unverif_chars[ char ] then
        
            char = ''
            tbl_str[ i ] = char

        end

        str_from_tbl = str_from_tbl..char

    end

    if ( utf8.len( str_from_tbl ) <= 1 ) then str_from_tbl = 'Unknow#'..math.random( 0x3E8, 0x270F ) end

    return str_from_tbl

end