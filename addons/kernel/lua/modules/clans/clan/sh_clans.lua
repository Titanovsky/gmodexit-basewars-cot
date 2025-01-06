local CFG = AMB.Clans.Config

function AMB.Clans.GetClan( nID )

    return AMB.Clans.table[ nID ]

end

function AMB.Clans.GetClanName( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    return clan.name

end

function AMB.Clans.GetClanColor( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    return clan.color

end

function AMB.Clans.GetClanRanks( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    return clan.ranks

end

function AMB.Clans.GetClanBalance( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    return clan.balance

end

function AMB.Clans.GetClanLevel( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    return clan.level

end

function AMB.Clans.GetClanXP( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    return clan.xp

end

function AMB.Clans.GetClanMembers( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    return clan.members

end

function AMB.Clans.GetClanOnlineMembers( nID )

    local online = {}

    for _, ply in pairs( player.GetHumans() ) do

        if ( AMB.Clans.PlayerGetClanID( ply ) == nID ) then online[ #online + 1 ] = ply end

    end

    return online

end

function AMB.Clans.GetClanSlots( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    if ( clan.level == 1 ) then return 4
    elseif ( clan.level == 2 ) then return 8
    elseif ( clan.level == 3 ) then return 16
    elseif ( clan.level == 4 ) then return 24
    elseif ( clan.level == 5 ) then return 32
    end

    return 0

end

function AMB.Clans.GetClanMembersLimit( nID )

    local slots = AMB.Clans.GetClanSlots( nID )
    if not slots then return 0 end

    local members = AMB.Clans.GetClanMembers( nID )

    return ( slots == #members )

end

function AMB.Clans.GetClanTag( nID )

    if not AMB.Clans.GetClan( nID ) then return false end

    local clan = AMB.Clans.GetClan( nID )

    if ( clan.level == 1 ) then return 'Банда'
    elseif ( clan.level == 2 ) then return 'Команда'
    elseif ( clan.level == 3 ) then return 'Гильдия'
    elseif ( clan.level == 4 ) then return 'Синдикат'
    elseif ( clan.level == 5 ) then return 'Корпорация'
    end

    return ''

end

function AMB.Clans.GetClans()

    if not AMB.Clans.table then return {} end

    return AMB.Clans.table

end

function AMB.Clans.CalcRanks( sRanks )

    local tab = {}
    local tab_ranks = string.Explode( ';', sRanks )

    for _, v in pairs( tab_ranks ) do

        local tab_ranks2 = string.Explode( '=', v )
        local id = string.Trim( tab_ranks2[ 1 ] )

        local tab_ranks3 = string.Explode( ',', tab_ranks2[ 2 ] )
        local name_rank = string.Trim( tab_ranks3[ 1 ] )
        local access_rank = string.Trim( tab_ranks3[ 2 ] )

        tab[ tonumber( id ) ] = { name = name_rank, access = tonumber( access_rank ) }

    end

    return tab

end

function AMB.Clans.CalcNXP( nLevel )

    return 5000 * nLevel - 1

end

function AMB.Clans.CalcSlots( nID )

    local level = AMB.Clans.GetClanLevel( nID )

    if ( level == 1 ) then return 4
    elseif ( level == 2 ) then return 8
    elseif ( level == 3 ) then return 16
    elseif ( level == 4 ) then return 24
    elseif ( level == 5 ) then return 32
    else return 0
    end

end

function AMB.Clans.CalcOuterTax( nID )

    local members = AMB.Clans.GetClanMembers( nID )
    
    return CFG.tax_money_min * #members

end