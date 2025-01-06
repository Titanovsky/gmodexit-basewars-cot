AMB.Adminus = AMB.Adminus or {}
AMB.Adminus.Abilities = AMB.Adminus.Abilities or {}
AMB.Adminus.Abilities.table = AMB.Adminus.Abilities.table or {}

function AMB.Adminus.Abilities.GetTable()

    return AMB.Adminus.Abilities.table

end

function AMB.Adminus.Abilities.PrintTable()

    PrintTable( AMB.Adminus.Abilities.table )

end

function AMB.Adminus.Abilities.GetFromCommand( sCommand )

    local abilities = AMB.Adminus.Abilities.GetTable()

    for name, tab in pairs( abilities ) do

        if ( tab.cmd == string.lower( sCommand ) ) then return tab end

    end

end

function AMB.Adminus.Abilities.RegisterAbility( sName, nAccess, tArgsTypes, sDescription, sCMD, fAbility )

    if AMB.Adminus.Abilities.table[ sName ] then AMB.Adminus.Abilities.table[ sName ] = nil end

    AMB.Adminus.Abilities.table[ sName ] = {

        name = sName or 'Test',
        access = nAccess or 1,
        desc = sDescription or 'NOT DESCRIPTION.',
        cmd = sCMD or 'adminka',
        args = tArgsTypes or {},
        func = fAbility

    }

end
