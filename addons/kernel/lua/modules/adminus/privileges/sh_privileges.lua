AMB.Adminus.Privileges = AMB.Adminus.Privileges or {}
AMB.Adminus.Privileges.table = AMB.Adminus.Privileges.table or {}

function AMB.Adminus.Privileges.AddPrivilege( sName, nAccess, sTrueName, sDescription )

    AMB.Adminus.Privileges.table[ string.lower( sName ) ] = { 

        access = nAccess or 0,
        description = sDescription or 'Description',
        true_name = sTrueName or 'Unknow'

    }

end

function AMB.Adminus.Privileges.GetPrivilege( ePly )

    if AMB.Adminus.Privileges.table[ AMB.Stats.GetStats( ePly, 'adminus_privilege' ) ] then return AMB.Stats.GetStats( ePly, 'adminus_privilege' ) end

    return 'user'

end

function AMB.Adminus.Privileges.IsPrivilege( ePly, sRank )

    return ( AMB.Stats.GetStats( ePly, 'adminus_privilege' ) == sRank )

end

for name, tbl in pairs( AMB.Adminus.Config.privileges ) do AMB.Adminus.Privileges.AddPrivilege( name, tbl.access, tbl.true_name, tbl.description ) end