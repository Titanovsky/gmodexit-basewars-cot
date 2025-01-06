local CFG = AMB.Clans.Config

AMB.Network.AddString( 'amb_clans_players_accept_invite' )
net.Receive( 'amb_clans_players_accept_invite', function( nLen, ePly )

    if not AMB.Auth.Check( ePly, '3cl001N', 'Игрок ~p~ попытался принять приглашение клана, будучи неавторизованным' ) then return false end
    if AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '1cl011N', 'Игрок ~p~ попытался принять приглашение клана, будучи в клане' ) return end
    if not timer.Exists( 'AMBTimeClansToInvite:'..ePly:SteamID() ) then AMB.Adminus.KickCheater( ePly, '2cl021N', 'Игрок ~p~ попытался принять приглашение клана, без таймера' ) return end
    if not ePly.id_invite then return end
    
    AMB.Clans.AddPlayer( ePly, ePly.id_invite )

end )

AMB.Network.AddString( 'amb_clans_players_leave' )
net.Receive( 'amb_clans_players_leave', function( nLen, ePly )

    if not AMB.Auth.Check( ePly, '3cl031N', 'Игрок ~p~ попытался покинуть клан, будучи неавторизованным' ) then return false end
    if not AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl041N', 'Соло игрок ~p~ попытался покинуть клан ' ) return end

    AMB.Clans.RemovePlayer( ePly )

end )

AMB.Network.AddString( 'amb_clans_players_receive_leader_invite' ) -- todo
net.Receive( 'amb_clans_players_receive_leader_invite', function( nLen, ePly )

    if not AMB.Auth.Check( ePly, '3cl051N', 'Игрок ~p~ попытался пригласить кого-то в клан, будучи неавторизованным' ) then return false end
    if not AMB.Clans.PlayerIsLeader( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl061N', 'Игрок ~p~ попытался пригласить кого-то в клан, не имея лидерки' ) return end

    local target = net.ReadEntity()
    if not IsValid( target ) or not target:IsPlayer() then return end
    if ( ePly:GetPos():Distance( target:GetPos() ) > 120 ) then return end
    if target.id_invite then ePly:ChatPrint( 'Игрока уже пригласили' ) return end
    if AMB.Clans.PlayerIsClan( target ) then AMB.Adminus.KickCheater( ePly, '3cl071N', 'Игрок ~p~ попытался пригласить в клан игрока, который уже в клане' ) return end

    AMB.Clans.InvitePlayer( target, AMB.Clans.PlayerGetClanID( ePly ) )

end )

AMB.Network.AddString( 'amb_clans_players_demote' )
net.Receive( 'amb_clans_players_demote', function( nLen, ePly )

    if not AMB.Auth.Check( ePly, '3cl081N', 'Игрок ~p~ попытался выгнать кого-то из клана, будучи неавторизованным' ) then return false end
    if ( AMB.Clans.PlayerGetAccess( ePly ) < 4 ) then AMB.Adminus.KickCheater( ePly, '3cl091N', 'Игрок ~p~ попытался выгнать кого-то из клана, не имея доступ' ) return end

    local steamid = net.ReadString()
    if not steamid then return end

    local member_clan = AMB.SQL.Select( CFG.db_players, 'Clan', 'SteamID', ePly:SteamID() )
    if not member_clan then return end
    if ( tonumber( member_clan ) ~= AMB.Clans.PlayerGetClanID( ePly ) ) then AMB.Adminus.KickCheater( ePly, '1cl101N', 'Игрок ~p~ попытался выгнать игрока из клана, который в его клане' ) return end

    AMB.Clans.RemovePlayerOffline( steamid )

    ePly:ChatPrint( 'Вы уволили игрока' )

end )

local net_receive_set_rank = AMB.Network.AddString( 'amb_clans_players_set_rank' )
net.Receive( net_receive_set_rank, function( nLen, ePly )

    if not AMB.Auth.Check( ePly, '3cl111N', 'Игрок ~p~ попытался изменить ранг со-клановцу, будучи неавторизованным' ) then return false end
    if ( AMB.Clans.PlayerGetAccess( ePly ) < 3 ) then AMB.Adminus.KickCheater( ePly, '3cl121N', 'Игрок ~p~ попытался изменить ранг со-клановцу, не имея доступ' ) return end

    local up_or_down = net.ReadBit()
    local steamid = net.ReadString()
    if not steamid or AMB.Utility.StringIsNullOrWhitespaces( steamid ) then return end

    local member_clan = AMB.SQL.Select( CFG.db_players, 'Clan', 'SteamID', ePly:SteamID() )
    if not member_clan then return end
    if ( tonumber( member_clan ) ~= AMB.Clans.PlayerGetClanID( ePly ) ) then AMB.Adminus.KickCheater( ePly, '3cl131N', 'Игрок ~p~ попытался изменить ранг игроку, который не в его клане' ) return end

    local member_rank = tonumber( AMB.SQL.Select( CFG.db_players, 'Rank', 'SteamID', steamid ) )
    if ( member_rank >= AMB.Clans.PlayerGetRank( ePly ) ) then AMB.Adminus.KickCheater( ePly, '3cl141N', 'Игрок ~p~ попытался изменить ранг со-клановцу, который старше/равен по рангу' ) return end

    if ( up_or_down == 1 ) then 

        AMB.Clans.SetRankOffline( steamid, member_rank + 1, ePly )
        ePly:ChatPrint( 'Вы повысили ранг игроку '..steamid )

    else

        AMB.Clans.SetRankOffline( steamid, member_rank - 1, ePly )
        ePly:ChatPrint( 'Вы понизили ранг игроку '..steamid )

    end

end )