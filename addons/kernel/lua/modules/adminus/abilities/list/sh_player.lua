local C = AMB.G.C
local Add = AMB.Adminus.Abilities.RegisterAbility

local max_int = 4294967296 -- 2 ^ 32

Add( 'God', 1, { [1] = 'id:Player' }, 'Вкл/Выкл годмода.', 'god', function( eCaller, tOptions ) 

    local ply = tOptions[ 1 ] or eCaller
    if not IsValid( ply ) then return end

    local is_god = eCaller:HasGodMode()
    local word, color = is_god and 'выключил' or 'включил', is_god and C.AMB_RED or C.AMB_GREEN

    if is_god then ply:GodDisable() else ply:GodEnable() end

    AMB.UI.Chat.SendMessage( ply, nil, C.AMB_GREEN, '[•] ', C.ABS_WHITE, 'Руководящий ', C.AMB_GREEN, eCaller, color, ' '..word, C.ABS_WHITE, ' Вам бессмертие'  )

end )

Add( 'SetHealth', 1, { [1] = 'id:Player', [2] = 'int:Amount Health', [3] = 'bool: To notice of player?' }, 'Change of player amount Health.', 'sethp', function( eCaller, tOptions ) 

    local ply = tOptions[ 1 ]
    if not IsValid( ply ) then return end

    local amount = tonumber( tOptions[ 2 ] )

    if ( amount < 0 ) then amount = 0 end
    if ( amount > max_int ) then amount = max_int end

    ply:SetHealth( amount )

    if not ( tOptions[ 3 ] == '1' ) then return end

    eCaller = IsValid( eCaller ) and eCaller:Nick() or 'SERVER'
    AMB.UI.Chat.SendMessage( ply, nil, C.AMB_GREEN, '[•] ', C.AMB_WHITE, 'Руководящий ', C.AMB_GREEN, eCaller, C.AMB_WHITE, ' изменил Вам здоровье на >> '..tOptions[ 2 ]  )

end )

Add( 'SetArmor', 1, { [1] = 'id:Player', [2] = 'int:Amount Armor', [3] = 'bool: To notice of player?' }, 'Изменить игроку количество брони.', 'setarmor', function( eCaller, tOptions ) 

    local ply = tOptions[ 1 ]
    if not IsValid( ply ) then return end

    local amount = tonumber( tOptions[ 2 ] )

    if ( amount < 0 ) then amount = 0 end
    if ( amount > max_int ) then amount = max_int end

    ply:SetArmor( amount )

    if not ( tOptions[ 3 ] == '1' ) then return end

    eCaller = IsValid( eCaller ) and eCaller:Nick() or 'SERVER'
    AMB.UI.Chat.SendMessage( ply, nil, C.AMB_GREEN, '[•] ', C.AMB_WHITE, 'Руководящий ', C.AMB_GREEN, eCaller, C.AMB_WHITE, ' изменил Вам броню >> '..tOptions[ 2 ]  )

end )

Add( 'NoClip', 1, { [1] = 'id:Player', [2] = 'bool:To notice of player' }, 'Turn on/off of noclip.', 'noclip', function( eCaller, tOptions ) 

    local ply = not tOptions[ 1 ] and eCaller or tOptions[ 1 ] --  выбранный игрок или сам админ, который вызвал
    if not IsValid( ply ) or not ply:IsPlayer() then return end
    local movetype = ( ply:GetMoveType() == MOVETYPE_NOCLIP ) and true or false

    ply:SetMoveType( movetype and MOVETYPE_ISOMETRIC or MOVETYPE_NOCLIP )
    
    local to_notice = tobool( tOptions[ 2 ] )
    if not to_notice then return end

    local word = movetype and 'выключил' or 'включил'
    local name = IsValid( eCaller ) and AMB.Gamemode.GetStats( eCaller, 'Gamename' ) or 'SERVER' 
    AMB.UI.Chat.SendMessage( ply, nil, C.AMB_GREEN, '[•] ', C.AMB_GREEN, name, C.ABS_WHITE, ' '..word..' Вам полёт' )

end )

Add( 'PlaySound', 99, { [1] = 'id:Игрок', [2] = 'string:Путь к звуку' }, 'Проиграть музыку игроку.', 'playsound', function( eCaller, tOptions ) 

    local ply, sound = tOptions[ 1 ] or eCaller, tOptions[ 2 ] or ''

    ply:SendLua( 'surface.PlaySound("'..sound..'")' ) -- UNSAFE

end )