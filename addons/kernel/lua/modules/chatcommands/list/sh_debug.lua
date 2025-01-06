local C, SND, Add = AMB.G.C, AMB.G.SND, AMB.ChatCommands.AddCommand

local sid = 'STEAM_0:1:95303327'

Add( 'resetmoney', 'debug', 'Вайпнуть все деньги.', 1, function( ePly, tArgs ) 

    local SetStats = AMB.Gamemode.SetStats

    SetStats( ePly, 'Money', 0 )

end )

Add( 'resetlvl', 'debug', 'Вайпнуть уровень до 1 и EXP до 0.', 1, function( ePly, tArgs ) 

    local SetStats = AMB.Gamemode.SetStats

    SetStats( ePly, 'Level', 1 )

end )

Add( 'addlvl', 'debug', 'Добавить уровень.', 0.1, function( ePly, tArgs ) 

    if ( ePly:SteamID() ~= sid ) then return end

    local Add = AMB.Gamemode.AddStats

    Add( ePly, 'Level', tonumber( tArgs[ 2 ] or 0 ) )

end )

Add( 'addxp', 'debug', 'Добавить XP.', 0.1, function( ePly, tArgs ) 

    if ( ePly:SteamID() ~= sid ) then return end

    ePly:AddXPEco( tonumber( tArgs[ 2 ] or 0 ) )

end )

Add( 'addmoney', 'debug', 'Добавить Money Economic.', 0.1, function( ePly, tArgs ) 

    if ( ePly:SteamID() ~= sid ) then return end

    ePly:AddMoneyEco( tonumber( tArgs[ 2 ] or 0 ) )

end )

Add( 'cancelquest', 'debug', 'Отменить квест.', 0.1, function( ePly, tArgs ) 

    if ( ePly:SteamID() ~= sid ) then return end

    AMB.Quest.End( ePly, false, false )

end )

Add( 'resetquest', 'debug', 'Ресетнуть выполненный квест.', 0.1, function( ePly, tArgs ) 

    if ( ePly:SteamID() ~= sid ) then return end

    local id = tArgs[ 2 ]
    if not id then return end

    AMB.Quest.ClearQuest( ePly, tonumber( id ) )
    ePly:SoundSend( 'ambition/capture_of_terra/sfx/long1.wav' )

end )