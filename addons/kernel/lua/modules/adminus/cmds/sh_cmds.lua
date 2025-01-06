AMB.Adminus.ConsoleCommands = AMB.Adminus.ConsoleCommands or {}

local C, SND, CFG = AMB.G.C, AMB.G.SND, AMB.Adminus.Config
local Adm, Chat = AMB.Adminus, AMB.UI.Chat
local Error = function( ePly, sText ) 

    local Re = AMB.Re

    if not IsValid( ePly ) then print( '[Adminus] '..sText ) return end

    Re.Notify( ePly, { type = 1, time = 3.25, color = C.AMB_ERROR, sound = SND.ERROR, text = sText } ) 
    
end

local function ServerSend( ePly, sCMD, tArgs, sArgs )

    local command = tArgs[ 1 ]
    local abil = Adm.Abilities.GetFromCommand( command )
    if not abil then Error( ePly, 'Не существует команды: '..command ) return end

    local args = AMB.Adminus.ConsoleCommands.ValidateArguments( ePly, tArgs )
    AMB.Adminus.ConsoleCommands.Execute( ePly, command, args )

end

local function ClientSend( ePly, sCMD, tArgs, sArgs )

    local Re = AMB.Re

    if not tArgs then return end

    local command = tArgs[ 1 ] or ''

    if not AMB.Adminus.ConsoleCommands.IsVerificationPlayer( ePly, command ) then Re.Notify( { type = 1, sound = SND.ERROR, time = 3, text = 'Вам не доступна команда!', color = C.AMB_ERROR } ) return end

    net.Start( CFG.net_execute_console_command )
        net.WriteTable( tArgs )
    net.SendToServer()

end

function AMB.Adminus.ConsoleCommands.IsVerificationPlayer( ePly, sCommand )

    if not ePly:IsAuth() then return false end

    local abil = Adm.Abilities.GetFromCommand( sCommand )
    if not abil then return false end
    if not Adm.ValidationAccess( ePly, abil.access ) then return false end

    return true

end

function AMB.Adminus.ConsoleCommands.ValidateArguments( ePly, tArgs )

    if not tArgs then return end

    local cmd = tArgs[ 1 ]
    local abil = Adm.Abilities.GetFromCommand( cmd )
    if not abil then return end

    local args = {}
    for i, v in pairs( tArgs ) do

        if ( i == 1 ) then continue end
        if not abil.args[ i - 1 ] then continue end

        local tab = string.Explode( ':', abil.args[ i - 1 ] )
        local rule = tab[ 1 ]

        if ( rule == 'id' ) then

            local verif = AMB.Adminus.ValidationPlayer( v )
            if not verif then Error( ePly, 'Игрок не найден или найдено несколько игроков!' ) return end

            args[ #args + 1 ] = verif

        elseif ( rule == 'bool' ) then

            local verif = v and tobool( v ) or false

            args[ #args + 1 ] = verif

        elseif ( rule == 'number' ) then

            local verif = v and tonumber( v ) or 0

            args[ #args + 1 ] = math.floor( verif )

        elseif ( rule == 'string' ) then

            args[ #args + 1 ] = v or ''

        end

    end

    return args

end

function AMB.Adminus.ConsoleCommands.Send( ePly, sCMD, tArgs, sArgs )

    if SERVER then ServerSend( ePly, sCMD, tArgs, sArgs ) else ClientSend( ePly, sCMD, tArgs, sArgs ) end

end
concommand.Add( 'adm', AMB.Adminus.ConsoleCommands.Send )
concommand.Add( 'sam', AMB.Adminus.ConsoleCommands.Send )
concommand.Add( 'ulx', AMB.Adminus.ConsoleCommands.Send )
concommand.Add( 'ba', AMB.Adminus.ConsoleCommands.Send )