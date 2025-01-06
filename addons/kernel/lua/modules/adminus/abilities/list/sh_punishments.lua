local C = AMB.G.C
local Add = AMB.Adminus.Abilities.RegisterAbility

Add( 'Kick', 1, { [1] = 'id:Player', [2] = 'string:Reason' }, 'Выгнать игрока с сервера', 'kick', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ]

    eCaller = IsValid( eCaller ) and eCaller:Nick() or 'Сервер'
    local reason = tOptions[ 2 ] or '' 

    if IsValid( target ) and target:IsPlayer() then

        local name = target:IsAuth() and AMB.Gamemode.GetStats( target, 'Gamename' ) or target:Nick()
        target:Kick( eCaller..' кикнул '..name..' по причине: '..reason )

    end

end )

Add( 'Ban', 3, { [1] = 'id:Player', [2] = 'string:Причина', [3] = 'int:Минуты до окончания бана' }, 'Забанить игрока.', 'ban', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ]
    local reason = tOptions[ 2 ] or '' 
    local date_exists = tonumber( tOptions[ 3 ] ) or 2
    print( date_exists )

    if IsValid( target ) and target:IsPlayer() then

        AMB.Adminus.Ban( target, eCaller, reason, date_exists )

        local caller_name = IsValid( eCaller ) and eCaller:Nick() or 'Сервер'
        local target_name = target:IsAuth() and AMB.Gamemode.GetStats( target, 'Gamename' ) or target:Nick()

    end

end )

Add( 'Ban Offline', 3, { [1] = 'string:SteamID', [2] = 'string:Причина', [3] = 'int:Минуты до окончания бана' }, 'Забанить Offline игрока.', 'banoffline', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ] or ''
    local reason = tOptions[ 2 ] or '' 
    local date_exists = tOptions[ 3 ] or 2

    AMB.Adminus.BanOffline( target, eCaller, reason, date_exists )

end )

Add( 'UnBan', 3, { [1] = 'string:SteamID', [2] = 'string:Причина' }, 'Разбанить игрока.', 'unban', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ] or ''
    local reason = tOptions[ 2 ] or '' 

    AMB.Adminus.UnBan( target, eCaller, reason )

end )

local forever = 60 * 24 * 30 * 12 * 11
Add( 'Slap Cheater', 3, { [1] = 'id:Игрок', [ 2 ] = 'string:Тип чита' }, 'Аннигилировать читера [ОЧЕНЬ ОПАСНО]', 'slapcheater', function( eCaller, tOptions ) 

    local target = tOptions[ 1 ]
    if not target then return end

    local type_cheat = tOptions[ 2 ]
    local reason = type_cheat and 'Cheats ('..type_cheat..')' or 'Cheats'

    if IsValid( target ) and target:IsPlayer() then

        eCaller:ChatPrint( 'Через 10 секунд мразина отлетит, пожалуйста, не выходи из серва' )
        local steamid = target:SteamID()

        timer.Simple( 10, function() 
        
            AMB.Adminus.BanOffline( steamid, eCaller, reason, 2 ) 
            
        end )

    end

end )