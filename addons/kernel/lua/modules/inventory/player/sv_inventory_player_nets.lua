local CFG = AMB.Inventory.Config

AMB.Network.AddString( CFG.net_send_inv_client )
function AMB.Inventory.SendInventory( ePly, nSlot )

    net.Start( CFG.net_send_inv_client )
        net.WriteUInt( nSlot, 8 )
        net.WriteTable( ePly:GetItemInv( nSlot ) )
    net.Send( ePly )

end

AMB.Network.AddString( CFG.net_drop_item )
net.Receive( CFG.net_drop_item, function( nLen, ePly )

    if not ePly:IsAuth() then AMB.Adminus.KickCheater( ePly, '3in010N', 'Неавторизованный игрок ~p~ попытался дропнуть предмет из инвентаря на '..tostring( ePly:GetPos() ) ) return end

    local max_slots = AMB.Inventory.Config.max_slots

    local slot = net.ReadUInt( 8 )
    if not slot or ( slot < 1 ) or ( slot > max_slots ) then AMB.Adminus.KickCheater( ePly, '2in020N', 'Игрок ~p~ попытался дропнуть предмет из инвентаря с несуществующим слотом: '..tostring( slot ) ) return end

    local item = ePly:GetItemInv( slot )
    if item.empty then AMB.Adminus.KickCheater( ePly, '3in030N', 'Игрок ~p~ попытался дропнуть пустой предмет из инвентаря' ) return end

    local count = net.ReadUInt( 16 )
    if not count then AMB.Adminus.KickCheater( ePly, '1in040N', 'Игрок ~p~ попытался дропнуть предмет из инвентаря без его количества (max 65535)' ) return end -- todo: сделать на клиенте проверку
    if ( count > item.count ) then AMB.Adminus.KickCheater( ePly, '3in050N', 'Игрок ~p~ попытался дропнуть предмет из инвентаря с количеством выше настоящего ('..count..'>'..item.count..')' ) return end

    ePly:DropItemInv( slot, count )

end )

AMB.Network.AddString( CFG.net_use_item )
net.Receive( CFG.net_use_item, function( nLen, ePly )

    if not ePly:IsAuth() then AMB.Adminus.KickCheater( ePly, '3in060N', 'Неавторизованный игрок ~p~ попытался использовать предмет из инвентаря' ) return end

    local CFG = AMB.Inventory.Config
    local max_slots = AMB.Inventory.Config.max_slots

    local slot = net.ReadUInt( 8 )
    if not slot or ( slot < 1 ) or ( slot > max_slots ) then AMB.Adminus.KickCheater( ePly, '2in070N', 'Игрок ~p~ попытался использовать предмет из инвентаря с несуществующим слотом: '..tostring( slot ) ) return end

    local item = ePly:GetItemInv( slot )
    if item.empty then AMB.Adminus.KickCheater( ePly, '3in080N', 'Игрок ~p~ попытался использовать пустой предмет из инвентаря' ) return end
    if not CFG.objects[ item.class ] or not CFG.objects[ item.class ].use then AMB.Adminus.KickCheater( ePly, '3in090N', 'Игрок ~p~ попытался использовать предмет из инвентаря, который нельзя использовать' ) return end

    ePly:UseItemInv( slot )

end )