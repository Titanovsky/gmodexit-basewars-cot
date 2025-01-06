local C, Adm = AMB.G.C, AMB.Adminus
local Add = AMB.Adminus.Abilities.RegisterAbility

Add( 'ShowMenu', 1, {}, 'Show Admin menu.', 'menu', function( eCaller, tOptions ) 

    eCaller:SendLua( 'AMB.Adminus.Abilities.ShowMenu()' )

end )

Add( 'SetRank', 99, { [1] = 'id:Player', [2] = 'string:Rank', [3] = 'int:Minutes until Remove Rank', [4] = 'string:Reason' }, 'Изменить игроку ранг.', 'setrank', function( eCaller, tOptions ) 

    local Re = AMB.Re

    local target = tOptions[ 1 ]
    if not IsValid( target ) or not target:IsAuth() then return end

    local rank = tOptions[ 2 ] or 'user'
    local date_end = tOptions[ 3 ] or 5
    local reason = tOptions[ 4 ] or ''
    local caller_name = IsValid( eCaller ) and AMB.Gamemode.GetStats( eCaller, 'Gamename' ) or 'SERVER'

    Adm.Ranks.SetRank( target, rank, tonumber( date_end ), reason )

    if AMB.Adminus.Ranks.IsRank( target, rank ) then

        AMB.UI.Chat.SendMessageAll( nil, C.AMB_GRAY, '[•] Игрок ', C.FLAT_GREEN, AMB.Gamemode.GetStats( target, 'Gamename' ), C.ABS_WHITE, ' назначен на ранг ', C.FLAT_RED, rank, C.ABS_WHITE, ' игроком ', C.FLAT_GREEN, caller_name, C.ABS_WHITE, ' по причине: ', C.FLAT_RED, reason )
    
    end

end )

Add( 'SetMode', 99, { [1] = 'id:Player', [2] = 'string:Mode' }, 'Изменить игроку режим.', 'setmode', function( eCaller, tOptions ) 

    local Re = AMB.Re

    local ply = tOptions[ 1 ]
    if not IsValid( ply ) or not ply:IsAuth() then return end

    local mode = ( #tOptions[ 2 ] == 0 ) and 'user' or tOptions[ 2 ]
    local caller_name = IsValid( eCaller ) and AMB.Gamemode.GetStats( eCaller, 'Gamename' ) or 'SERVER'

    Adm.Modes.SetPlayer( ply, mode )
    Re.Notify( ply, { time = 5, type = 6, text = 'Игрок '..caller_name..' поменял вам режим '..mode, color = C.AMB_GRAY } )

end )

Add( 'DevMode', 99, {}, 'Войти в Dev режим.', 'devmode', function( eCaller, tOptions ) 

    local Re = AMB.Re
    
    local is_dev = Adm.Modes.IsPlayer( eCaller, 'dev' )
    local msg = is_dev and 'Вы вышли из dev режима' or 'Вы вошли в dev режим'

    if is_dev then Adm.Modes.RemovePlayer( eCaller ) else Adm.Modes.SetPlayer( eCaller, 'dev' ) end
    Re.Notify( eCaller, { time = 2.75, type = 7, text = msg, color = C.AMB_GRAY } )

end )