function AMB.ChatCommands.AddCommand( sName, sType, sDescription, nDelay, fAction )

    if not fAction then AMB.ErrorLog( 'ChatCommands', 'fAction for AddCommand not found' ) return end

    if not sName or not isstring( sName ) then AMB.WarningLog( 'ChatCommands', 'sName for AddCommand not found, now sName = "test"' ) end
    sName = tostring( sName ) or 'test'

    if not nDelay then AMB.WarningLog( 'ChatCommands', 'nDelay for AddCommand not found, now nDelay = 1' ) end
    nDelay = nDelay or 1

    local old_tab = AMB.ChatCommands.Config.cmds[ sName ]

    AMB.ChatCommands.Config.cmds[ sName ] = {

        type = sType or 'other',
        desc = sDescription or 'NOT DESCRIPTION!',
        delay = nDelay,
        action = fAction

    }

    if SERVER then

        local word = old_tab and 'Changed' or 'Added'
        AMB.ConsoleLog( 'ChatCommands', word..' command: '..sName )

    end

end