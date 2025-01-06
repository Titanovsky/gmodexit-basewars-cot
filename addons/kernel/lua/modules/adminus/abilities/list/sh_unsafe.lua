local C = AMB.G.C
local Add = AMB.Adminus.Abilities.RegisterAbility

Add( 'RconRun', 99, { [1] = 'string:Console Command' }, '-', 'rcon', function( eCaller, tOptions ) 

    if IsValid( eCaller ) and not AMB.Adminus.ValidationAccess( eCaller, 99 ) then return end

    local str = tOptions[ 1 ] or ''
    game.ConsoleCommand( str..'\n' )

end )

Add( 'LuaRunServer', 99, { [1] = 'string:Code' }, 'Run on server string with Lua-code.', 'luarunsv', function( eCaller, tOptions ) 

    if IsValid( eCaller ) and not AMB.Adminus.ValidationAccess( eCaller, 99 ) then return end

    local str = tOptions[ 1 ]

    str = string.sub( '=', 1, 1 ) and 'tmp_var='..str or str

    RunString( str )

    if not IsValid( eCaller ) then 
    
        if not istable( tmp_var ) then print( '>> '..tostring( tmp_var ) ) else PrintTable( tmp_var ) end

        return 
        
    end

    if not istable( tmp_var ) then eCaller:SendLua( 'print( ">> '..tostring( tmp_var )..'")' ) end

end )

Add( 'LuaRunClient', 99, { [1] = 'id:Player', [2] = 'string:Code' }, 'Run of specific client Lua-code.', 'luaruncl', function( eCaller, tOptions ) 

    if IsValid( eCaller ) and not AMB.Adminus.ValidationAccess( eCaller, 99 ) then return end

    local target = tOptions[ 1 ]
    if not IsValid( target ) then return end

    target:SendLua( tOptions[ 2 ] )

end )