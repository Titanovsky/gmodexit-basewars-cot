local CFG = AMB.Adminus.Config
local AddNet, Kick, GetStats = AMB.Network.AddString, AMB.Adminus.KickCheater, AMB.Gamemode.GetStats

function AMB.Adminus.ConsoleCommands.Execute( ePly, sCommand, tArgs )

    local executer = IsValid( ePly ) and GetStats( ePly, 'Gamename' ) or 'SERVER'

    local abil = AMB.Adminus.Abilities.GetFromCommand( sCommand )
    if not abil then return end

    abil.func( ePly, tArgs )

end

local net_receive_cmd = AddNet( CFG.net_execute_console_command )
net.Receive( net_receive_cmd, function( _, ePly )

    if not ePly:IsAuth() then Kick( ePly, '3ad000C', 'Неавторизованный ~p~ попытался выполнить админскую команду' ) return end

    local args = net.ReadTable()
    local command = args[ 1 ]
    local verif = AMB.Adminus.ConsoleCommands.IsVerificationPlayer( ePly, command )
    if not verif then Kick( ePly, '3ad001C', '~p~ попытался выполнить админскую команду, не пройдя проверку' ) return end

    args = AMB.Adminus.ConsoleCommands.ValidateArguments( ePly, args )
    if not args then return end

    AMB.Adminus.ConsoleCommands.Execute( ePly, command, args )

end )