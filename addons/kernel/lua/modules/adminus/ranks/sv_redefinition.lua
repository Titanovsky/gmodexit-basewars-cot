local meta = FindMetaTable( 'Player' )

local is_super_admin_tbl_ranks = {

    [ 'creator' ] = true,
    [ 'superadmin' ] = true,
    [ 'root' ] = true,
    [ 'owner' ] = true,
    [ 'founder' ] = true

}

function meta:IsSuperAdmin()

    return is_super_admin_tbl_ranks[ self:GetUserGroup() ]

end