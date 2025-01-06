AMB.Clans.Players = AMB.Clans.Players or {}

function AMB.Clans.PlayerIsClan( ePly )

    return AMB.NW.GetInt( ePly, 'Clan' ) > 0 and true or false

end

function AMB.Clans.PlayerIsLeader( ePly )
    
    return ( AMB.NW.GetInt( ePly, 'ClanRank' ) == 6 ) and true or false

end

function AMB.Clans.PlayerGetClan( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return false end
    
    return AMB.Clans.GetClan( AMB.NW.GetInt( ePly, 'Clan' ) )

end

function AMB.Clans.PlayerGetClanID( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return -1 end
    
    return AMB.NW.GetInt( ePly, 'Clan' )

end

function AMB.Clans.PlayerGetClanDate( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return 0 end
    
    local clan = AMB.Clans.GetClan( AMB.NW.GetInt( ePly, 'Clan' ) )

    return clan.date

end

function AMB.Clans.PlayerGetClanTax( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return 0 end
    
    local clan = AMB.Clans.GetClan( AMB.NW.GetInt( ePly, 'Clan' ) )

    return clan.tax

end

function AMB.Clans.PlayerGetRank( ePly )

    local rank = AMB.NW.GetInt( ePly, 'ClanRank' )

    return rank

end

function AMB.Clans.PlayerGetRankName( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return -1 end

    local rank = AMB.Clans.PlayerGetRank( ePly )
    local clan = AMB.Clans.GetClan( AMB.NW.GetInt( ePly, 'Clan' ) )

    return clan.ranks[ rank ].name 

end

function AMB.Clans.PlayerGetAccess( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return -1 end

    local rank = AMB.Clans.PlayerGetRank( ePly )
    local clan = AMB.Clans.GetClan( AMB.NW.GetInt( ePly, 'Clan' ) )

    return clan.ranks[ rank ].access 

end

function AMB.Clans.PlayerGetColor( ePly )

    if not AMB.Clans.PlayerIsClan( ePly ) then return Color( 255, 255, 255 ) end
    
    local clan = AMB.Clans.GetClan( AMB.NW.GetInt( ePly, 'Clan' ) )

    return clan.color

end

function AMB.Clans.FindClanPlayers()

    local tab = {}

    for _, ply in pairs( player.GetAll() ) do
        
        if not AMB.Clans.PlayerIsClan( ply ) then continue end

        tab[ #tab + 1 ] = { clan_player = ply, id = AMB.NW.GetInt( ply, 'Clan' ) }

    end

    return tab

end

function AMB.Clans.FindLeaders()

    local tab = {}

    for _, ply in pairs( player.GetHumans() ) do
        
        if not AMB.Clans.PlayerIsLeader( ply ) then continue end

        tab[ #tab + 1 ] = { leader = ply, id = AMB.NW.GetInt( ply, 'ClanLeader' ) }

    end

    return tab

end