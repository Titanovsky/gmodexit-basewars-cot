local C = AMB.G.C

local net_receive_register_clan = AMB.Network.AddString( 'amb_clans_register_clan' )
net.Receive( net_receive_register_clan, function( nLen, ePly )

    local CFG = AMB.Clans.Config

    if not AMB.Auth.Check( ePly, '3cl000N', 'Игрок ~p~ попытался создать клан, будучи неавторизованным' ) then return false end
    if AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl010N', 'Игрок ~p~ попытался создать клан, будучи в клане' ) return end
    if ( AMB.Gamemode.GetStats( ePly, 'Money' ) < CFG.register_pay ) then AMB.Adminus.KickCheater( ePly, '3cl020N', 'Игрок ~p~ попытался создать клан без нужной суммы денег' ) return end

    local name = net.ReadString()
    if AMB.Utility.StringIsNullOrWhitespaces( name ) or ( utf8.len( name ) > 24 ) then AMB.Adminus.KickCheater( ePly, '3cl030N', 'Игрок ~p~ попытался создать клан без названия' ) return end

    local desc = net.ReadString()
    if AMB.Utility.StringIsNullOrWhitespaces( desc ) or ( utf8.len( desc ) > 200 ) then AMB.Adminus.KickCheater( ePly, '3cl040N', 'Игрок ~p~ попытался создать клан без описания' ) return end

    local tax = net.ReadFloat()
    if not tax or ( tax > CFG.tax_xp_max ) or ( tax < CFG.tax_xp_min ) then AMB.Adminus.KickCheater( ePly, '3cl050N', 'Игрок ~p~ попытался создать клан без налога' ) return end

    local color = net.ReadColor()
    if not color then AMB.Adminus.KickCheater( ePly, '3cl060N', 'Игрок ~p~ попытался создать клан без цвета' ) return end

    AMB.Gamemode.AddStats( ePly, 'Money', -CFG.register_pay )
    AMB.Clans.RegisterClan( ePly, name, color, desc, math.Round( tax, 2 ) )

end )

local net_receive_remove_clan = AMB.Network.AddString( 'amb_clans_remove_clan' )
net.Receive( net_receive_remove_clan, function( nLen, ePly ) 

    local CFG = AMB.Clans.Config

    if not AMB.Auth.Check( ePly, '3cl070N', 'Игрок ~p~ попытался удалить клан, будучи неавторизованным' ) then return false end
    if not AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl080N', 'Соло игрок ~p~ попытался удалить клан' ) return end
    if not AMB.Clans.PlayerIsLeader( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl090N', 'Игрок ~p~ попытался удалить клан без лидерки' ) return end
    if ( AMB.Gamemode.GetStats( ePly, 'Money' ) < CFG.register_remove_clan_pay ) then AMB.Adminus.KickCheater( ePly, '2cl100N', 'Игрок ~p~ попытался удалить клан без нужной суммы денег' ) return end

    local ID = AMB.Clans.PlayerGetClanID( ePly )

    if ( AMB.Clans.GetClanLevel( ID ) == 5 ) then AMB.Adminus.KickCheater( ePly, '1cl110N', 'Лидер ~p~ попытался удалить клан с максимальным уровнем' ) return end

    AMB.Gamemode.AddStats( ePly, 'Money', -CFG.register_remove_clan_pay )
    AMB.Clans.RemoveClan( ID )

end )

local net_change_balance = AMB.Network.AddString( 'amb_clans_change_balance' )
net.Receive( net_change_balance, function( nLen, ePly )

    local CFG = AMB.Clans.Config

    if not AMB.Auth.Check( ePly, '3cl120N', 'Игрок ~p~ попытался изменить баланс клана, будучи неавторизованным' ) then return false end
    if not AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl130N', 'Соло игрок ~p~ попытался изменить баланс клана' ) return end

    local put_or_take = net.ReadBool()
    local summ = net.ReadUInt( 24 )
    if not summ or not isnumber( summ ) then AMB.Adminus.KickCheater( ePly, '3cl140N', 'Игрок ~p~ попытался изменить баланс клана без определённой суммы' ) return end

    local ID = AMB.Clans.PlayerGetClanID( ePly )
    local balance = AMB.Clans.GetClanBalance( ID )

    if put_or_take then 
    
        if ( AMB.Gamemode.GetStats( ePly, 'Money' ) < summ ) then AMB.Adminus.KickCheater( ePly, '2cl150N', 'Игрок ~p~ попытался пополнить баланс клана, не имея указанную сумму' ) return end

        AMB.Clans.SetBalance( ID, balance + summ )
        ePly:AddMoneyEco( -summ )

        for _, ply in pairs( player.GetHumans() ) do

            if ( AMB.Clans.PlayerGetClanID( ply ) == ID ) then AMB.UI.Chat.SendMessage( ply, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Игрок ', C.AMB_BLUE, AMB.Gamemode.GetStats( ePly, 'Gamename' ), C.ABS_WHITE, ' пополнил баланс клана на ', C.AMB_GREEN, summ..'$' ) end

        end

    else

        if ( AMB.Clans.PlayerGetAccess( ePly ) < 5 ) then AMB.Adminus.KickCheater( ePly, '3cl160N', 'Игрок ~p~ попытался взять с баланса клана, не имея доступа' ) return end
        if ( balance < summ ) then AMB.Adminus.KickCheater( ePly, '3cl170N', 'Игрок ~p~ попытался взять с баланса клана сумму, которой нет' ) return end

        AMB.Clans.SetBalance( ID, balance - summ )
        ePly:AddMoneyEco( summ )

        for _, ply in pairs( player.GetHumans() ) do

            if ( AMB.Clans.PlayerGetClanID( ply ) == ID ) then AMB.UI.Chat.SendMessage( ply, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Игрок ', C.AMB_BLUE, AMB.Gamemode.GetStats( ePly, 'Gamename' ), C.ABS_WHITE, ' взял с баланса клана сумму ', C.AMB_RED, summ..'$' ) end

        end

    end

    hook.Call( 'AmbitionClansSetBalance', nil, ePly, summ, put_or_take, ID, AMB.Clans.GetClan( ID ) )

end )

local net_change_ranks = AMB.Network.AddString( 'amb_clans_change_ranks' )
net.Receive( net_change_ranks, function( nLen, ePly )

    local CFG = AMB.Clans.Config

    if not AMB.Auth.Check( ePly, '3cl180N', 'Игрок ~p~ попытался изменить ранги клану, будучи неавторизованным' ) then return end
    if not AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl190N', 'Соло игрок ~p~ попытался изменить ранги клану' ) return end
    if ( AMB.Clans.PlayerGetAccess( ePly ) < 6 ) then AMB.Adminus.KickCheater( ePly, '2cl200N', 'Игрок ~p~ попытался изменить ранги клану, не имея доступа' ) return end

    local ID = AMB.Clans.PlayerGetClanID( ePly )
    local ranks = net.ReadTable()

    AMB.Clans.ChangeRanks( ID, ranks )

end )

local net_hand_over = AMB.Network.AddString( 'amb_clans_hand_over' )
net.Receive( net_hand_over, function( nLen, ePly )

    local CFG = AMB.Clans.Config

    if not AMB.Auth.Check( ePly, '3cl210N', '~p~ попытался передать клан, будучи неавторизованным' ) then return end
    if not AMB.Clans.PlayerIsClan( ePly ) then AMB.Adminus.KickCheater( ePly, '3cl220N', 'Соло ~p~ попытался передать клан' ) return end
    if ( AMB.Clans.PlayerGetAccess( ePly ) < 6 ) then AMB.Adminus.KickCheater( ePly, '2cl230N', '~p~ попытался передать клан, не имея лидерства в нём' ) return end
    -- todo timer 

    local ID = AMB.Clans.PlayerGetClanID( ePly )
    local steamid = net.ReadString()
    if not steamid or not string.StartWith( steamid, 'STEAM_' ) then return end
    if ( AMB.Clans.GetPlayerOfflineClanID( steamid ) ~= ID ) then return end

    AMB.Clans.HandOver( ID, steamid, ePly )
    AMB.UI.Chat.SendMessage( ePly, nil, C.AMB_PURPLE, '[•] ', C.ABS_WHITE, 'Вы передали доступ со-клановцу ', C.AMB_BLUE, AMB.Clans.GetPlayerOfflineGamename( steamid ) )

end )