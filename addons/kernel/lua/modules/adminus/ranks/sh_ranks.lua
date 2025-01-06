AMB.Adminus.Ranks = AMB.Adminus.Ranks or {}
AMB.Adminus.Ranks.table = AMB.Adminus.Ranks.table or {}

function AMB.Adminus.Ranks.Add( sName, nAccess, sTrueName, sDescription )

    AMB.Adminus.Ranks.table[ string.lower( sName ) ] = { 

        access = nAccess or 0,
        description = sDescription or 'Description',
        true_name = sTrueName or 'Unknow'

    }

end

function AMB.Adminus.Ranks.GetRank( ePly )

    if AMB.Adminus.Config.ranks[ ePly:GetUserGroup() ] then return ePly:GetUserGroup() end

    return 'user'

end

function AMB.Adminus.Ranks.IsRank( ePly, sRank )

    return ePly:IsUserGroup( sRank )

end

for name, tbl in pairs( AMB.Adminus.Config.ranks ) do AMB.Adminus.Ranks.Add( name, tbl.access, tbl.true_name, tbl.description ) end